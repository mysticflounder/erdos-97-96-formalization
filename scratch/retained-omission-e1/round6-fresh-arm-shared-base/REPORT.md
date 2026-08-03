# Round 6: fresh-arm shared-base preflight

## Scope and verification limit

This is a read-only, literal-source trace of only
`Problem97.ATailFrontierLiveClosure.RetainedOmissionAllLargeNormalForm.reverseHitFreshCommonDeletion`, for the open core
`false_of_retainedOmission_triApexAllLarge_core`.  No Lean/Lake invocation,
solver, generated artefact, or source edit was performed.  Thus the findings
below are source-level applicability facts, not a fresh kernel check.

## Correction (2026-08-01)

The original fresh-arm trace incorrectly treated `freshPacket.B₂` as an
arbitrary q-deleted witness unrelated to `K`.  Specializing
`FiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell` to the
second row at `H.centerAt d O.deleted_mem_A` identifies it with `K`.  Hence
`k,d ∈ freshPacket.B₂`, `fresh ∉ freshPacket.B₂`, and its first-cap
intersection is exactly `{k,d}`.  The actual missing positive datum is in the
apex-side row `freshPacket.B₁` (and its order/metric structure), not in
`freshPacket.B₂`.  The remainder of this report is retained only as a record
of the rejected shared-base route and must be read subject to this correction.

The mandatory registry census was consulted first:

* `docs/general-n-certificate-bank-mining-2026-07-09.md`;
* `certificates/p97_rvol_general_n_mining.{md,json}`;
* `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
* `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The only close general-n bank hit is the U2 shared-base family; the U5
bisector hits require a dangerous-triple/row-incidence package that this
constructor does not provide.  The legacy and older-general registries did
not expose a closer source-reachable shared-base, two-circle, or non-bisection
consumer for this exact packet.

## Exact fresh-arm data

Put `a = S.oppApex1`, `d = O.deleted`, `k = O.kept`, and
`b = H.centerAt d O.deleted_mem_A`.  Let
`K = (H.selectedAt d O.deleted_mem_A).toCriticalFourShell.support`.
The constructor in `ATail/FrontierLiveClosure.lean:6778-6801` gives:

* `k != d`, `k,d` are in the `a`-selected class at the same `radius`, and
  both are in the first strict cap (fields of
  `OrientedRetainedCommonDeletion`, `RetainedMatchingLargeCapConsumer.lean:203-223`);
* `k in K` (`reverse_mem`) and `d in K` (the selected shell's source
  membership);
* `K intersect S.capByIndex S.oppIndex1 = {k,d}`;
* `b` lies in that strict cap;
* `fresh` lies in that strict cap, is distinct from `k,d`, and
  `fresh notin K`; and
* `freshPacket : CommonDeletionTwoCenterPacket D H fresh a b`.

The last item is only two K4 *after-erasing-fresh* rows at centers `a` and
`b`.  Its interface (`CommonDeletionTwoCenter.lean:29-46`) supplies arbitrary
four-sets `B1,B2`, their cardinalities, and `|(B1 intersect B2)| <= 2`; it
does **not** say that either `k` or `d` belongs to either row, nor that a row
equals `K`.

Consequently the existing shared base is exactly the pair `k,d` for:

1. the fixed `a`-circle of radius `radius`, and
2. the fixed `b`-circle represented by `K`.

`fresh_not_mem_reverseShell` says that `fresh` is *not* on the second of these
fixed circles.  It is therefore a deletion-survival/omission fact, not a
third-common-point fact.  Indeed
`cross_deletion_survives_iff_not_mem_selected_support` converts it directly
to K4 survival at `b` after erasing `fresh`; the normalization proof uses
exactly that conversion in
`RetainedMatchingCommonDeletionNormalization.lean:127-131`.

## Candidate consumers and preflight

