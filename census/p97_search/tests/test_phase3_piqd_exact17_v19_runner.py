from __future__ import annotations

import hashlib
import json
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_runner as generic_runner
from census.p97_search import phase3_piqd_exact17_semantic as semantic
from census.p97_search import phase3_piqd_exact17_v19_package as package_module
from census.p97_search import phase3_piqd_exact17_v19_runner as runner
from census.p97_search.phase3_piqd_exact17_package import _emit
from census.p97_search.phase3_piqd_exact17_runner import (
    ATTESTATION_BASIS,
    Exact17RunnerError,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PreparedJob,
    raw_dimacs_identity,
)


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _production_assignment(variable_map: dict[str, Any]) -> tuple[int, ...]:
    supports = {
        center: {(center + offset) % 17 for offset in (1, 2, 4, 8)}
        for center in range(17)
    }
    supports.update(
        {
            0: {11, 1, 2, 15},
            3: {0, 1, 2, 4},
            8: {6, 9, 1, 3},
            9: {6, 7, 4, 5},
            10: {8, 9, 13, 14},
            11: {8, 10, 15, 16},
        }
    )
    count = variable_map["coverage"]["variable_count"]
    truth = {variable: False for variable in range(1, count + 1)}
    allocations = variable_map["allocations"]
    for record in allocations["selected_incidence"]:
        truth[record["variable"]] = record["point"] in supports[record["center"]]
    for record in allocations["fifth_choice"]:
        truth[record["variable"]] = record["point"] == 0
    for record in allocations["comparison_xor_helpers"]:
        result = record["formula"]["result"]
        left, right = record["formula"]["inputs"]
        truth[result] = truth[left] != truth[right]
    return tuple(
        variable if truth[variable] else -variable for variable in range(1, count + 1)
    )


class FakeDaemon:
    def __init__(
        self, *, cnf: bytes, assignment: tuple[int, ...], existing: bool = True
    ) -> None:
        self.cnf = cnf
        self.assignment = assignment
        self.existing = existing
        self.prepare_count = 0
        self.confirm_count = 0
        self.model_body = semantic.canonical_json(
            {
                "job_id": "job-v19",
                "result": "SAT",
                "num_assigned": len(assignment),
                "assignment": assignment,
            }
        )
        self.log_body = b"s SATISFIABLE\nc exact17-v19 fake transport\n"

    def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
        self.prepare_count += 1
        assert type(kwargs["requested_core_limit"]) is int
        assert kwargs["requested_core_limit"] == 1
        cnf_hash = _sha(self.cnf)
        return PreparedJob(
            job_id="job-v19",
            backend="cadical",
            solver_profile="sat",
            cnf_blob_hash=cnf_hash,
            identity_hash=raw_dimacs_identity(
                backend="cadical",
                solver_profile="sat",
                cnf_sha256=cnf_hash,
                producer_manifest_sha256=_sha(kwargs["producer_manifest"]),
                requested_core_limit=1,
            ),
            num_vars=kwargs["wave_manifest"]["encoding"]["num_variables"],
            num_clauses=kwargs["wave_manifest"]["encoding"]["num_clauses"],
            existing=self.existing,
            requested_core_limit=1,
        )

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self.confirm_count += 1
        assert job.job_id == "job-v19"
        assert expected_cnf == self.cnf
        assert _sha(expected_cnf) == package_module.PINNED_CNF_SHA256
        return "confirmed"

    def status(self, job_id: str) -> dict[str, Any]:
        return {
            "id": job_id,
            "status": "completed",
            "result": "SAT",
            "requested_core_limit": 1,
            "attested_solver_processes": 1,
            "attestation_basis": ATTESTATION_BASIS,
        }

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        assert cnf == self.cnf
        return CheckedModel(self.assignment, _sha(self.model_body), self.model_body)

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        return self.log_body, _sha(self.log_body)

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        raise AssertionError("SAT must not request a proof")


@pytest.fixture(scope="module")
def live_package(tmp_path_factory: pytest.TempPathFactory) -> tuple[Path, Any]:
    repo_root = Path(__file__).resolve().parents[3]
    files, bundle = package_module.build_package(repo_root=repo_root)
    package_dir = tmp_path_factory.mktemp("v19-package")
    _emit(package_dir, files)
    loaded = runner.load_package(package_dir)
    assert loaded.source_bundle == bundle
    return package_dir, loaded


