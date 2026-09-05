# CardGeThirteen large-interior exact-13 ingress

Date: 2026-09-04
Lane: `cardge13-large-interior-ingress-20260904`
Base head: `6313dc0fa6981c443b9dd7e0e85fbf7705129b9a`

## Scope and claim boundary

Target residual:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.
Publish target: `Problem97.erdos97_rhs`.

This checkpoint addresses only the exact-thirteen large-interior ingress. It
does not close the CardGeThirteen residual. The declarations below have passed
focused governed builds, but they are not promoted as a closure result because
no live `False` consumer covers every dispatcher arm.

## Reuse preflight

Concrete candidate: derive profile `.secondOpposite` and the unordered physical
`2+3` split from the exact-thirteen ingress and the large-interior arm.

- `two_full_secondApex_classes_largeInterior_or_grid` proves the large-union
  disjunction and internally derives both per-row lower bounds, but previously
  exported only the union bound.
- `exactThirteen_profile_of_twoRadiusBranch` exports the three strict-cardinality
  profiles, not the profile equality selected by the large-interior arm.
- `ExactThirteenBranchIngress.secondOppositeInterior_image_eq` identifies the
  profile-dependent raw I2 interval with the physical second-opposite interior.
- `raw_two_three_partition_of_physical_unordered` transports an already supplied
  physical partition; it did not produce the partition.

The project theorem-bank search found no existing combined theorem. Immediate
consumer: `raw_two_three_partition_of_physical_unordered`. First missing
antecedent before this checkpoint: the producer had discarded the two per-row
`2 ≤` slice bounds, and the raw ingress had no theorem selecting the
`.secondOpposite` profile from the retained large-union bound.

## Candidate reduction

`CardGeThirteenUncoveredStrictInteriorPacket` now retains:

- the five-point large-interior union bound;
- `2 ≤` the first-row second-interior slice cardinality; and
- `2 ≤` the second-row second-interior slice cardinality.

`exactThirteen_secondOpposite_largeInterior_two_three` combines those fields
with an `ExactThirteenBranchIngress` and row disjointness. The union lies in the
physical second-opposite interior, so that interior has at least five points.
The ingress profile specification gives five points only in profile
`.secondOpposite` and four in the other two profiles. In the surviving profile,
disjointness and the two lower bounds force slice cardinalities `2+3` or `3+2`.

The transferred raw-ingress lane adds
`ExactThirteenRawTwoThreePartition` and
`raw_two_three_partition_of_exactThirteen_largeInterior`, which transport this
physical result to variable `Fin 13` supports without assigning unsupported
hard-coded coordinates.

The same lane now adds `PositionalFourSupportRow`,
`positionalFourSupportRow_of_selected`, and
`exists_positionalFourSupportRow_at_raw_label`.  These declarations transport
an actual source-selected four-class through `P.idx`, retaining its physical
support and raw support while producing a four-element positional support,
center omission, and `RowDistancesEqual P.φ (P.idx rawCenter) support`.  Thus
both direct and mirror orientations can feed a finite cell classifier without
assuming the special center-9 support table.  The source transport and its
downstream dispatcher dependencies now pass focused governed builds.

`ExactThirteenFivePositionalRows` and
`nonempty_exactThirteenFivePositionalRows` then package the five actual rows
already supplied by the live source: the two distinct blocker-centered rows,
both selected rows at the second apex, and the exact first-apex row.  The apex
center labels are fixed by `LabelMap`; the blocker centers remain distinct
variable raw labels.  This closes the row-metric transport obligation while
leaving the genuinely finite center/support occurrence classification open.

The source producer now also retains the four proven intersection bounds
between the two blocker rows and the two second-apex rows.  The strict-interior
packet retains both exact selected-class support identities and the inequality
between the two row radii.  The raw ingress transports those intersection
bounds to raw-label cardinalities and proves positional support membership is
equivalent to physical support membership.  For both second-apex rows and the
first-apex row, membership is therefore equivalent to the exact distance
equality at the retained radius.  These are precisely the positive-row and
off-support-exclusion semantics used by the existing PIQD base query; they are
now source-facing theorem obligations rather than audit-only assumptions.

The outcome dispatcher now uses the existing proof-relevant three-row split
and retains all three pairwise-disjointness proofs in its
`exactThirteenTight` constructor.  These were previously reconstructed and
then discarded before the live outcome was packaged.  A target consumer can
therefore construct `CardGeThirteenExact13RawTightSupport` directly from the
dispatcher branch without rerunning the split or assuming hidden overlap
facts.

Frontier measure: within the `exactThirteenTight` constructor, the profile
freedom decreases from three profiles to `.secondOpposite`, and the two named
row slices decrease from arbitrary compatible supports to the unordered
`(2,3)` pair. No new `sorry` is introduced.

## Remaining blocker

The resulting supports are variable raw labels. Existing center-9 and
two-canonical-K4 terminals require hard-coded `FixedFiveRows`/center coordinates.
No source theorem currently identifies the variable source rows with those fixed
supports, and the adjacent-grid, row-overlap, and uncovered outcome constructors
still lack `False` consumers. The next exact-13 step must therefore be either a
permutation-equivariant finite terminal over this variable-label packet or a
source-faithful positional normalization theorem.

Theorem-bank and source audit sharpen the center-9 antecedent to exactly
`CardGeThirteenCenter9K4RowDomain.FixedFiveRows P.φ`. Global K4 then supplies
the center-9 challenge through `exists_center9FourSupportRow_of_globalK4`, and
`ExactThirteenBranchIngress.false_of_center9_globalK4_of_ingress` would close
the cell. The current packet supplies neither the five fixed support identities
nor their equal-distance rows. An arbitrary raw permutation is not a sound
substitute: the certificate banks require cyclic order, `P.orientation` may be
direct or mirror, and `rawToPos` is a fixed direct-order table. No existing
theorem transports the fixed-cell certificates across the required
order-preserving relabeling.

A field-by-field source audit confirms that orientation alone is sufficient
for the new single-row transport, but not for `FixedFiveRows`.  The exact-tight
packets retain three variable source rows; the center-9 terminal requires five
specific row equalities, including two independently tagged rows at one fixed
raw center.  Those five occurrence facts are not logically present in the
current packet.  The sound next classifier boundary is therefore the actual
`P.idx`-transported row supports, followed by an exhaustive split into a
checked terminal cell or an explicit residual cell.

## Validation ledger

- Focused governed build of
  `CardGeThirteenTwoRadiusGoodSourceIngress`,
  `CardGeThirteenTerminalSplitV2`,
  `CardGeThirteenUncoveredStrictInterior`, and
  `CardGeThirteenOutcomeDispatcher`: exit 0, 11,975 jobs.
- Focused governed build of `CardGeThirteenAnchoredOutcomeDispatcher`: exit 0,
  11,976 jobs.
- The printed axioms for the strengthened outcome and anchored-outcome
  producers are `[propext, Classical.choice, Quot.sound]`.
- The best-effort proof-blueprint refresh failed after both successful builds
  because the indexed private declaration
  `B1CardSixRoleProjectionIngress.ambientRoleIndex_injective` was absent from
  the imported environment. This is an unrelated indexing obstruction and
  means the fresh live-spine gate remains pending.
- Aggregate build and final-consumer axiom audit remain pending until every
  card-at-least-thirteen outcome has a live contradiction consumer.
