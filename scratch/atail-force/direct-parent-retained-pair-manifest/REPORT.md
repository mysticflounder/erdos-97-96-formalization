# Direct-parent retained-pair manifest

**Status:** source-audited contract; no finite search has been admitted yet.

**Live consumer:**
`Problem97.ATailFrontierLiveClosure.false_of_frontierBiApexRobustResidual`.

This report implements the 2026-07-20 direct-parent plan.  It is deliberately
not a new conditional Lean adapter.  Its purpose is to make the next producer
or finite model source-faithful: it must either construct an existing terminal
core or identify a missing full-parent invariant.  A literal selected-row
model that omits any required field below is not evidence about the live
theorem.

## Fixed live input

The target receives

```lean
F : CriticalPairFrontier D S radius H
R : FrontierCommonDeletionParentResidual F
B : FrontierBiApexRobustResidual R
```

The following facts are retained, rather than reconstructed from a row
abstraction.

| Source field | Required use in a candidate proof/search |
|---|---|
| `F.pair` | Distinct sources `q,w`, outside `S.surplusCap`, in one positive first-apex radius class. |
| `F.secondApexDouble` | A K4 witness survives after deleting both retained sources at the physical second apex. |
| `R.common.firstApexDouble` | The corresponding first-apex double-deletion witness. |
| `R.common.packet` | The actual common-deletion two-center packet, not an anonymous equal-distance row. |
| `R.minimal` | Global minimality; a proper K4-closed carrier, if constructed, is contradictory. |
| `R.noM44` | May be used only after constructing a genuinely new `SurplusCapPacket`; it is not a scalar inequality. |
| `R.frontierRadius_class_card_ge_four` | The retained first-apex radius class has at least four points. |
| `B.secondApex_robust` and `B.firstApex_robust` | Every one-point deletion at both physical opposite apices has K4. |
| `H.selectedAt`, `H.no_qfree_at` | One *complete* critical radius class and its deletion-blocker fact for every source of `D.A`. |
| `D.convex`, `S` | Actual oriented boundary and Moser-cap/MEC geometry. |

The `CriticalShellSystem` rows are full radius classes.  Replacing a row by a
chosen four-subset is unsound for this campaign unless the model separately
records the complete radius partition and proves that the reduction preserves
the intended conclusion.

## First split: the retained pair at its actual blocker

The already-proved theorem

```lean
ATailCriticalPairFrontier.cross_deletion_survives_or_cross_membership F.pair
```

has exactly two outcomes.  Production packages them as
`FrontierDirectedBlockerOutcome R.common` in
`ATail/FrontierCommonDeletionEscape.lean`.

### A. Cross membership

```lean
w ∈ (H.selectedAt q q_mem).toCriticalFourShell.support
centerAt q q_mem ∉ S.surplusCap
```

This is a genuine positive equality: the chosen blocker for `q` is
equidistant from the retained pair.  It must not be reported merely as a
one-row fact.  The next theorem must use the full parent to produce one of:

1. an `OrderedCrossRowCore` (a second source `J`, its actual blocker row, the
   `K ∈ J` row membership, and the required boundary order);
2. a `SameCapCollisionPairCore` (a distinct, source-faithful second center in
   the same physical cap as the common blocker, with both retained sources
   outside that cap); or
3. a direct geometric contradiction whose hypotheses visibly include a
   full-shell/no-`qfree_at`, oriented-cap/MEC, or minimality field above.

The local pair equality alone does **not** supply a second center, an order,
or a cap collision.  Existing `CriticalFiberClosingCore` consumers therefore
cannot be invoked from it directly.

### B. Companion common deletion

```lean
CommonDeletionTwoCenterPacket D H w S.oppApex1 (H.centerAt q q_mem)
```

This is a source-faithful two-center packet for the companion `w`, together
with the original first-apex double deletion retained in `R`.  It is useful
only if it makes non-returning progress.  The next theorem must do one of:

1. expose a second actual critical row with a cross membership needed by an
   existing closing core;
