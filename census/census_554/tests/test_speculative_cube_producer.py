from __future__ import annotations

import importlib.util
from itertools import product
import json
from pathlib import Path
import sys
import tempfile
import unittest


REPO_ROOT = Path(__file__).resolve().parents[3]
SCRATCH = REPO_ROOT / "scratch" / "census-554"
sys.path.insert(0, str(SCRATCH))


def _load_producer():
    name = "census554_speculative_cube_producer_test"
    spec = importlib.util.spec_from_file_location(
        name, SCRATCH / "speculative_cube_producer.py"
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


class SpeculativeCubeProducerTests(unittest.TestCase):
    def test_partition_schedule_interleaves_centers(self):
        producer = _load_producer()
        decoder = producer.sat_cover.CoverInstance()
        choices = producer._partition_choices(decoder)

        self.assertEqual(
            choices[:producer.L.N],
            [(center, 0) for center in range(producer.L.N)],
        )
        self.assertEqual(
            len(choices),
            sum(len(decoder.cand[center]) for center in range(producer.L.N)),
        )
        global_lane = producer._diversifier(decoder, choices, 17, 17)
        partition_lane = producer._diversifier(decoder, choices, 18, 17)
        self.assertIsNone(global_lane["clause"])
        self.assertEqual(global_lane["label"], {"kind": "global"})
        self.assertEqual(len(partition_lane["clause"]), 1)
        self.assertEqual(partition_lane["label"]["kind"], "partition")

    def test_direct_pattern_clause_is_exact_under_one_hot_choices(self):
        producer = _load_producer()
        decoder = producer.sat_cover.CoverInstance()
        pattern = {
            3: frozenset({0, 1}),
            4: frozenset({2, 5}),
        }
        clause = set(producer._direct_pattern_clause(decoder, pattern))

        for index3, index4 in product(
            range(len(decoder.cand[3])), range(len(decoder.cand[4]))
        ):
            selected = {
                decoder.x[(3, index3)],
                decoder.x[(4, index4)],
            }
            contains = (
                pattern[3] <= decoder.cand[3][index3]
                and pattern[4] <= decoder.cand[4][index4]
            )
            self.assertEqual(bool(clause & selected), not contains)

    def test_direct_clause_matches_single_center_y_exclusion(self):
        producer = _load_producer()
        decoder = producer.sat_cover.CoverInstance()
        pattern = {3: frozenset({0, 1})}
        clause = set(producer._direct_pattern_clause(decoder, pattern))

        for index, candidate in enumerate(decoder.cand[3]):
            selected = decoder.x[(3, index)]
            self.assertEqual(selected in clause, not pattern[3] <= candidate)

    def test_compact_auxiliary_clause_matches_direct_exclusion(self):
        producer = _load_producer()
        decoder = producer.sat_cover.CoverInstance()
        pattern = {
            3: frozenset({0, 1}),
            4: frozenset({2, 5}),
        }
        source_nvars = decoder.cnf.n
        y_vars = {}
        definitions = []
        compact = producer._auxiliary_pattern_clause(
            decoder,
            pattern,
            source_nvars=source_nvars,
            y_vars=y_vars,
            definitions=definitions,
        )
        direct = set(producer._direct_pattern_clause(decoder, pattern))
        antecedents = {variable: set() for variable in y_vars.values()}
        for negative_x, variable in definitions:
            antecedents[variable].add(-negative_x)

        self.assertTrue(all(variable > source_nvars for variable in y_vars.values()))
        self.assertEqual(len(compact), len(pattern))
        for index3, index4 in product(
            range(len(decoder.cand[3])), range(len(decoder.cand[4]))
        ):
            selected = {
                decoder.x[(3, index3)],
                decoder.x[(4, index4)],
            }
            direct_satisfied = bool(direct & selected)
            forced_true = {
                variable
                for variable, xs in antecedents.items()
                if xs & selected
            }
            compact_can_be_satisfied = any(
                -literal not in forced_true for literal in compact
            )
            self.assertEqual(compact_can_be_satisfied, direct_satisfied)

    def test_learned_batch_is_hash_checked_and_idempotent(self):
        producer = _load_producer()
        values = [{"3": [0, 1], "4": [2, 5]}]
        with tempfile.TemporaryDirectory() as directory:
            run_dir = Path(directory)
            state = {
                "manifest_sha256": "a" * 64,
                "learned_batches": [],
                "learned_exclusion_count": 0,
            }
            producer._publish_learned_batch(
                run_dir, state, values, attempt_first=1, attempt_last=4
            )
            producer._publish_learned_batch(
                run_dir, state, values, attempt_first=1, attempt_last=4
            )
            self.assertEqual(state["learned_exclusion_count"], 1)
            self.assertEqual(producer._load_learned_values(run_dir, state), values)

            path = run_dir / state["learned_batches"][0]
            payload = json.loads(path.read_text(encoding="utf-8"))
            payload["patterns"][0]["3"] = [0, 2]
            path.write_text(json.dumps(payload), encoding="utf-8")
            with self.assertRaises(producer.ProducerError):
                producer._load_learned_values(run_dir, state)

    def test_batch_cnf_is_written_once_then_lane_delta_is_cloned(self):
        producer = _load_producer()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "source.cnf"
            shared = root / "shared.cnf"
            lane = root / "lane.cnf"
            source.write_text("p cnf 2 1\n1 2 0\n", encoding="ascii")
            producer._write_shared_cnf(
                source, shared, 2, 1, 0, [], [[-2]]
            )
            method = producer._clone_shared_with_clause(
                shared, lane, nvars=2, nclauses=2, clause=[-1]
            )
            self.assertIn(method, {"copy-on-write", "copy"})
            self.assertEqual(
                shared.read_text(encoding="ascii").splitlines()[0].split(),
                ["p", "cnf", "2", "2"],
            )
            self.assertEqual(
                lane.read_text(encoding="ascii").splitlines()[0].split(),
                ["p", "cnf", "2", "3"],
            )
            self.assertEqual(lane.read_text(encoding="ascii").splitlines()[-1],
                             "-1 0")

    def test_learned_exclusions_carry_across_identical_cnf_bank_prefix(self):
        producer = _load_producer()
        cube = {
            "0": [2, 3, 5, 9], "1": [4, 6, 7, 10],
            "2": [3, 7, 9, 10], "3": [6, 7, 8, 9],
            "4": [0, 1, 3, 6], "5": [1, 4, 6, 8],
            "6": [0, 1, 2, 4], "7": [3, 5, 8, 10],
            "8": [0, 4, 9, 10], "9": [1, 2, 7, 8],
            "10": [0, 2, 3, 8],
        }

        def write_manifest(run_dir, bank_text):
            run_dir.mkdir()
            cnf = run_dir / "cover_snapshot.cnf"
            bank = run_dir / "bank_snapshot.jsonl"
            cnf.write_text("p cnf 2 1\n1 2 0\n", encoding="ascii")
            bank.write_text(bank_text, encoding="utf-8")
            payload = {
                "schema": producer.MANIFEST_SCHEMA,
                "cnf_snapshot": cnf.name,
                "bank_snapshot": bank.name,
                "cnf_sha256": producer._file_sha256(cnf),
                "bank_sha256": producer._file_sha256(bank),
                "bank_rows": len([line for line in bank_text.splitlines() if line]),
                "cnf_variables": 2,
                "cnf_clauses": 1,
                "source_frontier_cube": cube,
            }
            producer.atomic_write_json(run_dir / "manifest.json", payload)
            return payload, bank

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "source"
            target = root / "target"
            source_manifest, _source_bank = write_manifest(
                source, '{"pid":"p0"}\n'
            )
            target_manifest, target_bank = write_manifest(
                target, '{"pid":"p0"}\n{"pid":"p1"}\n'
            )
            source_manifest_sha = producer._file_sha256(
                source / "manifest.json"
            )
            values = [{"3": [0, 1], "4": [2, 5]}]
            batch = producer._learned_batch_payload(
                values,
                manifest_sha256=source_manifest_sha,
                attempt_first=1,
                attempt_last=4,
            )
            (source / "learned_batches").mkdir()
            producer.atomic_write_json(
                source / "learned_batches/learned-000001-000004.json", batch
            )
            source_state = {
                "schema": "census554_speculative_cube_state.v3",
                "generation": source_manifest,
                "manifest_sha256": source_manifest_sha,
                "attempts": [],
                "learned_batches": [
                    "learned_batches/learned-000001-000004.json"
                ],
                "learned_exclusion_count": 1,
            }
            producer.atomic_write_json(source / "state.json", source_state)
            target_state = {
                "schema": producer.SCHEMA,
                "generation": target_manifest,
                "manifest_sha256": producer._file_sha256(
                    target / "manifest.json"
                ),
                "attempts": [],
                "learned_batches": [],
                "learned_exclusion_count": 0,
            }
            record = producer._carry_learned_batches(
                source, target, target_state, target_manifest, target_bank
            )
            self.assertTrue(record["bank_prefix_validated"])
            self.assertEqual(record["learned_exclusion_count"], 1)
            self.assertEqual(
                producer._load_learned_values(target, target_state), values
            )


if __name__ == "__main__":
    unittest.main()
