from __future__ import annotations

import copy
import hashlib
import importlib
import json
import shutil
import sys
import time
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
HERE = ROOT / "census/p97_search"
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

cegar = importlib.import_module("census.p97_search.phase3_structural_cegar")

CURRENT_MODELS = (
    HERE
    / "out/phase3-production"
    / "k4-n10-profile-445-combined-bounded100-current-20260728"
    / "models.jsonl"
)
ALGEBRAIC_SURVIVORS = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_structural_cegar_10000_20260729"
    / "survivors.jsonl"
)
CONVEX_FIVE_SURVIVORS = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_structural_cegar_algebraic_100000_20260729"
    / "survivors.jsonl"
)
REAL_DISTINCTNESS_SURVIVORS = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_structural_cegar_projected_sequential_global_v2_20260729"
    / "survivors.jsonl"
)
CONVEX_FIVE_ROWS_SHA256 = (
    "a582e5a9556d8c665bb4025fa32227a5d9484cd32acf9c06adef673df5afa3c2"
)


def _first_assignment() -> dict[int, bool]:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    record = json.loads(CURRENT_MODELS.read_text().splitlines()[0])
    return encoding.assignment_from_record(record)


def _sat_runner(assignment: dict[int, bool]):
    def run(_cnf: Path, _timeout: int, _proof: Path | None):
        return cegar.sat.SolverResult("SAT", assignment, 10, "s SATISFIABLE\n", "")

    return run


def _alternate_blocker_assignment() -> dict[int, bool]:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    assignment[encoding.var("b", 0, 1)] = False
    assignment[encoding.var("b", 0, 2)] = True
    encoding.validate(encoding.decode(assignment), assignment)
    return assignment


def _cube_runner(
    assignments: dict[int, dict[int, bool]],
    delays: dict[int, float] | None = None,
):
    def run(cnf: Path, _timeout: int, _proof: Path | None):
        cube_index = int(cnf.stem.rsplit("-", 1)[1])
        time.sleep((delays or {}).get(cube_index, 0.0))
        assignment = assignments.get(cube_index)
        if assignment is None:
            return cegar.sat.SolverResult(
                "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
            )
        return cegar.sat.SolverResult(
            "SAT", assignment, 10, "s SATISFIABLE\n", ""
        )

    return run


def _directory_bytes(path: Path) -> dict[str, bytes]:
    return {
        str(item.relative_to(path)): item.read_bytes()
        for item in sorted(path.rglob("*"))
        if item.is_file()
    }


def _convex_five_assignment() -> dict[int, bool]:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    records = map(json.loads, CONVEX_FIVE_SURVIVORS.read_text().splitlines())
    record = next(
        item
        for item in records
        if item["metric_rows_sha256"] == CONVEX_FIVE_ROWS_SHA256
    )
    return encoding.assignment_from_record(record)


def _artifact_hash(value: object) -> str:
    return hashlib.sha256(cegar._canonical_bytes(value) + b"\n").hexdigest()


def _rehash_certificate(certificate: dict[str, object]) -> None:
    entries = certificate["entries"]
    assert isinstance(entries, list)
    certificate["cofactor_stream_sha256"] = _artifact_hash(
        [entry["cofactor"] for entry in entries]
    )
    payload = dict(certificate)
    payload.pop("certificate_payload_sha256", None)
    certificate["certificate_payload_sha256"] = _artifact_hash(payload)


def _rehash_cap_order_certificate(certificate: dict[str, object]) -> None:
    certificate["order_coverage_sha256"] = cegar._sha256_value(
        certificate["order_coverage"]
    )
    payload = dict(certificate)
    payload.pop("certificate_payload_sha256", None)
    certificate["certificate_payload_sha256"] = cegar._sha256_value(payload)


def _rehash_rhombus_cap_order_certificate(
    certificate: dict[str, object],
) -> None:
    ordered_rule = certificate["ordered_rule"]
    assert isinstance(ordered_rule, dict)
    ordered_rule["order_coverage_sha256"] = (
        cegar.ordered_rules._sha256_json(ordered_rule["order_coverage"])
    )
    rule_payload = dict(ordered_rule)
    rule_payload.pop("record_sha256", None)
    ordered_rule["record_sha256"] = cegar.ordered_rules._sha256_json(
        rule_payload
    )
    payload = dict(certificate)
    payload.pop("certificate_payload_sha256", None)
    certificate["certificate_payload_sha256"] = cegar._sha256_value(payload)


def _rehash_kalmanson_cap_order_certificate(
    certificate: dict[str, object],
) -> None:
    ordered_rule = certificate["ordered_rule"]
    assert isinstance(ordered_rule, dict)
    rule_payload = dict(ordered_rule)
    rule_payload.pop("record_sha256", None)
    ordered_rule["record_sha256"] = cegar.ordered_rules._sha256_json(
        rule_payload
    )
    payload = dict(certificate)
    payload.pop("certificate_payload_sha256", None)
    certificate["certificate_payload_sha256"] = cegar._sha256_value(payload)


def _bootstrap_source_records(
    encoding,
    source_certificates: list[dict[str, object]],
) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []
    previous: str | None = None
    for index, certificate in enumerate(source_certificates):
        schema = certificate.get("schema")
        if schema is None:
            replayed, selected = cegar._replay_certificate_json(certificate)
            origin = "bootstrap-structural-prefix"
            stage = replayed["stage"]
            clause = cegar._clause_for_rows(encoding, selected)
        elif schema == cegar.CAP_ORDER_CERTIFICATE_SCHEMA:
            replayed, _selected, _facts = (
                cegar._replay_cap_order_certificate(certificate)
            )
            origin = cegar.BOOTSTRAP_CAP_ORDER_ORIGIN
            stage = cegar.CAP_ORDER_STAGE
            clause = cegar._clause_for_cap_order_certificate(
                encoding, replayed
            )
        elif schema == cegar.RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA:
            replayed, _selected, _facts = (
                cegar._replay_rhombus_cap_order_certificate(certificate)
            )
            origin = cegar.BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN
            stage = cegar.RHOMBUS_CAP_ORDER_STAGE
            clause = cegar._clause_for_rhombus_cap_order_certificate(
                encoding, replayed
            )
        else:
            assert schema == cegar.KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
            replayed, _selected, _facts = (
                cegar._replay_kalmanson_cap_order_certificate(certificate)
            )
            origin = cegar.BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN
            stage = cegar.KALMANSON_CAP_ORDER_STAGE
            clause = cegar._clause_for_kalmanson_cap_order_certificate(
                encoding, replayed
            )
        record = cegar._with_record_hash(
            {
                "schema": cegar._learned_schema(encoding),
                "index": index,
                "origin": origin,
                "raw_sat_index": None,
                "assignment_sha256": None,
                "semantic_assignment": None,
                "stage": stage,
                "certificate": certificate,
                "clause": list(clause),
                "clause_sha256": cegar._sha256_value(list(clause)),
                "superseded_nogood_sha256": [],
            },
            previous,
        )
        previous = record["record_sha256"]
        records.append(record)
    return records


def _rehash_learned_record(
    record: dict[str, object], previous: str | None
) -> None:
    unsigned = dict(record)
    unsigned.pop("previous_record_sha256", None)
    unsigned.pop("record_sha256", None)
    record.clear()
    record.update(cegar._with_record_hash(unsigned, previous))


def _s_assignment(
    encoding, true_edges: set[tuple[int, int]]
) -> dict[int, bool]:
    return {
        encoding.var("s", center, point): (center, point) in true_edges
        for center in range(cegar.CELL.n)
        for point in range(cegar.CELL.n)
        if center != point
    }


def _equilateral_shell_assignment():
    encoding = cegar.sat.SatEncoding(
        cegar.CELL,
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope=cegar.sat.MINCUT_SCOPE_CARD_GE_TEN,
    )
    record = json.loads(
        (cegar.EQUILATERAL_SHELL_BOOTSTRAP / "record-000.json").read_text()
    )
    return encoding, encoding.assignment_from_record(record)


def test_smoke_gates_cover_dead_and_non_detected_controls() -> None:
    smoke = cegar._run_smoke_gates()

    assert smoke["known_dead"]["stage"] == "equality-duplicate-center"
    assert smoke["known_dead"]["certificate_replayed"] is True
    assert smoke["synthetic_non_detected"]["detector_result"] is None


def test_certificate_clause_uses_all_selected_four_supports() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    obj = encoding.decode(assignment)
    rows = cegar._metric_rows(obj)
    found = cegar._detection(rows)
    assert found is not None
    certificate, selected = cegar._certificate(rows, found)

    clause = cegar._clause_for_rows(encoding, selected, assignment)

    assert len(clause) == 4 * len(certificate["rows"])
    assert all(literal < 0 for literal in clause)
    assert len(set(clause)) == len(clause)
    assert all(row.exact is False for row in selected)
    assert all(
        len(row.support) == len(set(row.support)) == 4
        and row.center not in row.support
        for row in selected
    )


def test_duplicate_center_clause_uses_exact_checked_path_memberships() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    obj = encoding.decode(assignment)
    rows = cegar._metric_rows(obj)
    found = cegar._detection(rows)
    assert found is not None
    certificate, selected = cegar._certificate(rows, found)

    expected_memberships = {
        (step["center"], point)
        for path in certificate["closure_paths"]
        for step in path["steps"]
        if step["kind"] == "row"
        for point in (step["first"], step["second"])
    }
    memberships = cegar._duplicate_center_path_memberships(certificate)
    clause = cegar._clause_for_structural_certificate(
        encoding, certificate, selected, assignment
    )
    legacy_clause = cegar._clause_for_rows(encoding, selected, assignment)

    assert memberships == tuple(sorted(expected_memberships))
    assert clause == tuple(
        -encoding.var("s", center, point)
        for center, point in sorted(expected_memberships)
    )
    assert set(clause) < set(legacy_clause)
    assert (len(clause), len(legacy_clause)) == (9, 16)
    assert cegar.DUPLICATE_CENTER_LEAN_CONSUMER.endswith(
        "DuplicateCenterCertificate.not_realizes_of_check"
    )


def test_structural_clause_projection_rejects_tampered_path_data() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    rows = cegar._metric_rows(encoding.decode(assignment))
    found = cegar._detection(rows)
    assert found is not None
    certificate, _selected = cegar._certificate(rows, found)

    tampered = copy.deepcopy(certificate)
    tampered["side_conditions"] = []
    with pytest.raises(
        cegar.StructuralCegarError,
        match="injective-realization side condition mismatch",
    ):
        cegar._duplicate_center_path_memberships(tampered)

    tampered = copy.deepcopy(certificate)
    tampered["closure_paths"][0]["steps"][0]["unused"] = True
    with pytest.raises(
        cegar.StructuralCegarError,
        match="step fields mismatch",
    ):
        cegar._duplicate_center_path_memberships(tampered)


def test_non_duplicate_structural_clause_keeps_whole_rows() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    rows = cegar._metric_rows(encoding.decode(assignment))
    found = cegar._detection(rows)
    assert found is not None
    _certificate, selected = cegar._certificate(rows, found)

    assert cegar._clause_for_structural_certificate(
        encoding, {"stage": "equality-equal-k4"}, selected, assignment
    ) == cegar._clause_for_rows(encoding, selected, assignment)


def test_clause_subsumption_minimize_is_order_independent() -> None:
    clauses = {
        (-3, -1): "first",
        (-1, -3): "same-set",
        (-4, -3, -1): "superset",
        (-9,): "independent",
    }

    kept, cover = cegar._clause_subsumption_minimize(clauses)

    assert {frozenset(clause) for clause in kept} == {
        frozenset({-3, -1}),
        frozenset({-9}),
    }
    assert frozenset(cover[(-1, -3)]) == frozenset({-3, -1})
    assert frozenset(cover[(-4, -3, -1)]) == frozenset({-3, -1})


def test_real_survivor_has_replayed_minimal_cap_order_certificate() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _convex_five_assignment()
    obj = encoding.decode(assignment)
    rows = cegar._metric_rows(obj)

    assert cegar._detection(rows) is None
    result = cegar._cap_order_certificate(obj, rows)
    assert result is not None
    certificate, selected, cap_facts = result
    replayed, replayed_rows, replayed_facts = (
        cegar._replay_cap_order_certificate(certificate)
    )
    clause = cegar._clause_for_cap_order_certificate(
        encoding, certificate, assignment
    )

    assert replayed == certificate
    assert replayed_rows == selected
    assert replayed_facts == cap_facts == ((6, 1), (8, 2))
    assert [row.center for row in selected] == [0, 1, 6]
    assert len(certificate["closure_certificates"]) == 1
    assert certificate["order_count"] == len(certificate["order_coverage"]) == 24
    assert certificate["cap_minimization"] == {
        "method": "exact-cardinality-then-lexicographic-subset-enumeration",
        "source_fact_count": 7,
        "retained_fact_count": 2,
        "retained_facts": [[6, 1], [8, 2]],
        "compatible_annotation_count": 80,
        "compatible_order_count": 1920,
        "compatible_order_coverage_sha256": (
            "92117788d0d8c62e81c46347f8a2d45f7d7a8e63d7108db054fca783b95038f9"
        ),
    }
    assert {
        tuple(entry["core"][name] for name in ("a", "x", "b", "c", "y"))
        for entry in certificate["order_coverage"]
    } == {(8, 1, 2, 6, 0)}
    assert {
        entry["lean_theorem"] for entry in certificate["order_coverage"]
    } == {
        "Problem97.Census554.ConvexFivePointCore.false_of_core_of_neg"
    }
    assert len(clause) == certificate["antecedent"]["literal_count"] == 14
    assert clause[-2:] == (
        -encoding.var("f", 6, 1),
        -encoding.var("f", 8, 2),
    )


