# Fresh-third residual probe (2026-08-03)

Target: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11324`,
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.
The relevant declarations are `FreshThirdCrossRowHit` (line 10441),
`FreshThirdCapSourceNonHit` (line 10465), and
`FreshThirdNormalizedResidualRemainingCase` (line 11280).

## Constructor audit

`FreshThirdNormalizedResidualRemainingCase.firstNonHit` carries
`data : FreshThirdCapSourceNonHit C.firstSource Q` and an arbitrary
`FreshThirdCapSourceInteraction C.secondSource Q` (the second arm is
symmetric).  The `FreshThirdCapSourceNonHit` constructors are:

* `sameBlocker center_eq support_eq`, where
  `center_eq : center(C.firstSource) = center(Q.source₁)` and the two
  selected-shell supports are equal;
* `sourceRowOmission deleted ... deleted_not_mem deletion_survives`, which
  omits one of `Q.source₁,Q.source₂` from the cap-source row and records the
  corresponding four-point deletion survival.

The scratch Lean probe
`lean/scratch/freshthird_sameblocker_probe.lean` builds an explicit lemma
that either constructor implies only
`¬ FreshThirdCrossRowHit source Q`:

* `sameBlocker` contradicts a hit solely through
  `h.1 : center(source) ≠ center(Q.source₁)` versus `center_eq`;
* `sourceRowOmission` contradicts a hit only if the hit's corresponding
  membership (`h.2.1` or `h.2.2`) is supplied.

The probe compiles (`cd lean && lake env lean scratch/freshthird_sameblocker_probe.lean`;
only module-doc/unused-variable warnings).

## Why this does not close the residual

Same-blocker support equality plus `Q.source₂ ∈ Q.source₁`'s shell merely puts
`Q.source₂` in the cap-source shell as well.  Equal shell centers and two common
support points are geometrically compatible; no theorem in the current spine
turns this into `False`.  In particular:

* `false_of_two_freshThirdCrossRowHits_distinctCenters` requires **both** strict
  cross-row hits and a center inequality;
* `false_of_freshThird_sameCapCrossRowAlignment` requires a same-cap alignment
  packet, including the strict center inequality and both memberships;
* the only theorem whose interface consumes
  `FreshThirdNormalizedResidualRemainingCase` is the target itself (still
  `sorry`).

Thus `sameBlocker` gives exactly the negated hit that the old erased `hnot`
guard used; it is not a contradiction.  `sourceRowOmission` likewise gives a
positive deletion-survival branch, not `False`, unless an independent hit is
reintroduced.  A source-clean closure requires a stronger producer/global
metric argument (or restoration of an explicit negative/hit hypothesis), not
just these constructor data.
