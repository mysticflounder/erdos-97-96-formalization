/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite incidence and cap-placement countermodel for the terminal residual

This exact finite model includes the aligned dangerous-row shape, the terminal
`1 + 1 + deleted` decomposition, the ambient five-point off-surplus marginal,
and the opposite-cap one-hit profile.  Its two terminal row hits remain
distinct.

It is deliberately not a Euclidean `CounterexampleData`, MEC packet, or total
critical-shell system.  It isolates the fact that the currently exported
incidence/cardinality/cap-placement fields do not force the missing metric
equality.
-/

namespace Problem97
namespace ATailRTerminalCapRowGeometryScratch

/-- The aligned row and exact cap-count fields admit distinct terminal row hits. -/
theorem aligned_terminal_cap_row_fields_allow_distinct_hits :
    let q : Fin 16 := 0
    let surplusPoint : Fin 16 := 1
    let deleted : Fin 16 := 2
    let sourceHit : Fin 16 := 3
    let secondHit : Fin 16 := 4
    let source : Fin 16 := 5
    let thirdDangerous : Fin 16 := 6
    let mate : Fin 16 := 7
    let terminalClass : Finset (Fin 16) :=
      {surplusPoint, deleted, sourceHit, secondHit}
    let ambientClass : Finset (Fin 16) :=
      {surplusPoint, deleted, sourceHit, secondHit, source, mate}
    let surplusCap : Finset (Fin 16) := {q, surplusPoint, 11, 12, 13}
    let oppCap1 : Finset (Fin 16) := {q, deleted, sourceHit, source, mate}
    let oppCap2 : Finset (Fin 16) := {secondHit, 8, 14, 15}
    let strictOppCap1 := oppCap1 \ (surplusCap ∪ oppCap2)
    let marginal := terminalClass \ surplusCap
    let ambientMarginal := ambientClass \ surplusCap
    let dangerousBase : Finset (Fin 16) :=
      {q, source, sourceHit, thirdDangerous}
    let sourceRow := dangerousBase
    let secondApexRow : Finset (Fin 16) := {secondHit, 8, 9, 10}
    terminalClass.card = 4 ∧
      (terminalClass ∩ surplusCap).card = 1 ∧
      marginal = {deleted, sourceHit, secondHit} ∧
      (marginal ∩ sourceRow) = {sourceHit} ∧
      (marginal ∩ secondApexRow) = {secondHit} ∧
      marginal \ (sourceRow ∪ secondApexRow) = {deleted} ∧
      ((marginal ∩ sourceRow) ∩ (marginal ∩ secondApexRow)) = ∅ ∧
      sourceHit ≠ secondHit ∧
      source ∈ dangerousBase ∧
      q ∈ surplusCap ∧
      sourceRow = dangerousBase ∧
      deleted ∉ dangerousBase ∧
      source ∈ strictOppCap1 ∧
      deleted ∈ strictOppCap1 ∧
      source ∉ terminalClass ∧
      mate ∉ terminalClass ∧
      ambientMarginal.card = 5 ∧
      (ambientMarginal ∩ oppCap2).card = 1 ∧
      marginal =
        (marginal ∩ oppCap2) ∪ (marginal ∩ strictOppCap1) ∧
      (marginal ∩ oppCap2).card = 1 ∧
      (marginal ∩ strictOppCap1).card = 2 ∧
      sourceRow.card = 4 ∧
      secondApexRow.card = 4 ∧
      (sourceRow ∩ secondApexRow).card ≤ 2 ∧
      source ∉ secondApexRow ∧
      deleted ∉ sourceRow ∧
      deleted ∉ secondApexRow := by
  decide

#print axioms aligned_terminal_cap_row_fields_allow_distinct_hits

end ATailRTerminalCapRowGeometryScratch
end Problem97