def test_rhombus_cap_order_certificate_is_exhaustive_minimal_and_generic() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    obj = encoding.decode(assignment)
    result = cegar._rhombus_cap_order_certificate(
        obj, cegar._metric_rows(obj)
    )
    assert result is not None
    certificate, selected, cap_facts = result

    replayed, replayed_rows, replayed_facts = (
        cegar._replay_rhombus_cap_order_certificate(certificate)
    )
    clause = cegar._clause_for_rhombus_cap_order_certificate(
        encoding, certificate, assignment
    )
    ordered_rule = certificate["ordered_rule"]

    assert replayed == certificate
    assert replayed_rows == selected
    assert replayed_facts == cap_facts == (
        (3, 0),
        (4, 0),
        (5, 0),
        (6, 1),
        (7, 1),
    )
    assert [row.center for row in selected] == [0, 1, 2, 3, 4, 5, 6, 8, 9]
    assert ordered_rule["compatible_order_count"] == 24
    assert len(ordered_rule["order_coverage"]) == 24
    assert certificate["cap_minimization"] == {
        "method": "exact-cardinality-then-lexicographic-subset-enumeration",
        "source_fact_count": 7,
        "retained_fact_count": 5,
        "retained_facts": [[3, 0], [4, 0], [5, 0], [6, 1], [7, 1]],
        "compatible_annotation_count": 1,
        "compatible_order_count": 24,
        "compatible_order_coverage_sha256": (
            "7dbdec468d67949071570056eba59a1b2e4bc1ba8fd0164452303e6867df2ca1"
        ),
    }
    assert {
        entry["lean_theorem"] for entry in ordered_rule["order_coverage"]
    } == {
        "Problem97.Census554.ConvexRhombusCore.false_of_core_of_neg"
    }
    assert certificate["generic_lean_consumers"] == [
        dict(consumer) for consumer in cegar.ordered_rules.LEAN_CONSUMERS
    ]
    assert "not Lean-kernel-checked" in certificate[
        "concrete_ingress_trust_boundary"
    ]
    assert len(clause) == certificate["antecedent"]["literal_count"] == 41


def test_kalmanson_certificate_binds_role_changing_union_for_all_orders() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    obj = encoding.decode(assignment)
    result = cegar._kalmanson_cap_order_certificate(
        obj, cegar._metric_rows(obj)
    )

    assert result is not None
    certificate, selected, cap_facts = result
    replayed, replayed_rows, replayed_facts = (
        cegar._replay_kalmanson_cap_order_certificate(certificate)
    )
    clause = cegar._clause_for_kalmanson_cap_order_certificate(
        encoding, certificate, assignment
    )
    ordered_rule = certificate["ordered_rule"]

    assert replayed == certificate
    assert replayed_rows == selected
    assert replayed_facts == cap_facts == (
        (3, 0),
        (4, 0),
        (5, 0),
        (6, 1),
        (7, 1),
    )
    assert [row.center for row in selected] == [5, 6, 7, 9]
    assert certificate["row_minimization"]["retained_row_count"] == 4
    assert ordered_rule["compatible_order_count"] == 24
    assert len(ordered_rule["order_coverage"]) == 24
    assert {
        tuple(
            entry["row_centers"][role]
            for role in cegar.ordered_rules.KALMANSON_ROW_ROLES
        )
        for entry in ordered_rule["order_coverage"]
    } == {(9, 6, 7), (7, 9, 5)}
    assert {
        entry["lean_theorem"] for entry in ordered_rule["order_coverage"]
    } == {
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_selected_rows_in_five_ccw_order"
        )
    }
    assert certificate["cap_minimization"]["compatible_order_count"] == 24
    assert len(clause) == certificate["antecedent"]["literal_count"] == 21
    assert clause[-5:] == tuple(
        -encoding.var("f", label, cap) for label, cap in cap_facts
    )


def test_shared_pair_separation_certificate_is_minimized_and_replayed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    obj = encoding.decode(assignment)
    result = cegar._shared_pair_separation_certificate(
        encoding, assignment, obj, cegar._metric_rows(obj)
    )

    assert result is not None
    certificate, selected, facts = result
    replayed, replayed_rows, replayed_facts = (
        cegar._replay_shared_pair_separation_certificate(certificate)
    )
    clause = cegar._clause_for_shared_pair_separation_certificate(
        encoding, certificate, assignment
    )
    assert replayed == certificate
    assert replayed_rows == selected
    assert replayed_facts == facts == ((3, 0),)
    assert [row.center for row in selected] == [0, 1]
    assert certificate["minimization"]["literal_count"] == 9
    assert certificate["minimization"]["compatible_annotation_count"] == 210
    assert certificate["minimization"]["compatible_order_count"] == 5040
    assert len(clause) == certificate["antecedent"]["literal_count"] == 9
    assert certificate["source_certificate"]["lean_consumer"] == (
        cegar.shared_pair_separation.LEAN_CONSUMER
    )
    tampered = copy.deepcopy(certificate)
    tampered["antecedent"]["literal_count"] = 10
    unsigned_tampered = dict(tampered)
    unsigned_tampered.pop("certificate_payload_sha256")
    tampered["certificate_payload_sha256"] = cegar._sha256_value(
        unsigned_tampered
    )
    with pytest.raises(cegar.StructuralCegarError, match="antecedent mismatch"):
        cegar._replay_shared_pair_separation_certificate(tampered)

    learned: list[dict[str, object]] = []
    learned_clauses: list[tuple[int, ...]] = []
    survivors: list[dict[str, object]] = []
    bank = cegar.certificates._NogoodBank()
    monkeypatch.setattr(cegar, "_detection", lambda _rows: None)
    monkeypatch.setattr(cegar, "_cap_order_certificate", lambda *_args: None)
    monkeypatch.setattr(
        cegar, "_rhombus_cap_order_certificate", lambda *_args: None
    )
    disposition = cegar._commit_sat_classification(
        encoding,
        assignment,
        raw_sat_index=0,
        algebraic_templates=(),
        learned=learned,
        learned_clauses=learned_clauses,
        learned_path=tmp_path / "learned.jsonl",
        survivors=survivors,
        survivor_clauses=[],
        survivors_path=tmp_path / "survivors.jsonl",
        bank=bank,
        failure_detail={},
    )
    assert disposition["classification"] == "learned-shared-pair-cyclic-separation"
    assert learned[0]["origin"] == cegar.SHARED_PAIR_SEPARATION_ORIGIN
    assert learned[0]["stage"] == cegar.SHARED_PAIR_SEPARATION_STAGE
    replayed_learned, replayed_bank, replayed_clauses = cegar._load_learned(
        tmp_path / "learned.jsonl", encoding
    )
    assert replayed_learned == learned
    assert len(replayed_bank.active) == 0
    assert replayed_clauses == learned_clauses
    bootstrapped, bootstrap_summary = cegar._bootstrap_certificates(
        encoding, tmp_path / "learned.jsonl"
    )
    assert bootstrapped[0]["origin"] == (
        cegar.BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN
    )
    assert bootstrapped[0]["stage"] == cegar.SHARED_PAIR_SEPARATION_STAGE
    assert bootstrap_summary["source_certificate_schema_histogram"] == {
        cegar.SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA: 1
    }
    assert bootstrap_summary["kept_shared_pair_separation_antichain_count"] == 1
    manifest = cegar._manifest(
        tmp_path,
        configuration={},
        status="RUNNING",
        diagnostic=None,
        learned=learned,
        survivors=survivors,
        logs=[{"verdict": "SAT"}],
        cube_batches=[],
        bank=bank,
        bootstrap_summary={},
        terminal_clause_count=None,
        unsat_verified=False,
    )
    assert manifest["counts"]["dynamic_shared_pair_separation_nogood_count"] == 1
    assert manifest["dynamic_stage_histogram"] == {
        cegar.SHARED_PAIR_SEPARATION_STAGE: 1
    }


def test_kalmanson_pinned_bounded100_unique_fixed_order_miss() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    record = json.loads(CURRENT_MODELS.read_text().splitlines()[3])
    obj = encoding.decode(encoding.assignment_from_record(record))
    rows = cegar._metric_rows(obj)
    misses = [
        order_id
        for order_id, order in cegar._cap_orders_from_facts(
            cegar._cap_facts(obj)
        )
        if cegar.ordered_rules.detect_selected_row_kalmanson(
            rows, cegar.CELL.n, order
        )
        is None
    ]

    assert misses == ["order-08"]


@pytest.mark.parametrize("tamper", ["order", "core", "cap", "coverage", "closure"])
def test_cap_order_certificate_tampering_fails_closed(tamper: str) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _convex_five_assignment()
    obj = encoding.decode(assignment)
    result = cegar._cap_order_certificate(obj, cegar._metric_rows(obj))
    assert result is not None
    certificate = copy.deepcopy(result[0])

    if tamper == "order":
        certificate["order_coverage"][0]["order"][0:2] = (
            certificate["order_coverage"][0]["order"][1::-1]
        )
    elif tamper == "core":
        certificate["order_coverage"][0]["core"]["y"] = 3
    elif tamper == "cap":
        certificate["cap_annotation"]["f"][0][1] = 1
    elif tamper == "coverage":
        certificate["cap_minimization"][
            "compatible_order_coverage_sha256"
        ] = "0" * 64
    else:
        certificate["closure_certificates"][0]["rows"][0]["support"][0] = 3
    _rehash_cap_order_certificate(certificate)

    with pytest.raises(cegar.StructuralCegarError):
        cegar._replay_cap_order_certificate(certificate)


