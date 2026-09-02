# D1 μ = 0 terminal analysis (TriApex leaf, Phase 3a)

**Date:** 2026-09-01
**Lane:** `d1-triapex-plan-20260901`
**Scope:** read-only assessment of whether the `μ = 0` paired fixed point of
the same-radius descent is refutable from the hypotheses the leaf
`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core` binds
after the Phase 3a checkpoint (commit `d4621c035`). Produced by a background
analysis agent. No Lean was written, no build was run, no solver was run.
**Validation by the lane owner:** the three load-bearing citations
(`criticalShellCenter_mem_capInteriorByIndex_of_two_hits`,
`CGN.index_strictly_between_of_equidistant`, and the private
`selectedClass_capInteriorByIndex_card_ge_two_of_card_four`) were re-read in
source on 2026-09-01 and match the statements used below. The agent read an
intermediate build of the Phase 3a change; the lemma name and the line
numbers in Sections 0 and 1 are corrected here to the committed names
(`lowSpanMutualOmissionPairAt_of_oneRadius_card_eq_fifteen`, the dispatcher
`twoRadii_or_lowSpanMutualOmissionPairAt_of_card_eq_fifteen`, leaf at
`:2578`, `sorry` at `:2627`). Every item labelled DERIVABLE is CONJECTURED
until it is written in Lean and compiled. The verdict in Section 4 is
HEURISTIC.
**Consumer:** the Phase 3 status of
`docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md`.


Read-only analysis. No file in the repository was edited, no build was run, no
solver was run. All paths are absolute under
`/Users/adam/projects/math-projects/erdos-97-96-formalization`.

Label key used throughout:

* **PROVEN** — I read the Lean statement in source at the cited `file:line` and
  the declaration is a `theorem`/`def`/structure field in the live tree (not in
  `attic/`, not in `lean/scratch/`).  I did **not** run `lake build` or
  `#print axioms`, so "PROVEN" here means "present and stated as claimed in
  source", not "re-verified by the kernel in this session".
* **MISSING** — no declaration with that content exists in the live tree; it
  would have to be proved.
* **DERIVABLE** — a composition of PROVEN facts that I checked by hand in this
  session.  It is *not* in source.  Treat every DERIVABLE item as CONJECTURED
  until it is written and compiled.
* **CONJECTURED / HEURISTIC** — my own judgement, stated as such.

---

## 0. What the leaf actually binds today

`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core`
lives at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2578`
and ends in a single `sorry` at `:2627`.

Its prefix binds, in order:

| binder | producer | line |
|---|---|---|
| `i, x, y, hxE, hyE, hxy, hxi, hyi, hxSafe, hySafe` (L1) | `exists_index_safe_pair_of_fiveSurviveOneFail` | `:2230` |
| `hcellsAtPair` (L3, pair index) | `strictApexFourWitness_safe_counts_of_pair` | `:2079` |
| `hxSignature`, `hySignature` | `deletionSignature_of_not_mem_two_retainedShells` | `:2183` |
| `iKept, iDeleted, j, …` (L2) | `exists_capIndex_avoiding_two_blockers` | `:2154` |
| `hcellsAtFree` (L3, blocker-free index) | `strictApexFourWitness_safe_counts_of_oneHit` | `:2115` |
| `hfifteen` (L4) | `strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen` | `:2246` |
| `K, z, w, …` (L6) | `exists_firstApex_mutualCrossDeletion_pair_through_source` | `:2261` |
| `hsixSlots` (L5) | `exists_orderedCap_six_of_card_eq_fifteen` | `:2356` |
| `hlowSpanAtPair` (Phase 3a) | `twoRadii_or_lowSpanMutualOmissionPairAt_of_card_eq_fifteen` (`:2548`), dispatching to `lowSpanMutualOmissionPairAt_of_oneRadius_card_eq_fifteen` | `:2448` |

**A structural point that matters for everything below.**  `hfifteen`,
`hsixSlots` and `hlowSpanAtPair` are all bound as *functions of a hypothesis*
`D.A.card = 15`.  The leaf has no cardinality hypothesis of its own, so the
`sorry` is still stated over every carrier size.  Nothing in the prefix
performs the `{15, ≥ 16}` split that the closure plan
(`docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md:280-290`)
counts in its measure `M`.  The μ = 0 state discussed here therefore lives
strictly inside the `card = 15` half of a split that has not been made.

---

## 1. The μ = 0 hypothesis list, item by item

I take "the μ = 0 state" to be: *the pair index* `i`, *the one-radius arm at*
`i`, *carrier size 15*, and a pair `q, w` of strict-interior points of cap `i`
occupying **adjacent** slots of the oriented complete cap order.

### 1.1 Carrier and cap-order scaffolding

| # | Item | Status |
|---|---|---|
| H1 | `D.A.card = 15` | **MISSING as a binder.**  It is an antecedent of `hlowSpanAtPair`, not a hypothesis of the leaf.  Phase 3 of the plan owns the split. |
| H2 | An oriented complete cap order `L : CGN.OrderedCap 6` for cap `i` with `CGN.MecCapPacket D.A L`, `CGN.MinorCapSideHypotheses`, `CGN.StrictCapOrder D.A L`, and `Finset.univ.image L.points = S.capByIndex i` | **PROVEN**, `exists_orderedCap_six_of_card_eq_fifteen`, `TriApexEndpointRetainedOmission.lean:2356` |
| H3 | Slots `0` and `5` are the two Moser vertices `(S.triangleByIndex i).v2 / .v3` (in one of the two orientations) | **PROVEN**, same theorem, second conjunct |
| H4 | `L.points t ∈ S.capInteriorByIndex i ↔ (t ≠ 0 ∧ t ≠ 5)` | **PROVEN**, same theorem, third conjunct (cardinality-generic form at `orderedCap_points_mem_capInteriorByIndex_iff`, `:2299`) |
| H5 | `capInteriorByIndex i` has exactly four points, enumerated injectively by slots `1..4` | **PROVEN**, same theorem, fourth conjunct, on top of `ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, `lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean:158` |
| H6 | `Q.W.supportAt i = S.capInteriorByIndex i` | **PROVEN**, `strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen`, `:2246` |
| H7 | Chord-projection strict order + `subchord_open_side_iff_A` (positive-side points of a subchord are exactly the strictly-between slots) | **PROVEN** as fields of `CGN.StrictCapOrder`, `lean/Erdos9796Proof/P97/CGN/CGN.lean:134-158` |

