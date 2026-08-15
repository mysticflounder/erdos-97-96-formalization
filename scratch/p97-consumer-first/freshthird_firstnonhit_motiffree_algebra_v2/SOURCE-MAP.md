# Exact source and label map

## Source-fidelity correction for `common_sameblocker`

The raw table below is an exact record of the solver readback, but it is not a
source-admissible equality-class assignment.

- `q0,q1,q2,q3` are named points of the exact Q support and hence actual carrier
  points; every carrier point can be used as a `CriticalShellSystem.CarrierVertex`.
- `first` and `second` are the actual carrier vertices
  `TwoCapSourceThirdCanonicalRowSurface.firstSource/secondSource`, with
  `sources_ne : firstSource.1 ≠ secondSource.1`.
- The common/same-blocker arm identifies the `q0`, `q1`, `first`, and `second`
  selected supports and blocker center. The raw readback additionally chooses
  `b2` equal to that blocker.
- Because `mem(center,point)` is extensional, the six true cells
  `M_q0__S_q0`, `M_q0__S_q1`, `M_q0__S_q2`, `M_q0__S_q3`,
  `M_q0__S_first`, and `M_q0__S_second` are genuinely claims that six named
  labels lie in the same `selectedAt` support.

The raw readback gives the six source values `7,8,6,5,23,24`, all distinct,
and gives blocker value `0` to the five source values `7,8,6,23,24`.  Under the
intended equality-class semantics this contradicts both proved source facts:

1. `ATailSurvivalCover.actualBlockerFiber_card_le_four`: an actual blocker has
   at most four distinct carrier sources;
2. `CriticalFourShell.support_card`: every exact selected support has card four.

The source does **not** prove that `first` and `second` are fresh from all four
Q-support labels. They must alias two Q roles in this arm. The malformed source
gate omitted that forced aliasing/cardinality consequence and treated arbitrary
model-chosen integer disequalities as admissible carrier equality classes.

The minimal correction adds `first ≠ second`, the targeted actual-fiber
at-most-four cut, and all six five-subset instances of the exact-support
at-most-four cut. Z3 and cvc5 both return SAT on the corrected base. Z3 chooses
`first=q2`, `second=q3`, and moves `b2` off the common blocker; cvc5 chooses
`first=q1`, `second=q0`, and also moves `b2` off the common blocker. Both engines
return UNSAT on the distinct six-point/five-source contradiction control and
SAT on the legal-alias control. See `source_fidelity_audit/AUDIT.json`.

Accordingly, the `common_sameblocker` algebra output is only a raw computation
on a malformed packet; it has no source-faithful P97 verdict.

Each `M_<row>__<point>` cell is copied from one authenticated terminal
readback. `S_r` denotes source term `v_r`; `B_r` denotes its actual blocker
term (`b0`…`b3` or `blk_r`). Integer values are opaque terminal equality-class
names. Equal values share one coordinate pair. No integer ordering is used.

The ideal for a row contains `d(center,p)-d(center,reference)=0` for every
other distinct positively selected named point class in that row. Negative cells
are deliberately omitted, so this is the exact equality translation of the finite
positive table and an equality superset of the intended Euclidean geometry.

## `common`

| row | source term/class | center term/class | selected labels | selected classes | equations |
|---|---|---|---|---|---:|
| `q0` | `v_q0=7` / `p3` | `b0=0` / `p0` | `S_q0, S_q1, S_q2, S_q3` | `p2, p3, p4, p5` | 3 |
| `q1` | `v_q1=6` / `p2` | `b1=0` / `p0` | `S_q0, S_q1, S_q2, S_q3` | `p2, p3, p4, p5` | 3 |
| `q2` | `v_q2=9` / `p5` | `b2=13` / `p7` | `S_q0, S_q2` | `p3, p5` | 1 |
| `q3` | `v_q3=8` / `p4` | `b3=14` / `p8` | `S_q1, S_q3` | `p2, p4` | 1 |
| `first` | `v_first=19` / `p9` | `blk_first=5` / `p1` | `S_q3, S_first` | `p4, p9` | 1 |
| `second` | `v_second=20` / `p10` | `blk_second=10` / `p6` | `S_q1, S_second` | `p2, p10` | 1 |

