from __future__ import annotations

import json
import os
from copy import deepcopy
from dataclasses import replace
from pathlib import Path

import pytest

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    wave_manifest_sha256,
)
from census.p97_search.phase3_cegar_wave_control import (
    ACTIVE,
    ARTIFACT,
    CAMPAIGN,
    CLEANUP_PLAN_SCHEMA,
    CNF,
    COMPATIBILITY_SHIM,
    CONTROL_SCHEMA,
    CUBE,
    ENTRYPOINT,
    FROZEN_REPRODUCTION,
    INVENTORY_SCHEMA,
    JOURNAL,
    LRAT,
    MAX_STATIC_CNF_BYTES,
    NOT_RUN,
    OUTPUT,
    PACKAGE,
    PASS,
    PROOF,
    PROTECTED_ARTIFACT,
    RECEIPT,
    RESULT,
    STATIC_CNF,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    STATIC_CNF_SEMANTIC_VALIDATOR,
    STATIC_REGISTRY,
    UNCLASSIFIED,
    WaveControlError,
    bind_static_cnf,
    build_cleanup_plan,
    load_entrypoint_inventory,
    load_wave_control,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy


def _write(root: Path, relative: str, payload: bytes) -> dict[str, str]:
    path = root / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    return {"path": relative, "sha256": sha256_bytes(payload)}


def _package(
    tmp_path: Path,
    *,
    cnf: bytes = b"p cnf 1 1\n1 0\n",
    producer: bytes | None = None,
    variable_map: bytes | None = None,
) -> tuple[bytes, dict[str, bytes]]:
    payloads = {
        "cnf": cnf,
        "producer": (
            producer
            if producer is not None
            else canonical_json_bytes({"producer": "fixture"})
        ),
        "map": (
            variable_map
            if variable_map is not None
            else canonical_json_bytes({"1": "fixture-variable"})
        ),
    }
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "static-fixture-wave",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.fixtureLeaf",
            "ingress_hypotheses_sha256": sha256_bytes(b"fixture-ingress"),
            "finite_schema": "fixture-static-cnf/v1",
            "cardinality_scope": "one authenticated finite fixture",
            "source_theorem": "Problem97.fixtureSource",
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(payloads["cnf"]),
            "variable_map_sha256": sha256_bytes(payloads["map"]),
            "producer_manifest_sha256": sha256_bytes(payloads["producer"]),
            "num_variables": 1,
            "num_clauses": 1,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "proof",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(b"fixture-order"),
            "seed": 0,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    payloads["manifest"] = canonical_json_bytes(manifest)
    references = {}
    for name, relative in (
        ("cnf", "package/input.cnf"),
        ("producer", "package/producer.json"),
        ("map", "package/variable-map.json"),
        ("manifest", "package/wave.json"),
    ):
        reference = _write(tmp_path, relative, payloads[name])
        references[name] = {**reference, "max_bytes": 1 << 20}
    assert references["manifest"]["sha256"] == wave_manifest_sha256(manifest)
    control = {
        "schema": CONTROL_SCHEMA,
        "wave_kind": STATIC_CNF,
        "adapter_id": STATIC_CNF_PIQD_ADAPTER,
        "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA,
        "wave_manifest": references["manifest"],
        "package": {
            "cnf": references["cnf"],
            "producer_manifest": references["producer"],
            "variable_map": references["map"],
        },
        "driver_policy": DriverPolicy(requested_core_limit=1).as_dict(),
        "semantic_validator": STATIC_CNF_SEMANTIC_VALIDATOR,
    }
    return canonical_json_bytes(control), payloads


def _pointer(root: Path, relative: str, payload: bytes) -> dict[str, str]:
    return _write(root, relative, payload)


def _entry(root: Path, relative: str = "scripts/legacy-wave.py") -> dict[str, object]:
    target = _pointer(root, relative, b"print('legacy')\n")
    replacement = _pointer(root, "scripts/wave-framework.py", b"print('framework')\n")
    shadow = _pointer(root, "receipts/shadow.json", b"shadow-pass\n")
    historical = _pointer(root, "receipts/historical.json", b"historical-pass\n")
    archive = _pointer(root, "archives/legacy.json", b"archive\n")
    rollback = _pointer(root, "archives/rollback.json", b"rollback\n")
    return {
        **target,
        "wave_id": "legacy-wave",
        "kind": ENTRYPOINT,
        "lifecycle": COMPATIBILITY_SHIM,
        "replacement": replacement,
        "runtime_callers": [],
        "active_manifest_references": [],
        "static_callers": [],
        "receipt_paths": [historical["path"], shadow["path"]],
        "artifact_paths": ["artifacts/legacy-proof.lrat"],
        "archive_manifest": archive,
        "rollback_pointer": rollback,
        "shadow_replay": {"status": PASS, "receipt": shadow},
        "historical_replay": {"status": PASS, "receipt": historical},
        "active_writer": False,
        "cleanup_approved": True,
    }


def _inventory(*entries: dict[str, object]) -> bytes:
    ordered = sorted(entries, key=lambda entry: str(entry["path"]))
    return canonical_json_bytes({"schema": INVENTORY_SCHEMA, "entries": ordered})


def _cleanup_plan(
    raw: bytes,
    root: Path,
    *,
    expected_sha256: str | None = None,
    approved_entrypoints: dict[str, str] | None = None,
) -> dict[str, object]:
    root = root.resolve()
    if approved_entrypoints is None:
        inventory = json.loads(raw)
        approved_entrypoints = dict(
            sorted(
                (str(entry["path"]), str(entry["sha256"]))
                for entry in inventory["entries"]
                if entry["kind"] == ENTRYPOINT
            )
        )
    return build_cleanup_plan(
        raw,
        root,
        expected_inventory_sha256=expected_sha256 or sha256_bytes(raw),
        approved_entrypoints=approved_entrypoints,
    )


def test_cleanup_plan_rejects_noncanonical_repo_root(tmp_path: Path) -> None:
    root = tmp_path.resolve()
    entry = _entry(root)
    raw = _inventory(entry)
    alias = root.parent / f"{root.name}-alias"
    alias.symlink_to(root, target_is_directory=True)
    try:
        with pytest.raises(WaveControlError, match="canonical no-symlink"):
            build_cleanup_plan(
                raw,
                alias,
                expected_inventory_sha256=sha256_bytes(raw),
                approved_entrypoints={str(entry["path"]): str(entry["sha256"])},
            )
    finally:
        alias.unlink()


def test_static_registry_is_closed_and_binds_exact_package(tmp_path: Path) -> None:
    raw, payloads = _package(tmp_path)
    control = load_wave_control(raw)
    binding = bind_static_cnf(control, tmp_path)
    registration = STATIC_REGISTRY[(STATIC_CNF, STATIC_CNF_PIQD_ADAPTER, "v1")]
    assert binding.cnf == payloads["cnf"]
    assert binding.producer_manifest == payloads["producer"]
    assert binding.variable_map == payloads["map"]
    assert binding.wave_manifest_bytes == payloads["manifest"]
    assert registration.permits_campaign is False
    assert registration.permits_terminal_proof is False


def test_bind_static_cnf_rejects_relative_package_root(tmp_path: Path) -> None:
    raw, _ = _package(tmp_path)
    with pytest.raises(WaveControlError, match="must be absolute"):
        bind_static_cnf(load_wave_control(raw), Path("relative-package"))


def test_v1_control_and_package_bytes_are_frozen_and_profile_is_reserved(
    tmp_path: Path,
) -> None:
    raw, _ = _package(tmp_path)

    # This fixture is deliberately a byte-level v1 compatibility anchor.  A
    # profile belongs to a versioned control branch, never to this v1 record.
    assert len(raw) == 992
    assert sha256_bytes(raw) == (
        "cd84ec74993b7a8210f6e350073493fc9d44a72784f2ac76bf8093ac9bec5ecd"
    )
    value = json.loads(raw)
    assert set(value) == {
        "schema",
        "wave_kind",
        "adapter_id",
        "adapter_schema",
        "wave_manifest",
        "package",
        "driver_policy",
        "semantic_validator",
    }
    assert set(value["package"]) == {"cnf", "producer_manifest", "variable_map"}

    profiled = deepcopy(value)
    profiled["semantic_profile"] = {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "sha256": "0" * 64,
    }
    with pytest.raises(WaveControlError):
        load_wave_control(canonical_json_bytes(profiled))


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("wave_kind", "CAMPAIGN"),
        ("adapter_id", "python.module:dynamic_adapter"),
        ("adapter_schema", "v2"),
        ("semantic_validator", "accept-anything/v1"),
    ],
)
def test_control_rejects_unregistered_or_crossed_dispatch(
    tmp_path: Path, field: str, value: str
) -> None:
    raw, _ = _package(tmp_path)
    control = json.loads(raw)
    control[field] = value
    with pytest.raises(WaveControlError):
        load_wave_control(canonical_json_bytes(control))


