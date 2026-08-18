"""Bounded producer search for the equal-center FreshThird coherent arms.

The existing three-carrier Q-fiber query is deliberately specialized to the
opposite-cap arm: it asserts ``fresh_cap != first_cap`` and puts both fresh
endpoints outside ``first_cap``.  That specialization cannot mine the two
coherent residuals in ``TwoSourceFreshThirdResidual``.

This module reuses the source-owned query and changes only those three pinned
route assumptions:

* the source and fresh centers use one common cap;
* that cap is noncanonical (cap ``0`` is the normalized ``oppIndex1``);
* at least one fresh endpoint lies in the common cap.

Results are finite abstraction data only.  SAT is ``SAT_ABSTRACTION``; UNSAT
is ``UNSAT_RELAXATION``.  No result claims Euclidean realizability, a Lean
theorem, or universal closure.  Every emitted model is replayed in a fresh
same-cap query before publication.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path

import z3

from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    FALSE_CLAIMS,
    ROLES,
    CarrierQuery,
    _canonical_json,
    _sha256_file,
    build_query,
    model_signature,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    RESULT_SCHEMA as BASE_RESULT_SCHEMA,
)

SCHEMA = "p97-freshthird-equal-center-coherent-producer/v1"
RESULT_SCHEMA = f"{SCHEMA}/result"
REPO_ROOT = Path(__file__).resolve().parents[2]
BASE_QUERY = REPO_ROOT / (
    "census/p97_search/freshthird_qfiber_three_carrier_query_v1.py"
)
SOURCE_FILES = (
    BASE_QUERY,
    REPO_ROOT / (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "FreshThirdQFiberThreeCarrierFiniteSourceTheory.lean"
    ),
    REPO_ROOT / (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceFreshThirdResidual.lean"
    ),
    Path(__file__),
)


def _atomic_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = _canonical_json(value)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    with temporary.open("wb") as stream:
        stream.write(payload)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def source_manifest() -> dict[str, object]:
    return {
        "schema": SCHEMA,
        "base_query_schema": BASE_RESULT_SCHEMA,
        "route": "equal-center-coherent-noncanonical-same-cap",
        "normalized_opp_index1": 0,
        "changed_pinned_assumptions": [
            "fresh_cap == first_cap",
            "first_cap != 0",
            "freshSourceOne or freshSourceTwo lies in first_cap",
        ],
        "ambient_carrier_enumerated": False,
        "claims": FALSE_CLAIMS,
        "source_files": {
            str(path.relative_to(REPO_ROOT)): _sha256_file(path)
            for path in SOURCE_FILES
        },
    }


def _pinned_group(query: CarrierQuery) -> tuple[z3.BoolRef, z3.BoolRef]:
    for assertion in query.solver.assertions():
        if (
            z3.is_implies(assertion)
            and str(assertion.arg(0)) == "source__pinned_source_theory"
        ):
            return assertion.arg(0), assertion.arg(1)
    raise RuntimeError("pinned source group was not found")


def _same_cap_query(
    boundary_index: int, *, timeout_ms: int, fixed_first_cap: int | None = None
) -> CarrierQuery:
    """Clone the base query while changing only its three cap-route atoms."""

    base = build_query(boundary_index, timeout_ms=timeout_ms)
    track, body = _pinned_group(base)
    v = base.variables
    removed = (
        v.fresh_cap != v.first_cap,
        z3.Not(base.cap("freshSourceOne", v.first_cap)),
        z3.Not(base.cap("freshSourceTwo", v.first_cap)),
    )
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    for assertion in base.solver.assertions():
        if z3.is_implies(assertion):
            if str(assertion.arg(0)) == str(track):
                continue
            solver.add(assertion.arg(1))
        else:
            solver.add(assertion)
    retained = tuple(item for item in body.children() if not any(item.eq(x) for x in removed))
    solver.add(z3.Implies(track, z3.And(*retained)))
    solver.add(v.fresh_cap == v.first_cap)
    if fixed_first_cap is not None:
        if fixed_first_cap not in {1, 2}:
            raise ValueError("fixed_first_cap must be 1 or 2")
        solver.add(v.first_cap == fixed_first_cap)
        solver.add(v.fresh_cap == fixed_first_cap)
    solver.add(v.first_cap != 0)
    solver.add(
        z3.Or(
            base.cap("freshSourceOne", v.first_cap),
            base.cap("freshSourceTwo", v.first_cap),
        )
    )
    return CarrierQuery(boundary_index, solver, v, base.groups)


def _same_arc(order: dict[str, int], left: str, right: str, first: str, second: str) -> bool:
    """Whether two endpoints lie on the same linear open arc of two centers."""

    a = order[left]
    b = order[right]

    def between(x: int) -> bool:
        return (a < x < b) or (b < x < a)

    return between(order[first]) == between(order[second])


def producer_features(signature: dict[str, object]) -> dict[str, object]:
    caps = signature["cap_witnesses"]
    in_cap = signature["in_cap"]
    interiors = signature["in_cap_interior"]
    order = signature["order"]
    radius = signature["radius_classes"]
    assert isinstance(caps, dict)
    assert isinstance(in_cap, dict)
    assert isinstance(interiors, dict)
    assert isinstance(order, dict)
    assert isinstance(radius, dict)
    common_cap = caps["first"]
    endpoint_in_common = [
        role
        for role in ("freshSourceOne", "freshSourceTwo")
        if in_cap[role][common_cap]
    ]
    source_radius = radius["sourceCenter"]
    common_radius = all(
        source_radius[ROLES.index(role)] == source_radius[ROLES.index("canonicalSource")]
        for role in ("canonicalSecondSource", "freshSourceOne", "freshSourceTwo")
    )
    return {
        "aligned_noncanonical_cap": caps["first"] == caps["fresh"] != 0,
        "endpoint_in_common_cap": endpoint_in_common,
        "source_center_interior": interiors["sourceCenter"][common_cap],
        "fresh_center_interior": interiors["freshCenter"][common_cap],
        "common_source_radius_class": common_radius,
        "shared_pair_same_linear_arc": _same_arc(
            order,
            "canonicalSource",
            "canonicalSecondSource",
            "freshSourceOne",
            "freshSourceTwo",
        ),
    }


def _model_block(query: CarrierQuery, signature: dict[str, object]) -> z3.BoolRef:
    """Block one complete source-relevant finite projection."""

    point_classes = signature["point_classes"]
    caps = signature["cap_witnesses"]
    order = signature["order"]
    assert isinstance(point_classes, dict)
    assert isinstance(caps, dict)
    assert isinstance(order, dict)
    equalities: list[z3.BoolRef] = []
    for role in (
        "canonicalSource",
        "canonicalSecondSource",
        "freshSourceOne",
        "freshSourceTwo",
        "freshRemainder0",
        "freshRemainder1",
        "pinnedCenter",
        "sourceCenter",
        "freshCenter",
    ):
        equalities.append(query.point(role) == point_classes[role])
        equalities.append(query.variables.order(query.point(role)) == order[role])
    for name, variable in (
        ("first", query.variables.first_cap),
        ("fresh", query.variables.fresh_cap),
        ("row", query.variables.row_cap),
        ("boundary", query.variables.boundary_cap),
    ):
        equalities.append(variable == caps[name])
    return z3.Not(z3.And(*equalities))


def _replay(query: CarrierQuery, signature: dict[str, object]) -> None:
    point_classes = signature["point_classes"]
    caps = signature["cap_witnesses"]
    order = signature["order"]
    in_cap = signature["in_cap"]
    interiors = signature["in_cap_interior"]
    assert isinstance(point_classes, dict)
    assert isinstance(caps, dict)
    assert isinstance(order, dict)
    assert isinstance(in_cap, dict)
    assert isinstance(interiors, dict)
    for role in ROLES:
        query.solver.add(query.point(role) == point_classes[role])
        query.solver.add(query.variables.order(query.point(role)) == order[role])
        for cap in range(3):
            query.solver.add(query.cap(role, cap) == in_cap[role][cap])
            query.solver.add(query.interior(role, cap) == interiors[role][cap])
    for name, variable in (
        ("first", query.variables.first_cap),
        ("fresh", query.variables.fresh_cap),
        ("row", query.variables.row_cap),
        ("boundary", query.variables.boundary_cap),
    ):
        query.solver.add(variable == caps[name])
    if query.solver.check() != z3.sat:
        raise RuntimeError("same-cap model failed fresh-session replay")


def _solve_cell(
    boundary_index: int,
    *,
    timeout_ms: int,
    max_models: int,
    fixed_first_cap: int | None,
) -> dict[str, object]:
    query = _same_cap_query(
        boundary_index, timeout_ms=timeout_ms, fixed_first_cap=fixed_first_cap
    )
    models: list[dict[str, object]] = []
    for _ in range(max_models):
        checked = query.solver.check()
        if checked == z3.unknown:
            return {
                "schema": RESULT_SCHEMA,
                "boundary_index": boundary_index,
                "status": "UNKNOWN",
                "claims": FALSE_CLAIMS,
                "models": models,
            }
        if checked == z3.unsat:
            break
        signature = model_signature(query, query.solver.model())
        _replay(
            _same_cap_query(
                boundary_index,
                timeout_ms=timeout_ms,
                fixed_first_cap=fixed_first_cap,
            ),
            signature,
        )
        models.append(
            {
                "signature": signature,
                "signature_sha256": hashlib.sha256(_canonical_json(signature)).hexdigest(),
                "features": producer_features(signature),
            }
        )
        query.solver.add(_model_block(query, signature))
    return {
        "schema": RESULT_SCHEMA,
        "boundary_index": boundary_index,
        "status": "SAT_ABSTRACTION" if models else "UNSAT_RELAXATION",
        "claims": FALSE_CLAIMS,
        "models": models,
    }


def run(
    out_dir: Path,
    *,
    timeout_ms: int,
    max_models: int,
    fixed_first_cap: int | None,
) -> dict[str, object]:
    manifest = source_manifest()
    results = [
        _solve_cell(
            i,
            timeout_ms=timeout_ms,
            max_models=max_models,
            fixed_first_cap=fixed_first_cap,
        )
        for i in range(4)
    ]
    summary = {
        "schema": f"{SCHEMA}/run",
        "source_manifest_sha256": hashlib.sha256(_canonical_json(manifest)).hexdigest(),
        "claims": FALSE_CLAIMS,
        "statuses": {str(item["boundary_index"]): item["status"] for item in results},
        "model_count": sum(len(item["models"]) for item in results),
        "feature_counts": {
            key: sum(
                bool(model["features"].get(key))
                for item in results
                for model in item["models"]
            )
            for key in (
                "aligned_noncanonical_cap",
                "common_source_radius_class",
                "shared_pair_same_linear_arc",
            )
        },
    }
    _atomic_json(out_dir / "manifest.json", manifest)
    _atomic_json(out_dir / "results.json", results)
    _atomic_json(out_dir / "summary.json", summary)
    return summary


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-models", type=int, default=2)
    parser.add_argument("--fixed-first-cap", type=int, choices=[1, 2], default=None)
    args = parser.parse_args()
    summary = run(
        args.out_dir,
        timeout_ms=args.timeout_ms,
        max_models=args.max_models,
        fixed_first_cap=args.fixed_first_cap,
    )
    print(json.dumps(summary, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