Point-class aliases:

- `p0` = terminal class `0`: B_q0→b0, B_q1→b1.
- `p1` = terminal class `5`: B_first→blk_first.
- `p2` = terminal class `6`: S_q1→v_q1.
- `p3` = terminal class `7`: S_q0→v_q0.
- `p4` = terminal class `8`: S_q3→v_q3.
- `p5` = terminal class `9`: S_q2→v_q2.
- `p6` = terminal class `10`: B_second→blk_second.
- `p7` = terminal class `13`: B_q2→b2.
- `p8` = terminal class `14`: B_q3→b3.
- `p9` = terminal class `19`: S_first→v_first.
- `p10` = terminal class `20`: S_second→v_second.

Gauge: `S_q0`/`p3` is `(0,0)` and `S_q1`/`p2` is `(1,0)`.

## `common_sameblocker`

| row | source term/class | center term/class | selected labels | selected classes | equations |
|---|---|---|---|---|---:|
| `q0` | `v_q0=7` / `p3` | `b0=0` / `p0` | `S_q0, S_q1, S_q2, S_q3, S_first, S_second` | `p1, p2, p3, p4, p14, p15` | 5 |
| `q1` | `v_q1=8` / `p4` | `b1=0` / `p0` | `S_q0, S_q1, S_q2, S_q3, S_first, S_second` | `p1, p2, p3, p4, p14, p15` | 5 |
| `q2` | `v_q2=6` / `p2` | `b2=0` / `p0` | `S_q0, S_q1, S_q2, S_q3, S_first, S_second` | `p1, p2, p3, p4, p14, p15` | 5 |
| `q3` | `v_q3=5` / `p1` | `b3=9` / `p5` | `S_q3` | `p1` | 0 |
| `first` | `v_first=23` / `p14` | `blk_first=0` / `p0` | `S_q0, S_q1, S_q2, S_q3, S_first, S_second` | `p1, p2, p3, p4, p14, p15` | 5 |
| `second` | `v_second=24` / `p15` | `blk_second=0` / `p0` | `S_q0, S_q1, S_q2, S_q3, S_first, S_second` | `p1, p2, p3, p4, p14, p15` | 5 |
| `w0` | `v_w0=19` / `p10` | `blk_w0=15` / `p6` | `S_q2, S_q3, S_w0` | `p1, p2, p10` | 2 |
| `w1` | `v_w1=20` / `p11` | `blk_w1=16` / `p7` | `S_q0, S_q1, S_w1` | `p3, p4, p11` | 2 |
| `w2` | `v_w2=21` / `p12` | `blk_w2=17` / `p8` | `S_q0, S_q3, S_w2` | `p1, p3, p12` | 2 |
| `w3` | `v_w3=22` / `p13` | `blk_w3=18` / `p9` | `S_q0, S_q1, S_w3` | `p3, p4, p13` | 2 |

Point-class aliases:

- `p0` = terminal class `0`: B_q0→b0, B_q1→b1, B_q2→b2, B_first→blk_first, B_second→blk_second.
- `p1` = terminal class `5`: S_q3→v_q3.
- `p2` = terminal class `6`: S_q2→v_q2.
- `p3` = terminal class `7`: S_q0→v_q0.
- `p4` = terminal class `8`: S_q1→v_q1.
- `p5` = terminal class `9`: B_q3→b3.
- `p6` = terminal class `15`: B_w0→blk_w0.
- `p7` = terminal class `16`: B_w1→blk_w1.
- `p8` = terminal class `17`: B_w2→blk_w2.
- `p9` = terminal class `18`: B_w3→blk_w3.
- `p10` = terminal class `19`: S_w0→v_w0.
- `p11` = terminal class `20`: S_w1→v_w1.
- `p12` = terminal class `21`: S_w2→v_w2.
- `p13` = terminal class `22`: S_w3→v_w3.
- `p14` = terminal class `23`: S_first→v_first.
- `p15` = terminal class `24`: S_second→v_second.

