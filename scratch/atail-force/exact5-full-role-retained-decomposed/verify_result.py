#!/usr/bin/env python3
"""Independent replay for a decomposed exact-five SAT shadow."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FULL_GATE = ROOT / "scratch/atail-force/exact5-full-role-retained-gate"
sys.path.insert(0, str(FULL_GATE))

sys.path.insert(0, str(HERE))
from decision import verify_complete_class_geometry  # noqa: E402
from exact5_full_role_retained_gate_decision import (  # noqa: E402
    verify_focus,
    verify_metric,
)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("result", type=Path)
    args = parser.parse_args()
    data = json.loads(args.result.read_text())
    if data.get("status") != "SAT":
        raise SystemExit(f"not a SAT result: {data.get('status')}")
    errors = verify_focus(data["decoded"])
    errors.extend(verify_complete_class_geometry(data["decoded"]))
    errors.extend(verify_metric(data["decoded"], data["distances"]))
    if errors:
        for error in errors:
            print(error)
        raise SystemExit(1)
    print("VERIFIED decomposed exact-five card-13 ordered-distance shadow")


if __name__ == "__main__":
    main()
