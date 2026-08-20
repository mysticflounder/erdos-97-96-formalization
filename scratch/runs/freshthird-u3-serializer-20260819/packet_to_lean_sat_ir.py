"""Serialize a validated U3 finite packet into source-arm-aware LeanSatIr.

The serializer is deliberately a finite replay adapter.  It does not turn the
Lean existential source theorem into executable data and it does not encode
Euclidean realizability.  A packet must first pass the same finite checks used
by the source ingress.  The emitted formula pins every finite table to that
packet, so a SAT model is a replay of the supplied packet rather than a new
claim about the universal leaf.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections.abc import Mapping
from itertools import combinations
from pathlib import Path
from typing import Any

PACKET_SCHEMA = "freshthird-u3-finite-packet/v1"
ARMS = ("qDeleted", "criticalShell")
FRAME_ROLES = ("q", "p", "t1", "t2", "t3", "u", "a0", "a1")


def _load_ir_base() -> Any:
    base = Path(__file__).parents[1] / "freshthird-leansat-u3-20260819" / "lean_sat_ir_u3.py"
    spec = importlib.util.spec_from_file_location("lean_sat_ir_u3_base", base)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load LeanSatIr base emitter: {base}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


BASE = _load_ir_base()
DOMAIN = "I"


def _canonical_json(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def packet_sha256(packet: Mapping[str, Any]) -> str:
    return hashlib.sha256(_canonical_json(packet)).hexdigest()


def _bad(path: str, message: str) -> ValueError:
    return ValueError(f"packet {path}: {message}")


def _as_index_list(raw: Any, path: str, n: int, size: int) -> list[int]:
    if not isinstance(raw, list) or len(raw) != size:
        raise _bad(path, f"expected a list of exactly {size} indices")
    if any(type(item) is not int for item in raw):
        raise _bad(path, "all entries must be integers")
    if len(set(raw)) != len(raw):
        raise _bad(path, "entries must be distinct")
    if any(item < 0 or item >= n for item in raw):
        raise _bad(path, f"entries must lie in 0..{n - 1}")
    return list(raw)


def validate_packet(raw: Mapping[str, Any]) -> dict[str, Any]:
    """Validate and normalize the finite projection of a source packet."""
    if raw.get("schema") != PACKET_SCHEMA:
        raise _bad("schema", f"expected {PACKET_SCHEMA!r}")
    arm = raw.get("arm")
    if arm not in ARMS:
        raise _bad("arm", f"expected one of {ARMS}")
    n = raw.get("carrier_card")
    if type(n) is not int or n < 8:
        raise _bad("carrier_card", "expected an integer at least 8")
    roles = raw.get("roles")
    if not isinstance(roles, dict):
        raise _bad("roles", "expected an object")
    expected = set(FRAME_ROLES) | {"x"}
    if arm == "qDeleted":
        expected.add("z")
    if set(roles) != expected:
        raise _bad("roles", f"expected exactly {sorted(expected)}")
    normalized_roles: dict[str, int] = {}
    for name, value in roles.items():
        if type(value) is not int or value < 0 or value >= n:
            raise _bad(f"roles.{name}", f"expected an index in 0..{n - 1}")
        normalized_roles[name] = value
    if len({normalized_roles[name] for name in FRAME_ROLES}) != len(FRAME_ROLES):
        raise _bad("roles", "the eight frame roles must be distinct")
    dangerous = _as_index_list(raw.get("dangerous"), "dangerous", n, 4)
    exact_radius = _as_index_list(raw.get("exact_radius"), "exact_radius", n, 3)
    bounded = _as_index_list(raw.get("bounded"), "bounded", n, 8)
    row = _as_index_list(raw.get("row"), "row", n, 4)
    if set(dangerous) != {normalized_roles[name] for name in ("q", "t1", "t2", "t3")}:
        raise _bad("dangerous", "must be exactly q, t1, t2, and t3")
    if not {normalized_roles[name] for name in FRAME_ROLES}.issubset(set(bounded)):
        raise _bad("bounded", "must contain all eight frame roles")
    if len(set(row) & set(dangerous)) > 2:
        raise _bad("row", "may meet dangerous in at most two points")
    if len(set(row) - set(dangerous)) < 2:
        raise _bad("row", "must have at least two points outside dangerous")
    if arm == "qDeleted":
        if normalized_roles["q"] in row:
            raise _bad("roles.q", "qDeleted row must omit q")
        if normalized_roles["z"] not in row:
            raise _bad("roles.z", "z must lie in the qDeleted row")
        if normalized_roles["z"] in bounded:
            raise _bad("roles.z", "z must lie outside bounded support")
    else:
        if normalized_roles["q"] not in row:
            raise _bad("roles.q", "criticalShell row must contain q")
    return {
        "schema": PACKET_SCHEMA,
        "arm": arm,
        "carrier_card": n,
        "roles": normalized_roles,
        "dangerous": dangerous,
        "exact_radius": exact_radius,
        "bounded": bounded,
        "row": row,
    }


def _pin_zero_arg(function: str, value: int) -> dict[str, Any]:
    return BASE.equality(BASE.application(function, []), BASE.literal(value))


def _pin_selector(function: str, domain: str, slot_count: int, values: list[int]) -> list[dict[str, Any]]:
    return [
        BASE.equality(
            BASE.application(function, [{"Lit": {"domain": domain, "value": slot}}]),
            BASE.literal(value),
        )
        for slot, value in enumerate(values)
    ]


def packet_to_ir(raw: Mapping[str, Any]) -> dict[str, Any]:
    packet = validate_packet(raw)
    n = packet["carrier_card"]
    roles = packet["roles"]
    point_terms = {
        name: BASE.application(f"point_{name}", []) for name in FRAME_ROLES
    }
    point_terms["x"] = BASE.application("source_x", [])
    functions = [
        {"name": f"point_{name}", "args": [], "codomain": DOMAIN}
        for name in FRAME_ROLES
    ]
    functions.append({"name": "source_x", "args": [], "codomain": DOMAIN})
    functions.extend([
        {"name": "dangerous_base", "args": ["S4"], "codomain": DOMAIN},
        {"name": "exact_radius", "args": ["S3"], "codomain": DOMAIN},
        {"name": "bounded_support", "args": ["S8"], "codomain": DOMAIN},
        {"name": "source_row", "args": ["S4"], "codomain": DOMAIN},
    ])
    clauses: list[dict[str, Any]] = []
    clauses.extend(
        BASE.neg(BASE.equality(point_terms[left], point_terms[right]))
        for left, right in combinations(FRAME_ROLES, 2)
    )
    clauses.extend(_pin_zero_arg(f"point_{name}", roles[name]) for name in FRAME_ROLES)
    clauses.append(_pin_zero_arg("source_x", roles["x"]))
    clauses.extend(_pin_selector("dangerous_base", "S4", 4, packet["dangerous"]))
    clauses.extend(_pin_selector("exact_radius", "S3", 3, packet["exact_radius"]))
    clauses.extend(_pin_selector("bounded_support", "S8", 8, packet["bounded"]))
    clauses.extend(_pin_selector("source_row", "S4", 4, packet["row"]))
    clauses.extend(
        BASE.selector_constraints(
            "dangerous_base", "S4", 4,
            [point_terms[name] for name in ("q", "t1", "t2", "t3")],
        )
    )
    clauses.extend(BASE.selector_constraints("exact_radius", "S3", 3,
                                             [BASE.literal(index) for index in range(n)]))
    clauses.extend(BASE.selector_constraints("bounded_support", "S8", 8,
                                             [BASE.literal(index) for index in range(n)]))
    clauses.extend(BASE.selector_constraints("source_row", "S4", 4,
                                             [BASE.literal(index) for index in range(n)]))
    if packet["arm"] == "qDeleted":
        clauses.append(BASE.neg(BASE.member("source_row", "S4", 4, point_terms["q"])))
        functions.append({"name": "source_z", "args": [], "codomain": DOMAIN})
        clauses.append(_pin_zero_arg("source_z", roles["z"]))
        z = BASE.application("source_z", [])
        clauses.append(BASE.member("source_row", "S4", 4, z))
        clauses.append(BASE.neg(BASE.member("bounded_support", "S8", 8, z)))
    else:
        clauses.append(BASE.member("source_row", "S4", 4, point_terms["q"]))

    i = BASE.variable("source_row_i")
    j = BASE.variable("source_row_j")
    k = BASE.variable("source_row_k")
    distinct = BASE.conjunction([
        BASE.neg(BASE.equality(i, j)), BASE.neg(BASE.equality(i, k)),
        BASE.neg(BASE.equality(j, k)),
    ])
    overlap = BASE.conjunction([
        BASE.member("source_row", "S4", 4, i),
        BASE.member("source_row", "S4", 4, j),
        BASE.member("source_row", "S4", 4, k),
        BASE.member("dangerous_base", "S4", 4, i),
        BASE.member("dangerous_base", "S4", 4, j),
        BASE.member("dangerous_base", "S4", 4, k),
    ])
    clauses.append(BASE.forall("source_row_i", DOMAIN,
                               BASE.forall("source_row_j", DOMAIN,
                                           BASE.forall("source_row_k", DOMAIN,
                                                       BASE.neg(BASE.conjunction([distinct, overlap]))))))
    source = {
        "module": "Erdos9796Proof.P97.ATail.TwoSourceFreshThirdU3",
        "decl": "SixSurvivorU3ExactRadiusAuditObstruction",
        "packet_schema": PACKET_SCHEMA,
        "source_arm": packet["arm"],
        "packet_sha256": packet_sha256(packet),
        "replay": "pinned-finite-packet",
        "coverage": {
            "required_packet_fields": [
                "arm", "carrier_card", "roles", "dangerous",
                "exact_radius", "bounded", "row",
            ],
            "common_checks": [
                "frame_roles_distinct", "dangerous_exact_q_t1_t2_t3",
                "exact_radius_card_three", "bounded_contains_frame",
                "row_card_four", "row_dangerous_intersection_at_most_two",
                "row_dangerous_difference_at_least_two",
            ],
            "arm_checks": {
                "qDeleted": ["q_not_in_row", "z_in_row", "z_not_in_bounded"],
                "criticalShell": ["q_in_row"],
            },
        },
    }
    return {
        "ir_version": 1,
        "source": source,
        "query": "FindModel",
        "domains": [
            {"name": DOMAIN, "card": n},
            {"name": "S3", "card": 3},
            {"name": "S4", "card": 4},
            {"name": "S8", "card": 8},
        ],
        "functions": functions,
        "predicates": [],
        "bool_atoms": [],
        "formula": BASE.conjunction(clauses),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("packet", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    packet = json.loads(args.packet.read_text())
    exported = packet_to_ir(packet)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(_canonical_json(exported))


if __name__ == "__main__":
    main()
