# GTKWave Waveform Analysis

## Signals Verified

- clk
- rst
- current_state
- next_state
- timer_count
- ped_button
- emergency
- NS_G
- NS_Y
- NS_R
- EW_G
- EW_Y
- EW_R

---

## Verification Summary

### Reset

System correctly initialized into NS_GREEN state.

### Pedestrian Request

Pedestrian button press successfully redirected FSM through:

ALL_RED_1
→ PED_WALK

### Emergency Override

Emergency signal forced controller into:

EMERGENCY_GREEN

After emergency clearance:

EMERGENCY_GREEN
→ NS_GREEN

### Traffic Signal Outputs

North-South and East-West lights maintained mutual exclusion throughout simulation.

No unsafe simultaneous green conditions were observed.

---

## Result

PASS