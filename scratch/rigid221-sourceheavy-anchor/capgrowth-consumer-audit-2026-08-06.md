# `capGrowth` consumer audit for the rigid-221 source-heavy anchor

Date: 2026-08-06

## Verdict

`P.surface.capGrowth` does not close any branch of
`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker` and does not currently feed a stronger geometric producer there.  The anchor already assumes
`6 ≤ S.oppCap2.card` (`Rigid221SourceHeavy.lean:3591-3599`).  That hypothesis makes
`exactFourRigid221_sourceHeavyOtherXv_capProfile` return its
`secondOppositeLarge` constructor immediately, carrying `P.surface.capGrowth`
without eliminating it (`Rigid221SourceHeavy.lean:388-400`).  The live
coordinator later matches this constructor as
`secondOppositeLarge hsecond _ _`, discarding both the interior bound and the
growth witness before calling the large-cap closer
(`Rigid221SourceHeavy.lean:5154-5158`).

The only strict arithmetic improvement available after an independent case
split is `13 ≤ D.A.card` in the `surplus` and `firstOpposite` cases.  It is not
consumed by this branch and does not supply the missing row/incidence or blocker
localization.  The `secondOpposite` case permits the minimal profile
`(5,4,6)` at carrier cardinality twelve, so it gives no improvement over
`P.hcard : 12 ≤ D.A.card` (`Rigid221Placement.lean:705-712`).

## Exact declaration and producer

`ExactFourRobustCapGrowth S` is declared in
`lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:269-276` with
exactly three constructors:

1. `ExactFourRobustCapGrowth.surplus`:
   `6 ≤ S.surplusCap.card` (`:271-272`).
2. `ExactFourRobustCapGrowth.firstOpposite`:
   an `ExactFourFirstOppositeCapGrowth S` (`:273-274`), whose fields are
   `S.surplusCap.card = 5`, `5 ≤ S.oppCap1.card`, and
   `S.oppCap1.card + S.oppCap2.card + 2 = D.A.card` (`:250-255`).
3. `ExactFourRobustCapGrowth.secondOpposite`:
   an `ExactFourSecondOppositeCapGrowth S` (`:275-276`), whose fields are
   `S.surplusCap.card = 5`, `S.oppCap1.card = 4`,
   `6 ≤ S.oppCap2.card`, and `S.oppCap2.card + 6 = D.A.card`
   (`:259-265`).

The surface field is declared at
`ExactFourRobustCapExpansion.lean:280-290`.  Its sole producer is
`Problem97.ATailExactFourRobustCapExpansion.robust_capGrowth_of_card_ge_twelve`
(`:1413-1445`), installed by
`nonempty_postCardElevenRobustSurface_of_robust` (`:1449-1468`).  The producer
uses only cardinality at least twelve, second-apex deletion robustness, baseline
cap bounds, and `S.capSum`.  A live `#print axioms` check gives
`[propext, Classical.choice, Quot.sound]` for both this producer and
`exactFourRigid221_sourceHeavyOtherXv_capProfile`; neither depends on
`sorryAx`.

## Complete production-consumer census

An exact search for `ExactFourRobustCapGrowth`, `.capGrowth`, and
`capGrowth :=` under `lean/Erdos9796Proof/P97` found no production uses beyond
the declaration/producer above and these sites in
`FrontierLiveClosure/Rigid221SourceHeavy.lean`:

- `:368`: stores a growth witness in
  `ExactFourRigid221SourceHeavyOtherXvCapProfile.secondOppositeLarge`.
- `:400`: under `6 ≤ S.oppCap2.card`, stores `P.surface.capGrowth` unchanged.
- `:407-422`: destructs `P.surface.capGrowth` only after assuming
  `¬ 6 ≤ S.oppCap2.card`, hence after proving `S.oppCap2.card = 5` at
  `:401-405`.
- `:5154-5158`: the only downstream match of `secondOppositeLarge` discards the
  growth witness.  The identifier `robust_growth` occurs nowhere else.

Consequently the anchor at `:3591-3663` neither mentions nor receives a
constructor-specific consequence of `capGrowth`.  Its sole direct source
consumer is the parent pentagon theorem at `:3795-3800`.

## Constructor-by-constructor result under the anchor hypotheses

| Constructor | Combined facts | Existing closure / stronger producer |
|---|---|---|
| `surplus hsurplus` | Together with `P.surface.firstOppCap_card_ge_four`, anchor `hsecond : 6 ≤ S.oppCap2.card`, and `S.capSum`, gives `13 ≤ D.A.card`. | No closure.  It gives neither `6 ≤ S.oppCap1.card` nor any new row, distance, or blocker-localization fact.  No named production consumer exists for this arm in the large branch. |
| `firstOpposite hfirst` | `hfirst` gives surplus exactly five, first opposite at least five, and the exact budget.  Anchor `hsecond` yields `13 ≤ D.A.card`. | No closure.  First opposite may still have cardinality five, so the both-opposite-large APIs are unavailable.  The only downstream theorem accepting `ExactFourFirstOppositeCapGrowth` is the incompatible exact-second-cap-five closer at `Rigid221SourceHeavy.lean:2501-2527`; its `_hfirst` argument is unused. |
| `secondOpposite hsecondGrowth` | Gives surplus exactly five, first opposite exactly four, repeats second opposite at least six, and `S.oppCap2.card + 6 = D.A.card`. | No closure and no cardinality strengthening: second cap six gives carrier twelve.  There is no production consumer of `ExactFourSecondOppositeCapGrowth` beyond its constructor/profile split. |