### 1.2 The circle Γ and the one-radius arm

| # | Item | Status |
|---|---|---|
| H8 | `0 < r`, `T ⊆ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩ S.capInteriorByIndex i`, `T.card = 4`, `T = S.capInteriorByIndex i` | **PROVEN in the `oneRadius` branch only**, `strictApexFourWitness_safe_counts_of_pair`, `:2079-2087`, first disjunct.  It is one of two arms; the `twoRadii` arm is a different cell of the plan's measure. |
| H9 | Consequently all four strict-interior points of cap `i` lie on one circle Γ = circle(apex `a = S.oppositeVertexByIndex i`, radius `r`), and `Γ ∩ capInteriorByIndex i` is exactly those four points | **PROVEN** from H5 + H8 (set equality by cardinality; the argument is the `himage`/`hTeq` rewrite inside `:2448`) |
| H10 | `a` is not `H.centerAt x` for any `x ∈ T` | **PROVEN as a `have`, not as an exported lemma.**  The term is `hcenterNe` inside `:2448`, built from `isUniqueFourCenter_centerAt` (`ATail/MinimalUniqueFourCover.lean:437`), `fullyDeletionRobustAt_of_apexRichClassStructure` (`ATail/ApexRichClassStructure.lean:77`), `not_isUniqueFourCenter_of_fullyDeletionRobust` (`ATail/MinimalUniqueFourCover.lean:210`).  Exporting it is bookkeeping. |
| H11 | Fan bound `(T ∩ shell(x)).card ≤ 2` for every `x ∈ T` | **PROVEN as a `have`, not exported.**  `hbound` inside `:2448`, from `sourceFaithfulDeletionFan_of_triApexAllLargeContext` (`ATail/SourceFaithfulSelectedFourFan.lean:133`) whose second disjunct is `SelectedFourClass.inter_card_le_two` (`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:474`) |
| H12 | Every `H.centerAt x` lies in some `S.capInteriorByIndex k` | **PROVEN**, `exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge`, `lean/Erdos9796Proof/P97/ATail/AllLargeCapCanonicalInterfaces.lean:317` |

### 1.3 The pair itself

