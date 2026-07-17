# Actual-role five-point Kalmanson packet audit

Date: 2026-07-16

Status: **KERNEL-CHECKED COMPLETE ANTECEDENT; NOT PRODUCED BY THE LIVE
FRONTIER. NO PRODUCTION `sorry` CLOSES.**

This lane is confined to
`scratch/atail-force/actual-five-point-kalmanson-packet/`. It does not edit
production Lean, closure documents, `CriticalPairFrontier.lean`, or any
protected unique-row/555/654 artifact.

## Exact actual-role assignment

`ActualFivePointKalmansonPacket.lean` fixes the production terminal roles to
the current `CriticalPairFrontier` and its shared critical map:

```text
O = S.oppApex1
A = S.oppApex2
Y = H.centerAt F.pair.q F.pair.q_mem_A
E = F.pair.q
C = S.surplusApex
```

The three selected rows are source-faithful:

```text
Y-row = H.selectedAt E       -- actual source E, actual blocker Y
O-row = H.selectedAt C       -- requires centerAt C = O
A-row = H.selectedAt O       -- requires centerAt O = A
```

Thus the production consumer's six incidences

```text
Y-row: O,E
O-row: E,C
A-row: C,O
```

reduce to three genuinely cross-source incidences:

```text
O in H.selectedAt E
E in H.selectedAt C
C in H.selectedAt O
```

The other three are automatic `q_mem_support` facts for the actual sources
`E`, `C`, and `O`. This is the source-provenance correction missing from the
anonymous fixed-surface row pattern: no independently chosen row is silently
identified with a row of the common `CriticalShellSystem`.

The complete structure

```text
ActualFrontierFivePointKalmansonPacket D S H F
```

also retains:

- one actual injective CCW boundary enumeration of `D.A`;
- the directed order `O < A < Y < E < C`;
- `centerAt C = O` and `centerAt O = A`; and
- the three cross-source incidences above.

The theorem

```text
false_of_actualFrontierFivePointKalmansonPacket
```

constructs the three `SelectedFourClass` values from those exact selected
critical rows and invokes, directly,

```text
Problem97.CapCrossingKalmansonBridge
  .false_of_selected_rows_in_five_ccw_order.
```

## Live-frontier match

The current `CriticalPairFrontier` supplies:

- `E = F.pair.q` and `E in D.A`;
- the actual blocker `Y = H.centerAt E`;
- the exact row `H.selectedAt E`; and
- the automatic source membership `E in H.selectedAt E`.

It does **not** supply the first cross-source incidence

```text
S.oppApex1 in
  (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support.
```

This is the first genuinely missing source-indexed fact in the checked
adapter. The production frontier dichotomy

```text
cross_deletion_survives_or_cross_membership F.pair
```

instead gives either deletion survival at the blocker of `F.pair.q`, or the
different incidence

```text
F.pair.w in H.selectedAt F.pair.q.
```

It does not place the first opposite apex `O` in that row. The full-parent
and successor surfaces inspected in the current R lane also preserve rows
at live/generated sources, but contain no equation identifying one of those
supports with this apex incidence.

Even if this first incidence were proved, the following independent fields
would still remain:

1. the two actual blocker-map edges `centerAt C = O` and `centerAt O = A`;
2. `E in H.selectedAt C` and `C in H.selectedAt O`; and
3. placement of the actual blocker `Y` and source `E` in the directed boundary
   order `O < A < Y < E < C`.

The existing parent-order adapter only handles two already-known strict
first-opposite-cap points. The live frontier does not place its actual blocker
`Y` in that cap, so that adapter does not produce this order.

Consequently the complete five-point packet is an honest checked consumer
boundary, but it is not yet a tractable producer theorem from the current
binders. Mining anonymous five-row support patterns does not establish any of
the missing common-map edges above.

## Bank and corpus preflight

Before constructing the adapter, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

`nthdegree docs search --lean` queries covered five-point cyclic selected-row
contradictions, critical-map cycles, actual blocker rows, and opposite-apex
support incidences. They found the production Kalmanson terminal and the
existing `CriticalPairFrontier` cross-deletion/cross-membership theorems, but
no producer for the apex incidence, the two blocker-map edges, or the complete
actual-role packet.

## Validation

Focused check from `lean/`:

```bash
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/actual-five-point-kalmanson-packet/ActualFivePointKalmansonPacket.lean
```

Result: success. The public adapter reports exactly

```text
[propext, Classical.choice, Quot.sound]
```

as its axiom closure. The module contains no `sorry`, `admit`, custom axiom,
`native_decide`, or unsafe declaration.

## Route consequence

- Complete actual-role five-point Kalmanson consumer: **PROVEN / KERNEL-CHECKED**.
- Construction from the current parent/frontier: **BLOCKED**.
- First missing source-indexed fact:
  `oppApex1_mem_frontierQRow` as displayed above.
- Further independent requirements after that fact: two blocker-map edges,
  two additional cross-incidences, and the directed actual-role order.
- Production `sorry` closed by this lane: **NONE**.

This makes the five-point route precise without upgrading it to coverage. A
future search should target these actual critical-map incidences (or a formal
coverage theorem leading to another checked sink), not the anonymous literal
555/654 support object.
