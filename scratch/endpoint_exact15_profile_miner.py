#!/usr/bin/env python3
"""Exact-n=15 first-cap profile diagnostic for the endpoint residual.

This reuses the audited seven-representative strict-Kalmanson abstraction from
``five_role_extended_packet_miner.py`` and adds only consequences of the
exact-(6,6,6) cap profile at the first apex O.

S6:  C,M,J,K,B all lie on the single rich O-circle.
D44: C,M,J lie on one rich O-circle, K,B lie on the other, and the two
     radii are distinct.

The output is a necessary-condition diagnostic, not a Lean proof.  Any UNSAT
result must still be promoted through the exact-fifteen profile theorem and a
kernel-checked Kalmanson consumer.
"""

from __future__ import annotations

import json
from pathlib import Path

import z3

import five_role_extended_packet_miner as base


OUT_JSON = Path("scratch/endpoint_exact15_profile_results.json")
OUT_MD = Path("scratch/endpoint_exact15_profile_report.md")


def add_profile(problem: base.Problem, profile: str) -> None:
    """Add the named equalities forced by one exact-fifteen apex profile."""
    if profile == "S6":
        problem.add("n15_S6_OK", problem.eqdist("O", "C", "K"))
        problem.add("n15_S6_OB", problem.eqdist("O", "C", "B"))
    elif profile == "D44":
        problem.add("n15_D44_KB", problem.eqdist("O", "K", "B"))
        problem.add("n15_D44_radii_ne", z3.Not(problem.eqdist("O", "C", "K")))
    else:
        raise ValueError(profile)


def solve(branch: str, residual: str, order: tuple[str, ...], profile: str) -> dict:
    problem = base.Problem(branch, order)
    add_profile(problem, profile)
    result = problem.result()
    return {
        "branch": branch,
        "residual": residual,
        "order": "".join(order),
        "profile": profile,
        "result": result,
    }


def main() -> None:
    rows = []
    for branch, data in base.BRANCHES.items():
        for residual in data["residuals"]:
            for order in base.inserted_orders(residual):
                for profile in ("S6", "D44"):
                    rows.append(solve(branch, residual, order, profile))

    counts: dict[str, dict[str, int]] = {}
    for row in rows:
        key = f'{row["branch"]}/{row["residual"]}/{row["profile"]}'
        status = row["result"]["status"]
        counts.setdefault(key, {})[status] = counts.setdefault(key, {}).get(status, 0) + 1

    payload = {
        "diagnostic_only": True,
        "solver": {"name": "Z3", "version": z3.get_version_string(), "logic": "QF_LRA"},
        "source_consequences": {
            "exact_cap": "At n=15 all three large caps have size 6 and first strict cap interior is exactly {C,M,K,B}.",
            "S6": "OC=OM=OJ=OK=OB.",
            "D44": "OC=OM=OJ, OK=OB, and OC != OK.",
        },
        "omissions": [
            "No Euclidean coordinates or full 15-point completion.",
            "No second/third-cap profile constraints.",
            "No anonymous outer support points or explicit deletion-row overlap variables.",
            "UNSAT cores are tracked Z3 cores, not independently checked certificates.",
        ],
        "counts": counts,
        "rows": rows,
    }
    OUT_JSON.write_text(json.dumps(payload, indent=2) + "\n")

    report = [
        "# Exact-n=15 endpoint apex-profile diagnostic",
        "",
        "**Status: necessary-condition solver diagnostic only; not Lean closure.**",
        "",
        "This adds the exact first-apex S6/D44 radius consequences to the audited",
        "seven-representative strict-Kalmanson endpoint abstraction.",
        "",
        "## Census",
        "",
    ]
    for key in sorted(counts):
        status = ", ".join(f"{name}={count}" for name, count in sorted(counts[key].items()))
        report.append(f"- `{key}`: {status}")
    survivors = [r for r in rows if r["result"]["status"] != "UNSAT"]
    report += [
        "",
        f"Non-UNSAT lanes: **{len(survivors)} / {len(rows)}**.",
        "",
        "## Scope",
        "",
    ]
    report += [f"- {item}" for item in payload["omissions"]]
    report += [
        "",
        "Source anchors: `ATail/ExactFifteenApexProfile.lean` and the endpoint",
        "packet theorems cited by `five_role_extended_packet_report.md`.",
        "",
        f"Machine-readable artifact: `{OUT_JSON}`.",
    ]
    OUT_MD.write_text("\n".join(report) + "\n")

    print(OUT_MD)
    print(OUT_JSON)
    print(f"rows={len(rows)} non_unsat={len(survivors)}")
    for key in sorted(counts):
        print(key, counts[key])


if __name__ == "__main__":
    main()
