# Rigid221 S0 bounded full-L1 source-constraint manifest

**Date:** 2026-08-29  
**Lane:** `rigid221-s0-full-l1-20260829`  
**Run:** `full-l1-v1`  
**Lane base:** `914396eaca79981b03f7b46b40dbb88d22f79ab5`  
**State:** PREPARING — NOT LAUNCHED  
**Scope:** source mapping and the first bounded M0 canary; no solver result,
Lean proof, or promotion claim

This manifest mechanically maps the first executable bounded cells to the
current Lean declarations. The listed Lean files have no changes between the
lane base and the checkout used for this audit, so the file:line anchors below
apply at the pinned lane base. Four labels are used throughout:

- **DIRECT** — a field or hypothesis present in the Lean source;
- **DERIVED** — a finite consequence of DIRECT fields, checked again by the
  exact witness verifier;
- **CELL** — one arm of an exhaustive local case split such as `xu ∈ J` versus
  `xu ∉ J`;
- **EXPERIMENTAL** — a bounded search restriction. Such a restriction may
  strengthen a satisfiable cell, but it cannot support a source-level UNSAT
  claim.

## 1. Canonical roles and the O/J alignment

```text
A      := D.A
O      := S.oppApex2
J      := S.capInteriorByIndex S.oppIndex2
C      := SelectedClass A O rho
cu     := (lateFirstApexSystem R).centerAt u.1 u.2
cv     := (lateFirstApexSystem R).centerAt v.1 v.2
Ku     := ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support
Kv     := ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support
delta  := jointDeletion.deleted.1
```

`O` is the physical-circle center and a Moser vertex. It is **not** the center
of the minimum enclosing circle. The definitions of `oppApex2`, `oppIndex2`,
and `capInteriorByIndex` align `O` with the cap whose strict interior is `J`:

| `surplusIdx` | `O = oppApex2` | `oppIndex2` | `J` |
|---:|---|---:|---|
| 0 | `triangle.v3` | 2 | `C3.erase v1 |>.erase v2` |
| 1 | `triangle.v1` | 0 | `C1.erase v2 |>.erase v3` |
| 2 | `triangle.v2` | 1 | `C2.erase v3 |>.erase v1` |

The M0 canary fixes `surplusIdx = 0`, names
`(v1,v2,v3) = (m1,m2,O)`, and therefore uses
`J = C3.erase m1 |>.erase m2`. The surplus-cardinality field still applies to
`C1`, the cap at `surplusIdx`; it must not be applied to `J` merely because `J`
is the selected second-opposite interior.

## 2. Exact declaration index

