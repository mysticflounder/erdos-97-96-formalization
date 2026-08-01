import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Shard1
import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97.ExactFiveCommonShellV7

open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary
open Problem97.CheckpointedRup.SemanticBoundary
open ExactFiveCommonShellV7G3Replay

private def rawConvexSlice : List (List Int) :=
  let parsed :=
    (parseFormula (n := ExactFiveCommonShellV7G3Replay.n)
      ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text).getD #[]
  (parsed.extract (195378 + 1) (195378 + 1 + 8397)).toList.filterMap id |>.map
    signedClauseOfDefault

private def baselineConvexSlice : List (List Int) :=
  (signedClausesOfFormula
    (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
      ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop 195378 |>.take 8397

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem bench_raw_slice_length : rawConvexSlice.length = 8397 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem bench_baseline_slice_length : baselineConvexSlice.length = 8397 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem bench_raw_vs_baseline :
    List.Forall₂ List.Perm rawConvexSlice baselineConvexSlice := by
  native_decide

end Problem97.ExactFiveCommonShellV7
