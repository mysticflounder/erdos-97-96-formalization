#!/usr/bin/env python3
"""Guardedly carry the v17 custom-q ledger into custom-q plus cover-q.

The source is the hash-pinned result of an ordinary custom-q resume.  Universal
theorem-shaped cuts are recognized syntactically; the remaining translated
metric cores are replayed under the source projection.  Every carried cut must
then be revalidated again by the ordinary CEGAR ``--resume`` path under the
stronger target projection.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOLVER_DIR = HERE.parent
REPO_ROOT = SOLVER_DIR.parents[2]
CEGAR_PATH = SOLVER_DIR / "cegar.py"
DEFAULT_SOURCE = (
    SOLVER_DIR
    / "cegar-v17-custom-q-critical-reuse-second.rebased.checkpoint.json"
)
DEFAULT_TARGET = (
    SOLVER_DIR
    / "cegar-v17-custom-q-cover-q-critical-reuse-second"
    ".initial-rebased.checkpoint.json"
)
DEFAULT_WORKING_TARGET = (
    SOLVER_DIR
    / "cegar-v17-custom-q-cover-q-critical-reuse-second.rebased.checkpoint.json"
)
DEFAULT_REPORT = SOLVER_DIR / "v17-custom-q-cover-q-rebase-report.json"

EXPECTED_CEGAR_SHA256 = (
    "fea2e57eccd77d3df3ccaae3ffa77a148649af901cd058bdb645d712bfaa3258"
)
EXPECTED_SOURCE_SHA256 = (
    "789d00c84def350d5b25c7cecd6f513fc4dd2f089a1ab800574105ed65785b42"
)
EXPECTED_SOURCE_CUTS = 10_563
EXPECTED_SCHEMA_COUNTS = {
    "circle_isosceles_five_point": 9,
    "five_point_euclidean": 36,
    "four_point_kalmanson": 10_455,
    "mirror_interleaving_six_point_euclidean": 2,
    "reversed_second_five_point_euclidean": 31,
    "six_point_euclidean": 0,
    "sparse_six_point_euclidean": 15,
}
EXPECTED_METRIC_UNSAT_CUTS = 15


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
    parser.add_argument(
        "--working-target",
        type=Path,
        default=DEFAULT_WORKING_TARGET,
        help="fresh working copy that ordinary --resume may overwrite",
    )
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--replay-timeout-ms", type=int, default=60_000)
    parser.add_argument("--wall-timeout-seconds", type=float, default=600.0)
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
    cover_points: tuple[str, ...],
) -> tuple[object, dict[str, object]]:
    outer = cegar.OuterMap(
        timeout_ms=60_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="custom",
        cover_points=cover_points,
        global_k4_centers=("q",),
        rich_apices=(),
        robust_deletions=(),
    )
    run_args = argparse.Namespace(
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="custom",
        outer_only=False,
    )
    return outer, cegar.checkpoint_metadata(run_args, outer)


def main() -> None:
    args = parse_args()
    resolved_paths = {
        args.source.resolve(),
        args.target.resolve(),
        args.working_target.resolve(),
        args.report.resolve(),
    }
    if len(resolved_paths) != 4:
        raise ValueError("source, targets, and report paths must be distinct")
    if args.working_target.exists():
        raise ValueError(
            "working target already exists; refusing to overwrite resume state"
        )
    if args.replay_timeout_ms <= 0 or args.wall_timeout_seconds <= 0:
        raise ValueError("replay and wall timeouts must be positive")
    if sha256(CEGAR_PATH) != EXPECTED_CEGAR_SHA256:
        raise ValueError("current cegar.py does not match the pinned v17 implementation")
    if sha256(args.source) != EXPECTED_SOURCE_SHA256:
        raise ValueError("source checkpoint does not match the pinned custom-q run")

    cegar = load_cegar()
    source_outer, expected_source_metadata = projection(cegar, cover_points=())
    target_outer, target_metadata = projection(cegar, cover_points=("q",))

    raw = json.loads(args.source.read_text())
    if not isinstance(raw, dict):
        raise ValueError("source checkpoint is not an object")
    if raw.get("metadata") != expected_source_metadata:
        raise ValueError("source metadata is not the exact v17 custom-q projection")
    raw_cuts = raw.get("cuts")
    if not isinstance(raw_cuts, list) or len(raw_cuts) != EXPECTED_SOURCE_CUTS:
        raise ValueError(
            f"source checkpoint must contain exactly {EXPECTED_SOURCE_CUTS} cuts"
        )

    original_names = tuple(source_outer.original_names)
    global_q_names = tuple(
        f"global_k4_q_{ordinal}" for ordinal in range(1, 5)
    )
    cover_q_names = ("cover_q", "cover_q_2", "cover_q_3", "cover_q_4")
    if tuple(source_outer.names) != (*original_names, *global_q_names):
        raise ValueError("source custom-q role universe drifted")
    if tuple(target_outer.names) != (
        *original_names,
        *cover_q_names,
        *global_q_names,
    ):
        raise ValueError("target is not the exact cover-q plus global-q extension")

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
    pending_metric_cut_indices = []
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
        if len(matches) > 1:
            raise ValueError(
                f"cut {number} matched multiple universal schemas: {matches!r}"
            )
        if matches:
            schema_counts[matches[0]] += 1
        else:
            pending_metric_cut_indices.append(number)
        cuts.append(core)

    actual_counts = {
        name: schema_counts.get(name, 0) for name in EXPECTED_SCHEMA_COUNTS
    }
    if actual_counts != EXPECTED_SCHEMA_COUNTS:
        raise ValueError(
            f"source schema census mismatch: expected {EXPECTED_SCHEMA_COUNTS!r}, "
            f"got {actual_counts!r}"
        )
    if len(pending_metric_cut_indices) != EXPECTED_METRIC_UNSAT_CUTS:
        raise ValueError(
            "source does not contain the expected 15 translated metric cores"
        )

    replay_counts = cegar.revalidate_checkpoint_cuts(
        source_outer,
        cuts,
        timeout_ms=args.replay_timeout_ms,
        deadline=time.monotonic() + args.wall_timeout_seconds,
    )
    expected_replay_counts = (
        EXPECTED_METRIC_UNSAT_CUTS,
        EXPECTED_SCHEMA_COUNTS["four_point_kalmanson"],
        EXPECTED_SCHEMA_COUNTS["five_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS["reversed_second_five_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS["circle_isosceles_five_point"],
        EXPECTED_SCHEMA_COUNTS["six_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS["sparse_six_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS["mirror_interleaving_six_point_euclidean"],
        0,
    )
    if replay_counts != expected_replay_counts:
        raise ValueError(
            f"source semantic replay census mismatch: {replay_counts!r}"
        )

    stats = Counter(
        {
            "banked_cuts": len(cuts),
            "rebased_source_cuts": len(cuts),
            "source_replayed_metric_unsat_cuts": EXPECTED_METRIC_UNSAT_CUTS,
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
        "source_names": list(source_outer.names),
        "target_names": list(target_outer.names),
        "added_names": list(cover_q_names),
        "universal_schema_counts": actual_counts,
        "source_replayed_metric_unsat_cut_indices": pending_metric_cut_indices,
        "validation": (
            "Every source cut parsed under the pinned v17 literal vocabulary, "
            "was unique, and mentioned only source roles. Universal cuts matched "
            "their exact schemas; 15 translated metric cores replayed UNSAT under "
            "the source custom-q projection."
        ),
        "resume_validation": (
            "Required: ordinary cegar.py --resume must semantically revalidate "
            "all 10,563 cuts under custom-q plus cover-q before use."
        ),
        "trust_scope": "external solver checkpoint; not Lean theorem closure",
    }
    cegar.write_json_atomic(args.target, checkpoint)
    cegar.write_json_atomic(args.working_target, checkpoint)

    report = {
        "status": "REBASED_FOR_MANDATORY_RESUME_REVALIDATION",
        "source_checkpoint": display_path(args.source),
        "source_checkpoint_sha256": sha256(args.source),
        "immutable_target_checkpoint": display_path(args.target),
        "immutable_target_checkpoint_sha256": sha256(args.target),
        "working_target_checkpoint": display_path(args.working_target),
        "working_target_checkpoint_sha256": sha256(args.working_target),
        "current_cegar_sha256": sha256(CEGAR_PATH),
        "source_cut_count": len(cuts),
        "source_named_occurrences": source_outer.n,
        "target_named_occurrences": target_outer.n,
        "added_names": list(cover_q_names),
        "universal_schema_counts": actual_counts,
        "source_replayed_metric_unsat_cuts": EXPECTED_METRIC_UNSAT_CUTS,
        "semantic_target_revalidation": "required-via-ordinary-resume",
        "trust_scope": "external-discovery-only-not-Lean-closure",
    }
    cegar.write_json_atomic(args.report, report)
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
