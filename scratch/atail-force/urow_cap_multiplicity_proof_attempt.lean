import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# ATAIL `u`-row cap-multiplicity proof attempt

This scratch module records the exact positive boundary reached from the live
`DoubleApexOffSurplusSharedRadiusPair` row hypotheses.  It introduces no
axiom and no `sorry`.

The desired producer has two content-bearing fields: one indexed cap must
contain both `p` and the `u`-row center, and the `u`-row support must contain
two dangerous points outside that same cap.  The current hypotheses prove
only separate cap witnesses and an upper bound of two on the total dangerous
overlap.  If the desired lower bound is supplied, that overlap is therefore
exactly two, and the existing ordered-cap theorem gives `False` immediately.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILURowProofAttempt

open U1Depth5

/-- The first content-bearing field: `p` and the `u`-row center share an
indexed closed cap. -/
def URowCommonCapAlignment
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧ rows.uRow.center ∈ S.capByIndex k

/-- The second content-bearing field at a fixed cap. -/
def URowDangerousMultiplicityAt
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) (k : Fin 3) : Prop :=
  2 ≤ (rows.uRow.selected.toCriticalFourShell.support ∩
    (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card

/-- Exact producer target audited in this file. -/
def URowCapMultiplicityFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    URowDangerousMultiplicityAt S q t1 t2 t3 u rows k

/-! ## Routine live-row facts -/

/-- A critical row centered at `p` which omits `q` contradicts the localized
no-`q`-free packet. -/
theorem false_of_criticalRow_center_p_q_not_named
    {D : CounterexampleData} {p q source : Plane}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (R : CriticalRowPacket D source)
    (hcenter : R.center = p)
    (hq_not_named :
      ¬ (q = R.selected.l1 ∨ q = R.selected.l2 ∨
        q = R.selected.l3 ∨ q = R.selected.l4)) :
    False := by
  let T := R.selected.toCriticalFourShell.support
  let r := R.selected.toCriticalFourShell.radius
  have hq_not_support : q ∉ R.selected.toCriticalFourShell.support := by
    intro hqmem
    exact hq_not_named ((R.selected.mem_support_iff_named).mp hqmem)
  have hT_subset :
      T ⊆ ((D.skeleton q).erase p).filter fun y => dist p y = r := by
    intro x hx
    have hxSupport : x ∈ R.selected.toCriticalFourShell.support := by
      simpa [T] using hx
    have hxA : x ∈ D.A :=
      R.selected.toCriticalFourShell.support_subset_A hxSupport
    have hx_ne_q : x ≠ q := by
      intro hxq
      exact hq_not_support (by simpa [hxq] using hxSupport)
    have hx_ne_p : x ≠ p := by
      intro hxp
      exact R.selected.toCriticalFourShell.center_not_mem_support
        (by simpa [hcenter, hxp] using hxSupport)
    have hxSkeleton : x ∈ D.skeleton q := by
      have hxEraseQ : x ∈ D.A.erase q :=
        Finset.mem_erase.mpr ⟨hx_ne_q, hxA⟩
      simpa [CounterexampleData.skeleton] using hxEraseQ
    have hxEraseP : x ∈ (D.skeleton q).erase p :=
      Finset.mem_erase.mpr ⟨hx_ne_p, hxSkeleton⟩
    have hdist : dist p x = r := by
      have h := R.selected.toCriticalFourShell.support_eq_radius x hxSupport
      simpa [hcenter, r] using h
    exact Finset.mem_filter.mpr ⟨hxEraseP, hdist⟩
  have hcard_filter :
      4 ≤ (((D.skeleton q).erase p).filter fun y => dist p y = r).card := by
    have hcard_T : T.card = 4 := by
      simpa [T] using R.selected.toCriticalFourShell.support_card
    exact hcard_T ▸ Finset.card_le_card hT_subset
  exact hlocalNoQFree.no_qfree
    ⟨r, by simpa [r] using R.selected.toCriticalFourShell.radius_pos,
      hcard_filter⟩

/-- The live `u` row cannot have the dangerous center `p`. -/
theorem uRow_center_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    rows.uRow.center ≠ p := by
  intro hcenter
  by_cases hq_named :
      q = rows.uRow.selected.l1 ∨ q = rows.uRow.selected.l2 ∨
        q = rows.uRow.selected.l3 ∨ q = rows.uRow.selected.l4
  · have hqdist :
        dist p q = rows.uRow.selected.toCriticalFourShell.radius := by
      rcases hq_named with hq | hq | hq | hq
      · simpa [hcenter, hq] using rows.uRow.selected.l1_dist
      · simpa [hcenter, hq] using rows.uRow.selected.l2_dist
      · simpa [hcenter, hq] using rows.uRow.selected.l3_dist
      · simpa [hcenter, hq] using rows.uRow.selected.l4_dist
    have hudist :
        dist p u = rows.uRow.selected.toCriticalFourShell.radius := by
      simpa [hcenter] using rows.uRow.source_on_shell
    exact H.selected_off_circle (hudist.trans hqdist.symm)
  · exact false_of_criticalRow_center_p_q_not_named
      hlocalNoQFree rows.uRow hcenter hq_named

/-- Every ambient point belongs to at least one indexed closed cap. -/
theorem exists_mem_capByIndex_of_mem
    {A : Finset Plane} (S : SurplusCapPacket A) {x : Plane}
    (hxA : x ∈ A) :
    ∃ k : Fin 3, x ∈ S.capByIndex k := by
  classical
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨k, hxInterior⟩
  · have hxCases :
        x = S.triangle.v1 ∨ x = S.triangle.v2 ∨ x = S.triangle.v3 := by
      simpa [MoserTriangle.verts] using hxMoser
    rcases hxCases with rfl | rfl | rfl
    · exact ⟨1, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2⟩
    · exact ⟨0, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1⟩
    · exact ⟨0, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1⟩
  · exact ⟨k, S.capInteriorByIndex_subset_capByIndex k hxInterior⟩

/-- The total overlap of the `u` row with the dangerous exact four-class is
at most two. -/
theorem uRow_inter_dangerousBase_card_le_two
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne_p : rows.uRow.center ≠ p) :
    (rows.uRow.selected.toCriticalFourShell.support ∩
      ({q, t1, t2, t3} : Finset Plane)).card ≤ 2 := by
  let Krow : SelectedFourClass D.A rows.uRow.center :=
    rows.uRow.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have h := SelectedFourClass.inter_card_le_two Krow Kbase hcenter_ne_p
  simpa [Krow, Kbase, dangerousBaseSelectedFourClass,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using h

/-- The exact positive boundary available from the live row hypotheses:
separate cap witnesses, center separation, and only an *upper* dangerous
overlap bound. -/
theorem current_live_row_boundary
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    ( ∃ kp : Fin 3, p ∈ S.capByIndex kp) ∧
    ( ∃ kc : Fin 3, rows.uRow.center ∈ S.capByIndex kc) ∧
    rows.uRow.center ≠ p ∧
    (rows.uRow.selected.toCriticalFourShell.support ∩
      ({q, t1, t2, t3} : Finset Plane)).card ≤ 2 := by
  have hcA : rows.uRow.center ∈ D.A :=
    (Finset.mem_erase.mp
      rows.uRow.selected.toCriticalFourShell.center_mem).2
  have hcp := uRow_center_ne_p hlocalNoQFree rows H
  exact ⟨exists_mem_capByIndex_of_mem S hfixed.p_mem,
    exists_mem_capByIndex_of_mem S hcA,
    hcp,
    uRow_inter_dangerousBase_card_le_two hfixed rows hcp⟩

/-! ## What an inhabitant of the target would force -/

/-- Because distinct selected four-classes overlap in at most two points, the
desired lower bound would force both the cap-local dangerous overlap and the
total dangerous overlap to have cardinality exactly two. -/
theorem fields_force_exact_two_total_overlap
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hmul : URowCapMultiplicityFields S p q t1 t2 t3 u rows) :
    ∃ k : Fin 3,
      p ∈ S.capByIndex k ∧
      rows.uRow.center ∈ S.capByIndex k ∧
      (rows.uRow.selected.toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card = 2 ∧
      (rows.uRow.selected.toCriticalFourShell.support ∩
        ({q, t1, t2, t3} : Finset Plane)).card = 2 := by
  rcases hmul with ⟨k, hp, hc, htwo⟩
  change 2 ≤
    (rows.uRow.selected.toCriticalFourShell.support ∩
      (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card at htwo
  have hcenter_ne_p := uRow_center_ne_p hlocalNoQFree rows H
  have htotal_le :=
    uRow_inter_dangerousBase_card_le_two hfixed rows hcenter_ne_p
  have hsubset :
      rows.uRow.selected.toCriticalFourShell.support ∩
          (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k) ⊆
        rows.uRow.selected.toCriticalFourShell.support ∩
          ({q, t1, t2, t3} : Finset Plane) := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzSupport, hzB⟩
    exact Finset.mem_inter.mpr ⟨hzSupport, (Finset.mem_sdiff.mp hzB).1⟩
  have hlocal_le := Finset.card_le_card hsubset
  have hlocal_eq :
      (rows.uRow.selected.toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card = 2 := by
    omega
  have htotal_eq :
      (rows.uRow.selected.toCriticalFourShell.support ∩
        ({q, t1, t2, t3} : Finset Plane)).card = 2 := by
    omega
  exact ⟨k, hp, hc, hlocal_eq, htotal_eq⟩

/-- Two distinct centers in one indexed cap cannot share an outside pair. -/
theorem false_of_sameCap_outsidePair_twoCenters
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {p c x w : Plane}
    (hpCap : p ∈ S.capByIndex k)
    (hcCap : c ∈ S.capByIndex k)
    (hpc : c ≠ p)
    (hxA : x ∈ A) (hwA : w ∈ A) (hxw : x ≠ w)
    (hxOff : x ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hpdist : dist p x = dist p w)
    (hcdist : dist c x = dist c w) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hpImage : p ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hpCap
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  rcases Finset.mem_image.mp hpImage with ⟨r, _hr, hrp⟩
  rcases Finset.mem_image.mp hcImage with ⟨s, _hs, hsc⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hpc
    calc
      c = L.points s := hsc.symm
      _ = L.points r := by simp [hrs]
      _ = p := hrp
  have hxOutside : x ∉ Finset.univ.image L.points := by
    simpa [hcap] using hxOff
  have hwOutside : w ∉ Finset.univ.image L.points := by
    simpa [hcap] using hwOff
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hrs' hxA hwA hxOutside hwOutside hxw
        (by simpa [hrp] using hpdist) (by simpa [hsc] using hcdist)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hsr' hxA hwA hxOutside hwOutside hxw
        (by simpa [hsc] using hcdist) (by simpa [hrp] using hpdist)

/-- The desired fields are already contradiction-strength under the remaining
live row hypotheses.  Thus proving them is not a routine adapter: it closes
the geometric leaf. -/
theorem false_of_uRowCapMultiplicityFields
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hmul : URowCapMultiplicityFields S p q t1 t2 t3 u rows) :
    False := by
  classical
  rcases hmul with ⟨k, hpCap, hcCap, htwo⟩
  change 2 ≤
    (rows.uRow.selected.toCriticalFourShell.support ∩
      (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card at htwo
  have hone :
      1 < (rows.uRow.selected.toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_inter.mp hx with ⟨hxSupport, hxBOff⟩
  rcases Finset.mem_inter.mp hw with ⟨hwSupport, hwBOff⟩
  rcases Finset.mem_sdiff.mp hxBOff with ⟨hxB, hxOff⟩
  rcases Finset.mem_sdiff.mp hwBOff with ⟨hwB, hwOff⟩
  have hxA : x ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hxSupport
  have hwA : w ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
  have hxT2 : x ∈ rows.t2Row.selected.toCriticalFourShell.support := by
    rw [hsupport]
    exact hxB
  have hwT2 : w ∈ rows.t2Row.selected.toCriticalFourShell.support := by
    rw [hsupport]
    exact hwB
  have hpdist : dist p x = dist p w := by
    have hrow : dist rows.t2Row.center x = dist rows.t2Row.center w :=
      (rows.t2Row.selected.toCriticalFourShell.support_eq_radius x hxT2).trans
        (rows.t2Row.selected.toCriticalFourShell.support_eq_radius
          w hwT2).symm
    simpa [hcenter] using hrow
  have hcdist : dist rows.uRow.center x = dist rows.uRow.center w :=
    (rows.uRow.selected.toCriticalFourShell.support_eq_radius x hxSupport).trans
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius
        w hwSupport).symm
  exact false_of_sameCap_outsidePair_twoCenters S D.convex k
    hpCap hcCap (uRow_center_ne_p hlocalNoQFree rows H)
    hxA hwA hxw hxOff hwOff hpdist hcdist

#print axioms current_live_row_boundary
#print axioms fields_force_exact_two_total_overlap
#print axioms false_of_uRowCapMultiplicityFields

end ATAILURowProofAttempt
end Problem97
