#!/usr/bin/env python3
"""Mine the live 555/654 infeasible cores for reusable general theorems.

This is a structural, certificate-independent pass.  For each banked row
system it computes the transitive closure of the row-induced distance
equalities, then searches for an assignment of the roles in each generic
``EdgeClosure`` core already proved in ``Census554``.  Roles may coincide
exactly when the Lean structure permits it; every listed inequality is
checked.  This matters for the already-known six-point chain, whose useful
specialization identifies two of the six abstract roles.

The pass also checks cyclic-order-sensitive Lean cores, independently replayed
certificate-active kernels, current-core embeddings, and the sibling U5 bank.
The source bank is evaluated from an in-memory byte snapshot so concurrent
appends cannot produce a mixed census.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass
from itertools import combinations_with_replacement
from pathlib import Path
from typing import Iterable


REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))
BANK_PATH = (
    REPO
    / "scratch/atail-force/unique-row-producer"
    / "card_five_interior_shadow_search.py"
)
N = 12

# These are the equality-only theorem sources imported by the arbitrary-
# cardinality bridge, plus the generic hinge cores which are not yet members
# of MetricCoreAlternative.
TEMPLATE_PATHS = tuple(
    REPO / "lean/Erdos9796Proof/P97/Census554" / name
    for name in (
        "EqualityCore.lean",
        "FivePointCollision.lean",
        "ThreeTriadCollision.lean",
        "SurplusSourceCollision.lean",
        "SixRowAnchorCollision.lean",
        "SixPointTwoPairCollision.lean",
        "SixPointCircleChainCollision.lean",
        "SixPointFiveCircleCollisions.lean",
        "SevenEightPointFiveCircleCollisions.lean",
        "SevenPointSixCircleCollision.lean",
        "SevenPointSixCircleCollisionB.lean",
        "SevenPointTwinFourCircleCollision.lean",
        "SevenPointOrbitCollision.lean",
        "SevenPointCircleNetworkCollision.lean",
        "EquilateralHingeCollisions.lean",
    )
)
BRIDGE_PATH = (
    REPO / "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean"
)
ACTIVE_KERNEL_DATA_PATH = (
    REPO
    / "scratch/atail-force/unique-row-producer"
    / "core_data_pattern_mining.json"
)
ACTIVE_KERNEL_HELPER_PATH = (
    REPO
    / "scratch/atail-force/unique-row-producer"
    / "mine_loop_active_kernels.py"
)
U5_INCIDENCE_AUDIT_PATH = (
    REPO
    / "scratch/atail-force/unique-row-producer"
    / "audit_u5_incidence_bank_against_saved_scans.py"
)
U5_METRIC_AUDIT_PATH = (
    REPO
    / "scratch/atail-force/unique-row-producer"
    / "audit_u5_metric_kernel_bank_against_saved_scans.py"
)
P97_RVOL_REGISTRY_PATH = REPO / "certificates/p97_rvol_general_n_mining.json"
ORDER_TEMPLATE_SPECS = (
    ("ConvexFivePointCore", "ConvexFivePointCore.lean"),
    ("ConvexRhombusCore", "ConvexRhombusCore.lean"),
    ("FiveRowCircleIntersectionOrderCore", "FiveRowCircleIntersectionOrderCore.lean"),
    ("FourPointTwoCircleBisectorOrderCore", "FourPointTwoCircleBisectorOrderCore.lean"),
    ("NestedEqualChordCore", "NestedEqualChordCore.lean"),
    ("SixPointCircleChainOrderCore", "SixPointCircleChainOrderCore.lean"),
    ("SixPointNestedCenterOrderCore", "SixPointNestedCenterOrderCore.lean"),
    ("SixPointTwoCircleArcOvertakeOrderCore", "SixPointTwoCircleArcOvertakeOrderCore.lean"),
    ("SixPointTwoCircleOrderCore", "SixPointTwoCircleOrderCore.lean"),
)


Edge = tuple[int, int]
RoleEdge = tuple[str, str]
Requirement = tuple[RoleEdge, RoleEdge]


class UnionFind:
    def __init__(self, values: Iterable[Edge]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: Edge) -> Edge:
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def edge(left: int, right: int) -> Edge:
    return (left, right) if left < right else (right, left)


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def load_module_snapshot(name: str, path: Path, source: bytes):
    """Evaluate exactly ``source`` while preserving the source file's __file__."""
    spec = importlib.util.spec_from_loader(name, loader=None, origin=str(path))
    if spec is None:
        raise RuntimeError(f"cannot create snapshot module for {path}")
    module = importlib.util.module_from_spec(spec)
    module.__file__ = str(path)
    sys.modules[name] = module
    exec(compile(source, str(path), "exec"), module.__dict__)
    return module


