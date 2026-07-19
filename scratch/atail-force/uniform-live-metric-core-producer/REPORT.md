# Uniform live metric-core producer: exact boundary

Date: 2026-07-17

## Verdict

This lane has **not** closed a source `sorry`.  It has proved the uniform
consumer adapter once an ordered five-role front occurs, and it has ruled out
the proposed pure finite-schema occurrence proof.  The remaining producer
must use geometric information absent from the Boolean whole-carrier outer
model.

In particular, the card-12 and card-13 SAT results below refute only uniform
coverage by the current 218 finite schemas.  They are not Euclidean
realizations and do not refute a theorem from an actual
`WholeCarrierBiApexKalmansonSurface` to `ShellMetricCoreAlternative`.

## Checked Lean adapter

[`UniformProducerBoundary.lean`](UniformProducerBoundary.lean) defines
`OrderedFrontSchemaEmbedding` and proves

```lean
shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding
    (hA : ConvexIndep A)
    (rows : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A)
    ...
    (schema : OrderedFrontSchemaEmbedding (rowPattern rows) boundary) :
    ShellMetricCoreAlternative rows H
```

The proof builds the existing `FivePointCircleIsoscelesOrderCore`, derives
both required signed-area inequalities and the crossing witness from the CCW
boundary, and selects the final `ShellMetricCoreAlternative` disjunct.  A
focused scratch elaboration exited successfully.  Its `#print axioms` result
was exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, or custom axiom in this adapter.  What remains
missing is the antecedent: an arbitrary live carrier need not contain one of
the 218 currently banked schemas at the structural abstraction level.

## Exact finite boundary

The independently audited checkpoint in
`../uniform-cycle-coverage-audit/front-before-isosceles-cegar/ROW0_CUBE_REPORT.md`
establishes:

| carrier cardinality | result against all 218 schemas | scope |
|---:|---|---|
| 11 | all 210 exhaustive row-zero cubes UNSAT; every retained compact DRAT rechecked | exact Boolean outer coverage |
| 12 | SAT; CNF substitution and independent semantic replay checked | structural outer carrier only |
| 13 | SAT; CNF substitution and independent semantic replay checked | structural outer carrier only |

The card-12 carrier satisfies 382,628 clauses and avoids all 352,572
transported schema embeddings.  The card-13 carrier satisfies 721,416 clauses
and avoids all 670,670 embeddings.  Therefore

```text
UNIFORM_218_SCHEMA_OUTER_COVERAGE_REFUTED
```

Card-11 coverage is useful only after an independent live `card = 11`
reduction.  It cannot serve as the arbitrary-card producer.  More pure-schema
mining or repeated card-11 cubing is not load-bearing.

## Authoritative geometric boundary

The completion matrix in `/opt/nfs/verified-results.md` remains explicit:

- O17, elimination of cross-target sink SCCs of every size at least five, is
  unproved;
- O18, the resulting global removable-point/shared-radius/direct
  contradiction, is unproved and depends on O17; and
- O19, the full nonexistence claim, is unproved and depends on O18.

The bounded progress does not change that status.  Lemma 200 (PG152 in the
discovery ledger) proves that each occupied three-center class in either
residual six-center `000111` record has at most one B-row.  Hence each record
has at least four A-rows and exactly sixteen remaining A/B words.  This is a
type reduction, not an elimination; the two records and arbitrary mixed/dense
sinks still remain.

Propositions 189 and 190 are the decisive scope guard.  For every `m >= 8`
they construct unbounded abstract systems satisfying the current critical
cover, pair-capacity, critical-cycle, and even universal arbitrary-selection
strong-connectivity conditions.  They do **not** claim Euclidean realization.
Consequently those combinatorial consequences alone cannot prove O17 or the
live metric-core alternative; a successful producer must visibly consume
additional Euclidean, cap/MEC, full-radius, or common-critical-map data.

As a smaller negative gate,
[`audit_five_sink_curvature.py`](audit_five_sink_curvature.py) finds exact
rational LRA models for all fourteen canonical five-sink patterns under only
the consequences of Lemmas 30 and 37, and independently substitutes every
model back into the inequalities.  Thus those two curvature lemmas alone are
not the missing uniform consumer.  This does not contradict the stronger
geometry that already closes the complete five-center case.

## Next geometric regression ladder

Freeze the independently checked card-12 carrier as the regression instance.
Add live fields in the following order, without weakening or silently
re-encoding an earlier stage:

1. **Planar shell realization.** Seek distinct points in the carrier's fixed
   cyclic order and positive row radii realizing every selected four-target
   equidistance, together with strict convexity.  An exact UNSAT core here
   should become a cardinality-independent Euclidean row/order lemma whose
   conclusion is an existing `ShellMetricCoreAlternative` disjunct or
   `False`.
2. **MEC and cap placement.** If stage 1 is realizable, add the nonobtuse
   minimum-enclosing support triangle, the actual three cap chains, surplus
   placement, and the two physical apices.  A failure must be extracted as a
   cap/order theorem with an immediate parent consumer.
3. **Full critical-shell provenance.** If stage 2 survives, require all exact
   radius filters and blocker rows to come from one concrete
   `CriticalShellSystem`, rather than unrelated selected quartets or abstract
   blocker labels.  Preserve source-indexed support transport and the
   unenumerated rows.
4. **Bi-apex deletion coupling.** Finally impose the actual common-deletion
   parent and survival after deletion at both physical apices.  Any failure
   should be promoted directly to the robust frontier branch closer, ideally
   a specialized parent `False`, rather than another existential packet.

At each stage the acceptance gate is binary: either retain an independently
checked realization and advance it to the next stage, or extract the first
failed live field as a theorem with its immediate Lean consumer.  The desired
endpoint is an arbitrary-card geometric producer

```lean
WholeCarrierBiApexKalmansonSurface R
  -> ShellMetricCoreAlternative W.rows H
```

or, more directly, `False` for the live robust bi-apex parent.  Proving that
endpoint would close an actual parent `sorry` and make the downstream
K-A/LIVE-Q/C compatibility tree removable.  None of the bounded finite or
conditional results in this report alone does so.
