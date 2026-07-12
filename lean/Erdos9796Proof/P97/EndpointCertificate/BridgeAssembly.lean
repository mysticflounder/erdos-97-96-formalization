/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.BridgeCarrier
import Erdos9796Proof.P97.EndpointCertificate.EndpointClosureSound
import Erdos9796Proof.P97.EndpointCertificate.OrderedCoreSigns
import Erdos9796Proof.P97.Census554.CapSelectedPinnedShellBridge

/-!
# General-`m` endpoint bridge assembly (design doc §5, items L11–L13)

Final assembly chain for the spine leaf
`Problem97.isM44EndpointGeneralMResidualsExcluded`
(`RemovableVertexAxiom/Base.lean`).  This module lands the dependency-ordered
new lemmas L11, L12b, and L13 of
`docs/endpoint-generalm-bridge-design-2026-07-11.md`, composing only committed
inputs:

* **L11** `exactAt_endpointBlocker` — the `Fin 11` port of
  `GeneralCarrierBridge.exactAt_blocker`: every `endpointBlocker` label points
  at an exact critical-shell row of the pulled-back pattern, so an
  `ExactOffCircleCore` at a blocker center is impossible.
* **Right-family mirrors of L7/L8** — `endpointBlocker_eq_two_of_mem_row_two`
  and `endpointRight_row_two_eq`, the `O1 ↔ O2` mirrors of the committed
  left-family carrier lemmas of `BridgeCarrier`.
* **Shell-system assemblies** — left/right variants of the committed blocker
  assembly that expose the overridden `CriticalShellSystem` itself (the
  committed existential hides it, but the exact-branch consumer of L12b needs
  the system to recover blocker-row exactness).
* **L12b** `false_of_closureCoreAlternative_of_canonical` — full twelve-branch
  consumption of `ClosureCoreAlternative` over a canonical labeling whose
  blocker rows are exact.
* **L13** `false_of_endpointEscapeLeft_cardEleven` /
  `false_of_endpointEscapeRight_cardEleven` — the two leaf conjuncts: force
  card eleven, build the canonical labeling, prescribe the escaped selected
  class, produce `EndpointLeftShellOK` / `EndpointRightShellOK`, and close
  through the endpoint native classifier and L12b.
-/

namespace Problem97

open scoped EuclideanGeometry InnerProductSpace

open Census554.CapSelectedGeometry
open Census554.CapSelectedCarrierBridge
open Census554.CapSelectedFiniteCode
open Census554.EqualityCore

namespace EndpointCertificate

/- ## Private transport helpers

Pointwise copies of the private helpers of `BridgeCarrier`, plus their
right-family mirrors.  They transport prescription facts stated at a Moser
apex to the canonical label carrying that apex. -/

/-- The canonical-label preimage of an `insert` of a carrier point splits off
that point's label. -/
private theorem labelsOf_insert_of_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {y : ℝ²} (hy : y ∈ A) (T : Finset ℝ²) :
    L.toCard11Labeling.labelsOf (insert y T) =
      insert (L.labelOf y) (L.toCard11Labeling.labelsOf T) := by
  ext p
  simp only [L.toCard11Labeling.mem_labelsOf, Finset.mem_insert]
  constructor
  · rintro (hpy | hpT)
    · exact Or.inl (by rw [← hpy, L.labelOf_pointOf])
    · exact Or.inr hpT
  · rintro (hpeq | hpT)
    · exact Or.inl (by rw [hpeq, L.pointOf_labelOf hy])
    · exact Or.inr hpT

/-- The left prescription support fact, stated at the escaped apex
`S.oppositeVertexByIndex S.oppIndex1`, transports to canonical label `1`. -/
private theorem classAt_support_at_point_one
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) {radius : ℝ}
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex1 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
  have gen : ∀ (z : ℝ²) (hz : z ∈ A), z = S.oppositeVertexByIndex S.oppIndex1 →
      (F.classAt z hz).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    intro z hz hzeq
    subst hzeq
    exact hF hz
  exact gen (L.pointOf 1) (L.mem_carrier 1) L.point_one_eq_opposite

