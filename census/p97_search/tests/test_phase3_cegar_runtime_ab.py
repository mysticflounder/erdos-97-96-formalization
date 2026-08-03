from __future__ import annotations

import contextlib
import os
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_cegar_runtime as runtime
from census.p97_search import phase3_structural_cegar_projected_static_v3 as v3


@dataclass(frozen=True)
class FrozenInlineTerminalPublisher:
    """Mechanical reference for the authenticated inline terminal effect block."""

    checker_runner: Any
    atomic_writer: Any
    proof_solver: Any | None = None

    def publish(
        self,
        *,
        out: Path,
        cnf_bytes: bytes,
        proof_tmp: Path,
        timeout_s: int,
    ) -> runtime.TerminalPublication:
        terminal_path = out / "terminal.cnf"
        proof_path = out / "terminal.drat"
        self.atomic_writer(terminal_path, cnf_bytes)

        try:
            terminal_bytes = terminal_path.read_bytes()
        except OSError as exc:
            return runtime.TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error=f"terminal CNF could not be reread: {exc}",
            )
        if terminal_bytes != cnf_bytes:
            return runtime.TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error="terminal CNF bytes differ from the frozen input",
            )

        if self.proof_solver is not None:
            with contextlib.suppress(FileNotFoundError):
                proof_tmp.unlink()
            try:
                proof_result = self.proof_solver(
                    terminal_path, timeout_s, proof_tmp
                )
            except Exception as exc:  # noqa: BLE001
                with contextlib.suppress(FileNotFoundError):
                    proof_tmp.unlink()
                return runtime.TerminalPublication(
                    "PROOF_SOLVER_EXCEPTION",
                    proof_error=f"{type(exc).__name__}: {exc}",
                )
            if proof_result.verdict != "UNSAT":
                with contextlib.suppress(FileNotFoundError):
                    proof_tmp.unlink()
                return runtime.TerminalPublication(
                    "PROOF_SOLVER_NOT_UNSAT",
                    proof_error=(
                        "fresh proof-producing solver returned "
                        f"{proof_result.verdict!r} "
                        f"(returncode={proof_result.returncode})"
                    ),
                )

        if not proof_tmp.is_file() or proof_tmp.stat().st_size == 0:
            return runtime.TerminalPublication("MISSING_DRAT")
        os.replace(proof_tmp, proof_path)
        try:
            checked = self.checker_runner(terminal_path, proof_path, timeout_s)
        except Exception as exc:  # noqa: BLE001
            return runtime.TerminalPublication("CHECKER_EXCEPTION", str(exc))
        self.atomic_writer(
            out / "terminal.drat.check",
            (
                checked.stdout
                + ("\nSTDERR\n" + checked.stderr if checked.stderr else "")
            ).encode(),
        )
        if checked.verified is not True:
            return runtime.TerminalPublication("DRAT_REJECTED")
        return runtime.TerminalPublication("VERIFIED")


def _directory_snapshot(root: Path) -> dict[str, tuple[str, bytes | None]]:
    snapshot: dict[str, tuple[str, bytes | None]] = {}
    for path in sorted(root.rglob("*")):
        relative = path.relative_to(root).as_posix()
        if path.is_dir():
            snapshot[relative] = ("directory", None)
        elif path.is_file():
            snapshot[relative] = ("file", path.read_bytes())
        else:
            raise AssertionError(f"unexpected artifact kind: {path}")
    return snapshot


def _run_terminal_case(out: Path, case: str) -> dict[str, Any]:
    def solver(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        if proof is not None and case != "missing":
            proof.write_bytes(b"" if case == "empty" else b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "s UNSATISFIABLE\n", "")

    def checker(*_args: Any) -> Any:
        if case == "checker-exception":
            raise RuntimeError("mock checker failed")
        return v3.sat.CheckerResult(
            case != "rejected",
            0 if case != "rejected" else 1,
            "s VERIFIED\n" if case != "rejected" else "not verified\n",
            "",
        )

    return v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        solver_runner=solver,
        checker_runner=checker,
    )


@pytest.mark.parametrize(
    "case",
    ["verified", "missing", "empty", "checker-exception", "rejected"],
)
def test_extracted_terminal_runtime_matches_frozen_inline_full_directory(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    case: str,
) -> None:
    inline_out = tmp_path / "inline"
    extracted_out = tmp_path / "extracted"
    with monkeypatch.context() as patch:
        patch.setattr(
            runtime,
            "FilesystemTerminalPublisher",
            FrozenInlineTerminalPublisher,
        )
        inline_manifest = _run_terminal_case(inline_out, case)

    extracted_manifest = _run_terminal_case(extracted_out, case)

    assert extracted_manifest == inline_manifest
    assert _directory_snapshot(extracted_out) == _directory_snapshot(inline_out)
    inline_solver_proof = inline_out / ".solver.drat"
    extracted_solver_proof = extracted_out / ".solver.drat"
    if case == "empty":
        assert inline_solver_proof.read_bytes() == b""
        assert extracted_solver_proof.read_bytes() == b""
    else:
        assert not inline_solver_proof.exists()
        assert not extracted_solver_proof.exists()


def test_sequential_solver_alias_preserves_fail_closed_directory_bytes(
    tmp_path: Path,
) -> None:
    def raising_solver(*_args: Any) -> Any:
        raise RuntimeError("mock solver failed")

    def run(out: Path) -> dict[str, Any]:
        return v3.run_driver(
            out,
            timeout_s=5,
            learned_core_limit=2,
            survivor_limit=2,
            bootstrap_results=None,
            algebraic_bootstrap=None,
            projected_static_v3=True,
            solver_runner=raising_solver,
            checker_runner=lambda *_args: pytest.fail("checker must not run"),
        )

    first = tmp_path / "first"
    second = tmp_path / "second"
    assert run(first) == run(second)
    assert _directory_snapshot(first) == _directory_snapshot(second)
