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
import json
import os
import re
import subprocess
import sys
import tempfile
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Iterable


POINTS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
DEFAULT_PAIR = "s1=s3"
SCHEMA = "endpoint_certificate.v1"


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
        + f", check := checkCertificate {pid}, valid := {pid}_valid }}"
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

/-- One checked endpoint certificate fact. -/
structure VerifiedCertificate where
  id : String
  check : Bool
  valid : check = true

/-- The full checked endpoint certificate set. -/
def allEndpointCertificates : List VerifiedCertificate :=
[
{entries}
]

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
theorem {lean_name}_sum_valid : checkProductSum {lean_name}_products = true := by
  native_decide

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
theorem {lean_name}_sum_valid : checkProductSum {lean_name}_blocks = true := by
  native_decide

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
