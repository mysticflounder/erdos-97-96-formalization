/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.ATail.FirstFiberOverlapDescent
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_cross_blocker_localization
import Erdos9796Proof.P97.Census554.CapSelectedGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

/-- If deleting either of two named points blocks K4 at the same carrier
center, those points lie on one critical four-shell centered there and hence
have equal distance from the center.  This is the source-level bridge from a
named deletion obstruction to the metric equality used by Kalmanson. -/
theorem endpointCentered_dist_eq_of_two_blocked_deletions
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    {center x y : ℝ²}
    (hcenter : center ∈ A)
    (hcenter_ne_x : center ≠ x)
    (hxblocked : ¬ HasNEquidistantPointsAt 4 (A.erase x) center)
    (hyblocked : ¬ HasNEquidistantPointsAt 4 (A.erase y) center) :
    dist center x = dist center y := by
  let K : CriticalSelectedFourClass A x center :=
    Classical.choice
      (ATAILStageOnePrescribedApexDichotomy.criticalSelectedFourClass_at_of_no_qfree
          hK4 hcenter hcenter_ne_x hxblocked)
  have hxK : x ∈ K.toCriticalFourShell.support :=
    K.toCriticalFourShell.q_mem_support
  have hyK : y ∈ K.toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      K hyblocked
  exact
    (K.toCriticalFourShell.support_eq_radius x hxK).trans
      (K.toCriticalFourShell.support_eq_radius y hyK).symm

/-- A K4 witness surviving deletion of one point can be trimmed to an exact
ambient selected four-row avoiding that point.  This is the row-valued form
needed by finite incidence encoders; it loses neither the radius equality nor
the fact that the deleted point is absent. -/
theorem exists_selectedFourClass_avoiding_of_deletion_survives
    {A : Finset ℝ²} {center deleted : ℝ²}
    (hsurvives :
      HasNEquidistantPointsAt 4 (A.erase deleted) center) :
    ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨radius, hradius, hfour⟩
  rcases Finset.exists_subset_card_eq hfour with ⟨support, hsupport, hcard⟩
  refine ⟨{
    support := support
    support_subset_A := ?_
    support_card := hcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := ?_
    center_not_mem := ?_ }, ?_⟩
  · intro z hz
    exact Finset.mem_of_mem_erase
      (mem_selectedClass.mp (hsupport hz)).1
  · intro z hz
    exact (mem_selectedClass.mp (hsupport hz)).2
  · intro hcenter
    have hdist := (mem_selectedClass.mp (hsupport hcenter)).2
    have hzero : (0 : ℝ) = radius := by simpa using hdist
    linarith
  · intro hdeleted
    have hdeletedErase :=
      (mem_selectedClass.mp (hsupport hdeleted)).1
    exact (Finset.mem_erase.mp hdeletedErase).1 rfl

/-- Exact row representation of survival under one deletion. -/
theorem deletion_survives_iff_exists_selectedFourClass_avoiding
    {A : Finset ℝ²} {center deleted : ℝ²} :
    HasNEquidistantPointsAt 4 (A.erase deleted) center ↔
      ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  constructor
  · exact exists_selectedFourClass_avoiding_of_deletion_survives
  · rintro ⟨K, hdeleted⟩
    exact selectedFourClass_survives_erase_of_not_mem K hdeleted

/-- Concrete complement of a pair of named deletion obstructions: either
both deletions block K4 at the center, or one obtains an exact four-row there
which avoids one of the deleted points. -/
def EndpointDeletionPairSurvivingRow
    (A : Finset ℝ²) (center firstDeleted secondDeleted : ℝ²) : Prop :=
  (∃ K : SelectedFourClass A center, firstDeleted ∉ K.support) ∨
    ∃ K : SelectedFourClass A center, secondDeleted ∉ K.support

/-- A surviving endpoint row together with the cap-composition information
forced by ordered-cap geometry.  The row center lies in the named cap, at
most two selected witnesses lie in that cap, and hence at least two lie
outside it. -/
def EndpointDeletionPairCapSplitSurvivingRow
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (center firstDeleted secondDeleted : ℝ²) : Prop :=
  (∃ (K : SelectedFourClass A center) (i : Fin 3),
      firstDeleted ∉ K.support ∧
        center ∈ S.capByIndex i ∧
        (K.support ∩ S.capByIndex i).card ≤ 2 ∧
        2 ≤ (K.support \ S.capByIndex i).card) ∨
    ∃ (K : SelectedFourClass A center) (i : Fin 3),
      secondDeleted ∉ K.support ∧
        center ∈ S.capByIndex i ∧
        (K.support ∩ S.capByIndex i).card ≤ 2 ∧
      2 ≤ (K.support \ S.capByIndex i).card

/-- Explicit-row form of `EndpointDeletionPairCapSplitSurvivingRow`.

Unlike the existential packet above, this predicate keeps the selected row and
cap index in the interface.  It is the form needed when a downstream theorem
already carries a boundary index and a `SelectedFourClass` at that index. -/
def EndpointDeletionPairCapSplitSurvivingRowAt
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (center firstDeleted secondDeleted : ℝ²)
    (K : SelectedFourClass A center) (i : Fin 3) : Prop :=
  ((firstDeleted ∉ K.support ∨ secondDeleted ∉ K.support) ∧
    center ∈ S.capByIndex i ∧
    (K.support ∩ S.capByIndex i).card ≤ 2 ∧
    2 ≤ (K.support \ S.capByIndex i).card)

/-- Exact finite incidence packet consumed by the two-row Kalmanson bridge.

The boundary indexing is part of the packet: this prevents a producer from
silently proving the cyclic placement on one boundary and the row incidences
on another.  The two selected rows are centered at the first two vertices of
an increasing quadruple and share its last two vertices. -/
def FreshThirdSharedLatePairPacket (A : Finset ℝ²) : Prop :=
  ∃ (B : BoundaryIndexing A) (ia ib ic id : Fin B.n),
    ia < ib ∧ ib < ic ∧ ic < id ∧
      ∃ (ARow : SelectedFourClass A (B.boundary ia))
          (BRow : SelectedFourClass A (B.boundary ib)),
        B.boundary ic ∈ ARow.support ∧
          B.boundary id ∈ ARow.support ∧
          B.boundary ic ∈ BRow.support ∧
          B.boundary id ∈ BRow.support

/-- Cut-independent form of the shared-pair obstruction used by the finite
FreshThird query.  The two shared points are on the same open boundary arc
between the row centers.  Unlike `FreshThirdSharedLatePairPacket`, this packet
does not require rotating the boundary so that the two centers precede the
two shared points in the chosen linear cut. -/
def FreshThirdSharedPairNonalternationPacket (A : Finset ℝ²) : Prop :=
  ∃ (B : BoundaryIndexing A) (ic id ix iy : Fin B.n),
    ic ≠ id ∧ ix ≠ iy ∧
      ∃ (CRow : SelectedFourClass A (B.boundary ic))
          (DRow : SelectedFourClass A (B.boundary id)),
        B.boundary ix ∈ CRow.support ∧
          B.boundary iy ∈ CRow.support ∧
          B.boundary ix ∈ DRow.support ∧
          B.boundary iy ∈ DRow.support ∧
          (SurplusCOMPGBank.btw ic id ix ↔
            SurplusCOMPGBank.btw ic id iy)

/-- Trim a four-or-larger selected radius class to an exact selected four-row
while retaining two prescribed witnesses.  This is the source-level adapter
needed when a finite incidence certificate identifies the shared pair before
the exact four-row has been chosen. -/
theorem exists_selectedFourClass_preserving_pair
    {A : Finset ℝ²} {center x y : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hx : x ∈ SelectedClass A center radius)
    (hy : y ∈ SelectedClass A center radius)
    (hcard : 4 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center,
      x ∈ K.support ∧ y ∈ K.support := by
  classical
  have hpairSub : ({x, y} : Finset ℝ²) ⊆
      SelectedClass A center radius := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hx
    · exact hy
  have hpairCard : ({x, y} : Finset ℝ²).card ≤ 4 := by
    exact Finset.card_le_two.trans (by norm_num)
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
        hpairSub hpairCard hcard with
    ⟨T, hpairT, hTsub, hTcard⟩
  refine ⟨{
    support := T
    support_subset_A := fun _ hz ↦ (mem_selectedClass.mp (hTsub hz)).1
    support_card := hTcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := fun _ hz ↦ (mem_selectedClass.mp (hTsub hz)).2
    center_not_mem := ?_ }, hpairT (by simp), hpairT (by simp)⟩
  intro hcenter
  have hzero := (mem_selectedClass.mp (hTsub hcenter)).2
  have : radius = 0 := by simpa using hzero.symm
  exact (ne_of_gt hradius) this

/-- Two exact selected rows cannot share two distinct points on the same
boundary arc between their distinct centers.  This is the direct, general-`n`
Lean consumer for the Schema-11 nonalternation query; no cyclic-cut rotation
or fixed-cardinality boundary is needed. -/
theorem false_of_freshThirdSharedPairNonalternationPacket
    {A : Finset ℝ²}
    (hpacket : FreshThirdSharedPairNonalternationPacket A) : False := by
  rcases hpacket with
    ⟨B, ic, id, ix, iy, hicd, hxiy, CRow, DRow,
      hxC, hyC, hxD, hyD, hsame⟩
  have hiyc : iy ≠ ic := by
    intro h
    subst iy
    exact CRow.center_not_mem hyC
  have hiyd : iy ≠ id := by
    intro h
    subst iy
    exact DRow.center_not_mem hyD
  have hcenterC :
      dist (B.boundary ix) (B.boundary ic) =
        dist (B.boundary iy) (B.boundary ic) := by
    simpa only [dist_comm] using
      (CRow.support_eq_radius (B.boundary ix) hxC).trans
        (CRow.support_eq_radius (B.boundary iy) hyC).symm
  have hcenterD :
      dist (B.boundary ix) (B.boundary id) =
        dist (B.boundary iy) (B.boundary id) := by
    simpa only [dist_comm] using
      (DRow.support_eq_radius (B.boundary ix) hxD).trans
        (DRow.support_eq_radius (B.boundary iy) hyD).symm
  have hseparated :
      SurplusCOMPGBank.btw ic id ix ↔
        ¬ SurplusCOMPGBank.btw ic id iy :=
    SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
      hicd hiyc hiyd hcenterC hcenterD
      (B.boundary_injective.ne hxiy)
  by_cases hx : SurplusCOMPGBank.btw ic id ix
  · exact (hseparated.mp hx) (hsame.mp hx)
  · have hy : SurplusCOMPGBank.btw ic id iy := by
      by_contra hny
      exact hx (hseparated.mpr hny)
    exact hx (hsame.mpr hy)

/-- Certificate-facing form of the nonalternation contradiction.  The first
row may initially be a radius class of cardinality at least four: the two
certified shared witnesses are preserved while it is trimmed to an exact
selected four-row, after which the cut-independent two-row consumer applies.

This theorem is cardinality-free in the ambient carrier.  A bounded search
therefore only has to produce the named boundary indices and prove that its
finite obstruction lifts to every source instance. -/
theorem false_of_selectedClass_and_row_shared_pair_nonalternating
    {A : Finset ℝ²}
    (B : BoundaryIndexing A) (ic id ix iy : Fin B.n)
    (hicd : ic ≠ id) (hxiy : ix ≠ iy)
    {radius : ℝ} (hradius : 0 < radius)
    (hxC : B.boundary ix ∈
      SelectedClass A (B.boundary ic) radius)
    (hyC : B.boundary iy ∈
      SelectedClass A (B.boundary ic) radius)
    (hCcard : 4 ≤
      (SelectedClass A (B.boundary ic) radius).card)
    (DRow : SelectedFourClass A (B.boundary id))
    (hxD : B.boundary ix ∈ DRow.support)
    (hyD : B.boundary iy ∈ DRow.support)
    (hsame : SurplusCOMPGBank.btw ic id ix ↔
      SurplusCOMPGBank.btw ic id iy) : False := by
  rcases exists_selectedFourClass_preserving_pair
      hradius hxC hyC hCcard with
    ⟨CRow, hxCRow, hyCRow⟩
  exact false_of_freshThirdSharedPairNonalternationPacket
    ⟨B, ic, id, ix, iy, hicd, hxiy, CRow, DRow,
      hxCRow, hyCRow, hxD, hyD, hsame⟩

/-- Count-facing ingress for a finite certificate.  Among the boundary points
shared by a four-or-larger selected radius class and an exact row at a
distinct center, two points on either one of the two open arcs already force
the checked nonalternation contradiction.

The filtered finsets are merely a convenient certificate representation; all
their members are re-extracted as source-level class and row incidences before
the geometric consumer is invoked. -/
theorem false_of_selectedClass_and_row_two_shared_on_one_arc
    {A : Finset ℝ²}
    (B : BoundaryIndexing A) (ic id : Fin B.n)
    (hicd : ic ≠ id)
    {radius : ℝ} (hradius : 0 < radius)
    (hCcard : 4 ≤
      (SelectedClass A (B.boundary ic) radius).card)
    (DRow : SelectedFourClass A (B.boundary id))
    (htwo :
      2 ≤ (Finset.univ.filter fun i : Fin B.n ↦
        B.boundary i ∈ SelectedClass A (B.boundary ic) radius ∧
          B.boundary i ∈ DRow.support ∧
          SurplusCOMPGBank.btw ic id i).card ∨
      2 ≤ (Finset.univ.filter fun i : Fin B.n ↦
        B.boundary i ∈ SelectedClass A (B.boundary ic) radius ∧
          B.boundary i ∈ DRow.support ∧
          ¬ SurplusCOMPGBank.btw ic id i).card) : False := by
  classical
  rcases htwo with hinside | houtside
  · have hone : 1 < (Finset.univ.filter fun i : Fin B.n ↦
        B.boundary i ∈ SelectedClass A (B.boundary ic) radius ∧
          B.boundary i ∈ DRow.support ∧
          SurplusCOMPGBank.btw ic id i).card := by
      omega
    rcases Finset.one_lt_card.mp hone with ⟨ix, hix, iy, hiy, hxiy⟩
    have hixData := (Finset.mem_filter.mp hix).2
    have hiyData := (Finset.mem_filter.mp hiy).2
    exact false_of_selectedClass_and_row_shared_pair_nonalternating
      B ic id ix iy hicd hxiy hradius
      hixData.1 hiyData.1 hCcard DRow
      hixData.2.1 hiyData.2.1
      ⟨fun _ ↦ hiyData.2.2, fun _ ↦ hixData.2.2⟩
  · have hone : 1 < (Finset.univ.filter fun i : Fin B.n ↦
        B.boundary i ∈ SelectedClass A (B.boundary ic) radius ∧
          B.boundary i ∈ DRow.support ∧
          ¬ SurplusCOMPGBank.btw ic id i).card := by
      omega
    rcases Finset.one_lt_card.mp hone with ⟨ix, hix, iy, hiy, hxiy⟩
    have hixData := (Finset.mem_filter.mp hix).2
    have hiyData := (Finset.mem_filter.mp hiy).2
    exact false_of_selectedClass_and_row_shared_pair_nonalternating
      B ic id ix iy hicd hxiy hradius
      hixData.1 hiyData.1 hCcard DRow
      hixData.2.1 hiyData.2.1
      ⟨fun h ↦ False.elim (hixData.2.2 h),
        fun h ↦ False.elim (hiyData.2.2 h)⟩

/-- A shared-late-pair packet is impossible on a convex carrier.  This is the
checked consumer for the remaining FreshThird distinct-cap producer. -/
theorem false_of_freshThirdSharedLatePairPacket
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hpacket : FreshThirdSharedLatePairPacket A) : False := by
  rcases hpacket with
    ⟨B, ia, ib, ic, id, hiab, hibc, hicd, ARow, BRow,
      hicA, hidA, hicB, hidB⟩
  exact
    CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair
      (boundary := B.boundary) (ia := ia) (ib := ib) (ic := ic) (id := id)
      hconv B.boundary_injective B.boundary_image B.boundary_ccw
      hiab hibc hicd ARow BRow hicA hidA hicB hidB

