import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Exact-four rigid `2+2+1` source-context normalization

Scratch proof development for the remaining exact-four global-deletion
frontier.  The point is to retain the omitted-peer source row instead of
reducing immediately to the bare rigid partition.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- In the genuinely third-row arm `u ≠ source`, the two-point `u`-block is
exactly `{source,u}`.  The source row meets that block only at `source`, and
the three actual blockers belonging to `source`, `u`, and `v` are pairwise
distinct.

This is the source-sensitive normalization discarded by the old bare
`2+2+1` terminal. -/
theorem exactFourRigid221_context_u_ne_source_normalForm_scratch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2
  have huPointNeSource : u.1 ≠ source.1 := by
    intro hpoint
    apply huNeSource
    apply Subtype.ext
    exact hpoint
  have huNotSourceRow : u.1 ∉ Ks := by
    rcases context.u_eq_source_or_not_mem_source_row with hEq | hNot
    · exact (huNeSource hEq).elim
    · simpa [Ks] using hNot
  have hIuCard : Iu.card = 2 := by
    have hrigid := G.rigid
    simpa [C, Ku, Iu] using hrigid.1
  have hsourceIu : source.1 ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [Ku] using context.source_mem_u_row,
        context.source_mem_class⟩
  have huIu : u.1 ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨by
          simpa [Ku] using
            ((lateFirstApexSystem R).selectedAt
              u.1 u.2).toCriticalFourShell.q_mem_support,
        huClass⟩
  have hpairSub : ({source.1, u.1} : Finset ℝ²) ⊆ Iu := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hsourceIu
    · exact huIu
  have hpairCard : ({source.1, u.1} : Finset ℝ²).card = 2 := by
    simpa [huPointNeSource] using
      (Finset.card_pair (Ne.symm huPointNeSource))
  have hIuEq : Iu = {source.1, u.1} := by
    symm
    exact Finset.eq_of_subset_of_card_le hpairSub
      (by rw [hIuCard, hpairCard])
  have hsourceKs : source.1 ∈ Ks := by
    simpa [Ks] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have hKsInter : Ks ∩ Iu = {source.1} := by
    rw [hIuEq]
    ext z
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton]
    constructor
    · rintro ⟨hzKs, hzSource | hzU⟩
      · exact hzSource
      · subst z
        exact (huNotSourceRow hzKs).elim
    · intro hz
      subst z
      exact ⟨hsourceKs, Or.inl rfl⟩
  have hsourceIJ : source.1 ∈ Iu ∩ J := by
    exact Finset.mem_inter.mpr
      ⟨hsourceIu, by simpa [J] using context.source_mem_interior⟩
  have hsourceBlockerNeU :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 := by
    intro hcenters
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 u.2 hcenters
    apply huNotSourceRow
    simpa only [Ks, hsupports] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hsourceBlockerNeV :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 v.2 hcenters
    apply context.v_not_mem_source_row
    simpa only [hsupports] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  exact
    ⟨huPointNeSource, huNotSourceRow, hIuEq, hKsInter,
      hsourceIJ, hsourceBlockerNeU, hsourceBlockerNeV,
      hblockersUVNe⟩

/-- The retained source context gives an auditable two-arm coordinator:
either the distinguished `u`-row is the source row, or the genuinely
third-row arm has the source-sensitive normal form above. -/
theorem exactFourRigid221_context_sourceOrThirdRow_scratch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    u = source ∨
      (let C := SelectedClass D.A S.oppApex2 rho
       let Ks :=
         ((lateFirstApexSystem R).selectedAt
           source.1 source.2).toCriticalFourShell.support
       let Ku :=
         ((lateFirstApexSystem R).selectedAt
           u.1 u.2).toCriticalFourShell.support
       let Iu := Ku ∩ C
       let J := S.capInteriorByIndex S.oppIndex2
       u.1 ≠ source.1 ∧
         u.1 ∉ Ks ∧
         Iu = {source.1, u.1} ∧
         Ks ∩ Iu = {source.1} ∧
         source.1 ∈ Iu ∩ J ∧
         (lateFirstApexSystem R).centerAt source.1 source.2 ≠
           (lateFirstApexSystem R).centerAt u.1 u.2 ∧
         (lateFirstApexSystem R).centerAt source.1 source.2 ≠
           (lateFirstApexSystem R).centerAt v.1 v.2 ∧
         (lateFirstApexSystem R).centerAt u.1 u.2 ≠
           (lateFirstApexSystem R).centerAt v.1 v.2) := by
  classical
  by_cases huEq : u = source
  · exact Or.inl huEq
  · exact Or.inr
      (exactFourRigid221_context_u_ne_source_normalForm
        huClass context hblockersUVNe G huEq)