def test_bootstrap_mixed_structural_and_cap_order_certificates(
    tmp_path: Path,
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    structural_assignment = _first_assignment()
    structural_obj = encoding.decode(structural_assignment)
    structural_rows = cegar._metric_rows(structural_obj)
    detection = cegar._detection(structural_rows)
    assert detection is not None
    structural_certificate, structural_selected = cegar._certificate(
        structural_rows, detection
    )
    cap_obj = encoding.decode(_convex_five_assignment())
    cap_result = cegar._cap_order_certificate(
        cap_obj, cegar._metric_rows(cap_obj)
    )
    assert cap_result is not None
    cap_certificate = cap_result[0]
    rhombus_obj = encoding.decode(_first_assignment())
    rhombus_result = cegar._rhombus_cap_order_certificate(
        rhombus_obj, cegar._metric_rows(rhombus_obj)
    )
    assert rhombus_result is not None
    rhombus_certificate = rhombus_result[0]
    kalmanson_result = cegar._kalmanson_cap_order_certificate(
        rhombus_obj, cegar._metric_rows(rhombus_obj)
    )
    assert kalmanson_result is not None
    kalmanson_certificate = kalmanson_result[0]

    source_certificates = [
        rhombus_certificate,
        kalmanson_certificate,
        cap_certificate,
        structural_certificate,
    ]
    source_records = _bootstrap_source_records(
        encoding, source_certificates
    )
    source = tmp_path / "mixed.jsonl"
    source.write_text(
        "".join(
            json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
            for record in source_records
        )
    )
    learned, summary = cegar._bootstrap_certificates(encoding, source)

    assert [record["origin"] for record in learned] == [
        cegar.BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
        cegar.BOOTSTRAP_CAP_ORDER_ORIGIN,
        cegar.BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
        cegar.BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
    ]
    projected_clause = cegar._clause_for_structural_certificate(
        encoding, structural_certificate, structural_selected
    )
    legacy_clause = cegar._clause_for_rows(encoding, structural_selected)
    assert learned[0]["clause"] == list(projected_clause)
    assert set(projected_clause) < set(legacy_clause)
    assert summary["source_record_count"] == 4
    assert summary["source_unique_certificate_count"] == 4
    assert summary["source_structural_unique_certificate_count"] == 1
    assert summary["source_cap_order_unique_certificate_count"] == 3
    assert (
        summary["source_five_point_cap_order_unique_certificate_count"] == 1
    )
    assert summary["source_rhombus_cap_order_unique_certificate_count"] == 1
    assert summary["source_kalmanson_cap_order_unique_certificate_count"] == 1
    assert summary["kept_structural_antichain_count"] == 1
    assert summary["kept_structural_row_antichain_count"] == 1
    assert summary["structural_projected_unique_clause_count"] == 1
    assert summary["structural_projected_duplicate_clause_count"] == 0
    assert summary["structural_projected_subsumed_clause_count"] == 0
    assert summary["kept_cap_order_antichain_count"] == 3
    assert summary["kept_five_point_cap_order_antichain_count"] == 1
    assert summary["kept_rhombus_cap_order_antichain_count"] == 1
    assert summary["kept_kalmanson_cap_order_antichain_count"] == 1
    assert summary["kept_antichain_count"] == 4

    reversed_source = tmp_path / "mixed-reversed.jsonl"
    reversed_records = _bootstrap_source_records(
        encoding, list(reversed(source_certificates))
    )
    reversed_source.write_text(
        "".join(
            json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
            for record in reversed_records
        )
    )
    reversed_learned, reversed_summary = cegar._bootstrap_certificates(
        encoding, reversed_source
    )
    assert reversed_learned == learned
    assert reversed_summary == summary

    learned_path = tmp_path / "learned.jsonl"
    learned_path.write_bytes(
        b"".join(cegar._canonical_bytes(record) + b"\n" for record in learned)
    )
    replayed, bank, clauses = cegar._load_learned(learned_path, encoding)
    assert replayed == learned
    assert len(bank.active) == 1
    assert clauses == [tuple(record["clause"]) for record in learned]

    tampered_rhombus = copy.deepcopy(rhombus_certificate)
    tampered_rhombus["ordered_rule"]["order_coverage"][0][
        "lean_theorem"
    ] = "Problem97.Census554.ConvexRhombusCore.false_of_core"
    _rehash_rhombus_cap_order_certificate(tampered_rhombus)
    tampered_source = tmp_path / "mixed-tampered.jsonl"
    tampered_records = _bootstrap_source_records(
        encoding, [structural_certificate, rhombus_certificate]
    )
    tampered_records[1]["certificate"] = tampered_rhombus
    _rehash_learned_record(
        tampered_records[1], tampered_records[0]["record_sha256"]
    )
    tampered_source.write_text(
        "".join(
            json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
            for record in tampered_records
        )
    )
    with pytest.raises(
        cegar.StructuralCegarError,
        match=r"bootstrap record 1 certificate failed replay",
    ):
        cegar._bootstrap_certificates(encoding, tampered_source)


def test_bootstrap_origin_selects_exact_structural_clause_policy(
    tmp_path: Path,
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    rows = cegar._metric_rows(encoding.decode(assignment))
    found = cegar._detection(rows)
    assert found is not None
    certificate, _selected = cegar._certificate(rows, found)
    records = _bootstrap_source_records(encoding, [certificate])
    records[0]["origin"] = cegar.BOOTSTRAP_STRUCTURAL_PATH_ORIGIN
    _rehash_learned_record(records[0], None)
    source = tmp_path / "wrong-origin-clause-policy.jsonl"
    source.write_bytes(cegar._canonical_bytes(records[0]) + b"\n")

    with pytest.raises(
        cegar.StructuralCegarError,
        match="learned-record certificate linkage mismatch",
    ):
        cegar._bootstrap_certificates(encoding, source)


def test_bootstrap_rejects_rehashed_learned_envelope_tampering(
    tmp_path: Path,
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    obj = encoding.decode(_first_assignment())
    result = cegar._kalmanson_cap_order_certificate(
        obj, cegar._metric_rows(obj)
    )
    assert result is not None
    certificate = result[0]
    baseline = _bootstrap_source_records(encoding, [certificate])

    cases: list[tuple[str, list[dict[str, object]], str]] = []
    extra = copy.deepcopy(baseline)
    extra[0]["untrusted_note"] = "accepted only if fields are not strict"
    _rehash_learned_record(extra[0], None)
    cases.append(("extra", extra, "learned-record fields mismatch"))

    identity = copy.deepcopy(baseline)
    identity[0]["index"] = 9
    _rehash_learned_record(identity[0], None)
    cases.append(("identity", identity, "learned-record identity mismatch"))

    linkage = copy.deepcopy(baseline)
    linkage[0]["stage"] = cegar.RHOMBUS_CAP_ORDER_STAGE
    _rehash_learned_record(linkage[0], None)
    cases.append(
        ("linkage", linkage, "learned-record certificate linkage mismatch")
    )

    inner = copy.deepcopy(baseline)
    inner_certificate = inner[0]["certificate"]
    assert isinstance(inner_certificate, dict)
    ordered_rule = inner_certificate["ordered_rule"]
    assert isinstance(ordered_rule, dict)
    ordered_rule["lean_theorem"] = (
        "Problem97.CapCrossingKalmansonBridge.not_the_theorem"
    )
    _rehash_kalmanson_cap_order_certificate(inner_certificate)
    _rehash_learned_record(inner[0], None)
    cases.append(("inner", inner, "Kalmanson ordered-rule identity mismatch"))

    for name, records, error in cases:
        source = tmp_path / f"tampered-{name}.jsonl"
        source.write_bytes(
            b"".join(
                cegar._canonical_bytes(record) + b"\n"
                for record in records
            )
        )
        with pytest.raises(cegar.StructuralCegarError, match=error):
            cegar._bootstrap_certificates(encoding, source)


def test_bootstrap_rejects_rehashed_broken_source_chain(
    tmp_path: Path,
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    obj = encoding.decode(assignment)
    rows = cegar._metric_rows(obj)
    found = cegar._detection(rows)
    assert found is not None
    certificate, _selected = cegar._certificate(rows, found)
    records = _bootstrap_source_records(
        encoding, [certificate, copy.deepcopy(certificate)]
    )
    cap_obj = encoding.decode(_convex_five_assignment())
    cap_result = cegar._cap_order_certificate(
        cap_obj, cegar._metric_rows(cap_obj)
    )
    assert cap_result is not None
    replacement = _bootstrap_source_records(encoding, [cap_result[0]])
    records[0] = replacement[0]
    source = tmp_path / "broken-chain.jsonl"
    source.write_bytes(
        b"".join(
            cegar._canonical_bytes(record) + b"\n" for record in records
        )
    )

    with pytest.raises(
        cegar.StructuralCegarError,
        match=r"bootstrap record 1: broken record hash chain",
    ):
        cegar._bootstrap_certificates(encoding, source)


def test_cap_order_certificate_negative_when_one_closure_row_is_removed() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    obj = encoding.decode(_convex_five_assignment())
    shells = list(obj.node.shells)
    shells[0] = frozenset({1, 2, 3, 4})
    node = cegar.sat.Node(n=10, k=4, shells=tuple(shells))
    caps = cegar.sat.CapAnnotation(
        node=node, M=frozenset({0, 1, 2}), f=dict(obj.caps.f)
    )
    altered = cegar.sat.AnnotatedNode(node=node, caps=caps)

    assert cegar._cap_order_certificate(
        altered, cegar._metric_rows(altered)
    ) is None


def test_classification_count_cache_initializes_from_replayed_records() -> None:
    learned = [
        {"origin": "bootstrap-structural-prefix", "raw_sat_index": None},
        {
            "origin": cegar.BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
            "raw_sat_index": None,
        },
        {"origin": cegar.STRUCTURAL_PATH_ORIGIN, "raw_sat_index": 0},
        {"origin": cegar.ALGEBRAIC_ORIGIN, "raw_sat_index": 1},
    ]
    survivors = [{"raw_sat_index": 2}]

    assert cegar._classification_count_cache(learned, survivors) == (2, 3)


@pytest.mark.parametrize(
    ("learned", "survivors", "error"),
    [
        (
            [{"origin": "solver", "raw_sat_index": True}],
            [],
            "raw SAT index is invalid",
        ),
        (
            [{"origin": "solver", "raw_sat_index": -1}],
            [],
            "raw SAT index is invalid",
        ),
        (
            [{"origin": "solver", "raw_sat_index": 0}],
            [{"raw_sat_index": 0}],
            "raw SAT indices are not a dense prefix",
        ),
        (
            [{"origin": "solver", "raw_sat_index": 1}],
            [],
            "raw SAT indices are not a dense prefix",
        ),
    ],
)
def test_classification_count_cache_rejects_invalid_replayed_indices(
    learned: list[dict[str, object]],
    survivors: list[dict[str, object]],
    error: str,
) -> None:
    with pytest.raises(cegar.StructuralCegarError, match=error):
        cegar._classification_count_cache(learned, survivors)


def test_committed_classification_delta_accepts_one_outcome() -> None:
    assert cegar._committed_classification_delta(
        [{"origin": cegar.STRUCTURAL_PATH_ORIGIN}],
        [],
        learned_before=0,
        survivors_before=0,
    ) == (1, 1)
    assert cegar._committed_classification_delta(
        [],
        [{}],
        learned_before=0,
        survivors_before=0,
    ) == (0, 1)
    assert cegar._committed_classification_delta(
        [{"origin": cegar.ALGEBRAIC_ORIGIN}],
        [],
        learned_before=0,
        survivors_before=0,
    ) == (1, 1)


@pytest.mark.parametrize(
    ("learned", "survivors", "learned_before", "survivors_before"),
    [
        ([], [], 0, 0),
        ([{"origin": "solver"}, {"origin": "solver"}], [], 0, 0),
        ([], [{}, {}], 0, 0),
        ([{"origin": "solver"}], [{}], 0, 0),
        ([], [], 1, 0),
    ],
)
def test_committed_classification_delta_rejects_non_single_outcomes(
    learned: list[dict[str, object]],
    survivors: list[dict[str, object]],
    learned_before: int,
    survivors_before: int,
) -> None:
    with pytest.raises(
        cegar.StructuralCegarError,
        match="exactly one committed outcome",
    ):
        cegar._committed_classification_delta(
            learned,
            survivors,
            learned_before=learned_before,
            survivors_before=survivors_before,
        )


def test_committed_classification_delta_rejects_invalid_learned_origin() -> None:
    with pytest.raises(
        cegar.StructuralCegarError,
        match="invalid learned origin",
    ):
        cegar._committed_classification_delta(
            [{"origin": cegar.BOOTSTRAP_STRUCTURAL_PATH_ORIGIN}],
            [],
            learned_before=0,
            survivors_before=0,
        )


def test_real_survivor_is_classified_without_launching_a_real_solver(
    tmp_path: Path,
) -> None:
    assignment = _convex_five_assignment()
    out = tmp_path / "cap-order-run"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(assignment),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["raw_sat_count"] == 1
    assert result["counts"]["classified_raw_sat_count"] == 1
    assert result["counts"]["dynamic_total_nogood_count"] == 1
    assert result["counts"]["dynamic_learned_core_count"] == 1
    assert result["counts"]["dynamic_cap_order_nogood_count"] == 1
    assert result["counts"]["structural_survivor_count"] == 0
    record = json.loads((out / "learned-certificates.jsonl").read_text())
    assert record["origin"] == cegar.CAP_ORDER_ORIGIN
    assert record["stage"] == cegar.CAP_ORDER_STAGE
    assert len(record["clause"]) == 14

    resumed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        resume=True,
        solver_runner=lambda *_args: pytest.fail("completed resume called solver"),
    )
    assert resumed == result


def test_rhombus_classifier_resume_and_manifest_accounting(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    learned: list[dict[str, object]] = []
    learned_clauses: list[tuple[int, ...]] = []
    survivors: list[dict[str, object]] = []
    survivor_clauses: list[tuple[int, ...]] = []
    bank = cegar.certificates._NogoodBank()
    learned_path = tmp_path / "learned.jsonl"
    survivors_path = tmp_path / "survivors.jsonl"

    monkeypatch.setattr(cegar, "_detection", lambda _rows: None)
    monkeypatch.setattr(
        cegar, "_cap_order_certificate", lambda _obj, _rows: None
    )
    disposition = cegar._commit_sat_classification(
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
        bank=bank,
        failure_detail={},
    )

    assert disposition["classification"] == "learned-rhombus-cap-order"
    assert len(learned) == 1
    assert learned[0]["origin"] == cegar.RHOMBUS_CAP_ORDER_ORIGIN
    assert learned[0]["stage"] == cegar.RHOMBUS_CAP_ORDER_STAGE
    assert learned[0]["certificate"]["schema"] == (
        cegar.RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA
    )

    replayed, replayed_bank, replayed_clauses = cegar._load_learned(
        learned_path, encoding
    )
    assert replayed == learned
    assert len(replayed_bank.active) == 0
    assert replayed_clauses == learned_clauses

    manifest = cegar._manifest(
        tmp_path,
        configuration={},
        status="RUNNING",
        diagnostic=None,
        learned=learned,
        survivors=survivors,
        logs=[{"verdict": "SAT"}],
        cube_batches=[],
        bank=bank,
        bootstrap_summary={},
        terminal_clause_count=None,
        unsat_verified=False,
    )
    assert manifest["counts"]["dynamic_cap_order_nogood_count"] == 1
    assert manifest["counts"]["dynamic_five_point_cap_order_nogood_count"] == 0
    assert manifest["counts"]["dynamic_rhombus_cap_order_nogood_count"] == 1
    assert manifest["dynamic_stage_histogram"] == {
        cegar.RHOMBUS_CAP_ORDER_STAGE: 1
    }
    assert "not kernel-landed" in manifest["trust_boundary"]["lean"]


def test_kalmanson_classifier_origin_stage_and_manifest_accounting(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    learned: list[dict[str, object]] = []
    learned_clauses: list[tuple[int, ...]] = []
    survivors: list[dict[str, object]] = []
    bank = cegar.certificates._NogoodBank()

    monkeypatch.setattr(cegar, "_detection", lambda _rows: None)
    monkeypatch.setattr(cegar, "_cap_order_certificate", lambda *_args: None)
    monkeypatch.setattr(
        cegar, "_rhombus_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    disposition = cegar._commit_sat_classification(
        encoding,
        assignment,
        raw_sat_index=0,
        algebraic_templates=(),
        learned=learned,
        learned_clauses=learned_clauses,
        learned_path=tmp_path / "learned.jsonl",
        survivors=survivors,
        survivor_clauses=[],
        survivors_path=tmp_path / "survivors.jsonl",
        bank=bank,
        failure_detail={},
    )

    assert disposition["classification"] == "learned-kalmanson-cap-order"
    assert learned[0]["origin"] == cegar.KALMANSON_CAP_ORDER_ORIGIN
    assert learned[0]["stage"] == cegar.KALMANSON_CAP_ORDER_STAGE
    assert learned[0]["certificate"]["schema"] == (
        cegar.KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
    )
    manifest = cegar._manifest(
        tmp_path,
        configuration={},
        status="RUNNING",
        diagnostic=None,
        learned=learned,
        survivors=survivors,
        logs=[{"verdict": "SAT"}],
        cube_batches=[],
        bank=bank,
        bootstrap_summary={},
        terminal_clause_count=None,
        unsat_verified=False,
    )
    assert manifest["counts"]["dynamic_cap_order_nogood_count"] == 1
    assert manifest["counts"]["dynamic_kalmanson_cap_order_nogood_count"] == 1
    assert manifest["dynamic_stage_histogram"] == {
        cegar.KALMANSON_CAP_ORDER_STAGE: 1
    }


def test_sequential_and_cube_kalmanson_classification_have_identical_records(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    original_detection = cegar._detection
    smoke_pending = True

    def kalmanson_after_smoke(rows):
        nonlocal smoke_pending
        if smoke_pending:
            smoke_pending = False
            return original_detection(rows)
        return None

    monkeypatch.setattr(cegar, "_detection", kalmanson_after_smoke)
    monkeypatch.setattr(cegar, "_cap_order_certificate", lambda *_args: None)
    monkeypatch.setattr(
        cegar, "_rhombus_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )

    sequential_out = tmp_path / "sequential-kalmanson"
    sequential = cegar.run_driver(
        sequential_out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        max_new_raw=1,
        solver_runner=_sat_runner(assignment),
    )

    smoke_pending = True
    cube_variable = cegar._stable_semantic_variables(encoding, 1)[0][1]
    cube_index = int(assignment[cube_variable])
    cube_out = tmp_path / "cube-kalmanson"
    cube = cegar.run_driver(
        cube_out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        workers=2,
        parallel_mode="cube-batch",
        cube_depth=1,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        max_new_raw=1,
        solver_runner=_cube_runner({cube_index: assignment}),
    )

    for manifest in (sequential, cube):
        assert manifest["status"] == "CHECKPOINT"
        assert manifest["counts"]["raw_sat_count"] == 1
        assert manifest["counts"]["classified_raw_sat_count"] == 1
        assert manifest["counts"]["dynamic_learned_core_count"] == 1
        assert (
            manifest["counts"]["dynamic_kalmanson_cap_order_nogood_count"]
            == 1
        )
    sequential_record = json.loads(
        (sequential_out / "learned-certificates.jsonl").read_text()
    )
    cube_record = json.loads(
        (cube_out / "learned-certificates.jsonl").read_text()
    )
    assert sequential_record == cube_record
    assert (
        sequential_out / "learned-certificates.jsonl"
    ).read_bytes() == (cube_out / "learned-certificates.jsonl").read_bytes()
    assert sequential_record["raw_sat_index"] == 0
    assert sequential_record["origin"] == cegar.KALMANSON_CAP_ORDER_ORIGIN
    assert sequential_record["stage"] == cegar.KALMANSON_CAP_ORDER_STAGE
    cube_results = [
        json.loads(line)
        for line in (
            cube_out / "cube-batches/batch-000000/results.jsonl"
        ).read_text().splitlines()
    ]
    committed = next(
        record for record in cube_results if record["disposition"] == "committed"
    )
    assert committed["classification"] == "learned-kalmanson-cap-order"
    assert committed["committed_record_sha256"] == sequential_record[
        "record_sha256"
    ]


def test_kalmanson_dynamic_origin_advances_learned_core_limit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original_detection = cegar._detection
    detection_calls = 0

    def kalmanson_after_smoke(rows):
        nonlocal detection_calls
        detection_calls += 1
        return original_detection(rows) if detection_calls == 1 else None

    monkeypatch.setattr(cegar, "_detection", kalmanson_after_smoke)
    monkeypatch.setattr(cegar, "_cap_order_certificate", lambda *_args: None)
    monkeypatch.setattr(
        cegar, "_rhombus_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    out = tmp_path / "kalmanson-learned-limit"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(_first_assignment()),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["raw_sat_count"] == 1
    assert result["counts"]["classified_raw_sat_count"] == 1
    assert result["counts"]["dynamic_learned_core_count"] == 1
    assert result["counts"]["dynamic_kalmanson_cap_order_nogood_count"] == 1


def test_one_dead_model_learns_replayed_clause_and_resumes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    out = tmp_path / "run"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        max_new_raw=1,
        solver_runner=_sat_runner(_first_assignment()),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["raw_sat_count"] == 1
    assert result["counts"]["classified_raw_sat_count"] == 1
    assert result["counts"]["dynamic_total_nogood_count"] == 1
    assert result["counts"]["dynamic_learned_core_count"] == 1
    assert result["counts"]["structural_survivor_count"] == 0
    record = json.loads((out / "learned-certificates.jsonl").read_text())
    assert record["origin"] == cegar.STRUCTURAL_PATH_ORIGIN
    assert cegar.certificates._validate_certificate(
        record["certificate"], n=10
    )

    original_count_cache = cegar._classification_count_cache
    replayed_counts: list[tuple[int, int]] = []

    def observe_replayed_count_cache(learned, survivors):
        counts = original_count_cache(learned, survivors)
        replayed_counts.append(counts)
        return counts

    monkeypatch.setattr(
        cegar, "_classification_count_cache", observe_replayed_count_cache
    )
    resumed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        resume=True,
        solver_runner=lambda *_args: pytest.fail("completed resume called solver"),
    )
    assert resumed == result
    assert replayed_counts == [(1, 1)]


@pytest.mark.parametrize("cached_counts", [(0, 1), (1, 0)])
def test_resume_rejects_cached_count_disagreement(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    cached_counts: tuple[int, int],
) -> None:
    out = tmp_path / "cached-count-disagreement"
    cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(_first_assignment()),
    )
    monkeypatch.setattr(
        cegar,
        "_classification_count_cache",
        lambda _learned, _survivors: cached_counts,
    )

    with pytest.raises(
        cegar.StructuralCegarError,
        match="full recount disagrees with cached classification counts",
    ):
        cegar.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=1,
            survivor_limit=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            resume=True,
            solver_runner=lambda *_args: pytest.fail(
                "failed resume called solver"
            ),
        )


def test_coordinator_rejects_commit_without_exactly_one_outcome(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        cegar,
        "_commit_sat_classification",
        lambda *_args, **_kwargs: {
            "classification": "invalid-no-outcome",
            "record_sha256": "0" * 64,
        },
    )
    out = tmp_path / "invalid-no-outcome"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(_first_assignment()),
    )

    assert result["status"] == "UNKNOWN"
    assert result["counts"]["raw_sat_count"] == 1
    assert result["counts"]["classified_raw_sat_count"] == 0
    assert result["counts"]["unclassified_raw_sat_count"] == 1
    assert "exactly one committed outcome" in result["diagnostic"]


def test_certificate_failure_stops_without_a_learned_clause(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original = cegar.certificates._validate_certificate
    calls = 0

    def fail_after_smoke(certificate, n=11):
        nonlocal calls
        calls += 1
        return original(certificate, n=n) if calls == 1 else False

    monkeypatch.setattr(
        cegar.certificates, "_validate_certificate", fail_after_smoke
    )
    out = tmp_path / "failed"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(_first_assignment()),
    )

    assert result["status"] == "UNKNOWN"
    assert result["counts"]["learned_core_count"] == 0
    assert result["counts"]["raw_sat_count"] == 1
    assert result["counts"]["classified_raw_sat_count"] == 0
    assert result["counts"]["unclassified_raw_sat_count"] == 1
    assert (out / "learned-certificates.jsonl").read_bytes() == b""
    failure = json.loads((out / "failure.json").read_text())
    assert failure["learned_clause_added"] is False
    assert failure["kind"] == "SAT_CERTIFICATE_FAILURE"
    assert failure["raw_sat_index"] == 0
    assert failure["detail"]["assignment_sha256"]
    assert failure["detail"]["metric_rows_sha256"]
    assert failure["detail"]["detection_stage"] == "equality-duplicate-center"
    assert result["failure"] == failure


def test_non_detected_assignment_is_only_structurally_unresolved(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original = cegar._detection
    calls = 0

    def none_after_smoke(rows):
        nonlocal calls
        calls += 1
        return original(rows) if calls == 1 else None

    monkeypatch.setattr(cegar, "_detection", none_after_smoke)
    monkeypatch.setattr(cegar, "_cap_order_certificate", lambda *_args: None)
    monkeypatch.setattr(
        cegar, "_rhombus_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_kalmanson_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    out = tmp_path / "survivor"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=1,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(_first_assignment()),
    )

    assert result["status"] == "SURVIVOR_LIMIT"
    assert result["counts"]["raw_sat_count"] == 1
    assert result["counts"]["classified_raw_sat_count"] == 1
    assert result["counts"]["dynamic_total_nogood_count"] == 0
    assert result["counts"]["structural_survivor_count"] == 1
    survivor = json.loads((out / "survivors.jsonl").read_text())
    assert survivor["classification"] == "STRUCTURALLY_UNRESOLVED"
    assert "not Euclidean or P97-realizable" in survivor["trust"]


def test_unknown_and_terminal_drat_are_fail_closed(
    tmp_path: Path,
) -> None:
    unknown_out = tmp_path / "unknown"
    unknown = cegar.run_driver(
        unknown_out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=lambda *_args: cegar.sat.SolverResult(
            "UNKNOWN", {}, 0, "", "timeout"
        ),
    )
    assert unknown["status"] == "UNKNOWN"
    assert unknown["counts"]["learned_core_count"] == 0
    assert json.loads((unknown_out / "failure.json").read_text())[
        "learned_clause_added"
    ] is False

    terminal_out = tmp_path / "terminal"

    def unsat(_cnf: Path, _timeout: int, proof: Path | None):
        assert proof is not None
        proof.write_bytes(b"0\n")
        return cegar.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    verified = cegar.run_driver(
        terminal_out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=unsat,
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )
    assert verified["status"] == "STRUCTURAL_UNSAT_VERIFIED"
    assert "shard" not in verified["configuration"]
    assert verified["terminal_drat_verified"] is True
    assert verified["artifact_hashes"]["terminal.cnf"]
    assert verified["artifact_hashes"]["terminal.drat"]
    assert verified["artifact_hashes"]["terminal.drat.check"]


def test_algebraic_templates_replay_with_exact_sparse_projection() -> None:
    templates, summary = cegar._load_algebraic_templates(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP
    )
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)

    assert [template["name"] for template in templates] == [
        "system-00-48c65d6d0dda",
        "system-01-208c2305f405",
    ]
    assert [
        template["algebraic_replay"]["nonzero_cofactor_count"]
        for template in templates
    ] == [26, 17]
    assert [
        len(template["antecedent_memberships"]) for template in templates
    ] == [36, 25]
    assert templates[1]["algebraic_replay"]["used_row_indices"] == [
        0,
        1,
        3,
        4,
        5,
        7,
        8,
        9,
    ]
    assert cegar._clause_for_memberships(
        encoding,
        tuple(map(tuple, templates[0]["antecedent_memberships"])),
    ) == (
        -1,
        -6,
        -7,
        -9,
        -10,
        -12,
        -13,
        -15,
        -19,
        -20,
        -23,
        -25,
        -31,
        -34,
        -36,
        -38,
        -41,
        -44,
        -46,
        -51,
        -54,
        -57,
        -58,
        -60,
        -62,
        -65,
        -66,
        -68,
        -70,
        -75,
        -77,
        -80,
        -85,
        -88,
        -89,
        -90,
    )
    assert cegar._clause_for_memberships(
        encoding,
        tuple(map(tuple, templates[1]["antecedent_memberships"])),
    ) == (
        -1,
        -4,
        -7,
        -8,
        -10,
        -13,
        -14,
        -28,
        -35,
        -36,
        -39,
        -43,
        -44,
        -45,
        -46,
        -54,
        -65,
        -67,
        -72,
        -74,
        -76,
        -77,
        -83,
        -87,
        -90,
    )
    for template in templates:
        certificate = template["algebraic_certificate"]
        payload = dict(certificate)
        claimed = payload.pop("certificate_payload_sha256")
        assert _artifact_hash(payload) == claimed
        assert _artifact_hash(
            [entry["cofactor"] for entry in certificate["entries"]]
        ) == certificate["cofactor_stream_sha256"]
    assert "P97 Euclidean/distinct-point nogoods" in summary["semantics"]
    assert summary["lean_kernel_checked"] is False


def test_new_algebraic_bank_replays_only_three_unit_targets() -> None:
    templates, summary = cegar._load_algebraic_templates(
        cegar.NEW_ALGEBRAIC_BOOTSTRAP
    )

    assert [template["name"] for template in templates] == [
        "system-00-398b59017a31",
        "system-02-b66cc99cc9ed",
        "system-03-540659aed8ba",
    ]
    assert [
        (
            template["algebraic_replay"]["nonzero_cofactor_count"],
            template["algebraic_replay"]["antecedent_literal_count"],
            template["algebraic_replay"]["used_row_indices"],
        )
        for template in templates
    ] == [
        (18, 27, [0, 1, 2, 3, 4, 5, 7, 8, 9]),
        (9, 15, [0, 1, 2, 3, 4, 7]),
        (10, 16, [0, 1, 3, 5, 8, 9]),
    ]
    assert summary["certificate_count"] == 3
    assert len(summary["banks"]) == 1
    assert summary["banks"][0]["source_audit"]["system_count"] == 3
    assert all(
        system["name"] != "system-01-d6db6d91d18e"
        for system in summary["systems"]
    )


def test_default_algebraic_banks_aggregate_old_first_without_duplicates() -> None:
    templates, summary = cegar._load_algebraic_templates(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAPS
    )

    assert [template["name"] for template in templates] == [
        "system-00-48c65d6d0dda",
        "system-01-208c2305f405",
        "system-00-398b59017a31",
        "system-02-b66cc99cc9ed",
        "system-03-540659aed8ba",
        "system-01-d6db6d91d18e-real-distinctness",
        "system-00-851c782cb69c-equilateral-shell-real-distinctness",
    ]
    assert summary["certificate_count"] == 7
    assert [bank["certificate_count"] for bank in summary["banks"]] == [
        2,
        3,
        1,
        1,
    ]
    assert summary["certificate_kind_histogram"] == {
        cegar.EQUILATERAL_SHELL_CONTRADICTION_KIND: 1,
        cegar.REAL_DISTINCTNESS_CONTRADICTION_KIND: 1,
        cegar.UNIT_CONTRADICTION_KIND: 5,
    }
    assert len(set(summary["template_sha256"])) == 7
    with pytest.raises(
        cegar.StructuralCegarError,
        match="cross-bank duplicate algebraic target name",
    ):
        cegar._load_algebraic_templates(
            [
                cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
                cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
            ]
        )


def test_real_distinctness_certificate_replays_exact_sparse_projection() -> None:
    templates, summary = cegar._load_algebraic_templates(
        cegar.REAL_DISTINCTNESS_BOOTSTRAP
    )

    assert len(templates) == 1
    template = templates[0]
    replay = template["algebraic_replay"]
    assert template["certificate_kind"] == (
        cegar.REAL_DISTINCTNESS_CONTRADICTION_KIND
    )
    assert template["origin"] == cegar.REAL_DISTINCTNESS_ORIGIN
    assert template["stage"] == cegar.REAL_DISTINCTNESS_STAGE
    assert replay["target"] == "x9x^2+x9y^2"
    assert replay["nonzero_cofactor_indices"] == list(
        cegar.REAL_DISTINCTNESS_NONZERO_INDICES
    )
    assert replay["nonzero_cofactor_count"] == 16
    assert replay["used_row_indices"] == [2, 3, 4, 5, 7, 8, 9]
    assert replay["antecedent_literal_count"] == 23
    assert replay["coordinate_gauge"] == {
        "0": ["0", "0"],
        "1": ["1", "0"],
    }
    assert replay["inequalities_used"] is False
    assert replay["external_hypothesis"] == "P97 point pairwise-distinctness"
    assert summary["certificate_kind_histogram"] == {
        cegar.REAL_DISTINCTNESS_CONTRADICTION_KIND: 1
    }
    assert cegar.UNIT_CONTRADICTION_KIND not in (
        summary["certificate_kind_histogram"]
    )


def test_real_distinctness_target_cofactor_and_source_tampering_fail_closed() -> None:
    templates, _summary = cegar._load_algebraic_templates(
        cegar.REAL_DISTINCTNESS_BOOTSTRAP
    )
    template = templates[0]

    target_tamper = copy.deepcopy(template["algebraic_certificate"])
    target_tamper["target"] = "1"
    with pytest.raises(cegar.StructuralCegarError, match="invalid 'target'"):
        cegar._replay_real_distinctness_certificate(
            target_tamper, template["algebraic_system"]
        )

    cofactor_tamper = copy.deepcopy(template["algebraic_certificate"])
    cofactor_tamper["entries"][6]["cofactor"] += "+1"
    with pytest.raises(
        cegar.StructuralCegarError,
        match="did not obtain the pinned target",
    ):
        cegar._replay_real_distinctness_certificate(
            cofactor_tamper, template["algebraic_system"]
        )

    source_tamper = copy.deepcopy(template["algebraic_system"])
    source_tamper["survivor_count"] += 1
    with pytest.raises(
        cegar.StructuralCegarError,
        match="source system/hash/gauge invariant mismatch",
    ):
        cegar._replay_real_distinctness_certificate(
            template["algebraic_certificate"], source_tamper
        )


def test_equilateral_shell_bank_replays_typed_exact_real_obstruction() -> None:
    templates, summary = cegar._load_algebraic_templates(
        cegar.EQUILATERAL_SHELL_BOOTSTRAP
    )

    assert len(templates) == 1
    template = templates[0]
    replay = template["algebraic_replay"]
    assert template["certificate_kind"] == (
        cegar.EQUILATERAL_SHELL_CONTRADICTION_KIND
    )
    assert template["certificate_kind"] != cegar.UNIT_CONTRADICTION_KIND
    assert template["origin"] == cegar.EQUILATERAL_SHELL_ORIGIN
    assert template["stage"] == cegar.EQUILATERAL_SHELL_STAGE
    assert len(template["antecedent_memberships"]) == 26
    assert replay["full_gauged_qq_ideal_classification"] == "NONUNIT"
    assert replay["real_distinct_realizability"] == "EXACTLY_REFUTED"
    assert replay["orientation_branch_count"] == 32
    assert replay["unit_branch_count"] == 32
    assert replay["explicit_identity_count"] == 32
    assert replay["identity_replayed"] is True
    assert replay["minimum_center_vertex_cover_size"] == 7
    assert replay["incidence_tree_lower_bound"] == 26
    assert replay["strict_convexity_used"] is False
    assert summary["certificate_kind_histogram"] == {
        cegar.EQUILATERAL_SHELL_CONTRADICTION_KIND: 1
    }
    assert "full gauged QQ equality ideal is NONUNIT" in (
        summary["banks"][0]["semantics"]
    )
    assert summary["lean_kernel_checked"] is False


def test_equilateral_shell_match_is_relabeling_invariant_and_has_near_miss() -> None:
    templates, _summary = cegar._load_algebraic_templates(
        cegar.EQUILATERAL_SHELL_BOOTSTRAP
    )
    template = templates[0]
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    relabeling = (3, 8, 1, 9, 0, 7, 2, 6, 4, 5)
    required = set(cegar._mapped_memberships(template, relabeling))
    match = cegar._find_algebraic_match(
        encoding, _s_assignment(encoding, required), templates
    )
    assert match is not None
    assert set(match[2]) <= required

    reciprocal_shell = {
        directed
        for left, right in cegar.EQUILATERAL_SHELL_EDGES
        for directed in ((left, right), (right, left))
    }
    missing_left, missing_right = cegar.EQUILATERAL_SHELL_EDGES[0]
    reciprocal_shell -= {
        (missing_left, missing_right),
        (missing_right, missing_left),
    }
    assert (
        cegar._find_algebraic_match(
            encoding,
            _s_assignment(encoding, reciprocal_shell),
            templates,
        )
        is None
    )


def test_equilateral_shell_identity_and_saved_hash_tampering_fail_closed(
    tmp_path: Path,
) -> None:
    certificate = json.loads(
        (
            cegar.EQUILATERAL_SHELL_BOOTSTRAP
            / "equilateral-branches/mmmmm-certificate.json"
        ).read_text()
    )
    coefficients = list(certificate["coefficients"])
    coefficients[0] += "+1"
    assert not cegar._replay_equilateral_shell_identity(
        tuple(certificate["generators"]), tuple(coefficients)
    )

    copied = tmp_path / "equilateral-shell-artifacts"
    shutil.copytree(cegar.EQUILATERAL_SHELL_BOOTSTRAP, copied)
    artifact = copied / "equilateral-branches/mmmmm-certificate.json"
    artifact.write_bytes(artifact.read_bytes() + b" ")
    with pytest.raises(
        cegar.StructuralCegarError, match="saved artifact hash mismatch"
    ):
        cegar._load_algebraic_templates(copied)


def test_equilateral_shell_nogood_serializes_and_replays_on_resume(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    encoding, assignment = _equilateral_shell_assignment()
    # The saved shell witness is now also caught by the earlier shared-pair
    # detector.  Isolate the algebraic path whose serialization this test owns.
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    out = tmp_path / "equilateral-shell-run"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.EQUILATERAL_SHELL_BOOTSTRAP,
        projected_static_v2=True,
        solver_runner=_sat_runner(assignment),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["dynamic_equilateral_shell_nogood_count"] == 1
    assert result["counts"]["dynamic_real_distinctness_nogood_count"] == 1
    assert result["counts"]["dynamic_algebraic_nogood_count"] == 0
    assert result["counts"]["dynamic_certificate_kind_histogram"] == {
        cegar.EQUILATERAL_SHELL_CONTRADICTION_KIND: 1
    }
    record = json.loads((out / "learned-certificates.jsonl").read_text())
    assert record["origin"] == cegar.EQUILATERAL_SHELL_ORIGIN
    assert record["stage"] == cegar.EQUILATERAL_SHELL_STAGE
    assert record["certificate_kind"] == (
        cegar.EQUILATERAL_SHELL_CONTRADICTION_KIND
    )
    assert len(record["antecedent_memberships"]) == 26
    assert len(record["clause"]) == 26

    resumed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.EQUILATERAL_SHELL_BOOTSTRAP,
        projected_static_v2=True,
        resume=True,
        solver_runner=lambda *_args: pytest.fail("completed resume called solver"),
    )
    assert resumed == result
    assert encoding.projected_static is True


@pytest.mark.parametrize(
    ("filename", "message"),
    [
        ("certificate.json", "certificate hash mismatch"),
        ("manifest.json", "manifest hash mismatch"),
    ],
)
def test_real_distinctness_saved_artifact_tampering_fails_closed(
    tmp_path: Path,
    filename: str,
    message: str,
) -> None:
    copied = tmp_path / "real-distinctness-artifact"
    shutil.copytree(cegar.REAL_DISTINCTNESS_BOOTSTRAP, copied)
    artifact = copied / filename
    artifact.write_bytes(artifact.read_bytes() + b" ")

    with pytest.raises(cegar.StructuralCegarError, match=message):
        cegar._load_algebraic_templates(copied)


def test_algebraic_banks_reject_cross_bank_duplicate_template_hash(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls = iter(
        [
            (
                [
                    {
                        "name": "first",
                        "template_sha256": "a" * 64,
                        "certificate_kind": cegar.UNIT_CONTRADICTION_KIND,
                    }
                ],
                {},
            ),
            (
                [
                    {
                        "name": "second",
                        "template_sha256": "a" * 64,
                        "certificate_kind": cegar.UNIT_CONTRADICTION_KIND,
                    }
                ],
                {},
            ),
        ]
    )
    monkeypatch.setattr(
        cegar, "_load_algebraic_template_bank", lambda _directory: next(calls)
    )

    with pytest.raises(
        cegar.StructuralCegarError,
        match="cross-bank duplicate algebraic template hash",
    ):
        cegar._load_algebraic_templates([Path("first"), Path("second")])


def test_algebraic_matching_is_relabeling_invariant_and_noninduced() -> None:
    templates, _summary = cegar._load_algebraic_templates(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP
    )
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    template = templates[1]
    relabeling = (3, 8, 1, 9, 0, 7, 2, 6, 4, 5)
    required = set(
        cegar._mapped_memberships(template, relabeling)
    )
    extra = next(
        (center, point)
        for center in range(cegar.CELL.n)
        for point in range(cegar.CELL.n)
        if center != point and (center, point) not in required
    )
    assignment = _s_assignment(encoding, required | {extra})

    first = cegar._find_template_permutation(encoding, assignment, template)
    second = cegar._find_template_permutation(encoding, assignment, template)

    assert first is not None
    assert first == second
    mapped = cegar._mapped_memberships(template, first)
    assert set(mapped) <= required | {extra}
    clause = cegar._clause_for_memberships(encoding, mapped, assignment)
    assert len(clause) == 25
    assert all(assignment[-literal] for literal in clause)
    assert (
        cegar._find_template_permutation(
            encoding, _s_assignment(encoding, set()), template
        )
        is None
    )


def test_algebraic_certificate_mapping_and_gauge_tampering_fail_closed() -> None:
    templates, _summary = cegar._load_algebraic_templates(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP
    )
    template = templates[0]

    mapping_tamper = copy.deepcopy(template["algebraic_certificate"])
    mapping_tamper["entries"][0]["target"] = 8
    _rehash_certificate(mapping_tamper)
    with pytest.raises(cegar.StructuralCegarError, match="mapping mismatch"):
        cegar._replay_algebraic_certificate(
            mapping_tamper, template["algebraic_system"]
        )

    gauge_tamper = copy.deepcopy(template["algebraic_system"])
    gauge_tamper["coordinate_gauge"]["x1"] = "2"
    with pytest.raises(cegar.StructuralCegarError, match="coordinate_gauge"):
        cegar._replay_algebraic_certificate(
            template["algebraic_certificate"], gauge_tamper
        )


def test_algebraic_saved_artifact_tampering_fails_closed(
    tmp_path: Path,
) -> None:
    copied = tmp_path / "algebraic-artifacts"
    shutil.copytree(cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP, copied)
    certificate = (
        copied / "system-00-48c65d6d0dda" / "certificate.json"
    )
    certificate.write_bytes(certificate.read_bytes() + b" ")

    with pytest.raises(
        cegar.StructuralCegarError, match="saved artifact hash mismatch"
    ):
        cegar._load_algebraic_templates(copied)


def test_new_algebraic_bank_saved_artifact_tampering_fails_closed(
    tmp_path: Path,
) -> None:
    copied = tmp_path / "new-algebraic-artifacts"
    shutil.copytree(cegar.NEW_ALGEBRAIC_BOOTSTRAP, copied)
    certificate = (
        copied / "system-02-b66cc99cc9ed" / "certificate.json"
    )
    certificate.write_bytes(certificate.read_bytes() + b" ")

    with pytest.raises(
        cegar.StructuralCegarError, match="saved artifact hash mismatch"
    ):
        cegar._load_algebraic_templates(copied)


def test_algebraic_bootstrap_cli_is_repeatable_and_no_bootstrap_is_empty() -> None:
    args = cegar._parse_args(
        [
            "--algebraic-bootstrap",
            str(cegar.NEW_ALGEBRAIC_BOOTSTRAP),
            "--algebraic-bootstrap",
            str(cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP),
        ]
    )
    assert args.algebraic_bootstrap == [
        cegar.NEW_ALGEBRAIC_BOOTSTRAP,
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
    ]
    assert cegar._algebraic_directories(()) == ()


def test_relabeling_aware_algebraic_nogood_is_replayed_on_resume(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        cegar, "_kalmanson_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    source_record = json.loads(ALGEBRAIC_SURVIVORS.read_text().splitlines()[0])
    assignment = encoding.assignment_from_record(source_record)
    assert cegar._detection(cegar._metric_rows(encoding.decode(assignment))) is None

    out = tmp_path / "algebraic-run"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
        solver_runner=_sat_runner(assignment),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["dynamic_algebraic_nogood_count"] == 1
    assert result["counts"]["dynamic_learned_core_count"] == 0
    assert result["counts"]["structural_survivor_count"] == 0
    record = json.loads((out / "learned-certificates.jsonl").read_text())
    assert record["origin"] == cegar.ALGEBRAIC_ORIGIN
    assert record["stage"] == cegar.ALGEBRAIC_STAGE
    assert len(record["antecedent_memberships"]) == 36
    assert len(record["clause"]) == 36
    assert sorted(record["permutation"]) == list(range(cegar.CELL.n))

    resumed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
        resume=True,
        solver_runner=lambda *_args: pytest.fail("completed resume called solver"),
    )
    assert resumed == result


def test_real_distinctness_nogood_serializes_and_replays_on_resume(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        cegar, "_kalmanson_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    source_record = json.loads(
        REAL_DISTINCTNESS_SURVIVORS.read_text().splitlines()[0]
    )
    assert source_record["metric_rows_sha256"] == (
        cegar.REAL_DISTINCTNESS_ROWS_SHA256
    )
    assignment = encoding.assignment_from_record(source_record)
    assert cegar._detection(cegar._metric_rows(encoding.decode(assignment))) is None

    out = tmp_path / "real-distinctness-run"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.REAL_DISTINCTNESS_BOOTSTRAP,
        solver_runner=_sat_runner(assignment),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["dynamic_real_distinctness_nogood_count"] == 1
    assert result["counts"]["dynamic_algebraic_nogood_count"] == 0
    assert result["counts"]["dynamic_certificate_kind_histogram"] == {
        cegar.REAL_DISTINCTNESS_CONTRADICTION_KIND: 1
    }
    record = json.loads((out / "learned-certificates.jsonl").read_text())
    assert record["origin"] == cegar.REAL_DISTINCTNESS_ORIGIN
    assert record["stage"] == cegar.REAL_DISTINCTNESS_STAGE
    assert record["certificate_kind"] == (
        cegar.REAL_DISTINCTNESS_CONTRADICTION_KIND
    )
    assert len(record["antecedent_memberships"]) == 23
    assert len(record["clause"]) == 23

    resumed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.REAL_DISTINCTNESS_BOOTSTRAP,
        resume=True,
        solver_runner=lambda *_args: pytest.fail("completed resume called solver"),
    )
    assert resumed == result

    templates, _summary = cegar._load_algebraic_templates(
        cegar.REAL_DISTINCTNESS_BOOTSTRAP
    )
    for name, field, value, message in (
        ("template", "algebraic_template_sha256", "0" * 64, "template hash"),
        (
            "kind",
            "certificate_kind",
            cegar.UNIT_CONTRADICTION_KIND,
            "typed algebraic learned metadata mismatch",
        ),
    ):
        unsigned = copy.deepcopy(record)
        unsigned.pop("record_sha256")
        unsigned.pop("previous_record_sha256")
        unsigned[field] = value
        tampered = cegar._with_record_hash(unsigned, None)
        tampered_path = tmp_path / f"real-distinctness-{name}.jsonl"
        tampered_path.write_text(json.dumps(tampered) + "\n")
        with pytest.raises(cegar.StructuralCegarError, match=message):
            cegar._load_learned(tampered_path, encoding, templates)


def test_algebraic_learned_metadata_tampering_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        cegar, "_kalmanson_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    source_record = json.loads(ALGEBRAIC_SURVIVORS.read_text().splitlines()[0])
    assignment = encoding.assignment_from_record(source_record)
    out = tmp_path / "source-run"
    cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
        solver_runner=_sat_runner(assignment),
    )
    valid = json.loads((out / "learned-certificates.jsonl").read_text())
    templates, _summary = cegar._load_algebraic_templates(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP
    )

    def rejected(
        name: str,
        mutate,
        message: str,
    ) -> None:
        unsigned = copy.deepcopy(valid)
        unsigned.pop("record_sha256")
        unsigned.pop("previous_record_sha256")
        mutate(unsigned)
        tampered = cegar._with_record_hash(unsigned, None)
        path = tmp_path / f"{name}.jsonl"
        path.write_text(json.dumps(tampered) + "\n")
        with pytest.raises(cegar.StructuralCegarError, match=message):
            cegar._load_learned(path, encoding, templates)

    rejected(
        "template",
        lambda record: record.__setitem__(
            "algebraic_template_sha256", "0" * 64
        ),
        "template hash",
    )
    rejected(
        "permutation",
        lambda record: record["permutation"].__setitem__(
            0, record["permutation"][1]
        ),
        "Fin10 bijection",
    )
    rejected(
        "clause",
        lambda record: record["clause"].__setitem__(
            0, record["clause"][0] - 1
        ),
        "clause mismatch",
    )


def test_algebraic_cut_terminal_status_remains_p97_conditional(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        cegar, "_kalmanson_cap_order_certificate", lambda *_args: None
    )
    monkeypatch.setattr(
        cegar, "_shared_pair_separation_certificate", lambda *_args: None
    )
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    source_record = json.loads(ALGEBRAIC_SURVIVORS.read_text().splitlines()[0])
    assignment = encoding.assignment_from_record(source_record)
    calls = 0

    def sat_then_unsat(_cnf: Path, _timeout: int, proof: Path | None):
        nonlocal calls
        calls += 1
        if calls == 1:
            return cegar.sat.SolverResult(
                "SAT", assignment, 10, "s SATISFIABLE\n", ""
            )
        assert proof is not None
        proof.write_bytes(b"0\n")
        return cegar.sat.SolverResult(
            "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
        )

    result = cegar.run_driver(
        tmp_path / "terminal",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
        solver_runner=sat_then_unsat,
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )

    assert result["status"] == "P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
    assert result["terminal_drat_verified"] is True
    assert "conditional on the P97 Euclidean" in result["result_claim"]
    assert "not Lean-kernel closure" in result["result_claim"]
    assert "P0 != P1" in result["trust_boundary"]["algebraic"]

    calls = 0
    shard_index = 1 if assignment[encoding.var("b", 0, 1)] else 0
    shard_result = cegar.run_driver(
        tmp_path / "shard-terminal",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        shard_depth=1,
        shard_index=shard_index,
        bootstrap_results=None,
        algebraic_bootstrap=cegar.DEFAULT_ALGEBRAIC_BOOTSTRAP,
        solver_runner=sat_then_unsat,
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )
    assert shard_result["status"] == (
        "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
    )
    assert "shard-local" in shard_result["result_claim"]


def test_cube_partition_is_exact_stable_and_default_remains_sequential() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)

    assert cegar._cube_partition(encoding, 3) == (
        (-91, -92, -93),
        (-91, -92, 93),
        (-91, 92, -93),
        (-91, 92, 93),
        (91, -92, -93),
        (91, -92, 93),
        (91, 92, -93),
        (91, 92, 93),
    )
    assert [
        name
        for name, _variable, _key in cegar._stable_semantic_variables(
            encoding, 3
        )
    ] == ["b[0,1]", "b[0,2]", "b[0,3]"]
    args = cegar._parse_args([])
    assert args.parallel_mode == "sequential"
    assert args.cube_depth == 4
    assert args.cube_artifact_mode == "full"


def test_cube_common_clause_body_is_byte_identical_to_legacy_rendering() -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    extra_clauses = [(1, -2, 3), (-4,), (5, 6)]
    body, count = cegar._cube_common_clause_body(encoding, extra_clauses)

    for cube in (
        cegar._cube_partition(encoding, 3)[0],
        cegar._cube_partition(encoding, 3)[-1],
    ):
        chunks = cegar._cube_cnf_chunks(encoding, body, count, cube)
        clauses = [
            *encoding.clauses,
            *extra_clauses,
            *((literal,) for literal in cube),
        ]
        legacy_lines = [
            f"c {cegar.sat.SPEC_VERSION} mode={encoding.mode}",
            f"p cnf {encoding.num_vars} {len(clauses)}",
        ]
        legacy_lines.extend(
            " ".join(str(literal) for literal in clause) + " 0"
            for clause in clauses
        )
        expected = ("\n".join(legacy_lines) + "\n").encode("ascii")
        assert encoding.cnf_bytes(
            [*extra_clauses, *((literal,) for literal in cube)]
        ) == expected
        assert b"".join(chunks) == expected
        assert cegar._sha256_chunks(chunks) == hashlib.sha256(
            expected
        ).hexdigest()


def test_cube_batch_commits_in_cube_order_and_rejects_stale_sat(
    tmp_path: Path,
) -> None:
    out = tmp_path / "cube-stale"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        workers=4,
        parallel_mode="cube-batch",
        cube_depth=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_cube_runner(
            {1: _alternate_blocker_assignment(), 2: _first_assignment()},
            {1: 0.02, 2: 0.0},
        ),
    )

    assert result["status"] == "LEARNED_CORE_LIMIT"
    assert result["counts"]["cube_batch_count"] == 1
    assert result["counts"]["cube_committed_result_count"] == 1
    assert result["counts"]["cube_stale_result_count"] == 1
    assert result["counts"]["dynamic_learned_core_count"] == 1
    records = [
        json.loads(line)
        for line in (
            out / "cube-batches/batch-000000/results.jsonl"
        ).read_text().splitlines()
    ]
    assert [record["disposition"] for record in records] == [
        "cube-unsat-unverified",
        "committed",
        "stale-current-antichain",
        "unprocessed-after-limit",
    ]
    assert records[2]["stale_recheck"]["kind"] == (
        "current-learned-clause"
    )
    committed_record_sha256 = json.loads(
        (out / "learned-certificates.jsonl").read_text()
    )["record_sha256"]
    assert records[1]["committed_record_sha256"] == committed_record_sha256
    assert (
        records[2]["stale_recheck"]["record_sha256"]
        == committed_record_sha256
    )
    replayed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=2,
        workers=4,
        parallel_mode="cube-batch",
        cube_depth=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        resume=True,
        solver_runner=_cube_runner({}),
    )
    assert replayed == result


