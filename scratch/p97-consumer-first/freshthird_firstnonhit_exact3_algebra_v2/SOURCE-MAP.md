# Source and encoding map

## Fixed source packet

`input.json` reproduces all 13 `selected_supports` arrays from the v1 metric
canary. The runner checks both the exact SHA-256 of the v1 source input and
structural equality of the support table before generating any polynomial.
The blocker and P/Pρ labels remain provenance only.

## Encoded

- 34 coordinate indeterminates `x0,y0,...,x16,y16` over ℚ.
- Gauge equations `x0=0`, `y0=0`, `x1-1=0`, `y1=0`.
- For each of 13 selected rows, three equations equating the squared distance
  of supports 2–4 to the squared distance of support 1 from the named center.
- Exactly 39 expanded quadratic row equations and 43 equations total.
- The same polynomial body is replayed under two msolve variable declaration
  orders and independently in Singular characteristic zero with `dp` and
  `std`.

Every msolve polynomial is expanded and contains no parentheses. The gauge is
licensed by the source packet's labeled-point distinctness, even though the
distinctness inequalities themselves are omitted from the algebraic ideal.

## Omitted

- The positive separation variable and all 136 pairwise-distance inequalities.
- All radius positivity, off-support, and other disequalities.
- Strict convexity, cyclic/boundary order, Kalmanson, cap membership and cap
  composition.
- Blocker-map semantics beyond the listed center/support equal-distance atoms.
- The LP/MP and LPρ/MPρ incidence meanings, including omission facts.
- Common-deletion survival, global minimality, anonymous rows, and carrier-wide
  K4 beyond the 13 selected rows.
- No-(m,4,4), Moser-set, exact full physical-class support, universal ingress,
  coverage of other signatures, overflow semantics, and a general-cardinality
  lift.

## Soundness direction

Omitting inequalities enlarges the candidate set. Thus `UNIT`/complex-empty for
this gauge equality superset soundly rules out a real distinct realization of
the fixed 13-row packet. `NONUNIT` only means that complex algebra did not
eliminate the equality packet; it is not evidence of real feasibility.