def equality_closure(rows: dict[int, frozenset[int]]) -> UnionFind:
    # EdgeClosure is reflexive even on loop edges.  Row generators themselves
    # are nonloops, but collapsed theorem roles can legitimately produce a
    # requirement whose two sides are the same loop.
    closure = UnionFind(combinations_with_replacement(range(N), 2))
    for center, support in rows.items():
        center_edges = [edge(center, point) for point in sorted(support)]
        for other in center_edges[1:]:
            closure.union(center_edges[0], other)
    return closure


@dataclass(frozen=True)
class Template:
    name: str
    theorem: str
    source: str
    roles: tuple[str, ...]
    inequalities: tuple[tuple[str, str], ...]
    requirements: tuple[Requirement, ...]
    in_general_carrier_bridge: bool


ROLE_RE = re.compile(r"^\s{2}(\w+)\s*:\s*(?:alpha|α)\s*$")
NE_RE = re.compile(r"^\s{2}\w+\s*:\s*(\w+)\s*≠\s*(\w+)\s*$")
EDGE_RE = re.compile(
    r"^\s{2}\w+\s*:\s*EdgeClosure\s+[PR]\s+"
    r"\((\w+),\s*(\w+)\)\s+\((\w+),\s*(\w+)\)\s*$"
)
STRUCTURE_RE = re.compile(r"^structure\s+(\w+).*\bwhere\s*$")
THEOREM_RE = re.compile(r"^theorem\s+(\w+)(.*?)(?=\s*:=)", re.M | re.S)


def structure_blocks(text: str):
    lines = text.splitlines()
    index = 0
    while index < len(lines):
        match = STRUCTURE_RE.match(lines[index])
        if match is None:
            index += 1
            continue
        body: list[str] = []
        cursor = index + 1
        while cursor < len(lines):
            line = lines[cursor]
            if line and not line[0].isspace():
                break
            body.append(line)
            cursor += 1
        yield match.group(1), body
        index = cursor


def consumer_for(text: str, core_name: str) -> str | None:
    candidates = []
    for match in THEOREM_RE.finditer(text):
        theorem, signature = match.groups()
        if core_name not in signature:
            continue
        if theorem.startswith(("not_realizes_of_", "false_of_")):
            candidates.append(theorem)
    return candidates[0] if candidates else None


def parse_templates() -> tuple[Template, ...]:
    bridge_text = BRIDGE_PATH.read_text()
    by_name: dict[str, Template] = {}
    for path in TEMPLATE_PATHS:
        text = path.read_text()
        for name, body in structure_blocks(text):
            roles: list[str] = []
            inequalities: list[tuple[str, str]] = []
            requirements: list[Requirement] = []
            unparsed: list[str] = []
            for line in body:
                if not line.strip() or line.lstrip().startswith("--"):
                    continue
                if match := ROLE_RE.match(line):
                    roles.append(match.group(1))
                elif match := NE_RE.match(line):
                    inequalities.append((match.group(1), match.group(2)))
                elif match := EDGE_RE.match(line):
                    a, b, c, d = match.groups()
                    requirements.append(((a, b), (c, d)))
                else:
                    unparsed.append(line)
            # Exclude exactness, order, color, and auxiliary structures.  A
            # pure template consists only of labels, inequalities, and
            # equality-closure fields and has a public contradiction consumer.
            theorem = consumer_for(text, name)
            if unparsed or not roles or not requirements or theorem is None:
                continue
            template = Template(
                name=name,
                theorem="Problem97.Census554.EqualityCore." + theorem,
                source=str(path.relative_to(REPO)),
                roles=tuple(roles),
                inequalities=tuple(inequalities),
                requirements=tuple(requirements),
                in_general_carrier_bridge=name in bridge_text,
            )
            previous = by_name.get(name)
            if previous is not None and previous != template:
                raise ValueError(f"conflicting definitions for {name}")
            by_name[name] = template
    return tuple(sorted(by_name.values(), key=lambda template: template.name))


