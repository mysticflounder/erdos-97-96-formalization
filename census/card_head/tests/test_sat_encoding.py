from __future__ import annotations

import itertools
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from census.card_head.candidate_surface import build_model, cube_ok
from census.card_head.sat_encoding import (
    CNF,
    CoverInstance,
    EncodingError,
    solve_cadical,
)


def clause_satisfied(clause, true_variables):
    return any(
        (literal > 0 and literal in true_variables)
        or (literal < 0 and -literal not in true_variables)
        for literal in clause
    )


class SatEncodingTests(unittest.TestCase):
    def test_sinz_at_most_one_has_exact_truth_table(self):
        cnf = CNF()
        inputs = [cnf.new_variable() for _ in range(3)]
        cnf.at_most_sinz(inputs, 1)
        auxiliaries = list(range(4, cnf.n_variables + 1))
        for bits in itertools.product((False, True), repeat=3):
            fixed = {variable for variable, bit in zip(inputs, bits) if bit}
            satisfiable = any(
                all(clause_satisfied(clause, fixed | selected) for clause in cnf.clauses)
                for aux_bits in itertools.product((False, True), repeat=len(auxiliaries))
                for selected in [
                    {
                        variable
                        for variable, bit in zip(auxiliaries, aux_bits)
                        if bit
                    }
                ]
            )
            self.assertEqual(satisfiable, sum(bits) <= 1)

    @classmethod
    def setUpClass(cls):
        cls.model = build_model(12, (6, 5, 4))
        cls.instance = CoverInstance(cls.model)

    def test_card12_654_base_encoding_matches_historical_size(self):
        self.assertEqual(self.instance.base_n_variables, 37310)
        self.assertEqual(self.instance.base_n_clauses, 297119)

    def test_representative_card13_and_card14_encoding_sizes_are_pinned(self):
        expected = {
            (13, (5, 5, 6)): (63966, 635654, 485202),
            (14, (5, 5, 7)): (101122, 1210260, 972279),
        }
        for (cardinality, profile), sizes in expected.items():
            with self.subTest(cardinality=cardinality, profile=profile):
                instance = CoverInstance(build_model(cardinality, profile))
                self.assertEqual(
                    (
                        instance.base_n_variables,
                        instance.base_n_clauses,
                        instance.n_c2_clauses,
                    ),
                    sizes,
                )

    def test_c2_violation_has_the_direct_nand_clause(self):
        first = self.instance.candidate_index(3, {0, 1, 7, 8})
        second = self.instance.candidate_index(4, {0, 1, 7, 9})
        expected = (
            -self.instance.choice_variables[(3, first)],
            -self.instance.choice_variables[(4, second)],
        )
        self.assertIn(expected, self.instance.cnf.clauses)

    def test_pattern_indicator_and_dimacs_header_are_exact(self):
        instance = CoverInstance(self.model)
        containing = instance.candidate_index(3, {4, 5, 7, 10})
        choice = instance.choice_variables[(3, containing)]
        instance.add_pattern_instance({3: {4, 5}})
        indicator = instance.pattern_variables[(3, frozenset({4, 5}))]
        self.assertIn((-choice, indicator), instance.cnf.clauses)
        self.assertEqual(instance.exclusion_clauses[-1], (-indicator,))
        clauses = instance.clauses_with()
        header, *body = instance.dimacs().splitlines()
        self.assertEqual(header, f"p cnf {instance.cnf.n_variables} {len(clauses)}")
        self.assertEqual(len(body), len(clauses))

    def test_decode_model_requires_one_choice_and_rechecks_cube(self):
        with self.assertRaisesRegex(EncodingError, "selects 0"):
            self.instance.decode_model(set())
        malformed = {center: [0, 1, 2, 3] for center in range(12)}
        self.assertFalse(cube_ok(self.model, malformed))

    def test_sat_result_preserves_the_positive_assignment(self):
        class FakeInstance:
            def dimacs(self, _extra_clauses=()):
                return "p cnf 5 0\n"

            def decode_model(self, positive_variables):
                self.positive_variables = set(positive_variables)
                return {0: [1, 2, 3, 4]}

        fake = FakeInstance()
        completed = SimpleNamespace(
            returncode=10,
            stdout="s SATISFIABLE\nv -1 2 5 0\n",
            stderr="",
        )
        with tempfile.TemporaryDirectory() as directory, patch(
            "census.card_head.sat_encoding.subprocess.run",
            return_value=completed,
        ) as run:
            cnf_path = Path(directory) / "model.cnf"
            result = solve_cadical(
                fake,
                cnf_path,
                timeout_seconds=1,
            )
        self.assertEqual(result.verdict, "SAT")
        self.assertEqual(fake.positive_variables, {2, 5})
        self.assertEqual(result.positive_variables, frozenset({2, 5}))
        run.assert_called_once_with(
            ["nice", "-n", "10", "cadical", "-q", "-t", "1", str(cnf_path)],
            capture_output=True,
            text=True,
            timeout=31,
            check=False,
        )

    def test_held_fd_mode_uses_same_inodes_for_solver_and_checker(self):
        class FakeInstance:
            @staticmethod
            def dimacs(_extra_clauses=()):
                return "p cnf 1 1\n-1 0\n"

        with tempfile.TemporaryDirectory() as directory:
            cnf_path = Path(directory) / "held.cnf"
            proof_path = Path(directory) / "held.drat"
            cnf_fd = os.open(cnf_path, os.O_RDWR | os.O_CREAT | os.O_EXCL, 0o600)
            proof_fd = os.open(
                proof_path, os.O_RDWR | os.O_CREAT | os.O_EXCL, 0o600
            )
            try:
                os.write(cnf_fd, b"stale suffix that must be truncated")
                stale_proof = b"stale proof bytes that must be truncated"
                os.write(proof_fd, stale_proof)
                self.assertEqual(
                    os.lseek(proof_fd, 0, os.SEEK_CUR), len(stale_proof)
                )

                def fake_run(command, **_kwargs):
                    if "cadical" in command:
                        self.assertEqual(os.fstat(proof_fd).st_size, 0)
                        self.assertEqual(os.pread(proof_fd, 100, 0), b"")
                        self.assertEqual(os.lseek(proof_fd, 0, os.SEEK_CUR), 0)
                        os.write(proof_fd, b"synthetic proof")
                        return SimpleNamespace(
                            returncode=20,
                            stdout="s UNSATISFIABLE\n",
                            stderr="",
                        )
                    self.assertEqual(
                        os.pread(proof_fd, 100, 0), b"synthetic proof"
                    )
                    self.assertEqual(os.lseek(proof_fd, 0, os.SEEK_CUR), 0)
                    return SimpleNamespace(
                        returncode=0,
                        stdout="s VERIFIED\n",
                        stderr="",
                    )

                with patch(
                    "census.card_head.sat_encoding.subprocess.run",
                    side_effect=fake_run,
                ) as run:
                    result = solve_cadical(
                        FakeInstance(),
                        cnf_path,
                        timeout_seconds=2,
                        proof_path=proof_path,
                        cnf_fd=cnf_fd,
                        proof_fd=proof_fd,
                    )

                self.assertEqual(result.verdict, "UNSAT")
                self.assertTrue(result.proof_verified)
                self.assertEqual(os.pread(cnf_fd, 100, 0), b"p cnf 1 1\n-1 0\n")
                os.fstat(cnf_fd)
                os.fstat(proof_fd)
                solver_call, checker_call = run.call_args_list
                self.assertEqual(
                    solver_call.args[0],
                    [
                        "nice",
                        "-n",
                        "10",
                        "cadical",
                        "-q",
                        "-t",
                        "2",
                        f"/dev/fd/{cnf_fd}",
                        f"/dev/fd/{proof_fd}",
                    ],
                )
                self.assertEqual(
                    checker_call.args[0],
                    [
                        "nice",
                        "-n",
                        "10",
                        "drat-trim",
                        f"/dev/fd/{cnf_fd}",
                        f"/dev/fd/{proof_fd}",
                    ],
                )
                self.assertEqual(solver_call.kwargs["pass_fds"], (cnf_fd, proof_fd))
                self.assertEqual(checker_call.kwargs["pass_fds"], (cnf_fd, proof_fd))
            finally:
                os.close(proof_fd)
                os.close(cnf_fd)

    def test_legacy_proof_mode_keeps_path_argv_and_no_pass_fds(self):
        class FakeInstance:
            @staticmethod
            def dimacs(_extra_clauses=()):
                return "p cnf 0 1\n0\n"

        unsat = SimpleNamespace(returncode=20, stdout="s UNSATISFIABLE\n", stderr="")
        verified = SimpleNamespace(returncode=0, stdout="s VERIFIED\n", stderr="")
        with tempfile.TemporaryDirectory() as directory:
            cnf_path = Path(directory) / "legacy.cnf"
            proof_path = Path(directory) / "legacy.drat"
            proof_path.write_text("synthetic proof", encoding="ascii")
            with patch(
                "census.card_head.sat_encoding.subprocess.run",
                side_effect=(unsat, verified),
            ) as run:
                result = solve_cadical(
                    FakeInstance(), cnf_path, timeout_seconds=2, proof_path=proof_path
                )

        self.assertTrue(result.proof_verified)
        solver_call, checker_call = run.call_args_list
        self.assertEqual(solver_call.args[0][-2:], [str(cnf_path), str(proof_path)])
        self.assertEqual(checker_call.args[0][-2:], [str(cnf_path), str(proof_path)])
        self.assertNotIn("pass_fds", solver_call.kwargs)
        self.assertNotIn("pass_fds", checker_call.kwargs)

    def test_held_fd_mode_requires_exact_open_descriptors(self):
        class FakeInstance:
            @staticmethod
            def dimacs(_extra_clauses=()):
                return "p cnf 0 0\n"

        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "held.cnf"
            for descriptor in (True, -1, 1.5):
                with self.subTest(descriptor=descriptor), self.assertRaisesRegex(
                    EncodingError, "nonnegative exact built-in int"
                ):
                    solve_cadical(FakeInstance(), path, cnf_fd=descriptor)
            closed_fd = os.open(path, os.O_RDWR | os.O_CREAT, 0o600)
            os.close(closed_fd)
            with self.assertRaisesRegex(EncodingError, "valid open descriptor"):
                solve_cadical(FakeInstance(), path, cnf_fd=closed_fd)
            cnf_fd = os.open(path, os.O_RDWR)
            try:
                with self.assertRaisesRegex(
                    EncodingError, "proof_fd must be a nonnegative exact built-in int"
                ):
                    solve_cadical(
                        FakeInstance(),
                        path,
                        proof_path=Path(directory) / "held.drat",
                        cnf_fd=cnf_fd,
                        proof_fd=True,
                    )
                with self.assertRaisesRegex(EncodingError, "must be distinct"):
                    solve_cadical(
                        FakeInstance(),
                        path,
                        proof_path=Path(directory) / "held.drat",
                        cnf_fd=cnf_fd,
                        proof_fd=cnf_fd,
                    )
            finally:
                os.close(cnf_fd)

    def test_held_fd_timeout_does_not_close_caller_descriptor(self):
        class FakeInstance:
            @staticmethod
            def dimacs(_extra_clauses=()):
                return "p cnf 0 0\n"

        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "held.cnf"
            descriptor = os.open(path, os.O_RDWR | os.O_CREAT | os.O_EXCL, 0o600)
            try:
                with patch(
                    "census.card_head.sat_encoding.subprocess.run",
                    side_effect=subprocess.TimeoutExpired("cadical", 31),
                ):
                    result = solve_cadical(
                        FakeInstance(), path, timeout_seconds=1, cnf_fd=descriptor
                    )
                self.assertEqual(result.verdict, "TIMEOUT")
                os.fstat(descriptor)
            finally:
                os.close(descriptor)


if __name__ == "__main__":
    unittest.main()
