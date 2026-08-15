# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import builtins
import dataclasses
import hashlib
import os
from pathlib import Path

import pytest

from census.p97_search import exact17_source_model_replay as replay

ROWS = (
    (1, 2, 3, 4),
    (0, 2, 5, 6),
    (0, 1, 5, 7),
    (0, 8, 9, 10),
    (0, 11, 12, 13),
    (0, 14, 15, 16),
    (0, 4, 11, 15),
    (1, 13, 14, 16),
    (3, 6, 9, 13),
    (4, 6, 7, 16),
    (5, 8, 9, 14),
    (1, 8, 10, 15),
    (7, 10, 11, 14),
    (3, 6, 12, 15),
    (5, 8, 13, 15),
    (5, 9, 11, 16),
    (2, 3, 12, 14),
)


def _assignment(next_center: int = 15, named_order: int = 0) -> tuple[int, ...]:
    truth = [False] * (replay.VARIABLE_COUNT + 1)
    for center, row in enumerate(ROWS):
        for point in row:
            truth[replay._hit_var(center, point)] = True
    truth[290 + next_center] = True
    truth[307 + named_order] = True
    return tuple(
        variable if truth[variable] else -variable
        for variable in range(1, replay.VARIABLE_COUNT + 1)
    )


def _source() -> replay.DecodedSourceModel:
    assignment = _assignment()
    truth = replay._parse_assignment(assignment)
    return replay._decode_source_model(truth, 15)


def test_hit_variable_map_is_the_lean_owned_17_by_17_table() -> None:
    variables = tuple(
        replay._hit_var(center, point)
        for center in range(replay.POINT_COUNT)
        for point in range(replay.POINT_COUNT)
    )
    assert variables == tuple(range(1, 290))
    assert tuple(replay._hit_var(center, center) for center in range(17)) == tuple(
        1 + 18 * center for center in range(17)
    )
    assert max(variables) < min(replay.CELL_ASSUMPTIONS.values())[0]
    for center, point in ((-1, 0), (0, -1), (17, 0), (0, 17), (True, 0)):
        with pytest.raises(replay.Child44ReplayError, match="Fin 17"):
            replay._hit_var(center, point)


def test_assignment_and_cell_contracts_are_strict() -> None:
    assignment = _assignment()
    assert replay._parse_assignment(assignment)[305]
    malformed = [list(assignment), assignment[:-1], assignment[:307] + (1,)]
    malformed.extend(
        [
            assignment[:1] + (0,) + assignment[2:],
            (True,) + assignment[1:],
            (309,) + assignment[1:],
        ]
    )
    for candidate in malformed:
        with pytest.raises(replay.Child44ReplayError):
            replay._parse_assignment(candidate)  # type: ignore[arg-type]

    truth = replay._parse_assignment(assignment)
    assert replay._require_cell("next-center-15", (305,), truth) == 15
    for cell_id, assumptions in (
        ("next-center-14", (304,)),
        ("next-center-16", (306,)),
        ("unknown", (305,)),
    ):
        with pytest.raises(replay.Child44ReplayError):
            replay._require_cell(cell_id, assumptions, truth)
    with pytest.raises(replay.Child44ReplayError):
        replay._require_cell("next-center-15", [305], truth)  # type: ignore[arg-type]
    false_cell = list(truth)
    false_cell[305] = False
    with pytest.raises(replay.Child44ReplayError, match="signed cell"):
        replay._require_cell("next-center-15", (305,), tuple(false_cell))


def test_source_model_inverse_is_full_and_digest_bound() -> None:
    source = _source()
    assert source.rows == ROWS
    assert source.next_center == 15
    assert source.named_order == 0
    assert source.selected_order == replay.ORDERS[0]
    replay._validate_decoded_source_model(source)
    reverse = replay._decode_source_model(replay._parse_assignment(_assignment(named_order=1)), 15)
    assert reverse.named_order == 1
    assert reverse.selected_order == replay.ORDERS[1]
    replay._validate_decoded_source_model(reverse)

    bad_rows = list(source.rows)
    bad_rows[0] = (1, 1, 3, 4)
    with pytest.raises(replay.Child44ReplayError, match="canonical"):
        replay._validate_decoded_source_model(dataclasses.replace(source, rows=tuple(bad_rows)))
    with pytest.raises(replay.Child44ReplayError, match="next row"):
        replay._validate_decoded_source_model(dataclasses.replace(source, next_center=14))
    with pytest.raises(replay.Child44ReplayError, match="digest"):
        replay._validate_decoded_source_model(dataclasses.replace(source, digest="0" * 64))
    with pytest.raises(replay.Child44ReplayError, match="selected order"):
        replay._validate_decoded_source_model(
            dataclasses.replace(source, selected_order=tuple(reversed(source.selected_order)))
        )


