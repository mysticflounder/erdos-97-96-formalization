import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# ATAIL same-cap second-center producer boundary

This scratch module kernel-checks the routine reductions surrounding the
proposed ATAIL producer.  It introduces no new axiom and no `sorry`.

The content-bearing open statement is deliberately represented only as the
proposition `DangerousRowSameCapSecondCenter`: two points of the exact
dangerous `p`-row, outside a cap containing `p`, have a second distinct center
in that same cap.  The final theorem proves that any inhabitant of this
proposition immediately contradicts the existing ordered-cap uniqueness
theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILForceScratch

open U1Depth5

/-- A critical row centered at `p` which omits `q` contradicts the localized
no-`q`-free packet.  This is the source-generic form of the two specialized
lemmas already used in the live Route-B file. -/
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

/-- The supplied `u` row cannot have the dangerous center `p`. -/
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

/-- The `u` row has at least two support points outside the exact dangerous
four-point row. -/
theorem two_le_uRow_support_sdiff_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne_p : rows.uRow.center ≠ p) :
    2 ≤ (rows.uRow.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)).card := by
  classical
  let Krow : SelectedFourClass D.A rows.uRow.center :=
    rows.uRow.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hinter_le : (Krow.support ∩ Kbase.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Krow Kbase hcenter_ne_p
  have hsplit :
      (Krow.support ∩ Kbase.support).card +
          (Krow.support \ Kbase.support).card = Krow.support.card :=
    Finset.card_inter_add_card_sdiff Krow.support Kbase.support
  have hrow_card : Krow.support.card = 4 := Krow.support_card
  have htwo : 2 ≤ (Krow.support \ Kbase.support).card := by omega
  simpa [Krow, Kbase, dangerousBaseSelectedFourClass,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using htwo

/-- The exact dangerous row supplies two distinct row points outside any
indexed cap containing its center. -/
theorem exists_dangerousRow_pair_outside_cap
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A) (k : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hpCap : p ∈ S.capByIndex k) :
    ∃ x w : Plane,
      x ∈ D.A ∧ w ∈ D.A ∧ x ≠ w ∧
      x ∈ ({q, t1, t2, t3} : Finset Plane) ∧
      w ∈ ({q, t1, t2, t3} : Finset Plane) ∧
      x ∉ S.capByIndex k ∧ w ∉ S.capByIndex k ∧
      dist p x = dist p w := by
  classical
  let Krow : SelectedFourClass D.A rows.t2Row.center :=
    rows.t2Row.selected.toSelectedFourClass
  have hcenterCap : rows.t2Row.center ∈ S.capByIndex k := by
    simpa [hcenter] using hpCap
  have hinter_le : (Krow.support ∩ S.capByIndex k).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex k Krow hcenterCap
  have hsplit :
      (Krow.support ∩ S.capByIndex k).card +
          (Krow.support \ S.capByIndex k).card = Krow.support.card :=
    Finset.card_inter_add_card_sdiff Krow.support (S.capByIndex k)
  have hrow_card : Krow.support.card = 4 := Krow.support_card
  have htwo : 2 ≤ (Krow.support \ S.capByIndex k).card := by omega
  have hone : 1 < (Krow.support \ S.capByIndex k).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxK, hxOff⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwK, hwOff⟩
  have hxSupport :
      x ∈ rows.t2Row.selected.toCriticalFourShell.support := by
    simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hxK
  have hwSupport :
      w ∈ rows.t2Row.selected.toCriticalFourShell.support := by
    simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hwK
  have hxB : x ∈ ({q, t1, t2, t3} : Finset Plane) := by
    simpa [hsupport] using hxSupport
  have hwB : w ∈ ({q, t1, t2, t3} : Finset Plane) := by
    simpa [hsupport] using hwSupport
  have hxA : x ∈ D.A :=
    rows.t2Row.selected.toCriticalFourShell.support_subset_A hxSupport
  have hwA : w ∈ D.A :=
    rows.t2Row.selected.toCriticalFourShell.support_subset_A hwSupport
  have hdistRow : dist rows.t2Row.center x = dist rows.t2Row.center w :=
    (rows.t2Row.selected.toCriticalFourShell.support_eq_radius x hxSupport).trans
      (rows.t2Row.selected.toCriticalFourShell.support_eq_radius w hwSupport).symm
  exact ⟨x, w, hxA, hwA, hxw, hxB, hwB, hxOff, hwOff,
    by simpa [hcenter] using hdistRow⟩

/-- The exact conjectured producer surface: a second center in the same cap
as `p` is equidistant from two dangerous-row points outside that cap. -/
def DangerousRowSameCapSecondCenter
    {A : Finset Plane} (S : SurplusCapPacket A)
    (p q t1 t2 t3 : Plane) : Prop :=
  ∃ k : Fin 3, ∃ c x w : Plane,
    p ∈ S.capByIndex k ∧
    c ∈ S.capByIndex k ∧
    c ≠ p ∧
    x ∈ ({q, t1, t2, t3} : Finset Plane) ∧
    w ∈ ({q, t1, t2, t3} : Finset Plane) ∧
    x ≠ w ∧
    x ∉ S.capByIndex k ∧
    w ∉ S.capByIndex k ∧
    dist c x = dist c w

/-- A single critical full shell whose center lies with `p` in one cap and
whose support contains two dangerous-row points outside that cap supplies the
entire same-cap second-center proposition. This is the exact cap-local
support-multiplicity producer boundary; the extraction itself is routine. -/
theorem DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity
    {A : Finset Plane} (S : SurplusCapPacket A)
    {p q t1 t2 t3 source : Plane}
    (Hsys : CriticalShellSystem A) (hsource : source ∈ A)
    (k : Fin 3)
    (hpCap : p ∈ S.capByIndex k)
    (hcCap : Hsys.centerAt source hsource ∈ S.capByIndex k)
    (hcp : Hsys.centerAt source hsource ≠ p)
    (htwo :
      2 ≤ ((Hsys.selectedAt source hsource).toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card) :
    DangerousRowSameCapSecondCenter S p q t1 t2 t3 := by
  classical
  have hone :
      1 < ((Hsys.selectedAt source hsource).toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_inter.mp hx with ⟨hxSupport, hxOutside⟩
  rcases Finset.mem_inter.mp hw with ⟨hwSupport, hwOutside⟩
  rcases Finset.mem_sdiff.mp hxOutside with ⟨hxB, hxOff⟩
  rcases Finset.mem_sdiff.mp hwOutside with ⟨hwB, hwOff⟩
  have hdist :
      dist (Hsys.centerAt source hsource) x =
        dist (Hsys.centerAt source hsource) w :=
    ((Hsys.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      x hxSupport).trans
      ((Hsys.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        w hwSupport).symm
  exact ⟨k, Hsys.centerAt source hsource, x, w, hpCap, hcCap, hcp,
    hxB, hwB, hxw, hxOff, hwOff, hdist⟩

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

/-- `DangerousRowSameCapSecondCenter` is exactly strong enough to refute the
K-A-PAIR hypothesis surface; no opposite-apex identification is required. -/
theorem DangerousRowSameCapSecondCenter.false
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (W : DangerousRowSameCapSecondCenter S p q t1 t2 t3) :
    False := by
  classical
  rcases W with ⟨k, c, x, w, hpCap, hcCap, hcp, hxB, hwB, hxw,
    hxOff, hwOff, hcdist⟩
  have hxSupport :
      x ∈ rows.t2Row.selected.toCriticalFourShell.support := by
    rw [hsupport]
    exact hxB
  have hwSupport :
      w ∈ rows.t2Row.selected.toCriticalFourShell.support := by
    rw [hsupport]
    exact hwB
  have hxA : x ∈ D.A :=
    rows.t2Row.selected.toCriticalFourShell.support_subset_A hxSupport
  have hwA : w ∈ D.A :=
    rows.t2Row.selected.toCriticalFourShell.support_subset_A hwSupport
  have hpdist : dist p x = dist p w := by
    have hrow :
        dist rows.t2Row.center x = dist rows.t2Row.center w :=
      (rows.t2Row.selected.toCriticalFourShell.support_eq_radius x hxSupport).trans
        (rows.t2Row.selected.toCriticalFourShell.support_eq_radius w hwSupport).symm
    simpa [hcenter] using hrow
  exact false_of_sameCap_outsidePair_twoCenters
    S D.convex k hpCap hcCap hcp hxA hwA hxw hxOff hwOff hpdist hcdist

/-- Lean-facing closure adapter for the exact remaining critical-system field:
one non-`p` shell center in `p`'s cap with two dangerous support points outside
that cap closes K-A-PAIR immediately. -/
theorem false_of_criticalShell_sameCap_capMultiplicity
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) (hsource : source ∈ D.A)
    (k : Fin 3)
    (hpCap : p ∈ S.capByIndex k)
    (hcCap : Hsys.centerAt source hsource ∈ S.capByIndex k)
    (hcp : Hsys.centerAt source hsource ≠ p)
    (htwo :
      2 ≤ ((Hsys.selectedAt source hsource).toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane)) :
    False := by
  apply DangerousRowSameCapSecondCenter.false S rows hcenter hsupport
  exact DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity
    S Hsys hsource k hpCap hcCap hcp htwo

#print axioms DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity
#print axioms DangerousRowSameCapSecondCenter.false
#print axioms false_of_criticalShell_sameCap_capMultiplicity

end ATAILForceScratch
end Problem97
