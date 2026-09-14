from __future__ import annotations

import itertools
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import b1_wave6_card6_alias_screen as subject


@pytest.fixture(scope="module")
def full_census():
    return subject.census()


def test_static_spec_counts() -> None:
    assert len(subject.ROLES) == 16
    assert len(subject.INEQUALITY_EDGES) == 78
    assert len(subject.SYMMETRY_GROUP) == 16
    assert len(subject.LOCAL_WORDS) == 20


def test_phase0_and_duplicate_center_replay(full_census) -> None:
    summary, records = full_census
    assert summary["phase0"] == {
        "partitions": 94_381,
        "orbits": 7_287,
        "orbit_size_sum": 94_381,
    }
    assert summary["duplicate_center"] == {
        "partition_hits": 11_776,
        "orbit_hits": 829,
        "survivor_partitions": 82_605,
        "survivor_orbits": 6_458,
        "survivor_digest_csv_decimal_rgs_newline_v1": (
            "c97af327af7f63dd7f9a1dfb0006a889193ee9eede56c79b290da8e5c77d93cf"
        ),
        "survivor_digest_hex_rgs_newline_v1": (
            "c574fc9c5197e6d5378a6b261bef2296872369c6b972d5653ef92655073399a7"
        ),
    }
    assert len(records) == 7_287


def test_exact_structural_counts(full_census) -> None:
    summary, _records = full_census
    kernels = summary["six_point_five_installed_kernels"]
    assert kernels["explicit_inequalities"] == ["hAE"]
    assert kernels["matcher_policy"] == (
        "FIELD_EXACT_NONINJECTIVE_CORE_LABELS_ALLOWED"
    )
    assert kernels["partition_hits"] == 1_216
    assert kernels["orbit_hits"] == 76
    assert kernels["partition_hits_after_duplicate_center"] == 0
    assert kernels["orbit_hits_after_duplicate_center"] == 0
    assert kernels["duplicate_center_or_kernel_partition_hits"] == 11_776
    assert kernels["duplicate_center_or_kernel_orbit_hits"] == 829
    assert kernels["survivor_partitions"] == 82_605
    assert kernels["survivor_orbits"] == 6_458
    assert kernels["survivor_digest_hex_rgs_newline_v1"] == (
        "c574fc9c5197e6d5378a6b261bef2296872369c6b972d5653ef92655073399a7"
    )
    assert kernels["survivor_digest_csv_decimal_rgs_newline_v1"] == (
        "c97af327af7f63dd7f9a1dfb0006a889193ee9eede56c79b290da8e5c77d93cf"
    )
    per_kernel_expected = {
        "SixPointFiveCircleCollisionCoreA": (1_216, 76),
        "SixPointFiveCircleCollisionCoreB": (1_216, 76),
        "SixPointFiveCircleCollisionCoreC": (832, 52),
    }
    for kernel, (partition_hits, orbit_hits) in per_kernel_expected.items():
        record = kernels["kernels"][kernel]
        assert record["partition_hits"] == partition_hits
        assert record["orbit_hits"] == orbit_hits
        assert record["partition_hits_after_duplicate_center"] == 0
        assert record["orbit_hits_after_duplicate_center"] == 0
        assert len(record["fields"]) == 9
        assert len(record["field_equations"]) == 9
    assert summary["exact_edge_closure"] == {
        "partition_hits_after_installed_kernels": 8_448,
        "orbit_hits_after_installed_kernels": 666,
        "survivor_partitions": 74_157,
        "survivor_orbits": 5_792,
        "survivor_digest_hex_rgs_newline_v1": (
            "2f9c8259ca9f9aca96c9a7207a369e6a19346464dfbbf69391df83bcc2e9ca9a"
        ),
        "survivor_digest_csv_decimal_rgs_newline_v1": (
            "76aeae11094d1f8b2558a0d775c0b7fe94929a10d160b5e7ce96fadce9ce9621"
        ),
    }
    shadow = summary["endpoint_shadow"]
    assert shadow["partition_hits_after_exact_edge_closure"] == 68_478
    assert shadow["orbit_hits_after_exact_edge_closure"] == 5_359
    assert shadow["survivor_partitions"] == 5_679
    assert shadow["survivor_orbits"] == 433
    assert shadow["survivor_digest_hex_rgs_newline_v1"] == (
        "9042f7bdb12c2d279c477c8e0ca0258b4dde36258abe4fa4c62e27744e3e7436"
    )
    assert shadow["survivor_digest_csv_decimal_rgs_newline_v1"] == (
        "c5a35c0dc7e63da93f14c1fd8c414474bde3f4b0d31d0273cac285108af73900"
    )


