from __future__ import annotations

import run_schema11_round as runner


def test_case_manifest_is_exact_live_matrix() -> None:
    manifest = runner.case_manifest()
    assert len(manifest) == 16
    assert len(set(manifest)) == 16
    assert {mapping for mapping, _, _ in manifest} == {"q1-outside", "q2-outside"}
    assert {arm for _, arm, _ in manifest} == {1, 2, 3, 4}
    assert {query for _, _, query in manifest} == {
        "canonical-survives",
        "other-survives",
    }


def test_authenticated_inputs_exist_and_cover_semantics() -> None:
    paths = runner.authenticated_inputs()
    assert all(path.is_file() for path in paths)
    names = {path.name for path in paths}
    assert "freshthird_schema11_pinned_seed_probe.py" in names
    assert "schema-v11-contract.md" in names
    assert "freshthird_schema10_direct_negation_probe.py" in names
    assert "n17_freshthird_incidence_probe.py" in names
