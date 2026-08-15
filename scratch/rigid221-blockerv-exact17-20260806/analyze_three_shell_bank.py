#!/usr/bin/env python3
"""Compare the checked literal schema bank with the complete orbit census."""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent


def load(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


classifier = load("classify_three_shell_schemas", HERE / "classify_three_shell_schemas.py")
cegar = load("exact17_fullcover_cegar", HERE / "exact17_fullcover_cegar.py")


def tuple_pattern(value):
    return tuple(tuple(atom) for atom in value)


def main() -> int:
    bank_by_n: dict[int, list[tuple]] = {4: [], 5: [], 6: []}
    for n, pattern in cegar.THREE_SHELL_SCHEMAS:
        bank_by_n[n].append(classifier.canonical_pattern(n, pattern))

    report = {}
    for n in (4, 5, 6):
        census = json.loads((HERE / f"three-shell-classification-n{n}.json").read_text())
        census_orbits = {tuple_pattern(pattern) for pattern in census["orbit_representatives"]}
        census_literals = {
            tuple_pattern(pattern) for pattern in census["irreducible_unsat_patterns"]
        }
        bank_orbits = set(bank_by_n[n])
        bank_literals = {
            tuple(sorted(classifier.canonical_atom(*atom) for atom in pattern))
            for arity, pattern in cegar.THREE_SHELL_SCHEMAS
            if arity == n
        }
        census_rotation_orbits = {
            classifier.canonical_rotation(n, pattern) for pattern in census_literals
        }
        bank_rotation_orbits = {
            classifier.canonical_rotation(n, pattern) for pattern in bank_literals
        }
        report[str(n)] = {
            "literal_bank_entries": len(bank_by_n[n]),
            "literal_bank_unique": len(bank_literals),
            "census_literals": len(census_literals),
            "missing_literals": len(census_literals - bank_literals),
            "census_rotation_orbits": len(census_rotation_orbits),
            "bank_rotation_orbits": len(bank_rotation_orbits),
            "missing_rotation_orbits": sorted(
                census_rotation_orbits - bank_rotation_orbits
            ),
            "bank_orbits": len(bank_orbits),
            "census_orbits": len(census_orbits),
            "missing_orbits": sorted(census_orbits - bank_orbits),
            "extra_orbits": sorted(bank_orbits - census_orbits),
        }
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
