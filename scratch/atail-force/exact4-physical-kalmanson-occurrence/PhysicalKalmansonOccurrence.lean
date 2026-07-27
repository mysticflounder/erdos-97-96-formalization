import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4KalmansonCorePort.UniqueFourKalmansonCores

/-!
# Exact-four physical Kalmanson occurrence

This scratch module normalizes the common-deletion packet in
`ExactFourPostCardElevenRobustSurface` into three ambient
`SelectedFourClass` rows:

* the exact first-apex row from the original residual;
* the packet row at the chosen late actual blocker; and
* the packet row at the physical second apex.

It also records the exact remaining positive occurrence premise for the
production Kalmanson terminal.  The premise permits every cyclic ordering of
the three physical rows and uses exactly the terminal's six cross-membership
literals in each branch.

There are no new axioms or unresolved proof obligations in this file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Exact4PhysicalKalmansonOccurrenceScratch

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open UniqueFourKalmansonCoresScratch

/-- Forget the deletion-specific support nesting and expose an exact
`U5QDeletedK4Class` as an ambient selected four-class. -/
noncomputable def ambientSelectedFourClassOfQDeleted
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    SelectedFourClass D.A center where
  support := B
  support_subset_A := by
    intro y hy
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp (K.subset hy)).2).2
  support_card := hcard
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

@[simp] theorem ambientSelectedFourClassOfQDeleted_support
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    (ambientSelectedFourClassOfQDeleted K hcard).support = B :=
  rfl

/-- The exact selected class at the first physical apex. -/
noncomputable def firstApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    SelectedFourClass D.A S.oppApex1 :=
  SelectedFourClass.ofSelectedClass (frontier_radius_pos F)
    R.class_card_eq_four

@[simp] theorem firstApexRow_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    (firstApexRow R).support =
      SelectedClass D.A S.oppApex1 radius :=
  rfl

/-- The chosen late actual blocker occurring in the physical ingress. -/
noncomputable def physicalLateCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) : ℝ² :=
  (lateFirstApexSystem R).centerAt surface.ingress.source.1
    surface.ingress.source.2

/-- The common-deletion row at the chosen late actual blocker, lifted to the
ambient carrier. -/
noncomputable def physicalLateRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    SelectedFourClass D.A (physicalLateCenter surface) :=
  ambientSelectedFourClassOfQDeleted surface.ingress.packet.row₁
    surface.ingress.packet.B₁_card

/-- The common-deletion row at the physical second apex, lifted to the
ambient carrier. -/
noncomputable def physicalSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    SelectedFourClass D.A S.oppApex2 :=
  ambientSelectedFourClassOfQDeleted surface.ingress.packet.row₂
    surface.ingress.packet.B₂_card

@[simp] theorem physicalLateRow_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    (physicalLateRow surface).support =
      surface.ingress.packet.B₁ :=
  rfl

@[simp] theorem physicalSecondApexRow_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    (physicalSecondApexRow surface).support =
      surface.ingress.packet.B₂ :=
  rfl

theorem physicalLateCenter_mem_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    physicalLateCenter surface ∈ D.A :=
  surface.ingress.packet.center₁_mem_A

theorem physicalLateCenter_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    physicalLateCenter surface ≠ S.oppApex2 :=
  surface.ingress.blocker_ne_secondApex

/-- The two named physical apices are distinct triangle vertices. -/
theorem firstApex_ne_secondApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

/-- Membership in the good outside-source set ensures that the chosen late
actual blocker is not the first physical apex. -/
theorem physicalLateCenter_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    physicalLateCenter surface ≠ S.oppApex1 := by
  have hsourceOutside :
      surface.ingress.source ∈ outsideFirstApexFiber R :=
    (Finset.mem_sdiff.mp surface.ingress.source_mem_good).1
  have hsourceNotClass :
      surface.ingress.source.1 ∉
        SelectedClass D.A S.oppApex1 radius := by
    intro hclass
    have hqClass := frontier_pair_q_mem_firstApexClass F
    have hcenters :
        (lateFirstApexSystem R).blockerVertex surface.ingress.source =
          (lateFirstApexSystem R).blockerVertex
            ⟨F.pair.q, F.pair.q_mem_A⟩ := by
      apply Subtype.ext
      exact
        (lateFirstApexSystem_centerAt_eq R
            surface.ingress.source.2 hclass).trans
          (lateFirstApexSystem_centerAt_eq R
            F.pair.q_mem_A hqClass).symm
    exact (Finset.mem_sdiff.mp hsourceOutside).2
      (Finset.mem_filter.mpr ⟨Finset.mem_univ _, hcenters⟩)
  exact
    (lateFirstApexSystem_centerAt_eq_iff_mem_class R
      surface.ingress.source.2).not.mpr hsourceNotClass

