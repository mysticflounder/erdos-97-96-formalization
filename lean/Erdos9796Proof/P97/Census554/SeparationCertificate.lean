/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.GroupTheory.Perm.Fin
import Erdos9796Proof.P97.Census554.SeparationMirror

/-!
# Executable separation certificates for Census-554 rows

This file gives the finite checker layer below the cyclic-separation
consumers.  A closure path is a list of primitive row equalities and edge
flips.  Its validity mentions only membership in the finite row pattern and
equality of `Fin 11` data, so it is decidable without constructing a
proof-valued `EdgeClosure` witness.  Soundness turns a validated path into the
corresponding closure proof.

A card-11 certificate supplies one shared-pair datum for each of the 72
internal orders in each orientation.  `Card11SeparationCertificate.check`
enumerates both finite surfaces.  Thus generated certificates can establish
the check by computation while the theorem below keeps the geometric
contradiction on the trusted proof side.
-/

namespace Problem97
namespace Census554
namespace SeparationCore
namespace SeparationCertificate

open EqualityCore
open scoped EuclideanGeometry

/-- A primitive, proof-free generator of equality closure. -/
inductive PrimitiveEqualityStep where
  /-- Two oriented edges in one row have equal length. -/
  | row (center first second : Fin 11)
  /-- Reversing an oriented edge preserves its length. -/
  | flip (first second : Fin 11)
deriving DecidableEq, Repr

/-- Source edge of a primitive equality step. -/
def PrimitiveEqualityStep.source : PrimitiveEqualityStep → Edge (Fin 11)
  | .row center first _ => (center, first)
  | .flip first second => (first, second)

/-- Target edge of a primitive equality step. -/
def PrimitiveEqualityStep.target : PrimitiveEqualityStep → Edge (Fin 11)
  | .row center _ second => (center, second)
  | .flip first second => (second, first)

/-- The executable local check for a primitive equality step. -/
def PrimitiveEqualityStep.check
    (P : RowPattern (Fin 11)) : PrimitiveEqualityStep → Bool
  | .row center first second =>
      decide (first ∈ P center) && decide (second ∈ P center)
  | .flip _ _ => true

/-- Propositional reading of the primitive-step checker. -/
def PrimitiveEqualityStep.Valid
    (P : RowPattern (Fin 11)) (step : PrimitiveEqualityStep) : Prop :=
  step.check P = true

/-- A valid primitive step generates an `EdgeClosure` equality. -/
theorem PrimitiveEqualityStep.edgeClosure_of_valid
    {P : RowPattern (Fin 11)} (step : PrimitiveEqualityStep)
    (hvalid : step.Valid P) :
    EdgeClosure P step.source step.target := by
  cases step with
  | row center first second =>
      simp only [PrimitiveEqualityStep.Valid, PrimitiveEqualityStep.check,
        Bool.and_eq_true, decide_eq_true_eq] at hvalid
      exact EdgeClosure.row center first second hvalid.1 hvalid.2
  | flip first second =>
      exact EdgeClosure.flip first second

/-- Executably check that primitive steps form a composable path between two
edges. -/
def checkStepChain (P : RowPattern (Fin 11)) :
    Edge (Fin 11) → List PrimitiveEqualityStep → Edge (Fin 11) → Bool
  | first, [], last => decide (first = last)
  | first, step :: steps, last =>
      decide (first = step.source) && step.check P &&
        checkStepChain P step.target steps last

/-- Propositional reading of the step-chain checker. -/
def ValidStepChain (P : RowPattern (Fin 11))
    (first : Edge (Fin 11)) (steps : List PrimitiveEqualityStep)
    (last : Edge (Fin 11)) : Prop :=
  checkStepChain P first steps last = true

