# census-554 queue worker

Pull-based work-queue client for the census-554 CEGAR frontier loop.
Launch one on **any system** that can see the NFS bridge; every running
copy pulls jobs (mining deadness batches + certificate constructions)
from the shared queue and races to claim them. More clients = more
throughput; no configuration on the driver side.

## Requirements

- python3.10+ (stdlib only)
- `msolve` and `Singular` on PATH
- the queue root mounted (default `/opt/nfs/erdos9796-flux-bridge`;
  on flux it is mounted at `/mnt/nfs/erdos9796-flux-bridge`)

## Deploy + run

```sh
scp -r worker/ <host>:census554-worker/
ssh <host>
cd census554-worker
./run_worker.sh --queue-root /mnt/nfs/erdos9796-flux-bridge   # flux path
# or, where the mount matches the default:
./run_worker.sh
```

Options pass through to `census554_worker.py`:
`--workers N` (default cpu_count-2), `--cert-timeout S` (default 900
**cumulative process-plus-child CPU seconds across the whole certificate**),
`--poll-interval S` (default 1.0), `--mine-only` (claim only `mine-*`
jobs, skipping certify/retrycert — for low-RAM hosts: retrycert
Singular processes have been measured at 20–42G RSS, so any host
without ~50G headroom per cert slot should mine only), and `--cert-only`
(claim certificate and retrycert jobs but never mining batches).
`--max-retry-inflight N` caps only the long-timeout `retrycert-*` class;
regular `cert-*` jobs can use every worker slot. On the driver host use two
retry slots out of four total so a new live frontier is never trapped behind
four two-hour Singular runs. Env
`CENSUS554_QUEUE_ROOT` overrides the default queue root.

The CPU budget is shared by base membership, every msolve shrink probe, the
Singular lift, and exact Python replay. It is not reset per stage. A generous
wall guard only catches wedged processes and is reported separately; ordinary
sleep or CPU contention does not consume the certification budget. Worker
results include self CPU, child CPU, total CPU, wall time, budget exhaustion,
and a certifier-version identity used by the driver's persistent exact-outcome
cache.

Stop: `kill "$(cat worker.pid)"` — SIGTERM drains in-flight jobs, writes
their results, removes the host's heartbeat file, then exits.

### macOS caveats

- Launch the worker from a plain terminal or tmux pane, NOT from a
  sandboxed Claude Code bash: the seatbelt sandbox denies NFS access
  with `PermissionError: [Errno 1] Operation not permitted` on the
  first `jobs/` scan (observed 2026-07-11).
- macOS drops AppleDouble `._<name>.json` metadata files next to real
  files on NFS. The worker's claim loop and the driver's
  `queue_client.live_capacity()` both skip dotfiles for this reason —
  keep that invariant if you touch either scan.

## Deployed fleet (2026-07-12)

- `dada-mun-26.local` (driver box, 32 cores): certificate-only; use a
  conservative slot count while the 2-hour retry backlog is live because each
  Singular can consume 20–42G RSS. It was previously 16 mixed-role slots
  (reduced from 24
  after two hard crashes under sustained Singular load, 2026-07-11/12;
  root cause found 2026-07-12: the box's memory-hog-killer script had
  stopped working, so certify load exhausted RAM — script restored, but
  note a hogging Singular job may now be killed mid-run, surfacing as a
  certify failure rather than a crash), launched with four total slots as
  `--cert-only --max-retry-inflight 2` from `scratch/census-554/worker/`.
- `flux` (16-core x86_64, 39G RAM, queue root
  `/mnt/nfs/erdos9796-flux-bridge`): **mine-only, 14 slots**
  (2026-07-12: repeated silent worker deaths tracked to retrycert
  memory pressure — cert Singulars run 20–42G against 39G total RAM,
  so flux now claims only `mine-*` jobs and slot count is restored),
  deployed at `~/census554-worker/`, run under `supervise_worker.sh`
  (below):
  `setsid nohup ./supervise_worker.sh /mnt/nfs/erdos9796-flux-bridge 14 --mine-only &`
  Replaces the retired `flux_worker/remote_certify_worker.py` daemon
  (stopped 2026-07-11); that legacy path
  (`CENSUS554_REMOTE_CERT`/`CENSUS554_REMOTE_MINE`) remains in
  frontier_loop.py/remote_mine.py as a fallback but the queue
  (`CENSUS554_QUEUE=1`) supersedes it.
