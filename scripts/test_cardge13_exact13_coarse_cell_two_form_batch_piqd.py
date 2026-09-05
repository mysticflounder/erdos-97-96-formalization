from __future__ import annotations

import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_coarse_cell_two_form_batch_piqd as subject
import cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd as resume
import cardge13_exact13_global_source_cell_csp_piqd as base
import test_cardge13_exact13_coarse_cell_batch_piqd as fixtures


def atom_holds(cell: dict[str, object], atom: str) -> bool:
    if atom.startswith("is_"):
        role, point_text = atom[3:].rsplit("_", 1)
        return cell["roles"][role] == int(point_text)
    return fixtures.atom_holds(cell, atom)


def test_opposite_form_pairs_are_complete_and_deterministic() -> None:
    cell = fixtures.source_valid_cell()
    pairs = subject.opposite_form_pairs(cell, base.DIRECT_ORDER)
    assert pairs
    assert pairs == subject.opposite_form_pairs(cell, base.DIRECT_ORDER)
    roots = base.edge_roots_for_rows(base.cell_rows(cell))
    identifiers: set[tuple[tuple[int, ...], tuple[int, ...]]] = set()
    for left, right in pairs:
        left_vector = base.projected_form_vector(left, roots)
        right_vector = base.projected_form_vector(right, roots)
        assert left_vector
        assert subject.negative_vector(left_vector) == right_vector
        identifiers.add((tuple(left["form"]), tuple(right["form"])))
    assert len(identifiers) == len(pairs)


def test_two_form_conflicts_have_source_true_atoms() -> None:
    cell = fixtures.source_valid_cell()
    conflicts = subject.all_two_form_incidence_conflicts(cell, base.DIRECT_ORDER)
    assert conflicts
    assert conflicts == subject.all_two_form_incidence_conflicts(
        cell, base.DIRECT_ORDER
    )
    for conflict in conflicts:
        assert conflict["kind"] == "two-form-incidence-path"
        assert len(conflict["forms"]) == 2
        assert all(atom_holds(cell, atom) for atom in conflict["atoms"])


def test_two_form_batch_payload_is_hashed_and_seed_compatible(tmp_path) -> None:
    payload = subject.batch_payload(
        manifest_sha256="3" * 64,
        source_event_path="source.json",
        source_event_bytes=b"source\n",
        event=fixtures.source_event(),
    )
    expected = payload.pop("event_sha256")
    assert expected == coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    assert payload["opposite_form_pair_count"] >= payload["unique_cut_count"] > 0

    payload["event_sha256"] = expected
    event_path = tmp_path / "two-form-batch.json"
    event_path.write_bytes(coarse.canonical_json_bytes(payload))
    cuts, sources = resume.seed_cuts((event_path,))
    assert len(cuts) == payload["unique_cut_count"]
    assert sources[0]["cut_occurrences"] == payload["unique_cut_count"]