/-- Every valid finite step chain yields the equality closure it encodes. -/
theorem edgeClosure_of_validStepChain
    {P : RowPattern (Fin 11)} {first last : Edge (Fin 11)}
    {steps : List PrimitiveEqualityStep}
    (hvalid : ValidStepChain P first steps last) :
    EdgeClosure P first last := by
  induction steps generalizing first with
  | nil =>
      simp only [ValidStepChain, checkStepChain, decide_eq_true_eq] at hvalid
      subst last
      exact EdgeClosure.refl first
  | cons step steps ih =>
      simp only [ValidStepChain, checkStepChain, Bool.and_eq_true,
        decide_eq_true_eq] at hvalid
      rcases hvalid with ⟨⟨hfirst, hstep⟩, htail⟩
      subst first
      exact EdgeClosure.trans
        (step.edgeClosure_of_valid hstep) (ih htail)

/-- Finite data for a path between two explicitly recorded oriented edges. -/
structure ClosurePathData where
  first : Edge (Fin 11)
  last : Edge (Fin 11)
  steps : List PrimitiveEqualityStep
deriving DecidableEq, Repr

/-- The executable validity predicate for closure-path data. -/
def ClosurePathData.Valid (P : RowPattern (Fin 11))
    (path : ClosurePathData) : Prop :=
  ValidStepChain P path.first path.steps path.last

/-- A path datum certifies prescribed endpoints as well as its internal
steps. -/
def ClosurePathData.Certifies (P : RowPattern (Fin 11))
    (path : ClosurePathData) (first last : Edge (Fin 11)) : Prop :=
  path.first = first ∧ path.last = last ∧ path.Valid P

/-- Executable form of `ClosurePathData.Certifies`. -/
def ClosurePathData.checkCertifies (P : RowPattern (Fin 11))
    (path : ClosurePathData) (first last : Edge (Fin 11)) : Bool :=
  (decide (path.first = first) && decide (path.last = last)) &&
    checkStepChain P path.first path.steps path.last

/-- Soundness of the executable closure-path check. -/
theorem ClosurePathData.certifies_of_checkCertifies
    {P : RowPattern (Fin 11)} (path : ClosurePathData)
    {first last : Edge (Fin 11)}
    (hcheck : path.checkCertifies P first last = true) :
    path.Certifies P first last := by
  simp only [ClosurePathData.checkCertifies, Bool.and_eq_true,
    decide_eq_true_eq] at hcheck
  exact ⟨hcheck.1.1, hcheck.1.2, hcheck.2⟩

/-- A validated path datum gives the requested equality closure. -/
theorem ClosurePathData.edgeClosure_of_certifies
    {P : RowPattern (Fin 11)} (path : ClosurePathData)
    {first last : Edge (Fin 11)} (hvalid : path.Certifies P first last) :
    EdgeClosure P first last := by
  rcases hvalid with ⟨rfl, rfl, hpath⟩
  exact edgeClosure_of_validStepChain hpath

/-- Proof-free data for a shared-pair separation core.  The two paths encode
the two equality-closure obligations; all label inequalities are checked by
the validity predicate below. -/
structure SharedPairData where
  firstCenter : Fin 11
  secondCenter : Fin 11
  firstPoint : Fin 11
  secondPoint : Fin 11
  firstCenterPath : ClosurePathData
  secondCenterPath : ClosurePathData
deriving DecidableEq, Repr

/-- Decidable structural validity of shared-pair data. -/
def SharedPairData.Valid (P : RowPattern (Fin 11))
    (data : SharedPairData) : Prop :=
  data.firstCenter ≠ data.secondCenter ∧
  data.secondPoint ≠ data.firstCenter ∧
  data.secondPoint ≠ data.secondCenter ∧
  data.firstPoint ≠ data.secondPoint ∧
  data.firstCenterPath.Certifies P
    (data.firstCenter, data.firstPoint)
    (data.firstCenter, data.secondPoint) ∧
  data.secondCenterPath.Certifies P
    (data.secondCenter, data.firstPoint)
    (data.secondCenter, data.secondPoint)

/-- The separation relation attached to proof-free shared-pair data. -/
def SharedPairData.SatisfiedBy (data : SharedPairData)
    (indexOf : Fin 11 → Fin 11) : Prop :=
  SurplusCOMPGBank.btw
      (indexOf data.firstCenter) (indexOf data.secondCenter)
      (indexOf data.firstPoint) ↔
    ¬ SurplusCOMPGBank.btw
      (indexOf data.firstCenter) (indexOf data.secondCenter)
      (indexOf data.secondPoint)

