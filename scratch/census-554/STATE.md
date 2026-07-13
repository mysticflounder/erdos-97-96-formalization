# census-554 working state

## Dependency status (corrected 2026-07-13)

Card 11 is closed by the current theorem stack. Census554 is an optional
independent research and engineering lane, not a prerequisite for K-A-PAIR,
K-A-LIVE, or publication. Open Census rows and the absence of a terminal cover
must therefore not be reported as an open card-11 theorem. The remaining
proof-critical mathematics is card ≥ 12 (`ATail` and the associated liveData
producer families).

The Census still has independent value: it can produce a checked finite cover,
test the formalized structural cores, and bank reusable exact motifs. Every
solver or oracle result retains its exact scope; speculative frontiers and
learned clauses are not Lean closure claims.

## Authoritative paused checkpoint (2026-07-13 11:00 PDT)

Census554 is paused off the proof-critical path without discarding any durable
state. The authoritative bank contains 5,939 rows and has SHA-256
`02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`.
The sole driver was interrupted outside a bank transaction after replaying
through iteration 173 (350,209 instances in 501 seconds). No
`.bank-transaction.json` remains.

The final bounded producer reached a natural terminal rather than being
killed mid-write:

```text
scratch/census-554/cube_prefetch_runs/
  run-20260713T161108Z-iter690-bank5934-rebase
```

Its schema-v4 state records `status=frontier-limit`, 2,428 attempts, nine
preserved frontier candidates, 2,113,600 learned exclusions in 499 durable
batches, and SHA-256
`c846a3c919d0a1573ce0900abd6e2336d4f045602f59547f9eead2eb0905fc62`.

No local `frontier_loop.py`, speculative producer, retry drainer,
certification worker, Census tmux session, or bank transaction is live. All
substantive shared-queue jobs were moved to:

```text
/opt/nfs/erdos9796-flux-bridge/paused/
  20260713T180000Z-off-critical-path/jobs
```

The active queue contains zero substantive jobs. AppleDouble `._*` metadata
files may remain there but are not dispatchable work. Existing result files,
pending stores, run directories, certificates, and bank history were
preserved. A future resume must first recheck processes, tmux sessions, locks,
the bank digest, pending/result reconciliation, and queue contents, then move
only explicitly selected jobs out of quarantine under a new resource lease.

The full 5,934-row immutable structural audit passed, but its
141,467,112,677-byte all-certificate exact replay remains `NOT_RUN`.
Individual post-audit bank admissions passed the guarded exact-admission path;
this is not a frozen final-cover certificate or a Census-produced Lean theorem.

## Historical live checkpoint (2026-07-13 02:35 PDT)

The present-tense process descriptions below are retained verbatim as dated
provenance. They are superseded by the authoritative paused checkpoint above.

The 13-family cached Oracle-13 invocation has reached its terminal residual and
is no longer running:

```text
scratch/census-554/separation_probe_runs/
  run-20260713T054559Z-oracle13-from-iter813
```

At 00:54 PDT it exited cleanly with `status=combined-frontier`, iteration 316,
2,464,637 total exclusions, and 4,440.017 seconds cumulative elapsed. All
refinements in the invocation were structural (`new_algebra_instances=0`), and
the final structural scan reported `no-applicable-core` for the surviving
direct order. This is terminal for that bounded oracle invocation, not complete
Census554 coverage.

`result.json`, `combined_frontier.json`, and `progress.json` are byte-identical,
SHA-256
`63f69c20f5c166493a8bdd194c62d51b399d893d35fadb8341b74b8c7b918cad`.
An independent `mine_frozen_frontier.validate_probe_result` call recomputed
`cube_ok`, direct internal order 43, its exact labels
`[0,10,9,1,3,5,4,2,6,8,7]`, and the cube/order compatibility without trusting
the stored validation flags. Full and quick SQLite integrity checks returned
`ok`; neither the 1.8 GB checkpoint nor the workdir lock has a live handle.
The terminal cube is:

```json
{"0":[2,4,5,9],"1":[0,5,6,7],"2":[1,7,9,10],"3":[0,4,8,9],"4":[1,2,5,8],"5":[2,3,6,9],"6":[2,3,7,8],"7":[3,5,8,10],"8":[0,4,6,10],"9":[1,6,8,10],"10":[1,3,4,7]}
```

