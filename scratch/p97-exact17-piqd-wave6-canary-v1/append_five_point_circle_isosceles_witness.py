#!/usr/bin/env python3
"""Append one authenticated five-point circle-isosceles consumer instance.

This is a narrow schema adapter over the audited direct five-point appender.
It emits one witnessed lazy exact-17 refinement, not an orbit, coverage result,
or universal P97 closure.
"""

from __future__ import annotations

import importlib.util
import itertools
import sys
from pathlib import Path
from types import ModuleType

HERE = Path(__file__).resolve().parent
BASE_APPENDER = HERE / "append_five_point_direct_consumer_witness.py"
LEAN_SOURCE_RELATIVE = (
    "lean/Erdos9796Proof/P97/Census554/FivePointCircleIsoscelesOrderBridge.lean"
)
LEAN_CONSUMER = (
    "Problem97.Census554.FivePointCircleIsoscelesOrderBridge."
    "false_of_two_selected_rows_of_ccw"
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
    """Find W<F<P<X<Z with W:{F,X,Z} and Z:{P,X}."""
    found = []
    for w, f, p, x, z in itertools.combinations(order, 5):
        atoms = ((w, f), (w, x), (w, z), (z, p), (z, x))
        if all(point in rows[center] for center, point in atoms):
            found.append(((w, f, p, x, z), atoms))
    return tuple(found)


def main() -> int:
    base = load_base()
    base.LEAN_SOURCE = base.REPO / LEAN_SOURCE_RELATIVE
    base.LEAN_CONSUMER = LEAN_CONSUMER
    base.find_occurrences = find_occurrences
    write_json = base.atomic_json

    def write_circle_isosceles_receipt(path, payload):
        if not isinstance(payload, dict):
            raise TypeError("unexpected non-object receipt")
        payload["schema"] = "p97-exact17-five-point-circle-isosceles-witness/v1"
        payload["warning"] = (
            "This appends one exact-17 instance of the cardinality-generic "
            "circle-isosceles Lean consumer; it is not exact-17 coverage or "
            "universal P97 closure."
        )
        payload["adapter"] = "circle-isosceles-schema-over-direct-appender"
        payload["source_hashes"][
            str(Path(__file__).resolve().relative_to(base.REPO))
        ] = base.sha256(Path(__file__).resolve())
        write_json(path, payload)

    base.atomic_json = write_circle_isosceles_receipt
    return base.main()


if __name__ == "__main__":
    raise SystemExit(main())
