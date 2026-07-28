# Source-wide Lean simplification and strengthening audit

Date: 2026-07-27. Implementation status refreshed: 2026-07-28.

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
2. one typechecked packet symmetry that has now eliminated a duplicated live
   terminal after coordinator rewiring;
3. one source-derived consolidation that has now replaced four blocker-row
   terminals by two stronger generic terminals; and
4. one genuine U3-to-U5 theorem strengthening that now exposes bounded-audit
   machinery under the bare cardinality hypothesis, although no live
   non-`IsM44` caller yet consumes that interface.

It did **not** find an existing declaration, scratch theorem, or generated
certificate that already closes one of the live terminal statements verbatim.
The first three results simplify the proof architecture and obligation
interfaces; they do not by themselves prove the remaining mathematical
contradictions.

## Implementation update

The implementation began from the 22 direct project declarations depending
on `sorryAx` recorded in the audit snapshot.  An intermediate
`proof-blueprint` scan incorrectly reported 21 declarations, split as 20
on-spine and one off-spine.  That discrepancy was an indexing artifact, not a
proof-state change: four coordinator declarations had their theorem names on
the line after the `theorem` keyword, so the source index omitted that chain.
A formatting-only repair put those names on the declaration line.  A fresh
kernel mine then confirmed that the omitted terminal and the apparently
off-spine blocker-coincidence terminal were both live.  The true
implementation baseline was therefore 22 on-spine declarations and zero
off-spine declarations.

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

Implemented and verified by the combined live-closure build:

- `FreshOutsideSecondBlockerFiber.toSwappedFirst` identifies the second-side
  packet with the swapped first-side packet.
- `capSourceThirdCanonicalRowSurface_swap` transports the cap-source surface
  across the same row swap.
- `false_of_capSource_freshOutsideSecondBlockerFiber` now reconstructs the
  row-indexed residual data for the swapped collision and calls the existing
  first-fiber theorem instead of remaining an independent `sorry`.

The focused `FrontierLiveClosure` build passed and refreshed the kernel call
graph.  At that checkpoint the true frontier was 21 direct `sorryAx`
declarations, all on-spine.  Thus the symmetry change removed exactly one
on-spine obligation without adding an axiom or a replacement obligation.

The four equality-specific non-source-heavy blocker-row terminals have now
been replaced by:

- `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy`;
  and
- `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows`.

Both blocker-identity coordinators consume these membership-based terminals.
The blocker-`v` coordinator derives row membership from its blocker equality,
the shell's `q_mem_support`, and `P.hvClass`; the blocker-other coordinator
already carries the same membership.

The current-source Lean 4.27 build passes.  A subsequent
`proof-blueprint sync` at build `0c0d278830b8` reports 19 direct `sorryAx`
declarations, all 19 on-spine and none off-spine.  The consolidation therefore
removed exactly two further on-spine obligations.

Implemented and verified as source-clean library/interface simplifications:

- `frontierDeletion_survival_iff_actualBlocker_ne_qBlocker` now exposes the
  exact blocker normal form, and
  `mem_outside_qBlockerFiber_iff_frontierDeletion_survival` packages it in the
  consumer-facing off-fiber form.
- `deletionSurvival_cover_of_mem_outside_qBlockerFiber` now consumes that
  equivalence directly.  The obsolete three-way adapter was removed after an
  exact production-consumer search found no users.
- Focused Lean 4.27 builds of `AnchoredDoubleDeletionProducer` and
  `SurvivalCover` pass.  Their relevant consumer is source-clean and has only
  `propext`, `Classical.choice`, and `Quot.sound` in its axiom profile.  This
  cleanup deliberately has no live-frontier effect.
- `Problem97.dist_sq_coord` in `P97/Foundation.lean` is now the canonical
  coordinate expansion of squared distance on `ℝ²`.
  `SurplusCOMPGBank.dist_sq_coord`,
  `Census554.EqualityCore.Internal.dist_sq_coords`, and the audited local
  coordinate helpers delegate to it.  The row/open-side duplicate groups were
  already one-line aliases in current source.
