#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Generate exact endpoint Nullstellensatz certificate data.

This consumes the rvol COMP-G-EP endpoint artifacts and emits certificate JSON
records of one uniform shape:

    sum_i coefficients[i] * generators[i] = 1

For base-empty endpoint rows the generators are the base metric equations.  For
forced-collapse rows the last generator is the Rabinowitsch equation
`t * dist2(A, B) - 1` for a certified forced pair `A = B`.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile
from dataclasses import dataclass
from functools import lru_cache
from fractions import Fraction
from pathlib import Path
from typing import Iterable


POINTS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
DEFAULT_PAIR = "s1=s3"
SCHEMA = "endpoint_certificate.v1"
FIXED_ENDPOINT_POINTS = {"v", "w"}


Monomial = tuple[int, ...]
Poly = dict[Monomial, Fraction]


class ParseError(ValueError):
    pass


def zero_monomial(nvars: int) -> Monomial:
    return (0,) * nvars


def clean(poly: Poly) -> Poly:
    return {m: c for m, c in poly.items() if c}


def const_poly(value: Fraction, nvars: int) -> Poly:
    if value == 0:
        return {}
    return {zero_monomial(nvars): value}


def var_poly(index: int, nvars: int) -> Poly:
    exps = [0] * nvars
    exps[index] = 1
    return {tuple(exps): Fraction(1)}


def add_poly(a: Poly, b: Poly) -> Poly:
    out = dict(a)
    for monom, coeff in b.items():
        out[monom] = out.get(monom, Fraction(0)) + coeff
    return clean(out)


def neg_poly(a: Poly) -> Poly:
    return {monom: -coeff for monom, coeff in a.items()}


def sub_poly(a: Poly, b: Poly) -> Poly:
    return add_poly(a, neg_poly(b))


def mul_poly(a: Poly, b: Poly) -> Poly:
    if not a or not b:
        return {}
    out: Poly = {}
    for ma, ca in a.items():
        for mb, cb in b.items():
            monom = tuple(x + y for x, y in zip(ma, mb, strict=True))
            out[monom] = out.get(monom, Fraction(0)) + ca * cb
    return clean(out)


def pow_poly(poly: Poly, exponent: int, nvars: int) -> Poly:
    if exponent < 0:
        raise ParseError("negative polynomial exponent")
    out = const_poly(Fraction(1), nvars)
    base = poly
    e = exponent
    while e:
        if e & 1:
            out = mul_poly(out, base)
        base = mul_poly(base, base)
        e >>= 1
    return out


Token = tuple[str, str]
TOKEN_RE = re.compile(r"\s*(?:(\d+(?:/\d+)?)|([A-Za-z_][A-Za-z0-9_]*)|(.))")


def tokenize(expr: str) -> list[Token]:
    tokens: list[Token] = []
    expr = normalize_poly(expr)
    pos = 0
    while pos < len(expr):
        match = TOKEN_RE.match(expr, pos)
        if match is None:
            raise ParseError(f"could not tokenize near {expr[pos:pos + 20]!r}")
        pos = match.end()
        number, ident, other = match.groups()
        if number is not None:
            tokens.append(("NUMBER", number))
        elif ident is not None:
            tokens.append(("IDENT", ident))
        elif other.strip() == "":
            continue
        elif other in "+-*^()":
            tokens.append((other, other))
        else:
            raise ParseError(f"unexpected token {other!r}")
    tokens.append(("EOF", ""))
    return tokens


@dataclass
class Parser:
    tokens: list[Token]
    variables: dict[str, int]
    nvars: int
    index: int = 0

    def peek(self) -> Token:
        return self.tokens[self.index]

    def accept(self, kind: str) -> str | None:
        if self.peek()[0] == kind:
            value = self.peek()[1]
            self.index += 1
            return value
        return None

    def expect(self, kind: str) -> str:
        value = self.accept(kind)
        if value is None:
            got = self.peek()
            raise ParseError(f"expected {kind}, got {got[0]} {got[1]!r}")
        return value

    def parse(self) -> Poly:
        poly = self.expr()
        self.expect("EOF")
        return poly

    def expr(self) -> Poly:
        out = self.term()
        while True:
            if self.accept("+") is not None:
                out = add_poly(out, self.term())
            elif self.accept("-") is not None:
                out = sub_poly(out, self.term())
            else:
                return out

    def term(self) -> Poly:
        out = self.unary()
        while self.accept("*") is not None:
            out = mul_poly(out, self.unary())
        return out

    def power(self) -> Poly:
        out = self.atom()
        if self.accept("^") is not None:
            exponent = self.expect("NUMBER")
            if "/" in exponent:
                raise ParseError(f"non-integral exponent {exponent!r}")
            out = pow_poly(out, int(exponent), self.nvars)
        return out

    def unary(self) -> Poly:
        if self.accept("+") is not None:
            return self.unary()
        if self.accept("-") is not None:
            return neg_poly(self.unary())
        return self.power()

    def atom(self) -> Poly:
        number = self.accept("NUMBER")
        if number is not None:
            return const_poly(Fraction(number), self.nvars)
        ident = self.accept("IDENT")
        if ident is not None:
            try:
                return var_poly(self.variables[ident], self.nvars)
            except KeyError as exc:
                raise ParseError(f"unknown variable {ident!r}") from exc
        if self.accept("(") is not None:
            out = self.expr()
            self.expect(")")
            return out
        got = self.peek()
        raise ParseError(f"expected atom, got {got[0]} {got[1]!r}")


def parse_poly(expr: str, variables: list[str]) -> Poly:
    var_index = {name: i for i, name in enumerate(variables)}
    return Parser(tokenize(expr), var_index, len(variables)).parse()


def normalize_poly(poly: str) -> str:
    return poly.replace("**", "^").replace("\n", "")


def check_identity(variables: list[str], generators: list[str], coefficients: list[str]) -> None:
    if len(generators) != len(coefficients):
        raise ValueError(
            f"generator/coefficient length mismatch: {len(generators)} != {len(coefficients)}"
        )
    total: Poly = {}
    for gen, coeff in zip(generators, coefficients, strict=True):
        total = add_poly(
            total,
            mul_poly(parse_poly(coeff, variables), parse_poly(gen, variables)),
        )
    expected = const_poly(Fraction(1), len(variables))
    if total != expected:
        terms = sum(1 for _ in total)
        raise ValueError(f"certificate identity check failed; residual terms={terms}")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def dist2_poly(a: str, b: str, variables: tuple[str, ...]) -> Poly:
    return parse_poly(dist2_expr(a, b), list(variables))


@lru_cache(maxsize=None)
def canonical_distance_eqs(
    variables: tuple[str, ...],
) -> dict[tuple[tuple[Monomial, Fraction], ...], dict[str, object]]:
    out: dict[tuple[tuple[Monomial, Fraction], ...], dict[str, object]] = {}
    for center in POINTS:
        witnesses = [point for point in POINTS if point != center]
        for idx, left in enumerate(witnesses):
            for right in witnesses[idx + 1 :]:
                poly = sub_poly(
                    dist2_poly(center, left, variables),
                    dist2_poly(center, right, variables),
                )
                neg = neg_poly(poly)
                payload = {
                    "kind": "distance_eq",
                    "center": center,
                    "witnesses": [left, right],
                    "equation": f"dist2({center},{left}) = dist2({center},{right})",
                }
                out[poly_key(poly)] = {**payload, "sign": 1}
                out[poly_key(neg)] = {**payload, "sign": -1}
    return out


@lru_cache(maxsize=None)
def canonical_rabinowitsch_generators(
    variables: tuple[str, ...],
) -> dict[tuple[tuple[Monomial, Fraction], ...], dict[str, object]]:
    if "t" not in variables:
        return {}
    out: dict[tuple[tuple[Monomial, Fraction], ...], dict[str, object]] = {}
    for idx, left in enumerate(POINTS):
        for right in POINTS[idx + 1 :]:
            poly = parse_poly(rabinowitsch_generator(f"{left}={right}"), list(variables))
            out[poly_key(poly)] = {
                "kind": "rabinowitsch_distinct",
                "pair": [left, right],
                "equation": f"t * dist2({left},{right}) - 1",
                "sign": 1,
            }
    return out


def poly_key(poly: Poly) -> tuple[tuple[Monomial, Fraction], ...]:
    return tuple(sorted(clean(poly).items()))


def classify_generator(expr: str, variables: list[str]) -> dict[str, object]:
    poly = parse_poly(expr, variables)
    key = poly_key(poly)
    variable_key = tuple(variables)
    distance_eqs = canonical_distance_eqs(variable_key)
    if key in distance_eqs:
        return distance_eqs[key]
    rabinowitsch = canonical_rabinowitsch_generators(variable_key)
    if key in rabinowitsch:
        return rabinowitsch[key]
    return {"kind": "unclassified"}


def coefficient_string_is_nonzero(expr: str) -> bool:
    return normalize_poly(expr).strip() not in {"", "0"}


def validate_certificate_shape(path: Path) -> dict[str, object]:
    cert = json.loads(path.read_text())
    if cert.get("schema") != SCHEMA:
        raise ValueError(f"{path}: unsupported schema {cert.get('schema')!r}")
    variables = cert.get("variables")
    generators = cert.get("generators")
    coefficients = cert.get("coefficients")
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{path}: invalid variables")
    if not isinstance(generators, list) or not all(isinstance(x, str) for x in generators):
        raise ValueError(f"{path}: invalid generators")
    if not isinstance(coefficients, list) or not all(isinstance(x, str) for x in coefficients):
        raise ValueError(f"{path}: invalid coefficients")
    if len(generators) != len(coefficients):
        raise ValueError(f"{path}: generator/coefficient length mismatch")
    return cert


