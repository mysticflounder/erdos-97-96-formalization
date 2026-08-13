from __future__ import annotations

import hashlib
import importlib
import json
import os
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest

ROOT = Path(__file__).resolve().parents[3]
HERE = ROOT / "census/p97_search"
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

sat = importlib.import_module("census.p97_search.sat_generate")
cells = importlib.import_module("cells")
adapter = importlib.import_module(
    "census.p97_search.phase3_piqd_sat_generate_adapter"
)


def _cell() -> object:
    return cells.Cell(k=4, n=10, profile=(4, 4, 5), exact=True)


def _encoding() -> object:
    return sat.SatEncoding(
        _cell(),
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope=sat.MINCUT_SCOPE_CARD_GE_TEN,
    )


def _inputs(tmp_path: Path) -> None:
    (tmp_path / "source.json").write_bytes(b"source-manifest\n")
    (tmp_path / "producer.json").write_bytes(b"producer-manifest\n")
    (tmp_path / "authority.json").write_bytes(b"authority\n")


def _config(tmp_path: Path, custody_root: Path | None = None) -> object:
    return adapter.SatGeneratePiqdConfig(
        base_url="http://piqd.invalid",
        custody_root=custody_root or tmp_path / "custody",
        source_manifest_path=tmp_path / "source.json",
        producer_manifest_path=tmp_path / "producer.json",
        producer_job_id="producer-job-7",
        solver_name="cadical-pinned",
        authority_path=tmp_path / "authority.json",
    )


class FakeIncremental:
    def __init__(
        self,
        outcomes: list[str],
        *,
        assignment: dict[int, bool] | None = None,
        close_failures: int = 0,
    ) -> None:
        self.outcomes = outcomes
        self.assignment = assignment or {}
        self.close_failures = close_failures
        self.calls: list[tuple[Path, int, Path | None]] = []
        self.closes = 0
        self.state = "lazy-unopened"

    def __call__(
        self, path: Path, timeout_s: int, proof_path: Path | None
    ) -> object:
        self.calls.append((path, timeout_s, proof_path))
        assert proof_path is None
        self.state = "open"
        outcome = self.outcomes.pop(0)
        if outcome == "ERROR":
            raise RuntimeError("fake PIQD transport")
        return sat.SolverResult(
            outcome, self.assignment if outcome == "SAT" else {}, 20
        )

    def manifest_metadata(self) -> dict[str, object]:
        return {"state": self.state, "calls": len(self.calls)}

    def close(self) -> None:
        self.closes += 1
        if self.closes <= self.close_failures:
            raise RuntimeError("fake close failure")
        self.state = "closed" if self.calls else "closed-before-open"


def _install_fake_v3(
    monkeypatch: pytest.MonkeyPatch, underlying: FakeIncremental
) -> None:
    qualification = importlib.import_module(
        "census.p97_search.phase3_piqd_projected_v3_qualification"
    )
    incremental = importlib.import_module(
        "census.p97_search.phase3_piqd_incremental_v3"
    )
    monkeypatch.setattr(
        qualification,
        "load_production_authority_v3",
        lambda _path: SimpleNamespace(raw=b"authority\n"),
    )
    monkeypatch.setattr(
        incremental,
        "make_piqd_incremental_v3_solver_runner",
        lambda **_kwargs: underlying,
    )


def _local_unsat(calls: list[tuple[Path, Path | None]]):
    def run(path: Path, _timeout: int, proof: Path | None) -> object:
        calls.append((path, proof))
        assert proof is not None
        proof.write_bytes(b"local-drat\n")
        return sat.SolverResult("UNSAT", {}, 20, "local terminal", "")

    return run


def _checker(calls: list[tuple[Path, Path]]):
    def check(cnf: Path, proof: Path, _timeout: int) -> object:
        calls.append((cnf, proof))
        return sat.CheckerResult(True, 0, "s VERIFIED\n", "")

    return check


def _rewrite_manifest(output: Path, manifest: dict[str, object]) -> None:
    (output / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )


def _projected_assignment() -> dict[int, bool]:
    semantic = json.loads(
        (
            ROOT
            / "census/p97_search/tests/fixtures"
            / "projected_static_v3_first_validated_semantic_assignment.json"
        ).read_text()
    )
    return _encoding().assignment_from_record({"semantic_assignment": semantic})


