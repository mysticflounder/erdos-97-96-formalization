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

/-- An exact deleted row centered at the actual blocker of `source` still
contains `source`.  The deleted point may be different; exactness identifies
the surviving row with the canonical critical shell sourced by `source`. -/
theorem qDeletedK4Class_source_mem_support
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source deleted : ℝ²} {B : Finset ℝ²}
    (hsource : source ∈ D.A)
    (K : U5QDeletedK4Class D deleted (H.centerAt source hsource) B)
    (hcard : B.card = 4) :
    source ∈ B := by
  rw [qDeletedK4Class_support_eq_selectedShell hsource K hcard]
  exact
    (H.selectedAt source hsource).toCriticalFourShell.q_mem_support

/-- An exact row extracted after deleting `deleted` omits that point. -/
theorem qDeletedK4Class_deleted_not_mem_support
    {D : CounterexampleData} {deleted center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D deleted center B) :
    deleted ∉ B := by
  intro hdeleted
  have hdeletedSkeleton : deleted ∈ D.skeleton deleted :=
    (Finset.mem_erase.mp (K.subset hdeleted)).2
  exact (Finset.mem_erase.mp hdeletedSkeleton).1 rfl

/-- If the center of a deleted exact row is an actual blocker center, the
deleted point is omitted from the corresponding canonical selected shell. -/
theorem qDeletedK4Class_deleted_not_mem_selectedShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source deleted : ℝ²} {B : Finset ℝ²}
    (hsource : source ∈ D.A)
    (K : U5QDeletedK4Class D deleted (H.centerAt source hsource) B)
    (hcard : B.card = 4) :
    deleted ∉ (H.selectedAt source hsource).toCriticalFourShell.support := by
  rw [← qDeletedK4Class_support_eq_selectedShell hsource K hcard]
  exact qDeletedK4Class_deleted_not_mem_support K

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

/-- Five distinct surviving centers can be installed simultaneously as the
selected classes of one faithful carrier pattern.

