"""Governed B--O QF_NRA diagnostic for source-alias profile 282.

The producer authenticates the completed full-order PIQD parent, fixes the
four source roles B, O, A, and Q in one of two signed gauges, and retains every
strict-order, row, radius, and source-strict assertion.  Solver transport is
provided only by the maintained PIQD SMT adapter.  SAT is accepted only after
exact rational expansion and replay against the original profile formula.
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
    exactfive_hard_source_swap_bo_source_qfnra_piqd as sibling,
)
from census.card_head import exactfive_hard_source_swap_nra_piqd as frozen_nra
from census.card_head import exactfive_hard_source_swap_order_piqd as frozen_order
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile282-bo-source-qfnra-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs/specs/p97-exactfive-hard-source-swap-profile282-bo-source-qfnra-v1.md"
)
RUNNER_PATH = (
    REPOSITORY_ROOT
    / "scripts/run_exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd.py"
)
PARENT_ROOT = (
    REPOSITORY_ROOT
    / "scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001"
)
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PROFILE_KEY = "profile-0282-9ab4cce5c41587dc4cfe"
PARENT_PROFILE_ROOT = PARENT_ROOT / "artifacts/profiles" / PARENT_PROFILE_KEY
PARENT_RESULT_PATH = PARENT_PROFILE_ROOT / "result.json"
PARENT_SOURCE_MANIFEST_PATH = PARENT_PROFILE_ROOT / "source-manifest.json"

PROFILE_INDEX = 282
PROFILE_SHA256 = "9ab4cce5c41587dc4cfe5822d027a141d843e5ae646056a015ac185c95321f84"
PARENT_MANIFEST_SHA256 = "81e3b3c6bcddef75fbc8a2d22eda9787f6f6db5c394aca2de68b689a91d86299"
PARENT_LAUNCH_SHA256 = "142ce963789fca3efb419c4be21495cdbdb5195677a32cc9f736201a027b0494"
PARENT_TERMINAL_SHA256 = "6baab84ed88abc816965447f9b4f5ce90f62a7c90c8c4e777aa6496e6e62d9e2"
PARENT_RESULT_SHA256 = "842b1a82c889363a14916ffd268ff15021821c436070af7e9064d77760baa28d"
PARENT_SOURCE_MANIFEST_SHA256 = (
    "044e303e38d3b1688b9b2145353dcc76b12005b600f73db6c978d6c14cd38782"
)

SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-profile282-bo-qfnra-system/v1"
PRODUCER_VERSION = "p97-exactfive-hard-source-swap-profile282-bo-qfnra/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-profile282-bo-qfnra-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-hard-source-swap-profile282-bo-qfnra-result/v1"
CONTROL_IDS = ("positive", "negative")
ORDER_IDS = ("parent-z3-mirror", "parent-cvc5-direct")
QUERY_KEYS = ("control-positive", "control-negative", *ORDER_IDS)
MAX_WORKERS = 2
DEFAULT_TIMEOUT_S = 60.0
REMAINING_CLASSES = tuple(f"c{index:03d}" for index in range(4, 13))
TARGET_VARIABLES = ("r",) + tuple(
    f"{axis}_{class_id}"
    for class_id in REMAINING_CLASSES
    for axis in ("x", "y")
)
EXPECTED_ORDERS = {
    "parent-z3-mirror": (
        "c000",
        "c005",
        "c003",
        "c007",
        "c004",
        "c002",
        "c010",
        "c006",
        "c001",
        "c012",
        "c008",
        "c011",
        "c009",
    ),
    "parent-cvc5-direct": (
        "c000",
        "c012",
        "c008",
        "c009",
        "c005",
        "c011",
        "c001",
        "c006",
        "c007",
        "c010",
        "c002",
        "c004",
        "c003",
    ),
}
ORDER_SOLVERS = {
    "parent-z3-mirror": "z3",
    "parent-cvc5-direct": "cvc5",
}
ORDER_SIGMAS = {"parent-z3-mirror": -1, "parent-cvc5-direct": 1}
EXPECTED_CLASSES = (
    ("U", "c1"),
    ("O",),
    ("c2", "p"),
    ("a",),
    ("d",),
    ("q",),
    ("s",),
    ("t",),
    ("u",),
    ("v",),
    ("e",),
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
    "census/card_head/exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile282-bo-source-qfnra-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd.py",
]


class Profile282BoQfnraError(RuntimeError):
    """The profile-282 diagnostic failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


