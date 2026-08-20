"""Authenticate one v26 static-canary SAT survivor and mine all 48 source orders."""

from __future__ import annotations

import argparse
import hashlib
import itertools
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
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    BANK_SCHEMA as CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
)
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    EXPECTED_BANK_SHA256 as EXPECTED_CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
)
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    FAMILY_ID as CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_FAMILY_ID,
)
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    _admissible_center_exchange,
    _admissible_strict,
    _common_five,
    _positions,
    _side_conditions,
    attest_center_exchange_all_order_common_five_membership_family_bank_live_sources,
)
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    _sha256_json as _center_exchange_all_order_common_five_bank_sha256,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    BANK_SCHEMA as CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    EXPECTED_BANK_SHA256 as EXPECTED_CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    FAMILY_ID as CORE_PAIR_ALL_ORDER_COMMON_FIVE_FAMILY_ID,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    _sha256_json as _core_pair_all_order_common_five_bank_sha256,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    attest_core_pair_all_order_common_five_membership_family_bank_live_sources,
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
from census.card_head.exact12_next_row_arm_static_v26_validator import (
    validate_v26_workdir,
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

MINING_SCHEMA = "p97_rigid221_exact12_static_canary_all_order_mining.v6"
EXPECTED_SURVIVOR_CLASSIFICATION = "UNADMITTED_STRUCTURAL_SURVIVOR"

# Fixed deck-mobility classification of the twelve labels of the rigid
# (2,2,1)-anchored exact-12 cell-6 deck, keyed by label.
DECK_ROLE_CLASSIFICATION: dict[int, tuple[str, str]] = {
    0: ("anchor", "fixed"),
    1: ("anchor", "fixed"),
    2: ("anchor", "fixed"),
    3: ("surplus", "S3-permutable"),
    4: ("surplus", "S3-permutable"),
    5: ("surplus", "S3-permutable"),
    6: ("second-opposite", "endpoint-pair-reversible"),
    7: ("second-opposite", "middle-pair-reversible"),
    8: ("second-opposite", "middle-pair-reversible"),
    9: ("second-opposite", "endpoint-pair-reversible"),
    10: ("first-opposite", "pair-reversible"),
    11: ("first-opposite", "pair-reversible"),
}


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


def _cube_supports(cube: Mapping[str, Any]) -> dict[int, set[int]]:
    supports: dict[int, set[int]] = {}
    for center, rows in cube.items():
        try:
            label = int(center)
        except (TypeError, ValueError) as exc:
            raise MiningError(f"survivor cube center is malformed: {center!r}") from exc
        if not isinstance(rows, list) or any(type(row) is not int for row in rows):
            raise MiningError(f"survivor cube support is malformed for {center!r}")
        supports[label] = set(rows)
    if set(supports) != set(range(12)) or any(
        len(rows) != 4 for rows in supports.values()
    ):
        raise MiningError("survivor cube is not a 12-center four-support cube")
    return supports


def _reciprocal_containment(supports: Mapping[int, set[int]]) -> dict[str, Any]:
    degrees = {
        str(label): sum(1 for rows in supports.values() if label in rows)
        for label in sorted(supports)
    }
    mutual_pairs = [
        [i, j]
        for i, j in itertools.combinations(sorted(supports), 2)
        if j in supports[i] and i in supports[j]
    ]
    mutual_pair_set = {tuple(pair) for pair in mutual_pairs}
    mutual_triangles = [
        [i, j, k]
        for i, j, k in itertools.combinations(sorted(supports), 3)
        if {(i, j), (i, k), (j, k)} <= mutual_pair_set
    ]
    return {
        "degrees": degrees,
        "mutual_pairs": sorted(mutual_pairs),
        "mutual_triangles": sorted(mutual_triangles),
    }


def _deck_aware_core_reporting(
    normalized_profiles: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    reports = []
    for profile in normalized_profiles:
        core = profile["core"]
        roles = {}
        for role in ("a", "x", "b", "c", "y"):
            label = core[role]
            if label not in DECK_ROLE_CLASSIFICATION:
                raise MiningError(f"core label {label!r} has no deck classification")
            block, mobility = DECK_ROLE_CLASSIFICATION[label]
            roles[role] = {"label": label, "block": block, "deck_mobility": mobility}
        reports.append(
            {
                "core": dict(core),
                "roles": roles,
                "order_count": profile["order_count"],
                "orders": list(profile["orders"]),
            }
        )
    return reports


def _klein_admissible(a: int, x: int, b: int, c: int, y: int) -> bool:
    variants = [
        variant
        for variant in (
            (a, x, b, c, y),
            (a, y, b, c, x),
            (b, x, a, c, y),
            (b, y, a, c, x),
        )
        if _side_conditions(*variant)
    ]
    if not variants:
        return False
    return all(
        any(_common_five(position, *variant) for variant in variants)
        for position in _positions()
    )


def _rule_shape_classification(supports: Mapping[int, set[int]]) -> dict[str, Any]:
    strict_hits: list[list[int]] = []
    exchange_hits: list[list[int]] = []
    klein_hits: list[list[int]] = []
    unoriented: list[dict[str, Any]] = []
    for x, y in itertools.permutations(range(12), 2):
        if x > y:
            continue
        common = supports[x] & supports[y]
        for a, b in itertools.permutations(sorted(common), 2):
            for c in range(12):
                if c in (a, b, x, y):
                    continue
                has_b_row = {b, x, y} <= supports[c]
                has_a_row = {a, x, y} <= supports[c]
                if not (has_b_row or has_a_row):
                    continue
                # Serialize on the ordered (a, b) whose c-row is present;
                # (a, b) with b-row present is the certificate orientation.
                if not has_b_row:
                    continue
                instance = [a, b, c, x, y]
                if _admissible_strict(a, x, b, c, y) or _admissible_strict(
                    a, y, b, c, x
                ):
                    strict_hits.append(instance)
                elif _admissible_center_exchange(a, x, b, c, y):
                    exchange_hits.append(instance)
                elif has_a_row and _klein_admissible(a, x, b, c, y):
                    klein_hits.append(instance)
                else:
                    unoriented.append(
                        {
                            "instance": instance,
                            "c_row_kind": "union" if has_a_row else "single",
                        }
                    )
    return {
        "instance_order": "(a, b, c, x, y)",
        "counts": {
            "strict": len(strict_hits),
            "center_exchange": len(exchange_hits),
            "klein_union": len(klein_hits),
            "unoriented": len(unoriented),
        },
        "instances": {
            "strict": strict_hits,
            "center_exchange": exchange_hits,
            "klein_union": klein_hits,
            "unoriented": unoriented,
        },
    }


def mine(workdir: Path) -> dict[str, Any]:
    repo_root = Path(__file__).resolve().parents[2]
    validator_result = validate_v26_workdir(
        workdir,
        repo_root,
        piqd_root=workdir / "piqd-journal",
    )
    if validator_result.get("status") != "SAT_WITNESS_REPLAYED":
        raise MiningError("all-order mining requires a v26-validated SAT survivor")

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
    center_exchange_all_order_common_five_bank_path = (
        workdir / "center_exchange_all_order_common_five_family_bank.json"
    )
    core_pair_all_order_common_five_bank_path = (
        workdir / "core_pair_all_order_common_five_family_bank.json"
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
    center_exchange_all_order_common_five_bank = _read_json(
        center_exchange_all_order_common_five_bank_path
    )
    core_pair_all_order_common_five_bank = _read_json(
        core_pair_all_order_common_five_bank_path
    )

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
    center_exchange_all_order_common_five_bank_artifact = _require_artifact(
        summary=summary,
        key="center_exchange_all_order_common_five_family_bank",
        path=center_exchange_all_order_common_five_bank_path,
    )
    core_pair_all_order_common_five_bank_artifact = _require_artifact(
        summary=summary,
        key="core_pair_all_order_common_five_family_bank",
        path=core_pair_all_order_common_five_bank_path,
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

    center_exchange_all_order_common_five_job = job.get(
        "center_exchange_all_order_common_five_membership_family_bank"
    )
    center_exchange_all_order_common_five_snapshot = dict(
        center_exchange_all_order_common_five_bank
    )
    center_exchange_all_order_common_five_digest = (
        center_exchange_all_order_common_five_snapshot.pop("bank_sha256", None)
    )
    if (
        center_exchange_all_order_common_five_job
        != {
            "schema": CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
            "family_id": CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_FAMILY_ID,
            "sha256": EXPECTED_CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
            "lean_terminal_ingress_ready": False,
        }
        or center_exchange_all_order_common_five_bank.get("schema")
        != CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA
        or center_exchange_all_order_common_five_bank.get("family_id")
        != CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_FAMILY_ID
        or center_exchange_all_order_common_five_digest
        != EXPECTED_CENTER_EXCHANGE_ALL_ORDER_COMMON_FIVE_BANK_SHA256
        or center_exchange_all_order_common_five_digest
        != _center_exchange_all_order_common_five_bank_sha256(
            center_exchange_all_order_common_five_snapshot
        )
    ):
        raise MiningError(
            "center-exchange all-order common-five bank provenance failed"
        )
    try:
        attest_center_exchange_all_order_common_five_membership_family_bank_live_sources(
            Path(__file__).resolve().parents[2],
            center_exchange_all_order_common_five_bank,
        )
    except ValueError as exc:
        raise MiningError(
            "center-exchange all-order common-five bank source "
            f"attestation failed: {exc}"
        ) from exc

    core_pair_all_order_common_five_job = job.get(
        "core_pair_all_order_common_five_membership_family_bank"
    )
    core_pair_all_order_common_five_snapshot = dict(
        core_pair_all_order_common_five_bank
    )
    core_pair_all_order_common_five_digest = (
        core_pair_all_order_common_five_snapshot.pop("bank_sha256", None)
    )
    if (
        core_pair_all_order_common_five_job
        != {
            "schema": CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
            "family_id": CORE_PAIR_ALL_ORDER_COMMON_FIVE_FAMILY_ID,
            "sha256": EXPECTED_CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
            "lean_terminal_ingress_ready": False,
        }
        or core_pair_all_order_common_five_bank.get("schema")
        != CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA
        or core_pair_all_order_common_five_bank.get("family_id")
        != CORE_PAIR_ALL_ORDER_COMMON_FIVE_FAMILY_ID
        or core_pair_all_order_common_five_digest
        != EXPECTED_CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SHA256
        or core_pair_all_order_common_five_digest
        != _core_pair_all_order_common_five_bank_sha256(
            core_pair_all_order_common_five_snapshot
        )
    ):
        raise MiningError("core-pair all-order common-five bank provenance failed")
    try:
        attest_core_pair_all_order_common_five_membership_family_bank_live_sources(
            Path(__file__).resolve().parents[2],
            core_pair_all_order_common_five_bank,
        )
    except ValueError as exc:
        raise MiningError(
            "core-pair all-order common-five bank source "
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
    supports = _cube_supports(cube)
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

    structural_diagnostics = {
        "reciprocal_containment": _reciprocal_containment(supports),
        "deck_aware_core_reporting": _deck_aware_core_reporting(normalized_profiles),
        "rule_shape_classification": _rule_shape_classification(supports),
    }

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
            "v26_validator": validator_result,
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
            "center_exchange_all_order_common_five_family_bank": (
                center_exchange_all_order_common_five_bank_artifact
            ),
            "core_pair_all_order_common_five_family_bank": (
                core_pair_all_order_common_five_bank_artifact
            ),
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
        "structural_diagnostics": structural_diagnostics,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "workdir",
        type=Path,
        nargs="?",
        default=Path(
            "scratch/runs/exact12-rigid221-all-order-common-five/"
            "canary-v14-20260818/artifacts/workdir"
        ),
    )
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
