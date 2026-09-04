"""Focused tests for the strict all-center Kalmanson survivor verifier."""

from __future__ import annotations

import itertools
import json
import math
import sys
from copy import deepcopy
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import verify_strict_kalmanson_survivor as mod


def strict_order_metric(n: int) -> list[list[int]]:
    """An integer strict Kalmanson metric: d(i,j)=t(n+1-t)."""

    return [
        [0 if i == j else abs(i - j) * (n + 1 - abs(i - j)) for j in range(n)]
        for i in range(n)
    ]


def equilateral_matrix(n: int, distance: int = 10) -> list[list[int]]:
    return [[0 if i == j else distance for j in range(n)] for i in range(n)]


def all_other_rows(n: int) -> list[list[int]]:
    assert n == 5
    return [[member for member in range(n) if member != center] for center in range(n)]


def base_document() -> dict[str, object]:
    return {
        "schema": mod.INPUT_SCHEMA,
        "n": 5,
        "rows": all_other_rows(5),
        "distance_matrix": equilateral_matrix(5),
        "cayley_menger_probe": [0, 1, 2, 3],
    }


def independent_kalmanson_slacks(
    matrix: list[list[int]], i: int, j: int, k: int, l: int
) -> tuple[int, int]:
    return (
        matrix[i][k] + matrix[j][l] - matrix[i][j] - matrix[k][l],
        matrix[i][k] + matrix[j][l] - matrix[i][l] - matrix[j][k],
    )


def independent_triangle_slacks(
    matrix: list[list[int]], i: int, j: int, k: int
) -> tuple[int, int, int]:
    return (
        matrix[i][j] + matrix[i][k] - matrix[j][k],
        matrix[i][j] + matrix[j][k] - matrix[i][k],
        matrix[i][k] + matrix[j][k] - matrix[i][j],
    )


def test_constructed_metric_matches_independent_oracles_and_n11_counts() -> None:
    matrix = strict_order_metric(11)
    expected_kalmanson = [
        slack
        for i, j, k, l in itertools.combinations(range(11), 4)
        for slack in independent_kalmanson_slacks(matrix, i, j, k, l)
    ]
    expected_triangles = [
        slack
        for i, j, k in itertools.combinations(range(11), 3)
        for slack in independent_triangle_slacks(matrix, i, j, k)
    ]
    assert all(slack > 0 for slack in expected_kalmanson)
    assert all(slack > 0 for slack in expected_triangles)

    assert mod.check_kalmanson(matrix) == (min(expected_kalmanson), 660)
    assert mod.check_triangles(matrix) == (min(expected_triangles), 495)
    assert 2 * math.comb(11, 4) == 660
    assert 3 * math.comb(11, 3) == 495


def test_hand_checked_four_vertex_table_pins_both_kalmanson_directions() -> None:
    matrix = [
        [0, 4, 6, 6],
        [4, 0, 4, 6],
        [6, 4, 0, 4],
        [6, 6, 4, 0],
    ]
    crossing = matrix[0][2] + matrix[1][3]
    adjacent = matrix[0][1] + matrix[2][3]
    nested = matrix[0][3] + matrix[1][2]
    assert (crossing, adjacent, nested) == (12, 8, 10)
    assert mod.kalmanson_slacks(matrix, 0, 1, 2, 3) == (4, 2)
    assert mod.check_kalmanson(matrix) == (2, 2)
    assert not adjacent > crossing
    assert not nested > crossing


def test_row_equalities_have_required_n11_count() -> None:
    rows = [
        [
            (center + 1) % 11,
            (center + 2) % 11,
            (center + 3) % 11,
            (center + 4) % 11,
        ]
        for center in range(11)
    ]
    radii, checked = mod.check_row_equalities(rows, equilateral_matrix(11, 7))
    assert radii == [7] * 11
    assert checked == 33


@pytest.mark.parametrize("mutation", ["duplicate", "center", "short", "out-of-range"])
def test_malformed_rows_are_rejected(mutation: str) -> None:
    document = base_document()
    rows = deepcopy(document["rows"])
    assert isinstance(rows, list)
    if mutation == "duplicate":
        rows[0] = [1, 1, 2, 3]
    elif mutation == "center":
        rows[0] = [0, 1, 2, 3]
    elif mutation == "short":
        rows[0] = [1, 2, 3]
    else:
        rows[0] = [1, 2, 3, 5]
    document["rows"] = rows
    with pytest.raises(mod.VerificationError, match=r"rows\[0\]"):
        mod.verify_document(document, "0" * 64)


def test_asymmetric_matrix_is_rejected() -> None:
    document = base_document()
    matrix = deepcopy(document["distance_matrix"])
    assert isinstance(matrix, list)
    matrix[0][1] = 11
    document["distance_matrix"] = matrix
    with pytest.raises(mod.VerificationError, match=r"not symmetric at \(0, 1\)"):
        mod.verify_document(document, "0" * 64)


def test_row_equality_mutation_is_rejected_before_kalmanson() -> None:
    document = base_document()
    matrix = deepcopy(document["distance_matrix"])
    assert isinstance(matrix, list)
    matrix[0][1] = matrix[1][0] = 11
    document["distance_matrix"] = matrix
    with pytest.raises(mod.VerificationError, match="row equality failed at center 0"):
        mod.verify_document(document, "0" * 64)


