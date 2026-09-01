# Rigid221 S0 coupled-two-row source-constraint manifest

**Lane:** `rigid221-s0-coupled-two-row-residue-lantern-20260831`
**Base HEAD:** `f26de746bc16d15d891c42ad8cfb42876a63ab06`
**Source state:** traced against the live worktree before computation
**Claim state:** source map only; no solver, Lean-proof, or promotion claim

This manifest separates the generic open terminal from the stronger singleton
caller that supplies the intended S0 residual. `DIRECT` means a field or theorem
hypothesis in the cited source. `DERIVED` means a finite consequence whose proof
is indicated below. `CELL` is an exhaustive local split. `EXPERIMENTAL` is a
search restriction and cannot support a source-level impossibility claim.

## 1. Canonical roles

```text
A      := D.A
O      := S.oppApex2
C      := SelectedClass A O rho
u      := contextual source in S0
xu     := the other point of Ku ∩ C
v      := opposite rigid source
xv     := the other point of Kv ∩ C
delta  := jointDeletion.deleted.1
cu     := (lateFirstApexSystem R).centerAt u.1 u.2
cv     := (lateFirstApexSystem R).centerAt v.1 v.2
Ku     := support ((lateFirstApexSystem R).selectedAt u.1 u.2)
Kv     := support ((lateFirstApexSystem R).selectedAt v.1 v.2)
J      := S.capInteriorByIndex S.oppIndex2
```

The physical deletion role `delta` and the global deletion set are distinct.
In the singleton caller the latter is exactly `{u.1}`.

## 2. Declaration index

| Declaration | Current source anchor | Status |
|---|---|---|
| `ExactFourMutualOmissionRigid221GlobalDeletion` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:52-86` | packet type |
| `exactFourMutualOmissionRigid221_globalDeletion` | same file, `:91-165` | PROVEN constructor |
| `exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class` | same file, `:440-539` | PROVEN singleton producer |
| `false_of_exactFourMutualOmissionRigid221_minimalCore` | same file, `:543-584` | SKETCH — body is `sorry` |
| `ExactFourMutualOmissionJointDeletion` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/JointDeletion/Types.lean:42-69` | packet type |
| `ExactFourMutualOmissionSourceContext` | same file, `:75-121` | packet type |
| `CriticalFourShell` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:638-652` | exact ambient four-fiber |
| `CriticalShellSystem` and projections | same file, `:1116-1145` | actual selected-row system |
| `cross_deletion_survives_iff_not_mem_selected_support` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:781-785` | PROVEN survival/support bridge |
| `SelectedClass` | `lean/Erdos9796Proof/P97/WitnessPacketInterface.lean:59-65` | exact ambient distance fiber |
| `CounterexampleData` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:83-93` | ambient carrier packet |
| `SurplusCapPacket` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332-354` | MEC/cap packet |
| `OnArcOpposite` | `lean/Erdos9796Proof/P97/Foundation.lean:83-87` | exact closed-cap predicate |

## 3. Constraint ledger

