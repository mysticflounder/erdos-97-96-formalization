import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.OccurrenceCore
import Erdos9796Proof.P97.Census554.CoverCnf

open Std.Sat

namespace Problem97.ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf

structure TestConvexFiveOccurrence where
  selector : Fin 144
  start : Label
  xOffset : Label
  bOffset : Label
  cOffset : Label
  yOffset : Label
deriving DecidableEq, Inhabited

private def oldOccurrences : List TestConvexFiveOccurrence :=
  (List.range 144).flatMap fun selector =>
    (List.range 11).flatMap fun start =>
      (combos 4 (List.range 10)).map fun positions =>
        ⟨Fin.ofNat 144 selector, toLabel start,
          toLabel (positions.getD 0 0 + 1),
          toLabel (positions.getD 1 0 + 1),
          toLabel (positions.getD 2 0 + 1),
          toLabel (positions.getD 3 0 + 1)⟩

private def comboTable : Array (List Nat) :=
  (combos 4 (List.range 10)).toArray

private def fastOccurrenceAt (index : Fin 332640) : TestConvexFiveOccurrence :=
  let selector := index.val / 2310
  let localIndex := index.val % 2310
  let start := localIndex / 210
  let comboIndex := localIndex % 210
  let positions := comboTable[comboIndex]'(by
    have hsize : comboTable.size = 210 := by native_decide
    rw [hsize]
    exact Nat.mod_lt _ (by decide))
  ⟨Fin.ofNat 144 selector, toLabel start,
    toLabel (positions.getD 0 0 + 1),
    toLabel (positions.getD 1 0 + 1),
    toLabel (positions.getD 2 0 + 1),
    toLabel (positions.getD 3 0 + 1)⟩

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem bench_fast_occurrence_matches_old :
    fastOccurrenceAt ⟨123, by omega⟩ = oldOccurrences.getD 123 default := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem bench_old_occurrences_length : oldOccurrences.length = 332640 := by
  native_decide

end Problem97.ExactFiveCommonShellV7