This is finite ingress from the deletion boundary into the ordinary carrier
pattern API.  It does not supply any closure or contradiction property for the
five prescribed classes. -/
theorem exists_faithfulCarrierPattern_with_fiveSurvivorClasses
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄)
    (hc₀ : c₀ ∈ D.A) (hc₁ : c₁ ∈ D.A) (hc₂ : c₂ ∈ D.A)
    (hc₃ : c₃ ∈ D.A) (hc₄ : c₄ ∈ D.A)
    (hcenters : ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5) :
    ∃ F : FaithfulCarrierPattern D.A,
      F.classAt c₀ hc₀ = qDeletedK4ClassToSelectedFourClass B.K₀ B.B₀_card ∧
      F.classAt c₁ hc₁ = qDeletedK4ClassToSelectedFourClass B.K₁ B.B₁_card ∧
      F.classAt c₂ hc₂ = qDeletedK4ClassToSelectedFourClass B.K₂ B.B₂_card ∧
      F.classAt c₃ hc₃ = qDeletedK4ClassToSelectedFourClass B.K₃ B.B₃_card ∧
      F.classAt c₄ hc₄ = qDeletedK4ClassToSelectedFourClass B.K₄ B.B₄_card := by
  classical
  have hnodup : [c₀, c₁, c₂, c₃, c₄].Nodup := by
    rw [← Multiset.coe_nodup]
    apply Multiset.toFinset_card_eq_card_iff_nodup.mp
    simpa using hcenters
  have hne :
      (c₀ ≠ c₁ ∧ c₀ ≠ c₂ ∧ c₀ ≠ c₃ ∧ c₀ ≠ c₄) ∧
      (c₁ ≠ c₂ ∧ c₁ ≠ c₃ ∧ c₁ ≠ c₄) ∧
      (c₂ ≠ c₃ ∧ c₂ ≠ c₄) ∧ c₃ ≠ c₄ := by
    simpa [List.nodup_cons, not_or] using hnodup
  rcases hne with
    ⟨⟨h₀₁, h₀₂, h₀₃, h₀₄⟩, ⟨h₁₂, h₁₃, h₁₄⟩, ⟨h₂₃, h₂₄⟩, h₃₄⟩
  let V : Finset ℝ² := {c₀, c₁, c₂, c₃, c₄}
  have hVA : V ⊆ D.A := by
    intro center hcenter
    simp only [V, Finset.mem_insert, Finset.mem_singleton] at hcenter
    rcases hcenter with rfl | rfl | rfl | rfl | rfl
    · exact hc₀
    · exact hc₁
    · exact hc₂
    · exact hc₃
    · exact hc₄
  have hVne : V.Nonempty := ⟨c₀, by simp [V]⟩
  let K : ∀ center : ℝ², center ∈ V → SelectedFourClass D.A center :=
    fun center hcenter ↦
      if h₀ : center = c₀ then
        h₀ ▸ qDeletedK4ClassToSelectedFourClass B.K₀ B.B₀_card
      else if h₁ : center = c₁ then
        h₁ ▸ qDeletedK4ClassToSelectedFourClass B.K₁ B.B₁_card
      else if h₂ : center = c₂ then
        h₂ ▸ qDeletedK4ClassToSelectedFourClass B.K₂ B.B₂_card
      else if h₃ : center = c₃ then
        h₃ ▸ qDeletedK4ClassToSelectedFourClass B.K₃ B.B₃_card
      else by
        have h₄ : center = c₄ := by
          simpa [V, h₀, h₁, h₂, h₃] using hcenter
        exact h₄ ▸ qDeletedK4ClassToSelectedFourClass B.K₄ B.B₄_card
  rcases
      exists_faithfulCarrierPattern_with_classes_on D.K4 hVA hVne K with
    ⟨F, hF⟩
  refine ⟨F, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [K] using hF c₀ (by simp [V])
  · simpa [K, h₀₁.symm] using hF c₁ (by simp [V])
  · simpa [K, h₀₂.symm, h₁₂.symm] using hF c₂ (by simp [V])
  · simpa [K, h₀₃.symm, h₁₃.symm, h₂₃.symm] using hF c₃ (by simp [V])
  · simpa [K, h₀₄.symm, h₁₄.symm, h₂₄.symm, h₃₄.symm] using
      hF c₄ (by simp [V])

/-- Consumer-facing package for five exact deleted rows together with one
additional prescribed selected four-class at a sixth distinct center.  The
extra class is intentionally arbitrary: callers can use a canonical critical
shell row for an omitted blocker, while the five deletion rows retain their
exact q-deleted provenance. -/
structure SixCenterFaithfulCarrierBoundary
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (q : ℝ²) (hq : q ∈ D.A)
    (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) where
  rows : FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄
  c₀_mem : c₀ ∈ D.A
  c₁_mem : c₁ ∈ D.A
  c₂_mem : c₂ ∈ D.A
  c₃_mem : c₃ ∈ D.A
  c₄_mem : c₄ ∈ D.A
  c₅_mem : c₅ ∈ D.A
  centers_card : ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6
  extraClass : SelectedFourClass D.A c₅
  carrierPattern : FaithfulCarrierPattern D.A
  classAt₀_eq :
    carrierPattern.classAt c₀ c₀_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₀ rows.B₀_card
  classAt₁_eq :
    carrierPattern.classAt c₁ c₁_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₁ rows.B₁_card
  classAt₂_eq :
    carrierPattern.classAt c₂ c₂_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₂ rows.B₂_card
  classAt₃_eq :
    carrierPattern.classAt c₃ c₃_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₃ rows.B₃_card
  classAt₄_eq :
    carrierPattern.classAt c₄ c₄_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₄ rows.B₄_card
  classAt₅_eq :
    carrierPattern.classAt c₅ c₅_mem = extraClass

