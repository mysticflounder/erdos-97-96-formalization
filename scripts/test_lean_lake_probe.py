from __future__ import annotations

import json
import os
import sys
import time
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import lean_lake_probe as subject


def make_repo(tmp_path: Path) -> tuple[Path, Path]:
    repo = tmp_path / "repo"
    lake = repo / "lean"
    (lake / ".lake" / "packages").mkdir(parents=True)
    lake.joinpath("lean-toolchain").write_text("leanprover/lean4:v4.33.1\n", encoding="utf-8")
    lake.joinpath("lakefile.toml").write_text('name = "Erdos9796"\n', encoding="utf-8")
    lake.joinpath("lake-manifest.json").write_text(
        json.dumps(
            {
                "version": "1.2.0",
                "packagesDir": ".lake/packages",
                "name": "Erdos9796",
                "lakeDir": ".lake",
                "packages": [],
            }
        ),
        encoding="utf-8",
    )
    run_root = repo / "scratch" / "runs" / "lane" / "run-0001"
    run_root.mkdir(parents=True)
    (run_root / "run_manifest.json").write_text("{}\n", encoding="utf-8")
    return repo, run_root


class SuccessProcess:
    pid = 501
    returncode = 0

    def __init__(self, command: list[str], cwd: Path) -> None:
        source = (cwd / "Probe.lean").read_text(encoding="utf-8")
        self.begin = next(line.split('"')[1] for line in source.splitlines() if "BEGIN_" in line)
        self.version = next(line.split('"')[1].split("{")[0] for line in source.splitlines() if "COMPILER_VERSION_" in line)
        self.end = next(line.split('"')[1] for line in source.splitlines() if "END_" in line)
        self.command = command

    def communicate(self, timeout: int | None = None) -> tuple[str, None]:
        output = (
            f"dependency replay\n{self.begin}\ninfo: Probe.lean:3:0: {self.version}Lean 4.33.1\n"
            f"axiom evidence\n{self.end}\n"
        )
        return output, None

    def poll(self) -> int:
        return self.returncode

    def wait(self, timeout: float | None = None) -> int:
        return self.returncode


