#!/usr/bin/env python3
"""Tiny, solver-local unit tests for the v11 Boolean prepass."""

from __future__ import annotations

import copy
import contextlib
import hashlib
import io
import json
import tempfile
import unittest
from collections import defaultdict
from pathlib import Path
from unittest import mock

import z3

import round5_cegar_v9 as v9
import round5_cegar_v11 as v11


class FakeEncoding:
    def __init__(self) -> None:
        b = z3.Bool("filter_b")
        r = z3.Real("filter_r")
        i = z3.Int("filter_i")
        self.groups = defaultdict(list, {
            "bool": [b, z3.Or(b, z3.Not(b)), z3.BoolVal(True)],
            "real": [r >= 0],
            "int": [i >= 0],
            "mixed": [z3.Implies(b, r >= 1)],
        })


class CertificateEncoding(FakeEncoding):
    def __init__(self, case: v11.Case) -> None:
        super().__init__()
        self.case = case
        self.row = {}
        self.rich = {}
        constraints = []
        for row in range(5):
            support = [z3.Bool(f"cert_r{row}_p{point}") for point in v9.POINTS]
            self.rich[0, row] = {"support": support}
            for column, point in enumerate([10, 11, 12, 13, 14]):
                constraints.append(z3.Not(support[point]) if row == column else support[point])
        self.groups = {"certificate_bits": constraints}


def valid_power_record(case: v11.Case) -> dict[str, object]:
    columns = [10, 11, 12, 13, 14]
    rows = [{"name": f"rich_0_{i}", "kind": "rich_full_class"} for i in range(5)]
    zeros = [
        {
            "row_index": row,
            "row": f"rich_0_{row}",
            "column_index": col,
            "point": columns[col],
        }
        for row in range(5) for col in range(5) if row != col
    ]
    eliminated = []
    for permutation in v9.PERMUTATIONS_5:
        if permutation == tuple(range(5)):
            continue
        blocker = next(row for row in range(5) if permutation[row] != row)
        eliminated.append({
            "permutation_points": [columns[col] for col in permutation],
            "forced_zero_blocker": {
                "row_index": blocker, "row": f"rich_0_{blocker}",
                "column_index": permutation[blocker],
                "point": columns[permutation[blocker]],
            },
        })
    return {
        "family": "power_pattern_rank4_full_shell",
        "lean_theorem": v11.POWER_THEOREM,
        "schema_arm": v11._required_schema_arm(case),
        "antecedent": v11.POWER_ANTECEDENT,
        "permutations_enumerated": 120,
        "rows": rows, "columns": columns, "forced_zero_cells": zeros,
        "certified_nonzero_matching": [
            {"row_index": row, "row": f"rich_0_{row}", "column_index": row, "point": columns[row]}
            for row in range(5)
        ],
        "eliminated_permutations": eliminated,
        "unique_surviving_permutation_points": columns,
    }


