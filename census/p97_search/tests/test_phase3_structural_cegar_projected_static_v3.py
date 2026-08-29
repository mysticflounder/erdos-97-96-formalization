from __future__ import annotations

import copy
import hashlib
import importlib
import json
from dataclasses import dataclass, replace
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

v2 = importlib.import_module("census.p97_search.phase3_structural_cegar")
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)
prefix_bank = importlib.import_module(
    "census.p97_search.phase3_three_rhombus_prefix_bank"
)
prefix_cache = importlib.import_module("census.p97_search.phase3_prefix_bank_cache")

PROJECTED_STATIC_V3_SEMANTIC_ASSIGNMENT_FIXTURE = (
    v3.ROOT
    / "census/p97_search/tests/fixtures"
    / "projected_static_v3_first_validated_semantic_assignment.json"
)
PROJECTED_STATIC_V3_SEMANTIC_ASSIGNMENT_FIXTURE_SHA256 = (
    "77675e43a4868866d51551d592c4d5d01f3493a1d03f41a322d855bb3cb18b02"
)

POSITIVES = frozenset(
    {
        (0, 2),
        (0, 5),
        (0, 7),
        (0, 8),
        (4, 2),
        (4, 6),
        (4, 7),
        (6, 4),
        (6, 5),
        (6, 8),
        (7, 0),
        (7, 4),
        (7, 5),
    }
)
EXPECTED_CLAUSE = (
    -69,
    -68,
    -64,
    -62,
    -60,
    -59,
    -43,
    -42,
    -39,
    -8,
    -7,
    -5,
    -2,
)


@dataclass(frozen=True)
class Row:
    center: int
    support: tuple[int, ...]
    exact: bool = False

    def as_dict(self) -> dict[str, Any]:
        return {
            "center": self.center,
            "support": list(self.support),
            "exact": self.exact,
        }


ROWS = (
    Row(0, (2, 5, 7, 8)),
    Row(4, (2, 6, 7)),
    Row(6, (4, 5, 8)),
    Row(7, (0, 4, 5)),
)


class DummyEncoding:
    projected_static = True

    def var(self, kind: str, center: int, point: int) -> int:
        assert kind == "s"
        return v3.three_rhombus.dense_membership_var(center, point)

    def semantic_record(self, assignment: dict[int, bool]) -> dict[str, Any]:
        return {
            "schema": v3.PROJECTED_STATIC_SEMANTIC_SCHEMA,
            "truth": [
                [variable, value] for variable, value in sorted(assignment.items())
            ],
        }

    def assignment_from_record(self, record: dict[str, Any]) -> dict[int, bool]:
        semantic = record["semantic_assignment"]
        return {int(variable): bool(value) for variable, value in semantic["truth"]}

    def decode(self, _assignment: dict[int, bool]) -> object:
        return object()

    def validate(self, _obj: object, _assignment: dict[int, bool]) -> None:
        return None

    def blocking_clause(self, assignment: dict[int, bool]) -> tuple[int, ...]:
        return tuple(
            -variable if value else variable
            for variable, value in sorted(assignment.items())
        )


def _assignment() -> dict[int, bool]:
    return {
        v3.three_rhombus.dense_membership_var(center, point): (
            center,
            point,
        )
        in POSITIVES
        for center in range(v3.CELL.n)
        for point in range(v3.CELL.n)
        if center != point
    }


def _sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _projected_semantic(
    positives: frozenset[tuple[int, int]],
) -> dict[str, bool]:
    semantic = {
        f"s[{center},{point}]": (center, point) in positives
        for center in range(v3.CELL.n)
        for point in range(v3.CELL.n)
        if center != point
    }
    semantic.update(
        {
            f"f[{point},{cap}]": False
            for point in range(3, v3.CELL.n)
            for cap in range(3)
        }
    )
    return semantic


def _v2_source_record(
    positives: frozenset[tuple[int, int]],
) -> dict[str, Any]:
    semantic = _projected_semantic(positives)
    clause = [-1]
    return prefix_bank._record(
        {
            "schema": prefix_bank.LEARNED_SCHEMA,
            "index": 0,
            "origin": "solver",
            "raw_sat_index": 0,
            "assignment_sha256": prefix_bank.sha256_value(semantic),
            "stage": "synthetic-three-rhombus-hit",
            "semantic_assignment": semantic,
            "certificate": {},
            "clause": clause,
            "clause_sha256": prefix_bank.sha256_value(clause),
            "superseded_nogood_sha256": [],
        },
        None,
    )


def _build_authenticated_prefix_fixture(
    tmp_path: Path,
) -> tuple[Path, str, str, dict[str, Any]]:
    source_record = _v2_source_record(POSITIVES)
    source_raw = prefix_bank.canonical_bytes(source_record) + b"\n"
    source = tmp_path / "source-v2.jsonl"
    source.write_bytes(source_raw)
    output = tmp_path / "prefix-bank"
    manifest = prefix_bank.build_bank(
        source,
        output,
        prefix_bytes=len(source_raw),
        prefix_records=1,
        prefix_sha256=prefix_bank.sha256_bytes(source_raw),
        minimize=True,
    )
    return (
        output,
        prefix_bank.sha256_file(output / "SHA256SUMS"),
        prefix_bank.sha256_bytes(source_raw),
        manifest,
    )


def _first_projected_survivor_assignment() -> dict[int, bool]:
    fixture = PROJECTED_STATIC_V3_SEMANTIC_ASSIGNMENT_FIXTURE
    raw = fixture.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == (
        PROJECTED_STATIC_V3_SEMANTIC_ASSIGNMENT_FIXTURE_SHA256
    ), "projected-static-v3 semantic assignment fixture hash mismatch"
    semantic = json.loads(raw)
    assert isinstance(semantic, dict), (
        "projected-static-v3 semantic assignment fixture must be an object"
    )
    assert raw == prefix_bank.canonical_bytes(semantic) + b"\n", (
        "projected-static-v3 semantic assignment fixture is not canonical JSON"
    )
    encoding = v3._phase3_encoding(projected_static_v3=True)
    assignment = encoding.assignment_from_record({"semantic_assignment": semantic})
    obj = encoding.decode(assignment)
    encoding.validate(obj, assignment)
    assert v3._combined_detection(encoding, v3._metric_rows(obj)) is None, (
        "projected-static-v3 semantic assignment fixture is not a survivor"
    )
    return assignment


def _sat_runner(assignment: dict[int, bool]):
    def run(_cnf: Path, _timeout: int, _proof: Path | None) -> Any:
        return v3.sat.SolverResult("SAT", assignment, 10, "s SATISFIABLE\n", "")

    return run


def test_literal_namespace_checks_all_ninety_row_major_variables() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    namespace = v3._validate_three_rhombus_literal_namespace(encoding)

    descriptor = namespace["descriptor"]
    assert descriptor["variable_count"] == 90
    assert descriptor["mapping_sha256"] == (
        "e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802"
    )
    for center in range(10):
        for point in range(10):
            if center != point:
                assert encoding.var("s", center, point) == (
                    v3.three_rhombus.dense_membership_var(center, point)
                )

    class DriftedEncoding:
        def var(self, kind: str, center: int, point: int) -> int:
            variable = encoding.var(kind, center, point)
            return variable + (center == 9 and point == 8)

    with pytest.raises(
        v3.StructuralCegarError,
        match="row-major DIMACS namespace mismatch",
    ):
        v3._validate_three_rhombus_literal_namespace(DriftedEncoding())


