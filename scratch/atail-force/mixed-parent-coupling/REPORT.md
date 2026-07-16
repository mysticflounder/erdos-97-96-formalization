# Reverse-mixed parent-coupling audit

Date: 2026-07-14

Status: **SOURCE-CURRENT SCRATCH; KERNEL CHECKED; MINIMAL PRODUCER
SHARPENED; PARENT PRODUCER STILL OPEN.**

## Result

The prescribed-failure route is valid, but its separation half was stated
too coarsely.  `MixedParentCoupling.lean` proves the exact adapter:

```text
failure after deleting y at the retained apex blocker
+ blocker distinct from x and u
  => a third carrier center on the {y, oppApex2} bisector

failure after deleting x at the retained apex blocker
+ blocker distinct from y and v
  => a third carrier center on the {x, oppApex2} bisector.
```

Either output feeds the already checked
`false_of_thirdMixedPairBisectorCenter` terminal.

The new cap-side reduction shows that the parent does **not** need to produce
both displayed inequalities.  In the reverse mixed packet,

```text
x,y are in oppCap2;
u,v are outside oppCap2.
```

Consequently membership of the retained apex blocker in `oppCap2` already
separates it from `u,v`, while nonmembership already separates it from
`x,y`.  The only new separation fact is against the known center on the
blocker's own side of this split.

This is packaged as

```text
ApexPartnerFailureCapResidual H x y u v ha
```

with two orientations:

```text
delete y fails and
  (blocker in oppCap2 and blocker != x
   or blocker outside oppCap2 and blocker != u)

or

delete x fails and
  (blocker in oppCap2 and blocker != y
   or blocker outside oppCap2 and blocker != v).
```

The theorem

```text
false_of_reverseMixed_of_apexPartnerFailureCapResidual
```

closes the reverse mixed profile from exactly this cap-quotiented producer.

## Equivalent retained-shell target

`deletionFailure_iff_mem_selectedApexShell` proves, for the same retained
`CriticalShellSystem`, that prescribed cross-deletion failure is equivalent
to membership of the deleted point in the chosen source shell.  Therefore

```text
ApexPartnerFailureCapResidual
```

is equivalent to

```text
ApexShellHitCapResidual.
```

The narrow theorem-mining target is thus:

1. force `x` or `y` into the exact critical shell sourced at `oppApex2`; and
2. exclude the apex blocker only from the same-side known center selected by
   its `oppCap2` membership.

The first item is the prescribed partner-deletion failure.  Current reverse
mixed normalization proves only that the apex shell **omits** `x` or omits
`y`; it permits both omissions.  The second item is a one-inequality order or
provenance statement, not a two-center separation theorem.

## Full-parent audit

The source-current objects retain all of the following data in scope while
the parent proves its equilateral eliminator:

- `CounterexampleData`, hence convexity and global K4;
- the locally constructed `SurplusCapPacket` and no-`IsM44` hypothesis;
- the retained `CriticalShellSystem`;
- the concrete `CriticalPairFrontier`; and
- the MEC, cap-cardinality, fixed-row, and LIVE binders closed over by the
  parent function.

No current theorem maps those binders to either field above.

- The frontier sources are proved distinct from the continuation centers,
  but are not identified with `x,y,u,v` and do not enter the apex shell.
- Global K4 produces selected rows.  It does not force the retained apex
  shell to contain `x` or `y`.
- `prescribed_deletion_blocked_iff_exists_css_alignment` characterizes a
  prescribed failure by the existence of a possibly overridden critical
  system.  It does not align the fixed retained system, so using the override
  as if it were `H` would be circular.
- The MEC/cap packet supplies the `oppCap2` side bit used here, but that bit
  eliminates only the opposite-side candidate.  It cannot distinguish the
  blocker from a candidate on the same side.
- No-`IsM44` constrains cap geometry and cardinalities, not the choice made by
  `H.centerAt oppApex2`.

