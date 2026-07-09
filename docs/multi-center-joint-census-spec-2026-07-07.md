<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Spec: parametric multi-center joint token census (2026-07-07)

Status: IMPLEMENTED. The original empirical deliverables landed on 2026-07-08;
the L2/full-participant representative-surface certificate bridge was closed
in Lean on 2026-07-09. This file remains the historical requirements document.
Owner docs for current status are
`docs/multi-center-joint-census-proof-plan-2026-07-08.md` and
`certificates/multi_center/README.md`; the verdict fold remains
`closure-plan-2026-07-06.md` §7 D3 + uncertainty register U4.

## 1. Question

Under the census/D3 token model, the PROVEN kill set, and the four-point
selected-class convention, does the **multi-center joint token surface**
(two-center and three-center shared-member joint classes across the Moser
pairs) become **constant in n**?

Motivation. The four-point subpacket reduction works because the
single-center primitive row surface is constant for n ≥ 12 (31 ordered /
19 reflected rows — `incidence-census-lemma-leads.md` §7). The Q3 probe
(`census/q3_two_center/report.md`) classified the two-center *decorated
window* layer at the minimal window and proved two joint kills, but its
composition retest ran only at fixed n = 12..16. The live Candidate D
shape for the |A| ≥ 12 tail is strictly-more-than-two-center coupling
(U4). If the joint token surface stabilizes to a finite class inventory
at some n*, the coupling layer reduces to a finite joint-row split —
the same shape that made the four-point reduction proof-facing. If it
grows without stabilizing, that quantifies why the tail needs a
different mechanism. Either answer is a U4 deliverable.

This is an incidence/token census, NOT metric feasibility. No claim of
Euclidean realizability attaches to any row.

## 2. Deliverables

1. `census/multi_center/` containing the enumerator, JSON
   artifacts per layer, and a `STATE.md` checklist (pattern:
   `census/q3_two_center/STATE.md`).
2. A results note `docs/multi-center-joint-census-<date>.md` with the
   per-n tables and the verdict.
3. Headline verdict for the **L2 GLOBAL surface under the PROVEN cuts**
   (the results note must report the LOCAL behavior separately), using
   exactly one of these labels verbatim:
   - STABILIZED-EMPIRICAL: no fresh joint class for the last K = 4
     consecutive swept values of n, all cells in that window DETERMINED
     (no INDETERMINATE at the class frontier), with the full finite
     class inventory listed;
   - STABILIZED-PROVEN: as above, plus the §6 monotonicity lemma proved
     and cited — constant above n* becomes a theorem, not a stopping
     rule;
   - GROWING: fresh classes persist to the max swept n, with closed
     forms per the fit bar below;
   - INCONCLUSIVE-BUDGET: INDETERMINATE cells in the last-K window (or
     the >10% INDETERMINATE condition of §4) prevent any of the above.

   Fit bar for GROWING: a closed form in p = n − 9 is reportable only
   if it is an exact integer polynomial (degree ≤ 3) fitted on the
   first half of the swept range and matching the second half exactly
   (the `escape-census-bugcheck.md` standard). Weak, piecewise, or
   approximate fits are not deliverables — report the raw sequence and
   the label NO-CLOSED-FORM instead.
4. Fold: one paragraph + register row update in
   `closure-plan-2026-07-06.md` (§7 D3 narrative, U4 row).

## 3. Model (reuse, do not re-derive)

Ground everything in the existing token model. Import, don't copy:

- `census/candidate_d_probe/q2_token.py` — `build_labels`, `type_of`,
  the admissibility constraints, and the DFS `solve` skeleton.
- `census/q3_two_center/q3_token.py` — `PAIR_CAP`, `joint_ok`,
  `profiles_for`.

Definitions (as implemented there):

- **Frame.** Moser vertices U=0, V=1, W=2. Closed caps S ∋ {V,W},
  O1 ∋ {U,W}, O2 ∋ {U,V} with sizes (cS, cO1, cO2), cS+cO1+cO2 = n+3,
  each ≥ 4, at least two ≥ 5. Sweep ALL unordered profiles per n
  (`profiles_for(n)`), since the joint kills are not profile-symmetric.
- **Assignment.** Every point p gets a selected class K(p), |K(p)| = 4,
  p ∉ K(p) (C1). Constraints: C2 (|K(p) ∩ K(q)| ≤ 2), C4 (each
  unordered pair lies in ≤ 2 classes), full H1 (each Moser vertex has
  ≤ 1 class member in each of its two containing caps, excluding
  itself).
- **Single-center type** of a non-Moser center c in cap X: canonical
  (m, s, l, r) with reflection quotient min((m,s,l,r),(m,s,r,l)), per
  `type_of`.
- **Four-point convention.** |K(p)| = 4 exactly is built into C1 — the
  subpacket truncation of `incidence-census-lemma-leads.md` §7 is
  already the model. Do not add a separate truncation step.

### Cuts — keep the two tiers separate in every table

PROVEN tier (apply by default; provenance in parentheses):

