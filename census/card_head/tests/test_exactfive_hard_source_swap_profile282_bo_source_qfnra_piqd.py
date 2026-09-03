from __future__ import annotations

import copy
import hashlib
import json
from fractions import Fraction

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd as subject,
)


@pytest.fixture(scope="module")
def prior() -> dict[str, object]:
    return subject.authenticate_source_orders()


@pytest.fixture(scope="module")
def targets(prior: dict[str, object]) -> dict[str, dict[str, object]]:
    return {
        order_id: subject._build_target_from_prior(prior, order_id)
        for order_id in subject.ORDER_IDS
    }


def test_parent_custody_and_orders(prior: dict[str, object]) -> None:
    assert prior["profile_index"] == 282
    assert prior["profile_sha256"] == subject.PROFILE_SHA256
    gauges = prior["fresh_gauges"]
    assert [gauge["solver"] for gauge in gauges] == ["z3", "cvc5"]
    assert [gauge["sigma"] for gauge in gauges] == [-1, 1]
    assert [tuple(gauge["order"]) for gauge in gauges] == list(
        subject.EXPECTED_ORDERS.values()
    )


def test_parent_result_tampering_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    original = subject._read_regular

    def tampered(path: subject.Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        return payload + b" " if path == subject.PARENT_RESULT_PATH else payload

    monkeypatch.setattr(subject, "_read_regular", tampered)
    with pytest.raises(subject.Profile282BoQfnraError, match="artifacts drifted"):
        subject.authenticate_source_orders()


def test_parent_source_manifest_tampering_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original = subject._read_regular

    def tampered(path: subject.Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        if path == subject.PARENT_SOURCE_MANIFEST_PATH:
            return payload.replace(b'"query_id"', b'"query_ix"', 1)
        return payload

    monkeypatch.setattr(subject, "_read_regular", tampered)
    with pytest.raises(subject.Profile282BoQfnraError, match="artifacts drifted"):
        subject.authenticate_source_orders()


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_full_profile_inventory(
    targets: dict[str, dict[str, object]], order_id: str
) -> None:
    system = targets[order_id]
    assert tuple(tuple(entry["roles"]) for entry in system["source_classes"]) == (
        subject.EXPECTED_CLASSES
    )
    assert tuple(system["authenticated_order"]) == subject.EXPECTED_ORDERS[order_id]
    assert system["variables"] == list(subject.TARGET_VARIABLES)
    assert subject.formula_inventory(system) == {
        "variable_declarations": 19,
        "normalization_assertions": 2,
        "strict_signed_area_assertions": 286,
        "row_equality_assertions": 13,
        "radius_disequality_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }
    assert len({tuple(entry["triple"]) for entry in system["area_ledger"]}) == 286
    assert len(system["row_equality_ledger"]) == 13


@pytest.mark.parametrize(
    ("order_id", "sigma", "signed", "sign_triple"),
    [
        ("parent-z3-mirror", -1, "-r", ("c000", "c003", "c002")),
        ("parent-cvc5-direct", 1, "r", ("c000", "c001", "c003")),
    ],
)
def test_normalization_signs(
    targets: dict[str, dict[str, object]],
    order_id: str,
    sigma: int,
    signed: str,
    sign_triple: tuple[str, str, str],
) -> None:
    normalization = targets[order_id]["normalization"]
    assert normalization["sigma"] == sigma
    assert normalization["substitution"] == {
        "c000": ["0", "0"],
        "c001": ["1", "0"],
        "c002": ["3/2", signed],
        "c003": ["1/2", signed],
    }
    areas = {
        tuple(entry["triple"]): entry
        for entry in targets[order_id]["area_ledger"]
    }
    assert areas[sign_triple]["polynomial"] == subject._poly_json(
        subject._p_var("r")
    )


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_normalization_rows_reduce_modulus(
    targets: dict[str, dict[str, object]], order_id: str
) -> None:
    system = targets[order_id]
    rows = {
        (entry["center"], entry["first_support"], entry["other_support"]): entry
        for entry in system["row_equality_ledger"]
    }
    for key in map(tuple, system["normalization"]["source_row_keys"]):
        polynomial = {
            tuple(term["monomial"]): Fraction(*term["coefficient"])
            for term in rows[key]["polynomial"]
        }
        assert subject._reduce_modulus(polynomial) == {}


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_smt_retains_complete_ledgers(
    targets: dict[str, dict[str, object]], order_id: str
) -> None:
    commands = subject.build_smt_commands(targets[order_id])
    assert commands[0] == "(set-logic QF_NRA)"
    assert len(commands) == 1 + 19 + 2 + 286 + 13 + 1 + 1
    assert "(assert (= (+ (* 4 r r) (- 3)) 0))" in commands
    assert "(assert (> r 0))" in commands
    assert sum(command.startswith("(assert (> ") for command in commands) == 287
    assert sum(command.startswith("(assert (= ") for command in commands) == 14
    assert sum(command.startswith("(assert (not (= ") for command in commands) == 1
    assert sum(command.startswith("(assert (< ") for command in commands) == 1


def test_mutated_ledger_is_rejected(prior: dict[str, object]) -> None:
    system = subject._build_target_from_prior(prior, "parent-z3-mirror")
    system["area_ledger"][0]["reduced_smt"] = "0"
    with pytest.raises(subject.Profile282BoQfnraError, match="source ledger"):
        subject._validate_system_current(system, prior)


def test_controls_are_rational_and_opposite() -> None:
    assert subject.build_smt_commands(subject.build_control_system("positive")) == (
        "(set-logic QF_NRA)",
        "(declare-fun t () Real)",
        "(assert (= t 1))",
    )
    assert subject.build_smt_commands(subject.build_control_system("negative"))[-2:] == (
        "(assert (= t 0))",
        "(assert (> t 0))",
    )


@pytest.mark.parametrize("timeout", [0, -1, 3_600_001, True, 1.5])
def test_prepare_rejects_bad_timeout(timeout: object) -> None:
    with pytest.raises(subject.Profile282BoQfnraError, match="timeout"):
        subject.prepare_query(
            subject.build_control_system("positive"), timeout_ms=timeout
        )


def test_query_binds_parent_and_inventory() -> None:
    prepared = subject.prepare_query(
        subject.build_control_system("positive"), timeout_ms=1234
    )
    descriptor = prepared.query.descriptor
    assert descriptor["solver_profile"] == {
        "schema": subject.adapter.SOLVER_PROFILE_SCHEMA,
        "solvers": ["z3", "cvc5"],
        "timeout_ms": 1234,
    }
    paths = {entry["path"] for entry in descriptor["sources"]}
    assert {
        "parent-run-manifest.json",
        "parent-launch.json",
        "parent-terminal.json",
        "parent-profile-result.json",
        "parent-profile-source-manifest.json",
    } <= paths
    assert descriptor["semantic_input"]["formula_inventory"]["control_assertions"] == 1


def test_target_adapter_snapshot_has_19_values(
    targets: dict[str, dict[str, object]],
) -> None:
    prepared = subject.prepare_query(targets["parent-z3-mirror"], timeout_ms=1234)
    replayed = subject.adapter._revalidate_query_snapshot(prepared.query)
    assert replayed.descriptor == prepared.query.descriptor
    assert len(replayed.get_values) == 19


def test_exact_value_parser_and_fail_closed_algebraic_readback(
    prior: dict[str, object],
) -> None:
    assert subject.parse_exact_values(
        "((r (/ 3 2)) (x_c004 (- 2)) (y_c004 0.25))",
        ("r", "x_c004", "y_c004"),
    ) == {
        "r": Fraction(3, 2),
        "x_c004": Fraction(-2),
        "y_c004": Fraction(1, 4),
    }
    system = subject._build_target_from_prior(prior, "parent-z3-mirror")
    prepared = subject.prepare_query(system, timeout_ms=1000)
    entries = [
        f"({term} {'(root-obj (+ (^ x 2) (- 3)) 1)' if term == 'r' else '0'})"
        for term in subject.TARGET_VARIABLES
    ]
    verification = subject.verify_sat_model(
        prepared.query, "z3", "(model)", "(" + " ".join(entries) + ")"
    )
    assert verification.accepted is False
    assert verification.evidence["reason"] == "exact_readback_unsupported"


def test_control_exact_replay() -> None:
    positive = subject.prepare_query(
        subject.build_control_system("positive"), timeout_ms=1000
    )
    negative = subject.prepare_query(
        subject.build_control_system("negative"), timeout_ms=1000
    )
    assert subject.verify_sat_model(
        positive.query, "z3", "(model)", "((t 1))"
    ).accepted
    assert not subject.verify_sat_model(
        negative.query, "cvc5", "(model)", "((t 0))"
    ).accepted


def test_existing_query_tree_resumes_without_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    output = tmp_path / "done"
    output.mkdir()
    prepared = subject.PreparedQuery(
        "control-positive",
        subject.build_control_system("positive"),
        object(),
    )
    expected = {"overall_status": "FINITE_DIAGNOSTIC_COMPLETE"}
    monkeypatch.setattr(subject, "verify_adapter_tree", lambda *_args: expected)

    class NoTransport:
        def __getattr__(self, name: str) -> object:
            raise AssertionError(f"transport used on resume: {name}")

    assert subject.run_query(prepared, output, NoTransport()) is expected


def test_artifact_digest_custody(tmp_path: subject.Path) -> None:
    artifact = tmp_path / "a.json"
    artifact.write_bytes(b"{}\n")
    record = {
        "path": "a.json",
        "bytes": 3,
        "sha256": hashlib.sha256(b"{}\n").hexdigest(),
    }
    assert subject._verify_artifact(tmp_path, record, set()) == b"{}\n"
    with pytest.raises(subject.Profile282BoQfnraError, match="digest mismatch"):
        subject._verify_artifact(tmp_path, dict(record, sha256="0" * 64), set())


def test_terminal_status_is_conservative() -> None:
    unsat = {
        "engines": [
            {"raw_status": "UNSAT", "effective_status": "UNSAT_DISCOVERY_ONLY"}
        ]
        * 2
    }
    unknown = {
        "engines": [
            {"raw_status": "UNKNOWN", "effective_status": "INCONCLUSIVE_UNKNOWN"}
        ]
        * 2
    }
    accepted = {
        "engines": [
            {"raw_status": "SAT", "effective_status": "SAT_SEMANTICALLY_REPLAYED"}
        ]
        * 2
    }
    assert subject._terminal_status([unsat, unsat]) == "TARGETS_UNSAT_DISCOVERY_ONLY"
    assert subject._terminal_status([unsat, unknown]) == "TARGET_INCONCLUSIVE"
    assert subject._terminal_status([unsat, accepted]) == "TARGET_SAT_REPLAYED"


def test_governed_manifest_uses_checkpoint_base() -> None:
    root, manifest = subject.ensure_run_root()
    assert root == subject.RUN_ROOT
    assert manifest["schema"] == subject.RUN_MANIFEST_SCHEMA
    assert manifest["base_head"] == "de54b4669df394568539d03f291c713910323463"
    assert manifest["root"] == f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"


def test_symlinked_run_root_is_rejected(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    target = tmp_path / "target"
    target.mkdir()
    link = tmp_path / "run-0001"
    link.symlink_to(target, target_is_directory=True)
    monkeypatch.setattr(subject, "RUN_ROOT", link)
    with pytest.raises(subject.Profile282BoQfnraError, match="symlink"):
        subject.ensure_run_root()


def test_main_is_sparse_and_verbose_is_one_json(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    result = {"status": "TARGET_INCONCLUSIVE"}
    monkeypatch.setattr(subject, "run_diagnostic", lambda **_kwargs: result)
    assert subject.main([]) == 0
    assert capsys.readouterr() == ("", "")
    assert subject.main(["--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == result
    assert captured.out.count("\n") == 1
    assert captured.err == ""


def test_main_prints_errors(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    def fail(**_kwargs: object) -> dict[str, object]:
        raise subject.Profile282BoQfnraError("blocked")

    monkeypatch.setattr(subject, "run_diagnostic", fail)
    assert subject.main([]) == 1
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == "error: blocked\n"


def test_module_has_no_direct_solver_or_fallback_transport() -> None:
    source = subject._read_regular(subject.Path(subject.__file__)).decode("utf-8")
    assert "import subprocess" not in source
    assert "subprocess." not in source
    assert "z3 " not in source
    assert "cvc5 " not in source
    assert "UrllibPiqdTransport" in source


def test_descriptor_mutation_is_rejected() -> None:
    prepared = subject.prepare_query(
        subject.build_control_system("positive"), timeout_ms=1000
    )
    mutated = copy.deepcopy(prepared.query.descriptor)
    mutated["semantic_input"]["formula_inventory"]["control_assertions"] = 2
    prepared.query.descriptor.clear()
    prepared.query.descriptor.update(mutated)
    with pytest.raises(subject.Profile282BoQfnraError, match="descriptor"):
        subject.verify_sat_model(prepared.query, "z3", "(model)", "((t 1))")
