from __future__ import annotations

import json
import os
from dataclasses import replace
from pathlib import Path

import pytest

from census.card_head.piqd_certified_solver import PiqdCertifiedSolver
from census.card_head.piqd_frontier_package import (
    BUILD_PHASE_LEDGER_SCHEMA,
    FRONTIER_PACKAGE_SCHEMA,
    FRONTIER_PROFILE_SCHEMA,
    SOURCE_MANIFEST_SCHEMA,
    VARIABLE_MAP_SCHEMA,
    BuildAllocation,
    BuildPhase,
    BuildQuery,
    FrontierAuthenticatedPackage,
    FrontierLaneProfile,
    FrontierPackageError,
    FrontierPackageLimits,
    PathSourceSnapshot,
    build_complete_variable_map,
    build_frontier_authenticated_package,
    build_phase_ledger,
    capture_source_file,
    snapshot_source_bytes,
)
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_card_head_adapter import (
    AuthenticatedPackageSnapshot,
    EndpointLimits,
)

CNF = b"p cnf 4 2\n1 -2 0\n4 0\n"


def _json(raw: bytes) -> dict[str, object]:
    value = json.loads(raw)
    assert type(value) is dict
    return value


def _profile(*, lane: str = "B", query_id: str = "B.base") -> FrontierLaneProfile:
    return FrontierLaneProfile(
        lane=lane,
        query_id=query_id,
        wave_id=f"frontier-{str(lane).lower()}-{query_id.replace('.', '-')}",
        live_leaf="Problem97.Frontier.liveLeaf",
        finite_schema="p97-frontier-finite-fixture/v1",
        cardinality_scope="one exact finite diagnostic query only",
        source_theorem="NONE: finite evidence only",
        query_polarity="UNSAT_MEANS_OBSTRUCTION",
    )


def _ledger(cnf: bytes = CNF, *, query_id: str = "B.base") -> bytes:
    num_vars = BuildQuery.from_cnf(query_id, cnf).num_variables
    return build_phase_ledger(
        (
            BuildPhase(
                "base",
                (BuildAllocation(1, num_vars, "base named and auxiliary variables"),),
                num_vars,
                BuildQuery.from_cnf(query_id, cnf),
            ),
        ),
        query_id,
    )


def _package(
    *,
    cnf: bytes = CNF,
    variable_map: bytes | None = None,
    ledger: bytes | None = None,
    profile: FrontierLaneProfile | None = None,
    sources: tuple = (),
    limits: FrontierPackageLimits | None = None,
) -> FrontierAuthenticatedPackage:
    query_id = "B.base" if profile is None else profile.query_id
    profile = _profile(query_id=query_id) if profile is None else profile
    if variable_map is None:
        variable_map = build_complete_variable_map(cnf, {"eq(a,b)": 1, "row(q,w)": 2})
    if ledger is None:
        ledger = _ledger(cnf, query_id=query_id)
    if not sources:
        sources = (
            snapshot_source_bytes("contracts/producer.json", b"{}\n"),
            snapshot_source_bytes("lean/Frontier.lean", b"theorem fixture := True\n"),
        )
    kwargs = {}
    if limits is not None:
        kwargs["limits"] = limits
    return build_frontier_authenticated_package(
        cnf=cnf,
        variable_map_bytes=variable_map,
        source_snapshots=sources,
        build_phase_ledger_bytes=ledger,
        lane_profile=profile,
        **kwargs,
    )


def _tamper(raw: bytes, mutate) -> bytes:
    value = json.loads(raw)
    mutate(value)
    return canonical_json_bytes(value)


