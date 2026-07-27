#!/usr/bin/env python3
"""Materialize a trimmed LRAT certificate for the dense p5-largest core.

The production mode reuses ``materialize_reduced_core`` to authenticate the
greedy artifact and render its retained clauses with a dense variable
renaming.  CaDiCaL emits text DRAT for exactly that dense CNF.  ``drat-trim``
then verifies the DRAT and emits both an input-clause core and raw LRAT.

``drat-trim -L`` numbers base clauses in the original input-CNF domain, even
when ``-c`` emits a reordered strict subset.  This script therefore:

1. authenticates every trimmed-core clause against a unique original input
   occurrence;
2. if the core numbering differs, asks ``drat-trim -l`` for a core-relative
   DRAT proof and verifies that proof against the emitted core while producing
   a core-relative raw LRAT;
3. runs the existing ``normalize_lrat_for_lean.py`` with the base-clause count
   of the CNF that the selected raw LRAT actually addresses; and
4. accepts the normalized proof only after Lean's verified LRAT checker
   replays it against the emitted trimmed core.

The resulting theorem certifies only the emitted fixed finite CNF.  It is not a
source-to-CNF bridge and does not close a production theorem.
"""

from __future__ import annotations

import argparse
from collections import defaultdict, deque
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time
from typing import Any, Iterable

import materialize_reduced_core as base


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
NORMALIZER = (
    HERE.parent
    / "exact5-bv-encoding-profile"
    / "normalize_lrat_for_lean.py"
).resolve()


def exact_verdict(output: str, verdict: str) -> bool:
    """Return whether ``verdict`` occurs as a complete stripped output line."""

    return verdict in {line.strip() for line in output.splitlines()}


def resolve_executable(
    parser: argparse.ArgumentParser,
    requested: Path | None,
    default_name: str,
) -> Path:
    if requested is None:
        resolved = shutil.which(default_name)
        if resolved is None:
            parser.error(f"{default_name} is not on PATH")
        requested = Path(resolved)
    answer = requested.resolve()
    if not answer.is_file():
        parser.error(f"executable does not exist: {answer}")
    if not os.access(answer, os.X_OK):
        parser.error(f"executable is not executable: {answer}")
    return answer


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


def canonical_clause(clause: Iterable[int]) -> tuple[int, ...]:
    """Canonical Boolean-clause identity, preserving duplicate multiplicity."""

    return tuple(sorted(clause))


def authenticate_trimmed_core(
    input_clauses: list[tuple[int, ...]],
    core_clauses: list[tuple[int, ...]],
) -> list[int]:
    """Bind each core occurrence to a unique identical input occurrence."""

    available: dict[tuple[int, ...], deque[int]] = defaultdict(deque)
    for input_id, clause in enumerate(input_clauses, 1):
        key = canonical_clause(clause)
        available[key].append(input_id)

    core_to_input: list[int] = []
    for core_id, clause in enumerate(core_clauses, 1):
        key = canonical_clause(clause)
        if not available[key]:
            raise ValueError(
                f"trimmed core clause {core_id} is absent from the dense input CNF"
            )
        core_to_input.append(available[key].popleft())
    return core_to_input


def render_tiny_dense_cnf() -> tuple[
    str,
    dict[str, int],
    dict[int, int],
    list[tuple[int, ...]],
]:
    """Render a known UNSAT CNF with redundant clauses and sparse variables."""

    clauses = [
        (1, 2),
        (5,),
        (-5,),
        (-1, 2),
    ]
    mapping = {
        "core_clauses": [
            {
                "core_clause_index": index,
                "core_clause_literal_order": list(clause),
                "allocated_family": "tiny_smoke",
            }
            for index, clause in enumerate(clauses, 1)
        ]
    }
    dimacs, counts, dense_map = base.render_dimacs(
        5,
        clauses,
        mapping,
        {"tiny_smoke"},
    )
    dense_clauses = [
        tuple(
            dense_map[abs(literal)] if literal > 0
            else -dense_map[abs(literal)]
            for literal in clause
        )
        for clause in clauses
    ]
    return dimacs, dict(counts), dense_map, dense_clauses


