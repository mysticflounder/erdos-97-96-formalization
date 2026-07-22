#!/usr/bin/env python3
"""Replay total criticality with a protected strict-interior singleton.

The pinned 35-point exact model is not on the unique-four leaf: its first
apex class has cardinality five.  It is used here for one sharply limited
independence test.  It has a total exact ``CriticalShellSystem`` assignment,
and the protected first-apex source ``J`` is deletion-critical at the strict
MEC-interior carrier center ``F_k4_1`` outside the protected set.  Hence total
criticality plus protected singleton provenance does not generally force the
new center onto the MEC boundary.

All-center K4 fails in the model.  The checker therefore does not construct
``CounterexampleData`` and makes no claim about the full unique-four theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
MODEL_PATH = (
    HERE.parent
    / "global-critical-continuation"
    / "verify_total_css_completion.py"
)
CHECKPOINT_PATH = HERE / "total_css_checkpoint.json"
EXPECTED_MODEL_SHA256 = (
    "adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7"
)


def load_model() -> Any:
    digest = hashlib.sha256(MODEL_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_MODEL_SHA256, (
        "the pinned total-CSS model changed; re-audit this independence check "
        f"(expected {EXPECTED_MODEL_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location("total_css_model", MODEL_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def check() -> dict[str, object]:
    model = load_model()
    result = model.check()
    assert result["status"] == "PASS"
    assert result["total_critical_shell_system_exists"] is True
    assert result["all_center_global_k4"] is False

    points = model.build_points()
    profiles = {
        center: model.G.radius_profile(points, center) for center in sorted(points)
    }
    boundary = {"A", "C", "O"}
    first_class = model.G.named_class(profiles["O"], sp.Integer(1))
    assert first_class == {"A", "C", "D", "E", "J"}
    protected = first_class | boundary

    source = "J"
    row = result["critical_assignment"][source]
    center = row["center"]
    support = set(row["support"])
    assert center == "F_k4_1"
    assert source in protected
    assert center not in protected
    assert source in support and len(support) == 4
    assert not model.R.has_k4_after_deletion(profiles[center], {source})

    mec_center = model.G.point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_squared = sp.Rational(1, 3)
    defect = sp.factor(
        mec_radius_squared
        - model.G.squared_distance(mec_center, points[center])
    )
    model.G.exact_positive(defect)

    return {
        "schema": 1,
        "status": "PASS_TOTAL_CSS_PROTECTED_SINGLETON_STRICT_INTERIOR",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "model_sha256": EXPECTED_MODEL_SHA256,
        "carrier_card": len(points),
        "unique_mec_boundary": sorted(boundary),
        "first_apex_class_card": len(first_class),
        "protected_deletion_set": sorted(protected),
        "protected_source": source,
        "strict_interior_blocker_center": center,
        "critical_support": sorted(support),
        "source_deletion_blocks_at_center": True,
        "total_critical_shell_system_exists": True,
        "all_center_global_k4": False,
        "scope": (
            "total CSS and protected strict-interior singleton are compatible "
            "on an exact-five local model; unique-four and all-center K4 are not supplied"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="compare the exact result with the pinned checkpoint",
    )
    args = parser.parse_args()
    result = check()
    if args.check:
        expected = json.loads(CHECKPOINT_PATH.read_text(encoding="utf-8"))
        assert result == expected, "total-CSS independence regression drifted"
        print("PASS: total-CSS strict-interior independence matches checkpoint.json")
    else:
        print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
