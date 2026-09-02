# TriApex paired common-deletion leaf closure plan

Date: 2026-09-01
Lane: `d1-triapex-plan-20260901`
Base head: `9a222da97112efc204a038ca2f71ff5a12078f94`

Status: ACTIVE COVERING PLAN. Nothing in this document closes a Lean
theorem. Every mathematical claim below carries a rigor label. Ambiguity
markers follow the house convention.

Label note. Project prose uses "D1" for three different things: this leaf
(the F1 TriApex lane), the two-radius leaf now called "D-R"
(`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`), and a 2026-07-06
rigidity literature scan about the card-12 census. This plan says "the
TriApex leaf".

## 1. Target

```text
Problem97.ATailFrontierLiveClosure.false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2028
```

Publish target: `Problem97.erdos97_rhs`.

Immediate consumer:
`false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`
(`TriApexEndpointRetainedOmission.lean:2054`). It builds `Q` with the
kernel-checked producer `triApexFiveSurviveOneFailOfApexRich`
(`ATail/TriApexFiveSurviveOneFail.lean:71`) from `S`, `H`, `O.kept`,
`O.deleted`, `D.convex`, `G.apex_rich`, and forwards `J` and `G` unchanged.

Two proved ingress routes reach that consumer:

- source-return route: `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`
  (`:2569`) dispatches `PairedCommonDeletionOutcome`
  (`ATail/PairedCommonDeletionNormalForm.lean:237`). Its sibling arm
  `twoRadiusGrid` is kernel-closed by
  `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core` (`:2395`,
  the "D2" grid). Only the `apexClassJointDeletion` arm is open.
- reverse-hit route: `false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core`
  (`:2076`) through `nonempty_pairedApexClassJointDeletion_of_reverseHit`
  (`:1922`).

Spine status at base head: on spine, one consumer, sole open TriApex
obligation, subtree of 11 nodes with 10 closed dependencies, 28 open
obligations project-wide. Files `TriApexEndpointRetainedOmission.lean`,
`TriApexFiveSurviveOneFail.lean`, and `PairedCommonDeletionNormalForm.lean`
are unchanged since the 2026-08-30 source extract
(`docs/checkpoints/d1-source-interface-extract-2026-08-30.md`, revision
`020e43bfc`); every line anchor in that extract was re-verified at base head.

## 2. Binder map

