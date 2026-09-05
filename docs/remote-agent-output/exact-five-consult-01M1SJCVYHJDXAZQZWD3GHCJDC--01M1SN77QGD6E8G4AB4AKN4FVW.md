# Exact-five consult: use the retained double-deletion witness

**Consult:** `01M1SJCVYHJDXAZQZWD3GHCJDC`  
**Requester:** `codex-rigid221`  
**Date:** 2026-09-05  
**Audited revision:** `c4ac26b1ea8e08dd74d0e1d4f7bf497c315339ba`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`

## Verdict and scope

There is a source-faithful, solver-free reduction that bypasses all four incidence cases and all remaining seven-role order cases. The existing field

```lean
R.interior.frontier.secondApexDouble
```

already supplies a second-apex four-row omitting **both original sources**. Replace only the second selected row, preserve the first row and canonical blocker row, reconstruct the normal form, and run the existing strict-fresh/tight-twelve split. Its two targets are the existing physical endpoint and the existing tight-twelve finite consumer. Do not call `false_of_exactFiveDistinct_threeCenterNormalForm`.

This is an exact reduction of the requested leaf to the physical leaf, **not a new unconditional, admission-free proof of False**. At the audited revision the physical leaf still ends in `sorry`. Consequently wiring this route removes the separate five-incidence admission, but the result still depends on the physical admission. I did not prove the physical endpoint in this consultation, and I did not find a counterexample to the full source hypotheses. No claim of hypothesis insufficiency is justified.

This double-deletion bypass is not being claimed as a newly discovered project idea: the cap-radius-drop handoff already mentions it. This consultation independently audits its current source, supplies a smaller support-preserving implementation draft, and derives an additional third-rich-radius consequence that avoids an incorrect reading of the hard-swap structure.

`ExactFiveDoubleDeletionConsult.lean` contains complete proof drafts for seven helper declarations, with no intentional proof placeholders. They have **not been elaborated** here; the sandbox has no Lean/Lake executable. No kernel-check or clean-axiom claim is made for the draft.

## 1. The stronger source fact is present, not merely derivable from robustness

Set

```text
O = S.oppApex1
c = S.oppApex2
U = blocker
a = N.retained
d = deleted
```

`FirstApexExactFiveInteriorFrontier.lean` stores a `Witness` with

```lean
secondApexDouble :
  HasNEquidistantPointsAt 4 ((D.A.erase q).erase w) S.oppApex2
```

`Witness.toCriticalPairFrontier` passes this same witness into its `secondApexDouble` field. `ExactFiveInteriorCriticalPairFrontier` stores the witness itself; its public `frontier` projection therefore retains the simultaneous-deletion fact. This is stronger than two independent singleton-deletion facts.

`N.orientation` identifies `(a,d)` with `(q,w)` or `(w,q)`. Commutativity of the two finset erasures proves, with no geometry,

```lean
theorem oriented_secondApex_doubleDeletion
    -- Usual R, C, N context; full declaration is in the companion draft.
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    HasNEquidistantPointsAt 4
      ((D.A.erase N.retained).erase deleted) S.oppApex2
```

Extract a positive radius class in the doubly erased carrier and trim it to four points. Lift that support to `D.A`, retaining both omission facts. The result is

```lean
exists_secondApexClass_avoiding_both_sources N :
  ∃ K : SelectedFourClass D.A S.oppApex2,
    N.retained ∉ K.support ∧ deleted ∉ K.support
```

Only `R.interior.frontier.secondApexDouble` and `N.orientation` produce this witness. Neither the incoming strict fresh source nor the four-incidence packet is required. There is no need to order residual heads, orient the deleted source into a middle slot, prove a radius inequality, or run a solver.

**Important restraint:** `K` is a selected four-subclass. Do not claim it is the complete radius class unless a separate upper bound proves that.

## 2. Replace the row without losing its source

Let `K` be the extracted second-apex row, with omissions `ha` and `hd`.

The draft's `replaceSecondRow C K hd` constructs `C'` by record update. It changes precisely