def role_order(template: Template) -> tuple[str, ...]:
    """Choose a static CSP order that completes equality tests early."""
    constraints = [set(left + right) for left, right in template.requirements]
    constraints += [set(pair) for pair in template.inequalities]
    incidence = Counter(role for group in constraints for role in group)
    chosen: list[str] = []
    remaining = set(template.roles)
    while remaining:
        def score(role: str):
            completed = sum((group - {role}) <= set(chosen) for group in constraints)
            overlap = sum(len((group - {role}) & set(chosen)) for group in constraints)
            return (completed, overlap, incidence[role], role)

        selected = max(remaining, key=score)
        chosen.append(selected)
        remaining.remove(selected)
    return tuple(chosen)


@dataclass(frozen=True)
class OrderTemplate:
    namespace: str
    theorem: str
    source: str
    roles: tuple[str, ...]
    inequalities: tuple[tuple[str, str], ...]
    requirements: tuple[Requirement, ...]
    negative_triples: tuple[tuple[str, str, str], ...]
    in_general_carrier_bridge: bool


NEGATIVE_TRIPLE_RE = re.compile(
    r"signedArea2\s+\(pointOf core\.(\w+)\)\s+"
    r"\(pointOf core\.(\w+)\)\s+\(pointOf core\.(\w+)\)\s*<\s*0"
)


def parse_order_templates() -> tuple[OrderTemplate, ...]:
    root = REPO / "lean/Erdos9796Proof/P97/Census554"
    bridge_text = BRIDGE_PATH.read_text()
    result = []
    for namespace, filename in ORDER_TEMPLATE_SPECS:
        path = root / filename
        text = path.read_text()
        body = next(body for name, body in structure_blocks(text) if name == "Core")
        roles: list[str] = []
        inequalities: list[tuple[str, str]] = []
        requirements: list[Requirement] = []
        unparsed = []
        for line in body:
            if not line.strip() or line.lstrip().startswith("--"):
                continue
            if match := ROLE_RE.match(line):
                roles.append(match.group(1))
            elif match := NE_RE.match(line):
                inequalities.append((match.group(1), match.group(2)))
            elif match := EDGE_RE.match(line):
                a, b, c, d = match.groups()
                requirements.append(((a, b), (c, d)))
            else:
                unparsed.append(line)
        if unparsed:
            raise ValueError(f"unparsed {namespace}.Core fields: {unparsed}")
        theorem_match = next(
            match for match in THEOREM_RE.finditer(text)
            if match.group(1) == "false_of_core_of_neg"
        )
        negative_triples = tuple(NEGATIVE_TRIPLE_RE.findall(theorem_match.group(2)))
        if not negative_triples:
            raise ValueError(f"no negative orientation triples in {filename}")
        result.append(OrderTemplate(
            namespace=namespace,
            theorem=f"Problem97.Census554.{namespace}.false_of_core_of_neg",
            source=str(path.relative_to(REPO)),
            roles=tuple(roles),
            inequalities=tuple(inequalities),
            requirements=tuple(requirements),
            negative_triples=negative_triples,
            in_general_carrier_bridge=f"{namespace}.Core" in bridge_text,
        ))
    return tuple(result)


def cyclic_negative(order: tuple[int, ...], a: int, b: int, c: int) -> bool:
    if len({a, b, c}) != 3:
        return False
    position = {label: index for index, label in enumerate(order)}
    i, j, k = position[a], position[b], position[c]
    return (i < j < k) or (j < k < i) or (k < i < j)


