# Erased-pin producer census

This generated report enumerates the finite ten-label selected-class
masks required by each erased-pin exact-count row. It is a producer
target census, not a metric certificate.

## Summary

- rows: 30
- finite ten-label rows: 26
- blocked finite rows: 4
- structurally closed pair-overflow rows: 2
- rows needing a surplus-extra bridge: 2
- proof-facing rows after structural closure: 28
- proof-facing finite ten-label rows: 26
- proof-facing surplus-extra rows: 2
- collapsed finite signatures: 13
- generated Lean row seed lists: 26
- generated Lean signature seed lists: 13
- route counts: `{'left-right-subpacket': 18, 'one-sided-terminal': 2, 'same-side-heavy': 10}`
- finite rows by route: `{'left-right-subpacket': 16, 'one-sided-terminal': 2, 'same-side-heavy': 8}`
- blocked rows by reason: `{'other_adjacent_count_exceeds_pair': 2, 'surplus_count_exceeds_three_subpacket': 2}`
- blocked rows by route and reason: `{'left-right-subpacket:other_adjacent_count_exceeds_pair': 2, 'same-side-heavy:surplus_count_exceeds_three_subpacket': 2}`
- finite masks: 660
- finite masks passing local candidate predicate: 660
- finite masks locally excluded: 0
- finite rows with all masks locally excluded: 0
- finite rows with some masks locally excluded: 0
- finite rows with no masks locally excluded: 26
- finite masks failing private-v cross-separation: 72
- finite masks failing private-w cross-separation: 324
- finite rows with all masks failing private-v cross-separation: 0
- finite rows with all masks failing private-w cross-separation: 8
- seeded DFS computed: True
- finite distinct fixed seeds: 330
- finite distinct seeds with zero DFS completions: 330
- finite distinct seeds with positive DFS completions: 0
- finite named masks with zero DFS completions: 660
- finite named masks with positive DFS completions: 0
- finite rows with all masks DFS-zero: 26
- finite rows with some masks DFS-zero: 0
- finite rows with no masks DFS-zero: 0
- finite masks with pinned-bank completions: 54
- finite masks without pinned-bank completions: 606
- total pinned-bank completions over finite masks: 196
- finite rows with all masks pinned-bank covered: 0
- finite rows with some masks pinned-bank covered: 10
- finite rows with no masks pinned-bank covered: 16

## Rows

