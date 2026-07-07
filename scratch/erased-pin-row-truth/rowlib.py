#!/usr/bin/env python3
"""Exact-rational library for the erased-pin row-truth probe.

Encoding is REUSED from scratch/two-hit-probe/probe_lib.py (same gauge, hull,
cap, count and check semantics), generalized to:
  * an n=11 model (4 surplus interiors) for rows needing 4 surplus hits;
  * centers that are Moser vertices or surplus interiors (for the two direct
    surplus-side ErasedPinTriple probes) in addition to opp-cap interiors.

Conventions (identical to the two-hit probe / (D-msolve) standards):
  * gauge v=(0,0), w=(1,0); MEC center (1/2, k), R^2 = 1/4 + k^2;
  * hull order ccw: [u, Q1, Q2, v, s1, .., s_T, w, Pw, Pu];
  * caps: C_u (surplus, opp u, chord v-w, interiors s*), C_v (opp v, chord
    w-u, interiors Pw,Pu), C_w (opp w, chord u-v, interiors Q1,Q2);
  * signedArea2(a,b,c) = cross(b-a, c-a) (matches Problem97.signedArea2);
  * strict cap sides / strict convexity / strict in-disk for non-Moser /
    strictly acute Moser triangle (sufficient for the weak Lean conventions);
  * Lean count mapping (surplusIdx=0): center in C_v ints (oppIndex1):
    left bucket = C_w ints, right bucket = surplus ints; center in C_w ints
    (oppIndex2): left = surplus ints, right = C_v ints.

Construction primitives guarantee all EQUALITIES exactly over Q; only strict
inequalities remain, checked as exact Fraction sign tests (exact mode) or used
as float margins (search mode).  The same code path serves both (arithmetic is
generic in the number type).
"""
from __future__ import annotations

from fractions import Fraction

F = Fraction


# ---------- models -----------------------------------------------------------

class Model:
    def __init__(self, n_surplus_ints):
        t = n_surplus_ints
        self.surplus_ints = tuple(f"s{i+1}" for i in range(t))
        self.hull = ("u", "Q1", "Q2", "v") + self.surplus_ints + ("w", "Pw", "Pu")
        self.labels = self.hull
        self.moser = ("u", "v", "w")
        # caps: opposite vertex -> (chord_a, chord_b, interiors)
        self.caps = {
            "u": ("v", "w", self.surplus_ints),
            "v": ("w", "u", ("Pw", "Pu")),
            "w": ("u", "v", ("Q1", "Q2")),
        }
        self.opp1_ints = ("Pw", "Pu")   # capInteriorByIndex oppIndex1
        self.opp2_ints = ("Q1", "Q2")   # capInteriorByIndex oppIndex2
        self.n = len(self.hull)

    def home_cap_of(self, lab):
        for m, (_, _, ints) in self.caps.items():
            if lab in ints:
                return m
        return None


MODEL10 = Model(3)
MODEL11 = Model(4)


# ---------- generic exact/float geometry (identical formulas to probe_lib) ---

def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def sa2(a, b, c):
    return (b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])


def chord_point(k, t):
    """Point on x^2+y^2-x-2ky=0 via chord y=t*x through v=(0,0)."""
    x = (1 + 2 * k * t) / (1 + t * t)
    return (x, t * x)


def rot_t(p, c, t):
    """Rotate p around c by angle with tan(theta/2)=t (exactly preserves
    d2(c, .) over Q and over float)."""
    den = 1 + t * t
    cs, sn = (1 - t * t) / den, 2 * t / den
    dx, dy = p[0] - c[0], p[1] - c[1]
    return (c[0] + dx * cs - dy * sn, c[1] + dx * sn + dy * cs)


def perp_bisector_point(a, b, s):
    """midpoint(a,b) + s * rot90(b-a): exactly equidistant from a and b."""
    mx, my = (a[0] + b[0]) / 2, (a[1] + b[1]) / 2
    dx, dy = b[0] - a[0], b[1] - a[1]
    return (mx - s * dy, my + s * dx)


# ---------- configuration spec ----------------------------------------------

