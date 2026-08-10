# Results: FreshThird retained-core 128

`run_wave.py` completed one bounded serial full wave with status `PASS`.

- Product: 2 non-hit constructors × 4 interaction constructors × 16 raw
  retained endpoint choices = 128 slices.
- Full wave: 128/128 `sat` from Z3 and 128/128 `sat` from cvc5.
- Smoke controls: one known `sat`, malformed overfull-row `unsat`, and
  malformed selected-endpoint-present `unsat`, with agreement from both
  solvers.
- Independent artifact/readback validation: `PASS`.
- Every emitted SMT artifact contains exactly one `(check-sat)`.
- Common-endpoint omission is a derived conditional tag (12 tagged tuples per
  constructor pair), not a universal ingress constraint.

This is a finite QF_LIA structural consistency diagnostic. It is not a
Euclidean or metric result, counterexample, universal extraction/lift, Lean
closure, or proof of the open residual theorem.

## Mandatory post-wave theorem-bank audit

The 2026-08-10 post-wave search is recorded in nthdegree conversation message
`#4751`. It found no source-clean cardinality-independent theorem combining
the retained 4 x 4 deletion choices with the 2 x 4 non-hit/interaction
constructors into a common omission, Q-row incidence, blocker collision,
cap-order contradiction, or `False`.

The closest clean declarations require stronger inputs absent from this
packet: a universal source-faithful deletion fan, mutual cross-membership with
distinct blockers, or explicit cap-index and boundary-order deletion
obstructions. The direct first-non-hit, reflected, and common-radius surviving
row declarations were rejected because their transitive axiom sets include
`sorryAx`.

An independent audit of the common-radius ingress also found no applicable
consumer: that existential surface contains no relation to the current `C`,
`Q`, non-hit, or second interaction. Therefore this wave is terminal. No
successor solver wave is licensed until a new source-clean boundary/order
producer-consumer contract is stated.
