/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.CardElevenBridgeStaging

/-!
# ERASE card-eleven finite blocker

The erased row is an exact full selected class, but `ErasedPinTriple` does not
say that its geometric center is the critical-shell blocker after deleting
every member of that row.  Accordingly, this module does not override a
`CriticalShellSystem` on the whole class.  It overrides only the finite blocker
map on the prescribed row and proves row exactness there directly; away from
that row it retains the minimal critical-shell blocker and its exactness.
-/

namespace Problem97

open scoped EuclideanGeometry InnerProductSpace

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedGeometry
open Census554.CapSelectedCarrierBridge
open Census554.EqualityCore

namespace ErasedCertificate

/-- A center label is not a member of its own pulled-back selected row. -/
theorem center_not_mem_patternCode_row
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (center : Label) : center ∉ row (patternCode L F) center := by
  intro hcenter
  exact (F.classAt (L.pointOf center)
    (L.mem_carrier center)).center_not_mem
      ((mem_row_patternCode_iff L F center center).mp hcenter)

/-- Override the finite blocker map on one prescribed row. -/
noncomputable def erasedBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) (center : Label) : Label → Label :=
  fun q =>
    if q ∈ row (patternCode L F) center then center
    else EndpointCertificate.endpointBlocker H L q

/-- The finite erased blocker has no fixed point. -/
theorem erasedBlocker_ne
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) (center q : Label) :
    erasedBlocker H L F center q ≠ q := by
  by_cases hq : q ∈ row (patternCode L F) center
  · rw [erasedBlocker, if_pos hq]
    intro hcenter
    subst q
    exact center_not_mem_patternCode_row L F center hq
  · rw [erasedBlocker, if_neg hq]
    exact EndpointCertificate.endpointBlocker_ne H L q

/-- Every source lies in the row selected at its finite erased blocker. -/
theorem mem_row_erasedBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) (center q : Label) :
    q ∈ row (patternCode L F) (erasedBlocker H L F center q) := by
  by_cases hq : q ∈ row (patternCode L F) center
  · rw [erasedBlocker, if_pos hq]
    exact hq
  · rw [erasedBlocker, if_neg hq]
    exact EndpointCertificate.mem_row_endpointBlocker H L F q

/-- Every source on the prescribed row is sent to its prescribed center. -/
theorem erasedBlocker_eq_center_of_mem_row
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) (center : Label) {q : Label}
    (hq : q ∈ row (patternCode L F) center) :
    erasedBlocker H L F center q = center := by
  simp [erasedBlocker, hq]

/-- A prescribed erased-pin row is exact: every carrier label outside the
four-point row has a different center distance from every row label. -/
theorem exactAt_prescribedErasedPinRow
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    ExactAt (rowPattern (patternCode L F)) L.pointOf (L.labelOf p) := by
  intro a ha z hz hdist
  have haClass : L.pointOf a ∈ SelectedClass A p (dist p x) := by
    have haSupport :=
      (mem_row_patternCode_iff L F (L.labelOf p) a).mp ha
    rw [classAt_support_at_labelOf L F hpA hF] at haSupport
    exact haSupport
  have haRadius : dist p (L.pointOf a) = dist p x :=
    (mem_selectedClass.mp haClass).2
  apply hz
  apply (mem_row_patternCode_iff L F (L.labelOf p) z).mpr
  rw [classAt_support_at_labelOf L F hpA hF]
  apply mem_selectedClass.mpr
  refine ⟨L.mem_carrier z, ?_⟩
  calc
    dist p (L.pointOf z) =
        dist (L.pointOf (L.labelOf p)) (L.pointOf z) := by
      rw [L.pointOf_labelOf hpA]
    _ = dist (L.pointOf (L.labelOf p)) (L.pointOf a) := hdist
    _ = dist p (L.pointOf a) := by rw [L.pointOf_labelOf hpA]
    _ = dist p x := haRadius

