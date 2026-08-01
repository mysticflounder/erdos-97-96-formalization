/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V7TwoCenterBisectorSliceLedger

/-!
# Complete semantic bank for the exact-eleven G3 checkpoint

The parsed checkpoint contains `273017` clauses.  The authenticated ledgers
partition that list into twenty-one consecutive segments.  Each segment has
already been proved semantically valid for the geometric G3 valuation; this
module joins those banks and invokes the compact RUP replay.
-/

open Std.Sat

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.CompactIngress
open CheckpointedRup.CompactBoundary

private theorem all_drop_of_segment_of_tail
    {α : Type} (xs : List α) (p : α → Prop) (start count : Nat)
    (hsegment : ∀ x ∈ (xs.drop start).take count, p x)
    (htail : ∀ x ∈ xs.drop (start + count), p x) :
    ∀ x ∈ xs.drop start, p x := by
  intro x hx
  rw [← List.take_append_drop count (xs.drop start)] at hx
  rcases List.mem_append.mp hx with hx | hx
  · exact hsegment x hx
  · apply htail x
    simpa [List.drop_drop] using hx

private theorem all_drop_of_final_segment
    {α : Type} (xs : List α) (p : α → Prop) (start count : Nat)
    (hlen : xs.length = start + count)
    (hsegment : ∀ x ∈ (xs.drop start).take count, p x) :
    ∀ x ∈ xs.drop start, p x := by
  have htake : (xs.drop start).take count = xs.drop start := by
    apply (List.take_eq_self_iff (xs.drop start)).mpr
    simp [List.length_drop, hlen]
  simpa [htake] using hsegment

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- The exact parsed checkpoint-zero formula has the size covered by the
twenty-one authenticated retained-clause ledgers. -/
theorem g3Checkpoint0_signedClause_count :
    (signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).length =
      273017 := by
  native_decide

