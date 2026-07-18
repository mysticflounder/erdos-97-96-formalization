#!/usr/bin/env python3
"""Match the provisional exact-six equality core against existing P97 banks.

The target and every candidate are normalized as equalities between undirected
distance edges.  Matching is by an injective relabeling of point labels and
uses transitive equality closure.  In particular, it does *not* require a
candidate row to occur as a whole stored row in the target: each candidate
equation may be supplied independently by the target closure.

This is theorem-discovery infrastructure.  A hit in a CAS certificate bank is
not a Lean theorem until a suitable generic checker/transport theorem exists.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
BANK_PATH = (
    ROOT
    / "scratch/atail-force/unique-row-producer/card_five_interior_shadow_search.py"
)
ACTIVE_KERNEL_PATH = (
    ROOT
    / "scratch/atail-force/unique-row-producer/core_data_pattern_mining.json"
)
EQUALITY_MINER_PATH = (
    ROOT / "scratch/555-654-general-theorem-mining/mine_existing_equality_cores.py"
)
REGISTRY_PATHS = (
    ROOT / "certificates/p97_rvol_general_n_mining.json",
    ROOT / "certificates/erdos97_legacy_general_n_mining.json",
    ROOT / "certificates/erdos_general_theorem_p97_mining.json",
)

# The 15-equation reverse-minimized core from
# exact6-mutual-euclidean-gate/minimize-reverse-result.json.
TARGET_ROWS: dict[int, tuple[int, ...]] = {
    0: (1, 2, 5, 7),
    1: (2, 3, 8),
    2: (3, 4, 7, 9),
    3: (4, 5, 8),
    4: (5, 9),
    7: (0, 8, 9),
    8: (1, 9),
    9: (0, 2),
}
TARGET_LABELS = tuple(range(10))

Role = str
RoleEdge = tuple[Role, Role]
Requirement = tuple[RoleEdge, RoleEdge]
ConcreteEdge = tuple[int, int]


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def edge(left: int, right: int) -> ConcreteEdge:
    return (left, right) if left <= right else (right, left)


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[ConcreteEdge, ConcreteEdge] = {}

    def add(self, value: ConcreteEdge) -> None:
        self.parent.setdefault(value, value)

    def find(self, value: ConcreteEdge) -> ConcreteEdge:
        self.add(value)
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: ConcreteEdge, right: ConcreteEdge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root

    def equal(self, left: ConcreteEdge, right: ConcreteEdge) -> bool:
        return self.find(left) == self.find(right)


def row_requirements(rows: Mapping[int, Sequence[int]]) -> tuple[Requirement, ...]:
    result: list[Requirement] = []
    for center, raw_support in sorted(rows.items()):
        support = tuple(map(int, raw_support))
        require(len(support) >= 2, f"row {center} has fewer than two members")
        require(center not in support, f"row {center} contains its center")
        reference, *members = support
        for member in members:
            result.append(
                (((str(center), str(reference)), (str(center), str(member))))
            )
    return tuple(result)


def labels_of_requirements(requirements: Sequence[Requirement]) -> tuple[Role, ...]:
    return tuple(sorted({role for req in requirements for pair in req for role in pair}))


def closure_of_rows(rows: Mapping[int, Sequence[int]]) -> UnionFind:
    closure = UnionFind()
    for left, right in row_requirements(rows):
        closure.union(
            edge(int(left[0]), int(left[1])),
            edge(int(right[0]), int(right[1])),
        )
    return closure


TARGET_CLOSURE = closure_of_rows(TARGET_ROWS)


@dataclass(frozen=True)
class Pattern:
    name: str
    source: str
    category: str
    requirements: tuple[Requirement, ...]
    roles: tuple[Role, ...]
    lean_declaration: str | None = None
    certificate_status: str | None = None
    extra_hypotheses: tuple[str, ...] = ()


def load_module_snapshot(name: str, path: Path):
    source = path.read_bytes()
    spec = importlib.util.spec_from_loader(name, loader=None, origin=str(path))
    if spec is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    module.__file__ = str(path)
    sys.modules[name] = module
    exec(compile(source, str(path), "exec"), module.__dict__)
    return module, hashlib.sha256(source).hexdigest()


def load_bank_patterns() -> tuple[list[Pattern], dict[str, Any]]:
    module, source_sha256 = load_module_snapshot("exact6_core_match_bank", BANK_PATH)
    patterns: list[Pattern] = []
    family_counts: Counter[str] = Counter()
    for raw in module.REAL_INFEASIBLE_ROW_CORES:
        core_id = str(raw["id"])
        rows = {
            int(center): tuple(sorted(map(int, support)))
            for center, support in raw["rows"].items()
        }
        requirements = row_requirements(rows)
        roles = labels_of_requirements(requirements)
        family = re.sub(r"-\d+$", "", core_id)
        family_counts[family] += 1
        patterns.append(
            Pattern(
                name=core_id,
                source=str(BANK_PATH.relative_to(ROOT)),
                category="555/654 retained full CAS core",
                requirements=requirements,
                roles=roles,
                certificate_status=str(raw.get("status", "banked")),
                extra_hypotheses=(
                    ("forced pair is nonzero",)
                    if core_id.startswith("forced-pair-core-")
                    else ()
                ),
            )
        )
    return patterns, {
        "path": str(BANK_PATH.relative_to(ROOT)),
        "sha256": source_sha256,
        "count": len(patterns),
        "family_counts": dict(sorted(family_counts.items())),
    }


def load_active_kernel_patterns() -> tuple[list[Pattern], dict[str, Any]]:
    source = ACTIVE_KERNEL_PATH.read_bytes()
    payload = json.loads(source)
    raw_kernels = payload["certificate_active_kernel_analysis"]["kernels"]
    patterns: list[Pattern] = []
    for raw in raw_kernels:
        rows = {
            int(row["center"]): tuple(map(int, row["support"]))
            for row in raw["rows"]
        }
        requirements = row_requirements(rows)
        patterns.append(
            Pattern(
                name=str(raw["name"]),
                source=str(ACTIVE_KERNEL_PATH.relative_to(ROOT)),
                category="independently replayed certificate-active unit kernel",
                requirements=requirements,
                roles=labels_of_requirements(requirements),
                certificate_status=str(raw.get("status", "admitted")),
            )
        )
    return patterns, {
        "path": str(ACTIVE_KERNEL_PATH.relative_to(ROOT)),
        "sha256": hashlib.sha256(source).hexdigest(),
        "count": len(patterns),
    }


def load_current_equality_templates() -> tuple[list[Pattern], dict[str, Any]]:
    module, source_sha256 = load_module_snapshot(
        "exact6_core_match_existing_equality", EQUALITY_MINER_PATH
    )
    patterns: list[Pattern] = []
    for template in module.parse_templates():
        # The task asks for injective relabeling, so all template roles are
        # distinct even when the original Lean structure asks for fewer
        # explicit disequalities.
        patterns.append(
            Pattern(
                name=template.name,
                source=template.source,
                category="current production equality-only Lean core",
                requirements=tuple(template.requirements),
                roles=tuple(template.roles),
                lean_declaration=template.theorem,
            )
        )
    return patterns, {
        "parser_path": str(EQUALITY_MINER_PATH.relative_to(ROOT)),
        "parser_sha256": source_sha256,
        "count": len(patterns),
    }


def explicit_binders(statement: str) -> list[tuple[str, str]]:
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
    result = []
    for group in groups:
        if " : " not in group:
            continue
        name, type_text = group.split(" : ", 1)
        result.append((name.strip(), " ".join(type_text.split())))
    return result


IDENT = r"[A-Za-z_\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f][\w\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃₄₅₆₇₈₉₀]*"
DIST_EQ_DIST_RE = re.compile(
    rf"^dist ({IDENT}) ({IDENT}) = dist ({IDENT}) ({IDENT})$"
)
DIST_EQ_SCALAR_RE = re.compile(rf"^dist ({IDENT}) ({IDENT}) = ({IDENT})$")
SCALAR_EQ_DIST_RE = re.compile(rf"^({IDENT}) = dist ({IDENT}) ({IDENT})$")
POINT_NE_RE = re.compile(rf"^({IDENT}) ≠ ({IDENT})$")
POS_SCALAR_RE = re.compile(rf"^0 < ({IDENT})$")
POS_DIST_RE = re.compile(rf"^0 < dist ({IDENT}) ({IDENT})$")


def parse_registry_entry(entry: Mapping[str, Any]) -> tuple[Pattern | None, str]:
    statement = str(entry.get("statement", ""))
    if not (
        entry.get("proof_status") == "source-proved"
        and entry.get("category") == "metric-point-uniform"
        and statement.endswith(": False")
    ):
        return None, "outside source-proved metric-False scope"

    direct_requirements: list[Requirement] = []
    scalar_edges: dict[str, list[RoleEdge]] = {}
    positive_scalars: set[str] = set()
    extra: list[str] = []
    point_roles: set[str] = set()
    for _name, hypothesis in explicit_binders(statement):
        if hypothesis in {"ℝ²", "N9Point", "U1Depth5.Plane"}:
            point_roles.update(_name.split())
        elif hypothesis == "ℝ":
            # Explicit scalar parameters are declarations, not hypotheses.
            continue
        elif match := DIST_EQ_DIST_RE.fullmatch(hypothesis):
            a, b, c, d = match.groups()
            direct_requirements.append(((a, b), (c, d)))
            point_roles.update((a, b, c, d))
        elif match := DIST_EQ_SCALAR_RE.fullmatch(hypothesis):
            a, b, scalar = match.groups()
            scalar_edges.setdefault(scalar, []).append((a, b))
            point_roles.update((a, b))
        elif match := SCALAR_EQ_DIST_RE.fullmatch(hypothesis):
            scalar, a, b = match.groups()
            scalar_edges.setdefault(scalar, []).append((a, b))
            point_roles.update((a, b))
        elif match := POINT_NE_RE.fullmatch(hypothesis):
            point_roles.update(match.groups())
        elif match := POS_SCALAR_RE.fullmatch(hypothesis):
            positive_scalars.add(match.group(1))
        elif match := POS_DIST_RE.fullmatch(hypothesis):
            point_roles.update(match.groups())
        else:
            extra.append(hypothesis)

    for scalar, edges in scalar_edges.items():
        if scalar in positive_scalars and not edges:
            extra.append(f"positive scalar {scalar} has no distance witness")
        if len(edges) >= 2:
            reference, *members = edges
            direct_requirements.extend((reference, member) for member in members)
    unused_positive = positive_scalars - scalar_edges.keys()
    extra.extend(f"0 < {scalar}" for scalar in sorted(unused_positive))
    if not direct_requirements:
        return None, "no nontrivial pure distance-equality requirement"
    if extra:
        return None, "unsupported hypotheses: " + " | ".join(sorted(set(extra)))

    pattern = Pattern(
        name=str(entry["fq_name"]),
        source=f"{entry.get('path', '')}:{entry.get('line', 0)}",
        category="registered pure metric Lean contradiction",
        requirements=tuple(direct_requirements),
        roles=tuple(sorted(point_roles)),
        lean_declaration=str(entry["fq_name"]),
    )
    return pattern, "supported"


def load_registry_patterns() -> tuple[list[Pattern], dict[str, Any]]:
    patterns_by_name: dict[str, Pattern] = {}
    registries = []
    for path in REGISTRY_PATHS:
        source = path.read_bytes()
        payload = json.loads(source)
        eligible = 0
        supported = 0
        unsupported: Counter[str] = Counter()
        for entry in payload["candidate_declarations"]:
            statement = str(entry.get("statement", ""))
            if (
                entry.get("proof_status") == "source-proved"
                and entry.get("category") == "metric-point-uniform"
                and statement.endswith(": False")
            ):
                eligible += 1
            pattern, reason = parse_registry_entry(entry)
            if pattern is None:
                if reason != "outside source-proved metric-False scope":
                    unsupported[reason] += 1
                continue
            supported += 1
            patterns_by_name.setdefault(pattern.name, pattern)
        registries.append(
            {
                "path": str(path.relative_to(ROOT)),
                "sha256": hashlib.sha256(source).hexdigest(),
                "eligible_metric_false_declarations": eligible,
                "supported_pure_equality_declarations": supported,
                "unsupported_reason_counts": dict(sorted(unsupported.items())),
            }
        )
    patterns = sorted(patterns_by_name.values(), key=lambda pattern: pattern.name)
    return patterns, {"registries": registries, "deduplicated_count": len(patterns)}


def mapped_edge(mapping: Mapping[Role, int], role_edge: RoleEdge) -> ConcreteEdge:
    return edge(mapping[role_edge[0]], mapping[role_edge[1]])


def role_order(pattern: Pattern) -> tuple[Role, ...]:
    constraints = [set(left + right) for left, right in pattern.requirements]
    incidence = Counter(role for group in constraints for role in group)
    chosen: list[Role] = []
    remaining = set(pattern.roles)
    while remaining:
        chosen_set = set(chosen)

        def score(role: Role) -> tuple[int, int, int, str]:
            completed = sum((group - {role}) <= chosen_set for group in constraints)
            overlap = sum(len((group - {role}) & chosen_set) for group in constraints)
            return completed, overlap, incidence[role], role

        selected = max(remaining, key=score)
        chosen.append(selected)
        remaining.remove(selected)
    return tuple(chosen)


def find_embedding(pattern: Pattern) -> dict[Role, int] | None:
    if len(pattern.roles) > len(TARGET_LABELS):
        return None
    order = role_order(pattern)
    mapping: dict[Role, int] = {}
    used: set[int] = set()

    def consistent() -> bool:
        assigned = mapping.keys()
        for left, right in pattern.requirements:
            if set(left + right) <= assigned:
                if not TARGET_CLOSURE.equal(
                    mapped_edge(mapping, left), mapped_edge(mapping, right)
                ):
                    return False
        return True

    def search(depth: int) -> bool:
        if depth == len(order):
            return True
        role = order[depth]
        for label in TARGET_LABELS:
            if label in used:
                continue
            mapping[role] = label
            used.add(label)
            if consistent() and search(depth + 1):
                return True
            used.remove(label)
            del mapping[role]
        return False

    if not search(0):
        return None
    return dict(sorted(mapping.items()))


def requirement_holds(requirement: Requirement, mapping: Mapping[Role, int]) -> bool:
    left, right = requirement
    return TARGET_CLOSURE.equal(mapped_edge(mapping, left), mapped_edge(mapping, right))


def best_partial_embedding(pattern: Pattern) -> dict[str, Any] | None:
    """Exact maximum satisfied equation count for patterns of at most 8 roles."""

    if len(pattern.roles) > 8 or len(pattern.roles) > len(TARGET_LABELS):
        return None
    order = role_order(pattern)
    mapping: dict[Role, int] = {}
    used: set[int] = set()
    best_count = -1
    best_mapping: dict[Role, int] | None = None

    def bounds() -> tuple[int, int]:
        satisfied = 0
        undecided = 0
        assigned = mapping.keys()
        for requirement in pattern.requirements:
            if set(requirement[0] + requirement[1]) <= assigned:
                satisfied += int(requirement_holds(requirement, mapping))
            else:
                undecided += 1
        return satisfied, satisfied + undecided

    def search(depth: int) -> None:
        nonlocal best_count, best_mapping
        satisfied, upper = bounds()
        if upper < best_count:
            return
        if depth == len(order):
            if satisfied > best_count:
                best_count = satisfied
                best_mapping = dict(mapping)
            return
        role = order[depth]
        for label in TARGET_LABELS:
            if label in used:
                continue
            mapping[role] = label
            used.add(label)
            search(depth + 1)
            used.remove(label)
            del mapping[role]

    search(0)
    if best_mapping is None:
        return None
    missing = [
        {
            "left": list(requirement[0]),
            "right": list(requirement[1]),
            "mapped_left": list(mapped_edge(best_mapping, requirement[0])),
            "mapped_right": list(mapped_edge(best_mapping, requirement[1])),
        }
        for requirement in pattern.requirements
        if not requirement_holds(requirement, best_mapping)
    ]
    return {
        "matched_equation_count": best_count,
        "equation_count": len(pattern.requirements),
        "mapping": dict(sorted(best_mapping.items())),
        "missing_equations": missing,
    }


def audit_group(
    patterns: Sequence[Pattern], *, include_closest_partials: bool = True
) -> dict[str, Any]:
    hits = []
    for pattern in patterns:
        witness = find_embedding(pattern)
        if witness is not None:
            hits.append(
                {
                    "name": pattern.name,
                    "source": pattern.source,
                    "category": pattern.category,
                    "lean_declaration": pattern.lean_declaration,
                    "certificate_status": pattern.certificate_status,
                    "role_count": len(pattern.roles),
                    "equation_count": len(pattern.requirements),
                    "mapping": witness,
                    "extra_hypotheses": list(pattern.extra_hypotheses),
                }
            )
    partials = []
    if not hits and include_closest_partials:
        for pattern in patterns:
            partial = best_partial_embedding(pattern)
            if partial is None:
                continue
            partials.append(
                {
                    "name": pattern.name,
                    "source": pattern.source,
                    "category": pattern.category,
                    "lean_declaration": pattern.lean_declaration,
                    "role_count": len(pattern.roles),
                    **partial,
                }
            )
        partials.sort(
            key=lambda row: (
                -(row["matched_equation_count"] / row["equation_count"]),
                -row["matched_equation_count"],
                row["equation_count"],
                row["name"],
            )
        )
    return {
        "pattern_count": len(patterns),
        "full_match_count": len(hits),
        "full_matches": hits,
        "closest_partial_scope": (
            "exact maximum for candidates with at most eight roles"
            if include_closest_partials and not hits
            else "not run because full matches exist or the group disabled it"
        ),
        "closest_partial_matches": partials[:10],
    }


def smoke_gates() -> dict[str, bool]:
    target_pattern = Pattern(
        name="target-self",
        source="synthetic",
        category="smoke",
        requirements=row_requirements(TARGET_ROWS),
        roles=tuple(map(str, TARGET_LABELS)),
    )
    self_witness = find_embedding(target_pattern)
    require(self_witness is not None, "self-match smoke gate failed")
    deleted = Pattern(
        name="target-minus-one",
        source="synthetic",
        category="smoke",
        requirements=target_pattern.requirements[:-1],
        roles=target_pattern.roles,
    )
    require(find_embedding(deleted) is not None, "subset smoke gate failed")
    impossible = Pattern(
        name="eleven-labels",
        source="synthetic",
        category="smoke",
        requirements=(),
        roles=tuple(map(str, range(11))),
    )
    require(find_embedding(impossible) is None, "injectivity smoke gate failed")
    return {
        "target_self_match": True,
        "equation_subset_match": True,
        "eleven_roles_rejected": True,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    bank, bank_meta = load_bank_patterns()
    active, active_meta = load_active_kernel_patterns()
    current, current_meta = load_current_equality_templates()
    registered, registry_meta = load_registry_patterns()

    result = {
        "schema": "p97-exact6-provisional-core-bank-match-v1",
        "epistemic_status": "EXHAUSTIVE_STRUCTURAL_MATCH_NOT_LEAN_PROOF",
        "matching_semantics": (
            "injective point relabeling; candidate equations checked one by one "
            "against transitive undirected-distance equality closure"
        ),
        "target": {
            "rows": {str(key): list(value) for key, value in TARGET_ROWS.items()},
            "label_count": len(TARGET_LABELS),
            "equation_count": len(row_requirements(TARGET_ROWS)),
        },
        "smoke_gates": smoke_gates(),
        "sources": {
            "bank": bank_meta,
            "certificate_active_kernels": active_meta,
            "current_equality_templates": current_meta,
            "registered_general_n": registry_meta,
        },
        "audits": {
            "retained_555_654_full_cores": audit_group(bank),
            "certificate_active_unit_kernels": audit_group(active),
            "current_production_equality_cores": audit_group(current),
            "registered_pure_metric_contradictions": audit_group(
                registered, include_closest_partials=False
            ),
        },
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    if not args.quiet:
        print(rendered, end="")


if __name__ == "__main__":
    main()
