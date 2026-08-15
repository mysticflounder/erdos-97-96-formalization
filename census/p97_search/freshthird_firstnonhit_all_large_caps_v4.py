"""Authenticated v4 refinement of the finite FirstNonHit CNF.

This module composes the frozen v3 encoder and adds exactly three theorem-backed
cap-cardinality constraints supplied by
``FirstNonHitFiniteAllLargeCaps.cap_card_ge_six`` with the aggregate
``FirstNonHitCompleteFiniteSourceTheory.allLargeCaps`` antecedent.  It is an
emitter only: production launch remains disabled and the finite surface is not
claimed to be source-total or a finite-to-universal reduction.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Sequence
from itertools import combinations
from pathlib import Path

import census.p97_search.freshthird_firstnonhit_cap_endpoint_v3 as v3
import census.p97_search.freshthird_firstnonhit_complete_finite_v2 as v2

SCHEMA = "p97-freshthird-firstnonhit-all-large-caps-v4/cnf/v1"
MAP_SCHEMA = f"{SCHEMA}/map/v1"
SOURCE_SCHEMA = f"{SCHEMA}/sources/v1"
MANIFEST_SCHEMA = f"{SCHEMA}/manifest/v1"
MIN_CARRIER_CARD = v2.MIN_CARRIER_CARD
LEAN_COMMIT = "e0ece509ee0a3ef03f2dfbf9e183a5d311b2f5fa"
SOURCE_TOTAL_CLAIM = False
PRODUCTION_LAUNCH_ENABLED = False

QUERY = "no distinct-center selected row has Q-row overlap at least three"

BASE = v2.BASE
SOURCE_HASHES = {
    **v2.SOURCE_HASHES,
    f"{BASE}FirstNonHitCompleteFiniteSourceTheory.lean": (
        "3aa1b73f666e5633cb4d1236c19385639d03a45f522e0a2adaa8d2c6447d1181"
    ),
}

APEX_SOURCE_FILE = f"{BASE}FirstNonHitCompleteFiniteSourceTheory.lean"
ALL_LARGE_CAP_SOURCE_FIELD = "cap_card_ge_six"
FAMILY_SOURCES = {
    **v3.FAMILY_SOURCES,
    "apex_cross_cap_membership": (
        "FirstNonHitCompleteFiniteSourceTheory.apexCrossCapMemberships : "
        "FirstNonHitFiniteApexCrossCapMemberships; source="
        + APEX_SOURCE_FILE
        + f"; sha256={SOURCE_HASHES[APEX_SOURCE_FILE]}"
    ),
    "all_large_caps": (
        "FirstNonHitFiniteAllLargeCaps.cap_card_ge_six : "
        "antecedent=FirstNonHitCompleteFiniteSourceTheory.allLargeCaps; "
        f"source={APEX_SOURCE_FILE}; sha256={SOURCE_HASHES[APEX_SOURCE_FILE]}"
    ),
}
OMITTED_RELAXATIONS = v2.OMITTED_RELAXATIONS
ROLES = v2.ROLES
Q1 = v2.Q1

ALL_LARGE_CAP_DELTA = tuple((cap, ALL_LARGE_CAP_SOURCE_FIELD) for cap in range(3))
PREDECESSOR_SCHEMA = v3.SCHEMA
PREDECESSOR_VARIABLES = 93_075
PREDECESSOR_CLAUSES = 445_258
PREDECESSOR_CNF_SHA256 = (
    "efee6f9ff7c95c090f11dd1f8566380e8c832d12641c1baf338e690d032962b3"
)
PREDECESSOR_MODEL_STDOUT_SHA256 = (
    "f6395d51fc9f65329579037c4413bfc2bbbc46d7080c3f6b876f46ff1b726502"
)

EncodingError = v2.EncodingError
VariableRecord = v2.VariableRecord
ClauseRecord = v2.ClauseRecord
Encoding = v2.Encoding
Bundle = v2.Bundle
CNFBuilder = v2.CNFBuilder


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


def _predecessor_encoding(encoding: Encoding) -> Encoding:
    contract = dict(encoding.semantic_contract)
    contract.pop("all_large_caps", None)
    contract["predecessor"] = {
        "schema": v3.PREDECESSOR_SCHEMA,
        "variables": v3.PREDECESSOR_VARIABLES,
        "clauses": v3.PREDECESSOR_CLAUSES,
        "cnf_sha256": v3.PREDECESSOR_CNF_SHA256,
    }
    return Encoding(
        encoding.n,
        encoding.variables,
        encoding.clauses[:PREDECESSOR_CLAUSES],
        contract,
    )


def _delta_document(encoding: Encoding) -> dict[str, object]:
    clauses = encoding.clauses[PREDECESSOR_CLAUSES:]
    return {
        "family": "all_large_caps",
        "constraint_count": 3,
        "threshold": 6,
        "omitted_subset_size": encoding.n - 5,
        "clauses": [
            {
                "id": clause.id,
                "role": clause.role,
                "literals": list(clause.literals),
            }
            for clause in clauses
        ],
    }


def run_encoding_controls() -> None:
    v2.run_encoding_controls()
    for n in (6, 7):
        for truth in __import__("itertools").product((False, True), repeat=n):
            clauses = _cardinality_clauses(truth, n)
            actual = sum(truth) >= 6
            encoded = all(any(truth[i] for i in clause) for clause in clauses)
            if encoded != actual:
                raise EncodingError("all-large-cap cardinality truth table failed")
    for truth in (
        (True,) * 17,
        (True,) * 6 + (False,) * 11,
        (True,) * 5 + (False,) * 12,
    ):
        clauses = _cardinality_clauses(truth, 17)
        if (all(any(truth[i] for i in clause) for clause in clauses)) != (
            sum(truth) >= 6
        ):
            raise EncodingError("n17 all-large-cap cardinality control failed")


def _cardinality_clauses(bits: Sequence[bool], n: int) -> tuple[tuple[int, ...], ...]:
    """Evaluate the exact monotone CNF schema used for cap[k].card >= 6."""
    return tuple(tuple(omitted) for omitted in combinations(range(n), n - 5))


def encode(n: int) -> Encoding:
    """Return byte-identical v3 clauses followed by exactly three ≥6 families."""

    base = v3.encode(n)
    if (
        len(base.variables) != PREDECESSOR_VARIABLES
        or len(base.clauses) != PREDECESSOR_CLAUSES
    ):
        raise EncodingError("predecessor count drift")
    if _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256:
        raise EncodingError("predecessor CNF digest drift")
    role_to_id = {row.role: row.id for row in base.variables}
    clauses = list(base.clauses)
    for cap, field in ALL_LARGE_CAP_DELTA:
        for omitted in combinations(range(n), n - 5):
            literals = tuple(
                role_to_id[f"cap/{index}/{cap}"]
                for index in range(n)
                if index in omitted
            )
            omitted_tag = ",".join(map(str, omitted))
            clauses.append(
                ClauseRecord(
                    len(clauses) + 1,
                    "all_large_caps",
                    f"all_large_caps/{field}/cap{cap}/omit/{omitted_tag}",
                    literals,
                )
            )
    contract = {
        **base.semantic_contract,
        "predecessor": {
            "schema": PREDECESSOR_SCHEMA,
            "variables": PREDECESSOR_VARIABLES,
            "clauses": PREDECESSOR_CLAUSES,
            "cnf_sha256": PREDECESSOR_CNF_SHA256,
        },
        "all_large_caps": [
            {"cap": cap, "source_field": field, "threshold": 6}
            for cap, field in ALL_LARGE_CAP_DELTA
        ],
    }
    result = Encoding(n, base.variables, tuple(clauses), contract)
    validate_semantic_encoding(result)
    return result


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


def _write_exact(path: Path, data: bytes) -> None:
    v2._write_exact(path, data)


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
        "family_sources": dict(sorted(FAMILY_SOURCES.items())),
        "semantic_contract": encoding.semantic_contract,
    }


def validate_semantic_encoding(encoding: Encoding) -> None:
    if type(encoding.n) is not int or encoding.n < MIN_CARRIER_CARD:
        raise EncodingError("invalid carrier cardinality")
    if len(encoding.variables) != PREDECESSOR_VARIABLES:
        raise EncodingError("v3 must not add variables")
    expected_delta_count = 3 * __import__("math").comb(encoding.n, encoding.n - 5)
    if len(encoding.clauses) != PREDECESSOR_CLAUSES + expected_delta_count:
        raise EncodingError(
            "v4 clause delta does not encode exactly three ≥6 constraints"
        )
    if [row.id for row in encoding.variables] != list(
        range(1, len(encoding.variables) + 1)
    ):
        raise EncodingError("variable identifiers are not contiguous")
    if len({row.role for row in encoding.variables}) != len(encoding.variables):
        raise EncodingError("duplicate variable role")
    if [row.id for row in encoding.clauses] != list(
        range(1, len(encoding.clauses) + 1)
    ):
        raise EncodingError("clause identifiers are not contiguous")
    if len({row.role for row in encoding.clauses}) != len(encoding.clauses):
        raise EncodingError("clause roles are not unique")
    predecessor = _predecessor_encoding(encoding)
    v3.validate_semantic_encoding(predecessor)
    if _sha256(_dimacs(predecessor)) != PREDECESSOR_CNF_SHA256:
        raise EncodingError("predecessor replay digest mismatch")
    role_to_id = {row.role: row.id for row in encoding.variables}
    expected_delta = []
    offset = 0
    for cap, field in ALL_LARGE_CAP_DELTA:
        for omitted in combinations(range(encoding.n), encoding.n - 5):
            offset += 1
            literals = tuple(role_to_id[f"cap/{index}/{cap}"] for index in omitted)
            omitted_tag = ",".join(map(str, omitted))
            expected_delta.append(
                ClauseRecord(
                    PREDECESSOR_CLAUSES + offset,
                    "all_large_caps",
                    f"all_large_caps/{field}/cap{cap}/omit/{omitted_tag}",
                    literals,
                )
            )
    if list(encoding.clauses[PREDECESSOR_CLAUSES:]) != expected_delta:
        raise EncodingError("all-large-cap clause delta drift")
    if any(clause.family not in FAMILY_SOURCES for clause in encoding.clauses):
        raise EncodingError("a clause family lacks a source binding")
    if Counter(row.family for row in encoding.clauses)["query_negation"] != (
        encoding.n * encoding.n * (encoding.n - 1)
    ):
        raise EncodingError("query family changed")
    expected_contract = {
        **predecessor.semantic_contract,
        "predecessor": {
            "schema": PREDECESSOR_SCHEMA,
            "variables": PREDECESSOR_VARIABLES,
            "clauses": PREDECESSOR_CLAUSES,
            "cnf_sha256": PREDECESSOR_CNF_SHA256,
        },
        "all_large_caps": [
            {"cap": cap, "source_field": field, "threshold": 6}
            for cap, field in ALL_LARGE_CAP_DELTA
        ],
    }
    if encoding.semantic_contract != expected_contract:
        raise EncodingError("v4 semantic contract drift")
    if encoding.semantic_contract["omitted_relaxations"] != list(OMITTED_RELAXATIONS):
        raise EncodingError("omitted-family inventory drift")


def emit_bundle(n: int) -> Bundle:
    run_encoding_controls()
    encoding = encode(n)
    sources = _canonical_json(source_snapshot())
    cnf = _dimacs(encoding)
    variable_map = _canonical_json(_map_document(encoding))
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
    if manifest.get("query_is_separate_assumption") is not True:
        raise EncodingError("query separation flag drift")
    if manifest.get("query") != QUERY:
        raise EncodingError("query text drift")
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
        if type(row) is dict
    )
    clauses = tuple(
        ClauseRecord(row["id"], row["family"], row["role"], literals)
        for row, literals in zip(map_clauses, parsed, strict=True)
        if type(row) is dict and row.get("literals") == list(literals)
    )
    if len(variables) != variable_count or len(clauses) != clause_count:
        raise EncodingError("map rows do not replay CNF")
    semantic_contract = variable_map.get("semantic_contract")
    if type(semantic_contract) is not dict:
        raise EncodingError("semantic contract is missing")
    encoding = Encoding(n, variables, clauses, semantic_contract)
    validate_semantic_encoding(encoding)
    if variable_map.get("family_sources") != dict(sorted(FAMILY_SOURCES.items())):
        raise EncodingError("family-to-source map drift")
    family_counts = dict(sorted(Counter(row.family for row in clauses).items()))
    if manifest.get("family_clause_counts") != family_counts:
        raise EncodingError("family clause counts do not replay")
    if manifest.get("predecessor") != encoding.semantic_contract["predecessor"]:
        raise EncodingError("predecessor manifest drift")
    if manifest.get("clause_delta") != _delta_document(encoding):
        raise EncodingError("clause delta manifest drift")
    return manifest


def validate_predecessor_sat_model_control(stdout: bytes) -> dict[str, object]:
    """Replay the audited v3 model, whose cap counts are [4, 10, 6]."""

    if _sha256(stdout) != PREDECESSOR_MODEL_STDOUT_SHA256:
        raise EncodingError("predecessor SAT model stdout digest mismatch")
    encoding = encode(17)
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
                raise EncodingError("predecessor model contains conflicting literals")
            assignment[identifier] = value
    if set(assignment) != set(range(1, PREDECESSOR_VARIABLES + 1)):
        raise EncodingError("predecessor model is incomplete")

    def satisfied(clause: ClauseRecord) -> bool:
        return any(
            assignment[abs(literal)] == (literal > 0) for literal in clause.literals
        )

    if not all(satisfied(clause) for clause in encoding.clauses[:PREDECESSOR_CLAUSES]):
        raise EncodingError("predecessor model does not satisfy predecessor CNF")
    failed = [
        clause.role
        for clause in encoding.clauses[PREDECESSOR_CLAUSES:]
        if not satisfied(clause)
    ]
    variable_ids = {row.role: row.id for row in encoding.variables}
    cap_counts = [
        sum(assignment[variable_ids[f"cap/{index}/{cap}"]] for index in range(17))
        for cap in range(3)
    ]
    if cap_counts != [4, 10, 6]:
        raise EncodingError(f"v3 control cap counts drifted: {cap_counts}")
    cap0_failed = [
        role
        for role in failed
        if role.startswith("all_large_caps/cap_card_ge_six/cap0/")
    ]
    if not cap0_failed:
        raise EncodingError("v3 control did not expose the cap-0 refinement")
    return {
        "predecessor_cnf_satisfied": True,
        "new_family_satisfied": False,
        "cap_counts": cap_counts,
        "cap0_delta_failed": True,
        "failed_new_clause_count": len(failed),
        "failed_new_clause_roles": failed,
        "stdout_sha256": PREDECESSOR_MODEL_STDOUT_SHA256,
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
