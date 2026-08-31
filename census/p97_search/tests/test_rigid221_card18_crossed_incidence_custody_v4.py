# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import hashlib
import json
import os
import shutil
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import rigid221_card18_crossed_incidence_custody_v3 as v3_custody
from census.p97_search import rigid221_card18_crossed_incidence_custody_v4 as custody
from census.p97_search import (
    rigid221_card18_labeled_projection_custody as labeled_custody,
)
from census.p97_search import rigid221_card18_source_custody as legacy_custody
from census.p97_search.rigid221_card18_crossed_incidence_custody_v4 import (
    FROZEN_LEAN_SOURCE_MANIFEST,
    LANE_BASE_HEAD_METADATA,
    LANE_ID_METADATA,
    LEAN_DEPENDENCY_MODULES,
    LEAN_ROOT_MODULES,
    RECEIPT_AUTHENTICATION_SCOPE,
    attest_crossed_incidence_source_custody_receipt,
    build_crossed_incidence_source_custody_receipt,
    encode_crossed_incidence_source_custody_receipt,
    parse_crossed_incidence_source_custody_receipt,
)
from census.p97_search.rigid221_card18_crossed_incidence_custody_v4 import (
    Rigid221Card18CrossedIncidenceCustodyV4Error as Rigid221Card18CrossedIncidenceCustodyError,
)

REPO_ROOT = Path(__file__).resolve().parents[3]

EXPECTED_DEPENDENCY_MODULES = (
    "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4LateChoiceTerminal.UniqueFourLateChoiceTerminal",
    "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.OriginalUniqueResidualDispatch",
    "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.UniqueArmDeletionNormalForm",
    "Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter",
    "Erdos9796Proof.P97.ATail.CriticalPairFrontier",
    "Erdos9796Proof.P97.ATail.DeletionRobustness",
    "Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer",
    "Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Types",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18FiniteDataExport",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LeafExport",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy",
    "Erdos9796Proof.P97.ATail.MinimalDeletionCore",
    "Erdos9796Proof.P97.ATail.SurvivalCover",
    "Erdos9796Proof.P97.Cap.PartitionFromMEC",
    "Erdos9796Proof.P97.Cap.Structure",
    "Erdos9796Proof.P97.MEC.Basic",
    "Erdos9796Proof.P97.Moser.Triangle",
    "Erdos9796Proof.P97.Moser.TriangleNonObtuse",
    "Erdos9796Proof.P97.U1CarrierInjection",
    "Erdos9796Proof.P97.U1TwoShortCapReduction",
    "Erdos9796Proof.P97.U5GlobalIncidenceBasic",
    "Erdos9796Proof.P97.U5ModeADeletion",
    "Erdos9796Proof.P97.WitnessPacketInterface",
)
EXPECTED_ROOT_MODULE = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "Rigid221Card18CrossedIncidenceProjection"
)
EXPECTED_CONFIGURATION_SHA256 = (
    "65e9a54afb3de9e07ac4f0a119c287a47b1ce61a08d00ff5a97c3735361dae0f"
)


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        allow_nan=False,
    ).encode("utf-8")


def _rehash(receipt: dict[str, Any]) -> bytes:
    body = copy.deepcopy(receipt)
    body.pop("receipt_sha256", None)
    receipt = {
        **body,
        "receipt_sha256": hashlib.sha256(_canonical_json_bytes(body)).hexdigest(),
    }
    return _canonical_json_bytes(receipt)


def _copy_frozen_tree(destination_root: Path) -> Path:
    destination_root.mkdir(parents=True)
    for record in FROZEN_LEAN_SOURCE_MANIFEST:
        destination = destination_root / record["path"]
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO_ROOT / record["path"], destination)
    return destination_root


def test_live_repo_source_custody_succeeds_with_narrow_claims() -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)

    assert (
        receipt["schema"]
        == "p97-rigid221-card18-crossed-incidence-projection-lean-source-custody/v4"
    )
    assert receipt["metadata"] == {
        "lane_id": LANE_ID_METADATA,
        "lane_base_head": LANE_BASE_HEAD_METADATA,
        "repository_revision": LANE_BASE_HEAD_METADATA,
        "source_snapshot": "CONTENT_ADDRESSED_LEAN_SOURCE_SET_ABOVE_LANE_BASE",
    }
    assert receipt["lean_root_modules"] == list(LEAN_ROOT_MODULES)
    assert receipt["lean_dependency_modules"] == list(LEAN_DEPENDENCY_MODULES)
    assert len(receipt["lean_source_manifest"]) == 27
    assert receipt["authentication"] == dict(RECEIPT_AUTHENTICATION_SCOPE)
    assert receipt["authentication"] == {
        "lean_source_bytes_authenticated": True,
        "revision_metadata_authenticated": False,
        "lean_build_authenticated": False,
        "olean_tree_authenticated": False,
        "axiom_audit_authenticated": False,
        "python_serialization_equivalence_authenticated": False,
        "serializer_authenticated": False,
        "solver_authenticated": False,
        "canary_authenticated": False,
    }