- `CrossPairDeletionView` now retains the producer-native deletion-survival
  fact and derives the equivalent selected-support omission once.  The
  cap-source surface and first-fiber witness carry that packet directly.
  Focused no-refresh builds of `TwoCollisionGlobalProducer` and
  `FrontierLiveClosure` pass on the current source.
- `ATailMinimalUniqueFourCover.fullyDeletionRobustAt_of_large_class` now
  delegates to the canonical five-point deletion-robustness theorem.  Its
  focused no-refresh build passes and its axiom profile is source-clean.
- The local `firstFiber_shell_eq_explicitFour` wrapper now delegates to
  `ATailFirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour`; the
  current-source `FrontierLiveClosure` build verifies the alias.  It has no
  current source consumer and is retained only as an unused semantic wrapper.

Current disposition:

- the architectural bypass, blocker-fiber symmetry, exact blocker normal
  form, survival/omission packet, cardinality APIs, and canonical aliases are
  implemented and build-verified;
- the four-to-two blocker-row consolidation is also implemented and
  build-verified;
- the U5 cardinality API feeds the U3 cardinality API, and both retain live
  compatibility-path consumers, but no live caller uses either through the
  new bare-cardinality/non-`IsM44` interface.  Producing rowwise confinement,
  or eliminating both arms of the current escape/critical-shell disjunction,
  is new mathematical work rather than missing wiring;
- all four live leaf-signature minimizations identified below are implemented
  in source: the blocker-collision, two-radius, low-hit, and source-heavy
  `rigid221` leaves now omit packet-determined or branch-determined facts from
  their terminal interfaces; and
- the four-subpacket, five-point-helper, and frontier-radius duplicate proof
  families have been consolidated.  Coordinate-square centralization is
  source-complete and build-verified under the canonical
  `Problem97.dist_sq_coord`.

An independent post-implementation source/consumer pass found no additional
high-level bypass, symmetry quotient, or theorem-bank bridge that closes or
decomposes one of the 19 live obligations.  It did find one further
coordinator-signature strengthening: the exact-four collision / exact-two
chain carried a common-deletion witness, a localized-cycle witness, and an
exact-slice equality that its caller could reconstruct.  That forwarding has
now been removed throughout the three-coordinator chain, together with the
parent's producer-only reconstruction.  The remaining improvement classes
are verification of the latest signature, coordinate-square, and final radius
cleanups, plus the new mathematical bridge needed to exploit the
bare-cardinality U3/U5 interfaces.

Verification checkpoint preceding the final coordinate/radius cleanup on
2026-07-28:

- `LAKE_BUILD_NO_REFRESH=1 lake-build
  Erdos9796Proof.P97.ATail.FrontierLiveClosure` completed successfully on Lean
  4.27 (10,855 jobs);
- `proof-blueprint sync --memory-mb 16384` completed at build
  `0c0d278830b8`;
- both published roots reach exactly the same 19 on-spine `sorry`
  declarations and no off-spine `sorry`;
- the root axiom profile is `propext`, `Classical.choice`, `Quot.sound`,
  `Lean.ofReduceBool`, approved `Lean.trustCompiler`, and `sorryAx`; only
  `sorryAx` remains unapproved; and
- the mined graph has zero stale symbols.  Sixty-three symbols in 25 unbuilt
  WIP modules have no current `.olean` and remain outside the verified build;
  this does not affect the freshly mined published-root spine.

The coordinate and final radius source rewrites below postdate this checkpoint
and therefore required the final verification below.

Final verification after all source-wide refactors on 2026-07-28:

- a focused Lean 4.27 build of the canonical coordinate theorem,
  representative early and late coordinate consumers, both radius aliases,
  and `FrontierLiveClosure` completed successfully (10,860 jobs);
- after the completion-audit interface cleanup, a fresh no-refresh
  `FrontierLiveClosure` build completed successfully (10,855 jobs), followed
  by a successful production-root `Erdos9796Proof` build (11,591 jobs);
