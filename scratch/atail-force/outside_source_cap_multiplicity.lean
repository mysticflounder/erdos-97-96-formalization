import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# ATAIL outside-source cap-multiplicity audit

This scratch module audits the proposed use of the live outside source `u` as
the second center in the ATAIL same-cap producer.  Every theorem below is a
routine consequence of the current Route-B binders.  The file introduces no
axiom and no `sorry`.

The audit separates four facts which are already available:

* `u` is an ambient source outside the dangerous class
  `{q, t1, t2, t3}`;
* the critical `u`-row has center different from both `u` and `p`;
* its support has at least two points outside the dangerous class; and
* any cap containing its center contains at most two row points, hence at
  least two row points lie outside that cap.

These are two unrelated complement bounds.  The exact missing producer data
are a *single* cap which contains both `p` and the `u`-row center, together
with two dangerous-class row points outside that same cap.  The final section
kernel-checks an honest sufficient condition: the common cap contains every
`u`-row support point outside the dangerous class.  That condition forces the
two points outside the cap to be dangerous.

Retaining the common `CriticalShellSystem` gives another proof that the
`u`-blocker is not `p`: the dangerous K4 survives deletion of the outside
source `u`, contradicting the system's blocker condition at `u`.  It does not
provide either of the two cap-alignment fields above.  Common provenance only
turns an independently supplied equality of blocker centers into equality of
their exact supports.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILOutsideSourceScratch

open U1Depth5

/- ## The selected outside source -/

/-- The selected Route-B source is an ambient carrier point. -/
theorem selectedU_mem_A
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ∈ D.A := by
  have huSkeleton : u ∈ D.skeleton q :=
    (Finset.mem_erase.mp H.selected.candidate_mem).2
  have huEraseQ : u ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using huSkeleton
  exact (Finset.mem_erase.mp huEraseQ).2

/-- The selected source is not the deleted point `q`. -/
theorem selectedU_ne_q
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ≠ q := by
  have huSkeleton : u ∈ D.skeleton q :=
    (Finset.mem_erase.mp H.selected.candidate_mem).2
  have huEraseQ : u ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using huSkeleton
  exact (Finset.mem_erase.mp huEraseQ).1

/-- The selected source is not the dangerous apex `p`. -/
theorem selectedU_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ≠ p :=
  (Finset.mem_erase.mp H.selected.candidate_mem).1

/-- The selected source lies outside the exact dangerous four-point class. -/
theorem selectedU_not_mem_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ∉ ({q, t1, t2, t3} : Finset Plane) := by
  intro hu
  simp only [Finset.mem_insert, Finset.mem_singleton] at hu
  rcases hu with huq | hut1 | hut2 | hut3
  · exact H.selected_off_circle (by simp [huq])
  · exact H.selected.candidate_notin_T (by simp [hut1])
  · exact H.selected.candidate_notin_T (by simp [hut2])
  · exact H.selected.candidate_notin_T (by simp [hut3])

/- ## Routine `u`-row carrier and support facts -/

/-- The `u`-row blocker center is an ambient carrier point. -/
theorem uRow_center_mem_A
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    rows.uRow.center ∈ D.A :=
  (Finset.mem_erase.mp
    rows.uRow.selected.toCriticalFourShell.center_mem).2

/-- A critical blocker center differs from its source. -/
theorem uRow_center_ne_u
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    rows.uRow.center ≠ u :=
  rows.uRow.center_ne_source

/-- The outside source itself belongs to its critical-row support. -/
theorem u_mem_uRow_support
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    u ∈ rows.uRow.selected.toCriticalFourShell.support :=
  rows.uRow.selected.toCriticalFourShell.q_mem_support

/-- The exact `u`-row support has four points. -/
theorem uRow_support_card_eq_four
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    rows.uRow.selected.toCriticalFourShell.support.card = 4 :=
  rows.uRow.selected.toCriticalFourShell.support_card

/- ## Separation from the dangerous apex -/

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

/-- Common-system version of `uRow_center_ne_p`.

No localized `q`-deletion hypothesis is needed here.  If the system chose `p`
as the blocker after deleting the outside source `u`, the dangerous selected
four-class would survive that deletion and violate `no_qfree_at u`. -/
theorem criticalShellSystem_centerAt_ne_p_of_outside_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hsys : CriticalShellSystem D.A)
    (huA : u ∈ D.A)
    (huOutside : u ∉ ({q, t1, t2, t3} : Finset Plane)) :
    Hsys.centerAt u huA ≠ p := by
  intro hcenter
  apply Hsys.no_qfree_at u huA
  rw [hcenter]
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  refine ⟨Kbase.radius, Kbase.radius_pos, ?_⟩
  calc
    4 = Kbase.support.card := Kbase.support_card.symm
    _ ≤ ((D.A.erase u).filter fun z => dist p z = Kbase.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzu => huOutside (by
                  simpa [Kbase, dangerousBaseSelectedFourClass, hzu] using hz),
                Kbase.support_subset_A hz⟩,
            Kbase.support_eq_radius z hz⟩)