def test_stale_sat_recheck_scans_only_post_snapshot_suffix(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    assignment = _first_assignment()
    variable = next(
        variable for variable, value in assignment.items() if value
    )
    pre_snapshot_clause = (variable,)
    post_snapshot_clause = (-variable,)

    def record(clause: tuple[int, ...], digest: str) -> dict[str, object]:
        return {
            "clause": list(clause),
            "origin": "solver",
            "record_sha256": digest,
            "clause_sha256": cegar._sha256_value(list(clause)),
        }

    pre_snapshot = record(pre_snapshot_clause, "pre-snapshot")
    post_snapshot = record(post_snapshot_clause, "post-snapshot")
    checked: list[tuple[int, ...]] = []
    original = cegar._clause_satisfied

    def counted_clause_satisfied(
        clause: tuple[int, ...], current: dict[int, bool]
    ) -> bool:
        checked.append(clause)
        return original(clause, current)

    monkeypatch.setattr(cegar, "_clause_satisfied", counted_clause_satisfied)

    assert (
        cegar._stale_sat_recheck(
            encoding,
            assignment,
            learned=[pre_snapshot],
            survivor_clauses=[],
            learned_snapshot_count=1,
            survivor_snapshot_count=0,
        )
        is None
    )
    assert checked == []

    stale = cegar._stale_sat_recheck(
        encoding,
        assignment,
        learned=[pre_snapshot, post_snapshot],
        survivor_clauses=[],
        learned_snapshot_count=1,
        survivor_snapshot_count=0,
    )
    assert checked == [post_snapshot_clause]
    assert stale == {
        "kind": "current-learned-clause",
        "origin": "solver",
        "record_sha256": "post-snapshot",
        "clause_sha256": post_snapshot["clause_sha256"],
    }


@pytest.mark.parametrize("tamper", ["count", "head"])
def test_live_cube_batch_rejects_snapshot_metadata_tampering(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    tamper: str,
) -> None:
    original = cegar._launch_cube_batch

    def tampered_launch(*args, **kwargs):
        plan, directory, jobs = original(*args, **kwargs)
        plan = copy.deepcopy(plan)
        if tamper == "count":
            plan["snapshot"]["learned_count"] += 1
        else:
            plan["snapshot"]["learned_head_sha256"] = "0" * 64
        unsigned = dict(plan)
        unsigned.pop("plan_sha256")
        plan["plan_sha256"] = cegar._sha256_value(unsigned)
        return plan, directory, jobs

    monkeypatch.setattr(cegar, "_launch_cube_batch", tampered_launch)
    with pytest.raises(
        cegar.StructuralCegarError,
        match="live cube plan learned snapshot mismatch",
    ):
        cegar.run_driver(
            tmp_path / f"cube-snapshot-{tamper}",
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            workers=2,
            parallel_mode="cube-batch",
            cube_depth=1,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            solver_runner=_cube_runner({}),
        )


def test_compact_cube_batch_discards_regenerable_files_and_replays(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    out = tmp_path / "cube-compact"
    original = cegar._cube_common_clause_body
    common_body_calls = 0

    def counted_common_body(*args, **kwargs):
        nonlocal common_body_calls
        common_body_calls += 1
        return original(*args, **kwargs)

    monkeypatch.setattr(cegar, "_cube_common_clause_body", counted_common_body)

    def unsat_with_unverified_proof(
        _cnf: Path, _timeout: int, proof: Path | None
    ):
        assert proof is not None
        proof.write_bytes(b"unverified local cube proof")
        return cegar.sat.SolverResult(
            "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
        )

    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        workers=2,
        parallel_mode="cube-batch",
        cube_depth=2,
        cube_artifact_mode="compact",
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=unsat_with_unverified_proof,
    )

    assert result["status"] == "CUBE_BATCH_NO_SAT_CHECKPOINT"
    assert result["configuration"]["parallel"]["artifact_mode"] == "compact"
    assert common_body_calls == 1
    directory = out / "cube-batches/batch-000000"
    assert {item.name for item in directory.iterdir()} == {
        "plan.json",
        "results.jsonl",
    }
    batch = json.loads((out / "cube-batches.jsonl").read_text())
    assert batch["cube_artifact_mode"] == "compact"
    records = [
        json.loads(line)
        for line in (directory / "results.jsonl").read_text().splitlines()
    ]
    assert all(record["cube_artifact_mode"] == "compact" for record in records)
    assert all(record["proof"] is None for record in records)

    common_body_calls = 0
    replayed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        workers=2,
        parallel_mode="cube-batch",
        cube_depth=2,
        cube_artifact_mode="compact",
        bootstrap_results=None,
        algebraic_bootstrap=None,
        resume=True,
        solver_runner=_cube_runner({}),
    )
    assert replayed == result
    assert common_body_calls == 1
    (directory / "cube-000000.drat").write_bytes(b"unexpected")
    with pytest.raises(
        cegar.StructuralCegarError, match="cube artifact journal mismatch"
    ):
        cegar.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            workers=2,
            parallel_mode="cube-batch",
            cube_depth=2,
            cube_artifact_mode="compact",
            bootstrap_results=None,
            algebraic_bootstrap=None,
            resume=True,
            solver_runner=_cube_runner({}),
        )
    (directory / "cube-000000.drat").unlink()
    with pytest.raises(
        cegar.StructuralCegarError,
        match="resume configuration/dependency mismatch",
    ):
        cegar.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            workers=2,
            parallel_mode="cube-batch",
            cube_depth=2,
            cube_artifact_mode="full",
            bootstrap_results=None,
            algebraic_bootstrap=None,
            resume=True,
            solver_runner=_cube_runner({}),
        )