- `proof-blueprint sync --memory-mb 16384` completed at build
  `53a38363d880`, with zero stale current indexed minable symbols;
- both published roots reach exactly 19 on-spine `sorry` declarations and
  zero off-spine declarations;
- `docs/live-blueprint.md` was regenerated through the authoritative
  `proof-blueprint spine` command from that same kernel graph and no longer
  contains a stale off-spine entry;
- the root axiom profile remains `propext`, `Classical.choice`, `Quot.sound`,
  `Lean.ofReduceBool`, approved `Lean.trustCompiler`, and `sorryAx`; only
  `sorryAx` is unapproved;
- the source census contains one direct
  `EuclideanSpace.dist_sq_eq` expansion, namely the canonical theorem in
  `P97/Foundation.lean`; and
- `proof-blueprint refs --check` remains nonzero solely because 63 symbols
  occur in 21 of the 25 indexed modules without an `.olean`: 51 are in
  `scratch/`, and 12 are in unbuilt
  `Census554/CapSelectedBVPlacements` modules.  The sync explicitly excludes
  those modules from the verified build; the published-root spine is fresh;
  and
- the separate `proof-blueprint audit --refresh` warning that 160,312 symbols
  were mined against an older build is a reporting bug in that command, not
  graph staleness.  It counts 159,393 historical names that are no longer
  indexed plus 919 current trusted/skipped names.  At build `53a38363d880`,
  44,049 of 44,112 current indexed minable symbols are fresh, no current
  minable symbol is stale, and neither published root reaches a stale or
  never-mined node.

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

Status: **IMPLEMENTED / BUILD VERIFIED / ONE LIVE OBLIGATION REMOVED**.

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

The live first-fiber descent already had the substantial implementation in
`FrontierLiveClosure.lean` and
`ATail/FirstFiberOverlapDescent.lean`. The second-fiber terminal is now an
adapter into that same descent rather than a separate mathematical
obligation.

The combined build and corrected fresh kernel scan reduced the
implementation-time frontier from 22 on-spine declarations to 21.  There was
no off-spine declaration; the earlier classification was caused by the
multiline-declaration indexing artifact described in the implementation
update.

The implementation uses explicit swap-parametric adapters and reconstructs
the row-indexed robust residual for the swapped collision.  No parallel
second-side descent library was introduced.

## 3. Consolidate four blocker-row terminals into two generic terminals

Status: **IMPLEMENTED / BUILD VERIFIED / TWO LIVE OBLIGATIONS REMOVED**.

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

The four terminals were replaced by:

1. one generic `v`-row-blocker, opposite-row-heavy contradiction; and
2. one generic `v`-row-blocker, neither-row-heavy contradiction.

The source-row-heavy terminal remains separate: its non-`v` branch has
additional exact-five/growth decomposition and is not part of this proposed
merge.

Both identity coordinators now call the two generic terminals.  The
blocker-`v` coordinator proves the membership by rewriting its equality and
combining `q_mem_support` with `P.hvClass`; the blocker-other coordinator
passes through its existing membership fact.  No external production
consumer referenced the four removed declarations.

The focused Lean 4.27 build passed.  A fresh source index and kernel call-graph
mine measured 19 on-spine declarations and no off-spine declarations, down
from 21 on-spine declarations before this change.  Each replacement terminal
has weaker equality-specific hypotheses and is therefore a genuinely stronger
interface, but its contradiction still has to be proved.

## 4. Generalize the fixed U3 audit frame from `IsM44` to cardinality

Status: **IMPLEMENTED / BUILD VERIFIED / NO BARE-CARDINALITY LIVE CALLER YET**.

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

A registry-first search of the current tree, the sibling `p97-rvol` banks,
and the two legacy theorem inventories found no declaration that supplies any
of those three bridges.  The closest proved eliminator is
`exists_qDeleted_escape_or_criticalFourShell`: it produces a concrete audit
center with either a q-deleted exact-four class escaping `U5BoundedSupport`
or a `CriticalFourShell`.  No current A-tail terminal consumes that
disjunction.