def test_v4_manifest_matches_v3_only_at_live_drift_rows() -> None:
    old = {row["module"]: dict(row) for row in v3_custody.FROZEN_LEAN_SOURCE_MANIFEST}
    new = {row["module"]: dict(row) for row in custody.FROZEN_LEAN_SOURCE_MANIFEST}
    assert list(old) == list(new)
    changed = [module for module in old if old[module] != new[module]]
    assert changed == [
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement",
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy"
    ]
    assert old[changed[0]]["bytes"] == 41243
    assert (
        old[changed[0]]["sha256"]
        == "2f8c444d6269de79c7a672700a9f80e6744fdaddb48263d61239cdbf99cd8210"
    )
    assert new[changed[0]]["bytes"] == 44313
    assert (
        new[changed[0]]["sha256"]
        == "49c8c3d6b8ed71c44b4f4287ce923fe63ac477432063db7875ca430753be1ea8"
    )
    assert old[changed[1]]["bytes"] == 882784
    assert (
        old[changed[1]]["sha256"]
        == "a4a906aa240101bad39424450e08f70161f8923d9d261f3892fad19685324c29"
    )
    assert new[changed[1]]["bytes"] == 907296
    assert (
        new[changed[1]]["sha256"]
        == "2f791217320ef4e3e522ab9f3cdcbb285035bd77a85d3d996a13ec2acb9c4698"
    )


def test_v3_and_v4_receipts_reject_cross_attestation() -> None:
    v3_payload = (
        REPO_ROOT
        / "certificates/rigid221_card18_crossed_incidence_source_custody_v3.json"
    ).read_bytes()
    v4_payload = encode_crossed_incidence_source_custody_receipt(
        build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    )
    with pytest.raises(
        v3_custody.Rigid221Card18CrossedIncidenceCustodyV3Error, match="schema is wrong"
    ):
        v3_custody.attest_crossed_incidence_source_custody_receipt(REPO_ROOT, v4_payload)
    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError, match="schema is wrong"
    ):
        attest_crossed_incidence_source_custody_receipt(REPO_ROOT, v3_payload)


def test_crossed_incidence_labeled_and_legacy_custody_contracts_are_separate() -> None:
    assert custody.SCHEMA != labeled_custody.SCHEMA
    assert custody.SCHEMA != legacy_custody.SCHEMA
    assert custody.Rigid221Card18CrossedIncidenceCustodyError is not (
        labeled_custody.Rigid221Card18LabeledProjectionCustodyError
    )
    assert custody.Rigid221Card18CrossedIncidenceCustodyError is not (
        legacy_custody.Rigid221Card18SourceCustodyError
    )
    assert LEAN_ROOT_MODULES == (EXPECTED_ROOT_MODULE,)
    assert labeled_custody.LEAN_ROOT_MODULES == (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection",
    )
    assert legacy_custody.LEAN_ROOT_MODULES == (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LeafExport",
    )
    assert not hasattr(custody, "build_labeled_projection_source_custody_receipt")
    assert not hasattr(custody, "build_source_custody_receipt")


def test_crossed_labeled_and_legacy_receipts_reject_cross_attestation() -> None:
    crossed_payload = encode_crossed_incidence_source_custody_receipt(
        build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    )
    labeled_payload = (
        REPO_ROOT
        / "certificates/rigid221_card18_labeled_projection_source_custody_v1.json"
    ).read_bytes()
    legacy_payload = labeled_payload

    with pytest.raises(
        labeled_custody.Rigid221Card18LabeledProjectionCustodyError,
        match="schema is wrong",
    ):
        labeled_custody.attest_labeled_projection_source_custody_receipt(
            REPO_ROOT, crossed_payload
        )
    with pytest.raises(
        legacy_custody.Rigid221Card18SourceCustodyError,
        match="schema is wrong",
    ):
        legacy_custody.attest_source_custody_receipt(REPO_ROOT, crossed_payload)
    for payload in (labeled_payload, legacy_payload):
        with pytest.raises(
            Rigid221Card18CrossedIncidenceCustodyError,
            match="schema is wrong",
        ):
            attest_crossed_incidence_source_custody_receipt(REPO_ROOT, payload)


