from __future__ import annotations

import copy
import hashlib
import json
from pathlib import Path

import pytest

import census.p97_search.cegar_wave_semantic_profiles as semantic_profiles
from census.p97_search.cegar_wave_semantic_profiles import (
    EXACT17_CHILD46,
    CapturedBytes,
    SemanticProfileError,
    validate_semantic_profile,
)
from census.p97_search.phase3_cegar_wave import canonical_json_bytes


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _json(value: object) -> bytes:
    return canonical_json_bytes(value)


def _packet(
    tmp_path: Path,
) -> tuple[
    bytes,
    dict[str, CapturedBytes],
    dict[str, object],
    semantic_profiles._Child46Authority,
]:
    """Make a tiny internally authenticated Child46 packet.

    The production authority is deliberately replaced by this packet in each
    test.  This exercises the complete validator without opening the large
    retained campaign artifacts.
    """

    parent_data = b"p cnf 3 1\n1 0\n"
    suffix = [
        b"-1 0\n",
        b"2 0\n",
        b"-2 0\n",
        b"3 0\n",
        b"-3 0\n",
        b"1 2 0\n",
        b"1 -2 0\n",
        b"1 3 0\n",
        b"1 -3 0\n",
        b"-1 2 0\n",
        b"-1 -2 0\n",
        b"-1 3 0\n",
        b"-1 -3 0\n",
    ]
    child_data = (
        b"p cnf 3 14\n" + parent_data.splitlines(keepends=True)[1] + b"".join(suffix)
    )
    paths = {
        role: tmp_path / name
        for role, name in {
            "parent_cnf": "parent.cnf",
            "child_cnf": "child.cnf",
            "strict_replay_receipt": "strict.json",
            "terminal_envelope": "envelope.json",
            "occurrence_ledger": "ledger.json",
            "export_receipt": "export.json",
            "lean_root": "Root.lean",
            "lean_export": "Export.lean",
        }.items()
    }
    parent_sha = _sha(parent_data)
    child_sha = _sha(child_data)
    suffix_sha = _sha(b"".join(suffix))
    parent_record = {
        "sha256": parent_sha,
        "variables": 3,
        "clauses": 1,
    }
    child_record = {
        "sha256": child_sha,
        "variables": 3,
        "clauses": 14,
    }
    schemas = {
        "strict_replay_receipt": "test-strict/v1",
        "terminal_envelope": "test-envelope/v1",
        "occurrence_ledger": "test-ledger/v1",
        "export_receipt": "test-export/v1",
        "validation": "test-validation/v1",
    }
    cell_ids = [
        *(f"next-center-{index:02d}" for index in range(8)),
        *(f"next-center-{index:02d}" for index in range(12, 17)),
    ]
    embedded_envelope_sha = _sha(b"embedded envelope")
    cells = [
        {
            "cell_id": cell_id,
            "status": "SAT",
            "state": "ATTEMPTED",
            "source_replayed": True,
            "closure_claim": False,
            "proof_verified": False,
            "discovery_scope": "sat-witness-replayed",
            "semantic_replay": {
                "result": {"kalmanson": {"status": "LINEARLY_INFEASIBLE"}}
            },
        }
        for cell_id in cell_ids
    ]
    envelope = {
        "schema": schemas["terminal_envelope"],
        "session_id": "test-session",
        "wave_kind": "ASSUMPTION_CNF",
        "adapter": None,
        "execution_registration": None,
        "control": None,
        "package": None,
        "wave_manifest": None,
        "campaign": None,
        "parent": None,
        "runtime_solver": None,
        "cells": cells,
        "summary": {
            "attempted": 13,
            "classification": "SAT_SEMANTIC_REPLAYED",
            "not_run": 0,
            "sat": 13,
            "total_cells": 13,
            "unknown": 0,
            "unsat": 0,
        },
        "claims": None,
        "close_observed": None,
        "envelope_sha256": embedded_envelope_sha,
    }
    envelope_data = _json(envelope)
    strict = {
        "schema": schemas["strict_replay_receipt"],
        "status": "PASS",
        "command": "validate-replay",
        "classification": "SAT_SEMANTIC_REPLAYED",
        "custody_status": "OFFLINE_CROSS_BOUND",
        "envelope_sha256": embedded_envelope_sha,
        "output": str(paths["terminal_envelope"]),
    }
    strict_data = _json(strict)
    ledger = {
        "schema": schemas["occurrence_ledger"],
        "status": "AUTHENTICATED_PROMOTABLE",
        "input": None,
        "receipt": {"sha256": _sha(strict_data)},
        "terminal_envelope": {
            "sha256": _sha(envelope_data),
            "embedded_sha256": embedded_envelope_sha,
        },
        "producer_manifest_sha256": None,
        "profile_sha256": None,
        "child44_source_parent": None,
        "child45_root": None,
        "predecessor": None,
        "predecessor_export": {"sha256": parent_sha},
        "cell_provenance": [{"cell_id": cell_id} for cell_id in cell_ids],
        "full_certificate_records": [{} for _ in range(11)],
        "support_dedup": None,
        "inherited_support_census": None,
        "audit": {
            "full_unique_count": 11,
            "support_unique_count": 9,
            "non_subsumed": True,
        },
        "new_root": {"parent_clauses": 1, "new_clauses": 13, "clauses": 14},
    }
    ledger_data = _json(ledger)
    validation = {
        "schema": schemas["validation"],
        "status": "PASS",
        "parent_sha256": parent_sha,
        "child_sha256": child_sha,
        "parent_bytes": len(parent_data),
        "child_bytes": len(child_data),
        "variables": 3,
        "parent_clauses": 1,
        "new_clauses": 13,
        "child_clauses": 14,
        "ordered_suffix_sha256": suffix_sha,
        "parent_subsumed_suffix_indices": [],
        "authenticated_model_cut_suffix_indices": list(range(1, 14)),
        "cell_model_rejections": [
            {
                "cell_id": cell_id,
                "rejected_suffix_indices": [index],
                "representative_cell": "next-center-00",
                "required_rejected_suffix_index": index,
            }
            for index, cell_id in enumerate(cell_ids, 1)
        ],
    }
    lean_root_data = (
        b"sourceAssign_extendedFortySixthModelRefinementsCnf\n"
        b"false_of_sourceRealization_of_extendedFortySixthModelRefinementsCnf_unsat\n"
    )
    lean_export_data = b"extendedFortySixthModelRefinementsDimacsString\n"
    export = {
        "schema": schemas["export_receipt"],
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "parent": {
            "path": str(paths["parent_cnf"]),
            **parent_record,
            "bytes": len(parent_data),
        },
        "strict_replay_receipt": {
            "path": str(paths["strict_replay_receipt"]),
            "sha256": _sha(strict_data),
        },
        "terminal_envelope": {
            "path": str(paths["terminal_envelope"]),
            "sha256": _sha(envelope_data),
            "embedded_sha256": embedded_envelope_sha,
        },
        "occurrence_ledger": {
            "path": str(paths["occurrence_ledger"]),
            "sha256": _sha(ledger_data),
        },
        "lean": {
            "root": {
                "path": str(paths["lean_root"]),
                "sha256": _sha(lean_root_data),
            },
            "export": {
                "path": str(paths["lean_export"]),
                "sha256": _sha(lean_export_data),
            },
        },
        "child": {
            "path": str(paths["child_cnf"]),
            **child_record,
            "bytes": len(child_data),
        },
        "validation": validation,
        "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
    }
    export_data = _json(export)
    payloads = {
        "parent_cnf": parent_data,
        "child_cnf": child_data,
        "strict_replay_receipt": strict_data,
        "terminal_envelope": envelope_data,
        "occurrence_ledger": ledger_data,
        "export_receipt": export_data,
        "lean_root": lean_root_data,
        "lean_export": lean_export_data,
    }
    captures = {
        role: CapturedBytes(data, paths[role]) for role, data in payloads.items()
    }
    evidence = {
        "strict_replay_receipt_sha256": captures["strict_replay_receipt"].digest,
        "terminal_envelope_sha256": captures["terminal_envelope"].digest,
        "terminal_envelope_embedded_sha256": embedded_envelope_sha,
        "occurrence_ledger_sha256": captures["occurrence_ledger"].digest,
        "export_receipt_sha256": captures["export_receipt"].digest,
        "cell_count": 13,
        "full_certificate_count": 11,
        "support_count": 9,
        "new_clause_count": 13,
        "parent_subsumed_suffix_indices": [],
        "authenticated_model_cut_suffix_indices": list(range(1, 14)),
    }
    profile = {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "profile_id": EXACT17_CHILD46,
        "validator": EXACT17_CHILD46,
        "classification": {"scope": "finite", "mode": "offline"},
        "control": {
            "domain_kind": "STATIC_CNF",
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
            "cnf_sha256": child_sha,
            "variables": 3,
            "clauses": 14,
        },
        "cleanup": {"cleanup_eligible": False, "lifecycle": "RETAIN"},
        "contract": {
            "parent": parent_record,
            "child": child_record,
            "evidence": evidence,
            "ordered_suffix_sha256": suffix_sha,
            "schemas": schemas,
            "artifact_roles": sorted(payloads),
        },
    }
    profile_bytes = _json(profile)
    authority = semantic_profiles._Child46Authority(
        profile_bytes=profile_bytes,
        artifact_sha256=tuple(
            sorted((role, capture.digest) for role, capture in captures.items())
        ),
    )
    return profile_bytes, captures, profile, authority


