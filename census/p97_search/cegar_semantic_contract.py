"""Immutable Phase-0 inputs for the positive P97 semantic contract.

This module freezes semantic identities and the R1--R3 obligations needed by
the future authoritative contract.  Its output is deliberately a draft input,
not a p97-cegar-semantic-contract/v2 receipt and not semantic authority.
"""

from __future__ import annotations

import os
import re
import stat
from collections.abc import Iterator, Mapping
from pathlib import Path
from typing import Any, NoReturn

from census.cap_configuration import schema as json_schema
from census.p97_search import cegar_producer_ref as custody

INPUT_SCHEMA = "p97-cegar-semantic-contract-input/v1"
AUTHORITATIVE_SCHEMA = "p97-cegar-semantic-contract/v2"
PRODUCER_REF_SCHEMA = "p97-cegar-producer-ref/v1"
ROOT_OBLIGATION_SCHEMA = "p97-cegar-root-obligation/v1"
STATUS = "DRAFT_NOT_AUTHORITATIVE"
DECODER_MODE = "CANONICAL_PROJECTION_FUNCTION"

FINITE_CARDINALITY = "FINITE_CARDINALITY"
UNIVERSAL = "UNIVERSAL"
SCOPE_KINDS = frozenset({FINITE_CARDINALITY, UNIVERSAL})

SAT_MEANS_COUNTEREXAMPLE = "SAT_MEANS_COUNTEREXAMPLE"
UNSAT_MEANS_OBSTRUCTION = "UNSAT_MEANS_OBSTRUCTION"
QUERY_POLARITIES = frozenset({SAT_MEANS_COUNTEREXAMPLE, UNSAT_MEANS_OBSTRUCTION})

LEAN_DECLARATION = "LEAN_DECLARATION"
EXTERNAL_CHECKER = "EXTERNAL_CHECKER"
PRODUCER_KINDS = frozenset({LEAN_DECLARATION, EXTERNAL_CHECKER})
LEAN_TOOLCHAIN = "LEAN"
EXTERNAL_TOOLCHAIN = "EXTERNAL"

SOURCE_DOMAIN = "SOURCE_DOMAIN"
SOURCE_TARGET = "SOURCE_TARGET"
ABSTRACT_TARGET = "ABSTRACT_TARGET"
ABSTRACT_VALIDITY = "ABSTRACT_VALIDITY"
REPRESENTATION = "REPRESENTATION"
ROOT_FORMULA = "ROOT_FORMULA"
R1_SOURCE_COVERAGE = "R1_SOURCE_COVERAGE"
R2_ABSTRACT_ENCODING = "R2_ABSTRACT_ENCODING"
R3_ASSIGNMENT_DECODING = "R3_ASSIGNMENT_DECODING"
FORMULA_TO_DECODER_PROJECTION = "FORMULA_TO_DECODER_PROJECTION"
DECODER = "DECODER"
DECODER_EVIDENCE = "DECODER_EVIDENCE"
LEAN_LIFT = "LEAN_LIFT"
LEAN_CONSUMER = "LEAN_CONSUMER"

REQUIRED_ROLES = (
    SOURCE_DOMAIN,
    SOURCE_TARGET,
    ABSTRACT_TARGET,
    ABSTRACT_VALIDITY,
    REPRESENTATION,
    ROOT_FORMULA,
    R1_SOURCE_COVERAGE,
    R2_ABSTRACT_ENCODING,
    R3_ASSIGNMENT_DECODING,
    FORMULA_TO_DECODER_PROJECTION,
    DECODER,
    DECODER_EVIDENCE,
)
OPTIONAL_CONSUMER_ROLES = (LEAN_LIFT, LEAN_CONSUMER)
ALL_ROLES = (*REQUIRED_ROLES, *OPTIONAL_CONSUMER_ROLES)

MAX_DOCUMENT_BYTES = 1024 * 1024
MAX_BINDINGS = 64

_SHA256 = re.compile(r"[0-9a-f]{64}")
_REVISION = re.compile(r"(?:[0-9a-f]{40}|[0-9a-f]{64})")
_ID = re.compile(r"[a-z0-9][a-z0-9_.-]{0,127}")
_INPUT_NAME = re.compile(r"[a-z0-9][a-z0-9_]{0,127}")
_SCHEMA_ID = re.compile(r"[a-z0-9][a-z0-9-]*/v[1-9][0-9]*")
_TOKEN = re.compile(r"[A-Z][A-Z0-9_]{0,127}")
_AUTHORITY_WORDS = ("ACCEPTED", "AUTHORITY", "PROMOTION", "SUCCESS", "VERIFIED")

