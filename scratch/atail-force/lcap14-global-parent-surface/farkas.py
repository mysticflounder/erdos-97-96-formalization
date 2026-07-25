#!/usr/bin/env python3
"""Exact rational Farkas certificates for the lcap14 schema bank.

`schema-bank.json` (produced by `schema_mine.py`) holds 802 records, each a
support-local schema: `k` cyclically ordered points (ranks 0..k-1) plus a
set of signed equality atoms `(sign, center, left, right)` meaning
`d(center, left) = d(center, right)`.  Every schema is already PROVEN
infeasible (by `schema_mine.py`'s `schema_smt`, reused here verbatim) against
the fixed strict-Kalmanson axiom family on its own `k` points:

  - positivity:      d_uv > 0                                   for u < v;
  - strict triangle:  each side < sum of the other two           for a<b<c;
  - strict Kalmanson: d_ac+d_bd > d_ab+d_cd  and  > d_ad+d_bc     for a<b<c<d.

That infeasibility is a fact of LINEAR arithmetic (every axiom and every
atom is a linear form in the C(k,2) distance variables), so by Motzkin
transposition / Farkas' lemma it has an exact FARKAS CERTIFICATE: a
nonnegative combination of the strict axioms plus a free-sign combination of
the equality atoms that sums, coefficient by coefficient, to the identically
zero linear form while forcing a strictly positive right-hand side — i.e. a
derivation of `0 > 0`.  This module extracts that certificate (multipliers
found by z3 QF_LRA over the multiplier unknowns, not over the original
distance variables) and then VERIFIES it independently in exact
`fractions.Fraction` arithmetic, so the "proof" here is the closed-form
recomputation, not the solver's say-so.

What this establishes: for each certified schema, a finite, exactly-checked
linear combination of finitely many axiom instances (each itself an
elementary fact: one positivity/triangle/Kalmanson inequality, or one
equality atom) that is jointly contradictory.  That combination is exactly
the hint list a Lean `linarith [...]` call needs to discharge the same
contradiction in the kernel.  What this does NOT establish: transportability
of any given schema to the ambient 14-point surface (that is `schema_mine.py`
support-local UNSAT territory) or minimality of the extracted certificate
(z3 is asked for *a* certificate normalized by `sum(lam_i) = 1`, not a
smallest one).

Self-test (`--self-test`):

  (a) NEGATIVE control: a single equality atom on 4 points (`d(0,1)=d(0,2)`,
      an isoceles-triangle-shaped pattern) is metric-SAT under this axiom
      family (independently confirmed via `schema_mine.decide_schema`), so
      no Farkas certificate can exist; assert none is found.
  (b) POSITIVE control: schema index 0 of the bank is metric-UNSAT; assert a
      verified certificate IS found.
"""

from __future__ import annotations

import argparse
import itertools
import json
import re
import statistics
import subprocess
import tempfile
from collections import Counter
from dataclasses import dataclass, field
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve().parent

Atom = tuple[str, int, int, int]  # (sign, center, left, right)

AXIOM_KINDS = ("positivity", "triangle", "kalmanson", "equality")


def dvar(u: int, v: int) -> str:
    u, v = min(u, v), max(u, v)
    return f"d_{u}_{v}"


@dataclass
class Axiom:
    kind: str  # one of AXIOM_KINDS
    points: tuple[int, ...]
    variant: str  # distinguishes the family member; "" when there is only one
    strict: bool  # True: multiplier lam >= 0 (inequality); False: mu free (equality)
    form: dict[str, Fraction] = field(default_factory=dict)  # var -> coeff; form (>|=) 0

    @property
    def label(self) -> str:
        return f"{self.kind}:{self.variant}" if self.variant else self.kind