def find_order_witness(
    template: OrderTemplate, closure: UnionFind, cyclic_order: tuple[int, ...]
) -> dict[str, int] | None:
    base = Template(
        name=template.namespace + ".Core",
        theorem=template.theorem,
        source=template.source,
        roles=template.roles,
        inequalities=template.inequalities,
        requirements=template.requirements,
        in_general_carrier_bridge=template.in_general_carrier_bridge,
    )
    constraints = [set(left + right) for left, right in template.requirements]
    constraints += [set(pair) for pair in template.inequalities]
    constraints += [set(triple) for triple in template.negative_triples]
    incidence = Counter(role for group in constraints for role in group)
    chosen: list[str] = []
    remaining = set(template.roles)
    while remaining:
        def score(role: str):
            completed = sum((group - {role}) <= set(chosen) for group in constraints)
            overlap = sum(len((group - {role}) & set(chosen)) for group in constraints)
            return (completed, overlap, incidence[role], role)
        selected = max(remaining, key=score)
        chosen.append(selected)
        remaining.remove(selected)
    assignment: dict[str, int] = {}

    def consistent() -> bool:
        for left, right in base.inequalities:
            if left in assignment and right in assignment:
                if assignment[left] == assignment[right]:
                    return False
        for left, right in base.requirements:
            if set(left + right) <= assignment.keys():
                if mapped_root(closure, assignment, left) != mapped_root(
                    closure, assignment, right
                ):
                    return False
        for a, b, c in template.negative_triples:
            if {a, b, c} <= assignment.keys():
                if not cyclic_negative(
                    cyclic_order, assignment[a], assignment[b], assignment[c]
                ):
                    return False
        return True

    def search(depth: int) -> bool:
        if depth == len(chosen):
            return True
        role = chosen[depth]
        for label in cyclic_order:
            assignment[role] = label
            if consistent() and search(depth + 1):
                return True
            del assignment[role]
        return False

    if not search(0):
        return None
    return {role: assignment[role] for role in template.roles}


def mapped_root(
    closure: UnionFind, assignment: dict[str, int], role_edge: RoleEdge
) -> Edge:
    return closure.find(edge(assignment[role_edge[0]], assignment[role_edge[1]]))


def find_witness(template: Template, closure: UnionFind) -> dict[str, int] | None:
    order = role_order(template)
    assignment: dict[str, int] = {}

    def consistent() -> bool:
        for left, right in template.inequalities:
            if left in assignment and right in assignment:
                if assignment[left] == assignment[right]:
                    return False
        for left, right in template.requirements:
            needed = set(left + right)
            if needed <= assignment.keys():
                if mapped_root(closure, assignment, left) != mapped_root(
                    closure, assignment, right
                ):
                    return False
        return True

    def search(depth: int) -> bool:
        if depth == len(order):
            return True
        role = order[depth]
        for label in range(N):
            assignment[role] = label
            if consistent() and search(depth + 1):
                return True
            del assignment[role]
        return False

    if not search(0):
        return None
    return {role: assignment[role] for role in template.roles}


def family_of(core_id: str) -> str:
    return re.sub(r"-\d+$", "", core_id)


def mine_certificate_active_kernel_reuse(cores: list[dict]) -> dict:
    """Embed independently replayed old unit kernels in the live loop bank."""
    payload = json.loads(ACTIVE_KERNEL_DATA_PATH.read_text())
    analysis = payload["certificate_active_kernel_analysis"]
    kernels = analysis["kernels"]
    helper = load_module("loop_active_kernel_embedding_helper", ACTIVE_KERNEL_HELPER_PATH)
    hits: list[dict] = []
    for kernel in kernels:
        pattern_rows = {
            int(row["center"]): tuple(map(int, row["support"]))
            for row in kernel["rows"]
        }
        for core in cores:
            if helper.embedding_exists(pattern_rows, core["rows"]):
                hits.append({
                    "kernel": kernel["name"],
                    "live_core_id": core["id"],
                    "live_family": family_of(core["id"]),
                })

    by_kernel = []
    for kernel in kernels:
        kernel_hits = [row for row in hits if row["kernel"] == kernel["name"]]
        if not kernel_hits:
            continue
        stats = kernel.get("certificate_statistics", {})
        by_kernel.append({
            "kernel": kernel["name"],
            "row_count": kernel["row_count"],
            "equality_count": kernel["equality_count"],
            "label_count": kernel["label_count"],
            "verification_file": stats.get("verification_file"),
            "core_count": len(kernel_hits),
            "family_counts": dict(sorted(Counter(
                row["live_family"] for row in kernel_hits
            ).items())),
            "live_core_ids": [row["live_core_id"] for row in kernel_hits],
            "rows": kernel["rows"],
        })
    by_kernel.sort(key=lambda row: (-row["core_count"], row["kernel"]))
    covered = {row["live_core_id"] for row in hits}
    return {
        "evidence_scope": (
            "Injective row-support embeddings of the 49 independently replayed "
            "certificate-active unit kernels into the current live cores. The "
            "old rational identities are certificate-backed but their generic "
            "arbitrary-label wrappers are not thereby kernel-checked Lean theorems."
        ),
        "source_path": str(ACTIVE_KERNEL_DATA_PATH.relative_to(REPO)),
        "source_sha256": hashlib.sha256(ACTIVE_KERNEL_DATA_PATH.read_bytes()).hexdigest(),
        "kernel_count": len(kernels),
        "embedding_count": len(hits),
        "reused_kernel_count": len(by_kernel),
        "covered_live_core_count": len(covered),
        "covered_live_family_counts": dict(sorted(Counter(
            family_of(core_id) for core_id in covered
        ).items())),
        "kernels": by_kernel,
        "hits": hits,
    }


