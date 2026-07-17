# Kalmanson parent boundary-order adapter

Date: 2026-07-16

Scope: scratch-only audit and kernel validation. No production Lean file,
closure document, proof-blueprint state, or protected census artifact was
changed.

## Result

The boundary-enumeration part is **KERNEL-CHECKED**. The exact named order
needed by the five-point Kalmanson terminal is **NOT DERIVABLE FROM THE
CURRENT PARENT INTERFACE**.

`KalmansonParentOrderAdapter.lean` proves that two distinct points in the
strict interior of the first opposite cap admit one shared injective CCW
boundary enumeration in which

```text
O,A,x,y,C
```

or

```text
O,A,y,x,C
```

occurs cyclically, up to reversing the ambient orientation. Here

```text
O = S.oppApex1
A = S.oppApex2
C = S.surplusApex.
```

The source-facing theorem is

```text
exists_strictFirstOppositeCap_pair_order_dichotomy
```

and its cap-interior core is

```text
exists_firstOppositeInterior_pair_order_dichotomy.
```

The proof uses the existing `SurplusCapPacket` boundary export and global
cap-index interval lemmas. It does not use a census order, a coordinate
model, `PinnedHullOrder`, or an `IsM44` assumption.

This is the strongest honest conclusion from unordered membership of `x`
and `y` in the same open cap chain. Membership does not decide which named
point comes first. Consequently, the adapter does not establish the fixed
terminal order

```text
O < A < Y < E < C.
```

## Existing-bank preflight

Before writing the adapter, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries were run for strict convex
polygon boundary order, `capInteriorByIndex`, `PinnedHullOrder`,
`SurplusCapPacket`, cyclic subsequences, and the five named Kalmanson roles.
The useful current declarations were the source-clean cap/global-index
interfaces already imported by `U1LargeCapRouteBTail`; no banked theorem
supplied the missing named-role extraction.

The relevant existing declarations are:

- `exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices`;
- the four
  `capInteriorByIndex_open_*_of_global_indices` interval lemmas; and
- the apex/index identifications proved locally in this module.

The legacy Radon/diagonal-crossing reserve is not needed for this adapter.
The strict Kalmanson inequalities and terminal consumer have already been
kernel-checked in the sibling `cap-crossing-kalmanson-bridge/` and
`kalmanson-terminal-bank-adapter/` lanes.

## Fixed fourteen-role surface versus live names

The corrected fixed surface in
`robust-all-center-cegar/search.py` uses

```text
HULL_NAMES = O,t1,I,F,A,X,Y,Z,D,J,E,C,G,K
SURPLUS_CAP = {O,t1,I,F,A}
OPP_CAP_1  = {A,X,Y,Z,D,J,E,C}
OPP_CAP_2  = {C,G,K,O}
FIRST_APEX = O
SECOND_APEX = A
Q = E
W = D.
```

That file explicitly fixes only the local `O/A/D/t1` rows; the other rows
are solver choices. The terminal stored survivor happens to choose a row at
`Y` containing `O,E` and has the directed order `O<A<Y<E<C`. This is exact
evidence on the fixed saved surface, not a live extraction theorem.

There is also a load-bearing naming collision:

- `OriginalQOutsideMiddleParentContext.q` is the original live source in the
  surplus cap;
- the finite role `E` corresponds, if anything, to
  `surface.frontier.pair.q`.

Therefore the original parent binder named `q` must not be substituted for
the finite terminal role `E`.

## Binder audit of the live parent

The current source-faithful surface retains

```text
surface.frontier : CriticalPairFrontier ...
```

whose `frontier.pair` is a `SurvivorPairRelocationPacket`. Its two named
points have only

```text
q_mem_marginal
w_mem_marginal
```

in the first-apex exact-radius marginal outside the surplus cap. The packet
does not assert strict first-opposite-cap placement.

The existing cap-cover and other-cap one-hit analysis used by the
terminal-three-point lane implies useful counting information: an
off-surplus first-apex marginal point is in either the strict first opposite
cap or the other opposite cap, and at most one marginal point can occupy that
other cap. It does not imply that the arbitrarily retained
`frontier.pair.q` is the strict-cap point. In the worst permitted split, one
of the two retained survivors is the other-cap hit.

