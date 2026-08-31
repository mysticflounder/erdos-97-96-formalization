from __future__ import annotations

import copy
import hashlib
import importlib
import json
import os
import re
import stat
from pathlib import Path
from typing import Any

import pytest

from census.cap_configuration import schema as json_schema

contract = importlib.import_module("census.p97_search.cegar_semantic_contract")


ROLES = (
    "SOURCE_DOMAIN",
    "SOURCE_TARGET",
    "ABSTRACT_TARGET",
    "ABSTRACT_VALIDITY",
    "REPRESENTATION",
    "ROOT_FORMULA",
    "R1_SOURCE_COVERAGE",
    "R2_ABSTRACT_ENCODING",
    "R3_ASSIGNMENT_DECODING",
    "FORMULA_TO_DECODER_PROJECTION",
    "DECODER",
    "DECODER_EVIDENCE",
    "LEAN_LIFT",
    "LEAN_CONSUMER",
)

HEX = "a" * 64

EXPECTED_DEPENDENCIES = {
    "SOURCE_DOMAIN": {
        "arm_id_sha256",
        "source_hypothesis_artifact_sha256",
        "source_repository_sha256",
        "source_scope_sha256",
        "source_transitive_source_sha256",
    },
    "SOURCE_TARGET": {
        "arm_id_sha256",
        "query_id_sha256",
        "source_domain_statement_sha256",
        "source_hypothesis_artifact_sha256",
        "source_scope_sha256",
    },
    "ABSTRACT_TARGET": {
        "abstract_schema_artifact_sha256",
        "arm_id_sha256",
        "query_id_sha256",
    },
    "ABSTRACT_VALIDITY": {"abstract_schema_artifact_sha256", "arm_id_sha256"},
    "REPRESENTATION": {
        "abstract_schema_artifact_sha256",
        "arm_id_sha256",
        "source_domain_statement_sha256",
        "source_scope_sha256",
    },
    "ROOT_FORMULA": {
        "abstract_schema_artifact_sha256",
        "abstract_target_statement_sha256",
        "arm_id_sha256",
        "formula_schema_sha256",
        "root_formula_sha256",
        "variable_map_sha256",
    },
    "FORMULA_TO_DECODER_PROJECTION": {
        "arm_id_sha256",
        "formula_schema_sha256",
        "root_formula_sha256",
        "semantic_projection_sha256",
        "variable_map_sha256",
    },
    "DECODER": {
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "decoder_input_domain_schema_artifact_sha256",
        "semantic_projection_sha256",
    },
    "DECODER_EVIDENCE": {
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "decoder_input_domain_schema_artifact_sha256",
        "decoder_statement_sha256",
        "semantic_projection_sha256",
    },
    "R1_SOURCE_COVERAGE": {
        "abstract_schema_artifact_sha256",
        "abstract_target_statement_sha256",
        "abstract_validity_statement_sha256",
        "arm_id_sha256",
        "representation_statement_sha256",
        "source_domain_statement_sha256",
        "source_hypothesis_artifact_sha256",
        "source_scope_sha256",
        "source_target_statement_sha256",
    },
    "R2_ABSTRACT_ENCODING": {
        "abstract_schema_artifact_sha256",
        "abstract_target_statement_sha256",
        "abstract_validity_statement_sha256",
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "decoder_input_domain_schema_artifact_sha256",
        "decoder_statement_sha256",
        "formula_schema_sha256",
        "root_formula_sha256",
        "semantic_projection_sha256",
        "variable_map_sha256",
    },
    "R3_ASSIGNMENT_DECODING": {
        "abstract_schema_artifact_sha256",
        "abstract_target_statement_sha256",
        "abstract_validity_statement_sha256",
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "decoder_evidence_statement_sha256",
        "decoder_input_domain_schema_artifact_sha256",
        "decoder_statement_sha256",
        "formula_schema_sha256",
        "root_formula_sha256",
        "semantic_projection_sha256",
        "variable_map_sha256",
    },
    "LEAN_LIFT": {
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "formula_schema_sha256",
        "r1_statement_sha256",
        "r2_statement_sha256",
        "r3_statement_sha256",
        "root_formula_sha256",
        "source_scope_sha256",
    },
    "LEAN_CONSUMER": {
        "arm_id_sha256",
        "lean_lift_statement_sha256",
        "query_polarity_sha256",
        "source_target_statement_sha256",
    },
}

