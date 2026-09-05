# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for the clause-preserving exact-13 QF_UF converter."""

from __future__ import annotations

import json

import pytest
from cardge13_literal_qfuf_to_dimacs import (
    CEGAR_EVENT_SCHEMA,
    ConversionError,
    conversion_manifest,
    learned_cuts_from_event,
    parse_literal_qfuf,
    render_dimacs,
    sha256_bytes,
)

SOURCE = """\
(set-logic QF_UF)
(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(assert a)
(assert (not b))
(assert (or (not a) b c))
"""


def test_clause_preserving_conversion_and_manifest() -> None:
    cnf = parse_literal_qfuf(SOURCE)
    assert cnf.symbols == ("a", "b", "c")
    assert cnf.clauses == ((1,), (-2,), (-1, 2, 3))
    assert (cnf.positive_units, cnf.negative_units, cnf.disjunctions) == (1, 1, 1)

    source_payload = SOURCE.encode("ascii")
    dimacs = render_dimacs(cnf, sha256_bytes(source_payload))
    assert dimacs.endswith(b"p cnf 3 3\n1 0\n-2 0\n-1 2 3 0\n")
    manifest = conversion_manifest(cnf, source_payload, dimacs)
    assert manifest["dimacs"]["sha256"] == sha256_bytes(dimacs)
    assert manifest["variables"] == [
        {"dimacs": 1, "symbol": "a"},
        {"dimacs": 2, "symbol": "b"},
        {"dimacs": 3, "symbol": "c"},
    ]


def test_extracts_dense_terminal_unsat_refinement_cuts() -> None:
    event = {
        "schema": CEGAR_EVENT_SCHEMA,
        "journal_sha256": sha256_bytes(SOURCE.encode("ascii")),
        "cegar_statuses": ["UNSAT"],
        "solves": [
            {
                "cegar_status": "UNSAT",
                "closed": {"solves": 2},
                "iterations": [
                    {
                        "cut": "(assert (or (not a) b))",
                        "index": 0,
                        "solved": {"status": "SAT"},
                    },
                    {
                        "index": 1,
                        "solved": {"status": "UNSAT", "terminal_unsat": True},
                    },
                ],
            }
        ],
    }
    event_payload = json.dumps(event).encode()
    cuts = learned_cuts_from_event(
        event_payload,
        source_sha256=sha256_bytes(SOURCE.encode("ascii")),
        source_assertions=frozenset(SOURCE.splitlines()),
    )
    assert cuts == ("(assert (or (not a) b))",)


def test_rejects_event_with_wrong_journal_digest() -> None:
    event_payload = json.dumps(
        {
            "schema": CEGAR_EVENT_SCHEMA,
            "journal_sha256": "0" * 64,
            "cegar_statuses": ["UNSAT"],
            "solves": [],
        }
    ).encode()
    with pytest.raises(ConversionError, match="journal digest"):
        learned_cuts_from_event(
            event_payload,
            source_sha256=sha256_bytes(SOURCE.encode("ascii")),
            source_assertions=frozenset(SOURCE.splitlines()),
        )


@pytest.mark.parametrize(
    "bad_source",
    [
        "(declare-const a Bool)\n(assert a)\n",
        "(set-logic QF_UF)\n(declare-const a Bool)\n(declare-const a Bool)\n(assert a)\n",
        "(set-logic QF_UF)\n(declare-const a Bool)\n(assert b)\n",
        "(set-logic QF_UF)\n(declare-const a Bool)\n(assert (= a true))\n",
        "(set-logic QF_UF)\n(declare-const a Bool)\n(assert (or a a))\n",
        "(set-logic QF_UF)\n(declare-const a Bool)\n(assert (or a (not a)))\n",
        "(set-logic QF_UF)\n(declare-const a Bool)\n(assert a)\n(declare-const b Bool)\n",
    ],
)
def test_rejects_unsupported_or_ambiguous_inputs(bad_source: str) -> None:
    with pytest.raises(ConversionError):
        parse_literal_qfuf(bad_source)