def test_compact_cube_batch_rejects_rehashed_cnf_digest_tampering(
    tmp_path: Path,
) -> None:
    out = tmp_path / "cube-compact-tamper"
    cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        workers=2,
        parallel_mode="cube-batch",
        cube_depth=2,
        cube_artifact_mode="compact",
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_cube_runner({}),
    )

    results_path = out / "cube-batches/batch-000000/results.jsonl"
    results = [
        json.loads(line) for line in results_path.read_text().splitlines()
    ]
    results[0]["cnf_sha256"] = "0" * 64
    previous = None
    for index, result in enumerate(results):
        unsigned = dict(result)
        unsigned.pop("record_sha256")
        unsigned.pop("previous_record_sha256")
        results[index] = cegar._with_record_hash(unsigned, previous)
        previous = results[index]["record_sha256"]
    results_path.write_bytes(
        b"".join(cegar._canonical_bytes(record) + b"\n" for record in results)
    )

    batches_path = out / "cube-batches.jsonl"
    batch = json.loads(batches_path.read_text())
    unsigned_batch = dict(batch)
    unsigned_batch.pop("record_sha256")
    unsigned_batch.pop("previous_record_sha256")
    unsigned_batch["results_sha256"] = cegar._sha256_file(results_path)
    unsigned_batch["result_chain_head_sha256"] = results[-1]["record_sha256"]
    batch = cegar._with_record_hash(unsigned_batch, None)
    batches_path.write_bytes(cegar._canonical_bytes(batch) + b"\n")

    manifest_path = out / "manifest.json"
    manifest = json.loads(manifest_path.read_text())
    manifest["artifact_hashes"]["cube-batches.jsonl"] = cegar._sha256_file(
        batches_path
    )
    manifest.pop("manifest_sha256")
    manifest["manifest_sha256"] = cegar._sha256_value(manifest)
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    with pytest.raises(cegar.StructuralCegarError, match="cube CNF replay mismatch"):
        cegar.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            workers=2,
            parallel_mode="cube-batch",
            cube_depth=2,
            cube_artifact_mode="compact",
            bootstrap_results=None,
            algebraic_bootstrap=None,
            resume=True,
            solver_runner=_cube_runner({}),
        )


