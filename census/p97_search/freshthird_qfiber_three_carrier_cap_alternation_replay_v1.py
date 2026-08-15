# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent replay for one FreshThird cap-alternation learned clause.

The producer's literal list is never trusted.  Replay authenticates the active
encoding manifest and model signature, reconstructs the seven semantic
literals from the four roles and their alternating cap-membership pattern, and
requires byte-level equality with the supplied clause record.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Never

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    CAP_ALTERNATION_REFINEMENT_SCHEMA,
    CAP_ALTERNATION_SOURCE_THEOREM,
    CapAlternationRefinement,
    FreshThirdCarrierCnfEncoding,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    CAP_WITNESS_KEYS,
    DELETION_CENTERS,
    MODEL_SIGNATURE_KEYS,
    RADIUS_CENTERS,
    ROLES,
    _canonical_json,
)

CAP_ALTERNATION_CERTIFICATE_SCHEMA = (
    "p97-freshthird-qfiber-three-carrier-cap-alternation-certificate/v1"
)
CAP_ALTERNATION_CLAUSE_SOURCE_THEOREM = (
    "FreshThirdQFiberThreeCarrierFiniteAssignment."
    "capAlternationClause_of_noAlternatingCap"
)
CAP_ALTERNATION_SOURCE_THEOREMS = (
    CAP_ALTERNATION_SOURCE_THEOREM,
    CAP_ALTERNATION_CLAUSE_SOURCE_THEOREM,
)
CAP_ALTERNATION_LEAN_INGRESS_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FreshThirdQFiberThreeCarrierFiniteCnfIngress.lean"
)
CAP_ALTERNATION_LEAN_QUERY_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FreshThirdQFiberThreeCarrierFiniteQuery.lean"
)
CAP_ALTERNATION_LEAN_AGGREGATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"
)
CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT = (
    "import Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "FreshThirdQFiberThreeCarrierFiniteCnfIngress"
)
CAP_ALTERNATION_LEAN_DECLARATIONS = (
    (
        "Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal."
        "FreshThirdQFiberThreeCarrierFiniteAssignment.noAlternatingCap_ofView"
    ),
    (
        "Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal."
        "FreshThirdQFiberThreeCarrierFiniteAssignment."
        "capAlternationClause_of_noAlternatingCap"
    ),
)
CAP_ALTERNATION_RECORD_HASH_DOMAIN = (
    "p97-freshthird-qfiber-three-carrier-cap-alternation-record-sha256/v1"
)
SEMANTIC_SIGNATURE_SCOPE = "semantic-readback-only/no-source-sat-claim"
CAP_ALTERNATION_CERTIFICATE_CLAIMS = (
    "exact-seven-literal-semantic-projection",
    "lean-ingress-source-hash-bound",
    "source-sat-not-claimed",
    "terminal-unsat-not-claimed",
    "live-closure-not-claimed",
)
CERTIFICATE_KEYS = frozenset(
    {
        "schema",
        "refinement_schema",
        "boundary_index",
        "cap",
        "roles",
        "membership",
        "clause",
        "source_theorems",
        "lean_declarations",
        "lean_query_path",
        "lean_query_sha256",
        "lean_ingress_path",
        "lean_ingress_sha256",
        "lean_aggregate_path",
        "lean_aggregate_sha256",
        "lean_aggregate_import",
        "signature_scope",
        "claims",
        "model_signature_sha256",
        "encoding_manifest_sha256",
        "source_manifest_sha256",
        "cnf_sha256",
        "variable_map_sha256",
        "clause_sha256",
        "parent_record_sha256",
        "record_hash_domain",
        "record_sha256",
    }
)
ALTERNATING_PATTERNS = (
    (True, False, True, False),
    (False, True, False, True),
)


class CapAlternationCertificateError(ValueError):
    """A certificate or its independently supplied model signature is invalid."""


@dataclass(frozen=True)
class ReplayedCapAlternationCertificate:
    """Authenticated semantic clause reconstructed by independent replay."""

    clause: tuple[int, ...]
    certificate_sha256: str
    encoding_manifest_sha256: str
    model_signature_sha256: str
    signature_scope: str


