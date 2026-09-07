#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
"""Continue the exact13 guarded witnessed-Key CEGAR frontier for wave6.

Wave5 is the audited producer.  This successor pins its final 56,000-cut
bank, preserves the guarded root and historical StrongValid parent semantics,
and delegates the live SAT loop to the audited wave1 machinery.  A model with
no one/two-form incidence cancellation is not retained as a survivor until a
fresh PIQD quotient-cone query covers all 1,430 strict forms and its readback
is replayed as either exact rational cancellation or an exact rational dual.
The result remains formula-scoped solver discovery evidence only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import time
from collections import Counter
from fractions import Fraction
from pathlib import Path

import cardge13_exact13_witnessed_key_guarded_cegar_wave5_piqd as wave5
import solve_exact13_quotient_cones as quotient_cones

LANE = "exact13-witnessed-key-guarded-cegar-wave6-20260906"
RUN_ROOT = Path("scratch/runs") / LANE / "run-0001"
WAVE5_RUN = Path("scratch/runs/exact13-witnessed-key-guarded-cegar-wave5-20260906/run-0001")
WAVE5_ROOT_SHA256 = "238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f"
WAVE5_BANK_SHA256 = "ed2bf13c87c5969be1b3ff45711a37fd7fc2346dfb1402122549141088f74f11"
IMPORTED_CUT_COUNT = 56_000
WAVE2_CUT_COUNT = 6_000
WAVE5_NEW_CUT_COUNT = 20_000
EXPECTED_GUARDED_COUNT = 1_815
EXPECTED_ROOT_VARIABLES = 432
EXPECTED_ROOT_CLAUSES = 31_283
EXPECTED_WAVE2_OUTSIDE_STRONGVALID = 4_431
EXPECTED_WAVE2_STRONGVALID = 1_569
EXPECTED_WAVE5_IMPORTED_STRONGVALID = 50_000
EXPECTED_NEW_MODEL_STRONGVALID = 20_001
EXPECTED_STRICT_FORM_COUNT = 1_430
BASE_HEAD = "fd020fbb3255253b07ffc8229ca6b2c7883ff1d1"

SCHEMA = "cardge13-exact13-witnessed-key-guarded-cegar-wave6-piqd/v1"
ROOT_SCHEMA = "cardge13-exact13-witnessed-key-effective-root-wave6/v1"
STATE_SCHEMA = "cardge13-exact13-witnessed-key-cegar-state-wave6/v1"
CUSTODY_SCHEMA = "cardge13-exact13-witnessed-key-cegar-custody-wave6/v1"
MIGRATION_SCHEMA = "cardge13-exact13-witnessed-key-cut-migration-wave6/v1"
NO_EXACT_KEY_ENUMERATION_BLOCKS = True
NO_EXISTENTIAL_WITNESS_CUT_VARIABLES = True
ACTIVE_DIAGNOSTIC_ROOT: Path | None = None
ACTIVE_CONE_TIMEOUT_MS = 120_000
ACTIVE_CONE_SOLVER = "cvc5"
_DIAGNOSTIC_CACHE: dict[str, dict[str, object]] = {}

root = wave5.root
wave3 = wave5.wave3
guarded_cnf = wave5.guarded_cnf


def sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def reseal(value: dict[str, object]) -> dict[str, object]:
    return wave5.reseal(value)


def source_bindings(source: Path) -> dict[str, str]:
    wave4 = wave5.wave4
    paths = (
        source,
        wave4.STRONG_SOURCE,
        Path(__file__),
        Path(__file__).with_name("cardge13_exact13_witnessed_key_guarded_cegar_wave5_piqd.py"),
        Path(wave4.__file__),
        Path(wave4.wave3.__file__),
        Path(wave4.root.__file__),
        wave4.WAVE1_SCRIPT,
        Path(wave4.wave1.paths.__file__),
        Path(wave4.wave1.pairs.__file__),
        Path(wave4.wave1.legacy.__file__),
        Path(wave4.boundary.__file__),
        Path("scripts/cardge13_exact13_witnessed_key_cegar_wave2_piqd.py"),
    )
    relative = {str(path.resolve().relative_to(Path.cwd())) for path in paths}
    return {path: sha256(Path(path).read_bytes()) for path in sorted(relative)}


def configure_wave5_adapter() -> None:
    """Retarget wave5's immutable-input globals to the wave5 final bank."""
    wave5.LANE = LANE
    wave5.RUN_ROOT = RUN_ROOT
    wave5.WAVE4_RUN = WAVE5_RUN
    wave5.WAVE4_ROOT_SHA256 = WAVE5_ROOT_SHA256
    wave5.WAVE4_BANK_SHA256 = WAVE5_BANK_SHA256
    wave5.IMPORTED_CUT_COUNT = IMPORTED_CUT_COUNT
    wave5.WAVE4_NEW_CUT_COUNT = WAVE5_NEW_CUT_COUNT
    wave5.WAVE2_CUT_COUNT = WAVE2_CUT_COUNT
    wave5.EXPECTED_WAVE4_STRONGVALID = EXPECTED_WAVE5_IMPORTED_STRONGVALID
    wave5.wave4.EXPECTED_WAVE3_STRONGVALID = EXPECTED_WAVE5_IMPORTED_STRONGVALID
    wave5.BASE_HEAD = BASE_HEAD
    wave5.SCHEMA = SCHEMA
    wave5.ROOT_SCHEMA = ROOT_SCHEMA
    wave5.STATE_SCHEMA = STATE_SCHEMA
    wave5.CUSTODY_SCHEMA = CUSTODY_SCHEMA
    wave5.MIGRATION_SCHEMA = MIGRATION_SCHEMA
    wave5.source_bindings = source_bindings
    wave5.wave4.source_bindings = source_bindings