| Candidate | What is already available | First missing antecedent |
| --- | --- | --- |
| `two_circle_common_point_eq_endpoint` / `two_circle_noncollinear_common_point_elim` (`TwoCircleCrossing.lean:40-66`) | Common endpoints `k,d`, their distinctness, and their memberships on the fixed `a` and `b` circles. | A third point in **both fixed circles**.  Taking it as `fresh` is impossible already on the `b` side, by `fresh_not_mem_reverseShell`; an orientation/non-bisection fact would only help after that membership existed. |
| Bank `Problem97.u2_sharedBase_family_contradiction` (RVOL census, `p97_rvol_general_n_mining.json:27908-27920`) | Same two base memberships and base distinctness match its `e1,e2` portion. | Its `w_exact`, `w_sel`, and `signedArea2 e1 e2 w != 0`.  `fresh` supplies none: it is not even in the `b` selected shell. |
| `blocker_centers_eq_of_secondRadius_mutual_cross_membership` (`FrontierLiveClosure.lean:7027-7081`) | `k,d` share the `a` radius, and `k in K` is one directed cross-membership. | The reverse membership `d in selectedAt k` is expressly false from `O.deleted_not_mem_kept_shell`.  For a fresh/deleted application, the constructor additionally lacks common-radius membership and the positive reverse-shell membership, the latter contradicting `fresh_not_mem_reverseShell`. |
| `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair` (`ThirdCenterCommonPair.lean:78-138`) | The generic bisector bound is present in current source. | A *third actual selected row* containing both designated base endpoints, plus its center distinct from the two known centers.  `freshPacket.row₂` is only an existential q-deleted K4 row at `b`; it is not the actual row at `fresh` and gives no base memberships. |
| RVOL U5 common/double-bisector kernels, especially `u5_common_bisector_triple_incompatibility` and `qcritical_exact_selected_double_bisector_incompatibility` (registry around `p97_rvol_general_n_mining.json:32308-32320,33468-33521`) | None beyond the broad U5 vocabulary. | A dangerous triple/non-collinear triple and explicit memberships in the required q-deleted rows.  The fresh packet has neither. |

The compatibility-only non-bisector theorem at
`FrontierLiveClosure.lean:13676-13737` belongs to a different
fresh-third-blocker-fiber interface.  It accepts an already constructed fiber,
singleton-radius/alignment data, and a second-blocker distance inequality; it
has no adapter from this fresh common-deletion packet, so is not a candidate
for this arm.

## Smallest useful missing bridge

There is no consistent one-fact bridge from `fresh_not_mem_reverseShell` to a
shared-base two-circle contradiction: the required positive membership
`fresh in K` is its literal negation.

The smallest *non-vacuous* next fact is instead a source-bridge identifying
two named points of `freshPacket.row₂` with the retained base (or, more
generally, proving a concrete overlap with `K`).  For example, a theorem of
the form

```lean
k in freshPacket.B₂ /\\ d in freshPacket.B₂
```

would create a second, explicit `b`-row through the retained base.  It still
would not close by itself: one would then need a third common point or a
radius/row-uniqueness consequence relating that q-deleted row to the actual
shell.  But it is the first datum that makes a two-circle/bisector theorem
applicable rather than merely naming an arbitrary survivor support.

For an immediate contradiction, the stronger missing bridge must identify the
actual shell at `fresh` with `K` (equivalently, make its actual blocker `b`);
then fresh's source membership transports to `fresh in K`, directly
contradicting `fresh_not_mem_reverseShell`.  The packet itself explicitly
rules that equality out through
`freshPacket.actual_blocker_ne_center₂`, so this is a useful exclusion, not a
route to prove.

## Finding

No existing shared-base/two-circle/bisector/non-bisection theorem closes the
fresh constructor from its stated data.  The constructor is intentionally a
common-deletion renewal: its negative shell membership produces survival at
the reverse blocker, while leaving the new packet's supports unlinked to the
retained/deleted shared base.  The first real positive target is an overlap or
row-identification bridge for `freshPacket.row₂`; absent that, promoting a
two-circle or bisector wrapper would be unsupported.
