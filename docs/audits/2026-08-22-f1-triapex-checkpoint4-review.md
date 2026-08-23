# F1/TriApex checkpoint 4 review

**Date:** 2026-08-22
**Scope:** the 15 F1-lane files plus the independent checkpoint-4 review in
`/tmp/Erdos-97-Proof-complete-2026-08-22.tar`, reconciled with the live
repository.  This is a status and supersession audit, not a closure claim.

## Executive status

The current F1 authority is checkpoint 4, read together with the authoritative
pointer, three-cycle continuation v4, and D1 working checkpoint v23.  The
correct frontier is:

- **D1 / provenance-rich joint deletion:** mathematically open;
- **D2 / two-radius grid:** prose-closed by a trig-free polynomial
  contradiction, but not yet formalized as a live Lean theorem;
- **D3--D7 and D9:** bypass candidates through the reverse-hit-to-D1 escape;
- **D8:** its coordinator is source-clean and its equal-secondary-blocker
  branch is closed by canonical-support equality plus the two-circle
  intersection bound; the distinct-secondary-blocker branch constructs a
  source-faithful three-edge cycle and reaches an open consumer.

The live `TriApexEndpointRetainedOmission.lean` file still contains exactly
nine bare `sorry` occurrences.  Thus “D8 source-clean” does not mean F1 is
closed: the D8 coordinator delegates its distinct branch to the open
three-cycle theorem, and the other eight current declarations remain open.

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

The reverse-hit observation is the preferred bypass producer.  If the two
retained shells each meet the retained first-apex radius in at most two points
and share the retained source, their union covers at most three points of a
class of size at least four.  A point outside their union preserves both exact
rows and the robust first apex, yielding the D1 joint-deletion packet.  This
should bypass D3--D9 before constructing a fresh endpoint.  The proposed
adapter name is `nonempty_pairedApexClassJointDeletion_of_reverseHit`; it is
not currently present in the live source.

## D2 prose-only result

D2 is the two-radius-grid kernel
`false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`.  The
checkpoint’s polynomial core is trig-free and reduces to ring identities,
positivity, and `nlinarith`:

```lean
theorem polynomial_nested_escape_core
    {x y X Y u v : ℝ} ... : x * v + y * u < 0
```

This is a mathematically closed route in the archive, not a current Lean
declaration.  The live source still has the D2 `sorry`; implementation needs
the three coordinate adapters and then a direct build/axiom audit.

## D8 source truth

The current source-clean coordinator is
`false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`.
Its equal-blocker branch proves support equality and derives three distinct
points in one non-apex shell, contradicting the two-point retained-radius
intersection bound.  Its distinct-blocker branch constructs
`EndpointDistinctBlockerThreeStepDeletionCycle` and calls the open theorem
`false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core`.

Therefore the accurate classification is:

```text
D8 producer/coordinator: source-clean
D8 equal-secondary-blocker child: prose/source branch closer
D8 distinct-secondary-blocker consumer: open
```

It remains independently bypassable through D1; no D8 branch should be
promoted to whole-F1 closure.

## Current nine-sorry source roster

The nine live open declarations are:

1. `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`
2. `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`
3. `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core`
4. `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`
5. `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core`
6. `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core`
7. `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core`
8. `false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core`
9. `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core`

The source file also contains checked dispatchers and producers around these
leaves.  The repository README’s global 36-leaf count is an older built-spine
measurement; it must not be read as evidence that these nine current leaves
have closed.

## Stale anchors and trust boundary

- Use fully qualified declaration names, not archive line numbers.  The
  checkpoint snapshots and old source-audited ledger have drifted.
- `docs/live-blueprint.md` is a generated stale snapshot: it still displays
  the old D8 coordinator as a `sorry`, while the live source has a source-clean
  coordinator and an open distinct-cycle consumer.
- The old nine-leaf roster in pre-v4 F1 ledgers is superseded by the exact v4
  roster above.
- The proposed reverse-hit adapter and D2 polynomial declaration are prose
  targets, not live declarations.

Prose closure, source audits, finite polynomial reasoning, static inventories,
and generated blueprint entries do not remove `sorryAx`. F1 reclassification
requires live Lean elaboration, a clean relevant build, direct reachability
verification, and publication-target `#print axioms`. The last built README
measurement still reports `sorryAx` on the published claims.

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