/-- Every canonical critical-shell blocker row is exact.  This is the small
carrier-level fact needed here, restated locally to keep the ERASE staging
layer independent of the full endpoint closure assembly. -/
theorem exactAt_endpointBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : Label) :
    ExactAt (rowPattern (patternCode L F)) L.pointOf
      (EndpointCertificate.endpointBlocker H L q) := by
  have hc_mem : H.centerAt (L.pointOf q) (L.mem_carrier q) ∈ A :=
    Finset.mem_of_mem_erase
      (H.selectedAt (L.pointOf q)
        (L.mem_carrier q)).toCriticalFourShell.center_mem
  have hpt : L.pointOf (EndpointCertificate.endpointBlocker H L q) =
      H.centerAt (L.pointOf q) (L.mem_carrier q) := by
    simp only [EndpointCertificate.endpointBlocker]
    exact L.pointOf_labelOf hc_mem
  have gen : ∀ (z : ℝ²) (hz : z ∈ A),
      z = H.centerAt (L.pointOf q) (L.mem_carrier q) →
      (F.classAt z hz).support =
        (H.selectedAt (L.pointOf q)
          (L.mem_carrier q)).toCriticalFourShell.support := by
    intro z hz hzeq
    subst z
    exact H.selectedFourClass_support_eq_shell (L.pointOf q)
      (L.mem_carrier q) (F.classAt _ hz)
  have hsupport :
      (F.classAt
        (L.pointOf (EndpointCertificate.endpointBlocker H L q))
        (L.mem_carrier
          (EndpointCertificate.endpointBlocker H L q))).support =
      (H.selectedAt (L.pointOf q)
        (L.mem_carrier q)).toCriticalFourShell.support :=
    gen _ (L.mem_carrier (EndpointCertificate.endpointBlocker H L q)) hpt
  intro a ha z hz hdist
  have haShell : L.pointOf a ∈
      (H.selectedAt (L.pointOf q)
        (L.mem_carrier q)).toCriticalFourShell.support := by
    rw [← hsupport]
    exact (mem_row_patternCode_iff L F
      (EndpointCertificate.endpointBlocker H L q) a).mp ha
  have hzRadius :
      dist (H.centerAt (L.pointOf q) (L.mem_carrier q)) (L.pointOf z) =
        (H.selectedAt (L.pointOf q)
          (L.mem_carrier q)).toCriticalFourShell.radius := by
    calc
      _ = dist
          (L.pointOf (EndpointCertificate.endpointBlocker H L q))
          (L.pointOf z) := by rw [hpt]
      _ = dist
          (L.pointOf (EndpointCertificate.endpointBlocker H L q))
          (L.pointOf a) := hdist
      _ = dist (H.centerAt (L.pointOf q) (L.mem_carrier q))
          (L.pointOf a) := by rw [hpt]
      _ = (H.selectedAt (L.pointOf q)
          (L.mem_carrier q)).toCriticalFourShell.radius :=
        (H.selectedAt (L.pointOf q)
          (L.mem_carrier q)).toCriticalFourShell.support_eq_radius _ haShell
  apply hz
  apply (mem_row_patternCode_iff L F
    (EndpointCertificate.endpointBlocker H L q) z).mpr
  rw [hsupport]
  exact (H.selectedAt (L.pointOf q)
    (L.mem_carrier q)).toCriticalFourShell.off_row_named_label_forbidden
      (L.mem_carrier z) hzRadius

/-- Exactness of the finite erased blocker: prescribed-row sources use the
direct exactness theorem above; all other sources use the minimal
critical-shell system. -/
theorem exactAt_erasedBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x))
    (q : Label) :
    ExactAt (rowPattern (patternCode L F)) L.pointOf
      (erasedBlocker H L F (L.labelOf p) q) := by
  by_cases hq : q ∈ row (patternCode L F) (L.labelOf p)
  · rw [erasedBlocker, if_pos hq]
    exact exactAt_prescribedErasedPinRow L F hpA hF
  · rw [erasedBlocker, if_neg hq]
    exact exactAt_endpointBlocker L F H q

