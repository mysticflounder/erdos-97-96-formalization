/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V7TwoCenterBisectorSliceLedger

/-!
# Complete semantic bank for the exact-eleven G3 checkpoint

The parsed checkpoint contains the `273017`-clause authenticated G3 core plus
the replay adapter's fresh positive padding unit `[96418]`.  The authenticated
ledgers partition the core into twenty-one consecutive segments.  This module
joins those banks, extends the geometric valuation at the fresh padding
variable, and invokes the compact RUP replay.
-/

open Std.Sat

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.CompactIngress
open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

private theorem all_take_of_adjacent_segments
    {α : Type} (xs : List α) (p : α → Prop)
    (start count tailCount : Nat)
    (hsegment : ∀ x ∈ (xs.drop start).take count, p x)
    (htail : ∀ x ∈ (xs.drop (start + count)).take tailCount, p x) :
    ∀ x ∈ (xs.drop start).take (count + tailCount), p x := by
  intro x hx
  rw [List.take_add] at hx
  rcases List.mem_append.mp hx with hx | hx
  · exact hsegment x hx
  · apply htail x
    simpa only [List.drop_drop] using hx

private theorem evalClauseD_fresh_override_eq
    (valuation : Nat → Bool) (fresh : Nat) (clause : List Int)
    (hfresh : ∀ literal ∈ clause, literal.natAbs < fresh) :
    evalClauseD (fun varIndex =>
      if varIndex = fresh then true else valuation varIndex) clause =
      evalClauseD valuation clause := by
  apply evalClauseD_congr
  intro literal hliteral
  simp [ne_of_lt (hfresh literal hliteral)]

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- The parsed checkpoint-zero formula consists of the authenticated core and
one fresh padding unit introduced by the replay adapter. -/
theorem g3Checkpoint0_signedClause_count :
    (signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).length =
      273018 := by
  native_decide

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- Dropping the authenticated core leaves exactly the replay adapter's fresh
positive padding unit. -/
theorem g3Checkpoint0_padding_tail :
    (signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop 273017 =
      [[96418]] := by
  native_decide

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- The fresh replay-padding variable does not occur in the authenticated G3
core. -/
theorem g3Checkpoint0_core_literal_lt_padding :
    ∀ clause ∈
      (signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).take 273017,
      ∀ literal ∈ clause, literal.natAbs < 96418 := by
  native_decide

private theorem CanonicalPacket.g3Checkpoint0_core_group0_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hApexChoice : P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈
        (signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).take 168493,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let sat := fun clause =>
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true
  change ∀ clause ∈ (xs.drop 0).take 168493, sat clause
  have h0 : ∀ clause ∈ (xs.drop 0).take 108705, sat clause := by
    simpa only [xs, sat, List.drop_zero] using
      P.g3Checkpoint0_baseSlice_signed_sat hP shadow selected
  have h1 : ∀ clause ∈ (xs.drop 108705).take 45581, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_separationSlice_signed_sat hP shadow selected
  have h2 : ∀ clause ∈ (xs.drop 154286).take 5247, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_sourceTailSlice_signed_sat
        hP shadow selected hShellCase hApexChoice hsix hseven
  have h3 : ∀ clause ∈ (xs.drop 159533).take 341, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_localTransitivitySlice_signed_sat shadow selected
  have h4 : ∀ clause ∈ (xs.drop 159874).take 8619, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_selectedLocalEqSlice_signed_sat hP shadow selected
  have h34 := all_take_of_adjacent_segments xs sat 159533 341 8619 h3 h4
  have h234 :=
    all_take_of_adjacent_segments xs sat 154286 5247 8960 h2 h34
  have h1234 :=
    all_take_of_adjacent_segments xs sat 108705 45581 14207 h1 h234
  simpa only using
    all_take_of_adjacent_segments xs sat 0 108705 59788 h0 h1234

private theorem CanonicalPacket.g3Checkpoint0_core_group1_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop 168493).take 5936,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let sat := fun clause =>
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true
  have h5 : ∀ clause ∈ (xs.drop 168493).take 317, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_sourceCenterSlice_signed_sat hP shadow selected
  have h6 : ∀ clause ∈ (xs.drop 168810).take 21, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_usedCenterSlice_signed_sat shadow selected hsix hseven
  have h7 : ∀ clause ∈ (xs.drop 168831).take 5083, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_exactBlockerSlice_signed_sat hP shadow selected
  have h8 : ∀ clause ∈ (xs.drop 173914).take 426, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_noQFreeSlice_signed_sat shadow selected
  have h9 : ∀ clause ∈ (xs.drop 174340).take 89, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_firstApexExactFiveSlice_signed_sat
        shadow selected hShellCase
  have h89 := all_take_of_adjacent_segments xs sat 173914 426 89 h8 h9
  have h789 := all_take_of_adjacent_segments xs sat 168831 5083 515 h7 h89
  have h6789 := all_take_of_adjacent_segments xs sat 168810 21 5598 h6 h789
  simpa only [xs, sat] using
    all_take_of_adjacent_segments xs sat 168493 317 5619 h5 h6789

