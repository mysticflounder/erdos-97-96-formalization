"""Verify the center-9 K4 row-domain obstruction in one exact CardGe13 cell."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path

import cardge13_exact13_tight_cover_lra_piqd as core

CENTER = 9
ORDER = core.DIRECT_ORDER
FIXED_ROWS = (
    (11, (0, 2, 3, 5)),
    (10, (1, 6, 9, 12)),
    (0, (4, 7, 8, 11)),
    (0, (3, 9, 10, 12)),
    (1, (2, 6, 7, 10)),
)
METRIC = (
    (0, 63, 50, 70, 46, 32, 37, 46, 46, 70, 70, 46, 70),
    (63, 0, 69, 16, 21, 31, 69, 69, 61, 81, 69, 32, 11),
    (50, 69, 0, 79, 58, 54, 15, 6, 13, 40, 63, 46, 73),
    (70, 16, 79, 0, 26, 37, 77, 78, 72, 93, 82, 46, 26),
    (46, 21, 58, 26, 0, 12, 54, 56, 52, 74, 64, 38, 30),
    (32, 31, 54, 37, 12, 0, 43, 51, 49, 72, 71, 46, 39),
    (37, 69, 15, 77, 54, 43, 0, 10, 23, 48, 69, 50, 75),
    (46, 69, 6, 78, 56, 51, 10, 0, 18, 44, 66, 48, 74),
    (46, 61, 13, 72, 52, 49, 23, 18, 0, 28, 52, 36, 64),
    (70, 81, 40, 93, 74, 72, 48, 44, 28, 0, 69, 54, 83),
    (70, 69, 63, 82, 64, 71, 69, 66, 52, 69, 0, 39, 69),
    (46, 32, 46, 46, 38, 46, 50, 48, 36, 54, 39, 0, 31),
    (70, 11, 73, 26, 30, 39, 75, 74, 64, 83, 69, 31, 0),
)

Edge = tuple[int, int]
Form = tuple[int, int, int, int, int]
Vector = tuple[tuple[Edge, int], ...]


def edge(a: int, b: int) -> Edge:
    if a == b:
        raise ValueError("distance edge endpoints must differ")
    return (a, b) if a < b else (b, a)


class EdgeClasses:
    def __init__(self) -> None:
        self.parent = {edge(a, b): edge(a, b) for a, b in itertools.combinations(core.LABELS, 2)}

    def find(self, item: Edge) -> Edge:
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, left: Edge, right: Edge) -> None:
        left_root, right_root = self.find(left), self.find(right)
        if left_root != right_root:
            self.parent[max(left_root, right_root)] = min(left_root, right_root)


def kalmanson_forms() -> tuple[tuple[Form, Counter[Edge]], ...]:
    result: list[tuple[Form, Counter[Edge]]] = []
    for a, b, c, d in itertools.combinations(ORDER, 4):
        crossing = (edge(a, c), edge(b, d))
        for arm, uncrossed in enumerate(((edge(a, b), edge(c, d)), (edge(a, d), edge(b, c)))):
            vector: Counter[Edge] = Counter(crossing)
            vector.subtract(uncrossed)
            result.append(((a, b, c, d, arm), vector))
    return tuple(result)


FORMS = kalmanson_forms()


def edge_classes(support: tuple[int, ...]) -> EdgeClasses:
    classes = EdgeClasses()
    for center, row in FIXED_ROWS + ((CENTER, support),):
        anchor = edge(center, row[0])
        for point in row[1:]:
            classes.union(anchor, edge(center, point))
    return classes


def project(vector: Counter[Edge], classes: EdgeClasses) -> Vector:
    projected: Counter[Edge] = Counter()
    for item, coefficient in vector.items():
        projected[classes.find(item)] += coefficient
    return tuple(sorted((item, coefficient) for item, coefficient in projected.items() if coefficient))


def add_vectors(left: Vector, right: Vector) -> Vector:
    total: Counter[Edge] = Counter(dict(left))
    total.update(dict(right))
    return tuple(sorted((item, coefficient) for item, coefficient in total.items() if coefficient))


def negate(vector: Vector) -> Vector:
    return tuple((item, -coefficient) for item, coefficient in vector)


def certificate_for(support: tuple[int, ...]) -> tuple[Form, ...]:
    classes = edge_classes(support)
    vectors = tuple(project(vector, classes) for _, vector in FORMS)
    for index, vector in enumerate(vectors):
        if not vector:
            return (FORMS[index][0],)
    first_by_vector: dict[Vector, int] = {}
    for index, vector in enumerate(vectors):
        first_by_vector.setdefault(vector, index)
    for index, vector in enumerate(vectors):
        mate = first_by_vector.get(negate(vector))
        if mate is not None:
            return (FORMS[index][0], FORMS[mate][0])
    for left in range(len(vectors)):
        for right in range(left, len(vectors)):
            third = first_by_vector.get(negate(add_vectors(vectors[left], vectors[right])))
            if third is not None:
                return (FORMS[left][0], FORMS[right][0], FORMS[third][0])
    raise AssertionError(f"no length-at-most-three certificate for support {support}")


def classify_supports() -> dict[str, object]:
    supports = tuple(itertools.combinations((i for i in core.LABELS if i != CENTER), 4))
    certificates = tuple((support, certificate_for(support)) for support in supports)
    distribution = Counter(len(certificate) for _, certificate in certificates)
    return {
        "center": CENTER,
        "support_count": len(certificates),
        "certificate_length_counts": {str(length): distribution[length] for length in sorted(distribution)},
        "certificates": [
            {"support": list(support), "forms": [list(form) for form in certificate]}
            for support, certificate in certificates
        ],
    }


def audit_external_metric() -> dict[str, object]:
    triangle_slacks: list[int] = []
    for i, j, k in itertools.combinations(core.LABELS, 3):
        triangle_slacks.extend((
            METRIC[i][j] + METRIC[i][k] - METRIC[j][k],
            METRIC[i][j] + METRIC[j][k] - METRIC[i][k],
            METRIC[i][k] + METRIC[j][k] - METRIC[i][j],
        ))
    kalmanson_slacks: list[int] = []
    for _, vector in FORMS:
        kalmanson_slacks.append(sum(coefficient * METRIC[a][b] for (a, b), coefficient in vector.items()))
    for center, row in FIXED_ROWS:
        values = {METRIC[center][point] for point in row}
        if len(values) != 1:
            raise AssertionError(f"fixed row is not equidistant: center={center}, row={row}")
    triangle_violations = [slack for slack in triangle_slacks if slack < 1]
    if min(kalmanson_slacks) < 1:
        raise AssertionError("external matrix does not satisfy strict Kalmanson")
    return {
        "triangle_count": len(triangle_slacks),
        "minimum_triangle_slack": min(triangle_slacks),
        "triangle_violation_count": len(triangle_violations),
        "kalmanson_count": len(kalmanson_slacks),
        "minimum_kalmanson_slack": min(kalmanson_slacks),
    }


def build_commands(
    *, include_center9_k4: bool = True, exact_fixed_rows: bool = False
) -> tuple[str, ...]:
    commands = ["(set-logic QF_LIRA)"]
    for i, j in itertools.combinations(core.LABELS, 2):
        commands.extend((f"(declare-const {core._distance(i, j)} Real)", f"(assert (>= {core._distance(i, j)} 1))"))
    for i, j, k in itertools.combinations(core.LABELS, 3):
        dij, dik, djk = core._distance(i, j), core._distance(i, k), core._distance(j, k)
        commands.extend((
            f"(assert (>= (+ {dij} {dik}) (+ {djk} 1)))",
            f"(assert (>= (+ {dij} {djk}) (+ {dik} 1)))",
            f"(assert (>= (+ {dik} {djk}) (+ {dij} 1)))",
        ))
    for a, b, c, d in itertools.combinations(ORDER, 4):
        crossing = f"(+ {core._distance(a, c)} {core._distance(b, d)})"
        commands.extend((
            f"(assert (>= {crossing} (+ {core._distance(a, b)} {core._distance(c, d)} 1)))",
            f"(assert (>= {crossing} (+ {core._distance(a, d)} {core._distance(b, c)} 1)))",
        ))
    for center, row in FIXED_ROWS:
        anchor = core._distance(center, row[0])
        commands.extend(f"(assert (= {anchor} {core._distance(center, point)}))" for point in row[1:])
        if exact_fixed_rows:
            for point in core.LABELS:
                if point == center or point in row:
                    continue
                distance = core._distance(center, point)
                commands.append(
                    f"(assert (or (>= {distance} (+ {anchor} 1)) "
                    f"(>= {anchor} (+ {distance} 1))))"
                )
    if not include_center9_k4:
        return tuple(commands)
    members = tuple(f"m_G9_{point}" for point in core.LABELS if point != CENTER)
    commands.extend(f"(declare-const {member} Bool)" for member in members)
    commands.extend(("(declare-const r_G9 Real)", f"(assert {core._exactly(members, 4)})", "(assert (>= r_G9 1))"))
    for point, member in zip((i for i in core.LABELS if i != CENTER), members, strict=True):
        commands.append(f"(assert (=> {member} (= {core._distance(CENTER, point)} r_G9)))")
    return tuple(commands)


def journal_bytes(
    *, include_center9_k4: bool = True, exact_fixed_rows: bool = False
) -> bytes:
    commands = build_commands(
        include_center9_k4=include_center9_k4,
        exact_fixed_rows=exact_fixed_rows,
    )
    return ("\n".join(commands) + "\n").encode("ascii")


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8") + b"\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--base-out", type=Path, required=True)
    parser.add_argument("--exact-base-out", type=Path, required=True)
    parser.add_argument("--certificates", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    args = parser.parse_args()

    classification = classify_supports()
    metric_audit = audit_external_metric()
    if classification["certificate_length_counts"] != {"1": 455, "2": 32, "3": 8}:
        raise AssertionError(f"unexpected certificate distribution: {classification['certificate_length_counts']}")
    certificate_payload = canonical_json_bytes(classification)
    journal = journal_bytes()
    base_journal = journal_bytes(include_center9_k4=False)
    exact_base_journal = journal_bytes(
        include_center9_k4=False, exact_fixed_rows=True
    )
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.base_out.parent.mkdir(parents=True, exist_ok=True)
    args.exact_base_out.parent.mkdir(parents=True, exist_ok=True)
    args.certificates.parent.mkdir(parents=True, exist_ok=True)
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    args.base_out.write_bytes(base_journal)
    args.exact_base_out.write_bytes(exact_base_journal)
    args.certificates.write_bytes(certificate_payload)
    report = {
        "schema": "cardge13-exact13-center9-row-domain-piqd/v1",
        "created_utc": core._utc_now(),
        "claim_boundary": (
            "one fixed exact-13 abstract metric equality cell; "
            "no planar realization or exhaustive branch classification asserted"
        ),
        "external_metric_audit": metric_audit,
        "base_journal": str(args.base_out),
        "base_journal_sha256": hashlib.sha256(base_journal).hexdigest(),
        "base_journal_commands": len(build_commands(include_center9_k4=False)),
        "exact_base_journal": str(args.exact_base_out),
        "exact_base_journal_sha256": hashlib.sha256(exact_base_journal).hexdigest(),
        "exact_base_journal_commands": len(build_commands(
            include_center9_k4=False, exact_fixed_rows=True
        )),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "journal_commands": len(build_commands()),
        "certificates": str(args.certificates),
        "certificates_sha256": hashlib.sha256(certificate_payload).hexdigest(),
        "certificate_length_counts": classification["certificate_length_counts"],
        "solves": [],
        "base_solves": [],
        "exact_base_solves": [],
    }
    if args.solver:
        report["base_solves"] = core.run_piqd(
            args.base_out, build_commands(include_center9_k4=False),
            tuple(args.solver), args.timeout_ms,
            label="cardge13-exact13-center9-row-domain-base",
        )
        report["exact_base_solves"] = core.run_piqd(
            args.exact_base_out,
            build_commands(include_center9_k4=False, exact_fixed_rows=True),
            tuple(args.solver), args.timeout_ms,
            label="cardge13-exact13-center9-row-domain-exact-base",
        )
        report["solves"] = core.run_piqd(
            args.out, build_commands(), tuple(args.solver), args.timeout_ms,
            label="cardge13-exact13-center9-row-domain",
        )
    args.event.write_bytes(canonical_json_bytes(report))
    print(json.dumps({
        "journal_sha256": report["journal_sha256"],
        "certificates_sha256": report["certificates_sha256"],
        "certificate_length_counts": report["certificate_length_counts"],
        "base_statuses": [row.get("solved", {}).get("status") for row in report["base_solves"]],
        "exact_base_statuses": [
            row.get("solved", {}).get("status")
            for row in report["exact_base_solves"]
        ],
        "statuses": [row.get("solved", {}).get("status") for row in report["solves"]],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
