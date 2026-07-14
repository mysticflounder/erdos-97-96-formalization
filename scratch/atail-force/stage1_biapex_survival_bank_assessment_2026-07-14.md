# ATAIL-FORCE bi-apex survival bank assessment

**Status: RESEARCH SPECIFICATION / NO CLOSURE CLAIM.**

This assessment was prepared while the full project build was running.  It
does not modify the imported Lean source graph.  Adam has authorized this
parallel closure research.

## Exact frontier

The checked scratch packet
`SurvivorPairRelocationPacket` supplies two distinct first-apex marginal
survivors `q,w`.  In the robust arm, deleting both still preserves K4 at the
second opposite apex.  The checked mirror theorem then produces a fresh
survivor pair at the first opposite apex on the same twice-erased carrier.

The current banked consequences have the wrong polarity for immediate
closure:

- `exists_qDeleted_apex_classes` packages the two second-apex survivor
  witnesses as exact `U5QDeletedK4Class` objects;
- `qDeleted_apex_class_inter_firstApex_marginal_card_le_one` proves that each
  such exact class contains at most one point of the original off-surplus
  first-apex marginal; and
- `three_le_qDeleted_apex_class_sdiff_firstApex_marginal` consequently puts at
  least three members of each class outside that marginal.

Thus the relocated class is not itself the missing two-point joint fiber.
Any closing step must correlate the old and mirrored survivor packets, rather
than pigeonhole within either apex marginal separately.

## Required bank preflight

The mandated registries and indexed Lean corpora were searched for common
survival after two deletions, opposite-apex co-radiality, and cumulative
survivor relocation.  The closest reusable banked statements are:

- `SelectedFourClass.inter_card_le_two`, an upper bound for distinct centers;
- `shortCap_inter_card_le_two_of_ne_partnerApex`, another one-center upper
  bound;
- `shortCapExactCarrierPartition_inter_card_eq_one_or_two`, a one-center
  exact partition count; and
- the `U5QDeletedK4Class` existence and intersection theorems already reused
  by the checked scratch packet.

None states a two-prescribed-apex survival alternative, carries a survivor
pair through repeated deletion on one common carrier, or turns the resulting
shell packet into an existing contradiction consumer.  The partition theorem
does not bridge this gap: its hypotheses and conclusion concern one short cap
and one selected class, with no cross-apex correlation.

## Smallest useful next producer

The next theorem should be a one-step `BiApexSurvivalStep` alternative on the
same twice-erased carrier.  Given the robust survivor packet, it should
produce at least one of:

1. the required off-surplus pair co-radial at both opposite apexes;
2. hypotheses of an already banked metric/order/critical-row contradiction
   sink; or
3. a new robust survivor packet on a strictly smaller carrier, with both
   prescribed-apex survival facts transported to that carrier.

The third arm is useful only with an explicit strict-cardinality decrease.
That measure would make survivor relocation a terminating finite descent,
instead of the exact abstract two-cycle exhibited by
`stage1_apex_flip_cycle_countermodel_2026-07-14.py`.

The hypothesis map for this producer is now precise:

- already available: the common carrier, distinct survivors, both deletion
  survival facts, exact four-shell packaging, off-surplus membership, and
  pairwise distinct prescribed-center radii;
- already available as sinks: fixed joint-fiber cardinality at most one and
  the banked U5 incidence/metric contradiction consumers once their positive
  cross-incidences are supplied;
- first missing antecedent: a live cap/order/convexity or critical-row fact
  that relates the old first-apex survivor pair to the mirrored second-step
  pair on the same carrier.

## Sharper first lemma: same-radius double-deletion classification

The broad `BiApexSurvivalStep` should not be the first Lean statement.  There
is a generic finite lemma immediately below it.

Let `q != w` lie in one selected class of radius `r` at a center `c`, and
assume K4 at `c` in `A`.  Then either K4 survives in
`(A.erase q).erase w`, or all of the following hold:

1. every positive-radius selected class of cardinality at least four at `c`
   has radius `r`;
2. `SelectedClass A c r` has cardinality four or five; and
3. its twice-erased remainder has cardinality two or three, respectively.

The proof is elementary and does not require geometric input.  Any K4 class
at a radius different from `r` avoids both erased points and therefore
survives unchanged.  At radius `r`, six points would leave four after the two
distinct erasures.  Hence failure of K4 makes `r` the unique K4 radius and
forces its original cardinality into `{4,5}`.

The theorem is now kernel-checked in
`same_radius_double_erase_classifier.lean` with the following interface:

```lean
sameRadius_double_erase_survives_or_unique_class_card_four_or_five
  (hK4 : HasNEquidistantPointsAt 4 A center)
  (hq : q ∈ SelectedClass A center r)
  (hw : w ∈ SelectedClass A center r)
  (hqw : q ≠ w) :
  HasNEquidistantPointsAt 4 ((A.erase q).erase w) center ∨
    (((SelectedClass A center r).card = 4 ∨
       (SelectedClass A center r).card = 5) ∧
      ∀ rho, 0 < rho →
        4 ≤ (SelectedClass A center rho).card → rho = r)
```

