# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Focused tests for the wrapper-only migration census driver."""

from __future__ import annotations

import json
import os
import signal
import subprocess
import sys
import time
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import scripts.check_migration_targets as subject


def _write_wrapper(tmp_path: Path) -> tuple[Path, Path, Path]:
    wrapper_log = tmp_path / "wrapper-events.jsonl"
    active = tmp_path / "active"
    child_pid = tmp_path / "child.pid"
    wrapper = tmp_path / "mock-lake-build"
    wrapper.write_text(
        f"""#!{sys.executable}
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

events = Path({str(wrapper_log)!r})
active = Path({str(active)!r})
child_pid = Path({str(child_pid)!r})
arg = sys.argv[1]
with events.open("a", encoding="utf-8") as stream:
    stream.write(json.dumps({{"event": "start", "arg": arg, "time": time.monotonic(), "lean_root": os.environ.get("LEAN_ROOT")}}) + "\\n")
if arg in ("+Timeout:olean", "+Orphan:olean"):
    child = subprocess.Popen([
        sys.executable, "-c",
        "import signal, time; signal.signal(signal.SIGTERM, signal.SIG_IGN); time.sleep(30)",
    ])
    child_pid.write_text(str(child.pid), encoding="ascii")
    if arg == "+Timeout:olean":
        time.sleep(30)
    raise SystemExit(9)
elif arg == "+Fail:olean":
    time.sleep(0.03)
    raise SystemExit(7)
else:
    if active.exists():
        raise SystemExit(91)
    active.write_text("active", encoding="ascii")
    time.sleep(0.03)
    active.unlink()
with events.open("a", encoding="utf-8") as stream:
    stream.write(json.dumps({{"event": "end", "arg": arg, "time": time.monotonic()}}) + "\\n")
""",
        encoding="utf-8",
    )
    wrapper.chmod(0o755)
    return wrapper, wrapper_log, child_pid


def _source(repo: Path, module: str) -> None:
    path = repo / "lean" / Path(module.replace(".", "/")).with_suffix(".lean")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("-- fixture source\n", encoding="ascii")


def _summary(run_root: Path) -> dict:
    return json.loads((run_root / "summary.json").read_text(encoding="utf-8"))


def test_targets_run_serially_with_wrapper_argv_and_evidence(tmp_path: Path) -> None:
    wrapper, wrapper_log, _ = _write_wrapper(tmp_path)
    _source(tmp_path, "Alpha.One")
    _source(tmp_path, "Beta.Two")
    run_root = tmp_path / "run"

    code, summary = subject.run_census(
        targets=["Alpha.One", "Beta.Two"],
        run_root=run_root,
        repo_root=tmp_path,
        lean_root=tmp_path / "lean",
        wrapper=str(wrapper),
        timeout_seconds=5,
    )

    assert code == 0
    assert summary["status"] == "passed"
    assert [row["status"] for row in summary["targets"]] == ["passed", "passed"]
    assert [row["argv"][1] for row in summary["targets"]] == [
        "+Alpha.One:olean",
        "+Beta.Two:olean",
    ]
    assert all(row["source"]["exists"] and row["source"]["sha256"] for row in summary["targets"])
    events = [json.loads(line) for line in wrapper_log.read_text().splitlines()]
    assert [event["arg"] for event in events if event["event"] == "start"] == [
        "+Alpha.One:olean",
        "+Beta.Two:olean",
    ]
    assert all(event["lean_root"] == str(tmp_path / "lean") for event in events if event["event"] == "start")
    assert events[1]["time"] <= events[2]["time"]
    assert all((run_root / row["log"]).is_file() for row in summary["targets"])
    assert _summary(run_root) == summary


def test_failure_is_not_old_olean_success_and_keep_going_is_explicit(tmp_path: Path) -> None:
    wrapper, wrapper_log, _ = _write_wrapper(tmp_path)
    for module in ("Pass", "Fail", "After"):
        _source(tmp_path, module)
    (tmp_path / "lean" / "Fail.olean").write_bytes(b"stale artifact")

    code, summary = subject.run_census(
        targets=["Pass", "Fail", "After"],
        run_root=tmp_path / "stop-run",
        repo_root=tmp_path,
        lean_root=tmp_path / "lean",
        wrapper=str(wrapper),
        timeout_seconds=5,
    )
    assert code == 1
    assert summary["status"] == "failed"
    assert [row["status"] for row in summary["targets"]] == ["passed", "failed", "skipped"]
    assert summary["targets"][1]["exit_code"] == 7
    assert "After" not in wrapper_log.read_text()

    code, summary = subject.run_census(
        targets=["Pass", "Fail", "After"],
        run_root=tmp_path / "continue-run",
        repo_root=tmp_path,
        lean_root=tmp_path / "lean",
        wrapper=str(wrapper),
        timeout_seconds=5,
        keep_going=True,
    )
    assert code == 1
    assert [row["status"] for row in summary["targets"]] == ["passed", "failed", "passed"]