def test_local_order_counts_and_masks(full_census) -> None:
    summary, records = full_census
    order = summary["local_order"]
    assert order["partition_hits_after_endpoint_shadow"] == 4_070
    assert order["orbit_hits_after_endpoint_shadow"] == 299
    assert order["survivor_partitions"] == 1_609
    assert order["survivor_orbits"] == 134
    assert order["minimum_feasible_type_triples"] == 216
    assert order["maximum_feasible_type_triples"] == 8_000
    assert order["total_feasible_type_triples_over_orbits"] == 509_320
    assert order["survivor_digest_hex_rgs_newline_v1"] == (
        "b28aab10d0d17bcc412c34944ee9c5d9c9495dbe08953b7888b7564860cf20e1"
    )
    assert order["survivor_digest_csv_decimal_rgs_newline_v1"] == (
        "44037f185d6615bce7d6df059392da2428f92d5a92ff62fc3ca053c74240a2fe"
    )
    for record in records:
        if record.local_order_mask_hex_le is None:
            continue
        mask = int.from_bytes(bytes.fromhex(record.local_order_mask_hex_le), "little")
        assert mask.bit_count() == record.local_order_feasible_count


def test_metric_canary_selection_and_order_leaf(full_census) -> None:
    _summary, records = full_census
    selection = subject.metric_canary_selection(records)
    assert len(selection) == 5
    assert len({record.token for _reason, record, _choice in selection}) == 5
    for _reason, record, (type_index, indices, boundary_order) in selection:
        assert record.local_order_mask_hex_le is not None
        mask = int.from_bytes(bytes.fromhex(record.local_order_mask_hex_le), "little")
        assert (mask >> type_index) & 1
        assert subject.decode_type_index(type_index) == indices
        assert sorted(boundary_order) == list(range(max(record.labels) + 1))
        positions = {item: index for index, item in enumerate(boundary_order)}
        physical = tuple(
            subject.quotient_class(record.labels, role)
            for role in ("A", *subject.PHYSICAL_ORDER)
        )
        assert list(map(positions.get, physical)) == sorted(map(positions.get, physical))
        for row, word_index in zip(subject.LOCAL_ROW_SCHEMAS, indices, strict=True):
            sequence = subject.mapped_local_sequence(
                record.labels, subject.LOCAL_WORDS[word_index], row
            )
            assert list(map(positions.get, sequence)) == sorted(
                map(positions.get, sequence)
            )


def test_qf_nra_ledger_is_quotient_exact(full_census) -> None:
    _summary, records = full_census
    _reason, record, (_type_index, _indices, boundary_order) = (
        subject.metric_canary_selection(records)[0]
    )
    solver, variables, ledger = subject.qf_nra_problem(
        record.labels, boundary_order
    )
    assert ledger["logic"] == "QF_NRA"
    assert ledger["coordinate_quotient_classes"] == max(record.labels) + 1
    assert ledger["assertion_count"] == len(solver.assertions())
    assert len(variables) == 2 * (max(record.labels) + 1)
    assert "all non-canary structural survivor orbits" in ledger["omitted"]
    source = subject.smt2_source(solver)
    assert source.startswith("(set-logic QF_NRA)\n")
    assert source.endswith("(check-sat)\n")