| # | Item | Status |
|---|---|---|
| H13 | slots `a < b`, `b ≤ a + 2` in `Fin 4`, i.e. **μ ∈ {0, 1}** | **PROVEN**, `lowSpanMutualOmissionPairAt_of_oneRadius_card_eq_fifteen`, `:2448`, via `ATail/FourVertexLowSpan.lean:28` |
| H14 | mutual omission: `w ∉ shell(q).support` and `q ∉ shell(w).support` | **PROVEN**, same theorem |
| H15 | cross-deletion survival both ways: `HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q)` and symmetrically | **PROVEN**, same theorem, via `cross_deletion_survives_iff_not_mem_selected_support` (`ATail/CriticalPairFrontier.lean:781`) |
| H16 | distinct centres `H.centerAt q ≠ H.centerAt w` | **PROVEN**, same theorem, via `blocker_centers_ne_of_not_mem_other_selected_support` (`ATail/CriticalPairFrontier.lean:833`) |
| H17 | **μ = 0 exactly**, i.e. `b.1 = a.1 + 1` | **MISSING.**  The lemma delivers only `b ≤ a + 2`.  No case split on `b − a` exists anywhere in the tree. |
| H18 | An interval object at all — `capOpenInterval`, `capSpan`, `IntervalPotential`, `capSpan_left_lt` / `_right_lt` / `_inner_lt` | **MISSING.**  Confirmed by the 2026-08-30 exact-name search, `docs/checkpoints/d1-source-interface-extract-2026-08-30.md:712-757`.  The prose surface is at `docs/erdos-97-descent-prose-proof-atomic.md:2686-2745`. |
| H19 | The cap in which `H.centerAt q` and `H.centerAt w` sit is *named* | **MISSING.**  H12 gives existence of some index `k`, not `k = i` and not `k ≠ i`. |
| H20 | Any link between the μ = 0 pair `q, w` and the other leaf binders — `O.kept`/`O.deleted`, `J.source`, the four sources of `Q`, the L1 pair `x, y`, or the L6 pair `z, w` on `K` at `S.oppApex1` | **MISSING.**  `hlowSpanAtPair` is produced from `hcellsAtPair` alone.  It shares only the index `i`, not the points.  The plan already records this: L6's pair "may contain" `kept`/`deleted` and that is flagged `{{NEEDS_PROOF}}` (`…closure-plan…:337-341`). |

### 1.4 Net reading of §1

Of the twenty items, the geometric scaffolding (H2–H12) and the pair's
combinatorics (H13–H16) are in source.  What is **not** in source is (a) the
cardinality split H1, (b) the μ value H17 and any interval object H18, (c) the
cap location of the two centres H19, and (d) every connection to the rest of
the leaf's binders H20.  In particular **"μ = 0" is not currently a
Lean-expressible state**; it exists only as slot arithmetic one would have to
introduce.

---

## 2. What the prose means by "paired fixed point" and by the K2,2 terminal

### 2.1 "μ = 0 paired fixed point"

Citations: `docs/erdos-97-descent-prose-proof-atomic.md:8577-8584` and
`:8603-8605`; the machinery it refers back to is at `:2664-2745` (the measure),
`:2777-2825` (the state and the one-step relation), `:2845-2860` (the
constructor protocol).  Restated at
`docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md:154-159` and
`docs/checkpoints/d1-source-interface-extract-2026-08-30.md:767-772`.

In my own words.  The descent's *state* is not a point but an ordered **pair**
of retained deletion witnesses `(q, w)` sitting on one strict-cap slice, with a
fixed cap parameter `τ`.  Its *measure* is `μ(q,w) = |{x ∈ C : τ(q) < τ(x) <
τ(w)}|`, the number of slice points strictly between the two endpoints
(`:2686-2700`).  The one-step relation (`:2799-2812`) either emits a terminal
packet or rebuilds a **new** pair `(q, t)`, `(t, w)`, or `(t, t')` from an
interior point `t` supplied by whichever branch constructor fired; the three
shrink lemmas `capSpan_left_lt`, `capSpan_right_lt`, `capSpan_inner_lt`
(`:2712-2743`) then force `μ` to drop.  Well-founded recursion on `μ` closes
the architecture (`:2856-2870`).

A **fixed point** in that machine is a state on which the one-step relation
cannot produce a strictly smaller successor.  At `μ = 0` the two endpoints are
adjacent in the slice order, so there is *no* interior point `t` to split on;
every successor construction the protocol allows (`LEFT`, `RIGHT`, `INNER`,
`:2879-2887`) is unavailable.  The recursion therefore returns the state to
itself.  It is "paired" because the irreducible object is the mutually-omitting
**pair** with its two distinct blockers and its two surviving cross-deletions —
exactly H13–H16 above.  The prose's own summary of the situation is blunt:
"Neither the `mu = 0` paired fixed point nor the strict two-cap disjoint `K2,2`
plus global-escape packet has a contradiction consumer" (`:8583-8584`), and
`:8603` lists it as open item 3 of four.

The design consequence is the one the prose states at `:2870`: the well-founded
scheme "must not be marked as closing F3 until … both bounded terminal
consumers are proved".  The descent converts an unbounded search into a bounded
one; it does **not** produce a contradiction.  All the mathematics is in the
terminal.

### 2.2 The K2,2 terminal

