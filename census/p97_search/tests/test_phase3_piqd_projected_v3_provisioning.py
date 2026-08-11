from __future__ import annotations

import json
import os
import stat
import urllib.parse
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_cegar_wave as wave
from census.p97_search import phase3_piqd_projected_v3_provisioning as provisioning
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search import phase3_structural_cegar_projected_static_v3 as projected
from census.p97_search.phase3_piqd_oracle import HttpResponse

JOB_ID = "12345678-1234-5678-9234-567812345678"
OTHER_JOB_ID = "87654321-4321-6789-9234-567812345678"


@pytest.fixture(scope="module")
def bundle() -> provisioning.CurrentUnshardedBundle:
    return provisioning.build_current_unsharded_projected_v3_bundle()


class FakeTransport:
    def __init__(
        self,
        bundle: provisioning.CurrentUnshardedBundle,
        *,
        existing: bool = True,
    ) -> None:
        self.bundle = bundle
        self.calls: list[tuple[str, str]] = []
        self.prepare: dict[str, Any] = {
            "job_id": JOB_ID,
            "existing": existing,
            "cnf_blob_hash": bundle.base_cnf_sha256,
            "identity_hash": bundle.raw_dimacs_identity,
            "num_vars": bundle.num_variables,
            "num_clauses": bundle.num_clauses,
            "preview": bundle.base_cnf[
                : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
            ].decode("utf-8", errors="replace"),
            "requested_core_limit": 1,
        }
        self.job: dict[str, Any] = {
            "id": JOB_ID,
            "status": "completed",
            "result": "SAT",
            "backend": "cadical",
            "project": "erdos-97-96-formalization",
            "timeout_s": 900,
            "march_timeout_s": 900,
            "wall_ms": 10,
            "wall_human": "10ms",
            "running_for_s": None,
            "created_at": 1,
            "confirmed_at": 2,
            "started_at": 3,
            "completed_at": 4,
            "model_blob_hash": None,
            "requested_core_limit": 1,
            "attested_solver_processes": 1,
            "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
            "cnf_blob_hash": bundle.base_cnf_sha256,
            "identity_hash": bundle.raw_dimacs_identity,
        }
        self.version: dict[str, Any] = {
            "daemon": {
                "name": "piqd",
                "version": "test-daemon",
                "protocol_version": 1,
                "sha256": "3" * 64,
            },
            "limits": {"max_var": 1_000_000},
        }
        self.registry: dict[str, Any] = {
            "daemon": {
                "name": "piqd",
                "version": "test-daemon",
                "protocol_version": 1,
                "sha256": "3" * 64,
            },
            "solver_dir": "/sealed/solvers",
            "solvers": [
                {
                    "lane": "sat",
                    "name": qualification.PRODUCTION_SOLVER_NAME,
                    "path": "/sealed/solvers/piqd-satworker",
                    "protocol_version": 1,
                    "sha256": qualification.PRODUCTION_SOLVER_SHA256,
                    "solver": "cadical",
                    "solver_signature": qualification.PRODUCTION_SOLVER_SIGNATURE,
                    "solver_source": "registry",
                    "solver_version": "3.0.0",
                    "usable": True,
                    "worker": "piqd-satworker",
                    "worker_version": "test",
                }
            ],
        }
        self.blob = bundle.base_cnf
        self.raw_overrides: dict[str, bytes] = {}
        self.response_overrides: dict[str, HttpResponse] = {}

    @staticmethod
    def _json(value: Any) -> HttpResponse:
        return HttpResponse(
            200,
            wave.canonical_json_bytes(value),
            {"Content-Type": "application/json"},
        )

    def __call__(self, method: str, url: str, body: Any, headers: Any) -> HttpResponse:
        del body, headers
        path = urllib.parse.urlsplit(url).path
        self.calls.append((method, path))
        if path in self.response_overrides:
            return self.response_overrides[path]
        if path in self.raw_overrides:
            return HttpResponse(
                200,
                self.raw_overrides[path],
                {"Content-Type": "application/json"},
            )
        if method == "POST" and path == "/jobs/prepare-cnf":
            return self._json(self.prepare)
        if method == "GET" and path == f"/jobs/{JOB_ID}":
            return self._json(self.job)
        if method == "GET" and path == (
            f"/jobs/{JOB_ID}/blobs/{self.bundle.base_cnf_sha256}"
        ):
            return HttpResponse(
                200,
                self.blob,
                {"Content-Type": "application/octet-stream"},
            )
        if method == "GET" and path == "/version":
            return self._json(self.version)
        if method == "GET" and path == "/solvers":
            return self._json(self.registry)
        raise AssertionError((method, path))


