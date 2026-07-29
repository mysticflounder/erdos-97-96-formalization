# P97 counterexample search — Phase 2 implementation spec (2026-07-28, v1.0)

Implements `docs/p97-counterexample-search-design-2026-07-28.md` §8,
Phase 2, over the landed Phase-1 core (`PHASE1-SPEC.md`, all gates green
at 250d4e79). Scope: node annotations (blocker map, cap partition),
rule-bank promotions (R-FIBER4, R-CAPGE4 → ADMITTED), the production
cell iterator with canonical dedup and persistent banking, and explicit
seed constructions. Explicitly OUT of Phase 2: SAT-model enumeration
(Phase 3, orchestrator-designed encoding) and the realization arm
(separate dispatch).

**Soundness discipline (binding, unchanged from Phase 1).** Implement
exactly what this spec states. If a family is ambiguous, STOP on that
family and report the ambiguity in your final report (implement
everything else); never improvise a resolution to a soundness-relevant
question. Every rule and control carries its citation as given here.

## 1. Cell extension

Extend `Cell` (`cells.py`):

- New field `exact: bool = False`. In an exact cell every node must
  satisfy `|S[p]| == k` for all p (checked by the iterator at
  admission, NOT by changing the Node D1/D2 invariants). Completeness
  note (record in the docstring): exact-k census is WLOG-complete for
  existence questions — any equidistant class of size ≥ k contains one
  of size exactly k, and every ADMITTED rule in this bank is monotone
  under shrinking shells (R-CIRC2: intersections only shrink;
  R-FIBER4: stated relative to the chosen S). Exactness is a
  reduction, not a hypothesis; record it in the manifest as
  `exact: true`, not as a hypothesis tag.
- Profiled-cell validation tightening: `profile is not None` now
  requires `k == 4` and `n > 9` (the cap-profile frame is proved only
  under K4 with `9 < A.card`; see §4.2). A k=4, n=9 run must use a
  FRAMELESS cell. This may require adjusting existing Phase-1 tests
  that construct profiled cells outside this range — that adjustment is
  authorized.
- New property `frame_hypotheses -> frozenset[str]`: for profiled
  cells `frozenset({"k=4", "convex", "n>9"})`; for FRAMELESS cells
  `frozenset()`. These are the hypotheses of the frame theorem itself
  and attach to every claim about a profiled cell, whether or not any
  rule fires (restricting enumeration to profile cells USES the frame).

## 2. Annotations (`annotations.py`, new)

### 2.1 BlockerAnnotation

Over a node `(n, k, S)`: a total map `c: labels -> labels` with the
definitional invariant, enforced at construction (rejection, not
pruning):

- (B1) `x ∈ S[c(x)]` for every label x.

Derived (do not store): `c(x) != x` follows from B1 + D1
(`x ∈ S[c(x)]` while `c(x) ∉ S[c(x)]`). Provide
`fibers() -> dict[label, frozenset[label]]` with
`fiber(d) = {x : c(x) = d}` (all labels d, empty fibers included).

Semantics note (record in docstring): `c(x)` is a chosen center whose
witness shell contains x. The geometric "blocker" interpretation and
the EXISTENCE of such a total map for real configurations are NOT
established here — see the §4.1 cell-mode caveat.

### 2.2 CapAnnotation

Over a node `(n, k, S)`: `(M, f)` where `M` is a frozenset of exactly 3
labels (Moser vertices) and `f: (labels ∖ M) -> {0, 1, 2}` is total.
Closed caps are derived, matching the closed-cap convention of
`lean/Erdos9796Proof/P97/Cap/Structure.lean` (CapTriple, lines
143–204): cap i excludes exactly the i-th Moser vertex and contains the
other two. Concretely, fix `m0 < m1 < m2` the sorted elements of M;
`closed_cap(i) = f⁻¹(i) ∪ (M ∖ {m_i})`. Provide
`closed_profile() -> tuple[int, int, int]` (sorted ascending closed cap
sizes). By construction the closed sizes sum to
`(n − 3) + 6 = n + 3` — matching `Problem97.cap_sum_identity`
(`lean/Erdos9796Proof/P97/Cap/Partition.lean:86`); assert this in a
gate, not at runtime.

### 2.3 AnnotatedNode

`AnnotatedNode = (node, blocker | None, caps | None)` — immutable,
either annotation optional, content digest extending the node digest.

