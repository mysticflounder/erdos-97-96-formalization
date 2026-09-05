# B1 corrected closure consult — working checkpoint

Consult: `01M1PQD26PDSCAYBB6F5AKWEXH`

## Current route classification

The audited clean global branches are exhausted at their present interfaces:

- canonical endpoint residual: no source-clean route to a live same-arc/signed-area terminal; the residual supplies negative incidence and local order, not the positive cross-row hits or global placement required by existing sinks;
- card-six `B1EscapeSourceContext`: no source-clean `False`; it has no boundary/arc bit, no named `C.u/C.v` identity, and no full-geometric residual tied to the independently selected wave witness;
- card-five `B1EscapeSourceContext`: the exact-five dispatcher is only a producer and leaves singleton-minimal-core, placement, and second-deletion residuals whose available terminals are absent or sorry-backed;
- different existing consumers (ThreeCenterCommonDeletion, source-return, faithful-carrier, ordinal/Kalmanson) all first require additional named incidences, boundary order, or specialized provenance.

The proposed unconditional card-six second-deletion cross residual from another consult is invalid as stated: `exactFour_twoDeletion_crossOmission` already requires deleted-blocker inequality, so deriving that inequality from the returned omission is circular. The honest split is blocker equality versus blocker inequality plus directed omission.

## Main recommendation under audit

Choose route A, but strengthen it: replace the lossy `survivalSquare` projection with a source-canonical actual-blocker refinement.

For each square arm, retain the named erased carrier `X`, the actual selected support at the deleted source `q`, the proof that `X` is outside that support, and the two survival statements. Instead of choosing an arbitrary minimality witness `p`, take the canonical failure center

```lean
p := (lateFirstApexSystem R).centerAt X.1 X.2.
```

The critical-shell system should provide:

- `IsUniqueFourCenter D.A p`;
- `X.1` in the unique four-class / selected support at `p`;
- failure of K4 at `p` after deleting `X`;
- `p ≠ X`.

The square survival at `bq := centerAt q` should imply `p ≠ bq`; second-apex deletion robustness should imply `p ≠ S.oppApex2`. Split only

```text
p = bu | p = bv | p = br | p fresh from {apex,bq,bu,bv,br}.
```

In a known-center arm, equality of actual blockers transports `X` into the corresponding canonical selected support. In the fresh arm, retain the complete selected four-shell at the new actual blocker. This is strictly stronger than the current arbitrary-`p` localization and avoids the unsupported finite-capture claim.

## Intended theorem shape

The exact input binders should be copied verbatim from
`exactFour_fourSurvivingCenters_survivalSquare_split`.
The replacement result should be an outcome with:

1. the three existing blocker-coincidence arms; or
2. a square witness carrying a named `X ∈ {apex,bu,bv,br}`, `erase q` survival at `X`, `erase X` survival at `bq`, and `X ∉ selectedAt q`; together with one of
   - `centerAt X = bu` and `X ∈ selectedAt u`;
   - `centerAt X = bv` and `X ∈ selectedAt v`;
   - `centerAt X = br` and `X ∈ selectedAt r`;
   - `centerAt X` distinct from `apex,bq,bu,bv,br`, retaining its selected shell.

Provisional name:

```lean
exactFour_fourSurvivingCenters_actualBlockerRefinement
```

Recommended placement: immediately after the existing clean split in
`ATail/FrontierLiveClosure/TwoDeletionCollision.lean`, before the two open exact-four consumers. If import hygiene warrants extraction, move only the source-neutral split and outcome types to a lower module imported by `TwoDeletionCollision`; do not import `Rigid221Closure` or `Coordinator`.

## Proof spine expected to be existing/source-clean

- `exactFour_fourSurvivingCenters_survivalSquare_split` or its internal `four_mem_card_four_split` proof before projection;
- `CriticalShellSystem.isUniqueFourCenter_centerAt` / `ATailMinimalUniqueFourCover.isUniqueFourCenter_centerAt`;
- `source_mem_uniqueFourClass_centerAt` and selected-shell own-source membership;
- `CriticalShellSystem.no_qfree_at`;
- `FullyDeletionRobustAt.blockerVertex_ne` at the second apex;
- `actual_blocker_ne_of_deletion_survives` for `centerAt X ≠ bq`;
- `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` for known-center support transport.

The exact signatures/FQNs and square-arm retained facts are being independently transcribed in channel request `#12528`; source-canonical simplification is requested in `#12535`.

## First genuinely new mathematics

The refinement itself should be bookkeeping/case analysis from current hypotheses. The new mathematical boundary is a terminal for the resulting known-row-hit/fresh-actual-blocker outcome. In particular:

- known-center branch: combine the newly retained positive incidence `X ∈ K_u/K_v/K_r` with the two common-deletion packets and square survival to force a checked affine, bisector, or ordered-cap contradiction;
- fresh branch: convert the new exact selected shell at a sixth distinct center into a source-faithful five/six-center metric-core or faithful-carrier obstruction.

No current theorem performs either conversion.

## Smallest decisive test

The first unresolved named cell is

```text
X = S.oppApex2,
centerAt X = bu,
S.oppApex2 ∈ first.uPacket.B₁,
S.oppApex2 ∉ selectedAt q,
erase q survives at S.oppApex2,
erase S.oppApex2 survives at bq.
```

The positive membership is essential; the previously proposed nonmembership is the opposite of what the unique-four obstruction requires. Enumerate the source-allowed support aliases for the three exact rows centered at `S.oppApex2`, `bu`, and `bq`, then test strict-convex Euclidean feasibility. Exact UNSAT would expose the missing known-center terminal; exact SAT would prove that the branch needs genuinely global minimality/cap data and prioritize the fresh-center/faithful-carrier route.

## Lane to retire

Retire the present direct `survivalSquare → False` / arbitrary-minimality-center finite-capture lane at its current projected signature. It has discarded the only row/support provenance capable of distinguishing the named-center cases. The winning-live-pair/CardArc and canonical-endpoint lanes are also exhausted as direct consumers, but the primary replacement is the provenance-preserving actual-blocker refinement above.
