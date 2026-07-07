#!/usr/bin/env python3
"""Emit lean/Erdos9796Proof/P97/K4WindowBank.lean from certs.json.

Self-contained module: k=4 dead-class pattern data + exact ℚ-Nullstellensatz
certificates (base kills, equality-only) + per-class checker-acceptance theorems.
Variable indices: x2x=0, x2y=1, x3x=2, x3y=3 (no t-vars; all kills are base).
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
OUT = f"{REPO}/lean/Erdos9796Proof/P97/K4WindowBank.lean"

VARDOC = {0: "x2x", 1: "x2y", 2: "x3x", 3: "x3y"}


def rat_lit(num, den):
    if den == 1:
        return f"({num} : Rat)"
    return f"(({num} : Rat) / {den})"


def monom_lit(mon):
    return "[" + ", ".join(f"({i}, {e})" for i, e in mon) + "]"


def poly_lit(poly, indent):
    """poly = list of [num,den,mon]; render as a Lean Poly (List Term)."""
    if not poly:
        return "[]"
    lines = []
    for num, den, mon in poly:
        lines.append(f"{indent}  term {rat_lit(num, den)} {monom_lit(mon)}")
    return "[\n" + ",\n".join(lines) + f"\n{indent}]"


def poly_list_lit(polys, indent):
    if not polys:
        return "[]"
    inner = ",\n".join(f"{indent}{poly_lit(p, indent)}" for p in polys)
    return "[\n" + inner + f"\n{indent}]"


def pattern_readable(cert):
    return cert["readable"]


def main():
    certs = json.load(open(f"{HERE}/certs.json"))
    L = []
    A = L.append
    A("/-")
    A("Copyright (c) 2026 Adam McKenna. All rights reserved.")
    A("Released under Apache 2.0 license as described in the file LICENSE.")
    A("Authors: Adam McKenna")
    A("-/")
    A("")
    A("import Erdos9796Proof.P97.EndpointCertificate.Checker")
    A("")
    A("/-!")
    A("# The dead k=4 window universe — certificate bank")
    A("")
    A("The k=4 window universe is the set of admissible equidistance-constraint")
    A("classes on four labelled window points `{0,1,2,3}`: a witness (shell) map")
    A("`K : {0,1,2,3} → 𝒫(others)` where a centre `c` is *active* when")
    A("`|K c| ≥ 2`, imposing that all members of `K c` are equidistant from `c`.")
    A("Up to relabelling of the four points (the `S₄` action) there are exactly")
    A("**44** admissible classes; of these exactly **10** are dead (`ℂ`-empty")
    A("equidistance systems under the similarity gauge `pt0=(0,0)`, `pt1=(1,0)`).")
    A("")
    A("This enumeration and the dead/alive split were re-derived independently and")
    A("agree with the dichotomy run's Tier C sweep (`scratch/u12-census-port/`")
    A("`dichotomy/`, 44 classes / 10 `C_DEAD`, δ multiset {1,1,1,1,2,2,2,2,3,4}).")
    A("Every dead class here has a **base** (equality-only) Nullstellensatz")
    A("certificate: `1 ∈ ⟨equidistance generators⟩` over `ℚ`, so no distinctness")
    A("(Rabinowitsch) separator is needed — corroborated by the dichotomy's")
    A("`base_pinned_empty = true` on all ten.")
    A("")
    A("Variable indices (gauge `pt0=(0,0)`, `pt1=(1,0)`): `x2x=0, x2y=1,")
    A("x3x=2, x3y=3`.  Each `def kN_dead_i` is the certificate for one class; the")
    A("companion theorem checks `checkCertificate = true` with `native_decide`,")
    A("as for the `EndpointCertificate.Patterns` bank.  Kernel-pure `decide` is")
    A("infeasible here: `checkCertificate` runs over `Rat`, whose normalization")
    A("(`Nat.gcd`, well-founded recursion) does not reduce in the kernel — even")
    A("`(1/3 + 2/3 = 1)` gets stuck under `decide`.  Expected audit-cost addition:")
    A("`Lean.ofReduceBool` + `Lean.trustCompiler` (bv_decide standard); the")
    A("evaluated `checkCertificate` closure is ordinary verified Lean — no")
    A("`unsafe`, `@[extern]`, or `@[implemented_by]`.")
    A("")
    A("The module is intentionally UNIMPORTED by the spine: it is the k=4 bank")
    A("groundwork for the Candidate-C head split of")
    A("`DoubleApexOffSurplusSharedRadiusPairCard12Up`.")
    A("-/")
    A("")
    A("namespace Problem97")
    A("")
    A("namespace EndpointCertificate")
    A("")
    A("namespace K4WindowBank")
    A("")

    thm_names = []
    for idx, cert in enumerate(certs):
        base = f"k4_dead_{idx:02d}"
        pat = ";".join(f"{c}:{cert['pattern'][c]}".replace(" ", "")
                       for c in sorted(cert["pattern"], key=int))
        A(f"/-- Class `{base}` — witness map `{pat}`")
        A(f"    (R = {cert['R']}, δ = {cert['delta']}, kill = `{cert['kill']}`).")
        A(f"    Generator polynomials: per active centre `c` with members")
        A(f"    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`")
        A(f"    in the gauge `pt0=(0,0), pt1=(1,0)`. -/")
        A(f"def {base}_generators : List Poly :=")
        A(poly_list_lit(cert["generators"], ""))
        A("")
        A(f"/-- Cofactor polynomials for class `{base}` "
          f"(`Σ coeff · gen = 1`, exact `ℚ`). -/")
        A(f"def {base}_coefficients : List Poly :=")
        A(poly_list_lit(cert["coefficients"], ""))
        A("")
        A(f"/-- Certificate for dead k=4 class `{base}`. -/")
        A(f"def {base} : Certificate :=")
        A(f"  {{ generators := {base}_generators")
        A(f"    coefficients := {base}_coefficients }}")
        A("")
        A(f"set_option linter.style.nativeDecide false in")
        A(f"/-- The checker accepts the certificate for class `{base}`: the")
        A(f"    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds")
        A(f"    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/")
        A(f"theorem {base}_valid : checkCertificate {base} = true := by")
        A(f"  native_decide")
        A("")
        thm_names.append(base)

    # combined list + aggregate theorem
    A("/-- All ten dead k=4 window-class certificates. -/")
    A("def k4DeadCertificates : List Certificate :=")
    A("  [" + ",\n   ".join(thm_names) + "]")
    A("")
    A("set_option linter.style.nativeDecide false in")
    A("/-- The checker accepts every dead k=4 window-class certificate. -/")
    A("theorem k4DeadCertificates_all_valid :")
    A("    k4DeadCertificates.all (fun c => checkCertificate c) = true := by")
    A("  native_decide")
    A("")
    A("end K4WindowBank")
    A("")
    A("end EndpointCertificate")
    A("")
    A("end Problem97")
    A("")

    with open(OUT, "w") as f:
        f.write("\n".join(L))
    print(f"# wrote {OUT} ({len(L)} lines, {len(certs)} classes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
