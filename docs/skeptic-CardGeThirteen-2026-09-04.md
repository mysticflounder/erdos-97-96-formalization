# Math Skeptic Audit: card-at-least-thirteen seven-source classifier

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`
(`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`)
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 5

## Summary

The proposed strengthened classifier is mathematically available from the
current exact-four source data, but it is not yet a Lean declaration. No
countermodel is needed for the classifier once its hypotheses explicitly retain
source identities, actual blockers, selected supports, and the two deletion
survival colors.

The honest source-level conclusion is a desired pair of distinct good sources
with distinct actual blockers and a common retained-deletion survival color
(q or w). This is stronger than merely producing a mutual-omission pair. The
classifier does not by itself close the current card-at-least-thirteen target:
the target has two disjoint second-apex rows at distinct radii, while the
classifier conclusion has no adapter to those rows or to a checked terminal.

## Findings

### F1: Seven good outside sources are source-clean

- **Location**: `lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:444-452`
- **Quote**: “The live large-cardinality branch supplies seven good outside sources.”
- **Stated label**: PROVEN.
- **Evidence present**: `seven_le_goodOutsideSources_card_of_card_gt_twelve R hcard`, using `carrier_card_le_goodOutsideSources_card_add_six`.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK
- **Reason**: The declaration has a checked proof and requires only `R` and `12 < D.A.card`. The good set is defined as the outside first-apex fiber minus sources failing both retained singleton deletions.

### F2: The current source API supplies one of the two colors, but the reusable helper is private

- **Location**: `lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:88-109,454-473`
- **Quote**: “Outside sources at which at least one retained singleton deletion survives at the actual late blocker.”
- **Stated label**: PROVEN.
- **Evidence present**: `goodOutsideSources` and the checked local theorem `good_source_survives_one`.
- **Actual label**: PROVEN inside the module; CONJECTURED as an external reusable adapter fact until restated or exported.
- **Verdict**: CLARIFY
- **Reason**: `good_source_survives_one` is `private`. A new classifier module cannot call it by name. It can reproduce its short definition-level proof, or the source module can later expose a public theorem. This is an API boundary, not a mathematical counterexample.

### F3: Exact abstract classifier

- **Location**: Abstract finite-fiber consequence of the source facts at `SurvivalCover.lean:106-123` and `ExactFourPhysicalConsumer.lean:444-473`.
- **Quote**: “Every actual-blocker fiber has at most four source vertices.”
- **Stated label**: Not currently stated in Lean for the q/w color data.
- **Evidence present**: `actualBlockerFiber_card_le_four`; `selectedSupports_eq_of_actualBlockers_eq` at `SurvivalCover.lean:47-55`; one-color survival from F2.
- **Actual label**: PROVEN — pen-and-paper conditional classifier.
- **Verdict**: OK, pending formalization
- **Reason**: The exact classifier is:

  Let `T` be a finite set of at least seven distinct carrier sources. Let
  `b(s)` be the actual blocker and let `O(s)` be a nonempty subset of `{q,w}`
  recording which deletion survives at `b(s)`. Assume every actual-blocker
  fiber has size at most four. Then there exist `s,t ∈ T` and `x ∈ {q,w}`
  such that `s ≠ t`, `b(s) ≠ b(t)`, and `x ∈ O(s) ∩ O(t)`, provided every
  color class of size at least four has a common-support point distinct from
  all its sources and equal blockers identify supports.

  Proof: If no desired pair exists, all q-colored sources have one blocker
  `bq`, and all w-colored sources have one blocker `bw`; empty color classes
  would put all seven sources in one fiber and contradict the four bound. If
  `bq = bw`, all seven sources lie in one fiber, again impossible. If
  `bq ≠ bw`, a source colored by both q and w would force these blockers to
  agree, so no such source exists. Each color class then has at most three
  sources by its distinct common-support point, leaving at most six sources,
  contradicting `|T| ≥ 7`.

  This explicitly handles repeated blockers and rows omitting both q and w:
  repeated blockers are bounded by the four-source fiber theorem, while a
  both-color source is impossible in the distinct-`bq`/`bw` case.

### F4: Physical adapter hypotheses and conclusion

- **Location**: `lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:78-109,130-149,151-225,227-309`
- **Quote**: “Sources outside the exact first-apex blocker fiber.”
- **Stated label**: Not currently stated as the seven-source classifier adapter.
- **Evidence present**: `outsideFirstApexFiber`, `goodOutsideSources`, `badOutsideSources_card_le_two`, support equality for repeated blockers, and `cross_deletion_survives_iff_not_mem_selected_support` at `CriticalPairFrontier.lean:779-785`.
- **Actual label**: CONJECTURED as a Lean declaration; source-supported as a paper adapter.
- **Verdict**: CLARIFY
- **Reason**: A source-faithful adapter can take `R : OriginalUniqueFourResidual F` and `hcard : 12 < D.A.card` (the existing `surface` may be carried for the parent branch but is not needed for this count) and conclude

  `∃ s t ∈ goodOutsideSources R, s ≠ t ∧`
  `(lateFirstApexSystem R).centerAt s ≠`
  `(lateFirstApexSystem R).centerAt t ∧`
  `((survives q at s ∧ survives q at t) ∨ (survives w at s ∧ survives w at t))`.

  The support-cap premise is source-derivable: in the no-desired-pair case,
  equal blockers identify selected supports; a q-only source has w in that
  common four-point support by `cross_deletion_survives_iff_not_mem_selected_support`,
  and a w-only source has q there. Sources outside the first-apex fiber are
  distinct from q and w using the public first-apex class membership lemmas
  (`frontier_pair_q_mem_firstApexClass`, `frontier_pair_w_mem_firstApexClass`,
  and `lateFirstApexSystem_centerAt_eq`) plus the outside-fiber definition.
  Thus each color class has at most three members when its blocker differs from
  the other color's blocker. No blocker injectivity assumption is used.

  The one missing reusable source fact is the public form of F2. The rest of
  the adapter uses checked declarations: `seven_le_goodOutsideSources_card_of_card_gt_twelve`,
  `actualBlockerFiber_card_le_four`,
  `selectedSupports_eq_of_actualBlockers_eq`, and
  `cross_deletion_survives_iff_not_mem_selected_support`.

### F5: The proposed classifier does not close `cardGeThirteen`

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1247-1267`
- **Quote**: “The card-at-least-thirteen residual of the no-five two-distinct-radii branch of the post-card-eleven robust exact-four terminal.”
- **Stated label**: Implicitly PROVEN by the result type `False`.
- **Evidence present**: The declaration takes two `SelectedFourClass` rows, radius identities, and disjointness, then ends with `sorry` at line 1267. No good-source witnesses or q/w survival colors occur among its binders.
- **Actual label**: CONJECTURED.
- **Verdict**: DOWNGRADE TO CONJECTURED
- **Reason**: The classifier conclusion concerns two source blockers and a common deletion. The target conclusion concerns two disjoint rows at `S.oppApex2` with distinct radii. A separate adapter must connect those objects to a checked metric, order, or row-incidence terminal. The classifier alone supplies no such connection.

