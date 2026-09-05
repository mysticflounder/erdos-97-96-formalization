# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Governed PIQD QF_NRA diagnostics for the rigid221 S0 C3 packet.

The target is the finite 18-role Euclidean packet described in the companion
specification.  Solver answers remain formula-scoped discovery evidence.  SAT
is accepted only after exact-rational replay; UNKNOWN and unsupported algebraic
readbacks are inconclusive.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import re
import stat
import subprocess
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any, Literal

from census.card_head import (
    exactfive_hard_source_swap_bo_source_qfnra_piqd as exact_parser,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "rigid221-s0-c3-fullrow-planar-qfnra-piqd-20260904"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-rigid221-s0-c3-fullrow-planar-qfnra-v1.md"
RUNNER_PATH = (
    REPOSITORY_ROOT / "scripts/run_rigid221_s0_c3_fullrow_planar_qfnra_piqd.py"
)

SYSTEM_SCHEMA = "p97-rigid221-s0-c3-fullrow-planar-qfnra-system/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-rigid221-s0-c3-fullrow-planar-qfnra-launch/v1"
TERMINAL_SCHEMA = "p97-rigid221-s0-c3-fullrow-planar-qfnra-terminal/v1"
PRODUCER_VERSION = "p97-rigid221-s0-c3-fullrow-planar-qfnra/v1"

ROLES = (
    "O",
    "p",
    "q",
    "u",
    "s",
    "r",
    "O1",
    "bu",
    "bs",
    "br",
    "f1",
    "f2",
    "ua",
    "ub",
    "sa",
    "sb",
    "ra",
    "rb",
)
ROWS: dict[str, tuple[str, tuple[str, ...]]] = {
    "C": ("O", ("p", "q", "u", "s", "r")),
    "F1": ("O1", ("p", "q", "f1", "f2")),
    "Ku": ("bu", ("u", "s", "ua", "ub")),
    "Ks": ("bs", ("s", "r", "sa", "sb")),
    "Kr": ("br", ("r", "u", "ra", "rb")),
}
STAGES = ("row-equalities", "exact-fibers", "full-uniqueness")
MODES = ("all-order", "fixed-forward", "fixed-reverse")
FORWARD_ORDER = ROLES
REVERSE_ORDER = (ROLES[0], *reversed(ROLES[1:]))
FIXED_ORDERS = {"fixed-forward": FORWARD_ORDER, "fixed-reverse": REVERSE_ORDER}
CONTROL_ORDER = ("O", "p", "o1", "q", "a", "b_ab", "b", "b_ac", "b_bc", "c")
CONTROL_ROWS = {
    "O": ("p", "q", "a", "b", "c"),
    "o1": ("p", "q"),
    "b_ab": ("a", "b"),
    "b_ac": ("a", "c"),
    "b_bc": ("b", "c"),
}
FALSE_CLAIMS = {
    "not_an_18_role_witness_control": True,
    "not_a_planar_source_ingress": True,
    "not_a_lean_closure": True,
    "not_an_outer_order_enumeration": True,
}
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}\Z")
QUERY_KEYS = (
    "control-positive",
    "control-negative",
    *(f"target-{mode}-{stage}" for mode in MODES for stage in STAGES),
)

EXPECTED_OWNED_PATHS = (
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/rigid221_s0_c3_fullrow_planar_qfnra_piqd.py",
    "census/card_head/tests/test_rigid221_s0_c3_fullrow_planar_qfnra_piqd.py",
    "docs/specs/p97-rigid221-s0-c3-fullrow-planar-qfnra-v1.md",
    "scripts/run_rigid221_s0_c3_fullrow_planar_qfnra_piqd.py",
)