def mine_sibling_u5_bank(cores: list[dict]) -> dict:
    """Run the existing fail-closed sibling-U5 matchers on retained cores."""
    incidence = load_module(
        "audit_u5_incidence_bank_against_saved_scans", U5_INCIDENCE_AUDIT_PATH
    )
    metric = load_module(
        "audit_u5_metric_kernel_bank_against_saved_scans", U5_METRIC_AUDIT_PATH
    )
    incidence_patterns, incidence_unsupported = incidence.load_patterns(
        P97_RVOL_REGISTRY_PATH
    )
    metric_patterns, metric_unsupported = metric.load_metric_patterns(
        P97_RVOL_REGISTRY_PATH
    )
    eligible = [
        core for core in cores
        if 1 in core["rows"] and len(core["rows"][1]) == 5
    ]
    hits: list[dict] = []
    for core in eligible:
        pinned = frozenset(map(int, core["rows"][1]))
        rows_by_center = {
            int(center): (
                incidence.Row(
                    "pinned:first-apex-card-five" if center == 1
                    else f"retained-core:{core['id']}:{center}",
                    int(center),
                    frozenset(map(int, support)),
                ),
            )
            for center, support in core["rows"].items()
        }
        for pattern in incidence_patterns:
            witness = incidence.match_pattern(pattern, pinned, rows_by_center)
            if witness is not None:
                hits.append({
                    "kind": "incidence",
                    "core_id": core["id"],
                    "family": family_of(core["id"]),
                    "theorem": pattern.fq_name,
                    "source_path": pattern.source_path,
                    "line": pattern.line,
                    "witness": witness,
                })
        for pattern in metric_patterns:
            witness = metric.match_pattern(pattern, pinned, rows_by_center)
            if witness is not None:
                hits.append({
                    "kind": "metric",
                    "core_id": core["id"],
                    "family": family_of(core["id"]),
                    "theorem": pattern.fq_name,
                    "source_path": pattern.source_path,
                    "line": pattern.line,
                    "witness": witness,
                })
    return {
        "evidence_scope": (
            "Fail-closed matching of source-proved sibling p97-rvol U5 "
            "class-incidence and metric kernels against retained cores which "
            "still contain their exact pinned card-five row. Cores whose "
            "minimization deleted that row are not audited here."
        ),
        "registry_path": str(P97_RVOL_REGISTRY_PATH.relative_to(REPO)),
        "registry_sha256": hashlib.sha256(P97_RVOL_REGISTRY_PATH.read_bytes()).hexdigest(),
        "eligible_core_count": len(eligible),
        "incidence_pattern_count": len(incidence_patterns),
        "metric_pattern_count": len(metric_patterns),
        "unsupported_incidence_pattern_count": len(incidence_unsupported),
        "unsupported_metric_pattern_count": len(metric_unsupported),
        "hit_count": len(hits),
        "matched_core_count": len({row["core_id"] for row in hits}),
        "matched_theorem_count": len({row["theorem"] for row in hits}),
        "hits": hits,
    }


def nontrivial_embedding_classes(
    names: list[str], mutual_edges: set[tuple[str, str]]
) -> list[list[str]]:
    parent = {name: name for name in names}

    def find(name: str) -> str:
        if parent[name] != name:
            parent[name] = find(parent[name])
        return parent[name]

    def union(left: str, right: str) -> None:
        left_root, right_root = find(left), find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    for left, right in mutual_edges:
        union(left, right)
    groups: dict[str, list[str]] = defaultdict(list)
    for name in names:
        groups[find(name)].append(name)
    return sorted(
        (sorted(group) for group in groups.values() if len(group) > 1),
        key=lambda group: group[0],
    )


