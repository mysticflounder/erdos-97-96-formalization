"""Authenticated one-successor CEGAR wave for the FreshThird carrier query.

Each cell freshly replays its parent SAT signature, blocks that complete
source-relevant finite projection, and asks for one distinct successor.  The
four boundary-index cells may run in separate processes.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
from collections.abc import Sequence
from pathlib import Path
from typing import Any

import z3

from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    FALSE_CLAIMS,
    REPO_ROOT,
    RESULT_SCHEMA,
    ROLES,
    _atomic_json,
    _canonical_json,
    _sha256_file,
    build_query,
    model_signature,
    replay_sat_result,
    source_manifest,
)

CEGAR_SCHEMA = "p97-freshthird-qfiber-three-carrier-cegar/v1"
PRODUCER = Path(__file__).resolve()


def _load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text())
    if type(value) is not dict:
        raise ValueError(f"expected JSON object: {path}")
    return value


def _required_dict(value: object, where: str) -> dict[str, Any]:
    if type(value) is not dict:
        raise ValueError(f"expected object at {where}")
    return value


def signature_match(
    query: Any, signature: dict[str, Any]
) -> tuple[z3.BoolRef, int]:
    """Match the complete source-relevant finite projection of a signature."""

    v = query.variables
    point_classes = _required_dict(signature.get("point_classes"), "point_classes")
    cap_witnesses = _required_dict(signature.get("cap_witnesses"), "cap_witnesses")
    in_cap = _required_dict(signature.get("in_cap"), "in_cap")
    interiors = _required_dict(signature.get("in_cap_interior"), "in_cap_interior")
    order = _required_dict(signature.get("order"), "order")
    radius = _required_dict(signature.get("radius_classes"), "radius_classes")
    has_four = _required_dict(
        signature.get("has_four_after_deleting"), "has_four_after_deleting"
    )
    nonrobust = _required_dict(signature.get("nonrobust"), "nonrobust")
    terms: list[z3.BoolRef] = []

    for role in ROLES:
        point_value = point_classes.get(role)
        if type(point_value) is not int:
            raise ValueError(f"missing point class: {role}")
        terms.append(query.point(role) == point_value)
        cap_values = in_cap.get(role)
        interior_values = interiors.get(role)
        if not (
            type(cap_values) is list
            and type(interior_values) is list
            and len(cap_values) == 3
            and len(interior_values) == 3
            and all(type(item) is bool for item in (*cap_values, *interior_values))
        ):
            raise ValueError(f"malformed cap projection: {role}")
        for cap in range(3):
            terms.append(query.cap(role, cap) == cap_values[cap])
            terms.append(query.interior(role, cap) == interior_values[cap])
        robust_value = nonrobust.get(role)
        if type(robust_value) is not bool:
            raise ValueError(f"missing nonrobust projection: {role}")
        terms.append(query.is_nonrobust(role) == robust_value)

    scalar_caps = (
        ("first", v.first_cap),
        ("fresh", v.fresh_cap),
        ("row", v.row_cap),
        ("boundary", v.boundary_cap),
    )
    for name, variable in scalar_caps:
        value = cap_witnesses.get(name)
        if type(value) is not int:
            raise ValueError(f"missing cap witness: {name}")
        terms.append(variable == value)
    for name, variables in (
        ("blocker", v.blocker_cap),
        ("boundary_fan", v.boundary_fan_cap),
    ):
        values = cap_witnesses.get(name)
        if not (
            type(values) is list
            and len(values) == 4
            and all(type(item) is int for item in values)
        ):
            raise ValueError(f"malformed cap witness vector: {name}")
        terms.extend(variable == value for variable, value in zip(variables, values, strict=True))

    # Before is a Boolean relation in Lean; block its order type, not arbitrary
    # integer labels chosen by this encoding.
    for left, right in itertools.combinations(ROLES, 2):
        left_value = order.get(left)
        right_value = order.get(right)
        if type(left_value) is not int or type(right_value) is not int:
            raise ValueError("incomplete boundary-order projection")
        terms.append(query.before(left, right) == (left_value < right_value))

    # SameDistanceFrom is likewise an equality relation.  Match each recorded
    # per-center partition without depending on the model's integer labels.
    for center, values in radius.items():
        if center not in ROLES or not (
            type(values) is list
            and len(values) == len(ROLES)
            and all(type(item) is int for item in values)
        ):
            raise ValueError(f"malformed radius projection: {center}")
        for i, j in itertools.combinations(range(len(ROLES)), 2):
            terms.append(
                query.same_distance(center, ROLES[i], ROLES[j])
                == (values[i] == values[j])
            )

    for center, values in has_four.items():
        if center not in ROLES or not (
            type(values) is list
            and len(values) == len(ROLES)
            and all(type(item) is bool for item in values)
        ):
            raise ValueError(f"malformed deletion projection: {center}")
        for role, value in zip(ROLES, values, strict=True):
            terms.append(query.has4(role, center) == value)

    return z3.And(*terms), len(terms)


def solve_successor(parent: dict[str, Any], *, timeout_ms: int) -> dict[str, object]:
    replay_sat_result(parent, timeout_ms=timeout_ms)
    boundary_index = parent["boundary_index"]
    signature = parent["model_signature"]
    query = build_query(boundary_index, timeout_ms=timeout_ms)
    match, atom_count = signature_match(query, signature)
    query.solver.add(z3.Not(match))
    checked = query.solver.check()
    parent_sha = hashlib.sha256(_canonical_json(parent)).hexdigest()
    common: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "query_schema": parent["query_schema"],
        "boundary_index": boundary_index,
        "source_manifest_sha256": parent["source_manifest_sha256"],
        "constraint_groups": list(query.groups),
        "parent_result_sha256": parent_sha,
        "blocked_model_signature_sha256": parent["model_signature_sha256"],
        "block_projection_atom_count": atom_count,
        "claims": FALSE_CLAIMS,
    }
    if checked == z3.sat:
        successor = model_signature(query, query.solver.model())
        common.update(
            {
                "status": "SAT_ABSTRACTION",
                "model_signature": successor,
                "model_signature_sha256": hashlib.sha256(
                    _canonical_json(successor)
                ).hexdigest(),
            }
        )
    elif checked == z3.unsat:
        common.update(
            {
                "status": "UNSAT_RELAXATION",
                "unsat_core": sorted(str(atom) for atom in query.solver.unsat_core()),
                "promotion_ready": False,
            }
        )
    else:
        common.update(
            {"status": "UNKNOWN", "reason_unknown": query.solver.reason_unknown()}
        )
    return common


def _solve_path(arguments: tuple[str, int]) -> dict[str, object]:
    path, timeout_ms = arguments
    return solve_successor(_load_json(Path(path)), timeout_ms=timeout_ms)


def run_successor_wave(
    parent_dir: Path, out_dir: Path, *, timeout_ms: int, workers: int
) -> dict[str, object]:
    if workers not in range(1, 5):
        raise ValueError("workers must be in range(1, 5)")
    parent_paths = tuple(parent_dir / f"cell-{i}.json" for i in range(4))
    arguments = tuple((str(path), timeout_ms) for path in parent_paths)
    with concurrent.futures.ProcessPoolExecutor(max_workers=workers) as pool:
        results = list(pool.map(_solve_path, arguments))
    results.sort(key=lambda item: item["boundary_index"])
    _atomic_json(out_dir / "manifest.json", source_manifest())
    for result in results:
        _atomic_json(out_dir / f"cell-{result['boundary_index']}.json", result)
    cegar_manifest = {
        "schema": CEGAR_SCHEMA,
        "producer": str(PRODUCER.relative_to(REPO_ROOT)),
        "producer_sha256": _sha256_file(PRODUCER),
        "query_source_manifest_sha256": hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest(),
        "parent_wave": str(parent_dir),
        "parent_results": {
            str(i): hashlib.sha256(parent_paths[i].read_bytes()).hexdigest()
            for i in range(4)
        },
        "workers": workers,
        "timeout_ms": timeout_ms,
        "statuses": {str(item["boundary_index"]): item["status"] for item in results},
        "terminal_unsat_claim": False,
        "claims": FALSE_CLAIMS,
    }
    _atomic_json(out_dir / "cegar-manifest.json", cegar_manifest)
    return cegar_manifest


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent-dir", type=Path, required=True)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--workers", type=int, default=4)
    args = parser.parse_args(argv)
    result = run_successor_wave(
        args.parent_dir,
        args.out_dir,
        timeout_ms=args.timeout_ms,
        workers=args.workers,
    )
    print(json.dumps(result, sort_keys=True))
    return 0 if all(status != "UNKNOWN" for status in result["statuses"].values()) else 2


if __name__ == "__main__":
    raise SystemExit(main())
