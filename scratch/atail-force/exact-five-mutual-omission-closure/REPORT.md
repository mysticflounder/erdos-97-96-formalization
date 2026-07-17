# Exact-five mutual-omission closure audit

Date: 2026-07-17

Status: **THE MUTUAL-OMISSION ARM HAS A KERNEL-CHECKED GLOBAL NORMAL FORM,
BUT IT IS NOT YET FALSE.  THE FULL CRITICAL MAP COLLAPSES ALL SIMULTANEOUS
DOUBLE-BLOCKING TO ONE OFF-CAP CENTER WITH A SOURCE FIBER OF CARDINALITY AT
MOST TWO.  NO CURRENT BANK CONSUMES THE REMAINING CROSSED-SURVIVAL GRID.**

This lane owns only
`scratch/atail-force/exact-five-mutual-omission-closure/`.  It does not change
production Lean, closure documents, generated blueprint state, or another
scratch lane.

## Verdict

Let

```text
q := K.source E.index
w := K.source (K.successorIndex E.index)
p := S.oppApex2
bq := H.centerAt q
bw := H.centerAt w
```

for

```lean
E : PhysicalActualCriticalMutualOmissionEdge K.
```

The mutual edge unconditionally gives the crossed survival diagram

```text
delete q: K4 survives at bw and p; K4 fails at bq
delete w: K4 survives at bq and p; K4 fails at bw.
```

The two surviving rows at each deletion can be chosen canonically:

```text
delete q at bw: support = H.selectedAt(w).support
delete q at p:  support = physicalExactFiveClass.erase q

delete w at bq: support = H.selectedAt(q).support
delete w at p:  support = physicalExactFiveClass.erase w.
```

Using the total critical map and convexity gives a stronger global
classification.  At every source's actual blocker, at least one deletion
survives, except possibly at one blocker center.  If that exceptional center
exists, then:

- it is distinct from the physical apex;
- it is the only actual blocker where both deletions fail;
- every source assigned to it lies outside the physical cap; and
- its complete source fiber has cardinality at most two.

This is the strongest source-faithful consequence found in the current
production interface.  It visibly uses global K4 through the total critical
map, convexity through the perpendicular-bisector bound, and MEC/cap geometry
through the physical exact-five profile and two-center cap localization.

It is not a contradiction.  The unresolved residual is a two-origin
cross-survival grid with at most one two-source off-cap exceptional blocker
fiber.

## Kernel-checked theorem endpoint

`MutualOmissionCrissCross.lean` proves the consolidated endpoint

```lean
theorem nonempty_mutualOmissionGlobalNormalForm
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    Nonempty (MutualOmissionCrissCrossNormalForm E) ∧
      ((∀ source hsource,
          K4 (D.A.erase q) (H.centerAt source hsource) ∨
          K4 (D.A.erase w) (H.centerAt source hsource)) ∨
       ∃ source hsource,
          ¬ K4 (D.A.erase q) (H.centerAt source hsource) ∧
          ¬ K4 (D.A.erase w) (H.centerAt source hsource) ∧
          (∀ other hother,
             K4 (D.A.erase q) (H.centerAt other hother) ∨
             K4 (D.A.erase w) (H.centerAt other hother) ∨
             H.centerAt other hother = H.centerAt source hsource) ∧
          (actualBlockerFiber H hsource).card ≤ 2)
```

Here `K4 carrier center` abbreviates
`HasNEquidistantPointsAt 4 carrier center`; the checked Lean declaration uses
the full unabbreviated type.

The proof is assembled from the following new declarations.

### Canonical crossed packets

```lean
commonDeletion_blockerRow_eq_actualCriticalSupport
commonDeletion_physicalRow_eq_exactFiveClass_erase
nonempty_mutualOmissionCrissCrossNormalForm
```

The first two are choice-invariance lemmas.  Criticality makes a surviving
row at an actual blocker equal the retained exact critical shell.  Exact-five
uniqueness makes a surviving physical-apex row equal the complete physical
class with the deleted source erased.

### Global one-exception classifier

```lean
actualBlocker_ne_physicalApex
allActualBlockers_crossSurvive_or_uniqueDoubleBlockingCenter
```

Deleting any ambient source leaves at least four members of the physical
five-class, so no actual blocker can equal `p`.  If two actual blockers both
block deletion of `q` and `w`, their selected rows contain both points.  The
two blocker centers and `p` would all lie on the perpendicular bisector of
`q,w`; convex independence permits at most two carrier centers there.
Therefore the two blockers are equal.