class S0FullRowError(RuntimeError):
    """The governed packet, model, or custody record failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def _json(value: object) -> bytes:
    return (
        json.dumps(value, sort_keys=True, indent=2, ensure_ascii=True).encode() + b"\n"
    )


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _read_regular(path: Path, *, limit: int = 64 << 20) -> bytes:
    try:
        info = path.stat(follow_symlinks=False)
    except OSError as exc:
        raise S0FullRowError(f"missing artifact: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise S0FullRowError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise S0FullRowError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise S0FullRowError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise S0FullRowError(f"{where} is not an object")
    return value


def _point(t: Fraction) -> tuple[Fraction, Fraction]:
    denominator = 1 + t * t
    return ((1 - t * t) / denominator, 2 * t / denominator)


def checkpoint16_control_points() -> dict[str, tuple[Fraction, Fraction]]:
    """Return the exact ten-point checkpoint-16 pair-geometry control."""

    p = _point(Fraction(-3, 5))
    q = _point(Fraction(-9, 20))
    a = _point(Fraction(-3, 10))
    b = _point(Fraction(-1, 20))
    c = _point(Fraction(3, 8))

    def scale_sum(k: Fraction, x: str, y: str) -> tuple[Fraction, Fraction]:
        points = {"p": p, "q": q, "a": a, "b": b, "c": c}
        return (k * (points[x][0] + points[y][0]), k * (points[x][1] + points[y][1]))

    return {
        "O": (Fraction(0), Fraction(0)),
        "p": p,
        "o1": scale_sum(Fraction(51, 100), "p", "q"),
        "q": q,
        "a": a,
        "b_ab": scale_sum(Fraction(51, 100), "a", "b"),
        "b": b,
        "b_ac": scale_sum(Fraction(19, 30), "a", "c"),
        "b_bc": scale_sum(Fraction(14, 25), "b", "c"),
        "c": c,
    }


def corrupted_control_points() -> dict[str, tuple[Fraction, Fraction]]:
    points = checkpoint16_control_points()
    points["b_ab"] = points["a"]
    return points


def _x(role: str) -> str:
    return f"x_{role}"


def _y(role: str) -> str:
    return f"y_{role}"


def _d2(center: str, point: str) -> str:
    return (
        f"(+ (* (- {_x(center)} {_x(point)}) (- {_x(center)} {_x(point)})) "
        f"(* (- {_y(center)} {_y(point)}) (- {_y(center)} {_y(point)})))"
    )


def _area(a: str, b: str, c: str) -> str:
    return (
        f"(- (* (- {_x(b)} {_x(a)}) (- {_y(c)} {_y(a)})) "
        f"(* (- {_y(b)} {_y(a)}) (- {_x(c)} {_x(a)})))"
    )


def _smt_fraction(value: Fraction) -> str:
    if value.denominator == 1:
        return (
            str(value.numerator) if value.numerator >= 0 else f"(- {-value.numerator})"
        )
    term = f"(/ {abs(value.numerator)} {value.denominator})"
    return term if value.numerator >= 0 else f"(- {term})"


def _assert(term: str) -> str:
    return f"(assert {term})"


def _fixed_order_assertions(order: Sequence[str]) -> list[str]:
    if len(order) != len(set(order)):
        raise S0FullRowError("fixed order contains duplicate roles")
    return [
        _assert(f"(> {_area(left, right, other)} 0)")
        for index, left in enumerate(order)
        for right in (order[(index + 1) % len(order)],)
        for other in order
        if other not in {left, right}
    ]


def deletion_matrix() -> dict[str, dict[str, str]]:
    """Derive the u/s/r by Ku/Ks/Kr kill/survive matrix from supports."""

    return {
        point: {
            row: "kill" if point in ROWS[row][1] else "survive"
            for row in ("Ku", "Ks", "Kr")
        }
        for point in ("u", "s", "r")
    }


EXPECTED_DELETION_MATRIX = {
    "u": {"Ku": "kill", "Ks": "survive", "Kr": "kill"},
    "s": {"Ku": "kill", "Ks": "kill", "Kr": "survive"},
    "r": {"Ku": "survive", "Ks": "kill", "Kr": "kill"},
}


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in {"positive", "negative"}:
        raise S0FullRowError("unknown control")
    points = (
        checkpoint16_control_points()
        if control == "positive"
        else corrupted_control_points()
    )
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": f"control-{control}",
        "control": control,
        "order": list(CONTROL_ORDER),
        "points": {key: [str(x), str(y)] for key, (x, y) in points.items()},
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(mode: str, stage: str) -> dict[str, Any]:
    if mode not in MODES or stage not in STAGES:
        raise S0FullRowError("unknown target mode or stage")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": f"target-{mode}-{stage}",
        "mode": mode,
        "stage": stage,
        "roles": list(ROLES),
        "rows": {
            row: {"center": center, "support": list(support)}
            for row, (center, support) in ROWS.items()
        },
        "fixed_order": list(FIXED_ORDERS[mode]) if mode in FIXED_ORDERS else None,
        "deletion_matrix": deletion_matrix(),
        "claims": dict(FALSE_CLAIMS),
    }


def build_system(key: str) -> dict[str, Any]:
    if key == "control-positive":
        return build_control_system("positive")
    if key == "control-negative":
        return build_control_system("negative")
    for mode in MODES:
        prefix = f"target-{mode}-"
        if key.startswith(prefix):
            return build_target_system(mode, key.removeprefix(prefix))
    raise S0FullRowError(f"unknown query key: {key}")


def _validate_system(system: object) -> dict[str, Any]:
    if type(system) is not dict or type(system.get("key")) is not str:
        raise S0FullRowError("semantic system is malformed")
    expected = build_system(system["key"])
    if system != expected:
        raise S0FullRowError("semantic system drifted")
    return expected


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    current = _validate_system(dict(system))
    if current["kind"] == "control":
        inventory = {
            "real_declarations": 20,
            "coordinate_fixes": 20,
            "distinctness": 45,
            "row_equalities": 8,
            "radius_positivity": 5,
            "off_fiber_exclusions": 4,
            "convexity": 80,
        }
    else:
        exact = current["stage"] in {"exact-fibers", "full-uniqueness"}
        full = current["stage"] == "full-uniqueness"
        inventory = {
            "real_declarations": 72 if current["mode"] == "all-order" else 36,
            "gauge": 4,
            "distinctness": 153,
            "row_equalities": 16,
            "radius_positivity": 5,
            "off_fiber_exclusions": 64 if exact else 0,
            "alternate_four_class_exclusions": 2860 if full else 0,
            "convexity": 306 if current["mode"] == "all-order" else 288,
        }
    inventory["assertions"] = sum(
        value for key, value in inventory.items() if key != "real_declarations"
    )
    inventory["commands"] = 1 + inventory["real_declarations"] + inventory["assertions"]
    return inventory


def _control_commands(system: Mapping[str, Any]) -> list[str]:
    points = {
        key: tuple(Fraction(value) for value in pair)
        for key, pair in system["points"].items()
    }
    out = ["(set-logic QF_NRA)"]
    for role in CONTROL_ORDER:
        out += [
            f"(declare-fun {_x(role)} () Real)",
            f"(declare-fun {_y(role)} () Real)",
        ]
    for role in CONTROL_ORDER:
        out += [
            _assert(f"(= {_x(role)} {_smt_fraction(points[role][0])})"),
            _assert(f"(= {_y(role)} {_smt_fraction(points[role][1])})"),
        ]
    for left, right in itertools.combinations(CONTROL_ORDER, 2):
        out.append(_assert(f"(> {_d2(left, right)} 0)"))
    for center, support in CONTROL_ROWS.items():
        radius = _d2(center, support[0])
        out.extend(
            _assert(f"(= {radius} {_d2(center, point)})") for point in support[1:]
        )
        out.append(_assert(f"(> {radius} 0)"))
    control_off = [
        role for role in CONTROL_ORDER if role != "O" and role not in CONTROL_ROWS["O"]
    ]
    out.extend(
        _assert(f"(not (= {_d2('O', 'p')} {_d2('O', role)}))") for role in control_off
    )
    out.extend(_fixed_order_assertions(CONTROL_ORDER))
    return out


def _target_commands(system: Mapping[str, Any]) -> list[str]:
    out = ["(set-logic QF_NRA)"]
    for role in ROLES:
        out += [
            f"(declare-fun {_x(role)} () Real)",
            f"(declare-fun {_y(role)} () Real)",
        ]
    if system["mode"] == "all-order":
        for role in ROLES:
            out += [
                f"(declare-fun nx_{role} () Real)",
                f"(declare-fun ny_{role} () Real)",
            ]
    out += [
        _assert(f"(= {_x('O')} 0)"),
        _assert(f"(= {_y('O')} 0)"),
        _assert(f"(= {_x('p')} 1)"),
        _assert(f"(= {_y('p')} 0)"),
    ]
    for left, right in itertools.combinations(ROLES, 2):
        out.append(_assert(f"(> {_d2(left, right)} 0)"))
    for center, support in ROWS.values():
        radius = _d2(center, support[0])
        out.extend(
            _assert(f"(= {radius} {_d2(center, point)})") for point in support[1:]
        )
        out.append(_assert(f"(> {radius} 0)"))
    if system["stage"] in {"exact-fibers", "full-uniqueness"}:
        for center, support in ROWS.values():
            radius = _d2(center, support[0])
            off = [role for role in ROLES if role != center and role not in support]
            out.extend(
                _assert(f"(not (= {radius} {_d2(center, role)}))") for role in off
            )
    if system["stage"] == "full-uniqueness":
        for row in ("F1", "Ku", "Ks", "Kr"):
            center, support = ROWS[row]
            off = [role for role in ROLES if role != center and role not in support]
            for four in itertools.combinations(off, 4):
                base = _d2(center, four[0])
                equalities = " ".join(
                    f"(= {base} {_d2(center, role)})" for role in four[1:]
                )
                out.append(_assert(f"(not (and {equalities}))"))
    if system["mode"] == "all-order":
        for role in ROLES:
            for other in ROLES:
                if role != other:
                    dot = f"(+ (* nx_{role} (- {_x(role)} {_x(other)})) (* ny_{role} (- {_y(role)} {_y(other)})))"
                    out.append(_assert(f"(> {dot} 0)"))
    else:
        out.extend(_fixed_order_assertions(tuple(system["fixed_order"])))
    return out


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_system(dict(system))
    commands = tuple(
        _control_commands(current)
        if current["kind"] == "control"
        else _target_commands(current)
    )
    if len(commands) != formula_inventory(current)["commands"]:
        raise S0FullRowError("formula inventory drifted")
    return commands


def _source_record() -> dict[str, Any]:
    return {
        "schema": "p97-rigid221-s0-c3-fullrow-planar-qfnra-source-record/v1",
        "roles": list(ROLES),
        "rows": {
            key: {"center": value[0], "support": list(value[1])}
            for key, value in ROWS.items()
        },
        "stages": list(STAGES),
        "modes": list(MODES),
        "checkpoint16_control": {
            "scope": "full physical O-circle, secondary pair geometry, parser, and hull replay only",
            "rows": {key: list(value) for key, value in CONTROL_ROWS.items()},
            "O_exact_off_fiber": ["o1", "b_ab", "b_ac", "b_bc"],
        },
        "deletion_matrix": deletion_matrix(),
        "claims": dict(FALSE_CLAIMS),
    }


def _source_snapshots() -> tuple[adapter.SourceSnapshot, ...]:
    sources = (
        adapter.SourceSnapshot("0000-source-record.json", _json(_source_record())),
        adapter.SourceSnapshot("checkpoint.json", _read_regular(CHECKPOINT_PATH)),
        adapter.SourceSnapshot("implementation.py", _read_regular(Path(__file__))),
        adapter.SourceSnapshot(
            "exact-parser.py", _read_regular(Path(exact_parser.__file__))
        ),
        adapter.SourceSnapshot(
            "piqd-adapter.py", _read_regular(Path(adapter.__file__))
        ),
        adapter.SourceSnapshot("runner.py", _read_regular(RUNNER_PATH)),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
    )
    return tuple(sorted(sources, key=lambda item: item.path))


def _variables(system: Mapping[str, Any]) -> tuple[str, ...]:
    roles = CONTROL_ORDER if system["kind"] == "control" else ROLES
    variables = [term for role in roles for term in (_x(role), _y(role))]
    if system["kind"] == "target" and system["mode"] == "all-order":
        variables += [term for role in ROLES for term in (f"nx_{role}", f"ny_{role}")]
    return tuple(variables)


def prepare_query(system: dict[str, Any], *, timeout_ms: int = 60_000) -> PreparedQuery:
    current = _validate_system(system)
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise S0FullRowError("invalid timeout")
    commands = build_smt_commands(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise S0FullRowError("journal normalization drifted")
    sources = _source_snapshots()
    terms = _variables(current)
    variables = tuple(
        {"id": f"v-{index:03d}", "term": term, "sort": "Real"}
        for index, term in enumerate(terms)
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha(_canonical(current)),
        "formula_inventory": formula_inventory(current),
        "journal_sha256": _sha(journal),
        "claims": dict(FALSE_CLAIMS),
    }
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {"id": "p97-rigid221-s0-c3-fullrow-planar-qfnra", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-full-packet-replay",
            "version": "v1",
        },
        "stage_id": f"s0-c3-{current['kind']}",
        "query_id": current["key"],
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
        "variables": list(variables),
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


def _distance(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str
) -> Fraction:
    return (coords[a][0] - coords[b][0]) ** 2 + (coords[a][1] - coords[b][1]) ** 2


def _orientation(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str, c: str
) -> Fraction:
    return (coords[b][0] - coords[a][0]) * (coords[c][1] - coords[a][1]) - (
        coords[b][1] - coords[a][1]
    ) * (coords[c][0] - coords[a][0])


def check_fixed_order(
    order: Sequence[str], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    values = [
        _orientation(coords, left, order[(index + 1) % len(order)], other)
        for index, left in enumerate(order)
        for other in order
        if other not in {left, order[(index + 1) % len(order)]}
    ]
    expected = len(order) * (len(order) - 2)
    return {
        "accepted": len(values) == expected and all(value > 0 for value in values),
        "constraint_count": len(values),
        "minimum": str(min(values)),
    }


def derive_cyclic_hull_order(
    coords: Mapping[str, tuple[Fraction, Fraction]],
) -> tuple[str, ...]:
    """Derive the strict convex hull in CCW order using exact arithmetic."""

    ordered = sorted(coords, key=lambda role: (coords[role][0], coords[role][1], role))

    def half(items: Sequence[str]) -> list[str]:
        result: list[str] = []
        for role in items:
            while (
                len(result) >= 2
                and _orientation(coords, result[-2], result[-1], role) <= 0
            ):
                result.pop()
            result.append(role)
        return result

    hull = tuple(half(ordered)[:-1] + half(tuple(reversed(ordered)))[:-1])
    if len(hull) != len(coords) or set(hull) != set(coords):
        raise S0FullRowError("not every point is a strict hull vertex")
    if not check_fixed_order(hull, coords)["accepted"]:
        raise S0FullRowError("derived hull order failed supporting-edge replay")
    return hull


def check_control_geometry(
    coords: Mapping[str, tuple[Fraction, Fraction]],
) -> dict[str, Any]:
    """Replay the control's full O-circle, secondary pairs, and exact hull."""

    if set(coords) != set(CONTROL_ORDER):
        raise S0FullRowError("control coordinate replay is not total")
    hull = check_fixed_order(CONTROL_ORDER, coords)
    distinct = all(
        _distance(coords, left, right) > 0
        for left, right in itertools.combinations(CONTROL_ORDER, 2)
    )
    rows: dict[str, dict[str, Any]] = {}
    for center, support in CONTROL_ROWS.items():
        values = [_distance(coords, center, point) for point in support]
        rows[center] = {
            "support": list(support),
            "distances": [str(value) for value in values],
            "multiplicity": len(support),
            "accepted": len(set(values)) == 1 and values[0] > 0,
        }
    radius = _distance(coords, "O", "p")
    off = [
        role for role in CONTROL_ORDER if role != "O" and role not in CONTROL_ROWS["O"]
    ]
    off_fiber = {role: _distance(coords, "O", role) != radius for role in off}
    return {
        "accepted": (
            hull["accepted"]
            and distinct
            and all(row["accepted"] for row in rows.values())
            and all(off_fiber.values())
        ),
        "hull": hull,
        "rows": rows,
        "O_off_fiber": off_fiber,
        "distinct": distinct,
    }