/-- Every clause of the exact parsed G3 checkpoint is semantically satisfied
by the full-radius valuation under the hypotheses used by the family banks. -/
theorem CanonicalPacket.g3Checkpoint0_all_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈
        signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text),
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let sat :=
    fun clause => evalClauseD
      (P.fullRadiusValuation shadow selected) clause = true
  have h0 : ∀ clause ∈ (xs.drop 0).take 108705, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_baseSlice_signed_sat hP shadow selected
  have h1 : ∀ clause ∈ (xs.drop 108705).take 45581, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_separationSlice_signed_sat hP shadow selected
  have h2 : ∀ clause ∈ (xs.drop 154286).take 5247, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_sourceTailSlice_signed_sat
        hP shadow selected hShellCase hApexChoice hsix hseven
  have h3 : ∀ clause ∈ (xs.drop 159533).take 341, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_localTransitivitySlice_signed_sat shadow selected
  have h4 : ∀ clause ∈ (xs.drop 159874).take 8619, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_selectedLocalEqSlice_signed_sat hP shadow selected
  have h5 : ∀ clause ∈ (xs.drop 168493).take 317, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_sourceCenterSlice_signed_sat hP shadow selected
  have h6 : ∀ clause ∈ (xs.drop 168810).take 21, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_usedCenterSlice_signed_sat
        shadow selected hsix hseven
  have h7 : ∀ clause ∈ (xs.drop 168831).take 5083, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_exactBlockerSlice_signed_sat hP shadow selected
  have h8 : ∀ clause ∈ (xs.drop 173914).take 426, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_noQFreeSlice_signed_sat shadow selected
  have h9 : ∀ clause ∈ (xs.drop 174340).take 89, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_firstApexExactFiveSlice_signed_sat
        shadow selected hShellCase
  have h10 : ∀ clause ∈ (xs.drop 174429).take 10721, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_globalTransitivitySlice_signed_sat shadow selected
  have h11 : ∀ clause ∈ (xs.drop 185150).take 8199, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_selectedGlobalEqSlice_signed_sat hP shadow selected
  have h12 : ∀ clause ∈ (xs.drop 193349).take 22, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_firstApexGlobalEqSlice_signed_sat
        shadow selected hShellCase
  have h13 : ∀ clause ∈ (xs.drop 193371).take 714, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_duplicateCenterSlice_signed_sat shadow selected
  have h14 : ∀ clause ∈ (xs.drop 194085).take 1293, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_perpendicularBisectorSlice_signed_sat shadow selected
  have h15 : ∀ clause ∈ (xs.drop 195378).take 8397, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_convexFiveSlice_signed_sat shadow selected
  have h16 : ∀ clause ∈ (xs.drop 203775).take 3024, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_v6LocalFourSlice_signed_sat shadow selected
  have h17 : ∀ clause ∈ (xs.drop 206799).take 13214, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_v6QDeletedPairSlice_signed_sat shadow selected
  have h18 : ∀ clause ∈ (xs.drop 220013).take 275, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_v6U5NontripleSlice_signed_sat hP shadow selected
  have h19 : ∀ clause ∈ (xs.drop 220288).take 36, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_v6U5CommonBisectorSlice_signed_sat hP shadow selected
  have h20 : ∀ clause ∈ (xs.drop 220324).take 52693, sat clause := by
    simpa [xs, sat] using
      P.g3Checkpoint0_twoCenterBisectorSlice_signed_sat
        hcard shadow selected
  have hlen : xs.length = 220324 + 52693 := by
    simpa [xs] using g3Checkpoint0_signedClause_count
  have tail20 : ∀ clause ∈ xs.drop 220324, sat clause :=
    all_drop_of_final_segment xs sat 220324 52693 hlen h20
  have tail19 : ∀ clause ∈ xs.drop 220288, sat clause :=
    all_drop_of_segment_of_tail xs sat 220288 36 h19 tail20
  have tail18 : ∀ clause ∈ xs.drop 220013, sat clause :=
    all_drop_of_segment_of_tail xs sat 220013 275 h18 tail19
  have tail17 : ∀ clause ∈ xs.drop 206799, sat clause :=
    all_drop_of_segment_of_tail xs sat 206799 13214 h17 tail18
  have tail16 : ∀ clause ∈ xs.drop 203775, sat clause :=
    all_drop_of_segment_of_tail xs sat 203775 3024 h16 tail17
  have tail15 : ∀ clause ∈ xs.drop 195378, sat clause :=
    all_drop_of_segment_of_tail xs sat 195378 8397 h15 tail16
  have tail14 : ∀ clause ∈ xs.drop 194085, sat clause :=
    all_drop_of_segment_of_tail xs sat 194085 1293 h14 tail15
  have tail13 : ∀ clause ∈ xs.drop 193371, sat clause :=
    all_drop_of_segment_of_tail xs sat 193371 714 h13 tail14
  have tail12 : ∀ clause ∈ xs.drop 193349, sat clause :=
    all_drop_of_segment_of_tail xs sat 193349 22 h12 tail13
  have tail11 : ∀ clause ∈ xs.drop 185150, sat clause :=
    all_drop_of_segment_of_tail xs sat 185150 8199 h11 tail12
  have tail10 : ∀ clause ∈ xs.drop 174429, sat clause :=
    all_drop_of_segment_of_tail xs sat 174429 10721 h10 tail11
  have tail9 : ∀ clause ∈ xs.drop 174340, sat clause :=
    all_drop_of_segment_of_tail xs sat 174340 89 h9 tail10
  have tail8 : ∀ clause ∈ xs.drop 173914, sat clause :=
    all_drop_of_segment_of_tail xs sat 173914 426 h8 tail9
  have tail7 : ∀ clause ∈ xs.drop 168831, sat clause :=
    all_drop_of_segment_of_tail xs sat 168831 5083 h7 tail8
  have tail6 : ∀ clause ∈ xs.drop 168810, sat clause :=
    all_drop_of_segment_of_tail xs sat 168810 21 h6 tail7
  have tail5 : ∀ clause ∈ xs.drop 168493, sat clause :=
    all_drop_of_segment_of_tail xs sat 168493 317 h5 tail6
  have tail4 : ∀ clause ∈ xs.drop 159874, sat clause :=
    all_drop_of_segment_of_tail xs sat 159874 8619 h4 tail5
  have tail3 : ∀ clause ∈ xs.drop 159533, sat clause :=
    all_drop_of_segment_of_tail xs sat 159533 341 h3 tail4
  have tail2 : ∀ clause ∈ xs.drop 154286, sat clause :=
    all_drop_of_segment_of_tail xs sat 154286 5247 h2 tail3
  have tail1 : ∀ clause ∈ xs.drop 108705, sat clause :=
    all_drop_of_segment_of_tail xs sat 108705 45581 h1 tail2
  have tail0 : ∀ clause ∈ xs.drop 0, sat clause :=
    all_drop_of_segment_of_tail xs sat 0 108705 h0 tail1
  simpa [xs, sat] using tail0

/-- The complete authenticated G3 clause bank contradicts the exact compact
checkpoint replay. -/
theorem CanonicalPacket.false_of_g3Checkpoint0_clause_bank
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) : False := by
  apply false_of_g3Checkpoint0_evalClauseD_sat
    (P.fullRadiusValuation shadow selected)
  intro clause hclause
  apply P.g3Checkpoint0_all_signed_sat
    hP hcard shadow selected hShellCase hApexChoice hsix hseven
  exact List.mem_map_of_mem hclause

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3Checkpoint0_signedClause_count
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_all_signed_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.false_of_g3Checkpoint0_clause_bank
