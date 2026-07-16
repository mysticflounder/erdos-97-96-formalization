#!/usr/bin/env python3
"""Crosscheck the 16-generator proposal in the standard A,C gauge."""

from __future__ import annotations

import json

import confirm_16
import minimize_core as core


def main() -> None:
    variables, full = core.build(("A", "C"))
    by_id = {str(g["id"]): g for g in full}
    selected = [by_id[name] for name in confirm_16.IDS]
    used = set().union(*(g["polynomial"].free_symbols for g in selected))
    active = [variable for variable in variables if variable in used]
    msolve = core.msolve_pair(active, selected)
    print("msolve", core.verdict_pair(msolve), flush=True)
    # Reverse order first: forward O,A gauge was the slow Singular order.
    singular = core.singular_one(list(reversed(active)), selected, 600)
    report = {
        "checkpoint_row_sha256": core.audit.EXPECTED_ROW_HASH,
        "gauge": {"A": [0, 0], "C": [1, 0]},
        "active_variables": [str(v) for v in active],
        "generator_sha256": core.generator_hash(selected),
        "polynomial_sha256": core.polynomial_hash(selected),
        "generators": [
            {"id": str(g["id"]), "polynomial": str(g["polynomial"])}
            for g in selected
        ],
        "singular_reverse_variables": singular,
        "msolve": msolve,
    }
    (core.HERE / "confirm_ac16.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "singular": singular["verdict"],
                "msolve": list(core.verdict_pair(msolve)),
                "polynomial_sha256": report["polynomial_sha256"],
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
