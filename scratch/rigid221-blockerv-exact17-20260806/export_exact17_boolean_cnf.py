#!/usr/bin/env python3
"""Export the exact-17 Boolean full-cover shadow to auditable DIMACS.

This is a direct CNF encoding of ``build_cover_solver`` from
``exact17_fullcover_cegar.py``.  It deliberately excludes the metric replay:
SAT means only that a Boolean row assignment survives the currently banked
incidence cuts; UNSAT means that those cuts cover this fixed exact-17 shadow.
"""

from __future__ import annotations

import argparse
import glob
import hashlib
import json
from itertools import combinations
from pathlib import Path

import exact17_fullcover_cegar as cegar

Literal = int
Clause = tuple[Literal, ...]


def variable_map() -> dict[tuple[int, int], int]:
    return {
        (center, point): index
        for index, (center, point) in enumerate(
            (
                (center, point)
                for center in cegar.POINTS
                for point in cegar.POINTS
                if center != point
            ),
            start=1,
        )
    }


def exact_four_clauses(variables: list[int]) -> list[Clause]:
    """CNF for exactly four true variables, without auxiliary variables."""

    at_most_four = [tuple(-var for var in subset) for subset in combinations(variables, 5)]
    # At least four: every set of n - 3 variables contains a true variable.
    at_least_four = [tuple(subset) for subset in combinations(variables, len(variables) - 3)]
    return at_most_four + at_least_four


def load_initial_patterns(pattern_glob: str | None) -> list[tuple[cegar.MetricRow, ...]]:
    if pattern_glob is None:
        return []
    seen: set[str] = set()
    patterns: list[tuple[cegar.MetricRow, ...]] = []
    for path_text in sorted(glob.glob(pattern_glob)):
        path = Path(path_text)
        if path.stat().st_size == 0:
            continue
        with path.open() as handle:
            payload = json.load(handle)
        records = payload["learned_patterns"] if isinstance(payload, dict) else payload
        for record in records:
            key = json.dumps(record, sort_keys=True, separators=(",", ":"))
            if key in seen:
                continue
            seen.add(key)
            patterns.append(cegar.rows_from_payload(record))
    return patterns


