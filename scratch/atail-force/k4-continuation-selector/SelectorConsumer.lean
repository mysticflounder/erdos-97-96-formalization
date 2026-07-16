import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Scratch: exact consumer for one selected K4 continuation row

This file does not produce the continuation membership.  It checks that once
one new selected row, centered at a second point of an ordered cap, repeats an
outside pair already carried by a first cap-center row, the current production
`outsidePair_unique_capCenter` theorem closes immediately.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace K4ContinuationSelectorScratch

/-- Two selected four-classes centered at distinct ordered-cap points cannot
repeat a pair outside that cap.  In the ATAIL application the first center is
the first opposite apex, the second is one strict-interior continuation center,
and `a,b` are the retained off-cap common pair.

The missing producer is therefore only the support-membership selector for one
continuation row; this theorem is its exact existing-consumer boundary. -/
theorem false_of_two_capCenter_rows_share_outsidePair
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A) (Hord : CGN.StrictCapOrder A L)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    {r s : Fin m} (hrs : r < s)
    (Kr : SelectedFourClass A (L.points r))
    (Ks : SelectedFourClass A (L.points s))
    {a b : ℝ²} (hab : a ≠ b)
    (haOutside : a ∉ Finset.univ.image L.points)
    (hbOutside : b ∉ Finset.univ.image L.points)
    (haR : a ∈ Kr.support) (hbR : b ∈ Kr.support)
    (haS : a ∈ Ks.support) (hbS : b ∈ Ks.support) : False := by
  apply CapSelectedRowCounting.outsidePair_unique_capCenter
    hconv Hord hmem hrs
  · exact Kr.support_subset_A haR
  · exact Kr.support_subset_A hbR
  · exact haOutside
  · exact hbOutside
  · exact hab
  · exact (Kr.support_eq_radius a haR).trans
      (Kr.support_eq_radius b hbR).symm
  · exact (Ks.support_eq_radius a haS).trans
      (Ks.support_eq_radius b hbS).symm

#print axioms false_of_two_capCenter_rows_share_outsidePair

end K4ContinuationSelectorScratch
end Problem97
