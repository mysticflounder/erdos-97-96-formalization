import Erdos9796Proof.P97.U5GlobalIncidenceSupport

/-!
# Scratch: exact cardinality adapter for the F2 three-row bank deficit

The closest current bank terminal for a q-critical output is
`U5QCriticalTripleClass.two_triple_points_incompatibility`.  This file packages
its two named support incidences as the single producer-facing cardinality
field

```text
2 ≤ card (B ∩ T).
```

The center is required to be a point of the dangerous triple.  Hence it is
automatically different from the dangerous center; no independent center-role
assumption is hidden in the adapter.

More importantly, turning the same incompatibility around gives a positive
uniform producer.  A q-critical row at a dangerous-triple center has at most
one dangerous-triple point and therefore at least two support points outside
the triple.  The existing two-circle bound gives the same two-off-triple
conclusion for an exact q-deleted four-row.  Thus the global-K4 split at an
actual F2 support-heavy center always produces a two-point off-triple
continuation, regardless of which side of the split occurs.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2ThreeRowBankDeficitsScratch

attribute [local instance] Classical.propDecidable

/-- A q-critical class centered at a dangerous-triple point cannot contain
two distinct points of that dangerous triple.

This is the exact one-field conditional terminal used by the F2 support-heavy
deficit audit. -/
theorem false_of_qCritical_inter_dangerous_card_ge_two
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hcenterT : center ∈ T)
    (K : U5QCriticalTripleClass D q center B)
    (hhits : 2 ≤ (B ∩ T).card) :
    False := by
  have hcenter_ne_p : center ≠ p :=
    (Finset.mem_erase.mp (htriple.T_subset hcenterT)).1
  have hone : 1 < (B ∩ T).card := by omega
  rcases Finset.one_lt_card.mp hone with
    ⟨u, hu, v, hv, huv⟩
  exact U5QCriticalTripleClass.two_triple_points_incompatibility
    htriple K hcenter_ne_p
    (Finset.mem_inter.mp hu).2
    (Finset.mem_inter.mp hv).2
    huv
    (Finset.mem_inter.mp hu).1
    (Finset.mem_inter.mp hv).1

/-- The contradiction consumer in upper-bound form. -/
theorem qCritical_inter_dangerous_card_le_one
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hcenterT : center ∈ T)
    (K : U5QCriticalTripleClass D q center B) :
    (B ∩ T).card ≤ 1 := by
  by_contra hle
  exact false_of_qCritical_inter_dangerous_card_ge_two
    htriple hcenterT K (by omega)

/-- A q-critical row at a dangerous-triple center has at least two support
points outside that dangerous triple. -/
theorem qCritical_two_le_support_sdiff_dangerous_card
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hcenterT : center ∈ T)
    (K : U5QCriticalTripleClass D q center B) :
    2 ≤ (B \ T).card := by
  have hinter := qCritical_inter_dangerous_card_le_one
    htriple hcenterT K
  have hsplit := Finset.card_sdiff_add_card_inter B T
  rw [K.card_three] at hsplit
  omega

/-- An exact q-deleted four-row at a dangerous-triple center also has at
least two support points outside that dangerous triple. -/
theorem qDeleted_two_le_support_sdiff_dangerous_card
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hcenterT : center ∈ T)
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    2 ≤ (B \ T).card := by
  have hcenter_ne_p : center ≠ p :=
    (Finset.mem_erase.mp (htriple.T_subset hcenterT)).1
  have hlarge :=
    U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
      htriple K hcenter_ne_p
  have hinter : (B ∩ T).card ≤ 2 := by
    apply le_trans (Finset.card_le_card ?_) hlarge
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hx).1,
        Finset.mem_insert_of_mem (Finset.mem_inter.mp hx).2⟩
  have hsplit := Finset.card_sdiff_add_card_inter B T
  rw [hcard] at hsplit
  omega

#print axioms false_of_qCritical_inter_dangerous_card_ge_two
#print axioms qCritical_inter_dangerous_card_le_one
#print axioms qCritical_two_le_support_sdiff_dangerous_card
#print axioms qDeleted_two_le_support_sdiff_dangerous_card

end ATailRF2ThreeRowBankDeficitsScratch
end Problem97