The successor uses the exact frozen 5,836-row bank (SHA-256
`36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a`),
the digest-pinned perpendicular-core cache SHA-256
`bbd7b6aa6942b0f1b2c2c8da2365aa8a63d69a5f32edbbef7e07ddac9dbd4db0`,
and oracle contract SHA-256
`5040043d196154501086163699026d48a2d9be64083fbec8c059b38656471b5d`.
The catalog contains all 13 formalized alternatives: 12 raw-cube-eligible
families and the explicitly ineligible exact-off-circle family.

The exact, generation-bound consumer has completed and no longer has a live
process:

```text
scratch/census-554/frontier_mining_runs/
  run-20260713T081430Z-54070-30351c36
```

It completed with `status=certified` in 905.431 seconds. At minimum support 6,
Flux checked 158 of 178 candidates and the two-worker local share checked 20.
One selected pattern passed exact certificate structure, generator fidelity,
and Fraction identity verification (`kill=multi_pair`, 11 generators, orbit
36). The certified artifact has SHA-256
`7f8ad66760da4454785196771e2250491e1cddc03e9a4946f4a22e29ca8e47f6`.
After a second independent exact replay and a canonical-novelty check against
the then-current 5,898-row bank, its audited pending record was published by
the sole guarded writer as `pat_05898`.

The preservation-first migration retained all 2,304,034 source dynamic
records with zero seed collisions and retargeted 88,350 structural records to
the new aggregate contract. Together with 143,500 static seed instances, the
published target began with 2,447,534 exclusions. Independent immutable SQLite
reopen returned `integrity_check=ok` and exactly 2,304,034 dynamic rows; all
bank/cache/oracle hashes matched, no staging/spool remained, and the target
then committed live refinements. The stopped source and its byte-exact rollback
clone remain available and must not be resumed concurrently. Full hashes and
recovery instructions are in
`transition_snapshots/20260713T050037Z-oracle12-stopped-iter813/README.md`.

The mutable-bank lane is separate and live. Tmux session `census554-loop`
holds the single driver lease with `CENSUS554_QUEUE=1`. At 02:35 PDT the bank
had 5,914 rows (SHA-256
`5fdcaf2116798a7d35991f03e2a142fbef29fe0702abc010915183c3a93cb661`).
Iteration 690 reached a genuine frontier, found 14 minimal `k=7` patterns, and
exactly certified one `multi_pair` motif while the other 13 failed. That success
was banked as `pat_05897`. The driver was then stopped after the atomic bank
boundary, the independently certified Oracle-13 residual was banked as
`pat_05898`, and both newest bank certificates replayed exactly. No transaction
journal remained. Later, four speculative motifs from frozen frontiers 560 and
908 passed exact certificate verification and a fresh canonical-novelty check
against the 5,899-row bank. The driver stopped outside a bank transaction, the
sole guarded publisher banked them as `pat_05899` through `pat_05902`, and
`verify_certs.py 4` replayed all four exact identities. No transaction journal
remained. Four attempt-1,475 candidates later passed exact certification and a
fresh 5,903-row novelty check. A second guarded transition published them as
`pat_05903` through `pat_05906`; all four exact identities replayed, no
transaction journal remained, and the sole driver restarted from the 5,907-row
generation. Seven attempt-1,486 candidates then passed exact certification and
a fresh 5,907-row novelty check. A third guarded transition published them as
`pat_05907` through `pat_05913`; all seven exact identities replayed, no
transaction journal remained, and the sole driver restarted from the 5,914-row
generation. It had begun its replay at the dated snapshot.

Mining and certification now overlap without creating a second writer:

- a generation-bound full scan of iteration 690 checked all 291 `k=7`
  candidates on flux and the idle-gated MacBook, finding 73 heuristic dead
  candidates with no worker errors
  (`mine_prefetch_runs/iter0690-k7-result.json`);
- `census554-mine-shrink-690` completed four rounds and 5,108 heuristic
  deletion trials with zero worker errors, reaching a fixed point of 73
  canonical candidates. The generation audit found zero bank duplicates, 13
  exact matches for the 14 queued live patterns, and one strictly stronger
  shrink of the remaining pattern. That stronger candidate is queued as
  `prefetchcert-i0690-r001-3ee371b83cf2` into a separate pending store. It
  completed with `status=certify-failed` and no certificate, so it was not
  admitted to the pending store or bank;
