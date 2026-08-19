#!/usr/bin/env python3
"""Render the README header figure: the three engines of the Problem 97 proof.

Emits two theme variants of one three-panel SVG diagram:

    docs/assets/p97-architecture-light.svg
    docs/assets/p97-architecture-dark.svg

The README embeds them through a ``<picture>`` element so GitHub picks the
variant matching the reader's colour scheme.  Both variants have a transparent
background; only the stroke and label colours differ.

All geometry is computed here rather than hand-placed, so the figure is a true
picture of the objects it names:

  Panel 1 (counting engine).  A vertex ``p`` with four other points of the set
    at a common distance from it -- the ``HasNEquidistantProperty 4`` hypothesis
    -- drawn as four radii of one circle centred at ``p``.  The shaded triangle
    ``p w2 w3`` is isosceles, so ``p`` lies on the perpendicular bisector of
    ``w2 w3``; that bisector and its right angle are the primitive the
    Dumitrescu-style double count of isosceles triples is built from.

  Panel 2 (structure).  Twelve points in convex position, three of them on the
    minimum enclosing circle.  Those three are the Moser triangle; its sides cut
    the disc into the three caps the whole case analysis is indexed by.  The
    triangle is non-obtuse, which is what makes the caps well behaved.

  Panel 3 (descent engine).  The same point set with one vertex marked
    removable: deleting it leaves a strictly smaller set that is still a
    counterexample, contradicting minimality.

Run:

    uv run python scripts/render-readme-figure.py

The script has no third-party dependencies.
"""

from __future__ import annotations

import math
from dataclasses import dataclass
from pathlib import Path

# --------------------------------------------------------------------------
# Canvas geometry
# --------------------------------------------------------------------------

PANEL_W = 400
PANEL_H = 400
GAP = 44
PAD_X = 26
PAD_TOP = 34
CAPTION_H = 84

WIDTH = PAD_X * 2 + PANEL_W * 3 + GAP * 2
HEIGHT = PAD_TOP + PANEL_H + CAPTION_H


@dataclass(frozen=True)
class Palette:
    """Stroke and text colours for one colour scheme."""

    ink: str  # primary strokes and headings
    text: str  # body labels
    muted: str  # construction lines, hull outlines
    faint: str  # cap shading, very light rules
    blue: str  # the distinguished vertex / removable vertex
    amber: str  # the equal-distance structure
    rose: str  # the minimum enclosing circle
    green: str  # the Moser triangle
    cap_fill: str
    tri_fill: str


LIGHT = Palette(
    ink="#111827",
    text="#374151",
    muted="#9ca3af",
    faint="#d1d5db",
    blue="#2563eb",
    amber="#b45309",
    rose="#be123c",
    green="#047857",
    cap_fill="#2563eb",
    tri_fill="#047857",
)

DARK = Palette(
    ink="#e6edf3",
    text="#c9d1d9",
    muted="#6e7681",
    faint="#30363d",
    blue="#58a6ff",
    amber="#e3b341",
    rose="#ff7b72",
    green="#3fb950",
    cap_fill="#58a6ff",
    tri_fill="#3fb950",
)

FONT = (
    "ui-sans-serif,-apple-system,BlinkMacSystemFont,'Segoe UI',"
    "Helvetica,Arial,sans-serif"
)
MONO = "ui-monospace,SFMono-Regular,'SF Mono',Menlo,Consolas,monospace"


# --------------------------------------------------------------------------
# Small vector helpers.  Work in maths coordinates (y up), convert at emit time.
# --------------------------------------------------------------------------

Pt = tuple[float, float]


def polar(centre: Pt, radius: float, degrees: float) -> Pt:
    theta = math.radians(degrees)
    return (centre[0] + radius * math.cos(theta), centre[1] + radius * math.sin(theta))


def sub(a: Pt, b: Pt) -> Pt:
    return (a[0] - b[0], a[1] - b[1])


def add(a: Pt, b: Pt) -> Pt:
    return (a[0] + b[0], a[1] + b[1])


def scale(a: Pt, k: float) -> Pt:
    return (a[0] * k, a[1] * k)


def norm(a: Pt) -> float:
    return math.hypot(a[0], a[1])


def unit(a: Pt) -> Pt:
    n = norm(a)
    return (a[0] / n, a[1] / n) if n else (0.0, 0.0)