- m ≤ 2 for non-Moser centers (candidate-D probe, leaf-implied).
- Vertex-pair ⇒ s = 0: kill rows (2,1,0,1) and (2,2,0,0)
  (candidate-D probe, PROVEN unconditionally).
- K-Q3-5: for each Moser pair {a,b} with common cap X,
  K(a) ∩ K(b) ∩ int(X) = ∅ (Q3 probe, PROVEN; transfers to all three
  pairs by cap relabeling).
- K-Q3-1: for each Moser pair {a,b} with other caps Y, Z, not both
  K(a) ∩ K(b) ∩ int(Y) ≠ ∅ and K(a) ∩ K(b) ∩ int(Z) ≠ ∅ (Q3 probe,
  PROVEN, same transfer).

CONJECTURED tier (run as a separately labeled variant only, never mixed
into PROVEN tables): the SUB2-conditional rows (0,3,0,1), (0,4,0,0),
(1,3,0,0) (= K_plus \ K_proven in `q3_token.py`), and any s ≤ 2 proxy.

CONJECTURED-tier scope (mandatory vs optional): the results note MUST
include one appendix table — the L2 GLOBAL sweep under
PROVEN + CONJECTURED cuts, same detector, presented side-by-side with
the PROVEN headline (its purpose: does proving SUB2-H change the
stabilization behavior — that answers whether SUB2-H is worth solver
time). CONJECTURED-tier L0/L1 tables are optional; produce them only if
the L2 comparison shows a difference worth diagnosing.

## 4. What to enumerate

Three layers. For each, two tiers of "exists". Keep the tiers separate
in every artifact and table. The headline verdict is about the L2
GLOBAL tier under the PROVEN cuts; LOCAL is a mandatory diagnostic tier
and may diverge.

- **LOCAL**: the joint configuration alone satisfies its internal
  constraints (C2 between the participating centers, H1 at the
  participating Moser vertices, the kills). Cheap; this is where closed
  forms live.
- **GLOBAL**: some full admissible assignment of all n centers contains
  the configuration (DFS witness, `q3_token.solve` style, node cap
  4·10⁶; on cap hit record INDETERMINATE — never coerce to UNSAT).

### L0 — single-center inventory (validation layer)

Per n (union over profiles): the set of canonical (m,s,l,r) types that
are GLOBAL-realizable under the PROVEN cuts. Purpose: reproduce the
constant-surface phenomenon inside *this* model (the
`incidence-census-lemma-leads.md` n8Prim numbers 31/19 use a different
cut set — do not expect equality; the comparison is qualitative:
constant after some small n*).

### L1 — two-center joint classes (per Moser pair)

For a Moser pair {a,b} with common cap X, others Y, Z: the joint class
of (K(a), K(b)) is the **full pair-support incidence type**, not just
the shared-set summary. Concretely, let

    Supp(a,b) := {a,b} ∪ K(a) ∪ K(b).

The class data is the isomorphism class of the finite structure on
`Supp(a,b)` with:

- distinguished endpoints `a`, `b`;
- for each support point `z ∉ {a,b}`, a region label
  `region(z) ∈ {third Moser vertex, int X, int Y, int Z}`;
- incidence bits recording whether `z ∈ K(a)` and whether `z ∈ K(b)`.

Equivalently: keep the full pair `(K(a), K(b))` up to renaming of the
auxiliary support points, with region labels retained. The shared-set
decoration and each endpoint's H1-visible signature are **derived
columns**, not the defining quotient; this prevents distinct pair
supports with different extension behavior from collapsing to one class.

Canonicalization: quotient by the `Y ↔ Z` reflection only when it is a
size-preserving automorphism of the pair context. Across the three Moser
pairs of a fixed unordered profile, collapse only by profile
automorphisms that preserve cap sizes (so equal-size cap transpositions
may identify contexts, but unequal common-cap sizes may not). In
particular, for an unequal profile such as `(4,5,6)`, enumerate all
three pair contexts before quotienting. Spell the canonical form out in
code as a single `canon_joint(...)` function and unit-test it on hand
cases plus an unequal-profile orbit check.

Tabulate per n: distinct LOCAL classes, distinct GLOBAL classes,
fresh-vs-previous-n, cumulative.

### L2 — three-center joint classes (the target layer)

The triple `(K(U), K(V), K(W))` as a **full triple-support incidence
type**, not merely a compatible gluing of coarse L1 summaries. Let

    Supp(U,V,W) := {U,V,W} ∪ K(U) ∪ K(V) ∪ K(W).

The class data is the isomorphism class of the finite structure on that
support with:

- distinguished Moser vertices `U`, `V`, `W`;
- for each non-Moser support point, a region label in
  `{int S, int O1, int O2}`;
- incidence bits recording membership in `K(U)`, `K(V)`, `K(W)`.

The three pairwise L1 classes are derived projections of this object.
This is the quotient that the LOCAL/GLOBAL realizability claims are
about. Canonical form: quotient by the automorphism group of the profile
(cap permutations allowed only when they preserve cap sizes), together
with reflection when size-preserving.