def build_axioms(k: int, atoms: tuple[Atom, ...]) -> list[Axiom]:
    """The linear-form encoding of every axiom instance on k points, plus the
    schema's own equality atoms.  Mirrors `schema_mine.schema_smt` exactly:
    same enumeration order, same three triangle variants per triple, same
    two Kalmanson variants per quadruple."""
    axioms: list[Axiom] = []
    for u, v in itertools.combinations(range(k), 2):
        axioms.append(Axiom("positivity", (u, v), "", True, {dvar(u, v): Fraction(1)}))
    for a, b, c in itertools.combinations(range(k), 3):
        # d_ac < d_ab + d_bc  ==>  d_ab + d_bc - d_ac > 0
        axioms.append(Axiom("triangle", (a, b, c), "ac", True, {
            dvar(a, b): Fraction(1), dvar(b, c): Fraction(1), dvar(a, c): Fraction(-1),
        }))
        # d_ab < d_ac + d_bc  ==>  d_ac + d_bc - d_ab > 0
        axioms.append(Axiom("triangle", (a, b, c), "ab", True, {
            dvar(a, c): Fraction(1), dvar(b, c): Fraction(1), dvar(a, b): Fraction(-1),
        }))
        # d_bc < d_ab + d_ac  ==>  d_ab + d_ac - d_bc > 0
        axioms.append(Axiom("triangle", (a, b, c), "bc", True, {
            dvar(a, b): Fraction(1), dvar(a, c): Fraction(1), dvar(b, c): Fraction(-1),
        }))
    for a, b, c, d in itertools.combinations(range(k), 4):
        # d_ac + d_bd > d_ab + d_cd
        axioms.append(Axiom("kalmanson", (a, b, c, d), "ab_cd", True, {
            dvar(a, c): Fraction(1), dvar(b, d): Fraction(1),
            dvar(a, b): Fraction(-1), dvar(c, d): Fraction(-1),
        }))
        # d_ac + d_bd > d_ad + d_bc
        axioms.append(Axiom("kalmanson", (a, b, c, d), "ad_bc", True, {
            dvar(a, c): Fraction(1), dvar(b, d): Fraction(1),
            dvar(a, d): Fraction(-1), dvar(b, c): Fraction(-1),
        }))
    for i, (sign, center, left, right) in enumerate(atoms):
        if sign != "+":
            raise ValueError(
                f"atom {i} has sign {sign!r}; only '+' equality atoms are supported "
                "(schema-bank.json is documented to contain '+' atoms only)"
            )
        left, right = min(left, right), max(left, right)
        axioms.append(Axiom("equality", (center, left, right), f"atom{i}", False, {
            dvar(center, left): Fraction(1), dvar(center, right): Fraction(-1),
        }))
    return axioms


def _term(coeff: Fraction, name: str) -> str:
    if coeff == 1:
        return name
    if coeff == -1:
        return f"(- {name})"
    if coeff.denominator == 1:
        return f"(* {coeff.numerator} {name})"
    return f"(* (/ {coeff.numerator} {coeff.denominator}) {name})"


def farkas_smt(k: int, axioms: list[Axiom]) -> tuple[str, list[str]]:
    """Build the multiplier-unknowns QF_LRA query: find lam_i >= 0 (one per
    strict axiom instance) and mu_j free (one per equality atom) such that
    the coefficient-wise combination is the zero linear form and the strict
    multipliers sum to 1 (normalizes away the trivial all-zero solution and
    forces at least one strict axiom to participate)."""
    names = [f"lam_{i}" if ax.strict else f"mu_{i}" for i, ax in enumerate(axioms)]
    lines = ["(set-logic QF_LRA)"]
    for name, ax in zip(names, axioms):
        lines.append(f"(declare-const {name} Real)")
        if ax.strict:
            lines.append(f"(assert (>= {name} 0))")
    all_vars = sorted(dvar(u, v) for u, v in itertools.combinations(range(k), 2))
    for v in all_vars:
        terms = [_term(ax.form[v], name) for name, ax in zip(names, axioms) if ax.form.get(v)]
        if not terms:
            continue  # coefficient is identically 0 on this variable already
        expr = terms[0] if len(terms) == 1 else "(+ " + " ".join(terms) + ")"
        lines.append(f"(assert (= {expr} 0))")
    strict_names = [name for name, ax in zip(names, axioms) if ax.strict]
    if not strict_names:
        raise RuntimeError("no strict axioms on this support (k too small)")
    sum_expr = strict_names[0] if len(strict_names) == 1 else "(+ " + " ".join(strict_names) + ")"
    lines.append(f"(assert (= {sum_expr} 1))")
    lines.append("(check-sat)")
    lines.append("(get-model)")
    return "\n".join(lines) + "\n", names


# ---------------------------------------------------------------------------
# S-expression model parsing.  z3's `(get-model)` output for QF_LRA constants
# is built from nested (+ - * /) over decimal literals; we tokenize, parse to
# nested lists, and evaluate to an exact Fraction (never through float).

_TOKEN_RE = re.compile(r"\(|\)|[^\s()]+")


def _tokenize(text: str) -> list[str]:
    return _TOKEN_RE.findall(text)


def _parse_sexpr(tokens: list[str], pos: int) -> tuple[object, int]:
    tok = tokens[pos]
    if tok == "(":
        items: list[object] = []
        pos += 1
        while tokens[pos] != ")":
            item, pos = _parse_sexpr(tokens, pos)
            items.append(item)
        return items, pos + 1
    return tok, pos + 1


