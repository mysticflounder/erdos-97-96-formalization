#!/usr/bin/env python3
"""L1a enumerator: retained first-apex row on the named base (DESIGN-L1.md
step 3).  All-fresh (no e/p roles — sound relaxation, kills are universal
across every identification-layer survivor).

Roles q,w,c1,c2 form the retained row: a SelectedFourClass at EA
(row_eqs, equalities only — the support is a 4-subset of the ambient
class, never complete).  Discrete landing filters, each cited:

- q,w ∉ closed surplus cap and q,w ∈ closed physical ∨ O1-bag
  (`q/w_mem_marginal`, `q_role`/`w_role`); physical landings are named
  identifications (Round 188);
- row ∩ closed physical ≤ 1 and row ∩ closed surplus ≤ 1 (one-hit
  region facts, DESIGN-L1.md) — so ≥2 members in the O1 bag, subsuming
  `retainedInterior₁/₂` and `one_frontier_source_strict`;
- the class-O tooth (at most one of q,w in class(O)) is automatic here:
  no pattern lands both q,w on named cap points.

Completion sites: O1 bag, S bag, the point O, or one named physical-cap
point (`retainedRow_role_cover` + one-hit budgets).  q,w symmetric and
c1,c2 symmetric: patterns are unordered (named landing assigned to q/c1).
"""

from __future__ import annotations

import json
import sys
from itertools import combinations_with_replacement
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from regions import onehit_rad_ne  # noqa: E402

CAP_INTERIOR = ["s0", "b0", "s1", "b1", "s2"]
NAMED6 = ["W"] + CAP_INTERIOR
SURPLUS_SITES = {"S", "O"}
TIMEOUT_MS = 300_000

ROWS = (
    ("b0", ["s0", "s1"]),
    ("b1", ["s1", "s2"]),
    ("s1", ["s2", "s0"]),
)


def qw_patterns() -> list[tuple[str, str]]:
    return [("O1", "O1")] + [(n, "O1") for n in NAMED6]


def c_patterns(physical_free: bool) -> list[tuple[str, str]]:
    sites = ["O1", "S", "O"] + NAMED6
    result = []
    for pair in combinations_with_replacement(sites, 2):
        surplus = sum(1 for s in pair if s in SURPLUS_SITES)
        physical = sum(1 for s in pair if s in NAMED6)
        if surplus > 1 or physical > (1 if physical_free else 0):
            continue
        result.append(pair)
    return result


def build_schema(qw: tuple[str, str], cc: tuple[str, str]) -> dict:
    schema_id = "L1a.qw{}-{}.c{}-{}".format(*qw, *cc)
    bags: dict[str, list[str]] = {"S": [], "O1": []}
    points = ["EA", "O", "W"] + CAP_INTERIOR
    placement = {p: p for p in points}

    def land(role: str, site: str) -> str:
        if site in ("EA", "W", "O") or site in CAP_INTERIOR:
            return site
        bags[site].append(role)
        points.append(role)
        placement[role] = site
        return role

    row = [land(r, s) for r, s in zip(("q", "w", "c1", "c2"), qw + cc)]
    assert len(set(row)) == 4, schema_id

    point_set = set(points)
    o_class = ["s0", "s1", "s2"]
    exact_classes = [
        {
            "center": "O",
            "members": o_class,
            "exclude": sorted(point_set - {"O"} - set(o_class)),
        }
    ]
    for center, members in ROWS:
        exact_classes.append(
            {
                "center": center,
                "members": members,
                "exclude": sorted(point_set - {center} - set(members)),
            }
        )

    return {
        "id": schema_id,
        "points": points,
        "blocks": [
            {"points": ["EA"], "ordered": True},
            {"points": bags["S"], "ordered": False},
            {"points": ["O"], "ordered": True},
            {"points": bags["O1"], "ordered": False},
            {"points": ["W"], "ordered": True},
            {"points": CAP_INTERIOR, "ordered": True},
        ],
        "exact_classes": exact_classes,
        "row_eqs": [{"name": "ret", "center": "EA", "members": row}],
        "rad_ne": onehit_rad_ne(placement),
        "unique_class": [{"center": "O", "members": o_class}],
        "timeout_ms": TIMEOUT_MS,
    }


def main() -> None:
    schemas = []
    for qw in qw_patterns():
        for cc in c_patterns(physical_free=(qw[0] == "O1")):
            schemas.append(build_schema(qw, cc))
    assert len({s["id"] for s in schemas}) == len(schemas)
    output = HERE / "l1a_schemas.json"
    output.write_text(json.dumps(schemas, indent=1))
    print(f"output={output} n={len(schemas)}")


if __name__ == "__main__":
    main()
