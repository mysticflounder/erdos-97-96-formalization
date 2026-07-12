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
   every completed chunk through `n = 64`: no new `LOCAL` class keys appear
   on `n = 29..64`, and no previously seen `LOCAL` class disappears.

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
  `n = 64`;
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

## Separate PIN-GENERAL probe surface (2026-07-10)

The global confinement probe in `census/global_confinement/` reuses the
L2/PROVEN row alphabet, but it is not evidence for T1--T4 and must not be
folded into their theorem statements.  It adds a fixed pinned class, a marked
exact dangerous class through a deleted surplus point, six audit rows, cyclic
cross-separation, and a full one-row-per-center extension.  Its target is the
PIN-GENERAL producer `RowwiseConfinedQDeletedClasses`, not the U4 tail.

On the canonical adjacent labeled placement, the exact declared-shadow scans
at `n = 11,12` leave two dangerous-row types with no full-center extension at
either size:

```text
(m,s,l,r) = (0,0,2,2)
(m,s,l,r) = (0,2,0,2)
```

These are candidates for fixed-pin global exclusion lemmas.  The follow-up
scan verifies both types at every ordered surplus source/deletion placement at
`n = 11,12` (12 and 20 placements, respectively).  The filtered `n = 13` scan
then checks all 30 ordered placements for just these two types: all 600
`(0,0,2,2)` and 1,200 `(0,2,0,2)` scenarios are UNSAT.  This completes the
larger-cardinality probe gate, but the candidates are still not general-`n`
theorems.  The node-zero core pass covers every one of the 2,888 zero-type rows
at `n = 11,12,13`: 1,444 are fixed-pair overlap/cross-separation failures and
1,444 have an empty `Moser-2` domain after Q3/overlap/cross-separation
filtering.  Thus finite core extraction is complete and compresses to three
stable rejection families.

A separate source-indexed scan encodes the no-q-free implication of
`CriticalShellSystem`; all 517 placement/type representatives remain SAT with a
compatible K4 at every center.  The all-frame coupling to the audit alternatives
is also complete: q-critical is 4,198 SAT / 795 UNSAT across 4,993 scenarios,
and simultaneous q-deleted survival is 12,894 SAT / 2,546 UNSAT across 15,440
frames.  Targeted retries resolve every initial node cap.  In Lean,
`CriticalShellSystem` retains the no-q-free fact and its center-erased
projection.  Thus the placement, shell-interface, and shell/audit coupling
concerns are resolved, but many declared-shadow models survive.  The proof plan
for either zero-extension candidate is now:

The separate metric-realizability pass is now fully mined.  Among the 1,325
saved row systems, the structural partition is 1,264 duplicate-center, 31
exact-off-circle, 20 perpendicular-bisector, 9 cyclic five-point, and 1 cyclic
rhombus/equilateral contradiction.  The last three obstruction schemas have
general, core-only Lean consumers in `Census554.EqualityCore`,
`Census554.ConvexFivePointCore`, and `Census554.ConvexRhombusCore`.  This gives
direct contradictions for the saved assignments, but it does not prove that
an arbitrary PIN-GENERAL frame is represented by the saved assignment domain.
The proof-facing next step is therefore a total metric-core producer or a
finite-code completeness bridge, including `EqualityCore.Realizes` data and all
required cyclic signed-area facts.  The bridge must explicitly reconcile the
probe's positive-cross order with `ConvexCyclicOrder.hneg_of_ccw`, which uses
negative `signedArea2` on increasing Lean boundary indices.

The realization-side pieces of that bridge are now DONE. The arbitrary carrier
has a canonical `RowPattern` and `Realizes` proof; eleven proved obstruction
families have one shell-aware alternative and complete consumer; the cyclic families
have negative-orientation wrappers; and `BoundaryIndexing` maps every carrier
label injectively into one CCW boundary enumeration. `PinnedCarrierBridge`
preserves the pinned exact row, a surplus-apex selected row containing the
deleted source, and one extracted dangerous critical row in the same shell
system and faithful pattern. The strict `5 < surplusCap.card` hypothesis is
also consumed to prove that the strict surplus interior has at least four
points. The open step is no longer label or orientation transport. It is the
geometric producer that finds a sound core, or a shared pair with a strict
boundary-interval rank decrease, in every arbitrary aligned PIN-GENERAL frame.