| Binder | Content | Reconstructible extras |
|---|---|---|
| `D : CounterexampleData` | carrier `A`, `convex : ConvexIndep A`, `K4`, `packet` (`U1TwoShortCapReduction.lean:83`) | `D.capSum` (`:98`): `surplus + opp1 + opp2 = card + 3`; `D.surplus_card_gt_four` |
| `S : SurplusCapPacket D.A` | MEC triangle, three closed caps, surplus index (`Cap/PartitionFromMEC.lean:332`) | `capByIndex`, `capInteriorByIndex` disjointness lemmas; complete ordered cap `capByIndex_cgn4g_capData_oriented` (`SurplusM44Packet/Shard01.lean:704`, needs `D.convex`) |
| `radius : ℝ` | frontier radius | `0 < radius` from `F.radius_pos` |
| `H : CriticalShellSystem D.A` | every `x ∈ A` has a blocker centre `c(x) ≠ x`, an exact four-point shell containing `x`, and `¬K4(A \ {x}, c(x))` (`U1CarrierInjection.lean:1116`) | `cross_deletion_survives_iff_not_mem_selected_support` (`ATail/CriticalPairFrontier.lean:781`); `SelectedFourClass.inter_card_le_two` (`U1CarrierInjection.lean:474`) |
| `F : CriticalPairFrontier D S radius H` | frontier pair packet (`ATail/CriticalPairFrontier.lean:568`) | only `F.radius_pos` reaches the leaf |
| `R : FrontierCommonDeletionParentResidual F` | `minimal : D.Minimal`, `noM44`, `9 < card`, `4 ≤ (SelectedClass D.A S.oppApex1 radius).card`, common-deletion residual (`ATail/OrientedPhysicalApexIngress.lean:251`) | `R.firstApexFullyDeletionRobust`, `R.actualBlocker_ne_firstApex`; `criticalShell_inter_frontierRadiusClass_card_le_two` (`ATail/FirstApexCriticalFiberRow.lean:178`) |
| `P`, `O` | two distinct sources `kept`, `deleted` on `Γ(oppApex1, radius)` in the strict first opposite cap, distinct blockers, `deleted ∉ shell(kept)`, packet certifying `A \ {deleted}` keeps K4 at `oppApex1` and at `c(kept)` (`ATail/RetainedMatchingLargeCapConsumer.lean:203`) | packet rows are chosen four-subsets with `overlap_le_two` (`ATail/CommonDeletionTwoCenter.lean:30`) |
| `J : PairedApexClassJointDeletion O` | `source` on `Γ(oppApex1, sourceRadius)`, class card `≥ 4`, omitted by both retained shells, two packets: `A \ {source}` keeps K4 at `oppApex1`, `c(kept)`, `c(deleted)` (`ATail/PairedCommonDeletionNormalForm.lean:93`) | `source ≠ kept, deleted`; `c(source) ∉ {c(kept), c(deleted)}` (`:140`, `:154`); four pairwise-distinct centres `oppApex1, c(kept), c(deleted), c(source)`. Both live producers set `sourceRadius := radius` (`TriApexEndpointRetainedOmission.lean:2012`, `PairedCommonDeletionNormalForm.lean:556`); `J` never records `sourceRadius ≠ radius` |
| `G : TriApexAllLargeContext D S` (`Prop`) | all three caps `≥ 6`; all three apices apex-rich; `card ≤ 4 · |notRobustCenters|`; no point equidistant from all three MEC vertices (`ATail/AllLargeCapCanonicalInterfaces.lean:297`) | `15 ≤ card` from `capSum`; every blocker centre lies in some strict cap (`AllLargeCapCanonicalInterfaces.lean:317`); one-hit rule on other rich cap slices (`TriApexEndpointRetainedOmission.lean:312`, `:718`); at card 15: `capByIndex_card_eq_six_of_card_eq_fifteen`, `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, `twoRichClassSlices_partition_of_capInterior_card_eq_four` (`ATail/ExactFifteenApexProfile.lean:134`, `:158`, `:170`) |
| `Q : TriApexFiveSurviveOneFail S H O.kept O.deleted …` | `W : StrictApexFourFamily`: three pairwise-disjoint four-point strict-cap supports, total twelve, each with `oneRadius`/`twoRadii` provenance (`ATail/ApexRichFourWitness.lean:30`, `ATail/TriApexFourWitness.lean:79`); `E ⊆ W.support \ (shell(kept) ∪ shell(deleted))`, `E.card = 4`; for every `x ∈ E`: K4 survives in `A \ {x}` at all three apices and both retained blockers, fails at `c(x)`, and `c(x)` differs from all five surviving centres (`ATail/TriApexFiveSurviveOneFail.lean:42`) | `Q.exists_distinct_same_index` (`:156`): two distinct points of `E` share one cap index. NOT reconstructible: `W.supportAt i = capInteriorByIndex i`, any `Fin 4` order of a support, any radius-class equality |

Provenance dropped at the leaf boundary (PROVEN facts that exist upstream but
are not fields of `J`, `G`, or `Q`):

- reverse-hit route: reverse blocker in the strict first cap and exact
  `reverseShell ∩ firstCap = {kept, deleted}`
  (`ATail/RetainedMatchingLargeCapConsumer.lean:288-294`); the complete
  ordered first cap with strict betweenness of the reverse blocker between
  `kept` and `deleted` (`exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit`,
  `TriApexEndpointRetainedOmission.lean:479`); both base-angle acuteness
  inequalities (`reverseHit_twoCenter_sqdist_acute`, `:606`, consumed
  nowhere); a fresh first-cap source outside the reverse row (`:705`).
- source-return route: the U5 ingress rows and dangerous blockers of
  `nonempty_sourceReturnU5Outcome`
  (`ATail/RetainedMatchingSourceReturnRadiusSplit.lean:670`); the paired
  normal form calls the weaker radius outcome (`:484`) and drops them at
  `PairedCommonDeletionNormalForm.lean:555-563`.

The two routes drop different data, so any adapter re-split must be stated
per route.

## 3. Recorded obstructions

All as labelled by their sources.

- O1 PROVEN. Polarity mismatch: the directed omission supplies survival
  (`v ∉ shell(u)`), the banked two-hit localizer needs failure (`v ∈ shell(u)`)
  (`docs/solve-prompts/2026-07-28-e-round1-response.md` §2).
- O2 PROVEN. The low-hit bound `≤ 2` on apex classes is the generic two-circle
  bound; it is not new information (same source §1).
- O3 PROVEN as a statement about the hypotheses. Rich interior patterns attach
  no point to any row; the missing object is a positive three-hit incidence
  producer (same source §4).
- O4 PROVEN. Minimality gives no removable vertex: deleting a safe source
  keeps K4 at three apices and both retained blockers but destroys K4 at its
  own blocker; `card ≤ 4 · |N|` bounds `|N|` from below only (same source §5).
- O5 EMPIRICALLY VERIFIED, exhaustive within the distance-equality/incidence
  abstraction only. A 15-point equality model realizes every incidence
  hypothesis of the E1 family at once (same source, "Exhaustive structural
  check"; corroborated by the cyclic block-incidence construction in
  `docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md:40-46`). A proof
  needs metric or convex-order content.
- O6 EMPIRICALLY VERIFIED at the incidence level. The global escape complement
  `Z = A \ (shell(kept) ∪ shell(deleted))` has `7 ≤ |Z|`, but safe counts
  `(2, 2, 0)` on the three strict supports realize `|Z| = 7` with no four safe
  points on one support; `Z` is not a sound ingress by itself
  (`checkpoint4-review.md:110-128`).
- O7 PROVEN source fact. `J` gives one source on a class of card `≥ 4`, not a
  same-radius pair and not four ordered sources.
- O8 PROVEN by a kernel-checked model. A generic `CriticalShellSystem`
  contradiction is false: the eight-point two-cycle geometry extends to a full
  shell system, so blocker cycles, radius potentials, and same-shell chord
  inequalities cannot close this leaf without `Q` and `G`
  (`scratch/retained-omission-e1/general-critical-shell-cover/REPORT.md`).
- O9 PROVEN source fact. `CommonDeletionTwoCenterPacket` rows are chosen
  four-subsets; their complements do not give nonmembership in a full
  `H.selectedAt` shell.
- O10 SOURCE-CHECKED. Provenance loss at the `J` adapter, listed in Section 2.
- O11 UNRESOLVED (ledger label). The F1 "preferred bypass" is architectural,
  not a closed route (`docs/dead-ends.md:1567-1594`).

## 4. Routes tried

Dead, with the killer:

| Route | Killed by |
|---|---|
| two-hit localization on the omission edge | O1 |
| pure counting from `card ≤ 4·|N|` plus low hits | O4, O5 |
| minimality gives a removable vertex | O4 |
| global complement `Z` as isolated ingress | O6 |
| generic blocker-graph / blocker-cycle / radius potential | O8; `docs/dead-ends.md:1417-1436` |
| power-matrix, Ptolemy/Plücker, Gram, EDM audits on packet rows | O9 |
| `false_of_frontierAllLargeCapsTriApex_all_low_hits` as alternate consumer | circular: its omission constructor calls the ancestor of this leaf |
| routing the transverse `2×2` packet to the D2 grid consumer | forbidden: the transverse packet is not the grid (`docs/erdos-97-descent-prose-proof-atomic.md:8586-8592`) |
| round-12 theorem-bank hunt for a positive cross-cap two-hit producer | none found; near candidates circular or stronger |

Partially proved (v87 route, `docs/erdos-97-descent-prose-proof-atomic.md:8544-8607`):
the twelve-witness producer, the four-source complement, per-source
five-survive/one-fail signatures, and the same-index pair are kernel-checked
(`Q` and `Q.exists_distinct_same_index`). The finite low-span kernel
`finFour_exists_nearby_mutualFalse_of_card_le_two`
(`ATail/FourVertexLowSpan.lean:28`) is kernel-clean with axioms `propext`,
`Classical.choice`, `Quot.sound`. Everything after that is conditional prose:

1. ingress from a same-cap safe pair to four ordered sources on one radius
   (missing);
2. the cross-radius transverse `2×2` saturation (no Lean statement);
3. the same-radius `μ = 0` paired fixed point (no consumer);
4. the same-radius strict two-cap disjoint `K2,2` plus global escapes (no
   consumer; the MEC-cap acute-visibility step has no Lean adapter).

CONJECTURED, all four. The 2026-08-30 extract adds: exact fifteen proves card
four strict interiors and the two-radius `2+2` partition but packages neither
`W.supportAt i = capInteriorByIndex i` nor a `Fin 4` order of that interior,
so the exact-15 one-radius arm produces no checked `μ = 0` packet
(`d1-source-interface-extract-2026-08-30.md:1193-1195`). The proposed
constructors `CrossApexExactFourPaired`, `ExactNonFirstSaturation`,
`TransverseTwoRadius` do not exist in Lean.

Historical v23 recursion (`erdos-97-descent-prose-proof-atomic.md:8681-8730`)
is a source-audited fallback with a stated lexicographic measure; it is not
the current frontier.

## 5. Reuse preflight

Search key: the leaf statement with `J`, `G`, `Q` as available hypotheses;
consumer `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`;
source revision `9a222da97`. Tools: `proof-blueprint search` and
`nthdegree docs search --corpus erdos-97-96-formalization-lean`. Re-run only
when the key changes. A prior search at revision `020e43bfc` is recorded in
`d1-source-interface-extract-2026-08-30.md:1141-1180` with the same
conclusion.

Direct contradiction consumer for the leaf as stated: none. Every
`False`-producing theorem of the joint-deletion family is stated over
`OriginalUniqueFourResidual` or physical-second-apex data, not over
`OrientedRetainedCommonDeletion`. Forty-three declarations reach the target
`sorry` (the reverse-hit wrapper and everything above it); nothing from that
set may be consumed.

Producers whose antecedents the leaf supplies now (all `sorry`-free, none
circular):

| Candidate | Location | Gives | First missing antecedent |
|---|---|---|---|
| `nonempty_selectedFourClass_preserving_point` | `ATail/FirstApexCriticalFiberRow.lean:45` | a `SelectedFourClass D.A S.oppApex1` row `K` with `J.source ∈ K.support` | none: `J.sourceRadius_pos`, `J.source_mem_class`, `J.sourceClass_card_ge_four` |
| `sourceFaithfulDeletionFan_of_triApexAllLargeContext` | `ATail/SourceFaithfulSelectedFourFan.lean:133` | a source-faithful deletion fan on `K`: every row point's blocker is cap-localized and blocking, with the equal-support/small-overlap dichotomy | none once `K` exists; `G` is the only other input |
| `exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker` | `ATail/SourceFaithfulSelectedFourFan.lean:446` | two points of `K` mutually omitting one another, with distinct blockers and both cross-deletions surviving | `∀ w ∈ K.support, S.oppApex1 ≠ H.centerAt w`; follows from `G.apex_rich` through `not_isUniqueFourCenter_of_fullyDeletionRobust` (`MinimalUniqueFourCover.lean:210`) {{NEEDS_PROOF}} as an elaborated term |
| `exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge` | `ATail/AllLargeCapCanonicalInterfaces.lean:317` | every blocker centre in some strict cap | none |
| `Q.exists_distinct_same_index` | `ATail/TriApexFiveSurviveOneFail.lean:156` | same-index pair in `E` | none; zero consumers today |

The first three chain into a same-radius mutually omitting pair on a
four-row at the first apex containing `J.source`, from `J` and `G` alone.
This is the "smallest helper" the 2026-08-23 audit asked for; it exists and
is unconsumed. Phase 1 item L6 wires it.

Consumers whose antecedents the leaf does not supply (recorded so they are
not re-derived):

| Candidate | Location | First missing antecedent |
|---|---|---|
| `selectedFourClass_three_rows_tetrahedron_incompatibility` | `ATail/RobustApexCommonDeletion.lean:33` | the saturated three-row incidence pattern between centres |
| `u5_unit_triangle_on_p_circle_incompatibility` | `U5GlobalIncidenceKernels.lean:318` | six explicit distance equalities |
| `finFour_exists_nearby_mutualFalse_of_card_le_two` | `ATail/FourVertexLowSpan.lean:28` | an order-faithful `Fin 4` indexing of four sources (Phase 1 L5) |
| `false_of_selectedFourClass_common_actualCenter_pair_outside_cap` | `ATail/SourceFaithfulSelectedFourFan.lean:661` | two row points with the same blocker plus cap placement of centre, blocker, and both points |
| `false_of_orderedCap_three/four_equidistant_betweenness_cycle` | `FrontierLiveClosure/Rigid221SourceHeavy.lean:3601`, `:3664` | `MecCapPacket`, `MinorCapSideHypotheses`, `StrictCapOrder`, and cap indices for the sources (the same order lift) |
| `exists_fourHits_strict_cross_distance_oppIndex1` | `ATail/ExactFourAdjacentGridKalmanson.lean:1107` | an `ExactFourTwoRadiusAdjacentCapGrid` at `oppIndex1` |
| `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, `twoRichClassSlices_partition_of_capInterior_card_eq_four` | `ATail/ExactFifteenApexProfile.lean:158`, `:170` | `D.A.card = 15` (Phase 3 cardinality split) |
| `not_exists_distinct_actualBlocker_with_both_frontierDeletions_blocked` | `ATail/AnchoredDoubleDeletionProducer.lean:323` | a `SurvivorPairRelocationPacket`, which `O` and `P` do not expose |

