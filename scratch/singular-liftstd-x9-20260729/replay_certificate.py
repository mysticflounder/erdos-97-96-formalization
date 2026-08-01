"""Independent exact SymPy QQ replay of the saved target certificate."""

from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

import sympy as sp


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_hash(value: object) -> str:
    data = (
        json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        )
        + "\n"
    ).encode()
    return sha256(data)


def parse_poly(
    text: str, symbols: tuple[sp.Symbol, ...]
) -> sp.Poly:
    expression = sp.sympify(
        text.replace("^", "**"),
        locals={str(symbol): symbol for symbol in symbols},
        evaluate=True,
    )
    return sp.Poly(expression, *symbols, domain=sp.QQ)


def main() -> int:
    if len(sys.argv) != 3:
        raise SystemExit("usage: replay_certificate.py CERTIFICATE SYSTEM")
    certificate_path = Path(sys.argv[1])
    source_path = Path(sys.argv[2])
    certificate_raw = certificate_path.read_bytes()
    source_raw = source_path.read_bytes()
    certificate = json.loads(certificate_raw)
    source = json.loads(source_raw)

    errors: list[str] = []
    if certificate["source_system"]["raw_sha256"] != sha256(source_raw):
        errors.append("source raw hash mismatch")
    if certificate["variables"] != source["free_variables"]:
        errors.append("variable order mismatch")
    entries = certificate["entries"]
    if len(entries) != 30 or certificate["generator_count"] != 30:
        errors.append("generator count mismatch")
    entry_generators = [entry["generator"] for entry in entries]
    if entry_generators != source["polynomials"]:
        errors.append("generator order or content mismatch")
    if [entry["index"] for entry in entries] != list(range(30)):
        errors.append("entry indices mismatch")
    expected_hashes = {
        "variables_canonical_json_sha256": canonical_hash(
            source["free_variables"]
        ),
        "generators_canonical_json_sha256": canonical_hash(
            source["polynomials"]
        ),
        "rows_canonical_json_sha256": canonical_hash(source["rows"]),
    }
    if certificate["order_hashes"] != expected_hashes:
        errors.append("canonical order hash mismatch")

    symbols = tuple(sp.Symbol(name) for name in source["free_variables"])
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    nonzero_indices = []
    cofactor_term_count = 0
    max_cofactor_degree = 0
    for index, entry in enumerate(entries):
        generator = parse_poly(source["polynomials"][index], symbols)
        cofactor = parse_poly(entry["cofactor"], symbols)
        total += generator * cofactor
        cofactor_term_count += cofactor.length()
        if not cofactor.is_zero:
            nonzero_indices.append(index)
            max_cofactor_degree = max(
                max_cofactor_degree, int(cofactor.total_degree())
            )
    target = parse_poly(certificate["target"], symbols)
    if total != target:
        errors.append("exact QQ polynomial identity failed")
    if nonzero_indices != certificate["nonzero_cofactor_indices"]:
        errors.append("nonzero cofactor index mismatch")

    result = {
        "status": "PASS" if not errors else "FAIL",
        "errors": errors,
        "identity": (
            "x9x^2+x9y^2 = sum_{i=0}^{29} cofactor_i * generator_i"
        ),
        "computed_result": sp.sstr(total.as_expr()),
        "target": sp.sstr(target.as_expr()),
        "coefficient_field": "QQ",
        "generator_count": len(entries),
        "nonzero_cofactor_count": len(nonzero_indices),
        "nonzero_cofactor_indices": nonzero_indices,
        "total_cofactor_terms": cofactor_term_count,
        "max_cofactor_total_degree": max_cofactor_degree,
        "certificate_sha256": sha256(certificate_raw),
        "source_system_sha256": sha256(source_raw),
        "order_hashes": expected_hashes,
    }
    print(json.dumps(result, indent=2, sort_keys=True, allow_nan=False))
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
