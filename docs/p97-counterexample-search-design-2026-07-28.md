# P97 bounded counterexample search — design (2026-07-28, v0.1 draft)

Third lane alongside the frontier-package encoders
(`docs/computational-closure-plan-2026-07-28.md`) and FrontierLedger's
F-Γ work. Green-lit at design level 2026-07-28 (Adam: the problem might
be false, and the search is a necessary part of the larger question "at
what value of k does 97 become true?").

## 1. Objective and honest scope

Search for configurations refuting Problem 97: convex-position point
sets A, |A| = n, where every p ∈ A has ≥ k others equidistant from it
(K_k property; P97 is the k = 4 instance), above the proven floor.

Asymmetric win conditions:

- **Refutation branch (self-certifying).** A found configuration with
  exact algebraic coordinates is directly Lean-verifiable — convexity
  and the K_k property are decidable predicates on exact coordinates.
  No census-completeness argument is needed. This fully resolves P97 if
  it succeeds at k = 4.
- **Non-existence branch (census-conditional).** "No counterexample in
  the cells searched" is only as strong as (a) the cell frame's
  completeness proof and (b) the per-cell enumeration's completeness.
  Neither is certificate-grade for free; this branch's durable products
  are the pruned census, missing-lemma pointers, and adversarial
  insurance for the proof lanes.
- **k-threshold instrument.** The machinery is parameterized by k from
  the start. The known floor is k = 3 realizable {{NEEDS_PROOF}} (verify
  which construction our archives/literature actually have before citing
  one); k = 4 conjectured impossible. One tool serves whichever k is the
  live frontier.

## 2. Enumeration space

Census object (Layer 0, purely combinatorial): (A, S) with A a finite
label set, |A| = n, and S : A → 𝒫(A) assigning each point a shell
S(p) ⊆ A∖{p}, |S(p)| ≥ k — the chosen witness class of "≥ k points
equidistant from p". Derived annotations (blocker map, fibers, caps) are
computed, not enumerated.

Scale discipline: never enumerate raw shell functions (n·C(n−1,k)^n
explodes immediately). Cells are explored census-554-style: canonical
motifs, frontier-driven refinement, SAT exclusions per pattern, exact
deadness checks on survivors.

Cell decomposition: a cell is (k, n, closed-cap profile) — e.g.
census-554 is exactly the (4, 11, (5,5,4)) cell. Whether the cap-profile
frame is complete (every convex K_k configuration at n carries the
three-cap structure with some profile) is the load-bearing frame
question — §5. {{NEEDS_PROOF}} until the audit lands.

## 3. Chassis reuse (recon 2026-07-28)

census-554 (`scratch/census-554/frontier_loop.py` +
`census/census_554/`) is one cell of this space. Reusable as-is: the
frontier cover loop (exact revalidation, atomic banking, transaction
locks), DRAT-checked UNSAT publication, retry/backlog machinery, NFS
work queue, flux.local remote-certify offload. Its cell has no
`COVERAGE_COMPLETE.json` yet.

New builds: the outer (k, n, profile) cell iterator; the pruning-rule
bank (§6); the realization arm (§4). The per-cell miner's objective
flips sign: census-554 discards SAT survivors as "not yet excluded";
this lane feeds them to realization as counterexample candidates.

## 4. Realization arm

For a surviving census node: set up the polynomial system (squared
distances; equidistance equalities per shell; convex-position
inequalities), attack numerically (multi-start), then certify exactly
(algebraic number arithmetic / nlsat on a reduced subsystem). Numeric
non-realization is NOT a kill and is never recorded as one — survivors
that resist realization stay open in the bank. Only exact certification
(realized ⇒ refutation candidate for direct verification) or a proven
infeasibility certificate changes a node's status.

## 5. Frame-soundness audit — RESOLVED 2026-07-28 (best case)

`Problem97.MEC.nonempty_surplusCapPacket_of_K4`
(`lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:98`) proves the
three-cap/surplus structure from exactly `A.Nonempty`, `ConvexIndep A`,
`HasNEquidistantProperty 4 A`, `9 < A.card` — NO minimality hypothesis
anywhere in the chain (`no_diameter_under_k4` →
`exists_capTriple_of_circumscribed` → pigeonhole surplus cap).
Orchestrator-verified in source 2026-07-28: signature read directly;
no `sorry`/`axiom` in the chain files. Admission gate before any
published cell claim: kernel `proof-blueprint axioms` on the
declaration (source scan is not a kernel check).

Consequences: cap-profile cells are a COMPLETE frame for k = 4 at every
n > 9 — no minimality caveat on per-cell non-existence claims. The
K₄ hypothesis is load-bearing (via `no_diameter_under_k4`), so the k = 3
control arm and any k ≠ 4 run use a frameless cell type; that was
planned regardless.

Standing rule: every frame fact and pruning rule carries its hypothesis
list in the bank, and each cell's published claim is computed from the
intersection of the hypotheses actually used. Over-pruning in the
refutation branch wastes search but is not unsound; in the
non-existence branch it silently narrows the claim.

## 6. Pruning-rule bank — inventory landed 2026-07-28

Candidate inventory: `scratch/p97-search-lane/banked-pruning-inventory.md`
(19 rows: 13 k-general, 3 k = 4-specific, 2 CANNOT-TELL, 1 UNVERIFIED).
Every row gets an orchestrator audit before admission — an inventory row
is a candidate, not a rule. Headline candidates:

- n-floors: `counterexample_card_ge_nine` (n ≥ 9, unconditional,
  k = 4-specific); `card_ge_five_of_K4` (n ≥ 5, k-general). The
  descent direction (nothing above 9) is the OPEN
  `UniversalReductionHypotheses.descent` field — never a rule.
- Shell intersections: multiple k-independent "distinct circles meet in
  ≤ 2 points" instances (`inter_card_le_two`, `cap_overlap_le_two`,
  `N8a_two_intersection_bound`) — prunes |Σ(x) ∩ Σ(y)| ≥ 3 nodes for
  distinct centers.
