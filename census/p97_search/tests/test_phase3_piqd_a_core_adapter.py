"""Offline adversarial tests for the additive A-core PIQD boundary."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest

from census.p97_search.phase3_cegar_wave import validate_wave_manifest
from census.p97_search.phase3_piqd_a_core_adapter import (
    CANONICAL_NUM_CLAUSES,
    CANONICAL_NUM_VARIABLES,
    ACorePiqdAdapterError,
    canonical_variable_map,
    load_package,
    make_wave_manifest,
    packet_from_package,
    packet_from_source_package,
    replay_durable_output,
    run_durable_packet,
    run_packet,
    validate_static_package,
    write_receipt,
)
from census.p97_search.phase3_piqd_a_core_package import build_source_package
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PreparedJob,
    raw_dimacs_identity,
)


def _canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode() + b"\n"


def _artifact(tmp_path: Path) -> Path:
    root = tmp_path / "a_core"
    (root / "out").mkdir(parents=True)
    for name in ("encoding.py", "run.py", "smoke.py", "RESULTS.md"):
        (root / name).write_text(f"producer {name}\n")
    cnf = (
        f"p cnf {CANONICAL_NUM_VARIABLES} {CANONICAL_NUM_CLAUSES}\n".encode()
        + b"1 0\n" * CANONICAL_NUM_CLAUSES
    )
    mapping = canonical_variable_map()
    model = {atom: True for atom in mapping["variables"].values()}
    manifest = [
        {
            "run": "base+P",
            "verdict": "SAT",
            "n_variables": CANONICAL_NUM_VARIABLES,
            "n_clauses": CANONICAL_NUM_CLAUSES,
            "wall_seconds": 0.01,
            "cnf_file": "out/base+P.cnf",
            "proof_verified": False,
            "model_file": "out/base+P.model.json",
            "model_true_atoms": sorted(model),
        }
    ]
    (root / "out/base+P.cnf").write_bytes(cnf)
    (root / "out/base+P.model.json").write_bytes(_canonical(model))
    (root / "out/base+P.variable-map.json").write_bytes(_canonical(mapping))
    (root / "out/manifest.json").write_bytes(_canonical(manifest))
    return root


def test_fixture_loads_and_binds_exact_producer(tmp_path: Path) -> None:
    package = load_package(
        _artifact(tmp_path), variable_map_path=Path("out/base+P.variable-map.json")
    )
    assert package.case == "base+P"
    assert package.variable_map[1] == canonical_variable_map()["variables"]["1"]
    assert len(package.variable_map) == CANONICAL_NUM_VARIABLES
    assert package.cnf_sha256 == hashlib.sha256(package.cnf).hexdigest()
    assert len(package.producer_bytes) > 0
    validate_wave_manifest(make_wave_manifest(packet_from_package(package)))


def test_live_artifact_preflight_fails_closed_without_map() -> None:
    root = Path(__file__).parents[3] / "census/frontier-packages/a_core"
    with pytest.raises(ACorePiqdAdapterError, match="variable-map"):
        load_package(root)


@pytest.mark.parametrize(
    "mutate",
    [
        lambda m: m[0].update(extra=True),
        lambda m: m[0].update(n_variables=True),
        lambda m: m[0].update(verdict="UNKNOWN"),
    ],
)
def test_manifest_schema_and_builtin_types_are_strict(tmp_path: Path, mutate) -> None:
    root = _artifact(tmp_path)
    manifest = json.loads((root / "out/manifest.json").read_bytes())
    mutate(manifest)
    with pytest.raises(ACorePiqdAdapterError):
        validate_static_package(
            manifest_bytes=_canonical(manifest),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=(root / "out/base+P.model.json").read_bytes(),
            variable_map_bytes=(root / "out/base+P.variable-map.json").read_bytes(),
        )


def test_noncanonical_manifest_and_duplicate_json_key_rejected(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    raw = b'[ {"run":"base+P", "verdict":"SAT", "n_variables":889, "n_clauses":21101, "wall_seconds":0.01, "cnf_file":"out/base+P.cnf", "proof_verified":false, "model_file":"out/base+P.model.json", "model_true_atoms":[] } ]\n'
    with pytest.raises(ACorePiqdAdapterError, match="canonical"):
        validate_static_package(
            manifest_bytes=raw,
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=(root / "out/base+P.model.json").read_bytes(),
            variable_map_bytes=(root / "out/base+P.variable-map.json").read_bytes(),
        )
    with pytest.raises(ACorePiqdAdapterError):
        validate_static_package(
            manifest_bytes=b'[{"x":1,"x":2}]',
            cnf=b"",
            model_bytes=b"{}",
            variable_map_bytes=b"{}",
        )


def test_map_must_cover_universe_and_clause_counts(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    mapping = json.loads((root / "out/base+P.variable-map.json").read_bytes())
    mapping["variables"].pop("889")
    with pytest.raises(ACorePiqdAdapterError, match="variable map"):
        validate_static_package(
            manifest_bytes=(root / "out/manifest.json").read_bytes(),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=(root / "out/base+P.model.json").read_bytes(),
            variable_map_bytes=_canonical(mapping),
        )


@pytest.mark.parametrize(
    "mutate",
    [
        lambda m: m["variables"].update({"1": m["variables"]["2"]}),
        lambda m: m["variables"].update({"433": "b(a0,a1)"}),
        lambda m: m.update(clause_families={"invented": CANONICAL_NUM_CLAUSES}),
    ],
)
def test_map_is_source_canonical_and_family_contract_is_exact(
    tmp_path: Path, mutate
) -> None:
    root = _artifact(tmp_path)
    mapping = json.loads((root / "out/base+P.variable-map.json").read_bytes())
    mutate(mapping)
    with pytest.raises(ACorePiqdAdapterError):
        validate_static_package(
            manifest_bytes=(root / "out/manifest.json").read_bytes(),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=(root / "out/base+P.model.json").read_bytes(),
            variable_map_bytes=_canonical(mapping),
        )


def test_json_bounds_and_nonfinite_values_fail_closed(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    manifest = json.loads((root / "out/manifest.json").read_bytes())
    manifest[0]["n_variables"] = 10_001
    with pytest.raises(ACorePiqdAdapterError):
        validate_static_package(
            manifest_bytes=_canonical(manifest),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=(root / "out/base+P.model.json").read_bytes(),
            variable_map_bytes=(root / "out/base+P.variable-map.json").read_bytes(),
        )
    with pytest.raises(ACorePiqdAdapterError):
        validate_static_package(
            manifest_bytes=b'[{"run":NaN}]',
            cnf=b"",
            model_bytes=b"{}",
            variable_map_bytes=b"{}",
        )


def test_nonselected_manifest_artifact_path_is_also_safe(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    manifest = json.loads((root / "out/manifest.json").read_bytes())
    manifest.append(
        {
            "run": "diagnostic",
            "verdict": "UNKNOWN",
            "n_variables": 1,
            "n_clauses": 1,
            "wall_seconds": 0.0,
            "cnf_file": "../escape.cnf",
            "proof_verified": False,
            "model_file": None,
            "model_true_atoms": [],
        }
    )
    with pytest.raises(ACorePiqdAdapterError, match="artifact path"):
        validate_static_package(
            manifest_bytes=_canonical(manifest),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=(root / "out/base+P.model.json").read_bytes(),
            variable_map_bytes=(root / "out/base+P.variable-map.json").read_bytes(),
        )


def test_model_is_total_and_each_clause_is_rechecked(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    model = {atom: True for atom in canonical_variable_map()["variables"].values()}
    model[canonical_variable_map()["variables"]["1"]] = False
    with pytest.raises(ACorePiqdAdapterError, match="every CNF clause"):
        validate_static_package(
            manifest_bytes=(root / "out/manifest.json").read_bytes(),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=_canonical(model),
            variable_map_bytes=(root / "out/base+P.variable-map.json").read_bytes(),
        )
    model.pop("aux_889")
    with pytest.raises(ACorePiqdAdapterError, match="total"):
        validate_static_package(
            manifest_bytes=(root / "out/manifest.json").read_bytes(),
            cnf=(root / "out/base+P.cnf").read_bytes(),
            model_bytes=_canonical(model),
            variable_map_bytes=(root / "out/base+P.variable-map.json").read_bytes(),
        )


def test_symlinked_source_and_map_are_rejected(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    (root / "encoding.py").unlink()
    (root / "encoding.py").symlink_to(root / "run.py")
    with pytest.raises(ACorePiqdAdapterError):
        load_package(root, variable_map_path=Path("out/base+P.variable-map.json"))


def test_traversal_and_excessive_json_depth_fail_closed(tmp_path: Path) -> None:
    root = _artifact(tmp_path)
    with pytest.raises(ACorePiqdAdapterError, match="safe relative"):
        load_package(
            root, variable_map_path=Path("out/../out/base+P.variable-map.json")
        )
    with pytest.raises(ACorePiqdAdapterError):
        validate_static_package(
            manifest_bytes=b"[" * 10000 + b"]" * 10000,
            cnf=b"",
            model_bytes=b"{}",
            variable_map_bytes=b"{}",
        )
    root = _artifact(tmp_path / "second")
    (root / "out/base+P.variable-map.json").unlink()
    (root / "out/base+P.variable-map.json").symlink_to(root / "out/base+P.model.json")
    with pytest.raises(ACorePiqdAdapterError):
        load_package(root, variable_map_path=Path("out/base+P.variable-map.json"))


class _FakeClient:
    def __init__(self, result: str | None = "SAT") -> None:
        self.result = result
        self.prepare_calls = self.confirm_calls = self.status_calls = (
            self.model_calls
        ) = 0
        self.job: PreparedJob | None = None

    def prepare_cnf(self, **kwargs):
        self.prepare_calls += 1
        identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=hashlib.sha256(kwargs["cnf"]).hexdigest(),
            producer_manifest_sha256=hashlib.sha256(
                kwargs["producer_manifest"]
            ).hexdigest(),
            requested_core_limit=1,
        )
        self.job = PreparedJob(
            "job-1",
            "cadical",
            "sat",
            hashlib.sha256(kwargs["cnf"]).hexdigest(),
            identity,
            CANONICAL_NUM_VARIABLES,
            CANONICAL_NUM_CLAUSES,
            False,
            1,
        )
        return self.job

    def confirm(self, job, *, expected_cnf):
        self.confirm_calls += 1
        return "confirmed"

    def status(self, job_id):
        self.status_calls += 1
        return {"id": job_id, "status": "completed", "result": self.result}

    def checked_model(self, job, *, cnf):
        self.model_calls += 1
        return CheckedModel(
            tuple(range(1, CANONICAL_NUM_VARIABLES + 1)), "a" * 64, b"model"
        )


class _409Client(_FakeClient):
    """Models PiqdRawDimacsClient.confirm's 409-internal status read."""

    def confirm(self, job, *, expected_cnf):
        self.confirm_calls += 1
        return self.status(job.job_id)


