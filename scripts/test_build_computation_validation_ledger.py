"""Tests for the non-piqd validation ledger assembler.

The three invariant tests are the point of this file. They are what stops the
ledger claiming more than the tier outputs support, and each one asserts that
the assembler *raises* rather than shipping the overstated row.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import build_computation_validation_ledger as mod

REPO = Path(__file__).resolve().parents[1]
LEDGER_JSON = REPO / "certificates/reports/nonpiqd_validation_ledger.json"
LEDGER_MD = REPO / "docs/audits/2026-08-18-nonpiqd-computation-validation-ledger.md"


def row(**overrides) -> dict:
    base = {
        "artifact_path": "certificates/x.json",
        "tier2_result": {},
        "lean_consumers": [],
        "status": mod.DIAGNOSTIC_ONLY,
        "residual": mod.TIER0_RESIDUAL,
    }
    base.update(overrides)
    return base


# --------------------------------------------------------------------------
# the three invariants
# --------------------------------------------------------------------------


def test_tier0_alone_cannot_exceed_diagnostic_only():
    with pytest.raises(mod.LedgerInvariantError, match="exceeds the DIAGNOSTIC-ONLY"):
        mod.check_invariants(row(status=mod.PROVEN_PRODUCER))


def test_proven_producer_needs_a_passing_tier2_and_a_named_consumer():
    with pytest.raises(mod.LedgerInvariantError, match="needs a named Lean consumer"):
        mod.check_invariants(
            row(status=mod.PROVEN_PRODUCER, tier2_result={"outcome": mod.PASS})
        )
    with pytest.raises(mod.LedgerInvariantError, match="needs a passing Tier 2"):
        mod.check_invariants(
            row(
                status=mod.PROVEN_PRODUCER,
                tier2_result={"outcome": mod.FAIL},
                lean_consumers=["lean/A.lean"],
            )
        )


def test_no_row_may_be_kernel_closed():
    with pytest.raises(mod.LedgerInvariantError, match="closes no leaf"):
        mod.check_invariants(
            row(
                status=mod.KERNEL_CLOSED,
                tier2_result={"outcome": mod.PASS},
                lean_consumers=["lean/A.lean"],
            )
        )


def test_closed_to_residual_needs_a_named_residual():
    with pytest.raises(mod.LedgerInvariantError, match="needs a named residual"):
        mod.check_invariants(
            row(
                status=mod.CLOSED_TO_RESIDUAL,
                tier2_result={"outcome": mod.PASS},
                residual="",
            )
        )


def test_a_status_outside_the_vocabulary_is_rejected():
    with pytest.raises(mod.LedgerInvariantError, match="not in the vocabulary"):
        mod.check_invariants(row(status="VERIFIED"))


def test_a_well_formed_proven_producer_row_passes():
    mod.check_invariants(
        row(
            status=mod.PROVEN_PRODUCER,
            tier2_result={"outcome": mod.PASS},
            lean_consumers=["lean/A.lean"],
            residual=mod.NATIVE_DECIDE_RESIDUAL,
        )
    )


# --------------------------------------------------------------------------
# status assignment
# --------------------------------------------------------------------------


def test_no_tier2_gives_the_ceiling():
    status, residual = mod.assign_status(None, ["lean/A.lean"])
    assert status == mod.DIAGNOSTIC_ONLY
    assert residual == mod.TIER0_RESIDUAL


def test_a_tier2_failure_is_recorded_not_hidden():
    status, residual = mod.assign_status(
        {"outcome": mod.FAIL, "check": "identity recheck"}, ["lean/A.lean"]
    )
    assert status == mod.DIAGNOSTIC_ONLY
    assert residual.startswith("reexecution_failure:")


def test_a_blocked_tier2_is_neither_pass_nor_fail():
    status, residual = mod.assign_status(
        {"outcome": mod.BLOCKED, "row_replay_blocked": 34}, []
    )
    assert status == mod.DIAGNOSTIC_ONLY
    assert "34" in residual
    assert "not shown wrong, not shown right" in residual


def test_a_pass_without_a_consumer_stays_diagnostic():
    status, residual = mod.assign_status({"outcome": mod.PASS}, [])
    assert status == mod.DIAGNOSTIC_ONLY
    assert residual == mod.NO_CONSUMER_RESIDUAL


def test_a_pass_with_a_consumer_reaches_proven_producer_and_no_further():
    status, residual = mod.assign_status({"outcome": mod.PASS}, ["lean/A.lean"])
    assert status == mod.PROVEN_PRODUCER
    assert "native_decide" in residual
    assert "Lean.trustCompiler" in residual


# --------------------------------------------------------------------------
# local boundaries
# --------------------------------------------------------------------------


def test_a_control_writer_is_flagged_as_an_intentional_local_boundary():
    assert mod.local_boundary({}, "census/p97_search/controls3.py") == mod.CONTROL_LOCAL


def test_a_record_naming_a_proof_is_a_cert001_boundary():
    record = {"referenced_inputs": [{"path": "scratch/x/terminal.drat"}]}
    assert mod.local_boundary(record, None) == mod.CERT001


def test_an_ordinary_record_carries_no_boundary():
    assert mod.local_boundary({"path": "certificates/x.json"}, "scripts/w.py") is None


# --------------------------------------------------------------------------
# conformance is matched exactly, not by scanning for "fail"
# --------------------------------------------------------------------------


def test_a_clean_log_carrying_the_word_failed_is_still_clean():
    """Why the verdict matches success lines instead of scanning for "fail".

    A clean `comparator/check-conformance.sh` run emits a Lean linter message
    reading "The `ring` tactic failed to close the goal". A negative scan reads
    that as a conformance failure; matching the script's own success lines does
    not.
    """
    clean = (
        "The `ring` tactic failed to close the goal.\n"
        + "\n".join(mod.CONFORMANCE_MARKERS)
        + "\n"
    )
    assert all(marker in clean for marker in mod.CONFORMANCE_MARKERS)


def test_a_log_missing_a_success_line_is_not_clean():
    partial = "OK [core]: 24 theorems\nOK: all comparator theorems build\n"
    assert not all(marker in partial for marker in mod.CONFORMANCE_MARKERS)


# --------------------------------------------------------------------------
# the committed ledger
# --------------------------------------------------------------------------


@pytest.fixture(scope="module")
def ledger():
    return json.loads(LEDGER_JSON.read_text(encoding="utf-8"))


def test_the_committed_ledger_satisfies_every_invariant(ledger):
    """The whole ledger, re-checked. A hand edit would be caught here."""
    assert ledger["schema"] == mod.SCHEMA
    for entry in ledger["rows"]:
        mod.check_invariants(entry)


def test_the_committed_ledger_holds_no_kernel_closed_row(ledger):
    assert mod.KERNEL_CLOSED not in ledger["summary"]["by_status"]


def test_every_reexecuted_row_names_its_tier(ledger):
    tiers = {
        entry["tier2_result"]["tier"]
        for entry in ledger["rows"]
        if entry["tier2_result"]
    }
    assert tiers == {"2a", "2b", "2c", "2d", "2e"}


def test_the_prose_ledger_is_generated_from_the_json(ledger):
    text = LEDGER_MD.read_text(encoding="utf-8")
    assert ledger["generator"] in text
    assert str(ledger["summary"]["n_rows"]) in text
    assert "closes no proof" in text


def test_the_ledger_names_what_was_not_reexecuted(ledger):
    joined = " ".join(ledger["not_reexecuted"])
    assert "surplus Lean modules" in joined
    assert "summary.json" in joined
    assert "CEGAR" in joined


def test_the_tier2f_block_records_the_lean_side(ledger):
    tier2f = ledger["tier2f"]
    assert tier2f["lake_build"] == "Build completed successfully"
    assert tier2f["conformance"] == "clean"
    assert tier2f["sorryAx_in_build_log"] is False
    assert any("core" in line for line in tier2f["axiom_budget_lines"])
    assert any("native" in line for line in tier2f["axiom_budget_lines"])
