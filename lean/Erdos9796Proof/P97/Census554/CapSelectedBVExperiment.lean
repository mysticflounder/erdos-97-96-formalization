/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

/-!
# Retired cap-selected bitvector prototype

This module formerly contained a list-generated bitvector experiment. Its
anonymous terminal example unfolded thousands of list cases with `simp` before
calling `bv_decide`; under Lean 4.27 that preprocessing exceeded ten million
simplifier steps after more than two hours.

The maintained constant-index implementation is
`Problem97.Census554.CapSelectedBVCircuit`, generated in bounded chunks by
`scripts/generate-cap-selected-bv-circuit.py`. The corresponding placement
theorem is
`Problem97.Census554.CapSelectedBVCircuit.prefixCore_of_p6_d4` in
`CapSelectedBVPlacements/P6D4.lean`.

Every declaration in the former prototype was private, and its terminal claim
was an anonymous `example`, so this module exposed no theorem API. Keeping this
small module preserves the import path without rebuilding the obsolete circuit.
If the old non-canonical experimental claim becomes necessary, generate a
bounded constant-index circuit for that exact statement instead of restoring
the broad simplifier expansion.
-/

namespace Problem97.Census554.CapSelectedBVExperiment

end Problem97.Census554.CapSelectedBVExperiment
