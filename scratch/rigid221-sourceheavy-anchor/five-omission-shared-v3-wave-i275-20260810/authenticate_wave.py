#!/usr/bin/env python3
"""Authenticate and summarize the 12-cell seeded five-omission CEGAR wave."""

from __future__ import annotations

from collections import Counter
from concurrent.futures import ProcessPoolExecutor
import hashlib
import json
from pathlib import Path

from census.card_head.source_faithful_five_omission_lean_export import (
    load_authenticated_run,
)


REPO_ROOT = Path(__file__).resolve().parents[3]
WAVE_ROOT = Path(__file__).resolve().parent
REPORT_PATH = WAVE_ROOT / "authenticated-aggregate.json"


def _stable(value: object) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def _authenticate(label: int) -> dict[str, object]:
    run = load_authenticated_run(REPO_ROOT, WAVE_ROOT / f"deleted-{label}", label)
    stages: Counter[str] = Counter()
    cores: Counter[str] = Counter()
    side_conditions: Counter[str] = Counter()
    minimum_rows: Counter[str] = Counter()
    clauses: list[tuple[int, ...]] = []
    for record in run.records:
        stages[record["detector_stage"]] += 1
        certificate = record["certificate"]
        cores[_stable({"stage": record["detector_stage"], "core": certificate["core"]})] += 1
        side_conditions[
            _stable(
                {
                    "stage": record["detector_stage"],
                    "side_conditions": certificate["side_conditions"],
                }
            )
        ] += 1
        minimum_rows[str(certificate["minimum"]["minimum_row_count"])] += 1
        clauses.append(tuple(record["learned_clause"]))

    clause_payload = _stable([list(clause) for clause in clauses]).encode()
    return {
        "deleted_label": label,
        "status": run.summary["status"],
        "discovery_verdict": run.summary["discovery_verdict"],
        "terminal_verdict": run.summary["terminal_verdict"],
        "terminal_proof_verified": run.summary["terminal_proof_verified"],
        "record_count": len(run.records),
        "bootstrap_record_count": len(run.bootstrap_records),
        "raw_base_clause_count": run.summary["raw_base_clause_count"],
        "base_clause_count": run.summary["base_clause_count"],
        "current_clause_count": run.summary["current_clause_count"],
        "shared_bank": run.summary["shared_bank"],
        "journal_artifact": run.journal_artifact,
        "terminal_record_sha256": run.terminal_record_sha256,
        "stage_counts": dict(sorted(stages.items())),
        "core_counts": dict(sorted(cores.items())),
        "side_condition_counts": dict(sorted(side_conditions.items())),
        "minimum_row_counts": dict(sorted(minimum_rows.items())),
        "learned_clauses": [list(clause) for clause in clauses],
        "ordered_local_clause_list_sha256": hashlib.sha256(clause_payload).hexdigest(),
    }


def _merged_counter(cells: list[dict[str, object]], key: str) -> Counter[str]:
    result: Counter[str] = Counter()
    for cell in cells:
        result.update(cell[key])
    return result


def main() -> None:
    with ProcessPoolExecutor(max_workers=4) as executor:
        cells = list(executor.map(_authenticate, range(12)))

    all_clauses = [
        tuple(clause)
        for cell in cells
        for clause in cell["learned_clauses"]
    ]
    unique_clauses = sorted(set(all_clauses))
    bank_hashes = {
        cell["shared_bank"]["artifact_sha256"]
        for cell in cells
    }
    report = {
        "schema": "p97_exact12_five_omission_seeded_wave_authentication.v1",
        "wave_root": str(WAVE_ROOT.relative_to(REPO_ROOT)),
        "cell_count": len(cells),
        "all_cells_authenticated": len(cells) == 12,
        "status_counts": dict(Counter(cell["status"] for cell in cells)),
        "terminal_proof_count": sum(
            cell["terminal_proof_verified"] is True for cell in cells
        ),
        "local_record_count": len(all_clauses),
        "unique_local_clause_count": len(unique_clauses),
        "duplicate_local_clause_count": len(all_clauses) - len(unique_clauses),
        "stage_counts": dict(sorted(_merged_counter(cells, "stage_counts").items())),
        "minimum_row_counts": dict(
            sorted(_merged_counter(cells, "minimum_row_counts").items())
        ),
        "core_counts": dict(
            _merged_counter(cells, "core_counts").most_common()
        ),
        "side_condition_counts": dict(
            _merged_counter(cells, "side_condition_counts").most_common()
        ),
        "shared_bank_artifact_sha256": next(iter(bank_hashes))
        if len(bank_hashes) == 1
        else None,
        "shared_bank_hashes_agree": len(bank_hashes) == 1,
        "cells": cells,
    }
    REPORT_PATH.write_text(_stable(report) + "\n", encoding="utf-8")
    print(
        _stable(
            {
                "report": str(REPORT_PATH.relative_to(REPO_ROOT)),
                "all_cells_authenticated": report["all_cells_authenticated"],
                "status_counts": report["status_counts"],
                "terminal_proof_count": report["terminal_proof_count"],
                "local_record_count": report["local_record_count"],
                "unique_local_clause_count": report["unique_local_clause_count"],
                "stage_counts": report["stage_counts"],
            }
        )
    )


if __name__ == "__main__":
    main()
