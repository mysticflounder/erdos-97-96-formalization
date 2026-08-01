import Erdos9796Proof.P97.ATail.FrontierLiveClosure

#check Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter
#check Problem97.onArcOpposite_of_sameDist_apex_of_mem_mecDisk
#check Problem97.u5_common_bisector_triple_incompatibility
#check Problem97.u5_equilateral_circumcenter_on_p_circle_metric_incompatibility
#check Problem97.u5_equilateral_outer_point_metric_incompatibility

#print axioms Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter
#print axioms Problem97.onArcOpposite_of_sameDist_apex_of_mem_mecDisk
#print axioms Problem97.u5_common_bisector_triple_incompatibility
#print axioms Problem97.u5_equilateral_circumcenter_on_p_circle_metric_incompatibility
#print axioms Problem97.u5_equilateral_outer_point_metric_incompatibility
#print axioms Problem97.ATailApexRichClassStructure.oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
#print axioms Problem97.ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows

namespace Problem97

example
    {D : CounterexampleData}
    {H : CriticalShellSystem D.A}
    {p x y : EuclideanSpace ℝ (Fin 2)}
    (hp : p ∈ D.A)
    (hx :
      x ∈ (H.selectedAt p hp).toCriticalFourShell.support)
    (hy :
      y ∈ (H.selectedAt p hp).toCriticalFourShell.support)
    (hne :
      dist (H.centerAt p hp) x ≠ dist (H.centerAt p hp) y) :
    False := by
  apply hne
  exact
    ((H.selectedAt p hp).toCriticalFourShell.support_eq_radius x hx).trans
      ((H.selectedAt p hp).toCriticalFourShell.support_eq_radius y hy).symm

/- A source-clean global deletion criterion: if the erased point lies on no
exact four-point radius class at any surviving center, the erase is removable,
contradicting minimality. -/
example
    {D : CounterexampleData}
    (hmin : D.Minimal)
    {x : EuclideanSpace ℝ (Fin 2)}
    (hx : x ∈ D.A)
    (hpin :
      ∀ c : EuclideanSpace ℝ (Fin 2), c ∈ D.A.erase x →
        ∀ {radius : ℝ}, 0 < radius →
          (SelectedClass D.A c radius).card = 4 →
          x ∈ SelectedClass D.A c radius → False) :
    False := by
  have hK4erase : HasNEquidistantProperty 4 (D.A.erase x) := by
    intro c hc
    rcases selectedClass_erase_witness_of_no_exact_erased_pin
        D.K4 hc (hpin c hc) with ⟨radius, hradius, hcard⟩
    exact ⟨radius, hradius, by simpa [SelectedClass] using hcard⟩
  exact (CounterexampleData.not_isRemovableVertex_of_minimal hmin x)
    ⟨hx, hK4erase⟩

/- The criterion above cannot be discharged from a critical-shell system:
the source's own blocker is a surviving center with an exact four-point class
pinned through the source. -/
example
    {D : CounterexampleData}
    {H : CriticalShellSystem D.A}
    {x : EuclideanSpace ℝ (Fin 2)}
    (hx : x ∈ D.A)
    (hpin :
      ∀ c : EuclideanSpace ℝ (Fin 2), c ∈ D.A.erase x →
        ∀ {radius : ℝ}, 0 < radius →
          (SelectedClass D.A c radius).card = 4 →
          x ∈ SelectedClass D.A c radius → False) :
    False := by
  let K := (H.selectedAt x hx).toCriticalFourShell
  apply hpin (H.centerAt x hx) K.center_mem K.radius_pos
  · change (D.A.filter fun q => dist (H.centerAt x hx) q = K.radius).card = 4
    rw [← K.support_eq]
    exact K.support_card
  · change x ∈ D.A.filter fun q => dist (H.centerAt x hx) q = K.radius
    rw [← K.support_eq]
    exact K.q_mem_support

/- A distance inequality at one blocker gives only a one-center deletion
survival disjunction, not the universal preservation needed above. -/
example
    {D : CounterexampleData}
    {H : CriticalShellSystem D.A}
    {q a b : EuclideanSpace ℝ (Fin 2)}
    (hq : q ∈ D.A)
    (hne : dist (H.centerAt q hq) a ≠ dist (H.centerAt q hq) b) :
    HasNEquidistantPointsAt 4 (D.A.erase a) (H.centerAt q hq) ∨
      HasNEquidistantPointsAt 4 (D.A.erase b) (H.centerAt q hq) := by
  let K := (H.selectedAt q hq).toCriticalFourShell
  by_cases ha : a ∈ K.support
  · have hb : b ∉ K.support := by
      intro hb
      apply hne
      exact (K.support_eq_radius a ha).trans (K.support_eq_radius b hb).symm
    exact Or.inr
      ((ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H hq).2 hb)
  · exact Or.inl
      ((ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H hq).2 ha)

end Problem97