def build_clauses(
    var: dict[tuple[int, int], int],
    initial_patterns: list[tuple[cegar.MetricRow, ...]],
) -> tuple[list[Clause], dict[str, int]]:
    clauses: list[Clause] = []
    blocks: dict[str, int] = {}

    def extend(name: str, block: list[Clause] | set[Clause]) -> None:
        clauses.extend(block)
        blocks[name] = len(block)

    exact_four: list[Clause] = []
    for center in cegar.POINTS:
        exact_four.extend(exact_four_clauses([
            var[center, point]
            for point in cegar.POINTS
            if point != center
        ]))
    extend("exact_four", exact_four)

    common_hit: list[Clause] = []
    for left, right in combinations(cegar.POINTS, 2):
        possible_common = [
            point for point in cegar.POINTS if point not in (left, right)
        ]
        for triple in combinations(possible_common, 3):
            common_hit.append(tuple(
                -var[center, point]
                for center in (left, right)
                for point in triple
            ))
    extend("two_center_common_hit", common_hit)

    extend("source_coverage", [
        tuple(var[center, source] for center in cegar.POINTS if center != source)
        for source in cegar.POINTS
    ])

    named_units: list[Clause] = []
    for center, support in cegar.NAMED_BY_CENTER.items():
        for point in cegar.POINTS:
            if point != center:
                literal = var[center, point]
                named_units.append((literal if point in support else -literal,))
    extend("named_row_units", named_units)

    kalmanson: list[Clause] = []
    for start in range(len(cegar.ORDER)):
        rotated = cegar.ORDER[start:] + cegar.ORDER[:start]
        point_o = rotated[0]
        for positions in combinations(range(1, len(rotated)), 4):
            point_a, point_y, point_e, point_c = (
                rotated[position] for position in positions
            )
            kalmanson.append(tuple(-var[atom] for atom in (
                (point_y, point_o),
                (point_y, point_e),
                (point_o, point_e),
                (point_o, point_c),
                (point_a, point_c),
                (point_a, point_o),
            )))
    extend("kalmanson_core", kalmanson)

    bisector: set[Clause] = set()
    for cyclic_order in (cegar.ORDER, tuple(reversed(cegar.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            point_q = rotated[0]
            for positions in combinations(range(1, len(rotated)), 3):
                point_u, point_y, point_v = (
                    rotated[position] for position in positions
                )
                atoms = tuple(sorted((
                    (point_q, point_u),
                    (point_q, point_y),
                    (point_v, point_u),
                    (point_v, point_y),
                )))
                bisector.add(tuple(-var[atom] for atom in atoms))
    extend("two_circle_bisector", bisector)

    three_shell: set[Clause] = set()
    for arity, equalities in cegar.THREE_SHELL_ROTATION_SCHEMAS:
        for positions in combinations(range(len(cegar.ORDER)), arity):
            points = tuple(cegar.ORDER[position] for position in positions)
            atoms = tuple(sorted(
                (points[center], points[endpoint])
                for center, left, right in equalities
                for endpoint in (left, right)
            ))
            three_shell.add(tuple(-var[atom] for atom in atoms))
    extend("three_shell_rotation_bank", three_shell)

    schema_c: set[Clause] = set()
    for cyclic_order in (cegar.ORDER, tuple(reversed(cegar.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 7):
                point_a, point_b, point_c, point_d, point_e, point_f, point_g = (
                    rotated[position] for position in positions
                )
                atoms = tuple(sorted((
                    (point_a, point_f),
                    (point_a, point_b),
                    (point_f, point_a),
                    (point_f, point_d),
                    (point_f, point_g),
                    (point_c, point_d),
                    (point_c, point_g),
                    (point_e, point_f),
                    (point_e, point_b),
                )))
                schema_c.add(tuple(-var[atom] for atom in atoms))
    extend("seven_point_schema_c", schema_c)

    schema_f: set[Clause] = set()
    for cyclic_order in (cegar.ORDER, tuple(reversed(cegar.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 7):
                point_a, point_b, point_c, point_d, point_e, point_f, point_g = (
                    rotated[position] for position in positions
                )
                atoms = tuple(sorted((
                    (point_a, point_f), (point_a, point_c),
                    (point_f, point_a), (point_f, point_g), (point_f, point_c),
                    (point_b, point_f), (point_b, point_e),
                    (point_d, point_b), (point_d, point_e), (point_d, point_g),
                )))
                schema_f.add(tuple(-var[atom] for atom in atoms))
    extend("seven_point_schema_f", schema_f)

    six_point_schemas: dict[str, set[Clause]] = {
        "d": set(),
        "e": set(),
        "g": set(),
        "h": set(),
        "i": set(),
        "j": set(),
    }
    for cyclic_order in (cegar.ORDER, tuple(reversed(cegar.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 6):
                point_a, point_b, point_c, point_d, point_e, point_f = (
                    rotated[position] for position in positions
                )
                atoms_d = (
                    (point_a, point_e), (point_a, point_b),
                    (point_e, point_a), (point_e, point_c), (point_e, point_f),
                    (point_b, point_e), (point_b, point_f),
                    (point_d, point_e), (point_d, point_b), (point_d, point_c),
                )
                atoms_e = (
                    (point_a, point_f), (point_a, point_d),
                    (point_e, point_b), (point_e, point_c),
                    (point_b, point_a), (point_b, point_c), (point_b, point_d),
                    (point_c, point_f), (point_c, point_b),
                )
                atoms_g = (
                    (point_a, point_b), (point_a, point_d),
                    (point_b, point_c), (point_b, point_f),
                    (point_c, point_b), (point_c, point_d),
                    (point_e, point_c), (point_e, point_f),
                )
                atoms_h = (
                    (point_a, point_b), (point_a, point_d),
                    (point_c, point_e), (point_c, point_f),
                    (point_e, point_d), (point_e, point_f),
                    (point_f, point_b), (point_f, point_e),
                )
                atoms_i = (
                    (point_a, point_b), (point_a, point_e),
                    (point_d, point_b), (point_d, point_e),
                    (point_b, point_c), (point_b, point_f),
                    (point_e, point_c), (point_e, point_f),
                )
                atoms_j = (
                    (point_a, point_b), (point_a, point_d),
                    (point_b, point_a), (point_b, point_c),
                    (point_e, point_a), (point_e, point_b),
                    (point_f, point_c), (point_f, point_d),
                )
                six_point_schemas["d"].add(
                    tuple(-var[atom] for atom in sorted(atoms_d))
                )
                six_point_schemas["e"].add(
                    tuple(-var[atom] for atom in sorted(atoms_e))
                )
                six_point_schemas["g"].add(
                    tuple(-var[atom] for atom in sorted(atoms_g))
                )
                six_point_schemas["h"].add(
                    tuple(-var[atom] for atom in sorted(atoms_h))
                )
                six_point_schemas["i"].add(
                    tuple(-var[atom] for atom in sorted(atoms_i))
                )
                six_point_schemas["j"].add(
                    tuple(-var[atom] for atom in sorted(atoms_j))
                )
    extend("six_point_schema_d", six_point_schemas["d"])
    extend("six_point_schema_e", six_point_schemas["e"])
    extend("six_point_schema_g", six_point_schemas["g"])
    extend("six_point_schema_h", six_point_schemas["h"])
    extend("six_point_schema_i", six_point_schemas["i"])
    extend("six_point_schema_j", six_point_schemas["j"])

    learned = [
        tuple(
            -var[row.center, point]
            for row in pattern
            for point in row.support
        )
        for pattern in initial_patterns
    ]
    extend("initial_learned_patterns", learned)
    return clauses, blocks


def write_dimacs(path: Path, variable_count: int, clauses: list[Clause]) -> str:
    digest = hashlib.sha256()
    with path.open("wb") as handle:
        header = f"p cnf {variable_count} {len(clauses)}\n".encode()
        handle.write(header)
        digest.update(header)
        for clause in clauses:
            line = (" ".join(str(literal) for literal in clause) + " 0\n").encode()
            handle.write(line)
            digest.update(line)
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--initial-patterns-glob")
    args = parser.parse_args()

    var = variable_map()
    patterns = load_initial_patterns(args.initial_patterns_glob)
    clauses, blocks = build_clauses(var, patterns)
    digest = write_dimacs(args.output, len(var), clauses)
    manifest = {
        "schema": "rigid221-exact17-fullcover-boolean-cnf/v1",
        "cnf": str(args.output),
        "cnf_sha256": digest,
        "variables": len(var),
        "clauses": len(clauses),
        "clause_blocks": blocks,
        "initial_pattern_count": len(patterns),
        "variable_map": {
            str(identifier): {"center": center, "point": point}
            for (center, point), identifier in var.items()
        },
    }
    with args.manifest.open("w") as handle:
        json.dump(manifest, handle, indent=2, sort_keys=True)
        handle.write("\n")
    print(json.dumps({key: manifest[key] for key in (
        "cnf_sha256", "variables", "clauses", "clause_blocks",
        "initial_pattern_count",
    )}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