/-- Source-faithful form of the bridged-late-pair obstruction.

The first row is an arbitrary global K4 row at the canonical blocker center.
The second is that blocker's exact critical shell.  The critical source lies
in both rows, so it transfers the two named late memberships to one metric
radius without requiring the two supports to be definitionally equal. -/
theorem false_of_criticalShell_bridgedLatePair
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A)
    (B : BoundaryIndexing A) {ia ib ic id : Fin B.n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hcenter : H.centerAt source hsource = B.boundary ia)
    (DRow : SelectedFourClass A (B.boundary ia))
    (FreshRow : SelectedFourClass A (B.boundary ib))
    (hic_mem_DRow : B.boundary ic ∈ DRow.support)
    (hid_mem_shell :
      B.boundary id ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hic_mem_FreshRow : B.boundary ic ∈ FreshRow.support)
    (hid_mem_FreshRow : B.boundary id ∈ FreshRow.support) :
    False := by
  let ShellRow : SelectedFourClass A (B.boundary ia) :=
    hcenter ▸
      (H.selectedAt source hsource).toCriticalFourShell.toSelectedFourClass
  have support_transport :
      ∀ {c d : ℝ²} (h : c = d) (Row : SelectedFourClass A c),
        (h ▸ Row).support = Row.support := by
    intro c d h Row
    cases h
    rfl
  have hsource_mem_DRow : source ∈ DRow.support := by
    have hsource_mem :
        source ∈
          (hcenter.symm ▸ DRow).support :=
      H.source_mem_selectedFourClass source hsource (hcenter.symm ▸ DRow)
    have hsupport := support_transport hcenter.symm DRow
    simpa only [hsupport] using hsource_mem
  have hShellRow_support :
      ShellRow.support =
        (H.selectedAt source hsource).toCriticalFourShell.support := by
    simpa only [ShellRow, CriticalFourShell.toSelectedFourClass] using
      support_transport hcenter
        (H.selectedAt source hsource).toCriticalFourShell.toSelectedFourClass
  have hsource_mem_ShellRow : source ∈ ShellRow.support := by
    simpa only [hShellRow_support] using
      (H.selectedAt source hsource).toCriticalFourShell.q_mem_support
  have hid_mem_ShellRow : B.boundary id ∈ ShellRow.support := by
    simpa only [hShellRow_support] using hid_mem_shell
  exact
    CapCrossingKalmansonBridge.false_of_three_selected_rows_bridged_late_pair
      (boundary := B.boundary) (ia := ia) (ib := ib) (ic := ic) (id := id)
      (bridge := source) hconv B.boundary_injective B.boundary_image
      B.boundary_ccw hiab hibc hicd DRow ShellRow FreshRow
      hic_mem_DRow hsource_mem_DRow hsource_mem_ShellRow hid_mem_ShellRow
      hic_mem_FreshRow hid_mem_FreshRow

/-- Enrich either surviving-row arm by locating its center in the cap cover
and applying the uniform selected-row cap bound. -/
theorem endpointDeletionPairSurvivingRow_capSplit
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) {center firstDeleted secondDeleted : ℝ²}
    (hcenterA : center ∈ A)
    (hrow : EndpointDeletionPairSurvivingRow
      A center firstDeleted secondDeleted) :
    EndpointDeletionPairCapSplitSurvivingRow
      S center firstDeleted secondDeleted := by
  rcases hrow with ⟨K, havoid⟩ | ⟨K, havoid⟩
  · rcases
        CapSelectedRowCounting.selectedFourClass_exists_capByIndex_with_two_outside
          S hconv hcenterA K with
      ⟨i, hcenter, hinter, houtside⟩
    exact Or.inl ⟨K, i, havoid, hcenter, hinter, houtside⟩
  · rcases
        CapSelectedRowCounting.selectedFourClass_exists_capByIndex_with_two_outside
          S hconv hcenterA K with
      ⟨i, hcenter, hinter, houtside⟩
    exact Or.inr ⟨K, i, havoid, hcenter, hinter, houtside⟩

theorem endpointDeletionPair_blocked_or_survivingRow
    {A : Finset ℝ²} {center firstDeleted secondDeleted : ℝ²} :
    (¬ HasNEquidistantPointsAt 4 (A.erase firstDeleted) center ∧
        ¬ HasNEquidistantPointsAt 4 (A.erase secondDeleted) center) ∨
      EndpointDeletionPairSurvivingRow
        A center firstDeleted secondDeleted := by
  by_cases hfirst :
      HasNEquidistantPointsAt 4 (A.erase firstDeleted) center
  · exact Or.inr (Or.inl
      (exists_selectedFourClass_avoiding_of_deletion_survives hfirst))
  · by_cases hsecond :
        HasNEquidistantPointsAt 4 (A.erase secondDeleted) center
    · exact Or.inr (Or.inr
        (exists_selectedFourClass_avoiding_of_deletion_survives hsecond))
    · exact Or.inl ⟨hfirst, hsecond⟩

/-- The row-valued complement of the order-selected FreshThird deletion
premise.  Each order arm names the selected endpoint and records an exact
four-row avoiding either the canonical source or the other shared endpoint. -/
def FreshThirdOrderSelectedEndpointSurvivingRow
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²)
    (qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n) :
    Prop :=
  (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < sourceCenter ∧ sourceCenter < canonicalSource ∧
      EndpointDeletionPairSurvivingRow A (boundary qBetween)
        (boundary canonicalSource) (boundary qOutside)) ∨
    (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < canonicalSource ∧ canonicalSource < sourceCenter ∧
      EndpointDeletionPairSurvivingRow A (boundary qOutside)
        (boundary canonicalSource) (boundary qBetween)) ∨
    (canonicalSource < sourceCenter ∧ sourceCenter < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      EndpointDeletionPairSurvivingRow A (boundary qBetween)
        (boundary canonicalSource) (boundary qOutside)) ∨
    (sourceCenter < canonicalSource ∧ canonicalSource < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      EndpointDeletionPairSurvivingRow A (boundary qOutside)
        (boundary canonicalSource) (boundary qBetween))

/-- Cap-classified form of the order-selected survivor packet.  This keeps
the four source-proved order arms but strengthens the selected endpoint row
with its universally forced inside/outside cap composition. -/
def FreshThirdOrderSelectedEndpointCapSplitSurvivingRow
    {A : Finset ℝ²} (S : SurplusCapPacket A) {n : ℕ}
    (boundary : Fin n → ℝ²)
    (qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n) :
    Prop :=
  (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < sourceCenter ∧ sourceCenter < canonicalSource ∧
      EndpointDeletionPairCapSplitSurvivingRow S (boundary qBetween)
        (boundary canonicalSource) (boundary qOutside)) ∨
    (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < canonicalSource ∧ canonicalSource < sourceCenter ∧
      EndpointDeletionPairCapSplitSurvivingRow S (boundary qOutside)
        (boundary canonicalSource) (boundary qBetween)) ∨
    (canonicalSource < sourceCenter ∧ sourceCenter < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      EndpointDeletionPairCapSplitSurvivingRow S (boundary qBetween)
        (boundary canonicalSource) (boundary qOutside)) ∨
    (sourceCenter < canonicalSource ∧ canonicalSource < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      EndpointDeletionPairCapSplitSurvivingRow S (boundary qOutside)
        (boundary canonicalSource) (boundary qBetween))

/-- Explicit-row form of the ordered survivor packet.  The endpoint index is
recorded in each order arm, so the selected row carried by a caller cannot be
silently replaced by another exact row at the same boundary point. -/
def FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) {n : ℕ}
    (boundary : Fin n → ℝ²)
    (qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n)
    (id : Fin n) (K : SelectedFourClass A (boundary id)) (i : Fin 3) : Prop :=
  (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < sourceCenter ∧ sourceCenter < canonicalSource ∧
      id = qBetween ∧
      EndpointDeletionPairCapSplitSurvivingRowAt S (boundary id)
        (boundary canonicalSource) (boundary qOutside) K i) ∨
    (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < canonicalSource ∧ canonicalSource < sourceCenter ∧
      id = qOutside ∧
      EndpointDeletionPairCapSplitSurvivingRowAt S (boundary id)
        (boundary canonicalSource) (boundary qBetween) K i) ∨
    (canonicalSource < sourceCenter ∧ sourceCenter < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      id = qBetween ∧
      EndpointDeletionPairCapSplitSurvivingRowAt S (boundary id)
        (boundary canonicalSource) (boundary qOutside) K i) ∨
    (sourceCenter < canonicalSource ∧ canonicalSource < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      id = qOutside ∧
      EndpointDeletionPairCapSplitSurvivingRowAt S (boundary id)
        (boundary canonicalSource) (boundary qBetween) K i)

