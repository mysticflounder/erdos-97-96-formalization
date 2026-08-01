# P97 counterexample search — Phase 1 results

Implements `census/p97_search/PHASE1-SPEC.md` (v1.0) sections 1-6 in full:
census node model + digest (`node.py`), exact canonicalization
(`canonical.py`), the rule engine with R-CIRC2 (ADMITTED)/R-FIBER4/R-CAPGE4
(CANDIDATE) (`rules.py`), cell descriptors + `profiles_for`
(`cells.py`), and every gate from spec sections 2/4/5 (`controls.py`). NO
production enumeration runs in Phase 1 -- this is census core + rule
engine + controls only, per spec.

Run from the repo root:

```
uv run python census/p97_search/controls.py
```

Exits nonzero if any gate fails.

## 1. Gate outcomes

| Gate | Verdict | Expected | Pass |
|---|---|---|---|
| G-CANON-1 | 200/200 random (node, π) pairs: `canonical(π·node) == canonical(node)` | 200/200 agree | yes |
| G-CANON-2 | 161051 nodes (n=5, k=2), 1516 isomorphism classes; canonical-form partition == independent brute-force-isomorphism partition | partitions agree exactly | yes |
| G-SHADOW-NODE | 15-point tri-apex shadow (n=15, k=4) passes (D1)/(D2), not pruned by any ADMITTED rule | (D1)/(D2) pass, unpruned | yes |
| G-SEEDED | planted n=9, k=2 node is the unique survivor among 50 invalid mutants | exactly 1 survivor, = planted node | yes |
| G-RULES | R-CIRC2 kills the violating pair / spares the conforming pair; R-FIBER4 and R-CAPGE4 hard-refuse via `apply_rule`/`prune_node` (AssertionError) on the same pair; R-FIBER4's raw predicate raises `NotImplementedError`; R-CAPGE4's raw predicate correctly kills/spares a standalone cell pair | all sub-checks pass | yes |
| `profiles_for` unit test | `profiles_for(11, 4) == ((4, 4, 6), (4, 5, 5))`, census-554 cell `(5,5,4)` present | matches hand count (2 profiles) | yes |

`ALL_GATES_PASS = True`. Wall time for the full suite: ~32s (G-CANON-2's
exhaustive n=5 enumeration dominates; every other gate is under 0.1s).

## 2. Canonicalization approach

`canonical()` uses exact individualization-refinement with no
automorphism-based pruning: points are colored by out-degree, refined to
a fixed point using both out-neighbor and in-neighbor color multisets
(`S` is directed, so both directions matter), and any tie remaining
after refinement stabilizes is broken by branching over *every* point in
the smallest tied color class, individualizing it, and recursing. The
lexicographically smallest leaf certificate across all branches is the
canonical form. Because the search branches over every member of a tied
cell rather than picking one, correctness does not depend on the quality
of the refinement step — in the degenerate case where refinement never
splits anything, the algorithm degrades to (a smarter-ordered) exhaustive
search over all `n!` permutations, which is exact by construction;
refinement is purely a branching-factor optimization, not a soundness
dependency. This is validated empirically by G-CANON-2, which compares
the resulting partition against an independently coded brute-force
minimum-over-orbit oracle (no shared code with `canonical.py`) across all
161,051 valid `(n=5, k=2)` nodes, and the two partitions agree exactly
(1,516 isomorphism classes both ways).

## 3. STOP-reported ambiguities

None. No spec item required stopping; two implementation-detail choices
not specified by the spec (both explicitly left open) are recorded below
for transparency, neither is soundness-relevant since neither affects
Phase-1's only ADMITTED rule (R-CIRC2) or any pruning outcome:

- **G-CANON-1 "small n"**: spec leaves the scale to the implementer.
  Trials draw `n` uniformly from `[3, 7]` and `k` from `[1, n-2]`
  (`random.Random(20260728)`, 200 trials).
- **R-CAPGE4 on a FRAMELESS cell**: the predicate's stated hypotheses are
  `(k=4, profiled)`; a `Cell` with `profile is None` is outside that
  hypothesis set, so `r_capge4_predicate` returns `False` (no claim)
  rather than raising. This is inert in Phase 1: R-CAPGE4 is CANDIDATE
  and is hard-refused by both `apply_rule` and `prune_node` regardless of
  its predicate's return value.

