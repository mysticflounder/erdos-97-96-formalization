# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Scan one PIQD-derived exact-13 five-row cell for short Kalmanson certificates.

This is a diagnostic finite-classifier probe, not a source theorem.  It fixes the
strongest direct-orientation model retained by the prefix CEGAR run, adds one
four-point equidistance row at a time, and asks whether one, two, or three strict
Kalmanson forms cancel using only the resulting row equalities.  No metric,
triangle-slack, or radius-gap normalization is used.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections import Counter
from pathlib import Path

import cardge13_exact13_tight_cover_lra_piqd as core

SCHEMA = "cardge13-exact13-fixed-base-k4-scan/v1"
EXPECTED_SOURCE_SCHEMA = "cardge13-exact13-k4-prefix-cegar-piqd/v3"
EXPECTED_BLOCKER_PINS = {"b0": 9, "b1": 2}
EXPECTED_SOURCE_ROLES = {"s0": 4, "s1": 3, "d": 7, "z": 9}
EXPECTED_PREFIX_STEP = 3
EXPECTED_CHALLENGE_CENTERS = (8, 10, 11)
FIRST_APEX = 1
ORDER = core.DIRECT_ORDER
FIXED_ROWS = (
    (9, (2, 4, 6, 11)),
    (2, (0, 1, 3, 10)),
    (0, (5, 7, 8, 12)),
    (0, (2, 9, 10, 11)),
    (1, (0, 6, 7, 10)),
)
EXACT_FIXED_ROW_INDICES = (2, 3, 4)
DEFAULT_CENTERS = (8, 10, 11, 12, 3, 4, 5, 6, 7)
DEFAULT_SOURCE_EVENT = Path(
    "scratch/runs/cardge13-exact13-k4-prefix-cegar-20260904/run-0005/"
    "events/z3-pinned-source-b0-9-b1-2-step4.json"
)
CLAIM_BOUNDARY = (
    "prefix scan at each requested center: every support preceding the first "
    "reported residual has a length-at-most-three cancellation certificate, and "
    "the residual has none; exhaustive only with --exhaustive-counts; conditional "
    "on one fixed direct-orientation PIQD base cell; diagnostic only"
)

Edge = tuple[int, int]
Form = tuple[int, int, int, int, int]
Vector = tuple[tuple[Edge, int], ...]
Rows = tuple[tuple[int, tuple[int, ...]], ...]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance edge endpoints must differ")
    return (left, right) if left < right else (right, left)


class EdgeClasses:
    def __init__(self) -> None:
        self.parent = {
            edge(left, right): edge(left, right)
            for left, right in itertools.combinations(core.LABELS, 2)
        }

    def find(self, item: Edge) -> Edge:
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[max(left_root, right_root)] = min(left_root, right_root)


def kalmanson_forms() -> tuple[tuple[Form, Counter[Edge]], ...]:
    result: list[tuple[Form, Counter[Edge]]] = []
    for a, b, c, d in itertools.combinations(ORDER, 4):
        crossing = (edge(a, c), edge(b, d))
        uncrossed_pairs = (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        )
        for arm, uncrossed in enumerate(uncrossed_pairs):
            vector: Counter[Edge] = Counter(crossing)
            vector.subtract(uncrossed)
            result.append(((a, b, c, d, arm), vector))
    return tuple(result)


FORMS = kalmanson_forms()


