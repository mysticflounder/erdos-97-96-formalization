import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Co-radial global-deletion arm versus the named first blocker fiber

The ordered-cap obstruction needs two distinct centers in the first cap
bisecting the same two outside carrier points.  The global-deletion arm
supplies the first center.  The second theorem below records the exact
additional data that would let the named first-fiber row supply the second.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CapCollisionGlobalDeletionLiveScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailBlockerMultiplicityGeometry

attribute [local instance] Classical.propDecidable

/-- A co-radial outside pair about one cap center is contradictory as soon as
a distinct second cap center is co-radial about the same pair. -/
theorem false_of_second_firstCap_center_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center s t : ℝ²}
    (hcenterCap : center ∈ S.capByIndex S.oppIndex1)
    (hsA : s ∈ D.A) (htA : t ∈ D.A)
    (hsOff : s ∉ S.capByIndex S.oppIndex1)
    (htOff : t ∉ S.capByIndex S.oppIndex1)
    (hst : s ≠ t)
    (hcenterEq : dist center s = dist center t)
    (hsecond :
      ∃ secondCenter ∈ S.capByIndex S.oppIndex1,
        secondCenter ≠ center ∧
          dist secondCenter s = dist secondCenter t) :
    False := by
  classical
  rcases hsecond with
    ⟨secondCenter, hsecondCap, hsecondNe, hsecondEq⟩
  rcases
      S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenterCap
  have hsecondImage :
      secondCenter ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hsecondCap
  rcases Finset.mem_image.mp hcenterImage with
    ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hsecondImage with
    ⟨is, _his, his⟩
  have hic_ne_is : ic ≠ is := by
    intro h
    apply hsecondNe
    calc
      secondCenter = L.points is := his.symm
      _ = L.points ic := by simp [h]
      _ = center := hic
  have hsOutside : s ∉ Finset.univ.image L.points := by
    simpa [hcap] using hsOff
  have htOutside : t ∉ Finset.univ.image L.points := by
    simpa [hcap] using htOff
  rcases lt_or_gt_of_ne hic_ne_is with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt hsA htA hsOutside htOutside hst
      (by simpa [hic] using hcenterEq)
      (by simpa [his] using hsecondEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt hsA htA hsOutside htOutside hst
      (by simpa [his] using hsecondEq)
      (by simpa [hic] using hcenterEq)

/-- The exact smallest coupling needed when the proposed second center is the
common blocker of the first retained collision.  Its cap membership is already
theorem-derived from `P`; only center distinctness and its equal-distance
equation for the arbitrary deleted pair remain as inputs. -/
theorem false_of_coradial_deleted_pair_of_firstBlocker_coupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {center : ℝ²} {deleted : Finset ℝ²} {s t : ℝ²}
    (hcenterCap : center ∈ S.capByIndex S.oppIndex1)
    (hdeletedSubsetOutside :
      deleted ⊆ D.A \ S.capByIndex S.oppIndex1)
    (hsDeleted : s ∈ deleted)
    (htDeleted : t ∈ deleted)
    (hst : s ≠ t)
    (hcenterEq : dist center s = dist center t)
    (hcoupling :
      H.centerAt P.source₁ P.source₁_mem_A ≠ center ∧
        dist (H.centerAt P.source₁ P.source₁_mem_A) s =
          dist (H.centerAt P.source₁ P.source₁_mem_A) t) :
    False := by
  have hsOutside := hdeletedSubsetOutside hsDeleted
  have htOutside := hdeletedSubsetOutside htDeleted
  have hblockerCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  exact false_of_second_firstCap_center_equidistant
    hcenterCap
    (Finset.mem_sdiff.mp hsOutside).1
    (Finset.mem_sdiff.mp htOutside).1
    (Finset.mem_sdiff.mp hsOutside).2
    (Finset.mem_sdiff.mp htOutside).2
    hst hcenterEq
    ⟨H.centerAt P.source₁ P.source₁_mem_A,
      hblockerCap, hcoupling.1, hcoupling.2⟩

/-- Specialize the second-cap-center obstruction to the exact outside pair
named by a fresh first blocker-fiber packet.

The common blocker is already in the first cap by
`RetainedInteriorBlockerCollision.blocker_mem_capInterior`.  The explicit
coupling hypothesis records exactly what the live global-deletion outcome
does not: its center differs from that blocker and its arbitrary co-radial
pair is the named outside pair of the first-fiber shell. -/
theorem false_of_coradial_deleted_pair_eq_firstFiberOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {center : ℝ²} {deleted : Finset ℝ²} {s t : ℝ²}
    (hcenterCap : center ∈ S.capByIndex S.oppIndex1)
    (hdeletedSubsetOutside :
      deleted ⊆ D.A \ S.capByIndex S.oppIndex1)
    (hsDeleted : s ∈ deleted)
    (htDeleted : t ∈ deleted)
    (hst : s ≠ t)
    (hcenterEq : dist center s = dist center t)
    (hcoupling :
      H.centerAt P.source₁ P.source₁_mem_A ≠ center ∧
        ({s, t} : Finset ℝ²) =
          {Q.source.1, Q.otherOutsidePoint}) :
    False := by
  have hsNamed :
      s ∈ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
    rw [← hcoupling.2]
    simp
  have htNamed :
      t ∈ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
    rw [← hcoupling.2]
    simp
  have hsShell :
      s ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [← Q.outside_eq_pair] at hsNamed
    exact (Finset.mem_sdiff.mp hsNamed).1
  have htShell :
      t ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [← Q.outside_eq_pair] at htNamed
    exact (Finset.mem_sdiff.mp htNamed).1
  have hblockerEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) s =
        dist (H.centerAt P.source₁ P.source₁_mem_A) t :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell
      |>.support_eq_radius s hsShell
      |>.trans
        ((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell
          |>.support_eq_radius t htShell).symm
  exact false_of_coradial_deleted_pair_of_firstBlocker_coupling
    P hcenterCap hdeletedSubsetOutside hsDeleted htDeleted hst hcenterEq
    ⟨hcoupling.1, hblockerEq⟩

#print axioms false_of_second_firstCap_center_equidistant
#print axioms false_of_coradial_deleted_pair_of_firstBlocker_coupling
#print axioms false_of_coradial_deleted_pair_eq_firstFiberOutsidePair

end CapCollisionGlobalDeletionLiveScratch
end Problem97
