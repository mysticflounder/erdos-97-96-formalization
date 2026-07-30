#!/usr/bin/env python3
"""Guardedly carry the pinned v17 custom-q+cover-q ledger into v18.

This migration changes only the checkpoint schema and implementation pins.  It
does not add roles or strengthen the projection.  Every v17 universal-schema
cut is recognized with the current v18 recognizers, and every remaining metric
cut is replayed fail-closed before fresh immutable and working checkpoints are
written.  Ordinary ``cegar.py --resume`` must still fully revalidate the v18
working checkpoint before it is used.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import sys
import tempfile
import time
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOLVER_DIR = HERE.parent
REPO_ROOT = SOLVER_DIR.parents[2]
CEGAR_PATH = SOLVER_DIR / "cegar.py"
DEFAULT_SOURCE = (
    SOLVER_DIR
    / "cegar-v17-custom-q-cover-q-critical-reuse-second.rebased.checkpoint.json"
)
DEFAULT_TARGET = (
    HERE
    / "cegar-v18-custom-q-cover-q-critical-reuse-second"
    ".initial-rebased.checkpoint.json"
)
DEFAULT_WORKING_TARGET = (
    HERE
    / "cegar-v18-custom-q-cover-q-critical-reuse-second.rebased.checkpoint.json"
)
DEFAULT_REPORT = HERE / "v18-custom-q-cover-q-rebase-report.json"

EXPECTED_SOURCE_SHA256 = (
    "156b17046e6f6a2392e2fb2de2c104d003f881e69a1648a78a03a68374eddeb9"
)
EXPECTED_SOURCE_IMPLEMENTATION_SHA256 = (
    "fea2e57eccd77d3df3ccaae3ffa77a148649af901cd058bdb645d712bfaa3258"
)
EXPECTED_TARGET_IMPLEMENTATION_SHA256 = (
    "ff54f851f384888d5fb729f297a84288dbf61b2d5b6337075b5b3f73c158caf6"
)
EXPECTED_SOURCE_SCHEMA = (
    "p97-aligned-singleton-induced-metric-cegar-v17-"
    "mirror-interleaving-six-point-schema"
)
EXPECTED_TARGET_SCHEMA = (
    "p97-aligned-singleton-induced-metric-cegar-v18-"
    "two-triple-row-six-point-schema"
)
EXPECTED_SOURCE_CUTS = 14_139
EXPECTED_NAMES = (
    "a0",
    "a1",
    "a2",
    "p1",
    "p2",
    "r1",
    "r2",
    "q",
    "other",
    "z",
    "t",
    "source",
    "b1",
    "b2",
    "bs",
    "bz",
    "s2",
    "s3",
    "s4",
    "p3",
    "p4",
    "r3",
    "r4",
    "z2",
    "z3",
    "z4",
    "x",
    "y",
    "be",
    "escape",
    "e2",
    "e3",
    "e4",
    "cover_q",
    "cover_q_2",
    "cover_q_3",
    "cover_q_4",
    "global_k4_q_1",
    "global_k4_q_2",
    "global_k4_q_3",
    "global_k4_q_4",
)
EXPECTED_SCHEMA_COUNTS = {
    "four_point_kalmanson": 13_992,
    "five_point_euclidean": 55,
    "reversed_second_five_point_euclidean": 37,
    "circle_isosceles_five_point": 13,
    "six_point_euclidean": 0,
    "sparse_six_point_euclidean": 17,
    "mirror_interleaving_six_point_euclidean": 2,
    "two_triple_row_six_point_euclidean": 0,
}
EXPECTED_METRIC_UNSAT_CUTS = 23
EXPECTED_OUTER_REDUNDANT_CUTS = 0


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json_atomic_no_replace(path: Path, payload: object) -> str:
    """Publish complete JSON atomically, failing if ``path`` already exists."""
    encoded = (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode()
    digest = hashlib.sha256(encoded).hexdigest()
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=f".{path.name}.",
        suffix=".tmp",
        dir=path.parent,
    )
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(encoded)
            stream.flush()
            os.fsync(stream.fileno())
        try:
            os.link(temporary, path)
        except FileExistsError as error:
            raise FileExistsError(
                f"output appeared during replay; refusing to overwrite: {path}"
            ) from error
        return digest
    finally:
        temporary.unlink(missing_ok=True)


def self_test_no_replace() -> None:
    """Exercise fresh publication, collision refusal, and staging cleanup."""
    with tempfile.TemporaryDirectory(prefix=".no-replace-test.", dir=HERE) as root:
        test_dir = Path(root)
        fresh = test_dir / "fresh.json"
        payload = {"guard": "fresh"}
        expected = (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode()
        digest = write_json_atomic_no_replace(fresh, payload)
        if fresh.read_bytes() != expected:
            raise AssertionError("fresh no-replace publication changed JSON bytes")
        if digest != hashlib.sha256(expected).hexdigest():
            raise AssertionError("fresh no-replace publication returned wrong hash")

        occupied = test_dir / "occupied.json"
        sentinel = b"preexisting sentinel\n"
        occupied.write_bytes(sentinel)
        try:
            write_json_atomic_no_replace(occupied, {"guard": "collision"})
        except FileExistsError:
            pass
        else:
            raise AssertionError("no-replace publication overwrote an existing path")
        if occupied.read_bytes() != sentinel:
            raise AssertionError("collision changed the existing output bytes")
        if tuple(test_dir.glob(".*.tmp")):
            raise AssertionError("no-replace publication left a staging file")


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
    parser.add_argument(
        "--target",
        type=Path,
        default=DEFAULT_TARGET,
        help="fresh immutable v18 checkpoint; must not already exist",
    )
    parser.add_argument(
        "--working-target",
        type=Path,
        default=DEFAULT_WORKING_TARGET,
        help="fresh v18 working copy that ordinary --resume may overwrite",
    )
    parser.add_argument(
        "--report",
        type=Path,
        default=DEFAULT_REPORT,
        help="fresh concise JSON provenance report",
    )
    parser.add_argument(
        "--replay-timeout-ms",
        type=int,
        default=60_000,
        help="fail-closed per-solver-check timeout in milliseconds (default: 60000)",
    )
    parser.add_argument(
        "--wall-timeout-seconds",
        type=float,
        default=900.0,
        help="fail-closed total semantic-replay budget in seconds (default: 900)",
    )
    parser.add_argument(
        "--self-test-no-replace",
        action="store_true",
        help="run the fast atomic no-replace publication test and exit",
    )
    return parser.parse_args()


def display_path(path: Path) -> str:
    resolved = path.resolve()
    try:
        return str(resolved.relative_to(REPO_ROOT))
    except ValueError:
        return str(resolved)


def projection(cegar: object) -> tuple[object, dict[str, object]]:
    outer = cegar.OuterMap(
        timeout_ms=60_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="custom",
        cover_points=("q",),
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
    if args.self_test_no_replace:
        self_test_no_replace()
        print("atomic no-replace self-test: OK")
        return
    resolved_paths = {
        args.source.resolve(),
        args.target.resolve(),
        args.working_target.resolve(),
        args.report.resolve(),
    }
    if len(resolved_paths) != 4:
        raise ValueError("source, targets, and report paths must be distinct")
    if args.replay_timeout_ms <= 0 or args.wall_timeout_seconds <= 0:
        raise ValueError("replay and wall timeouts must be positive")
    for output in (args.target, args.working_target, args.report):
        if os.path.lexists(output):
            raise ValueError(f"output already exists; refusing to overwrite: {output}")
    if sha256(CEGAR_PATH) != EXPECTED_TARGET_IMPLEMENTATION_SHA256:
        raise ValueError("current cegar.py does not match the pinned v18 implementation")
    source_bytes = args.source.read_bytes()
    source_sha256 = hashlib.sha256(source_bytes).hexdigest()
    if source_sha256 != EXPECTED_SOURCE_SHA256:
        raise ValueError("source checkpoint does not match the pinned v17 run")

    cegar = load_cegar()
    outer, target_metadata = projection(cegar)
    if target_metadata.get("schema") != EXPECTED_TARGET_SCHEMA:
        raise ValueError("current cegar.py does not expose the pinned v18 schema")
    if (
        target_metadata.get("implementation_sha256")
        != EXPECTED_TARGET_IMPLEMENTATION_SHA256
    ):
        raise ValueError("current checkpoint metadata implementation pin drifted")
    if tuple(outer.names) != EXPECTED_NAMES or outer.n != 41:
        raise ValueError("custom-q+cover-q 41-role vocabulary drifted")

    expected_source_metadata = dict(target_metadata)
    expected_source_metadata["schema"] = EXPECTED_SOURCE_SCHEMA
    expected_source_metadata["implementation_sha256"] = (
        EXPECTED_SOURCE_IMPLEMENTATION_SHA256
    )

    raw = json.loads(source_bytes)
    if not isinstance(raw, dict):
        raise ValueError("source checkpoint is not an object")
    if raw.get("metadata") != expected_source_metadata:
        raise ValueError(
            "source metadata is not the exact v17 41-role custom-q+cover-q projection"
        )
    raw_cuts = raw.get("cuts")
    if not isinstance(raw_cuts, list) or len(raw_cuts) != EXPECTED_SOURCE_CUTS:
        raise ValueError(
            f"source checkpoint must contain exactly {EXPECTED_SOURCE_CUTS} cuts"
        )

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
        (
            "two_triple_row_six_point_euclidean",
            cegar.two_triple_row_six_point_euclidean_core_points,
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
            literal.validate(outer.names)
        key = frozenset(core)
        if key in seen:
            raise ValueError(f"cut {number} duplicates an earlier cut")
        seen.add(key)
        matches = [
            name for name, recognize in recognizers if recognize(core) is not None
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
            "source does not contain exactly 23 remaining metric cuts"
        )

    replay_counts = cegar.revalidate_checkpoint_cuts(
        outer,
        cuts,
        timeout_ms=args.replay_timeout_ms,
        deadline=time.monotonic() + args.wall_timeout_seconds,
    )
    expected_replay_counts = (
        EXPECTED_METRIC_UNSAT_CUTS,
        EXPECTED_SCHEMA_COUNTS["four_point_kalmanson"],
        EXPECTED_SCHEMA_COUNTS["five_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS[
            "reversed_second_five_point_euclidean"
        ],
        EXPECTED_SCHEMA_COUNTS["circle_isosceles_five_point"],
        EXPECTED_SCHEMA_COUNTS["six_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS["sparse_six_point_euclidean"],
        EXPECTED_SCHEMA_COUNTS[
            "mirror_interleaving_six_point_euclidean"
        ],
        EXPECTED_SCHEMA_COUNTS["two_triple_row_six_point_euclidean"],
        EXPECTED_OUTER_REDUNDANT_CUTS,
    )
    if replay_counts != expected_replay_counts:
        raise ValueError(
            f"source semantic replay census mismatch: expected "
            f"{expected_replay_counts!r}, got {replay_counts!r}"
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
        "source_sha256": source_sha256,
        "source_schema": EXPECTED_SOURCE_SCHEMA,
        "source_implementation_sha256": EXPECTED_SOURCE_IMPLEMENTATION_SHA256,
        "target_schema": EXPECTED_TARGET_SCHEMA,
        "target_implementation_sha256": EXPECTED_TARGET_IMPLEMENTATION_SHA256,
        "source_cut_count": len(cuts),
        "source_names": list(outer.names),
        "target_names": list(outer.names),
        "added_names": [],
        "universal_schema_counts": actual_counts,
        "source_replayed_metric_unsat_cut_indices": pending_metric_cut_indices,
        "validation": (
            "Every source cut parsed uniquely in the unchanged 41-role "
            "vocabulary. Current v18 recognizers certified every universal "
            "schema cut; all 23 remaining metric cuts replayed INNER-UNSAT "
            "fail-closed, with zero outer-redundant cuts."
        ),
        "resume_validation": (
            "Required before use: ordinary cegar.py --resume must fully "
            "semantically revalidate all 14,139 cuts under v18."
        ),
        "trust_scope": "external solver checkpoint; not Lean theorem closure",
    }
    immutable_target_sha256 = write_json_atomic_no_replace(
        args.target,
        checkpoint,
    )
    working_target_sha256 = write_json_atomic_no_replace(
        args.working_target,
        checkpoint,
    )

    report = {
        "status": "REBASED_FOR_MANDATORY_ORDINARY_RESUME_REVALIDATION",
        "source_checkpoint": display_path(args.source),
        "source_checkpoint_sha256": source_sha256,
        "immutable_target_checkpoint": display_path(args.target),
        "immutable_target_checkpoint_sha256": immutable_target_sha256,
        "working_target_checkpoint": display_path(args.working_target),
        "working_target_checkpoint_sha256": working_target_sha256,
        "source_schema": EXPECTED_SOURCE_SCHEMA,
        "target_schema": EXPECTED_TARGET_SCHEMA,
        "source_cut_count": len(cuts),
        "named_occurrences": outer.n,
        "added_names": [],
        "universal_schema_counts": actual_counts,
        "source_replayed_metric_unsat_cuts": EXPECTED_METRIC_UNSAT_CUTS,
        "semantic_target_revalidation": (
            "required-via-ordinary-resume-before-use"
        ),
        "trust_scope": "external-discovery-only-not-Lean-closure",
    }
    write_json_atomic_no_replace(args.report, report)
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