def check_checkpoint16_control(
    coords: Mapping[str, tuple[Fraction, Fraction]],
) -> dict[str, Any]:
    expected = checkpoint16_control_points()
    if dict(coords) != expected:
        return {"accepted": False, "reason": "coordinate_mismatch"}
    return check_control_geometry(coords)


def distance_multiplicity_inventory(
    coords: Mapping[str, tuple[Fraction, Fraction]],
    center: str,
    *,
    deleted: str | None = None,
) -> dict[str, Any]:
    """Group all remaining roles by exact positive squared center-distance."""

    if set(coords) != set(ROLES) or center not in ROLES or deleted == center:
        raise S0FullRowError("multiplicity inventory domain is malformed")
    fibers: dict[Fraction, list[str]] = {}
    for role in ROLES:
        if role == center or role == deleted:
            continue
        distance = _distance(coords, center, role)
        if distance <= 0:
            continue
        fibers.setdefault(distance, []).append(role)
    entries = [
        {
            "distance_squared": str(distance),
            "roles": sorted(roles),
            "multiplicity": len(roles),
        }
        for distance, roles in sorted(fibers.items())
    ]
    vector = sorted((entry["multiplicity"] for entry in entries), reverse=True)
    return {
        "center": center,
        "deleted": deleted,
        "positive_fibers": entries,
        "multiplicity_vector": vector,
        "max_positive_multiplicity": max(vector, default=0),
    }


