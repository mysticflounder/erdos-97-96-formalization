#!/usr/bin/env python3
"""Fail-closed matcher for the unparsed U5 metric/incidence kernels.

The companion ``audit_u5_incidence_bank_against_saved_scans.py`` deliberately
rejects theorem headers containing raw distance hypotheses, a noncollinearity
hypothesis, or a membership disjunction.  This audit handles exactly that
small residual vocabulary.  It derives distance equalities only from the
transitive closure of retained same-radius rows, derives a ``p``-circle
inequality only from the exact pinned card-five row, and derives named-triple
noncollinearity only from pairwise-distinct labels plus the ambient
``CounterexampleData.convex`` hypothesis.

This remains theorem-discovery evidence.  A match identifies a source-proved
kernel and concrete row package worth lifting; it is not a Lean proof and does
not claim that a finite shadow is a Euclidean realization.
"""

from __future__ import annotations

import argparse
import itertools
import json
import re
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

from audit_u5_incidence_bank_against_saved_scans import (
    CLASS_RE,
    DANGEROUS_RE,
    MEM_RE,
    ClassRequirement,
    Row,
    UnsupportedPattern,
    explicit_binders,
    load_scan,
    parse_pattern,
    require,
    walk_objects,
)


DIST_RE = re.compile(r"^dist (\S+) (\S+) (=|≠) dist (\S+) (\S+)$")
POS_RE = re.compile(r"^0 < dist (\S+) (\S+)$")
NONCOL_RE = re.compile(
    r"^¬ Collinear ℝ \(\{(\S+), (\S+), (\S+)\} : Set ℝ²\)$"
)
OR_MEM_RE = re.compile(r"^(\S+) ∈ (\S+) ∨ (\S+) ∈ (\S+)$")


@dataclass(frozen=True)
class DistanceAtom:
    left_a: str
    left_b: str
    relation: str
    right_a: str
    right_b: str

    @property
    def variables(self) -> frozenset[str]:
        return frozenset((self.left_a, self.left_b, self.right_a, self.right_b))


@dataclass(frozen=True)
class MetricPattern:
    fq_name: str
    source_path: str
    line: int
    q: str
    p: str
    triple: str | None
    classes: tuple[ClassRequirement, ...]
    memberships: tuple[tuple[str, str], ...]
    membership_disjunctions: tuple[tuple[str, str, str, str], ...]
    distance_atoms: tuple[DistanceAtom, ...]
    positive_distances: tuple[tuple[str, str], ...]
    noncollinear_triples: tuple[tuple[str, str, str], ...]


@dataclass(frozen=True)
class UnsupportedMetricPattern:
    fq_name: str
    unknown_types: tuple[str, ...]


