import scratch.ExactFourRigid221GlobalDeletionSplit

/-!
# Exact-four rigid `2+2+1` exceptional strict-cap arm

This file refines the exceptional `1+1+1` arm of
`ExactFourRigid221PhysicalFiveCycleDecomposition`.  In that arm the deleted
point lies in the strict cap interior and exactly one endpoint of each of the
two named physical row pairs lies there.  The retained source context fixes
the orientation of the `u` pair and eliminates one of the nominal placements
of `other`.
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
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

private theorem pair_inter_card_eq_one_orientation
    {α : Type*} [DecidableEq α]
    (J : Finset α) {a b : α}
    (hab : a ≠ b)
    (hcard : (({a, b} : Finset α) ∩ J).card = 1) :
    (a ∈ J ∧ b ∉ J) ∨ (a ∉ J ∧ b ∈ J) := by
  by_cases ha : a ∈ J
  · left
    refine ⟨ha, ?_⟩
    intro hb
    have hsubset :
        ({a, b} : Finset α) ⊆ ({a, b} : Finset α) ∩ J := by
      intro z hz
      refine Finset.mem_inter.mpr ⟨hz, ?_⟩
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact ha
      · exact hb
    have hle := Finset.card_le_card hsubset
    have hpair : ({a, b} : Finset α).card = 2 := by
      simp [hab]
    omega
  · right
    refine ⟨ha, ?_⟩
    by_contra hb
    have hempty : ({a, b} : Finset α) ∩ J = ∅ := by
      ext z
      constructor
      · intro hz
        rcases Finset.mem_inter.mp hz with ⟨hz, hzJ⟩
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact (ha hzJ).elim
        · exact (hb hzJ).elim
      · intro hz
        simp at hz
    rw [hempty] at hcard
    simp at hcard

private theorem pair_inter_eq_left
    {α : Type*} [DecidableEq α]
    (J : Finset α) {a b : α}
    (ha : a ∈ J) (hb : b ∉ J) :
    ({a, b} : Finset α) ∩ J = {a} := by
  ext z
  simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨rfl | rfl, hz⟩
    · rfl
    · exact (hb hz).elim
  · rintro rfl
    exact ⟨Or.inl rfl, ha⟩

private theorem pair_inter_eq_right
    {α : Type*} [DecidableEq α]
    (J : Finset α) {a b : α}
    (ha : a ∉ J) (hb : b ∈ J) :
    ({a, b} : Finset α) ∩ J = {b} := by
  ext z
  simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨rfl | rfl, hz⟩
    · exact (ha hz).elim
    · rfl
  · rintro rfl
    exact ⟨Or.inr rfl, hb⟩

/-- The sorry-free named part of the rigid physical five-class.  This omits
the directed deleted-row trace, whose current producer still inherits an
unrelated open production obligation. -/
structure ExactFourRigid221PhysicalFiveNamedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²) : Prop where
  xu_ne_u : xu ≠ u.1
  xv_ne_v : xv ≠ v.1
  u_row_trace :
    ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 rho = {u.1, xu}
  v_row_trace :
    ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 rho = {v.1, xv}
  physical_class :
    SelectedClass D.A S.oppApex2 rho =
      insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv})

/-- The exceptional physical-apex `1+1+1` arm after orienting both row pairs
and reintroducing the retained source/other context.

