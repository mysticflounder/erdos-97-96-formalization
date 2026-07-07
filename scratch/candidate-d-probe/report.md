<!-- Provenance: report body produced by the Candidate-D probe agent
     (math-prover, 2026-07-07, dispatched by the orchestrating session after
     Adam sanctioned the D-probe-first split decision for register U4).
     Subagent report-file writes are guard-blocked, so the orchestrator
     transcribed the agent's final message verbatim below this header.

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
       - SUB2 escalation still running at transcription time: cvc5-left
         timed out at 15 min (unknown); cvc5-right and both z3-1800 s legs
         pending (runs/SUB2_*). Outcome to be recorded when they land.
     Caveats carried: REALIZED = the decorated minimal window is realizable
     (kills the per-type minimal-window exclusion hope for that class), NOT
     a full |A| ≥ 12 configuration claim; Q2 evasions are token-level only;
     SUB2-UNSAT (hence the s ≥ 3 kills) remains CONJECTURED. -->

# Candidate-D probe report — register U4, per-type convex kills over the 19 primitive N8 tuples

**Spine context (restated).** Route analysis for ledger row 4 / register U4: the named residual `DoubleApexOffSurplusSharedRadiusPairCard12Up` — the |A| ≥ 12 tail of `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` (`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`) on the publish target's spine. Deliverable = verdict tables shrinking strategy freedom on that residual; no Lean production. Dead-ends compliance: this is the convexity-coupled route left open by `doubleapex-card12up-uniform-pattern-lemma`; every window carries the convex-order decoration (no bare vesica windows, per `vesica-local-sat`); (D-caps) respected (no cap treated as a circle); (D-msolve) semantics followed throughout.

**Working directory:** `/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/candidate-d-probe/` (only location written). Key files: `formulation.md` (window grounding — read first), `kill_notes.md` (proofs), `STATE.md` (full status + resume), `encoder.py`, `witness_factory.py`, `witnesses.json`, `q2_token.py`, `q2_results_{proven,plus}.json`, `runs/` (solver artifacts).

## Grounding (formulation-first, all to in-tree definitions)

(m,s,l,r) semantics from `N8/FourSubpacket.lean` (`packet_groupSum_eq_card`: the four groups PARTITION a 4-packet; m counts all three `triangle.verts`), cap indexing from `N8bEndpointPair.lean:36–98`, caps/`OnArcOpposite` from `Cap/Structure.lean:161` + `Foundation.lean:57`, MEC packet from `CircumscribedMECPacket.lean:83`. All 19 tuples grounded to definite finite windows; **zero UNGROUNDED**. Token fact (31 ordered / 19 reflected, constant for p ≥ 3, max support 3) independently re-verified to p ≤ 200 (`verify_tuples.py` — PROVEN, token-level). Grounded side-lemmas proven in prose (`formulation.md` §2): m ≤ 2 is geometric (m = 3 forces x = circumcenter, in no cap — contradiction); strict cap signs from CGN5b + `nonmoser_in_one`; cap contiguity in the convex cyclic order (line-crossing); reflection/relabeling reductions collapsing 31 ordered tuples × orientations × arrangements to 72 conjunctive cases (19 classes × (s+1) center-slots × vertex choices).

## Smoke gates — ALL PASS (mandatory record)

- **G1** (k=4 vesica collapse, report §5.D(iv) exemplar): KILLED with exact dual-engine certificate — msolve `[-1]` (ℂ-empty) AND sympy reduced GB = {1}, both with all-pair Rabinowitsch separators and with the single minimal separator d²(p₁,p₃). Artifacts `runs/G1_vesica_k4_*`.
- **G2** (center + 4 cocircular on minor arc, 5 convex): NOT excluded — exact rational hand witness (tan-half-angle) passes every encoded constraint exactly; z3 sat in 0.01 s.
- **G3** (ring-witness incidence, order dropped): W20 regenerated exactly (b = 1/φ, twist π/10); center O0's class {O2,O8,I2,I7} satisfies the incidence system exactly (sympy φ-identities, r² = 4sin²(π/5)); msolve step-(i) with all-pair separators: POSDIM `[1,20,-1,[]]` — alive, not excluded.

## Q1 — per-type verdict table (19 reflected classes)

