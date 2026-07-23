# Exact-four robust global-terminal audit

## Status

**No direct `False` theorem or existing-terminal occurrence was obtained.**

The architecture-neutral `B`-minimality escape was tested separately on both
causes of full deletion robustness at the physical second apex:

1. one radius class of cardinality at least five, specialized to the first
   unresolved exact case, cardinality five; and
2. two distinct, support-disjoint exact four-point radius classes.

Both subarms have exact rational QF_LRA models after adding:

- the original exact first-apex class;
- the retained physical second-apex row;
- an actual late-blocker exact row;
- the displayed cyclic order;
- all triangle inequalities;
- all strict Kalmanson inequalities; and
- the strongest direct selected-row consequence of `B`-minimality: some center
  in `B` has a four-row meeting `A \ B`, while that center has no four-point
  radius class contained in `B`.

Therefore the `B`-minimality escape alone does not imply an existing
Kalmanson, two-center, or no-`IsM44` terminal.

When the same finite role set is additionally required to have K4 at every
named center, all three fixtures become UNSAT. This is useful localization
evidence, but it is **not** a source theorem: in the real arbitrary-cardinality
carrier, the missing K4 rows may use unenumerated points. The first missing
global implication is consequently a source-level localization/occurrence
theorem for such an escaping K4 row.

No Lean declaration was retained because the only source-valid intermediate
found here has no immediate existing consumer.

## Source surface

The live input is the `ExactFourPhysicalConsumerOutcome.robust` constructor:

```lean
R : OriginalUniqueFourResidual F
ingress : ExactFourPhysicalCommonDeletionIngress R
secondApex_robust : FullyDeletionRobustAt D S.oppApex2
```

The existing robust-second-apex classification gives exactly the two causes
tested above:

- a physical second-apex radius class of cardinality at least five; or
- two distinct K4 radius classes at the physical second apex.

The audit retains the original exact first-apex class and the physical ingress
row rather than replacing them with arbitrary selected shells.

## Theorem-bank preflight

Before constructing the audit, the required existing-bank checks were run:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and JSON;
- `certificates/erdos97_legacy_general_n_mining.md` and JSON;
- `certificates/erdos_general_theorem_p97_mining.md` and JSON; and
- indexed `nthdegree docs search --lean` searches for the intended
  selected-row, Kalmanson-cycle, two-center, complete-radius, and common
  deletion conclusions.

The closest existing terminal consumers remain:

- `ATailCapCrossingKalmanson.false_of_selected_rows_in_five_ccw_order`;
- `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`;
- the four cases in `ATailTwoCenterBisectorParity`;
- the same-cap/two-center arm of `CriticalFiberClosingCore`; and
- construction of a genuine `SurplusCapPacket` satisfying `IsM44`, contradicting
  the parent no-`IsM44` hypothesis.

The audited escape row does not supply the named cyclic placement, repeated
distance key, second center, or complete alternative support packet required
by any of these consumers.

## The `B`-minimality escape

Let

```text
B =
  original exact first-apex class
  ∪ retained physical second-apex row
  ∪ the three displayed support-triangle vertices.
```

Then `|B| ≤ 11`.

The following is a source-level mathematical audit; it was not retained as a
Lean theorem because its output is nonterminal.

### `B` is proper

The original exact first-apex class has at least two strict hits in the
opposite physical cap. Full robustness at the physical second apex forces its
opposite cap to have cardinality at least five. The surplus cap already has
cardinality at least five. Hence the closed-cap identity gives `|A| ≥ 11`.

If `|A| ≥ 12`, then `|B| ≤ 11` immediately makes `B` proper.

If `|A| = 11`, the cap sizes are forced to be `(5,4,5)`, with strict interiors
of sizes `(3,2,3)`. If `B = A`, the upper cardinality bound is sharp, so the
first-apex class, the retained second-apex row, and the support-triangle
vertices are pairwise disjoint.

The first-apex class consumes both strict points of the four-point cap and,
by endpoint one-hit, one point in each adjacent strict cap. The physical
second-apex row has at least two strict hits in its five-point opposite cap;
disjointness makes these the other two strict points there. Its remaining two
points are not support-triangle vertices and endpoint one-hit forces one into
each adjacent strict cap. One of these would have to lie in the already
exhausted two-point strict interior of the four-point cap, a contradiction.
Thus `B ≠ A`.

Minimality then yields a center in `B` whose K4 witness cannot be contained in
`B`. This is the exact architecture-neutral escape tested below.

