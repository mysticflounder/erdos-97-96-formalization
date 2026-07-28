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