/-- The right prescription support fact, stated at the escaped apex
`S.oppositeVertexByIndex S.oppIndex2`, transports to canonical label `2`. -/
private theorem classAt_support_at_point_two
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) {radius : ℝ}
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex2 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex2) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) :
    (F.classAt (L.pointOf 2) (L.mem_carrier 2)).support =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
  have gen : ∀ (z : ℝ²) (hz : z ∈ A), z = S.oppositeVertexByIndex S.oppIndex2 →
      (F.classAt z hz).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
    intro z hz hzeq
    subst hzeq
    exact hF hz
  exact gen (L.pointOf 2) (L.mem_carrier 2) L.point_two_eq_opposite

/- ## L11. Exactness of endpoint blocker rows -/

/-- (L11) Every endpoint-blocker row of the pulled-back finite code is exact:
the pattern's selected class at a chosen blocker center is the exact critical
shell, so no label off that row can share its circle.  `Fin 11` port of
`GeneralCarrierBridge.exactAt_blocker`. -/
theorem exactAt_endpointBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : Label) :
    ExactAt (rowPattern (patternCode L F)) L.pointOf (endpointBlocker H L q) := by
  have hc_mem : H.centerAt (L.pointOf q) (L.mem_carrier q) ∈ A :=
    Finset.mem_of_mem_erase
      (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.center_mem
  have hpt : L.pointOf (endpointBlocker H L q) =
      H.centerAt (L.pointOf q) (L.mem_carrier q) := by
    simp only [endpointBlocker]
    exact L.pointOf_labelOf hc_mem
  have gen : ∀ (z : ℝ²) (hz : z ∈ A),
      z = H.centerAt (L.pointOf q) (L.mem_carrier q) →
      (F.classAt z hz).support =
        (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.support := by
    intro z hz hzeq
    subst hzeq
    exact H.selectedFourClass_support_eq_shell (L.pointOf q) (L.mem_carrier q)
      (F.classAt _ hz)
  have hsupport :
      (F.classAt (L.pointOf (endpointBlocker H L q))
          (L.mem_carrier (endpointBlocker H L q))).support =
        (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.support :=
    gen _ (L.mem_carrier (endpointBlocker H L q)) hpt
  intro a ha z hz hdist
  have haShell : L.pointOf a ∈
      (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.support := by
    rw [← hsupport]
    exact (mem_row_patternCode_iff L F (endpointBlocker H L q) a).mp ha
  have hzRadius :
      dist (H.centerAt (L.pointOf q) (L.mem_carrier q)) (L.pointOf z) =
        (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.radius := by
    calc
      dist (H.centerAt (L.pointOf q) (L.mem_carrier q)) (L.pointOf z) =
          dist (L.pointOf (endpointBlocker H L q)) (L.pointOf z) := by rw [hpt]
      _ = dist (L.pointOf (endpointBlocker H L q)) (L.pointOf a) := hdist
      _ = dist (H.centerAt (L.pointOf q) (L.mem_carrier q)) (L.pointOf a) := by
          rw [hpt]
      _ = (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.radius :=
          (H.selectedAt (L.pointOf q)
            (L.mem_carrier q)).toCriticalFourShell.support_eq_radius _ haShell
  apply hz
  apply (mem_row_patternCode_iff L F (endpointBlocker H L q) z).mpr
  rw [hsupport]
  exact (H.selectedAt (L.pointOf q)
    (L.mem_carrier q)).toCriticalFourShell.off_row_named_label_forbidden
    (L.mem_carrier z) hzRadius

/- ## Right-family mirrors of the committed left carrier lemmas -/

/-- (L7 right mirror) Every source on the escaped row `2` is blocked by label
`2` itself, when the shell system routes that row's exact selected class to the
escaped apex at `oppIndex2`. -/
theorem endpointBlocker_eq_two_of_mem_row_two
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) {radius : ℝ}
    (hclass : (F.classAt (L.pointOf 2) (L.mem_carrier 2)).support =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hoverride : ∀ z : ℝ²,
      z ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
      ∀ hz : z ∈ A, H.centerAt z hz = S.oppositeVertexByIndex S.oppIndex2)
    {q : Label} (hq : q ∈ row (patternCode L F) 2) :
    endpointBlocker H L q = 2 := by
  have hmem : L.pointOf q ∈ (F.classAt (L.pointOf 2) (L.mem_carrier 2)).support :=
    (mem_row_patternCode_iff L F 2 q).mp hq
  rw [hclass] at hmem
  have hc : H.centerAt (L.pointOf q) (L.mem_carrier q) =
      S.oppositeVertexByIndex S.oppIndex2 :=
    hoverride (L.pointOf q) hmem (L.mem_carrier q)
  have hpt2 : L.pointOf 2 = S.oppositeVertexByIndex S.oppIndex2 :=
    L.point_two_eq_opposite
  change L.labelOf (H.centerAt (L.pointOf q) (L.mem_carrier q)) = 2
  rw [hc, ← hpt2, L.labelOf_pointOf]

/-- (L8 right mirror) Under the L6 prescription with the escaped selected class
at label `2`, the pulled-back row `2` is `{9, 10, labelOf x, labelOf w}`, where
`x` is the escapee and `w` is the surplus-cap witness of the right L4
decomposition. -/
theorem endpointRight_row_two_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A)
    {radius rho : ℝ} {x : ℝ²}
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex2 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex2) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) :
    ∃ w, w ∈ S.surplusCap ∧
      w ≠ S.oppositeVertexByIndex S.oppIndex2 ∧ w ≠ x ∧
      row (patternCode L F) 2 = {9, 10, L.labelOf x, L.labelOf w} := by
  obtain ⟨w, hw_surplus, hw_ne_v2, hw_ne_x, hdecomp⟩ :=
    endpointRight_selectedClass_decomposition S hconv hM44 hend
  refine ⟨w, hw_surplus, hw_ne_v2, hw_ne_x, ?_⟩
  have hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hend.2.2.2.1
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hwSel : w ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
    rw [hdecomp]
    exact Finset.mem_insert_self _ _
  have hwA : w ∈ A := (mem_selectedClass.mp hwSel).1
  have hclassEq : (F.classAt (L.pointOf 2) (L.mem_carrier 2)).support =
      insert w (insert x (S.capInteriorByIndex S.oppIndex2)) := by
    rw [classAt_support_at_point_two L F hF, hdecomp]
  have hI : L.toCard11Labeling.labelsOf (S.capInteriorByIndex S.oppIndex2) = intO2 := by
    simpa only [SurplusCapPacket.oppInterior2] using L.oppInterior2_eq
  rw [row_patternCode_eq_labelsOf, hclassEq,
    labelsOf_insert_of_mem L hwA, labelsOf_insert_of_mem L hxA, hI]
  ext a
  simp only [Finset.mem_insert, Finset.mem_singleton, intO2]
  tauto

/- ## Shell-system assemblies exposing the overridden system -/

/-- (L7 assembly, left, system-exposing) Under a left endpoint escape at
`oppIndex1`, the overridden critical-shell system at the escaped apex satisfies
the two `EndpointLeftShellOK` blocker conjuncts for the pulled-back pattern.
Unlike the committed existential `exists_endpointBlocker_of_endpointEscapeLeft`,
the shell system itself is exposed, so blocker-row exactness (L11) remains
available to the closure-core consumer. -/
theorem exists_shellSystem_endpointBlocker_of_endpointEscapeLeft
    {A : Finset ℝ²} (S : SurplusCapPacket A) (L : CanonicalLabeling S)
    {radius rho : ℝ} {x : ℝ²}
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (F : FaithfulCarrierPattern A)
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex1 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    ∃ H : CriticalShellSystem A,
      (∀ q, endpointBlocker H L q ≠ q ∧
        q ∈ row (patternCode L F) (endpointBlocker H L q)) ∧
      (∀ q, q ∈ row (patternCode L F) 1 → endpointBlocker H L q = 1) := by
  classical
  have hmin := CounterexampleData.minimal_of_smaller_false hne hconv hK4 S hMin
  have hcenter : S.oppositeVertexByIndex S.oppIndex1 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex1
  have hradius : 0 < radius := hend.1
  have hcard : (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 :=
    endpointLeft_selectedClass_card_eq_four S hconv hM44 hend
  have hblocked : ∀ z : ℝ²,
      z ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
      ¬ HasNEquidistantPointsAt 4 (A.erase z)
        (S.oppositeVertexByIndex S.oppIndex1) :=
    fun z hz => endpointLeft_no_qfree_of_mem S hconv hM44 hend hz
  obtain ⟨H₀⟩ := CounterexampleData.exists_criticalShellSystem_of_minimal hmin
  have H₀' : CriticalShellSystem A := H₀
  refine ⟨H₀'.overrideExactSelectedClass hcenter hradius hcard hblocked,
    fun q => ⟨endpointBlocker_ne _ L q, mem_row_endpointBlocker _ L F q⟩, ?_⟩
  intro q hq
  refine endpointBlocker_eq_one_of_mem_row_one _ L F
    (classAt_support_at_point_one L F hF) ?_ hq
  intro z hz hzA
  exact H₀'.overrideExactSelectedClass_centerAt hcenter hradius hcard hblocked hzA hz

/-- (L7 assembly, right, system-exposing) The `O1 ↔ O2` mirror of the left
assembly at the escaped apex `oppIndex2` and label `2`. -/
theorem exists_shellSystem_endpointBlocker_of_endpointEscapeRight
    {A : Finset ℝ²} (S : SurplusCapPacket A) (L : CanonicalLabeling S)
    {radius rho : ℝ} {x : ℝ²}
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (F : FaithfulCarrierPattern A)
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex2 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex2) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) :
    ∃ H : CriticalShellSystem A,
      (∀ q, endpointBlocker H L q ≠ q ∧
        q ∈ row (patternCode L F) (endpointBlocker H L q)) ∧
      (∀ q, q ∈ row (patternCode L F) 2 → endpointBlocker H L q = 2) := by
  classical
  have hmin := CounterexampleData.minimal_of_smaller_false hne hconv hK4 S hMin
  have hcenter : S.oppositeVertexByIndex S.oppIndex2 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex2
  have hradius : 0 < radius := hend.1
  have hcard : (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 :=
    endpointRight_selectedClass_card_eq_four S hconv hM44 hend
  have hblocked : ∀ z : ℝ²,
      z ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
      ¬ HasNEquidistantPointsAt 4 (A.erase z)
        (S.oppositeVertexByIndex S.oppIndex2) :=
    fun z hz => endpointRight_no_qfree_of_mem S hconv hM44 hend hz
  obtain ⟨H₀⟩ := CounterexampleData.exists_criticalShellSystem_of_minimal hmin
  have H₀' : CriticalShellSystem A := H₀
  refine ⟨H₀'.overrideExactSelectedClass hcenter hradius hcard hblocked,
    fun q => ⟨endpointBlocker_ne _ L q, mem_row_endpointBlocker _ L F q⟩, ?_⟩
  intro q hq
  refine endpointBlocker_eq_two_of_mem_row_two _ L F
    (classAt_support_at_point_two L F hF) ?_ hq
  intro z hz hzA
  exact H₀'.overrideExactSelectedClass_centerAt hcenter hradius hcard hblocked hzA hz

/- ## L12b. Twelve-branch consumption of the closure-core alternative -/

/-- (L12b) A canonical `(6,4,4)` labeling with exact blocker rows cannot
realize any branch of `ClosureCoreAlternative`.  Branch dispatch:
equality-collision cores via the committed `not_realizes_of_*` family and
`realizes_patternCode`; the exact off-circle branch via L11; duplicate-center
and perpendicular-bisector via the committed pinned-shell consumers; the two
ordered cyclic cores via the committed `OrderedCoreSigns` discharges. -/
theorem false_of_closureCoreAlternative_of_canonical
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) {blocker : Label → Label}
    (hexact : ∀ source,
      ExactAt (rowPattern (patternCode L F)) L.pointOf (blocker source))
    (hcore : ClosureCoreAlternative (patternCode L F) blocker) : False := by
  have hreal := realizes_patternCode L F
  rcases hcore with hdup | hexactCore | hequalK4 | hequilateral | hthreeTriad |
    hsurplusSource | hsixRow | hsevenOrbit | hsevenNetwork | hperp | hfive |
    hrhombus
  · rcases hdup with ⟨core⟩
    exact
      Census554.CapSelectedPinnedShellBridge.false_of_duplicateCenterCore_patternCode
        L F core
  · rcases hexactCore with ⟨source, core, hc⟩
    exact false_of_exactAt_of_exactOffCircleCore hreal core
      (by rw [hc]; exact hexact source)
  · rcases hequalK4 with ⟨core⟩
    exact not_realizes_of_equalK4Core core ⟨_, hreal⟩
  · rcases hequilateral with ⟨core⟩
    exact not_realizes_of_equilateralBisectorCollisionCore core ⟨_, hreal⟩
  · rcases hthreeTriad with ⟨core⟩
    exact not_realizes_of_threeTriadCollisionCore core ⟨_, hreal⟩
  · rcases hsurplusSource with ⟨core⟩
    exact not_realizes_of_surplusSourceCollisionCore core ⟨_, hreal⟩
  · rcases hsixRow with ⟨core⟩
    exact not_realizes_of_sixRowAnchorCollisionCore core ⟨_, hreal⟩
  · rcases hsevenOrbit with ⟨core⟩
    exact not_realizes_of_sevenPointOrbitCollisionCore core ⟨_, hreal⟩
  · rcases hsevenNetwork with ⟨core⟩
    exact not_realizes_of_sevenPointCircleNetworkCollisionCore core ⟨_, hreal⟩
  · rcases hperp with ⟨core⟩
    exact
      Census554.CapSelectedPinnedShellBridge.false_of_perpBisectorCore_patternCode
        L F hconv core
  · rcases hfive with ⟨core, hcyc⟩
    exact Census554.OrderedCoreSigns.cyclicFiveCore_false_of_canonicalLabeling
      L hreal core hcyc
  · rcases hrhombus with ⟨core, hcyc⟩
    exact Census554.OrderedCoreSigns.cyclicSixCore_false_of_canonicalLabeling
      L hreal core hcyc

/- ## L13. The two leaf conjuncts -/

/-- (L13, left) A left endpoint escape at `oppIndex1` is impossible in the
`IsM44`, `5 < m` regime: force card eleven, build the canonical labeling,
prescribe the escaped selected class at label `1`, realize
`EndpointLeftShellOK`, and close through the endpoint native classifier and
the twelve-branch consumer. -/
theorem false_of_endpointEscapeLeft_cardEleven
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hgt : 5 < S.surplusCap.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) : False := by
  classical
  have hcard6 : S.surplusCap.card = 6 :=
    surplusCap_card_eq_six_of_endpointHyps S hconv hK4 hM44 hgt
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  have hrad : 0 < radius := hend.1
  have hv1A : S.oppositeVertexByIndex S.oppIndex1 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex1
  have hcardT :
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 :=
    endpointLeft_selectedClass_card_eq_four S hconv hM44 hend
  obtain ⟨F, hFsupport⟩ := exists_faithfulCarrierPattern_with_class hK4 hv1A
    (SelectedFourClass.ofSelectedClass hrad hcardT)
  have hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex1 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    intro hv
    exact hFsupport hv
  obtain ⟨w, hw_surplus, hw_ne_v1, hw_ne_x, hrow1⟩ :=
    endpointLeft_row_one_eq S L F hconv hM44 hend hF
  have hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hend.2.2.2.1
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hwA : w ∈ A := by
    have hsub : S.surplusCap ⊆ A := by
      rw [← capByIndex_surplusIdx_eq_surplusCap S]
      exact S.capByIndex_subset S.surplusIdx
    exact hsub hw_surplus
  have hescapee : L.labelOf x ∈ intO2 := by
    rw [mem_intO2_iff_point_mem_oppInterior2 L, L.pointOf_labelOf hxA]
    exact endpointLeft_escapee_mem_oppInterior2 S hend
  have hfourthCapS : L.labelOf w ∈ capS := by
    rw [← labelsOf_surplusCap_eq_capS L hcard6,
      L.toCard11Labeling.mem_labelsOf, L.pointOf_labelOf hwA]
    exact hw_surplus
  have hfourth_ne_one : L.labelOf w ≠ 1 := by
    intro h1
    apply hw_ne_v1
    have hpt := congrArg L.pointOf h1
    rwa [L.pointOf_labelOf hwA, L.point_one_eq_opposite] at hpt
  have hfourth : L.labelOf w ∈ insert 2 intS :=
    (by decide : ∀ l : Label, l ∈ capS → l ≠ 1 → l ∈ insert 2 intS)
      (L.labelOf w) hfourthCapS hfourth_ne_one
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  obtain ⟨deleted, hdelmem, hdel_ne_fourth⟩ :=
    Census554.CapSelectedFiniteCode.exists_row_zero_mem_intS_ne hinc.1
      (L.labelOf w)
  have hdel_row0 : deleted ∈ row (patternCode L F) 0 :=
    (Finset.mem_inter.mp hdelmem).1
  have hdel_intS : deleted ∈ intS := (Finset.mem_inter.mp hdelmem).2
  obtain ⟨H, hconj7, hconj8⟩ :=
    exists_shellSystem_endpointBlocker_of_endpointEscapeLeft S L hne hconv hK4
      hM44 hend hMin F hF
  have hconj9 : endpointBlocker H L deleted ≠ 1 := by
    intro hb1
    have hmem : deleted ∈ row (patternCode L F) 1 := by
      have h := (hconj7 deleted).2
      rwa [hb1] at h
    rw [hrow1] at hmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with h7 | h8 | hesc | hfour
    · exact (by decide : (7 : Label) ∉ intS) (h7 ▸ hdel_intS)
    · exact (by decide : (8 : Label) ∉ intS) (h8 ▸ hdel_intS)
    · exact Finset.disjoint_left.mp (by decide : Disjoint intS intO2)
        (hesc ▸ hdel_intS) hescapee
    · exact hdel_ne_fourth hfour
  have hshell : EndpointLeftShellOK (patternCode L F) (endpointBlocker H L)
      (L.labelOf x) (L.labelOf w) deleted :=
    ⟨hescapee, hfourth, hdel_intS, Ne.symm hdel_ne_fourth, hrow1, hdel_row0,
      hconj7, hconj8, hconj9⟩
  have hcore :=
    EndpointNativeClassifier.closureCoreAlternative_of_incidenceOK_endpointLeftShellOK
      hinc hshell
  exact false_of_closureCoreAlternative_of_canonical L F hconv
    (fun source => exactAt_endpointBlocker L F H source) hcore

