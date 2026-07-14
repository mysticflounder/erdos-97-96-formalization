import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# ATAIL Stage-I common-cap confinement boundary

This scratch module isolates the second sublemma in the same-cap Stage-I
route.  Once a cap contains both the dangerous center `p` and the live
`u`-row center, there are exactly two possibilities:

* every `u`-row support point outside the dangerous base lies in that cap; or
* a named off-dangerous support point escapes that cap.

The first branch is the existing sufficient confinement producer.  The
second branch is the exact input which a genuinely new MEC/order
classification theorem must send to an already-consumed obstruction.

The finite shadow at the end is deliberately weaker than the live Euclidean
surface.  It kernel-checks that common-cap placement and all of the currently
available row-cardinality/intersection consequences do not by themselves
exclude the escape branch.  It is not claimed to realize a
`CounterexampleData`, a `SurplusCapPacket`, or Euclidean geometry.

The module introduces no axiom, `sorry`, `admit`, or `native_decide`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneConfinementScratch

open U1Depth5

/-- The first Stage-I sublemma: a single indexed cap contains both relevant
centers. -/
def URowCommonCapFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k

/-- The desired second Stage-I sublemma on a fixed common cap. -/
def URowCommonCapOffDangerousConfinement
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    (rows.uRow.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)) ⊆ S.capByIndex k

/-- Exact negation witness for the second Stage-I sublemma: an off-dangerous
point of the live `u` row lies outside the same cap which contains both
centers. -/
def URowOffDangerousEscapeFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3, ∃ z : Plane,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    z ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    z ∉ ({q, t1, t2, t3} : Finset Plane) ∧
    z ∉ S.capByIndex k

/-- Metric upgrade of the raw escape packet on the actual live surface.  The
exact q-deleted dangerous circle forces every escaped off-dangerous carrier
point to have a different `p`-radius from `q`. -/
def URowOffDangerousMetricEscapeFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3, ∃ z : Plane,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    z ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    z ∉ ({q, t1, t2, t3} : Finset Plane) ∧
    z ∉ S.capByIndex k ∧
    dist p z ≠ dist p q

/-- The live exact-dangerous data upgrades a set-theoretic escape to the
metric escape packet above. -/
theorem offDangerousEscape_to_metricEscape
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hescape : URowOffDangerousEscapeFields
      S p q t1 t2 t3 u rows) :
    URowOffDangerousMetricEscapeFields S p q t1 t2 t3 u rows := by
  classical
  rcases hescape with ⟨k, z, hp, hc, hzSupport, hzDangerous, hzOff⟩
  refine ⟨k, z, hp, hc, hzSupport, hzDangerous, hzOff, ?_⟩
  intro hzRadius
  have hzA : z ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
  have hzq : z ≠ q := by
    intro hzq
    apply hzDangerous
    simp [hzq]
  have hzp : z ≠ p := by
    intro hzp
    subst z
    exact hzOff hp
  have hzSkeleton : z ∈ D.skeleton q := by
    have hzEraseQ : z ∈ D.A.erase q :=
      Finset.mem_erase.mpr ⟨hzq, hzA⟩
    simpa [CounterexampleData.skeleton] using hzEraseQ
  have hzClass :
      z ∈ ((D.skeleton q).erase p).filter
        (fun y => dist p y = dist p q) :=
    Finset.mem_filter.mpr
      ⟨Finset.mem_erase.mpr ⟨hzp, hzSkeleton⟩, hzRadius⟩
  have hClassEq :=
    H.dangerous.exact_radius_class_eq H.exactQDeletedRadius
  have hzTriple : z ∈ ({t1, t2, t3} : Finset Plane) := by
    simpa [hClassEq] using hzClass
  apply hzDangerous
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzTriple ⊢
  rcases hzTriple with rfl | rfl | rfl <;> simp

/-- Common-cap placement reduces the entire confinement question to one
named witness-level escape branch. -/
theorem commonCap_confinement_or_offDangerousEscape
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows) :
    URowCommonCapOffDangerousConfinement S p q t1 t2 t3 u rows ∨
      URowOffDangerousEscapeFields S p q t1 t2 t3 u rows := by
  classical
  rcases hcommon with ⟨k, hp, hc⟩
  by_cases hescape : ∃ z : Plane,
      z ∈ rows.uRow.selected.toCriticalFourShell.support ∧
      z ∉ ({q, t1, t2, t3} : Finset Plane) ∧
      z ∉ S.capByIndex k
  · exact Or.inr ⟨k, hescape.choose, hp, hc,
      hescape.choose_spec.1, hescape.choose_spec.2.1,
      hescape.choose_spec.2.2⟩
  · apply Or.inl
    refine ⟨k, hp, hc, ?_⟩
    intro z hz
    rcases Finset.mem_sdiff.mp hz with ⟨hzSupport, hzDangerous⟩
    by_contra hzCap
    exact hescape ⟨z, hzSupport, hzDangerous, hzCap⟩

