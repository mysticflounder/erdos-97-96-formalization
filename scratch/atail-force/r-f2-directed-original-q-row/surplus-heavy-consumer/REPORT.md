# Surplus-heavy native-row consumer audit

## Result

The surplus-heavy arm does **not** expose an honest positive producer for
`outsidePair_unique_capCenter` on the actual equal-source-at-live-center
branch.

The checked normalization is stronger and has the opposite polarity:

1. the live center `p` belongs to both native rows;
2. in either heavy row, `p` and the opposite continuation center are two
   distinct support points in `oppCap2`;
3. the ordered-cap row bound is at most two, so those points saturate that
   row's `oppCap2` intersection;
4. the two surplus-heavy witnesses are therefore outside `oppCap2`;
5. the non-equilateral residual omits `oppApex2`, and the surplus/`oppCap1`
   intersection is only that endpoint, so both witnesses also avoid
   `oppCap1`;
6. the heavy pair is thus in the strict surplus interior and is equidistant
   from its native row center; but
7. `second_center_separates_outside_pair` proves that the live center `p`, a
   second distinct center in `oppCap2`, has unequal distances to the pair.

The smallest formerly plausible completion would have been the one scalar
field

```lean
dist p a = dist p b
```

for the heavy pair `a,b`.  The checked theorem proves its negation.  It would
therefore be incorrect to declare that equality as a missing producer packet.
The branch should be closed by the stronger equal-source ordered-cap terminal,
not by extending the surplus-heavy arm.

## Checked Lean artifact

[`SurplusHeavyConsumer.lean`](./SurplusHeavyConsumer.lean) defines
`LiveCenterSeparatedSurplusPair` and proves:

```lean
surplusHeavy_normalForm_of_equalSource_atLiveCenter
```

The conclusion is a disjunction selecting the heavy native row.  In either
orientation it returns two distinct strict-surplus members of that row,
equality at the native row center, and inequality at the live center.

This is a diagnostic normal form, not a production closure theorem.  It closes
no source `sorry` by itself.  The independently developed
`equal-source-metric-terminal` lane is the load-bearing direct closer and makes
this generated-successor surplus-heavy split non-load-bearing once that lane
is integrated.

## Bank and indexed-corpus preflight

Before deriving the adapter, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered surplus-heavy selected
rows, repeated outside pairs, strict cap interiors, non-equilateral
continuations, and U5 metric incompatibilities.  The closest usable current
consumer is `outsidePair_unique_capCenter`, through
`second_center_separates_outside_pair`.  No current or banked theorem consumes
a bare `SurplusHeavyNativeRow`.  The older C5D3B/U5 candidates require
additional minimality, cardinality, M44, or fixed-row surfaces not present in
this branch and were not imported as if they applied.

## Relation to the supplied global geometric analysis

The newly supplied prose analysis contains useful directions, but it is not a
completed proof and was not treated as one.

- Its cross-cap equal-pair injectivity is already represented by the current
  ordered-cap theorem `outsidePair_unique_capCenter`.
- Its one-sided cap distance injectivity is sufficient for the stronger direct
  equal-source terminal: `p,z₁,z₂` lie in one ordered cap and the metric
  residual makes them pairwise equidistant.
- The proposed strong-connectivity lemma for every selected witness digraph is
  a genuinely global minimality consequence.  The separate
  `global-minimality-connectivity-audit/` has now kernel-checked it as a
  corollary of `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`; all 101
  corrected structural survivors already have full one-seed closure, so it
  eliminates none at that abstraction.
- The cap-chain, cap-cardinality, cross-cap equal-pair injectivity, and
  incidence-capacity conclusions have production counterparts recorded by
  that audit.  The strict crossing-containment implication is checked only
  conditionally: its bridge from the current cap-order interface and an
  on-spine strict-inequality consumer are still missing.

Thus the new analysis supports the same route correction: use existing
ordered-cap geometry at the parent equal-source surface, rather than mine a
new local surplus-heavy packet.

## Validation

The unregistered scratch file was checked directly with Lean 4.27.0 from
`lean/`, with the current scratch olean search path, package root `..`, and the
required memory cap:

```text
lake env lean -M 16384 -R .. \
  -o /private/tmp/p97-r-f2-surplus-heavy-consumer-oleans/SurplusHeavyConsumer.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/\
surplus-heavy-consumer/SurplusHeavyConsumer.lean
```

The focused check exited successfully.  The printed axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or `unsafe`.  No full Lake build was run.
