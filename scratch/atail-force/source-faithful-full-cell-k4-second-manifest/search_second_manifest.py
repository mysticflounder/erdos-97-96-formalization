#!/usr/bin/env python3
"""Bounded second-blocker-row search above the certified x21 completion.

The first row is fixed semantically as ``uS1 -> x21`` with support
``{uS1,t0s,t1s,o}``.  Every second-row atom uses a different previously
missing blocker center, contains a previously unmapped source, and is accepted
only when *both* rows satisfy the complete numerical BlockerRowManifest:

* the four named support distances agree;
* no outside point lies on that radius; and
* after deleting the named source, every other radius class has size at most
  one (hence certainly less than four).

This is a fail-closed numerical discovery search.  A low-residual hit is only
``NUMERIC_SAT_CANDIDATE``.  A timeout or failed solve is ``UNKNOWN_NO_HIT``;
neither is an UNSAT result or a MUS.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass
import hashlib
import itertools
import json
import math
import os
from pathlib import Path
import random
import sys
import threading
import time
from typing import Sequence

# Twelve Python workers must not each create a nested BLAS team.
for _name in (
    "OMP_NUM_THREADS", "OPENBLAS_NUM_THREADS", "MKL_NUM_THREADS",
    "VECLIB_MAXIMUM_THREADS", "NUMEXPR_NUM_THREADS",
):
    os.environ.setdefault(_name, "1")

import numpy as np
from scipy.optimize import least_squares


HERE = Path(__file__).resolve().parent
UPSTREAM = HERE.parent / "source-faithful-full-cell-k4-completion"
sys.path.insert(0, str(UPSTREAM))

import completion_cegar as upstream  # noqa: E402


X21_CENTER = "x21"
X21_SOURCE = "uS1"
X21_SUPPORT = ("uS1", "t0s", "t1s", "o")
ALREADY_MAPPED_SOURCES = frozenset(("q0", "q1", "q2", "c1", X21_SOURCE))
CERTIFICATE = UPSTREAM / "x21-algebraic-certificate.json"
VALIDATION = UPSTREAM / "x21-validation.json"


class TaskBudgetExceeded(RuntimeError):
    pass


@dataclass(frozen=True)
class SecondManifestAtom:
    center: str
    source: str
    support: tuple[str, str, str, str]
    seed_spread: float

    @property
    def key(self) -> str:
        return f"{self.source}->{self.center}:" + ",".join(self.support)

    def render(self) -> dict[str, object]:
        return {
            "key": self.key,
            "center": self.center,
            "critical_source": self.source,
            "support": list(self.support),
            "seed_spread": self.seed_spread,
        }


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_seed() -> tuple[np.ndarray, tuple[str, ...]]:
    certificate = json.loads(CERTIFICATE.read_text())
    if certificate["status"] != "EXACT_ALGEBRAIC_ONE_ROW_COMPLETION_CERTIFIED":
        raise AssertionError("upstream x21 certificate is not terminal")
    if not certificate["source_oriented_blocker_manifest"][
        "deletion_kills_every_radius_class_at_blocker"
    ]:
        raise AssertionError("upstream x21 manifest is not certified")
    seed = np.array(
        [float(value) for value in certificate["numeric_seed_parameters"]],
        dtype=float,
    )
    order = tuple(upstream.full.cyclic_order(upstream.construct(seed)))
    return seed, order


def row_residuals(
    points: dict[str, np.ndarray], center: str, support: Sequence[str]
) -> np.ndarray:
    center_point = points[center]
    distances = np.array(
        [upstream.base.sqdist(center_point, points[name]) for name in support],
        dtype=float,
    )
    scale = max(float(np.mean(np.abs(distances))), 1e-4)
    # Use three independent equations so two rows add six constraints.
    return (distances[1:] - distances[0]) / scale


def raw_cell_groups(
    parameters: np.ndarray, order: tuple[str, ...]
) -> dict[str, list[float]]:
    result = upstream.hard_margin_groups(parameters, order)
    # The predecessor search used a conservative 1e-7 hull floor.  The exact
    # x21 root lies in the mathematical open cell with raw margin 7.56e-8, so
    # this lane uses a declared 1e-10 floor instead of silently rejecting its
    # certified starting point.
    for name in ("strict_hull", "fixed_cyclic_cell"):
        result[name] = [value + 1e-7 - 1e-10 for value in result[name]]
    return result


def blocker_manifest_groups(
    points: dict[str, np.ndarray], center: str, source: str,
    support: Sequence[str],
) -> dict[str, list[float]]:
    if source not in support:
        raise AssertionError((source, support))
    if source == center:
        raise AssertionError((source, center))
    center_point = points[center]
    radius = upstream.base.sqdist(center_point, points[support[0]])
    outside = [
        name for name in points
        if name != center and name not in support
    ]
    outside_distances = {
        name: upstream.base.sqdist(center_point, points[name]) for name in outside
    }
    # These are open conditions.  Combined with exact row equalities they say
    # the represented shell is exact; after deleting source the retained shell
    # has size three and every other radius class is a singleton.
    return {
        "source_radius_positive": [
            upstream.base.sqdist(center_point, points[source]) - 1e-12
        ],
        "row_exclusions": [
            abs(value - radius) - 1e-10
            for value in outside_distances.values()
        ],
        "deleted_outside_pair_gaps": [
            abs(outside_distances[first] - outside_distances[second]) - 1e-10
            for index, first in enumerate(outside)
            for second in outside[:index]
        ] or [1.0],
    }


def all_margin_groups(
    parameters: np.ndarray, order: tuple[str, ...], atom: SecondManifestAtom,
) -> dict[str, list[float]]:
    points = upstream.construct(parameters)
    result = {
        f"cell:{name}": values
        for name, values in raw_cell_groups(parameters, order).items()
    }
    for prefix, center, source, support in (
        ("x21", X21_CENTER, X21_SOURCE, X21_SUPPORT),
        ("second", atom.center, atom.source, atom.support),
    ):
        result.update({
            f"manifest:{prefix}:{name}": values
            for name, values in blocker_manifest_groups(
                points, center, source, support
            ).items()
        })
    return result


def flatten(groups: dict[str, list[float]]) -> np.ndarray:
    return np.array(
        [value for values in groups.values() for value in values], dtype=float
    )


def enumerate_atoms(
    seed: np.ndarray, order: tuple[str, ...], supports_per_center: int,
) -> list[SecondManifestAtom]:
    points = upstream.construct(seed)
    positions = {name: index for index, name in enumerate(order)}
    centers = [
        name for name in order
        if name not in (*upstream.KNOWN_K4_CENTERS, X21_CENTER)
    ]
    result: list[SecondManifestAtom] = []
    for center in centers:
        center_point = points[center]
        targets = [name for name in order if name != center]
        distances = {
            name: upstream.base.sqdist(center_point, points[name])
            for name in targets
        }
        scale = max(float(np.median(list(distances.values()))), 1e-4)
        ranked: list[tuple[float, tuple[str, str, str, str], str]] = []
        for support_raw in itertools.combinations(targets, 4):
            eligible_sources = sorted(
                set(support_raw) - ALREADY_MAPPED_SOURCES - {center},
                key=positions.__getitem__,
            )
            if not eligible_sources:
                continue
            values = [distances[name] for name in support_raw]
            spread = (max(values) - min(values)) / scale
            support = tuple(sorted(support_raw, key=positions.__getitem__))
            ranked.append((spread, support, eligible_sources[0]))
        ranked.sort(key=lambda item: (item[0], item[1], item[2]))
        for spread, support, source in ranked[:supports_per_center]:
            result.append(SecondManifestAtom(center, source, support, spread))
    result.sort(key=lambda atom: (atom.seed_spread, atom.center, atom.support))
    return result


def smoke_test(
    seed: np.ndarray, order: tuple[str, ...], atoms: Sequence[SecondManifestAtom]
) -> dict[str, object]:
    points = upstream.construct(seed)
    x21_residual = float(np.max(np.abs(
        row_residuals(points, X21_CENTER, X21_SUPPORT)
    )))
    if x21_residual >= 1e-12:
        raise AssertionError(("x21 row drift", x21_residual))
    cell_min = float(np.min(flatten(raw_cell_groups(seed, order))))
    if cell_min <= 0:
        raise AssertionError(("x21 root outside mathematical cell", cell_min))
    x21_manifest = blocker_manifest_groups(
        points, X21_CENTER, X21_SOURCE, X21_SUPPORT
    )
    x21_manifest_min = float(np.min(flatten(x21_manifest)))
    if x21_manifest_min <= 0:
        raise AssertionError(("x21 manifest drift", x21_manifest_min))
    if tuple(upstream.full.cyclic_order(points)) != order:
        raise AssertionError("x21 cyclic order drift")
    if not atoms:
        raise AssertionError("empty second-row atom universe")
    return {
        "status": "ENCODING_SMOKE_PASS",
        "x21_normalized_row_residual": x21_residual,
        "minimum_mathematical_cell_margin": cell_min,
        "minimum_x21_manifest_margin": x21_manifest_min,
        "second_row_atom_count": len(atoms),
    }


def solve_atom(task: dict[str, object]) -> dict[str, object]:
    atom_payload = task["atom"]
    atom = SecondManifestAtom(
        center=str(atom_payload["center"]),
        source=str(atom_payload["critical_source"]),
        support=tuple(atom_payload["support"]),
        seed_spread=float(atom_payload["seed_spread"]),
    )
    seed = np.array(task["seed"], dtype=float)
    order = tuple(task["order"])
    lower, upper = upstream.search_bounds()
    seed = np.minimum(np.maximum(seed, lower + 1e-9), upper - 1e-9)
    width = np.maximum(upper - lower, 1e-3)
    seed_margins = flatten(all_margin_groups(seed, order, atom))
    margin_scale = np.maximum(np.abs(seed_margins), 1e-6)
    deadline = time.monotonic() + float(task["task_timeout_seconds"])
    started = time.monotonic()
    rng = random.Random(int(task["random_seed"]))
    best: dict[str, object] | None = None
    best_score: tuple[float, ...] | None = None
    timed_out = False
    lock = threading.Lock()

    def assess(parameters: np.ndarray, *, nfev: int, message: str) -> None:
        nonlocal best, best_score
        points = upstream.construct(parameters)
        x21_eq = row_residuals(points, X21_CENTER, X21_SUPPORT)
        second_eq = row_residuals(points, atom.center, atom.support)
        equality = float(np.max(np.abs(np.concatenate((x21_eq, second_eq)))))
        groups = all_margin_groups(parameters, order, atom)
        minimums = {name: min(values) for name, values in groups.items()}
        cell_min = min(
            value for name, value in minimums.items() if name.startswith("cell:")
        )
        x21_min = min(
            value for name, value in minimums.items()
            if name.startswith("manifest:x21:")
        )
        second_min = min(
            value for name, value in minimums.items()
            if name.startswith("manifest:second:")
        )
        order_ok = tuple(upstream.full.cyclic_order(points)) == order
        score = (
            0.0 if order_ok else 1.0,
            max(0.0, -cell_min),
            max(0.0, -x21_min),
            max(0.0, -second_min),
            equality,
        )
        payload = {
            "parameters": parameters.tolist(),
            "equality_max_normalized_residual": equality,
            "x21_row_max_normalized_residual": float(np.max(np.abs(x21_eq))),
            "second_row_max_normalized_residual": float(np.max(np.abs(second_eq))),
            "minimum_cell_margin": cell_min,
            "minimum_x21_manifest_margin": x21_min,
            "minimum_second_manifest_margin": second_min,
            "minimum_by_group": minimums,
            "order_ok": order_ok,
            "nfev": nfev,
            "solver_message": message,
        }
        with lock:
            if best_score is None or score < best_score:
                best_score = score
                best = payload

    residual_calls = 0

    def residual(parameters: np.ndarray) -> np.ndarray:
        nonlocal residual_calls
        residual_calls += 1
        if time.monotonic() > deadline:
            raise TaskBudgetExceeded
        points = upstream.construct(parameters)
        equalities = np.concatenate((
            row_residuals(points, X21_CENTER, X21_SUPPORT),
            row_residuals(points, atom.center, atom.support),
        ))
        margins = flatten(all_margin_groups(parameters, order, atom))
        penalties = 40.0 * np.maximum(0.0, 1e-12 - margins) / margin_scale
        regularization = 1e-5 * (parameters - seed) / width
        if residual_calls % 80 == 1:
            assess(parameters, nfev=residual_calls, message="intermediate")
        return np.concatenate((equalities, penalties, regularization))

    starts = [seed]
    for _index in range(1, int(task["restarts"])):
        perturbation = np.array(
            [rng.uniform(-1.0, 1.0) for _ in range(len(seed))], dtype=float
        )
        candidate = seed + 1e-3 * width * perturbation
        starts.append(np.minimum(np.maximum(candidate, lower + 1e-9), upper - 1e-9))

    for restart, start in enumerate(starts):
        if time.monotonic() > deadline:
            timed_out = True
            break
        assess(start, nfev=0, message=f"restart {restart} seed")
        try:
            result = least_squares(
                residual, start, bounds=(lower, upper),
                max_nfev=int(task["max_nfev"]),
                ftol=1e-12, xtol=1e-12, gtol=1e-12,
            )
            assess(
                result.x, nfev=int(result.nfev),
                message=f"restart {restart}: {result.message}",
            )
        except TaskBudgetExceeded:
            timed_out = True
            break

    assert best is not None
    hit = (
        bool(best["order_ok"])
        and float(best["minimum_cell_margin"]) > 0
        and float(best["minimum_x21_manifest_margin"]) > 0
        and float(best["minimum_second_manifest_margin"]) > 0
        and float(best["equality_max_normalized_residual"]) < 1e-7
    )
    status = "NUMERIC_SAT_CANDIDATE" if hit else "UNKNOWN_NO_HIT"
    return {
        "schema": "source-faithful-second-blocker-manifest-oracle-v1",
        "epistemic_status": (
            "BOUNDED_NUMERIC_SAT_CANDIDATE_UNCERTIFIED" if hit else
            "BOUNDED_NUMERIC_UNKNOWN_NO_HIT"
        ),
        "status": status,
        "timed_out": timed_out,
        "atom": atom.render(),
        "elapsed_seconds": time.monotonic() - started,
        "oracle": {
            "engine": "scipy.optimize.least_squares",
            "unsat_capable": False,
            "max_nfev": task["max_nfev"],
            "restarts": task["restarts"],
            "task_timeout_seconds": task["task_timeout_seconds"],
            "random_seed": task["random_seed"],
        },
        "result": best,
        "coverage_claim": False,
        "unsat_claim": False,
    }


def append_jsonl(path: Path, payload: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(payload, sort_keys=True) + "\n")
        handle.flush()
        os.fsync(handle.fileno())


def atomic_json(path: Path, payload: dict[str, object]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--supports-per-center", type=int, default=4)
    parser.add_argument("--max-tasks", type=int, default=76)
    parser.add_argument("--max-nfev", type=int, default=700)
    parser.add_argument("--restarts", type=int, default=2)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--task-timeout-seconds", type=float, default=30.0)
    parser.add_argument("--random-seed", type=int, default=2026071802)
    parser.add_argument("--smoke-only", action="store_true")
    parser.add_argument("--log", type=Path, default=HERE / "search-log.jsonl")
    parser.add_argument("--checkpoint", type=Path, default=HERE / "checkpoint.json")
    parser.add_argument("--lock", type=Path, default=HERE / ".second-manifest.lock")
    args = parser.parse_args()
    if min(
        args.supports_per_center, args.max_tasks, args.max_nfev,
        args.restarts, args.workers, args.task_timeout_seconds,
    ) <= 0:
        raise ValueError("all budgets must be positive")
    if args.workers > 12:
        raise ValueError("this lane is capped at 12 workers")

    lock_fd: int | None = None
    try:
        lock_fd = os.open(args.lock, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
        os.write(lock_fd, f"pid={os.getpid()}\n".encode())
    except FileExistsError:
        print(json.dumps({"status": "LOCKED", "lock": str(args.lock)}, indent=2))
        raise SystemExit(3)

    try:
        started = time.monotonic()
        seed, order = load_seed()
        atoms = enumerate_atoms(seed, order, args.supports_per_center)[:args.max_tasks]
        smoke = smoke_test(seed, order, atoms)
        header = {
            "schema": "source-faithful-full-cell-k4-second-manifest-v1",
            "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
            "status": "START",
            "inputs": {
                "x21_certificate": str(CERTIFICATE),
                "x21_certificate_sha256": sha256(CERTIFICATE),
                "x21_validation": str(VALIDATION),
                "x21_validation_sha256": sha256(VALIDATION),
            },
            "smoke_test": smoke,
            "hard_constraints": [
                "full predecessor open-cell ledger",
                "exact x21 row equations",
                "uS1 -> x21 full blocker manifest",
                "second exact row equations",
                "second source membership",
                "second full deletion blocker manifest",
            ],
            "omitted": [
                "K4 rows at the other eighteen missing centers",
                "total CriticalShellSystem",
                "global minimality",
                "noM44 across alternate support triangles",
            ],
            "budgets": {
                "supports_per_center": args.supports_per_center,
                "max_tasks": args.max_tasks,
                "max_nfev": args.max_nfev,
                "restarts": args.restarts,
                "workers": args.workers,
                "task_timeout_seconds": args.task_timeout_seconds,
                "random_seed": args.random_seed,
            },
            "atoms": [atom.render() for atom in atoms],
            "coverage_claim": False,
            "unsat_claim": False,
        }
        append_jsonl(args.log, header)
        atomic_json(args.checkpoint, header)
        if args.smoke_only:
            print(json.dumps(header, indent=2, sort_keys=True))
            return

        tasks = [
            {
                "seed": seed.tolist(),
                "order": list(order),
                "atom": atom.render(),
                "max_nfev": args.max_nfev,
                "restarts": args.restarts,
                "task_timeout_seconds": args.task_timeout_seconds,
                "random_seed": args.random_seed + index,
            }
            for index, atom in enumerate(atoms)
        ]
        results: list[dict[str, object]] = []
        with ThreadPoolExecutor(max_workers=args.workers) as executor:
            futures = [executor.submit(solve_atom, task) for task in tasks]
            for future in as_completed(futures):
                result = future.result()
                results.append(result)
                append_jsonl(args.log, result)
                print(json.dumps({
                    "status": result["status"],
                    "atom": result["atom"]["key"],
                    "residual": result["result"]["equality_max_normalized_residual"],
                    "cell": result["result"]["minimum_cell_margin"],
                    "x21_manifest": result["result"]["minimum_x21_manifest_margin"],
                    "second_manifest": result["result"]["minimum_second_manifest_margin"],
                    "timed_out": result["timed_out"],
                }), flush=True)

        hits = [result for result in results if result["status"] == "NUMERIC_SAT_CANDIDATE"]
        strongest = min(
            results,
            key=lambda result: (
                0 if result["status"] == "NUMERIC_SAT_CANDIDATE" else 1,
                result["result"]["equality_max_normalized_residual"],
                -result["result"]["minimum_second_manifest_margin"],
            ),
        )
        terminal = {
            "schema": "source-faithful-full-cell-k4-second-manifest-v1",
            "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
            "status": "BOUNDED_SECOND_MANIFEST_SEARCH_COMPLETE",
            "elapsed_seconds": time.monotonic() - started,
            "smoke_test": smoke,
            "budgets": header["budgets"],
            "results": {
                "attempted": len(results),
                "numeric_sat_candidates": len(hits),
                "unknown_no_hit": len(results) - len(hits),
                "timed_out": sum(bool(result["timed_out"]) for result in results),
            },
            "strongest_candidate": strongest,
            "exact_certificate": None,
            "mus": {
                "status": "NO_MUS_CLAIM_NUMERICAL_ORACLE_NOT_UNSAT_CAPABLE",
                "certified_cores": 0,
            },
            "coverage_claim": False,
            "unsat_claim": False,
        }
        append_jsonl(args.log, terminal)
        atomic_json(args.checkpoint, terminal)
        print(json.dumps(terminal, indent=2, sort_keys=True))
    finally:
        if lock_fd is not None:
            os.close(lock_fd)
        try:
            args.lock.unlink()
        except FileNotFoundError:
            pass


if __name__ == "__main__":
    main()
