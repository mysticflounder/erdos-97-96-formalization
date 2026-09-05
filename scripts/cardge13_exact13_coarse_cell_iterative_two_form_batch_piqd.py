#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Run exact-13 PIQD CEGAR with complete one/two-form batches per model."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_coarse_cell_batch_piqd as one_form_batch
import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_coarse_cell_two_form_batch_piqd as two_form_batch
import cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd as resume
import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-coarse-cell-iterative-two-form-batch-piqd/v1"
SELF_PATH = (
    "scripts/cardge13_exact13_coarse_cell_iterative_two_form_batch_piqd.py"
)


class IterativeBatchError(RuntimeError):
    """The run manifest, PIQD response, or generated batch is malformed."""


def novel_batch(
    cell: dict[str, object],
    order: tuple[int, ...],
    seen_cuts: set[str],
) -> tuple[
    tuple[tuple[dict[str, object], str], ...],
    int,
    int,
]:
    """Return every novel one/two-form clause exposed by one decoded model."""
    one_form = one_form_batch.all_incidence_path_conflicts(cell, order)
    two_form = two_form_batch.all_two_form_incidence_conflicts(cell, order)
    all_rows = one_form_batch.unique_conflict_cuts((*one_form, *two_form))
    novel = tuple((conflict, cut) for conflict, cut in all_rows if cut not in seen_cuts)
    return novel, len(one_form), len(two_form)


def _assert_chunks(
    *,
    session_id: str,
    commands: tuple[str, ...],
    expected_commands: int,
    tmp_root: Path,
    stem: str,
) -> tuple[list[dict[str, Any]], int]:
    assertions: list[dict[str, Any]] = []
    for chunk_index, chunk in enumerate(base.command_chunks(commands)):
        chunk_path = tmp_root / f"{stem}-chunk-{chunk_index:03d}.smt2"
        chunk_path.write_bytes(("\n".join(chunk) + "\n").encode("ascii"))
        asserted = base.core._run_json(
            [
                "session",
                "assert",
                session_id,
                "--expect-commands",
                str(expected_commands),
                "--file",
                str(chunk_path),
            ]
        )
        expected_commands += len(chunk)
        if asserted.get("commands") != expected_commands:
            raise IterativeBatchError("PIQD command count differs from emitted journal")
        assertions.append(asserted)
    return assertions, expected_commands


def run_piqd_batched(
    path: Path,
    commands: tuple[str, ...],
    seed_cuts: tuple[str, ...],
    solvers: tuple[str, ...],
    timeout_ms: int,
    *,
    label: str,
    order: tuple[int, ...],
    max_batches: int,
) -> list[dict[str, Any]]:
    """Solve and add every novel one/two-form conflict after each SAT model."""
    if max_batches < 0:
        raise ValueError("max_batches must be nonnegative")
    tmp_root = path.parent.parent / "tmp"
    tmp_root.mkdir(parents=True, exist_ok=True)
    results: list[dict[str, Any]] = []
    for solver in solvers:
        created = base.core._run_json(
            ["session", "new", "--solver", solver, "--lane", "smt", "--label", label]
        )
        session_id = created.get("id")
        if type(session_id) is not str or not session_id:
            raise IterativeBatchError("PIQD did not return a session id")
        record: dict[str, Any] = {"solver": solver, "created": created}
        try:
            assertions, expected_commands = _assert_chunks(
                session_id=session_id,
                commands=commands,
                expected_commands=0,
                tmp_root=tmp_root,
                stem=f"{path.stem}-{solver}-base",
            )
            iterations: list[dict[str, Any]] = []
            seen_cuts = set(seed_cuts)
            cegar_status = "BATCH_BUDGET"
            solved: dict[str, Any] = {}
            for index in range(max_batches + 1):
                solved = base.core._run_json(
                    ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)],
                    transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
                )
                iteration: dict[str, Any] = {"index": index, "solved": solved}
                iterations.append(iteration)
                if solved.get("status") != "SAT":
                    cegar_status = str(solved.get("status"))
                    break
                replay = solved.get("model_replay")
                model = solved.get("model")
                if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                    raise IterativeBatchError("PIQD SAT model did not replay")
                if not isinstance(model, str):
                    raise IterativeBatchError("PIQD SAT model is missing")
                cell = base.decode_model(model)
                batch, one_count, two_count = novel_batch(cell, order, seen_cuts)
                iteration.update(
                    cell=cell,
                    one_form_conflict_count=one_count,
                    two_form_pair_count=two_count,
                    new_cut_count=len(batch),
                    new_conflicts=[
                        {"linear_conflict": conflict, "cut": cut}
                        for conflict, cut in batch
                    ],
                )
                if not batch:
                    if one_count or two_count:
                        raise IterativeBatchError(
                            "PIQD returned a model excluded by an existing batch"
                        )
                    cegar_status = "SAT_SURVIVOR_ONE_TWO_FORM"
                    break
                if index == max_batches:
                    break
                cuts = tuple(cut for _conflict, cut in batch)
                batch_assertions, expected_commands = _assert_chunks(
                    session_id=session_id,
                    commands=cuts,
                    expected_commands=expected_commands,
                    tmp_root=tmp_root,
                    stem=f"{path.stem}-{solver}-batch-{index:03d}",
                )
                seen_cuts.update(cuts)
                iteration["assertions"] = batch_assertions
            record.update(
                assertions=assertions,
                iterations=iterations,
                cegar_status=cegar_status,
                solved=solved,
                receipts=base.core._run_json(["session", "receipts", session_id]),
            )
        finally:
            record["closed"] = base.core._run_json(["session", "close", session_id])
        results.append(record)
    return results