/-- The deleted frontier point belongs to the first-apex exact row. -/
theorem ingress_deleted_mem_firstApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.deleted ∈ (firstApexRow R).support := by
  rcases surface.ingress.deleted_is_pair with hq | hw
  · rw [hq]
    simpa [firstApexRow, SelectedFourClass.ofSelectedClass] using
      frontier_pair_q_mem_firstApexClass F
  · rw [hw]
    simpa [firstApexRow, SelectedFourClass.ofSelectedClass] using
      frontier_pair_w_mem_firstApexClass F

/-- The common deletion is absent from the late-blocker row. -/
theorem ingress_deleted_not_mem_physicalLateRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.deleted ∉ (physicalLateRow surface).support :=
  surface.ingress.packet.row₁.q_not_mem

/-- The common deletion is absent from the physical-second-apex row. -/
theorem ingress_deleted_not_mem_physicalSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.deleted ∉
      (physicalSecondApexRow surface).support :=
  surface.ingress.packet.row₂.q_not_mem

/-- Exact checked negative result for the old-frontier alignment: the point
deleted by the physical packet is in the first row but in neither packet row.
It therefore cannot be the shared source of a Kalmanson occurrence using
these three rows. -/
theorem ingress_deleted_row_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.deleted ∈ (firstApexRow R).support ∧
      surface.ingress.deleted ∉ (physicalLateRow surface).support ∧
      surface.ingress.deleted ∉
        (physicalSecondApexRow surface).support :=
  ⟨ingress_deleted_mem_firstApexRow surface,
    ingress_deleted_not_mem_physicalLateRow surface,
    ingress_deleted_not_mem_physicalSecondApexRow surface⟩

/-- Any point in the late packet row is automatically fresh relative to the
common deletion. -/
theorem ne_deleted_of_mem_physicalLateRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R)
    {x : ℝ²} (hx : x ∈ (physicalLateRow surface).support) :
    x ≠ surface.ingress.deleted := by
  intro h
  subst x
  exact ingress_deleted_not_mem_physicalLateRow surface hx

/-- The two packet rows retain the sharp two-circle overlap bound after
lifting to ambient selected four-classes. -/
theorem physical_packet_rows_overlap_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R) :
    ((physicalLateRow surface).support ∩
      (physicalSecondApexRow surface).support).card ≤ 2 :=
  surface.ingress.packet.overlap_le_two

/-- The exact six cross-memberships needed by the one-`K1` Kalmanson
terminal, stated independently of a concrete boundary enumeration. -/
def KalmansonCrossOccurrence
    {A : Finset ℝ²} {c₁ c₂ c₃ : ℝ²}
    (Row1 : SelectedFourClass A c₁)
    (Row2 : SelectedFourClass A c₂)
    (Row3 : SelectedFourClass A c₃) : Prop :=
  ∃ x : ℝ²,
    ConvexCyclicOrder A x c₁ c₂ c₃ ∧
      x ∈ Row1.support ∧
      c₂ ∈ Row1.support ∧
      x ∈ Row2.support ∧
      c₁ ∈ Row2.support ∧
      c₁ ∈ Row3.support ∧
      c₂ ∈ Row3.support