def test_frozen_manifest_has_independent_27_row_module_path_and_byte_mapping() -> None:
    manifest = [dict(record) for record in FROZEN_LEAN_SOURCE_MANIFEST]
    modules = [record["module"] for record in manifest]
    paths = [record["path"] for record in manifest]

    assert len(manifest) == 27
    assert LEAN_DEPENDENCY_MODULES == EXPECTED_DEPENDENCY_MODULES
    assert modules == list(EXPECTED_DEPENDENCY_MODULES)
    assert custody.FROZEN_CONFIGURATION_SHA256 == EXPECTED_CONFIGURATION_SHA256
    assert len(modules) == len(set(modules))
    assert len(paths) == len(set(paths))
    assert list(zip(modules, paths, strict=True)) == sorted(
        zip(modules, paths, strict=True)
    )
    for record in manifest:
        expected_path = (
            Path("lean").joinpath(*record["module"].split(".")).with_suffix(".lean")
        )
        payload = (REPO_ROOT / expected_path).read_bytes()
        assert record["path"] == expected_path.as_posix()
        assert record["bytes"] == len(payload)
        assert record["sha256"] == hashlib.sha256(payload).hexdigest()


def test_receipt_roundtrip_is_deterministic_and_live_attested() -> None:
    first = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    second = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    first_payload = encode_crossed_incidence_source_custody_receipt(first)

    assert first == second
    assert first_payload == encode_crossed_incidence_source_custody_receipt(second)
    assert parse_crossed_incidence_source_custody_receipt(first_payload) == first
    assert (
        encode_crossed_incidence_source_custody_receipt(
            parse_crossed_incidence_source_custody_receipt(first_payload)
        )
        == first_payload
    )
    assert (
        attest_crossed_incidence_source_custody_receipt(REPO_ROOT, first_payload)
        == first
    )


def test_published_v4_receipt_canonical_roundtrip_and_live_attestation() -> None:
    payload = (
        REPO_ROOT
        / "certificates/rigid221_card18_crossed_incidence_source_custody_v4.json"
    ).read_bytes()
    parsed = parse_crossed_incidence_source_custody_receipt(payload)

    assert encode_crossed_incidence_source_custody_receipt(parsed) == payload
    assert attest_crossed_incidence_source_custody_receipt(REPO_ROOT, payload) == parsed


def _wrong_manifest_entry(receipt: dict[str, Any]) -> None:
    receipt["lean_source_manifest"][0]["module"] += ".Wrong"


def _extra_manifest_entry(receipt: dict[str, Any]) -> None:
    receipt["lean_source_manifest"].append(
        {
            "module": "Erdos9796Proof.P97.Extra",
            "path": "lean/Erdos9796Proof/P97/Extra.lean",
            "bytes": 0,
            "sha256": "0" * 64,
        }
    )


def _reorder_manifest_entries(receipt: dict[str, Any]) -> None:
    manifest = receipt["lean_source_manifest"]
    manifest[0], manifest[1] = manifest[1], manifest[0]


def _duplicate_manifest_entry(receipt: dict[str, Any]) -> None:
    receipt["lean_source_manifest"].append(
        copy.deepcopy(receipt["lean_source_manifest"][0])
    )


@pytest.mark.parametrize(
    "mutate",
    [
        _wrong_manifest_entry,
        _extra_manifest_entry,
        _reorder_manifest_entries,
        _duplicate_manifest_entry,
    ],
)
def test_receipt_rejects_wrong_extra_reordered_and_duplicate_manifest_entries(
    mutate: Callable[[dict[str, Any]], None],
) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    mutate(receipt)

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


@pytest.mark.parametrize("mutation", ["wrong", "extra", "reorder", "duplicate"])
def test_receipt_rejects_dependency_mutations(mutation: str) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    modules = receipt["lean_dependency_modules"]
    if mutation == "wrong":
        modules[0] += ".Wrong"
    elif mutation == "extra":
        modules.append("Erdos9796Proof.P97.Extra")
    elif mutation == "reorder":
        modules[0], modules[1] = modules[1], modules[0]
    else:
        modules[1] = modules[0]

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