2. construct a proper K4-closed subcarrier and use `R.minimal`;
3. construct a new Moser support triangle and use `R.noM44`; or
4. prove an oriented cap/MEC localization that forces (1), (2), or (3).

Repackaging this packet as a new robust/deletion/survival wrapper is rejected:
it is a recurrence, not a producer.

## Required terminal interface

The immediate checked endpoints are in
`ATail/CriticalFiberClosingCore.lean`:

| Endpoint | Missing positive data that must be produced |
|---|---|
| `OrderedCrossRowCore.false` | A repeated critical fiber, one actual row through its right source, and the concrete six-role cyclic order. |
| `SameCapCollisionPairCore.false` | A second distinct center, both centers in one cap, and the retained pair outside that cap. |
| A direct cap/MEC or minimality theorem | Its exact new geometric antecedent and a proof that it follows from the full parent. |

`CriticalFiberClosingCore` is a terminal contract, not a source of the
missing cross-row occurrence.  A theorem whose conclusion is only another
fiber, row, selected-four class, or survival fact is not an admissible
successor unless it immediately constructs one of these endpoint objects.

## Cross-membership audit: what the full parent adds

This audit was carried out against the current production source, not a
selected-row shadow.

`FrontierCommonDeletionConsumerNormalForm` already supplies an escape point
`z` in the stored physical-second-apex row such that

```text
z is not in q's complete critical support;
the q-blocker survives deleting z;
z is either in the surplus cap or off the retained first-apex radius.
```

On the cross-membership arm, write `o = S.oppApex1`,
`b = H.centerAt q q_mem`, and `c = H.centerAt z z_mem`.  The live fields
prove the following two strict facts.

```text
c != b     (b survives deletion of z, while c is critical for deleting z)
c != o     (the bi-apex robust residual makes o survive deletion of z)
```

Thus the escape does produce a genuinely third *actual blocker*, not merely a
fresh row name.  This is the strongest immediate consequence of combining the
escape with `B`; it is the right fixed role for a source-faithful model.

The fact is kernel-checked in
`EscapeThirdBlocker.lean` as
`escape_blocker_ne_known_pair_centers`; its direct axiom closure is only
`propext`, `Classical.choice`, and `Quot.sound`.  It stays in scratch because
it is a role constraint, not a terminal consumer.

It still does not give the terminal cross membership.  The checked
`ThirdCenterCommonPair` classifier says precisely that a third blocker whose
row contains *both* retained sources is impossible: such a row would make
three carrier centers lie on the pair's perpendicular bisector.  Applied to
`c`, the classifier only yields that at least one of the deletions of `q,w`
survives at `c` (away from the protected exact-card-four alternative),
equivalently that the `c`-row omits at least one of `q,w`.  It does not force
either retained source into that row.

This rules out a tempting but wrong next theorem: asking for a third blocker
whose row contains both retained sources would itself contradict the
perpendicular-bisector bound.  The prior `AnchoredDoubleDeletionProducer`
audit also proves that, outside the exact-card-four alternative, the total
map yields a source-indexed **two-deletion survival cover**: every source
outside the at-most-four-source `q`-blocker fiber preserves deletion of `q`
or of `w` at its actual blocker.

The next targeted producer is therefore a geometric consumer of that survival
cover.  It must use the oriented cap/MEC placement, the two physical robust
apices, and at least one global parent field to show that the six-or-more
outside-fiber sources cannot all lie in the two survival classes.  The escape
role `(z,c)` is a distinguished test point for this theorem, not a request to
manufacture an impossible third double-blocked row.

An admissible conclusion is still either a completed `OrderedCrossRowCore`,
a `SameCapCollisionPairCore`, a retriangulated `IsM44` packet, or `False`.
A proof that merely re-derives the survival cover, that `c` omits one of
`q,w`, or that another common-deletion packet exists, is not progress toward
any endpoint.

## Chosen direct-parent theorem shape

The survivor-cover audit also found an important routing limit: the existing
card-≥14 cover can manufacture another physical-second-apex common-deletion
packet, but its robust outcome returns to the same robust/critical split.  It
is therefore not the generic `B` closer.