Consequently, constructing the cardinality-first frame was the available
refactor/strengthening.  Wiring a future proved
`RowwiseConfinedQDeletedClasses` into
`false_of_rowwiseConfinedQDeletedClasses` would be mechanical, but producing
that confinement—or classifying both arms of the escape/critical-shell
disjunction into an existing incidence terminal—is new mathematical work,
not an unimplemented source refactor hidden by this audit.

## Other interface simplifications

### Preserve both survival and omission views

`ATail/TwoCollisionGlobalProducer.lean` directly produces cross-deletion
survival disjunctions in
`exists_capSource_thirdBlocker_crossPairDeletionSurvivals`.

Those facts are converted into selected-support omissions in
`CapSourceThirdCanonicalRowSurface`, then converted back into survival facts
in the first-fiber descent using
`cross_deletion_survives_iff_not_mem_selected_support`.

Implementation status: **IMPLEMENTED AND BUILD-VERIFIED.**

`CrossPairDeletionView` now stores the producer-native survival statement and
derives the selected-support omission through one proved equivalence.  Both
`CapSourceThirdCanonicalRowSurface` and `FirstFiberCapSourceWitness` carry
these view packets, and the first-fiber descent uses the derived omission
without converting it back into a separately stored survival fact.

Focused no-refresh builds of `TwoCollisionGlobalProducer` and
`FrontierLiveClosure` pass on the current Lean 4.27 source.  The refactor
adds or removes no `sorry`; it normalizes the packet interface only.

### Expose the exact blocker equivalence as a normal form

`ATail/AnchoredDoubleDeletionProducer.lean` proves:

`both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker`.

Later consumers weaken this to a three-way cover, prove blocker inequality,
and eliminate the equality branch. A direct off-fiber two-way survival normal
form should be exposed and consumed instead.

Implementation status: **IMPLEMENTED AND BUILD-VERIFIED.**

The new primitive equivalence is
`frontierDeletion_survival_iff_actualBlocker_ne_qBlocker`; the
consumer-shaped off-fiber form is
`mem_outside_qBlockerFiber_iff_frontierDeletion_survival`.
`deletionSurvival_cover_of_mem_outside_qBlockerFiber` now applies the latter
directly, and the unused three-way adapter has been removed.  This is a
source-clean library simplification with no `sorry` or frontier delta.

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

Status: **IMPLEMENTED AND BUILD-VERIFIED (4/4)**.

The blocker-collision leaf no longer receives the support equality,
cross-membership facts, or two-point intersection equality.  The two-radius
leaf now reconstructs positivity, class-cardinality, and strict-cap facts from
its rows and no-five packet.  The low-hit directed-omission leaf now takes only
the packet chain `F`, `R`, `P`, `B`, `L`, `N`, and `T`; its intermediate
two-radius and exact-four collision coordinators likewise no longer receive
the three rich-cap patterns that they did not use.  Removing those patterns
propagated through the exact-two collision coordinator, the retained-collision
coordinator, the low-hit split, and the two compatibility consumers above it.
The final compiler pass reports no unused-variable warning for that chain.

The source-heavy/second-opposite-large leaf now takes only the source-heavy
context `P`, its derived packet, and the second-opposite-large witness
`hsecond`.  Its sole caller no longer forwards the blocker-row,
blocker-inequality, `xv`-interior, interior-cardinality, or robust-growth
consequences.  These are interface strengthenings, not closure results, and
do not alter the number of open contradictions.

The same compiler pass exposed one private section-scope artifact:
`capSource_firstFiber_descent` automatically inherited six unused section
hypotheses.  An explicit `omit` now keeps those hypotheses out of its generated
signature, and its caller passes only the data used by the proof.

### Remove reconstructible witnesses from the exact-two coordinator chain

Status: **IMPLEMENTED AND BUILD-VERIFIED**.

The checked body of
`false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`
does not use:

- the common-deletion witness `C`;
- the localized mutual-omission-cycle witness `M`; or
- the exact retained-slice equality `hexactTwo`.

