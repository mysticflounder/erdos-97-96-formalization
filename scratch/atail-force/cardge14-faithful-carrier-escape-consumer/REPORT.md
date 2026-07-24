# Card-`>=14` faithful escape to critical-fiber consumer audit

Date: 2026-07-22

Status: **BLOCKED FROM THE EXPORTED ESCAPE DATA. THE COMMON-BLOCKER
ALIGNMENT STUTTERS, AND A FOURTEEN-LABEL EXACT INCIDENCE SHADOW RETAINS THE
ESCAPE WITHOUT ANY DISTINCT ROW THROUGH A REPEATED BLOCKER FIBER. NO
PRODUCTION `sorry` IS CLOSED.**

## Question tested

The checked predecessor

```lean
exists_faithfulRow_escape_from_canonical565_of_card_ge_fourteen
```

returns a canonical thirteen-point `(5,6,5)` subcarrier, one
`FaithfulCarrierPattern`, a selected row center inside the subcarrier, and one
row member outside it.  The outside member is an omitted strict point of the
surplus cap or first opposite cap.

This lane tested whether that row can be coupled to an existing

```lean
P : FrontierCommonDeletionCriticalFiber R
```

so that it contains both fiber sources and supplies either the same-cap
outside-pair terminal or the ordered closing-core alternative.

## Kernel-checked interaction with a critical fiber

The production theorem

```lean
Census554.GeneralCarrierBridge.blocker_row_support_eq_shell
```

already determines every faithful row centered at an actual critical
blocker.  The new fiber-specialized theorem

```lean
faithfulRow_at_commonBlocker_eq_fiberShell
```

proves that the faithful row at `P`'s common blocker is exactly `P`'s existing
critical shell.  The companion theorem

```lean
fiberSources_mem_faithfulRow_at_commonBlocker
```

shows that this row contains both fiber sources.

This is not the missing coupling.  Its center is the old common blocker, so it
does not provide the distinct second center required by
`outsidePair_unique_capCenter` or `SameCapCollisionPairCore`.  Choosing the
`FaithfulCarrierPattern` late cannot change this: exactness fixes the row at
that center.

Therefore a useful escape row must satisfy all of the following genuinely new
facts for a fiber chosen after inspecting the full parent:

```text
escape center != fiber common blocker
fiber.source1 in the escaping faithful row
fiber.source2 in the escaping faithful row
escape center and common blocker lie in one indexed cap
both fiber sources lie outside that cap.
```

The first two memberships give the second-center equality.  The last three
fields then feed `CapSelectedRowCounting.outsidePair_unique_capCenter`
directly.  If a production `CriticalFiberClosingCore` is preferred, one must
add a source `J` whose actual blocker is the escape center.  Exactness then
identifies `H.selectedAt J` with the faithful row, but the escape theorem does
not prove that its center lies in the image of `H.centerAt`.

## Exact finite incidence regression

`FaithfulEscapeFiberBoundary.lean` also kernel-checks a concrete fourteen-label
incidence shadow.  It has:

- a fourteen-label carrier;
- a thirteen-label canonical carrier with abstract cap-interior counts
  `3 + 4 + 3` plus three triangle vertices;
- one omitted surplus-interior point;
- a four-point selected row centered in the canonical carrier and containing
  that omitted point;
- a fixed-point-free blocker map whose image omits two designated apex labels;
- source membership in the selected row at every source's blocker;
- one exact three-source blocker fiber with a four-point common row; and
- no row at a distinct center containing even two sources of that repeated
  fiber.

The checked declarations are:

```lean
IncidenceShadow.capPartition_and_canonicalCarrier
IncidenceShadow.rows_are_four_point_carrier_classes
IncidenceShadow.blocker_rows_are_source_faithful
IncidenceShadow.commonBlocker_fiber
IncidenceShadow.canonical_escape
IncidenceShadow.no_distinct_row_contains_fiber_pair
```

This result is **EXACT WITHIN THE DISPLAYED FINITE INCIDENCE ABSTRACTION**.
It is not a Euclidean/MEC realization and not a Problem 97 counterexample.  It
does not encode full radius classes, deletion minimality, convex boundary
geometry, or `noM44`.  Its precise force is that the data actually exported by
the canonical escape and the source-to-blocker row law do not logically name
the required repeated pair in the escaping row.

## Ordered alternative

The escape is even farther from `CriticalFiberClosingCore.ordered`.  That
constructor needs an actual source `J`, the cross membership

```lean
K in (H.selectedAt J).support
```

and one compatible six-role cyclic order.  The faithful escape gives a row
center but no preimage source under `H.centerAt`, no oriented fiber endpoint,
and no boundary order.  The existing theorem-bank search found the checked
ordered consumer and row-hit normal forms, but no theorem producing these
three missing fields from a one-point proper-subset escape.

## First honest next theorem

The smallest load-bearing successor is not another escape or consumer wrapper.
It is a full-parent occurrence theorem which returns either:

1. the five same-cap fields above for one escaping faithful row and one
   production critical fiber; or
2. a complete `OrderedCrossRowCore` for a production critical fiber; or
3. a genuine alternative `IsM44` packet / direct `False`.

Any proof must visibly use information absent from the incidence shadow:
nonlinear Euclidean rank, MEC/cap order, complete-radius filters coupled to the
fixed critical map, or `noM44`.  Iterating
`exists_row_escape_of_proper_subset`, changing the faithful selector, or
choosing the fiber independently cannot supply the missing alignment.

## Theorem-bank preflight

Before this audit, the required current and legacy registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered faithful rows through a
critical fiber, same-cap source-faithful second centers, proper-subset row
escape, and ordered critical-fiber cores.  The closest results are the current
production consumer, `blocker_row_support_eq_shell`, and the existing
retained-radius/equal-blocker obstruction modules.  No indexed theorem derives
the paired escape or cap placement.

## Validation

Run from `lean/`:

```bash
lake env lean -DwarningAsError=true -R .. \
  ../scratch/atail-force/cardge14-faithful-carrier-escape-consumer/\
  FaithfulEscapeFiberBoundary.lean
```

Result: success.  Every printed declaration has axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, `native_decide`, custom axiom, or unsafe
declaration in the owned file.