Gauge: `S_q0`/`p3` is `(0,0)` and `S_q1`/`p4` is `(1,0)`.

## `retained`

| row | source term/class | center term/class | selected labels | selected classes | equations |
|---|---|---|---|---|---:|
| `q0` | `v_q0=7` / `p3` | `b0=0` / `p0` | `S_q0, S_q1, S_q2, S_q3` | `p2, p3, p4, p5` | 3 |
| `q1` | `v_q1=8` / `p4` | `b1=0` / `p0` | `S_q0, S_q1, S_q2, S_q3` | `p2, p3, p4, p5` | 3 |
| `q2` | `v_q2=9` / `p5` | `b2=13` / `p7` | `S_q1, S_q2` | `p4, p5` | 1 |
| `q3` | `v_q3=6` / `p2` | `b3=14` / `p8` | `S_q0, S_q3` | `p2, p3` | 1 |
| `first` | `v_first=21` / `p11` | `blk_first=5` / `p1` | `S_first` | `p11` | 0 |
| `second` | `v_second=22` / `p12` | `blk_second=10` / `p6` | `S_q2, S_q3, S_second` | `p2, p5, p12` | 2 |
| `retz` | `v_retz=23` / `p13` | `blk_retz=19` / `p9` | `S_q0, S_q3, S_retz` | `p2, p3, p13` | 2 |
| `retw` | `v_retw=24` / `p14` | `blk_retw=20` / `p10` | `S_q1, S_q3, S_retw` | `p2, p4, p14` | 2 |

Point-class aliases:

- `p0` = terminal class `0`: B_q0→b0, B_q1→b1.
- `p1` = terminal class `5`: B_first→blk_first.
- `p2` = terminal class `6`: S_q3→v_q3.
- `p3` = terminal class `7`: S_q0→v_q0.
- `p4` = terminal class `8`: S_q1→v_q1.
- `p5` = terminal class `9`: S_q2→v_q2.
- `p6` = terminal class `10`: B_second→blk_second.
- `p7` = terminal class `13`: B_q2→b2.
- `p8` = terminal class `14`: B_q3→b3.
- `p9` = terminal class `19`: B_retz→blk_retz.
- `p10` = terminal class `20`: B_retw→blk_retw.
- `p11` = terminal class `21`: S_first→v_first.
- `p12` = terminal class `22`: S_second→v_second.
- `p13` = terminal class `23`: S_retz→v_retz.
- `p14` = terminal class `24`: S_retw→v_retw.

Gauge: `S_q0`/`p3` is `(0,0)` and `S_q1`/`p4` is `(1,0)`.

## Omitted P97 hypotheses

- all false membership cells as geometric off-circle disequalities.
- support exhaustion and exact critical-four-shell support cardinality.
- unnamed carrier points, unnamed selected-support points, and ambient carrier coverage.
- all pairwise-distinctness and blockerVertex_ne inequalities except the q0/q1 gauge premise.
- positive radii, nonzero squared distances, and real-feasibility conditions.
- boundary/cyclic order, convexity, orientation, and Kalmanson/order inequalities.
- the predecessor metric matrix and every unselected distance relation.
- FirstNonHit constructor tags, deletion-fan, blocker-fiber, repeated-cap, retained, and common-helper clauses.
- q_boundary, q_nonrobust, cap-location data, and motif non-embedding as algebraic constraints.
- universal ingress, coverage, general-cardinality lift, and any Lean consumer.

For a source-faithful fixed positive table, UNIT can rule out a real realization,
while NONUNIT establishes only complex nonemptiness of the gauge equality ideal.
The raw `common_sameblocker` table is excluded by the correction above.
