#!/usr/bin/env python3
"""Cross-check the exact-17 direct Boolean CNF against its source encoder.

This validator is deliberately independent of solver verdicts.  It compares
every static theorem-cut family by a commutative multiset digest, exhaustively
checks the direct cardinality encodings, and round-trips SAT assignments
between the structural CNF and the source Z3 formulation.
"""

from __future__ import annotations

import argparse
import gc
import hashlib
import json
import subprocess
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path

import export_source_faithful_boolean_cnf as export
import z3

MASK = (1 << 256) - 1
STATIC_BLOCKS = (
    "kalmanson_core",
    "two_circle_bisector",
    "three_shell_rotation_bank",
    "seven_point_schema_c",
    "seven_point_schema_f",
    "six_point_schema_d",
    "six_point_schema_e",
    "six_point_schema_g",
    "six_point_schema_h",
    "six_point_schema_i",
    "six_point_schema_j",
    "two_rows_shared_late_pair",
    "direct_shared_middle_endpoint_pair",
    "direct_five_ccw_three_rows",
    "direct_six_ccw_two_k2_three_rows",
)
STRUCTURAL_BLOCKS = (
    "exact_four",
    "two_center_common_hit",
    "source_coverage",
    "named_row_units",
    "old_row_cap_units",
    "old_row_outside_partition",
    "fifth_center_exactly_one",
    "fifth_row_source_and_one_hit",
)


@dataclass
class Digest:
    count: int = 0
    xor: int = 0
    total: int = 0
    square_total: int = 0

    def add(self, clause: tuple[int, ...]) -> None:
        canonical = tuple(sorted(clause))
        raw = " ".join(str(literal) for literal in canonical).encode()
        value = int.from_bytes(hashlib.sha256(raw).digest(), "big")
        self.count += 1
        self.xor ^= value
        self.total = (self.total + value) & MASK
        self.square_total = (self.square_total + value * value) & MASK

    def record(self) -> dict[str, int | str]:
        return {
            "count": self.count,
            "xor": f"{self.xor:064x}",
            "sum": f"{self.total:064x}",
            "square_sum": f"{self.square_total:064x}",
        }


def digest_clauses(clauses, start: int, count: int) -> Digest:
    result = Digest()
    for clause in clauses[start : start + count]:
        result.add(clause)
    return result


def clause_from_z3(expression, variable_map) -> tuple[int, ...]:
    arguments = expression.children() if z3.is_or(expression) else (expression,)
    literals: list[int] = []
    for argument in arguments:
        negative = z3.is_not(argument)
        atom = argument.arg(0) if negative else argument
        name = atom.decl().name()
        prefix, center, point = name.split("_")
        if prefix != "selected":
            raise AssertionError(f"unexpected source atom {name}")
        literal = variable_map[int(center), int(point)]
        literals.append(-literal if negative else literal)
    return tuple(sorted(literals))


class DigestCapture:
    def __init__(self, variable_map, split_after: int | None = None):
        self.variable_map = variable_map
        self.split_after = split_after
        self.digests = [Digest(), Digest()]
        self.count = 0

    def add(self, expression) -> None:
        index = int(self.split_after is not None and self.count >= self.split_after)
        self.digests[index].add(clause_from_z3(expression, self.variable_map))
        self.count += 1


def block_ranges(blocks: dict[str, int]) -> dict[str, tuple[int, int]]:
    ranges = {}
    offset = 0
    for name, count in blocks.items():
        ranges[name] = (offset, count)
        offset += count
    return ranges


def evaluate_clause(clause, assignment: dict[int, bool]) -> bool:
    return any(
        assignment[abs(literal)] if literal > 0 else not assignment[abs(literal)]
        for literal in clause
    )


def check_exactly_k() -> dict[str, int]:
    checked = {}
    for size, target in ((4, 1), (13, 1), (16, 4)):
        variables = list(range(1, size + 1))
        clauses = export.exactly_k(variables, target)
        for bits in range(1 << size):
            assignment = {
                variable: bool(bits & (1 << (variable - 1)))
                for variable in variables
            }
            encoded = all(evaluate_clause(clause, assignment) for clause in clauses)
            expected = bits.bit_count() == target
            if encoded != expected:
                raise AssertionError(
                    f"exactly_k mismatch for size={size}, k={target}, bits={bits}"
                )
        checked[f"{size}_choose_{target}"] = 1 << size
    return checked


