<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-center joint census proof plan (2026-07-08)

This note is the proof-facing companion to
`docs/multi-center-joint-census-2026-07-08.md`. It does not restate the
full census evidence; it records the theorem candidates that the data has
made plausible and the order in which they should be attacked.

Scope: L2 triple-support classes under the PROVEN cuts of
`docs/multi-center-joint-census-spec-2026-07-07.md`.

## Current empirical facts

Through the completed `GLOBAL` sweep and follow-on `LOCAL` frontier scans, the
L2 PROVEN data now shows:

1. `977,975 / 977,975` tested LOCAL classes are GLOBAL-realizable.
2. `0` `UNSAT`, `0` `INDETERMINATE`.
3. The cumulative project-level inventory reaches `3375` classes by
   `n = 24`.
4. The project-level fresh GLOBAL count is `0` on
   `n = 25, 26, 27, 28, 29, 30, 31, 32`.
5. Every class present through `n = 31` is still present at `n = 32`;
   in fact every cumulative inventory through `n = 24` survives on each
   of `n = 25..32`.
6. Empirically, the realized `GLOBAL` inventory is monotone across the
   entire swept range: for every `m < n <= 32`, every class seen at `m`
   is still seen at `n`.
7. The exact `L2 LOCAL` frontier is flat against the `n <= 28` baseline on
   every completed chunk through `n = 56`: no new `LOCAL` class keys appear
   on `n = 29..56`, and no previously seen `LOCAL` class disappears.

These facts support two structural conjectures and one theorem upgrade
path.

## Candidate theorems

### T1. L2 local-to-global completion

Candidate statement:

```text
For every profile and every L2 class C satisfying the LOCAL constraints
under the PROVEN cuts, there exists a full admissible assignment
realizing C.
```

Why this is the leading candidate:

- it matches every completed data point so far;
- it explains the empirical identity `L2 LOCAL = L2 GLOBAL`;
- it turns the tail from a search problem into a finite local
  classification problem.

What would count as progress:

- first prove a constructive completion theorem for a fixed profile and a
  fixed materialized representative;
- then abstract away the representative choice and phrase the theorem on
  canonical classes.

Main risk:

- the current evidence is exhaustive only in a bounded `n` range, so the
  theorem still needs a structural completion mechanism, not a "no
  counterexample seen" argument.

### T2. Persistence under `n -> n+1`

Candidate statement:

```text
If an L2 PROVEN class C is realizable at n, then C is realizable at
n + 1 (for a profile obtained by adding one interior point to a cap
whose size stays admissible).
```

This is weaker than full stabilization, but it is the cleanest route
from the data to a proof.

Why it is a serious candidate:

- the cumulative inventory is empirically monotone;
- no class seen through `n = 24` disappears on `n = 25..28`;
- the fresh count becomes `0` for four consecutive rows once the
  inventory reaches `3375`.

What the theorem should *not* try to prove:

- not every profile maps to every larger profile;
- not every local class is present at every smaller `n`;
- not a direct cardinality statement.

The right target is one-step carry-forward of realized classes.

### T3. Eventual constancy from persistence + finite inventory

Candidate statement:

```text
The L2 GLOBAL / PROVEN class inventory is constant for all sufficiently
large n.
```

This is the proof-facing upgrade from the current
`STABILIZED-EMPIRICAL` result to `STABILIZED-PROVEN`.

It should not be attacked first. The sensible derivation is:

1. finite support alphabet;
2. persistence theorem (T2);
3. monotone bounded inventory;
4. conclude eventual constancy.

### T4. LOCAL alphabet constancy above a threshold

Candidate statement:

```text
There exists n0 such that the set of L2 LOCAL / PROVEN classes is
independent of n for all n >= n0.
```

Why this is now a serious candidate:

- the exact `LOCAL` frontier is flat on every completed scan through
  `n = 56`;
- this supplies the upper-bound direction that forward `GLOBAL`
  persistence alone does not give;
- it converts the large-`n` tail from an unbounded discovery problem into
  a finite classification problem.

Why it matters:

- together with T1 (`LOCAL => GLOBAL`), it yields a quantitative route to
  `GLOBAL` inventory locking above the same threshold;
