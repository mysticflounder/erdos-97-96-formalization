from __future__ import annotations

import base64
import json
import os
import stat
from dataclasses import dataclass, replace
from pathlib import Path

import pytest

from census.p97_search import phase3_piqd_package as package_module
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_package import (
    CANDIDATE_SCHEMA,
    CLAUSE_DELTA_SCHEMA,
    COMPILER_SCHEMA,
    INGRESS_CONTRACT_SCHEMA,
    JOB_SCHEMA,
    PACKAGE_SCOPE,
    UPSTREAM_DIGEST_STATUS,
    VARIABLE_MAP_COVERAGE,
    PiqdPackageError,
    package_job,
)

LIVE_LEAF = "Problem97.fixtureLiveLeaf"
SOURCE_THEOREM = "Problem97.fixtureSourceTheorem"
CARDINALITY_SCOPE = "one exact-twelve normalized-v14 cell"


@dataclass(frozen=True)
class PackageFixture:
    repo_root: Path
    job_path: Path
    cnf_path: Path
    ingress_path: Path
    output_dir: Path
    source_path: Path
    ingress_source_path: Path


def _source_record(repo_root: Path, path: Path) -> dict[str, object]:
    payload = path.read_bytes()
    return {
        "path": path.relative_to(repo_root).as_posix(),
        "bytes": len(payload),
        "sha256": sha256_bytes(payload),
    }


def _write_json(path: Path, value: object) -> None:
    path.write_bytes(canonical_json_bytes(value))


