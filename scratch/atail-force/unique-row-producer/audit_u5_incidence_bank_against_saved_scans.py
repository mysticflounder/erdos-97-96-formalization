#!/usr/bin/env python3
"""Fail-closed matcher for the sibling U5 class-incidence contradiction bank.

This is a theorem-discovery audit, not a proof certificate.  It parses only
the small theorem-facing vocabulary used by source-proved
``U5GlobalIncidence`` class consumers.  A declaration with any unrecognized
explicit hypothesis is reported as unsupported and can never match.

For a saved exact-card-five source-indexed shadow, the pinned first-apex row
supplies ``q + T + u``.  Chosen global or critical-shell rows can package the
``U5QCriticalTripleClass`` and ``U5QDeletedK4Class`` witnesses requested by a
bank theorem.  A match therefore identifies an existing general-n Lean
consumer worth adapting; it does not by itself prove that the saved shadow or
the production frontier instantiates the consumer.
"""

from __future__ import annotations

import argparse
import itertools
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence


FIRST_APEX = 1
CLASS_RE = re.compile(
    r"^(U5QCriticalTripleClass|U5QDeletedK4Class) D (\S+) (\S+) (\S+)$"
)
DANGEROUS_RE = re.compile(r"^U5DangerousTriple D (\S+) (\S+) (\S+)$")
SELECTED_RE = re.compile(
    r"^U5SelectedCandidateSkeleton D (\S+) (\S+) (\S+) (\S+)$"
)
SKELETON_MEM_RE = re.compile(
    r"^(\S+) ∈ \(D\.skeleton (\S+)\)\.erase (\S+)$"
)
MEM_RE = re.compile(r"^(\S+) ∈ (\S+)$")
NOT_MEM_RE = re.compile(r"^(\S+) ∉ (\S+)$")
NE_RE = re.compile(r"^(\S+) ≠ (\S+)$")


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def walk_objects(value: Any) -> Iterable[dict[str, Any]]:
    if isinstance(value, dict):
        yield value
        for child in value.values():
            yield from walk_objects(child)
    elif isinstance(value, list):
        for child in value:
            yield from walk_objects(child)


def explicit_binders(statement: str) -> list[tuple[str, str]]:
    """Extract top-level ``(name : type)`` binders with balanced parentheses."""

    groups: list[str] = []
    brace_depth = 0
    paren_depth = 0
    start: int | None = None
    for index, char in enumerate(statement):
        if char == "{" and paren_depth == 0:
            brace_depth += 1
        elif char == "}" and paren_depth == 0:
            brace_depth -= 1
        elif char == "(" and brace_depth == 0:
            if paren_depth == 0:
                start = index + 1
            paren_depth += 1
        elif char == ")" and brace_depth == 0:
            paren_depth -= 1
            if paren_depth == 0 and start is not None:
                groups.append(statement[start:index])
                start = None
        require(brace_depth >= 0 and paren_depth >= 0, "unbalanced theorem header")
    require(brace_depth == 0 and paren_depth == 0, "unbalanced theorem header")
    binders: list[tuple[str, str]] = []
    for group in groups:
        if " : " not in group:
            continue
        name, type_text = group.split(" : ", 1)
        binders.append((name.strip(), " ".join(type_text.split())))
    return binders


@dataclass(frozen=True)
class ClassRequirement:
    kind: str
    q: str
    center: str
    support: str


@dataclass(frozen=True)
class Pattern:
    fq_name: str
    source_path: str
    line: int
    q: str
    p: str
    triple: str
    selected_candidates: tuple[str, ...]
    skeleton_members: tuple[tuple[str, str, str], ...]
    classes: tuple[ClassRequirement, ...]
    memberships: tuple[tuple[str, str], ...]
    nonmemberships: tuple[tuple[str, str], ...]
    inequalities: tuple[tuple[str, str], ...]


@dataclass(frozen=True)
class UnsupportedPattern:
    fq_name: str
    unknown_types: tuple[str, ...]