/-- Upgrade the exact order-selected survivor packet using the cap cover and
the selected-row cap bound. -/
theorem freshThird_orderSelectedEndpointSurvivingRow_capSplit
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_image : Finset.univ.image boundary = A)
    {qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n}
    (hrow : FreshThirdOrderSelectedEndpointSurvivingRow (A := A) boundary
      qOutside freshCenter qBetween sourceCenter canonicalSource) :
    FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S boundary
      qOutside freshCenter qBetween sourceCenter canonicalSource := by
  have hboundary_mem (i : Fin n) : boundary i ∈ A := by
    rw [← hboundary_image]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
  rcases hrow with h | h | h | h
  · exact Or.inl
      ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1,
        endpointDeletionPairSurvivingRow_capSplit S hconv
          (hboundary_mem qBetween) h.2.2.2.2⟩
  · exact Or.inr (Or.inl
      ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1,
        endpointDeletionPairSurvivingRow_capSplit S hconv
          (hboundary_mem qOutside) h.2.2.2.2⟩)
  · exact Or.inr (Or.inr (Or.inl
      ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1,
        endpointDeletionPairSurvivingRow_capSplit S hconv
          (hboundary_mem qBetween) h.2.2.2.2⟩))
  · exact Or.inr (Or.inr (Or.inr
      ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1,
        endpointDeletionPairSurvivingRow_capSplit S hconv
          (hboundary_mem qOutside) h.2.2.2.2⟩))

/-- The exact dynamic deletion premise selected by one of the four
FreshThird five-point orders.  Arms 1 and 3 use the between endpoint; arms 2
and 4 use the outside endpoint.  In each arm, deleting the canonical source
and deleting the other shared endpoint both block K4 at that selected
endpoint. -/
def FreshThirdOrderSelectedEndpointDeletionObstructions
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²)
    (qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n) :
    Prop :=
  (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < sourceCenter ∧ sourceCenter < canonicalSource ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary canonicalSource)) (boundary qBetween) ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary qOutside)) (boundary qBetween)) ∨
    (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < canonicalSource ∧ canonicalSource < sourceCenter ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary canonicalSource)) (boundary qOutside) ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary qBetween)) (boundary qOutside)) ∨
    (canonicalSource < sourceCenter ∧ sourceCenter < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary canonicalSource)) (boundary qBetween) ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary qOutside)) (boundary qBetween)) ∨
    (sourceCenter < canonicalSource ∧ canonicalSource < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary canonicalSource)) (boundary qOutside) ∧
      ¬ HasNEquidistantPointsAt 4
        (A.erase (boundary qBetween)) (boundary qOutside))

/-- Every source-proved FreshThird five-point order has an exact endpoint
deletion outcome.  The Kalmanson-closing arm is the two named deletion
obstructions; its complement is not left as a negated proposition but is
materialized as an exact selected four-row avoiding one deleted point. -/
theorem freshThird_orderSelectedEndpointDeletionObstructions_or_survivingRow
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²)
    {qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n}
    (horder : FreshThirdFivePointKalmansonOrder qOutside freshCenter qBetween
      sourceCenter canonicalSource) :
    FreshThirdOrderSelectedEndpointDeletionObstructions (A := A) boundary
        qOutside freshCenter qBetween sourceCenter canonicalSource ∨
      FreshThirdOrderSelectedEndpointSurvivingRow (A := A) boundary
        qOutside freshCenter qBetween sourceCenter canonicalSource := by
  rcases horder with h | h | h | h
  · rcases endpointDeletionPair_blocked_or_survivingRow
        (A := A) (center := boundary qBetween)
        (firstDeleted := boundary canonicalSource)
        (secondDeleted := boundary qOutside) with hblocked | hrow
    · exact Or.inl (Or.inl
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hblocked.1, hblocked.2⟩)
    · exact Or.inr (Or.inl
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hrow⟩)
  · rcases endpointDeletionPair_blocked_or_survivingRow
        (A := A) (center := boundary qOutside)
        (firstDeleted := boundary canonicalSource)
        (secondDeleted := boundary qBetween) with hblocked | hrow
    · exact Or.inl (Or.inr (Or.inl
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hblocked.1, hblocked.2⟩))
    · exact Or.inr (Or.inr (Or.inl
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hrow⟩))
  · rcases endpointDeletionPair_blocked_or_survivingRow
        (A := A) (center := boundary qBetween)
        (firstDeleted := boundary canonicalSource)
        (secondDeleted := boundary qOutside) with hblocked | hrow
    · exact Or.inl (Or.inr (Or.inr (Or.inl
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hblocked.1, hblocked.2⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inl
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hrow⟩)))
  · rcases endpointDeletionPair_blocked_or_survivingRow
        (A := A) (center := boundary qOutside)
        (firstDeleted := boundary canonicalSource)
        (secondDeleted := boundary qBetween) with hblocked | hrow
    · exact Or.inl (Or.inr (Or.inr (Or.inr
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hblocked.1, hblocked.2⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        ⟨h.1, h.2.1, h.2.2.1, h.2.2.2, hrow⟩)))

/-- The cardinality-free Kalmanson landing for the exact dynamic deletion
contract.  Unlike the older sufficient interface, this consumes only the two
deletion failures used by the realized order arm. -/
theorem false_of_freshThird_orderSelectedEndpointDeletionObstructions
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (hconvex : ConvexIndep A)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n}
    (hsourceOutside :
      dist (boundary sourceCenter) (boundary canonicalSource) =
        dist (boundary sourceCenter) (boundary qOutside))
    (hsourceBetween :
      dist (boundary sourceCenter) (boundary canonicalSource) =
        dist (boundary sourceCenter) (boundary qBetween))
    (hdeletions :
      FreshThirdOrderSelectedEndpointDeletionObstructions (A := A) boundary
        qOutside freshCenter qBetween sourceCenter canonicalSource) :
    False := by
  have hboundary_mem (i : Fin n) : boundary i ∈ A := by
    rw [← hboundary_image]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
  have hboundary_ne {i j : Fin n} (hij : i ≠ j) :
      boundary i ≠ boundary j := by
    intro h
    exact hij (hboundary_injective h)
  rcases hdeletions with h | h | h | h
  · rcases h with ⟨hof, hfb, hbs, hsc, hcanonical, hother⟩
    have hselectedNe : qBetween ≠ canonicalSource :=
      ne_of_lt (lt_trans hbs hsc)
    have hendpoint :=
      endpointCentered_dist_eq_of_two_blocked_deletions
        hK4 (hboundary_mem qBetween) (hboundary_ne hselectedNe)
        hcanonical hother
    apply CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms
      hconvex hboundary_injective hboundary_image hboundary_ccw
    exact Or.inl
      ⟨lt_trans hof hfb, hbs, hsc, hendpoint.symm,
        hsourceOutside.symm⟩
  · rcases h with ⟨hof, hfb, hbc, hcs, hcanonical, hother⟩
    have hselectedNe : qOutside ≠ canonicalSource :=
      ne_of_lt (lt_trans (lt_trans hof hfb) hbc)
    have hendpoint :=
      endpointCentered_dist_eq_of_two_blocked_deletions
        hK4 (hboundary_mem qOutside) (hboundary_ne hselectedNe)
        hcanonical hother
    apply CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms
      hconvex hboundary_injective hboundary_image hboundary_ccw
    exact Or.inr (Or.inl
      ⟨lt_trans hof hfb, hbc, hcs, hendpoint.symm,
        hsourceBetween.symm⟩)
  · rcases h with ⟨hcs, hsb, hbf, hfo, hcanonical, hother⟩
    have hselectedNe : qBetween ≠ canonicalSource :=
      ne_of_gt (lt_trans hcs hsb)
    have hendpoint :=
      endpointCentered_dist_eq_of_two_blocked_deletions
        hK4 (hboundary_mem qBetween) (hboundary_ne hselectedNe)
        hcanonical hother
    apply CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms
      hconvex hboundary_injective hboundary_image hboundary_ccw
    exact Or.inr (Or.inr (Or.inl
      ⟨hcs, hsb, lt_trans hbf hfo, hsourceOutside,
        hendpoint⟩))
  · rcases h with ⟨hsc, hcb, hbf, hfo, hcanonical, hother⟩
    have hselectedNe : qOutside ≠ canonicalSource :=
      ne_of_gt (lt_trans (lt_trans hcb hbf) hfo)
    have hendpoint :=
      endpointCentered_dist_eq_of_two_blocked_deletions
        hK4 (hboundary_mem qOutside) (hboundary_ne hselectedNe)
        hcanonical hother
    apply CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms
      hconvex hboundary_injective hboundary_image hboundary_ccw
    exact Or.inr (Or.inr (Or.inr
      ⟨hsc, hcb, lt_trans hbf hfo, hsourceBetween,
        hendpoint⟩))

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP -- [shard-prologue-state]

/-- Source-faithful first-fiber descent for one canonical cap source.  The
positive arm fixes the two cycle-selected collision hits; the other four arms
retain a five-center surviving deletion.  This is the finite ingress exposed
by `FirstFiberOverlapDescent`, not a contradiction by itself. -/
abbrev FirstFiberCapSourceDescentResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ATailFirstFiberOverlapDescent.FirstFiberCycleAlignedResidual
      P Pρ Q source LPρ MPρ LP MP ∨
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe in
/-- Every complete cap-source witness enters the exact five-arm first-fiber
descent.  All hypotheses used here are fields of the live source packet or
the ambient localized-deletion cycles. -/
theorem firstFiber_capSourceDescentResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source) :
    FirstFiberCapSourceDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ Q source := by
  rcases hsource with
    ⟨_hcap, _hinterior, _houtside, hcenterNeP, _hcenterNePρ,
      _hcenterNeApex1, _hcenterNeApex2, _hself, _hcard,
      hviewP, hviewPρ⟩
  exact
    ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion
      P Pρ Q source hcenterNeP hviewP.omits hviewPρ.omits
      LPρ hLPρ MPρ LP hLP MP
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)

/-- Consumer-ready product of the two independently source-clean first-fiber
descents.  It is a bounded `5 x 5` obstruction packet: each source contributes
one aligned-incidence arm or one of four explicit five-center deletions. -/
abbrev TwoCapSourcesFirstFiberDescentResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) : Prop :=
  FirstFiberCapSourceDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ Q C.firstSource ∧
    FirstFiberCapSourceDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ Q C.secondSource

/-- Concrete positive incidence/localization packet for the cap-source row
and a fresh third blocker fiber.  It fixes the actual cap-source witness:
the two distinct blockers lie in one indexed cap while both fiber sources
lie outside that cap and on the cap-source row. -/
abbrev FreshThirdSameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ capIndex : Fin 3,
    H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      Q.source₁.1 ∉ S.capByIndex capIndex ∧
      Q.source₂.1 ∉ S.capByIndex capIndex ∧
      Q.source₁.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source₂.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The positive same-cap cross-row alignment is impossible by ordered-cap
uniqueness: two distinct cap centers cannot bisect the same outside pair. -/
theorem false_of_freshThird_sameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False := by
  rcases halign with
    ⟨capIndex, hcommonCap, hsourceCap, hcentersNe,
      hsource₁Off, hsource₂Off, hsource₁Row, hsource₂Row⟩
  let Kcommon :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  let Ksource :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell.toSelectedFourClass
  have hoverlap :=
    selectedFourClass_outside_overlap_card_le_one
      S capIndex hcommonCap hsourceCap hcentersNe.symm Kcommon Ksource
  have hsource₁Common : Q.source₁.1 ∈ Kcommon.support := by
    exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Common : Q.source₂.1 ∈ Kcommon.support := by
    exact Q.source₂_mem_source₁_shell
  have hsource₁Overlap :
      Q.source₁.1 ∈
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)) := by
    exact
      Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hsource₁Common, hsource₁Off⟩,
          Finset.mem_sdiff.mpr ⟨hsource₁Row, hsource₁Off⟩⟩
  have hsource₂Overlap :
      Q.source₂.1 ∈
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)) := by
    exact
      Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hsource₂Common, hsource₂Off⟩,
          Finset.mem_sdiff.mpr ⟨hsource₂Row, hsource₂Off⟩⟩
  have hsourcesPointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have htwo :
      1 <
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)).card :=
    Finset.one_lt_card.mpr
      ⟨Q.source₁.1, hsource₁Overlap,
        Q.source₂.1, hsource₂Overlap, hsourcesPointsNe⟩
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The first collision row is exactly its two strict-cap sources together
with the two named off-cap points carried by the enlarged first blocker
fiber. -/
theorem firstFiber_shell_eq_explicitFour
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
  exact
    ATailFirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour P Pρ Q

/-- Source-exact witness carried by the cap-eight third-row surface, with the
existential source exposed so that the first-fiber descent can retain it. -/
abbrev FirstFiberCapSourceWitness
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  CapSourceThirdCanonicalRowWitness P Pρ source

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiberCapSourceWitness_of_crossPairSurvivals
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source) :
    FirstFiberCapSourceWitness P Pρ source := by
  rcases hsource with
    ⟨hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hfirstView, hsecondView⟩
  exact
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support,
      (H.selectedAt source.1
        source.2).toCriticalFourShell.support_card,
      ⟨hfirstView⟩, ⟨hsecondView⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The cap-eight margin produces two distinct strict-cap sources carrying the