| id | route | counts | oriented counts | finite masks | local-ok masks | private-v false | private-w false | DFS-zero masks | bank-covered masks | blocker | signatures |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---|---|
| `ep_right_m0_s0_l3_r1` | `left-right-subpacket` | (0,0,3,1) | (0,0,3,1) | 0 | 0 | 0 | 0 | 0 | 0 | `other_adjacent_count_exceeds_pair` | `` |
| `ep_right_m0_s0_l2_r2` | `left-right-subpacket` | (0,0,2,2) | (0,0,2,2) | 12 | 12 | 0 | 12 | 12 | 0 | `` | `M0|S0|O2|X2` |
| `ep_right_m0_s0_l1_r3` | `left-right-subpacket` | (0,0,1,3) | (0,0,1,3) | 12 | 12 | 0 | 0 | 12 | 0 | `` | `M0|S0|O1|X3` |
| `ep_right_m0_s0_l0_r4` | `same-side-heavy` | (0,0,0,4) | (0,0,0,4) | 0 | 0 | 0 | 0 | 0 | 0 | `surplus_count_exceeds_three_subpacket` | `` |
| `ep_right_m0_s1_l2_r1` | `left-right-subpacket` | (0,1,2,1) | (0,1,2,1) | 6 | 6 | 0 | 6 | 6 | 0 | `` | `M0|S1|O2|X1` |
| `ep_right_m0_s1_l1_r2` | `left-right-subpacket` | (0,1,1,2) | (0,1,1,2) | 24 | 24 | 0 | 0 | 24 | 0 | `` | `M0|S1|O1|X2` |
| `ep_right_m0_s1_l0_r3` | `same-side-heavy` | (0,1,0,3) | (0,1,0,3) | 6 | 6 | 0 | 0 | 6 | 0 | `` | `M0|S1|O0|X3` |
| `ep_right_m1_s0_l2_r1` | `left-right-subpacket` | (1,0,2,1) | (1,0,2,1) | 18 | 18 | 0 | 18 | 18 | 0 | `` | `M1|S0|O2|X1` |
| `ep_right_m1_s0_l1_r2` | `left-right-subpacket` | (1,0,1,2) | (1,0,1,2) | 72 | 72 | 0 | 48 | 72 | 4 | `` | `M1|S0|O1|X2` |
| `ep_right_m1_s0_l0_r3` | `same-side-heavy` | (1,0,0,3) | (1,0,0,3) | 18 | 18 | 0 | 0 | 18 | 0 | `` | `M1|S0|O0|X3` |
| `ep_right_m1_s1_l1_r1` | `left-right-subpacket` | (1,1,1,1) | (1,1,1,1) | 36 | 36 | 12 | 24 | 36 | 1 | `` | `M1|S1|O1|X1` |
| `ep_right_m1_s1_l0_r2` | `same-side-heavy` | (1,1,0,2) | (1,1,0,2) | 36 | 36 | 12 | 0 | 36 | 8 | `` | `M1|S1|O0|X2` |
| `ep_right_m2_s0_l1_r1` | `left-right-subpacket` | (2,0,1,1) | (2,0,1,1) | 36 | 36 | 0 | 36 | 36 | 0 | `` | `M2|S0|O1|X1` |
| `ep_right_m2_s0_l0_r2` | `same-side-heavy` | (2,0,0,2) | (2,0,0,2) | 36 | 36 | 0 | 12 | 36 | 11 | `` | `M2|S0|O0|X2` |
| `ep_right_m2_s1_l0_r1` | `one-sided-terminal` | (2,1,0,1) | (2,1,0,1) | 18 | 18 | 12 | 6 | 18 | 3 | `` | `M2|S1|O0|X1` |
| `ep_left_m0_s0_l1_r3` | `left-right-subpacket` | (0,0,1,3) | (0,0,3,1) | 0 | 0 | 0 | 0 | 0 | 0 | `other_adjacent_count_exceeds_pair` | `` |
| `ep_left_m0_s0_l2_r2` | `left-right-subpacket` | (0,0,2,2) | (0,0,2,2) | 12 | 12 | 0 | 12 | 12 | 0 | `` | `M0|S0|O2|X2` |
| `ep_left_m0_s0_l3_r1` | `left-right-subpacket` | (0,0,3,1) | (0,0,1,3) | 12 | 12 | 0 | 0 | 12 | 0 | `` | `M0|S0|O1|X3` |
| `ep_left_m0_s0_l4_r0` | `same-side-heavy` | (0,0,4,0) | (0,0,0,4) | 0 | 0 | 0 | 0 | 0 | 0 | `surplus_count_exceeds_three_subpacket` | `` |
| `ep_left_m0_s1_l1_r2` | `left-right-subpacket` | (0,1,1,2) | (0,1,2,1) | 6 | 6 | 0 | 6 | 6 | 0 | `` | `M0|S1|O2|X1` |
| `ep_left_m0_s1_l2_r1` | `left-right-subpacket` | (0,1,2,1) | (0,1,1,2) | 24 | 24 | 0 | 0 | 24 | 0 | `` | `M0|S1|O1|X2` |
| `ep_left_m0_s1_l3_r0` | `same-side-heavy` | (0,1,3,0) | (0,1,0,3) | 6 | 6 | 0 | 0 | 6 | 0 | `` | `M0|S1|O0|X3` |
| `ep_left_m1_s0_l1_r2` | `left-right-subpacket` | (1,0,1,2) | (1,0,2,1) | 18 | 18 | 0 | 18 | 18 | 0 | `` | `M1|S0|O2|X1` |
| `ep_left_m1_s0_l2_r1` | `left-right-subpacket` | (1,0,2,1) | (1,0,1,2) | 72 | 72 | 0 | 48 | 72 | 4 | `` | `M1|S0|O1|X2` |
| `ep_left_m1_s0_l3_r0` | `same-side-heavy` | (1,0,3,0) | (1,0,0,3) | 18 | 18 | 0 | 0 | 18 | 0 | `` | `M1|S0|O0|X3` |
| `ep_left_m1_s1_l1_r1` | `left-right-subpacket` | (1,1,1,1) | (1,1,1,1) | 36 | 36 | 12 | 24 | 36 | 1 | `` | `M1|S1|O1|X1` |
| `ep_left_m1_s1_l2_r0` | `same-side-heavy` | (1,1,2,0) | (1,1,0,2) | 36 | 36 | 12 | 0 | 36 | 8 | `` | `M1|S1|O0|X2` |
| `ep_left_m2_s0_l1_r1` | `left-right-subpacket` | (2,0,1,1) | (2,0,1,1) | 36 | 36 | 0 | 36 | 36 | 0 | `` | `M2|S0|O1|X1` |
| `ep_left_m2_s0_l2_r0` | `same-side-heavy` | (2,0,2,0) | (2,0,0,2) | 36 | 36 | 0 | 12 | 36 | 11 | `` | `M2|S0|O0|X2` |
| `ep_left_m2_s1_l1_r0` | `one-sided-terminal` | (2,1,1,0) | (2,1,0,1) | 18 | 18 | 12 | 6 | 18 | 3 | `` | `M2|S1|O0|X1` |

## Collapsed Signatures

- `M0|S0|O1|X3`: `ep_left_m0_s0_l3_r1`, `ep_right_m0_s0_l1_r3`
- `M0|S0|O2|X2`: `ep_left_m0_s0_l2_r2`, `ep_right_m0_s0_l2_r2`
- `M0|S1|O0|X3`: `ep_left_m0_s1_l3_r0`, `ep_right_m0_s1_l0_r3`
- `M0|S1|O1|X2`: `ep_left_m0_s1_l2_r1`, `ep_right_m0_s1_l1_r2`
- `M0|S1|O2|X1`: `ep_left_m0_s1_l1_r2`, `ep_right_m0_s1_l2_r1`
- `M1|S0|O0|X3`: `ep_left_m1_s0_l3_r0`, `ep_right_m1_s0_l0_r3`
- `M1|S0|O1|X2`: `ep_left_m1_s0_l2_r1`, `ep_right_m1_s0_l1_r2`
- `M1|S0|O2|X1`: `ep_left_m1_s0_l1_r2`, `ep_right_m1_s0_l2_r1`
- `M1|S1|O0|X2`: `ep_left_m1_s1_l2_r0`, `ep_right_m1_s1_l0_r2`
- `M1|S1|O1|X1`: `ep_left_m1_s1_l1_r1`, `ep_right_m1_s1_l1_r1`
- `M2|S0|O0|X2`: `ep_left_m2_s0_l2_r0`, `ep_right_m2_s0_l0_r2`
- `M2|S0|O1|X1`: `ep_left_m2_s0_l1_r1`, `ep_right_m2_s0_l1_r1`
- `M2|S1|O0|X1`: `ep_left_m2_s1_l1_r0`, `ep_right_m2_s1_l0_r1`