def parse_pattern(entry: Mapping[str, Any]) -> Pattern | UnsupportedPattern:
    statement = str(entry["statement"])
    dangerous: tuple[str, str, str] | None = None
    selected: list[str] = []
    skeleton_members: list[tuple[str, str, str]] = []
    classes: list[ClassRequirement] = []
    memberships: list[tuple[str, str]] = []
    nonmemberships: list[tuple[str, str]] = []
    inequalities: list[tuple[str, str]] = []
    unknown: list[str] = []

    for _name, type_text in explicit_binders(statement):
        if match := DANGEROUS_RE.fullmatch(type_text):
            candidate = match.groups()
            if dangerous is not None and candidate != dangerous:
                unknown.append(type_text)
            else:
                dangerous = candidate
            continue
        if match := SELECTED_RE.fullmatch(type_text):
            q, p, triple, candidate = match.groups()
            if dangerous is not None and (q, p, triple) != dangerous:
                unknown.append(type_text)
            selected.append(candidate)
            continue
        if match := CLASS_RE.fullmatch(type_text):
            kind, q, center, support = match.groups()
            classes.append(ClassRequirement(kind, q, center, support))
            continue
        if match := SKELETON_MEM_RE.fullmatch(type_text):
            skeleton_members.append(match.groups())
            continue
        if match := NOT_MEM_RE.fullmatch(type_text):
            nonmemberships.append(match.groups())
            continue
        if match := MEM_RE.fullmatch(type_text):
            memberships.append(match.groups())
            continue
        if match := NE_RE.fullmatch(type_text):
            inequalities.append(match.groups())
            continue
        unknown.append(type_text)

    fq_name = str(entry["fq_name"])
    if dangerous is None:
        unknown.append("missing U5DangerousTriple")
    if unknown:
        return UnsupportedPattern(fq_name, tuple(sorted(set(unknown))))
    assert dangerous is not None
    q, p, triple = dangerous
    if any(requirement.q != q for requirement in classes):
        return UnsupportedPattern(fq_name, ("class q differs from dangerous q",))
    return Pattern(
        fq_name=fq_name,
        source_path=str(entry.get("path", "")),
        line=int(entry.get("line", 0)),
        q=q,
        p=p,
        triple=triple,
        selected_candidates=tuple(selected),
        skeleton_members=tuple(skeleton_members),
        classes=tuple(classes),
        memberships=tuple(memberships),
        nonmemberships=tuple(nonmemberships),
        inequalities=tuple(inequalities),
    )


def load_patterns(path: Path) -> tuple[list[Pattern], list[UnsupportedPattern]]:
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
        entries.setdefault(str(entry["fq_name"]), entry)
    parsed = [parse_pattern(entry) for entry in entries.values()]
    patterns = sorted(
        (item for item in parsed if isinstance(item, Pattern)),
        key=lambda item: item.fq_name,
    )
    unsupported = sorted(
        (item for item in parsed if isinstance(item, UnsupportedPattern)),
        key=lambda item: item.fq_name,
    )
    return patterns, unsupported


@dataclass(frozen=True)
class Row:
    name: str
    center: int
    support: frozenset[int]


def load_scan(path: Path) -> tuple[frozenset[int], dict[int, tuple[Row, ...]], str]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    reports = payload.get("reports")
    require(isinstance(reports, list) and len(reports) == 1, "expected one report")
    report = reports[0]
    require(report.get("status") == "SAT", "scan report is not SAT")
    support = frozenset(map(int, report["support"]))
    require(len(support) == 5, "expected exact card-five pinned support")
    rows: list[Row] = [Row("pinned:first-apex-card-five", FIRST_APEX, support)]
    for raw in report["rows"]:
        rows.append(
            Row(
                str(raw["name"]),
                int(raw["center"]),
                frozenset(map(int, raw["support"])),
            )
        )
    by_center: dict[int, list[Row]] = defaultdict(list)
    for row in rows:
        by_center[row.center].append(row)
    signature = str(report["assignment_signature_sha256"])
    return support, {key: tuple(value) for key, value in by_center.items()}, signature


def class_witness(
    requirement: ClassRequirement,
    mapping: Mapping[str, int],
    required_points: frozenset[int],
    rows_by_center: Mapping[int, Sequence[Row]],
) -> Row | None:
    q = mapping[requirement.q]
    center = mapping[requirement.center]
    for row in rows_by_center.get(center, ()):
        non_q = row.support - {q}
        if requirement.kind == "U5QCriticalTripleClass":
            if q not in row.support or len(non_q) < 3:
                continue
            if len(required_points) <= 3 and required_points <= non_q:
                return row
        elif requirement.kind == "U5QDeletedK4Class":
            if len(non_q) >= 4 and required_points <= non_q:
                return row
        else:  # pragma: no cover - parser prevents this
            raise AssertionError(requirement.kind)
    return None