class _201Client(_FakeClient):
    """Models a 201 confirmation with one subsequent status read."""

    def confirm(self, job, *, expected_cnf):
        self.confirm_calls += 1
        return "confirmed"


class _DurableClient(_FakeClient):
    """Fake PIQD lifecycle with a canonical total source-package model."""

    _assignment_bits = bytes.fromhex(
        "0000000438000048929448008f1f004a0180d87d80b9c78000000800028000200028000800803f0008000280002000e8fffbffff1f000000002276b7eefe23aa2ef2ff415500aa0000000400001000004000000001000004000010000040000000e38f82b08f7f405e80fcff6768a001"
    )

    def checked_model(self, job, *, cnf):
        assignment = [
            number
            if self._assignment_bits[(number - 1) // 8] & (1 << ((number - 1) % 8))
            else -number
            for number in range(1, CANONICAL_NUM_VARIABLES + 1)
        ]
        body = json.dumps(
            {
                "assignment": assignment,
                "job_id": job.job_id,
                "num_assigned": len(assignment),
                "result": "SAT",
            },
            sort_keys=True,
            separators=(",", ":"),
        ).encode()
        return CheckedModel(tuple(assignment), hashlib.sha256(body).hexdigest(), body)

    def log(self, job):
        body = b"fake durable solver log"
        return body, hashlib.sha256(body).hexdigest()


class _LiveOrderDurableClient(_DurableClient):
    """Emit the compact, non-sorted top-level order used by PIQD's model route."""

    def checked_model(self, job, *, cnf):
        checked = super().checked_model(job, cnf=cnf)
        body = json.dumps(
            {
                "job_id": job.job_id,
                "result": "SAT",
                "num_assigned": len(checked.assignment),
                "assignment": list(checked.assignment),
            },
            sort_keys=False,
            separators=(",", ":"),
        ).encode()
        return CheckedModel(checked.assignment, hashlib.sha256(body).hexdigest(), body)


class _DuplicateKeyDurableClient(_DurableClient):
    """Return a content-addressed model body that strict JSON must reject."""

    def checked_model(self, job, *, cnf):
        checked = super().checked_model(job, cnf=cnf)
        body = (
            b'{"job_id":"'
            + job.job_id.encode()
            + b'","job_id":"'
            + job.job_id.encode()
            + b'","result":"SAT","num_assigned":889,"assignment":'
            + json.dumps(list(checked.assignment), separators=(",", ":")).encode()
            + b"}"
        )
        return CheckedModel(checked.assignment, hashlib.sha256(body).hexdigest(), body)


def test_runner_has_one_prepare_confirm_status_and_honest_outcomes(
    tmp_path: Path,
) -> None:
    package = load_package(
        _artifact(tmp_path), variable_map_path=Path("out/base+P.variable-map.json")
    )
    packet = packet_from_package(package, timeout_seconds=1)
    client = _FakeClient("SAT")
    assert run_packet(packet, client=client)["status"] == "SAT"
    assert (
        client.prepare_calls,
        client.confirm_calls,
        client.status_calls,
        client.model_calls,
    ) == (1, 1, 1, 1)
    assert run_packet(packet, client=_FakeClient(None))["status"] == "UNKNOWN"
    assert (
        run_packet(packet, client=_FakeClient("UNSAT"))["promotion"]
        == "DISCOVERY_ONLY_NO_CERT-001"
    )


def test_runner_consumes_409_terminal_confirmation_without_second_status(
    tmp_path: Path,
) -> None:
    package = load_package(
        _artifact(tmp_path), variable_map_path=Path("out/base+P.variable-map.json")
    )
    client = _409Client("SAT")
    result = run_packet(packet_from_package(package, timeout_seconds=1), client=client)
    assert result["status"] == "SAT"
    assert (client.confirm_calls, client.status_calls) == (1, 1)


def test_runner_consumes_201_confirmation_then_one_status(tmp_path: Path) -> None:
    package = load_package(
        _artifact(tmp_path), variable_map_path=Path("out/base+P.variable-map.json")
    )
    client = _201Client("SAT")
    result = run_packet(packet_from_package(package, timeout_seconds=1), client=client)
    assert result["status"] == "SAT"
    assert (client.confirm_calls, client.status_calls) == (1, 1)


def test_durable_runner_seals_raw_model_and_is_restart_safe(tmp_path: Path) -> None:
    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    client = _DurableClient("SAT")
    first = run_durable_packet(packet, output_root=output, client=client, max_polls=1)
    assert first["status"] == "SAT"
    assert first["num_variables"] == CANONICAL_NUM_VARIABLES
    assert first["num_clauses"] == CANONICAL_NUM_CLAUSES
    assert first["claims"] == {
        "finite_canary": True,
        "universal": False,
        "theorem_closure": False,
    }
    calls = client.prepare_calls, client.confirm_calls, client.status_calls
    replayed = replay_durable_output(output, packet)
    assert replayed == first
    assert (client.prepare_calls, client.confirm_calls, client.status_calls) == calls
    assert (
        run_durable_packet(packet, output_root=output, client=object(), max_polls=1)
        == first
    )


def test_durable_replay_accepts_and_preserves_live_order_raw_model(
    tmp_path: Path,
) -> None:
    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    client = _LiveOrderDurableClient("SAT")
    result = run_durable_packet(packet, output_root=output, client=client, max_polls=1)
    model_path = output / "attempt.jsonl.artifacts" / result["model_sha256"]
    model_bytes = model_path.read_bytes()
    assert model_bytes.startswith(b'{"job_id":')
    assert model_bytes != _canonical(json.loads(model_bytes))
    assert result["model_sha256"] == hashlib.sha256(model_bytes).hexdigest()
    assert replay_durable_output(output, packet) == result


def test_durable_replay_still_rejects_duplicate_model_keys(tmp_path: Path) -> None:
    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    with pytest.raises(ACorePiqdAdapterError, match="strict JSON"):
        run_durable_packet(
            packet,
            output_root=output,
            client=_DuplicateKeyDurableClient("SAT"),
            max_polls=1,
        )


def test_prepared_existing_must_be_an_exact_boolean(tmp_path: Path) -> None:
    class NonBooleanExistingClient(_DurableClient):
        def prepare_cnf(self, **kwargs):
            job = super().prepare_cnf(**kwargs)
            return PreparedJob(
                job.job_id,
                job.backend,
                job.solver_profile,
                job.cnf_blob_hash,
                job.identity_hash,
                job.num_vars,
                job.num_clauses,
                0,
                job.requested_core_limit,
            )

    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    with pytest.raises(ACorePiqdAdapterError, match="existing flag"):
        run_durable_packet(
            packet,
            output_root=output,
            client=NonBooleanExistingClient("SAT"),
            max_polls=1,
        )


def test_no_argument_replay_rebuilds_authenticated_retry_packet(
    tmp_path: Path,
) -> None:
    retry = {
        "generation": 1,
        "prior_job_id": "c7d55a56-4529-4cbd-83a9-991127924daf",
        "daemon_build_sha256": "6" * 64,
    }
    packet = packet_from_source_package(
        build_source_package(retry=retry), timeout_seconds=1
    )
    output = tmp_path / "durable"
    output.mkdir()
    result = run_durable_packet(
        packet,
        output_root=output,
        client=_LiveOrderDurableClient("SAT"),
        max_polls=1,
    )
    assert replay_durable_output(output) == result


def test_no_argument_retry_replay_rejects_archived_producer_tamper(
    tmp_path: Path,
) -> None:
    retry = {
        "generation": 1,
        "prior_job_id": "c7d55a56-4529-4cbd-83a9-991127924daf",
        "daemon_build_sha256": "6" * 64,
    }
    packet = packet_from_source_package(
        build_source_package(retry=retry), timeout_seconds=1
    )
    output = tmp_path / "durable"
    output.mkdir()
    result = run_durable_packet(
        packet,
        output_root=output,
        client=_LiveOrderDurableClient("SAT"),
        max_polls=1,
    )
    producer_path = (
        output / "attempt.jsonl.artifacts" / result["producer_manifest_sha256"]
    )
    producer_path.write_bytes(producer_path.read_bytes() + b" ")
    with pytest.raises(ACorePiqdAdapterError, match="producer manifest hash"):
        replay_durable_output(output)


@pytest.mark.parametrize(
    ("solver_result", "expected_status"),
    [("UNKNOWN", "UNKNOWN"), ("UNSAT", "UNSAT")],
)
def test_durable_runner_keeps_non_sat_results_honest(
    tmp_path: Path, solver_result: str, expected_status: str
) -> None:
    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    result = run_durable_packet(
        packet,
        output_root=output,
        client=_DurableClient(solver_result),
        max_polls=1,
    )
    assert result["status"] == expected_status
    assert result["claims"] == {
        "finite_canary": False,
        "universal": False,
        "theorem_closure": False,
    }
    assert replay_durable_output(output, packet) == result


def test_durable_replay_rejects_tampered_or_undeclared_artifacts(
    tmp_path: Path,
) -> None:
    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    receipt = run_durable_packet(
        packet, output_root=output, client=_DurableClient("SAT"), max_polls=1
    )
    model_path = output / "attempt.jsonl.artifacts" / receipt["model_sha256"]
    model_path.write_bytes(model_path.read_bytes() + b" ")
    with pytest.raises(ACorePiqdAdapterError, match="hash mismatch"):
        replay_durable_output(output, packet)
    model_path.write_bytes(model_path.read_bytes()[:-1])
    (output / "unexpected").write_bytes(b"x")
    with pytest.raises(ACorePiqdAdapterError, match="undeclared"):
        replay_durable_output(output, packet)


def test_durable_replay_rejects_symlinked_receipt_and_lock(tmp_path: Path) -> None:
    packet = packet_from_source_package(timeout_seconds=1)
    output = tmp_path / "durable"
    output.mkdir()
    run_durable_packet(
        packet, output_root=output, client=_DurableClient("SAT"), max_polls=1
    )
    receipt = output / "receipt.json"
    saved_receipt = receipt.read_bytes()
    receipt.unlink()
    receipt.symlink_to(output / "attempt.jsonl")
    with pytest.raises(ACorePiqdAdapterError, match="cannot safely capture"):
        replay_durable_output(output, packet)
    receipt.unlink()
    receipt.write_bytes(saved_receipt)
    lock = output / "attempt.jsonl.lock"
    lock.unlink()
    lock.symlink_to(output / "receipt.json")
    with pytest.raises(ACorePiqdAdapterError, match="cannot safely capture"):
        replay_durable_output(output, packet)


def test_identity_mismatch_is_not_retried(tmp_path: Path) -> None:
    package = load_package(
        _artifact(tmp_path), variable_map_path=Path("out/base+P.variable-map.json")
    )

    class Bad(_FakeClient):
        def prepare_cnf(self, **kwargs):
            job = super().prepare_cnf(**kwargs)
            return PreparedJob(
                job.job_id,
                job.backend,
                job.solver_profile,
                job.cnf_blob_hash,
                "0" * 64,
                job.num_vars,
                job.num_clauses,
                job.existing,
                1,
            )

    with pytest.raises(ACorePiqdAdapterError, match="identity"):
        run_packet(packet_from_package(package, timeout_seconds=1), client=Bad())


def test_receipt_is_create_once_and_self_hashed(tmp_path: Path) -> None:
    path = tmp_path / "receipts" / "receipt.json"
    path.parent.mkdir()
    receipt = write_receipt(path, {"status": "SAT", "universal": False})
    assert (
        receipt["receipt_sha256"]
        == hashlib.sha256(
            json.dumps(
                {k: v for k, v in receipt.items() if k != "receipt_sha256"},
                sort_keys=True,
                separators=(",", ":"),
            ).encode()
        ).hexdigest()
    )
    with pytest.raises(ACorePiqdAdapterError, match="create-once"):
        write_receipt(path, {"status": "SAT"})
