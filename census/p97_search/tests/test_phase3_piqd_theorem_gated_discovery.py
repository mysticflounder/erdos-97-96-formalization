from __future__ import annotations

from pathlib import Path
from typing import Any

import pytest

from census.p97_search.phase3_piqd_postwave_gate import PostwaveAuthorization
from census.p97_search.phase3_piqd_theorem_gated_discovery import (
    TheoremGatedDiscoveryError,
    run_authorized_preappended_successor,
    run_authorized_successor,
    run_validated_successor,
)

INPUT = "1" * 64
SUCCESSOR = "2" * 64
CLAUSES = ((-1, 2),)
SESSION_ID = "11111111-1111-4111-8111-111111111111"
SOLVE_INDEX = 43
SOLVER_SHA256 = "3" * 64


class FakeRunner:
    def __init__(self, *, root: str = INPUT, successor: str = SUCCESSOR) -> None:
        self.session_id = SESSION_ID
        self.solve_count = SOLVE_INDEX
        self.solver_sha256 = SOLVER_SHA256
        self.exported_cnf_sha256 = root
        self.successor = successor
        self.appended: list[tuple[tuple[int, ...], ...]] = []
        self.solve_calls: list[dict[str, int | None]] = []
        self.close_calls = 0

    def append_clauses(self, clauses: Any) -> int:
        normalized = tuple(tuple(clause) for clause in clauses)
        self.appended.append(normalized)
        self.exported_cnf_sha256 = self.successor
        return len(normalized)

    def solve(
        self, *, timeout_ms: int | None = None, conflict_limit: int | None = None
    ) -> str:
        self.solve_calls.append(
            {"timeout_ms": timeout_ms, "conflict_limit": conflict_limit}
        )
        self.solve_count += 1
        return "SAT"

    def close(self) -> None:
        self.close_calls += 1


def _authorization(*, authorized: bool = True) -> PostwaveAuthorization:
    return PostwaveAuthorization(
        wave_ordinal=48,
        outcome="reusable-theorem" if authorized else "no-justified-lift",
        successor_authorized=authorized,
        source_session_id=SESSION_ID,
        source_solve_index=SOLVE_INDEX,
        source_solver_sha256=SOLVER_SHA256,
        input_root_sha256=INPUT,
        successor_root_sha256=SUCCESSOR if authorized else None,
        lean_consumer="Problem97.Example.false_of_pattern" if authorized else None,
        admitted_clauses=CLAUSES if authorized else (),
    )


def _install_authorization(
    monkeypatch: pytest.MonkeyPatch, *, authorized: bool
) -> None:
    monkeypatch.setattr(
        "census.p97_search.phase3_piqd_theorem_gated_discovery.load_postwave_authorization",
        lambda _path, *, repo_root: _authorization(authorized=authorized),
    )


def test_appends_exact_fragment_then_runs_one_successor(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner()
    authorization, result = run_authorized_successor(
        runner,
        postwave_receipt=tmp_path / "postwave.json",
        repo_root=tmp_path,
        timeout_ms=30_000,
        conflict_limit=50_000,
    )
    assert authorization.wave_ordinal == 48
    assert result == "SAT"
    assert runner.appended == [CLAUSES]
    assert runner.solve_calls == [{"timeout_ms": 30_000, "conflict_limit": 50_000}]


def test_validated_authorization_avoids_receipt_reload(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        "census.p97_search.phase3_piqd_theorem_gated_discovery.load_postwave_authorization",
        lambda *_args, **_kwargs: pytest.fail("authorization was reloaded"),
    )
    runner = FakeRunner()

    authorization, result = run_validated_successor(
        runner,
        authorization=_authorization(),
        timeout_ms=30_000,
    )

    assert authorization.wave_ordinal == 48
    assert result == "SAT"
    assert runner.appended == [CLAUSES]


def test_validated_negative_authorization_stops_before_append() -> None:
    runner = FakeRunner()
    with pytest.raises(TheoremGatedDiscoveryError, match="no source-backed"):
        run_validated_successor(runner, authorization=_authorization(authorized=False))
    assert not runner.appended
    assert not runner.solve_calls


def test_negative_review_stops_before_append_or_solve(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=False)
    runner = FakeRunner()
    with pytest.raises(TheoremGatedDiscoveryError, match="no source-backed"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert not runner.appended
    assert not runner.solve_calls


def test_frontier_mismatch_stops_before_append(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner(root="3" * 64)
    with pytest.raises(TheoremGatedDiscoveryError, match="input root"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert not runner.appended
    assert not runner.solve_calls


def test_source_session_mismatch_stops_before_append(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner()
    runner.session_id = "22222222-2222-4222-8222-222222222222"
    with pytest.raises(TheoremGatedDiscoveryError, match="source solve"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert not runner.appended
    assert not runner.solve_calls


def test_source_solve_frontier_mismatch_stops_before_append(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner()
    runner.solve_count += 1
    with pytest.raises(TheoremGatedDiscoveryError, match="solve frontier"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert not runner.appended
    assert not runner.solve_calls


def test_successor_mismatch_stops_before_solve(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner(successor="4" * 64)
    with pytest.raises(TheoremGatedDiscoveryError, match="successor root"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert runner.appended == [CLAUSES]
    assert not runner.solve_calls
    assert runner.close_calls == 1


def test_partial_append_terminalizes_session(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)

    class PartialRunner(FakeRunner):
        def append_clauses(self, clauses: Any) -> int:
            super().append_clauses(clauses)
            return 0

    runner = PartialRunner()
    with pytest.raises(TheoremGatedDiscoveryError, match="session was terminalized"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert runner.close_calls == 1
    assert not runner.solve_calls


def test_append_exception_terminalizes_session(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)

    class FailingRunner(FakeRunner):
        def append_clauses(self, clauses: Any) -> int:
            del clauses
            raise OSError("connection dropped during append")

    runner = FailingRunner()
    with pytest.raises(TheoremGatedDiscoveryError, match="session was terminalized"):
        run_authorized_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert runner.close_calls == 1
    assert not runner.solve_calls


def test_preappended_successor_solves_once_without_reappend(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner(root=SUCCESSOR)
    authorization, result = run_authorized_preappended_successor(
        runner,
        postwave_receipt=tmp_path / "postwave.json",
        repo_root=tmp_path,
        timeout_ms=30_000,
    )
    assert authorization.wave_ordinal == 48
    assert result == "SAT"
    assert not runner.appended
    assert runner.solve_calls == [{"timeout_ms": 30_000, "conflict_limit": None}]


def test_preappended_successor_rejects_wrong_root_or_repeated_solve(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _install_authorization(monkeypatch, authorized=True)
    runner = FakeRunner(root=INPUT)
    with pytest.raises(TheoremGatedDiscoveryError, match="preappended successor"):
        run_authorized_preappended_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert not runner.solve_calls

    runner = FakeRunner(root=SUCCESSOR)
    runner.solve_count += 1
    with pytest.raises(TheoremGatedDiscoveryError, match="solve frontier"):
        run_authorized_preappended_successor(
            runner, postwave_receipt=tmp_path / "postwave.json", repo_root=tmp_path
        )
    assert not runner.solve_calls