Poly = sibling.Poly
_p_const = sibling._p_const
_p_var = sibling._p_var
_p_add = sibling._p_add
_p_neg = sibling._p_neg
_p_sub = sibling._p_sub
_p_mul = sibling._p_mul
_poly_json = sibling._poly_json
_poly_smt = sibling._poly_smt
_area_poly = sibling._area_poly
_sqdist_poly = sibling._sqdist_poly
_reduce_modulus = sibling._reduce_modulus


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
        raise Profile282BoQfnraError(f"artifact is missing or unreadable: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile282BoQfnraError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile282BoQfnraError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile282BoQfnraError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise Profile282BoQfnraError(f"{where} is not an object")
    return value


def _source_core(order: Sequence[str]) -> dict[str, Any]:
    index, profile = frozen_order.indexed_profiles()[PROFILE_INDEX]
    if index != PROFILE_INDEX or profile.profile_id != PROFILE_SHA256:
        raise Profile282BoQfnraError("profile identity drifted")
    system = frozen_order.build_profile_system(index, profile)
    classes = tuple(tuple(entry["roles"]) for entry in system["classes"])
    if classes != EXPECTED_CLASSES or set(order) != {
        entry["id"] for entry in system["classes"]
    }:
        raise Profile282BoQfnraError("profile classes or order drifted")
    return {
        **system,
        "order": list(order),
        "ranks": {class_id: rank for rank, class_id in enumerate(order)},
    }


def _parent_order(engine: Mapping[str, Any]) -> tuple[str, ...]:
    semantic = engine.get("semantic_replay")
    evidence = semantic.get("evidence") if type(semantic) is dict else None
    ranks = evidence.get("ranks") if type(evidence) is dict else None
    if type(ranks) is not dict or set(ranks) != {f"c{i:03d}" for i in range(13)}:
        raise Profile282BoQfnraError("parent exact rank replay is malformed")
    if set(ranks.values()) != set(range(13)) or any(
        type(value) is not int for value in ranks.values()
    ):
        raise Profile282BoQfnraError("parent exact ranks are not a permutation")
    return tuple(sorted(ranks, key=ranks.__getitem__))


def authenticate_source_orders() -> dict[str, Any]:
    """Authenticate the completed parent run and both exact profile orders."""

    manifest_payload = _read_regular(PARENT_MANIFEST_PATH)
    launch_payload = _read_regular(PARENT_LAUNCH_PATH)
    terminal_payload = _read_regular(PARENT_TERMINAL_PATH)
    manifest = _strict_json(manifest_payload, "parent run manifest")
    launch = _strict_json(launch_payload, "parent launch")
    terminal = _strict_json(terminal_payload, "parent terminal")
    if (
        manifest.get("schema") != frozen_order.RUN_MANIFEST_SCHEMA
        or manifest.get("lane_id") != frozen_order.LANE_ID
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or launch.get("schema") != frozen_order.LAUNCH_SCHEMA
        or launch.get("run_manifest_sha256") != PARENT_MANIFEST_SHA256
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
        or terminal.get("schema") != frozen_order.TERMINAL_SCHEMA
        or terminal.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile282BoQfnraError("parent run custody drifted")
    timeout_ms = launch.get("timeout_ms")
    if timeout_ms != 60_000:
        raise Profile282BoQfnraError("parent timeout drifted")
    prepared = frozen_order.prepare_profile_query(PROFILE_INDEX, timeout_ms=timeout_ms)
    if prepared.system.get("profile_sha256") != PROFILE_SHA256:
        raise Profile282BoQfnraError("parent profile identity drifted")
    try:
        summary = frozen_order.verify_terminal_directory(PARENT_PROFILE_ROOT, prepared)
    except Exception as exc:
        raise Profile282BoQfnraError("parent profile replay failed") from exc
    result_payload = _read_regular(PARENT_RESULT_PATH)
    source_manifest_payload = _read_regular(PARENT_SOURCE_MANIFEST_PATH)
    result = _strict_json(result_payload, "parent profile result")
    if (
        summary.get("result_sha256") != PARENT_RESULT_SHA256
        or summary.get("key") != PARENT_PROFILE_KEY
        or
        _sha(result_payload) != PARENT_RESULT_SHA256
        or _sha(source_manifest_payload) != PARENT_SOURCE_MANIFEST_SHA256
        or result.get("source_manifest_sha256") != PARENT_SOURCE_MANIFEST_SHA256
    ):
        raise Profile282BoQfnraError("parent profile artifacts drifted")
    rows = terminal.get("profiles")
    if type(rows) is not list or len(rows) != frozen_order.EXPECTED_PROFILE_COUNT:
        raise Profile282BoQfnraError("parent terminal profile inventory drifted")
    row = rows[PROFILE_INDEX]
    if (
        type(row) is not dict
        or row.get("key") != PARENT_PROFILE_KEY
        or row.get("result_sha256") != PARENT_RESULT_SHA256
    ):
        raise Profile282BoQfnraError("parent terminal profile link drifted")
    engines = result.get("engines")
    if type(engines) is not list or len(engines) != 2:
        raise Profile282BoQfnraError("parent engine inventory drifted")
    gauges = []
    for order_id, engine in zip(ORDER_IDS, engines, strict=True):
        solver = ORDER_SOLVERS[order_id]
        order = _parent_order(engine)
        semantic = engine.get("semantic_replay")
        if (
            engine.get("solver") != solver
            or engine.get("raw_status") != "SAT"
            or engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
            or type(semantic) is not dict
            or semantic.get("accepted") is not True
            or order != EXPECTED_ORDERS[order_id]
        ):
            raise Profile282BoQfnraError(f"parent exact order drifted: {order_id}")
        gauges.append(
            {
                "order_id": order_id,
                "solver": solver,
                "orientation": "mirror" if ORDER_SIGMAS[order_id] < 0 else "direct",
                "sigma": ORDER_SIGMAS[order_id],
                "order": list(order),
                "order_sha256": _sha(_canonical(list(order))),
                "parent_result_sha256": PARENT_RESULT_SHA256,
                "parent_source_manifest_sha256": PARENT_SOURCE_MANIFEST_SHA256,
            }
        )
    return {
        "schema": "p97-exactfive-hard-source-swap-profile282-parent-custody/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "parent_run_manifest_sha256": PARENT_MANIFEST_SHA256,
        "parent_launch_sha256": PARENT_LAUNCH_SHA256,
        "parent_terminal_sha256": PARENT_TERMINAL_SHA256,
        "parent_profile_result_sha256": PARENT_RESULT_SHA256,
        "parent_source_manifest_sha256": PARENT_SOURCE_MANIFEST_SHA256,
        "fresh_gauges": gauges,
    }


def _coordinate_polynomials(sigma: int) -> dict[str, tuple[Poly, Poly]]:
    if sigma not in {-1, 1}:
        raise Profile282BoQfnraError("normalization sign is invalid")
    signed_r = _p_var("r") if sigma > 0 else _p_neg(_p_var("r"))
    fixed = {
        "c000": (_p_const(0), _p_const(0)),
        "c001": (_p_const(1), _p_const(0)),
        "c002": (_p_const(Fraction(3, 2)), signed_r),
        "c003": (_p_const(Fraction(1, 2)), signed_r),
    }
    return {
        **fixed,
        **{
            class_id: (_p_var(f"x_{class_id}"), _p_var(f"y_{class_id}"))
            for class_id in REMAINING_CLASSES
        },
    }


def _row_ledger(
    system: Mapping[str, Any], coords: Mapping[str, tuple[Poly, Poly]]
) -> list[dict[str, Any]]:
    role = system["role_class"]
    ledger = []
    for row in system["rows"]:
        center = role[row["center"]]
        first = role[row["support"][0]]
        for item in row["support"][1:]:
            other = role[item]
            polynomial = _p_sub(
                _sqdist_poly(coords, center, first),
                _sqdist_poly(coords, center, other),
            )
            ledger.append(
                {
                    "row_id": row["id"],
                    "center": center,
                    "first_support": first,
                    "other_support": other,
                    "polynomial": _poly_json(polynomial),
                    "reduced_smt": _poly_smt(polynomial),
                    "identically_zero": not polynomial,
                }
            )
    if len(ledger) != 13:
        raise Profile282BoQfnraError("row ledger does not contain all 13 equalities")
    return ledger


def _area_ledger(
    order: Sequence[str], coords: Mapping[str, tuple[Poly, Poly]]
) -> list[dict[str, Any]]:
    ledger = []
    for triple in itertools.combinations(order, 3):
        polynomial = _area_poly(coords, *triple)
        ledger.append(
            {
                "triple": list(triple),
                "polynomial": _poly_json(polynomial),
                "reduced_smt": _poly_smt(polynomial),
                "identically_zero": not polynomial,
            }
        )
    if len(ledger) != 286:
        raise Profile282BoQfnraError("signed-area ledger does not contain 286 triples")
    return ledger


def _normalization_record(
    order_id: str,
    order: Sequence[str],
    rows: Sequence[Mapping[str, Any]],
    areas: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    sigma = ORDER_SIGMAS[order_id]
    row_by_key = {
        (entry["center"], entry["first_support"], entry["other_support"]): entry
        for entry in rows
    }
    required_rows = (
        ("c001", "c003", "c000"),
        ("c001", "c003", "c002"),
        ("c000", "c001", "c003"),
        ("c002", "c001", "c003"),
    )
    for key in required_rows:
        entry = row_by_key.get(key)
        if entry is None:
            raise Profile282BoQfnraError(f"normalization source row is absent: {key}")
        poly = {
            tuple(term["monomial"]): Fraction(*term["coefficient"])
            for term in entry["polynomial"]
        }
        if _reduce_modulus(poly):
            raise Profile282BoQfnraError(f"normalization row does not reduce: {key}")
    by_triple = {tuple(entry["triple"]): entry for entry in areas}
    sign_triples = (
        (("c000", "c003", "c002"),) if sigma < 0 else (("c000", "c001", "c003"),)
    )
    for triple in sign_triples:
        entry = by_triple.get(triple)
        if entry is None or entry["polynomial"] != _poly_json(_p_var("r")):
            raise Profile282BoQfnraError(f"normalization sign replay failed: {triple}")
    signed = "-r" if sigma < 0 else "r"
    return {
        "gauge": {"B": [0, 0], "O": [1, 0]},
        "sigma": sigma,
        "substitution": {
            "c000": ["0", "0"],
            "c001": ["1", "0"],
            "c002": ["3/2", signed],
            "c003": ["1/2", signed],
        },
        "modulus": "4*r^2-3=0",
        "root_sign": "r>0",
        "source_row_keys": [list(key) for key in required_rows],
        "source_orientation_sign_triples": [list(triple) for triple in sign_triples],
        "order": list(order),
    }


def _build_target_from_prior(
    prior: Mapping[str, Any], order_id: str
) -> dict[str, Any]:
    if order_id not in ORDER_IDS:
        raise Profile282BoQfnraError(f"unknown target order: {order_id}")
    gauge = prior["fresh_gauges"][ORDER_IDS.index(order_id)]
    order = tuple(gauge["order"])
    if order != EXPECTED_ORDERS[order_id] or gauge.get("sigma") != ORDER_SIGMAS[order_id]:
        raise Profile282BoQfnraError("target order differs from authenticated parent")
    source = _source_core(order)
    coords = _coordinate_polynomials(ORDER_SIGMAS[order_id])
    rows = _row_ledger(source, coords)
    areas = _area_ledger(order, coords)
    role = source["role_class"]
    radius = _p_sub(
        _sqdist_poly(coords, role["c2"], role["O"]),
        _sqdist_poly(coords, role["c2"], role["d"]),
    )
    strict = _p_sub(
        _sqdist_poly(coords, role["e"], role["d"]),
        _sqdist_poly(coords, role["e"], role["a"]),
    )
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "order_id": order_id,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "authenticated_order": list(order),
        "authenticated_order_sha256": gauge["order_sha256"],
        "authenticated_parent_result_sha256": gauge["parent_result_sha256"],
        "authenticated_parent_source_manifest_sha256": gauge[
            "parent_source_manifest_sha256"
        ],
        "source_classes": source["classes"],
        "role_class": source["role_class"],
        "source_rows": source["rows"],
        "variables": list(TARGET_VARIABLES),
        "normalization": _normalization_record(order_id, order, rows, areas),
        "area_ledger": areas,
        "row_equality_ledger": rows,
        "radius_disequality": {
            "polynomial": _poly_json(radius),
            "reduced_smt": _poly_smt(radius),
            "relation": "!=0",
        },
        "source_strict": {
            "polynomial": _poly_json(strict),
            "reduced_smt": _poly_smt(strict),
            "relation": "<0",
        },
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(order_id: str) -> dict[str, Any]:
    return _build_target_from_prior(authenticate_source_orders(), order_id)


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in CONTROL_IDS:
        raise Profile282BoQfnraError("unknown control")
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
        raise Profile282BoQfnraError("semantic system is malformed")
    if system.get("kind") == "control":
        expected = build_control_system(system.get("control"))
    elif system.get("kind") == "target":
        expected = _build_target_from_prior(
            prior or authenticate_source_orders(), system.get("order_id")
        )
    else:
        raise Profile282BoQfnraError("semantic system kind is invalid")
    if system != expected:
        raise Profile282BoQfnraError("semantic system drifted from source ledger")
    return dict(system)


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    if system["kind"] == "control":
        return {
            "variable_declarations": 1,
            "normalization_assertions": 0,
            "strict_signed_area_assertions": 0,
            "row_equality_assertions": 0,
            "radius_disequality_assertions": 0,
            "source_strict_assertions": 0,
            "control_assertions": 1 if system["control"] == "positive" else 2,
        }
    return {
        "variable_declarations": len(system["variables"]),
        "normalization_assertions": 2,
        "strict_signed_area_assertions": len(system["area_ledger"]),
        "row_equality_assertions": len(system["row_equality_ledger"]),
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
    out.extend(("(assert (= (+ (* 4 r r) (- 3)) 0))", "(assert (> r 0))"))
    out.extend(
        f"(assert (> {entry['reduced_smt']} 0))"
        for entry in current["area_ledger"]
    )
    out.extend(
        f"(assert (= {entry['reduced_smt']} 0))"
        for entry in current["row_equality_ledger"]
    )
    out.append(
        f"(assert (not (= {current['radius_disequality']['reduced_smt']} 0)))"
    )
    out.append(f"(assert (< {current['source_strict']['reduced_smt']} 0))")
    return tuple(out)


def _source_record(prior: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": "p97-exactfive-hard-source-swap-profile282-source-record/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "parent_custody": dict(prior),
        "orders": {key: list(value) for key, value in EXPECTED_ORDERS.items()},
        "claim_boundary": "two authenticated profile-282 order formulas only",
        "claims": dict(FALSE_CLAIMS),
    }


def _source_snapshots(prior: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    sources = (
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record(prior))),
        adapter.SourceSnapshot("parent-run-manifest.json", _read_regular(PARENT_MANIFEST_PATH)),
        adapter.SourceSnapshot("parent-launch.json", _read_regular(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot("parent-terminal.json", _read_regular(PARENT_TERMINAL_PATH)),
        adapter.SourceSnapshot(
            "parent-profile-result.json", _read_regular(PARENT_RESULT_PATH)
        ),
        adapter.SourceSnapshot(
            "parent-profile-source-manifest.json",
            _read_regular(PARENT_SOURCE_MANIFEST_PATH),
        ),
        adapter.SourceSnapshot(
            "implementation-profile282.py", _read_regular(Path(__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-sibling.py", _read_regular(Path(sibling.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-frozen-nra.py", _read_regular(Path(frozen_nra.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-frozen-order.py",
            _read_regular(Path(frozen_order.__file__)),
        ),
        adapter.SourceSnapshot("implementation-adapter.py", _read_regular(Path(adapter.__file__))),
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
        raise Profile282BoQfnraError("query timeout is invalid")
    prior = authenticate_source_orders()
    current = _validate_system_current(system, prior)
    commands = build_smt_commands(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile282BoQfnraError("SMT journal normalization drifted")
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
            "id": "p97-exactfive-hard-source-swap-profile282-bo-source-qfnra",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "exact-rational-profile282-expansion-and-source-replay",
            "version": "v1",
        },
        "stage_id": "profile282-bo-source-qfnra",
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


def parse_exact_values(values: str, terms: Sequence[str]) -> dict[str, Fraction]:
    try:
        return sibling.parse_exact_values(values, terms)
    except Exception as exc:
        raise Profile282BoQfnraError(str(exc)) from exc


def _expand_coordinates(
    values: Mapping[str, Fraction], sigma: int
) -> dict[str, tuple[Fraction, Fraction]]:
    r = values["r"]
    signed_r = r if sigma > 0 else -r
    coords = {
        "c000": (Fraction(0), Fraction(0)),
        "c001": (Fraction(1), Fraction(0)),
        "c002": (Fraction(3, 2), signed_r),
        "c003": (Fraction(1, 2), signed_r),
    }
    coords.update(
        {
            class_id: (values[f"x_{class_id}"], values[f"y_{class_id}"])
            for class_id in REMAINING_CLASSES
        }
    )
    return coords


def _transform_to_rank_gauge(
    order: Sequence[str], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, tuple[Fraction, Fraction]]:
    bx, by = coords[order[0]]
    px, py = coords[order[1]]
    vx, vy = px - bx, py - by
    denominator = vx * vx + vy * vy
    if denominator <= 0:
        raise Profile282BoQfnraError("rank-one point collides with B")
    transformed = {}
    for class_id, (x, y) in coords.items():
        dx, dy = x - bx, y - by
        transformed[class_id] = (
            (vx * dx + vy * dy) / denominator,
            (-vy * dx + vx * dy) / denominator,
        )
    return transformed


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise Profile282BoQfnraError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile282BoQfnraError("semantic input is malformed")
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
        raise Profile282BoQfnraError("descriptor, source ledger, or journal drifted")
    try:
        parsed = parse_exact_values(values, query.get_values)
    except Profile282BoQfnraError as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    else:
        if system["kind"] == "control":
            accepted = (
                parsed == {"t": Fraction(1)}
                if system["control"] == "positive"
                else False
            )
            evidence = {
                "accepted": accepted,
                "control": system["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            r = parsed["r"]
            if 4 * r * r - 3 != 0 or r <= 0:
                evidence = {"accepted": False, "reason": "normalization_modulus_or_sign"}
            else:
                sigma = system["normalization"]["sigma"]
                coords = _expand_coordinates(parsed, sigma)
                source = _source_core(system["authenticated_order"])
                transformed = _transform_to_rank_gauge(
                    system["authenticated_order"], coords
                )
                replay = frozen_nra.check_coordinates(source, transformed)
                evidence = {
                    **replay,
                    "accepted": bool(replay.get("accepted")),
                    "expanded_class_count": len(coords),
                    "normalization_replayed": True,
                    "normalization_sigma": sigma,
                    "original_source_checker": (
                        "exactfive_hard_source_swap_nra_piqd.check_coordinates"
                    ),
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
        raise Profile282BoQfnraError("adapter artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile282BoQfnraError("adapter artifact path is unsafe or duplicated")
    payload = _read_regular(root / name)
    if (
        type(record["bytes"]) is not int
        or record["bytes"] != len(payload)
        or type(record["sha256"]) is not str
        or record["sha256"] != _sha(payload)
    ):
        raise Profile282BoQfnraError(f"adapter artifact digest mismatch: {name}")
    seen.add(name)
    return payload


def verify_adapter_tree(
    prepared: PreparedQuery, output_directory: Path
) -> dict[str, Any]:
    """Revalidate immutable PIQD artifacts and exact semantic replay."""

    if not output_directory.is_dir() or output_directory.is_symlink():
        raise Profile282BoQfnraError("adapter output directory is unsafe")
    result = _strict_json(
        _read_regular(output_directory / "result.json"), "adapter result"
    )
    if (
        result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise Profile282BoQfnraError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "manifest",
        "sources",
    }:
        raise Profile282BoQfnraError("adapter custody is malformed")
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
        raise Profile282BoQfnraError("adapter query or manifest custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(
        prepared.query.source_files
    ):
        raise Profile282BoQfnraError("adapter source custody count drifted")
    for record, expected in zip(
        source_records, prepared.query.source_files, strict=True
    ):
        if _verify_artifact(output_directory, record, seen) != expected.payload:
            raise Profile282BoQfnraError("adapter source snapshot differs")
    engines = result.get("engines")
    if (
        type(engines) is not list
        or [row.get("solver") for row in engines if type(row) is dict]
        != list(adapter.SOLVERS)
    ):
        raise Profile282BoQfnraError("adapter engine inventory is malformed")
    for engine in engines:
        if type(engine) is not dict or engine.get("raw_status") not in {
            "SAT",
            "UNSAT",
            "UNKNOWN",
        }:
            raise Profile282BoQfnraError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise Profile282BoQfnraError("adapter engine artifacts are malformed")
        try:
            frozen_order._validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise Profile282BoQfnraError("adapter artifact labels drifted") from exc
        payloads = {
            label: _verify_artifact(output_directory, record, seen)
            for label, record in artifacts.items()
        }
        bridge = sibling.adaptive.PreparedQuery(
            prepared.key, "planar", prepared.system, None, prepared.query
        )
        try:
            custody_solve = sibling.adaptive._validate_engine_custody(
                bridge, engine, payloads
            )
        except Exception as exc:
            raise Profile282BoQfnraError("adapter engine custody failed") from exc
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
            raise Profile282BoQfnraError("adapter solve digest is inconsistent")
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if effective != "UNSAT_DISCOVERY_ONLY" or engine.get("semantic_replay") is not None:
                raise Profile282BoQfnraError("UNSAT custody classification drifted")
        elif raw == "UNKNOWN":
            if effective != "INCONCLUSIVE_UNKNOWN" or engine.get("semantic_replay") is not None:
                raise Profile282BoQfnraError("UNKNOWN custody classification drifted")
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if semantic_payload is None or _strict_json(
                semantic_payload, f"{engine['solver']} semantic"
            ) != semantic:
                raise Profile282BoQfnraError("SAT semantic artifact drifted")
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
                    raise Profile282BoQfnraError("SAT verifier-failure drifted") from exc
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
                    raise Profile282BoQfnraError("SAT semantic replay drifted")
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
        raise Profile282BoQfnraError("adapter overall status is inconsistent")
    entries = tuple(output_directory.iterdir())
    if any(
        entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        for entry in entries
    ) or {entry.name for entry in entries} != seen:
        raise Profile282BoQfnraError("adapter output contains unbound artifacts")
    return dict(result)


def run_query(
    prepared: PreparedQuery,
    output_directory: Path,
    transport: adapter.PiqdTransport,
) -> dict[str, Any]:
    if output_directory.exists():
        return verify_adapter_tree(prepared, output_directory)
    adapter.run_source_semantic_query(
        prepared.query, output_directory, transport, verify_sat_model
    )
    return verify_adapter_tree(prepared, output_directory)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile282BoQfnraError("manifest source lies outside repository") from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile282BoQfnraError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = [
        Path(__file__),
        SPEC_PATH,
        RUNNER_PATH,
        Path(sibling.__file__),
        Path(frozen_nra.__file__),
        Path(frozen_order.__file__),
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
        raise Profile282BoQfnraError(f"immutable artifact already exists: {path}") from exc
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
    except BaseException:
        path.unlink(missing_ok=True)
        raise


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    if RUN_ROOT.is_symlink():
        raise Profile282BoQfnraError("run root is a symlink")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    if not RUN_ROOT.is_dir() or RUN_ROOT.is_symlink():
        raise Profile282BoQfnraError("run root is unsafe")
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        path.mkdir(exist_ok=True)
        if path.is_symlink() or not path.is_dir():
            raise Profile282BoQfnraError("run-root child is unsafe")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists():
        observed = _strict_json(_read_regular(manifest_path), "run manifest")
        created = observed.get("created_utc")
        if type(created) is not str or observed != _expected_run_manifest(created):
            raise Profile282BoQfnraError("run manifest or source digest drifted")
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
        "result_sha256": _sha(_read_regular(root / "artifacts" / key / "result.json")),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    raw = [engine.get("raw_status") for engine in result.get("engines", [])]
    if raw != [expected, expected]:
        raise Profile282BoQfnraError(f"{key} did not produce {expected}/{expected}")
    if expected == "SAT" and any(
        engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
        for engine in result["engines"]
    ):
        raise Profile282BoQfnraError("positive control failed exact replay")


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
        "claim_boundary": "two authenticated profile-282 source-order formulas only",
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
        raise Profile282BoQfnraError("terminal record is malformed")
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
        raise Profile282BoQfnraError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = 2,
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= 2:
        raise Profile282BoQfnraError("workers must lie in 1..2")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile282BoQfnraError("timeout must be exact milliseconds in (0,3600]")
    server = _validate_server(server)
    timeout_ms = int(timeout_s * 1000)
    root, manifest = ensure_run_root()
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events/launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile282BoQfnraError("launch record differs on resume")
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
            raise Profile282BoQfnraError("terminal differs from artifact replay")
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


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_diagnostic(
            server=args.server, timeout_s=args.timeout, workers=args.workers
        )
    except (Profile282BoQfnraError, adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "CONTROL_IDS",
    "DEFAULT_TIMEOUT_S",
    "EXPECTED_CLASSES",
    "EXPECTED_ORDERS",
    "LANE_ID",
    "ORDER_IDS",
    "ORDER_SIGMAS",
    "PROFILE_INDEX",
    "PROFILE_SHA256",
    "RUN_ID",
    "RUN_ROOT",
    "TARGET_VARIABLES",
    "PreparedQuery",
    "Profile282BoQfnraError",
    "authenticate_source_orders",
    "build_control_system",
    "build_smt_commands",
    "build_target_system",
    "ensure_run_root",
    "formula_inventory",
    "main",
    "parse_exact_values",
    "prepare_query",
    "run_diagnostic",
    "run_query",
    "verify_adapter_tree",
    "verify_sat_model",
]