## 3. Annotated canonicalization (`canonical.py` addition)

Add `canonical_perms(node) -> tuple[labeling, ...]`: ALL discrete leaf
colorings of the existing `_search` tree whose certificate equals the
minimal certificate (each labeling maps label -> canonical position).
Implementation: same recursion as `_search`, but collect every leaf
achieving the running minimum instead of only the certificate (reset
the collection when a strictly smaller certificate appears). The
existing `canonical(node)` must remain byte-for-byte compatible.

`canonical_annotated(anode) -> tuple`:

- Node part: `canonical(anode.node)` as today.
- Blocker part (if present): `min` over σ ∈ `canonical_perms` of the
  tuple `(σ(c(σ⁻¹(0))), ..., σ(c(σ⁻¹(n−1))))`.
- Cap part (if present): `min` over σ ∈ `canonical_perms` AND τ ∈ S₃
  (cap-index permutations) of the tuple over canonical positions i of:
  `("M", τ(j))` if `σ⁻¹(i)` is the Moser vertex `m_j` (the vertex
  excluded from cap j), else `("f", τ(f(σ⁻¹(i))))`. τ ranges over all
  of S₃ because cap indices carry no content beyond the partition plus
  the apex pairing; minimizing over the group action is exact.

Performance caveat: `canonical_perms` can be large for highly symmetric
nodes; acceptable at Phase-2 (control/seed) scale. Do not add
automorphism pruning in Phase 2.

Gate G-CANON-ANN (§7) checks relabeling invariance of the annotated
form directly.

## 4. Rule promotions (`rules.py`)

### 4.1 R-FIBER4 → ADMITTED

Admission basis — mini-lemma, proved here (orchestrator, 2026-07-28):

> For any B1-valid annotation c on (n, k, S) and any label d:
> fiber(d) ⊆ S[d], hence |fiber(d)| ≤ |S[d]|; in an exact-k cell
> |fiber(d)| ≤ k.
> Proof: x ∈ fiber(d) means c(x) = d; B1 gives x ∈ S[c(x)] = S[d].
> Cardinality is monotone under ⊆. ∎

This is the design-doc §6 derivation (`x ∈ Σ(c(x))` + shell size)
stated for the census data structure; the numeric ≤ 4 form is the
exact-k, k=4 instance.

Rule shape — two predicate forms, one rule id:

- `r_fiber4_profile_violates(node, m) -> bool` where `m: labels -> int`
  is a candidate fiber-size map with `sum(m.values()) == n`: True
  (prune the annotation-search branch) iff `m[d] > len(S[d])` for some
  d. This is the motif-level form and the one that licenses cardinality
  constraints in Phase-3 encodings.
- `r_fiber4_predicate(anode) -> bool` on a blocker-annotated
  AnnotatedNode: True iff `|fiber(d)| > |S[d]|` for some d. By the
  mini-lemma this is provably False for every constructible
  AnnotatedNode (B1 is enforced); it is kept as a defensive check —
  if it ever fires, that is a bug in the annotation code, and the
  iterator must raise, not prune.

Status ADMITTED; `domain="annotated-node"` (new domain value);
hypotheses `("blocker-annotated",)`. Citation: this spec §4.1 +
design doc §6 "Blocker fibers".

Cell-mode caveat (record in the rule citation AND the manifest logic):
a cell run in blocker-annotated mode publishes claims conditional on
annotation existence — "no counterexample admitting a B1-valid total
blocker map …". The existence lemma (every convex K_k configuration
admits such a map with the intended geometric blocker semantics) is
{{NEEDS_PROOF}} and is NOT part of this admission. `iterate_cell` must
add the tag `"blocker-annotated"` to the manifest hypothesis set for
any cell run in that mode, unconditionally.

### 4.2 R-CAPGE4 → ADMITTED

Audit chain complete (orchestrator, 2026-07-28):

- Frame producer: `Problem97.MEC.nonempty_surplusCapPacket_of_K4`
  (`lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:98`) — from
  `A.Nonempty`, `ConvexIndep A`, `HasNEquidistantProperty 4 A`,
  `9 < A.card` produces a `SurplusCapPacket` (no minimality anywhere in
  the chain).
- Cap floor: `capTriple_caps_card_ge_four`
  (`lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean:446`) — all
  three CLOSED caps have ≥ 4 points; hypotheses all frame-supplied.