The exact terminal inputs compare as follows:

| Terminal input | Current live source status |
| --- | --- |
| One ambient injective CCW boundary | **DERIVABLE** from `D` and `S` |
| Named `O,A,C` indices | **DERIVABLE** from `S` |
| `E = frontier.pair.q` in strict `oppCap1` | **ABSENT** |
| A named `Y` in strict `oppCap1`, distinct from `E` | **ABSENT** |
| Directed internal order `Y` before `E` | **ABSENT** |
| A selected row at `Y` containing `O,E` | **ABSENT** |
| An `O` row containing `E,C` | **NOT EXPORTED BY THE FRONTIER** |
| An `A` row containing `C,O` | **NOT EXPORTED BY THE FRONTIER** |

The last three rows are the six direct support memberships consumed by
`false_of_selected_rows_in_five_ccw_order`. Global K4 can choose some row at
each center, but it does not force those named points into the chosen row.

`RobustFourCenterPacket` does not repair this gap. It records cross-deletion
survival and inequalities among the two actual blockers and opposite apices;
it has no cap-placement, boundary-order, or terminal selected-row fields.

## Why `PinnedHullOrder` is not the adapter

`exists_rightPinnedHullOrderLabels_of_apex_order` and its left-oriented
sibling require

```text
hM44 : S.IsM44.
```

The live leaf carries

```text
hNoM44 : not (exists S, S.IsM44).
```

Thus those label packages are inapplicable source-faithfully on this branch.
The new theorem deliberately uses the lower-level boundary and cap-interval
exports, which need no `IsM44` hypothesis.

## First gap and smallest complete producer packet

The first missing binder for the fixed role assignment is

```text
surface.frontier.pair.q in
  parent.leafPacket.capInteriorByIndex parent.leafPacket.oppIndex1.
```

Equivalently, a producer could supply strict-set membership in

```text
parent.leafPacket.oppCap1 \
  (parent.leafPacket.surplusCap union parent.leafPacket.oppCap2).
```

That fact alone is not enough to close the Kalmanson terminal. The smallest
complete load-bearing packet must additionally retain a second named point
and the three source-exact selected rows. Schematically:

```text
structure OrderedFirstOppositePairRows where
  E : R2
  E_eq_frontier_q : E = surface.frontier.pair.q
  E_mem_firstOppInterior : E in firstOppInterior
  Y : R2
  Y_mem_firstOppInterior : Y in firstOppInterior
  Y_ne_E : Y != E
  Y_before_E : cyclic order O,A,Y,E,C
  YRow : SelectedFourClass carrier Y radiusY
  ORow : SelectedFourClass carrier O radiusO
  ARow : SelectedFourClass carrier A radiusA
  O_mem_YRow : O in YRow.support
  E_mem_YRow : E in YRow.support
  E_mem_ORow : E in ORow.support
  C_mem_ORow : C in ORow.support
  C_mem_ARow : C in ARow.support
  O_mem_ARow : O in ARow.support
```

A `BoundaryIndexing` field should not be added to this producer: the checked
adapter constructs it. If a producer supplies only the two cap memberships
and distinctness, the honest output is the two-arm order dichotomy. Because
the row roles `Y` and `E` are asymmetric, one cannot select the desired arm
by silently swapping their names. Either the producer must force the
directed order, or a second consumer must close the reversed internal-order
arm from source-valid row data.

## Consequence for the route

The Kalmanson geometric bridge and fixed-surface consumer remain valid. This
audit closes the generic cap-to-global-boundary bookkeeping, but it also
shows that the current parent does not instantiate the five-role terminal.
The next mathematical target is not another boundary-index theorem. It is a
source-indexed producer for the named `E/Y` placement and the three selected
row incidences, or a different Kalmanson consumer whose antecedent is already
present on `CriticalPairFrontier`.

No production `sorry` closes from this adapter alone.

## Validation

Focused check from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/kalmanson-parent-order-adapter/KalmansonParentOrderAdapter.lean
```

Result: success. Every displayed theorem reports exactly

```text
[propext, Classical.choice, Quot.sound]
```

as its axiom closure. The module contains no `sorry`, `admit`,
`native_decide`, unsafe declaration, or custom axiom.