def endpoint_core_row(path: Path) -> dict[str, object]:
    cert = validate_certificate_shape(path)
    variables = cert["variables"]
    generators = cert["generators"]
    coefficients = cert["coefficients"]
    assert isinstance(variables, list)
    assert isinstance(generators, list)
    assert isinstance(coefficients, list)

    variable_names = [str(variable) for variable in variables]
    classified = [classify_generator(str(generator), variable_names) for generator in generators]
    nonzero_indices = [
        index
        for index, coefficient in enumerate(coefficients)
        if coefficient_string_is_nonzero(str(coefficient))
    ]
    nonzero_index_set = set(nonzero_indices)
    nonzero_generators: list[dict[str, object]] = []
    centers_used: set[str] = set()
    rabinowitsch_pairs: list[list[str]] = []
    unclassified_indices: list[int] = []
    for index in nonzero_indices:
        classification = classified[index]
        kind = classification.get("kind")
        if kind == "distance_eq":
            centers_used.add(str(classification["center"]))
        elif kind == "rabinowitsch_distinct":
            pair = classification.get("pair")
            if isinstance(pair, list):
                rabinowitsch_pairs.append([str(pair[0]), str(pair[1])])
        else:
            unclassified_indices.append(index)
        nonzero_generators.append(
            {
                "index": index,
                "generator": generators[index],
                "classification": classification,
            }
        )

    return {
        "pid": cert["pid"],
        "kind": cert["kind"],
        "pair": cert.get("pair"),
        "path": str(path),
        "sha256": sha256_file(path),
        "generator_count": len(generators),
        "nonzero_count": len(nonzero_indices),
        "zero_count": len(generators) - len(nonzero_indices),
        "nonzero_indices": nonzero_indices,
        "zero_indices": [
            index for index in range(len(generators)) if index not in nonzero_index_set
        ],
        "centers_used": sorted(centers_used, key=POINTS.index),
        "rabinowitsch_pairs": rabinowitsch_pairs,
        "unclassified_nonzero_indices": unclassified_indices,
        "stored_python_exact_check": bool(
            cert.get("checks", {}).get("python_exact_polynomial")
        ),
        "nonzero_generators": nonzero_generators,
    }


def count_by(items: Iterable[object]) -> dict[str, int]:
    counts: dict[str, int] = {}
    for item in items:
        key = str(item)
        counts[key] = counts.get(key, 0) + 1
    return dict(sorted(counts.items()))


def endpoint_core_census(paths: list[Path]) -> dict[str, object]:
    files = certificate_files(paths)
    if not files:
        raise ValueError("no endpoint certificate JSON files to summarize")
    rows = [endpoint_core_row(path) for path in files]
    center_usage: dict[str, int] = {point: 0 for point in POINTS}
    center_rows: dict[str, list[str]] = {point: [] for point in POINTS}
    for row in rows:
        for center in row["centers_used"]:
            center_usage[str(center)] += 1
            center_rows[str(center)].append(str(row["pid"]))

    return {
        "schema": "endpoint_core_census.v1",
        "support_kind": "nonzero_lift_coefficients",
        "source": {
            "paths": [str(path) for path in files],
            "count": len(files),
        },
        "summary": {
            "row_count": len(rows),
            "kind_counts": count_by(row["kind"] for row in rows),
            "pair_counts": count_by(row["pair"] for row in rows),
            "generator_count_distribution": count_by(row["generator_count"] for row in rows),
            "nonzero_count_distribution": count_by(row["nonzero_count"] for row in rows),
            "stored_python_exact_check_count": sum(
                1 for row in rows if row["stored_python_exact_check"]
            ),
            "rows_with_unclassified_nonzero_generators": [
                row["pid"] for row in rows if row["unclassified_nonzero_indices"]
            ],
            "center_usage_rows": {
                center: count for center, count in center_usage.items() if count
            },
            "center_usage_pids": {
                center: pids for center, pids in center_rows.items() if pids
            },
        },
        "rows": rows,
    }


def write_endpoint_core_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    assert isinstance(summary, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Endpoint Certificate Core Census",
        "",
        "This report records, for each endpoint certificate, which generators have",
        "nonzero lift coefficients in the checked Nullstellensatz/Rabinowitsch",
        "identity. It is generated by `scripts/endpoint-certificate.py` from the",
        "checked JSON certificates under `certificates/endpoint/`.",
        "",
        "This is a lifted-column support census, not a minimal-core census: a",
        "nonzero coefficient identifies a generator used by the emitted certificate,",
        "but a smaller certificate may exist.",
        "",
        "## Summary",
        "",
        f"- rows: {summary['row_count']}",
        f"- stored Python exact-check flags: {summary['stored_python_exact_check_count']}",
        f"- kind counts: `{summary['kind_counts']}`",
        f"- generator-count distribution: `{summary['generator_count_distribution']}`",
        f"- nonzero-count distribution: `{summary['nonzero_count_distribution']}`",
        "- rows with unclassified nonzero generators: "
        f"`{summary['rows_with_unclassified_nonzero_generators']}`",
        "",
        "## Center Usage",
        "",
    ]
    center_usage = summary["center_usage_rows"]
    assert isinstance(center_usage, dict)
    for center, count in center_usage.items():
        lines.append(f"- `{center}`: {count} rows")
    lines.extend(
        [
            "",
            "## Per-Row Core",
            "",
            "| pid | kind | nonzero generators | centers | Rabinowitsch pairs |",
            "|---|---:|---:|---|---|",
        ]
    )
    rows = census["rows"]
    assert isinstance(rows, list)
    for row in rows:
        assert isinstance(row, dict)
        centers = ", ".join(f"`{center}`" for center in row["centers_used"])
        pairs = ", ".join(
            "`" + "=".join(str(part) for part in pair) + "`"
            for pair in row["rabinowitsch_pairs"]
        )
        lines.append(
            f"| `{row['pid']}` | `{row['kind']}` | {row['nonzero_count']}/{row['generator_count']} | "
            f"{centers or '-'} | {pairs or '-'} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_endpoint_core_census(
    paths: list[Path],
    out_path: Path,
    markdown_out: Path | None,
) -> None:
    census = endpoint_core_census(paths)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(census, indent=2, sort_keys=True) + "\n")
    if markdown_out is not None:
        write_endpoint_core_markdown(census, markdown_out)


def read_ms(path: Path) -> tuple[list[str], list[str]]:
    lines = path.read_text().strip().splitlines()
    if len(lines) < 3:
        raise ValueError(f"{path} is too short to be an .ms system")
    if lines[1].strip() != "0":
        raise ValueError(f"{path} has unsupported coefficient-field line {lines[1]!r}")
    raw = "\n".join(lines[2:]).strip()
    if raw.endswith(","):
        raw = raw[:-1].rstrip()
    polys = [normalize_poly(part.strip()) for part in raw.split(",\n") if part.strip()]
    return lines[0].split(","), polys


def load_jsonl(path: Path) -> list[dict[str, object]]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


def point_coord(point: str) -> tuple[str, str]:
    if point == "v":
        return "0", "0"
    if point == "w":
        return "1", "0"
    prefix = point.lower()
    return f"{prefix}x", f"{prefix}y"


def dist2_expr(a: str, b: str) -> str:
    ax, ay = point_coord(a)
    bx, by = point_coord(b)
    return f"(({ax})-({bx}))^2+(({ay})-({by}))^2"


def rabinowitsch_generator(pair: str) -> str:
    a, b = pair.split("=")
    return f"t*({dist2_expr(a, b)})-1"


def singular_script(variables: list[str], generators: list[str]) -> str:
    body = ",\n".join(generators)
    return f"""ring r = 0, ({",".join(variables)}), dp;
ideal I = {body};
ideal G = std(I);
print("BEGIN_G1");
string(G[1]);
print("END_G1");
matrix M = lift(I,G);
print("BEGIN_NROWS");
string(nrows(M));
print("END_NROWS");
print("BEGIN_COEFFICIENTS");
for (int i=1; i<=nrows(M); i++) {{
  print("BEGIN_COEFF");
  string(M[i,1]);
  print("END_COEFF");
}}
print("END_COEFFICIENTS");
poly check = 0;
for (int i=1; i<=nrows(M); i++) {{
  check = check + M[i,1]*I[i];
}}
print("BEGIN_CHECK");
string(check);
print("END_CHECK");
exit;
"""


def extract_block(lines: list[str], begin: str, end: str) -> list[str]:
    try:
        start = lines.index(begin) + 1
        stop = lines.index(end, start)
    except ValueError as exc:
        raise ValueError(f"missing Singular marker {begin}/{end}") from exc
    return lines[start:stop]


def extract_repeated_blocks(lines: list[str], begin: str, end: str) -> list[str]:
    out: list[str] = []
    pos = 0
    while True:
        try:
            start = lines.index(begin, pos) + 1
        except ValueError:
            return out
        try:
            stop = lines.index(end, start)
        except ValueError as exc:
            raise ValueError(f"missing Singular marker {end}") from exc
        out.append(normalize_poly("".join(lines[start:stop]).strip()))
        pos = stop + 1


