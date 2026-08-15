# FreshThird exact-three carrier structural CEGAR v2

## Verdict

`wave-0001` is a source-authenticated **BUDGET** result in all four boundary
cells. It is neither a source-faithful SAT survivor nor an UNSAT result, and it
closes no Lean `sorry`.

The run used commit `08a48e01206be65455ca60afe9273ee5aabd67cb` and transitive
source-content hash
`d2675aa417c5078fa309b27650d674bc63926adf941692a6edc0cc4b54dd470e`.
The snapshot covers 2,864 local Lean files, the external-import inventory,
`lean-toolchain`, the lakefile, `lean/lake-manifest.json`, the Python query/CNF
adapter/runner/replayers, and the Lean cap-alternation ingress plus aggregate
import. Dirty or untracked transitive sources are archived under the wave.
Preflight and postflight source verification agree on the content hash.

CaDiCaL 3.0.0 was authenticated at
`/Users/adam/.local/bin/cadical`, SHA-256
`66b34e225d5661f8e9b33fb8f77f2e9ae4c5639d8fe2a19067edb06c6d97d9d8`.
The runner used one worker, four serial cells, a fixed 30-second solver limit,
and at most twelve learned cuts per cell. No timeout or cut-budget escalation
was used.

## Cell results

Every cell reached step 12 with a complete CaDiCaL SAT assignment satisfying
the base structural CNF and all twelve earlier learned clauses. Every such
assignment failed the independent full source replay with the named core
`source__pinned_source_theory`. The terminal signature still admitted a
thirteenth source-proved cap-alternation clause, so each cell stopped as
`BUDGET` exactly as specified.

The 48 admitted clauses comprise:

- four `0101` clauses, one identical role pattern in each boundary cell; and
- forty-four `1010` clauses, eleven role patterns repeated across all four
  cells.

All 48 refer to cap 1. The next unadmitted refinement is also identical in all
cells: the `1010` pattern on `boundaryFanBlockerRowSource3_2`,
`boundaryFanBlockerCenter3`, `freshCenter`, and `sourceCenter`.

An independent post-run pass replayed all twelve certificate records in every
cell against the repository-bound Lean query, clause ingress, aggregate
import, exact variable map, model signature, and actual parent record. All 48
replays pass. Reinvoking the terminal runner also passes its source snapshot,
configuration, canonical-result, per-artifact hash, and complete inventory
checks without launching another solver call.

## Wave-only theorem mine

The wave does not expose a new mathematical theorem. Its only uniform pattern
is repeated violation of the already-proved `NoAlternatingCap` theorem. A new
Lean theorem-bank search is therefore not justified: the relevant source
theorem and its exact seven-literal clause adapter are already the learned-cut
certificate.

The next useful solver change is architectural. The finite encoder needs a
compact or batched encoding of the full no-alternation constraint, rather than
learning one four-role instance per SAT model. Such an encoding must be shown
equisatisfiable with the source theorem and independently replayed before any
successor wave. Raising the present cut budget or rerunning the same schema
would only enumerate more instances of an already-known theorem and is not
authorized by this result.

## Claims not made

This wave proves no Euclidean realization, P97 counterexample, finite carrier
coverage, universal producer, finite-to-general lift, QueryContract, terminal
UNSAT, or Lean closure.
