#!/usr/bin/env python3
"""Probe deterministic finite-field lifts for the 15-equality certificate."""

from __future__ import annotations

import hashlib
import json
import re
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any

import sympy as sp

import audit
import minimize_core as core


HERE = Path(__file__).resolve().parent
SOURCE = HERE / "unit_certificate_15.sing"
PRIMES = (1000003, 1000033, 1000037)
COFACTOR_RE = re.compile(r"^__COFACTOR_(\d+)__=(.*)$")


def one(prime: int) -> dict[str, Any]:
    if not sp.isprime(prime):
        raise AssertionError(f"not prime: {prime}")
    source_text = SOURCE.read_text()
    replaced = source_text.replace("ring R=0,", f"ring R={prime},", 1)
    source = HERE / f"unit_certificate_15_mod_{prime}.sing"
    transcript = HERE / f"unit_certificate_15_mod_{prime}.out"
    source.write_text(replaced)
    result = audit.run(["Singular", "-q", str(source)], timeout=180)
    text = str(result.get("stdout", ""))
    transcript.write_text(text)
    parsed: dict[int, str] = {}
    for line in text.splitlines():
        match = COFACTOR_RE.fullmatch(line.strip())
        if match is not None:
            parsed[int(match.group(1))] = match.group(2)
    if "__SINGULAR_IDENTITY_PASS__" not in text or len(parsed) != 15:
        return {
            "prime": prime,
            "status": "FAIL",
            "run": result,
            "parsed_count": len(parsed),
        }
    # Variable names come from the source ring declaration.
    variable_line = source_text.splitlines()[0]
    variable_names = variable_line.split("(", 1)[1].split(")", 1)[0].split(",")
    variables = [sp.Symbol(name) for name in variable_names]
    locals_map = {name: variable for name, variable in zip(variable_names, variables)}
    supports: list[list[list[int]]] = []
    terms: list[int] = []
    for index in range(1, 16):
        expression = sp.sympify(parsed[index].replace("^", "**"), locals=locals_map)
        polynomial = sp.Poly(expression, *variables, modulus=prime)
        supports.append([list(monomial) for monomial, _coefficient in polynomial.terms()])
        terms.append(polynomial.length())
    return {
        "prime": prime,
        "status": "PASS",
        "seconds": result["seconds"],
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "transcript_sha256": hashlib.sha256(transcript.read_bytes()).hexdigest(),
        "cofactor_term_counts": terms,
        "cofactor_supports": supports,
        "cofactor_text": [parsed[index] for index in range(1, 16)],
    }


def main() -> None:
    if not SOURCE.exists():
        raise RuntimeError("run extract_15_cofactors.py far enough to generate source first")
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=len(PRIMES)) as pool:
        futures = {pool.submit(one, prime): prime for prime in PRIMES}
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                result["prime"],
                result["status"],
                result.get("seconds"),
                flush=True,
            )
    results.sort(key=lambda item: item["prime"])
    passed = [result for result in results if result["status"] == "PASS"]
    supports_stable = bool(passed) and all(
        result["cofactor_supports"] == passed[0]["cofactor_supports"]
        for result in passed[1:]
    )
    report = {
        "schema": "p97-bank-clean-15-equality-finite-field-lift-probe-v1",
        "source": str(SOURCE.relative_to(core.audit.REPO)),
        "source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
        "results": results,
        "all_pass": len(passed) == len(PRIMES),
        "supports_stable_across_primes": supports_stable,
        "epistemic_status": "FINITE_FIELD_LIFT_PROBE_NOT_QQ_CERTIFICATE",
    }
    (HERE / "finite_field_lift_15.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "all_pass": report["all_pass"],
                "supports_stable": supports_stable,
                "term_counts": passed[0]["cofactor_term_counts"] if passed else None,
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
