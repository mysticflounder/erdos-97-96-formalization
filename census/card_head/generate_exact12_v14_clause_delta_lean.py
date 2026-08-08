"""Generate one exact-12 v14 clause-delta artifact and its Lean replay module.

The generated JSON is validated against the complete emitted DIMACS suffix.
The generated Lean module embeds that same ordered list and asks the kernel-side
checker to compare it with ``reconstructedClauseDelta`` for the named cell.
Neither output claims terminal coverage or closes a geometric theorem.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from .exact12_v14_bound_jobs import materialize_cell
from .exact12_v14_valuation import build_clause_delta_artifact

ARM_CONSTRUCTORS = {
    "u_q": "uQ",
    "u_w": "uW",
    "xv_q": "xvQ",
    "xv_w": "xvW",
    "xu_q": "xuQ",
    "xu_w": "xuW",
}


def _json_text(value: object) -> str:
    return json.dumps(value, indent=2, sort_keys=True) + "\n"


def _lean_clause(clause: list[int]) -> str:
    return "[" + ", ".join(map(str, clause)) + "]"


def render_lean_module(cell_index: int, artifact: dict[str, object]) -> str:
    """Render the explicit ordered artifact and its exact Lean equality check."""

    cell = artifact["cell"]
    if not isinstance(cell, dict):
        raise TypeError("artifact cell metadata is malformed")
    clauses = artifact["clause_delta"]
    hashes = artifact["hashes"]
    counts = artifact["counts"]
    if not isinstance(clauses, list) or not isinstance(hashes, dict):
        raise TypeError("artifact clause or hash metadata is malformed")
    if not isinstance(counts, dict):
        raise TypeError("artifact count metadata is malformed")
    stem = f"cell{cell_index:04d}"
    arm = ARM_CONSTRUCTORS[str(cell["arm"])]
    clause_lines = ",\n".join(f"  {_lean_clause(clause)}" for clause in clauses)
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnf

/-!
# Exact-12 normalized-v14 clause-delta artifact, cell {cell_index}

Generated from the authenticated ordered clause-delta artifact for schedule
cell {cell_index}.  The equality below checks only compiler ingress.  It does
not establish terminal coverage, UNSAT, a universal lift, or live closure.
-/

set_option linter.style.longLine false

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14ClauseDeltaArtifact

open FrozenV14JobCnf

/-- Frozen semantic coordinate for schedule cell {cell_index}. -/
def {stem} : FrozenV14JobCoordinate :=
  (⟨({cell["joint_deletion"]}, {cell["v"]}), by decide⟩,
    .{arm}, ⟨{cell["distinguished_d"]}, by decide⟩)

/-- SHA-256 recorded by the external authenticated artifact. -/
def {stem}ClauseDeltaSha256 : String :=
  "{hashes["clause_delta_sha256"]}"

/-- SHA-256 of the complete DIMACS bytes checked by the external artifact. -/
def {stem}DimacsSha256 : String :=
  "{hashes["dimacs_sha256"]}"

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Complete ordered emitted clause suffix for schedule cell {cell_index}. -/
def {stem}ClauseDelta : List (List Int) :=
[
{clause_lines}
]

set_option linter.style.nativeDecide false in
set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- The explicit emitted suffix agrees exactly with the Lean reconstruction. -/
theorem {stem}ClauseDelta_eq :
    reconstructedClauseDelta {stem} = {stem}ClauseDelta := by
  native_decide

set_option linter.style.nativeDecide false in
set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- The embedded artifact has the authenticated clause count. -/
theorem {stem}ClauseDelta_length :
    {stem}ClauseDelta.length = {counts["delta_clauses"]} := by
  native_decide

end FrozenV14ClauseDeltaArtifact
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
'''


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cell-index", type=int, required=True)
    parser.add_argument("--json-output", type=Path, required=True)
    parser.add_argument("--lean-output", type=Path, required=True)
    args = parser.parse_args()

    materialized = materialize_cell(args.cell_index)
    artifact = build_clause_delta_artifact(
        materialized.compiled, materialized.instance.dimacs()
    )
    lean_text = render_lean_module(args.cell_index, artifact)
    args.json_output.parent.mkdir(parents=True, exist_ok=True)
    args.lean_output.parent.mkdir(parents=True, exist_ok=True)
    args.json_output.write_text(_json_text(artifact), encoding="utf-8")
    args.lean_output.write_text(lean_text, encoding="utf-8")
    print(
        f"generated cell {args.cell_index}: "
        f"{len(artifact['clause_delta'])} clauses; "
        f"{artifact['hashes']['clause_delta_sha256']}"
    )


if __name__ == "__main__":
    main()