Infrastructure imported by the target file and currently orphaned on the
spine, all `sorry`-free: `pairedGrid_exists_fourHits_radialCyclicOrder`
(`TriApexEndpointRetainedOmission.lean:1088`, zero consumers) and through it
the `ExactFourAdjacentGridKalmanson` cyclic-order chain; `FourVertexLowSpan`;
`TwoRadiusGridCapBoundarySigns.boundary_escape_sign_packet` (`:268`, zero
consumers); `EndpointFreshTwoShellSeed` top result (off-spine consumers only);
`SourceFaithfulSelectedFourFan.exists_distinct_outsideCap_fan_escape_or_crossDeletion`
(`:723`, off-spine consumer only).

Cross-project: the RVOL bank's q-deleted three-class tetrahedron
incompatibility and `eq_of_equidistant_three_noncollinear` have local
analogues already in the import cone; nothing in mathlib or the other
configured corpora matches the leaf's shape.

Search keys that returned nothing useful: "four centre circle infeasibility";
"Kalmanson" (only SAT-clause names; the content lives in
`ExactFourAdjacentGridKalmanson.lean`); `--name 'false_*'` combined with
`--sig` on packet names (the flags conjoin); "seven distinct centers"; "five
survive one fail"; "reverse row cap intersection". `proof-blueprint search
--uses` needs the fully qualified name, and `--used-by … --with-sorry` is one
hop only.

## 6. Highest-risk assumption and measure

Highest-risk load-bearing assumption: that the leaf is refutable from `J`,
`G`, `Q` at all. Incidence content alone is satisfiable (O5, O6), every v87
terminal is conditional, and no terminal has a contradiction consumer. The
plan tests this assumption before investing in adapters, with one exception:
the Phase 1 controls are needed in every outcome and are cheap.

Cell classification (Phase 1 checkpoint of 2026-09-01; theorem names are in
`TriApexEndpointRetainedOmission.lean`). Two index choices are available and
they carry different proven facts:

- Pair index `i` (PROVEN): two of the four sources of `E` lie on one indexed
  support `W.supportAt i`, and both avoid both retained shells
  (`exists_index_safe_pair_of_fiveSurviveOneFail`). Hence at `i` the
  `oneRadius` arm has safe count `s ∈ {2, 3, 4}` and the `twoRadii` arm has
  safe pair `(s₁, s₂)` with `s₁ + s₂ ≥ 2`
  (`strictApexFourWitness_safe_counts_of_pair`). The nine cells below are
  exhaustive at `i`. Every safe point carries the full five-survive/one-fail
  signature (`deletionSignature_of_not_mem_two_retainedShells`).
- Blocker-free index `j` (PROVEN): every blocker centre lies in some strict
  cap (`AllLargeCapCanonicalInterfaces.lean:317`), and some `j` avoids both
  retained blocker centres (`exists_capIndex_avoiding_two_blockers`). The
  one-hit rule (`:312`) then bounds each retained shell by one point per
  radius slice of cap `j` (`strictApexFourWitness_safe_counts_of_oneHit`).
  In the `oneRadius` arm this gives `s ≥ 2`. In the `twoRadii` arm it gives
  only one hit per shell per slice, so the safe pairs `(1,0)`, `(0,1)`,
  `(0,0)` are not excluded at `j`. The 2026-08-23 audit
  (`docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md`) already listed
  zero-safe slices. The first version of this section claimed `s₁ + s₂ ≥ 2`
  at `j` from the one-hit rule alone; that claim was wrong for the `twoRadii`
  arm and is withdrawn.

The measure below is anchored at the pair index `i`. When `i = j` both fact
sets hold at once; whether Phase 3 needs `i = j` is open {{NEEDS_PROOF}}.

Cells at `i`:

- `oneRadius` at `i`: safe count `s ∈ {2, 3, 4}` on one radius (3 cells);
- `twoRadii` at `i`: safe pair `(s₁, s₂)` on the two two-point slices with
  `s₁ + s₂ ≥ 2`: `(2,2), (2,1), (1,2), (2,0), (0,2), (1,1)` (6 cells). The
  cell `(1,1)` is the transverse saturation of item 2 above; every other cell
  carries a same-radius safe pair.

Measure `M` = number of (cardinality class, cell) pairs not covered by a
checked terminal or replayed certificate, with cardinality classes
`{15, ≥ 16}`. At base head `M = 18`. A checkpoint counts as proof progress
only if `M` strictly decreases and the raw on-spine `sorry` count does not
increase, except as allowed by the split rule in Phase 3.

## 7. Phases

### Phase 0 — coverage and lane (this checkpoint)

- Anchor the blueprint session on the target.
- Lane checkpoint `.codex/worktree-checkpoints/d1-triapex-plan-20260901.json`.
- This document; index entry; ledger pointer.

### Phase 1 — Lean positive controls (on spine, cheap)

Each item is proved as a kernel-checked lemma that the leaf consumes in its
proof prefix. No wrapper networks. None of these reduces `M`; they are
infrastructure every later phase needs.

Status (2026-09-01): L1 to L6 are proved in
`TriApexEndpointRetainedOmission.lean` (section `TriApexLeafControls`) and
consumed in the leaf's proof prefix; the leaf's single `sorry` is unchanged
and `M = 18` is unchanged. Phase 1 is complete.

- L1 same-index pair: done, `exists_index_safe_pair_of_fiveSurviveOneFail`
  (consumes `Q.exists_distinct_same_index`; adds that both pair points avoid
  both retained shells).
- L2 blocker localization: done for `O.kept` and `O.deleted`,
  `exists_capIndex_avoiding_two_blockers` (consumes
  `exists_criticalShell_center_with_otherRichCapSlice_card_le_one`, `:718`).
  `J.source` and the pair points localize through the same producer when a
  Phase 3 cell needs them; the prefix does not bind them yet.
- L3 safe-slice classifier (checkpoint-4 step 1): done in two forms, see
  Section 6: `strictApexFourWitness_safe_counts_of_pair` at the pair index
  and `strictApexFourWitness_safe_counts_of_oneHit` at the blocker-free
  index. The earlier {{NEEDS_PROOF}} on per-point signatures is closed by
  `deletionSignature_of_not_mem_two_retainedShells`, which gives the full
  signature for any carrier point outside both retained shells.
- L4 exact-15 identity: done,
  `strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen`
  (reuses `ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen`,
  reachable through the existing `EndpointFreshTwoShellSeed` import).
- L6 first-apex mutual-omission pair: done,
  `exists_firstApex_mutualCrossDeletion_pair_through_source`: a four-row
  `K ∋ J.source` at `oppApex1` with `K.radius = J.sourceRadius`, carrying a
  mutually omitting pair `z ≠ w` with distinct blockers and both
  cross-deletions surviving. {{NEEDS_PROOF}} that the pair is not
  `{kept, deleted}` again; `K` may contain them.
- L5 order adapter (the 2026-08-30 extract's next interface test): done,
  `exists_orderedCap_six_of_card_eq_fifteen`. At card 15 the oriented
  complete cap order of every cap has exactly six slots
  (`orderedCap_card_eq_of_image_eq_capByIndex`), slots `0` and `5` are the
  two Moser vertices of the cap, and a slot lies in the strict interior
  exactly when it is not an endpoint slot
  (`orderedCap_points_mem_capInteriorByIndex_iff`, cardinality-generic).
  The four middle slots `1..4` are therefore consecutive and enumerate
  `capInteriorByIndex i` injectively; with L4 they enumerate
  `W.supportAt i`, which in the `oneRadius` arm is the full same-radius
  slice. `StrictCapOrder` supplies the chord-projection order and the
  between-slot characterization that the interval count `μ` of Phase 3a
  needs. The decision point did not trigger. Not retained here: the
  reverse-hit provenance of Section 2, which lives in `J`'s producer, not in
  this cap-order adapter.

### Phase 2 — kill-test (computational, discovery gate only)

Question: is each Section 6 cell refutable from its own binders at
`card = 15`? At card 15 the carrier is the three apices plus the twelve
strict-interior points, so the named-role quotient and the full carrier
coincide; one encoding suffices.

Solver lane and approvals (sat-solvers skill policy):

- every SAT stage runs through `piqd`; the metric stage is the existing
  `piqd` Z3 `QF_NRA` profile; no local solver fallback;
- any non-`piqd` engine (cvc5, Singular, msolve, SymPy replay) needs Adam's
  per-task approval before it runs; {{NEEDS_ADAM_INPUT}};
- every run carries a wall-clock timeout; no cube-and-conquer without a cube
  cap.

Known limit: the D-R lane found Z3 `QF_NRA` through `piqd` compute-blocked on
an 18-atom geometric negative control
(`docs/plans/2026-09-01-dr-two-radius-branch-closure.md` Phase 1 status). A
15-point convex encoding is larger. Expect the metric stage to be
inconclusive; the equality-only stage is already known SAT (O5), so the
decision rule below treats `UNKNOWN` as the likely outcome.

Encoding: the full binder block of Section 2, at `card = 15`, profile
`(6, 6, 6)`, per cell:

- roles: three apices; strict interiors `I₀, I₁, I₂` of four points each;
  `kept`, `deleted`, `source ∈ I₁ ∩ Γ(a₁, radius)`; the witness radii at `j`
  per cell; blockers `c(x)` for all fifteen points, each an exact four-shell
  containing `x`, blockers avoiding apices, apex-rich classes at all three
  apices; the four common-deletion packets of `O` and `J` as chosen four-rows
  with overlap `≤ 2`; deletion survival and failure per `Q`; convex cyclic
  order; no point equidistant from all three MEC vertices; `card ≤ 4·|N|`.

Guardrails:

- Smoke tests before any verdict is trusted: re-encode the kernel-closed D2
  sibling context `PairedTwoRadiusGrid` and confirm the metric stage reports
  UNSAT; re-encode the 15-point equality shadow and confirm the equality-only
  stage reports SAT.
- Cut admission record: every hard-clause block names the Lean theorem or
  definition it images, or declares itself a relaxation. No block may image
  an open `sorry`.
- Every verdict is CONJECTURE until the encoding-to-claim map is
  adversarially audited by a second reader.
- SAT models are read back and replayed in exact rational arithmetic; a model
  that fails replay is not a witness.
- UNSAT is reported only at scope `card = 15`.

Decision rule:

- a cell metrically SAT with every hypothesis encoded and an exact rational
  witness: that cell does not close from its binders at 15. Stop, report, and
  propose an upstream re-split. First re-split candidate: retain the dropped
  provenance of Section 2 in `J` at both adapters (reverse-hit order,
  betweenness, acuteness; source-return U5 rows), because those facts are
  already proved and cost no new obligation.
- every cell UNSAT with certificate: Phase 3 certificate ingress at 15, then
  Phase 4.
- `UNKNOWN` or compute-blocked: Phase 3 proceeds by Lean order and counting
  per cell, starting with the cells that carry a same-radius safe pair.

Bridge and stop rule (review triage, Section 11): the only route from
Phase 2 evidence to the leaf is

```text
source role packet (Section 2 binders at the pair index i and the
blocker-free index j)
  → exhaustive finite/order cells (Section 6)
  → checked certificate, or a Lean order/counting proof, per cell
  → the leaf
