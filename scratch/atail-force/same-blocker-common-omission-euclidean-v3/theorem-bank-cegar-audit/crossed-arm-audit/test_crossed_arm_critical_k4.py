#!/usr/bin/env python3
"""Bounded API checks for the crossed-arm critical-K4 encoding switch."""

from __future__ import annotations

import importlib.util
import inspect
import sys
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).with_name("crossed_arm_cegar.py")
SPEC = importlib.util.spec_from_file_location("crossed_arm_cegar_under_test", MODULE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot import {MODULE_PATH}")
crossed_arm_cegar = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = crossed_arm_cegar
SPEC.loader.exec_module(crossed_arm_cegar)


_OMITTED = object()


class RestoreMetadataAudit:
    """Minimal empty-cut target for restore metadata tests."""

    def __init__(self, critical_k4_representation: str) -> None:
        self.critical_k4_representation = critical_k4_representation
        self.packet_cuts = {}


def empty_checkpoint_payload(
    *, result_representation=_OMITTED, manifest_representation=_OMITTED
):
    payload = {
        "schema": crossed_arm_cegar.RESULT_SCHEMA,
        "arm": crossed_arm_cegar.ARMS[0],
        "n": crossed_arm_cegar.N,
        "closed_cap_profile": list(crossed_arm_cegar.PROFILE),
        "learned_cuts": {
            "schema": crossed_arm_cegar.CUT_SCHEMA,
            "structural_families": list(crossed_arm_cegar.STRUCTURAL_FAMILIES),
            "theorem_families": list(crossed_arm_cegar.FULL_BANK_FAMILIES),
            "connectivity": [],
            "structural": [],
            "theorem": [],
        },
    }
    if result_representation is not _OMITTED:
        payload["critical_no_K4_representation"] = result_representation
    if manifest_representation is not _OMITTED:
        payload["learned_cuts"][
            "critical_no_K4_representation"
        ] = manifest_representation
    return payload


class CrossedArmCriticalK4Test(unittest.TestCase):
    def test_default_and_artifact_suffixes(self) -> None:
        incidence = crossed_arm_cegar.incidence_cegar
        parameter = inspect.signature(
            crossed_arm_cegar.CrossedAudit
        ).parameters["critical_k4_representation"]
        self.assertEqual(
            parameter.default,
            incidence.CRITICAL_K4_COMPACT_PB,
        )
        self.assertEqual(
            incidence.DEFAULT_CRITICAL_K4_REPRESENTATION,
            incidence.CRITICAL_K4_COMPACT_PB,
        )
        self.assertEqual(
            incidence.LEGACY_CRITICAL_K4_REPRESENTATION,
            incidence.CRITICAL_K4_TRIPLE_CLAUSES,
        )
        self.assertEqual(
            crossed_arm_cegar.critical_k4_artifact_suffix(
                incidence.CRITICAL_K4_TRIPLE_CLAUSES
            ),
            "",
        )
        self.assertEqual(
            crossed_arm_cegar.critical_k4_artifact_suffix(
                incidence.CRITICAL_K4_COMPACT_PB
            ),
            "-critical-k4-compact-pb",
        )
        compact_check = crossed_arm_cegar.critical_k4_representation_self_check(
            incidence.CRITICAL_K4_COMPACT_PB
        )
        self.assertEqual(compact_check["selected"], incidence.CRITICAL_K4_COMPACT_PB)
        self.assertEqual(compact_check["default"], incidence.CRITICAL_K4_COMPACT_PB)
        self.assertEqual(compact_check["legacy"], incidence.CRITICAL_K4_TRIPLE_CLAUSES)
        self.assertEqual(
            compact_check["artifact_suffix"],
            "-critical-k4-compact-pb",
        )
        self.assertEqual(compact_check["legacy_artifact_suffix"], "")
        self.assertEqual(
            compact_check["default_artifact_suffix"],
            "-critical-k4-compact-pb",
        )
        with self.assertRaisesRegex(ValueError, "invalid-critical-k4-representation"):
            crossed_arm_cegar.critical_k4_artifact_suffix("not-an-encoding")

    def test_compact_constructor_forwards_to_base_and_manifest(self) -> None:
        incidence = crossed_arm_cegar.incidence_cegar
        audit = crossed_arm_cegar.CrossedAudit(incidence.CRITICAL_K4_COMPACT_PB)
        self.assertEqual(
            audit.critical_k4_representation,
            incidence.CRITICAL_K4_COMPACT_PB,
        )
        self.assertEqual(
            audit.blocks["critical_no_K4_after_source_deletion"],
            3264,
        )
        self.assertEqual(
            crossed_arm_cegar.learned_cut_manifest(audit)[
                "critical_no_K4_representation"
            ],
            incidence.CRITICAL_K4_COMPACT_PB,
        )

    def test_omitted_legacy_checkpoint_restores_into_compact_target(self) -> None:
        incidence = crossed_arm_cegar.incidence_cegar
        audit = RestoreMetadataAudit(incidence.CRITICAL_K4_COMPACT_PB)
        restored = crossed_arm_cegar.restore_learned_cuts_payload(
            audit,
            crossed_arm_cegar.ARMS[0],
            empty_checkpoint_payload(),
            "<omitted-v9-v7-checkpoint>",
        )
        self.assertEqual(
            restored["source_critical_no_K4_representation"],
            incidence.CRITICAL_K4_TRIPLE_CLAUSES,
        )
        self.assertEqual(
            restored["target_critical_no_K4_representation"],
            incidence.CRITICAL_K4_COMPACT_PB,
        )

    def test_explicit_checkpoint_representation_is_authoritative(self) -> None:
        incidence = crossed_arm_cegar.incidence_cegar
        for representation in incidence.CRITICAL_K4_REPRESENTATIONS:
            for record_location in ("both", "result", "manifest"):
                with self.subTest(
                    representation=representation,
                    record_location=record_location,
                ):
                    kwargs = {}
                    if record_location in ("both", "result"):
                        kwargs["result_representation"] = representation
                    if record_location in ("both", "manifest"):
                        kwargs["manifest_representation"] = representation
                    restored = crossed_arm_cegar.restore_learned_cuts_payload(
                        RestoreMetadataAudit(incidence.CRITICAL_K4_COMPACT_PB),
                        crossed_arm_cegar.ARMS[0],
                        empty_checkpoint_payload(**kwargs),
                        "<explicit-v9-v7-checkpoint>",
                    )
                    self.assertEqual(
                        restored["source_critical_no_K4_representation"],
                        representation,
                    )
                    self.assertEqual(
                        restored["target_critical_no_K4_representation"],
                        incidence.CRITICAL_K4_COMPACT_PB,
                    )

        with self.assertRaisesRegex(
            ValueError,
            "invalid-critical-k4-representation",
        ):
            crossed_arm_cegar.restore_learned_cuts_payload(
                RestoreMetadataAudit(incidence.CRITICAL_K4_COMPACT_PB),
                crossed_arm_cegar.ARMS[0],
                empty_checkpoint_payload(result_representation=None),
                "<explicit-null-v9-v7-checkpoint>",
            )

    def test_mismatched_result_and_manifest_records_fail_closed(self) -> None:
        incidence = crossed_arm_cegar.incidence_cegar
        payload = empty_checkpoint_payload(
            result_representation=incidence.CRITICAL_K4_COMPACT_PB,
            manifest_representation=incidence.CRITICAL_K4_TRIPLE_CLAUSES,
        )
        with self.assertRaisesRegex(
            ValueError,
            "incompatible-critical-k4-representation-records",
        ):
            crossed_arm_cegar.restore_learned_cuts_payload(
                object(),
                crossed_arm_cegar.ARMS[0],
                payload,
                "<bounded-api-check>",
            )


if __name__ == "__main__":
    unittest.main()
