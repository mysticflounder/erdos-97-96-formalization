"""Focused verification tests for the reconstructed n=11 Wave-4 survivor."""

from __future__ import annotations

import json
import sys
from itertools import combinations
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import generate_strict_kalmanson_n11_chain_bank as chain
import verify_strict_kalmanson_survivor as verifier

REPO_ROOT = Path(__file__).resolve().parents[1]
WAVE4_SURVIVOR = (
    REPO_ROOT / "certificates" / "p97_strict_kalmanson_n11_wave4_survivor.json"
)
ROUND170_SURVIVOR = (
    REPO_ROOT / "certificates" / "p97_strict_kalmanson_n11_survivor.json"
)


def test_wave4_survivor_verifies_all_announced_invariants() -> None:
    result = verifier.verify_file(WAVE4_SURVIVOR)

    assert result == {
        "schema": verifier.OUTPUT_SCHEMA,
        "status": "PASS",
        "input_sha256": "9d1143aadea6953c76ff559c51adf20e9b61221003732667b30f4040690fa764",
        "n": 11,
        "check_counts": {
            "row_equality_comparisons": 33,
            "kalmanson_comparisons": 660,
            "triangle_comparisons": 495,
        },
        "minimum_kalmanson_slack": 1,
        "minimum_triangle_slack": 1,
        "row_radius_summary": {
            "minimum": 33,
            "maximum": 33,
            "radii": [33] * 11,
        },
        "cayley_menger": {
            "vertices": [0, 1, 2, 3],
            "determinant": 767_736_288,
        },
    }


def test_wave4_survivor_has_exactly_the_four_chain_embeddings() -> None:
    document = json.loads(WAVE4_SURVIVOR.read_text(encoding="utf-8"))
    assert chain.find_motif_embeddings(document["rows"]) == [
        (0, 1, 2, 6, 4, 10),
        (3, 5, 7, 9, 8, 10),
        (6, 4, 2, 0, 1, 10),
        (9, 8, 7, 3, 5, 10),
    ]


def test_wave4_survivor_reuses_rows_but_not_round170_metric() -> None:
    wave4 = json.loads(WAVE4_SURVIVOR.read_text(encoding="utf-8"))
    round170 = json.loads(ROUND170_SURVIVOR.read_text(encoding="utf-8"))

    assert wave4["rows"] == round170["rows"]
    assert wave4["distance_matrix"] != round170["distance_matrix"]


def test_wave4_survivor_pins_all_four_point_determinants() -> None:
    document = json.loads(WAVE4_SURVIVOR.read_text(encoding="utf-8"))
    matrix = document["distance_matrix"]
    determinants = [
        verifier.cayley_menger_determinant(matrix, vertices)
        for vertices in combinations(range(11), 4)
    ]

    assert len(determinants) == 330
    assert sum(value == 0 for value in determinants) == 0
    assert sum(value > 0 for value in determinants) == 300
    assert sum(value < 0 for value in determinants) == 30
    assert min(determinants) == -975_026_402
    assert max(determinants) == 41_556_351_448
