<!-- Provenance: report body produced by the Candidate-D probe agent
     (math-prover, 2026-07-07, dispatched by the orchestrating session after
     Adam sanctioned the D-probe-first split decision for register U4).
     Subagent report-file writes are guard-blocked, so the orchestrator
     transcribed the agent's final message verbatim below this header. This
     is the agent's FINAL report (its own wording: "supersedes the interim
     version with terminal solver facts"); the interim transcription was
     committed in f54b973.

     Independent verification by the orchestrator (2026-07-07, own
     exact-Fraction implementation of formulation.md §3 window semantics and
     §6 composition semantics — no agent code imported; scratchpad
     dprobe_verify.py):
       - All 13 REALIZED witnesses PASS every constraint (E-MEC, E-PKT,
         I-POS, I-DISK, I-OBT, strict I-CAP, all-cyclic-triples I-ORD) in
         exact arithmetic, with shape consistency (|vc| = m, point counts =
         (s,l,r), window size 8−m); the 6 null entries are exactly the
         2 KILLED classes + the 4 SUB2-riding classes.
       - Both Q2 witness files PASS at every n ∈ {12,…,16}: C1, C2, C4,
         FULL H1, m ≤ 2 re-verified; every center's canonical type
         recomputed independently, none in the respective K; recorded types
         match recomputation.
       - kill_notes.md K-A/K-B/K-C/K-E hand-checked line by line (MEC
         identity a²+b² = a+2ωb, bisector parametrization, corner-max
         convexity + antipode-exclusion argument, K-E expansion): sound.
       - Gate artifacts on disk: G1 msolve `[-1]` (both separator
         encodings), G3 `[1,20,-1,[]]` (posdim, alive), G2 per report.
       - SUB2 terminal solver record confirmed on disk: both cvc5 900 s
         legs "interrupted by timeout" (runs/SUB2_{left,right}.cvc5.out).
         The two z3 1800 s legs never completed: the detached solver chain
         was killed by the harness ~60-min background-task cap at 04:41:48
         (started 03:41) — z3-left was killed at its own -T boundary with
         no output written (runs/SUB2_left.z3long.out is the empty
         redirect artifact), z3-right never started. Net: SUB2 is
         solver-UNDECIDED across every attempt (z3 nlsat 300 s unknown ×2,
         cvc5 900 s timeout ×2, z3 1800 s no result); the orchestrator did
         not re-run the 1800 s legs — consistent with the report's own
         conclusion that CAD QE (QEPCAD/Redlog) or a collapse-limit hand
         proof, not more solver wall-time, is the route.
       - The superseded full-window z3 sweep was stopped by the agent at
         40/72 cases (all unknown at 60 s); q1_results.json finalized
         04:17 as obstruction-D3 documentation.
     Caveats carried: REALIZED = the decorated minimal window is realizable
     (kills the per-type minimal-window exclusion hope for that class), NOT
     a full |A| ≥ 12 configuration claim; Q2 evasions are token-level only;
     SUB2-UNSAT (hence the s ≥ 3 kills) remains CONJECTURED. -->

# Candidate-D probe report — register U4: per-type convex kills over the 19 primitive N8 tuples

**Spine context (restated).** Route analysis for ledger row 4 / register U4: the named residual `DoubleApexOffSurplusSharedRadiusPairCard12Up` — the |A| ≥ 12 tail of `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` (`/Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`) on the publish target's spine. Deliverable = verdict tables that shrink strategy freedom on that residual; no Lean production. Dead-ends compliance: this probe is the convexity-coupled route left open by `doubleapex-card12up-uniform-pattern-lemma`; every window carries the convex-order decoration (no bare vesica windows per `vesica-local-sat`); (D-caps) respected; (D-msolve) semantics followed; no ideal-theoretic uniform statements attempted.

**All artifacts:** `/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/candidate-d-probe/` — `formulation.md` (window grounding, read first), `kill_notes.md` (proofs), `STATE.md` (status + resume), `encoder.py`, `witness_factory.py`, `witnesses.json` (13 exact witnesses), `q2_token.py`, `q2_results_{proven,plus}.json` (D1 witnesses), `verify_tuples.py`, `float_probe_sub2.py`, `float_refine_sub2.py`, `runs/` (solver files), `q1_results.json`.

