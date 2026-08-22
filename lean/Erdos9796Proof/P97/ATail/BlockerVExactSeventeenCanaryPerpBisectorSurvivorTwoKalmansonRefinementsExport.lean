/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements

/-! Direct DIMACS exporter for the 68-clause survivor two-Kalmanson successor. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements

def rootDimacsString : String :=
  let dimacs := canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf.map fun clause ↦
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause ↦ String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath rootDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsExport
end Problem97

open Problem97

def main (args : List String) : IO UInt32 :=
  ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsExport.run args