def perp(a: Pt) -> Pt:
    return (-a[1], a[0])


def midpoint(a: Pt, b: Pt) -> Pt:
    return ((a[0] + b[0]) / 2, (a[1] + b[1]) / 2)


def angle_of(a: Pt) -> float:
    return math.degrees(math.atan2(a[1], a[0]))


def cross(o: Pt, a: Pt, b: Pt) -> float:
    return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])


def is_convex_ccw(points: list[Pt]) -> bool:
    """True when ``points``, in order, are the vertices of a convex polygon."""
    n = len(points)
    return all(
        cross(points[i], points[(i + 1) % n], points[(i + 2) % n]) > 0 for i in range(n)
    )


class Canvas:
    """Accumulates SVG elements for one panel, flipping y on the way out."""

    def __init__(self, origin_x: float, origin_y: float, height: float) -> None:
        self.ox = origin_x
        self.oy = origin_y
        self.h = height
        self.parts: list[str] = []

    # -- coordinate transform ------------------------------------------------
    def xy(self, p: Pt) -> Pt:
        """Maths coordinates within the panel -> absolute SVG coordinates."""
        return (self.ox + p[0], self.oy + (self.h - p[1]))

    def f(self, p: Pt) -> str:
        x, y = self.xy(p)
        return f"{x:.2f} {y:.2f}"

    # -- primitives ----------------------------------------------------------
    def line(self, a: Pt, b: Pt, stroke: str, width: float = 1.4, dash: str = "",
             opacity: float = 1.0, cap: str = "round") -> None:
        ax, ay = self.xy(a)
        bx, by = self.xy(b)
        d = f' stroke-dasharray="{dash}"' if dash else ""
        o = f' stroke-opacity="{opacity}"' if opacity != 1.0 else ""
        self.parts.append(
            f'<line x1="{ax:.2f}" y1="{ay:.2f}" x2="{bx:.2f}" y2="{by:.2f}" '
            f'stroke="{stroke}" stroke-width="{width}" stroke-linecap="{cap}"{d}{o}/>'
        )

    def circle(self, c: Pt, r: float, stroke: str = "none", width: float = 1.4,
               fill: str = "none", dash: str = "", opacity: float = 1.0,
               fill_opacity: float = 1.0) -> None:
        cx, cy = self.xy(c)
        d = f' stroke-dasharray="{dash}"' if dash else ""
        o = f' stroke-opacity="{opacity}"' if opacity != 1.0 else ""
        fo = f' fill-opacity="{fill_opacity}"' if fill_opacity != 1.0 else ""
        self.parts.append(
            f'<circle cx="{cx:.2f}" cy="{cy:.2f}" r="{r:.2f}" fill="{fill}"{fo} '
            f'stroke="{stroke}" stroke-width="{width}"{d}{o}/>'
        )

    def dot(self, c: Pt, r: float, fill: str, stroke: str = "none",
            width: float = 0.0) -> None:
        cx, cy = self.xy(c)
        s = f' stroke="{stroke}" stroke-width="{width}"' if stroke != "none" else ""
        self.parts.append(
            f'<circle cx="{cx:.2f}" cy="{cy:.2f}" r="{r:.2f}" fill="{fill}"{s}/>'
        )

    def path(self, d: str, stroke: str = "none", width: float = 1.4,
             fill: str = "none", dash: str = "", opacity: float = 1.0,
             fill_opacity: float = 1.0) -> None:
        da = f' stroke-dasharray="{dash}"' if dash else ""
        o = f' stroke-opacity="{opacity}"' if opacity != 1.0 else ""
        fo = f' fill-opacity="{fill_opacity}"' if fill_opacity != 1.0 else ""
        self.parts.append(
            f'<path d="{d}" fill="{fill}"{fo} stroke="{stroke}" '
            f'stroke-width="{width}" stroke-linejoin="round" '
            f'stroke-linecap="round"{da}{o}/>'
        )

    def polygon(self, pts: list[Pt], stroke: str = "none", width: float = 1.4,
                fill: str = "none", dash: str = "", opacity: float = 1.0,
                fill_opacity: float = 1.0) -> None:
        d = "M " + " L ".join(self.f(p) for p in pts) + " Z"
        self.path(d, stroke, width, fill, dash, opacity, fill_opacity)

    def arc(self, centre: Pt, radius: float, a0: float, a1: float, stroke: str,
            width: float = 1.2, dash: str = "", opacity: float = 1.0,
            fill: str = "none", fill_opacity: float = 1.0) -> None:
        """Circular arc from angle ``a0`` to ``a1`` (degrees, counterclockwise)."""
        p0 = self.xy(polar(centre, radius, a0))
        p1 = self.xy(polar(centre, radius, a1))
        # Flipping y reverses orientation: increasing maths angle is sweep 0,
        # decreasing maths angle is sweep 1.  Getting this wrong silently draws
        # the reflex angle instead of the one meant.
        sweep = 0 if a1 >= a0 else 1
        large = 1 if abs(a1 - a0) > 180 else 0
        d = (
            f"M {p0[0]:.2f} {p0[1]:.2f} "
            f"A {radius:.2f} {radius:.2f} 0 {large} {sweep} {p1[0]:.2f} {p1[1]:.2f}"
        )
        self.path(d, stroke, width, fill, dash, opacity, fill_opacity)

    def segment_region(self, centre: Pt, radius: float, a0: float, a1: float,
                       fill: str, fill_opacity: float) -> None:
        """Fill the circular segment cut off by the chord from ``a0`` to ``a1``."""
        p0 = self.xy(polar(centre, radius, a0))
        p1 = self.xy(polar(centre, radius, a1))
        large = 1 if abs(a1 - a0) > 180 else 0
        d = (
            f"M {p0[0]:.2f} {p0[1]:.2f} "
            f"A {radius:.2f} {radius:.2f} 0 {large} 0 {p1[0]:.2f} {p1[1]:.2f} Z"
        )
        self.path(d, fill=fill, fill_opacity=fill_opacity)

    def angle_mark(self, vertex: Pt, a: Pt, b: Pt, radius: float, stroke: str,
                   width: float = 1.2, opacity: float = 1.0) -> tuple[float, float]:
        """Arc marking the angle at ``vertex`` between rays to ``a`` and ``b``.

        Returns the arc's angular midpoint and the ray half-width, so callers can
        place a label on the bisector.
        """
        a0 = angle_of(sub(a, vertex))
        a1 = angle_of(sub(b, vertex))
        while a1 - a0 > 180:
            a1 -= 360
        while a0 - a1 > 180:
            a1 += 360
        self.arc(vertex, radius, a0, a1, stroke, width, opacity=opacity)
        return (a0 + a1) / 2, abs(a1 - a0) / 2

    def right_angle(self, vertex: Pt, a: Pt, b: Pt, size: float, stroke: str,
                    width: float = 1.2) -> None:
        """Square marker for a right angle at ``vertex`` between rays to a and b."""
        u = scale(unit(sub(a, vertex)), size)
        v = scale(unit(sub(b, vertex)), size)
        corner = add(add(vertex, u), v)
        d = (
            f"M {self.f(add(vertex, u))} L {self.f(corner)} L {self.f(add(vertex, v))}"
        )
        self.path(d, stroke=stroke, width=width)

    def tick(self, a: Pt, b: Pt, stroke: str, size: float = 6.0,
             width: float = 1.6) -> None:
        """A single hatch across the midpoint of ``ab`` -- an equal-length mark."""
        m = midpoint(a, b)
        n = scale(unit(perp(sub(b, a))), size)
        self.line(sub(m, n), add(m, n), stroke, width)

    def text(self, p: Pt, s: str, fill: str, size: float = 15.0,
             anchor: str = "middle", weight: str = "400", italic: bool = False,
             family: str = FONT, dy: float = 0.0, opacity: float = 1.0,
             letter_spacing: str = "") -> None:
        x, y = self.xy(p)
        st = ' font-style="italic"' if italic else ""
        o = f' fill-opacity="{opacity}"' if opacity != 1.0 else ""
        ls = f' letter-spacing="{letter_spacing}"' if letter_spacing else ""
        self.parts.append(
            f'<text x="{x:.2f}" y="{y + dy:.2f}" fill="{fill}"{o} '
            f'font-family="{family}" font-size="{size}" font-weight="{weight}"'
            f'{st}{ls} text-anchor="{anchor}">{s}</text>'
        )


