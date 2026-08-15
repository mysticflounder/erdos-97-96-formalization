"""Regression tests for exact-17 export model literal parsing."""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
from types import ModuleType

import pytest

REPOSITORY_ROOT = Path(__file__).resolve().parents[3]
SCRIPT_DIR = REPOSITORY_ROOT / "scripts"
VALIDATOR_SCRIPTS = (
    "validate_exact17_fifth_convex_five_point_export.py",
    "validate_exact17_convex_five_point_third_rows_export.py",
    "validate_exact17_convex_five_point_fourth_rows_export.py",
    "validate_exact17_four_point_two_circle_bisector_rows_export.py",
    "validate_exact17_four_row_two_circle_bisector_export.py",
    "validate_exact17_second_generic_cancellation_export.py",
    "validate_exact17_lean_cdefg_equal_k4_two_circle_three_row_hijk_interleaved_export.py",
    "validate_exact17_lean_cdefg_equal_k4_two_circle_three_row_hijk_interleaved_equality_chain_export.py",
    "validate_exact17_lean_cdefg_equal_k4_two_circle_three_row_hijk_interleaved_equality_chain_perp_bisector_chain_export.py",
    "validate_exact17_lean_cdefg_equal_k4_two_circle_three_row_hijk_interleaved_equality_chain_perp_bisector_chain_two_kalmanson_export.py",
    "validate_exact17_lean_cdefg_equal_k4_two_circle_three_row_hijk_interleaved_equality_chain_perp_bisector_chain_two_kalmanson_swapped_de_export.py",
    "validate_exact17_lean_cdefg_equal_k4_two_circle_three_row_hijk_interleaved_equality_chain_perp_bisector_chain_two_kalmanson_swapped_de_generic_cancellation_export.py",
)


def load_validator(filename: str) -> ModuleType:
    path = SCRIPT_DIR / filename
    spec = importlib.util.spec_from_file_location(filename[:-3], path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


@pytest.mark.parametrize("filename", VALIDATOR_SCRIPTS)
def test_assignment_map_rejects_json_boolean_as_signed_literal(
    filename: str, tmp_path: Path
) -> None:
    model_path = tmp_path / "bool-model.json"
    model_path.write_text(
        json.dumps({"assignment": [True, *range(2, 309)]}), encoding="utf-8"
    )

    with pytest.raises(ValueError, match="malformed model literal"):
        load_validator(filename).assignment_map(model_path)


def test_assignment_map_accepts_json_integer_literals(tmp_path: Path) -> None:
    model_path = tmp_path / "integer-model.json"
    model_path.write_text(
        json.dumps({"assignment": list(range(1, 309))}), encoding="utf-8"
    )

    assignment = load_validator(VALIDATOR_SCRIPTS[0]).assignment_map(model_path)
    assert assignment[1] is True
    assert assignment[308] is True
