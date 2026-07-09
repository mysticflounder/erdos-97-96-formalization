#!/usr/bin/env python3
"""Append certified frontier pattern(s) to bank.jsonl, mirroring
cegar.bank_one EXACTLY (cert file + bank row with next pid index, orbit
expansion).  GUARDED: refuses to run if any census driver is alive
(single-writer invariant on bank.jsonl).

Usage: uv run python frontier_add.py <patterns.json>
where patterns.json = [{"pattern": {c: [..]}, "cert": {...}, "cube": {...}}, ...]
Each cert must be a completed miner.certify_pattern dict (has "kill").
"""
import json
import os
import subprocess
import sys

sys.path.insert(0, ".")
import miner  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
BANK = f"{HERE}/bank.jsonl"
CERTS = f"{HERE}/certs"


def driver_alive():
    out = subprocess.run(["pgrep", "-f", "run_census.py"],
                         capture_output=True, text=True)
    return bool(out.stdout.strip())


def next_pid_index():
    n = 0
    with open(BANK) as f:
        for _ in f:
            n += 1
    return n


def main():
    if driver_alive():
        print("REFUSING: a census driver (run_census.py) is alive — "
              "single-writer invariant. Stop it first.", flush=True)
        sys.exit(2)

    rows = json.load(open(sys.argv[1]))
    npat = next_pid_index()
    added = 0
    for row in rows:
        pat = {int(c): frozenset(M) for c, M in row["pattern"].items()}
        cert = row["cert"]
        if "kill" not in cert:
            print(f"SKIP: cert has no kill (uncertified): {row['pattern']}",
                  flush=True)
            continue
        pid = f"pat_{npat:05d}"
        cert = dict(cert)
        cert["pid"] = pid
        cert["source_cube"] = {str(c): sorted(v)
                               for c, v in row.get("cube", {}).items()}
        with open(f"{CERTS}/{pid}.json", "w") as f:
            json.dump(cert, f)
        imgs = miner.orbit(pat)
        k = len(miner.pattern_points(pat))
        with open(BANK, "a") as f:
            f.write(json.dumps({
                "pid": pid,
                "pattern": {str(c): sorted(M) for c, M in pat.items()},
                "kill": cert["kill"],
                "n_orbit": len(imgs),
                "k": k,
                "iter": -1,  # frontier-sourced, not a CEGAR iteration
                "cert": f"certs/{pid}.json"}) + "\n")
        print(f"ADDED {pid}: kill={cert['kill']} orbit={len(imgs)} k={k}",
              flush=True)
        npat += 1
        added += 1
    print(f"DONE: appended {added} row(s); bank now {npat} rows", flush=True)


if __name__ == "__main__":
    main()