Citations: `docs/erdos-97-descent-prose-proof-atomic.md:8577-8583`;
`docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md:154-159`;
`docs/checkpoints/d1-source-interface-extract-2026-08-30.md:769-772`.

The prose text is: "The `mu = 1` arm yields either a `mu = 0` pair or two
adjacent exact rows.  One shared outside support is excluded by the
circumcenter/chord sign identity and a strict-cone dot-product argument.  The
disjoint-support arm retains an outside `K2,2` of mutual omissions and at least
eight global sources whose deletions survive at both row centers.  The MEC-cap
acute-visibility step still needs a low-level Lean adapter."

My reading (**HEURISTIC** — the prose does not spell the packet out and no Lean
structure names it):

* When `μ = 1` the descent does not terminate at a pair; it terminates at *two
  adjacent exact four-rows*, one selected at each endpoint.  Each row is a
  four-point class about its own centre, and by the cap bound each row places
  only two of its four points inside the cap; the other two "escape" outside.
* The **shared-support** case, where the two rows have the same outside pair, is
  closed in prose by a circumcentre/chord sign identity plus a strict-cone
  dot-product argument.  Neither has a Lean adapter.
* The **disjoint-support** case leaves two disjoint outside pairs, four points
  in all, and the omission relation between the two outside pairs is *complete
  bipartite*: each of the two points outside row 1 is omitted by row 2's shell
  and vice versa.  That complete bipartite pattern on `2 + 2` vertices is the
  `K2,2`.  On top of it the packet carries at least eight further carrier points
  ("global sources") whose deletion preserves a four-class at **both** row
  centres — the "global escapes".
* "MEC-cap acute-visibility" is the missing geometric step: an angle/sign
  statement about how a cap point sees the two rows relative to the
  minimal-enclosing-circle chord.  The nearest existing Lean machinery is the
  `reverseHit_twoCenter_sqdist_acute` chain noted at
  `docs/checkpoints/d1-source-interface-extract-2026-08-30.md:149`, and that
  audit line explicitly records that the ordered cap, its indices, and the
  betweenness disjunction "are **not** forwarded to D1".

Neither terminal has a consumer.  That is the whole content of "v87 is a
bounded-terminal classification, not a proof of D1" (`:8595-8597`).

---

## 3. Candidate contradiction routes for μ = 0

### Route A — adjacent-slot bisector uniqueness

**Statement to prove.**  At `card = 15`, in the one-radius arm at index `i`,
with `q, w` on adjacent interior slots of cap `i`, the only point of `D.A`
equidistant from `q` and `w` is the apex `a = S.oppositeVertexByIndex i`.

**Ingredients, all read in source:**

1. `CGN.index_strictly_between_of_equidistant`,
   `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:51-60`.  Given the cap
   packet, side hypotheses and strict order, if slot `j` is equidistant from
   slots `r < s` then `r < j ∧ j < s`.  **PROVEN.**  Applied to the two adjacent
   slots this kills *every* point of `S.capByIndex i`, endpoints included: there
   is no slot strictly between consecutive slots.
2. `CapSelectedRowCounting.outsidePair_unique_capCenter`,
   `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:350-360`.  Two distinct
   cap points cannot both be equidistant from the same two distinct points
   outside that cap.  **PROVEN.**  Applied with cap `k ≠ i`: `q, w` are strict
   interior of cap `i` hence outside cap `k`; the apex `a` lies in cap `k`
   (`oppositeVertexByIndex_mem_capByIndex_of_ne`, currently `private` at
   `ATail/FirstApexInteriorPairGeometry.lean:48` and
   `ATail/TwoCenterCapLocalization.lean:37`); and `dist a q = dist a w = r` from
   H8.  So no `c ∈ capByIndex k`, `c ≠ a`, bisects `q, w`.
3. The already-packaged first-apex version of exactly this conclusion is
   `bisectorCenter_mem_firstApexInterior`,
   `lean/Erdos9796Proof/P97/ATail/FirstApexInteriorPairGeometry.lean:128-212`.
   **PROVEN** but stated only for `S.oppIndex1`.  Its two geometric helpers are
   already index-generic:
   `SurplusCapPacket.capInterior_pair_dist_ne_leftOuter_of_selectedClass`
   (`lean/Erdos9796Proof/P97/SurplusM44Packet/Shard03.lean:211`) and
   `…_rightOuter_…` (`:153`).  The index-specific glue is the two identities
   `leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx` and
   its right-hand twin, used at `:157-180`.

**Status of Route A's *statement*: DERIVABLE.**  Combining 1 and 2 (or
generalizing 3 over `i : Fin 3`) proves it.  This is bookkeeping-level work.