def test_timeout_kills_descendants_and_writes_failure_summary(tmp_path: Path) -> None:
    wrapper, _, child_pid_path = _write_wrapper(tmp_path)
    _source(tmp_path, "Timeout")
    run_root = tmp_path / "timeout-run"

    code, summary = subject.run_census(
        targets=["Timeout"],
        run_root=run_root,
        repo_root=tmp_path,
        lean_root=tmp_path / "lean",
        wrapper=str(wrapper),
        timeout_seconds=1.0,
        grace_seconds=0.05,
    )

    assert code == 1
    row = summary["targets"][0]
    assert summary["status"] == "failed"
    assert row["status"] == "timeout"
    assert row["termination"]["term_sent"]
    assert row["termination"]["kill_sent"] or row["termination"]["term_sent"]
    child_pid = int(child_pid_path.read_text(encoding="ascii"))
    for _ in range(20):
        try:
            os.kill(child_pid, 0)
        except ProcessLookupError:
            break
        time.sleep(0.05)
    else:
        pytest.fail(f"timeout descendant still exists: {child_pid}")
    assert _summary(run_root) == summary


def test_abnormal_wrapper_exit_kills_orphan_descendant(tmp_path: Path) -> None:
    wrapper, _, child_pid_path = _write_wrapper(tmp_path)
    _source(tmp_path, "Orphan")

    code, summary = subject.run_census(
        targets=["Orphan"],
        run_root=tmp_path / "orphan-run",
        repo_root=tmp_path,
        lean_root=tmp_path / "lean",
        wrapper=str(wrapper),
        timeout_seconds=5,
        grace_seconds=0.05,
    )

    assert code == 1
    assert summary["targets"][0]["status"] == "failed"
    assert summary["targets"][0]["exit_code"] == 9
    child_pid = int(child_pid_path.read_text(encoding="ascii"))
    with pytest.raises(ProcessLookupError):
        os.kill(child_pid, 0)


def test_driver_sigterm_interrupts_and_cleans_active_wrapper(tmp_path: Path) -> None:
    wrapper, _, child_pid_path = _write_wrapper(tmp_path)
    _source(tmp_path, "Timeout")
    run_root = tmp_path / "signal-run"
    repo_root = Path(__file__).resolve().parents[1]
    code = (
        "from pathlib import Path; "
        "import scripts.check_migration_targets as s; "
        f"raise SystemExit(s.run_census(targets=['Timeout'], run_root=Path({str(run_root)!r}), "
        f"repo_root=Path({str(tmp_path)!r}), lean_root=Path({str(tmp_path / 'lean')!r}), "
        f"wrapper={str(wrapper)!r}, timeout_seconds=30)[0])"
    )
    environment = dict(os.environ)
    environment["PYTHONDONTWRITEBYTECODE"] = "1"
    driver = subprocess.Popen(
        [sys.executable, "-c", code],
        cwd=repo_root,
        env=environment,
        start_new_session=True,
    )
    try:
        for _ in range(40):
            if child_pid_path.exists():
                break
            time.sleep(0.05)
        else:
            pytest.fail("driver did not launch the wrapper child")
        driver.send_signal(signal.SIGTERM)
        assert driver.wait(timeout=3) == 1
    finally:
        if driver.poll() is None:
            driver.kill()
            driver.wait()
    summary = _summary(run_root)
    assert summary["status"] == "interrupted"
    assert summary["targets"][0]["status"] == "interrupted"
    child_pid = int(child_pid_path.read_text(encoding="ascii"))
    with pytest.raises(ProcessLookupError):
        os.kill(child_pid, 0)


def test_target_list_normalises_wrapper_target_syntax(tmp_path: Path) -> None:
    target_list = tmp_path / "targets.json"
    target_list.write_text(json.dumps({"targets": ["+Alpha:olean", "Beta"]}), encoding="utf-8")
    assert subject._load_targets([], target_list) == ["Alpha", "Beta"]


def test_existing_census_evidence_is_preserved(tmp_path: Path) -> None:
    wrapper, _, _ = _write_wrapper(tmp_path)
    _source(tmp_path, "Alpha")
    run_root = tmp_path / "run"
    run_root.mkdir()
    summary = run_root / "summary.json"
    log = run_root / "target-001.log"
    summary.write_text("existing summary\n", encoding="ascii")
    log.write_text("existing log\n", encoding="ascii")

    with pytest.raises(FileExistsError):
        subject.run_census(
            targets=["Alpha"],
            run_root=run_root,
            repo_root=tmp_path,
            lean_root=tmp_path / "lean",
            wrapper=str(wrapper),
        )
    assert summary.read_text(encoding="ascii") == "existing summary\n"
    assert log.read_text(encoding="ascii") == "existing log\n"


def test_run_manifest_does_not_block_empty_run_root(tmp_path: Path) -> None:
    wrapper, _, _ = _write_wrapper(tmp_path)
    _source(tmp_path, "Alpha")
    run_root = tmp_path / "run"
    run_root.mkdir()
    (run_root / "run_manifest.json").write_text("{}\n", encoding="ascii")

    code, summary = subject.run_census(
        targets=["Alpha"],
        run_root=run_root,
        repo_root=tmp_path,
        lean_root=tmp_path / "lean",
        wrapper=str(wrapper),
    )
    assert code == 0
    assert summary["status"] == "passed"