ROLE_LOCATIONS = {
    "SOURCE_DOMAIN": ("source", "source_requirement"),
    "SOURCE_TARGET": ("query", "source_target_requirement"),
    "ABSTRACT_TARGET": ("query", "abstract_target_requirement"),
    "ABSTRACT_VALIDITY": ("abstract_domain", "validity_requirement"),
    "REPRESENTATION": ("abstract_domain", "representation_requirement"),
    "ROOT_FORMULA": ("encoding", "root_formula_requirement"),
    "FORMULA_TO_DECODER_PROJECTION": (
        "encoding",
        "formula_to_decoder_projection_requirement",
    ),
    "DECODER": ("encoding", "decoder_requirement"),
    "DECODER_EVIDENCE": ("encoding", "decoder_evidence_requirement"),
    "R1_SOURCE_COVERAGE": ("root_obligations", "r1", "producer_requirement"),
    "R2_ABSTRACT_ENCODING": ("root_obligations", "r2", "producer_requirement"),
    "R3_ASSIGNMENT_DECODING": ("root_obligations", "r3", "producer_requirement"),
    "LEAN_LIFT": ("consumer", "lean_lift_requirement"),
    "LEAN_CONSUMER": ("consumer", "lean_consumer_requirement"),
}

OBLIGATION_SEMANTICS = {
    "r1": (
        "R1_SOURCE_COVERAGE",
        "FOR_EVERY_SOURCE_TARGET",
        "VALID_ABSTRACT_TARGET_WITH_REPRESENTS",
    ),
    "r2": (
        "R2_ABSTRACT_ENCODING",
        "FOR_EVERY_VALID_ABSTRACT_TARGET",
        "TOTAL_ROOT_ASSIGNMENT_SATISFYING_FORMULA_AND_DECODING_SAME_OBJECT",
    ),
    "r3": (
        "R3_ASSIGNMENT_DECODING",
        "FOR_EVERY_TOTAL_SATISFYING_ROOT_ASSIGNMENT",
        "CANONICAL_DECODE_IS_VALID_ABSTRACT_TARGET",
    ),
}


def _spec(role: str, *, external: bool = True) -> dict[str, Any]:
    producer: dict[str, Any]
    if external:
        producer = {
            "kind": "EXTERNAL_CHECKER",
            "registry_id": f"synthetic.{role.lower()}",
            "executable_sha256": HEX,
        }
        toolchain_kind = "EXTERNAL"
    else:
        producer = {
            "kind": "LEAN_DECLARATION",
            "qualified_name": f"Synthetic.{role.title().replace('_', '')}",
        }
        toolchain_kind = "LEAN"
    return {
        "producer": producer,
        "normalized_statement_sha256": HEX,
        "hypothesis_sha256": "b" * 64,
        "import_sha256": "c" * 64,
        "transitive_source_sha256": "d" * 64,
        "repository_policy_sha256": "e" * 64,
        "toolchain": {"kind": toolchain_kind, "identity_sha256": "f" * 64},
        "trust_classification": "SYNTHETIC_CHECKED",
        "validation_receipt_schema": "synthetic-receipt/v1",
        "reachability_policy_sha256": "1" * 64,
    }


def _requirements(*, final: bool = True) -> dict[str, Any]:
    result = {role: _spec(role) for role in ROLES[:12]}
    result["LEAN_LIFT"] = _spec("LEAN_LIFT", external=False) if final else None
    result["LEAN_CONSUMER"] = _spec("LEAN_CONSUMER", external=False) if final else None
    return result


