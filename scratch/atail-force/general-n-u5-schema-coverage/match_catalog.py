#!/usr/bin/env python3
"""Match normalized signed U5 row schemas in one whole-carrier row table."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any, Iterator


Atom = tuple[int, int]


def digest(value: object) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(raw).hexdigest()


def schema_atoms(record: dict[str, Any]) -> tuple[tuple[Atom, ...], tuple[Atom, ...]]:
    return (
        tuple(tuple(map(int, atom)) for atom in record["positive_memberships"]),
        tuple(tuple(map(int, atom)) for atom in record["negative_memberships"]),
    )


def embeddings(
    rows: dict[int, set[int]],
    k: int,
    positive: tuple[Atom, ...],
    negative: tuple[Atom, ...],
) -> Iterator[tuple[int, ...]]:
    """Yield injective role maps satisfying every signed membership atom."""
    n = len(rows)
    incident: dict[int, list[tuple[bool, Atom]]] = {role: [] for role in range(k)}
    for sign, atoms in ((True, positive), (False, negative)):
        for atom in atoms:
            incident[atom[0]].append((sign, atom))
            incident[atom[1]].append((sign, atom))
    order = sorted(range(k), key=lambda role: (-len(incident[role]), role))
    assignment: dict[int, int] = {}
    used: set[int] = set()

    def compatible(role: int, value: int) -> bool:
        assignment[role] = value
        try:
            for sign, (center, point) in incident[role]:
                if center not in assignment or point not in assignment:
                    continue
                actual = assignment[point] in rows[assignment[center]]
                if actual != sign:
                    return False
            return True
        finally:
            del assignment[role]

    def search(depth: int) -> Iterator[tuple[int, ...]]:
        if depth == k:
            yield tuple(assignment[role] for role in range(k))
            return
        role = order[depth]
        for value in range(n):
            if value in used or not compatible(role, value):
                continue
            assignment[role] = value
            used.add(value)
            yield from search(depth + 1)
            used.remove(value)
            del assignment[role]

    yield from search(0)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("catalog", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--all-embeddings", action="store_true")
    args = parser.parse_args()

    source = json.loads(args.source.read_text(encoding="utf-8"))
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    n = int(source["n"])
    rows = {int(center): set(map(int, support)) for center, support in source["rows"].items()}
    if set(rows) != set(range(n)):
        raise RuntimeError("source does not contain a total row table")
    for center, support in rows.items():
        if len(support) != 4 or center in support:
            raise RuntimeError(f"invalid selected row {center}: {sorted(support)}")

    results: list[dict[str, Any]] = []
    total_embeddings = 0
    for index, record in enumerate(catalog["schemas"]):
        k = int(record["role_count"])
        positive, negative = schema_atoms(record)
        found: list[tuple[int, ...]] = []
        for mapping in embeddings(rows, k, positive, negative):
            found.append(mapping)
            if not args.all_embeddings:
                break
        if found:
            total_embeddings += len(found)
            results.append(
                {
                    "schema_index": index,
                    "role_count": k,
                    "positive_memberships": [list(atom) for atom in positive],
                    "negative_memberships": [list(atom) for atom in negative],
                    "embedding_count_recorded": len(found),
                    "embeddings": [list(mapping) for mapping in found],
                    "consumers": [item["fq_name"] for item in record["consumers"]],
                }
            )

    output = {
        "schema": "p97-general-n-u5-signed-row-schema-match-v1",
        "epistemic_status": "EXACT_FINITE_ROW_INCIDENCE_REPLAY",
        "source": str(args.source),
        "source_digest": digest(source),
        "catalog": str(args.catalog),
        "catalog_digest": catalog["catalog_digest"],
        "n": n,
        "catalog_schema_count": len(catalog["schemas"]),
        "matched_schema_count": len(results),
        "embedding_mode": "all" if args.all_embeddings else "first_per_schema",
        "recorded_embedding_count": total_embeddings,
        "matches": results,
        "status": "BANK_MATCH" if results else "NO_BANK_MATCH",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(
        json.dumps(
            {
                "status": output["status"],
                "catalog_schemas": len(catalog["schemas"]),
                "matched_schemas": len(results),
                "recorded_embeddings": total_embeddings,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
