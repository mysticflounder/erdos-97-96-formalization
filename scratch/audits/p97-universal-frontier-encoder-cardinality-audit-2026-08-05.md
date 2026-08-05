# Universal frontier encoder cardinality audit — 2026-08-05

Scope: the current P97 frontier-package encoders only. This is a read-only
audit for ambient-cardinality truncations analogous to the former A-core
`MAXN = 24` defect. It does not establish full source-to-encoder soundness,
and does not promote any computational result.

| Package | Ambient-cardinality representation | Source/lift status | Finding and smallest repair |
|---|---|---|---|
| A-core | Exact buckets `0..24` plus one overflow bucket `GE25`; partition is overflow-safe. | The leaf has no upper bound, so universal promotion still needs the stated general-cardinality coverage theorem. | Repaired. `GE25` makes the abstraction an over-approximation for every nonnegative cap tuple. Do not use the bucket as exact 25, add exact equalities above 24, or add threshold tests above 25 without refinement. |
| C-core | Same `0..24` plus `GE25` scheme and overflow-safe partition. | Same universal-promotion requirement as A. | Repaired; same guard. |
| E-core | Same scheme for cap, named-row, and shell-intersection counts. Cross-variable comparisons reject only definitely false bucket pairs. | The spec explicitly requires a general-cardinality lift before a universal conclusion. | Repaired; same guard. Relations involving `GE25` must remain conservative. |
| D-E | Monotone lower-bound atoms `carrierCard_ge[1..16]`, not an exact finite domain. A carrier of size above 16 maps to all relevant atoms true. | Diagnostic/local abstraction; any result still needs a cardinality-free producer or lift. | No truncation. Optional regression: set every carrier lower-bound atom true and check satisfiability to guard against an accidental upper bound. |
| B | Fixed named witnesses only; no ambient cardinality variable or finite carrier enumeration. | Explicitly diagnostic named-local CNF, with no completeness claim. | No analogous issue. |
| D-R | Fixed four slots encode supplied exact-four witness supports, not the carrier. No ambient cardinality variable. | Diagnostic/local abstraction; no direct universal promotion path. | No analogous issue. |

## Evidence

`a_core/encoding.py`, `c_core/encoding.py`, and `e_core/encoding.py` define
`MAXN = 24`, `OVERFLOW = 25`, and one-hot exact-or-overflow integer variables.
Their partition arithmetic propagates overflow instead of forbidding sums above
24. Each has a current `G-OVERFLOW` smoke gate; the checked reports are all
passing and produce a satisfiable instance with the output cardinality in the
overflow bucket:

* A and C: `(nSig, nO1, nO2) = (24, 2, 3)`, hence `n = 32`;
* E: `(24, 4, 4)`, hence `n = 35`.

The A/C/E specifications also state the intended universal over-approximation
discipline. The current global closure plan separately requires a
general-cardinality coverage/lift theorem; this audit does not replace it.

## Promotion boundary

The historical exact-only `0..24` artifacts must not be cited as universal
UNSAT certificates. The current A, C, and E package outcomes are SAT (and the
old UNSAT items are smoke/probe checks), so no known Lean closure needs to be
withdrawn for this defect. This conclusion is limited to finite
ambient-cardinality domains: named-local incompleteness, missing source
ingress, and missing universal lifts remain independent blockers.