Minimal row closure does not supply that producer. Although every proper
nonempty row-closed subset has an escaping row, an escape can return to older
support, an ambient critical shell can stay internal, and adjacent row steps do
not compose equality closure. Any general-`n` use of the census therefore needs
an explicit convex-order transition, not only the finite class alphabet or its
stabilization lemmas.

The strengthened surplus-source probe prevents a further overclaim. Requiring
the surplus-apex row to contain the deleted point still leaves bounded incidence
assignments with none of the five schemas used by the first scan. The complete
v4 scan includes equal-K4, equilateral-bisector, three-triad, and surplus-source
collision and ends at 167 `UNSAT`, 250 `SAT`, and 100 `INDETERMINATE` packets.
Six-row-anchor and seven-point-orbit collision are now proved tenth and eleventh
consumers. They kill the saved packet-85 and packet-181 witnesses but do not by
themselves classify those packets. Schema v5 inherits only the 167 monotone v4
`UNSAT` rows and is rerunning every old `SAT` or `INDETERMINATE` packet. Packet
54 remains capped and `INDETERMINATE`; packet 177 survives direct eleven-core
replay and has an exact QQ unit-ideal candidate whose direct Lean `grobner`
proof exceeded the memory cap. Consequently neither the stabilized L2/LOCAL
alphabet nor the three aligned rows proves eleven-family completeness. The
assignments are not Euclidean models. The remaining obligation is a total
PIN-GENERAL producer from additional shell/audit geometry, not another consumer
for one adjudicated saved witness.

The boundary-descent route is now specified below the slogan level. The current
aligned packet supplies only one shared point between the surplus and dangerous
rows. It does not produce the second shared support point or the
`SharedPairSeparationCore` needed before `BoundaryIndexing.sharedPair_satisfied`
applies. Even after that core is produced, the smaller boundary interval must
inherit an active audit/blocker state. Once those two facts exist, ordinary
finite-interval cardinality supplies the strict rank decrease; no new cyclic
well-founded relation is needed.

Applying `CriticalShellSystem` to all four members of the surplus-apex selected
class does not close the first gap. It proves that each source belongs to its own
chosen shell, but it does not force another surplus-class point into that shell
when the chosen blocker is distinct from the surplus apex. Packet 177 realizes
this one-point-intersection obstruction inside the bounded incidence shadow.

1. `SurplusCOMPGBank.btw_sep` is now generic over an arbitrary `Fin n` CCW
   convex enumeration, and `BoundaryIndexing.sharedPair_satisfied` supplies the
   carrier-to-boundary-index bridge. Use it to package the fixed-pair
   cross-separation branch and prove the strict interval inclusion needed for
   descent. The existing
   `SelectedFourClass.inter_card_le_two` already discharges the other atom.
2. Wire K-Q3-1 through
   `SurplusCapPacket.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`:
   for one `i : Fin 3`, map the two Moser selected classes to
   `triangleByIndex i`.v2/.v3, map two distinct shared support points to
   points outside `capByIndex i`, and discharge its four distance hypotheses
   with `support_eq_radius`. The normalized K-Q3-5 scalar kernel is now
   `Problem97.q3_shared_interior_false_normalized`. Its MEC-disk and scalar
   nonobtuse-apex inputs are already supplied by the kernel-checked
   `CircumscribedMECPacket.normSim_mec_disk_normalized` and
   `CircumscribedMECPacket.normSim_nonobtuse_at_v3_normalized`. The complete
   core-only indexed-cap adapter is now
   `SurplusCapPacket.q3_shared_interior_false_of_indexed_cap`: it rotates the
   MEC packet into the cap support-chord frame and derives every normalized
   scalar premise from a noncollinear indexed cap, `z` in the strict cap
   interior, `p`/`q` in the two adjacent strict interiors, and shared
   `SelectedClass` radii at the two cap endpoints. Its orientation-free wrapper
   reverses the frame and swaps `p`/`q` when needed, while adjacent-cap
   membership supplies the strict side products. The remaining work is to
   extract those three points and four class memberships from the selected-
   class branch. Those source facts are not discharged by the Q3 hand argument
   or its lemma-level solver checks alone.
