# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Authenticated v5 overlap refinement of the finite FirstNonHit CNF.

The v4 CNF is retained byte-for-byte.  For every unordered pair of indexed
sources this module adds a ``sameBlocker`` auxiliary that is exactly equivalent
to equality of their one-hot blocker values.  If that auxiliary is false, the
source-clean finite overlap terminal forbids every three-point common subset of
the two exact indexed rows.

This is an emitter only.  It does not launch a solver, claim source-totality, or
promote a fixed-cardinality result to the universal Lean theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Sequence
from itertools import combinations, product
from pathlib import Path

import census.p97_search.freshthird_firstnonhit_all_large_caps_v4 as v4
import census.p97_search.freshthird_firstnonhit_complete_finite_v2 as v2

SCHEMA = "p97-freshthird-firstnonhit-overlap-v5/cnf/v1"
MAP_SCHEMA = f"{SCHEMA}/map/v1"
SOURCE_SCHEMA = f"{SCHEMA}/sources/v1"
MANIFEST_SCHEMA = f"{SCHEMA}/manifest/v1"
PROVENANCE_SCHEMA = f"{SCHEMA}/provenance/v1"
MIN_CARRIER_CARD = v4.MIN_CARRIER_CARD

# This is the commit that introduced the exact Lean ingress below.  Every
# source byte named by SOURCE_HASHES is checked against this commit in tests.
LEAN_COMMIT = "989edc9c7d03eea819b8bb3d40e3bcfc05fcee82"
SOURCE_TOTAL_CLAIM = False
PRODUCTION_LAUNCH_ENABLED = False
QUERY = v4.QUERY

BASE = v4.BASE
OVERLAP_SOURCE_FILE = f"{BASE}FirstNonHitFiniteOverlapTerminal.lean"
OVERLAP_SOURCE_THEOREM = (
    "FirstNonHitSourceTotalFiniteAssignment.false_of_row_overlap_card_ge_three"
)
SOURCE_HASHES = {
    **v4.SOURCE_HASHES,
    OVERLAP_SOURCE_FILE: (
        "d5a562c33a49e92561f314bb477b1bbe11a489cac29ea9484b771c18d90a5642"
    ),
}
FAMILY_SOURCES = {
    **v4.FAMILY_SOURCES,
    "same_blocker_definition": (
        "definitional CNF auxiliary: exact equality of the two one-hot "
        "FirstNonHitSourceTotalFiniteAssignment.blockerMap values; "
        "one-hot source=v4 blocker_function"
    ),
    "distinct_blocker_row_overlap": (
        f"{OVERLAP_SOURCE_THEOREM}; source={OVERLAP_SOURCE_FILE}; "
        f"sha256={SOURCE_HASHES[OVERLAP_SOURCE_FILE]}"
    ),
}
OMITTED_RELAXATIONS = v4.OMITTED_RELAXATIONS

PREDECESSOR_SCHEMA = v4.SCHEMA
PREDECESSOR_VARIABLES = 93_075
PREDECESSOR_CLAUSES = 463_822
PREDECESSOR_CNF_SHA256 = (
    "387c98b39dc7c6cb81f350b7b506c730ec2a9574d0fde0a46b8ed18251008b2e"
)
PREDECESSOR_MODEL_RELATIVE = (
    "scratch/runs/firstnonhit-all-large-caps-v4/"
    "n17-one-shot-audit-approved/production-cadical.stdout"
)
PREDECESSOR_MODEL_STDOUT_SHA256 = (
    "e7a9724856bc37df8dfeba9f36dfb2c9975632c3c8dbff2abc26adce850f5586"
)

EncodingError = v2.EncodingError
VariableRecord = v2.VariableRecord
ClauseRecord = v2.ClauseRecord
Encoding = v2.Encoding
Bundle = v2.Bundle


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _dimacs(encoding: Encoding) -> bytes:
    lines = [f"p cnf {len(encoding.variables)} {len(encoding.clauses)}"]
    lines.extend(
        " ".join(map(str, clause.literals)) + " 0" for clause in encoding.clauses
    )
    return ("\n".join(lines) + "\n").encode()


