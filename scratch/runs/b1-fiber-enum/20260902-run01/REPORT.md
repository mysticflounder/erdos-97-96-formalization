# B1-FIBER bounded abstract incidence enumeration

Status: diagnostic only; no source-to-finite bridge or metric closure is
claimed.  The run fixes `F1={0,1,2,3}`, `T0={2,3}`, `R={4,5,6}`, and takes
`O1,O2` to be two distinct residual labels in `A\\(F1\\cup C)`.  This last
location is an explicit convention because the request does not state an
`O2` location.  Canonicalization preserves `F1`, `T0`, `R`, and the named
`O1,O2` labels.

## Exact class sizes and defects

For each two-subset `T` of `R`, `X_T` contains the physical members assigned
to `T` and residual source labels.  The support has the form
`K_T=T ∪ E_T`, `|E_T|=2`, and row intersections are at most two.  The physical
assignment count vector `q_T=|X_T∩T|` is either `(1,1,1)` (the two orientations
of a 3-cycle) or `(2,1,0)` (the six 2-cycle-plus-tail assignments).

| `|A|` | raw base rows | canonical base orbits | class sizes (up to trace permutation) | capacity defect |
|---:|---:|---:|---|---|
| 12 | 4320 | 136 | `(2,3,3)`; `(3,3,2)`; `(4,2,2)`; `(4,3,1)` | total `1` |
| 13 | 720 | 12 | `(3,3,3)`; `(4,3,2)` | total `0` |

For `n=13`, every `K_T` is exactly `X_T ∪ T`.  For `n=12`, one trace has
one residual source instead of two; its second support slot is a spare label
(possibly one of the two `F1\\T0` labels), giving exactly one total defect.

The canonical blocker-pattern counts, with `b_T` distinct,
`b_T∉K_T`, and `b_T∉{O1,O2}`, are 4976 (`n=12`) and 592 (`n=13`).
At each trace position all three coarse locations occur independently:
`F1`, physical `R`, or another trace class `X_U` (`U≠T`).  A same-trace
location is impossible because `X_T⊆K_T` while `b_T∉K_T`.

## Blocker-map cycles

The induced class map sends `T` to `U` when `b_T∈X_U`, and to a sink `F1`
when `b_T∈F1`.  The only directed-cycle lengths found are:

| `n` | no cycle | a 2-cycle | a 3-cycle |
|---:|---:|---:|---:|
| 12 | 25032 | 4556 | 556 |
| 13 | 3132 | 741 | 115 |

These are assignment totals over the canonical base representatives, not
claims of geometric realizability.  A fixed point cannot occur.  If all
three blockers lie outside `F1`, the finite no-fixed-point map forces either
a 2-cycle or a 3-cycle; with an `F1` blocker, an acyclic map is also possible.

## Shared pairs and Kalmanson status

No `n=13` support pair `K_T,K_U` shares two labels.  At `n=12`, 104 of the
136 canonical base orbits contain a shared pair (the common pair consists of
the one common physical `R` label and a spare/support residual label); 32 do
not.  Example: `K_{45}={4,5,7,8}`, `K_{46}={4,6,8,9}` share `{4,8}`.

There is no cyclic-order or metric premise in this abstract schema.  Hence no
M4-K1/M4-K2 Kalmanson core is forced under every compatible order, and the
metric result for every surviving local cell is **UNKNOWN**.  In particular,
the shared-pair count is an incidence observation, not a Kalmanson
contradiction; rational positive metric controls were not asserted.

The enumeration includes only the stated finite incidence constraints and is
not an exact-five closure or a proof of the B1 branch.
