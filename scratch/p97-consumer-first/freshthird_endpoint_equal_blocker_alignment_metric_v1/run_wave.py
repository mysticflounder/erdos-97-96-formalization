#!/usr/bin/env python3
"""One exact-rational feasibility wave for the endpoint/equal-blocker alignment.

The script has three deliberately separate phases:

* ``wave`` emits and runs one incidence abstraction and one exact local
  Euclidean realization, plus two malformed controls;
* ``search`` runs the single post-wave theorem-bank query derived from the
  realized motif;
* ``checksums`` inventories the immutable handoff artifacts.

No package outside the Python standard library is used.  Solver processes run
sequentially, so this wave never schedules more than one solver core at once.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
from collections import Counter
from fractions import Fraction as F
from pathlib import Path
import re
import shutil
import subprocess
import sys
from typing import Iterable


ROOT = Path(__file__).resolve().parent
ARTIFACTS = ROOT / "artifacts"
LOGS = ROOT / "logs"
READBACK = ROOT / "readback"
SEARCH = ROOT / "theorem_search"


# Carrier vertices, all exact rationals.  The order below is a strict CCW
# boundary enumeration.  Names c and b are the endpoint-row center and common
# actual blocker; z,w are the repeated-blocker row sources.
POINTS: dict[str, tuple[F, F]] = {
    "x": (F(-1613, 6148), F(-1344, 1537)),
    "y2": (F(-10213, 252068), F(-70962, 63017)),
    "y1": (F(4867, 153700), F(-45636, 38425)),
    "ra": (F(23, 212), F(-66, 53)),
    "rb": (F(105, 884), F(-275, 221)),
    "w": (F(1), F(-3, 4)),
    "b": (F(2), F(0)),
    "ka": (F(215, 116), F(36, 29)),
    "kb": (F(829, 452), F(140, 113)),
    "z": (F(1), F(3, 4)),
    "c": (F(0), F(0)),
}
BOUNDARY_CCW = list(POINTS)

# v1=x, v2=ka, v3=ra.  Closed opposite caps are computed from the exact
# OnArcOpposite signed-area predicate used in the Lean source.
TRIANGLE = ("x", "ka", "ra")
MEC_CENTER = (F(6031, 6148), F(-3, 1537))
MEC_RADIUS2 = F(3546, 1537)
SHELL_RADIUS2 = F(25, 16)

ROW_CENTER = "c"
ROW_SUPPORT = frozenset({"ra", "rb", "w", "z"})
BLOCKER_CENTER = "b"
BLOCKER_SUPPORT = frozenset({"z", "w", "ka", "kb"})

BLOCKER_CAP = 0  # C1
OPP_INDEX1 = 1   # C2
ROW_CAP = 2      # C3
FRESH_CAP = 2    # C3; deliberately distinct from the fan's blockerCap

# Fourth order arm of FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt.
ORDER_NAMES = {
    "sourceCenter": "y2",
    "canonicalSource": "y1",
    "qBetween": "rb",
    "freshCenter": "kb",
    "qOutside": "c",
    "id": "c",
}


def area_names(a: str, b: str, c: str) -> F:
    p, q, r = POINTS[a], POINTS[b], POINTS[c]
    return (q[0] - p[0]) * (r[1] - p[1]) - (q[1] - p[1]) * (r[0] - p[0])


def area_points(p: tuple[F, F], q: tuple[F, F], r: tuple[F, F]) -> F:
    return (q[0] - p[0]) * (r[1] - p[1]) - (q[1] - p[1]) * (r[0] - p[0])


def dist2_names(a: str, b: str) -> F:
    p, q = POINTS[a], POINTS[b]
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def dist2_point(a: str, q: tuple[F, F]) -> F:
    p = POINTS[a]
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def on_arc(i: int, v: str) -> bool:
    vi = TRIANGLE[i]
    vj = TRIANGLE[(i + 1) % 3]
    vk = TRIANGLE[(i + 2) % 3]
    return area_names(v, vj, vk) * area_names(vi, vj, vk) <= 0


CAPS: tuple[frozenset[str], ...] = tuple(
    frozenset(v for v in POINTS if on_arc(i, v)) for i in range(3)
)
CAP_INTERIORS: tuple[frozenset[str], ...] = (
    CAPS[0] - {TRIANGLE[1], TRIANGLE[2]},
    CAPS[1] - {TRIANGLE[2], TRIANGLE[0]},
    CAPS[2] - {TRIANGLE[0], TRIANGLE[1]},
)


def frac_text(v: F) -> str:
    return str(v.numerator) if v.denominator == 1 else f"{v.numerator}/{v.denominator}"


def smt_num(v: F) -> str:
    if v < 0:
        return f"(- {smt_num(-v)})"
    if v.denominator == 1:
        return str(v.numerator)
    return f"(/ {v.numerator} {v.denominator})"


def px(name: str) -> str:
    return f"x_{name}"


def py(name: str) -> str:
    return f"y_{name}"


def xy(name: str) -> str:
    return f"{px(name)} {py(name)}"


def d2(a: str, b: str) -> str:
    return f"(d2 {xy(a)} {xy(b)})"


def cross(a: str, b: str, c: str) -> str:
    return f"(cross {xy(a)} {xy(b)} {xy(c)})"


def arc_expr(i: int, v: str) -> str:
    vi = TRIANGLE[i]
    vj = TRIANGLE[(i + 1) % 3]
    vk = TRIANGLE[(i + 2) % 3]
    return f"(onarc {xy(vi)} {xy(vj)} {xy(vk)} {xy(v)})"


def named_assert(expr: str, name: str) -> str:
    return f"(assert (! {expr} :named {name}))"


def conjunction(items: Iterable[str]) -> str:
    values = list(items)
    if not values:
        return "true"
    if len(values) == 1:
        return values[0]
    return f"(and {' '.join(values)})"


def disjunction(items: Iterable[str]) -> str:
    values = list(items)
    if not values:
        return "false"
    if len(values) == 1:
        return values[0]
    return f"(or {' '.join(values)})"


def abstract_body() -> str:
    names = ["c", "b", "z", "w", "ra", "rb", "ka", "kb"]
    lines = [
        "; Incidence-only abstraction.  Geometry is added in geometry_sat.smt2.",
        "(set-logic QF_LIA)",
        "(set-option :produce-models true)",
    ]
    for n in names:
        lines.append(f"(declare-fun id_{n} () Int)")
        lines.append(f"(declare-fun row_{n} () Bool)")
        lines.append(f"(declare-fun blocker_{n} () Bool)")
        for i in range(3):
            lines.append(f"(declare-fun cap{i}_{n} () Bool)")
    lines.extend([
        "(declare-fun actualBlocker_z () Int)",
        "(declare-fun actualBlocker_w () Int)",
        "(declare-fun strictBlockerCap_b () Bool)",
    ])
    for i, n in enumerate(names):
        lines.append(named_assert(f"(= id_{n} {i})", f"id_pin_{n}"))
    lines.append(named_assert("(distinct " + " ".join(f"id_{n}" for n in names) + ")", "points_distinct"))
    for n in names:
        row_expected = n in ROW_SUPPORT
        blocker_expected = n in BLOCKER_SUPPORT
        lines.append(named_assert(f"{'row_' + n if row_expected else '(not row_' + n + ')'}", f"row_mem_{n}"))
        lines.append(named_assert(f"{'blocker_' + n if blocker_expected else '(not blocker_' + n + ')'}", f"blocker_mem_{n}"))
        for i in range(3):
            value = n in CAPS[i]
            atom = f"cap{i}_{n}"
            lines.append(named_assert(atom if value else f"(not {atom})", f"cap{i}_mem_{n}"))
    lines.append(named_assert(
        "(= (+ " + " ".join(f"(ite row_{n} 1 0)" for n in names) + ") 4)",
        "row_card_four",
    ))
    lines.append(named_assert(
        "(= (+ " + " ".join(f"(ite blocker_{n} 1 0)" for n in names) + ") 4)",
        "blocker_card_four",
    ))
    lines.append(named_assert(
        "(= (+ " + " ".join(f"(ite (and row_{n} cap2_{n}) 1 0)" for n in names) + ") 1)",
        "rowcap_inside_one",
    ))
    lines.append(named_assert(
        "(= (+ " + " ".join(f"(ite (and row_{n} (not cap2_{n})) 1 0)" for n in names) + ") 3)",
        "rowcap_outside_three",
    ))
    lines.extend([
        named_assert("(= actualBlocker_z id_b)", "z_actual_blocker_b"),
        named_assert("(= actualBlocker_w id_b)", "w_actual_blocker_b"),
        named_assert("(= actualBlocker_z actualBlocker_w)", "equal_actual_blocker"),
        named_assert("strictBlockerCap_b", "b_strict_in_cap0"),
        named_assert("cap2_c", "endpoint_center_in_rowcap"),
        named_assert("cap0_b", "blocker_in_blockercap"),
        named_assert("(not cap1_c)", "qOutside_outside_oppIndex1"),
        named_assert("(not cap1_w)", "qBetween_outside_oppIndex1"),
    ])
    target_terms = []
    for i in range(3):
        target_terms.append(
            f"(and cap{i}_c cap{i}_b (not cap{i}_z) (not cap{i}_w))"
        )
    lines.append(named_assert(f"(not {disjunction(target_terms)})", "negated_alignment_target"))
    return "\n".join(lines) + "\n"


def abstract_script(force_target: bool) -> str:
    body = abstract_body()
    if force_target:
        target = disjunction(
            f"(and cap{i}_c cap{i}_b (not cap{i}_z) (not cap{i}_w))"
            for i in range(3)
        )
        return body + named_assert(target, "malformed_forced_alignment_target") + "\n(check-sat)\n"
    query = " ".join(
        [f"id_{n}" for n in ["c", "b", "z", "w"]]
        + [f"cap{i}_{n}" for i in range(3) for n in ["c", "b", "z", "w"]]
    )
    return body + f"(check-sat)\n(get-value ({query}))\n"


def geometry_body() -> str:
    lines = [
        "; Exact-rational local Euclidean realization of the projected implication.",
        "(set-logic QF_NRA)",
        "(set-option :produce-models true)",
        "(define-fun d2 ((ax Real) (ay Real) (bx Real) (by Real)) Real",
        "  (+ (* (- ax bx) (- ax bx)) (* (- ay by) (- ay by))))",
        "(define-fun cross ((ax Real) (ay Real) (bx Real) (by Real) (cx Real) (cy Real)) Real",
        "  (- (* (- bx ax) (- cy ay)) (* (- by ay) (- cx ax))))",
        "(define-fun onarc ((vix Real) (viy Real) (vjx Real) (vjy Real)",
        "                    (vkx Real) (vky Real) (vx Real) (vy Real)) Bool",
        "  (<= (* (cross vx vy vjx vjy vkx vky)",
        "         (cross vix viy vjx vjy vkx vky)) 0))",
    ]
    for n in POINTS:
        lines.append(f"(declare-fun {px(n)} () Real)")
        lines.append(f"(declare-fun {py(n)} () Real)")
        lines.append(f"(declare-fun row_{n} () Bool)")
        lines.append(f"(declare-fun selected_z_{n} () Bool)")
        lines.append(f"(declare-fun selected_w_{n} () Bool)")
    for n in ["mec_x", "mec_y", "mec_r2", "shell_r2", "blocker_z_x", "blocker_z_y", "blocker_w_x", "blocker_w_y"]:
        lines.append(f"(declare-fun {n} () Real)")

    for n, (xv, yv) in POINTS.items():
        lines.append(named_assert(f"(= {px(n)} {smt_num(xv)})", f"pin_x_{n}"))
        lines.append(named_assert(f"(= {py(n)} {smt_num(yv)})", f"pin_y_{n}"))
    scalar_pins = {
        "mec_x": MEC_CENTER[0],
        "mec_y": MEC_CENTER[1],
        "mec_r2": MEC_RADIUS2,
        "shell_r2": SHELL_RADIUS2,
        "blocker_z_x": POINTS["b"][0],
        "blocker_z_y": POINTS["b"][1],
        "blocker_w_x": POINTS["b"][0],
        "blocker_w_y": POINTS["b"][1],
    }
    for n, v in scalar_pins.items():
        lines.append(named_assert(f"(= {n} {smt_num(v)})", f"pin_{n}"))

    # Carrier injectivity.
    for a, b in itertools.combinations(POINTS, 2):
        lines.append(named_assert(
            f"(or (not (= {px(a)} {px(b)})) (not (= {py(a)} {py(b)})))",
            f"distinct_{a}_{b}",
        ))

    # A strict convex CCW polygon: every other vertex lies strictly left of
    # every directed boundary edge.
    for i, a in enumerate(BOUNDARY_CCW):
        b = BOUNDARY_CCW[(i + 1) % len(BOUNDARY_CCW)]
        for v in BOUNDARY_CCW:
            if v in {a, b}:
                continue
            lines.append(named_assert(f"(> {cross(a, b, v)} 0)", f"ccw_{a}_{b}_{v}"))

    # Exact MEC certificate and the non-obtuse circumscribed Moser triangle.
    for n in POINTS:
        lines.append(named_assert(
            f"(<= (d2 {xy(n)} mec_x mec_y) mec_r2)", f"mec_contains_{n}"
        ))
    for n in TRIANGLE:
        lines.append(named_assert(
            f"(= (d2 {xy(n)} mec_x mec_y) mec_r2)", f"triangle_on_mec_{n}"
        ))
    for at, u, v in [
        (TRIANGLE[0], TRIANGLE[1], TRIANGLE[2]),
        (TRIANGLE[1], TRIANGLE[0], TRIANGLE[2]),
        (TRIANGLE[2], TRIANGLE[0], TRIANGLE[1]),
    ]:
        dot = (
            f"(+ (* (- {px(u)} {px(at)}) (- {px(v)} {px(at)}))"
            f" (* (- {py(u)} {py(at)}) (- {py(v)} {py(at)})))"
        )
        lines.append(named_assert(f"(>= {dot} 0)", f"nonobtuse_at_{at}"))

    # Exact Lean OnArcOpposite cap classifications.
    for i in range(3):
        for n in POINTS:
            expr = arc_expr(i, n)
            if n not in CAPS[i]:
                expr = f"(not {expr})"
            lines.append(named_assert(expr, f"cap{i}_classification_{n}"))

    # Row and equal-blocker selected classes are the full radius classes in A.
    for n in POINTS:
        row_eq = f"(= {d2(n, ROW_CENTER)} shell_r2)"
        blocker_eq = f"(= {d2(n, BLOCKER_CENTER)} shell_r2)"
        row_atom = row_eq if n in ROW_SUPPORT else f"(not {row_eq})"
        blocker_atom = blocker_eq if n in BLOCKER_SUPPORT else f"(not {blocker_eq})"
        lines.append(named_assert(row_atom, f"row_radius_class_{n}"))
        lines.append(named_assert(blocker_atom, f"blocker_radius_class_{n}"))
        lines.append(named_assert(f"(= row_{n} {row_eq})", f"row_support_def_{n}"))
        lines.append(named_assert(f"(= selected_z_{n} {blocker_eq})", f"selected_z_def_{n}"))
        lines.append(named_assert(f"(= selected_w_{n} {blocker_eq})", f"selected_w_def_{n}"))
        lines.append(named_assert(f"(= selected_z_{n} selected_w_{n})", f"selected_support_equal_{n}"))
    lines.append(named_assert("(> shell_r2 0)", "selected_radii_positive"))

    # No second four-point radius remains at b after deleting z or w: all
    # non-K, non-center squared distances from b are pairwise distinct.
    outsiders = [n for n in POINTS if n not in BLOCKER_SUPPORT and n != BLOCKER_CENTER]
    for a, b in itertools.combinations(outsiders, 2):
        lines.append(named_assert(
            f"(not (= {d2(a, BLOCKER_CENTER)} {d2(b, BLOCKER_CENTER)}))",
            f"blocker_outside_distinct_{a}_{b}",
        ))

    # Same actual blocker, strict blocker cap, different row center, and the
    # exact two-point row/blocker support intersection.
    lines.extend([
        named_assert("(= blocker_z_x blocker_w_x)", "equal_blocker_x"),
        named_assert("(= blocker_z_y blocker_w_y)", "equal_blocker_y"),
        named_assert(f"(= blocker_z_x {px('b')})", "actual_blocker_x"),
        named_assert(f"(= blocker_z_y {py('b')})", "actual_blocker_y"),
        named_assert(
            f"(or (not (= {px('c')} {px('b')})) (not (= {py('c')} {py('b')})))",
            "center_ne_blocker",
        ),
        named_assert(
            f"(or (not (= {px('z')} {px('w')})) (not (= {py('z')} {py('w')})))",
            "z_ne_w",
        ),
        named_assert(arc_expr(BLOCKER_CAP, "b"), "blocker_in_blocker_cap"),
        named_assert(
            f"(and (not (= {px('b')} {px(TRIANGLE[1])})) (not (= {px('b')} {px(TRIANGLE[2])})))",
            "blocker_not_cap_endpoints_x",
        ),
        named_assert(arc_expr(ROW_CAP, "c"), "center_in_row_cap"),
        named_assert(f"(not {arc_expr(OPP_INDEX1, ORDER_NAMES['qOutside'])})", "qOutside_outside_first_cap"),
        named_assert(f"(not {arc_expr(OPP_INDEX1, ORDER_NAMES['qBetween'])})", "qBetween_outside_first_cap"),
        named_assert(arc_expr(OPP_INDEX1, ORDER_NAMES["sourceCenter"]), "source_center_in_first_cap"),
        named_assert(arc_expr(FRESH_CAP, ORDER_NAMES["freshCenter"]), "fresh_center_in_fresh_cap"),
    ])

    # Negation of the proposed cap alignment: no indexed cap contains c and b
    # while excluding both z and w.
    target_terms = [
        conjunction([
            arc_expr(i, "c"),
            arc_expr(i, "b"),
            f"(not {arc_expr(i, 'z')})",
            f"(not {arc_expr(i, 'w')})",
        ])
        for i in range(3)
    ]
    lines.append(named_assert(f"(not {disjunction(target_terms)})", "negated_alignment_target"))
    return "\n".join(lines) + "\n"


REAL_QUERY_NAMES = [
    item
    for n in POINTS
    for item in (px(n), py(n))
] + [
    "mec_x", "mec_y", "mec_r2", "shell_r2",
    "blocker_z_x", "blocker_z_y", "blocker_w_x", "blocker_w_y",
]


def geometry_script(bad_radius: bool) -> str:
    body = geometry_body()
    if bad_radius:
        return body + named_assert(
            f"(= {d2('z', ROW_CENTER)} 2)", "malformed_z_has_second_row_radius"
        ) + "\n(check-sat)\n"
    return body + "(check-sat)\n(get-value (" + " ".join(REAL_QUERY_NAMES) + "))\n"


def sexpr_tokens(text: str) -> list[str]:
    return re.findall(r"\(|\)|[^\s()]+", text)


def parse_sexpr(tokens: list[str], pos: int = 0):
    if tokens[pos] != "(":
        return tokens[pos], pos + 1
    result = []
    pos += 1
    while tokens[pos] != ")":
        item, pos = parse_sexpr(tokens, pos)
        result.append(item)
    return result, pos + 1


def eval_fraction(expr) -> F:
    if isinstance(expr, str):
        return F(expr)
    if expr[0] == "/":
        return eval_fraction(expr[1]) / eval_fraction(expr[2])
    if expr[0] == "-" and len(expr) == 2:
        return -eval_fraction(expr[1])
    if expr[0] == "-" and len(expr) == 3:
        return eval_fraction(expr[1]) - eval_fraction(expr[2])
    if expr[0] == "+":
        return sum((eval_fraction(x) for x in expr[1:]), F(0))
    if expr[0] == "*":
        out = F(1)
        for x in expr[1:]:
            out *= eval_fraction(x)
        return out
    raise ValueError(f"unsupported rational expression: {expr!r}")


def parse_real_readback(stdout: str) -> dict[str, F]:
    start = stdout.find("((")
    if start < 0:
        raise ValueError("solver output has no get-value S-expression")
    tokens = sexpr_tokens(stdout[start:])
    parsed, _ = parse_sexpr(tokens)
    values: dict[str, F] = {}
    for pair in parsed:
        if isinstance(pair, list) and len(pair) == 2 and pair[0] in REAL_QUERY_NAMES:
            values[pair[0]] = eval_fraction(pair[1])
    return values


def expected_reals() -> dict[str, F]:
    out = {px(n): p[0] for n, p in POINTS.items()}
    out.update({py(n): p[1] for n, p in POINTS.items()})
    out.update({
        "mec_x": MEC_CENTER[0],
        "mec_y": MEC_CENTER[1],
        "mec_r2": MEC_RADIUS2,
        "shell_r2": SHELL_RADIUS2,
        "blocker_z_x": POINTS["b"][0],
        "blocker_z_y": POINTS["b"][1],
        "blocker_w_x": POINTS["b"][0],
        "blocker_w_y": POINTS["b"][1],
    })
    return out


def exact_validate() -> dict:
    checks: dict[str, dict] = {}

    def record(name: str, ok: bool, detail) -> None:
        checks[name] = {"ok": bool(ok), "detail": detail}

    record("carrier_distinct", len(set(POINTS.values())) == len(POINTS), len(POINTS))

    ccw_margins: dict[str, str] = {}
    ccw_ok = True
    for i, a in enumerate(BOUNDARY_CCW):
        b = BOUNDARY_CCW[(i + 1) % len(BOUNDARY_CCW)]
        vals = [area_names(a, b, v) for v in BOUNDARY_CCW if v not in {a, b}]
        margin = min(vals)
        ccw_margins[f"{a}->{b}"] = frac_text(margin)
        ccw_ok &= margin > 0
    record("strict_ccw_convex_boundary", ccw_ok, ccw_margins)

    mec_distances = {n: dist2_point(n, MEC_CENTER) for n in POINTS}
    record(
        "mec_contains_carrier",
        all(v <= MEC_RADIUS2 for v in mec_distances.values()),
        {n: frac_text(v) for n, v in mec_distances.items()},
    )
    record(
        "triangle_on_mec",
        all(mec_distances[n] == MEC_RADIUS2 for n in TRIANGLE),
        {n: frac_text(mec_distances[n]) for n in TRIANGLE},
    )
    nonobtuse: dict[str, F] = {}
    for at, u, v in [
        (TRIANGLE[0], TRIANGLE[1], TRIANGLE[2]),
        (TRIANGLE[1], TRIANGLE[0], TRIANGLE[2]),
        (TRIANGLE[2], TRIANGLE[0], TRIANGLE[1]),
    ]:
        pa, pu, pv = POINTS[at], POINTS[u], POINTS[v]
        nonobtuse[at] = (pu[0] - pa[0]) * (pv[0] - pa[0]) + (pu[1] - pa[1]) * (pv[1] - pa[1])
    record(
        "triangle_nonobtuse",
        all(v >= 0 for v in nonobtuse.values()),
        {n: frac_text(v) for n, v in nonobtuse.items()},
    )

    cap_detail = {f"C{i+1}": sorted(CAPS[i]) for i in range(3)}
    expected_caps = (
        frozenset({"ra", "rb", "w", "b", "ka"}),
        frozenset({"x", "y2", "y1", "ra"}),
        frozenset({"x", "ka", "kb", "z", "c"}),
    )
    record("on_arc_opposite_caps", CAPS == expected_caps, cap_detail)
    record("surplus_cap_C1", len(CAPS[0]) > 4, len(CAPS[0]))
    nonmoser = set(POINTS) - set(TRIANGLE)
    record(
        "nonmoser_exactly_one_cap",
        all(sum(n in cap for cap in CAPS) == 1 for n in nonmoser),
        {n: sum(n in cap for cap in CAPS) for n in sorted(nonmoser)},
    )

    row_full = {n for n in POINTS if n != ROW_CENTER and dist2_names(n, ROW_CENTER) == SHELL_RADIUS2}
    blocker_full = {n for n in POINTS if n != BLOCKER_CENTER and dist2_names(n, BLOCKER_CENTER) == SHELL_RADIUS2}
    record("row_exact_four_support", row_full == set(ROW_SUPPORT), sorted(row_full))
    record("blocker_exact_four_support", blocker_full == set(BLOCKER_SUPPORT), sorted(blocker_full))
    record("equal_selected_support_for_z_w", blocker_full == set(BLOCKER_SUPPORT), {
        "source_z": sorted(blocker_full), "source_w": sorted(blocker_full)
    })
    record("row_blocker_intersection", row_full & blocker_full == {"z", "w"}, sorted(row_full & blocker_full))

    row_inside = row_full & set(CAPS[ROW_CAP])
    row_outside = row_full - set(CAPS[ROW_CAP])
    record("endpoint_row_cap_split", len(row_inside) <= 2 and len(row_outside) >= 2, {
        "inside": sorted(row_inside), "inside_card": len(row_inside),
        "outside": sorted(row_outside), "outside_card": len(row_outside),
    })
    record("endpoint_center_in_rowcap", ROW_CENTER in CAPS[ROW_CAP], f"C{ROW_CAP+1}")
    record("blocker_strict_in_blockercap", BLOCKER_CENTER in CAP_INTERIORS[BLOCKER_CAP], f"C{BLOCKER_CAP+1}")
    record("rowcap_ne_blockercap", ROW_CAP != BLOCKER_CAP, {"rowCap": ROW_CAP, "blockerCap": BLOCKER_CAP})

    def positive_distance_histogram_after_erasing(erased: str) -> Counter[F]:
        return Counter(
            dist2_names(n, BLOCKER_CENTER)
            for n in POINTS
            if n not in {erased, BLOCKER_CENTER}
        )

    deletion_detail = {}
    deletion_ok = True
    for erased in ("z", "w"):
        hist = positive_distance_histogram_after_erasing(erased)
        maximum = max(hist.values())
        deletion_detail[erased] = {
            "max_radius_multiplicity": maximum,
            "multiplicities": sorted(hist.values(), reverse=True),
        }
        deletion_ok &= maximum < 4
    record("actual_blocker_deletion_blocks_z_w", deletion_ok, deletion_detail)
    record("equal_actual_blocker", True, {"z": "b", "w": "b"})
    record("center_ne_blocker", POINTS[ROW_CENTER] != POINTS[BLOCKER_CENTER], [ROW_CENTER, BLOCKER_CENTER])
    record("z_ne_w", POINTS["z"] != POINTS["w"], ["z", "w"])

    index = {n: i for i, n in enumerate(BOUNDARY_CCW)}
    arm = [
        index[ORDER_NAMES["sourceCenter"]],
        index[ORDER_NAMES["canonicalSource"]],
        index[ORDER_NAMES["qBetween"]],
        index[ORDER_NAMES["freshCenter"]],
        index[ORDER_NAMES["qOutside"]],
    ]
    record("freshthird_order_arm4", all(a < b for a, b in zip(arm, arm[1:])), {
        "labels": ORDER_NAMES, "indices": arm
    })
    record("at_endpoint_qOutside", ORDER_NAMES["id"] == ORDER_NAMES["qOutside"] == ROW_CENTER, ORDER_NAMES)
    record(
        "endpoint_deletion_pair",
        ORDER_NAMES["canonicalSource"] not in row_full or ORDER_NAMES["qBetween"] not in row_full,
        {
            "canonicalSource_in_row": ORDER_NAMES["canonicalSource"] in row_full,
            "qBetween_in_row": ORDER_NAMES["qBetween"] in row_full,
        },
    )
    record(
        "first_cap_localizations",
        ORDER_NAMES["sourceCenter"] in CAP_INTERIORS[OPP_INDEX1]
        and ORDER_NAMES["freshCenter"] in CAP_INTERIORS[FRESH_CAP]
        and ORDER_NAMES["qOutside"] not in CAPS[OPP_INDEX1]
        and ORDER_NAMES["qBetween"] not in CAPS[OPP_INDEX1]
        and ROW_CAP != OPP_INDEX1 and FRESH_CAP != OPP_INDEX1
        and BLOCKER_CAP != OPP_INDEX1,
        {
            "oppIndex1": OPP_INDEX1, "freshCap": FRESH_CAP,
            "rowCap": ROW_CAP, "fanBlockerCap": BLOCKER_CAP
        },
    )

    target_by_cap = {
        f"C{i+1}": (
            ROW_CENTER in CAPS[i]
            and BLOCKER_CENTER in CAPS[i]
            and "z" not in CAPS[i]
            and "w" not in CAPS[i]
        )
        for i in range(3)
    }
    record("alignment_target_false", not any(target_by_cap.values()), target_by_cap)
    record(
        "no_cap_contains_center_and_blocker",
        not any(ROW_CENTER in cap and BLOCKER_CENTER in cap for cap in CAPS),
        {f"C{i+1}": sorted(CAPS[i] & {ROW_CENTER, BLOCKER_CENTER}) for i in range(3)},
    )
    record(
        "particular_alignment_false",
        not (BLOCKER_CAP == ROW_CAP and "z" not in CAPS[BLOCKER_CAP] and "w" not in CAPS[BLOCKER_CAP]),
        {
            "blockerCap": BLOCKER_CAP,
            "rowCap": ROW_CAP,
            "z_outside_blockerCap": "z" not in CAPS[BLOCKER_CAP],
            "w_outside_blockerCap": "w" not in CAPS[BLOCKER_CAP],
        },
    )

    all_ok = all(item["ok"] for item in checks.values())
    return {
        "status": "PASS" if all_ok else "FAIL",
        "arithmetic": "fractions.Fraction exact rational arithmetic",
        "checks": checks,
    }


def write_json(path: Path, value) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def solver_version(executable: str) -> str:
    try:
        cp = subprocess.run([executable, "--version"], text=True, capture_output=True, timeout=10)
        return (cp.stdout or cp.stderr).splitlines()[0]
    except Exception as exc:  # pragma: no cover - diagnostic path
        return f"ERROR: {exc}"


def run_solver(executable: str, solver: str, case: str, smt_path: Path) -> dict:
    if solver == "z3":
        command = [executable, "-T:30", str(smt_path)]
    else:
        command = [executable, "--lang=smt2", "--tlimit-per=30000", str(smt_path)]
    cp = subprocess.run(command, text=True, capture_output=True, timeout=45)
    (LOGS / f"{case}.{solver}.stdout").write_text(cp.stdout)
    (LOGS / f"{case}.{solver}.stderr").write_text(cp.stderr)
    status = next((line.strip() for line in cp.stdout.splitlines() if line.strip() in {"sat", "unsat", "unknown"}), "missing")
    return {
        "solver": solver,
        "command": command,
        "returncode": cp.returncode,
        "status": status,
        "stdout_lines": len(cp.stdout.splitlines()),
        "stderr_lines": len(cp.stderr.splitlines()),
    }


def run_wave() -> None:
    for directory in (ARTIFACTS, LOGS, READBACK):
        directory.mkdir(parents=True, exist_ok=True)

    scripts = {
        "abstraction_sat": abstract_script(False),
        "geometry_sat": geometry_script(False),
        "control_forced_alignment_unsat": abstract_script(True),
        "control_bad_row_radius_unsat": geometry_script(True),
    }
    for case, content in scripts.items():
        (ARTIFACTS / f"{case}.smt2").write_text(content)

    z3 = shutil.which("z3")
    cvc5 = shutil.which("cvc5")
    if not z3 or not cvc5:
        raise SystemExit(f"required solvers missing: z3={z3!r}, cvc5={cvc5!r}")

    expected_status = {
        "abstraction_sat": "sat",
        "geometry_sat": "sat",
        "control_forced_alignment_unsat": "unsat",
        "control_bad_row_radius_unsat": "unsat",
    }
    runs = []
    for case in scripts:
        for solver, executable in [("z3", z3), ("cvc5", cvc5)]:
            result = run_solver(executable, solver, case, ARTIFACTS / f"{case}.smt2")
            result["expected"] = expected_status[case]
            result["matches_expected"] = result["status"] == result["expected"] and result["returncode"] == 0
            runs.append(result)
            if case == "geometry_sat" and result["status"] == "sat":
                stdout = (LOGS / f"{case}.{solver}.stdout").read_text()
                got = parse_real_readback(stdout)
                expected = expected_reals()
                matches = got == expected
                write_json(READBACK / f"geometry_{solver}.json", {
                    "status": "PASS" if matches else "FAIL",
                    "values": {n: frac_text(got[n]) for n in sorted(got)},
                    "expected_values": len(expected),
                    "read_values": len(got),
                    "exact_match": matches,
                })
                if not matches:
                    missing = sorted(set(expected) - set(got))
                    wrong = sorted(n for n in set(expected) & set(got) if expected[n] != got[n])
                    raise SystemExit(f"{solver} exact readback mismatch: missing={missing}, wrong={wrong}")

    validation = exact_validate()
    write_json(READBACK / "exact_validator.json", validation)
    witness = {
        "boundary_ccw": BOUNDARY_CCW,
        "points": {n: {"x": frac_text(p[0]), "y": frac_text(p[1])} for n, p in POINTS.items()},
        "mec": {
            "center": [frac_text(MEC_CENTER[0]), frac_text(MEC_CENTER[1])],
            "radius_squared": frac_text(MEC_RADIUS2),
            "triangle_v1_v2_v3": list(TRIANGLE),
        },
        "caps_closed": {f"C{i+1}": sorted(CAPS[i]) for i in range(3)},
        "caps_strict": {f"C{i+1}": sorted(CAP_INTERIORS[i]) for i in range(3)},
        "indices_zero_based": {
            "blockerCap": BLOCKER_CAP,
            "freshCap": FRESH_CAP,
            "oppIndex1": OPP_INDEX1,
            "rowCap": ROW_CAP,
        },
        "row": {"center": ROW_CENTER, "support": sorted(ROW_SUPPORT), "radius_squared": frac_text(SHELL_RADIUS2)},
        "equal_blocker_branch": {
            "sources": ["z", "w"],
            "actual_blocker": BLOCKER_CENTER,
            "selected_support_for_each": sorted(BLOCKER_SUPPORT),
            "radius_squared": frac_text(SHELL_RADIUS2),
        },
        "order_arm4": ORDER_NAMES,
        "alignment_target": "false for every C1,C2,C3",
    }
    write_json(READBACK / "witness.json", witness)

    environment = {
        "wave": "freshthird_endpoint_equal_blocker_alignment_metric_v1",
        "python": sys.version.split()[0],
        "z3": {"path": z3, "version": solver_version(z3)},
        "cvc5": {"path": cvc5, "version": solver_version(cvc5)},
        "solver_processes": "sequential",
        "maximum_simultaneous_solver_processes": 1,
        "requested_core_cap": 12,
        "working_directory": str(Path.cwd()),
    }
    write_json(ROOT / "environment.json", environment)
    write_json(ROOT / "results.json", {
        "classification": "REFUTED_PROJECTED_ALIGNMENT_IMPLICATION",
        "qualification": "exact source-faithful local Euclidean model of the projected endpoint/equal-blocker branch; not a model of all global CounterexampleData hypotheses",
        "solver_runs": runs,
        "all_solver_expectations_met": all(r["matches_expected"] for r in runs),
        "exact_validator": validation["status"],
        "exact_solver_readbacks": ["geometry_z3.json", "geometry_cvc5.json"],
    })
    if not all(r["matches_expected"] for r in runs) or validation["status"] != "PASS":
        raise SystemExit("wave validation failed")


SEARCH_QUERY = (
    "selected exact-four row centered at c and selected exact-four shell centered at b "
    "share exactly two distinct support points z w; c and b are distinct carrier points "
    "in a convex MEC CapTriple, c lies in an indexed row cap with at most two row "
    "support points inside and at least two outside, while b lies in a strict blocker cap; "
    "the actual blockers of z and w both equal b. Find a general theorem forcing one "
    "indexed cap to contain c and b with z and w outside, or forcing blockerCap=rowCap."
)


def run_search() -> None:
    SEARCH.mkdir(parents=True, exist_ok=True)
    executable = shutil.which("nthdegree")
    if not executable:
        raise SystemExit("nthdegree executable missing")
    command = [
        executable, "docs", "search",
        "--corpus", "erdos-97-96-formalization-lean",
        "--agentic", SEARCH_QUERY,
    ]
    cp = subprocess.run(command, text=True, capture_output=True, timeout=300)
    (SEARCH / "raw_stdout.txt").write_text(cp.stdout)
    (SEARCH / "raw_stderr.txt").write_text(cp.stderr)
    write_json(SEARCH / "metadata.json", {
        "command": command,
        "query": SEARCH_QUERY,
        "returncode": cp.returncode,
        "stdout_lines": len(cp.stdout.splitlines()),
        "stderr_lines": len(cp.stderr.splitlines()),
        "scope": "one post-wave, wave-derived motif query in the repository Lean corpus",
    })
    if cp.returncode != 0:
        raise SystemExit(f"nthdegree search failed with {cp.returncode}")


def write_checksums() -> None:
    target = ROOT / "SHA256SUMS"
    rows = []
    for path in sorted(ROOT.rglob("*")):
        if not path.is_file() or path == target:
            continue
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        rows.append(f"{digest}  {path.relative_to(ROOT)}")
    target.write_text("\n".join(rows) + "\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("phase", choices=["wave", "search", "checksums"])
    args = parser.parse_args()
    if args.phase == "wave":
        run_wave()
    elif args.phase == "search":
        run_search()
    else:
        write_checksums()


if __name__ == "__main__":
    main()