def _source_pairs(n: int) -> tuple[tuple[int, int], ...]:
    return tuple(combinations(range(n), 2))


def _same_role(source: int, target: int) -> str:
    return f"same_blocker/{source}/{target}"


def _expected_contract(base: Encoding) -> dict[str, object]:
    n = base.n
    return {
        **base.semantic_contract,
        "predecessor": {
            "schema": PREDECESSOR_SCHEMA,
            "variables": PREDECESSOR_VARIABLES,
            "clauses": PREDECESSOR_CLAUSES,
            "cnf_sha256": PREDECESSOR_CNF_SHA256,
        },
        "distinct_blocker_overlap": {
            "source_pairs": len(_source_pairs(n)),
            "same_blocker_definition": "exact_iff_one_hot_equality",
            "maximum_common_row_cardinality_when_distinct": 2,
            "triple_domain": n,
            "query_unchanged_from_predecessor": True,
        },
    }


def _delta_document(encoding: Encoding) -> dict[str, object]:
    pair_count = len(_source_pairs(encoding.n))
    same_clause_count = pair_count * 2 * encoding.n
    overlap_clause_count = pair_count * __import__("math").comb(encoding.n, 3)
    return {
        "schema": f"{SCHEMA}/delta/v1",
        "predecessor_schema": PREDECESSOR_SCHEMA,
        "predecessor_cnf_sha256": PREDECESSOR_CNF_SHA256,
        "source_pair_count": pair_count,
        "same_blocker_variables": pair_count,
        "same_blocker_definition_clauses": same_clause_count,
        "triple_overlap_clauses": overlap_clause_count,
        "total_added_clauses": same_clause_count + overlap_clause_count,
        "triple_count_per_source_pair": __import__("math").comb(encoding.n, 3),
        "query_unchanged": True,
        "ordering": (
            "lexicographic source pair; equality-to-same centers; "
            "same-to-equality centers; lexicographic carrier triples"
        ),
    }


def _provenance_document(encoding: Encoding) -> dict[str, object]:
    return {
        "schema": PROVENANCE_SCHEMA,
        "variable_source_ranges": [
            {
                "first_id": 1,
                "last_id": PREDECESSOR_VARIABLES,
                "source": (
                    f"authenticated predecessor {PREDECESSOR_SCHEMA}; "
                    f"cnf_sha256={PREDECESSOR_CNF_SHA256}"
                ),
            },
            {
                "first_id": PREDECESSOR_VARIABLES + 1,
                "last_id": len(encoding.variables),
                "role_prefix": "same_blocker/",
                "source": FAMILY_SOURCES["same_blocker_definition"],
            },
        ],
        "clause_family_sources": dict(sorted(FAMILY_SOURCES.items())),
        "variable_identity": "unique integer id plus unique semantic role",
        "clause_identity": "unique integer id plus unique semantic role",
        "clause_source_resolution": "exactly one family source plus unique role",
    }


def _same_definition_holds(
    left_center: int, right_center: int, same: bool, n: int
) -> bool:
    left = tuple(index == left_center for index in range(n))
    right = tuple(index == right_center for index in range(n))
    equal_to_same = all(not (left[i] and right[i]) or same for i in range(n))
    same_to_equal = all(not (same and left[i]) or right[i] for i in range(n))
    return equal_to_same and same_to_equal


def _overlap_clauses_hold(
    left: Sequence[bool], right: Sequence[bool], same: bool
) -> bool:
    if len(left) != len(right):
        raise EncodingError("overlap control vector length mismatch")
    return all(
        same or not all(left[index] and right[index] for index in triple)
        for triple in combinations(range(len(left)), 3)
    )