Window = {v1,v2,v3} ∪ {x} ∪ 4-packet; constraints E-MEC, E-PKT, I-POS, I-DISK, I-OBT, I-CAP (strict 3-chord signs), I-ORD (all cyclic triples positive); gauge v2=(0,0), v3=(1,0); every constraint implied by the real leaf (exclusion-sound). Methods: (i) msolve equality-ideal + separators; (ii) z3 QF_NRA (60→300 s); (iii) exact rational witness factory with exact verification through the same constraint system.

| τ | verdict | method / certificate |
|---|---|---|
| (0,0,0,4) | **REALIZED-MINIMAL-WINDOW** | exact rational witness, `witnesses.json` "0004" |
| (0,0,1,3) | **REALIZED** | witness "0013" |
| (0,0,2,2) | **REALIZED** | witness "0022" |
| (0,1,0,3) | **REALIZED** (k=1) | witness "0103" |
| (0,1,1,2) | **REALIZED** (k=1) | witness "0112" |
| (0,2,0,2) | **REALIZED, straddle only** (k=1) | witness "0202"; k∈{0,2} ride SUB2 |
| (0,2,1,1) | **REALIZED, straddle only** (k=1) | witness "0211"; k∈{0,2} ride SUB2 |
| (0,3,0,1) | **NOT-KILLED-AT-SCALE; kill CONJECTURED** | rides SUB2 (below) |
| (0,4,0,0) | **NOT-KILLED-AT-SCALE; kill CONJECTURED** | rides SUB2 |
| (1,0,0,3) | **REALIZED** (vc=v2) | witness "1003" |
| (1,0,1,2) | **REALIZED** (vc=v2) | witness "1012" |
| (1,1,0,2) | **REALIZED** (vc=v2) | witness "1102" |
| (1,1,1,1) | **REALIZED** (vc=v2) | witness "1111" |
| (1,2,0,1) | **NOT-KILLED-AT-SCALE** | no witness in exhaustive factory budget; k∈{0,2} ride SUB2, k=1 separately open |
| (1,3,0,0) | **NOT-KILLED-AT-SCALE; kill CONJECTURED** | rides SUB2 |
| (2,0,0,2) | **REALIZED** (vc=v2v3) | witness "2002" (e.g. x=(1/2,−1/8), ρ²=17/64) |
| (2,0,1,1) | **REALIZED** (vc=v2v3) | witness "2011" |
| (2,1,0,1) | **KILLED — PROVEN** | `kill_notes.md` K-C, all vertex choices |
| (2,2,0,0) | **KILLED — PROVEN** | K-C |