/-- Install five exact deleted rows and one prescribed extra class in one
faithful carrier pattern.  This is a producer only; no metric obstruction is
asserted. -/
theorem FiveSurvivorExactRowsBoundary.toSixCenterFaithfulCarrierBoundary
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄)
    (hc₀ : c₀ ∈ D.A) (hc₁ : c₁ ∈ D.A) (hc₂ : c₂ ∈ D.A)
    (hc₃ : c₃ ∈ D.A) (hc₄ : c₄ ∈ D.A) (hc₅ : c₅ ∈ D.A)
    (hcenters : ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6)
    (extraClass : SelectedFourClass D.A c₅) :
    Nonempty
      (SixCenterFaithfulCarrierBoundary D H q hq c₀ c₁ c₂ c₃ c₄ c₅) := by
  classical
  have hnodup : [c₀, c₁, c₂, c₃, c₄, c₅].Nodup := by
    rw [← Multiset.coe_nodup]
    apply Multiset.toFinset_card_eq_card_iff_nodup.mp
    simpa using hcenters
  have hne :
      (c₀ ≠ c₁ ∧ c₀ ≠ c₂ ∧ c₀ ≠ c₃ ∧ c₀ ≠ c₄ ∧ c₀ ≠ c₅) ∧
      (c₁ ≠ c₂ ∧ c₁ ≠ c₃ ∧ c₁ ≠ c₄ ∧ c₁ ≠ c₅) ∧
      (c₂ ≠ c₃ ∧ c₂ ≠ c₄ ∧ c₂ ≠ c₅) ∧
      (c₃ ≠ c₄ ∧ c₃ ≠ c₅) ∧ c₄ ≠ c₅ := by
    simpa [List.nodup_cons, not_or] using hnodup
  rcases hne with
    ⟨⟨h₀₁, h₀₂, h₀₃, h₀₄, h₀₅⟩,
      ⟨h₁₂, h₁₃, h₁₄, h₁₅⟩,
      ⟨h₂₃, h₂₄, h₂₅⟩, ⟨h₃₄, h₃₅⟩, h₄₅⟩
  let V : Finset ℝ² := {c₀, c₁, c₂, c₃, c₄, c₅}
  have hVA : V ⊆ D.A := by
    intro center hcenter
    simp only [V, Finset.mem_insert, Finset.mem_singleton] at hcenter
    rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl
    · exact hc₀
    · exact hc₁
    · exact hc₂
    · exact hc₃
    · exact hc₄
    · exact hc₅
  have hVne : V.Nonempty := ⟨c₀, by simp [V]⟩
  let K : ∀ center : ℝ², center ∈ V → SelectedFourClass D.A center :=
    fun center hcenter ↦
      if h₀ : center = c₀ then
        h₀ ▸ qDeletedK4ClassToSelectedFourClass B.K₀ B.B₀_card
      else if h₁ : center = c₁ then
        h₁ ▸ qDeletedK4ClassToSelectedFourClass B.K₁ B.B₁_card
      else if h₂ : center = c₂ then
        h₂ ▸ qDeletedK4ClassToSelectedFourClass B.K₂ B.B₂_card
      else if h₃ : center = c₃ then
        h₃ ▸ qDeletedK4ClassToSelectedFourClass B.K₃ B.B₃_card
      else if h₄ : center = c₄ then
        h₄ ▸ qDeletedK4ClassToSelectedFourClass B.K₄ B.B₄_card
      else by
        have h₅ : center = c₅ := by
          simpa [V, h₀, h₁, h₂, h₃, h₄] using hcenter
        exact h₅ ▸ extraClass
  rcases exists_faithfulCarrierPattern_with_classes_on D.K4 hVA hVne K with
    ⟨F, hF⟩
  refine ⟨{
    rows := B
    c₀_mem := hc₀
    c₁_mem := hc₁
    c₂_mem := hc₂
    c₃_mem := hc₃
    c₄_mem := hc₄
    c₅_mem := hc₅
    centers_card := hcenters
    extraClass := extraClass
    carrierPattern := F
    classAt₀_eq := ?_
    classAt₁_eq := ?_
    classAt₂_eq := ?_
    classAt₃_eq := ?_
    classAt₄_eq := ?_
    classAt₅_eq := ?_
  }⟩
  · simpa [K] using hF c₀ (by simp [V])
  · simpa [K, h₀₁.symm] using hF c₁ (by simp [V])
  · simpa [K, h₀₂.symm, h₁₂.symm] using hF c₂ (by simp [V])
  · simpa [K, h₀₃.symm, h₁₃.symm, h₂₃.symm] using hF c₃ (by simp [V])
  · simpa [K, h₀₄.symm, h₁₄.symm, h₂₄.symm, h₃₄.symm] using
      hF c₄ (by simp [V])
  · simpa [K, h₀₅.symm, h₁₅.symm, h₂₅.symm, h₃₅.symm, h₄₅.symm] using
      hF c₅ (by simp [V])