def run_encoding_controls() -> None:
    v4.run_encoding_controls()
    for n in (2, 3, 4):
        for left_center, right_center, same in product(
            range(n), range(n), (False, True)
        ):
            if _same_definition_holds(left_center, right_center, same, n) != (
                same == (left_center == right_center)
            ):
                raise EncodingError("sameBlocker one-hot equivalence control failed")
    for left in product((False, True), repeat=4):
        for right in product((False, True), repeat=4):
            for same in (False, True):
                if _overlap_clauses_hold(left, right, same) != (
                    same or sum(a and b for a, b in zip(left, right, strict=True)) <= 2
                ):
                    raise EncodingError("triple-overlap truth-table control failed")


def encode(n: int) -> Encoding:
    """Return byte-identical v4 constraints plus the complete overlap family."""

    base = v4.encode(n)
    if (
        len(base.variables) != PREDECESSOR_VARIABLES
        or len(base.clauses) != PREDECESSOR_CLAUSES
        or _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256
    ):
        raise EncodingError("authenticated v4 predecessor drift")

    variables = list(base.variables)
    same_ids: dict[tuple[int, int], int] = {}
    for source, target in _source_pairs(n):
        identifier = len(variables) + 1
        same_ids[source, target] = identifier
        variables.append(VariableRecord(identifier, _same_role(source, target)))

    role_to_id = {row.role: row.id for row in variables}
    clauses = list(base.clauses)
    for source, target in _source_pairs(n):
        same = same_ids[source, target]
        for center in range(n):
            clauses.append(
                ClauseRecord(
                    len(clauses) + 1,
                    "same_blocker_definition",
                    f"same_blocker/iff/{source}/{target}/equal_to_same/{center}",
                    (
                        -role_to_id[f"blocker/{source}/{center}"],
                        -role_to_id[f"blocker/{target}/{center}"],
                        same,
                    ),
                )
            )
        for center in range(n):
            clauses.append(
                ClauseRecord(
                    len(clauses) + 1,
                    "same_blocker_definition",
                    f"same_blocker/iff/{source}/{target}/same_to_equal/{center}",
                    (
                        -same,
                        -role_to_id[f"blocker/{source}/{center}"],
                        role_to_id[f"blocker/{target}/{center}"],
                    ),
                )
            )
        for x, y, z in combinations(range(n), 3):
            clauses.append(
                ClauseRecord(
                    len(clauses) + 1,
                    "distinct_blocker_row_overlap",
                    f"row_overlap/distinct/{source}/{target}/triple/{x},{y},{z}",
                    (
                        same,
                        -role_to_id[f"row/{source}/{x}"],
                        -role_to_id[f"row/{target}/{x}"],
                        -role_to_id[f"row/{source}/{y}"],
                        -role_to_id[f"row/{target}/{y}"],
                        -role_to_id[f"row/{source}/{z}"],
                        -role_to_id[f"row/{target}/{z}"],
                    ),
                )
            )

    result = Encoding(n, tuple(variables), tuple(clauses), _expected_contract(base))
    _validate_semantic_encoding(result, base)
    return result


