"""Numerical Stage-A diagnostic for the B1 Wave 7 fixed order cell.

The computation is deliberately a metric diagnostic.  A positive numerical
margin is a candidate for rational replay; failure to find one is ``UNKNOWN``
and never an UNSAT claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from collections.abc import Sequence
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import differential_evolution

SCHEMA = "b1-wave7-stagea-order-cell/v1"
EVENT_SCHEMA = "b1-wave7-stagea-order-cell-event/v1"
ORDER = (
    "A",
    "d1",
    "cR",
    "cL",
    "Bc",
    "d2",
    "u0",
    "Bu",
    "uR",
    "uL",
    "u1",
    "vL",
    "vR",
    "v0",
    "Bv",
    "v1",
)
PHYSICAL = ("d1", "d2", "u0", "u1", "v0", "v1")
PHYSICAL_FREE = ("d1", "d2", "u0", "v0", "v1")
ROW_SPECS = (
    ("Bc", "d1", "d2", "cR", "cL"),
    ("Bu", "u0", "u1", "uR", "uL"),
    ("Bv", "v0", "v1", "vL", "vR"),
)
DIMENSION = 14
PARAMETER_NAMES = (
    *PHYSICAL_FREE,
    "k_Bc",
    "theta_cR",
    "theta_cL",
    "k_Bu",
    "theta_uR",
    "theta_uL",
    "k_Bv",
    "theta_vL",
    "theta_vR",
)
DEFAULT_ROOT = Path("scratch/runs/b1-normalform-order-20260831/wave-7")
RESULT_REL = Path("artifacts/b1-wave7-stagea-order-cell-result.json")
EVENT_REL = Path("events/b1-wave7-stagea-order-cell.json")
SOURCE_REL = Path("artifacts/executed-source/b1_wave7_stagea_order_cell.py")
CHECKSUMS_REL = Path("artifacts/SHA256SUMS")

CLAIM_BOUNDARY = {
    "positive_margin": (
        "numerical SAT candidate only; rational replay and exact audit are "
        "required"
    ),
    "failure": "UNKNOWN; failure to find a margin is never UNSAT",
    "omitted": (
        "cap/MEC data, deletion-survival provenance, aliases, and exhaustion "
        "of the ambient carrier"
    ),
}


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        allow_nan=False,
        ensure_ascii=True,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8") + b"\n"


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _point(value: Sequence[float]) -> np.ndarray:
    return np.asarray(value, dtype=float)


def stereographic_point(parameter: float) -> tuple[float, float]:
    """Map a real stereographic parameter to the unit circle."""

    t = float(parameter)
    denominator = 1.0 + t * t
    return ((1.0 - t * t) / denominator, 2.0 * t / denominator)


def rotate(vector: Sequence[float], angle: float) -> np.ndarray:
    cosine, sine = math.cos(float(angle)), math.sin(float(angle))
    x, y = _point(vector)
    return np.array((cosine * x - sine * y, sine * x + cosine * y))


def decode_parameters(parameters: Sequence[float]) -> tuple[dict[str, float], dict[str, tuple[float, float, float]]]:
    values = tuple(float(value) for value in parameters)
    if len(values) != DIMENSION:
        raise ValueError(f"expected {DIMENSION} parameters, got {len(values)}")
    physical = dict(zip(PHYSICAL_FREE, values[:5], strict=True))
    physical["u1"] = 0.0
    rows = {
        name: (values[offset], values[offset + 1], values[offset + 2])
        for offset, (name, *_rest) in zip(range(5, DIMENSION, 3), ROW_SPECS, strict=True)
    }
    return physical, rows


def realize_points(parameters: Sequence[float]) -> dict[str, tuple[float, float]]:
    physical, rows = decode_parameters(parameters)
    points: dict[str, np.ndarray] = {"A": np.zeros(2)}
    points.update(
        {name: _point(stereographic_point(value)) for name, value in physical.items()}
    )
    for blocker, first, second, left, right in ROW_SPECS:
        scale, left_angle, right_angle = rows[blocker]
        first_point, second_point = points[first], points[second]
        midpoint = (first_point + second_point) / 2.0
        blocker_point = 2.0 * scale * midpoint
        points[blocker] = blocker_point
        points[left] = blocker_point + rotate(first_point - blocker_point, left_angle)
        points[right] = blocker_point + rotate(second_point - blocker_point, right_angle)
    return {
        name: (float(points[name][0]), float(points[name][1]))
        for name in ORDER
    }


def _cross(first: np.ndarray, second: np.ndarray) -> float:
    return float(first[0] * second[1] - first[1] * second[0])


def _distance(first: np.ndarray, second: np.ndarray, third: np.ndarray) -> float:
    edge = second - first
    length = float(np.linalg.norm(edge))
    if length == 0.0:
        return -0.0
    return _cross(edge, third - first) / length


def evaluate_candidate(parameters: Sequence[float]) -> dict[str, Any]:
    """Return all fixed-order edge slacks and strict parameter guards."""

    points = realize_points(parameters)
    vectors = {name: _point(value) for name, value in points.items()}
    edge_slacks: dict[str, float] = {}
    for index, first in enumerate(ORDER):
        second = ORDER[(index + 1) % len(ORDER)]
        for third in ORDER:
            if third not in (first, second):
                edge_slacks[f"{first}->{second}|{third}"] = _distance(
                    vectors[first], vectors[second], vectors[third]
                )
    physical, rows = decode_parameters(parameters)
    ordered = [physical[name] for name in ("d1", "d2", "u0", "u1", "v0", "v1")]
    guard_slacks = {
        f"physical_parameter:{left}<{right}": right_value - left_value
        for left, right, left_value, right_value in zip(
            PHYSICAL[:-1], PHYSICAL[1:], ordered[:-1], ordered[1:], strict=True
        )
    }
    guard_slacks.update(
        {f"blocker_scale:{name}>1/2": values[0] - 0.5 for name, values in rows.items()}
    )
    all_slacks = (*edge_slacks.values(), *guard_slacks.values())
    margin = min(all_slacks) if all_slacks else float("-inf")
    return {
        "margin": float(margin),
        "edge_slacks": edge_slacks,
        "guard_slacks": guard_slacks,
        "points": points,
        "physical_parameters": physical,
        "row_parameters": {
            name: {"k": values[0], "left_rotation": values[1], "right_rotation": values[2]}
            for name, values in rows.items()
        },
    }


def objective(parameters: Sequence[float]) -> float:
    return -evaluate_candidate(parameters)["margin"]


def parameter_bounds() -> tuple[tuple[float, float], ...]:
    return ((-8.0, 8.0),) * 5 + ((0.500001, 4.0), (-math.pi, math.pi)) * 3


def run_optimization(
    seeds: Sequence[int], *, iterations: int = 300, popsize: int = 15
) -> list[dict[str, Any]]:
    if not seeds:
        raise ValueError("at least one integer seed is required")
    if iterations < 1 or popsize < 1:
        raise ValueError("iterations and popsize must be positive")
    records = []
    for seed in seeds:
        result = differential_evolution(
            objective,
            parameter_bounds(),
            seed=int(seed),
            maxiter=int(iterations),
            popsize=int(popsize),
            polish=False,
            workers=1,
            updating="immediate",
        )
        candidate = evaluate_candidate(result.x)
        margin = float(candidate["margin"])
        records.append(
            {
                "seed": int(seed),
                "iterations": int(iterations),
                "popsize": int(popsize),
                "optimizer_success": bool(getattr(result, "success", True)),
                "optimizer_message": str(getattr(result, "message", "")),
                "objective": float(result.fun),
                "margin": margin,
                "claim_status": (
                    "NUMERICAL_SAT_CANDIDATE" if margin > 0.0 else "UNKNOWN"
                ),
                "candidate": candidate,
            }
        )
    return records


def build_documents(
    records: Sequence[dict[str, Any]], *, seeds: Sequence[int], iterations: int, popsize: int
) -> dict[Path, bytes]:
    best = max((float(record["margin"]) for record in records), default=None)
    result = {
        "schema": SCHEMA,
        "order": list(ORDER),
        "physical_free_parameters": list(PHYSICAL_FREE),
        "physical_rotation_gauge": {"u1": 0.0},
        "parameter_dimension": DIMENSION,
        "parameter_names": list(PARAMETER_NAMES),
        "claim_boundary": CLAIM_BOUNDARY,
        "search": {"seeds": [int(seed) for seed in seeds], "iterations": iterations, "popsize": popsize},
        "best_margin": best,
        "claim_status": (
            "NUMERICAL_SAT_CANDIDATE"
            if best is not None and best > 0.0
            else "UNKNOWN"
        ),
        "records": list(records),
    }
    result_bytes = canonical_json_bytes(result)
    event = {
        "schema": EVENT_SCHEMA,
        "result_sha256": sha256_bytes(result_bytes),
        "claim_status": result["claim_status"],
        "record_count": len(records),
        "positive_margin_is_not_exact_proof": True,
    }
    documents = {
        RESULT_REL: result_bytes,
        EVENT_REL: canonical_json_bytes(event),
        SOURCE_REL: Path(__file__).read_bytes(),
    }
    lines = [
        f"{sha256_bytes(payload)}  {path.as_posix()}"
        for path, payload in sorted(documents.items(), key=lambda item: item[0].as_posix())
    ]
    documents[CHECKSUMS_REL] = ("\n".join(lines) + "\n").encode("ascii")
    return documents


def write_documents(documents: dict[Path, bytes], *, output_root: Path, overwrite: bool = False) -> None:
    targets = {output_root / path: payload for path, payload in documents.items()}
    existing = sorted(path for path in targets if path.exists())
    if existing and not overwrite:
        raise FileExistsError("refusing to overwrite existing outputs: " + ", ".join(map(str, existing)))
    for path, payload in targets.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        if overwrite:
            path.write_bytes(payload)
        else:
            with path.open("xb") as handle:
                handle.write(payload)


def verify_checksum_ledger(output_root: Path) -> None:
    ledger = output_root / CHECKSUMS_REL
    if not ledger.is_file():
        raise AssertionError(f"missing:{ledger}")
    mismatches = []
    seen: set[Path] = set()
    expected_paths = {RESULT_REL, EVENT_REL, SOURCE_REL}
    for line in ledger.read_text(encoding="ascii").splitlines():
        try:
            digest, relative = line.split("  ", 1)
        except ValueError as error:
            raise AssertionError("malformed checksum ledger line") from error
        relative_path = Path(relative)
        if relative_path in seen:
            raise AssertionError(f"duplicate checksum entry: {relative}")
        if relative_path not in expected_paths:
            raise AssertionError(f"unexpected checksum entry: {relative}")
        seen.add(relative_path)
        target = output_root / relative_path
        if not target.is_relative_to(output_root):
            raise AssertionError(f"artifact escapes output root: {relative}")
        if not target.is_file():
            mismatches.append(f"missing:{target}")
        elif sha256_bytes(target.read_bytes()) != digest:
            mismatches.append(f"mismatch:{target}")
    if mismatches:
        raise AssertionError("; ".join(mismatches))
    if seen != expected_paths:
        missing = ", ".join(str(path) for path in sorted(expected_paths - seen))
        raise AssertionError(f"missing checksum entries: {missing}")


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-root", type=Path, default=DEFAULT_ROOT)
    parser.add_argument("--seed", type=int, action="append", dest="seeds", default=[])
    parser.add_argument("--iterations", type=int, default=300)
    parser.add_argument("--popsize", type=int, default=15)
    parser.add_argument("--verify-only", action="store_true")
    parser.add_argument("--overwrite", action="store_true")
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> None:
    args = parse_args(argv)
    if args.verify_only:
        verify_checksum_ledger(args.output_root)
        print(json.dumps({"status": "PASS", "mode": "verify-only"}, sort_keys=True))
        return
    seeds = tuple(args.seeds) or (0,)
    records = run_optimization(seeds, iterations=args.iterations, popsize=args.popsize)
    documents = build_documents(records, seeds=seeds, iterations=args.iterations, popsize=args.popsize)
    write_documents(documents, output_root=args.output_root, overwrite=args.overwrite)
    print(json.dumps({"status": "PASS", "mode": "write", "output_root": str(args.output_root), "files": len(documents)}, sort_keys=True))


if __name__ == "__main__":
    main()
