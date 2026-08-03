#!/usr/bin/env python3
"""Round-6 exact-n15 Schoenberg-CND extension of the frozen round-5 runner.

This is an external Z3 experiment, not a Lean proof.  The base runner is
loaded only after its exact SHA-256 has been checked.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import importlib.util
import itertools
import json
import os
import sys
import time
from collections import Counter
from dataclasses import asdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable

import z3


HERE = Path(__file__).resolve().parent
BASE_DIR = HERE.parent / "round5-general-cegar"
BASE_RUNNER = BASE_DIR / "round5_cegar.py"
BASE_SCHEMA = BASE_DIR / "schema.json"
BASE_LOCK = BASE_DIR / "uv.lock"
OVERLAY_SCHEMA = HERE / "schema-overlay.json"
WRAPPER_PATH = Path(__file__).resolve()

EXPECTED_BASE_RUNNER_SHA256 = (
    "451aae82966ddea02fa81da2d656415cf4e942e9ba7b2eefc96c915f7d62e857"
)
SCHEMA_VERSION = 4
EDM_FAMILY = "four_point_schoenberg_balanced_cnd"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_frozen_base():
    actual = file_sha256(BASE_RUNNER)
    if actual != EXPECTED_BASE_RUNNER_SHA256:
        raise RuntimeError(
            "round-5 base runner drifted: "
            f"{actual} != {EXPECTED_BASE_RUNNER_SHA256}"
        )
    spec = importlib.util.spec_from_file_location("round5_frozen_cegar", BASE_RUNNER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load base runner: {BASE_RUNNER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


base = load_frozen_base()


def balanced_partitions(
    quadruple: tuple[int, int, int, int],
) -> tuple[tuple[tuple[int, int], tuple[int, int]], ...]:
    """The three b=(+1,+1,-1,-1) partitions, modulo replacing b by -b."""
    a, b, c, d = quadruple
    return (
        ((a, b), (c, d)),
        ((a, c), (b, d)),
        ((a, d), (b, c)),
    )


def schoenberg_constraint(
    squared_distance,
    positive_pair: tuple[int, int],
    negative_pair: tuple[int, int],
) -> z3.BoolRef:
    """Return b^T S b <= 0 after cancelling the common factor two.

    For b=+1 on ``positive_pair`` and b=-1 on ``negative_pair``, this is

      s(p0,p1) + s(n0,n1)
        <= s(p0,n0) + s(p0,n1) + s(p1,n0) + s(p1,n1).
    """
    p0, p1 = positive_pair
    n0, n1 = negative_pair
    return squared_distance(p0, p1) + squared_distance(n0, n1) <= (
        squared_distance(p0, n0)
        + squared_distance(p0, n1)
        + squared_distance(p1, n0)
        + squared_distance(p1, n1)
    )


class Encoding(base.Encoding):
    """Frozen schema-v3 encoding plus dimension-free four-point EDM cuts."""

    def _build(self) -> None:
        super()._build()
        self._build_four_point_schoenberg_balanced_cnd()

    def _build_four_point_schoenberg_balanced_cnd(self) -> None:
        for quadruple in itertools.combinations(base.POINTS, 4):
            for positive_pair, negative_pair in balanced_partitions(quadruple):
                self.add(
                    EDM_FAMILY,
                    schoenberg_constraint(self.s, positive_pair, negative_pair),
                )

    def serialize_model(self, model: z3.ModelRef) -> dict[str, object]:
        witness = super().serialize_model(model)
        witness["squared_distances"] = {
            f"{i}-{j}": self._value(model, value)
            for (i, j), value in sorted(self.squared_distance.items())
        }
        return witness


FIXED_CASES = {
    "paired_DDD": base.Case("paired", "DDD", 0, 1),
    "fresh_DDD": base.Case("fresh", "DDD", 0, 2, 1),
}


def provenance() -> dict[str, object]:
    return {
        "target": base.TARGET,
        "cardinality": 15,
        "schema_version": SCHEMA_VERSION,
        "base_schema_version": base.SCHEMA_VERSION,
        "wrapper_sha256": file_sha256(WRAPPER_PATH),
        "base_runner_sha256": file_sha256(BASE_RUNNER),
        "expected_base_runner_sha256": EXPECTED_BASE_RUNNER_SHA256,
        "base_schema_sha256": file_sha256(BASE_SCHEMA),
        "schema_overlay_sha256": file_sha256(OVERLAY_SCHEMA),
        "base_uv_lock_sha256": file_sha256(BASE_LOCK),
    }


def timestamp_slug() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def make_run_dir(base_dir: Path, command: str) -> Path:
    run_dir = base_dir / f"{timestamp_slug()}-{command}-pid{os.getpid()}"
    run_dir.mkdir(parents=True, exist_ok=False)
    return run_dir


def solve_case(
    case: base.Case,
    timeout_ms: int,
    out_dir: Path,
    seed: int,
    expected_wrapper_sha256: str,
) -> dict[str, object]:
    started = time.monotonic()
    case.validate()
    case_dir = out_dir / case.case_id
    case_dir.mkdir(parents=True, exist_ok=False)
    base_result: dict[str, object] = {
        **provenance(),
        "case": asdict(case),
        "case_id": case.case_id,
        "solver": {
            "name": "z3",
            "version": z3.get_version_string(),
            "seed": seed,
            "threads": 1,
        },
    }
    try:
        actual_wrapper_sha256 = file_sha256(WRAPPER_PATH)
        if actual_wrapper_sha256 != expected_wrapper_sha256:
            raise RuntimeError(
                "worker wrapper hash differs from parent invocation: "
                f"{actual_wrapper_sha256} != {expected_wrapper_sha256}"
            )
        if file_sha256(BASE_RUNNER) != EXPECTED_BASE_RUNNER_SHA256:
            raise RuntimeError("frozen round-5 base runner changed before solve")

        encoding = Encoding(case, timeout_ms=timeout_ms, seed=seed)
        solver, smt2 = encoding.make_solver()
        encoding_hash = hashlib.sha256(smt2.encode()).hexdigest()
        with gzip.open(case_dir / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(smt2)

        check_started = time.monotonic()
        outcome = solver.check()
        check_elapsed = time.monotonic() - check_started
        if outcome == z3.sat:
            status = "sat"
        elif outcome == z3.unsat:
            status = "unsat"
        else:
            status = "unknown"

        counts = encoding.constraint_counts()
        result: dict[str, object] = {
            **base_result,
            "status": status,
            "elapsed_seconds": time.monotonic() - started,
            "solver_check_seconds": check_elapsed,
            "timeout_ms": timeout_ms,
            "constraint_counts": counts,
            "constraint_total": sum(counts.values()),
            "encoding_sha256": encoding_hash,
        }
        if status == "sat":
            model = solver.model()
            validation = encoding.validate_model(model)
            result["model_validation"] = validation
            write_json(case_dir / "witness.json", encoding.serialize_model(model))
            result["witness_file"] = "witness.json"
            if validation["failures"]:
                result["status"] = "error"
                result["error"] = "solver model failed assertion replay"
        elif status == "unsat":
            result["unsat_core_families"] = sorted(
                str(item).removeprefix("track_") for item in solver.unsat_core()
            )
        else:
            result["reason_unknown"] = solver.reason_unknown()
    except Exception as exc:
        result = {
            **base_result,
            "status": "error",
            "elapsed_seconds": time.monotonic() - started,
            "timeout_ms": timeout_ms,
            "constraint_counts": {},
            "encoding_sha256": None,
            "error": f"{type(exc).__name__}: {exc}",
        }
    write_json(case_dir / "result.json", result)
    return result


def _worker(payload: tuple[dict[str, object], int, str, int, str]) -> dict[str, object]:
    case_data, timeout_ms, out_dir, seed, expected_wrapper_sha256 = payload
    return solve_case(
        base.Case(**case_data),
        timeout_ms,
        Path(out_dir),
        seed,
        expected_wrapper_sha256,
    )


def run_cases(
    cases: Iterable[base.Case],
    timeout_ms: int,
    workers: int,
    seed: int,
    artifacts: Path,
    command: str,
) -> tuple[int, Path]:
    selected = list(cases)
    if not selected:
        raise ValueError("no cases selected")
    if not 1 <= workers <= min(8, len(selected)):
        raise ValueError(f"workers must be between 1 and {min(8, len(selected))}")
    if timeout_ms <= 0 or timeout_ms > 300_000:
        raise ValueError("timeout must be in 1..300000 ms")

    run_dir = make_run_dir(artifacts, command)
    invocation = {
        **provenance(),
        "argv": sys.argv,
        "case_count": len(selected),
        "workers": workers,
        "timeout_ms": timeout_ms,
    }
    write_json(run_dir / "invocation.json", invocation)
    wrapper_sha256 = str(invocation["wrapper_sha256"])
    payloads = [
        (asdict(case), timeout_ms, str(run_dir), seed + index, wrapper_sha256)
        for index, case in enumerate(selected)
    ]

    started = time.monotonic()
    if workers == 1:
        results = [_worker(payload) for payload in payloads]
    else:
        with concurrent.futures.ProcessPoolExecutor(max_workers=workers) as pool:
            results = list(pool.map(_worker, payloads))

    statuses: Counter[str] = Counter(str(result["status"]) for result in results)
    compact_results = [
        {
            "case_id": result["case_id"],
            "status": result["status"],
            "elapsed_seconds": result["elapsed_seconds"],
            "solver_check_seconds": result.get("solver_check_seconds"),
            "reason_unknown": result.get("reason_unknown"),
            "unsat_core_families": result.get("unsat_core_families"),
            "constraint_counts": result.get("constraint_counts"),
            "constraint_total": result.get("constraint_total"),
            "encoding_sha256": result.get("encoding_sha256"),
        }
        for result in results
    ]
    summary = {
        **provenance(),
        "case_count": len(selected),
        "workers": workers,
        "timeout_ms": timeout_ms,
        "elapsed_seconds": time.monotonic() - started,
        "statuses": dict(statuses),
        "complete": statuses["unknown"] == 0 and statuses["error"] == 0,
        "results": sorted(compact_results, key=lambda item: str(item["case_id"])),
    }
    write_json(run_dir / "summary.json", summary)
    print(
        json.dumps(
            {
                "run_dir": str(run_dir),
                "statuses": dict(statuses),
                "complete": summary["complete"],
            },
            sort_keys=True,
        )
    )
    return (0 if summary["complete"] else 2), run_dir


def squared_distance_from_coordinates(
    coordinates: tuple[tuple[int, int], ...], i: int, j: int
) -> int:
    xi, yi = coordinates[i]
    xj, yj = coordinates[j]
    return (xi - xj) ** 2 + (yi - yj) ** 2


def command_self_test(_args: argparse.Namespace) -> int:
    square = ((0, 0), (1, 0), (1, 1), (0, 1))
    for positive_pair, negative_pair in balanced_partitions((0, 1, 2, 3)):
        p0, p1 = positive_pair
        n0, n1 = negative_pair
        lhs = squared_distance_from_coordinates(square, p0, p1)
        lhs += squared_distance_from_coordinates(square, n0, n1)
        rhs = sum(
            squared_distance_from_coordinates(square, p, n)
            for p in positive_pair
            for n in negative_pair
        )
        assert lhs <= rhs

    fake = {
        (0, 1): 10,
        (2, 3): 10,
        (0, 2): 1,
        (0, 3): 1,
        (1, 2): 1,
        (1, 3): 1,
    }
    assert fake[0, 1] + fake[2, 3] > sum(
        fake[tuple(sorted((p, n)))] for p in (0, 1) for n in (2, 3)
    )

    encoding = Encoding(FIXED_CASES["paired_DDD"], timeout_ms=1, seed=97)
    counts = encoding.constraint_counts()
    expected_cnd = 3 * len(list(itertools.combinations(base.POINTS, 4)))
    assert counts[EDM_FAMILY] == expected_cnd == 4095
    assert counts["squared_distance_equality_transport"] == 1365
    for constraint in encoding.groups[EDM_FAMILY]:
        names: set[str] = set()
        stack = [constraint]
        while stack:
            term = stack.pop()
            if z3.is_const(term) and term.decl().kind() == z3.Z3_OP_UNINTERPRETED:
                names.add(str(term))
            stack.extend(term.children())
        assert names and all(name.startswith("s_") for name in names)

    print(
        json.dumps(
            {
                "status": "SELF_TEST_OK",
                "four_point_subsets": 1365,
                "balanced_partitions_per_subset": 3,
                "cnd_constraints": counts[EDM_FAMILY],
                "equality_transport_constraints": counts[
                    "squared_distance_equality_transport"
                ],
                **provenance(),
            },
            sort_keys=True,
        )
    )
    return 0


def command_case(args: argparse.Namespace) -> int:
    return run_cases(
        [FIXED_CASES[args.which]],
        args.timeout_ms,
        1,
        args.seed,
        args.artifacts,
        f"case-{args.which}",
    )[0]


def command_smokes(args: argparse.Namespace) -> int:
    return run_cases(
        FIXED_CASES.values(),
        args.timeout_ms,
        args.workers,
        args.seed,
        args.artifacts,
        "smokes",
    )[0]


def parser() -> argparse.ArgumentParser:
    common = argparse.ArgumentParser(add_help=False)
    common.add_argument("--timeout-ms", type=int, default=300_000)
    common.add_argument("--seed", type=int, default=97)
    common.add_argument("--artifacts", type=Path, default=HERE / "artifacts")

    top = argparse.ArgumentParser(description=__doc__)
    sub = top.add_subparsers(dest="command", required=True)

    self_test = sub.add_parser("self-test")
    self_test.set_defaults(func=command_self_test)

    case = sub.add_parser("case", parents=[common])
    case.add_argument("--which", choices=tuple(FIXED_CASES), required=True)
    case.set_defaults(func=command_case)

    smokes = sub.add_parser("smokes", parents=[common])
    smokes.add_argument("--workers", type=int, default=2)
    smokes.set_defaults(func=command_smokes)
    return top


def main() -> int:
    args = parser().parse_args()
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