@pytest.mark.parametrize(
    ("stdout", "returncode", "expected"),
    (("timeout\n", 0, "timeout"), ("(error bad input)\nsat\n", 1, "error")),
)
def test_solver_receipt_parser_fails_closed(
    monkeypatch, stdout: str, returncode: int, expected: str
) -> None:
    monkeypatch.setattr(subject.shutil, "which", lambda _engine: "/solver")
    monkeypatch.setattr(
        subject.subprocess,
        "run",
        lambda *_args, **_kwargs: SimpleNamespace(
            stdout=stdout, stderr="", returncode=returncode
        ),
    )
    receipt = subject.run_smt_engine("z3", "(check-sat)\n", 1)
    assert receipt["status"] == expected


def test_fresh_distinct_has_all_local_type_triples() -> None:
    labels = tuple(range(len(subject.ROLES)))
    feasible, mask, mask_hex, digest = subject.local_order_mask(labels)
    assert feasible == 8_000
    assert mask.bit_count() == 8_000
    assert len(bytes.fromhex(mask_hex)) == 1_000
    assert len(digest) == 64


def test_installed_duplicate_center_witness_replays(full_census) -> None:
    _summary, records = full_census
    record = next(item for item in records if item.duplicate_center is not None)
    witness = record.duplicate_center
    assert witness is not None
    first_center, second_center = witness["centers"]
    points = witness["points"]
    assert first_center != second_center
    assert len(set(points)) == 3
    closure = subject.edge_closure(record.labels)
    assert len({closure.root(first_center, point) for point in points}) == 1
    assert len({closure.root(second_center, point) for point in points}) == 1


def test_six_point_five_field_exact_noninjective_regression() -> None:
    labels = tuple(int(character) for character in "0123456351070707")
    hit = subject.six_point_five_witness(
        labels, "SixPointFiveCircleCollisionCoreA"
    )
    assert hit is not None
    assignment = hit["assignment"]
    assert assignment["A"] != assignment["E"]
    assert assignment["O"] == assignment["C"]
    assert assignment["B"] == assignment["F"]
    closure = subject.edge_closure(labels)
    for _field, center, first, second in subject.SIX_POINT_FIVE_KERNELS[
        "SixPointFiveCircleCollisionCoreA"
    ]:
        assert closure.root(assignment[center], assignment[first]) == closure.root(
            assignment[center], assignment[second]
        )


def test_unordered_edge_and_exact_negative_control(full_census) -> None:
    _summary, records = full_census
    record = next(item for item in records if item.exact_edge_conflict is not None)
    closure = subject.edge_closure(record.labels)
    for first in range(closure.class_count):
        for second in range(closure.class_count):
            assert closure.root(first, second) == closure.root(second, first)
    assert record.exact_edge_conflict is not None


def test_endpoint_shadow_is_hypothesis_tagged(full_census) -> None:
    _summary, records = full_census
    record = next(item for item in records if item.endpoint_shadow_conflict is not None)
    witness = record.endpoint_shadow_conflict
    assert witness is not None
    assert witness["open_interval_roles"] == []
    assert all(witness["premise_status"].values())
    assert subject.endpoint_shadow_witness(record.labels, frozenset()) is None


def test_symmetry_canonicalization_is_invariant() -> None:
    samples = list(itertools.islice(subject.enumerate_partitions(), 100))
    for labels in samples:
        canonical = subject.canonical_orbit(labels)
        for permutation in subject.SYMMETRY_GROUP:
            assert subject.canonical_orbit(subject.act(labels, permutation)) == canonical
def test_no_overwrite_and_verify_controls(tmp_path: Path) -> None:
    documents = {subject.RESULT_PATH: b"control\n"}
    subject.write_documents(documents, root=tmp_path, overwrite=False)
    subject.verify_documents(documents, root=tmp_path)
    with pytest.raises(FileExistsError):
        subject.write_documents(documents, root=tmp_path, overwrite=False)
    target = subject.remap_root(subject.RESULT_PATH, tmp_path)
    target.write_bytes(b"mutated\n")
    with pytest.raises(AssertionError):
        subject.verify_documents(documents, root=tmp_path)


def test_metric_canary_preflight_refuses_before_solver_calls(tmp_path: Path) -> None:
    target = subject.remap_root(subject.CANARY_ROOT, tmp_path)
    target.mkdir(parents=True)
    with pytest.raises(FileExistsError, match="because canary outputs exist"):
        subject.refuse_existing_canary(root=tmp_path)