## Formulation (mandatory first step — completed, zero UNGROUNDED)

(m,s,l,r) grounded to `N8/FourSubpacket.lean` (`packet_groupSum_eq_card`: the four groups partition a 4-packet; m counts all three `triangle.verts`), cap indexing to `N8bEndpointPair.lean:36–98`, caps to `Cap/Structure.lean:161` (`arc_membership`) + `OnArcOpposite` (`Foundation.lean:57`), MEC facts to `CircumscribedMECPacket.lean:83`. Token fact re-verified independently: 31 ordered / 19 reflected, constant for p ∈ [3,200], max support 3 (PROVEN, token-level). Window-level lemmas PROVEN in prose (`formulation.md` §2): m ≤ 2 geometric; strict cap signs; cap contiguity in the hull order; reflection/relabeling reductions → 72 conjunctive cases (19 classes × (s+1) center slots × vertex choices).

## Smoke gates — ALL PASS (fixed encoder, never the gate)

- **G1** (k=4 vesica collapse): KILLED, exact, dual-engine — msolve `[-1]` AND sympy GB = {1}, with all-pair separators and with the single separator d²(p₁,p₃). `runs/G1_vesica_k4_*`.
- **G2** (center + 4 cocircular, minor arc, convex): NOT excluded — exact rational hand witness through the full encoder; z3 sat 0.01 s.
- **G3** (W20 ring-witness incidence, order dropped): exact evaluation TRUE at the witness (φ-identities, r² = 4sin²(π/5)); msolve POSDIM `[1,20,-1,[]]` — not excluded.

## Q1 verdict table (19 reflected classes)

Verdicts: 13 REALIZED / 2 KILLED-PROVEN / 4 unresolved. Methods: msolve equality-ideal + separators (step i — POSDIM everywhere, as predicted); z3 QF_NRA (step ii — unknown on all 40/72 completed full-window cases at 60 s before external stop; obstruction-D3 documentation); exact rational witness factory with exact verification (decisive SAT side); elementary proofs (decisive kill side).

| τ | verdict | certificate/witness |
|---|---|---|
| (0,0,0,4) | REALIZED-MINIMAL-WINDOW | `witnesses.json` "0004" (exact ℚ, verified) |
| (0,0,1,3) | REALIZED | "0013" |
| (0,0,2,2) | REALIZED | "0022" |
| (0,1,0,3) | REALIZED (k=1) | "0103" |
| (0,1,1,2) | REALIZED (k=1) | "0112" |
| (0,2,0,2) | REALIZED, straddle only (k=1) | "0202"; k∈{0,2} ride SUB2 |
| (0,2,1,1) | REALIZED, straddle only (k=1) | "0211"; k∈{0,2} ride SUB2 |
| (0,3,0,1) | NOT-KILLED-AT-SCALE; kill CONJECTURED | rides SUB2 |
| (0,4,0,0) | NOT-KILLED-AT-SCALE; kill CONJECTURED | rides SUB2 |
| (1,0,0,3) | REALIZED (vc=v2) | "1003" |
| (1,0,1,2) | REALIZED (vc=v2) | "1012" |
| (1,1,0,2) | REALIZED (vc=v2) | "1102" |
| (1,1,1,1) | REALIZED (vc=v2) | "1111" |
| (1,2,0,1) | NOT-KILLED-AT-SCALE | no witness in factory budget; k∈{0,2} ride SUB2; k=1 separately open |
| (1,3,0,0) | NOT-KILLED-AT-SCALE; kill CONJECTURED | rides SUB2 |
| (2,0,0,2) | REALIZED (vc={v2,v3}) | "2002" (x=(1/2,−1/8), ρ²=17/64) |
| (2,0,1,1) | REALIZED (vc={v2,v3}) | "2011" |
| (2,1,0,1) | **KILLED — PROVEN** | `kill_notes.md` K-C, all vertex choices |
| (2,2,0,0) | **KILLED — PROVEN** | K-C |