def run_singular(variables: list[str], generators: list[str], timeout_s: int) -> list[str]:
    fd, script_path = tempfile.mkstemp(prefix="endpoint_cert_", suffix=".sing")
    os.close(fd)
    path = Path(script_path)
    try:
        path.write_text(singular_script(variables, generators))
        proc = subprocess.run(
            ["Singular", "-q", str(path)],
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    finally:
        path.unlink(missing_ok=True)
    if proc.returncode != 0:
        raise RuntimeError(
            f"Singular failed with exit code {proc.returncode}\n"
            f"stdout:\n{proc.stdout}\nstderr:\n{proc.stderr}"
        )
    return [line.strip() for line in proc.stdout.splitlines() if line.strip()]


def singular_witness(
    variables: list[str], generators: list[str], timeout_s: int
) -> tuple[list[str], str]:
    lines = run_singular(variables, generators, timeout_s)
    g1 = "".join(extract_block(lines, "BEGIN_G1", "END_G1")).strip()
    if g1 != "1":
        raise ValueError(f"Singular standard basis did not start with 1; G[1]={g1!r}")
    nrows_text = "".join(extract_block(lines, "BEGIN_NROWS", "END_NROWS")).strip()
    nrows = int(nrows_text)
    coeffs = extract_repeated_blocks(lines, "BEGIN_COEFF", "END_COEFF")
    if len(coeffs) != nrows:
        raise ValueError(f"expected {nrows} coefficients, got {len(coeffs)}")
    check = "".join(extract_block(lines, "BEGIN_CHECK", "END_CHECK")).strip()
    if check != "1":
        raise ValueError(f"Singular lifted-column check was {check!r}, not '1'")
    return coeffs, check


def default_fragment_dir() -> Path:
    repo = Path(__file__).resolve().parents[1]
    return (
        repo.parent
        / "p97-rvol"
        / "scratch"
        / "u2b_oppcap2_endpoint"
        / "fragment"
    )


def certificate_inputs(
    fragment_dir: Path, pid: str, requested_pair: str | None
) -> tuple[str, str | None, list[str], list[str], dict[str, object]]:
    comp_dir = fragment_dir / "comp_g_ep"
    verify_rows = {row["pid"]: row for row in load_jsonl(comp_dir / "singular_verify_ep_results.jsonl")}
    pair_rows = {row["pid"]: row for row in load_jsonl(comp_dir / "singular_pairscan_ep_results.jsonl")}
    if pid not in verify_rows:
        raise KeyError(f"unknown endpoint pid {pid!r}")

    row = verify_rows[pid]
    variables, generators = read_ms(comp_dir / "inputs" / f"{pid}.ms")
    kind: str
    pair: str | None
    if row.get("base_dim") == -1:
        kind = "base_empty"
        pair = None
    else:
        if row.get("singular_verdict") != "NO_VALID_REAL":
            raise ValueError(f"{pid} is not a certified impossible endpoint pattern: {row}")
        forced = pair_rows.get(pid, {}).get("forced_pairs", [])
        if not isinstance(forced, list) or not forced:
            raise ValueError(f"{pid} has no single-pair forced-collapse row")
        if requested_pair is not None:
            if requested_pair not in forced:
                raise ValueError(f"{pid} does not force requested pair {requested_pair!r}")
            pair = requested_pair
        elif DEFAULT_PAIR in forced:
            pair = DEFAULT_PAIR
        else:
            pair = str(forced[0])
        kind = "forced_collapse"
        variables = variables + ["t"]
        generators = generators + [rabinowitsch_generator(pair)]

    return kind, pair, variables, generators, row


def build_certificate(
    fragment_dir: Path,
    pid: str,
    requested_pair: str | None,
    timeout_s: int,
    python_check: bool,
) -> dict[str, object]:
    kind, pair, variables, generators, verdict_row = certificate_inputs(
        fragment_dir, pid, requested_pair
    )
    coefficients, singular_check = singular_witness(variables, generators, timeout_s)
    if python_check:
        check_identity(variables, generators, coefficients)
    return {
        "schema": SCHEMA,
        "pid": pid,
        "kind": kind,
        "pair": pair,
        "variables": variables,
        "generators": generators,
        "coefficients": coefficients,
        "identity": "sum_i coefficients[i] * generators[i] = 1",
        "checks": {
            "singular_lifted_column": singular_check == "1",
            "python_exact_polynomial": python_check,
        },
        "source": {
            "fragment_dir": str(fragment_dir),
            "base_system": str(fragment_dir / "comp_g_ep" / "inputs" / f"{pid}.ms"),
            "singular_verdict": verdict_row,
        },
    }


def endpoint_pids(fragment_dir: Path) -> list[str]:
    rows = load_jsonl(fragment_dir / "comp_g_ep" / "singular_verify_ep_results.jsonl")
    return [str(row["pid"]) for row in rows]


def write_certificate(cert: dict[str, object], out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(cert, indent=2, sort_keys=True) + "\n")


def lean_rat(value: Fraction) -> str:
    if value.denominator == 1:
        return f"({value.numerator} : Rat)"
    return f"(({value.numerator} : Rat) / {value.denominator})"


def lean_list(items: list[str]) -> str:
    if not items:
        return "[]"
    return "[\n" + ",\n".join(f"  {item}" for item in items) + "\n]"


def lean_monom(monom: Monomial) -> str:
    pairs = [f"({idx}, {exp})" for idx, exp in enumerate(monom) if exp]
    return "[" + ", ".join(pairs) + "]"


def lean_monom_key(monom: Monomial) -> tuple[tuple[int, int], ...]:
    return tuple((idx, exp) for idx, exp in enumerate(monom) if exp)


def lean_term(coeff: Fraction, monom: Monomial) -> str:
    return f"term {lean_rat(coeff)} {lean_monom(monom)}"


def lean_poly(poly: Poly) -> str:
    terms = [
        lean_term(coeff, monom)
        for monom, coeff in sorted(poly.items(), key=lambda item: lean_monom_key(item[0]))
        if coeff
    ]
    return lean_list(terms)


def lean_poly_list(poly_exprs: list[str], variables: list[str]) -> str:
    return lean_list([lean_poly(parse_poly(expr, variables)) for expr in poly_exprs])


def emit_lean_certificate(
    cert_path: Path,
    out_path: Path,
    name: str | None,
    namespace_suffix: str | None = None,
) -> None:
    check_certificate_file(cert_path)
    cert = json.loads(cert_path.read_text())
    pid = str(cert["pid"])
    lean_name = name or pid
    variables = cert["variables"]
    generators = cert["generators"]
    coefficients = cert["coefficients"]
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert_path}: invalid variables")
    if not isinstance(generators, list) or not all(isinstance(x, str) for x in generators):
        raise ValueError(f"{cert_path}: invalid generators")
    if not isinstance(coefficients, list) or not all(isinstance(x, str) for x in coefficients):
        raise ValueError(f"{cert_path}: invalid coefficients")

    source = cert_path.as_posix()
    namespace_open = ""
    namespace_close = ""
    namespace_note = ""
    if namespace_suffix:
        namespace_open = f"\nnamespace {namespace_suffix}\n"
        namespace_close = f"\nend {namespace_suffix}\n"
        namespace_note = f"\nThis generated module lives in the `{namespace_suffix}` namespace.\n"
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Endpoint certificate {pid}

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Source certificate: `{source}`.
{namespace_note}
-/

namespace Problem97

namespace EndpointCertificate
{namespace_open}

/-- Generator polynomials for endpoint certificate `{pid}`. -/
def {lean_name}_generators : List Poly :=
{lean_poly_list(generators, variables)}

/-- Coefficient polynomials for endpoint certificate `{pid}`. -/
def {lean_name}_coefficients : List Poly :=
{lean_poly_list(coefficients, variables)}

/-- Endpoint certificate `{pid}` as sparse rational polynomial data. -/
def {lean_name} : Certificate :=
  {{ generators := {lean_name}_generators
    coefficients := {lean_name}_coefficients }}

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `{pid}`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem {lean_name}_valid : checkCertificate {lean_name} = true := by
  native_decide
{namespace_close}

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def lean_module_stem(pid: str) -> str:
    parts = pid.split("_")
    if len(parts) != 3 or parts[0] != "ep":
        raise ValueError(f"unsupported endpoint pid {pid!r}")
    return f"Ep{parts[1]}{parts[2]}"


def endpoint_row_expr(pid: str) -> str:
    parts = pid.split("_")
    if len(parts) != 3 or parts[0] != "ep":
        raise ValueError(f"unsupported endpoint pid {pid!r}")
    family = parts[1]
    index = int(parts[2])
    if family not in {"Q1", "Q2"}:
        raise ValueError(f"unsupported endpoint row family {family!r}")
    return f"ShadowBank.endpointRows{family}.get (Fin.mk {index} (by decide))"


def lean_label(point: str) -> str:
    if point not in POINTS:
        raise ValueError(f"unknown endpoint point {point!r}")
    return f".{point}"


def point_is_variable(point: str) -> bool:
    return point not in FIXED_ENDPOINT_POINTS


def endpoint_var(point: str, axis: str) -> str:
    if not point_is_variable(point):
        raise ValueError(f"{point!r} is a fixed endpoint point, not a variable")
    if axis not in {"x", "y"}:
        raise ValueError(f"unsupported axis {axis!r}")
    prefix = point.lower()
    return f"EndpointVar.{prefix}{axis}"


def endpoint_var_index(point: str, axis: str) -> str:
    return f"{endpoint_var(point, axis)}.index"


def endpoint_coord_simp() -> str:
    return "(by simp [endpointS1S3Assignment, EndpointVar.eval])"


def endpoint_normalization_zero(shape: str, proof: str) -> str:
    return f"""exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointS1S3Assignment pointOf) (q := {shape})
      (by native_decide)
      (by
        exact {proof})"""


