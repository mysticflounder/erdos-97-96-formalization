# Source-wide Lean simplification and strengthening audit

Date: 2026-07-27.

Scope: all indexed Lean declarations in this worktree, with focused source
inspection of the published P96/P97 dependency graph, the live A-tail frontier,
its handwritten producers and consumers, theorem-bank candidates, scratch and
attic material, and the interfaces and trust boundaries surrounding generated
certificate families.

This is an audit snapshot of a shared, actively edited worktree. Symbol names
and dependency relationships are the durable references below; line numbers
and raw frontier counts must be refreshed before implementation.

## Executive result

The audit found:

1. one high-level architectural bypass whose replacement proof typechecked on
   Lean 4.27;
2. one typechecked packet symmetry that should eliminate a duplicated live
   terminal after coordinator rewiring;
3. one source-derived consolidation that should replace four blocker-row
   terminals by two stronger generic terminals; and
4. one genuine U3-to-U5 theorem strengthening that would make bounded-audit
   machinery available on the live non-`IsM44` branch.

It did **not** find an existing declaration, scratch theorem, or generated
certificate that already closes one of the live terminal statements verbatim.
The first three results simplify the proof architecture and obligation
interfaces; they do not by themselves prove the remaining mathematical
contradictions.

## Implementation update

The shared tree moved after the audit snapshot.  At implementation start, a
fresh `proof-blueprint` scan found 21 direct project declarations depending on
`sorryAx`: 20 on the publish spine and one off-spine declaration,
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`.
The older 22-terminal count below is retained as the audit's original
snapshot, not as current status.

Implemented and verified on Lean 4.27:

- `RemovableVertexAxiom/Continuation.lean` now imports the live A-tail
  closure directly and calls
  `false_of_twoLargeCaps_commonCriticalMap`.  Its focused build passes, and
  `U1LargeCapRouteBTail.lean` no longer has a production importer.
- `U5DangerousTriple.exists_two_off_circle_aux_of_card_gt_nine` is the new
  cardinality-first U5 API.  The old `IsM44` theorem is a compatibility
  wrapper.
- `U3LocalizedNoQFreePacket.exists_fixedTripleAuditFrame_of_card_gt_nine` is
  the corresponding cardinality-first U3 API.  The old `IsM44` theorem is a
  compatibility wrapper.
- Both cardinality-strengthened modules pass focused builds.  The new
  declarations use only `propext`, `Classical.choice`, and `Quot.sound`.

Implemented and awaiting the combined live-closure build:

- `FreshOutsideSecondBlockerFiber.toSwappedFirst` identifies the second-side
  packet with the swapped first-side packet.
- `capSourceThirdCanonicalRowSurface_swap` transports the cap-source surface
  across the same row swap.
- `false_of_capSource_freshOutsideSecondBlockerFiber` now reconstructs the
  row-indexed residual data for the swapped collision and calls the existing
  first-fiber theorem instead of remaining an independent `sorry`.

Still pending:

- the four-to-two blocker-row terminal consolidation, after the active
  source-heavy lane hands off that source region;
- the survival/omission view cleanup; and
- the exact blocker-equivalence normal form cleanup.

## Evidence labels

- **TYPECHECKED:** a synthetic Lean 4.27 proof or adapter elaborated without
  proof errors.
- **SOURCE-DERIVED:** the required hypotheses are visibly produced by the
  current coordinator, but the proposed replacement declaration and all
  consumer rewrites have not yet been compiled together.
- **DEPENDENCY-AUDITED:** all relevant theorem bodies and direct dependencies
  were inspected, but the strengthened theorem has not yet been written and
  built.
- **NEGATIVE SEARCH RESULT:** exhaustive over the indexed declarations or
  named source regions described, not a mathematical impossibility result.

## Frontier baseline

At the audit snapshot:

- there were 22 direct project declarations depending on `sorryAx`;
- all 22 were kernel-live from a published target;
- all 22 were in
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`;
- no project declaration had exactly the type of any one of those 22
  obligations; and
- no live obligation was merely an off-spine or orphan placeholder.

The source-wide exact-type comparison is stronger than a textual theorem-name
search, but it does not rule out a reusable theorem whose statement needs a
nontrivial adapter.

## 1. Bypass `U1LargeCapRouteBTail` from the production continuation

Status: **IMPLEMENTED / BUILD VERIFIED**.

Changed consumer:

`Problem97.RemovableVertexAxiom.removableVertexOfLarge_of_nonIsM44` in
`lean/Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean`.

Former route:

1. construct `D : CounterexampleData`;
2. prove `D.Minimal`, `9 < D.A.card`, and absence of an `IsM44` packet;
3. obtain `Nonempty (CriticalShellSystem D.A)`;
4. construct a MEC cap triple;
5. split exact-pair versus non-exact surplus; and
6. call `u1_largeCap_routeB_tail_false`.

The first three steps already produce exactly the inputs of:

`Problem97.ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`

```lean
(S : SurplusCapPacket D.A)
(hmin : D.Minimal)
(hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
(hcard : 9 < D.A.card)
(H : CriticalShellSystem D.A) :
False
```

The replacement proof used by the continuation is:

```lean
example : NonIsM44DescentStatement := by
  classical
  intro A hne hconv hK4 hgt hMin hNoM44
  obtain ⟨packet⟩ := MEC.nonempty_surplusCapPacket_of_K4 hne hconv hK4 hgt
  let D : CounterexampleData := ⟨A, hne, hconv, hK4, packet⟩
  have hDA : D.A = A := rfl
  have hDcard : 9 < D.A.card := by
    rw [hDA]
    exact hgt
  have hmin : D.Minimal := by
    intro B hBne hBconv hBK4
    by_contra hlt
    exact hMin B (not_le.mp hlt) hBne hBconv hBK4
  have hNoM44D : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44 := by
    rw [hDA]
    exact hNoM44
  obtain ⟨H⟩ := D.exists_criticalShellSystem_of_minimal hmin
  exfalso
  exact ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap
    D.packet hmin hNoM44D hDcard H
```

Import search found `Continuation.lean` to be the only importer of
`Erdos9796Proof.P97.U1LargeCapRouteBTail`. Replacing that import by the direct
A-tail dependency removed the 3,565-line, 93-declaration
`U1LargeCapRouteBTail.lean` coordinator from the published dependency graph.

This change:

- delete a redundant MEC/cap-triple reconstruction and branch split;
- remove stale commentary claiming that the old route-B residual is the live
  continuation boundary;
- add no proof obligation; and
- close no existing `sorry`: the direct A-tail terminal already reaches the
  same live frontier.

The focused continuation build passes on Lean 4.27.

## 2. Identify the second fresh blocker fiber with the swapped first fiber

Status: packet adapter **TYPECHECKED**; full coordinator rewrite untested.

The structures

- `FreshOutsideFirstBlockerFiber P Pρ`, and
- `FreshOutsideSecondBlockerFiber P Pρ`

in
`lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean`
are mirror images. A field-permutation adapter from

```lean
FreshOutsideSecondBlockerFiber P Pρ
```

to

```lean
FreshOutsideFirstBlockerFiber Pρ P
```

typechecked. The mapping:

- swaps the first- and second-side inequality fields;
- reinterprets the blocker/source-shell fields as the first-side fields under
  `P ↔ Pρ`;
- swaps the two `otherOutsidePoint` exclusion fields; and
- preserves the unordered outside-point pair equality.

The live first-fiber descent already has the substantial implementation in
`FrontierLiveClosure.lean` and
`ATail/FirstFiberOverlapDescent.lean`. The second-fiber terminal should be
rephrased as an adapter into that same descent rather than maintained as a
separate mathematical obligation.

Expected effect after complete rewiring and a fresh kernel scan: 22 live
terminals become 21. This count is a prediction, not a checked post-change
state.

The preferred implementation is a side-indexed or explicitly swap-parametric
descent theorem, so future lemmas do not rebuild a parallel second-side
library.

## 3. Consolidate four blocker-row terminals into two generic terminals

Status: **SOURCE-DERIVED**.

Four live terminals differ only by whether the actual blocker is literally
`P.v.1` or the other member of the same rigid `v` row:

- blocker-`v`, opposite-row-heavy;
- blocker-`v`, neither row heavy;
- blocker in the `v` row but not `v`, opposite-row-heavy; and
- blocker in the `v` row but not `v`, sparse rows.

The stable shared hypothesis is:

```lean
(lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
  ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell.support ∩
    SelectedClass D.A S.oppApex2 P.rho
```

The non-`v` branches already carry this hypothesis. In the blocker-`v`
branches it is derivable by rewriting the blocker equality and using the
critical shell's source/q membership together with `P.hvClass`.

The four terminals can therefore be replaced by:

1. one generic `v`-row-blocker, opposite-row-heavy contradiction; and
2. one generic `v`-row-blocker, neither-row-heavy contradiction.

The source-row-heavy terminal remains separate: its non-`v` branch has
additional exact-five/growth decomposition and is not part of this proposed
merge.

Combined with the fiber-symmetry consolidation, the structural frontier is
expected to fall from 22 to 19 declarations without hiding any mathematical
obligation. Each replacement terminal has weaker equality-specific
hypotheses and is therefore a genuinely stronger interface, but its
contradiction still has to be proved.