The exact-second-cap-five surplus closer at
`Rigid221SourceHeavy.lean:2532-2560` likewise explicitly does not consume its
growth data (`:2529-2531`).  Both exact-five closers are unreachable from the
anchor's `hsecond`, and live `#print axioms` reports `sorryAx` for both, via
their shared unfinished placement closure.

## Existing APIs and theorem-bank checks

- `FrontierLargeOppositeCapsBiApexRobustResidual` requires **both**
  `6 ≤ S.oppCap1.card` and `6 ≤ S.oppCap2.card`
  (`LargeOppositeCapsBiApexSurface.lean:38-45`).  Its cardinality-fourteen
  theorem is at `:48-57`.  Neither `surplus` nor `firstOpposite` supplies the
  missing first-opposite-six hypothesis; `secondOpposite` fixes it at four.
- `carrier_card_ge_fourteen_of_both_opposite_caps_ge_six`
  (`OrientedPhysicalApexIngress.lean:117-130`) has the same missing hypothesis.
  `card_ge_fifteen_of_all_cap_card_ge_six`
  (`ExactFifteenApexProfile.lean:53-68`) additionally requires every cap to be
  at least six.
- `ATailBiApexRobustCapBounds.carrier_card_ge_thirteen`
  (`BiApexRobustCapBounds.lean:233-248`) requires a
  `FrontierBiApexRobustResidual`; the anchor packet exposes only an
  `OriginalUniqueFourResidual` and a second-apex robust surface.  There is no
  constructor from the anchor data to that bi-apex residual.  In any event,
  thirteen is only the same arithmetic floor obtained in the first two cases.
- `surplusCap_card_ge_six_of_largeOppositeCaps`
  (`TriApexEndpointRetainedOmission.lean:155-172`) consumes the stronger
  `FrontierLargeOppositeCapsBiApexRobustResidual`; it cannot construct that
  residual from a `capGrowth` arm.  Its transitive axiom set includes
  `sorryAx`, so it is not a proved closure route here either.
- The instructed sibling-bank census classifies
  `Problem97.largeCapInterior_card_le_three_of_surplus_card_five`
  (`RVOL.P97.U6ModeBDescent.lean:150`) as source-proved and reachable, but it is
  about the designated `D.packet.surplusCap` and `largeCapInterior D`, not
  `S.oppCap2` and `S.capInteriorByIndex S.oppIndex2`.  It also requires a
  different `CounterexampleData` packet and is not a local import/API match.
- The unimported source-proved bank theorem
  `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
  (`RVOL.P97.U1TwoLargeCapObstruction.lean:77`) requires five named points and
  seven exact distance equalities.  No `capGrowth` constructor produces those
  equalities or a placement into that packet.

The registry warning is material: “source-proved” is not a kernel axiom audit
(`certificates/p97_rvol_general_n_mining.md:7-16`; also
`docs/general-n-certificate-bank-mining-2026-07-09.md:348-367`).  The U5 and U1
banks contain contradiction consumers but lack the required live packet/
incidence producer (`docs/general-n-certificate-bank-mining-2026-07-09.md:369-405,407-430`).
Exact searches of all three exhaustive JSON registries found no declaration
matching `capGrowth`, `Rigid221`, `sourceHeavy`, or `pentagonOffClass`.

`nthdegree docs search --lean` was run for the three cap-growth alternatives,
the second-cap strict interior/class-five data, and the off-class pentagon
blocker pattern.  Its only plausibly related hits were the large-opposite API,
the wrong-cap U6 theorem, and generic card-five localization lemmas; none has
the anchor's required hypotheses and conclusion interface.

## Sorry dependence and final classification

- `robust_capGrowth_of_card_ge_twelve`: **proved**, no `sorryAx`.
- `exactFourRigid221_sourceHeavyOtherXv_capProfile`: **proved**, no `sorryAx`.
- `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`:
  body is literally `sorry` at `Rigid221SourceHeavy.lean:3662-3663`; live axiom
  output includes `sorryAx`.
- Its large-cap parent chain, including
  `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge`, also reports
  `sorryAx` (the existing audit driver is
  `lean/scratch/rigid221-large-split-axioms.lean:5-30`).

Thus `capGrowth` is a source-clean arithmetic producer but, for this anchor, a
discarded piece of bookkeeping.  No existing proved theorem turns any of its
three cases plus the anchor hypotheses into `False` or into the missing
geometric/incidence producer.  The highest available new consequence is the
unused branch-local `13 ≤ D.A.card` in two cases.