def _run(
    output: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    fake: FakeTransport,
    *,
    job_id: str | None = JOB_ID,
) -> provisioning.ProvisioningResult:
    return provisioning.provision_projected_v3_production(
        output_dir=output,
        daemon_url="http://piqd.test",
        producer_job_id=job_id,
        transport=fake,
        profile=provisioning.make_test_only_profile(bundle),
        allow_test_profile=True,
    )


def _run_production(
    output: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    fake: FakeTransport,
    *,
    job_id: str | None = JOB_ID,
    install_producer_manifest: bool = True,
) -> provisioning.ProvisioningResult:
    if install_producer_manifest:
        fake.job.setdefault("producer_manifest_hash", bundle.producer_manifest_sha256)
    return provisioning.provision_projected_v3_production(
        output_dir=output,
        daemon_url="http://piqd.test",
        producer_job_id=job_id,
        transport=fake,
    )


def test_public_builder_is_exact_global_bundle(
    bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    inputs = projected.build_projected_static_v3_unsharded_inputs()
    assert inputs.base_scope == "global-unsharded"
    assert inputs.profile == "phase3-v0.2-projected-static"
    assert not hasattr(inputs, "shard_index")
    assert not hasattr(inputs, "shard_count")
    assert not hasattr(inputs, "shard_literals")
    assert (bundle.num_variables, bundle.num_clauses) == (1_194, 58_314)
    assert bundle.base_cnf_sha256 == (
        "89548ae97ba91b15592c59c34a6c57f53f34095b990b0aea3993b13d84b5c30b"
    )
    assert bundle.variable_map_sha256 == qualification.PRODUCTION_VARIABLE_MAP_SHA256
    assert len(bundle.variable_map) == qualification.PRODUCTION_V3_VARIABLE_MAP_BYTES
    repeated = provisioning.build_current_unsharded_projected_v3_bundle()
    assert repeated.source_bundle == bundle.source_bundle
    assert repeated.source_manifest == bundle.source_manifest
    assert repeated.producer_manifest == bundle.producer_manifest
    dependency_value = json.loads(bundle.source_bundle)
    assert dependency_value == {
        "schema": "p97-projected-static-v3-source-bundle/v1",
        "files": [
            {"path": path, "sha256": sha256}
            for path, sha256 in sorted(projected._dependency_hashes().items())
        ],
    }
    assert bundle.source_bundle_sha256 == wave.sha256_bytes(bundle.source_bundle)
    assert wave.sha256_bytes(bundle.encoding_configuration) == (
        qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_SHA256
    )
    assert len(bundle.encoding_configuration) == (
        qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_BYTES
    )
    authenticated = static.authenticate_static_manifests(
        source_manifest=bundle.source_manifest,
        producer_manifest=bundle.producer_manifest,
    )
    assert bundle.source_manifest_sha256 == authenticated.source_sha256
    assert bundle.producer_manifest_sha256 == authenticated.producer_sha256
    assert bundle.raw_dimacs_identity == qualification.raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=bundle.base_cnf_sha256,
        producer_manifest_sha256=authenticated.producer_sha256,
        requested_core_limit=1,
    )
    assert len(json.loads(bundle.variable_map)) == 90
    with pytest.raises(AttributeError):
        bundle.base_cnf = b"crossed"  # type: ignore[misc]


