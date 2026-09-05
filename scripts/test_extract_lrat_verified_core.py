# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Tests for the LRAT core extractor and dense identifier remapping."""

from __future__ import annotations

import json
from pathlib import Path

import extract_lrat_verified_core as subject
import pytest

FULL_CNF = """c fixture
p cnf 2 4
1 0
-1 2 0
-2 0
1 -2 0
"""

CORE_CNF = """p cnf 2 3
-2 0
2 -1 0
1 0
"""

RAW_LRAT = """4 d 4 0
8 2 0 1 2 0
8 d 2 0
11 0 3 8 0
"""

TRACE = """1 1 0 0
2 -1 2 0 0
3 -2 0 0
8 2 0 1 2 0
11 0 3 8 0
"""


def write_fixture(root: Path, *, core: str = CORE_CNF, trace: str = TRACE) -> dict[str, Path]:
    """Write one tiny proof-custody fixture."""
    paths = {
        "full": root / "full.cnf",
        "core": root / "core.cnf",
        "raw": root / "raw.lrat",
        "trace": root / "core.trace",
    }
    paths["full"].write_text(FULL_CNF, encoding="ascii")
    paths["core"].write_text(core, encoding="ascii")
    paths["raw"].write_text(RAW_LRAT, encoding="ascii")
    paths["trace"].write_text(trace, encoding="ascii")
    return paths


def run_fixture(root: Path, paths: dict[str, Path]) -> dict[str, object]:
    """Run the extractor with deterministic output names."""
    return subject.extract_verified_core(
        full_cnf_path=paths["full"],
        raw_lrat_path=paths["raw"],
        core_cnf_path=paths["core"],
        trace_path=paths["trace"],
        output_cnf_path=root / "dense.cnf",
        output_lrat_path=root / "dense.lrat",
        output_map_path=root / "map.jsonl",
        output_receipt_path=root / "receipt.json",
    )


def test_extracts_dense_core_and_remaps_lrat(tmp_path: Path) -> None:
    """The LRAT complement controls IDs while the bare core controls content."""
    paths = write_fixture(tmp_path)
    receipt = run_fixture(tmp_path, paths)
    assert receipt["core_clause_count"] == 3
    assert (tmp_path / "dense.cnf").read_text(encoding="ascii") == (
        "p cnf 2 3\n1 0\n-1 2 0\n-2 0\n"
    )
    assert (tmp_path / "dense.lrat").read_text(encoding="ascii") == (
        "4 2 0 1 2 0\n1 d 2 0\n5 0 3 4 0\n"
    )
    rows = [json.loads(line) for line in (tmp_path / "map.jsonl").read_text().splitlines()]
    assert [row["original_clause_id"] for row in rows] == [1, 2, 3]


def test_rejects_core_content_drift(tmp_path: Path) -> None:
    """A same-sized but different bare core is not accepted."""
    paths = write_fixture(tmp_path, core="p cnf 2 3\n1 0\n-1 2 0\n1 -2 0\n")
    with pytest.raises(subject.CoreExtractionError, match="multiset differs"):
        run_fixture(tmp_path, paths)


def test_rejects_trace_id_drift(tmp_path: Path) -> None:
    """The independent trace must name exactly the LRAT-retained inputs."""
    paths = write_fixture(tmp_path, trace=TRACE.replace("3 -2 0 0\n", ""))
    with pytest.raises(subject.CoreExtractionError, match="trace input IDs differ"):
        run_fixture(tmp_path, paths)


def test_rejects_hint_to_deleted_input(tmp_path: Path) -> None:
    """A proof hint cannot smuggle a non-core input back into the dense proof."""
    paths = write_fixture(tmp_path)
    paths["raw"].write_text(RAW_LRAT.replace("1 2 0", "1 4 0"), encoding="ascii")
    with pytest.raises(subject.CoreExtractionError, match="inactive clause"):
        run_fixture(tmp_path, paths)


def test_dense_replay_rejects_nonunit_hint(tmp_path: Path) -> None:
    """Syntactically valid IDs do not suffice when a RUP hint is not unit."""
    cnf = tmp_path / "dense.cnf"
    lrat = tmp_path / "dense.lrat"
    cnf.write_text("p cnf 2 2\n1 2 0\n-1 2 0\n", encoding="ascii")
    lrat.write_text("3 0 1 0\n", encoding="ascii")
    with pytest.raises(subject.CoreExtractionError, match="neither unit nor conflicting"):
        subject.validate_dense_rup(cnf, lrat)


@pytest.mark.parametrize(
    ("bad_deletion", "message"),
    [
        ("999 d 2 0", "action id must be 1"),
        ("1 d 2 2 0", "duplicate dense deletion id"),
    ],
)
def test_dense_replay_rejects_malformed_deletion(
    tmp_path: Path,
    bad_deletion: str,
    message: str,
) -> None:
    """The direct replay enforces the canonical deletion form fail-closed."""
    paths = write_fixture(tmp_path)
    run_fixture(tmp_path, paths)
    lrat = tmp_path / "dense.lrat"
    lrat.write_text(
        lrat.read_text(encoding="ascii").replace("1 d 2 0", bad_deletion),
        encoding="ascii",
    )
    with pytest.raises(subject.CoreExtractionError, match=message):
        subject.validate_dense_rup(tmp_path / "dense.cnf", lrat)
