import Erdos9796Proof.P97.U3ToU5MixedExtraction

namespace Problem97.U3MixedFiniteExtraction

open Problem97 U5AuditLabel

def maskSupport (m : Fin 256) : Finset U5AuditLabel :=
  labels.toFinset.filter (fun x => has m.val x)

set_option maxRecDepth 100000 in
theorem labelMask_lt_256 (L : Finset U5AuditLabel) : labelMask L < 256 := by
  decide +revert

def supportMask (L : Finset U5AuditLabel) : Fin 256 :=
  ⟨labelMask L, labelMask_lt_256 L⟩

set_option maxRecDepth 100000 in
theorem maskSupport_supportMask (L : Finset U5AuditLabel) :
    maskSupport (supportMask L) = L := by
  decide +revert

def allMasks : List (Fin 256) := List.finRange 256

def shellMasks (center : U5AuditLabel) : List (Fin 256) :=
  allMasks.filter fun m =>
    let B := maskSupport m
    decide (B.card = 4) && decide (q ∈ B) && decide (center ∉ B) &&
      decide ((B ∩ dangerousCircleLabels).card ≤ 2)

def overlapBool (B C : Finset U5AuditLabel) : Bool :=
  decide ((B ∩ C).card ≤ 2)

def shellPatternOK
    (Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset U5AuditLabel) : Bool :=
  decide ((Bt1 ∩ Bt2).card ≤ 2) &&
  decide ((Bt1 ∩ Bt3).card ≤ 2) &&
  decide ((Bt1 ∩ Bu).card ≤ 2) &&
  decide ((Bt1 ∩ Ba0).card ≤ 2) &&
  decide ((Bt1 ∩ Ba1).card ≤ 2) &&
  decide ((Bt2 ∩ Bt3).card ≤ 2) &&
  decide ((Bt2 ∩ Bu).card ≤ 2) &&
  decide ((Bt2 ∩ Ba0).card ≤ 2) &&
  decide ((Bt2 ∩ Ba1).card ≤ 2) &&
  decide ((Bt3 ∩ Bu).card ≤ 2) &&
  decide ((Bt3 ∩ Ba0).card ≤ 2) &&
  decide ((Bt3 ∩ Ba1).card ≤ 2) &&
  decide ((Bu ∩ Ba0).card ≤ 2) &&
  decide ((Bu ∩ Ba1).card ≤ 2) &&
  decide ((Ba0 ∩ Ba1).card ≤ 2) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Bt3) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Bu) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt3 ∧ p ∈ Bu) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt3 ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt3 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bu ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bu ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Ba0 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bt3 ∧ p ∈ Bu) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bt3 ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bt3 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bu ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bu ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Ba0 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt3 ∧ p ∈ Bu ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt3 ∧ p ∈ Bu ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt3 ∧ p ∈ Ba0 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bu ∧ p ∈ Ba0 ∧ p ∈ Ba1)

def shellPatternExists : Bool :=
  (shellMasks t1).any fun mt1 =>
    (shellMasks t2).any fun mt2 =>
      (shellMasks t3).any fun mt3 =>
        (shellMasks u).any fun mu =>
          (shellMasks a0).any fun ma0 =>
            (shellMasks a1).any fun ma1 =>
              shellPatternOK (maskSupport mt1) (maskSupport mt2)
                (maskSupport mt3) (maskSupport mu) (maskSupport ma0)
                (maskSupport ma1)

set_option maxHeartbeats 10000000 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem shellPatternExists_false : shellPatternExists = false := by
  native_decide

def ct1 : MixedCenter := ⟨t1, by simp [centers]⟩
def ct2 : MixedCenter := ⟨t2, by simp [centers]⟩
def ct3 : MixedCenter := ⟨t3, by simp [centers]⟩
def cu : MixedCenter := ⟨u, by simp [centers]⟩
def ca0 : MixedCenter := ⟨a0, by simp [centers]⟩
def ca1 : MixedCenter := ⟨a1, by simp [centers]⟩

