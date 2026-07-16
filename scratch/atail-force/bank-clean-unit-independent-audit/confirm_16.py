#!/usr/bin/env python3
"""Singular arbiter for the first independent 16-equality msolve proposal."""

from __future__ import annotations

import json

import minimize_core as core


IDS = (
    "ambient_O:O:E=A",
    "row_A:A:G=C",
    "row_A:A:K=C",
    "row_A:A:O=C",
    "row_F:F:K=A",
    "row_F:F:Z=A",
    "row_G:G:F=E",
    "row_G:G:K=E",
    "row_G:G:X=E",
    "row_K:K:O=G",
    "row_K:K:Y=G",
    "row_X:X:G=F",
    "row_Y:Y:O=E",
    "row_Y:Y:X=E",
    "row_Y:Y:Z=E",
    "row_Z:Z:G=A",
)
EXPECTED_POLYNOMIAL_SHA256 = (
    "a7c2e40011a592c6497796519c6d610c304d653c27526c1277cb43cef11e6d5c"
)


def main() -> None:
    variables, full = core.build()
    by_id = {str(g["id"]): g for g in full}
    selected = [by_id[name] for name in IDS]
    assert len(selected) == 16
    assert core.polynomial_hash(selected) == EXPECTED_POLYNOMIAL_SHA256
    used_symbols = set().union(*(g["polynomial"].free_symbols for g in selected))
    active_variables = [variable for variable in variables if variable in used_symbols]
    singular = core.singular_one(active_variables, selected, 600)
    msolve = core.msolve_pair(active_variables, selected)
    report = {
        "checkpoint_row_sha256": core.audit.EXPECTED_ROW_HASH,
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "active_variables": [str(variable) for variable in active_variables],
        "generator_sha256": core.generator_hash(selected),
        "polynomial_sha256": core.polynomial_hash(selected),
        "generators": [
            {
                "id": str(g["id"]),
                "polynomial": str(g["polynomial"]),
            }
            for g in selected
        ],
        "singular": singular,
        "msolve": msolve,
    }
    (core.HERE / "confirm_16.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "singular": singular["verdict"],
                "msolve_forward": msolve["forward"]["verdict"],
                "msolve_reverse": msolve["reverse"]["verdict"],
                "generator_sha256": report["generator_sha256"],
                "polynomial_sha256": report["polynomial_sha256"],
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
