#!/usr/bin/env python3
"""Independent integrity, schema-cut, correction, model, and DRAT verifier."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from pathlib import Path
from typing import Sequence


HERE = Path(__file__).resolve().parent
BANK = (
    HERE.parent
    / "generic-biapex-kalmanson-search"
    / "round2-core-normal-forms"
    / "transported_2k3_bank.json"
)
PHYSICAL_CAP = frozenset((0, 1, 2, 3, 4, 5))


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def clause_bytes(clause: Sequence[int]) -> bytes:
    return (" ".join(map(str, clause)) + " 0\n").encode("ascii")


def parse_dimacs(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    num_variables: int | None = None
    expected_clauses: int | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    with path.open(encoding="ascii") as stream:
        for line in stream:
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p "):
                if num_variables is not None:
                    raise ValueError("duplicate DIMACS header")
                fields = stripped.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise ValueError("malformed DIMACS header")
                num_variables, expected_clauses = map(int, fields[2:])
                continue
            for token in stripped.split():
                literal = int(token)
                if literal == 0:
                    if not pending:
                        raise ValueError("empty DIMACS clause")
                    clauses.append(tuple(pending))
                    pending = []
                else:
                    pending.append(literal)
    if pending:
        raise ValueError("unterminated DIMACS clause")
    if num_variables is None or expected_clauses is None:
        raise ValueError("missing DIMACS header")
    if len(clauses) != expected_clauses:
        raise ValueError("DIMACS clause count mismatch")
    if any(abs(literal) > num_variables for clause in clauses for literal in clause):
        raise ValueError("DIMACS literal outside header range")
    return num_variables, clauses


def reflected(
    vertex_count: int, schema: tuple[tuple[int, int], ...]
) -> tuple[tuple[int, int], ...]:
    return tuple(sorted(
        (vertex_count - 1 - center, vertex_count - 1 - point)
        for center, point in schema
    ))


def expected_schema_memberships(n: int) -> list[tuple[tuple[int, int], ...]]:
    payload = json.loads(BANK.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise ValueError("transported bank schema drift")
    if payload.get("schema_count") != 20 or len(payload.get("schemas", ())) != 20:
        raise ValueError("transported bank count drift")
    unique: set[tuple[tuple[int, int], ...]] = set()
    for record in payload["schemas"]:
        vertex_count = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(pair) for pair in record["order_schema"]))
        if len(schema) != 6:
            raise ValueError("bank member does not have six memberships")
        for provenance in record.get("provenance", ()):
            if provenance.get("certificate_verified") is not True:
                raise ValueError("bank provenance is not independently marked verified")
        if vertex_count > n:
            continue
        for embedding in itertools.combinations(range(n), vertex_count):
            for oriented in (schema, reflected(vertex_count, schema)):
                required = tuple(sorted(
                    (embedding[center], embedding[point])
                    for center, point in oriented
                ))
                if len(set(required)) != 6:
                    raise ValueError("transported application collapsed")
                unique.add(required)
    return sorted(unique)


def ledger_slice(
    clauses: Sequence[tuple[int, ...]], record: dict[str, object]
) -> list[tuple[int, ...]]:
    first = int(record["first_clause"])
    last = int(record["last_clause"])
    if not (1 <= first <= last <= len(clauses)):
        raise ValueError("category ledger range invalid")
    selected = list(clauses[first - 1:last])
    digest = hashlib.sha256()
    for clause in selected:
        digest.update(clause_bytes(clause))
    if len(selected) != int(record["count"]) or digest.hexdigest() != record["sha256"]:
        raise ValueError(f"category digest mismatch: {record['kind']}")
    return selected


def parse_assignment(path: Path) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise ValueError("inconsistent SAT assignment")
            assignment[variable] = value
    return assignment


def verify_sat_model(
    clauses: Sequence[tuple[int, ...]], assignment: dict[int, bool]
) -> None:
    for index, clause in enumerate(clauses, start=1):
        if not any(assignment.get(abs(literal), False) == (literal > 0) for literal in clause):
            raise ValueError(f"SAT model fails clause {index}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--result", type=Path, required=True)
    args = parser.parse_args()
    result = json.loads(args.result.read_text(encoding="utf-8"))
    if result.get("schema") != "p97-exact6-allcenter-coverage-result-v1":
        raise ValueError("result schema drift")
    root = args.result.parent
    artifacts = result["artifacts"]
    paths: dict[str, Path] = {}
    for name, record in artifacts.items():
        path = (root / record["path"]).resolve()
        path.relative_to(root.resolve())
        if not path.is_file() or path.stat().st_size != record["bytes"] or sha256(path) != record["sha256"]:
            raise ValueError(f"artifact mismatch: {name}")
        paths[name] = path

    manifest = json.loads(paths["manifest"].read_text(encoding="utf-8"))
    if manifest.get("schema") != "p97-exact6-allcenter-coverage-manifest-v1":
        raise ValueError("manifest schema drift")
    if sha256(paths["cnf"]) != manifest["cnf_sha256"]:
        raise ValueError("CNF digest mismatch")
    num_variables, clauses = parse_dimacs(paths["cnf"])
    if num_variables != manifest["num_variables"] or len(clauses) != manifest["num_clauses"]:
        raise ValueError("manifest DIMACS counts mismatch")
    variables = manifest["variables"]
    if sorted(variables.values()) != list(range(1, num_variables + 1)):
        raise ValueError("variable map is not a bijection")

    ledger = manifest["category_ledger"]
    expected_first = 1
    by_kind: dict[str, list[tuple[int, ...]]] = {}
    for record in ledger:
        if record["first_clause"] != expected_first:
            raise ValueError("category ledger has a gap or overlap")
        selected = ledger_slice(clauses, record)
        by_kind.setdefault(str(record["kind"]), []).extend(selected)
        expected_first = int(record["last_clause"]) + 1
    if expected_first != len(clauses) + 1:
        raise ValueError("category ledger does not cover the CNF")
    if {kind: len(rows) for kind, rows in sorted(by_kind.items())} != manifest["category_counts"]:
        raise ValueError("category aggregate counts mismatch")

    if sha256(BANK) != manifest["transported_schema_bank"]["bank_sha256"]:
        raise ValueError("transported schema bank digest mismatch")
    n = int(manifest["n"])
    applications = expected_schema_memberships(n)
    expected_schema_clauses = [
        tuple(-variables[f"member_{center}_{point}"] for center, point in required)
        for required in applications
    ]
    if by_kind.get("transported_2k3_schema_cuts") != expected_schema_clauses:
        raise ValueError("transported schema clause closure mismatch")
    if len(applications) != manifest["transported_schema_bank"]["transported_application_count"]:
        raise ValueError("transported application count mismatch")

    if manifest["profile"] == "n14":
        unused = [variables[f"role_unused_{point}"] for point in range(14)]
        shell = [variables[f"shell_{point}"] for point in range(14)]
        expected_correction: list[tuple[int, ...]] = [tuple(unused)]
        expected_correction.extend(
            (-left, -right) for left, right in itertools.combinations(unused, 2)
        )
        for point in range(14):
            if point not in PHYSICAL_CAP:
                expected_correction.append((-unused[point],))
            expected_correction.append((-unused[point], -shell[point]))
        if by_kind.get("unused_in_closed_physical_cap") != expected_correction:
            raise ValueError("unused-in-closed-physical-cap correction mismatch")
        if manifest.get("source_audit_correction", {}).get("unused_domain") != sorted(PHYSICAL_CAP):
            raise ValueError("manifest omits source-audit correction")

    verdict = result["verdict"]
    if verdict == "UNSAT_DRAT_VERIFIED":
        checked = subprocess.run(
            ["drat-trim", str(paths["cnf"]), str(paths["drat"])],
            capture_output=True,
            text=True,
            timeout=int(result["solver"]["timeout_seconds"]) + 30,
            check=False,
        )
        output = checked.stdout + checked.stderr
        if checked.returncode != 0 or not any(
            line.strip() == "s VERIFIED" for line in output.splitlines()
        ):
            raise ValueError("independent DRAT replay failed")
    elif verdict == "SAT_CANDIDATE":
        assignment = parse_assignment(paths["solver_output"])
        if len(assignment) != num_variables:
            raise ValueError("SAT assignment is incomplete")
        verify_sat_model(clauses, assignment)
        if manifest["profile"] == "n14":
            chosen_unused = [
                point for point in range(14)
                if assignment[variables[f"role_unused_{point}"]]
            ]
            if len(chosen_unused) != 1 or chosen_unused[0] not in PHYSICAL_CAP:
                raise ValueError("SAT model violates corrected unused domain")
    else:
        raise ValueError(f"result is not independently checkable: {verdict}")

    print(json.dumps({
        "status": "INDEPENDENT_REPLAY_PASS",
        "verdict": verdict,
        "profile": manifest["profile"],
        "orbit": manifest["orbit"],
        "variables": num_variables,
        "clauses": len(clauses),
        "transported_applications": len(applications),
        "unused_domain_checked": sorted(PHYSICAL_CAP) if manifest["profile"] == "n14" else None,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