/-- Validity relative to an order additionally checks, by computation, that
the order violates the required separation relation. -/
def SharedPairData.ValidFor
    (P : RowPattern (Fin 11)) (data : SharedPairData)
    (indexOf : Fin 11 → Fin 11) : Prop :=
  data.Valid P ∧ ¬ data.SatisfiedBy indexOf

/-- Executable structural check for shared-pair data. -/
def SharedPairData.checkValid
    (P : RowPattern (Fin 11)) (data : SharedPairData) : Bool :=
  (decide (
      data.firstCenter ≠ data.secondCenter ∧
      data.secondPoint ≠ data.firstCenter ∧
      data.secondPoint ≠ data.secondCenter ∧
      data.firstPoint ≠ data.secondPoint) &&
    data.firstCenterPath.checkCertifies P
      (data.firstCenter, data.firstPoint)
      (data.firstCenter, data.secondPoint)) &&
    data.secondCenterPath.checkCertifies P
      (data.secondCenter, data.firstPoint)
      (data.secondCenter, data.secondPoint)

/-- Soundness of the executable structural check. -/
theorem SharedPairData.valid_of_checkValid
    {P : RowPattern (Fin 11)} (data : SharedPairData)
    (hcheck : data.checkValid P = true) : data.Valid P := by
  simp only [SharedPairData.checkValid, Bool.and_eq_true] at hcheck
  have hinequalities := of_decide_eq_true hcheck.1.1
  exact ⟨hinequalities.1, hinequalities.2.1, hinequalities.2.2.1,
    hinequalities.2.2.2,
    data.firstCenterPath.certifies_of_checkCertifies hcheck.1.2,
    data.secondCenterPath.certifies_of_checkCertifies hcheck.2⟩

/-- Executable check that valid shared-pair data violates a chosen order. -/
def SharedPairData.checkViolation
    (data : SharedPairData) (indexOf : Fin 11 → Fin 11) : Bool :=
  decide (SurplusCOMPGBank.btw
      (indexOf data.firstCenter) (indexOf data.secondCenter)
      (indexOf data.firstPoint)) ==
    decide (SurplusCOMPGBank.btw
      (indexOf data.firstCenter) (indexOf data.secondCenter)
      (indexOf data.secondPoint))

/-- The Boolean violation check is the negation of `SatisfiedBy`.  Indeed,
`SatisfiedBy` says that the two betweenness truth values are opposite, while
the checker accepts exactly when they agree. -/
theorem SharedPairData.not_satisfiedBy_of_checkViolation
    (data : SharedPairData) (indexOf : Fin 11 → Fin 11)
    (hcheck : data.checkViolation indexOf = true) :
    ¬ data.SatisfiedBy indexOf := by
  unfold SharedPairData.checkViolation SharedPairData.SatisfiedBy at *
  by_cases hfirst : SurplusCOMPGBank.btw
    (indexOf data.firstCenter) (indexOf data.secondCenter)
    (indexOf data.firstPoint) <;>
  by_cases hsecond : SurplusCOMPGBank.btw
    (indexOf data.firstCenter) (indexOf data.secondCenter)
    (indexOf data.secondPoint) <;>
  simp_all

/-- Executable check that shared-pair data is structurally valid and violates
a chosen order. -/
def SharedPairData.checkValidFor
    (P : RowPattern (Fin 11)) (data : SharedPairData)
    (indexOf : Fin 11 → Fin 11) : Bool :=
  data.checkValid P && data.checkViolation indexOf