class Spec:
    """A label assignment: which labels form the class, who is the center,
    who is x (erased surplus interior), and how the construction is
    parametrized.

    center_kind:
      'free'      : center is a free 2-dof point (label not in Moser)
      'bisector'  : center = perp_bisector_point(M1, M2, s) for the two Moser
                    hits M1, M2 (1 dof)
      'moser_u'   : center is the frame vertex u (0 dof) — surplus-opposite
                    probe
    anchor: the class member whose position is fixed first (a Moser hit if
    any, else a free 2-dof point); every other non-Moser class member is a
    rotation of the anchor around the center.
    """

    def __init__(self, model, center_label, class_labels, x_label,
                 side=None, row=None, tag=""):
        self.model = model
        self.center = center_label
        self.cls = tuple(class_labels)
        self.x = x_label
        self.side = side          # 'right' / 'left' / None (surplus probes)
        self.row = row            # (m,s,l,r) or None
        self.tag = tag
        assert self.x in self.cls
        assert self.x in model.surplus_ints
        assert self.center not in self.cls
        moser_hits = [z for z in self.cls if z in model.moser]
        self.moser_hits = moser_hits
        if center_label == "u":
            assert center_label not in self.cls
            self.center_kind = "moser_u"
        elif len(moser_hits) == 3:
            # equidistance from u,v,w forces p = circumcenter = MEC center
            self.center_kind = "circumcenter"
        elif len(moser_hits) == 2:
            self.center_kind = "bisector"
        else:
            self.center_kind = "free"
        # anchor: prefer a Moser hit whose position is frame-fixed
        if moser_hits:
            # prefer u (frame param), else v, else w — any works
            for pref in ("u", "v", "w"):
                if pref in moser_hits:
                    self.anchor = pref
                    break
        else:
            self.anchor = self.cls[0]
        # rotated members: non-Moser class members other than the anchor
        self.rotated = [z for z in self.cls
                        if z not in model.moser and z != self.anchor]
        # free labels: everything not Moser, not center, not in class
        self.free = [z for z in model.labels
                     if z not in model.moser and z != self.center
                     and z not in self.cls]

    # parameter layout: [k, t_u] + center params + anchor params (if free)
    #                   + rot t's + free label coords
    def param_names(self):
        names = ["k", "t_u"]
        if self.center_kind == "free":
            names += [f"p_{c}" for c in "xy"]
        elif self.center_kind == "bisector":
            names += ["p_s"]
        # circumcenter / moser_u: no center params
        if self.anchor not in self.model.moser:
            names += [f"anchor_{c}" for c in "xy"]
        for z in self.rotated:
            names.append(f"t_{z}")
        for z in self.free:
            names += [f"{z}_x", f"{z}_y"]
        return names

    def build(self, params):
        """Construct all points from a parameter dict (values Fraction or
        float; formulas are generic).  Returns (pts, k)."""
        model = self.model
        k = params["k"]
        one = k ** 0  # 1 in the right numeric type (Fraction or float)
        zero = one - one
        pts = {"v": (zero, zero), "w": (one, zero)}
        pts["u"] = chord_point(k, params["t_u"])
        # center
        if self.center_kind == "moser_u":
            p = pts["u"]
        elif self.center_kind == "circumcenter":
            p = (one / 2, k)
        elif self.center_kind == "bisector":
            m1, m2 = self.moser_hits
            p = perp_bisector_point(pts[m1], pts[m2], params["p_s"])
        else:
            p = (params["p_x"], params["p_y"])
        if self.center not in ("u", "v", "w"):
            pts[self.center] = p
        # anchor
        if self.anchor in model.moser:
            anchor_pt = pts[self.anchor]
        else:
            anchor_pt = (params["anchor_x"], params["anchor_y"])
            pts[self.anchor] = anchor_pt
        # rotated class members
        for z in self.rotated:
            pts[z] = rot_t(anchor_pt, p, params[f"t_{z}"])
        # free labels
        for z in self.free:
            pts[z] = (params[f"{z}_x"], params[f"{z}_y"])
        return pts, k, p


# ---------- checker -----------------------------------------------------------

class Check:
    def __init__(self, cid, kind, ok, note=""):
        self.cid, self.kind, self.ok, self.note = cid, kind, bool(ok), note

    def row(self):
        return f"[{'PASS' if self.ok else 'FAIL'}] {self.kind:12s} {self.cid}" + (
            f"  ({self.note})" if self.note else "")


