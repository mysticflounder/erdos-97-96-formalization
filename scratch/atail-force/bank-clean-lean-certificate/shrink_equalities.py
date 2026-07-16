#!/usr/bin/env python3
"""Parallel exact-msolve shrinking of the retained bank-clean row core."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ANALYSIS = HERE / "analyze.py"
CHECKPOINT = HERE / "checkpoint.json"
OUTPUT = HERE / "equality_core.json"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--timeout", type=float, default=60.0)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument(
        "--start-checkpoint-core",
        action="store_true",
        help="start from the checkpoint equality core instead of all row-core equalities",
    )
    parser.add_argument("--exclude", action="append", default=[])
    args = parser.parse_args()

    analysis = load_module(ANALYSIS, "p97_bank_clean_equality_shrink")
    rows, by_label = analysis.canonical_rows()
    rows = tuple(
        row
        for row in rows
        if by_label[row.center] in analysis.EXPECTED_ROW_CORE_NAMES
    )
    named = analysis.named_generators(rows, by_label)
    variables = tuple(
        str(variable) for variable in analysis.oracle.variable_symbols(14)
    )

    def probe(proposal: tuple[int, ...]) -> dict[str, object]:
        started = time.monotonic()
        polynomials = tuple(named[index][1] for index in proposal)
        forward = analysis.oracle.run_msolve(
            variables, polynomials, timeout_s=args.timeout
        )
        reverse = (
            analysis.oracle.run_msolve(
                tuple(reversed(variables)), polynomials, timeout_s=args.timeout
            )
            if forward.verdict == "UNIT"
            else None
        )
        return {
            "unit": bool(
                forward.verdict == "UNIT"
                and reverse is not None
                and reverse.verdict == "UNIT"
            ),
            "forward": forward.verdict,
            "reverse": reverse.verdict if reverse is not None else "SKIPPED",
            "elapsed_seconds": time.monotonic() - started,
        }

    if args.start_checkpoint_core:
        checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
        start_names = {
            record["name"] for record in checkpoint["equality_core"]["generators"]
        }
    else:
        start_names = {name for name, _polynomial, _center in named}
    unknown = set(args.exclude) - start_names
    if unknown:
        raise RuntimeError(f"unknown excluded generators: {sorted(unknown)}")
    start_names -= set(args.exclude)
    retained = tuple(
        index
        for index, (name, _polynomial, _center) in enumerate(named)
        if name in start_names
    )
    rounds = []
    while True:
        results: dict[int, dict[str, object]] = {}
        with ThreadPoolExecutor(max_workers=args.workers) as executor:
            futures = {
                executor.submit(
                    probe,
                    tuple(index for index in retained if index != candidate),
                ): candidate
                for candidate in retained
            }
            for future in as_completed(futures):
                results[futures[future]] = future.result()
        deletable = [index for index in retained if results[index]["unit"]]
        chosen = deletable[0] if deletable else None
        rounds.append(
            {
                "retained_before": [named[index][0] for index in retained],
                "probes": {named[index][0]: results[index] for index in retained},
                "chosen_deletion": named[chosen][0] if chosen is not None else None,
            }
        )
        if chosen is None:
            break
        retained = tuple(index for index in retained if index != chosen)
        print(f"deleted {named[chosen][0]}; retained={len(retained)}", flush=True)

    document = {
        "schema": "p97-atail-bank-clean-equality-core-v1",
        "source_checkpoint_sha256": analysis.file_sha256(analysis.SOURCE),
        "source_row_assignment_sha256": analysis.EXPECTED_ROW_ASSIGNMENT_SHA256,
        "source_row_core_names": list(analysis.EXPECTED_ROW_CORE_NAMES),
        "source_row_core_polynomial_sha256": analysis.canonical_sha256(
            [polynomial for _name, polynomial, _center in named]
        ),
        "retained_indices": list(retained),
        "retained_generator_names": [named[index][0] for index in retained],
        "retained_polynomial_sha256": analysis.canonical_sha256(
            [named[index][1] for index in retained]
        ),
        "rounds": rounds,
        "classification": (
            "exact-msolve-unit-both-variable-orders-for-each-chosen-deletion"
        ),
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "output": str(args.output),
                "retained_count": len(retained),
                "retained_generator_names": document["retained_generator_names"],
            },
            indent=2,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
