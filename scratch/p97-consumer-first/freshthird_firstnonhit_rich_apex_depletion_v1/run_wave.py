"""Bounded exact-rational feasibility wave for the rich-apex 2+1 packet.

The wave searches a fixed rational-rotation grid, emits one pinned QF_NRA
witness and four smoke controls, runs the byte-identical files through Z3 and
cvc5, and independently rechecks the witness with ``fractions.Fraction``.

This is a local, cardinality-independent named-role feasibility test.  It is
not a full P97 model and it does not certify any universal Lean statement.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import platform
import re
import shutil
import subprocess
import sys
from collections.abc import Iterable
from dataclasses import dataclass
from fractions import Fraction as F
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ARTIFACTS = ROOT / "artifacts"
LOGS = ROOT / "logs"
READBACK = ROOT / "readback"

Q = "q"
P = "p"
K = frozenset({"k0", "k1", "k2", "k3"})
V = frozenset({"k0", "k1", "k2"})
R1_CLASS = frozenset({"q", "k0", "k1", "r1a", "r1b"})
R2_CLASS = frozenset({"k2", "k3", "r2a", "r2b"})
R1 = F(5, 4)
R2 = F(37, 20)

FIXED: dict[str, tuple[F, F]] = {
    "q": (F(0), F(0)),
    "p": (F(1, 2), F(1)),
    "k0": (F(1), F(0)),
    "k1": (F(-3, 5), F(4, 5)),
    "k2": (F(-4, 5), F(3, 5)),
    "k3": (F(24, 25), F(-7, 25)),
}


@dataclass(frozen=True)
class SearchResult:
    points: dict[str, tuple[F, F]]
    boundary_ccw: tuple[str, ...]
    parameters: dict[str, F]
    radius1_single_candidates: int
    radius2_single_candidates: int
    radius1_pair_candidates: int
    radius2_pair_candidates: int


def cross_points(
    a: tuple[F, F], b: tuple[F, F], c: tuple[F, F]
) -> F:
    return (b[0] - a[0]) * (c[1] - a[1]) - (
        b[1] - a[1]
    ) * (c[0] - a[0])


def dist2_points(a: tuple[F, F], b: tuple[F, F]) -> F:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def hull_names(points: dict[str, tuple[F, F]]) -> tuple[str, ...]:
    """Return the strict convex hull in CCW order, dropping collinear points."""
    ordered = sorted((xy, name) for name, xy in points.items())
    lower: list[tuple[tuple[F, F], str]] = []
    for xy, name in ordered:
        while (
            len(lower) >= 2
            and cross_points(lower[-2][0], lower[-1][0], xy) <= 0
        ):
            lower.pop()
        lower.append((xy, name))
    upper: list[tuple[tuple[F, F], str]] = []
    for xy, name in reversed(ordered):
        while (
            len(upper) >= 2
            and cross_points(upper[-2][0], upper[-1][0], xy) <= 0
        ):
            upper.pop()
        upper.append((xy, name))
    return tuple(name for _, name in lower[:-1] + upper[:-1])


def all_strict_hull_vertices(points: dict[str, tuple[F, F]]) -> bool:
    return len(hull_names(points)) == len(points)


def rational_rotate_about_p(vector: tuple[F, F], t: F) -> tuple[F, F]:
    """Apply the rational unit rotation parameterized by t, then translate by p."""
    cosine = (1 - t * t) / (1 + t * t)
    sine = 2 * t / (1 + t * t)
    px, py = FIXED[P]
    vx, vy = vector
    return (px + cosine * vx - sine * vy, py + sine * vx + cosine * vy)


def rotation_grid() -> tuple[F, ...]:
    values = {F(numerator, denominator) for denominator in range(1, 17) for numerator in range(-24, 25)}
    return tuple(
        sorted(values, key=lambda t: (abs(t), t.denominator, t.numerator))
    )


def coordinate_complexity(item: tuple[F, tuple[F, F]]) -> tuple[int, int, F]:
    t, xy = item
    return (
        max(abs(value.numerator) for value in xy),
        max(value.denominator for value in xy),
        abs(t),
    )


def single_candidates(vector: tuple[F, F]) -> list[tuple[F, tuple[F, F]]]:
    fixed_values = set(FIXED.values())
    seen: set[tuple[F, F]] = set()
    candidates: list[tuple[F, tuple[F, F]]] = []
    for t in rotation_grid():
        xy = rational_rotate_about_p(vector, t)
        if xy in fixed_values or xy in seen:
            continue
        seen.add(xy)
        if dist2_points(FIXED[Q], xy) == 1:
            continue
        if all_strict_hull_vertices(FIXED | {"candidate": xy}):
            candidates.append((t, xy))
    candidates.sort(key=coordinate_complexity)
    return candidates


def pair_candidates(
    singles: list[tuple[F, tuple[F, F]]], first: str, second: str
) -> list[tuple[tuple[F, tuple[F, F]], tuple[F, tuple[F, F]]]]:
    pairs = []
    for left, right in itertools.combinations(singles, 2):
        points = FIXED | {first: left[1], second: right[1]}
        if all_strict_hull_vertices(points):
            pairs.append((left, right))
    return pairs


def search_witness() -> SearchResult:
    """Search only the source-allowed 2+1 alias arm on a bounded grid."""
    radius1_vector = (
        FIXED[Q][0] - FIXED[P][0],
        FIXED[Q][1] - FIXED[P][1],
    )
    radius2_vector = (
        FIXED["k3"][0] - FIXED[P][0],
        FIXED["k3"][1] - FIXED[P][1],
    )
    radius1_singles = single_candidates(radius1_vector)
    radius2_singles = single_candidates(radius2_vector)
    radius1_pairs = pair_candidates(radius1_singles, "r1a", "r1b")
    radius2_pairs = pair_candidates(radius2_singles, "r2a", "r2b")
    for (a, b), (c, d) in itertools.product(radius1_pairs, radius2_pairs):
        points = FIXED | {
            "r1a": a[1],
            "r1b": b[1],
            "r2a": c[1],
            "r2b": d[1],
        }
        if all_strict_hull_vertices(points):
            return SearchResult(
                points=points,
                boundary_ccw=hull_names(points),
                parameters={"r1a": a[0], "r1b": b[0], "r2a": c[0], "r2b": d[0]},
                radius1_single_candidates=len(radius1_singles),
                radius2_single_candidates=len(radius2_singles),
                radius1_pair_candidates=len(radius1_pairs),
                radius2_pair_candidates=len(radius2_pairs),
            )
    raise RuntimeError("bounded 2+1 rational-rotation grid has no witness")


def frac_text(value: F) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def smt_num(value: F) -> str:
    if value < 0:
        return f"(- {smt_num(-value)})"
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def px(name: str) -> str:
    return f"x_{name}"


def py(name: str) -> str:
    return f"y_{name}"


def d2_expr(a: str, b: str) -> str:
    return f"(d2 {px(a)} {py(a)} {px(b)} {py(b)})"


def cross_expr(a: str, b: str, c: str) -> str:
    return (
        f"(cross {px(a)} {py(a)} {px(b)} {py(b)} {px(c)} {py(c)})"
    )


def named(expr: str, label: str) -> str:
    return f"(assert (! {expr} :named {label}))"


def sum_ites(conditions: Iterable[str]) -> str:
    return f"(+ {' '.join(f'(ite {condition} 1 0)' for condition in conditions)})"


def class_condition(name: str, radius_symbol: str) -> str:
    return f"(= {d2_expr(P, name)} {radius_symbol})"


def survivor_condition(name: str, radius_symbol: str) -> str:
    return f"(and {class_condition(name, radius_symbol)} (not inV_{name}))"


def restored_condition(name: str, restored: str, radius_symbol: str) -> str:
    retained = "true" if name == restored else f"(not inV_{name})"
    return f"(and {class_condition(name, radius_symbol)} {retained})"


def witness_body(result: SearchResult) -> str:
    points = result.points
    names = tuple(points)
    lines = [
        "; Exact-rational named-role witness for the FreshThird rich-apex 2+1 depletion packet.",
        "(set-logic QF_NRA)",
        "(set-option :produce-models true)",
        "(define-fun d2 ((ax Real) (ay Real) (bx Real) (by Real)) Real",
        "  (+ (* (- ax bx) (- ax bx)) (* (- ay by) (- ay by))))",
        "(define-fun cross ((ax Real) (ay Real) (bx Real) (by Real) (cx Real) (cy Real)) Real",
        "  (- (* (- bx ax) (- cy ay)) (* (- by ay) (- cx ax))))",
        "(declare-fun radius1 () Real)",
        "(declare-fun radius2 () Real)",
    ]
    for name in names:
        lines.extend(
            [
                f"(declare-fun {px(name)} () Real)",
                f"(declare-fun {py(name)} () Real)",
                f"(declare-fun inV_{name} () Bool)",
            ]
        )
    lines.extend(
        [
            named(f"(= radius1 {smt_num(R1)})", "pin_radius1"),
            named(f"(= radius2 {smt_num(R2)})", "pin_radius2"),
            named("(> radius1 0)", "radius1_positive"),
            named("(> radius2 0)", "radius2_positive"),
            named("(not (= radius1 radius2))", "radii_distinct"),
        ]
    )
    for name, (x_value, y_value) in points.items():
        lines.extend(
            [
                named(f"(= {px(name)} {smt_num(x_value)})", f"pin_x_{name}"),
                named(f"(= {py(name)} {smt_num(y_value)})", f"pin_y_{name}"),
                named(f"inV_{name}" if name in V else f"(not inV_{name})", f"pin_inV_{name}"),
            ]
        )

    for left, right in itertools.combinations(names, 2):
        lines.append(
            named(
                f"(or (not (= {px(left)} {px(right)})) (not (= {py(left)} {py(right)})))",
                f"distinct_{left}_{right}",
            )
        )

    boundary = result.boundary_ccw
    for index, left in enumerate(boundary):
        right = boundary[(index + 1) % len(boundary)]
        for other in boundary:
            if other in {left, right}:
                continue
            lines.append(
                named(
                    f"(> {cross_expr(left, right, other)} 0)",
                    f"strict_hull_{left}_{right}_{other}",
                )
            )

    for name in names:
        q_circle = f"(= {d2_expr(Q, name)} 1)"
        lines.append(
            named(q_circle if name in K else f"(not {q_circle})", f"q_shell_exact_{name}")
        )
        r1_membership = class_condition(name, "radius1")
        r2_membership = class_condition(name, "radius2")
        lines.append(
            named(
                r1_membership if name in R1_CLASS else f"(not {r1_membership})",
                f"p_class1_exact_{name}",
            )
        )
        lines.append(
            named(
                r2_membership if name in R2_CLASS else f"(not {r2_membership})",
                f"p_class2_exact_{name}",
            )
        )

    lines.extend(
        [
            named(f"(not (= {px(P)} {px(Q)}))", "p_distinct_q"),
            named(
                f"(= {sum_ites(f'inV_{name}' for name in names)} 3)",
                "V_card_three",
            ),
            named(
                f"(= {sum_ites(f'(and inV_{name} (= {d2_expr(Q, name)} 1))' for name in names)} 3)",
                "V_subset_q_shell",
            ),
            named(
                f"(= {sum_ites(class_condition(name, 'radius1') for name in names)} 5)",
                "ambient_class1_card_five",
            ),
            named(
                f"(= {sum_ites(class_condition(name, 'radius2') for name in names)} 4)",
                "ambient_class2_card_four",
            ),
            named(
                f"(= {sum_ites(f'(and inV_{name} {class_condition(name, "radius1")})' for name in names)} 2)",
                "V_radius_block1_card_two",
            ),
            named(
                f"(= {sum_ites(f'(and inV_{name} {class_condition(name, "radius2")})' for name in names)} 1)",
                "V_radius_block2_card_one",
            ),
            named(
                f"(= {sum_ites(survivor_condition(name, 'radius1') for name in names)} 3)",
                "deleted_class1_card_three",
            ),
            named(
                f"(= {sum_ites(survivor_condition(name, 'radius2') for name in names)} 3)",
                "deleted_class2_card_three",
            ),
            named(class_condition("q", "radius1"), "alias_q_survives_class1"),
            named("(not inV_q)", "alias_q_not_deleted"),
            named(class_condition("k3", "radius2"), "alias_k3_survives_class2"),
            named("(not inV_k3)", "alias_k3_not_deleted"),
        ]
    )
    for restored, radius_symbol in (("k0", "radius1"), ("k1", "radius1"), ("k2", "radius2")):
        lines.append(
            named(
                f"(= {sum_ites(restored_condition(name, restored, radius_symbol) for name in names)} 4)",
                f"restore_{restored}_selected_class_card_four",
            )
        )
    return "\n".join(lines) + "\n"


def main_witness_smt(result: SearchResult) -> str:
    query_names = [
        value
        for name in result.points
        for value in (px(name), py(name), f"inV_{name}")
    ] + ["radius1", "radius2"]
    return (
        witness_body(result)
        + "(check-sat)\n"
        + f"(get-value ({' '.join(query_names)}))\n"
    )


def known_sat_smt() -> str:
    return "\n".join(
        [
            "; Independent hand-checkable exact-rational SAT smoke test.",
            "(set-logic QF_NRA)",
            "(declare-fun x () Real)",
            "(declare-fun y () Real)",
            named("(= x (/ 3 5))", "pin_x"),
            named("(= y (/ 4 5))", "pin_y"),
            named("(= (+ (* x x) (* y y)) 1)", "unit_circle"),
            named("(> y 0)", "upper_half"),
            "(check-sat)",
            "",
        ]
    )


def malformed_controls(result: SearchResult) -> dict[str, str]:
    body = witness_body(result)
    boundary = result.boundary_ccw
    edge_left, edge_right, other = boundary[0], boundary[1], boundary[2]
    names = tuple(result.points)
    return {
        "control_bad_q_shell_membership_unsat.smt2": body
        + named(f"(= {d2_expr(Q, 'r1a')} 1)", "malformed_r1a_on_q_shell")
        + "\n(check-sat)\n",
        "control_bad_deleted_class_count_unsat.smt2": body
        + named(
            f"(= {sum_ites(survivor_condition(name, 'radius1') for name in names)} 4)",
            "malformed_deleted_class1_card_four",
        )
        + "\n(check-sat)\n",
        "control_bad_convexity_unsat.smt2": body
        + named(
            f"(<= {cross_expr(edge_left, edge_right, other)} 0)",
            "malformed_nonpositive_boundary_turn",
        )
        + "\n(check-sat)\n",
    }


def witness_payload(result: SearchResult) -> dict:
    return {
        "schema": "p97-freshthird-rich-apex-depletion-witness-v1",
        "case": "2+1",
        "points": {
            name: [frac_text(x_value), frac_text(y_value)]
            for name, (x_value, y_value) in result.points.items()
        },
        "boundary_ccw": list(result.boundary_ccw),
        "q_shell": sorted(K),
        "deletion_set_V": sorted(V),
        "p_radius1": frac_text(R1),
        "p_radius1_class": sorted(R1_CLASS),
        "p_radius2": frac_text(R2),
        "p_radius2_class": sorted(R2_CLASS),
        "rotation_parameters": {
            name: frac_text(value) for name, value in result.parameters.items()
        },
    }


def parse_witness(payload: dict) -> dict[str, tuple[F, F]]:
    return {
        name: (F(values[0]), F(values[1]))
        for name, values in payload["points"].items()
    }


def exact_validate(payload: dict) -> dict:
    points = parse_witness(payload)
    boundary = tuple(payload["boundary_ccw"])
    checks: dict[str, dict] = {}

    def record(name: str, ok: bool, detail) -> None:
        checks[name] = {"ok": bool(ok), "detail": detail}

    record("pairwise_distinct", len(set(points.values())) == len(points), len(points))
    record("boundary_lists_all_points", set(boundary) == set(points), list(boundary))
    margins: dict[str, str] = {}
    strict_hull = True
    for index, left in enumerate(boundary):
        right = boundary[(index + 1) % len(boundary)]
        values = [
            cross_points(points[left], points[right], points[other])
            for other in boundary
            if other not in {left, right}
        ]
        margin = min(values)
        margins[f"{left}->{right}"] = frac_text(margin)
        strict_hull &= margin > 0
    record("all_named_points_strict_hull_vertices", strict_hull, margins)

    q_members = {name for name, xy in points.items() if dist2_points(points[Q], xy) == 1}
    record("q_circle_exactly_K", q_members == K, sorted(q_members))
    p_r1_members = {
        name for name, xy in points.items() if dist2_points(points[P], xy) == R1
    }
    p_r2_members = {
        name for name, xy in points.items() if dist2_points(points[P], xy) == R2
    }
    record("p_radius1_class_exact", p_r1_members == R1_CLASS, sorted(p_r1_members))
    record("p_radius2_class_exact", p_r2_members == R2_CLASS, sorted(p_r2_members))
    record(
        "named_noncenter_points_partitioned_by_two_classes",
        p_r1_members.isdisjoint(p_r2_members)
        and p_r1_members | p_r2_members == set(points) - {P},
        sorted(p_r1_members | p_r2_members),
    )
    record(
        "represented_D44_rich_profile",
        len(p_r1_members) >= 4 and len(p_r2_members) >= 4,
        [len(p_r1_members), len(p_r2_members)],
    )
    record("positive_distinct_radii", R1 > 0 and R2 > 0 and R1 != R2, [frac_text(R1), frac_text(R2)])
    record("V_subset_K_card_three", V <= K and len(V) == 3, sorted(V))

    block_sizes = sorted((len(V & p_r1_members), len(V & p_r2_members)), reverse=True)
    record("V_radius_partition_2_plus_1", block_sizes == [2, 1], block_sizes)
    survivors1 = p_r1_members - V
    survivors2 = p_r2_members - V
    record("deleted_classes_each_card_three", len(survivors1) == 3 and len(survivors2) == 3, [sorted(survivors1), sorted(survivors2)])
    record(
        "represented_deletion_blocks_K4",
        max(len(survivors1), len(survivors2)) < 4,
        [len(survivors1), len(survivors2)],
    )
    record("source_allowed_alias_q", Q in survivors1, sorted(survivors1))
    record("source_allowed_alias_k3", "k3" in survivors2, sorted(survivors2))
    restored = {
        name: len((p_r1_members if name in {"k0", "k1"} else p_r2_members) - (V - {name}))
        for name in V
    }
    record("each_single_restoration_has_exact_four", all(value == 4 for value in restored.values()), restored)
    record("all_checks", all(item["ok"] for item in checks.values()), len(checks))
    return checks


def parse_solver_status(stdout: str) -> str:
    for line in stdout.splitlines():
        value = line.strip()
        if value in {"sat", "unsat", "unknown"}:
            return value
    return "no-verdict"


def sexpr_tokens(text: str) -> list[str]:
    return re.findall(r"\(|\)|[^\s()]+", text)


def parse_sexpr(tokens: list[str], position: int = 0):
    if tokens[position] != "(":
        return tokens[position], position + 1
    result = []
    position += 1
    while tokens[position] != ")":
        item, position = parse_sexpr(tokens, position)
        result.append(item)
    return result, position + 1


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
        return sum((eval_fraction(item) for item in expr[1:]), F(0))
    if expr[0] == "*":
        result = F(1)
        for item in expr[1:]:
            result *= eval_fraction(item)
        return result
    raise ValueError(f"unsupported rational expression: {expr!r}")


def parse_model_readback(stdout: str, result: SearchResult) -> dict[str, F | bool]:
    start = stdout.find("((")
    if start < 0:
        raise ValueError("solver output has no get-value S-expression")
    parsed, _ = parse_sexpr(sexpr_tokens(stdout[start:]))
    expected_names = {
        value
        for name in result.points
        for value in (px(name), py(name), f"inV_{name}")
    } | {"radius1", "radius2"}
    values: dict[str, F | bool] = {}
    for pair in parsed:
        if not isinstance(pair, list) or len(pair) != 2 or pair[0] not in expected_names:
            continue
        if isinstance(pair[1], str) and pair[1] in {"true", "false"}:
            values[pair[0]] = pair[1] == "true"
        else:
            values[pair[0]] = eval_fraction(pair[1])
    if set(values) != expected_names:
        missing = sorted(expected_names - set(values))
        raise ValueError(f"solver get-value readback is incomplete: {missing}")
    return values


def validate_solver_readback(
    values: dict[str, F | bool], result: SearchResult
) -> tuple[bool, dict, dict]:
    expected: dict[str, F | bool] = {
        value_name: coordinate
        for name, xy in result.points.items()
        for value_name, coordinate in ((px(name), xy[0]), (py(name), xy[1]))
    }
    expected.update({f"inV_{name}": name in V for name in result.points})
    expected.update({"radius1": R1, "radius2": R2})
    exact_values = values == expected
    payload = witness_payload(result)
    payload["points"] = {
        name: [
            frac_text(values[px(name)]),
            frac_text(values[py(name)]),
        ]
        for name in result.points
    }
    validation = exact_validate(payload)
    serializable = {
        name: value if isinstance(value, bool) else frac_text(value)
        for name, value in values.items()
    }
    return exact_values and validation["all_checks"]["ok"], serializable, validation


def run_solver(engine: str, artifact: Path, timeout_seconds: int = 30) -> dict:
    if engine == "z3":
        command = ["z3", "-smt2", f"-T:{timeout_seconds}", str(artifact)]
    elif engine == "cvc5":
        command = [
            "cvc5",
            "--lang",
            "smt2",
            "--nl-cov",
            "--tlimit",
            str(timeout_seconds * 1000),
            str(artifact),
        ]
    else:
        raise ValueError(f"unsupported engine: {engine}")
    process = subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=timeout_seconds + 30,
        check=False,
    )
    engine_log = LOGS / engine
    engine_log.mkdir(parents=True, exist_ok=True)
    (engine_log / f"{artifact.stem}.stdout.txt").write_text(process.stdout)
    (engine_log / f"{artifact.stem}.stderr.txt").write_text(process.stderr)
    return {
        "status": parse_solver_status(process.stdout),
        "returncode": process.returncode,
        "command": command[:-1] + [f"artifacts/{artifact.name}"],
        "stdout": process.stdout,
    }


def command_output(command: list[str]) -> str:
    process = subprocess.run(command, capture_output=True, text=True, check=False, timeout=15)
    output = process.stdout.strip() or process.stderr.strip()
    return output.splitlines()[0] if output else "unavailable"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def write_checksums() -> None:
    excluded = {ROOT / "SHA256SUMS"}
    paths = sorted(
        path
        for path in ROOT.rglob("*")
        if path.is_file()
        and path not in excluded
        and "__pycache__" not in path.parts
        and path.suffix != ".pyc"
    )
    body = "".join(f"{sha256(path)}  {path.relative_to(ROOT)}\n" for path in paths)
    (ROOT / "SHA256SUMS").write_text(body)


def emit_artifacts(result: SearchResult) -> dict[str, str]:
    ARTIFACTS.mkdir(parents=True, exist_ok=True)
    READBACK.mkdir(parents=True, exist_ok=True)
    files = {
        "rich_apex_depletion_2plus1_sat.smt2": main_witness_smt(result),
        "control_known_sat.smt2": known_sat_smt(),
    }
    files.update(malformed_controls(result))
    for name, body in files.items():
        if body.count("(check-sat)") != 1:
            raise AssertionError(f"{name} must contain exactly one check-sat")
        (ARTIFACTS / name).write_text(body)
    payload = witness_payload(result)
    (READBACK / "witness.json").write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    return {name: sha256(ARTIFACTS / name) for name in sorted(files)}


def run_wave() -> dict:
    for binary in ("z3", "cvc5"):
        if shutil.which(binary) is None:
            raise RuntimeError(f"required solver is not on PATH: {binary}")
    result = search_witness()
    artifact_hashes = emit_artifacts(result)
    payload = json.loads((READBACK / "witness.json").read_text())
    validation = exact_validate(payload)
    (READBACK / "exact_fraction_validation.json").write_text(
        json.dumps(validation, indent=2, sort_keys=True) + "\n"
    )
    expected = {
        "rich_apex_depletion_2plus1_sat.smt2": "sat",
        "control_known_sat.smt2": "sat",
        "control_bad_q_shell_membership_unsat.smt2": "unsat",
        "control_bad_deleted_class_count_unsat.smt2": "unsat",
        "control_bad_convexity_unsat.smt2": "unsat",
    }
    solver_results: dict[str, dict[str, dict]] = {"z3": {}, "cvc5": {}}
    for artifact_name in sorted(expected):
        artifact = ARTIFACTS / artifact_name
        for engine, engine_results in solver_results.items():
            verdict = run_solver(engine, artifact)
            stdout = verdict.pop("stdout")
            verdict["expected"] = expected[artifact_name]
            verdict["matches_expected"] = verdict["status"] == expected[artifact_name]
            if artifact_name == "rich_apex_depletion_2plus1_sat.smt2":
                readback = parse_model_readback(stdout, result)
                readback_ok, serializable, model_validation = validate_solver_readback(
                    readback, result
                )
                verdict["model_readback_exact"] = readback_ok
                (READBACK / f"{engine}_model.json").write_text(
                    json.dumps(serializable, indent=2, sort_keys=True) + "\n"
                )
                (READBACK / f"{engine}_model_fraction_validation.json").write_text(
                    json.dumps(model_validation, indent=2, sort_keys=True) + "\n"
                )
            engine_results[artifact_name] = verdict
    all_solver_checks = all(
        verdict["matches_expected"] and verdict.get("model_readback_exact", True)
        for engine_results in solver_results.values()
        for verdict in engine_results.values()
    )
    all_exact_checks = validation["all_checks"]["ok"]
    environment = {
        "python": platform.python_version(),
        "z3": command_output(["z3", "-version"]),
        "cvc5": command_output(["cvc5", "--version"]),
        "solver_concurrency": 1,
    }
    (ROOT / "environment.json").write_text(json.dumps(environment, indent=2, sort_keys=True) + "\n")
    results = {
        "schema": "p97-freshthird-rich-apex-depletion-wave-v1",
        "status": "SAT_LOCAL_PACKET" if all_solver_checks and all_exact_checks else "VALIDATION_FAILED",
        "classification": "local named-role packet consistency only; not a P97 counterexample or universal result",
        "case_searched": "source-allowed alias-aware 2+1 radius partition only",
        "broader_partitions_searched": False,
        "search_grid": {
            "parameter_denominator_max": 16,
            "parameter_abs_numerator_max": 24,
            "radius1_single_candidates": result.radius1_single_candidates,
            "radius2_single_candidates": result.radius2_single_candidates,
            "radius1_pair_candidates": result.radius1_pair_candidates,
            "radius2_pair_candidates": result.radius2_pair_candidates,
            "chosen_parameters": {name: frac_text(value) for name, value in result.parameters.items()},
        },
        "boundary_ccw": list(result.boundary_ccw),
        "artifact_sha256": artifact_hashes,
        "exact_fraction_validation": validation,
        "solver_results": solver_results,
        "all_solver_checks": all_solver_checks,
        "all_exact_checks": all_exact_checks,
    }
    (ROOT / "results.json").write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    write_checksums()
    if not (all_solver_checks and all_exact_checks):
        raise RuntimeError("wave validation failed; inspect results.json")
    return results


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--checksums-only",
        action="store_true",
        help="refresh SHA256SUMS without re-running solvers",
    )
    args = parser.parse_args()
    if args.checksums_only:
        write_checksums()
        print("checksums refreshed")
        return 0
    results = run_wave()
    print(
        json.dumps(
            {
                "status": results["status"],
                "case": results["case_searched"],
                "boundary_ccw": results["boundary_ccw"],
                "chosen_parameters": results["search_grid"]["chosen_parameters"],
                "all_solver_checks": results["all_solver_checks"],
                "all_exact_checks": results["all_exact_checks"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