/-- Specialized common-system separation for the live selected source. -/
theorem criticalShellSystem_centerAt_selectedU_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) :
    Hsys.centerAt u (selectedU_mem_A H) ≠ p :=
  criticalShellSystem_centerAt_ne_p_of_outside_dangerousBase
    hfixed Hsys (selectedU_mem_A H) (selectedU_not_mem_dangerousBase H)

/- ## The dangerous-class complement -/

/-- At most two `u`-row support points belong to the dangerous class. -/
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

/-- At least two `u`-row support points lie outside the dangerous class. -/
theorem two_le_uRow_support_sdiff_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne_p : rows.uRow.center ≠ p) :
    2 ≤ (rows.uRow.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)).card := by
  have hinter :=
    uRow_inter_dangerousBase_card_le_two hfixed rows hcenter_ne_p
  have hsplit := Finset.card_inter_add_card_sdiff
    rows.uRow.selected.toCriticalFourShell.support
    ({q, t1, t2, t3} : Finset Plane)
  have hcard := uRow_support_card_eq_four rows
  omega

/-- The source `u` is one of the row-support points outside the dangerous
class. -/
theorem u_mem_uRow_support_sdiff_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ∈ rows.uRow.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane) :=
  Finset.mem_sdiff.mpr
    ⟨u_mem_uRow_support rows, selectedU_not_mem_dangerousBase H⟩

/-- Besides `u`, the row contains another support point outside the dangerous
class, at the same `u`-row radius. -/
theorem exists_other_uRow_support_off_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne_p : rows.uRow.center ≠ p) :
    ∃ v : Plane,
      v ≠ u ∧
      v ∈ rows.uRow.selected.toCriticalFourShell.support ∧
      v ∉ ({q, t1, t2, t3} : Finset Plane) ∧
      dist rows.uRow.center v = dist rows.uRow.center u := by
  classical
  let outside := rows.uRow.selected.toCriticalFourShell.support \
    ({q, t1, t2, t3} : Finset Plane)
  have htwo : 2 ≤ outside.card := by
    simpa [outside] using
      two_le_uRow_support_sdiff_dangerousBase hfixed rows hcenter_ne_p
  have hone : 1 < outside.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  have produce {v : Plane} (hv : v ∈ outside) (hvu : v ≠ u) :
      ∃ v : Plane,
        v ≠ u ∧
        v ∈ rows.uRow.selected.toCriticalFourShell.support ∧
        v ∉ ({q, t1, t2, t3} : Finset Plane) ∧
        dist rows.uRow.center v = dist rows.uRow.center u := by
    rcases Finset.mem_sdiff.mp hv with ⟨hvSupport, hvOutside⟩
    refine ⟨v, hvu, hvSupport, hvOutside, ?_⟩
    exact
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius v hvSupport).trans
        rows.uRow.source_on_shell.symm
  by_cases hxu : x = u
  · exact produce hw (by
      intro hwu
      exact hxw (hxu.trans hwu.symm))
  · exact produce hx hxu

/- ## Cap coverage and cap complements -/

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

/-- The dangerous apex lies in some indexed cap. -/
theorem exists_capByIndex_for_p
    {D : CounterexampleData} {p q t1 t2 t3 : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    ∃ k : Fin 3, p ∈ S.capByIndex k :=
  exists_mem_capByIndex_of_mem S hfixed.p_mem

/-- The `u`-row blocker center lies in some indexed cap. -/
theorem exists_capByIndex_for_uRow_center
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    ∃ k : Fin 3, rows.uRow.center ∈ S.capByIndex k :=
  exists_mem_capByIndex_of_mem S (uRow_center_mem_A rows)

/-- A cap containing the `u`-row center contains at most two row points. -/
theorem uRow_inter_cap_card_le_two_of_center_mem
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A) (k : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.uRow.center ∈ S.capByIndex k) :
    (rows.uRow.selected.toCriticalFourShell.support ∩
      S.capByIndex k).card ≤ 2 := by
  let Krow : SelectedFourClass D.A rows.uRow.center :=
    rows.uRow.selected.toSelectedFourClass
  have h :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex k Krow hcenter
  simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using h

