#!/usr/bin/env python3
"""Audit the v10 survivor/probe four-point Kalmanson discrepancy.

The ALIVE result records the quotient classes but not the truth assignment of
the required row atoms.  The Euclidean probe pins those classes, asks Z3 for a
fresh outer model, and records that fresh model's positive rows.  This script
pins the probe's recorded row assignment explicitly and checks whether the
production direct four-point extractor recognizes the resulting contradiction.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
CEGAR = HERE / "cegar.py"
RESULT = HERE / "cegar-v10-local-critical-reuse-second.json"
CHECKPOINT = HERE / "cegar-v10-local-critical-reuse-second.checkpoint.json"
PROBE = HERE / "euclidean-survivor-probe-v10-local-critical-reuse-second.json"


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text())
    if not isinstance(value, dict):
        raise ValueError(f"{path} is not a JSON object")
    return value


def load_cegar() -> Any:
    spec = importlib.util.spec_from_file_location("cegar_v10_four_point_audit", CEGAR)
    if spec is None or spec.loader is None:
        raise RuntimeError("could not load cegar.py")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    cg = load_cegar()
    result = load_json(RESULT)
    checkpoint = load_json(CHECKPOINT)
    probe = load_json(PROBE)

    implementation_sha = hashlib.sha256(CEGAR.read_bytes()).hexdigest()
    recorded_implementation_sha = result.get("implementation_sha256")
    if not isinstance(recorded_implementation_sha, str):
        raise ValueError("result has no recorded implementation hash")
    if checkpoint.get("metadata") != result.get("metadata"):
        raise ValueError("result/checkpoint metadata mismatch")

    survivor = result.get("survivor")
    target = probe.get("target")
    if not isinstance(survivor, dict) or not isinstance(target, dict):
        raise ValueError("missing survivor or probe target")
    classes = survivor.get("alias_classes_in_order")
    positive_named_rows = target.get("positive_named_rows")
    if not isinstance(classes, list) or not isinstance(positive_named_rows, list):
        raise ValueError("missing recorded classes or positive rows")

    outer = cg.OuterMap(
        timeout_ms=180_000,
        random_seed=0,
        z_branch=result["z_branch"],
        escape_arm=result["escape_arm"],
        global_tier=result["global_tier"],
    )
    cuts = [
        [cg.Literal.from_json(literal) for literal in raw_core]
        for raw_core in checkpoint["cuts"]
    ]
    for cut in cuts:
        outer.add_cut(cut)

    for cls in classes:
        if not isinstance(cls, list) or not cls:
            raise ValueError("invalid alias class")
        for name in cls[1:]:
            outer.solver.add(outer.same(cls[0], name))
    for left, right in zip(classes, classes[1:], strict=False):
        outer.solver.add(outer.before(left[0], right[0]))

    positive = {tuple(row) for row in positive_named_rows}
    if not positive <= set(outer.required_rows):
        raise ValueError("probe contains an unknown required row")
    for row in outer.required_rows:
        outer.solver.add(outer.rows[row] if row in positive else z3.Not(outer.rows[row]))

    outer.solver.set(timeout=180_000)
    status = outer.solver.check()
    if status != z3.sat:
        raise RuntimeError(f"probe-row-pinned outer replay was {status}")
    model = outer.solver.model()
    if outer.alias_classes(model) != classes:
        raise RuntimeError("probe-row-pinned replay changed the quotient classes")

    cores = outer.direct_four_point_kalmanson_cores(model, limit=None)
    expected = frozenset(
        {
            cg.Literal("order", ("t", "a1")),
            cg.Literal("order", ("a1", "b1")),
            cg.Literal("order", ("b1", "r2")),
            cg.Literal("row", ("a1", "r2", "t", True)),
            cg.Literal("row", ("b1", "r2", "t", True)),
        }
    )
    matches = [core for core in cores if frozenset(core) == expected]

    quotient = cg.QuotientMetricCheck(
        outer,
        model,
        timeout_ms=30_000,
        iteration=int(survivor["iteration"]),
    )
    quotient_status = quotient.check()

    stored_survivor_keys = sorted(survivor)
    output = {
        "artifact_omits_required_row_valuation": not any(
            key in survivor
            for key in (
                "positive_named_rows",
                "positive_required_rows",
                "required_row_assignment",
            )
        ),
        "checkpoint_cut_count": len(cuts),
        "direct_four_point_core_count": len(cores),
        "expected_core": [literal.to_json() for literal in sorted(
            expected, key=lambda literal: (literal.kind, literal.args)
        )],
        "expected_core_match_count": len(matches),
        "probe_positive_required_row_count": len(positive),
        "probe_row_pinned_outer_status": str(status),
        "probe_row_pinned_quotient_metric_status": str(quotient_status),
        "recorded_alias_class_count": len(classes),
        "recorded_implementation_sha256": recorded_implementation_sha,
        "current_implementation_sha256": implementation_sha,
        "current_implementation_matches_recorded": (
            implementation_sha == recorded_implementation_sha
        ),
        "stored_survivor_keys": stored_survivor_keys,
    }
    print(json.dumps(output, indent=2, sort_keys=True))

    if len(matches) != 1 or quotient_status != z3.unsat:
        raise RuntimeError("the expected direct contradiction did not replay exactly")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
