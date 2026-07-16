# SAT Modulo Symmetries + Co-Certificate Learning: applicability to remaining work (2026-07-13)

Research recommendation. Not a plan of record; no lane is authorized by this
document. Ground truth for lane status: `scratch/census-554/STATE.md`
(2026-07-13 correction — card 11 closed by the current theorem stack; census
lanes optional; remaining proof-critical mathematics is card ≥ 12) and
`docs/closure-matrix-2026-07-09.md` rows K-A-PAIR, K-A-LIVE, AHEAD-*.

Sources (local copies in `docs/references/`):

- Kirchweger, Peitl, Szeider, *Co-Certificate Learning with SAT Modulo
  Symmetries*, IJCAI 2023, pp. 1944–1953
  (`kirchweger-peitl-szeider-2023-co-certificate-learning-sms-ijcai.pdf`).
- Szeider, *SAT Modulo Symmetries: A Survey*, SC² workshop, August 2025
  (`szeider-2025-sat-modulo-symmetries-survey.pdf`).
- Software: `smsg` (C++ on CaDiCaL via IPASIR-UP) + PySMS,
  https://github.com/markirch/sat-modulo-symmetries,
  docs at https://sat-modulo-symmetries.readthedocs.io/.
- Related interface paper: Fazekas, Niemetz, Preiner, Kirchweger, Szeider,
  Biere, *IPASIR-UP: User Propagators for CDCL*, SAT 2023.

## 1. What the technique is

**SMS.** A CDCL SAT solver is augmented with a canonicity propagator
(`MinCheck`) through the IPASIR-UP interface. During search, the propagator
inspects the partially defined object (for graphs: the partial adjacency
matrix) and searches for an *nc-certificate* — a single permutation π such
that every completion H of the partial object satisfies π(H) <_lex H. If one
exists, no completion is canonical, and a blocking clause derived from a
minimal non-canonical subobject is learned. The method is sound (never prunes
a canonical solution) and complete; all emitted solutions are canonical, so
enumeration is isomorph-free without static symmetry-breaking constraints.

**CCL.** For alternating ("∃ object such that ∀ small witnesses fail")
search problems, a second solver/oracle tests each SMS candidate for the
co-NP property. If the candidate fails (a witness exists), the witness is a
*co-certificate*, and a clause is learned that blocks **every** object
admitting that same witness — not just the candidate. The first solver
continues incrementally with all learned clauses retained. Empirically the
economics dominate everything else: for triangle-free non-3-colorable graphs
at n = 14, SMS+CCL visits 85,668 candidates and learns 9,407 colorings,
versus 467,871,369 non-isomorphic graphs for enumerate-then-filter — one
co-certificate eliminates ≈ 50,000 canonical candidates on average. Because
only canonical candidates are generated, the co-certificate set need only
cover canonical objects.

**Certified completeness.** SMS produces two verification artifacts:
(i) per symmetry-breaking clause, the nc-certificate π, checkable in
polynomial time; (ii) for the SAT reasoning, a standard DRAT proof from a
second run with all learned symmetry/co-certificate clauses included in the
encoding. For enumeration, blocking clauses for all found solutions are
added and a DRAT proof of the resulting UNSAT certifies that no further
non-isomorphic solutions exist. Their cube-and-conquer variant proves
"entailment with advice": with cubes c₁…cₖ generated mid-search, a proof of
unsatisfiability of Ω = F ∧ ¬c₁ ∧ … ∧ ¬cₖ ∧ Σ ∧ Γ (Σ, Γ = learned
symmetry/co-certificate clauses) certifies the cube decomposition, and each
cube is then discharged separately.

**Results.** Kochen–Specker lower bound 24 (orders of magnitude faster than
the prior SAT+CAS attack), Erdős–Faber–Lovász verified for all linear
hypergraphs ≤ 12 vertices, Rota's basis conjecture at rank 4, planar Turán
numbers, full Ramsey enumerations R(3,5,n)/R(4,4,n) with verifiable proofs.

## 2. Correspondence with the existing census loop

The census-554 frontier loop independently converged on the CCL architecture
(the project has called it CEGAR; the alternating-search shape is closer to
CCL). The mapping is exact:

| SMS+CCL | census-554 (`scratch/census-554/`) |
|---|---|
| existential encoding F | `sat_cover.py` base CNF (one-hot, C2 NAND, C4 Sinz; 27,286 vars / 207,969 clauses) |
| solution candidate | witness cube (11 centers × one 4-class each) |
| co-NP check | msolve char-0 deadness oracle (`miner.py`) |
| co-certificate | minimal dead sub-pattern + exact Σcᵢgᵢ = 1 certificate |
| co-certificate clause | pattern-exclusion clauses over the full AUTOS orbit |
| certified completeness | terminal `drat-trim`/LRAT gate (`frontier_loop.py:274-305`) + Lean verified-LRAT replay route (`Census554/CoverCnf.lean`, `verifyCert_correct`) |

