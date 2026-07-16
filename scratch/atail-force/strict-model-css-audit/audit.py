#!/usr/bin/env python3
"""Exact total-critical-shell audit of the pinned 29-point strict model.

This checker answers two questions that the source model deliberately left
open:

* does every carrier source admit a carrier-centered exact four-class whose
  center loses every K4 witness when that source is deleted; and
* can a center reported as lacking global K4 be repaired by choosing another
  radius class already present in the same fixed coordinates?

All radius equality tests are exact SymPy computations.  This is not a Lean
kernel certificate and it makes no claim beyond the pinned 29-point carrier.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
MODEL_PATH = HERE.parent / "robust-four-center" / "verify_strict_convex_local_gap.py"
CHECKPOINT_PATH = HERE / "checkpoint.json"

EXPECTED_MODEL_FILE_SHA256 = (
    "98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698"
)
EXPECTED_COORDINATE_SHA256 = (
    "b07182bc396ee9b6131961e2a80f5ce420706bf9bb6f292d90471d80300c83c4"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def load_model() -> Any:
    digest = sha256(MODEL_PATH)
    assert digest == EXPECTED_MODEL_FILE_SHA256, (
        "the pinned 29-point checker changed; re-audit before accepting this "
        f"result (expected {EXPECTED_MODEL_FILE_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location("p97_strict_29_point_model", MODEL_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def expression_string(model: Any, value: sp.Expr) -> str:
    return model.expression_string(value)


def canonical_profile_partition(
    profiles: dict[str, dict[sp.Expr, set[str]]],
) -> dict[str, list[list[str]]]:
    """Serialize the exhaustive exact-equality partition without huge radii."""

    result: dict[str, list[list[str]]] = {}
    for center, profile in sorted(profiles.items()):
        result[center] = sorted(sorted(support) for support in profile.values())
    return result


def deletion_max_card(profile: dict[sp.Expr, set[str]], source: str) -> int:
    return max((len(support - {source}) for support in profile.values()), default=0)


def exact_critical_shell_candidates(
    model: Any,
    profiles: dict[str, dict[sp.Expr, set[str]]],
    source: str,
) -> list[dict[str, object]]:
    """Enumerate all carrier-centered `CriticalShellSystem` choices at source."""

    candidates: list[dict[str, object]] = []
    for center, profile in sorted(profiles.items()):
        if center == source:
            continue
        post_deletion_max = deletion_max_card(profile, source)
        if post_deletion_max >= 4:
            continue
        for radius, support in profile.items():
            if len(support) == 4 and source in support:
                candidates.append(
                    {
                        "center": center,
                        "radius_squared": expression_string(model, radius),
                        "support": sorted(support),
                        "post_deletion_max_class_card": post_deletion_max,
                    }
                )
    return sorted(
        candidates,
        key=lambda item: (item["center"], item["radius_squared"], item["support"]),
    )


def failed_center_record(
    model: Any,
    center: str,
    profile: dict[sp.Expr, set[str]],
) -> dict[str, object]:
    """Record the exhaustive obstruction to repairing K4 at one center."""

    max_card = max((len(support) for support in profile.values()), default=0)
    histogram = Counter(len(support) for support in profile.values())
    largest_classes = [
        {
            "radius_squared": expression_string(model, radius),
            "support": sorted(support),
        }
        for radius, support in profile.items()
        if len(support) == max_card
    ]
    sorted_largest_classes = sorted(
        largest_classes,
        key=lambda item: (item["radius_squared"], item["support"]),
    )
    return {
        "center": center,
        "radius_class_count": len(profile),
        "class_card_histogram": {
            str(card): count for card, count in sorted(histogram.items())
        },
        "max_class_card": max_card,
        "largest_class_count": len(largest_classes),
        "largest_classes_sha256": canonical_sha256(sorted_largest_classes),
        # Singleton-only profiles can have 28 enormous algebraic radii.  Their
        # complete partition is pinned globally; spelling all 28 out obscures
        # the actual obstruction.  Non-singleton maxima remain human-readable.
        "largest_classes": sorted_largest_classes if max_card > 1 else [],
        "alternate_existing_k4_class_exists": max_card >= 4,
    }


def missing_source_diagnostic(
    model: Any,
    profiles: dict[str, dict[sp.Expr, set[str]]],
    source: str,
) -> dict[str, object]:
    """Explain every ambient class of cardinality at least four through source."""

    large_classes = []
    for center, profile in sorted(profiles.items()):
        if center == source:
            continue
        for radius, support in profile.items():
            if len(support) >= 4 and source in support:
                post_deletion_max = deletion_max_card(profile, source)
                large_classes.append(
                    {
                        "center": center,
                        "radius_squared": expression_string(model, radius),
                        "class_card": len(support),
                        "support": sorted(support),
                        "post_deletion_max_class_card": post_deletion_max,
                        "is_exact_four": len(support) == 4,
                        "is_critical_shell_candidate": (
                            len(support) == 4 and post_deletion_max < 4
                        ),
                    }
                )
    return {
        "source": source,
        "large_classes_through_source": sorted(
            large_classes,
            key=lambda item: (item["center"], item["radius_squared"]),
        ),
    }


def audit() -> dict[str, object]:
    model = load_model()

    # Replay the source model's exact strict-convex/MEC/cap/local-robust gates.
    source_report = model.check()
    assert source_report["status"] == "PASS"
    assert source_report["coordinate_sha256"] == EXPECTED_COORDINATE_SHA256

    points = model.build_points()
    assert len(points) == 29
    assert model.coordinate_digest(points) == EXPECTED_COORDINATE_SHA256
    profiles = {
        center: model.G.radius_profile(points, center) for center in sorted(points)
    }
    profile_partition = canonical_profile_partition(profiles)

    candidates_by_source = {
        source: exact_critical_shell_candidates(model, profiles, source)
        for source in sorted(points)
    }
    sources_without_candidate = sorted(
        source for source, candidates in candidates_by_source.items() if not candidates
    )
    missing_source_diagnostics = [
        missing_source_diagnostic(model, profiles, source)
        for source in sources_without_candidate
    ]

    # `CriticalShellSystem.shellAt` makes independent pointwise choices; it
    # imposes no injectivity or distinct-center constraint on the blocker map.
    total_assignment_exists = not sources_without_candidate
    one_total_assignment = (
        {
            source: candidates[0]["center"]
            for source, candidates in candidates_by_source.items()
        }
        if total_assignment_exists
        else None
    )

    global_k4_failures = [
        failed_center_record(model, center, profile)
        for center, profile in sorted(profiles.items())
        if max((len(support) for support in profile.values()), default=0) < 4
    ]
    assert [record["center"] for record in global_k4_failures] == source_report[
        "centers_without_k4"
    ]
    assert all(
        not record["alternate_existing_k4_class_exists"]
        for record in global_k4_failures
    )

    return {
        "schema": 1,
        "status": "PASS_AUDIT_TOTAL_CSS_ABSENT",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "epistemic_scope": (
            "exact exhaustive radius-class computation for the pinned 29-point "
            "coordinates only; it neither varies coordinates nor certifies a "
            "Lean theorem"
        ),
        "model_file_sha256": EXPECTED_MODEL_FILE_SHA256,
        "coordinate_sha256": EXPECTED_COORDINATE_SHA256,
        "radius_class_partition_sha256": canonical_sha256(profile_partition),
        "carrier_card": len(points),
        "carrier_centers_scanned": len(profiles),
        "positive_radius_classes_scanned": sum(map(len, profiles.values())),
        "critical_shell_candidate_counts": {
            source: len(candidates)
            for source, candidates in candidates_by_source.items()
        },
        "critical_shell_candidates_sha256": canonical_sha256(candidates_by_source),
        "critical_shell_candidates_by_source": candidates_by_source,
        "total_critical_shell_system_exists": total_assignment_exists,
        "one_total_source_to_blocker_assignment": one_total_assignment,
        "sources_without_critical_shell_candidate": sources_without_candidate,
        "missing_source_diagnostics": missing_source_diagnostics,
        "all_center_global_k4": not global_k4_failures,
        "global_k4_failure_count": len(global_k4_failures),
        "global_k4_failures_sha256": canonical_sha256(global_k4_failures),
        "global_k4_failures": global_k4_failures,
        "all_global_k4_failures_exhaust_alternate_existing_classes": True,
        "any_global_k4_failure_repairable_without_coordinate_changes": False,
    }


def checkpoint_projection(result: dict[str, object]) -> dict[str, object]:
    """Keep the checkpoint compact while pinning every detailed enumeration."""

    keys = (
        "schema",
        "status",
        "trust_boundary",
        "epistemic_scope",
        "model_file_sha256",
        "coordinate_sha256",
        "radius_class_partition_sha256",
        "carrier_card",
        "carrier_centers_scanned",
        "positive_radius_classes_scanned",
        "critical_shell_candidate_counts",
        "critical_shell_candidates_sha256",
        "total_critical_shell_system_exists",
        "one_total_source_to_blocker_assignment",
        "sources_without_critical_shell_candidate",
        "missing_source_diagnostics",
        "all_center_global_k4",
        "global_k4_failure_count",
        "global_k4_failures_sha256",
        "all_global_k4_failures_exhaust_alternate_existing_classes",
        "any_global_k4_failure_repairable_without_coordinate_changes",
    )
    return {key: result[key] for key in keys}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="compare the exact result with the pinned checkpoint",
    )
    args = parser.parse_args()
    result = audit()
    if args.check:
        expected = json.loads(CHECKPOINT_PATH.read_text(encoding="utf-8"))
        assert checkpoint_projection(result) == expected, (
            "strict-model CSS audit drifted from checkpoint"
        )
        print("PASS: strict-model CSS audit matches checkpoint.json")
    else:
        print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