- Cap-partition/sum (the previously open sub-audit):
  `SurplusCapPacket.capSum`
  (`lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:397`) gives
  `|surplus| + |opp1| + |opp2| = |A| + 3`, via
  `CapTriple.cap_sum_identity` (`Cap/Structure.lean:251`) and
  `Problem97.cap_sum_identity` (`Cap/Partition.lean:86`), which is pure
  counting from the CapPartition fields; `nonmoser_in_one` is a
  CapTriple structure field and `moser_in_two` is derived from the nine
  explicit membership fields (`Cap/Structure.lean:213`). Closed-cap
  convention throughout — consistent with the §2.2 annotation and the
  Cell profile definition.

Changes: status → ADMITTED; hypotheses →
`("k=4", "convex", "n>9", "profiled")`; citation → the chain above
verbatim. Predicate unchanged (cell domain, closed cap size < 4
prunes; FRAMELESS returns False).

Kernel gate (unchanged, blocks PUBLISHED cell claims only, not this
admission): `proof-blueprint axioms` on
`nonempty_surplusCapPacket_of_K4` and `capTriple_caps_card_ge_four`
must show core axioms only before any per-cell non-existence claim is
published. Source-level scan done; kernel check pending. Record this
sentence in RESULTS.md.

Note (no rule needed): for n > 9 the profile sum n + 3 > 12 forces one
closed cap ≥ 5 automatically, so the surplus fact adds no pruning
content over R-CAPGE4 at profiled cells.

### 4.3 Engine changes

- New domain value `"annotated-node"`; `prune_annotated_node(anode,
  rules)` mirroring `prune_node` with the same hard-refusal asserts
  (ADMITTED only, domain match). `prune_node` behavior unchanged.
- `ADMITTED_RULES` becomes (R_CIRC2,); `ADMITTED_ANNOTATED_RULES` =
  (R_FIBER4,); `ADMITTED_CELL_RULES` = (R_CAPGE4,). Keep a single
  registry list of all rules for the bank hash (§5).
- Phase-1 `controls.py` G-RULES asserted CANDIDATE non-consultation for
  R-FIBER4/R-CAPGE4; with both now ADMITTED, update G-RULES: their
  kill/spare pairs become live positive controls, and the
  engine-refusal path is retested via a synthetic CANDIDATE rule
  (id `R-TEST-CANDIDATE`, trivial predicate) that exists only in
  controls. This controls.py modification is authorized; no other
  Phase-1 behavior may change.

### 4.4 Cut-pattern rules R-P1 / R-P2 (amendment 2026-07-28, v1.1)

New domain value `"cut-matrix"`. Object: a rectangular 0-1 matrix
(sequence of equal-length rows, entries 0/1) with FIXED semantics —
rows = side A of a cut of a strictly convex polygon listed in convex
arc order; columns = side B likewise; a 1-cell marks a row/column pair
KNOWN to lie at one common distance δ (subset semantics: 0-cells are
unconstrained; all 1-cells must carry the SAME δ); orientation read in
convention C2 (opposed): the traversal listing rows in increasing
order meets columns in decreasing index order
(`scratch/p97-search-lane/fr-pattern-lemma1.md`, pinned 2026-07-28).
The predicates are pure pattern scanners; the soundness burden of the
semantics (convex position, arc contiguity, C2 orientation, same-δ
1-cells) sits with the CONSUMER — Phase-3 encodings must discharge
those hypotheses per the standing hypothesis-intersection rule
(design doc §5). The engine cannot detect a mis-oriented or
mixed-radius matrix; the hypothesis tags are the audit trail.

- R-P1 (ADMITTED): True (prune) iff the matrix contains a 2×2
  all-ones submatrix (K₂,₂). Basis: `fr-pattern-lemma1.md` P1 proof,
  PROVEN + AUDITED 2026-07-28. Hypotheses `("convex",
  "one-side-contiguous-arc", "same-distance-cells")` — the audited
  proof uses only the row side's arc contiguity (either side suffices
  by the pattern's transposition symmetry) and is orientation-neutral,
  so no C2 tag.