- `census554-cube-learn` used four local cores to solve an immutable copy of
  the iteration-690 CNF and 5,897-row bank generation. Every SAT assignment was
  clause-checked and decoded through `cube_ok`; covered models added compact
  auxiliary-y exclusions unit-tested equivalent to the direct one-hot
  exclusion. The bounded run exited cleanly with `status=wall-limit` after
  3,604.270 seconds, 1,876 diversified models, 1,729,607 learned frozen-bank
  pattern instances, and seven model-checked frontiers:

  ```text
  attempt  560  af2cf64b98dc5f5e0761c33234b17b1519be388fe4a5044c6041c135c6f97e61
  attempt  908  b5c92a75c40f37cf1d69a404e1c844dd42abbb33f4dda6b284c1e82c792540bc
  attempt 1475  fe6fb46abf15cbe9af8ef75ae057bf732892ac628670e415e1a13594f009d671
  attempt 1486  89f095caa92d2db5d30e4c94deaa5b11d4119886aac9b3debf2f6bc363b6c733
  attempt 1510  7ac593d930c06de6354dade1460cfa414f086cfcacd2a49420023bcfd41279c8
  attempt 1511  829ab9e5b3830409ee111da27b360d60bdc074187817d5805c69736e8f4e98ec
  attempt 1683  8e7dec330ca2d1e267b7041fbc103886f8413a2b634ecd1d4857aac6c89b058d
  ```

  Attempts 560 and 908 each had no dead support-4/5 pattern, yielded two
  remotely shrunk support-6 candidates, and supplied the four newly banked
  exact motifs. Attempt 1,475 had no dead support-4/5 pattern; its four
  support-6 hits reached a fixed point after two complete shrink rounds and 117
  trials with no worker errors, then became the exactly verified bank rows
  `pat_05903` through `pat_05906`. Attempt 1,486 likewise had no dead
  support-4/5 pattern; its eight support-6 hits reached a fixed point after
  three complete rounds and 354 trials with no worker errors. They were
  distinct from the 5,907-row bank and the attempt-1,475 batch. Seven passed
  exact certification and were published as `pat_05907` through
  `pat_05913`; rank 1 remains in exact certification. Attempts 1,510 and
  1,511 are both covered by all four
  attempt-1,475 motifs. Attempt 1,510's four shrunk patterns are exact
  canonical duplicates of `pat_05904`, `pat_05905`, `pat_05906`, and
  `pat_05903`, so no redundant exact work was submitted; the direct
  all-AUTOS containment audit records the same four hits for attempt 1,511.
  Attempt 1,683 was the only remaining uncovered preserved cube. It had no
  dead support-4/5 pattern. One of 202 support-6 candidates was heuristically
  dead, shrank twice and then fixed after three complete rounds and 48 trials,
  and remained distinct from the current bank and the attempt-1,486 batch. Its
  one exact job is queued.
  All unfinished artifacts remain bound to the older 5,897-row generation and
  require fresh current-bank novelty checks after exact success.

Flux's 14 mine slots are the dependable remote baseline. The MacBook is
opportunistic and idle-gated: its advertised slots count only while Adam is not
using it. Flux handled the Oracle residual batch, and the MacBook joined only
when its own idle gate opened. This host runs the two-hour/high-memory
certification and bounded fallback lanes plus four speculative cube-generation
cores when a bounded producer is active. After the one-hour producer stopped,
the 02:08 audit showed about 55.8 GB immediately free, 95% system memory
availability, no throttled pages, stable 33.69 MB swap use, and the 64 GB
per-Singular system guard active. Cube generation need not pause during
certification while repeated audits retain comparable headroom. The retry
drainer confirmed 79 of 87 selected failures dead and remains resumable; its
outputs are pending records, never direct bank writes.

No Census-produced checked UNSAT, completion marker, geometric counterexample,
or Lean closure theorem has been produced. The combined and speculative
frontiers are mining residuals, not closure claims; card 11 is closed by the
independent theorem stack recorded above.

## Historical checkpoint (2026-07-06)

