# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent verifier for the governed fixed-B=A S0-N CEGAR wave.

No producer is imported and no solver is invoked.  The S0-N carrier is rebuilt
from raw rational formulas; every structural signature and QF_NRA formula is
replayed; and the archived cvc5 bytes, binary, command, timeout, and UNSAT
stdout receipts are authenticated.  The result remains three scoped candidate
blocks, not bounded coverage or a Lean/global theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-faithful-ba-fixed-cell-cegar/v1"
INPUT_STATUS = "SCOPED_CANDIDATES_UNSAT_FIXED_BA_CEGAR_WAVE"
VERIFIED_STATUS = "VERIFIED_SCOPED_CANDIDATES_UNSAT_FIXED_BA_CEGAR_WAVE"
L3_SCHEMA = "rigid221-s0-l3-field-level-geometric-packet/v1"
L3_STATUS = "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET"
L3_REPO_PATH = (
    "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "solver/s0-true-cap-wave2-l3-witnesses.json"
)
RUN_RELATIVE = (
    "scratch/runs/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "faithful-ba-cegar-wave1"
)
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
    "faithful_carrier_pattern": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1492",
    "normal_axis": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:140",
    "normalized_class_row": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1592",
    "prescribed_classes": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1731",
}

ROW_GUARD = {
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
}
LEDGER = {
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
}
RELAXED_METRIC_MODEL_SCOPE = {
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
}
GOVERNANCE_REVISION_BOUNDARY = {
    "run_manifest_base_head": "f26de746bc16d15d891c42ad8cfb42876a63ab06",
    "run_manifest_base_head_meaning": (
        "historical original lane base retained as required by governance"
    ),
    "current_input_checkpoint": "aeee9534c5bf00212459a743db1333a34ee30b3d",
    "checkpoint_meaning": "repository input checkpoint used by this audit rerun",
}
CLAIM_SCOPE = {
    "fixed_S0_N_B_eq_A_cell_only": True,
    "relaxed_incidence_order_metric_model_only": True,
    "complete_candidate_coverage": False,
    "bounded_UNSAT": False,
    "CounterexampleData": False,
    "CriticalShellSystem": False,
    "global_theorem": False,
    "Lean_proof": False,
}


class VerificationError(ValueError):
    """The retained fixed-cell wave fails exact independent replay."""