def test_builds_existing_authenticated_snapshot_and_retains_exact_inputs() -> None:
    variable_map = build_complete_variable_map(CNF, {"eq(a,b)": 1, "row(q,w)": 2})
    ledger = _ledger()
    sources = (
        snapshot_source_bytes("a", b"alpha"),
        snapshot_source_bytes("b", b"beta"),
    )
    package = _package(variable_map=variable_map, ledger=ledger, sources=sources)

    assert type(package) is FrontierAuthenticatedPackage
    assert type(package.snapshot) is AuthenticatedPackageSnapshot
    assert package.snapshot.cnf is package.cnf is CNF
    assert package.snapshot.producer_manifest is package.producer_manifest_bytes
    assert package.snapshot.wave_manifest_bytes is package.wave_manifest_bytes
    assert package.variable_map_bytes is variable_map
    assert package.build_phase_ledger_bytes is ledger
    assert package.source_snapshots is sources

    producer = _json(package.producer_manifest_bytes)
    assert producer["schema"] == FRONTIER_PACKAGE_SCHEMA
    assert producer["variable_map_sha256"] == sha256_bytes(variable_map)
    assert producer["source_manifest_sha256"] == sha256_bytes(
        package.source_manifest_bytes
    )
    assert producer["build_phase_ledger_sha256"] == sha256_bytes(ledger)
    assert producer["semantic_status"] == "FINITE_LOCAL"
    assert producer["evidence_classification"] == "LOCAL_CERTIFICATE"
    assert set(producer["claims"].values()) == {False}


def test_generated_wave_is_closed_cadical_sat_single_shard() -> None:
    package = _package()
    wave = _json(package.wave_manifest_bytes)
    assert wave["schema"] == "p97-cegar-wave/v1"
    assert wave["execution"] == {
        "backend": "cadical",
        "order_sha256": sha256_bytes(package.build_phase_ledger_bytes),
        "seed": 97,
        "shard_count": 1,
        "shard_id": 0,
        "solver_profile": "sat",
    }
    assert wave["promotion"] == {
        "consumer_theorem": None,
        "evidence_classification": "LOCAL_CERTIFICATE",
        "lift_theorem": None,
        "producer_theorem": None,
    }
    assert wave["encoding"]["query_polarity"] == "UNSAT_MEANS_OBSTRUCTION"
    assert wave["source"]["ingress_hypotheses_sha256"] == sha256_bytes(
        package.source_manifest_bytes
    )


def test_existing_fixed_certified_solver_accepts_package_snapshot_with_fakes() -> None:
    class FakeReplayer:
        def replay(self, **_kwargs):
            raise AssertionError("fake replayer must not run during construction")

    def fake_transport(_request):
        raise AssertionError("fake transport must not run during construction")

    package = _package()
    solver = PiqdCertifiedSolver(package.snapshot, fake_transport, FakeReplayer())
    assert solver.package is package.snapshot


def test_result_record_cannot_be_reconstructed_with_drifted_custody_fields() -> None:
    package = _package()
    with pytest.raises(FrontierPackageError, match="authenticated snapshot"):
        replace(package, cnf=b"p cnf 4 1\n1 0\n")
    with pytest.raises(FrontierPackageError, match="exact source snapshots"):
        replace(package, source_manifest_bytes=package.source_manifest_bytes + b"\n")
    with pytest.raises(FrontierPackageError, match="frontier binding"):
        replace(
            package,
            lane_profile_bytes=_tamper(
                package.lane_profile_bytes, lambda value: value.update(lane="C")
            ),
        )


def test_profile_is_canonical_closed_finite_local_record() -> None:
    profile = _profile(lane="DE", query_id="DE.core")
    package = _package(profile=profile)
    value = _json(package.lane_profile_bytes)
    assert canonical_json_bytes(value) == package.lane_profile_bytes
    assert value["schema"] == FRONTIER_PROFILE_SCHEMA
    assert value["lane"] == "DE"
    assert value["live_leaf"] == profile.live_leaf
    assert value["finite_schema"] == profile.finite_schema
    assert value["cardinality_scope"] == profile.cardinality_scope
    assert value["source_theorem"] == profile.source_theorem
    assert value["semantic_status"] == "FINITE_LOCAL"
    assert value["evidence_classification"] == "LOCAL_CERTIFICATE"
    assert set(value["claims"].values()) == {False}


@pytest.mark.parametrize("lane", ["A", "B", "C", "DE", "DR", "E"])
def test_closed_lane_set_accepts_all_frontier_lanes(lane: str) -> None:
    profile = _profile(lane=lane, query_id=f"{lane}.query")
    assert _package(profile=profile).snapshot.cnf == CNF


