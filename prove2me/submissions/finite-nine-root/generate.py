#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Deterministically materialize the finite-nine mission-root solution."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

BASE = Path(__file__).parents[1]
SOURCE = BASE / "finite-nine-modular/platform/Solutions/Sol_Erdos9796Mission_finite_nine_exclusion.lean"
SOLUTION = Path(__file__).parent / "platform/Solutions/Sol_Erdos9796Mission_finite_nine_exclusion.lean"
THEOREM = Path(__file__).parent / "platform/Theorems/Thm_Erdos9796Mission_finite_nine_exclusion.lean"
EXPECTED_OLD = "8e886854686bdc44bafb69966ac3cb8a805194b6c6b8dcd4691bf04b9e0d1f55"
THEOREM_SOURCE = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796Mission

open Erdos9796Mission

/-! Exact statement mirror for the finite-nine mission root. -/
-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.finite_nine_exclusion :
    ∀ A : Finset Plane, A.card = 9 → ConvexIndep (A : Set Plane) → ¬ HasNEquidistantProperty 4 A := by sorry
"""
FORMAL_STATEMENT = """theorem Erdos9796Mission.finite_nine_exclusion :
    ∀ A : Finset Plane, A.card = 9 → ConvexIndep (A : Set Plane) → ¬ HasNEquidistantProperty 4 A := by sorry"""
FINAL_NOTE = """/-! Final reduction over the nine accepted public child theorems. -/

"""

def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    THEOREM.write_text(THEOREM_SOURCE)
    marker = "-- PROVE2ME_FORMAL_STATEMENT\n"
    theorem_after_marker = THEOREM_SOURCE.split(marker, 1)[1].rstrip()
    if theorem_after_marker != FORMAL_STATEMENT:
        raise SystemExit("generated theorem statement does not match the remote body")
    if not SOURCE.exists():
        raise SystemExit(f"missing authenticated source candidate: {SOURCE}")
    if digest(SOURCE) != EXPECTED_OLD:
        raise SystemExit("authenticated modular candidate changed")
    generated = SOURCE.read_text()
    imports_end = generated.find("import Definitions.Def_Erdos9796Counting_Adapter")
    note_start = generated.find("/-!", imports_end)
    note_end = generated.find("-/", note_start)
    if imports_end < 0 or note_start < 0 or note_end < 0:
        raise SystemExit("missing deterministic source-note repair site")
    generated = generated[:note_start] + FINAL_NOTE + generated[note_end + 2:]
    repairs = {
        "have hB1 := Erdos9796FiniteNine.form_b_v1 S":
            "have hB1 : S.N4dExcludesFormB_v1 := Erdos9796FiniteNine.form_b_v1 S",
        "have hB2 := Erdos9796FiniteNine.form_b_v2 S":
            "have hB2 : S.N4dExcludesFormB_v2 := Erdos9796FiniteNine.form_b_v2 S",
        "have hA1 := Erdos9796FiniteNine.form_a_v1 S hB2":
            "have hA1 : S.N4dExcludesFormA_v1 := Erdos9796FiniteNine.form_a_v1 S hB2",
        "have hC1 := Erdos9796FiniteNine.form_c_v1 S":
            "have hC1 : S.N4dExcludesFormC_v1 := Erdos9796FiniteNine.form_c_v1 S",
        "have hcyclic := Erdos9796FiniteNine.cyclic_forms S":
            "have hcyclic : S.N4dExcludesFormA_v2 ∧ S.N4dExcludesFormC_v2 ∧\n      S.N4dExcludesFormA_v3 ∧ S.N4dExcludesFormB_v3 ∧ S.N4dExcludesFormC_v3 :=\n    Erdos9796FiniteNine.cyclic_forms S",
        "have hN4e := Erdos9796FiniteNine.cap_containment S hA1 hB1 hC1 hB2 hcyclic":
            "have hN4e : S.N4eCapContainment :=\n    Erdos9796FiniteNine.cap_containment S hA1 hB1 hC1 hB2 hcyclic",
    }
    for old, new in repairs.items():
        if old not in generated:
            raise SystemExit(f"missing deterministic repair site: {old}")
        generated = generated.replace(old, new)
    old_tail = """  classical
  obtain ⟨x, hxI1⟩ : S.I1.Nonempty :=
    Finset.card_pos.mp (by have := S.I1_card_ge_two; omega)
  exact Erdos9796FiniteNine.single_apex_exhaustion S hN4e S.hK4 hxI1
