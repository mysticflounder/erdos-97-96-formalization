from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from types import ModuleType
from typing import NoReturn

import pytest

from census.p97_search import phase3_piqd_projected_v3_provisioning as provisioning
from census.p97_search.phase3_cegar_wave import canonical_json_bytes

REPOSITORY_ROOT = Path(__file__).resolve().parents[3]
LAUNCHER_PATH = REPOSITORY_ROOT / "scripts/run-p97-piqd-projected-v3-production.py"


def _load_launcher() -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "p97_projected_v3_production_launcher", LAUNCHER_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


launcher = _load_launcher()


def _production_argv(tmp_path: Path) -> list[str]:
    return [
        "--out",
        str(tmp_path / "out"),
        "--workers",
        "1",
        "--parallel-mode",
        "sequential",
        "--projected-static-v3",
        "--persistent-discovery",
        "--piqd-base-url",
        "http://127.0.0.1:7272",
        "--piqd-journal-root",
        str(tmp_path / "out"),
        "--piqd-source-manifest",
        str(tmp_path / "source.json"),
        "--piqd-producer-manifest",
        str(tmp_path / "producer.json"),
        "--piqd-producer-job-id",
        "22222222-2222-4222-8222-222222222222",
        "--piqd-solver-name",
        "piqd-satworker-cadical-3.0.0",
        "--piqd-qualification-authority",
        str(tmp_path / "authority.json"),
    ]


def _without_pair(argv: list[str], option: str) -> list[str]:
    index = argv.index(option)
    return argv[:index] + argv[index + 2 :]


def _without_flag(argv: list[str], option: str) -> list[str]:
    return [value for value in argv if value != option]


