#!/usr/bin/env python3
"""CEGAR coverage loop for the (5,5,4) census.

Loop (miner-first, multi-pattern banking):
  SAT: find a constrained cube (C1/C2/C4/one-hit) containing no banked pattern.
    UNSAT -> coverage complete: every constrained cube contains a banked dead
             pattern; the bank + certificates ARE the exhaustive census.
    SAT   -> mine ALL msolve-dead min-k induced patterns of the witness
             (greedy-shrunk, AUTOS-canonical-deduped).
             some found -> certify each (Singular lift + exact python Fraction
                     identity), bank each full AUTOS orbit, loop.  The engine
                     verdict is SKIPPED: every banked kill is itself an exact
                     deadness proof of the witness (pattern polys ⊆ cube ideal).
             none found -> exact engine ALIVE screen (Singular):
                     UNDECIDED_OR_CANDIDATE -> STOP, persist witness (ALIVE).
                     TIMEOUT twice          -> STOP, persist witness (STUCK).
                     dead -> certify the full cube as a pattern; bank it.
             nothing banked in an iteration (all certifies failed) ->
                     escalate to engine + full-cube certificate; if that also
                     fails -> STOP (CERTFAIL).  Never loop on the same witness.

State persists in bank.jsonl / certs/ / cegar.log; resumable (load_bank
replays bank.jsonl into exclusions).
"""

import fcntl
import json
import os
import sys
import time

import census554_lib as L
import engine
import miner
import sat_cover

HERE = os.path.dirname(os.path.abspath(__file__))
BANK = f"{HERE}/bank.jsonl"
FAILED = f"{HERE}/failed.jsonl"
CERTS = f"{HERE}/certs"
LOG = f"{HERE}/cegar.log"
ALIVE = f"{HERE}/ALIVE_CANDIDATE.json"
DONE = f"{HERE}/COVERAGE_COMPLETE.json"
CNFTMP = f"{sat_cover.SCRATCH}/census554_cegar.cnf"
LOCK = f"{HERE}/bank.jsonl.lock"

os.makedirs(CERTS, exist_ok=True)


