#!/usr/bin/env python3
"""Extract explicit collision witness pairs for the near-separating combos.

For each of the target combos, find alive controls whose combo value matches
a dead core's, and emit the pair (dead core id/P/cube, control id/P/cube)
with the shared invariant values.  These are the concrete counterexamples
showing the combo cannot decide feasibility.

Then directly solver-verify the first N witness controls: run msolve char-0
solve on the control's induced subsystem (must be ALIVE/feasible) and confirm
via the ported census certify() convention; the paired dead core is already
Singular-confirmed infeasible by mining.

Output: collision_witnesses.json
"""
import gzip
import importlib.util
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
from invariants import cube_gen_map, induced_constraints  # noqa: E402

SCALAR_INVS = ["k", "R", "delta", "max_sub_delta_all", "max_sub_delta_proper",
               "n_sub_tight", "n_sub_over", "n_circles", "max_circle_degree",
               "min_circle_degree", "E_star_edges", "E_minus_2k",
               "max_member_degree", "min_member_degree", "min_L_at_max_delta",
               "max_contract_delta", "max_contract_delta_z0",
               "gauge_contract_delta", "gauge_contract_z",
               "n_pairs_contract_over", "n_pairs_z_pos"]
TARGETS = [
    ("ALL_scalars", SCALAR_INVS),
    ("k+delta+contraction", ["k", "delta", "contraction_profile"]),
    ("k+delta+contraction+circledeg",
     ["k", "delta", "contraction_profile", "circle_degree_profile"]),
]
MAX_PER_TARGET = 6
N_VERIFY = 4


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


def combo_val(rec, names):
    return repr([rec[n] for n in names])


def main():
    dead = [json.loads(ln) for ln in open(f"{HERE}/per_core_invariants.jsonl")]
    dead = [r for r in dead if r["singular_confirmed"]]
    dsets = {}
    for cname, names in TARGETS:
        m = {}
        for r in dead:
            m.setdefault(combo_val(r, names), []).append(r)
        dsets[cname] = m

    witnesses = {cname: [] for cname, _ in TARGETS}
    for prof in ("654", "555"):
        with gzip.open(f"{HERE}/controls_all_{prof}.jsonl.gz", "rt") as f:
            for ln in f:
                rec = json.loads(ln)
                for cname, names in TARGETS:
                    if len(witnesses[cname]) >= MAX_PER_TARGET:
                        continue
                    cv = combo_val(rec, names)
                    hits = dsets[cname].get(cv)
                    if hits:
                        witnesses[cname].append({
                            "control": {"profile": prof, "cube_idx": rec["cube_idx"],
                                        "P": rec["P"], "k": rec["k"],
                                        "delta": rec["delta"]},
                            "dead": [{"profile": h["profile"],
                                      "cube_idx": h["cube_idx"],
                                      "core_idx": h["core_idx"], "P": h["P"]}
                                     for h in hits[:3]],
                            "shared_combo_value": cv[:400],
                        })
        if all(len(witnesses[c]) >= MAX_PER_TARGET for c, _ in TARGETS):
            break

    # direct solver verification of witness controls (feasibility) and their
    # paired dead cores (infeasibility) using the ported oracles
    CM = _load("cm", f"{PORT}/_u12_core_mine.py")
    alive_cubes = {}
    for prof in ("654", "555"):
        alive_cubes[prof] = [json.loads(ln)
                             for ln in open(f"{HERE}/alive_2000_{prof}.jsonl")]
    dead_cubes = {}
    for prof in ("654", "555"):
        dead_cubes[prof] = [json.loads(ln)
                            for ln in open(f"{PORT}/_u12_dead_{prof}.jsonl")]

    def induced_verdict(cube_json, P):
        cube = {int(k): v for k, v in cube_json.items()}
        gm, polys, exp = CM.build_cube_polys(cube)
        idxs = [i for i, g in enumerate(gm) if set(g) <= set(P)]
        ms = CM.msolve_infeasible_char0(exp, idxs, timeout=60)
        sing = CM.singular_infeasible_char0(polys, idxs, timeout=120)
        return {"msolve": ms, "singular_infeasible": sing, "n_gens": len(idxs)}

    verifications = []
    seen = set()
    for cname, _ in TARGETS:
        for w in witnesses[cname]:
            key = (w["control"]["profile"], w["control"]["cube_idx"],
                   tuple(w["control"]["P"]))
            if key in seen or len(verifications) >= N_VERIFY:
                continue
            seen.add(key)
            prof = w["control"]["profile"]
            ctl = induced_verdict(alive_cubes[prof][w["control"]["cube_idx"]],
                                  w["control"]["P"])
            d0 = w["dead"][0]
            dd = induced_verdict(dead_cubes[d0["profile"]][d0["cube_idx"]],
                                 d0["P"])
            verifications.append({
                "combo": cname, "control": w["control"],
                "control_verdict": ctl,
                "paired_dead": d0, "dead_verdict": dd,
                "witness_valid": (ctl["msolve"] != "infeasible"
                                  and ctl["singular_infeasible"] is False
                                  and dd["singular_infeasible"] is True),
            })
            print(f"[{cname}] control {prof}/cube{w['control']['cube_idx']}/P={w['control']['P']}"
                  f" -> {ctl} ; dead {d0['profile']}/cube{d0['cube_idx']}/P={d0['P']}"
                  f" -> {dd}", flush=True)

    out = {"witnesses": witnesses, "solver_verifications": verifications}
    with open(f"{HERE}/collision_witnesses.json", "w") as f:
        json.dump(out, f, indent=1)
    nv = sum(1 for v in verifications if v["witness_valid"])
    print(f"witness pairs extracted: "
          f"{ {c: len(w) for c, w in witnesses.items()} }; "
          f"solver-verified valid: {nv}/{len(verifications)}", flush=True)


if __name__ == "__main__":
    main()
