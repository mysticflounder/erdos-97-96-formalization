#!/usr/bin/env python3
"""Independently verify and normalize Groebner.jl's raw QQ change matrix."""

from __future__ import annotations

import hashlib
import json
import re
from fractions import Fraction
from pathlib import Path


HERE = Path(__file__).resolve().parent
RAW = HERE / "groebner_jl_15_raw.txt"
CORE = HERE.parent / "bank-clean-unit-independent-audit" / "confirm_15_from17.json"
OUTPUT = HERE / "unit_certificate_groebner_jl_15.json"
EXPECTED_CORE_SHA = "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def parse_sparse(
    text: str, symbol_names: list[str]
) -> dict[tuple[int, ...], Fraction]:
    """Parse AbstractAlgebra's expanded polynomial without recursive ASTs."""
    symbol_index = {name: index for index, name in enumerate(symbol_names)}
    normalized = text.replace("**", "^").strip().replace(" - ", " + -")
    answer: dict[tuple[int, ...], Fraction] = {}
    for raw_term in normalized.split(" + "):
        term = raw_term.strip()
        sign = 1
        if term.startswith("-"):
            sign = -1
            term = term[1:]
        coefficient = Fraction(sign)
        exponents = [0] * len(symbol_names)
        for factor in term.split("*"):
            if re.fullmatch(r"\d+(?:(?://|/)\d+)?", factor):
                coefficient *= Fraction(factor.replace("//", "/"))
                continue
            match = re.fullmatch(r"([A-Z][A-Za-z0-9_]*[xy])(?:\^(\d+))?", factor)
            if match is None or match.group(1) not in symbol_index:
                raise ValueError(f"cannot parse polynomial factor {factor!r}")
            exponents[symbol_index[match.group(1)]] += int(match.group(2) or "1")
        key = tuple(exponents)
        value = answer.get(key, Fraction(0)) + coefficient
        if value:
            answer[key] = value
        else:
            answer.pop(key, None)
    return answer


def add_product(
    target: dict[tuple[int, ...], Fraction],
    left: dict[tuple[int, ...], Fraction],
    right: dict[tuple[int, ...], Fraction],
) -> None:
    for left_exp, left_coefficient in left.items():
        for right_exp, right_coefficient in right.items():
            exponents = tuple(
                a + b for a, b in zip(left_exp, right_exp, strict=True)
            )
            value = (
                target.get(exponents, Fraction(0))
                + left_coefficient * right_coefficient
            )
            if value:
                target[exponents] = value
            else:
                target.pop(exponents, None)


def main() -> int:
    core_document = json.loads(CORE.read_text(encoding="utf-8"))
    records = core_document["generators"]
    core_names = [str(record["name"]) for record in records]
    core_generators = [str(record["polynomial"]) for record in records]
    if canonical_sha256(core_generators) != EXPECTED_CORE_SHA:
        raise RuntimeError("audited 15-core polynomial stream drift")

    metadata: dict[str, str] = {}
    raw_entries: dict[str, tuple[str, str]] = {}
    for line in RAW.read_text(encoding="utf-8").splitlines():
        fields = line.split("\t")
        if fields[0] == "ENTRY" and len(fields) == 4:
            _tag, name, generator, cofactor = fields
            if name in raw_entries:
                raise RuntimeError(f"duplicate raw entry {name}")
            raw_entries[name] = (generator, cofactor)
        elif len(fields) == 2:
            metadata[fields[0]] = fields[1]
        else:
            raise RuntimeError(f"malformed raw line: {line[:120]}")
    if metadata.get("SCHEMA") != "p97-bank-clean-groebner-jl-change-matrix-v1":
        raise RuntimeError("unexpected raw certificate schema")
    if set(raw_entries) != set(core_names):
        raise RuntimeError("raw/core generator-name sets disagree")

    symbol_names = sorted(
        set().union(
            *(
                set(re.findall(r"\b[A-Z][A-Za-z0-9_]*[xy]\b", text))
                for text in core_generators
            )
        ),
        key=lambda name: (name[:-1], name[-1]),
    )
    core_polys = [parse_sparse(text, symbol_names) for text in core_generators]
    multipliers: list[dict[tuple[int, ...], Fraction]] = []
    multiplier_text: list[str] = []
    for name, core_poly in zip(core_names, core_polys, strict=True):
        raw_generator, raw_cofactor = raw_entries[name]
        if parse_sparse(raw_generator, symbol_names) != core_poly:
            raise RuntimeError(f"Groebner.jl generator drift at {name}")
        multipliers.append(parse_sparse(raw_cofactor, symbol_names))
        multiplier_text.append(raw_cofactor.replace("//", "/"))

    total: dict[tuple[int, ...], Fraction] = {}
    for multiplier, generator in zip(multipliers, core_polys, strict=True):
        add_product(total, multiplier, generator)
    expected = {(0,) * len(symbol_names): Fraction(1)}
    if total != expected:
        raise RuntimeError(
            f"raw change matrix fails exact QQ replay: {len(total)} terms"
        )

    identity_text = "+".join(
        f"({multiplier})*({generator})"
        for multiplier, generator in zip(
            multiplier_text, core_generators, strict=True
        )
        if multiplier != "0"
    )
    document = {
        "schema": "p97-atail-bank-clean-15-groebner-jl-certificate-v1",
        "source_polynomial_sha256": EXPECTED_CORE_SHA,
        "raw_file_sha256": file_sha256(RAW),
        "generator_names": core_names,
        "generators": core_generators,
        "variables": symbol_names,
        "multipliers": multiplier_text,
        "raw_identity_sha256": hashlib.sha256(identity_text.encode()).hexdigest(),
        "nonzero_multiplier_count": sum(bool(poly) for poly in multipliers),
        "multiplier_term_count": sum(len(poly) for poly in multipliers),
        "max_multiplier_degree": max(
            max(sum(exponents) for exponents in poly) for poly in multipliers if poly
        ),
        "producer": {
            "tool": "Groebner.jl groebner_with_change_matrix over QQ",
            "reported_seconds": metadata.get("SECONDS"),
            "julia_exact_change_matrix_check": True,
            "independent_python_fraction_qq_identity_check": True,
        },
    }
    OUTPUT.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "output": str(OUTPUT),
                "output_sha256": file_sha256(OUTPUT),
                "bytes": OUTPUT.stat().st_size,
                "multiplier_terms": document["multiplier_term_count"],
                "max_multiplier_degree": document["max_multiplier_degree"],
                "verified_exact_qq_identity": True,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