@pytest.mark.parametrize("lane", ["F", "b", True, 1])
def test_closed_lane_set_rejects_other_or_nonexact_values(lane: object) -> None:
    with pytest.raises(FrontierPackageError, match="lane"):
        _profile(lane=lane)  # type: ignore[arg-type]


def test_variable_map_covers_declared_unused_anonymous_auxiliary() -> None:
    value = _json(build_complete_variable_map(CNF, {"eq(a,b)": 1, "row(q,w)": 2}))
    assert value["schema"] == VARIABLE_MAP_SCHEMA
    assert value["coverage"] == "COMPLETE_1_TO_NUM_VARIABLES"
    assert [entry["id"] for entry in value["entries"]] == [1, 2, 3, 4]
    assert value["entries"][2] == {
        "id": 3,
        "kind": "anonymous_auxiliary",
        "name": "anonymous_auxiliary:3",
        "used_in_cnf": False,
    }
    assert value["entries"][3]["used_in_cnf"] is True


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        (lambda value: value["entries"].pop(1), "exactly num_variables"),
        (lambda value: value["entries"][1].update(id=1), "exactly 1..num_variables"),
        (lambda value: value["entries"][0].update(id=True), "exactly 1..num_variables"),
        (lambda value: value["entries"][2].update(name="aux-3"), "not deterministic"),
        (lambda value: value["entries"][2].update(used_in_cnf=True), "flag drifted"),
        (
            lambda value: value["entries"][1].update(name="eq(a,b)"),
            "names must be unique",
        ),
        (lambda value: value["entries"][1].update(kind=[]), "kind is invalid"),
    ],
)
def test_variable_map_adversarial_drift_fails_closed(mutation, message: str) -> None:
    raw = build_complete_variable_map(CNF, {"eq(a,b)": 1, "row(q,w)": 2})
    with pytest.raises(FrontierPackageError, match=message):
        _package(variable_map=_tamper(raw, mutation))


def test_variable_map_rejects_noncanonical_and_duplicate_json_keys() -> None:
    raw = build_complete_variable_map(CNF, {})
    with pytest.raises(FrontierPackageError, match="canonical"):
        _package(variable_map=raw + b"\n")
    duplicate = raw.replace(b'{"coverage":', b'{"schema":"duplicate","coverage":', 1)
    with pytest.raises(FrontierPackageError, match="strict JSON"):
        _package(variable_map=duplicate)


def test_named_map_rejects_duplicate_bool_and_int_subclass_ids() -> None:
    class FancyInt(int):
        pass

    with pytest.raises(FrontierPackageError, match="unique"):
        build_complete_variable_map(CNF, {"a": 1, "b": 1})
    with pytest.raises(FrontierPackageError, match="builtin ints"):
        build_complete_variable_map(CNF, {"a": True})
    with pytest.raises(FrontierPackageError, match="builtin ints"):
        build_complete_variable_map(CNF, {"a": FancyInt(1)})
    with pytest.raises(FrontierPackageError, match="names must be unique"):
        build_complete_variable_map(CNF, {"anonymous_auxiliary:2": 1})


def test_c_ledger_tracks_del3_then_c1_then_c2_p_and_unused_del3_ids() -> None:
    base = b"p cnf 2 1\n1 0\n"
    c1 = b"p cnf 4 2\n1 0\n3 -4 0\n"
    c2 = b"p cnf 6 2\n1 0\n5 -6 0\n"
    phases = (
        BuildPhase(
            "base",
            (BuildAllocation(1, 2, "base"),),
            2,
            BuildQuery.from_cnf("C.base", base),
        ),
        BuildPhase(
            "DEL3 auxiliary allocation", (BuildAllocation(3, 4, "DEL3 Sinz"),), 4
        ),
        BuildPhase("C1", (), 4, BuildQuery.from_cnf("C.C1", c1)),
        BuildPhase(
            "C2 P interval/final dimensions",
            (BuildAllocation(5, 6, "C2 P interval"),),
            6,
            BuildQuery.from_cnf("C.C2", c2),
        ),
    )
    ledger = build_phase_ledger(phases, "C.C2")
    variable_map = build_complete_variable_map(c2, {"base(1)": 1, "P(a)": 5})
    package = _package(
        cnf=c2,
        variable_map=variable_map,
        ledger=ledger,
        profile=_profile(lane="C", query_id="C.C2"),
    )
    ledger_value = _json(package.build_phase_ledger_bytes)
    assert ledger_value["schema"] == BUILD_PHASE_LEDGER_SCHEMA
    assert [phase["allocator_num_variables"] for phase in ledger_value["phases"]] == [
        2,
        4,
        4,
        6,
    ]
    entries = _json(variable_map)["entries"]
    assert entries[2]["used_in_cnf"] is False
    assert entries[3]["used_in_cnf"] is False


