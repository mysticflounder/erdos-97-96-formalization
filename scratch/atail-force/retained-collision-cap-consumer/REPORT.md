# Retained-collision cap/MEC consumer audit

Date: 2026-07-17

Status: **THE STRONGEST IMMEDIATE SOURCE-FAITHFUL CAP CONSEQUENCES ARE
KERNEL-CHECKED.  THE RETAINED COLLISION DOES NOT PRODUCE THE `sameCap`
TERMINAL.  ITS REQUIRED CAP PLACEMENT IS ALREADY A DIRECT CONTRADICTION.
A CORRECTED FINITE REGRESSION RETAINS EVERY CURRENTLY REPRESENTED PARENT,
ROW, TWO-CIRCLE, ALTERNATION, AND CAP-PARTITION SURFACE WITHOUT PRODUCING A
SAME-CAP CLOSER.  NO PRODUCTION `sorry` IS CLOSED.**

## Scope

This lane starts from the production packet

```lean
Q : RetainedRadiusCollision (R := R)
```

where `R : FrontierCommonDeletionParentResidual F`.  Thus the two actual
collision sources:

- belong to the retained positive-radius class centered at
  `O := S.oppApex1`;
- have one actual common critical blocker
  `A := H.centerAt Q.fiber.source1 ...`;
- belong to the same exact critical four-shell centered at `A`;
- are deletion-critical at `A`; and
- alternate across `O,A` on every compatible convex boundary.

The full parent additionally retains minimality, `9 < D.A.card`, no
`SurplusCapPacket.IsM44`, the live cap/MEC packet, and the first-apex robust
radius class.

Only files in
`scratch/atail-force/retained-collision-cap-consumer/` were created.  No
production source or plan document was edited.

## Required theorem-bank preflight

Before deriving a new cap or incidence statement, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the cross-project Lean corpus with `nthdegree docs search --lean` queries
  for retained-radius collisions, two cap centers bisecting one outside pair,
  common-blocker cap placement, and critical rows through a shared pair.

The relevant banked declarations are consumers:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `ATailTwoCenterCapLocalization.false_of_two_cap_centers_equidistant_outside_pair`;
- `ATailCriticalFiberClosingCore.SameCapCollisionPairCore.false`; and
- the archived same-cap blocker-edge families, which require endpoint-use and
  ordered-edge data not exported by `Q`.

No banked theorem forces the collision's two centers into one cap while
placing both actual sources outside it.  No banked theorem produces a distinct
actual critical-row center through the two sources either.

## Exact cap-separation verdict

`RetainedCollisionCapConsumer.lean` defines the exact first-apex same-cap
placement:

```lean
FirstApexCapSeparation Q :=
  exists k,
    A in cap k /\ O in cap k /\
    source1 notin cap k /\ source2 notin cap k
```

and proves

```lean
false_of_firstApexCapSeparation
    (Q : RetainedRadiusCollision (R := R)) :
    FirstApexCapSeparation Q -> False
```

The proof constructs the production `SameCapCollisionPairCore` with exactly
the actual collision sources and `O` as its source-faithful second center.
There is no anonymous-pair or arbitrary-center weakening.

The honest positive consequence is therefore the negation of the desired
localization:

```lean
source1_mem_cap_or_source2_mem_cap_of_centers_mem_cap
```

If `A` and `O` lie in one indexed cap, at least one actual collision source
lies in that cap.  This is also the cap-order meaning of the already-proved
boundary alternation.  Consequently, `sameCap` cannot be treated as a packet
that ordinary cap placement should produce.  Proving
`FirstApexCapSeparation Q` would already be the direct collision-arm
contradiction.

The actual-row alternative is equally rigid.  The checked theorem

```lean
actualRow_center_eq_commonBlocker_of_sameCap_outside_sources
```

says that if an actual row at source `J` contains both collision sources, its
center lies in the same cap as `A`, and both sources are outside that cap, then
`H.centerAt J = A`.  Thus no distinct actual blocker center can realize the
other source-faithful `sameCap` route under those cap hypotheses.

## Strongest positive cap-interior consequence

There is one genuinely useful localization which does not already assert
False.  Recall that `O` is the Moser vertex opposite
`S.capByIndex S.oppIndex1`.  The checked theorem

```lean
commonBlocker_mem_firstCapInterior_of_sources_mem
```

proves:

```text
source1, source2 in capInterior(oppIndex1)
  -> A in capInterior(oppIndex1).
```

The proof visibly uses the actual retained-radius equalities, the actual
common-blocker equality, strict Moser-cap placement, ordered-cap two-center
uniqueness, and the unique strict-interior cap partition.  The other two Moser
vertices are excluded by the selected-class endpoint-distance theorems.  If
`A` occupied a different cap interior, that cap would contain `O` and `A`
while excluding both sources, contradicting the cap-separation theorem above.