def margins(pts, k, spec):
    """All STRICT inequality margins (value > 0 required), as a list of
    (id, value).  Equalities are exact by construction and not listed.
    Works for float or Fraction points identically."""
    model = spec.model
    out = []
    O = ((pts["w"][0] - pts["v"][0]) / 2, k)  # (1/2, k) in generic type
    R2 = O[0] * O[0] + k * k
    p = pts["u"] if spec.center_kind == "moser_u" else pts[spec.center]
    # in-disk: non-Moser strictly inside
    for lab in model.labels:
        if lab not in model.moser:
            out.append((f"disk[{lab}]", R2 - d2(pts[lab], O)))
    # strictly acute Moser triangle
    for m in model.moser:
        others = [pts[z] for z in model.moser if z != m]
        v1 = (others[0][0] - pts[m][0], others[0][1] - pts[m][1])
        v2 = (others[1][0] - pts[m][0], others[1][1] - pts[m][1])
        out.append((f"acute[{m}]", v1[0] * v2[0] + v1[1] * v2[1]))
    # cap sides
    for m, (a, b, interiors) in model.caps.items():
        ref = sa2(pts[m], pts[a], pts[b])
        # chordRef nonzero enforced through the products below
        for z in interiors:
            out.append((f"capIn[{z}@C_{m}]",
                        -(sa2(pts[z], pts[a], pts[b]) * ref)))
        for m2, (_, _, ints2) in model.caps.items():
            if m2 == m:
                continue
            for z in ints2:
                out.append((f"capOut[{z}@C_{m}]",
                            sa2(pts[z], pts[a], pts[b]) * ref))
    # strict convex position: all cyclic hull triples
    hull = model.hull
    n = len(hull)
    for i in range(n):
        for j in range(i + 1, n):
            for kk in range(j + 1, n):
                out.append((f"cvx[{hull[i]},{hull[j]},{hull[kk]}]",
                            sa2(pts[hull[i]], pts[hull[j]], pts[hull[kk]])))
    # distinctness
    for i in range(n):
        for j in range(i + 1, n):
            out.append((f"dist[{hull[i]},{hull[j]}]",
                        d2(pts[hull[i]], pts[hull[j]])))
    # the pin: rho > 0 and off-circle for non-class labels
    rho = d2(p, pts[spec.x])
    out.append(("rho>0", rho))
    center_lab = spec.center
    for lab in model.labels:
        if lab in spec.cls or lab == center_lab:
            continue
        diff = d2(p, pts[lab]) - rho
        out.append((f"off[{lab}]", diff if diff > 0 else -diff))
    return out