3. Define a geometric-to-code extractor for a concrete
   `SelectedFourClass` at Moser center 2. Prove that it yields an L2/full LOCAL
   `ProfileClassIncidence` code, preserves cap counts and shared labels, and
   transports overlap, separation, and Q3 compatibility to the finite-code
   predicates.
4. Apply `ProfileClassIncidence.finiteCodeWitnesses` (or
   `coversL2FullLocalModuloFrom`) to exhaust the Moser-2 code. Add a finite
   certificate consumer showing that every code in the two stable patterns
   has one of the recorded rejection signatures. The existing certificate
   does not supply step 3.
5. Package the fixed-pair and Moser-2 branches as fixed-pin elimination lemmas
   for `(0,0,2,2)` and `(0,2,0,2)`, then use them only as leaves in the
   PIN-GENERAL dangerous-row case split. They do not cover the many other
   surviving dangerous-row types and therefore do not by themselves prove
   `RowwiseConfinedQDeletedClasses`.

The scan also prevents an overclaim: `(0,0,0,4)` has no extension at any
`n = 11` placement but reappears at `n = 12`.  It is not a theorem candidate.
See `census/global_confinement/` for the canonical, all-placement, `n = 13`,
zero-type-core, source-indexed, and shell/audit artifacts and the SAT/UNSAT
interpretation.

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

At that checkpoint, the remaining bridge had to be restated before it could be
closed. Its proof-facing shape was required to:

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
`CoversL2FullLocalModuloFrom certifies threshold` is the scoped completion
obligation later discharged by the finite certificates below.  The theorem
`completesL2FullFrom_surfaceFromCertifiedRepresentatives_iff` identifies this
with the corresponding representative-closed realization surface.  The
generated incidence module defines `representativeSurface` and proves
`hasCertifiedRepresentative_of_certifies`, so exact incidence witnesses already
feed the corrected surface.

`CoversL2FullLocalModuloFrom ProfileClassIncidence.certifies
ProfileClassIncidence.threshold` is now proved by the certificate stack below.
It may feed proof-facing representative-surface arguments, but it must not be
identified with geometric GLOBAL realization without an additional soundness
bridge from the generated surface to configurations.

Bridge implementation progress, 2026-07-09:

- `Certificate.LocalClassEncoding` now proves the raw mask/count encoding
  round trip needed before a semantic `JointClass` can be compared to generated
  `RawClassRow` data.  In particular, an L2 supported class satisfies
  `(rawRowOfClass cls).toJointClass = cls`.
- `Certificate.Completion.rawRowOfClass_toJointClass_of_l2FullLocal` exposes
  that round trip from the corrected `L2FullLocal` premise.
- `Certificate.ProfileClassBridge` proves
  `ProfileClassIncidence.hasCertifiedRepresentative_of_incidence_row`, which
  packages the final finite witness shape: an incidence row, a typed class row,
  a range-membership check, and a profile-equivalence proof directly produce
  `HasCertifiedRepresentative`.
- The same bridge module proves
  `ProfileClassIncidence.exists_incidenceRow_of_profileOccursAtN`, moving from
  the public `profileOccursAtN` premise to the matching generated incidence
  row, and
  `ProfileClassIncidence.coversL2FullLocalModuloFrom_of_incidenceWitnesses`,
  reducing the public completion theorem to finite row/class representative
  witnesses.
- `ProfileClassIncidence.coversL2FullLocalModuloFrom_of_codeWitnesses` further
  reduces the remaining generated certificate target to the finite
  `LocalJointClassCode` alphabet.  This avoids asking the finite certificate to
  quantify directly over arbitrary semantic `JointClass` values with unbounded
  `Nat` count fields.
- `ProfileClassIncidence.completesL2FullFrom_representativeSurface_of_codeWitnesses`
  composes that finite-code witness theorem into the
  `Completion.CompletesL2FullFrom representativeSurface threshold` surface that
  downstream stabilization arguments should consume.
- The concrete bridge target at that checkpoint was named
  `ProfileClassIncidence.FiniteCodeWitnesses`.

Enumerator checkpoint, 2026-07-09:

- `Certificate.LocalEnumerator` now compiles.  It enumerates the 21 nonempty
  cap/mask count cells with a proved recursive completeness invariant and the 64
  self-avoiding Moser-mask assignments.  Its optimized search tracks twelve
  monotone budgets: three exact center-use budgets, six H1 budgets, and three
  pair-sharing budgets.