def deletion_matrix_from_maxima(
    maxima: Mapping[str, Mapping[str, int]],
) -> dict[str, dict[str, str]]:
    """Classify actual post-deletion maxima, independently of row supports."""

    if set(maxima) != {"u", "s", "r"} or any(
        set(maxima[deleted]) != {"Ku", "Ks", "Kr"} for deleted in ("u", "s", "r")
    ):
        raise S0FullRowError("deletion maximum inventory is malformed")
    return {
        deleted: {
            row: "kill" if maxima[deleted][row] <= 3 else "survive"
            for row in ("Ku", "Ks", "Kr")
        }
        for deleted in ("u", "s", "r")
    }


def target_multiplicity_replay(
    coords: Mapping[str, tuple[Fraction, Fraction]],
) -> dict[str, Any]:
    """Compute full and deleted exact-distance partitions for the four rows."""

    rows = ("F1", "Ku", "Ks", "Kr")
    before = {
        row: distance_multiplicity_inventory(coords, ROWS[row][0]) for row in rows
    }
    full_checks: dict[str, dict[str, Any]] = {}
    for row in rows:
        center, support = ROWS[row]
        radius = _distance(coords, center, support[0])
        matching = next(
            (
                entry
                for entry in before[row]["positive_fibers"]
                if entry["distance_squared"] == str(radius)
            ),
            None,
        )
        large = [
            entry
            for entry in before[row]["positive_fibers"]
            if entry["multiplicity"] >= 4
        ]
        full_checks[row] = {
            "displayed_distance_squared": str(radius),
            "displayed_fiber": matching,
            "large_fiber_count": len(large),
            "accepted": (
                matching is not None
                and matching["multiplicity"] == 4
                and matching["roles"] == sorted(support)
                and len(large) == 1
                and large[0] == matching
            ),
        }
    after: dict[str, dict[str, dict[str, Any]]] = {}
    maxima: dict[str, dict[str, int]] = {}
    for deleted in ("u", "s", "r"):
        after[deleted] = {}
        maxima[deleted] = {}
        for row in ("Ku", "Ks", "Kr"):
            inventory = distance_multiplicity_inventory(
                coords, ROWS[row][0], deleted=deleted
            )
            after[deleted][row] = inventory
            maxima[deleted][row] = inventory["max_positive_multiplicity"]
    actual_matrix = deletion_matrix_from_maxima(maxima)
    return {
        "before_deletion": before,
        "full_uniqueness_checks": full_checks,
        "after_deletion": after,
        "post_deletion_maxima": maxima,
        "actual_deletion_matrix": actual_matrix,
        "expected_deletion_matrix": EXPECTED_DELETION_MATRIX,
        "full_uniqueness_accepted": all(
            check["accepted"] for check in full_checks.values()
        ),
        "deletion_matrix_accepted": actual_matrix == EXPECTED_DELETION_MATRIX,
    }


