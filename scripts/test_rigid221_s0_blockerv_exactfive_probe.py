#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Small contract tests for the bounded BlockerV exact-five probe.

The probe is deliberately a bounded QF_NRA experiment.  These tests pin only
the finite role/order and serialization contracts; they do not classify the
main nonlinear system as satisfiable or unsatisfiable.
"""

from __future__ import annotations

import sys
from pathlib import Path

import pytest

z3 = pytest.importorskip("z3")

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_blockerv_exactfive_probe as mod


EXPECTED_ROLES = (
    "O",
    "m1",
    "m2",
    "u",
    "xu",
    "delta",
    "v",
    "xv",
    "au",
    "bu",
    "av",
    "bv",
    "cv",
)
EXPECTED_ORDER = (
    "O",
    "au",
    "av",
    "delta",
    "m1",
    "v",
    "u",
    "xu",
    "m2",
    "xv",
    "bv",
    "bu",
    "cv",
)
EXPECTED_NON_MOSER_ARMS = {
    "u": 2,
    "xu": 2,
    "delta": 1,
    "v": 2,
    "xv": 0,
    "au": 1,
    "bu": 0,
    "av": 1,
    "bv": 0,
    "cv": 0,
}


def test_role_and_fixed_order_contract() -> None:
    """The five physical labels and their cyclic order are canonical."""

    assert tuple(mod.ROLE_ORDER) == EXPECTED_ROLES
    assert tuple(mod.ORDER) == EXPECTED_ORDER
    assert len(mod.ROLE_ORDER) == 13
    assert len(set(mod.ROLE_ORDER)) == 13
    assert set(mod.ORDER) == set(EXPECTED_ROLES)


def test_exact_j_cap_arm_layout() -> None:
    """Every modeled physical role is placed on the designated exact-J arm."""

    assert mod.EXACT_J == frozenset({"u", "xu", "v"})
    assert {
        role for role in EXPECTED_NON_MOSER_ARMS if mod.cap_arm(role) == 2
    } == mod.EXACT_J
    assert {
        role: mod.cap_arm(role) for role in EXPECTED_NON_MOSER_ARMS
    } == EXPECTED_NON_MOSER_ARMS
    with pytest.raises((getattr(mod, "VerificationError", ValueError), ValueError)):
        mod.cap_arm("rogue")


def test_smt2_export_is_deterministic_qf_nra() -> None:
    first = mod.export_smt2()
    second = mod.export_smt2()

    assert isinstance(first, str)
    assert first == second
    assert first.startswith("(set-logic QF_NRA)\n")
    assert "(check-sat)" in first


def test_contradictory_solver_mutation_is_unsat() -> None:
    solver = mod.build_solver(timeout_ms=100)
    solver.add(False)
    assert solver.check() == z3.unsat


def test_smoke_returns_a_bounded_observation_without_sat_claim() -> None:
    result = mod.run_smoke(timeout_ms=1)

    assert isinstance(result, dict)
    assert "status" in result