_TOP_KEYS = frozenset(
    {
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
)
_SOURCE_BASE_KEYS = frozenset(
    {
        "hypothesis_artifact_sha256",
        "scope",
        "repository",
        "transitive_source_sha256",
    }
)
_SOURCE_KEYS = _SOURCE_BASE_KEYS | {"source_requirement"}
_SCOPE_KEYS = frozenset({"scope_id", "kind", "cardinality"})
_REPOSITORY_KEYS = frozenset({"revision", "dirty_state", "dirty_state_sha256"})
_QUERY_BASE_KEYS = frozenset({"query_id", "aggregate_arm_ids"})
_QUERY_KEYS = _QUERY_BASE_KEYS | {
    "source_target_requirement",
    "abstract_target_requirement",
    "aggregate_coverage_requirement",
}
_ABSTRACT_BASE_KEYS = frozenset({"schema", "schema_artifact_sha256"})
_ABSTRACT_KEYS = _ABSTRACT_BASE_KEYS | {
    "validity_requirement",
    "representation_requirement",
}
_ENCODING_BASE_KEYS = frozenset(
    {
        "formula_schema",
        "root_formula_sha256",
        "variable_map_sha256",
        "decoder_mode",
        "decoder_input_domain",
        "semantic_projection_sha256",
        "decoded_object_identity",
    }
)
_ENCODING_KEYS = _ENCODING_BASE_KEYS | {
    "root_formula_requirement",
    "formula_to_decoder_projection_requirement",
    "decoder_requirement",
    "decoder_evidence_requirement",
}
_DECODER_DOMAIN_KEYS = frozenset({"schema", "schema_artifact_sha256"})
_DECODED_IDENTITY_KEYS = frozenset({"identity_policy_sha256"})
_CONSUMER_BASE_KEYS = frozenset({"query_polarity"})
_CONSUMER_KEYS = _CONSUMER_BASE_KEYS | {
    "lean_lift_requirement",
    "lean_consumer_requirement",
}
_REQUIREMENT_SPEC_KEYS = frozenset(
    {
        "producer",
        "normalized_statement_sha256",
        "hypothesis_sha256",
        "import_sha256",
        "transitive_source_sha256",
        "repository_policy_sha256",
        "toolchain",
        "trust_classification",
        "validation_receipt_schema",
        "reachability_policy_sha256",
    }
)
_REQUIREMENT_KEYS = _REQUIREMENT_SPEC_KEYS | {
    "role",
    "dependency_bindings",
    "requirement_sha256",
}
_BINDING_KEYS = frozenset({"name", "sha256"})
_TOOLCHAIN_KEYS = frozenset({"kind", "identity_sha256"})
_ROOT_KEYS = frozenset({"r1", "r2", "r3"})
_OBLIGATION_KEYS = frozenset(
    {
        "schema",
        "role",
        "quantifier",
        "conclusion",
        "producer_requirement",
        "bindings",
        "obligation_sha256",
    }
)

_ROLE_DEPENDENCIES: dict[str, tuple[str, ...]] = {
    SOURCE_DOMAIN: (
        "arm_id_sha256",
        "source_hypothesis_artifact_sha256",
        "source_repository_sha256",
        "source_scope_sha256",
        "source_transitive_source_sha256",
    ),
    SOURCE_TARGET: (
        "arm_id_sha256",
        "query_id_sha256",
        "source_domain_statement_sha256",
        "source_hypothesis_artifact_sha256",
        "source_scope_sha256",
    ),
    ABSTRACT_TARGET: (
        "abstract_schema_artifact_sha256",
        "arm_id_sha256",
        "query_id_sha256",
    ),
    ABSTRACT_VALIDITY: ("abstract_schema_artifact_sha256", "arm_id_sha256"),
    REPRESENTATION: (
        "abstract_schema_artifact_sha256",
        "arm_id_sha256",
        "source_domain_statement_sha256",
        "source_scope_sha256",
    ),
    ROOT_FORMULA: (
        "abstract_schema_artifact_sha256",
        "abstract_target_statement_sha256",
        "arm_id_sha256",
        "formula_schema_sha256",
        "root_formula_sha256",
        "variable_map_sha256",
    ),
    FORMULA_TO_DECODER_PROJECTION: (
        "arm_id_sha256",
        "formula_schema_sha256",
        "root_formula_sha256",
        "semantic_projection_sha256",
        "variable_map_sha256",
    ),
    DECODER: (
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "decoder_input_domain_schema_artifact_sha256",
        "semantic_projection_sha256",
    ),
    DECODER_EVIDENCE: (
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "decoder_input_domain_schema_artifact_sha256",
        "decoder_statement_sha256",
        "semantic_projection_sha256",
    ),
    R1_SOURCE_COVERAGE: (
        "abstract_schema_artifact_sha256",
        "abstract_target_statement_sha256",
        "abstract_validity_statement_sha256",
        "arm_id_sha256",
        "representation_statement_sha256",
        "source_domain_statement_sha256",
        "source_hypothesis_artifact_sha256",
        "source_scope_sha256",
        "source_target_statement_sha256",
    ),
    R2_ABSTRACT_ENCODING: (
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
    ),
    R3_ASSIGNMENT_DECODING: (
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
    ),
    LEAN_LIFT: (
        "arm_id_sha256",
        "decoded_object_identity_sha256",
        "formula_schema_sha256",
        "r1_statement_sha256",
        "r2_statement_sha256",
        "r3_statement_sha256",
        "root_formula_sha256",
        "source_scope_sha256",
    ),
    LEAN_CONSUMER: (
        "arm_id_sha256",
        "lean_lift_statement_sha256",
        "query_polarity_sha256",
        "source_target_statement_sha256",
    ),
}

_OBLIGATION_SEMANTICS = {
    "r1": (
        R1_SOURCE_COVERAGE,
        "FOR_EVERY_SOURCE_TARGET",
        "VALID_ABSTRACT_TARGET_WITH_REPRESENTS",
    ),
    "r2": (
        R2_ABSTRACT_ENCODING,
        "FOR_EVERY_VALID_ABSTRACT_TARGET",
        "TOTAL_ROOT_ASSIGNMENT_SATISFYING_FORMULA_AND_DECODING_SAME_OBJECT",
    ),
    "r3": (
        R3_ASSIGNMENT_DECODING,
        "FOR_EVERY_TOTAL_SATISFYING_ROOT_ASSIGNMENT",
        "CANONICAL_DECODE_IS_VALID_ABSTRACT_TARGET",
    ),
}


class SemanticContractError(ValueError):
    """A semantic-contract input violated its non-authoritative identity rules."""


def _fail(message: str) -> NoReturn:
    raise SemanticContractError(message)


def _exact(value: Any, keys: frozenset[str], path: str) -> dict[str, Any]:
    if type(value) is not dict:
        _fail(f"{path} must be an object")
    if any(type(key) is not str for key in value):
        _fail(f"{path} has a non-string object key")
    try:
        return json_schema.exact_keys(value, keys, path)
    except json_schema.CapConfigurationSchemaError as exc:
        raise SemanticContractError(str(exc)) from exc


def _list(value: Any, path: str) -> list[Any]:
    try:
        return json_schema.exact_list(value, path)
    except json_schema.CapConfigurationSchemaError as exc:
        raise SemanticContractError(str(exc)) from exc


def _copy(value: Any, path: str) -> dict[str, Any]:
    if not isinstance(value, Mapping):
        _fail(f"{path} must be a mapping")
    try:
        result = dict(value)
    except (TypeError, ValueError) as exc:
        raise SemanticContractError(f"{path} cannot be copied") from exc
    if any(type(key) is not str for key in result):
        _fail(f"{path} has a non-string object key")
    return result


def _text(value: Any, path: str, maximum_bytes: int = 1_024) -> str:
    try:
        result = json_schema.canonical_text(value, path)
    except json_schema.CapConfigurationSchemaError as exc:
        raise SemanticContractError(str(exc)) from exc
    if len(result.encode("utf-8")) > maximum_bytes:
        _fail(f"{path} is too long")
    return result


def _sha256(value: Any, path: str) -> str:
    if type(value) is not str or _SHA256.fullmatch(value) is None:
        _fail(f"{path} must be a lowercase SHA-256 digest")
    return value


def _id(value: Any, path: str) -> str:
    if type(value) is not str or _ID.fullmatch(value) is None:
        _fail(f"{path} must be a canonical identifier")
    return value


def _schema_id(value: Any, path: str) -> str:
    if type(value) is not str or _SCHEMA_ID.fullmatch(value) is None:
        _fail(f"{path} must be a versioned schema identifier")
    return value


def _token(value: Any, path: str, *, authority_safe: bool = False) -> str:
    if type(value) is not str or _TOKEN.fullmatch(value) is None:
        _fail(f"{path} must be a canonical uppercase token")
    if authority_safe and any(word in value for word in _AUTHORITY_WORDS):
        _fail(f"{path} contains an authority-like token")
    return value


def _canonical_sha256(value: Any) -> str:
    try:
        return json_schema.raw_sha256(json_schema.canonical_json_bytes(value))
    except json_schema.CapConfigurationSchemaError as exc:
        raise SemanticContractError(str(exc)) from exc


def _self_hashed(unsigned: Mapping[str, Any], field: str) -> dict[str, Any]:
    result = dict(unsigned)
    result[field] = _canonical_sha256(unsigned)
    return result


def _validate_scope(value: Any) -> None:
    scope = _exact(value, _SCOPE_KEYS, "contract_input.source.scope")
    _id(scope["scope_id"], "contract_input.source.scope.scope_id")
    kind = scope["kind"]
    if kind not in SCOPE_KINDS:
        _fail("contract_input.source.scope.kind is not supported")
    cardinality = scope["cardinality"]
    if kind == FINITE_CARDINALITY:
        if type(cardinality) is not int or cardinality <= 0:
            _fail("finite source scope requires a positive cardinality")
    elif cardinality is not None:
        _fail("universal source scope requires null cardinality")


def _validate_repository(value: Any) -> None:
    repository = _exact(value, _REPOSITORY_KEYS, "contract_input.source.repository")
    revision = repository["revision"]
    if type(revision) is not str or _REVISION.fullmatch(revision) is None:
        _fail("contract_input.source.repository.revision is not canonical")
    state = repository["dirty_state"]
    digest = repository["dirty_state_sha256"]
    if state == "CLEAN":
        if digest is not None:
            _fail("clean source repository requires null dirty-state digest")
    elif state == "DIRTY":
        _sha256(digest, "contract_input.source.repository.dirty_state_sha256")
    else:
        _fail("contract_input.source.repository.dirty_state is not supported")


def _validate_source_base(value: Any) -> dict[str, Any]:
    source = _exact(value, _SOURCE_BASE_KEYS, "source")
    _sha256(source["hypothesis_artifact_sha256"], "source.hypothesis_artifact_sha256")
    _validate_scope(source["scope"])
    _validate_repository(source["repository"])
    _sha256(source["transitive_source_sha256"], "source.transitive_source_sha256")
    return source


def _validate_query_base(value: Any) -> dict[str, Any]:
    query = _exact(value, _QUERY_BASE_KEYS, "query")
    _id(query["query_id"], "query.query_id")
    arm_ids = _list(query["aggregate_arm_ids"], "query.aggregate_arm_ids")
    if arm_ids:
        _fail("contract-input v1 forbids aggregate coverage")
    return query


def _validate_abstract_base(value: Any) -> dict[str, Any]:
    domain = _exact(value, _ABSTRACT_BASE_KEYS, "abstract_domain")
    _schema_id(domain["schema"], "abstract_domain.schema")
    _sha256(domain["schema_artifact_sha256"], "abstract_domain.schema_artifact_sha256")
    return domain


def _validate_encoding_base(value: Any) -> dict[str, Any]:
    encoding = _exact(value, _ENCODING_BASE_KEYS, "encoding")
    _schema_id(encoding["formula_schema"], "encoding.formula_schema")
    _sha256(encoding["root_formula_sha256"], "encoding.root_formula_sha256")
    _sha256(encoding["variable_map_sha256"], "encoding.variable_map_sha256")
    if encoding["decoder_mode"] != DECODER_MODE:
        _fail(f"encoding.decoder_mode must be {DECODER_MODE}")
    decoder_domain = _exact(
        encoding["decoder_input_domain"],
        _DECODER_DOMAIN_KEYS,
        "encoding.decoder_input_domain",
    )
    _schema_id(decoder_domain["schema"], "encoding.decoder_input_domain.schema")
    _sha256(
        decoder_domain["schema_artifact_sha256"],
        "encoding.decoder_input_domain.schema_artifact_sha256",
    )
    _sha256(
        encoding["semantic_projection_sha256"],
        "encoding.semantic_projection_sha256",
    )
    identity = _exact(
        encoding["decoded_object_identity"],
        _DECODED_IDENTITY_KEYS,
        "encoding.decoded_object_identity",
    )
    _sha256(
        identity["identity_policy_sha256"],
        "encoding.decoded_object_identity.identity_policy_sha256",
    )
    return encoding


def _validate_consumer_base(value: Any) -> dict[str, Any]:
    consumer = _exact(value, _CONSUMER_BASE_KEYS, "consumer")
    if consumer["query_polarity"] not in QUERY_POLARITIES:
        _fail("consumer.query_polarity is not supported")
    return consumer


def _validate_producer(value: Any, path: str) -> str:
    if type(value) is not dict:
        _fail(f"{path} must be an object")
    kind = value.get("kind")
    keys = (
        frozenset({"kind", "qualified_name"})
        if kind == LEAN_DECLARATION
        else frozenset({"kind", "registry_id", "executable_sha256"})
    )
    producer = _exact(value, keys, path)
    if kind == LEAN_DECLARATION:
        _text(producer["qualified_name"], f"{path}.qualified_name")
    elif kind == EXTERNAL_CHECKER:
        _id(producer["registry_id"], f"{path}.registry_id")
        _sha256(producer["executable_sha256"], f"{path}.executable_sha256")
    else:
        _fail(f"{path}.kind is not a supported producer kind")
    return kind


def _validate_requirement_spec(value: Any, path: str) -> dict[str, Any]:
    requirement = _exact(value, _REQUIREMENT_SPEC_KEYS, path)
    producer_kind = _validate_producer(requirement["producer"], f"{path}.producer")
    for field in (
        "normalized_statement_sha256",
        "hypothesis_sha256",
        "import_sha256",
        "transitive_source_sha256",
        "repository_policy_sha256",
        "reachability_policy_sha256",
    ):
        _sha256(requirement[field], f"{path}.{field}")
    toolchain = _exact(requirement["toolchain"], _TOOLCHAIN_KEYS, f"{path}.toolchain")
    expected_toolchain = (
        LEAN_TOOLCHAIN if producer_kind == LEAN_DECLARATION else EXTERNAL_TOOLCHAIN
    )
    if toolchain["kind"] != expected_toolchain:
        _fail(f"{path}.toolchain.kind does not match the producer kind")
    _sha256(toolchain["identity_sha256"], f"{path}.toolchain.identity_sha256")
    _token(
        requirement["trust_classification"],
        f"{path}.trust_classification",
        authority_safe=True,
    )
    _schema_id(
        requirement["validation_receipt_schema"],
        f"{path}.validation_receipt_schema",
    )
    return requirement


def _bindings(value: Mapping[str, str]) -> list[dict[str, str]]:
    return [{"name": name, "sha256": value[name]} for name in sorted(value)]


def _validate_bindings(value: Any, path: str) -> dict[str, str]:
    bindings = _list(value, path)
    if len(bindings) > MAX_BINDINGS:
        _fail(f"{path} has too many entries")
    result: dict[str, str] = {}
    names: list[str] = []
    for index, raw in enumerate(bindings):
        binding = _exact(raw, _BINDING_KEYS, f"{path}[{index}]")
        name = binding["name"]
        if type(name) is not str or _INPUT_NAME.fullmatch(name) is None:
            _fail(f"{path}[{index}].name is not canonical")
        if name in result:
            _fail(f"{path} contains a duplicate binding name")
        result[name] = _sha256(binding["sha256"], f"{path}[{index}].sha256")
        names.append(name)
    if names != sorted(names):
        _fail(f"{path} must be sorted by name")
    return result


def _requirement_spec(value: Mapping[str, Any]) -> dict[str, Any]:
    return {key: value[key] for key in _REQUIREMENT_SPEC_KEYS}


def _build_requirement(
    role: str,
    spec: Mapping[str, Any],
    bindings: Mapping[str, str],
) -> dict[str, Any]:
    base = _validate_requirement_spec(
        _copy(spec, f"producer_requirements.{role}"),
        f"producer_requirements.{role}",
    )
    unsigned = {
        "role": role,
        **base,
        "dependency_bindings": _bindings(bindings),
    }
    return _self_hashed(unsigned, "requirement_sha256")


def _requirement_context(
    arm_id: str,
    source: Mapping[str, Any],
    query: Mapping[str, Any],
    abstract_domain: Mapping[str, Any],
    encoding: Mapping[str, Any],
    consumer: Mapping[str, Any],
    specs: Mapping[str, Mapping[str, Any] | None],
) -> dict[str, str]:
    required = {role: specs[role] for role in REQUIRED_ROLES}
    if any(spec is None for spec in required.values()):
        _fail("all non-consumer producer requirements must be present")
    context = {
        "arm_id_sha256": _canonical_sha256(arm_id),
        "query_id_sha256": _canonical_sha256(query["query_id"]),
        "query_polarity_sha256": _canonical_sha256(consumer["query_polarity"]),
        "source_hypothesis_artifact_sha256": source["hypothesis_artifact_sha256"],
        "source_repository_sha256": _canonical_sha256(source["repository"]),
        "source_scope_sha256": _canonical_sha256(source["scope"]),
        "source_transitive_source_sha256": source["transitive_source_sha256"],
        "abstract_schema_artifact_sha256": abstract_domain["schema_artifact_sha256"],
        "formula_schema_sha256": _canonical_sha256(encoding["formula_schema"]),
        "root_formula_sha256": encoding["root_formula_sha256"],
        "variable_map_sha256": encoding["variable_map_sha256"],
        "decoder_input_domain_schema_artifact_sha256": encoding["decoder_input_domain"][
            "schema_artifact_sha256"
        ],
        "semantic_projection_sha256": encoding["semantic_projection_sha256"],
        "decoded_object_identity_sha256": encoding["decoded_object_identity"][
            "identity_policy_sha256"
        ],
    }
    statement_roles = {
        "source_domain_statement_sha256": SOURCE_DOMAIN,
        "source_target_statement_sha256": SOURCE_TARGET,
        "abstract_target_statement_sha256": ABSTRACT_TARGET,
        "abstract_validity_statement_sha256": ABSTRACT_VALIDITY,
        "representation_statement_sha256": REPRESENTATION,
        "decoder_statement_sha256": DECODER,
        "decoder_evidence_statement_sha256": DECODER_EVIDENCE,
        "r1_statement_sha256": R1_SOURCE_COVERAGE,
        "r2_statement_sha256": R2_ABSTRACT_ENCODING,
        "r3_statement_sha256": R3_ASSIGNMENT_DECODING,
    }
    for name, role in statement_roles.items():
        spec = specs[role]
        if spec is None:
            _fail(f"producer requirement {role} is missing")
        context[name] = spec["normalized_statement_sha256"]
    lift = specs[LEAN_LIFT]
    if lift is not None:
        context["lean_lift_statement_sha256"] = lift["normalized_statement_sha256"]
    return context


def _role_bindings(role: str, context: Mapping[str, str]) -> dict[str, str]:
    try:
        names = _ROLE_DEPENDENCIES[role]
        return {name: context[name] for name in names}
    except KeyError as exc:
        raise SemanticContractError(
            f"cannot construct closed dependency bindings for {role}"
        ) from exc


def _validate_requirements_input(
    value: Any,
) -> dict[str, Mapping[str, Any] | None]:
    requirements = _exact(
        _copy(value, "producer_requirements"),
        frozenset(ALL_ROLES),
        "producer_requirements",
    )
    result: dict[str, Mapping[str, Any] | None] = {}
    for role in REQUIRED_ROLES:
        if requirements[role] is None:
            _fail(f"producer_requirements.{role} must be present")
        result[role] = _validate_requirement_spec(
            _copy(requirements[role], f"producer_requirements.{role}"),
            f"producer_requirements.{role}",
        )
    lift = requirements[LEAN_LIFT]
    consumer = requirements[LEAN_CONSUMER]
    if (lift is None) != (consumer is None):
        _fail("LEAN_LIFT and LEAN_CONSUMER must both be null or both present")
    for role, raw in ((LEAN_LIFT, lift), (LEAN_CONSUMER, consumer)):
        result[role] = (
            None
            if raw is None
            else _validate_requirement_spec(
                _copy(raw, f"producer_requirements.{role}"),
                f"producer_requirements.{role}",
            )
        )
    return result


def _build_obligation(
    key: str,
    requirement: Mapping[str, Any],
    bindings: Mapping[str, str],
) -> dict[str, Any]:
    role, quantifier, conclusion = _OBLIGATION_SEMANTICS[key]
    unsigned = {
        "schema": ROOT_OBLIGATION_SCHEMA,
        "role": role,
        "quantifier": quantifier,
        "conclusion": conclusion,
        "producer_requirement": dict(requirement),
        "bindings": _bindings(bindings),
    }
    return _self_hashed(unsigned, "obligation_sha256")


def _contract_identity_preimage(value: Mapping[str, Any]) -> dict[str, Any]:
    return {
        key: value[key]
        for key in _TOP_KEYS
        if key not in {"contract_id", "contract_input_sha256"}
    }


def _walk_digests(
    value: Any, path: str = "contract_input"
) -> Iterator[tuple[str, str]]:
    if type(value) is dict:
        for key, item in value.items():
            next_path = f"{path}.{key}"
            if type(item) is str and _SHA256.fullmatch(item):
                yield next_path, item
            else:
                yield from _walk_digests(item, next_path)
    elif type(value) is list:
        for index, item in enumerate(value):
            yield from _walk_digests(item, f"{path}[{index}]")


def build_contract_input(
    *,
    arm_id: str,
    source: Mapping[str, Any],
    query: Mapping[str, Any],
    abstract_domain: Mapping[str, Any],
    encoding: Mapping[str, Any],
    consumer: Mapping[str, Any],
    producer_requirements: Mapping[str, Any],
) -> dict[str, Any]:
    """Build an immutable non-authoritative input that states R1--R3 exactly."""

    arm = _id(arm_id, "arm_id")
    source_base = _validate_source_base(_copy(source, "source"))
    query_base = _validate_query_base(_copy(query, "query"))
    abstract_base = _validate_abstract_base(_copy(abstract_domain, "abstract_domain"))
    encoding_base = _validate_encoding_base(_copy(encoding, "encoding"))
    consumer_base = _validate_consumer_base(_copy(consumer, "consumer"))
    specs = _validate_requirements_input(producer_requirements)
    context = _requirement_context(
        arm,
        source_base,
        query_base,
        abstract_base,
        encoding_base,
        consumer_base,
        specs,
    )
    requirements = {
        role: (
            None
            if specs[role] is None
            else _build_requirement(role, specs[role], _role_bindings(role, context))
        )
        for role in ALL_ROLES
    }
    source_stored = {
        **source_base,
        "source_requirement": requirements[SOURCE_DOMAIN],
    }
    query_stored = {
        **query_base,
        "source_target_requirement": requirements[SOURCE_TARGET],
        "abstract_target_requirement": requirements[ABSTRACT_TARGET],
        "aggregate_coverage_requirement": None,
    }
    abstract_stored = {
        **abstract_base,
        "validity_requirement": requirements[ABSTRACT_VALIDITY],
        "representation_requirement": requirements[REPRESENTATION],
    }
    encoding_stored = {
        **encoding_base,
        "root_formula_requirement": requirements[ROOT_FORMULA],
        "formula_to_decoder_projection_requirement": requirements[
            FORMULA_TO_DECODER_PROJECTION
        ],
        "decoder_requirement": requirements[DECODER],
        "decoder_evidence_requirement": requirements[DECODER_EVIDENCE],
    }
    consumer_stored = {
        **consumer_base,
        "lean_lift_requirement": requirements[LEAN_LIFT],
        "lean_consumer_requirement": requirements[LEAN_CONSUMER],
    }
    obligations = {
        key: _build_obligation(
            key,
            requirements[role],
            _role_bindings(role, context),
        )
        for key, (role, _quantifier, _conclusion) in _OBLIGATION_SEMANTICS.items()
    }
    identity = {
        "schema": INPUT_SCHEMA,
        "status": STATUS,
        "authoritative_schema": AUTHORITATIVE_SCHEMA,
        "producer_ref_schema": PRODUCER_REF_SCHEMA,
        "arm_id": arm,
        "source": source_stored,
        "query": query_stored,
        "abstract_domain": abstract_stored,
        "encoding": encoding_stored,
        "consumer": consumer_stored,
        "root_obligations": obligations,
    }
    contract_id = _canonical_sha256(identity)
    unsigned = {**identity, "contract_id": contract_id}
    result = _self_hashed(unsigned, "contract_input_sha256")
    validate_contract_input(result)
    return result


def _collect_stored_requirements(value: Mapping[str, Any]) -> dict[str, Any]:
    return {
        SOURCE_DOMAIN: value["source"]["source_requirement"],
        SOURCE_TARGET: value["query"]["source_target_requirement"],
        ABSTRACT_TARGET: value["query"]["abstract_target_requirement"],
        ABSTRACT_VALIDITY: value["abstract_domain"]["validity_requirement"],
        REPRESENTATION: value["abstract_domain"]["representation_requirement"],
        ROOT_FORMULA: value["encoding"]["root_formula_requirement"],
        FORMULA_TO_DECODER_PROJECTION: value["encoding"][
            "formula_to_decoder_projection_requirement"
        ],
        DECODER: value["encoding"]["decoder_requirement"],
        DECODER_EVIDENCE: value["encoding"]["decoder_evidence_requirement"],
        R1_SOURCE_COVERAGE: value["root_obligations"]["r1"]["producer_requirement"],
        R2_ABSTRACT_ENCODING: value["root_obligations"]["r2"]["producer_requirement"],
        R3_ASSIGNMENT_DECODING: value["root_obligations"]["r3"]["producer_requirement"],
        LEAN_LIFT: value["consumer"]["lean_lift_requirement"],
        LEAN_CONSUMER: value["consumer"]["lean_consumer_requirement"],
    }


def _validate_requirement(
    value: Any,
    *,
    role: str,
    expected_bindings: Mapping[str, str],
    path: str,
) -> dict[str, Any]:
    requirement = _exact(value, _REQUIREMENT_KEYS, path)
    if requirement["role"] != role:
        _fail(f"{path}.role must be {role}")
    spec = _validate_requirement_spec(_requirement_spec(requirement), path)
    bindings = _validate_bindings(
        requirement["dependency_bindings"], f"{path}.dependency_bindings"
    )
    if bindings != dict(expected_bindings):
        _fail(f"{path}.dependency_bindings do not match the contract identity")
    claimed = _sha256(requirement["requirement_sha256"], f"{path}.requirement_sha256")
    unsigned = dict(requirement)
    unsigned.pop("requirement_sha256")
    if claimed != _canonical_sha256(unsigned):
        _fail(f"{path}.requirement_sha256 is invalid")
    expected = _build_requirement(role, spec, expected_bindings)
    if requirement != expected:
        _fail(f"{path} is not the canonical role requirement")
    return requirement


def _validate_obligation(
    value: Any,
    *,
    key: str,
    requirement: Mapping[str, Any],
    bindings: Mapping[str, str],
) -> None:
    path = f"contract_input.root_obligations.{key}"
    obligation = _exact(value, _OBLIGATION_KEYS, path)
    role, quantifier, conclusion = _OBLIGATION_SEMANTICS[key]
    if (
        obligation["schema"] != ROOT_OBLIGATION_SCHEMA
        or obligation["role"] != role
        or obligation["quantifier"] != quantifier
        or obligation["conclusion"] != conclusion
    ):
        _fail(f"{path} has the wrong frozen R1--R3 semantics")
    if obligation["producer_requirement"] != dict(requirement):
        _fail(f"{path}.producer_requirement is not the role requirement")
    if _validate_bindings(obligation["bindings"], f"{path}.bindings") != dict(bindings):
        _fail(f"{path}.bindings do not match the contract identity")
    claimed = _sha256(obligation["obligation_sha256"], f"{path}.obligation_sha256")
    unsigned = dict(obligation)
    unsigned.pop("obligation_sha256")
    if claimed != _canonical_sha256(unsigned):
        _fail(f"{path}.obligation_sha256 is invalid")
    expected = _build_obligation(key, requirement, bindings)
    if obligation != expected:
        _fail(f"{path} is not canonical")


def validate_contract_input(value: Any) -> None:
    """Validate a draft input while granting no semantic authority."""

    contract = _exact(value, _TOP_KEYS, "contract_input")
    if contract["schema"] != INPUT_SCHEMA:
        _fail(f"contract_input.schema must be {INPUT_SCHEMA}")
    if contract["status"] != STATUS:
        _fail(f"contract_input.status must be {STATUS}")
    if contract["authoritative_schema"] != AUTHORITATIVE_SCHEMA:
        _fail(f"contract_input.authoritative_schema must be {AUTHORITATIVE_SCHEMA}")
    if contract["producer_ref_schema"] != PRODUCER_REF_SCHEMA:
        _fail(f"contract_input.producer_ref_schema must be {PRODUCER_REF_SCHEMA}")
    _id(contract["arm_id"], "contract_input.arm_id")

    source = _exact(contract["source"], _SOURCE_KEYS, "contract_input.source")
    source_base = _validate_source_base({key: source[key] for key in _SOURCE_BASE_KEYS})
    query = _exact(contract["query"], _QUERY_KEYS, "contract_input.query")
    query_base = _validate_query_base({key: query[key] for key in _QUERY_BASE_KEYS})
    if query["aggregate_coverage_requirement"] is not None:
        _fail("contract-input v1 forbids aggregate coverage")
    abstract_domain = _exact(
        contract["abstract_domain"],
        _ABSTRACT_KEYS,
        "contract_input.abstract_domain",
    )
    abstract_base = _validate_abstract_base(
        {key: abstract_domain[key] for key in _ABSTRACT_BASE_KEYS}
    )
    encoding = _exact(contract["encoding"], _ENCODING_KEYS, "contract_input.encoding")
    encoding_base = _validate_encoding_base(
        {key: encoding[key] for key in _ENCODING_BASE_KEYS}
    )
    consumer = _exact(contract["consumer"], _CONSUMER_KEYS, "contract_input.consumer")
    consumer_base = _validate_consumer_base(
        {key: consumer[key] for key in _CONSUMER_BASE_KEYS}
    )
    if (consumer["lean_lift_requirement"] is None) != (
        consumer["lean_consumer_requirement"] is None
    ):
        _fail("LEAN_LIFT and LEAN_CONSUMER must both be null or both present")
    obligations = _exact(
        contract["root_obligations"],
        _ROOT_KEYS,
        "contract_input.root_obligations",
    )

    stored = _collect_stored_requirements(contract)
    specs: dict[str, Mapping[str, Any] | None] = {}
    for role, requirement in stored.items():
        if requirement is None:
            specs[role] = None
        else:
            raw = _exact(
                requirement,
                _REQUIREMENT_KEYS,
                f"stored_requirement.{role}",
            )
            specs[role] = _requirement_spec(raw)
    for role in REQUIRED_ROLES:
        if specs[role] is None:
            _fail(f"stored requirement {role} is missing")

    context = _requirement_context(
        contract["arm_id"],
        source_base,
        query_base,
        abstract_base,
        encoding_base,
        consumer_base,
        specs,
    )
    requirements: dict[str, Mapping[str, Any] | None] = {}
    for role in ALL_ROLES:
        requirement = stored[role]
        if requirement is None:
            requirements[role] = None
            continue
        requirements[role] = _validate_requirement(
            requirement,
            role=role,
            expected_bindings=_role_bindings(role, context),
            path=f"stored_requirement.{role}",
        )
    for key, (role, _quantifier, _conclusion) in _OBLIGATION_SEMANTICS.items():
        requirement = requirements[role]
        if requirement is None:
            _fail(f"root obligation {key} lacks its producer requirement")
        _validate_obligation(
            obligations[key],
            key=key,
            requirement=requirement,
            bindings=_role_bindings(role, context),
        )

    contract_id = _sha256(contract["contract_id"], "contract_input.contract_id")
    expected_id = _canonical_sha256(_contract_identity_preimage(contract))
    if contract_id != expected_id:
        _fail("contract_input.contract_id does not match its identity preimage")
    claimed = _sha256(
        contract["contract_input_sha256"],
        "contract_input.contract_input_sha256",
    )
    unsigned = dict(contract)
    unsigned.pop("contract_input_sha256")
    if claimed != _canonical_sha256(unsigned):
        _fail("contract_input.contract_input_sha256 is invalid")
    for path, digest in _walk_digests(contract):
        if path in {
            "contract_input.contract_id",
            "contract_input.contract_input_sha256",
        }:
            continue
        if digest in {contract_id, claimed}:
            _fail(f"{path} creates a contract-input hash dependency cycle")


def canonical_contract_input_bytes(value: Any) -> bytes:
    """Return canonical stored JSON with exactly one final newline."""

    validate_contract_input(value)
    try:
        payload = json_schema.stored_json_bytes(value)
    except json_schema.CapConfigurationSchemaError as exc:
        raise SemanticContractError(str(exc)) from exc
    if len(payload) > MAX_DOCUMENT_BYTES:
        _fail("contract-input document exceeds the size limit")
    return payload


def parse_contract_input_bytes(payload: bytes) -> dict[str, Any]:
    """Parse only the canonical stored representation of a contract input."""

    if type(payload) is not bytes or len(payload) > MAX_DOCUMENT_BYTES:
        _fail("contract-input payload is not bounded exact bytes")
    try:
        value = json_schema.parse_stored_json_bytes(payload)
    except json_schema.CapConfigurationSchemaError as exc:
        raise SemanticContractError(str(exc)) from exc
    validate_contract_input(value)
    return value


def load_contract_input(path: os.PathLike[str] | str) -> dict[str, Any]:
    """Load one no-follow, stable, canonical contract-input artifact."""

    try:
        payload = custody._read_regular_file(path)
    except custody.ProducerRefError as exc:
        raise SemanticContractError(str(exc)) from exc
    return parse_contract_input_bytes(payload)


def publish_contract_input(
    path: os.PathLike[str] | str,
    value: Any,
) -> Path:
    """Publish one immutable contract input using exclusive creation."""

    payload = canonical_contract_input_bytes(value)
    try:
        parent_descriptor, name, absolute = custody._open_parent_directory(path)
    except custody.ProducerRefError as exc:
        raise SemanticContractError(str(exc)) from exc
    descriptor: int | None = None
    created_identity: tuple[int, int] | None = None
    succeeded = False
    try:
        parent_info = os.fstat(parent_descriptor)
        flags = (
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | os.O_NOFOLLOW
        )
        descriptor = os.open(name, flags, 0o600, dir_fd=parent_descriptor)
        created = os.fstat(descriptor)
        created_identity = custody._identity(created)
        if not stat.S_ISREG(created.st_mode) or created.st_nlink != 1:
            _fail("new contract-input artifact is not a single-link regular file")
        remaining = memoryview(payload)
        while remaining:
            written = os.write(descriptor, remaining)
            if written <= 0:
                _fail("short write while publishing contract-input artifact")
            remaining = remaining[written:]
        os.fsync(descriptor)
        published = os.fstat(descriptor)
        if (
            not stat.S_ISREG(published.st_mode)
            or published.st_nlink != 1
            or published.st_size != len(payload)
        ):
            _fail("published contract-input artifact failed custody checks")
        entry = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        if custody._metadata(entry) != custody._metadata(published):
            _fail("contract-input path changed during publication")
        os.fsync(parent_descriptor)
        try:
            custody._verify_lexical_entry(absolute, parent_info, published)
        except custody.ProducerRefError as exc:
            raise SemanticContractError(str(exc)) from exc
        succeeded = True
        return absolute
    except FileExistsError as exc:
        raise SemanticContractError(
            f"refusing to overwrite contract-input artifact: {absolute}"
        ) from exc
    except SemanticContractError:
        raise
    except OSError as exc:
        raise SemanticContractError(
            f"cannot publish contract-input artifact: {absolute}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if not succeeded and created_identity is not None:
            custody._remove_failed_create(parent_descriptor, name, created_identity)
        os.close(parent_descriptor)
