#!/usr/bin/env python3
"""Freeze one greedy exact-two family core and emit a Lean LRAT certificate.

The input greedy artifact is discovery evidence.  This script reconstructs
its retained raw DIMACS clauses from the authenticated core/map pair, obtains
a fresh direct LRAT proof from CaDiCaL, and emits an explicit `Std.Sat.CNF`
data module for Lean's verified LRAT checker.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import time
from typing import Any

import analyze_core_ablation as ablation


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def atomic_write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
    temporary.write_text(text, encoding="utf-8")
    os.replace(temporary, path)


def atomic_write_json(path: Path, payload: dict[str, Any]) -> None:
    atomic_write_text(path, json.dumps(payload, indent=2, sort_keys=True) + "\n")


def validate_greedy(
    greedy_path: Path,
) -> tuple[
    dict[str, Any],
    Path,
    Path,
    dict[str, Any],
    int,
    list[tuple[int, ...]],
    set[str],
]:
    greedy = json.loads(greedy_path.read_text(encoding="utf-8"))
    if greedy.get("schema") != "p97-unique4-exact-two-greedy-family-core-v1":
        raise ValueError("unexpected greedy artifact schema")
    profile = int(greedy["profile"])
    if profile not in (4, 5):
        raise ValueError("greedy profile is not 4 or 5")
    if greedy["final_solver_result"]["status"] != "UNSAT":
        raise ValueError("greedy artifact lacks a final UNSAT result")

    core_path = Path(greedy["core"]["path"]).resolve()
    map_path = Path(greedy["map"]["path"]).resolve()
    if sha256(core_path) != greedy["core"]["sha256"]:
        raise ValueError("greedy core hash mismatch")
    if sha256(map_path) != greedy["map"]["sha256"]:
        raise ValueError("greedy map hash mismatch")
    variable_count, clauses = ablation.parse_dimacs(core_path)
    mapping = json.loads(map_path.read_text(encoding="utf-8"))
    if (
        mapping.get("schema")
        != "p97-unique4-exact-two-drat-input-core-map-v1"
        or int(mapping["profile"]) != profile
        or mapping["core"]["sha256"] != sha256(core_path)
        or int(mapping["core"]["clause_count"]) != len(clauses)
        or not mapping["matching_summary"]["allocation_is_injective"]
        or int(mapping["matching_summary"]["canonically_unmatched_count"]) != 0
    ):
        raise ValueError("mapped core authentication invariants drifted")
    if len(mapping["core_clauses"]) != len(clauses):
        raise ValueError("map/core clause-count mismatch")
    for index, (clause, entry) in enumerate(
        zip(clauses, mapping["core_clauses"], strict=True), 1
    ):
        if int(entry["core_clause_index"]) != index:
            raise ValueError("map clause indices are not contiguous")
        if entry["core_clause_literal_order"] != list(clause):
            raise ValueError("map/core literal order mismatch")

    retained = set(map(str, greedy["retained_families"]))
    removed = set(map(str, greedy["removed_optional_families"]))
    all_families = {
        str(entry["allocated_family"]) for entry in mapping["core_clauses"]
    }
    if retained | removed != all_families or retained & removed:
        raise ValueError("greedy family partition is inconsistent")
    if set(map(str, greedy["mandatory_families"])) - retained:
        raise ValueError("greedy result removed a mandatory family")

    retained_clause_count = sum(
        str(entry["allocated_family"]) in retained
        for entry in mapping["core_clauses"]
    )
    if retained_clause_count != int(greedy["retained_clause_count"]):
        raise ValueError("greedy retained clause count drifted")
    if len(retained) != int(greedy["retained_family_count"]):
        raise ValueError("greedy retained family count drifted")
    if len(removed) != int(greedy["removed_optional_family_count"]):
        raise ValueError("greedy removed family count drifted")
    mandatory = set(map(str, greedy["mandatory_families"]))
    if len(mandatory) != int(greedy["mandatory_family_count"]):
        raise ValueError("greedy mandatory family count drifted")
    final = greedy["final_solver_result"]
    removed_clause_count = len(clauses) - retained_clause_count
    if (
        final["group"] != "final_retained_family_core"
        or int(final["removed_clause_count"]) != removed_clause_count
        or int(final["kept_clause_count"]) != retained_clause_count
    ):
        raise ValueError("greedy final solver result is not the retained family core")
    family_ablation_path = Path(greedy["family_ablation"]["path"]).resolve()
    if sha256(family_ablation_path) != greedy["family_ablation"]["sha256"]:
        raise ValueError("greedy family-ablation dependency hash mismatch")
    return (
        greedy,
        core_path,
        map_path,
        mapping,
        variable_count,
        clauses,
        retained,
    )


def render_dimacs(
    variable_count: int,
    clauses: list[tuple[int, ...]],
    mapping: dict[str, Any],
    retained: set[str],
) -> tuple[str, Counter[str], dict[int, int]]:
    selected: list[tuple[int, ...]] = []
    counts: Counter[str] = Counter()
    for clause, entry in zip(clauses, mapping["core_clauses"], strict=True):
        family = str(entry["allocated_family"])
        if family not in retained:
            continue
        selected.append(clause)
        counts[family] += 1
    used_variables = sorted({abs(literal) for clause in selected for literal in clause})
    if not used_variables:
        raise ValueError("retained core uses no variables")
    if used_variables[-1] > variable_count:
        raise ValueError("retained core literal exceeds source variable count")
    dense_variable_map = {
        old_variable: new_variable
        for new_variable, old_variable in enumerate(used_variables, 1)
    }
    dense_clauses = [
        tuple(
            dense_variable_map[abs(literal)] if literal > 0
            else -dense_variable_map[abs(literal)]
            for literal in clause
        )
        for clause in selected
    ]
    lines = [f"p cnf {len(used_variables)} {len(dense_clauses)}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in dense_clauses)
    return "\n".join(lines) + "\n", counts, dense_variable_map


def lean_name(prefix: str) -> str:
    words = [word for word in prefix.replace("-", "_").split("_") if word]
    if not words:
        raise ValueError("empty prefix")
    answer = "".join(word[:1].upper() + word[1:] for word in words)
    if not answer[0].isalpha() or not all(
        character.isalnum() or character == "_" for character in answer
    ):
        raise ValueError("prefix does not yield a Lean identifier")
    return answer


def render_lean(
    namespace: str,
    stem: str,
    clauses: list[tuple[int, ...]],
    lrat_filename: str,
) -> str:
    dimacs_rows = ",\n".join(
        "  [" + ", ".join(map(str, clause)) + "]" for clause in clauses
    )
    return f"""import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailUniqueFourExactTwoReducedCoreScratch

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