Task: (5,5,4) exhaustive census for the DoubleApex obligation, retained in the
current closure plan's card-11 slice. NO git ops; NO Lean edits.
Deliverables into scratch/census-554/: scripts, smoke log, census results
(verdicts + certificate payloads), report.md.

## Done (all verified)

1. **Dead-ends check**: census/certificate route NOT a dead end (docs/dead-ends.md read).
2. **Smoke gate PASSED (mandatory, requirement 2)**: `smoke_gate.py` →
   `smoke_gate.log` + `smoke_gate_results.jsonl`. 99/99 exact matches
   (verdict + base_dim + forced_pairs + n_eqs) vs
   scratch/u12-census-port/u12_metric_sample100_verdicts.jsonl on the 100 cubes
   (copied to sample100_s777_cubes.jsonl, sha256 1335bfa0...). The 1 recorded
   TIMEOUT (idx 77) re-decides to NO_VALID_REAL (base_dim=4, sat_dim=-1),
   matching historical _nvr_idx77.json follow-up (same cube verified).
   Sample100 verdict distribution: 57 C_EMPTY + 42 NO_VALID_REAL + 1 TIMEOUT.
   NOTE: sample100 cubes are C1/C2/C4-only shadows (97/100 violate one-hit);
   gate validates ENCODING, not the constraint set.
3. **Size result**: raw constrained cube family ≈ 5.1×10^19 (Knuth estimator,
   2000 trials, stderr ~2%; `estimate_count.py`). Canonical ≥ ~7×10^17 (/72).
   ⇒ per-cube exhaustion impossible; historical `_census_count.py` (p97-rvol)
   never recorded a count. Census MUST be pattern-bank shaped (endpoint-bank
   architecture: patterns + coverage + per-pattern certificates).
4. **Constraint provenance (consumer-producible)**: C1 = K4 + choice of 4;
   C2 = two distinct-center circles ≤2 common; C4 = ConvexIndep (3 centers
   equidistant from a pair ⇒ collinear on bisector); one-hit at V,W =
   `oppApex{1,2}_{surplusCap,otherCap}_one_hit` in U2NonSurplusOneHit.lean,
   UNCONDITIONAL over CounterexampleData (no IsM44!) — cap-generic MEC engine;
   consumer must transfer to leafSurplusPacket caps (CP.capAt linkage).
   Profile: U=0,V=1,W=2; S={1,2,3,4,5}, O1={0,2,6,7,8}, O2={0,1,9,10}.
   V/W naming FORCED by leaf data (V=vertex at j where capAt j is 2nd 5-cap):
   no WLOG needed. Isolated candidate counts: V 43, W 16, others 210.
5. **Canonicalization (requirement 1)**: AUTOS = S3×S3×S2 (order 72) permuting
   cap-interior labels {3,4,5},{6,7,8},{9,10}; fixes U,V,W pointwise and each
   cap setwise ⇒ surplus designation respected BY CONSTRUCTION (S-interior
   never maps to O1-interior). Constraints invariant; verdict invariant
   (variable permutation; gauge pts 0,1 fixed).
6. **Checker fit (requirement 3 / U8)**: EndpointCertificate/Checker.lean =
   Nullstellensatz Σ cᵢ·gᵢ = 1, equality-only. NVR kills use Rabinowitsch
   generators t·d2(a,b)−1 (still equalities; consumer sets t=1/d2, nonzero
   since points distinct). So far ALL kills equality-only → U8 clean so far.
