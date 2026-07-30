#!/usr/bin/env python3
"""Guardedly carry the v17 local cut ledger into the custom-q projection.

This is metadata transport, not semantic validation.  It accepts exactly the
hash-pinned 5,933-cut local/critical/reuse-second checkpoint, checks that every
cut is a unique universal theorem-shaped schema over the unchanged 33 original
roles, and emits a custom projection containing only the four new global-q K4
witnesses.  The ordinary CEGAR ``--resume`` path must revalidate every carried
cut before use.
"""

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
REPO_ROOT = SOLVER_DIR.parents[2]
CEGAR_PATH = SOLVER_DIR / "cegar.py"
DEFAULT_SOURCE = (
    SOLVER_DIR
    / "cegar-v17-local-critical-reuse-second.migrated.checkpoint.json"
)
DEFAULT_TARGET = (
    SOLVER_DIR
    / "cegar-v17-custom-q-critical-reuse-second.initial-rebased.checkpoint.json"
)
DEFAULT_REPORT = SOLVER_DIR / "v17-custom-q-rebase-report.json"

EXPECTED_CEGAR_SHA256 = (
    "fea2e57eccd77d3df3ccaae3ffa77a148649af901cd058bdb645d712bfaa3258"
)
EXPECTED_SOURCE_SHA256 = (
    "11234e5710d46b46550689929767b522e2d77c1b76f3ca4841654d7a54086f2a"
)
EXPECTED_SOURCE_CUTS = 5_933
EXPECTED_SCHEMA_COUNTS = {
    "circle_isosceles_five_point": 5,
    "five_point_euclidean": 19,
    "four_point_kalmanson": 5_875,
    "mirror_interleaving_six_point_euclidean": 2,
    "reversed_second_five_point_euclidean": 24,
    "six_point_euclidean": 0,
    "sparse_six_point_euclidean": 8,
}


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


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    return parser.parse_args()


def display_path(path: Path) -> str:
    resolved = path.resolve()
    try:
        return str(resolved.relative_to(REPO_ROOT))
    except ValueError:
        return str(resolved)


def projection(
    cegar: object,
    *,
    global_tier: str,
    global_k4_centers: tuple[str, ...] | None,
) -> tuple[object, argparse.Namespace, dict[str, object]]:
    outer = cegar.OuterMap(
        timeout_ms=60_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier=global_tier,
        cover_points=() if global_tier == "custom" else None,
        global_k4_centers=global_k4_centers,
        rich_apices=() if global_tier == "custom" else None,
        robust_deletions=() if global_tier == "custom" else None,
    )
    run_args = argparse.Namespace(
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier=global_tier,
        outer_only=False,
    )
    return outer, run_args, cegar.checkpoint_metadata(run_args, outer)