def test_child46_synthetic_packet_passes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, _profile, authority = _packet(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD46_AUTHORITY", authority)
    result = validate_semantic_profile(profile_bytes, captures)
    assert result["status"] == "PASS"
    assert result["clauses"] == 14


def test_child46_rejects_profile_mutation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _profile_bytes, captures, profile, authority = _packet(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD46_AUTHORITY", authority)
    mutated = copy.deepcopy(profile)
    mutated["contract"]["evidence"]["support_count"] = 8
    with pytest.raises(SemanticProfileError, match="source-authoritative identity"):
        validate_semantic_profile(_json(mutated), captures)


def test_child46_rejects_artifact_mutation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, _profile, authority = _packet(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD46_AUTHORITY", authority)
    mutated = dict(captures)
    mutated["lean_root"] = CapturedBytes(
        captures["lean_root"].data + b"tamper", captures["lean_root"].path
    )
    with pytest.raises(SemanticProfileError, match="artifact crossed"):
        validate_semantic_profile(profile_bytes, mutated)


def test_child46_rejects_cross_bound_artifacts(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, _profile, authority = _packet(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD46_AUTHORITY", authority)
    crossed = dict(captures)
    crossed["strict_replay_receipt"], crossed["occurrence_ledger"] = (
        crossed["occurrence_ledger"],
        crossed["strict_replay_receipt"],
    )
    with pytest.raises(SemanticProfileError, match="artifact crossed"):
        validate_semantic_profile(profile_bytes, crossed)


def test_child46_rejects_authenticated_model_cut_mutation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, _profile, authority = _packet(tmp_path)
    export = json.loads(captures["export_receipt"].data)
    export["validation"]["cell_model_rejections"][0][
        "required_rejected_suffix_index"
    ] = 2
    mutated_export = CapturedBytes(_json(export), captures["export_receipt"].path)
    mutated = dict(captures)
    mutated["export_receipt"] = mutated_export
    patched_artifacts = dict(authority.artifact_sha256)
    patched_artifacts["export_receipt"] = mutated_export.digest
    patched_authority = semantic_profiles._Child46Authority(
        profile_bytes=authority.profile_bytes,
        artifact_sha256=tuple(sorted(patched_artifacts.items())),
    )
    monkeypatch.setattr(
        semantic_profiles, "_EXACT17_CHILD46_AUTHORITY", patched_authority
    )
    with pytest.raises(SemanticProfileError, match="model-cut census"):
        validate_semantic_profile(profile_bytes, mutated)