**First missing antecedent for a *contradiction*: a second bisector point.**
Route A is a non-existence statement; to make it produce `False` one needs some
`c ∈ D.A` with `c ≠ a` and `dist c q = dist c w`.  The binder set does not
supply one, and the μ = 0 hypotheses actively deny the obvious candidates:
`H.centerAt q` is *not* such a point precisely because `w ∉ shell(q)` (H14), and
symmetrically for `H.centerAt w`.  **MISSING**, and structurally so.

**Verdict: Route A as stated is a dead end.**  It is worth proving anyway, as a
reusable exclusion, but it will not close μ = 0 on its own.

### Route B — one-hit rule + cap betweenness: μ = 0 is *forced*, not optional

This is the route that actually changes the picture, and it changes it in the
unwelcome direction.

**Ingredients, all read in source:**

1. `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`,
   `lean/Erdos9796Proof/P97/ATail/AllLargeCapCanonicalInterfaces.lean:85-95`.
   If a canonical critical shell meets the slice
   `SelectedClass D.A (S.oppositeVertexByIndex i) r ∩ S.capInteriorByIndex i`
   in **two** points, and that apex is rich, and the centre is a unique-four
   centre, then the centre lies in `S.capInteriorByIndex i`.  **PROVEN.**
   (Contrapositive form, also PROVEN:
   `criticalShell_inter_otherRichCapSlice_card_le_one`,
   `TriApexEndpointRetainedOmission.lean:312`.)
2. `isUniqueFourCenter_centerAt`, `ATail/MinimalUniqueFourCover.lean:437`.
   **PROVEN.**
3. `G.apex_rich i`, a field of `TriApexAllLargeContext`,
   `ATail/AllLargeCapCanonicalInterfaces.lean:297-311`.  **PROVEN** (hypothesis).
4. H9: the slice is exactly `capInteriorByIndex i`, the four Γ points.
5. `CGN.index_strictly_between_of_equidistant`, `CapSelectedRowCounting.lean:51`.
   **PROVEN.**

**The derivation (DERIVABLE; checked by hand this session, not in source).**
Write `p₁, p₂, p₃, p₄` for the interior points at slots `1, 2, 3, 4`.  Say
`p_s → p_t` when `p_t ∈ shell(p_s).support`, `s ≠ t`.

* If `p_s → p_t` then `shell(p_s)` meets the slice in at least `{p_s, p_t}`, so
  by (1)+(2)+(3) the centre `c_s := H.centerAt p_s` lies in
  `capInteriorByIndex i`.  Hence `c_s` is *one of the four* `p_u`.
* `c_s ≠ p_s` and `c_s ≠ p_t` because the shell radius is positive.
* `c_s` is equidistant from `p_s` and `p_t`, all three are slots of the same
  ordered cap, so by (5) `slot(c_s)` is **strictly between** `slot(p_s)` and
  `slot(p_t)`.
* Therefore `|s − t| ≥ 2`: **adjacent interior slots never contain one another.**

Two consequences:

* **B1.**  Every adjacent slot pair is automatically mutually omitting.  So at
  `card = 15` in the one-radius arm a μ = 0 pair *always exists*; the `Fin 4`
  low-span kernel `finFour_exists_nearby_mutualFalse_of_card_le_two`
  (`ATail/FourVertexLowSpan.lean:28`) is not needed, and `μ = 1` is not a
  reachable terminal in this arm at all.  The prose's hope that the `μ = 1` arm
  is the tractable one (`:8577-8580`) does not help here: the arm is empty.
* **B2 (metric pin).**  If a distance-2 arrow `p₁ → p₃` does exist, then
  `c₁ = p₂` necessarily, and `dist(p₂,p₁) = dist(p₂,p₃)` with all three on Γ
  forces `p₂` to be the arc midpoint of `p₁p₃` on Γ.  If both `p₁ → p₃` and
  `p₂ → p₄` fire, `p₁,p₂,p₃,p₄` are **equally spaced on Γ**.

**First missing antecedent: a fact forcing at least one arrow to exist**, i.e.
some `p_s` with `(shell(p_s) ∩ capInteriorByIndex i).card = 2`.  Nothing in the
binder set supplies it; H11 gives only the upper bound `≤ 2`.  With no arrow,
the `contains` matrix is the identity, and every constraint above is vacuous.
**MISSING.**

**Verdict: Route B is real, cheap, and yields a genuine narrowing (B1, B2) but
no contradiction.**  Its practical effect is to make the μ = 0 terminal
unavoidable rather than one of two options — i.e. it *removes* an escape hatch
from the current plan rather than closing the leaf.  I recommend recording B1
in the plan: it retires the low-span kernel at `card = 15` one-radius and lets
the μ = 0 pair be chosen canonically as slots `1, 2`.

