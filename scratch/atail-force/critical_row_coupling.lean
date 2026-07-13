import Erdos9796Proof.P97.U1Depth5Prefix
import Erdos9796Proof.P97.Cap.PartitionFromMEC

/-!
# ATAIL critical-row and joint-fiber scratch certificates

This scratch module checks two routine interfaces needed by the card-at-least-12
ATAIL producer. It is deliberately not imported by the live Route-B source
while that file is owned by another proof-blueprint session.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1Depth5

/-- Two exact critical rows with the same center and first selected label have
the same full four-point shell. -/
theorem CriticalRowPacket.support_eq_of_center_eq_l1
    {D : CounterexampleData} {source₁ source₂ : Plane}
    (R₁ : CriticalRowPacket D source₁)
    (R₂ : CriticalRowPacket D source₂)
    (hcenter : R₁.center = R₂.center)
    (hl1 : R₁.selected.l1 = R₂.selected.l1) :
    R₁.selected.toCriticalFourShell.support =
      R₂.selected.toCriticalFourShell.support := by
  have hradius :
      R₁.selected.toCriticalFourShell.radius =
        R₂.selected.toCriticalFourShell.radius := by
    calc
      R₁.selected.toCriticalFourShell.radius =
          dist R₁.center R₁.selected.l1 := R₁.selected.l1_dist.symm
      _ = dist R₂.center R₁.selected.l1 :=
        congrArg (fun center : Plane => dist center R₁.selected.l1) hcenter
      _ = dist R₂.center R₂.selected.l1 :=
        congrArg (fun z : Plane => dist R₂.center z) hl1
      _ = R₂.selected.toCriticalFourShell.radius := R₂.selected.l1_dist
  rw [R₁.selected.toCriticalFourShell.support_eq,
    R₂.selected.toCriticalFourShell.support_eq]
  ext z
  simp only [Finset.mem_filter]
  constructor
  · rintro ⟨hzA, hzdist⟩
    refine ⟨hzA, ?_⟩
    calc
      dist R₂.center z = dist R₁.center z :=
        (congrArg (fun center : Plane => dist center z) hcenter).symm
      _ = R₁.selected.toCriticalFourShell.radius := hzdist
      _ = R₂.selected.toCriticalFourShell.radius := hradius
  · rintro ⟨hzA, hzdist⟩
    refine ⟨hzA, ?_⟩
    calc
      dist R₁.center z = dist R₂.center z :=
        congrArg (fun center : Plane => dist center z) hcenter
      _ = R₂.selected.toCriticalFourShell.radius := hzdist
      _ = R₁.selected.toCriticalFourShell.radius := hradius.symm

/-- The two live comparison maps identify the sixth row's entire exact shell
whenever its source collides with one of the five source rows. -/
theorem CriticalSourceRows.f2_support_eq_rowAt_of_source_eq
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (f2CriticalRow :
      CriticalRowPacket D
        (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : CriticalSource,
        rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.center = (rows.rowAt source).center)
    (hf2Selected_l1_eq_rowAt_l1 :
      ∀ source : CriticalSource,
        rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.selected.l1 = (rows.rowAt source).selected.l1)
    (source : CriticalSource)
    (hsource :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        rows.sourcePoint source) :
    f2CriticalRow.selected.toCriticalFourShell.support =
      (rows.rowAt source).selected.toCriticalFourShell.support :=
  CriticalRowPacket.support_eq_of_center_eq_l1
    f2CriticalRow (rows.rowAt source)
      (hf2Center_eq_rowAt_center source hsource)
      (hf2Selected_l1_eq_rowAt_l1 source hsource)

end U1Depth5

namespace SurplusCapPacket

/-- A two-point lower bound on a joint exact-radius filter extracts the exact
off-surplus shared-radius pair consumed by the Route-B sink. -/
theorem exists_doubleApex_pair_of_joint_filter_card_ge_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) {r ρ : ℝ}
    (hcard :
      2 ≤ (((A.filter fun x => dist x S.oppApex1 = r) ∩
          (A.filter fun x => dist x S.oppApex2 = ρ)) \
            S.surplusCap).card) :
    ∃ x w' : ℝ², x ∈ A ∧ w' ∈ A ∧ x ≠ w' ∧
      x ∉ S.surplusCap ∧ w' ∉ S.surplusCap ∧
      dist x S.oppApex1 = r ∧ dist w' S.oppApex1 = r ∧
      dist x S.oppApex2 = ρ ∧ dist w' S.oppApex2 = ρ := by
  let T :=
    ((A.filter fun x => dist x S.oppApex1 = r) ∩
      (A.filter fun x => dist x S.oppApex2 = ρ)) \ S.surplusCap
  have hT : 1 < T.card := by
    simpa [T] using hcard
  rcases Finset.one_lt_card.mp hT with ⟨x, hxT, w', hw'T, hxw'⟩
  have hx := Finset.mem_sdiff.mp hxT
  have hw' := Finset.mem_sdiff.mp hw'T
  have hxFilters := Finset.mem_inter.mp hx.1
  have hw'Filters := Finset.mem_inter.mp hw'.1
  have hx1 := Finset.mem_filter.mp hxFilters.1
  have hx2 := Finset.mem_filter.mp hxFilters.2
  have hw'1 := Finset.mem_filter.mp hw'Filters.1
  have hw'2 := Finset.mem_filter.mp hw'Filters.2
  exact ⟨x, w', hx1.1, hw'1.1, hxw', hx.2, hw'.2,
    hx1.2, hw'1.2, hx2.2, hw'2.2⟩

end SurplusCapPacket
end Problem97
