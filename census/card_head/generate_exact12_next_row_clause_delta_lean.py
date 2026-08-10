"""Generate all exact-12 next-row clause-delta artifacts and Lean bridges.

The generator recompiles every frozen placement cell from the source-faithful
candidate universe, checks that the emitted suffix is exactly the compiler
delta, and records the lane-specific source inventory.  The generated Lean
modules embed those ordered clauses and compare them with the kernel-side
``reconstructedClauseDelta``.

This is compiler ingress only.  It does not produce a learned bank, terminal
UNSAT certificate, aggregate placement coverage, universal lift, or closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_next_row_valuation import (
    COMPILER_SCHEMA,
    FROZEN_BASE_CNF_SHA256,
    FROZEN_CANDIDATE_TABLE_SHA256,
    CompiledExact12NextRowCell,
    Exact12NextRowValuationError,
    cells,
    compile_cell,
)
from .exact12_v14_schedule import json_sha256
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

ARTIFACT_SCHEMA = "p97_rigid221_exact12_next_row_clause_delta_artifact.v1"
EXPECTED_CELL_COUNT = 12
EXPECTED_DELTA_CLAUSES = 384

# Byte-pin the lane-specific compiler and Lean ingress chain.  The shared
# candidate/SAT implementation is pinned extensionally below by the frozen
# candidate table, complete base clause list, complete DIMACS, and ordered
# suffix hashes; this inventory does not claim to be a transitive Python
# dependency lockfile.
SOURCE_PATHS = (
    "census/card_head/generate_exact12_next_row_clause_delta_lean.py",
    "census/card_head/exact12_next_row_valuation.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowOnlyHitIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowJobSemantics.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NormalizedNextRowOnlyHitIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221V14SourceJobBridge.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowJobCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowTerminalBankConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowCompiledJob.lean"
    ),
)


def _json_text(value: object) -> str:
    return json.dumps(value, indent=2, sort_keys=True) + "\n"


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _source_inventory(repo_root: Path) -> list[dict[str, object]]:
    inventory: list[dict[str, object]] = []
    for relative in SOURCE_PATHS:
        path = repo_root / relative
        if not path.is_file():
            raise Exact12NextRowValuationError(
                f"required current source is missing: {relative}"
            )
        inventory.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256_file(path),
            }
        )
    return inventory


def _canonical_clause_bytes(clauses: Sequence[Sequence[int]]) -> bytes:
    return "".join(
        " ".join(map(str, clause)) + " 0\n" for clause in clauses
    ).encode("ascii")


def _compile(cell_index: int) -> tuple[
    SourceFaithfulCoverInstance, CompiledExact12NextRowCell
]:
    schedule = cells()
    if len(schedule) != EXPECTED_CELL_COUNT:
        raise Exact12NextRowValuationError(
            f"expected {EXPECTED_CELL_COUNT} placement cells, found {len(schedule)}"
        )
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise Exact12NextRowValuationError("cell index must be a plain integer")
    if not 0 <= cell_index < len(schedule):
        raise Exact12NextRowValuationError(
            f"cell index must lie in [0, {len(schedule) - 1}]"
        )
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, schedule[cell_index])
    return instance, compiled


def build_cell_artifact(repo_root: Path, cell_index: int) -> dict[str, Any]:
    """Build and validate one current-source ordered clause-delta artifact."""

    inventory = _source_inventory(repo_root)
    instance, compiled = _compile(cell_index)
    all_clauses = tuple(tuple(clause) for clause in instance.cnf.clauses)
    base = all_clauses[: compiled.base_n_clauses]
    suffix = all_clauses[compiled.base_n_clauses :]
    if suffix != compiled.clause_delta:
        raise Exact12NextRowValuationError(
            "compiler clause delta is not the complete emitted CNF suffix"
        )
    if len(suffix) != EXPECTED_DELTA_CLAUSES:
        raise Exact12NextRowValuationError(
            f"expected {EXPECTED_DELTA_CLAUSES} delta clauses, found {len(suffix)}"
        )
    base_hash = json_sha256([list(clause) for clause in base])
    if base_hash != FROZEN_BASE_CNF_SHA256:
        raise Exact12NextRowValuationError(
            "source-faithful base CNF differs from the frozen authenticated base"
        )
    delta = [list(clause) for clause in suffix]
    dimacs = instance.dimacs().encode("ascii")
    artifact = {
        "schema": ARTIFACT_SCHEMA,
        "semantic_status": "CURRENT_SOURCE_ORDERED_DIMACS_SUFFIX",
        "scope": (
            "one finite next-row-only-hit placement cell; compiler ingress "
            "only, with no terminal bank, UNSAT, aggregate coverage, "
            "universal lift, or Lean-closure claim"
        ),
        "compiler_schema": COMPILER_SCHEMA,
        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
        "candidate_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
        "cell": compiled.manifest()["cell"],
        "counts": {
            "base_variables": compiled.base_n_variables,
            "base_clauses": compiled.base_n_clauses,
            "delta_clauses": len(delta),
            "final_variables": compiled.final_n_variables,
            "final_clauses": compiled.final_n_clauses,
        },
        "frozen_inputs": {
            "candidate_table_sha256": FROZEN_CANDIDATE_TABLE_SHA256,
            "base_clause_list_sha256": FROZEN_BASE_CNF_SHA256,
        },
        "source_inventory": inventory,
        "source_inventory_sha256": json_sha256(inventory),
        "clause_delta": delta,
        "hashes": {
            "base_clause_list_sha256": base_hash,
            "clause_delta_sha256": json_sha256(delta),
            "dimacs_sha256": hashlib.sha256(dimacs).hexdigest(),
            "dimacs_suffix_sha256": hashlib.sha256(
                _canonical_clause_bytes(suffix)
            ).hexdigest(),
        },
    }
    validate_cell_artifact(repo_root, artifact, cell_index)
    return artifact


def validate_cell_artifact(
    repo_root: Path, artifact: Mapping[str, Any], cell_index: int
) -> None:
    """Fail closed unless an artifact is the exact current-source cell suffix."""

    if artifact.get("schema") != ARTIFACT_SCHEMA:
        raise Exact12NextRowValuationError("clause-delta artifact schema mismatch")
    if artifact.get("compiler_schema") != COMPILER_SCHEMA:
        raise Exact12NextRowValuationError("clause-delta compiler schema mismatch")
    if artifact.get("candidate_schema") != SOURCE_FAITHFUL_CANDIDATE_SCHEMA:
        raise Exact12NextRowValuationError("clause-delta candidate schema mismatch")
    if artifact.get("candidate_profile") != list(SOURCE_FAITHFUL_PYTHON_PROFILE):
        raise Exact12NextRowValuationError("clause-delta candidate profile mismatch")
    instance, compiled = _compile(cell_index)
    expected_inventory = _source_inventory(repo_root)
    if artifact.get("source_inventory") != expected_inventory:
        raise Exact12NextRowValuationError("clause-delta source inventory is stale")
    if artifact.get("source_inventory_sha256") != json_sha256(expected_inventory):
        raise Exact12NextRowValuationError("source-inventory hash mismatch")
    if artifact.get("cell") != compiled.manifest()["cell"]:
        raise Exact12NextRowValuationError("clause-delta cell coordinate mismatch")
    delta = artifact.get("clause_delta")
    if not isinstance(delta, list):
        raise Exact12NextRowValuationError("clause_delta must be an ordered list")
    if any(
        not isinstance(clause, list)
        or any(isinstance(lit, bool) or not isinstance(lit, int) for lit in clause)
        for clause in delta
    ):
        raise Exact12NextRowValuationError(
            "clause_delta must contain only integer clause lists"
        )
    expected_delta = [list(clause) for clause in compiled.clause_delta]
    if delta != expected_delta:
        raise Exact12NextRowValuationError(
            "clause_delta differs from the current compiler output"
        )
    counts = artifact.get("counts")
    expected_counts = {
        "base_variables": compiled.base_n_variables,
        "base_clauses": compiled.base_n_clauses,
        "delta_clauses": EXPECTED_DELTA_CLAUSES,
        "final_variables": compiled.final_n_variables,
        "final_clauses": compiled.final_n_clauses,
    }
    if counts != expected_counts:
        raise Exact12NextRowValuationError("clause-delta count metadata mismatch")
    all_clauses = tuple(tuple(clause) for clause in instance.cnf.clauses)
    base = all_clauses[: compiled.base_n_clauses]
    dimacs = instance.dimacs().encode("ascii")
    hashes = artifact.get("hashes")
    expected_hashes = {
        "base_clause_list_sha256": json_sha256([list(clause) for clause in base]),
        "clause_delta_sha256": json_sha256(expected_delta),
        "dimacs_sha256": hashlib.sha256(dimacs).hexdigest(),
        "dimacs_suffix_sha256": hashlib.sha256(
            _canonical_clause_bytes(compiled.clause_delta)
        ).hexdigest(),
    }
    if hashes != expected_hashes:
        raise Exact12NextRowValuationError("clause-delta hash metadata mismatch")
    if artifact.get("frozen_inputs") != {
        "candidate_table_sha256": FROZEN_CANDIDATE_TABLE_SHA256,
        "base_clause_list_sha256": FROZEN_BASE_CNF_SHA256,
    }:
        raise Exact12NextRowValuationError("frozen input hashes mismatch")


def _lean_clause(clause: Sequence[int]) -> str:
    return "[" + ", ".join(map(str, clause)) + "]"


def render_lean_module(cell_index: int, artifact: Mapping[str, Any]) -> str:
    """Render one exact ordered suffix and its kernel-side equality bridge."""

    cell = artifact["cell"]
    clauses = artifact["clause_delta"]
    hashes = artifact["hashes"]
    counts = artifact["counts"]
    if not all(isinstance(value, Mapping) for value in (cell, hashes, counts)):
        raise Exact12NextRowValuationError("artifact metadata is malformed")
    if not isinstance(clauses, list):
        raise Exact12NextRowValuationError("artifact clause delta is malformed")
    stem = f"cell{cell_index:04d}"
    clause_lines = ",\n".join(f"  {_lean_clause(clause)}" for clause in clauses)
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowJobCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowCompiledJob

/-!
# Exact-12 next-row clause-delta artifact, cell {cell_index}

Generated from the current-source ordered clause-delta artifact
for schedule cell {cell_index}.  The equality below checks compiler ingress.
It does not establish a terminal bank, UNSAT, aggregate placement coverage,
a universal lift, or live closure.
-/

set_option linter.style.longLine false

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenNextRowClauseDeltaArtifact

open ExactTwelveCarrierIngress
open FrozenNextRowCompiledJob
open FrozenNextRowJobCnf
open NextRowTerminalBankConsumer

/-- Frozen semantic coordinate for schedule cell {cell_index}. -/
def {stem} : FrozenNextRowCell :=
  ⟨({cell["joint_deletion"]}, {cell["v"]}), by decide⟩

/-- SHA-256 of the current-source ordered clause delta. -/
def {stem}ClauseDeltaSha256 : String :=
  "{hashes["clause_delta_sha256"]}"

/-- SHA-256 of the complete current-source DIMACS bytes. -/
def {stem}DimacsSha256 : String :=
  "{hashes["dimacs_sha256"]}"

/-- SHA-256 of the source inventory recorded by the JSON artifact. -/
def {stem}SourceInventorySha256 : String :=
  "{artifact["source_inventory_sha256"]}"

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
/-- The embedded artifact has the expected clause count. -/
theorem {stem}ClauseDelta_length :
    {stem}ClauseDelta.length = {counts["delta_clauses"]} := by
  native_decide

/-- Typed source-satisfiability package for the exact serialized cell job. -/
def {stem}CompiledNextRowJob :
    NextRowTerminalBankConsumer.CompiledNextRowJob
      {stem}.1.1 {stem}.1.2 :=
  FrozenNextRowCompiledJob.serializedCompiledNextRowJob
    {stem} {stem}ClauseDelta
    {stem}ClauseDelta_eq

end FrozenNextRowClauseDeltaArtifact
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
'''


def render_aggregate_module() -> str:
    imports = "\n".join(
        "import Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        f"ExactTwelveRigid221NextRowClauseDeltaCell{index:04d}"
        for index in range(EXPECTED_CELL_COUNT)
    )
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Exact-12 next-row clause-delta artifact collection

This module imports all twelve generated compiler-ingress bridges.  It does
not assert terminal UNSAT, all-cell learned-bank coverage, a universal lift,
or closure of a live geometric residual.
-/
'''


def generate_all(
    repo_root: Path,
    artifact_dir: Path,
    lean_dir: Path,
    *,
    check: bool,
) -> None:
    """Generate or byte-check the complete twelve-cell artifact collection."""

    expected: list[tuple[Path, str, Path, str]] = []
    for index in range(EXPECTED_CELL_COUNT):
        artifact = build_cell_artifact(repo_root, index)
        expected.append(
            (
                artifact_dir / f"cell{index:04d}-clause-delta.json",
                _json_text(artifact),
                lean_dir
                / f"ExactTwelveRigid221NextRowClauseDeltaCell{index:04d}.lean",
                render_lean_module(index, artifact),
            )
        )
    aggregate_path = lean_dir / "ExactTwelveRigid221NextRowClauseDeltaArtifacts.lean"
    aggregate_text = render_aggregate_module()
    inventory_hashes = {
        json.loads(json_text)["source_inventory_sha256"]
        for _json_path, json_text, _lean_path, _lean_text in expected
    }
    if len(inventory_hashes) != 1:
        raise Exact12NextRowValuationError(
            "source inventory changed while compiling the twelve-cell batch"
        )
    if json_sha256(_source_inventory(repo_root)) not in inventory_hashes:
        raise Exact12NextRowValuationError(
            "source inventory changed before artifact publication"
        )
    if check:
        for json_path, json_text, lean_path, lean_text in expected:
            if not json_path.is_file() or json_path.read_text() != json_text:
                raise Exact12NextRowValuationError(
                    f"checked-in artifact is stale: {json_path}"
                )
            if not lean_path.is_file() or lean_path.read_text() != lean_text:
                raise Exact12NextRowValuationError(
                    f"checked-in Lean bridge is stale: {lean_path}"
                )
        if not aggregate_path.is_file() or aggregate_path.read_text() != aggregate_text:
            raise Exact12NextRowValuationError(
                f"checked-in aggregate module is stale: {aggregate_path}"
            )
        return

    if artifact_dir.exists():
        raise FileExistsError(f"artifact directory already exists: {artifact_dir}")
    occupied_lean_paths = [
        lean_path
        for _json_path, _json_text, lean_path, _lean_text in expected
        if lean_path.exists()
    ]
    if aggregate_path.exists():
        occupied_lean_paths.append(aggregate_path)
    if occupied_lean_paths:
        raise Exact12NextRowValuationError(
            f"refusing to overwrite existing Lean artifact: {occupied_lean_paths[0]}"
        )
    artifact_dir.mkdir(parents=True, exist_ok=False)
    lean_dir.mkdir(parents=True, exist_ok=True)
    for json_path, json_text, lean_path, lean_text in expected:
        json_path.write_text(json_text, encoding="utf-8")
        lean_path.write_text(lean_text, encoding="utf-8")
    aggregate_path.write_text(aggregate_text, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--artifact-dir", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    generate_all(
        args.repo_root.resolve(),
        args.artifact_dir,
        args.lean_dir,
        check=args.check,
    )
    verb = "checked" if args.check else "generated"
    print(f"{verb} {EXPECTED_CELL_COUNT} exact-12 next-row clause-delta bridges")


if __name__ == "__main__":
    main()