- The same module proves `rawRowOfClass_mem_acceptedRows`: every semantic
  L2/full-participant `JointClass` satisfying `LocallyAdmissible` is represented
  by a row accepted by the independent finite enumerator.  The optimized
  explicit-list LOCAL checker is proved extensionally equal to the semantic
  `JointClass` predicates.
- `Certificate.LocalEnumeratorCertificate` now compiles.  It proves equality
  between the sorted support-data key lists from the accepted enumerator and all
  3,375 rows of `TypedClassBank`; the optimized native check completes in under
  30 seconds.  Consequently every accepted enumerator row has a typed-bank row
  with the same decoded `JointClass`, and every L2/full LOCAL semantic class has
  such a typed-bank witness.
- `Certificate.ProfileSymmetry` proves that all six center-permutation codes
  induce `JointProfile.Automorphism` values when they preserve the profile.
  `Certificate.ClassPermutationTable` checks all 20,250 source/code table
  entries against semantic class transport, and
  `Certificate.ClassPermutationBridge` extracts typed target rows with
  `EquivalentUnder` proofs.  All three modules compile.
- `Certificate.ProfileClassCoverageCertificate` compiles its finite check over
  all 489 generated profile rows and 3,375 typed class rows.  Every
  capacity-compatible source row reaches an incidence class ID under one of the
  profile-preserving permutations.
- `Certificate.ProfileClassCompletion` proves
  `ProfileClassIncidence.finiteCodeWitnesses`,
  `ProfileClassIncidence.coversL2FullLocalModuloFrom`, and
  `ProfileClassIncidence.completesL2FullFrom_representativeSurface`.

Thus the enumerator-completeness bridge and `FiniteCodeWitnesses` are closed.
This is completeness for the generated representative surface.  It does not by
itself prove the geometric extraction/soundness theorem or T1's LOCAL-to-GLOBAL
realization claim; those remain in the next formalization phase below.

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

## PIN-GENERAL card-eleven finite handoff (2026-07-11)

This is a separate use of the incidence machinery and does not strengthen T1--T4.
The strict PIN-GENERAL branch has now been reduced in Lean to one finite size:

- `surplus_card_le_six_of_convexIndep_K4` proves the surplus cap has at most
  six points;
- `surplus_card_eq_six_of_convexIndep_K4` turns `5 < m` into `m = 6`;
- `card_eq_eleven_of_surplus_card_gt_five` proves `A.card = 11`; and
- `exists_orderedSurplusCapSix_with_selected_hitCounts` proves exact selected
  cap intersections `(1,1,2,2,2,2)` along the ordered surplus cap.

`Census554.CapSelectedFiniteCode` records the resulting `(6,4,4)` eleven-label
surface and twelve generic metric-core alternatives. Its cyclic five-point and
rhombus branches are explicitly invariant under reversal of the boundary
orientation. The direct finite enumerator exhausts all twelve ordered
pin-source/deleted-point placements with zero residual patterns; this is exact
inside the declared finite model and uses no prose-only tuple exclusions.

The handoff is not complete until two theorems land. First, a cap-aware
geometric labeling must map every live card-eleven carrier to the canonical
`Fin 11` labels and prove the full incidence, blocker, closure-color, and hull
order contract. Second, a kernel-checked finite classifier or certificate must
prove that every code satisfying that contract has one of the twelve closure
cores. Those two results feed the existing generic consumers and target the
sole remaining `isM44PinnedSurplusGeneralMResidualsExcluded` `sorry` directly.

Implementation checkpoint: `CapSelectedNativeClassifier` now performs direct
row-mask DFS with deterministic equality closure instead of quantifying free
edge colors. Placement `(6,4)` is Lean-checked by `native_decide` in about 81
seconds. The external four-family rerun remains exhaustive with zero survivors
for all twelve placements, but the other eleven placements are not yet Lean
theorems. `CapSelectedNativeClassifierSound` proves local candidate coverage,
the fixed pinned row, and soundness of overlap, Q3, cyclic-separation, and
pairwise `rowsCompatible` pruning. `CapSelectedGeometry` separately proves the
exact `(4,2,2)` boundary-block packet in either orientation. Open work is
`pairBoundOK`, total DFS or certificate coverage, checked closure-core paths,
all-placement replay, and canonical enumeration of the three boundary blocks.