def _install_fast_semantics(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        generic_runner,
        "scan_dimacs",
        lambda _cnf, assignment=None: (
            package_module.PINNED_VARIABLES,
            package_module.PINNED_CLAUSES,
        ),
    )

    def replay(**kwargs: Any) -> dict[str, Any]:
        semantic.parse_total_dimacs_assignment(
            kwargs["model"], package_module.PINNED_VARIABLES
        )
        return {
            "decoded": {"finite_exact17": True},
            "semantic_evidence": {
                "schema": semantic.SEMANTIC_EVIDENCE_SCHEMA,
                "evidence": {"source_predicates_replayed": True},
                "claims": semantic.false_claims(),
            },
        }

    def issue(**kwargs: Any) -> bytes:
        replay(**kwargs)
        return semantic.canonical_json(
            {
                "schema": semantic.SEMANTIC_RECEIPT_SCHEMA,
                "evidence": {"source_predicates_replayed": True},
                "claims": semantic.false_claims(),
            }
        )

    def validate(raw: bytes, **kwargs: Any) -> dict[str, Any]:
        assert raw == issue(**kwargs)
        return semantic.load_strict_json(raw)

    monkeypatch.setattr(runner.semantic, "replay_source_semantics", replay)
    monkeypatch.setattr(runner.semantic, "issue_semantic_receipt", issue)
    monkeypatch.setattr(runner.semantic, "validate_semantic_receipt", validate)