def _reject_json_constant(value: str) -> Never:
    raise CapAlternationCertificateError(f"non-standard JSON constant: {value}")


def _strict_object(pairs: Sequence[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise CapAlternationCertificateError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_cap_alternation_certificate(payload: bytes) -> dict[str, object]:
    """Parse one UTF-8 JSON object while rejecting duplicate keys and NaN values."""

    try:
        text = payload.decode("utf-8", errors="strict")
        value = json.loads(
            text,
            object_pairs_hook=_strict_object,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CapAlternationCertificateError(
            f"invalid certificate JSON: {exc}"
        ) from exc
    if type(value) is not dict:
        raise CapAlternationCertificateError("certificate must be one JSON object")
    if _canonical_json(value) != payload:
        raise CapAlternationCertificateError("certificate JSON is not canonical")
    return value


def cap_alternation_certificate_bytes(record: Mapping[str, object]) -> bytes:
    """Serialize a record in the repository's canonical JSON encoding."""

    return _canonical_json(dict(record))


def _sha256(value: object) -> str:
    return hashlib.sha256(_canonical_json(value)).hexdigest()


def _require_sha256(value: object, field: str) -> str:
    if not (
        type(value) is str
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    ):
        raise CapAlternationCertificateError(f"{field} must be a lowercase SHA-256")
    return value


def repository_lean_ingress_bytes() -> bytes:
    """Read the exact repository source that proves the replayed clause."""

    repository_root = Path(__file__).resolve().parents[2]
    return (repository_root / CAP_ALTERNATION_LEAN_INGRESS_PATH).read_bytes()


def repository_lean_query_bytes() -> bytes:
    """Read the imported source that proves cap nonalternation."""

    repository_root = Path(__file__).resolve().parents[2]
    return (repository_root / CAP_ALTERNATION_LEAN_QUERY_PATH).read_bytes()


def repository_lean_aggregate_bytes() -> bytes:
    """Read the aggregate module that publishes the clause theorem."""

    repository_root = Path(__file__).resolve().parents[2]
    return (repository_root / CAP_ALTERNATION_LEAN_AGGREGATE_PATH).read_bytes()


def _repository_lean_source_snapshot() -> tuple[bytes, bytes, bytes]:
    return (
        repository_lean_query_bytes(),
        repository_lean_ingress_bytes(),
        repository_lean_aggregate_bytes(),
    )


def _require_repository_sources_unchanged(
    before: tuple[bytes, bytes, bytes],
) -> None:
    after = _repository_lean_source_snapshot()
    labels = ("query", "ingress", "aggregate")
    for label, old, new in zip(labels, before, after, strict=True):
        if old != new:
            raise CapAlternationCertificateError(
                f"Lean {label} changed during certificate operation"
            )


def _record_payload_sha256(payload: Mapping[str, object]) -> str:
    domain = CAP_ALTERNATION_RECORD_HASH_DOMAIN.encode("ascii") + b"\0"
    return hashlib.sha256(domain + _canonical_json(dict(payload))).hexdigest()


def _record_identity(record: Mapping[str, object]) -> str:
    """Verify and return the canonical non-self-referential record identity."""

    if type(record) is not dict or frozenset(record) != CERTIFICATE_KEYS:
        raise CapAlternationCertificateError("parent certificate keys mismatch")
    if record["record_hash_domain"] != CAP_ALTERNATION_RECORD_HASH_DOMAIN:
        raise CapAlternationCertificateError("record hash domain mismatch")
    declared = _require_sha256(record["record_sha256"], "record_sha256")
    payload = {key: value for key, value in record.items() if key != "record_sha256"}
    computed = _record_payload_sha256(payload)
    if declared != computed:
        raise CapAlternationCertificateError("record hash mismatch")
    return computed


def _validate_lean_source_bytes(
    lean_query_bytes: bytes,
    lean_ingress_bytes: bytes,
    lean_aggregate_bytes: bytes,
) -> None:
    namespace_markers = (
        b"namespace Problem97",
        b"namespace ATailFrontierLiveClosure",
        b"namespace TwoSourceExactCollisionRowsTerminal",
        b"namespace FreshThirdQFiberThreeCarrierFiniteAssignment",
    )
    if any(marker not in lean_query_bytes for marker in namespace_markers):
        raise CapAlternationCertificateError("Lean query namespace is absent")
    if b"theorem noAlternatingCap_ofView" not in lean_query_bytes:
        raise CapAlternationCertificateError("Lean query source theorem is absent")
    if any(marker not in lean_ingress_bytes for marker in namespace_markers):
        raise CapAlternationCertificateError("Lean ingress namespace is absent")
    if b"theorem capAlternationClause_of_noAlternatingCap" not in lean_ingress_bytes:
        raise CapAlternationCertificateError("Lean ingress theorem is absent")
    if CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT.encode("utf-8") not in (
        lean_aggregate_bytes.splitlines()
    ):
        raise CapAlternationCertificateError("Lean aggregate import is absent")


def _validate_model_signature_shape(signature: Mapping[str, object]) -> None:
    """Recheck the complete shared readback shape without asserting source SAT."""

    if type(signature) is not dict or set(signature) != MODEL_SIGNATURE_KEYS:
        raise CapAlternationCertificateError("model signature key mismatch")
    point_classes = signature["point_classes"]
    cap_witnesses = signature["cap_witnesses"]
    in_cap = signature["in_cap"]
    interiors = signature["in_cap_interior"]
    order = signature["order"]
    radius = signature["radius_classes"]
    has_four = signature["has_four_after_deleting"]
    nonrobust = signature["nonrobust"]
    mappings = (
        point_classes,
        cap_witnesses,
        in_cap,
        interiors,
        order,
        radius,
        has_four,
        nonrobust,
    )
    if any(type(item) is not dict for item in mappings):
        raise CapAlternationCertificateError("malformed model signature mapping")
    role_set = set(ROLES)
    for name, mapping in (
        ("point classes", point_classes),
        ("cap membership", in_cap),
        ("cap interior", interiors),
        ("order", order),
        ("nonrobust", nonrobust),
    ):
        if set(mapping) != role_set:
            raise CapAlternationCertificateError(f"{name} key mismatch")
    for role in ROLES:
        if type(point_classes[role]) is not int or type(order[role]) is not int:
            raise CapAlternationCertificateError(
                f"malformed point-class/order readback for role {role!r}"
            )
        for name, values in (
            ("cap", in_cap[role]),
            ("cap interior", interiors[role]),
        ):
            if not (
                type(values) is list
                and len(values) == 3
                and all(type(value) is bool for value in values)
            ):
                raise CapAlternationCertificateError(
                    f"malformed {name} readback for role {role!r}"
                )
        if type(nonrobust[role]) is not bool:
            raise CapAlternationCertificateError(
                f"malformed nonrobust readback for role {role!r}"
            )
    if set(cap_witnesses) != CAP_WITNESS_KEYS:
        raise CapAlternationCertificateError("cap witness key mismatch")
    for name in ("first", "fresh", "row", "boundary"):
        value = cap_witnesses[name]
        if type(value) is not int or value not in range(3):
            raise CapAlternationCertificateError(f"malformed cap witness: {name}")
    for name in ("blocker", "boundary_fan"):
        values = cap_witnesses[name]
        if not (
            type(values) is list
            and len(values) == 4
            and all(type(value) is int and value in range(3) for value in values)
        ):
            raise CapAlternationCertificateError(
                f"malformed cap witness vector: {name}"
            )
    if set(radius) != set(RADIUS_CENTERS):
        raise CapAlternationCertificateError("radius center key mismatch")
    for center in RADIUS_CENTERS:
        values = radius[center]
        if not (
            type(values) is list
            and len(values) == len(ROLES)
            and all(type(value) is int for value in values)
        ):
            raise CapAlternationCertificateError(
                f"malformed radius readback for center {center!r}"
            )
    if set(has_four) != set(DELETION_CENTERS):
        raise CapAlternationCertificateError("deletion center key mismatch")
    for center in DELETION_CENTERS:
        values = has_four[center]
        if not (
            type(values) is list
            and len(values) == len(ROLES)
            and all(type(value) is bool for value in values)
        ):
            raise CapAlternationCertificateError(
                f"malformed deletion readback for center {center!r}"
            )


def _build_cap_alternation_certificate_from_sources(
    encoding: FreshThirdCarrierCnfEncoding,
    refinement: CapAlternationRefinement,
    lean_query_bytes: bytes,
    lean_ingress_bytes: bytes,
    lean_aggregate_bytes: bytes,
    *,
    parent_record: Mapping[str, object] | None = None,
) -> dict[str, object]:
    """Wrap a semantic refinement in a manifest- and Lean-source-bound record."""

    if refinement.boundary_index != encoding.boundary_index:
        raise CapAlternationCertificateError(
            "refinement boundary does not match encoder"
        )
    if any(
        type(value) is not bytes
        for value in (lean_query_bytes, lean_ingress_bytes, lean_aggregate_bytes)
    ):
        raise CapAlternationCertificateError("Lean source inputs must be bytes")
    _validate_lean_source_bytes(
        lean_query_bytes, lean_ingress_bytes, lean_aggregate_bytes
    )
    parent_record_sha256 = (
        None if parent_record is None else _record_identity(parent_record)
    )
    manifest = encoding.encoding_manifest()
    record: dict[str, object] = {
        "schema": CAP_ALTERNATION_CERTIFICATE_SCHEMA,
        "refinement_schema": CAP_ALTERNATION_REFINEMENT_SCHEMA,
        "boundary_index": refinement.boundary_index,
        "cap": refinement.cap,
        "roles": list(refinement.roles),
        "membership": list(refinement.membership),
        "clause": list(refinement.clause),
        "source_theorems": list(CAP_ALTERNATION_SOURCE_THEOREMS),
        "lean_declarations": list(CAP_ALTERNATION_LEAN_DECLARATIONS),
        "lean_query_path": CAP_ALTERNATION_LEAN_QUERY_PATH,
        "lean_query_sha256": hashlib.sha256(lean_query_bytes).hexdigest(),
        "lean_ingress_path": CAP_ALTERNATION_LEAN_INGRESS_PATH,
        "lean_ingress_sha256": hashlib.sha256(lean_ingress_bytes).hexdigest(),
        "lean_aggregate_path": CAP_ALTERNATION_LEAN_AGGREGATE_PATH,
        "lean_aggregate_sha256": hashlib.sha256(lean_aggregate_bytes).hexdigest(),
        "lean_aggregate_import": CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT,
        "signature_scope": SEMANTIC_SIGNATURE_SCOPE,
        "claims": list(CAP_ALTERNATION_CERTIFICATE_CLAIMS),
        "model_signature_sha256": refinement.model_signature_sha256,
        "encoding_manifest_sha256": _sha256(manifest),
        "source_manifest_sha256": manifest["source_manifest_sha256"],
        "cnf_sha256": manifest["cnf_sha256"],
        "variable_map_sha256": manifest["variable_map_sha256"],
        "clause_sha256": _sha256(list(refinement.clause)),
        "parent_record_sha256": parent_record_sha256,
        "record_hash_domain": CAP_ALTERNATION_RECORD_HASH_DOMAIN,
    }
    record["record_sha256"] = _record_payload_sha256(record)
    return record


def build_cap_alternation_certificate(
    encoding: FreshThirdCarrierCnfEncoding,
    refinement: CapAlternationRefinement,
    *,
    parent_record: Mapping[str, object] | None = None,
) -> dict[str, object]:
    """Build only against the current repository Lean sources."""

    sources = _repository_lean_source_snapshot()
    record = _build_cap_alternation_certificate_from_sources(
        encoding,
        refinement,
        *sources,
        parent_record=parent_record,
    )
    _require_repository_sources_unchanged(sources)
    return record


def _replay_cap_alternation_certificate_from_sources(
    record: Mapping[str, object],
    signature: Mapping[str, object],
    variable_map_bytes: bytes,
    lean_query_bytes: bytes,
    lean_ingress_bytes: bytes,
    lean_aggregate_bytes: bytes,
    encoding: FreshThirdCarrierCnfEncoding,
    *,
    parent_record: Mapping[str, object] | None = None,
) -> ReplayedCapAlternationCertificate:
    """Authenticate and reconstruct one source-proved seven-literal clause.

    The signature is deliberately scoped to semantic readback.  This function
    does not claim that the signature came from a SAT model of the source
    theory; the universal Lean theorem makes the reconstructed clause sound
    independently of that stronger provenance claim.
    """

    if type(record) is not dict:
        raise CapAlternationCertificateError("certificate record must be a dict")
    record_keys = frozenset(record)
    if record_keys != CERTIFICATE_KEYS:
        missing = sorted(CERTIFICATE_KEYS - record_keys)
        extra = sorted(record_keys - CERTIFICATE_KEYS)
        raise CapAlternationCertificateError(
            f"certificate keys mismatch; missing={missing}, extra={extra}"
        )
    if record["schema"] != CAP_ALTERNATION_CERTIFICATE_SCHEMA:
        raise CapAlternationCertificateError("certificate schema mismatch")
    if record["refinement_schema"] != CAP_ALTERNATION_REFINEMENT_SCHEMA:
        raise CapAlternationCertificateError("refinement schema mismatch")
    boundary_index = record["boundary_index"]
    if type(boundary_index) is not int or boundary_index not in range(4):
        raise CapAlternationCertificateError("invalid boundary index")
    if boundary_index != encoding.boundary_index:
        raise CapAlternationCertificateError(
            "certificate boundary does not match encoder"
        )
    cap = record["cap"]
    if type(cap) is not int or cap not in range(3):
        raise CapAlternationCertificateError("invalid cap index")

    roles_value = record["roles"]
    if not (
        type(roles_value) is list
        and len(roles_value) == 4
        and all(type(role) is str and role in ROLES for role in roles_value)
        and len(set(roles_value)) == 4
    ):
        raise CapAlternationCertificateError("roles must be four distinct known roles")
    roles = tuple(roles_value)

    membership_value = record["membership"]
    if not (
        type(membership_value) is list
        and len(membership_value) == 4
        and all(type(member) is bool for member in membership_value)
    ):
        raise CapAlternationCertificateError("membership must contain four Booleans")
    membership = tuple(membership_value)
    if membership not in ALTERNATING_PATTERNS:
        raise CapAlternationCertificateError("membership pattern is not alternating")

    clause_value = record["clause"]
    if not (
        type(clause_value) is list
        and len(clause_value) == 7
        and all(type(literal) is int for literal in clause_value)
    ):
        raise CapAlternationCertificateError(
            "clause must contain seven integer literals"
        )
    clause = tuple(clause_value)
    if record["source_theorems"] != list(CAP_ALTERNATION_SOURCE_THEOREMS):
        raise CapAlternationCertificateError("source theorem chain mismatch")
    if record["lean_declarations"] != list(CAP_ALTERNATION_LEAN_DECLARATIONS):
        raise CapAlternationCertificateError("qualified Lean declaration mismatch")
    if record["lean_query_path"] != CAP_ALTERNATION_LEAN_QUERY_PATH:
        raise CapAlternationCertificateError("Lean query path mismatch")
    lean_query_sha256 = _require_sha256(
        record["lean_query_sha256"], "lean_query_sha256"
    )
    if hashlib.sha256(lean_query_bytes).hexdigest() != lean_query_sha256:
        raise CapAlternationCertificateError("Lean query source hash mismatch")
    if record["lean_ingress_path"] != CAP_ALTERNATION_LEAN_INGRESS_PATH:
        raise CapAlternationCertificateError("Lean ingress path mismatch")
    lean_ingress_sha256 = _require_sha256(
        record["lean_ingress_sha256"], "lean_ingress_sha256"
    )
    if hashlib.sha256(lean_ingress_bytes).hexdigest() != lean_ingress_sha256:
        raise CapAlternationCertificateError("Lean ingress source hash mismatch")
    if record["lean_aggregate_path"] != CAP_ALTERNATION_LEAN_AGGREGATE_PATH:
        raise CapAlternationCertificateError("Lean aggregate path mismatch")
    lean_aggregate_sha256 = _require_sha256(
        record["lean_aggregate_sha256"], "lean_aggregate_sha256"
    )
    if hashlib.sha256(lean_aggregate_bytes).hexdigest() != lean_aggregate_sha256:
        raise CapAlternationCertificateError("Lean aggregate source hash mismatch")
    if record["lean_aggregate_import"] != CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT:
        raise CapAlternationCertificateError("Lean aggregate import mismatch")
    _validate_lean_source_bytes(
        lean_query_bytes, lean_ingress_bytes, lean_aggregate_bytes
    )
    if record["signature_scope"] != SEMANTIC_SIGNATURE_SCOPE:
        raise CapAlternationCertificateError("signature scope mismatch")
    if record["claims"] != list(CAP_ALTERNATION_CERTIFICATE_CLAIMS):
        raise CapAlternationCertificateError("certificate claims mismatch")

    clause_sha256 = _require_sha256(record["clause_sha256"], "clause_sha256")
    if _sha256(list(clause)) != clause_sha256:
        raise CapAlternationCertificateError("clause hash mismatch")
    parent_record_sha256 = record["parent_record_sha256"]
    if parent_record_sha256 is not None:
        _require_sha256(parent_record_sha256, "parent_record_sha256")
    if (parent_record_sha256 is None) != (parent_record is None):
        raise CapAlternationCertificateError("parent record presence mismatch")
    if (
        parent_record is not None
        and _record_identity(parent_record) != parent_record_sha256
    ):
        raise CapAlternationCertificateError("parent record hash mismatch")
    record_sha256 = _record_identity(record)

    _validate_model_signature_shape(signature)
    model_signature_sha256 = _require_sha256(
        record["model_signature_sha256"], "model_signature_sha256"
    )
    if _sha256(signature) != model_signature_sha256:
        raise CapAlternationCertificateError("model signature hash mismatch")

    manifest = encoding.encoding_manifest()
    encoding_manifest_sha256 = _require_sha256(
        record["encoding_manifest_sha256"], "encoding_manifest_sha256"
    )
    if _sha256(manifest) != encoding_manifest_sha256:
        raise CapAlternationCertificateError("encoding manifest hash mismatch")
    if record["source_manifest_sha256"] != manifest["source_manifest_sha256"]:
        raise CapAlternationCertificateError("source manifest hash mismatch")
    if record["cnf_sha256"] != manifest["cnf_sha256"]:
        raise CapAlternationCertificateError("CNF hash mismatch")
    if record["variable_map_sha256"] != manifest["variable_map_sha256"]:
        raise CapAlternationCertificateError("variable-map hash mismatch")
    expected_variable_map_bytes = _canonical_json(encoding.variable_map())
    if variable_map_bytes != expected_variable_map_bytes:
        raise CapAlternationCertificateError("variable-map bytes mismatch")
    if hashlib.sha256(variable_map_bytes).hexdigest() != record["variable_map_sha256"]:
        raise CapAlternationCertificateError("variable-map byte hash mismatch")

    point_classes = signature.get("point_classes")
    order = signature.get("order")
    in_cap = signature.get("in_cap")
    if not all(type(item) is dict for item in (point_classes, order, in_cap)):
        raise CapAlternationCertificateError(
            "signature requires point_classes, order, and in_cap mappings"
        )
    classes: list[int] = []
    order_values: list[int] = []
    signature_membership: list[bool] = []
    for role in roles:
        point_class = point_classes.get(role)
        order_value = order.get(role)
        cap_values = in_cap.get(role)
        if type(point_class) is not int or type(order_value) is not int:
            raise CapAlternationCertificateError(
                f"malformed point-class/order readback for role {role!r}"
            )
        if not (
            type(cap_values) is list
            and len(cap_values) == 3
            and all(type(value) is bool for value in cap_values)
        ):
            raise CapAlternationCertificateError(
                f"malformed cap readback for role {role!r}"
            )
        classes.append(point_class)
        order_values.append(order_value)
        signature_membership.append(cap_values[cap])
    if len(set(classes)) != 4:
        raise CapAlternationCertificateError("certificate roles alias one point class")
    if not all(left < right for left, right in itertools.pairwise(order_values)):
        raise CapAlternationCertificateError(
            "certificate roles are not in increasing order"
        )
    if tuple(signature_membership) != membership:
        raise CapAlternationCertificateError(
            "certificate membership disagrees with signature"
        )

    a, b, c, d = roles
    expected_clause = (
        -encoding.before(a, b),
        -encoding.before(b, c),
        -encoding.before(c, d),
        *(
            -encoding.in_cap(role, cap) if member else encoding.in_cap(role, cap)
            for role, member in zip(roles, membership, strict=True)
        ),
    )
    if clause != expected_clause:
        raise CapAlternationCertificateError(
            "clause does not match semantic projection"
        )
    semantic_variables = frozenset(encoding.semantic_vars)
    if any(abs(literal) not in semantic_variables for literal in clause):
        raise CapAlternationCertificateError("clause contains a non-semantic variable")

    regenerated = encoding.cap_alternation_refinement_from_signature(signature)
    if regenerated is None:
        raise CapAlternationCertificateError(
            "signature has no alternating-cap refinement"
        )
    if not (
        regenerated.boundary_index == boundary_index
        and regenerated.cap == cap
        and regenerated.roles == roles
        and regenerated.membership == membership
        and regenerated.clause == clause
        and regenerated.model_signature_sha256 == model_signature_sha256
    ):
        raise CapAlternationCertificateError(
            "certificate is not the deterministic refinement of the signature"
        )

    return ReplayedCapAlternationCertificate(
        clause=clause,
        certificate_sha256=record_sha256,
        encoding_manifest_sha256=encoding_manifest_sha256,
        model_signature_sha256=model_signature_sha256,
        signature_scope=SEMANTIC_SIGNATURE_SCOPE,
    )


def replay_cap_alternation_certificate(
    record: Mapping[str, object],
    signature: Mapping[str, object],
    variable_map_bytes: bytes,
    encoding: FreshThirdCarrierCnfEncoding,
    *,
    parent_record: Mapping[str, object] | None = None,
) -> ReplayedCapAlternationCertificate:
    """Replay only against the current repository Lean sources."""

    sources = _repository_lean_source_snapshot()
    replayed = _replay_cap_alternation_certificate_from_sources(
        record,
        signature,
        variable_map_bytes,
        *sources,
        encoding,
        parent_record=parent_record,
    )
    _require_repository_sources_unchanged(sources)
    return replayed


def replay_cap_alternation_certificate_bytes(
    payload: bytes,
    signature: Mapping[str, object],
    variable_map_bytes: bytes,
    encoding: FreshThirdCarrierCnfEncoding,
    *,
    parent_record: Mapping[str, object] | None = None,
) -> ReplayedCapAlternationCertificate:
    """Strictly parse and replay one serialized certificate."""

    return replay_cap_alternation_certificate(
        load_cap_alternation_certificate(payload),
        signature,
        variable_map_bytes,
        encoding,
        parent_record=parent_record,
    )


def replay_repository_cap_alternation_certificate(
    record: Mapping[str, object],
    signature: Mapping[str, object],
    variable_map_bytes: bytes,
    encoding: FreshThirdCarrierCnfEncoding,
    *,
    parent_record: Mapping[str, object] | None = None,
) -> ReplayedCapAlternationCertificate:
    """Backward-compatible name for the repository-bound replay gate."""

    return replay_cap_alternation_certificate(
        record,
        signature,
        variable_map_bytes,
        encoding,
        parent_record=parent_record,
    )
