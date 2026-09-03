# P97 D–R two-radius card-14 profile probe v1

Status: diagnostic only; not promotion eligible.

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

At carrier cardinality 14, the three closed cap sizes sum to 17. The branch
binders give the lower bounds `surplus ≥ 5`, `opp1 ≥ 4`, and `opp2 ≥ 6`.
Splitting on `ExactFourRobustCapGrowth` leaves exactly these strict-interior
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