# --------------------------------------------------------------------------
# Panel 1 -- the 4-equidistant hypothesis and the isosceles primitive
# --------------------------------------------------------------------------

def panel_counting(c: Canvas, pal: Palette) -> None:
    p = (200.0, 62.0)
    radius = 152.0
    witness_angles = [24.0, 67.0, 113.0, 156.0]
    w = [polar(p, radius, a) for a in witness_angles]

    # The five points are in convex position: p sits below a circular arc.
    hull = [p, w[0], w[1], w[2], w[3]]
    assert is_convex_ccw(hull), "panel 1 points are not in convex position"

    # Convex hull of the local configuration, drawn faintly for context.
    c.polygon(hull, stroke=pal.faint, width=1.2, dash="1 5")

    # The circle centred at p through the four witnesses.
    c.arc(p, radius, 8.0, 172.0, pal.amber, width=1.5, dash="6 5", opacity=0.85)

    # The isosceles triangle p w2 w3 and the perpendicular bisector of w2 w3.
    c.polygon([p, w[1], w[2]], fill=pal.cap_fill, fill_opacity=0.10)
    m = midpoint(w[1], w[2])
    c.line(p, m, pal.blue, width=1.3, dash="4 4")
    c.line(w[1], w[2], pal.blue, width=1.3)
    c.right_angle(m, p, w[2], 11.0, pal.blue, width=1.3)

    # The four equal radii, each carrying one hatch mark.
    for point in w:
        c.line(p, point, pal.amber, width=1.6)
        c.tick(p, point, pal.amber, size=6.0, width=1.8)

    # Angle marks between consecutive radii, staggered so the arcs stay legible.
    arc_radii = [46.0, 62.0, 46.0]
    labels = ["&#952;&#8321;", "&#952;&#8322;", "&#952;&#8323;"]
    for i, (ar, lab) in enumerate(zip(arc_radii, labels)):
        mid, _ = c.angle_mark(p, w[i], w[i + 1], ar, pal.text, width=1.2, opacity=0.75)
        c.text(polar(p, ar + 15.0, mid), lab, pal.text, size=13.5, dy=4.5)

    # Point labels.
    c.dot(p, 5.6, pal.blue)
    c.text(add(p, (0.0, -22.0)), "p", pal.blue, size=17, weight="600", italic=True)
    for i, point in enumerate(w):
        c.dot(point, 4.6, pal.ink)
        out = scale(unit(sub(point, p)), 21.0)
        c.text(add(point, out), f"w<tspan font-size='11' dy='3'>{i + 1}</tspan>",
               pal.text, size=15, italic=True, dy=5.0)

    # The equal-distance annotation, placed clear of the construction lines.
    c.text((200.0, 268.0),
           "|p&#8722;w<tspan font-size='11' dy='3'>1</tspan>"
           "<tspan dy='-3'>| = &#8943; = |p&#8722;w</tspan>"
           "<tspan font-size='11' dy='3'>4</tspan><tspan dy='-3'>|</tspan>",
           pal.amber, size=15, weight="600")