def configure_delegate() -> None:
    configure_wave5_adapter()
    wave5.configure_delegate()
    wave5.wave4.wave1.source_bindings = source_bindings
    wave5.wave4.source_bindings = source_bindings


def _linear_sum(terms: tuple[str, ...]) -> str:
    if not terms:
        return "0"
    if len(terms) == 1:
        return terms[0]
    return f"(+ {' '.join(terms)})"


def _all_form_vectors(cell: dict[str, object], order: tuple[int, ...]):
    w1 = wave5.wave4.wave1
    rows = w1.cell_rows(cell)
    roots = w1.legacy.edge_roots_for_rows(rows)
    forms = tuple(w1.legacy.kalmanson_forms(order))
    if len(forms) != EXPECTED_STRICT_FORM_COUNT:
        raise w1.AuditError(f"strict form family drifted: {len(forms)}")
    vectors = tuple(w1.projected_vector(form, roots) for form in forms)
    return rows, forms, vectors


def _cone_query(vectors, kind: str):
    coordinates = sorted({edge for vector in vectors for edge, _ in vector})
    if kind == "cancellation":
        names = tuple(f"w_{i}" for i in range(len(vectors)))
        commands = ["(set-logic QF_LRA)"]
        for name in names:
            commands.extend((f"(declare-const {name} Real)", f"(assert (>= {name} 0))"))
        commands.append(f"(assert (= {_linear_sum(names)} 1))")
        for edge in coordinates:
            terms = tuple(
                f"(* {dict(vector)[edge]} {names[index]})"
                for index, vector in enumerate(vectors)
                if edge in dict(vector)
            )
            commands.append(f"(assert (= {_linear_sum(terms)} 0))")
        return tuple(commands), names
    if kind == "dual":
        names = tuple(f"q_{i}" for i in range(len(coordinates)))
        by_edge = dict(zip(coordinates, names, strict=True))
        commands = ["(set-logic QF_LRA)"]
        for name in names:
            commands.append(f"(declare-const {name} Real)")
        for vector in vectors:
            terms = tuple(f"(* {coefficient} {by_edge[edge]})" for edge, coefficient in vector)
            commands.append(f"(assert (>= {_linear_sum(terms)} 1))")
        return tuple(commands), names
    raise ValueError(f"unknown cone query kind: {kind}")


