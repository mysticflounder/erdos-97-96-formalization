# FreshThird cap-profile motifs

Date: 2026-08-04

Let `s = n - 15`, and let `m = c_d - 6` be the surplus of the fixed
designated cap.  The designated-cap condition is `2 <= m <= s`.  For each
fixed `m`, the other two cap surpluses split `s-m`, so there are exactly
`s-m+1` ordered profiles.

The resulting stratum weights are:

* profile multiplicity: `s-m+1`;
* ordered C-pair capacity: `m*(m-1)*(s-m+1)`;
* independent C/Q selector capacity:
  `(m*(m-1))^2*(s-m+1)`.

This exposes three distinct motifs:

1. **Persistent thin cap.**  `m=2` gives exactly the profiles
   `(6+a,8,n-11-a)` for `0 <= a <= n-17`; `(6,8,n-11)` is one extremal
   subfamily.  This stratum has the largest profile multiplicity and always
   has only two endpoint-fresh candidates.  It is the persistent thin-cap
   stratum; the arithmetic alone does not rank its proof difficulty.
2. **Capacity-dominant middle strata.**  The C-pair weight peaks near
   `m ≈ 2s/3`, while the raw independent C/Q weight peaks near `m ≈ 4s/5`.
   These are computationally large strata, but the weights are selector
   accounting, not proof difficulty or geometric realizability.
3. **Extreme cap.**  `m=s` has one profile with the largest possible cap and
   the largest single-profile pair capacity, but it does not dominate the
   aggregate because its multiplicity is one.

For `n=256` (`s=241`), the thin stratum has 240 profiles, while the aggregate
C-pair weight is maximized at `m=161` and the raw C/Q weight at `m=194`.
The profile census therefore suggests sampling both the persistent thin
stratum and the capacity-dominant middle strata; it does not justify replacing
the universal Lean proof with finite motif enumeration.

## Trust boundary

These are exact integer-composition identities and heuristic workload
indicators.  They do not assert a Euclidean realization, a CEGAR result, a
Lean theorem, or closure of the FreshThird residual.