- it is plausibly easier than a direct `GLOBAL` stabilization theorem,
  because it lives entirely on the canonical local class surface.

## Recommended proof order

### Phase 1. Formalize the class object

Before proving anything global, define in one place the L2 class data:

- distinguished Moser vertices;
- region labels `{int S, int O1, int O2}`;
- incidence bits for `K(U), K(V), K(W)`;
- quotient by size-preserving profile automorphisms.

This definition should match the code's `canon_joint(...)` boundary, not
the earlier coarse pair-summary language.

Acceptance condition:

- the formal object is strong enough that the census artifacts can be
  read as instances of it;
- its derived projections recover the pairwise L1 classes.

### Phase 2. Prove persistence first

This is the best first theorem.

Desired shape:

```text
realizable(profile, C) -> realizable(extended_profile, C)
```

Likely proof idea:

- add one inert interior point in a cap with slack;
- leave the existing support-incidence structure untouched;
- choose the new point's selected class so that C1/C2/C4/H1 still hold.

This is exactly where the real math lives. The obstruction to watch is
C4 saturation, not the local class alphabet.

If persistence fails in this form, the failure should be documented as a
precise obstruction pattern. That still sharpens the route.

### Phase 3. Split the upgrade into qualitative and quantitative parts

The first upgrade that T2 supports is qualitative only:

```text
inventory(n) is constant for all sufficiently large n
```

Reason: T2 gives a monotone carry-forward on realized classes, and the
L2 PROVEN class alphabet is finite. A monotone bounded inventory is
eventually constant. This argument does not use the observed zero-fresh
window.

What T2 does **not** buy by itself is the quantitative statement

```text
inventory(n) = inventory(25) for all n >= 25
```

because forward persistence does not rule out fresh classes first
appearing at larger `n`.

To lock the threshold at `25`, an upper-bound direction is still needed.
The two plausible routes are:

1. a reverse-persistence statement showing that every class realizable at
   `n + 1` is already realizable at `n` above some cutoff `n0 <= 25`; or
2. LOCAL-alphabet constancy above some cutoff, combined with T1
   (`LOCAL => GLOBAL`) to identify the realized inventory with that
   stable local alphabet.

The completed `n = 25..28` window remains important evidence for that
second, quantitative phase, but it is not enough on its own.

The strongest current upper-bound candidate is T4: if the `LOCAL`
alphabet is constant above some threshold and T1 holds there as well,
then no new `GLOBAL` classes can appear above that threshold.

### Phase 4. Return to local-to-global completion

After persistence, revisit T1. If T1 is provable, it is stronger and
more conceptual than eventual constancy alone. It is not required for
the qualitative eventual-constancy upgrade once T2 lands, but it is a
natural required ingredient for the quantitative route that locks the
stabilized window at `n = 25`.

It is therefore the second proof target, not the first.

### Phase 5. Connect the theorem stack to the actual spine

This theorem family is aimed at the slot-3 tail obligations, not the
slot-2 certificate frontier.

In particular, the multi-center census and its `LOCAL`/`GLOBAL`
stabilization theorems do **not** directly supply the producer facts
required by:

- `Problem97.isM44EndpointResidualsExcluded`;
- `Problem97.isM44PinnedSurplusResidualsExcluded`;
- `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.

The erased-pin frontier explicitly remains blocked on a local producer
surface of different shape (`ErasedPinFiniteCandidateSepScaffoldFacts`
and direct surplus-side erased-pin exclusions), so the census does not
close any current slot-2 spine `sorry` by itself.

Where this line should pay off is the slot-3 large-cardinality tail:

- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`;
- then, downstream, `Problem97.u1_largeCap_routeB_tail_liveData_false`.

So the formalization value of T1/T2/T4 is to narrow or close the U4
tail route by proving that the live `>2`-center coupling surface is a
finite stabilized local incidence alphabet with no hidden `GLOBAL` layer.

## Lean formalization status

Initial abstract general-`n` support now lives in
`lean/Erdos9796Proof/P97/MultiCenter/GeneralN.lean`.