# --------------------------------------------------------------------------
# Panel 2 -- minimum enclosing circle, Moser triangle, three caps
# --------------------------------------------------------------------------

def convex_shell(centre: Pt, radius: float, epsilon: float,
                 angles: list[float]) -> list[Pt]:
    """Points on a convex curve that touches ``radius`` at every 120 degrees.

    ``r(theta) = radius * (1 - epsilon * (1 - cos 3(theta - 90)) / 2)`` equals
    ``radius`` at 90, 210 and 330 degrees and dips inside the circle between
    them, which is exactly the shape needed: three points on the minimum
    enclosing circle, the rest strictly inside it but still in convex position.
    """
    out = []
    for a in angles:
        k = 1.0 - epsilon * (1.0 - math.cos(math.radians(3.0 * (a - 90.0)))) / 2.0
        out.append(polar(centre, radius * k, a))
    return out


def panel_structure(c: Canvas, pal: Palette) -> tuple[Pt, float, list[Pt], list[int]]:
    o = (200.0, 196.0)
    radius = 150.0
    epsilon = 0.075

    angles = [90.0 + 30.0 * k for k in range(12)]
    pts = convex_shell(o, radius, epsilon, angles)
    assert is_convex_ccw(pts), "panel 2 shell is not convex"

    tri_idx = [0, 4, 8]  # the vertices sitting at 90, 210 and 330 degrees
    tri = [pts[i] for i in tri_idx]
    for t in tri:
        assert abs(norm(sub(t, o)) - radius) < 1e-9, "triangle vertex left the circle"
    for i, q in enumerate(pts):
        if i not in tri_idx:
            assert norm(sub(q, o)) < radius - 1e-9, "shell point escaped the circle"

    # The drawn circle is genuinely the *minimum* enclosing circle of the twelve
    # points: three of them lie on it, and those three span a triangle that
    # contains the centre, which is the standard certificate of minimality.  Any
    # smaller circle would have to drop one of the three.
    assert all(cross(tri[i], tri[(i + 1) % 3], o) > 0 for i in range(3)), (
        "the centre escaped the Moser triangle -- the circle is not the MEC"
    )

    # The three caps, shaded, then the minimum enclosing circle over them.
    for a0 in (90.0, 210.0, 330.0):
        c.segment_region(o, radius, a0, a0 + 120.0, pal.cap_fill, 0.13)
    c.circle(o, radius, stroke=pal.rose, width=1.7)

    # The Moser triangle.
    c.polygon(tri, stroke=pal.green, width=1.9, fill=pal.tri_fill, fill_opacity=0.07)

    # Interior angles of the triangle -- the non-obtuseness the caps rely on.
    # The label rides the bisector, which points inward, so it stays in frame.
    for i in range(3):
        v, a, b = tri[i], tri[(i + 1) % 3], tri[(i + 2) % 3]
        mid, _ = c.angle_mark(v, a, b, 30.0, pal.green, width=1.3, opacity=0.9)
        lab = polar(v, 46.0, mid)
        assert 0 < lab[0] < PANEL_W and 0 < lab[1] < PANEL_H, "angle label off panel"
        c.text(lab, "&#8804;90&#176;", pal.green, size=11.5, dy=4.0)

    # The convex point set itself.
    c.polygon(pts, stroke=pal.muted, width=1.2, dash="3 4")
    for i, q in enumerate(pts):
        if i in tri_idx:
            c.dot(q, 6.0, pal.green)
        else:
            c.dot(q, 4.4, pal.ink)

    c.dot(o, 2.8, pal.rose)
    c.text(add(o, (0.0, -20.0)), "O", pal.rose, size=13, italic=True)

    # Cap labels, on the bisector of each cap's arc.
    for k, a0 in enumerate((90.0, 210.0, 330.0)):
        c.text(polar(o, radius * 0.80, a0 + 60.0),
               f"cap<tspan font-size='10' dy='3'>{k + 1}</tspan>", pal.blue,
               size=12.5, dy=4.0, opacity=0.95)

    # Label the circle itself, on the arc rather than in a second caption line.
    c.text(polar(o, radius + 22.0, 55.0), "MEC", pal.rose, size=12.5,
           weight="700", dy=4.0)

    return o, radius, pts, tri_idx


