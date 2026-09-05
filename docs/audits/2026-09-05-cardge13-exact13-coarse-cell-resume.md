# CardGeThirteen exact-13 coarse-cell continuation

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Scope

This lane continues the diagnostic PIQD refinement of coarse cell 0 without
altering either historical seed run. It treats the authenticated events from
the first two runs as immutable inputs and binds the current producer and Lean
coarse-signature bytes in a fresh run manifest.

The computation remains formula-scoped. It neither proves source coverage nor
promotes a solver verdict into Lean. A refinement-budget result is not a
survivor claim.

## Inputs

- orientation `direct`;
- uncovered raw label `z = 8`;
- `K ∩ I2 = {9,10}` and `L ∩ I2 = {8,11,12}`;
- all 1,250 authenticated cuts from the two preceding runs.

## Result

PIQD/Z3 completed 3,001 solves after adding 3,000 new authenticated
incidence-path cuts to the 1,250 seed cuts. Every returned SAT model replayed.
The terminal status is `REFINEMENT_BUDGET`, not a survivor claim and not an
unsatisfiability result.

The closed PIQD session is `645cc9c7-f061-4c0c-ba31-2ec6ebf8339d`.
The 50,778-command journal has SHA-256
`699c1ada6709b6dfbd3ffdbf56df9a0a4cf142d4d1c0aae3105432bbad9ebc56`.
The event's canonical self-hash is
`81810ad16af93e95d6f42288267fe942c1183aac4697aff7f35a8e72c46e62f0`,
and the event file has SHA-256
`ed1fa3dd88f0faf057297414f5ee8ba258398d689d51670c36da4a79bd132c04`.

This wave shows that sequential one/two-form learning continues to find valid
conflicts but is not yet an efficient terminal classifier. The next run must
not merely restart the same learner: it should use a complete or batched
two-form conflict bank, a stronger multi-form certificate search, or a
source-faithful support/center split justified by the recorded final model.
