# Exact-six total-surface source audit

## Verdict

The active `exact6-allcenter-capaware-gate/allcenter_gate.py` is a sound
necessary-condition **relaxation** of the card-14 exact-`(5,6,6)` mutual
branch, but it is not source-faithful to the complete full parent.  I found no
mathematical overconstraint in the active Boolean/LRA surface.  In particular,
the seemingly suspicious inequality between the mutual pair's two actual
blockers is valid and now has an independent kernel-checked proof in
`MutualOmissionBlockersDistinct.lean`.

The audit did find one cheap concrete source omission and three large missing
parent families:

1. `unused` is only required to be outside the exact-five shell.  Production
   also requires it to lie in the closed six-point physical cap.
2. Only the consequence “no actual blocker is the first apex” is retained.
   The first-apex deletion robustness, the original first-apex co-radial
   frontier pair, and both retained double-deletion witnesses are absent.
3. Minimality is represented by strong connectivity of one selected row
   table, not by the absence of every proper K4-closed subset, and global
   `noM44` is absent.
4. The fixed cap blocks and linear Kalmanson inequalities do not encode the
   MEC/nonobtuse packet or planar rank-two Euclidean realization.

Therefore:

- **UNSAT** for the current abstraction would be decisive for this relaxed
  card-14 slice at the solver level, because every encoded condition is a
  necessary live consequence.  It still needs a checkable certificate before
  becoming a Lean proof.
- **SAT** only means compatibility with the retained abstract-distance
  subsystem.  It does not show compatibility with the full parent or with
  Euclidean/MEC geometry.
- The emitted label
  `SAT_VERIFIED_SOURCE_FAITHFUL_ABSTRACT_DISTANCE_SHADOW` is too strong.  A
  name such as `SAT_VERIFIED_PARTIAL_PARENT_ABSTRACT_DISTANCE_SHADOW` would
  match the actual epistemic status.

The machine-readable inventory is in `manifest.json`.

## Preflight

Before auditing, I checked the required theorem-bank registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-five/exact-six
classes, source deletion, blocker support, and all-center row tables.  The
relevant existing declarations are the expected structural components:
`full_shell_exact`,
`cross_deletion_survives_iff_not_mem_selected_support`,
`source_mem_critical_support_of_no_qfree`, the `no_qfree_at` accessors, and
the retained exact-six distribution modules.  I found no banked terminal
theorem that makes the omitted parent surface unnecessary.

## What the active model gets right

### Canonical carrier and cap indexing

For surplus index zero, the fixed cyclic order and closed caps

```text
SURPLUS_CAP = {5,6,7,8,9}
OPP_CAP1    = {9,10,11,12,13,0}
PHYSICAL_CAP= {0,1,2,3,4,5}
FIRST_APEX  = 5
SECOND_APEX = 9
```

match the production cap selectors.  At carrier cardinality 14, the cap-sum
identity, surplus size at least five, and both opposite-cap sizes at least six
force the exact closed-cap profile `(5,6,6)`.  This is a legitimate exact-card
slice, not a uniform treatment of the live `card >= 14` parent.

### Complete critical-system projection

The active model chooses one K4 row at every carrier center and one actual
blocker for every carrier source.  At every blocker in the blocker image it
then enforces:

- the source belongs to the blocker row;
- the blocker differs from its source and both physical apices;
- the row is the complete exact radius class; and
- after deleting the source, no positive-radius four-class remains at that
  blocker.

Using one common `m[center,*]` row also correctly locks complete supports when
several sources have the same actual blocker.  These are faithful finite
projections of one concrete `CriticalShellSystem`, not independent local row
guesses.

### Exact-five profile and exact-six distribution

The five-element shell at `SECOND_APEX`, its exact filter, and uniqueness of
its K4 radius are encoded correctly.  The uniqueness check on the original
carrier is not an overconstraint: `LargeCapUniqueFiveSecondApexRadius`
already stores `unique_K4_radius` on `D.A`; the unused-point structure later
derives the erased version.

The strict physical-cap shell count `3 or 4` and the adjacent-cap counts agree
with the checked exact-six distribution.  When the four named physical roles
are distinct, requiring the strict physical count to be four is also derived,
not guessed.

### Mutual-pair blocker distinction

`PhysicalActualCriticalMutualOmissionPair` gives

```text
target not in selectedAt source
source not in selectedAt target.
```

If the two actual blockers were equal, the target row would survive deletion
of `source` at that common center, contradicting `H.no_qfree_at source`.
`MutualOmissionBlockersDistinct.lean` formalizes exactly this argument.

This does not conflict with the existing equal-blocker lane.  In
`FullParentMutualEqualBlockerShell`, the equal blockers belong to:

```text
continuation.unusedRow.unused.point
chosen.partner
```

not to the two endpoints of the arbitrary mutual-omission pair.  The active
constraint `source_blocker != target_blocker` is therefore correct.

### Convex-order metric consequences

The following constraints are source-derived necessary consequences:

- two selected circle rows at distinct centers intersect in at most two
  carrier points;
- a fixed target pair occurs in at most two center rows;
- shared outside pairs alternate across two boundary centers;
- cap-center rows have at most two hits in their cap, endpoint rows at most
  one, and two cap centers cannot share an outside pair;
