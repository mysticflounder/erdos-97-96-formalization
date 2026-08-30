from __future__ import annotations

import json
import subprocess
import sys
from collections.abc import Callable, Sequence
from pathlib import Path
from typing import Any

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_common_core_piqd as driver

SOLVER_SHA256 = "b" * 64
SOLVER_SIGNATURE = "z3-4.17.0"


class FakeClock:
    def __init__(self) -> None:
        self.value = 0.0

    def __call__(self) -> float:
        return self.value

    def advance(self, seconds: float) -> None:
        self.value += seconds


class FakePiqc:
    def __init__(
        self,
        statuses: Sequence[str],
        *,
        clock: FakeClock | None = None,
        solve_advance_seconds: float = 0.0,
        advance_on_operation: str = "solve",
        fixed_session_id: str | None = None,
        mutate_response: Callable[[list[str], dict[str, Any]], str | dict[str, Any]]
        | None = None,
    ) -> None:
        self.statuses = list(statuses)
        self.clock = clock
        self.solve_advance_seconds = solve_advance_seconds
        self.advance_on_operation = advance_on_operation
        self.fixed_session_id = fixed_session_id
        self.mutate_response = mutate_response
        self.commands: list[list[str]] = []
        self.asserted_candidates: list[bytes] = []
        self.sessions: dict[str, dict[str, Any]] = {}
        self.next_session = 1

    @staticmethod
    def _option(argv: list[str], name: str) -> str:
        return argv[argv.index(name) + 1]

    def __call__(self, argv: Sequence[str], **kwargs: object) -> subprocess.CompletedProcess[str]:
        command = list(argv)
        self.commands.append(command)
        assert kwargs["capture_output"] is True
        assert kwargs["check"] is False
        assert kwargs["text"] is True
        assert isinstance(kwargs["timeout"], float)
        assert Path(command[0]).name == "piqc"
        assert command[1] == "session"
        operation = command[2]

        if operation == "new":
            session_id = self.fixed_session_id or f"session-{self.next_session:03d}"
            self.next_session += 1
            self.sessions[session_id] = {}
            payload: dict[str, Any] = {
                "id": session_id,
                "lane": "smt",
                "solver_name": "z3",
                "solver_sha256": SOLVER_SHA256,
                "solver_signature": SOLVER_SIGNATURE,
                "state": "live",
            }
        elif operation == "assert":
            session_id = command[3]
            assert self._option(command, "--expect-commands") == "0"
            candidate = Path(self._option(command, "--file")).read_bytes()
            self.asserted_candidates.append(candidate)
            count = len(driver._scan_command_spans(candidate.decode("utf-8")))
            self.sessions[session_id]["candidate"] = candidate
            self.sessions[session_id]["command_count"] = count
            payload = {"added": count, "commands": count}
        elif operation == "solve":
            session_id = command[3]
            assert "--no-model" in command
            assert self.statuses, "fake status queue exhausted"
            status = self.statuses.pop(0)
            timeout_ms = int(self._option(command, "--timeout-ms"))
            self.sessions[session_id]["status"] = status
            self.sessions[session_id]["timeout_ms"] = timeout_ms
            payload = {
                "replayed": False,
                "solve_index": 1,
                "solve_ms": 7,
                "status": status,
            }
        elif operation == "receipts":
            session_id = command[3]
            session = self.sessions[session_id]
            candidate = session["candidate"]
            status = session["status"]
            receipt = {
                "assumptions": [],
                "base_bytes": len(candidate),
                "base_commands": session["command_count"],
                "base_sha256": driver.sha256_bytes(candidate),
                "include_model": False,
                "solve_index": 1,
                "solver_sha256": SOLVER_SHA256,
                "solver_signature": SOLVER_SIGNATURE,
                "status": status,
                "timeout_ms": session["timeout_ms"],
            }
            payload = {
                "count": 1,
                "receipts": [receipt],
                "session_id": session_id,
            }
        elif operation == "close":
            session_id = command[3]
            payload = {"id": session_id, "state": "closed"}
        else:  # pragma: no cover - the assertion documents the allowed protocol
            raise AssertionError(f"unexpected piqc operation: {operation}")

        if self.clock is not None and operation == self.advance_on_operation:
            self.clock.advance(self.solve_advance_seconds)

        response: str | dict[str, Any] = payload
        if self.mutate_response is not None:
            response = self.mutate_response(command, payload)
        stdout = response if isinstance(response, str) else json.dumps(response)
        return subprocess.CompletedProcess(command, 0, stdout, "")