One modeling extension beyond the spec's literal rule tuple
`(id, status, hypotheses, predicate, citation)`: `Rule` carries an
additional `domain` field (`"node"` or `"cell"`) so the engine can encode
"R-CAPGE4's predicate operates on the cell descriptor, not the node"
(spec section 3) as a checked property rather than a convention. In
G-RULES, the CANDIDATE-rule "same pair wired" requirement is satisfied by
routing the R-CIRC2 node pair through `apply_rule`/`prune_node` for both
R-FIBER4 and R-CAPGE4 (both hard-refuse via `AssertionError` regardless
of domain match), plus a standalone cell-descriptor kill/spare pair to
unit-test R-CAPGE4's own predicate logic directly, since a node object
cannot otherwise exercise a cell-domain predicate meaningfully.

## 4. Files

- `census/p97_search/node.py` -- `Node`, `NodeInvariantError`, `relabel`.
- `census/p97_search/canonical.py` -- `canonical`.
- `census/p97_search/rules.py` -- `Rule`, `PruneResult`, `R_CIRC2`
  (ADMITTED), `R_FIBER4`/`R_CAPGE4` (CANDIDATE), `apply_rule`,
  `prune_node`, `ADMITTED_RULES`, `CANDIDATE_RULES`.
- `census/p97_search/cells.py` -- `Cell`, `CellError`, `FRAMELESS`,
  `profiles_for`.
- `census/p97_search/controls.py` -- all gates (G-CANON-1, G-CANON-2,
  G-SHADOW-NODE, G-SEEDED, G-RULES) plus the `profiles_for` unit test;
  single entry point, exits nonzero on any gate failure.

# P97 counterexample search -- Phase 2 results

Implements `census/p97_search/PHASE2-SPEC.md` (v1.0) in full over the
landed Phase-1 core: node annotations (`annotations.py`), annotated
canonicalization (`canonical.py` additions), rule promotions R-FIBER4 /
R-CAPGE4 CANDIDATE -> ADMITTED (`rules.py`), the production cell
iterator + persistent jsonl bank (`iterate.py`), explicit seed
constructions (`seeds.py`), and every gate from spec section 7
(`controls2.py`), plus the section-4.3-authorized `controls.py` G-RULES
update. No SAT-model enumeration (Phase 3) and no realization arm are in
scope here, per spec.

Run from the repo root:

```
uv run python census/p97_search/controls.py    # Phase-1 regression
uv run python census/p97_search/controls2.py   # Phase-2 gates
```

Both exit nonzero if any gate fails.

## 1. Gate outcomes (spec section 7)

