#!/usr/bin/env python3
"""L0 schema enumerator for the exact-seven role-coverage gate.

Level 0 covers the ALL-FRESH slice: the named cap system, the second apex,
the two exact-five extras, and the three reverse-row outside pairs, with
no identifications among the fresh roles.  Coincidence cases (extra =
outside point, outside points of two rows equal, ...) are separate
partition cases handled by the merge refinement pass; landing two roles on
the same NAMED point (both outside points at O) is realized here directly.

Named system (Round 188 + pinned facts, see REPORT.md / the fact-pinning
report):

- boundary cycle: EA, [surplus strict arc], O, [opp-1 strict arc], W,
  s0, b0, s1, b1, s2, back to EA.  EA = first apex (cap endpoint shared
  with the surplus cap), W = the other Moser endpoint (shared with the
  opp-1 cap).  The Round 188 two-orientation disjunction is quotiented by
  the dihedral reflection (every constraint family is reflection
  invariant), fixing s0 adjacent to W.
- classes (all complete, support-locked):
    O  : {s0, s1, s2, e1, e2}   exact-five (class_card_eq_five)
    b0 : {s0, s1, p0a, p0b}     reverse row of edge s0->s1
    b1 : {s1, s2, p1a, p1b}     reverse row of edge s1->s2
    s1 : {s2, s0, p2a, p2b}     collision row of edge s2->s0 (Round 188)
- unique_K4_radius at O: no other 4-subset of named points is equiradial
  at O (encoded as the ``unique_class`` family).
- landing sites, from the pinned membership facts:
    extras e1, e2   in {S, O1, EA, W}   (class ∩ interior = sources is
                    PROVEN on the all-reverse arm; endpoint landings are
                    NOT-FOUND-excluded, so they must be enumerated; O is
                    excluded definitionally)
    outside points  in {S, O1, O}       (excluded from the CLOSED cap,
                    PROVEN; O is NOT-FOUND-excluded)
  S / O1 = fresh point in the surplus / opp-1 strict-arc bag (symbolic
  within-arc order); EA / W / O = the named point itself.
- both extras cannot land on the same endpoint (they are distinct class
  members); both outside points of one row cannot land on O (the pair has
  card 2).

First-apex rows, the unused critical row, and endpoint blockers are NOT
encoded at L0 (sound relaxation; L1 adds them on SAT survivors).

Output: l0_schemas.json (list of gate_encoder schemas).
"""

from __future__ import annotations

import json
from itertools import combinations_with_replacement, product
from pathlib import Path

HERE = Path(__file__).resolve().parent

CAP_INTERIOR = ["s0", "b0", "s1", "b1", "s2"]
E_SITES = ("S", "O1", "EA", "W")
P_SITES = ("S", "O1", "O")

ROWS = (
    ("b0", ["s0", "s1"], ("p0a", "p0b")),
    ("b1", ["s1", "s2"], ("p1a", "p1b")),
    ("s1", ["s2", "s0"], ("p2a", "p2b")),
)

TIMEOUT_MS = 300_000


def e_landings() -> list[tuple[str, str]]:
    result = []
    for pair in combinations_with_replacement(E_SITES, 2):
        if pair in (("EA", "EA"), ("W", "W")):
            continue
        result.append(pair)
    return result


def p_landings() -> list[tuple[str, str]]:
    return [
        pair
        for pair in combinations_with_replacement(P_SITES, 2)
        if pair != ("O", "O")
    ]


def build_schema(e_pair: tuple[str, str], row_pairs) -> dict:
    schema_id = "L0.e{}-{}.".format(*e_pair) + ".".join(
        "r{}{}-{}".format(index, *pair) for index, pair in enumerate(row_pairs)
    )

    bags: dict[str, list[str]] = {"S": [], "O1": []}
    points = ["EA", "O", "W"] + CAP_INTERIOR

    def land(role: str, site: str) -> str:
        if site in ("EA", "W", "O"):
            return site
        bags[site].append(role)
        points.append(role)
        return role

    e_members = [land(f"e{i + 1}", site) for i, site in enumerate(e_pair)]
    row_members: list[tuple[str, list[str]]] = []
    for (center, forced, fresh_names), sites in zip(ROWS, row_pairs):
        landed = [land(name, site) for name, site in zip(fresh_names, sites)]
        row_members.append((center, forced + landed))

    o_class = ["s0", "s1", "s2"] + e_members
    point_set = set(points)
    exact_classes = [
        {
            "center": "O",
            "members": o_class,
            "exclude": sorted(point_set - {"O"} - set(o_class)),
        }
    ]
    for center, members in row_members:
        exact_classes.append(
            {
                "center": center,
                "members": members,
                "exclude": sorted(point_set - {center} - set(members)),
            }
        )

    blocks = [
        {"points": ["EA"], "ordered": True},
        {"points": bags["S"], "ordered": False},
        {"points": ["O"], "ordered": True},
        {"points": bags["O1"], "ordered": False},
        {"points": ["W"], "ordered": True},
        {"points": CAP_INTERIOR, "ordered": True},
    ]

    return {
        "id": schema_id,
        "points": points,
        "blocks": blocks,
        "exact_classes": exact_classes,
        "unique_class": [{"center": "O", "members": o_class}],
        "timeout_ms": TIMEOUT_MS,
    }


def main() -> None:
    schemas = [
        build_schema(e_pair, row_pairs)
        for e_pair in e_landings()
        for row_pairs in product(p_landings(), repeat=len(ROWS))
    ]
    ids = [schema["id"] for schema in schemas]
    assert len(set(ids)) == len(ids)
    output = HERE / "l0_schemas.json"
    output.write_text(json.dumps(schemas, indent=1))
    print(f"schemas={len(schemas)}")
    print(f"e_landings={len(e_landings())} p_landings_per_row={len(p_landings())}")
    print(f"output={output}")


if __name__ == "__main__":
    main()