/-- In the third-row arm, the retained omitted peer has only three possible
placements in the rigid five-class: it is `u`, it belongs to the disjoint
`v`-block, or it is the singleton point outside the two blocks. -/
theorem exactFourRigid221_context_u_ne_source_otherPlacement_scratch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iv := Kv ∩ C
    other = u ∨ other.1 ∈ Iv ∨ other = jointDeletion.deleted := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change other = u ∨ other.1 ∈ Iv ∨ other = jointDeletion.deleted
  have hnormal :=
    exactFourRigid221_context_u_ne_source_normalForm
      huClass context hblockersUVNe G huNeSource
  change
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 at hnormal
  have hIuEq : Iu = {source.1, u.1} := hnormal.2.2.1
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    have hrigid := G.rigid
    simpa [C, Ku, Kv, Iu, Iv] using hrigid.2.2.2
  have hotherC : other.1 ∈ C := by
    simpa [C] using context.other_mem_class
  rw [hcover] at hotherC
  simp only [Finset.mem_insert, Finset.mem_union] at hotherC
  rcases hotherC with hdeleted | hIu | hIv
  · exact Or.inr (Or.inr (Subtype.ext hdeleted))
  · rw [hIuEq] at hIu
    simp only [Finset.mem_insert, Finset.mem_singleton] at hIu
    rcases hIu with hsource | hu
    · have hotherEqSource : other = source := Subtype.ext hsource
      exact (context.other_ne_source hotherEqSource).elim
    · exact Or.inl (Subtype.ext hu)
  · exact Or.inr (Or.inl hIv)

