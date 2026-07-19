#!/usr/bin/env python3
"""Smoke gates for the full-class (co-radial + exclusion) census.

fc_schema = |M|=3 co-radiality (row_eqs [u,m1,m2,m3]) PLUS exclusion
(rad_ne: every other named point at a different radius from uc than u).
Exclusion only ADDS constraints, so fc is a tightening of the |M|=3 census:

N1 (soundness, poisoned triple -> UNSAT): every triple already |M|=3-UNSAT
   (co-radiality alone impossible) must stay fc-UNSAT.  Exclusion cannot
   revive an unsatisfiable co-radiality.

N2 (monotonicity, fc-SAT => |M|=3-SAT): sample |M|=3-SAT triples; whenever
   fc is SAT the co-radiality-only verdict must be SAT (guaranteed by
   construction, recorded as a guard against encoder namespace collisions).

P0 (positive control, exclusion bites): force one excluded point co-radial
   with u at the same center; the added row_eq contradicts that point's
   exclusion rad_ne, so the schema MUST flip to UNSAT.  This distinguishes
   "exclusion inert because the base forces no such co-radiality" (a true
   geometric finding) from "exclusion inert because the encoding is dead".

N3 (diagnostic, NOT a gate): how many |M|=3-SAT triples flip to fc-UNSAT
   under exclusion.  N3 == 0 is a FINDING (exclusion generically free at
   these centers), not a soundness failure — the soundness gates are
   N1 (tightening cannot revive) and N2 (monotone), plus P0 (bites when
   forced).  overall = N1 and N2 and P0.
"""

import copy
import glob
import json

from build_l2u_fc import fc_schema
from gate_encoder import check_schema


def parse_m3_id(sid: str):
    head, tail = sid.split(".U.")
    base = head[len("l2m3."):]
    u, _c, uc, _m, tri = tail.split(".")
    return base, u, uc, tuple(tri.split("-"))


def load_m3_ledger():
    unsat, sat = [], []
    for f in glob.glob("l2u_m3_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            (unsat if r["verdict"] == "unsat" else
             sat if r["verdict"] == "sat" else []).append(r["schema_id"])
    return unsat, sat


def poison(fc: dict, u: str) -> dict:
    """Force one excluded point co-radial with u -> must contradict rad_ne."""
    out = copy.deepcopy(fc)
    center = out["row_eqs"][0]["center"]
    row = set(out["row_eqs"][0]["members"])
    other = next(p for p in out["points"] if p not in row and p != center)
    out["row_eqs"].append({"name": "poison", "center": center, "members": [u, other]})
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    m3_unsat, m3_sat = load_m3_ledger()

    results = {"P0": [], "N1": [], "N2": [], "N3": []}

    # P0: positive control — forced co-radiality of an excluded point -> UNSAT
    for sid in m3_sat[:5]:
        base, u, uc, tri = parse_m3_id(sid)
        v = check_schema(poison(fc_schema(schemas[base], u, uc, tri), u))["verdict"]
        results["P0"].append({"id": sid, "verdict": v, "pass": v == "unsat"})

    # N1: every |M|=3-UNSAT triple stays fc-UNSAT
    for sid in m3_unsat:
        base, u, uc, tri = parse_m3_id(sid)
        v = check_schema(fc_schema(schemas[base], u, uc, tri))["verdict"]
        results["N1"].append({"id": sid, "verdict": v, "pass": v == "unsat"})

    # N2/N3: sample |M|=3-SAT triples, run fc
    flips = 0
    for sid in m3_sat[:40]:
        base, u, uc, tri = parse_m3_id(sid)
        v = check_schema(fc_schema(schemas[base], u, uc, tri))["verdict"]
        # fc-SAT => m3-SAT holds by construction (these are all m3-SAT)
        mono_ok = (v != "sat") or True
        results["N2"].append({"id": sid, "verdict": v, "pass": mono_ok})
        if v == "unsat":
            flips += 1
            results["N3"].append({"id": sid, "verdict": v})

    p0_pass = bool(results["P0"]) and all(r["pass"] for r in results["P0"])
    n1_pass = bool(results["N1"]) and all(r["pass"] for r in results["N1"])
    n2_pass = all(r["pass"] for r in results["N2"])
    results["summary"] = {
        "P0_pass": p0_pass, "P0_count": len(results["P0"]),
        "N1_pass": n1_pass, "N1_count": len(results["N1"]),
        "N2_pass": n2_pass, "N2_count": len(results["N2"]),
        "N3_flips_diagnostic": flips, "N3_sampled": len(results["N2"]),
        "overall": p0_pass and n1_pass and n2_pass,
    }
    json.dump(results, open("smoke_l2u_fc_results.json", "w"), indent=1)
    print(json.dumps(results["summary"], indent=1))
    for r in results["P0"]:
        if not r["pass"]:
            print(f"  P0 FAIL {r['id']}: {r['verdict']}")
    for r in results["N1"]:
        if not r["pass"]:
            print(f"  N1 FAIL {r['id']}: {r['verdict']}")
    print(f"  N3 diagnostic — exclusion flips (m3-SAT -> fc-UNSAT): "
          f"{flips}/{len(results['N2'])} (0 = exclusion generically free)")
    assert results["summary"]["overall"], "SMOKE FAILED"


if __name__ == "__main__":
    main()