The stronger normalized output is:

```lean
commonShell_inter_firstCap_eq_sources
```

Under the same two source-interior hypotheses,

```text
selectedAt(source1).support intersect cap(oppIndex1)
  = {source1, source2}.
```

Once `A` is localized, the ordered-cap selected-row bound gives at most two
cap hits, and the two actual collision sources supply both of them.  This is a
source-faithful full-shell statement, not a selected-representative heuristic.

It still does not close the arm: the first apex lies outside this cap, and the
remaining two members of the common shell are only known to lie outside it.

## What the full parent adds

The checked theorem

```lean
exists_oppositeCap_card_ge_five
```

uses global K4/MEC cap lower bounds and `R.noM44` to prove that at least one
non-surplus cap has cardinality at least five.  Together with the surplus cap,
the parent therefore has the intended two-large-cap surface.

This is the strongest new cap-size fact obtainable directly from the fields
of `R`.  It does not identify which retained sources lie in the large cap, and
it does not place their actual blockers.  Minimality likewise supplies the
critical map and row-closure surface but no missing cap incidence by itself.

## Corrected finite regression

`RetainedCollisionCapFiniteBoundary.lean` is a kernel-checked finite
incidence/order/cap abstraction.  It is **not a Euclidean realization of
`CounterexampleData`**.  It simultaneously retains:

- a twelve-label carrier (`9 < card`);
- a total fixed-point-free blocker map omitting the robust first apex;
- exact four-point critical supports, source membership, prescribed-deletion
  cardinality three after erasing the source, and support locking on blocker
  fibers;
- a five-point retained first-apex class surviving every one-point deletion;
- two distinct retained-class sources with one actual common blocker;
- intersection cardinality at most two for every represented pair of distinct
  exact classes, including every critical row against the retained class;
- one injective cyclic boundary satisfying every generated shared-pair
  alternation constraint;
- the selected-row closure consequence of minimality: every nonempty
  row-closed subset is the full carrier;
- a closed-cap `(5,5,5)` partition with pairwise intersections exactly the
  three modeled Moser vertices, surplus cardinality greater than four, both
  opposite caps at least four, and no `(m,4,4)` profile;
- both collision sources and their common blocker in the strict cap opposite
  the first apex; and
- exact equality of the common row's cap intersection with the two sources.

Nevertheless, kernel `decide` proves both:

```lean
no_firstApex_capSeparation_checked
no_sourceFaithful_sameCap_closer_checked
```

Thus the new positive localization theorem is sharp within the current
finite abstraction.  Adding the corrected overlap and alternation gates does
not recover a same-cap closer.

The Z3 script `search_collision_joint.py` was used only to discover the
displayed rows and boundary permutation.  Every retained assertion is
independently replayed by Lean kernel `decide`; no solver result is imported
as a theorem.

## Closure consequence

- **PROVED:** the exact missing first-apex cap placement is a direct-False
  proposition, not an intermediate packet expected from collision alone.
- **PROVED:** any same-cap actual row through both sources has the common
  blocker center; it cannot be a distinct second center.
- **PROVED:** two collision sources in the strict first-opposite cap force the
  common blocker there and exhaust the common shell's cap intersection.
- **PROVED:** the full parent forces at least one large opposite cap.
- **EXACT WITHIN THE FINITE ABSTRACTION:** all represented parent/critical-map,
  overlap, alternation, minimal-row-closure, and `(5,5,5)` cap surfaces coexist
  with a retained collision but without a source-faithful same-cap closer.
- **UNRESOLVED:** direct `False` from `RetainedRadiusCollision` and the full
  Euclidean parent.

The collision arm should therefore stop targeting `sameCap` as its primary
producer.  Its next theorem must consume genuinely stronger information not
present in the regression: a full-filter/MEC inequality, a cardinality
coupling which selects the collision sources, or an alternation-compatible
actual-row/Kalmanson packet.  The former six-point ordered target is also
incompatible with the collision's mandatory alternation and must not be
revived.  If a future
cap theorem proves `FirstApexCapSeparation Q`, it should call the direct-False
consumer immediately rather than manufacture and retain the impossible
same-cap packet.

## Validation

Both Lean files contain no `sorry`, `admit`, declared axiom, unsafe code, or
`native_decide`.  They were checked against the current project with:

```text
lake env lean ../scratch/atail-force/retained-collision-cap-consumer/RetainedCollisionCapConsumer.lean
lake env lean -s 32768 ../scratch/atail-force/retained-collision-cap-consumer/RetainedCollisionCapFiniteBoundary.lean
```

The larger thread stack is needed only for elaborating the exhaustive finite
`decide` propositions.  Every printed declaration has axiom closure contained
in:

```text
propext
Classical.choice
Quot.sound
```
