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

## 5. Frame-soundness audit — {{NEEDS_PROOF}}, in progress

Blocking question (Q1 of the inventory dispatch): where is the
three-cap/Moser structure proven for convex K₄ configurations, and does
the derivation need minimality or an n-bound? Outcomes:

- Proven from convexity + K₄ alone ⇒ cap-profile cells are a complete
  frame for the k = 4 search at each n.
- Needs minimality ⇒ the frame is complete only for MINIMAL
  counterexamples — still sufficient for "P97 false ⇒ the census finds
  a witness at the minimal n", but per-cell non-existence claims must
  carry the minimality caveat.
- Needs k = 4 arithmetic ⇒ the k = 3 control and any k ≥ 5 runs need a
  frame-free (or weaker-frame) mode; keep a frameless fallback cell
  type regardless.

Over-pruning in the refutation branch wastes search but is not unsound;
in the non-existence branch it silently narrows the claim. Every frame
fact and pruning rule therefore carries its hypothesis list in the bank,
and each cell's published claim is computed from the intersection of the
hypotheses actually used.

## 6. Pruning-rule bank — {{NEEDS_UPDATE}} pending inventory

One row per banked theorem admitted as a pruning rule: declaration
name, exact hypotheses (convexity / K₄ / minimality / n-range / packet
context), k-classification (k-general vs k = 4-specific vs UNVERIFIED),
census predicate pruned. Sourced from the mining censuses
(`certificates/p97_rvol_general_n_mining.md` and siblings); inventory
agent output lands at
`scratch/p97-search-lane/banked-pruning-inventory.md`; every row gets an
orchestrator audit before admission — an inventory row is a candidate,
not a rule.

## 7. Positive control (mandatory, before any production cell)

The k = 3 arm: run the full enumerate → prune (k-general rules only) →
realize pipeline at k = 3 on small n; a known k = 3 construction must
survive pruning and the realization arm must actually realize it.
{{NEEDS_RESEARCH}}: locate the concrete k = 3 construction (archives
first). Secondary control: the 15-point tri-apex equality shadow
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