def _eval_value(expr: object) -> Fraction:
    if isinstance(expr, str):
        return Fraction(expr)
    assert isinstance(expr, list) and expr, f"malformed model value expr: {expr!r}"
    op, args = expr[0], expr[1:]
    values = [_eval_value(a) for a in args]
    if op == "-":
        if len(values) == 1:
            return -values[0]
        result = values[0]
        for v in values[1:]:
            result -= v
        return result
    if op == "/":
        result = values[0]
        for v in values[1:]:
            result /= v
        return result
    if op == "+":
        result = Fraction(0)
        for v in values:
            result += v
        return result
    if op == "*":
        result = Fraction(1)
        for v in values:
            result *= v
        return result
    raise ValueError(f"unsupported model operator {op!r} in {expr!r}")


def parse_model(model_text: str) -> dict[str, Fraction]:
    tokens = _tokenize(model_text)
    if not tokens:
        raise RuntimeError("empty (get-model) output")
    top, _ = _parse_sexpr(tokens, 0)
    assert isinstance(top, list), f"expected top-level model list, got {top!r}"
    items = top
    if items and items[0] == "model":
        items = items[1:]
    values: dict[str, Fraction] = {}
    for item in items:
        assert isinstance(item, list) and item and item[0] == "define-fun", (
            f"unexpected model entry: {item!r}"
        )
        name = item[1]
        assert isinstance(name, str)
        body = item[-1]
        values[name] = _eval_value(body)
    return values


def run_z3_model(smt_text: str, timeout: float) -> tuple[str, dict[str, Fraction] | None]:
    with tempfile.NamedTemporaryFile(
        "w", suffix=".smt2", delete=False, encoding="ascii"
    ) as handle:
        handle.write(smt_text)
        path = Path(handle.name)
    try:
        completed = subprocess.run(
            ["z3", "-smt2", str(path)],
            capture_output=True, text=True, timeout=timeout, check=False,
        )
    finally:
        path.unlink(missing_ok=True)
    out = completed.stdout
    lines = out.splitlines()
    if not lines:
        raise RuntimeError(f"z3 produced no output (stderr: {completed.stderr[:500]})")
    status = lines[0].strip()
    if status == "unsat":
        return "unsat", None
    if status == "sat":
        return "sat", parse_model("\n".join(lines[1:]))
    raise RuntimeError(f"z3 unexpected status {status!r}: {out[:500]} / stderr: {completed.stderr[:500]}")


# ---------------------------------------------------------------------------
# Exact verification: independently recompute the combination coefficient by
# coefficient in Fraction arithmetic.  This is the actual proof; the solver
# above is only a search oracle whose answer we distrust until checked here.

def verify_certificate(
    k: int, named_axioms: list[tuple[str, Axiom]], values: dict[str, Fraction]
) -> list[tuple[Axiom, Fraction]]:
    all_vars = [dvar(u, v) for u, v in itertools.combinations(range(k), 2)]
    totals = {v: Fraction(0) for v in all_vars}
    strict_sum = Fraction(0)
    nonzero: list[tuple[Axiom, Fraction]] = []
    for name, ax in named_axioms:
        if name not in values:
            raise AssertionError(f"Farkas certificate incomplete: no value for {name} ({ax.label})")
        val = values[name]
        if ax.strict:
            if val < 0:
                raise AssertionError(
                    f"Farkas certificate invalid: strict multiplier {name} ({ax.label}) is {val} < 0"
                )
            strict_sum += val
        if val != 0:
            nonzero.append((ax, val))
        for v, coeff in ax.form.items():
            totals[v] += coeff * val
    for v in all_vars:
        if totals[v] != 0:
            raise AssertionError(
                f"Farkas certificate invalid: coefficient of {v} is {totals[v]}, not 0"
            )
    if strict_sum != 1:
        raise AssertionError(
            f"Farkas certificate invalid: strict multipliers sum to {strict_sum}, not 1"
        )
    if not any(ax.strict for ax, _ in nonzero):
        raise AssertionError(
            "Farkas certificate invalid: no strict axiom carries a nonzero multiplier "
            "(0 > 0 slack cannot be derived from equalities alone)"
        )
    return nonzero


def find_certificate(
    k: int, atoms: tuple[Atom, ...], timeout: float = 300.0
) -> list[tuple[Axiom, Fraction]] | None:
    """Search for and verify a Farkas certificate for schema (k, atoms).
    Returns the verified nonzero-multiplier axiom list, or None if the
    underlying pattern is metric-SAT (no certificate exists)."""
    axioms = build_axioms(k, atoms)
    smt_text, names = farkas_smt(k, axioms)
    status, values = run_z3_model(smt_text, timeout)
    if status == "unsat":
        return None
    assert values is not None
    named_axioms = list(zip(names, axioms))
    return verify_certificate(k, named_axioms, values)