def _expected_delta(
    base: Encoding, variables: Sequence[VariableRecord]
) -> tuple[ClauseRecord, ...]:
    n = base.n
    role_to_id = {row.role: row.id for row in variables}
    result: list[ClauseRecord] = []
    next_id = PREDECESSOR_CLAUSES + 1
    for source, target in _source_pairs(n):
        same = role_to_id[_same_role(source, target)]
        for center in range(n):
            result.append(
                ClauseRecord(
                    next_id,
                    "same_blocker_definition",
                    f"same_blocker/iff/{source}/{target}/equal_to_same/{center}",
                    (
                        -role_to_id[f"blocker/{source}/{center}"],
                        -role_to_id[f"blocker/{target}/{center}"],
                        same,
                    ),
                )
            )
            next_id += 1
        for center in range(n):
            result.append(
                ClauseRecord(
                    next_id,
                    "same_blocker_definition",
                    f"same_blocker/iff/{source}/{target}/same_to_equal/{center}",
                    (
                        -same,
                        -role_to_id[f"blocker/{source}/{center}"],
                        role_to_id[f"blocker/{target}/{center}"],
                    ),
                )
            )
            next_id += 1
        for x, y, z in combinations(range(n), 3):
            result.append(
                ClauseRecord(
                    next_id,
                    "distinct_blocker_row_overlap",
                    f"row_overlap/distinct/{source}/{target}/triple/{x},{y},{z}",
                    (
                        same,
                        -role_to_id[f"row/{source}/{x}"],
                        -role_to_id[f"row/{target}/{x}"],
                        -role_to_id[f"row/{source}/{y}"],
                        -role_to_id[f"row/{target}/{y}"],
                        -role_to_id[f"row/{source}/{z}"],
                        -role_to_id[f"row/{target}/{z}"],
                    ),
                )
            )
            next_id += 1
    return tuple(result)


def _validate_semantic_encoding(encoding: Encoding, base: Encoding) -> None:
    n = encoding.n
    pairs = _source_pairs(n)
    expected_variables = PREDECESSOR_VARIABLES + len(pairs)
    expected_same_clauses = len(pairs) * 2 * n
    expected_overlap_clauses = len(pairs) * __import__("math").comb(n, 3)
    if len(encoding.variables) != expected_variables:
        raise EncodingError("v5 sameBlocker variable count drift")
    if len(encoding.clauses) != (
        PREDECESSOR_CLAUSES + expected_same_clauses + expected_overlap_clauses
    ):
        raise EncodingError("v5 overlap clause count drift")
    if encoding.variables[:PREDECESSOR_VARIABLES] != base.variables:
        raise EncodingError("v4 variable prefix changed")
    if encoding.clauses[:PREDECESSOR_CLAUSES] != base.clauses:
        raise EncodingError("v4 clause prefix changed")
    if [row.id for row in encoding.variables] != list(
        range(1, len(encoding.variables) + 1)
    ):
        raise EncodingError("variable identifiers are not contiguous")
    if len({row.role for row in encoding.variables}) != len(encoding.variables):
        raise EncodingError("variable roles are not unique")
    if [row.id for row in encoding.clauses] != list(
        range(1, len(encoding.clauses) + 1)
    ):
        raise EncodingError("clause identifiers are not contiguous")
    if len({row.role for row in encoding.clauses}) != len(encoding.clauses):
        raise EncodingError("clause roles are not unique")
    if any(row.family not in FAMILY_SOURCES for row in encoding.clauses):
        raise EncodingError("a clause family lacks exactly one source binding")
    expected_new_variables = tuple(
        VariableRecord(PREDECESSOR_VARIABLES + index, _same_role(*pair))
        for index, pair in enumerate(pairs, 1)
    )
    if encoding.variables[PREDECESSOR_VARIABLES:] != expected_new_variables:
        raise EncodingError("sameBlocker variable ordering drift")
    if encoding.clauses[PREDECESSOR_CLAUSES:] != _expected_delta(
        base, encoding.variables
    ):
        raise EncodingError("overlap clause delta drift")
    if encoding.semantic_contract != _expected_contract(base):
        raise EncodingError("v5 semantic contract drift")
    if encoding.semantic_contract["omitted_relaxations"] != list(OMITTED_RELAXATIONS):
        raise EncodingError("omitted-family inventory drift")


def validate_semantic_encoding(encoding: Encoding) -> None:
    if type(encoding.n) is not int or encoding.n < MIN_CARRIER_CARD:
        raise EncodingError("invalid carrier cardinality")
    base = v4.encode(encoding.n)
    if _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256:
        raise EncodingError("v4 predecessor replay digest mismatch")
    _validate_semantic_encoding(encoding, base)