| Subject | Declaration and exact anchor |
|---|---|
| Live theorem | `false_of_exactFourMutualOmissionRigid221_minimalCore`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:543` |
| Generic theorem arguments | same file, lines 544–582 |
| Global-deletion packet | `ExactFourMutualOmissionRigid221GlobalDeletion`, same file, line 52; fields at lines 59–86 |
| Singleton producer | `exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class`, same file, line 440; returned identifications at lines 458–467 |
| Joint-deletion packet | `ExactFourMutualOmissionJointDeletion`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/JointDeletion/Types.lean:42`; fields at lines 48–69 |
| Source context and S0 disjunction | `ExactFourMutualOmissionSourceContext`, same file, line 75; `source_mem_interior` at lines 83–84 and `u_eq_source_or_not_mem_source_row` at lines 117–121 |
| Original residual | `OriginalUniqueFourResidual`, `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43`; fields at lines 47–69 |
| Actual late shell system | `lateFirstApexSystem`, `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:48` |
| Critical shell system | `CriticalShellSystem`, `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1116`; `centerAt` line 1130, `selectedAt` line 1135, `no_qfree_at` line 1142 |
| Exact four-row | `CriticalFourShell`, same file, line 638; exact support and cardinality fields at lines 645–652 |
| Two-circle overlap bound | `SelectedFourClass.inter_card_le_two`, same file, lines 474–477 |
| Exact physical class | `SelectedClass`, `lean/Erdos9796Proof/P97/WitnessPacketInterface.lean:59`; membership theorem at line 62 |
| Counterexample carrier | `CounterexampleData`, `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:83`; convexity, ambient K4, and cap packet at lines 89–93 |
| Second opposite Moser apex | `SurplusCapPacket.oppApex2`, same file, line 305; definition body at lines 307–310 |
| MEC/non-obtuse cap packet | `SurplusCapPacket`, `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332`; fields at lines 333–354 |
| Non-obtuse Moser record | `MEC.NonObtuseCircumscribedMoserTriangle`, `lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667`; inequalities at lines 673–680 |
| Moser MEC boundary data | `MEC.MoserTriangle`, `lean/Erdos9796Proof/P97/Moser/Triangle.lean:59`; boundary and circumscribed/diameter split at lines 73–86 |
| Closed arc predicate | `OnArcOpposite`, `lean/Erdos9796Proof/P97/Foundation.lean:83` |
| Closed cap packet | `CapTriple`, `lean/Erdos9796Proof/P97/Cap/Structure.lean:161`; endpoint pattern at lines 172–189, non-Moser count at lines 190–194, arc membership at lines 195–204 |
| Generic cap count | `CapTriple.moser_in_two`, same file, lines 213–229; `CapTriple.cap_sum_identity`, lines 251–253 |
| Indexed cap and endpoint erasure | `capByIndex`, `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:466`; `capInteriorByIndex`, line 496 |
| Second opposite index | `oppIndex2`, same file, line 550; definition body at lines 551–554 |

## 3. Active L1 contract

| ID | Class | Source entitlement | Exact condition for a supported cell |
|---|---|---|---|
| L1-01 | DIRECT | `CounterexampleData.A`, `.convex` | `A` is the closed modeled carrier and is convex-independent. The external certificate uses an injective cyclic enumeration of all of `A` and strict orientation of every nonincident vertex against every directed hull edge. |
| L1-02 | DIRECT | `SurplusCapPacket.hA`, `.hncol`, `.triangleNonObtuse`, `.hCirc` | A genuine circumscribed Moser triple lies on the boundary of an enclosing disk representing the MEC, its vertices are pairwise distinct, and all three non-obtuse dot products are nonnegative. |
| L1-03 | DIRECT | `CapTriple` endpoint fields, `nonmoser_in_one`, `arc_membership` | Each closed cap is derived by filtering `A` with the exact `OnArcOpposite` product inequality `≤ 0`; Moser endpoints have the prescribed two-cap pattern and every non-Moser carrier point belongs to exactly one cap. |
| L1-04 | DIRECT/DERIVED | `SurplusCapPacket.surplus`; `CapTriple.moser_in_two`, `cap_sum_identity` | The cap at `surplusIdx` has cardinality greater than four. The generic count is `|C1|+|C2|+|C3|=|A|+3`; no `(m,4,4)` count is assumed. |
| L1-05 | DIRECT | `oppApex2`, `oppIndex2`, `capInteriorByIndex` | `O` is the Moser vertex opposite the closed cap indexed by `oppIndex2`, and `J` is exactly that closed cap after erasing its two Moser endpoints. |
| L1-06 | DIRECT | `SelectedClass`; target `u`/`v` class hypotheses at `Rigid221Placement.lean:556–559`; exact-five hypothesis at lines 573–574 | `rho > 0` and the complete physical fiber is `C = {u,xu,delta,v,xv}` with no other point of `A` at distance `rho` from `O`. |
| L1-07 | DIRECT/DERIVED | `ExactFourMutualOmissionSourceContext.source_mem_interior` and the selected equality arm of `u_eq_source_or_not_mem_source_row` | S0 identifies `source = u`; substitution yields `u ∈ J`. The other arm of the source disjunction is outside S0, not negated. |
| L1-08 | CELL | membership decidability for the fixed finite `J` | Run `S0-I: xu ∈ J` and `S0-N: xu ∉ J` separately. `S0-N` does not assert that `xu` is an endpoint or outside the closed cap. |
| L1-09 | DIRECT | `lateFirstApexSystem`; `CriticalShellSystem.centerAt/selectedAt`; `CriticalFourShell` | `Ku` and `Kv` are the actual selected supports sourced by `u` and `v`, not anonymous circles. Each is the complete positive-radius fiber in `A`, has cardinality four, contains its source, and excludes its own center. |
| L1-10 | DIRECT | `ExactFourMutualOmissionRigid221GlobalDeletion.rigid`; joint-deletion fields `deleted*` and `blockers_ne` | `Ku∩C={u,xu}`, `Kv∩C={v,xv}`, the traces are disjoint, `C` is their union plus `delta`, `delta` is in neither row, `v∉Ku`, `u∉Kv`, and `cu≠cv`. |
| L1-11 | DIRECT | `CriticalShellSystem.no_qfree_at` | Both actual deletion obstructions are active: no positive squared-distance class in `A.erase u` about `cu`, or in `A.erase v` about `cv`, has four members. Exactness is over the complete bounded carrier, not only over the named row. |
| L1-12 | DIRECT/DERIVED | singleton producer conclusion; global-deletion fields `center_mem_remaining`, `deleted_nonempty`, `deleted_subset_class`, `deleted_card_le_five`, `blocked` | The L1 singleton mapping is `globalDeletion.center=cu` and `globalDeletion.deleted={u}`; hence `cu∈A\C`, `{u}` is a nonempty subset of `C` of size at most five, and the global blocked field is the `cu/u` obstruction. |

