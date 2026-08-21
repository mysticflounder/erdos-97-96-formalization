# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Adversarial tests for two-Kalmanson SAT-profile portfolio preparation."""

from __future__ import annotations

import json
import os
from pathlib import Path
from typing import Any

import prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio as subject
import pytest


def test_repository_production_route_has_complete_frozen_pin_inventory() -> None:
    assert subject.PRODUCTION_PINS_FINALIZED is True
    assert len(subject.SOURCE_CAMPAIGN_SHA256) == 64
    assert subject.SOURCE_CAMPAIGN_BYTES == 104_180
    assert len(subject.SOURCE_RUN_MANIFEST_SHA256) == 64
    assert subject.SOURCE_RUN_MANIFEST_BYTES == 1_654
    assert subject.SOURCE_PREPARER_COMMIT == "83f958d0490730f09179ca65cdef00e3886f2bd1"
    assert (
        subject.SOURCE_PREPARER_SHA256
        == "eca6f895325048835a499292d63c2fb14f25423665c1be75b94838566d1d4f9f"
    )
    assert subject.SOURCE_PREPARER_BYTES == 67_278
    assert len(subject.CHECKPOINT_SHA256) == 64
    assert subject.CHECKPOINT_BYTES == 875
    assert tuple(subject.PRODUCTION_CELL_IDENTITIES) == subject.CELL_CATEGORIES
    for identity in subject.PRODUCTION_CELL_IDENTITIES.values():
        assert set(identity) == {
            "producer_sha256",
            "wave_sha256",
            "identity_hash",
        }
        assert all(len(value) == 64 for value in identity.values())
    subject.require_production_pins_finalized(subject.ROOT)


def test_production_dimensions_are_exact() -> None:
    assert (subject.NUM_VARIABLES, subject.NUM_CLAUSES) == (308, 7_409_267)


def _write(path: Path, payload: bytes) -> dict[str, Any]:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    return {
        "path": path.as_posix(),
        "sha256": subject.sha256_bytes(payload),
        "bytes": len(payload),
    }


def _reference(root: Path, path: Path) -> dict[str, Any]:
    raw = path.read_bytes()
    return {
        "path": path.relative_to(root).as_posix(),
        "sha256": subject.sha256_bytes(raw),
        "bytes": len(raw),
    }


def _producer(category: str) -> bytes:
    source_manifest = {
        "cardinality_scope": f"exactly 17 models in {subject.cell_id(category)}",
        "claims": {
            "lean_closure": False,
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
        },
        "finite_schema": "fixture/v1",
        "schema": "p97-piqd-static-source/v1",
        "source_id": subject.cell_id(category),
        "source_path": "source.lean",
        "source_sha256": "1" * 64,
        "root_source_path": "root.lean",
        "root_source_sha256": "2" * 64,
        "source_theorem": "Fixture.source",
    }
    return subject.canonical_json_bytes(
        {
            "backend": "cadical",
            "claims": {
                "lean_closure": False,
                "one_core": False,
                "one_process": False,
                "source_entitlement": False,
                "theorem_coverage": False,
                "universal_lift": False,
            },
            "exporter_path": "exporter.lean",
            "exporter_sha256": "3" * 64,
            "parent_producer_sha256": "4" * 64,
            "parent_root_sha256": "5" * 64,
            "producer_id": f"{subject.cell_id(category)}-v1",
            "producer_kind": "lean-exported-static-dimacs",
            "query_polarity": subject.QUERY_POLARITY,
            "schema": subject.PRODUCER_SCHEMA,
            "solver_profile": "unsat",
            "source_manifest": source_manifest,
            "source_manifest_sha256": subject.sha256_bytes(
                subject.canonical_json_bytes(source_manifest)
            ),
            "variable_map_sha256": subject.VARIABLE_MAP_SHA256,
        }
    )