def source_snapshot() -> dict[str, object]:
    rows = []
    root = _repo_root()
    for path, expected in sorted(SOURCE_HASHES.items()):
        data = v2._read_source_without_links(root, path)
        actual = _sha256(data)
        if actual != expected:
            raise EncodingError(
                f"source drift from pinned commit for {path}: {actual} != {expected}"
            )
        rows.append({"path": path, "sha256": actual, "size": len(data)})
    return {"schema": SOURCE_SCHEMA, "commit": LEAN_COMMIT, "files": rows}


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _map_document(encoding: Encoding) -> dict[str, object]:
    return {
        "schema": MAP_SCHEMA,
        "n": encoding.n,
        "variables": [
            {"id": variable.id, "role": variable.role}
            for variable in encoding.variables
        ],
        "clauses": [
            {
                "id": clause.id,
                "family": clause.family,
                "role": clause.role,
                "literals": list(clause.literals),
            }
            for clause in encoding.clauses
        ],
        "provenance": _provenance_document(encoding),
        "semantic_contract": encoding.semantic_contract,
    }


def emit_bundle(n: int) -> Bundle:
    run_encoding_controls()
    encoding = encode(n)
    cnf = _dimacs(encoding)
    variable_map = _canonical_json(_map_document(encoding))
    sources = _canonical_json(source_snapshot())
    family_counts = Counter(clause.family for clause in encoding.clauses)
    manifest = {
        "schema": MANIFEST_SCHEMA,
        "n": encoding.n,
        "lean_commit": LEAN_COMMIT,
        "source_total": SOURCE_TOTAL_CLAIM,
        "launch_enabled": PRODUCTION_LAUNCH_ENABLED,
        "solver_run": False,
        "solver_verdict": None,
        "generic_cardinality_lift": False,
        "finite_encoding_emitted": True,
        "query_is_separate_assumption": True,
        "query": QUERY,
        "query_unchanged_from_predecessor": True,
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
        "variables": len(encoding.variables),
        "clauses": len(encoding.clauses),
        "family_clause_counts": dict(sorted(family_counts.items())),
        "predecessor": encoding.semantic_contract["predecessor"],
        "clause_delta": _delta_document(encoding),
        "cnf_sha256": _sha256(cnf),
        "map_sha256": _sha256(variable_map),
        "sources_sha256": _sha256(sources),
    }
    manifest["manifest_sha256"] = _sha256(_canonical_json(manifest))
    bundle = Bundle(cnf, variable_map, sources, _canonical_json(manifest))
    validate_bundle(bundle)
    return bundle


def _strict_json(data: bytes, description: str) -> dict[str, object]:
    return v2._strict_json(data, description)