```

A further structural SAT/UNSAT wave is admitted only when it strengthens one
arrow of that chain: a new source fact imaged by a hard clause, a cell removed
by certificate, or a cell closed in Lean. A wave that repeats a verdict at the
same scope with the same cut set is rejected.

Deliverables: manifests under `scratch/runs/d1-triapex-plan-20260901/<run-id>/`
with `run_manifest.json`, `promotion_eligible = false` until Phase 3.

Status 2026-09-01 (Phase 2 assessment; no solver run was executed):

- Instrument. The metric stage's only unapproved engine is Z3 `QF_NRA`
  one-shot through `piqd`. The D-R lane ran that engine on an 18-atom genuine
  geometric negative control (two distinct circles share at most two points)
  and got `UNKNOWN` at 300 s twice, and `UNKNOWN` on its 717-atom generic
  cell at 900 s (`docs/audits/2026-09-01-dr-two-radius-quotient-wave.md`,
  "Runs"). The D2 smoke test of this plan is a larger genuine geometric
  UNSAT: the kernel proof of the grid refutation uses chord reflections,
  signed areas, and a polynomial escape lemma. Under the stop rule above, a
  run of the same engine on a larger instance of the same kind repeats a
  verdict at the same scope, so it was not executed. The metric stage is
  instrument-blocked before the smoke gate; by the decision rule, Phase 3
  proceeds by Lean order and counting per cell.
- Dimension count (HEURISTIC; assumes generic independence of the
  equalities). Fifteen points carry 30 coordinates and the similarity group
  has dimension 4, so 26 degrees of freedom. The binders impose at least 27
  polynomial equalities. `G.apex_rich` gives at each apex either one class of
  six points (5 equalities) or two classes of four (6), so at least 15. The
  critical shell system gives every point an exact four-point shell at a
  non-apex blocker: `fullyDeletionRobustAt_of_apexRichClassStructure` makes
  the apices robust, `isUniqueFourCenter_centerAt` and
  `not_isUniqueFourCenter_of_fullyDeletionRobust` keep them out of the
  blocker set. Each blocker centre carries exactly one four-point circle,
  because a second one would survive the deletion of the blocked point,
  against `no_qfree`. Covering fifteen points by four-point shells needs at
  least four shells, so at least 12 equalities. At card 16 the same count
  gives at least 27 equalities against 28 degrees of freedom. Reading: exact
  15 is the tight case, in the direction the plan assumed (review question
  2), and the risk of a genuine witness family sits at card 16 and above,
  in Phase 4. A dimension count is not a refutation and does not change `M`.
- Sharper SAT-side test, deferred. The D-R lane's solver-free constructive
  witness search (`census/card_head/dr_two_radius_quotient.py`,
  `witness_search`: float least squares on the atom margins, then exact
  rational replay of every atom) is the sharper instrument for the
  non-refutability side. Its obstacle here is the discrete skeleton: the
  blocker assignment of all fifteen points, the shell memberships, and the
  packet rows are not fixed by the nine Section 6 cells, so a witness search
  needs a skeleton enumeration first. Deferred until a Phase 3 cell resists,
  or until Adam authorizes a Gröbner engine for the pinned-skeleton
  equalities. {{NEEDS_ADAM_INPUT}}.
- No run root was created under `scratch/runs/d1-triapex-plan-20260901/`;
  the lane checkpoint keeps `generated_roots` empty.

### Phase 3 — exact-15 closure per cell

- 3a same-radius cells (all but `(1,1)`): after L5, wire
  `finFour_exists_nearby_mutualFalse_of_card_le_two` and the interval
  descent. The descent terminals (`μ = 0` fixed point, disjoint `K2,2` plus
  escapes) get Lean statements only in the change that also supplies their
  contradiction; until then they are `SKETCH — NOT PROMOTABLE`.
  {{NEEDS_PROOF}} for both terminals; {{NEEDS_PROOF}} for the MEC-cap
  acute-visibility adapter of the `μ = 1` shared-support arm.
- 3b transverse cell `(1,1)`: the D1-specific transverse saturation
  contradiction (checkpoint-4 step 2). Not the D2 grid consumer. No source
  object exists. {{NEEDS_PROOF}}.
- 3c certificates: for any cell with a Phase 2 UNSAT certificate, emit through
  `census/p97_search/phase3_qq_certificate_lean_emitter.py` and pass the
  Lean-ingress publication gate. A Z3 UNSAT with no certificate stays
  diagnostic.
- Split rule: the leaf is split into `card = 15` and `16 ≤ card`, or into
  cells, only in the same change that closes at least one resulting child, so
  the on-spine `sorry` count does not rise. This is the standing E1
  do-not-fan-out constraint
  (`docs/computational-closure-plan-2026-07-28.md:5491`).
- Independent promotion verifier plus a math-skeptic audit before any
  promotion claim.

Status 2026-09-01 (Phase 3a, first checkpoint: the cap-order lift of the
finite low-span kernel is proved and consumed by the leaf; no cell is closed):

- `LowSpanMutualOmissionPairAt D S H i` names the Phase 3a state at
  `card = 15`: the oriented complete cap order of cap `i` from L5, its four
  middle slots enumerating `capInteriorByIndex i`, and slots `a < b ≤ a + 2`
  whose points mutually omit one another from their actual critical shells,
  with both cross-deletions surviving and distinct blocker centres. At most
  one strict-interior point lies between the pair, so the interval count of
  Phase 3a starts at `0` or `1`.
- `lowSpanMutualOmissionPairAt_of_oneRadius_card_eq_fifteen` proves that
  state in the `oneRadius` arm. Inputs: the L5 slots, the source-faithful
  fan bound (each actual shell meets the same-radius slice in at most two
  points, because the apex is never a blocker centre, as in L6), and
  `finFour_exists_nearby_mutualFalse_of_card_le_two`. It retains the slot
  order that `exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker`
  discards.
- `twoRadii_or_lowSpanMutualOmissionPairAt_of_card_eq_fifteen` dispatches on
  the witness constructor and returns the raw `twoRadii` data otherwise. The
  leaf binds it as `hlowSpanAtPair` at the pair index `i` through L4.
- Axiom closure of both theorems: `propext`, `Classical.choice`,
  `Quot.sound`. The leaf's single `sorry` is unchanged, the on-spine open
  obligation count is 28 (unchanged), and `M = 18` is unchanged. Of the
  seven missing ingress fields listed in the 2026-08-30 extract (Section 5),
  items 1 to 5 are now supplied at `card = 15` in the `oneRadius` arm; item
  6 (the interval count and its strict decrease) and item 7 (the provenance
  a terminal needs) are not.
- Not done: the descent one-step and both terminals. No descent state,
  successor, or terminal is defined in Lean, per the rule above. The prose
  scheme (`docs/erdos-97-descent-prose-proof-atomic.md`, F3.37 to F3.39) is
  marked superseded there; only its shrink lemmas are reusable. The `μ = 0`
  paired fixed point still has no contradiction consumer. {{NEEDS_PROOF}}.
- The `twoRadii` cells at `i` are untouched by this checkpoint; the fan
  bound gives no two-point bound across two slices.

Status 2026-09-01 (Phase 3a, second checkpoint: `μ = 0` terminal assessment;
no Lean change, no build, no solver run; full record in
`docs/audits/2026-09-01-d1-mu0-terminal-analysis.md`):

- Verdict (HEURISTIC): the `μ = 0` paired fixed point is not refutable from
  the hypotheses the leaf binds. An incidence witness satisfies every listed
  constraint: the four same-radius interior points of cap `i` each carry a
  distinct blocker centre in another cap, each actual shell meets cap `i`
  only in its own source, so every pair (adjacent pairs included) mutually
  omits, both cross-deletions survive, and the cover bound
  `15 ≤ 4 · |centres|` holds with four centres. This is the O5/O6 finding of
  Section 3, specialized to the `μ = 0` cell. A contradiction, if one
  exists, is metric: realizability of that incidence pattern by points in
  convex position with the three apices on the enclosing circle.
- Route B (DERIVABLE; CONJECTURED until compiled): from
  `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`
  (`AllLargeCapCanonicalInterfaces.lean:85`), `isUniqueFourCenter_centerAt`,
  `G.apex_rich i`, and `CGN.index_strictly_between_of_equidistant`
  (`CapSelectedRowCounting.lean:51`): if one interior slot's shell contains
  another interior slot of cap `i`, the blocker centre is itself an interior
  slot strictly between them. So adjacent interior slots never contain one
  another in the `oneRadius` arm at `card = 15`. Consequences: `μ = 0` is
  forced, the `μ = 1` arm of the prose descent is empty in this cell,
  `finFour_exists_nearby_mutualFalse_of_card_le_two` is not needed here (the
  pair can be taken as slots `1, 2`), and ingress item 6 collapses to
  `μ = 0` with no step to take. The first-checkpoint statement above that the
  interval count "starts at `0` or `1`" is therefore `0` once Route B is
  compiled. First missing antecedent for a contradiction: any fact forcing
  one shell to meet the slice in two points; the fan bound is an upper bound
  only.
- Route C (DERIVABLE; CONJECTURED until compiled): the private
  `selectedClass_capInteriorByIndex_card_ge_two_of_card_four`
  (`FirstApexInteriorPairGeometry.lean:232`) uses `card = 4` only in its
  closing arithmetic, so it generalizes to `4 ≤ card`. Classes at one centre
  with distinct radii are disjoint, and the interior of cap `i` lies in the
  radius-`r` class, so the two-radii branch of `G.apex_rich i` is impossible
  and the apex class at `i` has exactly six points: the four interior points
  plus one point in each adjacent cap. First missing antecedent for a
  contradiction: a fact excluding or locating those two adjacent-cap points.
- Routes A, D, E, F are dead ends with named missing antecedents: A
  (adjacent-slot bisector uniqueness) needs a second carrier bisector point
  the binders deny; D (capacity count) is arithmetically slack without a
  lower bound on fibre size; E (cap-interior equidistance kernels of
  `Rigid221SourceHeavy.lean:3601` to `:3800`) needs a third co-cap shell
  point or a bisector cycle, and the arrow-free witness shows no arrow set is
  forced; F (a second circle through the pair) does not exist.
- Smallest deciding experiment, not run: Stage 1, a named-role incidence SAT
  at `card = 15` (predicted SAT; machine-checks the negative); Stage 2, a
  `QF_NRA` realizability check of the returned model (needs Z3 or cvc5,
  which needs per-task approval). UNSAT at Stage 2 with a usable core names
  the metric identity a Lean consumer must encode. {{NEEDS_ADAM_INPUT}} on
  whether to run Stage 1, Stage 2, or neither.
- Allowed continuation without a decision: Route B and Route C as
  infrastructure checkpoints (no cell closed, `M = 18` unchanged). Neither
  is a terminal statement, so the Phase 3a rule above does not block them.

Status 2026-09-01 (Phase 3a, third checkpoint: Route B compiled; the
adjacent-slot pair replaces the low-span pair; no cell is closed):

- `not_mem_selected_support_of_adjacent_interior_slots_of_oneRadius` is
  proved: in the `oneRadius` arm, a strict-interior point of cap `i` never
  lies on the actual critical shell of a strict-interior point at an
  adjacent slot of the oriented complete cap order. Inputs:
  `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`,
  `isUniqueFourCenter_centerAt`, `G.apex_rich i`, and
  `CGN.index_strictly_between_of_equidistant`. Route B of the assessment
  above is therefore PROVEN, not DERIVABLE.
- `LowSpanMutualOmissionPairAt` is replaced by
  `AdjacentMutualOmissionPairAt D S H i`: the same cap-order data, and slots
  `s, t` of the strict interior with `t = s + 1` that mutually omit one
  another, with both cross-deletions surviving and distinct blocker centres.
  `adjacentMutualOmissionPairAt_of_oneRadius_card_eq_fifteen` proves it at
  slots `1, 2` without `finFour_exists_nearby_mutualFalse_of_card_le_two`;
  the dispatcher is `twoRadii_or_adjacentMutualOmissionPairAt_of_card_eq_fifteen`
  and the leaf binds it as `hadjacentAtPair`. The interval count of the
  first checkpoint is now `0` by construction; ingress item 6 has nothing
  left to decrease.
- Axiom closure of all three declarations: `propext`, `Classical.choice`,
  `Quot.sound`. The leaf's single `sorry` is unchanged, the on-spine open
  obligation count is 28 (unchanged), and `M = 18` is unchanged.
- Still open: the `μ = 0` terminal has no contradiction consumer; the
  incidence witness of the assessment above satisfies the new statement
  too. Route C (exact six-point apex class) is the next infrastructure
  candidate; the solver stages wait on the decision recorded above.

Status 2026-09-01 (Phase 3a, fourth checkpoint: Route C compiled; the
adjacent-slot state carries the circle and the exact six-point apex class;
no cell is closed):

- `selectedClass_card_eq_six_of_oneRadius_card_eq_fifteen` is proved: at
  carrier size fifteen, when the four strict-interior points of cap `i` lie
  on one circle about the apex opposite cap `i`, that apex's class at that
  radius has exactly six points, with exactly one point in each adjacent
  cap. Inputs: `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, the
  public adjacent-cap one-point bounds and the sdiff cover from the
  `SurplusM44Packet` shards, and `G.apex_rich i`. The private card-4 lemma
  in `FirstApexInteriorPairGeometry.lean` was not touched; the `4 ≤ card`
  bound is proved locally. Route C of the assessment above is therefore
  PROVEN; the two-radii branch of `G.apex_rich i` is impossible in this
  cell.