def smt2(*assertions: str, queries: bool = False) -> str:
    body = [
        "; exact header comment",
        "(set-logic QF_NRA)",
        '(set-info :source "unit-test")',
        "(declare-fun x () Real)",
        *assertions,
    ]
    if queries:
        body.extend(["(check-sat)", "(get-model)", "(exit)"])
    return "\n".join(body) + "\n"


def make_config(
    tmp_path: Path,
    source: str,
    *,
    minimize: bool,
    max_calls: int = 64,
    max_wall_seconds: float = 60.0,
) -> driver.RunConfig:
    input_path = tmp_path / "input.smt2"
    input_path.write_text(source, encoding="utf-8")
    return driver.RunConfig(
        input_path=input_path,
        output_json=tmp_path / "result.json",
        output_smt2=tmp_path / "minimized.smt2",
        necessity_ledger=tmp_path / "necessity.json",
        timeout_ms=1234,
        max_calls=max_calls,
        max_wall_seconds=max_wall_seconds,
        minimize=minimize,
        close_sessions=True,
        label_prefix="test-lane",
        surface="COMMON",
    )


def test_parser_preserves_header_and_assertions_and_strips_queries() -> None:
    assertion = "(assert\n  (= (* x x) 1))"
    source = f"""; provenance
(set-logic QF_NRA)
(set-option :nlsat.seed 0)
(set-info :source "contains ; and (( text")
(declare-fun x () Real)
; source assertion 17
{assertion}
(check-sat)
(get-value (x))
(exit)
""".encode()
    parsed = driver.parse_candidate(source)
    rendered = parsed.render([0]).decode()

    assert parsed.assertion_raw == (assertion,)
    assert parsed.stripped_query_count == 3
    assert parsed.replaced_fixed_option_count == 1
    assert assertion in rendered
    assert "; provenance" not in rendered
    assert "; source assertion 17" not in rendered
    assert "(check-sat)" not in rendered
    assert "(get-value" not in rendered
    assert "(exit)" not in rendered
    fixed_positions = [rendered.index(option) for option in driver.FIXED_Z3_OPTIONS]
    assert fixed_positions == sorted(fixed_positions)
    assert max(fixed_positions) < rendered.index("(declare-fun")
    assert rendered.count("(set-option :nlsat.seed 0)") == 1


def test_lifecycle_is_piqc_only_ordered_and_receipted_before_close(tmp_path: Path) -> None:
    config = make_config(tmp_path, smt2("(assert (= x 0))", queries=True), minimize=False)
    fake = FakePiqc(["UNSAT"])
    report, minimized, ledger = driver.run_driver(config, command_runner=fake)

    assert report["status"] == "INITIAL_UNSAT"
    assert ledger["locally_irredundant"] is False
    assert b"(check-sat)" not in minimized
    operations = [command[2] for command in fake.commands]
    assert operations == ["new", "assert", "solve", "receipts", "close"]
    assert all(Path(command[0]).name == "piqc" for command in fake.commands)
    assert all(command[0] not in {"z3", "cvc5"} for command in fake.commands)
    solve = next(command for command in fake.commands if command[2] == "solve")
    assert solve[-1] == "--no-model"
    assert FakePiqc._option(solve, "--timeout-ms") == "1234"
    assert report["calls"][0]["receipts"]["count"] == 1
    assert report["calls"][0]["closed"]["state"] == "closed"


