from __future__ import annotations

import json
import unittest
from pathlib import Path

from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_valuation import build_clause_delta_artifact
from census.card_head.generate_exact12_v14_clause_delta_lean import (
    render_lean_module,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
JSON_ARTIFACT = (
    REPO_ROOT / "certificates/p97_exact12_v14/cell0000-clause-delta.json"
)
LEAN_ARTIFACT = (
    REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221V14ClauseDeltaCell0000.lean"
)


class GenerateExact12V14ClauseDeltaLeanTest(unittest.TestCase):
    def test_cell0000_artifacts_are_exact_regenerations(self) -> None:
        materialized = materialize_cell(0)
        artifact = build_clause_delta_artifact(
            materialized.compiled, materialized.instance.dimacs()
        )

        self.assertEqual(json.loads(JSON_ARTIFACT.read_text()), artifact)
        self.assertEqual(
            LEAN_ARTIFACT.read_text(), render_lean_module(0, artifact)
        )


if __name__ == "__main__":
    unittest.main()
