import stage1_separated_pair_classifier_boundary
import live_critical_provenance

/-!
# ATAIL Stage-I critical-system bisector producer boundary

This scratch module maps the actual `CriticalShellSystem` field of K-A-PAIR
to the checked triple-bisector consumer.  It isolates the smallest row
incidences which would turn the two outside `u`-row points into the two
additional carrier centers required by Dumitrescu's bound.

For the blocker row sourced at `z`, membership of `z` is automatic.  Thus the
first genuinely missing metric incidence is only that `w` also belongs to
that row.  Symmetrically, the row sourced at `w` automatically contains `w`;
the missing incidence is that it also contains `z`.  Pairwise distinctness
of the two blocker centers and the original `u`-row center is still required.

The common-cap geometry gives an additional negative constraint: every
extra bisector center must lie outside the common cap.  In particular, no
second point already known to be in that cap can serve as an extra center.

This module introduces no new axioms or proof placeholders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneBisectorProducerScratch

open U1Depth5
open ATAILStageOneConfinementScratch
open ATAILStageOneSeparatedPairScratch

/-- A selected blocker row containing a pair makes its blocker center
equidistant from that pair. -/
theorem criticalSystem_center_bisects_of_pair_mem_support
    {A : Finset Plane} (H : CriticalShellSystem A)
    {source z w : Plane} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hw : w ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    dist (H.centerAt source hsource) z =
      dist (H.centerAt source hsource) w :=
  ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius z hz).trans
    ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      w hw).symm

/-- Any carrier center other than the known `u`-row center which bisects the
surviving outside pair must lie outside their common cap. -/
theorem extraBisectorCenter_not_mem_commonCap
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {c z w a : Plane}
    (hcCap : c ∈ S.capByIndex k)
    (hzA : z ∈ A) (hwA : w ∈ A) (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hcdist : dist c z = dist c w)
    (hac : a ≠ c) (hadist : dist a z = dist a w) :
    a ∉ S.capByIndex k := by
  intro haCap
  have hunique :=
    sameCap_outsidePair_unique_bisectorCenter
      S hconv k hcCap hzA hwA hzw hzOff hwOff hcdist
  exact hac ((hunique a haCap).mp hadist)

/-- The two source-specialized cross-incidences. The diagonal incidences are
omitted: a critical row sourced at `z` already contains `z`, and the row
sourced at `w` already contains `w`. -/
structure MutualCriticalSourceIncidenceFields
    {A : Finset Plane} (H : CriticalShellSystem A)
    (c z w : Plane) (hzA : z ∈ A) (hwA : w ∈ A) : Prop where
  w_mem_zRow :
    w ∈ (H.selectedAt z hzA).toCriticalFourShell.support
  z_mem_wRow :
    z ∈ (H.selectedAt w hwA).toCriticalFourShell.support

/-- Reciprocal incidence plus the center distinctness needed by the direct
three-center perpendicular-bisector contradiction. -/
structure MutualCriticalSourceBisectorFields
    {A : Finset Plane} (H : CriticalShellSystem A)
    (c z w : Plane) (hzA : z ∈ A) (hwA : w ∈ A) : Prop
    extends MutualCriticalSourceIncidenceFields H c z w hzA hwA where
  c_ne_zCenter : c ≠ H.centerAt z hzA
  c_ne_wCenter : c ≠ H.centerAt w hwA
  zCenter_ne_wCenter : H.centerAt z hzA ≠ H.centerAt w hwA

/-- Exact live-facing producer property for the separated outside-pair
branch. It asks for reciprocal membership only on a pair satisfying the
checked escape packet, rather than on every pair of points in the row. -/
def URowSeparatedPairMutualCriticalSourceBisectorProducer
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A) : Prop :=
  ∀ (k : Fin 3) (z w : Plane)
    (_hpCap : p ∈ S.capByIndex k)
    (_hcCap : rows.uRow.center ∈ S.capByIndex k)
    (_hzw : z ≠ w)
    (hzSupport : z ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hwSupport : w ∈ rows.uRow.selected.toCriticalFourShell.support)
    (_hzOffDangerous : z ∉ ({q, t1, t2, t3} : Finset Plane))
    (_hzOffCap : z ∉ S.capByIndex k)
    (_hwOffCap : w ∉ S.capByIndex k),
    let hzA :=
      rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
    let hwA :=
      rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
    MutualCriticalSourceBisectorFields
      H rows.uRow.center z w hzA hwA

