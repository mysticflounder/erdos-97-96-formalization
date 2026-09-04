# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Profile-0034 supporting-edge QF_NRA discovery adapter.

The emitted target is a sound relaxation of the authenticated equilateral-frame
target.  It keeps only the 143 directed cyclic supporting-edge inequalities.
SAT is accepted only after exact replay against all 286 original orientations,
all 13 original row equalities, and both metric strict inequalities.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import math
import os
import re
import stat
import subprocess
import urllib.parse
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any, Literal

from census.card_head import (
    exactfive_hard_source_swap_bo_source_qfnra_piqd as bo_source,
)
from census.card_head import (
    exactfive_hard_source_swap_profile0034_equilateral_frame_qfnra_piqd as predecessor,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile0034-supporting-edge-qfnra-piqd-20260904"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
    "supporting-edge-qfnra-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_hard_source_swap_profile0034_"
    "supporting_edge_qfnra_piqd.py"
)

PREDECESSOR_ROOT = REPOSITORY_ROOT / (
    "scratch/runs/exactfive-hard-source-swap-profile0034-"
    "equilateral-frame-qfnra-piqd-20260904/run-0002"
)
PREDECESSOR_MANIFEST_PATH = PREDECESSOR_ROOT / "run_manifest.json"
PREDECESSOR_LAUNCH_PATH = PREDECESSOR_ROOT / "events/launch.json"
PREDECESSOR_TERMINAL_PATH = PREDECESSOR_ROOT / "events/terminal.json"
PREDECESSOR_PRODUCER_PATH = Path(predecessor.__file__).resolve()

PROFILE_INDEX = 34
PROFILE_SHA256 = predecessor.PROFILE_SHA256
PREDECESSOR_MANIFEST_FILE_SHA256 = (
    "3698180568d732da9055c9ba93f473dff744b0bc28daaeb78235614b6c6ab259"
)
PREDECESSOR_LAUNCH_FILE_SHA256 = (
    "a55fb9db313488082a2572e5174812f4cdfb7d392c2b2370e61944e71955a1c2"
)
PREDECESSOR_TERMINAL_FILE_SHA256 = (
    "8654e3ea80de66d4f483e4c6828bf4a0d571647a3e560e6837865edd5fdf0aae"
)
PREDECESSOR_MANIFEST_SHA256 = (
    "857fd5899aec834fd1620e9e69a809b594af315790195dcf44e38b65d510cbbc"
)
PREDECESSOR_LAUNCH_SHA256 = (
    "8133d34a18f31ea2753ffd40f9d7967b2df9961fce9ad3d7e009dc553b7cd922"
)
PREDECESSOR_TERMINAL_SHA256 = (
    "8d7ca9f5f802f1c988baa7612189ac305598dc4c3495d5d9796949064eaeac5a"
)
PREDECESSOR_PRODUCER_SHA256 = (
    "48ea11c20276ee883f8b244ed3a423a858e787768f6e80621edf7c0b80962237"
)
EXPECTED_PREDECESSOR_RESULTS = {
    "control-negative": "bec3c15888396a7415c2cd6f20dc67cdac05b48d4b61ab479fe106620c406c9c",
    "control-positive": "be81c188439fe5d8d2c713feb10466c11e47fd7e91ed03c9035d97acd60b143d",
    "parent-cvc5-direct-radius-gt": "5b76d488e31e1463ecf8f17413ad576109848d1c00ad0e8f7d960285b496ac9d",
    "parent-cvc5-direct-radius-lt": "c33354a678d2633767d10a6e3cca8ecd934996e1b473f80383cf00ab5d7b7990",
    "parent-z3-mirror-radius-gt": "8ec62b8a6c80b5c248db2dce7ed3ea363ddc00a5c97aa7375d4cb73ebfbba5f5",
    "parent-z3-mirror-radius-lt": "2ca2dad9b22dc2f0a242e291e69f3d68d3eb57d769d2be4660d437099bda3f86",
}

SYSTEM_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "supporting-edge-radius-cell-qfnra-system/v1"
)
PRODUCER_VERSION = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "supporting-edge-radius-cell-qfnra/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "supporting-edge-radius-cell-qfnra-launch/v1"
)
TERMINAL_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "supporting-edge-radius-cell-qfnra-result/v1"
)

CONTROL_IDS = predecessor.CONTROL_IDS
ORDER_IDS = predecessor.ORDER_IDS
BRANCH_IDS = predecessor.BRANCH_IDS
BRANCH_RELATIONS = predecessor.BRANCH_RELATIONS
TARGET_KEYS = predecessor.TARGET_KEYS
QUERY_KEYS = predecessor.QUERY_KEYS
MAX_WORKERS = 4
DEFAULT_WORKERS = 4
DEFAULT_TIMEOUT_S = 60.0
CLASS_IDS = predecessor.CLASS_IDS
FREE_CLASS_IDS = predecessor.FREE_CLASS_IDS
TARGET_VARIABLES = predecessor.TARGET_VARIABLES
EXPECTED_ORDERS = predecessor.EXPECTED_ORDERS
FALSE_CLAIMS = dict(predecessor.FALSE_CLAIMS)
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-supporting-edge-qfnra-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd.py",
]


