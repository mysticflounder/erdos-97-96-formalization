import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailExactFifteenApexProfile
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

set_option maxHeartbeats 0

private theorem scratch_injective_finCast_domain
    {n m : ℕ} (h : n = m) {α : Type} {f : Fin n → α}
    (hf : Function.Injective f) :
    Function.Injective (fun i : Fin m => f (Fin.cast h.symm i)) := by
  subst m
  simpa using hf

private theorem scratch_image_univ_finCast_domain
    {n m : ℕ} (h : n = m) {α : Type} [DecidableEq α]
    (f : Fin n → α) :
    Finset.univ.image (fun i : Fin m => f (Fin.cast h.symm i)) =
      Finset.univ.image f := by
  subst m
  rfl

private theorem scratch_ccw_finCast_domain
    {n m : ℕ} (h : n = m) {f : Fin n → ℝ²}
    (hf : EuclideanGeometry.IsCcwConvexPolygon f) :
    EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin m => f (Fin.cast h.symm i)) := by
  subst m
  simpa using hf

example
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9)
    (hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1))
    (hexactCover :
      let Hlate := lateFirstApexSystem R
      let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
      let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
      let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let Kdel := (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell
      let cap := S.capByIndex S.oppIndex2
      let outside := D.A \ cap
      let rowSupport : Fin 4 → Finset ℝ² := fun row =>
        match row.1 with
        | 0 => Kxv.support
        | 1 => Ku.support
        | 2 => Kv.support
        | _ => Kdel.support
      (incidenceBag outside rowSupport).Nodup ∧
        (incidenceBag outside rowSupport).toFinset = outside) :
    Nonempty (ATailBlockerVExactSeventeenSourceNormalForm.SourceRealization D.A) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hIcard : I.card = 7 := by
    have hcapAdd' : I.card + 2 =
        (S.capByIndex S.oppIndex2).card := by
      simpa only [I] using hcapAdd
    omega
  have hnamedSet : blockerVSecondCapNamedSeven Q = I := by
    apply Finset.eq_of_subset_of_card_le hnamedInfo.1
    rw [hnamedInfo.2, hIcard]
  have hnamed : insert e (insert c C) = I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using hnamedSet
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    rw [← hnamed]
    simp [hx]
  have heInterior : e ∈ I := by rw [← hnamed]; simp
  have hcInterior : c ∈ I := by rw [← hnamed]; simp
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using hnamedInfo.2
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 9 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification hm iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2
    hieNeIxv
    hXv hV hDel hCenter hXuCenter
  let cap := S.capByIndex S.oppIndex2
  let rowSupport : Fin 4 → Finset (ℝ²) := fun row =>
    match row.1 with
    | 0 => Kxv.support
    | 1 => Ku.support
    | 2 => Kv.support
    | _ => Kdel.support
  have hexactCover' :
      (incidenceBag (D.A \ cap) rowSupport).Nodup ∧
        (incidenceBag (D.A \ cap) rowSupport).toFinset = D.A \ cap := by
    simpa only [Hlate, Ku, Kv, Kxv, Kdel, cap, rowSupport] using hexactCover
  have hrowCap : ∀ row, (rowSupport row ∩ cap).card ≤ 2 := by
    intro row
    fin_cases row
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass
        (by simpa only [Hlate, Q.hblockerEqV, cap] using interiorCap hvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Ku.toSelectedFourClass
        (by simpa only [Hlate, hcenterU, cap] using interiorCap hxvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kv.toSelectedFourClass
        (by simpa only [Hlate, hcenterV, cap] using interiorCap hdeletedInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kdel.toSelectedFourClass
        (by simpa only [Hlate, c, cap] using interiorCap hcInterior)
  have holdCapRaw : ∀ row,
      rowSupport row ∩ cap =
        match row.1 with
        | 0 => {P.u.1, packet.xv}
        | 1 => {P.u.1, packet.xu}
        | 2 => {P.v.1, packet.xv}
        | _ => {P.v.1, P.jointDeletion.deleted.1} := by
    intro row
    fin_cases row
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 0)
      · exact Finset.mem_inter.mpr ⟨Q.huXvRow, interiorCap huInterior⟩
      · exact Finset.mem_inter.mpr ⟨Kxv.q_mem_support, interiorCap hxvInterior⟩
      · exact huNeXv
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 1)
      · exact Finset.mem_inter.mpr ⟨Ku.q_mem_support, interiorCap huInterior⟩
      · exact Finset.mem_inter.mpr ⟨hxuURow, interiorCap hxuInterior⟩
      · exact huNeXu
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 2)
      · exact Finset.mem_inter.mpr ⟨Kv.q_mem_support, interiorCap hvInterior⟩
      · exact Finset.mem_inter.mpr ⟨hxvVRow, interiorCap hxvInterior⟩
      · exact hvNeXv
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 3)
      · exact Finset.mem_inter.mpr ⟨Q.hvDeletedRow, interiorCap hvInterior⟩
      · exact Finset.mem_inter.mpr ⟨Kdel.q_mem_support, interiorCap hdeletedInterior⟩
      · exact hdelNeV.symm
  obtain ⟨pattern⟩ := exists_faithfulCarrierPattern_of_globalK4 D.K4 P.u.2
  have close
      (orientation : Orientation) (order : NamedOrder)
      (boundary : Fin 17 → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (labelIndex : Label → Fin 17)
      (hposition : PositionEmbedding orientation order labelIndex)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint : boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) = e)
      (hcapLabel : ∀ label, label ∈ secondCapLabels →
        boundary (labelIndex label) ∈ cap) :
      Nonempty (SourceRealization D.A) := by
    let point : Label → ℝ² := fun label => boundary (labelIndex label)
    have hlabelInjective : Function.Injective labelIndex :=
      labelIndex_injective_of_positionEmbedding orientation order labelIndex hposition
    have hpointInjective : Function.Injective point :=
      hboundaryInjective.comp hlabelInjective
    have hpointImage : Finset.univ.image point = D.A := by
      ext x
      constructor
      · rintro hx
        rcases Finset.mem_image.mp hx with ⟨label, -, rfl⟩
        exact boundaryLabel_mem boundary hboundaryImage labelIndex label
      · intro hx
        rw [← hboundaryImage] at hx
        rcases Finset.mem_image.mp hx with ⟨index, -, rfl⟩
        obtain ⟨label, hlabel⟩ :=
          (Finite.injective_iff_surjective.mp hlabelInjective) index
        exact Finset.mem_image.mpr ⟨label, by simp, by simp [point, hlabel]⟩
    have hcapPullback : pullback point cap = secondCapLabels := by
      have hsub : secondCapLabels ⊆ pullback point cap := by
        intro label hlabel
        exact (mem_pullback point cap label).2 (hcapLabel label hlabel)
      have hpullCard : (pullback point cap).card = 9 := by
        rw [card_pullback_eq point D.A cap hpointInjective hpointImage]
        · simpa only [cap] using hcapCard
        · simpa only [cap] using S.capByIndex_subset S.oppIndex2
      have hlabelsCard : secondCapLabels.card = 9 := by native_decide
      exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
    have holdRows : ∀ row,
        selectedOfPattern pattern boundary hboundaryImage labelIndex
            (oldCenter row) = pullback point (rowSupport row) := by
      intro row
      have hsupport :
          (pattern.classAt (point (oldCenter row))
            (boundaryLabel_mem boundary hboundaryImage labelIndex
              (oldCenter row))).support = rowSupport row := by
        fin_cases row
        · calc
            _ = (pattern.classAt (Hlate.centerAt packet.xv Q.hxvA)
                  (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.center_mem).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simpa only [point, oldCenter, hvPoint] using Q.hblockerEqV.symm)
            _ = Kxv.support := by
                simpa only [Kxv] using
                  selectedFourClass_support_eq_shell Hlate packet.xv Q.hxvA
                    (pattern.classAt (Hlate.centerAt packet.xv Q.hxvA)
                      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.center_mem)
        · calc
            _ = (pattern.classAt (Hlate.centerAt P.u.1 P.u.2)
                  (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.center_mem).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simpa only [point, oldCenter, hxvPoint] using hcenterU.symm)
            _ = Ku.support := by
                simpa only [Ku] using
                  selectedFourClass_support_eq_shell Hlate P.u.1 P.u.2
                    (pattern.classAt (Hlate.centerAt P.u.1 P.u.2)
                      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.center_mem)
        · calc
            _ = (pattern.classAt (Hlate.centerAt P.v.1 P.v.2)
                  (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.center_mem).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simpa only [point, oldCenter, hdeletedPoint] using hcenterV.symm)
            _ = Kv.support := by
                simpa only [Kv] using
                  selectedFourClass_support_eq_shell Hlate P.v.1 P.v.2
                    (pattern.classAt (Hlate.centerAt P.v.1 P.v.2)
                      (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.center_mem)
        · calc
            _ = (pattern.classAt
                  (Hlate.centerAt P.jointDeletion.deleted.1
                    P.jointDeletion.deleted.2)
                  (Hlate.selectedAt P.jointDeletion.deleted.1
                    P.jointDeletion.deleted.2).toCriticalFourShell.center_mem).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simp only [point, oldCenter, hcPoint, c])
            _ = Kdel.support := by
                simpa only [Kdel] using
                  selectedFourClass_support_eq_shell Hlate
                    P.jointDeletion.deleted.1 P.jointDeletion.deleted.2
                    (pattern.classAt
                      (Hlate.centerAt P.jointDeletion.deleted.1
                        P.jointDeletion.deleted.2)
                      (Hlate.selectedAt P.jointDeletion.deleted.1
                        P.jointDeletion.deleted.2).toCriticalFourShell.center_mem)
      simpa only [selectedOfPattern, point] using congrArg (pullback point) hsupport
    have holdCapGeom : ∀ row,
        rowSupport row ∩ cap =
          {boundary (labelIndex (oldFixedHit₁ row)),
            boundary (labelIndex (oldFixedHit₂ row))} := by
      intro row
      fin_cases row <;>
        simpa only [oldFixedHit₁, oldFixedHit₂, huPoint, hxuPoint, hvPoint,
          hxvPoint, hdeletedPoint] using holdCapRaw row
    have hcA : c ∈ D.A := Finset.mem_of_mem_erase
      (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
    let d := Hlate.centerAt c hcA
    have hdA : d ∈ D.A := by
      simpa only [d] using (Hlate.selectedAt c hcA).toCriticalFourShell.center_mem
    obtain ⟨nextCenter, hnextPoint⟩ : ∃ label, point label = d := by
      have hdImage : d ∈ Finset.univ.image point := by simpa [hpointImage] using hdA
      rcases Finset.mem_image.mp hdImage with ⟨label, -, hlabel⟩
      exact ⟨label, hlabel⟩
    have hnextCenter : point nextCenter =
        Hlate.centerAt (point 11)
          (boundaryLabel_mem boundary hboundaryImage labelIndex 11) := by
      simpa only [d, point, hcPoint] using hnextPoint
    have hphysicalPullback : pullback point C = physicalLabels := by
      ext label
      simp only [mem_pullback, physicalLabels]
      rw [packet.physical_class]
      fin_cases label <;>
        simp_all only [point, huPoint, hxuPoint, hvPoint, hxvPoint,
          hdeletedPoint, Finset.mem_insert, Finset.mem_union,
          Finset.mem_singleton]
    have hnextSupport :
        (pattern.classAt (point nextCenter)
          (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support =
          (Hlate.selectedAt c hcA).toCriticalFourShell.support := by
      calc
        _ = (pattern.classAt d hdA).support :=
          FaithfulCarrierPattern.classAt_support_congr pattern _ _ hnextPoint
        _ = _ := by
          simpa only [d] using
            selectedFourClass_support_eq_shell Hlate c hcA
              (pattern.classAt d hdA)
    have hnextPhysicalGeom :
        ((pattern.classAt (point nextCenter)
            (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support ∩
          C).card ≤ 1 := by
      rw [hnextSupport]
      simpa only [Hlate, c, C] using hnextRowPhysicalHits
    exact exists_sourceRealization_of_geometricExactCover Hlate pattern order
      orientation boundary hboundaryInjective hboundaryImage hboundaryCcw
      labelIndex hposition rowSupport holdRows cap hcapPullback holdCapGeom
      hexactCover'.1 hexactCover'.2 nextCenter hnextCenter C
      hphysicalPullback hnextPhysicalGeom
  have closeForward
      (order : NamedOrder)
      (huPos : (position order 6).val = iu.val)
      (hxuPos : (position order 7).val = ixu.val)
      (hvPos : (position order 8).val = iv.val)
      (hxvPos : (position order 9).val = ixv.val)
      (hdeletedPos : (position order 10).val = id.val)
      (hcPos : (position order 11).val = ic.val)
      (hePos : (position order 12).val = ie.val) :
      Nonempty SourceRealization D.A := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let carrierBoundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary : Fin 17 → ℝ² := fun point =>
      carrierBoundary (Fin.cast hcard.symm point)
    let labelIndex : Label → Fin 17 := position order
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hcarrierInjective : Function.Injective carrierBoundary := by
      simpa only [carrierBoundary] using
        scratch_injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        scratch_injective_finCast_domain hcard hcarrierInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hcarrierImage : Finset.univ.image carrierBoundary = D.A := by
      simpa only [carrierBoundary] using
        (scratch_image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (scratch_image_univ_finCast_domain hcard carrierBoundary).trans
          hcarrierImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hcarrierCcw : EuclideanGeometry.IsCcwConvexPolygon carrierBoundary := by
      simpa only [carrierBoundary] using
        scratch_ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        scratch_ccw_finCast_domain hcard hcarrierCcw
    have hposition : PositionEmbedding .forward order labelIndex := by
      intro point₁ point₂ hlt
      change position order point₁ < position order point₂
      exact hlt
    have pointAt (point : Label) (t : Fin B.m)
        (hpoint : (position order point).val = t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (position order point)) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        exact hpoint
      simpa only [boundary, carrierBoundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have hcapPosition : ∀ label, label ∈ secondCapLabels →
        (position order label).val < 9 := by
      fin_cases order <;> decide
    have hcapLabel : ∀ label, label ∈ secondCapLabels →
        boundary (labelIndex label) ∈ S.capByIndex S.oppIndex2 := by
      intro label hlabel
      have hlt := hcapPosition label hlabel
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm (position order label)) + B.Block.lo) ∈
          S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change (position order label).val < B.m
      omega
    exact close .forward order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hcapLabel
  have closeReverse
      (order : NamedOrder)
      (huPos : (position order 6).val + iu.val = 8)
      (hxuPos : (position order 7).val + ixu.val = 8)
      (hvPos : (position order 8).val + iv.val = 8)
      (hxvPos : (position order 9).val + ixv.val = 8)
      (hdeletedPos : (position order 10).val + id.val = 8)
      (hcPos : (position order 11).val + ic.val = 8)
      (hePos : (position order 12).val + ie.val = 8) :
      Nonempty SourceRealization D.A := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let carrierBoundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary : Fin 17 → ℝ² := fun point =>
      carrierBoundary (Fin.cast hcard.symm point)
    let labelIndex : Label → Fin 17 := fun point => Fin.rev (position order point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hcarrierInjective : Function.Injective carrierBoundary := by
      simpa only [carrierBoundary] using
        scratch_injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        scratch_injective_finCast_domain hcard hcarrierInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hcarrierImage : Finset.univ.image carrierBoundary = D.A := by
      simpa only [carrierBoundary] using
        (scratch_image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (scratch_image_univ_finCast_domain hcard carrierBoundary).trans
          hcarrierImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hcarrierCcw : EuclideanGeometry.IsCcwConvexPolygon carrierBoundary := by
      simpa only [carrierBoundary] using
        scratch_ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        scratch_ccw_finCast_domain hcard hcarrierCcw
    have hposition : PositionEmbedding .reverse order labelIndex := by
      intro point₁ point₂ hlt
      change (Fin.rev (position order point₂)).val <
        (Fin.rev (position order point₁)).val
      rw [Fin.val_rev, Fin.val_rev]
      omega
    have pointAt (point : Label) (t : Fin B.m)
        (hpoint : (position order point).val + t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (Fin.rev (position order point))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, carrierBoundary, shifted, labelIndex, cut, hcast,
        offset] using B.shifted_after_block_phi_cast_eq_points t
    have hcapPosition : ∀ label, label ∈ secondCapLabels →
        (position order label).val < 9 := by
      fin_cases order <;> decide
    have hcapLabel : ∀ label, label ∈ secondCapLabels →
        boundary (labelIndex label) ∈ S.capByIndex S.oppIndex2 := by
      intro label hlabel
      have hlt := hcapPosition label hlabel
      let t : Fin B.m := ⟨B.m - 1 - (position order label).val, by omega⟩
      have hsum : (position order label).val + t.val = 8 := by
        change (position order label).val +
          (B.m - 1 - (position order label).val) = 8
        omega
      exact (pointAt label t hsum) ▸ B.points_mem_cap t
    exact close .reverse order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hcapLabel
  rcases horders with horder | horder | horder | horder
  · exact closeForward 0 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
  · exact closeForward 1 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
  · exact closeReverse 0 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
  · exact closeReverse 1 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)

end ATailFrontierLiveClosure
end Problem97
