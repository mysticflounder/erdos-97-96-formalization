# `RichApexCoverCount` / FreshThird adapter audit (2026-08-02)

## Verdict

`Problem97.richApexCountContradiction` is source-clean but cannot currently be
instantiated from the live normalized FreshThird packet.  The closest honest
route is a new finite-support/decomposition producer; there is no import-only
or field projection adapter.

## What the count kernel consumes

`lean/Erdos9796Proof/P97/ATail/RichApexCoverCount.lean:28-37` consumes twelve
`Nat` counts and eight bounds:

```text
x+y+p+q = 2       u+v+s = 2        w+z+t = 2
q+s ≤ 1+m         p+t ≤ 1+n
x+u+m ≤ 1         y+w+n ≤ 1        v+z ≤ 1.
```

The intended finite decomposition is explicit in the scratch producer
`scratch/retained-omission-e1/round5-core-mining/RichCoverTheorem.lean`:

```text
e0,e1,e2 : Finset (Fin 15), each card = 2
e0 disjoint CI0 ∪ {12}; e1 disjoint CI1 ∪ {13};
e2 disjoint CI2 ∪ {14}; and (12 ∉ e1,e2) for the non-cover branch.

x=e0∩CI1, y=e0∩CI2, p=e0∩{13}, q=e0∩{14}
u=e1∩CI0, v=e1∩CI2, s=e1∩{14}
w=e2∩CI0, z=e2∩CI1, t=e2∩{13}
m=e0∩e1∩{14}, n=e0∩e2∩{13}.
```

The five inequalities above are derived from three explicit pair-cut domains
(`K01`, `K02`, `K12`) with cardinality at most one; the equalities require
the disjoint four-block decompositions.  The generic cover lemma at
`RichApexCoverCount.lean:43-50` separately needs `K,T1,T2,T3`, a cover
`K ⊆ T1 ∪ T2 ∪ T3`, and three at-most-one intersections.

## Fields available in the live packet

`FreshThirdBlockerFiber` (`ATail/BlockerMultiplicityGeometry.lean:70-111`)
has two distinct carrier sources, equal blocker values, freshness from the
four named collision endpoints, and mutual shell membership.  It has no
`Nat` decomposition counts, no apex-indexed rich rows, no fixed four-point
interior blocks, no exact two-point extras, and no finite pair-cut domains.

`TwoCapSourceThirdCanonicalRowSurface` (`ATail/FrontierLiveClosure.lean:7941-7947`)
adds only `cap_card_ge_eight`, two distinct cap-interior source vertices, each
canonical shell's support-cardinality `= 4`, and deletion-view witnesses.
This is a pair of four-point blocker-centered rows, not the three six-point
apex-centered rich supports needed for `e0,e1,e2`.

The normalized residual (`FrontierLiveClosure.lean:9203-9215`) has exactly
`firstNonHit`, `secondNonHit`, and `equalCrossRowCenters`.  A non-hit carries
only same-blocker/support equality or one source-row omission plus deletion
survival (`:9151-9170`); the equal-center arm carries two cross-row hits and
an equality of the two cap-source centers.  None supplies the decomposition,
cover, or pair-cut hypotheses above.

Although the inherited tri-apex residual has
`ApexRichClassStructure` at all three Moser apices, that predicate is only a
radius existential (`≥6` on one class or `≥4` on two radii).  It does not give
exact six-point rows, designated four-point interiors, or the common `Fin 15`
labels.  `cap_card_ge_eight` is likewise only a lower bound for one cap.

## Concrete promotion route (new producer required)

Add a source-faithful finite adapter which, for a chosen common carrier
labeling, exports:

1. three rich supports `R0,R1,R2` with fixed four-point interiors and two-point
   extras `e0,e1,e2`, including the apex non-memberships used by the
   non-cover branch;
2. disjointness/partition equalities yielding `hx`, `hu`, `hw` and the
   singleton/shared-apex bounds (`m ≤ q,s`, `n ≤ p,t`, or directly the two
   relaxed inequalities `hm`,`hn`); and
3. the three metric pair-cut domains and their `≤1` bounds, yielding `h01`,
   `h02`, `h12`; then invoke `richApexCountContradiction`.

For the `K.card ≤ 3` branch, the same adapter must additionally export a
four-point target row `K` and its three covering domains `T1,T2,T3` with the
cover and at-most-one intersection bounds required by
`richApex_card_le_three_of_cover`.

Until this producer is proved and imported by the normalized-residual
terminal, wiring the arithmetic theorem would be an unsupported wrapper and
would not discharge the live `sorry` at
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`.