def test_control_rejects_duplicate_noncanonical_and_crossed_package(
    tmp_path: Path,
) -> None:
    raw, _ = _package(tmp_path)
    with pytest.raises(WaveControlError, match="canonical"):
        load_wave_control(raw + b"\n")
    with pytest.raises(WaveControlError, match="duplicate"):
        load_wave_control(b'{"schema":"a","schema":"b"}')
    control = load_wave_control(raw)
    (tmp_path / control.cnf.path).write_bytes(b"p cnf 1 0\n")
    with pytest.raises(WaveControlError, match="digest"):
        bind_static_cnf(control, tmp_path)


@pytest.mark.parametrize("attack", ["symlink", "hardlink", "oversize"])
def test_package_capture_rejects_link_and_size_attacks(
    tmp_path: Path, attack: str
) -> None:
    raw, _ = _package(tmp_path)
    control = load_wave_control(raw)
    target = tmp_path / control.cnf.path
    if attack == "symlink":
        saved = tmp_path / "saved.cnf"
        target.rename(saved)
        target.symlink_to(saved)
    elif attack == "hardlink":
        os.link(target, tmp_path / "second-link.cnf")
    else:
        crossed = deepcopy(control.value)
        crossed["package"]["cnf"]["max_bytes"] = 1
        control = load_wave_control(canonical_json_bytes(crossed))
    with pytest.raises(WaveControlError, match="capture"):
        bind_static_cnf(control, tmp_path)


