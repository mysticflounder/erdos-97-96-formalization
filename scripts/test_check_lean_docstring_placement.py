from __future__ import annotations

from pathlib import Path

import check_lean_docstring_placement as checker
import pytest


def kinds(text: str) -> list[str]:
    return [finding.kind for finding in checker.check_text(text, "T.lean")]


def test_single_docstring_is_accepted() -> None:
    text = "/-- A row bound. -/\ntheorem row_bound : True := trivial\n"
    assert kinds(text) == []


def test_attribute_before_docstring_is_accepted() -> None:
    text = "/-- A row bound. -/\n@[simp]\ntheorem row_bound : True := trivial\n"
    assert kinds(text) == []


def test_adjacent_docstrings_are_rejected() -> None:
    text = (
        "/-- The hand-written statement of the row bound. -/\n"
        "/-- P97 generated theorem. -/\n"
        "theorem row_bound : True := trivial\n"
    )
    assert kinds(text) == [checker.ADJACENT]


def test_adjacent_docstrings_across_a_blank_line_are_rejected() -> None:
    text = (
        "/-- The hand-written statement. -/\n"
        "\n"
        "/-- P97 generated theorem. -/\n"
        "theorem row_bound : True := trivial\n"
    )
    assert kinds(text) == [checker.ADJACENT]


def test_multi_line_docstring_pair_is_rejected() -> None:
    text = (
        "/-- The hand-written statement of the row bound,\n"
        "which runs over two lines. -/\n"
        "/-- P97 generated theorem. -/\n"
        "theorem row_bound : True := trivial\n"
    )
    findings = checker.check_text(text, "T.lean")
    assert [finding.kind for finding in findings] == [checker.ADJACENT]
    assert findings[0].line == 3


def test_docstring_after_attribute_is_rejected() -> None:
    text = (
        "@[simp]\n"
        "/-- P97 generated theorem. -/\n"
        "theorem row_bound : True := trivial\n"
    )
    findings = checker.check_text(text, "T.lean")
    assert [finding.kind for finding in findings] == [checker.AFTER_ATTRIBUTE]
    assert findings[0].line == 2


def test_both_defects_in_one_file_are_reported_in_line_order() -> None:
    text = (
        "/-- First. -/\n"
        "/-- Second. -/\n"
        "theorem a : True := trivial\n"
        "\n"
        "@[simp]\n"
        "/-- Third. -/\n"
        "theorem b : True := trivial\n"
    )
    findings = checker.check_text(text, "T.lean")
    assert [(finding.line, finding.kind) for finding in findings] == [
        (2, checker.ADJACENT),
        (6, checker.AFTER_ATTRIBUTE),
    ]


def test_plain_block_comment_between_docstrings_is_accepted() -> None:
    text = (
        "/-- A row bound. -/\n"
        "theorem a : True := trivial\n"
        "/- an ordinary comment -/\n"
        "/-- Another row bound. -/\n"
        "theorem b : True := trivial\n"
    )
    assert kinds(text) == []


def test_docstring_text_inside_a_comment_is_not_a_finding() -> None:
    text = (
        "/- The bulk pass wrote this shape:\n"
        "   /-- one -/\n"
        "   /-- two -/\n"
        "   which the parser rejects. -/\n"
        "theorem a : True := trivial\n"
    )
    assert kinds(text) == []


def test_comment_opener_inside_a_string_literal_is_ignored() -> None:
    text = (
        'def marker : String := "/-- not a comment -/"\n'
        "/-- A row bound. -/\n"
        "theorem a : True := trivial\n"
    )
    assert kinds(text) == []


def test_module_doc_before_a_declaration_docstring_is_accepted() -> None:
    text = (
        "/-!\n"
        "# Row bounds\n"
        "-/\n"
        "\n"
        "/-- A row bound. -/\n"
        "theorem a : True := trivial\n"
    )
    assert kinds(text) == []


def test_line_comment_holding_a_comment_opener_is_ignored() -> None:
    text = (
        "-- the bulk pass emitted /-- here\n"
        "/-- A row bound. -/\n"
        "theorem a : True := trivial\n"
    )
    assert kinds(text) == []


def test_attribute_spanning_the_declaration_line_is_accepted() -> None:
    text = "/-- A row bound. -/\n@[simp] theorem a : True := trivial\n"
    assert kinds(text) == []


def test_main_reports_zero_on_a_clean_tree(tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    source = tmp_path / "Clean.lean"
    source.write_text("/-- A row bound. -/\ntheorem a : True := trivial\n", encoding="utf-8")
    assert checker.main([str(source)]) == 0
    assert "no misplaced doc comments" in capsys.readouterr().out


def test_main_reports_one_on_a_broken_tree(tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    source = tmp_path / "Broken.lean"
    source.write_text(
        "@[simp]\n/-- A row bound. -/\ntheorem a : True := trivial\n",
        encoding="utf-8",
    )
    assert checker.main([str(source)]) == 1
    assert checker.AFTER_ATTRIBUTE in capsys.readouterr().out


def test_main_reports_two_on_a_missing_path(tmp_path: Path) -> None:
    assert checker.main([str(tmp_path / "absent")]) == 2


def test_json_report_is_well_formed(tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    import json

    source = tmp_path / "Broken.lean"
    source.write_text(
        "/-- one -/\n/-- two -/\ntheorem a : True := trivial\n",
        encoding="utf-8",
    )
    assert checker.main([str(source), "--json"]) == 1
    report = json.loads(capsys.readouterr().out)
    assert report["schema"] == "lean-docstring-placement/v1"
    assert report["finding_count"] == 1
    assert report["findings"][0]["kind"] == checker.ADJACENT


def test_repository_lean_tree_is_clean() -> None:
    """The tree must stay free of both defects; this is the CI gate itself."""
    repo_root = Path(__file__).resolve().parent.parent
    findings = checker.check_paths([repo_root / "lean"], repo_root)
    assert findings == [], "\n".join(finding.as_text() for finding in findings)
