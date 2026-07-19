# Full-parent equal-blocker terminal audit

Date: 2026-07-18

Status: **KERNEL-CHECKED FULL-GEOMETRY ROUTE OBSTRUCTION. THE EQUAL-BLOCKER
ARM DOES NOT CURRENTLY REACH `False`. THE FIRST-APEX `sameCap` ALTERNATIVE IS
IMPOSSIBLE, AND THE `ordered` SOURCE MUST BE A NEW SOURCE OUTSIDE THE PHYSICAL
CAP. THE SMALLEST REMAINING TERMINAL PRODUCER IS A SECOND ACTUAL CRITICAL ROW
THROUGH BOTH FIBER SOURCES, WITH ITS DISTINCT CENTER IN A COMMON NONPHYSICAL
CAP. NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/global-mutual-equal-blocker-terminal/`. It consumes the
kernel-checked scratch definition
`FullParentMutualEqualBlockerShell` but does not edit the predecessor lane,
production Lean, docs, proof-blueprint state, git state, ShellCurvature, or
other protected files.

## Exact input

The audited object is

```lean
Q : FullParentMutualEqualBlockerShell M
```

for

```lean
M : FullParentExactFiveMutualData L profile.
```

Its production fiber is

```lean
Q.criticalFiber : FrontierCommonDeletionCriticalFiber R
```

with sources pinned to

```text
source1 = M.continuation.unusedRow.unused.point
source2 = Q.chosen.partner.
```

The first is the continuation's unused point in the closed physical second
cap. The second is a physical exact-five vertex in that cap's strict
interior. They are distinct, share one actual blocker and one exact critical
support, and are both deletion-critical at that blocker.

## Required theorem-bank preflight

Before deriving another incidence or local contradiction, this lane checked
all registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered equal-blocker critical
fibers, source-faithful same-cap second centers, ordered cross rows, physical
cap endpoint distance injectivity, and the exact-five continuation.

The closest current declarations are:

- `CriticalFiberClosingCore.sameCap` and `.ordered`;
- `CGN.oneSidedDistanceInjective_of_mecCapPacket`;
- `ATailRetainedCollisionCapLocalization`, which applies to a different
  retained-radius collision whose two sources are co-radial from the first
  apex;
- the checked same-cap and ordered closing-core normalizations; and
- the older cycle-edge mutual-omission normal forms.

No banked theorem produces a distinct actual row through the present two
sources. No banked theorem supplies the ordered cross membership and cyclic
placement from this continuation.

## Kernel-checked full-geometry obstruction

### Physical-cap endpoint injectivity

`dist_firstApex_ne_of_mem_physicalCap` proves, using the actual ordered MEC
cap packet, that for distinct vertices `x,y` of the closed physical second
cap,

```lean
dist S.oppApex1 x != dist S.oppApex1 y.
```

The first apex is the first physical-cap endpoint. The proof obtains the
production ordered-cap enumeration, handles either endpoint orientation,
and applies one-sided distance injectivity. This is a theorem of the full
Euclidean cap geometry, not a finite abstraction or sampled computation.

`equalBlocker_fiberSources_mem_physicalCap` pins both equal-blocker sources to
that cap, and `equalBlocker_firstApex_dist_ne` specializes endpoint
injectivity to the production critical fiber:

```lean
dist S.oppApex1 Q.criticalFiber.source1 !=
  dist S.oppApex1 Q.criticalFiber.source2.
