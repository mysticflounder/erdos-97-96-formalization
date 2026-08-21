/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CenterExchangeBoundaryOrderBridge
import Erdos9796Proof.P97.ATail.CocircularEquidistantWitness
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# Physically-bridged class-witness cuts for the exact-twelve Rigid221 lane

The five points of the physical class about the second apex are cocircular at
the class radius.  Two order-free geometric facts about that class transfer to
the frozen twelve-label vocabulary:

* an on-class center whose selected row contains a class pair is an
  equidistant witness of that pair and therefore strictly separates the pair
  in the cyclic order about the apex
  (`Problem97.areaForm_sign_split_of_equidistant_witness`); and
* the apex itself is equidistant from every class pair, so by the
  perpendicular-bisector apex bound at most one further carrier point can be
  equidistant from a given class pair (`Dumitrescu.perpBisector_apex_bound`).

This module supplies the three pieces a physically-bridged membership
certificate needs: the decidable all-orders separation check with its
canonical-order transfer bridge, the two refutation kernels stated against a
realized row pattern, and the source-leaf producer of the class-radius
hypothesis (`FrozenRoleLabeling.physicalClassRadius`).

The class hypothesis is genuinely additional certificate provenance: row
realization alone never states that the label-`9` class point lies at the
class radius, because that point is erased from the pinned apex row.

This module does not construct a terminal CNF bank, prove finite UNSAT,
provide aggregate coverage, or close a live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/- ## The physical class at one placement -/

/-- The five frozen labels of the physical class about the second apex at one
`(d, v)` placement: the fixed labels `u = 6`, `xv = 8`, `xu = 9`, and the two
variable-role labels of the placement. -/
def physicalClassLabels (dLabel vLabel : Label) : Finset Label :=
  insert dLabel (insert vLabel {6, 8, 9})

/-- The physically-bridged class hypothesis at one `(d, v)` placement: the
five class labels lie at one positive common radius from the second-apex
label, and neither variable-role label is the apex label. -/
structure PhysicalClassRadius (pointOf : Label → ℝ²)
    (dLabel vLabel : Label) (ρ : ℝ) : Prop where
  radius_pos : 0 < ρ
  dLabel_ne_apex : dLabel ≠ 1
  vLabel_ne_apex : vLabel ≠ 1
  dist_eq : ∀ ℓ ∈ physicalClassLabels dLabel vLabel,
    dist (pointOf ℓ) (pointOf 1) = ρ

/- ## The decidable all-orders separation check -/

/-- In one boundary indexing, the class witness `z` does not strictly
separate the pair `{p, q}` in the cyclic order about the second-apex label:
the triples `(1, p, z)` and `(1, q, z)` carry one common cyclic
orientation. -/
def WitnessSameSideAt (position : Label → Nat) (z p q : Label) : Prop :=
  (CyclicTripleAt position 1 p z ∧ CyclicTripleAt position 1 q z) ∨
    (CyclicTripleAt position 1 z p ∧ CyclicTripleAt position 1 z q)

instance (position : Label → Nat) (z p q : Label) :
    Decidable (WitnessSameSideAt position z p q) :=
  decidable_of_iff
    ((CyclicTripleAt position 1 p z ∧ CyclicTripleAt position 1 q z) ∨
      (CyclicTripleAt position 1 z p ∧ CyclicTripleAt position 1 z q))
    Iff.rfl

/-- Boolean check that in every canonical boundary order the witness `z`
does not strictly separate the pair `{p, q}` about the second-apex label. -/
def witnessSameSideAll48 (z p q : Label) : Bool :=
  canonicalBoundaryOrders.all fun L =>
    decide (WitnessSameSideAt (positionInList L) z p q)

/-- Soundness of `witnessSameSideAll48`. -/
theorem witnessSameSideAll48_eq_true_iff (z p q : Label) :
    witnessSameSideAll48 z p q = true ↔
      ∀ L ∈ canonicalBoundaryOrders,
        WitnessSameSideAt (positionInList L) z p q := by
  unfold witnessSameSideAll48
  simp only [List.all_eq_true, decide_eq_true_eq]