def test_serialized_source_model_reconstructs_only_canonical_assignment() -> None:
    source = _source()
    serialized = dataclasses.asdict(source)
    serialized["rows"] = [list(row) for row in source.rows]
    serialized["selected_order"] = list(source.selected_order)
    assert replay.canonical_assignment_from_source_model(serialized) == _assignment()
    with pytest.raises(replay.Child44ReplayError, match="ordered by variable"):
        replay._parse_assignment(tuple(reversed(_assignment())))
    mutated = dict(serialized)
    mutated["digest"] = "0" * 64
    with pytest.raises(replay.Child44ReplayError, match="digest"):
        replay.canonical_assignment_from_source_model(mutated)


@pytest.mark.parametrize(
    ("row_changes", "message"),
    [
        ({0: (0, 2, 3, 4)}, "diagonal"),
        ({4: (0, 1, 11, 13), 13: (0, 3, 6, 15), 16: (0, 2, 3, 14)}, "cover"),
        ({16: (1, 2, 3, 14)}, "three-point intersection"),
        ({8: (3, 7, 9, 13)}, "cap slice"),
        ({8: (4, 6, 9, 13)}, "outside multiplicity"),
        ({15: (5, 9, 12, 16)}, "omits label 11"),
        ({15: (0, 6, 7, 11)}, "two physical hits"),
    ],
)
def test_every_source_predicate_family_fails_closed(
    row_changes: dict[int, tuple[int, ...]], message: str
) -> None:
    source = _source()
    rows = list(source.rows)
    for center, row in row_changes.items():
        rows[center] = row
    with pytest.raises(replay.Child44ReplayError, match=message):
        replay._validate_decoded_source_model(dataclasses.replace(source, rows=tuple(rows)))