class V11PrepassTests(unittest.TestCase):
    def test_variable_sort_filter_is_individual_and_bool_only(self) -> None:
        solver, audit = v11.build_boolean_relaxation(FakeEncoding(), 1000, 97)
        self.assertEqual(audit.included_total, 3)
        self.assertEqual(audit.excluded_total, 3)
        self.assertEqual(audit.excluded_by_family, {"int": 1, "mixed": 1, "real": 1})
        self.assertEqual(solver.check(), z3.sat)

    def test_gate_inserts_before_first_check_and_rejects_late_prepass_cut(self) -> None:
        solver = z3.Solver()
        gate = v11.FullSolverGate(solver)
        b = z3.Bool("gate_b")
        gate.add_pre_first_cut(b, "track_gate_pre")
        first_hash = v11.formula_sha256(solver)
        self.assertEqual(gate.check(), z3.sat)
        self.assertTrue(gate.first_check_started)
        self.assertEqual(gate.pre_first_cut_count, 1)
        self.assertIn("gate_b", solver.sexpr())
        self.assertEqual(first_hash, v11.formula_sha256(solver))
        with self.assertRaises(RuntimeError):
            gate.add_pre_first_cut(z3.Not(b), "track_gate_too_late")

    def test_prepass_carries_admitted_cut_before_any_full_check(self) -> None:
        case = v11.Case("paired", "SSS", 0, 1, None)
        encoding = CertificateEncoding(case)
        full = z3.Solver()
        gate = v11.FullSolverGate(full)
        record = valid_power_record(case)
        cut = v11.reconstruct_certified_cut(encoding, record, case)

        def miner(_encoding, model, _budget):
            self.assertTrue(z3.is_false(model.eval(cut, model_completion=True)))
            return cut, record

        report, learned, _ = v11.run_boolean_prepass(
            encoding, gate, v11.PrepassConfig(1000, 10, 1), 97, miner
        )
        self.assertEqual(report["status"], "unsat")
        self.assertTrue(report["sound_full_case_unsat"])
        self.assertEqual(len(learned), 1)
        self.assertEqual(gate.pre_first_cut_count, 1)
        self.assertEqual(gate.check_count, 0)
        self.assertEqual(
            learned[0][1]["admission"]["cut_sexpr_sha256"],
            hashlib.sha256(cut.sexpr().encode()).hexdigest(),
        )

    def test_valid_certificate_rejects_unrelated_cut(self) -> None:
        case = v11.Case("paired", "SSS", 0, 1, None)
        encoding = CertificateEncoding(case)
        solver, _ = v11.build_boolean_relaxation(encoding, 1000, 97)
        self.assertEqual(solver.check(), z3.sat)
        unrelated = z3.Bool("unrelated_adversarial_bit")
        solver.add(unrelated)
        self.assertEqual(solver.check(), z3.sat)
        with self.assertRaisesRegex(AssertionError, "not the formula reconstructed"):
            v11.admit_cut(
                encoding,
                z3.Not(unrelated),
                valid_power_record(case),
                case,
                solver.model(),
                "boolean_prepass",
                "0" * 64,
                v11.file_sha256(v11.HERE / "round5_cegar_v9.py"),
            )

    def test_certificate_rows_kinds_cells_and_points_are_encoding_bound(self) -> None:
        case = v11.Case("paired", "SSS", 0, 1, None)
        encoding = CertificateEncoding(case)
        record = valid_power_record(case)
        mutations = []
        wrong_name = copy.deepcopy(record)
        wrong_name["rows"][0]["name"] = "rich_9_9"
        mutations.append(wrong_name)
        wrong_kind = copy.deepcopy(record)
        wrong_kind["rows"][0]["kind"] = "critical_full_row"
        mutations.append(wrong_kind)
        wrong_point = copy.deepcopy(record)
        wrong_point["forced_zero_cells"][0]["point"] = 9
        mutations.append(wrong_point)
        wrong_cell_row = copy.deepcopy(record)
        wrong_cell_row["certified_nonzero_matching"][0]["row"] = "rich_0_4"
        mutations.append(wrong_cell_row)
        for bad_record in mutations:
            with self.assertRaises(AssertionError):
                v11.reconstruct_certified_cut(encoding, bad_record, case)

    def test_admitted_cut_hash_and_miner_hash_fail_closed(self) -> None:
        case = v11.Case("paired", "SSS", 0, 1, None)
        encoding = CertificateEncoding(case)
        solver, _ = v11.build_boolean_relaxation(encoding, 1000, 97)
        self.assertEqual(solver.check(), z3.sat)
        record = valid_power_record(case)
        cut = v11.reconstruct_certified_cut(encoding, record, case)
        miner_hash = v11.file_sha256(v11.HERE / "round5_cegar_v9.py")
        admitted = v11.admit_cut(
            encoding, cut, record, case, solver.model(),
            "boolean_prepass", "0" * 64, miner_hash,
        )
        v11.verify_admitted_cut(encoding, cut, admitted, case, miner_hash)
        bad_cut_hash = copy.deepcopy(admitted)
        bad_cut_hash["admission"]["cut_sexpr_sha256"] = "f" * 64
        with self.assertRaisesRegex(AssertionError, "expression hash mismatch"):
            v11.verify_admitted_cut(encoding, cut, bad_cut_hash, case, miner_hash)
        with self.assertRaisesRegex(AssertionError, "unvalidated miner hash"):
            v11.verify_admitted_cut(encoding, cut, admitted, case, "f" * 64)

    def test_all_120_permutations_are_required(self) -> None:
        record = valid_power_record(v11.Case("paired", "SSS", 0, 1, None))
        v9.verify_power_certificate(record)
        broken = copy.deepcopy(record)
        broken["eliminated_permutations"].pop()
        with self.assertRaises(AssertionError):
            v9.verify_power_certificate(broken)

    def test_incomplete_provenance_fails_closed(self) -> None:
        case = v11.Case("paired", "SSS", 0, 1, None)
        bit = z3.Bool("fail_closed_source_bit")
        incomplete = {
            "family": "power_pattern_rank4_full_shell",
            "lean_theorem": v11.POWER_THEOREM,
            "schema_arm": v11._required_schema_arm(case),
            "antecedent": "five full shells",
            "permutations_enumerated": 120,
        }
        with self.assertRaises((AssertionError, KeyError)):
            v11.verify_cut_provenance(
                CertificateEncoding(case), z3.Not(bit), incomplete, case
            )
        encoding = CertificateEncoding(case)
        encoding.groups["bit"] = [bit]
        gate = v11.FullSolverGate(z3.Solver())

        def bad_miner(_encoding, _model, _budget):
            return z3.Not(bit), incomplete

        with self.assertRaises((AssertionError, KeyError)):
            v11.run_boolean_prepass(
                encoding, gate, v11.PrepassConfig(1000, 10, 1), 97, bad_miner
            )
        self.assertEqual(gate.pre_first_cut_count, 0)
        self.assertEqual(gate.check_count, 0)

    def test_frozen_provenance_mismatch_fails_before_encoding(self) -> None:
        case = v11.Case("paired", "SSS", 0, 1, None)
        frozen = v11.provenance()
        frozen["miner_v9_script_sha256"] = "0" * 64
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parent) as temp_dir:
            with mock.patch.object(v11, "Encoding") as constructor:
                result = v11.solve_case(
                    case, 10, Path(temp_dir), frozen_provenance=frozen,
                    expected_script_sha256=str(frozen["script_sha256"]),
                )
        constructor.assert_not_called()
        self.assertEqual(result["status"], "error")
        for field in (
            "base_v8_script_sha256", "miner_v9_script_sha256", "schema_sha256",
            "uv_lock_sha256", "source_contract",
        ):
            mutated = copy.deepcopy(v11.provenance())
            mutated[field] = "changed"
            with self.assertRaisesRegex(RuntimeError, field):
                v11.verify_frozen_provenance(mutated)

    def test_worker_bounds(self) -> None:
        parser = v11.parser()
        for count in ("1", "24"):
            self.assertEqual(parser.parse_args(["matrix", "--workers", count]).workers, int(count))
        for count in ("0", "-1", "25"):
            with contextlib.redirect_stderr(io.StringIO()):
                with self.assertRaises(SystemExit):
                    parser.parse_args(["matrix", "--workers", count])

    def test_matrix_completeness_requires_no_unknown_or_error(self) -> None:
        cases = [
            v11.Case("paired", "SSS", 0, 1, None),
            v11.Case("paired", "SSS", 0, 2, None),
        ]
        terminal = [
            {"case_id": cases[0].case_id, "status": "unsat"},
            {"case_id": cases[1].case_id, "status": "sat"},
        ]
        self.assertTrue(v11.matrix_is_complete(cases, terminal))
        unknown = copy.deepcopy(terminal)
        unknown[1]["status"] = "unknown"
        self.assertFalse(v11.matrix_is_complete(cases, unknown))
        error = copy.deepcopy(terminal)
        error[1]["status"] = "error"
        self.assertFalse(v11.matrix_is_complete(cases, error))
        self.assertFalse(v11.matrix_is_complete(cases, terminal[:1]))
        duplicate = [terminal[0], terminal[0]]
        self.assertFalse(v11.matrix_is_complete(cases, duplicate))

    def test_retry_authenticates_v8_and_hashes_consumed_bytes(self) -> None:
        payload = {**v9.v8.provenance(), "results": []}
        source_bytes = json.dumps(payload, sort_keys=True).encode()
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parent) as temp_dir:
            path = Path(temp_dir) / "summary.json"
            path.write_bytes(source_bytes)
            loaded, digest = v11.load_authenticated_v8_summary(path)
            self.assertEqual(loaded, payload)
            self.assertEqual(digest, hashlib.sha256(source_bytes).hexdigest())
            v11_payload = {**v11.provenance(), "results": []}
            path.write_bytes(json.dumps(v11_payload).encode())
            with self.assertRaisesRegex(ValueError, "authenticated current v8"):
                v11.load_authenticated_v8_summary(path)


if __name__ == "__main__":
    unittest.main()
