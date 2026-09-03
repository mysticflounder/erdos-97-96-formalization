# P97 D–R two-radius card-14 profile probe v1

Status: diagnostic only; not promotion eligible.

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

At carrier cardinality 14, the three closed cap sizes sum to 17. The branch
binders give the lower bounds `surplus ≥ 5`, `opp1 ≥ 4`, and `opp2 ≥ 6`.
The cap sum and those lower bounds leave exactly these strict-interior
profiles, where each entry subtracts the two cap endpoints:

| profile | closed caps `(surplus, opp1, opp2)` | interiors `(IS, I1, I2)` |
|---|---:|---:|
| `secondOpposite` | `(5, 4, 8)` | `(3, 2, 6)` |
| `surplusS6O1Four` | `(6, 4, 7)` | `(4, 2, 5)` |
| `surplusS6O1Five` | `(6, 5, 6)` | `(4, 3, 4)` |
| `surplusS7` | `(7, 4, 6)` | `(5, 2, 4)` |
| `firstOppositeO1Five` | `(5, 5, 7)` | `(3, 3, 5)` |
| `firstOppositeO1Six` | `(5, 6, 6)` | `(3, 4, 4)` |

The CNF uses the generic row, first-apex-class, K4, blocker, and admitted
geometry families from the card-13 specification. It is an equality-pattern
probe only. SAT means those clauses do not close the profile. UNSAT remains
formula-scoped pending a source theorem for the profile split, semantic
ingress, solver-proof custody, and Lean replay.

This probe does not justify restriction from larger carriers to card 14.
Global minimality proves that a proper finite subset does not preserve K4.

## Result (2026-09-03)

All six core-family formulas are SAT. The authenticated job identifiers and
digests are recorded in
`scratch/runs/dr-card14-profile-probe-20260903/p4-card14-profiles/result_receipt.json`.
The fastest survivor, `firstOppositeO1Six`, also satisfies the maximal
12,837,786-clause formula obtained by adding every optional generic geometry
family: an independent replay checked every clause and found zero violations.
Thus the card-13 core families, and all currently encoded optional generic
cores, do not extrapolate to a card-14 contradiction.

The source arithmetic split is
`ExactFourteenTwoRadiusCapProfile` together with
`exactFourteen_capProfile_of_twoRadiusBranch` in
`TwoRadiusExactTwelveProfile.lean`. It does not turn any SAT result into a
geometric configuration and does not close the target.