def test_tiny_streaming_dimacs_replay_checks_custody_and_clauses(tmp_path: Path) -> None:
    path = tmp_path / "tiny.cnf"
    contents = b"c tiny\np cnf 308 2\n1 -2 0\n3 0\n"
    path.write_bytes(contents)
    tiny_assignment = tuple(
        variable if variable != 2 else -variable
        for variable in range(1, replay.VARIABLE_COUNT + 1)
    )
    truth = replay._parse_assignment(tiny_assignment)
    contract = replay._RootContract(
        sha256=hashlib.sha256(contents).hexdigest(),
        variables=308,
        clauses=2,
        byte_count=len(contents),
    )
    root = replay._stream_dimacs_replay(path, truth, contract)
    assert (root.sha256, root.variables, root.clauses, root.byte_count) == (
        contract.sha256,
        308,
        2,
        len(contents),
    )

    path.write_bytes(b"p cnf 308 1\n-1 0\n")
    bad_contract = dataclasses.replace(
        contract,
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        clauses=1,
        byte_count=path.stat().st_size,
    )
    with pytest.raises(replay.Child44ReplayError, match="falsifies"):
        replay._stream_dimacs_replay(path, truth, bad_contract)

    path.write_bytes(contents)
    symlink = tmp_path / "tiny-link.cnf"
    symlink.symlink_to(path)
    with pytest.raises(replay.Child44ReplayError, match="symlink"):
        replay._stream_dimacs_replay(symlink, truth, contract)
    hardlink = tmp_path / "tiny-hardlink.cnf"
    hardlink.hardlink_to(path)
    with pytest.raises(replay.Child44ReplayError, match="regular file"):
        replay._stream_dimacs_replay(hardlink, truth, contract)

    real_parent = tmp_path / "real-parent"
    real_parent.mkdir()
    nested = real_parent / "nested.cnf"
    nested.write_bytes(contents)
    linked_parent = tmp_path / "linked-parent"
    linked_parent.symlink_to(real_parent, target_is_directory=True)
    with pytest.raises(replay.Child44ReplayError, match="symlink component"):
        replay._stream_dimacs_replay(linked_parent / "nested.cnf", truth, contract)

    long_line = tmp_path / "long.cnf"
    long_contents = b"1 " * ((replay._MAX_DIMACS_LINE_BYTES // 2) + 1)
    long_line.write_bytes(long_contents)
    long_contract = dataclasses.replace(
        contract,
        sha256=hashlib.sha256(long_contents).hexdigest(),
        clauses=0,
        byte_count=len(long_contents),
    )
    with pytest.raises(replay.Child44ReplayError, match="bounded replay"):
        replay._stream_dimacs_replay(long_line, truth, long_contract)


def test_child45_suffix_contract_is_exact_and_ordered(tmp_path: Path) -> None:
    path = tmp_path / "child45-tiny.cnf"
    contents = b"p cnf 308 2\n1 0\n-2 0\n"
    path.write_bytes(contents)
    assignment = tuple(variable if variable != 2 else -variable for variable in range(1, 309))
    truth = replay._parse_assignment(assignment)
    contract = replay._RootContract(
        sha256=hashlib.sha256(contents).hexdigest(),
        variables=308,
        clauses=2,
        byte_count=len(contents),
        suffix_start=0,
        expected_suffix=((1,), (-2,)),
    )
    root = replay._stream_dimacs_replay(path, truth, contract)
    assert root.clauses == 2
    with pytest.raises(replay.Child44ReplayError, match="suffix clauses"):
        replay._stream_dimacs_replay(
            path,
            truth,
            dataclasses.replace(contract, expected_suffix=((1,), (-3,))),
        )
    counted_contents = b"p cnf 308 2\n1 0\n-2 0\n3 0\n"
    path.write_bytes(counted_contents)
    with pytest.raises(replay.Child44ReplayError, match="clause count"):
        replay._stream_dimacs_replay(
            path,
            truth,
            dataclasses.replace(
                contract,
                sha256=hashlib.sha256(counted_contents).hexdigest(),
                byte_count=len(counted_contents),
                expected_suffix=((1,), (-2,), (3,)),
            ),
        )


def test_child45_parent_relation_streams_normalized_headers_and_rejects_mutations(
    tmp_path: Path,
) -> None:
    parent_body = b"1 0\n2 -3 0\n"
    suffix = (b"-4 0\n", b"5 -6 0\n", b"-7 0\n", b"8 9 0\n")
    parent_contents = b"p cnf 308 2\n" + parent_body
    child_contents = b"p cnf 308 6\n" + parent_body + b"".join(suffix)
    parent_path = tmp_path / "parent.cnf"
    child_path = tmp_path / "child.cnf"
    parent_path.write_bytes(parent_contents)
    child_path.write_bytes(child_contents)
    parent_contract = replay._RootContract(
        sha256=hashlib.sha256(parent_contents).hexdigest(),
        variables=308,
        clauses=2,
        byte_count=len(parent_contents),
    )
    child_contract = replay._RootContract(
        sha256=hashlib.sha256(child_contents).hexdigest(),
        variables=308,
        clauses=6,
        byte_count=len(child_contents),
        suffix_start=2,
        expected_suffix=((-4,), (5, -6), (-7,), (8, 9)),
    )
    relation = replay._stream_child45_parent_relation(
        parent_path,
        child_path,
        parent_contract,
        child_contract,
    )
    assert relation.parent == replay._RootReplay(
        parent_contract.sha256, 308, 2, len(parent_contents)
    )
    assert relation.child == replay._RootReplay(
        child_contract.sha256, 308, 6, len(child_contents)
    )

    child_path.write_bytes(b"p cnf 308 6\n1 0\n2 -4 0\n" + b"".join(suffix))
    with pytest.raises(replay.Child45ReplayError, match="body differs"):
        replay._stream_child45_parent_relation(
            parent_path, child_path, parent_contract, child_contract
        )
    child_path.write_bytes(b"p cnf 307 6\n" + parent_body + b"".join(suffix))
    with pytest.raises(replay.Child45ReplayError, match="header differs"):
        replay._stream_child45_parent_relation(
            parent_path, child_path, parent_contract, child_contract
        )
    child_path.write_bytes(child_contents)
    with pytest.raises(replay.Child45ReplayError, match="parent SHA-256"):
        replay._stream_child45_parent_relation(
            parent_path,
            child_path,
            dataclasses.replace(parent_contract, sha256="0" * 64),
            child_contract,
        )
    link = tmp_path / "child-link.cnf"
    link.symlink_to(child_path)
    with pytest.raises(replay.Child45ReplayError, match="symlink"):
        replay._stream_child45_parent_relation(
            parent_path, link, parent_contract, child_contract
        )


def test_child45_root_contract_rejects_child44_and_child44_rejects_child45(
    tmp_path: Path,
) -> None:
    wrong_root = tmp_path / "wrong-child45-root.cnf"
    wrong_root.write_bytes(b"p cnf 308 6\n")
    assignment = _assignment()
    with pytest.raises(replay.Child45ReplayError, match="parent header"):
        replay.replay_child45_assumption_sat(
            parent_cnf_path=wrong_root,
            child_cnf_path=wrong_root,
            assignment=assignment,
            cell_id="next-center-15",
            assumptions=(305,),
            expected_parent_sha256=replay.CHILD44_PARENT_SHA256,
            expected_child_sha256=replay.CHILD45_ROOT_SHA256,
        )
    with pytest.raises(replay.Child44ReplayError, match="Child44 root"):
        replay.replay_child44_assumption_sat(
            parent_cnf_path=wrong_root,
            assignment=assignment,
            cell_id="next-center-15",
            assumptions=(305,),
            expected_parent_sha256=replay.CHILD45_ROOT_SHA256,
        )


def test_child45_replay_rejects_malformed_assignment_and_hash_before_opening_path(
    tmp_path: Path,
) -> None:
    missing = tmp_path / "missing-child45.cnf"
    with pytest.raises(replay.Child45ReplayError, match="Child45 SHA-256"):
        replay.replay_child45_assumption_sat(
            parent_cnf_path=missing,
            child_cnf_path=missing,
            assignment=(1,),
            cell_id="next-center-15",
            assumptions=(305,),
            expected_parent_sha256=replay.CHILD44_PARENT_SHA256,
            expected_child_sha256="0" * 64,
        )
    with pytest.raises(replay.Child45ReplayError, match="308-literal tuple"):
        replay.replay_child45_assumption_sat(
            parent_cnf_path=missing,
            child_cnf_path=missing,
            assignment=(1,),
            cell_id="next-center-15",
            assumptions=(305,),
            expected_parent_sha256=replay.CHILD44_PARENT_SHA256,
            expected_child_sha256=replay.CHILD45_ROOT_SHA256,
        )


def test_child45_dimensions_suffix_and_assumption_bindings_are_closed() -> None:
    assert replay.CHILD45_ROOT_SHA256 == (
        "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2"
    )
    assert replay.CHILD45_ROOT_BYTE_COUNT == 291_704_992
    assert replay.CHILD45_ROOT_CLAUSE_COUNT == 5_848_824
    assert replay.CHILD45_NEW_CLAUSE_COUNT == 4
    assert replay._sha256(
        b"".join((" ".join(map(str, clause)) + " 0\n").encode("ascii") for clause in replay.CHILD45_SOURCE_VALID_SUFFIX)
    ) == replay.CHILD45_SUFFIX_SHA256
    truth = replay._parse_assignment(_assignment())
    assert replay._require_cell("next-center-15", (305,), truth) == 15
    with pytest.raises(replay.Child44ReplayError, match="cell assumptions"):
        replay._require_cell("next-center-15", (-305,), truth)


def test_offline_kalmanson_verifier_accepts_feasible_witness_and_mutations(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    source = _source()
    atom = replay._KalmansonAtom(
        index=0,
        quad_labels=(0, 1, 2, 3),
        form="adjacentSides",
        coefficients=((0, -1),),
    )
    monkeypatch.setattr(
        replay,
        "_build_kalmanson_system",
        lambda _source: ((atom,), 1, "tiny-system"),
    )
    provenance = replay.ProposalProvenance(
        engine="deterministic-delta-scan/v1",
        engine_version="1",
        method="zero-or-opposite-equality-closure-delta",
    )
    proposal = replay.KalmansonFeasibleProposal(((1, 1),), provenance)
    result = replay.verify_exact17_kalmanson_proposal(source, proposal)
    assert result.status == "KALMANSON_FEASIBLE"
    assert result.atom_count == 1
    assert result.weighted_terms == ()
    bad_atom = dataclasses.replace(atom, coefficients=((0, 0),))
    monkeypatch.setattr(
        replay,
        "_build_kalmanson_system",
        lambda _source: ((bad_atom,), 1, "tiny-system"),
    )
    with pytest.raises(replay.Child44ReplayError, match="strict atom"):
        replay.verify_exact17_kalmanson_proposal(
            source,
            proposal,
        )
    with pytest.raises(replay.Child44ReplayError, match="positive"):
        replay.verify_exact17_kalmanson_proposal(
            source,
            dataclasses.replace(proposal, class_values=((0, 1),)),
        )


def test_offline_kalmanson_verifier_replays_weighted_certificate_and_mutations() -> None:
    source = _source()
    atoms, _, _ = replay._build_kalmanson_system(source)
    proposal = replay._fast_cancellation(atoms)
    assert proposal is not None
    result = replay.verify_exact17_kalmanson_proposal(source, proposal)
    assert result.status == "LINEARLY_INFEASIBLE"
    assert result.refinement_disposition == "EXACT_WEIGHTED_CERTIFICATE_READY"
    assert len(result.weighted_terms) == 2

    bad_index = dataclasses.replace(proposal, atom_indices=(len(atoms),), weights=((1, 1),))
    with pytest.raises(replay.Child44ReplayError, match="unknown atom"):
        replay.verify_exact17_kalmanson_proposal(source, bad_index)
    bad_weight = dataclasses.replace(proposal, weights=((0, 1), (1, 1)))
    with pytest.raises(replay.Child44ReplayError, match="residual"):
        replay.verify_exact17_kalmanson_proposal(source, bad_weight)


def test_z3_is_proposal_only_and_offline_verifier_does_not_import_it(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    atom = replay._KalmansonAtom(
        index=0,
        quad_labels=(0, 1, 2, 3),
        form="adjacentSides",
        coefficients=((0, -1),),
    )
    proposal = replay._propose_kalmanson((atom,), 1)
    assert isinstance(proposal, replay.KalmansonFeasibleProposal)
    source = _source()
    monkeypatch.setattr(
        replay,
        "_build_kalmanson_system",
        lambda _source: ((atom,), 1, "tiny-system"),
    )
    real_import = builtins.__import__

    def reject_z3(name: str, *args: object, **kwargs: object) -> object:
        if name == "z3":
            raise AssertionError("offline exact verifier imported Z3")
        return real_import(name, *args, **kwargs)

    monkeypatch.setattr(builtins, "__import__", reject_z3)
    result = replay.verify_exact17_kalmanson_proposal(source, proposal)
    assert result.status == "KALMANSON_FEASIBLE"


def test_policy_tables_and_unknown_forms_are_immutable_and_fail_closed() -> None:
    with pytest.raises(TypeError):
        replay.CELL_ASSUMPTIONS["next-center-15"] = (304,)  # type: ignore[index]
    with pytest.raises(TypeError):
        replay.OLD_CAP_SLICES[8] = frozenset({6, 7})  # type: ignore[index]
    with pytest.raises(replay.Child44ReplayError, match="not registered"):
        replay._kalmanson_edges((0, 1, 2, 3), "bogus")  # type: ignore[arg-type]


def test_replay_result_types_are_frozen() -> None:
    result_types = (
        replay.DecodedSourceModel,
        replay.WeightedTerm,
        replay.ProposalProvenance,
        replay.KalmansonFeasibleProposal,
        replay.KalmansonInfeasibleProposal,
        replay.KalmansonClassification,
        replay.Child44SatReplay,
    )
    assert all(dataclasses.is_dataclass(result_type) for result_type in result_types)
    assert all(result_type.__dataclass_params__.frozen for result_type in result_types)


def test_optional_child44_scratch_integration_is_explicitly_guarded() -> None:
    if os.environ.get("P97_RUN_CHILD44_REPLAY") != "1":
        pytest.skip("set P97_RUN_CHILD44_REPLAY=1 for the 291MB Child44 replay")
    parent = Path(os.environ.get("P97_CHILD44_PARENT_CNF", ""))
    assignment_path = Path(os.environ.get("P97_CHILD44_ASSIGNMENT_FILE", ""))
    if not parent.is_file() or not assignment_path.is_file():
        pytest.skip("Child44 scratch root/assignment files are not present")
    assignment = tuple(int(item) for item in assignment_path.read_text().split())
    cell_id = os.environ["P97_CHILD44_CELL_ID"]
    assumptions = tuple(int(item) for item in os.environ["P97_CHILD44_ASSUMPTIONS"].split(","))
    result = replay.replay_child44_assumption_sat(
        parent_cnf_path=parent,
        assignment=assignment,
        cell_id=cell_id,
        assumptions=assumptions,
        expected_parent_sha256=os.environ["P97_CHILD44_PARENT_SHA256"],
    )
    assert result.cell_id == cell_id
    assert result.parent_sha256 == replay.CHILD44_PARENT_SHA256
    assert result.source_model.next_center == replay.CELL_ASSUMPTIONS[cell_id][0] - 290
