# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import hashlib
from pathlib import Path

import pytest

import census.p97_search.freshthird_qfiber_three_carrier_cap_alternation_replay_v1 as replay_module
from census.p97_search.freshthird_qfiber_three_carrier_cap_alternation_replay_v1 import (
    CAP_ALTERNATION_CERTIFICATE_CLAIMS,
    CAP_ALTERNATION_CERTIFICATE_SCHEMA,
    CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT,
    CAP_ALTERNATION_LEAN_AGGREGATE_PATH,
    CAP_ALTERNATION_LEAN_DECLARATIONS,
    CAP_ALTERNATION_LEAN_INGRESS_PATH,
    CAP_ALTERNATION_LEAN_QUERY_PATH,
    CAP_ALTERNATION_RECORD_HASH_DOMAIN,
    CAP_ALTERNATION_SOURCE_THEOREMS,
    SEMANTIC_SIGNATURE_SCOPE,
    CapAlternationCertificateError,
    build_cap_alternation_certificate,
    cap_alternation_certificate_bytes,
    load_cap_alternation_certificate,
    replay_cap_alternation_certificate,
    replay_cap_alternation_certificate_bytes,
    replay_repository_cap_alternation_certificate,
    repository_lean_aggregate_bytes,
    repository_lean_ingress_bytes,
    repository_lean_query_bytes,
)

REPOSITORY_ROOT = Path(__file__).resolve().parents[3]
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    DELETION_CENTERS,
    RADIUS_CENTERS,
    ROLES,
    _canonical_json,
)


@pytest.fixture(scope="module")
def encoding() -> FreshThirdCarrierCnfEncoding:
    return FreshThirdCarrierCnfEncoding(0)


def _signature_for_bits(bits: tuple[bool, ...]) -> dict[str, object]:
    assert len(bits) == len(ROLES)
    return {
        "point_classes": {role: i for i, role in enumerate(ROLES)},
        "cap_witnesses": {
            "first": 0,
            "fresh": 1,
            "row": 0,
            "boundary": 0,
            "blocker": [0, 1, 2, 0],
            "boundary_fan": [0, 1, 2, 0],
        },
        "order": {role: i for i, role in enumerate(ROLES)},
        "in_cap": {role: [bits[i], not bits[i], False] for i, role in enumerate(ROLES)},
        "in_cap_interior": {role: [False, False, False] for role in ROLES},
        "radius_classes": {center: [0 for _role in ROLES] for center in RADIUS_CENTERS},
        "has_four_after_deleting": {
            center: [True for _role in ROLES] for center in DELETION_CENTERS
        },
        "nonrobust": {role: False for role in ROLES},
    }


@pytest.fixture(scope="module")
def signature() -> dict[str, object]:
    bits = (True, False, True, False, *(False for _ in ROLES[4:]))
    return _signature_for_bits(bits)


@pytest.fixture(scope="module")
def lean_ingress_bytes() -> bytes:
    return repository_lean_ingress_bytes()


@pytest.fixture(scope="module")
def lean_aggregate_bytes() -> bytes:
    return repository_lean_aggregate_bytes()


@pytest.fixture(scope="module")
def lean_query_bytes() -> bytes:
    return repository_lean_query_bytes()


@pytest.fixture(scope="module")
def certificate(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
) -> dict[str, object]:
    refinement = encoding.cap_alternation_refinement_from_signature(signature)
    assert refinement is not None
    return build_cap_alternation_certificate(encoding, refinement)


@pytest.fixture(scope="module")
def variable_map_bytes(encoding: FreshThirdCarrierCnfEncoding) -> bytes:
    return _canonical_json(encoding.variable_map())


def _rehash_record(record: dict[str, object]) -> None:
    payload = {key: value for key, value in record.items() if key != "record_sha256"}
    domain = CAP_ALTERNATION_RECORD_HASH_DOMAIN.encode("ascii") + b"\0"
    record["record_sha256"] = hashlib.sha256(
        domain + _canonical_json(payload)
    ).hexdigest()