## 4. Generalize the fixed U3 audit frame from `IsM44` to cardinality

Status: **IMPLEMENTED / BUILD VERIFIED**.

Former primary theorem:

`Problem97.U3LocalizedNoQFreePacket.exists_fixedTripleAuditFrame` in
`lean/Erdos9796Proof/P97/U3ToU5Terminal.lean`.

It currently assumes:

```lean
hM44 : D.IsM44
```

The two uses of this assumption are cardinality wrappers:

1. `exists_selectedCandidateSkeleton_of_isM44` immediately derives
   `9 < D.A.card` and calls the already existing
   `exists_selectedCandidateSkeleton_of_card_gt_nine`;
2. `U5DangerousTriple.exists_two_off_circle_aux` uses `hM44` only to prove
   `10 ≤ D.A.card`, which is equivalent to `9 < D.A.card` for a natural
   cardinality.

The implementation now:

- exposes `exists_two_off_circle_aux_of_card_gt_nine` with
  `9 < D.A.card`;
- retains `exists_two_off_circle_aux` as a thin `IsM44` compatibility
  corollary; and
- exposes `exists_fixedTripleAuditFrame_of_card_gt_nine`, while retaining the
  former theorem as an `IsM44` compatibility corollary.

This makes the complete bounded U3-to-U5 audit frame available on the live
non-`IsM44` A-tail branch.

Focused builds of both changed modules pass on Lean 4.27.  The strengthened
theorems introduce no new trust dependency.

It does not yet close a terminal. A further bridge must do at least one of:

- exclude the q-critical alternative in
  `exists_card_four_or_qCritical_of_globalK4`;
- confine every audit center's exact q-deleted four-class to the bounded
  support required by `false_of_rowwiseConfinedQDeletedClasses`; or
- preserve enough live identities to convert the audit output into an
  existing common-deletion, cross-blocker, collision, or five-center
  terminal.

This is the most promising genuine theorem strengthening found by the audit.

## Other interface simplifications

### Preserve both survival and omission views

`ATail/TwoCollisionGlobalProducer.lean` directly produces cross-deletion
survival disjunctions in
`exists_capSource_thirdBlocker_crossPairDeletionSurvivals`.

Those facts are converted into selected-support omissions in
`CapSourceThirdCanonicalRowSurface`, then converted back into survival facts
in the first-fiber descent using
`cross_deletion_survives_iff_not_mem_selected_support`.

The packet should retain both equivalent views, or use a small structure with
the equivalence proved once. The present
survival-to-omission-to-survival path obscures the invariant and creates
duplicated adapter proof.

### Expose the exact blocker equivalence as a normal form

`ATail/AnchoredDoubleDeletionProducer.lean` proves:

`both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker`.

Later consumers weaken this to a three-way cover, prove blocker inequality,
and eliminate the equality branch. A direct off-fiber two-way survival normal
form should be exposed and consumed instead.

### Strip coordinator-derived hypotheses from live leaves

Several live terminal statements repeat facts already determined by their
producer packets:

- the low-hit leaf repeats cover, pattern, and low-hit consequences;
- the source-heavy/second-opposite-large leaf repeats blocker-row,
  blocker-inequality, interior, and growth consequences;
- the two-radius leaf repeats interior bounds, radius-card equalities, and
  positivity; and
- the two-distinct-joint-deletions collision leaf repeats four support,
  cross-membership, and intersection consequences.

The stable mathematical interfaces should retain the obstruction packet and
only those facts not recoverable from it. This strengthens the declarations
and reduces consumer brittleness, but does not alter the number of open
contradictions.

## Exact duplicate declarations and local proof duplication

The kernel-live exact-type scan found five public duplicate-type groups:

1. `CGN.CGN4g3_chordProjection_strict_of_capBlock` and
   `boundaryCap_chordProjection_strict`;
2. `FiniteEndpointShell.qEqE_row_impossible_of_reflection` and
   `qEqC_row_impossible_of_reflection`;
3. `SurplusCOMPGBank.dist_sq_coord` and
   `Census554.EqualityCore.Internal.dist_sq_coords`;
4. `ATailDeletionRobustness.fullyDeletionRobustAt_of_five_le_selectedClass`
   and
   `ATailMinimalUniqueFourCover.fullyDeletionRobustAt_of_large_class`; and
5. `boundaryBlock_openSide_iff_between_indices_of_signedAreaOrder` and
   `CGN.CGN4g4_subchord_open_side_iff_A_of_capBlock`.