### Why it is nonterminal

Minimality guarantees only that a witness row uses at least one point of
`A \ B`. It does not locate that point in a named cap interval, place two named
points in the row, align its radius with a retained row, or identify a second
center. A single anonymous escape point is therefore insufficient for every
currently imported terminal.

## Exact finite regression

The checker is:

```text
scratch/atail-force/unique4-robust-global-terminal/
  audit_b_minimality_escape.py
```

It stores exact rational models and verdicts in `audit.json`.

### Large-class arm: exact five

Both corrected retained-row overlap modes were tested.

| overlap mode | `B` size | points outside `B` | escape center | escape row | local verdict |
|---|---:|---|---:|---|---|
| overlap at most one | 10 | `{10}` | `5` | `{0,1,6,10}` | SAT |
| alternating overlap two | 10 | `{9}` | `2` | `{0,1,3,9}` | SAT |

These are exact QF_LRA models of the stated linear-distance abstraction. They
are not Euclidean coordinate realizations, `CounterexampleData`, complete
critical-shell systems, MEC packets, or models of no-`IsM44`.

### Two-distinct-radii arm

The twelve-role fixture retains:

- original first-apex class `{3,5,6,8}`;
- physical second-apex exact classes `{0,5,9,10}` and `{1,7,8,11}`;
- retained physical row `{1,7,8,11}`;
- actual late-blocker row `{0,2,3,4}`.

Here

```text
B = {0,1,3,4,5,6,7,8,11},
A \ B = {2,9,10},
```

and the exact model realizes the `B`-escape at center `1` with row
`{0,2,3,4}`. The local verdict is SAT.

Thus the large-class and two-distinct-radii robust causes fail for the same
reason: the global escape can remain an anonymous row without producing a
named terminal occurrence.

## Fixed-role global K4 experiment

Requiring every named finite-role center to have a four-point radius class
makes each fixture UNSAT:

| fixture | individually inconsistent named centers | deletion-minimized center core |
|---|---|---|
| exact five, overlap at most one | `{2,3,4,7,8,10}` | `{10}` |
| exact five, alternating overlap two | `{3,4,5,7,8,10}` | `{10}` |
| two distinct radii | `{2,3,5,11}` | `{11}` |

The singleton cores mean that, within each fixed role set, one named center
alone cannot acquire a K4 row compatible with the retained equalities and all
linear convex-distance constraints.

This does **not** lift to arbitrary `A`: the center may use four carrier points
outside the finite role set. The experiment identifies the missing kind of
source information—coverage/localization of those global rows—rather than a
contradiction theorem.

It also agrees with the existing universal-minimality regression: adding
subset-minimality without localizing the resulting global rows does not close
the source branch.

## First missing source-level implication

The next theorem must consume the full robust parent, not only the local row
projection. For the center supplied by `B`-minimality and a genuine global K4
row at that center, it must prove one of the following **existing terminal
antecedents**:

1. the named five-point cyclic selected-row occurrence used by
   `false_of_selected_rows_in_five_ccw_order`, or a directed comparison cycle
   used by `false_of_transGen_cycle`;
2. a repeated pair with two distinct carrier centers in one of the four
   `TwoCenterBisectorParity` placements;
3. the ordered-three-row or same-cap/two-center constructor of
   `CriticalFiberClosingCore`; or
4. a complete alternative `SurplusCapPacket` satisfying `IsM44`.

Equivalently, the missing assertion is not “there exists another K4 row.”
It is:

> every global K4 row escaping the exact-four robust set `B`, or at least one
> source-valid choice of such a row, has enough cap-order / complete-critical-
> fiber / MEC localization to instantiate an already-proved terminal.

The statement must allow its row to use unenumerated members of `A \ B`.
Restricting the row to the current finite roles merely reproduces the
fixed-cardinality UNSAT experiment and would not prove the arbitrary-card
source branch.

The existing complete critical map does not automatically provide this
alignment: its rows are centered at chosen blocker values, while the
minimality escape is a K4 row centered at a member of `B`. No imported theorem
identifies those centers or transports the needed positive incidences.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-robust-global-terminal/audit_b_minimality_escape.py

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-robust-global-terminal/audit_b_minimality_escape.py \
  --check
```

Expected audit SHA-256:

```text
c5f8aba68ccd0711a8f5bdc15a42f1b47f0ccb900863d135351c99cd128627df
```
