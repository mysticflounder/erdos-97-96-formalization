#!/usr/bin/env python3
"""Exact ℚ-Nullstellensatz certificates for the 10 dead k=4 classes.

For each dead class: try in order  base (equality only) / pair (one Rabinowitsch)
/ multi_pair (>=2).  Singular `lift(I, ideal(1))` gives cofactors; the identity
Σ coeff_i·gen_i = 1 is re-verified in exact Fraction arithmetic (no floats, no
solver trust) via k4lib.padd/pmul.  Certificates carry generators/coefficients
as polys over GLOBAL var indices (x2x=0,x2y=1,x3x=2,x3y=3, t_j=4+j) so the
emitted Lean checker sees them directly.
"""
import json
import os
import subprocess
import sys
from fractions import Fraction
from itertools import combinations

import k4lib as K

HERE = os.path.dirname(os.path.abspath(__file__))


def poly_str(p, names_by_global):
    """Render a global-index poly as a Singular string using names_by_global
    (dict global_idx -> compact name)."""
    if not p:
        return "0"
    terms = []
    for m, c in sorted(p.items()):
        if c.denominator != 1:
            coeff = f"({c.numerator}/{c.denominator})"
        else:
            coeff = str(c.numerator)
        body = "*".join(f"{names_by_global[i]}^{e}" if e > 1 else names_by_global[i]
                        for i, e in m)
        if body and coeff == "1":
            terms.append(body)
        elif body and coeff == "-1":
            terms.append("-" + body)
        elif body:
            terms.append(f"{coeff}*{body}")
        else:
            terms.append(coeff)
    return "+".join(terms).replace("+-", "-")


def parse_poly_str(s, name_to_global):
    """Parse a Singular expanded string into a global-index poly."""
    s = s.strip().replace(" ", "")
    if s in ("0", ""):
        return {}
    terms, cur = [], ""
    for ch in s:
        if ch in "+-" and cur and cur[-1] not in "+-*/^(":
            terms.append(cur)
            cur = ch
        else:
            cur += ch
    terms.append(cur)
    poly = {}
    for t in terms:
        sign = Fraction(1)
        while t and t[0] in "+-":
            if t[0] == "-":
                sign = -sign
            t = t[1:]
        coeff = sign
        monom = {}
        for f in t.split("*"):
            if not f:
                continue
            if f[0].isdigit() or (f[0] == "(" and "/" in f):
                coeff *= Fraction(f.strip("()"))
            else:
                if "^" in f:
                    v, e = f.split("^")
                    e = int(e)
                else:
                    v, e = f, 1
                g = name_to_global[v]
                monom[g] = monom.get(g, 0) + e
        key = tuple(sorted(monom.items()))
        poly[key] = poly.get(key, Fraction(0)) + coeff
    return {m: c for m, c in poly.items() if c}


def sing_run(script, timeout=240):
    try:
        pr = subprocess.run(["Singular", "-q"], input=script,
                            capture_output=True, text=True, timeout=timeout)
        return pr.stdout
    except subprocess.TimeoutExpired:
        return None


def msolve_empty(polys, timeout=20):
    import tempfile
    vs = K.used_vars(polys)
    names = {g: K.var_name(g) for g in vs}
    remap = {g: i for i, g in enumerate(vs)}
    cnames = [K.var_name(g) for g in vs]
    strs = []
    for p in polys:
        q = {tuple(sorted((remap[i], e) for i, e in m)): c for m, c in p.items()}
        strs.append(poly_str_compact(q, cnames))
    inp = ",".join(cnames) + "\n0\n" + ",\n".join(strs) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        return open(out).read().strip().startswith("[-1]")
    except subprocess.TimeoutExpired:
        return None
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass


def poly_str_compact(p, cnames):
    if not p:
        return "0"
    terms = []
    for m, c in sorted(p.items()):
        coeff = f"({c.numerator}/{c.denominator})" if c.denominator != 1 else str(c.numerator)
        body = "*".join(f"{cnames[i]}^{e}" if e > 1 else cnames[i] for i, e in m)
        if body and coeff == "1":
            terms.append(body)
        elif body and coeff == "-1":
            terms.append("-" + body)
        elif body:
            terms.append(f"{coeff}*{body}")
        else:
            terms.append(coeff)
    return "+".join(terms).replace("+-", "-")


def lift_certificate(gens):
    """gens: list of global-index polys.  Singular lift of 1 into ⟨gens⟩.
    Returns (cofactor global-index polys) or None."""
    vs = K.used_vars(gens)
    if not vs:
        return None
    names_by_global = {g: K.var_name(g) for g in vs}
    name_to_global = {n: g for g, n in names_by_global.items()}
    ordered = [K.var_name(g) for g in vs]
    gstrs = [poly_str(g, names_by_global) for g in gens]
    lines = [
        f"ring r = 0, ({','.join(ordered)}), dp;",
        "ideal I = " + ",\n  ".join(gstrs) + ";",
        "ideal G = std(I);",
        'string("RED1:", reduce(1, G));',
        "matrix T = lift(I, ideal(1));",
        "poly chk = 0; int i;",
        "for (i=1;i<=size(I);i=i+1){chk=chk+I[i]*T[i,1];}",
        'string("CHK:", chk);',
        'for (i=1;i<=size(I);i=i+1){string("COF",i,":",T[i,1]);}',
        "exit;",
    ]
    out = sing_run("\n".join(lines))
    if out is None or "RED1:0" not in out or "CHK:1" not in out:
        return None
    cofs = {}
    for ln in out.splitlines():
        ln = ln.strip()
        if ln.startswith("COF"):
            k, val = ln[3:].split(":", 1)
            cofs[int(k)] = val
    if len(cofs) != len(gens):
        return None
    cof_polys = [parse_poly_str(cofs[i + 1], name_to_global) for i in range(len(gens))]
    # exact Fraction identity re-check
    acc = {}
    for cp, gp in zip(cof_polys, gens):
        acc = K.padd(acc, K.pmul(cp, gp))
    if acc != {(): Fraction(1)}:
        return None
    return cof_polys