def compact_solved(solved: dict[str, Any]) -> dict[str, object]:
    """Retain solver and replay custody without embedding the full model text."""
    return {
        key: solved.get(key)
        for key in (
            "status",
            "solve_index",
            "solve_ms",
            "result_sha256",
            "solver_sha256",
            "solver_signature",
            "timeout_ms",
            "model_replay",
        )
        if key in solved
    }


def compact_record(record: dict[str, Any]) -> dict[str, object]:
    """Compact one PIQD record while retaining every generated certificate."""
    raw_iterations = record.get("iterations")
    if not isinstance(raw_iterations, list):
        raise IterativeBatchError("PIQD record has no iterations array")
    iterations: list[dict[str, object]] = []
    for raw in raw_iterations:
        if not isinstance(raw, dict) or not isinstance(raw.get("solved"), dict):
            raise IterativeBatchError("PIQD iteration is malformed")
        compact = {key: value for key, value in raw.items() if key != "solved"}
        compact["solved"] = compact_solved(raw["solved"])
        iterations.append(compact)
    receipts = record.get("receipts")
    receipt_summary: dict[str, object] = {}
    if isinstance(receipts, dict):
        receipt_summary = {
            key: receipts.get(key)
            for key in ("count", "journal_path", "lane", "receipts_path", "session_id")
            if key in receipts
        }
    closed = record.get("closed")
    return {
        "solver": record.get("solver"),
        "created": record.get("created"),
        "assertions": record.get("assertions"),
        "iterations": iterations,
        "cegar_status": record.get("cegar_status"),
        "solved": iterations[-1]["solved"] if iterations else {},
        "receipts": receipt_summary,
        "closed": closed,
    }


def load_run_manifest(
    repo_root: Path, path: Path
) -> tuple[dict[str, Any], str, Path]:
    """Authenticate the standard dependencies plus this batch runner."""
    manifest, manifest_sha256, run_root = coarse.load_run_manifest(repo_root, path)
    digests = manifest.get("source_digests")
    producer = repo_root / SELF_PATH
    if not isinstance(digests, dict):
        raise IterativeBatchError("run manifest has no source digest map")
    if digests.get(SELF_PATH) != coarse.sha256_bytes(producer.read_bytes()):
        raise IterativeBatchError("run manifest does not anchor the batch runner")
    return manifest, manifest_sha256, run_root


def main() -> int:
    """Run one catalog cell with full one/two-form batches through PIQD."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--run-manifest", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    parser.add_argument("--seed-event", action="append", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-batches", type=int, default=20)
    args = parser.parse_args()

    repo_root = args.repo_root.resolve()
    _manifest, manifest_sha256, run_root = load_run_manifest(
        repo_root, args.run_manifest
    )
    cells = coarse.catalog_cells()
    if args.cell_index < 0 or args.cell_index >= len(cells):
        parser.error(f"--cell-index must lie in [0,{len(cells)})")
    cell = cells[args.cell_index]
    out_path = coarse.require_under_run_root(args.out, run_root, "journal")
    event_path = coarse.require_under_run_root(args.event, run_root, "event")
    seed_events = tuple(args.seed_event)
    commands, bank = coarse.build_commands(cell, seed_events)
    seed_cuts, seed_sources = resume.seed_cuts(seed_events)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    coarse.write_new(out_path, journal)
    order = base.DIRECT_ORDER if cell.orientation == "direct" else base.MIRROR_ORDER
    solves = (
        run_piqd_batched(
            out_path,
            commands,
            seed_cuts,
            tuple(args.solver or ()),
            args.timeout_ms,
            label=f"cardge13-exact13-iterative-batch-{cell.cell_id}",
            order=order,
            max_batches=args.max_batches,
        )
        if args.solver
        else []
    )
    report: dict[str, object] = {
        "schema": SCHEMA,
        "claim_scope": {
            "classification": "one-formula-coarse-cell-one-two-form-batches",
            "source_coverage": False,
            "theorem_promotion": False,
        },
        "cell": cell.to_json(args.cell_index),
        "base_conflict_count": len(bank),
        "seed_cut_count": len(seed_cuts),
        "seed_sources": seed_sources,
        "command_count": len(commands),
        "journal": str(out_path.relative_to(repo_root)),
        "journal_sha256": coarse.sha256_bytes(journal),
        "run_manifest_sha256": manifest_sha256,
        "solves": [compact_record(record) for record in solves],
    }
    report["event_sha256"] = coarse.sha256_bytes(coarse.canonical_json_bytes(report))
    coarse.write_new(event_path, coarse.canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "cell": cell.cell_id,
                "seed_cuts": len(seed_cuts),
                "statuses": [row.get("cegar_status") for row in solves],
                "batches": [len(row.get("iterations", ())) for row in solves],
                "new_cuts": [
                    sum(int(item.get("new_cut_count", 0)) for item in row["iterations"])
                    for row in solves
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