/-- Soundness of the executable order-relative check. -/
theorem SharedPairData.validFor_of_checkValidFor
    {P : RowPattern (Fin 11)} (data : SharedPairData)
    (indexOf : Fin 11 → Fin 11)
    (hcheck : data.checkValidFor P indexOf = true) :
    data.ValidFor P indexOf := by
  simp only [SharedPairData.checkValidFor, Bool.and_eq_true] at hcheck
  exact ⟨data.valid_of_checkValid hcheck.1,
    data.not_satisfiedBy_of_checkViolation indexOf hcheck.2⟩

/-- Turn validated finite shared-pair data into the proof-valued geometric
core. -/
def SharedPairData.toCore {P : RowPattern (Fin 11)}
    (data : SharedPairData) (hvalid : data.Valid P) :
    SharedPairSeparationCore P :=
  { firstCenter := data.firstCenter
    secondCenter := data.secondCenter
    firstPoint := data.firstPoint
    secondPoint := data.secondPoint
    centers_ne := hvalid.1
    secondPoint_ne_firstCenter := hvalid.2.1
    secondPoint_ne_secondCenter := hvalid.2.2.1
    points_ne := hvalid.2.2.2.1
    firstCenter_eq := data.firstCenterPath.edgeClosure_of_certifies
      hvalid.2.2.2.2.1
    secondCenter_eq := data.secondCenterPath.edgeClosure_of_certifies
      hvalid.2.2.2.2.2 }

/-- A datum valid for an order supplies the rejected geometric core required
by the separation consumer. -/
theorem SharedPairData.exists_core_not_satisfiedBy
    {P : RowPattern (Fin 11)} (data : SharedPairData)
    (indexOf : Fin 11 → Fin 11) (hvalid : data.ValidFor P indexOf) :
    ∃ core : SharedPairSeparationCore P, ¬ core.SatisfiedBy indexOf := by
  refine ⟨data.toCore hvalid.1, ?_⟩
  simpa only [SharedPairSeparationCore.SatisfiedBy,
    SharedPairData.SatisfiedBy, SharedPairData.toCore] using hvalid.2

/-- The unique permutation of `Fin 1`, represented as executable unit data. -/
def permFinOneEquivPUnit : Equiv.Perm (Fin 1) ≃ PUnit.{1} where
  toFun _ := PUnit.unit
  invFun _ := Equiv.refl _
  left_inv permutation :=
    (Equiv.Perm.subsingleton_eq_refl permutation).symm
  right_inv u := by
    cases u
    rfl

/-- Executable two-element permutation code. -/
def permFinTwoEquivFinTwo : Equiv.Perm (Fin 2) ≃ Fin 2 :=
  (Equiv.Perm.decomposeFin :
      Equiv.Perm (Fin 2) ≃ Fin 2 × Equiv.Perm (Fin 1)) |>.trans
    ((Equiv.prodCongr (Equiv.refl (Fin 2)) permFinOneEquivPUnit).trans
      (Equiv.prodPUnit (Fin 2)))

/-- Executable six-element permutation code. -/
def permFinThreeEquivFinSix : Equiv.Perm (Fin 3) ≃ Fin 6 :=
  (Equiv.Perm.decomposeFin :
      Equiv.Perm (Fin 3) ≃ Fin 3 × Equiv.Perm (Fin 2)) |>.trans
    ((Equiv.prodCongr (Equiv.refl (Fin 3)) permFinTwoEquivFinTwo).trans
      (finProdFinEquiv : Fin 3 × Fin 2 ≃ Fin 6))

/-- Canonical executable enumeration of the `2! * 3! * 3! = 72` card-11
internal orders.  This uses the constructive permutation decomposition rather
than `Fintype.equivFin`, so generated certificates contain only their 144
shared-pair data entries and no proof-bearing enumeration. -/
def card11InternalOrderEquivFin72 : Card11InternalOrder ≃ Fin 72 :=
  (Equiv.prodCongr permFinTwoEquivFinTwo
      ((Equiv.prodCongr permFinThreeEquivFinSix
        permFinThreeEquivFinSix).trans
          (finProdFinEquiv : Fin 6 × Fin 6 ≃ Fin 36))) |>.trans
    (finProdFinEquiv : Fin 2 × Fin 36 ≃ Fin 72)

