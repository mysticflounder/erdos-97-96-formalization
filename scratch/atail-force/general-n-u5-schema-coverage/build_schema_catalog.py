#!/usr/bin/env python3
"""Translate the sibling general-n U5 class bank to signed row schemas.

The translation is deliberately syntactic and fail-closed.  It accepts only
the theorem-facing records used by the U5 class bank:

* ``U5DangerousTriple D q p T`` is realized by the selected row at ``p``
  containing ``q`` and the named members of ``T``;
* ``U5QCriticalTripleClass D q c B`` is realized by a selected row at ``c``
  containing ``q``;
* ``U5QDeletedK4Class D q c B`` is realized by a selected row at ``c``
  omitting ``q``;
* named membership in a class support becomes positive row incidence; and
* candidate-not-in-``T`` becomes negative incidence in the base row.

All point roles are required to be injectively instantiated.  Consequently
the explicitly named disequalities and the carrier/skeleton exclusions in the
source theorem are automatic.  The actual geometric application also needs
the selected rows to come from one strictly convex carrier; this script only
builds and audits the finite signed-incidence schemas.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any


CLASS_TYPES = ("U5QCriticalTripleClass", "U5QDeletedK4Class")


def stable_digest(value: object) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(raw).hexdigest()


def select_class_consumers(registry: dict[str, Any]) -> list[dict[str, Any]]:
    selected = [
        item
        for item in registry["candidate_declarations"]
        if item.get("family") == "U5GlobalIncidence"
        and item.get("category") == "ambient-data-uniform"
        and item.get("proof_status") == "source-proved"
        and item.get("local_shape_match") is False
        and str(item.get("statement", "")).endswith(": False")
    ]
    if len(selected) != 96:
        raise RuntimeError(f"registry U5 class surface drifted: expected 96, got {len(selected)}")
    if not all(item.get("source_reachable") is True for item in selected):
        bad = [item["fq_name"] for item in selected if item.get("source_reachable") is not True]
        raise RuntimeError(f"class consumer is not source-reachable: {bad}")
    return sorted(selected, key=lambda item: item["fq_name"])


def parenthesized_hypotheses(statement: str) -> list[tuple[str, str]]:
    """Return top-level ``(name : type)`` binders from a declaration header."""
    answer: list[tuple[str, str]] = []
    depth = 0
    start: int | None = None
    for index, char in enumerate(statement):
        if char == "(":
            if depth == 0:
                start = index + 1
            depth += 1
        elif char == ")":
            depth -= 1
            if depth < 0:
                raise ValueError("unbalanced theorem statement")
            if depth == 0 and start is not None:
                binder = statement[start:index]
                if " : " in binder:
                    name, value = binder.split(" : ", 1)
                    answer.append((name.strip(), value.strip()))
                start = None
    if depth != 0:
        raise ValueError("unbalanced theorem statement")
    return answer


def point_roles(statement: str) -> list[str]:
    roles: list[str] = []
    for names in re.findall(r"\{([^{}:]+) : ℝ²\}", statement):
        roles.extend(names.split())
    if not roles or len(roles) != len(set(roles)):
        raise ValueError(f"bad point-role declaration: {roles}")
    return roles


@dataclass(frozen=True)
class RawSchema:
    class_consumer: str
    module: str
    source_path: str
    source_line: int
    source_shape: str
    roles: tuple[str, ...]
    positive: tuple[tuple[str, str], ...]
    negative: tuple[tuple[str, str], ...]
    hypothesis_kinds: tuple[str, ...]


def parse_class_consumer(item: dict[str, Any]) -> RawSchema:
    statement = str(item["statement"])
    roles = point_roles(statement)
    role_set = set(roles)
    binders = parenthesized_hypotheses(statement)

    triple: tuple[str, str, str] | None = None
    classes: dict[str, tuple[str, str, str]] = {}
    positive: set[tuple[str, str]] = set()
    negative: set[tuple[str, str]] = set()
    kinds: list[str] = []

    for name, value in binders:
        match = re.fullmatch(r"U5DangerousTriple D (\S+) (\S+) (\S+)", value)
        if match:
            if triple is not None:
                raise ValueError(f"multiple dangerous triples in {item['fq_name']}")
            triple = match.groups()
            q, p, _support = triple
            positive.add((p, q))
            kinds.append("dangerous_triple")
            continue

        match = re.fullmatch(
            r"(U5QCriticalTripleClass|U5QDeletedK4Class) D (\S+) (\S+) (\S+)", value
        )
        if match:
            class_kind, q, center, support = match.groups()
            classes[support] = (class_kind, q, center)
            if class_kind == "U5QCriticalTripleClass":
                positive.add((center, q))
                kinds.append("qcritical_class")
            else:
                negative.add((center, q))
                kinds.append("qdeleted_class")
            continue

        match = re.fullmatch(r"U5SelectedCandidateSkeleton D (\S+) (\S+) (\S+) (\S+)", value)
        if match:
            _q, p, _support, candidate = match.groups()
            negative.add((p, candidate))
            kinds.append("selected_candidate")
            continue

        match = re.fullmatch(r"(\S+) ∈ \(D\.skeleton (\S+)\)\.erase (\S+)", value)
        if match:
            point, deleted, center = match.groups()
            if point not in role_set or deleted not in role_set or center not in role_set:
                raise ValueError(f"carrier membership uses an unknown role in {item['fq_name']}")
            kinds.append("carrier_membership")
            continue

        match = re.fullmatch(r"(\S+) ∈ (\S+)", value)
        if match:
            point, support = match.groups()
            if triple is not None and support == triple[2]:
                positive.add((triple[1], point))
                kinds.append("triple_membership")
            elif support in classes:
                positive.add((classes[support][2], point))
                kinds.append("class_membership")
            else:
                raise ValueError(
                    f"unrecognized membership hypothesis {name}: {value} in {item['fq_name']}"
                )
            continue

        match = re.fullmatch(r"(\S+) ∉ (\S+)", value)
        if match:
            point, support = match.groups()
            if triple is not None and support == triple[2]:
                negative.add((triple[1], point))
                kinds.append("triple_nonmembership")
            else:
                raise ValueError(
                    f"unrecognized nonmembership hypothesis {name}: {value} in {item['fq_name']}"
                )
            continue

        if re.fullmatch(r"\S+ ≠ \S+", value):
            kinds.append("disequality")
            continue

        raise ValueError(f"unrecognized hypothesis {name}: {value} in {item['fq_name']}")

    if triple is None and item["fq_name"].split(".")[-1] != "three_exact_classes_tetrahedron_incompatibility":
        raise ValueError(f"missing dangerous triple in {item['fq_name']}")
    atoms = positive | negative
    if any(center not in role_set or point not in role_set for center, point in atoms):
        raise ValueError(f"schema atom uses a non-point role in {item['fq_name']}")
    if positive & negative:
        raise ValueError(f"contradictory signed incidence in {item['fq_name']}")
    if any(center == point for center, point in positive):
        raise ValueError(f"positive self membership in {item['fq_name']}")
    counts: dict[str, int] = {}
    for center, _point in positive:
        counts[center] = counts.get(center, 0) + 1
    if any(count > 4 for count in counts.values()):
        raise ValueError(f"row needs more than four positive members in {item['fq_name']}")

    return RawSchema(
        class_consumer=item["fq_name"],
        module=item["module"],
        source_path=item["path"],
        source_line=int(item["line"]),
        source_shape=item["shape"],
        roles=tuple(roles),
        positive=tuple(sorted(positive)),
        negative=tuple(sorted(negative)),
        hypothesis_kinds=tuple(sorted(set(kinds))),
    )


def compact_raw_schema(raw: RawSchema) -> tuple[int, tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]]:
    active_names = sorted({name for atom in raw.positive + raw.negative for name in atom})
    # A role used only in a disequality can be forgotten: the eventual schema
    # embedding is injective on all retained roles, and the theorem's metric
    # proof does not need a row incidence at that role.  Every accepted source
    # theorem below retains all roles occurring in its translated antecedent.
    index = {name: i for i, name in enumerate(active_names)}
    positive = tuple(sorted((index[c], index[p]) for c, p in raw.positive))
    negative = tuple(sorted((index[c], index[p]) for c, p in raw.negative))
    return len(active_names), positive, negative


def permute_schema(
    k: int,
    positive: tuple[tuple[int, int], ...],
    negative: tuple[tuple[int, int], ...],
    permutation: tuple[int, ...],
) -> tuple[tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]]:
    if len(permutation) != k:
        raise ValueError("wrong permutation width")
    return (
        tuple(sorted((permutation[c], permutation[p]) for c, p in positive)),
        tuple(sorted((permutation[c], permutation[p]) for c, p in negative)),
    )


def canonical_schema(
    k: int,
    positive: tuple[tuple[int, int], ...],
    negative: tuple[tuple[int, int], ...],
) -> tuple[tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]]:
    return min(
        permute_schema(k, positive, negative, permutation)
        for permutation in itertools.permutations(range(k))
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("registry", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    registry = json.loads(args.registry.read_text(encoding="utf-8"))
    consumers = select_class_consumers(registry)
    raw_schemas = [parse_class_consumer(item) for item in consumers]

    normalized: dict[
        tuple[int, tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]],
        dict[str, Any],
    ] = {}
    for raw in raw_schemas:
        k, positive, negative = compact_raw_schema(raw)
        positive, negative = canonical_schema(k, positive, negative)
        key = (k, positive, negative)
        record = normalized.setdefault(
            key,
            {
                "role_count": k,
                "positive_memberships": [list(atom) for atom in positive],
                "negative_memberships": [list(atom) for atom in negative],
                "consumers": [],
            },
        )
        record["consumers"].append(
            {
                "fq_name": raw.class_consumer,
                "module": raw.module,
                "source_path": raw.source_path,
                "source_line": raw.source_line,
                "source_shape": raw.source_shape,
                "source_reachable": True,
                "proof_status": "source-proved",
                "point_roles": list(raw.roles),
                "raw_positive_memberships": [list(atom) for atom in raw.positive],
                "raw_negative_memberships": [list(atom) for atom in raw.negative],
                "hypothesis_kinds": list(raw.hypothesis_kinds),
            }
        )

    records = [normalized[key] for key in sorted(normalized)]
    output = {
        "schema": "p97-general-n-u5-signed-row-schema-catalog-v1",
        "epistemic_status": "SOURCE_STATEMENT_TRANSLATION_AUDITED_NOT_KERNEL_REBUILT",
        "registry": str(args.registry),
        "registry_digest": stable_digest(registry),
        "class_consumer_count": len(consumers),
        "all_class_consumers_source_reachable": True,
        "all_class_consumers_source_proved": True,
        "translation_fail_closed": True,
        "all_point_roles_injective": True,
        "normalized_schema_count": len(records),
        "schemas": records,
    }
    output["catalog_digest"] = stable_digest(output)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(
        json.dumps(
            {
                "class_consumers": len(consumers),
                "normalized_schemas": len(records),
                "catalog_digest": output["catalog_digest"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