def source_model_binding(path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text())
    if payload.get("schema") != EXPECTED_SOURCE_SCHEMA:
        raise AssertionError("unexpected PIQD source-event schema")
    if payload.get("blocker_pins") != EXPECTED_BLOCKER_PINS:
        raise AssertionError("unexpected PIQD blocker pins")
    if any(
        center in (FIRST_APEX, core.SECOND_APEX)
        for center in EXPECTED_BLOCKER_PINS.values()
    ):
        raise AssertionError("PIQD blocker pin equals a forbidden apex")
    solvers = payload.get("solvers")
    if not isinstance(solvers, list):
        raise TypeError("PIQD source-event solvers must be an array")
    z3_solvers = [row for row in solvers if row.get("solver") == "z3"]
    if len(z3_solvers) != 1:
        raise AssertionError("expected exactly one z3 source-event solver")
    solver = z3_solvers[0]
    prefixes = solver.get("prefixes")
    if not isinstance(prefixes, list):
        raise TypeError("PIQD source-event prefixes must be an array")
    selected_prefix = [
        row for row in prefixes if row.get("step") == EXPECTED_PREFIX_STEP
    ]
    if len(selected_prefix) != 1:
        raise AssertionError("expected exactly one selected PIQD prefix")
    prefix = selected_prefix[0]
    if prefix.get("centers") != list(EXPECTED_CHALLENGE_CENTERS):
        raise AssertionError("unexpected PIQD selected-prefix center sequence")
    if prefix["solve"]["status"] != "SAT":
        raise AssertionError("the bound PIQD selected prefix must be SAT")
    if prefix["solve"].get("model_replay", {}).get("outcome") != "SATISFIED":
        raise AssertionError("the bound PIQD selected-prefix replay must be satisfied")
    model = prefix["solve"]["model"]
    if not isinstance(model, str):
        raise TypeError("the bound PIQD selected-prefix model must be text")
    true_names = {
        name
        for name, value in re.findall(
            r"\(define-fun ([A-Za-z0-9_]+) \(\) Bool\s+(true|false)\)", model
        )
        if value == "true"
    }

    def support(name: str) -> tuple[int, ...]:
        prefix_name = f"m_{name}_"
        return tuple(sorted(int(item.removeprefix(prefix_name)) for item in true_names if item.startswith(prefix_name)))

    def unique_role(name: str) -> int:
        prefix_name = f"is_{name}_"
        values = tuple(
            int(item.removeprefix(prefix_name))
            for item in true_names
            if item.startswith(prefix_name)
        )
        if len(values) != 1:
            raise AssertionError(f"expected one true model role for {name}: {values}")
        return values[0]

    fixed_rows = (
        (unique_role("b0"), support("C0")),
        (unique_role("b1"), support("C1")),
        (0, support("K")),
        (0, support("L")),
        (1, support("T")),
    )
    if fixed_rows != FIXED_ROWS:
        raise AssertionError(f"bound PIQD model rows changed: {fixed_rows}")
    source_roles = {role: unique_role(role) for role in ("s0", "s1", "d", "z")}
    if source_roles != EXPECTED_SOURCE_ROLES:
        raise AssertionError(f"bound PIQD source roles changed: {source_roles}")
    challenge_rows = {
        str(center): list(support(f"G{center}")) for center in EXPECTED_CHALLENGE_CENTERS
    }
    for center in EXPECTED_CHALLENGE_CENTERS:
        row_support = challenge_rows[str(center)]
        if len(row_support) != 4 or center in row_support:
            raise AssertionError(
                f"invalid PIQD challenge row at center {center}: {row_support}"
            )
    return {
        "path": str(path),
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "schema": payload["schema"],
        "solver": solver["solver"],
        "step": prefix["step"],
        "status": prefix["solve"]["status"],
        "blocker_pins": payload["blocker_pins"],
        "source_roles": source_roles,
        "fixed_rows": [
            {"center": center, "support": list(row_support)}
            for center, row_support in fixed_rows
        ],
        "challenge_rows": challenge_rows,
    }


def edge_classes_for_rows(rows: Rows) -> EdgeClasses:
    classes = EdgeClasses()
    for row_center, row_support in FIXED_ROWS + rows:
        anchor = edge(row_center, row_support[0])
        for point in row_support[1:]:
            classes.union(anchor, edge(row_center, point))
    return classes


def edge_classes(center: int, support: tuple[int, ...]) -> EdgeClasses:
    return edge_classes_for_rows(((center, support),))


def project(vector: Counter[Edge], classes: EdgeClasses) -> Vector:
    projected: Counter[Edge] = Counter()
    for item, coefficient in vector.items():
        projected[classes.find(item)] += coefficient
    return tuple(
        sorted((item, coefficient) for item, coefficient in projected.items() if coefficient)
    )


def add_vectors(left: Vector, right: Vector) -> Vector:
    result: list[tuple[Edge, int]] = []
    left_index = 0
    right_index = 0
    while left_index < len(left) and right_index < len(right):
        left_edge, left_coefficient = left[left_index]
        right_edge, right_coefficient = right[right_index]
        if left_edge < right_edge:
            result.append((left_edge, left_coefficient))
            left_index += 1
        elif right_edge < left_edge:
            result.append((right_edge, right_coefficient))
            right_index += 1
        else:
            coefficient = left_coefficient + right_coefficient
            if coefficient:
                result.append((left_edge, coefficient))
            left_index += 1
            right_index += 1
    result.extend(left[left_index:])
    result.extend(right[right_index:])
    return tuple(result)


def negate(vector: Vector) -> Vector:
    return tuple((item, -coefficient) for item, coefficient in vector)


def certificate_for_rows(rows: Rows) -> tuple[Form, ...] | None:
    classes = edge_classes_for_rows(rows)
    projected = tuple((form, project(vector, classes)) for form, vector in FORMS)
    for form, vector in projected:
        if not vector:
            return (form,)

    first_by_vector: dict[Vector, Form] = {}
    for form, vector in projected:
        first_by_vector.setdefault(vector, form)
    for form, vector in projected:
        mate = first_by_vector.get(negate(vector))
        if mate is not None:
            return (form, mate)

    unique = tuple(first_by_vector.items())
    for left_index, (left_vector, left_form) in enumerate(unique):
        for right_vector, right_form in unique[left_index:]:
            third_form = first_by_vector.get(negate(add_vectors(left_vector, right_vector)))
            if third_form is not None:
                return (left_form, right_form, third_form)
    return None