| ID | Lean field/theorem | Exact mathematical statement | Layer | Encoded? |
|---|---|---|---|---|
| A-01 | `CounterexampleData.A`, `.nonempty` | `A` is a finite nonempty carrier. | generic | planned |
| A-02 | `CounterexampleData.convex` | Every point of `A` is outside the convex hull of the others. A finite witness may certify this by a complete strict all-edge half-plane check for an injective cyclic enumeration of all of `A`. | L1 | planned |
| A-03 | `CounterexampleData.K4` | Every carrier center has some positive-radius four-point distance fiber in `A`. | L4; singleton restore uses it | omitted at L1 |
| A-04 | `SurplusCapPacket` | A non-obtuse circumscribed Moser triangle lies on a closed enclosing disk; its exact cap triple partitions every non-Moser carrier point into one `OnArcOpposite` cap; one indexed cap has cardinality greater than four. | L1 | planned |
| A-05 | `oppApex2`, `oppIndex2`, `capInteriorByIndex` | `O` is the second opposite Moser apex and `J` is the corresponding closed cap with its two Moser endpoints erased. | L1 | planned |
| T-01 | target `_hcard` | `12 ≤ |A|`. | generic terminal | automatic in any 12+-role closed model |
| T-02 | target `surface` | The complete `ExactFourPostCardElevenRobustSurface R` is available. | generic terminal | omitted at L1; named consequences only at L3 |
| T-03 | target `_hrho` | `rho > 0`. | generic/L1 | planned |
| T-04 | target `_hclassFive` | `|C| = 5`. The weaker `_hfive : 5 ≤ |C|` is redundant here. | generic/L1 | planned |
| T-05 | target `_huClass`, `_hvClass` | Exactly `u ∈ C` and `v ∈ C`. | generic/L1 | planned |
| T-06 | target `_hvOmitted`, `_huOmitted` | `v ∉ Ku` and `u ∉ Kv`. | generic/L1 | planned |
| R-01 | `CriticalFourShell.radius_pos`, `support_eq`, `support_card`, `q_mem_support` | Each actual row is the complete positive-radius fiber in all of `A`, has exactly four points, and contains its source. | L1 | planned |
| R-02 | `CriticalFourShell.center_mem` | `cu ∈ A.erase u` and `cv ∈ A.erase v`; in particular each center is in `A` and outside its own support. | L1 | planned |
| R-03 | `CriticalShellSystem.no_qfree_at` | No positive squared-distance fiber in `A.erase u` about `cu`, or in `A.erase v` about `cv`, has four points. | L1 | planned |
| J-01 | `jointDeletion.deleted_mem_class` | `delta ∈ C`. | L1 | planned |
| J-02 | `.deleted_ne_u`, `.deleted_ne_v` | `delta ≠ u` and `delta ≠ v`. | L1 | planned |
| J-03 | `.deleted_not_mem_uRow`, `.deleted_not_mem_vRow` | `delta ∉ Ku` and `delta ∉ Kv`. | L1 | planned |
| J-04 | `.blockers_ne` | `cu ≠ cv`. | L1 | planned |
| J-05 | `.uPacket`, `.vPacket` | Both full `CommonDeletionTwoCenterPacket`s at `delta`, relating the actual blocker and `O`. | L3 | omitted at L1 |
| G-01 | `globalDeletion.rigid` | With `Iu := Ku ∩ C` and `Iv := Kv ∩ C`, `|Iu|=|Iv|=2`, the traces are disjoint, and `C={delta}∪Iu∪Iv`. | L1 | planned |
| G-02 | singleton theorem conclusion | `globalDeletion.center=cu`, `globalDeletion.deleted={u}`, `cu≠O`, and a singleton `MinimalDeletionCore` exists. | stronger S0 caller | planned at L1 for center/deletion identities; core structure at L3 |
| G-03 | `center_mem_remaining` | In the singleton arm, `cu ∈ A \ C`. | stronger S0 caller | planned |
| G-04 | `blocked` | `¬HasNEquidistantPointsAt 4 (A\{u}) cu`, the same obstruction as R-03 after rewriting finite-set difference. | stronger S0 caller | planned |
| G-05 | `restores` | Restoring the sole deleted point gives a K4 at `cu`; the singleton producer proves this from `D.K4`. | stronger S0 caller | omitted at L1 except as a documented producer fact |
| G-06 | `geometry` | Equal-radius deleted pair or a `MinimalDeletionCore`; singleton production selects the core branch. | stronger S0 caller | L3 |
| S-01 | `context.source_mem_class` | `source ∈ C`. | L2 packet; retained in S0 | planned through `source=u` |
| S-02 | `.source_mem_interior` | `source ∈ J`. | L1 cap branch | planned through `source=u` |
| S-03 | `.source_mem_outside` | `source ∈ outsideFirstApexFiber R`. | L2 | omitted at L1 |
| S-04 | `.source_cross_card_le_two` | `|Ksource ∩ (C ∩ J)| ≤ 2`. | L2 | omitted at L1 |
| S-05 | `.other_ne_source`, `.other_mem_class`, `.other_mem_interior` | `other ≠ source`, `other ∈ C`, and `other ∈ J`. | L2 | omitted at L1 |
| S-06 | `.other_not_mem_source_row` | `other ∉ Ksource`. | L2 | omitted at L1 |
| S-07 | `.source_other_blockers_ne` | The actual blockers of `source` and `other` differ. | L2 | omitted at L1 |
| S-08 | `.source_survives_q_or_w` plus `cross_deletion_survives_iff_not_mem_selected_support` | After `source=u`, exactly `q ∉ Ku ∨ w ∉ Ku`, where `q=R.interior_q` and `w=R.interior_w`. | L2 | omitted at L1 |
| S-09 | `.source_mem_u_row` and S0 arm of `.u_eq_source_or_not_mem_source_row` | Select `u=source`; then the source lies in the actual row `Ku`. | S0 gate | planned |
| S-10 | `.v_not_mem_source_row` | Under `source=u`, `v∉Ku`. | L1/L2 duplicate of T-06 | planned once |
| C-01 | membership decidability for finite `J` | `S0-I: xu∈J` or `S0-N: xu∉J`; no endpoint or closed-cap conclusion follows in S0-N. | CELL | both planned |

## 4. Finite consequences used by the model

From T-04, G-01, J-01--J-03, the source memberships, and the exact four-row
fields, one obtains

```text
Iu = {u,xu}
Iv = {v,xv}
C  = {u,xu,delta,v,xv}
Iu ∩ Iv = ∅.
```

All five physical points are distinct. Naming off-physical row members gives
`Ku={u,xu,au,bu}` and `Kv={v,xv,av,bv}` with each row internally distinct.
No source theorem licenses arbitrary off-row disjointness. The distinct-center
two-circle bound permits zero, one, or two auxiliary overlaps. The source also
permits a center in the opposite row and an auxiliary equal to `O` unless a
specific field forbids that equality.

In S0, `other∈C`, `other≠u`, and `other∉Ku` imply
`other∈{delta,v,xv}`. This is a derived finite enumeration, not an assumed
identity.

## 5. Prior computation and present claim boundary

The exact twelve-role artifact in `scripts/rigid221_s0_l1.py` proves only
`SAT_12_ROLE_POSITIVE_CONTROL_EXACT` for a closed, all-distinct, disjoint-row
model. It omits the actual cap/MEC packet and therefore decides neither S0-I nor
S0-N. The later fourteen-role full-L1 fixed-order cells both ended
`UNKNOWN_TIMEOUT`; the displayed coordinates are only a
`ROW_CORE_POSITIVE_CONTROL`, with source status `SOURCE_INVALID`. S0-I and
S0-N remain `OPEN`; cyclic orders, auxiliary overlaps, and legal role
equalities not covered by the current formulas remain unencoded.

The present lane may report `SAT_EXACT` only after an independent exact witness
replay checks every active L1 row above. A formula UNSAT remains formula-scoped
unless every source-legal discrete cell is covered and an exact contradiction or
checked certificate is retained.

Wave 1 retains no `SAT_EXACT` witness. Its exact fixed-coordinate verdict is
`UNSAT_FIXED_CELL_EXACT`, with `TC-02` as the first packet failure and `TC-03`
as an independent minimized consequence conditional on `O = S.oppApex2`.
Its bounded rational addition grid remains `ENCODING_BLOCKED`; S0-I and S0-N
remain `OPEN` outside the fixed cell.
