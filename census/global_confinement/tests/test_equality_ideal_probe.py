# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from census.global_confinement.equality_ideal_probe import (
    CALLER_OUTPUT_SUBROOT,
    INPUT_SCHEMAS,
    VERDICT_BEGIN,
    VERDICT_END,
    coordinate,
    execute_singular_script,
    greedy_minimize_rows,
    load_packet_systems,
    parse_singular_verdict,
    row_equalities,
    run,
    singular_script,
    system_polynomials,
    variable_names,
)
from census.global_confinement.metric_realizability_probe import MetricRow


def _canonical(value: object) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode()


class FakeRunner:
    def __init__(self, verdicts: list[str], *, tamper: str | None = None) -> None:
        self.verdicts = list(verdicts)
        self.tamper = tamper
        self.calls: list[dict[str, object]] = []

    def execute(self, script: bytes, **kwargs: object) -> object:
        self.calls.append({"script": script, **kwargs})
        verdict = self.verdicts.pop(0)
        payload = {
            "UNIT": b"P97_EQUALITY_IDEAL_VERDICT_BEGIN\n0\nP97_EQUALITY_IDEAL_VERDICT_END\n",
            "NONUNIT": b"P97_EQUALITY_IDEAL_VERDICT_BEGIN\n1\nP97_EQUALITY_IDEAL_VERDICT_END\n",
            "MALFORMED": b"0\n",
        }.get(verdict, b"")
        run_status = verdict if verdict in {"ERRORED", "TIMED_OUT"} else "RAN"
        if verdict == "DID_NOT_START":
            run_status = verdict
        context = kwargs["source_context"]
        script_hash = hashlib.sha256(script).hexdigest()
        context_hash = hashlib.sha256(_canonical(context)).hexdigest()
        if self.tamper == "script":
            script_hash = "0" * 64
        if self.tamper == "source":
            context_hash = "0" * 64
        digest = hashlib.sha256(payload).hexdigest()
        output_directory = Path(kwargs["output_directory"])
        return SimpleNamespace(
            run_id="fake-run",
            run_status=run_status,
            exit_code=0 if run_status == "RAN" else None,
            stdout=payload,
            stderr=b"",
            script_path=output_directory / "script.sing",
            stdout_path=output_directory / "stdout.bin",
            stderr_path=output_directory / "stderr.bin",
            receipt_path=output_directory / "receipt.json",
            manifest_path=output_directory / "manifest.json",
            request_sha256="1" * 64,
            result_sha256="2" * 64,
            script_sha256=script_hash,
            stdout_sha256=digest,
            stderr_sha256=hashlib.sha256(b"").hexdigest(),
            source_context_sha256=context_hash,
            receipt_sha256="3" * 64,
            artifact_sha256="4" * 64,
            replayed=False,
        )


def _input_artifact(*, with_packet: bool = True) -> dict[str, object]:
    results: list[dict[str, object]] = []
    if with_packet:
        results.append(
            {
                "packet_index": 181,
                "n": 5,
                "type": "test-packet",
                "pin_source": 3,
                "elapsed_sec": 1.25,
                "core_free": {
                    "status": "SAT",
                    "assignment": {
                        "row": {
                            "center": 0,
                            "support": [1, 2, 3, 4],
                            "exact": False,
                        }
                    },
                },
            }
        )
    return {
        "schema": max(INPUT_SCHEMAS),
        "complete": True,
        "input": "census/global_confinement/upstream.json",
        "input_sha256": "a" * 64,
        "results": results,
    }