/-- Minimality supplies a finite erased blocker satisfying the total blocker
contract, prescribed-row routing, and exactness needed by the closure-core
consumer. -/
theorem exists_erasedBlocker_of_minimal
    {A : Finset ℝ²} (S : SurplusCapPacket A) (L : CanonicalLabeling S)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (F : FaithfulCarrierPattern A) {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    ∃ H : CriticalShellSystem A,
      (∀ q, erasedBlocker H L F (L.labelOf p) q ≠ q ∧
        q ∈ row (patternCode L F)
          (erasedBlocker H L F (L.labelOf p) q)) ∧
      (∀ q, q ∈ row (patternCode L F) (L.labelOf p) →
        erasedBlocker H L F (L.labelOf p) q = L.labelOf p) ∧
      (∀ q, ExactAt (rowPattern (patternCode L F)) L.pointOf
        (erasedBlocker H L F (L.labelOf p) q)) := by
  have hminimal :=
    CounterexampleData.minimal_of_smaller_false hne hconv hK4 S hMin
  obtain ⟨H⟩ := CounterexampleData.exists_criticalShellSystem_of_minimal hminimal
  refine ⟨H, ?_, ?_, ?_⟩
  · intro q
    exact ⟨erasedBlocker_ne H L F (L.labelOf p) q,
      mem_row_erasedBlocker H L F (L.labelOf p) q⟩
  · intro q hq
    exact erasedBlocker_eq_center_of_mem_row H L F (L.labelOf p) hq
  · exact exactAt_erasedBlocker H L F hpA hF

/-- Proof-facing geometry package for one ERASE card-eleven seed row.  The
four finite buckets are parameters so the same record serves the two
non-surplus orientations. -/
structure ErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x p : ℝ²)
    (centerBucket sameBucket leftBucket rightBucket : Finset Label)
    (m s l r : ℕ) where
  L : CanonicalLabeling S
  F : FaithfulCarrierPattern A
  H : CriticalShellSystem A
  deleted : Label
  incidence : IncidenceOK (patternCode L F)
  center_mem : L.labelOf p ∈ centerBucket
  pin_mem : L.labelOf x ∈ intS
  pin_mem_row : L.labelOf x ∈ row (patternCode L F) (L.labelOf p)
  pin_ne_center : L.labelOf x ≠ L.labelOf p
  moser_card : (row (patternCode L F) (L.labelOf p) ∩ moser).card = m
  same_card : (row (patternCode L F) (L.labelOf p) ∩ sameBucket).card = s
  left_card : (row (patternCode L F) (L.labelOf p) ∩ leftBucket).card = l
  right_card : (row (patternCode L F) (L.labelOf p) ∩ rightBucket).card = r
  deleted_mem_intS : deleted ∈ intS
  deleted_mem_row_zero : deleted ∈ row (patternCode L F) 0
  blocker_total : ∀ q,
    erasedBlocker H L F (L.labelOf p) q ≠ q ∧
      q ∈ row (patternCode L F) (erasedBlocker H L F (L.labelOf p) q)
  seed_blocker : ∀ q, q ∈ row (patternCode L F) (L.labelOf p) →
    erasedBlocker H L F (L.labelOf p) q = L.labelOf p
  blocker_exact : ∀ q, ExactAt (rowPattern (patternCode L F)) L.pointOf
    (erasedBlocker H L F (L.labelOf p) q)

/-- Right-family specialization: finite buckets
`(moser, intO1, intO2, intS)` realize geometric counts
`(moser, same, left, right)`. -/
abbrev RightErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x p : ℝ²)
    (m s l r : ℕ) :=
  ErasedShellGeometry S x p intO1 intO1 intO2 intS m s l r

/-- Left-family specialization: finite buckets
`(moser, intO2, intS, intO1)` realize geometric counts
`(moser, same, left, right)`. -/
abbrev LeftErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x p : ℝ²)
    (m s l r : ℕ) :=
  ErasedShellGeometry S x p intO2 intO2 intS intO1 m s l r

