"""Source-ledger QF_NRA probe for profile 1697 in a fixed B--O gauge.

Every solver call is routed through the maintained PIQD SMT adapter.  The
producer binds the completed adaptive-order run, substitutes five coordinates
symbolically, retains every source assertion, and accepts SAT only after exact
rational replay on the original eleven quotient classes.  Algebraic readback
that the exact parser cannot certify is deliberately inconclusive.
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
import urllib.parse
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any, Literal

from census.card_head import (
    exactfive_hard_source_swap_adaptive_equality_core_piqd as equality_core,
)
from census.card_head import (
    exactfive_hard_source_swap_adaptive_order_nra_piqd as adaptive,
)
from census.card_head import exactfive_hard_source_swap_nra_piqd as frozen_nra
from census.card_head import exactfive_hard_source_swap_order_piqd as frozen_order
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-bo-source-qfnra-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / "docs" / "specs" / "p97-exactfive-hard-source-swap-bo-source-qfnra-v1.md"
PROFILE_INDEX = 1697
PROFILE_SHA256 = "59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e"
SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-bo-source-qfnra-system/v1"
PRODUCER_VERSION = "p97-exactfive-hard-source-swap-bo-source-qfnra/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-bo-source-qfnra-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-hard-source-swap-bo-source-qfnra-result/v1"
CONTROL_IDS = ("positive", "negative")
ORDER_IDS = ("fresh-z3", "fresh-cvc5")
QUERY_KEYS = ("control-positive", "control-negative", *ORDER_IDS)
MAX_WORKERS = 2
REMAINING_CLASSES = ("c004", "c006", "c007", "c008", "c009", "c010")
TARGET_VARIABLES = ("r",) + tuple(
    f"{axis}_{class_id}" for class_id in REMAINING_CLASSES for axis in ("x", "y")
)
EXPECTED_ORDERS = {
    "fresh-z3": (
        "c000", "c010", "c009", "c005", "c008", "c007", "c001",
        "c006", "c002", "c004", "c003",
    ),
    "fresh-cvc5": (
        "c000", "c008", "c009", "c007", "c005", "c010", "c001",
        "c006", "c002", "c004", "c003",
    ),
}
FALSE_CLAIMS = {
    "live_source_alias_completeness": False,
    "source_realization": False,
    "all_order_elimination": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_bo_source_qfnra_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_bo_source_qfnra_piqd.py",
    "docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-bo-source-qfnra-plan.md",
    "docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-bo-source-qfnra-run-0001.md",
    "docs/computation/exactfive-hard-source-swap-bo-source-qfnra-20260903/run-0001-summary.json",
    "docs/skeptic-exactfive-hard-source-swap-bo-normalization-2026-09-03.md",
    "docs/specs/p97-exactfive-hard-source-swap-bo-source-qfnra-v1.md",
    "scripts/run_exactfive_hard_source_swap_bo_source_qfnra_piqd.py",
]
_INT = re.compile(r"^-?(?:0|[1-9][0-9]*)$")
_DECIMAL = re.compile(r"^-?(?:0|[1-9][0-9]*)\.[0-9]+$")


class BoSourceQfnraError(RuntimeError):
    """The B--O source-ledger lane failed closed."""


Monomial = tuple[str, ...]
Poly = dict[Monomial, Fraction]


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii")


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
        raise BoSourceQfnraError(f"artifact is missing or unreadable: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise BoSourceQfnraError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise BoSourceQfnraError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise BoSourceQfnraError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise BoSourceQfnraError(f"{where} is not an object")
    return value


def _p_const(value: int | Fraction) -> Poly:
    fraction = Fraction(value)
    return {} if fraction == 0 else {(): fraction}


def _p_var(name: str) -> Poly:
    return {(name,): Fraction(1)}


def _p_add(left: Poly, right: Poly) -> Poly:
    out = dict(left)
    for monomial, coefficient in right.items():
        out[monomial] = out.get(monomial, Fraction(0)) + coefficient
        if out[monomial] == 0:
            del out[monomial]
    return out


def _p_neg(value: Poly) -> Poly:
    return {monomial: -coefficient for monomial, coefficient in value.items()}


def _p_sub(left: Poly, right: Poly) -> Poly:
    return _p_add(left, _p_neg(right))


def _p_mul(left: Poly, right: Poly) -> Poly:
    out: Poly = {}
    for left_monomial, left_coefficient in left.items():
        for right_monomial, right_coefficient in right.items():
            monomial = tuple(sorted((*left_monomial, *right_monomial)))
            out[monomial] = out.get(monomial, Fraction(0)) + left_coefficient * right_coefficient
            if out[monomial] == 0:
                del out[monomial]
    return out


def _poly_json(poly: Poly) -> list[dict[str, Any]]:
    return [
        {"monomial": list(monomial), "coefficient": [coefficient.numerator, coefficient.denominator]}
        for monomial, coefficient in sorted(poly.items())
    ]


def _fraction_smt(value: Fraction) -> str:
    absolute = abs(value)
    body = str(absolute.numerator) if absolute.denominator == 1 else f"(/ {absolute.numerator} {absolute.denominator})"
    return body if value >= 0 else f"(- {body})"


def _poly_smt(poly: Poly) -> str:
    terms: list[str] = []
    for monomial, coefficient in sorted(poly.items()):
        factors = [_fraction_smt(coefficient), *monomial]
        term = factors[0] if len(factors) == 1 else f"(* {' '.join(factors)})"
        terms.append(term)
    if not terms:
        return "0"
    return terms[0] if len(terms) == 1 else f"(+ {' '.join(terms)})"


def _coordinate_polynomials() -> dict[str, tuple[Poly, Poly]]:
    half = Fraction(1, 2)
    r = _p_var("r")
    fixed = {
        "c000": (_p_const(0), _p_const(0)),
        "c001": (_p_const(1), _p_const(0)),
        "c002": (_p_const(Fraction(3, 2)), r),
        "c003": (_p_const(half), r),
        "c005": (_p_const(half), _p_neg(r)),
    }
    return {
        **fixed,
        **{
            class_id: (_p_var(f"x_{class_id}"), _p_var(f"y_{class_id}"))
            for class_id in REMAINING_CLASSES
        },
    }


def _area_poly(coords: Mapping[str, tuple[Poly, Poly]], a: str, b: str, c: str) -> Poly:
    xa, ya = coords[a]
    xb, yb = coords[b]
    xc, yc = coords[c]
    return _p_sub(_p_mul(_p_sub(xb, xa), _p_sub(yc, ya)), _p_mul(_p_sub(yb, ya), _p_sub(xc, xa)))


def _sqdist_poly(coords: Mapping[str, tuple[Poly, Poly]], a: str, b: str) -> Poly:
    dx = _p_sub(coords[a][0], coords[b][0])
    dy = _p_sub(coords[a][1], coords[b][1])
    return _p_add(_p_mul(dx, dx), _p_mul(dy, dy))


def _reduce_modulus(poly: Poly) -> Poly:
    out: Poly = {}
    for monomial, coefficient in poly.items():
        if all(name == "r" for name in monomial) and len(monomial) == 2:
            out = _p_add(out, _p_const(coefficient * Fraction(3, 4)))
        else:
            out = _p_add(out, {monomial: coefficient})
    return out


def authenticate_source_orders() -> dict[str, Any]:
    """Replay and bind the completed adaptive run that supplied both orders."""

    try:
        prior = equality_core.revalidate_prior_adaptive_run()
    except Exception as exc:
        raise BoSourceQfnraError("adaptive source-order authentication failed") from exc
    gauges = prior.get("fresh_gauges")
    if type(gauges) is not list or len(gauges) != 2:
        raise BoSourceQfnraError("authenticated adaptive order list is malformed")
    expected_solvers = ("z3", "cvc5")
    for index, (order_id, expected_order) in enumerate(EXPECTED_ORDERS.items()):
        gauge = gauges[index]
        if (
            type(gauge) is not dict
            or gauge.get("solver") != expected_solvers[index]
            or tuple(gauge.get("order", ())) != expected_order
            or gauge.get("order_sha256") != adaptive.order_sha256(expected_order)
        ):
            raise BoSourceQfnraError(f"authenticated adaptive order drifted: {order_id}")
    return prior


def _source_core(order: Sequence[str]) -> dict[str, Any]:
    system = adaptive.build_planar_system(order)
    if system.get("profile_index") != PROFILE_INDEX or system.get("profile_sha256") != PROFILE_SHA256:
        raise BoSourceQfnraError("profile identity drifted")
    return system


def _row_ledger(system: Mapping[str, Any], coords: Mapping[str, tuple[Poly, Poly]]) -> list[dict[str, Any]]:
    role = system["role_class"]
    ledger: list[dict[str, Any]] = []
    for row in system["rows"]:
        center = role[row["center"]]
        first = role[row["support"][0]]
        for item in row["support"][1:]:
            other = role[item]
            polynomial = _p_sub(_sqdist_poly(coords, center, first), _sqdist_poly(coords, center, other))
            ledger.append(
                {
                    "row_id": row["id"],
                    "center": center,
                    "first_support": first,
                    "other_support": other,
                    "polynomial": _poly_json(polynomial),
                    "reduced_smt": _poly_smt(polynomial),
                }
            )
    if len(ledger) != 13:
        raise BoSourceQfnraError("row ledger does not contain all 13 equalities")
    return ledger


def _area_ledger(order: Sequence[str], coords: Mapping[str, tuple[Poly, Poly]]) -> list[dict[str, Any]]:
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
    if len(ledger) != 165:
        raise BoSourceQfnraError("signed-area ledger does not contain all 165 triples")
    return ledger


def _normalization_record(order: Sequence[str], rows: Sequence[Mapping[str, Any]], areas: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    row_by_pair = {
        (entry["center"], entry["first_support"], entry["other_support"]): entry
        for entry in rows
    }
    required_rows = (
        ("c001", "c003", "c000"),
        ("c001", "c003", "c005"),
        ("c001", "c003", "c002"),
        ("c000", "c001", "c003"),
        ("c000", "c001", "c005"),
        ("c002", "c001", "c003"),
    )
    for key in required_rows:
        entry = row_by_pair.get(key)
        if entry is None:
            raise BoSourceQfnraError(f"normalization source equality is absent: {key}")
        poly = {tuple(term["monomial"]): Fraction(*term["coefficient"]) for term in entry["polynomial"]}
        if _reduce_modulus(poly):
            raise BoSourceQfnraError(f"normalization does not replay source equality: {key}")
    area_by_triple = {tuple(entry["triple"]): entry for entry in areas}
    sign_triples = (("c000", "c005", "c001"), ("c000", "c001", "c003"), ("c000", "c001", "c002"))
    for triple in sign_triples:
        entry = area_by_triple.get(triple)
        expected = _poly_json(_p_var("r"))
        if entry is None or entry["polynomial"] != expected:
            raise BoSourceQfnraError(f"normalization sign replay failed: {triple}")
    collision = ("c005", "c001", "c002")
    if collision not in area_by_triple or not area_by_triple[collision]["identically_zero"]:
        raise BoSourceQfnraError("S,O,Q collision triple did not reduce identically to zero")
    return {
        "gauge": {"B": [0, 0], "O": [1, 0]},
        "substitution": {
            "c000": ["0", "0"],
            "c001": ["1", "0"],
            "c002": ["3/2", "r"],
            "c003": ["1/2", "r"],
            "c005": ["1/2", "-r"],
        },
        "modulus": "4*r^2-3=0",
        "root_sign": "r>0",
        "source_row_keys": [list(key) for key in required_rows],
        "source_orientation_sign_triples": [list(triple) for triple in sign_triples],
        "fixed_collision_triple": list(collision),
        "fixed_collision_reduced_area": "0",
        "order": list(order),
    }


def _build_target_from_prior(prior: Mapping[str, Any], order_id: str) -> dict[str, Any]:
    if order_id not in ORDER_IDS:
        raise BoSourceQfnraError(f"unknown target order: {order_id}")
    index = ORDER_IDS.index(order_id)
    gauge = prior["fresh_gauges"][index]
    order = tuple(gauge["order"])
    if order != EXPECTED_ORDERS[order_id]:
        raise BoSourceQfnraError("target order differs from authenticated order")
    source = _source_core(order)
    coords = _coordinate_polynomials()
    rows = _row_ledger(source, coords)
    areas = _area_ledger(order, coords)
    normalization = _normalization_record(order, rows, areas)
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
        "authenticated_origin_sha256": gauge["origin_sha256"],
        "source_classes": source["classes"],
        "role_class": source["role_class"],
        "source_rows": source["rows"],
        "variables": list(TARGET_VARIABLES),
        "normalization": normalization,
        "area_ledger": areas,
        "row_equality_ledger": rows,
        "radius_disequality": {"polynomial": _poly_json(radius), "reduced_smt": _poly_smt(radius)},
        "source_strict": {"polynomial": _poly_json(strict), "reduced_smt": _poly_smt(strict), "relation": "<0"},
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(order_id: str) -> dict[str, Any]:
    return _build_target_from_prior(authenticate_source_orders(), order_id)


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in CONTROL_IDS:
        raise BoSourceQfnraError("unknown control")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "control": control,
        "variables": ["t"],
        "claims": dict(FALSE_CLAIMS),
    }


def _validate_system_current(system: object, prior: Mapping[str, Any] | None = None) -> dict[str, Any]:
    if type(system) is not dict or system.get("schema") != SYSTEM_SCHEMA or system.get("claims") != FALSE_CLAIMS:
        raise BoSourceQfnraError("semantic system is malformed")
    if system.get("kind") == "control":
        expected = build_control_system(system.get("control"))
    elif system.get("kind") == "target":
        expected = _build_target_from_prior(prior or authenticate_source_orders(), system.get("order_id"))
    else:
        raise BoSourceQfnraError("semantic system kind is invalid")
    if system != expected:
        raise BoSourceQfnraError("semantic system drifted from current source ledger")
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
    out.extend(f"(assert (> {entry['reduced_smt']} 0))" for entry in current["area_ledger"])
    out.extend(f"(assert (= {entry['reduced_smt']} 0))" for entry in current["row_equality_ledger"])
    out.append(f"(assert (not (= {current['radius_disequality']['reduced_smt']} 0)))")
    out.append(f"(assert (< {current['source_strict']['reduced_smt']} 0))")
    return tuple(out)


def _source_record(prior: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": "p97-exactfive-hard-source-swap-bo-source-record/v1",
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "prior_adaptive": dict(prior),
        "orders": {key: list(value) for key, value in EXPECTED_ORDERS.items()},
        "claim_boundary": "two authenticated profile-1697 order cells; live-source alias completeness absent",
        "claims": dict(FALSE_CLAIMS),
    }


def _source_snapshots(prior: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    sources = (
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record(prior))),
        adapter.SourceSnapshot("implementation-bo-source.py", _read_regular(Path(__file__))),
        adapter.SourceSnapshot("implementation-equality-custody.py", _read_regular(Path(equality_core.__file__))),
        adapter.SourceSnapshot("implementation-adaptive.py", _read_regular(Path(adaptive.__file__))),
        adapter.SourceSnapshot("implementation-frozen-nra.py", _read_regular(Path(frozen_nra.__file__))),
        adapter.SourceSnapshot("implementation-frozen-order.py", _read_regular(Path(frozen_order.__file__))),
        adapter.SourceSnapshot("implementation-adapter.py", _read_regular(Path(adapter.__file__))),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
    )
    return tuple(sorted(sources, key=lambda item: item.path))


def prepare_query(system: dict[str, Any], *, timeout_ms: int = 300_000) -> PreparedQuery:
    if type(timeout_ms) is not int or type(timeout_ms) is bool or not 0 < timeout_ms <= 3_600_000:
        raise BoSourceQfnraError("query timeout is invalid")
    prior = authenticate_source_orders()
    current = _validate_system_current(system, prior)
    commands = build_smt_commands(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise BoSourceQfnraError("SMT journal normalization drifted")
    inventory = formula_inventory(current)
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha(_canonical(current)),
        "formula_inventory": inventory,
        "journal_sha256": _sha(journal),
        "prior_adaptive_sha256": _sha(_canonical(prior)),
        "claims": dict(FALSE_CLAIMS),
    }
    sources = _source_snapshots(prior)
    variables = [
        {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
        for variable in current["variables"]
    ]
    variables.sort(key=lambda item: item["id"])
    key = f"control-{current['control']}" if current["kind"] == "control" else current["order_id"]
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {"id": "p97-exactfive-hard-source-swap-bo-source-qfnra", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-bo-expansion-and-original-source-replay", "version": "v1"},
        "stage_id": "bo-source-qfnra",
        "query_id": key,
        "sources": [{"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)} for item in sources],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": [],
        "solve": {"assumption_ids": [], "readback_variable_ids": [item["id"] for item in variables], "include_model": True},
        "solver_profile": {"schema": adapter.SOLVER_PROFILE_SCHEMA, "solvers": list(adapter.SOLVERS), "timeout_ms": timeout_ms},
    }
    query = adapter.SourceSemanticQuery(descriptor, _json(descriptor), journal, commands, journal, sources)
    return PreparedQuery(key, current, query)


def _number(value: object) -> Fraction:
    if isinstance(value, str) and _INT.fullmatch(value):
        return Fraction(int(value))
    if isinstance(value, str) and _DECIMAL.fullmatch(value):
        return Fraction(value)
    if isinstance(value, list) and len(value) == 3 and value[0] == "/":
        numerator = _number(value[1])
        denominator = _number(value[2])
        if denominator == 0 or numerator.denominator != 1 or denominator.denominator != 1:
            raise BoSourceQfnraError("unsupported exact rational numeral")
        return numerator / denominator
    if isinstance(value, list) and len(value) == 2 and value[0] == "-":
        return -_number(value[1])
    raise BoSourceQfnraError("exact algebraic readback is unavailable for this numeral")


def parse_exact_values(values: str, terms: Sequence[str]) -> dict[str, Fraction]:
    try:
        root = frozen_nra._sexpr(values)
    except Exception as exc:
        raise BoSourceQfnraError("get-value output is malformed") from exc
    if not isinstance(root, list):
        raise BoSourceQfnraError("get-value root is not a list")
    found: dict[str, Fraction] = {}
    for item in root:
        if not isinstance(item, list) or len(item) != 2 or not isinstance(item[0], str):
            raise BoSourceQfnraError("get-value entry is malformed")
        if item[0] in found:
            raise BoSourceQfnraError("get-value contains duplicate terms")
        found[item[0]] = _number(item[1])
    if set(found) != set(terms):
        raise BoSourceQfnraError("get-value variable set drifted")
    return found


def _expand_coordinates(values: Mapping[str, Fraction]) -> dict[str, tuple[Fraction, Fraction]]:
    r = values["r"]
    coords = {
        "c000": (Fraction(0), Fraction(0)),
        "c001": (Fraction(1), Fraction(0)),
        "c002": (Fraction(3, 2), r),
        "c003": (Fraction(1, 2), r),
        "c005": (Fraction(1, 2), -r),
    }
    coords.update({class_id: (values[f"x_{class_id}"], values[f"y_{class_id}"]) for class_id in REMAINING_CLASSES})
    return coords


def _transform_to_rank_gauge(order: Sequence[str], coords: Mapping[str, tuple[Fraction, Fraction]]) -> dict[str, tuple[Fraction, Fraction]]:
    bx, by = coords[order[0]]
    px, py = coords[order[1]]
    vx, vy = px - bx, py - by
    denominator = vx * vx + vy * vy
    if denominator <= 0:
        raise BoSourceQfnraError("rank-one point collides with B")
    transformed = {}
    for class_id, (x, y) in coords.items():
        dx, dy = x - bx, y - by
        transformed[class_id] = (
            (vx * dx + vy * dy) / denominator,
            (-vy * dx + vx * dy) / denominator,
        )
    return transformed


def verify_sat_model(query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise BoSourceQfnraError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise BoSourceQfnraError("semantic input is malformed")
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
        or semantic.get("prior_adaptive_sha256") != _sha(_canonical(prior))
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise BoSourceQfnraError("descriptor, source ledger, or journal drifted")
    try:
        parsed = parse_exact_values(values, query.get_values)
    except BoSourceQfnraError as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
            "solver": solver,
            "model_sha256": _sha(model.encode("utf-8")),
            "values_sha256": _sha(values.encode("utf-8")),
            "system_sha256": _sha(_canonical(system)),
        }
        return adapter.SemanticVerification(False, evidence)
    if system["kind"] == "control":
        accepted = parsed == {"t": Fraction(1)} if system["control"] == "positive" else False
        evidence = {"accepted": accepted, "control": system["control"], "values": {key: str(value) for key, value in parsed.items()}}
    else:
        r = parsed["r"]
        if 4 * r * r - 3 != 0 or r <= 0:
            evidence = {"accepted": False, "reason": "normalization_modulus_or_sign"}
        else:
            coords = _expand_coordinates(parsed)
            original = _source_core(system["authenticated_order"])
            transformed = _transform_to_rank_gauge(system["authenticated_order"], coords)
            replay = frozen_nra.check_coordinates(original, transformed)
            evidence = {
                **replay,
                "accepted": bool(replay.get("accepted")),
                "expanded_class_count": len(coords),
                "normalization_replayed": True,
                "original_source_checker": "exactfive_hard_source_swap_nra_piqd.check_coordinates",
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
        raise BoSourceQfnraError("adapter artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise BoSourceQfnraError("adapter artifact path is unsafe or duplicated")
    if type(record["bytes"]) is not int or record["bytes"] < 0 or type(record["sha256"]) is not str:
        raise BoSourceQfnraError("adapter artifact digest record is malformed")
    payload = _read_regular(root / name)
    if len(payload) != record["bytes"] or _sha(payload) != record["sha256"]:
        raise BoSourceQfnraError(f"adapter artifact digest mismatch: {name}")
    seen.add(name)
    return payload


def verify_adapter_tree(prepared: PreparedQuery, output_directory: Path) -> dict[str, Any]:
    """Revalidate immutable PIQD artifacts, custody links, and semantic replay."""

    try:
        info = output_directory.lstat()
    except OSError as exc:
        raise BoSourceQfnraError("adapter output directory is missing") from exc
    if not stat.S_ISDIR(info.st_mode) or output_directory.is_symlink():
        raise BoSourceQfnraError("adapter output path is unsafe")
    result_payload = _read_regular(output_directory / "result.json")
    result = _strict_json(result_payload, "adapter result")
    if result.get("schema") != adapter.RESULT_SCHEMA or result.get("claims") != adapter.FALSE_CLAIMS:
        raise BoSourceQfnraError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {"descriptor", "original_smt2", "journal_smt2", "manifest", "sources"}:
        raise BoSourceQfnraError("adapter custody is malformed")
    descriptor = _verify_artifact(output_directory, custody["descriptor"], seen)
    original = _verify_artifact(output_directory, custody["original_smt2"], seen)
    journal = _verify_artifact(output_directory, custody["journal_smt2"], seen)
    manifest_payload = _verify_artifact(output_directory, custody["manifest"], seen)
    if descriptor != prepared.query.descriptor_bytes or original != prepared.query.original_smt2 or journal != prepared.query.journal_smt2:
        raise BoSourceQfnraError("adapter query custody differs from current producer")
    if result.get("source_manifest_sha256") != _sha(manifest_payload) or _strict_json(manifest_payload, "source manifest") != adapter._manifest(prepared.query):
        raise BoSourceQfnraError("adapter source manifest identity drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise BoSourceQfnraError("adapter source custody count drifted")
    for record, expected in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output_directory, record, seen) != expected.payload:
            raise BoSourceQfnraError("adapter source snapshot differs from current producer")
    engines = result.get("engines")
    if type(engines) is not list or [row.get("solver") for row in engines if type(row) is dict] != list(adapter.SOLVERS):
        raise BoSourceQfnraError("adapter engine list is malformed")
    for engine in engines:
        if type(engine) is not dict or engine.get("raw_status") not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise BoSourceQfnraError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise BoSourceQfnraError("adapter engine artifacts are malformed")
        try:
            frozen_order._validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise BoSourceQfnraError("adapter engine artifact labels drifted") from exc
        payloads = {label: _verify_artifact(output_directory, record, seen) for label, record in artifacts.items()}
        bridge = adaptive.PreparedQuery(
            prepared.key,
            "planar",
            prepared.system,
            None,
            prepared.query,
        )
        try:
            custody_solve = adaptive._validate_engine_custody(
                bridge,
                engine,
                payloads,
            )
        except Exception as exc:
            raise BoSourceQfnraError("adapter engine custody failed replay") from exc
        solve_label = "reconciled_solve" if engine.get("response_lost") else "solve"
        if solve_label not in payloads:
            raise BoSourceQfnraError("adapter solve artifact is missing")
        solve = _strict_json(payloads[solve_label], f"{engine['solver']} solve")
        if solve != custody_solve:
            raise BoSourceQfnraError("adapter engine custody returned another solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if (
            solve.get("status") != engine["raw_status"]
            or solve.get("result_sha256") != digest
            or engine.get("result_sha256") != digest
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != digest
            or advisory.get("matches_daemon") is not True
        ):
            raise BoSourceQfnraError("adapter solve digest is inconsistent")
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if effective != "UNSAT_DISCOVERY_ONLY" or engine.get("semantic_replay") is not None:
                raise BoSourceQfnraError("UNSAT custody classification drifted")
        elif raw == "UNKNOWN":
            if effective != "INCONCLUSIVE_UNKNOWN" or engine.get("semantic_replay") is not None:
                raise BoSourceQfnraError("UNKNOWN custody classification drifted")
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if semantic_payload is None or _strict_json(semantic_payload, f"{engine['solver']} semantic") != semantic:
                raise BoSourceQfnraError("SAT semantic replay artifact drifted")
            try:
                verification = verify_sat_model(prepared.query, engine["solver"], solve.get("model"), solve.get("values"))
            except Exception as exc:
                if effective != "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE" or semantic != {
                    "accepted": False,
                    "failure": type(exc).__name__,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                }:
                    raise BoSourceQfnraError("SAT verifier-failure custody drifted") from exc
            else:
                expected_semantic = {
                    "accepted": verification.accepted,
                    "evidence": verification.evidence,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                    "model_sha256": _sha(solve["model"].encode("utf-8")),
                    "values_sha256": _sha(solve["values"].encode("utf-8")),
                }
                expected_effective = "SAT_SEMANTICALLY_REPLAYED" if verification.accepted else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
                if semantic != expected_semantic or effective != expected_effective:
                    raise BoSourceQfnraError("SAT semantic replay does not revalidate")
                if verification.accepted and solve.get("model_replay", {}).get("outcome") != "SATISFIED":
                    raise BoSourceQfnraError("accepted SAT lacks daemon model replay")
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
        raise BoSourceQfnraError("adapter overall status is inconsistent")
    entries = tuple(output_directory.iterdir())
    if any(entry.is_symlink() or not entry.is_file() or entry.stat(follow_symlinks=False).st_nlink != 1 for entry in entries):
        raise BoSourceQfnraError("adapter output contains an unsafe artifact")
    if {entry.name for entry in entries} != seen:
        raise BoSourceQfnraError("adapter output contains unbound artifacts")
    return dict(result)


def run_query(prepared: PreparedQuery, output_directory: Path, transport: adapter.PiqdTransport) -> dict[str, Any]:
    if output_directory.exists():
        return verify_adapter_tree(prepared, output_directory)
    adapter.run_source_semantic_query(prepared.query, output_directory, transport, verify_sat_model)
    return verify_adapter_tree(prepared, output_directory)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise BoSourceQfnraError("manifest source lies outside the repository") from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256") != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise BoSourceQfnraError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = [Path(__file__), SPEC_PATH, Path(adaptive.__file__), Path(equality_core.__file__), Path(frozen_nra.__file__), Path(frozen_order.__file__), Path(adapter.__file__)]
    inputs = [equality_core.PRIOR_MANIFEST_PATH, equality_core.PRIOR_LAUNCH_PATH, equality_core.PRIOR_TERMINAL_PATH, equality_core.PRIOR_SUMMARY_PATH]
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
        raise BoSourceQfnraError(f"immutable artifact already exists: {path}") from exc
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
    except BaseException:
        path.unlink(missing_ok=True)
        raise


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        path.mkdir(exist_ok=True)
        if path.is_symlink() or not path.is_dir():
            raise BoSourceQfnraError("run-root child is unsafe")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists():
        observed = _strict_json(_read_regular(manifest_path), "run manifest")
        created = observed.get("created_utc")
        if type(created) is not str or observed != _expected_run_manifest(created):
            raise BoSourceQfnraError("run manifest or source digest drifted")
    else:
        observed = _expected_run_manifest(_utc_now())
        _create_once(manifest_path, _json(observed))
    return RUN_ROOT, observed


def _launch_record(manifest: Mapping[str, Any], server: str, timeout_ms: int, workers: int) -> dict[str, Any]:
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
        "raw_statuses": [engine.get("raw_status") for engine in result.get("engines", [])],
        "effective_statuses": [engine.get("effective_status") for engine in result.get("engines", [])],
        "result_sha256": _sha(_read_regular(root / "artifacts" / key / "result.json")),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    raw = [engine.get("raw_status") for engine in result.get("engines", [])]
    if raw != [expected, expected]:
        raise BoSourceQfnraError(f"{key} did not produce {expected}/{expected}")
    if expected == "SAT" and any(engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED" for engine in result["engines"]):
        raise BoSourceQfnraError("positive control did not pass exact semantic replay")


def _terminal_status(targets: Sequence[Mapping[str, Any]]) -> str:
    engines = [engine for target in targets for engine in target["engines"]]
    if any(engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED" for engine in engines):
        return "TARGET_SAT_REPLAYED"
    if engines and all(engine.get("raw_status") == "UNSAT" for engine in engines):
        return "TARGETS_UNSAT_DISCOVERY_ONLY"
    return "TARGET_INCONCLUSIVE"


def _terminal_record(root: Path, launch: Mapping[str, Any], results: Mapping[str, Mapping[str, Any]]) -> dict[str, Any]:
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": _terminal_status([results[key] for key in ORDER_IDS]),
        "results": {key: _result_record(root, key, results[key]) for key in QUERY_KEYS},
        "claim_boundary": "two authenticated profile-1697 source-order formulas only",
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict_json(_read_regular(path), "terminal")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("status") not in {"TARGET_SAT_REPLAYED", "TARGETS_UNSAT_DISCOVERY_ONLY", "TARGET_INCONCLUSIVE"}
        or set(terminal.get("results", {})) != set(QUERY_KEYS)
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise BoSourceQfnraError("terminal record is malformed")
    return terminal


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc or parsed.username is not None or parsed.password is not None or parsed.query or parsed.fragment:
        raise BoSourceQfnraError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(*, server: str = "http://127.0.0.1:7272", timeout_s: float = 300.0, workers: int = 2) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= MAX_WORKERS:
        raise BoSourceQfnraError("workers must lie in 1..2")
    if type(timeout_s) not in {int, float} or type(timeout_s) is bool or not math.isfinite(timeout_s) or not 0 < timeout_s <= 3600 or not float(timeout_s * 1000).is_integer():
        raise BoSourceQfnraError("timeout must be an exact millisecond value in (0,3600]")
    server = _validate_server(server)
    timeout_ms = int(timeout_s * 1000)
    root, manifest = ensure_run_root()
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events" / "launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise BoSourceQfnraError("launch record differs on resume")
    else:
        _create_once(launch_path, _json(launch))
    terminal_path = root / "events" / "terminal.json"
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{order_id: build_target_system(order_id) for order_id in ORDER_IDS},
    }
    prepared = {key: prepare_query(system, timeout_ms=timeout_ms) for key, system in systems.items()}
    if terminal_path.exists():
        stored = _read_terminal(terminal_path)
        results = {key: verify_adapter_tree(prepared[key], root / "artifacts" / key) for key in QUERY_KEYS}
        for key in ("control-positive", "control-negative"):
            _require_control(key, results[key])
        expected = _terminal_record(root, launch, results)
        if stored != expected:
            raise BoSourceQfnraError("terminal differs from complete artifact replay")
        return stored
    transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_s + 40)
    results: dict[str, dict[str, Any]] = {}
    for key in ("control-positive", "control-negative"):
        results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
        _require_control(key, results[key])
    def execute(key: str) -> tuple[str, dict[str, Any]]:
        return key, run_query(prepared[key], root / "artifacts" / key, transport)
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        for key, result in pool.map(execute, ORDER_IDS):
            results[key] = result
    terminal = _terminal_record(root, launch, results)
    _create_once(terminal_path, _json(terminal))
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=300.0)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_diagnostic(server=args.server, timeout_s=args.timeout, workers=args.workers)
    except (BoSourceQfnraError, adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "CONTROL_IDS",
    "EXPECTED_ORDERS",
    "LANE_ID",
    "ORDER_IDS",
    "PROFILE_INDEX",
    "PROFILE_SHA256",
    "RUN_ID",
    "RUN_ROOT",
    "TARGET_VARIABLES",
    "BoSourceQfnraError",
    "PreparedQuery",
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