The physical fifth point `delta = jointDeletion.deleted.1` and the singleton
set `globalDeletion.deleted = {u}` are different objects. The implementation
and result schema must keep those two uses of “deleted” separate.

## 4. Derived finite consequences and legal equality cells

For every supported finite cell, the DIRECT constraints above yield:

1. `u,xu,delta,v,xv` are five distinct physical points.
2. Each row has four distinct support points. Naming its off-physical support
   by `Ku={u,xu,au,bu}` and `Kv={v,xv,av,bv}` gives
   `au,bu,av,bv ∉ C`.
3. `cu,cv ∈ A`, each center is absent from its own support, `cu∉C`, and
   `cu≠cv`.
4. `cu≠O` and `cv≠O`. If either center were `O`, deleting its source would
   leave the other four members of the exact physical five-fiber, contradicting
   its `no_qfree_at` obstruction.
5. The distinct-center two-circle theorem gives `|Ku∩Kv|≤2`. Since their
   physical traces are disjoint, support-overlap cells are exactly `M0`, `M1`,
   and `M2`, according to whether zero, one, or two auxiliary points coincide.

The source still permits the following equality placements and they must not
be globally forbidden by a future exhaustive L1 run:

- zero, one, or two shared auxiliaries between `Ku` and `Kv`;
- `cu=av`, `cu=bv`, or neither;
- `cv=u`, `cv=xu`, `cv=delta`, `cv=au`, `cv=bu`, or none;
- `O` equal to an auxiliary support point; and
- a center lying in the opposite row when the exclusions above do not forbid
  it.

Adding the explicit Moser endpoints creates further equality cells. The
triangle fields force `m1`, `m2`, and `O` to be pairwise distinct. Since
`u∈J`, `u` cannot equal either erased endpoint; `S0-I` similarly excludes
`xu=m1,m2`. In `S0-N`, however, `xu∉J` does not exclude an endpoint equality.
No active L1 field by itself forbids `m1` or `m2` from coinciding with
`v`, `xv`, `delta`, a row auxiliary, or a row center when the remaining class,
support, and cap memberships are consistent. Those endpoint-identification
cells require explicit enumeration; they are not silently removed by calling
the endpoints “Moser roles.”

Swaps inside `{au,bu}` and `{av,bv}` may quotient label presentations only
after preserving every other constraint. No source theorem licenses a row swap
or an unqualified dihedral quotient.

