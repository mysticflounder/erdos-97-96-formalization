# Original unique-four multicenter occurrence audit

Date: 2026-07-22

Status: **KERNEL-CHECKED THREE-ACTUAL-CENTER OCCURRENCE; NO CHECKED
KALMANSON-SCHEMA OCCURRENCE.**

## Scope

This lane tested the precise follow-up to

```lean
exists_strictCap_collision_or_singletonCore_or_packedCore
```

on `R : OriginalUniqueFourResidual F`.  It asked whether the global deletion
output forces an actual third center and enough complete-shell memberships to
invoke one of the ten checked theorems in `UniqueFourKalmansonCoresScratch`.
All changes are confined to this scratch directory.

Before deriving anything new, the required general-n bank registries and JSON
inventories were checked.  Focused `nthdegree docs search --lean` queries
covered exact-four critical fibers, three distinct actual blocker centers,
selected-shell support transport, and Kalmanson incidence consumers.  The
existing universal input used below is

```lean
Problem97.ATailSurvivalCover.actualBlockerFiber_card_le_four.
```

No indexed theorem supplies the missing cross-membership occurrence.
The closest prior negative audit is
`row-triangle-connectivity-audit/RowTriangleConnectivityAudit.lean`: it
kernel-checks that minimality gives global selected-row strong connectivity,
then gives an exact finite incidence regression in which robust-center
omission, a complete critical collision, and strong connectivity coexist
without the required paired row triangle.  It is not a Euclidean source
countermodel, but it rules out using connectivity alone as the missing
cross-membership producer.

## PROVEN: three actual centers already occur

[`UniqueFourMulticenterOccurrence.lean`](UniqueFourMulticenterOccurrence.lean)
proves

```lean
six_le_outsideFirstApexFiber_card
exists_two_outside_sources_distinct_actualBlockers
exists_three_actualCenters_with_exact_rows
```

Use the favorable late system `lateFirstApexSystem R`, anchored at
`R.interior_q`.  Its actual blocker fiber is exactly the complete first-apex
class and therefore has cardinality four.  Since `R` has at least ten carrier
points, at least six source vertices remain outside that fiber.

Every actual-blocker fiber has cardinality at most four.  Applying the checked
five-source pigeonhole theorem to the six outside sources gives two sources
whose actual blocker centers are distinct.  Neither blocker is the first
apex, because both sources are outside the first-apex fiber, and both centers
are explicitly retained as carrier points.  Thus the source
data force three pairwise-distinct actual centers:

1. `S.oppApex1`, with complete support equal to the exact four-class;
2. the first outside source's actual blocker; and
3. the second outside source's actual blocker.

Both outside critical rows are complete shells and contain their own source.
The two outside sources are proved not to belong to the exact first-apex
class.  This conclusion is uniform in the ambient cardinality and does not
choose arbitrary global K4 rows.

The theorem is stronger than a case-by-case use of the global-deletion
trichotomy: it follows from `R` itself, so it is available on all collision,
singleton, and packed-core outputs.

## PROVEN: exact behavior of the three global-deletion arms

The collision and packed-core outputs make their fresh strict-cap center fully
singleton-deletion robust.  The checked theorem

```lean
robust_output_center_ne_every_actualBlocker
```

records the source-level obstruction:

```text
for every legal critical-shell system and every carrier source,
the chosen actual blocker is not the robust output center.
```

Therefore those two output centers cannot themselves become the third actual
center by late selection or pointwise override.  Their image omission is
choice-invariant, not an artifact of the original fixed system.

On the singleton arm, the polarity is opposite.  The theorem

```lean
singletonCore_installs_strictCap_actualCenter
```

extracts the unique deleted source, installs its `MinimalDeletionCore` shell
by `CriticalShellSystem.overrideAt`, and proves:

- the installed blocker is exactly the strict-cap center;
- that center is different from the first apex;
- the installed support is exactly the complete core shell; and
- the shell contains its source.

This is a legal late critical-system choice.  It does not reassign an
uncertified K4 row.

## Exact mismatch with the Kalmanson consumers

The smallest checked target is

```lean
UniqueFourKalmansonCoresScratch
  .false_of_one_k1_three_cyclic_selected_rows.
```

For four increasing boundary roles `i0 < i1 < i2 < i3`, it needs the six
positive incidences

```text
row centered at i1 contains i0 and i2
row centered at i2 contains i0 and i1
row centered at i3 contains i1 and i2.
```

Equivalently, the three displayed rows have three pairwise shared targets in
the triangular pattern required by the one-`K1` contradiction.  The other
nine checked consumers need at least the same kind of cross-row incidence;
none is triggered merely because each complete critical row contains the
source whose deletion it certifies.

The proved multicenter theorem supplies:

- two freely usable memberships in the exact first-apex row, after choosing
  two points of its four-point support; and
- only the mandatory own-source membership in each of the two outside rows.

It supplies no equality between either outside source and another displayed
row center, no common target in two displayed rows, and no membership of one
actual blocker center in another displayed row.  Hence it does not establish
the six-antecedent packet of the four-role cyclic consumer under a
source-valid role map.

The global-deletion outputs do not fill this gap:

- collision/packed: their robust center is excluded from every actual-blocker
  image, so its large or disjoint radius classes cannot be used as actual
  critical rows;
- singleton: the override supplies one new actual complete shell, but only its
  own-source incidence is forced; and
- the generic repeated-fiber consequence of omitting a robust center can be
  witnessed by the already-known exact four-source first-apex fiber, so it
  does not force a new cross-row pair.

Global selected-row connectivity does not fill it either.  Its path edges
provide one support member at one center per step; the Kalmanson consumer
needs two coordinated support members in each displayed row.  The checked
finite regression cited above preserves the connectivity conclusion while
avoiding the analogous paired row triangle.

## First missing source theorem

The remaining producer is not “there are three actual centers”; that is now
proved.  It is an occurrence theorem adding actual cross-memberships.  The
narrowest useful target should directly conclude the antecedent of
`false_of_one_k1_three_cyclic_selected_rows` (allowing cyclic reflection):

```text
three actual blocker centers c1,c2,c3 and one further carrier point x,
in one checked cyclic order, such that

  x,c2 belong to the complete row centered at c1,
  x,c1 belong to the complete row centered at c2,
  c1,c2 belong to the complete row centered at c3.
```

Every center must come from the same late critical system and every row must
be that system's complete selected shell.  A theorem with this conclusion is
consumed immediately by the existing four-role Kalmanson theorem.  It is
**CONJECTURED / OPEN**.

The next search should therefore mine intersections among complete actual
critical fibers/rows, retaining the source-to-blocker map and cyclic boundary
order.  Merely adding more centers, selected arbitrary K4 witnesses, or
another conditional row packet will not close this antecedent.

## Validation

The owned Lean file passes warnings-as-errors elaboration.  Every printed
proof-facing axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, custom axiom, unsafe declaration,
`native_decide`, or solver trust boundary in this lane.