def test_kalmanson_mutation_is_rejected() -> None:
    matrix = strict_order_metric(4)
    assert mod.check_kalmanson(matrix)[1] == 2
    matrix[0][2] = matrix[2][0] = 3
    matrix[1][3] = matrix[3][1] = 3
    with pytest.raises(mod.VerificationError, match="strict Kalmanson comparison failed"):
        mod.check_kalmanson(matrix)


def test_triangle_mutation_is_rejected() -> None:
    matrix = equilateral_matrix(3)
    assert mod.check_triangles(matrix) == (10, 3)
    matrix[0][2] = matrix[2][0] = 20
    with pytest.raises(mod.VerificationError, match="strict triangle comparison failed"):
        mod.check_triangles(matrix)


def test_cayley_menger_determinant_exact_zero_and_nonzero() -> None:
    rectangle_3_4_5 = [
        [0, 3, 4, 5],
        [3, 0, 5, 4],
        [4, 5, 0, 3],
        [5, 4, 3, 0],
    ]
    regular_unit_tetrahedron = equilateral_matrix(4, 1)
    assert mod.cayley_menger_determinant(rectangle_3_4_5, [0, 1, 2, 3]) == 0
    assert mod.cayley_menger_determinant(regular_unit_tetrahedron, [0, 1, 2, 3]) == 4


def test_planar_probe_is_rejected_by_survivor_contract() -> None:
    rectangle_3_4_5 = [
        [0, 3, 4, 5],
        [3, 0, 5, 4],
        [4, 5, 0, 3],
        [5, 4, 3, 0],
    ]
    with pytest.raises(mod.VerificationError, match="determinant is zero"):
        mod.check_nonplanar_probe(rectangle_3_4_5, [0, 1, 2, 3])
    assert mod.check_nonplanar_probe(equilateral_matrix(4, 1), [0, 1, 2, 3]) == 4


def test_determinant_and_probe_malformed_inputs_fail_closed() -> None:
    with pytest.raises(mod.VerificationError, match="square"):
        mod.exact_determinant([[1, 2], [3]])
    with pytest.raises(mod.VerificationError, match="must be distinct"):
        mod.validate_probe([0, 1, 1, 2], 5)


def test_exact_schema_and_duplicate_keys_are_enforced() -> None:
    document = base_document()
    document["unexpected"] = True
    with pytest.raises(mod.VerificationError, match=r"extra=\['unexpected'\]"):
        mod.verify_document(document, "0" * 64)
    raw = b'{"schema":"a","schema":"b"}'
    with pytest.raises(mod.VerificationError, match="duplicate JSON key"):
        mod.parse_document(raw)


def test_parser_normalizes_integer_digit_limit_and_recursion_failures(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    huge_integer = b'{"n":' + b"1" * 5000 + b"}"
    with pytest.raises(mod.VerificationError, match="invalid JSON value"):
        mod.parse_document(huge_integer)

    def recursion_failure(*_args: object, **_kwargs: object) -> object:
        raise RecursionError("test recursion limit")

    monkeypatch.setattr(mod.json, "loads", recursion_failure)
    with pytest.raises(mod.VerificationError, match="invalid JSON value"):
        mod.parse_document(b"{}")


def test_cli_failure_is_compact_canonical_json(tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    witness = tmp_path / "invalid.json"
    witness.write_text(json.dumps(base_document()), encoding="utf-8")
    assert mod.main([str(witness)]) == 1
    captured = capsys.readouterr()
    assert captured.out == ""
    payload = json.loads(captured.err)
    assert payload["status"] == "FAIL"
    assert "strict Kalmanson comparison failed" in payload["error"]
    assert captured.err == mod._canonical_json(payload) + "\n"


def test_cli_closes_parser_value_error(tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    witness = tmp_path / "huge-integer.json"
    witness.write_bytes(b'{"n":' + b"1" * 5000 + b"}")
    assert mod.main([str(witness)]) == 1
    captured = capsys.readouterr()
    assert captured.out == ""
    payload = json.loads(captured.err)
    assert payload["status"] == "FAIL"
    assert payload["error"].startswith("invalid JSON value:")
    assert captured.err == mod._canonical_json(payload) + "\n"


def test_recovered_round170_n11_survivor_end_to_end() -> None:
    witness = (
        Path(__file__).resolve().parents[1]
        / "certificates"
        / "p97_strict_kalmanson_n11_survivor.json"
    )
    result = mod.verify_file(witness)
    assert result == {
        "schema": mod.OUTPUT_SCHEMA,
        "status": "PASS",
        "input_sha256": "fb822efa58769abaa1657fea291dba96c207e46958a81ce90eeb0b4070221fb5",
        "n": 11,
        "check_counts": {
            "row_equality_comparisons": 33,
            "kalmanson_comparisons": 660,
            "triangle_comparisons": 495,
        },
        "minimum_kalmanson_slack": 1,
        "minimum_triangle_slack": 1,
        "row_radius_summary": {
            "minimum": 63,
            "maximum": 63,
            "radii": [63] * 11,
        },
        "cayley_menger": {
            "vertices": [0, 1, 2, 3],
            "determinant": 38_070_362_232,
        },
    }
