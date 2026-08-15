from __future__ import annotations

import copy
import hashlib
import inspect
import subprocess
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_source_total_v1 as design
from census.p97_search.freshthird_firstnonhit_source_total_v1 import (
    FALSE_CLAIMS,
    LEAN_INGRESS_COMMIT,
    LEAN_INGRESS_DECLARATION,
    LEAN_INGRESS_FILE,
    LEAN_INGRESS_SHA256,
    PRODUCTION_LAUNCH_ENABLED,
    SOURCE_TOTAL_CLAIM,
    VERIFIED_CLAIMS,
    SourceTotalDesignError,
    contract_coverage,
    contract_coverage_summary,
    dry_run_manifest,
    obligation_family_counts,
    source_manifest,
    validate_dry_run_manifest,
    variable_family_counts,
)


def test_n17_dry_run_has_frozen_counts_and_no_launch_claim() -> None:
    manifest = dry_run_manifest(17)

    assert variable_family_counts(17) == {
        "blocker_map_one_hot": 289,
        "radius_equivalence": 2312,
        "cap_membership": 51,
        "strict_cap_interior": 51,
        "three_phase_cap_state": 51,
        "named_carrier_role_one_hot": 187,
        "constructor_guards": 8,
        "aligned_deletion_endpoint_choices": 8,
        "common_radius_representative": 17,
    }
    assert obligation_family_counts(17) == {
        "blocker_map_total": 17,
        "blocker_map_no_fixed_point": 17,
        "radius_equivalence_transitivity": 34680,
        "radius_zero_class_singleton": 272,
        "critical_selected_row_exact_four": 289,
        "critical_shell_no_qfree": 4913,
        "strict_interior_subset_cap": 51,
        "cap_three_phase_monotonicity": 867,
        "cap_cardinality_and_sum": 4,
        "first_cap_multi_point_radii_retained": 136,
        "retained_pair_disjointness": 4,
        "retained_radius_cross_pair_inequality": 4,
        "named_role_total": 11,
        "canonical_surface_payload": 154,
        "fresh_blocker_fiber_payload": 47,
        "aligned_fixed_deletion_core_payload": 80,
        "first_nonhit_constructor_payload": 38,
        "second_interaction_constructor_payload": 88,
        "q_row_fiber_and_escape_payload": 63,
        "candidate_global_third_row_negation": 17,
    }
    assert manifest["variable_total"] == 2974
    assert manifest["obligation_total"] == 41752
    assert manifest["count_semantics"]["cnf_variables"] is None
    assert manifest["count_semantics"]["cnf_clauses"] is None
    assert len(manifest["source_bindings"]) == 21
    assert len(manifest["source_manifest"]) == 16
    assert len({row["path"] for row in manifest["source_manifest"]}) == 16
    assert LEAN_INGRESS_FILE in {row["path"] for row in manifest["source_manifest"]}
    assert all(
        binding["status"] != "planned" for binding in manifest["source_bindings"]
    )
    assert manifest["lean_ingress"] == {
        "commit": LEAN_INGRESS_COMMIT,
        "path": LEAN_INGRESS_FILE,
        "sha256": LEAN_INGRESS_SHA256,
        "declaration": LEAN_INGRESS_DECLARATION,
        "axioms": ["propext", "Classical.choice", "Quot.sound"],
    }
    assert manifest["verified_claims"] == VERIFIED_CLAIMS
    assert all(value is True for value in VERIFIED_CLAIMS.values())
    assert manifest["launch_eligible"] is False
    assert PRODUCTION_LAUNCH_ENABLED is False
    assert SOURCE_TOTAL_CLAIM is False
    assert all(value is False for value in FALSE_CLAIMS.values())
    assert validate_dry_run_manifest(manifest) == manifest