def test_positive_record_replays_deterministically(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
) -> None:
    replay = replay_cap_alternation_certificate(
        certificate,
        signature,
        variable_map_bytes,
        encoding,
    )
    assert certificate["schema"] == CAP_ALTERNATION_CERTIFICATE_SCHEMA
    assert certificate["source_theorems"] == list(CAP_ALTERNATION_SOURCE_THEOREMS)
    assert certificate["lean_declarations"] == list(CAP_ALTERNATION_LEAN_DECLARATIONS)
    assert certificate["lean_query_path"] == CAP_ALTERNATION_LEAN_QUERY_PATH
    assert certificate["lean_ingress_path"] == CAP_ALTERNATION_LEAN_INGRESS_PATH
    assert certificate["lean_aggregate_path"] == CAP_ALTERNATION_LEAN_AGGREGATE_PATH
    assert certificate["record_hash_domain"] == CAP_ALTERNATION_RECORD_HASH_DOMAIN
    assert certificate["signature_scope"] == SEMANTIC_SIGNATURE_SCOPE
    assert certificate["claims"] == list(CAP_ALTERNATION_CERTIFICATE_CLAIMS)
    assert replay.clause == tuple(certificate["clause"])
    assert replay.certificate_sha256 == certificate["record_sha256"]
    assert (
        replay_cap_alternation_certificate_bytes(
            cap_alternation_certificate_bytes(certificate),
            signature,
            variable_map_bytes,
            encoding,
        )
        == replay
    )
    assert (
        replay_repository_cap_alternation_certificate(
            certificate, signature, variable_map_bytes, encoding
        )
        == replay
    )


@pytest.mark.parametrize(
    ("prefix", "membership_signs"),
    (
        ((True, False, True, False), (-1, 1, -1, 1)),
        ((False, True, False, True), (1, -1, 1, -1)),
    ),
)
def test_both_membership_parities_match_the_lean_clause_signs(
    encoding: FreshThirdCarrierCnfEncoding,
    variable_map_bytes: bytes,
    prefix: tuple[bool, bool, bool, bool],
    membership_signs: tuple[int, int, int, int],
) -> None:
    signature = _signature_for_bits((*prefix, *(False for _ in ROLES[len(prefix) :])))
    refinement = encoding.cap_alternation_refinement_from_signature(signature)
    assert refinement is not None
    a, b, c, d = ROLES[:4]
    expected_clause = (
        -encoding.before(a, b),
        -encoding.before(b, c),
        -encoding.before(c, d),
        *(
            sign * encoding.in_cap(role, 0)
            for sign, role in zip(membership_signs, ROLES[:4], strict=True)
        ),
    )
    assert refinement.membership == prefix
    assert refinement.clause == expected_clause
    certificate = build_cap_alternation_certificate(encoding, refinement)
    assert (
        replay_cap_alternation_certificate(
            certificate,
            signature,
            variable_map_bytes,
            encoding,
        ).clause
        == expected_clause
    )


def test_lean_ingress_is_reachable_from_frontier_aggregate() -> None:
    aggregate = (REPOSITORY_ROOT / CAP_ALTERNATION_LEAN_AGGREGATE_PATH).read_text(
        encoding="utf-8"
    )
    assert CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT in aggregate.splitlines()


