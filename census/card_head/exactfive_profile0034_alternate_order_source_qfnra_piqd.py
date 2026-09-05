"""Governed alternate-order source QF_NRA diagnostic for profile 0034.

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
from census.card_head import exactfive_profile0034_seven_order_coverage_piqd as coverage
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-alternate-order-source-qfnra-piqd-20260904"
RUN_ID = "run-0001"
RUN_OWNER = "profile0034-alternate-order-source-qfnra-piqd"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs/computation/exactfive-profile0034-alternate-order-source-qfnra-piqd-spec.md"
)
RUNNER_PATH = (
    REPOSITORY_ROOT
    / "scripts/run_exactfive_profile0034_alternate_order_source_qfnra_piqd.py"
)
PARENT_ROOT = (
    REPOSITORY_ROOT
    / "scratch/runs/exactfive-profile0034-seven-order-coverage-piqd-r2-20260904/run-0001"
)
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PROFILE_KEY = "profile-0034-16765c10e871a525d6e2"
PARENT_PROFILE_ROOT = PARENT_ROOT / "artifacts/profiles" / PARENT_PROFILE_KEY
PARENT_RESULT_PATH = PARENT_PROFILE_ROOT / "result.json"
PARENT_SOURCE_MANIFEST_PATH = PARENT_PROFILE_ROOT / "source-manifest.json"

PROFILE_INDEX = 34
PROFILE_SHA256 = "16765c10e871a525d6e28bb4b02028fb9504766f7cd2bcdf242f29d4fcd575fa"
PARENT_MANIFEST_SHA256 = "d665a82dd12ae7be8d3ace2f2d1d524efac8d3eae0e43baf0d73edb31a6580cc"
PARENT_LAUNCH_SHA256 = "b46743497e22c1f982673c6c6fc541b39603d12d4d733f069e02d59d40f3dcd2"
PARENT_TERMINAL_SHA256 = "c764c8db500b48262bd1aa1a109d9194f5c6599cc5b261af73c9bdf44d96ee81"

SYSTEM_SCHEMA = "p97-exactfive-profile0034-alternate-order-source-qfnra-system/v1"
PRODUCER_VERSION = "p97-exactfive-profile0034-alternate-order-source-qfnra-piqd/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-alternate-order-source-qfnra-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-alternate-order-source-qfnra-result/v1"
CONTROL_IDS = ("positive", "negative")
ORDER_IDS = ("parent-z3-mirror", "parent-cvc5-direct")
QUERY_KEYS = ("control-positive", "control-negative", *ORDER_IDS)
MAX_WORKERS = 2
DEFAULT_TIMEOUT_S = 60.0
CLASS_IDS = tuple(f"c{index:03d}" for index in range(13))
TARGET_VARIABLES = tuple(
    f"{axis}_{class_id}" for class_id in CLASS_IDS for axis in ("x", "y")
)
ORDER_SOLVERS = {
    "parent-z3-mirror": "z3",
    "parent-cvc5-direct": "cvc5",
}
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
    "census/card_head/exactfive_profile0034_alternate_order_source_qfnra_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_alternate_order_source_qfnra_piqd.py",
    "docs/computation/exactfive-profile0034-alternate-order-source-qfnra-piqd-spec.md",
    "scripts/run_exactfive_profile0034_alternate_order_source_qfnra_piqd.py",
]


class Profile0034QfnraError(RuntimeError):
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
        raise Profile0034QfnraError(f"artifact is missing or unreadable: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034QfnraError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034QfnraError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile0034QfnraError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise Profile0034QfnraError(f"{where} is not an object")
    return value


def _source_core(order: Sequence[str]) -> dict[str, Any]:
    index, profile = frozen_order.indexed_profiles()[PROFILE_INDEX]
    if index != PROFILE_INDEX or profile.profile_id != PROFILE_SHA256:
        raise Profile0034QfnraError("profile identity drifted")
    system = frozen_order.build_profile_system(index, profile)
    classes = tuple(tuple(entry["roles"]) for entry in system["classes"])
    if classes != EXPECTED_CLASSES or set(order) != set(CLASS_IDS):
        raise Profile0034QfnraError("profile classes or order drifted")
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
        raise Profile0034QfnraError("parent exact rank replay is malformed")
    if set(ranks.values()) != set(range(13)) or any(
        type(value) is not int for value in ranks.values()
    ):
        raise Profile0034QfnraError("parent exact ranks are not a permutation")
    return tuple(sorted(ranks, key=ranks.__getitem__))


def authenticate_source_orders() -> dict[str, Any]:
    """Authenticate coverage custody and derive both orders from SAT replays."""

    manifest_payload = _read_regular(PARENT_MANIFEST_PATH)
    launch_payload = _read_regular(PARENT_LAUNCH_PATH)
    terminal_payload = _read_regular(PARENT_TERMINAL_PATH)
    manifest = _strict_json(manifest_payload, "coverage run manifest")
    launch = _strict_json(launch_payload, "coverage launch")
    terminal = _strict_json(terminal_payload, "coverage terminal")
    if (
        manifest.get("schema") != "worktree-run-manifest/v1"
        or manifest.get("lane_id") != coverage.LANE_ID
        or manifest.get("run_id") != coverage.RUN_ID
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or launch.get("schema") != coverage.LAUNCH_SCHEMA
        or launch.get("lane_id") != coverage.LANE_ID
        or launch.get("run_id") != coverage.RUN_ID
        or launch.get("run_manifest_sha256") != PARENT_MANIFEST_SHA256
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
        or terminal.get("schema") != coverage.TERMINAL_SCHEMA
        or terminal.get("lane_id") != coverage.LANE_ID
        or terminal.get("run_id") != coverage.RUN_ID
        or terminal.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034QfnraError("coverage custody hashes or identity drifted")
    timeout_ms = launch.get("timeout_ms")
    if timeout_ms != 60_000:
        raise Profile0034QfnraError("coverage timeout drifted")
    rows = terminal.get("profiles")
    if type(rows) is not list:
        raise Profile0034QfnraError("coverage profile inventory is malformed")
    row = next((item for item in rows if type(item) is dict and item.get("key") == PARENT_PROFILE_KEY), None)
    if type(row) is not dict:
        raise Profile0034QfnraError("coverage profile-0034 result is absent")
    result_payload = _read_regular(PARENT_PROFILE_ROOT / "result.json")
    result = _strict_json(result_payload, "coverage profile result")
    result_sha = _sha(result_payload)
    if row.get("result_sha256") != result_sha:
        raise Profile0034QfnraError("coverage profile result digest drifted")
    try:
        prepared = coverage.prepare_profile_query(PROFILE_INDEX, timeout_ms=timeout_ms)
        summary = coverage.verify_terminal_directory(PARENT_PROFILE_ROOT, prepared)
    except Exception as exc:
        raise Profile0034QfnraError("coverage profile replay failed") from exc
    if (
        summary.get("result_sha256") != result_sha
        or summary.get("key") != PARENT_PROFILE_KEY
        or row.get("engines") != summary.get("engines")
    ):
        raise Profile0034QfnraError("coverage profile replay binding failed")
    engines = result.get("engines")
    if type(engines) is not list or len(engines) != 2:
        raise Profile0034QfnraError("coverage engine inventory drifted")
    authenticated = []
    for order_id, engine in zip(ORDER_IDS, engines, strict=True):
        solver = ORDER_SOLVERS[order_id]
        order = _parent_order(engine)
        semantic = engine.get("semantic_replay")
        evidence = semantic.get("evidence") if type(semantic) is dict else None
        expected_orientation = "mirror" if solver == "z3" else "direct"
        if (
            engine.get("solver") != solver
            or engine.get("raw_status") != "SAT"
            or engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
            or type(semantic) is not dict
            or semantic.get("accepted") is not True
            or type(evidence) is not dict
            or evidence.get("orientation") != expected_orientation
        ):
            raise Profile0034QfnraError(f"coverage exact order replay drifted: {order_id}")
        authenticated.append({
            "order_id": order_id,
            "solver": solver,
            "orientation": "mirror" if "mirror" in order_id else "direct",
            "order": list(order),
            "order_sha256": _sha(_canonical(list(order))),
            "parent_result_sha256": result_sha,
            "parent_source_manifest_sha256": _sha(_read_regular(PARENT_PROFILE_ROOT / "source-manifest.json")),
        })
    return {
        "schema": "p97-exactfive-profile0034-coverage-parent-custody/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "parent_run_manifest_sha256": PARENT_MANIFEST_SHA256,
        "parent_launch_sha256": PARENT_LAUNCH_SHA256,
        "parent_terminal_sha256": PARENT_TERMINAL_SHA256,
        "parent_profile_result_sha256": result_sha,
        "parent_source_manifest_sha256": authenticated[0]["parent_source_manifest_sha256"],
        "authenticated_orders": authenticated,
    }


def _build_target_from_prior(
    prior: Mapping[str, Any], order_id: str
) -> dict[str, Any]:
    if order_id not in ORDER_IDS:
        raise Profile0034QfnraError(f"unknown target order: {order_id}")
    authenticated = prior["authenticated_orders"][ORDER_IDS.index(order_id)]
    order = tuple(authenticated["order"])
    if len(order) != len(CLASS_IDS) or set(order) != set(CLASS_IDS):
        raise Profile0034QfnraError("target order is not a permutation of profile classes")
    source = _source_core(order)
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "order_id": order_id,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "classes": source["classes"],
        "role_class": source["role_class"],
        "rows": source["rows"],
        "order": list(order),
        "ranks": source["ranks"],
        "variables": list(TARGET_VARIABLES),
        "gauge": {
            "rank_zero": {"class": order[0], "coordinate": [0, 0]},
            "rank_one": {"class": order[1], "coordinate": [1, 0]},
        },
        "radius_disequality": {
            "center": "c2",
            "old_support": "O",
            "replacement_support": "d",
        },
        "source_strict": {
            "left": ["e", "d"],
            "right": ["e", "a"],
            "relation": "<",
        },
        "authenticated_order_sha256": authenticated["order_sha256"],
        "authenticated_parent_result_sha256": authenticated[
            "parent_result_sha256"
        ],
        "authenticated_parent_source_manifest_sha256": authenticated[
            "parent_source_manifest_sha256"
        ],
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(order_id: str) -> dict[str, Any]:
    return _build_target_from_prior(authenticate_source_orders(), order_id)


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in CONTROL_IDS:
        raise Profile0034QfnraError("unknown control")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
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
        raise Profile0034QfnraError("semantic system is malformed")
    if system.get("kind") == "control":
        expected = build_control_system(system.get("control"))
    elif system.get("kind") == "target":
        expected = _build_target_from_prior(
            prior or authenticate_source_orders(), system.get("order_id")
        )
    else:
        raise Profile0034QfnraError("semantic system kind is invalid")
    if system != expected:
        raise Profile0034QfnraError("semantic system drifted from source formula")
    return dict(system)


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
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


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
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
        "schema": "p97-exactfive-profile0034-alternate-order-source-record/v1",
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


def _source_snapshots(prior: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
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
        adapter.SourceSnapshot("implementation-profile0034.py", _read_regular(Path(__file__))),
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
            "implementation-coverage-producer.py", _read_regular(Path(coverage.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-adapter.py", _read_regular(Path(adapter.__file__))
        ),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
    )
    return tuple(sorted(sources, key=lambda item: item.path))


def prepare_query(
    system: dict[str, Any], *, timeout_ms: int = 60_000
) -> PreparedQuery:
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise Profile0034QfnraError("query timeout is invalid")
    prior = authenticate_source_orders()
    current = _validate_system_current(system, prior)
    commands = build_smt_commands(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile0034QfnraError("SMT journal normalization drifted")
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
            "id": "p97-exactfive-profile0034-alternate-order-source-qfnra",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "exact-rational-profile0034-source-replay",
            "version": "v1",
        },
        "stage_id": "profile0034-source-qfnra",
        "query_id": key,
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
    return PreparedQuery(key, current, query)


def _parse_target_coordinates(
    values: str, terms: Sequence[str]
) -> dict[str, tuple[Fraction, Fraction]]:
    try:
        return frozen_nra.parse_coordinates(values, terms)
    except Exception as exc:
        raise Profile0034QfnraError(str(exc)) from exc


def _parse_control_value(values: str) -> dict[str, Fraction]:
    try:
        return bo_source.parse_exact_values(values, ("t",))
    except Exception as exc:
        raise Profile0034QfnraError(str(exc)) from exc


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise Profile0034QfnraError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034QfnraError("semantic input is malformed")
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
        raise Profile0034QfnraError("descriptor, source formula, or journal drifted")
    try:
        if system["kind"] == "control":
            parsed = _parse_control_value(values)
            accepted = system["control"] == "positive" and parsed == {
                "t": Fraction(1)
            }
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
    except Profile0034QfnraError as exc:
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
        raise Profile0034QfnraError("adapter artifact record is malformed")
    name = record["path"]
    if (
        type(name) is not str
        or not name
        or "/" in name
        or "\\" in name
        or name in seen
    ):
        raise Profile0034QfnraError("adapter artifact path is unsafe or duplicated")
    payload = _read_regular(root / name)
    if (
        type(record["bytes"]) is not int
        or record["bytes"] != len(payload)
        or type(record["sha256"]) is not str
        or record["sha256"] != _sha(payload)
    ):
        raise Profile0034QfnraError(f"adapter artifact digest mismatch: {name}")
    seen.add(name)
    return payload


def verify_adapter_tree(
    prepared: PreparedQuery, output_directory: Path
) -> dict[str, Any]:
    """Revalidate immutable PIQD artifacts and exact source replay."""

    if not output_directory.is_dir() or output_directory.is_symlink():
        raise Profile0034QfnraError("adapter output directory is unsafe")
    result = _strict_json(
        _read_regular(output_directory / "result.json"), "adapter result"
    )
    if (
        result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise Profile0034QfnraError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "manifest",
        "sources",
    }:
        raise Profile0034QfnraError("adapter custody is malformed")
    descriptor = _verify_artifact(output_directory, custody["descriptor"], seen)
    original = _verify_artifact(output_directory, custody["original_smt2"], seen)
    journal = _verify_artifact(output_directory, custody["journal_smt2"], seen)
    manifest_payload = _verify_artifact(
        output_directory, custody["manifest"], seen
    )
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
        or result.get("source_manifest_sha256") != _sha(manifest_payload)
        or _strict_json(manifest_payload, "source manifest")
        != adapter._manifest(prepared.query)
    ):
        raise Profile0034QfnraError("adapter query or manifest custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(
        prepared.query.source_files
    ):
        raise Profile0034QfnraError("adapter source custody count drifted")
    for record, expected in zip(
        source_records, prepared.query.source_files, strict=True
    ):
        if _verify_artifact(output_directory, record, seen) != expected.payload:
            raise Profile0034QfnraError("adapter source snapshot differs")
    engines = result.get("engines")
    if (
        type(engines) is not list
        or [row.get("solver") for row in engines if type(row) is dict]
        != list(adapter.SOLVERS)
    ):
        raise Profile0034QfnraError("adapter engine inventory is malformed")
    for engine in engines:
        if type(engine) is not dict or engine.get("raw_status") not in {
            "SAT",
            "UNSAT",
            "UNKNOWN",
        }:
            raise Profile0034QfnraError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise Profile0034QfnraError("adapter engine artifacts are malformed")
        try:
            frozen_order._validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise Profile0034QfnraError("adapter artifact labels drifted") from exc
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
            raise Profile0034QfnraError("adapter engine custody failed") from exc
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
            raise Profile0034QfnraError("adapter solve digest is inconsistent")
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if (
                effective != "UNSAT_DISCOVERY_ONLY"
                or engine.get("semantic_replay") is not None
            ):
                raise Profile0034QfnraError("UNSAT custody classification drifted")
        elif raw == "UNKNOWN":
            if (
                effective != "INCONCLUSIVE_UNKNOWN"
                or engine.get("semantic_replay") is not None
            ):
                raise Profile0034QfnraError("UNKNOWN custody classification drifted")
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if semantic_payload is None or _strict_json(
                semantic_payload, f"{engine['solver']} semantic"
            ) != semantic:
                raise Profile0034QfnraError("SAT semantic artifact drifted")
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
                    raise Profile0034QfnraError(
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
                    raise Profile0034QfnraError("SAT semantic replay drifted")
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
        raise Profile0034QfnraError("adapter overall status is inconsistent")
    entries = tuple(output_directory.iterdir())
    if any(
        entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        for entry in entries
    ) or {entry.name for entry in entries} != seen:
        raise Profile0034QfnraError("adapter output contains unbound artifacts")
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
        raise Profile0034QfnraError("artifact parent directory is unsafe")
    adapter.run_source_semantic_query(
        prepared.query, output_directory, transport, verify_sat_model
    )
    return verify_adapter_tree(prepared, output_directory)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile0034QfnraError("manifest source lies outside repository") from exc


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
        raise Profile0034QfnraError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = [
        Path(__file__),
        SPEC_PATH,
        RUNNER_PATH,
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
        PARENT_RESULT_PATH,
        PARENT_SOURCE_MANIFEST_PATH,
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
        raise Profile0034QfnraError(f"immutable artifact already exists: {path}") from exc
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
        raise Profile0034QfnraError("run root lies outside repository") from exc
    current = REPOSITORY_ROOT
    for component in relative.parts:
        current /= component
        try:
            info = current.lstat()
        except FileNotFoundError:
            break
        except OSError as exc:
            raise Profile0034QfnraError(f"cannot inspect run-root ancestor: {current}") from exc
        if stat.S_ISLNK(info.st_mode) or not stat.S_ISDIR(info.st_mode):
            raise Profile0034QfnraError(f"run-root ancestor is unsafe: {current}")


def _ensure_directory(path: Path, label: str) -> None:
    try:
        path.mkdir(exist_ok=True)
    except OSError as exc:
        raise Profile0034QfnraError(f"{label} is unsafe: {path}") from exc
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034QfnraError(f"{label} is unreadable: {path}") from exc
    if stat.S_ISLNK(info.st_mode) or not stat.S_ISDIR(info.st_mode):
        raise Profile0034QfnraError(f"{label} is unsafe: {path}")


def _validate_existing_run_root() -> tuple[Path, dict[str, Any]]:
    """Validate an existing run tree without creating or mutating anything."""
    _check_registered_ancestors(RUN_ROOT)
    try:
        info = RUN_ROOT.lstat()
    except OSError as exc:
        raise Profile0034QfnraError("run root is absent or unreadable") from exc
    if stat.S_ISLNK(info.st_mode) or not stat.S_ISDIR(info.st_mode):
        raise Profile0034QfnraError("run root is absent or unsafe")
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name
        try:
            child_info = child.lstat()
        except OSError as exc:
            raise Profile0034QfnraError(f"run-root child is absent: {child}") from exc
        if stat.S_ISLNK(child_info.st_mode) or not stat.S_ISDIR(child_info.st_mode):
            raise Profile0034QfnraError(f"run-root child is unsafe: {child}")
    manifest_path = RUN_ROOT / "run_manifest.json"
    observed = _strict_json(_read_regular(manifest_path), "run manifest")
    created = observed.get("created_utc")
    if type(created) is not str or observed != _expected_run_manifest(created):
        raise Profile0034QfnraError("run manifest or source digest drifted")
    return RUN_ROOT, observed


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _check_registered_ancestors(RUN_ROOT)
    try:
        RUN_ROOT.mkdir(parents=True, exist_ok=True)
    except OSError as exc:
        raise Profile0034QfnraError(f"run root is unsafe: {RUN_ROOT}") from exc
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
        raise Profile0034QfnraError(f"run manifest is unreadable: {manifest_path}") from exc
    if manifest_info is not None:
        if stat.S_ISLNK(manifest_info.st_mode) or not stat.S_ISREG(manifest_info.st_mode):
            raise Profile0034QfnraError(f"run manifest is unsafe: {manifest_path}")
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
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": workers,
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
        "result_sha256": _sha(
            _read_regular(root / "artifacts" / key / "result.json")
        ),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    raw = [engine.get("raw_status") for engine in result.get("engines", [])]
    if raw != [expected, expected]:
        raise Profile0034QfnraError(f"{key} did not produce {expected}/{expected}")
    if expected == "SAT" and any(
        engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
        for engine in result["engines"]
    ):
        raise Profile0034QfnraError("positive control failed exact replay")


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
        "status": _terminal_status([results[key] for key in ORDER_IDS]),
        "results": {
            key: _result_record(root, key, results[key]) for key in QUERY_KEYS
        },
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
        or terminal.get("terminal_sha256")
        != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034QfnraError("terminal record is malformed")
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
        raise Profile0034QfnraError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = 2,
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= 2:
        raise Profile0034QfnraError("workers must lie in 1..2")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile0034QfnraError("timeout must be exact milliseconds in (0,3600]")
    server = _validate_server(server)
    timeout_ms = int(timeout_s * 1000)
    root, manifest = ensure_run_root()
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events/launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile0034QfnraError("launch record differs on resume")
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
            raise Profile0034QfnraError("terminal differs from artifact replay")
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


def verify_run() -> dict[str, Any]:
    """Replay the immutable local run without constructing PIQD transport."""
    root, manifest = _validate_existing_run_root()
    launch_path = root / "events/launch.json"
    terminal_path = root / "events/terminal.json"
    launch = _strict_json(_read_regular(launch_path), "launch")
    if any(field not in launch for field in ("server", "timeout_ms", "workers")):
        raise Profile0034QfnraError("launch record is missing required fields")
    terminal = _read_terminal(terminal_path)
    if launch != _launch_record(
        manifest, launch["server"], launch["timeout_ms"], launch["workers"]
    ):
        raise Profile0034QfnraError("launch differs from the immutable manifest")
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
        raise Profile0034QfnraError("terminal differs from immutable artifact replay")
    return terminal


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
            raise Profile0034QfnraError("--check-parent and --verify are mutually exclusive")
        if args.check_parent:
            result = authenticate_source_orders()
        elif args.verify:
            result = verify_run()
        else:
            result = run_diagnostic(
                server=args.server, timeout_s=args.timeout, workers=args.workers
            )
    except (Profile0034QfnraError, adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "CONTROL_IDS",
    "DEFAULT_TIMEOUT_S",
    "EXPECTED_CLASSES",
    "LANE_ID",
    "ORDER_IDS",
    "PROFILE_INDEX",
    "PROFILE_SHA256",
    "RUN_ID",
    "RUN_ROOT",
    "TARGET_VARIABLES",
    "PreparedQuery",
    "Profile0034QfnraError",
    "authenticate_source_orders",
    "build_control_system",
    "build_smt_commands",
    "build_target_system",
    "ensure_run_root",
    "formula_inventory",
    "main",
    "prepare_query",
    "run_diagnostic",
    "run_query",
    "verify_adapter_tree",
    "verify_run",
    "verify_sat_model",
]
