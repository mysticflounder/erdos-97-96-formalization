# Exact-12 five-omission structural CEGAR: seeded +250 wave

Date: 2026-08-09

Status: **finite authenticated evidence only; no terminal UNSAT and no Lean
frontier closure**.

## Scope

- run schema: `p97_rigid221_exact12_five_omission_structural_cegar_run.v2`
- finite schema: `p97_rigid221_exact12_source_safe_five_omission.v1`
- formula contract SHA-256:
  `475162d945dc3db607a62bfd3f040763d434ed61e72e6a4de67d2638daaac4a4`
- detector contract SHA-256:
  `a0f1be0e49b9dd95accc7ae464ca6cd7b09fa8941cbc4df63f349b5d42d1cc04`
- tool contract SHA-256:
  `8eff13d62929ba693dc7cc136fb535baceefef53d5f5d1c6e3cfa48bd2479131`
- 42,680 variables and 405,267 clauses at each fixed-deleted-label root
- twelve disjoint deleted-label shards, labels `0` through `11`

Each shard resumed the authenticated 25-record seed and ran 250 further
refinements, for 275 records per shard and 3,300 records in total.  Every
summary replays its journal and rechecks formula, detector, and tool source
manifests.

## Result

All twelve shards ended at `ITERATION_LIMIT`.  No shard reported a terminal
verdict, a verified terminal proof, or a surviving unclassified assignment.
The learned-stage totals are:

| detector stage | records |
| --- | ---: |
| `equality-duplicate-center` | 3,286 |
| `equality-equilateral-bisector-collision` | 14 |

The mixed detector history matters for promotion: the resulting journals
cannot soundly be consumed by the older duplicate-center-only terminal-bank
type.  The Lean endpoint therefore needs a heterogeneous typed bank in which
every learned clause carries its own uniform source proof.

## Promotion boundary

This wave does not prove finite coverage.  Promotion still requires both:

1. a terminal, independently checked UNSAT certificate for every relevant
   deleted-label shard (or an authenticated aggregate proof); and
2. a Lean translation of every journal record into the heterogeneous typed
   bank, including a row-uniform proof for each equilateral-bisector cut.

The source assignment, exact 405,266-clause common CNF mirror, shard unit, and
heterogeneous conditional terminal-bank consumer now pass targeted Lean
elaboration.  Their transitive axiom audit contains no `sorryAx`; the
executable formula checks use the governed `native_decide` boundary
(`Lean.ofReduceBool` and `Lean.trustCompiler`).  These theorems prove the
source-to-CNF direction and the conditional terminal-consumption direction
only.  They do not turn this `ITERATION_LIMIT` wave into closure.

## Mandatory post-wave theorem-bank audit

A fresh scoped search of the indexed project Lean corpus found no qualifying
general-`n` theorem that closes `FrozenFiveOmissionBoundary`, derives
`MetricCoreAlternative` from that boundary, or subsumes these learned records
beyond the existing generic consumers.  The reusable endpoints remain:

- `nonempty_duplicateCenterCore_of_positiveCheck` and
  `not_realizes_of_positiveDuplicateCenterBank` for duplicate-center cuts;
- `not_realizes_of_equilateralBisectorCollisionCore` for the fourteen
  five-label collision cuts; and
- `positiveRowsMatch_of_selectedByCoverIndex` as the exact-12 falsified-clause
  bridge.

The row-uniform `ofEquilateralBisectorCollisionCore` packaging adapter is a
consumer, not a producer: its `coreOf` argument still has to be proved for
every row satisfying the learned clause's positive choices.  The theorem-bank
audit therefore did not remove either remaining promotion obligation.
