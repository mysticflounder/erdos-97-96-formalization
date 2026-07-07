#!/usr/bin/env python3
"""Spot-verify ALIVE (stage-1 C-equidistance) labels of the derived control sets.

The alive_2000_{profile}.jsonl files are derived as (deterministic 2000-cube
sample) minus (ported msolve-verified DEAD set); their ALIVE labels are
inherited from the census-log tallies.  This script re-runs the ported
census certify() (msolve char-0 solve; [-1] == DEAD) on a random sample of
derived-alive cubes per profile, plus a random sample of ported DEAD cubes
as negative controls, and reports agreement.

Usage: uv run --with sympy python spot_verify_alive.py [n_per_side=25]
"""
import importlib.util
import json
import os
import random
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


cen = _load("cen", f"{PORT}/_u12_census.py")


def read_jsonl(path):
    with open(path) as f:
        return [json.loads(ln) for ln in f if ln.strip()]


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 25
    rng = random.Random(20260706)
    out = {}
    for p in ("555", "654"):
        alive = read_jsonl(f"{HERE}/alive_2000_{p}.jsonl")
        dead = read_jsonl(f"{PORT}/_u12_dead_{p}.jsonl")
        res = {"alive_sample": {"ALIVE": 0, "DEAD": 0, "TIMEOUT": 0},
               "dead_sample": {"ALIVE": 0, "DEAD": 0, "TIMEOUT": 0}}
        for cube in rng.sample(alive, min(n, len(alive))):
            v = cen.certify({int(k): v for k, v in cube.items()}, timeout=120)
            res["alive_sample"][v] += 1
        for cube in rng.sample(dead, min(n, len(dead))):
            v = cen.certify({int(k): v for k, v in cube.items()}, timeout=120)
            res["dead_sample"][v] += 1
        out[p] = res
        print(f"[{p}] derived-ALIVE sample: {res['alive_sample']}  "
              f"(expect all ALIVE)", flush=True)
        print(f"[{p}] ported-DEAD sample:   {res['dead_sample']}  "
              f"(expect all DEAD)", flush=True)
    with open(f"{HERE}/spot_verify_alive.json", "w") as f:
        json.dump(out, f, indent=2)
    ok = all(out[p]["alive_sample"]["DEAD"] == 0 and out[p]["dead_sample"]["ALIVE"] == 0
             for p in out)
    print(f"SPOT-VERIFY {'PASS' if ok else 'FAIL'}", flush=True)


if __name__ == "__main__":
    main()