@pytest.mark.parametrize(
    ("phases", "message"),
    [
        (
            (
                BuildPhase(
                    "base",
                    (BuildAllocation(2, 4, "gap"),),
                    4,
                    BuildQuery.from_cnf("B.base", CNF),
                ),
            ),
            "gap or overlap",
        ),
        (
            (
                BuildPhase(
                    "base",
                    (BuildAllocation(1, 4, "base"),),
                    3,
                    BuildQuery.from_cnf("B.base", CNF),
                ),
            ),
            "watermark drifted",
        ),
    ],
)
def test_ledger_allocation_drift_fails_closed(phases, message: str) -> None:
    with pytest.raises(FrontierPackageError, match=message):
        build_phase_ledger(phases, "B.base")


def test_ledger_requires_target_as_final_query_and_exact_cnf() -> None:
    with pytest.raises(FrontierPackageError, match="final ledger query"):
        build_phase_ledger(
            (
                BuildPhase(
                    "base",
                    (BuildAllocation(1, 4, "base"),),
                    4,
                    BuildQuery.from_cnf("B.other", CNF),
                ),
            ),
            "B.base",
        )
    wrong = b"p cnf 4 1\n2 0\n"
    with pytest.raises(FrontierPackageError, match="exact package CNF"):
        _package(ledger=_ledger(wrong))


def test_ledger_rejects_bool_index_and_noncanonical_bytes() -> None:
    ledger = _ledger()
    tampered = _tamper(
        ledger, lambda value: value["phases"][0].update(phase_index=True)
    )
    with pytest.raises(FrontierPackageError, match="builtin ints"):
        _package(ledger=tampered)
    with pytest.raises(FrontierPackageError, match="canonical"):
        _package(ledger=ledger + b"\n")


def test_query_scoped_packages_bind_different_effective_cnf_bytes() -> None:
    base = b"p cnf 2 1\n1 0\n"
    extended = b"p cnf 2 2\n1 0\n-2 0\n"
    base_package = _package(
        cnf=base,
        variable_map=build_complete_variable_map(base, {"x": 1}),
        ledger=_ledger(base),
    )
    extended_package = _package(
        cnf=extended,
        variable_map=build_complete_variable_map(extended, {"x": 1}),
        ledger=_ledger(extended),
    )
    assert base_package.snapshot.cnf == base
    assert extended_package.snapshot.cnf == extended
    assert (
        base_package.snapshot.package_identity
        != extended_package.snapshot.package_identity
    )


def test_memory_source_manifest_is_exact_bounded_and_sorted() -> None:
    sources = (
        snapshot_source_bytes("a", b"alpha"),
        snapshot_source_bytes("z", b"zeta"),
    )
    package = _package(sources=sources)
    manifest = _json(package.source_manifest_bytes)
    assert manifest["schema"] == SOURCE_MANIFEST_SCHEMA
    assert manifest["source_count"] == 2
    assert manifest["total_bytes"] == 9
    assert manifest["entries"][0]["capture_kind"] == "memory"
    assert manifest["entries"][0]["sha256"] == sha256_bytes(b"alpha")
    with pytest.raises(FrontierPackageError, match="uniquely sorted"):
        _package(sources=tuple(reversed(sources)))