def mine_current_unit_core_reuse(cores: list[dict]) -> dict:
    """Find relabel/subcore reuse of every current pure-unit full core."""
    helper = load_module(
        "loop_active_kernel_embedding_helper_for_current_units",
        ACTIVE_KERNEL_HELPER_PATH,
    )
    unit_cores = [core for core in cores if core["id"].startswith("unit-core-")]
    hits: set[tuple[str, str]] = set()
    for pattern in unit_cores:
        for candidate in cores:
            if pattern["id"] == candidate["id"]:
                continue
            if helper.embedding_exists(pattern["rows"], candidate["rows"]):
                hits.add((pattern["id"], candidate["id"]))

    unit_names = {core["id"] for core in unit_cores}
    mutual = {
        edge for edge in hits
        if edge[1] in unit_names and (edge[1], edge[0]) in hits
    }
    strict = {
        edge for edge in hits
        if edge[1] not in unit_names or (edge[1], edge[0]) not in hits
    }
    ranked = []
    for pattern in unit_cores:
        targets = sorted(right for left, right in hits if left == pattern["id"])
        if not targets:
            continue
        ranked.append({
            "kernel": pattern["id"],
            "row_count": len(pattern["rows"]),
            "equality_count": int(pattern["equality_count"]),
            "target_count": len(targets),
            "target_family_counts": dict(sorted(Counter(
                family_of(target) for target in targets
            ).items())),
            "target_core_ids": targets,
        })
    ranked.sort(key=lambda row: (-row["target_count"], row["kernel"]))
    strict_target_ids = {right for _left, right in strict}
    return {
        "evidence_scope": (
            "Injective row-support embeddings of current CROSSCHECKED_UNIT full "
            "cores. Mutual edges are relabel-equivalence; strict edges show a "
            "pure unit core contained in another retained core. This is exact-CAS "
            "theorem-discovery evidence, not a generic Lean wrapper."
        ),
        "unit_core_count": len(unit_cores),
        "embedding_count": len(hits),
        "mutual_embedding_count": len(mutual),
        "strict_embedding_count": len(strict),
        "strictly_covered_target_count": len(strict_target_ids),
        "strictly_covered_target_family_counts": dict(sorted(Counter(
            family_of(core_id) for core_id in strict_target_ids
        ).items())),
        "nontrivial_relabel_classes": nontrivial_embedding_classes(
            sorted(unit_names), mutual
        ),
        "ranked_kernels": ranked,
        "strict_edges": [
            {"kernel": left, "target": right}
            for left, right in sorted(strict)
        ],
    }


def mine_order_core_matches(cores: list[dict], bank_module) -> dict:
    """Match order-sensitive generic cores using the profile hull orders."""
    templates = parse_order_templates()
    orders = {
        "555": tuple(bank_module.shadow.hull_order(
            bank_module.mc.build_frame((5, 5, 5))
        )),
        "654": tuple(bank_module.shadow.hull_order(
            bank_module.mc.build_frame((6, 5, 4))
        )),
    }
    matches = []
    for core in cores:
        profile = "555" if "-555-" in core["id"] else "654"
        closure = equality_closure(core["rows"])
        for template in templates:
            witness = find_order_witness(template, closure, orders[profile])
            if witness is None:
                continue
            matches.append({
                "core_id": core["id"],
                "family": family_of(core["id"]),
                "profile": profile,
                "template": template.namespace + ".Core",
                "theorem": template.theorem,
                "source": template.source,
                "in_general_carrier_bridge": template.in_general_carrier_bridge,
                "witness": witness,
            })
    by_template = []
    for template in templates:
        name = template.namespace + ".Core"
        hits = [row for row in matches if row["template"] == name]
        by_template.append({
            "template": name,
            "theorem": template.theorem,
            "source": template.source,
            "roles": len(template.roles),
            "edge_closure_requirements": len(template.requirements),
            "negative_orientation_requirements": len(template.negative_triples),
            "in_general_carrier_bridge": template.in_general_carrier_bridge,
            "core_count": len(hits),
            "family_counts": dict(sorted(Counter(
                row["family"] for row in hits
            ).items())),
            "example_core_ids": [row["core_id"] for row in hits[:12]],
        })
    covered = {row["core_id"] for row in matches}
    return {
        "evidence_scope": (
            "Exact equality-closure matching plus the fixed convex cyclic "
            "label order of each 555/654 profile. Negative signed-area "
            "hypotheses are discharged combinatorially by cyclic order; MEC "
            "cores needing additional disk/nonobtuse data are excluded."
        ),
        "cyclic_orders": {key: list(value) for key, value in orders.items()},
        "template_count": len(templates),
        "match_count": len(matches),
        "covered_core_count": len(covered),
        "covered_family_counts": dict(sorted(Counter(
            family_of(core_id) for core_id in covered
        ).items())),
        "templates": by_template,
        "matches": matches,
    }


