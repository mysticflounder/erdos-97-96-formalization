"""Focused adversarial tests for sparse-six cell preparation."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import prepare_exact17_sparse_six_nextcenter_cells as subject
import pytest


def fake_parent() -> bytes:
    body = b"1 0\n-2 3 0\n"
    return b"p cnf 308 2\n" + body


def prepare(
    tmp_path: Path, parent: bytes | None = None
) -> tuple[Path, dict[str, object]]:
    parent_path = tmp_path / "parent.cnf"
    payload = fake_parent() if parent is None else parent
    parent_path.write_bytes(payload)
    source_path = tmp_path / "coverage.lean"
    source_payload = b"theorem source : True := by trivial\n"
    source_path.write_bytes(source_payload)
    variable_map_path = tmp_path / "variable-map.json"
    variable_map_payload = b'{"variables":308}\n'
    variable_map_path.write_bytes(variable_map_payload)
    producer_path = tmp_path / "parent-producer.json"
    producer_payload = json.dumps(
        {
            "cnf": {
                "sha256": hashlib.sha256(payload).hexdigest(),
                "num_variables": 308,
                "num_clauses": 2,
            },
            "variable_map": {
                "sha256": hashlib.sha256(variable_map_payload).hexdigest(),
            },
        },
        sort_keys=True,
        separators=(",", ":"),
    ).encode()
    producer_path.write_bytes(producer_payload)
    output = tmp_path / "scratch" / "cell-campaign-v1"
    report = subject.prepare_campaign(
        repo_root=tmp_path,
        parent_path=parent_path,
        parent_producer_path=producer_path,
        source_path=source_path,
        variable_map_path=variable_map_path,
        output_root=output,
        expected_parent_sha256=hashlib.sha256(payload).hexdigest(),
        expected_parent_bytes=len(payload),
        expected_parent_variables=308,
        expected_parent_clauses=2,
        expected_parent_producer_sha256=hashlib.sha256(producer_payload).hexdigest(),
        expected_source_sha256=hashlib.sha256(source_payload).hexdigest(),
        expected_variable_map_sha256=hashlib.sha256(variable_map_payload).hexdigest(),
    )
    return output, report


def test_fake_parent_prepares_all_thirteen_cells(tmp_path: Path) -> None:
    output, report = prepare(tmp_path)
    assert report["cell_count"] == 13
    assert report["production_run"] is False
    assert [item["center"] for item in report["cells"]] == list(subject.LEGAL_CENTERS)  # type: ignore[index]
    for center in subject.LEGAL_CENTERS:
        path = (
            output
            / "artifacts"
            / "cells"
            / subject.cell_id(center)
            / f"{subject.cell_id(center)}.cnf"
        )
        assert path.read_bytes().startswith(b"p cnf 308 3\n1 0\n-2 3 0\n")
        assert path.read_bytes().endswith(f"{290 + center} 0\n".encode())


def test_wave_manifests_validate_and_bind_shards(tmp_path: Path) -> None:
    output, _ = prepare(tmp_path)
    for index, center in enumerate(subject.LEGAL_CENTERS):
        path = (
            output
            / "artifacts"
            / "cells"
            / subject.cell_id(center)
            / "wave-manifest.json"
        )
        wave = json.loads(path.read_bytes())
        subject.validate_wave_manifest(wave)
        assert wave["execution"] == {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": index,
            "shard_count": 13,
            "order_sha256": subject.ORDER_SHA256,
            "seed": 97,
        }
        assert wave["source"]["source_theorem"] == subject.SOURCE_THEOREM


def test_producer_and_campaign_claims_are_false(tmp_path: Path) -> None:
    output, _ = prepare(tmp_path)
    campaign = json.loads(
        (output / "artifacts" / "campaign-manifest.json").read_bytes()
    )
    assert all(value is False for value in campaign["claims"].values())
    for center in subject.LEGAL_CENTERS:
        producer_path = (
            output
            / "artifacts"
            / "cells"
            / subject.cell_id(center)
            / "producer-manifest.json"
        )
        producer = json.loads(producer_path.read_bytes())
        assert producer["schema"] == subject.PRODUCER_SCHEMA
        assert producer["backend"] == "cadical"
        assert producer["solver_profile"] == "unsat"
        assert all(value is False for value in producer["claims"].values())
        assert producer["source_manifest"]["source_theorem"] == subject.SOURCE_THEOREM


def test_parent_header_or_hash_drift_fails_closed(tmp_path: Path) -> None:
    payload = fake_parent().replace(b"p cnf 308 2", b"p cnf 307 2", 1)
    path = tmp_path / "parent.cnf"
    path.write_bytes(payload)
    with pytest.raises(subject.PreparationError, match="header dimensions"):
        subject.inspect_parent(
            path,
            expected_sha256=hashlib.sha256(payload).hexdigest(),
            expected_bytes=len(payload),
            expected_variables=308,
            expected_clauses=2,
        )


def test_create_once_rejects_mutated_cell_and_symlink(tmp_path: Path) -> None:
    output, _ = prepare(tmp_path)
    cell = output / "artifacts" / "cells" / "next-center-00" / "next-center-00.cnf"
    original = cell.read_bytes()
    cell.write_bytes(original + b"9 0\n")
    with pytest.raises(subject.PreparationError, match="existing cell"):
        prepare(tmp_path)

    cell.write_bytes(original)
    producer = cell.with_name("producer-manifest.json")
    producer.unlink()
    producer.symlink_to(cell)
    with pytest.raises(subject.PreparationError, match="non-regular|symlink"):
        prepare(tmp_path)


def test_output_classes_are_real_directories(tmp_path: Path) -> None:
    output, _ = prepare(tmp_path)
    for name in ("artifacts", "events", "tmp"):
        path = output / name
        assert path.is_dir()
        assert not path.is_symlink()


def test_injectable_cell_builder_changes_only_header_and_suffix() -> None:
    parent = fake_parent()
    built = subject.cell_cnf_bytes(parent, 12)
    assert built == b"p cnf 308 3\n1 0\n-2 3 0\n302 0\n"


@pytest.mark.parametrize(
    ("path_name", "message"),
    [
        ("parent-producer.json", "parent producer manifest SHA-256 drifted"),
        ("coverage.lean", "Lean source SHA-256 drifted"),
        ("variable-map.json", "variable map SHA-256 drifted"),
    ],
)
def test_external_provenance_mutation_fails_closed(
    tmp_path: Path, path_name: str, message: str
) -> None:
    output, _ = prepare(tmp_path)
    producer = tmp_path / "parent-producer.json"
    source = tmp_path / "coverage.lean"
    variable_map = tmp_path / "variable-map.json"
    producer_sha = hashlib.sha256(producer.read_bytes()).hexdigest()
    source_sha = hashlib.sha256(source.read_bytes()).hexdigest()
    variable_map_sha = hashlib.sha256(variable_map.read_bytes()).hexdigest()
    (tmp_path / path_name).write_bytes(b"mutated\n")
    with pytest.raises(subject.PreparationError, match=message):
        subject.validate_external_inputs(
            parent_producer_path=producer,
            source_path=source,
            variable_map_path=variable_map,
            expected_parent_producer_sha256=producer_sha,
            expected_source_sha256=source_sha,
            expected_variable_map_sha256=variable_map_sha,
            expected_parent_sha256=hashlib.sha256(fake_parent()).hexdigest(),
            expected_parent_variables=308,
            expected_parent_clauses=2,
        )
    assert output.exists()


def test_parent_producer_binding_drift_fails_closed(tmp_path: Path) -> None:
    parent = fake_parent()
    producer = tmp_path / "parent-producer.json"
    variable_map = b'{"variables":308}\n'
    producer_payload = json.dumps(
        {
            "cnf": {
                "sha256": "0" * 64,
                "num_variables": 308,
                "num_clauses": 2,
            },
            "variable_map": {"sha256": hashlib.sha256(variable_map).hexdigest()},
        },
        sort_keys=True,
        separators=(",", ":"),
    ).encode()
    producer.write_bytes(producer_payload)
    source = tmp_path / "coverage.lean"
    source.write_bytes(b"source\n")
    variable_map_path = tmp_path / "variable-map.json"
    variable_map_path.write_bytes(variable_map)
    parent_path = tmp_path / "parent.cnf"
    parent_path.write_bytes(parent)
    with pytest.raises(subject.PreparationError, match="bindings drifted"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            parent_path=parent_path,
            parent_producer_path=producer,
            source_path=source,
            variable_map_path=variable_map_path,
            output_root=tmp_path / "scratch" / "cell-campaign-v1",
            expected_parent_sha256=hashlib.sha256(parent).hexdigest(),
            expected_parent_bytes=len(parent),
            expected_parent_variables=308,
            expected_parent_clauses=2,
            expected_parent_producer_sha256=hashlib.sha256(
                producer_payload
            ).hexdigest(),
            expected_source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
            expected_variable_map_sha256=hashlib.sha256(variable_map).hexdigest(),
        )


def test_cell_creation_rehashes_the_consumed_parent(tmp_path: Path) -> None:
    parent_path = tmp_path / "parent.cnf"
    original = fake_parent()
    parent_path.write_bytes(original)
    parent = subject.inspect_parent(
        parent_path,
        expected_sha256=hashlib.sha256(original).hexdigest(),
        expected_bytes=len(original),
        expected_variables=308,
        expected_clauses=2,
    )
    parent_path.write_bytes(original.replace(b"1 0", b"2 0", 1))
    output_dir = tmp_path / "artifacts" / "cells" / "next-center-00"
    output_dir.mkdir(parents=True)
    with pytest.raises(subject.PreparationError, match="changed during cell creation"):
        subject._write_cell_cnf(
            parent_path, output_dir / "next-center-00.cnf", 0, parent
        )


def test_existing_cell_rehashes_the_consumed_parent(tmp_path: Path) -> None:
    output, report = prepare(tmp_path)
    parent_path = tmp_path / "parent.cnf"
    original = fake_parent()
    parent_path.write_bytes(original.replace(b"1 0", b"2 0", 1))
    cell = output / "artifacts" / "cells" / "next-center-00" / "next-center-00.cnf"
    parent = report["parent"]
    assert isinstance(parent, dict)
    with pytest.raises(
        subject.PreparationError, match="existing cell body differs|changed during"
    ):
        subject._verify_existing_cell(cell, parent_path, 0, parent)