@pytest.mark.parametrize("field", ["bytes", "sha256"])
def test_receipt_rejects_frozen_byte_or_hash_drift(field: str) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    if field == "bytes":
        receipt["lean_source_manifest"][0][field] += 1
    else:
        receipt["lean_source_manifest"][0][field] = "0" * 64

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


def test_receipt_rejects_extra_top_level_field_and_wrong_self_hash() -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt["extra"] = False
    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))

    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt["receipt_sha256"] = "0" * 64
    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(_canonical_json_bytes(receipt))


@pytest.mark.parametrize(
    "field",
    [
        "schema",
        "metadata",
        "lean_root_modules",
        "lean_dependency_modules",
        "lean_source_manifest",
        "authentication",
        "receipt_sha256",
    ],
)
def test_receipt_rejects_every_missing_top_level_field(field: str) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    del receipt[field]
    payload = (
        _canonical_json_bytes(receipt)
        if field == "receipt_sha256"
        else _rehash(receipt)
    )

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(payload)


@pytest.mark.parametrize(
    "mutation", ["not_list", "not_record", "missing", "bool_bytes"]
)
def test_receipt_rejects_malformed_source_manifest_shapes(mutation: str) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    if mutation == "not_list":
        receipt["lean_source_manifest"] = "not-a-list"
    elif mutation == "not_record":
        receipt["lean_source_manifest"][0] = []
    elif mutation == "missing":
        del receipt["lean_source_manifest"][0]["bytes"]
    else:
        receipt["lean_source_manifest"][0]["bytes"] = True

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


def test_public_validation_rejects_nonmapping_and_parser_rejects_mutable_bytes() -> (
    None
):
    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="not a mapping",
    ):
        custody.validate_crossed_incidence_source_custody_receipt([])

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="not immutable bytes",
    ):
        parse_crossed_incidence_source_custody_receipt(bytearray(b"{}"))


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("lean_source_bytes_authenticated", 1),
        ("revision_metadata_authenticated", 0),
        ("lean_build_authenticated", 0),
        ("olean_tree_authenticated", 0),
        ("axiom_audit_authenticated", 0),
        ("python_serialization_equivalence_authenticated", 0),
        ("serializer_authenticated", 0),
        ("solver_authenticated", 0),
        ("canary_authenticated", 0),
    ],
)
def test_receipt_rejects_integer_substitutes_for_booleans(
    field: str,
    replacement: int,
) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt["authentication"][field] = replacement

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError, match="scope is wrong"
    ):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


@pytest.mark.parametrize(
    "field",
    ["lean_root_modules", "lean_dependency_modules"],
)
def test_receipt_rejects_unhashable_module_entries_without_raw_type_error(
    field: str,
) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt[field][0] = {"not": "a module"}

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="modules are wrong|dependencies are wrong",
    ):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


@pytest.mark.parametrize(
    "malformed",
    [
        "lean/\x00escape.lean",
        "../escape.lean",
        "/absolute.lean",
        "lean\\escape.lean",
        "lean//escape.lean",
        "lean/./escape.lean",
        "",
    ],
)
def test_receipt_rejects_nul_and_escape_source_paths(malformed: str) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt["lean_source_manifest"][0]["path"] = malformed
    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="nonempty string|escapes repository custody",
    ):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


@pytest.mark.parametrize(
    "public_api",
    ["validate", "encode", "parse", "build", "attest", "frozen_manifest"],
)
def test_every_public_custody_path_rejects_rebound_configuration(
    monkeypatch: pytest.MonkeyPatch,
    public_api: str,
) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    payload = encode_crossed_incidence_source_custody_receipt(receipt)
    monkeypatch.setattr(custody, "SCHEMA", "attacker-rebound-schema")
    attacker_digest = custody._sha256_json(custody._configuration_snapshot())
    monkeypatch.setattr(custody, "FROZEN_CONFIGURATION_SHA256", attacker_digest)
    monkeypatch.setattr(
        custody._assert_frozen_configuration,
        "__defaults__",
        (attacker_digest,),
    )
    monkeypatch.setattr(
        custody._assert_frozen_configuration,
        "__kwdefaults__",
        {"_literal_digest": attacker_digest},
    )

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="configuration digest drifted",
    ):
        if public_api == "validate":
            custody.validate_crossed_incidence_source_custody_receipt(receipt)
        elif public_api == "encode":
            custody.encode_crossed_incidence_source_custody_receipt(receipt)
        elif public_api == "parse":
            custody.parse_crossed_incidence_source_custody_receipt(payload)
        elif public_api == "build":
            custody.build_crossed_incidence_source_custody_receipt(REPO_ROOT)
        elif public_api == "attest":
            custody.attest_crossed_incidence_source_custody_receipt(REPO_ROOT, payload)
        else:
            custody.frozen_crossed_incidence_lean_source_manifest()


