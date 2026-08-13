#!/usr/bin/env python3
"""Launch one capped sequential exact12 structural PIQD discovery run."""

from __future__ import annotations

import argparse
import os
from collections.abc import Sequence
from pathlib import Path

MAX_ITERATIONS = 100
MAX_TIMEOUT_SECONDS = 3600

for _name in (
    "OMP_NUM_THREADS",
    "OPENBLAS_NUM_THREADS",
    "MKL_NUM_THREADS",
    "VECLIB_MAXIMUM_THREADS",
    "NUMEXPR_NUM_THREADS",
):
    os.environ[_name] = "1"


def _bounded_positive(value: str, *, maximum: int, name: str) -> int:
    try:
        parsed = int(value)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"{name} must be an integer") from exc
    if not 1 <= parsed <= maximum:
        raise argparse.ArgumentTypeError(f"{name} must lie in [1, {maximum}]")
    return parsed


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    parser.add_argument("--piqd-base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--piqd-journal-root", type=Path)
    parser.add_argument(
        "--max-iterations",
        type=lambda value: _bounded_positive(
            value, maximum=MAX_ITERATIONS, name="max-iterations"
        ),
        default=MAX_ITERATIONS,
    )
    parser.add_argument(
        "--timeout-seconds",
        type=lambda value: _bounded_positive(
            value, maximum=MAX_TIMEOUT_SECONDS, name="timeout-seconds"
        ),
        default=60,
    )
    parser.add_argument("--nice", type=int, choices=range(1, 20), default=10)
    parser.add_argument("--seed-journal", type=Path)
    args = parser.parse_args(argv)

    from census.card_head.exact12_next_row_structural_cegar import main as cegar_main

    routed = [
        "--repo-root",
        str(args.repo_root),
        "--workdir",
        str(args.workdir),
        "--cell-index",
        str(args.cell_index),
        "--solver-backend",
        "piqd",
        "--piqd-base-url",
        args.piqd_base_url,
        "--piqd-journal-root",
        str(args.piqd_journal_root or args.workdir / "piqd-discovery"),
        "--workers",
        "1",
        "--parallel-mode",
        "sequential",
        "--max-iterations",
        str(args.max_iterations),
        "--timeout-seconds",
        str(args.timeout_seconds),
        "--nice",
        str(args.nice),
    ]
    if args.seed_journal is not None:
        routed.extend(("--seed-journal", str(args.seed_journal)))
    return cegar_main(routed)


if __name__ == "__main__":
    raise SystemExit(main())