7. **Infrastructure all smoke-tested** (in scratch/census-554/):
   - census554_lib.py: profile/constraints/AUTOS/canon + exact Fraction sparse
     poly encoder, gauge pt0=(0,0), pt1=(1,0), 18 vars x2x..x10y.
   - engine.py: independent Singular verdict engine (C_EMPTY / forced-pair
     NVR shortcut / 55-pair Rabinowitsch saturation / UNDECIDED_OR_CANDIDATE).
     Controls PASS (codex |A|=11 shadow → C_EMPTY).
   - sat_cover.py: SAT coverage encoding (x_{c,k} one-hot per center via Sinz;
     C2 NAND clauses; C4 Sinz ≤2 per point-pair; one-hit baked into cand[V/W];
     pattern exclusion via y_{c,M} indicators, x→y direction only).
     5 encoding gates PASS. Base: 27286 vars, 207969 clauses.
   - miner.py: pattern = {center: mask⊆K_c}; deadness ⟺ msolve char-0 empty of
     [pattern polys + all-pattern-point-pair Rabinowitsch]; mine = min-k
     point-support scan (k=4..) then greedy member removal; certify =
     Singular lift + EXACT python Fraction identity re-check; kill types
     base / pair:a-b / multi_pair (greedy pair-shrink). Smoke PASS on codex
     (5-pt 6-gen pattern, orbit 36).
   - cegar.py: loop = SAT witness → verdict → mine → certify → bank orbit →
     exclusions. State: bank.jsonl, certs/pat_XXXXX.json, cegar.log,
     ALIVE_CANDIDATE.json / COVERAGE_COMPLETE.json markers. RESUMABLE
     (load_bank replays bank.jsonl into exclusions).

## FINAL STATUS session 2 (2026-07-07 04:05) — BUDGET-PARTIAL, NOT COMPLETE

- 6h CEGAR budget exhausted 03:54:53 with NO terminal condition: coverage is
  IN PROGRESS, explicitly NOT complete. No COVERAGE_COMPLETE.json, no
  ALIVE_CANDIDATE.json, no CERTFAIL stop.
- Bank: 1597 lines = 1596 unique orbits (line 191 = benign zombie duplicate
  of pat_00003, see ANOMALY below) = 40524 unique pattern instances.
- Kill types (equality-only, ALL): base 58, pair 403, multi_pair 1135
  => U8 CLEAN over the entire bank.
- Mined-at-k: k=4 139, k=5 1040, k=6 414 (+3 pre-upgrade unrecorded).
  Pattern sizes: 4-6 points, 5-9 generators. Orbit sizes 2..72.
- 376 iterations, banked/iter mean 4.24 (max 27); src=miner on ALL 376
  (0 engine screens, 0 escalations — no witness ever looked alive);
  54 certify-fail events, 52 distinct blacklisted (failed.jsonl), 0 banked
  unsoundly.
- SAT solve-time series (coverage-gap signal): quartile means 0.41/0.87/
  0.75/0.70s, last iterations flat 0.8s => cadical still finds uncovered
  cubes easily; UNSAT NOT near at this bank size (EMPIRICAL).
- Growth: 73 -> 1596 orbits in ~6h05m; marginal rate last ~3h roughly steady
  ~150-200 orbits/h. Extrapolation to completion: UNKNOWN (rate steady, gap
  signal flat — HEURISTIC only; neither convergence nor termination-point
  estimable from this data).
- verify_certs.py over the FULL bank: ALL 1597 PASS (04:26 2026-07-07;
  structure + generator fidelity to the pattern + exact Fraction identity;
  independent of Singular/msolve).
- RESUME COMMAND — **SUPERSEDED 2026-07-09, DO NOT RUN** (see the
  "Authoritative driver" section at the tail of this file; launching
  run_census.py alongside the frontier loop reintroduces the unlocked
  bank-writer race of audit 2026-07-09 P1):
    cd /Users/adam/projects/math-projects/erdos-97-96-formalization
    uv run python scratch/census-554/run_census.py 3000 1200
  in ~50-min installments (harness kills bg tasks at ~60 min); relaunch on
  completion notification; never two drivers at once
  (`ps -axo command | grep cegar` first). Resumes from bank.jsonl +
  failed.jsonl automatically.

## Session-2 build notes (2026-07-06 ~21:35 onward)