def test_literal_baseline_rejects_rebound_receipt_field_policy(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt["attacker"] = "field admitted only by rebound policy"
    monkeypatch.setattr(
        custody,
        "_RECEIPT_FIELDS",
        frozenset({*custody._RECEIPT_FIELDS, "attacker"}),
    )
    attacker_digest = custody._sha256_json(custody._configuration_snapshot())
    monkeypatch.setattr(custody, "FROZEN_CONFIGURATION_SHA256", attacker_digest)

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="configuration digest drifted",
    ):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))


def test_receipt_rejects_duplicate_json_keys_and_noncanonical_bytes() -> None:
    payload = encode_crossed_incidence_source_custody_receipt(
        build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    )
    duplicated = payload.replace(
        b'{"authentication":',
        b'{"authentication":{},"authentication":',
        1,
    )
    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError, match="duplicate JSON"
    ):
        parse_crossed_incidence_source_custody_receipt(duplicated)

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError, match="not canonical"
    ):
        parse_crossed_incidence_source_custody_receipt(payload + b"\n")


@pytest.mark.parametrize("constant", [b"NaN", b"Infinity", b"-Infinity"])
def test_receipt_rejects_nonfinite_json_constants(constant: bytes) -> None:
    payload = b'{"nonfinite":' + constant + b"}"

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="invalid JSON constant",
    ):
        parse_crossed_incidence_source_custody_receipt(payload)


def test_live_custody_rejects_byte_drift(tmp_path: Path) -> None:
    root = _copy_frozen_tree(tmp_path / "repo")
    target = root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    target.write_bytes(target.read_bytes() + b"\n-- drift\n")

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError, match="bytes drifted"
    ):
        build_crossed_incidence_source_custody_receipt(root)


def test_live_custody_rejects_missing_and_nonregular_sources(
    tmp_path: Path,
) -> None:
    missing_root = _copy_frozen_tree(tmp_path / "missing")
    missing = missing_root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    missing.unlink()
    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError, match="missing"):
        build_crossed_incidence_source_custody_receipt(missing_root)

    directory_root = _copy_frozen_tree(tmp_path / "directory")
    nonregular = directory_root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    nonregular.unlink()
    nonregular.mkdir()
    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError, match="regular"):
        build_crossed_incidence_source_custody_receipt(directory_root)


def test_live_custody_rejects_fifo_without_blocking(tmp_path: Path) -> None:
    if not hasattr(os, "mkfifo"):
        pytest.skip("FIFOs are unavailable on this platform")
    root = _copy_frozen_tree(tmp_path / "fifo")
    fifo = root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    fifo.unlink()
    os.mkfifo(fifo)

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError, match="regular"):
        build_crossed_incidence_source_custody_receipt(root)


@pytest.mark.parametrize("operation", ["build", "attest"])
def test_live_custody_rejects_outside_hardlink_alias(
    tmp_path: Path,
    operation: str,
) -> None:
    if not hasattr(os, "link"):
        pytest.skip("hardlinks are unavailable on this platform")
    root = _copy_frozen_tree(tmp_path / "repo")
    target = root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    outside_alias = tmp_path / "outside-hardlink.lean"
    try:
        os.link(target, outside_alias)
    except (NotImplementedError, OSError) as exc:
        pytest.skip(f"hardlinks are unavailable on this filesystem: {exc}")
    assert target.stat().st_nlink == 2

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError, match="singly linked"
    ):
        if operation == "build":
            build_crossed_incidence_source_custody_receipt(root)
        else:
            payload = encode_crossed_incidence_source_custody_receipt(
                build_crossed_incidence_source_custody_receipt(REPO_ROOT)
            )
            attest_crossed_incidence_source_custody_receipt(root, payload)


