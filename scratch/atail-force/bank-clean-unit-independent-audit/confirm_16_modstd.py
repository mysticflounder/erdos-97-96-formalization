#!/usr/bin/env python3
"""Exact modular Singular arbitration of the 16-equation proposal."""

from __future__ import annotations

import json

import sympy as sp

import audit
import confirm_16
import minimize_core as core


def script(variables: list[sp.Symbol], polynomials: list[sp.Expr]) -> str:
    names = ",".join(str(variable) for variable in variables)
    rows = ",\n  ".join(
        sp.sstr(sp.expand(polynomial)).replace("**", "^")
        for polynomial in polynomials
    )
    return "\n".join(
        [
            'LIB "modstd.lib";',
            f"ring R=0,({names}),dp;",
            f"ideal I={rows};",
            "ideal G=modGB(\"slimgb\",I,1);",
            'if (size(G)==1 and G[1]==1) { print("STATUS_UNIT"); }',
            'else { print("STATUS_NONUNIT"); print("DIM="+string(dim(G))); }',
            "quit;",
            "",
        ]
    )


def main() -> None:
    variables, full = core.build()
    by_id = {str(g["id"]): g for g in full}
    selected = [by_id[name] for name in confirm_16.IDS]
    used = set().union(*(g["polynomial"].free_symbols for g in selected))
    active = [variable for variable in variables if variable in used]
    source = core.HERE / "target_16_modstd.sing"
    source.write_text(script(active, [g["polynomial"] for g in selected]))
    result = audit.run(["Singular", "-q", str(source)], timeout=600)
    result["verdict"] = audit.singular_verdict(str(result.get("stdout", "")))
    report = {
        "checkpoint_row_sha256": audit.EXPECTED_ROW_HASH,
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "active_variables": [str(variable) for variable in active],
        "generator_sha256": core.generator_hash(selected),
        "polynomial_sha256": core.polynomial_hash(selected),
        "algorithm": "Singular 4.4.1 modGB slimgb exactness=1 over QQ, dp order",
        "singular": result,
        "generators": [
            {"id": str(g["id"]), "polynomial": str(g["polynomial"])}
            for g in selected
        ],
    }
    (core.HERE / "confirm_16_modstd.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({"verdict": result["verdict"], "seconds": result["seconds"]}), flush=True)


if __name__ == "__main__":
    main()