## Weasel words

No proof-body weasel word is used as evidence. The source comments use
“supplies,” “survives,” and “good” as names for checked definitions or
theorems; the report does not treat those comments as proof of the final
cardGeThirteen contradiction.

## Scope conflation

The seven-source count is a carrier-count statement. The desired-pair
classifier is a blocker-and-survival statement. The cardGeThirteen target is a
two-radius second-apex statement. These are different interfaces; no claim of
closure may cross between them without a typed adapter.

## Lean sorry graph

No Lean build was run for this read-only request. Source inspection found:

- `seven_le_goodOutsideSources_card_of_card_gt_twelve`: checked body.
- `actualBlockerFiber_card_le_four`: checked body.
- `selectedSupports_eq_of_actualBlockers_eq`: checked body.
- `cross_deletion_survives_iff_not_mem_selected_support`: checked body.
- `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`: `sorry` at line 1267.

## Upgrade drift

No base-commit label diff was supplied. The classifier is reported as a
conditional paper result, not as a new Lean-proven consumer.

## Required before CERTIFIED

1. Add a source-clean public one-color survival theorem or a fresh local proof
   in the adapter module.
2. Formalize the seven-source finite-fiber classifier with explicit source,
   blocker, support, and q/w color fields.
3. Provide a typed adapter from its desired pair to the two-radius rows or to
   another checked terminal that consumes those rows.
4. Replace the `cardGeThirteen` `sorry`, then run the aggregate build and
   axiom audit.

## Import direction

The clean dependency direction is:

`ATail/SurvivalCover.lean` and `ATail/ExactFourPhysicalConsumer.lean`
→ a new source-faithful seven-source classifier adapter
→ `FrontierLiveClosure/Rigid221Closure.lean`.

The adapter must not import `Rigid221Closure`; the parent terminal may import
the adapter.