def certify(g):
    """Return a certificate dict for dead class g, or None."""
    polys, tags = K.pattern_polys(g)
    pts = K.pattern_points(g)

    def build(rab_pairs, kill):
        rabs = K.rabinowitsch(rab_pairs)
        gens = polys + [r[0] for r in rabs]
        cofs = lift_certificate(gens)
        if cofs is None:
            return None
        gen_tags = ([["eq", c, m0, m] for (c, m0, m) in tags] +
                    [["rab", a, b] for (_, (a, b), _) in rabs])
        return {
            "readable": K.readable(g),
            "pattern": {str(c): sorted(M) for c, M in g.items()},
            "kill": kill,
            "rab_pairs": [list(p) for p in rab_pairs],
            "generators": [dump_poly(x) for x in gens],
            "coefficients": [dump_poly(x) for x in cofs],
            "generator_tags": gen_tags,
            "identity": "sum_i coefficients[i]*generators[i] = 1",
            "gauge": "pt0=(0,0), pt1=(1,0); vars x2x=0,x2y=1,x3x=2,x3y=3,t_j=4+j",
        }

    # base kill
    c = build([], "base")
    if c is not None:
        return c
    # pair kill: try each single pair (exclude gauge pair (0,1): d2=1 trivial)
    cand_pairs = [e for e in combinations(pts, 2) if e != (0, 1)]
    for e in cand_pairs:
        if msolve_empty(polys + [K.rabinowitsch([e])[0][0]], timeout=15):
            c = build([e], f"pair:{e[0]}-{e[1]}")
            if c is not None:
                return c
    # multi_pair: greedy-shrink from all cand pairs
    cur = list(cand_pairs)
    for e in list(cur):
        if len(cur) <= 1:
            break
        trial = [p for p in cur if p != e]
        if msolve_empty(polys + [r[0] for r in K.rabinowitsch(trial)], timeout=15):
            cur = trial
    kill = f"pair:{cur[0][0]}-{cur[0][1]}" if len(cur) == 1 else "multi_pair"
    return build(cur, kill)


def dump_poly(p):
    """Serialize a global-index poly as JSON-friendly [[coeff_num,coeff_den,
    [[var,exp],...]], ...]."""
    out = []
    for m, c in sorted(p.items()):
        out.append([c.numerator, c.denominator, [[i, e] for i, e in m]])
    return out


def load_poly(rec):
    return {tuple((i, e) for i, e in mon): Fraction(n, d) for n, d, mon in rec}


def verify_cert(cert):
    """Independent exact re-check: rebuild generators from the pattern, confirm
    they match the cert's generators, and Σ coeff·gen = 1 exactly."""
    g = {int(c): M for c, M in cert["pattern"].items()}
    polys, tags = K.pattern_polys(g)
    rabs = K.rabinowitsch([tuple(p) for p in cert["rab_pairs"]])
    expected = polys + [r[0] for r in rabs]
    cert_gens = [load_poly(x) for x in cert["generators"]]
    assert len(cert_gens) == len(expected), cert["readable"]
    for j, (a, b) in enumerate(zip(cert_gens, expected)):
        assert a == b, f"{cert['readable']}: generator {j} != pattern-derived"
    cofs = [load_poly(x) for x in cert["coefficients"]]
    assert len(cofs) == len(cert_gens), cert["readable"]
    acc = {}
    for cp, gp in zip(cofs, cert_gens):
        acc = K.padd(acc, K.pmul(cp, gp))
    assert acc == {(): Fraction(1)}, f"{cert['readable']}: identity != 1"
    return len(cert_gens)


def main():
    dead = json.load(open(f"{HERE}/dead_classes.json"))
    certs = []
    for d in dead:
        g = {int(c): M for c, M in d["pattern"].items()}
        print(f"[certify] {d['readable']} (R={d['R']}, delta={d['delta']}) ...",
              end=" ", flush=True)
        cert = certify(g)
        if cert is None:
            print("FAILED", flush=True)
            return 1
        cert["R"] = d["R"]
        cert["delta"] = d["delta"]
        ng = verify_cert(cert)
        print(f"kill={cert['kill']} gens={ng} rab_pairs={cert['rab_pairs']} "
              f"exact-identity OK", flush=True)
        certs.append(cert)
    with open(f"{HERE}/certs.json", "w") as f:
        json.dump(certs, f, indent=2)
    # full independent re-verification pass
    n = sum(verify_cert(c) for c in certs)
    print(f"\n[certify] ALL {len(certs)} certificates verified "
          f"(generator fidelity + exact Fraction identity); {n} total generators",
          flush=True)
    print(f"[certify] wrote certs.json", flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