- `adams-macbook-m5.local`: **mine-only, opportunistic slots** (advertised
  dynamically by its heartbeat; 8 and 12 have both been observed). The worker is
  deliberately idle-gated: it runs only while Adam is not using the MacBook
  and is expected to disappear from the fleet during interactive use. Never
  bypass that gate by starting an always-on worker directly. Its NFS heartbeat
  is sufficient for driver scheduling even when Remote Login/SSH is
  unavailable; a stale heartbeat means zero schedulable capacity and must not
  be reported as a live worker.
- Capacity planning uses `flux`'s 14 mine slots as the dependable baseline;
  MacBook capacity is a bonus when its idle gate is open. Ask Adam whether to
  make the MacBook available when more than 28 unclaimed mine chunks persist
  (two flux-sized waves), or when the oldest unclaimed mine chunk has waited
  more than five minutes. Do not alert on transient bursts that flux drains
  inside those limits.

### supervise_worker.sh (silent-death forensics + auto-restart)

The flux daemon died silently three times on 2026-07-11/12 (no
traceback, no oomd/kernel journal entry; each time shortly after
claiming retrycert jobs; leaves orphaned fork-children whose results
can never publish). Until the cause is known, run remote workers under
the supervisor:

```sh
setsid nohup ./supervise_worker.sh /mnt/nfs/erdos9796-flux-bridge 4 &
```

It records every exit code/signal to `worker-exits.log` and restarts
after 10s; a clean stop (exit 0 or SIGTERM/143 drain) is respected and
not restarted. `supervisor.pid` names the loop.

Footgun: `ssh <host> 'pkill -f census554_worker'` kills the ssh
session's own remote shell (the pattern matches its command line) and
returns 255. Stop workers with `kill "$(cat worker.pid)"`; stop the
supervisor first (`kill "$(cat supervisor.pid)"`) or it will restart
the drained worker.

Second footgun: under the supervisor, `worker.pid` is NOT maintained
(only `run_worker.sh` writes it), so it goes stale across supervisor
restarts — a kill against it hits a dead pid and leaves the old worker
running alongside the new one (observed 2026-07-12). Find the live
worker with `ps ax | grep '[c]ensus554_worker'` and kill that pid.

## How it interacts with the driver

- The driver (`scratch/census-554/frontier_loop.py`, run with
  `CENSUS554_QUEUE=1`) enqueues all mining-oracle batches and certify
  jobs as files under `jobs/`, and consumes `results/`.
- A frontier advances after its first exact certificate. Every other pattern
  is durably keyed by the bank's exact AUTOS action in
  `certification_backlog.d/` for the long-budget retry drainer; an unclaimed
  queue job is cancelled, while already-claimed work may finish harmlessly.
  A restarted drainer recovers completed `retrycert-*` result files before
  submitting new work, so a supervisor restart does not discard a large exact
  certificate.
- Workers claim a job by atomically renaming it to `<name>.claimed`
  (same-directory rename; the loser of a race just moves on) and only
  claim up to their free process slots, so queued jobs stay available
  to other hosts.
- Each worker refreshes `heartbeats/<hostname>.json` every ~5s and advertises
  `mine` and/or `certify` capabilities. The driver treats heartbeats fresher
  than 120s as live only for the requested job class. A legacy heartbeat is
  mine-only for filtered scheduling; this fails safe for high-memory certs.
  With no matching live capacity the driver uses its local checked fallback,
  so the census never stalls because workers went away.
- Workers never touch `bank.jsonl`, `driver.lock`, or any other
  live-loop state. Soundness never depends on a worker: mining flags
  are a heuristic selection oracle (every banked motif is exactly
  re-proved by `certify_pattern`), and certificates are re-verified in
  exact `Fraction` arithmetic by the driver-side pipeline before
  banking.
- Known oracle asymmetry: the driver monkeypatches its local
  `pattern_dead_fast` to the exact intracap oracle
  (`frontier_loop.py`'s `_exact_dead`), while workers run the plain
  msolve heuristic (this package has no `intracap.py`). Selection-only
  difference, same as the production-validated flux hybrid: a false
  positive dies in certify, a false negative leaves a candidate
  unmined that iteration.

## Files

- `census554_worker.py` — the daemon (claims, computes, publishes)
- `miner.py`, `census554_lib.py` — standalone copies of the census
  oracle/certify code (identical to `scratch/census-554/` originals
  except a portable `SCRATCH` path in `miner.py`; do not let them
  drift silently)
- `run_worker.sh` — preflight + detached launch