- R-P2 (ADMITTED): True (prune) iff some rows r1<r2<r3, columns
  c1<c2<c3 have variant A {(r1,c1),(r1,c2),(r2,c3),(r3,c1),(r3,c3)} or
  variant B {(r1,c1),(r1,c3),(r2,c1),(r3,c2),(r3,c3)} all 1. Basis:
  `fr-pattern-p2-proof-draft.md` Theorem 1 + Corollary via Lemma R,
  PROVEN + AUDITED 2026-07-28 (math-skeptic; blocking gap F1 patched
  same day). Hypotheses `("convex", "contiguous-cut",
  "same-distance-cells", "C2-orientation")` — C2 is load-bearing:
  under the C1 reading variant A is REALIZABLE (draft §6), so a
  consumer feeding a C1-read matrix would over-prune realizable
  configurations.
- Engine: `prune_cut_matrix(matrix, rules)` mirroring `prune_node`
  (ADMITTED-only + domain asserts); malformed matrices (ragged,
  non-0/1) raise ValueError. `ADMITTED_CUT_MATRIX_RULES = (R_P1,
  R_P2)`; both appended to `ALL_RULES` (rule-bank hash changes; no
  production banks exist as of this amendment). Authorized Phase-1
  `controls.py` edit: G-RULES' registry-shape check updates from the
  3-rule to the 5-rule bank; no other Phase-1 behavior may change.
- NOT admitted: any shell-semantics generalization. S[p]-incidences at
  different centers carry different radii; a pattern-shaped occurrence
  among mixed-radius cells is NOT killed by the audited theorems.
  Phase 3 may construct these matrices only from same-δ certified
  cell sets.
- Gate (G-CUTPAT, appended to §7): R-P1 kills a hand-built K₂,₂ and
  spares 3-of-4 cells; R-P2 kills hand-built variant-A and variant-B
  occurrences embedded at non-contiguous rows/columns and spares
  4-of-5 cells; positive control — the S-FR-20 symmetric cut matrix
  (from `seeds.py` `_FR20_PAIRS`, native C2) fires NEITHER rule
  (certified-realizable must survive); orientation control — the
  column-reversed FR matrix fires R-P2 (the C1 misreading contains 16
  variant-B occurrences); `prune_cut_matrix` hard-refuses a
  node-domain rule.

## 5. Cell iterator + bank (`iterate.py`, new)

- `rule_bank_hash() -> str`: sha256 over the sorted
  `(id, status, hypotheses, domain, citation)` tuples of ALL rules.
- `CanonicalBank`: one jsonl file per cell. First line: header
  `{"rule_bank_hash": ..., "spec_version": "phase2-v1.0", "cell":
  ...}`. Entries: `{"digest": ..., "status": "OPEN" | "PRUNED",
  "fired": [...], "hypotheses": [...], "canonical": ...}` (statuses
  REALIZED/INFEASIBLE reserved for the realization arm, unused in
  Phase 2). Writes atomic (temp file + `os.replace`). On load with a
  mismatched `rule_bank_hash`, all PRUNED entries are demoted to STALE
  and must be re-run before the bank is usable (revalidation pass —
  census-554 banking discipline).
- `iterate_cell(cell, generator, bank) -> manifest`: for each produced
  object — admission checks (n, k match the cell; exact cells:
  `|S[p]| == k` for all p; profiled cells iterate cap-annotated nodes
  whose `closed_profile()` equals the cell profile; FRAMELESS cells
  iterate bare or blocker-annotated nodes per the cell mode) →
  canonical form (§3) → dedup against the bank → ADMITTED rules for
  the object's domain, recording fired ids and the hypothesis union →
  bank the entry. The manifest records: cell descriptor,
  `frame_hypotheses`, cell mode (`bare` | `cap-annotated` |
  `blocker-annotated`), `exact`, coverage (`PARTIAL` | `EXHAUSTIVE`),
  rule-bank hash, and the published-claim hypothesis set =
  `frame_hypotheses ∪ union(fired hypotheses) ∪ {"blocker-annotated"
  if that mode}`. Every Phase-2 generator is coverage PARTIAL except
  `tiny_exhaustive` (gate-only).
- Generators (Phase 2 complete list — no SAT enumeration):
  `explicit_seeds(cell)` (§6), `tiny_exhaustive(cell)` (full
  enumeration, gate scale only: n ≤ 5, k = 2), `mutation_probe`
  (G-SEEDED-2 harness). Production banks are not committed; gate banks
  go to a temp dir.