def test_memory_source_limits_and_closed_container_types() -> None:
    limits = FrontierPackageLimits(
        endpoint_limits=EndpointLimits(),
        source_file_bytes=3,
        source_total_bytes=4,
        source_files=1,
    )
    with pytest.raises(FrontierPackageError, match="source_file_bytes"):
        snapshot_source_bytes("a", b"four", limits=limits)
    one = snapshot_source_bytes("a", b"abc", limits=limits)
    with pytest.raises(FrontierPackageError, match="nonempty exact tuple"):
        build_frontier_authenticated_package(
            cnf=CNF,
            variable_map_bytes=build_complete_variable_map(CNF, {}),
            source_snapshots=[one],  # type: ignore[arg-type]
            build_phase_ledger_bytes=_ledger(),
            lane_profile=_profile(),
            limits=limits,
        )


def test_path_capture_rechecks_regular_nlink1_file_and_records_identity(
    tmp_path: Path,
) -> None:
    root = tmp_path / "root"
    (root / "nested").mkdir(parents=True)
    source = root / "nested" / "source.txt"
    source.write_bytes(b"stable source")
    snapshot = capture_source_file(
        root, "nested/source.txt", logical_path="src/source.txt"
    )
    assert type(snapshot) is PathSourceSnapshot
    package = _package(sources=(snapshot,))
    entry = _json(package.source_manifest_bytes)["entries"][0]
    assert entry["capture_kind"] == "path"
    assert entry["file_identity"]["link_count"] == 1
    assert entry["sha256"] == sha256_bytes(b"stable source")


def test_path_snapshot_fails_if_source_drifts_before_package_build(
    tmp_path: Path,
) -> None:
    root = tmp_path / "root"
    root.mkdir()
    source = root / "source.txt"
    source.write_bytes(b"first")
    snapshot = capture_source_file(root, "source.txt")
    source.write_bytes(b"second")
    with pytest.raises(FrontierPackageError, match="drifted after capture"):
        _package(sources=(snapshot,))


def test_path_capture_rejects_symlink_component_and_file(tmp_path: Path) -> None:
    root = tmp_path / "root"
    actual = root / "actual"
    actual.mkdir(parents=True)
    (actual / "source.txt").write_bytes(b"source")
    (root / "linked-dir").symlink_to(actual, target_is_directory=True)
    (root / "linked-file").symlink_to(actual / "source.txt")
    with pytest.raises(FrontierPackageError, match="failed closed"):
        capture_source_file(root, "linked-dir/source.txt")
    with pytest.raises(FrontierPackageError, match="failed closed"):
        capture_source_file(root, "linked-file")


def test_path_capture_rejects_hard_link(tmp_path: Path) -> None:
    root = tmp_path / "root"
    root.mkdir()
    source = root / "source.txt"
    source.write_bytes(b"source")
    os.link(source, root / "second-link.txt")
    with pytest.raises(FrontierPackageError, match="exactly one link"):
        capture_source_file(root, "source.txt")


def test_path_capture_rejects_oversized_and_unsafe_paths(tmp_path: Path) -> None:
    root = tmp_path / "root"
    root.mkdir()
    (root / "source.txt").write_bytes(b"1234")
    limits = FrontierPackageLimits(source_file_bytes=3)
    with pytest.raises(FrontierPackageError, match="source_file_bytes"):
        capture_source_file(root, "source.txt", limits=limits)
    with pytest.raises(FrontierPackageError, match="safe relative"):
        capture_source_file(root, "../source.txt")
    with pytest.raises(FrontierPackageError, match="safe relative"):
        capture_source_file(root, "nested//source.txt")
    with pytest.raises(FrontierPackageError, match="safe relative"):
        capture_source_file(root, "nested\\source.txt")
    with pytest.raises(FrontierPackageError, match="must be absolute"):
        capture_source_file(Path("relative"), "source.txt")


def test_profile_query_must_match_ledger_target() -> None:
    with pytest.raises(FrontierPackageError, match="differs from ledger target"):
        _package(profile=_profile(query_id="B.other"), ledger=_ledger())


def test_limits_reject_bool_and_endpoint_subclass() -> None:
    class CustomLimits(EndpointLimits):
        pass

    with pytest.raises(FrontierPackageError, match="positive builtin int"):
        FrontierPackageLimits(source_files=True)  # type: ignore[arg-type]
    with pytest.raises(FrontierPackageError, match="exactly EndpointLimits"):
        FrontierPackageLimits(endpoint_limits=CustomLimits())
