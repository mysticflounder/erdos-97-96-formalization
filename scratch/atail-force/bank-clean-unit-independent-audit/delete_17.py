#!/usr/bin/env python3
"""Exact single-generator deletion audit for the 17-equality UNIT core."""

from __future__ import annotations

import json
import tempfile
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any

import sympy as sp

import audit
import confirm_17
import minimize_core as core


HERE = Path(__file__).resolve().parent


def reconstruct() -> tuple[list[sp.Symbol], list[dict[str, Any]]]:
    terminal = json.loads(audit.CHECKPOINT.read_text())
    assert audit.compact_hash(terminal["witness"]["rows"]) == audit.EXPECTED_ROW_HASH
    rows = {
        str(row["center"]): set(row["support"])
        for row in terminal["witness"]["rows"]
    }
    coords = {
        role: (sp.Symbol(f"{role}x"), sp.Symbol(f"{role}y"))
        for role in audit.ROLES
    }
    gauge = {
        coords["O"][0]: sp.Integer(0),
        coords["O"][1]: sp.Integer(0),
        coords["A"][0]: sp.Integer(1),
        coords["A"][1]: sp.Integer(0),
    }

    def d2(center: str, point: str) -> sp.Expr:
        cx, cy = coords[center]
        px, py = coords[point]
        return (px - cx) ** 2 + (py - cy) ** 2

    generators: list[dict[str, Any]] = []
    for name, center, left, right in confirm_17.SPECS:
        assert left in rows[center] and right in rows[center]
        generators.append(
            {
                "name": name,
                "center": center,
                "left": left,
                "right": right,
                "polynomial": sp.expand(
                    (d2(center, left) - d2(center, right)).subs(gauge)
                ),
            }
        )
    variable_roles = [
        role
        for role, _index in sorted(
            confirm_17.NUMERIC_ROLE_MAP.items(), key=lambda item: item[1]
        )
        if role not in {"O", "A"}
    ]
    variables = [coordinate for role in variable_roles for coordinate in coords[role]]
    return variables, generators


def singular_slimgb(
    variables: list[sp.Symbol], generators: list[dict[str, Any]], timeout: float = 120
) -> dict[str, Any]:
    names = ",".join(str(variable) for variable in variables)
    polynomials = ",\n  ".join(
        sp.sstr(sp.expand(generator["polynomial"])).replace("**", "^")
        for generator in generators
    )
    script = "\n".join(
        [
            f"ring R=0,({names}),dp;",
            f"ideal I={polynomials};",
            "ideal G=slimgb(I);",
            "poly remainder=reduce(1,G);",
            'if (remainder==0) { print("STATUS_UNIT"); }',
            'else { print("STATUS_NONUNIT"); }',
            "quit;",
            "",
        ]
    )
    with tempfile.TemporaryDirectory(prefix="p97-delete17-singular-") as temp:
        source = Path(temp) / "input.sing"
        source.write_text(script)
        result = audit.run(["Singular", "-q", str(source)], timeout=timeout)
    result["verdict"] = audit.singular_verdict(str(result.get("stdout", "")))
    return result


def compact_polynomial_hash(generators: list[dict[str, Any]]) -> str:
    return core.polynomial_hash(generators)


def main() -> None:
    variables, generators = reconstruct()
    audit.solver_smokes()
    full = singular_slimgb(variables, generators)
    if full["verdict"] != "UNIT":
        raise RuntimeError(f"17-equality bootstrap is not UNIT: {full}")

    checks: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=4) as pool:
        futures = {}
        for generator in generators:
            trial = [g for g in generators if g["name"] != generator["name"]]
            future = pool.submit(singular_slimgb, variables, trial)
            futures[future] = (generator, trial)
        for future in as_completed(futures):
            generator, trial = futures[future]
            singular = future.result()
            check = {
                "deleted": generator["name"],
                "remaining_count": len(trial),
                "remaining_polynomial_sha256": compact_polynomial_hash(trial),
                "singular": singular,
            }
            checks.append(check)
            print(
                generator["name"],
                singular["verdict"],
                f"{singular['seconds']:.3f}s",
                flush=True,
            )
    order = {generator["name"]: index for index, generator in enumerate(generators)}
    checks.sort(key=lambda item: order[item["deleted"]])

    unit_deletions = [check for check in checks if check["singular"]["verdict"] == "UNIT"]
    crosschecks: list[dict[str, Any]] = []
    for check in unit_deletions:
        trial = [g for g in generators if g["name"] != check["deleted"]]
        msolve = core.msolve_pair(variables, trial)
        crosschecks.append(
            {
                "deleted": check["deleted"],
                "polynomial_sha256": compact_polynomial_hash(trial),
                "msolve": msolve,
            }
        )
        print(
            "crosscheck",
            check["deleted"],
            core.verdict_pair(msolve),
            flush=True,
        )

    report = {
        "schema": "p97-bank-clean-17-equality-single-deletion-audit-v1",
        "checkpoint_row_sha256": audit.EXPECTED_ROW_HASH,
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "variable_order": [str(variable) for variable in variables],
        "bootstrap": full,
        "checks": checks,
        "unit_deletion_count": len(unit_deletions),
        "unit_deletion_crosschecks": crosschecks,
        "deletion_minimal_in_singular": len(unit_deletions) == 0,
        "warning": "single deletions only; not an exhaustive search over alternative equality bases",
    }
    (HERE / "deletion_17.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "unit_deletions": [check["deleted"] for check in unit_deletions],
                "nonunit": sum(
                    check["singular"]["verdict"] == "NONUNIT" for check in checks
                ),
                "timeouts_or_unknown": sum(
                    check["singular"]["verdict"] not in {"UNIT", "NONUNIT"}
                    for check in checks
                ),
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
