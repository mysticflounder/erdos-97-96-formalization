#!/usr/bin/env python3
"""Deterministic source contract for the card-13 distinct-radius aggregate.

This module does not solve the source formula and does not emit a certificate.
It rebuilds the exact Z3 assertion stream, fixes a deterministic heterogeneous
``BVExpr`` variable layout, and records how every source atom must be supplied
by a future Lean ingress.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from pathlib import Path
import re
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
DISTINCT = HERE.parent / "exact5-card13-distinct-radius-aggregate"
sys.path.insert(0, str(DISTINCT))

import surface  # noqa: E402


PAIRS = tuple(itertools.combinations(range(13), 2))
EDGE_INDEX = {pair: index for index, pair in enumerate(PAIRS)}
ORBIT_SPECS: dict[str, dict[str, Any]] = {
    "direct": {
        "source_orbit": "asymmetricSourceLeft",
        "source_index": 1,
        "third_index": 3,
        "hub_index": 2,
        "g0_spoke_index": 1,
        "g1_spoke_index": 3,
    },
    "mirror": {
        "source_orbit": "asymmetricSourceRight",
        "source_index": 3,
        "third_index": 1,
        "hub_index": 2,
        "g0_spoke_index": 1,
        "g1_spoke_index": 3,
    },
}
EXPECTED_ASSERTIONS = 58_433
EXPECTED_VARIABLES = 1_666
EXPECTED_SOURCE_BITS = 2_179


def natural_key(name: str) -> tuple[object, ...]:
    return tuple(
        int(part) if part.isdigit() else part
        for part in re.split(r"(\d+)", name)
    )


def resolve_orbit(value: str) -> tuple[str, dict[str, Any]]:
    if value in ORBIT_SPECS:
        return value, ORBIT_SPECS[value]
    for short, spec in ORBIT_SPECS.items():
        if value == spec["source_orbit"]:
            return short, spec
    raise ValueError(f"unknown distinct-radius orbit {value!r}")


def source_stream_sha256(assertions: list[z3.BoolRef]) -> str:
    payload = "".join(assertion.sexpr() + "\n" for assertion in assertions)
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def build_source_assertions(
    orbit: str,
) -> tuple[list[z3.BoolRef], dict[str, int], Any, dict[tuple[int, int], z3.BitVecRef]]:
    """Rebuild the full source stream with no solver search."""
    _short, spec = resolve_orbit(orbit)
    outer, ranks, raw_counts = surface.build(spec["source_orbit"], 0)
    assertions = list(outer.solver.assertions())
    counts = dict(raw_counts)
    if len(assertions) != EXPECTED_ASSERTIONS:
        raise AssertionError(
            f"source assertion drift: {len(assertions)} != {EXPECTED_ASSERTIONS}"
        )
    expected_roles = {
        "hub": spec["hub_index"],
        "spoke1": spec["g0_spoke_index"],
        "spoke2": spec["g1_spoke_index"],
        "source": spec["source_index"],
        "third": spec["third_index"],
    }
    if outer.roles != expected_roles:
        raise AssertionError(
            f"source role drift for {spec['source_orbit']}: "
            f"{outer.roles!r} != {expected_roles!r}"
        )
    return assertions, counts, outer, ranks


def collect_variables(
    assertions: list[z3.BoolRef],
) -> dict[str, dict[str, object]]:
    atoms: dict[str, z3.ExprRef] = {}

    def collect(expression: z3.ExprRef) -> None:
        if (
            z3.is_const(expression)
            and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
        ):
            atoms[str(expression)] = expression
        for child in expression.children():
            collect(child)

    for assertion in assertions:
        collect(assertion)

    variables: dict[str, dict[str, object]] = {}
    bit_offset = 0
    for index, name in enumerate(sorted(atoms, key=natural_key)):
        atom = atoms[name]
        if z3.is_bool(atom):
            sort, width = "Bool", 1
        elif z3.is_int(atom):
            sort, width = "Int-as-unsigned-4", 4
        elif z3.is_bv(atom):
            sort, width = f"BitVec({atom.size()})", atom.size()
        else:
            raise ValueError(f"unsupported source atom sort: {atom.sort()}")
        variables[name] = {
            "index": index,
            "sort": sort,
            "width": width,
            "bit_offset": bit_offset,
            "category": atom_category(name),
            "lean_atom": lean_atom(name),
        }
        bit_offset += width
    if len(variables) != EXPECTED_VARIABLES:
        raise AssertionError(
            f"source variable drift: {len(variables)} != {EXPECTED_VARIABLES}"
        )
    if bit_offset != EXPECTED_SOURCE_BITS:
        raise AssertionError(
            f"source bit-layout drift: {bit_offset} != {EXPECTED_SOURCE_BITS}"
        )
    return variables


def atom_category(name: str) -> str:
    if re.fullmatch(r"(m|g0|g1)_\d+_\d+", name):
        return "selected_row"
    if re.fullmatch(r"blocker_\d+", name):
        return "actual_blocker"
    if re.fullmatch(r"shell_\d+", name):
        return "exact_five_shell"
    if name in {"frontier_q", "frontier_w"}:
        return "frontier_role"
    if re.fullmatch(r"b1_\d+", name):
        return "first_apex_double_row"
    if re.fullmatch(r"parent_first_\d+", name):
        return "retained_parent_first_row"
    if re.fullmatch(r"parent_second_\d+", name):
        return "retained_parent_second_row"
    if re.fullmatch(r"(m|g0|g1)_(forward|backward)_\d+_\d+", name):
        return "bounded_connectivity_auxiliary"
    if re.fullmatch(r"ord_rank_\d+_\d+", name):
        return "distance_rank"
    raise ValueError(f"unsupported source atom {name!r}")


def lean_atom(name: str) -> str:
    """Return the intended packed-Lean accessor for a source atom."""
    match = re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", name)
    if match:
        family = {"m": 0, "g0": 1, "g1": 2}[match.group(1)]
        return f"rowBit rows {family} {match.group(2)} {match.group(3)}"
    match = re.fullmatch(r"blocker_(\d+)", name)
    if match:
        return f"blockerAt blockers {match.group(1)}"
    match = re.fullmatch(r"shell_(\d+)", name)
    if match:
        return f"shellBit shell {match.group(1)}"
    if name == "frontier_q":
        return "q"
    if name == "frontier_w":
        return "w"
    match = re.fullmatch(r"b1_(\d+)", name)
    if match:
        return f"firstRowBit b1 {match.group(1)}"
    match = re.fullmatch(r"parent_first_(\d+)", name)
    if match:
        return f"parentFirstBit parentFirst {match.group(1)}"
    match = re.fullmatch(r"parent_second_(\d+)", name)
    if match:
        return f"parentSecondBit parentSecond {match.group(1)}"
    match = re.fullmatch(
        r"(m|g0|g1)_(forward|backward)_(\d+)_(\d+)", name
    )
    if match:
        family = {"m": 0, "g0": 1, "g1": 2}[match.group(1)]
        direction = {"forward": 0, "backward": 1}[match.group(2)]
        return (
            f"connectivityBit connectivity {family} {direction} "
            f"{match.group(3)} {match.group(4)}"
        )
    match = re.fullmatch(r"ord_rank_(\d+)_(\d+)", name)
    if match:
        pair = tuple(sorted((int(match.group(1)), int(match.group(2)))))
        return f"rankAtom ranks {EDGE_INDEX[pair]}"
    raise ValueError(f"unsupported source atom {name!r}")


def source_contract(spec: dict[str, Any]) -> dict[str, object]:
    return {
        "boundary_frame": "original CanonicalCard13Frame; no role reindexing",
        "source_orbit": spec["source_orbit"],
        "main_rows": "CanonicalAsymmetricSemanticRowTable.main",
        "cover_rows": (
            "two independent CanonicalCoverFamilies choices; g0 and g1 are "
            "not identified away from blocker-image centers"
        ),
        "blockers": (
            "actual fixed-H blockerIndex values; the same-radius coordinator's "
            "constant blocker assignment is forbidden"
        ),
        "shell": "complete exact-five second-apex ambient radius class",
        "frontier_roles": "actual q and w indices in the original boundary frame",
        "first_apex_row": "FirstApexShellRolePacket.doubleRow",
        "parent_first": (
            "R.common.packet.B1, definitionally packed from the same support as "
            "the double row on the distinct-radius card-13 branch"
        ),
        "parent_second": "R.common.packet.B2, the retained q-deleted O2 row",
        "connectivity": (
            "deterministic 13-step forward/backward closure of each of m, g0, g1; "
            "not independent semantic choices"
        ),
        "ranks": "ordinal ranks of all 78 Euclidean distances",
    }


def load_core(
    path: Path, requested_orbit: str
) -> tuple[str, dict[str, Any], dict[str, Any], list[z3.BoolRef], dict[str, int]]:
    """Fail closed on orbit, assertion-index, expression, and stream drift."""
    short, spec = resolve_orbit(requested_orbit)
    payload = json.loads(path.read_text(encoding="utf-8"))
    if payload.get("orbit") != spec["source_orbit"]:
        raise ValueError(
            f"core orbit {payload.get('orbit')!r} != {spec['source_orbit']!r}"
        )
    if payload.get("canonical_qw", False):
        raise ValueError("canonical_qw is not source-faithful for this ingress")
    assertions, counts, _outer, _ranks = build_source_assertions(short)
    expected_stream = payload.get("source_stream_sha256")
    actual_stream = source_stream_sha256(assertions)
    if expected_stream is not None and expected_stream != actual_stream:
        raise AssertionError("full source assertion stream drift")
    selected: list[z3.BoolRef] = []
    seen: set[int] = set()
    for saved in payload.get("core", []):
        index = int(saved["index"])
        if not 0 <= index < len(assertions):
            raise ValueError(f"source assertion index out of range: {index}")
        if index in seen:
            raise ValueError(f"duplicate source assertion index: {index}")
        seen.add(index)
        assertion = assertions[index]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at index {index}")
        selected.append(assertion)
    if not selected:
        raise ValueError("source core is empty")
    return short, spec, payload, selected, counts

