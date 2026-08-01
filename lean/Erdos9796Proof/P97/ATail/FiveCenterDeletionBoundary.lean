import Erdos9796Proof.P97.ATail.FirstFiberOverlapDescent
import Erdos9796Proof.P97.U5GlobalIncidenceBasic

/-!
# Five-center deletion boundary

The first-fiber descent can preserve `K4` at five named centers after deleting
one carrier point.  This module exposes the exact theorem-bank interface of
that packet: five exact q-free four-point rows, together with the deleted
point's actual blocker as a sixth, distinct center where deletion fails.

This is a checked normalization, not a contradiction.  In particular, the
sixth center is blocked and therefore is not a sixth surviving row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFiveCenterDeletionBoundary

open ATailFirstFiberOverlapDescent
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/-- Regard an exact q-deleted K4 row as an ambient selected four-class. -/
def qDeletedK4ClassToSelectedFourClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    SelectedFourClass D.A center where
  support := B
  support_subset_A := by
    intro y hy
    have hyErase : y ∈ (D.skeleton q).erase center := K.subset hy
    have hySkeleton : y ∈ D.skeleton q := (Finset.mem_erase.mp hyErase).2
    exact (Finset.mem_erase.mp hySkeleton).2
  support_card := hcard
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

/-- At an actual blocker center, an exact q-deleted row is the canonical
selected shell. -/
theorem qDeletedK4Class_support_eq_selectedShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source deleted : ℝ²} {B : Finset ℝ²}
    (hsource : source ∈ D.A)
    (K : U5QDeletedK4Class D deleted (H.centerAt source hsource) B)
    (hcard : B.card = 4) :
    B = (H.selectedAt source hsource).toCriticalFourShell.support := by
  exact H.selectedFourClass_support_eq_shell source hsource
    (qDeletedK4ClassToSelectedFourClass K hcard)

/-- Exact theorem-facing boundary of a five-center deletion-survival packet. -/
structure FiveSurvivorExactRowsBoundary
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (q : ℝ²) (hq : q ∈ D.A) (c₀ c₁ c₂ c₃ c₄ : ℝ²) : Type where
  B₀ : Finset ℝ²
  B₁ : Finset ℝ²
  B₂ : Finset ℝ²
  B₃ : Finset ℝ²
  B₄ : Finset ℝ²
  K₀ : U5QDeletedK4Class D q c₀ B₀
  K₁ : U5QDeletedK4Class D q c₁ B₁
  K₂ : U5QDeletedK4Class D q c₂ B₂
  K₃ : U5QDeletedK4Class D q c₃ B₃
  K₄ : U5QDeletedK4Class D q c₄ B₄
  B₀_card : B₀.card = 4
  B₁_card : B₁.card = 4
  B₂_card : B₂.card = 4
  B₃_card : B₃.card = 4
  B₄_card : B₄.card = 4
  actualBlocker_uniqueFour :
    IsUniqueFourCenter D.A (H.centerAt q hq)
  actualBlocker_fails :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt q hq)
  actualBlocker_ne_deleted : H.centerAt q hq ≠ q
  actualBlocker_ne₀ : H.centerAt q hq ≠ c₀
  actualBlocker_ne₁ : H.centerAt q hq ≠ c₁
  actualBlocker_ne₂ : H.centerAt q hq ≠ c₂
  actualBlocker_ne₃ : H.centerAt q hq ≠ c₃
  actualBlocker_ne₄ : H.centerAt q hq ≠ c₄

/-- Trim each surviving K4 witness to an exact q-free four-point row and expose
the deleted point's distinct blocked actual center. -/
theorem fiveSurvivorExactRowsBoundary
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {q : ℝ²} (hq : q ∈ D.A) {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (h : FiveCenterDeletionSurvival D q c₀ c₁ c₂ c₃ c₄) :
    Nonempty (FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄) := by
  rcases h with ⟨h₀, h₁, h₂, h₃, h₄⟩
  have hskeleton₀ :
      HasNEquidistantPointsAt 4 (D.skeleton q) c₀ := by
    simpa [CounterexampleData.skeleton] using h₀
  have hskeleton₁ :
      HasNEquidistantPointsAt 4 (D.skeleton q) c₁ := by
    simpa [CounterexampleData.skeleton] using h₁
  have hskeleton₂ :
      HasNEquidistantPointsAt 4 (D.skeleton q) c₂ := by
    simpa [CounterexampleData.skeleton] using h₂
  have hskeleton₃ :
      HasNEquidistantPointsAt 4 (D.skeleton q) c₃ := by
    simpa [CounterexampleData.skeleton] using h₃
  have hskeleton₄ :
      HasNEquidistantPointsAt 4 (D.skeleton q) c₄ := by
    simpa [CounterexampleData.skeleton] using h₄
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hskeleton₀ with ⟨B₀, ⟨K₀⟩, hB₀⟩
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hskeleton₁ with ⟨B₁, ⟨K₁⟩, hB₁⟩
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hskeleton₂ with ⟨B₂, ⟨K₂⟩, hB₂⟩
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hskeleton₃ with ⟨B₃, ⟨K₃⟩, hB₃⟩
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hskeleton₄ with ⟨B₄, ⟨K₄⟩, hB₄⟩
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt q hq) :=
    H.no_qfree_at q hq
  have hne₀ : H.centerAt q hq ≠ c₀ := by
    intro heq
    apply hblocked
    simpa only [heq] using h₀
  have hne₁ : H.centerAt q hq ≠ c₁ := by
    intro heq
    apply hblocked
    simpa only [heq] using h₁
  have hne₂ : H.centerAt q hq ≠ c₂ := by
    intro heq
    apply hblocked
    simpa only [heq] using h₂
  have hne₃ : H.centerAt q hq ≠ c₃ := by
    intro heq
    apply hblocked
    simpa only [heq] using h₃
  have hne₄ : H.centerAt q hq ≠ c₄ := by
    intro heq
    apply hblocked
    simpa only [heq] using h₄
  exact ⟨{
    B₀ := B₀
    B₁ := B₁
    B₂ := B₂
    B₃ := B₃
    B₄ := B₄
    K₀ := K₀
    K₁ := K₁
    K₂ := K₂
    K₃ := K₃
    K₄ := K₄
    B₀_card := hB₀
    B₁_card := hB₁
    B₂_card := hB₂
    B₃_card := hB₃
    B₄_card := hB₄
    actualBlocker_uniqueFour := isUniqueFourCenter_centerAt H q hq
    actualBlocker_fails := hblocked
    actualBlocker_ne_deleted := centerAt_ne_source H q hq
    actualBlocker_ne₀ := hne₀
    actualBlocker_ne₁ := hne₁
    actualBlocker_ne₂ := hne₂
    actualBlocker_ne₃ := hne₃
    actualBlocker_ne₄ := hne₄
  }⟩

end ATailFiveCenterDeletionBoundary
end Problem97
