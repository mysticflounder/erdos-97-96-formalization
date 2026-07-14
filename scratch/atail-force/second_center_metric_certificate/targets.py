#!/usr/bin/env python3
"""Pinned polynomial targets for bounded Nullstellensatz extraction.

This module contains only deterministic encoding and provenance checks.  It
does not invoke a CAS and is shared by the extraction driver.  The independent
certificate checker deliberately reimplements the polynomial encoding.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable

import sympy as sp


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
CEGAR_DIR = HERE.parent / "second_center_metric_cegar"

ORACLE_CHECKPOINT = ORACLE_DIR / "checkpoint.json"
ORACLE_MANIFEST = ORACLE_DIR / "manifest.json"
CEGAR_CHECKPOINT = CEGAR_DIR / "checkpoint.json"
CEGAR_MANIFEST = CEGAR_DIR / "manifest.json"

EXPECTED_SOURCE_HASHES = {
    "metric_oracle_checkpoint_sha256":
        "5791754f879aa25eb3de7b7d751d88f4bf24a05bc0a52cebf6d3857c60d9e5af",
    "metric_oracle_manifest_sha256":
        "84c19c092e657d09e14b666ed43ae90646d6edee14330a769508d5499d948381",
    "metric_cegar_checkpoint_sha256":
        "087a5a751a0f23454825f84556e5c774cf4c081ef3a3b34224a2230a0b27c179",
    "metric_cegar_manifest_sha256":
        "fcc4d3fdb307ff724cea705caa3e32be7e6384990df5910b277b7e48d91b20c4",
}

CEGAR_456_ROW_SET_SHA256 = (
    "583594c8e55bdf7d3e91734e9c3aa61451131664abea1540c78c660a599e6a63"
)
CEGAR_456_POLYNOMIAL_SHA256 = (
    "cfa015ef232fb3306cded3edcb734a7435416cc214c80248b02de48e7e3956fa"
)


@dataclass(frozen=True)
class Row:
    center: int
    support: tuple[int, ...]

    def encoded(self) -> str:
        return f"{self.center}:" + ",".join(str(x) for x in self.support)


@dataclass(frozen=True)
class Target:
    name: str
    coordinate_model: str
    variables: tuple[str, ...]
    generators: tuple[str, ...]
    rows: tuple[Row, ...]
    provenance: dict[str, Any]


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    data = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(data).hexdigest()


def source_hashes() -> dict[str, str]:
    return {
        "metric_oracle_checkpoint_sha256": file_sha256(ORACLE_CHECKPOINT),
        "metric_oracle_manifest_sha256": file_sha256(ORACLE_MANIFEST),
        "metric_cegar_checkpoint_sha256": file_sha256(CEGAR_CHECKPOINT),
        "metric_cegar_manifest_sha256": file_sha256(CEGAR_MANIFEST),
    }


def validate_source_hashes() -> dict[str, str]:
    observed = source_hashes()
    if observed != EXPECTED_SOURCE_HASHES:
        raise RuntimeError(
            "source provenance drifted; inspect before extracting:\n"
            + json.dumps({"expected": EXPECTED_SOURCE_HASHES,
                          "observed": observed}, indent=2, sort_keys=True)
        )
    return observed


def _row(encoded: str) -> Row:
    center, support = encoded.split(":", maxsplit=1)
    return Row(int(center), tuple(int(x) for x in support.split(",")))


def cegar_456_rows() -> tuple[Row, ...]:
    checkpoint = json.loads(CEGAR_CHECKPOINT.read_text(encoding="utf-8"))
    matches: list[dict[str, Any]] = []
    for case in checkpoint["cases"]:
        for round_record in case["rounds"]:
            cut = round_record.get("accepted_cut")
            if cut and cut["row_set_sha256"] == CEGAR_456_ROW_SET_SHA256:
                matches.append(cut)
    if len(matches) != 1:
        raise RuntimeError(f"expected one pinned CEGAR core, found {len(matches)}")
    cut = matches[0]
    if cut["expanded_polynomial_sha256"] != CEGAR_456_POLYNOMIAL_SHA256:
        raise RuntimeError("pinned CEGAR generator hash drifted")
    if cut["crosscheck"]["status"] != "CROSSCHECKED_UNIT":
        raise RuntimeError("pinned CEGAR core is not recorded CROSSCHECKED_UNIT")
    return tuple(_row(text) for text in cut["rows"])


def oracle_rows(profile: tuple[int, int, int]) -> tuple[Row, ...]:
    checkpoint = json.loads(ORACLE_CHECKPOINT.read_text(encoding="utf-8"))
    case = next(c for c in checkpoint["cases"] if tuple(c["profile"]) == profile)
    return tuple(
        Row(int(r["center"]), tuple(int(x) for x in r["support"]))
        for r in case["bounded_deletion"]["retained_rows"]
    )


def _serialize(expr: sp.Expr, variables: Iterable[sp.Symbol]) -> str:
    poly = sp.Poly(sp.expand(expr), *tuple(variables), domain=sp.QQ)
    terms: list[str] = []
    for exponents, coefficient in poly.terms():
        monomial = "*".join(
            str(variable) if exponent == 1 else f"{variable}^{exponent}"
            for variable, exponent in zip(poly.gens, exponents)
            if exponent
        )
        magnitude = abs(coefficient)
        if monomial:
            coefficient_text = "" if magnitude == 1 else f"{magnitude}*"
            body = coefficient_text + monomial
        else:
            body = str(magnitude)
        if not terms:
            terms.append(("-" if coefficient < 0 else "") + body)
        else:
            terms.append(("-" if coefficient < 0 else "+") + body)
    return "".join(terms) or "0"


def _distance(points: tuple[tuple[sp.Expr, sp.Expr], ...], i: int, j: int) -> sp.Expr:
    return sp.expand(
        (points[i][0] - points[j][0]) ** 2
        + (points[i][1] - points[j][1]) ** 2
    )


def _row_generators(
    points: tuple[tuple[sp.Expr, sp.Expr], ...],
    variables: tuple[sp.Symbol, ...],
    rows: tuple[Row, ...],
) -> tuple[str, ...]:
    result: list[str] = []
    for row in rows:
        pivot = row.support[0]
        base = _distance(points, row.center, pivot)
        for other in row.support[1:]:
            result.append(_serialize(base - _distance(points, row.center, other), variables))
    return tuple(result)


def normalized_target(name: str, rows: tuple[Row, ...], provenance: dict[str, Any]) -> Target:
    points: list[tuple[sp.Expr, sp.Expr]] = [
        (sp.Integer(0), sp.Integer(0)),
        (sp.Integer(1), sp.Integer(0)),
    ]
    for i in range(2, 12):
        points.append(sp.symbols(f"x{i}x x{i}y"))
    frozen_points = tuple(points)
    symbols = tuple(x for point in frozen_points[2:] for x in point)
    generators = _row_generators(frozen_points, symbols, rows)
    return Target(
        name=name,
        coordinate_model="normalized_p0_zero_p1_e1",
        variables=tuple(str(x) for x in symbols),
        generators=generators,
        rows=rows,
        provenance=provenance,
    )


def rabinowitsch_target(
    name: str,
    rows: tuple[Row, ...],
    provenance: dict[str, Any],
    *,
    eliminate_translation: bool,
) -> Target:
    if eliminate_translation:
        points: tuple[tuple[sp.Expr, sp.Expr], ...] = (
            (sp.Integer(0), sp.Integer(0)),
            *(sp.symbols(f"u{i}x u{i}y") for i in range(1, 12)),
        )
        model = "ungauged_relative_coordinates_translation_eliminated"
        coordinate_symbols = tuple(x for point in points[1:] for x in point)
    else:
        points = tuple(sp.symbols(f"x{i}x x{i}y") for i in range(12))
        model = "ungauged_absolute_coordinates"
        coordinate_symbols = tuple(x for point in points for x in point)
    s = sp.Symbol("s")
    symbols = (*coordinate_symbols, s)
    row_generators = _row_generators(points, symbols, rows)
    rabinowitsch = _serialize(s * _distance(points, 0, 1) - 1, symbols)
    return Target(
        name=name,
        coordinate_model=model,
        variables=tuple(str(x) for x in symbols),
        generators=(*row_generators, rabinowitsch),
        rows=rows,
        provenance={**provenance, "rabinowitsch_generator": rabinowitsch},
    )


def all_targets() -> dict[str, Target]:
    source = validate_source_hashes()
    cegar_rows = cegar_456_rows()
    cegar_provenance = {
        **source,
        "profile": [4, 5, 6],
        "row_set_sha256": CEGAR_456_ROW_SET_SHA256,
        "normalized_expanded_polynomial_sha256": CEGAR_456_POLYNOMIAL_SHA256,
    }
    oracle_456 = oracle_rows((4, 5, 6))
    oracle_555 = oracle_rows((5, 5, 5))
    return {
        "normalized_cegar_456_5row": normalized_target(
            "normalized_cegar_456_5row", cegar_rows, cegar_provenance
        ),
        "rabinowitsch_relative_cegar_456_5row": rabinowitsch_target(
            "rabinowitsch_relative_cegar_456_5row",
            cegar_rows,
            cegar_provenance,
            eliminate_translation=True,
        ),
        "rabinowitsch_absolute_cegar_456_5row": rabinowitsch_target(
            "rabinowitsch_absolute_cegar_456_5row",
            cegar_rows,
            cegar_provenance,
            eliminate_translation=False,
        ),
        "normalized_oracle_456_6row": normalized_target(
            "normalized_oracle_456_6row",
            oracle_456,
            {**source, "profile": [4, 5, 6], "origin": "metric_oracle_checkpoint"},
        ),
        "normalized_oracle_555_7row": normalized_target(
            "normalized_oracle_555_7row",
            oracle_555,
            {**source, "profile": [5, 5, 5], "origin": "metric_oracle_checkpoint"},
        ),
    }


if __name__ == "__main__":
    print(json.dumps({
        name: {
            "coordinate_model": target.coordinate_model,
            "variables": len(target.variables),
            "generators": len(target.generators),
            "row_set_sha256": canonical_sha256([row.encoded() for row in target.rows]),
            "generator_sha256": canonical_sha256(list(target.generators)),
        }
        for name, target in all_targets().items()
    }, indent=2, sort_keys=True))