def _exact_replay(vectors, kind: str, values: tuple[Fraction, ...]) -> dict[str, object]:
    if kind == "cancellation":
        if len(values) != len(vectors) or any(value < 0 for value in values) or sum(values) != 1:
            raise wave5.wave4.wave1.AuditError("cone cancellation readback is not a probability vector")
        total = Counter()
        for vector, weight in zip(vectors, values, strict=True):
            for edge, coefficient in vector:
                total[edge] += coefficient * weight
        if any(total.values()):
            raise wave5.wave4.wave1.AuditError("cone cancellation exact replay is nonzero")
        return {
            "kind": "positive_cancellation",
            "weights": [[index, str(value)] for index, value in enumerate(values) if value],
            "all_1430_forms_replayed": True,
        }
    coordinates = sorted({edge for vector in vectors for edge, _ in vector})
    if len(values) != len(coordinates):
        raise wave5.wave4.wave1.AuditError("cone dual readback dimension drifted")
    by_edge = dict(zip(coordinates, values, strict=True))
    gaps = [sum((coefficient * by_edge[edge] for edge, coefficient in vector), Fraction(0)) for vector in vectors]
    if not gaps or min(gaps) < 1:
        raise wave5.wave4.wave1.AuditError("cone rational dual failed exact replay")
    return {
        "kind": "rational_dual",
        "coordinates": [list(edge) for edge in coordinates],
        "values": [str(value) for value in values],
        "minimum_gap": str(min(gaps)),
        "all_1430_forms_replayed": True,
    }


def _run_cone_query(run_root: Path, vectors, kind: str, timeout_ms: int, solver: str) -> dict[str, object]:
    w1 = wave5.wave4.wave1
    commands, names = _cone_query(vectors, kind)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    path = run_root / "artifacts" / f"survivor-full-cone-{kind}.smt2"
    w1.write_once(path, journal)
    created = w1.run_piqc(["session", "new", "--solver", solver, "--lane", "smt", "--label", f"{LANE}-{kind}"])
    session_id = created.get("id")
    if not isinstance(session_id, str) or not session_id:
        raise w1.AuditError("PIQD did not create cone session")
    try:
        asserted = w1.run_piqc(["session", "assert", session_id, "--expect-commands", "0", "--file", str(path)])
        if asserted.get("commands") != len(commands):
            raise w1.AuditError("PIQD cone command count drifted")
        value_args = [item for name in names for item in ("--value", name)]
        solved = w1.run_piqc(
            ["session", "solve", session_id, "--timeout-ms", str(timeout_ms), *value_args],
            transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
        )
        receipts = w1.run_piqc(["session", "receipts", session_id])
        result: dict[str, object] = {
            "kind": kind,
            "strict_form_count": len(vectors),
            "journal": str(path),
            "journal_sha256": sha256(journal),
            "command_count": len(commands),
            "created": created,
            "asserted": asserted,
            "solved": solved,
            "receipts": receipts,
        }
        if solved.get("status") == "SAT":
            values_text = solved.get("values")
            if not isinstance(values_text, str):
                raise w1.AuditError("PIQD cone SAT result omitted values")
            values = tuple(quotient_cones.read_values(values_text, names))
            result["certificate"] = _exact_replay(vectors, kind, values)
        return result
    finally:
        w1.run_piqc(["session", "close", session_id])


def full_cone_diagnostic(run_root: Path, cell: dict[str, object], order: tuple[int, ...], timeout_ms: int, solver: str):
    """Run both complete 1,430-form cone branches and retain exact evidence."""
    cache_key = canonical({"cell": cell, "order": order}).decode()
    if cache_key in _DIAGNOSTIC_CACHE:
        return _DIAGNOSTIC_CACHE[cache_key]
    _rows, _forms, vectors = _all_form_vectors(cell, order)
    cancellation = _run_cone_query(run_root, vectors, "cancellation", timeout_ms, solver)
    if cancellation.get("solved", {}).get("status") == "SAT":
        selected = cancellation
    else:
        selected = _run_cone_query(run_root, vectors, "dual", timeout_ms, solver)
    if "certificate" not in selected:
        raise wave5.wave4.wave1.AuditError("complete cone diagnostic retained no exact certificate")
    event = wave5.wave4.wave1.seal({
        "schema": f"{SCHEMA}/full-cone/v1",
        "kind": "complete-1430-form-quotient-cone-diagnostic",
        "formula_scope_only": True,
        "no_cut_learned": True,
        "solver": solver,
        "strict_form_count": len(vectors),
        "all_strict_forms_included": len(vectors) == EXPECTED_STRICT_FORM_COUNT,
        "cancellation": cancellation,
        "selected_exact_certificate": selected["certificate"],
    })
    wave5.wave4.wave1.atomic_json(run_root / "events/full-cone-diagnostic.json", event)
    _DIAGNOSTIC_CACHE[cache_key] = event
    return event


