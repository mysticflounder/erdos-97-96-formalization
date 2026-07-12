#!/usr/bin/env python3
"""ERASE-P3-MAP gate 2 (the matrix exit criterion): round-trip test
row -> class -> row features == identity, over the FULL structural feature
domain at both profiles (card 10 and card 11), all four sites.

Feature set: (profile_card, site, ordered signature) where
  site in {O1int, O2int, Sint, U},
  signature = ordered census row (m,s,l,r) for non-Moser sites,
              ordered apex tuple (mv,mw,kS,kO1,kO2) for site U,
subject only to frame cardinality bounds (no cuts -- the map is total).

Also asserts: distinct features never collide, i.e. (code, orientation)
is injective on the domain.
"""
from __future__ import annotations

import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import ep3map as ep  # noqa: E402


def main() -> int:
    total = 0
    failures = []
    seen = {}
    per = {}
    for card in (10, 11):
        for site in ep.SITES:
            dom = ep.structural_domain(card, site)
            per[f"n{card}_{site}"] = len(dom)
            for sig in dom:
                F = {"profile_card": card, "site": site, "sig": sig}
                code = ep.map_features(F)
                back = ep.unmap(code)
                total += 1
                if not (
                    back["profile_card"] == card
                    and back["site"] == site
                    and tuple(back["sig"]) == tuple(sig)
                ):
                    failures.append({"F": F, "code": code, "back": back})
                key = (
                    code["profile_card"],
                    code["code_kind"],
                    code["class_code"],
                    code["orientation"]["side"],
                    code["orientation"]["chi"],
                )
                if key in seen and seen[key] != (card, site, tuple(sig)):
                    failures.append(
                        {"collision": [seen[key], (card, site, sig)], "key": key}
                    )
                seen[key] = (card, site, tuple(sig))
    out = {
        "schema": "erase_p3_map_roundtrip.v1",
        "domain_sizes": per,
        "total_features": total,
        "distinct_code_orientation_pairs": len(seen),
        "failures": failures,
        "verdict": "IDENTITY" if not failures else "FAIL",
    }
    path = os.path.join(HERE, "roundtrip_results.json")
    with open(path, "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print(json.dumps({k: v for k, v in out.items() if k != "failures"}, indent=1))
    if failures:
        print(f"FAILURES: {len(failures)}", file=sys.stderr)
        print(json.dumps(failures[:5], indent=1, default=str), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