/-- Consumer-facing package for five distinct exact deleted rows installed in
one faithful carrier pattern.  This records the center memberships and row
identifications that downstream finite or geometric consumers actually need;
it carries no contradiction field. -/
structure FiveSurvivorFaithfulCarrierBoundary
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (q : ℝ²) (hq : q ∈ D.A) (c₀ c₁ c₂ c₃ c₄ : ℝ²) where
  rows : FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄
  c₀_mem : c₀ ∈ D.A
  c₁_mem : c₁ ∈ D.A
  c₂_mem : c₂ ∈ D.A
  c₃_mem : c₃ ∈ D.A
  c₄_mem : c₄ ∈ D.A
  centers_card : ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5
  carrierPattern : FaithfulCarrierPattern D.A
  classAt₀_eq :
    carrierPattern.classAt c₀ c₀_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₀ rows.B₀_card
  classAt₁_eq :
    carrierPattern.classAt c₁ c₁_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₁ rows.B₁_card
  classAt₂_eq :
    carrierPattern.classAt c₂ c₂_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₂ rows.B₂_card
  classAt₃_eq :
    carrierPattern.classAt c₃ c₃_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₃ rows.B₃_card
  classAt₄_eq :
    carrierPattern.classAt c₄ c₄_mem =
      qDeletedK4ClassToSelectedFourClass rows.K₄ rows.B₄_card

/-- Extend an already installed five-row faithful boundary by one actual
selected class.  The sixth center-card premise is the only new geometric
input; this adapter does not manufacture a contradiction or a metric-core
alternative. -/
theorem FiveSurvivorFaithfulCarrierBoundary.toSixCenterFaithfulCarrierBoundary
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : FiveSurvivorFaithfulCarrierBoundary D H q hq c₀ c₁ c₂ c₃ c₄)
    (hc₅ : c₅ ∈ D.A)
    (hcenters : ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6)
    (extraClass : SelectedFourClass D.A c₅) :
    Nonempty
      (SixCenterFaithfulCarrierBoundary D H q hq c₀ c₁ c₂ c₃ c₄ c₅) := by
  exact B.rows.toSixCenterFaithfulCarrierBoundary
    B.c₀_mem B.c₁_mem B.c₂_mem B.c₃_mem B.c₄_mem hc₅ hcenters extraClass

/-- Restore the deleted point's actual blocker as a sixth faithful center.
The five-row boundary already records that this blocker is distinct from all
five surviving centers, while its canonical critical shell supplies the
prescribed selected four-class.  This is a source-clean producer only. -/
theorem FiveSurvivorFaithfulCarrierBoundary.toActualBlockerSixCenterBoundary
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄) :
    Nonempty
      (SixCenterFaithfulCarrierBoundary D H q hq c₀ c₁ c₂ c₃ c₄
        (H.centerAt q hq)) := by
  classical
  have hblockerMem : H.centerAt q hq ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt q hq).toCriticalFourShell.center_mem).2
  have hblockerOutside :
      H.centerAt q hq ∉ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨B.rows.actualBlocker_ne₀, B.rows.actualBlocker_ne₁,
      B.rows.actualBlocker_ne₂, B.rows.actualBlocker_ne₃,
      B.rows.actualBlocker_ne₄⟩
  have hcenters :
      ({c₀, c₁, c₂, c₃, c₄, H.centerAt q hq} : Finset ℝ²).card = 6 := by
    have hset :
        ({c₀, c₁, c₂, c₃, c₄, H.centerAt q hq} : Finset ℝ²) =
          insert (H.centerAt q hq) {c₀, c₁, c₂, c₃, c₄} := by
      ext z
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    rw [hset, Finset.card_insert_of_notMem hblockerOutside, B.centers_card]
  exact B.toSixCenterFaithfulCarrierBoundary hblockerMem hcenters
    (H.selectedAt q hq).toSelectedFourClass

