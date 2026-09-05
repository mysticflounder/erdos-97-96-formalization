from __future__ import annotations

import copy

import cardge13_exact13_coarse_cell_batch_piqd as subject
import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd as resume
import cardge13_exact13_global_source_cell_csp_piqd as base
import pytest


def source_valid_cell() -> dict[str, object]:
    return {
        "roles": {"b0": 9, "b1": 2, "s0": 4, "s1": 3, "d": 7, "z": 9},
        "base_rows": {
            "C0": [2, 4, 6, 11],
            "C1": [0, 1, 3, 10],
            "K": [5, 7, 8, 12],
            "L": [2, 9, 10, 11],
            "T": [0, 6, 7, 10],
        },
        "global_rows": {
            "3": [0, 1, 5, 8],
            "4": [0, 1, 5, 8],
            "5": [0, 1, 4, 8],
            "6": [0, 2, 4, 8],
            "7": [1, 2, 4, 5],
            "8": [2, 7, 9, 12],
            "10": [8, 9, 11, 12],
            "11": [3, 5, 7, 9],
            "12": [1, 4, 5, 8],
        },
    }


def source_event() -> dict[str, object]:
    return {
        "cell": {
            "cell_id": "direct-z09-k08-12",
            "index": 10,
            "k_i2": [8, 12],
            "l_i2": [9, 10, 11],
            "orientation": "direct",
            "z": 9,
        },
        "solves": [
            {
                "solver": "z3",
                "iterations": [
                    {
                        "index": 0,
                        "solved": {
                            "status": "SAT",
                            "model_replay": {"outcome": "SATISFIED"},
                        },
                        "cell": source_valid_cell(),
                    }
                ],
            }
        ],
    }


def atom_holds(cell: dict[str, object], atom: str) -> bool:
    if atom.startswith("m_"):
        row, point_text = atom[2:].rsplit("_", 1)
        rows = cell["base_rows"] if row in base.BASE_ROWS else cell["global_rows"]
        key = row if row in base.BASE_ROWS else row[1:]
        return int(point_text) in rows[key]
    if atom.startswith("r_"):
        role, point_text = atom[2:].rsplit("_", 1)
        return cell["roles"][role] == int(point_text)
    raise AssertionError(f"unexpected atom: {atom}")


def test_batch_enumerates_all_current_one_form_conflicts_deterministically() -> None:
    cell = source_valid_cell()
    conflicts = subject.all_incidence_path_conflicts(cell, base.DIRECT_ORDER)
    assert conflicts
    assert conflicts == subject.all_incidence_path_conflicts(cell, base.DIRECT_ORDER)
    assert len({tuple(row["form"]) for row in conflicts}) == len(conflicts)
    for conflict in conflicts:
        assert conflict["kind"] == "transitive-incidence-path"
        assert all(atom_holds(cell, atom) for atom in conflict["atoms"])


def test_unique_conflict_cuts_are_seed_compatible(tmp_path) -> None:
    conflicts = subject.all_incidence_path_conflicts(
        source_valid_cell(), base.DIRECT_ORDER
    )
    rows = subject.unique_conflict_cuts(conflicts)
    assert rows
    assert len({cut for _conflict, cut in rows}) == len(rows)
    assert all(cut.startswith("(assert (or ") for _conflict, cut in rows)

    payload = subject.batch_payload(
        manifest_sha256="1" * 64,
        source_event_path="source.json",
        source_event_bytes=b"source\n",
        event=source_event(),
    )
    event_path = tmp_path / "batch.json"
    event_path.write_bytes(coarse.canonical_json_bytes(payload))
    cuts, sources = resume.seed_cuts((event_path,))
    assert len(cuts) == payload["unique_cut_count"]
    assert sources[0]["cut_occurrences"] == payload["unique_cut_count"]


def test_batch_payload_self_hash_and_source_binding() -> None:
    payload = subject.batch_payload(
        manifest_sha256="2" * 64,
        source_event_path="source.json",
        source_event_bytes=b"source\n",
        event=source_event(),
    )
    expected = payload.pop("event_sha256")
    assert expected == coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    assert payload["source_event_sha256"] == coarse.sha256_bytes(b"source\n")
    assert payload["form_conflict_count"] >= payload["unique_cut_count"] > 0


def test_final_replayed_cell_rejects_unreplayed_sat() -> None:
    event = copy.deepcopy(source_event())
    event["solves"][0]["iterations"][0]["solved"]["model_replay"] = {
        "outcome": "FAILED"
    }
    with pytest.raises(subject.BatchIncidenceError, match="successful replay"):
        subject.final_replayed_cell(event)


def test_source_coarse_cell_rejects_boolean_index() -> None:
    event = source_event()
    event["cell"]["z"] = True
    with pytest.raises(subject.BatchIncidenceError, match="malformed"):
        subject.source_coarse_cell(event)
