#!/usr/bin/env python3
"""L2u Stage-B census: the FULL forced unused critical row.

Stage A (build_l2u_fc) = co-radiality (row_eqs) + exclusion (rad_ne).
Stage B adds the third defining property of CriticalSelectedFourClass:
source_deletion_blocked_at_blocker == no_qfree at u.  Encoded as
no_k4 {center: uc, avoid: [u]}: no 4-subset of the named points other than
uc and u is co-radial at uc at ANY radius.

This is the geometrically decisive constraint: it forbids the base's own
forced co-radial structures (reverse rows, exact classes) from producing
any 4-co-radial set at uc, so it interacts with the base far more than the
generically-free exclusion does.  Stage B is a tightening of Stage A
(Stage-A UNSAT => Stage-B UNSAT), so every base that closes under Stage A
also closes here; Stage B closes strictly more.
"""

import copy
import json

from build_l2u_probe import FRESH_BAGS, bag_block_index
from build_l2u_m3 import all_triangles


def fcq_schema(base: dict, u: str, uc: str, tri: tuple) -> dict:
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
    out["no_k4"] = [{"center": center, "avoid": [u]}]
    out["id"] = f"l2fcq.{base['id']}.U.{u}.C.{uc}.M.{m1}-{m2}-{m3}"
    out["timeout_ms"] = 600_000
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built = []
    for base_id, u, uc, tri in all_triangles():
        built.append(fcq_schema(schemas[base_id], u, uc, tri))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_fcq_schemas.json", "w"))
    print(f"built {len(built)} full-row (co-radial + exclusion + no_qfree) schemas")


if __name__ == "__main__":
    main()