Two asymmetries:

- **Where this project is ahead.** SMS+CCL's terminal real-algebraic step
  (Kochen–Specker embeddability via Z3) is uncertified — the paper states
  checkable proofs for nonlinear real arithmetic are unavailable. Here every
  banked co-certificate is an exact rational identity re-derived and replayed
  by a verified Lean checker (`CertCheck.lean`, `isDead_of_checkCert`). The
  algebraic tier of this pipeline is stronger than the published state of
  the art.
- **Where SMS is ahead.** (i) Symmetry is handled *inside* the solver;
  census-554 instead expands every banked pattern to its full AUTOS orbit
  (order-72 group S₃×S₃×S₂ on the six cap-interior labels; measured ≈ 27×
  clause blow-up: 5,939 orbits → 160,229 exclusion instances).
  (ii) Solving is incremental; `sat_cover.solve` spawns a fresh `cadical`
  subprocess on a fully re-serialized DIMACS every iteration.
  (iii) Co-certificate *selection* is heuristically optimized for kill rate
  (frequency statistics over previously seen candidates guide which
  co-certificate to learn); the miner here optimizes pattern *size*
  (min-k support, greedy shrink), not expected coverage.

## 3. Recommendations, ranked by fit to remaining work

Remaining proof-critical work is card ≥ 12 (K-A-PAIR, K-A-LIVE and the ATAIL
producer lane). The census lanes — a resumed 554 cover and the card-12–14
`card_head` engine (AHEAD-WORKER, currently EXECUTION DISABLED) — are
optional but are exactly where these techniques land.

### R1 — Design the `card_head` worker as an SMS+CCL engine (primary)

`census/card_head/` re-implements the 554 loop for card 12–14 with fail-closed
validation (`cegar_adapter.py`) but has no mining/generation worker yet
(AHEAD-WORKER, OPEN-ENG). That worker should adopt the SMS architecture from
the start rather than inherit 554's shape, because every cost that is
tolerable at n = 11 grows at 12–14:

- the (6,5,4) base instance is already 37,310 vars / 297,119 clauses;
- the cap-interior symmetry group grows from order 72 to order 288 for
  profile (6,5,4) (interiors of sizes 4/3/2) and up to order 432 for (5,5,5)
  (interiors 3/3/3 with the two non-surplus caps interchangeable) —
  orbit-expansion blow-up grows proportionally {{NEEDS_PROOF}} (derived from
  the 554 interior-label convention; confirm against `card_head`'s actual
  automorphism builder before relying on the constants);
- bank sizes and iteration counts scale with the space.

Concrete adoption, in order of leverage:

1. **Incremental solving.** Keep one CaDiCaL instance alive across
   iterations (IPASIR-UP or incremental API), adding exclusion clauses as
   they are banked. Removes the per-iteration re-serialize/re-solve of an
   only-growing CNF. No trust-story impact: the terminal artifact is
   re-derived in a fresh certified run regardless.
2. **In-solver canonicity propagator.** Unlike SMS's hard case (Sₙ on
   graphs), the group here is fixed and tiny (≤ 432 elements). A MinCheck
   analog is brute force: for each group element σ, test whether σ applied
   to the partial center→class assignment is lexicographically smaller; if
   some σ certifies non-canonicity of all completions, learn the blocking
   clause. The nc-certificate is σ itself. This removes the ~27×+
   orbit-expansion layer from the solver's clause database and restricts
   candidate generation to canonical cubes, which also shrinks the
   co-certificate coverage obligation (only canonical cubes need covering).
3. **Two-tier trust boundary.** Run exploration/mining with the propagator;
   produce the *terminal* coverage artifact in a separate certified
   configuration. Two viable terminal forms — decide when AHEAD-WORKER
   lands: (a) re-expand the final bank to full orbits and emit the terminal
   UNSAT over the symmetry-free CNF (reuses the 554 `CoverCnf.lean`
   byte-identical-DIMACS + `verifyCert_correct` pattern unchanged); or
   (b) keep symmetry-breaking clauses in the terminal CNF and discharge
   them in Lean via a cube-level orbit-transport lemma (an analog of
   `motif_transfer` for center/class relabeling) plus per-clause
   nc-certificate replay. (a) is more certificate volume, zero new Lean
   surface; (b) is smaller certificates, new proof surface. Default to (a)
   unless terminal LRAT size measurements force (b).
4. **CCL banking economics** — see R2; build it in rather than retrofit.

### R2 — Kill-rate-guided co-certificate selection in the miner