def test_repository_lean_source_toctou_fails_closed(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
    lean_query_bytes: bytes,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    refinement = encoding.cap_alternation_refinement_from_signature(signature)
    assert refinement is not None
    for operation in (
        lambda: build_cap_alternation_certificate(encoding, refinement),
        lambda: replay_cap_alternation_certificate(
            certificate, signature, variable_map_bytes, encoding
        ),
    ):
        query_reads = iter((lean_query_bytes, lean_query_bytes + b"\n"))
        with monkeypatch.context() as source_patch:
            source_patch.setattr(
                replay_module,
                "repository_lean_query_bytes",
                lambda reads=query_reads: next(reads),
            )
            with pytest.raises(
                CapAlternationCertificateError,
                match="Lean query changed during certificate operation",
            ):
                operation()


@pytest.mark.parametrize(
    ("field", "value", "message"),
    (
        ("schema", "wrong", "schema mismatch"),
        ("refinement_schema", "wrong", "refinement schema mismatch"),
        ("boundary_index", 1, "boundary does not match"),
        ("cap", 3, "invalid cap"),
        ("membership", [True, True, False, False], "not alternating"),
        ("source_theorems", [], "source theorem chain"),
        ("lean_declarations", [], "qualified Lean declaration"),
        ("lean_query_path", "wrong", "Lean query path"),
        ("lean_query_sha256", "0" * 64, "Lean query source hash"),
        ("lean_ingress_path", "wrong", "Lean ingress path"),
        ("lean_ingress_sha256", "0" * 64, "Lean ingress source hash"),
        ("lean_aggregate_path", "wrong", "Lean aggregate path"),
        ("lean_aggregate_sha256", "0" * 64, "Lean aggregate source hash"),
        ("lean_aggregate_import", "wrong", "Lean aggregate import"),
        ("signature_scope", "wrong", "signature scope"),
        ("claims", [], "certificate claims"),
        ("model_signature_sha256", "0" * 64, "model signature hash"),
        ("encoding_manifest_sha256", "0" * 64, "encoding manifest hash"),
        ("source_manifest_sha256", "0" * 64, "source manifest hash"),
        ("cnf_sha256", "0" * 64, "CNF hash"),
        ("variable_map_sha256", "0" * 64, "variable-map hash"),
        ("clause_sha256", "0" * 64, "clause hash"),
        ("record_hash_domain", "wrong", "record hash domain"),
    ),
)
def test_top_level_mutations_fail_closed(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
    field: str,
    value: object,
    message: str,
) -> None:
    mutated = copy.deepcopy(certificate)
    mutated[field] = value
    _rehash_record(mutated)
    with pytest.raises(CapAlternationCertificateError, match=message):
        replay_cap_alternation_certificate(
            mutated,
            signature,
            variable_map_bytes,
            encoding,
        )


def test_key_set_mutations_fail_closed(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
) -> None:
    missing = copy.deepcopy(certificate)
    del missing["clause"]
    with pytest.raises(CapAlternationCertificateError, match="keys mismatch"):
        replay_cap_alternation_certificate(
            missing,
            signature,
            variable_map_bytes,
            encoding,
        )
    extra = copy.deepcopy(certificate)
    extra["unexpected"] = True
    with pytest.raises(CapAlternationCertificateError, match="keys mismatch"):
        replay_cap_alternation_certificate(
            extra,
            signature,
            variable_map_bytes,
            encoding,
        )


def test_role_and_clause_mutations_fail_closed(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
) -> None:
    duplicate_role = copy.deepcopy(certificate)
    duplicate_role["roles"][1] = duplicate_role["roles"][0]
    with pytest.raises(CapAlternationCertificateError, match="four distinct known"):
        replay_cap_alternation_certificate(
            duplicate_role,
            signature,
            variable_map_bytes,
            encoding,
        )
    wrong_clause = copy.deepcopy(certificate)
    wrong_clause["clause"][3] *= -1
    wrong_clause["clause_sha256"] = hashlib.sha256(
        _canonical_json(wrong_clause["clause"])
    ).hexdigest()
    _rehash_record(wrong_clause)
    with pytest.raises(CapAlternationCertificateError, match="semantic projection"):
        replay_cap_alternation_certificate(
            wrong_clause,
            signature,
            variable_map_bytes,
            encoding,
        )
    boolean_literal = copy.deepcopy(certificate)
    boolean_literal["clause"][0] = True
    with pytest.raises(CapAlternationCertificateError, match="integer literals"):
        replay_cap_alternation_certificate(
            boolean_literal,
            signature,
            variable_map_bytes,
            encoding,
        )


def test_signature_order_and_membership_are_replayed(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
) -> None:
    wrong_order = copy.deepcopy(signature)
    left, right = certificate["roles"][:2]
    wrong_order["order"][left], wrong_order["order"][right] = (
        wrong_order["order"][right],
        wrong_order["order"][left],
    )
    rebound = copy.deepcopy(certificate)
    rebound["model_signature_sha256"] = hashlib.sha256(
        _canonical_json(wrong_order)
    ).hexdigest()
    _rehash_record(rebound)
    with pytest.raises(CapAlternationCertificateError, match="in increasing order"):
        replay_cap_alternation_certificate(
            rebound,
            wrong_order,
            variable_map_bytes,
            encoding,
        )

    wrong_membership = copy.deepcopy(signature)
    wrong_membership["in_cap"][left][certificate["cap"]] = False
    rebound = copy.deepcopy(certificate)
    rebound["model_signature_sha256"] = hashlib.sha256(
        _canonical_json(wrong_membership)
    ).hexdigest()
    _rehash_record(rebound)
    with pytest.raises(
        CapAlternationCertificateError, match="disagrees with signature"
    ):
        replay_cap_alternation_certificate(
            rebound,
            wrong_membership,
            variable_map_bytes,
            encoding,
        )

    malformed_complete_shape = copy.deepcopy(signature)
    malformed_complete_shape["unexpected"] = []
    rebound = copy.deepcopy(certificate)
    rebound["model_signature_sha256"] = hashlib.sha256(
        _canonical_json(malformed_complete_shape)
    ).hexdigest()
    _rehash_record(rebound)
    with pytest.raises(CapAlternationCertificateError, match="signature key mismatch"):
        replay_cap_alternation_certificate(
            rebound,
            malformed_complete_shape,
            variable_map_bytes,
            encoding,
        )


def test_variable_map_parent_and_record_hashes_fail_closed(
    encoding: FreshThirdCarrierCnfEncoding,
    signature: dict[str, object],
    certificate: dict[str, object],
    variable_map_bytes: bytes,
    lean_query_bytes: bytes,
    lean_ingress_bytes: bytes,
    lean_aggregate_bytes: bytes,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    with pytest.raises(CapAlternationCertificateError, match="variable-map bytes"):
        replay_cap_alternation_certificate(
            certificate,
            signature,
            variable_map_bytes + b"\n",
            encoding,
        )
    for helper, mutated, message in (
        (
            "repository_lean_query_bytes",
            lean_query_bytes + b"\n",
            "Lean query source hash",
        ),
        (
            "repository_lean_ingress_bytes",
            lean_ingress_bytes + b"\n",
            "Lean ingress source hash",
        ),
        (
            "repository_lean_aggregate_bytes",
            lean_aggregate_bytes + b"\n",
            "Lean aggregate source hash",
        ),
    ):
        with monkeypatch.context() as source_patch:
            source_patch.setattr(replay_module, helper, lambda value=mutated: value)
            with pytest.raises(CapAlternationCertificateError, match=message):
                replay_cap_alternation_certificate(
                    certificate,
                    signature,
                    variable_map_bytes,
                    encoding,
                )
    refinement = encoding.cap_alternation_refinement_from_signature(signature)
    assert refinement is not None
    without_source_theorem = lean_query_bytes.replace(
        b"theorem noAlternatingCap_ofView",
        b"theorem removed_noAlternatingCap",
        1,
    )
    with monkeypatch.context() as source_patch:
        source_patch.setattr(
            replay_module,
            "repository_lean_query_bytes",
            lambda: without_source_theorem,
        )
        with pytest.raises(
            CapAlternationCertificateError, match="query source theorem is absent"
        ):
            build_cap_alternation_certificate(encoding, refinement)
    without_theorem = lean_ingress_bytes.replace(
        b"theorem capAlternationClause_of_noAlternatingCap",
        b"theorem removed_capAlternationClause",
        1,
    )
    with monkeypatch.context() as source_patch:
        source_patch.setattr(
            replay_module, "repository_lean_ingress_bytes", lambda: without_theorem
        )
        with pytest.raises(
            CapAlternationCertificateError, match="ingress theorem is absent"
        ):
            build_cap_alternation_certificate(encoding, refinement)
    aggregate_import = CAP_ALTERNATION_LEAN_AGGREGATE_IMPORT.encode("utf-8")
    without_import = lean_aggregate_bytes.replace(aggregate_import, b"", 1)
    with monkeypatch.context() as source_patch:
        source_patch.setattr(
            replay_module, "repository_lean_aggregate_bytes", lambda: without_import
        )
        with pytest.raises(
            CapAlternationCertificateError, match="aggregate import is absent"
        ):
            build_cap_alternation_certificate(encoding, refinement)
    bad_parent = copy.deepcopy(certificate)
    bad_parent["parent_record_sha256"] = "not-a-hash"
    _rehash_record(bad_parent)
    with pytest.raises(CapAlternationCertificateError, match="parent_record_sha256"):
        replay_cap_alternation_certificate(
            bad_parent,
            signature,
            variable_map_bytes,
            encoding,
        )

    chained = build_cap_alternation_certificate(
        encoding,
        refinement,
        parent_record=certificate,
    )
    with pytest.raises(CapAlternationCertificateError, match="parent record presence"):
        replay_cap_alternation_certificate(
            chained,
            signature,
            variable_map_bytes,
            encoding,
        )
    wrong_parent = copy.deepcopy(certificate)
    wrong_parent["claims"] = []
    _rehash_record(wrong_parent)
    with pytest.raises(CapAlternationCertificateError, match="parent record hash"):
        replay_cap_alternation_certificate(
            chained,
            signature,
            variable_map_bytes,
            encoding,
            parent_record=wrong_parent,
        )
    replay_cap_alternation_certificate(
        chained,
        signature,
        variable_map_bytes,
        encoding,
        parent_record=certificate,
    )
    bad_record_hash = copy.deepcopy(certificate)
    bad_record_hash["record_sha256"] = "0" * 64
    with pytest.raises(CapAlternationCertificateError, match="record hash"):
        replay_cap_alternation_certificate(
            bad_record_hash,
            signature,
            variable_map_bytes,
            encoding,
        )


def test_strict_json_loader_rejects_duplicate_keys_and_nan() -> None:
    with pytest.raises(CapAlternationCertificateError, match="duplicate JSON key"):
        load_cap_alternation_certificate(b'{"schema":"a","schema":"b"}')
    with pytest.raises(CapAlternationCertificateError, match="non-standard JSON"):
        load_cap_alternation_certificate(b'{"schema":NaN}')
    with pytest.raises(CapAlternationCertificateError, match="one JSON object"):
        load_cap_alternation_certificate(b"[]")
    with pytest.raises(CapAlternationCertificateError, match="not canonical"):
        load_cap_alternation_certificate(b'{"schema": "spaced"}')