/-- Raw signed DIMACS clauses of the frozen `{stem}` reduced input core. -/
def {namespace}Dimacs : List (List Int) := [
{dimacs_rows}
]

def {namespace}ToLit (literal : Int) : Nat × Bool :=
  (literal.natAbs - 1, decide (0 < literal))

/-- Zero-based `Std.Sat` translation of `{namespace}Dimacs`. -/
def {namespace}Cnf : CNF Nat :=
  {namespace}Dimacs.map fun clause => clause.map {namespace}ToLit

def {namespace}Lrat : String := include_str "{lrat_filename}"

/-- Verified-LRAT UNSAT theorem for the frozen `{stem}` reduced input core.
The final Boolean replay uses `native_decide`, hence its standard compiler
trust boundary; this theorem alone is not a source-to-CNF bridge. -/
theorem {namespace}Core_unsat : {namespace}Cnf.Unsat := by
  apply Reflect.verifyCert_correct {namespace}Cnf {namespace}Lrat
  native_decide

#print axioms {namespace}Core_unsat

end Problem97.ATailUniqueFourExactTwoReducedCoreScratch
"""


def run_checked(
    command: list[str],
    *,
    cwd: Path,
    timeout_seconds: int,
) -> dict[str, Any]:
    started = time.monotonic()
    result = subprocess.run(
        command,
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        timeout=timeout_seconds,
        check=False,
    )
    return {
        "command": command,
        "cwd": str(cwd),
        "exit_code": result.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "output": result.stdout,
    }


def acquire_build_lock(lockfile: Path) -> None:
    lockfile.parent.mkdir(parents=True, exist_ok=True)
    try:
        descriptor = os.open(
            lockfile,
            os.O_CREAT | os.O_EXCL | os.O_WRONLY,
            0o644,
        )
    except FileExistsError as error:
        raise RuntimeError(
            f"Lean build lock already exists: {lockfile}"
        ) from error
    with os.fdopen(descriptor, "w", encoding="ascii") as stream:
        stream.write(f"{os.getpid()}\n")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("greedy_result", type=Path)
    parser.add_argument("--prefix", required=True)
    parser.add_argument("--solver", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=7200)
    parser.add_argument("--skip-lean", action="store_true")
    args = parser.parse_args()

    stem = args.prefix
    namespace = lean_name(stem)
    final_cnf = (HERE / f"{stem}.reduced.cnf").resolve()
    final_lrat = (HERE / f"{stem}.reduced.lrat").resolve()
    final_lean = (HERE / f"{namespace}ReducedCore.lean").resolve()
    final_report = (HERE / f"{stem}.reduced-certificate.json").resolve()
    final_log = (HERE / f"{stem}.cadical-lrat.log").resolve()
    stale_report = ablation.quarantine_existing(final_report)
    if stale_report is not None:
        print(f"quarantined prior report: {stale_report}", flush=True)

    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    solver = args.solver
    if solver is None:
        resolved = shutil.which("cadical")
        if resolved is None:
            parser.error("cadical is not on PATH")
        solver = Path(resolved)
    solver = solver.resolve()
    if not solver.is_file():
        parser.error(f"solver does not exist: {solver}")

    greedy_path = args.greedy_result.resolve()
    (
        greedy,
        core_path,
        map_path,
        mapping,
        variable_count,
        clauses,
        retained,
    ) = validate_greedy(greedy_path)
    stage = (
        HERE / f".{stem}.reduced-stage-{os.getpid()}-{time.time_ns()}"
    ).resolve()
    stage.mkdir(parents=False, exist_ok=False)
    cnf_path = stage / final_cnf.name
    lrat_path = stage / final_lrat.name
    lean_path = stage / final_lean.name
    log_path = stage / final_log.name
    report_path = stage / final_report.name

    build_lock = ROOT / "lean" / ".lake" / "lake-build.lock"
    lock_held = False
    try:
        dimacs, family_counts, dense_variable_map = render_dimacs(
            variable_count, clauses, mapping, retained
        )
        atomic_write_text(cnf_path, dimacs)
        verified_variables, reduced_clauses = ablation.parse_dimacs(cnf_path)
        if verified_variables != len(dense_variable_map):
            raise ValueError("rendered dense variable count drifted")
        if len(reduced_clauses) != int(greedy["retained_clause_count"]):
            raise ValueError("rendered reduced core count drifted")

        cadical_command = [
            str(solver),
            "--factor=false",
            "--lrat",
            "--no-binary",
            str(cnf_path),
            str(lrat_path),
        ]
        cadical = run_checked(
            cadical_command,
            cwd=ROOT,
            timeout_seconds=args.timeout_seconds,
        )
        atomic_write_text(log_path, cadical["output"])
        if cadical["exit_code"] != 20:
            raise RuntimeError(
                f"CaDiCaL did not prove UNSAT: exit {cadical['exit_code']}"
            )
        if not lrat_path.is_file() or lrat_path.stat().st_size == 0:
            raise RuntimeError("CaDiCaL produced no LRAT certificate")

        atomic_write_text(
            lean_path,
            render_lean(
                namespace,
                stem,
                reduced_clauses,
                lrat_path.name,
            ),
        )

        lean_result: dict[str, Any] | None = None
        if not args.skip_lean:
            acquire_build_lock(build_lock)
            lock_held = True
            try:
                lean_result = run_checked(
                    [
                        "lake",
                        "env",
                        "lean",
                        "-M16384",
                        "--root=..",
                        "-DwarningAsError=true",
                        os.path.relpath(lean_path, ROOT / "lean"),
                    ],
                    cwd=ROOT / "lean",
                    timeout_seconds=args.timeout_seconds,
                )
            finally:
                build_lock.unlink(missing_ok=True)
                lock_held = False
            if lean_result["exit_code"] != 0:
                raise RuntimeError(
                    f"Lean LRAT replay failed: exit {lean_result['exit_code']}"
                )

        payload = {
            "schema": "p97-unique4-exact-two-reduced-core-certificate-v1",
            "epistemic_status": (
                "NATIVE-CHECKER VERIFIED LRAT UNSAT FOR THE HASHED FIXED-N "
                "REDUCED CNF; NO SOURCE-TO-CNF BRIDGE"
                if lean_result is not None
                else "DIRECT CADICAL LRAT GENERATED; LEAN REPLAY SKIPPED"
            ),
            "claim_scope": (
                "This certifies only the emitted fixed-n reduced CNF. It does "
                "not prove that the live geometric source satisfies that CNF "
                "and does not close a production sorry."
            ),
            "native_checker_trust_boundary": [
                "Lean.ofReduceBool",
                "Lean.trustCompiler",
            ],
            "profile": int(greedy["profile"]),
            "greedy_result": {
                "path": str(greedy_path),
                "sha256": sha256(greedy_path),
            },
            "source_core": {
                "path": str(core_path),
                "sha256": sha256(core_path),
            },
            "source_map": {
                "path": str(map_path),
                "sha256": sha256(map_path),
            },
            "retained_family_count": len(retained),
            "retained_families": sorted(retained),
            "retained_clause_count_by_family": dict(
                sorted(family_counts.items())
            ),
            "dense_variable_renaming": {
                "policy": "sorted_used_source_variables_to_contiguous_one_based_ids",
                "source_variable_count": variable_count,
                "dense_variable_count": len(dense_variable_map),
                "old_to_new": [
                    [old_variable, new_variable]
                    for old_variable, new_variable
                    in sorted(dense_variable_map.items())
                ],
            },
            "reduced_cnf": {
                "path": str(final_cnf),
                "sha256": sha256(cnf_path),
                "variable_count": len(dense_variable_map),
                "clause_count": len(reduced_clauses),
            },
            "lrat": {
                "path": str(final_lrat),
                "sha256": sha256(lrat_path),
                "byte_count": lrat_path.stat().st_size,
            },
            "lean": {
                "path": str(final_lean),
                "sha256": sha256(lean_path),
                "theorem": (
                    "Problem97.ATailUniqueFourExactTwoReducedCoreScratch."
                    f"{namespace}Core_unsat"
                ),
            },
            "generator": {
                "path": str(Path(__file__).resolve()),
                "sha256": sha256(Path(__file__).resolve()),
            },
            "solver": {
                "path": str(solver),
                "sha256": sha256(solver),
            },
            "cadical": {
                **cadical,
                "output": {
                    "path": str(final_log),
                    "sha256": sha256(log_path),
                },
            },
            "lean_replay": lean_result,
        }
        atomic_write_json(report_path, payload)

        for source, target in (
            (cnf_path, final_cnf),
            (lrat_path, final_lrat),
            (lean_path, final_lean),
            (log_path, final_log),
        ):
            os.replace(source, target)
        os.replace(report_path, final_report)
        print(
            json.dumps(
                {
                    "status": payload["epistemic_status"],
                    "report": str(final_report),
                    "retained_family_count": len(retained),
                    "retained_clause_count": len(reduced_clauses),
                },
                indent=2,
                sort_keys=True,
            )
        )
    finally:
        if lock_held:
            build_lock.unlink(missing_ok=True)
        shutil.rmtree(stage, ignore_errors=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
