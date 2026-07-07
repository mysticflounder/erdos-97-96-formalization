#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Exact-rational library for the erased-pin two-hit probe (closure plan S4).

Conventions (project standard (D-msolve), matching
scripts/endpoint-certificate.py and the historical
p97-rvol/scratch/u2b_ssel_fragment/comp_g/comp_g_encode.py):

  * gauge: v = (0,0), w = (1,0); all other labels are free rational points;
  * ten-label model u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2 with hull order
    [u, Q1, Q2, v, s1, s2, s3, w, Pw, Pu] (counterclockwise);
  * dist2(a,b) = (ax-bx)^2 + (ay-by)^2 (exact Fractions);
  * signedArea2(a,b,c) = (bx-ax)*(cy-ay) - (cx-ax)*(by-ay)
    (matches Lean Problem97.signedArea2 v vj vk);
  * OnArcOpposite(vi, vj, vk, z) := sa2(z,vj,vk) * sa2(vi,vj,vk) <= 0;
  * per-pair Rabinowitsch distinctness: t * dist2(a,b) - 1;
  * msolve verdict tuples: [-1] C-empty; [1, n, -1, []] positive-dimensional;
    [0, [mid, [sols...]]] zero-dimensional (sols = real-root boxes, may be []).

NO floating point anywhere: every number is a fractions.Fraction, every
comparison is exact.
"""
from __future__ import annotations

import subprocess
import tempfile
import os
from fractions import Fraction
from pathlib import Path

F = Fraction

LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
HULL_ORDER = ("u", "Q1", "Q2", "v", "s1", "s2", "s3", "w", "Pw", "Pu")
MOSER = ("u", "v", "w")
# home caps: cap opposite the named Moser vertex, with its chord endpoints.
# capOpp[m] = (chord_a, chord_b, interior_labels)
CAPS = {
    "u": ("v", "w", ("s1", "s2", "s3")),   # surplus cap (m = 5 here)
    "v": ("w", "u", ("Pw", "Pu")),
    "w": ("u", "v", ("Q1", "Q2")),
}
VAR_ORDER = ["ux", "uy", "s1x", "s1y", "s2x", "s2y", "s3x", "s3y",
             "pwx", "pwy", "pux", "puy", "q1x", "q1y", "q2x", "q2y"]


# ---------- exact point geometry -------------------------------------------

def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def sa2(a, b, c):
    """signedArea2 of (a, b, c): cross of (b - a) and (c - a)."""
    return (b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])


def mec_center_r2(k):
    """Circle through v=(0,0), w=(1,0) with center (1/2, k)."""
    return (F(1, 2), F(k)), F(1, 4) + F(k) ** 2


def chord_point(k, t):
    """Rational point on the MEC circle x^2+y^2-x-2ky=0 via the chord y=t*x
    through v=(0,0).  t rational -> exact rational point on the circle."""
    t = F(t)
    k = F(k)
    x = (1 + 2 * k * t) / (1 + t * t)
    return (x, t * x)


def rot_t(p, c, t):
    """Rotate p around c by the rational rotation with tan(theta/2) = t
    (cos = (1-t^2)/(1+t^2), sin = 2t/(1+t^2)); exactly preserves d2(c, .)."""
    t = F(t)
    den = 1 + t * t
    cs, sn = (1 - t * t) / den, 2 * t / den
    dx, dy = p[0] - c[0], p[1] - c[1]
    return (c[0] + dx * cs - dy * sn, c[1] + dx * sn + dy * cs)


def perp_bisector_point(a, b, s):
    """Rational point on the perpendicular bisector of a,b:
    midpoint + s * rot90(b - a).  Exactly equidistant from a and b."""
    s = F(s)
    mx, my = (a[0] + b[0]) / 2, (a[1] + b[1]) / 2
    dx, dy = b[0] - a[0], b[1] - a[1]
    return (mx - s * dy, my + s * dx)


# ---------- configuration checker -------------------------------------------

class Check:
    def __init__(self, cid, kind, ok, note=""):
        self.cid, self.kind, self.ok, self.note = cid, kind, bool(ok), note

    def row(self):
        return f"[{'PASS' if self.ok else 'FAIL'}] {self.kind:12s} {self.cid}" + (
            f"  ({self.note})" if self.note else "")


def check_configuration(pts, k, center_label, class_labels, x_label,
                        expected_counts):
    """Full exact audit of a ten-point configuration.

    pts: dict label -> (Fraction, Fraction); k: MEC center height;
    center_label: the pin center p; class_labels: the 4 selected-class labels;
    x_label: the erased surplus interior (must be in class_labels);
    expected_counts: (moser, sameCap, leftAdj, rightAdj) for documentation.

    Returns (ok, checks: list[Check]).
    Every check is an exact Fraction comparison; strict inequalities are
    strict.  Cap-side checks are imposed STRICTLY (sufficient for the weak
    OnArcOpposite convention and for exact cap cardinalities).
    """
    checks = []
    O, R2 = mec_center_r2(k)
    p = pts[center_label]

    # gauge
    checks.append(Check("v=(0,0)", "gauge", pts["v"] == (F(0), F(0))))
    checks.append(Check("w=(1,0)", "gauge", pts["w"] == (F(1), F(0))))

    # Moser vertices exactly on the MEC circle
    for m in MOSER:
        checks.append(Check(f"onMEC[{m}]", "frame", d2(pts[m], O) == R2))

    # all points in the closed disk; non-Moser strictly inside
    for lab in LABELS:
        dd = d2(pts[lab], O)
        if lab in MOSER:
            checks.append(Check(f"inDisk[{lab}]", "disk", dd <= R2))
        else:
            checks.append(Check(f"strictInDisk[{lab}]", "disk", dd < R2,
                                note=f"margin {R2 - dd}"))

    # strictly acute Moser triangle (sufficient for non-obtuse)
    tri = {m: pts[m] for m in MOSER}
    for m in MOSER:
        others = [tri[x] for x in MOSER if x != m]
        vec1 = (others[0][0] - tri[m][0], others[0][1] - tri[m][1])
        vec2 = (others[1][0] - tri[m][0], others[1][1] - tri[m][1])
        dot = vec1[0] * vec2[0] + vec1[1] * vec2[1]
        checks.append(Check(f"acuteAt[{m}]", "triangle", dot > 0,
                            note=f"dot {dot}"))

    # cap sides: each non-Moser point strictly in its home cap and strictly
    # outside the other two caps (chord-separation sign tests)
    for m, (a, b, interiors) in CAPS.items():
        ref = sa2(pts[m], pts[a], pts[b])   # opposite-vertex side reference
        checks.append(Check(f"chordRef[{m}]", "caps", ref != 0))
        for z in interiors:
            val = sa2(pts[z], pts[a], pts[b])
            checks.append(Check(f"capSide[{z} in C_{m}]", "caps",
                                val * ref < 0, note=f"sa2*ref {val * ref}"))
        # points of other caps' interiors must be strictly on the m-side
        for m2, (_, _, interiors2) in CAPS.items():
            if m2 == m:
                continue
            for z in interiors2:
                val = sa2(pts[z], pts[a], pts[b])
                checks.append(Check(f"notInCap[{z} vs C_{m}]", "caps",
                                    val * ref > 0))

    # convex position: ALL ordered triples in cyclic hull order have
    # signedArea2 > 0 (strict convex position; 120 triples)
    n = len(HULL_ORDER)
    conv_ok = True
    worst = None
    for i in range(n):
        for j in range(i + 1, n):
            for kk in range(j + 1, n):
                val = sa2(pts[HULL_ORDER[i]], pts[HULL_ORDER[j]],
                          pts[HULL_ORDER[kk]])
                if worst is None or val < worst[1]:
                    worst = ((HULL_ORDER[i], HULL_ORDER[j], HULL_ORDER[kk]), val)
                if not (val > 0):
                    conv_ok = False
                    checks.append(Check(
                        f"convex[{HULL_ORDER[i]},{HULL_ORDER[j]},{HULL_ORDER[kk]}]",
                        "convex", False, note=f"sa2 {val}"))
    checks.append(Check("convex[all 120 cyclic triples]", "convex", conv_ok,
                        note=f"min sa2 {worst[1]} at {worst[0]}"))

    # pairwise distinctness (45 pairs)
    dist_ok = True
    for i in range(len(LABELS)):
        for j in range(i + 1, len(LABELS)):
            if d2(pts[LABELS[i]], pts[LABELS[j]]) == 0:
                dist_ok = False
                checks.append(Check(f"distinct[{LABELS[i]},{LABELS[j]}]",
                                    "distinct", False))
    checks.append(Check("distinct[all 45 pairs]", "distinct", dist_ok))

    # the pin: equal squared distances from p to the four class members,
    # radius positive, all other labels strictly off the class circle
    rho = d2(p, pts[x_label])
    checks.append(Check("radius2>0", "pin", rho > 0, note=f"rho {rho}"))
    for m in class_labels:
        checks.append(Check(f"onClassCircle[{m}]", "pin",
                            d2(p, pts[m]) == rho))
    off = [lab for lab in LABELS
           if lab not in class_labels and lab != center_label]
    for z in off:
        dd = d2(p, pts[z])
        checks.append(Check(f"offClassCircle[{z}]", "pin", dd != rho,
                            note=f"d2 {dd} vs rho {rho}"))

    # derived count facts (documentation of the configuration shape).
    # Lean adjacency mapping ((v1,v2,v3) = (u,v,w), surplusIdx = 0):
    #   p in capInterior 1 (= C_v ints, oppIndex1): left = capInterior 2
    #     (C_w ints), right = capInterior 0 (surplus ints);
    #   p in capInterior 2 (= C_w ints, oppIndex2): left = capInterior 0
    #     (surplus ints), right = capInterior 1 (C_v ints).
    cls = set(class_labels)
    moser_ct = len(cls & set(MOSER))
    if center_label in CAPS["v"][2]:
        home, left_ints, right_ints = "v", CAPS["w"][2], CAPS["u"][2]
    else:
        home, left_ints, right_ints = "w", CAPS["u"][2], CAPS["v"][2]
    same_ct = len((cls & set(CAPS[home][2])) - {center_label})
    left_ct = len(cls & set(left_ints))
    right_ct = len(cls & set(right_ints))
    got = (moser_ct, same_ct, left_ct, right_ct)
    checks.append(Check(f"counts(m,s,l,r)={got}", "counts",
                        got == tuple(expected_counts),
                        note=f"expected {tuple(expected_counts)}"))
    checks.append(Check("x is surplus interior", "counts",
                        x_label in CAPS["u"][2]))
    checks.append(Check("p is non-surplus strict interior", "counts",
                        center_label in CAPS["v"][2] + CAPS["w"][2]))
    checks.append(Check("class card = 4", "counts", len(cls) == 4))

    ok = all(c.ok for c in checks)
    return ok, checks


# ---------- polynomial engine (for .ms building / comparison) ---------------
# poly = dict[monomial -> Fraction]; monomial = tuple of var names, sorted,
# with repetition (x^2 -> ("x","x")); () = constant term.

def pnorm(d):
    return {m: c for m, c in d.items() if c != 0}


def padd(a, b):
    r = dict(a)
    for m, c in b.items():
        r[m] = r.get(m, F(0)) + c
    return pnorm(r)


def psub(a, b):
    r = dict(a)
    for m, c in b.items():
        r[m] = r.get(m, F(0)) - c
    return pnorm(r)


def pmul(a, b):
    r = {}
    for ma, ca in a.items():
        for mb, cb in b.items():
            m = tuple(sorted(ma + mb))
            r[m] = r.get(m, F(0)) + ca * cb
    return pnorm(r)


def coord_poly(coord):
    if isinstance(coord, str):
        return {(coord,): F(1)}
    return pnorm({(): F(coord)})


def poly_d2(c, m):
    cx, cy = coord_poly(c[0]), coord_poly(c[1])
    mx, my = coord_poly(m[0]), coord_poly(m[1])
    dx, dy = psub(cx, mx), psub(cy, my)
    return padd(pmul(dx, dx), pmul(dy, dy))


# symbolic coordinates in the (v,w) gauge, matching comp_g_encode.py
SYM_COORD = {
    "u": ("ux", "uy"), "v": (0, 0), "w": (1, 0),
    "s1": ("s1x", "s1y"), "s2": ("s2x", "s2y"), "s3": ("s3x", "s3y"),
    "Pw": ("pwx", "pwy"), "Pu": ("pux", "puy"),
    "Q1": ("q1x", "q1y"), "Q2": ("q2x", "q2y"),
}


def class_equations(model):
    """model: dict center-label -> [4 member labels].  Returns
    (list of polys, meta) with the three equidistance polys per center:
    d2(c, m1) - d2(c, mi), i = 2..4 -- the pinned-bank convention."""
    polys, meta = [], []
    for c in LABELS:
        if c not in model:
            continue
        members = model[c]
        assert len(members) == 4 and c not in members
        base = poly_d2(SYM_COORD[c], SYM_COORD[members[0]])
        for mi in members[1:]:
            poly = psub(base, poly_d2(SYM_COORD[c], SYM_COORD[mi]))
            if poly:
                polys.append(poly)
                meta.append((c, members[0], mi))
    return polys, meta


def rabinowitsch_poly(a, b, tvar="t"):
    """t * dist2(a,b) - 1 (per-pair Rabinowitsch distinctness)."""
    dd = poly_d2(SYM_COORD[a], SYM_COORD[b])
    return psub(pmul({(tvar,): F(1)}, dd), {(): F(1)})


def poly_to_str(p):
    """Emit expanded poly as an msolve-parseable string; integer coeffs
    required (true in the 0/1 gauge)."""
    if not p:
        return "0"
    terms = []
    for m in sorted(p.keys(), key=lambda mm: (-len(mm), mm)):
        c = p[m]
        assert c.denominator == 1, f"non-integer coeff {c}"
        c = c.numerator
        if not m:
            terms.append(f"{c}")
            continue
        cnt = {}
        for v in m:
            cnt[v] = cnt.get(v, 0) + 1
        varpart = "*".join(v if e == 1 else f"{v}^{e}"
                           for v, e in sorted(cnt.items()))
        terms.append(varpart if c == 1 else
                     f"-{varpart}" if c == -1 else f"{c}*{varpart}")
    s = terms[0]
    for t in terms[1:]:
        s += (" - " + t[1:]) if t.startswith("-") else (" + " + t)
    return s


# ---------- .ms parser (for cross-validation against stored inputs) ---------

def parse_poly_str(s, varset):
    """Parse a msolve polynomial string (integers, vars, ^, *, +, -, no
    parentheses) into the canonical poly dict."""
    tokens = []
    i, n = 0, len(s)
    while i < n:
        ch = s[i]
        if ch.isspace():
            i += 1
        elif ch in "+-*^":
            tokens.append(ch)
            i += 1
        elif ch.isdigit():
            j = i
            while j < n and s[j].isdigit():
                j += 1
            tokens.append(("num", int(s[i:j])))
            i = j
        elif ch.isalpha() or ch == "_":
            j = i
            while j < n and (s[j].isalnum() or s[j] == "_"):
                j += 1
            name = s[i:j]
            assert name in varset, f"unknown variable {name!r}"
            tokens.append(("var", name))
            i = j
        else:
            raise ValueError(f"unexpected char {ch!r} in {s!r}")
    # grammar: term (('+'|'-') term)*; term: factor ('*' factor)*;
    # factor: num | var ['^' num]
    pos = 0

    def peek():
        return tokens[pos] if pos < len(tokens) else None

    def parse_factor():
        nonlocal pos
        t = tokens[pos]
        pos += 1
        if isinstance(t, tuple) and t[0] == "num":
            return {(): F(t[1])}
        if isinstance(t, tuple) and t[0] == "var":
            exp = 1
            if peek() == "^":
                pos += 1
                nt = tokens[pos]
                pos += 1
                assert isinstance(nt, tuple) and nt[0] == "num"
                exp = nt[1]
            return {tuple([t[1]] * exp): F(1)}
        raise ValueError(f"unexpected token {t}")

    def parse_term():
        nonlocal pos
        acc = parse_factor()
        while peek() == "*":
            pos += 1
            acc = pmul(acc, parse_factor())
        return acc

    sign = 1
    if peek() == "-":
        sign = -1
        pos += 1
    elif peek() == "+":
        pos += 1
    acc = pmul({(): F(sign)}, parse_term())
    while peek() in ("+", "-"):
        sgn = 1 if tokens[pos] == "+" else -1
        pos += 1
        acc = padd(acc, pmul({(): F(sgn)}, parse_term()))
    assert pos == len(tokens)
    return acc


def read_ms(path):
    lines = Path(path).read_text().strip().splitlines()
    variables = [v.strip() for v in lines[0].split(",")]
    assert lines[1].strip() == "0"
    body = "\n".join(lines[2:])
    gens = [g.strip() for g in body.split(",") if g.strip()]
    return variables, gens


def write_ms(path, variables, poly_strs):
    with open(path, "w") as f:
        f.write(",".join(variables) + "\n0\n")
        f.write(",\n".join(poly_strs) + "\n")


# ---------- msolve runner + verdict parser ((D-msolve) tuple grammar) -------

def run_msolve(in_path, timeout_s=600, threads=1):
    out_fd, out_path = tempfile.mkstemp(prefix="msolve_out_", suffix=".ms")
    os.close(out_fd)
    try:
        subprocess.run(["msolve", "-f", str(in_path), "-o", out_path,
                        "-t", str(threads)],
                       check=True, capture_output=True, timeout=timeout_s)
        return Path(out_path).read_text()
    finally:
        Path(out_path).unlink(missing_ok=True)


def _tok_msolve(s):
    toks, i, n = [], 0, len(s)
    numchars = set("0123456789/-")
    while i < n:
        ch = s[i]
        if ch in "[],":
            toks.append(ch)
            i += 1
        elif ch.isspace():
            i += 1
        elif ch in numchars:
            j = i
            while j < n and s[j] in numchars:
                j += 1
            toks.append(("num", s[i:j]))
            i = j
        else:
            raise ValueError(f"unexpected char {ch!r} at {i}")
    return toks


def parse_msolve_output(text):
    """[-1] -> empty; [1, n, -1, []] -> posdim; [0, [mid, [sols]]] -> zerodim
    with nsols real-root boxes (0 boxes = real-empty)."""
    s = text.strip()
    if s.endswith(":"):
        s = s[:-1].strip()
    toks = _tok_msolve(s)
    pos = 0

    def parse_value():
        nonlocal pos
        t = toks[pos]
        if t == "[":
            return parse_list()
        if isinstance(t, tuple):
            pos += 1
            return F(t[1])
        raise ValueError(f"unexpected token {t}")

    def parse_list():
        nonlocal pos
        assert toks[pos] == "["
        pos += 1
        items = []
        if toks[pos] == "]":
            pos += 1
            return items
        while True:
            items.append(parse_value())
            if toks[pos] == ",":
                pos += 1
                continue
            if toks[pos] == "]":
                pos += 1
                return items
            raise ValueError(f"expected , or ] got {toks[pos]}")

    top = parse_value()
    if top == [F(-1)]:
        return {"kind": "empty"}
    if top and top[0] == F(1):
        return {"kind": "posdim", "nvars": int(top[1]) if len(top) > 1 else None}
    if top and top[0] == F(0):
        inner = top[1]
        sols = inner[1] if len(inner) > 1 else []
        return {"kind": "zerodim", "nsols": len(sols)}
    raise ValueError(f"unrecognized msolve verdict head: {top[:2]}")


# ---------- Singular unit-ideal test (project kill format) ------------------

def singular_unit_ideal(variables, poly_strs, timeout_s=600):
    """Return 'unit' | 'nonunit' via Singular std, mirroring
    scripts/pinned-surplus-certificate.py::singular_unit_ideal."""
    body = ",\n".join(poly_strs)
    script = (f"ring r = 0, ({','.join(variables)}), dp;\n"
              f"ideal I = {body};\nideal G = std(I);\n"
              'print("BEGIN_G1");\nstring(G[1]);\nprint("END_G1");\nexit;\n')
    fd, path = tempfile.mkstemp(prefix="two_hit_sing_", suffix=".sing")
    os.close(fd)
    try:
        Path(path).write_text(script)
        proc = subprocess.run(["Singular", "-q", path], capture_output=True,
                              text=True, timeout=timeout_s, check=False)
    finally:
        Path(path).unlink(missing_ok=True)
    if proc.returncode != 0:
        raise RuntimeError(f"Singular failed: {proc.stderr}")
    lines = [ln.strip() for ln in proc.stdout.splitlines() if ln.strip()]
    i0 = lines.index("BEGIN_G1") + 1
    i1 = lines.index("END_G1", i0)
    g1 = "".join(lines[i0:i1]).strip()
    return "unit" if g1 == "1" else "nonunit"
