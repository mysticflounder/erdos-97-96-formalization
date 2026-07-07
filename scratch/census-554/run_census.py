#!/usr/bin/env python3
"""Chunked driver for the long (5,5,4) CEGAR run.

Each chunk is a fresh cegar.py process that resumes from bank.jsonl (this
exercises the resume path every chunk and keeps memory fresh).  The driver
stops on any terminal status (COMPLETE / ALIVE / STUCK / CERTFAIL / ERR /
MAXITER) or when the total wall budget is exhausted (status BUDGET — coverage
partial, numbers in run_census.log; NO silent caps).
"""

import json
import os
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
RUNLOG = f"{HERE}/run_census.log"
TERMINAL = {"COMPLETE", "ALIVE", "STUCK", "CERTFAIL", "ERR", "MAXITER"}


def rlog(msg):
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    with open(RUNLOG, "a") as f:
        f.write(line + "\n")


def bank_stats():
    n_orb, n_inst = 0, 0
    p = f"{HERE}/bank.jsonl"
    if os.path.exists(p):
        with open(p) as f:
            for ln in f:
                d = json.loads(ln)
                n_orb += 1
                n_inst += d.get("n_orbit", 0)
    return n_orb, n_inst


def main(total_s, chunk_s):
    t0 = time.time()
    chunk_i = 0
    status = "BUDGET"
    rlog(f"driver start: total={total_s}s chunk={chunk_s}s "
         f"bank={bank_stats()}")
    while time.time() - t0 < total_s:
        remain = total_s - (time.time() - t0)
        this_chunk = int(min(chunk_s, max(120, remain)))
        o0, i0 = bank_stats()
        tc = time.time()
        try:
            pr = subprocess.run(
                [sys.executable, f"{HERE}/cegar.py", str(this_chunk)],
                capture_output=True, text=True, timeout=this_chunk + 7200)
        except subprocess.TimeoutExpired:
            rlog(f"chunk {chunk_i}: HARD TIMEOUT (>{this_chunk + 7200}s) "
                 f"— anomaly, stopping")
            status = "HANG"
            break
        out = pr.stdout.strip().splitlines()
        status = out[-1] if out else "ERR"
        o1, i1 = bank_stats()
        dt = time.time() - tc
        rlog(f"chunk {chunk_i}: status={status} wall={dt:.0f}s "
             f"bank {o0}->{o1} orbits ({i0}->{i1} inst) "
             f"rate={(o1 - o0) / max(1e-9, dt / 60):.1f} orb/min")
        if pr.returncode != 0:
            rlog(f"chunk {chunk_i}: exit code {pr.returncode}; stderr tail: "
                 f"{pr.stderr[-2000:]}")
            status = "ERR"
            break
        if status in TERMINAL:
            break
        if status != "BUDGET":
            rlog(f"chunk {chunk_i}: unrecognized status {status!r}; stopping")
            status = "ERR"
            break
        chunk_i += 1
    rlog(f"driver done: status={status} wall={time.time() - t0:.0f}s "
         f"final bank={bank_stats()}")
    return status


if __name__ == "__main__":
    total = int(sys.argv[1]) if len(sys.argv) > 1 else 21600
    chunk = int(sys.argv[2]) if len(sys.argv) > 2 else 1200
    print(main(total, chunk))
