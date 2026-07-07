#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Supplementary (D-msolve) cross-check for the two-hit probe.

Encodes the PRIMARY configuration's equality skeleton in the (v,w) gauge:

  vars: ux,uy, s2x,s2y, q1x,q1y, q2x,q2y, pux,puy, oy, t1..t10
  eqs : u on the MEC circle centered (1/2, oy) through v, w;
        dist2(Pu,s2) = dist2(Pu,u);  dist2(Pu,Q1) = dist2(Pu,u);
        dist2(Pu,Q2) = dist2(Pu,u);
        per-pair Rabinowitsch distinctness for all 10 pairs among
        {u, s2, Q1, Q2, Pu}.

Expected verdict: positive-dimensional [1, n, -1, []].  Per (D-msolve) this
is NOT a real-SAT verdict (complex Groebner output decides nothing real);
it is recorded only as a cross-tool consistency check: the exact witness
lies on this variety, so an "empty" verdict here would contradict the
witness and flag an encoding bug.  The probe's SAT verdict rests on the
exact rational witness alone.

Also substitutes the witness into every generator and asserts exact zero.
"""
from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import probe_lib as PL

HERE = Path(__file__).parent

COORD = {
    "u": ("ux", "uy"), "s2": ("s2x", "s2y"), "Q1": ("q1x", "q1y"),
    "Q2": ("q2x", "q2y"), "Pu": ("pux", "puy"),
}
PAIR_LABELS = ["u", "s2", "Q1", "Q2", "Pu"]


def poly_d2_labels(a, b):
    return PL.poly_d2(COORD[a], COORD[b])


def main():
    witness = json.loads((HERE / "witness_two_hit.json").read_text())
    pts = {lab: (F(x), F(y)) for lab, (x, y) in witness["points"].items()}

    gens = []
    names = []
    # u on the MEC: (ux-1/2)^2 + (uy-oy)^2 - (1/4 + oy^2)
    # expanded (integer coeffs): ux^2 - ux + uy^2 - 2*uy*oy
    on_mec = PL.psub(
        PL.padd(PL.pmul(PL.psub(PL.coord_poly("ux"), PL.coord_poly(F(1, 2))),
                        PL.psub(PL.coord_poly("ux"), PL.coord_poly(F(1, 2)))),
                PL.pmul(PL.psub(PL.coord_poly("uy"), PL.coord_poly("oy")),
                        PL.psub(PL.coord_poly("uy"), PL.coord_poly("oy")))),
        PL.padd(PL.coord_poly(F(1, 4)),
                PL.pmul(PL.coord_poly("oy"), PL.coord_poly("oy"))))
    gens.append(on_mec)
    names.append("u_on_MEC")
    base = poly_d2_labels("Pu", "u")
    for m in ("s2", "Q1", "Q2"):
        gens.append(PL.psub(poly_d2_labels("Pu", m), base))
        names.append(f"pin[{m}]")
    tvars = []
    for i in range(len(PAIR_LABELS)):
        for j in range(i + 1, len(PAIR_LABELS)):
            a, b = PAIR_LABELS[i], PAIR_LABELS[j]
            tv = f"t{len(tvars) + 1}"
            tvars.append(tv)
            gens.append(PL.psub(PL.pmul({(tv,): F(1)}, poly_d2_labels(a, b)),
                                {(): F(1)}))
            names.append(f"rab[{a}!={b}]")

    variables = ["ux", "uy", "s2x", "s2y", "q1x", "q1y", "q2x", "q2y",
                 "pux", "puy", "oy"] + tvars

    # exact witness substitution (including t-values 1/dist2)
    subs = {}
    for lab, (vx, vy) in COORD.items():
        subs[vx], subs[vy] = pts[lab]
    subs["oy"] = F(witness["frame"]["mec_center"][1])
    ti = 0
    for i in range(len(PAIR_LABELS)):
        for j in range(i + 1, len(PAIR_LABELS)):
            a, b = PAIR_LABELS[i], PAIR_LABELS[j]
            dd = ((pts[a][0] - pts[b][0]) ** 2 + (pts[a][1] - pts[b][1]) ** 2)
            ti += 1
            subs[f"t{ti}"] = 1 / dd

    def eval_poly(p):
        total = F(0)
        for mono, coeff in p.items():
            val = coeff
            for v in mono:
                val *= subs[v]
            total += val
        return total

    print("witness substitution into every skeleton generator:")
    all_zero = True
    for name, g in zip(names, gens):
        val = eval_poly(g)
        ok = val == 0
        all_zero &= ok
        print(f"  [{'PASS' if ok else 'FAIL'}] {name} -> {val}")
    if not all_zero:
        print("FATAL: witness does not satisfy the skeleton")
        sys.exit(1)

    ms_path = HERE / "primary_skeleton.ms"
    PL.write_ms(ms_path, variables, [PL.poly_to_str(g) for g in gens])
    print(f"\nmsolve on {ms_path} ({len(variables)} vars, {len(gens)} eqs)")
    verdict = PL.parse_msolve_output(PL.run_msolve(ms_path, timeout_s=600))
    print(f"  verdict: {verdict}")
    if verdict["kind"] == "empty":
        print("FATAL: skeleton C-empty contradicts the exact witness")
        sys.exit(1)
    print("  consistent with the witness (posdim/zerodim expected; per "
          "(D-msolve) this tuple is not itself a real-SAT verdict)")


if __name__ == "__main__":
    main()