/-- Assemble the complete proof-facing right ERASE shell geometry from one
exact count row in the card-eleven branch. -/
theorem exists_rightErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²} {m s l r : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpA : p ∈ A)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex1 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) = r)
    (hsum : m + s + l + r = 4) :
    Nonempty (RightErasedShellGeometry S x p m s l r) := by
  classical
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  have htriple :=
    erasedPinTriple_of_rightCountRow S hx hp hm hs hl hr hsum
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  obtain ⟨F, hF, _hrow⟩ :=
    exists_faithfulCarrierPattern_with_erasedPinClass L hK4 hxA hpA htriple
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  have hdeletedPos : 0 < (row (patternCode L F) 0 ∩ intS).card := by
    have htwo :=
      Census554.CapSelectedFiniteCode.row_zero_two_intS_slots hinc.1
    omega
  obtain ⟨deleted, hdeleted⟩ := Finset.card_pos.mp hdeletedPos
  have hdeletedRow : deleted ∈ row (patternCode L F) 0 :=
    (Finset.mem_inter.mp hdeleted).1
  have hdeletedIntS : deleted ∈ intS :=
    (Finset.mem_inter.mp hdeleted).2
  obtain ⟨H, hblocker, hseed, hexact⟩ :=
    exists_erasedBlocker_of_minimal S L hne hconv hK4 hMin F hpA hF
  rcases prescribedErasedPinRow_rightBucketCounts L F hpA hF htriple with
    ⟨hM, hSame, hLeft, hRight⟩
  exact ⟨{
    L := L
    F := F
    H := H
    deleted := deleted
    incidence := hinc
    center_mem := labelOf_mem_intO1_of_mem_oppInterior1 L hpA hp
    pin_mem := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    pin_mem_row := labelOf_mem_prescribedErasedPinRow L F hxA hpA hF
    pin_ne_center := (labelOf_center_ne_labelOf_pin L hxA hpA htriple).symm
    moser_card := hM.trans hm
    same_card := hSame.trans hs
    left_card := hLeft.trans hl
    right_card := hRight.trans hr
    deleted_mem_intS := hdeletedIntS
    deleted_mem_row_zero := hdeletedRow
    blocker_total := hblocker
    seed_blocker := hseed
    blocker_exact := hexact }⟩

/-- Assemble the complete proof-facing left ERASE shell geometry from one
exact count row in the card-eleven branch. -/
theorem exists_leftErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²} {m s l r : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpA : p ∈ A)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex2 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) = r)
    (hsum : m + s + l + r = 4) :
    Nonempty (LeftErasedShellGeometry S x p m s l r) := by
  classical
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  have htriple :=
    erasedPinTriple_of_leftCountRow S hx hp hm hs hl hr hsum
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  obtain ⟨F, hF, _hrow⟩ :=
    exists_faithfulCarrierPattern_with_erasedPinClass L hK4 hxA hpA htriple
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  have hdeletedPos : 0 < (row (patternCode L F) 0 ∩ intS).card := by
    have htwo :=
      Census554.CapSelectedFiniteCode.row_zero_two_intS_slots hinc.1
    omega
  obtain ⟨deleted, hdeleted⟩ := Finset.card_pos.mp hdeletedPos
  have hdeletedRow : deleted ∈ row (patternCode L F) 0 :=
    (Finset.mem_inter.mp hdeleted).1
  have hdeletedIntS : deleted ∈ intS :=
    (Finset.mem_inter.mp hdeleted).2
  obtain ⟨H, hblocker, hseed, hexact⟩ :=
    exists_erasedBlocker_of_minimal S L hne hconv hK4 hMin F hpA hF
  rcases prescribedErasedPinRow_leftBucketCounts L F hpA hF htriple with
    ⟨hM, hSame, hLeft, hRight⟩
  exact ⟨{
    L := L
    F := F
    H := H
    deleted := deleted
    incidence := hinc
    center_mem := labelOf_mem_intO2_of_mem_oppInterior2 L hpA hp
    pin_mem := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    pin_mem_row := labelOf_mem_prescribedErasedPinRow L F hxA hpA hF
    pin_ne_center := (labelOf_center_ne_labelOf_pin L hxA hpA htriple).symm
    moser_card := hM.trans hm
    same_card := hSame.trans hs
    left_card := hLeft.trans hl
    right_card := hRight.trans hr
    deleted_mem_intS := hdeletedIntS
    deleted_mem_row_zero := hdeletedRow
    blocker_total := hblocker
    seed_blocker := hseed
    blocker_exact := hexact }⟩