That module formalizes the class-object surface used by the joint census
and proves the proof-clean inventory lemmas:

1. `Problem97.MultiCenter.stabilizesAt_of_subset_base`;
2. `Problem97.MultiCenter.stabilizesAt_of_step_sandwich`;
3. `Problem97.MultiCenter.monotoneInventory_of_stepPersistent`;
4. `Problem97.MultiCenter.exists_stabilizesAt_of_monotone_bounded`;
5. `Problem97.MultiCenter.exists_stabilizesAt_of_stepPersistent_bounded`;
6. `Problem97.MultiCenter.exists_stabilizesAt_of_stepPersistent_finite`;
7. `Problem97.MultiCenter.exists_stabilizesAt_of_stepPersistent_localClassCode`;
8. `Problem97.MultiCenter.exists_stabilizesAt_of_stepPersistent_localJointClassCode`;
9. `Problem97.MultiCenter.stepPersistent_mapInventory`;
10. `Problem97.MultiCenter.stabilizesAt_mapInventory`;
11. `Problem97.MultiCenter.exists_stabilizesAt_mapInventory_of_stepPersistent_finite`;
12. `Problem97.MultiCenter.exists_stabilizesAt_localJointClassCodeSemanticInventory`;
13. `Problem97.MultiCenter.equalInventoriesFrom_of_globalSubsetsLocal_of_completion`;
14. `Problem97.MultiCenter.global_stabilizesAt_of_local_stabilizesAt_of_completion`;
15. `Problem97.MultiCenter.global_locksAt_of_local_locksAt_of_completion`;
16. `Problem97.MultiCenter.stabilizesAt_mono`;
17. `Problem97.MultiCenter.localCompletesGlobalFrom_mono`;
18. `Problem97.MultiCenter.global_stabilizesAt_of_local_stabilizesAt_of_completionFrom`;
19. `Problem97.MultiCenter.JointProfile.interiorCapacity_le_extendCap`;
20. `Problem97.MultiCenter.JointClass.locallyAdmissible_of_interiorCapacity_mono`;
21. `Problem97.MultiCenter.JointClass.locallyAdmissible_extendCap`;
22. `Problem97.MultiCenter.JointClass.equivalentUnder_refl`.

It also introduces `Problem97.MultiCenter.BoundedJointClass P`, a finite
`Fin`-valued coding of joint classes for a fixed profile `P`, together
with a conversion from locally admissible `JointClass` objects into that
finite carrier. The subtype `Problem97.MultiCenter.LocalClassCode P`
packages the locally admissible part of that finite carrier.
The stronger `Problem97.MultiCenter.FourBoundedJointClass` and
`Problem97.MultiCenter.LocalJointClassCode` remove the fixed-profile
parameter: LOCAL admissibility proves each cap-count cell is at most `4`,
so the class-key alphabet itself is finite independent of cap capacities.
The embedding/projection lemmas show that finite-code stabilization
transfers to the semantic `JointClass` inventory, and
`Problem97.MultiCenter.LocalJointClassCode.codedBy_of_locallyAdmissible`
records that every locally admissible semantic class has such a finite key.
The automorphism surface now also has the identity case formalized, so
canonical class equivalence is at least reflexive in Lean.

These are deliberately abstract. They do not assert T1, T2, or T4 for the
geometric census yet. Instead, they give the Lean-ready glue: once the
project supplies finite alphabet, persistence, local stability, and
local-to-global completion hypotheses, the qualitative and quantitative
stabilization conclusions are already kernel-checked.

Initial realization-facing support now lives in
`lean/Erdos9796Proof/P97/MultiCenter/Realization.lean`. That module defines
the artifact-facing predicate surface `CodeRealizationPredicate`, the filtered
finite inventory helper `inventoryOf`, and the explicit `CodeInventory`
interface for a realized-code predicate with a finite inventory and membership
equivalence. `CodeInventory.ofPredicate` packages the canonical filtered
inventory from any realization predicate. It also defines the predicate-level
soundness and completion interfaces:

```lean
PredicateGlobalSubsetsLocal
PredicateLocalCompletesGlobalFrom
PredicateLocalCompletesGlobal
```