/-- (L13, right) A right endpoint escape at `oppIndex2` is impossible in the
`IsM44`, `5 < m` regime.  The `O1 ↔ O2` mirror of the left conjunct at label
`2`, closed through the right endpoint classifier family. -/
theorem false_of_endpointEscapeRight_cardEleven
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hgt : 5 < S.surplusCap.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) : False := by
  classical
  have hcard6 : S.surplusCap.card = 6 :=
    surplusCap_card_eq_six_of_endpointHyps S hconv hK4 hM44 hgt
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  have hrad : 0 < radius := hend.1
  have hv2A : S.oppositeVertexByIndex S.oppIndex2 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex2
  have hcardT :
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 :=
    endpointRight_selectedClass_card_eq_four S hconv hM44 hend
  obtain ⟨F, hFsupport⟩ := exists_faithfulCarrierPattern_with_class hK4 hv2A
    (SelectedFourClass.ofSelectedClass hrad hcardT)
  have hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex2 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex2) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
    intro hv
    exact hFsupport hv
  obtain ⟨w, hw_surplus, hw_ne_v2, hw_ne_x, hrow2⟩ :=
    endpointRight_row_two_eq S L F hconv hM44 hend hF
  have hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hend.2.2.2.1
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hwA : w ∈ A := by
    have hsub : S.surplusCap ⊆ A := by
      rw [← capByIndex_surplusIdx_eq_surplusCap S]
      exact S.capByIndex_subset S.surplusIdx
    exact hsub hw_surplus
  have hescapee : L.labelOf x ∈ intO1 := by
    rw [mem_intO1_iff_point_mem_oppInterior1 L, L.pointOf_labelOf hxA]
    exact endpointRight_escapee_mem_oppInterior1 S hend
  have hfourthCapS : L.labelOf w ∈ capS := by
    rw [← labelsOf_surplusCap_eq_capS L hcard6,
      L.toCard11Labeling.mem_labelsOf, L.pointOf_labelOf hwA]
    exact hw_surplus
  have hfourth_ne_two : L.labelOf w ≠ 2 := by
    intro h2
    apply hw_ne_v2
    have hpt := congrArg L.pointOf h2
    rwa [L.pointOf_labelOf hwA, L.point_two_eq_opposite] at hpt
  have hfourth : L.labelOf w ∈ insert 1 intS :=
    (by decide : ∀ l : Label, l ∈ capS → l ≠ 2 → l ∈ insert 1 intS)
      (L.labelOf w) hfourthCapS hfourth_ne_two
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  obtain ⟨deleted, hdelmem, hdel_ne_fourth⟩ :=
    Census554.CapSelectedFiniteCode.exists_row_zero_mem_intS_ne hinc.1
      (L.labelOf w)
  have hdel_row0 : deleted ∈ row (patternCode L F) 0 :=
    (Finset.mem_inter.mp hdelmem).1
  have hdel_intS : deleted ∈ intS := (Finset.mem_inter.mp hdelmem).2
  obtain ⟨H, hconj7, hconj8⟩ :=
    exists_shellSystem_endpointBlocker_of_endpointEscapeRight S L hne hconv hK4
      hM44 hend hMin F hF
  have hconj9 : endpointBlocker H L deleted ≠ 2 := by
    intro hb2
    have hmem : deleted ∈ row (patternCode L F) 2 := by
      have h := (hconj7 deleted).2
      rwa [hb2] at h
    rw [hrow2] at hmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with h9 | h10 | hesc | hfour
    · exact (by decide : (9 : Label) ∉ intS) (h9 ▸ hdel_intS)
    · exact (by decide : (10 : Label) ∉ intS) (h10 ▸ hdel_intS)
    · exact Finset.disjoint_left.mp (by decide : Disjoint intS intO1)
        (hesc ▸ hdel_intS) hescapee
    · exact hdel_ne_fourth hfour
  have hshell : EndpointRightShellOK (patternCode L F) (endpointBlocker H L)
      (L.labelOf x) (L.labelOf w) deleted :=
    ⟨hescapee, hfourth, hdel_intS, Ne.symm hdel_ne_fourth, hrow2, hdel_row0,
      hconj7, hconj8, hconj9⟩
  have hcore :=
    EndpointNativeClassifier.closureCoreAlternative_of_incidenceOK_endpointRightShellOK
      hinc hshell
  exact false_of_closureCoreAlternative_of_canonical L F hconv
    (fun source => exactAt_endpointBlocker L F H source) hcore

end EndpointCertificate

end Problem97
