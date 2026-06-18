# FPGA Smart Traffic Light Controller

## Simulation Report

### Tools Used

- SystemVerilog
- Icarus Verilog 12.0
- GTKWave
- Streamlit Dashboard

---

## Verification Results

| Test Case | Result |
|------------|---------|
| Reset Functionality | PASS |
| NS Green State | PASS |
| NS Yellow State | PASS |
| ALL_RED_1 State | PASS |
| Pedestrian Walk State | PASS |
| EW Green State | PASS |
| EW Yellow State | PASS |
| ALL_RED_2 State | PASS |
| Emergency Override | PASS |
| Recovery After Emergency | PASS |

---

## FSM State Sequence

NS_GREEN
→ NS_YELLOW
→ ALL_RED_1
→ PED_WALK
→ EW_GREEN
→ EW_YELLOW
→ ALL_RED_2
→ NS_GREEN

Emergency Mode:

ANY_STATE
→ EMERGENCY_GREEN
→ NS_GREEN

---

## Conclusion

The FPGA Smart Traffic Light Controller successfully passed all simulation scenarios. State transitions, pedestrian handling, emergency vehicle prioritization, and recovery mechanisms operated correctly according to the FSM design.