#!/usr/bin/env python3
"""Independent integrated Boolean + QF_LRA cross-check for exact-six.

The structural constraints are imported from the deterministic exact-six CNF
encoder one method at a time.  In particular, this script deliberately omits
both transported and learned metric-schema cuts: their consequences are
instead represented directly by distance variables, selected-row equalities,
the complete exact-five apex shell, strict triangles, and both strict
Kalmanson inequalities.

The generated SMT-LIB is solved with cvc5, independently of the active Z3
CEGAR/oracle loop.  A SAT answer is queried for all Boolean and rational
values and replayed exactly.  An UNSAT answer remains an independently
reproducible solver verdict rather than a kernel-checked certificate.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import os
import shutil
import subprocess
import sys
import time
from collections import Counter
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Sequence


HERE = Path(__file__).resolve().parent
ENCODER_PATH = HERE.parent / "exact6-allcenter-coverage-certificate" / "encode.py"
ACTIVE_GATE_PATH = HERE.parent / "exact6-allcenter-capaware-gate" / "allcenter_gate.py"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_encoder():
    spec = importlib.util.spec_from_file_location("p97_exact6_structural_encoder", ENCODER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {ENCODER_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def smt_symbol(name: str) -> str:
    if not name or any(character.isspace() for character in name):
        raise ValueError(name)
    return name


def bool_literal(name: str, positive: bool) -> str:
    symbol = smt_symbol(name)
    return symbol if positive else f"(not {symbol})"


def disjunction(items: Sequence[str]) -> str:
    if not items:
        return "false"
    if len(items) == 1:
        return items[0]
    return f"(or {' '.join(items)})"


def conjunction(items: Sequence[str]) -> str:
    if not items:
        return "true"
    if len(items) == 1:
        return items[0]
    return f"(and {' '.join(items)})"


def distance_name(left: int, right: int) -> str:
    if left == right:
        raise ValueError("distance loop has no variable")
    a, b = sorted((left, right))
    return f"d_{a}_{b}"


def distance(left: int, right: int) -> str:
    return "0" if left == right else distance_name(left, right)


def structural_cnf(orbit: str):
    """Build the current source-faithful structural outer without cut banks."""
    encoder_module = load_encoder()
    encoder = encoder_module.ExactSixOuterEncoder(orbit)
    methods = (
        "add_row_cardinality",
        "add_finite_incidence_bounds",
        "add_perpendicular_bisector_order",
        "add_cap_bounds",
        "add_exact_five_shell",
        "add_exact_shell_selected_row_alternation",
        "add_named_roles",
        "add_blocker_map",
        "add_named_critical_rows",
        "add_strong_connectivity",
    )
    for method in methods:
        getattr(encoder, method)()
    required = "exact_shell_selected_row_alternation"
    if required not in encoder.cnf.kinds:
        raise AssertionError(f"missing required clause family {required}")
    forbidden = {
        "transported_2k3_schema_cuts",
        "learned_weighted_kalmanson_schema_cuts",
    }
    if forbidden.intersection(encoder.cnf.kinds):
        raise AssertionError("metric cut bank leaked into integrated encoding")
    return encoder_module, encoder


def render_integrated(orbit: str, surface: str) -> tuple[str, dict[str, object]]:
    if surface not in {"full", "kalmanson-only"}:
        raise ValueError(surface)
    module, encoder = structural_cnf(orbit)
    n = module.N
    vertices = tuple(range(n))
    lines = [
        "; schema p97-exact6-integrated-qflra-v1",
        f"; orbit {orbit}",
        f"; surface {surface}",
        "; retained strict homogeneous inequalities normalized to integral slack >= 1",
        "(set-logic QF_LRA)",
    ]

    bool_names = tuple(encoder.v.by_name)
    for name in bool_names:
        lines.append(f"(declare-fun {smt_symbol(name)} () Bool)")
    distance_names = tuple(
        distance_name(left, right)
        for left, right in itertools.combinations(vertices, 2)
    )
    for name in distance_names:
        lines.append(f"(declare-fun {name} () Real)")

    inverse = {variable: name for name, variable in encoder.v.by_name.items()}
    for clause in encoder.cnf.clauses:
        literals = [
            bool_literal(inverse[abs(literal)], literal > 0)
            for literal in clause
        ]
        lines.append(f"(assert {disjunction(literals)})")

    linear_counts: Counter[str] = Counter()

    def assert_linear(kind: str, formula: str) -> None:
        linear_counts[kind] += 1
        lines.append(f"(assert {formula})")

    # The +1 normalization is equisatisfiable with the finite strict,
    # homogeneous metric system: any strict solution can be scaled so every
    # positive slack is at least one.
    if surface == "full":
        for left, right in itertools.combinations(vertices, 2):
            assert_linear("distance_positivity", f"(>= {distance(left, right)} 1)")

        for a, b, c in itertools.combinations(vertices, 3):
            assert_linear(
                "strict_triangle",
                f"(>= (+ {distance(a, b)} {distance(b, c)}) (+ {distance(a, c)} 1))",
            )
            assert_linear(
                "strict_triangle",
                f"(>= (+ {distance(a, c)} {distance(b, c)}) (+ {distance(a, b)} 1))",
            )
            assert_linear(
                "strict_triangle",
                f"(>= (+ {distance(a, b)} {distance(a, c)}) (+ {distance(b, c)} 1))",
            )

    for a, b, c, d in itertools.combinations(vertices, 4):
        diagonals = f"(+ {distance(a, c)} {distance(b, d)})"
        assert_linear(
            "strict_kalmanson_first",
            f"(>= {diagonals} (+ {distance(a, b)} {distance(c, d)} 1))",
        )
        assert_linear(
            "strict_kalmanson_second",
            f"(>= {diagonals} (+ {distance(a, d)} {distance(b, c)} 1))",
        )

    member = encoder.member
    for center in vertices:
        choices = tuple(point for point in vertices if point != center)
        for left, right in itertools.combinations(choices, 2):
            antecedent = conjunction((
                inverse[member[center, left]],
                inverse[member[center, right]],
            ))
            equality = f"(= {distance(center, left)} {distance(center, right)})"
            assert_linear("selected_row_pair_equality", f"(=> {antecedent} {equality})")

    apex = module.SECOND_APEX
    shell_points = tuple(point for point in vertices if point != apex)
    for left, right in itertools.combinations(shell_points, 2):
        antecedent = conjunction((
            inverse[encoder.shell[left]],
            inverse[encoder.shell[right]],
        ))
        equality = f"(= {distance(apex, left)} {distance(apex, right)})"
        assert_linear("exact_five_apex_pair_equality", f"(=> {antecedent} {equality})")

    lines.append("(check-sat)")
    text = "\n".join(lines) + "\n"
    structural_counts = Counter(encoder.cnf.kinds)
    manifest = {
        "schema": "p97-exact6-integrated-qflra-manifest-v1",
        "epistemic_status": "EXACT_FINITE_QF_LRA_ENCODING_NOT_LIVE_LEAN_CLOSURE",
        "orbit": orbit,
        "surface": surface,
        "n": n,
        "boolean_variable_count": len(bool_names),
        "distance_variable_count": len(distance_names),
        "total_variable_count": len(bool_names) + len(distance_names),
        "structural_clause_count": len(encoder.cnf.clauses),
        "structural_category_counts": dict(sorted(structural_counts.items())),
        "linear_assertion_count": sum(linear_counts.values()),
        "linear_category_counts": dict(sorted(linear_counts.items())),
        "total_assertion_count": len(encoder.cnf.clauses) + sum(linear_counts.values()),
        "source_files": {
            str(ENCODER_PATH.relative_to(HERE.parents[2])): sha256(ENCODER_PATH),
            str(ACTIVE_GATE_PATH.relative_to(HERE.parents[2])): sha256(ACTIVE_GATE_PATH),
        },
        "source_methods": [
            "ExactSixOuterEncoder.add_row_cardinality",
            "ExactSixOuterEncoder.add_finite_incidence_bounds",
            "ExactSixOuterEncoder.add_perpendicular_bisector_order",
            "ExactSixOuterEncoder.add_cap_bounds",
            "ExactSixOuterEncoder.add_exact_five_shell",
            "ExactSixOuterEncoder.add_exact_shell_selected_row_alternation",
            "ExactSixOuterEncoder.add_named_roles",
            "ExactSixOuterEncoder.add_blocker_map",
            "ExactSixOuterEncoder.add_named_critical_rows",
            "ExactSixOuterEncoder.add_strong_connectivity",
        ],
        "explicitly_omitted": [
            "transported 2K3 schema cuts",
            "learned weighted-Kalmanson schema cuts",
            "complete deleted-source no_qfree radius semantics",
            "exact blocker-row filters beyond selected K4 equalities",
            "Euclidean rank-two realization",
            "MEC and nonobtuse support geometry",
            "noM44 and alternate-support-triangle quantification",
        ],
        "strict_normalization": (
            "Every retained finite strict slack is at least 1. This is equisatisfiable with "
            "the corresponding strict homogeneous system by positive scaling."
        ),
        "model_query_symbols": [*bool_names, *distance_names],
    }
    return text, manifest


def render_smoke(shared_second_center: bool) -> str:
    """Four-point hand-check: equal diagonally separated fibers are impossible."""
    lines = [
        "(set-logic QF_LRA)",
        *(f"(declare-fun {distance_name(a, b)} () Real)"
          for a, b in itertools.combinations(range(4), 2)),
    ]
    for a, b in itertools.combinations(range(4), 2):
        lines.append(f"(assert (>= {distance(a, b)} 1))")
    for a, b, c in itertools.combinations(range(4), 3):
        lines.extend((
            f"(assert (>= (+ {distance(a, b)} {distance(b, c)}) (+ {distance(a, c)} 1)))",
            f"(assert (>= (+ {distance(a, c)} {distance(b, c)}) (+ {distance(a, b)} 1)))",
            f"(assert (>= (+ {distance(a, b)} {distance(a, c)}) (+ {distance(b, c)} 1)))",
        ))
    lines.extend((
        f"(assert (>= (+ {distance(0, 2)} {distance(1, 3)}) (+ {distance(0, 1)} {distance(2, 3)} 1)))",
        f"(assert (>= (+ {distance(0, 2)} {distance(1, 3)}) (+ {distance(0, 3)} {distance(1, 2)} 1)))",
        f"(assert (= {distance(0, 1)} {distance(0, 2)}))",
    ))
    if shared_second_center:
        lines.append(f"(assert (= {distance(3, 1)} {distance(3, 2)}))")
    lines.append("(check-sat)")
    return "\n".join(lines) + "\n"


def verdict(stdout: str) -> str:
    for line in stdout.splitlines():
        item = line.strip()
        if item in {"sat", "unsat", "unknown"}:
            return item.upper()
    return "ERROR"


def run_cvc5(smt2_path: Path, timeout_seconds: int) -> dict[str, object]:
    binary = shutil.which("cvc5")
    if binary is None:
        raise RuntimeError("cvc5 is not on PATH")
    command = [
        binary,
        "--lang", "smt2",
        "--tlimit", str(timeout_seconds * 1000),
        "--stats",
        str(smt2_path),
    ]
    started = time.monotonic()
    timed_out = False
    try:
        completed = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout_seconds + 30,
            check=False,
        )
        stdout = completed.stdout
        stderr = completed.stderr
        returncode = completed.returncode
    except subprocess.TimeoutExpired as error:
        timed_out = True
        stdout = error.stdout or ""
        stderr = error.stderr or ""
        if isinstance(stdout, bytes):
            stdout = stdout.decode("utf-8", errors="replace")
        if isinstance(stderr, bytes):
            stderr = stderr.decode("utf-8", errors="replace")
        returncode = None
    elapsed = time.monotonic() - started
    solver_timed_out = (
        timed_out
        or "interrupted by timeout" in stderr.lower()
        or "interrupted by timeout" in stdout.lower()
    )
    status = "TIMEOUT" if solver_timed_out else verdict(stdout)
    return {
        "solver": "cvc5",
        "solver_version": subprocess.run(
            [binary, "--version"], capture_output=True, text=True, check=False
        ).stdout.splitlines()[0],
        "command": command,
        "timeout_seconds": timeout_seconds,
        "elapsed_seconds": elapsed,
        "returncode": returncode,
        "status": status,
        "stdout": stdout,
        "stderr": stderr,
    }


def tokenize_sexps(text: str) -> list[str]:
    tokens: list[str] = []
    current: list[str] = []
    for character in text:
        if character in "()":
            if current:
                tokens.append("".join(current))
                current.clear()
            tokens.append(character)
        elif character.isspace():
            if current:
                tokens.append("".join(current))
                current.clear()
        else:
            current.append(character)
    if current:
        tokens.append("".join(current))
    return tokens


def parse_sexps(text: str) -> list[object]:
    tokens = tokenize_sexps(text)
    index = 0

    def parse_one() -> object:
        nonlocal index
        if index >= len(tokens):
            raise ValueError("unexpected end of s-expression")
        token = tokens[index]
        index += 1
        if token != "(":
            if token == ")":
                raise ValueError("unexpected close parenthesis")
            return token
        result: list[object] = []
        while True:
            if index >= len(tokens):
                raise ValueError("unterminated s-expression")
            if tokens[index] == ")":
                index += 1
                return result
            result.append(parse_one())

    expressions: list[object] = []
    while index < len(tokens):
        expressions.append(parse_one())
    return expressions


def rational(expression: object) -> Fraction:
    if isinstance(expression, str):
        if expression.endswith("?"):
            expression = expression[:-1]
        return Fraction(expression)
    if not isinstance(expression, list) or not expression:
        raise ValueError(f"not a rational: {expression}")
    operator = expression[0]
    if operator == "-" and len(expression) == 2:
        return -rational(expression[1])
    if operator == "/" and len(expression) == 3:
        return rational(expression[1]) / rational(expression[2])
    raise ValueError(f"unsupported rational expression: {expression}")


def query_model(smt2_path: Path, symbols: Sequence[str], timeout_seconds: int) -> dict[str, object]:
    binary = shutil.which("cvc5")
    if binary is None:
        raise RuntimeError("cvc5 is not on PATH")
    original = smt2_path.read_text(encoding="utf-8")
    query = original + f"(get-value ({' '.join(symbols)}))\n"
    command = [
        binary,
        "--lang", "smt2",
        "--produce-models",
        "--tlimit", str(timeout_seconds * 1000),
    ]
    completed = subprocess.run(
        command,
        input=query,
        capture_output=True,
        text=True,
        timeout=timeout_seconds + 30,
        check=False,
    )
    if verdict(completed.stdout) != "SAT":
        raise RuntimeError(f"model rerun failed: {completed.stdout}\n{completed.stderr}")
    body = "\n".join(
        line for line in completed.stdout.splitlines() if line.strip() != "sat"
    )
    expressions = parse_sexps(body)
    if len(expressions) != 1 or not isinstance(expressions[0], list):
        raise ValueError("unexpected get-value response")
    values: dict[str, object] = {}
    for pair in expressions[0]:
        if not isinstance(pair, list) or len(pair) != 2 or not isinstance(pair[0], str):
            raise ValueError(f"unexpected model entry: {pair}")
        name = pair[0]
        value = pair[1]
        if value in {"true", "false"}:
            values[name] = value == "true"
        else:
            values[name] = rational(value)
    missing = set(symbols) - set(values)
    if missing:
        raise ValueError(f"model omitted {len(missing)} symbols")
    return values


def replay_model(orbit: str, surface: str, values: dict[str, object]) -> dict[str, object]:
    module, encoder = structural_cnf(orbit)
    inverse = {variable: name for name, variable in encoder.v.by_name.items()}
    errors: list[str] = []
    for clause_index, clause in enumerate(encoder.cnf.clauses, start=1):
        if not any(
            bool(values[inverse[abs(literal)]]) == (literal > 0)
            for literal in clause
        ):
            errors.append(f"structural clause {clause_index} failed")
            if len(errors) >= 20:
                break

    def d(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        value = values[distance_name(left, right)]
        if not isinstance(value, Fraction):
            raise TypeError((left, right, value))
        return value

    vertices = tuple(range(module.N))
    if surface == "full":
        for left, right in itertools.combinations(vertices, 2):
            if d(left, right) < 1:
                errors.append(f"positivity failed {left,right}")
        for a, b, c in itertools.combinations(vertices, 3):
            if d(a, b) + d(b, c) < d(a, c) + 1:
                errors.append(f"triangle 0 failed {a,b,c}")
            if d(a, c) + d(b, c) < d(a, b) + 1:
                errors.append(f"triangle 1 failed {a,b,c}")
            if d(a, b) + d(a, c) < d(b, c) + 1:
                errors.append(f"triangle 2 failed {a,b,c}")
    for a, b, c, d_vertex in itertools.combinations(vertices, 4):
        diagonals = d(a, c) + d(b, d_vertex)
        if diagonals < d(a, b) + d(c, d_vertex) + 1:
            errors.append(f"Kalmanson first failed {a,b,c,d_vertex}")
        if diagonals < d(a, d_vertex) + d(b, c) + 1:
            errors.append(f"Kalmanson second failed {a,b,c,d_vertex}")
    for center in vertices:
        support = [
            point for point in vertices
            if bool(values[f"member_{center}_{point}"])
        ]
        for left, right in itertools.combinations(support, 2):
            if d(center, left) != d(center, right):
                errors.append(f"selected row equality failed {center,left,right}")
    shell = [point for point in vertices if bool(values[f"shell_{point}"])]
    for left, right in itertools.combinations(shell, 2):
        if d(module.SECOND_APEX, left) != d(module.SECOND_APEX, right):
            errors.append(f"apex shell equality failed {left,right}")
    return {
        "status": "VERIFIED" if not errors else "FAILED",
        "error_count": len(errors),
        "errors": errors[:100],
        "rows": {
            str(center): [
                point for point in vertices
                if bool(values[f"member_{center}_{point}"])
            ]
            for center in vertices
        },
        "shell": shell,
    }


def write_json(path: Path, payload: object) -> None:
    path.write_text(json.dumps(payload, indent=2, sort_keys=True, default=str) + "\n")


def repair_timeout_results(output_dir: Path) -> dict[str, object]:
    repaired: list[str] = []
    for result_path in sorted(output_dir.glob("n14_*.result.json")):
        payload = json.loads(result_path.read_text(encoding="utf-8"))
        stderr_name = payload.get("stderr_path")
        stderr = (
            (output_dir / stderr_name).read_text(encoding="utf-8")
            if isinstance(stderr_name, str) and (output_dir / stderr_name).exists()
            else ""
        )
        if payload.get("status") == "ERROR" and "interrupted by timeout" in stderr.lower():
            payload["status"] = "TIMEOUT"
            payload["epistemic_status"] = "BOUNDED_CVC5_NO_VERDICT"
            payload["timeout_classification"] = "replayed from exact cvc5 stderr marker"
            if "surface" not in payload:
                payload["surface"] = "full"
            write_json(result_path, payload)
            repaired.append(result_path.name)
    summary = {
        "schema": "p97-exact6-integrated-qflra-timeout-repair-v1",
        "status": "COMPLETE",
        "repaired_count": len(repaired),
        "repaired": repaired,
    }
    write_json(output_dir / "timeout-repair.result.json", summary)
    return summary


def run_smoke(output_dir: Path, timeout_seconds: int) -> dict[str, object]:
    output_dir.mkdir(parents=True, exist_ok=True)
    records: dict[str, object] = {}
    for name, shared, expected in (
        ("sat_one_center", False, "SAT"),
        ("unsat_two_centers", True, "UNSAT"),
    ):
        path = output_dir / f"smoke_{name}.smt2"
        path.write_text(render_smoke(shared), encoding="utf-8")
        result = run_cvc5(path, timeout_seconds)
        if result["status"] != expected:
            raise AssertionError((name, result["status"], expected))
        (output_dir / f"smoke_{name}.stdout.txt").write_text(
            str(result.pop("stdout")), encoding="utf-8"
        )
        (output_dir / f"smoke_{name}.stderr.txt").write_text(
            str(result.pop("stderr")), encoding="utf-8"
        )
        result["smt2_sha256"] = sha256(path)
        records[name] = result
    payload = {
        "schema": "p97-exact6-integrated-qflra-smoke-v1",
        "status": "PASSED",
        "cases": records,
        "hand_check": (
            "For cyclic 0<1<2<3, Kalmanson-1 contradicts simultaneous "
            "d(0,1)=d(0,2) and d(3,1)=d(3,2); removing the second equality is SAT."
        ),
    }
    write_json(output_dir / "smoke.result.json", payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=(
        "continuationOrder",
        "reverseContinuationOrder",
        "sharesFirstAtSource",
        "sharesFirstAtTarget",
        "sharesSecondAtSource",
        "sharesSecondAtTarget",
        "fourDistinct",
    ))
    parser.add_argument("--output-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument("--surface", choices=("full", "kalmanson-only"), default="full")
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--generate-only", action="store_true")
    parser.add_argument("--repair-results", action="store_true")
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)

    if args.repair_results:
        print(json.dumps(repair_timeout_results(args.output_dir), sort_keys=True))
        return 0
    if args.smoke:
        run_smoke(args.output_dir, min(args.timeout_seconds, 60))
        return 0
    if args.orbit is None:
        parser.error("--orbit is required unless --smoke is used")

    smt2_text, manifest = render_integrated(args.orbit, args.surface)
    stem = f"n14_{args.orbit}_{args.surface}"
    smt2_path = args.output_dir / f"{stem}.smt2"
    manifest_path = args.output_dir / f"{stem}.manifest.json"
    result_path = args.output_dir / f"{stem}.result.json"
    stdout_path = args.output_dir / f"{stem}.stdout.txt"
    stderr_path = args.output_dir / f"{stem}.stderr.txt"
    smt2_path.write_text(smt2_text, encoding="utf-8")
    manifest["smt2_sha256"] = sha256(smt2_path)
    manifest["smt2_bytes"] = smt2_path.stat().st_size
    write_json(manifest_path, manifest)
    print(json.dumps({
        "event": "generated",
        "orbit": args.orbit,
        "surface": args.surface,
        "assertions": manifest["total_assertion_count"],
        "bytes": manifest["smt2_bytes"],
        "sha256": manifest["smt2_sha256"],
    }, sort_keys=True), flush=True)
    if args.generate_only:
        return 0

    result = run_cvc5(smt2_path, args.timeout_seconds)
    stdout_path.write_text(str(result.pop("stdout")), encoding="utf-8")
    stderr_path.write_text(str(result.pop("stderr")), encoding="utf-8")
    result.update({
        "schema": "p97-exact6-integrated-qflra-result-v1",
        "epistemic_status": (
            "BOUNDED_CVC5_NO_VERDICT"
            if result["status"] in {"TIMEOUT", "UNKNOWN"}
            else "INDEPENDENT_CVC5_VERDICT_NOT_KERNEL_CERTIFICATE"
        ),
        "orbit": args.orbit,
        "surface": args.surface,
        "smt2_sha256": manifest["smt2_sha256"],
        "manifest_sha256": sha256(manifest_path),
        "stdout_path": stdout_path.name,
        "stderr_path": stderr_path.name,
    })
    if result["status"] == "SAT":
        values = query_model(
            smt2_path,
            manifest["model_query_symbols"],
            args.timeout_seconds,
        )
        replay = replay_model(args.orbit, args.surface, values)
        if replay["status"] != "VERIFIED":
            raise AssertionError(replay)
        model_path = args.output_dir / f"{stem}.model.json"
        write_json(model_path, {
            "schema": "p97-exact6-integrated-qflra-model-v1",
            "values": values,
            "replay": replay,
        })
        result["model_path"] = model_path.name
        result["model_sha256"] = sha256(model_path)
        result["model_replay"] = "VERIFIED"
    write_json(result_path, result)
    print(json.dumps({
        "event": "solved",
        "orbit": args.orbit,
        "surface": args.surface,
        "status": result["status"],
        "elapsed_seconds": result["elapsed_seconds"],
        "result": str(result_path),
    }, sort_keys=True), flush=True)
    return 0 if result["status"] in {"SAT", "UNSAT", "UNKNOWN", "TIMEOUT"} else 2


if __name__ == "__main__":
    raise SystemExit(main())
