/-
  Order-only negative control for the card-six endpoint producer.

  This file deliberately stops at the finite boundary projection.  It uses
  the production definitions of `SurplusCOMPGBank.btw` and `separatedPair`,
  but does not import the B1 production context, metric packets, or any
  theorem containing `sorry`.  Consequently it is not a `B1GlobalTransportContext`
  and does not claim Euclidean realizability.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation

/-! A finite order/incidence projection of the card-six endpoint residual. -/

namespace Problem97
namespace B1EndpointProducerFiniteCountermodel

open ATailFrontierLiveClosure

abbrev I := Fin 18

def s : I := 0
def d1 : I := 1
def bc : I := 2
def d2 : I := 3
def u0 : I := 4
def v0 : I := 5
def o1 : I := 6
def bu : I := 7
def u1 : I := 8
def apex : I := 9
def v1 : I := 10
def bv : I := 11
def c0 : I := 12
def c1 : I := 13
def uL : I := 14
def uR : I := 15
def vL : I := 16
def vR : I := 17

def deletedPair : Finset I := {d1, d2}
def uPair : Finset I := {u0, u1}
def vPair : Finset I := {v0, v1}
def physicalClass : Finset I := deletedPair ∪ uPair ∪ vPair

def exactRows : Finset I × Finset I × Finset I :=
  ({d1, d2, c0, c1}, {u0, u1, uL, uR}, {v0, v1, vL, vR})

theorem physicalClass_card : physicalClass.card = 6 := by
  decide

theorem physicalClass_is_three_pair_cover :
    physicalClass = {d1, d2, u0, u1, v0, v1} := by
  decide

theorem exact_rows_card_four :
    ({d1, d2, c0, c1} : Finset I).card = 4 ∧
      ({u0, u1, uL, uR} : Finset I).card = 4 ∧
      ({v0, v1, vL, vR} : Finset I).card = 4 := by
  decide

theorem deleted_u_v_pairs_disjoint :
    Disjoint deletedPair uPair ∧ Disjoint deletedPair vPair ∧ Disjoint uPair vPair := by
  decide

theorem separated_deleted : separatedPair apex bc d1 d2 := by
  unfold separatedPair SurplusCOMPGBank.btw
  decide

theorem separated_u : separatedPair apex bu u0 u1 := by
  unfold separatedPair SurplusCOMPGBank.btw
  decide

theorem separated_v : separatedPair apex bv v0 v1 := by
  unfold separatedPair SurplusCOMPGBank.btw
  decide

theorem separated_deleted_exchange : separatedPair d1 d2 apex bc := by
  exact separatedPair_exchange (by decide) (by decide) (by decide) (by decide)
    separated_deleted

theorem separated_u_exchange : separatedPair u0 u1 apex bu := by
  exact separatedPair_exchange (by decide) (by decide) (by decide) (by decide)
    separated_u

theorem separated_v_exchange : separatedPair v0 v1 apex bv := by
  exact separatedPair_exchange (by decide) (by decide) (by decide) (by decide)
    separated_v

theorem deleted_blocker_between : SurplusCOMPGBank.btw d1 d2 bc := by
  decide

/- The exact order predicate appearing in `B1SliceSameBoundaryArc`, with
  boundary indices already substituted.  This is intentionally a local
  projection so the file stays independent of the B1 production imports. -/
def finiteSameBoundaryArc (cut source : I) (slice : Finset I) : Prop :=
  ∀ ix iy : I, ix ∈ slice → iy ∈ slice → ix ≠ iy →
    (SurplusCOMPGBank.btw cut source ix ↔
      SurplusCOMPGBank.btw cut source iy)

def arcU : Prop := finiteSameBoundaryArc apex bu uPair
def arcV : Prop := finiteSameBoundaryArc apex bv vPair

theorem not_arcU : ¬ arcU := by
  intro h
  have hbits := h u0 u1 (by simp [uPair]) (by simp [uPair]) (by decide)
  have hu0 : ¬ SurplusCOMPGBank.btw apex bu u0 := by decide
  have hu1 : SurplusCOMPGBank.btw apex bu u1 := by decide
  exact hu0 (hbits.mpr hu1)

theorem not_arcV : ¬ arcV := by
  intro h
  have hbits := h v0 v1 (by simp [vPair]) (by simp [vPair]) (by decide)
  have hv0 : ¬ SurplusCOMPGBank.btw apex bv v0 := by decide
  have hv1 : SurplusCOMPGBank.btw apex bv v1 := by decide
  exact hv0 (hbits.mpr hv1)

theorem not_both_arcs : ¬ (arcU ∧ arcV) := by
  intro h
  exact not_arcU h.1

/- The no-third statement is an abstract atom, not an existential over the
  ambient boundary: it records only the normal-form output bit. -/
def thirdJointDeletion : Prop := False

theorem no_third_joint_deletion : ¬ thirdJointDeletion := by
  simp [thirdJointDeletion]

end B1EndpointProducerFiniteCountermodel
end Problem97