class EqualityIdealProbeTests(unittest.TestCase):
    def test_gauge_coordinates_and_free_variable_order(self) -> None:
        self.assertEqual(coordinate(0), ("0", "0"))
        self.assertEqual(coordinate(1), ("1", "0"))
        self.assertEqual(coordinate(2), ("x2x", "x2y"))
        self.assertEqual(
            variable_names(4),
            ("x2x", "x2y", "x3x", "x3y"),
        )

    def test_metric_row_emits_three_pivoted_distance_equalities(self) -> None:
        row = MetricRow(0, (1, 2, 3, 4), True)
        self.assertEqual(
            row_equalities(row),
            (
                "((0-1)^2+(0-0)^2)-((0-x2x)^2+(0-x2y)^2)",
                "((0-1)^2+(0-0)^2)-((0-x3x)^2+(0-x3y)^2)",
                "((0-1)^2+(0-0)^2)-((0-x4x)^2+(0-x4y)^2)",
            ),
        )
        script = singular_script(variable_names(5), row_equalities(row))
        self.assertIn("ring r = 0, (x2x,x2y,x3x,x3y,x4x,x4y), dp;", script)
        self.assertIn(",\n  ((0-1)^2", script)
        self.assertNotIn("\n+  ", script)
        self.assertIn("ideal G = slimgb(I);", script)

    def test_marked_singular_verdict_parsing(self) -> None:
        self.assertEqual(
            parse_singular_verdict(
                f"noise\n{VERDICT_BEGIN}\n0\n{VERDICT_END}\n"
            ),
            "UNIT",
        )
        self.assertEqual(
            parse_singular_verdict(
                f"{VERDICT_BEGIN}\n1\n{VERDICT_END}\n"
            ),
            "NONUNIT",
        )
        self.assertEqual(
            parse_singular_verdict(
                f"{VERDICT_BEGIN}\n?\n{VERDICT_END}\n"
            ),
            "ERROR",
        )
        self.assertEqual(parse_singular_verdict("0"), "ERROR")

    def test_greedy_minimization_uses_only_confirmed_unit_deletions(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3, 4), False),
            MetricRow(1, (0, 2, 3, 4), False),
            MetricRow(2, (0, 1, 3, 4), False),
        )
        required = frozenset(rows[1:])
        calls: list[tuple[MetricRow, ...]] = []

        def fake_oracle(candidate: tuple[MetricRow, ...]) -> str:
            calls.append(candidate)
            return "UNIT" if required.issubset(candidate) else "NONUNIT"

        result = greedy_minimize_rows(rows, fake_oracle)
        self.assertEqual(result.rows, rows[1:])
        self.assertEqual(len(calls), 3)
        self.assertEqual(
            [attempt.result.verdict for attempt in result.attempts],
            ["UNIT", "NONUNIT", "NONUNIT"],
        )
        self.assertEqual(
            [attempt.removed for attempt in result.attempts],
            [True, False, False],
        )
        self.assertTrue(result.complete)
        self.assertTrue(result.confirmed_row_irredundant)

    def test_packet_filter_normalizes_saved_sat_assignment(self) -> None:
        assignment = {
            "first": {
                "center": 0,
                "support": [1, 2, 3, 4],
                "exact": False,
            },
            "first-exact-alias": {
                "center": 0,
                "support": [4, 3, 2, 1],
                "exact": True,
            },
            "second": {
                "center": 1,
                "support": [0, 2, 3, 4],
                "exact": False,
            },
        }
        artifact = {
            "schema": max(INPUT_SCHEMAS),
            "complete": True,
            "input": "census/global_confinement/upstream.json",
            "input_sha256": "a" * 64,
            "results": [
                {
                    "packet_index": 181,
                    "n": 5,
                    "core_free": {
                        "status": "SAT",
                        "assignment": assignment,
                    },
                }
            ],
        }
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input.json"
            path.write_text(json.dumps(artifact))
            systems, metadata = load_packet_systems(path, (181, 181))
        self.assertEqual(metadata["requested_packet_indices"], [181])
        self.assertEqual(len(systems), 1)
        self.assertEqual(systems[0]["packet_index"], 181)
        self.assertEqual(len(systems[0]["rows"]), 2)
        self.assertTrue(systems[0]["rows"][0].exact)
        self.assertEqual(len(system_polynomials(systems[0]["rows"])), 6)

    def test_piqd_context_binds_scripts_input_packet_and_greedy_rows(self) -> None:
        fake = FakeRunner(["UNIT", "NONUNIT", "UNIT", "NONUNIT"])
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            input_path = root / "input.json"
            input_path.write_bytes(_canonical(_input_artifact()))
            input_sha256 = hashlib.sha256(input_path.read_bytes()).hexdigest()
            artifact = run(
                input_path,
                packet_indices=(181,),
                timeout_s=37,
                piqd_data_root=root / "piqd-data",
                runner=fake,
            )
            with self.assertRaises(FileExistsError):
                run(
                    input_path,
                    packet_indices=(181,),
                    timeout_s=37,
                    piqd_data_root=root / "piqd-data",
                    runner=FakeRunner(["UNIT", "NONUNIT"]),
                )

        self.assertEqual(len(fake.calls), 4)
        kinds = [call["source_context"]["query"]["kind"] for call in fake.calls]
        self.assertEqual(
            kinds,
            ["smoke-gate", "smoke-gate", "packet-initial", "packet-greedy-deletion"],
        )
        self.assertEqual(artifact["execution"]["backend"], "piqd")
        for call in fake.calls:
            self.assertIs(type(call["timeout_s"]), int)
            self.assertEqual(call["timeout_s"], 37)
            context = call["source_context"]

            def assert_piqd_json_safe(value: object) -> None:
                self.assertNotIsInstance(value, float)
                if isinstance(value, dict):
                    for key, child in value.items():
                        self.assertIsInstance(key, str)
                        assert_piqd_json_safe(child)
                elif isinstance(value, list):
                    for child in value:
                        assert_piqd_json_safe(child)

            assert_piqd_json_safe(context)
            self.assertEqual(context["input_json"]["sha256"], input_sha256)
            self.assertEqual(context["input_json"]["schema"], max(INPUT_SCHEMAS))
            self.assertEqual(
                context["upstream_source"]["path"],
                "census/global_confinement/upstream.json",
            )
            self.assertEqual(context["upstream_source"]["sha256"], "a" * 64)
            self.assertEqual(context["execution_profile"]["workers"], 1)
            self.assertFalse(context["execution_profile"]["local_fallback"])
            self.assertEqual(
                context["script_sha256"],
                hashlib.sha256(call["script"]).hexdigest(),
            )
        output_directories = {
            Path(call["output_directory"]) for call in fake.calls
        }
        self.assertEqual(len(output_directories), 4)
        self.assertEqual(
            {path.parent for path in output_directories},
            {(root / "piqd-data").resolve() / CALLER_OUTPUT_SUBROOT},
        )
        initial_context = fake.calls[2]["source_context"]
        greedy_context = fake.calls[3]["source_context"]
        self.assertEqual(initial_context["packet"]["packet_index"], 181)
        canonical_record = _canonical(
            json.loads(initial_context["packet"]["canonical_record_json"])
        )
        self.assertEqual(
            initial_context["packet"]["canonical_record_sha256"],
            hashlib.sha256(canonical_record).hexdigest(),
        )
        self.assertIn(b'"elapsed_sec":1.25', canonical_record)
        self.assertEqual(len(initial_context["normalized_rows"]), 1)
        self.assertEqual(len(initial_context["equations"]), 3)
        self.assertEqual(greedy_context["normalized_rows"], [])
        self.assertEqual(greedy_context["equations"], [])
        self.assertEqual(artifact["smoke_gates"]["known_unit"]["verdict"], "UNIT")

    def test_malformed_or_tampered_execution_fails_closed_without_fallback(self) -> None:
        from census.global_confinement.equality_ideal_probe import SingularQueryContext

        script = singular_script(("z",), ("z", "z-1"))
        base = {
            "schema": "test",
            "script_sha256": hashlib.sha256(script.encode()).hexdigest(),
        }
        with tempfile.TemporaryDirectory() as directory:
            context = SingularQueryContext(
                source="test",
                project="test",
                request_id="test",
                timeout_s=2,
                output_directory=Path(directory) / "query",
                source_context=base,
            )
            for fake in (
                FakeRunner(["MALFORMED"]),
                FakeRunner(["UNIT"], tamper="script"),
                FakeRunner(["UNIT"], tamper="source"),
                FakeRunner(["TIMED_OUT"]),
                FakeRunner(["ERRORED"]),
                FakeRunner(["DID_NOT_START"]),
            ):
                with self.subTest(fake=(fake.verdicts, fake.tamper)):
                    with patch(
                        "census.global_confinement.equality_ideal_probe.subprocess.run",
                        side_effect=AssertionError("legacy fallback attempted"),
                    ):
                        result = execute_singular_script(
                            script, runner=fake, context=context
                        )
                    self.assertIn(result.verdict, {"ERROR", "TIMEOUT"})

    def test_default_backend_is_piqd_and_legacy_local_is_explicit(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            input_path = root / "input.json"
            input_path.write_bytes(_canonical(_input_artifact(with_packet=False)))
            default_fake = FakeRunner(["UNIT", "NONUNIT"])
            with patch(
                "census.global_confinement.equality_ideal_probe.PiqdSingularRunner",
                return_value=default_fake,
            ) as piqd_constructor:
                result = run(
                    input_path,
                    packet_indices=(),
                    timeout_s=4,
                    piqd_server="http://piqd.test:9000",
                    piqd_data_root=root / "piqd",
                )
            piqd_constructor.assert_called_once_with(
                base_url="http://piqd.test:9000",
                max_poll_s=64.0,
            )
            self.assertEqual(result["execution"]["backend"], "piqd")

            legacy_fake = FakeRunner(["UNIT", "NONUNIT"])
            with patch(
                "census.global_confinement.equality_ideal_probe.LegacyLocalSingularRunner",
                return_value=legacy_fake,
            ) as legacy_constructor:
                result = run(
                    input_path,
                    packet_indices=(),
                    timeout_s=4,
                    backend="legacy-local",
                    executable="custom-singular",
                )
            legacy_constructor.assert_called_once_with("custom-singular")
            self.assertEqual(result["execution"]["backend"], "legacy-local")
            with self.assertRaises(ValueError):
                run(
                    input_path,
                    packet_indices=(),
                    timeout_s=4,
                    backend="legacy-local",
                    workers=2,
                    runner=legacy_fake,
                )

    def test_input_type_and_source_tamper_are_rejected(self) -> None:
        cases = []
        bad_type = _input_artifact()
        bad_type["results"][0]["type"] = ["not", "a", "type"]
        cases.append(bad_type)
        bad_source = _input_artifact()
        bad_source["input_sha256"] = "not-a-digest"
        cases.append(bad_source)
        bad_pin_source = _input_artifact()
        bad_pin_source["results"][0]["pin_source"] = True
        cases.append(bad_pin_source)
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input.json"
            for artifact in cases:
                with self.subTest(artifact=artifact):
                    path.write_bytes(_canonical(artifact))
                    with self.assertRaises(ValueError):
                        load_packet_systems(path)


if __name__ == "__main__":
    unittest.main()