@pytest.mark.parametrize(
    ("attack", "expected"),
    [
        ("malformed-map", "strict JSON"),
        ("float-map", "strict JSON"),
        ("bool-map", "complete/canonical"),
        ("semantic-schema", "configuration disagrees"),
        ("mincut-scope", "configuration disagrees"),
        ("configuration-int-bool", "configuration disagrees"),
    ],
)
def test_public_builder_schema_attacks_fail_closed(
    monkeypatch: pytest.MonkeyPatch,
    attack: str,
    expected: str,
) -> None:
    inputs = projected.build_projected_static_v3_unsharded_inputs()
    if attack == "malformed-map":
        attacked = replace(inputs, variable_map=b"[")
    elif attack == "float-map":
        mapping = json.loads(inputs.variable_map)
        mapping[0][2] = 1.0
        attacked = replace(
            inputs,
            variable_map=json.dumps(mapping, separators=(",", ":")).encode(),
        )
    elif attack == "bool-map":
        mapping = json.loads(inputs.variable_map)
        mapping[0][2] = True
        attacked = replace(
            inputs,
            variable_map=wave.canonical_json_bytes(mapping),
        )
    else:
        configuration = json.loads(inputs.encoding_configuration)
        if attack == "semantic-schema":
            configuration["semantic_assignment_schema"] = "crossed"
        elif attack == "mincut-scope":
            configuration["mincut_scope"] = "crossed"
        elif attack == "configuration-int-bool":
            configuration["project_blockers"] = 1
        attacked = replace(
            inputs,
            encoding_configuration=wave.canonical_json_bytes(configuration),
        )
    monkeypatch.setattr(
        projected,
        "build_projected_static_v3_unsharded_inputs",
        lambda: attacked,
    )
    with pytest.raises(provisioning.ProvisioningError, match=expected):
        provisioning.build_current_unsharded_projected_v3_bundle()