/-- Proof-facing geometry package for a P4 ERASE seed row. -/
structure ErasedP4ShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x p : ℝ²)
    (centerBucket : Finset Label) where
  L : CanonicalLabeling S
  F : FaithfulCarrierPattern A
  H : CriticalShellSystem A
  deleted : Label
  incidence : IncidenceOK (patternCode L F)
  center_mem : L.labelOf p ∈ centerBucket
  pin_mem : L.labelOf x ∈ intS
  pin_mem_row : L.labelOf x ∈ row (patternCode L F) (L.labelOf p)
  pin_ne_center : L.labelOf x ≠ L.labelOf p
  deleted_mem_intS : deleted ∈ intS
  deleted_mem_row_zero : deleted ∈ row (patternCode L F) 0
  blocker_total : ∀ q,
    erasedBlocker H L F (L.labelOf p) q ≠ q ∧
      q ∈ row (patternCode L F) (erasedBlocker H L F (L.labelOf p) q)
  seed_blocker : ∀ q, q ∈ row (patternCode L F) (L.labelOf p) →
    erasedBlocker H L F (L.labelOf p) q = L.labelOf p
  blocker_exact : ∀ q, ExactAt (rowPattern (patternCode L F)) L.pointOf
    (erasedBlocker H L F (L.labelOf p) q)

/-- P4-U geometry retaining the containment facts used by the specialized
finite classifier. -/
structure P4UContainmentErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x : ℝ²)
    extends ErasedP4ShellGeometry S x
      (S.oppositeVertexByIndex S.surplusIdx) {0} where
  first_opp_row : row (patternCode L F) 1 = capO1
  second_opp_row : row (patternCode L F) 2 = capO2
  moser_pair : 1 ∈ row (patternCode L F) 0 ↔
    2 ∈ row (patternCode L F) 0

/-- Assemble the surplus-opposite P4-U geometry.  The prescribed center is
canonical label `0`, so the pin itself supplies the deleted row-0 label. -/
theorem exists_p4uErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (htriple : ErasedPinTriple A x
      (S.oppositeVertexByIndex S.surplusIdx)) :
    Nonempty (ErasedP4ShellGeometry S x
      (S.oppositeVertexByIndex S.surplusIdx) {0}) := by
  classical
  let p := S.oppositeVertexByIndex S.surplusIdx
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  have hpA : p ∈ A := S.oppositeVertexByIndex_mem S.surplusIdx
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  obtain ⟨F, hF, _hrow⟩ :=
    exists_faithfulCarrierPattern_with_erasedPinClass L hK4 hxA hpA htriple
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  have hcenter : L.labelOf p = 0 := by
    rw [show p = L.pointOf 0 by exact L.point_zero_eq_opposite.symm,
      L.labelOf_pointOf]
  have hpinRow : L.labelOf x ∈ row (patternCode L F) (L.labelOf p) :=
    labelOf_mem_prescribedErasedPinRow L F hxA hpA hF
  have hpinRowZero : L.labelOf x ∈ row (patternCode L F) 0 := by
    simpa [hcenter] using hpinRow
  obtain ⟨H, hblocker, hseed, hexact⟩ :=
    exists_erasedBlocker_of_minimal S L hne hconv hK4 hMin F hpA hF
  exact ⟨{
    L := L
    F := F
    H := H
    deleted := L.labelOf x
    incidence := hinc
    center_mem := by
      rw [Finset.mem_singleton]
      simpa [p] using hcenter
    pin_mem := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    pin_mem_row := hpinRow
    pin_ne_center :=
      (labelOf_center_ne_labelOf_pin L hxA hpA htriple).symm
    deleted_mem_intS := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    deleted_mem_row_zero := hpinRowZero
    blocker_total := hblocker
    seed_blocker := hseed
    blocker_exact := hexact }⟩