- BOTH planned cegar upgrades APPLIED and sanity-tested:
  (a) miner-first fast path: cegar.py now mines FIRST (miner.mine_all_patterns);
      engine.verdict_one runs ONLY when no induced pattern is msolve-dead
      (exact ALIVE screen; TIMEOUT retried at 3600s then STUCK-stop). Every
      banked kill still Singular-lift-certified + exact-Fraction re-checked.
      If an iteration banks nothing (all certifies fail), escalation: engine
      verdict + full-cube certificate, else CERTFAIL stop. Never loops on a
      repeated witness.
  (b) multi-pattern banking: ALL msolve-dead min-k induced patterns per
      witness, parallel greedy-shrunk, deduped by AUTOS-canonical form
      (miner.canon_key), subsumption-filtered vs banked instances
      (miner.instance_subsumes), certified in parallel (8 workers).
  ALSO: certify_pattern pair-shrink rewritten — msolve single-pass shrink of
  the Rabinowitsch pair set + ONE final Singular re-lift (falls back to the
  verified all-pairs payload on disagreement). Was O(pairs^2) Singular lifts
  = the iter-2 118s cert cost; now ~0.7s/pattern typical, rare 90s outliers.
  Mid-run tweak 21:52: certify_pattern default timeout 600->240s (hard lifts
  fail fast and get skipped; sibling patterns/escalation keep liveness; iter
  15 banked 20/21 with 1 certify-fail after ~2x600s timeouts — the failed
  pattern is NOT banked, soundness unaffected). Effective next driver chunk.
  ANOMALY (benign, found 03:14 2026-07-07): bank.jsonl line 191 duplicates
  pid pat_00003 (line 3) — a ZOMBIE append by the prior session's 240s cegar
  (bg b3t5qdj2p, OLD code): it overran its budget inside one pathological
  certify (~80 min), banked once more, exited. Pattern CONTENT-IDENTICAL to
  line 3 (same orbit/kill); cert file matches; exclusions idempotent => no
  soundness impact; instance counts double-count that orbit (36). Only this
  one line (pid sequence proves it). Lesson: account for prior sessions'
  cegar bg tasks before relying on bank positions.
  Mid-run tweak 02:58 (2026-07-07): certify-fail blacklist made PERSISTENT
  (failed.jsonl, replayed by cegar.load_failed on every resume; seeded with
  the 43 distinct fail-patterns from cegar.log — one had already re-failed
  across chunks at ~480s/repeat). Blacklist affects efficiency only, never
  bank contents.
  Mid-run tweak 22:10 (after 3 distinct k=6 certify-fails, ~2 lift timeouts
  each): (i) certify route reordered — msolve pair-shrink FIRST, then lift
  the SHRUNK system (few t-vars); all-pairs lift is now only the fallback.
  Smoke: fresh certify of the pat_00000 pattern reproduces kill pair:8-9 and
  passes verify_certs.verify_cert. (ii) cegar session blacklist failed_keys
  (canonical forms that certify-failed) — skipped as blk=N in iter log; an
  all-blacklisted witness escalates to the full-cube cert once (liveness).
  Both effective next driver chunk; the running chunk is unaffected.
- NEW FILES: verify_certs.py (independent verifier: structure + generator
  fidelity to the pattern + exact Fraction identity, NO Singular),
  run_census.py (chunked driver, resumable; run_census.log has per-chunk
  status/bank/rate lines; stops on terminal status or total budget).
- Sanity results (EMPIRICALLY VERIFIED): resume-from-bank OK (3 orbits/54
  inst replayed, then 27/936); bank 3 -> 73 orbits (2232 instances) in two
  150s runs (~15 orbits/min); verify_certs.py ALL 73 PASS; all kills so far
  equality-only (base/pair/multi_pair Nullstellensatz) => U8 still clean;
  NO engine escalations yet (src=miner on every iteration so far).
- LONG RUN: originally `run_census.py 21600 1200` (bg bu5geub2z, launched
  21:34:30) — KILLED by the harness at ~22:34:16 (~60 min: background-task
  lifetime cap; the kill took the whole process group incl. the running
  chunk-2 cegar). bank.jsonl survived clean (append-per-record): 341 orbits.
  PROTOCOL NOW: relaunch `uv run python run_census.py 3000 1200` in ~50-min
  installments (self-terminating BUDGET exit before the cap; relaunch on the
  completion notification; NEVER two drivers at once — check
  `ps -axo command | grep cegar` first). Installment 2 = bg btqhli1ct
  (launched 22:36, resumes at 341 orbits).
  Chunk history: chunk0 73->180 orbits (1786s, old code, 600s cert cap);
  chunk1 180->219 (1413s, 240s cap); chunk2 (new certify route + blacklist)
  219->341 in ~390s live before the kill — ~19 orb/min, 0 fails, 0 blk:
  shrink-first certify route CONFIRMED effective.
  6 certify-fails total so far (all pre-reorder code, all distinct patterns,
  NONE banked — sound).
  STOP conditions unchanged: UNSAT -> COVERAGE_COMPLETE.json; ALIVE ->
  ALIVE_CANDIDATE.json + stop; certify-fail -> stop. Driver never silently
  caps: BUDGET status = partial coverage, numbers in run_census.log.
