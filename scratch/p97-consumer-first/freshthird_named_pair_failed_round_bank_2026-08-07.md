# FreshThird all-named-row shared-pair failed-round bank audit

Date: 2026-08-07  
Target: `freshthird_all_selected_row_pair_cut_round.py` (reporter-only failure)

## Run status

No solver was run or rerun.  The existing result artifact records the finite
structural arm as SAT (`structural_result=sat`, 0.106 s), with 96 inherited
cuts and 36 extra all-named-row cuts (`freshthird_all_selected_row_pair_cut_round.results.txt:4-11`).
The artifact's later metric diagnostic is `unknown` after its 120.123 s budget,
with no core (`:20-30`); this is not a mathematical premise or a closure claim.
The reporter failure therefore yielded no new source fact, order case, equality,
or metric consumer.  The run's own status remains diagnostic and says source
premise coverage is still required (`:31-32`).

## Global theorem search

The required agentic searches were attempted:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean --agentic
nthdegree docs search --lean --agentic
```

Both failed before returning results because the agentic backend reported its
GPT-5.3-Codex-Spark usage limit (retry to gpt-5.6-luna also returned no rows).
The mandated fallback plain searches over the current corpus and all indexed
Lean corpora returned the same direct declaration:

* `Problem97.selectedFourClass_shared_pair_separated`
  (`lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean:29-55`).

No sibling corpus returned a competing FreshThird producer.  The all-corpus
search also surfaced fixed-cardinality P4/`Fin 11` cyclic-alternation modules;
they are source/certificate adapters, not a broader all-n named-row premise.

## Exact cut coverage

`add_all_named_row_pair_cuts` enumerates six unordered pairs among
`sourceCenter`, `freshCenter`, `pinnedCenter`, and `drowCenter`, and six pairs
from each four-point first support, hence exactly 36 clauses
(`freshthird_all_selected_row_pair_cut_round.py:20-53`).  Each clause has the
form

```text
centers distinct ∧ both points alias into the second support
  ⇒ between(center₁, center₂, p₁) ≠ between(center₁, center₂, p₂).
```

This is precisely the instance schema of
`selectedFourClass_shared_pair_separated`: arbitrary finite carrier, injective
CCW boundary/index, point realization, distinct centers/points, and four row
membership hypotheses.  Its conclusion is the required `btw p₁ ↔ ¬btw p₂`
(`Phase3SharedPairSeparation.lean:31-55`), and the file explicitly states
cardinality independence (`:18-20`).  Thus all 36 extra clauses are already
covered by one generic theorem, with no new theorem-bank consumer needed.

Coverage is conditional: the Python aliases are not themselves a Lean
`rowAt`/boundary-index producer.  Existing FreshThird adapters apply the same
theorem to selected source/fresh rows, but the live packet still lacks a
universal source-level membership/order lift for every named row.

## Registry audit

Inspected the required registries:

* `docs/general-n-certificate-bank-mining-2026-07-09.md` (cyclic-separation
  surface is a generic consumer/checker specification, not a concrete row
  certificate; lines 775-795);
* `certificates/p97_rvol_general_n_mining.{md,json}`;
* `certificates/erdos97_legacy_general_n_mining.{md,json}`;
* `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The registry summaries report no exact-name/statement-shape duplicate for the
relevant local theorem (legacy/general-theorem ledgers: zero matches), and no
FreshThird-specific source producer.  They therefore confirm reuse of the
existing generic separation theorem, not discovery of a new premise.

## Conclusion

The failed reporter-only run contributes **no new mathematical premise**.
All-named-row shared-pair cuts are a 36-instance reuse of
`selectedFourClass_shared_pair_separated`; only the missing source-level
membership/order adapter remains.  Keep the run diagnostic and do not promote
its SAT/`unknown` artifacts to Lean closure.
