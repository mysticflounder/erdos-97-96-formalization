#!/usr/bin/env python3
"""L1b enumerator: retained + double first-apex rows with the radius split
(DESIGN-L1.md step 4).  Builds on every L1a pattern (all 39 are SAT).

Double row {g1..g4}: SelectedFourClass at EA excluding q,w
(`doubleRow_subset_doubleErase`), role cover as the retained row.  Site
profile: at most one named physical-cap member (dpc), at most one
closed-surplus member (dsc ∈ S bag or the point O), rest in the O1 bag
(one-hit budgets per radius class).

Radius split (`sameRadius_six` / `distinctRadius_disjoint`):

- "ne" arm: rows disjoint.  Discrete image of one-point-one-EA-distance:
  the double row shares no point with the retained row, so its named
  landings avoid every retained named landing; budgets are per row.
- "eq" arm: both rows in ONE ambient radius class, so the one-hit budgets
  are JOINT over the union.  Sharing a named completion point of the
  retained row is allowed (the packet does not forbid shared completions);
  sharing q,w is forbidden; sharing fresh bag points is an identification
  (merge layer, not all-fresh).
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from enumerate_l1a import (  # noqa: E402
    CAP_INTERIOR,
    NAMED6,
    TIMEOUT_MS,
    build_schema,
    c_patterns,
    qw_patterns,
)
from regions import onehit_rad_ne  # noqa: E402


def double_profiles(
    qw: tuple[str, str], cc: tuple[str, str], arm: str
) -> list[tuple[str, str]]:
    retained_named = {s for s in qw + cc if s in NAMED6}
    retained_c_named = {s for s in cc if s in NAMED6}
    retained_has_o = "O" in cc
    retained_has_sbag = "S" in cc

    if arm == "ne":
        pc_options = ["none"] + [n for n in NAMED6 if n not in retained_named]
        sc_options = ["none", "S"] + ([] if retained_has_o else ["O"])
    else:
        # joint physical budget: a second physical point is allowed only as
        # the retained row's own named completion (shared member)
        pc_options = ["none"] + sorted(retained_c_named)
        if retained_has_sbag:
            sc_options = ["none"]
        elif retained_has_o:
            sc_options = ["none", "O"]
        else:
            sc_options = ["none", "S", "O"]
    return [(pc, sc) for pc in pc_options for sc in sc_options]


def build_l1b(
    qw: tuple[str, str], cc: tuple[str, str], profile: tuple[str, str], arm: str
) -> dict:
    schema = build_schema(qw, cc)
    dpc, dsc = profile
    schema_id = f"{schema['id']}.d{dpc}-{dsc}.{arm}"

    points = list(schema["points"])
    blocks = [dict(b, points=list(b["points"])) for b in schema["blocks"]]
    placement = {
        p: p for p in ["EA", "O", "W"] + CAP_INTERIOR
    } | {p: "S" for p in blocks[1]["points"]} | {p: "O1" for p in blocks[3]["points"]}

    retained_row = schema["row_eqs"][0]["members"]
    double_row: list[str] = []
    fresh_index = 1

    def land_bag(site: str) -> str:
        nonlocal fresh_index
        role = f"g{fresh_index}"
        fresh_index += 1
        points.append(role)
        block = blocks[1] if site == "S" else blocks[3]
        block["points"].append(role)
        placement[role] = site
        return role

    if dpc != "none":
        double_row.append(dpc)  # named physical point (shared in eq arm)
    if dsc == "O":
        double_row.append("O")
    elif dsc == "S":
        double_row.append(land_bag("S"))
    while len(double_row) < 4:
        double_row.append(land_bag("O1"))

    assert len(set(double_row)) == 4, schema_id
    shared = set(double_row) & set(retained_row)
    if arm == "ne":
        assert not shared, schema_id
    else:
        assert shared <= (set(cc) & set(NAMED6)) | ({"O"} if "O" in cc else set()), (
            schema_id
        )

    point_set = set(points)
    exact_classes = [
        dict(cls, exclude=sorted(point_set - {cls["center"]} - set(cls["members"])))
        for cls in schema["exact_classes"]
    ]

    return {
        **schema,
        "id": schema_id,
        "points": points,
        "blocks": blocks,
        "exact_classes": exact_classes,
        "row_eqs": schema["row_eqs"]
        + [{"name": "dbl", "center": "EA", "members": double_row}],
        "radius_rel": [{"rows": ["ret", "dbl"], "relation": arm}],
        "rad_ne": onehit_rad_ne(placement),
        "timeout_ms": TIMEOUT_MS,
    }


def main() -> None:
    schemas = []
    for qw in qw_patterns():
        for cc in c_patterns(physical_free=(qw[0] == "O1")):
            for arm in ("ne", "eq"):
                for profile in double_profiles(qw, cc, arm):
                    schemas.append(build_l1b(qw, cc, profile, arm))
    assert len({s["id"] for s in schemas}) == len(schemas)
    output = HERE / "l1b_schemas.json"
    output.write_text(json.dumps(schemas, indent=1))
    print(f"output={output} n={len(schemas)}")


if __name__ == "__main__":
    main()
