# FreshThird vs. exact-four/two-radius terminal audit (2026-08-03)

## Declarations audited

* `FrontierLiveClosure.lean:11324`,
  `TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
  has inputs `C : TwoCapSourceThirdCanonicalRowSurface P Pρ`,
  `Q : FreshThirdBlockerFiber P Pρ`, and
  `hremaining : FreshThirdNormalizedResidualRemainingCase P Pρ C Q`.
  The surrounding section also includes the two exact-four collision rows,
  radius inequality/cardinality, interior-set equalities, global residual `T`,
  disjointness/blocker inequality, and both localized omission cycles.

* `FrontierLiveClosure.lean:16526`,
  `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`
  has the strictly smaller interface
  ```text
  F R P hfrontierFour ρ hρpos hρne hρfour hfrontierInteriorTwo B L N T : False
  ```
  where `hfrontierInteriorTwo` is
  `(SelectedClass ... radius ∩ S.capInteriorByIndex S.oppIndex1).card = 2`.
  It constructs its own second-radius pair `u,v`, second collision row,
  deletion cycles, and low-hit contradiction.  It does **not** consume `Pρ`,
  `hρInteriorEq`, `C`, `Q`, or `hremaining`.

## Applicability from the FreshThird context

The exact terminal's required data are already in the target context except
for three small adapter facts:

1. `hfrontierInteriorTwo` can be obtained from the target's set equality
   `hfrontierInteriorEq` and `P.sources_ne` (rewrite the intersection to
   `{P.source₁, P.source₂}` and simplify its card to `2`).
2. The target stores `hρfour` as an equality (`card = 4`), while the exact
   terminal asks for `4 ≤ card`; `omega`/`simpa` supplies this weakening.
3. The target has no explicit `hρpos`.  A generic adapter can derive it from
   `Pρ.source₁_mem_radius` and `Pρ.source₁_mem_capInterior`: strict-cap
   interior excludes `S.oppositeVertexByIndex S.oppIndex1`, and the local
   `hcenter : S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1` then gives
   `Pρ.source₁ ≠ S.oppApex1`; `dist_pos` plus the selected-class distance
   equality yields `0 < ρ`.

No field of `FreshThirdBlockerFiber` supplies either fact; in particular it
contains only source/blocker freshness and reciprocal shell incidence, with no
radius membership or cap-interior membership.  Those facts come from the
already-present retained row `Pρ`, not from `Q` or the residual-case witness.

## Adapter/producer status

There is no existing FreshThird-specific adapter or producer that calls the
exact terminal.  A prospective adapter would simply discard `C`, `Q`, and
`hremaining`, derive the two facts above, and invoke the generic terminal with
the section's `B,L,N,T`.  However, the generic terminal is declared *after*
the FreshThird target (line 16526 vs. 11324), so it cannot be called there
without moving/extracting a helper or otherwise changing declaration order.
Such a move would also make the FreshThird residual branch logically vacuous,
which should be an explicit design decision rather than an inferred closure.

## Verification boundary

The exact terminal and its downstream producer bodies contain no visible
`sorry` in source.  This is only source-level evidence: the current imported
`FrontierLiveClosure` OLean is stale (a scratch `#check` sees the target but
reports the later exact-terminal names as unknown), and no fresh build or
transitive axiom audit was run.  Therefore this is a **candidate generic
adapter**, not a kernel-verified closure or a safe promoted producer.