/-- `ConvexCyclicOrder` is the enumeration-independent ingress adapter for
the production one-`K1` Kalmanson terminal. -/
theorem false_of_cyclic_order_three_selected_rows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {x c₁ c₂ c₃ : ℝ²}
    (hcyclic : ConvexCyclicOrder A x c₁ c₂ c₃)
    (Row1 : SelectedFourClass A c₁)
    (Row2 : SelectedFourClass A c₂)
    (Row3 : SelectedFourClass A c₃)
    (hx_Row1 : x ∈ Row1.support)
    (hc₂_Row1 : c₂ ∈ Row1.support)
    (hx_Row2 : x ∈ Row2.support)
    (hc₁_Row2 : c₁ ∈ Row2.support)
    (hc₁_Row3 : c₁ ∈ Row3.support)
    (hc₂_Row3 : c₂ ∈ Row3.support) : False := by
  rcases hcyclic with
    ⟨n, boundary, hboundaryInjective, hboundaryImage, hboundaryCcw,
      i0, i1, i2, i3, h01, h12, h23, hi0, hi1, hi2, hi3⟩
  have hn : n = A.card := by
    calc
      n = Finset.univ.card := by simp
      _ = (Finset.univ.image boundary).card :=
        (Finset.card_image_of_injective _
          hboundaryInjective).symm
      _ = A.card := by rw [hboundaryImage]
  subst n
  subst x
  subst c₁
  subst c₂
  subst c₃
  exact false_of_one_k1_three_cyclic_selected_rows hA
    hboundaryInjective hboundaryImage hboundaryCcw h01 h12 h23
    Row1 Row2 Row3 hx_Row1 hc₂_Row1 hx_Row2 hc₁_Row2
    hc₁_Row3 hc₂_Row3

/-- A named occurrence immediately feeds the production Kalmanson terminal. -/
theorem false_of_kalmansonCrossOccurrence
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {c₁ c₂ c₃ : ℝ²}
    (Row1 : SelectedFourClass A c₁)
    (Row2 : SelectedFourClass A c₂)
    (Row3 : SelectedFourClass A c₃)
    (hocc : KalmansonCrossOccurrence Row1 Row2 Row3) :
    False := by
  rcases hocc with
    ⟨x, hcyclic, hx1, hc21, hx2, hc12, hc13, hc23⟩
  exact false_of_cyclic_order_three_selected_rows hA hcyclic
    Row1 Row2 Row3 hx1 hc21 hx2 hc12 hc13 hc23

/-- The exact remaining positive premise over the three rows already produced
by the robust physical surface.  The six disjuncts are the six possible
cyclic orders of the three row centers after cutting at the fresh source. -/
noncomputable def PhysicalKalmansonOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) : Prop :=
  KalmansonCrossOccurrence
      (firstApexRow R)
      (physicalLateRow surface)
      (physicalSecondApexRow surface) ∨
    KalmansonCrossOccurrence
      (firstApexRow R)
      (physicalSecondApexRow surface)
      (physicalLateRow surface) ∨
    KalmansonCrossOccurrence
      (physicalLateRow surface)
      (firstApexRow R)
      (physicalSecondApexRow surface) ∨
    KalmansonCrossOccurrence
      (physicalLateRow surface)
      (physicalSecondApexRow surface)
      (firstApexRow R) ∨
    KalmansonCrossOccurrence
      (physicalSecondApexRow surface)
      (firstApexRow R)
      (physicalLateRow surface) ∨
    KalmansonCrossOccurrence
      (physicalSecondApexRow surface)
      (physicalLateRow surface)
      (firstApexRow R)

/-- Closing theorem for the physical route: after `R`, the cardinality-twelve
surface, and its three ambient rows are present, the single remaining
`PhysicalKalmansonOccurrence` premise closes `False`.

The cardinality hypothesis is retained in the signature to match the live
post-card-eleven branch.  It is used upstream to construct `surface`; once the
surface is supplied, the Kalmanson consumer itself is cardinality-generic. -/
theorem false_of_physicalKalmansonOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hocc : PhysicalKalmansonOccurrence R surface) :
    False := by
  rcases hocc with h | h | h | h | h | h
  · exact false_of_kalmansonCrossOccurrence D.convex
      (firstApexRow R)
      (physicalLateRow surface)
      (physicalSecondApexRow surface) h
  · exact false_of_kalmansonCrossOccurrence D.convex
      (firstApexRow R)
      (physicalSecondApexRow surface)
      (physicalLateRow surface) h
  · exact false_of_kalmansonCrossOccurrence D.convex
      (physicalLateRow surface)
      (firstApexRow R)
      (physicalSecondApexRow surface) h
  · exact false_of_kalmansonCrossOccurrence D.convex
      (physicalLateRow surface)
      (physicalSecondApexRow surface)
      (firstApexRow R) h
  · exact false_of_kalmansonCrossOccurrence D.convex
      (physicalSecondApexRow surface)
      (firstApexRow R)
      (physicalLateRow surface) h
  · exact false_of_kalmansonCrossOccurrence D.convex
      (physicalSecondApexRow surface)
      (physicalLateRow surface)
      (firstApexRow R) h

end Exact4PhysicalKalmansonOccurrenceScratch
end Problem97
