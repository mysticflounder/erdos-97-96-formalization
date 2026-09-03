"""One-round adaptive order-to-coordinate diagnostic for survivor 1697.

The structural query is the frozen hard-source-swap QF_LIRA formula plus two
full-permutation ``ENUMERATION_CONTROL`` blocks.  Only a PIQD SAT assignment
that passes the frozen producer's exact replay and both blocks can supply a
fresh order.  At most two such orders are sent to fresh QF_NRA coordinate
queries.  No result produced here is a source-realization or closure claim.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import math
import os
import re
import stat
import urllib.parse
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any, Literal

from census.card_head import exactfive_hard_source_swap_nra_piqd as frozen_nra
from census.card_head import exactfive_hard_source_swap_order_piqd as frozen_order
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-adaptive-order-nra-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs"
    / "specs"
    / "p97-exactfive-hard-source-swap-adaptive-order-nra-v1.md"
)
PROFILE_INDEX = 1697
PROFILE_SHA256 = "59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e"
MAX_FRESH_ORDERS = 2
MAX_WORKERS = 2
CONTROL_IDS = ("positive", "negative")
LINEAR_SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-order-system/v1"
PLANAR_SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-planar-system/v1"
LINEAR_ORIGIN_SCHEMA = "p97-exactfive-hard-source-swap-linear-origin/v1"
PRODUCER_VERSION = "p97-exactfive-hard-source-swap-adaptive-order-nra/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-order-nra-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-order-nra-result/v1"
FALSE_CLAIMS = {
    "source_realization": False,
    "enumeration_control_semantic_refinement": False,
    "all_order_elimination": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
_HEX_DIGEST = re.compile(r"^[0-9a-f]{64}$")
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_adaptive_order_nra_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_adaptive_order_nra_piqd.py",
    "docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-order-nra.md",
    "docs/specs/p97-exactfive-hard-source-swap-adaptive-order-nra-v1.md",
    "scripts/run_exactfive_hard_source_swap_adaptive_order_nra_piqd.py",
]

INITIAL_BLOCKED_ORDERS: tuple[tuple[str, ...], ...] = tuple(
    tuple(frozen_nra.ORDERS[name]) for name in frozen_nra.ORDER_IDS
)


class AdaptiveOrderNraError(RuntimeError):
    """The adaptive diagnostic failed closed."""


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _sha_json(value: object) -> str:
    return _sha(_canonical(value))


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha_json({key: item for key, item in value.items() if key != field})


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise AdaptiveOrderNraError(
            f"artifact is missing or unreadable: {path}"
        ) from exc
    if (
        not stat.S_ISREG(info.st_mode)
        or info.st_nlink != 1
        or info.st_size > limit
    ):
        raise AdaptiveOrderNraError(f"unsafe artifact: {path}")
    try:
        payload = path.read_bytes()
    except OSError as exc:
        raise AdaptiveOrderNraError(f"artifact became unreadable: {path}") from exc
    if len(payload) != info.st_size:
        raise AdaptiveOrderNraError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise AdaptiveOrderNraError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise AdaptiveOrderNraError(f"{where} is not an object")
    return value


def _profile() -> tuple[int, frozen_order.alias_grid.SourceAliasProfile]:
    index, profile = frozen_order.indexed_profiles()[PROFILE_INDEX]
    if index != PROFILE_INDEX or profile.profile_id != PROFILE_SHA256:
        raise AdaptiveOrderNraError("authenticated survivor 1697 changed")
    frozen_order.alias_grid.validate_source_alias_profile(profile)
    return index, profile


def _class_ids(base_system: Mapping[str, Any]) -> tuple[str, ...]:
    classes = base_system.get("classes")
    if type(classes) is not list or not classes:
        raise AdaptiveOrderNraError("base quotient classes are malformed")
    ids = tuple(row.get("id") for row in classes if type(row) is dict)
    if len(ids) != len(classes) or any(type(item) is not str for item in ids):
        raise AdaptiveOrderNraError("base quotient class identifiers are malformed")
    if len(set(ids)) != len(ids):
        raise AdaptiveOrderNraError("base quotient class identifiers are duplicated")
    return ids


def _validate_order(
    order: Sequence[str], class_ids: Sequence[str], *, where: str
) -> tuple[str, ...]:
    if type(order) not in {list, tuple} or any(type(item) is not str for item in order):
        raise AdaptiveOrderNraError(f"{where} is not a string sequence")
    result = tuple(order)
    if len(result) != len(class_ids) or set(result) != set(class_ids):
        raise AdaptiveOrderNraError(f"{where} is not a full class permutation")
    return result


def initial_blocked_orders() -> tuple[tuple[str, ...], ...]:
    """Return the two frozen NRA orders after authenticating their universe."""

    base = frozen_order.build_profile_system(*_profile())
    class_ids = _class_ids(base)
    blocks = tuple(
        _validate_order(order, class_ids, where=f"initial block {index}")
        for index, order in enumerate(INITIAL_BLOCKED_ORDERS)
    )
    if len(set(blocks)) != len(blocks):
        raise AdaptiveOrderNraError("initial enumeration-control blocks are duplicated")
    return blocks


def order_sha256(order: Sequence[str]) -> str:
    return _sha_json(list(order))


def order_block_command(order: Sequence[str]) -> str:
    """Encode one exact full-permutation enumeration-control block."""

    base = frozen_order.build_profile_system(*_profile())
    checked = _validate_order(order, _class_ids(base), where="blocked order")
    equalities = " ".join(
        f"(= {frozen_order._rank_term(class_id)} {rank})"
        for rank, class_id in enumerate(checked)
    )
    return f"(assert (not (and {equalities})))"


def build_linear_system(
    control: Literal["positive", "negative"] | None = None,
) -> dict[str, Any]:
    if control is None:
        base = frozen_order.build_profile_system(*_profile())
        blocks = initial_blocked_orders()
        kind = "profile"
    else:
        if control not in CONTROL_IDS:
            raise AdaptiveOrderNraError("unknown structural control")
        base = frozen_order.build_control_system(control)
        blocks = ()
        kind = "control"
    system = {
        "schema": LINEAR_SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "kind": kind,
        "control": control,
        "profile_index": PROFILE_INDEX if control is None else None,
        "profile_sha256": PROFILE_SHA256 if control is None else None,
        "base_system": base,
        "base_system_sha256": _sha_json(base),
        "enumeration_controls": [
            {
                "clause_class": "ENUMERATION_CONTROL",
                "order": list(order),
                "order_sha256": order_sha256(order),
                "command": order_block_command(order),
            }
            for order in blocks
        ],
        "claims": dict(FALSE_CLAIMS),
    }
    return system


def _validate_linear_system_current(system: object) -> dict[str, Any]:
    if type(system) is not dict or system.get("schema") != LINEAR_SYSTEM_SCHEMA:
        raise AdaptiveOrderNraError("structural semantic system has the wrong schema")
    kind = system.get("kind")
    if kind == "profile":
        expected = build_linear_system()
    elif kind == "control" and system.get("control") in CONTROL_IDS:
        expected = build_linear_system(system["control"])
    else:
        raise AdaptiveOrderNraError("structural semantic system kind is invalid")
    if system != expected:
        raise AdaptiveOrderNraError("structural system disagrees with current producer")
    return expected


def linear_formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    current = _validate_linear_system_current(dict(system))
    inventory = dict(frozen_order.formula_inventory(current["base_system"]))
    inventory["enumeration_control_blocks"] = len(current["enumeration_controls"])
    inventory["enumeration_control_rank_equalities"] = sum(
        len(row["order"]) for row in current["enumeration_controls"]
    )
    return inventory


def build_linear_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_linear_system_current(dict(system))
    commands = list(frozen_order.build_smt_commands(current["base_system"]))
    commands.extend(row["command"] for row in current["enumeration_controls"])
    return tuple(commands)


def linear_smt_journal(system: Mapping[str, Any]) -> bytes:
    return b"".join(
        command.encode("ascii") + b"\n"
        for command in build_linear_smt_commands(system)
    )


def _order_from_ranks(
    ranks: Mapping[str, object], class_ids: Sequence[str]
) -> tuple[str, ...]:
    if set(ranks) != set(class_ids):
        raise AdaptiveOrderNraError("rank replay does not cover the quotient classes")
    by_rank: list[str | None] = [None] * len(class_ids)
    for class_id in class_ids:
        rank = ranks[class_id]
        if type(rank) is not int or not 0 <= rank < len(class_ids):
            raise AdaptiveOrderNraError("rank replay is not integral and bounded")
        if by_rank[rank] is not None:
            raise AdaptiveOrderNraError("rank replay is not a permutation")
        by_rank[rank] = class_id
    if any(item is None for item in by_rank):
        raise AdaptiveOrderNraError("rank replay has a gap")
    return tuple(item for item in by_rank if item is not None)


def replay_linear_assignment(
    system: Mapping[str, Any], values: Mapping[str, Fraction]
) -> frozen_order.ReplayOutcome:
    current = _validate_linear_system_current(dict(system))
    replay = frozen_order.replay_assignment(current["base_system"], values)
    if not replay.accepted:
        return replay
    class_ids = _class_ids(current["base_system"])
    order = _order_from_ranks(replay.evidence.get("ranks", {}), class_ids)
    blocked = {
        tuple(record["order"]) for record in current["enumeration_controls"]
    }
    if order in blocked:
        return frozen_order.ReplayOutcome(
            False,
            {
                "reason": "enumeration_control_block",
                "order": list(order),
                "order_sha256": order_sha256(order),
            },
        )
    return frozen_order.ReplayOutcome(
        True,
        {
            **replay.evidence,
            "old_formula_exact_replay": True,
            "enumeration_controls_checked": len(blocked),
            "order": list(order),
            "order_sha256": order_sha256(order),
        },
    )


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    stage: Literal["linear", "planar"]
    system: dict[str, Any]
    origin: dict[str, Any] | None
    query: adapter.SourceSemanticQuery


@dataclass(frozen=True)
class VerifiedTree:
    prepared_query_sha256: str
    result: dict[str, Any]
    result_sha256: str


@dataclass(frozen=True)
class LinearWitness:
    order: tuple[str, ...]
    solver: str
    origin: dict[str, Any]


def _source_record(stage: str) -> dict[str, Any]:
    return {
        "schema": PRODUCER_VERSION,
        "stage": stage,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "initial_block_order_sha256": [
            order_sha256(order) for order in initial_blocked_orders()
        ],
        "claims": dict(FALSE_CLAIMS),
    }


def _variables_for_linear(base_system: Mapping[str, Any]) -> list[dict[str, str]]:
    class_ids = _class_ids(base_system)
    variables = [
        {
            "id": f"distance-{left}-{right}",
            "term": frozen_order._distance_term(left, right),
            "sort": "Real",
        }
        for index, left in enumerate(class_ids)
        for right in class_ids[index + 1 :]
    ]
    variables.extend(
        {
            "id": f"rank-{class_id}",
            "term": frozen_order._rank_term(class_id),
            "sort": "Int",
        }
        for class_id in class_ids
    )
    return sorted(variables, key=lambda row: row["id"])


def _query(
    *,
    stage: Literal["linear", "planar"],
    query_id: str,
    semantic: dict[str, Any],
    commands: tuple[str, ...],
    variables: list[dict[str, str]],
    snapshots: Sequence[adapter.SourceSnapshot],
    timeout_ms: int,
    verifier_id: str,
) -> adapter.SourceSemanticQuery:
    if type(timeout_ms) is not int or type(timeout_ms) is bool or not 0 < timeout_ms <= 3_600_000:
        raise AdaptiveOrderNraError("descriptor timeout_ms must be an integer in 1..3600000")
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise AdaptiveOrderNraError("SMT journal normalization drifted")
    sources = tuple(sorted(snapshots, key=lambda item: item.path))
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {"id": "p97-exactfive-hard-source-swap-adaptive-order-nra", "version": "v1"},
        "semantic_verifier": {"id": verifier_id, "version": "v1"},
        "stage_id": stage,
        "query_id": query_id,
        "sources": [
            {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
            for item in sources
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha_json(semantic),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [row["id"] for row in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": adapter.SOLVER_PROFILE_SCHEMA,
            "solvers": list(adapter.SOLVERS),
            "timeout_ms": timeout_ms,
        },
    }
    return adapter.SourceSemanticQuery(
        descriptor,
        _json(descriptor),
        journal,
        commands,
        journal,
        sources,
    )


def prepare_linear_query(
    system: dict[str, Any] | None = None, *, timeout_ms: int = 60_000
) -> PreparedQuery:
    current = _validate_linear_system_current(
        build_linear_system() if system is None else system
    )
    commands = build_linear_smt_commands(current)
    base = current["base_system"]
    base_journal = frozen_order.smt_journal(base)
    semantic = {
        "schema": LINEAR_SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha_json(current),
        "base_system_sha256": _sha_json(base),
        "base_journal_sha256": _sha(base_journal),
        "formula_inventory": linear_formula_inventory(current),
        "journal_sha256": _sha(linear_smt_journal(current)),
        "clause_classes": {
            "ROOT_STATIC": len(frozen_order.build_smt_commands(base)),
            "ENUMERATION_CONTROL": len(current["enumeration_controls"]),
            "SEMANTIC_REFINEMENT": 0,
        },
        "claims": dict(FALSE_CLAIMS),
    }
    sources = (
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record("linear"))),
        adapter.SourceSnapshot("implementation-adaptive.py", _read_regular(Path(__file__))),
        adapter.SourceSnapshot("implementation-order-producer.py", _read_regular(Path(frozen_order.__file__))),
        adapter.SourceSnapshot("implementation-nra-producer.py", _read_regular(Path(frozen_nra.__file__))),
        adapter.SourceSnapshot("implementation-alias-producer.py", _read_regular(Path(frozen_order.alias_grid.__file__))),
        adapter.SourceSnapshot("implementation-adapter.py", _read_regular(Path(adapter.__file__))),
    )
    key = (
        f"linear-control-{current['control']}"
        if current["kind"] == "control"
        else "linear-profile-1697"
    )
    query = _query(
        stage="linear",
        query_id=key,
        semantic=semantic,
        commands=commands,
        variables=_variables_for_linear(base),
        snapshots=sources,
        timeout_ms=timeout_ms,
        verifier_id="old-exact-replay-plus-full-order-blocks",
    )
    return PreparedQuery(key, "linear", current, None, query)


def verify_linear_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise AdaptiveOrderNraError("structural SAT replay received an invalid engine payload")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != LINEAR_SYSTEM_SCHEMA:
        raise AdaptiveOrderNraError("structural SAT semantic input is malformed")
    system = _validate_linear_system_current(semantic.get("system"))
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = prepare_linear_query(system, timeout_ms=timeout_ms).query
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.descriptor != expected.descriptor
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
        or semantic.get("system_sha256") != _sha_json(system)
        or semantic.get("base_system_sha256") != _sha_json(system["base_system"])
        or semantic.get("base_journal_sha256") != _sha(frozen_order.smt_journal(system["base_system"]))
        or semantic.get("formula_inventory") != linear_formula_inventory(system)
    ):
        raise AdaptiveOrderNraError("structural descriptor or authenticated formula drifted")
    readback = frozen_order.parse_exact_readback(values, query.get_values)
    replay = replay_linear_assignment(system, readback)
    return adapter.SemanticVerification(
        replay.accepted,
        {
            **replay.evidence,
            "solver": solver,
            "model_sha256": _sha(model.encode("utf-8")),
            "values_sha256": _sha(values.encode("utf-8")),
            "system_sha256": _sha_json(system),
            "journal_sha256": _sha(query.original_smt2),
        },
    )


def build_planar_system(
    order: Sequence[str] | None = None,
    *,
    control: Literal["positive", "negative"] | None = None,
) -> dict[str, Any]:
    if control is not None:
        if control not in CONTROL_IDS or order is not None:
            raise AdaptiveOrderNraError("invalid planar control request")
        base = dict(frozen_nra.build_control_system(control))
        base["schema"] = PLANAR_SYSTEM_SCHEMA
        base["producer_version"] = PRODUCER_VERSION
        base["claims"] = dict(FALSE_CLAIMS)
        return base
    if order is None:
        raise AdaptiveOrderNraError("planar target requires an order")
    _, profile = _profile()
    classes = tuple(tuple(row) for row in profile.classes)
    role_class = frozen_order._role_to_class(classes)
    class_ids = tuple(f"c{index:03d}" for index in range(len(classes)))
    checked = _validate_order(order, class_ids, where="fresh planar order")
    return {
        "schema": PLANAR_SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "kind": "profile",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "classes": [
            {"id": class_id, "roles": list(profile.classes[index])}
            for index, class_id in enumerate(class_ids)
        ],
        "role_class": role_class,
        "order_id": f"fresh-{order_sha256(checked)[:20]}",
        "order": list(checked),
        "ranks": {class_id: rank for rank, class_id in enumerate(checked)},
        "gauge": {"rank_zero": [0, 0], "rank_one": [1, 0]},
        "rows": [
            {"id": row["id"], "center": row["center"], "support": list(row["support"])}
            for row in frozen_order.ROWS
        ],
        "radius_disequality": {
            "center": "c2",
            "old_support": "O",
            "replacement_support": "d",
        },
        "source_strict": {"left": ["e", "d"], "right": ["e", "a"], "relation": "<"},
        "claims": dict(FALSE_CLAIMS),
    }


def _validate_planar_system_current(system: object) -> dict[str, Any]:
    if type(system) is not dict or system.get("schema") != PLANAR_SYSTEM_SCHEMA:
        raise AdaptiveOrderNraError("planar semantic system has the wrong schema")
    if system.get("kind") == "profile":
        expected = build_planar_system(system.get("order"))
    elif system.get("kind") == "control" and system.get("control") in CONTROL_IDS:
        expected = build_planar_system(control=system["control"])
    else:
        raise AdaptiveOrderNraError("planar semantic system kind is invalid")
    if system != expected:
        raise AdaptiveOrderNraError("planar system disagrees with current producer")
    return expected


def _validate_origin(origin: object, order: Sequence[str]) -> dict[str, Any]:
    if type(origin) is not dict or origin.get("schema") != LINEAR_ORIGIN_SCHEMA:
        raise AdaptiveOrderNraError("linear origin has the wrong schema")
    required = {
        "schema", "profile_index", "profile_sha256", "linear_query_id",
        "linear_query_sha256", "linear_result_sha256", "linear_solver",
        "linear_engine_sha256", "linear_semantic_replay_sha256", "model_sha256",
        "values_sha256", "order", "order_sha256", "origin_sha256",
    }
    if set(origin) != required:
        raise AdaptiveOrderNraError("linear origin has the wrong fields")
    checked = tuple(order)
    if (
        origin["profile_index"] != PROFILE_INDEX
        or origin["profile_sha256"] != PROFILE_SHA256
        or origin["linear_solver"] not in adapter.SOLVERS
        or origin["order"] != list(checked)
        or origin["order_sha256"] != order_sha256(checked)
        or origin["origin_sha256"] != _self_hash(origin, "origin_sha256")
    ):
        raise AdaptiveOrderNraError("linear origin provenance is inconsistent")
    digest_fields = {
        "linear_query_sha256",
        "linear_result_sha256",
        "linear_engine_sha256",
        "linear_semantic_replay_sha256",
        "model_sha256",
        "values_sha256",
        "order_sha256",
        "origin_sha256",
    }
    if type(origin["linear_query_id"]) is not str or not origin["linear_query_id"]:
        raise AdaptiveOrderNraError("linear origin query id is malformed")
    for key in digest_fields:
        if type(origin[key]) is not str or _HEX_DIGEST.fullmatch(origin[key]) is None:
            raise AdaptiveOrderNraError("linear origin digest is malformed")
    return dict(origin)


def _variables_for_planar(system: Mapping[str, Any]) -> list[dict[str, str]]:
    variables = [
        {"id": f"{axis}-{class_id}", "term": f"{axis}_{class_id}", "sort": "Real"}
        for class_id in system["order"]
        for axis in ("x", "y")
    ]
    return sorted(variables, key=lambda row: row["id"])


def prepare_planar_query(
    system: dict[str, Any],
    origin: dict[str, Any] | None = None,
    *,
    timeout_ms: int = 60_000,
) -> PreparedQuery:
    current = _validate_planar_system_current(system)
    if current["kind"] == "profile":
        if origin is None:
            raise AdaptiveOrderNraError("planar target lacks a linear origin")
        current_origin = _validate_origin(origin, current["order"])
    else:
        if origin is not None:
            raise AdaptiveOrderNraError("planar control unexpectedly has a linear origin")
        current_origin = None
    commands = frozen_nra.build_smt_commands(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    semantic = {
        "schema": PLANAR_SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha_json(current),
        "formula_inventory": frozen_nra.formula_inventory(current),
        "journal_sha256": _sha(journal),
        "linear_origin": current_origin,
        "linear_origin_sha256": None if current_origin is None else current_origin["origin_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = [
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record("planar"))),
        adapter.SourceSnapshot("implementation-adaptive.py", _read_regular(Path(__file__))),
        adapter.SourceSnapshot("implementation-nra-producer.py", _read_regular(Path(frozen_nra.__file__))),
        adapter.SourceSnapshot("implementation-order-producer.py", _read_regular(Path(frozen_order.__file__))),
        adapter.SourceSnapshot("implementation-adapter.py", _read_regular(Path(adapter.__file__))),
    ]
    if current_origin is not None:
        snapshots.append(adapter.SourceSnapshot("linear-origin.json", _json(current_origin)))
    key = (
        f"planar-control-{current['control']}"
        if current["kind"] == "control"
        else f"planar-{current['order_id']}"
    )
    query = _query(
        stage="planar",
        query_id=key,
        semantic=semantic,
        commands=commands,
        variables=_variables_for_planar(current),
        snapshots=snapshots,
        timeout_ms=timeout_ms,
        verifier_id="exact-rational-coordinate-replay-with-linear-origin",
    )
    return PreparedQuery(key, "planar", current, current_origin, query)


def verify_planar_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise AdaptiveOrderNraError("planar SAT replay received an invalid engine payload")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != PLANAR_SYSTEM_SCHEMA:
        raise AdaptiveOrderNraError("planar SAT semantic input is malformed")
    system = _validate_planar_system_current(semantic.get("system"))
    origin = semantic.get("linear_origin")
    if system["kind"] == "profile":
        origin = _validate_origin(origin, system["order"])
    elif origin is not None:
        raise AdaptiveOrderNraError("planar control origin drifted")
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = prepare_planar_query(system, origin, timeout_ms=timeout_ms).query
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.descriptor != expected.descriptor
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
        or semantic.get("system_sha256") != _sha_json(system)
        or semantic.get("formula_inventory") != frozen_nra.formula_inventory(system)
        or semantic.get("journal_sha256") != _sha(query.original_smt2)
        or semantic.get("linear_origin_sha256")
        != (None if origin is None else origin["origin_sha256"])
    ):
        raise AdaptiveOrderNraError("planar descriptor, formula, or origin drifted")
    coordinates = frozen_nra.parse_coordinates(values, query.get_values)
    replay = frozen_nra.check_coordinates(system, coordinates)
    evidence = {
        **replay,
        "solver": solver,
        "model_sha256": _sha(model.encode("utf-8")),
        "values_sha256": _sha(values.encode("utf-8")),
        "system_sha256": _sha_json(system),
        "journal_sha256": _sha(query.original_smt2),
        "linear_origin_sha256": None if origin is None else origin["origin_sha256"],
    }
    return adapter.SemanticVerification(bool(replay.get("accepted")), evidence)


SemanticVerifier = Callable[
    [adapter.SourceSemanticQuery, str, str, str | None], adapter.SemanticVerification
]


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise AdaptiveOrderNraError("adapter artifact record is malformed")
    name = record["path"]
    if (
        type(name) is not str
        or not name
        or "/" in name
        or "\\" in name
        or name in seen
    ):
        raise AdaptiveOrderNraError("adapter artifact path is unsafe or duplicated")
    if type(record["bytes"]) is not int or record["bytes"] < 0 or type(record["sha256"]) is not str:
        raise AdaptiveOrderNraError("adapter artifact digest record is malformed")
    payload = _read_regular(root / name)
    if len(payload) != record["bytes"] or _sha(payload) != record["sha256"]:
        raise AdaptiveOrderNraError(f"adapter artifact digest mismatch: {name}")
    seen.add(name)
    return payload


def _validate_engine_custody(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> dict[str, Any]:
    solver = engine["solver"]
    label = (
        f"p97-smt-source/{prepared.query.descriptor['query_id']}/{solver}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}"
    )
    solve_label = "reconciled_solve" if engine["response_lost"] else "solve"
    try:
        session = adapter._validate_session(
            _strict_json(payloads["session"], f"{solver} session"),
            solver=solver,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
        if payloads["smt2"] != prepared.query.journal_smt2:
            raise AdaptiveOrderNraError("exported PIQD journal differs from the query")
        solve = adapter._validate_solve(
            _strict_json(payloads[solve_label], f"{solver} solve"),
            timeout_ms=prepared.query.descriptor["solver_profile"]["timeout_ms"],
            assumptions=prepared.query.assumptions,
            assumption_labels=(),
            named_request=False,
        )
        _before, prior_receipt = adapter._validate_receipts(
            _strict_json(payloads["receipts_before"], f"{solver} prior receipts"),
            session=session,
            query=prepared.query,
            solve=None,
            expected_count=0,
        )
        _receipts, receipt = adapter._validate_receipts(
            _strict_json(payloads["receipts"], f"{solver} receipts"),
            session=session,
            query=prepared.query,
            solve=solve,
            expected_count=1,
        )
        closed = adapter._validate_session(
            _strict_json(payloads["closed_session"], f"{solver} closed session"),
            solver=solver,
            label=label,
            expected_state="closed",
        )
        adapter._validate_closed_session(
            closed, created=session, query=prepared.query, solve=solve
        )
        if "reconciliation_session" in payloads:
            reconciled = adapter._validate_session(
                _strict_json(
                    payloads["reconciliation_session"],
                    f"{solver} reconciliation session",
                ),
                solver=solver,
                label=label,
                expected_state="live",
            )
            adapter._validate_session_frontier(
                reconciled, created=session, query=prepared.query, solve=solve
            )
    except adapter.SmtSourceAdapterError as exc:
        raise AdaptiveOrderNraError(f"{solver} adapter custody failed replay") from exc
    digest = adapter.piqd_result_digest(solve)
    if (
        prior_receipt is not None
        or receipt is None
        or solve["result_sha256"] != digest
        or receipt["result_sha256"] != digest
        or engine.get("session_id") != session["id"]
        or engine.get("solver_signature") != session["solver_signature"]
        or engine.get("solver_sha256") != session["solver_sha256"]
        or engine.get("solve_index") != solve["solve_index"]
        or engine.get("result_sha256") != digest
        or engine.get("reconciled_from_receipt") is not engine.get("response_lost")
        or type(engine.get("reconciliation_attempts")) is not int
        or (
            engine["reconciliation_attempts"] < 1
            if engine["response_lost"]
            else engine["reconciliation_attempts"] != 0
        )
        or engine.get("unsat_assumptions")
        != adapter._unsat_assumption_provenance(prepared.query, solve)
        or engine.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise AdaptiveOrderNraError("adapter engine custody is not cross-bound")
    semantic_payload = payloads.get("semantic")
    if semantic_payload is None:
        if engine.get("semantic_replay") is not None:
            raise AdaptiveOrderNraError("adapter semantic replay artifact is missing")
    else:
        semantic = _strict_json(semantic_payload, f"{solver} semantic replay")
        if (
            set(semantic)
            != {"accepted", "evidence", "verifier", "model_sha256", "values_sha256"}
            or semantic != engine.get("semantic_replay")
            or type(semantic["accepted"]) is not bool
            or type(semantic["evidence"]) is not dict
            or semantic["verifier"]
            != prepared.query.descriptor["semantic_verifier"]
            or semantic["model_sha256"] != _sha(solve["model"].encode("utf-8"))
            or semantic["values_sha256"] != _sha(solve["values"].encode("utf-8"))
        ):
            raise AdaptiveOrderNraError("adapter semantic replay artifact drifted")
    return solve


def verify_adapter_tree(
    prepared: PreparedQuery, output_directory: Path
) -> VerifiedTree:
    """Revalidate the complete immutable PIQD adapter tree from local bytes."""

    try:
        output_info = output_directory.lstat()
    except OSError as exc:
        raise AdaptiveOrderNraError("adapter output directory is missing") from exc
    if not stat.S_ISDIR(output_info.st_mode) or output_directory.is_symlink():
        raise AdaptiveOrderNraError("adapter output path is not a regular directory")
    verifier: SemanticVerifier = (
        verify_linear_sat_model if prepared.stage == "linear" else verify_planar_sat_model
    )
    result_payload = _read_regular(output_directory / "result.json")
    result = _strict_json(result_payload, "adapter result")
    if (
        set(result)
        != {
            "schema", "source_manifest_sha256", "custody", "engines",
            "overall_status", "claims",
        }
        or result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise AdaptiveOrderNraError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor", "original_smt2", "journal_smt2", "manifest", "sources"
    }:
        raise AdaptiveOrderNraError("adapter custody is malformed")
    descriptor = _verify_artifact(output_directory, custody.get("descriptor"), seen)
    original = _verify_artifact(output_directory, custody.get("original_smt2"), seen)
    journal = _verify_artifact(output_directory, custody.get("journal_smt2"), seen)
    manifest_payload = _verify_artifact(output_directory, custody.get("manifest"), seen)
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
    ):
        raise AdaptiveOrderNraError("adapter query custody differs from current producer")
    if result.get("source_manifest_sha256") != _sha(manifest_payload):
        raise AdaptiveOrderNraError("adapter source manifest is not cross-bound")
    manifest = _strict_json(manifest_payload, "adapter source manifest")
    if manifest != adapter._manifest(prepared.query):
        raise AdaptiveOrderNraError("adapter source manifest identity drifted")
    source_records = custody.get("sources")
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise AdaptiveOrderNraError("adapter source custody is malformed")
    for record, expected in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output_directory, record, seen) != expected.payload:
            raise AdaptiveOrderNraError("adapter source snapshot differs from current producer")
    engines = result.get("engines")
    if (
        type(engines) is not list
        or [row.get("solver") for row in engines if type(row) is dict]
        != list(adapter.SOLVERS)
    ):
        raise AdaptiveOrderNraError("adapter engine list is malformed")
    for engine in engines:
        if (
            type(engine) is not dict
            or set(engine)
            != {
                "solver", "session_id", "solver_signature", "solver_sha256",
                "raw_status", "effective_status", "solve_index", "result_sha256",
                "response_lost", "reconciled_from_receipt",
                "reconciliation_attempts", "result_digest_advisory",
                "unsat_assumptions", "semantic_replay", "artifacts", "claims",
            }
            or engine.get("raw_status") not in {"SAT", "UNSAT", "UNKNOWN"}
        ):
            raise AdaptiveOrderNraError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise AdaptiveOrderNraError("adapter engine artifacts are malformed")
        try:
            frozen_order._validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise AdaptiveOrderNraError("adapter engine artifact labels drifted") from exc
        payloads = {
            label: _verify_artifact(output_directory, record, seen)
            for label, record in artifacts.items()
        }
        solve = _validate_engine_custody(prepared, engine, payloads)
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if (
            solve.get("status") != engine["raw_status"]
            or engine.get("result_sha256") != digest
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != digest
            or advisory.get("matches_daemon") is not True
        ):
            raise AdaptiveOrderNraError("adapter solve digest is inconsistent")
        raw = solve["status"]
        effective = engine.get("effective_status")
        if raw == "SAT":
            replay = solve.get("model_replay")
            allowed = (
                {"SATISFIED", "UNDETERMINED"}
                if prepared.stage == "linear"
                else {"SATISFIED"}
            )
            if type(replay) is not dict or replay.get("outcome") not in allowed:
                raise AdaptiveOrderNraError(
                    f"{prepared.stage} SAT has an inadmissible daemon model replay"
                )
            verification = verifier(
                prepared.query, engine["solver"], solve.get("model"), solve.get("values")
            )
            semantic = engine.get("semantic_replay")
            if (
                effective != "SAT_SEMANTICALLY_REPLAYED"
                or not verification.accepted
                or type(semantic) is not dict
                or semantic.get("accepted") is not True
                or semantic.get("evidence") != verification.evidence
            ):
                raise AdaptiveOrderNraError("SAT exact semantic replay does not revalidate")
        elif raw == "UNSAT" and effective != "UNSAT_DISCOVERY_ONLY":
            raise AdaptiveOrderNraError("UNSAT discovery classification drifted")
        elif raw == "UNKNOWN" and effective != "INCONCLUSIVE_UNKNOWN":
            raise AdaptiveOrderNraError("UNKNOWN classification drifted")
    effective_statuses = [row.get("effective_status") for row in engines]
    raw_statuses = [row.get("raw_status") for row in engines]
    expected_overall = (
        "INCONCLUSIVE"
        if any(isinstance(item, str) and item.startswith("INCONCLUSIVE") for item in effective_statuses)
        else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        if len(set(raw_statuses)) != 1
        else "FINITE_DIAGNOSTIC_COMPLETE"
    )
    if result.get("overall_status") != expected_overall:
        raise AdaptiveOrderNraError("adapter overall status is inconsistent")
    entries = tuple(output_directory.iterdir())
    if any(
        entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        for entry in entries
    ):
        raise AdaptiveOrderNraError("adapter output contains a non-regular artifact")
    if {entry.name for entry in entries} != seen:
        raise AdaptiveOrderNraError("adapter output contains unbound artifacts")
    return VerifiedTree(_sha(prepared.query.descriptor_bytes), result, _sha(result_payload))


def _origin_from_engine(
    prepared: PreparedQuery,
    verified: VerifiedTree,
    engine: Mapping[str, Any],
    order: tuple[str, ...],
) -> dict[str, Any]:
    semantic = engine["semantic_replay"]
    evidence = semantic["evidence"]
    origin = {
        "schema": LINEAR_ORIGIN_SCHEMA,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "linear_query_id": prepared.query.descriptor["query_id"],
        "linear_query_sha256": verified.prepared_query_sha256,
        "linear_result_sha256": verified.result_sha256,
        "linear_solver": engine["solver"],
        "linear_engine_sha256": _sha_json(engine),
        "linear_semantic_replay_sha256": _sha_json(semantic),
        "model_sha256": evidence["model_sha256"],
        "values_sha256": evidence["values_sha256"],
        "order": list(order),
        "order_sha256": order_sha256(order),
    }
    origin["origin_sha256"] = _self_hash(origin, "origin_sha256")
    return origin


def extract_fresh_witnesses(
    prepared: PreparedQuery, verified: VerifiedTree
) -> tuple[LinearWitness, ...]:
    """Extract only locally reverified exact SAT orders, in engine order."""

    if prepared.stage != "linear" or prepared.system["kind"] != "profile":
        raise AdaptiveOrderNraError("fresh orders require the structural target query")
    if verified.prepared_query_sha256 != _sha(prepared.query.descriptor_bytes):
        raise AdaptiveOrderNraError("verified structural result belongs to another query")
    blocked = set(initial_blocked_orders())
    seen = set(blocked)
    answer: list[LinearWitness] = []
    for engine in verified.result["engines"]:
        if engine.get("raw_status") != "SAT":
            continue
        semantic = engine.get("semantic_replay")
        if type(semantic) is not dict or semantic.get("accepted") is not True:
            raise AdaptiveOrderNraError("structural SAT lacks accepted exact replay")
        evidence = semantic.get("evidence")
        if type(evidence) is not dict:
            raise AdaptiveOrderNraError("structural SAT exact replay evidence is missing")
        order = _validate_order(
            evidence.get("order"),
            _class_ids(prepared.system["base_system"]),
            where="exact SAT fresh order",
        )
        if evidence.get("order_sha256") != order_sha256(order) or order in blocked:
            raise AdaptiveOrderNraError("structural SAT order violates its enumeration controls")
        if order in seen:
            continue
        seen.add(order)
        answer.append(
            LinearWitness(
                order,
                engine["solver"],
                _origin_from_engine(prepared, verified, engine, order),
            )
        )
        if len(answer) == MAX_FRESH_ORDERS:
            break
    return tuple(answer)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT).as_posix()
    except ValueError as exc:
        raise AdaptiveOrderNraError("governed source escaped the repository") from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return dict(sorted((_repo_path(path), _sha(_read_regular(path))) for path in paths))


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    expected_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    expected_keys = {
        "schema", "lane_id", "owner", "base_head", "owned_paths",
        "generated_roots", "durable_paths", "created_utc", "manifest_sha256",
    }
    if (
        set(checkpoint) != expected_keys
        or checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != "codex-rigid221"
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [expected_root]
        or checkpoint.get("durable_paths") != []
        or type(checkpoint.get("base_head")) is not str
        or re.fullmatch(r"[0-9a-f]{40}|[0-9a-f]{64}", checkpoint["base_head"])
        is None
        or type(checkpoint.get("created_utc")) is not str
        or re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z", checkpoint["created_utc"])
        is None
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise AdaptiveOrderNraError(
            "lane checkpoint is unauthenticated or does not govern this run"
        )
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    runner = REPOSITORY_ROOT / "scripts" / "run_exactfive_hard_source_swap_adaptive_order_nra_piqd.py"
    sources = _source_digest_map(
        (
            Path(__file__),
            runner,
            Path(frozen_order.__file__),
            Path(frozen_nra.__file__),
            Path(frozen_order.alias_grid.__file__),
            Path(adapter.__file__),
        )
    )
    inputs = _source_digest_map((CHECKPOINT_PATH, SPEC_PATH))
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": sources,
        "input_digests": inputs,
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            path,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o400,
        )
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise AdaptiveOrderNraError("short immutable artifact write")
            view = view[written:]
        os.fsync(descriptor)
    except FileExistsError as exc:
        raise AdaptiveOrderNraError(f"immutable artifact already exists: {path}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    manifest_path = RUN_ROOT / "run_manifest.json"
    if not RUN_ROOT.exists():
        RUN_ROOT.mkdir(parents=True, mode=0o700)
        for name in ("artifacts", "events", "tmp"):
            (RUN_ROOT / name).mkdir(mode=0o700)
        _create_once(manifest_path, _json(_expected_run_manifest(_utc_now())))
    if not RUN_ROOT.is_dir() or RUN_ROOT.is_symlink():
        raise AdaptiveOrderNraError("governed run root is unsafe")
    manifest = _strict_json(_read_regular(manifest_path), "run manifest")
    created = manifest.get("created_utc")
    if type(created) is not str or manifest != _expected_run_manifest(created):
        raise AdaptiveOrderNraError("run manifest or governed source digest drifted")
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        if not path.is_dir() or path.is_symlink():
            raise AdaptiveOrderNraError("run output class is unsafe")
    root_entries = tuple(RUN_ROOT.iterdir())
    if {entry.name for entry in root_entries} != {
        "run_manifest.json", "artifacts", "events", "tmp"
    }:
        raise AdaptiveOrderNraError("governed run root contains an unbound entry")
    if tuple((RUN_ROOT / "tmp").iterdir()):
        raise AdaptiveOrderNraError("governed run tmp directory is not empty")
    event_entries = tuple((RUN_ROOT / "events").iterdir())
    if any(
        entry.name not in {"launch.json", "terminal.json"}
        or entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        for entry in event_entries
    ):
        raise AdaptiveOrderNraError("governed run events contain an unbound entry")
    return RUN_ROOT, manifest


def _launch_record(
    root: Path, *, server: str, timeout_ms: int, workers: int
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": _sha(_read_regular(root / "run_manifest.json")),
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "rounds": 1,
        "max_fresh_orders": MAX_FRESH_ORDERS,
        "initial_blocks": [list(order) for order in initial_blocked_orders()],
        "initial_block_sha256": [order_sha256(order) for order in initial_blocked_orders()],
        "workers": workers,
        "timeout_ms": timeout_ms,
        "server": server,
        "query_plan": [
            "linear-control-positive", "linear-control-negative",
            "planar-control-positive", "planar-control-negative",
            "linear-profile-1697", "planar-fresh-orders-at-most-two",
        ],
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _execute_or_resume(
    prepared: PreparedQuery,
    output_directory: Path,
    *,
    transport: adapter.PiqdTransport,
) -> VerifiedTree:
    if output_directory.exists():
        return verify_adapter_tree(prepared, output_directory)
    adapter.run_source_semantic_query(
        prepared.query,
        output_directory,
        transport,
        verify_linear_sat_model if prepared.stage == "linear" else verify_planar_sat_model,
    )
    return verify_adapter_tree(prepared, output_directory)


def _require_control(verified: VerifiedTree, expected: str, key: str) -> None:
    statuses = [row.get("raw_status") for row in verified.result.get("engines", [])]
    if statuses != [expected, expected]:
        raise AdaptiveOrderNraError(f"control {key} did not produce {expected}/{expected}")


def _result_record(verified: VerifiedTree) -> dict[str, Any]:
    return {
        "result_sha256": verified.result_sha256,
        "overall_status": verified.result.get("overall_status"),
        "engines": [
            {
                "solver": row.get("solver"),
                "raw_status": row.get("raw_status"),
                "effective_status": row.get("effective_status"),
            }
            for row in verified.result.get("engines", [])
        ],
    }


def _classify_terminal(
    structural: VerifiedTree, planar: Sequence[VerifiedTree], fresh_count: int
) -> tuple[str, str]:
    structural_raw = [row["raw_status"] for row in structural.result["engines"]]
    if "UNKNOWN" in structural_raw:
        return "STRUCTURAL_UNKNOWN", "UNKNOWN"
    if len(set(structural_raw)) != 1:
        return "STRUCTURAL_DISAGREEMENT", "DISAGREEMENT"
    if fresh_count == 0:
        return "NO_FRESH_SAT", "NO_FRESH_SAT"
    planar_raw = [
        [row["raw_status"] for row in result.result["engines"]] for result in planar
    ]
    if any("UNKNOWN" in pair for pair in planar_raw):
        return "PLANAR_UNKNOWN", "UNKNOWN"
    if any(len(set(pair)) != 1 for pair in planar_raw):
        return "PLANAR_DISAGREEMENT", "DISAGREEMENT"
    return "TARGET_RESULTS", "TARGET_RESULTS"


def _terminal_record(
    *,
    launch: Mapping[str, Any],
    controls: Mapping[str, VerifiedTree],
    structural: VerifiedTree,
    witnesses: Sequence[LinearWitness],
    planar: Mapping[str, VerifiedTree],
) -> dict[str, Any]:
    status, status_class = _classify_terminal(
        structural, tuple(planar.values()), len(witnesses)
    )
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": status,
        "status_class": status_class,
        "rounds_completed": 1,
        "controls": {key: _result_record(value) for key, value in sorted(controls.items())},
        "structural": _result_record(structural),
        "fresh_witnesses": [
            {"solver": witness.solver, "order": list(witness.order), "origin": witness.origin}
            for witness in witnesses
        ],
        "planar_targets": {key: _result_record(value) for key, value in sorted(planar.items())},
        "claim_boundary": "diagnostic fixed order cells only",
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict_json(_read_regular(path), "terminal record")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
        or terminal.get("status")
        not in {
            "NO_FRESH_SAT", "TARGET_RESULTS", "STRUCTURAL_UNKNOWN",
            "STRUCTURAL_DISAGREEMENT", "PLANAR_UNKNOWN", "PLANAR_DISAGREEMENT",
        }
    ):
        raise AdaptiveOrderNraError("terminal record is malformed")
    return terminal


def _verify_completed_terminal(
    root: Path, launch: Mapping[str, Any], terminal: Mapping[str, Any], timeout_ms: int
) -> dict[str, Any]:
    if (
        terminal.get("run_manifest_sha256") != launch["run_manifest_sha256"]
        or terminal.get("launch_sha256") != launch["launch_sha256"]
    ):
        raise AdaptiveOrderNraError("terminal custody links drifted")
    controls: dict[str, VerifiedTree] = {}
    for stage in ("linear", "planar"):
        for control in CONTROL_IDS:
            key = f"{stage}-control-{control}"
            prepared = (
                prepare_linear_query(build_linear_system(control), timeout_ms=timeout_ms)
                if stage == "linear"
                else prepare_planar_query(build_planar_system(control=control), timeout_ms=timeout_ms)
            )
            verified = verify_adapter_tree(prepared, root / "artifacts" / key)
            _require_control(verified, "SAT" if control == "positive" else "UNSAT", key)
            controls[key] = verified
    structural_prepared = prepare_linear_query(timeout_ms=timeout_ms)
    structural = verify_adapter_tree(
        structural_prepared, root / "artifacts" / structural_prepared.key
    )
    witnesses = extract_fresh_witnesses(structural_prepared, structural)
    stored = terminal.get("fresh_witnesses")
    expected_stored = [
        {"solver": witness.solver, "order": list(witness.order), "origin": witness.origin}
        for witness in witnesses
    ]
    if stored != expected_stored:
        raise AdaptiveOrderNraError("terminal fresh witness custody drifted")
    planar: dict[str, VerifiedTree] = {}
    for witness in witnesses:
        prepared = prepare_planar_query(
            build_planar_system(witness.order), witness.origin, timeout_ms=timeout_ms
        )
        planar[prepared.key] = verify_adapter_tree(
            prepared, root / "artifacts" / prepared.key
        )
    expected = _terminal_record(
        launch=launch,
        controls=controls,
        structural=structural,
        witnesses=witnesses,
        planar=planar,
    )
    if terminal != expected:
        raise AdaptiveOrderNraError("terminal summary differs from artifact replay")
    expected_dirs = {*controls, structural_prepared.key, *planar}
    artifact_entries = tuple((root / "artifacts").iterdir())
    if any(not path.is_dir() or path.is_symlink() for path in artifact_entries):
        raise AdaptiveOrderNraError("artifact root contains an unsafe entry")
    if {path.name for path in artifact_entries} != expected_dirs:
        raise AdaptiveOrderNraError("artifact root contains partial or unbound output")
    return dict(terminal)


def run_census(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = 60.0,
    workers: int = 2,
) -> dict[str, Any]:
    """Run or exactly resume the single bounded adaptive canary round."""

    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= MAX_WORKERS:
        raise AdaptiveOrderNraError("workers must lie in 1..2")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3_600
        or not float(timeout_s * 1_000).is_integer()
    ):
        raise AdaptiveOrderNraError("timeout must be an exact millisecond value in (0,3600]")
    timeout_ms = int(timeout_s * 1_000)
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise AdaptiveOrderNraError("invalid PIQD server URL")
    root, _manifest = ensure_run_root()
    launch = _launch_record(root, server=server, timeout_ms=timeout_ms, workers=workers)
    launch_path = root / "events" / "launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch record") != launch:
            raise AdaptiveOrderNraError("launch record differs on resume")
    else:
        _create_once(launch_path, _json(launch))
    terminal_path = root / "events" / "terminal.json"
    if terminal_path.exists():
        return _verify_completed_terminal(
            root, launch, _read_terminal(terminal_path), timeout_ms
        )
    transport = adapter.UrllibPiqdTransport(
        server, http_timeout_s=adapter.bounded_solve_http_timeout_s(timeout_ms)
    )
    controls: dict[str, VerifiedTree] = {}
    for control in CONTROL_IDS:
        prepared = prepare_linear_query(
            build_linear_system(control), timeout_ms=timeout_ms
        )
        verified = _execute_or_resume(
            prepared, root / "artifacts" / prepared.key, transport=transport
        )
        _require_control(verified, "SAT" if control == "positive" else "UNSAT", prepared.key)
        controls[prepared.key] = verified
    for control in CONTROL_IDS:
        prepared = prepare_planar_query(
            build_planar_system(control=control), timeout_ms=timeout_ms
        )
        verified = _execute_or_resume(
            prepared, root / "artifacts" / prepared.key, transport=transport
        )
        _require_control(verified, "SAT" if control == "positive" else "UNSAT", prepared.key)
        controls[prepared.key] = verified
    structural_prepared = prepare_linear_query(timeout_ms=timeout_ms)
    structural = _execute_or_resume(
        structural_prepared,
        root / "artifacts" / structural_prepared.key,
        transport=transport,
    )
    witnesses = extract_fresh_witnesses(structural_prepared, structural)

    def execute(witness: LinearWitness) -> tuple[str, VerifiedTree]:
        prepared = prepare_planar_query(
            build_planar_system(witness.order), witness.origin, timeout_ms=timeout_ms
        )
        return prepared.key, _execute_or_resume(
            prepared, root / "artifacts" / prepared.key, transport=transport
        )

    planar: dict[str, VerifiedTree] = {}
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=min(workers, max(1, len(witnesses)))
    ) as pool:
        for key, value in pool.map(execute, witnesses):
            planar[key] = value
    terminal = _terminal_record(
        launch=launch,
        controls=controls,
        structural=structural,
        witnesses=witnesses,
        planar=planar,
    )
    _create_once(terminal_path, _json(terminal))
    return _verify_completed_terminal(root, launch, terminal, timeout_ms)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=60.0)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_census(
            server=args.server, timeout_s=args.timeout, workers=args.workers
        )
    except (AdaptiveOrderNraError, adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "INITIAL_BLOCKED_ORDERS",
    "MAX_FRESH_ORDERS",
    "MAX_WORKERS",
    "PLANAR_SYSTEM_SCHEMA",
    "PROFILE_INDEX",
    "PROFILE_SHA256",
    "AdaptiveOrderNraError",
    "LinearWitness",
    "PreparedQuery",
    "VerifiedTree",
    "build_linear_smt_commands",
    "build_linear_system",
    "build_planar_system",
    "extract_fresh_witnesses",
    "initial_blocked_orders",
    "linear_formula_inventory",
    "linear_smt_journal",
    "order_block_command",
    "order_sha256",
    "prepare_linear_query",
    "prepare_planar_query",
    "replay_linear_assignment",
    "run_census",
    "verify_adapter_tree",
    "verify_linear_sat_model",
    "verify_planar_sat_model",
]