def test_existing_dedupe_runs_once_and_persists_exact_evidence(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    live_package: tuple[Path, Any],
) -> None:
    _install_fast_semantics(monkeypatch)
    package_dir, loaded = live_package
    variable_map = semantic.load_strict_json(loaded.files["variable-map.json"])
    assignment = _production_assignment(variable_map)
    daemon = FakeDaemon(cnf=loaded.cnf, assignment=assignment, existing=True)
    daemon.model_body = json.dumps(
        {
            "job_id": "job-v19",
            "result": "SAT",
            "num_assigned": len(assignment),
            "assignment": assignment,
        },
        separators=(",", ":"),
    ).encode()
    raw_model_payload = semantic.load_strict_json(
        daemon.model_body,
        require_canonical=False,
    )
    canonical_model = semantic.canonical_json(raw_model_payload)
    assert daemon.model_body != canonical_model
    assert len(assignment) == package_module.PINNED_VARIABLES
    output = tmp_path / "run"
    run = runner.run_exact17_v19(
        package_dir,
        client=daemon,
        output_dir=output,
        max_polls=1,
        poll_interval_s=0,
    )
    assert daemon.prepare_count == 1
    assert daemon.confirm_count == 1
    assert run.driver_result.outcome == "STRUCTURAL_SAT"
    assert run.result["piqd_existing_dedupe"] is True
    assert (output / "model-response.json").read_bytes() == canonical_model
    assert (output / "solver.log").read_bytes() == daemon.log_body
    assert (
        output / f"journal-artifact-{_sha(daemon.model_body)}"
    ).read_bytes() == daemon.model_body
    assert all(
        run.result["claims"][field] is False
        for field in (
            "aggregate_order_case_coverage",
            "universal_lift",
            "theorem_closure",
            "lean_checked",
        )
    )

    result_path = output / "run-result.json"
    original_result_raw = result_path.read_bytes()

    model_path = output / "model-response.json"
    original_model = model_path.read_bytes()
    model_path.unlink()
    with pytest.raises(runner.Exact17V19RunnerError, match="file set changed"):
        runner.validate_run_output(output, package=loaded)
    model_path.write_bytes(original_model)

    log_path = output / "solver.log"
    original_log = log_path.read_bytes()
    log_path.write_bytes(original_log + b"tampered")
    with pytest.raises(runner.Exact17V19RunnerError, match="solver.log"):
        runner.validate_run_output(output, package=loaded)
    log_path.write_bytes(original_log)

    def mutate_result(change: Any) -> None:
        payload = semantic.load_strict_json(original_result_raw)
        change(payload)
        result_path.write_bytes(semantic.canonical_json(payload))

    raw_archive_path = output / f"journal-artifact-{_sha(daemon.model_body)}"
    raw_archive_path.write_bytes(daemon.model_body + b" ")
    with pytest.raises(runner.Exact17V19RunnerError, match="artifact changed"):
        runner.validate_run_output(output, package=loaded)
    raw_archive_path.write_bytes(daemon.model_body)

    model_path.write_bytes(daemon.model_body)
    mutate_result(
        lambda payload: payload["artifacts"].update(
            {"model-response.json": _sha(daemon.model_body)}
        )
    )
    with pytest.raises(semantic.SemanticCustodyError, match="canonical"):
        runner.validate_run_output(output, package=loaded)

    changed_model_payload = dict(raw_model_payload)
    changed_assignment = list(changed_model_payload["assignment"])
    changed_assignment[0] = -changed_assignment[0]
    changed_model_payload["assignment"] = changed_assignment
    changed_model = semantic.canonical_json(changed_model_payload)
    model_path.write_bytes(changed_model)
    mutate_result(
        lambda payload: payload["artifacts"].update(
            {"model-response.json": _sha(changed_model)}
        )
    )
    with pytest.raises(
        runner.Exact17V19RunnerError,
        match="differs from authenticated raw model",
    ):
        runner.validate_run_output(output, package=loaded)
    model_path.write_bytes(original_model)
    result_path.write_bytes(original_result_raw)

    mutate_result(lambda payload: payload["job_identity"].update({"extra": 0}))
    with pytest.raises(runner.Exact17V19RunnerError, match="identity keys"):
        runner.validate_run_output(output, package=loaded)
    mutate_result(
        lambda payload: payload["job_identity"].update({"requested_core_limit": True})
    )
    with pytest.raises(runner.Exact17V19RunnerError, match="core limit"):
        runner.validate_run_output(output, package=loaded)
    mutate_result(lambda payload: payload.update({"piqd_existing_dedupe": False}))
    with pytest.raises(runner.Exact17V19RunnerError, match="dedupe flag differs"):
        runner.validate_run_output(output, package=loaded)

    junk = output / "junk.bin"
    junk.write_bytes(b"junk")
    mutate_result(
        lambda payload: payload["artifacts"].update({"junk.bin": _sha(b"junk")})
    )
    with pytest.raises(runner.Exact17V19RunnerError, match="fixed allowlist"):
        runner.validate_run_output(output, package=loaded)
    junk.unlink()

    archive_name = f"journal-artifact-{_sha(b'extra archive')}"
    archive = output / archive_name
    archive.write_bytes(b"extra archive")
    mutate_result(
        lambda payload: payload["artifacts"].update(
            {archive_name: _sha(b"extra archive")}
        )
    )
    with pytest.raises(
        runner.Exact17V19RunnerError,
        match="authenticated journal",
    ):
        runner.validate_run_output(output, package=loaded)
    archive.unlink()
    result_path.write_bytes(original_result_raw)

    receipt_path = output / "semantic-receipt.json"
    receipt_path.write_bytes(b'{"claims":{}}')
    result = semantic.load_strict_json(result_path.read_bytes())
    result["artifacts"]["semantic-receipt.json"] = _sha(receipt_path.read_bytes())
    result_path.write_bytes(semantic.canonical_json(result))
    with pytest.raises(AssertionError):
        runner.validate_run_output(output, package=loaded)


@pytest.mark.parametrize(
    "raw, message, require_canonical",
    [
        (
            semantic.canonical_json(
                {"job_id": "job", "result": "SAT", "assignment": []}
            ),
            "keys changed",
            False,
        ),
        (
            semantic.canonical_json(
                {
                    "job_id": "job",
                    "result": "SAT",
                    "num_assigned": 1,
                    "assignment": [1],
                }
            ),
            "incomplete",
            False,
        ),
        (
            b'{"job_id":"job","job_id":"job","result":"SAT","num_assigned":74813,"assignment":[]}',
            "duplicate",
            False,
        ),
        (
            b'{ "assignment":[],"job_id":"job","num_assigned":0,"result":"SAT"}',
            "canonical",
            True,
        ),
    ],
)
def test_model_response_is_strict_and_complete(
    raw: bytes,
    message: str,
    require_canonical: bool,
) -> None:
    with pytest.raises(Exception, match=message):
        runner._strict_model(
            raw,
            job_id="job",
            require_canonical=require_canonical,
        )