complete first-fiber source witness.  This is the checked strengthening used
by the live first-fiber terminal. -/
private theorem exists_two_firstFiberCapSourceWitness
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        FirstFiberCapSourceWitness P Pρ source ∧
        FirstFiberCapSourceWitness P Pρ source' := by
  obtain ⟨source, source', hsourcesNe, hsource, hsource'⟩ :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
      P Pρ
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      hpairsDisjoint hcap
  rcases hsource with
    ⟨hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hfirstView, hsecondView⟩
  rcases hsource' with
    ⟨hsourceInterior', hsourceOutside',
      hcenterNeFirstBlocker', hcenterNeSecondBlocker',
      hcenterNeFirstApex', hcenterNeSecondApex',
      hfirstView', hsecondView'⟩
  refine ⟨source, source', hsourcesNe, ?_, ?_⟩
  · exact
      ⟨hcap, hsourceInterior, hsourceOutside,
        hcenterNeFirstBlocker, hcenterNeSecondBlocker,
        hcenterNeFirstApex, hcenterNeSecondApex,
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support_card,
        ⟨hfirstView⟩, ⟨hsecondView⟩⟩
  · exact
      ⟨hcap, hsourceInterior', hsourceOutside',
        hcenterNeFirstBlocker', hcenterNeSecondBlocker',
        hcenterNeFirstApex', hcenterNeSecondApex',
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_card,
        ⟨hfirstView'⟩, ⟨hsecondView'⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Lift two strict first-cap points on one fresh first-apex radius while
retaining the common-radius membership needed by blocker rigidity. -/
theorem exists_two_firstFiberCapSourceWitness_of_commonRadius
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (commonRadius : ℝ)
    (hcommonCard :
      2 ≤
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card)
    (hcommonNeRadius : commonRadius ≠ radius)
    (hcommonNeρ : commonRadius ≠ ρ) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        FirstFiberCapSourceWitness P Pρ source ∧
        FirstFiberCapSourceWitness P Pρ source' := by
  obtain
      ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
        hsource, hsource'⟩ :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius
      P Pρ
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      commonRadius hcommonCard hcommonNeRadius hcommonNeρ
  exact
    ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
      firstFiberCapSourceWitness_of_crossPairSurvivals
        P Pρ hcap source hsource,
      firstFiberCapSourceWitness_of_crossPairSurvivals
        P Pρ hcap source' hsource'⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Assemble the common-radius producer's output into the public two-source
