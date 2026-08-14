from __future__ import annotations

import copy
import hashlib
import io
import json
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest import mock

from census.card_head import exact12_next_row_arm_cegar as arm_cegar
from census.card_head import exact12_next_row_structural_cegar as structural
from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_valuation import arm_cells, compile_arm_cell
from census.card_head.exact12_v14_ordered_cut_adapter import AdmittedCut
from census.card_head.sat_encoding import EncodingError
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)


def _mocked_replay_inputs() -> tuple[
    SimpleNamespace, SimpleNamespace, dict[int, list[int]]
]:
    cube = {
        center: [
            (center + offset) % 12
            for offset in (1, 2, 3, 4)
        ]
        for center in range(12)
    }
    instance = SimpleNamespace(
        cnf=SimpleNamespace(n_variables=1, clauses=((1,),)),
        model=object(),
        decode_model=lambda _positive: cube,
        clauses_with=lambda: ((1,),),
    )
    base_cell = object()
    compiled = SimpleNamespace(
        cell=SimpleNamespace(arm="u_q", base_cell=lambda: base_cell),
        base=SimpleNamespace(
            blocker_variables={(6, 0): 1},
            distinguished_d_variables={0: 1},
        ),
    )
    return instance, compiled, cube


class Exact12NextRowArmCegarTest(unittest.TestCase):
    def test_replays_source_faithful_arm_witness_assignment(self) -> None:
        instance, compiled, cube = _mocked_replay_inputs()
        with mock.patch.object(
            arm_cegar, "source_faithful_cube_ok", return_value=True
        ) as candidate, mock.patch.object(
            arm_cegar, "added_constraints_hold", return_value=True
        ) as base, mock.patch.object(
            arm_cegar, "named_deletion_arm_holds", return_value=True
        ) as arm:
            decoded, positive, replay = arm_cegar._replay_arm_sat_witness(
                instance, compiled, cube, [1]
            )

        self.assertEqual(decoded, cube)
        self.assertEqual(positive, frozenset({1}))
        self.assertEqual(
            replay,
            {
                "candidate": True,
                "base_added_constraints": True,
                "named_deletion_arm": True,
                "exact_cnf": True,
            },
        )
        candidate.assert_called_once_with(instance.model, cube)
        base.assert_called_once_with(compiled.cell.base_cell(), cube, {6: 0}, 0)
        arm.assert_called_once_with("u_q", cube, {6: 0})

    def test_rejects_witness_when_named_deletion_arm_gate_is_false(self) -> None:
        instance, compiled, cube = _mocked_replay_inputs()
        with mock.patch.object(
            arm_cegar, "source_faithful_cube_ok", return_value=True
        ), mock.patch.object(
            arm_cegar, "added_constraints_hold", return_value=True
        ), mock.patch.object(
            arm_cegar, "named_deletion_arm_holds", return_value=False
        ), self.assertRaisesRegex(
            arm_cegar.Exact12NextRowStructuralCegarError,
            "failed a source, arm, predicate, or CNF replay gate",
        ):
            arm_cegar._replay_arm_sat_witness(instance, compiled, cube, [1])

    def test_wrapper_binds_arm_schedule_schemas_and_cell_field(self) -> None:
        with mock.patch.object(
            arm_cegar,
            "run_structural_cegar",
            return_value={"status": "ITERATION_LIMIT"},
        ) as runner:
            summary = arm_cegar.run_arm_structural_cegar(
                Path("repo"), Path("workdir"), 71
            )

        self.assertEqual(summary, {"status": "ITERATION_LIMIT"})
        args, kwargs = runner.call_args
        self.assertEqual(args, (Path("repo"), Path("workdir"), 71))
        self.assertEqual(len(kwargs["_schedule"]), 72)
        self.assertEqual(kwargs["_schedule"], arm_cells())
        self.assertIs(kwargs["_compile_selected_cell"], compile_arm_cell)
        self.assertIs(
            kwargs["_sat_witness_replay"], arm_cegar._replay_arm_sat_witness
        )
        self.assertEqual(kwargs["_run_schema"], arm_cegar.RUN_SCHEMA)
        self.assertEqual(kwargs["_record_schema"], arm_cegar.RECORD_SCHEMA)
        self.assertEqual(kwargs["_cell_binding_field"], "arm_cell_index")

    def test_invalid_arm_index_and_stale_workdir_fail_closed(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            with self.assertRaisesRegex(
                arm_cegar.Exact12NextRowStructuralCegarError,
                "outside the schedule",
            ):
                arm_cegar.run_arm_structural_cegar(root, root / "invalid", 72)
            self.assertFalse((root / "invalid").exists())

            stale = root / "stale"
            stale.mkdir()
            stale.chmod(0o700)
            (stale / "artifact").write_text("stale\n", encoding="ascii")
            with self.assertRaisesRegex(EncodingError, "empty"):
                arm_cegar.run_arm_structural_cegar(root, stale, 0)

    def test_journal_rejects_arm_schema_and_index_mismatch(self) -> None:
        instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compiled = compile_arm_cell(instance, arm_cells()[0])
        cube = {
            0: [1, 2, 3, 4],
            1: [0, 2, 6, 8],
            2: [0, 1, 10, 11],
            3: [0, 1, 4, 5],
            4: [0, 2, 3, 5],
            5: [0, 3, 4, 6],
            6: [0, 7, 8, 10],
            7: [1, 3, 6, 8],
            8: [1, 5, 6, 9],
            9: [1, 2, 7, 8],
            10: [0, 7, 9, 11],
            11: [1, 7, 9, 10],
        }
        certificate = structural.detect_structural_certificate(cube)
        self.assertIsNotNone(certificate)
        assert certificate is not None
        clause = structural.learned_clause_for_certificate(instance, certificate)
        admitted = AdmittedCut(
            certificate_kind=structural.STRUCTURAL_CERTIFICATE_KIND,
            certificate_schema=structural.STRUCTURAL_CERTIFICATE_SCHEMA,
            detector_stage=str(certificate["stage"]),
            certificate=certificate,
            learned_clause=clause,
        )
        job_id = "a" * 64
        record = structural._make_record(
            index=0,
            parent_sha256=job_id,
            job_id=job_id,
            detector_contract_sha256="d" * 64,
            cell_index=0,
            source_order_bank_sha256="b" * 64,
            admitted_cut=admitted,
            pre_cut_cnf_sha256=structural._cnf_sha256(instance),
            post_cut_cnf_sha256=hashlib.sha256(
                instance.dimacs((clause,)).encode("ascii")
            ).hexdigest(),
            cube=cube,
            positive_variables=tuple(-literal for literal in clause),
            n_variables=instance.cnf.n_variables,
            record_schema=arm_cegar.RECORD_SCHEMA,
            cell_binding_field="arm_cell_index",
            cell_binding_value=0,
        )

        for field, value in (("schema", "wrong-schema"), ("arm_cell_index", 1)):
            bad_record = copy.deepcopy(record)
            bad_record[field] = value
            body = dict(bad_record)
            body.pop("record_sha256")
            bad_record["record_sha256"] = structural._sha256_json(body)
            payload = (json.dumps(bad_record, sort_keys=True) + "\n").encode()
            with self.subTest(field=field), mock.patch.object(
                structural,
                "snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ), mock.patch.object(
                structural, "attest_source_order_bank_live_sources"
            ), self.assertRaisesRegex(
                structural.Exact12NextRowStructuralCegarError,
                "chain authentication",
            ):
                structural.replay_journal(
                    instance,
                    compiled,
                    io.BytesIO(payload),
                    repo_root=Path.cwd(),
                    job_id=job_id,
                    detector_contract_sha256="d" * 64,
                    cell_index=0,
                    source_order_bank={},
                    record_schema=arm_cegar.RECORD_SCHEMA,
                    cell_binding_field="arm_cell_index",
                    cell_binding_value=0,
                    sat_witness_replay=lambda _instance, _compiled, row, positive: (
                        row,
                        frozenset(positive),
                        {"candidate": True},
                    ),
                )


if __name__ == "__main__":
    unittest.main()
