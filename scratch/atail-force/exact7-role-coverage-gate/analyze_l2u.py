#!/usr/bin/env python3
"""Analyze the L2u probe ledger: kill structure by (u, uc, m) roles.

Probe ids: l2u.{base}.U.{u}.C.{uc}.M.{m}.  Roles classify point names so
merge-dependent p-point labels aggregate:  endpoint (EA/W), source
(s0/s1/s2), blocker (b0/b1), apex O, extra (e1/e2), outside (p*),
fresh center (fS/fO1).
"""

import glob
import json
from collections import Counter


def role(name: str) -> str:
    if name in ("EA", "W"):
        return "endpoint:" + name
    if name in ("s0", "s1", "s2"):
        return "source:" + name
    if name in ("b0", "b1"):
        return "blocker:" + name
    if name == "O":
        return "O"
    if name in ("e1", "e2"):
        return "extra:" + name
    if name in ("fS", "fO1"):
        return "fresh:" + name
    assert name.startswith("p"), name
    return "outside"


def main() -> None:
    rows = []
    for path in sorted(glob.glob("l2u_probe_ledger_shard*.jsonl")):
        with open(path) as fh:
            rows.extend(json.loads(line) for line in fh)
    print(f"{len(rows)} rows: {dict(Counter(r['verdict'] for r in rows))}")
    kills = []
    for r in rows:
        if r["verdict"] != "unsat":
            continue
        sid = r["schema_id"]
        base, rest = sid.split(".U.")
        u, rest = rest.split(".C.")
        uc, m = rest.split(".M.")
        kills.append({
            "base": base.removeprefix("l2u."),
            "u": u, "uc": uc, "m": m,
            "core_families": r.get("families", {}),
            "core": r.get("core", []),
        })
    print(f"{len(kills)} kills")
    by_pattern = Counter((k["u"], role(k["uc"]), role(k["m"])) for k in kills)
    for (u, ucr, mr), n in sorted(by_pattern.items(), key=lambda kv: -kv[1]):
        print(f"  u={u} uc={ucr} m={mr}: {n}")
    by_base = Counter(k["base"] for k in kills)
    for b, n in sorted(by_base.items()):
        print(f"  base {b}: {n}")
    json.dump(kills, open("l2u_probe_kills.json", "w"), indent=1)
    print("kills -> l2u_probe_kills.json")


if __name__ == "__main__":
    main()
