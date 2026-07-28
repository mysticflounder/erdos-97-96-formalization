# P97 counterexample search — Phase 1 implementation spec (2026-07-28, v1.0)

Implements `docs/p97-counterexample-search-design-2026-07-28.md` §8,
Phase 1: census core + rule engine + controls. NO production enumeration
runs in Phase 1. Implementation dir: `census/p97_search/`.

**Soundness discipline (binding).** Implement exactly what this spec
states. If a family is ambiguous, STOP on that family and report the
ambiguity in your final report (implement everything else); never
improvise a resolution to a soundness-relevant question. Every rule and
control carries its citation as given here. Amortize
`census/card_head/sat_encoding.py` utilities and the
`census/frontier-packages/*_core` code style where applicable.

## 1. Census node model

A node is `(n, k, S)`: labels `0..n-1`; `S: label -> frozenset[label]`
total; every point carries a class. Invariants (definitional, enforced
at construction, rejection is not "pruning"):

- (D1) `p not in S[p]` for all p.
- (D2) `|S[p]| >= k` for all p.

Semantics: `S[p]` is a chosen witness class of "`>= k` points
equidistant from `p`" — all of `S[p]` lies on one circle centered at
`p`. NO blocker map in the Phase-1 node — blocker-derived structure is
Phase 2, pending a separate admission audit.

Representation: immutable; a node must expose a stable content digest
(sha256 of a normalized serialization).

## 2. Canonicalization

`canonical(node)` must be a relabeling invariant: for every permutation
π of labels, `canonical(π·node) == canonical(node)`, and nodes in
distinct isomorphism classes must map to distinct canonical forms.
Implementation approach is the implementer's choice (iterative
refinement + branch on ties is fine); it must be exact, not heuristic.
Over-merging distinct classes is a completeness bug — treated as a
soundness bug for the non-existence branch.

Smoke gates:
- (G-CANON-1) 200 random (node, random-π) pairs at small n:
  `canonical(π·node) == canonical(node)` for every pair.
- (G-CANON-2) exhaustive at tiny scale: enumerate ALL nodes with
  n = 5, k = 2 (small enough to brute-force), group by canonical form,
  and independently group by brute-force isomorphism testing (try all
  120 permutations); the two partitions must agree exactly.

## 3. Rule engine

A rule is `(id, status, hypotheses, predicate, citation)`:

- `status ∈ {ADMITTED, CANDIDATE}`. ONLY ADMITTED rules may prune.
  CANDIDATE rules are implemented and unit-tested but the engine must
  hard-refuse to use them in any pruning pass (assert, not config).
- `hypotheses`: static tag list (e.g. `k=4`, `convex`, `n>9`) recorded
  with every pruning event; a cell's published hypothesis set is the
  union over rules actually fired (design §5 standing rule).
- `predicate(node) -> bool` (True = violates the rule = prune).

Phase-1 ADMITTED rules (citations audited by the orchestrator
2026-07-28; implement exactly):

- (R-CIRC2) hypotheses: none beyond the node semantics. For p != q:
  `|S[p] ∩ S[q]| <= 2`. Justification: S[p], S[q] lie on circles
  centered at p resp. q; distinct centers ⇒ the circles are distinct or
  concentric-distinct, meeting in <= 2 points; concentric (same center)
  is impossible since p != q as centers. Banked instances:
  `inter_card_le_two`, `cap_overlap_le_two`, `N8a_two_intersection_bound`
  (see `scratch/p97-search-lane/banked-pruning-inventory.md`).

Phase-1 CANDIDATE rules (implement + unit-test, do NOT admit):

- (R-FIBER4) placeholder over a blocker annotation — Phase 2; in
  Phase 1 implement only its unit-test scaffold with the predicate
  raising NotImplementedError (status CANDIDATE, no blocker data
  exists in the node yet).
- (R-CAPGE4) profile floor: in a (k=4, n, profile) cell, every closed
  cap size >= 4. Predicate operates on the cell descriptor, not the
  node. CANDIDATE pending orchestrator audit of
  `capTriple_caps_card_ge_four` (closed vs strict caps unresolved).

## 4. Cell descriptors

`Cell = (k, n, profile | FRAMELESS)`, `profile` a multiset of 3 closed
cap sizes summing to `n + 3`. Provide `profiles_for(n, min_cap)`
(enumerate unordered triples) + unit tests (e.g. `n=11, min_cap=4` must
include `(5,5,4)` — the census-554 cell; count checked by hand in the
test). FRAMELESS cells carry no profile constraint (used at k != 4 per
design §5). No cell is "run" in Phase 1 — descriptors + tests only.

## 5. Controls

- (G-SHADOW-NODE) Encode the 15-point tri-apex shadow
  (`scratch/triapex-incidence-obstruction/check_model.py`) as a census
  node: n=15, k=4, `S[c] = SHELLS[c]` for the 12 non-apex centers
  c = 0..11, `S[a] = RICH_CLASSES[i]` for the apices a = 12,13,14
  (zip sorted apices with RICH_CLASSES, matching check_model.py).
  Gate: passes (D1)/(D2) and is NOT pruned by any ADMITTED rule.
  Read the shadow data from check_model.py's literals; do not retype
  them by hand into the test without a comment citing the source lines.
- (G-SEEDED) Seeded-recovery scaffold: hand-build ONE additional valid
  node at n = 9, k = 2 (any structure passing D1/D2/R-CIRC2 — e.g.
  points on a 9-cycle with S[p] = the two neighbors... any valid choice;
  document it), plant it in a list of 50 mutated invalid variants
  (violating D1, D2, or R-CIRC2), run the filter pipeline, and verify
  exactly the planted node survives.
- (G-RULES) Per-rule controls: for R-CIRC2, one hand-built violating
  node (killed) and one conforming node (spared). For each CANDIDATE
  rule, the same pair wired but asserted to NOT be consulted by the
  pruning pass.

## 6. Deliverables

`census/p97_search/`: `node.py`, `canonical.py`, `rules.py`, `cells.py`,
`controls.py` (all gates), `RESULTS.md` (gate outcomes, canonicalization
approach description, any STOP-reported ambiguities). Runnable from repo
root via `uv run python census/p97_search/controls.py`; exit nonzero on
any gate failure. Final report: gate table + ambiguity list; no
narrative claims beyond gate outcomes.