def parse_metric_pattern(
    entry: Mapping[str, Any],
) -> MetricPattern | UnsupportedMetricPattern:
    statement = str(entry["statement"])
    dangerous: tuple[str, str, str] | None = None
    classes: list[ClassRequirement] = []
    memberships: list[tuple[str, str]] = []
    disjunctions: list[tuple[str, str, str, str]] = []
    distance_atoms: list[DistanceAtom] = []
    positive: list[tuple[str, str]] = []
    noncollinear: list[tuple[str, str, str]] = []
    unknown: list[str] = []

    for _name, type_text in explicit_binders(statement):
        if match := DANGEROUS_RE.fullmatch(type_text):
            candidate = match.groups()
            if dangerous is not None and candidate != dangerous:
                unknown.append(type_text)
            else:
                dangerous = candidate
            continue
        if match := CLASS_RE.fullmatch(type_text):
            kind, q, center, support = match.groups()
            classes.append(ClassRequirement(kind, q, center, support))
            continue
        if match := OR_MEM_RE.fullmatch(type_text):
            disjunctions.append(match.groups())
            continue
        if match := MEM_RE.fullmatch(type_text):
            memberships.append(match.groups())
            continue
        if match := DIST_RE.fullmatch(type_text):
            left_a, left_b, relation, right_a, right_b = match.groups()
            distance_atoms.append(
                DistanceAtom(left_a, left_b, relation, right_a, right_b)
            )
            continue
        if match := POS_RE.fullmatch(type_text):
            positive.append(match.groups())
            continue
        if match := NONCOL_RE.fullmatch(type_text):
            noncollinear.append(match.groups())
            continue
        unknown.append(type_text)

    fq_name = str(entry["fq_name"])
    class_qs = {requirement.q for requirement in classes}
    if dangerous is not None:
        q, p, triple = dangerous
        if class_qs and class_qs != {q}:
            unknown.append("class q differs from dangerous q")
    else:
        q = next(iter(class_qs)) if len(class_qs) == 1 else ""
        p = "p"
        triple = None
        if not q:
            unknown.append("cannot infer the deleted point q")

    support_names = {requirement.support for requirement in classes}
    allowed_sets = support_names | ({triple} if triple is not None else set())
    for _point, set_name in memberships:
        if set_name not in allowed_sets:
            unknown.append(f"unsupported membership set {set_name}")
    for _left, left_set, _right, right_set in disjunctions:
        if left_set not in support_names or right_set not in support_names:
            unknown.append("membership disjunction uses an unknown class support")

    if unknown:
        return UnsupportedMetricPattern(fq_name, tuple(sorted(set(unknown))))
    return MetricPattern(
        fq_name=fq_name,
        source_path=str(entry.get("path", "")),
        line=int(entry.get("line", 0)),
        q=q,
        p=p,
        triple=triple,
        classes=tuple(classes),
        memberships=tuple(memberships),
        membership_disjunctions=tuple(disjunctions),
        distance_atoms=tuple(distance_atoms),
        positive_distances=tuple(positive),
        noncollinear_triples=tuple(noncollinear),
    )