def assignment_from_z3(model, selected, fifth, variable_map, fifth_map):
    assignment = {
        variable_map[key]: z3.is_true(model.eval(atom, model_completion=True))
        for key, atom in selected.items()
    }
    assignment.update({
        fifth_map[center]: z3.is_true(model.eval(atom, model_completion=True))
        for center, atom in fifth.items()
    })
    return assignment


def parse_cadical_model(stdout: str, variable_count: int) -> dict[int, bool]:
    values = [
        int(token)
        for line in stdout.splitlines()
        if line.startswith("v ")
        for token in line.split()[1:]
        if token != "0"
    ]
    assignment = {abs(value): value > 0 for value in values}
    missing = set(range(1, variable_count + 1)) - set(assignment)
    if missing:
        raise AssertionError(f"CaDiCaL model omitted {len(missing)} variables")
    return assignment


def pin_assignment(solver, selected, fifth, assignment, variable_map, fifth_map):
    for key, atom in selected.items():
        solver.add(atom == assignment[variable_map[key]])
    for center, atom in fifth.items():
        solver.add(atom == assignment[fifth_map[center]])


def dimacs_digest(variable_count: int, clauses: list[tuple[int, ...]]) -> str:
    """Hash the exact DIMACS serialization without writing the candidate."""

    digest = hashlib.sha256()
    digest.update(f"p cnf {variable_count} {len(clauses)}\n".encode())
    for clause in clauses:
        digest.update((" ".join(str(literal) for literal in clause) + " 0\n").encode())
    return digest.hexdigest()


def independent_comparison_variables(
    first_variable: int,
) -> dict[tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]]:
    """Reconstruct the equality-comparison auxiliary IDs independently."""

    next_variable = first_variable + (
        len(tuple(combinations(export.source.POINTS, 2)))
        * export.DISTANCE_LABEL_BITS
    )
    result = {}
    edges = tuple(combinations(export.source.POINTS, 2))
    for comparison in combinations(edges, 2):
        result[comparison] = tuple(
            range(next_variable, next_variable + export.DISTANCE_LABEL_BITS)
        )
        next_variable += export.DISTANCE_LABEL_BITS
    return result


