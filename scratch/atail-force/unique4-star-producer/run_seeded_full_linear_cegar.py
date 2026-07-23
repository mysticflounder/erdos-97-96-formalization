#!/usr/bin/env python3
"""Seeded full-linear Kalmanson CEGAR for the corrected unique-four projection.

This is a fail-closed wrapper around ``run_full_linear_cegar.py``.  It loads
kernel-checked row-instance schemas before the first Boolean solve, but accepts
only records whose row instances have pairwise distinct center roles.  Under
that precondition, translating a row instance to ``m_center_member`` literals
preserves its identity.  A repeated-center record is rejected because this
outer CNF carries only one selected row per center.

The run is fixed-cardinality theorem discovery.  A Boolean terminal or a full-
linear shadow is not a Lean proof or a Euclidean realization.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
import time
from pathlib import Path
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BASE_PATH = HERE / "run_full_linear_cegar.py"
DEFAULT_SEED_BANK = (
    HERE.parent
    / "unique4-source-field-audit"
    / "kalmanson_row_instance_schemas.json"
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


BASE = load_module("unique4_star_seeded_base", BASE_PATH)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_json_sha256(value: Any) -> str:
    return sha256_bytes(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")
    )


def require_int(value: Any, context: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int):
        raise ValueError(f"{context}: expected integer, got {value!r}")
    return value


def validate_seed_record(record: Any) -> dict[str, Any]:
    """Validate one bank record and return its lossless literal schema."""

    if not isinstance(record, dict):
        raise ValueError("seed record must be an object")
    record_id = record.get("id")
    if not isinstance(record_id, str) or not record_id:
        raise ValueError("seed record has no nonempty id")
    lean_consumer = record.get("lean_consumer")
    if not isinstance(lean_consumer, str) or not lean_consumer:
        raise ValueError(f"{record_id}: missing Lean consumer")
    profile = require_int(record.get("profile"), f"{record_id}.profile")
    if profile not in (4, 5):
        raise ValueError(f"{record_id}: unsupported source profile {profile}")

    role_count = require_int(
        record.get("core_vertex_count"), f"{record_id}.core_vertex_count"
    )
    if role_count < 2:
        raise ValueError(f"{record_id}: core_vertex_count must be at least two")
    source_vertices = record.get("source_vertices_by_role")
    if (
        not isinstance(source_vertices, list)
        or len(source_vertices) != role_count
        or any(isinstance(v, bool) or not isinstance(v, int) for v in source_vertices)
        or source_vertices != sorted(source_vertices)
        or len(set(source_vertices)) != role_count
    ):
        raise ValueError(
            f"{record_id}: source_vertices_by_role must be a strictly increasing "
            f"list of length {role_count}"
        )

    row_instances = record.get("row_instances")
    if not isinstance(row_instances, list) or not row_instances:
        raise ValueError(f"{record_id}: row_instances must be nonempty")
    row_ids: set[str] = set()
    center_roles: set[int] = set()
    memberships: list[tuple[int, int]] = []
    normalized_rows: list[dict[str, Any]] = []
    for index, row in enumerate(row_instances):
        if not isinstance(row, dict):
            raise ValueError(f"{record_id}.row_instances[{index}] must be an object")
        row_id = row.get("row_instance_id")
        if not isinstance(row_id, str) or not row_id or row_id in row_ids:
            raise ValueError(f"{record_id}: row-instance ids must be nonempty and unique")
        row_ids.add(row_id)
        center = require_int(
            row.get("center_role"), f"{record_id}.{row_id}.center_role"
        )
        if not 0 <= center < role_count:
            raise ValueError(f"{record_id}.{row_id}: center role is out of range")
        if center in center_roles:
            raise ValueError(
                f"{record_id}: repeated center role {center}; this outer CNF has "
                "one row per center, so row-instance identity would be lost"
            )
        center_roles.add(center)
        members_raw = row.get("member_roles")
        if not isinstance(members_raw, list) or not members_raw:
            raise ValueError(f"{record_id}.{row_id}: member_roles must be nonempty")
        members = tuple(
            require_int(member, f"{record_id}.{row_id}.member_roles")
            for member in members_raw
        )
        if (
            any(not 0 <= member < role_count for member in members)
            or center in members
            or len(set(members)) != len(members)
            or list(members) != sorted(members)
        ):
            raise ValueError(
                f"{record_id}.{row_id}: member roles must be sorted, distinct, "
                "in range, and different from the center"
            )
        memberships.extend((center, member) for member in members)
        normalized_rows.append(
            {
                "row_instance_id": row_id,
                "center_role": center,
                "member_roles": list(members),
            }
        )

    membership_schema = tuple(sorted(memberships))
    legacy = record.get("legacy_center_point_schema")
    if not isinstance(legacy, list):
        raise ValueError(f"{record_id}: missing legacy_center_point_schema audit")
    legacy_schema = tuple(
        sorted(
            (
                require_int(pair[0], f"{record_id}.legacy_center_point_schema"),
                require_int(pair[1], f"{record_id}.legacy_center_point_schema"),
            )
            for pair in legacy
            if isinstance(pair, list) and len(pair) == 2
        )
    )
    if len(legacy_schema) != len(legacy) or legacy_schema != membership_schema:
        raise ValueError(
            f"{record_id}: flattened row-instance schema does not match its audit"
        )

    strict_raw = record.get("strict_inequalities")
    if not isinstance(strict_raw, list) or not strict_raw:
        raise ValueError(f"{record_id}: strict_inequalities must be nonempty")
    strict_inequalities: list[dict[str, Any]] = []
    for index, inequality in enumerate(strict_raw):
        if not isinstance(inequality, dict) or inequality.get("kind") not in {
            "K1",
            "K2",
        }:
            raise ValueError(f"{record_id}: invalid strict inequality {index}")
        roles_raw = inequality.get("roles")
        if not isinstance(roles_raw, list) or len(roles_raw) != 4:
            raise ValueError(f"{record_id}: strict inequality {index} needs four roles")
        roles = tuple(
            require_int(role, f"{record_id}.strict_inequalities[{index}]")
            for role in roles_raw
        )
        if list(roles) != sorted(roles) or len(set(roles)) != 4 or any(
            not 0 <= role < role_count for role in roles
        ):
            raise ValueError(
                f"{record_id}: strict inequality {index} roles must be strictly "
                "increasing and in range"
            )
        strict_inequalities.append(
            {"kind": inequality["kind"], "roles": list(roles)}
        )

    source_artifact_raw = record.get("source_artifact")
    source_artifact_sha256 = record.get("source_artifact_sha256")
    if not isinstance(source_artifact_raw, str) or not isinstance(
        source_artifact_sha256, str
    ):
        raise ValueError(f"{record_id}: missing source-artifact hash binding")
    source_artifact = (ROOT / source_artifact_raw).resolve()
    try:
        source_artifact.relative_to(ROOT)
    except ValueError as error:
        raise ValueError(f"{record_id}: source artifact leaves repository") from error
    if not source_artifact.is_file():
        raise ValueError(f"{record_id}: source artifact does not exist")
    actual_source_hash = BASE.DIRECT.sha256(source_artifact)
    if actual_source_hash != source_artifact_sha256:
        raise ValueError(f"{record_id}: source-artifact hash mismatch")

    reflected = tuple(
        sorted(
            (role_count - 1 - center, role_count - 1 - member)
            for center, member in membership_schema
        )
    )
    canonical = min(membership_schema, reflected)
    return {
        "id": record_id,
        "profile": profile,
        "lean_consumer": lean_consumer,
        "core_vertex_count": role_count,
        "source_artifact": source_artifact_raw,
        "source_artifact_sha256": source_artifact_sha256,
        "source_vertices_by_role": source_vertices,
        "row_instances": normalized_rows,
        "strict_inequalities": strict_inequalities,
        "canonical_order_schema": [list(pair) for pair in canonical],
        "forward_order_schema": [list(pair) for pair in membership_schema],
        "reflected_order_schema": [list(pair) for pair in reflected],
        "record_sha256": canonical_json_sha256(record),
    }


def load_seed_bank(path: Path) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    raw = path.read_bytes()
    payload = json.loads(raw)
    if not isinstance(payload, dict):
        raise ValueError("seed bank must be a JSON object")
    if payload.get("schema") != "p97-kalmanson-row-instance-schema-bank-v1":
        raise ValueError("unsupported seed-bank schema")
    if payload.get("epistemic_status") != (
        "KERNEL_CHECKED_CONSUMERS_FOR_TWO_FIXED_CORRECTED_SURVIVORS"
    ):
        raise ValueError("seed bank is not marked kernel-checked")
    records_raw = payload.get("records")
    if not isinstance(records_raw, list) or not records_raw:
        raise ValueError("seed bank has no records")
    records = [validate_seed_record(record) for record in records_raw]
    ids = [record["id"] for record in records]
    if len(set(ids)) != len(ids):
        raise ValueError("seed record ids are not unique")
    return records, {
        "path": str(path.resolve().relative_to(ROOT)),
        "sha256": sha256_bytes(raw),
        "schema": payload["schema"],
        "epistemic_status": payload["epistemic_status"],
        "record_count": len(records),
    }


def add_seed_cuts(
    cnf: Any, n: int, records: list[dict[str, Any]]
) -> dict[str, Any]:
    all_clauses: set[tuple[int, ...]] = set()
    summaries: list[dict[str, Any]] = []
    total_embedding_count = 0
    for record in records:
        role_count = record["core_vertex_count"]
        if role_count > n:
            raise ValueError(
                f"{record['id']}: {role_count} roles cannot embed into n={n}"
            )
        forward = tuple(tuple(pair) for pair in record["forward_order_schema"])
        reflected = tuple(tuple(pair) for pair in record["reflected_order_schema"])
        record_clauses: set[tuple[int, ...]] = set()
        orientation_count = 1 if forward == reflected else 2
        for targets in itertools.combinations(range(n), role_count):
            for schema in (forward,) if orientation_count == 1 else (forward, reflected):
                transformed = tuple(
                    sorted((targets[center], targets[member]) for center, member in schema)
                )
                clause = tuple(
                    sorted(-cnf.ids[f"m_{center}_{member}"] for center, member in transformed)
                )
                record_clauses.add(clause)
        overlap = all_clauses.intersection(record_clauses)
        for clause in sorted(record_clauses):
            if clause not in all_clauses:
                cnf.add("seeded_full_linear_kalmanson_cut", list(clause))
        all_clauses.update(record_clauses)
        embedding_count = (
            len(list(itertools.combinations(range(n), role_count)))
            * orientation_count
        )
        total_embedding_count += embedding_count
        summaries.append(
            {
                **record,
                "order_preserving_embedding_count": (
                    embedding_count // orientation_count
                ),
                "orientation_count": orientation_count,
                "covered_oriented_embedding_count": embedding_count,
                "unique_record_cut_count": len(record_clauses),
                "duplicate_embedding_cut_count": embedding_count
                - len(record_clauses),
                "overlap_with_prior_record_cut_count": len(overlap),
                "cut_set_sha256": canonical_json_sha256(
                    [list(clause) for clause in sorted(record_clauses)]
                ),
            }
        )
    return {
        "records": summaries,
        "total_covered_oriented_embedding_count": total_embedding_count,
        "total_unique_cut_count": len(all_clauses),
        "combined_cut_set_sha256": canonical_json_sha256(
            [list(clause) for clause in sorted(all_clauses)]
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--opp1-card", required=True, type=int, choices=(4, 5))
    parser.add_argument("--seed-bank", type=Path, default=DEFAULT_SEED_BANK)
    parser.add_argument("--work-cnf", required=True, type=Path)
    parser.add_argument("--work-log", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--wall-seconds", type=int, default=3600)
    parser.add_argument("--solver-timeout-seconds", type=int, default=900)
    parser.add_argument("--metric-timeout-ms", type=int, default=120_000)
    parser.add_argument("--max-refinements", type=int, default=1000)
    args = parser.parse_args()

    n = 11
    started = time.monotonic()
    deadline = started + args.wall_seconds
    cnf, metadata = BASE.DIRECT.OUTER.encode(
        n,
        args.opp1_card,
        BASE.DIRECT.PLANAR_BANK,
        BASE.DIRECT.KALMANSON_BANK,
        BASE.DIRECT.U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )
    own_cap_counts = BASE.OWN_CAP.add_own_cap_bounds(cnf, metadata)
    direct_overlay = BASE.DIRECT.add_direct_curvature_overlay(cnf, n)
    seed_records, seed_bank = load_seed_bank(args.seed_bank.resolve())
    seeded_cuts = add_seed_cuts(cnf, n, seed_records)
    source_paths = (
        Path(__file__).resolve(),
        Path(BASE.__file__).resolve(),
        BASE.OWN_CAP_RUNNER_PATH,
        BASE.FULL_LINEAR_PATH,
        args.seed_bank.resolve(),
        BASE.DIRECT.DIRECT_PATH
        if hasattr(BASE.DIRECT, "DIRECT_PATH")
        else Path(BASE.DIRECT.__file__),
        BASE.DIRECT.OUTER_PATH,
        BASE.DIRECT.PLANAR_BANK,
        BASE.DIRECT.KALMANSON_BANK,
        BASE.DIRECT.U5_BANK,
    )
    source_hashes = {
        str(path.resolve().relative_to(ROOT)): BASE.DIRECT.sha256(path)
        for path in source_paths
    }
    payload: dict[str, Any] = {
        "schema": "p97-unique4-seeded-owncap-curvature-full-linear-cegar-v1",
        "epistemic_status": "BOUNDED THEOREM DISCOVERY; NOT A LEAN PROOF",
        "claim_scope": (
            "fixed n=11 corrected finite projection plus kernel-consumer-backed "
            "seed cuts and an exact full-linear Kalmanson/triangle oracle"
        ),
        "opp1_card": args.opp1_card,
        "n": n,
        "source_hashes": source_hashes,
        "own_cap_clause_counts": own_cap_counts,
        "direct_curvature_overlay": direct_overlay,
        "seed_bank": seed_bank,
        "seeded_cuts": seeded_cuts,
        "refinements": [],
        "terminal_status": "RUNNING",
    }
    BASE.write_checkpoint(args.output, payload)
    seen: set[tuple[int, tuple[tuple[int, int], ...]]] = {
        (
            record["core_vertex_count"],
            tuple(tuple(pair) for pair in record["canonical_order_schema"]),
        )
        for record in seed_records
    }

    for attempt in range(1, args.max_refinements + 1):
        remaining = int(deadline - time.monotonic())
        if remaining <= 0:
            payload["terminal_status"] = "UNKNOWN_WALL_BUDGET"
            break
        round_metadata = {
            **metadata,
            **own_cap_counts,
            **direct_overlay,
            "seeded_full_linear_cut_count": seeded_cuts["total_unique_cut_count"],
            "full_linear_refinement_count": len(payload["refinements"]),
            "final_variable_count": len(cnf.names) - 1,
            "final_clause_count": len(cnf.clauses),
        }
        cnf.write_dimacs(args.work_cnf, round_metadata)
        status, log = BASE.DIRECT.solve(
            args.work_cnf,
            min(args.solver_timeout_seconds, remaining),
            "cadical",
            None,
        )
        args.work_log.write_text(log, encoding="utf-8")
        if status != "SAT":
            payload["terminal_status"] = (
                "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY"
                if status == "UNSAT"
                else "UNKNOWN_BOOLEAN_SOLVER"
            )
            payload["terminal_cnf_sha256"] = BASE.DIRECT.sha256(args.work_cnf)
            payload["terminal_solver_log_sha256"] = BASE.DIRECT.sha256(args.work_log)
            break

        assignment = BASE.DIRECT.parse_solver_assignment(log)
        decoded = BASE.DIRECT.OUTER.decode_sat(cnf, assignment, round_metadata)
        BASE.DIRECT.assert_sat_projection_has_no_terminal(decoded, n)
        BASE.OWN_CAP.assert_own_cap_bounds(decoded, metadata)
        rows = {
            int(center): tuple(sorted(map(int, support)))
            for center, support in decoded["rows"].items()
        }
        metric_status, centers, core_names, details = (
            BASE.FULL_LINEAR.CEGAR.metric_check(
                rows,
                n,
                args.metric_timeout_ms,
                deadline,
            )
        )
        if metric_status == z3.sat:
            payload["terminal_status"] = "SAT_VERIFIED_FULL_LINEAR_SHADOW"
            payload["terminal_decoded"] = decoded
            payload["terminal_distance_model"] = details
            break
        if metric_status == z3.unknown:
            payload["terminal_status"] = "UNKNOWN_FULL_LINEAR_ORACLE"
            payload["reason_unknown"] = str(details)
            break

        core_vertices = tuple(map(int, details["core_vertices"]))
        required = tuple(
            tuple(map(int, pair)) for pair in details["required_memberships"]
        )
        canonical, cut_count = BASE.add_schema_cuts(
            cnf, n, core_vertices, required
        )
        schema_key = (len(core_vertices), canonical)
        if schema_key in seen:
            raise AssertionError(
                "full-linear oracle rediscovered a seeded or refined schema"
            )
        seen.add(schema_key)
        payload["refinements"].append(
            {
                "attempt": attempt,
                "dependency_centers": list(centers),
                "metric_core": list(core_names),
                "constraint_kinds": list(details["constraint_kinds"]),
                "core_vertices": list(core_vertices),
                "required_memberships": [list(pair) for pair in required],
                "canonical_order_schema": [list(pair) for pair in canonical],
                "order_embedding_cut_count": cut_count,
                "cnf_sha256_before_cut": BASE.DIRECT.sha256(args.work_cnf),
            }
        )
        payload["elapsed_seconds"] = time.monotonic() - started
        BASE.write_checkpoint(args.output, payload)
    else:
        payload["terminal_status"] = "UNKNOWN_REFINEMENT_BUDGET"

    payload["elapsed_seconds"] = time.monotonic() - started
    payload["refinement_count"] = len(payload["refinements"])
    payload["final_variable_count"] = len(cnf.names) - 1
    payload["final_clause_count"] = len(cnf.clauses)
    BASE.write_checkpoint(args.output, payload)
    print(
        json.dumps(
            {
                "opp1_card": args.opp1_card,
                "terminal_status": payload["terminal_status"],
                "seed_cut_count": seeded_cuts["total_unique_cut_count"],
                "refinement_count": payload["refinement_count"],
                "elapsed_seconds": payload["elapsed_seconds"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