def test_deletion_minimization_deletes_only_unsat_and_retains_sat_unknown(
    tmp_path: Path,
) -> None:
    assertions = (
        "(assert (> x 0))",
        "(assert (< x 0))",
        "(assert (= (* x x) 1))",
    )
    config = make_config(tmp_path, smt2(*assertions), minimize=True)
    fake = FakePiqc(
        [
            "UNSAT",  # initial
            "UNSAT",  # delete assertion 0
            "SAT",  # retain assertion 1
            "UNKNOWN",  # retain assertion 2, fail closed
            "SAT",  # final necessity of assertion 1
            "UNKNOWN",  # final necessity of assertion 2
        ]
    )
    report, minimized, ledger = driver.run_driver(config, command_runner=fake)
    text = minimized.decode()

    assert report["status"] == "MINIMIZED_UNSAT_WITH_UNKNOWN_NECESSITY"
    assert report["assertions"]["deleted_source_assertion_indices"] == [0]
    assert report["assertions"]["retained_source_assertion_indices"] == [1, 2]
    assert assertions[0] not in text
    assert assertions[1] in text
    assert assertions[2] in text
    assert report["minimized_smt2"]["sha256"] == driver.sha256_bytes(minimized)
    assert all(
        call["candidate_sha256"]
        == call["receipts"]["receipts"][0]["base_sha256"]
        for call in report["calls"]
    )
    assert report["budget"]["calls_used"] == 6
    assert len({call["session_id"] for call in report["calls"]}) == 6
    assert [entry["necessity"]["classification"] for entry in ledger["entries"]] == [
        "NECESSARY_SAT",
        "UNKNOWN_FAIL_CLOSED",
    ]
    assert ledger["locally_irredundant"] is False


def test_all_sat_necessity_tests_certify_local_irredundancy(tmp_path: Path) -> None:
    config = make_config(
        tmp_path,
        smt2("(assert (> x 0))", "(assert (< x 0))"),
        minimize=True,
    )
    fake = FakePiqc(["UNSAT", "SAT", "SAT", "SAT", "SAT"])
    report, _minimized, ledger = driver.run_driver(config, command_runner=fake)

    assert report["status"] == "MINIMIZED_UNSAT"
    assert report["deletion_complete"] is True
    assert report["necessity_complete"] is True
    assert report["locally_irredundant"] is True
    assert ledger["locally_irredundant"] is True


def test_initial_unknown_stops_without_deletion(tmp_path: Path) -> None:
    assertions = ("(assert (> x 0))", "(assert (< x 0))")
    config = make_config(tmp_path, smt2(*assertions), minimize=True)
    report, minimized, ledger = driver.run_driver(
        config,
        command_runner=FakePiqc(["UNKNOWN"]),
    )

    assert report["status"] == "INITIAL_UNKNOWN_FAIL_CLOSED"
    assert report["budget"]["calls_used"] == 1
    assert report["assertions"]["retained_source_assertion_indices"] == [0, 1]
    assert all(assertion in minimized.decode() for assertion in assertions)
    assert all(
        entry["necessity"]["classification"] == "NOT_REQUESTED"
        for entry in ledger["entries"]
    )


def test_unsat_necessity_replay_is_inconsistent_fail_closed(tmp_path: Path) -> None:
    config = make_config(
        tmp_path,
        smt2("(assert (> x 0))", "(assert (< x 0))"),
        minimize=True,
    )
    fake = FakePiqc(["UNSAT", "SAT", "SAT", "UNSAT", "SAT"])
    report, _minimized, ledger = driver.run_driver(config, command_runner=fake)

    assert report["status"] == "NECESSITY_INCONSISTENT_FAIL_CLOSED"
    assert report["locally_irredundant"] is False
    assert ledger["entries"][0]["necessity"]["classification"] == (
        "UNSAT_INCONSISTENT_FAIL_CLOSED"
    )