These are the proof-facing surfaces for the T1/T4 route: GLOBAL classes must
be LOCAL, and LOCAL classes must complete to GLOBAL above the chosen threshold.
The module proves:

1. `Problem97.MultiCenter.CodeInventory.stepPersistent`;
2. `Problem97.MultiCenter.CodeInventory.exists_stabilizesAt`;
3. `Problem97.MultiCenter.CodeInventory.exists_stabilizesAt_semanticInventory`;
4. `Problem97.MultiCenter.CodeInventory.globalSubsetsLocal`;
5. `Problem97.MultiCenter.CodeInventory.localCompletesGlobalFrom`;
6. `Problem97.MultiCenter.CodeInventory.localCompletesGlobalFrom_of_localCompletesGlobal`;
7. `Problem97.MultiCenter.CodeInventory.equalInventoriesFrom_of_predicateCompletion`;
8. `Problem97.MultiCenter.CodeInventory.global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletion`;
9. `Problem97.MultiCenter.CodeInventory.global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom`;
10. `Problem97.MultiCenter.CodeInventory.global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletion`;
11. `Problem97.MultiCenter.CodeInventory.global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom`;
12. `Problem97.MultiCenter.CodeInventory.exists_global_stabilizesAt_of_local_stepPersistent_of_predicateCompletion`;
13. `Problem97.MultiCenter.CodeInventory.exists_global_stabilizesAt_of_local_stepPersistent_of_predicateCompletionFrom`;
14. `Problem97.MultiCenter.CodeInventory.exists_global_semanticStabilizesAt_of_local_stepPersistent_of_predicateCompletion`;
15. `Problem97.MultiCenter.CodeInventory.exists_global_semanticStabilizesAt_of_local_stepPersistent_of_predicateCompletionFrom`;
16. `Problem97.MultiCenter.exists_stabilizesAt_inventoryOf`;
17. `Problem97.MultiCenter.exists_stabilizesAt_semanticInventoryOf`.

The same file now also formalizes the profile-facing target surface:

```lean
ProfileRealizationSurface
ProfileRealizationSurface.localRealized
ProfileRealizationSurface.globalRealized
ProfileRealizationSurface.localInventory
ProfileRealizationSurface.globalInventory
```

This packages the planned `ProfileOccursAtN`, `RealizesJointClass`,
`LocalInventory`, and `GlobalInventory` roles without asserting a concrete
geometric realization predicate. Its proved target stack is:

1. `Problem97.MultiCenter.ProfileRealizationSurface.profileStepExtends_of_extendCap`;
2. `Problem97.MultiCenter.ProfileRealizationSurface.localRealized_stepPersistent`;
3. `Problem97.MultiCenter.ProfileRealizationSurface.localInventory_stepPersistent`;
4. `Problem97.MultiCenter.ProfileRealizationSurface.exists_localInventory_stabilizesAt`;
5. `Problem97.MultiCenter.ProfileRealizationSurface.predicateGlobalSubsetsLocal_of_globalSound`;
6. `Problem97.MultiCenter.ProfileRealizationSurface.predicateLocalCompletesGlobalFrom_of_completion`;
7. `Problem97.MultiCenter.ProfileRealizationSurface.predicateLocalCompletesGlobal_of_completion`;
8. `Problem97.MultiCenter.ProfileRealizationSurface.globalCodeInventory_stabilizesAt_of_local_stabilizesAt_of_completion`;
9. `Problem97.MultiCenter.ProfileRealizationSurface.globalSemanticInventory_stabilizesAt_of_local_stabilizesAt_of_completion`;
10. `Problem97.MultiCenter.ProfileRealizationSurface.globalCodeInventory_stabilizesAt_of_local_stabilizesAt_of_completionFrom`;
11. `Problem97.MultiCenter.ProfileRealizationSurface.globalSemanticInventory_stabilizesAt_of_local_stabilizesAt_of_completionFrom`;
12. `Problem97.MultiCenter.ProfileRealizationSurface.exists_globalCodeInventory_stabilizesAt_of_local_stepExtends_of_completion`;
13. `Problem97.MultiCenter.ProfileRealizationSurface.exists_globalCodeInventory_stabilizesAt_of_local_stepExtends_of_completionFrom`;
14. `Problem97.MultiCenter.ProfileRealizationSurface.exists_globalSemanticInventory_stabilizesAt_of_local_stepExtends_of_completion`;
15. `Problem97.MultiCenter.ProfileRealizationSurface.exists_globalSemanticInventory_stabilizesAt_of_local_stepExtends_of_completionFrom`.

