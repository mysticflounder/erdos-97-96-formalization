/-
Scratch-only source-validity adapters for the general-n U5 schema audit.

These lemmas justify the precise interpretation used by the finite matcher:
an arbitrary selected exact-four row may itself be packaged as a q-deleted
class, or (after erasing a selected q) as a q-critical triple.  No claim about
the complete ambient radius class is made or needed.
-/
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Selected-row adapters for the scratch general-n U5 schema audit

These scratch-only lemmas prove that the signed incidence vocabulary used by
the finite matcher constructs the theorem-facing U5 packets from selected
four-row data.  They do not identify a selected row with a complete ambient
radius class.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97.GeneralNU5SchemaCoverage

/-- A selected four-row avoiding `q` is a theorem-facing q-deleted class.

This is a statement about the selected support itself, not the complete
ambient radius class at `center`. -/
def qDeletedClassOfSelectedFour
    {D : CounterexampleData} {q center : ℝ²}
    (K : SelectedFourClass D.A center) (hq : q ∉ K.support) :
    U5QDeletedK4Class D q center K.support where
  subset := by
    intro y hy
    have hyA : y ∈ D.A := K.support_subset_A hy
    have hyq : y ≠ q := by
      intro h
      subst y
      exact hq hy
    have hycenter : y ≠ center := by
      intro h
      subst y
      exact K.center_not_mem hy
    change y ∈ (D.A.erase q).erase center
    exact Finset.mem_erase.mpr
      ⟨hycenter, Finset.mem_erase.mpr ⟨hyq, hyA⟩⟩
  card_four := by rw [K.support_card]
  q_not_mem := hq
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- A selected four-row containing `q`, with `q` erased, is a theorem-facing
q-critical triple.

Again, this packages only the selected support.  In particular it does not
assert that the row is the complete ambient radius class. -/
noncomputable def qCriticalTripleClassOfSelectedFour
    {D : CounterexampleData} {q center : ℝ²}
    (K : SelectedFourClass D.A center) (hq : q ∈ K.support) :
    U5QCriticalTripleClass D q center (K.support.erase q) where
  subset := by
    intro y hy
    have hySupport : y ∈ K.support := (Finset.mem_erase.mp hy).2
    have hyq : y ≠ q := (Finset.mem_erase.mp hy).1
    have hyA : y ∈ D.A := K.support_subset_A hySupport
    have hycenter : y ≠ center := by
      intro h
      subst y
      exact K.center_not_mem hySupport
    change y ∈ (D.A.erase q).erase center
    exact Finset.mem_erase.mpr
      ⟨hycenter, Finset.mem_erase.mpr ⟨hyq, hyA⟩⟩
  card_three := by
    rw [Finset.card_erase_of_mem hq, K.support_card]
  q_radius_pos := by
    rw [K.support_eq_radius q hq]
    exact K.radius_pos
  same_q_radius := by
    intro y hy
    have hySupport : y ∈ K.support := (Finset.mem_erase.mp hy).2
    exact (K.support_eq_radius y hySupport).trans
      (K.support_eq_radius q hq).symm

/-- A selected row through `q` constructs the dangerous base triple used by
the U5 bank.  Strict convexity of the ambient carrier supplies the only
non-incidence field. -/
noncomputable def dangerousTripleOfSelectedFour
    {D : CounterexampleData} {q p : ℝ²}
    (hp : p ∈ D.A) (K : SelectedFourClass D.A p)
    (hq : q ∈ K.support) :
    U5DangerousTriple D q p (K.support.erase q) where
  q_mem := K.support_subset_A hq
  p_mem := hp
  p_ne_q := by
    intro hpq
    subst q
    exact K.center_not_mem hq
  T_subset := by
    intro y hy
    have hySupport : y ∈ K.support := (Finset.mem_erase.mp hy).2
    have hyq : y ≠ q := (Finset.mem_erase.mp hy).1
    have hyA : y ∈ D.A := K.support_subset_A hySupport
    have hyp : y ≠ p := by
      intro h
      subst y
      exact K.center_not_mem hySupport
    change y ∈ (D.A.erase q).erase p
    exact Finset.mem_erase.mpr
      ⟨hyp, Finset.mem_erase.mpr ⟨hyq, hyA⟩⟩
  T_card := by
    rw [Finset.card_erase_of_mem hq, K.support_card]
  T_noncollinear := by
    have hsub : K.support.erase q ⊆ D.A := by
      intro y hy
      exact K.support_subset_A (Finset.mem_of_mem_erase hy)
    exact (D.convex.mono hsub).not_collinear_of_card_ge_three (by
      rw [Finset.card_erase_of_mem hq, K.support_card])
  q_radius_pos := by
    rw [K.support_eq_radius q hq]
    exact K.radius_pos
  T_same_radius := by
    intro y hy
    have hySupport : y ∈ K.support := (Finset.mem_erase.mp hy).2
    exact (K.support_eq_radius y hySupport).trans
      (K.support_eq_radius q hq).symm

/-- Pure carrier bookkeeping for the bank's selected-candidate packet. -/
def selectedCandidateSkeletonOfDistinctCarrier
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (huA : u ∈ D.A) (huq : u ≠ q) (hup : u ≠ p) (huT : u ∉ T) :
    U5SelectedCandidateSkeleton D q p T u where
  candidate_mem := by
    change u ∈ (D.A.erase q).erase p
    exact Finset.mem_erase.mpr
      ⟨hup, Finset.mem_erase.mpr ⟨huq, huA⟩⟩
  candidate_notin_T := huT

#print axioms qDeletedClassOfSelectedFour
#print axioms qCriticalTripleClassOfSelectedFour
#print axioms dangerousTripleOfSelectedFour
#print axioms selectedCandidateSkeletonOfDistinctCarrier

end Problem97.GeneralNU5SchemaCoverage