def find_conflict_after_complete_diagnostic(cell: dict[str, object], order: tuple[int, ...]):
    """Finish the full cone diagnostic before wave1 labels a model a survivor."""
    conflict = _ORIGINAL_FIND_CONFLICT(cell, order)
    if conflict is None:
        if ACTIVE_DIAGNOSTIC_ROOT is None:
            raise wave5.wave4.wave1.AuditError("cone diagnostic root is not active")
        full_cone_diagnostic(
            ACTIVE_DIAGNOSTIC_ROOT, cell, order, ACTIVE_CONE_TIMEOUT_MS, ACTIVE_CONE_SOLVER
        )
    return conflict


_ORIGINAL_FIND_CONFLICT = wave5.wave4.wave1.find_conflict


def _piqc_command(arguments: list[str]) -> list[str]:
    command = ["/Users/adam/bin/piqc"]
    server = os.environ.get("EXACT13_PIQD_SERVER")
    if server:
        command.extend(("--server", server))
    return command + arguments


def _isolated_run_piqc(arguments: list[str], *, transport_timeout: float = 180.0) -> dict[str, object]:
    completed = subprocess.run(
        _piqc_command(arguments), check=False, capture_output=True, text=True, timeout=transport_timeout
    )
    if completed.returncode != 0:
        raise wave5.wave4.wave1.AuditError(
            f"piqc {' '.join(arguments[:3])} failed: {completed.stderr[:1000]}"
        )
    value = json.loads(completed.stdout)
    if not isinstance(value, dict):
        raise wave5.wave4.wave1.AuditError("piqc response is not a JSON object")
    return value


def _isolated_export_piqd_session(session_id: str, path: Path) -> str:
    completed = subprocess.run(
        _piqc_command(["session", "export", session_id, "--out", str(path)]),
        check=False, capture_output=True, text=True, timeout=180.0,
    )
    if completed.returncode != 0:
        raise wave5.wave4.wave1.AuditError(f"piqc session export failed: {completed.stderr[:1000]}")
    return completed.stdout.strip()


def resume_import_if_complete(
    run_root: Path, _cnf: object, _projection: dict[str, object]
) -> dict[str, object] | None:
    """Reuse only a sealed, fully replayed import from an interrupted launch."""
    w1 = wave5.wave4.wave1
    event_path = run_root / "events/wave3-import-replay.json"
    bank_path = run_root / "events/cut-bank.jsonl"
    if not event_path.exists() or not bank_path.exists():
        return None
    report = json.loads(event_path.read_text())
    if not isinstance(report, dict):
        raise w1.AuditError("resume import report is malformed")
    w1._verify_seal(report, str(event_path))
    if report.get("source_root_sha256") != WAVE5_ROOT_SHA256:
        raise w1.AuditError("resume import root hash drifted")
    if report.get("immutable_imported_bank_sha256") != WAVE5_BANK_SHA256:
        raise w1.AuditError("resume import source bank hash drifted")
    if report.get("imported_cut_count") != IMPORTED_CUT_COUNT:
        raise w1.AuditError("resume import count drifted")
    if report.get("revalidated_cut_count") != IMPORTED_CUT_COUNT:
        raise w1.AuditError("resume import did not replay every cut")
    if report.get("all_zero_projections_replayed") is not True:
        raise w1.AuditError("resume import lacks zero-sum replay evidence")
    if sha256(bank_path.read_bytes()) != report.get("final_live_bank_sha256"):
        raise w1.AuditError("resume live bank hash drifted")
    if sum(1 for _line in bank_path.open()) != IMPORTED_CUT_COUNT:
        raise w1.AuditError("resume live bank count drifted")
    return report