### Route C — eliminate the two-radii arm of `apex_rich i` and pin the apex class to exactly six

**Ingredients:**

1. `selectedClass_capInteriorByIndex_card_ge_two_of_card_four`,
   `lean/Erdos9796Proof/P97/ATail/FirstApexInteriorPairGeometry.lean:232-278`.
   A class at `S.oppositeVertexByIndex i` of card 4 has at least two members in
   `capInteriorByIndex i`.  **PROVEN but `private`, and stated with `card = 4`.**
   I read the proof: the exact cardinality is used only in the closing `omega`
   (`:277-279`), after `(T \ capInterior i).card ≤ 2`.  Generalizing the
   hypothesis to `4 ≤ T.card` is a one-line change.  The two ≤1 bounds it rests
   on, `SurplusCapPacket.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`
   and `…rightAdjacentCap…` (`lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:1064`,
   `:1079`), and the cover
   `selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`
   (`lean/Erdos9796Proof/P97/SurplusM44Packet/Shard02.lean:661`), are all
   index-generic and **PROVEN**.
2. H8/H9: `capInteriorByIndex i ⊆ SelectedClass D.A a r`, `r > 0`.
3. `G.apex_rich i : ApexRichClassStructure D.A a`,
   `lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean:50-53`: either one
   radius carries ≥ 6 points, or two distinct radii each carry ≥ 4.

**The derivation (DERIVABLE; checked by hand, not in source).**

* Distinct radii about the same centre give disjoint classes, so for `ρ ≠ r`,
  `SelectedClass D.A a ρ ∩ capInteriorByIndex i = ∅` by H9 (the interior is
  entirely inside the `r`-class).
* By (1) generalized, any class at `a` of card ≥ 4 meets `capInteriorByIndex i`
  in ≥ 2 points.  Hence every class at `a` of card ≥ 4 has radius exactly `r`.
* The **two-radii branch of `apex_rich i` is therefore impossible**: it demands
  two distinct radii each with ≥ 4 points, i.e. two distinct radii each meeting
  `capInteriorByIndex i`.
* So `apex_rich i` is the six-point branch, at radius exactly `r`:
  `6 ≤ (SelectedClass D.A a r).card`.
* But `(SelectedClass D.A a r \ capInteriorByIndex i).card ≤ 2` by the cover of
  (1).  With `capInteriorByIndex i` of card 4 and contained in the class, the
  class has card **exactly 6**: the four Γ points plus exactly one point in the
  left adjacent cap and exactly one in the right adjacent cap.

**Status: DERIVABLE**, modulo publishing the generalized form of the `private`
lemma.  This is a genuinely sharp pin and I did not find it stated anywhere in
`docs/` or in Lean.

**First missing antecedent for a contradiction:** a fact excluding those two
adjacent-cap points at distance `r` from `a`, or forcing them to be the two
Moser vertices of cap `i` (which are themselves the other two apices) and then
deriving a contradiction from six points of `capByIndex i` lying on one circle
about `a`.  Nothing in the binder set does either.  `G.no_center_covers_all_apices`
(`AllLargeCapCanonicalInterfaces.lean:308-311`) only forbids all *three* apices
in one class, and `a`'s own class cannot contain `a`, so that field is already
satisfied.  **MISSING.**

**Verdict: the best narrowing available.**  It converts an unstructured
existential (`apex_rich i`) into an exact six-point class with a named
decomposition `4 + 1 + 1`.  That is the kind of object a contradiction consumer
can actually be written against.  I would run this before anything else.

### Route D — global capacity count at `card = 15`

**Ingredients:**

* `G.notRobustCover_card : D.A.card ≤ 4 * (notRobustCenters D).card`, and
  `card_le_four_mul_notRobustCenters`, `ATail/MinimalUniqueFourCover.lean:609`.
  **PROVEN.**  `notRobustCenters D = D.A.filter (¬ FullyDeletionRobustAt D ·)`,
  `:598`.
* `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`,
  `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:305-310`: a four-class
  whose centre lies in cap `k` meets cap `k` in at most two points.  **PROVEN.**
* `criticalShell_inter_otherRichCapSlice_card_le_one`,
  `TriApexEndpointRetainedOmission.lean:312`.  **PROVEN.**
* `H.no_qfree_at` (field of `CriticalShellSystem`), which makes the four-class at
  a given centre unique, hence the fibres of `x ↦ H.centerAt x` have size ≤ 4.