@pytest.mark.parametrize("cube_artifact_mode", ["full", "compact"])
def test_cube_batch_artifacts_ignore_worker_completion_order(
    tmp_path: Path,
    cube_artifact_mode: str,
) -> None:
    assignments = {1: _alternate_blocker_assignment(), 2: _first_assignment()}
    outputs: list[Path] = []
    for name, delays in (
        ("slow-low", {1: 0.02, 2: 0.0}),
        ("slow-high", {1: 0.0, 2: 0.02}),
    ):
        out = tmp_path / name
        outputs.append(out)
        result = cegar.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=1,
            survivor_limit=2,
            workers=4,
            parallel_mode="cube-batch",
            cube_depth=2,
            cube_artifact_mode=cube_artifact_mode,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            solver_runner=_cube_runner(assignments, delays),
        )
        assert result["status"] == "LEARNED_CORE_LIMIT"

    assert _directory_bytes(outputs[0]) == _directory_bytes(outputs[1])


def test_all_unsat_cube_batch_is_a_replayable_nonterminal_checkpoint(
    tmp_path: Path,
) -> None:
    out = tmp_path / "cube-all-unsat"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        workers=2,
        parallel_mode="cube-batch",
        cube_depth=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_cube_runner({}),
    )

    assert result["status"] == "CUBE_BATCH_NO_SAT_CHECKPOINT"
    assert result["terminal_drat_verified"] is False
    assert result["terminal_clause_count"] is None
    assert not (out / "terminal.cnf").exists()
    assert result["counts"]["cube_local_unsat_unverified_count"] == 4
    assert "no composed terminal proof" in result["diagnostic"]
    replayed = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        workers=2,
        parallel_mode="cube-batch",
        cube_depth=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        resume=True,
        solver_runner=_cube_runner({}),
    )
    assert replayed == result
    (out / "cube-batches/batch-000001").mkdir()
    with pytest.raises(
        cegar.StructuralCegarError,
        match="cube batch directory journal mismatch",
    ):
        cegar.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            workers=2,
            parallel_mode="cube-batch",
            cube_depth=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            resume=True,
            solver_runner=_cube_runner({}),
        )