def test_contract_coverage_is_total_and_keeps_query_outside_ingress() -> None:
    rows = contract_coverage(17)
    assert len(rows) == 29
    assert sum(row["instances"] for row in rows) == 2974 + 41752
    assert {(row["layer"], row["family"]) for row in rows} == {
        *(("variable", family) for family in variable_family_counts(17)),
        *(("obligation", family) for family in obligation_family_counts(17)),
    }
    query = next(
        row for row in rows if row["family"] == "candidate_global_third_row_negation"
    )
    assert query["classification"] == "query-only-not-source-ingress"
    assert query["instances"] == 17
    assert contract_coverage_summary(17) == {
        "derivable-from-landed-fields": {"families": 5, "instances": 35479},
        "directly-landed": {"families": 8, "instances": 7661},
        "missing-finite-bridge": {"families": 2, "instances": 8},
        "opaque-source-payload-not-finitely-mirrored": {
            "families": 13,
            "instances": 1561,
        },
        "query-only-not-source-ingress": {"families": 1, "instances": 17},
    }


@pytest.mark.parametrize("bad_n", [True, 16, 0, -1])
def test_carrier_bound_fails_closed(bad_n: object) -> None:
    with pytest.raises(SourceTotalDesignError):
        dry_run_manifest(bad_n)  # type: ignore[arg-type]


def test_manifest_replay_rejects_count_or_source_tampering() -> None:
    manifest = dry_run_manifest(17)
    tampered = copy.deepcopy(manifest)
    tampered["variable_family_counts"]["radius_equivalence"] += 1
    with pytest.raises(SourceTotalDesignError, match="does not replay exactly"):
        validate_dry_run_manifest(tampered)

    tampered = copy.deepcopy(manifest)
    tampered["source_manifest"][0]["sha256"] = "0" * 64
    with pytest.raises(SourceTotalDesignError, match="does not replay exactly"):
        validate_dry_run_manifest(tampered)

    tampered = copy.deepcopy(manifest)
    tampered["manifest_sha256"] = "0" * 64
    with pytest.raises(SourceTotalDesignError, match="does not replay exactly"):
        validate_dry_run_manifest(tampered)

    tampered = dry_run_manifest(17)
    tampered["false_claims"]["source_total"] = True
    assert FALSE_CLAIMS["source_total"] is False
    with pytest.raises(SourceTotalDesignError, match="does not replay exactly"):
        validate_dry_run_manifest(tampered)

    tampered = dry_run_manifest(17)
    tampered["contract_coverage"][0]["classification"] = "invented"
    with pytest.raises(SourceTotalDesignError, match="does not replay exactly"):
        validate_dry_run_manifest(tampered)


def test_source_custody_has_no_alternate_root_and_rejects_symlink(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    assert tuple(inspect.signature(source_manifest).parameters) == ()
    real = tmp_path / "real.lean"
    real.write_text("theorem x : True := by trivial\n", encoding="utf-8")
    link = tmp_path / "source.lean"
    link.symlink_to(real)
    monkeypatch.setattr(design, "SOURCE_FILES", ("source.lean",))
    with pytest.raises(SourceTotalDesignError, match="without following links"):
        design._source_digest(tmp_path, "source.lean")
    assert len(source_manifest()) == 16


def test_lean_ingress_bytes_are_bound_to_the_pinned_commit() -> None:
    repo_root = Path(design.__file__).resolve().parents[2]
    committed = subprocess.run(
        ["git", "show", f"{LEAN_INGRESS_COMMIT}:{LEAN_INGRESS_FILE}"],
        cwd=repo_root,
        check=True,
        capture_output=True,
    ).stdout
    assert hashlib.sha256(committed).hexdigest() == LEAN_INGRESS_SHA256
    ingress_row = next(
        row for row in source_manifest() if row["path"] == LEAN_INGRESS_FILE
    )
    assert ingress_row["sha256"] == LEAN_INGRESS_SHA256


def test_lean_ingress_actual_byte_drift_fails_closed(tmp_path: Path) -> None:
    altered = tmp_path / LEAN_INGRESS_FILE
    altered.parent.mkdir(parents=True)
    altered.write_text("-- altered ingress\n", encoding="utf-8")
    digest, size = design._source_digest(tmp_path, LEAN_INGRESS_FILE)
    with pytest.raises(SourceTotalDesignError, match="pinned commit digest"):
        design._validate_lean_ingress_row(
            {"path": LEAN_INGRESS_FILE, "sha256": digest, "size": size}
        )