Same tabulation as L1. This is the layer whose stabilization (or not)
is the headline verdict.

### Sweep

n from 12 to 30 (first pass), all profiles per n. Extension rule
(resolves the former NEEDS_ADAM_INPUT marker): if at n = 30 the
stabilization detector has not fired, auto-extend in steps of +5 while
the total DFS node count for the last completed n stays under 10⁸;
past that budget, stop and report GROWING or INCONCLUSIVE-BUDGET as
the data dictates — extending further is Adam's call, flagged in the
results note.

For each profile, enumerate every pair/triple context
induced by that profile before quotienting by the profile's
size-preserving automorphism group. LOCAL tier for every n. GLOBAL tier:
test every distinct LOCAL class present at that n (memoize only exact
`(n, profile-context, class)` results). Do **not** prune GLOBAL checks
to fresh-LOCAL classes and do **not** infer per-`n` GLOBAL realizability
from earlier `n` unless §6's monotonicity lemma is actually proved and
cited in the results note.

GLOBAL budget discipline: the DFS is seeded with the target class's
Moser assignments fixed, candidate lists precomputed, centers ordered
by fewest candidates (the `q2_token.solve` heuristics); classes may run
in a worker pool. These are the only speedups allowed — all are
semantics-preserving; no mathematical pruning. If, at some n, more than
10% of GLOBAL cells come back INDETERMINATE (node cap), the sweep stops
at that n and the verdict is INCONCLUSIVE-BUDGET — a growth or
stabilization claim may not rest on INDETERMINATE-heavy tables. The
stabilization detector counts DETERMINED cells only.

## 5. Smoke tests (mandatory, before any real sweep)

- **S1 (composition reproduction).** With PROVEN cuts + joint kills, the
  GLOBAL solver at n = 12..16 must reproduce
  `census/q3_two_center/q3_token_proven.json` per-profile SAT bits
  exactly.
- **S2 (kill observation).** Hand-construct an assignment violating
  K-Q3-5 (shared member in int X) and one violating K-Q3-1; assert the
  enumerator classifies both as killed, and that with kills disabled
  they appear as LOCAL classes. This checks the kills are observed
  post-hoc, not silently unreachable in the encoding.
- **S3 (canonicalization).** For one unequal small profile (use
  `(4,5,6)` or `(6,5,4)` as the unordered test case), brute-force the
  L1 class set with a naive independent
  canonicalization (permute labels explicitly, take orbit minimum) and
  assert it matches `canon_joint`'s output set, including the distinct
  pair contexts forced by unequal cap sizes.

No sweep results are reportable until all three pass.

## 6. Candidate upgrade lemma (attempt, don't block on it)

The class *alphabet* is finite a priori (bounded support size, finite
region labels, and finite incidence-bit patterns), so only realizability
depends on n. A monotonicity lemma —

    GLOBAL-realizable at (n, profile) ⇒ GLOBAL-realizable at (n+1,
    profile + 1 interior point in a cap of size ≥ 5)

by inserting an inert point (choose its K-class among existing interior
points without breaking C2/C4/H1 budgets; the obstruction is C4
saturation — this needs an actual argument, not hand-waving) — would
upgrade STABILIZED-EMPIRICAL to STABILIZED-PROVEN (§2 labels). If the
lemma resists a short proof, keep the STABILIZED-EMPIRICAL label and
record the obstruction in the results note. Until the lemma is proved, the
base sweep remains witness-driven per `n`; no monotonicity-based pruning
or carry-forward is allowed in the per-`n` GLOBAL tables.

## 7. Non-goals / guardrails

- No metric solving, no Lean, no changes to `census/incidence/escape_census.py`,
  `scratch/census-554/`, or `scratch/census-12-gate/`.
- Never mix CONJECTURED-tier cuts into PROVEN-tier tables; every table
  carries its cut list in the artifact JSON.
- INDETERMINATE (node-cap) cells stay INDETERMINATE in the tables and
  the results note.
- Never identify pair/triple contexts across cap relabelings that do
  not preserve the profile's cap-size data.
- Environment: `uv run python` (pure stdlib enumeration expected; no
  solver deps needed).
- Commit checkpoints per repo policy (explicit pathspecs only —
  concurrent sessions share the tree).

## 8. Acceptance

1. Smoke tests S1–S3 pass and are committed with their outputs.
2. L0/L1/L2 tables for the full sweep, per-n and cumulative, with LOCAL
   and GLOBAL tiers separated, fresh-class counts, and the
   stabilization detector output for the L2 GLOBAL surface.
3. Verdict paragraph with rigor label, folded into the closure plan §7
   D3 + U4 register row.
4. If STABILIZED: the explicit finite L2 class inventory (this is the
   input a successor "finite joint-row split" lemma would consume).
5. If GROWING: fitted closed forms in p with residuals shown when they
   pass the §2 fit bar; otherwise the raw sequence labeled
   NO-CLOSED-FORM. Include a one-paragraph diagnosis of which decoration
   dimension drives growth.
