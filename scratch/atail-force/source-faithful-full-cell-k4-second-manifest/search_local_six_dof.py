#!/usr/bin/env python3
"""Fast local six-degree-of-freedom search for a second blocker manifest.

For each atom selected by ``search_second_manifest.py``, choose six
construction parameters by rank-revealing QR on the six row equations (three
for the certified x21 row and three for the proposed second row).  Freeze the
other twenty parameters, solve the square local system, then replay the full
cell and both exhaustive deletion manifests.  Equality hits outside any gate
are diagnostic only and never accepted.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import json
import os
from pathlib import Path
import sys
import time

for _name in (
    "OMP_NUM_THREADS", "OPENBLAS_NUM_THREADS", "MKL_NUM_THREADS",
    "VECLIB_MAXIMUM_THREADS", "NUMEXPR_NUM_THREADS",
):
    os.environ.setdefault(_name, "1")

import numpy as np
from scipy.linalg import qr
from scipy.optimize import least_squares


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import search_second_manifest as surface  # noqa: E402


def equations(parameters: np.ndarray, atom: surface.SecondManifestAtom) -> np.ndarray:
    points = surface.upstream.construct(parameters)
    return np.concatenate((
        surface.row_residuals(points, surface.X21_CENTER, surface.X21_SUPPORT),
        surface.row_residuals(points, atom.center, atom.support),
    ))


def numerical_jacobian(
    seed: np.ndarray, atom: surface.SecondManifestAtom,
    lower: np.ndarray, upper: np.ndarray,
) -> np.ndarray:
    result = np.zeros((6, len(seed)), dtype=float)
    width = np.maximum(upper - lower, 1e-3)
    for index in range(len(seed)):
        step = min(1e-6 * width[index], 1e-5)
        plus = seed.copy()
        minus = seed.copy()
        plus[index] = min(seed[index] + step, upper[index] - 1e-10)
        minus[index] = max(seed[index] - step, lower[index] + 1e-10)
        denominator = plus[index] - minus[index]
        result[:, index] = (
            equations(plus, atom) - equations(minus, atom)
        ) / denominator
    return result


def assess(
    parameters: np.ndarray, order: tuple[str, ...], atom: surface.SecondManifestAtom,
    selected: list[int], *, elapsed: float, nfev: int, message: str,
) -> dict[str, object]:
    eq = equations(parameters, atom)
    groups = surface.all_margin_groups(parameters, order, atom)
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
    order_ok = tuple(
        surface.upstream.full.cyclic_order(surface.upstream.construct(parameters))
    ) == order
    equality_hit = float(np.max(np.abs(eq))) < 1e-9
    accepted = (
        equality_hit and order_ok and cell_min > 0 and x21_min > 0 and second_min > 0
    )
    status = (
        "NUMERIC_SAT_CANDIDATE" if accepted else
        "RELAXED_EQUALITY_HIT_GATE_FAILURE" if equality_hit else
        "UNKNOWN_NO_HIT"
    )
    return {
        "schema": "source-faithful-second-blocker-local-six-dof-v1",
        "epistemic_status": (
            "BOUNDED_NUMERIC_SAT_CANDIDATE_UNCERTIFIED" if accepted else
            "BOUNDED_NUMERIC_RELAXED_HIT_NOT_A_CANDIDATE" if equality_hit else
            "BOUNDED_NUMERIC_UNKNOWN_NO_HIT"
        ),
        "status": status,
        "atom": atom.render(),
        "selected_parameter_indices": selected,
        "result": {
            "parameters": parameters.tolist(),
            "equality_max_normalized_residual": float(np.max(np.abs(eq))),
            "x21_row_max_normalized_residual": float(np.max(np.abs(eq[:3]))),
            "second_row_max_normalized_residual": float(np.max(np.abs(eq[3:]))),
            "minimum_cell_margin": cell_min,
            "minimum_x21_manifest_margin": x21_min,
            "minimum_second_manifest_margin": second_min,
            "minimum_by_group": minimums,
            "order_ok": order_ok,
            "nfev": nfev,
            "solver_message": message,
        },
        "elapsed_seconds": elapsed,
        "coverage_claim": False,
        "unsat_claim": False,
    }


def solve(task: dict[str, object]) -> dict[str, object]:
    started = time.monotonic()
    atom_payload = task["atom"]
    atom = surface.SecondManifestAtom(
        center=str(atom_payload["center"]),
        source=str(atom_payload["critical_source"]),
        support=tuple(atom_payload["support"]),
        seed_spread=float(atom_payload["seed_spread"]),
    )
    seed = np.array(task["seed"], dtype=float)
    order = tuple(task["order"])
    lower, upper = surface.upstream.search_bounds()
    jacobian = numerical_jacobian(seed, atom, lower, upper)
    rank = int(np.linalg.matrix_rank(jacobian, tol=1e-9))
    if rank < 6:
        payload = assess(
            seed, order, atom, [], elapsed=time.monotonic() - started,
            nfev=0, message=f"rank deficient local Jacobian: rank {rank}",
        )
        payload["local_jacobian_rank"] = rank
        return payload
    _q, _r, pivots = qr(jacobian, mode="economic", pivoting=True)
    selected = [int(index) for index in pivots[:6]]
    x0 = seed[selected]
    local_lower = lower[selected]
    local_upper = upper[selected]

    def local_equations(values: np.ndarray) -> np.ndarray:
        parameters = seed.copy()
        parameters[selected] = values
        return equations(parameters, atom)

    result = least_squares(
        local_equations, x0, bounds=(local_lower, local_upper),
        max_nfev=int(task["max_nfev"]),
        ftol=1e-13, xtol=1e-13, gtol=1e-13,
    )
    parameters = seed.copy()
    parameters[selected] = result.x
    payload = assess(
        parameters, order, atom, selected,
        elapsed=time.monotonic() - started, nfev=int(result.nfev),
        message=str(result.message),
    )
    payload["local_jacobian_rank"] = rank
    payload["local_jacobian_singular_values"] = np.linalg.svd(
        jacobian[:, selected], compute_uv=False
    ).tolist()
    return payload


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--max-nfev", type=int, default=1000)
    parser.add_argument("--max-tasks", type=int, default=76)
    parser.add_argument("--supports-per-center", type=int, default=4)
    parser.add_argument("--log", type=Path, default=HERE / "six-dof-log.jsonl")
    parser.add_argument("--checkpoint", type=Path, default=HERE / "six-dof-checkpoint.json")
    args = parser.parse_args()
    if min(args.workers, args.max_nfev, args.max_tasks, args.supports_per_center) <= 0:
        raise ValueError("all budgets must be positive")
    if args.workers > 12:
        raise ValueError("this lane is capped at 12 workers")

    started = time.monotonic()
    seed, order = surface.load_seed()
    atoms = surface.enumerate_atoms(seed, order, args.supports_per_center)[:args.max_tasks]
    smoke = surface.smoke_test(seed, order, atoms)
    header = {
        "schema": "source-faithful-second-blocker-local-six-dof-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": "START",
        "instrument": "rank-revealing local square solve; full post-replay gates",
        "smoke_test": smoke,
        "budgets": {
            "workers": args.workers,
            "max_nfev": args.max_nfev,
            "max_tasks": len(atoms),
            "supports_per_center": args.supports_per_center,
        },
        "coverage_claim": False,
        "unsat_claim": False,
    }
    surface.append_jsonl(args.log, header)
    surface.atomic_json(args.checkpoint, header)
    tasks = [
        {
            "seed": seed.tolist(), "order": list(order), "atom": atom.render(),
            "max_nfev": args.max_nfev,
        }
        for atom in atoms
    ]
    results: list[dict[str, object]] = []
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = [executor.submit(solve, task) for task in tasks]
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            surface.append_jsonl(args.log, result)
            print(json.dumps({
                "status": result["status"],
                "atom": result["atom"]["key"],
                "residual": result["result"]["equality_max_normalized_residual"],
                "cell": result["result"]["minimum_cell_margin"],
                "x21_manifest": result["result"]["minimum_x21_manifest_margin"],
                "second_manifest": result["result"]["minimum_second_manifest_margin"],
                "indices": result["selected_parameter_indices"],
            }), flush=True)

    accepted = [item for item in results if item["status"] == "NUMERIC_SAT_CANDIDATE"]
    relaxed = [
        item for item in results if item["status"] == "RELAXED_EQUALITY_HIT_GATE_FAILURE"
    ]
    strongest = min(
        results,
        key=lambda item: (
            0 if item["status"] == "NUMERIC_SAT_CANDIDATE" else
            1 if item["status"] == "RELAXED_EQUALITY_HIT_GATE_FAILURE" else 2,
            item["result"]["equality_max_normalized_residual"],
            -item["result"]["minimum_cell_margin"],
        ),
    )
    terminal = {
        "schema": "source-faithful-second-blocker-local-six-dof-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": "BOUNDED_LOCAL_SIX_DOF_COMPLETE",
        "elapsed_seconds": time.monotonic() - started,
        "smoke_test": smoke,
        "budgets": header["budgets"],
        "results": {
            "attempted": len(results),
            "numeric_sat_candidates": len(accepted),
            "relaxed_equality_hits_gate_failure": len(relaxed),
            "unknown_no_hit": len(results) - len(accepted) - len(relaxed),
        },
        "strongest_candidate": strongest,
        "coverage_claim": False,
        "unsat_claim": False,
    }
    surface.append_jsonl(args.log, terminal)
    surface.atomic_json(args.checkpoint, terminal)
    print(json.dumps(terminal, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