/-- At least two `u`-row points lie outside every cap containing its center. -/
theorem two_le_uRow_support_sdiff_cap_of_center_mem
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A) (k : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.uRow.center ∈ S.capByIndex k) :
    2 ≤ (rows.uRow.selected.toCriticalFourShell.support \
      S.capByIndex k).card := by
  have hinter := uRow_inter_cap_card_le_two_of_center_mem S k rows hcenter
  have hsplit := Finset.card_inter_add_card_sdiff
    rows.uRow.selected.toCriticalFourShell.support (S.capByIndex k)
  have hcard := uRow_support_card_eq_four rows
  omega

/-- Witness form of the cap-complement bound. -/
theorem exists_uRow_pair_outside_cap_of_center_mem
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A) (k : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.uRow.center ∈ S.capByIndex k) :
    ∃ x w : Plane,
      x ≠ w ∧
      x ∈ rows.uRow.selected.toCriticalFourShell.support ∧
      w ∈ rows.uRow.selected.toCriticalFourShell.support ∧
      x ∉ S.capByIndex k ∧ w ∉ S.capByIndex k ∧
      dist rows.uRow.center x = dist rows.uRow.center w := by
  classical
  let outside := rows.uRow.selected.toCriticalFourShell.support \
    S.capByIndex k
  have htwo : 2 ≤ outside.card := by
    simpa [outside] using
      two_le_uRow_support_sdiff_cap_of_center_mem S k rows hcenter
  have hone : 1 < outside.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxSupport, hxOff⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwSupport, hwOff⟩
  exact ⟨x, w, hxw, hxSupport, hwSupport, hxOff, hwOff,
    (rows.uRow.selected.toCriticalFourShell.support_eq_radius x hxSupport).trans
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius
        w hwSupport).symm⟩

/- ## Exact missing fields and an honest sufficient producer -/

/-- The exact fields still needed to feed the existing
`DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity` extraction
with the live `u` row. -/
def URowCapMultiplicityFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    2 ≤ (rows.uRow.selected.toCriticalFourShell.support ∩
      (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card

/-- The identical missing-field surface stated directly for the common
critical-shell system.  This is argument-for-argument the open input of
`DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity` with source
`u`; center separation is deliberately omitted because it is already proved
by `criticalShellSystem_centerAt_ne_p_of_outside_dangerousBase`. -/
def CriticalShellSystemCapMultiplicityFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (Hsys : CriticalShellSystem D.A) (huA : u ∈ D.A) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    Hsys.centerAt u huA ∈ S.capByIndex k ∧
    2 ≤ ((Hsys.selectedAt u huA).toCriticalFourShell.support ∩
      (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card

/-- Constructor-level common provenance transports row-local multiplicity
fields to the system-local form, but does not prove those fields. -/
theorem criticalShellSystemCapMultiplicity_of_uRowCapMultiplicity
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) (huA : u ∈ D.A)
    (hrow : rows.uRow =
      CriticalRowPacket.ofCriticalShellSystem Hsys huA)
    (hmul : URowCapMultiplicityFields S p q t1 t2 t3 u rows) :
    CriticalShellSystemCapMultiplicityFields
      S p q t1 t2 t3 u Hsys huA := by
  rcases hmul with ⟨k, hp, hc, htwo⟩
  refine ⟨k, hp, ?_, ?_⟩
  · rw [hrow] at hc
    simpa [CriticalRowPacket.ofCriticalShellSystem] using hc
  · rw [hrow] at htwo
    simpa [CriticalRowPacket.ofCriticalShellSystem] using htwo

/-- The common-system field surface supplies every argument of the existing
same-cap extraction.  In particular, common provenance has removed no
cap/support obligation: it only lets the already-supplied row fields be read
as fields of `Hsys.selectedAt u`. -/
theorem exact_sameCap_producer_arguments_of_commonSystemCapMultiplicity
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hsys : CriticalShellSystem D.A) (huA : u ∈ D.A)
    (huOutside : u ∉ ({q, t1, t2, t3} : Finset Plane))
    (hmul : CriticalShellSystemCapMultiplicityFields
      S p q t1 t2 t3 u Hsys huA) :
    ∃ k : Fin 3,
      p ∈ S.capByIndex k ∧
      Hsys.centerAt u huA ∈ S.capByIndex k ∧
      Hsys.centerAt u huA ≠ p ∧
      2 ≤ ((Hsys.selectedAt u huA).toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card := by
  rcases hmul with ⟨k, hp, hc, htwo⟩
  exact ⟨k, hp, hc,
    criticalShellSystem_centerAt_ne_p_of_outside_dangerousBase
      hfixed Hsys huA huOutside,
    htwo⟩

/-- Once the exact two open fields are supplied, all arguments expected by
the existing same-cap producer—including center separation—are routine. -/
theorem exact_sameCap_producer_arguments_of_uRowCapMultiplicity
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hmul : URowCapMultiplicityFields S p q t1 t2 t3 u rows) :
    ∃ k : Fin 3,
      p ∈ S.capByIndex k ∧
      rows.uRow.center ∈ S.capByIndex k ∧
      rows.uRow.center ≠ p ∧
      2 ≤ (rows.uRow.selected.toCriticalFourShell.support ∩
        (({q, t1, t2, t3} : Finset Plane) \ S.capByIndex k)).card := by
  rcases hmul with ⟨k, hp, hc, htwo⟩
  exact ⟨k, hp, hc, uRow_center_ne_p hlocalNoQFree rows H, htwo⟩

/-- A non-tautological sufficient condition for the exact multiplicity fields:
there is a common cap for `p` and the `u`-row center, and every support point
outside the dangerous class is confined to that cap. -/
def URowCommonCapOffDangerousConfinement
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    (rows.uRow.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)) ⊆ S.capByIndex k

/-- Off-dangerous confinement forces the two row points outside the common cap
to be dangerous, which is precisely the missing cap-local multiplicity. -/
theorem uRowCapMultiplicity_of_commonCap_offDangerousConfinement
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hconf : URowCommonCapOffDangerousConfinement
      S p q t1 t2 t3 u rows) :
    URowCapMultiplicityFields S p q t1 t2 t3 u rows := by
  classical
  rcases hconf with ⟨k, hp, hc, hconf⟩
  let support := rows.uRow.selected.toCriticalFourShell.support
  let dangerous := ({q, t1, t2, t3} : Finset Plane)
  let cap := S.capByIndex k
  have htwoOutside : 2 ≤ (support \ cap).card := by
    simpa [support, cap] using
      two_le_uRow_support_sdiff_cap_of_center_mem S k rows hc
  have hsubset : support \ cap ⊆ support ∩ (dangerous \ cap) := by
    intro z hz
    rcases Finset.mem_sdiff.mp hz with ⟨hzSupport, hzOffCap⟩
    have hzDangerous : z ∈ dangerous := by
      by_contra hzOffDangerous
      have hzOutsideDangerous : z ∈ support \ dangerous :=
        Finset.mem_sdiff.mpr ⟨hzSupport, hzOffDangerous⟩
      exact hzOffCap (by
        simpa [support, dangerous, cap] using hconf hzOutsideDangerous)
    exact Finset.mem_inter.mpr
      ⟨hzSupport, Finset.mem_sdiff.mpr ⟨hzDangerous, hzOffCap⟩⟩
  have htwoTarget : 2 ≤ (support ∩ (dangerous \ cap)).card :=
    le_trans htwoOutside (Finset.card_le_card hsubset)
  exact ⟨k, hp, hc, by
    simpa [support, dangerous, cap] using htwoTarget⟩

