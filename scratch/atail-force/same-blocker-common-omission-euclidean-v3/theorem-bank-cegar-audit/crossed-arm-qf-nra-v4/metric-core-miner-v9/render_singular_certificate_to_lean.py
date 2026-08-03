#!/usr/bin/env python3
"""Render C1=...; Singular multiplier files as Lean linear_combination fragments."""

from __future__ import annotations

import argparse
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    parser.add_argument("--hypotheses", nargs="+", required=True)
    args = parser.parse_args()

    coefficients = []
    for line in args.source.read_text().splitlines():
        line = line.strip()
        if not line:
            continue
        _, value = line.rstrip(";").split("=", 1)
        coefficients.append(value)
    if len(coefficients) != len(args.hypotheses):
        raise SystemExit(
            f"coefficient/hypothesis mismatch: {len(coefficients)} != {len(args.hypotheses)}"
        )

    rendered = ["linear_combination"]
    for index, (coefficient, hypothesis) in enumerate(zip(coefficients, args.hypotheses)):
        suffix = " +" if index + 1 < len(coefficients) else ""
        rendered.append(f"  ({coefficient}) * {hypothesis}{suffix}")
    args.destination.write_text("\n".join(rendered) + "\n")


if __name__ == "__main__":
    main()