```text
survives₂, B₂, row₂, B₂_card, overlap_le_two.
```

It preserves `C.B₁`, `C.row₁`, the deleted source, the two centers, the actual-blocker exclusions, and all other source data. The new `row₂` is produced by the existing

```lean
ATailThreeCenterCommonDeletion.qDeletedK4ClassOfSelectedFourClass K hd
```

and the new overlap bound is

```lean
U5QDeletedK4Class.inter_card_le_two C.row₁ newRow C.centers_ne.
```

Do **not** replace this update with an unconstrained call to `nonempty_commonDeletionTwoCenterPacket`: that constructor selects supports existentially and need not preserve `C.B₁` or the deliberately chosen `K`.

## 3. A particularly small normal-form reconstruction

The companion draft's

```lean
physicalNormalFormOfAvoidingRow N K ha hd :
  ExactFiveDistinctThreeCenterNormalForm R (replaceSecondRow C K hd)
```

preserves these fields definitionally or by the original proofs:

```text
retained, retained_mem_A, orientation,
firstApexClass, firstApexClass_support_eq,
blockerClass, blockerClass_support_eq,
retained_mem_firstApexClass, retained_mem_blockerClass,
secondApex_robust.
```

Its new `secondApexClass` is `K`, and its alternative is explicitly `.physical`.

The construction needs a three-center deletion packet, but the normal form's `fresh` field is **not required to differ from `deleted`**. Use `fresh := deleted` provisionally. This is legitimate because all three rebuilt rows omit `deleted`: the first row is an erased class; the blocker row is `C.row₁`; the replacement row has `hd`. The existing support-preserving three-center constructor packages these three rows at the original deletion source.

The retained-source physical packet comes from

```lean
nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
```

using first-apex robustness and `ha`. It has exactly the type required by the physical endpoint.

This provisional choice is **not** a strict-fresh witness. It cannot be passed directly to the requested endpoint's sibling. The next step is mandatory.

## 4. Regenerate the strict source after replacement

Apply the existing

```lean
nonempty_strictThreeCenterAlternative R C' N'
```

to the rebuilt normal form. It has two exhaustive outcomes.

### 4.1 Genuinely fresh source

The result is a new `fresh'`, a proof `fresh' ≠ deleted`, and a three-center packet preserving the **new** three supports. Call

```lean
false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
  R C' N' fresh' fresh'_ne_deleted packet'
  retained_not_mem_new_second retainedPacket'
```

with that data. The retained source and blocker are unchanged. There is no call to the original five-incidence theorem or the downstream normal-form dispatcher.

The old strict fresh source is not reusable without proof: it can lie in the replacement second row even though it missed the old second row.

### 4.2 Exact-twelve tight physical cover

The result supplies the exact card-twelve, union-card-eleven, and erased-carrier equality hypotheses, together with the physical retained-source packet. Call

```lean
false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical
```

or inline its three checked construction steps and finite consumer:

```text
ExactFiveDistinctThreeCenterTightCover.nonempty_balancedTightCoverInvariant
nonempty_balanced555SourceConfiguration
nonempty_balanced555FiniteConfiguration
Balanced555FiniteUnsat.false_of_balanced555FiniteConfiguration
```

The current tight-twelve declaration occurs after the five-incidence declaration in `Rigid221Closure.lean`. Move it earlier, or extract its independent consumer, before using it in the new five-incidence body. Do not solve the declaration-order issue by calling the downstream normal-form dispatcher.

The underlying counting argument is transparent. Two four-rows share the retained source, so their union has at most seven points; adding the replacement row gives at most eleven. All three rows omit the original deletion. Since the carrier has at least twelve points, either the erased carrier has an uncovered point (the strict fresh source) or the carrier has exactly twelve points and its deletion is exactly the eleven-point union.

## 5. Recommended noncircular dependency layout

Use this directed dependency order:

