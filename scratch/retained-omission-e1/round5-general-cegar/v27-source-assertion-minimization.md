# v27 source-assertion minimization

## Terminal

`authenticated_unsat` was obtained externally with Z3 4.16.0.  No production
run was launched, no Lean source was edited, and no certificate entered the
Lean kernel.  The result is therefore discovery evidence, not a proved P97
terminal.

The authenticated input is the v19 raw formula
`bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`.
The full machine-readable result is
`v27-source-assertion-minimization.json` (SHA-256
`b3ec9c29f0f5062d6043f5f1d5171e2abd10599113fabab7e4dad634583856a0`).
The driver now refuses to overwrite an existing output.

## Minimized source groups

The deterministic deletion order was cyclic alternation, exact-rich profiles,
then strict Kalmanson.

| deletion | paired fresh raw parses | result |
|---|---|---|
| `track_cyclic_alternation_cut` | `UNSAT`, `UNSAT` | deleted |
| `track_exact_rich_profiles` | `SAT`, `SAT`, both models replayed | retained |
| `track_strict_kalmanson` | `SAT`, `SAT`, both models replayed | retained |

Thus the smallest subset under this deletion audit is exactly
`track_exact_rich_profiles ∧ track_strict_kalmanson`.  In particular, the
precompiled cyclic-alternation group is unnecessary for this blocker.

## Minimized fixed literals

The 55 v22 fixes reduce to the following inclusion-minimal pair:

```text
rich_2_1_4  = true
rich_2_1_12 = true
```

Their canonical hash is
`de0dc93b9bb1a095d601398a5adbcc5e32a1d177830af1174d604ee09bb0db8a`.
Deleting either literal gives `SAT`, and each model was replayed against all
active formulas.  The surviving pair was then replayed from two fresh raw
parses; both returned `UNSAT` with derived-formula hash
`44dc349e3d855050b0010afe145b890fb4792a7e37009c0d2f4d1f27b984ddd0`.

In the frozen `DDD` labeling, apex `14` is rich apex 2 and class 1 is its
second exact-four radius.  The literal pattern says that this one radius
contains both point `4` (in the middle cap interior) and point `12` (another
apex).

## Original-assertion core

The surviving source bodies contain 2,940 original conjuncts.  An unsat core
of 261 was deletion-minimized to 173 original conjuncts:

- 101 `exact_rich_profiles` conjuncts;
- 72 `strict_kalmanson` inequalities.

The selected clause-ID hash is
`e369cec296dfd5d96b28a074b8273c41bdc6a2e2622bd7f04c0ceac23efb830c`.
All 261 deletion trials terminated; every indispensable-clause deletion was
`SAT` with a successful model replay.  Two fresh raw parses reconstructed the
173 clauses by tracker and original conjunct ordinal and both returned
`UNSAT`.  Their common substituted formula hash is
`c790a67795e04bdb2622f76d101faf76d6d6d36ece805b41db1e563ce535d27d`.
The JSON records every ordinal, exact S-expression, expression hash, and point
support.

## Clean theorem shape

A suitable theorem-facing statement is the following stronger, stable source
shape rather than a 173-field transcription of the solver core.

Let `p : Fin 15 → ℝ²` occur in strict convex cyclic order

```text
13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11.
```

Put apices `a₀ = 12`, `a₁ = 13`, `a₂ = 14` and opposite interiors
`I₀ = {0,1,2,3}`, `I₁ = {4,5,6,7}`, `I₂ = {8,9,10,11}`.  Suppose each apex
has two distinct exact-four distance classes; each class meets its associated
interior in exactly two points, the two classes are disjoint, and together
they cover that interior.  If the second class at `a₂` contains both `p 4` and
`p 12`, then `False`.

A descriptive declaration name would be
`false_of_triApexDistinctExactFourProfiles_apex14_secondRadius_hits_point4_and_apex12`.
The strict-Kalmanson hypotheses should initially remain explicit, or be
produced separately from the strict convex cyclic order.  This keeps the first
Lean bridge honest: v27 established the finite ordered-distance relaxation,
not that Lean already has the required order-to-inequality producer.

## Mandatory theorem-bank audit

The registry overview and all six prescribed Markdown/JSON inventories were
checked.  The current-project Lean corpus was queried once after the concrete
literal shape was available.

No exact terminal matches this three-apex/two-shell statement.  The closest
live primitives are:

- `two_circle_noncollinear_common_point_elim` in
  `lean/Erdos9796Proof/P97/TwoCircleCrossing.lean:58`, which eliminates a third
  noncollinear common point of two distinct circles;
- `oppositeCapRichClassInteriorPattern_of_apexRichClassStructure` in
  `lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean:140`, which
  produces the binary per-apex rich-class pattern;
- `oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four` in
  `lean/Erdos9796Proof/P97/ATail/CapApexRadiusRigidity.lean:116`, which gives
  only the associated cap-cardinality consequence;
- the source-proved sibling theorem
  `eq_of_equidistant_three_noncollinear` recorded in
  `certificates/p97_rvol_general_n_mining.json`; and
- `three_common_equidistant_centers_eq`, recorded independently in both legacy
  JSON inventories.

The first missing bridge is not a name adapter: it is a producer of the
specific 15-point ordered-distance incompatibility (or a human reduction of
the 173-clause core to an existing two-circle or five-point geometry kernel).
The registry overview explicitly warns that its no-match conclusion is
syntactic rather than semantic (`docs/general-n-certificate-bank-mining-2026-07-09.md:474-478`),
so this audit does not claim semantic novelty.

## Verification

The production discovery used one `nice -n 15` solver process.  Four
non-solver unit tests cover conjunct identity/order and both replay
disagreement fail-closed paths:

```text
4 passed in 0.05s
```

Driver SHA-256 after adding the immutable-output guard:
`9806f266a5b3cae3998335f47074c34ca02878750f107ffccefed147afb30555`.
