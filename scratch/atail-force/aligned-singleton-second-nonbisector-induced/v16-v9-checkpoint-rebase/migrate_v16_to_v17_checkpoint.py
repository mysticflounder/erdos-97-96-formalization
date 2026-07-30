#!/usr/bin/env python3
"""Migrate a v16 checkpoint to the v17 solver schema.

The source is read once and never modified.  Every source cut must parse under
the current literal vocabulary and match one of the universal theorem-shaped
schemas already admitted by v16.  The resumed v17 solver will independently
revalidate all cuts before using them.
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
CEGAR_PATH = SOLVER_DIR / "cegar.py"
DEFAULT_SOURCE = (
    HERE / "cegar-v16-custom-critical-reuse-second.working.checkpoint.json"
)
DEFAULT_TARGET = (
    HERE / "cegar-v17-custom-critical-reuse-second.migrated.checkpoint.json"
)
DEFAULT_REPORT = HERE / "v17-migration-report.json"
EXPECTED_SOURCE_SCHEMA = (
    "p97-aligned-singleton-induced-metric-cegar-v16-"
    "four-five-point-one-sparse-six-point-schema"
)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def load_cegar() -> object:
    spec = importlib.util.spec_from_file_location("v17_atail_cegar", CEGAR_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {CEGAR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument(
        "--drop-unrecognized",
        action="store_true",
        help=(
            "drop source cuts outside the universal theorem schemas; "
            "the resumed solver must rediscover them"
        ),
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.source.resolve() == args.target.resolve():
        raise ValueError("source and target checkpoint paths must differ")

    source_bytes = args.source.read_bytes()
    old = json.loads(source_bytes)
    old_metadata = old.get("metadata")
    if not isinstance(old_metadata, dict):
        raise ValueError("source checkpoint has no metadata object")
    if old_metadata.get("schema") != EXPECTED_SOURCE_SCHEMA:
        raise ValueError(
            "source checkpoint schema is not the expected completed v16 schema"
        )

    cegar = load_cegar()
    def metadata_tuple(field: str) -> tuple[str, ...]:
        value = old_metadata.get(field)
        if not isinstance(value, list) or not all(
            isinstance(item, str) for item in value
        ):
            raise ValueError(f"source metadata field {field!r} is not a string list")
        return tuple(value)

    z_branch = old_metadata.get("z_branch")
    escape_arm = old_metadata.get("escape_arm")
    global_tier = old_metadata.get("global_tier")
    outer_only = old_metadata.get("outer_only")
    if not isinstance(z_branch, str):
        raise ValueError("source metadata field 'z_branch' is not a string")
    if not isinstance(escape_arm, str):
        raise ValueError("source metadata field 'escape_arm' is not a string")
    if not isinstance(global_tier, str):
        raise ValueError("source metadata field 'global_tier' is not a string")
    if not isinstance(outer_only, bool):
        raise ValueError("source metadata field 'outer_only' is not a boolean")

    outer = cegar.OuterMap(
        timeout_ms=60_000,
        random_seed=0,
        z_branch=z_branch,
        escape_arm=escape_arm,
        global_tier=global_tier,
        cover_points=metadata_tuple("cover_points"),
        global_k4_centers=metadata_tuple("global_k4_centers"),
        rich_apices=metadata_tuple("rich_apices"),
        robust_deletions=metadata_tuple("robust_deletions"),
    )
    run_args = argparse.Namespace(
        z_branch=z_branch,
        escape_arm=escape_arm,
        global_tier=global_tier,
        outer_only=outer_only,
    )
    metadata = cegar.checkpoint_metadata(run_args, outer)

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
    )
    raw_cuts = old.get("cuts")
    if not isinstance(raw_cuts, list):
        raise ValueError("source checkpoint cuts must be a list")
    cuts = []
    seen = set()
    dropped_unrecognized: list[int] = []
    schema_counts: Counter[str] = Counter()
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
        matches = [
            name for name, recognize in recognizers
            if recognize(core) is not None
        ]
        if not matches and args.drop_unrecognized:
            dropped_unrecognized.append(number)
            continue
        if len(matches) != 1:
            raise ValueError(
                f"cut {number} matched {len(matches)} v16 schemas: {matches!r}"
            )
        schema_counts[matches[0]] += 1
        cuts.append(core)

    old_stats = old.get("stats")
    if not isinstance(old_stats, dict):
        raise ValueError("source checkpoint has no stats object")
    if not all(
        isinstance(key, str) and type(value) is int and value >= 0
        for key, value in old_stats.items()
    ):
        raise ValueError(
            "source checkpoint stats are not nonnegative integer counters"
        )
    stats = Counter(old_stats)
    stats["source_banked_cuts"] = stats["banked_cuts"]
    stats["banked_cuts"] = len(cuts)
    stats["migrated_source_cuts"] = len(cuts)
    stats["dropped_unrecognized_source_cuts"] = len(dropped_unrecognized)
    for schema, count in schema_counts.items():
        stats[f"migrated_{schema}_cuts"] = count

    checkpoint = cegar.checkpoint_payload(metadata, cuts, stats)
    checkpoint["migration_provenance"] = {
        "source_path": str(args.source),
        "source_sha256": sha256_bytes(source_bytes),
        "source_schema": old_metadata["schema"],
        "source_implementation_sha256": old_metadata.get(
            "implementation_sha256"
        ),
        "target_schema": metadata["schema"],
        "target_implementation_sha256": metadata["implementation_sha256"],
        "projection_fields_checked": list(projection_fields),
        "schema_counts": dict(sorted(schema_counts.items())),
        "dropped_unrecognized_source_cut_indices": dropped_unrecognized,
        "validation": (
            "Every source cut parsed under the current literal vocabulary and "
            "was unique. Every retained cut matched exactly one universal v16 "
            "theorem schema. Unrecognized cuts were "
            f"{'dropped for rediscovery' if args.drop_unrecognized else 'rejected'}. "
            "The v17 resume revalidates every retained cut again before use."
        ),
        "trust_scope": "external solver checkpoint; not Lean theorem closure",
    }
    cegar.write_json_atomic(args.target, checkpoint)

    report = {
        "status": "MIGRATED_V16_TO_V17",
        "source_checkpoint": str(args.source),
        "source_checkpoint_sha256": sha256_bytes(source_bytes),
        "target_checkpoint": str(args.target),
        "target_checkpoint_sha256": sha256(args.target),
        "current_cegar_sha256": sha256(CEGAR_PATH),
        "cut_count": len(cuts),
        "source_cut_count": len(raw_cuts),
        "dropped_unrecognized_cut_indices": dropped_unrecognized,
        "schema_counts": dict(sorted(schema_counts.items())),
        "projection_fields_checked": list(projection_fields),
        "resume_validation": "required-fail-closed",
        "trust_scope": "external-discovery-only-not-Lean-closure",
    }
    cegar.write_json_atomic(args.report, report)
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
