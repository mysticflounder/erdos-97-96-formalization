"""Plot the two known k=3 witnesses (every vertex has >= 3 others
equidistant from it, in convex position), with each vertex's
equidistant-set circle drawn.

1. docs/assets/danzer-9gon-k3.png — the 9-point exact-Q(sqrt3) control
   (scratch/p97-search-lane/k3-control-research.md section 6, verified by
   verify_k3_control.py; Danzer-style: threefold symmetry, the witness
   distance VARIES per vertex).  Overview + 3x3 small multiples: one
   panel per vertex, showing its circle through its 3 equidistant
   witnesses.
2. docs/assets/fr-20gon-k3.png — the Fishburn–Reeds 1992 20-gon
   (scratch/p97-search-lane/fishburn-reeds-notes.md Table 1; a SINGLE
   common distance 1, all witnesses across the cut {A, B}).  Overview +
   2x5 small multiples for the B-side vertices (A-side sets are the
   mirror images).  NOTE the vertices come in near-coincident triples
   (Table 1: ~0.003 apart) — the tight clusters are real, not plotting
   error.

Run: uv run python scratch/p97-search-lane/plot_k3_witnesses.py
"""
from __future__ import annotations

import math
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

REPO = Path(__file__).resolve().parents[2]
ASSETS = REPO / "docs" / "assets"
ASSETS.mkdir(parents=True, exist_ok=True)

# --------------------------------------------------------------------------
# 9-point control: exact coordinates + exact equidistant grouping via sympy
# --------------------------------------------------------------------------
from sympy import Rational as Q, sqrt, expand, simplify  # noqa: E402

R3 = sqrt(3)
PTS = [
    (-R3, Q(-1)),
    (Q(-8991, 10927) * R3, Q(-26503, 10927)),
    (Q(-10753, 18529) * R3, Q(-44665, 18529)),
    (R3, Q(-1)),
    (Q(17747, 10927) * R3, Q(-235, 10927)),
    (Q(27709, 18529) * R3, Q(6203, 18529)),
    (Q(0), Q(2)),
    (Q(-8756, 10927) * R3, Q(26738, 10927)),
    (Q(-16956, 18529) * R3, Q(38462, 18529)),
]  # identical literals to verify_k3_control.py (its checks verify them)

N9 = len(PTS)
groups: list[tuple[list[int], float]] = []  # (witness indices, radius) per point
for i in range(N9):
    by_d2: dict = {}
    for j in range(N9):
        if j == i:
            continue
        key = simplify(expand((PTS[i][0] - PTS[j][0]) ** 2 + (PTS[i][1] - PTS[j][1]) ** 2))
        by_d2.setdefault(key, []).append(j)
    d2, wit = max(by_d2.items(), key=lambda kv: len(kv[1]))
    assert len(wit) == 3, f"P{i}: witness group size {len(wit)} != 3"
    groups.append((wit, math.sqrt(float(d2))))

fp = [(float(p[0]), float(p[1])) for p in PTS]
cx = sum(p[0] for p in fp) / N9
cy = sum(p[1] for p in fp) / N9
hull = sorted(range(N9), key=lambda i: math.atan2(fp[i][1] - cy, fp[i][0] - cx))
poly9 = [fp[i] for i in hull] + [fp[hull[0]]]
cmap = plt.get_cmap("tab10")


def draw_9gon_base(ax, dim: float = 0.55):
    ax.plot([p[0] for p in poly9], [p[1] for p in poly9], color="0.8", lw=1.0,
            zorder=1)
    for i in range(N9):
        ax.plot(*fp[i], "o", color="0.3", ms=3.5, alpha=dim, zorder=2)


fig = plt.figure(figsize=(12, 17))
gs = fig.add_gridspec(4, 3, height_ratios=[1.35, 1, 1, 1], hspace=0.28,
                      wspace=0.18)

ax = fig.add_subplot(gs[0, :])
draw_9gon_base(ax, dim=1.0)
for i in range(N9):
    col = cmap(i % 10)
    wit, r = groups[i]
    for j in wit:
        ax.plot([fp[i][0], fp[j][0]], [fp[i][1], fp[j][1]], color=col, lw=1.1,
                alpha=0.6, zorder=3)
for i in range(N9):
    ax.plot(*fp[i], "o", color="black", ms=5, zorder=4)
    dx, dy = fp[i][0] - cx, fp[i][1] - cy
    nrm = math.hypot(dx, dy)
    ax.annotate(f"P{i}", fp[i], textcoords="offset points",
                xytext=(14 * dx / nrm, 14 * dy / nrm), fontsize=11,
                ha="center", va="center")
ax.set_aspect("equal")
ax.margins(0.12)
ax.set_title(
    "9-point k=3 witness — exact ℚ(√3) coordinates, threefold symmetry,\n"
    "per-vertex witness distances; segments join each vertex to its 3 "
    "equidistant witnesses"
)