/-- Assemble the containment-specialized P4-U package consumed by the
three-row native classifier. -/
theorem exists_p4uContainmentErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (htriple : ErasedPinTriple A x
      (S.oppositeVertexByIndex S.surplusIdx)) :
    Nonempty (P4UContainmentErasedShellGeometry S x) := by
  classical
  let p := S.oppositeVertexByIndex S.surplusIdx
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  have hpA : p ∈ A := S.oppositeVertexByIndex_mem S.surplusIdx
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  obtain ⟨F, hF, hrow₀, hrow₁, hrow₂⟩ :=
    exists_faithfulCarrierPattern_with_p4uClasses L hK4 hM44 hcontain
      hxA htriple
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  have hcenter : L.labelOf p = 0 := by
    rw [show p = L.pointOf 0 by exact L.point_zero_eq_opposite.symm,
      L.labelOf_pointOf]
  have hpinRow : L.labelOf x ∈ row (patternCode L F) (L.labelOf p) :=
    labelOf_mem_prescribedErasedPinRow L F hxA hpA hF
  have hpinRowZero : L.labelOf x ∈ row (patternCode L F) 0 := by
    simpa [hcenter] using hpinRow
  have hpair : 1 ∈ row (patternCode L F) 0 ↔
      2 ∈ row (patternCode L F) 0 :=
    p4uRow_moserPair_of_nonSurplusMoserCapContainment
      L F hK4 hM44 hcontain hrow₀
  obtain ⟨H, hblocker, hseed, hexact⟩ :=
    exists_erasedBlocker_of_minimal S L hne hconv hK4 hMin F hpA hF
  exact ⟨{
    L := L
    F := F
    H := H
    deleted := L.labelOf x
    incidence := hinc
    center_mem := by
      rw [Finset.mem_singleton]
      simpa [p] using hcenter
    pin_mem := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    pin_mem_row := hpinRow
    pin_ne_center :=
      (labelOf_center_ne_labelOf_pin L hxA hpA htriple).symm
    deleted_mem_intS := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    deleted_mem_row_zero := hpinRowZero
    blocker_total := hblocker
    seed_blocker := hseed
    blocker_exact := hexact
    first_opp_row := hrow₁
    second_opp_row := hrow₂
    moser_pair := hpair }⟩

/-- Assemble the surplus-interior P4-S geometry. -/
theorem exists_p4sErasedShellGeometry
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.surplusIdx) (hpA : p ∈ A)
    (htriple : ErasedPinTriple A x p) :
    Nonempty (ErasedP4ShellGeometry S x p intS) := by
  classical
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  obtain ⟨B⟩ :=
    Census554.CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hcard6
  obtain ⟨L⟩ := B.nonempty_canonicalLabeling
  obtain ⟨F, hF, _hrow⟩ :=
    exists_faithfulCarrierPattern_with_erasedPinClass L hK4 hxA hpA htriple
  have hinc : IncidenceOK (patternCode L F) :=
    incidenceOK_patternCode L F hconv hM44 hcard6
  have hdeletedPos : 0 < (row (patternCode L F) 0 ∩ intS).card := by
    have htwo :=
      Census554.CapSelectedFiniteCode.row_zero_two_intS_slots hinc.1
    omega
  obtain ⟨deleted, hdeleted⟩ := Finset.card_pos.mp hdeletedPos
  obtain ⟨H, hblocker, hseed, hexact⟩ :=
    exists_erasedBlocker_of_minimal S L hne hconv hK4 hMin F hpA hF
  exact ⟨{
    L := L
    F := F
    H := H
    deleted := deleted
    incidence := hinc
    center_mem := labelOf_mem_intS_of_mem_surplusInterior L hpA hp
    pin_mem := labelOf_mem_intS_of_mem_surplusInterior L hxA hx
    pin_mem_row := labelOf_mem_prescribedErasedPinRow L F hxA hpA hF
    pin_ne_center :=
      (labelOf_center_ne_labelOf_pin L hxA hpA htriple).symm
    deleted_mem_intS := (Finset.mem_inter.mp hdeleted).2
    deleted_mem_row_zero := (Finset.mem_inter.mp hdeleted).1
    blocker_total := hblocker
    seed_blocker := hseed
    blocker_exact := hexact }⟩

end ErasedCertificate

end Problem97