/-- Mutual source-row incidence supplies exactly the two additional carrier
bisector centers consumed by `URowTripleBisectorAlternateFields`. -/
theorem mutualCriticalSourceBisectors_to_tripleBisectorAlternate
    {D : CounterexampleData} {q t1 t2 t3 u z w : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A)
    (hzw : z ≠ w)
    (hzSupport : z ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hwSupport : w ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hzA : z ∈ D.A) (hwA : w ∈ D.A)
    (fields : MutualCriticalSourceBisectorFields
      H rows.uRow.center z w hzA hwA) :
    URowTripleBisectorAlternateFields rows := by
  let a := H.centerAt z hzA
  let b := H.centerAt w hwA
  have haA : a ∈ D.A := by
    exact (Finset.mem_erase.mp
      (H.selectedAt z hzA).toCriticalFourShell.center_mem).2
  have hbA : b ∈ D.A := by
    exact (Finset.mem_erase.mp
      (H.selectedAt w hwA).toCriticalFourShell.center_mem).2
  have hcdist :
      dist rows.uRow.center z = dist rows.uRow.center w :=
    (rows.uRow.selected.toCriticalFourShell.support_eq_radius z hzSupport).trans
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius
        w hwSupport).symm
  have hadist : dist a z = dist a w := by
    apply criticalSystem_center_bisects_of_pair_mem_support H hzA
    · exact (H.selectedAt z hzA).toCriticalFourShell.q_mem_support
    · exact fields.w_mem_zRow
  have hbdist : dist b z = dist b w := by
    apply criticalSystem_center_bisects_of_pair_mem_support H hwA
    · exact fields.z_mem_wRow
    · exact (H.selectedAt w hwA).toCriticalFourShell.q_mem_support
  exact ⟨z, w, a, b, hzw, hzSupport, hwSupport, haA, hbA,
    fields.c_ne_zCenter, fields.c_ne_wCenter,
    fields.zCenter_ne_wCenter, hcdist, hadist, hbdist⟩

/-- Reciprocal critical-source incidence cannot coexist with three distinct
bisector centers. Consequently it forces one of the three exact blocker-center
collisions below. -/
theorem centerCollision_of_mutualCriticalSourceIncidence
    {D : CounterexampleData} {q t1 t2 t3 u z w : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A)
    (hzw : z ≠ w)
    (hzSupport : z ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hwSupport : w ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hzA : z ∈ D.A) (hwA : w ∈ D.A)
    (fields : MutualCriticalSourceIncidenceFields
      H rows.uRow.center z w hzA hwA) :
    rows.uRow.center = H.centerAt z hzA ∨
      rows.uRow.center = H.centerAt w hwA ∨
      H.centerAt z hzA = H.centerAt w hwA := by
  by_contra hcollision
  simp only [not_or] at hcollision
  let distinctFields : MutualCriticalSourceBisectorFields
      H rows.uRow.center z w hzA hwA :=
    { toMutualCriticalSourceIncidenceFields := fields
      c_ne_zCenter := hcollision.1
      c_ne_wCenter := hcollision.2.1
      zCenter_ne_wCenter := hcollision.2.2 }
  exact false_of_uRowTripleBisectorAlternateFields rows
    (mutualCriticalSourceBisectors_to_tripleBisectorAlternate
      rows H hzw hzSupport hwSupport hzA hwA distinctFields)

/-- The support-level content of the forced center collision. A collision with
the `u`-row center identifies the corresponding critical-system support with
the exact `u`-row support; a collision between the two critical-system centers
identifies their two supports. -/
def MutualCriticalSourceSupportCollisionFields
    {D : CounterexampleData} {q t1 t2 t3 u z w : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A)
    (hzA : z ∈ D.A) (hwA : w ∈ D.A) : Prop :=
  (rows.uRow.center = H.centerAt z hzA ∧
      (H.selectedAt z hzA).toCriticalFourShell.support =
        rows.uRow.selected.toCriticalFourShell.support) ∨
    (rows.uRow.center = H.centerAt w hwA ∧
      (H.selectedAt w hwA).toCriticalFourShell.support =
        rows.uRow.selected.toCriticalFourShell.support) ∨
    (H.centerAt z hzA = H.centerAt w hwA ∧
      (H.selectedAt z hzA).toCriticalFourShell.support =
        (H.selectedAt w hwA).toCriticalFourShell.support)

