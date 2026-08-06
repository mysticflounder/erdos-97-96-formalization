# Solve prompt: `false_of_crossBlockerCoincidence`

Generated via `math-toolchain:deep-thinker-prompt`, adapted from the
ShouqiaoW/CDC 10-section template for an **internal Lean `sorry`** rather than
a top-level Erdős-DB open problem. Placed under `scratch/` (not
`docs/tractability/problems/`, which is this template's default and belongs to
a different project's Erdős-DB layout) since this is a one-off dispatch
artifact, not proof content itself.

Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`,
declared at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:104-108`.
This is the only `sorry` in that file, one of 5 open leaves in the "FreshThird"
family (`docs/p97-spine-closure-audit-2026-08-03.md:96-134`), and one of 28
open on-spine obligations project-wide (`open: 87/35976` per a live
`proof-blueprint spine` run).

---

## Adaptation note (read before dispatching)

The template's dual-branch device ("assume a resolution exists, prove
affirmative or negative") was built for problems where truth direction is
genuinely unknown. Here the situation is different in kind:

- This is a `→ False` lemma inside a hand-built case split
  (`TwoSourceAlignedLowHits.lean:336-364`) that the project's authors
  constructed *believing* the hypothesis bundle is contradictory — that belief
  is not yet PROVEN AND ADVERSARIALLY AUDITED, so per project rigor policy it
  is CONJECTURE, not fact.
- Three independent kernel-checked scratch audits
  (`scratch/cross-blocker-terminal/`, `scratch/atail-force/cross-blocker-coincidence-packet-probe/`,
  `scratch/atail-force/cross-blocker-euclidean-audit/`) already show the
  hypothesis bundle is **realizable under a weaker, local-only projection**
  (ordered-cap/Kalmanson/shell geometry alone, ignoring minimality/no-M44/
  tri-apex/mutual-omission-cycle data). This does not resolve the lemma either
  way — it only proves the easy local routes are dead ends.

So the honest dual branch here is: **(A)** a complete Lean proof of `False`
from the *full* ambient hypothesis bundle (necessarily using the global data
the local audits couldn't touch), or **(B)** a complete Lean construction of
one concrete instance satisfying the *full* ambient bundle (not just the
local projection), which would prove the lemma false as stated and mean the
upstream case split needs revision — not that "the problem is open." Do not
let the project's evident expectation of branch (A) bias the search; branch
(B) must be pursued with equal rigor per the direction-neutral discipline
below, and the insufficient-progress list (§5) blocks cheap claims in both
directions.

---

## §1 Notation preamble

All declarations below are quoted verbatim from
`lean/Erdos9796Proof/P97/ATail/` (file:line given). `ℝ²` is the ambient plane;
`Finset ℝ²` finite point sets; `dist` the Euclidean metric.

**Base data.**

```lean
-- P97/U1TwoShortCapReduction.lean:83-93
structure CounterexampleData where
  A : Finset ℝ²
  nonempty : A.Nonempty
  convex : ConvexIndep A
  K4 : HasNEquidistantProperty 4 A
  packet : SurplusCapPacket A
```

`ConvexIndep A` — every point of `A` is a vertex of its convex hull (no point
lies in the convex hull of the others). `HasNEquidistantProperty 4 A` — every
point of `A` has ≥ 4 other points of `A` at a common distance from it (the
negation of this, for convex-independent `A`, is Erdős Problem 97 itself; see
"Parent theorem" below).

```lean
-- P97/Cap/PartitionFromMEC.lean:314-354 (abridged; full docstring in file)
structure SurplusCapPacket (A : Finset ℝ²) where
  hA : A.Nonempty
  hncol : ¬ Collinear ℝ (A : Set ℝ²)
  triangleNonObtuse : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol
  hCirc : ∃ h12 h23 h13,
    triangleNonObtuse.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩
  partition :
    CapTriple A (triangleNonObtuse.toMoserTriangle.toStructural hCirc)
  surplusIdx : Fin 3
  surplus : (4 : ℕ) <
    (match surplusIdx with
      | ⟨0, _⟩ => partition.C1
      | ⟨1, _⟩ => partition.C2
      | _      => partition.C3).card
```

A `SurplusCapPacket` bundles a non-obtuse Moser triangle circumscribing `A`
(vertices `v1, v2, v3`), a partition of `A` into three "caps" `C1, C2, C3` (one
per triangle edge), and a designated surplus cap with `> 4` points. Cyclic
index helpers (all `@[reducible]`, so definitionally transparent):

```lean
-- P97/U1TwoShortCapReduction.lean:296-301
def SurplusCapPacket.oppApex1 : ℝ² :=  -- vertex opposite the FIRST non-surplus cap
  match S.surplusIdx with
  | ⟨0,_⟩ => S.triangle.v2 | ⟨1,_⟩ => S.triangle.v3 | _ => S.triangle.v1

-- P97/Cap/PartitionFromMEC.lean:520-532
def oppIndex1 : Fin 3 :=  -- cap index of the FIRST opposite cap
  match S.surplusIdx with | ⟨0,_⟩=>1 | ⟨1,_⟩=>2 | _=>0
def oppIndex2 : Fin 3 :=  -- cap index of the SECOND opposite cap
  match S.surplusIdx with | ⟨0,_⟩=>2 | ⟨1,_⟩=>0 | _=>1

-- P97/Cap/PartitionFromMEC.lean:465-479
def capByIndex (i : Fin 3) : Finset ℝ² :=
  match i.1 with | 0=>S.partition.C1 | 1=>S.partition.C2 | _=>S.partition.C3
noncomputable def capInteriorByIndex (i : Fin 3) : Finset ℝ² :=
  -- capByIndex i minus its two triangle-vertex endpoints
  match i.1 with
  | 0 => (S.partition.C1.erase S.triangle.v2).erase S.triangle.v3
  | 1 => (S.partition.C2.erase S.triangle.v3).erase S.triangle.v1
  | _ => (S.partition.C3.erase S.triangle.v1).erase S.triangle.v2
```

`oppApex2`, `oppCap1`/`oppCap2`/`surplusCap`, `surplusApex` are the analogous
projections (same file family; not re-quoted, same shape).

```lean
-- P97/U1CarrierInjection.lean:1108-1125
structure CriticalShellSystem (A : Finset ℝ²) where
  shellAt : ∀ q ∈ A, Sigma fun center => CriticalSelectedFourClass A q center
  no_qfree : ∀ q (hq : q ∈ A),
    ¬ HasNEquidistantPointsAt 4 (A.erase q) (shellAt q hq).1

-- P97/U1CarrierInjection.lean:1129-1138, 1212, 1214-1220
def centerAt (H) (q) (hq) : ℝ² := (H.shellAt q hq).1
def selectedAt (H) (q) (hq) := (H.shellAt q hq).2
abbrev CarrierVertex (A) := {q : ℝ² // q ∈ A}
def blockerVertex (H) : CarrierVertex A → CarrierVertex A :=
  fun q => ⟨H.centerAt q.1 q.2, /- membership proof -/⟩
```

A `CriticalShellSystem` picks, for every point `q ∈ A`, a "blocker" center and
a named critical 4-point equidistant class (`CriticalSelectedFourClass`,
imported, not reproduced here — its `.toCriticalFourShell.support` is the
underlying `Finset ℝ²` of that class) through `q` at that center, with the
genuineness condition `no_qfree`: deleting `q` really does destroy every K4
witness at that center. `blockerVertex` iterates this: every carrier vertex
maps to "its blocker," itself a carrier vertex.

```lean
-- P97/WitnessPacketInterface.lean:53-60
noncomputable def SelectedClass (A) (s : ℝ²) (d : ℝ) : Finset ℝ² :=
  A.filter (fun q => dist s q = d)
```

`SelectedClass A s d` — the points of `A` at distance exactly `d` from `s`.

**Frontier data.**

```lean
-- P97/ATail/CriticalPairFrontier.lean:567-576 (fields' own types abridged)
structure CriticalPairFrontier (D) (S) (r : ℝ) (H) where
  pair : SurvivorPairRelocationPacket D S r H   -- carries pair.q, pair.w : ℝ²
  firstApexSplit : FirstApexSplit pair
  secondApexDouble : HasNEquidistantPointsAt 4 ((D.A.erase pair.q).erase pair.w) S.oppApex2
  secondApexSplit : SecondApexSplit pair

-- P97/ATail/OrientedPhysicalApexIngress.lean:235-260
structure FrontierCommonDeletionResidual (F) where
  firstApexDouble : HasNEquidistantPointsAt 4 ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  packet : CommonDeletionTwoCenterPacket D H F.pair.q S.oppApex1 S.oppApex2

structure FrontierCommonDeletionParentResidual (F) where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  frontierRadius_class_card_ge_four : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card
  common : FrontierCommonDeletionResidual F
```

`D.Minimal` and `SurplusCapPacket.IsM44` are imported elsewhere (not needed
verbatim to state the target theorem, but load-bearing for any proof that
must use `R.minimal`/`R.noM44` globally — pull them with `nthdegree docs show`
if a candidate proof needs to unfold them).

**Collision packets — the immediate hypotheses of the target theorem's
namespace.**

```lean
-- P97/ATail/RetainedStrictInteriorPairSelector.lean:68-90
structure RetainedInteriorBlockerCollision (_R : FrontierCommonDeletionParentResidual F) where
  source₁ source₂ : ℝ²
  source₁_mem_A : source₁ ∈ D.A
  source₂_mem_A : source₂ ∈ D.A
  sources_ne : source₁ ≠ source₂
  source₁_mem_radius : source₁ ∈ SelectedClass D.A S.oppApex1 radius
  source₂_mem_radius : source₂ ∈ SelectedClass D.A S.oppApex1 radius
  source₁_mem_capInterior : source₁ ∈ S.capInteriorByIndex S.oppIndex1
  source₂_mem_capInterior : source₂ ∈ S.capInteriorByIndex S.oppIndex1
  blockers_eq : H.centerAt source₁ source₁_mem_A = H.centerAt source₂ source₂_mem_A

-- P97/ATail/RetainedStrictInteriorPairSelector.lean:422-437
structure LocalizedCollisionCommonDeletion (P : RetainedInteriorBlockerCollision R) where
  fresh : ℝ²
  fresh_mem_capInterior : fresh ∈ S.capInteriorByIndex S.oppIndex1
  fresh_ne_source₁ : fresh ≠ P.source₁
  fresh_ne_source₂ : fresh ≠ P.source₂
  fresh_not_mem_shell : fresh ∉ (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
  packet : CommonDeletionTwoCenterPacket D H fresh S.oppApex1 (H.centerAt P.source₁ P.source₁_mem_A)

-- P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:124-163
structure LocalizedCollisionMutualOmissionCycle
    (P : RetainedInteriorBlockerCollision R) (L : LocalizedCollisionCommonDeletion P) where
  collisionSource : ℝ²
  collisionSource_mem_A : collisionSource ∈ D.A
  collisionSource_mem_capInterior : collisionSource ∈ S.capInteriorByIndex S.oppIndex1
  collisionSource_eq : collisionSource = P.source₁ ∨ collisionSource = P.source₂
  collisionSource_ne_fresh : collisionSource ≠ L.fresh
  collisionSource_blocker_eq_commonBlocker :
    H.centerAt collisionSource collisionSource_mem_A = H.centerAt P.source₁ P.source₁_mem_A
  fresh_not_mem_collisionSource_shell :
    L.fresh ∉ (H.selectedAt collisionSource collisionSource_mem_A).toCriticalFourShell.support
  collisionSource_not_mem_fresh_shell :
    collisionSource ∉ (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
  blockers_ne :
    H.centerAt collisionSource collisionSource_mem_A ≠ H.centerAt L.fresh L.packet.q_mem_A
  freshPacket : CommonDeletionTwoCenterPacket D H L.fresh S.oppApex1
    (H.centerAt collisionSource collisionSource_mem_A)
  collisionSourcePacket : CommonDeletionTwoCenterPacket D H collisionSource S.oppApex1
    (H.centerAt L.fresh L.packet.q_mem_A)
```

**The bi/tri-apex robustness chain** `B → L → N → T` (each a `Prop`-valued
structure over the previous; `R` is the base):

```lean
-- P97/ATail/PhysicalSecondApexCommonDeletion.lean:200-207
structure FrontierBiApexRobustResidual (parent : FrontierCommonDeletionParentResidual F) : Prop where
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2

-- P97/ATail/LargeOppositeCapsBiApexSurface.lean:37-45
structure FrontierLargeOppositeCapsBiApexRobustResidual (B : FrontierBiApexRobustResidual R) : Prop where
  firstOppCap_card_ge_six : 6 ≤ S.oppCap1.card
  secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card

-- P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:186-198
structure FrontierAllLargeCapsBiApexRobustResidual (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : Prop where
  surplusCap_card_ge_six : 6 ≤ S.surplusCap.card

-- P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:277-314
structure FrontierAllLargeCapsTriApexRobustResidual (N : FrontierAllLargeCapsBiApexRobustResidual L) : Prop where
  oppApex1_rich : ApexRichClassStructure D.A S.oppApex1
  oppApex2_rich : ApexRichClassStructure D.A S.oppApex2
  surplusApex_rich : ApexRichClassStructure D.A S.surplusApex
  notRobustCover_card : D.A.card ≤ 4 * (notRobustCenters D).card
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
         S.triangle.v2 ∈ SelectedClass D.A p r ∧
         S.triangle.v3 ∈ SelectedClass D.A p r)
```

Per that file's own docstring: `T` is strictly stronger than `N` alone because
`FullyDeletionRobustAt` says nothing about which apex — rotating the packet so
the surplus cap plays a different apex role and re-running the fresh
common-deletion parent recovers the third apex's robustness. `T`'s five fields
are genuinely new content, not re-derivable from `B`/`L`/`N` in this leaf.

**The target theorem's own two hypotheses:**

```lean
-- P97/ATail/TwoCollisionGlobalProducer.lean:478-492
abbrev CrossBlockerCoincidence (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
    H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂

-- P97/ATail/BlockerMultiplicityGeometry.lean:337-350
abbrev GeometricMultiplicityResidual (P) (Pρ) : Prop :=
  Nonempty (FreshThirdBlockerFiber P Pρ) ∨
    Nonempty (FreshOutsideFirstBlockerFiber P Pρ) ∨
      Nonempty (FreshOutsideSecondBlockerFiber P Pρ)
```

`CrossBlockerCoincidence` says: one source's actual blocker (its
`centerAt`-chosen center) equals one of the *other* collision's two named
sources — a four-way disjunction. `GeometricMultiplicityResidual` says: the
finite-map case split that produced this branch left one of three residual
shapes. All three disjuncts, verbatim (all in
`P97/ATail/BlockerMultiplicityGeometry.lean`):

```lean
-- lines 70-111 — a genuinely fresh third collision fiber
structure FreshThirdBlockerFiber (P) (Pρ) where
  source₁ source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂
  blocker_ne_first  : H.blockerVertex source₁ ≠ H.blockerVertex ⟨P.source₁, _⟩
  blocker_ne_second : H.blockerVertex source₁ ≠ H.blockerVertex ⟨Pρ.source₁, _⟩
  -- source₁ and source₂ are each ≠ all four of P.source₁/₂, Pρ.source₁/₂ (8 disequalities)
  source₁_mem_source₂_shell : source₁.1 ∈ (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  source₂_mem_source₁_shell : source₂.1 ∈ (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support

-- lines 115-157 — a larger known fiber on P's side, cross hit already excluded
structure FreshOutsideFirstBlockerFiber (P) (Pρ) where
  source : CriticalShellSystem.CarrierVertex D.A
  -- source ≠ all four named sources (4 disequalities)
  blockers_eq : H.blockerVertex source = H.blockerVertex ⟨P.source₁, _⟩
  source_mem_shell : source.1 ∈ (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
  source_not_mem_firstCap : source.1 ∉ S.capByIndex S.oppIndex1
  otherOutsidePoint : ℝ²
  otherOutsidePoint_mem_A : otherOutsidePoint ∈ D.A
  -- otherOutsidePoint ≠ source, ≠ Pρ.source₁, ≠ Pρ.source₂
  otherOutsidePoint_mem_shell : otherOutsidePoint ∈ (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
  otherOutsidePoint_not_mem_firstCap : otherOutsidePoint ∉ S.capByIndex S.oppIndex1
  outside_eq_pair :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support \ S.capByIndex S.oppIndex1
      = {source.1, otherOutsidePoint}

-- lines 161-203 — the symmetric fiber on Pρ's side (P/Pρ swapped throughout)
structure FreshOutsideSecondBlockerFiber (P) (Pρ) where
  -- identical shape to FreshOutsideFirstBlockerFiber with P.source₁ ↔ Pρ.source₁ swapped
  ...
```

A proven swap exists between the two `FreshOutside*` siblings —
`FreshOutsideSecondBlockerFiber.toSwappedFirst : FreshOutsideSecondBlockerFiber P Pρ → FreshOutsideFirstBlockerFiber Pρ P`
(`BlockerMultiplicityGeometry.lean:207-234`) — but **no such swap is recorded
for `FreshThirdBlockerFiber`, `CrossBlockerCoincidence`, or the
`LocalizedCollisionCommonDeletion`/`MutualOmissionCycle` pair** (`LP`/`LPρ`,
`MP`/`MPρ`). Do not assume a `P ↔ Pρ` symmetry argument transfers to those
without separately proving it — `hLPρ : LPρ.fresh = Pρ.source₁` and
`hLP : LP.fresh = P.source₁` are not literally symmetric statements under a
naive relabeling.

## §2 Problem statement

The target theorem, exactly as declared, section context included
(`TwoSourceCanonicalSurface.lean:51-108`):

```lean
section
variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩ S.capInteriorByIndex S.oppIndex1 = {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩ S.capInteriorByIndex S.oppIndex1 = {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint : Disjoint ({P.source₁, P.source₂} : Finset ℝ²) {Pρ.source₁, Pρ.source₂})
    (hblockersNe : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP

theorem false_of_crossBlockerCoincidence
    (hcoincidence : CrossBlockerCoincidence P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ) :
    False := by
  sorry
end
```

**Important elaboration subtlety.** Only the names on the `include` line are
explicitly threaded through as named hypotheses of the final theorem
signature — but `D, S, radius, ρ, H, F, R, Fρ, Rρ, B, L, N` are *also*
present in the elaborated signature, auto-bound as implicit arguments because
they occur in the *types* of `P, Pρ, T` and the included hypotheses. In
particular **`B`, `L`, `N` are available to any proof of this theorem** — as
implicit arguments reachable through `T`'s type indices — even though they
have no separate `include` entry and no separately-named local hypothesis.
Confirm any candidate proof reaches them correctly (e.g. via anonymous
constructor/implicit-argument syntax or by re-generalizing) rather than
assuming they are simply absent from context.

**What must be proved:** `False`, using only what is in scope above (the
listed `include`d hypotheses plus their implicit ancestors) plus
`hcoincidence : CrossBlockerCoincidence P Pρ` and
`hresidual : GeometricMultiplicityResidual P Pρ`.

**Parent theorem.** This lemma sits inside Problem 97's descent machinery.
Problem 97 itself (`Problem97.erdos97_rhs`,
`lean/Erdos9796Proof/P97/UpstreamBridge.lean:30`):

  ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A → ¬ HasNEquidistantProperty 4 A

("A convex-independent finite planar point set cannot have every point
equidistant from 4 others.") The `ATail` development proves this by deriving
`False` from an assumed minimal counterexample via a long case split; this
lemma is one leaf of that split. Its direct caller is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`TwoSourceAlignedLowHits.lean:265-364`), which case-splits on
`hglobalCapSplit : hcapSource | hcoincidence` and in the `hcoincidence` branch
(lines 351-364) invokes this theorem with `False.elim` to close that branch.

## §3 Assume-solvable framing

> Assume for purposes of this task that the case split at
> `TwoSourceAlignedLowHits.lean:336` is well-founded — i.e. that a complete
> resolution of `false_of_crossBlockerCoincidence` exists — but do not assume
> in advance that the resolution is a proof of `False` rather than a
> demonstration that the hypothesis bundle is satisfiable. A complete solution
> must establish exactly one of the two branches in §4.

## §4 Dual-branch success criteria

**Branch A (theorem holds).** Produce a complete Lean 4 proof term replacing
the `sorry` at `TwoSourceCanonicalSurface.lean:108`, under the exact signature
in §2, that:

- type-checks against this project's current source tree (`lake build
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface`
  succeeds), and
- is closed under the project's `native_decide` policy: `#print axioms` /
  `proof-blueprint axioms` on the resulting theorem shows only
  `propext, Classical.choice, Quot.sound` (plus `Lean.ofReduceBool` and
  `Lean.trustCompiler` only if a `native_decide` step is used, and if so, the
  evaluated `Decidable` instance and everything it calls is ordinary verified
  Lean — no `unsafe`, no `@[implemented_by]`, no `@[extern]`), and
- covers **all four disjuncts** of `hcoincidence` crossed with **all three
  disjuncts** of `hresidual` (twelve combined cases; a proof need not
  literally case-split into twelve branches if a uniform argument covers
  several at once, but every combination must be accounted for).

Because the three existing scratch audits already establish that the
combined bundle is satisfiable under *local* metric/order geometry alone
(ordered-cap/Kalmanson constraints + the twelve branches' own equalities),
any Branch A proof **must** invoke at least one of: `R.minimal`, `R.noM44`,
a field of `T` (`oppApex1_rich`/`oppApex2_rich`/`surplusApex_rich`/
`notRobustCover_card`/`no_center_covers_all_apices`), a field of `B`/`L`/`N`,
or the mutual-omission-cycle data (`MP`, `MPρ`, `LP`, `LPρ` and their fields).
A proof that only manipulates `P`, `Pρ`, `hfrontierFour`, `hρfour`,
`hfrontierInteriorEq`, `hρInteriorEq`, `hpairsDisjoint`, `hblockersNe` and
order/metric facts about the plane, without touching the global data, is
almost certainly reproving what the audits already falsified — treat such an
argument as suspect and re-check it against the audits' countermodel
(`a=(1,15/4), p=(0,1), u=(1,0), q=(2,1), b1=(3,11/4), v=(4,6)`, in
`scratch/cross-blocker-terminal/REPORT.md`) before trusting it.

**Branch B (theorem is false as stated).** Produce a complete Lean 4
construction of ONE fixed, concrete instance of every piece of data in the
section signature —

  `D, S(= D.packet), radius, ρ, H, F, R, P, Fρ, Rρ, Pρ, B, L, N, T, LPρ, LP, MPρ, MP`

— together with proofs of every `include`d hypothesis
(`hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
hpairsDisjoint, hblockersNe, hLPρ, hLP`) plus `hcoincidence` and `hresidual`,
all simultaneously satisfied by the SAME instance, kernel-checked with no
`sorry`/axiom beyond the same closure list as Branch A. This must include a
full witness of `D.convex` (`ConvexIndep D.A`), `D.K4`
(`HasNEquidistantProperty 4 D.A`), `9 < D.A.card`, and the entire
`SurplusCapPacket` (a genuine non-obtuse circumscribed Moser triangle,
`hCirc`, and a real `CapTriple` partition with a `> 4`-point surplus cap) —
not a relaxed or partial version of any of these. This is a strictly larger
lift than what the existing scratch audits attempted (they explicitly omit
`CounterexampleData`, cap order, minimality, no-M44, and tri-apex/cycle data —
see `scratch/atail-force/cross-blocker-euclidean-audit/README.md`'s own scope
statement). A genuine Branch B result means the upstream case split at
`TwoSourceAlignedLowHits.lean:336-364` is unsound and needs revision — it does
NOT mean "Erdős Problem 97 is false" or "this problem is open"; report it as a
finding about this specific case split.

Both branches are equally in scope. Do not treat Branch B as a fallback to
report only if Branch A fails after a token effort — pursue both with equal
resources per §7's independence discipline, and only stop when one is fully
established or both have been exhausted with concrete recorded obstructions.

## §5 Insufficient-progress list

Partial progress does not count unless it establishes exactly Branch A or
Branch B above, kernel-checked and complete. In particular the following are
insufficient:

* A Branch A argument covering fewer than all four `hcoincidence` disjuncts
  or fewer than all three `hresidual` disjuncts (including the two structures
  not fully spelled out by name in earlier project notes,
  `FreshOutsideFirstBlockerFiber`/`FreshOutsideSecondBlockerFiber` — both are
  given in full in §1).
* Any argument relying only on local metric/order/Kalmanson/shell-intersection
  geometry without invoking `R.minimal`, `R.noM44`, or a `T`/`B`/`L`/`N` field
  — the three existing scratch reports are exactly this, already exhausted,
  and are not to be resubmitted as new progress.
* A Branch B instance that satisfies only the *named-coordinate consequences*
  of the twelve branches (as the three scratch audits do) without
  instantiating the full `CounterexampleData`/`CriticalShellSystem`/
  `SurplusCapPacket` and discharging `D.convex`, `D.K4`, `9 < D.A.card`, cap-six
  bounds (`firstOppCap_card_ge_six`, `secondOppCap_card_ge_six`,
  `surplusCap_card_ge_six`), and `T`'s five fields.
* Numerical, floating-point, or finite SAT/CEGAR search evidence (v36-v38 and
  earlier runs, per `docs/computational-closure-plan-2026-07-28.md:200-206`)
  presented as a proof rather than converted into a kernel-checked Lean
  certificate.
* Any proof using `sorry`, a custom axiom, or a `native_decide` step whose
  evaluated decision procedure contains `unsafe`, `@[implemented_by]`, or
  `@[extern]` — violates the project's mandatory `native_decide` policy.
* Silently treating `B`, `L`, or `N` as *unavailable* (they are implicit
  arguments of the theorem via `T`'s type — see §2) or, conversely, silently
  assuming a fact about them beyond what their stated fields give.
* A naive `P ↔ Pρ` symmetry claim applied to `CrossBlockerCoincidence`,
  `FreshThirdBlockerFiber`, or the `(LP, MP) ↔ (LPρ, MPρ)` pair without
  separately proving the swap — unlike `FreshOutside{First,Second}BlockerFiber`
  (which has a proven `toSwappedFirst` swap, `BlockerMultiplicityGeometry.lean:207-234`),
  no such swap lemma is known for these.
* Assuming a specific value of `S.surplusIdx` (0, 1, or 2) without tracking
  the case split it induces on `oppIndex1`/`oppIndex2`/`oppApex1`/`oppApex2`.
* Discharging only one of the two mutual omission cycles (`MP` or `MPρ`) and
  asserting the other "by symmetry" (see the symmetry caveat above).
* Reducing to any of the project's other currently-open on-spine sorries as
  though that were a proof — in particular the other 4 leaves of the same
  "FreshThird" family:
  `false_of_twoCapSources_freshOutsideFirstBlockerFiber`
  (`TwoSourceFreshThirdFiber.lean:98`),
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
  (`TwoSourceFreshThirdResidual.lean:524`),
  `false_of_capSource_firstFiber_outsidePairDeletionExactRows`
  (`TwoSourceFirstFiberCollision.lean:1259`),
  `false_of_capSource_firstFiber_crossedThreeRowExactSupports`
  (`TwoSourceFirstFiberCollision.lean:1302`) — none of these are independently
  established, so invoking one is not progress.
* More generally: reducing this lemma to another unproved statement of
  comparable strength anywhere in the project.

## §6 Allowed background

Standard proved theorems from Euclidean/convex geometry, Mathlib's
`EuclideanGeometry`/`Finset`/`Convex` libraries, and any Lean declaration
already proved and reachable via the imports of `TwoSourceCanonicalSurface.lean`
(transitively through `TriApexEndpointRetainedOmission` and the ~20 `open`
namespaces at the top of that file — including all 15 other, fully proved
theorems in the same `TwoSourceExactCollisionRowsTerminal` namespace, see the
technique-precedent list below) may be used, stated accurately with all
hypotheses.

**Known negative computational result** (usable as established background,
with an explicit scope caveat): three independent kernel-checked scratch
audits —

- `scratch/cross-blocker-terminal/REPORT.md` (+ `CrossBlockerCoincidenceAudit.lean`)
- `scratch/atail-force/cross-blocker-coincidence-packet-probe/REPORT.md`
- `scratch/atail-force/cross-blocker-euclidean-audit/README.md` (+
  `exact_12_branch_witnesses.py`, reproducible via `uv run`)

— jointly establish: the twelve `hcoincidence × hresidual` branches, projected
onto ordered-cap/Kalmanson/shell-intersection geometry alone (i.e. omitting
`CounterexampleData`, cap partition well-formedness, minimality, no-M44, and
tri-apex/cycle data), admit an explicit exact-rational realization — e.g.
`a=(1,15/4), p=(0,1), u=(1,0), q=(2,1), b1=(3,11/4), v=(4,6)` — for all twelve
branches simultaneously. **This does not imply** the full ambient hypothesis
bundle (§2, all `include`d hypotheses plus `T`) is jointly satisfiable, nor
that no global Branch-A argument exists — it only rules out local-geometry-only
routes to Branch A, and shows Branch B needs strictly more than these
witnesses supply (see §4).

Technique precedents from the 15 other, fully proved theorems in the same
namespace (`TwoSourceCanonicalSurface.lean`) — closest in shape to this leaf:

- `false_of_commonRadius_equalCenters_noncanonicalSameCap` (line 415): an
  equal-center same-cap terminal — equal-center shell lemma forces a center
  into the canonical cap, contradicting distinct-cap membership. Structurally
  the closest existing *proved* contradiction pattern to what a Branch A
  argument for `hcoincidence`'s equality arms might resemble — though per the
  audits above, this specific technique (local order/shell geometry) has
  already been checked and found insufficient for this leaf; use it only as a
  stepping stone toward a genuinely global argument, not as the full route.
- The boundary/cyclic-order chain
  `freshThird_sharedPairCyclicSeparation_atBoundary` (173) →
  `freshThird_canonicalDifferentCap_boundary` (982) →
  `freshThird_canonicalDifferentCap_centerOrder` (1268) →
  `freshThird_canonicalDifferentCap_endpointPlacement` (1425): shows how this
  namespace builds convex-boundary-indexing arguments; same caveat applies.

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically, mapped to this
project's actual agent types (not literal "multiagent v2"):
`math-toolchain:math-professor` / `math-professor-codex` for exploration
(cross-model diversity), `math-toolchain:math-prover` for proof construction,
`math-toolchain:math-skeptic` for adversarial audit (default verdict NEEDS
WORK), `lean4:sorry-filler-deep`/`lean4:proof-repair` for compiler-guided
mechanical repair once a proof sketch exists, and SAT/CEGAR/exact-arithmetic
scripts (`uv run`) for computational agents. Respect this project's
concurrency conventions (spawn subagents per the standing delegation
instruction in `~/projects/math-projects/CLAUDE.md`; validate every agent's
work before trusting or committing it). Do not use a fixed assignment such as
"N agents for strategy X" — instead:

* Begin with a genuinely diverse portfolio of approaches, spanning:
  1. direct case analysis on the 4×3 = 12 `hcoincidence × hresidual` arms,
     seeking a global contradiction per arm via `R.minimal`/`R.noM44`;
  2. the pigeonhole/counting route via `T.notRobustCover_card`
     (`D.A.card ≤ 4 * notRobustCenters.card`) combined with the collision
     source structure;
  3. rich-class-structure exploitation at all three apices
     (`T.oppApex1_rich`/`oppApex2_rich`/`surplusApex_rich`) forcing an
     incidence contradiction with the cross-blocker equalities;
  4. `T.no_center_covers_all_apices` combined with a cross equality (which
     asserts some center coincides across the two collisions) to derive a
     forbidden triple-apex coverage;
  5. the mutual-omission-cycle shell-exclusion facts (`MP`/`MPρ`'s
     `fresh_not_mem_collisionSource_shell`/`collisionSource_not_mem_fresh_shell`)
     combined with the cross equalities to derive a membership contradiction;
  6. a cap-cardinality overcounting argument using
     `L.firstOppCap_card_ge_six`/`secondOppCap_card_ge_six`/
     `N.surplusCap_card_ge_six` against the exact-4 `SelectedClass`
     cardinalities (`hfrontierFour`, `hρfour`);
  7. `FreshThirdBlockerFiber`-style fiber analysis feeding directly off `MP`,
     `MPρ`'s fresh points for the `hresidual` disjuncts;
  8. direct construction of a fifth equidistant point from the coincidence,
     violating `D.K4` or `D.convex`;
  9. a minimality-based deletion argument using `R.minimal` to derive that
     deleting a specific collision source contradicts a frontier assumption;
  10. an extended Kalmanson/ordered-cap argument that *incorporates* tri-apex
      data (going beyond the already-exhausted local-only routes);
  11. a SAT/CEGAR encoding of the FULL hypothesis bundle (not just the local
      metric projection tried before) — including symbolic clauses for
      minimality and no-M44 — searching for UNSAT;
  12. an exact-rational full-instance search for Branch B with a small
      concrete carrier (`|A|` in the 10-16 range), computer-assisted convex
      position + K4 + cap-partition search;
  13. a symmetry-reduction argument that first proves (rather than assumes)
      whichever `P ↔ Pρ` swaps actually hold, then uses them to cut the
      12-branch case count;
  14. degenerate/boundary analysis of whether `hblockersNe`/`hpairsDisjoint`/
      `hLPρ`/`hLP` already make some of the twelve branches vacuous;
  15. rigidity arguments for equidistant-4 configurations in convex position
      drawn from the wider Moser-spindle/unit-distance literature; and
  16. computational sanity checks throughout.

* Do not tell most agents the currently favored approach. Preserve
  independence during early rounds so agents do not all converge on the same
  attractive-but-incomplete route. Name the traps explicitly: (a) treating
  this as a purely local metric/order-geometry problem — already shown
  insufficient by the three scratch audits; (b) silently using `B`/`L`/`N` as
  free-standing named hypotheses rather than reaching them through `T`'s
  implicit type indices; (c) asserting a `P ↔ Pρ` symmetry for
  `CrossBlockerCoincidence`/`FreshThirdBlockerFiber`/`(LP,MP)↔(LPρ,MPρ)`
  without proving it first.

* Maintain an explicit registry of approach families (the 16 above, or new
  ones discovered), grouped by mathematical idea, not superficial wording. If
  many agents converge to one family, redirect some toward underexplored
  ones.

* Do not allow one approach to dominate merely because it gives an elegant
  reduction. A route that ends at an unproved lemma equivalent in strength to
  `false_of_crossBlockerCoincidence` itself (e.g., silently depending on one of
  the four sibling open FreshThird leaves listed in §5) is not close to
  completion unless it supplies a genuinely new, independent proof of that
  lemma.

* When an approach stalls at a theorem-strength missing lemma, mark it
  blocked. Continue assigning agents to it only if someone proposes a
  materially new mechanism, invariant, or construction.

* Keep both Branch A and Branch B routes alive through multiple rounds.
  Cross-pollinate only after independent agents have developed each far
  enough to expose its real strengths and gaps.

* Use computational agents throughout — exact rational/SAT/CEGAR encodings,
  candidate searches, counterexamples to intermediate lemmas. Computation is
  evidence unless converted into a rigorous general Lean proof (Branch A) or
  an exact kernel-checked certificate (Branch B).

* Search aggressively for counterexamples to any proposed intermediate lemma
  before relying on it — a found counterexample kills the route immediately;
  a lemma that has survived no refutation attempt is not established.

* Use adversarial agents throughout, independent of whoever produced the
  argument under audit. Every candidate proof or construction must be checked
  against:
  - every one of the four `hcoincidence` disjuncts and three `hresidual`
    disjuncts, individually;
  - correct use (not silent omission) of `R.minimal`, `R.noM44`, and every
    field of `T` actually invoked, versus fields merely assumed;
  - correct reach-through to `B`/`L`/`N` as implicit arguments of `T`'s type,
    not as free-standing named hypotheses;
  - `LPρ` vs `LP` and `MPρ` vs `MP` not being conflated or silently swapped;
  - any claimed `P ↔ Pρ` symmetry being separately proved, not assumed;
  - `S.surplusIdx`'s three-way case split being tracked correctly through
    `oppIndex1`/`oppIndex2`/`oppApex1`/`oppApex2`;
  - a Branch A proof's full axiom closure (`proof-blueprint axioms` — only
    core axioms, or core + `Lean.ofReduceBool`/`Lean.trustCompiler` with a
    verified `native_decide` closure per the project's policy);
  - a Branch B instance's actual, full satisfaction of `D.convex`, `D.K4`,
    `9 < D.A.card`, and a genuine `SurplusCapPacket` — not a relaxed toy
    version;
  - circular use of a statement equivalent in strength to
    `false_of_crossBlockerCoincidence`.

* Require agents to return concrete Lean lemmas, constructions, or
  counterexamples to proposed sublemmas — reject status reports, vague
  optimism, or claims that an unproved global-bridge statement is "routine."

* The root agent should repeatedly synthesize, challenge, redirect, and
  launch new rounds. Do not stop after the first wave fails. Produce a
  complete solution only if it survives adversarial audit; otherwise report
  only the strongest rigorously proved derivation and its exact remaining
  gap.

## §8 Anti-quit block

> Do not return merely because current approaches fail or agents report
> theorem-strength gaps. Continue launching new rounds, reopening blocked
> approaches only when there is a genuinely new mechanism, and searching for
> fresh formulations.

## §9 Return contract

> Return only when `false_of_crossBlockerCoincidence` has either (a) a
> complete, kernel-checked Branch A proof compiling in this project's
> environment, or (b) a complete, kernel-checked Branch B instance
> establishing the full hypothesis bundle is jointly satisfiable — and the
> argument survives adversarial audit. Do not return a reduction, partial
> result, isolated missing lemma, finite/numerical computation, "best effort"
> summary, or explanation of why the lemma is difficult.
>
> Do not stop, return, or give up until one of the two branches is fully
> resolved. Continue exploring every plausible approach, repairing failed
> arguments, and developing new ones until the lemma is fully settled.

Minimum-effort floor (in rounds, not wall-clock, per project convention):
spend at least 3 full rounds of the 16-approach portfolio across both
branches before considering a return with only a partial result.

## §10 Web-search restriction

> Public search may be used only for ordinary mathematical background or
> standard named theorems (Euclidean geometry, convex position, Moser
> spindle/unit-distance literature), not to search for a solution to this
> exact internal lemma. Do not search the public web merely to determine
> whether this lemma or the broader ATail case split is "known" or "open,"
> and do not answer that it is open — it is an internal proof obligation in
> an active in-project formalization, not a tracked external open problem.

---

## Dispatch checklist

- [ ] Confirm current `sorry` location still matches
      `TwoSourceCanonicalSurface.lean:104-108` (`lake build` / `proof-blueprint
      spine` first, in case the file has shifted since this prompt was
      written).
- [ ] Verify build: `lake build
      Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface`
- [ ] Any candidate closure: `proof-blueprint spine` (must shrink the on-spine
      open count) and `proof-blueprint axioms` on the new theorem (native_decide
      policy check).
- [ ] Read the three scratch audit reports in full before starting Branch A —
      they contain the exact countermodel any local-only argument must be
      checked against.