def _forbid_predelegation_work(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def forbidden(*_args: object, **_kwargs: object) -> NoReturn:
        raise AssertionError(
            "filesystem, transport, solver, or delegated driver work ran"
        )

    monkeypatch.setattr(Path, "read_bytes", forbidden)
    monkeypatch.setattr(
        launcher.qualification, "load_production_authority_v3", forbidden
    )
    monkeypatch.setattr(launcher.projected_v3, "main", forbidden)
    monkeypatch.setattr(
        launcher.projected_v3,
        "_solver_runner_from_cli_args",
        forbidden,
    )
    monkeypatch.setattr(
        launcher.projected_v3,
        "_make_incremental_piqd_solver_runner",
        forbidden,
    )


def _unsafe_profiles(tmp_path: Path) -> list[list[str]]:
    complete = _production_argv(tmp_path)
    static_only = complete[:]
    static_only = _without_flag(static_only, "--persistent-discovery")
    static_only = _without_pair(static_only, "--piqd-producer-job-id")
    static_only = _without_pair(static_only, "--piqd-solver-name")
    mismatched_root = complete[:]
    root_index = mismatched_root.index("--piqd-journal-root") + 1
    mismatched_root[root_index] = str(tmp_path / "other-root")
    return [
        [],
        ["--projected-static-v3", "--persistent-discovery"],
        _without_pair(complete, "--piqd-source-manifest"),
        _without_pair(complete, "--piqd-producer-job-id"),
        _without_pair(complete, "--piqd-qualification-authority"),
        _without_flag(complete, "--persistent-discovery"),
        _without_flag(complete, "--projected-static-v3"),
        static_only,
        [*complete, "--workers", "2"],
        [*complete, "--parallel-mode", "cube-batch"],
        [*complete, "--resume"],
        [*complete, "--shard-depth", "2", "--shard-index", "0"],
        [*complete, "--verify-shards", str(tmp_path / "shard")],
        mismatched_root,
        [
            *complete,
            "--shard-depth",
            "2",
            "--shard-index",
            "0",
            "--shard-local-simplification",
        ],
    ]


@pytest.mark.parametrize("case", range(15))
def test_incomplete_and_unsafe_profiles_fail_before_external_work(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    case: int,
) -> None:
    argv = _unsafe_profiles(tmp_path)[case]
    _forbid_predelegation_work(monkeypatch)

    with pytest.raises(SystemExit) as exc_info:
        launcher.main(argv)

    assert exc_info.value.code == 2


def _write_valid_inputs(tmp_path: Path) -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    qualification = launcher.qualification
    authority = {
        "schema": qualification.PRODUCTION_V3_AUTHORITY_SCHEMA,
        "base_scope": qualification.PRODUCTION_V3_BASE_SCOPE,
        "builder_base_scope": bundle.base_scope,
        "profile": bundle.profile,
        "num_variables": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "base_cnf_sha256": bundle.base_cnf_sha256,
        "variable_map_sha256": bundle.variable_map_sha256,
        "variable_map_bytes": len(bundle.variable_map),
        "source_bundle_sha256": bundle.source_bundle_sha256,
        "source_bundle_bytes": len(bundle.source_bundle),
        "encoding_configuration_sha256": qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_SHA256,
        "encoding_configuration_bytes": len(bundle.encoding_configuration),
        "source_manifest_sha256": bundle.source_manifest_sha256,
        "source_manifest_bytes": len(bundle.source_manifest),
        "producer_manifest_sha256": bundle.producer_manifest_sha256,
        "producer_manifest_bytes": len(bundle.producer_manifest),
        "shard_index": None,
        "shard_count": None,
        "shard_literals": None,
        "daemon_url": "http://127.0.0.1:7272",
        "daemon_version_pre_sha256": "d" * 64,
        "raw_dimacs_identity": bundle.raw_dimacs_identity,
        "producer_job_id": "22222222-2222-4222-8222-222222222222",
        "producer_job_requested_core_limit": 1,
        "producer_prepare_preview": bundle.base_cnf[
            : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
        ].decode("utf-8", errors="replace"),
        "prepared_existing": True,
        "solver": {
            "name": qualification.PRODUCTION_SOLVER_NAME,
            "sha256": qualification.PRODUCTION_SOLVER_SHA256,
            "signature": qualification.PRODUCTION_SOLVER_SIGNATURE,
            "backend": qualification.PRODUCTION_SOLVER_BACKEND,
            "lane": qualification.PRODUCTION_SOLVER_LANE,
        },
        "policy": dict(qualification.PRODUCTION_V3_POLICY),
        "claims": dict(qualification.PRODUCTION_V3_CLAIMS),
    }
    authority["authority_sha256"] = hashlib.sha256(
        canonical_json_bytes(authority)
    ).hexdigest()
    (tmp_path / "source.json").write_bytes(bundle.source_manifest)
    (tmp_path / "producer.json").write_bytes(bundle.producer_manifest)
    (tmp_path / "authority.json").write_bytes(canonical_json_bytes(authority))


def test_complete_profile_is_validated_then_delegated_with_exact_argv(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    argv = _production_argv(tmp_path)
    _write_valid_inputs(tmp_path)
    delegated: list[list[str]] = []

    def main(forwarded: list[str]) -> int:
        delegated.append(forwarded)
        return 17

    monkeypatch.setattr(launcher.projected_v3, "main", main)

    assert launcher._validated_argv(argv) == argv
    assert launcher.main(argv) == 17
    assert delegated == [argv]


def test_malformed_v3_authority_fails_before_delegation_or_output(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _write_valid_inputs(tmp_path)
    authority_path = tmp_path / "authority.json"
    value = json.loads(authority_path.read_bytes())
    value["policy"]["workers"] = 2
    authority_path.write_bytes(canonical_json_bytes(value))

    def forbidden(*_args: object, **_kwargs: object) -> NoReturn:
        raise AssertionError("delegation, transport, or solver work ran")

    monkeypatch.setattr(launcher.projected_v3, "main", forbidden)
    monkeypatch.setattr(
        launcher.projected_v3, "_make_incremental_piqd_solver_runner", forbidden
    )

    with pytest.raises(SystemExit) as exc_info:
        launcher.main(_production_argv(tmp_path))

    assert exc_info.value.code == 2
    assert not (tmp_path / "out").exists()


def test_manifest_symlink_fails_before_delegation_or_output(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _write_valid_inputs(tmp_path)
    source_path = tmp_path / "source.json"
    target_path = tmp_path / "source-target.json"
    source_path.rename(target_path)
    source_path.symlink_to(target_path.name)

    def forbidden(*_args: object, **_kwargs: object) -> NoReturn:
        raise AssertionError("delegation, transport, or solver work ran")

    monkeypatch.setattr(launcher.projected_v3, "main", forbidden)

    with pytest.raises(SystemExit) as exc_info:
        launcher.main(_production_argv(tmp_path))

    assert exc_info.value.code == 2
    assert not (tmp_path / "out").exists()


def test_direct_cli_local_defaults_remain_legacy_diagnostic_only(
    tmp_path: Path,
) -> None:
    direct = launcher.projected_v3._parse_args([])
    assert direct.projected_static_v3 is False
    assert direct.persistent_discovery is False
    assert launcher.projected_v3._incremental_piqd_caller_config(direct) is None

    local_persistent = launcher.projected_v3._parse_args(
        ["--projected-static-v3", "--persistent-discovery"]
    )
    assert (
        launcher.projected_v3._incremental_piqd_caller_config(local_persistent) is None
    )
    with pytest.raises(SystemExit):
        launcher._validated_argv(
            [
                "--out",
                str(tmp_path / "out"),
                "--projected-static-v3",
                "--persistent-discovery",
            ]
        )
