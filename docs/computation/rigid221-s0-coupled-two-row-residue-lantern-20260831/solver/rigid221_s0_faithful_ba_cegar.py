# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Run one governed fixed-cell ``B = A`` structural/metric CEGAR wave.

The source cell is the retained S0-N exact-18 packet.  The structural layer
chooses one four-point support at each of the thirteen centers not already
carrying a prescribed row and independently replays the C2/C4 compatibility
conditions.  The metric layer then checks one complete frozen signature with
QF_NRA.  Formula UNSAT blocks only that exact signature.  No terminal status
from this module claims complete structural coverage or a theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import subprocess
import time
from collections import Counter
from collections.abc import Callable, Iterator, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations, islice
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-faithful-ba-fixed-cell-cegar/v1"
SOLVER_RESULT_SCHEMA = "rigid221-s0-faithful-ba-solver-result/v1"
STRUCTURAL_RECEIPT_SCHEMA = "rigid221-s0-faithful-ba-structural-receipt/v1"

SAT_EXACT = "SAT_EXACT_FIXED_BA_CELL"
SAT_UNCHECKED = "SAT_UNCHECKED_ALGEBRAIC_FIXED_BA_CELL"
UNKNOWN = "UNKNOWN_TIMEOUT_FIXED_BA_CEGAR_WAVE"
SCOPED_UNSAT = "SCOPED_CANDIDATES_UNSAT_FIXED_BA_CEGAR_WAVE"

SOLVER_DIR = Path(__file__).resolve().parent
REPOSITORY = Path(__file__).resolve().parents[4]
L3_JSON = SOLVER_DIR / "s0-true-cap-wave2-l3-witnesses.json"
L3_REPO_PATH = (
    "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "solver/s0-true-cap-wave2-l3-witnesses.json"
)
PINNED_L3_SHA256 = "c2a2539c1a4a9a48792b62fc6a1d9500f9a8969deec12079784258d7a8c94cd2"
RUN_MANIFEST_HISTORICAL_BASE_HEAD = "f26de746bc16d15d891c42ad8cfb42876a63ab06"
CURRENT_INPUT_CHECKPOINT = "aeee9534c5bf00212459a743db1333a34ee30b3d"
RUN_ROOT = (
    REPOSITORY / "scratch/runs/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "faithful-ba-cegar-wave1"
)
DEFAULT_RESULT = SOLVER_DIR / "s0-faithful-ba-cegar-wave1-result.json"
DEFAULT_REPORT = RUN_ROOT / "cegar-report.json"
DEFAULT_SOLVER_RESULT = RUN_ROOT / "solver-result.json"
DEFAULT_MARKDOWN = SOLVER_DIR.parent / "s0-faithful-ba-cegar-wave1.md"
RUN_MANIFEST = RUN_ROOT / "run_manifest.json"

ROLE_ORDER = (
    "O",
    "qu2",
    "qu1",
    "qv2",
    "d3",
    "d2",
    "d1",
    "delta",
    "v",
    "u",
    "cv",
    "cu",
    "xv",
    "xu",
    "qv1",
    "fq",
    "fw",
    "fp",
)

# The reusable 18-vertex fixed cell uses these canonical Moser labels.  They
# are deliberately kept separate from ROLE_ORDER: ROLE_ORDER is the retained
# counterclockwise polygon order used by the strict-orientation assertions,
# while these aliases are the stable SAT/SMT vertex identifiers.
CANONICAL_LABELS = {
    "xu": 0,
    "delta": 1,
    "O": 2,
    "d1": 3,
    "d2": 4,
    "d3": 5,
    "qv2": 6,
    "qu1": 7,
    "qu2": 8,
    "fp": 9,
    "fw": 10,
    "fq": 11,
    "qv1": 12,
    "xv": 13,
    "cu": 14,
    "cv": 15,
    "u": 16,
    "v": 17,
}

SOURCE_ANCHORS = {
    "selected_four_class": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:400",
    "faithful_carrier_pattern": (
        "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1492"
    ),
    "normal_axis": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:140",
    "normalized_class_row": ("lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1592"),
    "prescribed_classes": ("lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1731"),
}


class CegarError(RuntimeError):
    """The source, structural, solver, or exact-replay contract failed."""


@dataclass(frozen=True)
class RowSpec:
    name: str
    center: str
    support: tuple[str, str, str, str]
    exact: bool
    origin: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "center": self.center,
            "exact": self.exact,
            "name": self.name,
            "origin": self.origin,
            "support": list(self.support),
        }


@dataclass(frozen=True)
class FixedCell:
    order: tuple[str, ...]
    points: Mapping[str, Point]
    named_rows: tuple[RowSpec, ...]
    physical_five: tuple[str, str, str, str, str]
    source_sha256: str


