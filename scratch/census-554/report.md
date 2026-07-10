<!-- Provenance: report body produced by the census CEGAR agent (claude,
     task a83837a3d1896636f, sessions spanning 2026-07-06 → 2026-07-07,
     dispatched by the orchestrating session per closure plan §5).
     Subagent report-file writes are guard-blocked, so the orchestrator
     transcribed the agent's final message verbatim below this header.

     Independent validation by the orchestrator (2026-07-07):
       - Full-bank verify_certs.py re-run by the orchestrator (own
         invocation, after the agent's own PASS run): **ALL 1597
         certificates verified** (structure + generator fidelity + exact
         Fraction identity), exit 0. The verifier's semantics were audited
         earlier in-session: it reads each certificate JSON alone,
         re-derives the generators from the pattern (so each certificate
         provably speaks about its pattern), and checks Σ cᵢ·gᵢ = 1 in
         exact Fractions — no Singular/msolve anywhere.
       - bank.jsonl statistics reconciled by direct jq queries: 1597
         lines / 1596 unique pids; the single duplicate is pat_00003
         (second record has k unrecorded / iter null — the diagnosed
         zombie append; content-identical multi_pair kill, n_orbit 36);
         raw instance sum 40560 → 40524 unique; kill lines base 58 /
         pair 403 / multi_pair 1136 (= 1135 unique orbits after the dup);
         mined-at-k 139/1040/414 with 4 unrecorded lines (= 3 unique);
         failed.jsonl = 52 lines; no COVERAGE_COMPLETE.json or
         ALIVE_CANDIDATE.json marker on disk (BUDGET-partial confirmed).
       - U8 / checker fit confirmed by direct read of
         EndpointCertificate/Checker.lean: the arithmetic layer is
         variable-count generic (Certificate = generator/coefficient
         sparse-poly lists over Nat-indexed variables; checkCertificate
         fixes no frame, no column order, no variable count), so census
         payloads fit without checker changes.
     Caveats carried: coverage is BUDGET-partial, NOT complete — "no ALIVE
     cube in 376 witnesses" is HEURISTIC evidence for all-dead, not proof;
     upgrading coverage to PROVEN requires running the bank to UNSAT and
     then the Lean DFS coverage theorem (consumer split §8 below).

     Repository note (orchestrator): `certs/` (1596 payload JSONs, 13 GB
     total, heavy tail — 45 files > 50 MB, largest 1.6 GB) is deliberately
     NOT committed (gitignored): it exceeds git/GitHub limits. It is a
     local artifact, verified twice this session (both verifier runs load
     every certs/pat_XXXXX.json), and re-derivable from the committed
     bank.jsonl patterns via miner.certify (~0.7 s typical per pattern;
     heavy-tail outliers slower). CONSUMER CAVEAT: the cofactor size tail
     (up to 1.6 GB for one orbit) means several banked kills will need
     certificate slimming (longer shrink budgets or alternative kills)
     before any Lean emission — flagged, not yet scheduled. -->

# (5,5,4) census for the DoubleApex obligation, |A|=11 slice — session report

The `report.md` write is blocked by a harness guard (subagent file-report restriction), so per the task spec the full report body follows here. All working state, numbers, and the resume protocol are also persisted in `/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/census-554/STATE.md`.

## Headline

- **Coverage status: IN PROGRESS (BUDGET-partial), not complete.** 6h CEGAR wall budget exhausted at 03:54:53 with no STOP condition: no UNSAT (coverage incomplete), **no ALIVE candidate**, no certify-fail stop. No `COVERAGE_COMPLETE.json`, no `ALIVE_CANDIDATE.json`.
- **Bank size: 1597 lines = 1596 unique orbits = 40,524 unique pattern instances** (line 191 is a benign content-identical zombie duplicate of `pat_00003` — see Anomalies).
- **U8 status: CLEAN over the entire bank.** All 1596 kills are equality-only Nullstellensatz (base 58, pair 403, multi_pair 1135). No R-inequality content anywhere. PROVEN per certificate.
- **All 1597 certificates independently verified** (structure + generator fidelity to their pattern + exact Fraction identity `Σ cᵢ·gᵢ = 1`, no Singular/msolve involvement). EMPIRICALLY VERIFIED at artifact level; each identity is PROVEN by exact rational arithmetic.

## 1. What was investigated

Exhaustive census of constrained equidistance-class cubes for the `DoubleApexOffSurplusSharedRadiusPair` leaf (`U1LargeCapRouteBTail.lean:2383`) at |A|=11, retained in the current closure plan's card-11 route and continuing the checkpointed pipeline from `scratch/census-554/STATE.md`. This session: applied the two planned cegar upgrades, diagnosed the slow-iteration path, sanity-gated, ran the long CEGAR run, and verified the full bank.

## 2. Setup (self-contained)

**Profile** (forced by leaf data, no WLOG): points 0..10; U=0, V=1, W=2; caps S={1,2,3,4,5}, O1={0,2,6,7,8}, O2={0,1,9,10}. **Cube**: per-center 4-element candidate class K_c ("the four points equidistant from c") under C1 (K4 + choice-of-4; 210 generic candidates, V 43, W 16), C2 (|K_p ∩ K_q| ≤ 2), C4 (ConvexIndep: ≤ 2 centers per point-pair), one-hit at V,W (`oppApex{1,2}_{surplusCap,otherCap}_one_hit`, UNCONDITIONAL over CounterexampleData; consumer transfers via CP.capAt). All four families PROVEN necessary. **Encoding**: gauged points pt0=(0,0), pt1=(1,0), 18 variables, exact rational equidistance polynomials d²(c,k₀) − d²(c,k). **Pattern**: partial cube {c ↦ M_c ⊆ K_c}, |M_c| ≥ 2; its generators are Z-linear combinations of any containing cube's generators, so a dead pattern kills every containing cube (PROVEN). **Certificate**: cofactors with Σ cᵢ·gᵢ = 1 over pattern generators plus Rabinowitsch generators t·d²(a,b) − 1; a real configuration containing the pattern satisfies all generators (t := 1/d², real since points are distinct Finset members), yielding 1 = 0 (PROVEN kill, equality-only).

## 3. Enumeration size ⇒ pattern-bank architecture

Raw constrained cube family ≈ 5.1 × 10¹⁹ (Knuth estimator, 2000 trials, stderr ≈ 2%; `estimate_count.py`); canonical classes ≥ ~7 × 10¹⁷ (dividing by |AUTOS| = 72). EMPIRICALLY VERIFIED estimate; only the order of magnitude is used. Per-cube exhaustion is not feasible; the census is pattern-bank shaped (bank + coverage + per-pattern certificates), mirroring the endpoint stack.

## 4. Canonicalization (PROVEN)

AUTOS = S₃ × S₃ × S₂ (order 72) permutes cap-interior labels {3,4,5}, {6,7,8}, {9,10}, fixing U,V,W pointwise and each cap setwise: surplus designation respected by construction, constraint set invariant, verdicts invariant (variable permutation fixing gauge points 0,1). The bank stores one pattern per orbit and excludes the full 72-image orbit on the SAT side — no symmetry-breaking assumption enters coverage.

## 5. Smoke gate (unchanged from prior session, still valid)

99/99 exact matches (verdict + base_dim + forced_pairs + n_eqs) against the historical u12_metric sample100; the one historical TIMEOUT (idx 77) re-decides to NO_VALID_REAL matching the recorded `_nvr_idx77.json` follow-up. Distribution 57 C_EMPTY + 42 NO_VALID_REAL + 1 TIMEOUT. The sample cubes are C1/C2/C4-only shadows (97/100 violate one-hit): the gate validates the ENCODING, not the constraint set; the SAT side has its own 5 gates, all PASS. The encoder was not modified this session (loop orchestration and certificate search only), so the gate stands. EMPIRICALLY VERIFIED.

## 6. Pipeline upgrades applied this session

1. **Miner-first fast path** (upgrade a): mine all induced patterns of the SAT witness at min point-support k; the exact Singular engine runs only as an ALIVE screen when no pattern is msolve-dead. Result: **it never had to run — src=miner on all 376 iterations; 0 engine screens, 0 escalations**. Every banked kill is still Singular-lift certified and exact-Fraction re-checked.
2. **Multi-pattern banking** (upgrade b): ALL msolve-dead min-k patterns per witness, parallel greedy-shrunk, AUTOS-canonical-deduped, subsumption-filtered, certified in parallel. Banked/iteration mean 4.24 (max 27).
3. **Slow-iteration diagnosis + fix**: the prior slow path was the O(pairs²) Singular-lift greedy shrink in certify (118s/iter observed). Replaced by a single-pass msolve pair-shrink followed by ONE Singular lift of the shrunk system (all-pairs lift as fallback). Typical cert cost dropped to well under 1s; kill labels unchanged; smoke-checked against a known banked kill (`pair:8-9` reproduced, verifier-clean).
4. **Certify-fail handling**: per-call lift timeout 240s; failed patterns skipped and blacklisted persistently (`failed.jsonl`, 52 distinct patterns; blacklist affects efficiency only, never bank contents). 54 fail events total, none banked, every iteration still banked at least one sibling orbit — liveness never needed the escalation path.
5. **Sanity gate before the long run** (EMPIRICALLY VERIFIED): resume-from-bank replay correct twice (3 orbits/54 instances, then 27/936); bank growth 3 → 73 in two 150s runs; all 73 certs verified independently.

**Trust boundaries**: cadical UNSAT would be trusted only for the python-level coverage claim (the Lean DFS coverage theorem replaces it); msolve/Singular are untrusted search oracles; the trusted artifact is the certificate, re-verified in exact Fractions from JSON alone (generators re-derived from the pattern, so each certificate provably speaks about its pattern).

## 7. Results (the run)

- Driver wall ≈ 6h05m (21:34:30 → 03:54:53) in 7 installments of ~50 min (a harness background-task lifetime cap of ~60 min killed the original single 6h driver; the installment protocol works around it cleanly).
- **Per-chunk orbit rate** (orbits/min): 3.6, 1.7, [~19 burst, killed mid-chunk], 5.4, 7.3, 22.5, 2.9, 2.7, 1.8, 3.4, 2.8, 4.0, 4.4, 1.8, 2.0, 6.1. Bank trajectory: 73 → 341 → 793 → 939 → 1086 → 1283 → 1462 → 1597 lines; marginal rate over the last ~3h roughly steady at ~150-200 orbits/h.
- **SAT solve-time series (coverage-gap signal)**: quartile means 0.41 / 0.87 / 0.75 / 0.70s; final iterations flat at 0.8s. Cadical still finds uncovered cubes easily ⇒ UNSAT is not near at this bank size. EMPIRICALLY VERIFIED signal; any completion-time extrapolation from it would be HEURISTIC and I make none — the data determine neither a termination point nor divergence.
- **Verdict/kill distribution over banked patterns**: base 58, pair 403, multi_pair 1135 (all equality-only). Mined at k=4: 139, k=5: 1040, k=6: 414 (+3 pre-upgrade orbits without recorded k). Pattern sizes 4-6 points, 5-9 generators; orbit sizes 2 to 72 (615 orbits of size 36, 94 of size 72).
- **Strong empirical note (HEURISTIC as evidence, not proof)**: in 376 witnesses, none ever lacked an msolve-dead induced sub-pattern at k ≤ 6 — no witness ever looked alive. Consistent with the conjecture that the whole |A|=11 slice is dead; the bank+coverage theorem is what would prove it.

**Anomalies (all diagnosed, none affecting soundness):**
- `bank.jsonl` line 191 duplicates `pat_00003` (line 3): a zombie append from the PRIOR session's 240s cegar background task, which overran its wall check inside one pathological certify (~80 min) and banked once before exiting. Content-identical pattern, matching cert; exclusions idempotent; instance totals here already de-duplicated.
- 54 certify-fail events (52 distinct patterns, `failed.jsonl`): msolve proves these patterns dead but the Singular lift exceeds the timeout. None banked; their witnesses were covered by sibling patterns. They are candidates for slower offline certification in a continuation.

## 8. Proposed consumer split (Lean)

Mirror the endpoint stack: (1) per-orbit `census554_pattern_certificate.v1` payloads checked by the equality-only Checker (Rabinowitsch handled as in endpoint NVR kills, t := 1/d²); (2) a ShadowSearchCoverage-style DFS coverage theorem "every C1 ∧ C2 ∧ C4 ∧ one-hit cube contains a banked pattern instance" — this replaces cadical and is the step that upgrades coverage to PROVEN (it requires the bank to be complete first); (3) a BankSoundness-style consumer (`false_of_cubeInBank_of_payload_zeros` analogue) building the constrained cube from a hypothetical counterexample (C1/C2/C4 lemmas + one-hit via CP.capAt), applying coverage, gauging, and evaluating the certificate identity to 1 = 0; (4) split the leaf into card-11-closed plus the named sorry-backed residual `DoubleApexOffSurplusSharedRadiusPairCard12Up` (leaf carries hcritical but not hnoRem/IH, so no induction plumbing).

## 9. What next (ranked)

1. **Continue the CEGAR run to UNSAT** — the sole blocker for everything downstream. ~~Exact resume command (fully safe, resumes from `bank.jsonl` + `failed.jsonl`): `uv run python /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/census-554/run_census.py 3000 1200`, relaunched in ~50-min installments on completion notification; never two drivers at once (check `ps -axo command | grep cegar` first).~~ **SUPERSEDED 2026-07-09**: `run_census.py` is retired as a resume path; the authoritative driver is `frontier_loop.py` — see the tail section of `STATE.md` (audit 2026-07-09 P1/P2).
2. Offline-certify the 52 blacklisted patterns with long timeouts (each success removes a recurring mining sink and shrinks the uncovered region).
3. On UNSAT: emit Checker-format payloads + the coverage DFS input table from `bank.jsonl`/`certs/`, then the Lean coverage theorem, then the consumer wiring at `U1LargeCapRouteBTail.lean:2383` (on-spine, via proof-blueprint).
4. Only after card-11 lands: assess the Card12Up census empirically.

## Artifacts (all under `/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/census-554/`)

`STATE.md` (authoritative handoff, final status + resume protocol), `bank.jsonl` (1597 lines), `certs/` (1597 certificate JSONs), `failed.jsonl` (52 blacklisted patterns), `cegar.log` + `run_census.log` (full iteration/chunk series), `cegar.py` / `miner.py` (upgraded loop), `verify_certs.py` (independent verifier; full-bank PASS), `run_census.py` (chunked driver), plus the prior session's `smoke_gate.log`, `smoke_gate_results.jsonl`, `sample100_s777_cubes.jsonl`, `estimate_count.py`, `census554_lib.py`, `engine.py`, `sat_cover.py`.