All 13 REALIZED verdicts are exact rational witnesses verified constraint-by-constraint in exact arithmetic against the same system the solvers see — the per-type-kill hope for those classes is dead at minimal-window scale (the analog of W16-sq for Candidate A, per the dispatch's own framing).

**The proven kill mechanism (K-A/K-B/K-C, `kill_notes.md`).** K-A (lens-corner-max, PROVEN): the farthest point of the own lens from any interior point is a cap corner, corners only. K-B (bisector-position, PROVEN): non-obtuseness at v2 forces every below-chord point of the (v1,v2)-bisector to x₀ ≥ 1/2 (exact identity x₀ = 1/2 + ω·b/a). K-C: together these kill every m=2, s≥1 packet — **"vertex-pair packets have empty same-cap count"** — a grounded sublemma reusable beyond the 19-tuple surface, using cap membership + disk + non-obtuseness + equal radius (order enters only through v1-above). Also proven: K-E identity ‖x−v1‖² − ‖x−v2‖² = a(1−2x₀) + 2b(ω−x₁) > 0 for x₀ ≤ 1/2 (min-corner bound), with an explicit WARNING that its one-sided-sup extension is FALSE (counterexample recorded — do not re-derive).

**The one live kill question: SUB2.** Every unresolved kill reduces to one statement: *no convex chain (v2, w_a, w_b, x, v3) with two same-side own-cap packet members w_a, w_b at equal radius from x, all in the lens* (order-only version is SAT — explicit evasions found, chirotope-consistent; the disk is load-bearing; PROVEN reduction to the ω = 0 half-disk, 7 variables). Status: z3 300 s unknown ×2, cvc5/z3-1800 s escalation in `runs/SUB2_*` (may complete after this report); float evidence (HEURISTIC): 15M-grid + 6-basin hill-climbs all push margins to 0⁻ (best −9.5e-9) with the two members collapsing — CONJECTURED-UNSAT with an infimum-zero degenerate boundary, which predicts no strictly-feasible-gap certificate (the ★/signblock closed-cone shape) and points at CAD QE (QEPCAD/Redlog — not installed) or a hand proof via collapse-limit tangent conditions. Full-window z3 was unknown on every completed sweep case at 60 s (obstruction-D3-at-full-window-scale documented in `q1_results.json`; superseded on the SAT side by the factory, on the kill side by K-C).

## Q2 — composition (targets D1): **SAT at every n ∈ {12,…,16}, both kill sets**

Token model: census554-style admissibility (C1, C2, C4, FULL H1) **plus m ≤ 2** (geometric; the first run lacked it, leaned on m=3 types, was caught and fixed — recorded). For K_proven = {(2,1,0,1),(2,2,0,0)} and K_plus = K_proven ∪ {(0,3,0,1),(0,4,0,0),(1,3,0,0)}: admissible patterns avoiding every killed type exist at n = 12, 13, 14, 15, 16 (profiles (5,5,5) … (7,6,6)), found in ≤ 4k DFS nodes each. Full evasion patterns (class maps + per-center types) banked in `q2_results_proven.json` / `q2_results_plus.json` — these are the token-level D1 witnesses. **Obstruction D1 is confirmed in the strongest probed form: even granting every conjectured kill, per-type exclusions do not compose to a global kill at any order 12–16.** EMPIRICALLY VERIFIED (explicit witnesses; token level only — no geometric realizability claimed).

## Q3 — not reached

Budget went to the Q1 kill mechanisms and SUB2 escalation. No partial map produced. Note for the successor: K-A/K-B/K-E are exactly the toolkit the {V,W} ∪ (K(V)∩O1) ∪ (K(W)∩O2) two-center sweep needs (V,W-centered corner-max and bisector-position facts), and H1 already forces |K(V)∩O1-int| ≥ 2, |K(W)∩O2-int| ≥ 2 — the sweep's case space is small.

## What this means for the card-≥15 residual (C-split fallback)

The probe closes the "pure per-type kill" strategy for the tail while extracting real structure. 13 of 19 types are realizable at the decorated minimal window (exact witnesses), so no dead-type bank over single-center windows can cover Card12Up; and Q2 shows that even the maximal conceivable per-type kill set leaves admissible token patterns at every n ∈ {12,…,16} — Candidate D must couple constraints ACROSS centers (the Q3 two-center shape is the smallest such object), not per center. What survives and strengthens the residual definition: three PROVEN, leaf-implied structural facts that any census or certificate route (including the Candidate-C card-12–14 head split and the card-≥15 residual statement) may assume and should bake into pattern enumeration as free admissibility constraints — (i) m ≤ 2 per packet, (ii) vertex-pair packets have s = 0 (kills types (2,1,0,1), (2,2,0,0) — the first unconditional convexity-coupled per-type kills in this workstream, partially rebutting obstruction D2's "squeeze engine absent"), and (iii) s = 2 packets occur only in straddle form; conditionally (iv) s ≤ 2 outright if SUB2 lands. These shrink the admissible pattern family (Q2 candidate lists) at zero proof cost to the consumer. Ranked next steps: (1) decide SUB2-H — a single 7-variable NRA sentence, decidable in principle; install QEPCAD/Redlog or hand-prove via the collapse-limit; (2) the Q3 two-center sweep with the K-A/K-B/K-E toolkit; (3) fold (i)–(iii) into the census/Q2 admissibility used by any C-split enumeration; (4) settle (1,2,0,1) k=1 (witness or proof — the deep-left-member vs x-extremality tension is the crux).

**Rigor summary.** PROVEN: token surface 31/19 (re-verified), window grounding + reductions, G1 kill certificate, K-A, K-B, K-C, K-E, the H-reduction, 13 exact witnesses (verified in exact arithmetic). EMPIRICALLY VERIFIED: Q2 SAT witnesses (token level, explicit), gate G3 exact evaluations. CONJECTURED: SUB2-UNSAT (hence the s≥3 kills). HEURISTIC: all float-probe evidence, and the expectation that a successful D subsumes the head. Finiteness/structural assumptions: all windows assume only leaf-implied facts (ConvexIndep, K4, MEC packet, cap triple, non-obtuseness); no finiteness beyond the finite window itself; SAT-side verdicts are minimal-window realizations, never full-configuration claims.
