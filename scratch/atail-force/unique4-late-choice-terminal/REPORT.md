# Original unique-four late-choice terminal audit

Date: 2026-07-22

Status: **KERNEL-CHECKED WHOLE-CARRIER LATE-CHOICE NORMAL FORM; NO DIRECT
`False`. THE `overrideExactSelectedClass` ROUTE SATURATES ONE FOUR-SOURCE
FIBER BUT DOES NOT FEED AN EXISTING TERMINAL.**

## Target

The requested target was a direct contradiction from

```lean
R : OriginalUniqueFourResidual F
```

using the production late-choice APIs

```lean
CriticalShellSystem.overrideExactSelectedClass
ATailCriticalSystemRebase.rebaseCriticalPairFrontierSystem.
```

The first task was to choose a source-valid critical system sending every
member of the exact first-apex class to `S.oppApex1`.  The second task was to
test whether this choice forces an existing strict-Kalmanson, same-cap,
alternative-`IsM44`, or proper-subcarrier terminal.

All changes are confined to this scratch directory.

## Bank and source preflight

The required registries were checked before deriving the normal form:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact critical-class
overrides, critical-system rebasing, same-cap outside-pair uniqueness,
Kalmanson cycles, alternative Moser triangles, and proper K4 subcarriers.

The closest existing work was:

- production `overrideExactSelectedClass` and `CriticalSystemRebase`;
- production `outsidePair_unique_capCenter` and
  `CriticalFiberClosingCore`;
- the checked two-source endpoint landing in
  `endpoint-blocker-geometry/endpoint_blocker_boundary.lean`; and
- the selector-stutter obstruction in
  `global-mutual-favorable-system-choice/FavorableSystemChoice.lean`.

No indexed theorem turns the exact first-apex blocker fiber itself into a
second center, an ordered cross row, or a new MEC support triangle.

## PROVEN: favorable late system and full residual rebase

`UniqueFourLateChoiceTerminal.lean` defines

```lean
lateFirstApexSystem
lateFirstApexFrontier
lateFirstApexResidual.
```

`lateFirstApexSystem R` uses exactly:

- first-apex carrier membership;
- `frontier_radius_pos F`;
- `R.class_card_eq_four`; and
- `R.every_class_member_blocks`.

Thus the override premise is source-valid for all four class members.  The
frontier then rebases through the production API, and every field of
`OriginalUniqueFourResidual` copies to the rebased frontier.  No geometric
point, deletion witness, minimality hypothesis, or no-`IsM44` hypothesis is
dropped.

## PROVEN: the whole-carrier exact fiber normal form

The central pointwise equivalence is

```lean
lateFirstApexSystem_centerAt_eq_iff_mem_class
```

which proves, for every `source in D.A`,

```text
centerAt source = S.oppApex1
  iff
source in SelectedClass D.A S.oppApex1 radius.
```

The reverse implication is the override contract.  The forward implication
uses the complete critical shell selected at `source`: if its center is the
first apex, its positive radius supports a K4 class there; the unique-radius
field forces that radius to be `radius`, so its source lies in the displayed
exact class.  Therefore no unnamed ambient source is silently added to the
fiber.

For every class member, the complete selected support is also exactly the
displayed class:

```lean
lateFirstApexSystem_support_eq_class.
```

Specializing to the retained frontier pair gives

```lean
lateFirstApexSystem_frontierPair_normalForm.
```

Both retained blockers equal the first apex, and both complete critical
supports equal the same exact class.  Finally,

```lean
lateFirstApex_actualBlockerFiber_points_eq_class
lateFirstApex_actualBlockerFiber_card_eq_four
```

prove that the image of the full source fiber is exactly that class and has
cardinality four.  These are whole-carrier results; no finite list of named
roles is assumed to exhaust `D.A`.

## PROVEN: exact four has the wrong robustness polarity

```lean
firstApex_not_fullyDeletionRobustAt
```

uses one of the retained strict-interior class members and
`R.every_class_member_blocks` to prove

```lean
not FullyDeletionRobustAt D S.oppApex1.
```

