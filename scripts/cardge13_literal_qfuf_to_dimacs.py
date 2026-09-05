#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Convert the exact-13 literal QF_UF journal to hash-bound DIMACS.

The accepted SMT-LIB fragment is deliberately small: Boolean declarations and
unit or disjunctive clauses whose literals are declared Boolean symbols.  The
converter rejects every other command or term instead of applying a Tseitin
translation, so each emitted DIMACS clause is visibly the corresponding source
assertion.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from dataclasses import dataclass
from pathlib import Path

SCHEMA = "cardge13-literal-qfuf-dimacs/v1"
CEGAR_EVENT_SCHEMA = (
    "cardge13-exact13-global-source-cell-boolean-path-pair-resume-piqd/v1"
)
NAME = r"[A-Za-z_][A-Za-z0-9_]*"
DECLARE_RE = re.compile(rf"\(declare-const ({NAME}) Bool\)")
POSITIVE_UNIT_RE = re.compile(rf"\(assert ({NAME})\)")
NEGATIVE_UNIT_RE = re.compile(rf"\(assert \(not ({NAME})\)\)")
OR_RE = re.compile(r"\(assert \(or (.+)\)\)")
LITERAL_RE = re.compile(rf"\(not (?P<negative>{NAME})\)|(?P<positive>{NAME})")


class ConversionError(ValueError):
    """The input is outside the source-auditable literal CNF fragment."""


@dataclass(frozen=True)
class LiteralCnf:
    """A declaration-ordered Boolean CNF parsed from the accepted fragment."""

    symbols: tuple[str, ...]
    clauses: tuple[tuple[int, ...], ...]
    positive_units: int
    negative_units: int
    disjunctions: int


def sha256_bytes(payload: bytes) -> str:
    """Return the lowercase SHA-256 digest of ``payload``."""

    return hashlib.sha256(payload).hexdigest()


def _parse_or_body(body: str, numbers: dict[str, int], line_number: int) -> tuple[int, ...]:
    literals: list[int] = []
    cursor = 0
    for match in LITERAL_RE.finditer(body):
        separator = body[cursor : match.start()]
        if separator != ("" if cursor == 0 else " "):
            raise ConversionError(f"malformed literal list on line {line_number}")
        symbol = match.group("negative") or match.group("positive")
        if symbol not in numbers:
            raise ConversionError(
                f"undeclared Boolean symbol {symbol!r} on line {line_number}"
            )
        literal = numbers[symbol]
        if match.group("negative") is not None:
            literal = -literal
        literals.append(literal)
        cursor = match.end()
    if cursor != len(body) or not literals:
        raise ConversionError(f"malformed literal list on line {line_number}")
    if len({abs(literal) for literal in literals}) != len(literals):
        raise ConversionError(
            f"duplicate or complementary literal on line {line_number}"
        )
    return tuple(literals)


