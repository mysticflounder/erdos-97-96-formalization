# FreshThird schema-8 shared-late-pair hypothesis probe

## Scope and construction

This round starts from the schema-7 `n = 17`, `live-equal-common-dual`
packet and runs the two endpoint maps (`q1-outside`, `q2-outside`), four
source-proved order arms, and both order-selected surviving-row alternatives
(`canonical-survives`, `other-survives`): 16 cases total.  The implementation
is `freshthird_schema8_shared_late_pair_probe.py`; the serial runner is
`run_schema8_round.py`.

Schema 8 adds a *hypothesis probe*, not a source constraint.  For each
order-selected surviving row `A`, it dynamically chooses:

* one radius anchor for `A` (with the selected deletion avoided);
* a second named selected row `B` from the live `q1`, `q2`, `C1`, and `C2`
  rows, using each row's actual blocker center; and
* two later boundary points `ic`, `id` together with a fresh permutation of
  all carrier boundary positions, requiring `ia < ib < ic < id` and both late
  points in `A.support ∩ B.support`.

No concrete support label from schema 7 is fixed.  The dynamic clause was
intended to be negated in every run, but the implementation leaves its
selector variables free for Z3 to choose.  Consequently the actual formula
is `∃ selectors, ¬shared`, not `¬∃ selectors, shared`.  This quantifier bug,
and the arbitrary boundary permutation (which is not source-entitled), make
the historical round invalid as a countermodel test.

## Results

| cases | SAT | UNSAT | UNKNOWN | timeout per case |
|---:|---:|---:|---:|---:|
| 16 | 16 | 0 | 0 | 30,000 ms |

All 16 artifacts are under `artifacts-schema-v8/` and are tagged
`schema_version = 8`.  Every historical result is SAT, but the round is
**INVALID / NOT INTERPRETABLE AS COUNTERMODELS**.  Each SAT assignment only
chooses one selector assignment for which `shared` is false; it does not rule
out another assignment witnessing `shared`.  Witness choices therefore have
no theorem-level or countermodel interpretation.

## Validity correction (2026-08-06)

`shared_late_pair_terms` introduces existential selector variables for the
anchor, named B row, later points, and boundary positions.  `build` then adds
`Not(shared)` without quantifying those variables.  Z3's satisfiability query
is therefore `∃ selectors, ¬shared`; the intended negation of a producer of
the form `∃ selectors, shared` is `¬∃ selectors, shared` (or an equivalent
universal encoding).  The historical SAT artifacts cannot establish that the
producer fails, and they receive no closure credit.

Independently, the fresh boundary permutation is an arbitrary modeling
relaxation.  The source supplies a concrete convex boundary indexing/order
packet, not an arbitrary permutation, so this schema has no source-level
ingress or universal lift even after correcting the quantifiers.  The probe
script refuses production `--run`, and the historical serial wrapper is
disabled as well; the builder remains only to reproduce and audit this bug.
No new CEGAR round is authorized from these artifacts.

## Trust limits and next use

The fresh boundary permutation is an existential diagnostic relaxation.  The
schema does not encode a source theorem transporting that permutation, does
not establish Euclidean realizability, and has no arbitrary-cardinality lift.
The selected Q/C row menu is the named-row interface currently represented by
the encoder; it is not a proof that every source-level second row must be in
that menu.  Thus these historical SAT results close no Lean obligation and do
not refute the desired universal shared-late-pair producer.  They cannot even
establish that the producer is absent from the bounded abstraction because of
the quantifier bug.  A source-level producer or a strictly stronger, justified
CEGAR clause is still required.

The next required step is the mandatory post-round global theorem-bank audit,
followed by a source-entitled producer or a strictly stronger, justified
CEGAR clause.  This round must not be classified as production closure.