def test_combined_detector_preserves_metric_priority(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    old = {"stage": "duplicate-center", "core": {}}
    monkeypatch.setattr(v3, "_detection", lambda _rows: old)

    def forbidden(_encoding: Any, _rows: Any) -> None:
        raise AssertionError("three-rhombus detector must be short-circuited")

    monkeypatch.setattr(v3, "_three_rhombus_detection", forbidden)
    assert v3._combined_detection(DummyEncoding(), ROWS) == (
        "metric-core",
        old,
    )


def test_three_rhombus_clause_uses_live_s_dimacs_and_replays() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    certificate = v3._three_rhombus_detection(encoding, ROWS)

    assert certificate is not None
    assert tuple(certificate["clause"]) == EXPECTED_CLAUSE
    assignment = _assignment()
    assert all(assignment[abs(literal)] for literal in EXPECTED_CLAUSE)
    v3._clause_false(EXPECTED_CLAUSE, assignment)
    assert (
        v3.three_rhombus.replay_closure(
            certificate,
            ROWS,
            var_lookup=lambda center, point: encoding.var("s", center, point),
        )
        == EXPECTED_CLAUSE
    )


def test_commit_precedes_cap_detectors_and_journal_replays(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    encoding = DummyEncoding()
    assignment = _assignment()
    learned_path = tmp_path / "learned.jsonl"
    survivors_path = tmp_path / "survivors.jsonl"
    learned: list[dict[str, Any]] = []
    learned_clauses: list[tuple[int, ...]] = []
    survivors: list[dict[str, Any]] = []
    survivor_clauses: list[tuple[int, ...]] = []

    monkeypatch.setattr(v3, "_metric_rows", lambda _obj: ROWS)
    monkeypatch.setattr(v3, "_detection", lambda _rows: None)

    def forbidden(*_args: Any, **_kwargs: Any) -> None:
        raise AssertionError("a later detector ran before three-rhombus commit")

    monkeypatch.setattr(v3, "_cap_order_certificate", forbidden)
    disposition = v3._commit_sat_classification(
        encoding,
        assignment,
        raw_sat_index=0,
        algebraic_templates=(),
        learned=learned,
        learned_clauses=learned_clauses,
        learned_path=learned_path,
        survivors=survivors,
        survivor_clauses=survivor_clauses,
        survivors_path=survivors_path,
        bank=object(),
        failure_detail={},
    )

    assert disposition["classification"] == ("learned-seven-point-three-rhombus")
    assert tuple(learned[0]["clause"]) == EXPECTED_CLAUSE
    assert learned[0]["terminal_claim"] is False
    assert "not a terminal" in learned[0]["ingress_trust_boundary"]
    replayed, bank, clauses = v3._load_learned(learned_path, encoding)
    assert replayed == learned
    assert bank.active == {}
    assert clauses == [EXPECTED_CLAUSE]

    manifest = v3._manifest(
        tmp_path,
        configuration={"artifact_schema": v3.PROJECTED_STATIC_SCHEMA},
        status="DYNAMIC_LEARNED_CORE_LIMIT",
        diagnostic="test checkpoint",
        learned=learned,
        survivors=(),
        logs=({"verdict": "SAT"},),
        cube_batches=(),
        bank=bank,
        bootstrap_summary={},
        terminal_clause_count=None,
        unsat_verified=False,
    )
    assert manifest["counts"]["dynamic_three_rhombus_nogood_count"] == 1
    assert manifest["dynamic_stage_histogram"] == {v3.THREE_RHOMBUS_STAGE: 1}


def test_strict_json_lines_streams_and_tracks_exact_bytes(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    path = tmp_path / "records.jsonl"
    raw = b'{"index":0}\n{"index":1}\n'
    path.write_bytes(raw)
    scan = v3.cegar_runtime.JournalScan()
    monkeypatch.setattr(
        Path,
        "read_bytes",
        lambda _path: pytest.fail("streaming loader must not call read_bytes"),
    )

    assert v3._strict_json_lines(path, scan=scan) == [
        {"index": 0},
        {"index": 1},
    ]
    assert scan.byte_count == len(raw)
    assert scan.sha256 == hashlib.sha256(raw).hexdigest()


@pytest.mark.parametrize(
    ("raw", "diagnostic"),
    [
        (b'{"ok":1}\n\n', r":2: blank JSONL line"),
        (b'{"key":1,"key":2}\n', r"duplicate JSON key 'key'"),
        (b'{"ok":1}\n[2]\n', r":2: expected object"),
        (b'{"ok":1}', r":1: truncated JSONL line"),
    ],
)
def test_strict_json_lines_preserves_fail_closed_diagnostics(
    tmp_path: Path,
    raw: bytes,
    diagnostic: str,
) -> None:
    path = tmp_path / "malformed.jsonl"
    path.write_bytes(raw)

    with pytest.raises(v3.StructuralCegarError, match=diagnostic):
        v3._strict_json_lines(path)


def test_shadow_ledger_updates_only_after_durable_learned_append(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    encoding = DummyEncoding()
    ledger = v3.cegar_runtime.LearnedRunLedger.from_authenticated_records(
        [], v3.cegar_runtime.JournalScan()
    )
    before = ledger.snapshot()
    learned: list[dict[str, Any]] = []
    learned_clauses: list[tuple[int, ...]] = []
    monkeypatch.setattr(v3, "_metric_rows", lambda _obj: ROWS)
    monkeypatch.setattr(v3, "_detection", lambda _rows: None)
    monkeypatch.setattr(
        v3,
        "_append_record",
        lambda *_args, **_kwargs: (_ for _ in ()).throw(
            OSError("injected durable append failure")
        ),
    )

    with pytest.raises(OSError, match="injected durable append failure"):
        v3._commit_sat_classification(
            encoding,
            _assignment(),
            raw_sat_index=0,
            algebraic_templates=(),
            learned=learned,
            learned_clauses=learned_clauses,
            learned_path=tmp_path / "learned.jsonl",
            survivors=[],
            survivor_clauses=[],
            survivors_path=tmp_path / "survivors.jsonl",
            bank=object(),
            failure_detail={},
            learned_ledger=ledger,
        )

    assert ledger.snapshot() == before
    assert learned == []
    assert learned_clauses == []


def test_post_write_fsync_failure_is_detected_by_shadow_recount(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    encoding = DummyEncoding()
    ledger = v3.cegar_runtime.LearnedRunLedger.from_authenticated_records(
        [], v3.cegar_runtime.JournalScan()
    )
    learned: list[dict[str, Any]] = []
    path = tmp_path / "learned.jsonl"
    monkeypatch.setattr(v3, "_metric_rows", lambda _obj: ROWS)
    monkeypatch.setattr(v3, "_detection", lambda _rows: None)
    monkeypatch.setattr(
        v3.os,
        "fsync",
        lambda _fd: (_ for _ in ()).throw(OSError("injected fsync failure")),
    )

    with pytest.raises(OSError, match="injected fsync failure"):
        v3._commit_sat_classification(
            encoding,
            _assignment(),
            raw_sat_index=0,
            algebraic_templates=(),
            learned=learned,
            learned_clauses=[],
            learned_path=path,
            survivors=[],
            survivor_clauses=[],
            survivors_path=tmp_path / "survivors.jsonl",
            bank=object(),
            failure_detail={},
            learned_ledger=ledger,
        )

    assert path.stat().st_size > 0
    assert ledger.snapshot().record_count == 0
    assert learned == []
    with pytest.raises(
        v3.StructuralCegarError,
        match="RunLedger/recount mismatch: byte_count, file_sha256",
    ):
        v3._assert_learned_run_ledger(
            ledger,
            path,
            learned,
            {
                "counts": {"learned_core_count": 0},
                "stage_histogram": {},
                "artifact_hashes": {
                    "learned-certificates.jsonl": v3._sha256_file(path)
                },
            },
        )


def test_streaming_learned_loader_preserves_authentication_diagnostics(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    encoding = DummyEncoding()
    source = tmp_path / "source.jsonl"
    learned: list[dict[str, Any]] = []
    monkeypatch.setattr(v3, "_metric_rows", lambda _obj: ROWS)
    monkeypatch.setattr(v3, "_detection", lambda _rows: None)
    v3._commit_sat_classification(
        encoding,
        _assignment(),
        raw_sat_index=0,
        algebraic_templates=(),
        learned=learned,
        learned_clauses=[],
        learned_path=source,
        survivors=[],
        survivor_clauses=[],
        survivors_path=tmp_path / "survivors.jsonl",
        bank=object(),
        failure_detail={},
    )
    baseline = learned[0]

    def rehash(record: dict[str, Any]) -> None:
        payload = dict(record)
        payload.pop("record_sha256", None)
        record["record_sha256"] = v3._sha256_value(payload)

    variants: list[tuple[str, dict[str, Any], str]] = []
    broken_chain = copy.deepcopy(baseline)
    broken_chain["previous_record_sha256"] = "bad"
    rehash(broken_chain)
    variants.append(("chain", broken_chain, "broken record hash chain"))
    bad_hash = copy.deepcopy(baseline)
    bad_hash["record_sha256"] = "0" * 64
    variants.append(("hash", bad_hash, "invalid record hash"))
    bad_index = copy.deepcopy(baseline)
    bad_index["index"] = 1
    rehash(bad_index)
    variants.append(("identity", bad_index, "learned record identity mismatch"))
    bad_certificate = copy.deepcopy(baseline)
    bad_certificate["certificate"]["payload_sha256"] = "0" * 64
    rehash(bad_certificate)
    variants.append(
        ("certificate", bad_certificate, "three-rhombus certificate replay drift")
    )

    for name, record, diagnostic in variants:
        path = tmp_path / f"{name}.jsonl"
        path.write_bytes(v3._canonical_bytes(record) + b"\n")
        with pytest.raises(v3.StructuralCegarError, match=diagnostic):
            v3._load_learned(path, encoding)


def test_shadow_ledger_preserves_learned_journal_bytes(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    monkeypatch.setattr(v3, "_metric_rows", lambda _obj: ROWS)
    monkeypatch.setattr(v3, "_detection", lambda _rows: None)

    def commit(path: Path, *, shadow: bool) -> bytes:
        learned: list[dict[str, Any]] = []
        ledger = (
            v3.cegar_runtime.LearnedRunLedger.from_authenticated_records(
                [], v3.cegar_runtime.JournalScan()
            )
            if shadow
            else None
        )
        v3._commit_sat_classification(
            DummyEncoding(),
            _assignment(),
            raw_sat_index=0,
            algebraic_templates=(),
            learned=learned,
            learned_clauses=[],
            learned_path=path,
            survivors=[],
            survivor_clauses=[],
            survivors_path=tmp_path / f"{path.stem}-survivors.jsonl",
            bank=object(),
            failure_detail={},
            learned_ledger=ledger,
        )
        if ledger is not None:
            assert ledger.snapshot() == v3._recount_learned_stream(path, learned)
        return path.read_bytes()

    assert commit(tmp_path / "plain.jsonl", shadow=False) == commit(
        tmp_path / "shadow.jsonl", shadow=True
    )


def test_shadow_ledger_disagreement_blocks_manifest_publication(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    original_snapshot = v3.cegar_runtime.LearnedRunLedger.snapshot

    def drifted_snapshot(
        ledger: v3.cegar_runtime.LearnedRunLedger,
    ) -> v3.cegar_runtime.LearnedStreamSnapshot:
        return replace(
            original_snapshot(ledger),
            byte_count=ledger.byte_count + 1,
        )

    monkeypatch.setattr(
        v3.cegar_runtime.LearnedRunLedger,
        "snapshot",
        drifted_snapshot,
    )
    out = tmp_path / "driver"
    with pytest.raises(
        v3.StructuralCegarError,
        match="RunLedger/recount mismatch: byte_count",
    ):
        v3.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            solver_runner=lambda *_args: pytest.fail("solver must not run"),
        )
    assert not (out / "manifest.json").exists()


def test_survivor_recheck_uses_combined_detector(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    encoding = DummyEncoding()
    assignment = _assignment()
    semantic = encoding.semantic_record(assignment)
    rows_json = [row.as_dict() for row in ROWS]
    unsigned = {
        "schema": v3.PROJECTED_SURVIVOR_SCHEMA,
        "index": 0,
        "raw_sat_index": 0,
        "classification": "STRUCTURALLY_UNRESOLVED",
        "semantic_assignment": semantic,
        "assignment_sha256": v3._sha256_value(semantic),
        "metric_rows": rows_json,
        "metric_rows_sha256": v3._sha256_value(rows_json),
        "blocking_clause": list(encoding.blocking_clause(assignment)),
        "trust": "test fixture",
    }
    record = v3._with_record_hash(unsigned, None)
    path = tmp_path / "survivors.jsonl"
    path.write_bytes(v3._canonical_bytes(record) + b"\n")
    monkeypatch.setattr(v3, "_metric_rows", lambda _obj: ROWS)
    monkeypatch.setattr(v3, "_detection", lambda _rows: None)

    with pytest.raises(
        v3.StructuralCegarError,
        match="survivor is now structurally detected",
    ):
        v3._load_survivors(path, encoding)


def test_v3_configuration_and_bootstrap_reject_v2_schemas(
    tmp_path: Path,
) -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    configuration = {
        "mode": encoding.mode,
        "artifact_schema": v3.PROJECTED_STATIC_SCHEMA,
        "learned_record_schema": v3.PROJECTED_LEARNED_SCHEMA,
        "survivor_record_schema": v3.PROJECTED_SURVIVOR_SCHEMA,
        "configuration_schema": v3.PROJECTED_STATIC_CONFIG_SCHEMA,
        "sat_contract_schema": v3.PROJECTED_STATIC_SAT_SCHEMA,
        "journal_contract_schema": v3.PROJECTED_STATIC_JOURNAL_SCHEMA,
        "semantic_contract_schema": v3.PROJECTED_STATIC_SEMANTIC_SCHEMA,
        "three_rhombus_literal_namespace": (
            v3._validate_three_rhombus_literal_namespace(encoding)
        ),
        "pinned_multiplicity": v3._pinned_multiplicity_descriptor(encoding),
        "sat_encoding": encoding.configuration(),
    }
    assert (
        v3._projected_static_v3_from_configuration(configuration, where="v3 fixture")
        is True
    )

    v2_tokens = {
        "artifact_schema": v2.PROJECTED_STATIC_SCHEMA,
        "learned_record_schema": v2.PROJECTED_LEARNED_SCHEMA,
        "survivor_record_schema": v2.PROJECTED_SURVIVOR_SCHEMA,
        "configuration_schema": "p97-phase3-configuration-v2",
        "sat_contract_schema": "p97-phase3-sat-v2",
        "journal_contract_schema": "p97-phase3-journal-v2",
        "semantic_contract_schema": "p97-phase3-semantic-v2",
    }
    for key, token in v2_tokens.items():
        mixed = dict(configuration)
        mixed[key] = token
        with pytest.raises(
            v3.StructuralCegarError,
            match="unsupported or mixed",
        ):
            v3._projected_static_v3_from_configuration(
                mixed, where=f"mixed {key} fixture"
            )

    mapping_drift = json.loads(json.dumps(configuration))
    mapping_drift["three_rhombus_literal_namespace"]["descriptor"]["mapping_sha256"] = (
        "0" * 64
    )
    with pytest.raises(
        v3.StructuralCegarError,
        match="unsupported or mixed",
    ):
        v3._projected_static_v3_from_configuration(
            mapping_drift, where="mapping-drift fixture"
        )

    source = tmp_path / "v2-learned.jsonl"
    source.write_text(json.dumps({"schema": v2.PROJECTED_LEARNED_SCHEMA}) + "\n")
    with pytest.raises(
        v3.StructuralCegarError,
        match="learned schema/mode mismatch",
    ):
        v3._validate_bootstrap_mode(encoding, source)


def test_dependency_hashes_pin_three_rhombus_and_lean_sources() -> None:
    hashes = v3._dependency_hashes()
    expected = {
        "census/p97_search/phase3_structural_cegar.py": (
            "8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d"
        ),
        "census/p97_search/phase3_three_rhombus.py": (
            "ded17d9137c1013e9e93400cea7231cb95e23bbf1320623eb65423009b0f3422"
        ),
        "lean/Erdos9796Proof/P97/SevenPointThreeRhombus.lean": (
            "d924194678554e61bf3e205ebcac93c7a11adccc3d1516be7688fc5754b1f321"
        ),
        "lean/Erdos9796Proof/P97/Phase3ThreeRhombusRowAdapter.lean": (
            "f5ac99ddab12653e11797a9cbcf59a9fee5a06d1e74179787f54e3dccffece31"
        ),
        "lean/Erdos9796Proof/P97/Phase3MetricCertificateBank.lean": (
            "6c10da654b755e66a98071a77a7568819e86e4a0914fb823b86cbfe5a584cb2d"
        ),
    }
    for name, digest in expected.items():
        assert hashes[name] == digest

    prefix = v3.ROOT / "census/p97_search/phase3_three_rhombus_prefix_bank.py"
    assert hashes[str(prefix.relative_to(v3.ROOT))] == _sha256_file(prefix)
    runtime = v3.ROOT / "census/p97_search/phase3_cegar_runtime.py"
    assert hashes[str(runtime.relative_to(v3.ROOT))] == _sha256_file(runtime)
    universe = v3.ROOT / "census/p97_search/phase3_order_universe.py"
    assert hashes[str(universe.relative_to(v3.ROOT))] == _sha256_file(universe)


def test_frozen_v2_driver_and_sat_generator_are_byte_identical() -> None:
    assert _sha256_file(Path(v2.__file__).resolve()) == (
        "8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d"
    )
    assert _sha256_file(Path(v3.sat.__file__).resolve()) == (
        "5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817"
    )


def test_runtime_terminal_publisher_is_wired_fail_closed(tmp_path: Path) -> None:
    discovery_calls: list[tuple[Path, Path | None]] = []
    local_calls: list[tuple[Path, Path | None]] = []

    def piqd_discovery(cnf: Path, _timeout: int, proof: Path | None):
        discovery_calls.append((cnf, proof))
        assert proof is None
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    def local_proof(cnf: Path, _timeout: int, proof: Path | None):
        local_calls.append((cnf, proof))
        assert proof is not None
        assert cnf.name == "terminal.cnf"
        proof.write_bytes(b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    result = v3.run_driver(
        tmp_path / "terminal",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=v3._split_static_piqd_solver_runner(
            piqd_discovery,
            local_proof_runner=local_proof,
        ),
        checker_runner=lambda *_args: v3.sat.CheckerResult(True, 0, "s VERIFIED\n", ""),
    )

    out = tmp_path / "terminal"
    assert result["status"] == "STRUCTURAL_UNSAT_VERIFIED"
    assert result["terminal_drat_verified"] is True
    assert (out / "terminal.drat").read_bytes() == b"0\n"
    assert (out / "terminal.drat.check").read_bytes() == b"s VERIFIED\n"
    assert not (out / ".solver.drat").exists()
    assert discovery_calls == [(out / ".solver.cnf", None)]
    assert len(local_calls) == 1
    assert local_calls[0][1] == out / ".solver.drat"
    assert local_calls[0][0].read_bytes() == (out / "terminal.cnf").read_bytes()
    terminal_contract = result["terminal_clause_contract"]
    assert terminal_contract["promotion_status"] == "FINITE_BOOLEAN_FORMULA_ONLY"
    assert terminal_contract["supports_source_promotion"] is False
    buckets = terminal_contract["source_inventory"]["buckets"]
    assert [bucket["clause_class"] for bucket in buckets] == [
        "ROOT_STATIC",
        "ASSUMPTION_CONTROL",
        "LEARNED_CANDIDATE",
        "ENUMERATION_CONTROL",
    ]
    assert [bucket["clause_count"] for bucket in buckets] == [58314, 0, 0, 0]
    logs = v3._strict_json_lines(out / "solver-logs.jsonl")
    assert logs[-1]["clause_contract"] == terminal_contract
    v3.clause_contract.validate_against_cnf(
        terminal_contract, (out / "terminal.cnf").read_bytes()
    )


def test_terminal_publication_closes_before_qualification_finalization(
    tmp_path: Path,
) -> None:
    events: list[tuple[str, str | None]] = []

    class QualifiedBackend:
        closed = False

        def __call__(self, _cnf: Path, _timeout: int, proof: Path | None) -> Any:
            if proof is not None:
                proof.write_bytes(b"0\n")
            return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

        def close(self) -> None:
            self.closed = True
            events.append(("close", None))

        def finalize_qualification(self, status: str) -> None:
            assert self.closed is True
            events.append(("finalize", status))

        def manifest_metadata(self) -> dict[str, Any]:
            return {"proof_verified": False, "closure_claim": False}

    result = v3.run_driver(
        tmp_path / "qualified-finalization",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=QualifiedBackend(),
        checker_runner=lambda *_args: v3.sat.CheckerResult(True, 0, "s VERIFIED\n", ""),
    )

    assert result["status"] == "STRUCTURAL_UNSAT_VERIFIED"
    assert events == [
        ("close", None),
        ("finalize", "STRUCTURAL_UNSAT_VERIFIED"),
    ]


def test_solver_exception_remains_primary_when_terminal_close_fails(
    tmp_path: Path,
) -> None:
    primary = RuntimeError("primary solve schema failure")
    cleanup = RuntimeError("secondary close failure")
    out = tmp_path / "primary-solve-error"

    class FailingBackend:
        close_calls = 0
        finalize_calls = 0

        def __call__(self, *_args: Any) -> Any:
            raise primary

        def close(self) -> None:
            self.close_calls += 1
            raise cleanup

        def finalize_qualification(self, _status: str) -> None:
            self.finalize_calls += 1
            (out / "qualification-seal.json").write_bytes(b"unsafe\n")

        def manifest_metadata(self) -> dict[str, Any]:
            return {"proof_verified": False, "closure_claim": False}

    backend = FailingBackend()
    with pytest.raises(RuntimeError, match="primary solve schema failure") as raised:
        v3.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            solver_runner=backend,
        )

    assert raised.value is primary
    assert raised.value.__cause__ is cleanup
    assert raised.value.__notes__ == [
        "terminal cleanup also raised: secondary close failure"
    ]
    assert backend.close_calls == 1
    assert backend.finalize_calls == 0
    assert not (out / "qualification-seal.json").exists()
    failure = json.loads((out / "failure.json").read_bytes())
    assert failure["kind"] == "SOLVER_EXCEPTION"
    assert "primary solve schema failure" in failure["diagnostic"]


def test_static_piqd_split_routes_unknown_without_local_fallback(
    tmp_path: Path,
) -> None:
    calls: list[tuple[str, Path | None]] = []
    unknown = v3.sat.SolverResult("UNKNOWN", {}, 0, "", "remote unknown")

    def piqd_discovery(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        calls.append(("piqd", proof))
        return unknown

    def local_proof(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        calls.append(("local", proof))
        return v3.sat.SolverResult("UNSAT", {}, 20, "", "")

    runner = v3._split_static_piqd_solver_runner(
        piqd_discovery,
        local_proof_runner=local_proof,
    )
    cnf = tmp_path / "input.cnf"
    proof = tmp_path / "terminal.drat"

    assert runner(cnf, 5, None) is unknown
    assert calls == [("piqd", None)]
    assert runner(cnf, 5, proof).verdict == "UNSAT"
    assert calls == [("piqd", None), ("local", proof)]


def test_static_piqd_unknown_fails_closed_in_run_driver(
    tmp_path: Path,
) -> None:
    discovery_proofs: list[Path | None] = []

    def piqd_discovery(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        discovery_proofs.append(proof)
        return v3.sat.SolverResult("UNKNOWN", {}, 0, "", "remote unknown")

    result = v3.run_driver(
        tmp_path / "piqd-unknown",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=v3._split_static_piqd_solver_runner(
            piqd_discovery,
            local_proof_runner=lambda *_args: pytest.fail(
                "local solver must not be a PIQD discovery fallback"
            ),
        ),
    )

    assert result["status"] == "UNKNOWN"
    assert result["failure"]["kind"] == "SOLVER_UNKNOWN"
    assert discovery_proofs == [None]


def test_compiled_loader_cache_round_trips_terminal_resume(
    tmp_path: Path,
) -> None:
    solver, checker = _verified_unsat_transcript()
    out = tmp_path / "compiled-cache"
    first = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=(),
        projected_static_v3=True,
        compiled_loader_cache=True,
        solver_runner=solver,
        checker_runner=checker,
    )
    cache_path = out / v3.COMPILED_LOADER_CACHE_NAME
    assert first["status"] == "STRUCTURAL_UNSAT_VERIFIED"
    assert cache_path.is_file()

    def no_solver(*_args: Any) -> Any:
        pytest.fail("terminal resume should not invoke the solver")

    resumed = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=(),
        projected_static_v3=True,
        compiled_loader_cache=True,
        resume=True,
        solver_runner=no_solver,
        checker_runner=checker,
    )
    assert resumed == first


def _verified_unsat_transcript() -> tuple[Any, Any]:
    def unsat(cnf: Path, _timeout: int, proof: Path | None) -> Any:
        if proof is not None:
            assert cnf.name == "terminal.cnf"
            proof.write_bytes(b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    def checker(_cnf: Path, _proof: Path, _timeout: int) -> Any:
        return v3.sat.CheckerResult(True, 0, "s VERIFIED\n", "")

    return unsat, checker


@pytest.mark.parametrize(
    ("terminal_mode", "expected_failure"),
    [
        ("SAT", "PROOF_SOLVER_NOT_UNSAT"),
        ("UNKNOWN", "PROOF_SOLVER_NOT_UNSAT"),
        ("missing", "MISSING_DRAT"),
        ("empty", "MISSING_DRAT"),
    ],
)
def test_terminal_proof_rerun_failure_matrix(
    tmp_path: Path,
    terminal_mode: str,
    expected_failure: str,
) -> None:
    def solver(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        if proof is None:
            return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")
        if terminal_mode in {"SAT", "UNKNOWN"}:
            return v3.sat.SolverResult(
                terminal_mode, {}, 10 if terminal_mode == "SAT" else 0, "", ""
            )
        if terminal_mode == "empty":
            proof.write_bytes(b"")
        elif terminal_mode != "missing":
            proof.write_bytes(b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    result = v3.run_driver(
        tmp_path / terminal_mode,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=solver,
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
    )

    assert result["status"] == "UNKNOWN"
    assert result["failure"]["kind"] == expected_failure
    assert not (tmp_path / terminal_mode / "terminal.drat").exists()


def test_terminal_proof_rerun_rejects_changed_cnf(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    original_atomic_bytes = v3._atomic_bytes

    def drift_terminal_cnf(path: Path, data: bytes) -> None:
        original_atomic_bytes(path, b"drift" if path.name == "terminal.cnf" else data)

    monkeypatch.setattr(v3, "_atomic_bytes", drift_terminal_cnf)
    proof_calls = 0

    def solver(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        nonlocal proof_calls
        if proof is not None:
            proof_calls += 1
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    result = v3.run_driver(
        tmp_path / "cnf-drift",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=solver,
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
    )

    assert result["status"] == "UNKNOWN"
    assert result["failure"]["kind"] == "TERMINAL_CNF_DRIFT"
    assert proof_calls == 0


def test_sat_discovery_then_unsat_terminal_rerun_is_proof_free_until_terminal(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls: list[tuple[Path, Path | None]] = []
    assignment = _first_projected_survivor_assignment()
    for detector in (
        "_cap_order_certificate",
        "_rhombus_cap_order_certificate",
        "_kalmanson_cap_order_certificate",
        "_shared_pair_separation_certificate",
    ):
        monkeypatch.setattr(v3, detector, lambda *_args, **_kwargs: None)

    def solver(cnf: Path, _timeout: int, proof: Path | None) -> Any:
        calls.append((cnf, proof))
        if proof is None and len(calls) == 1:
            assert proof is None
            return v3.sat.SolverResult("SAT", assignment, 10, "s SATISFIABLE\n", "")
        if proof is None:
            return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")
        assert proof is not None
        proof.write_bytes(b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    result = v3.run_driver(
        tmp_path / "sat-then-unsat",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=solver,
        checker_runner=lambda *_args: v3.sat.CheckerResult(True, 0, "s VERIFIED\n", ""),
    )

    assert result["status"] == "ENUMERATION_COMPLETE_WITH_SURVIVORS"
    block_contract = result["survivor_block_contract"]
    assert block_contract["clause_class"] == "ENUMERATION_CONTROL"
    assert block_contract["block_scope"] == "SEMANTIC_PROJECTION"
    assert block_contract["blocked_variable_count"] == 111
    assert block_contract["auxiliary_variable_count"] == 1083
    assert block_contract["source_discharge"] is None
    assert block_contract["abstract_discharge"] is None
    terminal_contract = result["terminal_clause_contract"]
    terminal_buckets = terminal_contract["source_inventory"]["buckets"]
    assert [bucket["clause_count"] for bucket in terminal_buckets] == [
        58314,
        0,
        0,
        1,
    ]
    assert terminal_buckets[-1]["clause_class"] == "ENUMERATION_CONTROL"
    assert terminal_buckets[-1]["record_identity"]["record_count"] == 1
    assert terminal_contract["supports_source_promotion"] is False
    assert "semantic-projection blocks" in result["result_claim"]
    assert "supply no source or abstract discharge" in result["result_claim"]
    assert len(calls) == 3
    assert calls[0][1] is None
    assert calls[1][1] is None
    assert calls[2][0].name == "terminal.cnf"
    assert calls[2][1] == tmp_path / "sat-then-unsat" / ".solver.drat"


def test_manifest_generation_covers_all_streams_and_completed_resume_replays(
    tmp_path: Path,
) -> None:
    unsat, checker = _verified_unsat_transcript()
    out = tmp_path / "generation"
    first = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=unsat,
        checker_runner=checker,
    )

    generation = int(first["manifest_generation"])
    generation_path = out / f"manifest.g{generation:08d}.json"
    assert generation >= 2
    assert generation_path.read_bytes() == (out / "manifest.json").read_bytes()
    assert set(first["stream_ledgers"]) == {
        "cube-batches",
        "learned",
        "solver-logs",
        "survivors",
    }
    assert first["stream_ledgers"]["solver-logs"]["record_count"] == 1

    resumed = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=lambda *_args: pytest.fail(
            "completed resume must not invoke the solver"
        ),
        checker_runner=checker,
        resume=True,
    )
    assert resumed == first


def test_manifest_generation_tamper_fails_closed_on_resume(tmp_path: Path) -> None:
    unsat, checker = _verified_unsat_transcript()
    out = tmp_path / "tampered"
    manifest = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=unsat,
        checker_runner=checker,
    )
    generation = int(manifest["manifest_generation"])
    (out / f"manifest.g{generation:08d}.json").write_bytes(b"tampered\n")

    with pytest.raises(
        v3.StructuralCegarError,
        match="generation artifact is missing or mismatched",
    ):
        v3.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            solver_runner=lambda *_args: pytest.fail("solver must not run"),
            checker_runner=checker,
            resume=True,
        )


def test_checkpoint_resume_is_idempotent_and_does_not_extend_bound(
    tmp_path: Path,
) -> None:
    out = tmp_path / "checkpoint-resume"
    first = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        max_new_raw=1,
        solver_runner=_sat_runner(_first_projected_survivor_assignment()),
    )

    assert first["status"] == "CHECKPOINT"
    assert first["counts"]["raw_sat_count"] == 1
    generation_count = len(tuple(out.glob("manifest.g*.json")))

    resumed = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        max_new_raw=1,
        solver_runner=lambda *_args: pytest.fail(
            "checkpoint resume must not invoke the solver"
        ),
        resume=True,
    )

    assert resumed == first
    assert len(tuple(out.glob("manifest.g*.json"))) == generation_count


def test_manifest_fast_path_matches_checkpoint_replay_and_skips_hot_recount(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    original_manifest = v3._manifest
    manifest_calls = 0

    def counted_manifest(*args: Any, **kwargs: Any) -> dict[str, Any]:
        nonlocal manifest_calls
        manifest_calls += 1
        return original_manifest(*args, **kwargs)

    monkeypatch.setattr(v3, "_manifest", counted_manifest)
    out = tmp_path / "fast-manifest"
    result = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        max_new_raw=1,
        manifest_fast_path=True,
        manifest_audit_every=1000,
        solver_runner=_sat_runner(_first_projected_survivor_assignment()),
    )

    assert result["status"] == "CHECKPOINT"
    assert (
        result["configuration"]["manifest_publication"][
            "audit_every_running_publications"
        ]
        == 1000
    )
    assert result["counts"]["raw_sat_count"] == 1
    # The initial and checkpoint publications are audited by _manifest.  The
    # intervening RUNNING publication must come from prospective state.
    assert manifest_calls == 2
    fast_generation = json.loads((out / "manifest.g00000002.json").read_text())
    for key in (
        "configuration",
        "counts",
        "stage_histogram",
        "dynamic_stage_histogram",
        "observed_detector_stage_histogram",
        "active_stage_histogram",
        "bootstrap",
        "failure",
        "terminal_clause_count",
        "terminal_drat_verified",
        "artifact_hashes",
        "stream_ledgers",
    ):
        assert fast_generation[key] == result[key]
    assert fast_generation["status"] == "RUNNING"
    assert result["status"] == "CHECKPOINT"
    assert fast_generation["manifest_sha256"] != result["manifest_sha256"]


def test_manifest_prospective_state_restores_classified_prefix_on_resume() -> None:
    learned = [
        {
            "origin": "solver",
            "stage": "row-membership",
            "raw_sat_index": 0,
        }
    ]
    survivors = [{"raw_sat_index": 1}]
    state = v3.ManifestProspectiveState(
        learned=learned,
        survivors=survivors,
        logs=[{"verdict": "SAT"}, {"verdict": "SAT"}],
        cube_batches=[],
        bank=SimpleNamespace(active={}),
        artifact_hashes={},
    )

    assert state.classified_raw_indices == {0, 1}
    assert state.unclassified_raw_sat_count == 0

    state.observe_learned(
        {
            "origin": "solver",
            "stage": "row-membership",
            "raw_sat_index": 2,
        }
    )
    assert state.classified_raw_indices == {0, 1, 2}


def test_manifest_fast_path_state_drift_fails_closed_as_unknown(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    def drop_log_observation(
        _state: v3.ManifestProspectiveState,
        _record: dict[str, Any],
    ) -> None:
        return None

    monkeypatch.setattr(
        v3.ManifestProspectiveState,
        "observe_log",
        drop_log_observation,
    )
    out = tmp_path / "fast-manifest-drift"
    result = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        max_new_raw=1,
        manifest_fast_path=True,
        manifest_audit_every=1000,
        solver_runner=_sat_runner(_first_projected_survivor_assignment()),
    )

    assert result["status"] == "UNKNOWN"
    assert result["failure"]["kind"] == "SAT_CERTIFICATE_FAILURE"
    assert "prospective manifest state disagrees" in result["diagnostic"]
    assert result["stream_ledgers"]["solver-logs"]["record_count"] == 1


def test_legacy_manifest_without_generation_is_not_repaired_in_place(
    tmp_path: Path,
) -> None:
    unsat, checker = _verified_unsat_transcript()
    out = tmp_path / "legacy"
    manifest = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=unsat,
        checker_runner=checker,
    )
    legacy = dict(manifest)
    legacy.pop("manifest_generation_schema")
    legacy.pop("manifest_generation")
    legacy.pop("previous_manifest_sha256")
    unsigned = dict(legacy)
    unsigned.pop("manifest_sha256")
    legacy["manifest_sha256"] = v3._sha256_value(unsigned)
    v3._atomic_json(out / "manifest.json", legacy)

    with pytest.raises(
        v3.StructuralCegarError,
        match="legacy artifact without authenticated generation",
    ):
        v3.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            solver_runner=lambda *_args: pytest.fail("solver must not run"),
            checker_runner=checker,
            resume=True,
        )


def test_authenticated_prefix_bank_translates_exact_entries_and_reloads(
    tmp_path: Path,
) -> None:
    output, root_sha256, source_sha256, manifest = _build_authenticated_prefix_fixture(
        tmp_path
    )
    authenticated = v3._load_authenticated_three_rhombus_prefix_bank(
        output,
        expected_root_sha256=root_sha256,
        expected_source_prefix_sha256=source_sha256,
    )
    descriptor = authenticated["configuration"]
    entries = authenticated["entries"]

    assert descriptor["bank_root_sha256"] == root_sha256
    assert descriptor["source_prefix_sha256"] == source_sha256
    assert descriptor["entry_count"] == len(entries) == 1
    assert descriptor["entry_count"] == manifest["counts"]["kept_antichain_clauses"]
    assert descriptor["replay"]["full_source_scan"] is True
    assert descriptor["replay"]["coverage_complete_verified"] is True

    encoding = v3._phase3_encoding(projected_static_v3=True)
    learned: list[dict[str, Any]] = []
    assert (
        v3._append_three_rhombus_prefix_records(learned, encoding, authenticated) == 1
    )
    record = learned[0]
    entry = entries[0]
    assert record["schema"] == v3.PROJECTED_LEARNED_SCHEMA
    assert record["origin"] == v3.BOOTSTRAP_THREE_RHOMBUS_PREFIX_ORIGIN
    assert record["prefix_bank_entry"] == entry
    assert record["clause"] == entry["clause"]
    assert record["prefix_bank_root_sha256"] == root_sha256
    assert record["prefix_source_prefix_sha256"] == source_sha256

    journal = tmp_path / "translated-v3.jsonl"
    journal.write_bytes(v3._canonical_bytes(record) + b"\n")
    replayed, learned_bank, clauses = v3._load_learned(
        journal,
        encoding,
        three_rhombus_prefix_bank_data=authenticated,
    )
    assert replayed == learned
    assert learned_bank.active == {}
    assert clauses == [tuple(entry["clause"])]


def test_authenticated_prefix_bank_cache_round_trip_and_binding(
    tmp_path: Path,
) -> None:
    output, root_sha256, source_sha256, _manifest = _build_authenticated_prefix_fixture(
        tmp_path
    )
    authenticated = v3._load_authenticated_three_rhombus_prefix_bank(
        output,
        expected_root_sha256=root_sha256,
        expected_source_prefix_sha256=source_sha256,
    )
    cache_path = tmp_path / "prefix-cache.json"
    producer_sha256 = v3._prefix_bank_cache_source_sha256()
    prefix_cache.write_cache(
        cache_path,
        bank_path=output,
        expected_root_sha256=root_sha256,
        expected_source_prefix_sha256=source_sha256,
        producer_source_sha256=producer_sha256,
        descriptor=authenticated["configuration"],
        entries=authenticated["entries"],
    )
    hit = prefix_cache.try_load(
        cache_path,
        bank_path=output,
        expected_root_sha256=root_sha256,
        expected_source_prefix_sha256=source_sha256,
        producer_source_sha256=producer_sha256,
    )
    assert hit.hit is True
    assert hit.descriptor == authenticated["configuration"]
    assert hit.entries == authenticated["entries"]

    stale = prefix_cache.try_load(
        cache_path,
        bank_path=output,
        expected_root_sha256=root_sha256,
        expected_source_prefix_sha256=source_sha256,
        producer_source_sha256="0" * 64,
    )
    assert stale.hit is False
    assert "identity" in stale.reason


def test_prefix_bank_wrong_missing_pins_and_v2_record_fail_closed(
    tmp_path: Path,
) -> None:
    output, root_sha256, source_sha256, _manifest = _build_authenticated_prefix_fixture(
        tmp_path
    )
    for expected_root, expected_source in (
        ("0" * 64, source_sha256),
        (root_sha256, "0" * 64),
    ):
        with pytest.raises(
            v3.StructuralCegarError,
            match="prefix-bank authentication failed",
        ):
            v3._load_authenticated_three_rhombus_prefix_bank(
                output,
                expected_root_sha256=expected_root,
                expected_source_prefix_sha256=expected_source,
            )

    with pytest.raises(
        v3.StructuralCegarError,
        match="must be provided together",
    ):
        v3.run_driver(
            tmp_path / "missing-pin",
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            three_rhombus_prefix_bank=output,
            three_rhombus_prefix_root_sha256=root_sha256,
        )
    with pytest.raises(
        v3.StructuralCegarError,
        match="requires projected-static-v3",
    ):
        v3.run_driver(
            tmp_path / "wrong-mode",
            bootstrap_results=None,
            algebraic_bootstrap=None,
            three_rhombus_prefix_bank=output,
            three_rhombus_prefix_root_sha256=root_sha256,
            three_rhombus_prefix_source_sha256=source_sha256,
        )

    authenticated = v3._load_authenticated_three_rhombus_prefix_bank(
        output,
        expected_root_sha256=root_sha256,
        expected_source_prefix_sha256=source_sha256,
    )
    encoding = v3._phase3_encoding(projected_static_v3=True)
    learned: list[dict[str, Any]] = []
    v3._append_three_rhombus_prefix_records(learned, encoding, authenticated)
    unsigned = {
        key: value
        for key, value in learned[0].items()
        if key not in {"previous_record_sha256", "record_sha256"}
    }
    unsigned["schema"] = prefix_bank.LEARNED_SCHEMA
    substituted = v3._with_record_hash(unsigned, None)
    journal = tmp_path / "v2-substitution.jsonl"
    journal.write_bytes(v3._canonical_bytes(substituted) + b"\n")
    with pytest.raises(
        v3.StructuralCegarError,
        match="learned record identity mismatch",
    ):
        v3._load_learned(
            journal,
            encoding,
            three_rhombus_prefix_bank_data=authenticated,
        )


def test_prefix_bank_cli_inputs_are_a_required_group(
    tmp_path: Path,
) -> None:
    with pytest.raises(SystemExit):
        v3._parse_args(
            [
                "--projected-static-v3",
                "--three-rhombus-prefix-bank",
                str(tmp_path / "bank"),
            ]
        )
    args = v3._parse_args(
        [
            "--projected-static-v3",
            "--three-rhombus-prefix-bank",
            str(tmp_path / "bank"),
            "--three-rhombus-prefix-root-sha256",
            "1" * 64,
            "--three-rhombus-prefix-source-sha256",
            "2" * 64,
        ]
    )
    assert args.three_rhombus_prefix_bank == tmp_path / "bank"
    assert args.three_rhombus_prefix_root_sha256 == "1" * 64
    assert args.three_rhombus_prefix_source_sha256 == "2" * 64


def _static_piqd_cli_args(tmp_path: Path) -> list[str]:
    return [
        "--piqd-base-url",
        "http://127.0.0.1:7272",
        "--piqd-journal-root",
        str(tmp_path / "journal"),
        "--piqd-source-manifest",
        str(tmp_path / "source-manifest.json"),
        "--piqd-producer-manifest",
        str(tmp_path / "producer-manifest.json"),
    ]


def test_static_piqd_cli_inputs_are_an_all_or_none_group(
    tmp_path: Path,
) -> None:
    complete = _static_piqd_cli_args(tmp_path)
    for index in range(0, len(complete), 2):
        incomplete = complete[:index] + complete[index + 2 :]
        with pytest.raises(SystemExit):
            v3._parse_args(incomplete)

    args = v3._parse_args(complete)
    assert args.piqd_base_url == "http://127.0.0.1:7272"
    assert args.piqd_journal_root == tmp_path / "journal"
    assert args.piqd_source_manifest == tmp_path / "source-manifest.json"
    assert args.piqd_producer_manifest == tmp_path / "producer-manifest.json"


@pytest.mark.parametrize(
    "incompatible",
    [
        ["--persistent-discovery"],
        ["--parallel-mode", "cube-batch"],
        ["--workers", "2"],
    ],
)
def test_static_piqd_cli_rejects_incompatible_discovery_modes(
    tmp_path: Path,
    incompatible: list[str],
) -> None:
    with pytest.raises(SystemExit):
        v3._parse_args([*_static_piqd_cli_args(tmp_path), *incompatible])


def test_static_piqd_factory_receives_exact_manifest_bytes_and_values(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    source_bytes = b'{"canonical":"source"}\n'
    producer_bytes = b'{"canonical":"producer"}\n'
    (tmp_path / "source-manifest.json").write_bytes(source_bytes)
    (tmp_path / "producer-manifest.json").write_bytes(producer_bytes)
    captured: dict[str, Any] = {}

    def discovery_runner(_cnf: Path, _timeout: int, _proof: Path | None) -> Any:
        return v3.sat.SolverResult("UNKNOWN", {}, 0, "", "")

    def factory(**kwargs: Any) -> Any:
        captured.update(kwargs)
        return discovery_runner

    monkeypatch.setattr(v3, "_make_static_piqd_solver_runner", factory)
    runner = v3._solver_runner_from_cli_args(
        v3._parse_args(_static_piqd_cli_args(tmp_path))
    )

    assert callable(runner)
    assert captured == {
        "base_url": "http://127.0.0.1:7272",
        "journal_root": tmp_path / "journal",
        "source_manifest": source_bytes,
        "producer_manifest": producer_bytes,
    }


def test_absent_static_piqd_flags_preserve_local_solver_default() -> None:
    assert v3._solver_runner_from_cli_args(v3._parse_args([])) is v3.sat.run_cadical


def _incremental_piqd_cli_args(tmp_path: Path) -> list[str]:
    return [
        "--persistent-discovery",
        "--projected-static-v3",
        *_static_piqd_cli_args(tmp_path),
        "--piqd-producer-job-id",
        "22222222-2222-4222-8222-222222222222",
        "--piqd-solver-name",
        "fake-cadical",
    ]


def test_incremental_piqd_cli_inputs_are_an_all_or_none_group(
    tmp_path: Path,
) -> None:
    complete = _incremental_piqd_cli_args(tmp_path)
    group_start = 2
    for index in range(group_start, len(complete), 2):
        incomplete = complete[:index] + complete[index + 2 :]
        with pytest.raises(SystemExit):
            v3._parse_args(incomplete)

    config = v3._incremental_piqd_caller_config(v3._parse_args(complete))
    assert config == v3._IncrementalPiqdCallerConfig(
        base_url="http://127.0.0.1:7272",
        custody_root=tmp_path / "journal",
        source_manifest=tmp_path / "source-manifest.json",
        producer_manifest=tmp_path / "producer-manifest.json",
        producer_job_id="22222222-2222-4222-8222-222222222222",
        solver_name="fake-cadical",
    )


@pytest.mark.parametrize(
    "incompatible",
    [
        ["--parallel-mode", "cube-batch"],
        ["--workers", "2"],
        ["--shard-local-simplification"],
        ["--resume"],
    ],
)
def test_incremental_piqd_cli_rejects_incompatible_modes(
    tmp_path: Path,
    incompatible: list[str],
) -> None:
    with pytest.raises(SystemExit):
        v3._parse_args([*_incremental_piqd_cli_args(tmp_path), *incompatible])


def test_incremental_piqd_cli_rejects_missing_mode_and_mixed_static_inputs(
    tmp_path: Path,
) -> None:
    without_projected = [
        value
        for value in _incremental_piqd_cli_args(tmp_path)
        if value != "--projected-static-v3"
    ]
    with pytest.raises(SystemExit):
        v3._parse_args(without_projected)
    with pytest.raises(SystemExit):
        v3._parse_args(
            [
                *_static_piqd_cli_args(tmp_path),
                "--piqd-producer-job-id",
                "22222222-2222-4222-8222-222222222222",
            ]
        )


def test_incremental_piqd_factory_receives_exact_manifest_bytes_and_values(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    source_bytes = b'{"canonical":"incremental-source"}\n'
    producer_bytes = b'{"canonical":"incremental-producer"}\n'
    (tmp_path / "source-manifest.json").write_bytes(source_bytes)
    (tmp_path / "producer-manifest.json").write_bytes(producer_bytes)
    config = v3._incremental_piqd_caller_config(
        v3._parse_args(_incremental_piqd_cli_args(tmp_path))
    )
    assert config is not None
    captured: dict[str, Any] = {}
    sentinel = object()

    def factory(**kwargs: Any) -> Any:
        captured.update(kwargs)
        return sentinel

    def local_proof(*_args: Any) -> Any:
        raise AssertionError("not called")

    monkeypatch.setattr(v3, "_make_incremental_piqd_solver_runner", factory)
    result = v3._incremental_solver_runner_from_config(
        config,
        base_cnf_path=tmp_path / "out" / "base.cnf",
        local_proof_runner=local_proof,
    )

    assert result is sentinel
    assert captured == {
        "base_url": "http://127.0.0.1:7272",
        "custody_root": tmp_path / "journal",
        "base_cnf_path": tmp_path / "out" / "base.cnf",
        "source_manifest": source_bytes,
        "producer_manifest": producer_bytes,
        "producer_job_id": "22222222-2222-4222-8222-222222222222",
        "solver_name": "fake-cadical",
        "local_proof_runner": local_proof,
    }


def test_incremental_piqd_qualification_authority_is_validated_and_forwarded(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    source_bytes = b'{"canonical":"production-source"}\n'
    producer_bytes = b'{"canonical":"production-producer"}\n'
    source_path = tmp_path / "source-manifest.json"
    producer_path = tmp_path / "producer-manifest.json"
    authority_path = tmp_path / "authority.json"
    source_path.write_bytes(source_bytes)
    producer_path.write_bytes(producer_bytes)
    authority_path.write_bytes(b"sealed authority fixture")
    authority = object()
    validations: list[dict[str, Any]] = []
    real_import = v3.importlib.import_module

    def import_module(name: str) -> Any:
        if name == "census.p97_search.phase3_piqd_projected_v3_qualification":
            return SimpleNamespace(
                load_production_authority_v3=lambda path: (
                    authority
                    if path == authority_path
                    else pytest.fail("wrong authority path")
                ),
                capture_production_control_input_v3=lambda path: path.read_bytes(),
                validate_production_launch_authority_v3=lambda *args, **kwargs: (
                    validations.append({"args": args, **kwargs})
                ),
            )
        return real_import(name)

    monkeypatch.setattr(v3.importlib, "import_module", import_module)
    args = v3._parse_args(
        [
            *_incremental_piqd_cli_args(tmp_path),
            "--piqd-qualification-authority",
            str(authority_path),
        ]
    )
    config = v3._incremental_piqd_caller_config(args)
    assert config is not None
    assert config.qualification_authority is authority
    expected_validation = {
        "args": (authority,),
        "daemon_url": "http://127.0.0.1:7272",
        "source_manifest": source_bytes,
        "producer_manifest": producer_bytes,
        "producer_job_id": "22222222-2222-4222-8222-222222222222",
        "solver_name": "fake-cadical",
    }
    assert validations
    assert all(item == expected_validation for item in validations)

    captured: dict[str, Any] = {}
    monkeypatch.setattr(
        v3,
        "_make_incremental_piqd_solver_runner",
        lambda **kwargs: captured.update(kwargs) or object(),
    )
    local_proof = lambda *_args: pytest.fail("not called")
    v3._incremental_solver_runner_from_config(
        config,
        base_cnf_path=tmp_path / "out" / "base.cnf",
        local_proof_runner=local_proof,
    )
    assert captured["production_authority"] is authority
    assert captured["source_manifest_path"] == source_path
    assert captured["producer_manifest_path"] == producer_path


def test_local_persistent_cli_path_is_preserved_without_piqd_inputs() -> None:
    args = v3._parse_args(["--persistent-discovery"])
    assert v3._incremental_piqd_caller_config(args) is None
    assert v3._static_piqd_caller_config(args) is None
    assert v3._solver_runner_from_cli_args(args) is v3.sat.run_cadical


def test_ingress_contract_cli_input_is_recorded(
    tmp_path: Path,
) -> None:
    args = v3._parse_args(
        [
            "--productivity-telemetry",
            "--ingress-contract",
            str(tmp_path / "b1.json"),
        ]
    )
    assert args.ingress_contract == tmp_path / "b1.json"


def test_prefix_bank_one_worker_one_raw_smoke_and_resume_pin_binding(
    tmp_path: Path,
) -> None:
    fixture = tmp_path / "fixture"
    fixture.mkdir()
    output, root_sha256, source_sha256, manifest = _build_authenticated_prefix_fixture(
        fixture
    )
    out = tmp_path / "driver"
    result = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1000,
        survivor_limit=100,
        workers=1,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        three_rhombus_prefix_bank=output,
        three_rhombus_prefix_root_sha256=root_sha256,
        three_rhombus_prefix_source_sha256=source_sha256,
        max_new_raw=1,
        solver_runner=_sat_runner(_first_projected_survivor_assignment()),
    )

    expected_count = manifest["counts"]["kept_antichain_clauses"]
    assert result["status"] == "CHECKPOINT"
    assert result["counts"]["raw_sat_count"] == 1
    assert (
        result["counts"]["bootstrap_three_rhombus_prefix_nogood_count"]
        == expected_count
        == 1
    )
    assert (
        result["configuration"]["three_rhombus_prefix_bank"]["bank_root_sha256"]
        == root_sha256
    )
    assert (
        result["configuration"]["three_rhombus_prefix_bank"]["source_prefix_sha256"]
        == source_sha256
    )
    assert (
        result["bootstrap"]["three_rhombus_prefix_bank"][
            "translated_learned_record_count"
        ]
        == expected_count
    )
    first_log = v3._strict_json_lines(out / "solver-logs.jsonl")[0]
    learned_bucket = first_log["clause_contract"]["source_inventory"]["buckets"][2]
    assert learned_bucket["clause_class"] == "LEARNED_CANDIDATE"
    assert (
        learned_bucket["clause_count"]
        == learned_bucket["record_identity"]["record_count"]
        == 1
    )
    assert learned_bucket["promotion_evidence"] is None
    records = [
        json.loads(line)
        for line in (out / "learned-certificates.jsonl").read_text().splitlines()
    ]
    assert len(records) >= expected_count
    assert all(
        record["origin"] == v3.BOOTSTRAP_THREE_RHOMBUS_PREFIX_ORIGIN
        for record in records[:expected_count]
    )

    with pytest.raises(
        v3.StructuralCegarError,
        match="prefix-bank authentication failed",
    ):
        v3.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=1000,
            survivor_limit=100,
            workers=1,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            three_rhombus_prefix_bank=output,
            three_rhombus_prefix_root_sha256="0" * 64,
            three_rhombus_prefix_source_sha256=source_sha256,
            resume=True,
        )