def _input(
    *, scope_kind: str = "FINITE_CARDINALITY", cardinality: int | None = 6
) -> dict[str, Any]:
    return {
        "arm_id": "synthetic-arm",
        "source": {
            "hypothesis_artifact_sha256": "2" * 64,
            "scope": {
                "scope_id": "card-6",
                "kind": scope_kind,
                "cardinality": cardinality,
            },
            "repository": {
                "revision": "1" * 40,
                "dirty_state": "CLEAN",
                "dirty_state_sha256": None,
            },
            "transitive_source_sha256": "3" * 64,
        },
        "query": {
            "query_id": "synthetic-query",
            "aggregate_arm_ids": [],
        },
        "abstract_domain": {
            "schema": "synthetic-abstract/v1",
            "schema_artifact_sha256": "4" * 64,
        },
        "encoding": {
            "formula_schema": "synthetic-formula/v1",
            "root_formula_sha256": "5" * 64,
            "variable_map_sha256": "6" * 64,
            "decoder_mode": contract.DECODER_MODE,
            "decoder_input_domain": {
                "schema": "synthetic-decoder-input/v1",
                "schema_artifact_sha256": "7" * 64,
            },
            "semantic_projection_sha256": "8" * 64,
            "decoded_object_identity": {"identity_policy_sha256": "9" * 64},
        },
        "consumer": {"query_polarity": "UNSAT_MEANS_OBSTRUCTION"},
        "producer_requirements": _requirements(),
    }


def _build(**kwargs: Any) -> dict[str, Any]:
    value = _input(**kwargs)
    return contract.build_contract_input(
        arm_id=value["arm_id"],
        source=value["source"],
        query=value["query"],
        abstract_domain=value["abstract_domain"],
        encoding=value["encoding"],
        consumer=value["consumer"],
        producer_requirements=value["producer_requirements"],
    )


def _rehash(value: dict[str, Any]) -> None:
    unsigned = copy.deepcopy(value)
    unsigned.pop("contract_input_sha256", None)
    unsigned.pop("contract_id", None)
    value["contract_id"] = hashlib.sha256(
        json_schema.canonical_json_bytes(unsigned)
    ).hexdigest()
    unsigned["contract_id"] = value["contract_id"]
    value["contract_input_sha256"] = hashlib.sha256(
        json_schema.canonical_json_bytes(unsigned)
    ).hexdigest()


def _rehash_nested(value: dict[str, Any]) -> None:
    """Recompute nested self hashes while preserving the two top hashes."""
    for role in ROLES:
        node = value.get(role)
        if isinstance(node, dict) and "requirement_sha256" in node:
            unsigned = copy.deepcopy(node)
            unsigned.pop("requirement_sha256", None)
            node["requirement_sha256"] = hashlib.sha256(
                json_schema.canonical_json_bytes(unsigned)
            ).hexdigest()
    obligations = value.get("root_obligations")
    if isinstance(obligations, dict):
        for node in obligations.values():
            if isinstance(node, dict) and "obligation_sha256" in node:
                unsigned = copy.deepcopy(node)
                unsigned.pop("obligation_sha256", None)
                node["obligation_sha256"] = hashlib.sha256(
                    json_schema.canonical_json_bytes(unsigned)
                ).hexdigest()
    _rehash(value)


def _set_path(value: dict[str, Any], path: tuple[str, ...], replacement: Any) -> None:
    target: Any = value
    for component in path[:-1]:
        target = target[component]
    target[path[-1]] = replacement


def test_builder_freezes_draft_shape_and_role_placements() -> None:
    value = _build()
    assert set(value) == {
        "schema",
        "status",
        "authoritative_schema",
        "producer_ref_schema",
        "contract_id",
        "arm_id",
        "source",
        "query",
        "abstract_domain",
        "encoding",
        "consumer",
        "root_obligations",
        "contract_input_sha256",
    }
    assert value["schema"] == contract.INPUT_SCHEMA
    assert value["status"] == contract.STATUS
    assert value["authoritative_schema"] == contract.AUTHORITATIVE_SCHEMA
    assert value["producer_ref_schema"] == contract.PRODUCER_REF_SCHEMA
    contract.validate_contract_input(value)
    assert value == _build()


def test_builder_adds_closed_bindings_and_hashes() -> None:
    value = _build()
    assert len(value["contract_id"]) == 64
    assert len(value["contract_input_sha256"]) == 64
    contract.validate_contract_input(value)