def test_frozen_sat_generate_remains_byte_identical() -> None:
    assert hashlib.sha256(Path(sat.__file__).read_bytes()).hexdigest() == (
        "5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817"
    )


def test_default_piqd_rejects_unsupported_profile_before_filesystem(
    tmp_path: Path,
) -> None:
    output = tmp_path / "custody" / "unsupported"
    with pytest.raises(adapter.SatGeneratePiqdError, match="only exact production-v3"):
        adapter.enumerate_cell_with_piqd(
            cells.Cell(k=1, n=3, profile=None, exact=True),
            output,
            config=_config(tmp_path),
        )
    assert not output.exists()
    assert not (tmp_path / "source.json").exists()


def test_custody_containment_and_crossed_seed_reject_before_io(
    tmp_path: Path,
) -> None:
    factory = adapter.make_sat_generate_piqd_factory(
        _config(tmp_path), local_proof_runner=lambda *_: None
    )
    encoding = _encoding()
    factory.prepare_encoding(encoding)
    escaped = tmp_path / "escaped"
    with pytest.raises(adapter.SatGeneratePiqdError, match="escapes.*custody_root"):
        factory.validate_output_paths(escaped, escaped / "base.cnf")
    output = tmp_path / "custody" / "run"
    with pytest.raises(adapter.SatGeneratePiqdError, match="output_dir/base.cnf"):
        factory.validate_output_paths(output, output / "alternate-base.cnf")
    assert not escaped.exists()
    assert not output.exists()


def test_exact_native_path_and_builtin_boundaries(tmp_path: Path) -> None:
    with pytest.raises(adapter.SatGeneratePiqdError, match="exact native Path"):
        adapter.SatGeneratePiqdConfig(
            base_url="http://piqd.invalid",
            custody_root=str(tmp_path),  # type: ignore[arg-type]
            source_manifest_path=tmp_path / "source.json",
            producer_manifest_path=tmp_path / "producer.json",
            producer_job_id="job",
            solver_name="solver",
            authority_path=tmp_path / "authority.json",
        )
    output = tmp_path / "custody" / "run"
    with pytest.raises(adapter.SatGeneratePiqdError, match="positive builtin integer"):
        adapter.enumerate_cell_with_piqd(
            _cell(), output, config=_config(tmp_path), timeout_s=True
        )
    with pytest.raises(adapter.SatGeneratePiqdError, match="exact native Path"):
        adapter.verify_production_run_artifacts(  # type: ignore[arg-type]
            str(output), checker_runner=_checker([])
        )
    assert not output.exists()


def test_manifest_capture_rejects_symlink_hardlink_and_oversize(
    tmp_path: Path,
) -> None:
    _inputs(tmp_path)
    custody = tmp_path / "custody"
    output = custody / "run"
    output.mkdir(mode=0o700, parents=True)
    target = tmp_path / "target.json"
    target.write_bytes(b"source\n")
    producer = tmp_path / "producer.json"
    authority = tmp_path / "authority.json"

    def attempt(source: Path) -> None:
        config = adapter.SatGeneratePiqdConfig(
            base_url="http://piqd.invalid",
            custody_root=custody,
            source_manifest_path=source,
            producer_manifest_path=producer,
            producer_job_id="job",
            solver_name="solver",
            authority_path=authority,
        )
        factory = adapter.make_sat_generate_piqd_factory(
            config, local_proof_runner=lambda *_: None
        )
        encoding = _encoding()
        factory.prepare_encoding(encoding)
        (output / "base.cnf").write_bytes(encoding.cnf_bytes())
        with pytest.raises(adapter.SatGeneratePiqdError, match="unsafe source manifest"):
            factory(output, encoding, output / "base.cnf")

    symlink = tmp_path / "source-symlink.json"
    symlink.symlink_to(target)
    attempt(symlink)
    hardlink = tmp_path / "source-hardlink.json"
    os.link(target, hardlink)
    attempt(hardlink)
    oversize = tmp_path / "source-oversize.json"
    oversize.write_bytes(b"x" * ((1 << 20) + 1))
    attempt(oversize)