def _fixture(tmp_path: Path) -> PackageFixture:
    repo_root = tmp_path / "repo"
    input_dir = repo_root / "scratch" / "source-cell-0000"
    source_path = repo_root / "census" / "compiler.py"
    ingress_source_path = repo_root / "ErdosProblems" / "Problem97" / "Leaf.lean"
    input_dir.mkdir(parents=True)
    source_path.parent.mkdir(parents=True)
    ingress_source_path.parent.mkdir(parents=True)
    source_path.write_bytes(b"# frozen compiler source\n")
    ingress_source_path.write_bytes(b"theorem liveLeaf : True := by trivial\n")

    cnf = b"p cnf 4 3\n1 0\n-2 3 0\n4 0\n"
    cnf_path = input_dir / "discovery.cnf"
    cnf_path.write_bytes(cnf)
    cell = {
        "placement_index": 0,
        "joint_deletion": 0,
        "v": 2,
        "arm": "upper",
        "distinguished_d": 3,
    }
    blocker_variables = [{"source": 0, "center": 2, "variable": 4}]
    clause_delta = [[4]]
    compiler = {
        "schema": COMPILER_SCHEMA,
        "semantic_status": "FINITE_SOURCE_PREDICATE_COMPILER",
        "scope": "one fixture cell; finite only",
        "cell": cell,
        "physical": [0, 2],
        "row_at_o": [1, 3],
        "edges": [{"source": 0, "edge": [0, 2]}],
        "blocker_variables": blocker_variables,
        "counts": {
            "base_variables": 3,
            "base_clauses": 2,
            "final_variables": 4,
            "final_clauses": 3,
            "added_variables": 1,
            "added_clauses": 1,
        },
        "hashes": {
            "blocker_variable_map_sha256": sha256_json([[0, 2, 4]]),
            "clause_delta_sha256": sha256_json(clause_delta),
        },
    }
    delta_artifact = {
        "schema": CLAUSE_DELTA_SCHEMA,
        "semantic_status": "ORDERED_DIMACS_SUFFIX",
        "scope": "one fixture cell; exact ordered suffix",
        "cell": cell,
        "counts": {
            "base_variables": 3,
            "base_clauses": 2,
            "delta_clauses": 1,
            "final_variables": 4,
            "final_clauses": 3,
        },
        "hashes": {
            "base_clause_list_sha256": sha256_json([[1], [-2, 3]]),
            "clause_delta_sha256": sha256_json(clause_delta),
            "dimacs_sha256": sha256_bytes(cnf),
            "dimacs_suffix_sha256": sha256_bytes(b"4 0\n"),
        },
        "clause_delta": clause_delta,
    }
    source_files = [_source_record(repo_root, source_path)]
    source_contract = {
        "candidate_schema": CANDIDATE_SCHEMA,
        "compiler_schema": COMPILER_SCHEMA,
        "compiler_symbol": "compile_cell",
        "independent_candidate_replay_symbol": "source_faithful_cube_ok",
        "independent_added_constraint_replay_symbol": "added_constraints_hold",
        "files": source_files,
        "files_sha256": sha256_json(source_files),
    }
    job = {
        "schema": JOB_SCHEMA,
        "semantic_status": "FINITE_CNF_BOUND",
        "scope": "one authenticated finite fixture cell",
        "job_id": "exact12-v14-0000-fixture",
        "cell_index": 0,
        "cell": cell,
        "blocked_job_sha256": "b" * 64,
        "source_to_cnf_contract": source_contract,
        "compiler_manifest": compiler,
        "compiler_manifest_sha256": sha256_json(compiler),
        "clause_delta_artifact": delta_artifact,
        "clause_delta_artifact_sha256": sha256_json(delta_artifact),
        "cnf": {
            "encoding": "DIMACS",
            "bytes": len(cnf),
            "n_variables": 4,
            "n_clauses": 3,
            "sha256": sha256_bytes(cnf),
        },
        "execution_gate": {
            "status": "FINITE_DISCOVERY_READY",
            "allowed_outcomes": ["SAT", "UNKNOWN", "DISCOVERY_UNSAT"],
            "promotion": ("FORBIDDEN_WITHOUT_TERMINAL_PROOF_AND_AGGREGATE_REPLAY"),
        },
    }
    job_path = input_dir / "job.json"
    _write_json(job_path, job)

    ingress_source_files = [_source_record(repo_root, ingress_source_path)]
    ingress = {
        "schema": INGRESS_CONTRACT_SCHEMA,
        "scope": PACKAGE_SCOPE,
        "live_leaf": LIVE_LEAF,
        "source_theorem": SOURCE_THEOREM,
        "cardinality_scope": CARDINALITY_SCOPE,
        "source_files": ingress_source_files,
        "source_files_sha256": sha256_json(ingress_source_files),
    }
    ingress_path = input_dir / "ingress-contract.json"
    _write_json(ingress_path, ingress)
    return PackageFixture(
        repo_root=repo_root,
        job_path=job_path,
        cnf_path=cnf_path,
        ingress_path=ingress_path,
        output_dir=repo_root / "scratch" / "package",
        source_path=source_path,
        ingress_source_path=ingress_source_path,
    )


def _package(fixture: PackageFixture, **overrides: object):
    arguments = {
        "job_path": fixture.job_path,
        "cnf_path": fixture.cnf_path,
        "ingress_contract_path": fixture.ingress_path,
        "output_dir": fixture.output_dir,
        "repo_root": fixture.repo_root,
        "wave_id": "exact12-v14-cell-0000",
        "live_leaf": LIVE_LEAF,
        "source_theorem": SOURCE_THEOREM,
        "cardinality_scope": CARDINALITY_SCOPE,
        "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        "shard_count": 648,
    }
    arguments.update(overrides)
    return package_job(**arguments)


def _load_json(path: Path) -> dict:
    payload = path.read_bytes()
    value = json.loads(payload)
    assert payload == canonical_json_bytes(value)
    return value