/-- The strongest uniform packet supplied by a failed confinement branch
after the existing ordered-cap outside-pair consumer has been applied.  The
`u`-row center is equidistant from the two outside points, while `p` must
separate their distances; equality at `p` would already be contradictory. -/
def URowOffDangerousSeparatedPairFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3, ∃ z w : Plane,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    z ≠ w ∧
    z ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    w ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    z ∉ ({q, t1, t2, t3} : Finset Plane) ∧
    z ∉ S.capByIndex k ∧
    w ∉ S.capByIndex k ∧
    dist rows.uRow.center z = dist rows.uRow.center w ∧
    dist p z ≠ dist p w

/-- The existing ordered-cap consumer implies that two outside points which
are equidistant from one cap center must have different distances from every
other distinct cap center. -/
theorem sameCap_outsidePair_pDistance_ne
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {p c z w : Plane}
    (hpCap : p ∈ S.capByIndex k)
    (hcCap : c ∈ S.capByIndex k)
    (hcp : c ≠ p)
    (hzA : z ∈ A) (hwA : w ∈ A) (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hcdist : dist c z = dist c w) :
    dist p z ≠ dist p w := by
  classical
  intro hpdist
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
    apply hcp
    calc
      c = L.points s := hsc.symm
      _ = L.points r := by simp [hrs]
      _ = p := hrp
  have hzOutside : z ∉ Finset.univ.image L.points := by
    simpa [hcap] using hzOff
  have hwOutside : w ∉ Finset.univ.image L.points := by
    simpa [hcap] using hwOff
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hrs' hzA hwA hzOutside hwOutside hzw
        (by simpa [hrp] using hpdist) (by simpa [hsc] using hcdist)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hsr' hzA hwA hzOutside hwOutside hzw
        (by simpa [hsc] using hcdist) (by simpa [hrp] using hpdist)

/-- A failed confinement branch cannot remain a bare one-point escape.  The
row/cardinality bound supplies a second outside row point, and the existing
outside-pair uniqueness theorem forces the resulting pair to have unequal
distances from `p`. -/
theorem offDangerousEscape_to_pSeparatedOutsidePair
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne : rows.uRow.center ≠ p)
    (hescape : URowOffDangerousEscapeFields
      S p q t1 t2 t3 u rows) :
    URowOffDangerousSeparatedPairFields S p q t1 t2 t3 u rows := by
  classical
  rcases hescape with ⟨k, z, hp, hc, hzSupport, hzDangerous, hzOff⟩
  let Krow : SelectedFourClass D.A rows.uRow.center :=
    rows.uRow.selected.toSelectedFourClass
  have hinter :
      (rows.uRow.selected.toCriticalFourShell.support ∩
        S.capByIndex k).card ≤ 2 := by
    have h :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex k Krow hc
    simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using h
  have hsplit := Finset.card_inter_add_card_sdiff
    rows.uRow.selected.toCriticalFourShell.support (S.capByIndex k)
  have hcard := rows.uRow.selected.toCriticalFourShell.support_card
  have houtsideTwo :
      2 ≤ (rows.uRow.selected.toCriticalFourShell.support \
        S.capByIndex k).card := by
    omega
  have houtsideOne :
      1 < (rows.uRow.selected.toCriticalFourShell.support \
        S.capByIndex k).card := by
    omega
  rcases Finset.exists_mem_ne houtsideOne z with ⟨w, hwOutside, hwz⟩
  rcases Finset.mem_sdiff.mp hwOutside with ⟨hwSupport, hwOff⟩
  have hzA : z ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
  have hwA : w ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
  have hcdist :
      dist rows.uRow.center z = dist rows.uRow.center w :=
    (rows.uRow.selected.toCriticalFourShell.support_eq_radius z hzSupport).trans
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius
        w hwSupport).symm
  have hpdist : dist p z ≠ dist p w :=
    sameCap_outsidePair_pDistance_ne S D.convex k hp hc hcenter_ne
      hzA hwA hwz.symm hzOff hwOff hcdist
  exact ⟨k, z, w, hp, hc, hwz.symm, hzSupport, hwSupport,
    hzDangerous, hzOff, hwOff, hcdist, hpdist⟩

/-- With center separation supplied by the already-checked live reduction,
the exact Stage-I split is confinement versus a `p`-separated outside pair. -/
theorem commonCap_confinement_or_pSeparatedOutsidePair
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne : rows.uRow.center ≠ p)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows) :
    URowCommonCapOffDangerousConfinement S p q t1 t2 t3 u rows ∨
      URowOffDangerousSeparatedPairFields S p q t1 t2 t3 u rows := by
  rcases commonCap_confinement_or_offDangerousEscape S rows hcommon with
    hconf | hescape
  · exact Or.inl hconf
  · exact Or.inr
      (offDangerousEscape_to_pSeparatedOutsidePair
        S rows hcenter_ne hescape)

