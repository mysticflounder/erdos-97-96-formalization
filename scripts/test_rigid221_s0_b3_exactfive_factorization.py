#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Static contract tests for the B3 exact-five formula factorization."""

from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

pytest.importorskip("z3")

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_b3_exactfive_factorization as factor
import rigid221_s0_blockerv_exactfive_probe as legacy
import rigid221_s0_blockerv_midpoint_order_probe as midpoint_order

EXPECTED_BLOCK_COUNTS = (9, 78, 13, 13, 13, 19, 143, 72, 330, 330)
EXPECTED_CUMULATIVE_COUNTS = (9, 87, 100, 113, 126, 145, 288, 360, 690, 1020)


def test_block_inventory_and_cell_count() -> None:
    assert tuple(block.expected_assertions for block in factor.BLOCKS) == EXPECTED_BLOCK_COUNTS
    assert factor.EXPECTED_CUMULATIVE_COUNTS == EXPECTED_CUMULATIVE_COUNTS

    cells = factor.cell_specs()
    assert len(cells) == 14
    assert [cell.order_cell for cell in cells[:6]] == ["common"] * 6
    assert {cell.order_cell for cell in cells[6:]} == {"forward", "reverse"}


def test_every_prefix_has_the_pinned_assertion_count() -> None:
    for cell in factor.cell_specs():
        solver = factor.build_solver(cell)
        assert len(solver.assertions()) == EXPECTED_CUMULATIVE_COUNTS[cell.prefix_length - 1]


def test_full_legacy_formula_is_byte_preserved() -> None:
    historical = legacy.export_smt2(include_check_sat=False)
    factored = factor.export_smt2(factor._legacy_cell())
    assert factored == historical


@pytest.mark.parametrize("order_cell", midpoint_order.CELLS, ids=lambda cell: cell.name)
def test_full_source_order_formula_is_byte_preserved(order_cell: object) -> None:
    cell = factor.CellSpec(
        name=f"full-{order_cell.name}",
        prefix_length=len(factor.BLOCKS),
        order_cell=order_cell.name,
        order=order_cell.order,
    )
    assert factor.export_smt2(cell) == midpoint_order.export_smt2(
        order_cell,
        include_check_sat=False,
    )


def test_manifest_is_an_encoded_omitted_ledger(tmp_path: Path) -> None:
    summary = factor.emit_bundle(tmp_path, timeout_ms=1)
    manifest = json.loads((tmp_path / "factor_manifest.json").read_text())

    assert summary["status"] == "EMITTED"
    assert summary["cells"] == 14
    assert manifest["schema"] == factor.RESULT_SCHEMA
    assert manifest["solver_policy"] == "piqd-only"
    assert manifest["direct_consumer"] == factor.DIRECT_CONSUMER
    assert len(manifest["blocks"]) == 10
    assert len(manifest["cells"]) == 14
    assert manifest["cells"][0]["encoded_blocks"] == ["gauge"]
    assert manifest["cells"][0]["omitted_blocks"] == [
        block.name for block in factor.BLOCKS[1:]
    ]
    assert manifest["cells"][-1]["omitted_blocks"] == []
    assert len(tuple((tmp_path / "artifacts" / "inputs").glob("*.smt2"))) == 14


def test_static_check_does_not_invoke_a_solver() -> None:
    result = factor.static_check()

    assert result["status"] == "STATIC_CHECK_OK"
    assert result["cells"] == 14
