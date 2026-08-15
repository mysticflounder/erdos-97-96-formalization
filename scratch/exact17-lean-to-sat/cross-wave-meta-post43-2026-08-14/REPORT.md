# Exact-17 post-Child43 cross-wave theorem analysis

Date: 2026-08-14

Status: **EMPIRICALLY VERIFIED / theorem-discovery evidence only**.

This audit is read-only.  It did not call Lean, PIQD, a SAT solver, or a
network service.  It compares only authenticated, retained exact-17 artifacts.

## Inputs and scope

- Child39--43:
  `scratch/exact17-lean-to-sat/cross-wave-meta-2026-08-13/cross-wave-meta.json`;
- Child44: promotion-only, so it contributes no independent SAT assignment;
- Child45: the authenticated thirteen-cell ledger, containing eleven exact
  certificates and nine deduplicated supports; and
- Child46:
  `scratch/exact17-child46-production-8205802e/source-semantic-replay.json`,
  whose source-model digest is
  `95fe79edcde4d26de2c388fd314d3834d4884081ebb6d00ef9c355ba0e305896`.

The current source/import revision at the audit boundary is
`980b416a660ed44671b55ed36f47d4bc1af0ca89`.  Child37 lacks raw support
records and Child38 retains only hit indices, so neither can participate in
the normalized support comparison.

## Cross-wave result

The authenticated Child39--43 table contains 358 source-valid records.  Of
these, 110 are six-hit, three-row cycles, split by the two strict-Kalmanson
form pair as follows:

- adjacent/inner-outer: 62;
- inner-outer/inner-outer: 41; and
- adjacent/adjacent: 7.

Child45 contains one additional six-hit cycle, of adjacent/inner-outer type.
Child46 contains 69 distinct producer supports, including 25 minimal six-hit
cycles: nine inner-outer/inner-outer, eight adjacent/inner-outer, and eight
adjacent/adjacent.

Across Child39--43, Child45, and Child46 there are 433 normalized supports.
No exact normalized support recurs in a different wave, and there is no
cross-wave proper-subset relation.  Every Child39--43 support is already in
the active inherited Lean dependency closure.  Thus the recurring fact is a
mathematical *family shape*, not a concrete support orbit that another ground
bank would efficiently subsume.

## Source-level theorem candidate and consumer

Candidate: the three cardinality-independent contradictions for a six-point,
six-incidence selected-row cycle in each strict-Kalmanson cyclic order type.
The direct hypotheses are three selected classes, two support incidences in
each class, and six distinct points in the stated cyclic order.  Two strict
Kalmanson inequalities and the three radius equalities prove each
contradiction.

Immediate consumer: a complete exact-17 cyclic-placement clause family over
both `NamedOrder` values, both orientations, all seventeen cuts, and every
five-positive-offset choice.  The family is appended to Child46 through a
`SourceRealization` evaluator and terminal conditional-UNSAT adapter.

First missing antecedent / scope boundary: a six-hit producer certificate
need not be a direct six-point contradiction.  Five of Child46's 25 minimal
cycles reuse one point as both a center and an endpoint, and some disjoint
supports use auxiliary Kalmanson vertices outside the six hit endpoints.
Those records are not consequences of the direct six-distinct-point theorem.
They require their checked ground certificate or a separate parametric
producer.  The new theorem bank therefore claims only its three proved order
types; it is not advertised as an exhaustive abstraction of all 25 Child46
supports.

## Strategic conclusion

The post-Child43 evidence rejects another serial concrete-support bank as the
default strategy.  The direct three-row cycle theorem is a genuine uniform
producer with a `SourceRealization` consumer, and it cuts the authenticated
Child46 model, but it does not close exact 17 by itself.  Any successor remains
subject to the ordinary one-job custody, independent replay, and wave-only
theorem-mining gates.