def _wave(category: str, cnf_sha: str, producer_sha: str, ordinal: int) -> bytes:
    return subject.canonical_json_bytes(
        {
            "schema": subject.WAVE_SCHEMA,
            "wave_id": f"{subject.cell_id(category)}-v1",
            "iteration": 0,
            "parent_checkpoint_sha256": "6" * 64,
            "source": {
                "live_leaf": "Fixture.live",
                "ingress_hypotheses_sha256": "7" * 64,
                "finite_schema": "fixture/v1",
                "cardinality_scope": f"exactly 17 models in {subject.cell_id(category)}",
                "source_theorem": "Fixture.source",
            },
            "encoding": {
                "cnf_sha256": cnf_sha,
                "variable_map_sha256": subject.VARIABLE_MAP_SHA256,
                "producer_manifest_sha256": producer_sha,
                "num_variables": subject.NUM_VARIABLES,
                "num_clauses": subject.NUM_CLAUSES,
                "query_polarity": subject.QUERY_POLARITY,
            },
            "execution": {
                "backend": "cadical",
                "solver_profile": "unsat",
                "shard_id": 12 + ordinal,
                "shard_count": 76,
                "order_sha256": "8" * 64,
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": "LOCAL_CERTIFICATE",
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
    )


def make_fixture(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> dict[str, Any]:
    monkeypatch.setattr(subject, "NUM_CLAUSES", 1)
    root = tmp_path.resolve()
    source_preparer = root / subject.SOURCE_PREPARER_PATH.relative_to(subject.ROOT)
    source_preparer.parent.mkdir(parents=True, exist_ok=True)
    source_preparer.write_bytes(b"fixture committed source preparer\n")
    monkeypatch.setattr(
        subject,
        "SOURCE_PREPARER_SHA256",
        subject.sha256_bytes(source_preparer.read_bytes()),
    )
    monkeypatch.setattr(
        subject, "SOURCE_PREPARER_BYTES", source_preparer.stat().st_size
    )
    source_root_relative = subject.SOURCE_RUN_ROOT.relative_to(subject.ROOT)
    source_run_root = root / source_root_relative
    artifacts = source_run_root / "artifacts"
    artifacts.mkdir(parents=True)
    (source_run_root / "events").mkdir()
    (source_run_root / "tmp").mkdir()
    cells: list[dict[str, Any]] = []
    for ordinal, category in enumerate(subject.CELL_CATEGORIES):
        identifier = subject.cell_id(category)
        directory = artifacts / "cells" / identifier
        directory.mkdir(parents=True)
        cnf = b"p cnf 308 1\n1 0\n"
        cnf_path = directory / f"{identifier}.cnf"
        cnf_path.write_bytes(cnf)
        producer_path = directory / "producer-manifest.json"
        producer_path.write_bytes(_producer(category))
        wave_path = directory / "wave-manifest.json"
        wave_path.write_bytes(
            _wave(
                category,
                subject.sha256_bytes(cnf),
                subject.sha256_bytes(producer_path.read_bytes()),
                ordinal,
            )
        )
        cells.append(
            {
                "cell_id": identifier,
                "center": 2,
                "category": category,
                "ordinal": 12 + ordinal,
                "cnf": _reference(root, cnf_path),
                "producer_manifest": _reference(root, producer_path),
                "wave_manifest": _reference(root, wave_path),
                "claims": {
                    "lean_closure": False,
                    "one_core": False,
                    "one_process": False,
                    "source_entitlement": False,
                    "theorem_coverage": False,
                    "universal_lift": False,
                },
            }
        )
    campaign = {
        "schema": subject.SOURCE_CAMPAIGN_SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": 76,
        "cells": cells,
    }
    campaign_path = artifacts / "campaign-manifest.json"
    campaign_path.write_bytes(subject.canonical_json_bytes(campaign))
    source_run_unsigned = {
        "schema": subject.RUN_MANIFEST_SCHEMA,
        "lane_id": "source",
        "run_id": "source",
        "root": source_root_relative.as_posix(),
        "owner": "fixture",
        "base_head": "0" * 40,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {},
        "input_digests": {},
        "created_utc": "2026-08-21T00:00:00Z",
    }
    source_run = {
        **source_run_unsigned,
        "manifest_sha256": subject.sha256_bytes(
            subject.canonical_json_bytes(source_run_unsigned)
        ),
    }
    source_run_path = source_run_root / "run_manifest.json"
    source_run_path.write_bytes(subject.canonical_json_bytes(source_run))

    for relative in subject.PACKAGE_SOURCE_PATHS:
        path = root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(f"fixture {relative}\n".encode())
    output = root / f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"
    output.parent.mkdir(parents=True)
    checkpoint_path = root / f".codex/worktree-checkpoints/{subject.LANE_ID}.json"
    checkpoint_path.parent.mkdir(parents=True)
    checkpoint_unsigned = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "owner": subject.RUN_OWNER,
        "base_head": subject.BASE_HEAD,
        "owned_paths": list(subject.PACKAGE_SOURCE_PATHS),
        "durable_paths": [],
        "generated_roots": [output.relative_to(root).as_posix()],
        "created_utc": "2026-08-21T03:11:29Z",
    }
    checkpoint = {
        **checkpoint_unsigned,
        "manifest_sha256": subject.sha256_bytes(
            subject.canonical_json_bytes(checkpoint_unsigned)
        ),
    }
    checkpoint_path.write_bytes(subject.canonical_json_bytes(checkpoint))
    monkeypatch.setattr(
        subject,
        "SOURCE_CAMPAIGN_SHA256",
        subject.sha256_bytes(campaign_path.read_bytes()),
    )
    monkeypatch.setattr(subject, "SOURCE_CAMPAIGN_BYTES", campaign_path.stat().st_size)
    monkeypatch.setattr(
        subject,
        "SOURCE_RUN_MANIFEST_SHA256",
        subject.sha256_bytes(source_run_path.read_bytes()),
    )
    monkeypatch.setattr(
        subject, "SOURCE_RUN_MANIFEST_BYTES", source_run_path.stat().st_size
    )
    monkeypatch.setattr(
        subject, "CHECKPOINT_SHA256", subject.sha256_bytes(checkpoint_path.read_bytes())
    )
    monkeypatch.setattr(subject, "CHECKPOINT_BYTES", checkpoint_path.stat().st_size)
    return {
        "root": root,
        "campaign": campaign_path,
        "source_run": source_run_path,
        "checkpoint": checkpoint_path,
        "output": output,
        "cells": cells,
    }


def prepare_fixture(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> dict[str, Any]:
    fixture = make_fixture(tmp_path, monkeypatch)
    fixture["report"] = subject.prepare_portfolio(
        root=fixture["root"],
        campaign_path=fixture["campaign"],
        source_run_manifest_path=fixture["source_run"],
        checkpoint_path=fixture["checkpoint"],
        output_root=fixture["output"],
    )
    return fixture


def test_prepares_six_new_profiles_without_copying_cnfs(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = prepare_fixture(tmp_path, monkeypatch)
    output = fixture["output"]
    assert fixture["report"]["cell_count"] == 6
    assert not list(output.rglob("*.cnf"))
    campaign = json.loads((output / "artifacts/campaign-manifest.json").read_bytes())
    assert campaign["cnf_custody"] == "REFERENCE_ONLY_NO_COPY"
    assert campaign["execution"]["solver_profile"] == "sat"
    assert campaign["execution"]["maximum_concurrency"] == 6
    assert campaign["source_preparer"] == {
        "path": subject.SOURCE_PREPARER_PATH.relative_to(subject.ROOT).as_posix(),
        "sha256": subject.sha256_bytes(
            (
                fixture["root"] / subject.SOURCE_PREPARER_PATH.relative_to(subject.ROOT)
            ).read_bytes()
        ),
        "bytes": len(b"fixture committed source preparer\n"),
        "commit": subject.SOURCE_PREPARER_COMMIT,
        "git_blob_sha256": subject.SOURCE_PREPARER_SHA256,
    }
    producer_hashes: set[str] = set()
    wave_hashes: set[str] = set()
    identity_hashes: set[str] = set()
    for cell in campaign["cells"]:
        source_producer = json.loads(
            (fixture["root"] / cell["source_producer_manifest"]["path"]).read_bytes()
        )
        producer = json.loads(
            (fixture["root"] / cell["producer_manifest"]["path"]).read_bytes()
        )
        wave = json.loads(
            (fixture["root"] / cell["wave_manifest"]["path"]).read_bytes()
        )
        assert producer["solver_profile"] == "sat"
        assert producer["producer_id"] == cell["portfolio_cell_id"]
        assert producer["backend"] == source_producer["backend"]
        assert producer["query_polarity"] == source_producer["query_polarity"]
        assert producer["source_manifest"] == source_producer["source_manifest"]
        assert producer["variable_map_sha256"] == source_producer["variable_map_sha256"]
        assert producer["producer_id"] != source_producer["producer_id"]
        assert wave["execution"]["solver_profile"] == "sat"
        assert wave["encoding"]["query_polarity"] == subject.QUERY_POLARITY
        source_wave = json.loads(
            (fixture["root"] / cell["source_wave_manifest"]["path"]).read_bytes()
        )
        assert wave["wave_id"] != source_wave["wave_id"]
        assert cell["expected_identity_hash"] == subject.raw_dimacs_identity(
            cell["source_cnf"]["sha256"], cell["producer_manifest"]["sha256"]
        )
        producer_hashes.add(cell["producer_manifest"]["sha256"])
        wave_hashes.add(cell["wave_manifest"]["sha256"])
        identity_hashes.add(cell["expected_identity_hash"])
    assert len(producer_hashes) == len(wave_hashes) == len(identity_hashes) == 6


def test_reentry_and_existing_output_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = prepare_fixture(tmp_path, monkeypatch)
    with pytest.raises(subject.PreparationError, match="existing/reentry"):
        subject.prepare_portfolio(
            root=fixture["root"],
            campaign_path=fixture["campaign"],
            source_run_manifest_path=fixture["source_run"],
            checkpoint_path=fixture["checkpoint"],
            output_root=fixture["output"],
        )


@pytest.mark.parametrize("link_kind", ["symlink", "hardlink"])
def test_descriptor_custody_rejects_links(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, link_kind: str
) -> None:
    fixture = make_fixture(tmp_path, monkeypatch)
    cnf_path = fixture["root"] / fixture["cells"][0]["cnf"]["path"]
    original = cnf_path.read_bytes()
    cnf_path.unlink()
    target = cnf_path.with_name("foreign.cnf")
    target.write_bytes(original)
    if link_kind == "symlink":
        cnf_path.symlink_to(target.name)
    else:
        os.link(target, cnf_path)
    with pytest.raises(subject.PreparationError, match="private regular|no-follow"):
        subject.authenticate_source_campaign(
            root=fixture["root"],
            campaign_path=fixture["campaign"],
            source_run_manifest_path=fixture["source_run"],
            checkpoint_path=fixture["checkpoint"],
            output_root=fixture["output"],
        )


@pytest.mark.parametrize(
    ("payload", "message"),
    [
        (b"p cnf 308 2\n1 0\n", "header dimensions"),
        (b"p cnf 308 1\n1 1\n", "body clause count"),
        (b"p cnf 308 1\n1 0", "body is truncated"),
    ],
)
def test_streaming_dimacs_scan_rejects_header_body_and_truncation_drift(
    tmp_path: Path, payload: bytes, message: str
) -> None:
    root = tmp_path.resolve()
    path = root / "cell.cnf"
    path.write_bytes(payload)
    with (
        subject.DescriptorCustody(root) as custody,
        pytest.raises(subject.PreparationError, match=message),
    ):
        custody.capture(
            "cell.cnf",
            maximum_bytes=1_024,
            retain=False,
            expected_dimacs=(308, 1),
        )


def test_transformed_raw_identities_must_be_six_way_unique(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = make_fixture(tmp_path, monkeypatch)
    monkeypatch.setattr(subject, "raw_dimacs_identity", lambda *_args: "f" * 64)
    with pytest.raises(subject.PreparationError, match="six-way unique"):
        subject.authenticate_source_campaign(
            root=fixture["root"],
            campaign_path=fixture["campaign"],
            source_run_manifest_path=fixture["source_run"],
            checkpoint_path=fixture["checkpoint"],
            output_root=fixture["output"],
        )


def test_mutation_is_rejected_before_output(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = make_fixture(tmp_path, monkeypatch)
    cnf_path = fixture["root"] / fixture["cells"][2]["cnf"]["path"]
    cnf_path.write_bytes(cnf_path.read_bytes() + b"2 0\n")
    with pytest.raises(
        subject.PreparationError, match="byte identity drifted|clause count drifted"
    ):
        subject.prepare_portfolio(
            root=fixture["root"],
            campaign_path=fixture["campaign"],
            source_run_manifest_path=fixture["source_run"],
            checkpoint_path=fixture["checkpoint"],
            output_root=fixture["output"],
        )
    assert not fixture["output"].exists()


def test_profile_and_claim_drift_are_rejected() -> None:
    source = json.loads(_producer("none"))
    source["solver_profile"] = "sat"
    with pytest.raises(subject.PreparationError, match="backend/profile"):
        subject.build_producer(source, "a" * 64, "none")
    source = json.loads(_producer("none"))
    source["variable_map_sha256"] = "b" * 64
    with pytest.raises(subject.PreparationError, match="variable-map"):
        subject.build_producer(source, "a" * 64, "none")


def test_raw_dimacs_identity_binds_sat_profile_and_one_core() -> None:
    cnf = "1" * 64
    producer = "2" * 64
    material = f"raw-dimacs/v1\ncadical\nsat\n{cnf}\n{producer}\ncores=1"
    assert subject.raw_dimacs_identity(cnf, producer) == subject.sha256_bytes(
        material.encode()
    )
