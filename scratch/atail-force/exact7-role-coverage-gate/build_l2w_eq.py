#!/usr/bin/env python3
"""W-hypothesis payoff matrix, remaining cell: W one-hit families + row
coupling equalities on the hard core (no-O-row survivors, all SAT under
every bare eqO-x in the l1f census).  Conditional on the unproven
W-centered one-hit; payoff estimate only."""
import json, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from factor_l1c import factored_schema
from build_l2w import with_w_families

NAMED6 = ("W", "s0", "b0", "s1", "b1", "s2")

def main():
    retro_all = json.loads((HERE / "retro_schemas.json").read_text())
    survivors = {json.loads(l)["schema_id"] for p in HERE.glob("retro_ledger_shard*.jsonl")
                 for l in p.read_text().splitlines() if l.strip() and json.loads(l)["verdict"] == "sat"}
    # hard core: survivors with no factored kill at all (l1f summary)
    summary = json.loads((HERE / "l1f_coverage_summary.json").read_text())
    hard = set(summary["retro_no_factored_kill"])
    schemas = []
    for retro in retro_all:
        if retro["id"] not in survivors or retro["id"] not in hard:
            continue
        for x in NAMED6:
            if x == "W":
                c = frozenset({("eq", "O", "W")})
            else:
                c = frozenset({("eq", "O", x)})
            s = factored_schema(retro, c)
            s2 = with_w_families({**s, "id": s["id"]})
            s2["id"] = "l2weq." + s["id"][len("l1f."):]
            schemas.append(s2)
    print(f"{len(schemas)} schemas (hard core {len(hard)} x 6 eq)")
    (HERE / "l2weq_schemas.json").write_text(json.dumps(schemas))