def artifact_record(path: Path, final_path: Path) -> dict[str, Any]:
    return {
        "path": str(final_path),
        "sha256": base.sha256(path),
        "byte_count": path.stat().st_size,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("greedy_result", nargs="?", type=Path)
    parser.add_argument("--prefix", required=True)
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--solver", type=Path)
    parser.add_argument(
        "--solver-seed",
        type=int,
        help="optional deterministic CaDiCaL search seed",
    )
    parser.add_argument("--drat-trim", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=7200)
    parser.add_argument("--skip-lean", action="store_true")
    args = parser.parse_args()

    stem = args.prefix
    namespace = base.lean_name(stem)
    final_dense_cnf = (HERE / f"{stem}.dense.cnf").resolve()
    final_drat = (HERE / f"{stem}.drat").resolve()
    final_core_cnf = (HERE / f"{stem}.trimmed.core.cnf").resolve()
    final_original_raw_lrat = (
        HERE / f"{stem}.original-numbering.raw.lrat"
    ).resolve()
    final_core_drat = (HERE / f"{stem}.trimmed.core.drat").resolve()
    final_core_raw_lrat = (
        HERE / f"{stem}.trimmed-core-numbering.raw.lrat"
    ).resolve()
    final_trimmed_lrat = (HERE / f"{stem}.trimmed.lrat").resolve()
    final_lean = (HERE / f"{namespace}TrimmedReducedCore.lean").resolve()
    final_cadical_log = (HERE / f"{stem}.cadical-drat.log").resolve()
    final_trim_log = (HERE / f"{stem}.drat-trim.log").resolve()
    final_core_extract_log = (
        HERE / f"{stem}.core-drat-extract.log"
    ).resolve()
    final_core_verify_log = (
        HERE / f"{stem}.core-drat-verify.log"
    ).resolve()
    final_normalize_log = (HERE / f"{stem}.normalize-lrat.log").resolve()
    final_report = (HERE / f"{stem}.trimmed-certificate.json").resolve()

    stale_report = base.ablation.quarantine_existing(final_report)
    if stale_report is not None:
        print(f"quarantined prior report: {stale_report}", flush=True)

    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    if args.solver_seed is not None and args.solver_seed < 0:
        parser.error("--solver-seed must be nonnegative")
    if args.self_test and args.greedy_result is not None:
        parser.error("--self-test does not accept a greedy_result")
    if not args.self_test and args.greedy_result is None:
        parser.error("production mode requires greedy_result")
    if args.self_test and args.skip_lean:
        parser.error("--self-test must include the Lean replay")
    if not NORMALIZER.is_file():
        parser.error(f"LRAT normalizer is missing: {NORMALIZER}")

    solver = resolve_executable(parser, args.solver, "cadical")
    drat_trim = resolve_executable(parser, args.drat_trim, "drat-trim")

    input_provenance: dict[str, Any]
    if args.self_test:
        (
            dense_dimacs,
            family_counts,
            dense_variable_map,
            expected_dense_clauses,
        ) = render_tiny_dense_cnf()
        greedy = None
        source_core = None
        source_map = None
        retained: set[str] = {"tiny_smoke"}
        input_provenance = {
            "mode": "TINY_KNOWN_UNSAT_SMOKE",
            "mathematical_reason": (
                "The dense CNF contains complementary unit clauses on the "
                "renamed source variable 5."
            ),
        }
    else:
        assert args.greedy_result is not None
        greedy_path = args.greedy_result.resolve()
        (
            greedy,
            source_core,
            source_map,
            mapping,
            source_variable_count,
            source_clauses,
            retained,
        ) = base.validate_greedy(greedy_path)
        if (
            int(greedy["profile"]) != 5
            or greedy.get("order") != "largest"
            or int(greedy.get("seed", -1)) != 0
        ):
            raise ValueError(
                "production mode accepts only the p5 largest-order seed-0 "
                "greedy artifact"
            )
        (
            dense_dimacs,
            family_counter,
            dense_variable_map,
        ) = base.render_dimacs(
            source_variable_count,
            source_clauses,
            mapping,
            retained,
        )
        family_counts = dict(family_counter)
        expected_dense_clauses = [
            tuple(
                dense_variable_map[abs(literal)] if literal > 0
                else -dense_variable_map[abs(literal)]
                for literal in clause
            )
            for clause, entry in zip(
                source_clauses,
                mapping["core_clauses"],
                strict=True,
            )
            if str(entry["allocated_family"]) in retained
        ]
        input_provenance = {
            "mode": "AUTHENTICATED_P5_LARGEST_GREEDY_CORE",
            "greedy_result": {
                "path": str(greedy_path),
                "sha256": base.sha256(greedy_path),
            },
            "source_core": {
                "path": str(source_core),
                "sha256": base.sha256(source_core),
            },
            "source_map": {
                "path": str(source_map),
                "sha256": base.sha256(source_map),
            },
        }

    stage = (
        HERE / f".{stem}.trimmed-stage-{os.getpid()}-{time.time_ns()}"
    ).resolve()
    stage.mkdir(parents=False, exist_ok=False)
    dense_cnf = stage / final_dense_cnf.name
    drat = stage / final_drat.name
    core_cnf = stage / final_core_cnf.name
    original_raw_lrat = stage / final_original_raw_lrat.name
    core_drat = stage / final_core_drat.name
    core_raw_lrat = stage / final_core_raw_lrat.name
    trimmed_lrat = stage / final_trimmed_lrat.name
    lean_source = stage / final_lean.name
    cadical_log = stage / final_cadical_log.name
    trim_log = stage / final_trim_log.name
    core_extract_log = stage / final_core_extract_log.name
    core_verify_log = stage / final_core_verify_log.name
    normalize_log = stage / final_normalize_log.name
    report_path = stage / final_report.name

    lean_dir = base.canonical_lean_dir(ROOT)
    build_lock = lean_dir / ".lake" / "lake-build.lock"
    lock_held = False
    try:
        base.atomic_write_text(dense_cnf, dense_dimacs)
        dense_variable_count, dense_clauses = base.ablation.parse_dimacs(
            dense_cnf
        )
        if dense_variable_count != len(dense_variable_map):
            raise ValueError("dense DIMACS variable count drifted")
        if dense_clauses != expected_dense_clauses:
            raise ValueError("dense DIMACS clause order or signs drifted")

        solver_command = [
            str(solver),
            "--factor=false",
            "--no-binary",
        ]
        if args.solver_seed is not None:
            solver_command.append(f"--seed={args.solver_seed}")
        solver_command.extend([str(dense_cnf), str(drat)])
        cadical = run_checked(
            solver_command,
            cwd=ROOT,
            timeout_seconds=args.timeout_seconds,
        )
        base.atomic_write_text(cadical_log, cadical["output"])
        if cadical["exit_code"] != 20:
            raise RuntimeError(
                f"CaDiCaL did not prove UNSAT: exit {cadical['exit_code']}"
            )
        if not exact_verdict(cadical["output"], "s UNSATISFIABLE"):
            raise RuntimeError("CaDiCaL exit 20 lacked exact UNSAT verdict")
        if not drat.is_file() or drat.stat().st_size == 0:
            raise RuntimeError("CaDiCaL produced no text DRAT proof")

        trim = run_checked(
            [
                str(drat_trim),
                str(dense_cnf),
                str(drat),
                "-c",
                str(core_cnf),
                "-L",
                str(original_raw_lrat),
            ],
            cwd=ROOT,
            timeout_seconds=args.timeout_seconds,
        )
        base.atomic_write_text(trim_log, trim["output"])
        if trim["exit_code"] != 0 or not exact_verdict(
            trim["output"], "s VERIFIED"
        ):
            raise RuntimeError(
                "drat-trim did not authenticate the DRAT proof with exact "
                "`s VERIFIED`"
            )
        for path, description in (
            (core_cnf, "trimmed core CNF"),
            (original_raw_lrat, "original-numbering raw LRAT"),
        ):
            if not path.is_file() or path.stat().st_size == 0:
                raise RuntimeError(f"drat-trim produced no {description}")

        core_variable_count, core_clauses = base.ablation.parse_dimacs(core_cnf)
        if core_variable_count != dense_variable_count:
            raise ValueError(
                "drat-trim changed the DIMACS variable-count domain"
            )
        core_to_input = authenticate_trimmed_core(
            dense_clauses,
            core_clauses,
        )

        direct_clause_numbering_match = (
            len(core_clauses) == len(dense_clauses)
            and all(
                canonical_clause(core_clause)
                == canonical_clause(input_clause)
                for core_clause, input_clause in zip(
                    core_clauses,
                    dense_clauses,
                    strict=True,
                )
            )
        )
        if args.self_test and direct_clause_numbering_match:
            raise RuntimeError(
                "self-test did not exercise the core-relative DRAT/LRAT "
                "fallback"
            )
        if direct_clause_numbering_match:
            selected_raw_lrat = original_raw_lrat
            selected_raw_lrat_base_count = len(dense_clauses)
            selected_raw_lrat_domain = "dense_cnf"
            selected_raw_lrat_artifact = "original_numbering_raw_lrat"
            core_extract: dict[str, Any] | None = None
            core_verify: dict[str, Any] | None = None
        else:
            core_extract = run_checked(
                [
                    str(drat_trim),
                    str(dense_cnf),
                    str(drat),
                    "-l",
                    str(core_drat),
                ],
                cwd=ROOT,
                timeout_seconds=args.timeout_seconds,
            )
            base.atomic_write_text(core_extract_log, core_extract["output"])
            if core_extract["exit_code"] != 0 or not exact_verdict(
                core_extract["output"], "s VERIFIED"
            ):
                raise RuntimeError(
                    "drat-trim did not verify while extracting core-relative "
                    "DRAT"
                )
            if not core_drat.is_file() or core_drat.stat().st_size == 0:
                raise RuntimeError("drat-trim produced no core-relative DRAT")

            core_verify = run_checked(
                [
                    str(drat_trim),
                    str(core_cnf),
                    str(core_drat),
                    "-L",
                    str(core_raw_lrat),
                ],
                cwd=ROOT,
                timeout_seconds=args.timeout_seconds,
            )
            base.atomic_write_text(core_verify_log, core_verify["output"])
            if core_verify["exit_code"] != 0 or not exact_verdict(
                core_verify["output"], "s VERIFIED"
            ):
                raise RuntimeError(
                    "core-relative DRAT did not verify against the emitted "
                    "trimmed core CNF"
                )
            if not core_raw_lrat.is_file() or core_raw_lrat.stat().st_size == 0:
                raise RuntimeError(
                    "core-relative DRAT verification produced no LRAT"
                )
            selected_raw_lrat = core_raw_lrat
            selected_raw_lrat_base_count = len(core_clauses)
            selected_raw_lrat_domain = "trimmed_core_cnf"
            selected_raw_lrat_artifact = "trimmed_core_numbering_raw_lrat"

        normalize = run_checked(
            [
                sys.executable,
                str(NORMALIZER),
                str(selected_raw_lrat),
                str(trimmed_lrat),
                "--base-clauses",
                str(selected_raw_lrat_base_count),
                "--max-variable",
                str(core_variable_count),
            ],
            cwd=ROOT,
            timeout_seconds=args.timeout_seconds,
        )
        base.atomic_write_text(normalize_log, normalize["output"])
        if normalize["exit_code"] != 0:
            raise RuntimeError(
                f"LRAT lemma normalization failed: exit "
                f"{normalize['exit_code']}"
            )
        if not trimmed_lrat.is_file() or trimmed_lrat.stat().st_size == 0:
            raise RuntimeError("LRAT normalizer produced no proof")

        base.atomic_write_text(
            lean_source,
            base.render_lean(
                namespace,
                stem,
                core_clauses,
                trimmed_lrat.name,
            ),
        )

        lean_result: dict[str, Any] | None = None
        if not args.skip_lean:
            lean_env = base.lean427_environment(lean_dir)
            base.assert_lean427(lean_dir, lean_env)
            base.acquire_build_lock(build_lock)
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
                        os.path.relpath(lean_source, lean_dir),
                    ],
                    cwd=lean_dir,
                    timeout_seconds=args.timeout_seconds,
                    env=lean_env,
                )
            finally:
                build_lock.unlink(missing_ok=True)
                lock_held = False
            if lean_result["exit_code"] != 0:
                raise RuntimeError(
                    f"Lean trimmed-core LRAT replay failed: exit "
                    f"{lean_result['exit_code']}"
                )
            if "sorryAx" in lean_result["output"]:
                raise RuntimeError("Lean replay unexpectedly depends on sorryAx")

        published = [
            (dense_cnf, final_dense_cnf, "dense_cnf"),
            (drat, final_drat, "drat"),
            (core_cnf, final_core_cnf, "trimmed_core_cnf"),
            (
                original_raw_lrat,
                final_original_raw_lrat,
                "original_numbering_raw_lrat",
            ),
            (trimmed_lrat, final_trimmed_lrat, "trimmed_lrat"),
            (lean_source, final_lean, "lean"),
            (cadical_log, final_cadical_log, "cadical_log"),
            (trim_log, final_trim_log, "drat_trim_log"),
            (normalize_log, final_normalize_log, "normalize_log"),
        ]
        if core_extract is not None:
            published.extend(
                [
                    (core_drat, final_core_drat, "trimmed_core_drat"),
                    (
                        core_raw_lrat,
                        final_core_raw_lrat,
                        "trimmed_core_numbering_raw_lrat",
                    ),
                    (
                        core_extract_log,
                        final_core_extract_log,
                        "core_drat_extract_log",
                    ),
                    (
                        core_verify_log,
                        final_core_verify_log,
                        "core_drat_verify_log",
                    ),
                ]
            )
        payload = {
            "schema": (
                "p97-unique4-exact-two-trimmed-reduced-core-certificate-v1"
            ),
            "epistemic_status": (
                "NATIVE-CHECKER VERIFIED LRAT UNSAT FOR THE HASHED FIXED-N "
                "TRIMMED CNF; NO SOURCE-TO-CNF BRIDGE"
                if lean_result is not None
                else "DRAT-TRIM VERIFIED AND TRIMMED LRAT EMITTED; "
                "LEAN REPLAY SKIPPED"
            ),
            "claim_scope": (
                "This certifies only the emitted fixed-n trimmed CNF. It does "
                "not prove that the live geometric source satisfies that CNF "
                "and does not close a production sorry."
            ),
            "native_checker_trust_boundary": [
                "Lean.ofReduceBool",
                "Lean.trustCompiler",
            ],
            "self_test": args.self_test,
            "input_provenance": input_provenance,
            "retained_family_count": len(retained),
            "retained_families": sorted(retained),
            "retained_clause_count_by_family": dict(
                sorted(family_counts.items())
            ),
            "dense_variable_renaming": {
                "policy": (
                    "sorted_used_source_variables_to_contiguous_one_based_ids"
                ),
                "dense_variable_count": len(dense_variable_map),
                "old_to_new": [
                    [old_variable, new_variable]
                    for old_variable, new_variable in sorted(
                        dense_variable_map.items()
                    )
                ],
            },
            "clause_numbering": {
                "original_numbering_raw_lrat_addresses": "dense_cnf",
                "selected_raw_lrat_artifact": selected_raw_lrat_artifact,
                "selected_raw_lrat_addresses": selected_raw_lrat_domain,
                "selected_raw_lrat_base_clause_count": (
                    selected_raw_lrat_base_count
                ),
                "trimmed_lrat_replay_target": "trimmed_core_cnf",
                "direct_clause_numbering_match": (
                    direct_clause_numbering_match
                ),
                "core_to_input_clause_id": core_to_input,
                "base_clause_id_remapping": "none",
                "validation": (
                    "Every trimmed-core clause was occurrence-matched to the "
                    "dense input by signed-literal multiset. If dense and "
                    "trimmed-core numbering differ, drat-trim regenerates and "
                    "verifies a core-relative DRAT/LRAT before lemma-id "
                    "normalization. Base clause ids are never remapped. "
                    + (
                        "Lean replay validated the selected numbering against "
                        "trimmed_core_cnf."
                        if lean_result is not None
                        else "Lean replay against trimmed_core_cnf was skipped."
                    )
                ),
            },
            "counts": {
                "dense_variable_count": dense_variable_count,
                "dense_clause_count": len(dense_clauses),
                "trimmed_variable_count": core_variable_count,
                "trimmed_clause_count": len(core_clauses),
            },
            "artifacts": {
                name: artifact_record(path, final)
                for path, final, name in published
            },
            "generator": {
                "path": str(Path(__file__).resolve()),
                "sha256": base.sha256(Path(__file__).resolve()),
            },
            "base_materializer": {
                "path": str(Path(base.__file__).resolve()),
                "sha256": base.sha256(Path(base.__file__).resolve()),
            },
            "normalizer": {
                "path": str(NORMALIZER),
                "sha256": base.sha256(NORMALIZER),
            },
            "solver": {
                "path": str(solver),
                "sha256": base.sha256(solver),
            },
            "drat_trim": {
                "path": str(drat_trim),
                "sha256": base.sha256(drat_trim),
            },
            "cadical_run": {
                **cadical,
                "output": artifact_record(cadical_log, final_cadical_log),
            },
            "drat_trim_run": {
                **trim,
                "output": artifact_record(trim_log, final_trim_log),
            },
            "normalizer_run": {
                **normalize,
                "output": artifact_record(
                    normalize_log,
                    final_normalize_log,
                ),
            },
            "core_drat_extract_run": (
                None
                if core_extract is None
                else {
                    **core_extract,
                    "output": artifact_record(
                        core_extract_log,
                        final_core_extract_log,
                    ),
                }
            ),
            "core_drat_verify_run": (
                None
                if core_verify is None
                else {
                    **core_verify,
                    "output": artifact_record(
                        core_verify_log,
                        final_core_verify_log,
                    ),
                }
            ),
            "lean_replay": lean_result,
        }
        base.atomic_write_json(report_path, payload)

        for source, target, _name in published:
            os.replace(source, target)
        os.replace(report_path, final_report)
        print(
            json.dumps(
                {
                    "status": payload["epistemic_status"],
                    "report": str(final_report),
                    "dense_clause_count": len(dense_clauses),
                    "trimmed_clause_count": len(core_clauses),
                    "direct_clause_numbering_match": (
                        direct_clause_numbering_match
                    ),
                },
                indent=2,
                sort_keys=True,
            ),
            flush=True,
        )
    finally:
        if lock_held:
            build_lock.unlink(missing_ok=True)
        shutil.rmtree(stage, ignore_errors=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