`C` occurred only in the type of `M`; neither `M` nor `hexactTwo` occurred in
the proof body.  The simplification is now propagated through:

- `false_of_exactFourCollision_secondRadius_and_all_low_hits`; and
- `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits`.

After that propagation,
`false_of_retainedInteriorBlockerCollision_and_all_low_hits` need not unpack
`P.nonempty_commonDeletion`, call
`nonempty_localizedCollisionMutualOmissionCycle`, or pass
`retainedInteriorBlockerCollision_firstShell_retainedSlice_eq_sources`.
The current source removes all three operations.  Those facts remain
reconstructible from `P` if a later proof genuinely needs them.  This is an
interface strengthening only: it neither proves nor splits a live terminal,
so the frontier count is unchanged.

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

Implementation status:

- the canonical theorem is now `Problem97.dist_sq_coord` in
  `P97/Foundation.lean`;
- the source-wide rewrite makes the audited uses in 36 consumer modules
  delegate to that theorem, directly, through unqualified namespace
  resolution, or through a local semantic wrapper;
- a current source census finds no copied coordinate-expansion proof body:
  the only remaining direct expansion is the canonical theorem itself;
- the final 10,860-job focused build covers the canonical theorem and
  representative early and late consumers, so the centralization is
  build-verified;
- the chord-projection, reflected-row, and open-side public pairs were already
  one-line semantic aliases in current source; and
- the deletion-robustness duplicate now delegates to the canonical
  five-point theorem and passes a focused Lean 4.27 build.

Further duplication:

- `FrontierLiveClosure.firstFiber_shell_eq_explicitFour` now retains its
  semantic wrapper name but delegates directly to
  `FirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour`; it has no
  current source consumer and is an unused semantic wrapper;
- the three surplus-cap-packet four-subpacket existence theorems now delegate
  to the canonical finite-endpoint-shell implementations;
- the interior-bisector localization module now imports and reuses the three
  matching five-point helpers from the cross-blocker localization module; and
- `CriticalPairFrontier.radius_pos` is now the public canonical radius
  positivity theorem.  The surviving compatibility names
  `ATailUniqueArmRouteAuditScratch.frontier_radius_pos` and
  `FrontierOffRadiusEscape.frontierRadius_pos` now delegate to it, and the
  remaining inline reconstruction in `FrontierLiveClosure` uses
  `F.radius_pos` directly.

All of these are maintenance reductions, not proof closure.

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

Implementation outcome: steps 1–4 and the load-bearing packet/alias subset of
step 6 are complete.  All four leaf-signature minimizations and the named
four-subpacket, five-point-helper, and frontier-radius duplicate reductions
are implemented and build-verified.  The exact-two coordinator-signature
cleanup is implemented throughout its call chain, and the now-redundant
rich-cap patterns and private section variables have also been removed.
The coordinate-square and frontier-radius centralizations are build-verified.
Step 5 is the next mathematical research target, not unfinished refactor
wiring.

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
  historical predicted count.  The post-refactor measured state is 19
  on-spine declarations and zero off-spine declarations.

## Independent completion-audit addendum

Date: 2026-07-28.

An independent final source review confirmed the implemented items above and
found no higher-level theorem-bank bypass for any of the remaining live
contradictions.  It did, however, find one further argument-forwarding cascade
and two smaller source-hygiene items that were not included in the first
completion claim.

### Localize the canonical shell-cover and low-hit arguments

Status: **IMPLEMENTED AND BUILD-VERIFIED.**

Before this addendum was implemented, the exact-two collision coordinator
chain forwarded `hcriticalShellUniqueFourCover` and `hlow` through declarations
around
`false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`.
Neither was genuinely caller-selected data:

- `hcriticalShellUniqueFourCover` is reconstructed canonically from `H` using
  `centerAt_ne_source`, `isUniqueFourCenter_centerAt`, and
  `uniqueFourClass_centerAt_eq_selectedAt_support`; and
- `hlow` is reconstructed canonically from `S`, `H`, and the apex-rich witness
  by
  `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`.