def exact_check(pts, k, spec):
    """Full exact audit (Fraction inputs required).  Mirrors the two-hit
    probe check_configuration, generalized.  Returns (ok, checks)."""
    model = spec.model
    checks = []
    O = (F(1, 2), F(k))
    R2 = F(1, 4) + F(k) ** 2
    p = pts["u"] if spec.center_kind == "moser_u" else pts[spec.center]

    checks.append(Check("v=(0,0)", "gauge", pts["v"] == (F(0), F(0))))
    checks.append(Check("w=(1,0)", "gauge", pts["w"] == (F(1), F(0))))
    for m in model.moser:
        checks.append(Check(f"onMEC[{m}]", "frame", d2(pts[m], O) == R2))
    for lab in model.labels:
        dd = d2(pts[lab], O)
        if lab in model.moser:
            checks.append(Check(f"inDisk[{lab}]", "disk", dd <= R2))
        else:
            checks.append(Check(f"strictInDisk[{lab}]", "disk", dd < R2,
                                note=f"margin {R2 - dd}"))
    for m in model.moser:
        others = [pts[z] for z in model.moser if z != m]
        v1 = (others[0][0] - pts[m][0], others[0][1] - pts[m][1])
        v2 = (others[1][0] - pts[m][0], others[1][1] - pts[m][1])
        dot = v1[0] * v2[0] + v1[1] * v2[1]
        checks.append(Check(f"acuteAt[{m}]", "triangle", dot > 0,
                            note=f"dot {dot}"))
    for m, (a, b, interiors) in model.caps.items():
        ref = sa2(pts[m], pts[a], pts[b])
        checks.append(Check(f"chordRef[{m}]", "caps", ref != 0))
        for z in interiors:
            val = sa2(pts[z], pts[a], pts[b])
            checks.append(Check(f"capSide[{z} in C_{m}]", "caps",
                                val * ref < 0))
        for m2, (_, _, ints2) in model.caps.items():
            if m2 == m:
                continue
            for z in ints2:
                val = sa2(pts[z], pts[a], pts[b])
                checks.append(Check(f"notInCap[{z} vs C_{m}]", "caps",
                                    val * ref > 0))
    hull = model.hull
    n = len(hull)
    conv_ok, worst = True, None
    for i in range(n):
        for j in range(i + 1, n):
            for kk in range(j + 1, n):
                val = sa2(pts[hull[i]], pts[hull[j]], pts[hull[kk]])
                if worst is None or val < worst[1]:
                    worst = ((hull[i], hull[j], hull[kk]), val)
                if not (val > 0):
                    conv_ok = False
    checks.append(Check(f"convex[all {n*(n-1)*(n-2)//6} cyclic triples]",
                        "convex", conv_ok,
                        note=f"min sa2 {worst[1]} at {worst[0]}"))
    dist_ok = True
    for i in range(n):
        for j in range(i + 1, n):
            if d2(pts[hull[i]], pts[hull[j]]) == 0:
                dist_ok = False
    checks.append(Check(f"distinct[all {n*(n-1)//2} pairs]", "distinct",
                        dist_ok))
    # the pin
    rho = d2(p, pts[spec.x])
    checks.append(Check("radius2>0", "pin", rho > 0, note=f"rho {rho}"))
    for z in spec.cls:
        checks.append(Check(f"onClassCircle[{z}]", "pin", d2(p, pts[z]) == rho))
    for lab in model.labels:
        if lab in spec.cls or lab == spec.center:
            continue
        dd = d2(p, pts[lab])
        checks.append(Check(f"offClassCircle[{lab}]", "pin", dd != rho))
    checks.append(Check("class card = 4", "pin", len(set(spec.cls)) == 4))
    # erased-pin shape
    checks.append(Check("x in surplus ints", "shape",
                        spec.x in model.surplus_ints))
    checks.append(Check("x != center", "shape", spec.x != spec.center))
    # counts (only for opp-cap interior centers)
    if spec.side in ("right", "left"):
        cls = set(spec.cls)
        m_ct = len(cls & set(model.moser))
        home = model.home_cap_of(spec.center)
        s_ct = len((cls & set(model.caps[home][2])) - {spec.center})
        if spec.side == "right":
            checks.append(Check("center in oppIndex1 ints", "counts",
                                spec.center in model.opp1_ints))
            l_ct = len(cls & set(model.opp2_ints))
            r_ct = len(cls & set(model.surplus_ints))
        else:
            checks.append(Check("center in oppIndex2 ints", "counts",
                                spec.center in model.opp2_ints))
            l_ct = len(cls & set(model.surplus_ints))
            r_ct = len(cls & set(model.opp1_ints))
        got = (m_ct, s_ct, l_ct, r_ct)
        checks.append(Check(f"counts(m,s,l,r)={got}", "counts",
                            got == tuple(spec.row),
                            note=f"expected {tuple(spec.row)}"))
    else:
        # surplus-side probes: center placement checks
        if spec.center_kind == "moser_u":
            checks.append(Check("center = u (surplus-opposite vertex)",
                                "shape", True))
        else:
            checks.append(Check("center in surplus ints", "shape",
                                spec.center in model.surplus_ints))
    ok = all(c.ok for c in checks)
    return ok, checks


# ---------- mirror map (right -> left), exact --------------------------------

def mirror_witness(pts, model):
    """Reflect (x,y) -> (1-x, y) and relabel (v w)(Pw Q2)(Pu Q1) +
    reversal of the surplus interiors.  Returns new pts dict (same model)."""
    t = len(model.surplus_ints)
    relabel = {"u": "u", "v": "w", "w": "v",
               "Pw": "Q2", "Pu": "Q1", "Q2": "Pw", "Q1": "Pu"}
    for i, s in enumerate(model.surplus_ints):
        relabel[s] = model.surplus_ints[t - 1 - i]
    out = {}
    for lab, (x, y) in pts.items():
        one = x - x + 1
        out[relabel[lab]] = (one - x, y)
    return out, relabel
