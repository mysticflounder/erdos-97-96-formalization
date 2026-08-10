#!/usr/bin/env python3
"""Convert a complete CaDiCaL model log to the gate's compact JSON format."""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--variables", type=int, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    literals = [
        int(token)
        for line in args.input.read_text().splitlines()
        if line.startswith("v ")
        for token in line.split()[1:]
        if token != "0"
    ]
    assignment = {abs(literal): literal for literal in literals}
    expected = set(range(1, args.variables + 1))
    if len(literals) != args.variables or set(assignment) != expected:
        raise ValueError("CaDiCaL model is not a total exact assignment")
    ordered = [assignment[variable] for variable in range(1, args.variables + 1)]

    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8") as handle:
        json.dump({"model": ordered, "vars": args.variables}, handle, indent=2)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