/-- Finite certificate data for all direct and mirrored internal orders.  The
canonical equivalence above prevents omission or duplication: every internal
order occurs at exactly one of the 72 executable indices. -/
structure Card11SeparationCertificate where
  direct : Fin 72 → SharedPairData
  mirror : Fin 72 → SharedPairData

/-- The executable list of the 72 certificate indices. -/
def card11CertificateIndices : List (Fin 72) := List.ofFn id

@[simp] theorem mem_card11CertificateIndices (i : Fin 72) :
    i ∈ card11CertificateIndices := by
  unfold card11CertificateIndices
  exact List.mem_ofFn.mpr ⟨i, rfl⟩

/-- Executable validation of all 72 direct and all 72 mirrored orders. -/
def Card11SeparationCertificate.check
    (P : RowPattern (Fin 11)) (certificate : Card11SeparationCertificate) : Bool :=
  (card11CertificateIndices.all fun i =>
      (certificate.direct i).checkValidFor P
        (card11IndexEquiv (card11InternalOrderEquivFin72.symm i))) &&
    (card11CertificateIndices.all fun i =>
      (certificate.mirror i).checkValidFor P
        (card11MirrorIndexEquiv (card11InternalOrderEquivFin72.symm i)))

/-- A successful executable check gives the two quantified rejection
predicates expected by the geometric contradiction consumer. -/
theorem Card11SeparationCertificate.rejectsEveryDirectOrMirrorOrder_of_check
    {P : RowPattern (Fin 11)} (certificate : Card11SeparationCertificate)
    (hcheck : certificate.check P = true) :
    RejectsEveryCard11DirectOrMirrorOrder P := by
  rw [Card11SeparationCertificate.check, Bool.and_eq_true] at hcheck
  constructor
  · intro order _
    let i : Fin 72 := card11InternalOrderEquivFin72 order
    have hchecked := List.all_eq_true.mp hcheck.1 i
      (mem_card11CertificateIndices i)
    have hvalid := (certificate.direct i).validFor_of_checkValidFor
      (card11IndexEquiv (card11InternalOrderEquivFin72.symm i)) hchecked
    have horder : card11InternalOrderEquivFin72.symm i = order := by
      change card11InternalOrderEquivFin72.symm
        (card11InternalOrderEquivFin72 order) = order
      exact card11InternalOrderEquivFin72.symm_apply_apply order
    simpa only [horder] using
      (certificate.direct i).exists_core_not_satisfiedBy
        (card11IndexEquiv (card11InternalOrderEquivFin72.symm i)) hvalid
  · intro order _
    let i : Fin 72 := card11InternalOrderEquivFin72 order
    have hchecked := List.all_eq_true.mp hcheck.2 i
      (mem_card11CertificateIndices i)
    have hvalid := (certificate.mirror i).validFor_of_checkValidFor
      (card11MirrorIndexEquiv (card11InternalOrderEquivFin72.symm i)) hchecked
    have horder : card11InternalOrderEquivFin72.symm i = order := by
      change card11InternalOrderEquivFin72.symm
        (card11InternalOrderEquivFin72 order) = order
      exact card11InternalOrderEquivFin72.symm_apply_apply order
    simpa only [horder] using
      (certificate.mirror i).exists_core_not_satisfiedBy
        (card11MirrorIndexEquiv (card11InternalOrderEquivFin72.symm i)) hvalid

/-- End-to-end consumer for a checked separation certificate. -/
theorem false_of_card11SeparationCertificate
    {P : RowPattern (Fin 11)} {pointOf : Fin 11 → ℝ²}
    (certificate : Card11SeparationCertificate)
    (hcheck : certificate.check P = true)
    (hreal : Realizes P pointOf)
    (labeling : Card11DirectOrMirrorCcwLabeling pointOf) : False :=
  false_of_rejectsEveryCard11DirectOrMirrorOrder
    (certificate.rejectsEveryDirectOrMirrorOrder_of_check hcheck)
    hreal labeling

end SeparationCertificate
end SeparationCore
end Census554
end Problem97