This lemma was absent from the required theorem banks.  Its checked proof reuses
`selectedClass_erase_eq`, `selectedClass_erase_card_eq_of_not_mem`, and the
standard `Finset.card_erase_of_mem` arithmetic rather than introducing a new
abstraction.

Applied to the survivor packet at `oppApex1`, the left arm is exactly the
missing common twice-erased-carrier K4 fact.  The right arm replaces an
unstructured failure with a unique four- or five-point first-apex row.

The same scratch module proves the stronger single-deletion polarity, because
it connects directly to the actual critical-system blockers:

- at cardinality four, deleting either `q` or `w` blocks K4 at
  `oppApex1`;
- at cardinality five, deleting either point leaves four members of the
  unique row, so K4 survives at `oppApex1`.

The relocation packet already says both deletions survive at `oppApex2`.
Therefore, in the cardinality-five branch, both actual blocker centers are
distinct from **both** opposite apices.  Combining this with
`same_blocker_two_hits_or_distinct_blockers` gives an exact next split:

1. the blocker centers coincide, and the one common extra center is
   equidistant from `q,w`; a second extra center or a two-center cap-kernel
   adapter is still needed; or
2. the blocker centers are distinct and already have all required separation
   from the two apices, leaving precisely the reciprocal incidences
   `w ∈ selectedAt(q)` and `q ∈ selectedAt(w)` to make both centers bisect
   `q,w`.

It also kernel-checks the complete conditional consumer
`false_of_distinctBlockers_mutualCriticalIncidence`: the two reciprocal
memberships, together with the automatically derived blocker/apex separation,
produce three distinct carrier centers on the perpendicular bisector of
`q,w` and contradict `Dumitrescu.perpBisector_apex_bound`.  Direct elaboration
is warning-free; all four new declarations have axiom closure exactly
`propext`, `Classical.choice`, and `Quot.sound`.

The second branch matches the existing checked critical-source bisector
frontier.  It removes the center-separation subproblem there; it does not yet
produce either reciprocal incidence.

## Exact residual after the classifier

The existing finite `(5,5,5)` apex-flip shadow realizes the right arm in its
sharpest form:

```text
first apex class  = {1,2,3,5},  survivors = {1,2}
second apex class = {5,6,7,9},  survivors = {6,7}
```

Both classes have cardinality four, each has three off-surplus points, and
the two ordinary double deletions survive only because each step forgets the
previous deletion history.  Therefore the generic classifier is a genuine
reduction but not a closure theorem.

The next geometric producer after that reduction is now narrower than the
original `BiApexSurvivalStep`: exclude a crossed pair of unique apex-centered
four/five-point rows with the cap-cover one-hit bounds and the common
convex/Moser order, or turn that crossed packet into a banked contradiction
consumer.

Bank preflight rejects the two closest apparent sinks:

- `C5D3B.shortCap_three_inter_false_of_minimal_u3` assumes `D.IsM44`,
  `U2Statement`, minimality, and short-cap saturation, whereas the live leaf
  assumes `hNoM44`; it cannot consume this branch.
- `u1TwoLargeCapObstruction` needs seven equalities across four nontrivial
  row centers.  Two apex classes supply only their two row equalities; they do
  not produce the five cross-row equalities or the required center
  inequality.  It remains a sink, not the missing producer.

Thus the first post-classifier antecedent is an order-sensitive relation
between the two exact apex rows.  Equality-only and incidence-only statements
cannot supply it; the existing exact finite cycle realizes both relaxed
interfaces.

## Existing cap-kernel adapter verdict

The three checked scalar kernels do not yet consume the crossed exact-row
packet.

- `bisectorCapKernel` needs two distinct centers both equidistant from one
  fixed endpoint pair, together with their cap-side placements.  The old
  survivor pair supplies the first center (`oppApex1`), but the packet does
  not make `oppApex2`, either critical blocker, or either mirrored survivor a
  second center equidistant from that same pair.  Producing that field is
  already the desired shared-radius or same-blocker bisector route.
- `twoCircleCapKernel` additionally needs a linked second circle and three
  strict cap-sign inequalities.  The two apex rows provide neither the
  required cross equalities nor an assignment of their support points to all
  three sign positions.
- `orderFanKernel` needs a three-center equality network plus a common cyclic
  order.  A pair of apex-centered rows provides only two centers, and the
  target theorem's abstract critical rows are not linked to these newly
  chosen apex classes.

Therefore there is no extraction-only closure hidden in the current kernels.
The smallest new geometric input remains one of:

1. a second center for the old survivor pair, with the cap-side placement
   needed by `bisectorCapKernel`;
2. one cross-support incidence linking an old pair member to the mirrored
   exact row, followed by a second incidence or center collision; or
3. a direct convex-order theorem forbidding the crossed unique
   four/five-point apex-row pattern.