```text
double-erasure selected-row extractor
  -> oriented source witness
  -> both-source-omitting second row
  -> support-preserving C' and physical N'
  -> strict-source alternative
       -> physical consumer
       -> independent tight-twelve consumer
```

A useful audit theorem should parameterize the physical consumer as a hypothesis and prove the reduction without importing `Rigid221Closure`. This separates the sound reduction from the remaining admitted physical result. Instantiate it in `Rigid221Closure` only after independently testing the helper module.

Then replace the production normal-form dispatcher itself with the same physicalized route. That makes the four-incidence work unnecessary for this particular source-clean exact-five ingress. It does not invalidate those geometric lemmas or imply that they have no other consumers.

**Status accounting:** after wiring the route, one independent admission can disappear. A theorem that calls the still-admitted physical endpoint still has `sorryAx` in its dependency closure. It is not an unconditional completion of the exact-five proof.

## 6. New hard-swap consequence: there must be a third rich radius

A separate source audit matters for interpreting the existing hard route.

`ExactFiveDistinctSecondApexHardSourceSwap` stores an old full four-class, a replacement full four-class, their distinct radii, their disjoint supports, opposite incidences of `a,d`, and the condition that every positive radius class has size less than five.

It does **not** store that these two classes are the only rich classes. It also does **not** store the producer's temporary hypothesis that no row avoids both sources. Therefore the exported structure itself cannot be declared contradictory merely because the double-deletion row exists. The phrase “the two complete positive radius classes” in its docstring should not be read as an exhaustive-classification theorem.

For a hard-swap packet `P`, let `K` be the extracted both-source-omitting row. Since all positive classes have size below five, `K` is now the whole class at its radius: its support has four points and is a subset of a class of at most four points.

Its radius differs from the old radius. Otherwise its full support would equal the old full support and would contain `a`, contradicting omission. Likewise its radius differs from the replacement radius, because the latter full support contains `d`.

Thus the hard packet forces **three pairwise disjoint full four-classes** at the second physical apex. The companion draft supplies the complete statement and proof attempt:

```lean
hardSourceSwap_has_third_full_fourClass P
```

This deduction uses the retained source witness, not the four-incidence prefix or any order kernel. The *negative-existence branch* in `exactFiveDistinct_secondApex_physical_or_hardSourceSwap` can simply be avoided because the existential left arm is always constructible for this live source. This is distinct from proving every value of the exported hard-swap structure impossible.

### 6.1 Carrier and cap bounds, with a proof

Three disjoint four-class supports give twelve distinct points; their common positive-radius center is outside all three. Hence every live hard-swap packet has at least thirteen carrier points.

The cap geometry gives the stronger bound. Apply the existing theorem

```lean
SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two
```

to each of the three radii at `S.oppIndex2`. Each radius contributes at least two points to that strict opposite-cap interior. The three slices are disjoint because the radii are distinct. Therefore

```lean
6 ≤ (S.capInteriorByIndex S.oppIndex2).card.
```

This is the second opposite-cap strict interior, equivalently `S.oppInterior2` after the standard index conversion. Its closed cap has at least eight points by `ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two`.

The exact-five first-apex class already gives at least three points in the first strict opposite-cap interior, hence at least five in its closed cap. `S.surplus_card_gt_four` gives at least five in the surplus closed cap. Finally, the three closed caps have total cardinality `D.A.card + 3`. Consequently

```text
D.A.card + 3 >= 5 + 8 + 5 = 18,
D.A.card >= 15.
```

These cap-counting consequences are prose-proved here; their additional Lean adapters are not included in the companion draft. Precise proposed statements, in the same context as `hardSourceSwap_has_third_full_fourClass`, are

```lean
theorem hardSourceSwap_secondCapInterior_card_ge_six
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) :
    6 ≤ (S.capInteriorByIndex S.oppIndex2).card

theorem hardSourceSwap_carrier_card_ge_fifteen
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) :
    15 ≤ D.A.card
```

