"""Complete abstract order/equality PIQD queries for branch-D source swaps.

This module deliberately stops at a finite, source-labelled abstraction.  It
quotients the 15 named roles by one of the alias profiles emitted by
``exactfive_hard_source_swap_grid`` and asks whether a cyclic rank order and
positive abstract pair distances satisfy all row equalities, the proved source
strict inequality, and every strict Kalmanson inequality.

No solver is invoked on import.  The runner at
``scripts/run_exactfive_hard_source_swap_order_piqd.py`` is the only production
entrypoint and sends queries through PIQD.
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
from collections import Counter
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from functools import lru_cache
from pathlib import Path
from typing import Any, Literal

from census.card_head import exactfive_hard_source_swap_grid as alias_grid
from census.p97_search import phase3_piqd_smt_source_adapter as piqd_adapter

LANE_ID = "exactfive-hard-source-swap-order-piqd-20260902"
RUN_ID = "run-0001"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-order-piqd-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-hard-source-swap-order-piqd-terminal/v1"
SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-order-system/v1"
SOURCE_RECORD_SCHEMA = "p97-exactfive-hard-source-swap-order-source/v1"
PRODUCER_VERSION = "p97-exactfive-hard-source-swap-order-piqd/v1"
EXPECTED_PROFILE_COUNT = 2_798
MAX_WORKERS = 20
MAX_JSON_BYTES = 96 * 1024 * 1024
MAX_SEXPR_BYTES = 64 * 1024 * 1024
MAX_SEXPR_TOKENS = 500_000
MAX_SEXPR_DEPTH = 128
DEFAULT_SERVER = "http://127.0.0.1:7272"

REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID

FALSE_CLAIMS = {
    "alias_exhaustiveness_in_lean": False,
    "live_closure": False,
    "promotion": False,
    "source_realizability_of_sat": False,
    "theorem": False,
}

ROWS = (
    {"id": "T0", "center": "O", "support": ("a", "d", "c1", "p", "q")},
    {"id": "K1", "center": "c1", "support": ("O", "a", "s", "t")},
    {"id": "K2", "center": "c2", "support": ("O", "a", "u", "v")},
    {"id": "L", "center": "c2", "support": ("d", "e", "x", "y")},
)
FIXED_GROUPS = {
    "I2": frozenset(("u", "v", "x", "y")),
    "O": frozenset(("O",)),
    "Is": frozenset(("e",)),
    "c2": frozenset(("c2",)),
    "I1": frozenset(("a", "d")),
}
DIRECT_GROUP_ORDER = ("I2", "O", "Is", "c2", "I1")
MIRROR_GROUP_ORDER = ("I1", "c2", "Is", "O", "I2")
CONTROL_IDS = ("positive", "negative")

_HEX64 = re.compile(r"^[0-9a-f]{64}$")
_INTEGER = re.compile(r"^-?(?:0|[1-9][0-9]*)$")
_DECIMAL = re.compile(r"^-?(?:0|[1-9][0-9]*)\.[0-9]+$")


class HardSourceSwapOrderPiqdError(RuntimeError):
    """The query, exact replay, or governed artifact tree failed closed."""


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("ascii")


def _json_bytes(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _sha_json(value: object) -> str:
    return _sha(_canonical(value))


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _validate_utc(value: object, where: str) -> str:
    if type(value) is not str or not value.endswith("Z"):
        raise HardSourceSwapOrderPiqdError(f"{where} is not a UTC timestamp")
    try:
        parsed = datetime.fromisoformat(value)
    except ValueError as exc:
        raise HardSourceSwapOrderPiqdError(f"{where} is not ISO-8601") from exc
    if parsed.utcoffset() != UTC.utcoffset(parsed):
        raise HardSourceSwapOrderPiqdError(f"{where} is not UTC")
    return value


def normalize_workers(value: int) -> int:
    """Validate a requested worker count and cap it at the authorized 20."""

    if type(value) is not int or value < 1:
        raise HardSourceSwapOrderPiqdError("workers must be a positive integer")
    return min(value, MAX_WORKERS)


@lru_cache(maxsize=1)
def indexed_profiles() -> tuple[tuple[int, alias_grid.SourceAliasProfile], ...]:
    profiles = tuple(enumerate(alias_grid.iter_source_alias_profiles()))
    if len(profiles) != EXPECTED_PROFILE_COUNT:
        raise HardSourceSwapOrderPiqdError(
            "source alias profile count drifted from the reviewed 2,798-profile stream"
        )
    if len({profile.profile_id for _index, profile in profiles}) != len(profiles):
        raise HardSourceSwapOrderPiqdError("source alias profile hashes are not unique")
    return profiles


def select_profiles(
    *,
    indices: Sequence[int] = (),
    profile_hashes: Sequence[str] = (),
    limit: int | None = None,
) -> tuple[tuple[int, alias_grid.SourceAliasProfile], ...]:
    """Select a deterministic, index-sorted subset of the frozen profile stream."""

    if indices and profile_hashes:
        raise HardSourceSwapOrderPiqdError(
            "profile indices and profile hashes are mutually exclusive"
        )
    if limit is not None and (type(limit) is not int or limit < 1):
        raise HardSourceSwapOrderPiqdError("limit must be a positive integer")
    profiles = indexed_profiles()
    if indices:
        if any(type(index) is not int for index in indices):
            raise HardSourceSwapOrderPiqdError("profile indices must be exact integers")
        wanted = sorted(set(indices))
        if wanted and (wanted[0] < 0 or wanted[-1] >= len(profiles)):
            raise HardSourceSwapOrderPiqdError("profile index is out of range")
        selected = tuple(profiles[index] for index in wanted)
    elif profile_hashes:
        if any(
            type(item) is not str or _HEX64.fullmatch(item) is None
            for item in profile_hashes
        ):
            raise HardSourceSwapOrderPiqdError(
                "profile hashes must be lowercase 64-hex strings"
            )
        by_hash = {profile.profile_id: (index, profile) for index, profile in profiles}
        missing = sorted(set(profile_hashes) - set(by_hash))
        if missing:
            raise HardSourceSwapOrderPiqdError(f"unknown profile hash: {missing[0]}")
        selected = tuple(
            sorted(
                (by_hash[item] for item in set(profile_hashes)), key=lambda row: row[0]
            )
        )
    else:
        selected = profiles
    return selected if limit is None else selected[:limit]


def _class_id(index: int) -> str:
    return f"c{index:03d}"


def _rank_term(class_id: str) -> str:
    return f"rank_{class_id}"


def _distance_term(left: str, right: str) -> str:
    if left == right:
        return "0"
    first, second = sorted((left, right))
    return f"dist_{first}_{second}"


def _role_to_class(classes: Sequence[Sequence[str]]) -> dict[str, str]:
    answer: dict[str, str] = {}
    for index, klass in enumerate(classes):
        for role in klass:
            if role in answer:
                raise HardSourceSwapOrderPiqdError(
                    "role occurs in two quotient classes"
                )
            answer[role] = _class_id(index)
    return answer


def _fixed_class_groups(
    classes: Sequence[Sequence[str]],
) -> dict[str, tuple[str, ...]]:
    grouped: dict[str, list[str]] = {name: [] for name in FIXED_GROUPS}
    for index, klass in enumerate(classes):
        present = [name for name, roles in FIXED_GROUPS.items() if set(klass) & roles]
        if len(present) > 1:
            raise HardSourceSwapOrderPiqdError(
                f"quotient class mixes incompatible cap-skeleton roles: {tuple(klass)}"
            )
        if present:
            grouped[present[0]].append(_class_id(index))
    if any(not grouped[name] for name in FIXED_GROUPS):
        raise HardSourceSwapOrderPiqdError("cap skeleton lost a fixed role group")
    return {name: tuple(values) for name, values in grouped.items()}


@lru_cache(maxsize=1)
def profile_stream_sha256() -> str:
    return _sha_json(
        [
            {"index": index, "profile_sha256": profile.profile_id}
            for index, profile in indexed_profiles()
        ]
    )


def build_profile_system(
    index: int, profile: alias_grid.SourceAliasProfile
) -> dict[str, Any]:
    """Build the exact JSON semantic system for one alias quotient."""

    if type(index) is not int or index < 0:
        raise HardSourceSwapOrderPiqdError("profile index must be nonnegative")
    alias_grid.validate_source_alias_profile(profile)
    if profile.profile_id != profile.payload()["profile_sha256"]:
        raise HardSourceSwapOrderPiqdError("profile hash is inconsistent")
    classes = tuple(tuple(klass) for klass in profile.classes)
    role_class = _role_to_class(classes)
    if set(role_class) != set(alias_grid.ALIAS_ROLES):
        raise HardSourceSwapOrderPiqdError("quotient does not cover every source role")
    groups = _fixed_class_groups(classes)
    anchor = role_class["U"]
    if any(anchor in values for values in groups.values()):
        raise HardSourceSwapOrderPiqdError(
            "U aliases an incompatible fixed skeleton role"
        )
    system = {
        "schema": SYSTEM_SCHEMA,
        "kind": "profile",
        "profile_index": index,
        "profile_sha256": profile.profile_id,
        "profile_stream_sha256": profile_stream_sha256(),
        "profile": profile.payload(),
        "classes": [
            {"id": _class_id(class_index), "roles": list(klass)}
            for class_index, klass in enumerate(classes)
        ],
        "role_class": role_class,
        "anchor_class": anchor,
        "fixed_class_groups": {name: list(groups[name]) for name in FIXED_GROUPS},
        "rows": [
            {"id": row["id"], "center": row["center"], "support": list(row["support"])}
            for row in ROWS
        ],
        "radius_disequality": {
            "center": "c2",
            "old_support": "O",
            "replacement_support": "d",
        },
        "source_strict": {
            "positive": ["e", "a"],
            "negative": ["e", "d"],
            "relation": ">",
        },
        "rank_pins": {},
        "distance_pins": {},
        "claims": dict(FALSE_CLAIMS),
    }
    return system


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    """Return a hand-checkable four-class Kalmanson smoke-control system."""

    if control not in CONTROL_IDS:
        raise HardSourceSwapOrderPiqdError("unknown control")
    classes = [
        {"id": _class_id(index), "roles": [role]}
        for index, role in enumerate(("A", "B", "C", "D"))
    ]
    distances: dict[str, str] = {}
    for left, right in itertools.combinations(("c000", "c001", "c002", "c003"), 2):
        crossing = {left, right} in ({"c000", "c002"}, {"c001", "c003"})
        value = 3 if control == "positive" and crossing else 1
        distances[_distance_term(left, right)] = str(value)
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "control": control,
        "classes": classes,
        "role_class": {role: row["id"] for row in classes for role in row["roles"]},
        "anchor_class": "c000",
        "fixed_class_groups": {},
        "rows": [],
        "radius_disequality": None,
        "source_strict": None,
        "rank_pins": {_rank_term(_class_id(index)): str(index) for index in range(4)},
        "distance_pins": distances,
        "claims": dict(FALSE_CLAIMS),
    }


def _class_ids(system: Mapping[str, Any]) -> tuple[str, ...]:
    classes = system.get("classes")
    if type(classes) is not list or not classes:
        raise HardSourceSwapOrderPiqdError("system classes are malformed")
    ids: list[str] = []
    for index, row in enumerate(classes):
        if type(row) is not dict or set(row) != {"id", "roles"}:
            raise HardSourceSwapOrderPiqdError("system class record is malformed")
        expected = _class_id(index)
        if row["id"] != expected or type(row["roles"]) is not list or not row["roles"]:
            raise HardSourceSwapOrderPiqdError("system classes are not canonical")
        ids.append(expected)
    return tuple(ids)


def _system_role_class(system: Mapping[str, Any]) -> dict[str, str]:
    value = system.get("role_class")
    if type(value) is not dict or any(
        type(role) is not str or type(class_id) is not str
        for role, class_id in value.items()
    ):
        raise HardSourceSwapOrderPiqdError("role-to-class map is malformed")
    return dict(value)


def _between_term(point: str, left: str, right: str) -> str:
    p, a, b = (_rank_term(item) for item in (point, left, right))
    return f"(or (and (< {a} {p}) (< {p} {b})) (and (< {b} {p}) (< {p} {a})))"


def alternation_term(first: tuple[str, str], second: tuple[str, str]) -> str:
    """Cut-independent chord alternation over the rank variables."""

    a, b = first
    c, d = second
    return f"(xor {_between_term(c, a, b)} {_between_term(d, a, b)})"


def quartet_matchings(
    quartet: Sequence[str],
) -> tuple[tuple[tuple[str, str], tuple[str, str]], ...]:
    if len(quartet) != 4 or len(set(quartet)) != 4:
        raise HardSourceSwapOrderPiqdError("a Kalmanson quartet needs four classes")
    a, b, c, d = quartet
    return (
        ((a, b), (c, d)),
        ((a, c), (b, d)),
        ((a, d), (b, c)),
    )


def _matching_sum_term(matching: tuple[tuple[str, str], tuple[str, str]]) -> str:
    return f"(+ {_distance_term(*matching[0])} {_distance_term(*matching[1])})"


def _kalmanson_assertion(quartet: Sequence[str]) -> str:
    if len(quartet) != 4 or len(set(quartet)) != 4:
        raise HardSourceSwapOrderPiqdError("a Kalmanson quartet needs four classes")
    a, b, c, d = quartet
    arguments = (
        _rank_term(a),
        _rank_term(b),
        _rank_term(c),
        _rank_term(d),
        _distance_term(a, b),
        _distance_term(a, c),
        _distance_term(a, d),
        _distance_term(b, c),
        _distance_term(b, d),
        _distance_term(c, d),
    )
    return f"(assert (strict_kalmanson_quartet {' '.join(arguments)}))"


_STRICTLY_BETWEEN_DEFINITION = (
    "(define-fun strictly_between ((x Int) (a Int) (b Int)) Bool "
    "(or (and (< a x) (< x b)) (and (< b x) (< x a))))"
)
_CHORDS_ALTERNATE_DEFINITION = (
    "(define-fun chords_alternate_rank ((a Int) (b Int) (c Int) (d Int)) Bool "
    "(xor (strictly_between c a b) (strictly_between d a b)))"
)
_STRICT_KALMANSON_DEFINITION = (
    "(define-fun strict_kalmanson_quartet "
    "((r0 Int) (r1 Int) (r2 Int) (r3 Int) "
    "(d01 Real) (d02 Real) (d03 Real) (d12 Real) (d13 Real) (d23 Real)) Bool "
    "(or "
    "(and (chords_alternate_rank r0 r1 r2 r3) "
    "(> (+ d01 d23) (+ d02 d13)) (> (+ d01 d23) (+ d03 d12))) "
    "(and (chords_alternate_rank r0 r2 r1 r3) "
    "(> (+ d02 d13) (+ d01 d23)) (> (+ d02 d13) (+ d03 d12))) "
    "(and (chords_alternate_rank r0 r3 r1 r2) "
    "(> (+ d03 d12) (+ d01 d23)) (> (+ d03 d12) (+ d02 d13)))))"
)


def _skeleton_term(system: Mapping[str, Any]) -> str:
    groups_raw = system.get("fixed_class_groups")
    if type(groups_raw) is not dict or set(groups_raw) != set(FIXED_GROUPS):
        raise HardSourceSwapOrderPiqdError("fixed class groups are malformed")
    groups = {name: tuple(groups_raw[name]) for name in FIXED_GROUPS}

    def branch(order: Sequence[str]) -> str:
        pieces: list[str] = []
        for left_name, right_name in itertools.pairwise(order):
            for left in groups[left_name]:
                for right in groups[right_name]:
                    pieces.append(f"(< {_rank_term(left)} {_rank_term(right)})")
        return f"(and {' '.join(pieces)})"

    return f"(or {branch(DIRECT_GROUP_ORDER)} {branch(MIRROR_GROUP_ORDER)})"


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    class_ids = _class_ids(system)
    quartets = math.comb(len(class_ids), 4)
    rows = system.get("rows")
    if type(rows) is not list:
        raise HardSourceSwapOrderPiqdError("rows are malformed")
    row_equalities = sum(len(row["support"]) - 1 for row in rows)
    return {
        "classes": len(class_ids),
        "rank_variables": len(class_ids),
        "distance_variables": math.comb(len(class_ids), 2),
        "row_equalities": row_equalities,
        "quartets": quartets,
        "kalmanson_conditional_cases": 3 * quartets,
        "kalmanson_triggered_strict_forms": 2 * quartets,
    }


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    """Emit a deterministic complete QF_LIRA state journal."""

    class_ids = _class_ids(system)
    role_class = _system_role_class(system)
    commands: list[str] = [
        "(set-logic QF_LIRA)",
        _STRICTLY_BETWEEN_DEFINITION,
        _CHORDS_ALTERNATE_DEFINITION,
        _STRICT_KALMANSON_DEFINITION,
    ]
    commands.extend(f"(declare-const {_rank_term(item)} Int)" for item in class_ids)
    pairs = tuple(itertools.combinations(class_ids, 2))
    commands.extend(f"(declare-const {_distance_term(*pair)} Real)" for pair in pairs)
    maximum = len(class_ids) - 1
    commands.extend(
        f"(assert (and (<= 0 {_rank_term(item)}) (<= {_rank_term(item)} {maximum})))"
        for item in class_ids
    )
    commands.append(
        f"(assert (distinct {' '.join(_rank_term(item) for item in class_ids)}))"
    )
    anchor = system.get("anchor_class")
    if anchor not in class_ids:
        raise HardSourceSwapOrderPiqdError("rank anchor is not a quotient class")
    commands.append(f"(assert (= {_rank_term(anchor)} 0))")
    if system.get("kind") == "profile":
        commands.append(f"(assert {_skeleton_term(system)})")
    elif system.get("kind") != "control":
        raise HardSourceSwapOrderPiqdError("unknown system kind")
    commands.extend(f"(assert (> {_distance_term(*pair)} 0))" for pair in pairs)

    rows = system.get("rows")
    if type(rows) is not list:
        raise HardSourceSwapOrderPiqdError("rows are malformed")
    for row in rows:
        center = role_class[row["center"]]
        support = tuple(role_class[role] for role in row["support"])
        base = _distance_term(center, support[0])
        commands.extend(
            f"(assert (= {base} {_distance_term(center, item)}))"
            for item in support[1:]
        )

    disequality = system.get("radius_disequality")
    if disequality is not None:
        center = role_class[disequality["center"]]
        old = role_class[disequality["old_support"]]
        replacement = role_class[disequality["replacement_support"]]
        commands.append(
            f"(assert (distinct {_distance_term(center, old)} "
            f"{_distance_term(center, replacement)}))"
        )
    strict = system.get("source_strict")
    if strict is not None:
        positive = tuple(role_class[role] for role in strict["positive"])
        negative = tuple(role_class[role] for role in strict["negative"])
        commands.append(
            f"(assert (> (- {_distance_term(*positive)} {_distance_term(*negative)}) 0))"
        )

    for term, value in sorted(system.get("rank_pins", {}).items()):
        commands.append(f"(assert (= {term} {value}))")
    for term, value in sorted(system.get("distance_pins", {}).items()):
        commands.append(f"(assert (= {term} {value}))")
    commands.extend(
        _kalmanson_assertion(quartet)
        for quartet in itertools.combinations(class_ids, 4)
    )
    return tuple(commands)


def smt_journal(system: Mapping[str, Any]) -> bytes:
    return b"".join(
        command.encode("ascii") + b"\n" for command in build_smt_commands(system)
    )


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: piqd_adapter.SourceSemanticQuery


@lru_cache(maxsize=1)
def _implementation_snapshots() -> tuple[piqd_adapter.SourceSnapshot, ...]:
    paths = (
        ("implementation-alias-producer.py", Path(alias_grid.__file__).resolve()),
        ("implementation-order-producer.py", Path(__file__).resolve()),
        ("implementation-piqd-adapter.py", Path(piqd_adapter.__file__).resolve()),
    )
    return tuple(
        piqd_adapter.SourceSnapshot(name, path.read_bytes()) for name, path in paths
    )


def _prepare_query(
    key: str, system: dict[str, Any], *, timeout_ms: int
) -> PreparedQuery:
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise HardSourceSwapOrderPiqdError("timeout_ms must lie in 1..3600000")
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = piqd_adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise HardSourceSwapOrderPiqdError("SMT journal normalization drifted")
    source_record = {
        "schema": SOURCE_RECORD_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "key": key,
        "system": system,
        "system_sha256": _sha_json(system),
        "formula_inventory": formula_inventory(system),
        "journal_sha256": _sha(journal),
        "claim_boundary": (
            "conditional diagnostic abstraction; no Lean alias exhaustiveness, "
            "live closure, or promotion claim"
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = (
        piqd_adapter.SourceSnapshot(
            "0000-source-record.json", _json_bytes(source_record)
        ),
        *_implementation_snapshots(),
    )
    snapshots = tuple(sorted(snapshots, key=lambda item: item.path))
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "key": key,
        "system": system,
        "system_sha256": _sha_json(system),
        "formula_inventory": formula_inventory(system),
        "journal_sha256": _sha(journal),
        "claims": dict(FALSE_CLAIMS),
    }
    class_ids = _class_ids(system)
    variables = [
        {
            "id": f"distance-{left}-{right}",
            "term": _distance_term(left, right),
            "sort": "Real",
        }
        for left, right in itertools.combinations(class_ids, 2)
    ]
    variables.extend(
        {"id": f"rank-{item}", "term": _rank_term(item), "sort": "Int"}
        for item in class_ids
    )
    variables.sort(key=lambda item: item["id"])
    descriptor = {
        "schema": piqd_adapter.QUERY_SCHEMA,
        "producer": {"id": "p97-exactfive-hard-source-swap-order", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-complete-order-equality-replay",
            "version": "v1",
        },
        "stage_id": "complete-order-equality",
        "query_id": key,
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha_json(semantic),
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
            "schema": piqd_adapter.SOLVER_PROFILE_SCHEMA,
            "solvers": ["z3", "cvc5"],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_bytes = _json_bytes(descriptor)
    query = piqd_adapter.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=snapshots,
    )
    return PreparedQuery(key=key, system=system, query=query)


def prepare_profile_query(index: int, *, timeout_ms: int) -> PreparedQuery:
    profiles = indexed_profiles()
    if type(index) is not int or not 0 <= index < len(profiles):
        raise HardSourceSwapOrderPiqdError("profile index is out of range")
    actual_index, profile = profiles[index]
    if actual_index != index:
        raise HardSourceSwapOrderPiqdError("profile stream index drifted")
    key = f"profile-{index:04d}-{profile.profile_id[:20]}"
    return _prepare_query(
        key, build_profile_system(index, profile), timeout_ms=timeout_ms
    )


def prepare_control_query(
    control: Literal["positive", "negative"], *, timeout_ms: int
) -> PreparedQuery:
    return _prepare_query(
        f"control-{control}", build_control_system(control), timeout_ms=timeout_ms
    )


def _validate_system_current(system: object) -> dict[str, Any]:
    if type(system) is not dict or system.get("schema") != SYSTEM_SCHEMA:
        raise HardSourceSwapOrderPiqdError("semantic system has the wrong schema")
    kind = system.get("kind")
    if kind == "profile":
        index = system.get("profile_index")
        if type(index) is not int or not 0 <= index < EXPECTED_PROFILE_COUNT:
            raise HardSourceSwapOrderPiqdError("semantic profile index is malformed")
        expected_index, profile = indexed_profiles()[index]
        if expected_index != index:
            raise HardSourceSwapOrderPiqdError("semantic profile index drifted")
        expected = build_profile_system(index, profile)
    elif kind == "control":
        control = system.get("control")
        if control not in CONTROL_IDS:
            raise HardSourceSwapOrderPiqdError("semantic control is malformed")
        expected = build_control_system(control)
    else:
        raise HardSourceSwapOrderPiqdError("semantic system kind is malformed")
    if system != expected:
        raise HardSourceSwapOrderPiqdError(
            "semantic system disagrees with its producer"
        )
    return dict(system)


def _parse_bounded_sexpr(raw: str) -> object:
    if type(raw) is not str or len(raw.encode("utf-8")) > MAX_SEXPR_BYTES:
        raise HardSourceSwapOrderPiqdError("PIQD get-value text exceeds its byte bound")
    tokens: list[str] = []
    index = 0
    while index < len(raw):
        if raw[index].isspace():
            index += 1
            continue
        if raw[index] in "()":
            tokens.append(raw[index])
            index += 1
        else:
            end = index
            while end < len(raw) and not raw[end].isspace() and raw[end] not in "()":
                end += 1
            tokens.append(raw[index:end])
            index = end
        if len(tokens) > MAX_SEXPR_TOKENS:
            raise HardSourceSwapOrderPiqdError(
                "PIQD get-value text has too many tokens"
            )
    if not tokens:
        raise HardSourceSwapOrderPiqdError("PIQD get-value text is empty")
    roots: list[object] = []
    stack: list[list[object]] = []
    for token in tokens:
        if token == "(":
            if len(stack) >= MAX_SEXPR_DEPTH:
                raise HardSourceSwapOrderPiqdError("PIQD get-value text is too deep")
            stack.append([])
        elif token == ")":
            if not stack:
                raise HardSourceSwapOrderPiqdError(
                    "PIQD get-value text has unmatched close"
                )
            completed = stack.pop()
            (stack[-1] if stack else roots).append(completed)
        else:
            (stack[-1] if stack else roots).append(token)
    if stack or len(roots) != 1:
        raise HardSourceSwapOrderPiqdError(
            "PIQD get-value text is not one S-expression"
        )
    return roots[0]


def _rational(value: object) -> Fraction:
    if type(value) is str and _INTEGER.fullmatch(value):
        return Fraction(int(value))
    if type(value) is str and _DECIMAL.fullmatch(value):
        return Fraction(value)
    if type(value) is list and len(value) == 2 and value[0] == "-":
        return -_rational(value[1])
    if type(value) is list and len(value) == 3 and value[0] == "/":
        denominator = _rational(value[2])
        if denominator == 0:
            raise HardSourceSwapOrderPiqdError("PIQD get-value has zero denominator")
        return _rational(value[1]) / denominator
    raise HardSourceSwapOrderPiqdError("PIQD get-value is not an exact rational")


def parse_exact_readback(raw: str, terms: Sequence[str]) -> dict[str, Fraction]:
    parsed = _parse_bounded_sexpr(raw)
    if type(parsed) is not list or len(parsed) != len(terms):
        raise HardSourceSwapOrderPiqdError("PIQD get-value arity mismatch")
    answer: dict[str, Fraction] = {}
    for term, pair in zip(terms, parsed, strict=True):
        if type(term) is not str or type(pair) is not list or len(pair) != 2:
            raise HardSourceSwapOrderPiqdError("PIQD get-value pair is malformed")
        if pair[0] != term or term in answer:
            raise HardSourceSwapOrderPiqdError("PIQD get-value term mismatch")
        answer[term] = _rational(pair[1])
    return answer


def _strict_between(point: int, left: int, right: int) -> bool:
    return (left < point < right) or (right < point < left)


def chords_alternate(
    ranks: Mapping[str, int],
    first: tuple[str, str],
    second: tuple[str, str],
) -> bool:
    """Evaluate the cut-independent open-interval XOR alternation test."""

    a, b = first
    c, d = second
    try:
        return _strict_between(ranks[c], ranks[a], ranks[b]) != _strict_between(
            ranks[d], ranks[a], ranks[b]
        )
    except KeyError as exc:
        raise HardSourceSwapOrderPiqdError("rank map misses a chord endpoint") from exc


def _distance_value(
    distances: Mapping[str, Fraction], left: str, right: str
) -> Fraction:
    if left == right:
        return Fraction(0)
    term = _distance_term(left, right)
    try:
        return distances[term]
    except KeyError as exc:
        raise HardSourceSwapOrderPiqdError(
            f"distance assignment misses {term}"
        ) from exc


def evaluate_kalmanson_quartet(
    ranks: Mapping[str, int],
    distances: Mapping[str, Fraction],
    quartet: Sequence[str],
) -> dict[str, Any]:
    """Replay the unique crossing matching and its two strict forms."""

    matchings = quartet_matchings(quartet)
    alternate = [
        index
        for index, matching in enumerate(matchings)
        if chords_alternate(ranks, matching[0], matching[1])
    ]
    if len(alternate) != 1:
        return {
            "accepted": False,
            "reason": "alternation_not_unique",
            "quartet": list(quartet),
            "alternating_matching_indices": alternate,
        }
    crossing_index = alternate[0]
    sums = [
        _distance_value(distances, *matching[0])
        + _distance_value(distances, *matching[1])
        for matching in matchings
    ]
    other = [index for index in range(3) if index != crossing_index]
    forms = [
        {
            "crossing_matching": crossing_index,
            "other_matching": index,
            "lhs": str(sums[crossing_index]),
            "rhs": str(sums[index]),
            "holds": sums[crossing_index] > sums[index],
        }
        for index in other
    ]
    return {
        "accepted": all(form["holds"] for form in forms),
        "quartet": list(quartet),
        "crossing_matching": crossing_index,
        "forms": forms,
    }


def _branch_holds(
    groups: Mapping[str, Sequence[str]], ranks: Mapping[str, int], order: Sequence[str]
) -> bool:
    return all(
        ranks[left] < ranks[right]
        for left_name, right_name in itertools.pairwise(order)
        for left in groups[left_name]
        for right in groups[right_name]
    )


def skeleton_orientation(
    system: Mapping[str, Any], ranks: Mapping[str, int]
) -> str | None:
    if system.get("kind") != "profile":
        return None
    raw = system.get("fixed_class_groups")
    if type(raw) is not dict or set(raw) != set(FIXED_GROUPS):
        raise HardSourceSwapOrderPiqdError("fixed groups are malformed")
    groups = {name: tuple(raw[name]) for name in FIXED_GROUPS}
    direct = _branch_holds(groups, ranks, DIRECT_GROUP_ORDER)
    mirror = _branch_holds(groups, ranks, MIRROR_GROUP_ORDER)
    if direct == mirror:
        return None
    return "direct" if direct else "mirror"


def canonical_skeleton_ranks(
    system: Mapping[str, Any], orientation: Literal["direct", "mirror"]
) -> dict[str, int]:
    """Produce one total rank assignment satisfying only the chosen skeleton."""

    if system.get("kind") != "profile" or orientation not in {"direct", "mirror"}:
        raise HardSourceSwapOrderPiqdError(
            "canonical skeleton ranks need a profile arm"
        )
    class_ids = _class_ids(system)
    groups = {name: tuple(system["fixed_class_groups"][name]) for name in FIXED_GROUPS}
    group_order = DIRECT_GROUP_ORDER if orientation == "direct" else MIRROR_GROUP_ORDER
    anchor = system["anchor_class"]
    ordered = [anchor]
    for name in group_order:
        ordered.extend(item for item in groups[name] if item not in ordered)
    ordered.extend(item for item in class_ids if item not in ordered)
    if len(ordered) != len(class_ids):
        raise HardSourceSwapOrderPiqdError(
            "canonical rank construction duplicated a class"
        )
    return {class_id: index for index, class_id in enumerate(ordered)}


@dataclass(frozen=True)
class ReplayOutcome:
    accepted: bool
    evidence: dict[str, Any]


def _reject(reason: str, **details: object) -> ReplayOutcome:
    return ReplayOutcome(False, {"reason": reason, **details})


def replay_assignment(
    system: Mapping[str, Any], values: Mapping[str, Fraction]
) -> ReplayOutcome:
    """Replay every asserted semantic atom with exact rational arithmetic."""

    current = _validate_system_current(system)
    class_ids = _class_ids(current)
    expected_terms = {
        *(_rank_term(item) for item in class_ids),
        *(
            _distance_term(left, right)
            for left, right in itertools.combinations(class_ids, 2)
        ),
    }
    if set(values) != expected_terms or any(
        type(value) is not Fraction for value in values.values()
    ):
        return _reject("readback_term_set")
    ranks: dict[str, int] = {}
    for class_id in class_ids:
        value = values[_rank_term(class_id)]
        if value.denominator != 1:
            return _reject("rank_not_integer", class_id=class_id)
        ranks[class_id] = value.numerator
    if sorted(ranks.values()) != list(range(len(class_ids))):
        return _reject("ranks_not_permutation")
    if ranks[current["anchor_class"]] != 0:
        return _reject("rank_anchor")
    orientation = skeleton_orientation(current, ranks)
    if current["kind"] == "profile" and orientation is None:
        return _reject("cap_skeleton")

    distances = {
        term: value for term, value in values.items() if term.startswith("dist_")
    }
    if any(value <= 0 for value in distances.values()):
        return _reject("distance_positivity")
    for term, expected in current["rank_pins"].items():
        if values.get(term) != Fraction(expected):
            return _reject("rank_pin", term=term)
    for term, expected in current["distance_pins"].items():
        if values.get(term) != Fraction(expected):
            return _reject("distance_pin", term=term)

    role_class = _system_role_class(current)
    row_checks = 0
    for row in current["rows"]:
        center = role_class[row["center"]]
        support = [role_class[role] for role in row["support"]]
        radius = _distance_value(distances, center, support[0])
        for point in support[1:]:
            row_checks += 1
            if _distance_value(distances, center, point) != radius:
                return _reject("row_equality", row=row["id"])

    disequality = current["radius_disequality"]
    radius_record = None
    if disequality is not None:
        center = role_class[disequality["center"]]
        old = _distance_value(distances, center, role_class[disequality["old_support"]])
        replacement = _distance_value(
            distances, center, role_class[disequality["replacement_support"]]
        )
        if old == replacement:
            return _reject("radius_disequality")
        radius_record = {"old": str(old), "replacement": str(replacement)}

    strict = current["source_strict"]
    strict_record = None
    if strict is not None:
        positive = _distance_value(
            distances, *(role_class[role] for role in strict["positive"])
        )
        negative = _distance_value(
            distances, *(role_class[role] for role in strict["negative"])
        )
        if positive - negative <= 0:
            return _reject("source_strict")
        strict_record = {
            "positive": str(positive),
            "negative": str(negative),
            "difference": str(positive - negative),
        }

    trace: list[dict[str, Any]] = []
    for quartet in itertools.combinations(class_ids, 4):
        result = evaluate_kalmanson_quartet(ranks, distances, quartet)
        trace.append(result)
        if not result["accepted"]:
            return _reject("kalmanson", failure=result)
    inventory = formula_inventory(current)
    triggered = sum(len(item["forms"]) for item in trace)
    if triggered != inventory["kalmanson_triggered_strict_forms"]:
        raise HardSourceSwapOrderPiqdError("Kalmanson replay count drifted")
    trace_bytes = _canonical(trace)
    return ReplayOutcome(
        True,
        {
            "exact_rational_readback": True,
            "all_asserted_atoms_replayed": True,
            "orientation": orientation,
            "ranks": {class_id: ranks[class_id] for class_id in class_ids},
            "distances": {term: str(distances[term]) for term in sorted(distances)},
            "row_equalities_checked": row_checks,
            "radius_disequality": radius_record,
            "source_strict": strict_record,
            "kalmanson_quartets_checked": len(trace),
            "kalmanson_triggered_strict_forms_checked": triggered,
            "kalmanson_trace_sha256": _sha(trace_bytes),
            "formula_inventory": inventory,
        },
    )


def control_assignment(control: Literal["positive", "negative"]) -> dict[str, Fraction]:
    system = build_control_system(control)
    answer: dict[str, Fraction] = {
        term: Fraction(value) for term, value in system["rank_pins"].items()
    }
    answer.update(
        {term: Fraction(value) for term, value in system["distance_pins"].items()}
    )
    return answer


def verify_sat_model(
    query: piqd_adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> piqd_adapter.SemanticVerification:
    """Authenticate and exactly replay a PIQD SAT assignment from either engine."""

    if (
        solver not in {"z3", "cvc5"}
        or type(model) is not str
        or type(values) is not str
    ):
        raise HardSourceSwapOrderPiqdError(
            "SAT replay received the wrong engine payload"
        )
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise HardSourceSwapOrderPiqdError("SAT replay semantic input is malformed")
    system = _validate_system_current(semantic.get("system"))
    if semantic.get("system_sha256") != _sha_json(system):
        raise HardSourceSwapOrderPiqdError("SAT replay system hash mismatch")
    if semantic.get("formula_inventory") != formula_inventory(system):
        raise HardSourceSwapOrderPiqdError("SAT replay formula inventory mismatch")
    expected_journal = smt_journal(system)
    if (
        query.original_smt2 != expected_journal
        or query.journal_smt2 != expected_journal
        or semantic.get("journal_sha256") != _sha(expected_journal)
    ):
        raise HardSourceSwapOrderPiqdError("SAT replay SMT journal mismatch")
    readback = parse_exact_readback(values, query.get_values)
    replay = replay_assignment(system, readback)
    evidence = {
        **replay.evidence,
        "system_sha256": _sha_json(system),
        "model_sha256": _sha(model.encode("utf-8")),
        "values_sha256": _sha(values.encode("utf-8")),
        "solver": solver,
    }
    return piqd_adapter.SemanticVerification(replay.accepted, evidence)


def _read_regular(path: Path, *, limit: int = MAX_JSON_BYTES) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise HardSourceSwapOrderPiqdError(f"cannot stat artifact: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise HardSourceSwapOrderPiqdError(
            f"artifact is not a bounded unique regular file: {path}"
        )
    try:
        payload = path.read_bytes()
    except OSError as exc:
        raise HardSourceSwapOrderPiqdError(f"cannot read artifact: {path}") from exc
    if len(payload) != info.st_size:
        raise HardSourceSwapOrderPiqdError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    if len(payload) > MAX_JSON_BYTES:
        raise HardSourceSwapOrderPiqdError(f"{where} exceeds its JSON byte bound")

    def reject_float(_value: str) -> object:
        raise HardSourceSwapOrderPiqdError(f"{where} contains a floating number")

    def reject_constant(_value: str) -> object:
        raise HardSourceSwapOrderPiqdError(f"{where} contains a non-finite number")

    def unique(pairs: list[tuple[str, object]]) -> dict[str, object]:
        answer: dict[str, object] = {}
        for key, value in pairs:
            if key in answer:
                raise HardSourceSwapOrderPiqdError(f"{where} has a duplicate key")
            answer[key] = value
        return answer

    try:
        value = json.loads(
            payload,
            parse_float=reject_float,
            parse_constant=reject_constant,
            object_pairs_hook=unique,
        )
    except (UnicodeError, json.JSONDecodeError) as exc:
        raise HardSourceSwapOrderPiqdError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise HardSourceSwapOrderPiqdError(f"{where} is not a JSON object")
    return value


def _artifact_record(
    root: Path,
    value: object,
    where: str,
    seen: set[str],
) -> tuple[str, bytes]:
    if type(value) is not dict or set(value) != {"path", "bytes", "sha256"}:
        raise HardSourceSwapOrderPiqdError(f"{where} artifact record is malformed")
    name = value["path"]
    if (
        type(name) is not str
        or not name
        or name in {".", ".."}
        or "/" in name
        or "\\" in name
        or name in seen
    ):
        raise HardSourceSwapOrderPiqdError(
            f"{where} artifact path is unsafe or repeated"
        )
    expected_bytes = value["bytes"]
    digest = value["sha256"]
    if (
        type(expected_bytes) is not int
        or expected_bytes < 0
        or type(digest) is not str
        or _HEX64.fullmatch(digest) is None
    ):
        raise HardSourceSwapOrderPiqdError(f"{where} artifact metadata is malformed")
    payload = _read_regular(root / name, limit=piqd_adapter.MAX_OUTPUT_BYTES)
    if len(payload) != expected_bytes or _sha(payload) != digest:
        raise HardSourceSwapOrderPiqdError(f"{where} artifact digest mismatch")
    seen.add(name)
    return name, payload


def _validate_engine_artifact_labels(
    engine: Mapping[str, Any], labels: set[str]
) -> None:
    """Require the complete unnamed-session artifact family for one engine."""

    raw = engine.get("raw_status")
    response_lost = engine.get("response_lost")
    reconciled = engine.get("reconciled_from_receipt")
    if type(response_lost) is not bool or type(reconciled) is not bool:
        raise HardSourceSwapOrderPiqdError(
            "engine reconciliation flags are malformed"
        )
    solve_label = "reconciled_solve" if response_lost else "solve"
    expected = {
        "session",
        "smt2",
        "receipts_before",
        "receipts",
        solve_label,
        "closed_session",
    }
    if response_lost:
        expected.add("reconciliation_session")
    if raw == "SAT":
        expected.add("semantic")
    if reconciled is not response_lost or labels != expected:
        raise HardSourceSwapOrderPiqdError(
            "engine artifact inventory is incomplete or cross-bound"
        )


def verify_terminal_directory(
    output_directory: Path, prepared: PreparedQuery
) -> dict[str, Any]:
    """Verify a complete immutable adapter tree before treating it as resumable."""

    if not output_directory.is_dir() or output_directory.is_symlink():
        raise HardSourceSwapOrderPiqdError("terminal output is not a regular directory")
    result_payload = _read_regular(output_directory / "result.json")
    result = _strict_json(result_payload, "result.json")
    if result.get("schema") != piqd_adapter.RESULT_SCHEMA or result.get(
        "claims"
    ) != dict(piqd_adapter.FALSE_CLAIMS):
        raise HardSourceSwapOrderPiqdError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "manifest",
        "sources",
    }:
        raise HardSourceSwapOrderPiqdError("adapter custody record is malformed")
    _descriptor_name, descriptor_payload = _artifact_record(
        output_directory, custody["descriptor"], "descriptor", seen
    )
    _original_name, original_payload = _artifact_record(
        output_directory, custody["original_smt2"], "original_smt2", seen
    )
    _journal_name, journal_payload = _artifact_record(
        output_directory, custody["journal_smt2"], "journal_smt2", seen
    )
    _manifest_name, manifest_payload = _artifact_record(
        output_directory, custody["manifest"], "manifest", seen
    )
    if (
        descriptor_payload != prepared.query.descriptor_bytes
        or original_payload != prepared.query.original_smt2
        or journal_payload != prepared.query.journal_smt2
    ):
        raise HardSourceSwapOrderPiqdError(
            "terminal query bytes differ from the producer"
        )
    manifest = _strict_json(manifest_payload, "source-manifest.json")
    if (
        manifest.get("schema") != piqd_adapter.MANIFEST_SCHEMA
        or manifest.get("query_id") != prepared.key
        or result.get("source_manifest_sha256") != _sha(manifest_payload)
    ):
        raise HardSourceSwapOrderPiqdError("terminal source manifest is cross-bound")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(
        prepared.query.source_files
    ):
        raise HardSourceSwapOrderPiqdError("terminal source custody arity mismatch")
    for index, (record, expected) in enumerate(
        zip(source_records, prepared.query.source_files, strict=True)
    ):
        _name, payload = _artifact_record(
            output_directory, record, f"source[{index}]", seen
        )
        if payload != expected.payload:
            raise HardSourceSwapOrderPiqdError("terminal source snapshot differs")
    descriptor = prepared.query.descriptor
    expected_manifest = {
        "schema": piqd_adapter.MANIFEST_SCHEMA,
        "producer": descriptor["producer"],
        "semantic_verifier": descriptor["semantic_verifier"],
        "stage_id": descriptor["stage_id"],
        "query_id": descriptor["query_id"],
        "descriptor": {
            "bytes": len(prepared.query.descriptor_bytes),
            "sha256": _sha(prepared.query.descriptor_bytes),
        },
        "sources": [
            {
                "path": snapshot.path,
                "bytes": len(snapshot.payload),
                "sha256": _sha(snapshot.payload),
                "custody_artifact": record["path"],
            }
            for snapshot, record in zip(
                prepared.query.source_files, source_records, strict=True
            )
        ],
        "semantic_input": descriptor["semantic_input"],
        "semantic_sha256": descriptor["semantic_sha256"],
        "original_smt2": {
            "path": descriptor["original_smt2"]["path"],
            "bytes": len(prepared.query.original_smt2),
            "sha256": _sha(prepared.query.original_smt2),
        },
        "normalized_journal": {
            "normalization": "piqd-state-commands-exact-spelling-plus-lf/v1",
            "commands": len(prepared.query.journal_commands),
            "bytes": len(prepared.query.journal_smt2),
            "sha256": _sha(prepared.query.journal_smt2),
        },
        "variables": descriptor["variables"],
        "named_atoms": descriptor["named_atoms"],
        "solve": {
            **descriptor["solve"],
            "assumptions": list(prepared.query.assumptions),
            "get_values": list(prepared.query.get_values),
            "unsat_assumption_basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_unsat_assumption_field": "core",
        },
        "solver_profile": {
            **descriptor["solver_profile"],
            "fresh_session_per_solver": True,
            "sequential": True,
            "daemon_owned_solver_arguments": True,
            "cvc5_nl_cov_requested": False,
        },
        "claims": dict(piqd_adapter.FALSE_CLAIMS),
    }
    if manifest != expected_manifest:
        raise HardSourceSwapOrderPiqdError("terminal source manifest payload drifted")

    engines = result.get("engines")
    if (
        type(engines) is not list
        or any(type(engine) is not dict for engine in engines)
        or [engine.get("solver") for engine in engines] != ["z3", "cvc5"]
    ):
        raise HardSourceSwapOrderPiqdError("terminal engine list is malformed")
    for engine in engines:
        raw = engine.get("raw_status")
        effective = engine.get("effective_status")
        if raw not in {"SAT", "UNSAT", "UNKNOWN"} or type(effective) is not str:
            raise HardSourceSwapOrderPiqdError("engine is not terminal")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict or not artifacts:
            raise HardSourceSwapOrderPiqdError("engine artifact inventory is malformed")
        _validate_engine_artifact_labels(engine, set(artifacts))
        artifact_payloads: dict[str, bytes] = {}
        for label, record in artifacts.items():
            _name, payload = _artifact_record(
                output_directory, record, f"engine.{engine['solver']}.{label}", seen
            )
            artifact_payloads[label] = payload
        solve_label = "solve" if "solve" in artifact_payloads else "reconciled_solve"
        if solve_label not in artifact_payloads:
            raise HardSourceSwapOrderPiqdError("terminal engine lacks a solve artifact")
        solve = _strict_json(
            artifact_payloads[solve_label], f"{engine['solver']}.solve"
        )
        try:
            recomputed_result_sha256 = piqd_adapter.piqd_result_digest(solve)
        except piqd_adapter.SmtSourceAdapterError as exc:
            raise HardSourceSwapOrderPiqdError(
                "terminal solve payload is malformed"
            ) from exc
        advisory = engine.get("result_digest_advisory")
        if (
            solve.get("status") != raw
            or engine.get("result_sha256") != recomputed_result_sha256
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != recomputed_result_sha256
            or advisory.get("matches_daemon") is not True
        ):
            raise HardSourceSwapOrderPiqdError("terminal solve digest is cross-bound")
        if raw == "SAT":
            if effective != "SAT_SEMANTICALLY_REPLAYED":
                raise HardSourceSwapOrderPiqdError(
                    "terminal SAT lacks accepted semantic replay"
                )
            verification = verify_sat_model(
                prepared.query,
                engine["solver"],
                solve.get("model"),
                solve.get("values"),
            )
            replay = engine.get("semantic_replay")
            if (
                not verification.accepted
                or type(replay) is not dict
                or replay.get("accepted") is not True
                or replay.get("evidence") != verification.evidence
            ):
                raise HardSourceSwapOrderPiqdError("terminal SAT replay failed locally")
        elif raw == "UNSAT" and effective != "UNSAT_DISCOVERY_ONLY":
            raise HardSourceSwapOrderPiqdError("terminal UNSAT classification drifted")
        elif raw == "UNKNOWN" and effective != "INCONCLUSIVE_UNKNOWN":
            raise HardSourceSwapOrderPiqdError(
                "terminal UNKNOWN classification drifted"
            )
    entries = tuple(output_directory.iterdir())
    if any(
        entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        for entry in entries
    ):
        raise HardSourceSwapOrderPiqdError(
            "terminal directory has a non-regular artifact"
        )
    observed = {entry.name for entry in entries}
    if observed != seen:
        raise HardSourceSwapOrderPiqdError("terminal directory has unbound artifacts")
    effective_statuses = [engine["effective_status"] for engine in engines]
    raw_statuses = [engine["raw_status"] for engine in engines]
    expected_overall = (
        "INCONCLUSIVE"
        if any(status.startswith("INCONCLUSIVE") for status in effective_statuses)
        else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        if len(set(raw_statuses)) != 1
        else "FINITE_DIAGNOSTIC_COMPLETE"
    )
    if result.get("overall_status") != expected_overall:
        raise HardSourceSwapOrderPiqdError("adapter overall status is inconsistent")
    return {
        "key": prepared.key,
        "result_sha256": _sha(result_payload),
        "overall_status": result.get("overall_status"),
        "engines": [
            {
                "solver": engine["solver"],
                "raw_status": engine["raw_status"],
                "effective_status": engine["effective_status"],
            }
            for engine in engines
        ],
    }


def _manifest_self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha_json({key: item for key, item in value.items() if key != field})


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT).as_posix()
    except ValueError as exc:
        raise HardSourceSwapOrderPiqdError(
            "governed source escapes the repository"
        ) from exc


def _source_digest_map(paths: Iterable[Path]) -> dict[str, str]:
    answer = {_repo_path(path): _sha(_read_regular(path)) for path in paths}
    if not answer:
        raise HardSourceSwapOrderPiqdError("governed digest map is empty")
    return dict(sorted(answer.items()))


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or f"scratch/runs/{LANE_ID}/{RUN_ID}"
        not in checkpoint.get("generated_roots", [])
    ):
        raise HardSourceSwapOrderPiqdError("lane checkpoint does not govern this run")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    runner = (
        REPOSITORY_ROOT / "scripts" / "run_exactfive_hard_source_swap_order_piqd.py"
    )
    sources = _source_digest_map(
        (Path(__file__).resolve(), Path(piqd_adapter.__file__).resolve(), runner)
    )
    inputs = _source_digest_map((Path(alias_grid.__file__).resolve(), CHECKPOINT_PATH))
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
    manifest["manifest_sha256"] = _manifest_self_hash(manifest, "manifest_sha256")
    return manifest


def _write_create_once(path: Path, payload: bytes) -> None:
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
                raise HardSourceSwapOrderPiqdError("short immutable artifact write")
            view = view[written:]
        os.fsync(descriptor)
    except FileExistsError as exc:
        raise HardSourceSwapOrderPiqdError(
            f"immutable artifact already exists: {path}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def ensure_governed_run_root() -> tuple[Path, dict[str, Any]]:
    """Create or validate the exact checkpoint-declared run root."""

    manifest_path = RUN_ROOT / "run_manifest.json"
    if not RUN_ROOT.exists():
        RUN_ROOT.mkdir(parents=True, mode=0o700)
        for name in ("artifacts", "events", "tmp"):
            (RUN_ROOT / name).mkdir(mode=0o700)
        manifest = _expected_run_manifest(_utc_now())
        _write_create_once(manifest_path, _json_bytes(manifest))
    if not RUN_ROOT.is_dir() or RUN_ROOT.is_symlink():
        raise HardSourceSwapOrderPiqdError(
            "governed run root is not a regular directory"
        )
    manifest = _strict_json(_read_regular(manifest_path), "run_manifest.json")
    if set(manifest) != {
        "schema",
        "lane_id",
        "run_id",
        "root",
        "owner",
        "base_head",
        "output_classes",
        "source_digests",
        "input_digests",
        "created_utc",
        "manifest_sha256",
    }:
        raise HardSourceSwapOrderPiqdError("run manifest key set is malformed")
    created_utc = _validate_utc(manifest.get("created_utc"), "run manifest timestamp")
    expected = _expected_run_manifest(created_utc)
    if manifest != expected:
        raise HardSourceSwapOrderPiqdError(
            "run manifest or governed source digest drifted"
        )
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name
        if not child.is_dir() or child.is_symlink():
            raise HardSourceSwapOrderPiqdError("governed output class is malformed")
    return RUN_ROOT, manifest


def _launch_record(
    selected: Sequence[tuple[int, alias_grid.SourceAliasProfile]],
    *,
    selection_mode: str,
    workers: int,
    timeout_ms: int,
    server: str,
    created_utc: str,
    run_manifest_sha256: str,
) -> dict[str, Any]:
    record = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "created_utc": created_utc,
        "run_manifest_sha256": run_manifest_sha256,
        "profile_stream_sha256": profile_stream_sha256(),
        "selection_mode": selection_mode,
        "profiles": [
            {"index": index, "profile_sha256": profile.profile_id}
            for index, profile in selected
        ],
        "controls": list(CONTROL_IDS),
        "workers": workers,
        "timeout_ms": timeout_ms,
        "server": server,
        "claim_boundary": (
            "conditional diagnostic evidence for the encoded alias/order/equality model"
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    record["launch_sha256"] = _manifest_self_hash(record, "launch_sha256")
    return record


def ensure_launch_record(
    root: Path,
    run_manifest: Mapping[str, Any],
    selected: Sequence[tuple[int, alias_grid.SourceAliasProfile]],
    *,
    selection_mode: str,
    workers: int,
    timeout_ms: int,
    server: str,
) -> dict[str, Any]:
    path = root / "events" / "launch.json"
    if path.exists():
        observed = _strict_json(_read_regular(path), "launch.json")
        created = _validate_utc(observed.get("created_utc"), "launch timestamp")
        expected = _launch_record(
            selected,
            selection_mode=selection_mode,
            workers=workers,
            timeout_ms=timeout_ms,
            server=server,
            created_utc=created,
            run_manifest_sha256=run_manifest["manifest_sha256"],
        )
        if observed != expected:
            raise HardSourceSwapOrderPiqdError(
                "resume request differs from the immutable launch record"
            )
        return observed
    record = _launch_record(
        selected,
        selection_mode=selection_mode,
        workers=workers,
        timeout_ms=timeout_ms,
        server=server,
        created_utc=_utc_now(),
        run_manifest_sha256=run_manifest["manifest_sha256"],
    )
    _write_create_once(path, _json_bytes(record))
    return record


def _execute_or_resume(
    prepared: PreparedQuery, output_directory: Path, *, server: str, timeout_ms: int
) -> dict[str, Any]:
    if output_directory.exists():
        result = verify_terminal_directory(output_directory, prepared)
        return {**result, "execution": "resumed_verified_terminal"}
    transport = piqd_adapter.UrllibPiqdTransport(
        server,
        http_timeout_s=piqd_adapter.bounded_solve_http_timeout_s(timeout_ms),
    )
    piqd_adapter.run_source_semantic_query(
        prepared.query,
        output_directory,
        transport,
        verify_sat_model,
    )
    result = verify_terminal_directory(output_directory, prepared)
    return {**result, "execution": "fresh_piqd"}


def _check_control_result(control: str, result: Mapping[str, Any]) -> None:
    engines = result.get("engines")
    if type(engines) is not list:
        raise HardSourceSwapOrderPiqdError("control result has no engines")
    if control == "positive":
        accepted = all(
            engine.get("raw_status") == "SAT"
            and engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED"
            for engine in engines
        )
    else:
        accepted = all(
            engine.get("raw_status") == "UNSAT"
            and engine.get("effective_status") == "UNSAT_DISCOVERY_ONLY"
            for engine in engines
        )
    if not accepted:
        raise HardSourceSwapOrderPiqdError(
            f"{control} smoke control did not reach its expected terminal verdict"
        )


def _terminal_record(
    launch: Mapping[str, Any],
    controls: Sequence[Mapping[str, Any]],
    profiles: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    engine_pairs = Counter(
        tuple(engine["raw_status"] for engine in result["engines"])
        for result in profiles
    )
    record = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "launch_sha256": launch["launch_sha256"],
        "controls": [
            {
                "key": result["key"],
                "result_sha256": result["result_sha256"],
                "engines": result["engines"],
            }
            for result in controls
        ],
        "profiles": [
            {
                "key": result["key"],
                "result_sha256": result["result_sha256"],
                "engines": result["engines"],
            }
            for result in profiles
        ],
        "summary": {
            "profiles": len(profiles),
            "engine_status_pairs": {
                "/".join(pair): count for pair, count in sorted(engine_pairs.items())
            },
        },
        "claim_boundary": (
            "UNSAT over every selected encoded profile concerns only the authenticated "
            "abstract order/equality formulas"
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    record["terminal_sha256"] = _manifest_self_hash(record, "terminal_sha256")
    return record


def _bounded_parallel_map(
    function,
    rows: Sequence[tuple[int, alias_grid.SourceAliasProfile]],
    *,
    workers: int,
) -> list[dict[str, Any]]:
    """Run at most ``workers`` submitted tasks and cancel pending work on error."""

    results: list[dict[str, Any] | None] = [None] * len(rows)
    executor = concurrent.futures.ThreadPoolExecutor(max_workers=workers)
    pending: dict[concurrent.futures.Future, int] = {}
    next_index = 0
    try:
        while next_index < len(rows) and len(pending) < workers:
            pending[executor.submit(function, rows[next_index])] = next_index
            next_index += 1
        while pending:
            completed, _not_done = concurrent.futures.wait(
                pending, return_when=concurrent.futures.FIRST_COMPLETED
            )
            for future in completed:
                position = pending.pop(future)
                results[position] = future.result()
                if next_index < len(rows):
                    pending[executor.submit(function, rows[next_index])] = next_index
                    next_index += 1
    except BaseException:
        for future in pending:
            future.cancel()
        executor.shutdown(wait=True, cancel_futures=True)
        raise
    else:
        executor.shutdown(wait=True)
    if any(result is None for result in results):
        raise HardSourceSwapOrderPiqdError("parallel profile schedule ended incomplete")
    return [result for result in results if result is not None]


def run_census(
    *,
    indices: Sequence[int] = (),
    profile_hashes: Sequence[str] = (),
    limit: int | None = None,
    workers: int = MAX_WORKERS,
    timeout_s: float = 60.0,
    server: str = DEFAULT_SERVER,
) -> dict[str, Any]:
    """Run or resume the selected profile census through PIQD only."""

    workers = normalize_workers(workers)
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3_600
    ):
        raise HardSourceSwapOrderPiqdError("timeout_s must lie in (0, 3600]")
    timeout_ms = max(1, int(timeout_s * 1_000))
    selected = select_profiles(indices=indices, profile_hashes=profile_hashes)
    scheduled = selected if limit is None else selected[:limit]
    selection_mode = "indices" if indices else "hashes" if profile_hashes else "stream"
    root, manifest = ensure_governed_run_root()
    launch = ensure_launch_record(
        root,
        manifest,
        selected,
        selection_mode=selection_mode,
        workers=workers,
        timeout_ms=timeout_ms,
        server=server,
    )
    controls_root = root / "artifacts" / "controls"
    profiles_root = root / "artifacts" / "profiles"
    controls_root.mkdir(mode=0o700, exist_ok=True)
    profiles_root.mkdir(mode=0o700, exist_ok=True)

    control_results = []
    for control in CONTROL_IDS:
        prepared = prepare_control_query(control, timeout_ms=timeout_ms)
        result = _execute_or_resume(
            prepared,
            controls_root / prepared.key,
            server=server,
            timeout_ms=timeout_ms,
        )
        _check_control_result(control, result)
        control_results.append(result)

    def execute(row: tuple[int, alias_grid.SourceAliasProfile]) -> dict[str, Any]:
        index, profile = row
        prepared = prepare_profile_query(index, timeout_ms=timeout_ms)
        if prepared.system["profile_sha256"] != profile.profile_id:
            raise HardSourceSwapOrderPiqdError(
                "selected profile changed before execution"
            )
        return _execute_or_resume(
            prepared,
            profiles_root / prepared.key,
            server=server,
            timeout_ms=timeout_ms,
        )

    profile_results = _bounded_parallel_map(execute, scheduled, workers=workers)
    if len(scheduled) != len(selected):
        return {
            "schema": "p97-exactfive-hard-source-swap-order-piqd-checkpoint/v1",
            "launch_sha256": launch["launch_sha256"],
            "controls": control_results,
            "profiles": profile_results,
            "summary": {
                "profiles": len(profile_results),
                "selected_profiles": len(selected),
                "complete": False,
                "engine_status_pairs": dict(
                    sorted(
                        Counter(
                            "/".join(
                                engine["raw_status"] for engine in result["engines"]
                            )
                            for result in profile_results
                        ).items()
                    )
                ),
            },
            "terminal_sha256": None,
            "claims": dict(FALSE_CLAIMS),
        }
    terminal = _terminal_record(launch, control_results, profile_results)
    terminal_path = root / "events" / "terminal.json"
    terminal_payload = _json_bytes(terminal)
    if terminal_path.exists():
        if _read_regular(terminal_path) != terminal_payload:
            raise HardSourceSwapOrderPiqdError("terminal summary differs on resume")
    else:
        _write_create_once(terminal_path, terminal_payload)
    return terminal


def _positive_int(text: str) -> int:
    try:
        value = int(text)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("expected an integer") from exc
    if value < 1:
        raise argparse.ArgumentTypeError("expected a positive integer")
    return value


def _nonnegative_int(text: str) -> int:
    try:
        value = int(text)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("expected an integer") from exc
    if value < 0:
        raise argparse.ArgumentTypeError("expected a nonnegative integer")
    return value


def _profile_hash(text: str) -> str:
    if _HEX64.fullmatch(text) is None:
        raise argparse.ArgumentTypeError("profile hash must be lowercase 64-hex")
    return text


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    selection = parser.add_mutually_exclusive_group()
    selection.add_argument(
        "--profile-index", action="append", type=_nonnegative_int, default=[]
    )
    selection.add_argument(
        "--profile-hash", action="append", type=_profile_hash, default=[]
    )
    parser.add_argument("--limit", type=_positive_int)
    parser.add_argument("--workers", type=_positive_int, default=MAX_WORKERS)
    parser.add_argument("--timeout", type=float, default=60.0, metavar="SECONDS")
    parser.add_argument("--server", default=DEFAULT_SERVER)
    parser.add_argument("--verbose", action="store_true")
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv)
    try:
        terminal = run_census(
            indices=args.profile_index,
            profile_hashes=args.profile_hash,
            limit=args.limit,
            workers=args.workers,
            timeout_s=args.timeout,
            server=args.server,
        )
    except (HardSourceSwapOrderPiqdError, piqd_adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        for profile in terminal["profiles"]:
            statuses = "/".join(engine["raw_status"] for engine in profile["engines"])
            print(f"{profile['key']} {statuses}")
    print(
        json.dumps(
            {
                "profiles": terminal["summary"]["profiles"],
                "engine_status_pairs": terminal["summary"]["engine_status_pairs"],
                "terminal_sha256": terminal["terminal_sha256"],
            },
            sort_keys=True,
            separators=(",", ":"),
        )
    )
    return 0


__all__ = [
    "CONTROL_IDS",
    "EXPECTED_PROFILE_COUNT",
    "FALSE_CLAIMS",
    "HardSourceSwapOrderPiqdError",
    "PreparedQuery",
    "ReplayOutcome",
    "alternation_term",
    "build_control_system",
    "build_profile_system",
    "build_smt_commands",
    "canonical_skeleton_ranks",
    "chords_alternate",
    "control_assignment",
    "evaluate_kalmanson_quartet",
    "formula_inventory",
    "indexed_profiles",
    "main",
    "normalize_workers",
    "parse_exact_readback",
    "prepare_control_query",
    "prepare_profile_query",
    "profile_stream_sha256",
    "quartet_matchings",
    "replay_assignment",
    "run_census",
    "select_profiles",
    "skeleton_orientation",
    "smt_journal",
    "verify_sat_model",
    "verify_terminal_directory",
]


if __name__ == "__main__":  # pragma: no cover - script wrapper is canonical
    raise SystemExit(main())