def test_call_budget_stops_before_unlicensed_trial(tmp_path: Path) -> None:
    assertions = (
        "(assert (> x 0))",
        "(assert (< x 0))",
        "(assert (= x 1))",
    )
    config = make_config(
        tmp_path,
        smt2(*assertions),
        minimize=True,
        max_calls=2,
    )
    fake = FakePiqc(["UNSAT", "UNSAT"])
    report, minimized, ledger = driver.run_driver(config, command_runner=fake)

    assert report["status"] == "DELETION_CALL_BUDGET"
    assert report["budget"]["calls_used"] == 2
    assert len(fake.commands) == 10
    assert assertions[0] not in minimized.decode()
    assert [entry["source_assertion_index"] for entry in ledger["entries"]] == [1, 2]
    assert all(
        entry["necessity"]["classification"] == "NOT_RUN_DELETION_INCOMPLETE"
        for entry in ledger["entries"]
    )


def test_wall_budget_stops_after_initial_solve(tmp_path: Path) -> None:
    clock = FakeClock()
    config = make_config(
        tmp_path,
        smt2("(assert (> x 0))", "(assert (< x 0))"),
        minimize=True,
        max_wall_seconds=1.0,
    )
    fake = FakePiqc(["UNSAT"], clock=clock, solve_advance_seconds=2.0)
    fake.advance_on_operation = "close"
    report, _minimized, _ledger = driver.run_driver(
        config,
        command_runner=fake,
        clock=clock,
    )

    assert report["status"] == "DELETION_WALL_BUDGET"
    assert report["budget"]["calls_used"] == 1
    assert [command[2] for command in fake.commands] == [
        "new",
        "assert",
        "solve",
        "receipts",
        "close",
    ]


def test_wall_deadline_is_recomputed_inside_a_trial(tmp_path: Path) -> None:
    clock = FakeClock()
    config = make_config(
        tmp_path,
        smt2("(assert (= x 0))"),
        minimize=False,
        max_wall_seconds=1.0,
    )
    fake = FakePiqc(
        ["SAT"],
        clock=clock,
        solve_advance_seconds=2.0,
        advance_on_operation="new",
    )
    with pytest.raises(driver.DriverError, match="wall budget expired before piqc session assert"):
        driver.run_driver(config, command_runner=fake, clock=clock)
    assert [command[2] for command in fake.commands] == ["new"]


def test_reused_session_id_violates_fresh_session_contract(tmp_path: Path) -> None:
    config = make_config(
        tmp_path,
        smt2("(assert (> x 0))", "(assert (< x 0))"),
        minimize=True,
    )
    fake = FakePiqc(["UNSAT", "SAT"], fixed_session_id="reused-session")
    with pytest.raises(driver.DriverError, match="fresh-session contract"):
        driver.run_driver(config, command_runner=fake)
    assert [command[2] for command in fake.commands] == [
        "new",
        "assert",
        "solve",
        "receipts",
        "close",
        "new",
    ]


def test_duplicate_or_malformed_piqc_json_fails_closed(tmp_path: Path) -> None:
    config = make_config(tmp_path, smt2("(assert (= x 0))"), minimize=False)

    def corrupt_new(command: list[str], payload: dict[str, Any]) -> str | dict[str, Any]:
        if command[2] == "new":
            return '{"id":"one","id":"two"}'
        return payload

    fake = FakePiqc(["SAT"], mutate_response=corrupt_new)
    with pytest.raises(driver.DriverError, match="duplicate JSON key"):
        driver.run_driver(config, command_runner=fake)
    assert [command[2] for command in fake.commands] == ["new"]


def test_receipt_mismatch_fails_closed_without_closing(tmp_path: Path) -> None:
    config = make_config(tmp_path, smt2("(assert (= x 0))"), minimize=False)

    def corrupt_receipt(
        command: list[str], payload: dict[str, Any]
    ) -> str | dict[str, Any]:
        if command[2] == "receipts":
            payload["receipts"][0]["base_sha256"] = "0" * 64
        return payload

    fake = FakePiqc(["SAT"], mutate_response=corrupt_receipt)
    with pytest.raises(driver.DriverError, match="base_sha256"):
        driver.run_driver(config, command_runner=fake)
    assert [command[2] for command in fake.commands] == [
        "new",
        "assert",
        "solve",
        "receipts",
    ]