def parse_literal_qfuf(source: str) -> LiteralCnf:
    """Parse the exact declaration-plus-clause QF_UF fragment fail-closed."""

    symbols: list[str] = []
    numbers: dict[str, int] = {}
    clauses: list[tuple[int, ...]] = []
    logic_seen = False
    assertions_seen = False
    positive_units = 0
    negative_units = 0
    disjunctions = 0

    for line_number, raw_line in enumerate(source.splitlines(), 1):
        line = raw_line.strip()
        if not line or line.startswith(";"):
            continue
        if line == "(set-logic QF_UF)":
            if logic_seen or symbols or clauses:
                raise ConversionError(f"misplaced or duplicate set-logic on line {line_number}")
            logic_seen = True
            continue
        declaration = DECLARE_RE.fullmatch(line)
        if declaration is not None:
            if not logic_seen or assertions_seen:
                raise ConversionError(f"misplaced declaration on line {line_number}")
            symbol = declaration.group(1)
            if symbol in numbers:
                raise ConversionError(f"duplicate declaration {symbol!r} on line {line_number}")
            symbols.append(symbol)
            numbers[symbol] = len(symbols)
            continue
        if not logic_seen or not symbols:
            raise ConversionError(f"assertion or command before declarations on line {line_number}")
        assertions_seen = True
        positive = POSITIVE_UNIT_RE.fullmatch(line)
        negative = NEGATIVE_UNIT_RE.fullmatch(line)
        disjunction = OR_RE.fullmatch(line)
        if positive is not None:
            symbol = positive.group(1)
            if symbol not in numbers:
                raise ConversionError(
                    f"undeclared Boolean symbol {symbol!r} on line {line_number}"
                )
            clauses.append((numbers[symbol],))
            positive_units += 1
        elif negative is not None:
            symbol = negative.group(1)
            if symbol not in numbers:
                raise ConversionError(
                    f"undeclared Boolean symbol {symbol!r} on line {line_number}"
                )
            clauses.append((-numbers[symbol],))
            negative_units += 1
        elif disjunction is not None:
            clauses.append(_parse_or_body(disjunction.group(1), numbers, line_number))
            disjunctions += 1
        else:
            raise ConversionError(f"unsupported SMT-LIB command on line {line_number}: {line}")

    if not logic_seen:
        raise ConversionError("missing (set-logic QF_UF)")
    if not symbols:
        raise ConversionError("no Boolean declarations")
    if not clauses:
        raise ConversionError("no asserted clauses")
    return LiteralCnf(
        tuple(symbols),
        tuple(clauses),
        positive_units,
        negative_units,
        disjunctions,
    )


def learned_cuts_from_event(
    event_payload: bytes,
    *,
    source_sha256: str,
    source_assertions: frozenset[str],
) -> tuple[str, ...]:
    """Extract and validate every dynamic cut from a terminal CEGAR event."""

    try:
        event = json.loads(event_payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ConversionError("CEGAR event is not valid UTF-8 JSON") from exc
    if not isinstance(event, dict) or event.get("schema") != CEGAR_EVENT_SCHEMA:
        raise ConversionError("unexpected CEGAR event schema")
    if event.get("journal_sha256") != source_sha256:
        raise ConversionError("CEGAR event journal digest does not match source")
    if event.get("cegar_statuses") != ["UNSAT"]:
        raise ConversionError("CEGAR event is not terminal UNSAT")
    solves = event.get("solves")
    if not isinstance(solves, list) or len(solves) != 1 or not isinstance(solves[0], dict):
        raise ConversionError("CEGAR event must contain exactly one solve record")
    solve = solves[0]
    if solve.get("cegar_status") != "UNSAT":
        raise ConversionError("solve record is not terminal UNSAT")
    iterations = solve.get("iterations")
    if not isinstance(iterations, list) or len(iterations) < 2:
        raise ConversionError("CEGAR event has no refinement sequence")
    terminal = iterations[-1]
    if (
        not isinstance(terminal, dict)
        or terminal.get("index") != len(iterations) - 1
        or not isinstance(terminal.get("solved"), dict)
        or terminal["solved"].get("status") != "UNSAT"
        or terminal["solved"].get("terminal_unsat") is not True
        or "cut" in terminal
    ):
        raise ConversionError("CEGAR refinement sequence lacks a final cut-free UNSAT solve")

    cuts: list[str] = []
    seen: set[str] = set(source_assertions)
    for expected_index, iteration in enumerate(iterations[:-1]):
        if not isinstance(iteration, dict) or iteration.get("index") != expected_index:
            raise ConversionError("CEGAR refinement indices are not dense and ordered")
        if (
            not isinstance(iteration.get("solved"), dict)
            or iteration["solved"].get("status") != "SAT"
        ):
            raise ConversionError("nonterminal CEGAR refinement is not SAT")
        cut = iteration.get("cut")
        if not isinstance(cut, str) or OR_RE.fullmatch(cut) is None:
            raise ConversionError("CEGAR refinement has a malformed learned cut")
        if cut in seen:
            raise ConversionError("CEGAR event repeats a source or learned cut")
        seen.add(cut)
        cuts.append(cut)
    if solve.get("closed", {}).get("solves") != len(iterations):
        raise ConversionError("CEGAR event solve count does not match iterations")
    return tuple(cuts)


def render_dimacs(cnf: LiteralCnf, source_sha256: str) -> bytes:
    """Render a deterministic DIMACS file bound to the source digest."""

    lines = [
        "c cardge13 literal QF_UF clause-preserving conversion",
        f"c source_sha256 {source_sha256}",
        f"p cnf {len(cnf.symbols)} {len(cnf.clauses)}",
    ]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in cnf.clauses)
    return ("\n".join(lines) + "\n").encode("ascii")


