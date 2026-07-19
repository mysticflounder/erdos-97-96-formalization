# Fixed-system quantifier audit for the bi-apex parent

Date: 2026-07-17

Status: **SOURCE-VERIFIED QUANTIFIER CORRECTION.  AFTER THE CAP-STRENGTHENED
BI-APEX ENDPOINT HAS BEEN FORMED, REQUIRING A CLOSING CORE FOR THE ARBITRARY
INITIAL `CriticalShellSystem` IS STILL AN OPERATIONALLY OVERCONSTRAINED
PRODUCER TARGET.  THE PUBLIC BRANCH CLOSER SHOULD CONCLUDE `False` DIRECTLY.
IF THE EXISTING CRITICAL-FIBER TERMINAL IS USEFUL INTERNALLY, THE HONEST
DISCOVERY CONTRACT IS EXISTENCE OF ONE LATE FAVORABLE SYSTEM AND ONE CLOSING
CORE AT THE REBASED PARENT.  PRODUCTION ALREADY REBASES THE FRONTIER; SCRATCH
ALREADY REBASES THE COMMON-DELETION PACKET; THE ROUTINE `R`/`B` REBASE LADDER
IS MISSING.  NO LEAN OR LAKE BUILD WAS RUN, AND NO SOURCE `sorry` WAS CLOSED.**

## Question audited

The corrected cap-strengthened target from `REPORT.md` was

```lean
theorem nonempty_criticalFiberClosingCore_of_largeOppositeCapsBiApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    Nonempty (CriticalFiberClosingCore R)
```

The cap correction is mandatory: `L` must retain both physical opposite-cap
lower bounds.  This audit asks a separate question: once `L` is available, is
it appropriate to require the closing core at the particular `H` used to
index the initially selected frontier?

## Verdict

There are two distinct notions of strength here.

1. **As a theorem-discovery and construction target, the fixed-`H` statement
   is overconstrained.**  Its implicit quantification asks the producer to
   return a critical-fiber core for whichever critical-shell system happened
   to index the chosen frontier.  The geometry stored by the frontier and
   common-deletion packet can instead be retained while a later favorable
   critical system is chosen.
2. **As a proposition on this impossible branch, it is not logically stronger
   than direct `False`.**  Every `CriticalFiberClosingCore R` is immediately
   contradictory by `false_of_criticalFiberClosingCore`.  Conversely, after
   deriving `False`, Lean can construct either the fixed-system core statement
   or the late-system existential by elimination.  Thus the distinction is
   proof architecture and quantifier order, not logical consistency strength.

The source-valid public mathematical target is therefore direct `False`.
The late-favorable-system existential is the smallest useful helper only when
the proof really does close through the existing critical-fiber terminal.

## Why the initial system is arbitrary

The live wrapper assumes only

```lean
hcritical : Nonempty (CriticalShellSystem D.A)
```

at `U1LargeCapRouteBTail.lean:9461-9466`.  It chooses an arbitrary witness with
`rcases hcritical with ⟨Hcritical⟩` only at line 9550, immediately before
building the depth-five rows and the `f2` row (`:9551-9560`).  Nothing in that
choice says that the selected blocker map is favorable for the eventual
bi-apex geometry.

Moreover, `R.minimal` itself supplies a nonempty critical-shell system by
`CounterexampleData.exists_criticalShellSystem_of_minimal`
(`U1CarrierInjection.lean:1327-1334`).  This existence theorem does not select
a favorable map; it merely confirms that a late choice is source-valid.

The output type makes the dependence real.  `CriticalFiberClosingCore R`
contains a `FrontierCommonDeletionCriticalFiber R`, whose two sources,
repeated blocker, and exact critical supports are all selected from `H`.
The type is explicitly indexed by `H`, `F`, and `R`
(`CriticalFiberClosingCore.lean:312-327`).  Requiring such a core for the
arbitrary initial `H` bakes an unnecessary map choice into the missing
producer.

## Existing rebase evidence

### Production frontier rebase

Production already proves that the frontier's actual geometry does not depend
on the selected critical map:

```lean
def rebaseCriticalPairFrontierSystem
    (F : CriticalPairFrontier D S radius Hinitial)
    (Hfav : CriticalShellSystem D.A) :
    CriticalPairFrontier D S radius Hfav
```

