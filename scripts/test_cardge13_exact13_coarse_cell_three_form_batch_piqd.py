from __future__ import annotations

import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_coarse_cell_three_form_batch_piqd as subject
import cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd as resume
import cardge13_exact13_global_source_cell_csp_piqd as base
import test_cardge13_exact13_coarse_cell_batch_piqd as fixtures


def atom_holds(cell: dict[str, object], atom: str) -> bool:
    if atom.startswith("is_"):
        role, point_text = atom[3:].rsplit("_", 1)
        return cell["roles"][role] == int(point_text)
    return fixtures.atom_holds(cell, atom)


def test_equal_weight_candidates_have_nonzero_zero_sum_vectors() -> None:
    cell = fixtures.source_valid_cell()
    roots = base.edge_roots_for_rows(base.cell_rows(cell))
    candidates = subject.equal_weight_three_form_candidates(cell, base.DIRECT_ORDER)
    assert candidates
    assert candidates == subject.equal_weight_three_form_candidates(
        cell, base.DIRECT_ORDER
    )
    for forms in candidates:
        vectors = tuple(base.projected_form_vector(form, roots) for form in forms)
        assert all(vectors)
        assert subject.add_vectors(*vectors) == ()


def test_three_form_conflicts_have_six_paths_and_source_true_atoms() -> None:
    cell = fixtures.source_valid_cell()
    conflicts = subject.all_three_form_incidence_conflicts(cell, base.DIRECT_ORDER)
    assert conflicts
    for conflict in conflicts:
        assert conflict["kind"] == "three-form-incidence-path"
        assert len(conflict["forms"]) == 3
        assert len(conflict["pairings"]) == 6
        assert all(atom_holds(cell, atom) for atom in conflict["atoms"])


def test_three_form_payload_is_hashed_and_seed_compatible(tmp_path) -> None:
    payload = subject.batch_payload(
        manifest_sha256="4" * 64,
        source_event_path="source.json",
        source_event_bytes=b"source\n",
        event=fixtures.source_event(),
    )
    expected = payload.pop("event_sha256")
    assert expected == coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    assert payload["three_form_candidate_count"] >= payload["unique_cut_count"] > 0

    payload["event_sha256"] = expected
    event_path = tmp_path / "three-form-batch.json"
    event_path.write_bytes(coarse.canonical_json_bytes(payload))
    cuts, sources = resume.seed_cuts((event_path,))
    assert len(cuts) == payload["unique_cut_count"]
    assert sources[0]["cut_occurrences"] == payload["unique_cut_count"]
