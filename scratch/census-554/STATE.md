# census-554 working state (2026-07-06, session checkpoint)

Task: (5,5,4) exhaustive census for DoubleApex obligation per
docs/closure-plan-2026-07-06.md §5 (|A|=11 slice). NO git ops; NO Lean edits.
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
- RESUME COMMAND (continuation runs, fully safe):
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
