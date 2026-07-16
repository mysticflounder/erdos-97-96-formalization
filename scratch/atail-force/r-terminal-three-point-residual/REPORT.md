# Terminal three-point residual audit

## Result

The residual is not eliminated by the currently imported one-hit, cap-order,
or MEC interfaces. It does refine to an exact normal form:

- the terminal first-apex selected class has cardinality exactly `4`;
- its surplus-cap intersection has cardinality exactly `1`;
- its three off-surplus points are exactly `deleted`, the unique source-row
  marginal hit, and the unique second-apex-row marginal hit;
- the two row marginal hits are distinct; and
- the three off-surplus points split between strict `oppCap1` and `oppCap2`
  as either `(3, 0)` or `(2, 1)`.

`TerminalThreePointResidual.lean` kernel-checks this normal form and proves
that any common terminal-marginal point of the two retained rows gives
`False`.

## Theorem-bank preflight

Checked before deriving the normal form:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- targeted `nthdegree docs search --lean` queries for the three-point cover,
  opposite-apex cap membership, selected-four-class cap bounds, and critical
  row intersections.

The reusable inputs are the existing first-apex surplus/other-cap one-hit
theorems, the exact-radius cap cover, and the retained row-cardinality fields.
No banked theorem supplies a lower cross-incidence between the two retained
rows.

## Exact field map

From `TerminalThreePointTwoRowCoverResidual A`:

- `marginal_card_eq_three` gives the three off-surplus terminal points;
- `outside_rows_eq_deleted` identifies the sole point outside both rows;
- `sourceRow_hits_one` identifies one source-row marginal point; and
- `secondApexRow_hits_one` identifies one second-apex-row marginal point.

From the terminal/history packet:

- `T.terminal` gives terminal first-apex class cardinality `4 ∨ 5`;
- `T.carrier_subset` lifts terminal points to the ambient carrier; and
- `R.deleted` and the retained row supports identify the named decomposition.

From the production geometry banks:

- `oppApex1_surplusCap_one_hit` forces the terminal class from `4 ∨ 5` down
  to exactly `4`, with exactly one surplus hit;
- `oppApex1_otherCap_one_hit` gives at most one `oppCap2` hit; and
- `oppApex1_exactRadiusClass_cover` puts every off-surplus hit in either
  `oppCap2` or strict `oppCap1`.

## Smallest missing antecedent

It is enough to produce one point in the terminal off-surplus marginal that
lies in both retained row supports:

```lean
∃ z,
  z ∈ SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap ∧
  z ∈ R.sourceRow.support ∧
  z ∈ R.secondApexRow.support
```

The file proves `false_of_common_terminalMarginal_rowPoint` from exactly this
antecedent. Equivalently, either unique row hit being forced into the other
row closes the residual.

## Countermodel boundary

At the incidence/cardinality level alone, the extracted fields are
consistent:

- off-surplus marginal `{deleted, u, v}`;
- source-row marginal `{u}`;
- second-apex-row marginal `{v}`;
- outside both rows `{deleted}`;
- strict `oppCap1` points `{deleted, u}`;
- unique `oppCap2` point `{v}`; and
- one additional surplus point completing the terminal four-class.

This is only an abstract incidence model, not a Euclidean counterexample.
It shows why cardinality and cap membership alone cannot derive `False`: a
new metric/order theorem must force `u = v` or another cross-row incidence.