This is still not a geometric extraction theorem. It records the inventory
interface that the extraction/certificate layer must instantiate, while
keeping the stabilization consequences kernel-checked and separated from any
claim that the current census artifacts have already been imported as Lean
realizations.

Certificate bridge implementation status, 2026-07-08:

- `Certificate.TypedClass` is the hand-written decoder from generated raw
  mask/count rows to semantic `JointClass` values.
- `Certificate.TypedClassBank` is generated from
  `l2_class_inventory_certificate.json`; it contains 3,375 typed raw rows,
  proves finite structural checks, and ties its first-seen and terminal counts
  back to `Certificate.ClassInventory`.
- `Certificate.Completion` now exposes profile occurrence from
  `Certificate.ProfileInventory`, typed class-bank membership, and the
  parametric map from a future certified profile/class relation into
  `ProfileRealizationSurface`.
- `Certificate.ProfileClassIncidence` is generated from
  `l2_profile_class_incidence_certificate.json`; it records the concrete
  artifact relation from generated profile rows to typed class rows.  The JSON
  carries all 977,975 profile/class pairs, while Lean stores the same relation
  as 40,369 contiguous class-id ranges.  The generated module proves
  `profileMetadata_eq_inventory`, `totalIncidencePairs_eq`,
  `totalCompressedRanges_eq`, and `certifies_usesTypedClassBank`.

The profile/class incidence relation exists as Lean data, and it is linked to
the typed class bank.  The previously named bridge
`CoversLocalFrom ProfileClassIncidence.certifies threshold` is too broad:
`JointClass.LocallyAdmissible` also admits L1 and empty-participant classes,
whereas the generated bank is an L2/full-participant canonical-representative
bank.  The generated module now records this as the checked obstruction
`ProfileClassIncidence.not_coversLocalFrom_certifies`.

The remaining bridge must therefore be restated before it can be closed.  Its
proof-facing shape should:

1. restrict the LOCAL premise to the L2/full-participant census surface;
2. compare arbitrary local classes to the bank modulo
   `JointClass.EquivalentUnder profile`, not literal equality to a canonical
   representative; and
3. add the verified enumerator-completeness layer analogous to the pinned DFS
   bridge: candidate completeness, prefix/count invariants, and a sharded
   accepted-key/incidence proof.

The corrected interface now lives in `Certificate.Completion`.  The predicate
`L2FullLocal profile cls` is the scoped local premise; the predicate
`HasCertifiedRepresentative certifies profile cls` is the
profile-automorphism closure of literal bank certification; and
`CoversL2FullLocalModuloFrom certifies threshold` is the remaining scoped
completion obligation.  The theorem
`completesL2FullFrom_surfaceFromCertifiedRepresentatives_iff` identifies this
with the corresponding representative-closed realization surface.  The
generated incidence module defines `representativeSurface` and proves
`hasCertifiedRepresentative_of_certifies`, so exact incidence witnesses already
feed the corrected surface.

Only after `CoversL2FullLocalModuloFrom ProfileClassIncidence.certifies
ProfileClassIncidence.threshold` is proved should it feed the stabilization
stack.

The concrete card-11 cap-profile handoff now lives in
`lean/Erdos9796Proof/P97/MultiCenter/CapProfile.lean`. This module imports the
existing U1 cap-profile theorem and translates it into the multi-center
`JointProfile` vocabulary. It defines `JointCapIndexFrame`,
`closedCapProfileOfFrame`, and `profile554`, and proves:

1. `Problem97.MultiCenter.JointCapIndexFrame.nonempty_of_ne`;
2. `Problem97.MultiCenter.profile554_interiorCapacity_332`;
3. `Problem97.MultiCenter.closedCapProfileOfFrame_capSize_554_of_card_eq_eleven`;
4. `Problem97.MultiCenter.closedCapProfileOfFrame_eq_profile554_of_card_eq_eleven`;
5. `Problem97.MultiCenter.closedCapProfileOfFrame_interiorCapacity_332_of_card_eq_eleven`.

This closes the profile-cardinality part of the card-11 two-large-cap handoff:
under the existing U1 hypotheses, the concrete cap triple has multi-center
closed-cap profile `(5,5,4)` and interior capacities `(3,3,2)`. It still does
not prove that every LOCAL class over that profile is globally realized.

## Next formalization phase

The remaining Lean work is no longer generic inventory formalization or
cardinality-profile handoff. It is to instantiate the profile-facing interface
in:

```text
lean/Erdos9796Proof/P97/MultiCenter/Realization.lean
```

`ProfileRealizationSurface` already supplies the Lean names corresponding to
`ProfileOccursAtN`, `RealizesJointClass`, `LocalInventory`, and
`GlobalInventory`, with inventories over `LocalJointClassCode`. The semantic
projection to `JointClass` is available through
`CodeInventory.semanticInventory` and `localJointClassCodeSemanticInventory`.

The first geometry-facing theorem should be local extraction:

```lean
theorem extractedClass_locallyAdmissible
    (h : TailConfiguration ...) :
    (extractedClass h).LocallyAdmissible (extractedProfile h)
```

This proof is field-by-field: support, center use count `= 4`, cap
capacity, H1, pair shared count, and the Q3 joint-kill cuts. Once this
lands, `LocalJointClassCode.codedBy_of_locallyAdmissible` gives the
finite key for the extracted semantic class.

The first actual general-`n` theorem to target is persistence:

```lean
theorem localInventory_stepPersistent :
    StepPersistent LocalInventory
```

The intended proof is to extend a realizing profile by adding one
unused interior label in a cap and leaving the existing incidence data
unchanged. The realization predicate must therefore either allow unused
labels or specify a safe default class for the new label. The C4
saturation check is the main local condition to verify; the finite
alphabet itself is already handled.

After `localInventory_stepPersistent`, the qualitative stabilization
corollary is immediate:

```lean
exists_stabilizesAt_of_stepPersistent_localJointClassCode
  localInventory_stepPersistent
```

That proves eventual LOCAL stability, but it does not lock the observed
threshold. For a quantitative statement such as stability from `n = 25`,
one of two upper-bound routes is still required:

1. a constructive completeness theorem showing every scoped L2 local finite
   key appears, modulo profile automorphism, by the threshold; or
2. a certificate-import route proving the census artifact faithfully
   enumerates all scoped L2 local keys up to that threshold.

T1 (`LOCAL => GLOBAL`) should come after the persistence/extraction
surface unless a constructive completion argument is already in hand.
T1 is the right ingredient for identifying the stable LOCAL alphabet
with the GLOBAL inventory, but it is not the shortest route to the first
general-`n` theorem.

## What should not be formalized first

1. Closed forms for the number of classes.
   The data does not currently suggest a reliable theorem there.

2. A direct counting proof of stabilization.
   The evidence points to persistence, not to a combinatorial count
   identity.

3. A two-center theorem as if it were sufficient.
   The Q3 probe already showed that two-center coupling is
   composition-insufficient for the live tail.

## Deliverable shape

If this line succeeds, the natural theorem stack is:

1. a formal definition of L2 PROVEN classes;
2. a one-step persistence theorem;
3. a `LOCAL` alphabet constancy theorem above a threshold;
4. a corollary giving eventual constancy from persistence plus finiteness
   of the `GLOBAL` class alphabet;
5. then a quantitative stabilization theorem, likely via T1 plus the
   stable `LOCAL` alphabet or an equivalent upper-bound route;
6. finally, a slot-3 tail application that feeds the U4 proof route
   rather than the slot-2 erased-pin certificate frontier.

That is the proof-facing route suggested by the census. Further brute
force beyond the proved tier stabilization window is now secondary.