- `AdjacentMutualOmissionPairAt` now also records a radius `r > 0` with the
  strict interior of cap `i` in the apex class at `r`, that class of card
  exactly six, and one point in each adjacent cap. The producer takes the
  `oneRadius` positivity `hr` again; the dispatcher and the leaf binding
  `hadjacentAtPair` are unchanged in shape.
- Axiom closure of the three declarations: `propext`, `Classical.choice`,
  `Quot.sound`. The leaf's single `sorry` is unchanged, the on-spine open
  obligation count is 28 (unchanged), and `M = 18` is unchanged.
- Still open: no contradiction consumer for the `μ = 0` terminal. The
  incidence witness of the assessment satisfies the extended state as well
  once the two adjacent-cap points at distance `r` from the apex are added.
  Any consumer must now be written against a six-point cocircular class
  about a Moser vertex: four points in the opposite cap and one in each
  incident cap. {{NEEDS_ADAM_INPUT}} on the solver stages stays open.

Status 2026-09-01 (Phase 3a, fifth checkpoint: the smallest metric question
on the pinned object, stated for the solver decision; read-only, no run):

- The pinned object at the pair index `i` in the `oneRadius` arm at
  `card = 15` (all PROVEN, `AdjacentMutualOmissionPairAt`): the six-slot
  strict cap order of cap `i` with the two chord apices at slots `0, 5`;
  the four interior points at slots `1..4` on one circle of radius `r`
  about the opposite apex; that apex's class at `r` of exactly six points,
  one in each incident cap; slots `1, 2` mutually omitting with distinct
  non-apex blocker centres, each centre carrying an exact four-point shell
  through its source and no four-point class after that source is deleted.
- There is no small refuting metric question. The pinned object alone
  imposes 11 polynomial equalities (five for the six-point class, three per
  shell) on the 26 degrees of freedom of the Phase 2 count, so on its own it
  is a 15-parameter family (HEURISTIC, generic count) and Stage 2 on it is
  predicted SAT. Refuting power only comes from the whole card-15 system:
  the three apex classes (at least 15 equalities; at index `i` now exactly
  the six-point class, so the two-radii branch is gone there) and the at
  least four blocker shells covering all fifteen points (at least 12), that
  is at least 27 equalities against 26 degrees of freedom. Generic counting
  therefore predicts no witness family at card 15, but it cannot exclude a
  non-generic (dependent) real solution, which is exactly the question a
  solver has to answer.
