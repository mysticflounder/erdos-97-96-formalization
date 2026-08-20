"""Focused adversarial tests for physical-slice preparation."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import prepare_exact17_sparse_six_physical_slice_cells as subject
import pytest


def _parent() -> bytes:
    return b"p cnf 308 2\n1 0\n-2 3 0\n"


def _prepare(tmp_path: Path) -> tuple[Path, dict[str, object], Path]:
    subject.NEXTCENTER_CLAUSES = 2
    parent = _parent()
    source = tmp_path / "physical.lean"
    source.write_bytes(b"theorem physical : True := by trivial\n")
    variable_map = tmp_path / "variable-map.json"
    variable_map.write_bytes(b'{"variables":308}\n')
    subject.EXPECTED_SOURCE_SHA256 = hashlib.sha256(source.read_bytes()).hexdigest()
    subject.EXPECTED_VARIABLE_MAP_SHA256 = hashlib.sha256(
        variable_map.read_bytes()
    ).hexdigest()
    input_root = tmp_path / "input"
    for center in subject.LEGAL_CENTERS:
        directory = input_root / "artifacts" / "cells" / f"next-center-{center:02d}"
        directory.mkdir(parents=True)
        cnf = directory / f"next-center-{center:02d}.cnf"
        cnf.write_bytes(parent)
        source_manifest = {
            "schema": subject.SOURCE_SCHEMA,
            "source_id": f"parent-{center}",
        }
        producer = {
            "schema": subject.PRODUCER_SCHEMA,
            "producer_kind": "static-dimacs",
            "backend": "cadical",
            "solver_profile": "unsat",
            "query_polarity": subject.UNSAT_MEANS_OBSTRUCTION,
            "variable_map_sha256": hashlib.sha256(
                variable_map.read_bytes()
            ).hexdigest(),
            "source_manifest": source_manifest,
            "source_manifest_sha256": subject.sha256_bytes(
                subject.canonical_json_bytes(source_manifest)
            ),
        }
        producer_bytes = json.dumps(
            producer, sort_keys=True, separators=(",", ":")
        ).encode()
        (directory / "producer-manifest.json").write_bytes(producer_bytes)
        wave = {
            "schema": subject.WAVE_SCHEMA,
            "wave_id": f"parent-{center}",
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "source": {
                "live_leaf": "parent",
                "ingress_hypotheses_sha256": hashlib.sha256(
                    source.read_bytes()
                ).hexdigest(),
                "finite_schema": "parent",
                "cardinality_scope": "test",
                "source_theorem": "parent",
            },
            "encoding": {
                "cnf_sha256": hashlib.sha256(parent).hexdigest(),
                "variable_map_sha256": hashlib.sha256(
                    variable_map.read_bytes()
                ).hexdigest(),
                "producer_manifest_sha256": hashlib.sha256(producer_bytes).hexdigest(),
                "num_variables": 308,
                "num_clauses": 2,
                "query_polarity": subject.UNSAT_MEANS_OBSTRUCTION,
            },
            "execution": {
                "backend": "cadical",
                "solver_profile": "unsat",
                "shard_id": 0,
                "shard_count": 1,
                "order_sha256": subject.ORDER_SHA256,
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": subject.LOCAL_CERTIFICATE,
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
        subject.validate_wave_manifest(wave)
        (directory / "wave-manifest.json").write_bytes(
            subject.canonical_json_bytes(wave)
        )
    campaign = input_root / "artifacts" / "campaign-manifest.json"
    campaign.write_bytes(b'{"schema":"test-parent-campaign"}\n')
    parent_run = input_root / "run_manifest.json"
    parent_run.write_bytes(b'{"schema":"test-parent-run"}\n')
    subject.EXPECTED_PARENT_CAMPAIGN_SHA256 = hashlib.sha256(
        campaign.read_bytes()
    ).hexdigest()
    subject.EXPECTED_PARENT_RUN_SHA256 = hashlib.sha256(
        parent_run.read_bytes()
    ).hexdigest()
    output = tmp_path / "output"
    report = subject.prepare_campaign(
        repo_root=tmp_path,
        input_root=input_root,
        output_root=output,
        source_path=source,
        variable_map_path=variable_map,
    )
    return output, report, input_root


def test_prepares_76_source_categories(tmp_path: Path) -> None:
    output, report, _ = _prepare(tmp_path)
    assert report["cell_count"] == 76
    assert report["production_run"] is False
    assert len(list((output / "artifacts" / "cells").iterdir())) == 76


def test_units_and_header_are_exact(tmp_path: Path) -> None:
    output, _, _ = _prepare(tmp_path)
    none = (
        output
        / "artifacts"
        / "cells"
        / "next-center-00-physical-none"
        / "next-center-00-physical-none.cnf"
    )
    assert none.read_bytes() == (
        b"p cnf 308 7\n1 0\n-2 3 0\n-7 0\n-8 0\n-9 0\n-10 0\n-11 0\n"
    )
    unique = (
        output
        / "artifacts"
        / "cells"
        / "next-center-00-physical-unique-06"
        / "next-center-00-physical-unique-06.cnf"
    )
    assert unique.read_bytes() == (
        b"p cnf 308 7\n1 0\n-2 3 0\n7 0\n-8 0\n-9 0\n-10 0\n-11 0\n"
    )


def test_self_unique_category_is_filtered(tmp_path: Path) -> None:
    output, _, _ = _prepare(tmp_path)
    assert "unique-06" not in [
        subject.category_id(6, c) for c in subject._physical_categories(6)
    ]
    assert not (
        output / "artifacts" / "cells" / "next-center-06-physical-unique-06"
    ).exists()


def test_wave_and_claims_are_source_bound_and_false(tmp_path: Path) -> None:
    output, _, _ = _prepare(tmp_path)
    path = (
        output
        / "artifacts"
        / "cells"
        / "next-center-00-physical-unique-06"
        / "wave-manifest.json"
    )
    wave = json.loads(path.read_bytes())
    subject.validate_wave_manifest(wave)
    assert wave["source"]["source_theorem"] == subject.SOURCE_THEOREM
    producer = json.loads(path.with_name("producer-manifest.json").read_bytes())
    assert all(value is False for value in producer["claims"].values())


def test_create_once_rejects_mutated_output(tmp_path: Path) -> None:
    output, _, _ = _prepare(tmp_path)
    path = (
        output
        / "artifacts"
        / "cells"
        / "next-center-00-physical-none"
        / "next-center-00-physical-none.cnf"
    )
    path.write_bytes(path.read_bytes() + b"99 0\n")
    with pytest.raises(subject.PreparationError, match="existing cell differs"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            input_root=tmp_path / "input",
            output_root=output,
            source_path=tmp_path / "physical.lean",
            variable_map_path=tmp_path / "variable-map.json",
        )


def test_parent_mutation_is_detected_during_consumption(tmp_path: Path) -> None:
    output, _, input_root = _prepare(tmp_path)
    parent = (
        input_root / "artifacts" / "cells" / "next-center-00" / "next-center-00.cnf"
    )
    parent.write_bytes(parent.read_bytes().replace(b"1 0", b"4 0", 1))
    with pytest.raises(subject.PreparationError):
        subject.prepare_campaign(
            repo_root=tmp_path,
            input_root=input_root,
            output_root=output,
            source_path=tmp_path / "physical.lean",
            variable_map_path=tmp_path / "variable-map.json",
        )


def test_existing_cell_replay_binds_consumed_parent_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output, _, input_root = _prepare(tmp_path)
    parent = (
        input_root / "artifacts" / "cells" / "next-center-00" / "next-center-00.cnf"
    )
    original = Path.read_bytes

    def altered(path: Path) -> bytes:
        payload = original(path)
        if path == parent:
            return payload.replace(b"1 0", b"4 0", 1)
        return payload

    monkeypatch.setattr(Path, "read_bytes", altered)
    with pytest.raises(subject.PreparationError, match="existing-cell replay"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            input_root=input_root,
            output_root=output,
            source_path=tmp_path / "physical.lean",
            variable_map_path=tmp_path / "variable-map.json",
        )


def test_run_manifest_binds_parent_inputs_and_lane(tmp_path: Path) -> None:
    output, _, input_root = _prepare(tmp_path)
    run = json.loads((output / "run_manifest.json").read_bytes())
    assert run["lane_id"] == "exact17-sparse-six-nextcenter-split-20260820"
    assert run["run_id"] == "physical-slice-full-campaign-v1"
    assert len(run["input_digests"]) == 41
    parent = (
        input_root / "artifacts" / "cells" / "next-center-00" / "next-center-00.cnf"
    )
    parent_key = parent.relative_to(tmp_path).as_posix()
    assert (
        run["input_digests"][parent_key]
        == hashlib.sha256(parent.read_bytes()).hexdigest()
    )
    assert not any("physical-" in path for path in run["input_digests"])


def test_source_and_variable_map_digest_drift_is_rejected(tmp_path: Path) -> None:
    output, _, input_root = _prepare(tmp_path)
    source = tmp_path / "physical.lean"
    source.write_bytes(source.read_bytes() + b"-- drift\n")
    with pytest.raises(subject.PreparationError, match="Lean source digest drifted"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            input_root=input_root,
            output_root=output,
            source_path=source,
            variable_map_path=tmp_path / "variable-map.json",
        )

    source.write_bytes(b"theorem physical : True := by trivial\n")
    variable_map = tmp_path / "variable-map.json"
    variable_map.write_bytes(variable_map.read_bytes() + b" ")
    with pytest.raises(subject.PreparationError, match="variable-map digest drifted"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            input_root=input_root,
            output_root=output,
            source_path=source,
            variable_map_path=variable_map,
        )


def test_no_default_output_root_is_created(tmp_path: Path) -> None:
    assert not (tmp_path / "production-output").exists()


def test_injectable_builder_uses_exact_hit_formula() -> None:
    assert subject.cell_cnf_bytes(_parent(), 12, "none").endswith(
        b"-211 0\n-212 0\n-213 0\n-214 0\n-215 0\n"
    )
    assert subject.cell_cnf_bytes(_parent(), 12, "unique-06").endswith(
        b"211 0\n-212 0\n-213 0\n-214 0\n-215 0\n"
    )


def test_symlink_output_is_rejected(tmp_path: Path) -> None:
    output, _, _ = _prepare(tmp_path)
    path = (
        output
        / "artifacts"
        / "cells"
        / "next-center-00-physical-none"
        / "producer-manifest.json"
    )
    target = path.with_name("target.json")
    target.write_bytes(path.read_bytes())
    path.unlink()
    path.symlink_to(target)
    with pytest.raises(subject.PreparationError, match="non-regular|symlink"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            input_root=tmp_path / "input",
            output_root=output,
            source_path=tmp_path / "physical.lean",
            variable_map_path=tmp_path / "variable-map.json",
        )
