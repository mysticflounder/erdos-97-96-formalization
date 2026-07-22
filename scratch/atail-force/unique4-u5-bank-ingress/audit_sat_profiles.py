#!/usr/bin/env python3
"""Independently replay the 93 signed U5 schemas on exact-four SAT rows.

This checker does not import the catalog matcher or the exact-four encoder.
It validates the catalog digest and the selected-row tables, then performs an
independent injective backtracking search for every signed schema.  Positive
atoms mean selected-row membership; negative atoms mean selected-row
nonmembership exactly.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path
from typing import Any


def stable_digest(value: object) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(raw).hexdigest()


def file_digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_catalog(catalog: dict[str, Any]) -> None:
    payload = dict(catalog)
    claimed = payload.pop("catalog_digest", None)
    if stable_digest(payload) != claimed:
        raise RuntimeError("catalog digest mismatch")
    if catalog.get("class_consumer_count") != 96:
        raise RuntimeError("consumer count drifted")
    if catalog.get("normalized_schema_count") != 93:
        raise RuntimeError("schema count drifted")
    if catalog.get("translation_fail_closed") is not True:
        raise RuntimeError("catalog is not fail-closed")
    if catalog.get("all_point_roles_injective") is not True:
        raise RuntimeError("catalog does not require injective roles")


def selected_rows(result: dict[str, Any]) -> dict[int, frozenset[int]]:
    if result.get("solver_status") != "SAT" or result.get("cnf_model_checked") is not True:
        raise RuntimeError("profile is not a checked SAT result")
    n = int(result["n"])
    rows = {
        int(center): frozenset(map(int, support))
        for center, support in result["rows"].items()
    }
    if set(rows) != set(range(n)):
        raise RuntimeError("profile does not contain a total row table")
    for center, support in rows.items():
        if len(support) != 4 or center in support:
            raise RuntimeError(f"invalid selected row {center}: {sorted(support)}")
    return rows


def first_embedding(
    rows: dict[int, frozenset[int]], schema: dict[str, Any]
) -> tuple[int, ...] | None:
    """Find one injective signed-schema embedding by exact backtracking."""
    role_count = int(schema["role_count"])
    positive = [tuple(map(int, atom)) for atom in schema["positive_memberships"]]
    negative = [tuple(map(int, atom)) for atom in schema["negative_memberships"]]
    incident: dict[int, list[tuple[bool, tuple[int, int]]]] = {
        role: [] for role in range(role_count)
    }
    for sign, atoms in ((True, positive), (False, negative)):
        for atom in atoms:
            incident[atom[0]].append((sign, atom))
            incident[atom[1]].append((sign, atom))
    order = sorted(range(role_count), key=lambda role: (-len(incident[role]), role))
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

    def search(depth: int) -> tuple[int, ...] | None:
        if depth == role_count:
            return tuple(assignment[role] for role in range(role_count))
        role = order[depth]
        for value in sorted(rows):
            if value in used or not compatible(role, value):
                continue
            assignment[role] = value
            used.add(value)
            found = search(depth + 1)
            if found is not None:
                return found
            used.remove(value)
            del assignment[role]
        return None

    return search(0)


def raw_role_map(
    schema: dict[str, Any], consumer: dict[str, Any], embedding: tuple[int, ...]
) -> dict[str, int]:
    raw_atoms = consumer["raw_positive_memberships"] + consumer["raw_negative_memberships"]
    names = sorted({name for atom in raw_atoms for name in atom})
    raw_index = {name: index for index, name in enumerate(names)}
    raw_positive = {
        (raw_index[center], raw_index[point])
        for center, point in consumer["raw_positive_memberships"]
    }
    raw_negative = {
        (raw_index[center], raw_index[point])
        for center, point in consumer["raw_negative_memberships"]
    }
    target_positive = {tuple(map(int, atom)) for atom in schema["positive_memberships"]}
    target_negative = {tuple(map(int, atom)) for atom in schema["negative_memberships"]}
    for permutation in itertools.permutations(range(len(names))):
        if {
            (permutation[center], permutation[point])
            for center, point in raw_positive
        } != target_positive:
            continue
        if {
            (permutation[center], permutation[point])
            for center, point in raw_negative
        } != target_negative:
            continue
        return {
            name: embedding[permutation[raw_index[name]]]
            for name in names
        }
    raise RuntimeError(f"cannot decode raw roles for {consumer['fq_name']}")


def replay_profile(
    path: Path, replay_path: Path, catalog: dict[str, Any]
) -> dict[str, Any]:
    result = json.loads(path.read_text(encoding="utf-8"))
    replay = json.loads(replay_path.read_text(encoding="utf-8"))
    if replay.get("status") != "VERIFIED_SAT_PROJECTION":
        raise RuntimeError("profile has no verified semantic replay")
    if replay.get("source_result_sha256") != file_digest(path):
        raise RuntimeError("semantic replay is stale relative to the SAT profile")
    rows = selected_rows(result)

    matches: list[dict[str, Any]] = []
    for index, schema in enumerate(catalog["schemas"]):
        embedding = first_embedding(rows, schema)
        if embedding is None:
            continue
        consumers = []
        for consumer in schema["consumers"]:
            mapping = raw_role_map(schema, consumer, embedding)
            positive = [
                {
                    "raw_atom": [center, point],
                    "actual_atom": [mapping[center], mapping[point]],
                }
                for center, point in consumer["raw_positive_memberships"]
            ]
            negative = [
                {
                    "raw_atom": [center, point],
                    "actual_atom": [mapping[center], mapping[point]],
                }
                for center, point in consumer["raw_negative_memberships"]
            ]
            if not all(point in rows[center] for center, point in
                       (item["actual_atom"] for item in positive)):
                raise RuntimeError("raw positive replay failed")
            if not all(point not in rows[center] for center, point in
                       (item["actual_atom"] for item in negative)):
                raise RuntimeError("raw negative replay failed")
            consumers.append(
                {
                    "fq_name": consumer["fq_name"],
                    "source_path": consumer["source_path"],
                    "source_line": consumer["source_line"],
                    "raw_role_mapping": mapping,
                    "positive_replay": positive,
                    "negative_replay": negative,
                }
            )
        matches.append(
            {
                "schema_index": index,
                "normalized_embedding": list(embedding),
                "normalized_positive_memberships": schema["positive_memberships"],
                "normalized_negative_memberships": schema["negative_memberships"],
                "consumers": consumers,
            }
        )

    return {
        "result": str(path),
        "result_sha256": file_digest(path),
        "semantic_replay": str(replay_path),
        "semantic_replay_sha256": file_digest(replay_path),
        "n": result["n"],
        "opp1_card": result["opp1_card"],
        "catalog_schema_count": len(catalog["schemas"]),
        "matched_schema_count": len(matches),
        "status": "BANK_MATCH" if matches else "NO_BANK_MATCH",
        "matches": matches,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--profile", type=Path, action="append", required=True)
    parser.add_argument("--replay", type=Path, action="append", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if len(args.profile) != len(args.replay):
        parser.error("each --profile needs one corresponding --replay")
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    check_catalog(catalog)
    profiles = [
        replay_profile(profile, replay, catalog)
        for profile, replay in zip(args.profile, args.replay, strict=True)
    ]
    output = {
        "schema": "unique4-u5-current-sat-profile-audit-v1",
        "epistemic_status": "EXACT_SIGNED_INCIDENCE_REPLAY_ON_VERIFIED_SAT_PROJECTIONS",
        "claim_scope": (
            "The current fixed n=11 finite projections only; a BANK_MATCH gives an "
            "extension-stable theorem consumer for that row table, while NO_BANK_MATCH "
            "does not establish Euclidean realizability or live-branch satisfiability."
        ),
        "catalog": str(args.catalog),
        "catalog_digest": catalog["catalog_digest"],
        "profiles": profiles,
    }
    output["audit_digest"] = stable_digest(output)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "profiles": [
            {
                "opp1_card": profile["opp1_card"],
                "status": profile["status"],
                "matched_schema_count": profile["matched_schema_count"],
            }
            for profile in profiles
        ]
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