def _run_verified_shard(
    out: Path,
    *,
    depth: int,
    index: int,
    timeout_s: int = 5,
    bootstrap_results=None,
    algebraic_bootstrap=None,
    projected_static_v2: bool = False,
) -> dict[str, object]:
    def unsat(_cnf: Path, _timeout: int, proof: Path | None):
        assert proof is not None
        proof.write_bytes(b"0\n")
        return cegar.sat.SolverResult(
            "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
        )

    return cegar.run_driver(
        out,
        timeout_s=timeout_s,
        learned_core_limit=2,
        survivor_limit=2,
        shard_depth=depth,
        shard_index=index,
        bootstrap_results=bootstrap_results,
        algebraic_bootstrap=algebraic_bootstrap,
        projected_static_v2=projected_static_v2,
        solver_runner=unsat,
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )


def _projected_bootstrap_source(tmp_path: Path) -> Path:
    legacy = cegar._phase3_encoding(projected_static_v2=False)
    assignment = _first_assignment()
    rows = cegar._metric_rows(legacy.decode(assignment))
    found = cegar._detection(rows)
    assert found is not None
    certificate, _selected = cegar._certificate(rows, found)
    projected = cegar._phase3_encoding(projected_static_v2=True)
    records = _bootstrap_source_records(projected, [certificate])
    source = tmp_path / "projected-bootstrap.jsonl"
    source.write_bytes(
        b"".join(cegar._canonical_bytes(record) + b"\n" for record in records)
    )
    return source