The implementation preserves the survivor points, both deletion-survival
facts, and both apex splits, and reconstructs only the blocker inequalities
from the new system.  The two selected sources remain definitionally equal,
as recorded by the `pair_q` and `pair_w` simp theorems
(`CriticalSystemRebase.lean:32-99`).  The same module also supports a
sourcewise override after the pair is known
(`CriticalSystemRebase.lean:112-124`).

This establishes the important direction of dependency:

```text
choose physical caps, radius, and survivor pair
then choose or override the critical-shell system
```

It does not by itself construct the favorable system.

### Checked scratch common-deletion rebase

The common-deletion packet has exactly the same property.  Scratch defines

```lean
def rebaseCommonDeletionSystem
    (C : CommonDeletionTwoCenterPacket D Hinitial q center₁ center₂)
    (Hfav : CriticalShellSystem D.A) :
    CommonDeletionTwoCenterPacket D Hfav q center₁ center₂
```

at
`scratch/atail-force/common-deletion-consumer/CommonDeletionCriticalExpansion.lean:48-72`.
It preserves the two exact deleted rows, their supports, their cardinalities,
their overlap bound, the physical centers, and both deletion-survival facts.
Only the two inequalities against the actual blocker are reconstructed from
the new `Hfav`.  The scratch file also gives the corresponding late pointwise
override (`:95-106`).

This is recorded scratch work, not a production declaration.  Its prior
scratch validation reported only the standard project axioms, but it was not
rebuilt in this audit.

## Missing routine rebase ladder

No current production declaration rebases the common-deletion packet, the
common-deletion residual, the parent residual, or the bi-apex residual.  The
following adapters are the exact missing plumbing.

First rebase the common residual along the production frontier rebase:

```lean
def rebaseFrontierCommonDeletionResidual
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hinitial}
    (C : FrontierCommonDeletionResidual F)
    (Hfav : CriticalShellSystem D.A) :
    FrontierCommonDeletionResidual
      (rebaseCriticalPairFrontierSystem F Hfav) where
  firstApexDouble := by
    simpa using C.firstApexDouble
  packet := by
    simpa using rebaseCommonDeletionSystem C.packet Hfav
```

The two `simpa`s use only preservation of `F.pair.q` and `F.pair.w`.  The
relevant fields of `FrontierCommonDeletionResidual` are exactly the retained
double-deletion fact and common packet
(`OrientedPhysicalApexIngress.lean:235-247`).

Then copy the `H`-independent parent facts:

```lean
def rebaseFrontierCommonDeletionParentResidual
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hinitial}
    (R : FrontierCommonDeletionParentResidual F)
    (Hfav : CriticalShellSystem D.A) :
    FrontierCommonDeletionParentResidual
      (rebaseCriticalPairFrontierSystem F Hfav) where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  frontierRadius_class_card_ge_four :=
    R.frontierRadius_class_card_ge_four
  common := rebaseFrontierCommonDeletionResidual R.common Hfav
```

Those are all of the fields in the production parent
(`OrientedPhysicalApexIngress.lean:249-260`).

Next copy second-apex robustness:

```lean
def rebaseFrontierBiApexRobustResidual
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hinitial}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R)
    (Hfav : CriticalShellSystem D.A) :
    FrontierBiApexRobustResidual
      (rebaseFrontierCommonDeletionParentResidual R Hfav) where
  secondApex_robust := B.secondApex_robust
```

`FrontierBiApexRobustResidual` has only that one geometric field
(`PhysicalSecondApexCommonDeletion.lean:169-176`).

Finally, after the cap-strengthened wrapper proposed in `REPORT.md` exists,
its rebase just copies the two cap-cardinality inequalities and uses the
rebased `B`.  The cap partition is part of `S`, not part of `H`.

These definitions are expected to be routine, but the pseudocode above was
not elaborated in this audit.  In particular, exact namespace qualification
and any definitional-equality `simpa` arguments remain a focused Lean task.

## Exact primary theorem and optional core helper

### Public branch closer: direct `False`

The least prescriptive source-valid primary theorem is

```lean
theorem false_of_largeOppositeCapsBiApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hinitial}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    False
```

This theorem retains exactly the corrected live data: the complete carrier
geometry, selected frontier pair, common-deletion packet, minimality,
no-`IsM44`, both apex robustness facts, and both cap-six lower bounds.  It
does not require the proof to manufacture an artificial intermediate object
at the arbitrary initial critical map.