### Cap localization and exceptional-fiber bound

```lean
doubleBlockingActualSource_not_mem_physicalCap
doubleBlockingActualBlockerFiber_card_le_two
```

A double-blocking row contains both strict-cap physical sources.  Its center
is a second carrier center equidistant from that pair, so two-center
localization places it in the physical cap.  The ordered-cap support bound
then leaves no third same-cap support slot.  The row's own source is distinct
from `q,w` by the two crossed survival facts, hence that source is outside the
cap.

Every source assigned to the same blocker has the same exact critical
support.  Thus its source fiber lies in the two off-cap slots of one exact
four-support, proving the cardinality-two bound.

## Theorem-bank preflight

Before deriving this normal form, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered mutual actual-critical
omission, crossed deletion survival, three-center/two-deletion packets,
same-cap consumers, and global critical-map classifiers.

The closest bank matches do not consume the endpoint:

| Candidate | Exact mismatch |
|---|---|
| `CommonDeletionTwoCenterPacket` and its expansion | The constructor is used twice by the new normal form, but existing expansion consumes one deleted origin at a time and forgets the crossed provenance. |
| `actualBlocker_eq_knownCenter_of_both_frontierDeletions_blocked` / anchored double-deletion | Requires a directed positive cross-membership frontier and first-apex roles.  Mutual omission has the opposite incidence polarity. |
| `U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility` | Requires two q-critical classes centered at named dangerous-triple points and several positive cross-support hits.  The physical sources here are row sources, not those row centers. |
| `outsidePair_unique_capCenter` | Requires two distinct centers in one cap and a named two-point support intersection outside that cap.  The global classifier does not produce that common outside pair. |
| ordinal/Kalmanson consumers | Require positive pair memberships.  The defining mutual-edge data are two negative memberships. |
| `u1TwoLargeCapObstruction` | Requires seven named cross-row equalities; the crossed packets provide only their own two separate radius equalities. |

No indexed theorem says that one of two deletions cannot survive across the
resulting family of actual blockers, and no theorem converts that survival
multiplicity into a named shared-pair incidence.

## Exact regression

`verify_crisscross_regression.py` replays the pinned exact rational 24-point
finite-metric model with digest

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

and checks the additional mutual-arm normal-form conclusions.  It realizes:

```text
q,w                  = 1,2
bq,bw                = 20,21
p                     = 0
unique double blocker = 23
exceptional fiber     = {0}
```

as well as both canonical crossed deletion packets.  The verifier returns
`PASS`.

Epistemic status: **EXACT-WITHIN-MODEL**.  The model has a rational metric,
global K4, exact-five, a total exact critical map, mutual omission, the
two-circle overlap ceiling, and the one-exception conclusion.  It is not a
Euclidean planar convex/MEC realization and is not `CounterexampleData`.
Therefore it blocks every geometry-free consumer of the normal-form fields;
it does not refute a new theorem using further ordered Euclidean placement.

## Remaining theorem boundary

The branch closer is still conjectural:

```lean
theorem false_of_exactFive_mutualOmissionGlobalNormalForm
    (E : PhysicalActualCriticalMutualOmissionEdge K)
    (N : MutualOmissionCrissCrossNormalForm E) : False
```

A proof cannot use only the finite fields stored in `N` plus the
one-exception classifier: the exact regression realizes those conclusions.
The narrowest plausible new geometric producer must turn the family of
cross-surviving actual blockers into the exact antecedent of a current sink,
for example:

- two distinct actual blocker centers in one cap whose q-deleted rows share
  a named outside pair; or
- one named joint physical/critical pair incidence producing a third carrier
  bisector center.

Neither antecedent is currently derivable, and neither should be added as an
unjustified packet.  The next proof attempt should classify the actual blocker
centers by global cap placement while retaining which of `q` or `w` survives;
it should stop immediately if an exact convex/MEC regression realizes that
classification without the proposed terminal incidence.

## Validation

The Lean file was checked directly against the current Lake environment:

```bash
cd lean
lake env lean -R .. \
  ../scratch/atail-force/exact-five-mutual-omission-closure/\
MutualOmissionCrissCross.lean
```

Every printed declaration depends exactly on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `admit`, or `native_decide`.

The regression was replayed with:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/exact-five-mutual-omission-closure/\
verify_crisscross_regression.py
```

and returned `status: PASS`.
