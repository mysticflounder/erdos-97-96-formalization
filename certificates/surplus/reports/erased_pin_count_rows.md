# Erased-pin exact-count row census

This generated table records the finite row target for
`IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement`.
It is a census of row ids and count tuples, not a metric certificate.

## Route summary

| route | count | meaning |
|---|---:|---|
| `left-right-subpacket` | 18 | Both adjacent sides are hit; target for the four-point subpacket bridge. |
| `same-side-heavy` | 10 | Only the surplus-side adjacent bucket is hit, with extra adjacent mass. |
| `one-sided-terminal` | 2 | The old one-sided terminal row handled by seeded-shadow payloads. |

## Rows

| id | side | m | s | l | r | supportNeeded | family | route |
|---|---:|---:|---:|---:|---:|---:|---|---|
| `ep_right_m0_s0_l3_r1` | right | 0 | 0 | 3 | 1 | 1 | adjacent-heavy | left-right-subpacket |
| `ep_right_m0_s0_l2_r2` | right | 0 | 0 | 2 | 2 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_right_m0_s0_l1_r3` | right | 0 | 0 | 1 | 3 | 1 | adjacent-heavy | left-right-subpacket |
| `ep_right_m0_s0_l0_r4` | right | 0 | 0 | 0 | 4 | 2 | adjacent-heavy | same-side-heavy |
| `ep_right_m0_s1_l2_r1` | right | 0 | 1 | 2 | 1 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_right_m0_s1_l1_r2` | right | 0 | 1 | 1 | 2 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_right_m0_s1_l0_r3` | right | 0 | 1 | 0 | 3 | 1 | adjacent-heavy | same-side-heavy |
| `ep_right_m1_s0_l2_r1` | right | 1 | 0 | 2 | 1 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_right_m1_s0_l1_r2` | right | 1 | 0 | 1 | 2 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_right_m1_s0_l0_r3` | right | 1 | 0 | 0 | 3 | 1 | adjacent-heavy | same-side-heavy |
| `ep_right_m1_s1_l1_r1` | right | 1 | 1 | 1 | 1 | 0 | terminal-1111 | left-right-subpacket |
| `ep_right_m1_s1_l0_r2` | right | 1 | 1 | 0 | 2 | 0 | adjacent-heavy | same-side-heavy |
| `ep_right_m2_s0_l1_r1` | right | 2 | 0 | 1 | 1 | 0 | moser-pair | left-right-subpacket |
| `ep_right_m2_s0_l0_r2` | right | 2 | 0 | 0 | 2 | 0 | adjacent-heavy | same-side-heavy |
| `ep_right_m2_s1_l0_r1` | right | 2 | 1 | 0 | 1 | 0 | moser-pair | one-sided-terminal |
| `ep_left_m0_s0_l1_r3` | left | 0 | 0 | 1 | 3 | 1 | adjacent-heavy | left-right-subpacket |
| `ep_left_m0_s0_l2_r2` | left | 0 | 0 | 2 | 2 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_left_m0_s0_l3_r1` | left | 0 | 0 | 3 | 1 | 1 | adjacent-heavy | left-right-subpacket |
| `ep_left_m0_s0_l4_r0` | left | 0 | 0 | 4 | 0 | 2 | adjacent-heavy | same-side-heavy |
| `ep_left_m0_s1_l1_r2` | left | 0 | 1 | 1 | 2 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_left_m0_s1_l2_r1` | left | 0 | 1 | 2 | 1 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_left_m0_s1_l3_r0` | left | 0 | 1 | 3 | 0 | 1 | adjacent-heavy | same-side-heavy |
| `ep_left_m1_s0_l1_r2` | left | 1 | 0 | 1 | 2 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_left_m1_s0_l2_r1` | left | 1 | 0 | 2 | 1 | 0 | adjacent-heavy | left-right-subpacket |
| `ep_left_m1_s0_l3_r0` | left | 1 | 0 | 3 | 0 | 1 | adjacent-heavy | same-side-heavy |
| `ep_left_m1_s1_l1_r1` | left | 1 | 1 | 1 | 1 | 0 | terminal-1111 | left-right-subpacket |
| `ep_left_m1_s1_l2_r0` | left | 1 | 1 | 2 | 0 | 0 | adjacent-heavy | same-side-heavy |
| `ep_left_m2_s0_l1_r1` | left | 2 | 0 | 1 | 1 | 0 | moser-pair | left-right-subpacket |
| `ep_left_m2_s0_l2_r0` | left | 2 | 0 | 2 | 0 | 0 | adjacent-heavy | same-side-heavy |
| `ep_left_m2_s1_l1_r0` | left | 2 | 1 | 1 | 0 | 0 | moser-pair | one-sided-terminal |

Right rows: 15
Left rows: 15
Total rows: 30