- If this session dies: check run_census.log + bank.jsonl; if driver stopped
  on BUDGET, relaunch the same command (fully resumable); then re-run
  verify_certs.py over the full bank and write report.md (skeleton exists;
  fill Results section from bank.jsonl + logs).
- NOTE: report.md write is BLOCKED by a harness guard (subagents must return
  reports as text). Per task spec, the full report body goes in the final
  assistant message instead. Continuations: keep all report-relevant numbers
  in THIS file + logs; do not fight the guard.
- Remaining deliverables: report body (enumeration size, canonicalization
  argument, smoke result, verdict distribution over banked patterns, U8
  status, proposed consumer split: card-11 closed + named
  DoubleApexOffSurplusSharedRadiusPairCard12Up residual — mirror endpoint
  stack: per-pattern certificates checked by Checker + a
  ShadowSearchCoverage-style Lean DFS coverage theorem ("every constrained
  cube contains a banked pattern") + BankSoundness-style consumer
  false_of_cubeInBank_of_payload_zeros).
- Final message must state: smoke result, census verdict summary, U8 status,
  artifact paths.

## Key facts

- Verdict semantics (engine + sample100): C_EMPTY = ideal <1>; NO_VALID_REAL =
  ℂ-feasible but no all-11-distinct point (forced pair d2∈I short-circuit, or
  55-var Rabinowitsch saturation dim=-1); UNDECIDED_OR_CANDIDATE = alive.
- Pattern kill soundness: pattern polys ⊆ cube ideal (masks ⊆ classes);
  1 ∈ ideal(+Rab) evaluates to 1=0 at the real gauged config (t=1/d2 real).
- Gauge similarity: real config mapped by similarity to pt0=(0,0), pt1=(1,0)
  (equidistances invariant). Pair (0,1) d2 ≡ 1, never a kill pair.
- Historical files: p97-rvol/scratch/u1_2_faithful/twolargecap_core/ —
  uniformity_constrained_cubes.py (the |A|=11 constrained sampler, docstring
  "all PROVEN necessary"), _census_count.py (exhaustive counter, no recorded
  output), u12_metric.py sample100 engine (comp_g_m), globalcount verdict doc
  97-u1-2-doubleapex-residual-globalcount-verdict-2026-07-05.md (SAT table =
  the pure-incidence non-kill witness; realizability CONJECTURED-not-real).
- Leaf: DoubleApexOffSurplusSharedRadiusPair, U1LargeCapRouteBTail.lean:2383;
  conclusion = ∃ x,w' off-surplus distinct co-radial from both oppApices;
  downstream kill oppCap2_escape_gen PROVEN. Binder note: leaf carries
  hcritical but NOT hnoRem/IH.
- |A|=12 mining context: cores k∈{4,5,6} pts, no flattening, hundreds of
  classes → bank may be large; termination of CEGAR = empirical question.

## Intra-cap exhaustive classification (2026-07-08, COMPLETE)

`intracap.py` — finite COMPLETE classification of all minimal dead patterns
whose support lies inside a single cap (S / O1 / O2). Result
(`intracap_results.jsonl`, certs in `intracap_certs/`):

- Enumeration exhaustive BY CONSTRUCTION over candidate-feasible intra-cap
  patterns (masks |M|>=2 contained in some C1+one-hit candidate class;
  necessary C2/C4 filters; AUTOS-canonical dedupe): S 291 + O1 2909 + O2 69
  canonical classes. One-hit makes V,W maskless inside their own caps, so
  mask-carrying centers are S:{3,4,5}, O1:{0,6,7,8}, O2:{0,9,10}.
- **107 minimal dead patterns** (S 3, O1 101, O2 3), all at gens 5-7, none
  below 5. 0 UNDECIDED. ALL 107 certified (Singular lift + exact python
  Fraction identity, `CENSUS_CERT_ALL_PAIRS_FALLBACK=1`). ALL 107 realizable
  (backtracking completion to a full valid cube) => census-relevant.
  Kills: 37 pair, 67 multi_pair, 3 base (the O2 ones — both gauge points in
  support). Equality-only throughout => U8 clean.
- Deadness oracle: iterated pairwise saturation in Singular
  (dead ⟺ 1 ∈ I : (∏ d2(a,b))^∞), tri-state, with adversarial msolve
  cross-check on alive verdicts. NOTE Singular 4.4.1 pitfall: writing
  `S = sat(S, f)[1];` (self-assignment through indexed proc return) silently
  CORRUPTS the ideal — must assign via intermediate list. Caught 2026-07-08
  by the msolve cross-check on a certify-provable dead pattern; fix verified
  10/10 vs certificate-backed ground truth.
- Smoke gates: 3 banked dead + 1 satisfiable pre-gate PASS; post-enumeration
  all 8 banked zero-cross-cap rows subsumed by the 107. msolve output
  convention verified on known systems: `[-1]` = empty, `[1,n,-1,[]]` =
  positive-dim, `[0,...]` = zero-dim.

## Authoritative driver (2026-07-09) — supersedes all earlier resume commands

Per audit `docs/audits/2026-07-09-census-554-parallel-work-audit.md` (P1
single-writer, P2 stale handoff):

- **The one authoritative driver is `frontier_loop.py`** (frontier-driven
  cover loop: lazy motif-embedding exclusion + CEGAR mining at genuine
  frontiers; header of that file documents the iteration).  Launch from
  `scratch/census-554/`: `uv run python frontier_loop.py`.  NEVER alongside
  any other bank writer.
- `run_census.py` (broad CEGAR) is RETIRED as a resume path.  Relaunching
  broad census is an explicit Adam decision, and requires the frontier loop
  to be DOWN first.
- New launches take the shared lifetime `driver.lock` lease. Bank publication
  uses a separate short transaction lock, max-suffix PID allocation, canonical
  dedupe, exact certificate revalidation, a recovery journal, atomic fsynced
  certificate writes, and atomic fsynced bank replacement. The active run at
  the 19:40 checkpoint predates the lifetime-lease import; enforcement begins
  when it restarts, although its `frontier_add.py` child already uses the new
  atomic publisher.
- Certify-timeout retries: `retry_certify_drain.py` (queue-backed) stores each
  successful candidate as one atomic frontier-add-compatible record under
  `retry_certified_pending.d/records/`; `index.jsonl` is a compact canonical-key
  audit index. The legacy `retry_certified_pending.json` and `.jsonl` artifacts
  remain immutable inputs and are migrated into the per-record store while
  `legacy-index.json` is built in a disposable helper, so their multi-gigabyte
  decode heap is not retained by the drainer. The migration is canonical,
  idempotent, source-drift checked, and leaves partial atomic records safe to
  reuse after interruption. Queue-result decoding likewise runs in a
  disposable helper. The drainer never banks: publication remains a manual
  `uv run python frontier_add.py retry_certified_pending.d` operation at a safe
  moment; that path consumes one record at a time under one driver lease.
- On restart, terminal UNSAT publication requires a persisted-CNF re-solve and
  successful `drat-trim` check, emits core CNF + LRAT, records exact source-row
  and support-injection provenance, snapshots the bank under lock, and writes
  `COVERAGE_COMPLETE.json` last. The active pre-rewrite process still has the
old terminal function in memory: any marker it emits is provisional and must
be rechecked/re-published through the permanent gate. The acceptance command
`uv run python -m census.census_554.verify_completion --root scratch/census-554`
rejects that legacy schema. ALIVE cube or
  0-certified iteration remains a hard stop for review.
- Row counts drift with the live run. At 19:40 PDT the lock-consistent
  structural snapshot had 5,444 raw / 5,443 normalized rows and the log had
  reached iteration 1240. Read current files rather than treating those as
  terminal.
- Deterministic regression suite for the motif-cover machinery:
  `cover_probe_smoke.py` (unlabeled_key relabeling invariance, key
  separation, AUTOS orbit containment, embedding validity).
- Permanent self-contained counterpart (no bank/cert payload or cwd-relative
  imports): `uv run python -m census.census_554.cover_probe_smoke`.
- Lean transfer state lives in `docs/closure-plan-full-spec-2026-07-09.md`
  §A.2, not here.
