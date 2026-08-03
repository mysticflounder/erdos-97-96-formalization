from __future__ import annotations

import json
from pathlib import Path

import round5_cegar_v18 as v18

HERE = Path(__file__).resolve().parent
CANARY_TRACE = (
    HERE / "artifacts-v17-canary2" /
    "20260802T135700.908575Z-case-pid33476" /
    "fresh_DDD_k0_d2_f1" / "cegar_trace_v17.json"
)
PRODUCTION_TRACE = (
    HERE / "artifacts-v17-production1" /
    "20260802T142433.875648Z-case-pid61508" /
    "fresh_DDD_k0_d2_f1" / "cegar_trace_v17.json"
)

EXPECTED_BANKS = {
    "SSS": (10920, "a0d34a8e613a3d15bfbe2508e6f8002655b7fc95fffd856ffc1b6dcb981beaf5"),
    "SSD": (12376, "4da9d93d4a27f359e6c006f7c64918ba252d4ccc6497f0f8b98a37e69b29076e"),
    "SDS": (12376, "5816294a9d29511f73d86e314974b692a66208ed38a81f88bdd86c307c1096aa"),
    "DSS": (12376, "7d8ead116b8311e2f7437aae64d49df07036db0d5076fb43ce342689f0c792f9"),
    "SDD": (13962, "dfa68a5e69f01f447f8f18dd677da5bfbc5b49a9338788ab22f03e04a83e4542"),
    "DSD": (13962, "066b3f9976b5e3264aed6886a454bba534f76197c47cfdbdb91a7e2421e81274"),
    "DDS": (13962, "cec346e561c9ccbc61f8da9ec91eec544f9128f11ccf8fef64a6e9081d3468a2"),
    "DDD": (15684, "0b6a64872273b44b656089f384128267beeca2d8c83382c4431f8b34fde673d7"),
}


def load_trace(path: Path) -> dict[str, object]:
    assert path.is_file(), f"missing frozen v17 trace: {path}"
    value = json.loads(path.read_text())
    assert isinstance(value, dict)
    return value


def iterations(trace: dict[str, object]) -> list[dict[str, object]]:
    value = trace["iterations"]
    assert isinstance(value, list)
    return value


def test_profile_specific_banks_have_deterministic_cardinalities_and_hashes() -> None:
    for profiles, expected in EXPECTED_BANKS.items():
        first = v18.static_triangle_bank(profiles)
        second = v18.static_triangle_bank(profiles)
        assert first == second
        assert len(first) == expected[0]
        assert len(set(first)) == expected[0]
        assert v18.static_triangle_bank_sha256(first) == expected[1]
    assert v18.static_triangle_bank_manifest() == {
        profiles: {"cut_count": count, "descriptor_sha256": digest}
        for profiles, (count, digest) in EXPECTED_BANKS.items()
    }


def test_ddd_bank_has_audited_clause_length_distribution() -> None:
    distribution: dict[int, int] = {}
    for cut in v18.static_triangle_bank("DDD"):
        length = 6 + len(cut.used_centers)
        distribution[length] = distribution.get(length, 0) + 1
    assert distribution == {6: 1764, 7: 6792, 8: 5808, 9: 1320}


def test_all_eleven_canary_assignments_are_static_and_core_specialized() -> None:
    trace = load_trace(CANARY_TRACE)
    bank = v18.static_triangle_bank("DDD")
    entries = iterations(trace)
    assert len(entries) == 11
    for entry in entries:
        assignment = v18.assignment_map(entry)
        core = v18.projected_core_map(entry)
        hits = v18.matching_static_cuts(bank, assignment)
        assert hits, f"canary iteration {entry['iteration']} escaped the static bank"
        assert any(cut.specializes(core) for cut in hits)


def test_production_bank_rejects_41_of_45_equality_assignments() -> None:
    trace = load_trace(PRODUCTION_TRACE)
    bank = v18.static_triangle_bank("DDD")
    equality_entries = [
        entry for entry in iterations(trace)
        if entry["full_check"]["lane"] == "equality_closure_raw_replay"
    ]
    assert len(equality_entries) == 45
    rejected = [
        int(entry["iteration"])
        for entry in equality_entries
        if v18.matching_static_cuts(bank, v18.assignment_map(entry))
    ]
    dynamic = [
        int(entry["iteration"])
        for entry in equality_entries
        if not v18.matching_static_cuts(bank, v18.assignment_map(entry))
    ]
    assert len(rejected) == 41
    assert dynamic == [36, 37, 42, 44]


def test_four_longer_path_assignments_remain_in_dynamic_lane() -> None:
    trace = load_trace(PRODUCTION_TRACE)
    bank = v18.static_triangle_bank("DDD")
    by_iteration = {int(entry["iteration"]): entry for entry in iterations(trace)}
    expected_core_sizes = {36: 9, 37: 9, 42: 9, 44: 12}
    for index, core_size in expected_core_sizes.items():
        entry = by_iteration[index]
        assert entry["full_check"]["lane"] == "equality_closure_raw_replay"
        assert len(entry["projected_core"]) == core_size
        assert not v18.matching_static_cuts(bank, v18.assignment_map(entry))
        assert entry["full_check"]["generalized"] is True


def test_full_assignment_blockers_are_never_claimed_generalized() -> None:
    trace = load_trace(PRODUCTION_TRACE)
    bank = v18.static_triangle_bank("DDD")
    fixed_entries = [
        entry for entry in iterations(trace)
        if entry["full_check"]["lane"] == "fixed_assignment_qf_lra"
    ]
    assert len(fixed_entries) == 19
    for entry in fixed_entries:
        assert len(entry["projected_core"]) == 825
        assert entry["full_check"]["generalized"] is False
        assert entry["full_check"]["blocker_scope"] == "complete_semantic_assignment"
        assert not v18.matching_static_cuts(bank, v18.assignment_map(entry))


def test_provenance_pins_v17_and_v18_sources() -> None:
    provenance = v18.provenance()
    assert provenance["schema_version"] == 18
    assert provenance["script_sha256"] == v18.file_sha256(v18.SCRIPT_PATH)
    assert provenance["schema_sha256"] == v18.file_sha256(v18.SCHEMA_PATH)
    assert provenance["base_v17_script_sha256"] == v18.file_sha256(v18.HERE / "round5_cegar_v17.py")
    assert provenance["base_v17_schema_sha256"] == v18.file_sha256(v18.HERE / "schema_v17.json")
    assert provenance["base_v17_focused_test_source_sha256"] == v18.v17.provenance()["focused_test_source_sha256"]
    assert provenance["base_v17_focused_test_log_sha256"] == v18.v17.provenance()["focused_test_log_sha256"]
    assert provenance["static_equality_triangle_bank_manifest"] == v18.static_triangle_bank_manifest()
    assert provenance["focused_test_source_sha256"] == v18.file_sha256(v18.TEST_PATH)
    assert provenance["focused_test_log_sha256"] == v18.optional_file_sha256(v18.FOCUSED_TEST_LOG_PATH)
    assert provenance["focused_test_command"] == v18.FOCUSED_TEST_COMMAND


def test_v16_budget_reasons_are_renamed_directly_to_v18() -> None:
    assignment = {"reason_incomplete": "v16_assignment_budget_exhausted"}
    wall = {"reason_incomplete": "v16_wall_clock_budget_exhausted"}
    v18._rename_incomplete_reason(assignment)
    v18._rename_incomplete_reason(wall)
    assert assignment["reason_incomplete"] == "v18_assignment_budget_exhausted"
    assert wall["reason_incomplete"] == "v18_wall_clock_budget_exhausted"