| Gate | Verdict | Evidence | Pass |
|---|---|---|---|
| G-P1-REGRESS | `controls.py` run as a subprocess | exits 0 (`ALL_GATES_PASS = True`) | yes |
| G-ANN-B1 | hand example: 5-cycle node, `c(x)=(x+1)%5` | valid c accepted, `fibers = {0:{4},1:{0},2:{1},3:{2},4:{3}}` matches hand computation; `c(0)=2` (S[2]={1,3}, 0∉S[2]) rejected `AnnotationError` | yes |
| G-CANON-ANN | 100 random (annotated node, σ) pairs, 50 blocker / 50 caps, `random.Random(20260728)` | all 100 agree; explicit symmetric n=4 (`S[p]`=all others) case has `\|canonical_perms\|=24 > 1`, both annotation kinds invariant on it | yes |
| G-CAP-ANN | 50 random cap annotations + hand example (n=7, M={0,2,4}, f={1:0,3:1,5:1,6:2}) | all 50 sum to n+3; hand example `closed_profile()=(3,3,4)` matches by-hand computation | yes |
| G-FIBER | profile form kill/spare pair; node form on valid node; monkeypatched-True iterator raise | kill `m={0:3,...}` (3>\|S[0]\|=2) prunes, spare `m={0:1,...}` spared; node form False on a valid annotated node; `iterate_cell` raises `FiberDefensivePredicateFired` when `R_FIBER4.predicate` is monkeypatched to always return True | yes |
| G-CAPGE4 | `apply_rule(R_CAPGE4, ...)` on 3 cells + 2 malformed-profiled-cell constructions | `(4,12,(3,6,6))` pruned, `(4,12,(4,5,6))` spared, FRAMELESS spared; `Cell(k=3,n=11,profile=(4,5,5))` and `Cell(k=4,n=9,profile=(4,4,4))` both raise `CellError` | yes |
| G-ITER-DEDUP | 7 π-relabeled duplicates (incl. identity) of one n=5,k=2 node, fed through `iterate_cell` | bank has exactly 1 entry (`counts`: produced=7, admitted=7, duplicate=6, open=1) | yes |
| G-ITER-SHADOW | Phase-1 15-point tri-apex shadow, bare mode, FRAMELESS `(4,15)` cell | banks OPEN, `fired=[]` | yes |
| G-ITER-KILL | R-CIRC2-violating n=5,k=2 node through `iterate_cell` | banks PRUNED, `fired=["R-CIRC2"]`, `hypotheses=[]` (R-CIRC2 has none, FRAMELESS cell) | yes |
| G-SEEDED-2 | `mutation_probe` generator (1 planted + 50 mutants) through the full `iterate_cell` path, `Cell(k=2,n=9,profile=None)` | exactly 1 OPEN entry; its digest matches `sha256(repr(canonical(planted_node)))` independently recomputed | yes |
| G-SEED-K3 | S-K3-9 through `explicit_seeds` into `Cell(k=3,n=9,profile=None,exact=True)` | D1/D2/exact-3 pass, banks OPEN, not pruned by any ADMITTED rule | yes |
| G-SEED-FR20 | S-FR-20 through `explicit_seeds` into `Cell(k=3,n=20,profile=None,exact=True)` | D1/D2/exact-3 pass, degrees all 3 (checked both inside `seeds.py`'s construction and again directly in the gate), banks OPEN | yes |
| G-BANK-REVAL | bank with 1 PRUNED entry, header `rule_bank_hash` mutated on disk to simulate a stale bank | plain `CanonicalBank(path, cell)` raises `BankStaleError`; `CanonicalBank.open_for_revalidation` succeeds with 1 entry demoted to STALE; re-running `iterate_cell` over it clears STALE back to a fresh PRUNED entry | yes |

`ALL_GATES_PASS = True` for both `controls.py` and `controls2.py`.
Current `rule_bank_hash()` (3 rules, all ADMITTED, sha256 over sorted
`(id, status, hypotheses, domain, citation)` tuples):
`e1626f72c1831d8f93eaeecef558ea55a199849ea9bd76a5ea83ec0d7cc1ead9`.
Wall time: `controls.py` ~32s (G-CANON-2 dominates, unchanged from
Phase 1); `controls2.py` ~32s (dominated by its own G-P1-REGRESS
subprocess re-run of `controls.py`; every other Phase-2 gate is under
0.1s). Cross-check: running `tiny_exhaustive` over `Cell(k=2,n=5,
profile=None)` through `iterate_cell` bank-collapses the same 161051
nodes into 1516 canonical entries as Phase-1's independent G-CANON-2
brute-force partition -- confirms `canonical()` + the
`sha256(repr(canonical(...)))` dedup key agree with the Phase-1
isomorphism-class count exactly.

## 2. Kernel gate sentence (spec section 4.2, R-CAPGE4)

Kernel gate: **SATISFIED 2026-07-28** (orchestrator). `proof-blueprint
axioms` (live `#print axioms` via the Lean kernel, this repo's
blueprint) on `Problem97.MEC.nonempty_surplusCapPacket_of_K4`,
`Problem97.U1OppositeCapLowerBounds.capTriple_caps_card_ge_four`, and
`Problem97.SurplusCapPacket.capSum` each report exactly `propext`,
`Classical.choice`, `Quot.sound` -- no `sorryAx`, no custom axioms, no
`ofReduceBool`. All three symbols confirmed indexed at the cited
source paths in THIS repo (not a sibling corpus). Published per-cell
non-existence claims are no longer blocked on this gate. Note: this
citation edit changed `rule_bank_hash()`; any bank created before it
correctly demotes to STALE and requires revalidation (the intended
workflow -- no production banks existed at the time).

## 3. STOP-reported ambiguities

None. No spec item required stopping. A handful of implementation
choices left open by the spec's prose (all non-soundness-relevant --
none affect which rule prunes what, a rule's citation, or an admission's
hypothesis set) are recorded below for transparency:

- **Dedup key.** The spec names the bank entry field `digest` without
  pinning its exact construction. `iterate_cell` computes it as
  `sha256(repr(canonical_form))` (the *canonical* form's digest, not the
  raw node's `Node.digest()`) -- this is required for correctness, not
  just a choice: G-ITER-DEDUP needs π-relabeled duplicates (which have
  different raw node digests but identical canonical forms) to collapse
  to one entry.
- **R-CAPGE4 inside `iterate_cell` for profiled cells.** The spec states
  R-CAPGE4's predicate "operates on the cell descriptor, not the node"
  (unchanged from Phase 1) but does not pin exactly how a cell-domain
  rule is consulted inside the object-level `iterate_cell` loop (whose
  "ADMITTED rules for the object's domain" language is naturally
  node/annotated-node scoped). Implemented as: for every admitted object
  in a profiled cell, `apply_rule(R_CAPGE4, cell)` is also consulted
  once per object and its `fired`/`hypotheses` folded in alongside the
  node-domain rules -- so an invalid profile (e.g. a declared cap < 4)
  uniformly PRUNES every object banked under that cell. No Phase-2 gate
  exercises this path directly (G-CAPGE4 tests `apply_rule(R_CAPGE4,
  cell)` standalone, matching the gate's own literal wording); flagged
  here for visibility ahead of any production profiled-cell run.
- **`mode: null` in the manifest.** If a generator admits zero objects,
  `iterate_cell`'s manifest `mode` field is `None` (no object was ever
  classified). Not exercised by name in any gate; harmless (empty runs
  have no per-object claims to attach a mode to).
- **`prune_cell`-style engine symmetry.** `prune_node` and
  `prune_annotated_node` are the only two "prune_X" engine entry points
  (matching spec section 4.3's explicit list); R-CAPGE4 is consulted via
  plain `apply_rule(R_CAPGE4, cell)` rather than a third `prune_cell`
  wrapper, since the spec names only `prune_annotated_node` as a new
  engine function.

## 4. Files

- `census/p97_search/annotations.py` (new) -- `AnnotationError`,
  `BlockerAnnotation`, `CapAnnotation`, `AnnotatedNode`.
- `census/p97_search/canonical.py` (edited, section 3 addition only;
  `canonical()` byte-for-byte unchanged) -- adds `canonical_perms`,
  `canonical_annotated`.
- `census/p97_search/rules.py` (edited, section 4) -- R-FIBER4 and
  R-CAPGE4 promoted CANDIDATE -> ADMITTED with new citations; new domain
  `"annotated-node"`; `FiberDefensivePredicateFired`;
  `r_fiber4_profile_violates` (motif-level form);
  `prune_annotated_node`; split registries `ADMITTED_RULES` (R-CIRC2),
  `ADMITTED_ANNOTATED_RULES` (R-FIBER4), `ADMITTED_CELL_RULES`
  (R-CAPGE4), `CANDIDATE_RULES` (now empty), `ALL_RULES` (all 3, for the
  bank hash).
- `census/p97_search/cells.py` (edited, section 1) -- `Cell` gains
  `exact: bool = False` and the `frame_hypotheses` property; profiled
  cells now require `k == 4` and `n > 9`.
- `census/p97_search/iterate.py` (new) -- `rule_bank_hash`,
  `BankStaleError`, `CanonicalBank` (jsonl, atomic writes, STALE
  demotion + `open_for_revalidation`), `Generator`, `explicit_seeds`,
  `tiny_exhaustive`, `mutation_probe`, `GENERATORS`, `iterate_cell`.
- `census/p97_search/seeds.py` (new) -- `SeedNode`, `S_K3_9` (imports
  `PTS` from `scratch/p97-search-lane/verify_k3_control.py`, groups
  exact ℚ(√3) squared distances), `S_FR_20` (hardcodes the 15-pair edge
  list from `scratch/p97-search-lane/fishburn-reeds-notes.md` with a
  citation comment), `SEEDS`.
- `census/p97_search/controls.py` (edited, section 4.3 authorized:
  `G-RULES` only) -- R-FIBER4/R-CAPGE4 kill/spare pairs now run live
  through `prune_annotated_node`/`apply_rule`; CANDIDATE-refusal path
  retested via a synthetic controls-only `R-TEST-CANDIDATE` rule.
- `census/p97_search/controls2.py` (new) -- all 13 Phase-2 gates; single
  entry point, exits nonzero on any gate failure.
- `census/p97_search/RESULTS.md` (edited) -- this Phase-2 section.

`census/p97_search/node.py` and `census/p97_search/PHASE2-SPEC.md` are
unmodified.

---

# Amendment: cut-matrix rules R-P1 / R-P2 (2026-07-28, orchestrator)

PHASE2-SPEC.md section 4.4 (v1.1). Admission basis: the P1 proof
(`scratch/p97-search-lane/fr-pattern-lemma1.md`, PROVEN + AUDITED) and
the P2 proof (`scratch/p97-search-lane/fr-pattern-p2-proof-draft.md`,
Theorem 1 + Corollary via Lemma R, PROVEN + AUDITED 2026-07-28 —
math-skeptic returned NEEDS WORK with blocking gap F1, patched same
day; audit reverified every computation).

## Changes

- `rules.py`: new domain `"cut-matrix"`; `find_p1_occurrence` /
  `find_p2_occurrence` (witness-returning scanners),
  `r_p1_predicate` / `r_p2_predicate`, `R_P1` / `R_P2` (ADMITTED),
  `ADMITTED_CUT_MATRIX_RULES`, `prune_cut_matrix` (hard-refusal
  mirror of `prune_node`), `ALL_RULES` now 5 rules — the rule-bank
  hash CHANGED (no production banks existed).
- Semantics contract (soundness burden on the CONSUMER, spec 4.4):
  rows/columns = cut sides in convex arc order, C2 (opposed)
  orientation, all 1-cells at ONE common distance. NO shell-semantics
  (per-point radius) generalization is admitted; Phase 3 may build
  these matrices only from same-δ certified cell sets. R-P2's
  hypotheses carry `"C2-orientation"` — load-bearing, since variant A
  is realizable under the C1 reading.
- `controls.py` G-RULES: registry-shape check updated 3 → 5 rules
  (authorized by spec 4.4). `controls2.py`: gate G-CUTPAT added.

## Gate outcomes

Both suites green post-amendment: `controls.py` ALL_GATES_PASS = True,
`controls2.py` all 14 gates PASS. G-CUTPAT: R-P1/R-P2 kill/spare pairs
pass; the S-FR-20 symmetric cut matrix (30 ones, degree 3 per row,
built from `seeds.py` `_FR20_PAIRS`) fires NEITHER rule in its native
C2 reading (certified-realizable positive control) and fires R-P2 in
the column-reversed C1 misreading with exactly 16 variant-B
occurrences (independently recounted in the gate); domain hard-refusal
and ragged/non-0/1 ValueError paths tested.

Note: an earlier committed convention scan
(`scratch/p97-search-lane/p2_convention_checks.py`) used a 15-one
half-matrix (unordered pair {i,j} contributes BOTH A_iB_j and A_jB_i;
the first scan set only one) and reported one C1 P2-B occurrence;
corrected same day to the symmetric 30-one matrix — native-C2 results
unchanged (all zero), C1 count corrected to 16.

## Amendment 2026-07-28 (v5 update to v2): full-source R-P3

R-P3 now covers the complete certified P3 forbidden-pattern family.
Theorem 2 closes R1/R3, Proposition 4 closes R2 in the distinct- and
merged-inner-column cases by exact angle contradictions, Proposition
5 supplies transpose symmetry, and Theorem 6 assembles the result.
The independent report
`scratch/p97-search-lane/p3-r2-compute/SKEPTIC-2026-07-28.md` returns
CERTIFIED; the load-bearing derivations are in
`p3-r2-compute/RESULTS.md` §§3–4. Lemma R′ restriction inheritance
remains an explicit hypothesis bridge.

### Changes

- `rules.py` expands `find_p3_occurrence` from the old scoped family
  to six source templates (R1/R2/R3, each distinct- or merged-inner),
  then transposes and deduplicates them to eight shapes. Witness names
  use the unambiguous `distinct-inner`/`merged-inner` terminology.
- `controls2.py` gives G-CUTPAT an independent static eight-template
  oracle: eight exact positives with exact witness-name checks and all
  48 single-required-cell deletions spared, including the check that
  no deletion exposes an alternate P3 match.
- `controls.py` receives documentation only. R-P3 retains its public
  ID, so the rule registry and its cardinality are unchanged.
- The rule-bank hash changes because the expanded certification is
  recorded in the rule citation. Previously pruned banks must be
  revalidated against the new hash.

### Gate outcomes

Both standalone suites are green after the expansion:
`controls.py` reports `ALL_GATES_PASS = True`; `controls2.py` reports
all 14 gates PASS. G-CUTPAT specifically reports eight exact P3
positives, 48 deletion spares, and noncolliding source names.

The downstream trust boundary is unchanged: any Phase-3 consumer must
discharge strict convexity, contiguous-cut, same-δ, and C2-reading
hypotheses. This rule is not a shell-semantics generalization.

## Amendment 2026-07-28 (v3): R-P4 (spec section 4.6)

Two independent direct 600-dpi audits of Fishburn--Reeds Figure 4
(source PDF page 8, printed page 88) certify the following `2k`-cell
patterns for every `k ≥ 3`:

- A:
  `{(r_i,c_{k-i}),(r_i,c_{k-i+1}):1≤i≤k−1}
   ∪ {(r_k,c_1),(r_k,c_k)}`;
- B:
  `{(r_1,c_1),(r_1,c_k)}
   ∪ {(r_i,c_{k+1-i}),(r_i,c_{k+2-i}):2≤i≤k}`.

Pattern B is the simultaneous row-and-column reversal of A. The
previously considered column-only reversal `B_col` is not the source
pattern; it remains a proved auxiliary statement and is deliberately
not scanned by `R-P4` (the v4 amendment below gives it a separate ID).

### Changes

- `rules.py`: `find_p4_occurrence`, `r_p4_predicate`, and admitted
  `R_P4`; the scanner checks A and B over every chosen `k`-row and
  `k`-column submatrix for `3 ≤ k ≤ min(rows,cols)`.
- `ADMITTED_CUT_MATRIX_RULES` is now
  `(R_P1, R_P2, R_P3, R_P4)` and `ALL_RULES` now has 7 rules.
- `controls2.py`: G-CUTPAT has exact A/B kill-and-spare controls at
  noncontiguous embeddings for `k=3` and `k=5`, plus a `B_col`
  non-firing control.
- `controls.py`: registry-shape expectations updated to 7 rules.

The rule has the same semantic trust boundary as R-P1/R-P2/R-P3:
the scanner sees only a binary cut matrix; a Phase-3 consumer must
establish convexity, contiguity, one common distance, and the C2
reading before applying the geometric theorem.

## Amendment 2026-07-28 (v4): auxiliary R-P4-B-COL (spec section 4.7)

The independently proved auxiliary `B_col` obstruction is now admitted
without changing the source-only meaning of `R-P4`. For every `k ≥ 3`,
its zero-based relative cell set is

`{(i,i),(i,i+1):0≤i≤k−2} ∪ {(k−1,k−1),(k−1,0)}`.

`scratch/p97-search-lane/fr-pattern-p4-proof-draft.md` §§8--10 proves
this family forbidden: the two alternating matchings would both total
`kδ`, while Proposition C proves the shifted total is strictly larger.
The result is PROVEN + AUDITED 2026-07-28, but it is auxiliary and must
not be attributed to Fishburn--Reeds Figure 4.

### Changes

- `rules.py`: added `find_p4_b_col_occurrence`,
  `r_p4_b_col_predicate`, and admitted `R_P4_B_COL` with ID
  `R-P4-B-COL`. `R_P4` still scans only source A/B.
- `ADMITTED_CUT_MATRIX_RULES` now appends `R_P4_B_COL`; `ALL_RULES`
  now has 8 rules, so the rule-bank hash changes.
- `controls2.py`: G-CUTPAT now has an exact non-contiguous `k=4`
  B_col kill, exact witness, one-cell spare, and bidirectional scanner
  separation from source A/B at `k=3,5`.
- `controls.py`: registry-shape expectations updated to 8 rules.

The admission retains the conservative C2 cut-matrix trust contract:
strict convexity, contiguous cut arcs, and one common distance for all
1-cells remain consumer obligations. The proof itself also establishes
C1/C2 convention-independence, but the engine contract is not broadened.

This admission adds provenance but **zero new pruning beyond R-P2**.
For every `k ≥ 3`, each B_col occurrence contains P2-A on relative rows
`(0,k−2,k−1)` and columns `(0,1,k−1)`: the five cells are
`(0,0),(0,1),(k−2,k−1),(k−1,0),(k−1,k−1)`. The first pair comes from
the `i=0` B_col row, the middle cell from the shifted entry at `i=k−2`,
and the last pair from the wrap row. These row and column triples are
strictly increasing for `k ≥ 3`, proving universal R-P2 subsumption,
not merely observed scanner overlap. G-CUTPAT verifies the explicit
embedded P2-A witness at `k=3,5`. `R-P4-B-COL` therefore supplies
independent certificate attribution and diagnostics only; it cannot
prune a matrix that the admitted R-P2 rule spares, and remains distinct
from the actual source P4 variants.

## Amendment 2026-07-28 (v6): Theorem-3 diagnostic only

`rules.py` now exports
`fr_theorem3_dense_small(matrix)`: after the shared rectangular 0/1
validation, it returns whether `rows + columns < 20` and every
row/column degree is at least three, with both dimensions explicitly
at least three to exclude vacuous empty-axis cases. It is pure and diagnostic-only:
it is not a `Rule`, is absent from `ADMITTED_CUT_MATRIX_RULES` and
`ALL_RULES`, does not enter the bank hash, and is not consulted by
`prune_cut_matrix`. `PruneResult`, exact fired-ID order, and hypothesis
collection are unchanged.

The backing evidence is the direct Lemma-2 certificate sweep under
`scratch/p97-search-lane/theorem3-table2/`: all 56 cases
`3 <= alpha <= beta`, `alpha + beta <= 19` are
certificate-checked UNSAT for row/column degree at least three while
avoiding source P1/P2/full-P3/source-P4. The hardened run requires
CaDiCaL's UNSAT exit status and `drat-trim` return code zero with an
exact standalone `s VERIFIED` line; the independent skeptic audit
replayed all 56 proofs and returned CERTIFIED.

This is a Python/CNF/DRAT certificate conditional on the audited
transcription and generator, not a Lean theorem or a proof of the
consumer's geometry. Combined Theorem-3 use still requires the
separately audited geometric P1--P4 exclusions and a C2-read,
strictly-convex, contiguous, single-distance cut matrix. Auxiliary
`B_col` was excluded from the certificate and is not Fishburn--Reeds
Theorem-3 source evidence.

The helper adds zero incremental pruning. The full source scanner
already retains the source obstruction and complete attribution;
short-circuiting on the diagnostic would discard the remaining fired
IDs and hypotheses. Such an early exit is reserved for a future
consumer that explicitly does not require full attribution.

The direct sweep consumes no Table-2 value. The unresolved discrepancy
therefore remains visible but non-blocking for this result: the printed
table gives `g(6,8)=18`, while the candidate source transcription has
a certified, independently scanned 19-one feasible matrix and
`g_candidate(6,8)=19`. Table 2 is not imported as an exact bank.

G-CUTPAT now covers:

- a positive 3x3 all-ones diagnostic and a one-cell degree miss;
- transpose invariance for both positive and negative cases;
- ragged and non-0/1 rejection through the shared validator;
- the native degree-three FR-20 matrix at the exact
  `alpha+beta=20` boundary: diagnostic false and source P1--P4 scan
  spare; and
- exact full-bank noninterference: the 3x3 all-ones matrix fires
  `("R-P1", "R-P2", "R-P3", "R-P4", "R-P4-B-COL")` with the same
  hypothesis union before and after the helper call, and the input is
  unchanged.

The required regressions are green: `controls.py` and `controls2.py`
both report `ALL_GATES_PASS = True`; the complete logs are
`scratch/p97-search-lane/theorem3-table2/controls-theorem3-diagnostic.log`
and
`scratch/p97-search-lane/theorem3-table2/controls2-theorem3-diagnostic.log`.

## Phase 3 pointer (2026-07-28)

The fail-closed SAT enumerator, combined cap+blocker mode, permanent controls,
and first bounded production probes are recorded in `PHASE3-RESULTS.md`.
All Phase-1, Phase-2, and Phase-3 controls pass.  The production probes are
`PARTIAL`, with 29 OPEN canonical `(3,9)` survivors and 100 OPEN canonical
`(4,10,(4,4,5))` combined survivors among the first 100 raw models.  These
are structural candidates only; no Euclidean realization, non-existence,
finite-range coverage, or Lean closure is claimed.

The current replay fixtures and all later screening totals are authoritative
in `PHASE3-RESULTS.md`; this top-level ledger intentionally does not duplicate
their evolving counts.