def acquire_bank_lock():
    """Whole-run exclusive writer lock on bank.jsonl (audit 2026-07-09 P1:
    every bank writer must take the same OS-level lock; frontier_add.py
    takes it per append).  Non-blocking: refuse to start if another writer
    holds it.  Held until process exit; pid allocation from the in-memory
    counter is safe only under this lock."""
    lockf = open(LOCK, "w")
    try:
        fcntl.flock(lockf, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except OSError:
        raise SystemExit(
            "REFUSING to start: another bank writer holds bank.jsonl.lock "
            "(frontier_add.py or another cegar/frontier driver). "
            "Single-writer invariant — stop it first.")
    return lockf  # keep the handle alive; closing releases the lock


def log(msg):
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    with open(LOG, "a") as f:
        f.write(line + "\n")


def load_bank():
    pats = []
    if os.path.exists(BANK):
        with open(BANK) as f:
            for ln in f:
                d = json.loads(ln)
                pats.append({int(c): frozenset(M)
                             for c, M in d["pattern"].items()})
    return pats


def load_failed():
    """Persistent certify-fail blacklist (canonical keys)."""
    keys = set()
    if os.path.exists(FAILED):
        with open(FAILED) as f:
            for ln in f:
                d = json.loads(ln)
                pat = {int(c): frozenset(M) for c, M in d["pattern"].items()}
                keys.add(miner.canon_key(pat))
    return keys


def stop_alive(it, cube, v, tag="ALIVE CANDIDATE"):
    log(f"iter {it}: {tag} — STOP. cube={json.dumps(cube)}")
    with open(ALIVE, "w") as f:
        json.dump({"cube": {str(c): cube[c] for c in cube},
                   "verdict": v}, f, indent=2)


def main(max_iters=100000, wall_budget_s=None):
    _bank_lock = acquire_bank_lock()  # noqa: F841 — held for process life
    t_start = time.time()
    inst = sat_cover.CoverInstance()
    bank = load_bank()
    all_instances = []
    n_inst = 0
    for pat in bank:
        for img in miner.orbit(pat):
            inst.add_pattern_instance(img)
            all_instances.append(img)
            n_inst += 1
    npat = len(bank)
    failed_keys = load_failed()  # persistent certify-fail blacklist
    log(f"resume: {npat} banked orbits ({n_inst} instances), "
        f"{len(failed_keys)} blacklisted fail-patterns")

    def bank_one(pat, cert, cube, v, kmin, it):
        nonlocal npat, n_inst
        pid = f"pat_{npat:05d}"
        cert["pid"] = pid
        cert["source_cube"] = {str(c): cube[c] for c in cube}
        if v is not None:
            cert["source_verdict"] = {kk: v[kk] for kk in
                                      ("verdict", "base_dim") if kk in v}
        with open(f"{CERTS}/{pid}.json", "w") as f:
            json.dump(cert, f)
        imgs = miner.orbit(pat)
        with open(BANK, "a") as f:
            f.write(json.dumps({
                "pid": pid,
                "pattern": {str(c): sorted(M) for c, M in pat.items()},
                "kill": cert["kill"],
                "n_orbit": len(imgs),
                "k": kmin,
                "iter": it,
                "cert": f"certs/{pid}.json"}) + "\n")
        bank.append(pat)
        npat += 1
        for img in imgs:
            inst.add_pattern_instance(img)
            all_instances.append(img)
            n_inst += 1
        return len(imgs)

    it = 0
    while it < max_iters:
        if wall_budget_s and time.time() - t_start > wall_budget_s:
            log(f"wall budget reached: session iters={it}, "
                f"bank={npat} orbits ({n_inst} instances)")
            return "BUDGET"
        t0 = time.time()
        res, cube = inst.solve(CNFTMP, timeout=3600)
        t_sat = time.time() - t0
        if res == "UNSAT":
            log(f"UNSAT after {npat} orbits ({n_inst} instances) "
                f"— COVERAGE COMPLETE")
            with open(DONE, "w") as f:
                json.dump({"n_orbits": npat,
                           "n_instances": n_inst,
                           "wall_s": round(time.time() - t_start, 1)}, f,
                          indent=2)
            return "COMPLETE"
        if res != "SAT":
            log(f"SAT solver anomaly: {res}")
            return "ERR"
        assert L.cube_ok(cube), f"witness violates constraints: {cube}"
        if it < 3 or it % 25 == 0:
            for img in all_instances:
                assert not miner.contains(cube, img), \
                    f"witness contains banked pattern {img}"

        # ---- upgrade (a): miner-first fast path ----
        t0 = time.time()
        pats, kmin = miner.mine_all_patterns(cube,
                                             log=lambda m: log(f"  {m}"))
        t_mine = time.time() - t0
        v = None
        if not pats:
            # no msolve-dead induced pattern: exact engine ALIVE screen
            t0 = time.time()
            v = engine.verdict_one(cube, timeout=600)
            t_verd = time.time() - t0
            if v["verdict"] == "TIMEOUT":
                v = engine.verdict_one(cube, timeout=3600)
                t_verd = time.time() - t0
            if v["verdict"] == "UNDECIDED_OR_CANDIDATE":
                stop_alive(it, cube, v)
                return "ALIVE"
            if v["verdict"] == "TIMEOUT":
                stop_alive(it, cube, v, tag="verdict TIMEOUT at 3600s")
                return "STUCK"
            log(f"  no msolve-dead pattern; engine screen: {v['verdict']} "
                f"in {t_verd:.1f}s; certifying full cube")
            pats = [{c: frozenset(cube[c]) for c in range(L.N)}]

        # ---- upgrade (b): certify + bank ALL mined patterns ----
        t0 = time.time()
        work, n_skip, n_blk = [], 0, 0
        for pat in pats:
            if any(miner.instance_subsumes(img, pat)
                   for img in all_instances):
                n_skip += 1
            elif miner.canon_key(pat) in failed_keys:
                n_blk += 1  # certify already failed on this canonical form
            else:
                work.append(pat)
        from concurrent.futures import ThreadPoolExecutor
        with ThreadPoolExecutor(max_workers=8) as ex:
            certs = list(ex.map(miner.certify_pattern, work))
        n_new, n_fail = 0, 0
        kills, orbit_sizes = [], []
        for pat, cert in zip(work, certs):
            if cert is None:
                n_fail += 1
                failed_keys.add(miner.canon_key(pat))
                with open(FAILED, "a") as f:
                    f.write(json.dumps({"pattern": {str(c): sorted(M)
                                                    for c, M in pat.items()},
                                        "iter": it}) + "\n")
                log(f"    certify FAILED on mined pattern "
                    f"{ {c: sorted(M) for c, M in pat.items()} }")
                continue
            if any(miner.instance_subsumes(img, pat)
                   for img in all_instances):
                n_skip += 1  # subsumed by a pattern banked earlier this iter
                continue
            orbit_sizes.append(bank_one(pat, cert, cube, v, kmin, it))
            kills.append(cert["kill"])
            n_new += 1
        t_cert = time.time() - t0

        if n_new == 0:
            # escalation: nothing banked; the witness would repeat forever
            log(f"  iter {it}: 0 banked (skip={n_skip} blk={n_blk} "
                f"fail={n_fail}); escalating to engine + full-cube cert")
            if v is None:
                v = engine.verdict_one(cube, timeout=3600)
                if v["verdict"] == "UNDECIDED_OR_CANDIDATE":
                    stop_alive(it, cube, v)
                    return "ALIVE"
                if v["verdict"] == "TIMEOUT":
                    stop_alive(it, cube, v, tag="verdict TIMEOUT at 3600s")
                    return "STUCK"
            full = {c: frozenset(cube[c]) for c in range(L.N)}
            cert = miner.certify_pattern(full, timeout=1800)
            if cert is None:
                log(f"iter {it}: CANNOT CERTIFY dead cube — STOP. "
                    f"cube={json.dumps(cube)}")
                with open(ALIVE, "w") as f:
                    json.dump({"cube": {str(c): cube[c] for c in cube},
                               "verdict": v, "note": "certify failed"}, f,
                              indent=2)
                return "CERTFAIL"
            orbit_sizes.append(bank_one(full, cert, cube, v, None, it))
            kills.append(cert["kill"])
            n_new = 1

        src = "miner" if v is None else f"engine:{v['verdict']}"
        log(f"iter {it}: src={src} k={kmin} banked={n_new} "
            f"(skip={n_skip} blk={n_blk} fail={n_fail}) kills={kills} "
            f"orbits={orbit_sizes} bank={npat} inst={n_inst} "
            f"[sat {t_sat:.1f}s mine {t_mine:.1f}s cert {t_cert:.1f}s]")
        it += 1
    return "MAXITER"


if __name__ == "__main__":
    budget = int(sys.argv[1]) if len(sys.argv) > 1 else None
    print(main(wall_budget_s=budget))