def certificate_for(center: int, support: tuple[int, ...]) -> tuple[Form, ...] | None:
    return certificate_for_rows(((center, support),))


def supports_at(center: int) -> tuple[tuple[int, ...], ...]:
    return tuple(itertools.combinations((i for i in core.LABELS if i != center), 4))


def scan_center(
    center: int, residual_limit: int, *, exhaustive_counts: bool = False
) -> dict[str, object]:
    distribution: Counter[int] = Counter()
    residuals: list[list[int]] = []
    certificates: list[dict[str, object]] = []
    scanned = 0
    for support in supports_at(center):
        scanned += 1
        certificate = certificate_for(center, support)
        if certificate is None:
            if len(residuals) < residual_limit:
                residuals.append(list(support))
            if not exhaustive_counts:
                break
            continue
        distribution[len(certificate)] += 1
        certificates.append(
            {
                "support": list(support),
                "forms": [list(form) for form in certificate],
            }
        )
    covered = sum(distribution.values())
    all_supports_covered = scanned == 495 and not residuals
    return {
        "center": center,
        "support_count": 495,
        "scanned_support_count": scanned,
        "covered_count": covered,
        "uncovered_count": 495 - covered if exhaustive_counts or all_supports_covered else None,
        "uncovered_lower_bound": 0 if all_supports_covered else len(residuals),
        "all_supports_covered": all_supports_covered,
        "certificate_length_counts": {
            str(length): distribution[length] for length in sorted(distribution)
        },
        "first_uncovered_supports": residuals,
        "certificates": certificates if all_supports_covered else [],
    }


def validate_fixed_cell() -> None:
    if set(DEFAULT_CENTERS) != set(core.LABELS) - {0, 1, 2, 9}:
        raise AssertionError("default centers do not match the centers absent from the base cell")
    for center, support in FIXED_ROWS:
        if len(support) != 4 or len(set(support)) != 4 or center in support:
            raise AssertionError(f"invalid fixed row: {(center, support)}")
    if set(FIXED_ROWS[2][1]) & set(FIXED_ROWS[3][1]):
        raise AssertionError("the two second-apex supports must be disjoint")
    for blocker_support in (FIXED_ROWS[0][1], FIXED_ROWS[1][1]):
        for apex_support in (FIXED_ROWS[2][1], FIXED_ROWS[3][1]):
            if len(set(blocker_support) & set(apex_support)) > 2:
                raise AssertionError("source row/apex row intersection bound failed")
    if not {6, 7} <= set(FIXED_ROWS[4][1]):
        raise AssertionError("the first-apex support must retain raw labels 6 and 7")


def row_equality_commands(
    center: int, support: tuple[int, ...]
) -> tuple[str, ...]:
    if len(support) != 4 or len(set(support)) != 4 or center in support:
        raise ValueError(f"invalid four-support row: {(center, support)}")
    anchor = core._distance(center, support[0])
    return tuple(
        f"(assert (= {anchor} {core._distance(center, point)}))"
        for point in support[1:]
    )


def exact_base_commands(
    extra_rows: tuple[tuple[int, tuple[int, ...]], ...] = (),
) -> tuple[str, ...]:
    commands = ["(set-logic QF_LRA)"]
    for left, right in itertools.combinations(core.LABELS, 2):
        commands.append(f"(declare-const {core._distance(left, right)} Real)")
    for a, b, c, d in itertools.combinations(ORDER, 4):
        crossing = f"(+ {core._distance(a, c)} {core._distance(b, d)})"
        commands.extend(
            (
                f"(assert (> {crossing} (+ {core._distance(a, b)} {core._distance(c, d)})))",
                f"(assert (> {crossing} (+ {core._distance(a, d)} {core._distance(b, c)})))",
            )
        )
    for row_index, (center, row_support) in enumerate(FIXED_ROWS):
        commands.extend(row_equality_commands(center, row_support))
        anchor = core._distance(center, row_support[0])
        if row_index in EXACT_FIXED_ROW_INDICES:
            commands.extend(
                f"(assert (not (= {anchor} {core._distance(center, point)})))"
                for point in core.LABELS
                if point != center and point not in row_support
            )
    for center, support in extra_rows:
        commands.extend(row_equality_commands(center, support))
    return tuple(commands)