Option 1 is equivalent to the original goal if the second center is
`oppApex2`.  Option 2 matches the already isolated critical-row coupling
frontier.  Option 3 without additional live fields is false: the exact
`Q(sqrt(3))` checker in
`crossed_apex_small_row_cegar/exact_tier_a_witness.py` constructs a strict
convex eight-point realization with two unique five-point apex rows and the
required crossed survivor pairs.  It does not encode the live MEC/cap,
all-center-K4, or critical-system fields, so the first useful producer is now
unambiguously Option 2: a cross-row center `z != oppApex1` satisfying
`dist z q = dist z w`, plus the cap-side placement consumed by
`bisectorCapKernel`.

## Exact closure split after the unique-row classifier

Parallel branch audits authorized by Adam agree that the proposed
`sameRadius_double_erase_survives_or_unique_class_card_four_or_five`
classifier is a real reduction, but not yet a closure theorem.  Its right arm
has three residual branches.

### Cardinality four

Deleting either chosen point blocks K4 at `oppApex1`, while the relocation
packet says both single deletions survive at `oppApex2`.  The shortest checked
consumer is cap-local: it suffices to produce a blocker center `z` in the
surplus cap, distinct from `oppApex1`, whose exact critical shell contains
both chosen points.  The source point is already in its own shell, so the
genuinely new fields are cap localization, center separation, and the one
cross-membership.  Then `outsidePair_unique_capCenter` contradicts the two
distinct cap centers bisecting the same outside pair.

This output cannot follow from `Nonempty (CriticalShellSystem D.A)` alone.
The exact-card-four row can be used to override a critical system so that
every source in that row chooses `oppApex1` as blocker.  A proof must therefore
use the live MEC/cap/full-filter coupling, not blocker-choice diversity.

### Cardinality five, distinct blockers

Both single deletions survive at both opposite apices.  Hence the two actual
blocker centers differ from both apices; in the distinct-blocker arm all
center-separation hypotheses for the checked Dumitrescu consumer are already
available.  The exact remaining producer is reciprocal critical incidence:

```text
w in (H.selectedAt q).support  and  q in (H.selectedAt w).support.
```

These memberships make `oppApex1`, `H.centerAt q`, and `H.centerAt w` three
pairwise-distinct carrier centers bisecting `q,w`, contradicting
`Dumitrescu.perpBisector_apex_bound`.  No current critical-system, cap-cover,
or theorem-bank result supplies either cross-membership.

### Cardinality five, coincident blocker

The common blocker is a second center bisecting the chosen pair.  If it lies
in a suitable adjacent cap with `oppApex1` while the pair is outside that cap,
`outsidePair_unique_capCenter` closes immediately.  The unresolved placement
is the blocker lying in the same strict cap interior as the pair: current
intersection bounds only identify the two hits and do not exclude this
between-case.  Closure requires either a third distinct bisector center (one
more critical row containing both points) or a convex/MEC theorem relocating
or excluding that between-case.

The complete four-shell audit is checked in
`coincident_blocker_four_shell_classifier.lean`.  The common pair leaves
exactly two residual shell members.  Both are off the first-apex circle by the
two-circle intersection bound.  If blocker and pair lie in one indexed cap,
both residuals are outside that cap because the pair saturates
`selectedFourClass_inter_capByIndex_card_le_two`.

The checked terminal consumer isolates the exact remaining producer: for
either residual member `x`, produce a selected global-K4 class centered at
`x` which contains both common points.  The first apex, common blocker, and
`x` are then three distinct carrier centers bisecting the pair, and
`Dumitrescu.perpBisector_apex_bound` closes.

This membership is not combinatorial fallout from global K4.  The exact
ten-vertex model in
`coincident_blocker_global_k4_incidence_falsifier.py` gives every center a
four-point selected row, excludes every center from its row, keeps every two
distinct rows' intersection at cardinality at most two, and realizes the
common blocker/cap/residual incidence ledger, while neither residual row
contains the common pair.  Thus the first missing input is genuinely
geometric: a cap/MEC radius-selection theorem forcing those memberships, or
an endpoint equality feeding a banked cap pushout/two-circle consumer.

The banked `endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep` family
does not provide that alternate.  Its center is the indexed opposite Moser
vertex and it requires a four-point indexed cap.  The residual `x` here is an
arbitrary off-cap carrier point, so no hypothesis map reaches that theorem.

Thus the next producer should not be another marginal-cardinality or broad
crossed-row census.  It should target the common geometric statement shared
by all three branches: produce a non-apex critical center containing the
chosen pair, with cap placement when only two centers are available; in the
distinct-blocker branch, produce both reciprocal incidences.  The existing
checked consumers then finish each branch without new metric algebra.

## Validation checkpoint

The full build completed before this follow-up.  The unique-row classifier
and coincident-blocker classifier have been validated as unimported scratch
Lean modules.  Their axiom closures are exactly `propext`,
`Classical.choice`, and `Quot.sound`; no production source or LIVE-T1 file was
changed.