/-- Reciprocal incidence therefore forces one of three exact support
identifications, not merely an unnamed equality of centers. -/
theorem supportCollision_of_mutualCriticalSourceIncidence
    {D : CounterexampleData} {q t1 t2 t3 u z w : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A)
    (hzw : z ≠ w)
    (hzSupport : z ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hwSupport : w ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hzA : z ∈ D.A) (hwA : w ∈ D.A)
    (fields : MutualCriticalSourceIncidenceFields
      H rows.uRow.center z w hzA hwA) :
    MutualCriticalSourceSupportCollisionFields rows H hzA hwA := by
  rcases centerCollision_of_mutualCriticalSourceIncidence
      rows H hzw hzSupport hwSupport hzA hwA fields with hcz | hcw | hzwc
  · left
    refine ⟨hcz, ?_⟩
    let Ku : SelectedFourClass D.A (H.centerAt z hzA) :=
      rows.uRow.selected.toSelectedFourClass.transportCenter hcz
    have hsupport := H.selectedFourClass_support_eq_shell z hzA Ku
    have huToZ :
        rows.uRow.selected.toCriticalFourShell.support =
          (H.selectedAt z hzA).toCriticalFourShell.support := by
      simpa [Ku, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using hsupport
    exact huToZ.symm
  · right
    left
    refine ⟨hcw, ?_⟩
    let Ku : SelectedFourClass D.A (H.centerAt w hwA) :=
      rows.uRow.selected.toSelectedFourClass.transportCenter hcw
    have hsupport := H.selectedFourClass_support_eq_shell w hwA Ku
    have huToW :
        rows.uRow.selected.toCriticalFourShell.support =
          (H.selectedAt w hwA).toCriticalFourShell.support := by
      simpa [Ku, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using hsupport
    exact huToW.symm
  · right
    right
    exact ⟨hzwc,
      H.selectedAt_support_eq_of_centerAt_eq hzA hwA hzwc⟩

/-- Exact producer-facing contradiction.  For every separated pair, it is
enough to prove the two source-specialized cross-incidences and center
distinctness above.  All metric equalities and carrier memberships are then
automatic from the actual critical-system and critical-row fields. -/
theorem false_of_separatedPair_mutualCriticalSourceBisectors
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A)
    (hpair : URowOffDangerousSeparatedPairFields
      S p q t1 t2 t3 u rows)
    (hproduce : URowSeparatedPairMutualCriticalSourceBisectorProducer
      S p q t1 t2 t3 u rows H) :
    False := by
  rcases hpair with
    ⟨k, z, w, hp, hc, hzw, hzSupport, hwSupport, hzDangerous,
      hzOff, hwOff, _hcdist, _hpdist⟩
  let hzA : z ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
  let hwA : w ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
  have fields : MutualCriticalSourceBisectorFields
      H rows.uRow.center z w hzA hwA := by
    simpa [hzA, hwA] using
      hproduce k z w hp hc hzw hzSupport hwSupport hzDangerous hzOff hwOff
  exact false_of_uRowTripleBisectorAlternateFields rows
    (mutualCriticalSourceBisectors_to_tripleBisectorAlternate
      rows H hzw hzSupport hwSupport hzA hwA fields)

/-- One-call confinement adapter. Once reciprocal critical-source incidence
is proved on every separated-pair escape, the checked dichotomy and
Dumitrescu consumer remove the escape branch. -/
theorem confinement_of_mutualCriticalSourceBisectorProducer
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : CriticalShellSystem D.A)
    (hcenter_ne : rows.uRow.center ≠ p)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows)
    (hproduce : URowSeparatedPairMutualCriticalSourceBisectorProducer
      S p q t1 t2 t3 u rows H) :
    URowCommonCapOffDangerousConfinement
      S p q t1 t2 t3 u rows := by
  rcases commonCap_confinement_or_pSeparatedOutsidePair
      S rows hcenter_ne hcommon with hconfined | hpair
  · exact hconfined
  · exact False.elim
      (false_of_separatedPair_mutualCriticalSourceBisectors
        S rows H hpair hproduce)

/-- A source-row candidate which really adds a new bisector center is forced
outside the common cap.  This records the first geometric restriction on any
attempt to use the system rows sourced at `z` or `w`. -/
theorem criticalSource_extraBisector_not_mem_commonCap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (k : Fin 3)
    {c z w source : Plane}
    (hcCap : c ∈ S.capByIndex k)
    (hzA : z ∈ D.A) (hwA : w ∈ D.A) (hsource : source ∈ D.A)
    (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hcdist : dist c z = dist c w)
    (hzRow : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hwRow : w ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hcne : H.centerAt source hsource ≠ c) :
    H.centerAt source hsource ∉ S.capByIndex k := by
  apply extraBisectorCenter_not_mem_commonCap
    S D.convex k hcCap hzA hwA hzw hzOff hwOff hcdist hcne
  exact criticalSystem_center_bisects_of_pair_mem_support
    H hsource hzRow hwRow

#print axioms criticalSystem_center_bisects_of_pair_mem_support
#print axioms extraBisectorCenter_not_mem_commonCap
#print axioms mutualCriticalSourceBisectors_to_tripleBisectorAlternate
#print axioms centerCollision_of_mutualCriticalSourceIncidence
#print axioms supportCollision_of_mutualCriticalSourceIncidence
#print axioms false_of_separatedPair_mutualCriticalSourceBisectors
#print axioms confinement_of_mutualCriticalSourceBisectorProducer
#print axioms criticalSource_extraBisector_not_mem_commonCap

end ATAILStageOneBisectorProducerScratch
end Problem97
