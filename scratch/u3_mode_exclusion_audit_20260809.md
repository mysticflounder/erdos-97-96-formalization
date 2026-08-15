# U3 mixed-row mode audit (2026-08-09)

Scope: `U3ToU5Terminal.lean`, `U5GlobalIncidenceSupport.lean`, and
`U3ToU5MixedExtraction.lean`; source-clean consequences only.

## qDeleted mode

For a row at `center`, `MixedConfinedRow.qDeleted` carries a set `B` with

* `B ⊆ (D.skeleton q).erase center`, hence every member is in `A` and is
  distinct from both `q` and `center`;
* `B.card = 4`, `q ∉ B`;
* a positive radius `rho` with `dist center y = rho` for every `y ∈ B`.

This is a selected four-subset, not an exact radius class.  There is no
source-clean conclusion that an ambient named point omitted from `B` is off
the row circle, and no conclusion that `rho = dist center q`.

Since every audited center is distinct from `p`, the existing circle lemma
gives `card (B ∩ ({q} ∪ T)) ≤ 2`, hence `card (B \\ ({q} ∪ T)) ≥ 2`.

## criticalFourShell mode

For `MixedConfinedRow.criticalFourShell`, `K.support` is the *whole* class
`A.filter (dist center z = K.radius)`, with positive radius and cardinality 4.
It contains `q`, excludes `center`, and is confined to the bounded support.
Therefore:

* `dist center q = K.radius`, and every support member has distance
  `dist center q` from `center`;
* every `z ∈ A \\ K.support` satisfies
  `dist center z ≠ K.radius`, equivalently
  `dist center z ≠ dist center q`;
* because the dangerous `p`-circle is `{q} ∪ T`, its support intersection
  has cardinality at most 2, so at least two of the four shell points are
  off that circle.  As `q` is already on it, a shell row contains at most one
  of `t1,t2,t3`.

The last two bullets are stronger than the current finite `MixedChoice`, which
records only card, center omission, mode, and q-membership.

## Cross-row consequences

Every row is a four-point subset of a circle centered at its row center, and
distinct row centers have support intersection at most two.  This is exactly
the two-circle intersection bound: three common points would force equal
circles/centers.  In particular, two critical-shell rows already share `q`,
so they can share at most one additional named point.  A qDeleted/critical
pair has no forced common point because q is omitted from the qDeleted row.

No pair or short cycle of mode tags alone is contradictory.  Equal-distance
transitivity only becomes a contradiction after supplying three common
noncollinear points (already excluded by the `≤ 2` overlap field), or a
specific extra incidence pattern.  This matches the 64/64 SAT mode census.

## Most useful missing positive incidence

The narrowest source-clean metric strengthening to expose is the exact-shell
omission relation, for every critical row and every named `z` known to lie in
`A`:

```lean
CriticalFourShell.dist_ne_radius_of_mem_A_not_mem_support
  K hzA hzNot : dist center z ≠ K.radius
```

together with `K.radius = dist center q`.  The extractor should retain this
only for critical rows; it is invalid for qDeleted selected subsets.

A particularly sharp derived incidence cut is: among dangerous centers
`t ∈ T`, at most two critical rows can contain `p` in their shell support.
Indeed such a row gives `dist t p = dist t q`, while `t ∈ T` gives
`dist p t = dist p q`; three such distinct `t` would be three common points
of the distinct `p`- and `q`-centered circles of radius `dist p q`.
This is not a mode-only exclusion (the mode vector does not record `p`), but
is the smallest concrete metric/incidence field likely to cut the finite
search.  A mode vector can be eliminated only after a producer forces enough
of these named incidences (or forces three common points); no such positive
incidence is currently present in the mixed source contract.

Conclusion: do not claim any of the 64 mode vectors is source-cleanly
impossible from the current constructors. Add critical-shell off-support
inequalities and, if computationally useful, the `p`-membership-at-most-two
lemma as the next ingress strengthening.