def check_target_coordinates(
    system: Mapping[str, Any],
    coords: Mapping[str, tuple[Fraction, Fraction]],
    normals: Mapping[str, tuple[Fraction, Fraction]] | None = None,
) -> dict[str, Any]:
    current = _validate_system(dict(system))
    if set(coords) != set(ROLES):
        raise S0FullRowError("target coordinate replay is not total")
    if coords["O"] != (0, 0) or coords["p"] != (1, 0):
        return {"accepted": False, "reason": "gauge"}
    if any(_distance(coords, a, b) <= 0 for a, b in itertools.combinations(ROLES, 2)):
        return {"accepted": False, "reason": "distinctness"}
    row_distances: dict[str, list[Fraction]] = {}
    for row, (center, support) in ROWS.items():
        values = [_distance(coords, center, point) for point in support]
        row_distances[row] = values
        if len(set(values)) != 1 or values[0] <= 0:
            return {"accepted": False, "reason": f"row-{row}"}
        if current["stage"] in {"exact-fibers", "full-uniqueness"}:
            off = [role for role in ROLES if role != center and role not in support]
            if any(_distance(coords, center, role) == values[0] for role in off):
                return {"accepted": False, "reason": f"fiber-{row}"}
    multiplicities = target_multiplicity_replay(coords)
    if (
        current["stage"] == "full-uniqueness"
        and not multiplicities["full_uniqueness_accepted"]
    ):
        return {
            "accepted": False,
            "reason": "full-uniqueness-multiplicity",
            "multiplicity_replay": multiplicities,
        }
    if (
        current["stage"] == "full-uniqueness"
        and not multiplicities["deletion_matrix_accepted"]
    ):
        return {
            "accepted": False,
            "reason": "deletion-matrix-multiplicity",
            "multiplicity_replay": multiplicities,
        }
    if current["mode"] == "all-order":
        if normals is None or set(normals) != set(ROLES):
            raise S0FullRowError("supporting-normal replay is not total")
        for role in ROLES:
            nx, ny = normals[role]
            for other in ROLES:
                if role != other:
                    dx = coords[role][0] - coords[other][0]
                    dy = coords[role][1] - coords[other][1]
                    if nx * dx + ny * dy <= 0:
                        return {"accepted": False, "reason": "supporting-normal"}
        hull_order = derive_cyclic_hull_order(coords)
        convexity = {
            "accepted": True,
            "constraint_count": 306,
            "derived_order": list(hull_order),
        }
    else:
        convexity = check_fixed_order(tuple(current["fixed_order"]), coords)
        if not convexity["accepted"]:
            return {"accepted": False, "reason": "fixed-order", "convexity": convexity}
    return {
        "accepted": True,
        "stage": current["stage"],
        "mode": current["mode"],
        "row_multiplicities": {
            row: next(
                entry["multiplicity"]
                for entry in multiplicities["before_deletion"][row]["positive_fibers"]
                if entry["distance_squared"]
                == str(_distance(coords, ROWS[row][0], ROWS[row][1][0]))
            )
            for row in ("F1", "Ku", "Ks", "Kr")
        },
        "multiplicity_replay": multiplicities,
        "convexity": convexity,
    }