Accordingly this lane does not claim that the parent already produces
`ApexShellHitCapResidual`.  It has reduced the open separation payload to its
smallest source-current form.

## Exact regression

`verify_cap_quotient_regression.py` pins and runs the exact
`Q(sqrt(3))` reverse-mixed checker, then exhausts the four locally possible
aligned apex blockers:

```text
delete y fails: blocker = x or blocker = u
delete x fails: blocker = y or blocker = v.
```

All four choices satisfy the two apex endpoint-outcome disjunctions.  In
every case the cap side automatically separates the blocker from the
opposite-side candidate, while the same-side inequality is false.  This is a
regression against claiming that cap membership alone supplies the remaining
separation.

Evidence label: **exactly verified within the pinned metric-plus-incidence and
`oppCap2`-side abstraction.**  The checker is not a `CounterexampleData`
model: it does not construct a full MEC packet, global K4, or a total critical
shell system.

## Non-equilateral comparison

The same lemma does not supply the non-equilateral strict-`oppCap1` common
hit.

- The mixed target is membership in one retained apex critical shell plus a
  blocker inequality.
- `StrictOppCap1CommonHit` is membership of one point in the intersection of
  two unchanged continuation-row supports, together with strict cap
  placement.

No source-current map sends the first object to the second.  The exact
non-equilateral regression even permits the two continuation supports to be
disjoint under its local metric/cap data.  A single parent theorem may of
course return a branch-indexed disjunction containing these two different
producers, but treating them as one common selection object would add an
unsupported incidence.

The only genuinely shared mechanism is downstream: both lanes can close once
they produce a forbidden extra perpendicular-bisector incidence.  Their
producer objects remain different.

## Bank preflight

Before fixing this producer, the required current, sibling, legacy, and older
general theorem-bank registries and JSON inventories were searched.  Focused
indexed searches covered prescribed deletion, actual blocker cap
localization, partner-deletion failure, common support hits, and cap-local
bisector uniqueness.

The closest reusable declarations are:

- `cross_deletion_survives_iff_not_mem_selected_support`;
- `source_mem_critical_support_of_no_qfree`;
- `actual_blocker_ne_of_deletion_survives`;
- `prescribed_deletion_blocked_iff_exists_css_alignment`;
- `outsidePair_unique_capCenter`; and
- the current third-bisector terminal.

They provide the equivalence and consumer adapters used here, but none
produces the apex-shell hit or the remaining same-side inequality from the
full parent.

## Rigor boundary

- **PROVEN / kernel checked:** cap-quotiented separation is equivalent to
  two-center separation under the live opposite-side facts.
- **PROVEN / kernel checked:** prescribed failure produces the third
  bisector center when separated.
- **PROVEN / kernel checked:** failure language is equivalent to retained
  apex-shell incidence.
- **PROVEN / kernel checked:** `ApexPartnerFailureCapResidual` closes the
  reverse mixed profile.
- **EXACTLY VERIFIED in the stated abstraction:** all four aligned blocker
  cases survive and cap side alone misses exactly the same-side inequality.
- **OPEN / not claimed:** production of the apex-shell hit or same-side
  exclusion from the full parent hypotheses.
- **NOT SHARED:** no current producer object also yields the
  non-equilateral strict-`oppCap1` common hit.

Every printed Lean endpoint has axiom closure exactly within
`propext`, `Classical.choice`, and `Quot.sound`.  The file contains no
`sorry`, `admit`, named axiom, `unsafe`, or `native_decide`.

## Validation

From `lean/`, with the scratch dependency chain compiled into the temporary
Lean path:

```bash
LEAN_PATH=/tmp/p97-mixed-parent-coupling lake env lean \
  -R .. -M 16384 \
  -o /tmp/p97-mixed-parent-coupling/MixedParentCoupling.olean \
  ../scratch/atail-force/mixed-parent-coupling/MixedParentCoupling.lean
```

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/mixed-parent-coupling/verify_cap_quotient_regression.py
```

Both commands exit zero.
