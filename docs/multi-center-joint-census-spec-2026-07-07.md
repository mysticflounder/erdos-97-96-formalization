<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Spec: parametric multi-center joint token census (2026-07-07)

Status: SPEC — not started. Build in a fresh session. Owner doc for the
verdict fold: `closure-plan-2026-07-06.md` §7 D3 + uncertainty register U4.

## 1. Question

Under the census/D3 token model, the PROVEN kill set, and the four-point
selected-class convention, does the **multi-center joint token surface**
(two-center and three-center shared-member joint classes across the Moser
pairs) become **constant in n**?

Motivation. The four-point subpacket reduction works because the
single-center primitive row surface is constant for n ≥ 12 (31 ordered /
19 reflected rows — `incidence-census-lemma-leads.md` §7). The Q3 probe
(`scratch/q3-two-center/report.md`) classified the two-center *decorated
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

1. `scratch/multi-center-census/` containing the enumerator, JSON
   artifacts per layer, and a `STATE.md` checklist (pattern:
   `scratch/q3-two-center/STATE.md`).
2. A results note `docs/multi-center-joint-census-<date>.md` with the
   per-n tables and the verdict.
3. Verdict, one of:
   - STABILIZED (EMPIRICAL): no fresh joint class for the last K = 4
     consecutive values of n, with the full finite class inventory
     listed; or
   - GROWING: fresh classes persist to the max swept n, with fitted
     closed forms in p = n − 9 (label the fits EMPIRICAL over the swept
     range, per `escape-census-bugcheck.md` practice).
4. Fold: one paragraph + register row update in
   `closure-plan-2026-07-06.md` (§7 D3 narrative, U4 row).

## 3. Model (reuse, do not re-derive)

Ground everything in the existing token model. Import, don't copy:

- `scratch/candidate-d-probe/q2_token.py` — `build_labels`, `type_of`,
  the admissibility constraints, and the DFS `solve` skeleton.
- `scratch/q3-two-center/q3_token.py` — `PAIR_CAP`, `joint_ok`,
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

## 4. What to enumerate

Three layers. For each, two tiers of "exists":

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
of (K(a), K(b)) is the decoration of the shared set K(a) ∩ K(b)
(size 0, 1, or 2 by C2):

- for each shared member z: its region ∈ {third Moser vertex, int X,
  int Y, int Z} (int X is dead under K-Q3-5 but keep the alphabet full
  so the kills are *observed*, not baked into the encoding);
- plus each endpoint's own count of members in the two caps containing
  it (its H1-visible signature: (|K(a) ∩ (Y∖{a})|, |K(a) ∩ (Z∖{a})|)
  etc.), so the class records how the coupling sits inside each
  center's budget.

Canonicalization: quotient by the reflection that swaps Y ↔ Z (and, when
cap sizes are equal, the relabeling it induces); all three Moser pairs
map to a single canonical pair by cap relabeling — enumerate once,
tabulate once. Spell the canonical form out in code as a single
`canon_joint(...)` function and unit-test it on hand cases.

Tabulate per n: distinct LOCAL classes, distinct GLOBAL classes,
fresh-vs-previous-n, cumulative.

### L2 — three-center joint classes (the target layer)

The triple (K(U), K(V), K(W)) with all three pairwise shared-set
decorations simultaneously (a compatible gluing of three L1 classes —
note the same shared member can appear in two pairs' shared sets only
via the third vertex or a doubly-shared interior point; C2/C4 bound
this). Canonical form: quotient by the S₃ cap-relabeling action
restricted to the profile's equal-size caps, plus reflection.

Same tabulation as L1. This is the layer whose stabilization (or not)
is the headline verdict.

### Sweep

n from 12 to 30 {{NEEDS_ADAM_INPUT: extend past 30 if cheap?}}, all
profiles per n. LOCAL tier for every n; GLOBAL tier for every fresh
LOCAL class (a class GLOBAL-realized at some n stays realized in the
cumulative inventory — but see §6 monotonicity before assuming it for
per-n tables).

## 5. Smoke tests (mandatory, before any real sweep)

- **S1 (composition reproduction).** With PROVEN cuts + joint kills, the
  GLOBAL solver at n = 12..16 must reproduce
  `scratch/q3-two-center/q3_token_proven.json` per-profile SAT bits
  exactly.
- **S2 (kill observation).** Hand-construct an assignment violating
  K-Q3-5 (shared member in int X) and one violating K-Q3-1; assert the
  enumerator classifies both as killed, and that with kills disabled
  they appear as LOCAL classes. This checks the kills are observed
  post-hoc, not silently unreachable in the encoding.
- **S3 (canonicalization).** For one small profile (e.g. (6,5,4)),
  brute-force the L1 class set with a naive independent
  canonicalization (permute labels explicitly, take orbit minimum) and
  assert it matches `canon_joint`'s output set.

No sweep results are reportable until all three pass.

## 6. Candidate upgrade lemma (attempt, don't block on it)

The class *alphabet* is finite a priori (region labels × counts ≤ 4),
so only realizability depends on n. A monotonicity lemma —

    GLOBAL-realizable at (n, profile) ⇒ GLOBAL-realizable at (n+1,
    profile + 1 interior point in a cap of size ≥ 5)

by inserting an inert point (choose its K-class among existing interior
points without breaking C2/C4/H1 budgets; the obstruction is C4
saturation — this needs an actual argument, not hand-waving) — would
upgrade a STABILIZED verdict from EMPIRICAL to PROVEN-above-n*. If the
lemma resists a short proof, report the verdict as EMPIRICAL and record
the obstruction in the results note.

## 7. Non-goals / guardrails

- No metric solving, no Lean, no changes to `scripts/escape-census.py`,
  `scratch/census-554/`, or `scratch/census-12-gate/`.
- Never mix CONJECTURED-tier cuts into PROVEN-tier tables; every table
  carries its cut list in the artifact JSON.
- INDETERMINATE (node-cap) cells stay INDETERMINATE in the tables and
  the results note.
- Environment: `uv run python` (pure stdlib enumeration expected; no
  solver deps needed).
- Commit checkpoints per repo policy (explicit pathspecs only —
  concurrent sessions share the tree).

## 8. Acceptance

1. Smoke tests S1–S3 pass and are committed with their outputs.
2. L0/L1/L2 tables for the full sweep, per-n and cumulative, with
   fresh-class counts and the stabilization detector output.
3. Verdict paragraph with rigor label, folded into the closure plan §7
   D3 + U4 register row.
4. If STABILIZED: the explicit finite L2 class inventory (this is the
   input a successor "finite joint-row split" lemma would consume).
5. If GROWING: fitted closed forms in p with residuals shown, and a
   one-paragraph diagnosis of which decoration dimension drives growth.
