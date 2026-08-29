"""Canonical semantic-projection decoder contract for structural CEGAR."""

from __future__ import annotations

import hashlib
import inspect
import json
import platform
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

SCHEMA = "p97-cegar-canonical-decoder/v1"
GOVERNING_CONTRACT_SCHEMA = "p97-cegar-semantic-contract/v2"
DECODER_MODE = "CANONICAL_PROJECTION_FUNCTION"
PRODUCER_REF_SCHEMA = "p97-cegar-python-custody-producer-ref/v1"
OUTPUT_IDENTITY_SCHEMA = "p97-cegar-decoded-object-identity/v1"


class DecoderContractError(ValueError):
    """Raised when decoder custody or canonical reconstruction fails."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("ascii")


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _producer_ref(producer: Any, statement: str) -> dict[str, Any]:
    source_path_value = inspect.getsourcefile(producer)
    if source_path_value is None:
        raise DecoderContractError("decoder producer has no source file")
    source_path = Path(source_path_value).resolve()
    unsigned = {
        "schema": PRODUCER_REF_SCHEMA,
        "module": producer.__module__,
        "qualname": producer.__qualname__,
        "statement_sha256": hashlib.sha256(statement.encode("utf-8")).hexdigest(),
        "source_file": source_path.name,
        "source_sha256": _sha256_file(source_path),
        "toolchain": {
            "implementation": platform.python_implementation(),
            "version": platform.python_version(),
        },
        "trust_classification": "EXTERNAL_PYTHON_RUNTIME_CHECKER",
        "supports_semantic_discharge": False,
    }
    return {**unsigned, "producer_ref_sha256": _sha256_value(unsigned)}


def _validate_producer_ref(value: Any) -> None:
    if not isinstance(value, Mapping):
        raise DecoderContractError("decoder producer reference is not an object")
    unsigned = dict(value)
    claimed_hash = unsigned.pop("producer_ref_sha256", None)
    if (
        set(unsigned)
        != {
            "schema",
            "module",
            "qualname",
            "statement_sha256",
            "source_file",
            "source_sha256",
            "toolchain",
            "trust_classification",
            "supports_semantic_discharge",
        }
        or unsigned.get("schema") != PRODUCER_REF_SCHEMA
        or unsigned.get("trust_classification")
        != "EXTERNAL_PYTHON_RUNTIME_CHECKER"
        or unsigned.get("supports_semantic_discharge") is not False
        or not _is_sha256(unsigned.get("statement_sha256"))
        or not _is_sha256(unsigned.get("source_sha256"))
        or not isinstance(unsigned.get("toolchain"), Mapping)
        or set(unsigned["toolchain"]) != {"implementation", "version"}
        or claimed_hash != _sha256_value(unsigned)
    ):
        raise DecoderContractError("decoder producer reference is malformed")


def _output_identity(encoding: Any) -> dict[str, Any]:
    decoder_globals = type(encoding).decode.__globals__
    type_names = ["Node"]
    if encoding.blocker or encoding.cap:
        type_names.append("AnnotatedNode")
    sources = []
    for name in type_names:
        object_type = decoder_globals.get(name)
        if object_type is None:
            raise DecoderContractError(f"decoded object type {name} is absent")
        source_path_value = inspect.getsourcefile(object_type)
        if source_path_value is None:
            raise DecoderContractError(f"decoded object type {name} has no source")
        source_path = Path(source_path_value).resolve()
        sources.append(
            {
                "module": object_type.__module__,
                "qualname": object_type.__qualname__,
                "source_file": source_path.name,
                "source_sha256": _sha256_file(source_path),
            }
        )
    unsigned = {
        "schema": OUTPUT_IDENTITY_SCHEMA,
        "kind": "CONTENT_SHA256",
        "decoded_types": sources,
    }
    return {**unsigned, "identity_policy_sha256": _sha256_value(unsigned)}


def _validate_output_identity(value: Any) -> None:
    if not isinstance(value, Mapping):
        raise DecoderContractError("decoded object identity is not an object")
    unsigned = dict(value)
    claimed_hash = unsigned.pop("identity_policy_sha256", None)
    decoded_types = unsigned.get("decoded_types")
    if (
        set(unsigned) != {"schema", "kind", "decoded_types"}
        or unsigned.get("schema") != OUTPUT_IDENTITY_SCHEMA
        or unsigned.get("kind") != "CONTENT_SHA256"
        or not isinstance(decoded_types, list)
        or not decoded_types
        or any(
            not isinstance(item, Mapping)
            or set(item) != {"module", "qualname", "source_file", "source_sha256"}
            or not _is_sha256(item.get("source_sha256"))
            for item in decoded_types
        )
        or claimed_hash != _sha256_value(unsigned)
    ):
        raise DecoderContractError("decoded object identity is malformed")


def _is_sha256(value: Any) -> bool:
    return (
        type(value) is str
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _variable_map(encoding: Any, variables: Sequence[int]) -> list[list[Any]]:
    result: list[list[Any]] = []
    for variable in variables:
        key = encoding.key_for.get(variable)
        if not isinstance(key, tuple) or not key:
            raise DecoderContractError(
                f"SAT variable {variable} has no nonempty tuple key"
            )
        result.append([variable, list(key)])
    return result


def _variable_partition(encoding: Any) -> tuple[tuple[int, ...], tuple[int, ...]]:
    variable_count = encoding.num_vars
    if type(variable_count) is not int or variable_count < 0:
        raise DecoderContractError("CNF variable count is invalid")
    semantic = tuple(encoding.semantic_vars)
    if (
        any(type(variable) is not int for variable in semantic)
        or len(set(semantic)) != len(semantic)
        or any(not 1 <= variable <= variable_count for variable in semantic)
    ):
        raise DecoderContractError("semantic variable namespace is invalid")
    semantic_set = set(semantic)
    auxiliary = tuple(
        variable
        for variable in range(1, variable_count + 1)
        if variable not in semantic_set
    )
    return semantic, auxiliary


def build_decoder_contract(encoding: Any) -> dict[str, Any]:
    """Bind the sole decoded object selected by one semantic projection."""

    semantic, auxiliary = _variable_partition(encoding)
    semantic_map = _variable_map(encoding, semantic)
    auxiliary_map = _variable_map(encoding, auxiliary)
    blocker_policy = (
        "MINIMUM_INCOMING_SHELL_CENTER"
        if encoding.blocker and encoding.project_blockers
        else (
            "UNIQUE_EXPLICIT_BLOCKER_ROW"
            if encoding.blocker
            else "NO_BLOCKER_ANNOTATION"
        )
    )
    cap_policy = (
        "FIXED_M_0_1_2_AND_UNIQUE_EXPLICIT_F_ROW"
        if encoding.cap
        else "NO_CAP_ANNOTATION"
    )
    projection_producer = _producer_ref(
        semantic_projection,
        "restrict a formula assignment to every and only semantic variable",
    )
    decoder_producer = _producer_ref(
        _reconstruct,
        "construct exactly one abstract object from a complete semantic projection",
    )
    decoder_evidence = _producer_ref(
        decode_canonical,
        "independently reconstruct, compare, and validate every decoded object",
    )
    unsigned = {
        "schema": SCHEMA,
        "governing_contract_schema": GOVERNING_CONTRACT_SCHEMA,
        "decoder_mode": DECODER_MODE,
        "formula_assignment_domain": "TOTAL_DIMACS_ASSIGNMENT",
        "decoder_input_domain": "COMPLETE_SEMANTIC_PROJECTION",
        "formula_to_decoder_map": "RESTRICT_TO_SEMANTIC_VARIABLES",
        "formula_to_decoder_projection": projection_producer,
        "decoder_producer": decoder_producer,
        "decoder_evidence": decoder_evidence,
        "auxiliary_policy": "IGNORED_BY_DECODER",
        "canonicality_statement": (
            "same complete semantic projection produces the same decoded object"
        ),
        "cnf_variable_count": encoding.num_vars,
        "semantic_variable_count": len(semantic),
        "auxiliary_variable_count": len(auxiliary),
        "semantic_variable_map_sha256": _sha256_value(semantic_map),
        "auxiliary_variable_map_sha256": _sha256_value(auxiliary_map),
        "projection_map_sha256": _sha256_value(
            {"included": semantic_map, "omitted": auxiliary_map}
        ),
        "reconstruction": {
            "node_cell": {
                "n": encoding.cell.n,
                "k": encoding.cell.k,
                "policy": "FIXED_ENCODING_CELL",
            },
            "shells": "TRUE_S_P_Q_VARIABLES",
            "blocker": blocker_policy,
            "caps": cap_policy,
        },
        "decoded_object_identity": _output_identity(encoding),
        "validation_policy": "RECONSTRUCT_COMPARE_AND_VALIDATE_SEMANTIC_READBACK",
        "decoder_functionality_enforced": True,
        "r3_assignment_decoding_discharge": None,
        "f5_child_semantic_bridge_discharge": None,
        "source_realization_discharge": None,
        "supports_source_promotion": False,
        "supports_abstract_promotion": False,
        "supports_theorem_promotion": False,
    }
    return {**unsigned, "contract_sha256": _sha256_value(unsigned)}


def validate_decoder_contract(contract: Mapping[str, Any], encoding: Any) -> None:
    """Replay a stored decoder contract against the live variable namespace."""

    if dict(contract) != build_decoder_contract(encoding):
        raise DecoderContractError(
            "canonical decoder contract does not match the live encoding"
        )


def validate_bound_contract(contract: Mapping[str, Any]) -> None:
    """Authenticate a stored contract before embedding it in another record."""

    unsigned = dict(contract)
    claimed_hash = unsigned.pop("contract_sha256", None)
    required_fields = {
        "schema",
        "governing_contract_schema",
        "decoder_mode",
        "formula_assignment_domain",
        "decoder_input_domain",
        "formula_to_decoder_map",
        "formula_to_decoder_projection",
        "decoder_producer",
        "decoder_evidence",
        "auxiliary_policy",
        "canonicality_statement",
        "cnf_variable_count",
        "semantic_variable_count",
        "auxiliary_variable_count",
        "semantic_variable_map_sha256",
        "auxiliary_variable_map_sha256",
        "projection_map_sha256",
        "reconstruction",
        "decoded_object_identity",
        "validation_policy",
        "decoder_functionality_enforced",
        "r3_assignment_decoding_discharge",
        "f5_child_semantic_bridge_discharge",
        "source_realization_discharge",
        "supports_source_promotion",
        "supports_abstract_promotion",
        "supports_theorem_promotion",
    }
    counts = (
        unsigned.get("cnf_variable_count"),
        unsigned.get("semantic_variable_count"),
        unsigned.get("auxiliary_variable_count"),
    )
    reconstruction = unsigned.get("reconstruction")
    if (
        set(unsigned) != required_fields
        or unsigned.get("schema") != SCHEMA
        or unsigned.get("governing_contract_schema")
        != GOVERNING_CONTRACT_SCHEMA
        or unsigned.get("decoder_mode") != DECODER_MODE
        or unsigned.get("formula_assignment_domain") != "TOTAL_DIMACS_ASSIGNMENT"
        or unsigned.get("decoder_input_domain")
        != "COMPLETE_SEMANTIC_PROJECTION"
        or unsigned.get("formula_to_decoder_map")
        != "RESTRICT_TO_SEMANTIC_VARIABLES"
        or unsigned.get("auxiliary_policy") != "IGNORED_BY_DECODER"
        or unsigned.get("canonicality_statement")
        != "same complete semantic projection produces the same decoded object"
        or any(type(count) is not int or count < 0 for count in counts)
        or counts[0] != counts[1] + counts[2]
        or any(
            not _is_sha256(unsigned.get(field))
            for field in (
                "semantic_variable_map_sha256",
                "auxiliary_variable_map_sha256",
                "projection_map_sha256",
            )
        )
        or not isinstance(reconstruction, Mapping)
        or set(reconstruction) != {"node_cell", "shells", "blocker", "caps"}
        or not isinstance(reconstruction.get("node_cell"), Mapping)
        or set(reconstruction["node_cell"]) != {"n", "k", "policy"}
        or reconstruction["node_cell"].get("policy") != "FIXED_ENCODING_CELL"
        or reconstruction.get("shells") != "TRUE_S_P_Q_VARIABLES"
        or reconstruction.get("blocker")
        not in {
            "MINIMUM_INCOMING_SHELL_CENTER",
            "UNIQUE_EXPLICIT_BLOCKER_ROW",
            "NO_BLOCKER_ANNOTATION",
        }
        or reconstruction.get("caps")
        not in {
            "FIXED_M_0_1_2_AND_UNIQUE_EXPLICIT_F_ROW",
            "NO_CAP_ANNOTATION",
        }
        or unsigned.get("validation_policy")
        != "RECONSTRUCT_COMPARE_AND_VALIDATE_SEMANTIC_READBACK"
        or unsigned.get("decoder_functionality_enforced") is not True
        or unsigned.get("r3_assignment_decoding_discharge") is not None
        or unsigned.get("f5_child_semantic_bridge_discharge") is not None
        or unsigned.get("source_realization_discharge") is not None
        or unsigned.get("supports_source_promotion") is not False
        or unsigned.get("supports_abstract_promotion") is not False
        or unsigned.get("supports_theorem_promotion") is not False
        or claimed_hash != _sha256_value(unsigned)
    ):
        raise DecoderContractError("canonical decoder contract is malformed")
    for field in (
        "formula_to_decoder_projection",
        "decoder_producer",
        "decoder_evidence",
    ):
        _validate_producer_ref(unsigned[field])
    _validate_output_identity(unsigned["decoded_object_identity"])


def semantic_projection(
    encoding: Any, assignment: Mapping[int, bool]
) -> dict[int, bool]:
    semantic, _ = _variable_partition(encoding)
    missing = [variable for variable in semantic if variable not in assignment]
    if missing:
        raise DecoderContractError(
            "decoder input omits semantic variables; "
            f"count={len(missing)}, first={missing[:5]}"
        )
    malformed = [
        variable for variable in semantic if type(assignment[variable]) is not bool
    ]
    if malformed:
        raise DecoderContractError(
            "decoder input has non-Boolean semantic values; "
            f"first={malformed[:5]}"
        )
    return {variable: assignment[variable] for variable in semantic}


def _reconstruct(encoding: Any, assignment: Mapping[int, bool]) -> Any:
    decoder_globals = type(encoding).decode.__globals__
    try:
        node_type = decoder_globals["Node"]
        annotated_node_type = decoder_globals["AnnotatedNode"]
        blocker_type = decoder_globals["BlockerAnnotation"]
        cap_type = decoder_globals["CapAnnotation"]
    except KeyError as exc:
        raise DecoderContractError(
            "live decoder constructor namespace is incomplete"
        ) from exc
    n, k = encoding.cell.n, encoding.cell.k
    node = node_type(
        n=n,
        k=k,
        shells=tuple(
            frozenset(
                q
                for q in range(n)
                if q != p and assignment[encoding.var("s", p, q)]
            )
            for p in range(n)
        ),
    )
    blocker = None
    if encoding.blocker and encoding.project_blockers:
        centers: list[int] = []
        for x in range(n):
            incoming = [
                d
                for d in range(n)
                if d != x and assignment[encoding.var("s", d, x)]
            ]
            if not incoming:
                raise DecoderContractError(
                    f"projected blocker reconstruction has no center at x={x}"
                )
            centers.append(min(incoming))
        blocker = blocker_type(node=node, c=tuple(centers))
    elif encoding.blocker:
        centers = []
        for x in range(n):
            incoming = [
                d
                for d in range(n)
                if d != x and assignment[encoding.var("b", x, d)]
            ]
            if len(incoming) != 1:
                raise DecoderContractError(
                    f"explicit blocker row x={x} is not unique: {incoming!r}"
                )
            centers.append(incoming[0])
        blocker = blocker_type(node=node, c=tuple(centers))
    caps = None
    if encoding.cap:
        cap_map: dict[int, int] = {}
        for x in range(3, n):
            choices = [
                i for i in range(3) if assignment[encoding.var("f", x, i)]
            ]
            if len(choices) != 1:
                raise DecoderContractError(
                    f"cap row x={x} is not unique: {choices!r}"
                )
            cap_map[x] = choices[0]
        caps = cap_type(node=node, M=frozenset({0, 1, 2}), f=cap_map)
    if blocker is None and caps is None:
        return node
    return annotated_node_type(node=node, blocker=blocker, caps=caps)


def decode_canonical(encoding: Any, assignment: Mapping[int, bool]) -> Any:
    """Independently reconstruct, compare, and validate the sole decoded object."""

    projection = semantic_projection(encoding, assignment)
    expected = _reconstruct(encoding, projection)
    actual = encoding.decode(assignment)
    if actual != expected or actual.digest() != expected.digest():
        raise DecoderContractError(
            "live decoder disagrees with canonical semantic reconstruction"
        )
    encoding.validate(actual, assignment)
    return actual
