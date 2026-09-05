#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Static contract tests for the B3 cyclic-order refinement."""

from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

pytest.importorskip("z3")

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_b3_cyclic_order_refinement as refinement
import rigid221_s0_b3_exactfive_factorization as factor
import rigid221_s0_blockerv_midpoint_order_probe as midpoint_order

EXPECTED_COUNTS = tuple(range(156, 289, 11))


def test_cell_inventory_and_cumulative_counts() -> None:
    cells = refinement.cell_specs()

    assert len(cells) == 26
    assert refinement.BASE_ASSERTIONS == 145
    assert refinement.EDGE_ASSERTIONS == 11
    assert refinement.EXPECTED_CUMULATIVE_COUNTS == EXPECTED_COUNTS
    assert {cell.order_cell for cell in cells} == {"forward", "reverse"}
    for order_cell in ("forward", "reverse"):
        assert [cell.edge_prefix_count for cell in cells if cell.order_cell == order_cell] == list(
            range(1, 14)
        )


@pytest.mark.parametrize("cell", refinement.cell_specs(), ids=lambda cell: cell.name)
def test_each_cell_parses_with_its_pinned_count(cell: refinement.CellSpec) -> None:
    solver = refinement.build_solver(cell)
    formula = refinement.export_smt2(cell)

    assert len(solver.assertions()) == EXPECTED_COUNTS[cell.edge_prefix_count - 1]
    assert "(check-sat)" not in formula
    assert all(token not in formula for token in ("pbeq", "pbge", "pble"))


@pytest.mark.parametrize("order_cell", midpoint_order.CELLS, ids=lambda cell: cell.name)
def test_thirteen_edge_endpoint_preserves_parent_bytes(order_cell: object) -> None:
    endpoint = next(
        cell
        for cell in refinement.cell_specs()
        if cell.order_cell == order_cell.name and cell.edge_prefix_count == 13
    )
    parent = factor.CellSpec(
        name=f"06-cyclic-order-{order_cell.name}",
        prefix_length=factor.ORDER_SENSITIVE_BLOCK_INDEX + 1,
        order_cell=order_cell.name,
        order=order_cell.order,
    )

    assert refinement.export_smt2(endpoint) == factor.export_smt2(parent)


def test_manifest_records_selected_and_omitted_edges(tmp_path: Path) -> None:
    summary = refinement.emit_bundle(tmp_path, timeout_ms=1)
    manifest = json.loads((tmp_path / "cyclic_order_refinement_manifest.json").read_text())

    assert summary["status"] == "EMITTED"
    assert summary["cells"] == 26
    assert manifest["schema"] == refinement.RESULT_SCHEMA
    assert manifest["verdict_scope"] == "formula-scoped-discovery"
    assert manifest["cell_kind"] == "monotone-control"
    assert manifest["direct_consumer"] == factor.DIRECT_CONSUMER
    assert manifest["base_prefix"]["assertions"] == 145
    assert len(manifest["cells"][0]["selected_edges"]) == 1
    assert len(manifest["cells"][0]["omitted_edges"]) == 12
    assert len(manifest["cells"][-1]["selected_edges"]) == 13
    assert manifest["cells"][-1]["omitted_edges"] == []
    assert len(tuple((tmp_path / "artifacts" / "inputs").glob("*.smt2"))) == 26


def test_static_check_and_cli_do_not_call_a_solver(capsys: pytest.CaptureFixture[str]) -> None:
    source = Path(refinement.__file__).read_text()

    assert ".check(" not in source
    assert refinement.static_check()["status"] == "STATIC_CHECK_OK"
    assert refinement.main(["--check"]) == 0
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == ""


def test_verbose_cli_reports_static_summary(capsys: pytest.CaptureFixture[str]) -> None:
    assert refinement.main(["--check", "--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out)["status"] == "STATIC_CHECK_OK"
    assert captured.err == ""