def validate_bundle(bundle: Bundle) -> dict[str, object]:
    manifest = _strict_json(bundle.manifest, "manifest")
    variable_map = _strict_json(bundle.variable_map, "map")
    sources = _strict_json(bundle.sources, "sources")
    if any(
        _canonical_json(value) != data
        for value, data in (
            (manifest, bundle.manifest),
            (variable_map, bundle.variable_map),
            (sources, bundle.sources),
        )
    ):
        raise EncodingError("bundle JSON is not canonical")
    if (
        manifest.get("schema") != MANIFEST_SCHEMA
        or variable_map.get("schema") != MAP_SCHEMA
    ):
        raise EncodingError("artifact schema mismatch")
    if sources != source_snapshot():
        raise EncodingError("source snapshot does not replay exactly")
    if manifest.get("lean_commit") != LEAN_COMMIT:
        raise EncodingError("Lean commit binding drift")
    if (
        manifest.get("source_total") is not False
        or manifest.get("launch_enabled") is not False
    ):
        raise EncodingError("audit gate flags must remain false")
    if (
        manifest.get("solver_run") is not False
        or manifest.get("solver_verdict") is not None
    ):
        raise EncodingError("emitter manifest falsely reports a solver run")
    if manifest.get("generic_cardinality_lift") is not False:
        raise EncodingError("generic cardinality lift must remain false")
    if manifest.get("finite_encoding_emitted") is not True:
        raise EncodingError("finite encoding flag drift")
    if (
        manifest.get("query_is_separate_assumption") is not True
        or manifest.get("query_unchanged_from_predecessor") is not True
        or manifest.get("query") != QUERY
    ):
        raise EncodingError("query contract drift")
    if manifest.get("omitted_relaxations") != list(OMITTED_RELAXATIONS):
        raise EncodingError("manifest omission inventory drift")
    if manifest.get("cnf_sha256") != _sha256(bundle.cnf):
        raise EncodingError("CNF digest mismatch")
    if manifest.get("map_sha256") != _sha256(bundle.variable_map):
        raise EncodingError("map digest mismatch")
    if manifest.get("sources_sha256") != _sha256(bundle.sources):
        raise EncodingError("source digest mismatch")
    unsigned = dict(manifest)
    digest = unsigned.pop("manifest_sha256", None)
    if digest != _sha256(_canonical_json(unsigned)):
        raise EncodingError("manifest self-hash mismatch")

    lines = bundle.cnf.decode("ascii").splitlines()
    if not lines or not lines[0].startswith("p cnf "):
        raise EncodingError("missing DIMACS header")
    header = lines[0].split()
    if len(header) != 4:
        raise EncodingError("malformed DIMACS header")
    variable_count, clause_count = int(header[2]), int(header[3])
    if len(lines) - 1 != clause_count:
        raise EncodingError("DIMACS clause count mismatch")
    parsed: list[tuple[int, ...]] = []
    for line in lines[1:]:
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0 or 0 in values[:-1]:
            raise EncodingError("malformed DIMACS clause")
        if any(abs(value) > variable_count for value in values[:-1]):
            raise EncodingError("DIMACS literal out of range")
        parsed.append(tuple(values[:-1]))

    map_variables = variable_map.get("variables")
    map_clauses = variable_map.get("clauses")
    if type(map_variables) is not list or type(map_clauses) is not list:
        raise EncodingError("map rows must be lists")
    if len(map_variables) != variable_count or len(map_clauses) != clause_count:
        raise EncodingError("map count mismatch")
    if (
        manifest.get("variables") != variable_count
        or manifest.get("clauses") != clause_count
    ):
        raise EncodingError("manifest count mismatch")
    n = manifest.get("n")
    if type(n) is not int or n < MIN_CARRIER_CARD or variable_map.get("n") != n:
        raise EncodingError("manifest/map carrier mismatch")
    variables = tuple(
        VariableRecord(row["id"], row["role"])
        for row in map_variables
        if type(row) is dict and set(row) == {"id", "role"}
    )
    clauses = tuple(
        ClauseRecord(row["id"], row["family"], row["role"], literals)
        for row, literals in zip(map_clauses, parsed, strict=True)
        if type(row) is dict
        and set(row) == {"id", "family", "role", "literals"}
        and row.get("literals") == list(literals)
    )
    if len(variables) != variable_count or len(clauses) != clause_count:
        raise EncodingError("map rows do not replay CNF")
    semantic_contract = variable_map.get("semantic_contract")
    if type(semantic_contract) is not dict:
        raise EncodingError("semantic contract is missing")
    encoding = Encoding(n, variables, clauses, semantic_contract)
    validate_semantic_encoding(encoding)
    if variable_map.get("provenance") != _provenance_document(encoding):
        raise EncodingError("variable/clause provenance drift")
    family_counts = dict(sorted(Counter(row.family for row in clauses).items()))
    if manifest.get("family_clause_counts") != family_counts:
        raise EncodingError("family clause counts do not replay")
    if manifest.get("predecessor") != encoding.semantic_contract["predecessor"]:
        raise EncodingError("predecessor manifest drift")
    if manifest.get("clause_delta") != _delta_document(encoding):
        raise EncodingError("clause delta manifest drift")
    return manifest