The measured bottleneck is mining, not SAT and not certification (recent
iteration: SAT 1.4 s, mine 368 s, certify 253 s). Each frontier cube yields
many dead candidate patterns (e.g. 14 banked of 184 dead candidates at one
k = 6 support scan), and the loop's convergence depends on which are banked:
the SAT gap has stayed flat (~0.8 s solves; "UNSAT NOT near at this bank
size"), meaning banked patterns are not covering the remaining space
efficiently. Two changes, per the CCL playbook:

- **Select for expected coverage, not only size.** Among minimal dead
  patterns, prefer those whose exclusion clause is hardest to satisfy in the
  remaining space — approximable by embedding-frequency into recent witness
  cubes (the machinery exists: `cover_probe.embed_into_cube_with_maps`), or
  by a periodic approximate projected model count of the live space as a
  coverage bellwether. This is the direct analog of CCL's
  frequency-heuristic choice among 010-colorings.
- **Bank several co-certificates per expensive oracle call.** The k-support
  scan already enumerates many dead candidates per frontier cube; certifying
  and banking a selected diverse subset (rather than the first exact result,
  with extras deferred to the retry backlog) amortizes the msolve cost that
  dominates the iteration.

Applies to any resumed census lane (554 or card_head); it is a
`frontier_loop.py`/`miner.py`-local change with no effect on bank format,
validation boundaries, or the Lean transfer contract.

### R3 — Endgame sharding via cube-and-conquer with entailment-with-advice

The open unknown on the Lean transfer route is terminal LRAT certificate
size/check time (A11-COVER-FMT: "verified-LRAT route CONFIRMED; the
remaining unknown is only the terminal certificate's size/check time"). The
SMS cubing scheme addresses exactly this: split the final coverage query
into cubes generated mid-search, certify (i) each per-cube UNSAT and
(ii) the cubing-completeness formula Ω, each with its own LRAT certificate.
For Lean this means k + 1 independent `verifyCert_correct` replays plus one
conjunction lemma, instead of one monolithic replay — bounding memory per
replay and parallelizing across the flux worker pool. Worth adopting for
whichever lane first reaches a terminal UNSAT.

### R4 — Incremental-solver retrofit for census-554 (only if resumed)

Free win, but the lane is paused and optional; do not resume it for this.
If resumed for its independent value (checked finite cover, structural-core
testing), apply R2 first (bottleneck), then incrementality. Do **not**
retrofit in-solver symmetry breaking into 554: the frozen-CNF contract
(`FinalCoverData`, byte-identical DIMACS against `CoverInstance().dimacs()`)
is already validated end-to-end, and changing the encoding restarts those
gates for a lane that is no longer proof-critical.

### R5 — K-A-PAIR / K-A-LIVE research lanes: limited applicability

SMS does not repair a too-weak abstraction, and that is the current
obstruction on these rows (selected-four/equality/blocker abstractions
DONE-NEGATIVE with countermodels; the missing ingredient is convex/Moser/cap
correlation, not enumeration throughput). The technique becomes relevant
only after a sound finite abstraction survives and needs an exhaustive,
certified sweep at scale — at which point the R1 engine is the vehicle.
Until then, no SMS work is warranted on these lanes.

## 4. What SMS does not provide here

- No help with the algebraic oracle itself (msolve/Singular emptiness,
  certificate lifting) — SMS's own real-algebraic tier is uncertified.
- PySMS/`smsg` are graph-object-specific; the center→class object here
  needs a custom propagator (small: the group is tiny and static, and
  IPASIR-UP is the same interface CaDiCaL already exposes). Direct reuse of
  the SMS codebase is limited to architecture and the cubing/proof scheme.
- Q-SMS (QBF formulation) adds nothing over the existing loop shape here.

## 5. Effort sketch (sessions, not wall clock)

- R2 (miner selection heuristic + multi-banking): 1 session to implement
  and A/B-measure against the current selector on the paused bank replay.
- R1.1 (incremental solving in card_head worker): part of the AHEAD-WORKER
  build; marginal cost ~0 (design choice, not an addition).
- R1.2 + R1.3 (canonicity propagator + two-tier terminal): 2–3 sessions
  including the soundness argument for the propagator and the terminal-form
  decision; only worthwhile once AHEAD-WORKER is authorized.
- R3 (sharded terminal artifacts): 1 session of plumbing on top of the
  existing `terminal_artifacts.publish_unsat_artifacts` + `CoverCnf.lean`
  machinery, measurable only when a lane approaches UNSAT.

## 6. Attribution

If any methods writeup names the loop architecture, cite Kirchweger–Peitl–
Szeider (IJCAI 2023) for co-certificate learning and Kirchweger–Szeider
(CP 2021 / ACM TOCL 2024) for SMS; the generic counterexample-guided loop
name traces to Clarke–Grumberg–Jha–Lu–Veith (CAV 2000). No code is reused,
so attribution is a citation-practice matter only.