def certificate_record(
    index: int, support: int, atoms: tuple[Atom, ...],
    nonzero: list[tuple[Axiom, Fraction]],
) -> dict:
    axiom_counts = {kind: 0 for kind in AXIOM_KINDS}
    multipliers = []
    for ax, val in nonzero:
        axiom_counts[ax.kind] += 1
        multipliers.append([ax.label, list(ax.points), val.numerator, val.denominator])
    return {
        "index": index,
        "support": support,
        "atoms": [list(atom) for atom in atoms],
        "multipliers": multipliers,
        "axiom_counts": axiom_counts,
        "certificate_size": len(multipliers),
        "verified": True,
    }


def process_schema(index: int, record: dict, timeout: float) -> dict:
    k = record["support"]
    atoms = tuple(tuple(atom) for atom in record["atoms"])
    nonzero = find_certificate(k, atoms, timeout=timeout)
    if nonzero is None:
        raise RuntimeError(
            f"schema {index}: no Farkas certificate found (Farkas LP reported unsat); "
            "schema-bank.json claims this schema is metric-infeasible, so this is a "
            "contradiction worth re-checking with schema_mine.decide_schema"
        )
    return certificate_record(index, k, atoms, nonzero)


# ---------------------------------------------------------------------------

def load_bank(path: Path) -> list[dict]:
    data = json.loads(path.read_text(encoding="utf-8"))
    return data["schemas"]


def self_test() -> int:
    # (a) NEGATIVE control: single equality atom on 4 points is metric-SAT
    # (independently confirmed via schema_mine.decide_schema), so no Farkas
    # certificate can exist.
    k, atoms = 4, (("+", 0, 1, 2),)
    result = find_certificate(k, atoms)
    assert result is None, (
        f"self-test FAILED: found a Farkas certificate for a satisfiable pattern "
        f"(k={k}, atoms={atoms}): {result}"
    )
    print("PASS self-test (a): satisfiable isoceles pattern (k=4, d(0,1)=d(0,2)) "
          "admits NO Farkas certificate, as required")

    # (b) POSITIVE control: schema index 0 of the bank is metric-UNSAT.
    bank_path = HERE / "schema-bank.json"
    schemas = load_bank(bank_path)
    record = schemas[0]
    result = process_schema(0, record, timeout=300.0)
    assert result["verified"] is True
    assert result["certificate_size"] > 0
    print(f"PASS self-test (b): schema index 0 (support={record['support']}, "
          f"{len(record['atoms'])} atoms) yields a VERIFIED Farkas certificate "
          f"with {result['certificate_size']} nonzero multipliers "
          f"{result['axiom_counts']}")

    print("PASS: farkas.py self-test")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--bank", type=Path, default=HERE / "schema-bank.json")
    parser.add_argument("--limit", type=int, default=0, help="process only the first N schemas (0 = all)")
    parser.add_argument("--output", type=Path, default=HERE / "farkas.json")
    parser.add_argument("--index", type=int, default=None, help="process a single schema by index (debugging)")
    parser.add_argument("--timeout", type=float, default=300.0, help="per-schema z3 timeout in seconds")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        return self_test()

    schemas = load_bank(args.bank)

    if args.index is not None:
        targets = [(args.index, schemas[args.index])]
    else:
        targets = list(enumerate(schemas))
        if args.limit:
            targets = targets[: args.limit]

    results: list[dict] = []
    failures: list[dict] = []
    for index, record in targets:
        try:
            results.append(process_schema(index, record, timeout=args.timeout))
        except Exception as exc:  # noqa: BLE001 - batch run must survive one bad schema
            failures.append({"index": index, "support": record["support"],
                              "atoms": record["atoms"], "error": str(exc)})
            print(f"FAIL schema {index}: {exc}")

    args.output.write_text(
        json.dumps({
            "bank": str(args.bank),
            "requested": len(targets),
            "certified": len(results),
            "failed": len(failures),
            "schemas": results,
            "failures": failures,
        }, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )

    sizes = [r["certificate_size"] for r in results]
    print(f"certified {len(results)}/{len(targets)} schemas "
          f"({len(failures)} failed)")
    if sizes:
        dist = Counter(sizes)
        print(f"certificate-size distribution: {dict(sorted(dist.items()))}")
        print(f"certificate size min={min(sizes)} max={max(sizes)} "
              f"median={statistics.median(sizes)}")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