def test_projected_bootstrap_accepts_only_projected_b_free_records(
    tmp_path: Path,
) -> None:
    projected = _projected_bootstrap_source(tmp_path)
    accepted = _run_verified_shard(
        tmp_path / "accepted",
        depth=1,
        index=0,
        bootstrap_results=projected,
        projected_static_v2=True,
    )
    assert accepted["configuration"]["bootstrap_results"]["sha256"] == (
        cegar._sha256_file(projected)
    )

    projected_record = json.loads(projected.read_text())
    legacy = tmp_path / "legacy-bootstrap.jsonl"
    legacy_record = copy.deepcopy(projected_record)
    legacy_record["schema"] = cegar.LEARNED_SCHEMA
    _rehash_learned_record(legacy_record, None)
    legacy.write_bytes(cegar._canonical_bytes(legacy_record) + b"\n")
    with pytest.raises(
        cegar.StructuralCegarError,
        match="learned schema/mode mismatch",
    ):
        _run_verified_shard(
            tmp_path / "reject-legacy",
            depth=1,
            index=0,
            bootstrap_results=legacy,
            projected_static_v2=True,
        )

    b_bearing = tmp_path / "b-bearing-bootstrap.jsonl"
    b_record = copy.deepcopy(projected_record)
    b_record["semantic_assignment"] = {"b[0,1]": True}
    _rehash_learned_record(b_record, None)
    b_bearing.write_bytes(cegar._canonical_bytes(b_record) + b"\n")
    with pytest.raises(
        cegar.StructuralCegarError,
        match="projected bootstrap contains b atoms",
    ):
        _run_verified_shard(
            tmp_path / "reject-b",
            depth=1,
            index=0,
            bootstrap_results=b_bearing,
            projected_static_v2=True,
        )

    mixed = tmp_path / "mixed-bootstrap.jsonl"
    second = copy.deepcopy(projected_record)
    second["schema"] = cegar.LEARNED_SCHEMA
    second["index"] = 1
    _rehash_learned_record(second, projected_record["record_sha256"])
    mixed.write_bytes(
        cegar._canonical_bytes(projected_record)
        + b"\n"
        + cegar._canonical_bytes(second)
        + b"\n"
    )
    with pytest.raises(
        cegar.StructuralCegarError,
        match="learned schema/mode mismatch",
    ):
        _run_verified_shard(
            tmp_path / "reject-mixed",
            depth=1,
            index=0,
            bootstrap_results=mixed,
            projected_static_v2=True,
        )


def test_shard_reconstruction_preserves_ordered_algebraic_bank_provenance(
    tmp_path: Path,
) -> None:
    shard_0 = tmp_path / "algebraic-shard-0"
    shard_1 = tmp_path / "algebraic-shard-1"
    ordered = cegar.DEFAULT_ALGEBRAIC_BOOTSTRAPS
    first = _run_verified_shard(
        shard_0, depth=1, index=0, algebraic_bootstrap=ordered
    )
    _run_verified_shard(
        shard_1, depth=1, index=1, algebraic_bootstrap=ordered
    )

    assert [
        item["path"] for item in first["configuration"]["algebraic_bootstraps"]
    ] == [str(path.resolve()) for path in ordered]
    assert [
        item["certificate_kind"]
        for item in first["configuration"]["algebraic_bootstraps"]
    ] == [
        cegar.UNIT_CONTRADICTION_KIND,
        cegar.UNIT_CONTRADICTION_KIND,
        cegar.REAL_DISTINCTNESS_CONTRADICTION_KIND,
        cegar.EQUILATERAL_SHELL_CONTRADICTION_KIND,
    ]
    coverage = cegar.verify_shard_coverage(
        [shard_1, shard_0],
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )
    assert coverage["status"] == (
        "STRUCTURAL_SHARD_COVERAGE_UNSAT_VERIFIED"
    )
    with pytest.raises(
        cegar.StructuralCegarError,
        match="configuration/dependency mismatch",
    ):
        cegar.run_driver(
            shard_0,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            shard_depth=1,
            shard_index=0,
            bootstrap_results=None,
            algebraic_bootstrap=tuple(reversed(ordered)),
            resume=True,
        )


def test_fixed_shard_units_bind_base_solver_terminal_and_local_status(
    tmp_path: Path,
) -> None:
    observed_cnf: list[bytes] = []

    def unsat(cnf: Path, _timeout: int, proof: Path | None):
        observed_cnf.append(cnf.read_bytes())
        assert proof is not None
        proof.write_bytes(b"0\n")
        return cegar.sat.SolverResult(
            "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
        )

    out = tmp_path / "shard"
    result = cegar.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        shard_depth=2,
        shard_index=1,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=unsat,
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )
    encoding = cegar.sat.SatEncoding(
        cegar.CELL, blocker=True, cap=True
    )
    spec = cegar._shard_spec(encoding, depth=2, index=1)
    expected = encoding.cnf_bytes(((-91,), (92,)))

    assert spec["literals"] == [-91, 92]
    assert result["configuration"]["shard"] == spec
    assert result["status"] == "SHARD_STRUCTURAL_UNSAT_VERIFIED"
    assert "shard-local" in result["result_claim"]
    assert observed_cnf == [expected]
    assert (out / "base.cnf").read_bytes() == expected
    assert (out / "terminal.cnf").read_bytes() == expected
    assert result["terminal_clause_count"] == len(encoding.clauses) + 2
    assert result["artifact_hashes"]["base.cnf"] == spec[
        "shard_base_cnf_sha256"
    ]


@pytest.mark.parametrize(
    ("depth", "index", "message"),
    [
        (None, 0, "provided together"),
        (1, None, "provided together"),
        (True, 0, "shard_depth"),
        (1, True, "shard_index"),
        (0, 0, "shard_depth"),
        (1, 2, "shard_index"),
    ],
)
def test_fixed_shard_arguments_fail_closed(
    tmp_path: Path,
    depth: int | None,
    index: int | None,
    message: str,
) -> None:
    with pytest.raises(cegar.StructuralCegarError, match=message):
        cegar.run_driver(
            tmp_path / f"bad-{depth}-{index}",
            shard_depth=depth,
            shard_index=index,
            bootstrap_results=None,
            algebraic_bootstrap=None,
        )
    with pytest.raises(
        cegar.StructuralCegarError,
        match="require parallel_mode='sequential'",
    ):
        cegar.run_driver(
            tmp_path / "nested",
            shard_depth=1,
            shard_index=0,
            parallel_mode="cube-batch",
            bootstrap_results=None,
            algebraic_bootstrap=None,
        )


def test_live_and_replayed_sat_assignments_must_belong_to_shard(
    tmp_path: Path,
) -> None:
    encoding = cegar.sat.SatEncoding(
        cegar.CELL, blocker=True, cap=True
    )
    assignment = _first_assignment()
    variable = encoding.var("b", 0, 1)
    matching_index = 1 if assignment[variable] else 0
    opposite_index = 0 if assignment[variable] else 1

    live_out = tmp_path / "live-outside"
    live = cegar.run_driver(
        live_out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        shard_depth=1,
        shard_index=opposite_index,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_sat_runner(assignment),
    )
    assert live["status"] == "UNKNOWN"
    assert "violates fixed shard literal" in live["diagnostic"]
    assert not (live_out / "learned-certificates.jsonl").read_text()

    replay_out = tmp_path / "replay-outside"
    checkpoint = cegar.run_driver(
        replay_out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        shard_depth=1,
        shard_index=matching_index,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        max_new_raw=1,
        solver_runner=_sat_runner(assignment),
    )
    assert checkpoint["status"] == "CHECKPOINT"
    learned_path = replay_out / "learned-certificates.jsonl"
    record = json.loads(learned_path.read_text())
    record["semantic_assignment"]["b[0,1]"] = not assignment[variable]
    _rehash_learned_record(record, None)
    learned_path.write_text(json.dumps(record, sort_keys=True) + "\n")
    with pytest.raises(
        cegar.StructuralCegarError,
        match="violates fixed shard literal",
    ):
        cegar.run_driver(
            replay_out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            shard_depth=1,
            shard_index=matching_index,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            resume=True,
        )


def test_shard_coverage_replays_rechecks_and_orders_exact_partition(
    tmp_path: Path,
) -> None:
    shard_0 = tmp_path / "shard-0"
    shard_1 = tmp_path / "shard-1"
    _run_verified_shard(shard_0, depth=1, index=0)
    _run_verified_shard(shard_1, depth=1, index=1)
    checker_calls: list[tuple[Path, Path]] = []

    def checked(cnf: Path, proof: Path, _timeout: int):
        checker_calls.append((cnf, proof))
        return cegar.sat.CheckerResult(True, 0, "s VERIFIED\n", "")

    coverage = cegar.verify_shard_coverage(
        [shard_1, shard_0], checker_runner=checked
    )

    assert coverage["schema"] == cegar.SHARD_COVERAGE_SCHEMA
    assert coverage["status"] == (
        "STRUCTURAL_SHARD_COVERAGE_UNSAT_VERIFIED"
    )
    assert [item["index"] for item in coverage["shards"]] == [0, 1]
    assert [item["literals"] for item in coverage["shards"]] == [[-91], [91]]
    assert len(checker_calls) == 2
    unsigned = dict(coverage)
    claimed = unsigned.pop("coverage_sha256")
    assert claimed == cegar._sha256_value(unsigned)


def test_projected_shard_coverage_replays_exact_partition_and_rejects_mixed_mode(
    tmp_path: Path,
) -> None:
    bootstrap = _projected_bootstrap_source(tmp_path)
    shard_0 = tmp_path / "projected-shard-0"
    shard_1 = tmp_path / "projected-shard-1"
    legacy_shard = tmp_path / "legacy-shard"
    first = _run_verified_shard(
        shard_0,
        depth=1,
        index=0,
        bootstrap_results=bootstrap,
        projected_static_v2=True,
    )
    second = _run_verified_shard(
        shard_1,
        depth=1,
        index=1,
        bootstrap_results=bootstrap,
        projected_static_v2=True,
    )
    _run_verified_shard(legacy_shard, depth=1, index=1)

    coverage = cegar.verify_shard_coverage(
        [shard_1, shard_0],
        checker_runner=lambda *_args: cegar.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )

    projected_encoding = cegar._phase3_encoding(projected_static_v2=True)
    expected = [
        cegar._shard_spec(projected_encoding, depth=1, index=index)["literals"]
        for index in range(2)
    ]
    assert first["schema"] == cegar.PROJECTED_STATIC_SCHEMA
    assert second["schema"] == cegar.PROJECTED_STATIC_SCHEMA
    assert coverage["status"] == "STRUCTURAL_SHARD_COVERAGE_UNSAT_VERIFIED"
    assert [item["index"] for item in coverage["shards"]] == [0, 1]
    assert [item["literals"] for item in coverage["shards"]] == expected

    with pytest.raises(
        cegar.StructuralCegarError,
        match="shard coverage mode/schema mismatch",
    ):
        cegar.verify_shard_coverage(
            [shard_0, legacy_shard],
            checker_runner=lambda *_args: cegar.sat.CheckerResult(
                True, 0, "s VERIFIED\n", ""
            ),
        )


def test_shard_coverage_rejects_gaps_provenance_and_drat_failure(
    tmp_path: Path,
) -> None:
    shard_0 = tmp_path / "shard-0"
    shard_1 = tmp_path / "shard-1"
    _run_verified_shard(shard_0, depth=1, index=0)
    _run_verified_shard(shard_1, depth=1, index=1, timeout_s=6)

    with pytest.raises(
        cegar.StructuralCegarError, match="index coverage mismatch"
    ):
        cegar.verify_shard_coverage(
            [shard_0],
            checker_runner=lambda *_args: cegar.sat.CheckerResult(
                True, 0, "s VERIFIED\n", ""
            ),
        )
    with pytest.raises(
        cegar.StructuralCegarError, match="coverage provenance mismatch"
    ):
        cegar.verify_shard_coverage(
            [shard_0, shard_1],
            checker_runner=lambda *_args: cegar.sat.CheckerResult(
                True, 0, "s VERIFIED\n", ""
            ),
        )
    with pytest.raises(
        cegar.StructuralCegarError, match="duplicate shard index"
    ):
        cegar.verify_shard_coverage(
            [shard_0, shard_0],
            checker_runner=lambda *_args: cegar.sat.CheckerResult(
                True, 0, "s VERIFIED\n", ""
            ),
        )
    with pytest.raises(
        cegar.StructuralCegarError, match="terminal DRAT recheck failed"
    ):
        cegar.verify_shard_coverage(
            [shard_0, shard_1],
            checker_runner=lambda *_args: cegar.sat.CheckerResult(
                False, 1, "", "rejected"
            ),
        )


def test_shard_coverage_rejects_rehashed_noncanonical_manifest(
    tmp_path: Path,
) -> None:
    shard = tmp_path / "shard"
    _run_verified_shard(shard, depth=1, index=0)
    manifest_path = shard / "manifest.json"
    manifest = json.loads(manifest_path.read_text())
    manifest["configuration"]["shard"]["literals"] = [91]
    unsigned = dict(manifest)
    unsigned.pop("manifest_sha256")
    manifest["manifest_sha256"] = cegar._sha256_value(unsigned)
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    with pytest.raises(
        cegar.StructuralCegarError,
        match="canonical shard provenance mismatch",
    ):
        cegar.verify_shard_coverage(
            [shard],
            checker_runner=lambda *_args: cegar.sat.CheckerResult(
                True, 0, "s VERIFIED\n", ""
            ),
        )