In particular, the live hard-swap branch is impossible at carrier sizes 12, 13, and 14, and whenever that second strict cap interior has at most five points. This does not refute the hard packet at all larger cardinalities and does not prove the physical endpoint.

## 7. Formalization order for luna-swarm

First elaborate the seven helpers in the companion file in an isolated module, under the pinned interfaces or their current equivalents. Inspect their axiom closures and keep them below `Rigid221Closure`. Correct elaboration issues rather than adding admissions.

Next wire the row replacement and strict-source split to the two existing consumers, with an explicit source audit that `C'.B₁ = C.B₁`, `N'.retained = N.retained`, `N'.secondApexClass.support = K.support`, and the fresh packet is regenerated after replacement.

Then add the cap-six/carrier-fifteen corollaries and correct the hard-swap docstring or add a warning about the absence of exhaustiveness. These give genuine closed smaller-cardinality subcases, rather than another order-wrapper obligation.

Finally focus the remaining mathematical work on the physical endpoint with the replacement second row retained. The present consultation does not justify further solver work on the four extreme deleted-source slots as a prerequisite for this source-clean ingress.

## 8. Source and validation ledger

All paths below were read through the GitHub connector at the pinned revision unless noted. Indexed theorem search was used for navigation, not as proof of current source contents.

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`, lines 1530–1665: physical and five-incidence admissions, tight-twelve consumer, and downstream dispatcher. File blob `77e357f15b4c3bc7278f5af5f53d9c8851bfe315`.
- `lean/Erdos9796Proof/P97/ATail/FirstApexExactFiveInteriorFrontier.lean`, lines 175–405: stored witness, its producer, transport to the critical frontier, and public frontier projection. Blob `52058107ad48cc3be27422cef571f029c7e73d0e`.
- `lean/Erdos9796Proof/P97/ATail/FirstApexUniqueRadiusResidual.lean`, lines 156–190: live distinct-center residual and its retained interior frontier.
- `lean/Erdos9796Proof/P97/ATail/ExactFiveDistinctThreeCenterContinuation.lean`, lines 63–140 and 220–570: exact normal form, strict alternative, and source construction. Blob `4a8be4878509247fed3f3502aa77337b8b2582f8`.
- `lean/Erdos9796Proof/P97/ATail/ExactFiveDistinctSecondApexSourceSwap.lean`, lines 219–365: hard-swap fields and robustness-based disjunction. Blob `02f53324e3b1444aba80a74648a8d6710e7e0e22`.
- `lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean`: packet fields and source constructors. Blob `680c264243af9fd15cc2fabb5992f375ba51f5a3`.
- `lean/Erdos9796Proof/P97/ATail/ThreeCenterCommonDeletion.lean`, lines 24–100: omitted selected row conversion and support-preserving three-center constructor. Blob `a6329b03e08df88833a53acfb20232c6249ae4a6`.
- `lean/Erdos9796Proof/P97/ATail/CapInteriorRadiusCounting.lean`, lines 27–136: two-interior-hit and cardinality-minus-two bounds. Blob `acc5cb7810e66b5300035b35bdd632e342008d9c`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctOpposedTurnHardSource.lean`, lines 292–340: existing physical-or-interior-at-least-five conclusion under additional incidence hypotheses.
- `docs/references/exactfive-cap-radius-drop-original-2026-09-05/cap-radius-drop-proofs-and-formalization.md`: prior acknowledgment of the unwired double-deletion bypass; no novelty claimed for that project idea.

The requester supplied an update pointing to the already-pushed squared-distance guard `secondApex_sqDist_lt_sqDist_blocker`. That guard is not needed for the reduction or third-radius consequence above. No conclusion here relies on the uncommitted PIQD canary or treats UNKNOWN/SAT partial-block solver outcomes as evidence for or against the full source theorem.

No repository write, pull request, Lean build, or SAT/UNSAT run was performed. Delivery and consult-completion receipts are recorded separately in the session checkpoint.