def _parse_complete_model(stdout: bytes, variable_count: int) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for raw in stdout.decode("ascii").splitlines():
        if not raw.startswith("v "):
            continue
        for token in raw.split()[1:]:
            literal = int(token)
            if literal == 0:
                continue
            identifier = abs(literal)
            value = literal > 0
            if identifier in assignment and assignment[identifier] != value:
                raise EncodingError("model contains conflicting literals")
            assignment[identifier] = value
    if set(assignment) != set(range(1, variable_count + 1)):
        raise EncodingError("model is incomplete")
    return assignment


def validate_predecessor_sat_model_control(stdout: bytes) -> dict[str, object]:
    """Read back the authenticated v4 survivor against the exact v5 delta."""

    if _sha256(stdout) != PREDECESSOR_MODEL_STDOUT_SHA256:
        raise EncodingError("v4 SAT model stdout digest mismatch")
    base = v4.encode(17)
    assignment = _parse_complete_model(stdout, PREDECESSOR_VARIABLES)

    def satisfied(clause: ClauseRecord) -> bool:
        return any(
            assignment[abs(literal)] == (literal > 0) for literal in clause.literals
        )

    if not all(satisfied(clause) for clause in base.clauses):
        raise EncodingError("v4 model does not satisfy the authenticated v4 CNF")
    role_to_id = {row.role: row.id for row in base.variables}
    blockers: dict[int, int] = {}
    rows: dict[int, tuple[int, ...]] = {}
    for source in range(17):
        chosen = tuple(
            center
            for center in range(17)
            if assignment[role_to_id[f"blocker/{source}/{center}"]]
        )
        if len(chosen) != 1:
            raise EncodingError("v4 model blocker value is not one-hot")
        blockers[source] = chosen[0]
        rows[source] = tuple(
            x for x in range(17) if assignment[role_to_id[f"row/{source}/{x}"]]
        )
        if len(rows[source]) != 4:
            raise EncodingError("v4 model selected row does not have cardinality four")

    violations = []
    for source, target in _source_pairs(17):
        overlap = tuple(sorted(set(rows[source]) & set(rows[target])))
        if blockers[source] != blockers[target] and len(overlap) >= 3:
            violations.append(
                {
                    "source_pair": [source, target],
                    "blocker_values": [blockers[source], blockers[target]],
                    "source_row": list(rows[source]),
                    "target_row": list(rows[target]),
                    "overlap": list(overlap),
                }
            )
    known = {(7, 15), (8, 15)}
    found = {tuple(row["source_pair"]) for row in violations}
    if not known <= found:
        raise EncodingError("authenticated v4 model lost the known overlap violations")
    return {
        "predecessor_cnf_satisfied": True,
        "new_family_satisfied": False,
        "stdout_sha256": PREDECESSOR_MODEL_STDOUT_SHA256,
        "violating_pair_count": len(violations),
        "violations": violations,
        "known_violating_pairs": [[7, 15], [8, 15]],
    }


def write_bundle(bundle: Bundle, output_dir: Path) -> tuple[Path, ...]:
    validate_bundle(bundle)
    output_dir.mkdir(parents=True, exist_ok=True)
    artifacts = (
        (output_dir / "problem.cnf", bundle.cnf),
        (output_dir / "problem.map.json", bundle.variable_map),
        (output_dir / "problem.sources.json", bundle.sources),
        (output_dir / "problem.manifest.json", bundle.manifest),
    )
    for path, data in artifacts:
        v2._write_exact(path, data)
    return tuple(path for path, _ in artifacts)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=17)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    bundle = emit_bundle(args.n)
    manifest = validate_bundle(bundle)
    if args.output_dir is not None:
        write_bundle(bundle, args.output_dir)
    print(json.dumps(manifest, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
