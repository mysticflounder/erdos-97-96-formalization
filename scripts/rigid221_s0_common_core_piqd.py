"""Fail-closed PiQd-only QF_NRA deletion minimizer.

The driver treats a flat SMT-LIB2 file as an ordered collection of top-level
assertion occurrences.  Every oracle call starts a fresh PiQd SMT session,
loads the exact candidate journal, solves once without a model, captures the
session receipt, and only then (when requested) closes the session.

The resulting core is solver-discovery evidence.  It is not a proof object and
does not promote a fixed-cell result to a source-universal theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import re
import subprocess
import sys
import tempfile
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from time import monotonic
from typing import Any

RESULT_SCHEMA = "rigid221-s0-common-core-piqd-result/v1"
LEDGER_SCHEMA = "rigid221-s0-common-core-necessity-ledger/v1"
FIXED_Z3_OPTIONS = (
    "(set-option :tactic.default_tactic qfnra-nlsat)",
    "(set-option :nlsat.randomize false)",
    "(set-option :nlsat.seed 0)",
)
FIXED_OPTION_VALUES = {
    ":tactic.default_tactic": "qfnra-nlsat",
    ":nlsat.randomize": "false",
    ":nlsat.seed": "0",
}
TERMINAL_OR_QUERY_COMMANDS = frozenset(
    {
        "check-sat",
        "check-sat-assuming",
        "echo",
        "exit",
        "get-assertions",
        "get-assignment",
        "get-info",
        "get-model",
        "get-option",
        "get-proof",
        "get-unsat-assumptions",
        "get-unsat-core",
        "get-value",
    }
)
HEADER_COMMANDS = frozenset(
    {
        "declare-const",
        "declare-fun",
        "set-info",
        "set-logic",
        "set-option",
    }
)
DECLARATION_COMMANDS = frozenset(
    {
        "declare-const",
        "declare-fun",
    }
)
VALID_VERDICTS = frozenset({"SAT", "UNSAT", "UNKNOWN"})
FORBIDDEN_ASSERTION_TOKENS = frozenset(
    {
        "Array",
        "BitVec",
        "FloatingPoint",
        "Int",
        "RegLan",
        "RoundingMode",
        "Seq",
        "String",
        "div",
        "exists",
        "forall",
        "is_int",
        "lambda",
        "match",
        "mod",
        "to_int",
    }
)


class DriverError(RuntimeError):
    """A fail-closed input, transport, or receipt validation failure."""


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_json_bytes(value: object) -> bytes:
    try:
        text = json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=False,
            separators=(",", ":"),
            sort_keys=True,
        )
    except (TypeError, ValueError) as exc:
        raise DriverError(f"cannot serialize canonical JSON: {exc}") from exc
    return (text + "\n").encode("utf-8")


def _reject_json_constant(value: str) -> object:
    raise DriverError(f"non-finite JSON constant from piqc: {value}")


def _unique_json_object(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise DriverError(f"duplicate JSON key from piqc: {key}")
        result[key] = value
    return result


def parse_json_object(text: str, *, context: str) -> dict[str, Any]:
    try:
        value = json.loads(
            text,
            object_pairs_hook=_unique_json_object,
            parse_constant=_reject_json_constant,
        )
    except DriverError:
        raise
    except json.JSONDecodeError as exc:
        raise DriverError(f"{context} returned malformed JSON: {exc}") from exc
    if not isinstance(value, dict):
        raise DriverError(f"{context} returned JSON that is not an object")
    return value


@dataclass(frozen=True)
class SmtCommand:
    leading: str
    raw: str
    head: str
    assertion_index: int | None
    disposition: str


def _only_smt_trivia(text: str) -> bool:
    index = 0
    while index < len(text):
        if text[index].isspace():
            index += 1
            continue
        if text[index] == ";":
            newline = text.find("\n", index)
            index = len(text) if newline < 0 else newline + 1
            continue
        return False
    return True


def _scan_command_spans(text: str) -> list[tuple[int, int]]:
    """Return exact top-level S-expression spans from an SMT-LIB2 script."""

    spans: list[tuple[int, int]] = []
    index = 0
    outside_start = 0
    length = len(text)
    while index < length:
        char = text[index]
        if char.isspace():
            index += 1
            continue
        if char == ";":
            newline = text.find("\n", index)
            index = length if newline < 0 else newline + 1
            continue
        if char != "(":
            raise DriverError(f"unsupported top-level SMT-LIB2 token at byte {index}")
        if not _only_smt_trivia(text[outside_start:index]):
            raise DriverError(f"non-trivia text before SMT-LIB2 command at byte {index}")

        start = index
        depth = 0
        in_string = False
        in_quoted_symbol = False
        in_comment = False
        while index < length:
            char = text[index]
            if in_comment:
                if char == "\n":
                    in_comment = False
                index += 1
                continue
            if in_string:
                if char == '"':
                    if index + 1 < length and text[index + 1] == '"':
                        index += 2
                        continue
                    in_string = False
                elif char == "\\" and index + 1 < length:
                    index += 2
                    continue
                index += 1
                continue
            if in_quoted_symbol:
                if char == "\\" and index + 1 < length:
                    index += 2
                    continue
                if char == "|":
                    in_quoted_symbol = False
                index += 1
                continue
            if char == ";":
                in_comment = True
                index += 1
                continue
            if char == '"':
                in_string = True
                index += 1
                continue
            if char == "|":
                in_quoted_symbol = True
                index += 1
                continue
            if char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
                if depth == 0:
                    index += 1
                    spans.append((start, index))
                    outside_start = index
                    break
                if depth < 0:
                    raise DriverError(f"unmatched ')' at byte {index}")
            index += 1
        else:
            raise DriverError(f"unterminated SMT-LIB2 command starting at byte {start}")
        if in_string or in_quoted_symbol:
            raise DriverError(f"unterminated SMT-LIB2 token starting at byte {start}")

    if not _only_smt_trivia(text[outside_start:]):
        raise DriverError("non-trivia text follows the final SMT-LIB2 command")
    return spans


def _without_comments(text: str) -> str:
    pieces: list[str] = []
    index = 0
    in_string = False
    in_quoted_symbol = False
    while index < len(text):
        char = text[index]
        if in_string:
            pieces.append(char)
            if char == '"':
                if index + 1 < len(text) and text[index + 1] == '"':
                    pieces.append('"')
                    index += 2
                    continue
                in_string = False
            elif char == "\\" and index + 1 < len(text):
                pieces.append(text[index + 1])
                index += 2
                continue
            index += 1
            continue
        if in_quoted_symbol:
            pieces.append(char)
            if char == "\\" and index + 1 < len(text):
                pieces.append(text[index + 1])
                index += 2
                continue
            if char == "|":
                in_quoted_symbol = False
            index += 1
            continue
        if char == ";":
            newline = text.find("\n", index)
            if newline < 0:
                break
            pieces.append("\n")
            index = newline + 1
            continue
        pieces.append(char)
        if char == '"':
            in_string = True
        elif char == "|":
            in_quoted_symbol = True
        index += 1
    return "".join(pieces)


def _command_head(raw: str) -> str:
    cleaned = _without_comments(raw)
    match = re.match(r"\(\s*([^\s()]+)", cleaned, flags=re.DOTALL)
    if match is None:
        raise DriverError("empty or malformed SMT-LIB2 command")
    return match.group(1)


def _simple_set_option(raw: str) -> tuple[str, str] | None:
    cleaned = _without_comments(raw)
    match = re.fullmatch(
        r"\s*\(\s*set-option\s+(:[^\s()]+)\s+([^\s()]+)\s*\)\s*",
        cleaned,
        flags=re.DOTALL,
    )
    if match is None:
        return None
    return match.group(1), match.group(2)


def _unquoted_tokens(raw: str) -> tuple[str, ...]:
    """Lex unquoted SMT tokens, ignoring comments, strings, and quoted symbols."""

    tokens: list[str] = []
    index = 0
    while index < len(raw):
        char = raw[index]
        if char.isspace() or char in "()":
            index += 1
            continue
        if char == ";":
            newline = raw.find("\n", index)
            index = len(raw) if newline < 0 else newline + 1
            continue
        if char == '"':
            index += 1
            while index < len(raw):
                if raw[index] == '"':
                    if index + 1 < len(raw) and raw[index + 1] == '"':
                        index += 2
                        continue
                    index += 1
                    break
                index += 1
            continue
        if char == "|":
            index += 1
            while index < len(raw) and raw[index] != "|":
                index += 1
            index += 1
            continue
        end = index + 1
        while end < len(raw) and not raw[end].isspace() and raw[end] not in "()":
            if raw[end] == ";":
                break
            end += 1
        tokens.append(raw[index:end])
        index = end
    return tuple(tokens)


def _validate_qf_nra_command(head: str, raw: str) -> None:
    cleaned = _without_comments(raw)
    if head == "declare-fun":
        pattern = r"\s*\(\s*declare-fun\s+[^\s()|]+\s+\(\s*\)\s+Real\s*\)\s*"
        if re.fullmatch(pattern, cleaned, flags=re.DOTALL) is None:
            raise DriverError(
                "QF_NRA driver permits only unquoted zero-arity Real declare-fun commands"
            )
    elif head == "declare-const":
        pattern = r"\s*\(\s*declare-const\s+[^\s()|]+\s+Real\s*\)\s*"
        if re.fullmatch(pattern, cleaned, flags=re.DOTALL) is None:
            raise DriverError(
                "QF_NRA driver permits only unquoted Real declare-const commands"
            )
    elif head == "assert":
        forbidden = sorted(FORBIDDEN_ASSERTION_TOKENS.intersection(_unquoted_tokens(raw)))
        if forbidden:
            raise DriverError(
                "assertion leaves the quantifier-free real-arithmetic fragment: "
                + ", ".join(forbidden)
            )


@dataclass(frozen=True)
class ParsedCandidate:
    source_bytes: bytes
    commands: tuple[SmtCommand, ...]
    assertion_raw: tuple[str, ...]
    stripped_query_count: int
    replaced_fixed_option_count: int

    @property
    def assertion_count(self) -> int:
        return len(self.assertion_raw)

    def render(self, selected_indices: Sequence[int]) -> bytes:
        selected = tuple(selected_indices)
        if selected != tuple(sorted(set(selected))):
            raise DriverError("selected assertion indices must be unique and sorted")
        if any(index < 0 or index >= self.assertion_count for index in selected):
            raise DriverError("selected assertion index is out of range")
        selected_set = set(selected)
        journal_commands: list[str] = []
        inserted_options = False
        for command in self.commands:
            if command.disposition in {"query", "fixed-option"}:
                continue
            if not inserted_options and (
                command.head in DECLARATION_COMMANDS or command.head == "assert"
            ):
                journal_commands.extend(FIXED_Z3_OPTIONS)
                inserted_options = True
            if command.head == "assert" and command.assertion_index not in selected_set:
                continue
            journal_commands.append(command.raw)
        if not inserted_options:
            raise DriverError("candidate has no declaration or assertion insertion point")
        # PiQd's SMT journal parses a submitted batch into exact command spans,
        # then writes each span followed by one newline.  Render that form
        # ourselves so the submitted file bytes, receipt base bytes/hash, and
        # minimized SMT2 bytes are identical.  Inter-command comments/trivia
        # are deliberately outside the journal identity; command bodies are
        # retained byte-for-byte.
        return "".join(f"{command}\n" for command in journal_commands).encode("utf-8")

    def assertion_record(self, index: int) -> dict[str, object]:
        raw = self.assertion_raw[index]
        return {
            "assertion_sha256": sha256_bytes(raw.encode("utf-8")),
            "source_assertion_index": index,
        }


def parse_candidate(source_bytes: bytes) -> ParsedCandidate:
    try:
        text = source_bytes.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise DriverError("candidate SMT-LIB2 is not UTF-8") from exc
    spans = _scan_command_spans(text)
    if not spans:
        raise DriverError("candidate SMT-LIB2 contains no commands")

    commands: list[SmtCommand] = []
    assertions: list[str] = []
    previous_end = 0
    seen_assertion = False
    seen_query = False
    logic_count = 0
    stripped_queries = 0
    replaced_options = 0
    for start, end in spans:
        leading = text[previous_end:start]
        raw = text[start:end]
        previous_end = end
        head = _command_head(raw)
        if head in TERMINAL_OR_QUERY_COMMANDS:
            seen_query = True
            stripped_queries += 1
            commands.append(SmtCommand(leading, raw, head, None, "query"))
            continue
        if seen_query:
            raise DriverError("semantic command appears after a terminal/query command")
        if head == "assert":
            _validate_qf_nra_command(head, raw)
            seen_assertion = True
            assertion_index = len(assertions)
            assertions.append(raw)
            commands.append(SmtCommand(leading, raw, head, assertion_index, "assertion"))
            continue
        if head not in HEADER_COMMANDS:
            raise DriverError(f"unsupported stateful or non-flat SMT-LIB2 command: {head}")
        if seen_assertion:
            raise DriverError(f"header/declaration command appears after an assertion: {head}")
        if head == "set-logic":
            logic_count += 1
            cleaned = _without_comments(raw)
            if re.fullmatch(r"\s*\(\s*set-logic\s+QF_NRA\s*\)\s*", cleaned) is None:
                raise DriverError("candidate must use exactly (set-logic QF_NRA)")
        elif head in DECLARATION_COMMANDS:
            _validate_qf_nra_command(head, raw)
        disposition = "header"
        if head == "set-option":
            option = _simple_set_option(raw)
            if option is not None and option[0] in FIXED_OPTION_VALUES:
                expected = FIXED_OPTION_VALUES[option[0]]
                if option[1] != expected:
                    raise DriverError(
                        f"candidate conflicts with deterministic option {option[0]}={expected}"
                    )
                disposition = "fixed-option"
                replaced_options += 1
        commands.append(SmtCommand(leading, raw, head, None, disposition))

    if logic_count != 1:
        raise DriverError("candidate must contain exactly one QF_NRA set-logic command")
    if not assertions:
        raise DriverError("candidate SMT-LIB2 contains no top-level assertions")
    return ParsedCandidate(
        source_bytes=source_bytes,
        commands=tuple(commands),
        assertion_raw=tuple(assertions),
        stripped_query_count=stripped_queries,
        replaced_fixed_option_count=replaced_options,
    )


CommandRunner = Callable[..., subprocess.CompletedProcess[str]]


@dataclass(frozen=True)
class TrialConfig:
    piqc: str
    solver: str
    timeout_ms: int
    close_sessions: bool
    label_prefix: str
    surface: str


class PiqcOracle:
    def __init__(
        self,
        config: TrialConfig,
        *,
        command_runner: CommandRunner = subprocess.run,
        clock: Callable[[], float] = monotonic,
    ) -> None:
        if Path(config.piqc).name != "piqc":
            raise DriverError("--piqc must name the piqc client, not a solver binary")
        if config.solver != "z3":
            raise DriverError("this deterministic QF_NRA minimizer supports only --solver z3")
        if config.timeout_ms <= 0:
            raise DriverError("timeout-ms must be positive")
        self.config = config
        self.command_runner = command_runner
        self.clock = clock
        self.seen_session_ids: set[str] = set()

    def _remaining(self, wall_deadline: float, *, context: str) -> float:
        remaining = wall_deadline - self.clock()
        if remaining <= 0:
            raise DriverError(f"wall budget expired before {context}")
        return remaining

    def _run_json(
        self,
        arguments: Sequence[str],
        *,
        context: str,
        wall_deadline: float,
    ) -> dict[str, Any]:
        argv = [self.config.piqc, *arguments]
        timeout_seconds = self._remaining(wall_deadline, context=context)
        try:
            completed = self.command_runner(
                argv,
                capture_output=True,
                check=False,
                text=True,
                timeout=timeout_seconds,
            )
        except subprocess.TimeoutExpired as exc:
            raise DriverError(f"{context} transport timed out") from exc
        except OSError as exc:
            raise DriverError(f"cannot execute piqc for {context}: {exc}") from exc
        if completed.returncode != 0:
            stderr = completed.stderr.strip()
            if len(stderr) > 1000:
                stderr = stderr[:1000] + "..."
            raise DriverError(f"{context} failed with exit {completed.returncode}: {stderr}")
        return parse_json_object(completed.stdout, context=context)

    def solve(
        self,
        candidate: bytes,
        *,
        command_count: int,
        call_index: int,
        purpose: str,
        assertion_indices: Sequence[int],
        omitted_assertion_index: int | None,
        wall_deadline: float,
    ) -> dict[str, Any]:
        label = f"{self.config.label_prefix}:{self.config.surface}:{call_index:04d}:{purpose}"
        created = self._run_json(
            [
                "session",
                "new",
                "--solver",
                self.config.solver,
                "--lane",
                "smt",
                "--label",
                label,
            ],
            context="piqc session new",
            wall_deadline=wall_deadline,
        )
        session_id = created.get("id")
        if not isinstance(session_id, str) or not session_id:
            raise DriverError("piqc session new omitted a nonempty session id")
        if session_id in self.seen_session_ids:
            raise DriverError("piqc reused a session id; fresh-session contract violated")
        self.seen_session_ids.add(session_id)
        if created.get("lane") != "smt" or created.get("state") != "live":
            raise DriverError("piqc created a session with the wrong lane or state")
        if created.get("solver_name") != self.config.solver:
            raise DriverError("piqc created a session with the wrong solver")
        solver_signature = created.get("solver_signature")
        solver_sha256 = created.get("solver_sha256")
        if not isinstance(solver_signature, str) or not solver_signature.startswith("z3-"):
            raise DriverError("piqc session omitted the z3 solver signature")
        if not isinstance(solver_sha256, str) or re.fullmatch(r"[0-9a-f]{64}", solver_sha256) is None:
            raise DriverError("piqc session omitted a valid solver SHA-256")

        receipt_captured = False
        with tempfile.TemporaryDirectory(prefix="rigid221-common-core-piqd-") as temporary:
            candidate_path = Path(temporary) / "candidate.smt2"
            candidate_path.write_bytes(candidate)
            asserted = self._run_json(
                [
                    "session",
                    "assert",
                    session_id,
                    "--expect-commands",
                    "0",
                    "--file",
                    str(candidate_path),
                ],
                context="piqc session assert",
                wall_deadline=wall_deadline,
            )
            if asserted.get("added") != command_count or asserted.get("commands") != command_count:
                raise DriverError("piqc did not append the exact expected command count")
            solved = self._run_json(
                [
                    "session",
                    "solve",
                    session_id,
                    "--timeout-ms",
                    str(self.config.timeout_ms),
                    "--no-model",
                ],
                context="piqc session solve",
                wall_deadline=wall_deadline,
            )
            status = solved.get("status")
            if status not in VALID_VERDICTS:
                raise DriverError(f"piqc returned unsupported solve status: {status!r}")
            if solved.get("replayed") not in {False, None}:
                raise DriverError("fresh PiQd session unexpectedly replayed a prior solve")
            solve_index = solved.get("solve_index")
            if solve_index != 1:
                raise DriverError("fresh PiQd session did not record solve index 1")
            receipts = self._run_json(
                ["session", "receipts", session_id],
                context="piqc session receipts",
                wall_deadline=wall_deadline,
            )
            records = receipts.get("receipts")
            if receipts.get("session_id") != session_id:
                raise DriverError("receipt response names the wrong session")
            if receipts.get("count") != 1 or not isinstance(records, list) or len(records) != 1:
                raise DriverError("fresh PiQd session must have exactly one receipt")
            receipt = records[0]
            if not isinstance(receipt, dict):
                raise DriverError("PiQd receipt is not an object")
            expected_sha256 = sha256_bytes(candidate)
            expected_receipt_fields = {
                "assumptions": [],
                "base_bytes": len(candidate),
                "base_commands": command_count,
                "base_sha256": expected_sha256,
                "include_model": False,
                "solve_index": 1,
                "solver_sha256": solver_sha256,
                "solver_signature": solver_signature,
                "status": status,
                "timeout_ms": self.config.timeout_ms,
            }
            for key, expected in expected_receipt_fields.items():
                if receipt.get(key) != expected:
                    raise DriverError(
                        f"PiQd receipt field {key!r} does not match the exact solve"
                    )
            receipt_captured = True

        closed: dict[str, Any] | None = None
        if self.config.close_sessions and receipt_captured:
            closed = self._run_json(
                ["session", "close", session_id],
                context="piqc session close",
                wall_deadline=wall_deadline,
            )
            if closed.get("id") != session_id or closed.get("state") != "closed":
                raise DriverError("piqc session close returned the wrong session or state")

        return {
            "asserted": asserted,
            "assertion_indices": list(assertion_indices),
            "call_index": call_index,
            "candidate_bytes": len(candidate),
            "candidate_commands": command_count,
            "candidate_sha256": sha256_bytes(candidate),
            "closed": closed,
            "created": created,
            "omitted_source_assertion_index": omitted_assertion_index,
            "purpose": purpose,
            "receipts": receipts,
            "session_id": session_id,
            "solve": solved,
            "status": status,
        }


@dataclass
class Budget:
    max_calls: int
    max_wall_seconds: float
    clock: Callable[[], float]
    calls: int = 0

    def __post_init__(self) -> None:
        if self.max_calls <= 0:
            raise DriverError("max-calls must be positive")
        if not math.isfinite(self.max_wall_seconds) or self.max_wall_seconds <= 0:
            raise DriverError("max-wall-seconds must be finite and positive")
        self.started_at = self.clock()

    def exhaustion(self) -> str | None:
        if self.calls >= self.max_calls:
            return "CALL_BUDGET"
        if self.clock() - self.started_at >= self.max_wall_seconds:
            return "WALL_BUDGET"
        return None

    def reserve(self) -> tuple[int, float]:
        reason = self.exhaustion()
        if reason is not None:
            raise DriverError(f"cannot reserve solve after {reason}")
        self.calls += 1
        return self.calls, self.started_at + self.max_wall_seconds

    def elapsed_ms(self) -> int:
        return max(0, round((self.clock() - self.started_at) * 1000))


def rendered_command_count(parsed: ParsedCandidate, selected: Sequence[int]) -> int:
    kept_header = sum(
        command.disposition == "header" for command in parsed.commands
    )
    return kept_header + len(FIXED_Z3_OPTIONS) + len(selected)


def _test_reference(trial: Mapping[str, Any]) -> dict[str, object]:
    return {
        "call_index": trial["call_index"],
        "candidate_sha256": trial["candidate_sha256"],
        "session_id": trial["session_id"],
        "status": trial["status"],
    }


@dataclass(frozen=True)
class RunConfig:
    input_path: Path
    output_json: Path
    output_smt2: Path
    necessity_ledger: Path
    timeout_ms: int
    max_calls: int
    max_wall_seconds: float
    minimize: bool
    piqc: str = "piqc"
    solver: str = "z3"
    close_sessions: bool = True
    label_prefix: str = "rigid221-s0-common-core"
    surface: str = "common"


def _validate_output_paths(config: RunConfig) -> None:
    paths = [
        config.input_path.resolve(),
        config.output_json.resolve(),
        config.output_smt2.resolve(),
        config.necessity_ledger.resolve(),
    ]
    if len(set(paths)) != len(paths):
        raise DriverError("input and output paths must all be distinct")


def run_driver(
    config: RunConfig,
    *,
    command_runner: CommandRunner = subprocess.run,
    clock: Callable[[], float] = monotonic,
) -> tuple[dict[str, Any], bytes, dict[str, Any]]:
    _validate_output_paths(config)
    try:
        source_bytes = config.input_path.read_bytes()
    except OSError as exc:
        raise DriverError(f"cannot read candidate SMT-LIB2: {exc}") from exc
    parsed = parse_candidate(source_bytes)
    selected = list(range(parsed.assertion_count))
    budget = Budget(config.max_calls, config.max_wall_seconds, clock)
    oracle = PiqcOracle(
        TrialConfig(
            piqc=config.piqc,
            solver=config.solver,
            timeout_ms=config.timeout_ms,
            close_sessions=config.close_sessions,
            label_prefix=config.label_prefix,
            surface=config.surface,
        ),
        command_runner=command_runner,
        clock=clock,
    )
    calls: list[dict[str, Any]] = []
    deletion_tests: dict[int, dict[str, object]] = {}
    necessity_tests: dict[int, dict[str, object]] = {}

    def solve_selected(
        purpose: str,
        candidate_indices: Sequence[int],
        omitted_index: int | None,
    ) -> dict[str, Any]:
        call_index, wall_deadline = budget.reserve()
        candidate = parsed.render(candidate_indices)
        trial = oracle.solve(
            candidate,
            command_count=rendered_command_count(parsed, candidate_indices),
            call_index=call_index,
            purpose=purpose,
            assertion_indices=candidate_indices,
            omitted_assertion_index=omitted_index,
            wall_deadline=wall_deadline,
        )
        calls.append(trial)
        return trial

    initial = solve_selected("initial", selected, None)
    initial_status = initial["status"]
    deletion_complete = False
    necessity_complete = False
    budget_phase: str | None = None
    budget_reason: str | None = None
    inconsistent_necessity = False

    if initial_status == "UNSAT" and config.minimize:
        for assertion_index in range(parsed.assertion_count):
            if assertion_index not in selected:
                continue
            reason = budget.exhaustion()
            if reason is not None:
                budget_phase = "deletion"
                budget_reason = reason
                break
            candidate_indices = [
                index for index in selected if index != assertion_index
            ]
            trial = solve_selected("deletion", candidate_indices, assertion_index)
            verdict = trial["status"]
            if verdict == "UNSAT":
                selected = candidate_indices
                decision = "DELETE_UNSAT"
            elif verdict == "SAT":
                decision = "RETAIN_SAT"
            else:
                decision = "RETAIN_UNKNOWN_FAIL_CLOSED"
            deletion_tests[assertion_index] = {
                "decision": decision,
                "test": _test_reference(trial),
            }
        else:
            deletion_complete = True

        if deletion_complete:
            final_snapshot = tuple(selected)
            for assertion_index in final_snapshot:
                reason = budget.exhaustion()
                if reason is not None:
                    budget_phase = "necessity"
                    budget_reason = reason
                    break
                candidate_indices = [
                    index for index in final_snapshot if index != assertion_index
                ]
                trial = solve_selected("necessity", candidate_indices, assertion_index)
                verdict = trial["status"]
                if verdict == "SAT":
                    classification = "NECESSARY_SAT"
                elif verdict == "UNKNOWN":
                    classification = "UNKNOWN_FAIL_CLOSED"
                else:
                    classification = "UNSAT_INCONSISTENT_FAIL_CLOSED"
                    inconsistent_necessity = True
                necessity_tests[assertion_index] = {
                    "classification": classification,
                    "test": _test_reference(trial),
                }
            else:
                necessity_complete = True

    final_smt2 = parsed.render(selected)
    retained_set = set(selected)
    ledger_entries: list[dict[str, object]] = []
    for assertion_index in selected:
        necessity = necessity_tests.get(assertion_index)
        if necessity is None:
            if budget_phase == "necessity":
                necessity = {
                    "classification": f"NOT_RUN_{budget_reason}",
                    "test": None,
                }
            elif not config.minimize or initial_status != "UNSAT":
                necessity = {"classification": "NOT_REQUESTED", "test": None}
            else:
                necessity = {
                    "classification": "NOT_RUN_DELETION_INCOMPLETE",
                    "test": None,
                }
        ledger_entries.append(
            {
                **parsed.assertion_record(assertion_index),
                "deletion": deletion_tests.get(assertion_index),
                "necessity": necessity,
            }
        )

    unknown_deletion_retained = any(
        entry.get("decision") == "RETAIN_UNKNOWN_FAIL_CLOSED"
        for index, entry in deletion_tests.items()
        if index in retained_set
    )
    unknown_necessity = any(
        entry.get("classification") == "UNKNOWN_FAIL_CLOSED"
        for entry in necessity_tests.values()
    )
    if initial_status == "SAT":
        status = "INITIAL_SAT"
    elif initial_status == "UNKNOWN":
        status = "INITIAL_UNKNOWN_FAIL_CLOSED"
    elif not config.minimize:
        status = "INITIAL_UNSAT"
    elif budget_reason is not None:
        status = f"{budget_phase.upper()}_{budget_reason}"
    elif inconsistent_necessity:
        status = "NECESSITY_INCONSISTENT_FAIL_CLOSED"
    elif unknown_necessity or (unknown_deletion_retained and not necessity_complete):
        status = "MINIMIZED_UNSAT_WITH_UNKNOWN_NECESSITY"
    else:
        status = "MINIMIZED_UNSAT"

    locally_irredundant = (
        initial_status == "UNSAT"
        and config.minimize
        and deletion_complete
        and necessity_complete
        and not inconsistent_necessity
        and not unknown_necessity
        and all(
            entry["classification"] == "NECESSARY_SAT"
            for entry in necessity_tests.values()
        )
    )
    ledger: dict[str, Any] = {
        "entries": ledger_entries,
        "input_sha256": sha256_bytes(source_bytes),
        "locally_irredundant": locally_irredundant,
        "minimized_smt2_sha256": sha256_bytes(final_smt2),
        "schema": LEDGER_SCHEMA,
        "status": status,
    }
    report: dict[str, Any] = {
        "assertions": {
            "deleted_source_assertion_indices": [
                index for index in range(parsed.assertion_count) if index not in retained_set
            ],
            "initial_count": parsed.assertion_count,
            "retained_count": len(selected),
            "retained_source_assertion_indices": selected,
        },
        "budget": {
            "calls_used": budget.calls,
            "elapsed_ms": budget.elapsed_ms(),
            "max_calls": config.max_calls,
            "max_wall_seconds": config.max_wall_seconds,
            "termination_phase": budget_phase,
            "termination_reason": budget_reason,
        },
        "calls": calls,
        "configuration": {
            "close_sessions": config.close_sessions,
            "fixed_z3_options": list(FIXED_Z3_OPTIONS),
            "label_prefix": config.label_prefix,
            "max_calls": config.max_calls,
            "max_wall_seconds": config.max_wall_seconds,
            "minimize": config.minimize,
            "piqc": config.piqc,
            "solver": config.solver,
            "surface": config.surface,
            "timeout_ms": config.timeout_ms,
        },
        "deletion_complete": deletion_complete,
        "initial_status": initial_status,
        "input": {
            "bytes": len(source_bytes),
            "path": str(config.input_path),
            "sha256": sha256_bytes(source_bytes),
        },
        "locally_irredundant": locally_irredundant,
        "minimized_smt2": {
            "bytes": len(final_smt2),
            "path": str(config.output_smt2),
            "sha256": sha256_bytes(final_smt2),
        },
        "necessity_complete": necessity_complete,
        "necessity_ledger": {
            "path": str(config.necessity_ledger),
            "sha256": sha256_bytes(canonical_json_bytes(ledger)),
        },
        "parser": {
            "replaced_fixed_option_count": parsed.replaced_fixed_option_count,
            "stripped_terminal_or_query_command_count": parsed.stripped_query_count,
        },
        "schema": RESULT_SCHEMA,
        "status": status,
    }
    return report, final_smt2, ledger


def _atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        dir=path.parent,
        prefix=f".{path.name}.",
        suffix=".tmp",
    )
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        temporary.unlink(missing_ok=True)


def write_outputs(
    config: RunConfig,
    report: Mapping[str, Any],
    minimized_smt2: bytes,
    ledger: Mapping[str, Any],
) -> None:
    ledger_bytes = canonical_json_bytes(ledger)
    report_bytes = canonical_json_bytes(report)
    _atomic_write(config.output_smt2, minimized_smt2)
    _atomic_write(config.necessity_ledger, ledger_bytes)
    _atomic_write(config.output_json, report_bytes)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Solve and deletion-minimize a flat QF_NRA formula through fresh PiQd sessions",
    )
    parser.add_argument("input", type=Path, help="flat QF_NRA SMT-LIB2 candidate")
    parser.add_argument("--output-json", type=Path, required=True)
    parser.add_argument("--output-smt2", type=Path, required=True)
    parser.add_argument("--necessity-ledger", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, required=True)
    parser.add_argument("--max-calls", type=int, required=True)
    parser.add_argument("--max-wall-seconds", type=float, required=True)
    parser.add_argument("--minimize", action="store_true")
    parser.add_argument("--piqc", default="piqc")
    parser.add_argument("--solver", default="z3")
    parser.add_argument(
        "--close-sessions",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="close each fresh session after its receipt is captured (default: true)",
    )
    parser.add_argument("--label-prefix", default="rigid221-s0-common-core")
    parser.add_argument("--surface", default="common")
    parser.add_argument("--verbose", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    arguments = build_parser().parse_args(argv)
    config = RunConfig(
        input_path=arguments.input,
        output_json=arguments.output_json,
        output_smt2=arguments.output_smt2,
        necessity_ledger=arguments.necessity_ledger,
        timeout_ms=arguments.timeout_ms,
        max_calls=arguments.max_calls,
        max_wall_seconds=arguments.max_wall_seconds,
        minimize=arguments.minimize,
        piqc=arguments.piqc,
        solver=arguments.solver,
        close_sessions=arguments.close_sessions,
        label_prefix=arguments.label_prefix,
        surface=arguments.surface,
    )
    try:
        report, minimized_smt2, ledger = run_driver(config)
        write_outputs(config, report, minimized_smt2, ledger)
    except DriverError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    if arguments.verbose:
        sys.stdout.buffer.write(canonical_json_bytes(report))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
