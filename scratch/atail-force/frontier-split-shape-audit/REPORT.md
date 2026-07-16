# First-apex split shape audit

Date: 2026-07-15

Status: source-current, read-only shape audit. No Lean build was run. This report
does not modify the production proof or any closure document.

## Verdict

Split on `CriticalPairFrontier.firstApexSplit` before invoking the continuation
dispatcher.

The production frontier already makes the second-apex side uniform:
`secondApexDouble` says that deleting both frontier points leaves a four-point
row at `oppApex2`. The informative pre-dispatch normal form is therefore the
three-way first-apex trichotomy proved in
`double-survivor-consumer/DoubleSurvivorConsumer.lean`:

- **R**: deleting both frontier points also leaves a four-point row at
  `oppApex1`;
- **U4**: the selected first-apex row is the unique row of size four and each
  single frontier deletion destroys first-apex K4 survival;
- **U5**: the selected first-apex row is the unique row of size five, each
  single frontier deletion preserves first-apex K4 survival, and the double
  deletion destroys it.

The continuation dispatcher independently has three outputs:

- **C**: cross-survival continuation;
- **N**: non-equilateral continuation rows;
- **E**: equilateral residual routed through the joint-transition core.

Hence the exact branch matrix is:

| first-apex branch | C: cross survival | N: non-equilateral | E: equilateral residual |
| --- | --- | --- | --- |
| R: double deletion survives | R-C | R-N | R-E |
| U4: unique four-row; both single deletions block | U4-C | U4-N | U4-E |
| U5: unique five-row; singles survive, double deletion blocks | U5-C | U5-N | U5-E |

This is a genuine `3 x 3` matrix, but it should not be implemented as nine
unrelated proof lanes. The dispatcher constructs its output using only
`secondApexDouble`; it does not inspect `firstApexSplit`. Dispatching first
therefore erases the deletion polarity that distinguishes U4 and U5 and sends
all three rows through the same still-open C/N/E producer obligations. Splitting
first permits the sharper U4 and U5 consumers to run before the generic
continuation machinery, leaving C/N/E as the fallback structure for R.

## Existing terminal consumers

An existing terminal consumer does not mean its branch is closed: in every row
below, the remaining issue is production of the consumer's antecedent.

| branch | existing proved consumer or reduction | current producer gap |
| --- | --- | --- |
| R | `blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives` classifies equality of the two blocker centers by reciprocal source-shell membership. `false_of_supportCentersBisectFrontierPair` and `false_of_twoBlockerGlobalPairRows` are conditional robust terminal sinks. `exists_firstApex_terminal_subcarrier` reduces by repeated double deletion to a subcarrier with a unique four- or five-row. | No theorem produces the reciprocal incidence, the two support-center bisector facts, or an ambient-safe terminal packet after the subcarrier descent. |
| U4 | `false_of_existsSurplusPairCriticalBlocker` closes once a favorable non-apex surplus-cap critical center has an exact shell containing both frontier points. | The critical-blocker/source-incidence producer is open. The endpoint can legitimately land at the first apex, so arbitrary critical-map selection is insufficient. |
| U5 | `false_of_frontier_cardFive_distinct_capLocalCross`, `false_of_cardFive_exists_capLocal_or_mutualIncidence`, and `false_of_residual_member_class_contains_common_pair` are terminal consumers for the available card-five incidence packets. | Source-indexed cap-local or mutual-incidence production is open. This is the user-owned unique-row / `(6,5,4)` lane and is not duplicated here. |
| C | `CrossSurvivalClosingSelection.false` closes a cross-survival output whose selected continuation row has at least two first-apex-radius hits. | The closing selection is not produced. |
| N | `false_of_nonEquilateral_of_strictOppCap1CommonHit` closes the strict common-hit packet. | The common-hit packet is not produced. |
| E | `false_of_jointTransition_of_closingSelection` closes either the low-hit fresh-pair packet or the reverse-mixed third-bisector packet. | Neither disjunct is produced uniformly. |

The robust-four-center report's “robust cross-survival” is a source-blocker
cross-survival condition, not the same proposition as first-apex branch R.
Those labels must not be identified without an explicit bridge.

## Where the bank-clean 15-core belongs

The abstract theorem
`BankCleanFifteenCollisionCore` contains only nine point roles, `O != A`, and
fifteen `EdgeClosure` hypotheses. It contains no selected-row cardinality,
frontier pair, deletion-survival, or unique-radius hypothesis. As an abstract
certificate it is therefore branch-agnostic.

Its current fixed-shadow origin has profile `(8,4,5)`: the represented
first-apex row has size five. This rules out U4 for that represented shadow. It
does **not** distinguish R from U5, because the search encoding explicitly
omits ambient exactness against every unrepresented radius class. An
unrepresented four-point radius could survive the double deletion (R), while
ambient uniqueness would force the represented size-five case into U5.

The justified classification is therefore:

> the current fixed-shadow origin lies in **R or U5**; the bank-clean 15-core
> itself is not evidence that either branch has been selected.

In particular, the core should not be used to route the production proof into
the user-owned U5 lane.

## Theorem-bank preflight

Checked before recommending a new producer:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- all three concise certificate-bank censuses and their exhaustive JSON
  registries (`p97_rvol`, `erdos97_legacy`, and
  `erdos_general_theorem_p97`);
- indexed Lean documentation searches for double-deletion survival, unique
  selected rows, card-four critical blockers, card-five cross membership,
  exact row-slot packets, and the named frontier helpers.

The closest reusable results are consumers, not the missing producer:
`outsidePair_unique_capCenter` closes after a repeated-pair packet has already
been built; `u1TwoLargeCapObstruction` is an unimported fixed packet consumer;
and the row-slot certificates require their exact packet as input. No indexed
bank theorem supplies an R ambient lift, a U4 critical-blocker incidence, or a
U5 source-indexed incidence. The sibling declaration named
`DoubleApexOffSurplusSharedRadiusPair` is not independent proof evidence for
this audit.

## Recommended non-duplicating lane

Work only on **R**, with a narrow target: make the repeated-double-deletion
descent terminal without asserting an unjustified ambient uniqueness theorem.

The first useful producer should package the cumulative erased set together
with the terminal exact row from `exists_firstApex_terminal_subcarrier`, then
prove a contradiction whose hypotheses are stable under re-adding the erased
points. Concretely, search first for a direct ordered-cap / perpendicular-
bisector terminal consumer on the terminal subcarrier packet. Attempt an
ambient lift only after proving explicit exclusion facts for every erased
point; ambient uniqueness by itself is currently too strong and is exactly the
known gap.

This lane:

- uses the simultaneous double survival available only in R;
- is independent of a fixed ambient cardinality and of Census-554;
- does not duplicate the user-owned `(6,5,4)` or unique-row work;
- leaves the C/N/E dispatcher available if the direct subcarrier terminal does
  not materialize; and
- tests a single concrete bridge before introducing another broad producer
  interface.

This audit establishes the proof shape and ownership boundary, not that the R
bridge is already proved.
