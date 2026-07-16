#!/usr/bin/env python3
"""Test the simultaneous deletion of the two fast UNIT generators."""

from __future__ import annotations

import json

import delete_17
import minimize_core as core


DELETED = ("ROW_K_O_I", "ROW_Y_O_E")


def main() -> None:
    variables, generators = delete_17.reconstruct()
    retained = [g for g in generators if g["name"] not in DELETED]
    assert len(retained) == 15
    singular = delete_17.singular_slimgb(variables, retained, 180)
    msolve = core.msolve_pair(variables, retained)
    report = {
        "deleted": list(DELETED),
        "remaining_count": len(retained),
        "remaining_polynomial_sha256": core.polynomial_hash(retained),
        "generators": [
            {"name": str(g["name"]), "polynomial": str(g["polynomial"])}
            for g in retained
        ],
        "singular": singular,
        "msolve": msolve,
        "crosscheck": [singular["verdict"], *core.verdict_pair(msolve)],
    }
    (core.HERE / "confirm_15_from17.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({"sha256": report["remaining_polynomial_sha256"], "verdicts": report["crosscheck"]}), flush=True)


if __name__ == "__main__":
    main()
