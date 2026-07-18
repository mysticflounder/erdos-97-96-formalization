#!/usr/bin/env python3
"""Regenerate every orbit CNF and replay the compact saved SAT assignments."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from encode import ORBITS, PHYSICAL_CAP, build_payload
from orbit_census import parse_clauses


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    args = parser.parse_args()
    payload = json.loads(args.input.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact6-allcenter-structural-orbit-census-v1":
        raise ValueError("orbit census schema drift")
    by_orbit = {row["orbit"]: row for row in payload["results"]}
    if set(by_orbit) != set(ORBITS):
        raise ValueError("orbit coverage mismatch")
    for orbit in ORBITS:
        row = by_orbit[orbit]
        if row["status"] != "SAT_ASSIGNMENT_REPLAYED":
            raise ValueError(f"{orbit} has no replayable SAT assignment")
        dimacs, manifest = build_payload("n14", orbit)
        if row["cnf_sha256"] != manifest["cnf_sha256"]:
            raise ValueError(f"{orbit} CNF digest drift")
        true_names = set(row["true_variables"])
        variables = manifest["variables"]
        if not true_names <= set(variables):
            raise ValueError(f"{orbit} model names unknown variables")
        assignment = {
            variable: name in true_names for name, variable in variables.items()
        }
        for index, clause in enumerate(parse_clauses(dimacs), start=1):
            if not any(assignment[abs(literal)] == (literal > 0) for literal in clause):
                raise ValueError(f"{orbit} fails regenerated clause {index}")
        unused = row["decoded"]["roles"]["unused"]
        if unused not in PHYSICAL_CAP or unused in row["decoded"]["shell"]:
            raise ValueError(f"{orbit} violates corrected unused source domain")
    print(json.dumps({
        "status": "SEVEN_ORBIT_REGENERATION_REPLAY_PASS",
        "orbits": len(ORBITS),
        "all_sat": True,
        "unused_domain_checked": sorted(PHYSICAL_CAP),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
