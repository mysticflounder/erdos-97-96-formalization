import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.U5GlobalIncidenceBasic

/-!
# Five-center deletion boundary

The live first-fiber descent can produce a deletion that preserves `K4` at
five named centers.  This file records exactly what that buys at the generic
critical-shell boundary:

* five exact `q`-deleted four-point rows; and
* the actual blocker of `q` as a sixth, different center where deletion
  provably fails.

This is not a contradiction.  In particular, the sixth center is a blocked
center, not the sixth surviving row required by the bounded U5 audit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstFiberOverlapDerivation

open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/-- Local copy of the production descent's generic output interface.

Keeping this scratch boundary independent of `FirstFiberOverlapDescent` lets
the generic consequence elaborate even while that new production module's
imports are being repaired. -/
abbrev FiveCenterDeletionSurvivalScratch
    (D : CounterexampleData) (deleted c₀ c₁ c₂ c₃ c₄ : ℝ²) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase deleted) c₀ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₁ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₂ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₃ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₄

/-- Exact theorem-facing boundary of a five-center deletion survival packet.

The five surviving witnesses are trimmed to exact `U5QDeletedK4Class` rows.
The critical-shell system's actual blocker is simultaneously exposed as a
unique-four center distinct from every survivor, at which the same deletion
fails. -/
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

/-- A five-center deletion survival packet gives exactly five q-free rows and
one distinct blocked actual center. -/
theorem fiveSurvivorExactRowsBoundary
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {q : ℝ²} (hq : q ∈ D.A) {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (h :
      FiveCenterDeletionSurvivalScratch D q c₀ c₁ c₂ c₃ c₄) :
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

end ATailFirstFiberOverlapDerivation
end Problem97