def conversion_manifest(
    cnf: LiteralCnf,
    source_payload: bytes,
    dimacs_payload: bytes,
    *,
    event_payload: bytes | None = None,
    learned_cut_count: int = 0,
) -> dict[str, object]:
    """Build the deterministic source/CNF custody and variable-map manifest."""

    unsigned: dict[str, object] = {
        "schema": SCHEMA,
        "source": {
            "byte_count": len(source_payload),
            "sha256": sha256_bytes(source_payload),
        },
        "dimacs": {
            "byte_count": len(dimacs_payload),
            "sha256": sha256_bytes(dimacs_payload),
            "variable_count": len(cnf.symbols),
            "clause_count": len(cnf.clauses),
        },
        "assertion_classes": {
            "positive_units": cnf.positive_units,
            "negative_units": cnf.negative_units,
            "disjunctions": cnf.disjunctions,
        },
        "variables": [
            {"dimacs": index, "symbol": symbol}
            for index, symbol in enumerate(cnf.symbols, 1)
        ],
    }
    if event_payload is not None:
        unsigned["cegar_event"] = {
            "byte_count": len(event_payload),
            "learned_cut_count": learned_cut_count,
            "sha256": sha256_bytes(event_payload),
        }
    canonical = json.dumps(unsigned, separators=(",", ":"), sort_keys=True).encode()
    return {**unsigned, "manifest_sha256": sha256_bytes(canonical)}


def main() -> int:
    """Convert one source journal and emit its DIMACS and manifest artifacts."""

    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("--event", type=Path)
    parser.add_argument("--out-cnf", type=Path, required=True)
    parser.add_argument("--out-manifest", type=Path, required=True)
    args = parser.parse_args()

    source_payload = args.source.read_bytes()
    try:
        source = source_payload.decode("ascii")
    except UnicodeDecodeError as exc:
        raise ConversionError("source journal is not ASCII") from exc
    event_payload: bytes | None = None
    learned_cuts: tuple[str, ...] = ()
    if args.event is not None:
        event_payload = args.event.read_bytes()
        learned_cuts = learned_cuts_from_event(
            event_payload,
            source_sha256=sha256_bytes(source_payload),
            source_assertions=frozenset(source.splitlines()),
        )
    combined_source = source + "".join(f"{cut}\n" for cut in learned_cuts)
    cnf = parse_literal_qfuf(combined_source)
    dimacs_payload = render_dimacs(cnf, sha256_bytes(source_payload))
    manifest = conversion_manifest(
        cnf,
        source_payload,
        dimacs_payload,
        event_payload=event_payload,
        learned_cut_count=len(learned_cuts),
    )

    args.out_cnf.parent.mkdir(parents=True, exist_ok=True)
    args.out_manifest.parent.mkdir(parents=True, exist_ok=True)
    args.out_cnf.write_bytes(dimacs_payload)
    args.out_manifest.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "clauses": len(cnf.clauses),
                "cnf_sha256": manifest["dimacs"]["sha256"],
                "manifest_sha256": manifest["manifest_sha256"],
                "variables": len(cnf.symbols),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