# --------------------------------------------------------------------------
# Panel 3 -- the descent step
# --------------------------------------------------------------------------

def panel_descent(c: Canvas, pal: Palette) -> None:
    o = (200.0, 196.0)
    radius = 150.0
    epsilon = 0.075
    angles = [90.0 + 30.0 * k for k in range(12)]
    pts = convex_shell(o, radius, epsilon, angles)

    v_idx = 2  # a vertex strictly inside a cap, so removing it is not degenerate
    v = pts[v_idx]
    prev_pt = pts[(v_idx - 1) % 12]
    next_pt = pts[(v_idx + 1) % 12]
    smaller = [q for i, q in enumerate(pts) if i != v_idx]
    assert is_convex_ccw(smaller), "the reduced point set is not convex"

    # The original set, drawn lightly.
    c.polygon(pts, stroke=pal.muted, width=1.2, dash="3 4")

    # The set that survives the deletion.
    c.polygon(smaller, stroke=pal.blue, width=2.0, fill=pal.cap_fill,
              fill_opacity=0.09)

    # The two edges lost and the chord gained.
    c.line(prev_pt, v, pal.rose, width=1.5, dash="5 4", opacity=0.9)
    c.line(v, next_pt, pal.rose, width=1.5, dash="5 4", opacity=0.9)

    # The interior angle at the removed vertex.
    mid, _ = c.angle_mark(v, prev_pt, next_pt, 34.0, pal.rose, width=1.3)
    c.text(polar(v, 52.0, mid), "&#966;", pal.rose, size=14, dy=4.5, italic=True)

    for i, q in enumerate(pts):
        if i == v_idx:
            continue
        c.dot(q, 4.4, pal.ink)

    # The removed vertex: hollow ring plus a cross.
    c.circle(v, 9.5, stroke=pal.rose, width=1.9, fill="none")
    for dx, dy in ((1, 1), (1, -1)):
        c.line(add(v, (-4.6 * dx, -4.6 * dy)), add(v, (4.6 * dx, 4.6 * dy)),
               pal.rose, width=1.7)

    lab = add(v, scale(unit(sub(v, o)), 38.0))
    c.text(lab, "removable", pal.rose, size=12.5, weight="600", dy=4.0)

    # Bottom of the panel, clear of the polygon.
    c.text((200.0, 18.0),
           "|A| &#8594; |A| &#8722; 1, still a counterexample",
           pal.blue, size=13.5, weight="600")