SolverRunner = Callable[[str, int, Path, int], dict[str, Any]]


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def canonical_json(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode("utf-8")


def fraction_text(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def parse_point(value: object, where: str) -> Point:
    if not isinstance(value, list) or len(value) != 2:
        raise CegarError(f"{where} is not a two-coordinate point")
    try:
        return F(str(value[0])), F(str(value[1]))
    except (ValueError, ZeroDivisionError) as exc:
        raise CegarError(f"{where} is not exact rational data") from exc


def _row(
    name: str,
    center: str,
    support: Sequence[str],
    *,
    exact: bool,
    origin: str,
) -> RowSpec:
    normalized = tuple(sorted(support, key=ROLE_ORDER.index))
    if len(normalized) != 4:
        raise CegarError(f"row {name} does not have four roles")
    return RowSpec(name, center, normalized, exact, origin)  # type: ignore[arg-type]


def _validate_retained_named_geometry(cell: FixedCell) -> dict[str, Any]:
    replay = replay_fixed_cell_geometry(cell.points, cell, cell.named_rows)
    if not replay["accepted"]:
        raise CegarError(
            f"retained named geometry failed exact replay: {replay['reason']}"
        )
    return replay


def load_fixed_cell(path: Path = L3_JSON) -> FixedCell:
    """Load and source-check the retained S0-N exact-18 packet."""

    raw = path.read_bytes()
    digest = sha256_bytes(raw)
    if path.resolve() == L3_JSON.resolve() and digest != PINNED_L3_SHA256:
        raise CegarError("retained L3 input digest drifted")
    value = json.loads(raw)
    if value.get("schema") != "rigid221-s0-l3-field-level-geometric-packet/v1":
        raise CegarError("retained L3 input schema drifted")
    if value.get("status") != "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET":
        raise CegarError("retained L3 input status is not exact L3 geometry")
    branch = value.get("branches", {}).get("S0-N")
    if not isinstance(branch, dict):
        raise CegarError("retained L3 input lacks S0-N")
    if (
        branch.get("role_count") != 18
        or tuple(branch.get("cyclic_order", ())) != ROLE_ORDER
    ):
        raise CegarError("retained S0-N role count/order drifted")
    if set(CANONICAL_LABELS) != set(ROLE_ORDER) or set(
        CANONICAL_LABELS.values()
    ) != set(range(18)):
        raise CegarError("canonical S0-N label aliases are not a bijection")
    if branch.get("all_named_finite_packet_geometry_replayed") is not True:
        raise CegarError("retained S0-N packet is not fully replayed")
    points_raw = branch.get("points")
    if not isinstance(points_raw, dict) or set(points_raw) != set(ROLE_ORDER):
        raise CegarError("retained S0-N point map drifted")
    points = {
        role: parse_point(points_raw[role], f"points.{role}") for role in ROLE_ORDER
    }
    fibers = branch.get("finite_core", {}).get("fibers")
    if not isinstance(fibers, dict):
        raise CegarError("retained S0-N fiber packet is absent")

    expected_fibers = {
        "Ku": ("cu", {"qu1", "qu2", "u", "xu"}),
        "Kv": ("cv", {"qv1", "qv2", "v", "xv"}),
        "Kdelta": ("xv", {"d1", "d2", "d3", "delta"}),
        "first": ("delta", {"O", "fp", "fq", "fw"}),
    }
    for name, (center, support) in expected_fibers.items():
        fiber = fibers.get(name)
        if (
            not isinstance(fiber, dict)
            or fiber.get("center") != center
            or set(fiber.get("roles", ())) != support
            or fiber.get("complete_modeled_carrier_fiber") is not True
        ):
            raise CegarError(f"retained exact fiber {name} drifted")
    physical = fibers.get("physical")
    if (
        not isinstance(physical, dict)
        or physical.get("center") != "O"
        or set(physical.get("roles", ())) != {"delta", "u", "v", "xu", "xv"}
    ):
        raise CegarError("retained physical five-class drifted")

    named_rows = (
        _row(
            "physical_Q",
            "O",
            ("u", "xu", "v", "xv"),
            exact=False,
            origin="SELECTED_FOUR_SUBSET_OF_SOURCE_PHYSICAL_FIVE_CLASS",
        ),
        *(
            _row(
                name,
                center,
                support,
                exact=True,
                origin="SOURCE_AUTHENTICATED_COMPLETE_FOUR_FIBER",
            )
            for name, (center, support) in expected_fibers.items()
        ),
    )
    physical_five = tuple(sorted(("delta", "u", "v", "xu", "xv"), key=ROLE_ORDER.index))
    cell = FixedCell(ROLE_ORDER, points, tuple(named_rows), physical_five, digest)
    centers = {row.center for row in cell.named_rows}
    named_union = centers | {point for row in cell.named_rows for point in row.support}
    if named_union != set(ROLE_ORDER):
        raise CegarError("retained named union does not equal the S0-N carrier")
    _validate_retained_named_geometry(cell)
    return cell


def dist2(first: Point, second: Point) -> F:
    return (first[0] - second[0]) ** 2 + (first[1] - second[1]) ** 2


def orient(first: Point, second: Point, third: Point) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (second[1] - first[1]) * (
        third[0] - first[0]
    )


def replay_geometry(
    points: Mapping[str, Point], order: Sequence[str], rows: Sequence[RowSpec]
) -> dict[str, Any]:
    """Replay exactly the geometric predicates emitted by the metric formula."""

    if set(points) != set(order) or len(order) != len(set(order)):
        return {"accepted": False, "reason": "point_or_order_domain"}
    checks = Counter()
    minimum_distance: F | None = None
    minimum_orientation: F | None = None
    minimum_radius: F | None = None
    minimum_exact_gap_squared: F | None = None
    for left, right in combinations(order, 2):
        checks["ambient_distinctness"] += 1
        value = dist2(points[left], points[right])
        if value <= 0:
            return {"accepted": False, "reason": "ambient_distinctness"}
        minimum_distance = (
            value if minimum_distance is None else min(minimum_distance, value)
        )
    for index, left in enumerate(order):
        right = order[(index + 1) % len(order)]
        for point in order:
            if point in {left, right}:
                continue
            checks["strict_convexity"] += 1
            value = orient(points[left], points[right], points[point])
            if value <= 0:
                return {"accepted": False, "reason": "strict_convexity"}
            minimum_orientation = (
                value
                if minimum_orientation is None
                else min(minimum_orientation, value)
            )
    for row in rows:
        if row.center not in points or any(
            point not in points for point in row.support
        ):
            return {"accepted": False, "reason": "row_domain", "row": row.name}
        if row.center in row.support or len(set(row.support)) != 4:
            return {"accepted": False, "reason": "row_shape", "row": row.name}
        reference = dist2(points[row.center], points[row.support[0]])
        checks["positive_radii"] += 1
        if reference <= 0:
            return {"accepted": False, "reason": "positive_radius", "row": row.name}
        minimum_radius = (
            reference if minimum_radius is None else min(minimum_radius, reference)
        )
        for point in row.support[1:]:
            checks["row_equalities"] += 1
            if dist2(points[row.center], points[point]) != reference:
                return {"accepted": False, "reason": "row_equality", "row": row.name}
        if row.exact:
            for point in order:
                if point == row.center or point in row.support:
                    continue
                checks["exact_off_row_exclusions"] += 1
                delta = dist2(points[row.center], points[point]) - reference
                gap_squared = delta * delta
                if gap_squared <= 0:
                    return {
                        "accepted": False,
                        "reason": "exact_off_row_exclusion",
                        "row": row.name,
                    }
                minimum_exact_gap_squared = (
                    gap_squared
                    if minimum_exact_gap_squared is None
                    else min(minimum_exact_gap_squared, gap_squared)
                )
    return {
        "accepted": True,
        "checks": dict(sorted(checks.items())),
        "minimum_pair_distance_squared": fraction_text(minimum_distance or F(0)),
        "minimum_orientation": fraction_text(minimum_orientation or F(0)),
        "minimum_row_radius_squared": fraction_text(minimum_radius or F(0)),
        "minimum_exact_gap_squared": fraction_text(minimum_exact_gap_squared or F(0)),
    }


def replay_fixed_cell_geometry(
    points: Mapping[str, Point], cell: FixedCell, rows: Sequence[RowSpec]
) -> dict[str, Any]:
    """Replay metric assertions plus the authenticated physical fifth incidence."""

    replay = replay_geometry(points, cell.order, rows)
    if not replay["accepted"]:
        return replay
    physical_q = next((row for row in rows if row.center == "O"), None)
    if physical_q is None or physical_q.name != "physical_Q":
        return {"accepted": False, "reason": "physical_Q_missing"}
    reference = dist2(points["O"], points[physical_q.support[0]])
    if dist2(points["O"], points["delta"]) != reference:
        return {"accepted": False, "reason": "physical_five_surplus_incidence"}
    result = dict(replay)
    checks = dict(result["checks"])
    checks["physical_five_surplus_incidence"] = 1
    result["checks"] = dict(sorted(checks.items()))
    return result


def _structural_failure(rows: Sequence[RowSpec], cell: FixedCell) -> str | None:
    if len(rows) != len(cell.order):
        return "row_count"
    by_center = {row.center: row for row in rows}
    if len(by_center) != len(rows) or set(by_center) != set(cell.order):
        return "one_row_per_center"
    for row in rows:
        if (
            len(row.support) != 4
            or len(set(row.support)) != 4
            or row.center in row.support
            or not set(row.support) <= set(cell.order)
        ):
            return "selected_four_class_shape"
    for expected in cell.named_rows:
        if by_center.get(expected.center) != expected:
            return "named_row_drift"
    for left, right in combinations(rows, 2):
        if len(set(left.support) & set(right.support)) > 2:
            return "C2_pairwise_row_intersection"
    pair_centers: dict[tuple[str, str], set[str]] = {}
    for row in rows:
        for pair in combinations(row.support, 2):
            key = tuple(sorted(pair, key=cell.order.index))
            pair_centers.setdefault(key, set()).add(row.center)
    if any(len(centers) > 2 for centers in pair_centers.values()):
        return "C4_pair_multiplicity"
    return None


def replay_structural_assignment(
    rows: Sequence[RowSpec], cell: FixedCell
) -> dict[str, Any]:
    failure = _structural_failure(rows, cell)
    if failure is not None:
        return {"accepted": False, "reason": failure}
    pair_counts = Counter(
        tuple(sorted(pair, key=cell.order.index))
        for row in rows
        for pair in combinations(row.support, 2)
    )
    intersection_checks = len(rows) * (len(rows) - 1) // 2
    return {
        "accepted": True,
        "checks": {
            "C2_pairwise_intersections": intersection_checks,
            "C4_distinct_center_pair_multiplicities": len(pair_counts),
            "center_omissions": len(rows),
            "row_cardinality_four": len(rows),
        },
        "maximum_pair_multiplicity": max(pair_counts.values(), default=0),
        "row_count": len(rows),
    }


def _candidate_supports(center: str, order: Sequence[str]) -> Iterator[tuple[str, ...]]:
    yield from combinations((point for point in order if point != center), 4)


def iter_structural_signatures(cell: FixedCell) -> Iterator[tuple[RowSpec, ...]]:
    """Enumerate complete signatures in deterministic center/support order."""

    assigned = list(cell.named_rows)
    assigned_supports = [set(row.support) for row in assigned]
    pair_counts: Counter[tuple[str, str]] = Counter()
    for row in assigned:
        for pair in combinations(row.support, 2):
            pair_counts[tuple(sorted(pair, key=cell.order.index))] += 1
    named_centers = {row.center for row in cell.named_rows}
    free_centers = tuple(center for center in cell.order if center not in named_centers)

    def search(index: int) -> Iterator[tuple[RowSpec, ...]]:
        if index == len(free_centers):
            rows = tuple(sorted(assigned, key=lambda row: cell.order.index(row.center)))
            replay = replay_structural_assignment(rows, cell)
            if not replay["accepted"]:
                raise CegarError(
                    "internal structural generator emitted an invalid row set"
                )
            yield rows
            return
        center = free_centers[index]
        for support in _candidate_supports(center, cell.order):
            support_set = set(support)
            if any(len(support_set & prior) > 2 for prior in assigned_supports):
                continue
            pairs = tuple(
                tuple(sorted(pair, key=cell.order.index))
                for pair in combinations(support, 2)
            )
            if any(pair_counts[pair] >= 2 for pair in pairs):
                continue
            row = _row(
                f"global_{center}",
                center,
                support,
                exact=False,
                origin="CEGAR_SELECTED_ROW_FROM_GLOBAL_K4",
            )
            assigned.append(row)
            assigned_supports.append(support_set)
            pair_counts.update(pairs)
            yield from search(index + 1)
            for pair in pairs:
                pair_counts[pair] -= 1
            assigned_supports.pop()
            assigned.pop()

    yield from search(0)


def structural_signature_payload(rows: Sequence[RowSpec]) -> dict[str, Any]:
    return {
        "rows": [
            row.as_dict()
            for row in sorted(rows, key=lambda item: ROLE_ORDER.index(item.center))
        ]
    }


def structural_signature_sha256(rows: Sequence[RowSpec]) -> str:
    return sha256_bytes(canonical_json(structural_signature_payload(rows)))


def _sub(left: str, right: str) -> str:
    return f"(- {left} {right})"


def _mul(left: str, right: str) -> str:
    return f"(* {left} {right})"


def _d2(left: int, right: int) -> str:
    dx = _sub(f"x_{left}", f"x_{right}")
    dy = _sub(f"y_{left}", f"y_{right}")
    return f"(+ {_mul(dx, dx)} {_mul(dy, dy)})"


def _cross(left: int, right: int, point: int) -> str:
    abx = _sub(f"x_{right}", f"x_{left}")
    aby = _sub(f"y_{right}", f"y_{left}")
    acx = _sub(f"x_{point}", f"x_{left}")
    acy = _sub(f"y_{point}", f"y_{left}")
    return _sub(_mul(abx, acy), _mul(aby, acx))


def build_smt2(cell: FixedCell, rows: Sequence[RowSpec]) -> tuple[str, dict[str, int]]:
    """Emit the complete fixed-order metric query for one structural signature."""

    replay = replay_structural_assignment(rows, cell)
    if not replay["accepted"]:
        raise CegarError(f"cannot encode invalid structure: {replay['reason']}")
    index = {role: position for position, role in enumerate(cell.order)}
    assertions: list[tuple[str, str, str]] = []
    gauge = (
        ("x_0", "0"),
        ("y_0", "0"),
        (f"x_{index['u']}", "1"),
        (f"y_{index['u']}", "0"),
    )
    assertions.extend(
        ("similarity_gauge", name, f"(= {name} {value})") for name, value in gauge
    )
    physical_q = next(row for row in rows if row.center == "O")
    physical_reference = _d2(index["O"], index[physical_q.support[0]])
    assertions.append(
        (
            "physical_five_surplus_incidence",
            "physical_Q:delta",
            f"(= {_d2(index['O'], index['delta'])} {physical_reference})",
        )
    )
    for row in rows:
        center = index[row.center]
        support = tuple(index[point] for point in row.support)
        reference = _d2(center, support[0])
        assertions.append(("positive_radii", row.name, f"(> {reference} 0)"))
        for point in support[1:]:
            assertions.append(
                ("row_equalities", row.name, f"(= {_d2(center, point)} {reference})")
            )
        if row.exact:
            support_set = set(support)
            for point in range(len(cell.order)):
                if point == center or point in support_set:
                    continue
                delta = _sub(_d2(center, point), reference)
                assertions.append(
                    (
                        "exact_off_row_exclusions",
                        row.name,
                        f"(> {_mul(delta, delta)} 0)",
                    )
                )
    for left, right in combinations(range(len(cell.order)), 2):
        assertions.append(
            ("ambient_distinctness", f"{left}:{right}", f"(> {_d2(left, right)} 0)")
        )
    for position, left in enumerate(range(len(cell.order))):
        right = (position + 1) % len(cell.order)
        for point in range(len(cell.order)):
            if point in {left, right}:
                continue
            assertions.append(
                (
                    "strict_convexity",
                    f"{left}:{right}:{point}",
                    f"(> {_cross(left, right, point)} 0)",
                )
            )
    lines = [
        "(set-logic QF_NRA)",
        "; S0-N exact-18 B=A fixed cell; O -> (0,0), u -> (1,0)",
    ]
    for role, position in index.items():
        lines.extend(
            (
                f"; cyclic role {position}: {role}; canonical alias {CANONICAL_LABELS[role]}",
                f"(declare-fun x_{position} () Real)",
                f"(declare-fun y_{position} () Real)",
            )
        )
    for category, owner, assertion in assertions:
        lines.append(f"; {category} {owner}")
        lines.append(f"(assert {assertion})")
    lines.extend(("(check-sat)", "(exit)"))
    counts = Counter(category for category, _owner, _assertion in assertions)
    counts["total"] = len(assertions)
    return "\n".join(lines) + "\n", dict(sorted(counts.items()))


def build_sat_model_query(smt2: str, role_count: int = len(ROLE_ORDER)) -> str:
    """Add exact-rational readback only after the primary query returned SAT."""

    suffix = "(check-sat)\n(exit)\n"
    if not smt2.endswith(suffix):
        raise CegarError("primary SMT query suffix drifted")
    terms = " ".join(
        term
        for position in range(role_count)
        for term in (f"x_{position}", f"y_{position}")
    )
    return (
        smt2[: -len(suffix)] + "(check-sat)\n" + f"(get-value ({terms}))\n" + "(exit)\n"
    )


_TOKEN = re.compile(r"\(|\)|[^\s()]+")
_INTEGER = re.compile(r"-?(?:0|[1-9][0-9]*)\Z")
_DECIMAL = re.compile(r"-?(?:0|[1-9][0-9]*)\.[0-9]+\Z")


def _parse_sexpr(text: str) -> object:
    tokens = _TOKEN.findall(text)
    if not tokens:
        raise CegarError("empty S-expression")
    position = 0

    def parse() -> object:
        nonlocal position
        if position >= len(tokens):
            raise CegarError("truncated S-expression")
        token = tokens[position]
        position += 1
        if token != "(":
            if token == ")":
                raise CegarError("unexpected close parenthesis")
            return token
        result = []
        while position < len(tokens) and tokens[position] != ")":
            result.append(parse())
        if position >= len(tokens):
            raise CegarError("unclosed S-expression")
        position += 1
        return result

    value = parse()
    if position != len(tokens):
        raise CegarError("trailing S-expression tokens")
    return value


def _sexpr_fraction(value: object) -> F:
    if isinstance(value, str) and _INTEGER.fullmatch(value):
        return F(int(value))
    if isinstance(value, str) and _DECIMAL.fullmatch(value):
        return F(value)
    if isinstance(value, list) and len(value) == 2 and value[0] == "-":
        return -_sexpr_fraction(value[1])
    if isinstance(value, list) and len(value) == 3 and value[0] == "/":
        denominator = _sexpr_fraction(value[2])
        if denominator == 0:
            raise CegarError("zero denominator in model")
        return _sexpr_fraction(value[1]) / denominator
    raise CegarError("model value is not an exact rational")


def parse_cvc5_rational_values(stdout: str, cell: FixedCell) -> Mapping[str, Point]:
    status_lines = [
        line.strip()
        for line in stdout.splitlines()
        if line.strip() in {"sat", "unsat", "unknown"}
    ]
    if not status_lines or status_lines[0] != "sat":
        raise CegarError("rational readback requires SAT output")
    start = stdout.find("(", stdout.find(status_lines[0]) + len(status_lines[0]))
    if start < 0:
        raise CegarError("SAT output lacks get-value data")
    parsed = _parse_sexpr(stdout[start:].strip())
    if not isinstance(parsed, list):
        raise CegarError("get-value output is not a list")
    raw: dict[str, F] = {}
    for item in parsed:
        if not isinstance(item, list) or len(item) != 2 or not isinstance(item[0], str):
            raise CegarError("get-value pair is malformed")
        if item[0] in raw:
            raise CegarError("duplicate get-value term")
        raw[item[0]] = _sexpr_fraction(item[1])
    expected = {
        term
        for position in range(len(cell.order))
        for term in (f"x_{position}", f"y_{position}")
    }
    if set(raw) != expected:
        raise CegarError("get-value term set drifted")
    return {
        role: (raw[f"x_{position}"], raw[f"y_{position}"])
        for position, role in enumerate(cell.order)
    }


def _solver_status(stdout: str) -> str | None:
    statuses = [
        line.strip().lower()
        for line in stdout.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]
    return statuses[0].upper() if statuses else None


def run_cvc5(
    smt2: str,
    candidate_index: int,
    run_root: Path,
    timeout_ms: int,
) -> dict[str, Any]:
    """Run one bounded primary query, with separate readback only after SAT."""

    binary = shutil.which("cvc5")
    if binary is None:
        raise CegarError("cvc5 is not on PATH")
    tmp_root = run_root / "tmp"
    tmp_root.mkdir(parents=True, exist_ok=True)
    stem = f"candidate-{candidate_index:04d}"
    smt_path = tmp_root / f"{stem}.smt2"
    stdout_path = tmp_root / f"{stem}.stdout.log"
    stderr_path = tmp_root / f"{stem}.stderr.log"
    resolved_binary = str(Path(binary).resolve())

    def invoke(query_path: Path, out_path: Path, err_path: Path) -> dict[str, Any]:
        command = [
            resolved_binary,
            "--lang=smt2",
            "--nl-cov",
            "--produce-models",
            f"--tlimit={timeout_ms}",
            str(query_path.resolve()),
        ]
        timed_out = False
        try:
            process = subprocess.run(
                command,
                capture_output=True,
                text=True,
                timeout=timeout_ms / 1000 + 15,
                check=False,
            )
            stdout = process.stdout
            stderr = process.stderr
            returncode = process.returncode
        except subprocess.TimeoutExpired as exc:
            timed_out = True
            stdout = (
                exc.stdout.decode()
                if isinstance(exc.stdout, bytes)
                else (exc.stdout or "")
            )
            stderr = (
                exc.stderr.decode()
                if isinstance(exc.stderr, bytes)
                else (exc.stderr or "")
            )
            stderr += "\nHOST_SUBPROCESS_TIMEOUT\n"
            returncode = None
        out_path.write_text(stdout, encoding="utf-8")
        err_path.write_text(stderr, encoding="utf-8")
        status = "UNKNOWN" if timed_out else _solver_status(stdout)
        if status is None:
            raise CegarError(
                "cvc5 returned no recognized status "
                f"(exit={returncode}, stderr={stderr[:300]!r})"
            )
        return {
            "command": command,
            "returncode": returncode,
            "status": status,
            "stderr": stderr,
            "stdout": stdout,
            "timed_out": timed_out,
        }

    smt_bytes = smt2.encode("utf-8")
    smt_path.write_bytes(smt_bytes)
    primary = invoke(smt_path, stdout_path, stderr_path)
    receipt = {
        "backend": "cvc5",
        "binary_path": resolved_binary,
        "binary_sha256": sha256_bytes(Path(binary).resolve().read_bytes()),
        "command": primary["command"],
        "returncode": primary["returncode"],
        "smt2_bytes": len(smt_bytes),
        "smt2_path": smt_path.relative_to(REPOSITORY).as_posix(),
        "smt2_sha256": sha256_bytes(smt_bytes),
        "status": primary["status"],
        "stderr_path": stderr_path.relative_to(REPOSITORY).as_posix(),
        "stderr_sha256": sha256_bytes(primary["stderr"].encode()),
        "stdout": primary["stdout"],
        "stdout_path": stdout_path.relative_to(REPOSITORY).as_posix(),
        "stdout_sha256": sha256_bytes(primary["stdout"].encode()),
        "timed_out": primary["timed_out"],
        "timeout_ms": timeout_ms,
    }
    if primary["status"] == "SAT":
        model_smt2 = build_sat_model_query(smt2)
        model_path = tmp_root / f"{stem}.model.smt2"
        model_stdout_path = tmp_root / f"{stem}.model.stdout.log"
        model_stderr_path = tmp_root / f"{stem}.model.stderr.log"
        model_bytes = model_smt2.encode()
        model_path.write_bytes(model_bytes)
        model = invoke(model_path, model_stdout_path, model_stderr_path)
        receipt["stdout"] = model["stdout"]
        receipt["model_readback"] = {
            "command": model["command"],
            "returncode": model["returncode"],
            "smt2_bytes": len(model_bytes),
            "smt2_path": model_path.relative_to(REPOSITORY).as_posix(),
            "smt2_sha256": sha256_bytes(model_bytes),
            "status": model["status"],
            "stderr_path": model_stderr_path.relative_to(REPOSITORY).as_posix(),
            "stderr_sha256": sha256_bytes(model["stderr"].encode()),
            "stdout_path": model_stdout_path.relative_to(REPOSITORY).as_posix(),
            "stdout_sha256": sha256_bytes(model["stdout"].encode()),
            "timed_out": model["timed_out"],
            "timeout_ms": timeout_ms,
        }
    return receipt


def _candidate_receipt(
    index: int,
    rows: Sequence[RowSpec],
    structure: Mapping[str, Any],
    counts: Mapping[str, int],
) -> dict[str, Any]:
    payload = structural_signature_payload(rows)
    receipt = {
        "schema": STRUCTURAL_RECEIPT_SCHEMA,
        "candidate_index": index,
        "complete_signature": payload,
        "metric_assertion_counts": dict(counts),
        "signature_sha256": structural_signature_sha256(rows),
        "structural_replay": dict(structure),
    }
    receipt["receipt_sha256"] = sha256_bytes(canonical_json(receipt))
    return receipt


def run_wave(
    cell: FixedCell,
    *,
    run_root: Path,
    max_candidates: int,
    timeout_ms: int,
    max_wall_seconds: float,
    solver_runner: SolverRunner = run_cvc5,
) -> dict[str, Any]:
    """Run a bounded fixed-signature CEGAR loop."""

    if max_candidates < 1 or timeout_ms < 1 or max_wall_seconds <= 0:
        raise CegarError("wave budgets must be positive")
    attempts: list[dict[str, Any]] = []
    blocked: list[dict[str, Any]] = []
    started = time.monotonic()
    status: str | None = None
    reason: str | None = None
    for index, rows in enumerate(
        islice(iter_structural_signatures(cell), max_candidates), start=1
    ):
        remaining = max_wall_seconds - (time.monotonic() - started)
        if remaining <= 0:
            status = UNKNOWN
            reason = "GLOBAL_WALL_BUDGET"
            break
        per_call_timeout = min(timeout_ms, max(1, int(remaining * 1000)))
        structure = replay_structural_assignment(rows, cell)
        if not structure["accepted"]:
            raise CegarError("structural candidate failed independent replay")
        smt2, counts = build_smt2(cell, rows)
        receipt = _candidate_receipt(index, rows, structure, counts)
        solver = dict(solver_runner(smt2, index, run_root, per_call_timeout))
        stdout = solver.pop("stdout", "")
        raw_status = solver.get("status")
        attempt = {"candidate": receipt, "solver": solver}
        if raw_status == "UNSAT":
            block = {
                "clause_class": "ENUMERATION_CONTROL",
                "scope": "EXACT_COMPLETE_STRUCTURAL_SIGNATURE_ONLY",
                "signature_sha256": receipt["signature_sha256"],
                "source_preserving_semantic_refinement": False,
            }
            blocked.append(block)
            attempt["disposition"] = "FORMULA_UNSAT_EXACT_SIGNATURE_BLOCKED"
            attempt["block"] = block
            attempts.append(attempt)
            continue
        if raw_status == "UNKNOWN":
            attempt["disposition"] = "UNKNOWN_NO_BLOCK"
            attempts.append(attempt)
            status = UNKNOWN
            reason = "SOLVER_TIMEOUT_OR_UNKNOWN"
            break
        if raw_status != "SAT":
            raise CegarError(f"unsupported solver status {raw_status!r}")
        try:
            points = parse_cvc5_rational_values(stdout, cell)
        except CegarError as exc:
            attempt["disposition"] = "SAT_MODEL_NOT_EXACT_RATIONAL"
            attempt["rational_replay"] = {"accepted": False, "reason": str(exc)}
            attempts.append(attempt)
            status = SAT_UNCHECKED
            reason = "ALGEBRAIC_OR_UNPARSED_MODEL"
            break
        replay = replay_fixed_cell_geometry(points, cell, rows)
        attempt["rational_replay"] = replay
        if not replay["accepted"]:
            raise CegarError(f"SAT model failed exact replay: {replay['reason']}")
        attempt["disposition"] = "SAT_EXACT_RATIONAL_REPLAYED"
        attempt["coordinates"] = {
            role: [fraction_text(points[role][0]), fraction_text(points[role][1])]
            for role in cell.order
        }
        attempts.append(attempt)
        status = SAT_EXACT
        reason = "EXACT_RATIONAL_FIXED_CELL_WITNESS"
        break
    if status is None:
        status = SCOPED_UNSAT
        reason = "EXPLICIT_CANDIDATE_CAP_REACHED"
    return {
        "status": status,
        "reason": reason,
        "attempts": attempts,
        "blocked_exact_signatures": blocked,
        "budgets": {
            "max_candidates": max_candidates,
            "max_wall_seconds": max_wall_seconds,
            "per_candidate_timeout_ms": timeout_ms,
        },
        "candidate_count": len(attempts),
        "complete_structural_coverage": False,
        "semantic_refinement_count": 0,
        "signature_block_count": len(blocked),
    }


def _source_summary(cell: FixedCell) -> dict[str, Any]:
    retained = _validate_retained_named_geometry(cell)
    centers = sorted({row.center for row in cell.named_rows}, key=cell.order.index)
    support_union = {point for row in cell.named_rows for point in row.support}
    named_union = set(centers) | support_union
    return {
        "branch": "S0-N",
        "carrier_cardinality": len(cell.order),
        "canonical_aliases": dict(
            sorted(CANONICAL_LABELS.items(), key=lambda item: item[1])
        ),
        "cyclic_order": list(cell.order),
        "named_centers": centers,
        "named_rows": [row.as_dict() for row in cell.named_rows],
        "named_union_equals_A": named_union == set(cell.order),
        "named_union_roles": sorted(named_union, key=cell.order.index),
        "physical_five": {
            "center": "O",
            "roles": list(cell.physical_five),
            "selected_Q": list(
                next(row.support for row in cell.named_rows if row.center == "O")
            ),
            "surplus_incidence_role": "delta",
        },
        "retained_named_geometry_replay": retained,
        "source_path": L3_REPO_PATH,
        "source_sha256": cell.source_sha256,
    }


def _governance_revision_summary() -> dict[str, str]:
    manifest = json.loads(RUN_MANIFEST.read_bytes())
    if (
        manifest.get("schema") != "worktree-run-manifest/v1"
        or manifest.get("run_id") != "faithful-ba-cegar-wave1"
        or manifest.get("base_head") != RUN_MANIFEST_HISTORICAL_BASE_HEAD
    ):
        raise CegarError("governed run manifest revision boundary drifted")
    return {
        "run_manifest_base_head": RUN_MANIFEST_HISTORICAL_BASE_HEAD,
        "run_manifest_base_head_meaning": (
            "historical original lane base retained as required by governance"
        ),
        "current_input_checkpoint": CURRENT_INPUT_CHECKPOINT,
        "checkpoint_meaning": "repository input checkpoint used by this audit rerun",
    }


def build_report(cell: FixedCell, wave: Mapping[str, Any]) -> dict[str, Any]:
    status = wave.get("status")
    if status not in {SAT_EXACT, SAT_UNCHECKED, UNKNOWN, SCOPED_UNSAT}:
        raise CegarError("wave has an unsupported terminal status")
    return {
        "schema": SCHEMA,
        "status": status,
        "arithmetic": "QF_NRA discovery with exact Fraction replay for rational SAT",
        "solver_invoked": True,
        "source_anchors": SOURCE_ANCHORS,
        "fixed_cell": _source_summary(cell),
        "similarity_gauge": {
            "center": "O",
            "center_coordinates": ["0/1", "0/1"],
            "justification": (
                "u belongs to physical_Q at O and O != u; normalAxis sends O to "
                "(0,0) and u to (1,0), preserving distance equalities and strict "
                "convexity under the common positive similarity"
            ),
            "witness": "u",
            "witness_coordinates": ["1/1", "0/1"],
        },
        "row_origin_guard": {
            "physical_Q": {
                "guard": "S0-N retained physical five-class and Q=C\\{delta}",
                "representation": (
                    "nonexact selected four-class plus authenticated delta fifth "
                    "incidence, with no O off-row exclusions"
                ),
                "source_origin": "SelectedFourClass subset of physical SelectedClass",
            },
            "Ku_Kv_Kdelta_F1": {
                "guard": "retained S0-N complete modeled four-fiber",
                "representation": "exact row with every off-row radius exclusion",
                "source_origin": "source-authenticated named critical row geometry",
            },
            "remaining_thirteen": {
                "guard": "B=A and global HasNEquidistantProperty 4",
                "representation": "one nonexact selected four-class per center",
                "source_origin": "FaithfulCarrierPattern.classAt",
            },
        },
        "relaxed_metric_model_scope": {
            "classification": "RELAXED_INCIDENCE_ORDER_METRIC_MODEL",
            "encoded_only": [
                "similarity gauge O=(0,0), u=(1,0)",
                "selected four-row equalities and positive radii",
                "authenticated physical O-delta fifth incidence",
                "off-row exclusions for named exact rows Ku, Kv, Kdelta, F1 only",
                "ambient point distinctness",
                "retained fixed cyclic-order strict convexity",
            ],
            "not_retained": {
                "source_coordinates": False,
                "MEC": False,
                "cap_triples_or_cards": False,
                "J1_J2_or_endpoint_geometry": False,
                "exact_physical_O_off_row_constraints": False,
            },
        },
        "governance_revision_boundary": _governance_revision_summary(),
        "encoded_omitted_ledger": {
            "encoded": [
                "fixed S0-N exact-18 role domain and cyclic order",
                "compatible prescribed SelectedFourClass rows",
                "authenticated physical-five surplus incidence delta at O",
                "one selected four-support at every remaining center",
                "C2 pairwise selected-row intersection at most two",
                "C4 point-pair multiplicity at most two distinct centers",
                "row equidistance and positive squared radii",
                "off-row radius exclusions for Ku, Kv, Kdelta, and F1 only",
                "ambient distinctness and every edge/nonincident strict orientation",
            ],
            "omitted": [
                "typed Lean FaithfulCarrierPattern construction",
                "CounterexampleData, D.Minimal, and CriticalShellSystem",
                "retained source coordinates, MEC, caps, J1/J2, and endpoint geometry",
                "exact physical-O off-row constraints",
                "complete support/order/alias/cardinality coverage beyond this cell",
                "proof-carrying QF_NRA UNSAT",
                "exact replay of nonrational algebraic SAT models",
            ],
        },
        "cegar": dict(wave),
        "claim_scope": {
            "fixed_S0_N_B_eq_A_cell_only": True,
            "relaxed_incidence_order_metric_model_only": True,
            "complete_candidate_coverage": False,
            "bounded_UNSAT": False,
            "CounterexampleData": False,
            "CriticalShellSystem": False,
            "global_theorem": False,
            "Lean_proof": False,
        },
        "wave_data_generalization_checkpoint": {
            "reviewed_exact_signature_blocks": wave.get("signature_block_count", 0),
            "candidate_general_theorem": None,
            "outcome": (
                "No stable general pattern is asserted from this capped first wave; "
                "each metric-UNSAT record remains an exact-signature enumeration block."
            ),
        },
        "first_unmodeled_next_interface": (
            "authenticated exhaustive structural support/order cell coverage, followed "
            "by a checked terminal proof or exact positive model for every retained cell"
        ),
    }


def solver_result_from_report(report: Mapping[str, Any]) -> dict[str, Any]:
    cegar = report["cegar"]
    return {
        "schema": SOLVER_RESULT_SCHEMA,
        "status": report["status"],
        "reason": cegar["reason"],
        "budgets": cegar["budgets"],
        "attempts": cegar["attempts"],
        "candidate_count": cegar["candidate_count"],
        "signature_block_count": cegar["signature_block_count"],
        "complete_structural_coverage": False,
        "bounded_UNSAT": False,
    }


def _verified_run_file(relative: object, expected_sha256: object) -> bytes:
    if not isinstance(relative, str) or not isinstance(expected_sha256, str):
        raise CegarError("cvc5 run-file receipt is malformed")
    path = (REPOSITORY / relative).resolve()
    if not path.is_relative_to(REPOSITORY):
        raise CegarError("cvc5 run-file path escapes the repository")
    payload = path.read_bytes()
    if sha256_bytes(payload) != expected_sha256:
        raise CegarError("cvc5 run-file digest drifted")
    return payload


def _verify_cvc5_receipt(solver: Mapping[str, Any], smt2: str) -> None:
    smt_payload = _verified_run_file(solver.get("smt2_path"), solver.get("smt2_sha256"))
    stdout_payload = _verified_run_file(
        solver.get("stdout_path"), solver.get("stdout_sha256")
    )
    stderr_payload = _verified_run_file(
        solver.get("stderr_path"), solver.get("stderr_sha256")
    )
    if smt_payload != smt2.encode() or solver.get("smt2_bytes") != len(smt_payload):
        raise CegarError("cvc5 archived SMT bytes drifted")
    if b"(get-value" in smt_payload:
        raise CegarError("primary SMT query contains unconditional model readback")
    binary_text = solver.get("binary_path")
    if not isinstance(binary_text, str):
        raise CegarError("cvc5 binary path is malformed")
    binary = Path(binary_text).resolve()
    if sha256_bytes(binary.read_bytes()) != solver.get("binary_sha256"):
        raise CegarError("cvc5 binary digest drifted")
    command = solver.get("command")
    expected_command = [
        str(binary),
        "--lang=smt2",
        "--nl-cov",
        "--produce-models",
        f"--tlimit={solver.get('timeout_ms')}",
        str((REPOSITORY / str(solver.get("smt2_path"))).resolve()),
    ]
    if command != expected_command:
        raise CegarError("cvc5 command receipt drifted")
    archived_status = _solver_status(stdout_payload.decode("utf-8"))
    if solver.get("timed_out"):
        archived_status = "UNKNOWN"
    if archived_status != solver.get("status"):
        raise CegarError("cvc5 archived status drifted")
    if solver.get("status") == "UNSAT" and (
        stdout_payload != b"unsat\n" or stderr_payload != b""
    ):
        raise CegarError("UNSAT run contains trailing solver diagnostics")


def verify_report(report: Mapping[str, Any], cell: FixedCell) -> None:
    if report.get("schema") != SCHEMA:
        raise CegarError("report schema drifted")
    fixed = report.get("fixed_cell")
    if not isinstance(fixed, dict) or fixed != _source_summary(cell):
        raise CegarError("report fixed-cell packet drifted")
    if report.get("governance_revision_boundary") != _governance_revision_summary():
        raise CegarError("report governance revision boundary drifted")
    relaxed = report.get("relaxed_metric_model_scope")
    if not isinstance(relaxed, dict) or relaxed.get("not_retained") != {
        "source_coordinates": False,
        "MEC": False,
        "cap_triples_or_cards": False,
        "J1_J2_or_endpoint_geometry": False,
        "exact_physical_O_off_row_constraints": False,
    }:
        raise CegarError("relaxed metric model boundary drifted")
    cegar = report.get("cegar")
    if not isinstance(cegar, dict):
        raise CegarError("report lacks CEGAR packet")
    attempts = cegar.get("attempts")
    if not isinstance(attempts, list):
        raise CegarError("report attempts are malformed")
    observed_blocks = []
    for expected_index, attempt in enumerate(attempts, start=1):
        candidate = attempt.get("candidate")
        if (
            not isinstance(candidate, dict)
            or candidate.get("candidate_index") != expected_index
        ):
            raise CegarError("candidate receipt order drifted")
        rows_raw = candidate.get("complete_signature", {}).get("rows")
        if not isinstance(rows_raw, list):
            raise CegarError("candidate signature is malformed")
        rows = tuple(
            _row(
                str(item["name"]),
                str(item["center"]),
                tuple(item["support"]),
                exact=bool(item["exact"]),
                origin=str(item["origin"]),
            )
            for item in rows_raw
        )
        replay = replay_structural_assignment(rows, cell)
        if not replay["accepted"]:
            raise CegarError("archived structural assignment failed replay")
        if candidate.get("signature_sha256") != structural_signature_sha256(rows):
            raise CegarError("candidate signature hash drifted")
        unsigned = dict(candidate)
        claimed = unsigned.pop("receipt_sha256", None)
        if claimed != sha256_bytes(canonical_json(unsigned)):
            raise CegarError("candidate receipt hash drifted")
        solver = attempt.get("solver")
        if not isinstance(solver, dict):
            raise CegarError("solver receipt is malformed")
        smt2, counts = build_smt2(cell, rows)
        if (
            solver.get("smt2_sha256") != sha256_bytes(smt2.encode())
            or candidate.get("metric_assertion_counts") != counts
        ):
            raise CegarError("archived SMT identity drifted")
        if solver.get("backend") == "cvc5":
            _verify_cvc5_receipt(solver, smt2)
        solver_status = solver.get("status")
        disposition = attempt.get("disposition")
        if solver_status == "UNSAT":
            block = attempt.get("block")
            expected_block = {
                "clause_class": "ENUMERATION_CONTROL",
                "scope": "EXACT_COMPLETE_STRUCTURAL_SIGNATURE_ONLY",
                "signature_sha256": candidate["signature_sha256"],
                "source_preserving_semantic_refinement": False,
            }
            if (
                disposition != "FORMULA_UNSAT_EXACT_SIGNATURE_BLOCKED"
                or block != expected_block
            ):
                raise CegarError("formula-UNSAT block scope drifted")
            observed_blocks.append(block)
        elif solver_status == "UNKNOWN":
            if disposition != "UNKNOWN_NO_BLOCK" or "block" in attempt:
                raise CegarError("UNKNOWN disposition drifted")
        elif solver_status == "SAT":
            if disposition not in {
                "SAT_MODEL_NOT_EXACT_RATIONAL",
                "SAT_EXACT_RATIONAL_REPLAYED",
            }:
                raise CegarError("SAT disposition drifted")
        else:
            raise CegarError("solver status drifted")
        if attempt.get("disposition") == "SAT_EXACT_RATIONAL_REPLAYED":
            coordinates = attempt.get("coordinates")
            if not isinstance(coordinates, dict):
                raise CegarError("exact SAT receipt lacks coordinates")
            points = {
                role: parse_point(coordinates[role], f"coordinates.{role}")
                for role in cell.order
            }
            replay_geometry_result = replay_fixed_cell_geometry(points, cell, rows)
            if not replay_geometry_result["accepted"]:
                raise CegarError("archived exact SAT coordinates failed replay")
    if cegar.get("candidate_count") != len(attempts):
        raise CegarError("candidate count drifted")
    if cegar.get("blocked_exact_signatures") != observed_blocks:
        raise CegarError("exact-signature block list drifted")
    if cegar.get("signature_block_count") != len(observed_blocks):
        raise CegarError("exact-signature block count drifted")
    if cegar.get("semantic_refinement_count") != 0:
        raise CegarError("semantic refinement count must remain zero")
    if cegar.get("complete_structural_coverage") is not False:
        raise CegarError("capped wave cannot claim complete structural coverage")
    terminal = report.get("status")
    reason = cegar.get("reason")
    if cegar.get("status") != terminal:
        raise CegarError("terminal status drifted")
    if terminal == SCOPED_UNSAT:
        budgets = cegar.get("budgets")
        if (
            reason != "EXPLICIT_CANDIDATE_CAP_REACHED"
            or not isinstance(budgets, dict)
            or len(attempts) != budgets.get("max_candidates")
            or any(item.get("solver", {}).get("status") != "UNSAT" for item in attempts)
        ):
            raise CegarError("scoped-candidate UNSAT boundary drifted")
    elif terminal == UNKNOWN:
        if reason not in {"GLOBAL_WALL_BUDGET", "SOLVER_TIMEOUT_OR_UNKNOWN"}:
            raise CegarError("UNKNOWN reason drifted")
    elif terminal == SAT_UNCHECKED:
        if (
            not attempts
            or attempts[-1].get("disposition") != "SAT_MODEL_NOT_EXACT_RATIONAL"
        ):
            raise CegarError("unchecked SAT boundary drifted")
    elif terminal == SAT_EXACT:
        if (
            not attempts
            or attempts[-1].get("disposition") != "SAT_EXACT_RATIONAL_REPLAYED"
        ):
            raise CegarError("exact SAT boundary drifted")
    else:
        raise CegarError("unsupported terminal status")
    claim_scope = report.get("claim_scope")
    if not isinstance(claim_scope, dict) or any(
        claim_scope.get(field) is not False
        for field in (
            "complete_candidate_coverage",
            "bounded_UNSAT",
            "CounterexampleData",
            "CriticalShellSystem",
            "global_theorem",
            "Lean_proof",
        )
    ):
        raise CegarError("claim boundary drifted")


def render_markdown(report: Mapping[str, Any]) -> str:
    cegar = report["cegar"]
    fixed = report["fixed_cell"]
    attempts = cegar["attempts"]
    attempt_rows = "\n".join(
        f"| {item['candidate']['candidate_index']} | "
        f"`{item['candidate']['signature_sha256'][:16]}` | "
        f"`{item['solver']['status']}` | `{item['disposition']}` |"
        for item in attempts
    )
    if not attempt_rows:
        attempt_rows = "| — | — | — | no metric candidate launched |"
    return (
        "# Rigid221 S0 faithful `B=A` CEGAR wave 1\n\n"
        f"**Status:** `{report['status']}`\n\n"
        "**Scope:** relaxed incidence/order metric models on one retained S0-N "
        "exact-18 label/alias/order cell; discovery only\n\n"
        "## Fixed source cell\n\n"
        f"The authenticated named union contains all `{fixed['carrier_cardinality']}` "
        "carrier roles. `physical_Q={u,xu,v,xv}` is a nonexact selected four-subset "
        "of the physical five-class. `Ku`, `Kv`, `Kdelta`, and `F1` retain complete "
        "off-row exclusions. The other thirteen rows are nonexact selections supplied "
        "only by the modeled global-K4 interface.\n\n"
        "The authenticated fifth `delta` incidence at `O` is emitted separately; "
        "no other off-row exclusion is imposed at `O`.\n\n"
        "Canonical Moser aliases and the retained counterclockwise cyclic order are "
        "frozen independently in the certificate.\n\n"
        "The common similarity gauge sends `O` to `(0,0)` and its selected witness "
        "`u` to `(1,0)`. All row equalities, positive radii, ambient distinctness, "
        "and all edge/nonincident strict orientations are emitted directly.\n\n"
        "These are relaxed formulas: they do not retain the source coordinates, MEC, "
        "cap data, `J1`/`J2` or endpoint geometry, or exact physical-`O` off-row "
        "constraints. They encode only the gauge, selected-row equations, the "
        "authenticated `O`-`delta` equality, named exact-row exclusions, "
        "distinctness, and fixed-order strict convexity.\n\n"
        "## Bounded wave\n\n"
        f"Candidate cap: `{cegar['budgets']['max_candidates']}`; per-candidate timeout: "
        f"`{cegar['budgets']['per_candidate_timeout_ms']} ms`; checked candidates: "
        f"`{cegar['candidate_count']}`; exact-signature blocks: "
        f"`{cegar['signature_block_count']}`.\n\n"
        "| Candidate | Signature SHA | Formula status | Disposition |\n"
        "|---:|---|---|---|\n"
        f"{attempt_rows}\n\n"
        "A formula-UNSAT result blocks only the complete support signature shown in "
        "its receipt. It is an enumeration-control record, not a source-preserving "
        "semantic refinement. UNKNOWN adds no block. A SAT label is exact only after "
        "every emitted assertion replays over rational coordinates.\n\n"
        "## Claim boundary\n\n"
        "This wave does not claim exhaustive candidate coverage, bounded UNSAT, a "
        "typed `FaithfulCarrierPattern`, `CounterexampleData`, `CriticalShellSystem`, "
        "a Lean theorem, or a universal result. The first unmodeled interface is an "
        "authenticated exhaustive support/order cell census with checked terminal "
        "evidence.\n\n"
        "## Governance revisions\n\n"
        f"The run manifest keeps base head `{RUN_MANIFEST_HISTORICAL_BASE_HEAD}` as "
        "the historical original lane base required by governance. The current input "
        f"checkpoint for this audit rerun is `{CURRENT_INPUT_CHECKPOINT}`.\n\n"
        "## Wave-data generalization checkpoint\n\n"
        f"{report['wave_data_generalization_checkpoint']['outcome']}\n"
    )


def write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(json.dumps(value, indent=2, sort_keys=True).encode() + b"\n")


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=L3_JSON)
    parser.add_argument("--run-root", type=Path, default=RUN_ROOT)
    parser.add_argument("--output", type=Path, default=DEFAULT_RESULT)
    parser.add_argument("--report-output", type=Path, default=DEFAULT_REPORT)
    parser.add_argument(
        "--solver-result-output", type=Path, default=DEFAULT_SOLVER_RESULT
    )
    parser.add_argument("--markdown-output", type=Path, default=DEFAULT_MARKDOWN)
    parser.add_argument("--max-candidates", type=int, default=3)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--max-wall-seconds", type=float, default=45.0)
    args = parser.parse_args(argv)

    cell = load_fixed_cell(args.input)
    wave = run_wave(
        cell,
        run_root=args.run_root,
        max_candidates=args.max_candidates,
        timeout_ms=args.timeout_ms,
        max_wall_seconds=args.max_wall_seconds,
    )
    report = build_report(cell, wave)
    verify_report(report, cell)
    for output in (args.output, args.report_output):
        write_json(output, report)
    write_json(args.solver_result_output, solver_result_from_report(report))
    args.markdown_output.parent.mkdir(parents=True, exist_ok=True)
    args.markdown_output.write_text(render_markdown(report), encoding="utf-8")
    print(
        json.dumps(
            {
                "candidate_count": wave["candidate_count"],
                "report": args.report_output.as_posix(),
                "status": report["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