If `u` is the source, `u` is the unique interior member of its pair.  If it
is not, then `xu = source` is the unique interior member and `other = u` is
impossible.  The remaining `other = deleted` alternative is retained in the
non-source branch because eliminating it currently passes through the open
directed-deletion-row obligation. -/
structure ExactFourRigid221PhysicalFiveExceptionalArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²) : Prop where
  named_rows :
    ExactFourRigid221PhysicalFiveNamedRows
      R rho u v jointDeletion G xu xv
  global_deleted_card : G.deleted.card = 2
  deleted_mem_interior :
    jointDeletion.deleted.1 ∈
      S.capInteriorByIndex S.oppIndex2
  u_pair_interior_card :
    ((({u.1, xu} : Finset ℝ²) ∩
      S.capInteriorByIndex S.oppIndex2).card = 1)
  v_pair_interior_card :
    ((({v.1, xv} : Finset ℝ²) ∩
      S.capInteriorByIndex S.oppIndex2).card = 1)
  u_interior_trace :
    (u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∉ S.capInteriorByIndex S.oppIndex2 ∧
        ({u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 = {u.1}) ∨
      (u.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∈ S.capInteriorByIndex S.oppIndex2 ∧
        ({u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 = {xu})
  v_interior_trace :
    (v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xv ∉ S.capInteriorByIndex S.oppIndex2 ∧
        ({v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 = {v.1}) ∨
      (v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
        xv ∈ S.capInteriorByIndex S.oppIndex2 ∧
        ({v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 = {xv})
  contextual_trace :
    (u = source ∧
        u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∉ S.capInteriorByIndex S.oppIndex2 ∧
        (other = jointDeletion.deleted ∨
          (other = v ∧
            v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
            xv ∉ S.capInteriorByIndex S.oppIndex2) ∨
          (other.1 = xv ∧
            v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
            xv ∈ S.capInteriorByIndex S.oppIndex2))) ∨
      (u ≠ source ∧
        source.1 = xu ∧
        u.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∈ S.capInteriorByIndex S.oppIndex2 ∧
        (other = jointDeletion.deleted ∨
          (other = v ∧
            v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
            xv ∉ S.capInteriorByIndex S.oppIndex2) ∨
          (other.1 = xv ∧
            v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
            xv ∈ S.capInteriorByIndex S.oppIndex2)))

/-- The exceptional alternative, the named row data, and the retained source
context canonically yield the oriented packet. -/
theorem exactFourRigid221_exceptionalArm_of_namedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²)
    (namedRows :
      ExactFourRigid221PhysicalFiveNamedRows
        R rho u v jointDeletion G xu xv)
    (hdeletedCard : G.deleted.card = 2)
    (hexceptional :
      jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2 ∧
        ((({u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2).card = 1) ∧
        ((({v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2).card = 1)) :
    ExactFourRigid221PhysicalFiveExceptionalArm
      R rho source other u v jointDeletion G xu xv := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  have hIuEq : Iu = {u.1, xu} := by
    simpa [C, Iu] using namedRows.u_row_trace
  have hIvEq : Iv = {v.1, xv} := by
    simpa [C, Iv] using namedRows.v_row_trace
  have huOrientation :
      (u.1 ∈ J ∧ xu ∉ J) ∨ (u.1 ∉ J ∧ xu ∈ J) :=
    pair_inter_card_eq_one_orientation
      J namedRows.xu_ne_u.symm hexceptional.2.1
  have hvOrientation :
      (v.1 ∈ J ∧ xv ∉ J) ∨ (v.1 ∉ J ∧ xv ∈ J) :=
    pair_inter_card_eq_one_orientation
      J namedRows.xv_ne_v.symm hexceptional.2.2
  have huTrace :
      (u.1 ∈ J ∧ xu ∉ J ∧
          ({u.1, xu} : Finset ℝ²) ∩ J = {u.1}) ∨
        (u.1 ∉ J ∧ xu ∈ J ∧
          ({u.1, xu} : Finset ℝ²) ∩ J = {xu}) := by
    rcases huOrientation with hu | hu
    · exact Or.inl
        ⟨hu.1, hu.2, pair_inter_eq_left J hu.1 hu.2⟩
    · exact Or.inr
        ⟨hu.1, hu.2, pair_inter_eq_right J hu.1 hu.2⟩
  have hvTrace :
      (v.1 ∈ J ∧ xv ∉ J ∧
          ({v.1, xv} : Finset ℝ²) ∩ J = {v.1}) ∨
        (v.1 ∉ J ∧ xv ∈ J ∧
          ({v.1, xv} : Finset ℝ²) ∩ J = {xv}) := by
    rcases hvOrientation with hv | hv
    · exact Or.inl
        ⟨hv.1, hv.2, pair_inter_eq_left J hv.1 hv.2⟩
    · exact Or.inr
        ⟨hv.1, hv.2, pair_inter_eq_right J hv.1 hv.2⟩
  have hcontextual :
      (u = source ∧ u.1 ∈ J ∧ xu ∉ J ∧
          (other = jointDeletion.deleted ∨
            (other = v ∧ v.1 ∈ J ∧ xv ∉ J) ∨
            (other.1 = xv ∧ v.1 ∉ J ∧ xv ∈ J))) ∨
        (u ≠ source ∧ source.1 = xu ∧
          u.1 ∉ J ∧ xu ∈ J ∧
          (other = jointDeletion.deleted ∨
            (other = v ∧ v.1 ∈ J ∧ xv ∉ J) ∨
            (other.1 = xv ∧ v.1 ∉ J ∧ xv ∈ J))) := by
    by_cases huEqSource : u = source
    · have huJ : u.1 ∈ J := by
        simpa [huEqSource] using context.source_mem_interior
      have huOriented : u.1 ∈ J ∧ xu ∉ J := by
        rcases huOrientation with hu | hu
        · exact hu
        · exact (hu.1 huJ).elim
      refine Or.inl
        ⟨huEqSource, huOriented.1, huOriented.2, ?_⟩
      have hother :=
        exactFourRigid221_context_u_eq_source_otherPlacement
          context G huEqSource
      change other = jointDeletion.deleted ∨ other.1 ∈ Iv at hother
      rcases hother with hdeleted | hIv
      · exact Or.inl hdeleted
      · rw [hIvEq] at hIv
        simp only [Finset.mem_insert, Finset.mem_singleton] at hIv
        rcases hIv with hv | hxv
        · have hvEq : other = v := Subtype.ext hv
          have hvJ : v.1 ∈ J := by
            simpa [hvEq] using context.other_mem_interior
          have hvOriented : v.1 ∈ J ∧ xv ∉ J := by
            rcases hvOrientation with h | h
            · exact h
            · exact (h.1 hvJ).elim
          exact Or.inr
            (Or.inl ⟨hvEq, hvOriented.1, hvOriented.2⟩)
        · have hxvJ : xv ∈ J := by
            simpa [hxv] using context.other_mem_interior
          have hvOriented : v.1 ∉ J ∧ xv ∈ J := by
            rcases hvOrientation with h | h
            · exact (h.2 hxvJ).elim
            · exact h
          exact Or.inr
            (Or.inr ⟨hxv, hvOriented.1, hvOriented.2⟩)
    · have hnormal :=
        exactFourRigid221_context_u_ne_source_normalForm
          huClass context jointDeletion.blockers_ne G huEqSource
      have hsourceIu : source.1 ∈ Iu := by
        have : source.1 ∈ ({source.1, u.1} : Finset ℝ²) := by simp
        rw [← hnormal.2.2.1] at this
        exact this
      rw [hIuEq] at hsourceIu
      simp only [Finset.mem_insert, Finset.mem_singleton] at hsourceIu
      have hsourceEqXu : source.1 = xu := by
        rcases hsourceIu with hsourceEqU | hsourceEqXu
        · exact
            (huEqSource
              (Subtype.ext hsourceEqU.symm)).elim
        · exact hsourceEqXu
      have hxuJ : xu ∈ J := by
        simpa [hsourceEqXu] using context.source_mem_interior
      have huOriented : u.1 ∉ J ∧ xu ∈ J := by
        rcases huOrientation with h | h
        · exact (h.2 hxuJ).elim
        · exact h
      refine Or.inr
        ⟨huEqSource, hsourceEqXu, huOriented.1, huOriented.2, ?_⟩
      have hother :=
        exactFourRigid221_context_u_ne_source_otherPlacement
          huClass context jointDeletion.blockers_ne G huEqSource
      change other = u ∨ other.1 ∈ Iv ∨
        other = jointDeletion.deleted at hother
      rcases hother with hu | hIv | hdeleted
      · have huJ : u.1 ∈ J := by
          simpa [hu] using context.other_mem_interior
        exact (huOriented.1 huJ).elim
      · rw [hIvEq] at hIv
        simp only [Finset.mem_insert, Finset.mem_singleton] at hIv
        rcases hIv with hv | hxv
        · have hvEq : other = v := Subtype.ext hv
          have hvJ : v.1 ∈ J := by
            simpa [hvEq] using context.other_mem_interior
          have hvOriented : v.1 ∈ J ∧ xv ∉ J := by
            rcases hvOrientation with h | h
            · exact h
            · exact (h.1 hvJ).elim
          exact Or.inr
            (Or.inl ⟨hvEq, hvOriented.1, hvOriented.2⟩)
        · have hxvJ : xv ∈ J := by
            simpa [hxv] using context.other_mem_interior
          have hvOriented : v.1 ∉ J ∧ xv ∈ J := by
            rcases hvOrientation with h | h
            · exact (h.2 hxvJ).elim
            · exact h
          exact Or.inr
            (Or.inr ⟨hxv, hvOriented.1, hvOriented.2⟩)
      · exact Or.inl hdeleted
  exact
    { named_rows := namedRows
      global_deleted_card := hdeletedCard
      deleted_mem_interior := hexceptional.1
      u_pair_interior_card := hexceptional.2.1
      v_pair_interior_card := hexceptional.2.2
      u_interior_trace := by simpa [J] using huTrace
      v_interior_trace := by simpa [J] using hvTrace
      contextual_trace := by simpa [J] using hcontextual }

/-- Full-hypothesis producer with the two heavy-row arms unchanged and the
exceptional arm replaced by the strictly narrower, source-oriented packet.
Every dependency used here is free of `sorryAx`. -/
theorem exactFourRigid221_physicalApex_exceptionalArmRefinement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter : G.center = S.oppApex2) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221PhysicalFiveNamedRows
          R rho u v jointDeletion G xu xv ∧
        ((({u.1, xu} : Finset ℝ²) ∩
              S.capInteriorByIndex S.oppIndex2 = {u.1, xu} ∧
            (lateFirstApexSystem R).centerAt u.1 u.2 ∈
              S.capInteriorByIndex S.oppIndex2 ∧
            ((lateFirstApexSystem R).selectedAt
                u.1 u.2).toCriticalFourShell.support ∩
              S.capByIndex S.oppIndex2 = {u.1, xu}) ∨
          ((({v.1, xv} : Finset ℝ²) ∩
                S.capInteriorByIndex S.oppIndex2 = {v.1, xv} ∧
              (lateFirstApexSystem R).centerAt v.1 v.2 ∈
                S.capInteriorByIndex S.oppIndex2 ∧
              ((lateFirstApexSystem R).selectedAt
                  v.1 v.2).toCriticalFourShell.support ∩
                S.capByIndex S.oppIndex2 = {v.1, xv}) ∨
            ExactFourRigid221PhysicalFiveExceptionalArm
              R rho source other u v jointDeletion G xu xv)) := by
  classical
  rcases exactFourRigid221_namedCompanions huClass hvClass G with
    ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq, hCeq⟩
  let namedRows :
      ExactFourRigid221PhysicalFiveNamedRows
        R rho u v jointDeletion G xu xv :=
    { xu_ne_u := hxuNe
      xv_ne_v := hxvNe
      u_row_trace := hIuEq
      v_row_trace := hIvEq
      physical_class := hCeq }
  refine ⟨xu, xv, namedRows, ?_⟩
  have hinter :=
    exactFourRigid221_physicalClass_detailedInteriorSplit
      surface hrho hclassFive G
  change
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    (Iu ∩ J = Iu ∧
        (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
        Ku ∩ S.capByIndex S.oppIndex2 = Iu) ∨
      (Iv ∩ J = Iv ∧
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∧
        Kv ∩ S.capByIndex S.oppIndex2 = Iv) ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1)
      at hinter
  dsimp only at hinter
  rcases hinter with hu | hv | hexceptional
  · rw [hIuEq] at hu
    exact Or.inl hu
  · rw [hIvEq] at hv
    exact Or.inr (Or.inl hv)
  · rw [hIuEq, hIvEq] at hexceptional
    have hdeletedCard :
        G.deleted.card = 2 :=
      exactFourRigid221_physicalApex_deleted_card_eq_two
        hrho hclassFive G hcenter
    exact Or.inr (Or.inr
      (exactFourRigid221_exceptionalArm_of_namedRows
        R rho source other u v huClass context jointDeletion G
          xu xv namedRows hdeletedCard hexceptional))

end ATailFrontierLiveClosure
end Problem97