def test_packages_source_bound_local_wave_with_honest_partial_map(
    tmp_path: Path,
) -> None:
    fixture = _fixture(tmp_path)
    ingress = json.loads(fixture.ingress_path.read_bytes())
    ingress["source_files"].append(
        _source_record(fixture.repo_root, fixture.source_path)
    )
    ingress["source_files_sha256"] = sha256_json(ingress["source_files"])
    _write_json(fixture.ingress_path, ingress)
    result = _package(fixture)

    expected_files = {
        "discovery.cnf",
        "ingress-contract.json",
        "source-job.json",
        "compiler-manifest.json",
        "clause-delta.json",
        "source-bundle.json",
        "variable-map.json",
        "order-cell.json",
        "producer-manifest.json",
        "wave-manifest.json",
    }
    assert {path.name for path in fixture.output_dir.iterdir()} == expected_files
    assert (fixture.output_dir / "discovery.cnf").read_bytes() == (
        fixture.cnf_path.read_bytes()
    )
    assert (fixture.output_dir / "ingress-contract.json").read_bytes() == (
        fixture.ingress_path.read_bytes()
    )

    variable_map = _load_json(fixture.output_dir / "variable-map.json")
    assert variable_map["scope"] == PACKAGE_SCOPE
    assert variable_map["coverage"] == {
        "classification": VARIABLE_MAP_COVERAGE,
        "total_variable_count": 4,
        "named_blocker_count": 1,
        "opaque_variable_count": 3,
        "opaque_variable_ranges_inclusive": [[1, 3]],
    }
    assert variable_map["named_blockers"] == [{"source": 0, "center": 2, "variable": 4}]

    source_bundle = _load_json(fixture.output_dir / "source-bundle.json")
    archived = {
        item["path"]: base64.b64decode(item["content_base64"], validate=True)
        for item in source_bundle["files"]
    }
    expected_sources = {
        path.relative_to(fixture.repo_root).as_posix(): path.read_bytes()
        for path in (fixture.source_path, fixture.ingress_source_path)
    }
    assert archived == expected_sources
    for item in source_bundle["files"]:
        payload = archived[item["path"]]
        assert item["bytes"] == len(payload)
        assert item["sha256"] == sha256_bytes(payload)

    order = _load_json(fixture.output_dir / "order-cell.json")
    producer_bytes = (fixture.output_dir / "producer-manifest.json").read_bytes()
    producer = _load_json(fixture.output_dir / "producer-manifest.json")
    wave = _load_json(fixture.output_dir / "wave-manifest.json")
    validate_wave_manifest(wave)
    assert wave["source"]["ingress_hypotheses_sha256"] == sha256_bytes(
        fixture.ingress_path.read_bytes()
    )
    assert wave["encoding"]["producer_manifest_sha256"] == sha256_bytes(producer_bytes)
    assert wave["encoding"]["variable_map_sha256"] == sha256_json(variable_map)
    assert wave["execution"]["order_sha256"] == sha256_json(order)
    expected_promotion = {
        "evidence_classification": LOCAL_CERTIFICATE,
        "producer_theorem": None,
        "lift_theorem": None,
        "consumer_theorem": None,
    }
    assert producer["promotion"] == expected_promotion
    assert wave["promotion"] == expected_promotion
    assert producer["provenance"]["blocked_job_sha256"] == "b" * 64
    assert (
        producer["provenance"]["blocked_job_provenance_status"]
        == UPSTREAM_DIGEST_STATUS
    )
    assert producer["artifacts"]["source_bundle"]["sha256"] == sha256_json(
        source_bundle
    )
    assert result.source_bundle_sha256 == sha256_json(source_bundle)
    assert result.wave_manifest_sha256 == sha256_json(wave)

    # Re-running is deterministic and permits only byte-identical artifacts.
    assert _package(fixture) == result


