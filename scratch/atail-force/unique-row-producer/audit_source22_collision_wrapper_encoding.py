#!/usr/bin/env python3
"""Fail-closed encoding audit for the source-22 invariant Lean wrapper."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
CERT_PATH = HERE / "unit_core_source_indexed_654_22_certificate.json"
LEAN_PATH = HERE / "unit_core_source_indexed_654_22_collision.lean"

EXPECTED_ACTIVE = {
    "ROW_1_0_4": "(h01 : dist P1 P0 = dist P1 P4)",
    "ROW_1_0_10": "(h03 : dist P1 P0 = dist P1 P10)",
    "ROW_2_1_3": "(h04 : dist P2 P1 = dist P2 P3)",
    "ROW_3_1_4": "(h07 : dist P3 P1 = dist P3 P4)",
    "ROW_3_1_9": "(h08 : dist P3 P1 = dist P3 P9)",
    "ROW_4_2_7": "(h11 : dist P4 P2 = dist P4 P7)",
    "ROW_4_2_9": "(h12 : dist P4 P2 = dist P4 P9)",
    "ROW_7_1_2": "(h13 : dist P7 P1 = dist P7 P2)",
    "ROW_7_1_3": "(h14 : dist P7 P1 = dist P7 P3)",
    "ROW_7_1_4": "(h15 : dist P7 P1 = dist P7 P4)",
    "ROW_7_1_10": "(h16 : dist P7 P1 = dist P7 P10)",
    "ROW_10_0_1": "(h17 : dist P10 P0 = dist P10 P1)",
    "ROW_10_0_9": "(h19 : dist P10 P0 = dist P10 P9)",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def compact(text: str) -> str:
    return " ".join(text.split())


def point(index: int, symbols: dict[str, sp.Symbol]) -> tuple[sp.Expr, sp.Expr]:
    if index == 0:
        return sp.Integer(0), sp.Integer(0)
    if index == 1:
        return sp.Integer(1), sp.Integer(0)
    return symbols[f"x{index}x"], symbols[f"x{index}y"]


def dist_sq(
    left: int, right: int, symbols: dict[str, sp.Symbol]
) -> sp.Expr:
    lx, ly = point(left, symbols)
    rx, ry = point(right, symbols)
    return sp.expand((lx - rx) ** 2 + (ly - ry) ** 2)


def main() -> None:
    cert = json.loads(CERT_PATH.read_text())
    lean = LEAN_PATH.read_text()
    lean_compact = compact(lean)

    assert cert["coordinate_model"] == "p0_zero_p1_e1"
    assert len(cert["generator_names"]) == len(cert["generators"])
    assert len(cert["generator_names"]) == len(cert["multipliers"])

    generated_names: list[str] = []
    for row in cert["rows"]:
        center = row["center"]
        base, *targets = row["support"]
        generated_names.extend(f"ROW_{center}_{base}_{target}" for target in targets)
    assert generated_names == cert["generator_names"]

    active_names = [
        name
        for name, multiplier in zip(
            cert["generator_names"], cert["multipliers"], strict=True
        )
        if multiplier.strip() not in {"0", "+0", "-0"}
    ]
    assert active_names == list(EXPECTED_ACTIVE)

    symbol_names = sorted(
        set(re.findall(r"x(?:[2-9]|10|11)[xy]", " ".join(cert["generators"])))
    )
    symbols = {name: sp.Symbol(name) for name in symbol_names}
    for name, encoded in zip(
        cert["generator_names"], cert["generators"], strict=True
    ):
        _, center_text, base_text, target_text = name.split("_")
        expected = sp.expand(
            dist_sq(int(center_text), int(base_text), symbols)
            - dist_sq(int(center_text), int(target_text), symbols)
        )
        actual = sp.expand(sp.sympify(encoded, locals=symbols))
        assert sp.expand(expected - actual) == 0, name

    for fragment in EXPECTED_ACTIVE.values():
        assert compact(fragment) in lean_compact, fragment

    assert re.search(r"\bsorry\b", lean) is None
    assert re.search(r"\badmit\b", lean) is None
    assert re.search(r"(?m)^\s*axiom\b", lean) is None

    print(
        json.dumps(
            {
                "active_generator_count": len(active_names),
                "active_generators": active_names,
                "certificate_sha256": sha256(CERT_PATH),
                "lean_wrapper_sha256": sha256(LEAN_PATH),
                "row_count": len(cert["rows"]),
                "status": "PASS",
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
