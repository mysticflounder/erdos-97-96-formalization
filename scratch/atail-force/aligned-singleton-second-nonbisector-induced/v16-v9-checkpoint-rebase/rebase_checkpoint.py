#!/usr/bin/env python3
"""Revalidate the v9 custom checkpoint under the current CEGAR implementation."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOLVER_DIR = HERE.parent
CEGAR_PATH = SOLVER_DIR / "cegar.py"
SOURCE_PATH = SOLVER_DIR / "cegar-v9-custom-critical-reuse-combined.checkpoint.json"
TARGET_PATH = HERE / "cegar-v16-custom-critical-reuse-second.rebased.checkpoint.json"
REPORT_PATH = HERE / "rebase-report.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_cegar() -> object:
    spec = importlib.util.spec_from_file_location("current_atail_cegar", CEGAR_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {CEGAR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> None:
    cegar = load_cegar()
    old = json.loads(SOURCE_PATH.read_text())
    old_metadata = old.get("metadata")
    if not isinstance(old_metadata, dict):
        raise ValueError("source checkpoint has no metadata object")

    outer = cegar.OuterMap(
        timeout_ms=60_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="custom",
        cover_points=("escape", "z"),
        global_k4_centers=("q", "other", "z", "t"),
        rich_apices=("a1", "a2"),
        robust_deletions=(),
    )
    args = argparse.Namespace(
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="custom",
        outer_only=False,
    )
    metadata = cegar.checkpoint_metadata(args, outer)

    projection_fields = (
        "z_branch",
        "escape_arm",
        "global_tier",
        "cover_points",
        "global_k4_centers",
        "rich_apices",
        "robust_deletions",
        "outer_only",
        "named_occurrences",
        "original_named_occurrences",
        "original_names",
        "names",
    )
    mismatches = {
        field: {"source": old_metadata.get(field), "current": metadata.get(field)}
        for field in projection_fields
        if old_metadata.get(field) != metadata.get(field)
    }
    if mismatches:
        raise ValueError(f"source/current projection mismatch: {mismatches!r}")

    raw_cuts = old.get("cuts")
    if not isinstance(raw_cuts, list):
        raise ValueError("source checkpoint cuts must be a list")
    cuts = []
    seen = set()
    for number, raw_core in enumerate(raw_cuts):
        if not isinstance(raw_core, list) or not raw_core:
            raise ValueError(f"cut {number} is not a nonempty list")
        core = [cegar.Literal.from_json(value) for value in raw_core]
        for literal in core:
            literal.validate(outer.names)
        key = frozenset(core)
        if key in seen:
            raise ValueError(f"cut {number} duplicates an earlier cut")
        seen.add(key)
        if cegar.four_point_kalmanson_core_points(core) is None:
            raise ValueError(
                f"cut {number} is not a universal four-point Kalmanson core"
            )
        cuts.append(core)

    stats = Counter(
        {
            "banked_cuts": len(cuts),
            "rebased_source_cuts": len(cuts),
            "syntactically_revalidated_four_point_kalmanson_cuts": len(cuts),
        }
    )
    checkpoint = cegar.checkpoint_payload(metadata, cuts, stats)
    checkpoint["rebase_provenance"] = {
        "source_path": str(SOURCE_PATH.relative_to(SOLVER_DIR.parent.parent.parent)),
        "source_sha256": sha256(SOURCE_PATH),
        "source_schema": old_metadata.get("schema"),
        "source_implementation_sha256": old_metadata.get("implementation_sha256"),
        "validation": (
            "Every cut parsed as current literals, validated against the current "
            "85-role projection, was unique, and matched the universal five-literal "
            "four-point Kalmanson schema."
        ),
        "trust_scope": (
            "External solver checkpoint only; not a Lean theorem or certificate."
        ),
    }
    cegar.write_json_atomic(TARGET_PATH, checkpoint)

    report = {
        "status": "REBASED_AND_REVALIDATED",
        "source_checkpoint": str(SOURCE_PATH),
        "source_checkpoint_sha256": sha256(SOURCE_PATH),
        "target_checkpoint": str(TARGET_PATH),
        "target_checkpoint_sha256": sha256(TARGET_PATH),
        "current_cegar_sha256": sha256(CEGAR_PATH),
        "cut_count": len(cuts),
        "projection_fields_checked": list(projection_fields),
        "schema_validation": "universal-four-point-kalmanson",
        "trust_scope": "external-discovery-only-not-Lean-closure",
    }
    cegar.write_json_atomic(REPORT_PATH, report)
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
