#!/usr/bin/env python3
"""L2u |M|=3 census: does a full 4-co-radial row exist at all?

The forced unused critical row is a 4-class: u + THREE members all co-radial
from uc.  A candidate triple's three members are pairwise co-radial with u
(each pair SAT in the |M|=2 census), i.e. a TRIANGLE in the compatibility
graph — so the triangles are the COMPLETE candidate set for a 4-class row.
This census tests each triangle jointly: schema row_eqs members
[u, m1, m2, m3] force d(uc,u) = d(uc,m1) = d(uc,m2) = d(uc,m3).

Decisiveness: a |M|=3 kill means those 4 points cannot be co-radial.  If
EVERY triangle of a (u, uc) group is killed, no 4-class row can center at uc
through u — the group is row-dead.  If every group of a base is row-dead,
the base is CLOSED (the forced unused row has no placement).  So this census
decides whether 4 co-radial boundary points are geometrically admissible.
"""

import copy
import json

from build_l2u_probe import FRESH_BAGS, bag_block_index
from analyze_l2u_m2 import load_m1_nodes, load_m2_edges, triangles


def m3_schema(base: dict, u: str, uc: str, tri: tuple) -> dict:
    out = copy.deepcopy(base)
    center = uc
    if uc in FRESH_BAGS:
        center = "uc"
        out["points"] = out["points"] + [center]
        out["blocks"][bag_block_index(out, FRESH_BAGS[uc])]["points"].append(center)
    m1, m2, m3 = tri
    out["row_eqs"] = [{"name": "unu", "center": center, "members": [u, m1, m2, m3]}]
    out["id"] = f"l2m3.{base['id']}.U.{u}.C.{uc}.M.{m1}-{m2}-{m3}"
    out["timeout_ms"] = 600_000
    return out


def all_triangles():
    """Yield (base_id, u, uc, (m1,m2,m3)) for every |M|=2 triangle."""
    nodes = load_m1_nodes()
    edges, _ = load_m2_edges()
    for (base_id, u, uc), mem in nodes.items():
        eg = edges.get((base_id, u, uc), {})

        def ok(a, b):
            return eg.get(frozenset((a, b)), "sat") == "sat"

        if len(mem) < 3:
            continue
        ns = sorted(mem)
        for i in range(len(ns)):
            for j in range(i + 1, len(ns)):
                if not ok(ns[i], ns[j]):
                    continue
                for k in range(j + 1, len(ns)):
                    if ok(ns[i], ns[k]) and ok(ns[j], ns[k]):
                        yield base_id, u, uc, (ns[i], ns[j], ns[k])


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built = []
    for base_id, u, uc, tri in all_triangles():
        built.append(m3_schema(schemas[base_id], u, uc, tri))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_m3_schemas.json", "w"))
    print(f"built {len(built)} |M|=3 triangle schemas")


if __name__ == "__main__":
    main()