private theorem CanonicalPacket.g3Checkpoint0_core_group2_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop 174429).take 20949,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let sat := fun clause =>
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true
  have h10 : ∀ clause ∈ (xs.drop 174429).take 10721, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_globalTransitivitySlice_signed_sat shadow selected
  have h11 : ∀ clause ∈ (xs.drop 185150).take 8199, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_selectedGlobalEqSlice_signed_sat hP shadow selected
  have h12 : ∀ clause ∈ (xs.drop 193349).take 22, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_firstApexGlobalEqSlice_signed_sat
        shadow selected hShellCase
  have h13 : ∀ clause ∈ (xs.drop 193371).take 714, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_duplicateCenterSlice_signed_sat shadow selected
  have h14 : ∀ clause ∈ (xs.drop 194085).take 1293, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_perpendicularBisectorSlice_signed_sat shadow selected
  have h1314 := all_take_of_adjacent_segments xs sat 193371 714 1293 h13 h14
  have h121314 := all_take_of_adjacent_segments xs sat 193349 22 2007 h12 h1314
  have h11121314 :=
    all_take_of_adjacent_segments xs sat 185150 8199 2029 h11 h121314
  simpa only [xs, sat] using
    all_take_of_adjacent_segments xs sat 174429 10721 10228 h10 h11121314

private theorem CanonicalPacket.g3Checkpoint0_core_group3_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop 195378).take 77639,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let sat := fun clause =>
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true
  have h15 : ∀ clause ∈ (xs.drop 195378).take 8397, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_convexFiveSlice_signed_sat shadow selected
  have h16 : ∀ clause ∈ (xs.drop 203775).take 3024, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_v6LocalFourSlice_signed_sat shadow selected
  have h17 : ∀ clause ∈ (xs.drop 206799).take 13214, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_v6QDeletedPairSlice_signed_sat shadow selected
  have h18 : ∀ clause ∈ (xs.drop 220013).take 275, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_v6U5NontripleSlice_signed_sat hP shadow selected
  have h19 : ∀ clause ∈ (xs.drop 220288).take 36, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_v6U5CommonBisectorSlice_signed_sat hP shadow selected
  have h20 : ∀ clause ∈ (xs.drop 220324).take 52693, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_twoCenterBisectorSlice_signed_sat hcard shadow selected
  have h1920 := all_take_of_adjacent_segments xs sat 220288 36 52693 h19 h20
  have h181920 :=
    all_take_of_adjacent_segments xs sat 220013 275 52729 h18 h1920
  have h17181920 :=
    all_take_of_adjacent_segments xs sat 206799 13214 53004 h17 h181920
  have h1617181920 :=
    all_take_of_adjacent_segments xs sat 203775 3024 66218 h16 h17181920
  simpa only [xs, sat] using
    all_take_of_adjacent_segments xs sat 195378 8397 69242 h15 h1617181920

/-- Every clause of the authenticated, unpadded G3 core is semantically
satisfied by the full-radius valuation under the family-bank hypotheses. -/
theorem CanonicalPacket.g3Checkpoint0_core_all_signed_sat
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
        (signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).take 273017,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let sat := fun clause =>
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true
  have h0 : ∀ clause ∈ (xs.drop 0).take 168493, sat clause := by
    simpa only [xs, sat, List.drop_zero] using
      P.g3Checkpoint0_core_group0_signed_sat
        hP shadow selected hShellCase hApexChoice hsix hseven
  have h1 : ∀ clause ∈ (xs.drop 168493).take 5936, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_core_group1_signed_sat
        hP shadow selected hShellCase hsix hseven
  have h2 : ∀ clause ∈ (xs.drop 174429).take 20949, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_core_group2_signed_sat hP shadow selected hShellCase
  have h3 : ∀ clause ∈ (xs.drop 195378).take 77639, sat clause := by
    simpa only [xs, sat] using
      P.g3Checkpoint0_core_group3_signed_sat hP hcard shadow selected
  have h12 := all_take_of_adjacent_segments xs sat 168493 5936 20949 h1 h2
  have h123 :=
    all_take_of_adjacent_segments xs sat 168493 26885 77639 h12 h3
  simpa only [xs, sat, List.drop_zero] using
    all_take_of_adjacent_segments xs sat 0 168493 104524 h0 h123

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
  let xs :=
    signedClausesOfFormula
      (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)
  let paddedValuation : Nat → Bool := fun varIndex =>
    if varIndex = 96418 then true
    else P.fullRadiusValuation shadow selected varIndex
  apply false_of_g3Checkpoint0_evalClauseD_sat paddedValuation
  intro clause hclause
  have hsigned : signedClauseOfDefault clause ∈ xs := by
    exact List.mem_map_of_mem hclause
  rw [← List.take_append_drop 273017 xs] at hsigned
  rcases List.mem_append.mp hsigned with hcore | hpadding
  · have hsat := P.g3Checkpoint0_core_all_signed_sat
      hP hcard shadow selected hShellCase hApexChoice hsix hseven
      (signedClauseOfDefault clause) (by simpa [xs] using hcore)
    calc
      evalClauseD paddedValuation (signedClauseOfDefault clause) =
          evalClauseD (P.fullRadiusValuation shadow selected)
            (signedClauseOfDefault clause) := by
        have hlt := g3Checkpoint0_core_literal_lt_padding
          (signedClauseOfDefault clause) (by simpa [xs] using hcore)
        simpa only [paddedValuation] using
          evalClauseD_fresh_override_eq
            (P.fullRadiusValuation shadow selected) 96418
            (signedClauseOfDefault clause) hlt
      _ = true := hsat
  · have htail : xs.drop 273017 = [[96418]] := by
      simpa [xs] using g3Checkpoint0_padding_tail
    rw [htail] at hpadding
    simp only [List.mem_singleton] at hpadding
    rw [hpadding]
    simp [paddedValuation, evalClauseD, evalLitD]

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3Checkpoint0_signedClause_count
#print axioms Problem97.ExactFiveCommonShellV7.g3Checkpoint0_padding_tail
#print axioms Problem97.ExactFiveCommonShellV7.g3Checkpoint0_core_literal_lt_padding
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_core_all_signed_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.false_of_g3Checkpoint0_clause_bank