- Shape of the decisive question. Per incidence pattern (which twelve
  interior labels are blocker centres, which four-point shells they carry,
  and which points lie in which cap and slot), a degree-two polynomial
  system of at least 27 equations in 26 normalized coordinates, expected to
  be zero-dimensional or empty; the open conditions (convex position, cap
  order, the deletion-survival disequalities, the unique-four-centre facts)
  are then checked on the finitely many real solutions. This is
  Gröbner-plus-real-root territory (msolve and Singular, cross-checked per
  Guardrail 7), not `QF_NRA` search. The cost driver is the number of
  incidence patterns that survive the PROVEN incidence bounds, which is
  what Stage 1 (a piqd census of the named-role quotient at card 15) would
  count; no encoder for that quotient has been verified to exist.
  {{NEEDS_ADAM_INPUT}}: run Stage 1 to count patterns, run a per-pattern
  algebra stage (needs per-task approval), or neither.
- Lean leaf unchanged by this checkpoint: single `sorry`, on-spine open
  obligations 28, `M = 18`.

Status 2026-09-01 (Phase 3a, sixth checkpoint: the two-radii analogue of
Route C compiled; no cell is closed):

- `selectedClass_card_eq_four_of_twoRadii_card_eq_fifteen` is proved: when
  the strict interior of cap `i` splits into two pairs at distinct radii
  about the opposite apex, that apex's classes at those radii have exactly
  four points each, the pair plus one point of each adjacent cap; the
  six-point branch of `G.apex_rich i` is impossible there and the two-radii
  branch is at exactly these radii. The private helpers
  `selectedClass_adjacent_bounds` and
  `selectedClass_capInteriorByIndex_card_ge_two_of_four_le_card` now serve
  both Route C theorems. The dispatcher's `twoRadii` disjunct returns these
  two exact four-point classes, so the leaf binding `hadjacentAtPair`
  carries the apex class structure in both arms.
- Axiom closure: `propext`, `Classical.choice`, `Quot.sound`. Leaf `sorry`
  unchanged, `M = 18`. The on-spine open count is 36 at `eadc775d4`; the
  eight new obligations belong to the D-R lane exact-12 mirror, not D1.
- Direction change (Adam, 2026-09-01): stop gating on decisions. Non-piqd
  solver runs stay unapproved; the algebra stage goes through piqd, and the
  D1 use case was posted to the piqd maintainer (#8669 on `#piqd`, #8670
  here) against PIQD-BACKEND-002: `piqc singular run` exists on daemon
  0.1.0, a second engine for the Guardrail 7 cross-check does not. Stage 1
  (piqd cadical incidence census at card 15, encoder
  `census/card_head/d1_mu0_incidence_census.py`) is being built and run by a
  background agent; its verdicts are CONJECTURE at the encoded scope until
  the encoding-to-claim map is audited.

Status 2026-09-01 (Phase 3a, seventh checkpoint: Singular through piqd
validated for the algebra stage; infrastructure only, no cell is closed):

- Guardrail 1 smoke runs of the piqd Singular lane (`piqc singular run`,
  daemon 0.1.0, receipts under
  `scratch/runs/d1-triapex-plan-20260901/singular-smoke-01/artifacts/`):
  `std`/`dim`/`vdim` on four known ideals (a nonempty complex curve with no
  real point, a zero-dimensional ideal of two complex points, the unit
  ideal, and a Rabinowitsch non-forcing instance) and `nrRootsDeterm` from
  `rootsmr.lib` on four zero-dimensional ideals with 0, 2, 1, 0 real roots.
  All eight verdicts match the hand-known answers. Each run is attested
  (`SINGLE_SPAWN_UNCONFINED_CHILDREN`, binary and script hashes on the
  receipt), so the algebra stage's per-pattern scripts have a validated
  execution path and a validated real-root count.