packet.  This is the concrete ingress contract for the noncanonical
same-cap consumer below: the computation supplies `commonRadius`, while this
adapter retains both source rows and their source-exact deletion views. -/
theorem exists_two_capSourceThirdCanonicalRowSurface_of_commonRadius
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (commonRadius : ℝ)
    (hcommonCard :
      2 ≤
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card)
    (hcommonNeRadius : commonRadius ≠ radius)
    (hcommonNeρ : commonRadius ≠ ρ) :
    ∃ C : TwoCapSourceThirdCanonicalRowSurface P Pρ,
      C.firstSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        C.secondSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius := by
  rcases exists_two_firstFiberCapSourceWitness_of_commonRadius
      P Pρ T hcap commonRadius hcommonCard
      hcommonNeRadius hcommonNeρ with
    ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
      hsource, hsource'⟩
  refine ⟨
    { cap_card_ge_eight := hcap
      firstSource := source
      secondSource := source'
      sources_ne := hsourcesNe
      firstSource_data := hsource
      secondSource_data := hsource' },
    hsourceRadius, hsourceRadius'⟩

/-- In the aligned residual, every first-apex radius carrying at least two
strict first-cap points is one of the two retained collision radii. -/
abbrev FirstCapMultiPointRadiiRetained : Prop :=
  ∀ r : ℝ,
    2 ≤
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1).card →
      r = radius ∨ r = ρ

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The source-level producer extracted from failure of the aligned-radii
invariant.  This is the concrete reverse-selected-class ingress for the
FreshThird route: a radius with two strict-cap points yields the complete
two-source canonical-row packet, together with the common-radius facts that
the equal-center shell consumer requires. -/
theorem exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_of_not_retained
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (hnotRetained :
      ¬ FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ commonRadius : ℝ,
      2 ≤
          (SelectedClass D.A S.oppApex1 commonRadius ∩
            S.capInteriorByIndex S.oppIndex1).card ∧
      commonRadius ≠ radius ∧
      commonRadius ≠ ρ ∧
      ∃ C : TwoCapSourceThirdCanonicalRowSurface P Pρ,
        C.firstSource.1 ∈
            SelectedClass D.A S.oppApex1 commonRadius ∧
          C.secondSource.1 ∈
            SelectedClass D.A S.oppApex1 commonRadius := by
  change
    ¬ ∀ r : ℝ,
        2 ≤
            (SelectedClass D.A S.oppApex1 r ∩
              S.capInteriorByIndex S.oppIndex1).card →
          r = radius ∨ r = ρ at hnotRetained
  push_neg at hnotRetained
  rcases hnotRetained with
    ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ⟩
  rcases exists_two_capSourceThirdCanonicalRowSurface_of_commonRadius
      (P := P) (Pρ := Pρ) (T := T) hcap commonRadius hcommonCard
      hcommonNeRadius hcommonNeρ with
    ⟨C, hfirstRadius, hsecondRadius⟩
  exact ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ,
    C, hfirstRadius, hsecondRadius⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Structured form of the reverse-selected-class producer.  Downstream
normalization should use this form so the common radius cannot be silently
dropped when the source rows are repackaged. -/
theorem exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_packet_of_not_retained
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (hnotRetained :
      ¬ FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) := by
  rcases exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_of_not_retained
      (P := P) (Pρ := Pρ) (T := T) hcap hnotRetained with
    ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ,
      surface, hfirstRadius, hsecondRadius⟩
  exact ⟨
    { commonRadius := commonRadius
      cap_card_ge_eight := surface.cap_card_ge_eight
      commonRadius_card := hcommonCard
      commonRadius_ne_radius := hcommonNeRadius
      commonRadius_ne_ρ := hcommonNeρ
      surface := surface
      firstSource_mem := hfirstRadius
      secondSource_mem := hsecondRadius }⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- The second collision blocker cannot bisect the two explicit points outside
the first cap.  The distinct first collision blocker already bisects them, so
ordered-cap uniqueness forces the inequality without using the cap-source or
five-center deletion data. -/
theorem secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        Q.otherOutsidePoint := by
  intro hsecondEq
  have hsecondCenterCap :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior
  have hfirstCenterCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hfirstEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) Q.source.1 =
        dist (H.centerAt P.source₁ P.source₁_mem_A)
          Q.otherOutsidePoint :=
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 Q.source_mem_shell).trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_shell).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S S.oppIndex1 hsecondCenterCap hfirstCenterCap hblockersNe
      Q.source.2 Q.otherOutsidePoint_mem_A
      Q.otherOutsidePoint_ne_source.symm
      Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
      hsecondEq hfirstEq

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two cap-source rows contain one another's sources. -/
abbrev TwoCapSourcesMutualCrossMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  source'.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    source.1 ∈
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem common_omission_or_complementary_membership
    {α : Type*}
    (K K' : Finset α) (a b : α)
    (hK : a ∉ K ∨ b ∉ K)
    (hK' : a ∉ K' ∨ b ∉ K') :
    ((a ∉ K ∧ a ∉ K') ∨ (b ∉ K ∧ b ∉ K')) ∨
      ((a ∈ K ∧ b ∈ K') ∨ (b ∈ K ∧ a ∈ K')) := by
  classical
  by_cases haCommon : a ∉ K ∧ a ∉ K'
  · exact Or.inl (Or.inl haCommon)
  by_cases hbCommon : b ∉ K ∧ b ∉ K'
  · exact Or.inl (Or.inr hbCommon)
  right
  rcases hK with haK | hbK
  · rcases hK' with haK' | hbK'
    · exact False.elim (haCommon ⟨haK, haK'⟩)
    · refine Or.inr ⟨?_, ?_⟩
      · by_contra hbK
        exact hbCommon ⟨hbK, hbK'⟩
      · by_contra haK'
        exact haCommon ⟨haK, haK'⟩
  · rcases hK' with haK' | hbK'
    · refine Or.inl ⟨?_, ?_⟩
      · by_contra haK
        exact haCommon ⟨haK, haK'⟩
      · by_contra hbK'
        exact hbCommon ⟨hbK, hbK'⟩
    · exact False.elim (hbCommon ⟨hbK, hbK'⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- One retained collision endpoint omitted by both cap-source rows. -/
abbrev CommonCollisionEndpointOmission
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ z : ℝ²,
    z ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∧
      z ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
      z ∉
          (H.selectedAt source'.1
            source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Both equal-blocker source rows omit every collision endpoint.  The exact
two-point cap intersection is stronger than the earlier existential common
omission because all four collision endpoints lie in the indexed cap while
both cap sources lie outside the two collision pairs. -/
abbrev AllCollisionEndpointsOmitted
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    : Prop :=
  ∀ z ∈
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}),
    z ∉
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support ∧
      z ∉
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact common-blocker shell intersection upgrades the earlier
existential common omission to simultaneous omission of all four collision
endpoints by both equal-blocker rows. -/
theorem allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1}) :
    AllCollisionEndpointsOmitted P Pρ source source' := by
  classical
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val blockers_eq
  have hshellsEq :
      (H.selectedAt source.1
          source.2).toCriticalFourShell.support =
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H source.1 source.2,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H source'.1 source'.2,
      hcentersEq]
  intro z hzEndpoints
  have hzCap : z ∈ S.capByIndex S.oppIndex1 := by
    have hzCases := hzEndpoints
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hzCases
    rcases hzCases with (rfl | rfl) | (rfl | rfl)
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior
  have hzNeSource : z ≠ source.1 := by
    intro hz
    subst z
    exact source_witness.2.2.1 hzEndpoints
  have hzNeSource' : z ≠ source'.1 := by
    intro hz
    subst z
    exact source'_witness.2.2.1 hzEndpoints
  have hzNotFirst :
      z ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support := by
    intro hzSupport
    have hzPair : z ∈ ({source.1, source'.1} : Finset ℝ²) := by
      rw [← shell_inter_cap_eq]
      exact Finset.mem_inter.mpr ⟨hzSupport, hzCap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    exact hzPair.elim hzNeSource hzNeSource'
  exact ⟨hzNotFirst, by simpa only [← hshellsEq] using hzNotFirst⟩

/-- The two cross-pair omission views have a finite exact alternative.  Either
one collision endpoint is absent from both selected supports, or the two
supports make complementary choices from each collision pair. -/
theorem commonCollisionEndpointOmission_or_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    CommonCollisionEndpointOmission P Pρ source source' ∨
      (((P.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)) ∧
        ((Pρ.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (Pρ.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support))) := by
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, _, hfirst, hsecond⟩
  rcases hsource' with
    ⟨_, _, _, _, _, _, _, _, _, hfirst', hsecond'⟩
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  have hfirstSplit :=
    common_omission_or_complementary_membership
      K K' P.source₁ P.source₂ hfirst.omits hfirst'.omits
  have hsecondSplit :=
    common_omission_or_complementary_membership
      K K' Pρ.source₁ Pρ.source₂ hsecond.omits hsecond'.omits
  rcases hfirstSplit with hfirstCommon | hfirstComplementary
  · rcases hfirstCommon with hcommon | hcommon
    · exact Or.inl ⟨P.source₁, by simp, hcommon.1, hcommon.2⟩
    · exact Or.inl ⟨P.source₂, by simp, hcommon.1, hcommon.2⟩
  · rcases hsecondSplit with hsecondCommon | hsecondComplementary
    · rcases hsecondCommon with hcommon | hcommon
      · exact Or.inl ⟨Pρ.source₁, by simp, hcommon.1, hcommon.2⟩
      · exact Or.inl ⟨Pρ.source₂, by simp, hcommon.1, hcommon.2⟩
    · exact Or.inr ⟨hfirstComplementary, hsecondComplementary⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Equal actual blockers turn the complementary choices for both collision
pairs into all four endpoints on one support.  Together with the two distinct
mutually incident cap sources this would put six distinct points on a support
of cardinality four. -/
theorem false_of_equalBlockers_complementaryMembership
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersEq :
      H.blockerVertex source = H.blockerVertex source')
    (hcomplementary :
      (((P.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)) ∧
        ((Pρ.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (Pρ.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)))) :
    False := by
  classical
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  change
    (((P.source₁ ∈ K ∧ P.source₂ ∈ K') ∨
        (P.source₂ ∈ K ∧ P.source₁ ∈ K')) ∧
      ((Pρ.source₁ ∈ K ∧ Pρ.source₂ ∈ K') ∨
        (Pρ.source₂ ∈ K ∧ Pρ.source₁ ∈ K'))) at hcomplementary
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val hblockersEq
  have hsupportsEq : K = K' := by
    exact
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 source'.2 hcentersEq
  rcases hsource with
    ⟨_, _, hsourceOutside, _, _, _, _, hsourceMem, hsupportCard, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  change source.1 ∈ K at hsourceMem
  change K.card = 4 at hsupportCard
  have hsource'Mem : source'.1 ∈ K := hmutual.1
  have hP₁Mem : P.source₁ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hP₂Mem : P.source₂ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hPρ₁Mem : Pρ.source₁ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hPρ₂Mem : Pρ.source₂ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hsourceNeP₁ : source.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNeP₂ : source.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₁ : source.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₂ : source.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsource'NeP₁ : source'.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NeP₂ : source'.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₁ : source'.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₂ : source'.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hP₁NotPairρ :
      P.source₁ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₂NotPairρ :
      P.source₂ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₁NePρ₁ : P.source₁ ≠ Pρ.source₁ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₁NePρ₂ : P.source₁ ≠ Pρ.source₂ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₂NePρ₁ : P.source₂ ≠ Pρ.source₁ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  have hP₂NePρ₂ : P.source₂ ≠ Pρ.source₂ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  let six : Finset ℝ² :=
    {source.1, source'.1,
      P.source₁, P.source₂, Pρ.source₁, Pρ.source₂}
  have hsixSubset : six ⊆ K := by
    intro x hx
    simp only [six, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl | rfl
    · exact hsourceMem
    · exact hsource'Mem
    · exact hP₁Mem
    · exact hP₂Mem
    · exact hPρ₁Mem
    · exact hPρ₂Mem
  have hsixCard : six.card = 6 := by
    simp [six, hsourcesNe,
      hsourceNeP₁, hsourceNeP₂, hsourceNePρ₁, hsourceNePρ₂,
      hsource'NeP₁, hsource'NeP₂, hsource'NePρ₁, hsource'NePρ₂,
      P.sources_ne, Pρ.sources_ne,
      hP₁NePρ₁, hP₁NePρ₂, hP₂NePρ₁, hP₂NePρ₂]
  have hcardLe : six.card ≤ K.card :=
    Finset.card_le_card hsixSubset
  rw [hsixCard, hsupportCard] at hcardLe
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At least one cap-source row survives deletion of the other source. -/
abbrev TwoCapSourcesOneSidedDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase source'.1)
      (H.centerAt source.1 source.2) ∨
    HasNEquidistantPointsAt 4 (D.A.erase source.1)
      (H.centerAt source'.1 source'.2)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The exact selected supports give an exhaustive two-source split: either
both cross-incidences occur, or one source can be deleted while preserving
the other source's exact-four row. -/
theorem mutualCrossMembership_or_oneSidedDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) :
    TwoCapSourcesMutualCrossMembership (H := H) source source' ∨
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source' := by
  by_cases hforward :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · by_cases hbackward :
        source.1 ∈
          (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
    · exact Or.inl ⟨hforward, hbackward⟩
    · exact Or.inr <| Or.inr <|
        (cross_deletion_survives_iff_not_mem_selected_support
          H source'.2).2 hbackward
  · exact Or.inr <| Or.inl <|
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hforward

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The common-radius packet exposes the exact equal-blocker trace or the
one-sided deletion survivor for its two same-radius cap sources. -/
theorem commonRadius_pair_equalBlockerExactTrace_or_oneSidedDeletionSurvival
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hblockersEq :
      H.blockerVertex C.surface.firstSource =
        H.blockerVertex C.surface.secondSource)
    (hshellInterCapEq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {C.surface.firstSource.1, C.surface.secondSource.1}) :
    AllCollisionEndpointsOmitted P Pρ
        C.surface.firstSource C.surface.secondSource ∨
      TwoCapSourcesOneSidedDeletionSurvival (H := H)
        C.surface.firstSource C.surface.secondSource := by
  rcases mutualCrossMembership_or_oneSidedDeletionSurvival
      C.surface.firstSource C.surface.secondSource with
    hmutual | hsurvival
  · exact Or.inl <|
      allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
        (P := P) (Pρ := Pρ) C.surface.firstSource C.surface.secondSource
        C.surface.firstSource_data C.surface.secondSource_data
        hblockersEq hshellInterCapEq
  · exact Or.inr hsurvival

/-- A retained cap-source witness is a source-exposed instance of the original
cap-source surface. -/
private theorem capSourceSurface_of_firstFiberWitness
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  exact ⟨hsource.1, source, hsource.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Mutual cross-membership at one fresh blocker value is exactly a fresh
third blocker fiber. -/
private theorem freshThirdBlockerFiber_of_mutualCrossMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hblockersEq : H.blockerVertex source = H.blockerVertex source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source') :
    Nonempty (FreshThirdBlockerFiber P Pρ) := by
  rcases hsource with
    ⟨_, _, hsourceOutside, hcenterNeFirst, hcenterNeSecond,
      _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  have hsFirst₁ : source.1 ≠ P.source₁ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsFirst₂ : source.1 ≠ P.source₂ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsSecond₁ : source.1 ≠ Pρ.source₁ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsSecond₂ : source.1 ≠ Pρ.source₂ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsFirst₁' : source'.1 ≠ P.source₁ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsFirst₂' : source'.1 ≠ P.source₂ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsSecond₁' : source'.1 ≠ Pρ.source₁ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsSecond₂' : source'.1 ≠ Pρ.source₂ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  refine ⟨{
    source₁ := source
    source₂ := source'
    sources_ne := ?_
    blockers_eq := hblockersEq
    blocker_ne_first := ?_
    blocker_ne_second := ?_
    source₁_ne_first₁ := ?_
    source₁_ne_first₂ := ?_
    source₁_ne_second₁ := ?_
    source₁_ne_second₂ := ?_
    source₂_ne_first₁ := ?_
    source₂_ne_first₂ := ?_
    source₂_ne_second₁ := ?_
    source₂_ne_second₂ := ?_
    source₁_mem_source₂_shell := hmutual.2
    source₂_mem_source₁_shell := hmutual.1 }⟩
  · intro heq
    exact hsourcesNe (congrArg Subtype.val heq)
  · intro heq
    exact hcenterNeFirst (congrArg Subtype.val heq)
  · intro heq
    exact hcenterNeSecond (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₁ (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₂ (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₁ (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₂ (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₁' (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₂' (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₁' (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₂' (congrArg Subtype.val heq)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two mutually incident selected exact-four rows with distinct blocker
values overlap at exactly their two source points. -/
theorem selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support =
      {source.1, source'.1} := by
  let K := (H.selectedAt source.1 source.2).toCriticalFourShell
  let K' := (H.selectedAt source'.1 source'.2).toCriticalFourShell
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    apply Subtype.ext
    exact hcenters
  have hinterLe : (K.support ∩ K'.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two
      K.toSelectedFourClass K'.toSelectedFourClass hcentersNe
  have hpairSubset :
      ({source.1, source'.1} : Finset _) ⊆ K.support ∩ K'.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨K.q_mem_support, hmutual.2⟩
    · exact Finset.mem_inter.mpr
        ⟨hmutual.1, K'.q_mem_support⟩
  have hpairEq :
      ({source.1, source'.1} : Finset _) = K.support ∩ K'.support :=
    Finset.eq_of_subset_of_card_le hpairSubset (by
      simpa [hsourcesNe] using hinterLe)
  exact hpairEq.symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Once two distinct actual blockers both bisect a source pair, every other
actual blocker whose selected row contains that pair is one of the two. -/
theorem blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
    (source source' u : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (huSource :
      source.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support)
    (huSource' :
      source'.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support) :
    H.blockerVertex u = H.blockerVertex source ∨
      H.blockerVertex u = H.blockerVertex source' := by
  let c := H.centerAt source.1 source.2
  let c' := H.centerAt source'.1 source'.2
  let cu := H.centerAt u.1 u.2
  have hcA : c ∈ D.A := by
    simpa [c, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex source).2
  have hcA' : c' ∈ D.A := by
    simpa [c', CriticalShellSystem.blockerVertex] using
      (H.blockerVertex source').2
  have hcuA : cu ∈ D.A := by
    simpa [cu, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex u).2
  have hcc' : c ≠ c' := by
    intro h
    apply hblockersNe'
    apply Subtype.ext
    exact h
  have hcEq :
      dist c source.1 = dist c source'.1 := by
    exact
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
          source.1
          (H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
            source'.1 hmutual.1).symm
  have hcEq' :
      dist c' source.1 = dist c' source'.1 := by
    exact
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
          source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
            source'.1
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.q_mem_support).symm
  have hcuEq :
      dist cu source.1 = dist cu source'.1 := by
    exact
      ((H.selectedAt u.1 u.2).toCriticalFourShell.support_eq_radius
          source.1 huSource).trans
        ((H.selectedAt u.1
          u.2).toCriticalFourShell.support_eq_radius
            source'.1 huSource').symm
  by_cases hcuEqC : cu = c
  · exact Or.inl (by
      apply Subtype.ext
      exact hcuEqC)
  by_cases hcuEqC' : cu = c'
  · exact Or.inr (by
      apply Subtype.ext
      exact hcuEqC')
  have hbound :=
    Dumitrescu.perpBisector_apex_bound
      D.convex source.2 source'.2 hsourcesNe
  have hcFilter :
      c ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcA, hcEq⟩
  have hcFilter' :
      c' ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcA', hcEq'⟩
  have hcuFilter :
      cu ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcuA, hcuEq⟩
  have hthree :
      2 <
        (D.A.filter
          (fun z => dist z source.1 = dist z source'.1)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨c, hcFilter, c', hcFilter', cu, hcuFilter,
        hcc', Ne.symm hcuEqC, Ne.symm hcuEqC'⟩
  exact False.elim ((not_lt_of_ge hbound) hthree)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At every actual blocker, one source deletion preserves the selected
exact-four row unless that blocker is one of the two saturated pair centers. -/
theorem sourceDeletionSurvival_or_blockerVertex_eq_mutualPair
    (source source' u : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    HasNEquidistantPointsAt 4 (D.A.erase source.1)
        (H.centerAt u.1 u.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase source'.1)
        (H.centerAt u.1 u.2) ∨
      H.blockerVertex u = H.blockerVertex source ∨
      H.blockerVertex u = H.blockerVertex source' := by
  by_cases huSource :
      source.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support
  · by_cases huSource' :
        source'.1 ∈
          (H.selectedAt u.1 u.2).toCriticalFourShell.support
    · rcases
        blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
          source source' u hsourcesNe hmutual hblockersNe'
          huSource huSource' with hblocker | hblocker
      · exact Or.inr (Or.inr (Or.inl hblocker))
      · exact Or.inr (Or.inr (Or.inr hblocker))
    · exact Or.inr (Or.inl <|
        (cross_deletion_survives_iff_not_mem_selected_support
          H u.2).2 huSource')
  · exact Or.inl <|
      (cross_deletion_survives_iff_not_mem_selected_support
        H u.2).2 huSource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Every actual blocker avoids the three robust Moser apices and therefore
belongs to the strict interior of one indexed cap. -/
theorem exists_blockerCenter_mem_capInteriorByIndex
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ i : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i := by
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  have hblockerNe₁ : H.blockerVertex source ≠ apex₁ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H source apex₁.2
  have hblockerNe₂ : H.blockerVertex source ≠ apex₂ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H source apex₂.2
  have hblockerNe₃ : H.blockerVertex source ≠ apex₃ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H source apex₃.2
  have hcenterNe₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 := by
    intro h
    apply hblockerNe₁
    apply Subtype.ext
    simpa [apex₁] using h
  have hcenterNe₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 := by
    intro h
    apply hblockerNe₂
    apply Subtype.ext
    simpa [apex₂] using h
  have hcenterNe₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex := by
    intro h
    apply hblockerNe₃
    apply Subtype.ext
    simpa [apex₃] using h
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      (H.blockerVertex source).2 with htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim (hcenterNe₃ (by simpa using hsurplus))
    · exact False.elim (hcenterNe₁ (by simpa using hfirst))
    · exact False.elim (hcenterNe₂ (by simpa using hsecond))
  · exact hcap

/-! The former negative fresh-third leaf hid four positive geometric cases
behind the single residual `¬ FreshThirdSameCapCrossRowAlignment`.  The
following packet records the checked alternatives explicitly: equal blocker
centers, a surviving one-point deletion, distinct blocker caps, or a same-cap
fiber source. -/
inductive FreshThirdCapSourceInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Type where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))
  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCapWithInternalFiberSource
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex capIndex)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
          Q.source₂.1 ∈ S.capByIndex capIndex)

/-- A cap-source row supplies a genuinely new perpendicular-bisector center
for the fresh blocker pair. -/
abbrev FreshThirdCrossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
    Q.source₁.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    Q.source₂.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support

/-- Positive normal form for the complement of two distinct cross-row
centers. It exposes the three mathematical residual arms without splitting
the load-bearing obligation into constructor-product leaves. -/
abbrev FreshThirdCrossRowResidual
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ¬ FreshThirdCrossRowHit P Pρ firstSource Q ∨
    ¬ FreshThirdCrossRowHit P Pρ secondSource Q ∨
    H.centerAt firstSource.1 firstSource.2 =
      H.centerAt secondSource.1 secondSource.2

/-- Positive data hidden by the failure of one cap-source cross-row hit. -/
inductive FreshThirdCapSourceNonHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))

/-- A surviving source-row omission separates the source-row center from the
actual blocker center of the omitted fresh source.  This is the first
source-clean part of the FreshThird producer: it turns the deletion packet
into a center inequality without assuming a cap placement or a finite bound.
-/
theorem freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (deletion_survives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
        (H.centerAt source.1 source.2)) :
    H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 := by
  rcases deleted_eq with rfl | rfl
  · have hne :=
      _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.source₁.2 deletion_survives
    intro h
    exact hne h.symm
  · have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hne :=
      _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.source₂.2 deletion_survives
    intro h
    exact hne (hQCenters.symm.trans h.symm)

/-- Once the cap-wide producer has aligned the same fresh endpoint at two
source rows, the existing common-deletion packet constructor can consume the
survival facts directly.  This is intentionally an adapter with no new
geometric content: the missing producer is the theorem that supplies
`q_is_fresh`, both survivals, and center separation. -/
theorem nonempty_freshThird_fixedQ_commonDeletionPacket_of_alignedSurvivals
    (Q : FreshThirdBlockerFiber P Pρ)
    (q : ℝ²)
    (q_is_fresh : q = Q.source₁.1 ∨ q = Q.source₂.1)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (centers_ne :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2)
    (survives_source :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source.1 source.2))
    (survives_source' :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source'.1 source'.2)) :
    Nonempty
      (CommonDeletionTwoCenterPacket D H q
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)) := by
  have hqA : q ∈ D.A := by
    rcases q_is_fresh with rfl | rfl
    · exact Q.source₁.2
    · exact Q.source₂.2
  have hcenter_sourceA :
      H.centerAt source.1 source.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have hcenter_source'A :
      H.centerAt source'.1 source'.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.center_mem).2
  exact
    ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
      hqA hcenter_sourceA hcenter_source'A centers_ne
        survives_source survives_source'

namespace FreshThirdCapSourceInteraction

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor normalization for a failed cross-row hit.  The two geometric
interaction constructors are themselves cross-row hits, so only equal blocker
or source-row omission can survive. -/
theorem nonHit_of_not_crossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction : FreshThirdCapSourceInteraction P Pρ source Q)
    (hnot : ¬ FreshThirdCrossRowHit P Pρ source Q) :
    FreshThirdCapSourceNonHit P Pρ source Q := by
  cases interaction with
  | sameBlocker center_eq support_eq =>
      exact .sameBlocker center_eq support_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
      exact .sourceRowOmission deleted deleted_eq deleted_not_mem
        deletion_survives
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      _ _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim

end FreshThirdCapSourceInteraction

/-- Three positive normalized cases left after removing two distinct
cross-row centers.  This is deliberately a data packet, not three new proof
obligations. -/
inductive FreshThirdNormalizedResidualCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
  | secondNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)

/-! The canonical-cap equal-center terminal consumes exactly one positive
interaction shape.  Keep the other positive shapes explicit so the
load-bearing residual leaf cannot silently widen back to the original
constructor product. -/
inductive FreshThirdNonCanonicalInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCapWithInternalFiberSource
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex capIndex)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
          Q.source₂.1 ∈ S.capByIndex capIndex)
      (hcapIndex : capIndex ≠ S.oppIndex1)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Turn the explicit logical complement into constructor-specific positive
data while retaining both original interaction packets at the caller. -/
theorem freshThirdNormalizedResidualCase_of_crossRowResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual :
      FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q) :
    FreshThirdNormalizedResidualCase P Pρ C Q := by
  by_cases hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q
  · by_cases hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q
    · rcases hresidual with hfirst' | hsecond' | hcenters
      · exact (hfirst' hfirst).elim
      · exact (hsecond' hsecond).elim
      · exact .equalCrossRowCenters hfirst hsecond hcenters
    · exact .secondNonHit
        (FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
          (P := P) (Pρ := Pρ) C.secondSource Q secondInteraction hsecond)
  · exact .firstNonHit
      (FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
        (P := P) (Pρ := Pρ) C.firstSource Q firstInteraction hfirst)

/-- The rigid positive packet in the equal-center residual: both cap-source
rows are the same exact four-point row, containing precisely the two cap
sources and the two fresh sources. -/
structure FreshThirdEqualCenterExactFourRow
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  centers_eq :
    H.centerAt C.firstSource.1 C.firstSource.2 =
      H.centerAt C.secondSource.1 C.secondSource.2
  capCenter_ne_freshCenter :
    H.centerAt C.firstSource.1 C.firstSource.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2
  first_support_eq :
    (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}
  second_support_eq :
    (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Equal cap-source centers in the both-hit arm force the selected row to be
the named four-source row. -/
theorem freshThirdEqualCenterExactFourRow_of_hits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    FreshThirdEqualCenterExactFourRow P Pρ C Q := by
  have hQCenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 :=
    congrArg Subtype.val Q.blockers_eq
  have hfirstQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hfirstQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hsecondQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hsecondQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hradii :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.radius =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.radius =
          dist (H.centerAt C.firstSource.1 C.firstSource.2) Q.source₁.1 :=
        ((H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.support_eq_radius
          Q.source₁.1 hfirst.2.1).symm
      _ = dist (H.centerAt C.secondSource.1 C.secondSource.2)
          Q.source₁.1 := by rw [hcenters]
      _ = (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.radius :=
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support_eq_radius
            Q.source₁.1 hsecond.2.1
  have hcenterDistances (z : ℝ²) :
      dist (H.centerAt C.firstSource.1 C.firstSource.2) z =
        dist (H.centerAt C.secondSource.1 C.secondSource.2) z :=
    congrArg (fun center ↦ dist center z) hcenters
  have hsupports :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
          D.A.filter (fun z ↦
            dist (H.centerAt C.firstSource.1 C.firstSource.2) z =
              (H.selectedAt C.firstSource.1
                C.firstSource.2).toCriticalFourShell.radius) :=
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq
      _ = D.A.filter (fun z ↦
            dist (H.centerAt C.secondSource.1 C.secondSource.2) z =
              (H.selectedAt C.secondSource.1
                C.secondSource.2).toCriticalFourShell.radius) := by
        apply Finset.filter_congr
        intro z _
        rw [hcenterDistances z, hradii]
      _ = (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support :=
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support_eq.symm
  have hsecond_mem_first :
      C.secondSource.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.q_mem_support
  have hnamedSubset :
      ({C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :
          Finset ℝ²) ⊆
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support
    · exact hsecond_mem_first
    · exact hfirst.2.1
    · exact hfirst.2.2
  have hnamedCard :
      ({C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :
          Finset ℝ²).card = 4 := by
    simp [C.sources_ne, hfirstQ₁, hfirstQ₂, hsecondQ₁, hsecondQ₂,
      Q.sources_ne]
  have hfirstSupport :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :=
    (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [(H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_card, hnamedCard])).symm
  refine ⟨hcenters, hfirst.1, hfirstSupport, ?_⟩
  exact hsupports.symm.trans hfirstSupport

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The equal-center exact-row packet has no further support intersection:
the two fresh endpoints are the entire intersection with the fresh blocker
row.  This packages the noncanonical equal-center geometry for a future
consumer without changing the blocker fiber. -/
theorem freshThirdEqualCenter_sourceFreshSupport_inter_eq_pair_of_hits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∩
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
      {Q.source₁.1, Q.source₂.1} := by
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  have hpairSubset :
      ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) ⊆
        ((H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hfirst.2.1,
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support⟩
    · exact Finset.mem_inter.mpr ⟨hfirst.2.2, Q.source₂_mem_source₁_shell⟩
  let Ksource :=
    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.toSelectedFourClass
  let Kfresh :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hinter_card :
      ((H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∩
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card ≤ 2 := by
    simpa [Ksource, Kfresh, CriticalFourShell.toSelectedFourClass] using
      (SelectedFourClass.inter_card_le_two Ksource Kfresh
        hexact.capCenter_ne_freshCenter)
  have hpair_card :
      ({Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 2 := by
    simp [Q.sources_ne]
  exact
    (Finset.eq_of_subset_of_card_le hpairSubset
      (by simpa [hpair_card] using hinter_card)).symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The equal-center exact-row packet is impossible when a same-cap
interaction places the common cap-source center in the canonical opposite cap.
The two cap sources and one internal fresh source then give three points in a
selected four-class intersected with that cap, contradicting the ordered-cap
two-point bound. -/
theorem false_of_freshThirdEqualCenter_sameCapOppIndex
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (capIndex : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex capIndex)
    (fiberSource_mem_cap :
      Q.source₁.1 ∈ S.capByIndex capIndex ∨
        Q.source₂.1 ∈ S.capByIndex capIndex)
    (hcapIndex : capIndex = S.oppIndex1) :
    False := by
  subst capIndex
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  let K :=
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell.toSelectedFourClass
  have hfirst_mem_K : C.firstSource.1 ∈ K.support := by
    exact
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecond_mem_K : C.secondSource.1 ∈ K.support := by
    change C.secondSource.1 ∈
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hfirst_cap : C.firstSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 C.firstSource_data.2.1
  have hsecond_cap : C.secondSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 C.secondSource_data.2.1
  have hcenter_cap :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 sourceCenter_mem
  have hfirstQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hsecondQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hfirstQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hfirst.1
    have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hcarrier : C.firstSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hsecondQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hsecond.1
    have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hcarrier : C.secondSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hle :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex1 K hcenter_cap
  rcases fiberSource_mem_cap with hq₁ | hq₂
  · have hsubset :
        ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²) ⊆
          K.support ∩ S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirst_mem_K, hfirst_cap⟩
      · exact Finset.mem_inter.mpr ⟨hsecond_mem_K, hsecond_cap⟩
      · exact Finset.mem_inter.mpr ⟨source₁_mem, hq₁⟩
    have hcard :
        ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²).card = 3 := by
      simp [C.sources_ne, hfirstQ₁, hsecondQ₁]
    have hge : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex1).card := by
      calc
        3 = ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²).card :=
          hcard.symm
        _ ≤ (K.support ∩ S.capByIndex S.oppIndex1).card :=
          Finset.card_le_card hsubset
    omega
  · have hsubset :
        ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²) ⊆
          K.support ∩ S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirst_mem_K, hfirst_cap⟩
      · exact Finset.mem_inter.mpr ⟨hsecond_mem_K, hsecond_cap⟩
      · exact Finset.mem_inter.mpr ⟨source₂_mem, hq₂⟩
    have hcard :
        ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²).card = 3 := by
      simp [C.sources_ne, hfirstQ₂, hsecondQ₂]
    have hge : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex1).card := by
      calc
        3 = ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²).card :=
          hcard.symm
        _ ≤ (K.support ∩ S.capByIndex S.oppIndex1).card :=
          Finset.card_le_card hsubset
    omega

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center exact-row arm, the existing finite endpoint split
eliminates complementary membership.  Thus a collision endpoint is omitted
by the common cap-source row. -/
theorem commonCollisionEndpointOmission_of_equalCenterHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    CommonCollisionEndpointOmission P Pρ C.firstSource C.secondSource := by
  rcases commonCollisionEndpointOmission_or_complementaryMembership
      (P := P) (Pρ := Pρ)
      hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      C.firstSource C.secondSource
      C.firstSource_data C.secondSource_data with hcommon | hcomplementary
  · exact hcommon
  · have hexact :=
      freshThirdEqualCenterExactFourRow_of_hits
        (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
    have hmutual :
        TwoCapSourcesMutualCrossMembership
          (H := H) C.firstSource C.secondSource := by
      constructor
      · rw [hexact.first_support_eq]
        simp
      · rw [hexact.second_support_eq]
        simp
    have hblockersEq :
        H.blockerVertex C.firstSource = H.blockerVertex C.secondSource := by
      apply Subtype.ext
      exact hcenters
    exact
      (false_of_equalBlockers_complementaryMembership
        (P := P) (Pρ := Pρ) hpairsDisjoint
        C.firstSource C.secondSource C.sources_ne
        C.firstSource_data C.secondSource_data hmutual hblockersEq
        hcomplementary).elim

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center exact-row arm, every endpoint of the two retained
collision pairs is omitted by both cap-source rows.  The exact four-point
support packet supplies the common row names; freshness of the third blocker
supplies their disjointness from the collision endpoints. -/
theorem allCollisionEndpointsOmitted_of_equalCenterHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    AllCollisionEndpointsOmitted P Pρ C.firstSource C.secondSource := by
  classical
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  have hQ₁Outside :
      Q.source₁.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₁_ne_first₁ (Subtype.ext h),
          fun h => Q.source₁_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₁_ne_second₁ (Subtype.ext h),
        fun h => Q.source₁_ne_second₂ (Subtype.ext h)⟩
  have hQ₂Outside :
      Q.source₂.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₂_ne_first₁ (Subtype.ext h),
          fun h => Q.source₂_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₂_ne_second₁ (Subtype.ext h),
        fun h => Q.source₂_ne_second₂ (Subtype.ext h)⟩
  intro z hz
  have hzNeFirst : z ≠ C.firstSource.1 := by
    intro h
    subst z
    exact C.firstSource_data.2.2.1 hz
  have hzNeSecond : z ≠ C.secondSource.1 := by
    intro h
    subst z
    exact C.secondSource_data.2.2.1 hz
  have hzNeQ₁ : z ≠ Q.source₁.1 := by
    intro h
    subst z
    exact hQ₁Outside hz
  have hzNeQ₂ : z ≠ Q.source₂.1 := by
    intro h
    subst z
    exact hQ₂Outside hz
  constructor
  · rw [hexact.first_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))
  · rw [hexact.second_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct cap-source cross-row centers, together with the fresh common
blocker, would give three carrier points on the perpendicular bisector of the
two fresh sources, contradicting the convex-carrier two-center bound. -/
theorem false_of_two_freshThirdCrossRowHits_distinctCenters
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (hfirst : FreshThirdCrossRowHit P Pρ firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ secondSource Q)
    (hcentersNe :
      H.centerAt firstSource.1 firstSource.2 ≠
        H.centerAt secondSource.1 secondSource.2) :
    False := by
  let commonCenter := H.centerAt Q.source₁.1 Q.source₁.2
  let firstCenter := H.centerAt firstSource.1 firstSource.2
  let secondCenter := H.centerAt secondSource.1 secondSource.2
  have hcommonA : commonCenter ∈ D.A := by
    simpa [commonCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex Q.source₁).2
  have hfirstA : firstCenter ∈ D.A := by
    simpa [firstCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex firstSource).2
  have hsecondA : secondCenter ∈ D.A := by
    simpa [secondCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex secondSource).2
  have hcommonEq :
      dist commonCenter Q.source₁.1 =
        dist commonCenter Q.source₂.1 := by
    exact
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 Q.source₂_mem_source₁_shell).symm
  have hfirstEq :
      dist firstCenter Q.source₁.1 =
        dist firstCenter Q.source₂.1 := by
    exact
      (H.selectedAt firstSource.1
          firstSource.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1 hfirst.2.1
      |>.trans
        ((H.selectedAt firstSource.1
            firstSource.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 hfirst.2.2).symm
  have hsecondEq :
      dist secondCenter Q.source₁.1 =
        dist secondCenter Q.source₂.1 := by
    exact
      (H.selectedAt secondSource.1
          secondSource.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1 hsecond.2.1
      |>.trans
        ((H.selectedAt secondSource.1
            secondSource.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 hsecond.2.2).symm
  have hsourcesNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hbound :=
    Dumitrescu.perpBisector_apex_bound D.convex
      Q.source₁.2 Q.source₂.2 hsourcesNe
  have hcommonFilter :
      commonCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hcommonA, hcommonEq⟩
  have hfirstFilter :
      firstCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hfirstA, hfirstEq⟩
  have hsecondFilter :
      secondCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hsecondA, hsecondEq⟩
  have hthree :
      2 < (D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1)).card := by
    rw [Finset.two_lt_card]
    exact ⟨commonCenter, hcommonFilter,
      firstCenter, hfirstFilter, secondCenter, hsecondFilter,
      hfirst.1.symm, hsecond.1.symm, hcentersNe⟩
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/- Normalize a cap-source/fresh-fiber pair into the four positive
interaction cases. The only excluded case is the already checked impossible
same-cap alignment with both fiber sources outside the common cap. -/
theorem nonempty_freshThirdCapSourceInteraction_of_noAlignment
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hnoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    Nonempty (FreshThirdCapSourceInteraction P Pρ source Q) := by
  by_cases hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2
  · have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 Q.source₁.2 hcentersEq
    exact ⟨.sameBlocker hcentersEq hsupports⟩
  · by_cases hsource₁ :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support
    · by_cases hsource₂ :
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support
      · let Ksource :=
          (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        let Kfresh :=
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
        have hq₁Fresh : Q.source₁.1 ∈ Kfresh.support := by
          exact
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.q_mem_support
        have hq₂Fresh : Q.source₂.1 ∈ Kfresh.support := by
          exact Q.source₂_mem_source₁_shell
        have hsourcePointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
          intro h
          exact Q.sources_ne (Subtype.ext h)
        have hoverlapLe :
            (Ksource.support ∩ Kfresh.support).card ≤ 2 :=
          SelectedFourClass.inter_card_le_two Ksource Kfresh hcentersEq
        have hpairSubset :
            ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) ⊆
              Ksource.support ∩ Kfresh.support := by
          intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact Finset.mem_inter.mpr ⟨hsource₁, hq₁Fresh⟩
          · exact Finset.mem_inter.mpr ⟨hsource₂, hq₂Fresh⟩
        have hpairCard :
            ({Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 2 := by
          simp [hsourcePointsNe]
        have hoverlapEq :
            Ksource.support ∩ Kfresh.support =
              {Q.source₁.1, Q.source₂.1} := by
          exact
            (Finset.eq_of_subset_of_card_le hpairSubset (by omega)).symm
        rcases exists_blockerCenter_mem_capInteriorByIndex
            (T := T) source with ⟨sourceCap, hsourceCap⟩
        rcases exists_blockerCenter_mem_capInteriorByIndex
            (T := T) Q.source₁ with ⟨freshCap, hfreshCap⟩
        by_cases hcapsEq : sourceCap = freshCap
        · subst freshCap
          by_cases hq₁Cap : Q.source₁.1 ∈ S.capByIndex sourceCap
          · exact ⟨.sameCapWithInternalFiberSource hcentersEq hsource₁
              hsource₂ hoverlapEq sourceCap hsourceCap hfreshCap
              (Or.inl hq₁Cap)⟩
          · by_cases hq₂Cap : Q.source₂.1 ∈ S.capByIndex sourceCap
            · exact ⟨.sameCapWithInternalFiberSource hcentersEq hsource₁
                hsource₂ hoverlapEq sourceCap hsourceCap hfreshCap
                (Or.inr hq₂Cap)⟩
            · exact False.elim <|
                hnoAlignment
                  ⟨sourceCap,
                    S.capInteriorByIndex_subset_capByIndex sourceCap hfreshCap,
                    S.capInteriorByIndex_subset_capByIndex sourceCap hsourceCap,
                    hcentersEq, hq₁Cap, hq₂Cap, hsource₁, hsource₂⟩
        · exact ⟨.distinctBlockersDifferentCaps hcentersEq hsource₁
            hsource₂ hoverlapEq sourceCap freshCap hsourceCap hfreshCap
            hcapsEq⟩
      · exact ⟨.sourceRowOmission Q.source₂ (Or.inr rfl) hsource₂
          ((cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsource₂)⟩
    · exact ⟨.sourceRowOmission Q.source₁ (Or.inl rfl) hsource₁
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hsource₁)⟩

/-- The load-bearing fresh-third interface keeps the generic two-source
normal form separate from the stronger equal-blocker first-fiber producer.
The latter retains its common radius, complete cap-source witnesses, mutual
row incidence, actual-blocker equality, simultaneous four-endpoint omission, and the
checked two-point cap intersection of the common shell instead of erasing
them before the geometric core. -/
inductive FreshThirdTwoCapSourceObstruction : Type where
  | normalized
      (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
      (Q : FreshThirdBlockerFiber P Pρ)
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
      FreshThirdTwoCapSourceObstruction
  | sameBlockerAllEndpointOmission
      {commonRadius : ℝ}
      (Q : FreshOutsideFirstBlockerFiber P Pρ)
      (source source' : CriticalShellSystem.CarrierVertex D.A)
      (sources_ne : source.1 ≠ source'.1)
      (source_mem_radius :
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
      (source'_mem_radius :
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
      (source_witness : FirstFiberCapSourceWitness P Pρ source)
      (source'_witness : FirstFiberCapSourceWitness P Pρ source')
      (cross_membership :
        TwoCapSourcesMutualCrossMembership (H := H) source source')
      (blockers_eq : H.blockerVertex source = H.blockerVertex source')
      (all_endpoint_omission :
        AllCollisionEndpointsOmitted P Pρ source source')
      (blocker_mem_capInterior :
        H.centerAt source.1 source.2 ∈
          S.capInteriorByIndex S.oppIndex1)
      (shell_inter_cap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {source.1, source'.1}) :
      FreshThirdTwoCapSourceObstruction


/- A source-clean positive packet for the exceptional canonical-source /
   different-fresh-cap branch. -/
def FreshThirdExceptionalBoundaryMetricPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n),
    B.boundary (zeroIndex hn) = S.oppositeVertexByIndex S.surplusIdx ∧
    B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
    B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
    (DirectBoundaryBlocks S B.boundary hn iv iw ∨ MirrorBoundaryBlocks S B.boundary hn iv iw) ∧
    (let sourceCenter : CarrierLabel D.A :=
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
     let freshCenter : CarrierLabel D.A :=
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
     let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
     let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
     FreshThirdAlternatingEndpointPlacement
       (B.indexOf sourceCenter) (B.indexOf freshCenter)
       (B.indexOf firstPoint) (B.indexOf secondPoint) ∧
       firstPoint.1 ∈ (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∧
       secondPoint.1 ∈ (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∧
       firstPoint.1 ∈ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
       secondPoint.1 ∈ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) ∧
    FreshThirdCanonicalSourceSupportPlacement
      (zeroIndex hn) iv iw
      (B.indexOf ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
theorem freshThird_exceptionalBoundaryMetricPacket_of_endpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne : H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠ H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem : Q.source₁.1 ∈ (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem : Q.source₂.1 ∈ (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem : H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈ S.capInteriorByIndex sourceCap)
    (freshCenter_mem : H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap)
    (hpacket : sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
      Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧ Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    FreshThirdExceptionalBoundaryMetricPacket P Pρ C Q := by
  rcases freshThird_canonicalDifferentCap_endpointPlacement
      (P := P) (Pρ := Pρ) C.surface Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, horder⟩
  have hsource := freshThird_canonicalDifferentCap_sourceSupportPlacement
      (P := P) (Pρ := Pρ) C.surface B hn iv iw hblocks
  exact ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, horder, hsource⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
theorem freshThird_exceptionalBoundaryMetricPacket_of_dual_interactions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    {B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R}
    {L : ATailLargeOppositeCapsBiApexSurface.FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcenters : H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 = H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne : H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠ H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem : Q.source₁.1 ∈ (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem : Q.source₂.1 ∈ (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq : (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support = {Q.source₁.1, Q.source₂.1})
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem : H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈ S.capInteriorByIndex sourceCap)
    (freshCenter_mem : H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap)
    (centers_ne' : H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ≠ H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem' : Q.source₁.1 ∈ (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support)
    (source₂_mem' : Q.source₂.1 ∈ (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support)
    (overlap_eq' : (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support ∩ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support = {Q.source₁.1, Q.source₂.1})
    (sourceCap' freshCap' : Fin 3)
    (sourceCenter_mem' : H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈ S.capInteriorByIndex sourceCap')
    (freshCenter_mem' : H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap')
    (caps_ne' : sourceCap' ≠ freshCap') :
    FreshThirdExceptionalBoundaryMetricPacket P Pρ C Q := by
  rcases freshThird_commonRadius_distinctCaps_dual_packet
      (P := P) (Pρ := Pρ) T C Q hcenters centers_ne source₁_mem source₂_mem overlap_eq
      sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne centers_ne' source₁_mem' source₂_mem'
      overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem' caps_ne' with
    ⟨hsource, hfresh, hsource', hfresh', hsourceEq, hfreshEq, hq1Off, hq2Off⟩
  exact freshThird_exceptionalBoundaryMetricPacket_of_endpoint
    (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem sourceCap freshCap
    sourceCenter_mem freshCenter_mem ⟨hsource, hfresh, hq1Off, hq2Off⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-faithful ingress for the dynamic endpoint-deletion CEGAR query.
The canonical different-cap geometry selects one of the four boundary orders;
at its selected endpoint, either the two deletion obstructions already close
the branch, or their exact complement is exposed as a four-point surviving
row.  No ambient-cardinality bound is introduced. -/
theorem freshThird_canonicalDifferentCap_orderSelectedEndpointDeletionOutcome
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n),
      (((qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩)) ∧
       (FreshThirdOrderSelectedEndpointDeletionObstructions
          (A := D.A) B.boundary qOutside
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          qBetween
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1
                  C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨C.firstSource.1, C.firstSource.2⟩) ∨
        FreshThirdOrderSelectedEndpointSurvivingRow
          (A := D.A) B.boundary qOutside
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          qBetween
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1
                  C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨C.firstSource.1, C.firstSource.2⟩))) := by
  rcases freshThird_canonicalDifferentCap_fivePointKalmansonOrder
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, qOutside, qBetween, hnames, horder⟩
  refine ⟨B, qOutside, qBetween, hnames, ?_⟩
  exact
    freshThird_orderSelectedEndpointDeletionObstructions_or_survivingRow
      (A := D.A) B.boundary horder

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source adapter for the dynamic order-selected endpoint-deletion
contract.  The boundary order determines which shared endpoint supplies the
two blocked deletions; the canonical source row supplies the other metric
equality needed by the Kalmanson consumer. -/
theorem false_of_freshThird_canonicalDifferentCap_of_orderSelectedEndpointDeletionObstructions
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hnames :
      (qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩))
    (hdeletions :
      FreshThirdOrderSelectedEndpointDeletionObstructions
        (A := D.A) B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.firstSource.1 C.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.firstSource.1
                C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.firstSource.1, C.firstSource.2⟩)) :
    False := by
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let canonicalSource : CarrierLabel D.A :=
    ⟨C.firstSource.1, C.firstSource.2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  have hsourceFirstRaw :
      dist sourceCenter.1 canonicalSource.1 =
        dist sourceCenter.1 firstPoint.1 := by
    exact
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        canonicalSource.1
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        firstPoint.1 (by simpa [firstPoint] using source₁_mem)).symm
  have hsourceSecondRaw :
      dist sourceCenter.1 canonicalSource.1 =
        dist sourceCenter.1 secondPoint.1 := by
    exact
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        canonicalSource.1
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        secondPoint.1 (by simpa [secondPoint] using source₂_mem)).symm
  have hsourceFirst :
      dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf canonicalSource)) =
        dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf firstPoint)) := by
    simpa only [B.point_eq] using hsourceFirstRaw
  have hsourceSecond :
      dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf canonicalSource)) =
        dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf secondPoint)) := by
    simpa only [B.point_eq] using hsourceSecondRaw
  rcases hnames with hnames | hnames
  · rcases hnames with ⟨rfl, rfl⟩
    exact false_of_freshThird_orderSelectedEndpointDeletionObstructions
      D.K4 D.convex B.boundary_injective B.boundary_image B.boundary_ccw
      hsourceFirst hsourceSecond hdeletions
  · rcases hnames with ⟨rfl, rfl⟩
    exact false_of_freshThird_orderSelectedEndpointDeletionObstructions
      D.K4 D.convex B.boundary_injective B.boundary_image B.boundary_ccw
      hsourceSecond hsourceFirst hdeletions

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact live complement of the canonical different-cap Kalmanson
branch.  The order-selected deletion-obstruction outcome is impossible by the
checked metric consumer, so every surviving instance supplies a named ambient
selected four-row avoiding the canonical source or the other shared endpoint,
together with a cap containing its center, at most two witnesses inside that
cap, and at least two outside.

This is the cardinality-free ingress expected by the dynamic survivor-row
query: it removes the already-closed disjunct instead of asking the solver to
rediscover it. -/
theorem freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n),
      (((qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩)) ∧
       FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
          B.boundary qOutside
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          qBetween
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1
                  C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨C.firstSource.1, C.firstSource.2⟩)) := by
  rcases freshThird_canonicalDifferentCap_orderSelectedEndpointDeletionOutcome
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, qOutside, qBetween, hnames, hdeletions | hrow⟩
  · exact
      (false_of_freshThird_canonicalDifferentCap_of_orderSelectedEndpointDeletionObstructions
        (P := P) (Pρ := Pρ) C Q source₁_mem source₂_mem B qOutside
        qBetween hnames hdeletions).elim
  · exact ⟨B, qOutside, qBetween, hnames,
      freshThird_orderSelectedEndpointSurvivingRow_capSplit
        S D.convex B.boundary_image hrow⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exceptional canonical-source/different-fresh-cap packet is impossible
once deleting the canonical source and the opposite shared endpoint both
block K4 at each shared endpoint.

These four named deletion obstructions are a source-level ingress contract:
each pair produces one endpoint-centered critical row, and the resulting two
equal-distance facts feed the cardinality-free Kalmanson consumer. -/
theorem false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1)
    (firstCanonicalBlocked :
      ¬ HasNEquidistantPointsAt 4
          (D.A.erase C.firstSource.1) Q.source₁.1)
    (firstOtherBlocked :
      ¬ HasNEquidistantPointsAt 4
          (D.A.erase Q.source₂.1) Q.source₁.1)
    (secondCanonicalBlocked :
      ¬ HasNEquidistantPointsAt 4
          (D.A.erase C.firstSource.1) Q.source₂.1)
    (secondOtherBlocked :
      ¬ HasNEquidistantPointsAt 4
          (D.A.erase Q.source₁.1) Q.source₂.1) :
    False := by
  classical
  have hcanonicalCap :
      C.firstSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex _ C.firstSource_data.2.1
  have hfirst_ne_canonical : Q.source₁.1 ≠ C.firstSource.1 := by
    intro h
    exact hpacket.2.2.1 (by simpa [h] using hcanonicalCap)
  have hsecond_ne_canonical : Q.source₂.1 ≠ C.firstSource.1 := by
    intro h
    exact hpacket.2.2.2 (by simpa [h] using hcanonicalCap)
  have firstEndpointEq :
      dist Q.source₁.1 Q.source₂.1 =
        dist Q.source₁.1 C.firstSource.1 :=
    (endpointCentered_dist_eq_of_two_blocked_deletions
      D.K4 Q.source₁.2 hfirst_ne_canonical
      firstCanonicalBlocked firstOtherBlocked).symm
  have secondEndpointEq :
      dist Q.source₂.1 Q.source₁.1 =
        dist Q.source₂.1 C.firstSource.1 :=
    (endpointCentered_dist_eq_of_two_blocked_deletions
      D.K4 Q.source₂.2 hsecond_ne_canonical
      secondCanonicalBlocked secondOtherBlocked).symm
  rcases freshThird_canonicalDifferentCap_fivePointKalmansonOrder
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, qOutside, qBetween, hnames, horder⟩
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let canonicalSource : CarrierLabel D.A :=
    ⟨C.firstSource.1, C.firstSource.2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  have hsourceFirstRaw :
      dist sourceCenter.1 canonicalSource.1 =
        dist sourceCenter.1 firstPoint.1 := by
    exact
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        canonicalSource.1
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        firstPoint.1 (by simpa [firstPoint] using source₁_mem)).symm
  have hsourceSecondRaw :
      dist sourceCenter.1 canonicalSource.1 =
        dist sourceCenter.1 secondPoint.1 := by
    exact
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        canonicalSource.1
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq_radius
        secondPoint.1 (by simpa [secondPoint] using source₂_mem)).symm
  have hsourceFirst :
      dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf canonicalSource)) =
        dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf firstPoint)) := by
    simpa only [B.point_eq] using hsourceFirstRaw
  have hsourceSecond :
      dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf canonicalSource)) =
        dist (B.boundary (B.indexOf sourceCenter))
          (B.boundary (B.indexOf secondPoint)) := by
    simpa only [B.point_eq] using hsourceSecondRaw
  have hfirstEndpoint :
      dist (B.boundary (B.indexOf firstPoint))
          (B.boundary (B.indexOf secondPoint)) =
        dist (B.boundary (B.indexOf firstPoint))
          (B.boundary (B.indexOf canonicalSource)) := by
    simpa only [B.point_eq] using firstEndpointEq
  have hsecondEndpoint :
      dist (B.boundary (B.indexOf secondPoint))
          (B.boundary (B.indexOf firstPoint)) =
        dist (B.boundary (B.indexOf secondPoint))
          (B.boundary (B.indexOf canonicalSource)) := by
    simpa only [B.point_eq] using secondEndpointEq
  rcases hnames with hnames | hnames
  · rcases hnames with ⟨rfl, rfl⟩
    apply CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms
      D.convex B.boundary_injective B.boundary_image B.boundary_ccw
    rcases horder with h | h | h | h
    · exact Or.inl ⟨lt_trans h.1 h.2.1, h.2.2.1, h.2.2.2,
        hsecondEndpoint, hsourceFirst.symm⟩
    · exact Or.inr (Or.inl
        ⟨lt_trans h.1 h.2.1, h.2.2.1, h.2.2.2,
          hfirstEndpoint, hsourceSecond.symm⟩)
    · exact Or.inr (Or.inr (Or.inl
        ⟨h.1, h.2.1, lt_trans h.2.2.1 h.2.2.2,
          hsourceFirst, hsecondEndpoint.symm⟩))
    · exact Or.inr (Or.inr (Or.inr
        ⟨h.1, h.2.1, lt_trans h.2.2.1 h.2.2.2,
          hsourceSecond, hfirstEndpoint.symm⟩))
  · rcases hnames with ⟨rfl, rfl⟩
    apply CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms
      D.convex B.boundary_injective B.boundary_image B.boundary_ccw
    rcases horder with h | h | h | h
    · exact Or.inl ⟨lt_trans h.1 h.2.1, h.2.2.1, h.2.2.2,
        hfirstEndpoint, hsourceSecond.symm⟩
    · exact Or.inr (Or.inl
        ⟨lt_trans h.1 h.2.1, h.2.2.1, h.2.2.2,
          hsecondEndpoint, hsourceFirst.symm⟩)
    · exact Or.inr (Or.inr (Or.inl
        ⟨h.1, h.2.1, lt_trans h.2.2.1 h.2.2.2,
          hsourceSecond, hfirstEndpoint.symm⟩))
    · exact Or.inr (Or.inr (Or.inr
        ⟨h.1, h.2.1, lt_trans h.2.2.1 h.2.2.2,
          hsourceFirst, hsecondEndpoint.symm⟩))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Equal source centers force the cap labels in a coherent distinct-cap
 interaction pair to agree.  This is the label-normalization step needed
 before any finite obstruction search; it uses only disjoint strict-cap
 interiors and does not identify the two source rows. -/
theorem freshThirdEqualCenter_distinctCaps_sharedLabels
     (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
     (Q : FreshThirdBlockerFiber P Pρ)
     (hcenters :
       H.centerAt C.firstSource.1 C.firstSource.2 =
         H.centerAt C.secondSource.1 C.secondSource.2)
     (sourceCap freshCap sourceCap' freshCap' : Fin 3)
     (sourceCenter_mem :
       H.centerAt C.firstSource.1 C.firstSource.2 ∈
         S.capInteriorByIndex sourceCap)
     (freshCenter_mem :
       H.centerAt Q.source₁.1 Q.source₁.2 ∈
         S.capInteriorByIndex freshCap)
     (sourceCenter_mem' :
       H.centerAt C.secondSource.1 C.secondSource.2 ∈
         S.capInteriorByIndex sourceCap')
     (freshCenter_mem' :
       H.centerAt Q.source₁.1 Q.source₁.2 ∈
         S.capInteriorByIndex freshCap') :
     sourceCap = sourceCap' ∧ freshCap = freshCap' := by
  constructor
  · by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
        (by simpa [hcenters] using sourceCenter_mem') hne) rfl
  · by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
        freshCenter_mem' hne) rfl

/-- Equal source centers force the cap labels in a coherent same-cap
 interaction pair to agree.  The fiber endpoint witnesses remain separate;
 this theorem only removes a spurious second cap index from the residual. -/
theorem freshThirdEqualCenter_sameCap_sharedLabel
     (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
     (hcenters :
       H.centerAt C.firstSource.1 C.firstSource.2 =
         H.centerAt C.secondSource.1 C.secondSource.2)
     (capIndex capIndex' : Fin 3)
     (sourceCenter_mem :
       H.centerAt C.firstSource.1 C.firstSource.2 ∈
         S.capInteriorByIndex capIndex)
     (sourceCenter_mem' :
       H.centerAt C.secondSource.1 C.secondSource.2 ∈
         S.capInteriorByIndex capIndex') :
     capIndex = capIndex' := by
  by_contra hne
  exact
    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
