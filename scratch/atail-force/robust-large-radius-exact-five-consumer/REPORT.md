# Robust large-radius exact-five consumer checkpoint

Date: 2026-07-16

Status: **kernel-checked non-looping progress; direct `False` remains blocked**.

Owned lane:

- `scratch/atail-force/robust-large-radius-exact-five-consumer/`

No production source, shared closure document, proof-blueprint state, or
sibling scratch lane was changed.

## Adjudication of the stopped minimal-deletion lane

`scratch/atail-force/robust-second-apex-minimal-deletion/` is already a
kernel-checked predecessor.  Its collision / packed multi-core / installed
singleton output is a decomposition, not a contradiction.  The separate
`robust-minimal-consumer-bank/` audit found no terminal bank consumer for any
of those outputs.  Reopening `RobustSecondApexMinimalDeletion` would therefore
duplicate checked work and return to a known nonterminal layer.

This lane instead consumes the disjoint endpoint

```lean
LargeCapUniqueFiveSecondApexRadius D S
```

left by the checked robust large-radius transition.

## Exact input and non-looping constraint

The live endpoint provides:

- a positive radius at `S.oppApex2`;
- an **ambient-exact** radius class of cardinality five; and
- uniqueness of that radius among all positive radii supporting K4 at the
  physical second apex.

The parent surface also has `6 ≤ S.oppCap2.card` and retains one concrete
`CriticalShellSystem D.A`.

The lane deliberately does not reconstruct any of:

- `FullyDeletionRobustAt`;
- a generic `CommonDeletionTwoCenterPacket`; or
- the already-eliminated `SharedCriticalPairAtLargeSecondApex`.

Those constructors return to an already-classified parent state and are not
closure progress.

## Bank and indexed-corpus preflight

Before the proof, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered:

- an unused opposite-cap point outside an exact five-point radius class;
- an actual critical blocker distinct from the physical Moser apex; and
- a cap-source critical row with a full exact filter.

The closest hits were `N8bEndpointPair.mem_oppositeCap_of_selected`, the
`U4MoserBlockerCore` interface, and
`blocker_centers_eq_of_five_le_of_mutual_cross_membership`.  None consumes the
live endpoint: the first needs a selected pair of Moser vertices and exact-cap
class hypotheses, while the blocker-center theorem needs two already-chosen
sources and mutual cross membership.

## Checked geometric count

The first theorem is:

```lean
theorem three_le_capInterior_hits_of_largeCapUniqueFive
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    3 ≤
      (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2).card
```

The proof uses the full MEC cap cover.  Outside the strict opposite-cap
interior, the class is covered by the two adjacent caps, and convexity bounds
each adjacent-cap intersection by one.  Thus at most two of the five exact
class members lie outside the strict cap interior, so at least three lie
inside it.

This improves the generic K4 bound of two strict-cap hits specifically for the
exact-five endpoint.

## Checked unused-sixth-point persistence

The structure

```lean
LargeCapUniqueFiveUnusedPoint D S profile
```

contains a point `z` satisfying:

- `z ∈ S.oppCap2`;
- `z ∉ SelectedClass D.A S.oppApex2 profile.radius`;
- `5 ≤ (S.oppCap2.erase z).card`;
- erasing `z` leaves the entire ambient exact radius filter unchanged;
- the erased exact filter still has cardinality five; and
- the same radius remains the unique K4 radius after erasing `z`.

Existence is a direct `6 > 5` argument.  Importantly, `z` is outside the whole
ambient filter, not merely outside one chosen four-subset.

The constructor theorem is:

```lean
theorem nonempty_largeCapUniqueFiveUnusedPoint
    (hcap : 6 ≤ S.oppCap2.card)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (LargeCapUniqueFiveUnusedPoint D S profile)
```

## Checked retained-critical-map refinement

The strongest result in this lane is:

```lean
theorem nonempty_largeCapUniqueFiveUnusedCriticalRow
    (H : CriticalShellSystem D.A)
    (hcap : 6 ≤ S.oppCap2.card)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (LargeCapUniqueFiveUnusedCriticalRow D S H profile)
```

In addition to the full-filter persistence above, the packet records:

- `z ∈ D.A`;
- K4 at `S.oppApex2` survives deleting `z`;
- the exact chosen critical row `H.selectedAt z`;
- `z` lies in that row's exact four-point support;
- deleting `z` blocks K4 at its actual blocker; and
- `H.centerAt z ≠ S.oppApex2`.

The last inequality is forced: the unchanged exact five-point class supplies
K4 at the physical apex after deleting `z`, while `H.no_qfree_at z` says the
actual blocker has no K4 after that deletion.

This is genuine source-indexed progress from the unused sixth cap point.  It
does not manufacture a common deletion or restate robustness.

## Consumer audit

The new packet still does not meet a direct sink.

| Candidate consumer | Missing antecedent |
|---|---|
| `CapSelectedRowCounting.outsidePair_unique_capCenter` | two common support points with proved outside-cap placement and equalities at two centers |
| `oppCap2_escape_gen` | a distinct pair simultaneously co-radial at both prescribed Moser apices with the required off-surplus placement |
| `blocker_centers_eq_of_five_le_of_mutual_cross_membership` | a second source and both directed cross memberships |
| `N8b_endpoint_pair_split` / `mem_oppositeCap_of_selected` | two selected Moser endpoints plus the N8 exact-cap containment interface |
| `u1TwoLargeCapObstruction` | its seven named cross-center metric equalities |

Cap order can classify a blocker or support point once its cap membership is
known, but it does not derive that placement from one critical row.  Likewise,
the exact support supplies four points co-radial at the new blocker, but it
does not provide a second center or a second cross-row incidence.  The
inherited `noM44` fact supplies the already-used second-large-cap condition;
no bank theorem turns it into the missing blocker placement or cross hit.

Therefore the honest new residual is:

```text
unused z in the six-point opposite cap
+ z outside the physical apex's unique exact five-class
+ exact critical row through z at a blocker different from the physical apex
+ at least three strict-cap members of the physical class
```

A terminal theorem must couple that new blocker row to at least one other
source/center, or prove enough blocker/support cap placement to invoke an
existing two-center cap-order sink.

## Sharpness evidence and rigor status

The exact `(6,5,5)` local model replayed by
`full-geometry-producer/REPORT.md` has a strictly convex MEC configuration in
which each non-surplus apex has one exact five-point K4 radius.  It shows that
cap order, MEC, and the exact-five full filter alone are compatible with this
endpoint.  The model omits global all-center K4 and a total critical map, so it
is not a counterexample to the present task.  It does show why the next
consumer must use the newly exposed global critical row rather than more
one-apex capacity counting.

- **PROVEN IN LEAN:** the three strict-cap-hit bound, unused full-filter point,
  erase persistence and uniqueness, and actual-blocker inequality.
- **EXACTLY REPLAYED ELSEWHERE:** the local `(6,5,5)` sharpness model.
- **NOT PROVEN:** `False` from `LargeCapUniqueFiveSecondApexRadius`, or any
  required cross-row incidence/cap placement for the unused point's blocker.
- **NOT CLAIMED:** closure of the robust arm, K-A-PAIR, or a production-ready
  theorem placement.

## Lean 4.27 validation

The isolated scratch module elaborates successfully with Lean 4.27 and emits:

```text
three_le_capInterior_hits_of_largeCapUniqueFive
  depends on axioms: [propext, Classical.choice, Quot.sound]
nonempty_largeCapUniqueFiveUnusedPoint
  depends on axioms: [propext, Classical.choice, Quot.sound]
nonempty_largeCapUniqueFiveUnusedCriticalRow
  depends on axioms: [propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` dependency.

The focused command was:

```bash
cd lean
LEAN_PATH=/private/tmp/p97-two-radius-deps-427-v2:\
/private/tmp/p97-anchored-double-deletion-oleans:\
/private/tmp/p97-root-common-deletion-uniform-verify2:\
/private/tmp/p97-root-survival-cover-bank-verify3:\
/private/tmp/p97-root-robust-large-radius-center-localization-verify:\
/private/tmp/p97-root-global-minimal-deletion-verify:\
/private/tmp/p97-global-minimal-deletion-core-oleans \
  lake env lean -R .. \
  ../scratch/atail-force/robust-large-radius-exact-five-consumer/RobustLargeRadiusExactFiveConsumer.lean \
  -o /private/tmp/p97-robust-large-radius-exact-five-consumer/RobustLargeRadiusExactFiveConsumer.olean
```
