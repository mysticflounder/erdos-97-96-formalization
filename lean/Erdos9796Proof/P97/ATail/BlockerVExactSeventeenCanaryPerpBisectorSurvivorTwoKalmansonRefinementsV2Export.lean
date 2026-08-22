/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2

/-! Direct DIMACS exporter for the v2 two-Kalmanson successor. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2Export

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2

def rootDimacsString : String :=
  let dimacs :=
    canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf.map fun clause =>
      clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause => String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath rootDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2Export
end Problem97

open Problem97

def main (args : List String) : IO UInt32 :=
  ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2Export.run args
