"""Build the complete fixed-order exact-17 sparse-six theorem family.

The Lean consumer
``Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows``
rejects, for every increasing six-tuple ``i0 < ... < i5``, the simultaneous
selected-row incidences

``i0 : {i1, i3, i5}`` and ``i2 : {i1, i3, i4}``.

This module enumerates every such instance in an authenticated exact-17 cyclic
order and removes clauses already present in, or strictly subsumed by, a root
CNF.  It only prepares a headerless PIQD fragment and receipt; it never mutates
a PIQD session or invokes a solver.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
from collections.abc import Iterable, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.phase3_piqd_exact17_semantic import validate_variable_map

SCHEMA = "p97-exact17-sparse-six-complete-family/v1"
LEAN_CONSUMER = (
    "Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows"
)


class SparseSixFamilyError(ValueError):
    """The root, cyclic order, or generated family failed closed."""


@dataclass(frozen=True)
class RootScan:
    variables: int
    clauses: int
    exact_present: frozenset[tuple[int, ...]]
    strictly_subsumed: frozenset[tuple[int, ...]]


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def repository_relative(path: Path) -> str:
    try:
        return path.resolve().relative_to(Path.cwd().resolve()).as_posix()
    except ValueError as exc:
        raise SparseSixFamilyError(
            "authenticated artifacts must stay inside the repository"
        ) from exc


def selected_variables(cardinality: int) -> dict[tuple[int, int], int]:
    if cardinality < 6:
        raise SparseSixFamilyError("sparse-six family requires at least six points")
    return {
        (center, point): index
        for index, (center, point) in enumerate(
            (
                (center, point)
                for center in range(cardinality)
                for point in range(cardinality)
                if center != point
            ),
            start=1,
        )
    }


def selected_variables_from_map(
    variable_map_bytes: bytes, cardinality: int
) -> dict[tuple[int, int], int]:
    variable_map = validate_variable_map(variable_map_bytes)
    records = variable_map["allocations"]["selected_incidence"]
    selected = {
        (record["center"], record["point"]): record["variable"] for record in records
    }
    expected = selected_variables(cardinality)
    if selected != expected:
        raise SparseSixFamilyError(
            "authenticated variable map does not match the exact-17 selected-row universe"
        )
    return selected


def sparse_six_clause(
    points: Sequence[int], variables: dict[tuple[int, int], int]
) -> tuple[int, ...]:
    if len(points) != 6 or len(set(points)) != 6:
        raise SparseSixFamilyError("a sparse-six instance needs six distinct points")
    i0, i1, i2, i3, i4, i5 = points
    atoms = (
        (i0, i1),
        (i0, i3),
        (i0, i5),
        (i2, i1),
        (i2, i3),
        (i2, i4),
    )
    try:
        return tuple(sorted(-variables[atom] for atom in atoms))
    except KeyError as exc:
        raise SparseSixFamilyError(
            "point is outside the selected-row universe"
        ) from exc


def complete_family(
    cyclic_order: Sequence[int], variables: dict[tuple[int, int], int]
) -> tuple[tuple[int, ...], ...]:
    cardinality = len(cyclic_order)
    if cardinality != 17 or set(cyclic_order) != set(range(cardinality)):
        raise SparseSixFamilyError("expected a permutation of the exact-17 universe")
    clauses = {
        sparse_six_clause(points, variables)
        for points in itertools.combinations(cyclic_order, 6)
    }
    expected = len(tuple(itertools.combinations(range(cardinality), 6)))
    if len(clauses) != expected:
        raise SparseSixFamilyError(
            "distinct six-tuples did not produce distinct clauses"
        )
    return tuple(sorted(clauses))


def _parse_clause(line: str, *, variables: int) -> tuple[int, ...]:
    try:
        values = tuple(int(token) for token in line.split())
    except ValueError as exc:
        raise SparseSixFamilyError("root contains a non-integer DIMACS token") from exc
    if not values or values[-1] != 0 or 0 in values[:-1]:
        raise SparseSixFamilyError("root contains a malformed DIMACS clause")
    clause = tuple(sorted(values[:-1]))
    if any(abs(literal) > variables for literal in clause):
        raise SparseSixFamilyError("root clause exceeds its declared variable universe")
    return clause


def scan_root(root: Path, candidates: Iterable[tuple[int, ...]]) -> RootScan:
    candidate_set = frozenset(candidates)
    if not candidate_set or any(len(clause) != 6 for clause in candidate_set):
        raise SparseSixFamilyError("candidate family must contain six-literal clauses")

    exact_present: set[tuple[int, ...]] = set()
    shorter_negative: set[tuple[int, ...]] = set()
    observed = 0
    with root.open() as handle:
        header = handle.readline().split()
        if len(header) != 4 or header[:2] != ["p", "cnf"]:
            raise SparseSixFamilyError("root has no valid leading DIMACS header")
        try:
            variables, declared_clauses = int(header[2]), int(header[3])
        except ValueError as exc:
            raise SparseSixFamilyError("root DIMACS header is not numeric") from exc

        for raw_line in handle:
            line = raw_line.strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p"):
                raise SparseSixFamilyError("root contains a misplaced DIMACS header")
            clause = _parse_clause(line, variables=variables)
            observed += 1
            if len(clause) == 0:
                raise SparseSixFamilyError("SAT frontier root contains an empty clause")
            if len(clause) == 6 and clause in candidate_set:
                exact_present.add(clause)
            elif len(clause) < 6 and all(literal < 0 for literal in clause):
                shorter_negative.add(clause)

    if observed != declared_clauses:
        raise SparseSixFamilyError("root DIMACS body count does not match its header")

    strictly_subsumed: set[tuple[int, ...]] = set()
    for candidate in candidate_set - exact_present:
        if any(
            subset in shorter_negative
            for size in range(1, 6)
            for subset in itertools.combinations(candidate, size)
        ):
            strictly_subsumed.add(candidate)
    return RootScan(
        variables=variables,
        clauses=declared_clauses,
        exact_present=frozenset(exact_present),
        strictly_subsumed=frozenset(strictly_subsumed),
    )


def _atomic_write(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("wb") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(path)


def build_fragment(
    *,
    root: Path,
    root_receipt: Path,
    manifest: Path,
    variable_map: Path,
    lean_source: Path,
    fragment: Path,
    receipt: Path,
) -> dict[str, Any]:
    root_data = json.loads(root_receipt.read_text())
    manifest_data = json.loads(manifest.read_text())
    root_hash = sha256(root)
    if root_data.get("output_root_sha256") != root_hash:
        raise SparseSixFamilyError("root receipt does not bind the input root")
    if (
        root_data.get("output_clauses") is None
        or root_data.get("output_variables") is None
    ):
        raise SparseSixFamilyError("root receipt lacks DIMACS counts")
    if manifest_data.get("schema") != "p97-exact17-piqd-wave6-weighted-orbits/v1":
        raise SparseSixFamilyError("unexpected exact-17 manifest schema")
    order = tuple(manifest_data.get("cyclic_order", ()))
    variables = selected_variables_from_map(variable_map.read_bytes(), len(order))
    candidates = complete_family(order, variables)
    scan = scan_root(root, candidates)
    if (
        scan.variables != root_data["output_variables"]
        or scan.clauses != root_data["output_clauses"]
    ):
        raise SparseSixFamilyError("root receipt counts do not match the root")
    lean_text = lean_source.read_text()
    if "theorem false_of_six_ccw_two_selected_rows" not in lean_text:
        raise SparseSixFamilyError("expected Lean consumer is absent")

    excluded = scan.exact_present | scan.strictly_subsumed
    novel = tuple(clause for clause in candidates if clause not in excluded)
    fragment_bytes = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode("ascii") for clause in novel
    )
    _atomic_write(fragment, fragment_bytes)
    result: dict[str, Any] = {
        "schema": SCHEMA,
        "status": "authenticated-complete-fixed-order-theorem-family",
        "warning": (
            "This is complete coverage only for the sparse-six theorem family "
            "in the bound exact-17 cyclic order; it is not exact-17 or P97 closure."
        ),
        "lean_consumer": LEAN_CONSUMER,
        "inputs": {
            "root": repository_relative(root),
            "root_sha256": root_hash,
            "root_receipt": repository_relative(root_receipt),
            "root_receipt_sha256": sha256(root_receipt),
            "manifest": repository_relative(manifest),
            "manifest_sha256": sha256(manifest),
            "variable_map": repository_relative(variable_map),
            "variable_map_sha256": sha256(variable_map),
        },
        "cyclic_order": list(order),
        "admission": {
            "candidate_clauses": len(candidates),
            "exact_present": len(scan.exact_present),
            "strictly_subsumed": len(scan.strictly_subsumed),
            "novel_clauses": len(novel),
            "root_variables": scan.variables,
            "root_clauses": scan.clauses,
        },
        "fragment": repository_relative(fragment),
        "fragment_sha256": sha256(fragment),
        "fragment_bytes": len(fragment_bytes),
        "source_hashes": {
            repository_relative(Path(__file__)): sha256(Path(__file__)),
            repository_relative(lean_source): sha256(lean_source),
        },
    }
    _atomic_write(receipt, canonical_json_bytes(result) + b"\n")
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--root-receipt", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--variable-map", type=Path, required=True)
    parser.add_argument("--lean-source", type=Path, required=True)
    parser.add_argument("--fragment", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    args = parser.parse_args()
    result = build_fragment(**vars(args))
    print(canonical_json_bytes(result["admission"]).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
