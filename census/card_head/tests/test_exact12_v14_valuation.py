from __future__ import annotations

import copy
import json
import unittest
from dataclasses import replace

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_v14_schedule import (
    NAMED_DELETION_ARMS,
    cells,
)
from census.card_head.exact12_v14_valuation import (
    ARM_SPEC,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    XU,
    XV,
    C,
    Exact12V14ValuationError,
    O,
    U,
    added_constraints_hold,
    build_clause_delta_artifact,
    compile_cell,
    decode_blockers,
    validate_clause_delta_artifact,
)
from census.card_head.source_faithful_candidate_surface import (
    SourceFaithfulCoverInstance,
)

CELL = cells()[0]


def fresh_instance() -> SourceFaithfulCoverInstance:
    return SourceFaithfulCoverInstance(build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE))


def replay_fixture() -> tuple[dict[int, set[int]], dict[int, int]]:
    """Return a small positive replay witness for ``cells()[0]``."""

    # CELL has (joint_deletion, v) = (0, 2).  The selected blocker centers are
    # deliberately distinct and avoid both the source and the omitted center.
    blockers = {U: XV, XV: C, XU: 3, 0: 4, 2: 5}
    cube = {
        0: {C, 3, 4, 5},
        1: {U, 0, 2, XV},
        2: {3, 4, 5},
        3: {XU, 0, 4, 5},
        4: {0, 2, 3, 5},
        5: {2, XV, 3, 4},
        6: {3, 4, 5},
        7: {U, XV, 3, 4},
        8: {U, XU, 3, 4},
        9: {3, 4, 5},
        10: {3, 4, 5},
        11: {3, 4, 5},
    }
    return cube, blockers