This is why the production common-deletion route is not merely missing a
rebase adapter.  `FrontierCommonDeletionParentResidual` proves the opposite
property, and `FrontierCommonDeletionCriticalFiber` explicitly requires its
common blocker to differ from the robust first apex.  The unique-four leaf
cannot be converted to that parent surface.

## Existing-terminal audit

### Strict Kalmanson / ordered core

The late system supplies one metric row, centered at `S.oppApex1`, repeated
at four source indices.  `lateFirstApexSystem_class_blockers_eq` proves that
all those blockers coincide.  Repetition does not supply a directed strict
comparison cycle.

The production `OrderedCrossRowCore` requires a common blocker distinct from
the first apex, a third source `J`, its actual row, one new cross membership,
and a compatible six-role boundary order.  None of those fields follows from
fiber saturation.  In fact the candidate common blocker produced by the
override is definitionally the first apex, so it has the opposite polarity
from the core's `commonBlocker_ne_firstApex` field.

### `outsidePair_unique_capCenter`

This consumer requires two distinct centers in one ordered cap which are
both equidistant from the same two distinct points outside that cap.  The
late fiber supplies only one center: every class blocker is the first apex.
It therefore cannot provide the consumer's distinct-center premise.

The immediate choice-invariant terminal for the retained frontier pair is
already recorded in `card_four_parent_boundary.lean` as

```lean
ExistsSurplusPairCriticalBlocker S S.oppApex1 F.pair.q F.pair.w
```

and is consumed by

```lean
false_of_existsSurplusPairCriticalBlocker.
```

The missing content is a certified **non-apex** center in the surplus cap
whose complete critical shell contains both frontier sources.  Saturating
the apex class cannot produce that center.

### Alternative `IsM44`

The override changes only the critical-shell selector.  It does not change
the carrier, MEC, support triangle, or cap partition.  The existing
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine` constructor first needs
a new nonobtuse circumscribed MEC triangle, its complete `CapTriple`, and two
exact four-cap cardinalities.  The late system supplies none of those data.

### Proper K4 subcarrier

The four source-indexed critical shells are witnesses centered at the first
apex; they are not four K4 rows centered at the four class sources.  Hence
the exact class is not shown to have `HasNEquidistantProperty 4`, and fiber
saturation does not construct any proper witness-closed subcarrier.

Minimality can refute a proper K4 subcarrier once one is produced, but no
current theorem produces it from this late fiber.

## Exact route verdict

The requested favorable rebase is valid and fully formalized, but it is a
**selector stutter**:

```text
four exact-class sources
  -> one actual blocker, S.oppApex1
  -> one complete exact support, the same four-point class.
```

It does not close `OriginalUniqueFourResidual`.  Continuing to saturate or
rebase this same class cannot add the missing second center or third row.
This particular late-choice route should therefore stop here rather than add
another conditional adapter.

## First missing source-level theorem

The narrowest already-consumed next theorem is a direct producer of the
existing choice-invariant packet for the retained frontier pair:

```text
OriginalUniqueFourResidual F
  -> ExistsSurplusPairCriticalBlocker
       S S.oppApex1 F.pair.q F.pair.w.
```

Expanded, it must produce a source, a certified deletion-critical exact
shell, and a center such that:

```text
center in S.surplusCap
center != S.oppApex1
F.pair.q and F.pair.w both lie in the complete shell.
```

This is **CONJECTURED / OPEN**.  It must use global minimality/total K4 and
MEC/cap geometry to produce a genuinely new center; critical-system choice
alone cannot do it.  The alternative honest outputs remain a genuine new
`IsM44` packet or a proper K4 subcarrier, either of which has an immediate
consumer in `R.noM44` or `R.minimal`.

## Validation

The file was elaborated from `lean/` with warning-as-error enabled:

```bash
env LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/unique4-late-choice-terminal:\
./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique4-late-choice-terminal/UniqueFourLateChoiceTerminal.lean
```

The command exited `0`.  Every printed declaration has axiom closure exactly

```text
propext
Classical.choice
Quot.sound
```

The module contains no `sorry`, `admit`, declared axiom, `unsafe`, or
`native_decide` declaration.