def test_held_output_detects_symlink_and_repoint_race(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.mkdir(mode=0o700)
    linked = tmp_path / "linked"
    linked.symlink_to(target, target_is_directory=True)
    with pytest.raises(adapter.SatGeneratePiqdError, match="unsafe PIQD caller output"):
        adapter._HeldOutputDirectory(linked)

    output = tmp_path / "run"
    output.mkdir(mode=0o700)
    custody = adapter._HeldOutputDirectory(output)
    custody.write_once("artifact.json", b"{}\n")
    moved = tmp_path / "moved"
    output.rename(moved)
    output.mkdir(mode=0o700)
    with pytest.raises(adapter.SatGeneratePiqdError, match="repointed"):
        custody.capture("artifact.json")
    custody.close()


def test_close_is_retry_safe_and_metadata_is_create_once(tmp_path: Path) -> None:
    output = tmp_path / "run"
    output.mkdir(mode=0o700)
    underlying = FakeIncremental([], close_failures=1)
    owned = adapter.SatGeneratePiqdRunner(
        underlying, output_dir=output, caller_manifest=b"{}\n"
    )
    with pytest.raises(RuntimeError, match="fake close failure"):
        owned.close()
    owned.close()
    owned.close()
    assert underlying.closes == 2
    names = sorted(output.glob("piqd-session-metadata-*.json"))
    assert [path.name for path in names] == ["piqd-session-metadata-000000.json"]
    metadata = json.loads(names[0].read_text())
    assert metadata["incremental"]["state"] == "closed-before-open"
    assert metadata["sequence"] == 0


def test_factory_setup_failure_closes_underlying_without_masking(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental([], close_failures=1)
    _install_fake_v3(monkeypatch, underlying)
    custody = tmp_path / "custody"
    output = custody / "run"
    output.mkdir(mode=0o700, parents=True)
    (output / "piqd-caller-manifest.json").write_bytes(b"occupied\n")
    factory = adapter.make_sat_generate_piqd_factory(
        _config(tmp_path, custody), local_proof_runner=lambda *_: None
    )
    encoding = _encoding()
    factory.prepare_encoding(encoding)
    base = output / "base.cnf"
    base.write_bytes(encoding.cnf_bytes())
    with pytest.raises(adapter.SatGeneratePiqdError, match="already exists") as caught:
        factory(output, encoding, base)
    assert underlying.closes == 1
    assert any("underlying PIQD close also failed" in note for note in caught.value.__notes__)


def test_persistent_discovery_literal_none_one_local_terminal_proof_and_publication(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(["UNSAT"])
    _install_fake_v3(monkeypatch, underlying)
    local_calls: list[tuple[Path, Path | None]] = []
    checker_calls: list[tuple[Path, Path]] = []
    output = tmp_path / "custody" / "run"
    result = adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat(local_calls),
        checker_runner=_checker(checker_calls),
    )
    assert result["status"] == "COMPLETE"
    assert [call[2] for call in underlying.calls] == [None]
    assert len(local_calls) == 1
    assert local_calls[0][0] == output / "terminal.cnf"
    assert len(checker_calls) == 1
    assert underlying.closes == 1
    assert result["piqd_provenance"]["session_closed"] is True
    assert result["piqd_provenance"]["session_metadata"][-1]["name"].endswith(
        "000001.json"
    )
    assert "piqd-caller-manifest.json" in result["artifact_hashes"]
    assert "piqd-session-metadata-000001.json" in result["artifact_hashes"]
    assert ".solver.cnf" in result["artifact_hashes"]
    assert ".solver.log" in result["artifact_hashes"]
    assert ".terminal.drat.pending" not in result["artifact_hashes"]
    assert adapter.verify_piqd_provenance(output) == result
    offline_checker_calls: list[tuple[Path, Path]] = []
    assert adapter.verify_production_run_artifacts(
        output, checker_runner=_checker(offline_checker_calls)
    ) == result
    assert offline_checker_calls == [
        (output / "terminal.cnf", output / "terminal.drat")
    ]
    assert len(local_calls) == 1
    assert len(underlying.calls) == 1
    with pytest.raises(sat.Phase3Error):
        sat.verify_run_artifacts(output)


def test_failed_terminal_rerun_retains_and_hashes_pending_proof(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(["UNSAT"])
    _install_fake_v3(monkeypatch, underlying)
    output = tmp_path / "custody" / "pending"

    def failing_local(
        _cnf: Path, _timeout: int, proof: Path | None
    ) -> object:
        assert proof is not None
        proof.write_bytes(b"retained incomplete proof\n")
        raise RuntimeError("fake local proof failure")

    result = adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=failing_local,
        checker_runner=_checker([]),
    )
    assert result["status"] == "UNKNOWN"
    assert (output / ".terminal.drat.pending").read_bytes() == (
        b"retained incomplete proof\n"
    )
    assert ".terminal.drat.pending" in result["artifact_hashes"]
    assert adapter.verify_production_run_artifacts(
        output, checker_runner=lambda *_args: pytest.fail("checker was invoked")
    ) == result


@pytest.mark.parametrize("kind", ["regular", "symlink", "hardlink"])
def test_offline_verifier_rejects_unexpected_entry_without_deleting_it(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, kind: str
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(["UNSAT"])
    _install_fake_v3(monkeypatch, underlying)
    output = tmp_path / "custody" / kind
    adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat([]),
        checker_runner=_checker([]),
    )
    hostile = output / "unexpected-artifact"
    target = tmp_path / f"{kind}-hostile-target"
    if kind == "regular":
        hostile.write_bytes(b"hostile regular file\n")
    else:
        target.write_bytes(b"external hostile target\n")
        if kind == "symlink":
            hostile.symlink_to(target)
        else:
            os.link(target, hostile)
    hostile_lstat = hostile.lstat()
    target_stat = target.stat() if kind != "regular" else None

    with pytest.raises(
        adapter.SatGeneratePiqdError,
        match="unexpected PIQD caller output entries: unexpected-artifact",
    ):
        adapter.verify_production_run_artifacts(
            output, checker_runner=lambda *_args: pytest.fail("checker was invoked")
        )

    assert hostile.lstat() == hostile_lstat
    if kind == "regular":
        assert hostile.read_bytes() == b"hostile regular file\n"
    else:
        assert target.read_bytes() == b"external hostile target\n"
        assert target_stat is not None
        after = target.stat()
        assert (after.st_dev, after.st_ino, after.st_nlink, after.st_size) == (
            target_stat.st_dev,
            target_stat.st_ino,
            target_stat.st_nlink,
            target_stat.st_size,
        )
        if kind == "symlink":
            assert hostile.is_symlink()
        else:
            assert hostile.stat().st_ino == target.stat().st_ino


@pytest.mark.parametrize("kind", ["symlink", "hardlink"])
def test_retained_transient_rejects_links_without_deleting_them(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, kind: str
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(["UNSAT"])
    _install_fake_v3(monkeypatch, underlying)
    output = tmp_path / "custody" / f"transient-{kind}"
    adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat([]),
        checker_runner=_checker([]),
    )
    retained = output / ".solver.log"
    retained.unlink()
    target = tmp_path / f"retained-{kind}-target"
    target.write_bytes(b"hostile retained target\n")
    if kind == "symlink":
        retained.symlink_to(target)
    else:
        os.link(target, retained)

    with pytest.raises(adapter.SatGeneratePiqdError, match="unsafe installed"):
        adapter.verify_production_run_artifacts(
            output, checker_runner=lambda *_args: pytest.fail("checker was invoked")
        )

    assert target.read_bytes() == b"hostile retained target\n"
    if kind == "symlink":
        assert retained.is_symlink()
    else:
        assert retained.stat().st_ino == target.stat().st_ino
        assert retained.stat().st_nlink == 2


@pytest.mark.parametrize(
    "target", ["terminal", "bank", "model-record", "checker", "manifest-count"]
)
def test_full_offline_verifier_rejects_semantic_tamper_beyond_hash_provenance(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, target: str
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(
        ["SAT", "UNSAT"], assignment=_projected_assignment()
    )
    _install_fake_v3(monkeypatch, underlying)
    output = tmp_path / "custody" / target
    adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat([]),
        checker_runner=_checker([]),
    )
    manifest = json.loads((output / "manifest.json").read_text())
    if target == "terminal":
        artifact = output / "terminal.cnf"
        artifact.write_bytes(artifact.read_bytes() + b"1 0\n")
        manifest["artifact_hashes"]["terminal.cnf"] = hashlib.sha256(
            artifact.read_bytes()
        ).hexdigest()
    elif target == "bank":
        artifact = output / "bank.jsonl"
        lines = artifact.read_text().splitlines()
        header = json.loads(lines[0])
        header["spec_version"] = "forged-bank"
        artifact.write_text(json.dumps(header) + "\n" + "\n".join(lines[1:]))
        manifest["artifact_hashes"]["bank.jsonl"] = hashlib.sha256(
            artifact.read_bytes()
        ).hexdigest()
    elif target == "model-record":
        artifact = output / "models.jsonl"
        record = json.loads(artifact.read_text())
        record["canonical_was_new"] = False
        artifact.write_text(json.dumps(record, separators=(",", ":")) + "\n")
        manifest["artifact_hashes"]["models.jsonl"] = hashlib.sha256(
            artifact.read_bytes()
        ).hexdigest()
    elif target == "checker":
        artifact = output / "terminal.drat.check"
        artifact.write_bytes(b"s NOT VERIFIED\n")
        manifest["artifact_hashes"]["terminal.drat.check"] = hashlib.sha256(
            artifact.read_bytes()
        ).hexdigest()
    else:
        manifest["base_variable_count"] = 1193
    _rewrite_manifest(output, manifest)
    assert adapter.verify_piqd_provenance(output) == manifest
    with pytest.raises(adapter.SatGeneratePiqdError):
        adapter.verify_production_run_artifacts(
            output, checker_runner=_checker([])
        )


@pytest.mark.parametrize("outcome", ["UNKNOWN", "ERROR"])
def test_unknown_or_transport_error_has_no_local_discovery_fallback(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, outcome: str
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental([outcome])
    _install_fake_v3(monkeypatch, underlying)
    local_calls: list[tuple[Path, Path | None]] = []
    output = tmp_path / "custody" / outcome.lower()
    result = adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat(local_calls),
        checker_runner=_checker([]),
    )
    assert result["status"] == "UNKNOWN"
    assert local_calls == []
    assert underlying.closes == 1


def test_close_failure_downgrades_complete_without_masking(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(["UNSAT"], close_failures=1)
    _install_fake_v3(monkeypatch, underlying)
    local_calls: list[tuple[Path, Path | None]] = []
    output = tmp_path / "custody" / "run"
    result = adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat(local_calls),
        checker_runner=_checker([]),
    )
    assert result["status"] == "UNKNOWN"
    assert result["unsat_verified"] is False
    assert "close failed closed" in result["diagnostic"]
    assert len(local_calls) == 1
    assert "piqd-lifecycle-failure.json" in result["artifact_hashes"]
    assert adapter.verify_piqd_provenance(output) == result


def test_published_manifest_detects_metadata_tamper(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    _inputs(tmp_path)
    underlying = FakeIncremental(["UNKNOWN"])
    _install_fake_v3(monkeypatch, underlying)
    output = tmp_path / "custody" / "run"
    adapter.enumerate_cell_with_piqd(
        _cell(),
        output,
        config=_config(tmp_path),
        timeout_s=1,
        local_proof_runner=_local_unsat([]),
        checker_runner=_checker([]),
    )
    metadata = output / "piqd-session-metadata-000000.json"
    metadata.write_bytes(metadata.read_bytes() + b" ")
    with pytest.raises(adapter.SatGeneratePiqdError):
        adapter.verify_piqd_provenance(output)


def test_cli_defaults_to_piqd_and_legacy_is_explicit(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    with pytest.raises(SystemExit):
        adapter.main(["--k", "4", "--n", "10", "--out", str(tmp_path / "run")])
    seen: dict[str, object] = {}

    def fake_enumerate(cell: object, run_dir: Path, **kwargs: object) -> dict[str, str]:
        seen["cell"] = cell
        seen["run_dir"] = run_dir
        seen.update(kwargs)
        return {"status": "UNKNOWN"}

    monkeypatch.setattr(sat, "enumerate_cell", fake_enumerate)
    assert adapter.main(
        [
            "--k",
            "1",
            "--n",
            "3",
            "--out",
            str(tmp_path / "legacy"),
            "--solver-backend",
            "legacy-local",
        ]
    ) == 2
    assert seen["run_dir"] == tmp_path / "legacy"


def test_cli_check_uses_additive_production_verifier(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    output = tmp_path / "production"
    seen: list[Path] = []

    def fake_verify(run_dir: Path) -> dict[str, str]:
        seen.append(run_dir)
        return {"status": "UNKNOWN"}

    monkeypatch.setattr(adapter, "verify_production_run_artifacts", fake_verify)
    assert adapter.main(["--check", "--out", str(output)]) == 0
    assert seen == [output]