def load_metric_patterns(
    path: Path,
) -> tuple[list[MetricPattern], list[UnsupportedMetricPattern]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    entries: dict[str, dict[str, Any]] = {}
    for entry in walk_objects(payload):
        statement = entry.get("statement")
        if not (
            entry.get("family") == "U5GlobalIncidence"
            and entry.get("category") == "ambient-data-uniform"
            and entry.get("proof_status") == "source-proved"
            and isinstance(statement, str)
            and statement.endswith(": False")
        ):
            continue
        if not isinstance(parse_pattern(entry), UnsupportedPattern):
            continue
        entries.setdefault(str(entry["fq_name"]), entry)
    parsed = [parse_metric_pattern(entry) for entry in entries.values()]
    patterns = sorted(
        (item for item in parsed if isinstance(item, MetricPattern)),
        key=lambda item: item.fq_name,
    )
    unsupported = sorted(
        (item for item in parsed if isinstance(item, UnsupportedMetricPattern)),
        key=lambda item: item.fq_name,
    )
    return patterns, unsupported


Edge = tuple[int, int]


def edge(left: int, right: int) -> Edge:
    if left == right:
        return (-1, -1)
    return (left, right) if left < right else (right, left)


class EdgeClosure:
    def __init__(self, rows_by_center: Mapping[int, Sequence[Row]]) -> None:
        self.parent: dict[Edge, Edge] = {(-1, -1): (-1, -1)}
        for center, rows in rows_by_center.items():
            for row in rows:
                support = sorted(row.support)
                if not support:
                    continue
                pivot = edge(center, support[0])
                self._add(pivot)
                for point in support[1:]:
                    self.union(pivot, edge(center, point))

    def _add(self, value: Edge) -> None:
        self.parent.setdefault(value, value)

    def find(self, value: Edge) -> Edge:
        self._add(value)
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root

    def equal(self, left: Edge, right: Edge) -> bool:
        return self.find(left) == self.find(right)


def point_variables(pattern: MetricPattern) -> frozenset[str]:
    variables = {pattern.q, pattern.p}
    variables.update(requirement.center for requirement in pattern.classes)
    variables.update(point for point, _support in pattern.memberships)
    for left, _left_support, right, _right_support in pattern.membership_disjunctions:
        variables.update((left, right))
    for atom in pattern.distance_atoms:
        variables.update(atom.variables)
    for left, right in pattern.positive_distances:
        variables.update((left, right))
    for triple in pattern.noncollinear_triples:
        variables.update(triple)
    return frozenset(variables)


def exact_circle_inequality(
    atom: DistanceAtom,
    mapping: Mapping[str, int],
    pinned_support: frozenset[int],
) -> bool:
    left_a = mapping[atom.left_a]
    left_b = mapping[atom.left_b]
    right_a = mapping[atom.right_a]
    right_b = mapping[atom.right_b]
    if left_a != right_a or left_a != 1:
        return False
    if left_b == 1 or right_b == 1:
        return False
    return (left_b in pinned_support) != (right_b in pinned_support)


def class_rows(
    requirement: ClassRequirement,
    mapping: Mapping[str, int],
    required_points: frozenset[int],
    rows_by_center: Mapping[int, Sequence[Row]],
) -> list[tuple[Row, frozenset[int]]]:
    q = mapping[requirement.q]
    center = mapping[requirement.center]
    result: list[tuple[Row, frozenset[int]]] = []
    for row in rows_by_center.get(center, ()):
        non_q = row.support - {q}
        if requirement.kind == "U5QCriticalTripleClass":
            if q not in row.support or len(non_q) < 3 or len(required_points) > 3:
                continue
            if not required_points <= non_q:
                continue
            fill = sorted(non_q - required_points)[: 3 - len(required_points)]
            chosen = required_points | frozenset(fill)
            if len(chosen) == 3:
                result.append((row, chosen))
        elif requirement.kind == "U5QDeletedK4Class":
            if len(non_q) >= 4 and required_points <= non_q:
                result.append((row, non_q))
        else:  # pragma: no cover - the parser prevents this
            raise AssertionError(requirement.kind)
    return result


def match_pattern(
    pattern: MetricPattern,
    pinned_support: frozenset[int],
    rows_by_center: Mapping[int, Sequence[Row]],
) -> dict[str, Any] | None:
    labels = tuple(range(12))
    closure = EdgeClosure(rows_by_center)
    variables = point_variables(pattern)
    support_requirements: dict[str, set[str]] = defaultdict(set)
    triple_members: set[str] = set()
    for point, set_name in pattern.memberships:
        if pattern.triple is not None and set_name == pattern.triple:
            triple_members.add(point)
        else:
            support_requirements[set_name].add(point)

    class_by_support = {requirement.support: requirement for requirement in pattern.classes}
    require(
        len(class_by_support) == len(pattern.classes),
        f"{pattern.fq_name}: duplicate class support variable",
    )

    def radius_partner(atom: DistanceAtom, q_name: str, p_name: str) -> str | None:
        if atom.relation != "=":
            return None
        if atom.left_a == p_name and atom.right_a == p_name:
            if atom.left_b == q_name:
                return atom.right_b
            if atom.right_b == q_name:
                return atom.left_b
        return None

    radius_variables = {
        partner
        for atom in pattern.distance_atoms
        if (partner := radius_partner(atom, pattern.q, pattern.p)) is not None
    }

    q_choices = sorted(
        pinned_support
        if pattern.triple is not None or radius_variables
        else labels
    )
    for q_label in q_choices:
        dangerous_triples: Iterable[frozenset[int] | None]
        if pattern.triple is None:
            dangerous_triples = (None,)
        else:
            dangerous_triples = (
                frozenset(values)
                for values in itertools.combinations(sorted(pinned_support - {q_label}), 3)
            )
        for triple_labels in dangerous_triples:
            mapping: dict[str, int] = {pattern.q: q_label, pattern.p: 1}
            domains: dict[str, tuple[int, ...]] = {}
            for variable in variables - mapping.keys():
                domain = set(labels)
                if variable in radius_variables:
                    domain &= pinned_support
                if variable in triple_members:
                    if triple_labels is None:
                        return None
                    domain &= triple_labels
                if any(requirement.center == variable for requirement in pattern.classes):
                    domain &= rows_by_center.keys()
                domains[variable] = tuple(sorted(domain))

            ordered = sorted(domains, key=lambda item: (len(domains[item]), item))

            def constraints_hold(*, complete: bool) -> bool:
                for left, right in pattern.positive_distances:
                    if left in mapping and right in mapping:
                        if mapping[left] == mapping[right]:
                            return False
                    elif complete:
                        return False
                for triple in pattern.noncollinear_triples:
                    if all(name in mapping for name in triple):
                        if len({mapping[name] for name in triple}) != 3:
                            return False
                    elif complete:
                        return False
                for atom in pattern.distance_atoms:
                    if not atom.variables <= mapping.keys():
                        if complete:
                            return False
                        continue
                    left_edge = edge(mapping[atom.left_a], mapping[atom.left_b])
                    right_edge = edge(mapping[atom.right_a], mapping[atom.right_b])
                    if atom.relation == "=":
                        if not closure.equal(left_edge, right_edge):
                            return False
                    elif atom.relation == "≠":
                        if not exact_circle_inequality(atom, mapping, pinned_support):
                            return False
                    else:  # pragma: no cover - parser prevents this
                        raise AssertionError(atom.relation)
                return True

            def final_class_witnesses() -> list[dict[str, Any]] | None:
                alternatives = [
                    ((left, left_support), (right, right_support))
                    for left, left_support, right, right_support
                    in pattern.membership_disjunctions
                ]
                choices = itertools.product((0, 1), repeat=len(alternatives))
                for choice_bits in choices:
                    required = {
                        support: set(points)
                        for support, points in support_requirements.items()
                    }
                    for alternatives_for_atom, bit in zip(alternatives, choice_bits, strict=True):
                        point, support = alternatives_for_atom[bit]
                        required.setdefault(support, set()).add(point)
                    witness_options: list[list[tuple[Row, frozenset[int]]]] = []
                    valid = True
                    for requirement in pattern.classes:
                        names = required.get(requirement.support, set())
                        if not names <= mapping.keys():
                            valid = False
                            break
                        options = class_rows(
                            requirement,
                            mapping,
                            frozenset(mapping[name] for name in names),
                            rows_by_center,
                        )
                        if not options:
                            valid = False
                            break
                        witness_options.append(options)
                    if not valid:
                        continue
                    selected = [options[0] for options in witness_options]
                    return [
                        {
                            "kind": requirement.kind,
                            "center_variable": requirement.center,
                            "center": mapping[requirement.center],
                            "support_variable": requirement.support,
                            "row_name": row.name,
                            "row_support": sorted(row.support),
                            "chosen_class_support": sorted(chosen),
                        }
                        for requirement, (row, chosen) in zip(
                            pattern.classes, selected, strict=True
                        )
                    ]
                return None

            def search(index: int) -> dict[str, Any] | None:
                if index < len(ordered):
                    variable = ordered[index]
                    for value in domains[variable]:
                        mapping[variable] = value
                        if constraints_hold(complete=False):
                            result = search(index + 1)
                            if result is not None:
                                return result
                        del mapping[variable]
                    return None
                if not constraints_hold(complete=True):
                    return None
                witnesses = final_class_witnesses()
                if witnesses is None:
                    return None
                return {
                    "q": q_label,
                    "p": 1,
                    "T": sorted(triple_labels) if triple_labels is not None else None,
                    "mapping": dict(sorted(mapping.items())),
                    "class_witnesses": witnesses,
                }

            hit = search(0)
            if hit is not None:
                return hit
    return None


def smoke_gates(patterns: Sequence[MetricPattern]) -> dict[str, bool]:
    by_name = {pattern.fq_name: pattern for pattern in patterns}

    def named(suffix: str) -> MetricPattern:
        matches = [
            pattern for name, pattern in by_name.items() if name.endswith(suffix)
        ]
        require(len(matches) == 1, f"missing or duplicate smoke theorem {suffix}")
        return matches[0]

    pinned = frozenset((0, 2, 3, 4, 5))
    pinned_row = Row("pinned:first-apex-card-five", 1, pinned)

    common_rows = {
        1: (pinned_row,),
        6: (Row("synthetic:common-bisector", 6, frozenset((1, 2, 3, 4))),),
    }
    common = named("u5_common_bisector_triple_incompatibility")
    common_positive = match_pattern(common, pinned, common_rows) is not None
    common_negative = match_pattern(common, pinned, {1: (pinned_row,)}) is None

    off_circle_rows = {
        1: (pinned_row,),
        2: (Row("synthetic:at-t", 2, frozenset((1, 3, 4, 6))),),
        6: (Row("synthetic:at-x", 6, frozenset((1, 2, 3, 4))),),
    }
    off_circle = named("u5_nontriple_equilateral_on_p_circle_incompatibility")
    off_circle_positive = (
        match_pattern(off_circle, pinned, off_circle_rows) is not None
    )

    disjunction_rows = {
        1: (pinned_row,),
        2: (Row("synthetic:critical-t1", 2, frozenset((0, 1, 3, 5))),),
        3: (Row("synthetic:critical-t2", 3, frozenset((0, 1, 2, 5))),),
    }
    disjunction = named("two_triple_centers_adjacent_incompatibility")
    disjunction_positive = (
        match_pattern(disjunction, pinned, disjunction_rows) is not None
    )

    class_only_rows = {
        1: (pinned_row,),
        2: (Row("synthetic:at-x", 2, frozenset((3, 4, 5, 6))),),
        3: (Row("synthetic:at-y", 3, frozenset((2, 4, 5, 6))),),
        5: (Row("synthetic:at-b", 5, frozenset((2, 3, 4, 6))),),
    }
    class_only = named("three_exact_classes_tetrahedron_incompatibility")
    class_only_positive = (
        match_pattern(class_only, pinned, class_only_rows) is not None
    )

    require(common_positive, "common-bisector positive smoke gate failed")
    require(common_negative, "missing-class negative smoke gate failed")
    require(off_circle_positive, "exact off-circle positive smoke gate failed")
    require(disjunction_positive, "membership-disjunction smoke gate failed")
    require(class_only_positive, "class-only residual smoke gate failed")
    return {
        "common_bisector_positive": common_positive,
        "missing_class_negative": common_negative,
        "exact_off_circle_positive": off_circle_positive,
        "membership_disjunction_positive": disjunction_positive,
        "class_only_residual_positive": class_only_positive,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("scan", nargs="*", type=Path)
    parser.add_argument(
        "--inventory",
        type=Path,
        default=Path("certificates/p97_rvol_general_n_mining.json"),
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    patterns, unsupported = load_metric_patterns(args.inventory)
    scans: list[dict[str, Any]] = []
    for path in args.scan:
        pinned_support, rows_by_center, signature = load_scan(path)
        hits: list[dict[str, Any]] = []
        for pattern in patterns:
            witness = match_pattern(pattern, pinned_support, rows_by_center)
            if witness is not None:
                hits.append(
                    {
                        "theorem": pattern.fq_name,
                        "source_path": pattern.source_path,
                        "line": pattern.line,
                        "witness": witness,
                    }
                )
        scans.append(
            {
                "path": str(path),
                "assignment_signature_sha256": signature,
                "pinned_support": sorted(pinned_support),
                "hit_count": len(hits),
                "hits": hits,
            }
        )

    result = {
        "schema": "p97-u5-metric-kernel-saved-shadow-audit-v1",
        "evidence_scope": (
            "theorem-discovery matcher only; distance equalities come from row "
            "closure, p-circle inequalities from the exact pinned row, and "
            "noncollinearity from distinct labels plus CounterexampleData.convex"
        ),
        "inventory": str(args.inventory),
        "supported_pattern_count": len(patterns),
        "smoke_gates": smoke_gates(patterns),
        "unsupported_patterns": [
            {"theorem": item.fq_name, "unknown_types": list(item.unknown_types)}
            for item in unsupported
        ],
        "scans": scans,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