def test_rejects_actual_cnf_hash_mismatch(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    fixture.cnf_path.write_bytes(
        fixture.cnf_path.read_bytes().replace(b"4 0\n", b"-4 0")
    )

    with pytest.raises(PiqdPackageError, match="CNF SHA-256"):
        _package(fixture)


def test_rejects_actual_cnf_dimension_mismatch(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    cnf = fixture.cnf_path.read_bytes().replace(b"p cnf 4 3", b"p cnf 5 3")
    fixture.cnf_path.write_bytes(cnf)
    job = json.loads(fixture.job_path.read_bytes())
    job["cnf"]["sha256"] = sha256_bytes(cnf)
    job["cnf"]["n_variables"] = 5
    _write_json(fixture.job_path, job)

    with pytest.raises(PiqdPackageError, match="dimensions do not match compiler"):
        _package(fixture)


def test_rejects_compiler_manifest_digest_not_bound_to_canonical_content(
    tmp_path: Path,
) -> None:
    fixture = _fixture(tmp_path)
    job = json.loads(fixture.job_path.read_bytes())
    job["compiler_manifest"]["scope"] = "tampered compiler scope"
    _write_json(fixture.job_path, job)

    with pytest.raises(PiqdPackageError, match="canonical content"):
        _package(fixture)


@pytest.mark.parametrize("source_owner", ["job", "ingress"])
def test_rejects_authenticated_source_file_drift(
    tmp_path: Path, source_owner: str
) -> None:
    fixture = _fixture(tmp_path)
    target = (
        fixture.source_path if source_owner == "job" else fixture.ingress_source_path
    )
    payload = target.read_bytes()
    target.write_bytes(bytes([payload[0] ^ 1]) + payload[1:])

    with pytest.raises(PiqdPackageError, match="source file SHA-256 mismatch"):
        _package(fixture)


def test_rejects_noncanonical_ingress_contract_bytes(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    ingress = json.loads(fixture.ingress_path.read_bytes())
    fixture.ingress_path.write_text(json.dumps(ingress, indent=2), encoding="utf-8")

    with pytest.raises(PiqdPackageError, match="canonical JSON"):
        _package(fixture)


def test_rejects_ingress_without_authenticated_source_files(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    ingress = json.loads(fixture.ingress_path.read_bytes())
    ingress.pop("source_files")
    _write_json(fixture.ingress_path, ingress)

    with pytest.raises(PiqdPackageError, match="keys mismatch"):
        _package(fixture)


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("live_leaf", "Problem97.differentLeaf"),
        ("source_theorem", "Problem97.differentSourceTheorem"),
        ("cardinality_scope", "a different finite cell"),
    ],
)
def test_rejects_ingress_label_mismatch(
    tmp_path: Path, field: str, replacement: str
) -> None:
    fixture = _fixture(tmp_path)
    ingress = json.loads(fixture.ingress_path.read_bytes())
    ingress[field] = replacement
    _write_json(fixture.ingress_path, ingress)

    with pytest.raises(PiqdPackageError, match=f"{field} does not match CLI input"):
        _package(fixture)


@pytest.mark.parametrize("symlink_kind", ["output-directory", "component"])
def test_rejects_symlink_output_path(tmp_path: Path, symlink_kind: str) -> None:
    fixture = _fixture(tmp_path)
    external = tmp_path / "external-output"
    external.mkdir()
    if symlink_kind == "output-directory":
        fixture.output_dir.symlink_to(external, target_is_directory=True)
    else:
        component = fixture.repo_root / "linked-output"
        component.symlink_to(external, target_is_directory=True)
        fixture = replace(fixture, output_dir=component / "package")

    with pytest.raises(PiqdPackageError, match="symlink or non-directory component"):
        _package(fixture)

    assert list(external.iterdir()) == []


def test_rejects_symlink_package_artifact(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    fixture.output_dir.mkdir(parents=True)
    external = tmp_path / "external-cnf"
    external.write_bytes(fixture.cnf_path.read_bytes())
    artifact = fixture.output_dir / "discovery.cnf"
    artifact.symlink_to(external)

    with pytest.raises(PiqdPackageError, match="package artifact is a symlink"):
        _package(fixture)

    assert artifact.is_symlink()
    assert external.read_bytes() == fixture.cnf_path.read_bytes()


@pytest.mark.parametrize(
    ("iteration", "parent_checkpoint_sha256", "message"),
    [
        (1, None, "supports only iteration 0"),
        (1, "a" * 64, "supports only iteration 0"),
        (0, "a" * 64, "iteration 0 forbids parent_checkpoint_sha256"),
    ],
)
def test_restricts_lineage_to_iteration_zero_without_parent(
    tmp_path: Path,
    iteration: int,
    parent_checkpoint_sha256: str | None,
    message: str,
) -> None:
    fixture = _fixture(tmp_path)

    with pytest.raises(PiqdPackageError, match=message):
        _package(
            fixture,
            iteration=iteration,
            parent_checkpoint_sha256=parent_checkpoint_sha256,
        )


def test_recovers_regular_internal_temp_and_fsyncs_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path)
    fixture.output_dir.mkdir(parents=True)
    stale = fixture.output_dir / f"{package_module._TEMP_PREFIX}{'0' * 32}.tmp"
    stale.write_bytes(b"incomplete prior package artifact")
    real_fsync = os.fsync
    directory_fsyncs = 0

    def tracking_fsync(descriptor: int) -> None:
        nonlocal directory_fsyncs
        if stat.S_ISDIR(os.fstat(descriptor).st_mode):
            directory_fsyncs += 1
        real_fsync(descriptor)

    monkeypatch.setattr(package_module.os, "fsync", tracking_fsync)

    _package(fixture)

    assert not stale.exists()
    assert directory_fsyncs == 1


def test_rejects_symlink_internal_temp_poisoning(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    fixture.output_dir.mkdir(parents=True)
    external = tmp_path / "external-temp-target"
    external.write_bytes(b"must remain untouched")
    poisoned = fixture.output_dir / f"{package_module._TEMP_PREFIX}{'0' * 32}.tmp"
    poisoned.symlink_to(external)

    with pytest.raises(
        PiqdPackageError,
        match="internal package temporary entry is not a regular file",
    ):
        _package(fixture)

    assert poisoned.is_symlink()
    assert external.read_bytes() == b"must remain untouched"


def test_rejects_temp_path_swap_before_install(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path)
    external = tmp_path / "external-link-target"
    external.write_bytes(b"must remain untouched")
    real_link = os.link
    swapped = False

    def swapping_link(
        source: str,
        destination: str,
        *,
        src_dir_fd: int,
        dst_dir_fd: int,
        follow_symlinks: bool,
    ) -> None:
        nonlocal swapped
        if not swapped:
            os.unlink(source, dir_fd=src_dir_fd)
            os.symlink(external, source, dir_fd=src_dir_fd)
            swapped = True
        real_link(
            source,
            destination,
            src_dir_fd=src_dir_fd,
            dst_dir_fd=dst_dir_fd,
            follow_symlinks=follow_symlinks,
        )

    monkeypatch.setattr(package_module.os, "link", swapping_link)

    with pytest.raises(
        PiqdPackageError,
        match="temporary package artifact changed before installation",
    ):
        _package(fixture)

    assert swapped
    assert external.read_bytes() == b"must remain untouched"
    assert list(fixture.output_dir.iterdir()) == []


def test_existing_artifact_fifo_swap_does_not_block(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path)
    _package(fixture)
    artifact = fixture.output_dir / "discovery.cnf"
    real_stat = os.stat
    swapped = False

    def swapping_stat(
        path: str | bytes | int,
        *,
        dir_fd: int | None = None,
        follow_symlinks: bool = True,
    ) -> os.stat_result:
        nonlocal swapped
        metadata = real_stat(path, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
        if path == "discovery.cnf" and not follow_symlinks and not swapped:
            artifact.unlink()
            os.mkfifo(artifact)
            swapped = True
        return metadata

    monkeypatch.setattr(package_module.os, "stat", swapping_stat)

    with pytest.raises(PiqdPackageError, match="not a regular file"):
        _package(fixture)

    assert swapped
    assert stat.S_ISFIFO(real_stat(artifact).st_mode)
