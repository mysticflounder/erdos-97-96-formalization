#!/usr/bin/env python3
"""Bounded source-row completion audit for the exact 26-point local cell.

The fixed rational checkpoint is a boundary witness, not the search space:
twenty centers have singleton radius multiplicities there.  The semantic
oracle therefore deforms the 26 construction parameters while preserving the
same parameterized full-cell equalities and every checked open cell margin.

For each missing source center the map enumerates the nearest four-support
choices, quotiented by the stabilizer of the cap-coloured cyclic word.  The
oracle is numerical least squares.  A verified low-residual hit is only a
``NUMERIC_SAT_CANDIDATE``.  Every failure to find one is ``UNKNOWN_NO_HIT``;
this program never emits or banks an UNSAT core.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass
from fractions import Fraction as F
import itertools
import json
import math
import os
from pathlib import Path
import random
import sys
import time
from typing import Iterable, Sequence

import numpy as np
from scipy.optimize import least_squares


HERE = Path(__file__).resolve().parent
MODEL = HERE.parent / "full-parent-t0t1-exact-model"
PREDECESSOR = HERE.parent / "cycle-three-rows-euclidean"
sys.path.insert(0, str(MODEL))
sys.path.insert(0, str(PREDECESSOR))

import search_cycle_three_rows as base  # noqa: E402
import search_source_faithful_full_cell as full  # noqa: E402
import verify_exact_source_faithful_full_cell as exact  # noqa: E402


KNOWN_K4_CENTERS = ("o", "right", "left", "c0", "c1", "c2")
EXACT_CERTIFICATE = MODEL / "exact-source-faithful-full-cell.json"
NUMERIC_CHECKPOINT = MODEL / "full-source-faithful-search.json"


@dataclass(frozen=True)
class RowAtom:
    center: str
    support: tuple[str, str, str, str]
    seed_spread: float
    orbit_key: tuple[object, ...]

    @property
    def key(self) -> str:
        return f"{self.center}:" + ",".join(self.support)

    def render(self) -> dict[str, object]:
        return {
            "key": self.key,
            "center": self.center,
            "support": list(self.support),
            "seed_spread": self.seed_spread,
            "orbit_key": list(self.orbit_key),
        }


def load_seed() -> tuple[np.ndarray, tuple[str, ...]]:
    payload = json.loads(NUMERIC_CHECKPOINT.read_text())
    base_parameters = np.array(payload["base_parameters"], dtype=float)
    extension_parameters = np.array(payload["result"]["parameters"], dtype=float)
    order = tuple(payload["result"]["cyclic_order"])
    return np.concatenate((base_parameters, extension_parameters)), order


def split_parameters(parameters: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    if len(parameters) != 26:
        raise ValueError(f"expected 26 construction parameters, got {len(parameters)}")
    return parameters[:13], parameters[13:]


def construct(parameters: np.ndarray) -> dict[str, np.ndarray]:
    base_parameters, extension_parameters = split_parameters(parameters)
    return full.construct(extension_parameters, tuple(base_parameters), "full")


def search_bounds() -> tuple[np.ndarray, np.ndarray]:
    limits = [*base.bounds("broad"), *full.bounds("full")]
    return (
        np.array([lower for lower, _upper in limits], dtype=float),
        np.array([upper for _lower, upper in limits], dtype=float),
    )


def hard_margin_groups(
    parameters: np.ndarray, expected_order: tuple[str, ...]
) -> dict[str, list[float]]:
    base_parameters, extension_parameters = split_parameters(parameters)
    ledger = full.groups(extension_parameters, tuple(base_parameters), "full")
    result = {
        name: list(values)
        for name, values in ledger.items()
        if name != "parameterized_equalities_audit"
    }
    points = construct(parameters)
    result["fixed_cyclic_cell"] = [
        base.cross(
            points[expected_order[index]],
            points[expected_order[(index + 1) % len(expected_order)]],
            points[name],
        ) - 1e-7
        for index in range(len(expected_order))
        for name in expected_order
        if name not in (
            expected_order[index], expected_order[(index + 1) % len(expected_order)]
        )
    ]
    return result


def flatten_groups(groups: dict[str, list[float]]) -> np.ndarray:
    return np.array(
        [value for values in groups.values() for value in values], dtype=float
    )


def cap_colour_word(order: tuple[str, ...]) -> tuple[str, ...]:
    positions = {name: order.index(name) for name in order}

    def cyclic_members(start: str, finish: str) -> set[str]:
        index = positions[start]
        result = {start}
        while order[index] != finish:
            index = (index + 1) % len(order)
            result.add(order[index])
        return result

    first = cyclic_members("o", "left")
    physical = cyclic_members("left", "right")
    surplus = cyclic_members("right", "o")
    colours = []
    for name in order:
        memberships = "".join(
            label
            for label, members in (("F", first), ("P", physical), ("S", surplus))
            if name in members
        )
        colours.append(memberships)
    return tuple(colours)


def coloured_dihedral_automorphisms(order: tuple[str, ...]) -> tuple[tuple[int, ...], ...]:
    """Stabilizer of the cap-coloured cyclic word inside D_n."""
    colours = cap_colour_word(order)
    n = len(order)
    mappings: list[tuple[int, ...]] = []
    for reflected in (False, True):
        for shift in range(n):
            mapping = tuple(
                ((-index if reflected else index) + shift) % n for index in range(n)
            )
            if all(colours[index] == colours[mapping[index]] for index in range(n)):
                mappings.append(mapping)
    return tuple(sorted(set(mappings)))


def orbit_key(
    center: str,
    support: Sequence[str],
    order: tuple[str, ...],
    automorphisms: Sequence[Sequence[int]],
) -> tuple[object, ...]:
    positions = {name: index for index, name in enumerate(order)}
    candidates = []
    for mapping in automorphisms:
        mapped_center = mapping[positions[center]]
        mapped_support = tuple(sorted(mapping[positions[name]] for name in support))
        candidates.append((mapped_center, *mapped_support))
    return min(candidates)


def normalized_row_residuals(
    points: dict[str, np.ndarray], atom: RowAtom
) -> np.ndarray:
    center = points[atom.center]
    distances = np.array(
        [base.sqdist(center, points[name]) for name in atom.support], dtype=float
    )
    scale = max(float(np.mean(np.abs(distances))), 1e-4)
    # Four equations against one eliminated common squared radius.  Their sum
    # is zero, so this has the expected three independent constraints.
    return (distances - float(np.mean(distances))) / scale


def enumerate_row_atoms(
    seed: np.ndarray,
    order: tuple[str, ...],
    supports_per_center: int,
) -> tuple[list[RowAtom], tuple[tuple[int, ...], ...]]:
    points = construct(seed)
    automorphisms = coloured_dihedral_automorphisms(order)
    missing = [name for name in order if name not in KNOWN_K4_CENTERS]
    result: list[RowAtom] = []
    seen_orbits: set[tuple[object, ...]] = set()
    positions = {name: index for index, name in enumerate(order)}
    for center in missing:
        center_point = points[center]
        targets = [name for name in order if name != center]
        distances = {
            name: base.sqdist(center_point, points[name]) for name in targets
        }
        scale = max(float(np.median(list(distances.values()))), 1e-4)
        ranked: list[tuple[float, tuple[str, str, str, str]]] = []
        for support in itertools.combinations(targets, 4):
            values = [distances[name] for name in support]
            spread = (max(values) - min(values)) / scale
            support_ordered = tuple(sorted(support, key=positions.__getitem__))
            ranked.append((spread, support_ordered))
        ranked.sort(key=lambda item: (item[0], item[1]))
        kept = 0
        for spread, support in ranked:
            key = orbit_key(center, support, order, automorphisms)
            if key in seen_orbits:
                continue
            seen_orbits.add(key)
            result.append(RowAtom(center, support, spread, key))
            kept += 1
            if kept == supports_per_center:
                break
    result.sort(key=lambda atom: (atom.seed_spread, atom.center, atom.support))
    return result, automorphisms


def exact_boundary_audit() -> dict[str, object]:
    payload = json.loads(EXACT_CERTIFICATE.read_text())
    parameters = {
        name: [F(value) for value in values]
        for name, values in payload["result"]["parameters"].items()
    }
    points = exact.construct(parameters)
    multiplicities: dict[str, int] = {}
    for center in points:
        multiplicities[center] = max(exact.radius_multiplicities(points, center).values())
    actual_known = tuple(sorted(name for name, value in multiplicities.items() if value >= 4))
    expected_known = tuple(sorted(KNOWN_K4_CENTERS))
    if actual_known != expected_known:
        raise AssertionError((actual_known, expected_known))
    missing = {name: value for name, value in multiplicities.items() if name not in actual_known}
    if set(missing.values()) != {1}:
        raise AssertionError(missing)
    return {
        "status": "EXACT_RATIONAL_BOUNDARY_REPLAY_PASS",
        "coordinate_digest": payload["result"]["coordinate_digest"],
        "known_k4_centers": list(actual_known),
        "missing_center_count": len(missing),
        "missing_center_max_multiplicity_values": sorted(set(missing.values())),
    }


def smoke_test(
    seed: np.ndarray, order: tuple[str, ...]
) -> dict[str, object]:
    points = construct(seed)
    if tuple(full.cyclic_order(points)) != order:
        raise AssertionError("numeric checkpoint order drift")
    hard = hard_margin_groups(seed, order)
    hard_min = float(np.min(flatten_groups(hard)))
    if hard_min <= 0:
        raise AssertionError(("seed hard margin", hard_min))
    physical = RowAtom("o", ("left", "q0", "q1", "q2"), 0.0, ())
    physical_residual = float(np.max(np.abs(normalized_row_residuals(points, physical))))
    if physical_residual >= 1e-12:
        raise AssertionError(("known row residual", physical_residual))
    return {
        "status": "ENCODING_SMOKE_PASS",
        "seed_minimum_hard_margin": hard_min,
        "known_physical_row_max_residual": physical_residual,
        "cyclic_order": list(order),
    }


def solve_atoms(task: dict[str, object]) -> dict[str, object]:
    seed = np.array(task["seed"], dtype=float)
    expected_order = tuple(task["order"])
    atoms = tuple(
        RowAtom(
            atom["center"], tuple(atom["support"]), atom["seed_spread"],
            tuple(atom["orbit_key"]),
        )
        for atom in task["atoms"]
    )
    lower, upper = search_bounds()
    seed = np.minimum(np.maximum(seed, lower + 1e-9), upper - 1e-9)
    seed_hard = flatten_groups(hard_margin_groups(seed, expected_order))
    hard_scale = np.maximum(np.abs(seed_hard), 1e-5)
    width = np.maximum(upper - lower, 1e-3)
    rng = random.Random(int(task["random_seed"]))
    attempts = int(task["restarts"])
    best: dict[str, object] | None = None
    started = time.monotonic()
    hard_weight = float(task.get("hard_weight", 50.0))

    def residual(parameters: np.ndarray) -> np.ndarray:
        points = construct(parameters)
        row_residual = np.concatenate(
            [normalized_row_residuals(points, atom) for atom in atoms]
        )
        if hard_weight == 0:
            hard_component = np.empty(0)
        else:
            hard = flatten_groups(hard_margin_groups(parameters, expected_order))
            hard_penalty = np.maximum(0.0, 1e-10 - hard) / hard_scale
            hard_component = hard_weight * hard_penalty
        regularization = 2e-5 * (parameters - seed) / width
        return np.concatenate((row_residual, hard_component, regularization))

    starts = [seed]
    for _index in range(1, attempts):
        perturbation = np.array(
            [rng.uniform(-1.0, 1.0) for _ in range(len(seed))], dtype=float
        )
        candidate = seed + 2e-3 * width * perturbation
        starts.append(np.minimum(np.maximum(candidate, lower + 1e-9), upper - 1e-9))

    def assess(
        parameters: np.ndarray,
        *,
        restart: int,
        cost: float,
        optimality: float,
        nfev: int,
        solver_status: int,
        solver_message: str,
    ) -> tuple[dict[str, object], tuple[float, ...]]:
        points = construct(parameters)
        equality_max = max(
            float(np.max(np.abs(normalized_row_residuals(points, atom))))
            for atom in atoms
        )
        hard_groups = hard_margin_groups(parameters, expected_order)
        hard_min = float(np.min(flatten_groups(hard_groups)))
        order_ok = tuple(full.cyclic_order(points)) == expected_order
        payload: dict[str, object] = {
            "restart": restart,
            "parameters": parameters.tolist(),
            "equality_max_normalized_residual": equality_max,
            "minimum_hard_margin": hard_min,
            "order_ok": order_ok,
            "cost": cost,
            "optimality": optimality,
            "nfev": nfev,
            "solver_status": solver_status,
            "solver_message": solver_message,
            "minimum_by_hard_group": {
                name: min(values) for name, values in hard_groups.items()
            },
        }
        if hard_weight == 0:
            # A relaxation probe deliberately asks which cell guard breaks
            # after the row equations are solved, so equality residual is the
            # primary ranking key here.
            score = (equality_max, cost, max(0.0, -hard_min))
        else:
            score = (
                0.0 if order_ok else 1.0,
                max(0.0, -hard_min),
                equality_max,
                cost,
            )
        return payload, score

    for restart, start in enumerate(starts):
        start_vector = residual(start)
        start_payload, start_score = assess(
            start,
            restart=restart,
            cost=float(start_vector @ start_vector / 2),
            optimality=math.inf,
            nfev=0,
            solver_status=0,
            solver_message="unoptimized restart seed",
        )
        if best is None or start_score < tuple(best["_score"]):
            start_payload["_score"] = list(start_score)
            best = start_payload
        result = least_squares(
            residual, start, bounds=(lower, upper),
            max_nfev=int(task["max_nfev"]),
            ftol=1e-11, xtol=1e-11, gtol=1e-11,
        )
        candidate_payload, score = assess(
            result.x,
            restart=restart,
            cost=float(result.cost),
            optimality=float(result.optimality),
            nfev=int(result.nfev),
            solver_status=int(result.status),
            solver_message=str(result.message),
        )
        if best is None or score < tuple(best["_score"]):
            candidate_payload["_score"] = list(score)
            best = candidate_payload

    assert best is not None
    best.pop("_score", None)
    equality_hit = float(best["equality_max_normalized_residual"]) < 1e-7
    hit = (
        bool(best["order_ok"])
        and float(best["minimum_hard_margin"]) > 0
        and equality_hit
    )
    relaxed_boundary_hit = equality_hit and not hit
    return {
        "schema": "source-faithful-full-cell-row-oracle-v1",
        "epistemic_status": (
            "BOUNDED_NUMERIC_SAT_CANDIDATE_UNCERTIFIED"
            if hit else
            "BOUNDED_NUMERIC_RELAXED_EQUALITY_HIT_CELL_VIOLATION"
            if relaxed_boundary_hit else
            "BOUNDED_NUMERIC_UNKNOWN_NO_HIT"
        ),
        "status": (
            "NUMERIC_SAT_CANDIDATE" if hit else
            "RELAXED_EQUALITY_HIT_CELL_VIOLATION" if relaxed_boundary_hit else
            "UNKNOWN_NO_HIT"
        ),
        "stage": task["stage"],
        "atoms": [atom.render() for atom in atoms],
        "elapsed_seconds": time.monotonic() - started,
        "oracle": {
            "engine": "scipy.optimize.least_squares",
            "max_nfev": task["max_nfev"],
            "restarts": attempts,
            "random_seed": task["random_seed"],
            "hard_weight": hard_weight,
            "unsat_capable": False,
        },
        "result": best,
    }


def append_jsonl(path: Path, payload: dict[str, object]) -> None:
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(payload, sort_keys=True) + "\n")
        handle.flush()
        os.fsync(handle.fileno())


def atomic_json(path: Path, payload: dict[str, object]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def run_tasks(
    tasks: list[dict[str, object]], workers: int, log_path: Path
) -> list[dict[str, object]]:
    results: list[dict[str, object]] = []
    if workers == 1:
        for task in tasks:
            result = solve_atoms(task)
            append_jsonl(log_path, result)
            print(json.dumps({
                "stage": result["stage"], "status": result["status"],
                "atoms": [atom["key"] for atom in result["atoms"]],
                "residual": result["result"]["equality_max_normalized_residual"],
                "hard_margin": result["result"]["minimum_hard_margin"],
            }), flush=True)
            results.append(result)
        return results
    # The managed macOS sandbox denies the semaphore sysconf queried by
    # ProcessPoolExecutor.  SciPy's numerical kernels release the GIL, so a
    # bounded thread pool still parallelizes the expensive residual/Jacobian
    # work without weakening the audit contract.
    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {executor.submit(solve_atoms, task): task for task in tasks}
        for future in as_completed(futures):
            result = future.result()
            append_jsonl(log_path, result)
            print(json.dumps({
                "stage": result["stage"], "status": result["status"],
                "atoms": [atom["key"] for atom in result["atoms"]],
                "residual": result["result"]["equality_max_normalized_residual"],
                "hard_margin": result["result"]["minimum_hard_margin"],
            }), flush=True)
            results.append(result)
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-centers", type=int, default=6)
    parser.add_argument("--supports-per-center", type=int, default=5)
    parser.add_argument("--max-pairs", type=int, default=8)
    parser.add_argument("--max-nfev", type=int, default=500)
    parser.add_argument("--restarts", type=int, default=2)
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--random-seed", type=int, default=20260718)
    parser.add_argument("--log", type=Path, default=HERE / "audit-log.jsonl")
    parser.add_argument("--checkpoint", type=Path, default=HERE / "checkpoint.json")
    parser.add_argument("--lock", type=Path, default=HERE / ".completion-cegar.lock")
    args = parser.parse_args()
    if min(
        args.max_centers, args.supports_per_center, args.max_nfev,
        args.restarts, args.workers,
    ) <= 0 or args.max_pairs < 0:
        raise ValueError("all budgets must be positive and max-pairs nonnegative")

    lock_fd: int | None = None
    try:
        lock_fd = os.open(args.lock, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
        os.write(lock_fd, f"pid={os.getpid()}\n".encode())
    except FileExistsError:
        payload = {
            "schema": "source-faithful-full-cell-k4-completion-v1",
            "epistemic_status": "PROCESS_STATE_ONLY",
            "status": "LOCKED",
            "lock": str(args.lock),
        }
        print(json.dumps(payload, indent=2))
        raise SystemExit(3)

    try:
        started = time.monotonic()
        seed, order = load_seed()
        boundary = exact_boundary_audit()
        smoke = smoke_test(seed, order)
        atoms, automorphisms = enumerate_row_atoms(
            seed, order, args.supports_per_center
        )
        centers = []
        for atom in atoms:
            if atom.center not in centers:
                centers.append(atom.center)
            if len(centers) == args.max_centers:
                break
        selected = [atom for atom in atoms if atom.center in centers]
        header = {
            "schema": "source-faithful-full-cell-k4-completion-v1",
            "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
            "status": "START",
            "boundary": boundary,
            "smoke_test": smoke,
            "encoding": {
                "construction_parameter_count": 26,
                "new_row_equations_per_atom": 4,
                "independent_new_row_equations_per_atom": 3,
                "hard_cell_groups": list(hard_margin_groups(seed, order)),
                "omitted_from_this_stage": [
                    "total CriticalShellSystem deletion-criticality",
                    "global minimality",
                    "noM44 across alternative support triangles",
                ],
            },
            "symmetry": {
                "ambient_group": "dihedral stabilizer of cap-coloured cyclic word",
                "stabilizer_order": len(automorphisms),
                "automorphisms": [list(mapping) for mapping in automorphisms],
            },
            "budgets": {
                "max_centers": args.max_centers,
                "supports_per_center": args.supports_per_center,
                "max_pairs": args.max_pairs,
                "max_nfev": args.max_nfev,
                "restarts": args.restarts,
                "workers": args.workers,
                "random_seed": args.random_seed,
            },
            "selected_centers": centers,
            "selected_row_atoms": [atom.render() for atom in selected],
        }
        append_jsonl(args.log, header)
        atomic_json(args.checkpoint, header)

        atom_by_key = {atom.key: atom for atom in selected}
        singleton_tasks = [
            {
                "stage": "SINGLETON_ROW",
                "seed": seed.tolist(),
                "order": list(order),
                "atoms": [atom.render()],
                "max_nfev": args.max_nfev,
                "restarts": args.restarts,
                "random_seed": args.random_seed + index,
            }
            for index, atom in enumerate(selected)
        ]
        singleton_results = run_tasks(singleton_tasks, args.workers, args.log)
        singleton_hits = [
            result for result in singleton_results
            if result["status"] == "NUMERIC_SAT_CANDIDATE"
        ]

        best_by_center: dict[str, dict[str, object]] = {}
        for result in singleton_hits:
            center = result["atoms"][0]["center"]
            old = best_by_center.get(center)
            if old is None or (
                result["result"]["equality_max_normalized_residual"] <
                old["result"]["equality_max_normalized_residual"]
            ):
                best_by_center[center] = result

        pair_specs = list(itertools.combinations(sorted(best_by_center), 2))[
            :args.max_pairs
        ]
        pair_tasks: list[dict[str, object]] = []
        for index, (first_center, second_center) in enumerate(pair_specs):
            first_hit = best_by_center[first_center]
            second_hit = best_by_center[second_center]
            first_atom = atom_by_key[first_hit["atoms"][0]["key"]]
            second_atom = atom_by_key[second_hit["atoms"][0]["key"]]
            pair_tasks.append({
                "stage": "PAIR_ROWS",
                "seed": first_hit["result"]["parameters"],
                "order": list(order),
                "atoms": [first_atom.render(), second_atom.render()],
                "max_nfev": args.max_nfev,
                "restarts": args.restarts,
                "random_seed": args.random_seed + 10000 + index,
            })
        pair_results = run_tasks(pair_tasks, args.workers, args.log) if pair_tasks else []
        pair_hits = [
            result for result in pair_results
            if result["status"] == "NUMERIC_SAT_CANDIDATE"
        ]

        terminal = {
            "schema": "source-faithful-full-cell-k4-completion-v1",
            "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
            "status": "BOUNDED_NUMERIC_AUDIT_COMPLETE",
            "elapsed_seconds": time.monotonic() - started,
            "boundary": boundary,
            "smoke_test": smoke,
            "symmetry_stabilizer_order": len(automorphisms),
            "selected_centers": centers,
            "singleton": {
                "attempted": len(singleton_results),
                "numeric_sat_candidates": len(singleton_hits),
                "unknown_no_hit": len(singleton_results) - len(singleton_hits),
            },
            "pairs": {
                "attempted": len(pair_results),
                "numeric_sat_candidates": len(pair_hits),
                "unknown_no_hit": len(pair_results) - len(pair_hits),
            },
            "mus_bank": {
                "certified_cores": 0,
                "uncertified_cores": 0,
                "reason": (
                    "the bounded numerical oracle is not UNSAT-capable; "
                    "UNKNOWN results are fail-closed and never blocked or shrunk"
                ),
            },
            "generalization_checkpoint": {
                "reviewed_certified_cores": 0,
                "status": "NO_CERTIFIED_CORES_TO_GENERALIZE",
            },
            "strongest_candidate": min(
                [*singleton_hits, *pair_hits],
                key=lambda result: (
                    -len(result["atoms"]),
                    result["result"]["equality_max_normalized_residual"],
                ),
                default=None,
            ),
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
