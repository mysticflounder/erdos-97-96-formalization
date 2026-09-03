from __future__ import annotations

import copy
import hashlib
import json
from fractions import Fraction

import pytest

from census.card_head import exactfive_hard_source_swap_bo_source_qfnra_piqd as subject


@pytest.fixture(scope="module")
def prior() -> dict[str, object]:
    return subject.authenticate_source_orders()


@pytest.fixture(scope="module")
def targets(prior: dict[str, object]) -> dict[str, dict[str, object]]:
    return {
        order_id: subject._build_target_from_prior(prior, order_id)
        for order_id in subject.ORDER_IDS
    }


def test_authenticated_orders_are_current_adaptive_orders(prior: dict[str, object]) -> None:
    gauges = prior["fresh_gauges"]
    assert [tuple(gauge["order"]) for gauge in gauges] == list(subject.EXPECTED_ORDERS.values())
    assert [gauge["solver"] for gauge in gauges] == ["z3", "cvc5"]


def test_authentication_rejects_order_mutation(monkeypatch: pytest.MonkeyPatch, prior: dict[str, object]) -> None:
    bad = copy.deepcopy(prior)
    bad["fresh_gauges"][0]["order"][1], bad["fresh_gauges"][0]["order"][2] = (
        bad["fresh_gauges"][0]["order"][2],
        bad["fresh_gauges"][0]["order"][1],
    )
    monkeypatch.setattr(subject.equality_core, "revalidate_prior_adaptive_run", lambda: bad)
    with pytest.raises(subject.BoSourceQfnraError, match="order drifted"):
        subject.authenticate_source_orders()


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_target_has_full_source_ledger(targets: dict[str, dict[str, object]], order_id: str) -> None:
    system = targets[order_id]
    inventory = subject.formula_inventory(system)
    assert tuple(system["authenticated_order"]) == subject.EXPECTED_ORDERS[order_id]
    assert system["variables"] == list(subject.TARGET_VARIABLES)
    assert len(system["variables"]) == 13
    assert inventory == {
        "variable_declarations": 13,
        "normalization_assertions": 2,
        "strict_signed_area_assertions": 165,
        "row_equality_assertions": 13,
        "radius_disequality_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }
    triples = [tuple(entry["triple"]) for entry in system["area_ledger"]]
    assert len(triples) == len(set(triples)) == 165
    assert sum(entry["identically_zero"] for entry in system["area_ledger"]) >= 1


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_exact_substitution_signs_and_collision(targets: dict[str, dict[str, object]], order_id: str) -> None:
    system = targets[order_id]
    by_triple = {tuple(entry["triple"]): entry for entry in system["area_ledger"]}
    r_poly = subject._poly_json(subject._p_var("r"))
    for triple in (
        ("c000", "c005", "c001"),
        ("c000", "c001", "c003"),
        ("c000", "c001", "c002"),
    ):
        assert by_triple[triple]["polynomial"] == r_poly
    collision = by_triple[("c005", "c001", "c002")]
    assert collision["identically_zero"] is True
    assert collision["reduced_smt"] == "0"
    assert system["normalization"]["substitution"] == {
        "c000": ["0", "0"],
        "c001": ["1", "0"],
        "c002": ["3/2", "r"],
        "c003": ["1/2", "r"],
        "c005": ["1/2", "-r"],
    }


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_known_normalization_rows_reduce_modulus(targets: dict[str, dict[str, object]], order_id: str) -> None:
    system = targets[order_id]
    by_key = {
        (entry["center"], entry["first_support"], entry["other_support"]): entry
        for entry in system["row_equality_ledger"]
    }
    for key in map(tuple, system["normalization"]["source_row_keys"]):
        entry = by_key[key]
        poly = {
            tuple(term["monomial"]): Fraction(*term["coefficient"])
            for term in entry["polynomial"]
        }
        assert subject._reduce_modulus(poly) == {}


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_smt_retains_every_assertion_including_zero_area(targets: dict[str, dict[str, object]], order_id: str) -> None:
    commands = subject.build_smt_commands(targets[order_id])
    assert commands[0] == "(set-logic QF_NRA)"
    assert len(commands) == 1 + 13 + 2 + 165 + 13 + 1 + 1
    assert commands.count("(assert (> 0 0))") >= 1
    assert commands.count("(assert (= 0 0))") == 2
    assert "(assert (= (+ (* 4 r r) (- 3)) 0))" in commands
    assert "(assert (> r 0))" in commands


def test_mutated_area_ledger_is_rejected(prior: dict[str, object]) -> None:
    system = subject._build_target_from_prior(prior, "fresh-z3")
    system["area_ledger"][0]["reduced_smt"] = "0"
    with pytest.raises(subject.BoSourceQfnraError, match="source ledger"):
        subject._validate_system_current(system, prior)


def test_mutated_substitution_is_rejected(prior: dict[str, object]) -> None:
    system = subject._build_target_from_prior(prior, "fresh-z3")
    system["normalization"]["substitution"]["c003"] = ["1/2", "-r"]
    with pytest.raises(subject.BoSourceQfnraError, match="source ledger"):
        subject._validate_system_current(system, prior)


def test_controls_are_cheap_and_opposite() -> None:
    positive = subject.build_control_system("positive")
    negative = subject.build_control_system("negative")
    assert subject.build_smt_commands(positive) == (
        "(set-logic QF_NRA)",
        "(declare-fun t () Real)",
        "(assert (= t 1))",
    )
    assert subject.build_smt_commands(negative)[-2:] == (
        "(assert (= t 0))",
        "(assert (> t 0))",
    )


@pytest.mark.parametrize("timeout", [0, -1, 3_600_001, True, 1.5])
def test_prepare_rejects_invalid_timeout(timeout: object) -> None:
    with pytest.raises(subject.BoSourceQfnraError, match="timeout"):
        subject.prepare_query(subject.build_control_system("positive"), timeout_ms=timeout)


def test_query_binds_sources_and_exact_inventory() -> None:
    prepared = subject.prepare_query(subject.build_control_system("positive"), timeout_ms=1234)
    descriptor = prepared.query.descriptor
    assert descriptor["solver_profile"] == {
        "schema": subject.adapter.SOLVER_PROFILE_SCHEMA,
        "solvers": ["z3", "cvc5"],
        "timeout_ms": 1234,
    }
    paths = {entry["path"] for entry in descriptor["sources"]}
    assert {
        "0000-source-record.json",
        "implementation-bo-source.py",
        "implementation-equality-custody.py",
        "implementation-adaptive.py",
        "implementation-frozen-nra.py",
        "implementation-frozen-order.py",
        "implementation-adapter.py",
        "specification.md",
    } == paths
    assert descriptor["semantic_input"]["formula_inventory"]["control_assertions"] == 1


def test_target_query_passes_adapter_snapshot_validation(targets: dict[str, dict[str, object]]) -> None:
    prepared = subject.prepare_query(targets["fresh-z3"], timeout_ms=1234)
    replayed = subject.adapter._revalidate_query_snapshot(prepared.query)
    assert replayed.descriptor == prepared.query.descriptor
    assert len(replayed.get_values) == 13


def test_exact_value_parser_accepts_rationals_and_decimals() -> None:
    assert subject.parse_exact_values("((r (/ 3 2)) (x_c004 (- 2)) (y_c004 0.25))", ("r", "x_c004", "y_c004")) == {
        "r": Fraction(3, 2),
        "x_c004": Fraction(-2),
        "y_c004": Fraction(1, 4),
    }


@pytest.mark.parametrize(
    "payload",
    [
        "((r (root-obj (+ (^ x 2) (- 3)) 1)))",
        "((r (_ real_algebraic_number 1 2)))",
        "((r (/ 1 0)))",
        "((r 1) (r 1))",
        "((wrong 1))",
    ],
)
def test_exact_value_parser_fails_closed(payload: str) -> None:
    with pytest.raises(subject.BoSourceQfnraError):
        subject.parse_exact_values(payload, ("r",))


def test_positive_control_exact_replay_accepts() -> None:
    prepared = subject.prepare_query(subject.build_control_system("positive"), timeout_ms=1000)
    verification = subject.verify_sat_model(prepared.query, "z3", "(model)", "((t 1))")
    assert verification.accepted is True
    assert verification.evidence["accepted"] is True


def test_negative_control_sat_replay_rejects() -> None:
    prepared = subject.prepare_query(subject.build_control_system("negative"), timeout_ms=1000)
    verification = subject.verify_sat_model(prepared.query, "cvc5", "(model)", "((t 0))")
    assert verification.accepted is False


def test_algebraic_target_readback_is_semantic_rejection_not_exception(
    prior: dict[str, object],
) -> None:
    system = subject._build_target_from_prior(prior, "fresh-z3")
    prepared = subject.prepare_query(system, timeout_ms=1000)
    entries = []
    for term in subject.TARGET_VARIABLES:
        value = "(root-obj (+ (^ x 2) (- 3)) 1)" if term == "r" else "0"
        entries.append(f"({term} {value})")
    verification = subject.verify_sat_model(
        prepared.query,
        "z3",
        "(model)",
        "(" + " ".join(entries) + ")",
    )
    assert verification.accepted is False
    assert verification.evidence["reason"] == "exact_readback_unsupported"


def test_target_rational_readback_fails_modulus_before_source_claim(prior: dict[str, object]) -> None:
    system = subject._build_target_from_prior(prior, "fresh-z3")
    prepared = subject.prepare_query(system, timeout_ms=1000)
    assignments = {term: Fraction(0) for term in subject.TARGET_VARIABLES}
    assignments["r"] = Fraction(1)
    values = "(" + " ".join(f"({term} {value})" for term, value in assignments.items()) + ")"
    verification = subject.verify_sat_model(prepared.query, "z3", "(model)", values)
    assert verification.accepted is False
    assert verification.evidence["reason"] == "normalization_modulus_or_sign"


def test_descriptor_mutation_is_rejected() -> None:
    prepared = subject.prepare_query(subject.build_control_system("positive"), timeout_ms=1000)
    prepared.query.descriptor["semantic_input"]["formula_inventory"]["control_assertions"] = 2
    with pytest.raises(subject.BoSourceQfnraError, match="descriptor"):
        subject.verify_sat_model(prepared.query, "z3", "(model)", "((t 1))")


def test_artifact_digest_and_link_count_custody(tmp_path) -> None:
    artifact = tmp_path / "a.json"
    artifact.write_bytes(b"{}\n")
    record = {"path": "a.json", "bytes": 3, "sha256": hashlib.sha256(b"{}\n").hexdigest()}
    assert subject._verify_artifact(tmp_path, record, set()) == b"{}\n"
    bad = dict(record, sha256="0" * 64)
    with pytest.raises(subject.BoSourceQfnraError, match="digest mismatch"):
        subject._verify_artifact(tmp_path, bad, set())


def test_terminal_status_fails_closed() -> None:
    unsat = {"engines": [{"raw_status": "UNSAT", "effective_status": "UNSAT_DISCOVERY_ONLY"}] * 2}
    unknown = {"engines": [{"raw_status": "UNKNOWN", "effective_status": "INCONCLUSIVE_UNKNOWN"}] * 2}
    accepted = {"engines": [{"raw_status": "SAT", "effective_status": "SAT_SEMANTICALLY_REPLAYED"}] * 2}
    assert subject._terminal_status([unsat, unsat]) == "TARGETS_UNSAT_DISCOVERY_ONLY"
    assert subject._terminal_status([unsat, unknown]) == "TARGET_INCONCLUSIVE"
    assert subject._terminal_status([unsat, accepted]) == "TARGET_SAT_REPLAYED"


def test_governed_run_manifest_exists_before_launch() -> None:
    root, manifest = subject.ensure_run_root()
    assert root == subject.RUN_ROOT
    assert manifest["schema"] == subject.RUN_MANIFEST_SCHEMA
    assert manifest["root"] == f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"
    assert manifest["base_head"] == "c07dbadc08332e1e52a4857e5365611029a9f814"
    assert "generated_root" not in manifest


def test_main_is_silent_on_success(monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]) -> None:
    monkeypatch.setattr(subject, "run_diagnostic", lambda **_kwargs: {"status": "TARGET_INCONCLUSIVE"})
    assert subject.main([]) == 0
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == ""


def test_main_verbose_prints_one_json_line(monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]) -> None:
    monkeypatch.setattr(subject, "run_diagnostic", lambda **_kwargs: {"status": "TARGET_INCONCLUSIVE"})
    assert subject.main(["--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == {"status": "TARGET_INCONCLUSIVE"}
    assert captured.err == ""


def test_main_prints_errors(monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]) -> None:
    def fail(**_kwargs: object) -> dict[str, object]:
        raise subject.BoSourceQfnraError("blocked")

    monkeypatch.setattr(subject, "run_diagnostic", fail)
    assert subject.main([]) == 1
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == "error: blocked\n"


def test_module_has_no_direct_solver_or_subprocess_transport() -> None:
    source = subject._read_regular(subject.Path(subject.__file__)).decode("utf-8")
    assert "import subprocess" not in source
    assert "subprocess." not in source
    assert "z3 " not in source
    assert "cvc5 " not in source
