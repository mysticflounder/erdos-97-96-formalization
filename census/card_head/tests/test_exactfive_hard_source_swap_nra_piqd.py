from fractions import Fraction

import pytest

from census.card_head import exactfive_hard_source_swap_nra_piqd as canary


def _pinned(control: str) -> dict[str, tuple[Fraction, Fraction]]:
    system = canary.build_control_system(control)
    return {key: tuple(Fraction(v) for v in value) for key, value in system["coordinate_pins"].items()}


def test_fixed_orders_and_exhaustive_triple_count() -> None:
    for order_id in canary.ORDER_IDS:
        system = canary.build_system(order_id)
        inventory = canary.formula_inventory(system)
        assert len(system["order"]) == 11
        assert inventory["strict_signed_area_assertions"] == 165  # C(11, 3)
        assert inventory["row_equality_assertions"] == 13
        assert system["profile_sha256"] == canary.PROFILE_SHA256


def test_positive_and_negative_controls_replay() -> None:
    positive = canary.build_control_system("positive")
    negative = canary.build_control_system("negative")
    assert canary.check_coordinates(positive, _pinned("positive"))["accepted"]
    assert not canary.check_coordinates(negative, _pinned("negative"))["accepted"]


def test_inline_metric_constraints_and_no_abstract_distances() -> None:
    system = canary.build_system("z3-survivor")
    text = canary.smt_journal(system).decode("ascii")
    assert "(set-logic QF_NRA)" in text
    assert "declare-fun d_" not in text
    assert "(assert (not (= (+" in text
    assert "(assert (< (+" in text
    assert "(^" not in text


def test_exact_coordinate_readback_and_replay() -> None:
    query = canary.prepare_query(canary.build_control_system("positive")).query
    values = "((x_c000 0) (x_c001 1) (x_c002 2) (x_c003 1) (y_c000 0) (y_c001 0) (y_c002 1) (y_c003 2))"
    coords = canary.parse_coordinates(values, query.get_values)
    verification = canary.verify_sat_model(query, "z3", "model", values)
    assert coords["c002"] == (Fraction(2), Fraction(1))
    assert verification.accepted


def test_exact_replay_preserves_nondefault_timeout() -> None:
    query = canary.prepare_query(canary.build_control_system("positive"), timeout_ms=300_000).query
    values = "((x_c000 0) (x_c001 1) (x_c002 2) (x_c003 1) (y_c000 0) (y_c001 0) (y_c002 1) (y_c003 2))"
    assert canary.verify_sat_model(query, "z3", "model", values).accepted


def test_tampered_readback_rejected() -> None:
    query = canary.prepare_query(canary.build_control_system("positive")).query
    values = "((x_c000 0) (x_c001 1) (x_c002 2) (x_c003 1) (y_c000 0) (y_c001 0) (y_c002 -1) (y_c003 2))"
    assert not canary.verify_sat_model(query, "z3", "model", values).accepted


def test_readback_rejects_duplicates_and_zero_denominator() -> None:
    query = canary.prepare_query(canary.build_control_system("positive")).query
    duplicate = "((x_c000 0) (x_c000 0) (x_c001 1) (x_c002 2) (x_c003 1) (y_c000 0) (y_c001 0) (y_c002 1) (y_c003 2))"
    with pytest.raises(canary.NraCanaryError, match="duplicate"):
        canary.parse_coordinates(duplicate, query.get_values)
    zero = "((x_c000 (/ 1 0)) (x_c001 1) (x_c002 2) (x_c003 1) (y_c000 0) (y_c001 0) (y_c002 1) (y_c003 2))"
    with pytest.raises(canary.NraCanaryError, match="zero denominator"):
        canary.parse_coordinates(zero, query.get_values)


def test_semantic_system_and_journal_tampering_rejected() -> None:
    prepared = canary.prepare_query(canary.build_control_system("positive"))
    semantic = dict(prepared.query.descriptor["semantic_input"])
    semantic["system_sha256"] = "0" * 64
    descriptor = dict(prepared.query.descriptor)
    descriptor["semantic_input"] = semantic
    tampered = type(prepared.query)(descriptor, prepared.query.descriptor_bytes, prepared.query.original_smt2, prepared.query.journal_commands, prepared.query.journal_smt2, prepared.query.source_files)
    with pytest.raises(canary.NraCanaryError, match="digest"):
        canary.verify_sat_model(tampered, "z3", "model", "((x_c000 0))")


def test_deterministic_query_bytes_and_adapter_custody() -> None:
    first = canary.prepare_query(canary.build_system("cvc5-survivor")).query
    second = canary.prepare_query(canary.build_system("cvc5-survivor")).query
    assert first.descriptor_bytes == second.descriptor_bytes
    assert first.original_smt2 == second.original_smt2
    assert canary.adapter._revalidate_query_snapshot(first) == first


def test_checkpoint_bound_manifest_is_current() -> None:
    assert canary.ensure_run_root().name == "run-0001"


def test_artifact_digest_tamper_rejected(tmp_path) -> None:
    payload = b"immutable"
    path = tmp_path / "artifact"
    path.write_bytes(payload)
    record = {"path": "artifact", "bytes": len(payload), "sha256": "0" * 64}
    with pytest.raises(canary.NraCanaryError, match="digest mismatch"):
        canary._verify_artifact(tmp_path, record, set())


def test_launch_inputs_are_bounded_and_validated() -> None:
    with pytest.raises(canary.NraCanaryError, match="workers"):
        canary.run_census(workers=21)
    with pytest.raises(canary.NraCanaryError, match="timeout"):
        canary.run_census(timeout_s=float("nan"))
    with pytest.raises(canary.NraCanaryError, match="server"):
        canary.run_census(server="file:///tmp/piqd")


def test_wrong_profile_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(canary, "PROFILE_SHA256", "0" * 64)
    with pytest.raises(canary.NraCanaryError, match="authenticated survivor"):
        canary.build_system("z3-survivor")