# --------------------------------------------------------------------------
# Assembly
# --------------------------------------------------------------------------

PANEL_TITLES = [
    ("counting engine", "every point has 4 others equidistant"),
    ("structure", "12 points, 3 on the minimum enclosing circle"),
    ("descent engine", "a minimal counterexample has a removable vertex"),
]

CAPTION = [
    ("|A| &lt; 9", "impossible &#8212; counting"),
    ("|A| = 9", "impossible &#8212; finite base case"),
    ("|A| &gt; 9", "impossible &#8212; descent"),
]


def render(pal: Palette) -> str:
    parts: list[str] = []
    panels = [panel_counting, panel_structure, panel_descent]

    for i, fn in enumerate(panels):
        ox = PAD_X + i * (PANEL_W + GAP)
        c = Canvas(ox, PAD_TOP, PANEL_H)

        # Panel heading, drawn in absolute panel coordinates.
        c.text((PANEL_W / 2, PANEL_H + 12.0), PANEL_TITLES[i][0].upper(), pal.muted,
               size=11, weight="700", letter_spacing="1.6")
        c.text((PANEL_W / 2, PANEL_H - 8.0), PANEL_TITLES[i][1], pal.text, size=13.5)

        fn(c, pal)
        parts.extend(c.parts)

        # Thin vertical rule between panels.
        if i < len(panels) - 1:
            x = ox + PANEL_W + GAP / 2
            parts.append(
                f'<line x1="{x:.2f}" y1="{PAD_TOP + 40}" x2="{x:.2f}" '
                f'y2="{PAD_TOP + PANEL_H - 10}" stroke="{pal.faint}" '
                f'stroke-width="1"/>'
            )

    # Bottom caption band: the induction, one clause per panel.
    band_y = PAD_TOP + PANEL_H + 44
    parts.append(
        f'<line x1="{PAD_X}" y1="{band_y - 26:.2f}" x2="{WIDTH - PAD_X}" '
        f'y2="{band_y - 26:.2f}" stroke="{pal.faint}" stroke-width="1"/>'
    )
    for i, (lhs, rhs) in enumerate(CAPTION):
        cx = PAD_X + i * (PANEL_W + GAP) + PANEL_W / 2
        parts.append(
            f'<text x="{cx:.2f}" y="{band_y:.2f}" fill="{pal.ink}" '
            f'font-family="{MONO}" font-size="14" font-weight="600" '
            f'text-anchor="middle">{lhs}</text>'
        )
        parts.append(
            f'<text x="{cx:.2f}" y="{band_y + 21:.2f}" fill="{pal.text}" '
            f'font-family="{FONT}" font-size="12.5" '
            f'text-anchor="middle">{rhs}</text>'
        )

    body = "\n  ".join(parts)
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{WIDTH}" '
        f'height="{HEIGHT}" viewBox="0 0 {WIDTH} {HEIGHT}" '
        f'role="img" aria-label="Three panels showing the architecture of the '
        f'Problem 97 proof: the counting engine, the minimum enclosing circle '
        f'with its Moser triangle and three caps, and the descent step.">\n'
        f"  {body}\n</svg>\n"
    )


def main() -> None:
    out_dir = Path(__file__).resolve().parent.parent / "docs" / "assets"
    out_dir.mkdir(parents=True, exist_ok=True)
    for name, pal in (("light", LIGHT), ("dark", DARK)):
        target = out_dir / f"p97-architecture-{name}.svg"
        target.write_text(render(pal), encoding="utf-8")
        print(f"wrote {target} ({target.stat().st_size} bytes)")


if __name__ == "__main__":
    main()