set_option maxRecDepth 100000 in
theorem exists_qDeleted_mode_of_mixedSixRowPatternWithDangerousCircle
    (P : MixedSixRowPatternWithDangerousCircle)
    (hall : ∀ c : MixedCenter, (P.row c).mode = .criticalFourShell) :
    ∃ c : MixedCenter, (P.row c).mode = .qDeleted := by
  have d12 : ct1 ≠ ct2 := by decide
  have d13 : ct1 ≠ ct3 := by decide
  have d1u : ct1 ≠ cu := by decide
  have d1a0 : ct1 ≠ ca0 := by decide
  have d1a1 : ct1 ≠ ca1 := by decide
  have d23 : ct2 ≠ ct3 := by decide
  have d2u : ct2 ≠ cu := by decide
  have d2a0 : ct2 ≠ ca0 := by decide
  have d2a1 : ct2 ≠ ca1 := by decide
  have d3u : ct3 ≠ cu := by decide
  have d3a0 : ct3 ≠ ca0 := by decide
  have d3a1 : ct3 ≠ ca1 := by decide
  have du0 : cu ≠ ca0 := by decide
  have du1 : cu ≠ ca1 := by decide
  have d01 : ca0 ≠ ca1 := by decide
  have hq1 : q ∈ (P.row ct1).support := by
    by_contra hq
    have h := (P.row ct1).q_not_mem_iff.mp hq
    rw [hall ct1] at h
    cases h
  have hq2 : q ∈ (P.row ct2).support := by
    by_contra hq
    have h := (P.row ct2).q_not_mem_iff.mp hq
    rw [hall ct2] at h
    cases h
  have hq3 : q ∈ (P.row ct3).support := by
    by_contra hq
    have h := (P.row ct3).q_not_mem_iff.mp hq
    rw [hall ct3] at h
    cases h
  have hqu : q ∈ (P.row cu).support := by
    by_contra hq
    have h := (P.row cu).q_not_mem_iff.mp hq
    rw [hall cu] at h
    cases h
  have hq0 : q ∈ (P.row ca0).support := by
    by_contra hq
    have h := (P.row ca0).q_not_mem_iff.mp hq
    rw [hall ca0] at h
    cases h
  have hq1a : q ∈ (P.row ca1).support := by
    by_contra hq
    have h := (P.row ca1).q_not_mem_iff.mp hq
    rw [hall ca1] at h
    cases h
  let B1 := (P.row ct1).support
  let B2 := (P.row ct2).support
  let B3 := (P.row ct3).support
  let Bu := (P.row cu).support
  let B0 := (P.row ca0).support
  let B1a := (P.row ca1).support
  have hcard1 : B1.card = 4 := by
    simpa [B1] using (P.row ct1).card_eq_four
  have hcard2 : B2.card = 4 := by
    simpa [B2] using (P.row ct2).card_eq_four
  have hcard3 : B3.card = 4 := by
    simpa [B3] using (P.row ct3).card_eq_four
  have hcardu : Bu.card = 4 := by
    simpa [Bu] using (P.row cu).card_eq_four
  have hcard0 : B0.card = 4 := by
    simpa [B0] using (P.row ca0).card_eq_four
  have hcard1a : B1a.card = 4 := by
    simpa [B1a] using (P.row ca1).card_eq_four
  have hq1B : q ∈ B1 := by simpa [B1] using hq1
  have hq2B : q ∈ B2 := by simpa [B2] using hq2
  have hq3B : q ∈ B3 := by simpa [B3] using hq3
  have hquB : q ∈ Bu := by simpa [Bu] using hqu
  have hq0B : q ∈ B0 := by simpa [B0] using hq0
  have hq1aB : q ∈ B1a := by simpa [B1a] using hq1a
  have hcenter1 : t1 ∉ B1 := by
    simpa [B1, ct1] using (P.row ct1).center_not_mem
  have hcenter2 : t2 ∉ B2 := by
    simpa [B2, ct2] using (P.row ct2).center_not_mem
  have hcenter3 : t3 ∉ B3 := by
    simpa [B3, ct3] using (P.row ct3).center_not_mem
  have hcenteru : u ∉ Bu := by
    simpa [Bu, cu] using (P.row cu).center_not_mem
  have hcenter0 : a0 ∉ B0 := by
    simpa [B0, ca0] using (P.row ca0).center_not_mem
  have hcenter1a : a1 ∉ B1a := by
    simpa [B1a, ca1] using (P.row ca1).center_not_mem
  have hdanger1 : (B1 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B1] using P.dangerousCircle_overlap ct1
  have hdanger2 : (B2 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B2] using P.dangerousCircle_overlap ct2
  have hdanger3 : (B3 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B3] using P.dangerousCircle_overlap ct3
  have hdangeru : (Bu ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [Bu] using P.dangerousCircle_overlap cu
  have hdanger0 : (B0 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B0] using P.dangerousCircle_overlap ca0
  have hdanger1a : (B1a ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B1a] using P.dangerousCircle_overlap ca1
  have hm1 : supportMask B1 ∈ shellMasks t1 := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [shellMasks, maskSupport_supportMask, hcard1, hq1B, hcenter1,
        hdanger1]
  have hm2 : supportMask B2 ∈ shellMasks t2 := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [shellMasks, maskSupport_supportMask, hcard2, hq2B, hcenter2,
        hdanger2]
  have hm3 : supportMask B3 ∈ shellMasks t3 := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [shellMasks, maskSupport_supportMask, hcard3, hq3B, hcenter3,
        hdanger3]
  have hmu : supportMask Bu ∈ shellMasks u := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [shellMasks, maskSupport_supportMask, hcardu, hquB, hcenteru,
        hdangeru]
  have hm0 : supportMask B0 ∈ shellMasks a0 := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [shellMasks, maskSupport_supportMask, hcard0, hq0B, hcenter0,
        hdanger0]
  have hm1a : supportMask B1a ∈ shellMasks a1 := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [shellMasks, maskSupport_supportMask, hcard1a, hq1aB, hcenter1a,
        hdanger1a]
  have hNo : ∀ (c d e : MixedCenter), c ≠ d → c ≠ e → d ≠ e →
      ¬ (p ∈ (P.row c).support ∧ p ∈ (P.row d).support ∧
        p ∈ (P.row e).support) := by
    intro c d e hcd hce hde h
    apply P.shell_p_at_most_two c d e hcd hce hde
    exact ⟨hall c, h.1, hall d, h.2.1, hall e, h.2.2⟩
  have hOK : shellPatternOK B1 B2 B3 Bu B0 B1a = true := by
    simp [shellPatternOK, B1, B2, B3, Bu, B0, B1a,
      P.overlap ct1 ct2 d12, P.overlap ct1 ct3 d13,
      P.overlap ct1 cu d1u, P.overlap ct1 ca0 d1a0,
      P.overlap ct1 ca1 d1a1, P.overlap ct2 ct3 d23,
      P.overlap ct2 cu d2u, P.overlap ct2 ca0 d2a0,
      P.overlap ct2 ca1 d2a1, P.overlap ct3 cu d3u,
      P.overlap ct3 ca0 d3a0, P.overlap ct3 ca1 d3a1,
      P.overlap cu ca0 du0, P.overlap cu ca1 du1,
      P.overlap ca0 ca1 d01,
      hNo ct1 ct2 ct3 d12 d13 d23,
      hNo ct1 ct2 cu d12 d1u d2u,
      hNo ct1 ct2 ca0 d12 d1a0 d2a0,
      hNo ct1 ct2 ca1 d12 d1a1 d2a1,
      hNo ct1 ct3 cu d13 d1u d3u,
      hNo ct1 ct3 ca0 d13 d1a0 d3a0,
      hNo ct1 ct3 ca1 d13 d1a1 d3a1,
      hNo ct1 cu ca0 d1u d1a0 du0,
      hNo ct1 cu ca1 d1u d1a1 du1,
      hNo ct1 ca0 ca1 d1a0 d1a1 d01,
      hNo ct2 ct3 cu d23 d2u d3u,
      hNo ct2 ct3 ca0 d23 d2a0 d3a0,
      hNo ct2 ct3 ca1 d23 d2a1 d3a1,
      hNo ct2 cu ca0 d2u d2a0 du0,
      hNo ct2 cu ca1 d2u d2a1 du1,
      hNo ct2 ca0 ca1 d2a0 d2a1 d01,
      hNo ct3 cu ca0 d3u d3a0 du0,
      hNo ct3 cu ca1 d3u d3a1 du1,
      hNo ct3 ca0 ca1 d3a0 d3a1 d01,
      hNo cu ca0 ca1 du0 du1 d01]
  have hex : shellPatternExists = true := by
    simp only [shellPatternExists, List.any_eq_true]
    exact ⟨supportMask B1, hm1, supportMask B2, hm2, supportMask B3, hm3,
      supportMask Bu, hmu, supportMask B0, hm0, supportMask B1a, hm1a,
      by simpa [maskSupport_supportMask] using hOK⟩
  simpa [shellPatternExists_false] using hex

end Problem97.U3MixedFiniteExtraction
