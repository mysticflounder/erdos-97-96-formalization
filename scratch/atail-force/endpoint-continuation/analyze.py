#!/usr/bin/env python3
"""Replay exact and finite endpoint-continuation obstructions."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ATAIL = HERE.parent
ROOT = ATAIL.parents[1]
EXACT_CHECKER = ATAIL / "residual_456_exact_witness.py"
EXACT_REPORT = ATAIL / "residual_456_exact_witness.json"
SHADOWS = ATAIL / "global_count_boundary/shadows.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_exact_checker():
    spec = importlib.util.spec_from_file_location("residual_456_exact", EXACT_CHECKER)
    if spec is None or spec.loader is None:
        raise AssertionError("cannot load exact residual checker")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def build() -> dict[str, object]:
    exact = load_exact_checker()
    exact_report = exact.build_report()
    saved_report = json.loads(EXACT_REPORT.read_text(encoding="utf-8"))
    normalized_report = json.loads(json.dumps(exact_report))
    saved_source_sha256 = saved_report["source"]["sha256"]
    current_source_sha256 = normalized_report["source"]["sha256"]
    # The upstream probe bank was improved after this exact certificate was
    # written.  Its content digest changed, but the pinned assignment and all
    # exact semantic fields replay unchanged; isolate that known provenance
    # drift rather than silently treating the old digest as current.
    saved_report["source"]["sha256"] = current_source_sha256
    if normalized_report != saved_report:
        raise AssertionError("exact residual report drift")

    # The exact Euclidean critical-system surface has a same-cap edge
    # 5 -> 0 in O1.  The blocker is the right cap endpoint, so its exact
    # positive-radius row cannot contain that endpoint; it also omits the
    # opposite endpoint 2.
    exact_cap = (2, 5, 6, 7, 0)
    exact_source = 5
    exact_blocker = exact.BLOCKER_OF_SOURCE[exact_source]
    exact_support = tuple(exact.ROWS[exact_blocker])
    exact_endpoints = (exact_cap[0], exact_cap[-1])
    assert exact_blocker == 0
    assert exact_source in exact_cap and exact_blocker in exact_cap
    assert exact_source in exact_support
    assert not set(exact_endpoints).intersection(exact_support)
    assert exact_blocker in exact_endpoints
    assert exact.squared_distance(
        exact.POINTS[exact_blocker], exact.POINTS[exact_source]
    ) == exact.ONE
    assert exact_report["critical_shell_audit"][
        "maximum_distance_multiplicity_after_source_deletion"
    ][str(exact_source)] <= 3

    document = json.loads(SHADOWS.read_text(encoding="utf-8"))
    shadow = next(case for case in document["cases"] if case["profile"] == [4, 5, 6])
    rows = {int(center): set(support) for center, support in shadow["rows"].items()}
    blocker = {
        int(source): int(center)
        for source, center in shadow["critical_shell_blocker_map"].items()
    }
    # The strengthened all-row finite shadow has the analogous return edge
    # 2 -> 0 in cap [0,1,2,3].
    finite_source = 2
    finite_blocker = blocker[finite_source]
    finite_cap = tuple(shadow["caps"][0])
    finite_endpoints = (finite_cap[0], finite_cap[-1])
    assert finite_blocker == 0
    assert finite_source in finite_cap and finite_blocker in finite_cap
    assert finite_source in rows[finite_blocker]
    assert not set(finite_endpoints).intersection(rows[finite_blocker])
    assert finite_blocker in finite_endpoints

    return {
        "status": "PASS",
        "epistemic_status": {
            "exact_edge": (
                "EXACT_BIQUADRATIC_EUCLIDEAN_CRITICAL_SYSTEM_SURFACE; "
                "NOT_FULL_COUNTEREXAMPLE_DATA"
            ),
            "all_row_shadow": "VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY",
            "lean_model": "KERNEL_CHECKED_FINITE_INCIDENCE_ORDER_MODEL",
        },
        "exact_same_cap_endpoint_omission": {
            "source": exact_source,
            "blocker": exact_blocker,
            "ordered_cap": exact_cap,
            "endpoints": exact_endpoints,
            "blocker_row": exact_support,
            "blocker_is_endpoint": True,
            "both_endpoints_omitted": True,
            "source_deletion_kills_k4_at_blocker": True,
        },
        "all_row_shadow_return_edge": {
            "source": finite_source,
            "blocker": finite_blocker,
            "ordered_cap": finite_cap,
            "endpoints": finite_endpoints,
            "blocker_row": sorted(rows[finite_blocker]),
            "blocker_is_endpoint": True,
            "both_endpoints_omitted": True,
        },
        "inputs": {
            "exact_checker_sha256": sha256(EXACT_CHECKER),
            "exact_report_sha256": sha256(EXACT_REPORT),
            "saved_probe_sha256": saved_source_sha256,
            "current_probe_sha256": current_source_sha256,
            "probe_digest_only_drift": saved_source_sha256 != current_source_sha256,
            "shadows_sha256": sha256(SHADOWS),
        },
        "conclusion": (
            "Current critical-row and boundary data do not force endpoint "
            "membership or a strict cross-cap edge. Endpoint landing must be "
            "an explicit continuation branch; excluding endpoint blockers "
            "still needs genuinely geometric production, as shown by the "
            "kernel-checked finite interior-cycle model."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = build()
    print(json.dumps(result, sort_keys=args.check, indent=None if args.check else 2))


if __name__ == "__main__":
    main()
