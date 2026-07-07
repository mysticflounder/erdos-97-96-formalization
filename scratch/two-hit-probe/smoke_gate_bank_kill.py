#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Smoke gate (ii) for the two-hit probe: reproduce known pinned-bank kills.

Steps (all must pass, else the probe STOPS):
  0. msolve verdict-parser micro-sanity on three trivial systems.
  1. s1_000 (bank verdict C_EMPTY): run msolve on the STORED rvol .ms input
     -> must be [-1] (C-empty = UNSAT over the algebraic closure, hence UNSAT).
  2. Rebuild s1_000's 30 equations from the bank JSON with THIS probe's own
     encoder (probe_lib.class_equations, (v,w) gauge) and compare the
     polynomial systems as canonical multisets against the stored .ms.
     Then run msolve on the rebuilt file -> must be [-1] again.
  3. s1_002 (bank verdict NO_VALID_REAL, forced pair u=v): rebuild the 30
     equations + THIS probe's Rabinowitsch generator t*dist2(u,v)-1 and
     certify the kill with Singular std unit-ideal (the project's own kill
     certificate format for the 133 forced-collapse rows).

Outputs: smoke_gate_bank_kill.log, and .ms artifacts in this directory.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import probe_lib as PL

HERE = Path(__file__).parent
REPO = HERE.parent.parent
BANK = REPO / "certificates" / "surplus" / "pinned_surplus_comp_g_bank.json"
RVOL_INPUTS = (REPO.parent / "p97-rvol" / "scratch" / "u2b_ssel_fragment"
               / "comp_g" / "inputs")

LOG = []


def log(msg):
    print(msg)
    LOG.append(msg)


def fail(msg):
    log(f"GATE FAILURE: {msg}")
    (HERE / "smoke_gate_bank_kill.log").write_text("\n".join(LOG) + "\n")
    sys.exit(1)


def micro_sanity():
    cases = [
        ("unit ideal -> empty", ["x", "y"], ["x - 1", "x - 2"], "empty"),
        ("zero-dim, no real  ", ["x", "y"], ["x^2 + 1", "y - 1"], "zerodim0"),
        ("positive-dim       ", ["x", "y"], ["x - y"], "posdim"),
    ]
    for name, variables, gens, expect in cases:
        path = HERE / f"_micro_{expect}.ms"
        PL.write_ms(path, variables, gens)
        verdict = PL.parse_msolve_output(PL.run_msolve(path, timeout_s=60))
        got = verdict["kind"] + (str(verdict.get("nsols", ""))
                                 if verdict["kind"] == "zerodim" else "")
        ok = got == expect
        log(f"  micro [{name}] expect {expect} got {got}: "
            f"{'PASS' if ok else 'FAIL'}")
        if not ok:
            fail(f"msolve micro-sanity {name}")


def bank_row(bank, pid):
    for row in bank["rows"]:
        if row["pid"] == pid:
            return row
    fail(f"pid {pid} not in bank")


def canonical_polyset(poly_strs, varset):
    """Multiset of canonical poly dicts, as sorted tuples for comparison.
    Normalized up to overall sign is NOT applied: the convention must match
    exactly (base-member first, subtrahend second)."""
    out = []
    for s in poly_strs:
        p = PL.parse_poly_str(s, varset)
        out.append(tuple(sorted((m, c) for m, c in p.items())))
    return sorted(out)


def main():
    log("== two-hit probe, smoke gate (ii): pinned-bank kill reproduction ==")
    log("")
    log("step 0: msolve verdict-parser micro-sanity")
    micro_sanity()
    log("")

    bank = json.loads(BANK.read_text())
    assert bank["schema"] == "pinned_surplus_comp_g_bank.v2"

    # ---- step 1: stored s1_000 must be C-empty --------------------------
    row0 = bank_row(bank, "s1_000")
    assert row0["comp_g"]["final_verdict"] == "C_EMPTY"
    stored = RVOL_INPUTS / "s1_000.ms"
    log(f"step 1: msolve on stored {stored}")
    verdict = PL.parse_msolve_output(PL.run_msolve(stored, timeout_s=600))
    log(f"  verdict: {verdict}")
    if verdict["kind"] != "empty":
        fail("stored s1_000 did not reproduce C_EMPTY")
    log("  PASS: stored s1_000 -> [-1] (C-empty), matching bank verdict")
    log("")

    # ---- step 2: rebuild s1_000 with this probe's encoder ---------------
    log("step 2: rebuild s1_000 equations with probe_lib encoder, compare")
    variables, stored_gens = PL.read_ms(stored)
    if variables != PL.VAR_ORDER:
        fail(f"variable order mismatch: {variables}")
    polys, meta = PL.class_equations(row0["classes"])
    if len(polys) != 30:
        fail(f"expected 30 equations, got {len(polys)}")
    mine = canonical_polyset([PL.poly_to_str(p) for p in polys],
                             set(PL.VAR_ORDER))
    theirs = canonical_polyset(stored_gens, set(PL.VAR_ORDER))
    if mine != theirs:
        n_common = len([x for x in mine if x in theirs])
        fail(f"rebuilt polynomial multiset differs from stored "
             f"({n_common}/30 in common)")
    log("  PASS: 30 rebuilt generators == stored generators "
        "(canonical multiset equality)")
    rebuilt = HERE / "gate2_s1_000_rebuilt.ms"
    PL.write_ms(rebuilt, PL.VAR_ORDER, [PL.poly_to_str(p) for p in polys])
    verdict = PL.parse_msolve_output(PL.run_msolve(rebuilt, timeout_s=600))
    log(f"  msolve on rebuilt file: {verdict}")
    if verdict["kind"] != "empty":
        fail("rebuilt s1_000 not C-empty")
    log("  PASS: rebuilt s1_000 -> [-1]")
    log("")

    # ---- step 3: forced-collapse row + Rabinowitsch ----------------------
    row2 = bank_row(bank, "s1_002")
    assert row2["comp_g"]["final_verdict"] == "NO_VALID_REAL"
    pair = row2["comp_g"]["forced_pair"]
    log(f"step 3: s1_002 (NO_VALID_REAL, forced pair {pair}) + Rabinowitsch")
    a, b = pair.split("=")
    polys2, _ = PL.class_equations(row2["classes"])
    rab = PL.rabinowitsch_poly(a, b)
    gens2 = [PL.poly_to_str(p) for p in polys2] + [PL.poly_to_str(rab)]
    vars2 = PL.VAR_ORDER + ["t"]
    rebuilt2 = HERE / "gate2_s1_002_rab.ms"
    PL.write_ms(rebuilt2, vars2, gens2)
    log(f"  Rabinowitsch generator: {PL.poly_to_str(rab)}")
    status = PL.singular_unit_ideal(vars2, gens2, timeout_s=600)
    log(f"  Singular std unit-ideal test: {status}")
    if status != "unit":
        fail("s1_002 + Rabinowitsch(u=v) did not produce the unit ideal")
    log("  PASS: s1_002 + t*dist2(u,v)-1 -> unit ideal "
        "(the bank's kill certificate format)")
    log("")
    log("SMOKE GATE (ii): ALL PASS")
    (HERE / "smoke_gate_bank_kill.log").write_text("\n".join(LOG) + "\n")


if __name__ == "__main__":
    main()