## 6. Seed constructions (`seeds.py`, new)

- (S-K3-9) The k=3 control: read the nine exact ℚ(√3) points from
  `scratch/p97-search-lane/verify_k3_control.py` (import its `PTS`;
  do not retype). With sympy exact arithmetic, group the 8 squared
  distances per point; each point has exactly one group of size 3
  (verified twice, 2026-07-28); `S[p]` = that group. Node: n=9, k=3,
  exact-3.
- (S-FR-20) The Fishburn–Reeds 20-gon incidence node
  (`scratch/p97-search-lane/fishburn-reeds-notes.md`): labels 0–9 =
  A-side vertices 1–10, labels 10–19 = B-side vertices 1–10 (B-side
  vertex j ↦ label 9 + j). For each of the 15 unordered pairs {i, j}
  in the notes' edge list, add BOTH cross-cut edges (i_A, j_B) and
  (j_A, i_B). `S[p]` = p's 3 partners. Node: n=20, k=3, exact-3.
  Cite the notes file in the code.

Both seeds are incidence projections of real (numerically or exactly
verified) configurations, so they must survive every ADMITTED rule —
each doubles as a soundness control on the admitted bank: a kill here
falsifies a rule, and the gate must fail loudly, not skip.

## 7. Gates (`controls2.py`, new; plus updated Phase-1 `controls.py`)

- (G-P1-REGRESS) Phase-1 `controls.py` still exits 0 after the §4.3
  authorized edits.
- (G-ANN-B1) A B1-violating blocker map is rejected at construction; a
  valid one is accepted; fibers computed correctly on a hand example
  (document the example inline).
- (G-CANON-ANN) 100 random (annotated node, random σ) pairs at small n,
  both annotation kinds: `canonical_annotated(σ·anode) ==
  canonical_annotated(anode)` (transport node, blocker map, M, and f
  along σ). Include at least one node with a nontrivial automorphism
  (e.g. a symmetric shell structure) so `canonical_perms` size > 1 is
  actually exercised.
- (G-CAP-ANN) Cap annotation: closed sizes sum to n + 3 on random
  valid annotations; `closed_profile` matches a hand-computed example.
- (G-FIBER) Profile form: an m with a part exceeding `|S[d]|` prunes; a
  conforming m is spared. Node form: on a valid blocker-annotated
  node the predicate is False; the iterator raises (not prunes) if it
  ever returns True (test via monkeypatched predicate).
- (G-CAPGE4) Cell (4, 12, (3, 6, 6)) pruned; (4, 12, (4, 5, 6))
  spared; FRAMELESS spared. Profiled-cell validation rejects k ≠ 4 and
  n ≤ 9.
- (G-ITER-DEDUP) Feed π-relabeled duplicates of one node; the bank
  stores exactly one entry.
- (G-ITER-SHADOW) The Phase-1 15-point shadow node (bare mode,
  FRAMELESS (4, 15) cell) banks OPEN.
- (G-ITER-KILL) An R-CIRC2-violating node banks PRUNED with fired
  `["R-CIRC2"]` and the correct hypothesis set.
- (G-SEEDED-2) Phase-1 G-SEEDED plant-and-recover, but through the
  full `iterate_cell` path: exactly the planted valid node ends OPEN.
- (G-SEED-K3, G-SEED-FR20) Both §6 seeds: D1/D2/exact-3 pass, degrees
  all 3 (FR), bank OPEN in their (3, n) FRAMELESS exact cells, NOT
  pruned by any ADMITTED rule.
- (G-BANK-REVAL) A bank written under a mutated rule-bank hash demotes
  PRUNED entries to STALE on load and refuses use until revalidated.

## 8. Deliverables + change control

`census/p97_search/`: `annotations.py`, `iterate.py`, `seeds.py`,
`controls2.py` (new); `cells.py`, `rules.py`, `canonical.py`,
`controls.py` (edited exactly as authorized in §1, §3, §4);
`RESULTS.md` (append a Phase-2 section: gate table, kernel-gate
sentence from §4.2, any STOP-reported ambiguities). `node.py` must not
change. Runnable from repo root:
`uv run python census/p97_search/controls2.py` and (regression)
`uv run python census/p97_search/controls.py`; both exit nonzero on any
gate failure. Final report: gate table + ambiguity list; no narrative
claims beyond gate outcomes.
