#!/usr/bin/env python3
"""D2 schema validation: confirm the reading of the ported u12 census data.

Checks performed (all must pass before any invariant is computed):
  V1  dead/alive jsonl line counts match the census logs
      (654: stage1 DEAD 958 / ALIVE 1042 of 2000; 555: DEAD 924 / ALIVE 1076).
  V2  _u12_alive_654.jsonl (164 lines) matches census_654.json n_alive_C=164
      and its first line equals first_alive_C (the 300-cube pilot run).
  V3  deterministic sampler regeneration: sample_cubes(prof, 2000, seed=7)
      reproduces a superset relationship -- every DEAD cube appears in the
      regenerated sample, the complement size equals the logged ALIVE count,
      and every ported alive-654 cube (i) is in the first 300 regenerated
      cubes, (ii) is NOT in the dead set, (iii) is in the complement.
  V4  gen_map schema: 36 generators per cube, 3 per center, star form
      (c, K_c[0], K_c[j]); each generator involves 3 distinct points.
  V5  attempts counts match the census logs (654: 2095, 555: 2004)
      [sampler-version identity check; failure here is a FLAG, not fatal,
       as long as V3 membership checks pass].

Writes: alive_2000_{profile}.jsonl (the derived full ALIVE control sets,
in regenerated-sample order) + validation_summary.json
"""
import importlib.util
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


cen = _load("cen", f"{PORT}/_u12_census.py")
MCS = _load("mcs", f"{PORT}/_min_core_sound.py")

N = 12
EXPECT = {
    "654": {"dead": 958, "alive": 1042, "attempts": 2095},
    "555": {"dead": 924, "alive": 1076, "attempts": 2004},
}


def read_jsonl(path):
    out = []
    with open(path) as f:
        for ln in f:
            ln = ln.strip()
            if ln:
                out.append(json.loads(ln))
    return out


def cube_key(cube):
    """Canonical hashable key for a cube given as {str_or_int p: [4 members]}."""
    return tuple(tuple(sorted(cube[k] if k in cube else cube[str(k)])) for k in range(N))


def main():
    summary = {"pass": True, "checks": {}}

    def check(name, ok, detail):
        summary["checks"][name] = {"ok": bool(ok), "detail": detail}
        print(f"[{'OK' if ok else 'FAIL'}] {name}: {detail}", flush=True)
        if not ok:
            summary["pass"] = False

    # ---- V1/V2: file counts
    dead = {p: read_jsonl(f"{PORT}/_u12_dead_{p}.jsonl") for p in ("654", "555")}
    alive654_port = read_jsonl(f"{PORT}/_u12_alive_654.jsonl")
    for p in ("654", "555"):
        check(f"V1 dead_{p} count", len(dead[p]) == EXPECT[p]["dead"],
              f"{len(dead[p])} == {EXPECT[p]['dead']} (stage1 DEAD, census log)")
    cj = json.load(open(f"{PORT}/_u12_census_654.json"))
    check("V2 alive_654 count", len(alive654_port) == cj["n_alive_C"],
          f"{len(alive654_port)} == n_alive_C {cj['n_alive_C']} (300-cube pilot)")
    check("V2 first_alive match", cube_key(alive654_port[0]) == cube_key(cj["first_alive_C"]),
          "first line of _u12_alive_654.jsonl == census_654.json first_alive_C")

    # ---- V4: gen_map schema on one cube of each file
    for p in ("654", "555"):
        cube = {int(k): v for k, v in dead[p][0].items()}
        gm = MCS.gen_map(cube)
        ok = (len(gm) == 36
              and all(g[1] == cube[g[0]][0] for g in gm)
              and all(g[2] in cube[g[0]][1:] for g in gm)
              and all(len({g[0], g[1], g[2]}) == 3 for g in gm)
              and all(sum(1 for g in gm if g[0] == c) == 3 for c in range(N)))
        check(f"V4 gen_map schema dead_{p}[0]", ok,
              "36 gens, star (c, K_c[0], K_c[j]), 3 distinct points each, 3 per center")

    # ---- V3/V5: deterministic regeneration
    for p in ("654", "555"):
        prof = cen.PROFILES[p]
        cen._validate_profile(prof)
        cubes, att = cen.sample_cubes(prof, 2000, seed=7)
        keys = [cube_key(c) for c in cubes]
        keyset = set(keys)
        check(f"V3 regen_{p} distinct", len(keyset) == 2000, f"2000 distinct cubes regenerated")
        check(f"V5 regen_{p} attempts", att == EXPECT[p]["attempts"],
              f"attempts {att} vs census-log {EXPECT[p]['attempts']}")
        deadkeys = set(cube_key(c) for c in dead[p])
        check(f"V3 dead_{p} subset", deadkeys <= keyset,
              f"all {len(deadkeys)} dead cubes in regenerated sample "
              f"(missing {len(deadkeys - keyset)})")
        alive_keys = [k for k in keys if k not in deadkeys]
        check(f"V3 alive_{p} complement size", len(alive_keys) == EXPECT[p]["alive"],
              f"{len(alive_keys)} == logged stage1 ALIVE {EXPECT[p]['alive']}")
        if p == "654":
            first300 = set(keys[:300])
            pk = [cube_key(c) for c in alive654_port]
            check("V3 ported alive in first300",
                  all(k in first300 for k in pk),
                  f"{sum(k in first300 for k in pk)}/164 ported alive cubes in regenerated first 300")
            check("V3 ported alive disjoint from dead",
                  all(k not in deadkeys for k in pk),
                  f"{sum(k not in deadkeys for k in pk)}/164 not in dead set")
        # persist derived ALIVE control sets (regenerated-sample order)
        idx = {k: i for i, k in enumerate(keys)}
        with open(f"{HERE}/alive_2000_{p}.jsonl", "w") as f:
            for c in cubes:
                if cube_key(c) not in deadkeys:
                    f.write(json.dumps({str(q): sorted(c[q]) for q in range(N)}) + "\n")
        print(f"  wrote alive_2000_{p}.jsonl ({len(alive_keys)} cubes)", flush=True)

    with open(f"{HERE}/validation_summary.json", "w") as f:
        json.dump(summary, f, indent=2)
    print(f"\nVALIDATION {'PASS' if summary['pass'] else 'FAIL'}", flush=True)
    return 0 if summary["pass"] else 1


if __name__ == "__main__":
    sys.exit(main())