"""
    new_tail = """  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hI1card : S.I1.card + 2 = S.CP.C1.card := by
    have hv3 : S.MT.toMoserTriangle.v3 ∈
        S.CP.C1.erase S.MT.toMoserTriangle.v2 :=
      Finset.mem_erase.mpr ⟨by intro h; exact h23 h.symm, S.CP.v3_mem_C1⟩
    have hC1erase :
        (S.CP.C1.erase S.MT.toMoserTriangle.v2).card = S.CP.C1.card - 1 :=
      Finset.card_erase_of_mem S.CP.v2_mem_C1
    have hC1ge : 2 ≤ S.CP.C1.card := by
      have hsubset :
          ({S.MT.toMoserTriangle.v2, S.MT.toMoserTriangle.v3} : Finset ℝ²) ⊆
            S.CP.C1 := by
        intro x hx
        simp at hx
        rcases hx with rfl | rfl
        · exact S.CP.v2_mem_C1
        · exact S.CP.v3_mem_C1
      have hcard_le := Finset.card_le_card hsubset
      simpa [h23] using hcard_le
    have hI1 : S.I1.card =
        (S.CP.C1.erase S.MT.toMoserTriangle.v2).card - 1 := by
      unfold Batch3N9.Problem97.FiniteEndpointShell.I1
      exact Finset.card_erase_of_mem hv3
    rw [hI1, hC1erase]
    omega
  have hI2card : S.I2.card + 2 = S.CP.C2.card := by
    have hv1 : S.MT.toMoserTriangle.v1 ∈
        S.CP.C2.erase S.MT.toMoserTriangle.v3 :=
      Finset.mem_erase.mpr ⟨h13, S.CP.v1_mem_C2⟩
    have hC2erase :
        (S.CP.C2.erase S.MT.toMoserTriangle.v3).card = S.CP.C2.card - 1 :=
      Finset.card_erase_of_mem S.CP.v3_mem_C2
    have hC2ge : 2 ≤ S.CP.C2.card := by
      have hsubset :
          ({S.MT.toMoserTriangle.v3, S.MT.toMoserTriangle.v1} : Finset ℝ²) ⊆
            S.CP.C2 := by
        intro x hx
        simp at hx
        rcases hx with rfl | rfl
        · exact S.CP.v3_mem_C2
        · exact S.CP.v1_mem_C2
      have hcard_le := Finset.card_le_card hsubset
      have h31 : S.MT.toMoserTriangle.v3 ≠ S.MT.toMoserTriangle.v1 := by
        intro h
        exact h13 h.symm
      simpa [h31] using hcard_le
    have hI2 : S.I2.card =
        (S.CP.C2.erase S.MT.toMoserTriangle.v3).card - 1 := by
      unfold Batch3N9.Problem97.FiniteEndpointShell.I2
      exact Finset.card_erase_of_mem hv1
    rw [hI2, hC2erase]
    omega
  have hI3card : S.I3.card + 2 = S.CP.C3.card := by
    have hv2 : S.MT.toMoserTriangle.v2 ∈
        S.CP.C3.erase S.MT.toMoserTriangle.v1 :=
      Finset.mem_erase.mpr ⟨by intro h; exact h12 h.symm, S.CP.v2_mem_C3⟩
    have hC3erase :
        (S.CP.C3.erase S.MT.toMoserTriangle.v1).card = S.CP.C3.card - 1 :=
      Finset.card_erase_of_mem S.CP.v1_mem_C3
    have hC3ge : 2 ≤ S.CP.C3.card := by
      have hsubset :
          ({S.MT.toMoserTriangle.v1, S.MT.toMoserTriangle.v2} : Finset ℝ²) ⊆
            S.CP.C3 := by
        intro x hx
        simp at hx
        rcases hx with rfl | rfl
        · exact S.CP.v1_mem_C3
        · exact S.CP.v2_mem_C3
      have hcard_le := Finset.card_le_card hsubset
      simpa [h12] using hcard_le
    have hI3 : S.I3.card =
        (S.CP.C3.erase S.MT.toMoserTriangle.v1).card - 1 := by
      unfold Batch3N9.Problem97.FiniteEndpointShell.I3
      exact Finset.card_erase_of_mem hv2
    rw [hI3, hC3erase]
    omega
  have hchoice : 4 ≤ S.CP.C1.card ∨ 4 ≤ S.CP.C2.card ∨
      4 ≤ S.CP.C3.card := by
    have hsum := S.hcapSum12
    omega
  rcases hchoice with hC1 | hC2 | hC3
  · obtain ⟨x, hx⟩ : S.I1.Nonempty := Finset.card_pos.mp (by omega)
    exact Erdos9796FiniteNine.single_apex_exhaustion S hN4e S.hK4
      (i := ⟨0, by omega⟩) (by simpa [Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex] using hx)
  · obtain ⟨x, hx⟩ : S.I2.Nonempty := Finset.card_pos.mp (by omega)
    exact Erdos9796FiniteNine.single_apex_exhaustion S hN4e S.hK4
      (i := ⟨1, by omega⟩) (by simpa [Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex] using hx)
  · obtain ⟨x, hx⟩ : S.I3.Nonempty := Finset.card_pos.mp (by omega)
    exact Erdos9796FiniteNine.single_apex_exhaustion S hN4e S.hK4
      (i := ⟨2, by omega⟩) (by simpa [Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex] using hx)
"""
    if old_tail not in generated:
        raise SystemExit("missing deterministic root-tail repair site")
    generated = generated.replace(old_tail, new_tail)
    generated = generated.replace("Finset ℝ²", "Finset Plane")
    if not generated or "theorem solution" not in generated:
        raise SystemExit("source candidate did not contain the expected root proof")
    SOLUTION.write_text(generated)
    raw = SOLUTION.read_bytes()
    if b"Final reduction over the nine accepted public child theorems." not in raw \
            or b"sorry" in raw or b"sorryAx" in raw:
        raise SystemExit("solution contains a forbidden placeholder/sketch marker")
    if args.check:
        print(f"PASS {len(raw)} bytes {digest(SOLUTION)}")
    else:
        print(f"PASS existing deterministic solution {len(raw)} bytes {digest(SOLUTION)}")
    if EXPECTED_OLD == digest(SOLUTION):
        raise SystemExit("stale candidate digest still present")

if __name__ == "__main__":
    main()