@pytest.mark.parametrize("operation", ["build", "attest"])
def test_live_custody_rejects_inside_repository_hardlink_alias(
    tmp_path: Path,
    operation: str,
) -> None:
    if not hasattr(os, "link"):
        pytest.skip("hardlinks are unavailable on this platform")
    root = _copy_frozen_tree(tmp_path / "repo")
    target = root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    inside_alias = target.with_name("inside-hardlink.lean")
    try:
        os.link(target, inside_alias)
    except (NotImplementedError, OSError) as exc:
        pytest.skip(f"hardlinks are unavailable on this filesystem: {exc}")
    assert target.stat().st_nlink == 2
    assert inside_alias.is_relative_to(root)

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="singly linked",
    ):
        if operation == "build":
            build_crossed_incidence_source_custody_receipt(root)
        else:
            payload = encode_crossed_incidence_source_custody_receipt(
                build_crossed_incidence_source_custody_receipt(REPO_ROOT)
            )
            attest_crossed_incidence_source_custody_receipt(root, payload)


def test_live_custody_rejects_symlinked_source_ancestor(tmp_path: Path) -> None:
    if not hasattr(os, "symlink"):
        pytest.skip("symlinks are unavailable on this platform")
    outside = _copy_frozen_tree(tmp_path / "outside")
    root = tmp_path / "repo"
    root.mkdir()
    (root / "lean").symlink_to(outside / "lean", target_is_directory=True)

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError, match="symlinked"):
        build_crossed_incidence_source_custody_receipt(root)


def test_live_custody_rejects_symlinked_leaf_and_root(tmp_path: Path) -> None:
    if not hasattr(os, "symlink"):
        pytest.skip("symlinks are unavailable on this platform")
    root = _copy_frozen_tree(tmp_path / "repo")
    target = root / FROZEN_LEAN_SOURCE_MANIFEST[0]["path"]
    outside = tmp_path / "outside.lean"
    shutil.copyfile(target, outside)
    target.unlink()
    target.symlink_to(outside)
    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError, match="symlinked"):
        build_crossed_incidence_source_custody_receipt(root)

    canonical_root = _copy_frozen_tree(tmp_path / "canonical")
    linked_root = tmp_path / "linked-root"
    linked_root.symlink_to(canonical_root, target_is_directory=True)
    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError, match="symlink"):
        build_crossed_incidence_source_custody_receipt(linked_root)


def test_live_custody_wraps_symlink_loop_resolution(tmp_path: Path) -> None:
    if not hasattr(os, "symlink"):
        pytest.skip("symlinks are unavailable on this platform")
    first = tmp_path / "loop-a"
    second = tmp_path / "loop-b"
    first.symlink_to(second, target_is_directory=True)
    second.symlink_to(first, target_is_directory=True)

    with pytest.raises(Rigid221Card18CrossedIncidenceCustodyError):
        build_crossed_incidence_source_custody_receipt(first)


def test_frozen_manifest_api_returns_independent_mutable_copies() -> None:
    first = custody.frozen_crossed_incidence_lean_source_manifest()
    second = custody.frozen_crossed_incidence_lean_source_manifest()
    first[0]["module"] = "attacker-mutated-copy"

    assert second[0]["module"] == EXPECTED_DEPENDENCY_MODULES[0]
    assert FROZEN_LEAN_SOURCE_MANIFEST[0]["module"] == EXPECTED_DEPENDENCY_MODULES[0]
    with pytest.raises(TypeError):
        FROZEN_LEAN_SOURCE_MANIFEST[0]["module"] = "forbidden"


def test_receipt_does_not_authenticate_or_embed_axiom_receipt() -> None:
    payload = encode_crossed_incidence_source_custody_receipt(
        build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    )

    assert b"crossed_incidence_projection_axioms" not in payload
    assert b"proof-blueprint axioms" not in payload
    parsed = parse_crossed_incidence_source_custody_receipt(payload)
    assert parsed["authentication"]["axiom_audit_authenticated"] is False
    assert parsed["authentication"]["serializer_authenticated"] is False
    assert parsed["authentication"]["canary_authenticated"] is False


def test_receipt_rejects_wrong_root_even_with_recomputed_self_hash() -> None:
    receipt = build_crossed_incidence_source_custody_receipt(REPO_ROOT)
    receipt["lean_root_modules"] = list(labeled_custody.LEAN_ROOT_MODULES)

    with pytest.raises(
        Rigid221Card18CrossedIncidenceCustodyError,
        match="root modules are wrong",
    ):
        parse_crossed_incidence_source_custody_receipt(_rehash(receipt))
