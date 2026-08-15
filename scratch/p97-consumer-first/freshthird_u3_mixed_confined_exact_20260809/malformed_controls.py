#!/usr/bin/env python3
"""Negative controls showing why the audited guards cannot be dropped."""
import itertools, json
from enumerate_u3_packet import LABELS, CENTERS, CIRCLE, DOMAINS, compatible

def count(drop_own=False, allow_q=False):
    domains = []
    for mode, center in zip("QQQQQQ", CENTERS):
        rows = []
        for s0 in itertools.combinations(LABELS, 4):
            s = frozenset(s0)
            if not drop_own and center in s: continue
            if mode == "Q" and not allow_q and "q" in s: continue
            if len(s & CIRCLE) > 2 or len(s - CIRCLE) < 2: continue
            rows.append(s)
        domains.append(rows)
    total = own = 0
    def go(i, chosen):
        nonlocal total, own
        if i == 6:
            total += 1
            own += any(CENTERS[j] in chosen[j] for j in range(6))
            return
        for s in domains[i]:
            if all(len(s & t) <= 2 for t in chosen): go(i + 1, chosen + [s])
    go(0, [])
    return total, own

def main():
    clean, _ = count()
    drop, own = count(drop_own=True)
    allow, _ = count(allow_q=True)
    out = {"clean_Q_all_rows": clean, "drop_own_center_Q": drop,
           "drop_own_center_models_containing_own": own,
           "allow_q_in_Q_rows": allow,
           "controls": {"all_increase_over_clean": drop > clean and allow > clean,
                        "own_center_guard_detected": own > 0}}
    print(json.dumps(out, sort_keys=True))
    open("malformed-controls.json", "w").write(json.dumps(out, indent=2, sort_keys=True) + "\n")

if __name__ == "__main__": main()
