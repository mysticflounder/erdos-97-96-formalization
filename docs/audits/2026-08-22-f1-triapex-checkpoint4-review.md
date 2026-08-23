# F1/TriApex checkpoint 4 review

**Date:** 2026-08-22; implementation update 2026-08-23
**Scope:** the 15 F1-lane files plus the independent checkpoint-4 review in
`/tmp/Erdos-97-Proof-complete-2026-08-22.tar`, reconciled with the live
repository. This is a status and supersession audit and records the subsequent
kernel-checked D2 closure; it does not claim closure of D1 or F1 as a whole.

## Executive status

The current F1 authority is checkpoint 4, read together with the authoritative
pointer, three-cycle continuation v4, and D1 working checkpoint v23.  The
correct frontier is:

- **D1 / provenance-rich joint deletion:** mathematically open;
- **D2 / two-radius grid:** formally closed by the trig-free polynomial route,
  with checked coordinate, convex-nesting, zero-cut synchronization, and
  boundary-sign adapters;
- **D3--D9:** source-clean compatibility wrappers through the checked
  reverse-hit-to-D1 escape; their endpoint-specific data remain available in
  the public APIs but no longer create independent proof obligations.

The live `TriApexEndpointRetainedOmission.lean` file now contains exactly one
bare `sorry` occurrence, D1. A focused `lake-build` and refreshed kernel
reference mine on 2026-08-23 reduced the publish-spine frontier from 29 to 28
reachable `sorry` leaves and the TriApex branch from D1+D2 to D1 alone. Both
published claims still reach `sorryAx`, so F1 is not yet closed.

## Independent checkpoint-4 review

The archive's `erdos-97-checkpoint4-review.md` independently checks the prose
normalization, the corrected D2 polynomial argument, the reverse-hit-to-D1
reduction, blocker facts B4/B8/B10/B11/I9, and the MEC cap-sum identities. Its
symbolic/CAS work and roughly two million satisfying numerical samples found
no violation of the tested formulas. It also supplies an abstract cyclic
block-incidence construction showing that incidence data alone cannot close
F1 and proposes an apex matching-cover exclusion as a research target.

That review is supporting mathematical evidence, not a Lean trust audit. It
does not establish live reachability, replay the native certificate banks,
check transitive axioms, or prove the proposed matching-cover theorem.

## Preferred D1 architecture

The older D1 plan selected an arbitrary four-row and proposed recursion through
a blocker fiber or a renewed packet.  Checkpoint v23 explicitly supersedes
that ingress.  Preserve the producer provenance and begin with the
provenance-rich packet:

1. three rich Moser apices where deletion of the D1 source survives;
2. two retained blockers where deletion also survives by source-exact packets;
3. the actual blocker of the D1 source, where deletion fails;
4. five pairwise distinct surviving centers, with the actual blocker distinct
   from all five;
5. exact four-row witnesses at the surviving centers; and
6. cap-coded traces for the three critical shells, including the `<=2` and
   `<=1` fixed-radius trace bounds and the rule that two strict-first-cap hits
   force a strict-first-cap shell center.

This is a six-center fail-vs-survive packet, not an anonymous four-center
deletion fan.  The retained and renewed producers must remain separate: the
retained branch has its U5 ingress, while the renewed branch has an exact
four-point retained-radius partition and a second-rich-radius escape.  A
rich first-apex class of size at least four supplies a mutually omitted pair,
but renewal is a fallback producer, not the primary contradiction.

The reverse-hit observation is now the checked bypass producer.  If the two
retained shells each meet the retained first-apex radius in at most two points
and share the retained source, their union covers at most three points of a
class of size at least four.  A point outside their union preserves both exact
rows and the robust first apex, yielding the D1 joint-deletion packet.  This
bypasses D3--D9 before constructing a fresh endpoint.  The live adapter is
`nonempty_pairedApexClassJointDeletion_of_reverseHit`; `#print axioms` reports
only `propext`, `Classical.choice`, and `Quot.sound` for it.  The generic
contradiction route
`false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core`
then calls D1 and therefore still reaches `sorryAx`.

## D2 formal closure

D2 is the two-radius-grid kernel
`false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`.  The
checkpoint’s polynomial core is trig-free and reduces to ring identities,
positivity, and `nlinarith`:

```lean
theorem polynomial_nested_escape_core
    {x y X Y u v : ℝ} ... : x * v + y * u < 0
```

The source now contains this theorem as a private, source-independent algebra
kernel.  Its proof expands the three audited polynomial identities and uses
only positivity and ordered-ring reasoning.  A focused build of
`TriApexEndpointRetainedOmission` passes with the theorem in place.