def candidate_all_center_rows(
    source_binding: dict[str, object], results: list[dict[str, object]]
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    """Complete one source-bound prefix with each scan's first residual row."""
    challenge_rows = source_binding.get("challenge_rows")
    if not isinstance(challenge_rows, dict):
        raise TypeError("source binding challenge_rows must be an object")
    result_by_center = {row["center"]: row for row in results}
    rows: list[tuple[int, tuple[int, ...]]] = []
    for center in DEFAULT_CENTERS:
        if str(center) in challenge_rows:
            raw_support = challenge_rows[str(center)]
        else:
            result = result_by_center.get(center)
            if result is None:
                raise AssertionError(f"missing support scan for center {center}")
            residuals = result.get("first_uncovered_supports")
            if not isinstance(residuals, list) or not residuals:
                raise AssertionError(f"center {center} has no residual support")
            raw_support = residuals[0]
        if not isinstance(raw_support, list):
            raise TypeError(f"center {center} support must be an array")
        support = tuple(int(point) for point in raw_support)
        row_equality_commands(center, support)
        rows.append((center, support))
    return tuple(rows)


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8") + b"\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--source-event", type=Path, default=DEFAULT_SOURCE_EVENT)
    parser.add_argument("--center", type=int, action="append", choices=tuple(core.LABELS))
    parser.add_argument("--residual-limit", type=int, default=20)
    parser.add_argument("--exhaustive-counts", action="store_true")
    parser.add_argument("--exact-base-journal", type=Path)
    parser.add_argument("--all-center-journal", type=Path)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()

    validate_fixed_cell()
    source_binding = source_model_binding(args.source_event)
    centers = tuple(args.center) if args.center else DEFAULT_CENTERS
    if any(center in {0, 1, 9} for center in centers):
        raise ValueError("challenge centers must be absent from the fixed base row centers")
    results = [
        scan_center(
            center,
            args.residual_limit,
            exhaustive_counts=args.exhaustive_counts,
        )
        for center in centers
    ]
    payload = {
        "schema": SCHEMA,
        "claim_boundary": CLAIM_BOUNDARY,
        "source_model_binding": source_binding,
        "order": list(ORDER),
        "fixed_rows": [
            {"center": center, "support": list(support)} for center, support in FIXED_ROWS
        ],
        "centers": results,
        "exact_base": None,
        "all_center_candidate": None,
    }
    if (
        args.solver
        and args.exact_base_journal is None
        and args.all_center_journal is None
    ):
        raise ValueError("--solver requires a journal output")
    if args.exact_base_journal is not None:
        exact_commands = exact_base_commands()
        exact_bytes = ("\n".join(exact_commands) + "\n").encode("ascii")
        args.exact_base_journal.parent.mkdir(parents=True, exist_ok=True)
        args.exact_base_journal.write_bytes(exact_bytes)
        payload["exact_base"] = {
            "claim_boundary": (
                "fixed direct PIQD model rows with source-entitled exact off-support "
                "disequalities only for K/L/T and strict Kalmanson inequalities; "
                "formula-scoped only"
            ),
            "journal": str(args.exact_base_journal),
            "journal_sha256": hashlib.sha256(exact_bytes).hexdigest(),
            "command_count": len(exact_commands),
            "solves": (
                core.run_piqd(
                    args.exact_base_journal,
                    exact_commands,
                    tuple(args.solver or ()),
                    args.timeout_ms,
                    label="cardge13-exact13-fixed-base-exactness",
                )
                if args.solver
                else []
            ),
        }
    if args.all_center_journal is not None:
        candidate_rows = candidate_all_center_rows(source_binding, results)
        all_center_commands = exact_base_commands(candidate_rows)
        all_center_bytes = ("\n".join(all_center_commands) + "\n").encode("ascii")
        args.all_center_journal.parent.mkdir(parents=True, exist_ok=True)
        args.all_center_journal.write_bytes(all_center_bytes)
        payload["all_center_candidate"] = {
            "claim_boundary": (
                "one fixed source-bound direct-order support at every raw center; "
                "strict Kalmanson inequalities and source-entitled exactness only; "
                "formula-scoped diagnostic"
            ),
            "rows": [
                {"center": center, "support": list(support)}
                for center, support in candidate_rows
            ],
            "journal": str(args.all_center_journal),
            "journal_sha256": hashlib.sha256(all_center_bytes).hexdigest(),
            "command_count": len(all_center_commands),
            "solves": (
                core.run_piqd(
                    args.all_center_journal,
                    all_center_commands,
                    tuple(args.solver or ()),
                    args.timeout_ms,
                    label="cardge13-exact13-fixed-all-center-cell",
                )
                if args.solver
                else []
            ),
        }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(canonical_json_bytes(payload))
    summary = ", ".join(
        (
            f"{result['center']}:all covered"
            if result["all_supports_covered"]
            else f"{result['center']}:uncovered witness after {result['scanned_support_count']} supports"
        )
        for result in results
    )
    print(f"wrote {args.out}; {summary}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