def independent_five_point_digest(
    order: tuple[int, ...],
    comparison_variables: dict[
        tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]
    ],
) -> Digest:
    """Independently enumerate every ConvexFivePointCore equality pattern."""

    forbidden = set()
    for cyclic_order in (order, tuple(reversed(order))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            point_a = rotated[0]
            for positions in combinations(range(1, len(rotated)), 4):
                point_x, point_b, point_c, point_y = (
                    rotated[position] for position in positions
                )
                comparisons = (
                    (export.distance_edge(point_x, point_a), export.distance_edge(point_x, point_b)),
                    (export.distance_edge(point_y, point_a), export.distance_edge(point_y, point_b)),
                    (export.distance_edge(point_c, point_b), export.distance_edge(point_c, point_x)),
                    (export.distance_edge(point_c, point_b), export.distance_edge(point_c, point_y)),
                )
                forbidden.add(tuple(sorted(tuple(sorted(pair)) for pair in comparisons)))
    result = Digest()
    for obstruction in sorted(forbidden):
        result.add(tuple(
            xor_bit
            for comparison in obstruction
            for xor_bit in comparison_variables[comparison]
        ))
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument("--positions", type=export.parse_positions, required=True)
    parser.add_argument("--samples", type=int, default=3)
    parser.add_argument("--cadical-timeout", type=int, default=120)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    args = parser.parse_args()
    export.verify_static_schema_lean_consumers()

    order = export.source.normalized_order(args.order, args.positions)
    manifest = json.loads(args.manifest.read_text())
    if manifest.get("order_index") != args.order:
        raise AssertionError("manifest order does not match command line")
    if manifest.get("anonymous_positions") != list(args.positions):
        raise AssertionError("manifest positions do not match command line")
    if manifest.get("order") != list(order):
        raise AssertionError("manifest normalized order is wrong")
    recorded_cnf = (export.REPO / manifest["cnf"]).resolve()
    if recorded_cnf != args.cnf.resolve():
        raise AssertionError("manifest names a different candidate CNF")
    candidate_sha = export.sha256(args.cnf)
    if candidate_sha != manifest.get("cnf_sha256"):
        raise AssertionError("candidate CNF hash does not match manifest")
    for name, recorded_hash in manifest.get("source_hashes", {}).items():
        source_paths = export.source_dependency_paths()
        if name in source_paths and export.sha256(source_paths[name]) != recorded_hash:
            raise AssertionError(f"manifest source hash drift: {name}")
    transitive = bool(manifest.get("transitive_two_circle"))
    expected_artifact_schema = (
        export.source.TRANSITIVE_TWO_CIRCLE_SCHEMA
        if transitive
        else export.source.SCHEMA
    )
    artifacts = []
    for record in manifest.get("artifacts", ()):
        path = (export.REPO / record["path"]).resolve()
        if export.sha256(path) != record["sha256"]:
            raise AssertionError(f"artifact hash drift: {record['path']}")
        artifacts.append(export.read_artifact(
            path, args.order, args.positions, expected_artifact_schema
        ))
    for record in manifest.get("analyses", ()):
        path = (export.REPO / record["path"]).resolve()
        if export.sha256(path) != record["sha256"]:
            raise AssertionError(f"analysis hash drift: {record['path']}")
        artifacts.append(export.read_analysis(path, args.order, args.positions))
    learned_replay = manifest.get("learned_replay")
    if learned_replay not in ("verified", "skipped_proposal_only"):
        raise AssertionError("unknown manifest learned-replay mode")
    (
        variable_map,
        fifth_map,
        clauses,
        blocks,
        kinds,
        variable_count,
        transitive_metadata,
    ) = export.build_clauses(
        args.order,
        args.positions,
        artifacts,
        120_000,
        replay_learned=learned_replay == "verified",
        transitive_two_circle=transitive,
    )
    if variable_count != manifest.get("variables"):
        raise AssertionError("manifest variable count mismatch")
    if len(clauses) != manifest.get("clauses"):
        raise AssertionError("manifest clause count mismatch")
    if blocks != manifest.get("clause_blocks"):
        raise AssertionError("manifest clause-block counts mismatch")
    if kinds != manifest.get("learned_record_kinds"):
        raise AssertionError("manifest learned-record kinds mismatch")
    if transitive_metadata != manifest.get("transitive_two_circle_metadata"):
        raise AssertionError("manifest transitive metadata mismatch")
    expected_candidate_sha = dimacs_digest(variable_count, clauses)
    if expected_candidate_sha != candidate_sha:
        raise AssertionError("candidate bytes differ from regenerated direct CNF")
    ranges = block_ranges(blocks)

    direct_digests = {
        name: digest_clauses(clauses, *ranges[name]) for name in STATIC_BLOCKS
    }
    structural_clauses = [
        clause
        for name in STRUCTURAL_BLOCKS
        for clause in clauses[
            ranges[name][0] : ranges[name][0] + ranges[name][1]
        ]
    ]

    legacy = export.legacy
    legacy.ORDER = order
    selected_atoms = {
        key: z3.Bool(f"selected_{key[0]}_{key[1]}") for key in variable_map
    }
    source_calls = {
        "kalmanson_core": legacy.add_kalmanson_core_exclusions,
        "two_circle_bisector": legacy.add_two_circle_bisector_exclusions,
        "three_shell_rotation_bank": legacy.add_three_shell_bank_exclusions,
        "seven_point_schema_c": legacy.add_seven_point_schema_c_exclusions,
        "seven_point_schema_f": legacy.add_seven_point_schema_f_exclusions,
    }
    source_digests = {}
    for name, function in source_calls.items():
        capture = DigestCapture(variable_map)
        count = function(capture, selected_atoms)
        if count != blocks[name]:
            raise AssertionError(f"source/direct count mismatch for {name}")
        source_digests[name] = capture.digests[0]

    split = blocks["six_point_schema_d"]
    capture = DigestCapture(variable_map, split_after=split)
    counts = legacy.add_six_point_schema_de_exclusions(capture, selected_atoms)
    if counts != (split, blocks["six_point_schema_e"]):
        raise AssertionError("source/direct count mismatch for six-point schemas")
    source_digests["six_point_schema_d"] = capture.digests[0]
    source_digests["six_point_schema_e"] = capture.digests[1]

    schema_g_clauses = set()
    for cyclic_order in (legacy.ORDER, tuple(reversed(legacy.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 6):
                point_a, point_b, point_c, point_d, point_e, point_f = (
                    rotated[position] for position in positions
                )
                atoms = (
                    (point_a, point_b), (point_a, point_d),
                    (point_b, point_c), (point_b, point_f),
                    (point_c, point_b), (point_c, point_d),
                    (point_e, point_c), (point_e, point_f),
                )
                schema_g_clauses.add(
                    tuple(-variable_map[atom] for atom in sorted(atoms))
                )
    schema_g = Digest()
    for clause in sorted(schema_g_clauses):
        schema_g.add(clause)
    if schema_g.count != blocks["six_point_schema_g"]:
        raise AssertionError("source/direct count mismatch for schema G")
    source_digests["six_point_schema_g"] = schema_g

    schema_h_clauses = set()
    for cyclic_order in (legacy.ORDER, tuple(reversed(legacy.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 6):
                point_a, point_b, point_c, point_d, point_e, point_f = (
                    rotated[position] for position in positions
                )
                atoms = (
                    (point_a, point_b), (point_a, point_d),
                    (point_c, point_e), (point_c, point_f),
                    (point_e, point_d), (point_e, point_f),
                    (point_f, point_b), (point_f, point_e),
                )
                schema_h_clauses.add(
                    tuple(-variable_map[atom] for atom in sorted(atoms))
                )
    schema_h = Digest()
    for clause in sorted(schema_h_clauses):
        schema_h.add(clause)
    if schema_h.count != blocks["six_point_schema_h"]:
        raise AssertionError("source/direct count mismatch for schema H")
    source_digests["six_point_schema_h"] = schema_h

    schema_i_clauses = set()
    for cyclic_order in (legacy.ORDER, tuple(reversed(legacy.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 6):
                point_a, point_b, point_c, point_d, point_e, point_f = (
                    rotated[position] for position in positions
                )
                atoms = (
                    (point_a, point_b), (point_a, point_e),
                    (point_d, point_b), (point_d, point_e),
                    (point_b, point_c), (point_b, point_f),
                    (point_e, point_c), (point_e, point_f),
                )
                schema_i_clauses.add(
                    tuple(-variable_map[atom] for atom in sorted(atoms))
                )
    schema_i = Digest()
    for clause in sorted(schema_i_clauses):
        schema_i.add(clause)
    if schema_i.count != blocks["six_point_schema_i"]:
        raise AssertionError("source/direct count mismatch for schema I")
    source_digests["six_point_schema_i"] = schema_i

    schema_j_clauses = set()
    for cyclic_order in (legacy.ORDER, tuple(reversed(legacy.ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 6):
                point_a, point_b, point_c, point_d, point_e, point_f = (
                    rotated[position] for position in positions
                )
                atoms = (
                    (point_a, point_b), (point_a, point_d),
                    (point_b, point_a), (point_b, point_c),
                    (point_e, point_a), (point_e, point_b),
                    (point_f, point_c), (point_f, point_d),
                )
                schema_j_clauses.add(
                    tuple(-variable_map[atom] for atom in sorted(atoms))
                )
    schema_j = Digest()
    for clause in sorted(schema_j_clauses):
        schema_j.add(clause)
    if schema_j.count != blocks["six_point_schema_j"]:
        raise AssertionError("source/direct count mismatch for schema J")
    source_digests["six_point_schema_j"] = schema_j

    shared_late_pair = Digest()
    for point_a, point_b, point_c, point_d in combinations(order, 4):
        shared_late_pair.add(tuple(sorted((
            -variable_map[point_a, point_c],
            -variable_map[point_a, point_d],
            -variable_map[point_b, point_c],
            -variable_map[point_b, point_d],
        ))))
    if shared_late_pair.count != blocks["two_rows_shared_late_pair"]:
        raise AssertionError("source/direct shared-late-pair count mismatch")
    if shared_late_pair.count != 2_380:
        raise AssertionError("unexpected increasing shared-late-pair count")
    source_digests["two_rows_shared_late_pair"] = shared_late_pair

    direct_middle = Digest()
    for point_a, point_b, point_c, point_d in combinations(order, 4):
        direct_middle.add(tuple(sorted((
            -variable_map[point_b, point_a],
            -variable_map[point_b, point_d],
            -variable_map[point_c, point_a],
            -variable_map[point_c, point_d],
        ))))
    if direct_middle.count != blocks["direct_shared_middle_endpoint_pair"]:
        raise AssertionError("source/direct shared-middle count mismatch")
    if direct_middle.count != 2_380:
        raise AssertionError("unexpected increasing shared-middle count")
    source_digests["direct_shared_middle_endpoint_pair"] = direct_middle

    direct_five = Digest()
    for point_o, point_a, point_y, point_e, point_c in combinations(order, 5):
        direct_five.add(tuple(sorted((
            -variable_map[point_y, point_o],
            -variable_map[point_y, point_e],
            -variable_map[point_o, point_e],
            -variable_map[point_o, point_c],
            -variable_map[point_a, point_c],
            -variable_map[point_a, point_o],
        ))))
    if direct_five.count != blocks["direct_five_ccw_three_rows"]:
        raise AssertionError("source/direct five-ccw count mismatch")
    if direct_five.count != 6_188:
        raise AssertionError("unexpected increasing five-ccw count")
    source_digests["direct_five_ccw_three_rows"] = direct_five

    direct_six = Digest()
    for i0, i1, i2, i3, i4, i5 in combinations(order, 6):
        direct_six.add(tuple(sorted((
            -variable_map[i0, i3],
            -variable_map[i0, i5],
            -variable_map[i1, i4],
            -variable_map[i1, i5],
            -variable_map[i2, i3],
            -variable_map[i2, i4],
        ))))
    if direct_six.count != blocks["direct_six_ccw_two_k2_three_rows"]:
        raise AssertionError("source/direct six-ccw count mismatch")
    if direct_six.count != 12_376:
        raise AssertionError("unexpected increasing six-ccw count")
    source_digests["direct_six_ccw_two_k2_three_rows"] = direct_six

    special = tuple(sorted(((3, 0, 1), (4, 1, 5), (2, 0, 5))))
    if (6, special) not in legacy.THREE_SHELL_ROTATION_SCHEMAS:
        raise AssertionError("legacy 301/415/205 schema is not subsumed by the bank")
    for name in STATIC_BLOCKS:
        if direct_digests[name].record() != source_digests[name].record():
            raise AssertionError(f"source/direct static-clause mismatch for {name}")

    transitive_digests = {}
    if transitive:
        first_transitive_variable = max(fifth_map.values()) + 1
        comparison_variables = independent_comparison_variables(
            first_transitive_variable
        )
        independent_five = independent_five_point_digest(
            order, comparison_variables
        )
        direct_five = digest_clauses(
            clauses, *ranges["transitive_convex_five_point"]
        )
        if independent_five.record() != direct_five.record():
            raise AssertionError("independent/direct five-point clause mismatch")
        if independent_five.count != 61_880:
            raise AssertionError("unexpected independent five-point count")
        transitive_digests["convex_five_point"] = direct_five.record()

    del clauses
    gc.collect()
    truth_tables = check_exactly_k()

    solver, selected, fifth, _ = export.source.build_case(
        order, all_static_cuts=False
    )
    sampled = 0
    for _ in range(args.samples):
        if solver.check() != z3.sat:
            raise AssertionError("source structural encoder unexpectedly exhausted")
        model = solver.model()
        assignment = assignment_from_z3(
            model, selected, fifth, variable_map, fifth_map
        )
        if not all(evaluate_clause(clause, assignment) for clause in structural_clauses):
            raise AssertionError("source Z3 model violates direct structural CNF")
        supports = export.source.supports_from_model(model, selected)
        center = export.source.fifth_center_from_model(model, fifth)
        export.source.verify_model(supports, center)
        solver.add(z3.Or(*(
            atom != assignment[variable_map[key]] for key, atom in selected.items()
        ), *(
            atom != assignment[fifth_map[center]] for center, atom in fifth.items()
        )))
        sampled += 1

    args.report.parent.mkdir(parents=True, exist_ok=True)
    structural_variable_count = max((*variable_map.values(), *fifth_map.values()))
    structural_path = args.report.with_name(
        f"{args.report.stem}-structural-roundtrip.cnf"
    )
    structural_sha = export.write_dimacs(
        structural_path, structural_variable_count, structural_clauses
    )
    result = subprocess.run(
        ["cadical", "-t", str(args.cadical_timeout), str(structural_path)],
        capture_output=True,
        text=True,
        timeout=args.cadical_timeout + 30,
        check=False,
    )
    if result.returncode != 10:
        raise AssertionError(f"CaDiCaL structural round-trip failed: {result.returncode}")
    assignment = parse_cadical_model(result.stdout, structural_variable_count)
    if not all(evaluate_clause(clause, assignment) for clause in structural_clauses):
        raise AssertionError("CaDiCaL emitted a model that violates its CNF")
    solver, selected, fifth, _ = export.source.build_case(
        order, all_static_cuts=False
    )
    pin_assignment(
        solver, selected, fifth, assignment, variable_map, fifth_map
    )
    if solver.check() != z3.sat:
        raise AssertionError("direct structural CNF model is rejected by source Z3")

    report = {
        "schema": "p97-rigid221-exact17-source-cnf-crosscheck-v3",
        "order_index": args.order,
        "anonymous_positions": list(args.positions),
        "order": list(order),
        "status": "PASS",
        "truth_table_assignments": truth_tables,
        "static_clause_digests": {
            name: direct_digests[name].record() for name in STATIC_BLOCKS
        },
        "transitive_clause_digests": transitive_digests,
        "source_z3_models_checked": sampled,
        "cadical_model_roundtrip": "PASS",
        "candidate_cnf": str(args.cnf.resolve().relative_to(export.REPO)),
        "candidate_cnf_sha256": candidate_sha,
        "candidate_manifest": str(
            args.manifest.resolve().relative_to(export.REPO)
        ),
        "candidate_manifest_sha256": export.sha256(args.manifest),
        "candidate_exact_regeneration": "PASS",
        "structural_cnf": str(structural_path.resolve().relative_to(export.REPO)),
        "structural_cnf_sha256": structural_sha,
        "structural_clauses": len(structural_clauses),
        "variables": variable_count,
        "source_hashes": {
            "source_runner": export.sha256(
                export.HERE / "exact17_source_faithful_cegar.py"
            ),
            "direct_exporter": export.sha256(
                export.HERE / "export_source_faithful_boolean_cnf.py"
            ),
            "base_exporter": export.sha256(
                export.HERE / "export_exact17_boolean_cnf.py"
            ),
            "fullcover": export.sha256(export.HERE / "exact17_fullcover_cegar.py"),
            "shared_late_pair": export.sha256(
                export.HERE / "exact17_two_rows_shared_late_pair.py"
            ),
            "direct_row_consumers": export.sha256(
                export.HERE / "exact17_committed_direct_row_consumers.py"
            ),
            "static_schema_lean_consumers": export.sha256(
                export.STATIC_SCHEMA_LEAN_FILE
            ),
        },
    }
    args.report.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": report["status"],
        "report": str(args.report),
        "static_families": len(STATIC_BLOCKS),
        "structural_clauses": len(structural_clauses),
        "source_models": sampled,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
