#!/usr/bin/env python3
"""
certify.py -- FR 20-gon exact-certification driver (SPEC.md Sec 5).

Pipeline: producer (untrusted hint) -> checker (Krawczyk, trusted) ->
side conditions C1-C4 (trusted) -> certificate.json.

Run smoke.py FIRST (SPEC.md Sec 4): all four controls (G-DYADIC,
G-POS, G-NEG, G-SING) must pass before this script's FR-CERT result
counts. This script does not re-run smoke.py itself; it is a separate
gate per the deliverables list.

Exits nonzero on failure (Krawczyk contraction failure at both P=128
and P=256, or any side condition C1-C4 failing over the certified
box).
"""
from __future__ import annotations

import json
import os
import sys
from fractions import Fraction

import producer  # UNTRUSTED -- only m, r, Y, orientation_sign are used below
import krawczyk  # TRUSTED CORE
import dyadic     # TRUSTED CORE (imported transitively by krawczyk, named here for clarity)


def frac_to_str(f: Fraction) -> str:
    return f"{f.numerator}/{f.denominator}"


def interval_to_dict(iv) -> dict:
    return {"lo": frac_to_str(iv.lo), "hi": frac_to_str(iv.hi)}


K3_WITNESS_ARGUMENT = (
    "The certified box X satisfies K(X) subset interior(X) (Krawczyk "
    "operator, Neumaier 'Interval Methods for Systems of Equations', "
    "Thm 5.1.8), which proves EXISTENCE and UNIQUENESS of an exact real "
    "root v* of the 15-equation system F (SPEC.md Sec 1) inside X. By "
    "construction, each of the 15 equations E_ij(v*) = 0 holds EXACTLY "
    "(not merely to within interval width) at that root: "
    "dist(i_A, j_B) = 1 exactly for every unordered pair {i,j} in the "
    "15-pair edge list (and, by the built-in mirror symmetry, "
    "dist(j_A, i_B) = 1 exactly too). Side condition C4 confirms every "
    "index 1..10 has exactly 3 incident pairs in that edge list, so "
    "every one of the 20 vertices (10 B-side + 10 mirrored A-side) has "
    "AT LEAST 3 EXACT unit-distance partners at v* (the certificate "
    "does not exclude accidental additional unit distances; >= 3 is "
    "what the k=3 witness property needs). No interval or "
    "approximate reasoning is needed for the K3-witness property "
    "itself -- only for the existence/uniqueness of v*, which is what "
    "the Krawczyk certificate establishes."
)


def run_fr_certify(m, r, Y):
    """Try P=128, escalate to P=256 on contraction failure, per
    SPEC.md Sec 3.2."""
    attempts = []
    for P in (128, 256):
        res = krawczyk.fr_certify(m, r, Y, P)
        attempts.append(res)
        if res["passed"]:
            return res, attempts
    return None, attempts


def main():
    hint = producer.produce()
    m = hint["m"]
    r = hint["r"]
    Y = hint["Y"]
    orientation_sign = hint["orientation_sign"]

    result, attempts = run_fr_certify(m, r, Y)

    if result is None:
        for att in attempts:
            print(
                f"FR-CERT: Krawczyk FAIL at P={att['P']}  "
                f"min lo-margin={min(att['lo_margins'])}  "
                f"min hi-margin={min(att['hi_margins'])}",
                file=sys.stderr,
            )
        print("FR-CERT: FAIL (no contraction at P=128 or P=256)", file=sys.stderr)
        sys.exit(1)

    P = result["P"]
    X = result["X"]

    c1 = krawczyk.check_c1_convexity(X, orientation_sign, P)
    c1b = krawczyk.check_c1b_hull_order(X, orientation_sign, P)
    c2 = krawczyk.check_c2_distinctness(X, P)
    c3 = krawczyk.check_c3_positivity(X)
    c4 = krawczyk.check_c4_degree()

    all_ok = (result["passed"] and c1["passed"] and c1b["passed"]
              and c2["passed"] and c3["passed"] and c4["passed"])

    cert = {
        "target": "Fishburn-Reeds 1992 20-gon exact certification",
        "spec": "scratch/p97-search-lane/fr-certify/SPEC.md v1.0",
        "precision_bits": P,
        "escalated_from_128": (P != 128),
        "free_var_order": krawczyk.FREE_VAR_NAMES,
        "producer_newton_residual": hint["newton_residual"],
        "box_midpoint_m": [frac_to_str(x) for x in m],
        "box_radius_r": frac_to_str(r),
        "certified_box_X": [interval_to_dict(iv) for iv in X],
        "krawczyk_image_KX": [interval_to_dict(iv) for iv in result["KX"]],
        "Y_hint": [[frac_to_str(v) for v in row] for row in Y],
        "orientation_sign": orientation_sign,
        "krawczyk": {
            "passed": result["passed"],
            "lo_margins": [frac_to_str(v) for v in result["lo_margins"]],
            "hi_margins": [frac_to_str(v) for v in result["hi_margins"]],
            "min_lo_margin": frac_to_str(min(result["lo_margins"])),
            "min_hi_margin": frac_to_str(min(result["hi_margins"])),
        },
        "side_conditions": {
            "C1_convexity": c1,
            "C1b_hull_order": c1b,
            "C2_distinctness": c2,
            "C3_positivity": c3,
            "C4_degree": c4,
        },
        "k3_witness_argument": K3_WITNESS_ARGUMENT,
        "overall_passed": all_ok,
    }

    out_dir = os.path.dirname(os.path.abspath(__file__))
    out_path = os.path.join(out_dir, "certificate.json")
    with open(out_path, "w") as fh:
        json.dump(cert, fh, indent=2)

    print(f"FR-CERT: {'PASS' if all_ok else 'FAIL'} (P={P})")
    print(
        f"  krawczyk contraction: passed={result['passed']}  "
        f"min lo-margin={min(result['lo_margins'])}  "
        f"min hi-margin={min(result['hi_margins'])}"
    )
    print(f"  C1 convexity: {'PASS' if c1['passed'] else 'FAIL'}  min_margin={c1['min_margin']}")
    print(f"  C1b hull order: {'PASS' if c1b['passed'] else 'FAIL'}  n_checks={c1b['n_checks']}  min_margin={c1b['min_margin']}")
    print(f"  C2 distinctness: {'PASS' if c2['passed'] else 'FAIL'}  n_pairs={c2['n_pairs']}  n_failures={len(c2['failures'])}")
    print(f"  C3 positivity: {'PASS' if c3['passed'] else 'FAIL'}  min_margin={c3['min_margin']}")
    print(f"  C4 degree: {'PASS' if c4['passed'] else 'FAIL'}  degrees={c4['degrees']}")
    print(f"  wrote {out_path}")

    sys.exit(0 if all_ok else 1)


if __name__ == "__main__":
    main()
