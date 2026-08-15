from __future__ import annotations

from pathlib import Path

import freshthird_schema13_universal_escape_probe as schema13

METADATA = Path(schema13.__file__).with_name("schema_v13_freshthird_universal_escape.json")


def test_self_check_builds_one_integrated_case() -> None:
    result = schema13.self_check()
    assert result["status"] == "PASS"
    assert result["schema_version"] == 13
    assert result["case_count"] == 1
    assert result["solver_check_called_for_cases"] is False
    assert result["construction_stats"]["candidate_row_count"] == 2380


def test_universal_escape_is_quantified_over_all_rows_and_points() -> None:
    stats = schema13.self_check()["construction_stats"]
    assert stats["universal_term_count"] == 17 * 17
    assert stats["candidate_point_count"] == 17


def test_canonical_fields_are_existing_n17_fields() -> None:
    result = schema13.self_check()
    fields = result["construction_stats"]
    assert fields["canonical_blocker_field"] == "row_center[z]"
    assert fields["canonical_support_field"] == "source_row[z,*]"
    assert "critical_no_K4_after_source_deletion" in fields["deletion_robustness_field"]


def test_freshthird_metadata_is_separate_from_tracked_schema13() -> None:
    assert METADATA.is_file()
    assert METADATA.name == "schema_v13_freshthird_universal_escape.json"