private theorem cyclicTripleAt_of_agree {p' q' : Label → Nat}
    (hagree : ∀ i j : Label, p' i < p' j ↔ q' i < q' j) {a b c : Label}
    (h : CyclicTripleAt p' a b c) : CyclicTripleAt q' a b c := by
  unfold CyclicTripleAt at h ⊢
  simp only [hagree] at h
  exact h

/-- Same-side bridge at position level: a separation-free fact checked on all
forty-eight canonical boundary orders holds for every injective position map
satisfying the frozen block hypotheses and the forced second-cap order. -/
theorem witnessSameSideAt_of_frozenBlocks
    {position : Label → Nat}
    (hinj : Function.Injective position)
    (hblocks : FrozenDirectBoundaryOrder position ∨
      FrozenMirrorBoundaryOrder position)
    (hforced : FrozenForcedSecondCapOrder position)
    {z p q : Label}
    (hchecked : witnessSameSideAll48 z p q = true) :
    WitnessSameSideAt position z p q := by
  obtain ⟨L, hmem, hagree⟩ :=
    exists_orderIso_canonicalBoundaryOrder_of_frozenBlocks hinj hblocks hforced
  rcases (witnessSameSideAll48_eq_true_iff z p q).mp hchecked L hmem with
    ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · exact Or.inl ⟨cyclicTripleAt_of_agree hagree h₁,
      cyclicTripleAt_of_agree hagree h₂⟩
  · exact Or.inr ⟨cyclicTripleAt_of_agree hagree h₁,
      cyclicTripleAt_of_agree hagree h₂⟩

/-- Same-side bridge for a realized frozen boundary order. -/
theorem FrozenBoundaryOrder.witnessSameSideAt
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {z p q : Label} (hchecked : witnessSameSideAll48 z p q = true) :
    WitnessSameSideAt order.position z p q :=
  witnessSameSideAt_of_frozenBlocks
    order.position_injective order.blocks hforced hchecked

/- ## The two refutation kernels -/

/-- **Class-witness separation kernel.**  In a realized pattern carrying the
class-radius hypothesis, an on-class center whose row contains a class pair
is an equidistant witness of that pair, so the two apex-based triangles
through the witness have opposite signed areas.  A boundary order in which
the witness does not strictly separate the pair forces those signed areas to
one common strict sign, a contradiction. -/
theorem false_of_hostedClassPair_of_witnessSameSide
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    {dLabel vLabel : Label} {ρ : ℝ}
    (hradius : PhysicalClassRadius pointOf dLabel vLabel ρ)
    {z p q : Label}
    (hzC : z ∈ physicalClassLabels dLabel vLabel)
    (hpC : p ∈ physicalClassLabels dLabel vLabel)
    (hqC : q ∈ physicalClassLabels dLabel vLabel)
    (hpq : p ≠ q)
    (hpRow : p ∈ row z) (hqRow : q ∈ row z)
    (hside : WitnessSameSideAt order.position z p q) : False := by
  classical
  have honeNot : (1 : Label) ∉ physicalClassLabels dLabel vLabel := by
    intro hmem
    rcases Finset.mem_insert.mp hmem with h | h
    · exact hradius.dLabel_ne_apex h.symm
    rcases Finset.mem_insert.mp h with h' | h'
    · exact hradius.vLabel_ne_apex h'.symm
    · exact absurd h' (by decide)
  have hP0A : pointOf 1 ∈ Finset.univ.image pointOf :=
    Finset.mem_image_of_mem _ (Finset.mem_univ 1)
  have hCsub : (physicalClassLabels dLabel vLabel).image pointOf ⊆
      (Finset.univ.image pointOf).erase (pointOf 1) := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨ℓ, hℓ, rfl⟩
    refine Finset.mem_erase.mpr
      ⟨?_, Finset.mem_image_of_mem _ (Finset.mem_univ ℓ)⟩
    intro heq
    exact honeNot (hreal.injective heq ▸ hℓ)
  have hcommon : ∀ x ∈ (physicalClassLabels dLabel vLabel).image pointOf,
      dist x (pointOf 1) = ρ := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨ℓ, hℓ, rfl⟩
    exact hradius.dist_eq ℓ hℓ
  obtain ⟨w, hw⟩ :=
    exists_strict_separating_vector_of_convexIndep_cocircular
      hconv hP0A hCsub hradius.radius_pos hcommon
  have hzeq : dist (pointOf z) (pointOf p) = dist (pointOf z) (pointOf q) :=
    hreal.equidist z p hpRow q hqRow
  have hsplit :=
    areaForm_sign_split_of_equidistant_witness hradius.radius_pos
      (hradius.dist_eq p hpC) (hradius.dist_eq q hqC) (hradius.dist_eq z hzC)
      (fun h => hpq (hreal.injective h)) hzeq
      (hw _ (Finset.mem_image_of_mem _ hpC))
      (hw _ (Finset.mem_image_of_mem _ hqC))
      (hw _ (Finset.mem_image_of_mem _ hzC))
  rw [← signedArea2_eq_stdOrientation_areaForm,
    ← signedArea2_eq_stdOrientation_areaForm] at hsplit
  rcases hside with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · exact absurd hsplit (not_lt.mpr (le_of_lt (mul_pos_of_neg_of_neg
      (order.signedArea2_neg_of_cyclicTripleAt h₁)
      (order.signedArea2_neg_of_cyclicTripleAt h₂))))
  · exact absurd hsplit (not_lt.mpr (le_of_lt (mul_pos
      (order.signedArea2_pos_of_reverseCyclicTripleAt h₁)
      (order.signedArea2_pos_of_reverseCyclicTripleAt h₂))))

/-- **Class-pair witness-budget kernel.**  The second-apex point is
equidistant from every class pair, so by the perpendicular-bisector apex
bound no two further centers can both carry one class pair in their realized
rows. -/
theorem false_of_classPair_two_hosts
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    {dLabel vLabel : Label} {ρ : ℝ}
    (hradius : PhysicalClassRadius pointOf dLabel vLabel ρ)
    {p q x y : Label}
    (hpC : p ∈ physicalClassLabels dLabel vLabel)
    (hqC : q ∈ physicalClassLabels dLabel vLabel)
    (hpq : p ≠ q) (hxy : x ≠ y) (hx1 : x ≠ 1) (hy1 : y ≠ 1)
    (hpx : p ∈ row x) (hqx : q ∈ row x)
    (hpy : p ∈ row y) (hqy : q ∈ row y) : False := by
  classical
  have hmemA : ∀ ℓ : Label, pointOf ℓ ∈ Finset.univ.image pointOf :=
    fun ℓ => Finset.mem_image_of_mem _ (Finset.mem_univ ℓ)
  have hpq' : pointOf p ≠ pointOf q := fun h => hpq (hreal.injective h)
  have hbound :=
    Dumitrescu.perpBisector_apex_bound hconv (hmemA p) (hmemA q) hpq'
  have h1mem : pointOf 1 ∈ (Finset.univ.image pointOf).filter
      (fun r => dist r (pointOf p) = dist r (pointOf q)) := by
    refine Finset.mem_filter.mpr ⟨hmemA 1, ?_⟩
    rw [dist_comm (pointOf 1) (pointOf p), dist_comm (pointOf 1) (pointOf q),
      hradius.dist_eq p hpC, hradius.dist_eq q hqC]
  have hxmem : pointOf x ∈ (Finset.univ.image pointOf).filter
      (fun r => dist r (pointOf p) = dist r (pointOf q)) :=
    Finset.mem_filter.mpr ⟨hmemA x, hreal.equidist x p hpx q hqx⟩
  have hymem : pointOf y ∈ (Finset.univ.image pointOf).filter
      (fun r => dist r (pointOf p) = dist r (pointOf q)) :=
    Finset.mem_filter.mpr ⟨hmemA y, hreal.equidist y p hpy q hqy⟩
  have hcard : 2 < ((Finset.univ.image pointOf).filter
      (fun r => dist r (pointOf p) = dist r (pointOf q))).card :=
    Finset.two_lt_card.mpr
      ⟨pointOf 1, h1mem, pointOf x, hxmem, pointOf y, hymem,
        fun h => hx1 ((hreal.injective h).symm),
        fun h => hy1 ((hreal.injective h).symm),
        fun h => hxy (hreal.injective h)⟩
  exact absurd hbound (not_le.mpr hcard)

/- ## Source-leaf producer of the class-radius hypothesis -/

/-- The joint-deletion label of a frozen role labeling is not the
second-apex label. -/
theorem FrozenRoleLabeling.deletedLabel_ne_apex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    labeling.e P.jointDeletion.deleted ≠ 1 := by
  intro h
  have hmem := labeling.deletedLabel_mem
  rw [h] at hmem
  exact absurd hmem (by decide)

/-- The `v` label of a frozen role labeling is not the second-apex label. -/
theorem FrozenRoleLabeling.vLabel_ne_apex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    labeling.e P.v ≠ 1 := by
  intro h
  have hmem := labeling.vLabel_mem
  rw [h] at hmem
  exact absurd hmem (by decide)

/-- **Class-radius provenance at the exact-twelve leaf.**  Under a frozen
role labeling of the pentagon-off-class residual, the five physical-class
labels lie at the class radius from the second-apex label.  This is the
metric side condition a physically-bridged membership certificate consumes;
it is supplied by the source leaf, not by row realization. -/
theorem FrozenRoleLabeling.physicalClassRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    PhysicalClassRadius (fun label => pointOf (labeling.e.symm label))
      (labeling.e P.jointDeletion.deleted) (labeling.e P.v) P.rho := by
  refine ⟨P.hrho, labeling.deletedLabel_ne_apex, labeling.vLabel_ne_apex, ?_⟩
  intro ℓ hℓ
  have hclassMem :
      pointOf (labeling.e.symm ℓ) ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rcases Finset.mem_insert.mp hℓ with rfl | hℓ'
    · rw [Equiv.symm_apply_apply, packet.physical_class]
      exact Finset.mem_insert_self _ _
    rcases Finset.mem_insert.mp hℓ' with rfl | hℓ''
    · rw [Equiv.symm_apply_apply]
      exact P.hvClass
    rcases Finset.mem_insert.mp hℓ'' with rfl | hℓ₃
    · rw [show pointOf (labeling.e.symm 6) = P.u.1 from labeling.u]
      exact P.huClass
    rcases Finset.mem_insert.mp hℓ₃ with rfl | hℓ₄
    · rw [show pointOf (labeling.e.symm 8) = packet.xv from labeling.xv,
        packet.physical_class]
      simp
    · rw [Finset.mem_singleton.mp hℓ₄,
        show pointOf (labeling.e.symm 9) = packet.xu from labeling.xu,
        packet.physical_class]
      simp
  have hdist := (mem_selectedClass.mp hclassMem).2
  calc dist (pointOf (labeling.e.symm ℓ)) (pointOf (labeling.e.symm 1))
      = dist (pointOf (labeling.e.symm 1)) (pointOf (labeling.e.symm ℓ)) :=
        dist_comm _ _
    _ = P.rho := by
        rw [show pointOf (labeling.e.symm 1) = S.oppApex2 from
          labeling.secondApex]
        exact hdist

/- ## Proof-carrying physically-bridged cuts -/

/-- One physically-bridged class cut: an on-class witness hosting a class
pair it never separates, or one class pair hosted by two distinct non-apex
centers. -/
inductive PhysicalClassCutData where
  | witness (z p q : Label)
  | budget (x y p q : Label)
deriving DecidableEq, Repr

/-- Role validity of one cut at one `(d, v)` placement. -/
def PhysicalClassCutData.rolesValid (dLabel vLabel : Label) :
    PhysicalClassCutData → Prop
  | .witness z p q =>
      z ∈ physicalClassLabels dLabel vLabel ∧
        p ∈ physicalClassLabels dLabel vLabel ∧
          q ∈ physicalClassLabels dLabel vLabel ∧
            p ≠ q ∧ witnessSameSideAll48 z p q = true
  | .budget x y p q =>
      p ∈ physicalClassLabels dLabel vLabel ∧
        q ∈ physicalClassLabels dLabel vLabel ∧
          p ≠ q ∧ x ≠ y ∧ x ≠ 1 ∧ y ≠ 1

instance (dLabel vLabel : Label) (data : PhysicalClassCutData) :
    Decidable (data.rolesValid dLabel vLabel) := by
  cases data <;> exact inferInstanceAs (Decidable (_ ∧ _))

/-- Check one cut against the positive rows of a concrete certificate. -/
def PhysicalClassCutData.check (dLabel vLabel : Label)
    (choices : List (RowChoice Label)) : PhysicalClassCutData → Bool
  | .witness z p q =>
      decide ((PhysicalClassCutData.witness z p q).rolesValid dLabel vLabel)
        && checkPrimitiveStep choices (.row z p q)
  | .budget x y p q =>
      decide ((PhysicalClassCutData.budget x y p q).rolesValid dLabel vLabel)
        && (checkPrimitiveStep choices (.row x p q)
          && checkPrimitiveStep choices (.row y p q))

/-- A learned positive-row cut carrying its physically-bridged semantic
proof at one `(d, v)` placement.  Beyond the source-order interface, the
refutation consumes the class-radius hypothesis, which the source leaf
supplies through `FrozenRoleLabeling.physicalClassRadius`. -/
structure PhysicalClassPositiveNogood (dLabel vLabel : Label) where
  choices : List (RowChoice Label)
  refutes :
    ∀ {row : RowPattern Label} {pointOf : Label → ℝ²} {ρ : ℝ},
      Realizes row pointOf →
      (order : FrozenBoundaryOrder pointOf) →
      FrozenForcedSecondCapOrder order.position →
      ConvexIndep (Finset.univ.image pointOf) →
      PhysicalClassRadius pointOf dLabel vLabel ρ →
      PositiveRowsMatch row choices → False

private theorem row_pair_of_checkPrimitiveStep
    {P : RowPattern Label} {choices : List (RowChoice Label)}
    (hrows : PositiveRowsMatch P choices) {c a b : Label}
    (hcheck : checkPrimitiveStep choices (.row c a b) = true) :
    a ∈ P c ∧ b ∈ P c := by
  rw [checkPrimitiveStep, List.any_eq_true] at hcheck
  rcases hcheck with ⟨choice, hchoice, hdec⟩
  obtain ⟨hcenter, ha, hb⟩ := of_decide_eq_true hdec
  have hsub := hrows choice hchoice
  rw [hcenter] at hsub
  exact ⟨hsub ha, hsub hb⟩

/-- A checked physically-bridged cut yields a proof-carrying nogood. -/
def PhysicalClassPositiveNogood.ofCut (dLabel vLabel : Label)
    (choices : List (RowChoice Label)) (data : PhysicalClassCutData)
    (hcheck : data.check dLabel vLabel choices = true) :
    PhysicalClassPositiveNogood dLabel vLabel where
  choices := choices
  refutes := by
    intro row pointOf ρ hreal order hforced hconv hradius hpositive
    cases data with
    | witness z p q =>
        simp only [PhysicalClassCutData.check, Bool.and_eq_true] at hcheck
        obtain ⟨hzC, hpC, hqC, hpq, hside⟩ := of_decide_eq_true hcheck.1
        obtain ⟨hpRow, hqRow⟩ :=
          row_pair_of_checkPrimitiveStep hpositive hcheck.2
        exact false_of_hostedClassPair_of_witnessSameSide hreal order hconv
          hradius hzC hpC hqC hpq hpRow hqRow
          (order.witnessSameSideAt hforced hside)
    | budget x y p q =>
        simp only [PhysicalClassCutData.check, Bool.and_eq_true] at hcheck
        obtain ⟨hpC, hqC, hpq, hxy, hx1, hy1⟩ := of_decide_eq_true hcheck.1
        obtain ⟨hpx, hqx⟩ :=
          row_pair_of_checkPrimitiveStep hpositive hcheck.2.1
        obtain ⟨hpy, hqy⟩ :=
          row_pair_of_checkPrimitiveStep hpositive hcheck.2.2
        exact false_of_classPair_two_hosts hreal hconv hradius
          hpC hqC hpq hxy hx1 hy1 hpx hqx hpy hqy

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
