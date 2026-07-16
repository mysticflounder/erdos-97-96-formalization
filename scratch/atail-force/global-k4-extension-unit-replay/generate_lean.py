#!/usr/bin/env python3
"""Emit a pure-kernel EndpointCertificate replay and scalar terminal theorem."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CERTIFICATE = HERE / "five_row_unit_certificate.json"
VERIFICATION = HERE / "five_row_unit_verification.json"
ENDPOINT_TOOL = ROOT / "scripts" / "endpoint-certificate.py"
OUTPUT = HERE / "FiveRowUnitReplay.lean"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_endpoint_tool():
    spec = importlib.util.spec_from_file_location("p97_endpoint_certificate", ENDPOINT_TOOL)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ENDPOINT_TOOL}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    verification = json.loads(VERIFICATION.read_text(encoding="utf-8"))
    certificate_hash = file_sha256(CERTIFICATE)
    if not verification["verified_exact_identity"]:
        raise RuntimeError("refusing to emit from an unverified identity")
    if verification["certificate_file_sha256"] != certificate_hash:
        raise RuntimeError("certificate hash disagrees with verification")

    tool = load_endpoint_tool()
    variables = [str(name) for name in certificate["variables"]]
    all_generators = [str(value) for value in certificate["generators"]]
    all_coefficients = [str(value) for value in certificate["multipliers"]]
    active = [
        (index, name, generator, coefficient)
        for index, (name, generator, coefficient) in enumerate(zip(
            certificate["generator_names"],
            all_generators,
            all_coefficients,
            strict=True,
        ))
        if tool.coefficient_string_is_nonzero(coefficient)
    ]
    active_generators = [generator for _, _, generator, _ in active]
    active_coefficients = [coefficient for _, _, _, coefficient in active]
    tool.check_identity(variables, active_generators, active_coefficients)

    assignment_cases = "\n".join(
        f"  | {index} => {variable}" for index, variable in enumerate(variables)
    )
    hypotheses = "\n".join(
        f"    (h{index:02d} : {generator} = 0) -- {name}"
        for index, (name, generator) in enumerate(zip(
            certificate["generator_names"], all_generators, strict=True
        ))
    )
    rcases = " | ".join("rfl" for _ in active)
    cases = []
    for index, name, _generator, _coefficient in active:
        cases.extend((
            f"  · -- {name}",
            "    norm_num [evalPoly, evalTerm, evalMonom, normalizedAssignment] <;>",
            f"      nlinarith [h{index:02d}]",
        ))
    active_notes = ", ".join(
        f"{index}:{name}" for index, name, _, _ in active
    )

    source = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Soundness

/-!
# Exact O,D,E,I,F five-row UNIT replay

This scratch module replays an independently verified rational
Nullstellensatz identity through `EndpointCertificate.checkCertificate`.
The validity theorem deliberately uses kernel reduction (`decide`), not
`native_decide`.

Source checkpoint polynomial hash:
`{certificate['source_full_equality_sha256']}`

Certificate SHA256: `{certificate_hash}`
Identity SHA256: `{certificate['raw_change_identity_sha256']}`

The original retained system has sixteen equations.  The exact lift has
eleven nonzero columns; the checked certificate omits only the five literal
zero columns.  Active columns: {active_notes}.
-/

namespace Problem97.ATailGlobalK4UnitScratch

open EndpointCertificate

set_option maxRecDepth 100000
set_option maxHeartbeats 80000000

/-- The eleven generators with nonzero columns in the exact lift. -/
def activeGenerators : List Poly :=
{tool.lean_poly_list(active_generators, variables)}

/-- Exact rational lift coefficients, normalized so their weighted sum is one. -/
def activeCoefficients : List Poly :=
{tool.lean_poly_list(active_coefficients, variables)}

/-- The independently verified sparse rational certificate. -/
def fiveRowCertificate : Certificate :=
  {{ generators := activeGenerators
    coefficients := activeCoefficients }}

/-- Pure-kernel validation of the exact rational identity. -/
theorem fiveRowCertificate_valid :
    checkCertificate fiveRowCertificate = true := by
  decide

/-- Assignment order used by the certificate:
`{', '.join(f'{i}={name}' for i, name in enumerate(variables))}`. -/
def normalizedAssignment ({' '.join(variables)} : ℝ) : Nat → ℝ
{assignment_cases}
  | _ => 0

/-- The sixteen pinned normalized squared-distance differences imply that
every active certificate generator evaluates to zero. -/
theorem activeGeneratorZeros
    ({' '.join(variables)} : ℝ)
{hypotheses}
    : ∀ g ∈ activeGenerators,
        evalPoly (normalizedAssignment {' '.join(variables)}) g = 0 := by
  intro g hg
  simp only [activeGenerators, List.mem_cons, List.not_mem_nil, or_false] at hg
  rcases hg with {rcases}
{chr(10).join(cases)}

/-- Exact normalized scalar terminal for the retained O,D,E,I,F rows. -/
theorem false_of_allSixteenNormalizedFiveRowEqualities
    ({' '.join(variables)} : ℝ)
{hypotheses}
    : False := by
  exact false_of_checkCertificate
    (normalizedAssignment {' '.join(variables)})
    fiveRowCertificate
    fiveRowCertificate_valid
    (activeGeneratorZeros {' '.join(variables)}
      {' '.join(f'h{index:02d}' for index in range(len(all_generators)))})

#print axioms fiveRowCertificate_valid
#print axioms false_of_allSixteenNormalizedFiveRowEqualities

end Problem97.ATailGlobalK4UnitScratch
"""
    OUTPUT.write_text(source, encoding="utf-8")
    print(json.dumps({
        "output": str(OUTPUT),
        "output_sha256": file_sha256(OUTPUT),
        "output_bytes": OUTPUT.stat().st_size,
        "source_equations": len(all_generators),
        "active_certificate_columns": len(active),
        "checker_tactic": "decide",
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
