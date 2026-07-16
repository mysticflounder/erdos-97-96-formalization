# Slot-3 U-lane import: `removableVertexOfLarge_of_nonIsM44` (2026-07-05)

> **Historical record — archived 2026-07-16.** One-time import changelog;
> long superseded by the consolidated parent-route state in
> [`closure-matrix-2026-07-09.md`](../../../closure-matrix-2026-07-09.md) and
> [`atail-force-producer-plan-2026-07-13.md`](../../../atail-force-producer-plan-2026-07-13.md).
> Retained for the import provenance.

## What landed

The non-`IsM44` descent branch of the removable-vertex spine (slot 3 of
`RemovableVertexOfLarge_from_threeWaySplit`) was reduced from a single opaque
`sorry` to two named on-spine residuals, by importing the p97-rvol U-lane
route-B tail into this repo (publish target must be self-contained — no reverse
Lake dep).

- `theorem removableVertexOfLarge_of_nonIsM44 : NonIsM44DescentStatement`
  (`RemovableVertexAxiom.lean`) is now proved by a configuration-level adapter:
  it builds a `CounterexampleData` on the carrier `A`, derives `¬ removable`
  and a `CriticalShellSystem` from minimality, discharges the exact-pair branch
  of the cap-triple split via the `¬ ∃ S, S.IsM44` hypothesis, and closes the
  surplus (non-exact) branch with `u1_largeCap_routeB_tail_false`. This mirrors
  `RVOLSpine.u1ExactnessFromMinimality_holds`'s no-exit payload.

## Copy manifest

- **58 modules** copied `RVOL.P97.* → Erdos9796Proof.P97.*` (blanket
  `RVOL.` → `Erdos9796Proof.` rewrite; decl namespaces `Problem97.*` unchanged).
  This is the exact transitive import closure of
  `RVOL.P97.U1LargeCapRouteBTail`. Breakdown: 39 `U1Depth5*`, 7 `U5*`,
  5 `U2*`, 2 `U3*`, 5 `U1*` (non-Depth5). It does **not** include the
  ~250-file `U5GlobalIncidenceQCritical*` `IsM44` incidence tree.
- **10 shared modules** reused (already in this repo, imported not copied):
  `Foundation`, `Cap.Structure`, `Cap.PartitionFromMEC`,
  `CircumscribedMECPacket`, `Moser.NonDeg`, `N9Endpoint.N4a`, `OangleBridge`,
  `SmallerCounterexample`, `TwoCircleCrossing`, `U2.WitnessReflectionKernel`.
- Collisions: **0 basename**, **0 fully-qualified decl** (13 bare-name overlaps,
  all namespace-disambiguated, e.g. `CounterexampleData.capSum` vs the
  `SurplusCapPacket`-level `capSum`).

## Residuals (the remaining slot-3 open work)

The single slot-3 `sorry` is now the two route-B tail leaves:

1. `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
   (`U1LargeCapRouteBTail.lean:2428`) — the two-large-cap DoubleApex kill; needs
   the per-shadow Nullstellensatz infeasibility certs (target
   `EndpointCertificate.Checker` schema).
2. `Problem97.u1_largeCap_routeB_tail_liveData_false`
   (`U1LargeCapRouteBTail.lean`) — the live-data `False` leaf.

## Verification

- `lake build Erdos9796Proof.P97.RemovableVertexAxiom` — exit 0.
- `#print axioms Problem97.removableVertexOfLarge_of_nonIsM44` — `{propext,
  Classical.choice, Quot.sound, sorryAx}` (correctly reaches sorry).
- `proof-blueprint spine` (after `refs --refresh --force`): anchor `[open]`;
  `erdos97_rhs` progress 782/796 → 928/950; open obligations are the 3 slot-2
  census residuals + the 2 slot-3 residuals above + `sorryAx`.
- `#print axioms Problem97.erdos97_rhs` — `{propext, Classical.choice,
  Quot.sound, Lean.ofReduceBool, Lean.trustCompiler, sorryAx}`. The
  `native_decide` axioms (`ofReduceBool`/`trustCompiler`) were **already** in
  the closure pre-copy via `SurplusCOMPGBank` on the slot-2 path; the copy adds
  more `native_decide`-using files but no new axiom kind. Allowed per the
  project `native_decide` policy.

## Notes

- Copy contents inherit p97-rvol's `native_decide` compliance (verbatim cert
  checkers); not independently re-audited here.
- `proof-blueprint spine` initially showed the anchor `[closed]` from a stale
  incremental mine; `refs --refresh --force` was required to surface the true
  reachability. Kernel `#print axioms` is authoritative.