def point_variables(pattern: Pattern) -> frozenset[str]:
    variables = {pattern.q, pattern.p}
    variables.update(pattern.selected_candidates)
    variables.update(point for point, _q, _p in pattern.skeleton_members)
    variables.update(requirement.center for requirement in pattern.classes)
    variables.update(point for point, _set_name in pattern.memberships)
    variables.update(point for point, _set_name in pattern.nonmemberships)
    for left, right in pattern.inequalities:
        variables.add(left)
        variables.add(right)
    return frozenset(variables)


def match_pattern(
    pattern: Pattern,
    pinned_support: frozenset[int],
    rows_by_center: Mapping[int, Sequence[Row]],
) -> dict[str, Any] | None:
    labels = tuple(range(12))
    triple_members = {
        point
        for point, set_name in pattern.memberships
        if set_name == pattern.triple
    }
    simple_support_names = {requirement.support for requirement in pattern.classes}
    if any(
        set_name not in simple_support_names | {pattern.triple}
        for _point, set_name in pattern.memberships
    ):
        return None
    if any(
        set_name != pattern.triple
        for _point, set_name in pattern.nonmemberships
    ):
        return None

    variables = point_variables(pattern)
    for q_label in sorted(pinned_support):
        remaining = pinned_support - {q_label}
        for triple_labels in itertools.combinations(sorted(remaining), 3):
            triple = frozenset(triple_labels)
            mapping: dict[str, int] = {
                pattern.q: q_label,
                pattern.p: FIRST_APEX,
            }
            domains: dict[str, tuple[int, ...]] = {}
            for variable in variables - mapping.keys():
                domain = set(labels)
                if variable in triple_members:
                    domain &= triple
                if variable in pattern.selected_candidates:
                    domain -= triple | {q_label, FIRST_APEX}
                for point, q, p in pattern.skeleton_members:
                    if variable == point:
                        if q != pattern.q or p != pattern.p:
                            return None
                        domain -= {q_label, FIRST_APEX}
                if any(
                    point == variable and set_name == pattern.triple
                    for point, set_name in pattern.nonmemberships
                ):
                    domain -= triple
                if any(req.center == variable for req in pattern.classes):
                    domain &= rows_by_center.keys()
                domains[variable] = tuple(sorted(domain))

            ordered = sorted(domains, key=lambda variable: (len(domains[variable]), variable))
            support_requirements: dict[str, set[str]] = defaultdict(set)
            for point, set_name in pattern.memberships:
                if set_name in simple_support_names:
                    support_requirements[set_name].add(point)

            def consistent_partial() -> bool:
                for left, right in pattern.inequalities:
                    if left in mapping and right in mapping and mapping[left] == mapping[right]:
                        return False
                return True

            def search(index: int) -> dict[str, Any] | None:
                if index < len(ordered):
                    variable = ordered[index]
                    for value in domains[variable]:
                        mapping[variable] = value
                        if consistent_partial():
                            result = search(index + 1)
                            if result is not None:
                                return result
                        del mapping[variable]
                    return None

                witnesses: list[dict[str, Any]] = []
                for requirement in pattern.classes:
                    point_names = support_requirements.get(requirement.support, set())
                    if not point_names <= mapping.keys():
                        return None
                    required = frozenset(mapping[name] for name in point_names)
                    row = class_witness(requirement, mapping, required, rows_by_center)
                    if row is None:
                        return None
                    witnesses.append(
                        {
                            "kind": requirement.kind,
                            "center_variable": requirement.center,
                            "center": mapping[requirement.center],
                            "support_variable": requirement.support,
                            "required_points": sorted(required),
                            "row_name": row.name,
                            "row_support": sorted(row.support),
                        }
                    )
                return {
                    "q": q_label,
                    "p": FIRST_APEX,
                    "T": sorted(triple),
                    "mapping": dict(sorted(mapping.items())),
                    "class_witnesses": witnesses,
                }

            hit = search(0)
            if hit is not None:
                return hit
    return None


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

    patterns, unsupported = load_patterns(args.inventory)
    unknown_types = Counter(
        unknown
        for item in unsupported
        for unknown in item.unknown_types
    )
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
        "schema": "p97-u5-incidence-bank-saved-shadow-audit-v1",
        "evidence_scope": (
            "theorem-discovery matcher only; every theorem is source-proved, "
            "but a hit still requires a Lean adapter from the live row data"
        ),
        "inventory": str(args.inventory),
        "supported_pattern_count": len(patterns),
        "unsupported_pattern_count": len(unsupported),
        "unsupported_type_counts": dict(sorted(unknown_types.items())),
        "scans": scans,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