def validate_matcher(templates: tuple[Template, ...]) -> None:
    """Every parsed schema must match a closure built from its own fields."""
    for template in templates:
        if len(template.roles) > N:
            raise AssertionError(f"too many roles in {template.name}")
        assignment = {
            role: label for label, role in enumerate(template.roles)
        }
        closure = UnionFind(combinations_with_replacement(range(N), 2))
        for left, right in template.requirements:
            closure.union(
                edge(assignment[left[0]], assignment[left[1]]),
                edge(assignment[right[0]], assignment[right[1]]),
            )
        if find_witness(template, closure) is None:
            raise AssertionError(f"synthetic matcher failure for {template.name}")


def mine() -> dict:
    bank_source = BANK_PATH.read_bytes()
    bank_sha256 = hashlib.sha256(bank_source).hexdigest()
    bank = load_module_snapshot("live_555_654_bank", BANK_PATH, bank_source)
    cores = bank.REAL_INFEASIBLE_ROW_CORES
    templates = parse_templates()
    validate_matcher(templates)
    active_kernel_reuse = mine_certificate_active_kernel_reuse(cores)
    sibling_u5_bank = mine_sibling_u5_bank(cores)
    current_unit_core_reuse = mine_current_unit_core_reuse(cores)
    order_core_matches = mine_order_core_matches(cores, bank)
    matches = []
    for core in cores:
        closure = equality_closure(core["rows"])
        for template in templates:
            witness = find_witness(template, closure)
            if witness is None:
                continue
            matches.append({
                "core_id": core["id"],
                "family": family_of(core["id"]),
                "template": template.name,
                "theorem": template.theorem,
                "source": template.source,
                "in_general_carrier_bridge": template.in_general_carrier_bridge,
                "witness": witness,
            })

    by_template: dict[str, dict] = {}
    for template in templates:
        hits = [row for row in matches if row["template"] == template.name]
        by_template[template.name] = {
            "theorem": template.theorem,
            "source": template.source,
            "roles": len(template.roles),
            "edge_closure_requirements": len(template.requirements),
            "in_general_carrier_bridge": template.in_general_carrier_bridge,
            "core_count": len(hits),
            "family_counts": dict(sorted(Counter(
                row["family"] for row in hits
            ).items())),
            "example_core_ids": [row["core_id"] for row in hits[:8]],
        }

    matched_core_ids = {row["core_id"] for row in matches}
    family_sizes = Counter(family_of(core["id"]) for core in cores)
    family_matched = Counter(
        family_of(core_id) for core_id in matched_core_ids
    )
    chain_hits = {
        row["core_id"] for row in matches
        if row["template"] == "SixPointCircleChainCollisionCore"
    }
    prior_claimed_chain_ids = {"unit-core-654-16", "unit-core-654-18"}
    live_sha256_at_completion = hashlib.sha256(BANK_PATH.read_bytes()).hexdigest()
    result = {
        "schema": "p97-555-654-existing-equality-core-mining-v1",
        "evidence_scope": (
            "Structural equality-closure matching only. Bank infeasibility "
            "certificates are not replayed; order/exactness hypotheses are "
            "not mined; role coincidences are allowed exactly where the Lean "
            "core structure does not require an inequality."
        ),
        "bank": {
            "path": str(BANK_PATH.relative_to(REPO)),
            "sha256": bank_sha256,
            "live_sha256_at_completion": live_sha256_at_completion,
            "snapshot_was_live_at_completion": (
                bank_sha256 == live_sha256_at_completion
            ),
            "core_count": len(cores),
            "family_counts": dict(sorted(family_sizes.items())),
        },
        "template_count": len(templates),
        "audit_checks": {
            "synthetic_template_matcher": "PASS",
            "prior_report_claimed_chain_core_ids": sorted(prior_claimed_chain_ids),
            "prior_report_claimed_chain_matches_found": sorted(
                prior_claimed_chain_ids & chain_hits
            ),
            "prior_report_claim_reproduced": prior_claimed_chain_ids <= chain_hits,
        },
        "templates": by_template,
        "certificate_active_kernel_reuse": active_kernel_reuse,
        "sibling_u5_bank": sibling_u5_bank,
        "current_unit_core_reuse": current_unit_core_reuse,
        "order_core_matches": order_core_matches,
        "coverage": {
            "matched_core_count": len(matched_core_ids),
            "unmatched_core_count": len(cores) - len(matched_core_ids),
            "family_matched_core_counts": dict(sorted(family_matched.items())),
        },
        "matches": matches,
    }

    return result