def test_control_reference_caps_and_reconstructed_object_are_revalidated(
    tmp_path: Path,
) -> None:
    raw, _ = _package(tmp_path)
    crossed = json.loads(raw)
    crossed["package"]["cnf"]["max_bytes"] = MAX_STATIC_CNF_BYTES + 1
    with pytest.raises(WaveControlError, match="registered limit"):
        load_wave_control(canonical_json_bytes(crossed))
    control = load_wave_control(raw)
    forged = replace(control, cnf=replace(control.cnf, max_bytes=1))
    with pytest.raises(WaveControlError, match="differs from its canonical"):
        bind_static_cnf(forged, tmp_path)


@pytest.mark.parametrize(
    ("package_kwargs", "message"),
    [
        ({"cnf": b"p cnf 1 1\n2 0\n"}, "literal exceeds"),
        (
            {"producer": b'{ "producer": "fixture" }'},
            "producer manifest must use canonical",
        ),
        (
            {"variable_map": b'{ "1": "fixture-variable" }'},
            "variable map must use canonical",
        ),
    ],
)
def test_static_semantic_validator_executes(
    tmp_path: Path, package_kwargs: dict[str, bytes], message: str
) -> None:
    raw, _ = _package(tmp_path, **package_kwargs)
    with pytest.raises(WaveControlError, match=message):
        bind_static_cnf(load_wave_control(raw), tmp_path)


def test_cleanup_plan_is_authenticated_deterministic_and_dry_run_only(
    tmp_path: Path,
) -> None:
    entry = _entry(tmp_path)
    raw = _inventory(entry)
    before = {path: path.read_bytes() for path in tmp_path.rglob("*") if path.is_file()}
    plan = _cleanup_plan(raw, tmp_path)
    assert plan["schema"] == CLEANUP_PLAN_SCHEMA
    assert plan["inventory_sha256"] == sha256_bytes(raw)
    assert [target["path"] for target in plan["targets"]] == [entry["path"]]
    assert plan["blocked"] == []
    assert plan["claims"] == {
        "dry_run_only": True,
        "filesystem_mutation": False,
        "protected_artifacts_deleted": False,
    }
    assert plan == _cleanup_plan(raw, tmp_path)
    assert before == {
        path: path.read_bytes() for path in tmp_path.rglob("*") if path.is_file()
    }


@pytest.mark.parametrize(
    ("kind", "lifecycle"),
    [
        (CAMPAIGN, ACTIVE),
        (PACKAGE, ACTIVE),
        (CNF, PROTECTED_ARTIFACT),
        (CUBE, PROTECTED_ARTIFACT),
        (LRAT, PROTECTED_ARTIFACT),
        (PROOF, PROTECTED_ARTIFACT),
        (RECEIPT, PROTECTED_ARTIFACT),
        (JOURNAL, PROTECTED_ARTIFACT),
        (RESULT, PROTECTED_ARTIFACT),
        (ARTIFACT, PROTECTED_ARTIFACT),
        (OUTPUT, PROTECTED_ARTIFACT),
        (ENTRYPOINT, ACTIVE),
        (ENTRYPOINT, FROZEN_REPRODUCTION),
        (ENTRYPOINT, UNCLASSIFIED),
    ],
)
def test_cleanup_never_authenticates_protected_or_nonshim_paths(
    tmp_path: Path, kind: str, lifecycle: str
) -> None:
    entry = _entry(tmp_path)
    target = tmp_path / str(entry["path"])
    target.unlink()
    target.mkdir()
    entry["kind"] = kind
    entry["lifecycle"] = lifecycle
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    reasons = plan["blocked"][0]["reasons"]
    if kind != ENTRYPOINT:
        assert "not-an-entrypoint" in reasons
        assert "target-not-in-trusted-allowlist" in reasons
    if lifecycle != COMPATIBILITY_SHIM:
        assert "lifecycle-not-compatibility-shim" in reasons
    assert "target-authentication-failed" not in reasons