- Blocker fibers: NO banked numeric cap (corrects an earlier working
  note claiming fiber ≤ 4 was banked). Derivable in one step —
  x ∈ Σ(c(x)) and |Σ(c)| = 4 exactly (`CriticalShellSystem`) give
  fiber(c) ⊆ Σ(c), so ≤ 4 — but admission requires proving that
  mini-lemma, not citing it. ADMITTED 2026-07-28 with the mini-lemma
  proved in `census/p97_search/PHASE2-SPEC.md` §4.1; the annotation
  EXISTENCE lemma stays {{NEEDS_PROOF}}, so blocker-annotated cells
  publish annotation-conditional claims only. The two abstract endomap
  fiber-forcing theorems (2-/3-omission collision forcing) remain
  k-general candidates.
- R-CAPGE4 audit COMPLETE 2026-07-28 (was: closed-vs-strict caps
  unresolved): closed caps throughout, floor from
  `capTriple_caps_card_ge_four` (`U1OppositeCapLowerBounds.lean:446`),
  cap-partition sum n + 3 traced to `SurplusCapPacket.capSum`
  (`Cap/PartitionFromMEC.lean:397`) ←
  `Problem97.cap_sum_identity` (`Cap/Partition.lean:86`), pure counting
  from the CapPartition structure fields. ADMITTED per PHASE2-SPEC §4.2;
  kernel `proof-blueprint axioms` gate still blocks published cell
  claims.
- Excluded with reasons (see inventory tail): U5 metric families (need
  exact distances), Nullstellensatz certificates (algebraic),
  census-554 equality-core obstructions (metric-consequence border),
  uncommitted `BlockerMultiplicityGeometry.lean` (in-progress, not
  banked), legacy-archive-only Radon family (not in this repo).

## 7. Positive control (mandatory, before any production cell)

The k = 3 arm: run the full enumerate → prune (k-general rules only) →
realize pipeline at k = 3 on small n; a known k = 3 construction must
survive pruning and the realization arm must actually realize it.

Control object RESOLVED 2026-07-28: a 9-point set with exact ℚ(√3)
coordinates (`scratch/p97-search-lane/k3-control-research.md` §6 —
sourced from `formal-conjectures` ErdosProblems/97.lean with one
coefficient corrected; the upstream literal coordinates FAIL). Verified
twice by independent from-scratch exact symbolic arithmetic (researcher
agent + orchestrator, `scratch/p97-search-lane/verify_k3_control.py`):
all 9 points pairwise distinct, strict convex position, and every point
has exactly one equidistant group of size exactly 3 (per-point distance
multiset [3,1,1,1,1,1]). Validity rests on these verifications, not on
the (rejected-PR) provenance. Fishburn–Reeds 1992 (20-point, single
unit distance; n = 20 minimality proven for the CUT version only) is
now transcribed and numerically verified —
`scratch/p97-search-lane/fishburn-reeds-notes.md`; its incidence
projection is a second k = 3 seed (PHASE2-SPEC §6), and exact
certification of its coordinates is the realization-arm validation
target. Secondary control: the 15-point tri-apex equality shadow
(`scratch/triapex-incidence-obstruction/check_model.py`) must survive
every k = 4 rule it structurally instantiates (it is not convex-realized;
it controls the incidence-level rules only).

## 8. Implementation plan

Per standing directive: orchestrator (this lane's author) designs and
audits every encoding and every pruning-rule admission; sonnet/haiku
implementers build the cell iterator, bank plumbing, and realization
scripts against this spec. Smoke gates before any production run:
positive controls (§7), a seeded-fake-counterexample recovery test (plant
a valid (A,S) census node at small n, confirm the pipeline surfaces it),
and per-rule negative controls (each pruning rule kills a hand-built
violating node and spares a hand-built conforming one). Change control
as in the A-core spec: spec edit first, then code; implementers report
gaps, never improvise rules.