def test_canonical_outputs_are_deterministic_for_same_transcript(tmp_path: Path) -> None:
    config = make_config(tmp_path, smt2("(assert (= x 0))"), minimize=False)
    first = driver.run_driver(config, command_runner=FakePiqc(["SAT"]), clock=FakeClock())
    second = driver.run_driver(config, command_runner=FakePiqc(["SAT"]), clock=FakeClock())

    assert driver.canonical_json_bytes(first[0]) == driver.canonical_json_bytes(second[0])
    assert first[1] == second[1]
    assert driver.canonical_json_bytes(first[2]) == driver.canonical_json_bytes(second[2])
    encoded = driver.canonical_json_bytes(first[0])
    assert encoded.endswith(b"\n")
    assert b": " not in encoded
    driver.write_outputs(config, *first)
    assert config.output_json.read_bytes() == driver.canonical_json_bytes(first[0])
    assert config.output_smt2.read_bytes() == first[1]
    assert config.necessity_ledger.read_bytes() == driver.canonical_json_bytes(first[2])


def test_cli_is_silent_without_verbose(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    report = {"schema": driver.RESULT_SCHEMA, "status": "INITIAL_SAT"}
    ledger = {"schema": driver.LEDGER_SCHEMA, "entries": []}
    written: list[driver.RunConfig] = []
    monkeypatch.setattr(
        driver,
        "run_driver",
        lambda config: (report, b"(set-logic QF_NRA)\n", ledger),
    )
    monkeypatch.setattr(
        driver,
        "write_outputs",
        lambda config, *_args: written.append(config),
    )
    result = driver.main(
        [
            str(tmp_path / "input.smt2"),
            "--output-json",
            str(tmp_path / "result.json"),
            "--output-smt2",
            str(tmp_path / "minimized.smt2"),
            "--necessity-ledger",
            str(tmp_path / "necessity.json"),
            "--timeout-ms",
            "1000",
            "--max-calls",
            "1",
            "--max-wall-seconds",
            "60",
        ]
    )

    assert result == 0
    assert len(written) == 1
    assert capsys.readouterr() == ("", "")


def test_conflicting_deterministic_option_and_non_piqc_binary_are_rejected(
    tmp_path: Path,
) -> None:
    bad_source = smt2("(assert (= x 0))").replace(
        "(set-logic QF_NRA)",
        "(set-logic QF_NRA)\n(set-option :nlsat.seed 9)",
    )
    with pytest.raises(driver.DriverError, match="conflicts with deterministic option"):
        driver.parse_candidate(bad_source.encode())

    config = make_config(tmp_path, smt2("(assert (= x 0))"), minimize=False)
    config = driver.RunConfig(**{**config.__dict__, "piqc": "z3"})
    with pytest.raises(driver.DriverError, match="must name the piqc client"):
        driver.run_driver(config, command_runner=FakePiqc(["SAT"]))


@pytest.mark.parametrize(
    "declaration,assertion,error",
    [
        ("(declare-const i Int)", "(assert (= i 0))", "Real declare-const"),
        (
            "(declare-fun f (Real) Real)",
            "(assert (= (f 0) 0))",
            "zero-arity Real declare-fun",
        ),
        (
            "(declare-const x Real)",
            "(assert (forall ((y Real)) (= y x)))",
            "quantifier-free real-arithmetic",
        ),
    ],
)
def test_non_qf_nra_surface_is_rejected(
    declaration: str,
    assertion: str,
    error: str,
) -> None:
    source = f"(set-logic QF_NRA)\n{declaration}\n{assertion}\n"
    with pytest.raises(driver.DriverError, match=error):
        driver.parse_candidate(source.encode())