**The count (DERIVABLE; done by hand).**  At `card = 15` the carrier is 3 apices
plus 3 × 4 interior points.  Every point's centre lies in one of the 12
interiors (H12).  Fibres have size ≤ 4, so at least 4 distinct centres.  For a
cap `k` in the one-radius arm, a centre inside `capInteriorByIndex k` serves at
most 2 of that cap's points and a centre outside serves at most 1.  Writing
`n_k` for the number of centres inside cap `k` and `C` for the centre set, the
requirement is `2 n_k + (|C| − n_k) ≥ 4`, i.e. `n_k + |C| ≥ 4`, which `|C| ≥ 4`
already satisfies.

**First missing antecedent: a *lower* bound on fibre size**, e.g. "every centre
serves at least three of its four class members".  Without it the count is
slack by construction.  **MISSING**, and I see no source of such a bound: the
whole point of the docstring at `ATail/MinimalUniqueFourCover.lean:605-608` is
that "a contradiction needs MORE than three quarters of the carrier to be
deletion robust", which is the opposite direction.

**Verdict: dead end without new input.**  I checked the arithmetic explicitly;
it is satisfiable.

### Route E — the cap-interior equidistance kernels

`false_of_capInterior_center_equidistant_three_points`,
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:3745-3795`:
four points in one strict cap cannot be a centre plus three points equidistant
from it.  **PROVEN**, and index-generic — it needs only `D.convex` and
`S.capByIndex_cgn4g_capData` (`lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:749`),
no cardinality hypothesis.  Companions in the same file:
`false_of_orderedCap_three_equidistant_betweenness_cycle` (`:3601`),
`false_of_orderedCap_four_equidistant_betweenness_cycle` (`:3664`),
`false_of_orderedCap_center_equidistant_three_points` (`:3709`),
`false_of_capInterior_four_equidistant_hook_cycle` (`:3800`).

**First missing antecedent: a third co-cap shell point.**  Route E needs
`(shell(x) ∩ capInteriorByIndex i).card ≥ 3`.  H11 caps that at 2, and Route B's
one-hit rule caps it at 1 whenever the centre is in another cap.  The kernels
are therefore *already saturated* by the bounds the leaf carries: they can never
fire from these binders.  **MISSING and unreachable.**

The betweenness-cycle kernels (`:3601`, `:3664`) are more promising in
principle, since they consume 3- and 4-cycles of perpendicular-bisector
incidences inside one ordered cap.  Their missing antecedent is a *cycle* of
equidistances among cap-`i` slots.  Route B shows that each arrow contributes
exactly one such incidence with a determined middle slot; a cycle would need
several arrows to co-exist, and the row bound H11 permits at most one arrow per
slot, so at most four arrows total.  Whether four arrows can form the required
cycle is a bounded combinatorial question over the `distance ≥ 2` graph on
`{1,2,3,4}` — this is the cheapest place where a real contradiction could
still hide.  **MISSING**, but bounded and checkable by hand.

### Route F (mentioned in the prompt) — the second circle through `q` and `w`

There is no second circle.  `q` and `w` share the circle Γ about the apex.  Any
other common circle would be centred on a bisector point of `q, w`, and Route A
says the only carrier bisector point is the apex itself.  `SelectedFourClass.inter_card_le_two`
(`U1CarrierInjection.lean:474`) then gives nothing: `shell(q) ∩ shell(w)` has at
most two points and μ = 0 does not force it to be non-empty.  **Dead end.**

---

## 4. Assessment (HEURISTIC)

**My honest judgement: the μ = 0 state is not refutable from the facts listed in
§1.  A witness configuration is plausible at the incidence level, and I can
exhibit one.**

Take the four Γ points `p₁ … p₄` at slots `1 … 4` of cap `i`.  Let each `p_s`
have a *distinct* critical-shell centre `c_s` lying in `capInteriorByIndex k`
for some `k ≠ i`, chosen so that `shell(p_s) ∩ capInteriorByIndex i = {p_s}`.
Check every listed constraint:

* H11 fan bound: `|T ∩ shell(p_s)| = 1 ≤ 2`.  Satisfied.
* Route B one-hit rule: `|shell(p_s) ∩ slice_i| = 1 ≤ 1`.  Satisfied.
* `selectedFourClass_inter_capByIndex_card_le_two` at `c_s`'s own cap: the
  remaining three shell points can be placed as 2 in cap `k` and 1 in the third
  cap.  Satisfied.
* H10: no `c_s` is an apex.  Satisfied by construction.
* H14 mutual omission for *every* pair, in particular the adjacent pair: the
  `contains` matrix is the identity.  Satisfied.
* H15 cross-deletion survival: `w ∉ shell(q)`, so deleting `w` leaves the
  four-class at `c_q` intact.  Satisfied.
* H16 distinct centres.  Satisfied by construction.
* `G.no_center_covers_all_apices`: no class needs all three apices.  Satisfied.
* `G.notRobustCover_card`: `15 ≤ 4·|C|` needs `|C| ≥ 4`; we already have 4
  distinct centres from cap `i` alone.  Satisfied.

Every constraint in §1 plus every bound I found in §3 is met.  This agrees with
what the closure plan already records at
`docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md:264-266`:
"Incidence content alone is satisfiable (O5, O6), every v87 terminal is
conditional, and no terminal has a contradiction consumer."  My independent
construction is a second, cheaper confirmation of that recorded finding, now
specialized to the μ = 0 cell.

Two caveats, stated as caveats:

* This is an **incidence** witness.  I have *not* shown it is realizable by
  actual points of ℝ² in convex position.  Metric realizability is the open
  question, and it is where a contradiction, if there is one, must live.
* Route B's B1 result cuts the other way for the project: it says the μ = 0
  terminal cannot be avoided at `card = 15` in the one-radius arm.  So the leaf
  cannot be closed by pushing the descent; the terminal must be consumed.

**Smallest experiment to decide it (described only; not run).**

*Stage 1 — incidence feasibility, to confirm the negative.*  Fix the named-role
quotient at `card = 15`: 15 labelled points, 3 apices plus 3 caps of 4 ordered
interior slots each, with each cap's slot order fixed.  Boolean/finite-domain
variables: for each point `x`, its centre `c(x)` ranging over the 12 interior
labels; for each point `x`, its shell as a 4-subset of the 15 labels containing
`x`; and a same-distance relation on labelled pairs.  Constraints, all taken
from PROVEN source facts: (a) `x ∈ shell(x)`; (b) `|shell(x) ∩ capByIndex k| ≤ 2`
when `c(x) ∈ capInterior k`; (c) `|shell(x) ∩ capInterior j| ≤ 1` for `j ≠ k`
under the one-radius arm at `j`; (d) `c(x)` never an apex; (e) no class
containing all three apices; (f) for cap `i`, all four interiors on one radius
from `a`; (g) the Route B betweenness rule — if two cap-`i` points lie in one
shell, that shell's centre is a cap-`i` slot strictly between them; (h) the
adjacent pair `p₁, p₂` mutually omitting with distinct centres.  Ask SAT.  My
prediction, from the witness above, is **SAT**, and the run's only purpose is to
make the negative result machine-checked rather than hand-checked.  Cost: one
small SAT instance; no new encoder needed beyond the existing `card_head`
structural lane.

*Stage 2 — the decisive metric question, only if Stage 1 is SAT.*  Take the
single simplest model Stage 1 returns and ask whether it is realizable:
coordinates for 15 points, convex position, the MEC triangle with the three
apices on the circle, the four cap-`i` interiors at distance `r` from `a`, and
the distance equalities each shell imposes.  This is a `QF_NRA` feasibility
question of the same shape as the existing `piqd` Z3 metric profile
(`…closure-plan…:405-412`).  **SAT there means the μ = 0 terminal is genuinely
open and the D1 route needs content from outside the current binder set.**
UNSAT with a usable core names the exact metric identity the Lean consumer must
encode — and that identity is the thing the prose has been calling the
"circumcenter/chord sign identity" and "acute-visibility" step
(`docs/erdos-97-descent-prose-proof-atomic.md:8579-8583`).

*Cheaper hand-check to do first, before either stage.*  Route E's bounded
question: over the `distance ≥ 2` graph on slots `{1,2,3,4}`, with out-degree at
most one per slot and each arrow's centre forced to a strictly-between slot,
enumerate all arrow sets and check whether any produces a 3- or 4-cycle of
perpendicular-bisector incidences of the exact shape consumed by
`false_of_orderedCap_three_equidistant_betweenness_cycle` (`:3601`) or
`false_of_orderedCap_four_equidistant_betweenness_cycle` (`:3664`).  There are
only a handful of arrow sets.  If one of them is forced *and* cyclic, that is a
contradiction consumer for free from already-proved theorems.  If none is
forced — which is what I expect, since the arrow-free configuration above
satisfies everything — the negative result is confirmed without any solver at
all.

**Ranked recommendation.**

1. Route E's hand enumeration (no compute, decides whether an existing kernel
   fires).
2. Route C (best narrowing; retires the two-radii branch of `apex_rich i` and
   pins the apex class to exactly `4 + 1 + 1`).
3. Route B's B1 (retires the low-span kernel at `card = 15` one-radius and makes
   the μ = 0 pair canonical; also a plan-document correction, since it shows the
   `μ = 1` arm is empty in this cell).
4. Stage 1 SAT, to make the negative machine-checked.
5. Route A, as a reusable exclusion only.

I did not propose any axiom or `sorry`, and I wrote no Lean.