/-- A raw collision witness in the nonphysical-center leaf produces a fresh
five-point radius class and an exact two-point carrier intersection with its
perpendicular bisector.  This keeps the actual collision points and radius
available to the contextual split below. -/
theorem exactFourRigid221_context_nonphysicalCollision_strong
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenterNe : G.center ≠ S.oppApex2)
    (hcollision : ∃ s ∈ G.deleted, ∃ t ∈ G.deleted,
      s ≠ t ∧ dist G.center s = dist G.center t) :
    ∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
      ∃ r : ℝ, 0 < r ∧
        dist G.center s = r ∧
        dist G.center t = r ∧
        5 ≤ (D.A.filter fun q => dist G.center q = r).card ∧
        D.A.filter (fun z => dist z s = dist z t) =
          {G.center, S.oppApex2} := by
  classical
  rcases hcollision with ⟨s, hs, t, ht, hst, hstEq⟩
  rcases G.restores s hs with ⟨r, hr, hfour⟩
  let Q :=
    (D.A \ G.deleted.erase s).filter fun q =>
      dist G.center q = r
  let P := D.A.filter fun q => dist G.center q = r
  have hsA : s ∈ D.A :=
    (mem_selectedClass.mp (G.deleted_subset_class hs)).1
  have htA : t ∈ D.A :=
    (mem_selectedClass.mp (G.deleted_subset_class ht)).1
  have hcA : G.center ∈ D.A :=
    (Finset.mem_sdiff.mp G.center_mem_remaining).1
  have haA : S.oppApex2 ∈ D.A :=
    jointDeletion.uPacket.center₂_mem_A
  have hsEq : dist G.center s = r := by
    by_contra hsne
    apply G.blocked
    refine ⟨r, hr, le_trans hfour (Finset.card_le_card ?_)⟩
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxremain, hxr⟩
    rcases Finset.mem_sdiff.mp hxremain with ⟨hxA, hxnotErase⟩
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_sdiff.mpr ⟨hxA, ?_⟩, hxr⟩
    intro hxdel
    have hxs : x = s := by
      by_contra hxs
      exact hxnotErase (Finset.mem_erase.mpr ⟨hxs, hxdel⟩)
    exact hsne (hxs ▸ hxr)
  have htEq : dist G.center t = r := hstEq.symm.trans hsEq
  have htNotQ : t ∉ Q := by
    intro htQ
    have htremain := (Finset.mem_filter.mp htQ).1
    have htNotErase := (Finset.mem_sdiff.mp htremain).2
    exact htNotErase (Finset.mem_erase.mpr ⟨hst.symm, ht⟩)
  have hinsert : insert t Q ⊆ P := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hxQ
    · exact Finset.mem_filter.mpr ⟨htA, htEq⟩
    · rcases Finset.mem_filter.mp hxQ with ⟨hxremain, hxr⟩
      exact Finset.mem_filter.mpr
        ⟨(Finset.mem_sdiff.mp hxremain).1, hxr⟩
  have hcard := Finset.card_le_card hinsert
  have hQcard : 4 ≤ Q.card := by simpa [Q] using hfour
  have hinscard : (insert t Q).card = Q.card + 1 :=
    Finset.card_insert_of_notMem htNotQ
  have hfive : 5 ≤ P.card := by
    rw [hinscard] at hcard
    omega
  have hphysicalEq :
      dist S.oppApex2 s = dist S.oppApex2 t :=
    (mem_selectedClass.mp
        (G.deleted_subset_class hs)).2.trans
      (mem_selectedClass.mp
        (G.deleted_subset_class ht)).2.symm
  have hbisector :
      D.A.filter (fun z => dist z s = dist z t) =
        {G.center, S.oppApex2} := by
    apply Finset.Subset.antisymm
    · intro z hz
      have hbound :=
        Dumitrescu.perpBisector_apex_bound D.convex hsA htA hst
      by_contra hzpair
      have hzNeC : z ≠ G.center := by
        intro hzc
        apply hzpair
        simp [hzc]
      have hzNeA : z ≠ S.oppApex2 := by
        intro hza
        apply hzpair
        simp [hza]
      have hcF :
          G.center ∈
            D.A.filter (fun z => dist z s = dist z t) :=
        Finset.mem_filter.mpr ⟨hcA, hstEq⟩
      have haF :
          S.oppApex2 ∈
            D.A.filter (fun z => dist z s = dist z t) :=
        Finset.mem_filter.mpr ⟨haA, hphysicalEq⟩
      have hthree :
          2 < (D.A.filter
              (fun z => dist z s = dist z t)).card := by
        rw [Finset.two_lt_card]
        exact ⟨G.center, hcF, S.oppApex2, haF, z, hz,
          hcenterNe, hzNeC.symm, hzNeA.symm⟩
      omega
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_filter.mpr ⟨hcA, hstEq⟩
      · exact Finset.mem_filter.mpr ⟨haA, hphysicalEq⟩
  exact
    ⟨s, hs, t, ht, hst, r, hr, hsEq, htEq,
      by simpa [P] using hfive, hbisector⟩

/-- The nonphysical-collision leaf admits one checked, source-sensitive
finite normalization.  The actual collision points and their fresh
five-point radius class are retained; their positions are exhausted against
the rigid `2+2+1` cover; and the upstream omitted-peer context is preserved
as either the source-row arm or the strictly stronger third-row arm.

