import streamlit as st
import pandas as pd

st.set_page_config(
    page_title="FPGA Smart Traffic Controller",
    page_icon="🚦",
    layout="wide"
)

# -----------------------------
# CUSTOM CSS
# -----------------------------
st.markdown("""
<style>
.stApp{
    background-color:#0b1220;
}

.title{
    text-align:center;
    color:#00E5FF;
    font-size:42px;
    font-weight:bold;
}

.card{
    background:#151E30;
    padding:15px;
    border-radius:12px;
    border:1px solid #263550;
}

.metric-label{
    color:#A0AEC0;
    font-size:14px;
}

.metric-value{
    color:white;
    font-size:28px;
    font-weight:bold;
}

.signal{
    width:70px;
    height:70px;
    border-radius:50%;
    margin:auto;
}

.section-title{
    color:#00E5FF;
}
</style>
""", unsafe_allow_html=True)

# -----------------------------
# HEADER
# -----------------------------
st.markdown(
    '<p class="title">🚦 FPGA Smart Traffic Light Controller</p>',
    unsafe_allow_html=True
)

st.markdown("---")

# -----------------------------
# DEMO DATA
# -----------------------------
current_state = "EMERGENCY_GREEN"
timer = 8
pedestrian = "ACTIVE"
emergency = "DETECTED"

# -----------------------------
# KPI CARDS
# -----------------------------
c1,c2,c3,c4 = st.columns(4)

c1.metric("Current State", current_state)
c2.metric("Timer", f"{timer}s")
c3.metric("Pedestrian", pedestrian)
c4.metric("Emergency", emergency)

st.markdown("---")

# ==========================================
# LIVE TRAFFIC SIGNALS
# ==========================================

st.markdown("""
<style>
.signal-box {
    background:#151E30;
    padding:20px;
    border-radius:15px;
    text-align:center;
}

.red-off {
    width:70px;
    height:70px;
    border-radius:50%;
    background:#330000;
    margin:auto;
}

.red-on {
    width:70px;
    height:70px;
    border-radius:50%;
    background:#ff0000;
    box-shadow:0px 0px 25px #ff0000;
    margin:auto;
}

.yellow-off {
    width:70px;
    height:70px;
    border-radius:50%;
    background:#333300;
    margin:auto;
}

.yellow-on {
    width:70px;
    height:70px;
    border-radius:50%;
    background:#ffff00;
    box-shadow:0px 0px 25px #ffff00;
    margin:auto;
}

.green-off {
    width:70px;
    height:70px;
    border-radius:50%;
    background:#003300;
    margin:auto;
}

.green-on {
    width:70px;
    height:70px;
    border-radius:50%;
    background:#00ff00;
    box-shadow:0px 0px 25px #00ff00;
    margin:auto;
}
</style>
""", unsafe_allow_html=True)

st.markdown("## 🚥 Live Traffic Signals")

col1, col2 = st.columns(2)

with col1:
    st.markdown("### North-South Road")

    st.markdown("""
    <div class="signal-box">
        <div class="red-off"></div>
        <br>
        <div class="yellow-off"></div>
        <br>
        <div class="green-on"></div>
    </div>
    """, unsafe_allow_html=True)

with col2:
    st.markdown("### East-West Road")

    st.markdown("""
    <div class="signal-box">
        <div class="red-on"></div>
        <br>
        <div class="yellow-off"></div>
        <br>
        <div class="green-off"></div>
    </div>
    """, unsafe_allow_html=True)
    
# ==========================================
# INTERSECTION VIEW
# ==========================================

st.markdown("## 🛣 Live Intersection")

st.markdown("""
<div style="
background:#151E30;
padding:20px;
border-radius:15px;
">

<pre style="color:white;font-size:18px;">

           🚶

           │
           │

═══════════╬═══════════

           │
           │

</pre>

</div>
""", unsafe_allow_html=True)

st.markdown("---")

# ==========================================
# STATUS PANELS
# ==========================================

st.markdown("## 🚶 Pedestrian & 🚑 Emergency")

a,b = st.columns(2)

with a:
    st.success("Pedestrian Crossing Active")

with b:
    st.error("Emergency Vehicle Detected")
    
# -----------------------------
# FEATURES
# -----------------------------
st.markdown("## ⚙ System Features")

col1,col2 = st.columns(2)

with col1:
    st.success("Pedestrian Crossing Enabled")
    st.success("Emergency Vehicle Priority Enabled")

with col2:
    st.success("ALL_RED Safety State Enabled")
    st.success("FSM Verification Completed")

st.markdown("---")

# -----------------------------
# FSM STATES
# -----------------------------
st.markdown("## 🔄 FSM States")

states = pd.DataFrame({
    "State":[
        "NS_GREEN",
        "NS_YELLOW",
        "ALL_RED_1",
        "PED_WALK",
        "EW_GREEN",
        "EW_YELLOW",
        "ALL_RED_2",
        "EMERGENCY_GREEN"
    ]
})

st.dataframe(
    states,
    use_container_width=True
)

st.markdown("---")

# -----------------------------
# EVENT LOG
# -----------------------------
st.markdown("## 📋 Event Log")

events = pd.read_csv("traffic_data.csv")

st.dataframe(
    events,
    use_container_width=True
)

st.markdown("---")

# -----------------------------
# ANALYTICS
# -----------------------------
import plotly.express as px

state_count = (
    events["State"]
    .value_counts()
    .reset_index()
)

state_count.columns = ["State", "Count"]

fig = px.bar(
    state_count,
    x="State",
    y="Count",
    title="Traffic State Frequency"
)

fig.update_layout(
    paper_bgcolor="#0B1220",
    plot_bgcolor="#151E30",
    font_color="white"
)

fig.update_traces(
    marker_color="#00E5FF"
)

st.plotly_chart(
    fig,
    use_container_width=True
)

# -----------------------------
# TRAFFIC STATISTICS
# -----------------------------
st.markdown("## 📈 Traffic Statistics")

col1, col2, col3, col4 = st.columns(4)

col1.metric(
    "Traffic Cycles",
    len(events)
)

col2.metric(
    "Pedestrian Requests",
    len(events[events["Pedestrian"] == "YES"])
)

col3.metric(
    "Emergency Events",
    len(events[events["Emergency"] == "YES"])
)

col4.metric(
    "Unique States",
    events["State"].nunique()
)

st.markdown("## 🔄 FSM State Flow")

st.code("""
NS_GREEN
↓
NS_YELLOW
↓
ALL_RED_1
↓
PED_WALK
↓
EW_GREEN
↓
EW_YELLOW
↓
ALL_RED_2
↓
NS_GREEN

Emergency:
ANY_STATE
↓
EMERGENCY_GREEN
↓
NS_GREEN
""")

# ==========================================
# VERIFICATION
# ==========================================

st.markdown("## 🔬 GTKWave Verification")

st.image(
    "final_waveform.png",
    use_container_width=True
)

st.success(
    "FSM verified using Icarus Verilog and GTKWave."
)

# -----------------------------
# HEALTH
# -----------------------------
st.markdown("## 🟢 System Health")

st.success("RTL Design Passed")
st.success("Testbench Passed")
st.success("GTKWave Verification Passed")
st.success("Ready for FPGA Deployment")

st.markdown("---")

st.caption(
    "FPGA Smart Traffic Light Controller | SystemVerilog | Icarus Verilog | GTKWave | Streamlit"
)