```

This separates the present fiber from `RetainedRadiusCollision`: the latter
has both sources on one first-apex radius by definition, while this exact-five
continuation fiber cannot.

### `sameCap`: the first-apex constructor is impossible

`HasSourceFaithfulSecondCenter` allows two origins for its second center:

1. the robust first apex itself; or
2. an actual `centerAt J` whose exact critical row contains both sources.

The first origin contradicts `equalBlocker_firstApex_dist_ne` in either fiber
orientation. The checked theorem

```lean
equalBlocker_sameCap_secondCenter_is_actualRow
```

therefore proves that every hypothetical `SameCapCollisionPairCore` for this
fiber must use the second origin. The companion theorem

```lean
equalBlocker_sameCap_capIndex_ne_physicalCap
```

proves that its cap cannot be the physical second cap containing the two
sources.

Thus no projection of the current physical-apex data constructs `sameCap`.
The first-apex shortcut is not merely missing; it is ruled out by full cap
geometry.

### `ordered`: the row source is outside the physical cap

For any source-faithful first-apex `RowHit` on this fiber,

```lean
equalBlocker_rowHit_other_not_mem_physicalCap
```

proves that the row's other point is outside the physical cap. Otherwise two
distinct points of that cap would be equidistant from its first endpoint.

The corresponding constructor-level theorem

```lean
equalBlocker_ordered_source_not_mem_physicalCap
```

shows that the `J` source of every hypothetical `OrderedCrossRowCore` lies
outside the physical cap. Finally,

```lean
equalBlocker_ordered_source_ne_namedPhysicalSources
```

proves that `J` is different from all four named physical-cap sources:

```text
the unused point,
continuation.first,
continuation.second,
the mutual partner.
```

Therefore the retained continuation does not already contain the ordered
terminal's source. The producer would have to find a genuinely new outside
source and prove that its actual row contains the oppositely oriented fiber
source.

## Can this arm reach `False` now?

No. The checked results remove false shortcuts but do not construct either
existing terminal.

### Smallest recommended missing theorem

The shorter remaining route is the actual-row form of `sameCap`. A full-parent
producer must choose a cap index and actual source `J` such that:

```text
the cap is not the physical second cap;
the common blocker and centerAt J are in that cap;
centerAt J is distinct from the common blocker;
both fiber sources are outside that cap;
both fiber sources occur in selectedAt J's exact support.
```

In Lean-facing form, the missing theorem can return exactly these fields for
`Q.criticalFiber`; they instantiate `SameCapCollisionPairCore` immediately,
and `SameCapCollisionPairCore.false` closes the arm. No new packet type is
needed.

The load-bearing positive statement is:

```lean
Q.criticalFiber.source1 in selectedAt J.support
and
Q.criticalFiber.source2 in selectedAt J.support
```

for a **distinct** actual blocker placed with the common blocker in one cap
outside the source pair. Equal support of the two existing fiber rows does not
produce this third row.

### Ordered fallback

The ordered route is strictly larger. It must first obtain a `RowHit`, orient
the hit source as `C`, choose the new outside-cap point `J`, and then prove

```text
K in selectedAt J.support
and
O,A,X,J,C,K occur in the required CCW cyclic order.
```

The robust first-apex equality is automatic from the row hit. The cross
membership and six-role order are not. Since the equal-blocker fiber may also
land in the production `BothOff` branch, a uniform ordered proof needs either
to eliminate `BothOff` or choose another closing route there.

## Exact regression boundary

The earlier checked regressions remain applicable to the surviving gap:

- `critical-fiber-closing-core-samecap` has an exact finite critical-map model
  with equal support locking but no permitted source-faithful second center;
- `critical-fiber-closing-core-ordered` has one exact finite row-hit model in
  which the cross membership is absent, and another in which it is present
  but the required cyclic order is absent.

Those results are exact within their displayed finite abstractions, not
Euclidean `CounterexampleData` models. The new theorem here adds genuine
Euclidean cap information and proves the outside-cap localization, but that
localization does not force the missing third row or its center placement.
Consequently a successful producer must visibly use more of the full parent:
global cap interaction, full radius filters/MEC placement, `noM44`, or a new
minimality coupling. More support locking or another row at the same blocker
cannot suffice.

## Validation and epistemic status

The predecessor scratch module was first elaborated to a temporary olean, and
the owned file was then checked against it:

```bash
cd lean
lake env lean -R .. -M 16384 \
  -o /tmp/p97-global-mutual-equal-oleans/GlobalMutualPairCloser.olean \
  ../scratch/atail-force/global-mutual-pair-closer/GlobalMutualPairCloser.lean

LEAN_PATH=/tmp/p97-global-mutual-equal-oleans \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/global-mutual-equal-blocker-terminal/EqualBlockerTerminal.lean
```

All printed endpoints depend only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or unsafe declaration.

- **PROVED / KERNEL-CHECKED:** physical-cap endpoint distance injectivity;
  exclusion of the first-apex same-cap route; outside-cap localization of
  every row-hit/ordered source; exclusion of all named continuation sources
  as the ordered `J`.
- **EXACT WITHIN FINITE ABSTRACTIONS:** the cited same-cap and ordered
  regressions.
- **OPEN:** the distinct actual row/common-cap occurrence theorem above, or
  the larger ordered cross-membership/order theorem.
- **TERMINAL CLOSURE:** none.
- **PRODUCTION `sorry` CLOSED:** none.
