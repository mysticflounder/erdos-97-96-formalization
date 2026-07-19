#!/usr/bin/env python3
"""L2u full-class census: the forced 4-class row WITH its exclusion.

The forced unused critical row (DESIGN-L2) is support_eq: support =
A.filter(dist uc · = radius) with support_card = 4 — i.e. EXACTLY
{u, m1, m2, m3} at radius d(uc, u), every other named point at a DIFFERENT
distance from uc.  The |M|=2/|M|=3 censuses tested only co-radiality; this
adds the exclusion, the geometrically restrictive part (the circle centred
at uc through u carries exactly these four named points and no other).

Encoding avoids the base exact_class label namespace: co-radiality via
row_eqs (labels row_eq|unu|·) and exclusion via rad_ne (labels
rad_ne|uc|other,u  ==  dist(uc, other) != dist(uc, u)).  No no_qfree yet —
this is the cheaper Stage-A closure test: a row candidate UNSAT here is
UNSAT for the full row too (adding no_qfree only tightens), so if every
(u, uc, triple) is UNSAT the base CLOSES.  no_qfree (no_k4) is Stage B,
applied only to Stage-A survivors.

Candidate set = every |M|=2 triangle (the complete 4-co-radial candidate
family, since a 4-class row's three non-u members are pairwise co-radial).
"""

import copy
import json

from build_l2u_probe import FRESH_BAGS, bag_block_index
from build_l2u_m3 import all_triangles


def fc_schema(base: dict, u: str, uc: str, tri: tuple) -> dict:
    out = copy.deepcopy(base)
    center = uc
    if uc in FRESH_BAGS:
        center = "uc"
        out["points"] = out["points"] + [center]
        out["blocks"][bag_block_index(out, FRESH_BAGS[uc])]["points"].append(center)
    m1, m2, m3 = tri
    row = [u, m1, m2, m3]
    out["row_eqs"] = [{"name": "unu", "center": center, "members": row}]
    excluded = [p for p in out["points"] if p not in row and p != center]
    out["rad_ne"] = [{"center": center, "a": other, "b": u} for other in excluded]
    out["id"] = f"l2fc.{base['id']}.U.{u}.C.{uc}.M.{m1}-{m2}-{m3}"
    out["timeout_ms"] = 600_000
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built = []
    for base_id, u, uc, tri in all_triangles():
        built.append(fc_schema(schemas[base_id], u, uc, tri))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_fc_schemas.json", "w"))
    print(f"built {len(built)} full-class (co-radial + exclusion) schemas")


if __name__ == "__main__":
    main()
