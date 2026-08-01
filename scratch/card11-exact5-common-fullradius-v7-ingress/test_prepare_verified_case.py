#!/usr/bin/env python3

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "prepare_verified_case", HERE / "prepare_verified_case.py"
)
assert SPEC is not None and SPEC.loader is not None
ingress = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = ingress
SPEC.loader.exec_module(ingress)


class IngressTests(unittest.TestCase):
    def test_authenticate_core_preserves_duplicate_occurrences(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            input_cnf = root / "input.cnf"
            core_cnf = root / "core.cnf"
            input_cnf.write_text(
                "p cnf 3 5\n1 -2 0\n3 0\n-2 1 0\n-3 0\n3 0\n",
                encoding="ascii",
            )
            core_cnf.write_text(
                "p cnf 3 3\n-2 1 0\n3 0\n3 0\n",
                encoding="ascii",
            )
            variables, clauses, mapping = ingress.authenticate_core(
                input_cnf, core_cnf
            )
            self.assertEqual(variables, 3)
            self.assertEqual(clauses, [(-2, 1), (3,), (3,)])
            self.assertEqual(mapping, [1, 2, 5])

    def test_manifest_block_counts_marks_gaps(self) -> None:
        manifest = {
            "clause_blocks": [
                {
                    "name": "a",
                    "first_clause_1based": 1,
                    "last_clause_1based": 2,
                },
                {
                    "name": "b",
                    "first_clause_1based": 4,
                    "last_clause_1based": 5,
                },
            ]
        }
        self.assertEqual(
            ingress.manifest_block_counts(manifest, [1, 3, 4]),
            {"<unclassified-or-overlap>": 1, "a": 1, "b": 1},
        )

    def test_atomic_json_round_trip(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "record.json"
            ingress.atomic_json(path, {"x": [1, 2]})
            self.assertEqual(json.loads(path.read_text()), {"x": [1, 2]})


if __name__ == "__main__":
    unittest.main()