def test_top_hashes_use_the_frozen_distinct_preimages() -> None:
    value = _build()
    identity = copy.deepcopy(value)
    contract_id = identity.pop("contract_id")
    identity.pop("contract_input_sha256")
    assert (
        hashlib.sha256(json_schema.canonical_json_bytes(identity)).hexdigest()
        == contract_id
    )
    unsigned = copy.deepcopy(value)
    self_hash = unsigned.pop("contract_input_sha256")
    assert (
        hashlib.sha256(json_schema.canonical_json_bytes(unsigned)).hexdigest()
        == self_hash
    )


def test_all_roles_have_exact_closed_locations_and_dependency_bindings() -> None:
    value = _build()
    for role, location in ROLE_LOCATIONS.items():
        node: Any = value
        for component in location:
            node = node[component]
        assert node is not None, role
        assert node["role"] == role
        assert [item["name"] for item in node["dependency_bindings"]] == sorted(
            EXPECTED_DEPENDENCIES[role]
        )
        assert {
            item["name"] for item in node["dependency_bindings"]
        } == EXPECTED_DEPENDENCIES[role]
        # dependency_bindings is intentionally the future producer-ref/v1
        # input_digests list, with the same canonical input-name vocabulary.
        assert all(
            re.fullmatch(r"[a-z0-9][a-z0-9_.-]{0,127}", item["name"])
            for item in node["dependency_bindings"]
        )


def test_requirement_and_obligation_hashes_use_only_their_own_self_field() -> None:
    value = _build()
    for location in ROLE_LOCATIONS.values():
        node: Any = value
        for component in location:
            node = node[component]
        if node is None:
            continue
        unsigned = copy.deepcopy(node)
        self_hash = unsigned.pop("requirement_sha256")
        assert (
            hashlib.sha256(json_schema.canonical_json_bytes(unsigned)).hexdigest()
            == self_hash
        )
    for key, obligation in value["root_obligations"].items():
        unsigned = copy.deepcopy(obligation)
        self_hash = unsigned.pop("obligation_sha256")
        assert (
            hashlib.sha256(json_schema.canonical_json_bytes(unsigned)).hexdigest()
            == self_hash
        ), key


def test_root_obligations_have_frozen_tokens_and_matching_role_bindings() -> None:
    value = _build()
    for key, (role, quantifier, conclusion) in OBLIGATION_SEMANTICS.items():
        obligation = value["root_obligations"][key]
        assert set(obligation) == {
            "schema",
            "role",
            "quantifier",
            "conclusion",
            "producer_requirement",
            "bindings",
            "obligation_sha256",
        }
        assert obligation["schema"] == "p97-cegar-root-obligation/v1"
        assert obligation["role"] == role
        assert obligation["quantifier"] == quantifier
        assert obligation["conclusion"] == conclusion
        assert (
            obligation["bindings"]
            == obligation["producer_requirement"]["dependency_bindings"]
        )
        assert [item["name"] for item in obligation["bindings"]] == sorted(
            EXPECTED_DEPENDENCIES[role]
        )


@pytest.mark.parametrize(
    ("kwargs", "message"),
    [
        ({"scope_kind": "FINITE_CARDINALITY", "cardinality": None}, "cardinality"),
        ({"scope_kind": "UNIVERSAL", "cardinality": 6}, "cardinality"),
        ({"scope_kind": "FINITE_CARDINALITY", "cardinality": 0}, "positive"),
        ({"scope_kind": "FINITE_CARDINALITY", "cardinality": -1}, "positive"),
    ],
)
def test_scope_invariants_are_enforced(kwargs: dict[str, Any], message: str) -> None:
    with pytest.raises(contract.SemanticContractError, match=message):
        _build(**kwargs)


def test_universal_scope_has_null_cardinality() -> None:
    value = _build(scope_kind="UNIVERSAL", cardinality=None)
    contract.validate_contract_input(value)
    assert value["source"]["scope"]["cardinality"] is None


def test_aggregate_arm_coverage_is_rejected_in_v1() -> None:
    value = _input()
    value["query"]["aggregate_arm_ids"] = ["other-arm"]
    with pytest.raises(contract.SemanticContractError, match="aggregate"):
        contract.build_contract_input(
            arm_id=value["arm_id"],
            source=value["source"],
            query=value["query"],
            abstract_domain=value["abstract_domain"],
            encoding=value["encoding"],
            consumer=value["consumer"],
            producer_requirements=value["producer_requirements"],
        )