- What this does not give: the Guardrail 7 second engine. Singular is one
  engine; a decisive emptiness verdict on a surviving pattern still needs an
  independent engine, and the only approved route to one is the piqd
  maintainer (request #8669 on `#piqd`, no reply yet). Until it exists, a
  Singular-only emptiness verdict is CONJECTURE at the encoded scope and is
  recorded as one-engine evidence, not banked.
- Stage 2 generator `census/card_head/d1_mu0_pattern_algebra.py`: projects a
  Stage 1 model record to its metric content (distinct `(centre, shell)`
  pairs and apex classes; roles and slices dropped), pins `A0 = (0, 0)`
  and `A1 = (1, 0)` (26 variables), emits one Singular script per metric
  pattern (`std`, `dim`, `vdim`, `nrRootsDeterm`, optional saturation by
  named coincidences), and submits it only through `piqc singular run`.
  Known-answer tests in `tests/test_d1_mu0_pattern_algebra.py` (11 pass):
  a free class is a curve, one concyclic shell is a three-parameter
  family, the non-concyclic four-set with a forced centre is finite
  before and empty after saturating the coincidence, and the
  equilateral apex triangle has exactly two real solutions. Verdict
  labels: `EMPTY_COMPLEX`, `POSITIVE_DIMENSIONAL`, `FINITE_NO_REAL`,
  `FINITE_REAL_CANDIDATES`; all one-engine CONJECTURE at encoded scope.
- Stage 1 (piqd cadical incidence census) is still running in the
  background agent; its encoder and run tree are validated and committed
  when it reports. Leaf `sorry` unchanged, `M = 18`.

Status 2026-09-01 (Phase 3a, eighth checkpoint: Stage 1 census delivered,
Stage 2 first verdicts; all solver evidence CONJECTURE at encoded scope):

- Stage 1 (`census/card_head/d1_mu0_incidence_census.py`, run root
  `scratch/runs/d1-triapex-plan-20260901/stage1-incidence-01/`, report in
  `artifacts/REPORT.md`): 15 labels (three apices, three caps of four
  ordered slots), one centre and one four-point shell per modelled point,
  22 clause blocks with cut-admission records (all `PROVEN` except R13
  `DERIVED`, R7/Q1 `IMPLIED`, C1/C2 selectors); 59 of the 60 named Lean
  sources resolve to declarations, the sixtieth is a selector description.
  Every solver call went through piqd (raw-DIMACS jobs with automatic LRAT
  on UNSAT, SAT sessions for queries and enumeration). Guardrail 1 smoke
  tests passed: the audit witness is SAT with a clean replay, and the
  adjacent-slot arrow, the centre-at-apex, and the same-centre-different-
  shell instances are UNSAT with LRAT proofs (the first matches Route B).
- Verdicts: all 32 cells (pair index 0 or 1, eight arm combinations,
  `in12`/`ax15`) are SAT at the incidence level. In the 16 target cells all
  six adjacent arrows are UNSAT and all six far arrows SAT; all nine
  pair-centre cap placements are SAT; the minimum number of distinct
  blocker centres is 3 (`in12`) and 4 (`ax15`). Every enumeration (`full`
  and `capi` projections) hit the 3000-model cap, so pattern counts are
  lower bounds; the incidence abstraction does not refute the leaf and does
  not exhaust its pattern space. The encoding is a survivor superset
  (Section 2 of the report lists the omitted binders).
- Stage 2 on the target cell `i0-1R1R1R-in12` (one engine, Singular via
  piqd, run root `stage2-probe-01`): the 3000 sampled models are 3000
  distinct metric patterns over only 11 centre maps and 7 apex-class
  systems; the variation is in the filler points of the shells. Every
  pattern decided so far is EMPTY over the complex numbers once all fifteen
  points are saturated distinct (unsaturated they are 4- to 6-dimensional,
  all coincidence components), typically in well under a second, with rare
  patterns near 90 s. A core-mining pass (deletion-minimal inconsistent
  sub-pattern per refuted pattern, coverage counted) is running on a sample.
- Consequence for the route. Per-pattern algebra over the full projection
  is unbounded case splitting (Guardrail 3). The closure route is core
  mining: recurring small inconsistent sub-patterns become circle-
  intersection lemmas, proved in Lean and fed back to Stage 1 as `PROVEN`
  cuts, until the incidence census turns UNSAT or a cell is refuted by a
  Lean-provable core. Banking any Stage 2 emptiness verdict needs the
  Guardrail 7 second engine (piqd maintainer, #8669, no reply yet).
- Lean leaf unchanged: single `sorry`, `M = 18`.

Status 2026-09-01 (Phase 3a, ninth checkpoint: the distance-equality closure
rule; solver-free measurement, Stage 1b delegated):

- Observation (EMPIRICALLY VERIFIED on the Stage 1 samples, no solver): a
  union-find closure over unordered point pairs, seeded by the equalities
  every shell and every apex class asserts, followed by the exactness of
  both objects (`mem_selectedClass`: a carrier point at the class radius is
  in the class; `CriticalFourShell.support_eq`: a carrier point at the shell
  radius is in the shell), refutes 2997 of 3000 sampled patterns in
  `i0-1R1R1R-in12`, 3000 of 3000 in `i1-1R1R1R-in12`, 2993 of 3000 in
  `i0-1R2R2R-in12`, and 3000 of 3000 in `i0-1R1R1R-ax15`. The audit witness
  dies this way: `A1, A2` in class `A0` and `A0, A2` in class `A1` make the
  apex triangle equilateral, so `A1` is at the radius of class `A2` but is
  not a member.
- Every ingredient is PROVEN in Lean (transitivity of real equality plus the
  two exactness statements), so the rule is a `PROVEN` cut for Stage 1, not
  a solver verdict. Shape census of the shortest explanation chains: length
  2 in 3000/3000, 2992/2993 and 2872/3000 of the violations, always the
  equilateral triangle (`q` on `p`'s exact circle, `p, r` on `q`'s, `p, q`
  on `r`'s, hence `r` on `p`'s); the rest have length 3. Reuse preflight
  (key: the equilateral closure, consumer: Stage 1 block `CL0`, revision
  `1f7e28811`): the metric core already exists as
  `dist_eq_dist_of_mutual_bisector` (`ATail/TwoCenterBisectorParity.lean`,
  PROVEN: two mutual equidistances give the third), and the membership step
  is `mem_selectedClass` or `CriticalFourShell.support_eq`; no missing
  antecedent, no circularity. It explains most of the Stage 2 emptiness verdicts
  without algebra. The remaining consistent patterns (7 in the sampled
  `i0-1R2R2R-in12`) are where Stage 2 still has work.
- Stage 1b (delegated to the census agent, run root `stage1b-closure-01`):
  the closure oracle inside the piqd session enumeration, blocking the
  explanation chain of each violation rather than the full pattern; a cell
  that goes UNSAT is re-run as one raw-DIMACS job (base CNF plus the learned
  cuts) so the UNSAT carries an LRAT proof; survivors are recorded with
  their full patterns. Outcome not yet known.
- Stage 2 driver (`161bb1335`): polls piqd to completion (the daemon runs
  Singular one at a time and the client's wait gives up on queued runs),
  modular prefilter over `GF(32003)` with `MOD_` verdicts and a `TIMEOUT`
  verdict, core mining with modular deletion steps and a characteristic-0
  confirmation. The characteristic-0 batch on `i0-1R1R1R-in12` refuted 71 of
  72 patterns before one pattern exceeded eight minutes; the modular batch
  over all 3000 is running.
- Lean leaf unchanged: single `sorry`, `M = 18`.

Status 2026-09-01 (Phase 3a, tenth checkpoint: Stage 1b closure census
delivered; the closure rule refutes no cell):

- Stage 1b (`census/card_head/d1_mu0_incidence_census.py --cl0 --closure`,
  run root `stage1b-closure-01`, every solver call through piqd): block
  `CL0_equilateral_closure` (ROOT_STATIC, PROVEN; Lean sources
  `dist_eq_dist_of_mutual_bisector`, `mem_selectedClass`,
  `CriticalFourShell.support_eq`, `support_eq_radius`) adds, for every
  interior label `z`, a membership variable `M(z, y)` tied to the shell of
  every modelled source centred at `z` (sound under R5: same centre, same
  shell; unrealized centres leave `M` free, which only weakens the clause),
  and the six-literal equilateral clause over every ordered triple of
  distinct exact objects (interior shells and apex classes). The oracle
  `closure_violation` (block `CL1_distance_equality_closure`, DERIVED_CUT,
  PROVEN) searches breadth-first over unordered label pairs through the
  equalities each exact object asserts and blocks the shortest explanation
  chain, not the pattern. Validation: 15 tests pass (the audit witness has
  no violation; the witness with class `A2` enlarged by `A0, P0.1` forces
  `A1` into class `A2` by a length-2 chain and the explanation clause is
  falsified by exactly that assignment; the CL0 block agrees with the
  oracle on length-2 chains), ruff clean; the admission records name the
  four Lean sources above.
- Outcome (CONJECTURE at the encoded incidence scope, card = 15): all 32
  cells stay SAT with CL0 in the base formula; every enumeration hit the
  3000 cap; CL1 cuts per cell 2 to 213, survivors 2787 to 2998 (target
  cell `i0-1R1R1R-in12`: 213 cuts with chain lengths 3:136, 4:62, 5:14,
  6:1, and 2787 survivors). No cell goes UNSAT, so no LRAT certificate
  exists and no Lean route follows from Stage 1b. Survivor structure of the
  target cell: 4 to 12 distinct centres, mode 10 (1253 of 2787), then 11
  (753) and 12 (242); the closure rule pushes the survivors towards
  patterns whose shells are pairwise distinct, which no admitted incidence
  rule refutes.
- Consequence: the mu = 0 refutation is not visible at the incidence layer
  with the admitted rules plus distance-equality closure. Per Guardrail 3,
  per-pattern algebra over at least 2787 survivors per cell is runaway
  splitting, so the next probe is bounded: the modular Stage 2 batch on the
  Stage 1 sample of `i0-1R1R1R-in12` was stopped at 610 of 3000 patterns,
  all `MOD_EMPTY_COMPLEX` over `GF(32003)` after all-pairs distinctness
  saturation (one engine, modular, sampled; not banked); a 40-pattern
  modular batch and a 4-pattern core mine on the closure survivors of the
  same cell are running, to find the smallest metrically inconsistent
  sub-pattern, the candidate for the next universal Lean lemma.
- Lean leaf unchanged: single `sorry`, `M = 18`. The Guardrail 7 second
  engine is still pending the piqd maintainer.

Status 2026-09-02 (Phase 3a, eleventh checkpoint: Stage 2 on the closure
survivors; the mined obstructions are global six- to eight-point rigidities):

- Survivor batch (`--char 32003 --saturate-all-distinct --timeout 120`, the
  first 40 closure survivors of `i0-1R1R1R-in12` by key): 33
  `MOD_EMPTY_COMPLEX`, 7 `MOD_TIMEOUT`. 22 of the 33 are empty before
  saturation (`dim_raw = -1`: no complex solution even with coincident
  points); the other 11 carry a 3- to 8-dimensional coincidence component
  that the distinctness saturation removes. One engine, modular, sampled:
  CONJECTURE.
- Core mining (`c4cb00bf5`: raw mode; this checkpoint: member level; steps
  over `GF(32003)` at 120 s, confirmation over the rationals) on seven
  raw-empty survivors: four object-level cores confirmed over the rationals
  (3 to 4 shells plus 2 to 3 apex classes); the other three came back
  unconfirmed because non-empty trials and the confirmation exceeded 120 s.
  Refined member by member, the four cores have 6, 8, 8 and 8 points with
  9, 13, 13 and 13 equations; three are confirmed over the rationals, one
  only modulo 32003. The six-point core (`091c948a10b60a73`):
  `|A1 A0| = |A1 A2| = |A1 P1.2|`; `P1.2` equidistant from `A1, A2`; `P0.4`
  equidistant from `A1, A2, P1.2`; `|P1.2 P2.4| = |P1.2 A1|`; `P2.4`
  equidistant from `A1, P0.4`; `A0` equidistant from `P0.4, P1.2, P2.4`.
  The four cores share no sub-configuration; each is a rigid chain that
  uses at least two apex classes and shells through two apices.
- Reading (CONJECTURE at the encoded scope): the mu = 0 refutation at card
  15 is metric and global. No admitted incidence or order rule and no
  closure rule sees it, and every mined obstruction needs the apex circles
  and three or four shells jointly, so a Lean route by order and counting
  alone (the `UNKNOWN` branch of the Phase 2 decision rule) has no support
  in the evidence. A certificate route exists in the repository:
  `census/p97_search/phase3_qq_certificate_lean_emitter.py` accepts a
  generic metric Nullstellensatz certificate
  (`p97-generic-metric-qq-nullstellensatz-certificate-v1`, gauge
  `A0 = (0, 0)`, `A1 = (1, 0)`, one `1 = sum cofactor * generator` identity
  replayed over the rationals) and emits Lean data; each member core is such
  a system of 9 to 13 quadrics. Its cost is the number of cores: the
  incidence enumeration hits the 3000 cap in every cell, so the CEGAR loop
  (mine a core, certify it, block its incidence sub-pattern, re-enumerate)
  has no known bound, and every core is its own certificate.
- Goal reassessment (three checkpoints since the last one): the exact-15
  kill-test has answered the plan's highest-risk question with sampled,
  one-engine evidence: the leaf's binders at card 15 are refutable, but
  only metrically. Routes, with cost stated as work: (a) certified CEGAR at
  card 15 with Nullstellensatz cuts through the existing emitter (unbounded
  core count, then the card-15 ingress and the Phase 4 lift); (b) the first
  re-split candidate of the decision rule, retaining the provenance dropped
  at the leaf boundary (Section 2: reverse-hit rows, betweenness of the
  reverse blocker, the base-angle acuteness inequalities, source-return U5
  rows), then a census of the re-split cells (cheaper per cell; no evidence
  yet that it removes survivors); (c) Lean order and counting per cell as
  scheduled, which the evidence does not support. The lane continues with
  the cheapest decisive test, Stage 1c: encode the dropped reverse-hit
  provenance as census rules per route and measure the survivors; it needs
  no new Lean and its outcome decides between (a) and (b).
  {{NEEDS_ADAM_INPUT}} only if (a) is preferred despite the unbounded core
  count; work does not wait on it.
- Lean leaf unchanged: single `sorry`, `M = 18`. Guardrail 7 second engine:
  follow-up posted to the piqd maintainer (#8762), unanswered.

Status 2026-09-02 (Phase 3a, twelfth checkpoint: Stage 1c re-split census
on the reverse-hit route; the survivors do not vanish):

- Encoder: `Cell.route` (`rh` reverse hit, `sr` source return, none = the
  leaf census), `--route none|rh|sr|both`. Blocks with admission records:
  `C3` SELECTOR (the exhaustive PROVEN split
  `nonempty_retainedReverseCouplingOutcome`,
  `RetainedMatchingLargeCapConsumer.lean:313`); `RH2` PROVEN
  (`reverseBlocker_mem_capInterior`: c(deleted) in the strict first cap);
  `RH3` IMPLIED (`reverseShell_inter_cap_eq`; follows from C3, RH2, R1,
  R7); `RH4` IMPLIED (`exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit`;
  follows from R6); `RH5` IMPLIED at card 15
  (`exists_fresh_firstCap_commonDeletion_of_reverseHit`); `RH6` PROVEN
  (`actualRow_center_eq_reverseBlocker_of_reverseHit`: every modelled shell
  through kept and deleted has centre c(deleted); the only reverse-hit block
  not implied by the admitted rules); `SR2` PROVEN (twoRadii arm at cap 0
  only: `nonempty_sourceReturnRadiusOutcome`, joint deletion or exact-four
  partition). The omitted route provenance is recorded per route
  (`ROUTE_OMITTED_BINDERS`: the acuteness inequalities
  `reverseHit_twoCenter_sqdist_acute`, the signed-area sidedness inside
  their proof, the packet rows, the U5 ingress rows). Route-free CNFs are
  byte-identical to the Stage 1 and Stage 1b records. Tests: 21 (15 plus a
  positive reverse-hit witness, six negative controls, source-return
  controls, a piqd SAT-and-replay test).
- Run `stage1c-reversehit-01` (16 target cells, route `rh`, CL0 on, CL1
  oracle, cap 3000): every cell SAT and cap hit; CL1 cuts 8 to 122;
  survivors 2878 to 2992 (905 cuts, 47095 survivors in total); no UNSAT,
  no LRAT. Target cell `i0-1R1R1R-in12-rh`: 65 cuts, 2935 survivors; the
  reverse blocker sits at slot `P0.3` in every sampled pattern; distinct
  centres 9 to 12, mode 11. CONJECTURE at the encoded scope.
- Source-return route: for the twelve target cells with cap 0 in the
  oneRadius arm the `sr` CNF is the Stage 1b CNF plus the twelve C3
  clauses, and a split of the Stage 1b samples (no solver) puts most Stage
  1b survivors on that route (target cell: 2787 of 2787 with kept notin
  shell(deleted)), so `sr` keeps survivors without a run. The four `i1-2R*`
  cells carrying the new SR2 block were not run.
- Decision-rule outcome: route (b), the re-split at the incidence level,
  removes no survivors; apart from RH6 the reverse-hit provenance is
  redundant with the admitted rules. Wave mine of the Stage 1c data (one
  bounded reuse preflight): the general form of RH6,
  `perpBisector_carrier_card_le_two`
  (`ATail/ConvexPerpendicularBisectorSides.lean:25`, from
  `Dumitrescu.perpBisector_apex_bound` with `D.convex`), is a
  route-independent PROVEN incidence rule that the census still omits
  (at most two carrier points are equidistant from two distinct carrier
  points; listed in Section 2 under "D.convex beyond R6 and R10"). Next,
  Stage 1d: encode it as a static block over the CL0 membership variables
  and the apex classes, re-run the 32 route-free cells, and read the
  survivors. It is the last admitted incidence rule known to be missing;
  if survivors remain, route (a), certified CEGAR with an unbounded core
  count, is the only route the evidence supports.
- Lean leaf unchanged: single `sorry`, `M = 18`. Guardrail 7: the piqd
  maintainer is triaging #8762.

### Phase 4 — carrier size at least 16

- Extract from the card-15 closures the smallest infeasible sub-pattern and
  state it as a cardinality-generic core over boundary indices, in the style
  of `false_of_one_k1_three_cyclic_selected_rows`.
- Prove an occurrence theorem from the leaf binders. `R.minimal` is available
  at the leaf, so a deletion descent is a second option; O4 shows the safe
  sources themselves are not removable, so the descent needs a different
  vertex. {{NEEDS_RESEARCH}}.
- If the core does not occur, report the exact missing incidence and stop; do
  not add off-spine lemmas.

## 8. Effort

In sessions: Phase 0 + Phase 1 (L1 to L6), one, done 2026-09-01. Phase 2,
assessed without a run on 2026-09-01 (instrument-blocked; dimension count
recorded). Phase 3, two to four; the first Phase 3a checkpoint (cap-order lift,
no cell closed), the `μ = 0` terminal assessment (no route closes
from proven facts), the Route B checkpoint (adjacent-slot pair), and the
Route C checkpoint (exact six-point apex class), none closing a cell, are
done 2026-09-01. Phase 4, unknown, at least three.
{{UNVALIDATED}} until Phase 3 reports its first cell.

## 9. Gates

- `uv run python scripts/check_worktree_hygiene.py check --lane d1-triapex-plan-20260901 --staged`
  before every commit; stage exact owned paths only.
- Fresh `proof-blueprint spine` after every Lean change; a green `lake-build`
  alone is not evidence.
- Solver results are diagnostic until replayed through the Lean-ingress gate.
- No wrapper networks; no split without a closed child; no new declaration
  named for the pipeline rather than the mathematics.
- Reuse preflight is re-run only when the candidate statement, ingress,
  consumer, imports, or source revision materially changes.

## 10. Documents to synchronize at the first frontier-changing checkpoint

These carry the superseded v23 plan or an unresolved status and must be
updated in the same change as the first Lean checkpoint under this plan that
changes the obligation frontier (a closed child, or a strict decrease of
`M`). The Phase 1 checkpoint of 2026-09-01 changed no frontier and left them
untouched.

- `docs/erdos-97-descent-prose-proof-atomic.md` §16.5.D1;
- `docs/dead-ends.md:1567-1594` (F1 bypass, `UNRESOLVED`);
- `docs/closure-evidence-status-ledger-2026-08-05.md` F1 TriApex row;
- `docs/computational-closure-plan-2026-07-28.md` E1 section;
- `docs/closure-matrix-2026-07-09.md` row K-A-LIVE-E1-SPLIT;
- `docs/proof/CURRENT.md` and `docs/README.md`, whose reachable and off-spine
  counts are anchored at an older revision than the registry and the live
  spine (Section 11);
- `proof-status/obligations.json`, regenerated at the same revision with
  `scripts/gen_obligation_registry.py`.

## 11. Review triage (2026-09-01)

The Pro consult `01M1FNKRDFWNTAFJRYA7N79FPC` was answered out of band as a
repository-wide audit (`/tmp/p97-closure-plan-audit-2026-09-01.md`, audited
public head `e6245182b`, the Phase 1 L5 commit), not as the six-question
review requested. The six plan-specific questions (soundness of the Section 6
cells, tightness of the exact-15 cell, the value of L6, the Phase 2 re-split
rule, house-rule violations, omitted obstructions) remain unanswered.
Adam pointed to the audit file as the response on 2026-09-01; this plan
proceeds with it as the review. The six questions stay open as the
{{NEEDS_PROOF}} items of Sections 6 and 7; question 2 is partly addressed
by the Phase 2 dimension count (HEURISTIC).

| Audit finding | Verification at HEAD | Action |
|---|---|---|
| §4.2: the plan must name the exact remaining bridge and reject structural waves that do not strengthen it | not stated before this triage | applied: Phase 2 "Bridge and stop rule" |
| §1: `docs/proof/CURRENT.md` and `docs/README.md` report 25 reachable and 6 off-spine; the registry reports 27 at `020e43bfc`; Section 1 of this plan reports 28 at base head | confirmed by reading the three files | outside lane ownership; added to Section 10; reported to Adam |
| §2: the plan index omits this plan | wrong at the audited head: `docs/plans/README.md:15` lists it since `f61b3b817` | none |
| §2: the plan index omits the exact-five plan `2026-09-01-rigid221-exactfive-distinct-three-center.md` | confirmed | outside lane; reported to Adam |
| §4.2 credits "structural UNSAT for selected D-R cells" to the TriApex lane | those cells belong to the D-R lane (label note above) | none |
| §7: positive controls, structural UNSAT, and exact local models are not terminals | the Phase 1 status and Section 10 already record no frontier change | none |
| §8 TriApex row: open input "end-to-end source-to-finite terminal", next result "close role map and certificate ingress" | matches Phases 2 and 3 | none |
| §4.2 and §7: a structural SAT/UNSAT wave that does not strengthen the bridge is rejected | the Phase 2 metric stage was assessed as instrument-blocked and not run (Phase 2 status) | applied: no run; Phase 3 next |
