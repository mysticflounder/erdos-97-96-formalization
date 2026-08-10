#!/usr/bin/env python3
"""Append one authenticated instance of the second five-point consumer.

This is a narrow schema adapter over the already-audited direct five-point
appender.  It changes only the selected-row antecedent and Lean consumer,
while retaining the direct appender's root, model, variable-map, and receipt
checks.  The emitted clause is one lazy exact-17 refinement, not coverage.
"""

from __future__ import annotations

import importlib.util
import itertools
import sys
from pathlib import Path
from types import ModuleType

HERE = Path(__file__).resolve().parent
BASE_APPENDER = HERE / "append_five_point_direct_consumer_witness.py"
LEAN_CONSUMER = (
    "Problem97.FivePointEuclideanObstruction."
    "false_of_five_ccw_second_two_selected_rows"
)


def load_base() -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "exact17_five_point_direct_appender_base", BASE_APPENDER
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {BASE_APPENDER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def find_occurrences(order, rows):
    """Find a<b<c<d<e with d:{a,c,e} and e:{a,b}."""
    found = []
    for a, b, c, d, e in itertools.combinations(order, 5):
        atoms = ((d, a), (d, c), (d, e), (e, a), (e, b))
        if all(point in rows[center] for center, point in atoms):
            found.append(((a, b, c, d, e), atoms))
    return tuple(found)


def main() -> int:
    base = load_base()
    base.LEAN_CONSUMER = LEAN_CONSUMER
    base.find_occurrences = find_occurrences
    write_json = base.atomic_json

    def write_second_receipt(path, payload):
        if not isinstance(payload, dict):
            raise TypeError("unexpected non-object receipt")
        payload["schema"] = "p97-exact17-five-point-second-consumer-witness/v1"
        payload["warning"] = (
            "This appends one exact-17 instance of the cardinality-generic "
            "second-orientation five-point Lean consumer; it is not exact-17 "
            "coverage or universal P97 closure."
        )
        payload["adapter"] = "second-five-point-schema-over-direct-appender"
        payload["source_hashes"][str(Path(__file__).resolve().relative_to(base.REPO))] = (
            base.sha256(Path(__file__).resolve())
        )
        write_json(path, payload)

    base.atomic_json = write_second_receipt
    return base.main()


if __name__ == "__main__":
    raise SystemExit(main())