Some are useful semantic aliases, but they should be one-line aliases rather
than copied proofs. The deletion-robustness pair has duplicated proof content.
The coordinate-square identity also has additional private copies and should
be centralized in one canonical geometry helper.

Further duplication:

- `FirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour` is repeated
  inline in `FrontierLiveClosure.lean`;
- the finite-endpoint-shell and surplus-cap-packet four-subpacket existence
  theorems have essentially duplicated implementations;
- two named five-point contradiction theorems have identical statements and
  proofs; and
- several modules carry private copies of `frontierRadius_pos`.

These are maintenance reductions, not proof closure.

## Scratch, attic, and theorem-bank results

Status: **NEGATIVE SEARCH RESULT** for an existing live closer.

The strongest relevant scratch results were:

- `lean/scratch/first-fiber-overlap-derivation/FiveCenterBoundary.lean`:
  five exact q-deleted rows plus a sixth distinct center whose deletion fails;
- `lean/scratch/first-fiber-global-terminal/CoreClassification.lean`:
  a non-singleton `MinimalDeletionCore` yields a fully deletion-robust center
  or failure of unique-four.

The five-center result still lacks either a sixth surviving row or a
cross-row incidence/distinctness contradiction. The bounded U5 terminal
requires six survivors plus support confinement.

The minimal-core result still lacks a proof that the relevant blocking
deletion core has cardinality at least two. A singleton core is automatically
constructible, so non-singletonness cannot be inferred formally from the
current packet.

The retired exact-five attic island is not a closure route: it lacks the
required current adapters and complete occurrence/consumer chain, and it is
off the production spine by design.

No scratch declaration was found that directly consumes the live
cross-blocker coincidence, blocker-row, or common-deletion residual packets.

## Generated-code and trust-boundary audit

The worktree contains 4,214 Lean files and approximately 52,000 indexed
symbols. Several certificate families contain thousands of generated shards;
for example, the card-eleven unique-four certificate family contains more
than 3,700 Lean files.

The audit therefore did not manually reread every generated clause. It
inspected:

- generated coordinator and coverage interfaces;
- handwritten certificate ingress;
- source-to-certificate field mappings;
- checker/soundness boundaries;
- imports into published consumers; and
- the root theorem axiom sets.

The card-eleven ingress maps the production exact-four residual into the
certificate residual field-for-field. No obvious mathematical weakening or
discarded identity was found there.

At the snapshot, both published root theorems used only the expected trust
surface:

- `propext`;
- `Classical.choice`;
- `Quot.sound`;
- `sorryAx`;
- `Lean.ofReduceBool`;
- `Lean.trustCompiler`.

This is an interface and trust-boundary audit, not a hand proof review of
every generated certificate shard.

## Simplifications that should not be attempted

The audit found no sound basis for the following:

- eliminating `ApexRichClassStructure` wholesale: its tri-apex rich
  intersections are used materially;
- merging the exact-five distinct/common branches: they are genuinely
  exclusive;
- treating the swapped unique-four branch as already covered by the robust
  route;
- merging minimal-core and nonphysical branches;
- declaring the two-radius branch vacuous;
- replacing the joint-deletion collision terminal by the common-deletion
  blocker-coincidence theorem;
- using the common-bisector triple theorem on live centers that are all
  constrained to one perpendicular bisector; or
- promoting the retired exact-five assembler island back onto the spine.

These apparent simplifications lose hypotheses, confuse distinct cases, or
do not meet the consumers' geometric assumptions.

## Recommended implementation order

1. Replace the route-B tail in
   `removableVertexOfLarge_of_nonIsM44` by the direct
   `false_of_twoLargeCaps_commonCriticalMap` call; remove the stale import and
   docstring; focused-build `Continuation`.
2. Add the second-to-first blocker-fiber swap adapter, rewrite the second-side
   coordinator to use the first-side descent, and remove the superseded
   second-side live terminal.
3. Introduce the two generic blocker-membership terminals and make the
   blocker-equality and blocker-inequality coordinators call them.
4. Generalize `exists_two_off_circle_aux` and
   `exists_fixedTripleAuditFrame` to `9 < D.A.card`.
5. Attack the first missing bounded-U5 bridge rather than adding another
   outcome or closer wrapper.
6. Perform duplicate-lemma and packet-normal-form cleanup only where it
   reduces the implementation burden of steps 2–5.

After every frontier edit:

- focused-build the touched module with `lake-build`;
- refresh both the proof-blueprint source index and reference graph;
- verify the intended spine edge and the root axiom set;
- record coordinator-interface fan-out before and after; and
- update the closure matrix from the refreshed kernel state, not from the
  predicted `22 → 21 → 19` count in this audit.