def _parse_values(values: str, terms: Sequence[str]) -> dict[str, Fraction]:
    try:
        return exact_parser.parse_exact_values(values, terms)
    except Exception as exc:
        raise S0FullRowError(
            "unsupported or malformed exact-rational readback"
        ) from exc


def verify_sat_model(
    query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None
) -> adapter.SemanticVerification:
    if (
        solver not in adapter.SOLVERS
        or type(model) is not str
        or type(values) is not str
    ):
        raise S0FullRowError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise S0FullRowError("semantic input is malformed")
    system = _validate_system(semantic.get("system"))
    timeout = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = prepare_query(system, timeout_ms=timeout).query
    if (
        query.descriptor != expected.descriptor
        or query.descriptor_bytes != expected.descriptor_bytes
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
    ):
        raise S0FullRowError("query custody drifted")
    try:
        parsed = _parse_values(values, query.get_values)
        if system["kind"] == "control":
            coords = {
                role: (parsed[_x(role)], parsed[_y(role)]) for role in CONTROL_ORDER
            }
            evidence = (
                check_checkpoint16_control(coords)
                if system["control"] == "positive"
                else {"accepted": False, "reason": "negative-control-returned-sat"}
            )
        else:
            coords = {role: (parsed[_x(role)], parsed[_y(role)]) for role in ROLES}
            normals = (
                {role: (parsed[f"nx_{role}"], parsed[f"ny_{role}"]) for role in ROLES}
                if system["mode"] == "all-order"
                else None
            )
            evidence = check_target_coordinates(system, coords, normals)
    except S0FullRowError as exc:
        evidence = {
            "accepted": False,
            "replay_status": "UNKNOWN",
            "reason": "exact-readback-unsupported",
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


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise S0FullRowError("path lies outside repository") from exc


def authenticate_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != "ProofRelay97"
        or checkpoint.get("owned_paths") != list(EXPECTED_OWNED_PATHS)
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or type(checkpoint.get("base_head")) is not str
        or _FULL_COMMIT.fullmatch(checkpoint["base_head"]) is None
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise S0FullRowError("lane checkpoint drifted")
    try:
        ancestry = subprocess.run(
            ["git", "merge-base", "--is-ancestor", checkpoint["base_head"], "HEAD"],
            cwd=REPOSITORY_ROOT,
            stdin=subprocess.DEVNULL,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=False,
            timeout=10,
        )
    except (OSError, subprocess.SubprocessError) as exc:
        raise S0FullRowError("could not authenticate checkpoint base_head") from exc
    if ancestry.returncode != 0:
        raise S0FullRowError("checkpoint base_head is missing or is not an ancestor")
    return checkpoint


def _manifest_sources() -> tuple[Path, ...]:
    return (
        Path(__file__).resolve(),
        Path(adapter.__file__).resolve(),
        Path(exact_parser.__file__).resolve(),
        SPEC_PATH,
        RUNNER_PATH,
    )


def _digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = authenticate_checkpoint()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _digest_map(_manifest_sources()),
        "input_digests": {
            _repo_path(CHECKPOINT_PATH): _sha(_read_regular(CHECKPOINT_PATH))
        },
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    try:
        descriptor = os.open(
            path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW, 0o444
        )
    except FileExistsError as exc:
        raise S0FullRowError(f"refusing to overwrite: {path}") from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise S0FullRowError(f"short write: {path}")
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    """Create or validate the run manifest before any generated artifact."""

    authenticate_checkpoint()
    if any(path.is_symlink() for path in (RUN_ROOT, *RUN_ROOT.parents)):
        raise S0FullRowError("generated root has a symlink path component")
    if RUN_ROOT.exists() and not RUN_ROOT.is_dir():
        raise S0FullRowError("generated root is not a directory")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists():
        manifest = _strict_json(_read_regular(manifest_path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != expected_run_manifest(created):
            raise S0FullRowError("run manifest drifted")
    else:
        if RUN_ROOT.exists() and any(RUN_ROOT.iterdir()):
            raise S0FullRowError("generated root has artifacts but no manifest")
        RUN_ROOT.mkdir(parents=True, exist_ok=True)
        created = (
            datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
        )
        manifest = expected_run_manifest(created)
        _create_once(manifest_path, _json(manifest))
    for name in ("artifacts", "events", "tmp"):
        directory = RUN_ROOT / name
        directory.mkdir(parents=True, exist_ok=True)
        if directory.is_symlink() or not directory.is_dir():
            raise S0FullRowError(f"unsafe generated directory: {directory}")
    return RUN_ROOT, manifest


def _artifact_bytes(root: Path, record: object) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise S0FullRowError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or Path(name).name != name:
        raise S0FullRowError("artifact path is unsafe")
    payload = _read_regular(root / name)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise S0FullRowError("artifact digest drifted")
    return payload


def verify_adapter_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    result = _strict_json(_read_regular(output / "result.json"), "adapter result")
    if (
        result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise S0FullRowError("adapter result drifted")
    custody = result.get("custody")
    if type(custody) is not dict:
        raise S0FullRowError("adapter custody is malformed")
    descriptor = _artifact_bytes(output, custody.get("descriptor"))
    original = _artifact_bytes(output, custody.get("original_smt2"))
    journal = _artifact_bytes(output, custody.get("journal_smt2"))
    manifest = _artifact_bytes(output, custody.get("manifest"))
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
        or result.get("source_manifest_sha256") != _sha(manifest)
    ):
        raise S0FullRowError("adapter journal binding drifted")
    sources = custody.get("sources")
    if type(sources) is not list or len(sources) != len(prepared.query.source_files):
        raise S0FullRowError("adapter source count drifted")
    for record, expected in zip(sources, prepared.query.source_files, strict=True):
        if _artifact_bytes(output, record) != expected.payload:
            raise S0FullRowError("adapter source drifted")
    engines = result.get("engines")
    if type(engines) is not list or [
        engine.get("solver") for engine in engines if type(engine) is dict
    ] != list(adapter.SOLVERS):
        raise S0FullRowError("adapter engine inventory drifted")
    for engine in engines:
        if engine.get("raw_status") not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise S0FullRowError("adapter status drifted")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise S0FullRowError("adapter engine artifacts drifted")
        payloads = {
            label: _artifact_bytes(output, record)
            for label, record in artifacts.items()
        }
        bridge = exact_parser.adaptive.PreparedQuery(
            prepared.key, "planar", prepared.system, None, prepared.query
        )
        try:
            custody_solve = exact_parser.adaptive._validate_engine_custody(
                bridge, engine, payloads
            )
        except Exception as exc:
            raise S0FullRowError("adapter engine receipt custody failed") from exc
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
            raise S0FullRowError("adapter solve digest drifted")
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNKNOWN" and effective != "INCONCLUSIVE_UNKNOWN":
            raise S0FullRowError("UNKNOWN was not fail-closed")
        if raw == "UNSAT" and (
            effective != "UNSAT_DISCOVERY_ONLY"
            or engine.get("semantic_replay") is not None
        ):
            raise S0FullRowError("UNSAT classification drifted")
        if raw == "SAT":
            semantic = engine.get("semantic_replay")
            if (
                "semantic" not in payloads
                or _strict_json(payloads["semantic"], f"{engine['solver']} semantic")
                != semantic
            ):
                raise S0FullRowError("SAT semantic artifact drifted")
            verification = verify_sat_model(
                prepared.query,
                engine["solver"],
                solve.get("model"),
                solve.get("values"),
            )
            expected_semantic = {
                "accepted": verification.accepted,
                "evidence": verification.evidence,
                "verifier": prepared.query.descriptor["semantic_verifier"],
                "model_sha256": _sha(solve["model"].encode()),
                "values_sha256": _sha(solve["values"].encode()),
            }
            expected_effective = (
                "SAT_SEMANTICALLY_REPLAYED"
                if verification.accepted
                else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
            )
            if semantic != expected_semantic or effective != expected_effective:
                raise S0FullRowError("SAT semantic replay drifted")
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
        raise S0FullRowError("adapter overall status drifted")
    return result


def _control_passes(key: str, result: Mapping[str, Any]) -> bool:
    expected_raw = "SAT" if key == "control-positive" else "UNSAT"
    expected_effective = (
        "SAT_SEMANTICALLY_REPLAYED"
        if key == "control-positive"
        else "UNSAT_DISCOVERY_ONLY"
    )
    engines = result.get("engines")
    return (
        type(engines) is list
        and len(engines) == 2
        and all(
            engine.get("raw_status") == expected_raw
            and engine.get("effective_status") == expected_effective
            for engine in engines
        )
    )


def _result_summary(
    key: str, result: Mapping[str, Any], output: Path
) -> dict[str, Any]:
    engines = result["engines"]
    return {
        "key": key,
        "overall_status": result["overall_status"],
        "raw_statuses": [engine["raw_status"] for engine in engines],
        "effective_statuses": [engine["effective_status"] for engine in engines],
        "result_sha256": _sha(_read_regular(output / "result.json")),
    }


def _validate_completed_run(
    root: Path,
    manifest: Mapping[str, Any],
    *,
    server: str,
    timeout_ms: int,
    keys: tuple[str, ...],
) -> dict[str, Any]:
    launch = _strict_json(_read_regular(root / "events" / "launch.json"), "launch")
    if (
        launch.get("schema") != LAUNCH_SCHEMA
        or launch.get("run_manifest_sha256") != manifest["manifest_sha256"]
        or launch.get("server") != server
        or launch.get("timeout_ms") != timeout_ms
        or launch.get("query_keys") != list(keys)
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
    ):
        raise S0FullRowError("launch drifted or does not match requested resume")
    terminal = _strict_json(
        _read_regular(root / "events" / "terminal.json"), "terminal"
    )
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("run_manifest_sha256") != manifest["manifest_sha256"]
        or terminal.get("launch_sha256") != launch["launch_sha256"]
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise S0FullRowError("terminal custody drifted")
    summaries: list[dict[str, Any]] = []
    controls_ok = True
    for key in keys:
        output = root / "artifacts" / key
        prepared = prepare_query(build_system(key), timeout_ms=timeout_ms)
        result = verify_adapter_tree(prepared, output)
        summaries.append(_result_summary(key, result, output))
        if key.startswith("control-"):
            controls_ok = controls_ok and _control_passes(key, result)
            if not controls_ok:
                break
    expected_status = (
        "FINITE_DIAGNOSTIC_COMPLETE"
        if controls_ok
        and len(summaries) == len(keys)
        and all(
            item["overall_status"] == "FINITE_DIAGNOSTIC_COMPLETE" for item in summaries
        )
        else "INCONCLUSIVE"
    )
    if (
        terminal.get("results") != summaries
        or terminal.get("controls_passed") is not controls_ok
        or terminal.get("status") != expected_status
    ):
        raise S0FullRowError("terminal result replay drifted")
    return terminal


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_ms: int = 60_000,
    query_keys: Sequence[str] = QUERY_KEYS,
) -> dict[str, Any]:
    keys = tuple(query_keys)
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise S0FullRowError("invalid timeout")
    if (
        not keys
        or any(key not in QUERY_KEYS for key in keys)
        or tuple(key for key in QUERY_KEYS if key in keys) != keys
    ):
        raise S0FullRowError(
            "query selection must preserve canonical control-first order"
        )
    if any(key.startswith("target-") for key in keys) and keys[:2] != QUERY_KEYS[:2]:
        raise S0FullRowError("targets require both controls first")
    transport = adapter.UrllibPiqdTransport(
        server, http_timeout_s=max(30.0, timeout_ms / 1000 + 120.0)
    )
    root, manifest = ensure_run_root()
    terminal_path = root / "events" / "terminal.json"
    if terminal_path.exists():
        return _validate_completed_run(
            root,
            manifest,
            server=server,
            timeout_ms=timeout_ms,
            keys=keys,
        )
    launch_path = root / "events" / "launch.json"
    if launch_path.exists():
        raise S0FullRowError("partial run exists; refusing implicit restart")
    launch = {
        "schema": LAUNCH_SCHEMA,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "server": server,
        "timeout_ms": timeout_ms,
        "query_keys": list(keys),
        "created_utc": datetime.now(UTC)
        .replace(microsecond=0)
        .isoformat()
        .replace("+00:00", "Z"),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    _create_once(launch_path, _json(launch))
    summaries: list[dict[str, Any]] = []
    controls_ok = True
    for key in keys:
        prepared = prepare_query(build_system(key), timeout_ms=timeout_ms)
        output = root / "artifacts" / key
        result = adapter.run_source_semantic_query(
            prepared.query, output, transport, verify_sat_model
        )
        verified = verify_adapter_tree(prepared, output)
        if result != verified:
            raise S0FullRowError("returned and installed adapter results disagree")
        summaries.append(_result_summary(key, result, output))
        if key.startswith("control-"):
            controls_ok = controls_ok and _control_passes(key, result)
            if not controls_ok:
                break
    status = (
        "FINITE_DIAGNOSTIC_COMPLETE"
        if controls_ok
        and len(summaries) == len(keys)
        and all(
            item["overall_status"] == "FINITE_DIAGNOSTIC_COMPLETE" for item in summaries
        )
        else "INCONCLUSIVE"
    )
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "status": status,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "results": summaries,
        "controls_passed": controls_ok,
        "claims": dict(FALSE_CLAIMS),
        "completed_utc": datetime.now(UTC)
        .replace(microsecond=0)
        .isoformat()
        .replace("+00:00", "Z"),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    _create_once(terminal_path, _json(terminal))
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--query", action="append", choices=QUERY_KEYS)
    args = parser.parse_args(argv)
    try:
        result = run_diagnostic(
            server=args.server,
            timeout_ms=args.timeout_ms,
            query_keys=tuple(args.query) if args.query else QUERY_KEYS,
        )
    except (S0FullRowError, adapter.SmtSourceAdapterError) as exc:
        parser.error(str(exc))
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