The implemented refactor removes both arguments from the exact-two coordinator
chain.  It goes further than the initially proposed wrapper-only cleanup:
`hcriticalShellUniqueFourCover` was removed from the signatures of the three
live collision leaves themselves, because it is canonical data rather than a
leaf hypothesis.  It is now reconstructed only in the two checked proofs that
actually inspect it:

- `exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`;
  and
- `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`.

Likewise, `hlow` is now constructed only at its sole checked consumer,
`false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits`.
The smaller signatures were propagated through:

- `false_of_exactFourCollision_secondRadius_and_all_low_hits`;
- `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits`;
- `false_of_retainedInteriorBlockerCollision_and_all_low_hits`;
- `false_of_frontierAllLargeCapsTriApex_all_low_hits`;
- `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex`;
- `false_of_frontierAllLargeCapsTriApexUniformMetricResidual`; and
- `false_of_frontierAllLargeCapsTriApexRobustResidual`.

This is a strict interface strengthening, not a proof closure or a frontier
split.  Whole-file Lean-LSP elaboration and an isolated Lean 4.27 compile
reported no errors.  The locked 10,855-job focused build and the downstream
11,591-job production build then passed, and the refreshed kernel spine kept
the measured frontier at 19 on-spine declarations and zero off-spine
declarations.

### Remove one dead private accessor

Status: **IMPLEMENTED; REPOSITORY-WIDE SOURCE CENSUS VERIFIED.**

`retainedInteriorBlockerCollision_firstShell_retainedSlice_eq_sources` had no
production source consumer after the earlier exact-two witness-forwarding
cleanup.  A repository-wide production reference check found only its private
declaration, so the accessor was deleted.  Historical scratch references do
not create a production dependency.

### Repair stale frontier comments

Status: **IMPLEMENTED.**

Two comments in `ATail/FrontierLiveClosure.lean` describe superseded frontier
shapes:

- “four load-bearing terminals” should distinguish four semantic collision
  arms from the current three live collision declarations; and
- the checked collision coordinator should no longer be described as having
  one downstream `sorry`, because its current load-bearing frontier consists
  of the three exact-two collision leaves.

The source comments now distinguish four semantic collision arms from the
three live collision declarations and describe the checked coordinator as
exposing that three-declaration frontier.  These changes do not alter the
mathematical closure route.

## Final requirement-by-requirement completion audit

| Refactor requirement | Final disposition |
| --- | --- |
| Production Route-B bypass | Implemented; focused build verified |
| Second-fiber swap symmetry | Implemented; one live obligation removed |
| Four blocker-row leaves consolidated to two | Implemented; two live obligations removed |
| Cardinality-first U5 and U3 APIs | Implemented and build-verified; no bare-cardinality live caller |
| Survival/omission packet and blocker normal forms | Implemented and build-verified |
| Four live leaf signatures minimized | Implemented and build-verified |
| Exact-two reconstructible-witness forwarding removed | Implemented and build-verified |
| Redundant rich-cap pattern forwarding removed | Implemented and build-verified |
| Private descent section signature minimized | Implemented and build-verified |
| Deletion robustness, first-fiber, four-subpacket, and five-point aliases consolidated | Implemented and build-verified |
| Coordinate-square proof centralized | Implemented; source census and focused build verified |
| Frontier radius positivity centralized | Implemented and focused-build verified |
| Scratch, attic, and theorem-bank search for an existing closer | Completed; negative result |
| Published-root spine and trust profile | Fresh at `53a38363d880`: 44,049/44,112 current minable symbols fresh, 0 stale, 63 never-mined off-spine; 19 on-spine, 0 off-spine; only `sorryAx` unapproved |
| Canonical shell-cover and low-hit arguments localized | Implemented; focused and production builds verified |
| Dead retained-slice accessor removed | Implemented; repository-wide production source census verified |
| Exact-two frontier comments reconciled | Implemented |

No source change or verification gate identified by this audit remains
pending.  The bounded-U5 bridge in step 5 is deliberately excluded from the
refactor list because it is a new mathematical proof obligation, not missing
wiring or source normalization.
