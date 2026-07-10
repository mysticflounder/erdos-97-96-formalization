#!/usr/bin/env python3
"""Modular Nullstellensatz certificate for a hard-CERTFAIL pattern.

Diagnosis (certify_probe on frontier pat0): the wall is NOT the Grobner basis
-- for the shrunk system std(I) is 2s and reduce(1,G)=0 -- it is lift(I,
ideal(1)) over Q: the cofactors c_i in 1 = sum c_i g_i have huge rational
height even when the basis is tiny, so the exact rational lift blows up (>600s
timeout).

Fix (same principle that makes modStd fast): compute the lift over GF(p) for
several primes -- in a finite field coefficients cannot grow -- then CRT +
rational-reconstruct each cofactor coefficient over Q, and VERIFY the identity
sum c_i g_i = 1 EXACTLY in Fractions.  The exact check is the sole trust gate:
a wrong reconstruction simply fails it and we add primes.  No native/unsafe
code; the certificate is ordinary exact rational arithmetic.

Targets the SHRUNK pair system (certify's primary path).  Read-only wrt bank.
"""
import math
import sys
import time
from fractions import Fraction
from itertools import combinations

sys.path.insert(0, ".")
import census554_lib as L  # noqa: E402
import certify_probe as P  # noqa: E402  (reuse build(), PAT)
import miner  # noqa: E402

# shrunk pair set found by certify's msolve shrink loop for pat0 (certify_probe)
SHRUNK_PAIRS = [(0, 7), (4, 7), (9, 10)]


def is_prime(n):
    if n < 2:
        return False
    for q in (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37):
        if n % q == 0:
            return n == q
    d, s = n - 1, 0
    while d % 2 == 0:
        d //= 2
        s += 1
    for a in (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37):
        x = pow(a, d, n)
        if x in (1, n - 1):
            continue
        for _ in range(s - 1):
            x = x * x % n
            if x == n - 1:
                break
        else:
            return False
    return True


def primes_below(start, count):
    out, n = [], start
    while len(out) < count:
        if is_prime(n):
            out.append(n)
        n -= 1
    return out


def ratrec(a, m):
    """Rational reconstruction: r/s == a (mod m), |r|,s <= sqrt(m/2)."""
    a %= m
    if a == 0:
        return Fraction(0)
    bound = math.isqrt(m // 2)
    r0, r1, t0, t1 = m, a, 0, 1
    while r1 > bound:
        q = r0 // r1
        r0, r1, t0, t1 = r1, r0 - q * r1, t1, t0 - q * t1
    if t1 == 0 or abs(t1) > bound:
        return None
    g = math.gcd(r1, t1)
    r, t = r1 // g, t1 // g
    if t < 0:
        r, t = -r, -t
    if math.gcd(t, m) != 1 or (r - a * t) % m != 0:
        return None
    return Fraction(r, t)


def crt(residues, moduli):
    x, M = 0, 1
    for r, p in zip(residues, moduli):
        g = pow(M % p, -1, p)
        x += M * (((r - x) * g) % p)
        M *= p
    return x % M, M


def lift_modp(names, gstrs, p, timeout=120):
    """cofactor polys of 1 = sum c_i g_i over GF(p); None on timeout/bad prime."""
    script = "\n".join([
        f"ring r = {p}, ({','.join(names)}), dp;",
        "ideal I = " + ",\n  ".join(gstrs) + ";",
        "matrix T = lift(I, ideal(1));",
        "int i; poly chk = 0;",
        "for (i=1;i<=size(I);i=i+1){chk=chk+I[i]*T[i,1];}",
        'string("CHK:", chk);',
        'for (i=1;i<=nrows(T);i=i+1){ string("COF", i, ":", T[i,1]); }',
        "exit;"])
    out = miner.sing_run(script, timeout)
    if out is None:
        return None
    chk = None
    cofs = {}
    for ln in out.splitlines():
        ln = ln.strip()
        if ln.startswith("CHK:"):
            chk = ln[4:].strip()
        elif ln.startswith("COF"):
            k, val = ln[3:].split(":", 1)
            cofs[int(k)] = val
    if chk != "1":  # degenerate prime (GB changed) -> skip
        return None
    return cofs


def main():
    polys, tags = miner.pattern_polys(P.PAT)
    rabs = miner.rabinowitsch_polys(P.PAT, pairs=SHRUNK_PAIRS)
    gens = polys + [r[0] for r in rabs]
    names, remap, gstrs = P.build(gens)
    name_to_idx = {n: k for k, n in enumerate(names)}
    ng = len(gens)
    print(f"shrunk system: {len(names)} vars, {ng} gens, "
          f"pairs {SHRUNK_PAIRS}", flush=True)

    # generators in the compact index space, as exact L-Polys
    gen_polys = [
        {tuple(sorted((remap[i], e) for i, e in m)): c for m, c in g.items()}
        for g in gens]

    # collect modular cofactors
    prime_pool = primes_below(2**31 - 1, 200)
    good_p, good_cofs = [], []  # good_cofs[j] = {gen_i: {monomial: residue}}
    target = 24
    t0 = time.time()
    for p in prime_pool:
        if len(good_p) >= target:
            break
        cofs = lift_modp(names, gstrs, p)
        if cofs is None:
            continue
        parsed = {}
        for i in range(1, ng + 1):
            pod = miner.parse_poly_str(cofs[i], name_to_idx)
            parsed[i] = {m: int(c) % p for m, c in pod.items()}
        good_p.append(p)
        good_cofs.append(parsed)
    print(f"collected {len(good_p)} good modular lifts "
          f"({time.time()-t0:.0f}s)", flush=True)

    # reconstruct each cofactor coefficient over Q
    def reconstruct(primes, cof_list):
        coeff_polys = []
        for i in range(1, ng + 1):
            support = set()
            for c in cof_list:
                support |= set(c[i].keys())
            poly = {}
            for mon in support:
                res = [c[i].get(mon, 0) for c in cof_list]
                x, M = crt(res, primes)
                fr = ratrec(x, M)
                if fr is None:
                    return None
                if fr != 0:
                    poly[mon] = fr
            coeff_polys.append(poly)
        return coeff_polys

    coeff_polys = reconstruct(good_p, good_cofs)
    if coeff_polys is None:
        print("reconstruction incomplete at 24 primes -- need more", flush=True)
        return

    # EXACT identity check in Fractions: sum c_i g_i == 1
    acc = {}
    for cp, gp in zip(coeff_polys, gen_polys):
        acc = L.padd(acc, L.pmul(cp, gp))
    ok = acc == {(): Fraction(1)}
    print(f"EXACT identity sum c_i*g_i == 1 : {ok}", flush=True)
    if ok:
        heights = [max((len(str(c.numerator)) + len(str(c.denominator))
                        for c in cp.values()), default=0) for cp in coeff_polys]
        print(f"certificate VALID.  max coeff digit-height ~{max(heights)}  "
              f"(this is why rational lift blew up)", flush=True)
    else:
        print(f"identity != 1 (got {len(acc)} terms) -- add primes / bad-prime "
              f"contamination; increase target", flush=True)


if __name__ == "__main__":
    main()