@pytest.mark.parametrize(
    ("mutate", "reason"),
    [
        (lambda entry: entry.update(replacement=None), "missing-replacement"),
        (
            lambda entry: entry.update(
                replacement={"path": entry["path"], "sha256": entry["sha256"]}
            ),
            "replacement-is-target",
        ),
        (
            lambda entry: entry.update(runtime_callers=["caller.py"]),
            "nonempty-runtime-callers",
        ),
        (
            lambda entry: entry["shadow_replay"].update(status=NOT_RUN, receipt=None),
            "shadow-replay-not-pass",
        ),
        (lambda entry: entry.update(active_writer=True), "active-writer"),
        (lambda entry: entry.update(cleanup_approved=False), "cleanup-not-approved"),
        (lambda entry: entry.update(archive_manifest=None), "missing-archive-manifest"),
        (lambda entry: entry.update(rollback_pointer=None), "missing-rollback-pointer"),
    ],
)
def test_cleanup_requires_every_retirement_gate(
    tmp_path: Path, mutate: object, reason: str
) -> None:
    entry = _entry(tmp_path)
    mutate(entry)  # type: ignore[operator]
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    assert reason in plan["blocked"][0]["reasons"]


@pytest.mark.parametrize(
    "field",
    [
        "replacement",
        "archive_manifest",
        "rollback_pointer",
        "shadow_replay",
        "historical_replay",
        "target",
    ],
)
def test_cleanup_rejects_crossed_evidence_hashes(tmp_path: Path, field: str) -> None:
    entry = _entry(tmp_path)
    if field in {"shadow_replay", "historical_replay"}:
        entry[field]["receipt"]["sha256"] = "0" * 64  # type: ignore[index]
    elif field == "target":
        entry["sha256"] = "0" * 64
    else:
        entry[field]["sha256"] = "0" * 64  # type: ignore[index]
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    assert any(
        "failed" in reason or "crossed" in reason
        for reason in plan["blocked"][0]["reasons"]
    )


def test_cleanup_requires_external_inventory_digest_and_trusted_entrypoint(
    tmp_path: Path,
) -> None:
    entry = _entry(tmp_path)
    raw = _inventory(entry)
    with pytest.raises(WaveControlError, match="externally authenticated"):
        _cleanup_plan(raw, tmp_path, expected_sha256="0" * 64)
    missing = _cleanup_plan(raw, tmp_path, approved_entrypoints={})
    assert missing["blocked"][0]["reasons"] == ["target-not-in-trusted-allowlist"]
    crossed = _cleanup_plan(
        raw,
        tmp_path,
        approved_entrypoints={str(entry["path"]): "0" * 64},
    )
    assert crossed["blocked"][0]["reasons"] == ["target-trusted-digest-crossed"]


def test_cleanup_target_cannot_alias_protected_evidence(tmp_path: Path) -> None:
    entry = _entry(tmp_path)
    entry["artifact_paths"] = [entry["path"]]
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    assert plan["blocked"][0]["reasons"] == ["target-aliases-protected-evidence"]


def test_inventory_rejects_noncanonical_duplicate_bool_and_missing_pass_receipt(
    tmp_path: Path,
) -> None:
    entry = _entry(tmp_path)
    raw = _inventory(entry)
    with pytest.raises(WaveControlError, match="canonical"):
        load_entrypoint_inventory(raw + b"\n")
    with pytest.raises(WaveControlError, match="path-sorted and unique"):
        load_entrypoint_inventory(_inventory(entry, deepcopy(entry)))
    crossed = deepcopy(entry)
    crossed["active_writer"] = 0
    with pytest.raises(WaveControlError, match="builtin bool"):
        load_entrypoint_inventory(_inventory(crossed))
    crossed = deepcopy(entry)
    crossed["shadow_replay"]["receipt"] = None  # type: ignore[index]
    with pytest.raises(WaveControlError, match="required for PASS"):
        load_entrypoint_inventory(_inventory(crossed))