**Proven kill mechanism (K-A/K-B/K-C).** K-A (lens-corner-max): the farthest own-lens point from any interior point is a cap corner, corners only. K-B (bisector-position identity): non-obtuseness forces below-chord (v1,v2)-bisector points to x₀ ≥ 1/2 (x₀ = 1/2 + ω·b/a exactly). K-C: every m=2, s≥1 packet dies — **vertex-pair packets have empty same-cap count** — a grounded sublemma reusable beyond the tuple surface. Also PROVEN: K-E min-corner identity (‖x−v1‖² − ‖x−v2‖² = a(1−2x₀) + 2b(ω−x₁)), with a recorded WARNING that its one-sided-sup extension is FALSE (explicit counterexample; do not re-derive).

**The single live kill question (SUB2).** All remaining kills reduce to: no convex chain (v2, w_a, w_b, x, v3) with two same-side own-cap members at equal radius from x, in the lens. Order-only version is SAT (explicit evasions — chirotope-consistent: order carries no metric); the disk is load-bearing; PROVEN reduction to the ω = 0 half-disk (7 variables). Terminal solver record: z3 nlsat 300 s unknown ×2; cvc5 900 s timeout ×2; 1800 s z3 runs did not complete in-session. Float evidence (HEURISTIC): 15M grid + 6-basin hill-climbs, margins → 0⁻ (best −9.5e-9) with the two members collapsing — CONJECTURED-UNSAT with infimum-zero degenerate boundary, predicting no strictly-feasible-gap certificate (the ★/signblock closed-cone shape); routes: CAD QE (QEPCAD/Redlog — not installed) or hand proof via collapse-limit tangent conditions.

## Q2 verdict (composition, targets D1): SAT at every n ∈ {12,…,16}, both kill sets

Token admissibility (C1, C2, C4, full H1) **plus m ≤ 2** (geometric; the first run lacked it and leaned on impossible m=3 types — caught, fixed, rerun). For K_proven = {(2,1,0,1),(2,2,0,0)} AND K_plus = K_proven ∪ {s≥3 classes}: evasion patterns exist at n = 12,13,14,15,16 (≤ 4k DFS nodes each); full class maps + per-center types banked in `q2_results_proven.json` / `q2_results_plus.json` — the token-level D1 witnesses. **Obstruction D1 confirmed in the strongest probed form: even granting every conjectured kill, per-type exclusions do not compose at any order 12–16.** (EMPIRICALLY VERIFIED, token level.)

## Q3: not reached (budget). K-A/K-B/K-E are the intended toolkit for the {V,W} two-center sweep; H1 already forces |K(V)∩O1-int| ≥ 2, |K(W)∩O2-int| ≥ 2.

## Meaning for the card-≥15 residual (C-split fallback)

Per-type kills alone cannot close the tail: 13/19 types are realizable at the decorated minimal window (exact witnesses — the per-type analog of what W16-sq did to Candidate A), and Q2 shows even maximal per-type kills leave admissible patterns at every probed order — Candidate D needs cross-center coupling (the Q3 two-center window is the smallest such object). What the probe adds to any census/C-split route as free, PROVEN admissibility constraints: (i) m ≤ 2 per packet; (ii) vertex-pair packets have s = 0 (the first unconditional convexity-coupled per-type kills in this workstream — partially rebutting obstruction D2's "squeeze engine absent"); (iii) s = 2 only in straddle form; conditionally (iv) s ≤ 2 outright if SUB2 lands. Ranked next steps: (1) decide SUB2-H (one 7-variable NRA sentence; install QEPCAD/Redlog or hand-prove); (2) Q3 two-center sweep with the K-toolkit; (3) fold (i)–(iii) into census/pattern enumeration; (4) settle (1,2,0,1) k=1.

**Rigor labels.** PROVEN: token surface, window grounding + reductions, G1 certificate, K-A/K-B/K-C/K-E, H-reduction, 13 exact witnesses. EMPIRICALLY VERIFIED: Q2 witnesses (token level), G3 evaluations. CONJECTURED: SUB2-UNSAT (hence s≥3 kills). HEURISTIC: float probes. No finiteness assumptions beyond the finite windows; all window constraints are leaf-implied (exclusion-sound); SAT verdicts are minimal-window realizations, never full-configuration claims.
