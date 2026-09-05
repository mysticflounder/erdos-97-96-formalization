"""Governed mirror supporting-edge QF_NRA diagnostic for profile 0034.

The two target orders come from the authenticated completed order-census
parent.  Every quotient class keeps both coordinates: this lane deliberately
does not use profile 282's source-specific algebraic reduction.  Solver calls
are available only through the maintained PIQD SMT adapter.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import math
import os
import stat
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
from census.card_head import exactfive_hard_source_swap_nra_piqd as frozen_nra
from census.card_head import exactfive_hard_source_swap_order_piqd as frozen_order
from census.card_head import (
    exactfive_profile0034_alternate_order_source_qfnra_piqd as parent,
)
from census.card_head import exactfive_profile0034_seven_order_coverage_piqd as coverage
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-new-mirror-supporting-edge-qfnra-piqd-20260904"
RUN_ID = "run-0001"
RUN_OWNER = "profile0034-new-mirror-supporting-edge-qfnra-piqd"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs/specs/p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra-v1.md"
)
RUNNER_PATH = (
    REPOSITORY_ROOT
    / "scripts/run_exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd.py"
)
PARENT_ROOT = (
    REPOSITORY_ROOT
    / "scratch/runs/exactfive-profile0034-alternate-order-source-qfnra-piqd-20260904/run-0001"
)
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_RESULT_PATH = PARENT_ROOT / "artifacts/parent-z3-mirror/result.json"
PARENT_SOURCE_MANIFEST_PATH = (
    PARENT_ROOT / "artifacts/parent-z3-mirror/source-manifest.json"
)
PARENT_PROFILE_KEY = "profile-0034-16765c10e871a525d6e2"
PARENT_PROFILE_ROOT = PARENT_ROOT / "artifacts/parent-z3-mirror"
ORDER_SOLVERS = {"parent-z3-mirror": "z3", "parent-cvc5-direct": "cvc5"}

PROFILE_INDEX = 34
PROFILE_SHA256 = "16765c10e871a525d6e28bb4b02028fb9504766f7cd2bcdf242f29d4fcd575fa"
PARENT_MANIFEST_SHA256 = (
    "46dfcd151204d57e759f6910524bc5a77f1e328aec10c57003f21d062c2600bd"
)
PARENT_LAUNCH_SHA256 = (
    "b37a54792c85a18b8793b5aa4c1d16fab69a32b2b9d9aa34983583bedaba0077"
)
PARENT_TERMINAL_SHA256 = (
    "032098cefa906494ae5d0a392d56f4427237e6d8b5cdb1e8673682b7d35ead3b"
)
PARENT_MANIFEST_FILE_SHA256 = (
    "4b2bba040b5292f1374ca399375d2d058ca896ada0d5da98acddf3f6dedbd937"
)
PARENT_LAUNCH_FILE_SHA256 = (
    "c557daa23fcb41cba8546c16ac8bd9c83eeefe1af5036e6ce4e005c361dd0943"
)
PARENT_TERMINAL_FILE_SHA256 = (
    "6014a857bf9b7a99b7f51eedad233c05db21a627d4d35864a96656d9791effeb"
)

SYSTEM_SCHEMA = "p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra-system/v1"
PRODUCER_VERSION = "p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra-piqd/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra-result/v1"
CONTROL_IDS = ("positive", "negative")
ORDER_IDS = ("mirror",)
BRANCH_IDS = ("lt", "gt")
BRANCH_RELATIONS = {"lt": "<", "gt": ">"}
TARGET_KEYS = tuple(f"mirror-radius-{branch}" for branch in BRANCH_IDS)
QUERY_KEYS = ("control-positive", "control-negative", *TARGET_KEYS)
MAX_WORKERS = 2
DEFAULT_TIMEOUT_S = 60.0
CLASS_IDS = tuple(f"c{index:03d}" for index in range(13))
TARGET_VARIABLES = tuple(
    f"{axis}_{class_id}"
    for class_id in CLASS_IDS
    if class_id not in {"c000", "c001", "c003"}
    for axis in ("x", "Y")
)
EXPECTED_CLASSES = (
    ("U", "c1"),
    ("O",),
    ("c2",),
    ("a",),
    ("d",),
    ("p",),
    ("q", "e"),
    ("s",),
    ("t",),
    ("u",),
    ("v",),
    ("x",),
    ("y",),
)
EXPECTED_ORDER = (
    "c000",
    "c005",
    "c003",
    "c007",
    "c004",
    "c002",
    "c006",
    "c001",
    "c012",
    "c011",
    "c010",
    "c008",
    "c009",
)
EXPECTED_ORDER_SHA256 = (
    "09b58a30d074ec4562c451f30018d831f8f0abfd612febd99e538406684ce9da"
)
EXPECTED_ORDERS = {"mirror": EXPECTED_ORDER}
EXPECTED_PROFILE_SHA256 = PROFILE_SHA256
FALSE_CLAIMS = {
    "live_source_completeness": False,
    "source_realization": False,
    "all_order_elimination": False,
    "lean_ingress": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd.py",
    "docs/specs/p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra-v1.md",
    "scripts/run_exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd.py",
]


class Profile0034NewMirrorSupportingEdgeError(RuntimeError):
    """The profile-0034 diagnostic failed closed."""


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
    unsigned = {key: item for key, item in value.items() if key != field}
    return _sha(_canonical(unsigned))


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"artifact is missing or unreadable: {path}"
        ) from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034NewMirrorSupportingEdgeError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"artifact changed while reading: {path}"
        )
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"{where} is not strict JSON"
        ) from exc
    if type(value) is not dict:
        raise Profile0034NewMirrorSupportingEdgeError(f"{where} is not an object")
    return value


def _source_core(order: Sequence[str]) -> dict[str, Any]:
    index, profile = frozen_order.indexed_profiles()[PROFILE_INDEX]
    if index != PROFILE_INDEX or profile.profile_id != PROFILE_SHA256:
        raise Profile0034NewMirrorSupportingEdgeError("profile identity drifted")
    system = frozen_order.build_profile_system(index, profile)
    classes = tuple(tuple(entry["roles"]) for entry in system["classes"])
    if classes != EXPECTED_CLASSES or set(order) != set(CLASS_IDS):
        raise Profile0034NewMirrorSupportingEdgeError(
            "profile classes or order drifted"
        )
    return {
        **system,
        "order": list(order),
        "ranks": {class_id: rank for rank, class_id in enumerate(order)},
    }


def _parent_order(engine: Mapping[str, Any]) -> tuple[str, ...]:
    semantic = engine.get("semantic_replay")
    evidence = semantic.get("evidence") if type(semantic) is dict else None
    ranks = evidence.get("ranks") if type(evidence) is dict else None
    if type(ranks) is not dict or set(ranks) != set(CLASS_IDS):
        raise Profile0034NewMirrorSupportingEdgeError(
            "parent exact rank replay is malformed"
        )
    if set(ranks.values()) != set(range(13)) or any(
        type(value) is not int for value in ranks.values()
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "parent exact ranks are not a permutation"
        )
    return tuple(sorted(ranks, key=ranks.__getitem__))


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in CONTROL_IDS:
        raise Profile0034NewMirrorSupportingEdgeError("unknown control")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": f"control-{control}",
        "control": control,
        "variables": ["t"],
        "claims": dict(FALSE_CLAIMS),
    }


def _legacy_validate_system_current(
    system: object, prior: Mapping[str, Any] | None = None
) -> dict[str, Any]:
    if (
        type(system) is not dict
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034NewMirrorSupportingEdgeError("semantic system is malformed")
    if system.get("kind") == "control":
        expected = build_control_system(system.get("control"))
    elif system.get("kind") == "target":
        expected = _build_target_from_prior(
            prior or authenticate_source_orders(), system.get("order_id")
        )
    else:
        raise Profile0034NewMirrorSupportingEdgeError("semantic system kind is invalid")
    if system != expected:
        raise Profile0034NewMirrorSupportingEdgeError(
            "semantic system drifted from source formula"
        )
    return dict(system)


def _legacy_formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    if system["kind"] == "control":
        return {
            "coordinate_variable_declarations": 0,
            "control_variable_declarations": 1,
            "gauge_assertions": 0,
            "strict_signed_area_assertions": 0,
            "row_equality_assertions": 0,
            "radius_disequality_assertions": 0,
            "source_strict_assertions": 0,
            "control_assertions": 1 if system["control"] == "positive" else 2,
        }
    return {
        "coordinate_variable_declarations": len(system["variables"]),
        "control_variable_declarations": 0,
        "gauge_assertions": 4,
        "strict_signed_area_assertions": math.comb(len(system["order"]), 3),
        "row_equality_assertions": sum(
            len(row["support"]) - 1 for row in system["rows"]
        ),
        "radius_disequality_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }


def _legacy_build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_system_current(system)
    out = ["(set-logic QF_NRA)"]
    for variable in current["variables"]:
        out.append(f"(declare-fun {variable} () Real)")
    if current["kind"] == "control":
        if current["control"] == "positive":
            out.append("(assert (= t 1))")
        else:
            out.extend(("(assert (= t 0))", "(assert (> t 0))"))
        return tuple(out)
    zero, one = current["order"][:2]
    out.extend(
        (
            f"(assert (= x_{zero} 0))",
            f"(assert (= y_{zero} 0))",
            f"(assert (= x_{one} 1))",
            f"(assert (= y_{one} 0))",
        )
    )
    for a, b, c in itertools.combinations(current["order"], 3):
        area = (
            f"(- (* (- x_{b} x_{a}) (- y_{c} y_{a})) "
            f"(* (- y_{b} y_{a}) (- x_{c} x_{a})))"
        )
        out.append(f"(assert (> {area} 0))")
    role = current["role_class"]
    for row in current["rows"]:
        center = role[row["center"]]
        first = role[row["support"][0]]
        first_distance = frozen_nra._squared_distance_expr(center, first)
        for item in row["support"][1:]:
            other_distance = frozen_nra._squared_distance_expr(center, role[item])
            out.append(f"(assert (= {first_distance} {other_distance}))")
    c2, old, new = role["c2"], role["O"], role["d"]
    old_distance = frozen_nra._squared_distance_expr(c2, old)
    new_distance = frozen_nra._squared_distance_expr(c2, new)
    out.append(f"(assert (not (= {old_distance} {new_distance})))")
    e, d, a = role["e"], role["d"], role["a"]
    left = frozen_nra._squared_distance_expr(e, d)
    right = frozen_nra._squared_distance_expr(e, a)
    out.append(f"(assert (< {left} {right}))")
    return tuple(out)


def _source_record(prior: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": "p97-exactfive-profile0034-new-mirror-supporting-edge-record/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "parent_custody": dict(prior),
        "orders": {
            item["order_id"]: list(item["order"])
            for item in prior["authenticated_orders"]
        },
        "claim_boundary": "two authenticated profile-0034 order formulas only",
        "claims": dict(FALSE_CLAIMS),
    }


def _legacy_source_snapshots(
    prior: Mapping[str, Any],
) -> tuple[adapter.SourceSnapshot, ...]:
    sources = (
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record(prior))),
        adapter.SourceSnapshot(
            "parent-run-manifest.json", _read_regular(PARENT_MANIFEST_PATH)
        ),
        adapter.SourceSnapshot("parent-launch.json", _read_regular(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot(
            "parent-terminal.json", _read_regular(PARENT_TERMINAL_PATH)
        ),
        adapter.SourceSnapshot(
            "parent-profile-result.json", _read_regular(PARENT_RESULT_PATH)
        ),
        adapter.SourceSnapshot(
            "parent-profile-source-manifest.json",
            _read_regular(PARENT_SOURCE_MANIFEST_PATH),
        ),
        adapter.SourceSnapshot(
            "implementation-profile0034.py", _read_regular(Path(__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-bo-source.py", _read_regular(Path(bo_source.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-frozen-nra.py", _read_regular(Path(frozen_nra.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-frozen-order.py", _read_regular(Path(frozen_order.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-coverage-producer.py",
            _read_regular(Path(coverage.__file__)),
        ),
        adapter.SourceSnapshot(
            "implementation-adapter.py", _read_regular(Path(adapter.__file__))
        ),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
    )
    return tuple(sorted(sources, key=lambda item: item.path))


def _legacy_prepare_query(
    system: dict[str, Any], *, timeout_ms: int = 60_000
) -> PreparedQuery:
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise Profile0034NewMirrorSupportingEdgeError("query timeout is invalid")
    prior = authenticate_source_orders()
    current = _validate_system_current(system, prior)
    commands = build_smt_commands(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile0034NewMirrorSupportingEdgeError(
            "SMT journal normalization drifted"
        )
    inventory = formula_inventory(current)
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha(_canonical(current)),
        "formula_inventory": inventory,
        "journal_sha256": _sha(journal),
        "parent_custody_sha256": _sha(_canonical(prior)),
        "claims": dict(FALSE_CLAIMS),
    }
    sources = _source_snapshots(prior)
    variables = [
        {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
        for variable in current["variables"]
    ]
    variables.sort(key=lambda item: item["id"])
    key = (
        f"control-{current['control']}"
        if current["kind"] == "control"
        else current["order_id"]
    )
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {
            "id": "p97-exactfive-profile0034-new-mirror-supporting-edge-qfnra",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "exact-rational-profile0034-source-replay",
            "version": "v1",
        },
        "stage_id": "profile0034-source-qfnra",
        "query_id": key,
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
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
    return PreparedQuery(key, current, query)


def _parse_target_coordinates(
    values: str, terms: Sequence[str]
) -> dict[str, tuple[Fraction, Fraction]]:
    try:
        return frozen_nra.parse_coordinates(values, terms)
    except Exception as exc:
        raise Profile0034NewMirrorSupportingEdgeError(str(exc)) from exc


def _parse_control_value(values: str) -> dict[str, Fraction]:
    try:
        return bo_source.parse_exact_values(values, ("t",))
    except Exception as exc:
        raise Profile0034NewMirrorSupportingEdgeError(str(exc)) from exc


def _legacy_verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if (
        solver not in adapter.SOLVERS
        or type(model) is not str
        or type(values) is not str
    ):
        raise Profile0034NewMirrorSupportingEdgeError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034NewMirrorSupportingEdgeError("semantic input is malformed")
    prior = authenticate_source_orders()
    system = _validate_system_current(semantic.get("system"), prior)
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = prepare_query(system, timeout_ms=timeout_ms).query
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.descriptor != expected.descriptor
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
        or semantic.get("system_sha256") != _sha(_canonical(system))
        or semantic.get("formula_inventory") != formula_inventory(system)
        or semantic.get("journal_sha256") != _sha(query.original_smt2)
        or semantic.get("parent_custody_sha256") != _sha(_canonical(prior))
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "descriptor, source formula, or journal drifted"
        )
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
            coordinates = _parse_target_coordinates(values, query.get_values)
            replay = frozen_nra.check_coordinates(system, coordinates)
            evidence = {
                **replay,
                "accepted": bool(replay.get("accepted")),
                "exact_coordinate_count": len(coordinates),
                "original_source_checker": (
                    "exactfive_hard_source_swap_nra_piqd.check_coordinates"
                ),
            }
    except Profile0034NewMirrorSupportingEdgeError as exc:
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


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter artifact record is malformed"
        )
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter artifact path is unsafe or duplicated"
        )
    payload = _read_regular(root / name)
    if (
        type(record["bytes"]) is not int
        or record["bytes"] != len(payload)
        or type(record["sha256"]) is not str
        or record["sha256"] != _sha(payload)
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            f"adapter artifact digest mismatch: {name}"
        )
    seen.add(name)
    return payload


def verify_adapter_tree(
    prepared: PreparedQuery, output_directory: Path
) -> dict[str, Any]:
    """Revalidate immutable PIQD artifacts and exact source replay."""

    if not output_directory.is_dir() or output_directory.is_symlink():
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter output directory is unsafe"
        )
    result = _strict_json(
        _read_regular(output_directory / "result.json"), "adapter result"
    )
    if (
        result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter result schema or claims drifted"
        )
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "manifest",
        "sources",
    }:
        raise Profile0034NewMirrorSupportingEdgeError("adapter custody is malformed")
    descriptor = _verify_artifact(output_directory, custody["descriptor"], seen)
    original = _verify_artifact(output_directory, custody["original_smt2"], seen)
    journal = _verify_artifact(output_directory, custody["journal_smt2"], seen)
    manifest_payload = _verify_artifact(output_directory, custody["manifest"], seen)
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
        or result.get("source_manifest_sha256") != _sha(manifest_payload)
        or _strict_json(manifest_payload, "source manifest")
        != adapter._manifest(prepared.query)
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter query or manifest custody drifted"
        )
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(
        prepared.query.source_files
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter source custody count drifted"
        )
    for record, expected in zip(
        source_records, prepared.query.source_files, strict=True
    ):
        if _verify_artifact(output_directory, record, seen) != expected.payload:
            raise Profile0034NewMirrorSupportingEdgeError(
                "adapter source snapshot differs"
            )
    engines = result.get("engines")
    if type(engines) is not list or [
        row.get("solver") for row in engines if type(row) is dict
    ] != list(adapter.SOLVERS):
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter engine inventory is malformed"
        )
    for engine in engines:
        if type(engine) is not dict or engine.get("raw_status") not in {
            "SAT",
            "UNSAT",
            "UNKNOWN",
        }:
            raise Profile0034NewMirrorSupportingEdgeError(
                "adapter engine status is malformed"
            )
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise Profile0034NewMirrorSupportingEdgeError(
                "adapter engine artifacts are malformed"
            )
        try:
            frozen_order._validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise Profile0034NewMirrorSupportingEdgeError(
                "adapter artifact labels drifted"
            ) from exc
        payloads = {
            label: _verify_artifact(output_directory, record, seen)
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
            raise Profile0034NewMirrorSupportingEdgeError(
                "adapter engine custody failed"
            ) from exc
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
            raise Profile0034NewMirrorSupportingEdgeError(
                "adapter solve digest is inconsistent"
            )
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if (
                effective != "UNSAT_DISCOVERY_ONLY"
                or engine.get("semantic_replay") is not None
            ):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "UNSAT custody classification drifted"
                )
        elif raw == "UNKNOWN":
            if (
                effective != "INCONCLUSIVE_UNKNOWN"
                or engine.get("semantic_replay") is not None
            ):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "UNKNOWN custody classification drifted"
                )
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if (
                semantic_payload is None
                or _strict_json(semantic_payload, f"{engine['solver']} semantic")
                != semantic
            ):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "SAT semantic artifact drifted"
                )
            try:
                verification = verify_sat_model(
                    prepared.query,
                    engine["solver"],
                    solve.get("model"),
                    solve.get("values"),
                )
            except Exception as exc:
                expected_semantic = {
                    "accepted": False,
                    "failure": type(exc).__name__,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                }
                if (
                    effective != "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"
                    or semantic != expected_semantic
                ):
                    raise Profile0034NewMirrorSupportingEdgeError(
                        "SAT verifier-failure drifted"
                    ) from exc
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
                    raise Profile0034NewMirrorSupportingEdgeError(
                        "SAT semantic replay drifted"
                    )
    effective_statuses = [engine.get("effective_status") for engine in engines]
    raw_statuses = [engine.get("raw_status") for engine in engines]
    expected_overall = (
        "INCONCLUSIVE"
        if any(
            type(status) is str and status.startswith("INCONCLUSIVE")
            for status in effective_statuses
        )
        else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        if len(set(raw_statuses)) != 1
        else "FINITE_DIAGNOSTIC_COMPLETE"
    )
    if result.get("overall_status") != expected_overall:
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter overall status is inconsistent"
        )
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
        raise Profile0034NewMirrorSupportingEdgeError(
            "adapter output contains unbound artifacts"
        )
    return dict(result)


def run_query(
    prepared: PreparedQuery,
    output_directory: Path,
    transport: adapter.PiqdTransport,
) -> dict[str, Any]:
    if output_directory.exists():
        return verify_adapter_tree(prepared, output_directory)
    parent = output_directory.parent
    parent.mkdir(parents=True, exist_ok=True)
    if parent.is_symlink() or not parent.is_dir():
        raise Profile0034NewMirrorSupportingEdgeError(
            "artifact parent directory is unsafe"
        )
    adapter.run_source_semantic_query(
        prepared.query, output_directory, transport, verify_sat_model
    )
    return verify_adapter_tree(prepared, output_directory)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            "manifest source lies outside repository"
        ) from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != RUN_OWNER
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034NewMirrorSupportingEdgeError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = [
        Path(__file__),
        SPEC_PATH,
        RUNNER_PATH,
        Path(parent.__file__),
        Path(bo_source.__file__),
        Path(frozen_nra.__file__),
        Path(frozen_order.__file__),
        Path(coverage.__file__),
        Path(adapter.__file__),
    ]
    inputs = [
        PARENT_MANIFEST_PATH,
        PARENT_LAUNCH_PATH,
        PARENT_TERMINAL_PATH,
        *[
            PARENT_ROOT / "artifacts" / key / name
            for key in (
                "control-positive",
                "control-negative",
                "parent-z3-mirror",
                "parent-cvc5-direct",
            )
            for name in ("result.json", "source-manifest.json")
        ],
    ]
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_digest_map(source_paths),
        "input_digests": _source_digest_map(inputs),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    try:
        fd = os.open(path, flags, 0o600)
    except FileExistsError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"immutable artifact already exists: {path}"
        ) from exc
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
    except BaseException:
        path.unlink(missing_ok=True)
        raise


def _check_registered_ancestors(root: Path) -> None:
    """Reject symlinked or non-directory components before any mkdir call."""
    try:
        relative = root.absolute().relative_to(REPOSITORY_ROOT.absolute())
    except ValueError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            "run root lies outside repository"
        ) from exc
    current = REPOSITORY_ROOT
    for component in relative.parts:
        current /= component
        try:
            info = current.lstat()
        except FileNotFoundError:
            break
        except OSError as exc:
            raise Profile0034NewMirrorSupportingEdgeError(
                f"cannot inspect run-root ancestor: {current}"
            ) from exc
        if stat.S_ISLNK(info.st_mode) or not stat.S_ISDIR(info.st_mode):
            raise Profile0034NewMirrorSupportingEdgeError(
                f"run-root ancestor is unsafe: {current}"
            )


def _ensure_directory(path: Path, label: str) -> None:
    try:
        path.mkdir(exist_ok=True)
    except OSError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"{label} is unsafe: {path}"
        ) from exc
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"{label} is unreadable: {path}"
        ) from exc
    if stat.S_ISLNK(info.st_mode) or not stat.S_ISDIR(info.st_mode):
        raise Profile0034NewMirrorSupportingEdgeError(f"{label} is unsafe: {path}")


def _validate_existing_run_root() -> tuple[Path, dict[str, Any]]:
    """Validate an existing run tree without creating or mutating anything."""
    _check_registered_ancestors(RUN_ROOT)
    try:
        info = RUN_ROOT.lstat()
    except OSError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            "run root is absent or unreadable"
        ) from exc
    if stat.S_ISLNK(info.st_mode) or not stat.S_ISDIR(info.st_mode):
        raise Profile0034NewMirrorSupportingEdgeError("run root is absent or unsafe")
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name
        try:
            child_info = child.lstat()
        except OSError as exc:
            raise Profile0034NewMirrorSupportingEdgeError(
                f"run-root child is absent: {child}"
            ) from exc
        if stat.S_ISLNK(child_info.st_mode) or not stat.S_ISDIR(child_info.st_mode):
            raise Profile0034NewMirrorSupportingEdgeError(
                f"run-root child is unsafe: {child}"
            )
    manifest_path = RUN_ROOT / "run_manifest.json"
    observed = _strict_json(_read_regular(manifest_path), "run manifest")
    created = observed.get("created_utc")
    if type(created) is not str or observed != _expected_run_manifest(created):
        raise Profile0034NewMirrorSupportingEdgeError(
            "run manifest or source digest drifted"
        )
    return RUN_ROOT, observed


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _check_registered_ancestors(RUN_ROOT)
    try:
        RUN_ROOT.mkdir(parents=True, exist_ok=True)
    except OSError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"run root is unsafe: {RUN_ROOT}"
        ) from exc
    _ensure_directory(RUN_ROOT, "run root")
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        _ensure_directory(path, "run-root child")
    manifest_path = RUN_ROOT / "run_manifest.json"
    try:
        manifest_info = manifest_path.lstat()
    except FileNotFoundError:
        manifest_info = None
    except OSError as exc:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"run manifest is unreadable: {manifest_path}"
        ) from exc
    if manifest_info is not None:
        if stat.S_ISLNK(manifest_info.st_mode) or not stat.S_ISREG(
            manifest_info.st_mode
        ):
            raise Profile0034NewMirrorSupportingEdgeError(
                f"run manifest is unsafe: {manifest_path}"
            )
        _, observed = _validate_existing_run_root()
    else:
        observed = _expected_run_manifest(_utc_now())
        _create_once(manifest_path, _json(observed))
    return RUN_ROOT, observed


def _launch_record(
    manifest: Mapping[str, Any], server: str, timeout_ms: int, workers: int
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "queries": list(QUERY_KEYS),
        "case_matrix": [
            {
                "order_id": "mirror",
                "branch_id": branch,
                "key": _target_key("mirror", branch),
            }
            for branch in BRANCH_IDS
        ],
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "transport": "PIQD HTTP adapter only",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _result_record(root: Path, key: str, result: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "overall_status": result.get("overall_status"),
        "raw_statuses": [
            engine.get("raw_status") for engine in result.get("engines", [])
        ],
        "effective_statuses": [
            engine.get("effective_status") for engine in result.get("engines", [])
        ],
        "result_sha256": _sha(_read_regular(root / "artifacts" / key / "result.json")),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    raw = [engine.get("raw_status") for engine in result.get("engines", [])]
    if raw != [expected, expected]:
        raise Profile0034NewMirrorSupportingEdgeError(
            f"{key} did not produce {expected}/{expected}"
        )
    if expected == "SAT" and any(
        engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
        for engine in result["engines"]
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "positive control failed exact replay"
        )


def _terminal_status(targets: Sequence[Mapping[str, Any]]) -> str:
    engines = [engine for target in targets for engine in target["engines"]]
    if any(
        engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED"
        for engine in engines
    ):
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
        "claim_boundary": "two authenticated profile-0034 source-order formulas only",
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
        not in {
            "TARGET_SAT_REPLAYED",
            "TARGETS_UNSAT_DISCOVERY_ONLY",
            "TARGET_INCONCLUSIVE",
        }
        or set(terminal.get("results", {})) != set(QUERY_KEYS)
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034NewMirrorSupportingEdgeError("terminal record is malformed")
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
        raise Profile0034NewMirrorSupportingEdgeError("invalid PIQD server URL")
    return server.rstrip("/")


def _legacy_run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = 2,
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= 2:
        raise Profile0034NewMirrorSupportingEdgeError("workers must lie in 1..2")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "timeout must be exact milliseconds in (0,3600]"
        )
    server = _validate_server(server)
    timeout_ms = int(timeout_s * 1000)
    root, manifest = ensure_run_root()
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events/launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile0034NewMirrorSupportingEdgeError(
                "launch record differs on resume"
            )
    else:
        _create_once(launch_path, _json(launch))
    terminal_path = root / "events/terminal.json"
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{order_id: build_target_system(order_id) for order_id in ORDER_IDS},
    }
    prepared = {
        key: prepare_query(system, timeout_ms=timeout_ms)
        for key, system in systems.items()
    }
    if terminal_path.exists():
        stored = _read_terminal(terminal_path)
        results = {
            key: verify_adapter_tree(prepared[key], root / "artifacts" / key)
            for key in QUERY_KEYS
        }
        for key in ("control-positive", "control-negative"):
            _require_control(key, results[key])
        expected = _terminal_record(root, launch, results)
        if stored != expected:
            raise Profile0034NewMirrorSupportingEdgeError(
                "terminal differs from artifact replay"
            )
        return stored
    transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_s + 40)
    results: dict[str, dict[str, Any]] = {}
    for key in ("control-positive", "control-negative"):
        results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
        _require_control(key, results[key])

    def execute(key: str) -> tuple[str, dict[str, Any]]:
        result = run_query(prepared[key], root / "artifacts" / key, transport)
        return key, result

    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        for key, result in pool.map(execute, ORDER_IDS):
            results[key] = result
    terminal = _terminal_record(root, launch, results)
    _create_once(terminal_path, _json(terminal))
    return terminal


def _legacy_verify_run() -> dict[str, Any]:
    """Replay the immutable local run without constructing PIQD transport."""
    root, manifest = _validate_existing_run_root()
    launch_path = root / "events/launch.json"
    terminal_path = root / "events/terminal.json"
    launch = _strict_json(_read_regular(launch_path), "launch")
    if any(field not in launch for field in ("server", "timeout_ms", "workers")):
        raise Profile0034NewMirrorSupportingEdgeError(
            "launch record is missing required fields"
        )
    terminal = _read_terminal(terminal_path)
    if launch != _launch_record(
        manifest, launch["server"], launch["timeout_ms"], launch["workers"]
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "launch differs from the immutable manifest"
        )
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{order_id: build_target_system(order_id) for order_id in ORDER_IDS},
    }
    prepared = {
        key: prepare_query(system, timeout_ms=launch["timeout_ms"])
        for key, system in systems.items()
    }
    results = {
        key: verify_adapter_tree(prepared[key], root / "artifacts" / key)
        for key in QUERY_KEYS
    }
    _require_control("control-positive", results["control-positive"])
    _require_control("control-negative", results["control-negative"])
    expected = _terminal_record(root, launch, results)
    if terminal != expected:
        raise Profile0034NewMirrorSupportingEdgeError(
            "terminal differs from immutable artifact replay"
        )
    return terminal


def _frame_coordinates(order_id: str) -> dict[str, tuple[Fraction, Fraction]]:
    if order_id != "mirror":
        raise Profile0034NewMirrorSupportingEdgeError("unknown fixed order")
    return {
        "c000": (Fraction(0), Fraction(0)),
        "c001": (Fraction(1), Fraction(0)),
        "c003": (Fraction(1, 2), Fraction(-1, 2)),
    }


def _coordinate(order_id: str, class_id: str, axis: Literal["x", "Y"]) -> str:
    fixed = {
        "c000": ("0", "0"),
        "c001": ("1", "0"),
        "c003": ("(/ 1 2)", "(- (/ 1 2))"),
    }.get(class_id)
    if fixed is not None:
        return fixed[0 if axis == "x" else 1]
    if class_id not in CLASS_IDS or class_id in {"c000", "c001", "c003"}:
        raise Profile0034NewMirrorSupportingEdgeError("unknown coordinate class")
    return f"{axis}_{class_id}"


def _delta(order_id: str, left: str, right: str, axis: Literal["x", "Y"]) -> str:
    return (
        f"(- {_coordinate(order_id, left, axis)} {_coordinate(order_id, right, axis)})"
    )


def _squared_distance(order_id: str, left: str, right: str) -> str:
    dx, dY = _delta(order_id, left, right, "x"), _delta(order_id, left, right, "Y")
    return f"(+ (* {dx} {dx}) (* 3 {dY} {dY}))"


def _signed_area(order_id: str, a: str, b: str, c: str) -> str:
    bax, baY = _delta(order_id, b, a, "x"), _delta(order_id, b, a, "Y")
    cax, caY = _delta(order_id, c, a, "x"), _delta(order_id, c, a, "Y")
    return f"(- (* {bax} {caY}) (* {baY} {cax}))"


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
        raise Profile0034NewMirrorSupportingEdgeError(
            "supporting orientation is not a cyclic rotation"
        ) from exc


def _target_key(order_id: str, branch_id: str) -> str:
    if order_id != "mirror" or branch_id not in BRANCH_IDS:
        raise Profile0034NewMirrorSupportingEdgeError("unknown target cell")
    return f"mirror-radius-{branch_id}"


def supporting_edge_constraints(
    order_or_id: Sequence[str] | str, order_value: Sequence[str] | None = None
) -> list[dict[str, Any]]:
    order = order_value if order_value is not None else order_or_id
    if isinstance(order, str):
        raise Profile0034NewMirrorSupportingEdgeError("supporting order is missing")
    if tuple(order) != tuple(EXPECTED_ORDER):
        raise Profile0034NewMirrorSupportingEdgeError(
            "authenticated mirror order drifted"
        )
    rows = []
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
                    "expression": _signed_area("mirror", *directed),
                }
            )
    if len(rows) != 143:
        raise Profile0034NewMirrorSupportingEdgeError(
            "supporting-edge inventory drifted"
        )
    return rows


def _row_equalities(source: Mapping[str, Any]) -> list[dict[str, Any]]:
    role = source["role_class"]
    out = []
    for row in source["rows"]:
        for other_role in row["support"][1:]:
            if (row["id"], other_role) in {("T0", "c1"), ("K1", "a")}:
                continue
            out.append(
                {
                    "row_id": row["id"],
                    "center_role": row["center"],
                    "first_support_role": row["support"][0],
                    "other_support_role": other_role,
                    "left": _squared_distance(
                        "mirror", role[row["center"]], role[row["support"][0]]
                    ),
                    "right": _squared_distance(
                        "mirror", role[row["center"]], role[other_role]
                    ),
                }
            )
    if len(out) != 11:
        raise Profile0034NewMirrorSupportingEdgeError(
            "source row equality inventory drifted"
        )
    return out


def authenticate_source_orders() -> dict[str, Any]:
    """Authenticate the alternate-order run and derive the mirror order from ranks."""
    manifest_payload = _read_regular(PARENT_ROOT / "run_manifest.json")
    launch_payload = _read_regular(PARENT_ROOT / "events/launch.json")
    terminal_payload = _read_regular(PARENT_ROOT / "events/terminal.json")
    if (_sha(manifest_payload), _sha(launch_payload), _sha(terminal_payload)) != (
        PARENT_MANIFEST_FILE_SHA256,
        PARENT_LAUNCH_FILE_SHA256,
        PARENT_TERMINAL_FILE_SHA256,
    ):
        raise Profile0034NewMirrorSupportingEdgeError("parent bytes drifted")
    manifest, launch, terminal = (
        _strict_json(manifest_payload, "parent run manifest"),
        _strict_json(launch_payload, "parent launch"),
        _strict_json(terminal_payload, "parent terminal"),
    )
    if (
        manifest.get("schema") != parent.RUN_MANIFEST_SCHEMA
        or manifest.get("lane_id") != parent.LANE_ID
        or manifest.get("run_id") != parent.RUN_ID
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or launch.get("schema") != parent.LAUNCH_SCHEMA
        or launch.get("lane_id") != parent.LANE_ID
        or launch.get("run_id") != parent.RUN_ID
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
        or terminal.get("schema") != parent.TERMINAL_SCHEMA
        or terminal.get("lane_id") != parent.LANE_ID
        or terminal.get("run_id") != parent.RUN_ID
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
        or terminal.get("claims") != parent.FALSE_CLAIMS
        or launch.get("timeout_ms") != 60000
        or launch.get("workers") != 2
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
    ):
        raise Profile0034NewMirrorSupportingEdgeError("parent records drifted")
    expected_results = {
        "control-positive": "73c00e58ea8753bbca9003e3c87bc2dd7f542f1911793467ef95baaf51b3ced7",
        "control-negative": "fca7c0b8cb9c616dd79230e4af5559aec063be4aaea1fe561749c6fdf3b88fa9",
        "parent-z3-mirror": "0db3c932e361daf67c9ba70b9c5c5ea565cc307fc7901f2aba3058758e502875",
        "parent-cvc5-direct": "b274ee7274eea49220cd814450c50246eb07e9f0c66413899d646a2685d80f69",
    }
    systems = {
        "control-positive": parent.build_control_system("positive"),
        "control-negative": parent.build_control_system("negative"),
        "parent-z3-mirror": parent.build_target_system("parent-z3-mirror"),
        "parent-cvc5-direct": parent.build_target_system("parent-cvc5-direct"),
    }
    orders = {}
    for key in parent.QUERY_KEYS:
        payload = _read_regular(PARENT_ROOT / "artifacts" / key / "result.json")
        if (
            _sha(payload) != expected_results[key]
            or terminal.get("results", {}).get(key, {}).get("result_sha256")
            != expected_results[key]
        ):
            raise Profile0034NewMirrorSupportingEdgeError(
                f"parent result drifted: {key}"
            )
        if key.startswith("parent-"):
            result = _strict_json(payload, f"parent {key} result")
            engines = result.get("engines")
            if not isinstance(engines, list) or len(engines) != 2:
                raise Profile0034NewMirrorSupportingEdgeError(
                    "parent engine inventory drifted"
                )
            descriptor = _strict_json(
                _read_regular(PARENT_ROOT / "artifacts" / key / "descriptor.json"),
                f"parent {key} descriptor",
            )
            semantic_system = descriptor.get("semantic_input", {}).get("system")
            if not isinstance(semantic_system, dict):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "parent semantic input is malformed"
                )
            if (
                semantic_system.get("profile_index") != PROFILE_INDEX
                or semantic_system.get("profile_sha256") != PROFILE_SHA256
            ):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "parent profile identity drifted"
                )
            ranks = semantic_system.get("ranks")
            if (
                not isinstance(ranks, dict)
                or set(ranks) != set(CLASS_IDS)
                or set(ranks.values()) != set(range(13))
                or any(type(v) is not int for v in ranks.values())
            ):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "parent exact rank replay is malformed"
                )
            orders[key] = sorted(ranks, key=ranks.__getitem__)
            if semantic_system.get("authenticated_order_sha256") != _sha(
                _canonical(orders[key])
            ):
                raise Profile0034NewMirrorSupportingEdgeError(
                    "parent order hash drifted"
                )
        prepared = parent.prepare_query(systems[key], timeout_ms=60000)
        try:
            parent.verify_adapter_tree(prepared, PARENT_ROOT / "artifacts" / key)
        except Exception as exc:
            raise Profile0034NewMirrorSupportingEdgeError(
                f"parent artifact replay failed: {key}"
            ) from exc
    order = tuple(orders["parent-z3-mirror"])
    if (
        _sha(_canonical(list(order))) != EXPECTED_ORDER_SHA256
        or order != EXPECTED_ORDER
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "mirror order hash or ranks drifted"
        )
    return {
        "schema": "p97-profile0034-new-mirror-parent-custody/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "parent_manifest_sha256": PARENT_MANIFEST_SHA256,
        "parent_launch_sha256": PARENT_LAUNCH_SHA256,
        "parent_terminal_sha256": PARENT_TERMINAL_SHA256,
        "orders": {"mirror": list(order)},
        "order_sha256": EXPECTED_ORDER_SHA256,
        "result_sha256s": expected_results,
    }


def _build_target_from_prior(
    prior: Mapping[str, Any], order_id: str, branch_id: str | None = None
) -> dict[str, Any]:
    if branch_id is None:
        branch_id = order_id
        order_id = "mirror"
    if order_id != "mirror":
        raise Profile0034NewMirrorSupportingEdgeError("unknown target order")
    if branch_id not in BRANCH_IDS:
        raise Profile0034NewMirrorSupportingEdgeError("unknown radius branch")
    order = tuple(prior["orders"]["mirror"])
    if (
        prior.get("order_sha256") != _sha(_canonical(list(order)))
        or prior.get("order_sha256") != EXPECTED_ORDER_SHA256
    ):
        raise Profile0034NewMirrorSupportingEdgeError("mirror order hash drifted")
    source = _source_core(order)
    role = source["role_class"]
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": f"mirror-radius-{branch_id}",
        "order_id": "mirror",
        "branch_id": branch_id,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "classes": source["classes"],
        "role_class": role,
        "rows": source["rows"],
        "order": list(order),
        "ranks": source["ranks"],
        "variables": list(TARGET_VARIABLES),
        "equilateral_frame": {
            "fixed_classes": ["c000", "c001", "c003"],
            "vertical_coordinate": "Y",
            "weighted_distance_vertical_coefficient": 3,
            "substitution": {
                "c000": ["0", "0"],
                "c001": ["1", "0"],
                "c003": ["1/2", "-1/2"],
            },
        },
        "supporting_edge_relaxation": {
            "sound_direction": "original_286_triples_imply_supporting_143_edges",
            "assertion_count": 143,
            "converse_claimed": False,
        },
        "supporting_edges": supporting_edge_constraints(order),
        "source_row_equalities": _row_equalities(source),
        "radius_branch": {
            "left": _squared_distance("mirror", role["c2"], role["O"]),
            "right": _squared_distance("mirror", role["c2"], role["d"]),
            "relation": BRANCH_RELATIONS[branch_id],
        },
        "source_strict": {
            "left": _squared_distance("mirror", role["e"], role["d"]),
            "right": _squared_distance("mirror", role["e"], role["a"]),
            "relation": "<",
        },
        "authenticated_order_sha256": prior["order_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(order_id: str, branch_id: str) -> dict[str, Any]:
    if order_id != "mirror":
        raise Profile0034NewMirrorSupportingEdgeError("unknown target order")
    return _build_target_from_prior(authenticate_source_orders(), order_id, branch_id)


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
    inv = {
        "real_declarations": len(system["variables"]),
        "supporting_edge_assertions": len(system["supporting_edges"]),
        "row_equality_assertions": len(system["source_row_equalities"]),
        "radius_assertions": 1,
        "source_assertions": 1,
    }
    inv["assertions"] = sum(
        inv[k]
        for k in (
            "supporting_edge_assertions",
            "row_equality_assertions",
            "radius_assertions",
            "source_assertions",
        )
    )
    inv["commands"] = 1 + inv["real_declarations"] + inv["assertions"]
    return inv


def _validate_system_current(
    system: object, prior: Mapping[str, Any] | None = None
) -> dict[str, Any]:
    if (
        not isinstance(system, dict)
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034NewMirrorSupportingEdgeError("semantic system is malformed")
    expected = (
        build_control_system(system.get("control"))
        if system.get("kind") == "control"
        else _build_target_from_prior(
            prior or authenticate_source_orders(),
            system.get("order_id"),
            system.get("branch_id"),
        )
    )
    if system != expected:
        raise Profile0034NewMirrorSupportingEdgeError(
            "semantic system drifted from producer"
        )
    return dict(system)


def _build_smt_commands_current(current: Mapping[str, Any]) -> tuple[str, ...]:
    out = ["(set-logic QF_NRA)"] + [
        f"(declare-fun {v} () Real)" for v in current["variables"]
    ]
    if current["kind"] == "control":
        out.append(
            "(assert (= t 1))"
            if current["control"] == "positive"
            else "(assert (= t 0))"
        )
        if current["control"] == "negative":
            out.append("(assert (> t 0))")
        return tuple(out)
    out += [f"(assert (> {e['expression']} 0))" for e in current["supporting_edges"]]
    out += [
        f"(assert (= {e['left']} {e['right']}))"
        for e in current["source_row_equalities"]
    ]
    r, s = current["radius_branch"], current["source_strict"]
    out += [
        f"(assert ({r['relation']} {r['left']} {r['right']}))",
        f"(assert (< {s['left']} {s['right']}))",
    ]
    if formula_inventory(current) != {
        "real_declarations": 20,
        "supporting_edge_assertions": 143,
        "row_equality_assertions": 11,
        "radius_assertions": 1,
        "source_assertions": 1,
        "assertions": 156,
        "commands": 177,
    }:
        raise Profile0034NewMirrorSupportingEdgeError(
            "target formula inventory drifted"
        )
    return tuple(out)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    return _build_smt_commands_current(_validate_system_current(system))


def _area_value(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str, c: str
) -> Fraction:
    ax, ay = coords[a]
    bx, by = coords[b]
    cx, cy = coords[c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def _distance_value(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str
) -> Fraction:
    ax, ay = coords[a]
    bx, by = coords[b]
    return (ax - bx) ** 2 + 3 * (ay - by) ** 2


def check_supporting_edges(
    order: Sequence[str], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    values = [
        _area_value(coords, left, right, vertex)
        for i, left in enumerate(order)
        for right in (order[(i + 1) % len(order)],)
        for vertex in order
        if vertex not in {left, right}
    ]
    if len(values) != 143 or any(v <= 0 for v in values):
        return {
            "accepted": False,
            "reason": "supporting_edge",
            "constraint_count": len(values),
            "min_orientation": str(min(values)) if values else "0",
        }
    return {
        "accepted": True,
        "constraint_count": 143,
        "min_orientation": str(min(values)),
    }


def check_coordinates(
    system: Mapping[str, Any], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    if set(coords) != set(CLASS_IDS):
        raise Profile0034NewMirrorSupportingEdgeError("coordinate replay is not total")
    if any(coords[k] != v for k, v in _frame_coordinates("mirror").items()):
        return {"accepted": False, "reason": "equilateral_frame"}
    areas = [
        _area_value(coords, *triple)
        for triple in itertools.combinations(system["order"], 3)
    ]
    if len(areas) != 286 or any(v <= 0 for v in areas):
        return {"accepted": False, "reason": "original_286_orientations"}
    role = system["role_class"]
    for row in system["rows"]:
        vals = [
            _distance_value(coords, role[row["center"]], role[s])
            for s in row["support"]
        ]
        if len(set(vals)) != 1:
            return {"accepted": False, "reason": f"row_{row['id']}"}
    left = _distance_value(coords, role["c2"], role["O"])
    right = _distance_value(coords, role["c2"], role["d"])
    if not (left < right if system["branch_id"] == "lt" else left > right):
        return {"accepted": False, "reason": "strict_radius_branch"}
    if not _distance_value(coords, role["e"], role["d"]) < _distance_value(
        coords, role["e"], role["a"]
    ):
        return {"accepted": False, "reason": "source_strict"}
    return {
        "accepted": True,
        "triple_count": 286,
        "source_row_equality_count": 13,
        "emitted_row_equality_count": 11,
        "radius_relation": system["radius_branch"]["relation"],
    }


def _parse_coordinates(
    values: str, terms: Sequence[str]
) -> dict[str, tuple[Fraction, Fraction]]:
    parsed = bo_source.parse_exact_values(values, terms)
    coords = _frame_coordinates("mirror")
    for c in CLASS_IDS:
        if c not in {"c000", "c001", "c003"}:
            coords[c] = (parsed[f"x_{c}"], parsed[f"Y_{c}"])
    return coords


def verify_sat_model(
    query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None
) -> adapter.SemanticVerification:
    if (
        solver not in adapter.SOLVERS
        or not isinstance(model, str)
        or not isinstance(values, str)
    ):
        raise Profile0034NewMirrorSupportingEdgeError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if not isinstance(semantic, dict) or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034NewMirrorSupportingEdgeError("semantic input is malformed")
    prior = authenticate_source_orders()
    system = _validate_system_current(semantic.get("system"), prior)
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = prepare_query(system, timeout_ms=timeout_ms).query
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
        raise Profile0034NewMirrorSupportingEdgeError("descriptor or formula drifted")
    try:
        if system["kind"] == "control":
            parsed = _parse_control_value(values)
            accepted = system["control"] == "positive" and parsed == {"t": Fraction(1)}
            evidence = {
                "accepted": accepted,
                "control": system["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            coords = _parse_coordinates(values, query.get_values)
            evidence = {
                **check_coordinates(system, coords),
                "exact_coordinate_count": len(coords),
                "free_coordinate_count": len(query.get_values),
            }
    except (
        Profile0034NewMirrorSupportingEdgeError,
        ValueError,
        KeyError,
        TypeError,
    ) as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
            "system_sha256": _sha(_canonical(system)),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _source_snapshots(prior: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    paths = [
        ("parent-run-manifest.json", PARENT_ROOT / "run_manifest.json"),
        ("parent-launch.json", PARENT_ROOT / "events/launch.json"),
        ("parent-terminal.json", PARENT_ROOT / "events/terminal.json"),
        ("implementation-parent.py", Path(parent.__file__)),
        ("implementation-current.py", Path(__file__)),
        ("implementation-exact-parser.py", Path(bo_source.__file__)),
        ("implementation-order-replay.py", Path(frozen_order.__file__)),
        ("implementation-coverage.py", Path(coverage.__file__)),
        ("implementation-adapter.py", Path(adapter.__file__)),
        ("specification.md", SPEC_PATH),
    ]
    for key in (
        "control-positive",
        "control-negative",
        "parent-z3-mirror",
        "parent-cvc5-direct",
    ):
        paths.append(
            (
                f"parent-{key}-result.json",
                PARENT_ROOT / "artifacts" / key / "result.json",
            )
        )
        paths.append(
            (
                f"parent-{key}-source-manifest.json",
                PARENT_ROOT / "artifacts" / key / "source-manifest.json",
            )
        )
    return tuple(
        adapter.SourceSnapshot(name, _read_regular(path))
        for name, path in sorted(paths)
    )


def prepare_query(system: dict[str, Any], *, timeout_ms: int = 60000) -> PreparedQuery:
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3600000
    ):
        raise Profile0034NewMirrorSupportingEdgeError("query timeout is invalid")
    prior = authenticate_source_orders()
    current = _validate_system_current(system, prior)
    commands = _build_smt_commands_current(current)
    journal = b"".join(c.encode() + b"\n" for c in commands)
    sources = _source_snapshots(prior)
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
    variables = sorted(
        (
            {"id": v.replace("_", "-"), "term": v, "sort": "Real"}
            for v in current["variables"]
        ),
        key=lambda x: x["id"],
    )
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {
            "id": "p97-profile0034-new-mirror-supporting-edge-qfnra",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "exact-rational-profile0034-full-source-replay",
            "version": "v1",
        },
        "stage_id": "profile0034-new-mirror-supporting-edge-qfnra",
        "query_id": current["key"]
        if current["kind"] == "target"
        else f"control-{current['control']}",
        "sources": [
            {"path": s.path, "bytes": len(s.payload), "sha256": _sha(s.payload)}
            for s in sources
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
            "readback_variable_ids": [v["id"] for v in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": adapter.SOLVER_PROFILE_SCHEMA,
            "solvers": list(adapter.SOLVERS),
            "timeout_ms": timeout_ms,
        },
    }
    return PreparedQuery(
        descriptor["query_id"],
        current,
        adapter.SourceSemanticQuery(
            descriptor, _json(descriptor), journal, commands, journal, sources
        ),
    )


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--verbose", action="store_true")
    parser.add_argument("--check-parent", action="store_true")
    parser.add_argument("--verify", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.check_parent and args.verify:
            raise Profile0034NewMirrorSupportingEdgeError(
                "--check-parent and --verify are mutually exclusive"
            )
        if args.check_parent:
            result = authenticate_source_orders()
        elif args.verify:
            result = verify_run()
        else:
            result = run_diagnostic(
                server=args.server, timeout_s=args.timeout, workers=args.workers
            )
    except (
        Profile0034NewMirrorSupportingEdgeError,
        adapter.SmtSourceAdapterError,
    ) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "BRANCH_IDS",
    "CONTROL_IDS",
    "DEFAULT_TIMEOUT_S",
    "EXPECTED_ORDER",
    "EXPECTED_ORDER_SHA256",
    "EXPECTED_PROFILE_SHA256",
    "LANE_ID",
    "ORDER_IDS",
    "PROFILE_INDEX",
    "PROFILE_SHA256",
    "QUERY_KEYS",
    "RUN_ID",
    "RUN_ROOT",
    "TARGET_KEYS",
    "TARGET_VARIABLES",
    "PreparedQuery",
    "Profile0034NewMirrorSupportingEdgeError",
    "_target_key",
    "authenticate_source_orders",
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
    "run_query",
    "supporting_edge_constraints",
    "verify_adapter_tree",
    "verify_run",
    "verify_sat_model",
]


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = 2,
) -> dict[str, Any]:
    if (
        type(workers) is not int
        or type(workers) is bool
        or not 1 <= workers <= MAX_WORKERS
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            f"workers must lie in 1..{MAX_WORKERS}"
        )
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile0034NewMirrorSupportingEdgeError(
            "timeout must be a positive exact millisecond value"
        )
    server = _validate_server(server)
    root, manifest = ensure_run_root()
    timeout_ms = int(timeout_s * 1000)
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events/launch.json"
    if (
        launch_path.exists()
        and _strict_json(_read_regular(launch_path), "launch") != launch
    ):
        raise Profile0034NewMirrorSupportingEdgeError("launch record differs on resume")
    if not launch_path.exists():
        _create_once(launch_path, _json(launch))
    if (root / "events" / "terminal.json").exists():
        return verify_run()
    transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_s + 40)
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{
            key: build_target_system("mirror", key.split("-")[-1])
            for key in TARGET_KEYS
        },
    }
    prepared = {
        key: prepare_query(value, timeout_ms=timeout_ms)
        for key, value in systems.items()
    }
    results = {}
    for key in ("control-positive", "control-negative"):
        results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
        _require_control(key, results[key])

    def execute(key: str) -> tuple[str, dict[str, Any]]:
        return key, run_query(prepared[key], root / "artifacts" / key, transport)

    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        for key, result in pool.map(execute, TARGET_KEYS):
            results[key] = result
    terminal = _terminal_record(root, launch, results)
    _create_once(root / "events/terminal.json", _json(terminal))
    return terminal


def verify_run() -> dict[str, Any]:
    """Replay a complete local run without constructing PIQD transport."""
    root, manifest = _validate_existing_run_root()
    launch = _strict_json(_read_regular(root / "events/launch.json"), "launch")
    if launch.get("schema") != LAUNCH_SCHEMA or launch.get(
        "run_manifest_sha256"
    ) != manifest.get("manifest_sha256"):
        raise Profile0034NewMirrorSupportingEdgeError("launch record is malformed")
    terminal = _read_terminal(root / "events/terminal.json")
    if terminal.get("launch_sha256") != launch.get("launch_sha256"):
        raise Profile0034NewMirrorSupportingEdgeError("terminal launch binding drifted")
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{
            key: build_target_system("mirror", key.split("-")[-1])
            for key in TARGET_KEYS
        },
    }
    prepared = {
        key: prepare_query(value, timeout_ms=launch["timeout_ms"])
        for key, value in systems.items()
    }
    results = {
        key: verify_adapter_tree(prepared[key], root / "artifacts" / key)
        for key in QUERY_KEYS
    }
    _require_control("control-positive", results["control-positive"])
    _require_control("control-negative", results["control-negative"])
    expected = _terminal_record(root, launch, results)
    if terminal != expected:
        raise Profile0034NewMirrorSupportingEdgeError(
            "terminal differs from immutable artifact replay"
        )
    return terminal
