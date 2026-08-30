# Rigid221 S0 coupled-two-row 12-role positive-control manifest

**Date:** 2026-08-29
**Lane:** `rigid221-s0-coupled-two-row-l1-20260829`
**Base HEAD:** `55687ab3e1d47a0f8a5a3646031faf912e28ac80`
**Lean toolchain:** `leanprover/lean4:v4.27.0`
**Status:** source-mapped positive-control preflight; not L1, S0, a Lean proof, or a promotion artifact

## 1. Target and claim boundary

The live on-spine target is

```text
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourMutualOmissionRigid221_minimalCore
```

in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean`.
Its consumer chain reaches `Problem97.erdos97_rhs`.

The first executable wave is a **fixed, pairwise-distinct 12-role positive
control**. It is strictly weaker than L1 in
`docs/specs/p97-rigid221-s0-coupled-two-row-computational-spec-v1.md`. Besides
omitting the repository's actual `CapTriple`, `OnArcOpposite`, Moser-endpoint,
and `capInteriorByIndex` semantics, it closes the modeled carrier at exactly
twelve named roles and chooses one disjoint-support incidence cell. A SAT result
therefore shows only that this deliberately restricted finite proxy is
consistent. It is not `SAT_EXACT` for L1 or S0, not a counterexample, and not a
theorem claim.

The byte digests of the source files below are frozen in the governed
`run_manifest.json`.

## 2. Source constraints mirrored in the positive control

| ID | Lean source | Exact mathematical encoding | Status |
|---|---|---|---|
| RC-01 | `ExactFourMutualOmissionSourceContext.u_eq_source_or_not_mem_source_row`, `JointDeletion/Types.lean:117` | Select only the disjunct `u = source`. The other disjunct is a distinct residual, not negated. | active branch choice |
| RC-02 | `CounterexampleData.convex`, `U1TwoShortCapReduction.lean:88` | The twelve modeled points are convex-independent. For one fixed cyclic order, every nonincident modeled vertex is strictly on the common inner side of every oriented edge. | exact only in the fixed model |
| RC-03 | `SelectedClass`, `WitnessPacketInterface.lean:59`; target arguments, `Rigid221Placement.lean:550` | Within the closed model carrier `A_model`, `C = {z ∈ A_model | dist O z = 1}` has exactly five named elements. This does not establish completeness in the source carrier `A`. | exact only in `A_model` |
| RC-04 | `CriticalShellSystem.centerAt/selectedAt`, `U1CarrierInjection.lean:1116`; `CriticalFourShell`, `U1CarrierInjection.lean:638` | Within `A_model`, `Ku` and `Kv` are complete positive-radius fibers of cardinality four, with the named source in its row and the named center outside its own row. Completeness in an ambient carrier with additional points is not checked. | exact only in `A_model` |
| RC-05 | `CriticalShellSystem.no_qfree_at`, `U1CarrierInjection.lean:1142` | After deleting `u` or `v`, respectively, no positive squared-distance multiplicity about the corresponding center reaches four among the remaining modeled points. Extra source-carrier points could invalidate this. | exact only in `A_model` |
| RC-06 | target hypotheses `_hvOmitted` and `_huOmitted`, `Rigid221Placement.lean:554` | `v ∉ Ku` and `u ∉ Kv`. | active |
| RC-07 | `globalDeletion.rigid`, `Rigid221Placement.lean:59`; `jointDeletion.deleted`, `JointDeletion/Types.lean:48` | With `delta = jointDeletion.deleted`, `Iu=Ku∩C`, `Iv=Kv∩C`, `|Iu|=|Iv|=2`, `Disjoint Iu Iv`, and `C=insert delta (Iu∪Iv)`. Name the unique partners so `Iu={u,xu}` and `Iv={v,xv}`. | active |
| RC-08 | `ExactFourMutualOmissionJointDeletion.blockers_ne`, `JointDeletion/Types.lean:63` | `cu ≠ cv`. This one outer joint-deletion field is active even though the nested common-deletion packets are omitted. | active |
| RC-09 | singleton producer, `Rigid221Placement.lean:440`; global-deletion fields, `Rigid221Placement.lean:69` | The named `cu`, `u`, and modeled deletion obstruction mirror the singleton branch. The structure-level source fields and any assertion over extra carrier points remain omitted. | partial proxy |

For the first fixed-seed attempt the carrier roles are

```text
O, u, xu, delta, v, xv, cu, au, bu, cv, av, bv
```

with

```text
C  = {u,xu,delta,v,xv}
Ku = {u,xu,au,bu}
Kv = {v,xv,av,bv}.
```

`O` is a fixed carrier point. The other eleven roles contribute 22 coordinate
variables before row radii; after the physical-circle equalities and one
rotation gauge, this restricted proxy has positive-dimensional freedom.

### Added model restrictions

These are search-cell assumptions, not consequences of the Lean source:

| ID | Added restriction | Consequence |
|---|---|---|
| PC-01 | `A_model` is exactly the twelve named roles. | Every fiber and deletion-completeness check is relative to `A_model`, not the possibly larger source carrier `A`. |
| PC-02 | All twelve named roles denote distinct points. | Off-row supports are disjoint and every center/role identification cell is excluded, although the source specification permits some of them. |
| PC-03 | The cyclic order and nine seed coordinates are fixed. | The search does not enumerate alternative cyclic orders or general coordinate cells. |
| PC-04 | Only `cv,av,bv` range over a bounded rational bisector/rotation grid. | Exhaustiveness is only over that finite grid; failure would be `UNKNOWN`, never source-level UNSAT. |

## 3. Omitted from the positive control

| ID | Lean source | Omitted obligation | First intended layer |
|---|---|---|---|
| OM-01 | `SurplusCapPacket` and cap structures | Actual closed/strict second-cap construction, `CapTriple.arc_membership`, `OnArcOpposite`, Moser endpoints, and `capInteriorByIndex`; hence neither `S0-I` nor `S0-N` is decided. | full L1 |
| OM-02 | `ExactFourMutualOmissionSourceContext`, `JointDeletion/Types.lean:81` | `source_mem_class`, actual cap interior/outside-fiber data, cross-cardinality bound, `other`, blocker inequality with `other`, and all retained context. | L2 |
| OM-03 | `OriginalUniqueFourResidual`, `OriginalUniqueResidualDispatch.lean:57`; context survival, `JointDeletion/Types.lean:104` | `q=R.interior_q`, `w=R.interior_w`, first-apex class/interior memberships, `q≠w`, and `q∉Ku ∨ w∉Ku`. | L2 |
| OM-04 | `ExactFourMutualOmissionJointDeletion`, `JointDeletion/Types.lean:42` | All outer fields except `deleted` as used in RC-07 and `blockers_ne` as used in RC-08. | L3 |
| OM-05 | `CommonDeletionTwoCenterPacket`, `CommonDeletionTwoCenter.lean:30` | Both nested deletion packets, designated q-deleted rows, survival facts, actual-blocker inequalities, and overlap bounds. | L3 |
| OM-06 | global-deletion remainder, `Rigid221Placement.lean:78`; `MinimalDeletionCore`, `MinimalDeletionCore.lean:34` | `restores`, `geometry`, the singleton `shellAt`, and the theorem-level minimal-deletion core. | L3 |
| OM-07 | `CounterexampleData`, `U1TwoShortCapReduction.lean:83` | The actual ambient carrier beyond the twelve named roles, possible support overlaps/role identifications, ambient `K4`, the full surplus-cap packet, robust surface, and all unnamed carrier obligations. | full L1 and later layers |

## 4. Source-interpretation corrections

These corrections govern the computation even where the v1 prose specification
is less precise.

1. `source_mem_outside` is defined relative to the actual blocker fiber anchored
   at `F.pair.q`, not at `R.interior_q`. These are separate roles unless a checked
   theorem identifies them.
2. A nested `CommonDeletionTwoCenterPacket.B₁/B₂` with `B_card=4` is a designated
   four-point q-deleted witness, not automatically the complete ambient radius
   fiber. L3 must not add off-row exclusions without a separate source theorem.
3. The exact five-class equation is checked only in `A_model` through RC-03.
   It must not be described as complete in the source carrier until unnamed
   carrier points are represented or excluded by a proved bridge.
4. The previous direct-wedge coordinate artifact remains `UNCERTIFIED_WEDGE`:
   its manual cap sets are used only as a coordinate seed, never as cap evidence.

## 5. Verdict vocabulary

The positive-control harness may report only:

```text
SAT_12_ROLE_POSITIVE_CONTROL_EXACT
UNKNOWN
ENCODING_BLOCKED
```

`SAT_12_ROLE_POSITIVE_CONTROL_EXACT` requires exact rational readback checked
against every modeled RC item and makes PC-01--PC-04 explicit. It does not
upgrade any `OM` item and is not evidence that L1 or S0 is satisfiable. Any
full-L1 verdict requires a new run whose manifest includes the exact cap,
ambient-carrier, incidence-cell, and independent witness-replay machinery.
