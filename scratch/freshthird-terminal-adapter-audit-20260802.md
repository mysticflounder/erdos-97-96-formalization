# FreshThird terminal-adapter audit (2026-08-02)

## Verdict

Neither existing theorem is an axiom-clean, source-faithful consumer of the
normalized residual at `FrontierLiveClosure.lean:9808-9815`.
`false_of_twoCapSources_mutualCrossMembership_distinctBlockers` is a usable
terminal only on the older first-fiber/radius split.  The private
`false_of_twoCapSources_of_blockers_off_firstCap` has the same mutual-source
gap and additionally needs off-cap blocker centers.  A direct adapter would
need new load-bearing producers, not a wrapper around the open residual
theorem.

## Exact hypotheses versus FreshThird data

`false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
(`:12004-12018`) requires, for `source source'`:

* `source.1 ≠ source'.1`;
* one `commonRadius` with both points in
  `SelectedClass D.A S.oppApex1 commonRadius`;
* `TwoCapSourcesMutualCrossMembership H source source'`, i.e. each source
  point lies in the other's selected exact-four support; and
* distinct chosen blockers (`H.blockerVertex source ≠ H.blockerVertex source'`).

The normalized packet has `C.firstSource`, `C.secondSource`, and
`C.sources_ne`, but `CapSourceThirdCanonicalRowWitness` only supplies cap
interior membership, exclusion of the four named collision sources, center
inequalities, and each source's own row/support.  It supplies neither a
common first-apex radius nor cross-membership between the two `C` rows.  The
residual's `firstNonHit`/`secondNonHit` arms concern cross-membership with
`Q.source₁,Q.source₂`; they yield same-blocker/support equality or one-source
deletion survival.  Its `equalCrossRowCenters` arm has both such hits but
*equal* `C` centers, the opposite of distinct blockers.  `Q.blockers_eq`
likewise gives equal blockers for `Q`, not distinct blockers for `C`.

`false_of_twoCapSources_of_blockers_off_firstCap`
(`:11739-11870`, private) requires the same source distinctness, cap-interior
membership, mutual cross-membership, and distinct blockers, plus
`H.centerAt source ... ∉ S.capByIndex S.oppIndex1` for each blocker center.
The cap-eight witness gives the source points in the cap, but no off-cap fact
for their blocker centers; its `hsourceOutside` excludes only the named
collision sources.  FreshThird's interactions do not provide the required
mutual source incidences either.

## Existing source-faithful producers (and their boundary)

* `twoCapSourceThirdCanonicalRowSurface_of_capEight` (around `:7980-8015`)
  is the checked producer for `C`; it proves exactly the witness fields listed
  above and no radius/mutual/off-cap fields.
* `mutualCrossMembership_or_oneSidedDeletionSurvival` (`:8705-8730`) is an
  exhaustive producer for a *given pair* of rows, but only yields mutual
  membership or a one-sided deletion.  It does not create the common-radius
  hypotheses.  The old `false_of_twoCapSources_firstFiber` (`:12229-12293`)
  supplies those radii externally and then calls the mutual-blocker terminal.
* `exists_two_firstFiberCapSourceWitness` (`:8200-8258`) produces two
  cap-source witnesses, but again no common first-apex radius.  The route
  `freshThirdBlockerFiber_of_mutualCrossMembership` (`:8738+`) goes in the
  opposite direction (equal blockers + mutual incidences produce a `Q` fiber);
  it cannot recover those incidences from a normalized `Q` residual.
* `S.capByIndex_cgn4g_capData D.convex S.oppIndex1`, used internally by the
  off-cap theorem, supplies the ordered-cap object and boundary enumeration,
  but no source-faithful producer establishes that the two `C` blocker centers
  are outside that cap.

Therefore the first missing bridge is a checked theorem deriving either
common-radius plus `C` mutual cross-membership (and distinct blockers), or a
different metric terminal consuming the actual FreshThird hit/non-hit data.
No such producer is present in the current imported source; using either
candidate in `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
would fail hypotheses or re-enter the open `sorry` theorem.