/-- Lean-ready interface for an alternate-based proof.  It is enough to send
every off-dangerous escape to any proposition `Alternate` which an existing
consumer refutes.  The current bank supplies several consumers, but no
theorem producing one of their input packets from this escape data. -/
theorem confinement_or_alternate_of_escape_classifier
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (Alternate : Prop)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows)
    (hclassify :
      URowOffDangerousEscapeFields S p q t1 t2 t3 u rows → Alternate) :
    URowCommonCapOffDangerousConfinement S p q t1 t2 t3 u rows ∨
      Alternate := by
  rcases commonCap_confinement_or_offDangerousEscape S rows hcommon with
    hconf | hescape
  · exact Or.inl hconf
  · exact Or.inr (hclassify hescape)

/-- If the chosen alternate is already consumed to `False`, the classifier
closes the second Stage-I sublemma. -/
theorem confinement_of_escape_classifier_and_consumer
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (Alternate : Prop)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows)
    (hclassify :
      URowOffDangerousEscapeFields S p q t1 t2 t3 u rows → Alternate)
    (hconsume : Alternate → False) :
    URowCommonCapOffDangerousConfinement S p q t1 t2 t3 u rows := by
  rcases confinement_or_alternate_of_escape_classifier
      S rows Alternate hcommon hclassify with hconf | halt
  · exact hconf
  · exact False.elim (hconsume halt)

/-- Stronger Lean-ready boundary after exhausting the existing outside-pair
consumer.  New work need only classify the `p`-separated packet into an
already-refuted `Alternate`; another cap-count lemma cannot do this. -/
theorem confinement_of_pSeparatedPair_classifier_and_consumer
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (Alternate : Prop)
    (hcenter_ne : rows.uRow.center ≠ p)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows)
    (hclassify :
      URowOffDangerousSeparatedPairFields S p q t1 t2 t3 u rows → Alternate)
    (hconsume : Alternate → False) :
    URowCommonCapOffDangerousConfinement S p q t1 t2 t3 u rows := by
  rcases commonCap_confinement_or_pSeparatedOutsidePair
      S rows hcenter_ne hcommon with hconf | hpair
  · exact hconf
  · exact False.elim (hconsume (hclassify hpair))

/- ## Scoped finite shadow

The labels below are the placement layer of the saved `(4,5,6)` residual:

```text
p = 0, c = 1, u = 2,
B = {1,3,4,5},
R = {0,2,5,6},
C = {0,1,8,9,10,11}.
```

Thus `p,c ∈ C`, `R` and `B` both have four points, `c ∉ R`, `u ∈ R \ B`,
and both standard complement lower bounds hold.  Nevertheless `2,6 ∈ R \ B`
escape `C`, while `R ∩ (B \ C) = {5}` has only one point.
-/

namespace CommonCapShadow

abbrev Label := Fin 12

def p : Label := 0
def center : Label := 1
def u : Label := 2

def dangerous : Finset Label := {1, 3, 4, 5}
def support : Finset Label := {0, 2, 5, 6}
def cap : Finset Label := {0, 1, 8, 9, 10, 11}

/-- Every presently extracted set/cardinality consequence, together with the
assumed common cap, holds in the shadow. -/
theorem routine_commonCap_facts :
    p ∈ cap ∧
    center ∈ cap ∧
    p ≠ center ∧
    center ∉ support ∧
    u ∈ support ∧
    u ∉ dangerous ∧
    dangerous.card = 4 ∧
    support.card = 4 ∧
    (support ∩ dangerous).card ≤ 2 ∧
    (support ∩ cap).card ≤ 2 ∧
    2 ≤ (support \ dangerous).card ∧
    2 ≤ (support \ cap).card := by
  decide

/-- The desired confinement conclusion fails in the same shadow. -/
theorem offDangerous_confinement_fails :
    ¬ (support \ dangerous) ⊆ cap := by
  decide

/-- More exactly, the two named off-dangerous labels `2` and `6` escape the
common cap. -/
theorem two_named_offDangerous_escapes :
    u ∈ support \ dangerous ∧ u ∉ cap ∧
      (6 : Label) ∈ support \ dangerous ∧ (6 : Label) ∉ cap := by
  decide

/-- The missing same-cap multiplicity is one rather than two. -/
theorem dangerous_outside_commonCap_card_eq_one :
    (support ∩ (dangerous \ cap)).card = 1 := by
  decide

end CommonCapShadow

#print axioms commonCap_confinement_or_offDangerousEscape
#print axioms offDangerousEscape_to_metricEscape
#print axioms commonCap_confinement_or_pSeparatedOutsidePair
#print axioms confinement_of_escape_classifier_and_consumer
#print axioms confinement_of_pSeparatedPair_classifier_and_consumer
#print axioms CommonCapShadow.routine_commonCap_facts
#print axioms CommonCapShadow.offDangerous_confinement_fails

end ATAILStageOneConfinementScratch
end Problem97