- all strict triangle inequalities; and
- both strict Kalmanson inequalities for every cyclic quadruple.

Replacing finitely many homogeneous strict inequalities by slack at least one
is sound: any live finite solution can be scaled by one common positive
factor.

## Missing or weakened source constraints

### 1. Missing closed-cap membership of `unused`

Production `LargeCapUniqueFiveUnusedPoint` stores

```lean
unused.point_mem_oppCap2 : unused.point ∈ S.oppCap2
```

and proves the indexed `capByIndex` version.  In the canonical card-14 slice
this is exactly

```text
unused in PHYSICAL_CAP = {0,1,2,3,4,5}.
```

The active script only asserts `unused not in shell`, so it permits unused
sources on either adjacent cap.  This should be corrected before interpreting
new SAT survivors.  It is an underconstraint, so it cannot create a false
UNSAT.

### 2. The first-apex parent was projected too aggressively

`FrontierCommonDeletionParentResidual` and its indices retain much more than
the active condition `blocker[source] != FIRST_APEX`:

- two distinct off-surplus sources on one first-apex radius;
- the original `CriticalPairFrontier`;
- first- and second-apex double deletion of that pair;
- an origin-tagged common-deletion packet at the two physical apices;
- a first-apex radius class of cardinality at least four; and
- `firstApexFullyDeletionRobust`, hence K4 at the first apex after deletion of
  every carrier source.

The blocker-image inequality is only one consequence of this surface.  The
missing data is particularly relevant because the current direct parent
strategy explicitly needs a coupling between the exact-five physical rows
and the retained first-apex frontier.

For the next exact-distance revision, the minimum useful restoration is:

```text
for every deleted carrier source q,
some positive distance class at FIRST_APEX has at least four members in A\{q}.
```

The higher-leverage restoration also names the original frontier pair and
requires both double-deletion rows.  Merely keeping the blocker exclusion
repeats the weak-parent projection that the proof strategy is trying to
avoid.

### 3. Minimality and global `noM44`

Strong connectivity of the chosen selected-row graph is valid: minimality
forces it for every faithful row choice.  But the current model only asks for
one strong choice.  Once an exact distance table is available, a strictly
stronger necessary finite check is possible:

```text
there is no nonempty proper carrier subset B such that every center in B has
four points of B on one positive-radius class.
```

This still does not encode the full `CounterexampleData.Minimal`, which
quantifies over arbitrary smaller convex K4 sets, but it consumes much more of
the parent than one chosen graph.

The parent also stores

```lean
noM44 : not exists T : SurplusCapPacket D.A, T.IsM44
```

The current fixed `(5,6,6)` packet is visibly not M44.  That does not discharge
the global field, because an alternative MEC support triangle on the same
carrier can induce different caps.  The active script does not enumerate or
exclude those alternatives.

### 4. MEC and Euclidean realization

The fixed blocks represent the combinatorics of a `CapTriple`, but
`SurplusCapPacket` contains a concrete MEC-promoted nonobtuse circumscribed
Moser triangle.  The active abstract distances omit:

- one MEC center and radius;
- all-carrier disk containment;
- equality of the three support-vertex radii;
- the circumscribed/non-diameter branch; and
- the three nonobtuse support-angle inequalities.

The CAS follow-up does not fill this gap.  It only forms coordinate equations
for selected row equalities and the exact-five apex equalities.  A `UNIT`
ideal would rule out that equality pattern and is useful discovery evidence.
A `NONUNIT` ideal does not supply a strictly convex Euclidean realization,
because it omits orientation, exact-filter inequalities, blocker/no-qfree
inequalities, MEC constraints, minimality, and `noM44`.

## No active overconstraint found

I specifically checked the two places most likely to be mistaken:

1. The original-carrier unique-K4-radius check is a direct field of the
   exact-five profile, so it is valid.
2. The mutual pair's actual blockers must be distinct, and the scratch Lean
   theorem proves it from one omission plus `no_qfree_at`.

The seven role orbits also exhaust all equality patterns between the ordered
distinct continuation pair and ordered distinct mutual pair.  I found no
missing orbit and no illicit role identification.

## Recommended correction order

1. Add `unused in PHYSICAL_CAP` and downgrade the SAT status label.  This is a
   small, unambiguous source correction.
2. Restore first-apex deletion robustness in the exact-distance semantic
   check.  Then add named original-frontier and double-deletion roles rather
   than another cap-local row condition.
3. Reject any exact distance survivor with a proper K4-closed carrier subset.
4. Run the nonlinear coordinate/MEC gate on the survivors that remain, with
   the complete exact filters and inequalities included.
5. Treat global `noM44` as a separate quantified alternate-support-triangle
   obligation; do not equate it with the fixed packet's `(5,6,6)` counts.
6. Generalize beyond card 14 only after this corrected exact slice has a
   terminating certificate schema.  The present fixed-N gate cannot close the
   uniform `card >= 14` theorem by itself.

This order preserves the useful all-center/CriticalShellSystem work while
redirecting the next compute toward parent data that can actually feed the
direct full-parent contradiction.

## Validation

The independent constraint proof was checked with:

```text
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact6-total-surface-source-audit/MutualOmissionBlockersDistinct.lean
```

Lean reported only:

```text
propext, Classical.choice, Quot.sound
```

and no `sorryAx`.
