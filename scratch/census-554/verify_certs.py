#!/usr/bin/env python3
"""Independent verifier for banked (5,5,4) pattern certificates.

For every bank.jsonl entry, loads its certs/pat_XXXXX.json and checks, in
exact Fraction arithmetic with NO Singular involvement:

  1. structural: pattern well-formed (masks >= 2 members, center not in its
     own mask, points in 0..10); bank pattern == cert pattern; kill type
     consistent with rab_pairs; n_orbit == |AUTOS orbit|.
  2. generator fidelity: the cert's generator strings parse to EXACTLY the
     polynomials determined by the pattern (equidistance d2(c,m0)-d2(c,m))
     plus the recorded Rabinowitsch pairs (t_j*d2(a,b)-1), in the cert's own
     variable list.  (So the certificate proves a statement about the
     PATTERN, not about arbitrary polynomials.)
  3. Nullstellensatz identity: sum_i coefficients[i]*generators[i] == 1.

Any real (5,5,4) configuration whose cube contains the pattern satisfies all
generators (t_j := 1/d2 real, points distinct), so 1 = 0: the pattern is dead.
"""

import json
import os
import sys
from fractions import Fraction

import census554_lib as L
import miner

HERE = os.path.dirname(os.path.abspath(__file__))


def expected_generators(pat, rab_pairs):
    polys, _tags = miner.pattern_polys(pat)
    rabs = miner.rabinowitsch_polys(pat, pairs=[tuple(p) for p in rab_pairs])
    gens = polys + [r[0] for r in rabs]
    vs = miner.used_vars(gens)
    tnames = {i: f"t{i - len(L.VARS)}" for i in vs if i >= len(L.VARS)}
    names = [miner.var_name(i, tnames) for i in vs]
    remap = {i: k for k, i in enumerate(vs)}
    remapped = [{tuple(sorted((remap[i], e) for i, e in m)): c
                 for m, c in g.items()} for g in gens]
    return names, remapped


def verify_cert(bank_rec, cert):
    pid = bank_rec["pid"]
    pat = {int(c): frozenset(M) for c, M in cert["pattern"].items()}
    # 1. structural
    assert cert["schema"] == "census554_pattern_certificate.v1", pid
    assert bank_rec["pattern"] == cert["pattern"], f"{pid}: bank/cert mismatch"
    for c, M in pat.items():
        assert 0 <= c < L.N and len(M) >= 2 and c not in M, f"{pid}: bad mask"
        assert all(0 <= m < L.N for m in M), f"{pid}: member out of range"
    rp = cert["rab_pairs"]
    kill = cert["kill"]
    if kill == "base":
        assert rp == [], f"{pid}: base kill with rab pairs"
    elif kill.startswith("pair:"):
        a, b = kill[5:].split("-")
        assert rp == [[int(a), int(b)]], f"{pid}: pair kill mismatch {rp}"
    else:
        assert kill == "multi_pair" and len(rp) >= 2, f"{pid}: kill {kill}"
    pts = set(miner.pattern_points(pat))
    for a, b in rp:
        assert a in pts and b in pts and (a, b) != (0, 1), \
            f"{pid}: rab pair {a},{b} not in pattern points"
    assert bank_rec["n_orbit"] == len(miner.orbit(pat)), f"{pid}: orbit size"
    # 2. generator fidelity
    names, expected = expected_generators(pat, rp)
    assert names == cert["variables"], f"{pid}: variable list mismatch"
    n2i = {n: k for k, n in enumerate(names)}
    parsed = [miner.parse_poly_str(s, n2i) for s in cert["generators"]]
    assert len(parsed) == len(expected), f"{pid}: generator count"
    for j, (p, e) in enumerate(zip(parsed, expected)):
        assert p == e, f"{pid}: generator {j} does not match the pattern"
    # 3. exact identity
    coeffs = [miner.parse_poly_str(s, n2i) for s in cert["coefficients"]]
    assert len(coeffs) == len(parsed), f"{pid}: coefficient count"
    acc = {}
    for cp, gp in zip(coeffs, parsed):
        acc = L.padd(acc, L.pmul(cp, gp))
    assert acc == {(): Fraction(1)}, f"{pid}: identity sum != 1"
    return len(parsed)


def main(limit=None):
    n = 0
    with open(f"{HERE}/bank.jsonl") as f:
        recs = [json.loads(ln) for ln in f]
    if limit:
        recs = recs[-limit:]
    for rec in recs:
        with open(os.path.join(HERE, rec["cert"])) as f:
            cert = json.load(f)
        ng = verify_cert(rec, cert)
        n += 1
        if n % 50 == 0:
            print(f"  ...{n}/{len(recs)} verified", flush=True)
    print(f"[verify_certs] ALL {n} certificates verified "
          f"(structure + generator fidelity + exact Fraction identity)")
    return n


if __name__ == "__main__":
    main(limit=int(sys.argv[1]) if len(sys.argv) > 1 else None)
