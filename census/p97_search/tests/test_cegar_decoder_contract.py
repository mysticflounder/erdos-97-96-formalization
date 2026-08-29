from __future__ import annotations

import copy
import importlib
import json
from pathlib import Path

import pytest

contract = importlib.import_module("census.p97_search.cegar_decoder_contract")
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)

FIXTURE = (
    Path(__file__).parent
    / "fixtures/projected_static_v3_first_validated_semantic_assignment.json"
)


@pytest.fixture
def encoding():
    return v3._phase3_encoding(projected_static_v3=True)


def _semantic_assignment(encoding) -> dict[int, bool]:
    semantic = json.loads(FIXTURE.read_text())
    return encoding.assignment_from_record({"semantic_assignment": semantic})


def test_contract_binds_projection_and_canonical_reconstruction(encoding) -> None:
    receipt = contract.build_decoder_contract(encoding)

    assert receipt["schema"] == contract.SCHEMA
    assert receipt["governing_contract_schema"] == (
        "p97-cegar-semantic-contract/v2"
    )
    assert receipt["decoder_mode"] == (
        "CANONICAL_PROJECTION_FUNCTION"
    )
    assert receipt["cnf_variable_count"] == 1194
    assert receipt["semantic_variable_count"] == 111
    assert receipt["auxiliary_variable_count"] == 1083
    assert receipt["reconstruction"]["blocker"] == (
        "MINIMUM_INCOMING_SHELL_CENTER"
    )
    assert receipt["reconstruction"]["caps"] == (
        "FIXED_M_0_1_2_AND_UNIQUE_EXPLICIT_F_ROW"
    )
    assert receipt["decoder_functionality_enforced"] is True
    assert receipt["formula_to_decoder_projection"][
        "supports_semantic_discharge"
    ] is False
    assert receipt["decoder_producer"]["producer_ref_sha256"]
    assert receipt["decoder_evidence"]["producer_ref_sha256"]
    assert receipt["decoded_object_identity"]["kind"] == "CONTENT_SHA256"
    assert receipt["r3_assignment_decoding_discharge"] is None
    assert receipt["supports_abstract_promotion"] is False
    contract.validate_decoder_contract(receipt, encoding)


def test_same_semantic_projection_ignores_all_auxiliary_values(encoding) -> None:
    semantic = _semantic_assignment(encoding)
    semantic_set = set(encoding.semantic_vars)
    all_false = {
        **semantic,
        **{
            variable: False
            for variable in range(1, encoding.num_vars + 1)
            if variable not in semantic_set
        },
    }
    all_true = {
        **semantic,
        **{
            variable: True
            for variable in range(1, encoding.num_vars + 1)
            if variable not in semantic_set
        },
    }

    semantic_obj = contract.decode_canonical(encoding, semantic)
    false_obj = contract.decode_canonical(encoding, all_false)
    true_obj = contract.decode_canonical(encoding, all_true)

    assert false_obj == semantic_obj == true_obj
    assert false_obj.digest() == semantic_obj.digest() == true_obj.digest()


def test_decoder_rejects_incomplete_or_non_boolean_projection(encoding) -> None:
    semantic = _semantic_assignment(encoding)
    missing = dict(semantic)
    missing.pop(encoding.semantic_vars[0])
    with pytest.raises(contract.DecoderContractError, match="omits semantic"):
        contract.decode_canonical(encoding, missing)

    malformed = dict(semantic)
    malformed[encoding.semantic_vars[0]] = 1
    with pytest.raises(contract.DecoderContractError, match="non-Boolean"):
        contract.decode_canonical(encoding, malformed)


def test_independent_reconstruction_rejects_decoder_drift(
    encoding, monkeypatch
) -> None:
    semantic = _semantic_assignment(encoding)
    expected = encoding.decode(semantic)
    monkeypatch.setattr(encoding, "decode", lambda _assignment: expected.node)

    with pytest.raises(contract.DecoderContractError, match="disagrees"):
        contract.decode_canonical(encoding, semantic)


def test_contract_tampering_and_legacy_policy_fail_closed(encoding) -> None:
    receipt = contract.build_decoder_contract(encoding)
    tampered = copy.deepcopy(receipt)
    tampered["auxiliary_policy"] = "AUXILIARIES_SELECT_AN_OBJECT"
    unsigned = dict(tampered)
    unsigned.pop("contract_sha256")
    tampered["contract_sha256"] = contract._sha256_value(unsigned)
    with pytest.raises(contract.DecoderContractError, match="malformed"):
        contract.validate_bound_contract(tampered)

    crossed = copy.deepcopy(receipt)
    crossed["semantic_variable_map_sha256"] = "0" * 64
    unsigned = dict(crossed)
    unsigned.pop("contract_sha256")
    crossed["contract_sha256"] = contract._sha256_value(unsigned)
    contract.validate_bound_contract(crossed)
    with pytest.raises(contract.DecoderContractError, match="live encoding"):
        contract.validate_decoder_contract(crossed, encoding)

    assert v3._resume_canonical_decoder_contract(
        {"status": "RUNNING"}, encoding, receipt
    ) == receipt
    assert (
        v3._resume_canonical_decoder_contract(
            {"status": "STRUCTURAL_UNSAT_VERIFIED"}, encoding, receipt
        )
        is None
    )