def run(args: argparse.Namespace) -> dict[str, object]:
    global ACTIVE_CONE_SOLVER, ACTIVE_CONE_TIMEOUT_MS, ACTIVE_DIAGNOSTIC_ROOT
    configure_delegate()
    wave5.wave4.wave1.run_piqc = _isolated_run_piqc
    wave5.wave4.wave1.export_piqd_session = _isolated_export_piqd_session
    ancestry = subprocess.run(
        ["git", "merge-base", "--is-ancestor", BASE_HEAD, "HEAD"], check=False
    )
    if ancestry.returncode != 0:
        raise wave5.wave4.wave1.AuditError(
            f"recorded base {BASE_HEAD} is not an ancestor of current HEAD"
        )
    ACTIVE_DIAGNOSTIC_ROOT = RUN_ROOT
    ACTIVE_CONE_SOLVER = args.cone_solver
    ACTIVE_CONE_TIMEOUT_MS = args.solve_timeout_ms
    _DIAGNOSTIC_CACHE.clear()
    wave5.wave4.wave1.full_cone_diagnostic = full_cone_diagnostic
    wave5.wave4.wave1.find_conflict = find_conflict_after_complete_diagnostic
    started = time.monotonic()
    delegated_run = wave5.subprocess.run

    def recorded_base_for_legacy_head_check(command, *delegated_args, **delegated_kwargs):
        if command == ["git", "rev-parse", "HEAD"]:
            return subprocess.CompletedProcess(command, 0, stdout=f"{BASE_HEAD}\n", stderr="")
        return delegated_run(command, *delegated_args, **delegated_kwargs)

    wave5.subprocess.run = recorded_base_for_legacy_head_check
    delegated_import = wave5.wave4.import_wave3_frontier

    def resume_or_import(run_root, cnf, projection):
        resumed = resume_import_if_complete(run_root, cnf, projection)
        return resumed if resumed is not None else delegated_import(run_root, cnf, projection)

    wave5.wave4.import_wave3_frontier = resume_or_import
    try:
        result = wave5.run(args)
    finally:
        wave5.subprocess.run = delegated_run
        wave5.wave4.import_wave3_frontier = delegated_import
    total_elapsed = round(time.monotonic() - started, 3)
    result = dict(result)
    result.update({
        "base_head": BASE_HEAD,
        "imported_cut_count": IMPORTED_CUT_COUNT,
        "additional_refinement_budget": args.additional_refinements,
        "configured_loop_wall_seconds": args.wall_seconds,
        "loop_wall_elapsed_seconds": result.get("wall_elapsed_seconds"),
        "total_elapsed_seconds": total_elapsed,
        "strict_total_wall_compliance": total_elapsed <= args.wall_seconds,
        "wall_overrun_seconds": max(0.0, total_elapsed - args.wall_seconds),
        "historical_parent_partition_preserved": True,
        "cut_replay_scope": "every imported and new cut source/path/zero-sum replayed",
        "model_replay_scope": "every new model guarded root, Key.Valid, boundary, and StrongValid replayed",
        "complete_cone_diagnostic_scope": f"all {EXPECTED_STRICT_FORM_COUNT} strict forms with exact Fraction replay",
        "claim_boundary": "solver-only formula-scoped discovery; no Lean theorem or promoted UNSAT claim",
        "no_exact_key_enumeration_blocks": NO_EXACT_KEY_ENUMERATION_BLOCKS,
        "no_existential_witness_cut_variables": NO_EXISTENTIAL_WITNESS_CUT_VARIABLES,
        "root_identity": {
            "variables": EXPECTED_ROOT_VARIABLES,
            "clauses": EXPECTED_ROOT_CLAUSES,
            "guarded_clauses": EXPECTED_GUARDED_COUNT,
            "sha256": WAVE5_ROOT_SHA256,
        },
        "wave_data_generalization_checkpoint": {
            "wave": 6,
            "candidate_general_theorem": None,
            "outcome": "no stable new theorem candidate; retain formula-scoped cut schema",
        },
    })
    wave5.wave4.wave1.atomic_json(RUN_ROOT / "events/run.json", wave5.wave4.wave1.reseal(result))
    return result


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=wave5.wave4.wave1.DEFAULT_SOURCE)
    parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=wave5.wave4.wave1.DEFAULT_SOLVER)
    parser.add_argument("--cone-solver", default=wave5.wave4.wave1.DEFAULT_CONE_SOLVER)
    parser.add_argument("--additional-refinements", type=int, default=20_000)
    parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=3600.0)
    parser.add_argument("--finalize-existing", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    arguments = parse_args()
    configure_delegate()
    if arguments.finalize_existing:
        result = wave5.wave4.finalize_existing_run(arguments.source)
    else:
        result = run(arguments)
    print(canonical({key: result.get(key) for key in (
        "status", "root_variables", "root_clauses", "imported_cut_count",
        "refinement_count", "one_form_cuts", "two_form_cuts",
        "solve_count_this_invocation", "wall_elapsed_seconds",
        "total_elapsed_seconds", "strict_total_wall_compliance",
    )}).decode())