/-- A carrier point whose actual blocker is one of the five surviving centers
lies in that center's exact deleted row.  Otherwise its blocker is a genuinely
new center outside the five-center boundary.

This is the source-clean transport from actual blocker data into the faithful
carrier pattern; it adds no incidence assumption. -/
theorem FiveSurvivorFaithfulCarrierBoundary.blocker_outside_centers_or_mem_row
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄)
    {z : ℝ²} (hz : z ∈ D.A) :
    H.centerAt z hz ∉ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²) ∨
      z ∈ B.rows.B₀ ∨ z ∈ B.rows.B₁ ∨ z ∈ B.rows.B₂ ∨
        z ∈ B.rows.B₃ ∨ z ∈ B.rows.B₄ := by
  classical
  by_cases houtside :
      H.centerAt z hz ∉ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²)
  · exact Or.inl houtside
  right
  have hcenterA : H.centerAt z hz ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt z hz).toCriticalFourShell.center_mem).2
  have hzBlocker :
      z ∈
        (B.carrierPattern.classAt (H.centerAt z hz) hcenterA).support := by
    rw [H.selectedFourClass_support_eq_shell z hz]
    exact (H.selectedAt z hz).toCriticalFourShell.q_mem_support
  simp only [Finset.mem_insert, Finset.mem_singleton, not_not] at houtside
  rcases houtside with h₀ | h₁ | h₂ | h₃ | h₄
  · left
    subst c₀
    rw [B.classAt₀_eq] at hzBlocker
    exact hzBlocker
  · right; left
    subst c₁
    rw [B.classAt₁_eq] at hzBlocker
    exact hzBlocker
  · right; right; left
    subst c₂
    rw [B.classAt₂_eq] at hzBlocker
    exact hzBlocker
  · right; right; right; left
    subst c₃
    rw [B.classAt₃_eq] at hzBlocker
    exact hzBlocker
  · right; right; right; right
    subst c₄
    rw [B.classAt₄_eq] at hzBlocker
    exact hzBlocker

/-- Package the existing five-row boundary and faithful-carrier ingress into
the exact record expected by downstream consumers. -/
theorem FiveSurvivorExactRowsBoundary.toFaithfulCarrierBoundary
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄)
    (hc₀ : c₀ ∈ D.A) (hc₁ : c₁ ∈ D.A) (hc₂ : c₂ ∈ D.A)
    (hc₃ : c₃ ∈ D.A) (hc₄ : c₄ ∈ D.A)
    (hcenters : ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5) :
    Nonempty
      (FiveSurvivorFaithfulCarrierBoundary
        D H q hq c₀ c₁ c₂ c₃ c₄) := by
  rcases
      exists_faithfulCarrierPattern_with_fiveSurvivorClasses
        B hc₀ hc₁ hc₂ hc₃ hc₄ hcenters with
    ⟨carrierPattern, h₀, h₁, h₂, h₃, h₄⟩
  exact ⟨{
    rows := B
    c₀_mem := hc₀
    c₁_mem := hc₁
    c₂_mem := hc₂
    c₃_mem := hc₃
    c₄_mem := hc₄
    centers_card := hcenters
    carrierPattern := carrierPattern
    classAt₀_eq := h₀
    classAt₁_eq := h₁
    classAt₂_eq := h₂
    classAt₃_eq := h₃
    classAt₄_eq := h₄
  }⟩

end ATailFiveCenterDeletionBoundary
end Problem97