def test_cli_gate_diagnostic_is_scoped(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    def reject(*_args: Any, **_kwargs: Any) -> None:
        raise runner.Exact17V19RunnerError(
            "model publication gate rejected: " + "untrusted" * 1_000
        )

    monkeypatch.setattr(runner, "run_exact17_v19", reject)
    assert runner.main([str(tmp_path / "package"), str(tmp_path / "output")]) == 2
    diagnostic = capsys.readouterr().out
    assert "model publication gate rejected" in diagnostic
    assert len(diagnostic) < 300


def test_missing_and_wrong_archived_hashes_fail_closed(tmp_path: Path) -> None:
    artifact_dir = tmp_path / f"{runner.GENERIC_JOURNAL}.artifacts"
    artifact_dir.mkdir()
    digest = _sha(b"expected")
    with pytest.raises(Exact17RunnerError):
        runner._artifact_bytes(tmp_path, digest, maximum_bytes=100)
    (artifact_dir / digest).write_bytes(b"wrong")
    with pytest.raises(runner.Exact17V19RunnerError, match="hash mismatch"):
        runner._artifact_bytes(tmp_path, digest, maximum_bytes=100)


def _minimal_generic_tree(stage: Path) -> None:
    stage.mkdir()
    (stage / runner.GENERIC_JOURNAL).write_bytes(b"x")
    (stage / f"{runner.GENERIC_JOURNAL}.seal.json").write_bytes(b"x")
    (stage / runner.GENERIC_RECEIPT).write_bytes(b"x")
    (stage / runner.GENERIC_LOCK).write_bytes(b"")
    (stage / runner.GENERIC_ARTIFACT_DIRECTORY).mkdir()


def test_generic_snapshot_is_bounded_and_rejects_symlinks(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    stage = tmp_path / "stage"
    _minimal_generic_tree(stage)
    target = tmp_path / "target"
    target.write_bytes(b"x")
    (stage / runner.GENERIC_JOURNAL).unlink()
    (stage / runner.GENERIC_JOURNAL).symlink_to(target)
    with pytest.raises(Exception, match="safely open|regular file"):
        runner._capture_generic_tree(stage)

    (stage / runner.GENERIC_JOURNAL).unlink()
    (stage / runner.GENERIC_JOURNAL).write_bytes(b"x")
    monkeypatch.setattr(runner, "MAX_RECEIPT_BYTES", 1)
    (stage / runner.GENERIC_RECEIPT).write_bytes(b"xx")
    with pytest.raises(Exception, match="forbidden size|exceeds"):
        runner._capture_generic_tree(stage)

    monkeypatch.setattr(runner, "MAX_RECEIPT_BYTES", 1024)
    (stage / runner.GENERIC_RECEIPT).write_bytes(b"x")
    archive = stage / runner.GENERIC_ARTIFACT_DIRECTORY
    archive.rmdir()
    outside = tmp_path / "outside-archive"
    outside.mkdir()
    archive.symlink_to(outside, target_is_directory=True)
    with pytest.raises(runner.Exact17V19RunnerError, match="child directory"):
        runner._capture_generic_tree(stage)


def test_generic_snapshot_detects_cross_file_toctou(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    stage = tmp_path / "stage"
    _minimal_generic_tree(stage)
    original_capture = runner._capture_file

    def mutating_capture(
        directory_fd: int,
        name: str,
        *,
        maximum_bytes: int | None = None,
    ) -> bytes:
        if name == f"{runner.GENERIC_JOURNAL}.seal.json":
            (stage / runner.GENERIC_JOURNAL).write_bytes(b"changed")
        return original_capture(
            directory_fd,
            name,
            maximum_bytes=maximum_bytes,
        )

    monkeypatch.setattr(runner, "_capture_file", mutating_capture)
    with pytest.raises(runner.Exact17V19RunnerError, match="changed after capture"):
        runner._capture_generic_tree(stage)


def test_partial_or_invalid_install_is_removed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "partial"

    def partial_emit(target: Path, _files: Any) -> None:
        (target / "artifact").write_bytes(b"x")
        raise OSError("injected partial write")

    monkeypatch.setattr(runner, "_emit", partial_emit)
    with pytest.raises(runner.Exact17V19RunnerError, match="installation failed"):
        runner._install_run_output(
            output,
            {"artifact": b"x"},
            package=SimpleNamespace(),
        )
    assert not output.exists()

    output = tmp_path / "invalid"
    monkeypatch.setattr(
        runner,
        "_emit",
        lambda target, files: (target / next(iter(files))).write_bytes(b"x"),
    )
    monkeypatch.setattr(
        runner,
        "validate_run_output",
        lambda *_args, **_kwargs: (_ for _ in ()).throw(
            runner.Exact17V19RunnerError("injected validation failure")
        ),
    )
    with pytest.raises(runner.Exact17V19RunnerError, match="validation failure"):
        runner._install_run_output(
            output,
            {"artifact": b"x"},
            package=SimpleNamespace(),
        )
    assert not output.exists()


def test_install_preserves_preexisting_or_hostile_targets(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "preexisting"
    output.mkdir()
    marker = output / "marker"
    marker.write_bytes(b"preserve")
    with pytest.raises(runner.Exact17V19RunnerError, match="already exists"):
        runner._install_run_output(
            output,
            {"artifact": b"x"},
            package=SimpleNamespace(),
        )
    assert marker.read_bytes() == b"preserve"

    symlink_target = tmp_path / "symlink-target"
    symlink_target.mkdir()
    symlink_marker = symlink_target / "marker"
    symlink_marker.write_bytes(b"preserve")
    symlink_output = tmp_path / "symlink-output"
    symlink_output.symlink_to(symlink_target, target_is_directory=True)
    with pytest.raises(runner.Exact17V19RunnerError, match="already exists"):
        runner._install_run_output(
            symlink_output,
            {"artifact": b"x"},
            package=SimpleNamespace(),
        )
    assert symlink_marker.read_bytes() == b"preserve"

    hostile = tmp_path / "hostile"

    def hostile_emit(target: Path, _files: Any) -> None:
        (target / "foreign").write_bytes(b"do not remove")
        raise OSError("injected hostile change")

    monkeypatch.setattr(runner, "_emit", hostile_emit)
    with pytest.raises(runner.Exact17V19RunnerError, match="cleanup refused"):
        runner._install_run_output(
            hostile,
            {"artifact": b"x"},
            package=SimpleNamespace(),
        )
    assert (hostile / "foreign").read_bytes() == b"do not remove"


def test_nonstructural_terminal_never_installs_output(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    live_package: tuple[Path, Any],
) -> None:
    package_dir, _ = live_package
    monkeypatch.setattr(
        runner,
        "_run_packet_capability",
        lambda *_args, **_kwargs: SimpleNamespace(
            driver_result=SimpleNamespace(outcome="DISCOVERY_UNSAT")
        ),
    )
    output = tmp_path / "not-installed"
    with pytest.raises(runner.Exact17V19RunnerError, match="structural SAT"):
        runner.run_exact17_v19(package_dir, client=object(), output_dir=output)
    assert not output.exists()


def test_output_collision_and_package_symlink_fail_before_prepare(
    tmp_path: Path, live_package: tuple[Path, Any]
) -> None:
    package_dir, loaded = live_package
    output = tmp_path / "collision"
    output.mkdir()
    daemon = FakeDaemon(cnf=loaded.cnf, assignment=(), existing=False)
    with pytest.raises(runner.Exact17V19RunnerError, match="already exists"):
        runner.run_exact17_v19(package_dir, client=daemon, output_dir=output)
    assert daemon.prepare_count == 0

    link = tmp_path / "package-link"
    link.symlink_to(package_dir, target_is_directory=True)
    with pytest.raises(Exception, match="symlink|unsafe|open"):
        runner.load_package(link)

    real_parent = tmp_path / "real-parent"
    real_parent.mkdir()
    sentinel = real_parent / "sentinel"
    sentinel.write_bytes(b"unchanged")
    linked_parent = tmp_path / "linked-parent"
    linked_parent.symlink_to(real_parent, target_is_directory=True)
    daemon = FakeDaemon(cnf=loaded.cnf, assignment=(), existing=False)
    with pytest.raises(Exception, match="symlink|unsafe|missing"):
        runner.run_exact17_v19(
            package_dir,
            client=daemon,
            output_dir=linked_parent / "missing" / "run",
        )
    assert daemon.prepare_count == 0
    assert sorted(path.name for path in real_parent.iterdir()) == ["sentinel"]
    assert sentinel.read_bytes() == b"unchanged"


def test_parent_replacement_at_staging_seam_cannot_redirect_writes(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    live_package: tuple[Path, Any],
) -> None:
    package_dir, loaded = live_package
    parent = tmp_path / "authenticated-parent"
    parent.mkdir()
    moved_parent = tmp_path / "moved-authenticated-parent"
    redirect_target = tmp_path / "redirect-target"
    redirect_target.mkdir()
    sentinel = redirect_target / "sentinel"
    sentinel.write_bytes(b"unchanged")

    original_reserve = runner._reserve_staging_directory

    def replace_parent(parent_fd: int) -> tuple[str, tuple[int, int, int]]:
        parent.rename(moved_parent)
        parent.symlink_to(redirect_target, target_is_directory=True)
        return original_reserve(parent_fd)

    monkeypatch.setattr(runner, "_reserve_staging_directory", replace_parent)
    daemon = FakeDaemon(cnf=loaded.cnf, assignment=(), existing=False)
    with pytest.raises(runner.Exact17V19RunnerError, match="pathname changed"):
        runner.run_exact17_v19(
            package_dir,
            client=daemon,
            output_dir=parent / "run",
        )

    assert daemon.prepare_count == 0
    assert sorted(path.name for path in redirect_target.iterdir()) == ["sentinel"]
    assert sentinel.read_bytes() == b"unchanged"
    assert not any(
        path.name.startswith(".exact17-v19-stage-") for path in moved_parent.iterdir()
    )


def test_parent_replacement_during_run_packet_cannot_redirect_generic_writes(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    live_package: tuple[Path, Any],
) -> None:
    _install_fast_semantics(monkeypatch)
    package_dir, loaded = live_package
    variable_map = semantic.load_strict_json(loaded.files["variable-map.json"])
    assignment = _production_assignment(variable_map)
    parent = tmp_path / "authenticated-parent"
    parent.mkdir()
    moved_parent = tmp_path / "moved-authenticated-parent"
    redirect_target = tmp_path / "redirect-target"
    redirect_target.mkdir()
    sentinel = redirect_target / "sentinel"
    sentinel.write_bytes(b"unchanged")
    daemon = FakeDaemon(cnf=loaded.cnf, assignment=assignment, existing=False)
    original_run_packet = runner._run_packet_capability

    def replace_at_entry(*args: Any, **kwargs: Any) -> Any:
        parent.rename(moved_parent)
        parent.symlink_to(redirect_target, target_is_directory=True)
        return original_run_packet(*args, **kwargs)

    monkeypatch.setattr(runner, "_run_packet_capability", replace_at_entry)
    with pytest.raises(runner.Exact17V19RunnerError, match="pathname changed"):
        runner.run_exact17_v19(
            package_dir,
            client=daemon,
            output_dir=parent / "run",
            max_polls=1,
            poll_interval_s=0,
        )

    assert daemon.prepare_count == 1
    assert sorted(path.name for path in redirect_target.iterdir()) == ["sentinel"]
    assert sentinel.read_bytes() == b"unchanged"
    assert not (redirect_target / "run").exists()
    assert not any(
        path.name.startswith(".exact17-v19-stage-") for path in moved_parent.iterdir()
    )


def test_source_predicate_failure_remains_finite_diagnostic(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def reject(**_kwargs: Any) -> dict[str, Any]:
        raise semantic.SemanticCustodyError("source replay: predicate failed")

    monkeypatch.setattr(runner.semantic, "replay_source_semantics", reject)
    with pytest.raises(semantic.SemanticCustodyError, match="predicate failed"):
        runner.semantic.replay_source_semantics(
            package_bytes=b"x",
            cnf_bytes=b"x",
            model=[],
            source_bundle=SimpleNamespace(),
            variable_map_bytes=b"x",
        )
    claims = runner._claims()
    assert claims["aggregate_order_case_coverage"] is False
    assert claims["universal_lift"] is False
    assert claims["theorem_closure"] is False
    assert claims["lean_checked"] is False