def endpoint_generator_zero_proof(classification: dict[str, object]) -> str:
    kind = classification.get("kind")
    if kind == "rabinowitsch_distinct":
        pair = classification.get("pair")
        if pair != ["s1", "s3"]:
            raise ValueError(f"unsupported endpoint Rabinowitsch pair {pair!r}")
        shape = (
            "rabinowitschSqDistPoly EndpointVar.tau.index "
            "EndpointVar.s1x.index EndpointVar.s1y.index "
            "EndpointVar.s3x.index EndpointVar.s3y.index"
        )
        proof = (
            "evalPoly_endpointS1S3_rabinowitschSqDistPoly_eq_zero_of_metricShadow "
            "hmetric"
        )
        return endpoint_normalization_zero(shape, proof)

    if kind != "distance_eq":
        raise ValueError(f"unsupported endpoint generator classification {classification!r}")

    center = str(classification["center"])
    left, right = [str(point) for point in classification["witnesses"]]
    if classification.get("sign") == -1:
        left, right = right, left

    coord = endpoint_coord_simp()
    if center == "v":
        if point_is_variable(left) and point_is_variable(right):
            shape = (
                f"sqNormDiffPoly {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')} {endpoint_var_index(right, 'x')} "
                f"{endpoint_var_index(right, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqNormDiffPoly_eq_zero_of_metricShadow
          (a := {lean_label(left)}) (b := {lean_label(right)})
          (ax := {endpoint_var(left, 'x')}) (ay := {endpoint_var(left, 'y')})
          (bx := {endpoint_var(right, 'x')}) (b_y := {endpoint_var(right, 'y')})
          hmetric
          {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if point_is_variable(left) and right == "w":
            shape = (
                f"sqNormMinusOnePoly {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqNormMinusOnePoly_eq_zero_of_metricShadow
          (a := {lean_label(left)})
          (ax := {endpoint_var(left, 'x')}) (ay := {endpoint_var(left, 'y')})
          hmetric
          {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if left == "w" and point_is_variable(right):
            shape = (
                f"oneMinusSqNormPoly {endpoint_var_index(right, 'x')} "
                f"{endpoint_var_index(right, 'y')}"
            )
            proof = f"""evalPoly_endpoint_oneMinusSqNormPoly_eq_zero_of_metricShadow
          (a := {lean_label(right)})
          (ax := {endpoint_var(right, 'x')}) (ay := {endpoint_var(right, 'y')})
          hmetric
          {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)

    if center == "w":
        if point_is_variable(left) and point_is_variable(right):
            shape = (
                f"sqDistToUnitXDiffPoly {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')} {endpoint_var_index(right, 'x')} "
                f"{endpoint_var_index(right, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqDistToUnitXDiffPoly_eq_zero_of_metricShadow
          (a := {lean_label(left)}) (b := {lean_label(right)})
          (ax := {endpoint_var(left, 'x')}) (ay := {endpoint_var(left, 'y')})
          (bx := {endpoint_var(right, 'x')}) (b_y := {endpoint_var(right, 'y')})
          hmetric
          {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if point_is_variable(left) and right == "v":
            shape = (
                f"sqDistToUnitXMinusOnePoly {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqDistToUnitXMinusOnePoly_eq_zero_of_metricShadow
          (a := {lean_label(left)})
          (ax := {endpoint_var(left, 'x')}) (ay := {endpoint_var(left, 'y')})
          hmetric
          {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)

    if point_is_variable(center):
        if point_is_variable(left) and point_is_variable(right):
            shape = (
                f"sqDistToCenterDiffPoly {endpoint_var_index(center, 'x')} "
                f"{endpoint_var_index(center, 'y')} {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')} {endpoint_var_index(right, 'x')} "
                f"{endpoint_var_index(right, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqDistToCenterDiffPoly_eq_zero_of_metricShadow
          (center := {lean_label(center)}) (a := {lean_label(left)})
          (b := {lean_label(right)})
          (cx := {endpoint_var(center, 'x')}) (cy := {endpoint_var(center, 'y')})
          (ax := {endpoint_var(left, 'x')}) (ay := {endpoint_var(left, 'y')})
          (bx := {endpoint_var(right, 'x')}) (b_y := {endpoint_var(right, 'y')})
          hmetric
          {coord} {coord} {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if left == "v" and point_is_variable(right):
            shape = (
                f"sqNormFirstMinusSqDistPoly {endpoint_var_index(center, 'x')} "
                f"{endpoint_var_index(center, 'y')} {endpoint_var_index(right, 'x')} "
                f"{endpoint_var_index(right, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqNormFirstMinusSqDistPoly_eq_zero_of_metricShadow
          (a := {lean_label(center)}) (b := {lean_label(right)})
          (ax := {endpoint_var(center, 'x')}) (ay := {endpoint_var(center, 'y')})
          (bx := {endpoint_var(right, 'x')}) (b_y := {endpoint_var(right, 'y')})
          hmetric
          {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if point_is_variable(left) and right == "v":
            shape = (
                f"sqDistMinusSqNormFirstPoly {endpoint_var_index(center, 'x')} "
                f"{endpoint_var_index(center, 'y')} {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqDistMinusSqNormFirstPoly_eq_zero_of_metricShadow
          (a := {lean_label(center)}) (b := {lean_label(left)})
          (ax := {endpoint_var(center, 'x')}) (ay := {endpoint_var(center, 'y')})
          (bx := {endpoint_var(left, 'x')}) (b_y := {endpoint_var(left, 'y')})
          hmetric
          {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if left == "w" and point_is_variable(right):
            shape = (
                f"sqDistUnitXToPointMinusCenterDistPoly {endpoint_var_index(right, 'x')} "
                f"{endpoint_var_index(right, 'y')} {endpoint_var_index(center, 'x')} "
                f"{endpoint_var_index(center, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_metricShadow
          (center := {lean_label(right)}) (a := {lean_label(center)})
          (cx := {endpoint_var(right, 'x')}) (cy := {endpoint_var(right, 'y')})
          (ax := {endpoint_var(center, 'x')}) (ay := {endpoint_var(center, 'y')})
          hmetric
          {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if point_is_variable(left) and right == "w":
            shape = (
                f"sqDistPointToUnitXDiffPoly {endpoint_var_index(left, 'x')} "
                f"{endpoint_var_index(left, 'y')} {endpoint_var_index(center, 'x')} "
                f"{endpoint_var_index(center, 'y')}"
            )
            proof = f"""evalPoly_endpoint_sqDistPointToUnitXDiffPoly_eq_zero_of_metricShadow
          (center := {lean_label(left)}) (a := {lean_label(center)})
          (cx := {endpoint_var(left, 'x')}) (cy := {endpoint_var(left, 'y')})
          (ax := {endpoint_var(center, 'x')}) (ay := {endpoint_var(center, 'y')})
          hmetric
          {coord} {coord} {coord} {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)
        if left == "v" and right == "w":
            shape = f"twiceVarMinusOnePoly {endpoint_var_index(center, 'x')}"
            proof = f"""evalPoly_endpoint_twiceVarMinusOnePoly_eq_zero_of_metricShadow
          (a := {lean_label(center)}) (ax := {endpoint_var(center, 'x')})
          hmetric
          {coord}
          (by decide) (by decide)"""
            return endpoint_normalization_zero(shape, proof)

    raise ValueError(
        "unsupported endpoint generator shape "
        f"center={center!r}, left={left!r}, right={right!r}, "
        f"classification={classification!r}"
    )


PRODUCT_SUM_ENDPOINT_IDS = {
    "ep_Q1_008",
    "ep_Q1_009",
    "ep_Q1_028",
    "ep_Q2_002",
    "ep_Q2_008",
    "ep_Q2_019",
    "ep_Q2_020",
    "ep_Q2_024",
    "ep_Q2_041",
    "ep_Q2_054",
    "ep_Q2_064",
    "ep_Q2_074",
}


def emit_direct_row_zero_module(cert_path: Path, out_path: Path) -> str | None:
    check_certificate_file(cert_path)
    cert = json.loads(cert_path.read_text())
    pid = str(cert["pid"])
    if pid in PRODUCT_SUM_ENDPOINT_IDS:
        return None

    variables = cert["variables"]
    generators = cert["generators"]
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert_path}: invalid variables")
    if not isinstance(generators, list) or not all(isinstance(x, str) for x in generators):
        raise ValueError(f"{cert_path}: invalid generators")

    stem = lean_module_stem(pid)
    row_name = f"{pid}_row"
    row_expr = endpoint_row_expr(pid)
    classifications = [
        classify_generator(str(generator), [str(variable) for variable in variables])
        for generator in generators
    ]
    proofs = [endpoint_generator_zero_proof(classification) for classification in classifications]
    cases = "\n".join("  \u00b7 " + proof.replace("\n", "\n    ") for proof in proofs)
    rcases_pattern = " | ".join("rfl" for _ in generators)
    source = cert_path.as_posix()
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.{stem}

/-!
# Endpoint row-zero certificate {pid}

This generated module proves that the direct certificate payload for endpoint
row `{pid}` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Finite endpoint row paired with direct certificate `{pid}`. -/
private def {row_name} : ShadowBank.EndpointRow :=
  {row_expr}

set_option linter.style.nativeDecide false in
/-- Every generator in direct endpoint certificate `{pid}` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem {pid}_evaluationZeros_of_metricShadow
    {{pointOf : ShadowBank.Label \u2192 \u211d\u00b2}}
    (hmetric : EndpointMetricShadow pointOf {row_name}.toShadow) :
    Patterns.CertificatePayload.evaluationZeros (.direct Patterns.{pid})
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros, Patterns.{pid}]
  intro g hg
  simp only [Patterns.{pid}_generators, List.mem_cons, List.not_mem_nil,
    or_false] at hg
  rcases hg with {rcases_pattern}
{cases}

end Variables

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return out_path.stem


def emit_direct_row_zero_aggregate(
    stems: list[str],
    out_path: Path,
    module_root: str,
) -> None:
    imports = "\n".join(f"import {module_root}.{stem}" for stem in stems)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Direct endpoint row-zero aggregate

This generated module imports the direct endpoint row-zero facts.  Product-sum
rows are handled separately because their payload zero condition is over checked
block sums rather than the original generator list.
-/

namespace Problem97

namespace EndpointCertificate

namespace Variables

end Variables

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_direct_row_zero_dir(
    cert_paths: list[Path],
    out_dir: Path,
    aggregate_out: Path | None,
    module_root: str,
) -> None:
    paths = certificate_files(cert_paths)
    if not paths:
        raise ValueError("no certificate JSON files for direct row-zero emission")
    stems: list[str] = []
    for cert_path in paths:
        cert = json.loads(cert_path.read_text())
        pid = str(cert["pid"])
        stem = emit_direct_row_zero_module(cert_path, out_dir / f"{lean_module_stem(pid)}.lean")
        if stem is not None:
            stems.append(stem)
    if aggregate_out is not None:
        emit_direct_row_zero_aggregate(stems, aggregate_out, module_root)


def product_block_zero_theorem_name(pid: str, gen_index: int, start: int, stop: int) -> str:
    return f"{pid}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}_eval_zero"


def product_block_zero_module(
    cert_path: Path,
    pid: str,
    variables: list[str],
    gen_index: int,
    start: int,
    stop: int,
    generator_expr: str,
    out_path: Path,
) -> str:
    stem = lean_module_stem(pid)
    block_stem = block_module_stem(pid, gen_index, start, stop)
    shard_namespace = f"Patterns.{stem}TermShards"
    theorem_name = product_block_zero_theorem_name(pid, gen_index, start, stop)
    row_expr = endpoint_row_expr(pid)
    classification = classify_generator(generator_expr, variables)
    generator_zero = endpoint_generator_zero_proof(classification)
    partial_cases = []
    for term_index in range(start, stop):
        partial_cases.append(
            "  \u00b7 exact evalPoly_eq_zero_of_mulPoly_eq_right_zero\n"
            "      (endpointS1S3Assignment pointOf)\n"
            f"      {shard_namespace}.{pid}_partial_{gen_index:02d}_{term_index:04d}_valid\n"
            "      hgenerator"
        )
    partial_cases_text = "\n".join(partial_cases)
    rcases_pattern = " | ".join("rfl" for _ in range(start, stop))
    source = cert_path.as_posix()
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.{stem}TermShards.{block_stem}

/-!
# Endpoint product-row block zero {pid}, block {gen_index}:{start}-{stop - 1}

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `{pid}`.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace {stem}BlockZeros

/-- Checked block `{gen_index}:{start}-{stop - 1}` in product-sum row `{pid}`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem {theorem_name}
    {{pointOf : ShadowBank.Label \u2192 \u211d\u00b2}}
    (hmetric : EndpointMetricShadow pointOf ({row_expr}).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      {shard_namespace}.{pid}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d} = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        {shard_namespace}.{pid}_generator_{gen_index:02d}_{start:04d}_{stop - 1:04d} = 0 := by
    {generator_zero.replace("\n", "\n    ")}
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    {shard_namespace}.{pid}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}_valid ?_
  intro p hp
  simp only [{shard_namespace}.{pid}_partials_{gen_index:02d}_{start:04d}_{stop - 1:04d},
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with {rcases_pattern}
{partial_cases_text}

end {stem}BlockZeros

end Variables

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return out_path.stem


def emit_product_row_zero_module(
    cert_path: Path,
    coordinator_out: Path,
    block_out_dir: Path,
    module_root: str,
) -> str | None:
    check_certificate_file(cert_path)
    cert = json.loads(cert_path.read_text())
    pid = str(cert["pid"])
    if pid not in PRODUCT_SUM_ENDPOINT_IDS:
        return None

    variables = cert["variables"]
    generator_exprs = cert["generators"]
    coefficient_exprs = cert["coefficients"]
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert_path}: invalid variables")
    if not isinstance(generator_exprs, list) or not all(isinstance(x, str) for x in generator_exprs):
        raise ValueError(f"{cert_path}: invalid generators")
    if not isinstance(coefficient_exprs, list) or not all(isinstance(x, str) for x in coefficient_exprs):
        raise ValueError(f"{cert_path}: invalid coefficients")

    variables_str = [str(variable) for variable in variables]
    stem = lean_module_stem(pid)
    shard_namespace = f"Patterns.{stem}TermShards"
    block_refs: list[tuple[int, int, int, str]] = []
    imports: list[str] = []
    for gen_index, (generator_expr, coefficient_expr) in enumerate(
        zip(generator_exprs, coefficient_exprs, strict=True)
    ):
        coeff_poly = parse_poly(str(coefficient_expr), variables_str)
        terms = sorted_poly_terms(coeff_poly)
        for start in range(0, len(terms), 100):
            stop = min(start + 100, len(terms))
            block_stem = product_block_zero_module(
                cert_path,
                pid,
                variables_str,
                gen_index,
                start,
                stop,
                str(generator_expr),
                block_out_dir / f"{block_module_stem(pid, gen_index, start, stop)}.lean",
            )
            imports.append(f"import {module_root}.{stem}BlockZeros.{block_stem}")
            block_refs.append((gen_index, start, stop, block_stem))

    row_expr = endpoint_row_expr(pid)
    block_list_entries = []
    block_cases = []
    for gen_index, start, stop, _block_stem in block_refs:
        block_list_entries.append(
            f"      {shard_namespace}.{pid}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}"
        )
        block_cases.extend(
            [
                "  rcases List.mem_cons.mp hp with rfl | hp",
                f"  \u00b7 exact {stem}BlockZeros."
                f"{product_block_zero_theorem_name(pid, gen_index, start, stop)} hmetric",
            ]
        )
    block_list_text = ",\n".join(block_list_entries)
    block_cases.append("  cases hp")
    block_cases_text = "\n".join(block_cases)
    source = cert_path.as_posix()
    import_text = "\n".join(imports)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.{stem}
{import_text}

/-!
# Endpoint product row-zero certificate {pid}

This generated module proves that every checked block in product-sum endpoint
row `{pid}` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `{pid}` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem {pid}_evaluationZeros_of_metricShadow
    {{pointOf : ShadowBank.Label \u2192 \u211d\u00b2}}
    (hmetric : EndpointMetricShadow pointOf ({row_expr}).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.{pid}_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p \u2208
    [
{block_list_text}
    ] at hp
{block_cases_text}

end Variables

end EndpointCertificate

end Problem97
"""
    coordinator_out.parent.mkdir(parents=True, exist_ok=True)
    coordinator_out.write_text(module)
    return coordinator_out.stem


def emit_product_row_zero_aggregate(
    stems: list[str],
    out_path: Path,
    module_root: str,
) -> None:
    imports = "\n".join(f"import {module_root}.{stem}" for stem in stems)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Product-sum endpoint row-zero aggregate

This generated module imports the product-sum endpoint row-zero facts.
-/

namespace Problem97

namespace EndpointCertificate

namespace Variables

end Variables

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_product_row_zero_dir(
    cert_paths: list[Path],
    out_dir: Path,
    aggregate_out: Path | None,
    module_root: str,
) -> None:
    paths = certificate_files(cert_paths)
    if not paths:
        raise ValueError("no certificate JSON files for product row-zero emission")
    stems: list[str] = []
    for cert_path in paths:
        cert = json.loads(cert_path.read_text())
        pid = str(cert["pid"])
        stem = lean_module_stem(pid)
        row_stem = emit_product_row_zero_module(
            cert_path,
            out_dir / f"{stem}.lean",
            out_dir / f"{stem}BlockZeros",
            module_root,
        )
        if row_stem is not None:
            stems.append(row_stem)
    if aggregate_out is not None:
        emit_product_row_zero_aggregate(stems, aggregate_out, module_root)


def bank_payload(pid: str) -> str:
    if pid in PRODUCT_SUM_ENDPOINT_IDS:
        return f".productSum Patterns.{pid}_blocks"
    return f".direct Patterns.{pid}"


def emit_bank_row_zero_module(cert_paths: list[Path], out_path: Path) -> None:
    paths = certificate_files(cert_paths)
    if not paths:
        raise ValueError("no certificate JSON files for bank row-zero emission")

    row_entries: list[str] = []
    row_cases: list[str] = []
    for cert_path in paths:
        cert = json.loads(cert_path.read_text())
        pid = str(cert["pid"])
        row_entries.append(
            f"      ({endpoint_row_expr(pid)}, "
            f"{{ id := {json.dumps(pid)}, payload := {bank_payload(pid)}, "
            f"valid := Patterns.{pid}_valid }})"
        )
        row_cases.extend(
            [
                "  rcases List.mem_cons.mp hrowCert with rfl | hrowCert",
                f"  \u00b7 exact {pid}_evaluationZeros_of_metricShadow",
                "      (metricShadow_of_row_masks_eq hmetric hmasks)",
            ]
        )
    row_list_text = ",\n".join(row_entries)
    row_cases.append("  cases hrowCert")
    row_cases_text = "\n".join(row_cases)

    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.BankSoundness
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Direct.All
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.All

/-!
# Endpoint bank row-zero dispatch

This generated module dispatches a matched finite endpoint-bank row to the
corresponding generated direct or product-sum row-zero theorem.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- A metric interpretation transports across equality of finite shadow masks. -/
theorem metricShadow_of_row_masks_eq
    {{pointOf : ShadowBank.Label \u2192 \u211d\u00b2}}
    {{row : ShadowBank.EndpointRow}} {{shadow : ShadowBank.Shadow}}
    (hmetric : EndpointMetricShadow pointOf shadow)
    (hmasks : row.masks = shadow.masks) :
    EndpointMetricShadow pointOf row.toShadow := by
  cases row with
  | mk id escapee masks =>
      cases shadow with
      | mk shadowMasks =>
          dsimp [ShadowBank.EndpointRow.toShadow] at hmasks \u22a2
          subst shadowMasks
          exact hmetric

/-- A certified endpoint-bank row carries the zero-evaluation condition for its
matched algebraic certificate payload. -/
theorem payload_zeros_of_certifiedEndpointRow
    {{pointOf : ShadowBank.Label \u2192 \u211d\u00b2}}
    {{shadow : ShadowBank.Shadow}}
    (hmetric : EndpointMetricShadow pointOf shadow)
    (rowCert : Bank.Row \u00d7 Bank.Certificate)
    (hrowCert : rowCert \u2208 Bank.certifiedEndpointRows)
    (hmasks : rowCert.1.masks = shadow.masks) :
    rowCert.2.payload.evaluationZeros (endpointS1S3Assignment pointOf) := by
  change rowCert \u2208
    [
{row_list_text}
    ] at hrowCert
{row_cases_text}

/-- Endpoint row-bank membership contradicts a metric interpretation of the
matched finite shadow. -/
theorem false_of_endpointShadowInBank_of_metricShadow
    {{pointOf : ShadowBank.Label \u2192 \u211d\u00b2}}
    {{escapee : ShadowBank.Label}} {{shadow : ShadowBank.Shadow}}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true)
    (hmetric : EndpointMetricShadow pointOf shadow) :
    False := by
  exact Bank.false_of_endpointShadowInBank_of_payload_zeros
    (endpointS1S3Assignment pointOf) hin
    (fun rowCert hrowCert _hescapee hmasks =>
      payload_zeros_of_certifiedEndpointRow hmetric rowCert hrowCert hmasks)

end Variables

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def aggregate_payload(pid: str) -> str:
    if pid in PRODUCT_SUM_ENDPOINT_IDS:
        return f".productSum {pid}_blocks"
    return f".direct {pid}"


def emit_lean_aggregate(
    cert_paths: list[Path],
    out_path: Path,
    module_root: str,
    namespace_suffix: str,
) -> None:
    rows: list[tuple[str, str]] = []
    for cert_path in cert_paths:
        cert = json.loads(cert_path.read_text())
        pid = str(cert["pid"])
        rows.append((pid, lean_module_stem(pid)))

    imports = "\n".join(f"import {module_root}.{stem}" for _, stem in rows)
    entries = ",\n".join(
        "  { id := "
        + json.dumps(pid)
        + f", payload := {aggregate_payload(pid)}, valid := {pid}_valid }}"
        for pid, _ in rows
    )
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Endpoint certificate aggregate

This module imports the generated one-module-per-pattern endpoint certificates
and records their checked facts in a single list.  The proof work is in the
individual pattern modules; importing this module checks all 117 certificates.
-/

namespace Problem97

namespace EndpointCertificate

namespace {namespace_suffix}

/-- Algebraic payload carried by a generated endpoint certificate row. -/
inductive CertificatePayload where
  | direct (cert : Certificate)
  | productSum (products : List Poly)

/-- Run the Boolean checker associated with a certificate payload. -/
def CertificatePayload.check : CertificatePayload → Bool
  | .direct cert => checkCertificate cert
  | .productSum products => checkProductSum products

/-- One checked endpoint certificate fact. -/
structure VerifiedCertificate where
  id : String
  payload : CertificatePayload
  valid : payload.check = true

/-- Run the Boolean checker associated with a verified certificate. -/
def VerifiedCertificate.check (cert : VerifiedCertificate) : Bool :=
  cert.payload.check

/-- The full checked endpoint certificate set. -/
def allEndpointCertificates : List VerifiedCertificate :=
[
{entries}
]

set_option linter.style.nativeDecide false in
/-- The generated endpoint certificate aggregate contains 117 rows. -/
theorem allEndpointCertificates_length : allEndpointCertificates.length = 117 := by
  native_decide

end {namespace_suffix}

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_lean_certificate_dir(
    cert_dir: Path,
    lean_out_dir: Path,
    aggregate_out: Path | None,
    module_root: str,
    namespace_suffix: str,
) -> None:
    cert_paths = certificate_files([cert_dir])
    if not cert_paths:
        raise ValueError(f"{cert_dir} has no certificate JSON files")
    for cert_path in cert_paths:
        check_certificate_file(cert_path)
        cert = json.loads(cert_path.read_text())
        pid = str(cert["pid"])
        emit_lean_certificate(
            cert_path,
            lean_out_dir / f"{lean_module_stem(pid)}.lean",
            pid,
            namespace_suffix=namespace_suffix,
        )
    if aggregate_out is not None:
        emit_lean_aggregate(cert_paths, aggregate_out, module_root, namespace_suffix)


def product_module_stem(pid: str, start: int, stop: int) -> str:
    return f"{lean_module_stem(pid)}Product{start:02d}_{stop - 1:02d}"


def block_module_stem(pid: str, gen_index: int, start: int, stop: int) -> str:
    return f"{lean_module_stem(pid)}Block{gen_index:02d}_{start:04d}_{stop - 1:04d}"


def sorted_poly_terms(poly: Poly) -> list[tuple[Monomial, Fraction]]:
    return [
        (monom, coeff)
        for monom, coeff in sorted(poly.items(), key=lambda item: lean_monom_key(item[0]))
        if coeff
    ]


def singleton_poly(monom: Monomial, coeff: Fraction) -> Poly:
    return {monom: coeff} if coeff else {}


def add_poly_many(polys: list[Poly]) -> Poly:
    out: Poly = {}
    for poly in polys:
        out = add_poly(out, poly)
    return out


def emit_sharded_product_module(
    pid: str,
    lean_name: str,
    shard_index: int,
    start: int,
    stop: int,
    variables: list[str],
    generators: list[Poly],
    coefficients: list[Poly],
    products: list[Poly],
    out_path: Path,
) -> str:
    defs: list[str] = []
    for idx in range(start, stop):
        defs.append(
            f"""/-- Generator polynomial {idx} for endpoint certificate `{pid}`. -/
def {lean_name}_generator_{idx:02d} : Poly :=
{lean_poly(generators[idx])}

/-- Coefficient polynomial {idx} for endpoint certificate `{pid}`. -/
def {lean_name}_coefficient_{idx:02d} : Poly :=
{lean_poly(coefficients[idx])}

/-- Product polynomial {idx} for endpoint certificate `{pid}`. -/
def {lean_name}_product_{idx:02d} : Poly :=
{lean_poly(products[idx])}

set_option linter.style.nativeDecide false in
/-- Checked product identity {idx} for endpoint certificate `{pid}`. -/
theorem {lean_name}_product_{idx:02d}_valid :
    mulPoly {lean_name}_coefficient_{idx:02d} {lean_name}_generator_{idx:02d} =
      {lean_name}_product_{idx:02d} := by
  native_decide"""
        )

    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate {pid}, product shard {shard_index}

This generated module checks products {start} through {stop - 1} for the
sharded endpoint certificate row `{pid}`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace {lean_module_stem(pid)}Shards

{"\n\n".join(defs)}

end {lean_module_stem(pid)}Shards

end Patterns

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return out_path.stem


def emit_sharded_lean_certificate(
    cert_path: Path,
    coordinator_out: Path,
    shard_out_dir: Path,
    module_root: str,
    shard_size: int,
) -> None:
    if shard_size <= 0:
        raise ValueError("--shard-size must be positive")
    check_certificate_file(cert_path)
    cert = json.loads(cert_path.read_text())
    pid = str(cert["pid"])
    lean_name = pid
    variables = cert["variables"]
    generator_exprs = cert["generators"]
    coefficient_exprs = cert["coefficients"]
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert_path}: invalid variables")
    if not isinstance(generator_exprs, list) or not all(isinstance(x, str) for x in generator_exprs):
        raise ValueError(f"{cert_path}: invalid generators")
    if not isinstance(coefficient_exprs, list) or not all(isinstance(x, str) for x in coefficient_exprs):
        raise ValueError(f"{cert_path}: invalid coefficients")
    if len(generator_exprs) != len(coefficient_exprs):
        raise ValueError(f"{cert_path}: generator/coefficient length mismatch")

    generators = [parse_poly(expr, variables) for expr in generator_exprs]
    coefficients = [parse_poly(expr, variables) for expr in coefficient_exprs]
    products = [mul_poly(c, g) for c, g in zip(coefficients, generators, strict=True)]

    stems: list[str] = []
    for shard_index, start in enumerate(range(0, len(products), shard_size)):
        stop = min(start + shard_size, len(products))
        stem = product_module_stem(pid, start, stop)
        stems.append(stem)
        emit_sharded_product_module(
            pid,
            lean_name,
            shard_index,
            start,
            stop,
            variables,
            generators,
            coefficients,
            products,
            shard_out_dir / f"{stem}.lean",
        )

    imports = "\n".join(
        f"import {module_root}.{lean_module_stem(pid)}Shards.{stem}" for stem in stems
    )
    product_entries = ",\n".join(
        f"  {lean_module_stem(pid)}Shards.{lean_name}_product_{idx:02d}"
        for idx in range(len(products))
    )
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

set_option linter.style.longLine false

/-!
# Endpoint certificate {pid}

This generated coordinator checks the final product sum for the internally
sharded endpoint certificate row `{pid}`.  The imported shard modules separately
check each product identity `coefficient_i * generator_i = product_i`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Product polynomials for the sharded endpoint certificate `{pid}`. -/
def {lean_name}_products : List Poly :=
[
{product_entries}
]

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `{pid}`. -/
theorem {lean_name}_valid : checkProductSum {lean_name}_products = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `{pid}`. -/
theorem {lean_name}_sum_valid : checkProductSum {lean_name}_products = true :=
  {lean_name}_valid

end Patterns

end EndpointCertificate

end Problem97
"""
    coordinator_out.parent.mkdir(parents=True, exist_ok=True)
    coordinator_out.write_text(module)


def emit_term_block_module(
    pid: str,
    lean_name: str,
    gen_index: int,
    start: int,
    stop: int,
    generator: Poly,
    terms: list[tuple[Monomial, Fraction]],
    partials: list[Poly],
    block_sum: Poly,
    out_path: Path,
) -> str:
    defs: list[str] = [
        f"""/-- Generator polynomial {gen_index} for endpoint certificate `{pid}`. -/
def {lean_name}_generator_{gen_index:02d}_{start:04d}_{stop - 1:04d} : Poly :=
{lean_poly(generator)}"""
    ]
    partial_names: list[str] = []
    for local_idx, term_index in enumerate(range(start, stop)):
        monom, coeff = terms[term_index]
        partial_names.append(f"{lean_name}_partial_{gen_index:02d}_{term_index:04d}")
        defs.append(
            f"""/-- Coefficient term {term_index} from coefficient polynomial {gen_index}. -/
def {lean_name}_coefficient_{gen_index:02d}_{term_index:04d} : Poly :=
{lean_poly(singleton_poly(monom, coeff))}

/-- Partial product {term_index} for generator {gen_index}. -/
def {lean_name}_partial_{gen_index:02d}_{term_index:04d} : Poly :=
{lean_poly(partials[local_idx])}

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity {term_index} for generator {gen_index}. -/
theorem {lean_name}_partial_{gen_index:02d}_{term_index:04d}_valid :
    mulPoly {lean_name}_coefficient_{gen_index:02d}_{term_index:04d}
        {lean_name}_generator_{gen_index:02d}_{start:04d}_{stop - 1:04d} =
      {lean_name}_partial_{gen_index:02d}_{term_index:04d} := by
  native_decide"""
        )

    partial_entries = ",\n".join(f"  {name}" for name in partial_names)
    defs.append(
        f"""/-- Partial products in this block. -/
def {lean_name}_partials_{gen_index:02d}_{start:04d}_{stop - 1:04d} : List Poly :=
[
{partial_entries}
]

/-- Sum of partial products in this block. -/
def {lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d} : Poly :=
{lean_poly(block_sum)}

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator {gen_index}, terms {start} through {stop - 1}. -/
theorem {lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}_valid :
    checkProductSumEq {lean_name}_partials_{gen_index:02d}_{start:04d}_{stop - 1:04d}
      {lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d} = true := by
  native_decide"""
    )

    body = "\n\n".join(defs)
    stem = lean_module_stem(pid)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate {pid}, term block {gen_index}:{start}-{stop - 1}

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `{pid}`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace {stem}TermShards

{body}

end {stem}TermShards

end Patterns

end EndpointCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return out_path.stem


def emit_term_sharded_lean_certificate(
    cert_path: Path,
    coordinator_out: Path,
    shard_out_dir: Path,
    module_root: str,
    block_size: int,
) -> None:
    if block_size <= 0:
        raise ValueError("--block-size must be positive")
    check_certificate_file(cert_path)
    cert = json.loads(cert_path.read_text())
    pid = str(cert["pid"])
    lean_name = pid
    variables = cert["variables"]
    generator_exprs = cert["generators"]
    coefficient_exprs = cert["coefficients"]
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert_path}: invalid variables")
    if not isinstance(generator_exprs, list) or not all(isinstance(x, str) for x in generator_exprs):
        raise ValueError(f"{cert_path}: invalid generators")
    if not isinstance(coefficient_exprs, list) or not all(isinstance(x, str) for x in coefficient_exprs):
        raise ValueError(f"{cert_path}: invalid coefficients")
    if len(generator_exprs) != len(coefficient_exprs):
        raise ValueError(f"{cert_path}: generator/coefficient length mismatch")

    generators = [parse_poly(expr, variables) for expr in generator_exprs]
    coefficients = [parse_poly(expr, variables) for expr in coefficient_exprs]
    stem = lean_module_stem(pid)
    block_refs: list[str] = []
    imports: list[str] = []
    for gen_index, (generator, coeff_poly) in enumerate(zip(generators, coefficients, strict=True)):
        terms = sorted_poly_terms(coeff_poly)
        for start in range(0, len(terms), block_size):
            stop = min(start + block_size, len(terms))
            partials = [
                mul_poly(singleton_poly(monom, coeff), generator)
                for monom, coeff in terms[start:stop]
            ]
            block_sum = add_poly_many(partials)
            module_stem = block_module_stem(pid, gen_index, start, stop)
            emit_term_block_module(
                pid,
                lean_name,
                gen_index,
                start,
                stop,
                generator,
                terms,
                partials,
                block_sum,
                shard_out_dir / f"{module_stem}.lean",
            )
            imports.append(f"import {module_root}.{stem}TermShards.{module_stem}")
            block_refs.append(
                f"{stem}TermShards.{lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}"
            )

    import_text = "\n".join(imports)
    block_entries = ",\n".join(f"  {ref}" for ref in block_refs)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{import_text}

set_option linter.style.longLine false

/-!
# Endpoint certificate {pid}

This generated coordinator checks the final block-sum identity for the
term-sharded endpoint certificate row `{pid}`.  The imported shard modules
separately check each coefficient-term partial product and each block sum.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Block sums for the term-sharded endpoint certificate `{pid}`. -/
def {lean_name}_blocks : List Poly :=
[
{block_entries}
]

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for endpoint certificate `{pid}`. -/
theorem {lean_name}_valid : checkProductSum {lean_name}_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for endpoint certificate `{pid}`. -/
theorem {lean_name}_sum_valid : checkProductSum {lean_name}_blocks = true :=
  {lean_name}_valid

end Patterns

end EndpointCertificate

end Problem97
"""
    coordinator_out.parent.mkdir(parents=True, exist_ok=True)
    coordinator_out.write_text(module)


def check_certificate_file(path: Path) -> None:
    cert = json.loads(path.read_text())
    if cert.get("schema") != SCHEMA:
        raise ValueError(f"{path}: unsupported schema {cert.get('schema')!r}")
    variables = cert.get("variables")
    generators = cert.get("generators")
    coefficients = cert.get("coefficients")
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{path}: invalid variables")
    if not isinstance(generators, list) or not all(isinstance(x, str) for x in generators):
        raise ValueError(f"{path}: invalid generators")
    if not isinstance(coefficients, list) or not all(isinstance(x, str) for x in coefficients):
        raise ValueError(f"{path}: invalid coefficients")
    check_identity(variables, generators, coefficients)


def certificate_files(paths: list[Path]) -> list[Path]:
    out: list[Path] = []
    for path in paths:
        if path.is_dir():
            out.extend(sorted(path.glob("*.json")))
        else:
            out.append(path)
    return out


def parse_args(argv: Iterable[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="append",
        type=Path,
        help="Check existing certificate JSON file or directory without calling Singular.",
    )
    parser.add_argument(
        "--emit-lean",
        type=Path,
        help="Emit one checked certificate JSON file as Lean data.",
    )
    parser.add_argument(
        "--emit-lean-dir",
        type=Path,
        help="Emit every checked certificate JSON file in a directory as Lean modules.",
    )
    parser.add_argument(
        "--emit-lean-sharded",
        type=Path,
        help="Emit one checked certificate JSON file as an internally sharded Lean row.",
    )
    parser.add_argument(
        "--emit-lean-term-sharded",
        type=Path,
        help="Emit one checked certificate JSON file as a term-block-sharded Lean row.",
    )
    parser.add_argument(
        "--emit-direct-row-zeros",
        action="append",
        type=Path,
        help=(
            "Emit semantic zero proofs for direct endpoint row certificates from "
            "certificate JSON file(s) or directory."
        ),
    )
    parser.add_argument(
        "--emit-product-row-zeros",
        action="append",
        type=Path,
        help=(
            "Emit semantic zero proofs for product-sum endpoint row certificates "
            "from certificate JSON file(s) or directory."
        ),
    )
    parser.add_argument(
        "--emit-bank-row-zeros",
        action="append",
        type=Path,
        help=(
            "Emit the finite endpoint-bank dispatch from row membership to "
            "direct/product row-zero payload facts."
        ),
    )
    parser.add_argument(
        "--emit-core-census",
        action="append",
        type=Path,
        help="Emit the nonzero-generator core census for certificate JSON file(s) or directory.",
    )
    parser.add_argument("--lean-out", type=Path, help="Output path for --emit-lean.")
    parser.add_argument("--lean-out-dir", type=Path, help="Output directory for --emit-lean-dir.")
    parser.add_argument(
        "--lean-shard-out-dir",
        type=Path,
        help="Shard output directory for --emit-lean-sharded.",
    )
    parser.add_argument(
        "--lean-aggregate-out",
        type=Path,
        help="Optional aggregate Lean file for --emit-lean-dir.",
    )
    parser.add_argument("--lean-name", help="Lean declaration basename for --emit-lean.")
    parser.add_argument(
        "--lean-module-root",
        default="Erdos9796Proof.P97.EndpointCertificate.Patterns",
        help="Module root used in the generated aggregate imports.",
    )
    parser.add_argument(
        "--shard-size",
        type=int,
        default=1,
        help="Number of product identities per shard for --emit-lean-sharded.",
    )
    parser.add_argument(
        "--block-size",
        type=int,
        default=100,
        help="Number of coefficient terms per block for --emit-lean-term-sharded.",
    )
    parser.add_argument(
        "--lean-namespace-suffix",
        default="Patterns",
        help="Nested namespace for --emit-lean-dir generated declarations.",
    )
    parser.add_argument(
        "--row-zero-out-dir",
        type=Path,
        help="Output directory for --emit-direct-row-zeros.",
    )
    parser.add_argument(
        "--row-zero-aggregate-out",
        type=Path,
        help="Optional aggregate import file for --emit-direct-row-zeros.",
    )
    parser.add_argument(
        "--row-zero-module-root",
        default="Erdos9796Proof.P97.EndpointCertificate.RowZeros.Direct",
        help="Module root used in generated row-zero aggregate imports.",
    )
    parser.add_argument(
        "--product-row-zero-out-dir",
        type=Path,
        help="Output directory for --emit-product-row-zeros.",
    )
    parser.add_argument(
        "--product-row-zero-aggregate-out",
        type=Path,
        help="Optional aggregate import file for --emit-product-row-zeros.",
    )
    parser.add_argument(
        "--product-row-zero-module-root",
        default="Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product",
        help="Module root used in generated product row-zero imports.",
    )
    parser.add_argument(
        "--bank-row-zero-out",
        type=Path,
        help="Output Lean file for --emit-bank-row-zeros.",
    )
    parser.add_argument(
        "--fragment-dir",
        type=Path,
        default=default_fragment_dir(),
        help="Path to the rvol endpoint fragment directory.",
    )
    parser.add_argument("--pid", action="append", help="Endpoint pattern id to certify.")
    parser.add_argument("--all", action="store_true", help="Generate all endpoint certificates.")
    parser.add_argument(
        "--pair",
        default=None,
        help=f"Forced pair to use for Rabinowitsch rows. Default prefers {DEFAULT_PAIR}.",
    )
    parser.add_argument("--out", type=Path, help="Output path for a single certificate.")
    parser.add_argument("--out-dir", type=Path, help="Output directory for multiple certificates.")
    parser.add_argument(
        "--core-census-out",
        type=Path,
        help="JSON output path for --emit-core-census.",
    )
    parser.add_argument(
        "--core-census-markdown-out",
        type=Path,
        help="Optional Markdown summary output path for --emit-core-census.",
    )
    parser.add_argument("--timeout-s", type=int, default=900, help="Singular timeout per pattern.")
    parser.add_argument(
        "--no-python-check",
        action="store_true",
        help="Skip the independent exact Python polynomial identity check.",
    )
    parser.add_argument("--quiet", action="store_true", help="Do not print each written file.")
    return parser.parse_args(list(argv))


def main(argv: Iterable[str]) -> int:
    args = parse_args(argv)
    if args.emit_core_census is not None:
        if args.core_census_out is None:
            raise SystemExit("--emit-core-census requires --core-census-out")
        write_endpoint_core_census(
            args.emit_core_census,
            args.core_census_out,
            args.core_census_markdown_out,
        )
        if not args.quiet:
            print(f"wrote endpoint core census {args.core_census_out}")
            if args.core_census_markdown_out is not None:
                print(f"wrote endpoint core report {args.core_census_markdown_out}")
        return 0

    if args.emit_direct_row_zeros is not None:
        if args.row_zero_out_dir is None:
            raise SystemExit("--emit-direct-row-zeros requires --row-zero-out-dir")
        emit_direct_row_zero_dir(
            args.emit_direct_row_zeros,
            args.row_zero_out_dir,
            args.row_zero_aggregate_out,
            args.row_zero_module_root,
        )
        if not args.quiet:
            print(f"wrote direct row-zero modules under {args.row_zero_out_dir}")
            if args.row_zero_aggregate_out is not None:
                print(f"wrote row-zero aggregate {args.row_zero_aggregate_out}")
        return 0

    if args.emit_product_row_zeros is not None:
        if args.product_row_zero_out_dir is None:
            raise SystemExit(
                "--emit-product-row-zeros requires --product-row-zero-out-dir"
            )
        emit_product_row_zero_dir(
            args.emit_product_row_zeros,
            args.product_row_zero_out_dir,
            args.product_row_zero_aggregate_out,
            args.product_row_zero_module_root,
        )
        if not args.quiet:
            print(
                "wrote product row-zero modules under "
                f"{args.product_row_zero_out_dir}"
            )
            if args.product_row_zero_aggregate_out is not None:
                print(
                    "wrote product row-zero aggregate "
                    f"{args.product_row_zero_aggregate_out}"
                )
        return 0

    if args.emit_bank_row_zeros is not None:
        if args.bank_row_zero_out is None:
            raise SystemExit("--emit-bank-row-zeros requires --bank-row-zero-out")
        emit_bank_row_zero_module(args.emit_bank_row_zeros, args.bank_row_zero_out)
        if not args.quiet:
            print(f"wrote bank row-zero dispatch {args.bank_row_zero_out}")
        return 0

    if args.emit_lean is not None:
        if args.lean_out is None:
            raise SystemExit("--emit-lean requires --lean-out")
        emit_lean_certificate(args.emit_lean, args.lean_out, args.lean_name)
        if not args.quiet:
            print(f"wrote {args.lean_out}")
        return 0

    if args.emit_lean_dir is not None:
        if args.lean_out_dir is None:
            raise SystemExit("--emit-lean-dir requires --lean-out-dir")
        emit_lean_certificate_dir(
            args.emit_lean_dir,
            args.lean_out_dir,
            args.lean_aggregate_out,
            args.lean_module_root,
            args.lean_namespace_suffix,
        )
        if not args.quiet:
            print(f"wrote Lean modules under {args.lean_out_dir}")
            if args.lean_aggregate_out is not None:
                print(f"wrote aggregate {args.lean_aggregate_out}")
        return 0

    if args.emit_lean_sharded is not None:
        if args.lean_out is None:
            raise SystemExit("--emit-lean-sharded requires --lean-out")
        if args.lean_shard_out_dir is None:
            raise SystemExit("--emit-lean-sharded requires --lean-shard-out-dir")
        emit_sharded_lean_certificate(
            args.emit_lean_sharded,
            args.lean_out,
            args.lean_shard_out_dir,
            args.lean_module_root,
            args.shard_size,
        )
        if not args.quiet:
            print(f"wrote sharded coordinator {args.lean_out}")
            print(f"wrote shards under {args.lean_shard_out_dir}")
        return 0

    if args.emit_lean_term_sharded is not None:
        if args.lean_out is None:
            raise SystemExit("--emit-lean-term-sharded requires --lean-out")
        if args.lean_shard_out_dir is None:
            raise SystemExit("--emit-lean-term-sharded requires --lean-shard-out-dir")
        emit_term_sharded_lean_certificate(
            args.emit_lean_term_sharded,
            args.lean_out,
            args.lean_shard_out_dir,
            args.lean_module_root,
            args.block_size,
        )
        if not args.quiet:
            print(f"wrote term-sharded coordinator {args.lean_out}")
            print(f"wrote term shards under {args.lean_shard_out_dir}")
        return 0

    if args.check:
        paths = certificate_files(args.check)
        if not paths:
            raise SystemExit("no certificate JSON files to check")
        for path in paths:
            check_certificate_file(path)
            if not args.quiet:
                print(f"checked {path}")
        if args.quiet:
            print(f"checked {len(paths)} certificate files")
        return 0

    fragment_dir = args.fragment_dir.resolve()
    pids: list[str] = []
    if args.all:
        pids.extend(endpoint_pids(fragment_dir))
    if args.pid:
        pids.extend(args.pid)
    pids = list(dict.fromkeys(pids))
    if not pids:
        raise SystemExit("pass at least one --pid or --all")
    if len(pids) == 1:
        out_path = args.out
        if out_path is None and args.out_dir is not None:
            out_path = args.out_dir / f"{pids[0]}.json"
        if out_path is None:
            out_path = Path(f"{pids[0]}.json")
        cert = build_certificate(
            fragment_dir,
            pids[0],
            args.pair,
            args.timeout_s,
            python_check=not args.no_python_check,
        )
        write_certificate(cert, out_path)
        if not args.quiet:
            print(f"wrote {out_path}")
        return 0

    if args.out is not None:
        raise SystemExit("--out can only be used with a single certificate")
    out_dir = args.out_dir or Path("certificates/endpoint")
    for pid in pids:
        cert = build_certificate(
            fragment_dir,
            pid,
            args.pair,
            args.timeout_s,
            python_check=not args.no_python_check,
        )
        write_certificate(cert, out_dir / f"{pid}.json")
        if not args.quiet:
            print(f"wrote {out_dir / f'{pid}.json'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