def main() -> None:
    args = parse_args()
    if args.source.resolve() == args.target.resolve():
        raise ValueError("source and target checkpoint must be distinct")
    if sha256(CEGAR_PATH) != EXPECTED_CEGAR_SHA256:
        raise ValueError("current cegar.py does not match the pinned v17 implementation")
    if sha256(args.source) != EXPECTED_SOURCE_SHA256:
        raise ValueError("source checkpoint does not match the pinned local survivor")

    cegar = load_cegar()
    source_outer, _, expected_source_metadata = projection(
        cegar,
        global_tier="local",
        global_k4_centers=None,
    )
    target_outer, _, target_metadata = projection(
        cegar,
        global_tier="custom",
        global_k4_centers=("q",),
    )

    raw = json.loads(args.source.read_text())
    if not isinstance(raw, dict):
        raise ValueError("source checkpoint is not an object")
    if raw.get("metadata") != expected_source_metadata:
        raise ValueError("source metadata is not the exact v17 local projection")
    raw_cuts = raw.get("cuts")
    if not isinstance(raw_cuts, list) or len(raw_cuts) != EXPECTED_SOURCE_CUTS:
        raise ValueError(
            f"source checkpoint must contain exactly {EXPECTED_SOURCE_CUTS} cuts"
        )

    original_names = tuple(source_outer.original_names)
    if len(original_names) != 33 or tuple(target_outer.original_names) != original_names:
        raise ValueError("original-role universe drifted from the pinned 33 roles")
    expected_new_names = tuple(f"global_k4_q_{ordinal}" for ordinal in range(1, 5))
    if tuple(target_outer.names) != (*original_names, *expected_new_names):
        raise ValueError("custom-q projection is not the exact four-role extension")

    recognizers = (
        ("four_point_kalmanson", cegar.four_point_kalmanson_core_points),
        ("five_point_euclidean", cegar.five_point_euclidean_core_points),
        (
            "reversed_second_five_point_euclidean",
            cegar.reversed_second_five_point_euclidean_core_points,
        ),
        (
            "circle_isosceles_five_point",
            cegar.circle_isosceles_five_point_core_points,
        ),
        ("six_point_euclidean", cegar.six_point_euclidean_core_points),
        (
            "sparse_six_point_euclidean",
            cegar.sparse_six_point_euclidean_core_points,
        ),
        (
            "mirror_interleaving_six_point_euclidean",
            cegar.mirror_interleaving_six_point_euclidean_core_points,
        ),
    )
    cuts = []
    seen = set()
    schema_counts: Counter[str] = Counter()
    for number, raw_core in enumerate(raw_cuts):
        if not isinstance(raw_core, list) or not raw_core:
            raise ValueError(f"cut {number} is not a nonempty list")
        core = [cegar.Literal.from_json(value) for value in raw_core]
        for literal in core:
            literal.validate(source_outer.names)
            literal.validate(target_outer.names)
        key = frozenset(core)
        if key in seen:
            raise ValueError(f"cut {number} duplicates an earlier cut")
        seen.add(key)
        matches = [
            name for name, recognize in recognizers
            if recognize(core) is not None
        ]
        if len(matches) != 1:
            raise ValueError(
                f"cut {number} matched {len(matches)} universal schemas: {matches!r}"
            )
        schema_counts[matches[0]] += 1
        cuts.append(core)

    actual_counts = {
        name: schema_counts.get(name, 0) for name in EXPECTED_SCHEMA_COUNTS
    }
    if actual_counts != EXPECTED_SCHEMA_COUNTS:
        raise ValueError(
            f"source schema census mismatch: expected {EXPECTED_SCHEMA_COUNTS!r}, "
            f"got {actual_counts!r}"
        )

    stats = Counter(
        {
            "banked_cuts": len(cuts),
            "rebased_source_cuts": len(cuts),
        }
    )
    for schema, count in actual_counts.items():
        stats[f"syntactically_revalidated_{schema}_cuts"] = count
    checkpoint = cegar.checkpoint_payload(target_metadata, cuts, stats)
    checkpoint["rebase_provenance"] = {
        "source_path": display_path(args.source),
        "source_sha256": sha256(args.source),
        "source_schema": expected_source_metadata["schema"],
        "source_implementation_sha256": expected_source_metadata[
            "implementation_sha256"
        ],
        "source_cut_count": len(cuts),
        "source_original_names": list(original_names),
        "added_names": list(expected_new_names),
        "schema_counts": actual_counts,
        "validation": (
            "Every source cut parsed under the pinned v17 literal vocabulary, "
            "was unique, mentioned only the unchanged 33 original roles, and "
            "matched exactly one universal theorem-shaped schema."
        ),
        "resume_validation": (
            "Required: ordinary cegar.py --resume must semantically revalidate "
            "all 5,933 cuts under the custom-q projection before use."
        ),
        "trust_scope": "external solver checkpoint; not Lean theorem closure",
    }
    cegar.write_json_atomic(args.target, checkpoint)

    report = {
        "status": "REBASED_FOR_MANDATORY_RESUME_REVALIDATION",
        "source_checkpoint": display_path(args.source),
        "source_checkpoint_sha256": sha256(args.source),
        "target_checkpoint": display_path(args.target),
        "target_checkpoint_sha256": sha256(args.target),
        "current_cegar_sha256": sha256(CEGAR_PATH),
        "source_cut_count": len(cuts),
        "source_named_occurrences": source_outer.n,
        "target_named_occurrences": target_outer.n,
        "added_names": list(expected_new_names),
        "schema_counts": actual_counts,
        "semantic_revalidation": "required-via-ordinary-resume",
        "trust_scope": "external-discovery-only-not-Lean-closure",
    }
    cegar.write_json_atomic(args.report, report)
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
