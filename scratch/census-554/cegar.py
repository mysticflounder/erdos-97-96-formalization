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

import json
import os
import sys
import time
from pathlib import Path

HERE_PATH = Path(__file__).resolve().parent
REPO_ROOT = HERE_PATH.parent.parent
sys.path.insert(0, str(HERE_PATH))
sys.path.insert(0, str(REPO_ROOT))

import census554_lib as L
import engine
import miner
import sat_cover
import verify_certs
from census.census_554.io_protocol import (
    BankEntry,
    LockBusy,
    atomic_write_json,
    commit_bank_records,
    driver_lease,
)

HERE = str(HERE_PATH)
BANK = f"{HERE}/bank.jsonl"
FAILED = f"{HERE}/failed.jsonl"
LOG = f"{HERE}/cegar.log"
ALIVE = f"{HERE}/ALIVE_CANDIDATE.json"
CNFTMP = f"{sat_cover.SCRATCH}/census554_cegar.cnf"


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
    atomic_write_json(
        Path(ALIVE),
        {"cube": {str(c): cube[c] for c in cube}, "verdict": v},
    )


def _run(max_iters=100000, wall_budget_s=None):
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

    def bank_many(pending, cube, v, it):
        nonlocal npat, n_inst
        entries = []
        for pat, cert, kmin in pending:
            cert = dict(cert)
            cert["source_cube"] = {str(c): cube[c] for c in cube}
            if v is not None:
                cert["source_verdict"] = {
                    key: v[key] for key in ("verdict", "base_dim") if key in v
                }
            entries.append(BankEntry(
                pattern=pat,
                certificate=cert,
                fields={
                    "n_orbit": len(miner.orbit(pat)),
                    "k": kmin,
                    "iter": it,
                },
            ))
        result = commit_bank_records(
            HERE,
            entries,
            canonical_key=miner.canon_key,
            validate=verify_certs.verify_cert,
        )
        orbit_sizes = []
        kills = []
        for record in result.records:
            pat = {
                int(c): frozenset(members)
                for c, members in record["pattern"].items()
            }
            images = miner.orbit(pat)
            bank.append(pat)
            npat += 1
            orbit_sizes.append(len(images))
            kills.append(record["kill"])
            for image in images:
                inst.add_pattern_instance(image)
                all_instances.append(image)
                n_inst += 1
        if result.skipped_duplicates:
            log(f"  transaction skipped {result.skipped_duplicates} "
                "canonical duplicate(s)")
        return orbit_sizes, kills

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
            log(f"UNSAT after {npat} orbits ({n_inst} instances), but this "
                "retired broad driver cannot publish coverage. No completion "
                "marker was written; use frontier_loop.py for proof-gated "
                "terminal artifacts.")
            return "UNSAT_UNPUBLISHED"
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
        n_fail = 0
        kills, orbit_sizes = [], []
        pending = []
        pending_instances = []
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
            if (any(miner.instance_subsumes(img, pat)
                    for img in all_instances)
                    or any(miner.instance_subsumes(img, pat)
                           for img in pending_instances)):
                n_skip += 1  # subsumed by a pattern banked earlier this iter
                continue
            pending.append((pat, cert, kmin))
            pending_instances.extend(miner.orbit(pat))
        if pending:
            orbit_sizes, kills = bank_many(pending, cube, v, it)
        n_new = len(orbit_sizes)
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
                atomic_write_json(
                    Path(ALIVE),
                    {"cube": {str(c): cube[c] for c in cube},
                     "verdict": v, "note": "certify failed"},
                )
                return "CERTFAIL"
            orbit_sizes, kills = bank_many([(full, cert, None)], cube, v, it)
            n_new = len(orbit_sizes)
            if n_new == 0:
                log(f"iter {it}: full-cube certificate canonical-duplicates "
                    "the bank but did not exclude the witness — STOP")
                return "INVARIANT_FAILURE"

        src = "miner" if v is None else f"engine:{v['verdict']}"
        log(f"iter {it}: src={src} k={kmin} banked={n_new} "
            f"(skip={n_skip} blk={n_blk} fail={n_fail}) kills={kills} "
            f"orbits={orbit_sizes} bank={npat} inst={n_inst} "
            f"[sat {t_sat:.1f}s mine {t_mine:.1f}s cert {t_cert:.1f}s]")
        it += 1
    return "MAXITER"


def main(max_iters=100000, wall_budget_s=None):
    try:
        with driver_lease(HERE):
            return _run(max_iters=max_iters, wall_budget_s=wall_budget_s)
    except LockBusy as exc:
        log(f"REFUSING: {exc}")
        return "LOCKED"


if __name__ == "__main__":
    budget = int(sys.argv[1]) if len(sys.argv) > 1 else None
    print(main(wall_budget_s=budget))
