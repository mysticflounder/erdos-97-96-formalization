/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CegarCore

/-!
# Authenticated compact literals for six residual p4 CEGAR occurrences

The constants below were transcribed from
`p4-seed0-compact-occurrences.jsonl`.  Their compact formula is the 19,048
clause DIMACS file whose SHA-256 is recorded here.  `CegarFamilies` checks
that each stored clause contains the exact compact literal image of its
source p4 occurrence.
-/

namespace Problem97
namespace P4Cegar6OccurrenceBridgeScratch

def compactFormulaSha256 : String :=
  "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae"

def compactFormulaClauseCount : Nat := 19048

def compactFormulaVariableCount : Nat := 2557

def cegarEntries : List CegarEntry :=
  [ ⟨.reflected48600, [-92, -96, -81, -66, -98, -67, -82, -89, -61]⟩
  , ⟨.reflected48601, [-106, -67, -61, -90, -108, -81, -102, -66, -82]⟩
  , ⟨.reflected48602, [-106, -66, -91, -92, -108, -67, -100, -102, -61]⟩
  , ⟨.reflected48603, [-92, -66, -100, -68, -109, -91, -106, -102, -61]⟩
  , ⟨.forward48604, [-20, -33, -40, -35, -19, -11, -9, -2, -5]⟩
  , ⟨.forward48605, [-44, -30, -45, -29, -50, -21, -9, -3, -5]⟩ ]

theorem cegarEntries_length : cegarEntries.length = 6 := by decide

theorem cegarEntries_wf : cegarEntries.all entryWF = true := by decide

theorem cegarEntries_compactIndices :
    (cegarEntries.map fun entry => slotCompactClause entry.slot) =
      [19043, 19044, 19045, 19046, 19047, 19048] := by decide

theorem cegarEntries_sourceIndices :
    (cegarEntries.map fun entry => slotSourceCore entry.slot) =
      [48600, 48601, 48602, 48603, 48604, 48605] := by decide

theorem cegarEntries_terminalIndices :
    (cegarEntries.map fun entry => slotTerminalClause entry.slot) =
      [2765382, 2765384, 2765386, 2765388, 2765395, 2765401] := by decide

end P4Cegar6OccurrenceBridgeScratch
end Problem97