This is deliberately a coordinator theorem rather than a terminal: its
conclusion names every remaining geometric placement that a terminal proof
must eliminate. -/
theorem exactFourRigid221_context_nonphysicalCollision_exhaustiveSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenterNe : G.center ≠ S.oppApex2)
    (hcollision : ∃ s ∈ G.deleted, ∃ t ∈ G.deleted,
      s ≠ t ∧ dist G.center s = dist G.center t) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    ∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
      ∃ r : ℝ, 0 < r ∧
        dist G.center s = r ∧
        dist G.center t = r ∧
        5 ≤ (D.A.filter fun q => dist G.center q = r).card ∧
        D.A.filter (fun z => dist z s = dist z t) =
          {G.center, S.oppApex2} ∧
        ((s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
          (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
          (s ∈ Iu ∧ t ∈ Iu) ∨
          (s ∈ Iv ∧ t ∈ Iv) ∨
          (s ∈ Iu ∧ t ∈ Iv) ∨
          (s ∈ Iv ∧ t ∈ Iu)) ∧
        (u = source ∨
          (u.1 ≠ source.1 ∧
            u.1 ∉ Ks ∧
            Iu = {source.1, u.1} ∧
            Ks ∩ Iu = {source.1} ∧
            source.1 ∈ Iu ∩ J ∧
            (lateFirstApexSystem R).centerAt source.1 source.2 ≠
              (lateFirstApexSystem R).centerAt u.1 u.2 ∧
            (lateFirstApexSystem R).centerAt source.1 source.2 ≠
              (lateFirstApexSystem R).centerAt v.1 v.2 ∧
            (lateFirstApexSystem R).centerAt u.1 u.2 ≠
              (lateFirstApexSystem R).centerAt v.1 v.2 ∧
            (other = u ∨
              other.1 ∈ Iv ∨ other = jointDeletion.deleted))) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    ∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
      ∃ r : ℝ, 0 < r ∧
        dist G.center s = r ∧
        dist G.center t = r ∧
        5 ≤ (D.A.filter fun q => dist G.center q = r).card ∧
        D.A.filter (fun z => dist z s = dist z t) =
          {G.center, S.oppApex2} ∧
        ((s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
          (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
          (s ∈ Iu ∧ t ∈ Iu) ∨
          (s ∈ Iv ∧ t ∈ Iv) ∨
          (s ∈ Iu ∧ t ∈ Iv) ∨
          (s ∈ Iv ∧ t ∈ Iu)) ∧
        (u = source ∨
          (u.1 ≠ source.1 ∧
            u.1 ∉ Ks ∧
            Iu = {source.1, u.1} ∧
            Ks ∩ Iu = {source.1} ∧
            source.1 ∈ Iu ∩ J ∧
            (lateFirstApexSystem R).centerAt source.1 source.2 ≠
              (lateFirstApexSystem R).centerAt u.1 u.2 ∧
            (lateFirstApexSystem R).centerAt source.1 source.2 ≠
              (lateFirstApexSystem R).centerAt v.1 v.2 ∧
            (lateFirstApexSystem R).centerAt u.1 u.2 ≠
              (lateFirstApexSystem R).centerAt v.1 v.2 ∧
            (other = u ∨
              other.1 ∈ Iv ∨ other = jointDeletion.deleted)))
  rcases
      exactFourRigid221_context_nonphysicalCollision_strong
        G hcenterNe hcollision with
    ⟨s, hs, t, ht, hst, r, hr, hsRadius, htRadius,
      hfive, hbisector⟩
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    have hrigid := G.rigid
    simpa [C, Ku, Kv, Iu, Iv] using hrigid.2.2.2
  have classify :
      ∀ z ∈ G.deleted,
        z = jointDeletion.deleted.1 ∨ z ∈ Iu ∨ z ∈ Iv := by
    intro z hz
    have hzC : z ∈ C := by
      simpa [C] using G.deleted_subset_class hz
    rw [hcover] at hzC
    simp only [Finset.mem_insert, Finset.mem_union] at hzC
    exact hzC
  have hplacement :
      (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
        (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
        (s ∈ Iu ∧ t ∈ Iu) ∨
        (s ∈ Iv ∧ t ∈ Iv) ∨
        (s ∈ Iu ∧ t ∈ Iv) ∨
        (s ∈ Iv ∧ t ∈ Iu) := by
    rcases classify s hs with hsD | hsIu | hsIv
    · rcases classify t ht with htD | htIu | htIv
      · exact (hst (hsD.trans htD.symm)).elim
      · exact Or.inl ⟨hsD, Or.inl htIu⟩
      · exact Or.inl ⟨hsD, Or.inr htIv⟩
    · rcases classify t ht with htD | htIu | htIv
      · exact Or.inr (Or.inl ⟨htD, Or.inl hsIu⟩)
      · exact Or.inr (Or.inr (Or.inl ⟨hsIu, htIu⟩))
      · exact
          Or.inr (Or.inr (Or.inr
            (Or.inr (Or.inl ⟨hsIu, htIv⟩))))
    · rcases classify t ht with htD | htIu | htIv
      · exact Or.inr (Or.inl ⟨htD, Or.inr hsIv⟩)
      · exact
          Or.inr (Or.inr (Or.inr
            (Or.inr (Or.inr ⟨hsIv, htIu⟩))))
      · exact
          Or.inr (Or.inr (Or.inr
            (Or.inl ⟨hsIv, htIv⟩)))
  have hcontextual :
      u = source ∨
        (u.1 ≠ source.1 ∧
          u.1 ∉ Ks ∧
          Iu = {source.1, u.1} ∧
          Ks ∩ Iu = {source.1} ∧
          source.1 ∈ Iu ∩ J ∧
          (lateFirstApexSystem R).centerAt source.1 source.2 ≠
            (lateFirstApexSystem R).centerAt u.1 u.2 ∧
          (lateFirstApexSystem R).centerAt source.1 source.2 ≠
            (lateFirstApexSystem R).centerAt v.1 v.2 ∧
          (lateFirstApexSystem R).centerAt u.1 u.2 ≠
            (lateFirstApexSystem R).centerAt v.1 v.2 ∧
          (other = u ∨
            other.1 ∈ Iv ∨ other = jointDeletion.deleted)) := by
    have hsourceSplit :=
      exactFourRigid221_context_sourceOrThirdRow
        huClass context jointDeletion.blockers_ne G
    change
      u = source ∨
        (u.1 ≠ source.1 ∧
          u.1 ∉ Ks ∧
          Iu = {source.1, u.1} ∧
          Ks ∩ Iu = {source.1} ∧
          source.1 ∈ Iu ∩ J ∧
          (lateFirstApexSystem R).centerAt source.1 source.2 ≠
            (lateFirstApexSystem R).centerAt u.1 u.2 ∧
          (lateFirstApexSystem R).centerAt source.1 source.2 ≠
            (lateFirstApexSystem R).centerAt v.1 v.2 ∧
          (lateFirstApexSystem R).centerAt u.1 u.2 ≠
            (lateFirstApexSystem R).centerAt v.1 v.2) at hsourceSplit
    rcases hsourceSplit with huSource | hnormal
    · exact Or.inl huSource
    · have huNeSource : u ≠ source := by
        intro huSource
        exact hnormal.1 (congrArg Subtype.val huSource)
      have hotherPlacement :=
        exactFourRigid221_context_u_ne_source_otherPlacement
          huClass context jointDeletion.blockers_ne G huNeSource
      change
        other = u ∨ other.1 ∈ Iv ∨
          other = jointDeletion.deleted at hotherPlacement
      rcases hnormal with
        ⟨huPointNeSource, huNotSourceRow, hIuEq, hKsInter,
          hsourceIJ, hsourceBlockerNeU, hsourceBlockerNeV,
          hblockersUVNe⟩
      exact Or.inr
        ⟨huPointNeSource, huNotSourceRow, hIuEq, hKsInter,
          hsourceIJ, hsourceBlockerNeU, hsourceBlockerNeV,
          hblockersUVNe, hotherPlacement⟩
  exact
    ⟨s, hs, t, ht, hst, r, hr, hsRadius, htRadius, hfive,
      hbisector, hplacement, hcontextual⟩

/-- The exact geometric residual left by the contextual rigid `2+2+1`
nonphysical-collision branch.

The packet deliberately retains the actual collision endpoints and radius,
the exact five-by-five cross-lens cut out by the physical and collision
circles, the source-sensitive rigid placement, and the fact that no
canonical actual row contains both endpoints.  Thus a terminal for this
branch need only exclude this one explicit configuration; it no longer has
to reconstruct any of the finite normalization.
-/
structure ExactFourRigid221NonphysicalCrossLens
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (s t : ℝ²) (collisionRadius : ℝ) : Prop where
  s_mem_deleted : s ∈ G.deleted
  t_mem_deleted : t ∈ G.deleted
  endpoints_ne : s ≠ t
  collisionRadius_pos : 0 < collisionRadius
  s_on_collision :
    dist G.center s = collisionRadius
  t_on_collision :
    dist G.center t = collisionRadius
  collisionClass_card_eq_five :
    (D.A.filter
      (fun z ↦ dist G.center z = collisionRadius)).card = 5
  physicalClass_card_eq_five :
    (SelectedClass D.A S.oppApex2 rho).card = 5
  collisionClass_outside_physical_card_eq_three :
    ((D.A.filter
        (fun z ↦ dist G.center z = collisionRadius)) \
      SelectedClass D.A S.oppApex2 rho).card = 3
  physical_inter_collision_eq_pair :
    SelectedClass D.A S.oppApex2 rho ∩
      D.A.filter (fun z ↦ dist G.center z = collisionRadius) =
        {s, t}
  exact_perpendicular_bisector :
    D.A.filter (fun z ↦ dist z s = dist z t) =
      {G.center, S.oppApex2}
  crossPlacement :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
      (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
      (s ∈ Iu ∧ t ∈ Iv) ∨
      (s ∈ Iv ∧ t ∈ Iu)
  no_actualRow_contains_pair :
    ∀ q : CarrierVertex D.A,
      ¬(s ∈
          ((lateFirstApexSystem R).selectedAt
            q.1 q.2).toCriticalFourShell.support ∧
        t ∈
          ((lateFirstApexSystem R).selectedAt
            q.1 q.2).toCriticalFourShell.support)
  center_mem_interior_of_pair :
    let J := S.capInteriorByIndex S.oppIndex2
    s ∈ J → t ∈ J → G.center ∈ J
  contextualNormalization :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    u = source ∨
      (u.1 ≠ source.1 ∧
        u.1 ∉ Ks ∧
        Iu = {source.1, u.1} ∧
        Ks ∩ Iu = {source.1} ∧
        source.1 ∈ Iu ∩ J ∧
        (lateFirstApexSystem R).centerAt source.1 source.2 ≠
          (lateFirstApexSystem R).centerAt u.1 u.2 ∧
        (lateFirstApexSystem R).centerAt source.1 source.2 ≠
          (lateFirstApexSystem R).centerAt v.1 v.2 ∧
        (lateFirstApexSystem R).centerAt u.1 u.2 ≠
          (lateFirstApexSystem R).centerAt v.1 v.2 ∧
        (other = u ∨
          other.1 ∈ Iv ∨ other = jointDeletion.deleted))

/-- Every nonphysical collision in the full contextual rigid `2+2+1`
branch produces the explicit cross-lens packet above.

This theorem is the checked extraction boundary for the remaining terminal:
all finite counting, two-circle geometry, actual-row separation, and retained
source placement have already been discharged.
-/
theorem exactFourRigid221_context_nonphysicalCollision_crossLens
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenterNe : G.center ≠ S.oppApex2)
    (hcollision : ∃ s ∈ G.deleted, ∃ t ∈ G.deleted,
      s ≠ t ∧ dist G.center s = dist G.center t) :
    ∃ s t : ℝ², ∃ r : ℝ,
      ExactFourRigid221NonphysicalCrossLens
        R rho source other u v jointDeletion G s t r := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  rcases
      exactFourRigid221_context_nonphysicalCollision_exhaustiveSplit
        huClass context G hcenterNe hcollision with
    ⟨s, hs, t, ht, hst, r, hr, hsRadius, htRadius,
      hfive, hbisector, hplacement, hcontextual⟩
  let P := D.A.filter (fun z ↦ dist G.center z = r)
  have hsC : s ∈ C := by
    simpa [C] using G.deleted_subset_class hs
  have htC : t ∈ C := by
    simpa [C] using G.deleted_subset_class ht
  have hsData : s ∈ D.A ∧ dist S.oppApex2 s = rho := by
    simpa [C] using hsC
  have htData : t ∈ D.A ∧ dist S.oppApex2 t = rho := by
    simpa [C] using htC
  have hcirclesNe :
      (⟨S.oppApex2, rho⟩ : EuclideanGeometry.Sphere ℝ²) ≠
        (⟨G.center, r⟩ : EuclideanGeometry.Sphere ℝ²) := by
    intro hcircles
    have hcenters :=
      congrArg EuclideanGeometry.Sphere.center hcircles
    exact hcenterNe (by simpa using hcenters.symm)
  have hsPhysical :
      s ∈ (⟨S.oppApex2, rho⟩ :
        EuclideanGeometry.Sphere ℝ²) := by
    apply EuclideanGeometry.mem_sphere.mpr
    simpa [dist_comm] using hsData.2
  have htPhysical :
      t ∈ (⟨S.oppApex2, rho⟩ :
        EuclideanGeometry.Sphere ℝ²) := by
    apply EuclideanGeometry.mem_sphere.mpr
    simpa [dist_comm] using htData.2
  have hsCollision :
      s ∈ (⟨G.center, r⟩ :
        EuclideanGeometry.Sphere ℝ²) := by
    exact EuclideanGeometry.mem_sphere.mpr
      (by simpa [dist_comm] using hsRadius)
  have htCollision :
      t ∈ (⟨G.center, r⟩ :
        EuclideanGeometry.Sphere ℝ²) := by
    exact EuclideanGeometry.mem_sphere.mpr
      (by simpa [dist_comm] using htRadius)
  have hInter : C ∩ P = {s, t} := by
    apply Finset.Subset.antisymm
    · intro z hz
      rcases Finset.mem_inter.mp hz with ⟨hzC, hzP⟩
      have hzPhysical :
          z ∈ (⟨S.oppApex2, rho⟩ :
            EuclideanGeometry.Sphere ℝ²) := by
        apply EuclideanGeometry.mem_sphere.mpr
        have hzData :
            z ∈ D.A ∧ dist S.oppApex2 z = rho := by
          simpa [C] using hzC
        simpa [dist_comm] using hzData.2
      have hzCollision :
          z ∈ (⟨G.center, r⟩ :
            EuclideanGeometry.Sphere ℝ²) := by
        apply EuclideanGeometry.mem_sphere.mpr
        have hzData : z ∈ D.A ∧ dist G.center z = r := by
          simpa [P] using hzP
        simpa [dist_comm] using hzData.2
      have hzEndpoint :=
        two_circle_common_point_eq_endpoint
          hcirclesNe hst hsPhysical htPhysical hsCollision htCollision
            hzPhysical hzCollision
      simpa only [Finset.mem_insert, Finset.mem_singleton] using
        hzEndpoint
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      have hsP : s ∈ P := by
        simp [P, hsData.1, hsRadius]
      have htP : t ∈ P := by
        simp [P, htData.1, htRadius]
      rcases hz with hz | hz
      · simpa [hz] using Finset.mem_inter.mpr ⟨hsC, hsP⟩
      · simpa [hz] using Finset.mem_inter.mpr ⟨htC, htP⟩
  have hInterCard : (P ∩ C).card = 2 := by
    calc
      (P ∩ C).card = (C ∩ P).card := by
        rw [Finset.inter_comm]
      _ = ({s, t} : Finset ℝ²).card :=
        congrArg (fun Q : Finset ℝ² ↦ Q.card) hInter
      _ = 2 := Finset.card_pair hst
  have hOutsideLe : (P \ C).card ≤ 3 := by
    by_contra hnot
    have hOutsideFour : 4 ≤ (P \ C).card := by omega
    apply G.blocked
    refine ⟨r, hr, ?_⟩
    calc
      4 ≤ (P \ C).card := hOutsideFour
      _ ≤
          ((D.A \ G.deleted).filter
            fun z ↦ dist G.center z = r).card :=
        Finset.card_le_card (by
          intro z hz
          rcases Finset.mem_sdiff.mp hz with ⟨hzP, hzNotC⟩
          have hzData : z ∈ D.A ∧ dist G.center z = r := by
            simpa [P] using hzP
          rcases hzData with ⟨hzA, hzRadius⟩
          have hzNotDeleted : z ∉ G.deleted := by
            intro hzDeleted
            exact hzNotC (by
              simpa [C] using G.deleted_subset_class hzDeleted)
          exact Finset.mem_filter.mpr
            ⟨Finset.mem_sdiff.mpr ⟨hzA, hzNotDeleted⟩,
              hzRadius⟩)
  have hCardDecomp :
      (P \ C).card + (P ∩ C).card = P.card :=
    Finset.card_sdiff_add_card_inter P C
  have hPcard : P.card = 5 := by
    have hfive' : 5 ≤ P.card := by
      simpa [P] using hfive
    omega
  have hOutsideCard : (P \ C).card = 3 := by
    omega
  have hNoActualRow :
      ∀ q : CarrierVertex D.A,
        ¬(s ∈
            ((lateFirstApexSystem R).selectedAt
              q.1 q.2).toCriticalFourShell.support ∧
          t ∈
            ((lateFirstApexSystem R).selectedAt
              q.1 q.2).toCriticalFourShell.support) := by
    intro q hpair
    let K :=
      ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell
    let blocker :=
      (lateFirstApexSystem R).centerAt q.1 q.2
    have hblockerA : blocker ∈ D.A := by
      simpa [blocker, K] using
        (Finset.mem_erase.mp K.center_mem).2
    have hblockerEq : dist blocker s = dist blocker t := by
      exact
        (K.support_eq_radius s
          (by simpa [K] using hpair.1)).trans
          (K.support_eq_radius t
            (by simpa [K] using hpair.2)).symm
    have hblockerBisector :
        blocker ∈ D.A.filter (fun z ↦ dist z s = dist z t) :=
      Finset.mem_filter.mpr ⟨hblockerA, hblockerEq⟩
    rw [hbisector] at hblockerBisector
    simp only [Finset.mem_insert, Finset.mem_singleton] at hblockerBisector
    rcases hblockerBisector with hblockerCenter | hblockerApex
    · have hEraseCard : 4 ≤ (P.erase q.1).card := by
        by_cases hqP : q.1 ∈ P
        · rw [Finset.card_erase_of_mem hqP]
          have hfive' : 5 ≤ P.card := by
            simpa [P] using hfive
          omega
        · rw [Finset.erase_eq_self.mpr hqP]
          have hfive' : 5 ≤ P.card := by
            simpa [P] using hfive
          omega
      have hsubset :
          P.erase q.1 ⊆
            (D.A.erase q.1).filter
              (fun z ↦ dist G.center z = r) := by
        intro z hz
        rcases Finset.mem_erase.mp hz with ⟨hzNeQ, hzP⟩
        rcases Finset.mem_filter.mp hzP with
          ⟨hzA, hzRadius⟩
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr ⟨hzNeQ, hzA⟩, hzRadius⟩
      have hsurvives :
          HasNEquidistantPointsAt 4 (D.A.erase q.1) G.center :=
        ⟨r, hr,
          le_trans hEraseCard (Finset.card_le_card hsubset)⟩
      apply (lateFirstApexSystem R).no_qfree_at q.1 q.2
      simpa [blocker, hblockerCenter] using hsurvives
    · exact
        (surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) q.1 q.2)
          (by simpa [blocker] using hblockerApex)
  have hCrossPlacement :
      (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
        (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
        (s ∈ Iu ∧ t ∈ Iv) ∨
        (s ∈ Iv ∧ t ∈ Iu) := by
    rcases hplacement with hD | hD | hIu | hIv | hIuIv | hIvIu
    · exact Or.inl hD
    · exact Or.inr (Or.inl hD)
    · exact False.elim
        (hNoActualRow u
          ⟨(Finset.mem_inter.mp hIu.1).1,
            (Finset.mem_inter.mp hIu.2).1⟩)
    · exact False.elim
        (hNoActualRow v
          ⟨(Finset.mem_inter.mp hIv.1).1,
            (Finset.mem_inter.mp hIv.2).1⟩)
    · exact Or.inr (Or.inr (Or.inl hIuIv))
    · exact Or.inr (Or.inr (Or.inr hIvIu))
  have hInterior :
      s ∈ J → t ∈ J → G.center ∈ J := by
    intro hsJ htJ
    exact
      commonPhysicalPair_center_mem_secondCapInterior
        (Finset.mem_sdiff.mp G.center_mem_remaining).1
        hcenterNe hsJ htJ hst
        (hsRadius.trans htRadius.symm)
        ((mem_selectedClass.mp hsC).2.trans
          (mem_selectedClass.mp htC).2.symm)
  refine ⟨s, t, r, ?_⟩
  refine
    { s_mem_deleted := hs
      t_mem_deleted := ht
      endpoints_ne := hst
      collisionRadius_pos := hr
      s_on_collision := hsRadius
      t_on_collision := htRadius
      collisionClass_card_eq_five := ?_
      physicalClass_card_eq_five := hclassFive
      collisionClass_outside_physical_card_eq_three := ?_
      physical_inter_collision_eq_pair := ?_
      exact_perpendicular_bisector := hbisector
      crossPlacement := ?_
      no_actualRow_contains_pair := hNoActualRow
      center_mem_interior_of_pair := ?_
      contextualNormalization := ?_ }
  · simpa [P] using hPcard
  · simpa [P, C] using hOutsideCard
  · simpa [P, C] using hInter
  · simpa [C, Ku, Kv, Iu, Iv] using hCrossPlacement
  · simpa [J] using hInterior
  · simpa [C, Ks, Ku, Kv, Iu, Iv, J] using hcontextual

#print axioms exactFourRigid221_context_nonphysicalCollision_crossLens

end ATailFrontierLiveClosure
end Problem97
