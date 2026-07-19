#!/usr/bin/env python3
"""Fail-closed audit of a generated invariant collision wrapper."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

import sympy as sp


ROW_NAME = re.compile(r"ROW_(\d+)_(\d+)_(\d+)")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def compact(text: str) -> str:
    return " ".join(text.split())


def point(
    index: int, symbols: dict[str, sp.Symbol]
) -> tuple[sp.Expr, sp.Expr]:
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


def lean_point(index: int, *, normalized: bool) -> str:
    if normalized and index == 0:
        return "(pt 0 0)"
    if normalized and index == 1:
        return "(pt 1 0)"
    return f"P{index}"


def lean_equality(name: str, *, normalized: bool) -> str:
    match = ROW_NAME.fullmatch(name)
    if match is None:
        raise AssertionError(f"malformed row name: {name}")
    center, left, right = (int(value) for value in match.groups())
    return (
        f"dist {lean_point(center, normalized=normalized)} "
        f"{lean_point(left, normalized=normalized)} = "
        f"dist {lean_point(center, normalized=normalized)} "
        f"{lean_point(right, normalized=normalized)}"
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("wrapper", type=Path)
    args = parser.parse_args()

    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    wrapper = args.wrapper.read_text(encoding="utf-8")
    wrapper_compact = compact(wrapper)
    assert certificate["coordinate_model"] == "p0_zero_p1_e1"

    generated_names: list[str] = []
    for row in certificate["rows"]:
        center = row["center"]
        base, *targets = row["support"]
        generated_names.extend(f"ROW_{center}_{base}_{target}" for target in targets)
    assert generated_names == certificate["generator_names"]

    symbol_names = sorted(
        set(re.findall(r"x(?:[2-9]|10|11)[xy]", " ".join(certificate["generators"])))
    )
    symbols = {name: sp.Symbol(name) for name in symbol_names}
    active: list[tuple[int, str]] = []
    for index, (name, encoded, multiplier) in enumerate(
        zip(
            certificate["generator_names"],
            certificate["generators"],
            certificate["multipliers"],
            strict=True,
        ),
        start=1,
    ):
        match = ROW_NAME.fullmatch(name)
        assert match is not None
        center, left, right = (int(value) for value in match.groups())
        expected = sp.expand(
            dist_sq(center, left, symbols) - dist_sq(center, right, symbols)
        )
        actual = sp.expand(sp.sympify(encoded, locals=symbols))
        assert sp.expand(expected - actual) == 0, name
        if multiplier.strip() not in {"0", "+0", "-0"}:
            active.append((index, name))

    assert len(active) == certificate["nonzero_multiplier_count"]
    for index, name in active:
        hypothesis = f"h{index:02d}"
        general = f"({hypothesis} : {lean_equality(name, normalized=False)})"
        normalized = f"({hypothesis} : {lean_equality(name, normalized=True)})"
        assert compact(general) in wrapper_compact, general
        assert compact(normalized) in wrapper_compact, normalized
        match = ROW_NAME.fullmatch(name)
        assert match is not None
        center, left, right = match.groups()
        closure = (
            f"{hypothesis} : Census554.EqualityCore.EdgeClosure P "
            f"(P{center}, P{left}) (P{center}, P{right})"
        )
        assert compact(closure) in wrapper_compact, closure

    assert re.search(r"\bsorry\b", wrapper) is None
    assert re.search(r"\badmit\b", wrapper) is None
    assert re.search(r"(?m)^\s*axiom\b", wrapper) is None
    print(
        json.dumps(
            {
                "active_generator_count": len(active),
                "certificate_sha256": sha256(args.certificate),
                "generator_count": len(certificate["generators"]),
                "row_count": len(certificate["rows"]),
                "status": "PASS",
                "wrapper_sha256": sha256(args.wrapper),
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