@dataclass(frozen=True)
class Row:
    name: str
    center: str
    support: tuple[str, ...]
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


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def canonical_json(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode()


def fjson(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def add(a: Point, b: Point) -> Point:
    return a[0] + b[0], a[1] + b[1]


def sub(a: Point, b: Point) -> Point:
    return a[0] - b[0], a[1] - b[1]


def scale(k: F, a: Point) -> Point:
    return k * a[0], k * a[1]


def dist2(a: Point, b: Point) -> F:
    x, y = sub(a, b)
    return x * x + y * y


def orient(a: Point, b: Point, c: Point) -> F:
    ab, ac = sub(b, a), sub(c, a)
    return ab[0] * ac[1] - ab[1] * ac[0]


def p(parameter: F) -> Point:
    denominator = 1 + parameter**2
    return (1 - parameter**2) / denominator, 2 * parameter / denominator


def rotate(center: Point, point: Point, parameter: F) -> Point:
    denominator = 1 + parameter**2
    cosine = (1 - parameter**2) / denominator
    sine = 2 * parameter / denominator
    x, y = sub(point, center)
    return add(center, (cosine * x - sine * y, sine * x + cosine * y))


def formula_points() -> dict[str, Point]:
    o = (F(0), F(0))
    delta, v, u = p(F(-4, 11)), p(F(-10, 29)), p(F(-6, 19))
    xv, xu = p(F(6, 19)), p(F(4, 11))
    cu = scale(F(157, 300), add(u, xu))
    cv = scale(F(31, 60), add(v, xv))
    points = {
        "O": o,
        "delta": delta,
        "v": v,
        "u": u,
        "xv": xv,
        "xu": xu,
        "cu": cu,
        "cv": cv,
        "qu1": rotate(cu, u, F(-3, 10)),
        "qu2": rotate(cu, u, F(-2, 5)),
        "qv1": rotate(cv, v, F(-31, 20)),
        "qv2": rotate(cv, v, F(-1, 9)),
    }
    for role, parameter in {
        "fq": F(-3, 1000),
        "fw": F(-1, 500),
        "fp": F(-1, 1000),
    }.items():
        points[role] = rotate(delta, o, parameter)
    for role, parameter in {
        "d1": F(-1, 1000),
        "d2": F(-1, 500),
        "d3": F(-3, 1000),
    }.items():
        points[role] = rotate(xv, delta, parameter)
    require(set(points) == set(ROLE_ORDER), "raw S0-N formula inventory mismatch")
    return points


def ordered_support(values: Sequence[str]) -> tuple[str, ...]:
    require(len(values) == 4 and len(set(values)) == 4, "support cardinality mutation")
    require(set(values) <= set(ROLE_ORDER), "support domain mutation")
    return tuple(sorted(values, key=ROLE_ORDER.index))


def named_rows() -> tuple[Row, ...]:
    selected = "SELECTED_FOUR_SUBSET_OF_SOURCE_PHYSICAL_FIVE_CLASS"
    exact = "SOURCE_AUTHENTICATED_COMPLETE_FOUR_FIBER"
    return (
        Row(
            "physical_Q", "O", ordered_support(("u", "xu", "v", "xv")), False, selected
        ),
        Row("Ku", "cu", ordered_support(("qu1", "qu2", "u", "xu")), True, exact),
        Row("Kv", "cv", ordered_support(("qv1", "qv2", "v", "xv")), True, exact),
        Row("Kdelta", "xv", ordered_support(("d1", "d2", "d3", "delta")), True, exact),
        Row("first", "delta", ordered_support(("O", "fp", "fq", "fw")), True, exact),
    )


def geometry_replay(points: Mapping[str, Point], rows: Sequence[Row]) -> dict[str, Any]:
    require(set(points) == set(ROLE_ORDER), "coordinate domain mutation")
    checks = Counter()
    minimum_distance: F | None = None
    minimum_orientation: F | None = None
    minimum_radius: F | None = None
    minimum_gap: F | None = None
    for a, b in combinations(ROLE_ORDER, 2):
        value = dist2(points[a], points[b])
        require(value > 0, "ambient distinctness fails")
        checks["ambient_distinctness"] += 1
        minimum_distance = (
            value if minimum_distance is None else min(minimum_distance, value)
        )
    for index, a in enumerate(ROLE_ORDER):
        b = ROLE_ORDER[(index + 1) % len(ROLE_ORDER)]
        for q in ROLE_ORDER:
            if q not in (a, b):
                value = orient(points[a], points[b], points[q])
                require(value > 0, "edge/nonincident strict orientation fails")
                checks["strict_convexity"] += 1
                minimum_orientation = (
                    value
                    if minimum_orientation is None
                    else min(minimum_orientation, value)
                )
    for row in rows:
        require(row.center not in row.support, "row center omission fails")
        radius2 = dist2(points[row.center], points[row.support[0]])
        require(radius2 > 0, "positive row radius fails")
        checks["positive_radii"] += 1
        minimum_radius = (
            radius2 if minimum_radius is None else min(minimum_radius, radius2)
        )
        for q in row.support[1:]:
            require(
                dist2(points[row.center], points[q]) == radius2, "row equality fails"
            )
            checks["row_equalities"] += 1
        if row.exact:
            for q in ROLE_ORDER:
                if q != row.center and q not in row.support:
                    gap = (dist2(points[row.center], points[q]) - radius2) ** 2
                    require(gap > 0, "authenticated exact off-row exclusion fails")
                    checks["exact_off_row_exclusions"] += 1
                    minimum_gap = gap if minimum_gap is None else min(minimum_gap, gap)
    physical = next(row for row in rows if row.name == "physical_Q")
    reference = dist2(points["O"], points[physical.support[0]])
    require(
        dist2(points["O"], points["delta"]) == reference,
        "physical fifth equality fails",
    )
    checks["physical_five_surplus_incidence"] = 1
    return {
        "accepted": True,
        "checks": dict(sorted(checks.items())),
        "minimum_pair_distance_squared": fjson(minimum_distance or F(0)),
        "minimum_orientation": fjson(minimum_orientation or F(0)),
        "minimum_row_radius_squared": fjson(minimum_radius or F(0)),
        "minimum_exact_gap_squared": fjson(minimum_gap or F(0)),
    }


def structural_replay(rows: Sequence[Row]) -> dict[str, Any]:
    require(len(rows) == 18, "structural row count mutation")
    by_center = {row.center: row for row in rows}
    require(
        len(by_center) == 18 and set(by_center) == set(ROLE_ORDER),
        "structural total center assignment mutation",
    )
    expected_named = {row.center: row for row in named_rows()}
    for center, expected in expected_named.items():
        require(by_center[center] == expected, "named row/support/exact flag mutation")
    exact_names = {row.name for row in rows if row.exact}
    require(exact_names == {"Ku", "Kv", "Kdelta", "first"}, "exactness scope mutation")
    for row in rows:
        require(
            row.center not in row.support
            and len(row.support) == 4
            and len(set(row.support)) == 4,
            "row shape/center omission mutation",
        )
        if row.center not in expected_named:
            require(
                row
                == Row(
                    f"global_{row.center}",
                    row.center,
                    row.support,
                    False,
                    "CEGAR_SELECTED_ROW_FROM_GLOBAL_K4",
                ),
                "global row origin mutation",
            )
    for first, second in combinations(rows, 2):
        require(
            len(set(first.support) & set(second.support)) <= 2,
            "C2 compatibility mutation",
        )
    pair_counts = Counter(
        tuple(sorted(pair, key=ROLE_ORDER.index))
        for row in rows
        for pair in combinations(row.support, 2)
    )
    require(max(pair_counts.values(), default=0) <= 2, "C4 compatibility mutation")
    return {
        "accepted": True,
        "checks": {
            "C2_pairwise_intersections": 153,
            "C4_distinct_center_pair_multiplicities": len(pair_counts),
            "center_omissions": 18,
            "row_cardinality_four": 18,
        },
        "maximum_pair_multiplicity": max(pair_counts.values(), default=0),
        "row_count": 18,
    }


def signature_payload(rows: Sequence[Row]) -> dict[str, Any]:
    return {
        "rows": [
            row.as_dict()
            for row in sorted(rows, key=lambda value: ROLE_ORDER.index(value.center))
        ]
    }


def smt_sub(left: str, right: str) -> str:
    return f"(- {left} {right})"


def smt_mul(left: str, right: str) -> str:
    return f"(* {left} {right})"


def smt_d2(left: int, right: int) -> str:
    dx, dy = smt_sub(f"x_{left}", f"x_{right}"), smt_sub(f"y_{left}", f"y_{right}")
    return f"(+ {smt_mul(dx, dx)} {smt_mul(dy, dy)})"


def smt_cross(left: int, right: int, point: int) -> str:
    abx, aby = smt_sub(f"x_{right}", f"x_{left}"), smt_sub(f"y_{right}", f"y_{left}")
    acx, acy = smt_sub(f"x_{point}", f"x_{left}"), smt_sub(f"y_{point}", f"y_{left}")
    return smt_sub(smt_mul(abx, acy), smt_mul(aby, acx))


def build_smt2(rows: Sequence[Row]) -> tuple[str, dict[str, int]]:
    structural_replay(rows)
    index = {role: position for position, role in enumerate(ROLE_ORDER)}
    assertions: list[tuple[str, str, str]] = []
    for name, value in (
        ("x_0", "0"),
        ("y_0", "0"),
        (f"x_{index['u']}", "1"),
        (f"y_{index['u']}", "0"),
    ):
        assertions.append(("similarity_gauge", name, f"(= {name} {value})"))
    physical = next(row for row in rows if row.name == "physical_Q")
    reference = smt_d2(index["O"], index[physical.support[0]])
    assertions.append(
        (
            "physical_five_surplus_incidence",
            "physical_Q:delta",
            f"(= {smt_d2(index['O'], index['delta'])} {reference})",
        )
    )
    for row in rows:
        center = index[row.center]
        support = tuple(index[q] for q in row.support)
        reference = smt_d2(center, support[0])
        assertions.append(("positive_radii", row.name, f"(> {reference} 0)"))
        for point in support[1:]:
            assertions.append(
                ("row_equalities", row.name, f"(= {smt_d2(center, point)} {reference})")
            )
        if row.exact:
            for point in range(18):
                if point != center and point not in support:
                    delta = smt_sub(smt_d2(center, point), reference)
                    assertions.append(
                        (
                            "exact_off_row_exclusions",
                            row.name,
                            f"(> {smt_mul(delta, delta)} 0)",
                        )
                    )
    for left, right in combinations(range(18), 2):
        assertions.append(
            ("ambient_distinctness", f"{left}:{right}", f"(> {smt_d2(left, right)} 0)")
        )
    for left in range(18):
        right = (left + 1) % 18
        for point in range(18):
            if point not in (left, right):
                assertions.append(
                    (
                        "strict_convexity",
                        f"{left}:{right}:{point}",
                        f"(> {smt_cross(left, right, point)} 0)",
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
        lines.extend((f"; {category} {owner}", f"(assert {assertion})"))
    lines.extend(("(check-sat)", "(exit)"))
    counts = Counter(category for category, _owner, _assertion in assertions)
    counts["total"] = len(assertions)
    expected = {
        "ambient_distinctness": 153,
        "exact_off_row_exclusions": 52,
        "physical_five_surplus_incidence": 1,
        "positive_radii": 18,
        "row_equalities": 54,
        "similarity_gauge": 4,
        "strict_convexity": 288,
        "total": 570,
    }
    require(dict(sorted(counts.items())) == expected, "SMT assertion count mutation")
    return "\n".join(lines) + "\n", expected


def parse_rows(value: object) -> tuple[Row, ...]:
    require(isinstance(value, list), "complete structural signature is malformed")
    rows: list[Row] = []
    for item in value:
        require(
            isinstance(item, dict)
            and set(item) == {"center", "exact", "name", "origin", "support"},
            "structural row fields mutation",
        )
        require(
            isinstance(item["exact"], bool) and isinstance(item["support"], list),
            "structural row types mutation",
        )
        rows.append(
            Row(
                str(item["name"]),
                str(item["center"]),
                ordered_support(item["support"]),
                item["exact"],
                str(item["origin"]),
            )
        )
    return tuple(rows)


def confined_read(
    repository: Path, relative: object, digest: object
) -> tuple[Path, bytes]:
    require(
        isinstance(relative, str) and isinstance(digest, str),
        "archived solver path/hash mutation",
    )
    path = (repository / relative).resolve()
    require(
        path.is_relative_to(repository.resolve()),
        "archived solver path escapes repository",
    )
    try:
        payload = path.read_bytes()
    except OSError as error:
        raise VerificationError(f"cannot read archived solver file: {error}") from error
    require(sha256(payload) == digest, "archived solver file hash mutation")
    return path, payload


def verify_solver(solver: object, smt2: str, repository: Path, index: int) -> None:
    require(isinstance(solver, dict), "solver receipt malformed")
    required = {
        "backend",
        "binary_path",
        "binary_sha256",
        "command",
        "returncode",
        "smt2_bytes",
        "smt2_path",
        "smt2_sha256",
        "status",
        "stderr_path",
        "stderr_sha256",
        "stdout_path",
        "stdout_sha256",
        "timed_out",
        "timeout_ms",
    }
    require(set(solver) == required, "solver receipt fields mutation")
    require(
        solver["backend"] == "cvc5" and solver["status"] == "UNSAT",
        "solver status mutation",
    )
    require(
        solver["returncode"] == 0
        and solver["timed_out"] is False
        and solver["timeout_ms"] == 10000,
        "solver timeout/returncode mutation",
    )
    smt_path, smt_raw = confined_read(
        repository, solver["smt2_path"], solver["smt2_sha256"]
    )
    _stdout_path, stdout = confined_read(
        repository, solver["stdout_path"], solver["stdout_sha256"]
    )
    _stderr_path, stderr = confined_read(
        repository, solver["stderr_path"], solver["stderr_sha256"]
    )
    require(
        smt_raw == smt2.encode() and solver["smt2_bytes"] == len(smt_raw),
        "SMT hash/bytes mutation",
    )
    require(b"(get-value" not in smt_raw, "primary SMT query contains get-value")
    require(
        stdout == b"unsat\n" and stderr == b"", "archived cvc5 UNSAT receipt mutation"
    )
    require(
        solver["smt2_path"] == f"{RUN_RELATIVE}/tmp/candidate-{index:04d}.smt2"
        and solver["stdout_path"]
        == f"{RUN_RELATIVE}/tmp/candidate-{index:04d}.stdout.log"
        and solver["stderr_path"]
        == f"{RUN_RELATIVE}/tmp/candidate-{index:04d}.stderr.log",
        "solver archive path mutation",
    )
    binary_text = solver["binary_path"]
    require(isinstance(binary_text, str), "cvc5 binary path mutation")
    binary = Path(binary_text).resolve()
    try:
        binary_digest = sha256(binary.read_bytes())
    except OSError as error:
        raise VerificationError(f"cannot authenticate cvc5 binary: {error}") from error
    require(binary_digest == solver["binary_sha256"], "cvc5 binary hash mutation")
    require(
        solver["command"]
        == [
            str(binary),
            "--lang=smt2",
            "--nl-cov",
            "--produce-models",
            "--tlimit=10000",
            str(smt_path),
        ],
        "cvc5 command mutation",
    )


def expected_fixed_cell(points: Mapping[str, Point], l3_digest: str) -> dict[str, Any]:
    rows = named_rows()
    named_centers = sorted({row.center for row in rows}, key=ROLE_ORDER.index)
    named_union = set(named_centers) | {q for row in rows for q in row.support}
    return {
        "branch": "S0-N",
        "carrier_cardinality": 18,
        "canonical_aliases": dict(
            sorted(CANONICAL_LABELS.items(), key=lambda item: item[1])
        ),
        "cyclic_order": list(ROLE_ORDER),
        "named_centers": named_centers,
        "named_rows": [row.as_dict() for row in rows],
        "named_union_equals_A": True,
        "named_union_roles": sorted(named_union, key=ROLE_ORDER.index),
        "physical_five": {
            "center": "O",
            "roles": ["delta", "v", "u", "xv", "xu"],
            "selected_Q": ["v", "u", "xv", "xu"],
            "surplus_incidence_role": "delta",
        },
        "retained_named_geometry_replay": geometry_replay(points, rows),
        "source_path": L3_REPO_PATH,
        "source_sha256": l3_digest,
    }


def expected_metadata(block_count: int) -> dict[str, Any]:
    return {
        "source_anchors": SOURCE_ANCHORS,
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
        "row_origin_guard": ROW_GUARD,
        "relaxed_metric_model_scope": RELAXED_METRIC_MODEL_SCOPE,
        "governance_revision_boundary": GOVERNANCE_REVISION_BOUNDARY,
        "encoded_omitted_ledger": LEDGER,
        "claim_scope": CLAIM_SCOPE,
        "wave_data_generalization_checkpoint": {
            "reviewed_exact_signature_blocks": block_count,
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


def verify_document(
    document: object,
    *,
    certificate_path: Path | None = None,
    repository: Path | None = None,
) -> dict[str, Any]:
    require(isinstance(document, dict), "report is not an object")
    required_top = {
        "schema",
        "status",
        "arithmetic",
        "solver_invoked",
        "source_anchors",
        "fixed_cell",
        "similarity_gauge",
        "row_origin_guard",
        "relaxed_metric_model_scope",
        "governance_revision_boundary",
        "encoded_omitted_ledger",
        "cegar",
        "claim_scope",
        "wave_data_generalization_checkpoint",
        "first_unmodeled_next_interface",
    }
    require(set(document) == required_top, "top-level fields/status injection mutation")
    require(document["schema"] == SCHEMA, "schema mutation")
    require(document["status"] == INPUT_STATUS, "status upgrade or mutation")
    require(
        document["arithmetic"]
        == "QF_NRA discovery with exact Fraction replay for rational SAT",
        "arithmetic scope mutation",
    )
    require(document["solver_invoked"] is True, "solver invocation receipt mutation")
    if certificate_path is None:
        certificate_path = Path(__file__).with_name(
            "s0-faithful-ba-cegar-wave1-result.json"
        )
    if repository is None:
        repository = Path(__file__).resolve().parents[4]
    l3_path = certificate_path.with_name("s0-true-cap-wave2-l3-witnesses.json")
    try:
        l3_raw = l3_path.read_bytes()
        l3 = json.loads(l3_raw)
    except (OSError, json.JSONDecodeError) as error:
        raise VerificationError(f"cannot read retained L3 input: {error}") from error
    require(
        isinstance(l3, dict)
        and l3.get("schema") == L3_SCHEMA
        and l3.get("status") == L3_STATUS,
        "retained L3 status/schema mutation",
    )
    branch = l3.get("branches", {}).get("S0-N")
    require(
        isinstance(branch, dict)
        and branch.get("role_count") == 18
        and tuple(branch.get("cyclic_order", ())) == ROLE_ORDER,
        "retained S0-N labels/order mutation",
    )
    points = formula_points()
    expected_points = {
        role: [fjson(points[role][0]), fjson(points[role][1])] for role in ROLE_ORDER
    }
    require(
        branch.get("points") == expected_points, "retained S0-N coordinates mutation"
    )
    require(
        document["fixed_cell"] == expected_fixed_cell(points, sha256(l3_raw)),
        "fixed-cell labels/order/aliases/named rows/physical equality mutation",
    )
    cegar = document["cegar"]
    require(isinstance(cegar, dict), "CEGAR packet malformed")
    required_cegar = {
        "status",
        "reason",
        "attempts",
        "blocked_exact_signatures",
        "budgets",
        "candidate_count",
        "complete_structural_coverage",
        "semantic_refinement_count",
        "signature_block_count",
    }
    require(set(cegar) == required_cegar, "CEGAR fields mutation")
    attempts = cegar["attempts"]
    require(
        isinstance(attempts, list) and len(attempts) == 3,
        "three-candidate count mutation",
    )
    observed_blocks: list[dict[str, Any]] = []
    for index, attempt in enumerate(attempts, start=1):
        require(
            isinstance(attempt, dict)
            and set(attempt) == {"candidate", "solver", "disposition", "block"},
            "attempt fields mutation",
        )
        candidate = attempt["candidate"]
        require(
            isinstance(candidate, dict)
            and set(candidate)
            == {
                "schema",
                "candidate_index",
                "complete_signature",
                "metric_assertion_counts",
                "signature_sha256",
                "structural_replay",
                "receipt_sha256",
            },
            "candidate receipt fields mutation",
        )
        require(
            candidate["schema"] == "rigid221-s0-faithful-ba-structural-receipt/v1"
            and candidate["candidate_index"] == index,
            "candidate order/schema mutation",
        )
        signature = candidate["complete_signature"]
        require(
            isinstance(signature, dict) and set(signature) == {"rows"},
            "signature packet mutation",
        )
        rows = parse_rows(signature["rows"])
        replay = structural_replay(rows)
        require(
            candidate["structural_replay"] == replay, "structural C2/C4 replay mutation"
        )
        payload = signature_payload(rows)
        require(signature == payload, "structural row order/support mutation")
        signature_digest = sha256(canonical_json(payload))
        require(
            candidate["signature_sha256"] == signature_digest,
            "structural signature hash mutation",
        )
        unsigned = dict(candidate)
        receipt_digest = unsigned.pop("receipt_sha256")
        require(
            receipt_digest == sha256(canonical_json(unsigned)),
            "candidate receipt hash mutation",
        )
        smt2, counts = build_smt2(rows)
        require(
            candidate["metric_assertion_counts"] == counts,
            "SMT assertion count mutation",
        )
        verify_solver(attempt["solver"], smt2, repository, index)
        expected_block = {
            "clause_class": "ENUMERATION_CONTROL",
            "scope": "EXACT_COMPLETE_STRUCTURAL_SIGNATURE_ONLY",
            "signature_sha256": signature_digest,
            "source_preserving_semantic_refinement": False,
        }
        require(
            attempt["disposition"] == "FORMULA_UNSAT_EXACT_SIGNATURE_BLOCKED"
            and attempt["block"] == expected_block,
            "scoped enumeration block mutation",
        )
        observed_blocks.append(expected_block)
    require(
        cegar["status"] == INPUT_STATUS
        and cegar["reason"] == "EXPLICIT_CANDIDATE_CAP_REACHED",
        "CEGAR terminal scope mutation",
    )
    require(
        cegar["budgets"]
        == {
            "max_candidates": 3,
            "max_wall_seconds": 45.0,
            "per_candidate_timeout_ms": 10000,
        },
        "CEGAR budgets mutation",
    )
    require(
        cegar["candidate_count"] == 3 and cegar["signature_block_count"] == 3,
        "CEGAR counts mutation",
    )
    require(
        cegar["complete_structural_coverage"] is False
        and cegar["semantic_refinement_count"] == 0,
        "coverage/semantic-refinement scope upgrade",
    )
    require(
        cegar["blocked_exact_signatures"] == observed_blocks,
        "blocked signature list mutation",
    )
    for key, expected in expected_metadata(3).items():
        label = "claim-scope upgrade" if key == "claim_scope" else f"{key} mutation"
        require(document[key] == expected, label)
    return {
        "status": VERIFIED_STATUS,
        "fixed_S0_N_B_eq_A_cell_only": True,
        "relaxed_incidence_order_metric_model_only": True,
        "candidate_signature_count": 3,
        "bounded_UNSAT": False,
        "complete_candidate_coverage": False,
        "CounterexampleData": False,
        "CriticalShellSystem": False,
        "global_theorem": False,
        "Lean_proof": False,
    }


def load_and_verify(path: Path) -> dict[str, Any]:
    try:
        document = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise VerificationError(f"cannot read report: {error}") from error
    return verify_document(document, certificate_path=path)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "certificate",
        nargs="?",
        type=Path,
        default=Path(__file__).with_name("s0-faithful-ba-cegar-wave1-result.json"),
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = load_and_verify(args.certificate)
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
    print(VERIFIED_STATUS)


if __name__ == "__main__":
    main()
