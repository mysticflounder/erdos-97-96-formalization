#!/usr/bin/env python3
"""ERASE-P3-MAP item 3: systematic inventory of all surplus-side erased-pin
row shapes at card 10 and card 11, with their mapped multi-center class
codes + orientations.

Surplus-side sites (the two ERASE-P4 holes, Continuation.lean:183/:211):
  U    = surplus-opposite apex (center u, Moser vertex U),
         signature (mv, mw, kS, kO1, kO2);
  Sint = surplus-cap interior center, signature (m, s, l, r).

Constraints recorded per shape:
  pin_ok  : ErasedPinTriple needs the erased x in intS and in the class
            (kS >= 1 at U; s >= 1 at Sint)  [structural, from the Lean
            statement shape -- no geometric claim];
  h1_ok   : census C1+H1 at the apex (mw+kO1 <= 1, mv+kO2 <= 1)
            [PROVEN census cut];
  m_le_2 / killed_proven / killed_plus : census row-cut vocabulary for
            non-Moser centers [PROVEN / CONJECTURED tiers].

Family labels follow the ERASE-P4 route-scoping audit's realizable-family
list; the classification below is DERIVED from the pin+H1 enumeration and
asserted total over the surviving apex shapes.

Output: inventory.json. Deterministic; no solver runs; no geometric claims.
"""
from __future__ import annotations

import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import ep3map as ep  # noqa: E402

WITNESSED = {
    (10, "U", (0, 0, 2, 1, 1)): "SO_t2_PuQ1",
    (10, "Sint", (1, 1, 1, 1)): "SI_c-s1_Q2vPu",
}


def apex_family(sig) -> str:
    mv, mw, kS, kO1, kO2 = sig
    corners = mv + mw
    if kS == 4:
        return "(4,0,0)"
    if kS == 3 and corners == 0:
        return "(3,1,0)/(3,0,1)"
    if kS == 3 and corners == 1:
        return "corner+3-surplus"
    if kS == 2 and corners == 2:
        return "corner: Mode-A"
    if kS == 2 and corners == 1:
        return "corner+opp"
    if kS == 2 and corners == 0:
        return "(2,1,1)-strict"
    raise AssertionError(f"unclassified surviving apex shape {sig}")


def main() -> int:
    entries = []
    for card in (10, 11):
        for site in ("U", "Sint"):
            for sig in ep.structural_domain(card, site):
                F = {"profile_card": card, "site": site, "sig": sig}
                if not ep.pin_ok(site, sig):
                    continue
                code = ep.map_features(F)
                checks = ep.local_checks(F)
                if site == "U":
                    mirror = ep.reflect_apex(sig)
                    surviving = checks["h1_ok"]
                    family = apex_family(sig) if surviving else None
                else:
                    mirror = ep.reflect_row(sig)
                    surviving = checks["local_ok"]
                    family = "surplus-interior" if surviving else None
                entries.append(
                    {
                        "card": card,
                        "site": site,
                        "ordered_sig": list(sig),
                        "mirror_sig": list(mirror),
                        "family": family,
                        "surviving_local": surviving,
                        "checks": checks,
                        "class_code": code["class_code"],
                        "code_kind": code["code_kind"],
                        "orientation": code["orientation"],
                        "witnessed": WITNESSED.get((card, site, tuple(sig))),
                    }
                )

    # summaries
    def keyf(e):
        return (e["card"], e["site"])

    summary = {}
    fam_counts = {}
    canon_classes = {}
    for e in entries:
        k = f"n{e['card']}_{e['site']}"
        summary.setdefault(k, {"total_pin_shapes": 0, "surviving_local": 0})
        summary[k]["total_pin_shapes"] += 1
        if e["surviving_local"]:
            summary[k]["surviving_local"] += 1
            fk = f"n{e['card']}: {e['family']}"
            fam_counts[fk] = fam_counts.get(fk, 0) + 1
            ck = (e["card"], e["code_kind"], e["class_code"])
            canon_classes.setdefault(ck, []).append(
                (e["site"], tuple(e["ordered_sig"]), e["orientation"]["chi"])
            )

    canon_list = [
        {
            "card": c[0],
            "code_kind": c[1],
            "class_code": c[2],
            "orbit": [
                {"site": s, "ordered_sig": list(sig), "chi": chi}
                for s, sig, chi in v
            ],
        }
        for c, v in sorted(canon_classes.items(), key=lambda kv: (kv[0][0], kv[0][1], kv[0][2]))
    ]

    out = {
        "schema": "erase_p3_map_inventory.v1",
        "vocabulary": {
            "census": "census/multi_center/multi_center_census.py "
            "(docs/multi-center-joint-census-spec-2026-07-07.md)",
            "row_code": "canonical single-center type min((m,s,l,r),(m,s,r,l)) "
            "per q2_token.type_of; buckets S->(O1,O2), O1->(O2,S), O2->(S,O1)",
            "apex_code": "class_key(canon_joint(profile,(0,),moser_masks,"
            "cap_counts,'EP1')) -- census canonicalization, single-participant "
            "layer 'EP1'",
            "orientation": "side in {O1,O2,S,U} + chi in {direct,reflected,"
            "symmetric} (inverts the census quotient; see ep3map.py header)",
        },
        "profiles": {"10": [5, 4, 4], "11": [6, 4, 4]},
        "summary": summary,
        "family_counts_surviving": dict(sorted(fam_counts.items())),
        "canonical_classes_surviving": canon_list,
        "entries": entries,
    }
    path = os.path.join(HERE, "inventory.json")
    with open(path, "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print(json.dumps({"summary": summary, "family_counts_surviving": out["family_counts_surviving"], "canonical_classes_surviving_count": len(canon_list)}, indent=1))
    print(f"wrote {path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