This direct theorem should be called on the fifth arm of the combined
cap-first/frontier dispatcher from `REPORT.md`.  The other four arms retain
their existing protected consumers.

### If the existing terminal is useful: one late favorable core

If the proof naturally constructs an `OrderedCrossRowCore` or a
`SameCapCollisionPairCore`, the honest helper is

```lean
theorem exists_lateCriticalFiberClosingCore_of_largeOppositeCapsBiApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hinitial}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    ∃ Hfav : CriticalShellSystem D.A,
      Nonempty
        (CriticalFiberClosingCore
          (rebaseFrontierCommonDeletionParentResidual R Hfav))
```

The theorem may internally use
`rebaseFrontierBiApexRobustResidual B Hfav` and the analogous rebased `L` so
that every premise remains indexed by the favorable system.  The returned
core itself only needs the rebased parent.

The adapter to the public theorem is immediate:

```lean
rcases exists_lateCriticalFiberClosingCore_of_largeOppositeCapsBiApexRobust L
    with ⟨Hfav, ⟨core⟩⟩
exact false_of_criticalFiberClosingCore core
```

The terminal is production-complete at
`CriticalFiberClosingCore.lean:329-339`.

`Hfav` is not supplied by the caller.  Its existence and the closing core are
the new mathematical content.  The existing `Nonempty` theorem for critical
systems merely supplies candidates; it does not prove that one is favorable.
The override operations are construction tools, not a favorable-map theorem.

## Strength comparison

For a fixed cap-strengthened endpoint `L`, write:

```text
FixedCore(L) := Nonempty (CriticalFiberClosingCore Rinitial)
LateCore(L)  := exists Hfav, Nonempty (CriticalFiberClosingCore Rfav)
Direct(L)    := False
```

Production gives both

```text
FixedCore(L) -> Direct(L)
LateCore(L)  -> Direct(L).
```

Ordinary `False.elim` gives the reverse implications.  Hence these are
propositionally equivalent endpoints.  Nevertheless they expose very
different proof-search obligations:

- `FixedCore` asks for a prescribed witness shape at an arbitrary map;
- `LateCore` permits dependent map selection after the geometric labels are
  known, but still insists on the existing two-constructor core; and
- `Direct` permits any correct contradiction using all retained geometry.

Therefore `Direct` is the primary mathematical target.  `LateCore` is the
preferred internal contract only if the critical-fiber route actually
produces one of its two consumer antecedents.  `FixedCore` should not guide
new mining.

## No additional outer universal surface

This correction does not reintroduce the older universal parent callback over
every second large cap, every K4 radius, or every frontier.  The live parent
needs one cap-first branch and one frontier returned by the existing
existential construction.  After that concrete `F`, `R`, `B`, and `L` are in
hand, the only late existential is the favorable critical system used on that
one branch.

Likewise, the theorem need not quantify over all replacements `Hfav`.  The
claim is existence of one favorable system, not uniform closure for every
critical map.

## Implementation order

1. Promote `rebaseCommonDeletionSystem` into a production predecessor module.
2. Add the residual, parent, robust, and cap-wrapper rebase adapters above.
3. State the direct-`False` theorem as the public robust endpoint.
4. Add the late-core existential only if it matches the actual proof being
   developed; do not make it an obligatory public interface.
5. Wire the cap-first five-arm dispatcher and invoke the direct theorem before
   constructing any LIVE rows.

Steps 1-2 are plumbing.  They do not close a `sorry`.  Step 3 is the actual
open mathematical branch closer; proving it and wiring the five arms is what
can bypass the LIVE-Q/C and K-A residual tree.

## Epistemic status

- **SOURCE-VERIFIED:** the arbitrary `Nonempty` critical-system input, its
  current choice point, the production frontier rebase, the exact fields of
  the common residual/parent/robust structures, and the immediate closing-core
  consumer.
- **RECORDED CHECKED SCRATCH, NOT REBUILT THIS TURN:**
  `rebaseCommonDeletionSystem` and its pointwise override.
- **TYPE-SHAPE AUDITED, NOT ELABORATED:** the `R`/`B`/cap-wrapper rebase ladder
  shown above.
- **OPEN MATHEMATICS:** direct `False` from the cap-strengthened bi-apex robust
  endpoint, or equivalently existence of a late favorable closing core.
- **NOT RUN:** Lean LSP elaboration, focused Lean compilation, Lake build,
  axiom audit, proof-blueprint refresh, and git operations.