The full bi-apex endpoint has a stronger, nonrecursive source seed.  Since
both physical apices are omitted by the retained blocker endomap,
`FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber` supplies two
nontrivial blocker fibers or a three-source fiber.  The immediate theorem to
prove is consequently the terminal-facing coverage statement

```lean
nonempty_criticalFiberClosingCore_of_biApexRobust
  (F : CriticalPairFrontier D S radius H)
  (R : FrontierCommonDeletionParentResidual F)
  (B : FrontierBiApexRobustResidual R) :
  Nonempty (CriticalFiberClosingCore R)
```

possibly with an internal retriangulated-`IsM44` branch discharged to `False`
before it returns.  This is not a new intermediate interface: its sole caller
immediately applies `false_of_criticalFiberClosingCore`, closing the live
robust parent theorem.

The known smallest missing payload is source-indexed and geometric.  After
choosing a collision pair `C,K` with common blocker `A` and an external source
`J` with blocker `X`, prove either the ordered row data

```text
dist(O,J) = dist(O,C),   K in selectedAt(J).support,
O < A < X < J < C < K,
```

or the same-cap collision data for the pair `C,K`.  The two physical robust
apices, full exact shell map, oriented cap/MEC boundary, and one global parent
field must all remain in scope.  The existing source-indexed
`cross-row-mining-manifest` is the acceptance contract for this theorem; its
explicit gate forbids a broad run until a whole-parent coverage model exists.

The existing whole-carrier bi-apex audit also excludes a shortcut: its
faithful boundary/critical-map extraction has an exact card-11 structural SAT
shadow after every pure Kalmanson/Farkas consumer in the current bank is
removed.  Therefore no further literal ordinal, linear-distance, or
Kalmanson-only mining is licensed here.  The first new model/proof field must
be nonlinear planar Euclidean rank, full exact-radius filtering, or actual
MEC/cap placement coupled to the common critical map; only then may it test
the terminal-coverage theorem above.

## Solver/model admission contract

Any prospective finite or nonlinear search instance must encode all of the
following before its SAT/UNSAT result is used to redirect proof work.

1. **Carrier geometry:** distinct cyclic boundary roles, orientation signs for
   every claimed order relation, and the actual Moser-cap/MEC membership
   needed by the targeted terminal.
2. **Complete critical system:** for every carrier source, a blocker center,
   its full exact-radius class, source membership, and `no_qfree_at` as a
   statement about the whole class after source deletion.
3. **Retained frontier:** the same-radius off-surplus pair, both prescribed
   double-deletion witnesses, and the first-apex class-cardinality condition.
4. **Bi-apex robustness:** a K4 witness for every one-point deletion at both
   physical opposite apices, with a coverage map from each source to its
   witness.
5. **Global parent:** either a source-level encoding of minimality/no-M44 or a
   theorem-backed reduction showing precisely why the proposed target does not
   need one of them.
6. **One fixed target:** a concrete terminal core, a direct `False`, or one
   named intermediate invariant whose next consumer is already checked.

The harness must emit a role-to-source map and a coverage audit.  A raw CNF,
an arbitrary selected-four-row shadow, or a linear Kalmanson quotient that
lacks these maps is diagnostic only.  SAT then refutes only that abstraction;
UNSAT is not a Lean theorem without a source-coverage proof and a checked
certificate/reconstruction.

## Next executable move

Audit the cross-membership arm first against the full `H` partition: determine
whether `no_qfree_at` plus the two physical robust apex witnesses forces a
second row containing one retained-pair member.  The output is either:

* a fully specified `OrderedCrossRowCore` or `SameCapCollisionPairCore` input,
  followed immediately by a focused Lean theorem; or
* an explicit realizable full-parent countermodel/compatibility certificate
  showing that this occurrence is not forced, which promotes the companion
  common-deletion/minimality route instead.

No 555/654 literal mining, arbitrary-row enumeration, or expansion of the
linear Kalmanson quotient is permitted until that audit has a source-valid
model and a fixed terminal target.