for i in range(N9):
    axi = fig.add_subplot(gs[1 + i // 3, i % 3])
    col = cmap(i % 10)
    wit, r = groups[i]
    draw_9gon_base(axi)
    axi.add_patch(Circle(fp[i], r, fill=False, ec=col, ls="--", lw=1.4,
                         zorder=3))
    for j in wit:
        axi.plot([fp[i][0], fp[j][0]], [fp[i][1], fp[j][1]], color=col,
                 lw=1.2, alpha=0.8, zorder=4)
        axi.plot(*fp[j], "o", color=col, ms=6, zorder=5)
    axi.plot(*fp[i], "o", color="black", ms=7, zorder=6)
    axi.set_aspect("equal")
    axi.set_xlim(-3.6, 4.0)
    axi.set_ylim(-3.4, 3.6)
    axi.set_xticks([])
    axi.set_yticks([])
    axi.set_title(f"P{i}: circle radius {r:.3f} through its 3 witnesses",
                  fontsize=10)

fig.savefig(ASSETS / "danzer-9gon-k3.png", dpi=150, bbox_inches="tight")
plt.close(fig)

# --------------------------------------------------------------------------
# Fishburn–Reeds 20-gon: Table 1 (fishburn-reeds-notes.md), milli-units
# --------------------------------------------------------------------------
X = {1: 469.633821777, 2: 471.414237018, 3: 473.126180256,
     4: 520.000000000, 5: 520.996246864, 6: 522.000000000,
     7: 429.872125856, 8: 429.224646090, 9: 428.539574537,
     10: 390.440922261}
Y = {1: -92.982777730, 2: -89.969229800, 3: -87.048665472,
     4: 30.000000000, 5: 33.000000000, 6: 36.100000000,
     7: 342.595442083, 8: 344.599064292, 9: 346.658610393,
     10: 417.185267785}
EDGES = [(1, 10), (2, 10), (3, 10), (1, 9), (4, 9), (5, 9), (2, 5),
         (3, 4), (1, 6), (3, 7), (5, 7), (6, 7), (2, 8), (4, 8), (6, 8)]
PARTNERS = {i: sorted({j for a, b in EDGES for i2, j in ((a, b), (b, a))
                       if i2 == i}) for i in range(1, 11)}

B = {i: (X[i] / 1000, Y[i] / 1000) for i in X}       # B-side (right)
A = {i: (-X[i] / 1000, Y[i] / 1000) for i in X}      # A-side (mirror)
order20 = [B[i] for i in range(1, 11)] + [A[i] for i in range(10, 0, -1)]
poly20 = order20 + [order20[0]]


def draw_20gon_base(ax, ms: float = 4.0):
    ax.plot([p[0] for p in poly20], [p[1] for p in poly20], color="0.8",
            lw=1.0, zorder=1)
    ax.axvline(0.0, color="0.65", ls=":", lw=0.9, zorder=1)
    for i in range(1, 11):
        ax.plot(*A[i], "o", color="tab:red", ms=ms, zorder=2)
        ax.plot(*B[i], "o", color="tab:blue", ms=ms, zorder=2)


fig = plt.figure(figsize=(13, 11))
gs = fig.add_gridspec(3, 5, height_ratios=[2.4, 1, 1], hspace=0.18,
                      wspace=0.12)

ax = fig.add_subplot(gs[0, :])
draw_20gon_base(ax, ms=5.0)
for i, j in EDGES:
    for p, q in ((A[i], B[j]), (A[j], B[i])):
        ax.plot([p[0], q[0]], [p[1], q[1]], color="tab:green", lw=1.0,
                alpha=0.75, zorder=3)
for txt, i, side, off in [("b$_{1..3}$", 2, B, (16, -6)),
                          ("b$_{4..6}$", 5, B, (16, 0)),
                          ("b$_{7..9}$", 8, B, (14, 8)),
                          ("b$_{10}$", 10, B, (10, 10)),
                          ("a$_{1..3}$", 2, A, (-26, -6)),
                          ("a$_{4..6}$", 5, A, (-26, 0)),
                          ("a$_{7..9}$", 8, A, (-24, 8)),
                          ("a$_{10}$", 10, A, (-20, 10))]:
    col = "tab:blue" if side is B else "tab:red"
    ax.annotate(txt, side[i], textcoords="offset points", xytext=off,
                fontsize=11, color=col)
ax.set_aspect("equal")
ax.margins(0.10)
ax.set_title(
    "Fishburn–Reeds 20-gon — single common distance 1, cut {A, B} (dotted "
    "line);\ngreen: the 30 unit-distance pairs (3 per vertex, all across the "
    "cut). Vertices come in\nnear-coincident triples (~0.003 apart) — the "
    "tight clusters are in Table 1, not plotting error."
)

for idx, i in enumerate(range(1, 11)):
    axi = fig.add_subplot(gs[1 + idx // 5, idx % 5])
    draw_20gon_base(axi, ms=2.8)
    axi.add_patch(Circle(B[i], 1.0, fill=False, ec="tab:blue", ls="--",
                         lw=1.3, zorder=3))
    for j in PARTNERS[i]:
        axi.plot([B[i][0], A[j][0]], [B[i][1], A[j][1]], color="tab:green",
                 lw=1.2, alpha=0.9, zorder=4)
        axi.plot(*A[j], "o", color="tab:red", ms=5.5, zorder=5)
    axi.plot(*B[i], "o", color="black", ms=6.5, zorder=6)
    axi.set_aspect("equal")
    axi.set_xlim(-0.72, 0.75)
    axi.set_ylim(-0.30, 0.62)
    axi.set_xticks([])
    axi.set_yticks([])
    axi.set_title(f"b$_{{{i}}}$: partners a$_{{{PARTNERS[i][0]}}}$, "
                  f"a$_{{{PARTNERS[i][1]}}}$, a$_{{{PARTNERS[i][2]}}}$",
                  fontsize=9)

fig.savefig(ASSETS / "fr-20gon-k3.png", dpi=150, bbox_inches="tight")
plt.close(fig)

print(f"wrote {ASSETS / 'danzer-9gon-k3.png'}")
print(f"wrote {ASSETS / 'fr-20gon-k3.png'}")