/-- Complete positive boundary supplied by the current K-A binders.  Notice
that the two cap witnesses are existentially independent, and so are the two
cardinality complements. -/
theorem current_KA_outsideSource_boundary
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ∈ D.A ∧
    u ∉ ({q, t1, t2, t3} : Finset Plane) ∧
    u ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    rows.uRow.center ∈ D.A ∧
    rows.uRow.center ≠ p ∧
    2 ≤ (rows.uRow.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)).card ∧
    (∃ kp : Fin 3, p ∈ S.capByIndex kp) ∧
    (∃ kc : Fin 3, rows.uRow.center ∈ S.capByIndex kc) ∧
    (∀ k : Fin 3, rows.uRow.center ∈ S.capByIndex k →
      (rows.uRow.selected.toCriticalFourShell.support ∩
        S.capByIndex k).card ≤ 2 ∧
      2 ≤ (rows.uRow.selected.toCriticalFourShell.support \
        S.capByIndex k).card) := by
  have hcenterNe : rows.uRow.center ≠ p :=
    uRow_center_ne_p hlocalNoQFree rows H
  refine ⟨selectedU_mem_A H, selectedU_not_mem_dangerousBase H,
    u_mem_uRow_support rows, uRow_center_mem_A rows, hcenterNe,
    two_le_uRow_support_sdiff_dangerousBase hfixed rows hcenterNe,
    exists_capByIndex_for_p S hfixed,
    exists_capByIndex_for_uRow_center S rows, ?_⟩
  intro k hc
  exact ⟨uRow_inter_cap_card_le_two_of_center_mem S k rows hc,
    two_le_uRow_support_sdiff_cap_of_center_mem S k rows hc⟩

#print axioms criticalShellSystem_centerAt_selectedU_ne_p
#print axioms exact_sameCap_producer_arguments_of_commonSystemCapMultiplicity
#print axioms uRowCapMultiplicity_of_commonCap_offDangerousConfinement
#print axioms current_KA_outsideSource_boundary

end ATAILOutsideSourceScratch
end Problem97