class Profile0034SupportingEdgeError(RuntimeError):
    """The supporting-edge diagnostic failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034SupportingEdgeError(f"artifact is missing: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034SupportingEdgeError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034SupportingEdgeError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile0034SupportingEdgeError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise Profile0034SupportingEdgeError(f"{where} is not an object")
    return value


def _predecessor_artifact_path(key: str, name: str) -> Path:
    return PREDECESSOR_ROOT / "artifacts" / key / name


def authenticate_predecessor_run() -> dict[str, Any]:
    """Authenticate and replay the committed equilateral run-0002."""

    manifest_payload = _read_regular(PREDECESSOR_MANIFEST_PATH)
    launch_payload = _read_regular(PREDECESSOR_LAUNCH_PATH)
    terminal_payload = _read_regular(PREDECESSOR_TERMINAL_PATH)
    producer_payload = _read_regular(PREDECESSOR_PRODUCER_PATH)
    if {
        _sha(manifest_payload),
        _sha(launch_payload),
        _sha(terminal_payload),
        _sha(producer_payload),
    } != {
        PREDECESSOR_MANIFEST_FILE_SHA256,
        PREDECESSOR_LAUNCH_FILE_SHA256,
        PREDECESSOR_TERMINAL_FILE_SHA256,
        PREDECESSOR_PRODUCER_SHA256,
    }:
        raise Profile0034SupportingEdgeError("predecessor bytes drifted")
    manifest = _strict_json(manifest_payload, "predecessor run manifest")
    launch = _strict_json(launch_payload, "predecessor launch")
    terminal = _strict_json(terminal_payload, "predecessor terminal")
    created = manifest.get("created_utc")
    if (
        type(created) is not str
        or manifest != predecessor._expected_run_manifest(created)
        or manifest.get("manifest_sha256") != PREDECESSOR_MANIFEST_SHA256
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or launch.get("schema") != predecessor.LAUNCH_SCHEMA
        or launch.get("run_manifest_sha256") != PREDECESSOR_MANIFEST_SHA256
        or launch.get("launch_sha256") != PREDECESSOR_LAUNCH_SHA256
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
        or launch.get("timeout_ms") != 60_000
        or launch.get("workers") != 4
        or launch.get("queries") != list(predecessor.QUERY_KEYS)
        or terminal.get("schema") != predecessor.TERMINAL_SCHEMA
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
        or terminal.get("run_manifest_sha256") != PREDECESSOR_MANIFEST_SHA256
        or terminal.get("launch_sha256") != PREDECESSOR_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PREDECESSOR_TERMINAL_SHA256
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
        or terminal.get("claims") != predecessor.FALSE_CLAIMS
    ):
        raise Profile0034SupportingEdgeError("predecessor records drifted")

    parent_custody = predecessor.authenticate_predecessor_run()
    systems = {
        "control-positive": predecessor.build_control_system("positive"),
        "control-negative": predecessor.build_control_system("negative"),
        **{
            predecessor._target_key(order_id, branch_id): predecessor._build_target_from_prior(
                parent_custody, order_id, branch_id
            )
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        },
    }
    results: dict[str, dict[str, Any]] = {}
    for key in predecessor.QUERY_KEYS:
        prepared = predecessor._prepare_query_with_prior(
            systems[key], parent_custody, timeout_ms=60_000
        )
        results[key] = predecessor.verify_adapter_tree(
            prepared, PREDECESSOR_ROOT / "artifacts" / key
        )
        record = terminal.get("results", {}).get(key)
        expected_digest = EXPECTED_PREDECESSOR_RESULTS[key]
        if (
            type(record) is not dict
            or record.get("result_sha256") != expected_digest
            or _sha(_read_regular(_predecessor_artifact_path(key, "result.json")))
            != expected_digest
        ):
            raise Profile0034SupportingEdgeError(f"predecessor result drifted: {key}")
    if terminal != predecessor._terminal_record(PREDECESSOR_ROOT, launch, results):
        raise Profile0034SupportingEdgeError("predecessor terminal replay failed")
    return {
        "schema": "p97-profile0034-supporting-edge-predecessor-custody/v1",
        "run_manifest_file_sha256": PREDECESSOR_MANIFEST_FILE_SHA256,
        "run_manifest_sha256": PREDECESSOR_MANIFEST_SHA256,
        "launch_file_sha256": PREDECESSOR_LAUNCH_FILE_SHA256,
        "launch_sha256": PREDECESSOR_LAUNCH_SHA256,
        "terminal_file_sha256": PREDECESSOR_TERMINAL_FILE_SHA256,
        "terminal_sha256": PREDECESSOR_TERMINAL_SHA256,
        "producer_sha256": PREDECESSOR_PRODUCER_SHA256,
        "status": "TARGET_INCONCLUSIVE",
        "parent_custody": parent_custody,
        "orders": {key: list(value) for key, value in EXPECTED_ORDERS.items()},
        "result_sha256s": dict(EXPECTED_PREDECESSOR_RESULTS),
    }


def _target_key(order_id: str, branch_id: str) -> str:
    return f"{order_id}-radius-{branch_id}"


def _signed_area(order_id: str, a: str, b: str, c: str) -> str:
    return predecessor._signed_area(order_id, a, b, c)


def _cyclic_rotation_index(
    original: tuple[str, str, str], directed: tuple[str, str, str]
) -> int:
    rotations = (
        original,
        (original[1], original[2], original[0]),
        (original[2], original[0], original[1]),
    )
    try:
        return rotations.index(directed)
    except ValueError as exc:
        raise Profile0034SupportingEdgeError(
            "supporting orientation is not a cyclic rotation"
        ) from exc


def supporting_edge_constraints(
    order_id: str, order: Sequence[str]
) -> list[dict[str, Any]]:
    """Return the 13 directed edges times their 11 other vertices."""

    if order_id not in ORDER_IDS or tuple(order) != EXPECTED_ORDERS[order_id]:
        raise Profile0034SupportingEdgeError("fixed order drifted")
    rows: list[dict[str, Any]] = []
    for edge_index, left in enumerate(order):
        right = order[(edge_index + 1) % len(order)]
        for vertex in order:
            if vertex in {left, right}:
                continue
            original = tuple(sorted((left, right, vertex), key=order.index))
            directed = (left, right, vertex)
            rows.append(
                {
                    "edge_index": edge_index,
                    "edge": [left, right],
                    "vertex": vertex,
                    "original_triple": list(original),
                    "cyclic_rotation": _cyclic_rotation_index(original, directed),
                    "relation": ">",
                    "expression": _signed_area(order_id, *directed),
                }
            )
    if len(rows) != 143:
        raise Profile0034SupportingEdgeError("supporting-edge inventory drifted")
    return rows


def _build_target_from_prior(
    prior: Mapping[str, Any], order_id: str, branch_id: str
) -> dict[str, Any]:
    if order_id not in ORDER_IDS or branch_id not in BRANCH_IDS:
        raise Profile0034SupportingEdgeError("unknown target cell")
    parent = predecessor._build_target_from_prior(
        prior["parent_custody"], order_id, branch_id
    )
    order = tuple(parent["order"])
    if order != EXPECTED_ORDERS[order_id]:
        raise Profile0034SupportingEdgeError("authenticated order drifted")
    edges = supporting_edge_constraints(order_id, order)
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": _target_key(order_id, branch_id),
        "order_id": order_id,
        "branch_id": branch_id,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "classes": parent["classes"],
        "role_class": parent["role_class"],
        "rows": parent["rows"],
        "order": list(order),
        "ranks": parent["ranks"],
        "variables": list(TARGET_VARIABLES),
        "equilateral_frame": parent["equilateral_frame"],
        "supporting_edge_relaxation": {
            "sound_direction": "original_286_triples_imply_supporting_143_edges",
            "edge_count": 13,
            "other_vertices_per_edge": 11,
            "assertion_count": 143,
            "converse_claimed": False,
        },
        "supporting_edges": edges,
        "source_row_equalities": parent["source_row_equalities"],
        "radius_branch": parent["radius_branch"],
        "source_strict": parent["source_strict"],
        "predecessor_custody_sha256": _sha(_canonical(prior)),
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(order_id: str, branch_id: str) -> dict[str, Any]:
    return _build_target_from_prior(authenticate_predecessor_run(), order_id, branch_id)


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in CONTROL_IDS:
        raise Profile0034SupportingEdgeError("unknown control")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": f"control-{control}",
        "control": control,
        "variables": ["t"],
        "claims": dict(FALSE_CLAIMS),
    }


def _validate_system_current(
    system: object, prior: Mapping[str, Any] | None = None
) -> dict[str, Any]:
    if (
        type(system) is not dict
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034SupportingEdgeError("semantic system is malformed")
    if system.get("kind") == "control":
        expected = build_control_system(system.get("control"))
    elif system.get("kind") == "target":
        expected = _build_target_from_prior(
            prior or authenticate_predecessor_run(),
            system.get("order_id"),
            system.get("branch_id"),
        )
    else:
        raise Profile0034SupportingEdgeError("semantic system kind is invalid")
    if system != expected:
        raise Profile0034SupportingEdgeError("semantic system drifted from producer")
    return dict(system)


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    if system["kind"] == "control":
        assertions = 1 if system["control"] == "positive" else 2
        return {
            "real_declarations": 1,
            "supporting_edge_assertions": 0,
            "row_equality_assertions": 0,
            "radius_assertions": 0,
            "source_assertions": 0,
            "assertions": assertions,
            "commands": 2 + assertions,
        }
    inventory = {
        "real_declarations": len(system["variables"]),
        "supporting_edge_assertions": len(system["supporting_edges"]),
        "row_equality_assertions": len(system["source_row_equalities"]),
        "radius_assertions": 1,
        "source_assertions": 1,
    }
    inventory["assertions"] = sum(
        inventory[key]
        for key in (
            "supporting_edge_assertions",
            "row_equality_assertions",
            "radius_assertions",
            "source_assertions",
        )
    )
    inventory["commands"] = 1 + inventory["real_declarations"] + inventory["assertions"]
    return inventory


def _build_smt_commands_current(current: Mapping[str, Any]) -> tuple[str, ...]:
    out = ["(set-logic QF_NRA)"]
    out.extend(f"(declare-fun {name} () Real)" for name in current["variables"])
    if current["kind"] == "control":
        if current["control"] == "positive":
            out.append("(assert (= t 1))")
        else:
            out.extend(("(assert (= t 0))", "(assert (> t 0))"))
        return tuple(out)
    out.extend(
        f"(assert (> {entry['expression']} 0))"
        for entry in current["supporting_edges"]
    )
    out.extend(
        f"(assert (= {entry['left']} {entry['right']}))"
        for entry in current["source_row_equalities"]
    )
    radius = current["radius_branch"]
    out.append(f"(assert ({radius['relation']} {radius['left']} {radius['right']}))")
    strict = current["source_strict"]
    out.append(f"(assert (< {strict['left']} {strict['right']}))")
    commands = tuple(out)
    if formula_inventory(current) != {
        "real_declarations": 20,
        "supporting_edge_assertions": 143,
        "row_equality_assertions": 11,
        "radius_assertions": 1,
        "source_assertions": 1,
        "assertions": 156,
        "commands": 177,
    } or len(commands) != 177:
        raise Profile0034SupportingEdgeError("target formula inventory drifted")
    return commands


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    return _build_smt_commands_current(_validate_system_current(system))


def _source_record(prior: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": "p97-profile0034-supporting-edge-source-record/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "predecessor_custody": dict(prior),
        "target_matrix": [
            {
                "key": _target_key(order_id, branch_id),
                "order_id": order_id,
                "branch_id": branch_id,
            }
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        ],
        "relaxation": {
            "source": "286 positive sorted-triple orientations",
            "target": "143 positive directed supporting-edge orientations",
            "proved_direction": "source_implies_target_by_cyclic_rotation",
        },
        "sat_replay": {
            "orientations": 286,
            "row_equalities": 13,
            "metrics": ["radius_branch", "source_strict"],
            "unsupported_algebraics": "reject",
        },
        "claims": dict(FALSE_CLAIMS),
    }


def _source_snapshots(prior: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    sources = [
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record(prior))),
        adapter.SourceSnapshot(
            "predecessor-run-manifest.json", _read_regular(PREDECESSOR_MANIFEST_PATH)
        ),
        adapter.SourceSnapshot("predecessor-launch.json", _read_regular(PREDECESSOR_LAUNCH_PATH)),
        adapter.SourceSnapshot(
            "predecessor-terminal.json", _read_regular(PREDECESSOR_TERMINAL_PATH)
        ),
        adapter.SourceSnapshot("implementation-current.py", _read_regular(Path(__file__))),
        adapter.SourceSnapshot(
            "implementation-predecessor.py", _read_regular(PREDECESSOR_PRODUCER_PATH)
        ),
        adapter.SourceSnapshot(
            "implementation-exact-parser.py", _read_regular(Path(bo_source.__file__))
        ),
        adapter.SourceSnapshot("implementation-adapter.py", _read_regular(Path(adapter.__file__))),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
    ]
    for key in predecessor.QUERY_KEYS:
        sources.append(
            adapter.SourceSnapshot(
                f"predecessor-{key}-result.json",
                _read_regular(_predecessor_artifact_path(key, "result.json")),
            )
        )
    return tuple(sorted(sources, key=lambda item: item.path))


def _prepare_query_with_prior(
    system: dict[str, Any], prior: Mapping[str, Any], *, timeout_ms: int
) -> PreparedQuery:
    current = _validate_system_current(system, prior)
    commands = _build_smt_commands_current(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile0034SupportingEdgeError("SMT journal normalization drifted")
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha(_canonical(current)),
        "formula_inventory": formula_inventory(current),
        "journal_sha256": _sha(journal),
        "predecessor_custody_sha256": _sha(_canonical(prior)),
        "claims": dict(FALSE_CLAIMS),
    }
    sources = _source_snapshots(prior)
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in current["variables"]
        ),
        key=lambda item: item["id"],
    )
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {"id": "p97-profile0034-supporting-edge-qfnra", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-profile0034-full-source-replay",
            "version": "v1",
        },
        "stage_id": "profile0034-supporting-edge-qfnra",
        "query_id": current["key"],
        "sources": [
            {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
            for item in sources
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": adapter.SOLVER_PROFILE_SCHEMA,
            "solvers": list(adapter.SOLVERS),
            "timeout_ms": timeout_ms,
        },
    }
    query = adapter.SourceSemanticQuery(
        descriptor, _json(descriptor), journal, commands, journal, sources
    )
    return PreparedQuery(current["key"], current, query)


def prepare_query(system: dict[str, Any], *, timeout_ms: int = 60_000) -> PreparedQuery:
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise Profile0034SupportingEdgeError("query timeout is invalid")
    return _prepare_query_with_prior(
        system, authenticate_predecessor_run(), timeout_ms=timeout_ms
    )


def _area_value(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str, c: str
) -> Fraction:
    return predecessor._area_value(coords, a, b, c)


def _distance_value(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str
) -> Fraction:
    return predecessor._distance_value(coords, a, b)


def check_supporting_edges(
    order: Sequence[str], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    """Replay all 143 strict supporting-edge orientations over rationals."""

    if len(order) != 13 or len(set(order)) != 13 or set(coords) != set(order):
        raise Profile0034SupportingEdgeError("supporting-edge replay is not total")
    values: list[Fraction] = []
    for edge_index, left in enumerate(order):
        right = order[(edge_index + 1) % len(order)]
        for vertex in order:
            if vertex not in {left, right}:
                values.append(_area_value(coords, left, right, vertex))
    if len(values) != 143:
        raise Profile0034SupportingEdgeError("supporting-edge replay count drifted")
    if any(value <= 0 for value in values):
        return {
            "accepted": False,
            "reason": "supporting_edge",
            "constraint_count": 143,
            "min_orientation": str(min(values)),
        }
    return {
        "accepted": True,
        "constraint_count": 143,
        "min_orientation": str(min(values)),
    }


def check_coordinates(
    system: Mapping[str, Any],
    coords: Mapping[str, tuple[Fraction, Fraction]],
) -> dict[str, Any]:
    """Replay SAT against the full original source cell, failing closed."""

    order = tuple(system["order"])
    if set(coords) != set(CLASS_IDS) or any(len(coords[item]) != 2 for item in CLASS_IDS):
        raise Profile0034SupportingEdgeError("coordinate replay is not total")
    frame = predecessor._frame_coordinates(system["order_id"])
    if any(coords[class_id] != fixed for class_id, fixed in frame.items()):
        return {"accepted": False, "reason": "equilateral_frame"}
    support = check_supporting_edges(order, coords)
    if not support["accepted"]:
        return support
    original = [
        _area_value(coords, *triple) for triple in itertools.combinations(order, 3)
    ]
    if len(original) != 286 or any(value <= 0 for value in original):
        return {
            "accepted": False,
            "reason": "original_286_orientations",
            "triple_count": len(original),
            "min_orientation": str(min(original)),
        }
    role = system["role_class"]
    for row in system["rows"]:
        center = role[row["center"]]
        distances = [
            _distance_value(coords, center, role[support_role])
            for support_role in row["support"]
        ]
        if len(set(distances)) != 1:
            return {
                "accepted": False,
                "reason": f"row_{row['id']}",
                "values": [str(value) for value in distances],
            }
    left_radius = _distance_value(coords, role["c2"], role["O"])
    right_radius = _distance_value(coords, role["c2"], role["d"])
    relation = system["radius_branch"]["relation"]
    branch_holds = left_radius < right_radius if relation == "<" else left_radius > right_radius
    if not branch_holds:
        return {
            "accepted": False,
            "reason": "strict_radius_branch",
            "left": str(left_radius),
            "right": str(right_radius),
            "relation": relation,
        }
    left_source = _distance_value(coords, role["e"], role["d"])
    right_source = _distance_value(coords, role["e"], role["a"])
    if not left_source < right_source:
        return {
            "accepted": False,
            "reason": "source_strict",
            "left": str(left_source),
            "right": str(right_source),
        }
    return {
        "accepted": True,
        "supporting_edge_count": 143,
        "original_triple_count": 286,
        "min_original_orientation": str(min(original)),
        "source_row_equality_count": 13,
        "emitted_row_equality_count": 11,
        "radius_relation": relation,
    }


def _parse_coordinates(
    values: str, terms: Sequence[str], order_id: str
) -> dict[str, tuple[Fraction, Fraction]]:
    try:
        parsed = bo_source.parse_exact_values(values, terms)
    except Exception as exc:
        raise Profile0034SupportingEdgeError(str(exc)) from exc
    coords = predecessor._frame_coordinates(order_id)
    for class_id in FREE_CLASS_IDS:
        coords[class_id] = (parsed[f"x_{class_id}"], parsed[f"Y_{class_id}"])
    if set(coords) != set(CLASS_IDS):
        raise Profile0034SupportingEdgeError("coordinate reconstruction is incomplete")
    return coords


def _parse_control_value(values: str) -> dict[str, Fraction]:
    try:
        return bo_source.parse_exact_values(values, ("t",))
    except Exception as exc:
        raise Profile0034SupportingEdgeError(str(exc)) from exc


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    """Require exact rational full-source replay for each SAT response."""

    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise Profile0034SupportingEdgeError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034SupportingEdgeError("semantic input is malformed")
    prior = authenticate_predecessor_run()
    system = _validate_system_current(semantic.get("system"), prior)
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = _prepare_query_with_prior(system, prior, timeout_ms=timeout_ms).query
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.descriptor != expected.descriptor
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
        or semantic.get("system_sha256") != _sha(_canonical(system))
        or semantic.get("formula_inventory") != formula_inventory(system)
        or semantic.get("journal_sha256") != _sha(query.original_smt2)
        or semantic.get("predecessor_custody_sha256") != _sha(_canonical(prior))
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise Profile0034SupportingEdgeError("descriptor, formula, or journal drifted")
    try:
        if system["kind"] == "control":
            parsed = _parse_control_value(values)
            accepted = system["control"] == "positive" and parsed == {"t": Fraction(1)}
            evidence: dict[str, Any] = {
                "accepted": accepted,
                "control": system["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            coords = _parse_coordinates(values, query.get_values, system["order_id"])
            evidence = {
                **check_coordinates(system, coords),
                "exact_coordinate_count": len(coords),
                "free_coordinate_count": len(query.get_values),
            }
    except Profile0034SupportingEdgeError as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode("utf-8")),
            "values_sha256": _sha(values.encode("utf-8")),
            "system_sha256": _sha(_canonical(system)),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def run_query(
    prepared: PreparedQuery,
    output_directory: Path,
    transport: adapter.PiqdTransport,
) -> dict[str, Any]:
    """Run one query through fresh PIQD sessions only."""

    return adapter.run_source_semantic_query(
        prepared.query, output_directory, transport, verify_sat_model
    )


def verify_adapter_tree(prepared: PreparedQuery, output_directory: Path) -> dict[str, Any]:
    """Revalidate immutable PIQD custody and exact SAT replay."""

    if not output_directory.is_dir() or output_directory.is_symlink():
        raise Profile0034SupportingEdgeError("adapter output directory is unsafe")
    result = _strict_json(_read_regular(output_directory / "result.json"), "adapter result")
    if result.get("schema") != adapter.RESULT_SCHEMA or result.get("claims") != adapter.FALSE_CLAIMS:
        raise Profile0034SupportingEdgeError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "manifest",
        "sources",
    }:
        raise Profile0034SupportingEdgeError("adapter custody is malformed")
    descriptor = predecessor._verify_artifact(output_directory, custody["descriptor"], seen)
    original = predecessor._verify_artifact(output_directory, custody["original_smt2"], seen)
    journal = predecessor._verify_artifact(output_directory, custody["journal_smt2"], seen)
    manifest_payload = predecessor._verify_artifact(output_directory, custody["manifest"], seen)
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
        or result.get("source_manifest_sha256") != _sha(manifest_payload)
        or _strict_json(manifest_payload, "source manifest") != adapter._manifest(prepared.query)
    ):
        raise Profile0034SupportingEdgeError("adapter query or source custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise Profile0034SupportingEdgeError("adapter source custody count drifted")
    for record, expected in zip(source_records, prepared.query.source_files, strict=True):
        if predecessor._verify_artifact(output_directory, record, seen) != expected.payload:
            raise Profile0034SupportingEdgeError("adapter source snapshot drifted")
    engines = result.get("engines")
    if type(engines) is not list or [
        row.get("solver") for row in engines if type(row) is dict
    ] != list(adapter.SOLVERS):
        raise Profile0034SupportingEdgeError("adapter engine inventory is malformed")
    for engine in engines:
        if type(engine) is not dict or engine.get("raw_status") not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise Profile0034SupportingEdgeError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise Profile0034SupportingEdgeError("adapter engine artifacts are malformed")
        predecessor._validate_engine_artifact_labels(engine, set(artifacts))
        payloads = {
            label: predecessor._verify_artifact(output_directory, record, seen)
            for label, record in artifacts.items()
        }
        bridge = bo_source.adaptive.PreparedQuery(
            prepared.key, "planar", prepared.system, None, prepared.query
        )
        try:
            custody_solve = bo_source.adaptive._validate_engine_custody(
                bridge, engine, payloads
            )
        except Exception as exc:
            raise Profile0034SupportingEdgeError("adapter engine custody failed") from exc
        solve_label = "reconciled_solve" if engine.get("response_lost") else "solve"
        solve = _strict_json(payloads[solve_label], f"{engine['solver']} solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if (
            solve != custody_solve
            or solve.get("status") != engine["raw_status"]
            or solve.get("result_sha256") != digest
            or engine.get("result_sha256") != digest
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != digest
            or advisory.get("matches_daemon") is not True
        ):
            raise Profile0034SupportingEdgeError("adapter solve digest drifted")
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if effective != "UNSAT_DISCOVERY_ONLY" or engine.get("semantic_replay") is not None:
                raise Profile0034SupportingEdgeError("UNSAT classification drifted")
        elif raw == "UNKNOWN":
            if effective != "INCONCLUSIVE_UNKNOWN" or engine.get("semantic_replay") is not None:
                raise Profile0034SupportingEdgeError("UNKNOWN classification drifted")
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if semantic_payload is None or _strict_json(
                semantic_payload, f"{engine['solver']} semantic"
            ) != semantic:
                raise Profile0034SupportingEdgeError("SAT semantic artifact drifted")
            try:
                verification = verify_sat_model(
                    prepared.query, engine["solver"], solve.get("model"), solve.get("values")
                )
            except Exception as exc:
                expected_semantic = {
                    "accepted": False,
                    "failure": type(exc).__name__,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                }
                if effective != "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE" or semantic != expected_semantic:
                    raise Profile0034SupportingEdgeError("SAT verifier failure drifted") from exc
            else:
                expected_semantic = {
                    "accepted": verification.accepted,
                    "evidence": verification.evidence,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                    "model_sha256": _sha(solve["model"].encode("utf-8")),
                    "values_sha256": _sha(solve["values"].encode("utf-8")),
                }
                expected_effective = (
                    "SAT_SEMANTICALLY_REPLAYED"
                    if verification.accepted
                    else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
                )
                if semantic != expected_semantic or effective != expected_effective:
                    raise Profile0034SupportingEdgeError("SAT semantic replay drifted")
    effective_statuses = [engine.get("effective_status") for engine in engines]
    raw_statuses = [engine.get("raw_status") for engine in engines]
    expected_overall = (
        "INCONCLUSIVE"
        if any(type(status) is str and status.startswith("INCONCLUSIVE") for status in effective_statuses)
        else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        if len(set(raw_statuses)) != 1
        else "FINITE_DIAGNOSTIC_COMPLETE"
    )
    if result.get("overall_status") != expected_overall:
        raise Profile0034SupportingEdgeError("adapter overall status drifted")
    entries = tuple(output_directory.iterdir())
    if (
        any(
            entry.is_symlink()
            or not entry.is_file()
            or entry.stat(follow_symlinks=False).st_nlink != 1
            for entry in entries
        )
        or {entry.name for entry in entries} != seen
    ):
        raise Profile0034SupportingEdgeError("adapter output contains unbound artifacts")
    return dict(result)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile0034SupportingEdgeError("manifest path lies outside repository") from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != "implement_profile0034_supporting_edge"
        or checkpoint.get("base_head") != "30393754d3bf84021134553749a168cade04be95"
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [_repo_path(RUN_ROOT)]
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034SupportingEdgeError("lane checkpoint drifted")
    return checkpoint


def _manifest_sources() -> list[Path]:
    return [Path(__file__), PREDECESSOR_PRODUCER_PATH, Path(adapter.__file__), SPEC_PATH, RUNNER_PATH]


def _manifest_inputs() -> list[Path]:
    paths = [PREDECESSOR_MANIFEST_PATH, PREDECESSOR_LAUNCH_PATH, PREDECESSOR_TERMINAL_PATH]
    paths.extend(_predecessor_artifact_path(key, "result.json") for key in predecessor.QUERY_KEYS)
    return paths


def _git_read(arguments: Sequence[str], where: str) -> bytes:
    try:
        completed = subprocess.run(
            ["git", *arguments],
            cwd=REPOSITORY_ROOT,
            stdin=subprocess.DEVNULL,
            capture_output=True,
            check=False,
        )
    except OSError as exc:
        raise Profile0034SupportingEdgeError(f"Git read failed: {where}") from exc
    if completed.returncode != 0:
        raise Profile0034SupportingEdgeError(f"Git object is missing: {where}")
    return completed.stdout


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    """Bind every execution source to its bytes at the exact current commit."""

    raw_head = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        head = raw_head.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise Profile0034SupportingEdgeError("execution commit is malformed") from exc
    if _FULL_COMMIT.fullmatch(head) is None or raw_head != f"{head}\n".encode("ascii"):
        raise Profile0034SupportingEdgeError("execution commit is malformed")
    source_digests = manifest.get("source_digests")
    expected_paths = sorted(_repo_path(path) for path in _manifest_sources())
    if type(source_digests) is not dict or sorted(source_digests) != expected_paths:
        raise Profile0034SupportingEdgeError("execution source inventory drifted")
    for relative in expected_paths:
        current = _read_regular(REPOSITORY_ROOT / relative)
        digest = source_digests.get(relative)
        if type(digest) is not str or digest != _sha(current):
            raise Profile0034SupportingEdgeError(
                f"current bound source drifted: {relative}"
            )
        committed = _git_read(("show", f"{head}:{relative}"), relative)
        if committed != current:
            raise Profile0034SupportingEdgeError(
                f"execution commit source drifted: {relative}"
            )
    return head


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _repo_path(RUN_ROOT),
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_digest_map(_manifest_sources()),
        "input_digests": _source_digest_map(_manifest_inputs()),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    try:
        descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW, 0o444)
    except FileExistsError as exc:
        raise Profile0034SupportingEdgeError(f"refusing to overwrite: {path}") from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise Profile0034SupportingEdgeError(f"short write: {path}")
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    """Validate the immutable prelaunch manifest and predecessor custody."""

    authenticate_predecessor_run()
    manifest_path = RUN_ROOT / "run_manifest.json"
    manifest = _strict_json(_read_regular(manifest_path), "run manifest")
    created = manifest.get("created_utc")
    if type(created) is not str or manifest != _expected_run_manifest(created):
        raise Profile0034SupportingEdgeError("prelaunch run manifest drifted")
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        path.mkdir(parents=True, exist_ok=True)
        if path.is_symlink() or not path.is_dir():
            raise Profile0034SupportingEdgeError(f"unsafe run directory: {path}")
    return RUN_ROOT, manifest


def _launch_record(
    manifest: Mapping[str, Any],
    execution_commit: str,
    server: str,
    timeout_ms: int,
    workers: int,
) -> dict[str, Any]:
    if _FULL_COMMIT.fullmatch(execution_commit) is None:
        raise Profile0034SupportingEdgeError("launch execution commit is malformed")
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": execution_commit,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "queries": list(QUERY_KEYS),
        "case_matrix": [
            {
                "order_id": order_id,
                "branch_id": branch_id,
                "key": _target_key(order_id, branch_id),
            }
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        ],
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "transport": "PIQD HTTP adapter only; fresh named session per engine and query",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _result_record(root: Path, key: str, result: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "overall_status": result.get("overall_status"),
        "raw_statuses": [engine.get("raw_status") for engine in result.get("engines", [])],
        "effective_statuses": [
            engine.get("effective_status") for engine in result.get("engines", [])
        ],
        "result_sha256": _sha(_read_regular(root / "artifacts" / key / "result.json")),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    if [engine.get("raw_status") for engine in result.get("engines", [])] != [expected, expected]:
        raise Profile0034SupportingEdgeError(f"{key} did not produce {expected}/{expected}")
    if expected == "SAT" and any(
        engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
        for engine in result["engines"]
    ):
        raise Profile0034SupportingEdgeError("positive control failed exact replay")


def _terminal_status(targets: Sequence[Mapping[str, Any]]) -> str:
    engines = [engine for target in targets for engine in target["engines"]]
    if any(engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED" for engine in engines):
        return "TARGET_SAT_REPLAYED"
    if engines and all(engine.get("raw_status") == "UNSAT" for engine in engines):
        return "TARGETS_UNSAT_DISCOVERY_ONLY"
    return "TARGET_INCONCLUSIVE"


def _terminal_record(
    root: Path,
    launch: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": _terminal_status([results[key] for key in TARGET_KEYS]),
        "results": {key: _result_record(root, key, results[key]) for key in QUERY_KEYS},
        "claim_boundary": "four authenticated supporting-edge radius cells only",
        "relaxation": "original 286 orientations imply emitted 143 orientations",
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict_json(_read_regular(path), "terminal")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("status")
        not in {"TARGET_SAT_REPLAYED", "TARGETS_UNSAT_DISCOVERY_ONLY", "TARGET_INCONCLUSIVE"}
        or set(terminal.get("results", {})) != set(QUERY_KEYS)
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034SupportingEdgeError("terminal record is malformed")
    return terminal


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise Profile0034SupportingEdgeError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= MAX_WORKERS:
        raise Profile0034SupportingEdgeError(f"workers must lie in 1..{MAX_WORKERS}")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile0034SupportingEdgeError("timeout must be a finite millisecond value")
    timeout_ms = int(timeout_s * 1000)
    server = _validate_server(server)
    prior = authenticate_predecessor_run()
    root, manifest = ensure_run_root()
    execution_commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, execution_commit, server, timeout_ms, workers)
    launch_path = root / "events" / "launch.json"
    terminal_path = root / "events" / "terminal.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile0034SupportingEdgeError("immutable launch record drifted")
        if not terminal_path.exists():
            raise Profile0034SupportingEdgeError(
                "incomplete launch cannot be resumed; use a fresh run id"
            )
    else:
        if terminal_path.exists():
            raise Profile0034SupportingEdgeError("terminal exists without its launch")
        _create_once(launch_path, _json(launch))
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{
            _target_key(order_id, branch_id): _build_target_from_prior(prior, order_id, branch_id)
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        },
    }
    prepared = {
        key: _prepare_query_with_prior(system, prior, timeout_ms=timeout_ms)
        for key, system in systems.items()
    }
    if terminal_path.exists():
        observed = _read_terminal(terminal_path)
        replayed = {
            key: verify_adapter_tree(prepared[key], root / "artifacts" / key)
            for key in QUERY_KEYS
        }
        if observed != _terminal_record(root, launch, replayed):
            raise Profile0034SupportingEdgeError("terminal does not match artifact replay")
        return observed
    transport = adapter.UrllibPiqdTransport(server)
    results: dict[str, dict[str, Any]] = {}
    for key in ("control-positive", "control-negative"):
        results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
        _require_control(key, results[key])
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {
            key: pool.submit(run_query, prepared[key], root / "artifacts" / key, transport)
            for key in TARGET_KEYS
        }
        for key in TARGET_KEYS:
            results[key] = futures[key].result()
    terminal = _terminal_record(root, launch, results)
    _create_once(terminal_path, _json(terminal))
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run the profile-0034 supporting-edge PIQD discovery wave."
    )
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    arguments = parser.parse_args(argv)
    terminal = run_diagnostic(
        server=arguments.server,
        timeout_s=arguments.timeout_seconds,
        workers=arguments.workers,
    )
    print(json.dumps(terminal, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "BRANCH_IDS",
    "CLASS_IDS",
    "DEFAULT_TIMEOUT_S",
    "DEFAULT_WORKERS",
    "MAX_WORKERS",
    "ORDER_IDS",
    "QUERY_KEYS",
    "TARGET_KEYS",
    "TARGET_VARIABLES",
    "Profile0034SupportingEdgeError",
    "authenticate_predecessor_run",
    "build_control_system",
    "build_smt_commands",
    "build_target_system",
    "check_coordinates",
    "check_supporting_edges",
    "ensure_run_root",
    "formula_inventory",
    "main",
    "prepare_query",
    "run_diagnostic",
    "supporting_edge_constraints",
    "verify_adapter_tree",
    "verify_sat_model",
]