def test_wrapper_package_manifest_markers_and_evidence(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo, run_root = make_repo(tmp_path)
    seen: dict[str, object] = {}

    def fake_popen(command: list[str], **kwargs: object) -> SuccessProcess:
        seen["command"] = command
        seen["cwd"] = kwargs["cwd"]
        env = kwargs["env"]
        assert isinstance(env, dict)
        seen["env"] = env
        package = Path(str(kwargs["cwd"]))
        manifest = json.loads((package / "lake-manifest.json").read_text(encoding="utf-8"))
        assert manifest["name"] == "Probe"
        assert manifest["packagesDir"] == ".lake/packages"
        assert manifest["packages"][0]["type"] == "path"
        assert manifest["packages"][0]["dir"]
        assert (package / ".lake" / "packages").is_symlink()
        assert "Lean.versionString" in (package / "Probe.lean").read_text(encoding="utf-8")
        process = SuccessProcess(command, package)
        seen["process"] = process
        return process

    monkeypatch.setattr(subject.subprocess, "Popen", fake_popen)
    result = subject.run_probe(
        repo_root=repo,
        lake_root="lean",
        source="import Fake\n#check True\n",
        run_root=run_root,
        timeout=10,
    )
    assert result.output == "axiom evidence"
    assert result.toolchain == "leanprover/lean4:v4.33.1"
    assert result.compiler_version == "Lean 4.33.1"
    assert Path(result.probe_path).is_file()
    assert Path(result.log_path).is_file()
    assert "PROBE-EXIT=0" in Path(result.log_path).read_text(encoding="utf-8")
    assert seen["command"] == [subject.LAKE_BUILD_WRAPPER, "+Probe:olean"]
    env = seen["env"]
    assert isinstance(env, dict)
    assert env["LEAN_ROOT"] == str(seen["cwd"])
    assert env["LOCKFILE"] == str(repo / "lean" / ".lake" / "lake-build.lock")
    assert list((run_root / "tmp").iterdir())


def test_failure_retains_package_and_combined_log(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo, run_root = make_repo(tmp_path)

    def fake_popen(command: list[str], **kwargs: object) -> SuccessProcess:
        process = SuccessProcess(command, Path(str(kwargs["cwd"])))
        process.returncode = 1
        process.communicate = lambda timeout=None: ("dependency replay\n", None)  # type: ignore[method-assign]
        return process

    monkeypatch.setattr(subject.subprocess, "Popen", fake_popen)
    with pytest.raises(subject.ProbeError, match="evidence:"):
        subject.run_probe(
            repo_root=repo,
            lake_root="lean",
            source="import Fake\n",
            run_root=run_root,
            timeout=10,
        )
    assert list((run_root / "tmp").iterdir())
    logs = list((run_root / "artifacts").glob("probe-*.log"))
    assert logs and "dependency replay" in logs[0].read_text(encoding="utf-8")


def test_timeout_kills_process_group_and_retains_evidence(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo, run_root = make_repo(tmp_path)
    calls: list[tuple[int, int]] = []

    class HangingProcess:
        pid = 777
        returncode: int | None = None

        def communicate(self, timeout: int | None = None) -> tuple[str, None]:
            if timeout is not None:
                raise subject.subprocess.TimeoutExpired(["lake-build"], timeout, output="partial")
            self.returncode = -15
            return "partial after cleanup", None

        def poll(self) -> int | None:
            return self.returncode

        def wait(self, timeout: float | None = None) -> int:
            self.returncode = -15
            return self.returncode

    monkeypatch.setattr(subject.subprocess, "Popen", lambda *a, **k: HangingProcess())
    monkeypatch.setattr(subject.os, "killpg", lambda pid, sig: calls.append((pid, sig)))
    with pytest.raises(subject.ProbeError, match="timed out"):
        subject.run_probe(
            repo_root=repo,
            lake_root="lean",
            source="import Fake\n",
            run_root=run_root,
            timeout=1,
        )
    assert calls and calls[0][0] == 777
    logs = list((run_root / "artifacts").glob("probe-*.log"))
    assert logs and "PROBE-TIMEOUT=1" in logs[0].read_text(encoding="utf-8")
    assert list((run_root / "tmp").iterdir())


def test_registered_run_root_required(tmp_path: Path) -> None:
    repo, _ = make_repo(tmp_path)
    with pytest.raises(subject.ProbeError, match="registered run directory"):
        subject.run_probe(
            repo_root=repo,
            lake_root="lean",
            source="import Fake\n",
            run_root=repo / "scratch" / "runs" / "missing",
            timeout=10,
        )


def test_markers_require_exactly_one_each() -> None:
    with pytest.raises(subject.ProbeError, match="exactly one"):
        subject._extract_marked_output("B B VLean E", "B", "V", "E")


def test_nonzero_wrapper_exit_kills_orphan_child_group() -> None:
    child_code = "import signal,time; signal.signal(signal.SIGTERM, signal.SIG_IGN); time.sleep(60)"
    parent_code = (
        "import subprocess,sys; "
        "child=subprocess.Popen([sys.executable, '-c', sys.argv[2]]); "
        "open(sys.argv[1], 'w').write(str(child.pid)); raise SystemExit(7)"
    )
    child_file = Path.cwd() / ".pytest-orphan-child.pid"
    try:
        process = subject.subprocess.Popen(
            [sys.executable, "-c", parent_code, str(child_file), child_code],
            start_new_session=True,
            stdout=subject.subprocess.PIPE,
            stderr=subject.subprocess.STDOUT,
            text=True,
        )
        assert process.wait(timeout=5) == 7
        result = subject._kill_group(process, grace_seconds=0.05)
        assert result["term_sent"] is True
        child_pid = int(child_file.read_text(encoding="utf-8"))
        deadline = time.monotonic() + 2
        while time.monotonic() < deadline:
            try:
                os.kill(child_pid, 0)
            except ProcessLookupError:
                break
            time.sleep(0.02)
        else:
            raise AssertionError("orphan child survived process-group cleanup")
    finally:
        child_file.unlink(missing_ok=True)
