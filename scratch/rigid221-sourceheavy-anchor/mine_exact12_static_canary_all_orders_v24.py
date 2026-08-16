"""Authenticate one v24 static-canary SAT survivor and mine all 48 source orders."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    BANK_SCHEMA as ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
)
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    EXPECTED_BANK_SHA256 as EXPECTED_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
)
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    FAMILY_ID as ALL_ORDER_COMMON_FIVE_FAMILY_ID,
)
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    _sha256_json as _all_order_common_five_bank_sha256,
)
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    attest_all_order_common_five_membership_family_bank_live_sources,
)
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA as FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SCHEMA,
)
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    EXPECTED_BANK_SHA256 as EXPECTED_FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SHA256,
)
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    FAMILY_ID as FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_FAMILY_ID,
)
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    _sha256_json as _first_opposite_pair_surplus_second_opposite_common_five_bank_sha256,
)
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources,
)
from census.card_head.exact12_next_row_arm_static_canary import (
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_PREFIX_VARIABLES,
    EXPECTED_SOURCE_ORDER_BANK_SHA256,
    EXPECTED_SOURCE_ORDER_CLAUSES,
    JOB_SCHEMA,
    LEAN_INGRESS_THEOREM,
    RUN_SCHEMA,
    SUPPORTED_ARM_CELL_INDEX,
    TERMINAL_STATUS,
    _source_manifest,
)
from census.card_head.exact12_next_row_arm_static_v24_validator import (
    validate_v24_workdir,
)
from census.card_head.exact12_next_row_cell_run import _json_sha256
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    BANK_SCHEMA as SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_BANK_SCHEMA,
)
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    EXPECTED_BANK_SHA256 as EXPECTED_SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_BANK_SHA256,
)
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    FAMILY_ID as SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_FAMILY_ID,
)
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    _sha256_json as _second_opposite_triple_surplus_first_opposite_three_triad_bank_sha256,
)
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources,
)
from census.card_head.exact12_v14_ordered_coverage import (
    SOURCE_ORDERS,
    _closure_memberships,
    _common_five_orientation,
    _common_five_point_cores,
    _metric_rows,
    detect_ordered_coverage,
    replay_ordered_coverage,
)
from census.card_head.exact12_v14_source_order_bank import (
    BANK_SCHEMA as SOURCE_ORDER_BANK_SCHEMA,
)
from census.card_head.exact12_v14_source_order_bank import (
    _sha256_json as _source_order_bank_sha256,
)
from census.card_head.exact12_v14_source_order_bank import (
    attest_source_order_bank_live_sources,
)
from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)

MINING_SCHEMA = "p97_rigid221_exact12_static_canary_all_order_mining.v4"
EXPECTED_SURVIVOR_CLASSIFICATION = "UNADMITTED_STRUCTURAL_SURVIVOR"


class MiningError(RuntimeError):
    """Raised when an input or replay gate fails closed."""


def _read_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise MiningError(f"failed to read JSON input {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise MiningError(f"JSON input is not an object: {path}")
    return value


def _artifact(path: Path) -> dict[str, Any]:
    try:
        payload = path.read_bytes()
    except OSError as exc:
        raise MiningError(f"failed to read artifact {path}: {exc}") from exc
    return {
        "bytes": len(payload),
        "path": path.name,
        "sha256": hashlib.sha256(payload).hexdigest(),
    }


def _write_json(path: Path, value: Mapping[str, Any]) -> None:
    payload = (
        json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)
        + "\n"
    ).encode("utf-8")
    path.write_bytes(payload)


def _require_artifact(
    *, summary: Mapping[str, Any], key: str, path: Path
) -> dict[str, Any]:
    artifacts = summary.get("artifacts")
    if not isinstance(artifacts, Mapping):
        raise MiningError("run summary artifacts are malformed")
    expected = artifacts.get(key)
    actual = _artifact(path)
    if expected != actual:
        raise MiningError(
            f"run summary {key} artifact does not match live bytes: "
            f"expected={expected!r} actual={actual!r}"
        )
    return actual


def _core_key(coverage: Mapping[str, Any]) -> tuple[int, int, int, int, int]:
    core = coverage.get("core")
    if not isinstance(core, Mapping):
        raise MiningError("common-five coverage record has no core")
    keys = ("a", "x", "b", "c", "y")
    if set(core) != set(keys) or any(type(core[key]) is not int for key in keys):
        raise MiningError("common-five coverage core is malformed")
    return tuple(core[key] for key in keys)


def mine(workdir: Path) -> dict[str, Any]:
    repo_root = Path(__file__).resolve().parents[2]
    validator_result = validate_v24_workdir(
        workdir,
        repo_root,
        piqd_root=workdir / "piqd-journal",
    )
    if validator_result.get("status") != "SAT_WITNESS_REPLAYED":
        raise MiningError("all-order mining requires a v24-validated SAT survivor")

    summary_path = workdir / "summary.json"
    job_path = workdir / "job.json"
    survivor_path = workdir / "survivor.json"
    source_order_bank_path = workdir / "source_order_bank.json"
    first_opposite_pair_surplus_second_opposite_common_five_bank_path = (
        workdir / "first_opposite_pair_surplus_second_opposite_common_five_family_bank.json"
    )
    second_opposite_triple_surplus_first_opposite_three_triad_bank_path = (
        workdir
        / "second_opposite_triple_surplus_first_opposite_three_triad_family_bank.json"
    )
    all_order_common_five_bank_path = (
        workdir / "all_order_common_five_family_bank.json"
    )
    discovery_cnf_path = workdir / "discovery.cnf"
    summary = _read_json(summary_path)
    job = _read_json(job_path)
    survivor = _read_json(survivor_path)
    source_order_bank = _read_json(source_order_bank_path)
    first_opposite_pair_surplus_second_opposite_common_five_bank = _read_json(
        first_opposite_pair_surplus_second_opposite_common_five_bank_path
    )
    second_opposite_triple_surplus_first_opposite_three_triad_bank = _read_json(
        second_opposite_triple_surplus_first_opposite_three_triad_bank_path
    )
    all_order_common_five_bank = _read_json(all_order_common_five_bank_path)

    if summary.get("schema") != RUN_SCHEMA:
        raise MiningError("unexpected static-canary summary schema")
    if summary.get("arm_cell_index") != SUPPORTED_ARM_CELL_INDEX:
        raise MiningError("static canary is not the frozen supported arm cell")
    if summary.get("status") != "SAT_WITNESS_REPLAYED":
        raise MiningError("static canary is not a replayed SAT survivor")
    if summary.get("discovery_verdict") != "SAT":
        raise MiningError("static canary summary does not record discovery SAT")
    if summary.get("classification") != EXPECTED_SURVIVOR_CLASSIFICATION:
        raise MiningError("static canary is not an unadmitted structural survivor")
    if (
        summary.get("terminal_verdict") is not None
        or summary.get("terminal_proof_verified") is not False
        or summary.get("terminal_proof_authenticated") is not False
        or summary.get("lean_terminal_ingress_ready") is not True
        or summary.get("lean_ingress_theorem") != LEAN_INGRESS_THEOREM
        or summary.get("terminal_promotion_status") != TERMINAL_STATUS
        or summary.get("error") is not None
    ):
        raise MiningError("static-canary SAT branch has inconsistent terminal state")
    replay = summary.get("replay")
    expected_replay_keys = {
        "candidate",
        "added_constraints",
        "named_deletion_arm",
        "exact_cnf",
        "canonical_static_extension",
    }
    if (
        not isinstance(replay, Mapping)
        or set(replay) != expected_replay_keys
        or any(value is not True for value in replay.values())
    ):
        raise MiningError("static-canary replay gates are not all true")

    source_summary_artifact = _artifact(summary_path)
    source_job_artifact = _require_artifact(summary=summary, key="job", path=job_path)
    source_survivor_artifact = _require_artifact(
        summary=summary, key="survivor", path=survivor_path
    )
    source_order_bank_artifact = _require_artifact(
        summary=summary, key="source_order_bank", path=source_order_bank_path
    )
    first_opposite_pair_surplus_second_opposite_common_five_bank_artifact = (
        _require_artifact(
            summary=summary,
            key="first_opposite_pair_surplus_second_opposite_common_five_family_bank",
            path=first_opposite_pair_surplus_second_opposite_common_five_bank_path,
        )
    )
    second_opposite_triple_surplus_first_opposite_three_triad_bank_artifact = (
        _require_artifact(
            summary=summary,
            key="second_opposite_triple_surplus_first_opposite_three_triad_family_bank",
            path=second_opposite_triple_surplus_first_opposite_three_triad_bank_path,
        )
    )
    all_order_common_five_bank_artifact = _require_artifact(
        summary=summary,
        key="all_order_common_five_family_bank",
        path=all_order_common_five_bank_path,
    )
    source_discovery_cnf_artifact = _require_artifact(
        summary=summary, key="discovery_cnf", path=discovery_cnf_path
    )

    job_snapshot = dict(job)
    job_id = job_snapshot.pop("job_id", None)
    expected_cnf = {
        "bytes": source_discovery_cnf_artifact["bytes"],
        "sha256": EXPECTED_FINAL_DIMACS_SHA256,
        "variables": EXPECTED_PREFIX_VARIABLES,
        "clauses": EXPECTED_FINAL_CLAUSES,
    }
    if (
        job.get("schema") != JOB_SCHEMA
        or job.get("arm_cell_index") != SUPPORTED_ARM_CELL_INDEX
        or not isinstance(job_id, str)
        or job_id != _json_sha256(job_snapshot)
        or summary.get("job_id") != job_id
        or summary.get("job_sha256") != source_job_artifact["sha256"]
        or job.get("cnf") != expected_cnf
        or source_discovery_cnf_artifact["sha256"] != EXPECTED_FINAL_DIMACS_SHA256
        or job.get("sources") != _source_manifest(Path(__file__).resolve().parents[2])
    ):
        raise MiningError("static-canary job or frozen CNF provenance failed")

    source_order_job = job.get("source_order_bank")
    source_order_snapshot = dict(source_order_bank)
    source_order_digest = source_order_snapshot.pop("bank_sha256", None)
    if (
        not isinstance(source_order_job, Mapping)
        or source_order_job.get("schema") != SOURCE_ORDER_BANK_SCHEMA
        or source_order_job.get("sha256") != EXPECTED_SOURCE_ORDER_BANK_SHA256
        or source_order_job.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES
        or source_order_bank.get("schema") != SOURCE_ORDER_BANK_SCHEMA
        or source_order_digest != EXPECTED_SOURCE_ORDER_BANK_SHA256
        or source_order_digest != _source_order_bank_sha256(source_order_snapshot)
    ):
        raise MiningError("source-order bank provenance failed")
    try:
        attest_source_order_bank_live_sources(
            Path(__file__).resolve().parents[2], source_order_bank
        )
    except ValueError as exc:
        raise MiningError(
            f"source-order bank source attestation failed: {exc}"
        ) from exc

    first_opposite_pair_surplus_second_opposite_common_five_job = job.get(
        "first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank"
    )
    first_opposite_pair_surplus_second_opposite_common_five_snapshot = dict(
        first_opposite_pair_surplus_second_opposite_common_five_bank
    )
    first_opposite_pair_surplus_second_opposite_common_five_digest = (
        first_opposite_pair_surplus_second_opposite_common_five_snapshot.pop(
            "bank_sha256", None
        )
    )
    if (
        first_opposite_pair_surplus_second_opposite_common_five_job
        != {
            "schema": FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SCHEMA,
            "family_id": FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_FAMILY_ID,
            "sha256": EXPECTED_FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SHA256,
            "lean_terminal_ingress_ready": False,
        }
        or first_opposite_pair_surplus_second_opposite_common_five_bank.get("schema")
        != FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SCHEMA
        or first_opposite_pair_surplus_second_opposite_common_five_bank.get("family_id")
        != FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_FAMILY_ID
        or first_opposite_pair_surplus_second_opposite_common_five_digest
        != EXPECTED_FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SHA256
        or first_opposite_pair_surplus_second_opposite_common_five_digest
        != _first_opposite_pair_surplus_second_opposite_common_five_bank_sha256(
            first_opposite_pair_surplus_second_opposite_common_five_snapshot
        )
    ):
        raise MiningError(
            "first-opposite-pair/surplus/second-opposite common-five bank provenance failed"
        )
    try:
        attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources(
            Path(__file__).resolve().parents[2],
            first_opposite_pair_surplus_second_opposite_common_five_bank,
        )
    except ValueError as exc:
        raise MiningError(
            "first-opposite-pair/surplus/second-opposite common-five bank source "
            f"attestation failed: {exc}"
        ) from exc

    reciprocal_job = job.get(
        "second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank"
    )
    reciprocal_snapshot = dict(
        second_opposite_triple_surplus_first_opposite_three_triad_bank
    )
    reciprocal_digest = reciprocal_snapshot.pop("bank_sha256", None)
    if (
        reciprocal_job
        != {
            "schema": SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_BANK_SCHEMA,
            "family_id": SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_FAMILY_ID,
            "sha256": EXPECTED_SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_BANK_SHA256,
            "lean_terminal_ingress_ready": False,
        }
        or second_opposite_triple_surplus_first_opposite_three_triad_bank.get(
            "schema"
        )
        != SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_BANK_SCHEMA
        or second_opposite_triple_surplus_first_opposite_three_triad_bank.get(
            "family_id"
        )
        != SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_FAMILY_ID
        or reciprocal_digest
        != EXPECTED_SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_THREE_TRIAD_BANK_SHA256
        or reciprocal_digest
        != _second_opposite_triple_surplus_first_opposite_three_triad_bank_sha256(
            reciprocal_snapshot
        )
        or second_opposite_triple_surplus_first_opposite_three_triad_bank_artifact[
            "sha256"
        ]
        != _artifact(
            second_opposite_triple_surplus_first_opposite_three_triad_bank_path
        )["sha256"]
    ):
        raise MiningError(
            "second-opposite triple-surplus three-triad bank provenance failed"
        )
    try:
        attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources(
            Path(__file__).resolve().parents[2],
            second_opposite_triple_surplus_first_opposite_three_triad_bank,
        )
    except ValueError as exc:
        raise MiningError(
            "second-opposite triple-surplus three-triad bank source "
            f"attestation failed: {exc}"
        ) from exc

    all_order_common_five_job = job.get(
        "all_order_common_five_membership_family_bank"
    )
    all_order_common_five_snapshot = dict(all_order_common_five_bank)
    all_order_common_five_digest = all_order_common_five_snapshot.pop(
        "bank_sha256", None
    )
    if (
        all_order_common_five_job
        != {
            "schema": ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
            "family_id": ALL_ORDER_COMMON_FIVE_FAMILY_ID,
            "sha256": EXPECTED_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
            "lean_terminal_ingress_ready": False,
        }
        or all_order_common_five_bank.get("schema")
        != ALL_ORDER_COMMON_FIVE_BANK_SCHEMA
        or all_order_common_five_bank.get("family_id")
        != ALL_ORDER_COMMON_FIVE_FAMILY_ID
        or all_order_common_five_digest
        != EXPECTED_ALL_ORDER_COMMON_FIVE_BANK_SHA256
        or all_order_common_five_digest
        != _all_order_common_five_bank_sha256(all_order_common_five_snapshot)
    ):
        raise MiningError("all-order common-five bank provenance failed")
    try:
        attest_all_order_common_five_membership_family_bank_live_sources(
            Path(__file__).resolve().parents[2],
            all_order_common_five_bank,
        )
    except ValueError as exc:
        raise MiningError(
            "all-order common-five bank source "
            f"attestation failed: {exc}"
        ) from exc

    positive_variables = survivor.get("positive_variables")
    if (
        survivor.get("job_id") != job_id
        or survivor.get("arm_cell_index") != SUPPORTED_ARM_CELL_INDEX
        or survivor.get("classification") != EXPECTED_SURVIVOR_CLASSIFICATION
        or survivor.get("replay") != replay
        or not isinstance(positive_variables, list)
        or any(type(value) is not int for value in positive_variables)
        or positive_variables != sorted(set(positive_variables))
        or survivor.get("assignment_sha256") != _json_sha256(positive_variables)
    ):
        raise MiningError("survivor provenance or assignment digest failed")

    cube = survivor.get("cube")
    if not isinstance(cube, Mapping):
        raise MiningError("survivor cube is malformed")
    certificate = detect_ordered_coverage(cube)
    if certificate is None:
        raise MiningError("survivor is not covered across all 48 source orders")
    replayed_memberships = replay_ordered_coverage(certificate)

    rows = _metric_rows(cube)
    all_order_common_five_cores = []
    for raw_core in _common_five_point_cores(rows):
        orientations = [
            _common_five_orientation(order, raw_core)
            for _source_orientation, order in SOURCE_ORDERS
        ]
        if not all(orientations):
            continue
        first_orientation = orientations[0]
        stage = (
            "equality-convex-five-point"
            if first_orientation == "forward"
            else "equality-convex-five-point-reverse"
        )
        closure = certificates._certificate_for_detection(
            rows, 12, {"stage": stage, "core": dict(raw_core)}
        )
        if certificates._validate_certificate(closure, n=12) is not True:
            raise MiningError("all-order common-five core failed equality replay")
        all_order_common_five_cores.append(
            {
                "core": dict(raw_core),
                "orientation_counts": dict(sorted(Counter(orientations).items())),
                "selected_memberships": [
                    {"center": center, "required": list(points)}
                    for center, points in _closure_memberships(closure)
                ],
                "closure_proof_sha256": closure.get("proof_sha256"),
            }
        )

    coverage = certificate.get("coverage")
    if not isinstance(coverage, list) or len(coverage) != 48:
        raise MiningError("diagnostic certificate does not cover exactly 48 orders")

    rule_counts: Counter[str] = Counter()
    orientation_counts: Counter[str] = Counter()
    source_orientation_counts: Counter[str] = Counter()
    core_profiles: dict[tuple[int, int, int, int, int], dict[str, Any]] = defaultdict(
        lambda: {
            "orders": [],
            "orientations": Counter(),
            "source_orientations": Counter(),
            "closure_proof_sha256": set(),
        }
    )
    for record in coverage:
        if not isinstance(record, Mapping):
            raise MiningError("coverage record is malformed")
        rule = record.get("rule")
        if not isinstance(rule, str):
            raise MiningError("coverage record has no rule")
        rule_counts[rule] += 1
        source_orientation = record.get("source_orientation")
        if isinstance(source_orientation, str):
            source_orientation_counts[source_orientation] += 1
        if rule != "convex-five-point-common-orientation":
            continue
        orientation = record.get("orientation")
        if not isinstance(orientation, str):
            raise MiningError("common-five coverage record has no orientation")
        orientation_counts[orientation] += 1
        profile = core_profiles[_core_key(record)]
        profile["orders"].append(record.get("order_id"))
        profile["orientations"][orientation] += 1
        if isinstance(source_orientation, str):
            profile["source_orientations"][source_orientation] += 1
        proof_sha256 = record.get("closure_proof_sha256")
        if isinstance(proof_sha256, str):
            profile["closure_proof_sha256"].add(proof_sha256)

    normalized_profiles = []
    for core, profile in sorted(core_profiles.items()):
        normalized_profiles.append(
            {
                "core": dict(zip(("a", "x", "b", "c", "y"), core, strict=True)),
                "order_count": len(profile["orders"]),
                "orders": profile["orders"],
                "orientation_counts": dict(sorted(profile["orientations"].items())),
                "source_orientation_counts": dict(
                    sorted(profile["source_orientations"].items())
                ),
                "closure_proof_sha256": sorted(profile["closure_proof_sha256"]),
            }
        )

    certificate_path = workdir / "all_order_diagnostic_certificate.json"
    _write_json(certificate_path, certificate)
    return {
        "schema": MINING_SCHEMA,
        "scope": (
            "authenticated diagnostic mining of one finite exact-12 SAT survivor; "
            "not a proof-backed nogood, universal lift, terminal UNSAT result, or "
            "Lean closure"
        ),
        "source": {
            "v24_validator": validator_result,
            "summary": source_summary_artifact,
            "job": source_job_artifact,
            "survivor": source_survivor_artifact,
            "source_order_bank": source_order_bank_artifact,
            "first_opposite_pair_surplus_second_opposite_common_five_family_bank": (
                first_opposite_pair_surplus_second_opposite_common_five_bank_artifact
            ),
            "second_opposite_triple_surplus_first_opposite_three_triad_family_bank": (
                second_opposite_triple_surplus_first_opposite_three_triad_bank_artifact
            ),
            "all_order_common_five_family_bank": all_order_common_five_bank_artifact,
            "discovery_cnf": source_discovery_cnf_artifact,
            "job_id": job_id,
            "assignment_sha256": survivor.get("assignment_sha256"),
        },
        "certificate": {
            "artifact": _artifact(certificate_path),
            "certificate_sha256": certificate.get("certificate_sha256"),
            "has_generated_lean_nogood": "generated_lean_nogood" in certificate,
            "coverage_records": len(coverage),
            "closure_certificates": len(certificate.get("closure_certificates", [])),
            "rule_counts": dict(sorted(rule_counts.items())),
            "orientation_counts": dict(sorted(orientation_counts.items())),
            "source_orientation_counts": dict(
                sorted(source_orientation_counts.items())
            ),
            "core_profiles": normalized_profiles,
            "all_order_common_five_cores": all_order_common_five_cores,
            "selected_memberships": certificate.get("selected_memberships"),
            "selected_rows": certificate.get("selected_rows"),
            "replayed_memberships": [
                {"center": center, "required": list(points)}
                for center, points in replayed_memberships
            ],
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("workdir", type=Path)
    args = parser.parse_args()
    workdir = args.workdir.resolve()
    result = mine(workdir)
    output_path = workdir / "all_order_mining_summary.json"
    _write_json(output_path, result)
    print(
        json.dumps(
            {"output": str(output_path), **result["certificate"]}, sort_keys=True
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