The public D2 declaration is now proved. The implementation separates five
interfaces:

1. `TwoRadiusGridCoordinateGeometry` supplies division-free scaled coordinates,
   reflection, norm, and signed-determinant transport;
2. `TwoRadiusGridConvexNesting` proves the positive representative nesting
   inequalities from convex independence;
3. `TwoRadiusGridEscapeSynchronization` uses order-convexity of the strict cap
   interior to eliminate crossed transverse choices before the actual inside
   representatives are assigned a common sign;
4. `TwoRadiusGridCapBoundarySigns` and `TwoRadiusGridZeroCutAssembly` extract
   the coherent direct/mirror escape signs from one zero-cut boundary; and
5. the point-level positive/negative wrappers feed those facts to
   `polynomial_nested_escape_core`.

The dependency order is essential: synchronization precedes positivity of the
actual inside representatives. Reversing those steps would assume the fact
being proved. A focused build completed successfully, and `#print axioms` for
the D2 declaration reports only `propext`, `Classical.choice`, and `Quot.sound`.

## D8 source truth and supersession

The current source-clean coordinator is
`false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`.
Its equal-blocker branch proves support equality and derives three distinct
points in one non-apex shell, contradicting the two-point retained-radius
intersection bound.  Its distinct-blocker branch constructs
`EndpointDistinctBlockerThreeStepDeletionCycle` and calls the open theorem
`false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core`.

Before the 2026-08-23 bypass, the accurate branch classification was:

```text
D8 producer/coordinator: source-clean
D8 equal-secondary-blocker child: prose/source branch closer
D8 distinct-secondary-blocker consumer: formerly open
```

The distinct-cycle consumer is now a source-clean wrapper through D1 and is
off the active reverse-hit spine.  Its geometric development remains useful
historical evidence, but it is no longer an independent closure obligation.

## Current one-root source roster

The sole live open declaration is:

1. `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`

The seven former D3--D9 declarations remain as source-clean compatibility
wrappers so downstream names and theorem signatures do not break.  A refreshed
kernel mine reports 28 reachable leaves globally and exactly the D1 entry
above for TriApex.

## Stale anchors and trust boundary

- Use fully qualified declaration names, not archive line numbers.  The
  checkpoint snapshots and old source-audited ledger have drifted.
- `docs/live-blueprint.md` is a generated shared-worktree artifact and was not
  overwritten by this lane.  The refreshed `proof-blueprint spine` command,
  not that file, is the authority for the 28/1 counts above.
- The old nine-leaf roster is a historical pre-refactor snapshot.  D3--D9 are
  now transparent wrappers; D1 is the current independent root.
- The reverse-hit adapter and D2 contradiction are live and kernel-clean.

Prose closure, source audits, finite polynomial reasoning, static inventories,
and generated blueprint entries do not remove `sorryAx`. F1 reclassification
requires live Lean elaboration, a clean relevant build, direct reachability
verification, and publication-target `#print axioms`.  Those checks were rerun
for this refactor and D2 closure: the relevant declarations are kernel-clean,
the global frontier is 28,
and `Problem97.erdos97_rhs` still reports `sorryAx`.

## Archive appendix: all 16 F1-relevant files

### Active authority (4)

- `erdos-97-descent-prose-proof-atomic-leaf-ledger-f1-triapex-checkpoint4-2026-08-22.md`
- `2026-08-22-f1-triapex-authoritative-checkpoint4.md`
- `2026-08-22-f1-triapex-three-cycle-continuation-v4.md`
- `2026-08-22-f1-d1-working-checkpoint-v23.md`

### Current supporting artifact (1)

- `2026-08-22-f1-triapex-task-ledger-v4.yaml`

### Current independent reference (1)

- `erdos-97-checkpoint4-review.md`

### Superseded/provenance archive (10)

- `2026-08-20-f1-triapex-closure-dossier.md`
- `2026-08-20-f1-triapex-closure-plan-and-expanded-prose.md`
- `2026-08-20-f1-triapex-closure-task-ledger-v2.yaml`
- `2026-08-20-f1-triapex-low-level-task-ledger.yaml`
- `2026-08-22-f1-triapex-task-ledger-v3.yaml`
- `2026-08-22-f1-triapex-three-cycle-continuation.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-f1-triapex-continuation-2026-08-22.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-f1-triapex-source-audited.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-triapex-closure-plan-2026-08-20.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-triapex-revised-2026-08-20.md`

Supersession is chronological and semantic: checkpoint 4 governs the overall
F1 status; continuation v4 governs the exact nine-declaration roster and D8
correction; D1 v23 governs the preferred ingress; v4 task ledger governs
implementation ordering; earlier files remain historical evidence only.
