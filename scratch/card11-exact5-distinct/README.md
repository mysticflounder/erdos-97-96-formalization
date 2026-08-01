# Card-11 exact-five distinct-center encode-first lane

## Milestone

This directory contains the first **encode-only** milestone for the original
D3 leaf
`FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` at
`|A| = 11` and cap profile `(5,5,4)`.

Both directed arms were encoded and independently reconstructed:

| directed arm | variables | clauses | SHA-256 |
| --- | ---: | ---: | --- |
| delete interior `w`, survive at `q` blocker | 935 | 55,200 | `58c4dcecb7514b8a5b10ded2238e96f827db1304b2d6cf335d3d802584ae218b` |
| delete interior `q`, survive at `w` blocker | 935 | 55,200 | `5bfdc77134961c5a23a18bfe4c57ad7ef40e88f06a583c9964b784d7319ee3ad` |

No SAT solver was run. The status is `NOT_RUN_ENCODE_ONLY`, not SAT, UNSAT,
or theorem closure.

The reproducible checkpoint is
[`artifacts/checkpoint.json`](artifacts/checkpoint.json); its source and command
manifest is [`artifacts/provenance.json`](artifacts/provenance.json).

## Exact source scope

The source leaf is declared at
`lean/Erdos9796Proof/P97/ATail/FirstApexUniqueRadiusResidual.lean:150-181`.
The Boolean surface represents its exact-five class, its original and
strict-interior ordered pairs, the full critical-shell map, distinct interior
obstruction centers, the two double-deletion survival rows at the second apex,
and one chosen directed cross-deletion arm.

The physical-second-apex consumer is
`scratch/atail-force/unique5-distinct-hybrid-terminal/`
`UniqueFiveDistinctPhysicalSecondApexSplit.lean:146-166`. It produces either:

1. a bi-apex robust descendant, which is impossible at card 11 because that
   descendant proves card at least 12; or
2. a swapped protected exact-four frontier.

The original D3 surface here has `opp1-card = 5` only. The swapped
`opp1-card = 4` frontier is explicitly recorded as a **different downstream
stage** and is not encoded as another original-D3 orbit.

## Fixed card-11 labeling and orbit policy

The boundary is labeled in cyclic order by `0,...,10`, with:

- first apex `A1 = 0`;
- second apex `A2 = 4`;
- surplus cap `{0,1,2,3,4}`;
- first opposite cap `{4,5,6,7,8}`, strict interior `{5,6,7}`;
- second opposite cap `{8,9,10,0}`; and
- surplus vertex `8`.

The role variables retain every allowed assignment of the ordered roles
`original_q`, `original_w`, `interior_q`, and `interior_w`. No endpoint swap,
reflection, or other symmetry quotient is used. This full labeled orbit is the
safe initial cap-pair orbit because it does not require an unproved transport
or stabilizer argument.

## Variable and clause surface

The 935 variables are:

- 121 selected-row memberships `m`;
- 495 complete positive-radius partition relations `eq`;
- 121 chosen blocker centers `b`;
- 121 complete critical supports `h`;
- 11 members of the exact-five first-apex class;
- 44 ordered frontier-role indicators; and
- 22 independently chosen second-apex survival-row memberships.

The clauses enforce:

- equivalence transitivity for every center's complete radius partition;
- one selected four-row at every carrier center, contained in one radius class;
- the cyclic two-circle alternation consequence;
- selected-row strong connectivity on every proper nonempty subset;
- the exact-five and unique-four-class-radius surface at the first apex;
- source-compatible cap placement and ordered distinctness of both pairs;
- a unique critical blocker and complete exact-four support for each source;
- the `no_qfree` consequence after deleting the source;
- equality of complete critical supports when two sources have the same blocker;
- independent four-point rows at the second apex after each pair deletion;
- the source-proved blocker inequalities and distinct interior blockers; and
- the selected directed survival arm, expressed as partner omission from the
  complete critical support.

The two formulas differ only in the orientation of that last 121-clause block.

## Minimality boundary

`D.Minimal` is not finitized. It quantifies over arbitrary smaller
counterexamples and arbitrary smaller carriers, so replacing it with a Boolean
flag or with “all proper subsets of this 11-vertex carrier fail” would not be
source-faithful.

The only minimality-derived condition encoded here is the already-used finite
consequence that the graph of chosen selected rows is strongly connected
across every proper cut of this fixed carrier. This is a consequence surface,
not an encoding of the global predicate.

## Trust boundary and missing bridge

The independent verifier does not import the encoder. It reconstructs all 935
variable names and the complete 55,200-clause multiset, parses DIMACS
independently, checks the hash/header/metadata, and rejects a deliberately
mutated CNF in the test suite.

That validates the files against the documented finite projection. It does
**not** prove that every Lean source instance maps to a satisfying valuation.
Before an UNSAT result could be promoted, the lane still needs an explicit
source-to-valuation theorem (or a proved chain of adapters) covering:

- normalization of an arbitrary card-11 `(5,5,4)` source packet to this cyclic
  labeling;
- the complete-radius partition and cyclic-alternation clauses;
- the exact-five cap-distribution clauses;
- the selected-row strong-connectivity consequence of `D.Minimal`;
- the critical-map support, blocker, and same-blocker clauses;
- both independent second-apex survival-row selections; and
- full ordered-role orbit coverage.

Until that bridge and a checked SAT certificate ingress exist, any future
solver result is only evidence about this finite projection.

## Reproduction

From the repository root:

```bash
uv run --project scratch/card11-exact5-distinct \
  python scratch/card11-exact5-distinct/test_lane.py

uv run --project scratch/card11-exact5-distinct \
  python scratch/card11-exact5-distinct/run_encode_milestone.py
```

The runner rebuilds both CNFs, invokes the independent verifier for each, and
refreshes the provenance and checkpoint. It does not invoke CaDiCaL or Lean.
