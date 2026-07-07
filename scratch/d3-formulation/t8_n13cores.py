#!/usr/bin/env python3
"""T8: minimal saturated-dead core sizes at n=13 (BDCE fixed-K probe).

Regenerates the deterministic n=13 profile-754/655 samples (seed 7, as in the
T6 run), certifies stage-1, and mines minimal saturated-dead induced subsystems
(same oracle as t7: induced equalities + gauge pin on two smallest + all-pair
Rabinowitsch within P) for the first few stage-1-dead AND stage-1-alive
(= stage-2-dead per T6) cubes. Question: does k* stay <= 8 at n=13?
"""
import importlib.util
import json
import os
import sys
from concurrent.futures import ThreadPoolExecutor

HERE = os.path.dirname(os.path.abspath(__file__))


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


t6 = _load("t6", f"{HERE}/t6_n13.py")
t7 = _load("t7", f"{HERE}/t7_stage2cores.py")


def main(profile="754", n_cubes=100, n_mine_dead=2, n_mine_alive=2, kmax=9,
         workers=8):
    prof = t6.PROFILES[profile]
    t6.N = prof["n"]
    t7.N = prof["n"]
    cubes, att = t6.sample_cubes(prof, n_cubes, seed=7)
    print(f"# regenerated {len(cubes)} cubes for {profile} (n={prof['n']})", flush=True)
    dead, alive = [], []
    with ThreadPoolExecutor(max_workers=workers) as ex:
        vs = list(ex.map(lambda c: t6.certify_stage1(c, 120), cubes))
    for c, v in zip(cubes, vs):
        (dead if v == "DEAD" else alive).append(c)
    print(f"# stage1: dead {len(dead)} alive {len(alive)}", flush=True)
    res = []
    for kind, pool, count in (("stage1-dead", dead, n_mine_dead),
                              ("stage2-dead", alive, n_mine_alive)):
        for i, cube in enumerate(pool[:count]):
            print(f"# mining {kind} cube {i} ...", flush=True)
            k, cores = t7.mine_cube(cube, kmax=kmax, workers=workers)
            print(f"  -> k* = {k}; cores at k*: {len(cores)}", flush=True)
            for P, R in cores[:4]:
                print(f"     P={P} R={R}", flush=True)
            res.append({"profile": profile, "kind": kind, "idx": i, "kstar": k,
                        "n_cores": len(cores)})
    with open(f"{HERE}/t8_{profile}.json", "w") as f:
        json.dump(res, f, indent=2)
    print(json.dumps(res), flush=True)


if __name__ == "__main__":
    main(profile=sys.argv[1] if len(sys.argv) > 1 else "754",
         n_cubes=int(sys.argv[2]) if len(sys.argv) > 2 else 100)