def test_production_v2_profile_drift_precedes_path_and_transport(
    bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    del bundle

    class ExplodingPath:
        def __fspath__(self) -> str:
            raise AssertionError("output path was inspected")

    def transport(*_args: Any) -> HttpResponse:
        raise AssertionError("transport was called")

    with pytest.raises(
        provisioning.ProfileDriftError, match=provisioning.PROFILE_DRIFT
    ):
        provisioning.provision_projected_v3_production(
            output_dir=ExplodingPath(),  # type: ignore[arg-type]
            daemon_url="not even validated before drift",
            transport=transport,
            profile=provisioning.PRODUCTION_V2_PROFILE,
        )


@pytest.mark.parametrize(
    "field",
    [
        "variable_map_sha256",
        "variable_map_bytes",
        "source_bundle_sha256",
        "source_bundle_bytes",
        "encoding_configuration_sha256",
        "encoding_configuration_bytes",
        "source_manifest_sha256",
        "source_manifest_bytes",
        "producer_manifest_sha256",
        "producer_manifest_bytes",
    ],
)
def test_crossed_manifest_profile_bindings_fail_before_transport(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    field: str,
) -> None:
    fake = FakeTransport(bundle)
    replacement: object = 1 if field.endswith("_bytes") else "f" * 64
    profile = replace(
        provisioning.make_test_only_profile(bundle),
        **{field: replacement},
    )
    with pytest.raises(provisioning.ProfileDriftError, match=field):
        provisioning.provision_projected_v3_production(
            output_dir=tmp_path / "packet",
            daemon_url="http://piqd.test",
            transport=fake,
            profile=profile,
            allow_test_profile=True,
        )
    assert fake.calls == []


@pytest.mark.parametrize(
    "field",
    [
        "base_cnf_sha256",
        "variable_map_sha256",
        "encoding_configuration",
    ],
)
def test_current_production_profile_drift_precedes_path_and_transport(
    monkeypatch: pytest.MonkeyPatch,
    bundle: provisioning.CurrentUnshardedBundle,
    field: str,
) -> None:
    replacement: object = b"{}" if field == "encoding_configuration" else "f" * 64
    attacked = replace(bundle, **{field: replacement})
    monkeypatch.setattr(
        provisioning,
        "build_current_unsharded_projected_v3_bundle",
        lambda: attacked,
    )

    class ExplodingPath:
        def __fspath__(self) -> str:
            raise AssertionError("output path was inspected")

    def transport(*_args: Any) -> HttpResponse:
        raise AssertionError("transport was called")

    with pytest.raises(provisioning.ProfileDriftError, match=field):
        provisioning.provision_projected_v3_production(
            output_dir=ExplodingPath(),  # type: ignore[arg-type]
            daemon_url="not inspected before drift",
            transport=transport,
        )


@pytest.mark.parametrize(
    "profile",
    [
        replace(provisioning.PRODUCTION_V3_PROFILE, name="forged-production-v3"),
        replace(provisioning.PRODUCTION_V3_PROFILE, solver_sha256="f" * 64),
        replace(
            provisioning.PRODUCTION_V2_PROFILE,
            name="forged-production-v2-current-profile",
            base_scope=qualification.PRODUCTION_V3_BASE_SCOPE,
            profile=qualification.PRODUCTION_V3_PROFILE,
            num_variables=qualification.PRODUCTION_V3_VARIABLES,
            num_clauses=qualification.PRODUCTION_V3_BASE_CLAUSES,
            base_cnf_sha256=qualification.PRODUCTION_V3_BASE_SHA256,
        ),
    ],
)
def test_forged_profile_lineage_fails_before_builder_output_and_transport(
    monkeypatch: pytest.MonkeyPatch,
    profile: provisioning.ProvisioningProfile,
) -> None:
    monkeypatch.setattr(
        provisioning,
        "build_current_unsharded_projected_v3_bundle",
        lambda: (_ for _ in ()).throw(AssertionError("builder was called")),
    )

    class ExplodingPath:
        def __fspath__(self) -> str:
            raise AssertionError("output path was inspected")

    def transport(*_args: Any) -> HttpResponse:
        raise AssertionError("transport was called")

    with pytest.raises(provisioning.ProvisioningError, match="sealed lineage"):
        provisioning.provision_projected_v3_production(
            output_dir=ExplodingPath(),  # type: ignore[arg-type]
            daemon_url="not inspected before lineage",
            transport=transport,
            profile=profile,
        )


@pytest.mark.parametrize("existing", [False, True])
def test_test_only_packet_records_existing_and_never_loads_as_v2(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    existing: bool,
) -> None:
    fake = FakeTransport(bundle, existing=existing)
    result = _run(
        tmp_path / "packet",
        bundle,
        fake,
        job_id=JOB_ID if existing else None,
    )
    assert result.prepared_existing is existing
    seal = json.loads(result.seal_path.read_bytes())
    assert seal["prepared_existing"] is existing
    assert seal["production"] is False
    assert all(value is False for value in seal["claims"].values())
    authority = json.loads(result.authority_path.read_bytes())
    assert authority["schema"] == provisioning.TEST_ONLY_AUTHORITY_SCHEMA
    assert authority["daemon_version_pre_sha256"] == wave.sha256_bytes(
        (result.directory / provisioning.DAEMON_VERSION_NAME).read_bytes()
    )
    with pytest.raises(qualification.QualificationError):
        qualification.load_production_authority_v2(result.authority_path)
    with pytest.raises(qualification.QualificationError):
        qualification.load_production_authority_v3(result.authority_path)


@pytest.mark.parametrize("existing", [False, True])
def test_production_v3_round_trips_exact_global_authority(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    existing: bool,
) -> None:
    result = _run_production(
        tmp_path / "packet",
        bundle,
        FakeTransport(bundle, existing=existing),
        job_id=JOB_ID if existing else None,
    )
    authority = qualification.load_production_authority_v3(result.authority_path)
    value = authority.value
    assert result.production is True
    assert result.prepared_existing is existing
    assert value["schema"] == qualification.PRODUCTION_V3_AUTHORITY_SCHEMA
    assert value["base_scope"] == "global"
    assert value["builder_base_scope"] == "global-unsharded"
    assert value["profile"] == qualification.PRODUCTION_V3_PROFILE
    assert value["shard_index"] is None
    assert value["shard_count"] is None
    assert value["shard_literals"] is None
    assert value["prepared_existing"] is existing
    assert value["producer_job_requested_core_limit"] == 1
    expected_preview = bundle.base_cnf[
        : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    assert value["producer_prepare_preview"] == expected_preview
    prepared = json.loads(
        (result.directory / provisioning.PREPARED_JOB_NAME).read_bytes()
    )
    assert prepared["preview"] == expected_preview
    assert all(claim is False for claim in value["claims"].values())
    with pytest.raises(qualification.QualificationError):
        qualification.load_production_authority_v2(result.authority_path)


@pytest.mark.parametrize(
    ("attack", "value"),
    [
        ("missing", None),
        ("crossed", "6" * 64),
        ("bool", True),
        ("float", 1.0),
    ],
)
def test_production_v3_requires_exact_job_producer_manifest_identity(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    attack: str,
    value: object,
) -> None:
    fake = FakeTransport(bundle)
    if attack == "missing":
        with pytest.raises(provisioning.ProvisioningError, match="missing or unknown"):
            _run_production(
                tmp_path / "packet",
                bundle,
                fake,
                install_producer_manifest=False,
            )
    else:
        fake.job["producer_manifest_hash"] = value
        with pytest.raises(provisioning.ProvisioningError, match="producer job"):
            _run_production(tmp_path / "packet", bundle, fake)
    assert not (tmp_path / "packet" / provisioning.SEAL_NAME).exists()


def test_packet_bytes_are_deterministic(
    tmp_path: Path, bundle: provisioning.CurrentUnshardedBundle
) -> None:
    first = _run(tmp_path / "first", bundle, FakeTransport(bundle))
    second = _run(tmp_path / "second", bundle, FakeTransport(bundle))
    first_files = {path.name: path.read_bytes() for path in first.directory.iterdir()}
    second_files = {path.name: path.read_bytes() for path in second.directory.iterdir()}
    assert first_files == second_files
    assert stat.S_IMODE(first.directory.stat().st_mode) == 0o700
    assert all(
        stat.S_IMODE(path.stat().st_mode) == 0o600 for path in first.directory.iterdir()
    )


@pytest.mark.parametrize(
    "attack",
    [
        "prepare-extra",
        "prepare-missing",
        "prepare-bool",
        "prepare-float",
        "prepare-preview-missing",
        "prepare-preview-bool",
        "prepare-preview-float",
        "prepare-preview-tamper",
        "prepare-crossed-manifest",
        "job-extra",
        "job-missing",
        "job-bool",
        "job-crossed-id",
        "job-crossed-cnf",
        "job-aggregate",
        "blob-crossed-cnf",
        "version-extra",
        "version-bool",
        "registry-extra",
        "registry-daemon-extra",
        "registry-daemon-missing-required",
        "registry-daemon-sha-uppercase",
        "registry-daemon-sha-bool",
        "registry-daemon-sha-float",
        "registry-daemon-sha-crossed",
        "registry-crossed-version",
        "registry-crossed-solver",
        "registry-crossed-signature",
        "registry-bool",
    ],
)
def test_crossed_schema_and_builtin_attacks_fail_closed(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    attack: str,
) -> None:
    fake = FakeTransport(bundle)
    if attack == "prepare-extra":
        fake.prepare["EXTRA"] = "forbidden"
    elif attack == "prepare-missing":
        del fake.prepare["existing"]
    elif attack == "prepare-bool":
        fake.prepare["num_vars"] = True
    elif attack == "prepare-float":
        fake.raw_overrides["/jobs/prepare-cnf"] = json.dumps(
            {**fake.prepare, "num_vars": 1194.0}, separators=(",", ":")
        ).encode()
    elif attack == "prepare-preview-missing":
        del fake.prepare["preview"]
    elif attack == "prepare-preview-bool":
        fake.prepare["preview"] = True
    elif attack == "prepare-preview-float":
        fake.prepare["preview"] = 1.0
    elif attack == "prepare-preview-tamper":
        fake.prepare["preview"] += "crossed"
    elif attack == "prepare-crossed-manifest":
        fake.prepare["identity_hash"] = "5" * 64
    elif attack == "job-extra":
        fake.job["EXTRA"] = "forbidden"
    elif attack == "job-missing":
        del fake.job["result"]
    elif attack == "job-bool":
        fake.job["attested_solver_processes"] = True
    elif attack == "job-crossed-id":
        fake.job["id"] = OTHER_JOB_ID
    elif attack == "job-crossed-cnf":
        fake.job["cnf_blob_hash"] = "6" * 64
    elif attack == "job-aggregate":
        fake.raw_overrides[f"/jobs/{JOB_ID}"] = wave.canonical_json_bytes(
            {**fake.job, "project": "x" * qualification.MAX_JOB_STATUS_BYTES}
        )
    elif attack == "blob-crossed-cnf":
        fake.blob = bundle.base_cnf + b"c crossed\n"
    elif attack == "version-extra":
        fake.version["EXTRA"] = "forbidden"
    elif attack == "version-bool":
        fake.version["daemon"]["protocol_version"] = True
    elif attack == "registry-extra":
        fake.registry["solvers"][0]["EXTRA"] = "forbidden"
    elif attack == "registry-daemon-extra":
        fake.registry["daemon"]["EXTRA"] = "forbidden"
    elif attack == "registry-daemon-missing-required":
        del fake.registry["daemon"]["version"]
    elif attack == "registry-daemon-sha-uppercase":
        fake.registry["daemon"]["sha256"] = "A" * 64
    elif attack == "registry-daemon-sha-bool":
        fake.registry["daemon"]["sha256"] = True
    elif attack == "registry-daemon-sha-float":
        fake.registry["daemon"]["sha256"] = 3.0
    elif attack == "registry-daemon-sha-crossed":
        fake.registry["daemon"]["sha256"] = "4" * 64
    elif attack == "registry-crossed-version":
        fake.registry["daemon"]["version"] = "other-daemon"
    elif attack == "registry-crossed-solver":
        fake.registry["solvers"][0]["sha256"] = "7" * 64
    elif attack == "registry-crossed-signature":
        fake.registry["solvers"][0]["solver_signature"] = "crossed"
    elif attack == "registry-bool":
        fake.registry["daemon"]["protocol_version"] = True
    with pytest.raises(provisioning.ProvisioningError):
        _run(tmp_path / "packet", bundle, fake)
    assert not (tmp_path / "packet" / provisioning.SEAL_NAME).exists()


def test_solver_registry_daemon_sha256_is_optional_and_exactly_bound(
    tmp_path: Path, bundle: provisioning.CurrentUnshardedBundle
) -> None:
    current = FakeTransport(bundle)
    present = _run(tmp_path / "present", bundle, current)
    assert json.loads(present.authority_path.read_bytes())["schema"] == (
        provisioning.TEST_ONLY_AUTHORITY_SCHEMA
    )

    historical_shape = FakeTransport(bundle)
    del historical_shape.registry["daemon"]["sha256"]
    absent = _run(tmp_path / "absent", bundle, historical_shape)
    assert json.loads(absent.authority_path.read_bytes())["schema"] == (
        provisioning.TEST_ONLY_AUTHORITY_SCHEMA
    )


def test_solver_registry_daemon_sha256_rejects_string_subclasses(
    bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    class StringSubclass(str):
        pass

    fake = FakeTransport(bundle)
    fake.registry["daemon"]["sha256"] = StringSubclass("3" * 64)
    with pytest.raises(provisioning.ProvisioningError, match="lowercase 64-hex"):
        provisioning._validate_registry(
            fake.registry,
            version_daemon=fake.version["daemon"],
            profile=provisioning.make_test_only_profile(bundle),
        )


def test_prepare_preview_rejects_string_subclasses(
    bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    class StringSubclass(str):
        pass

    fake = FakeTransport(bundle)
    expected = fake.prepare["preview"]
    fake.prepare["preview"] = StringSubclass(expected)
    with pytest.raises(provisioning.ProvisioningError, match="builtin str"):
        provisioning._prepare_response_contract(
            fake.prepare,
            expected_preview=expected,
        )


def test_http_response_subclass_and_existing_rebind_fail_closed(
    tmp_path: Path, bundle: provisioning.CurrentUnshardedBundle
) -> None:
    class SubResponse(HttpResponse):
        pass

    fake = FakeTransport(bundle)
    fake.response_overrides["/version"] = SubResponse(
        200,
        wave.canonical_json_bytes(fake.version),
        {"Content-Type": "application/json"},
    )
    with pytest.raises(provisioning.ProvisioningError, match="exact HttpResponse"):
        _run(tmp_path / "subclass", bundle, fake)

    not_existing = FakeTransport(bundle, existing=False)
    with pytest.raises(provisioning.ProvisioningError, match="rebind as existing"):
        _run(tmp_path / "existing", bundle, not_existing, job_id=JOB_ID)


def test_profile_subclass_is_rejected_before_transport(
    tmp_path: Path, bundle: provisioning.CurrentUnshardedBundle
) -> None:
    class ProfileSubclass(provisioning.ProvisioningProfile):
        pass

    profile = ProfileSubclass(**vars(provisioning.make_test_only_profile(bundle)))
    fake = FakeTransport(bundle)
    with pytest.raises(
        provisioning.ProvisioningError, match="exact ProvisioningProfile"
    ):
        provisioning.provision_projected_v3_production(
            output_dir=tmp_path / "packet",
            daemon_url="http://piqd.test",
            transport=fake,
            profile=profile,
            allow_test_profile=True,
        )
    assert fake.calls == []


@pytest.mark.parametrize("crossed_workers", [True, 1.0])
def test_profile_policy_builtin_substitutions_are_rejected(
    bundle: provisioning.CurrentUnshardedBundle,
    crossed_workers: object,
) -> None:
    profile = provisioning.make_test_only_profile(bundle)
    fields = vars(profile)
    policy = json.loads(profile.policy)
    policy["workers"] = crossed_workers
    with pytest.raises(provisioning.ProvisioningError, match="profile.policy"):
        provisioning.ProvisioningProfile(
            **{**fields, "policy": wave.canonical_json_bytes(policy)}
        )


def test_test_profile_rejects_non_origin_url_before_transport(
    tmp_path: Path, bundle: provisioning.CurrentUnshardedBundle
) -> None:
    fake = FakeTransport(bundle)
    with pytest.raises(provisioning.ProvisioningError, match="origin-only"):
        provisioning.provision_projected_v3_production(
            output_dir=tmp_path / "packet",
            daemon_url="http://piqd.test/crossed",
            transport=fake,
            profile=provisioning.make_test_only_profile(bundle),
            allow_test_profile=True,
        )
    assert fake.calls == []


def test_symlink_output_is_rejected(
    tmp_path: Path, bundle: provisioning.CurrentUnshardedBundle
) -> None:
    target = tmp_path / "target"
    target.mkdir()
    output = tmp_path / "packet"
    output.symlink_to(target, target_is_directory=True)
    with pytest.raises(provisioning.ProvisioningError, match="already exists"):
        _run(output, bundle, FakeTransport(bundle))
    assert list(target.iterdir()) == []


def test_hardlink_to_created_output_is_detected(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "packet"
    outside = tmp_path / "hardlink"
    original = provisioning._write_all
    linked = False

    def attack(descriptor: int, payload: bytes) -> None:
        nonlocal linked
        original(descriptor, payload)
        if not linked:
            os.link(output / provisioning.BASE_CNF_NAME, outside)
            linked = True

    monkeypatch.setattr(provisioning, "_write_all", attack)
    with pytest.raises(provisioning.ProvisioningError, match="lost its identity"):
        _run(output, bundle, FakeTransport(bundle))
    assert outside.exists()
    assert not (output / provisioning.SEAL_NAME).exists()


def test_output_root_toctou_replacement_is_detected(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "packet"
    displaced = tmp_path / "displaced"
    original = provisioning._write_all
    replaced = False

    def attack(descriptor: int, payload: bytes) -> None:
        nonlocal replaced
        original(descriptor, payload)
        if not replaced:
            output.rename(displaced)
            output.mkdir(mode=0o700)
            replaced = True

    monkeypatch.setattr(provisioning, "_write_all", attack)
    with pytest.raises(provisioning.ProvisioningError, match="output directory"):
        _run(output, bundle, FakeTransport(bundle))
    assert not (output / provisioning.SEAL_NAME).exists()


def test_created_file_replacement_is_detected(
    tmp_path: Path,
    bundle: provisioning.CurrentUnshardedBundle,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "packet"
    original = provisioning._write_all
    replaced = False

    def attack(descriptor: int, payload: bytes) -> None:
        nonlocal replaced
        original(descriptor, payload)
        if not replaced:
            path = output / provisioning.BASE_CNF_NAME
            path.unlink()
            path.write_bytes(b"replacement")
            os.chmod(path, 0o600)
            replaced = True

    monkeypatch.setattr(provisioning, "_write_all", attack)
    with pytest.raises(provisioning.ProvisioningError, match="lost its identity"):
        _run(output, bundle, FakeTransport(bundle))
    assert not (output / provisioning.SEAL_NAME).exists()


def test_prepare_script_is_executable_and_exposes_no_test_profile() -> None:
    script = Path("scripts/prepare-p97-piqd-projected-v3-production.py")
    assert script.is_file()
    assert script.stat().st_mode & stat.S_IXUSR
    source = script.read_text()
    assert "allow_test_profile" not in source
    assert "make_test_only_profile" not in source