## 5. M0 fixed-cell canary

The first executable canary intentionally covers only two strengthened cells:

```text
A  = {O,m1,m2,u,xu,delta,v,xv,cu,cv,au,bu,av,bv}
Ku = {u,xu,au,bu}
Kv = {v,xv,av,bv}
```

All fourteen roles are pairwise distinct, the auxiliary overlap is `M0`, and
the Moser/MEC normalization is

```text
O=(0,0)
m1=(8/5,-4/5)
m2=(8/5,4/5)
MEC center=(1,0), MEC radius^2=1
surplusIdx=0, oppIndex2=2, J=C3\{m1,m2}.
```

The fixed cyclic orders are:

```text
M0-I-v1:
  O,au,av,v,delta,m1,u,cv,cu,xu,m2,xv,bv,bu

M0-N-v1:
  O,au,av,v,delta,m1,u,cv,cu,m2,xu,xv,bv,bu
```

These are EXPERIMENTAL restrictions. They are useful canaries because an exact
SAT witness would satisfy the active source constraints despite the stronger
cell restrictions. An UNSAT result for either fixed order says nothing about
the other legal orders, overlaps, or equality placements.

## 6. Explicit L1 omission ledger

| ID | Source item omitted from this M0 canary | Status |
|---|---|---|
| OM-01 | Carrier cardinalities and unnamed carrier points other than the closed fourteen-role model. The theorem's `12 ≤ A.card` holds arithmetically in this canary, but is not searched as a general cardinality condition. | EXPERIMENTAL bounded restriction |
| OM-02 | Every cyclic order except `M0-I-v1` and `M0-N-v1`; every `M1`/`M2` overlap; all legal center, opposite-row, `O`–auxiliary, and Moser-endpoint equality cells. | `ENCODING_BLOCKED` outside M0 |
| OM-03 | `CounterexampleData.K4`, the all-center ambient K4 surface. | intentionally omitted by L1 |
| OM-04 | `ExactFourPostCardElevenRobustSurface` and its named/global consequences. | intentionally omitted by L1 |
| OM-05 | The rest of `OriginalUniqueFourResidual`: minimality, the global `noM44` quantification over alternative cap packets, first-apex exact-four/unique-radius data, `q`, `w`, and the first-apex bisector condition. The current packet still encodes the generic cap counts and its own surplus field exactly. | later layer or full-source bridge |
| OM-06 | The source-context fields involving `outsideFirstApexFiber`, `other`, the cross-cardinality bound, blocker comparison, and the `q/w` survival disjunction. Only the S0 equality and `u∈J` consequences are active. | L2 |
| OM-07 | `jointDeletion.uPacket` and `.vPacket`, including both complete `CommonDeletionTwoCenterPacket` expansions. | L3 |
| OM-08 | `globalDeletion.restores`, `globalDeletion.geometry`, and the separate theorem-level `MinimalDeletionCore`. | L3 |
| OM-09 | Universal source-carrier coverage, Lean reconstruction, kernel checking, and proof promotion. | outside this external run |

No exact opposite-cap cardinality is active. In particular, the canary must not
insert `SurplusCapPacket.IsM44`; the residual records a stronger global
`noM44` condition, and that condition is not represented by checking one fixed
cap packet.

## 7. Claim boundary

At this state there is no computation result. After launch, `SAT_EXACT` may be
used only for a serialized bounded cell whose rational witness independently
replays every active item in this manifest. It must remain qualified as a
bounded L1-cell result, with `source_universal_claim=false`, `lean_claim=false`,
and `promotion_claim=false`.

Fixed-order solver UNSAT is not L1 UNSAT: at the layer level it remains
`UNKNOWN` while legal cells are unsupported. Every unimplemented legal cell is
`ENCODING_BLOCKED`. No boolean named `full_L1_claim` may be read as an
exhaustive or source-universal claim merely because one fixed cell is SAT.