def test_non_null_aggregate_requirement_is_rejected_even_with_empty_arm_list() -> None:
    value = _build()
    value["query"]["aggregate_coverage_requirement"] = copy.deepcopy(
        value["query"]["source_target_requirement"]
    )
    _rehash(value)
    with pytest.raises(contract.SemanticContractError, match="aggregate"):
        contract.validate_contract_input(value)


def test_final_requirement_pair_is_both_null_or_both_present() -> None:
    value = _input()
    value["producer_requirements"]["LEAN_LIFT"] = None
    with pytest.raises(contract.SemanticContractError, match="LEAN_LIFT|LEAN_CONSUMER"):
        contract.build_contract_input(
            arm_id=value["arm_id"],
            source=value["source"],
            query=value["query"],
            abstract_domain=value["abstract_domain"],
            encoding=value["encoding"],
            consumer=value["consumer"],
            producer_requirements=value["producer_requirements"],
        )


def test_final_requirement_pair_may_both_be_null() -> None:
    value = _input()
    value["producer_requirements"]["LEAN_LIFT"] = None
    value["producer_requirements"]["LEAN_CONSUMER"] = None
    result = contract.build_contract_input(
        arm_id=value["arm_id"],
        source=value["source"],
        query=value["query"],
        abstract_domain=value["abstract_domain"],
        encoding=value["encoding"],
        consumer=value["consumer"],
        producer_requirements=value["producer_requirements"],
    )
    assert result["consumer"]["lean_lift_requirement"] is None
    assert result["consumer"]["lean_consumer_requirement"] is None
    contract.validate_contract_input(result)


@pytest.mark.parametrize(
    ("path", "replacement"),
    [
        (("encoding", "formula_schema"), "other-formula/v1"),
        (
            ("encoding", "decoder_input_domain", "schema_artifact_sha256"),
            "0" * 64,
        ),
    ],
)
def test_formula_and_decoder_domain_identity_substitution_breaks_bindings(
    path: tuple[str, ...], replacement: str
) -> None:
    value = _build()
    _set_path(value, path, replacement)
    _rehash(value)
    with pytest.raises(contract.SemanticContractError, match="bindings"):
        contract.validate_contract_input(value)


@pytest.mark.parametrize(
    "path",
    [
        ("schema",),
        ("status",),
        ("authoritative_schema",),
        ("producer_ref_schema",),
        ("arm_id",),
        ("source", "scope", "kind"),
        ("query", "query_id"),
        ("encoding", "root_formula_sha256"),
        ("consumer", "query_polarity"),
        ("contract_input_sha256",),
    ],
)
def test_top_level_tampering_is_not_hidden_by_rehash(path: tuple[str, ...]) -> None:
    value = _build()
    original = value[path[0]] if len(path) == 1 else None
    _set_path(value, path, "tampered" if path != ("contract_input_sha256",) else HEX)
    if path != ("contract_input_sha256",):
        _rehash(value)
    with pytest.raises(contract.SemanticContractError):
        contract.validate_contract_input(value)
    assert (
        original is None
        or value[path[0]] != original
        or path == ("contract_input_sha256",)
    )


def test_requirement_pointer_swaps_are_rejected_after_full_rehash() -> None:
    value = _build()
    source_requirement = value["source"]["source_requirement"]
    target_requirement = value["query"]["source_target_requirement"]
    value["source"]["source_requirement"] = target_requirement
    value["query"]["source_target_requirement"] = source_requirement
    _rehash(value)
    with pytest.raises(contract.SemanticContractError):
        contract.validate_contract_input(value)


def test_root_obligation_role_swaps_are_rejected_after_full_rehash() -> None:
    value = _build()
    obligation = value["root_obligations"]["r1"]
    obligation["role"] = "R2_ABSTRACT_ENCODING"
    unsigned = copy.deepcopy(obligation)
    unsigned.pop("obligation_sha256")
    obligation["obligation_sha256"] = hashlib.sha256(
        json_schema.canonical_json_bytes(unsigned)
    ).hexdigest()
    _rehash(value)
    with pytest.raises(contract.SemanticContractError):
        contract.validate_contract_input(value)