def summary(result: dict) -> dict:
    return {
        key: result[key]
        for key in (
            "schema", "evidence_scope", "bank", "template_count",
            "audit_checks", "coverage",
        )
    } | {
        "nonzero_templates": {
            name: data
            for name, data in result["templates"].items()
            if data["core_count"]
        },
        "zero_templates": [
            name for name, data in result["templates"].items()
            if not data["core_count"]
        ],
        "certificate_active_kernel_reuse": {
            key: result["certificate_active_kernel_reuse"][key]
            for key in (
                "evidence_scope", "source_path", "source_sha256",
                "kernel_count", "embedding_count", "reused_kernel_count",
                "covered_live_core_count", "covered_live_family_counts",
                "kernels",
            )
        },
        "sibling_u5_bank": result["sibling_u5_bank"],
        "current_unit_core_reuse": {
            key: result["current_unit_core_reuse"][key]
            for key in (
                "evidence_scope", "unit_core_count", "embedding_count",
                "mutual_embedding_count", "strict_embedding_count",
                "strictly_covered_target_count",
                "strictly_covered_target_family_counts",
                "nontrivial_relabel_classes", "ranked_kernels", "strict_edges",
            )
        },
        "order_core_matches": {
            key: result["order_core_matches"][key]
            for key in (
                "evidence_scope", "cyclic_orders", "template_count",
                "match_count", "covered_core_count", "covered_family_counts",
                "templates", "matches",
            )
        },
    }


def brief(result: dict) -> dict:
    order = result["order_core_matches"]
    return {
        "schema": result["schema"],
        "bank": result["bank"],
        "equality_only": result["coverage"],
        "certificate_active_kernel_reuse": {
            key: result["certificate_active_kernel_reuse"][key]
            for key in (
                "kernel_count", "embedding_count", "reused_kernel_count",
                "covered_live_core_count", "covered_live_family_counts",
            )
        } | {
            "reused_kernel_names": [
                row["kernel"]
                for row in result["certificate_active_kernel_reuse"]["kernels"]
            ],
            "covered_live_core_ids": sorted({
                row["live_core_id"]
                for row in result["certificate_active_kernel_reuse"]["hits"]
            }),
        },
        "sibling_u5_bank": {
            key: result["sibling_u5_bank"][key]
            for key in (
                "eligible_core_count", "incidence_pattern_count",
                "metric_pattern_count", "unsupported_incidence_pattern_count",
                "unsupported_metric_pattern_count", "hit_count",
            )
        },
        "current_unit_core_reuse": {
            key: result["current_unit_core_reuse"][key]
            for key in (
                "unit_core_count", "embedding_count", "mutual_embedding_count",
                "strict_embedding_count", "strictly_covered_target_count",
            )
        },
        "order_core_matches": {
            "match_count": order["match_count"],
            "covered_core_count": order["covered_core_count"],
            "covered_family_counts": order["covered_family_counts"],
            "templates": [
                row for row in order["templates"] if row["core_count"]
            ],
            "covered_core_ids": sorted({
                row["core_id"] for row in order["matches"]
            }),
        },
        "audit_checks": result["audit_checks"],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--full", action="store_true",
        help="include every core/template witness instead of the compact summary",
    )
    parser.add_argument(
        "--core", help="show all matches for one exact bank core id",
    )
    parser.add_argument(
        "--brief", action="store_true",
        help="print only census counts, nonzero order templates, and covered ids",
    )
    args = parser.parse_args()
    result = mine()
    if args.core:
        payload = {
            "bank": result["bank"],
            "core_id": args.core,
            "equality_matches": [
                row for row in result["matches"] if row["core_id"] == args.core
            ],
            "order_matches": [
                row for row in result["order_core_matches"]["matches"]
                if row["core_id"] == args.core
            ],
        }
    elif args.brief:
        payload = brief(result)
    else:
        payload = result if args.full else summary(result)
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