class Exact12V14ValuationTest(unittest.TestCase):
    def test_compile_is_deterministic_on_fresh_instances(self) -> None:
        first = compile_cell(fresh_instance(), CELL)
        second = compile_cell(fresh_instance(), CELL)

        self.assertEqual(first, second)
        self.assertEqual(first.manifest(), second.manifest())
        self.assertEqual(first.base_n_variables, 42560)
        self.assertEqual(first.base_n_clauses, 368075)
        self.assertGreater(first.final_n_variables, first.base_n_variables)
        self.assertGreater(first.final_n_clauses, first.base_n_clauses)

    def test_all_648_schedule_cells_compile(self) -> None:
        pristine = fresh_instance()
        failures: list[tuple[int, str]] = []
        compiled_count = 0

        for index, cell in enumerate(cells()):
            try:
                compiled = compile_cell(copy.deepcopy(pristine), cell)
            except Exact12V14ValuationError as exc:
                failures.append((index, str(exc)))
            else:
                compiled_count += 1
                self.assertEqual(compiled.cell, cell)

        self.assertEqual(len(cells()), 648)
        self.assertEqual(
            failures,
            [],
            f"{compiled_count} cells compiled; first failures: {failures[:5]}",
        )

    def test_manifest_is_non_closing_status(self) -> None:
        manifest = compile_cell(fresh_instance(), CELL).manifest()

        self.assertEqual(
            manifest["semantic_status"], "FINITE_SOURCE_PREDICATE_COMPILER"
        )
        self.assertIn("no terminal", manifest["scope"])
        self.assertIn("no", manifest["scope"])
        self.assertNotIn("proof_verified", manifest)
        self.assertNotIn("unsat", manifest["semantic_status"].lower())
        self.assertEqual(
            json.dumps(manifest, sort_keys=True),
            json.dumps(compile_cell(fresh_instance(), CELL).manifest(), sort_keys=True),
        )

    def test_clause_delta_artifact_matches_complete_dimacs_suffix(self) -> None:
        instance = fresh_instance()
        compiled = compile_cell(instance, CELL)
        dimacs = instance.dimacs()

        artifact = build_clause_delta_artifact(compiled, dimacs)
        validate_clause_delta_artifact(artifact, compiled, dimacs)

        self.assertEqual(
            artifact["clause_delta"], [list(clause) for clause in compiled.clause_delta]
        )
        self.assertEqual(
            artifact["counts"]["delta_clauses"],
            compiled.final_n_clauses - compiled.base_n_clauses,
        )
        self.assertEqual(
            artifact["hashes"]["clause_delta_sha256"], compiled.clause_delta_sha256
        )

    def test_clause_delta_artifact_rejects_order_and_dimacs_tampering(self) -> None:
        instance = fresh_instance()
        compiled = compile_cell(instance, CELL)
        dimacs = instance.dimacs()
        artifact = build_clause_delta_artifact(compiled, dimacs)

        reordered = copy.deepcopy(artifact)
        reordered["clause_delta"][0], reordered["clause_delta"][1] = (
            reordered["clause_delta"][1],
            reordered["clause_delta"][0],
        )
        with self.assertRaisesRegex(Exact12V14ValuationError, "compiled ordered"):
            validate_clause_delta_artifact(reordered, compiled, dimacs)

        shifted_boundary = copy.deepcopy(artifact)
        shifted_boundary["counts"]["base_clauses"] += 1
        with self.assertRaisesRegex(Exact12V14ValuationError, "compiled cell"):
            validate_clause_delta_artifact(shifted_boundary, compiled, dimacs)

        lines = dimacs.splitlines()
        first_suffix_line = compiled.base_n_clauses + 1
        literals = lines[first_suffix_line].split()
        literals[0] = str(-int(literals[0]))
        lines[first_suffix_line] = " ".join(literals)
        tampered_dimacs = "\n".join(lines) + "\n"
        with self.assertRaisesRegex(Exact12V14ValuationError, "complete DIMACS suffix"):
            validate_clause_delta_artifact(artifact, compiled, tampered_dimacs)

    def test_pristine_instance_and_tampered_or_type_confused_cell_rejected(
        self,
    ) -> None:
        instance = fresh_instance()
        compile_cell(instance, CELL)
        with self.assertRaisesRegex(Exact12V14ValuationError, "pristine"):
            compile_cell(instance, CELL)

        tampered_instance = fresh_instance()
        tampered_instance.cnf.add_clause((1,))
        with self.assertRaisesRegex(Exact12V14ValuationError, "pristine"):
            compile_cell(tampered_instance, CELL)

        with self.assertRaisesRegex(Exact12V14ValuationError, "coordinates"):
            compile_cell(fresh_instance(), replace(CELL, v=3))
        with self.assertRaisesRegex(Exact12V14ValuationError, "wrong type"):
            compile_cell(fresh_instance(), object())  # type: ignore[arg-type]
        with self.assertRaisesRegex(Exact12V14ValuationError, "plain integers"):
            compile_cell(fresh_instance(), replace(CELL, v=True))

    def test_every_named_arm_replays_positive_and_negative(self) -> None:
        for arm in NAMED_DELETION_ARMS:
            with self.subTest(arm=arm):
                cell = replace(CELL, arm=arm)
                cube, blockers = replay_fixture()
                self.assertTrue(added_constraints_hold(cell, cube, blockers))

                source, deletion = ARM_SPEC[arm]
                negative_cube = copy.deepcopy(cube)
                negative_cube[blockers[source]].add(deletion)
                self.assertFalse(added_constraints_hold(cell, negative_cube, blockers))

    def test_distinguished_d_replays_positive_and_negative(self) -> None:
        cube, blockers = replay_fixture()
        self.assertTrue(added_constraints_hold(CELL, cube, blockers))

        missing_c = copy.deepcopy(cube)
        missing_c[0].remove(C)
        self.assertFalse(added_constraints_hold(CELL, missing_c, blockers))

        contains_xu = copy.deepcopy(cube)
        contains_xu[0].add(XU)
        self.assertFalse(added_constraints_hold(CELL, contains_xu, blockers))

        forbidden = copy.deepcopy(cube)
        forbidden[0].update((O, U))
        forbidden[7].update((O, 0))
        self.assertFalse(added_constraints_hold(CELL, forbidden, blockers))

    def test_decode_blockers_requires_exactly_one_center_per_source(self) -> None:
        compiled = compile_cell(fresh_instance(), CELL)
        by_source: dict[int, list[int]] = {}
        for (source, _center), variable in compiled.blocker_variables.items():
            by_source.setdefault(source, []).append(variable)

        source = min(by_source)
        selected = {variables[0] for variables in by_source.values()}
        self.assertEqual(
            decode_blockers(selected, compiled.blocker_variables)[source],
            next(
                center
                for (
                    candidate_source,
                    center,
                ), variable in compiled.blocker_variables.items()
                if candidate_source == source and variable == by_source[source][0]
            ),
        )

        missing = selected - {by_source[source][0]}
        with self.assertRaisesRegex(Exact12V14ValuationError, "selects 0"):
            decode_blockers(missing, compiled.blocker_variables)

        multiple = selected | {by_source[source][1]}
        with self.assertRaisesRegex(Exact12V14ValuationError, "selects 2"):
            decode_blockers(multiple, compiled.blocker_variables)


if __name__ == "__main__":
    unittest.main()