def test_invalid_nested_self_hash_and_cross_binding_mutations_are_rejected() -> None:
    value = _build()
    value["root_obligations"]["r1"]["obligation_sha256"] = value[
        "contract_input_sha256"
    ]
    _rehash(value)
    with pytest.raises(contract.SemanticContractError):
        contract.validate_contract_input(value)

    value = _build()
    value["root_obligations"]["r2"]["bindings"] = []
    _rehash_nested(value)
    with pytest.raises(contract.SemanticContractError):
        contract.validate_contract_input(value)


def test_explicit_cycle_guard_rejects_a_reachable_hash_fixed_point(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    cycle_hash = "0" * 64
    monkeypatch.setattr(contract, "_canonical_sha256", lambda _value: cycle_hash)
    value = _input()
    value["source"]["hypothesis_artifact_sha256"] = cycle_hash
    with pytest.raises(contract.SemanticContractError, match="cycle"):
        contract.build_contract_input(
            arm_id=value["arm_id"],
            source=value["source"],
            query=value["query"],
            abstract_domain=value["abstract_domain"],
            encoding=value["encoding"],
            consumer=value["consumer"],
            producer_requirements=value["producer_requirements"],
        )


def test_canonical_bytes_and_parser_reject_noncanonical_forms() -> None:
    value = _build()
    payload = contract.canonical_contract_input_bytes(value)
    assert payload.endswith(b"\n")
    assert payload == contract.canonical_contract_input_bytes(value)
    assert contract.parse_contract_input_bytes(payload) == value
    with pytest.raises(contract.SemanticContractError):
        contract.parse_contract_input_bytes(payload[:-1])
    with pytest.raises(contract.SemanticContractError):
        contract.parse_contract_input_bytes(payload.replace(b"\n", b"\r\n"))
    with pytest.raises(contract.SemanticContractError):
        contract.parse_contract_input_bytes(b'{"status":"DRAFT_NOT_AUTHORITATIVE"}\n')

    duplicate_schema = (
        b'{"schema":"p97-cegar-semantic-contract-input/v1",' + payload[1:]
    )
    with pytest.raises(contract.SemanticContractError):
        contract.parse_contract_input_bytes(duplicate_schema)


def test_explicit_authority_and_support_flags_are_rejected() -> None:
    for field, replacement in (
        ("verified", True),
        ("supports_source_promotion", True),
        ("authority", "ACCEPTED"),
        ("producer_ref", {"verified": True}),
    ):
        value = _build()
        value[field] = replacement
        with pytest.raises(contract.SemanticContractError):
            contract.validate_contract_input(value)


def test_publication_is_create_once_and_rejects_links(tmp_path: Path) -> None:
    value = _build()
    destination = tmp_path / "contract.json"
    contract.publish_contract_input(destination, value)
    assert contract.load_contract_input(destination) == value
    with pytest.raises(contract.SemanticContractError):
        contract.publish_contract_input(destination, value)

    symlink = tmp_path / "symlink.json"
    symlink.symlink_to(destination)
    with pytest.raises(contract.SemanticContractError):
        contract.publish_contract_input(symlink, value)

    hardlink = tmp_path / "hardlink.json"
    os.link(destination, hardlink)
    with pytest.raises(contract.SemanticContractError):
        contract.publish_contract_input(hardlink, value)


@pytest.mark.skipif(not hasattr(os, "mkfifo"), reason="FIFO unavailable")
def test_publication_rejects_fifo(tmp_path: Path) -> None:
    value = _build()
    fifo = tmp_path / "contract.fifo"
    os.mkfifo(fifo)
    with pytest.raises(contract.SemanticContractError):
        contract.publish_contract_input(fifo, value)
    assert stat.S_ISFIFO(fifo.stat().st_mode)


def test_load_rejects_nonregular_and_tampered_receipts(tmp_path: Path) -> None:
    value = _build()
    destination = tmp_path / "contract.json"
    contract.publish_contract_input(destination, value)
    parsed = json.loads(destination.read_text())
    parsed["root_obligations"]["r3"]["conclusion"] = "tampered"
    destination.write_bytes(json_schema.stored_json_bytes(parsed))
    with pytest.raises(contract.SemanticContractError):
        contract.load_contract_input(destination)
