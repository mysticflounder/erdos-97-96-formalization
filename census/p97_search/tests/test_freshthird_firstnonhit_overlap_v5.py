# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import itertools
import json
import subprocess
from dataclasses import replace
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_all_large_caps_v4 as v4
import census.p97_search.freshthird_firstnonhit_overlap_v5 as v5


def _json(data: bytes) -> dict[str, object]:
    return json.loads(data)


@pytest.fixture(scope="module")
def n17_bundle() -> v5.Bundle:
    return v5.emit_bundle(17)


def test_counts_schema_query_and_compact_delta(n17_bundle: v5.Bundle) -> None:
    manifest = _json(n17_bundle.manifest)
    assert manifest["schema"] == v5.MANIFEST_SCHEMA
    assert manifest["variables"] == 93_211
    assert manifest["clauses"] == 560_926
    assert manifest["cnf_sha256"] == (
        "d863b87e923c8df36c88ecd7d6fa3e5db820fd1f231526f9c7845353dac75ce9"
    )
    assert manifest["source_total"] is False
    assert manifest["launch_enabled"] is False
    assert manifest["query"] == v4.QUERY
    assert manifest["query_unchanged_from_predecessor"] is True
    assert manifest["family_clause_counts"]["same_blocker_definition"] == 4_624
    assert manifest["family_clause_counts"]["distinct_blocker_row_overlap"] == 92_480
    assert manifest["clause_delta"] == {
        "schema": f"{v5.SCHEMA}/delta/v1",
        "predecessor_schema": v4.SCHEMA,
        "predecessor_cnf_sha256": v5.PREDECESSOR_CNF_SHA256,
        "source_pair_count": 136,
        "same_blocker_variables": 136,
        "same_blocker_definition_clauses": 4_624,
        "triple_overlap_clauses": 92_480,
        "total_added_clauses": 97_104,
        "triple_count_per_source_pair": 680,
        "query_unchanged": True,
        "ordering": (
            "lexicographic source pair; equality-to-same centers; "
            "same-to-equality centers; lexicographic carrier triples"
        ),
    }


def test_v4_cnf_is_an_exact_clause_prefix(n17_bundle: v5.Bundle) -> None:
    current = n17_bundle.cnf.splitlines()
    predecessor = v4._dimacs(v4.encode(17)).splitlines()
    assert current[0] == b"p cnf 93211 560926"
    assert current[1 : 1 + v5.PREDECESSOR_CLAUSES] == predecessor[1:]
    assert hashlib.sha256(b"\n".join(predecessor) + b"\n").hexdigest() == (
        v5.PREDECESSOR_CNF_SHA256
    )


def test_same_blocker_auxiliaries_are_exact_on_one_hot_domains() -> None:
    for n in (2, 3, 4):
        for left, right, same in itertools.product(range(n), range(n), (False, True)):
            assert v5._same_definition_holds(left, right, same, n) == (
                same == (left == right)
            )


def test_triple_clauses_are_exact_overlap_at_most_two() -> None:
    for left in itertools.product((False, True), repeat=4):
        for right in itertools.product((False, True), repeat=4):
            for same in (False, True):
                assert v5._overlap_clauses_hold(left, right, same) == (
                    same or sum(a and b for a, b in zip(left, right, strict=True)) <= 2
                )


def test_delta_roles_and_literal_shapes_are_complete(n17_bundle: v5.Bundle) -> None:
    mapping = _json(n17_bundle.variable_map)
    variables = mapping["variables"][v5.PREDECESSOR_VARIABLES :]
    clauses = mapping["clauses"][v5.PREDECESSOR_CLAUSES :]
    assert [row["role"] for row in variables] == [
        f"same_blocker/{source}/{target}"
        for source, target in itertools.combinations(range(17), 2)
    ]
    same = [row for row in clauses if row["family"] == "same_blocker_definition"]
    overlap = [
        row for row in clauses if row["family"] == "distinct_blocker_row_overlap"
    ]
    assert len(same) == 136 * 34
    assert len(overlap) == 136 * 680
    assert all(len(row["literals"]) == 3 for row in same)
    assert all(len(row["literals"]) == 7 for row in overlap)
    assert len({row["role"] for row in clauses}) == len(clauses)


def test_provenance_resolves_every_variable_and_clause_once(
    n17_bundle: v5.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    provenance = mapping["provenance"]
    ranges = provenance["variable_source_ranges"]
    covered = []
    for row in ranges:
        covered.extend(range(row["first_id"], row["last_id"] + 1))
    assert covered == list(range(1, 93_212))
    family_sources = provenance["clause_family_sources"]
    assert set(family_sources) == {row["family"] for row in mapping["clauses"]}
    assert v5.OVERLAP_SOURCE_THEOREM in family_sources["distinct_blocker_row_overlap"]


def test_authenticated_v4_model_is_cut_at_known_pairs() -> None:
    root = Path(v5.__file__).resolve().parents[2]
    stdout = (root / v5.PREDECESSOR_MODEL_RELATIVE).read_bytes()
    control = v5.validate_predecessor_sat_model_control(stdout)
    assert control["predecessor_cnf_satisfied"] is True
    assert control["new_family_satisfied"] is False
    assert control["known_violating_pairs"] == [[7, 15], [8, 15]]
    rows = {tuple(row["source_pair"]): row for row in control["violations"]}
    assert set(rows) >= {(7, 15), (8, 15)}
    assert rows[7, 15]["blocker_values"] == [0, 2]
    assert rows[8, 15]["blocker_values"] == [0, 2]
    assert rows[7, 15]["source_row"] == [7, 8, 15, 16]
    assert rows[8, 15]["source_row"] == [7, 8, 15, 16]
    assert rows[7, 15]["target_row"] == [7, 8, 9, 15]
    assert rows[8, 15]["target_row"] == [7, 8, 9, 15]
    assert rows[7, 15]["overlap"] == [7, 8, 15]
    assert rows[8, 15]["overlap"] == [7, 8, 15]


def test_source_snapshot_is_commit_pinned(n17_bundle: v5.Bundle) -> None:
    snapshot = _json(n17_bundle.sources)
    assert snapshot["commit"] == v5.LEAN_COMMIT
    root = Path(v5.__file__).resolve().parents[2]
    for path, expected in v5.SOURCE_HASHES.items():
        committed = subprocess.run(
            ["git", "show", f"{v5.LEAN_COMMIT}:{path}"],
            cwd=root,
            check=True,
            capture_output=True,
        ).stdout
        assert hashlib.sha256(committed).hexdigest() == expected


@pytest.mark.parametrize("bad_n", [True, False, 16, 0, -1, 17.0, "17"])
def test_carrier_controls_fail_closed(bad_n: object) -> None:
    with pytest.raises(v5.EncodingError):
        v5.encode(bad_n)  # type: ignore[arg-type]


def test_malformed_bundle_is_rejected(n17_bundle: v5.Bundle) -> None:
    lines = n17_bundle.cnf.splitlines()
    lines[-1] = b"1 0"
    bad = replace(n17_bundle, cnf=b"\n".join(lines) + b"\n")
    with pytest.raises(v5.EncodingError):
        v5.validate_bundle(bad)
