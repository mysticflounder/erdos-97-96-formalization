#!/usr/bin/env python3
"""L1 identification-type certificates (DESIGN-L1.md step 6).

Certifies, per identification TYPE, a uniform local core on a mini-schema
(named system + retained/double row + one L0 reverse row + the fused
points only).  UNSAT on a mini-schema is a relaxation kill: every full
pattern containing the type inherits the core under renaming (class/row
memberships only grow, named points are never fused, the cores' points
are confined to the fused roles + named points).

Types certified DEAD by solver (expected core: 2 row_eq + 1 rad_ne —
the outside-pair disequality at EA against the row equalities; this is
the censal image of `FirstApexNamedRowTransitionReversePairOccurrence`):

- pp-ret.<row>.<bags>: BOTH outside points of reverse row <row> are the
  two retained-row completions;
- pp-dbl.<row>.<bags>: both outside points occupy two double-row slots.

Types dead by CITATION (discrete cardinality, no solver encoding that
does not beg the question):

- qw-classO: both frontier sources in class(O) — `secondApexDouble`
  (CriticalPairFrontier.lean:573-575) needs a 4-class at O inside
  A∖{q,w}; `unique_K4_radius` + `class_card_eq_five` put every such
  class inside class(O), and |class(O) ∖ {q,w}| = 3.  Covers q~e1&w~e2,
  q~e1&w=s_j, and the both-named case (the last is already excluded by
  the EA-physical one-hit in the L1a enumeration).

Types expected SAT (mini-schema SAT is inconclusive for refinements —
these stay UNDECIDED at type level and are recorded as residual):

- p-single.<row>: one outside point on a retained completion, partner free;
- p-eq-q.<row>: an outside point IS a frontier source;
- e-on-ret: an exact-five extra occupies a retained-row slot (the double
  row case is analogous and not separately built);
- c-eq-g: shared fresh completion in the same-radius arm.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from gate_encoder import check_schema  # noqa: E402
from regions import onehit_rad_ne, outside_pair_rad_ne  # noqa: E402

CAP_INTERIOR = ["s0", "b0", "s1", "b1", "s2"]
NAMED = ["EA", "O", "W"] + CAP_INTERIOR
ROWS = {"b0": ["s0", "s1"], "b1": ["s1", "s2"], "s1": ["s2", "s0"]}
PAIR_BAGS = [("O1", "O1"), ("O1", "S"), ("O1", "O")]
TIMEOUT_MS = 300_000


def base(points_extra, s_bag, o1_bag, rows, row_eqs, outside):
    points = NAMED + points_extra
    placement = {p: p for p in NAMED}
    placement |= {p: "S" for p in s_bag}
    placement |= {p: "O1" for p in o1_bag}
    point_set = set(points)
    o_class = ["s0", "s1", "s2"]
    exact_classes = [
        {
            "center": "O",
            "members": o_class,
            "exclude": sorted(point_set - {"O"} - set(o_class)),
        }
    ]
    for center, members in rows:
        exact_classes.append(
            {
                "center": center,
                "members": members,
                "exclude": sorted(point_set - {center} - set(members)),
            }
        )
    rad_ne = onehit_rad_ne(placement)
    seen = {(s["center"], s["a"], s["b"]) for s in rad_ne}
    for spec in outside_pair_rad_ne(outside):
        if (spec["center"], spec["a"], spec["b"]) not in seen:
            rad_ne.append(spec)
    return {
        "points": points,
        "blocks": [
            {"points": ["EA"], "ordered": True},
            {"points": s_bag, "ordered": False},
            {"points": ["O"], "ordered": True},
            {"points": o1_bag, "ordered": False},
            {"points": ["W"], "ordered": True},
            {"points": CAP_INTERIOR, "ordered": True},
        ],
        "exact_classes": exact_classes,
        "row_eqs": row_eqs,
        "rad_ne": rad_ne,
        "unique_class": [{"center": "O", "members": o_class}],
        "timeout_ms": TIMEOUT_MS,
    }


def pp_schema(target: str, row: str, bags: tuple[str, str]) -> dict:
    """Both outside points of <row> inside the <target> EA-row."""
    m = ["m1", "m2"]
    s_bag = [p for p, b in zip(m, bags) if b == "S"]
    o1_bag = ["q", "w"] + [p for p, b in zip(m, bags) if b == "O1"]
    landed = [p if b != "O" else "O" for p, b in zip(m, bags)]
    extra = sorted(set(m) & (set(s_bag) | set(o1_bag)) | {"q", "w"})
    if target == "ret":
        row_eqs = [{"name": "ret", "center": "EA", "members": ["q", "w"] + landed}]
    else:
        row_eqs = [
            {"name": "ret", "center": "EA", "members": ["q", "w", "c1", "c2"]},
            {"name": "dbl", "center": "EA", "members": landed + ["g1", "g2"]},
        ]
        o1_bag = o1_bag + ["c1", "c2", "g1", "g2"]
        extra = sorted(set(extra) | {"c1", "c2", "g1", "g2"})
    schema = base(
        extra,
        s_bag,
        o1_bag,
        [(row, ROWS[row] + landed)],
        row_eqs,
        [tuple(landed)],
    )
    if target == "dbl":
        schema["radius_rel"] = [{"rows": ["ret", "dbl"], "relation": "ne"}]
    schema["id"] = f"pp-{target}.{row}.{bags[0]}-{bags[1]}"
    return schema


def sat_type_schemas() -> list[dict]:
    schemas = []
    for row in ROWS:
        # one outside point = retained completion, partner free in O1
        schema = base(
            ["q", "w", "m", "pb"],
            [],
            ["q", "w", "m", "pb"],
            [(row, ROWS[row] + ["m", "pb"])],
            [{"name": "ret", "center": "EA", "members": ["q", "w", "m", "c2"]}],
            [("m", "pb")],
        )
        schema["points"] = schema["points"] + ["c2"]
        schema["blocks"][3]["points"] = schema["blocks"][3]["points"] + ["c2"]
        for cls in schema["exact_classes"]:
            cls["exclude"] = sorted(
                set(cls["exclude"]) | {"c2"} - {cls["center"]} - set(cls["members"])
            )
        schema["id"] = f"p-single.{row}"
        schemas.append(schema)

        # outside point IS the frontier source q
        schema = base(
            ["q", "w", "pb", "c1", "c2"],
            [],
            ["q", "w", "pb", "c1", "c2"],
            [(row, ROWS[row] + ["q", "pb"])],
            [{"name": "ret", "center": "EA", "members": ["q", "w", "c1", "c2"]}],
            [("q", "pb")],
        )
        schema["id"] = f"p-eq-q.{row}"
        schemas.append(schema)

    # exact-five extra on a retained completion (e-pattern S-O1: e1 in S,
    # e2 = the O1 completion)
    schema = base(
        ["q", "w", "e1", "e2", "c2"],
        ["e1"],
        ["q", "w", "e2", "c2"],
        [],
        [{"name": "ret", "center": "EA", "members": ["q", "w", "e2", "c2"]}],
        [],
    )
    for cls in schema["exact_classes"]:
        if cls["center"] == "O":
            cls["members"] = ["s0", "s1", "s2", "e1", "e2"]
            cls["exclude"] = sorted(
                set(schema["points"]) - {"O"} - set(cls["members"])
            )
    schema["unique_class"] = [
        {"center": "O", "members": ["s0", "s1", "s2", "e1", "e2"]}
    ]
    schema["id"] = "e-on-ret"
    schemas.append(schema)

    # shared fresh completion, same-radius arm
    schema = base(
        ["q", "w", "cg", "c2", "g2", "g3"],
        [],
        ["q", "w", "cg", "c2", "g2", "g3"],
        [],
        [
            {"name": "ret", "center": "EA", "members": ["q", "w", "cg", "c2"]},
            {"name": "dbl", "center": "EA", "members": ["cg", "g2", "g3", "c2"]},
        ],
        [],
    )
    schema["radius_rel"] = [{"rows": ["ret", "dbl"], "relation": "eq"}]
    schema["id"] = "c-eq-g"
    schemas.append(schema)
    return schemas


def core_points(core: list[str]) -> set[str]:
    points: set[str] = set()
    for label in core:
        parts = label.split("|")
        if parts[0] in ("cls_eq", "cls_ne", "rad_ne", "uniq4", "k4"):
            points.add(parts[1])
            points.update(parts[2].split(","))
        elif parts[0] == "row_eq":
            points.add(parts[2])
        elif parts[0] == "kal":
            points.update(parts[1].split(","))
        elif parts[0] == "pos":
            points.update(parts[2].split(","))
    return points


def main() -> None:
    dead_expected = [
        pp_schema(target, row, bags)
        for target in ("ret", "dbl")
        for row in ROWS
        for bags in PAIR_BAGS
    ]
    results = {}
    failures = []
    for schema in dead_expected:
        verdict = check_schema(schema)
        results[verdict["schema_id"]] = verdict
        ok = verdict["verdict"] == "unsat"
        if ok:
            stray = core_points(verdict["core"]) - set(NAMED) - {"m1", "m2"}
            ok = not stray
        status = "PASS" if ok else "FAIL"
        if not ok:
            failures.append(verdict["schema_id"])
        print(
            f"{status} {verdict['schema_id']}: {verdict['verdict']}"
            + (f" core={verdict['core']}" if verdict["verdict"] == "unsat" else "")
        )

    for schema in sat_type_schemas():
        verdict = check_schema(schema)
        results[verdict["schema_id"]] = verdict
        print(f"INFO {verdict['schema_id']}: {verdict['verdict']}")
        if verdict["verdict"] == "unsat":
            print(f"  unexpected kill, core={verdict['core']}")

    (HERE / "l1_id_type_cores.json").write_text(json.dumps(results, indent=1))
    print(f"output={HERE / 'l1_id_type_cores.json'}")
    if failures:
        raise SystemExit(f"failures: {failures}")
    print("ALL DEAD-TYPE CERTIFICATES OK (SAT types informational)")


if __name__ == "__main__":
    main()
