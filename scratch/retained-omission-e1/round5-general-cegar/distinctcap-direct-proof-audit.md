# Equal-center distinct-cap × distinct-cap: direct-proof audit

Date: 2026-08-06.  Scope: the `equalCrossRowCenters` constructor of
`TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

## What the two existing packets prove

At `TwoSourceFreshThirdResidual.lean:584-656`, destructing the two
`distinctBlockersDifferentCaps` interactions and applying
`freshThird_commonRadius_distinctCaps_dual_packet` yields only

```text
sourceCap = sourceCap' = S.oppIndex1,
freshCap = freshCap' != S.oppIndex1,
Q.source1,Q.source2 ∉ S.capByIndex S.oppIndex1.
```

The first interaction supplies the source/fresh selected rows and their two
shared endpoints.  `freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket`
(`TwoSourceCanonicalSurface.lean:933`) turns those rows into one boundary
indexing and the alternating `btw` relation.  The second interaction is
transported by equal centers/cap interiors; it does not supply a distinct
centered row.  In particular, the dual packet has no theorem identifying a
new `SelectedFourClass` at a different boundary index.

`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`
(`TwoSourceFreshThirdFiber.lean:2826`) adds a dynamic `qOutside/qBetween`
order and a surviving selected row, upgraded only to
`EndpointDeletionPairCapSplitSurvivingRow` (`<= 2` points in one cap and
`>= 2` outside).  This is cardinality/deletion information, not positive
membership of two named points in a second row.

## Smallest missing producer (exact consumer shape)

The first source-level theorem that would close this constructor should be
declared in `TwoSourceFreshThirdFiber.lean`, after the survivor-row theorem
(or in `TwoSourceFreshThirdResidual.lean` immediately before the target if it
must consume residual-only parameters):

```lean
theorem freshThird_canonicalDifferentCap_sharedLatePairProducer
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne : ...)
    (source₁_mem source₂_mem : ...)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem freshCenter_mem : ...)
    (hpacket : sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
      Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
      Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (ia ib ic id : Fin B.n)
      (ARow : SelectedFourClass D.A (B.boundary ia))
      (BRow : SelectedFourClass D.A (B.boundary ib)),
      ia < ib ∧ ib < ic ∧ ic < id ∧
      B.boundary ic ∈ ARow.support ∧
      B.boundary id ∈ ARow.support ∧
      B.boundary ic ∈ BRow.support ∧
      B.boundary id ∈ BRow.support := by
  rcases freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, hcyclic, hcap₁, hcap₂, hq₁off, hq₂off, hsourceMem, hfreshMem⟩
  rcases freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B', qOutside, qBetween, hnames, hsurvivor⟩
  -- Transport B/B' and the endpoint order, then prove positive incidence:
  -- extract a second row and two shared late witnesses.  This is the new
  -- source-level mathematics; no current theorem supplies it.
  sorry
```

There is one additional adapter obligation hidden by the sketch: the two
existential packet theorems may return different boundary indexings (`B` and
`B'`).  A production proof must formulate the producer on one explicit
boundary (derive the cyclic separation there with
`freshThird_sharedPairCyclicSeparation_atBoundary`) or prove a boundary
transport lemma; it may not assume `B = B'` after two independent `rcases`.

The proposition deliberately returns the rows, indices, and all four
memberships required by the existing consumer; no accidental schema labels
or fixed endpoint names are admissible.

## Wiring proof skeleton

Replace the recursive call at `TwoSourceFreshThirdResidual.lean:637-656` by:

```lean
rcases freshThird_canonicalDifferentCap_sharedLatePairProducer
  C.surface Q centers_ne source₁_mem source₂_mem sourceCap freshCap
  sourceCenter_mem freshCenter_mem
  ⟨hsourceCanonical, hfreshNe, hq1Off, hq2Off⟩ with
  ⟨B, ia, ib, ic, id, ARow, BRow, hiab, hibc, hicd,
    hicA, hidA, hicB, hidB⟩
exact CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair
  D.convex B.boundary_injective B.boundary_image B.boundary_ccw
  hiab hibc hicd ARow BRow hicA hidA hicB hidB
```

`false_of_two_selected_rows_shared_late_pair` is exactly the strict
Kalmanson consumer (`CapCrossingKalmanson.lean:427-454`).  The cyclic packet
alone cannot feed it: its endpoints alternate with the two known centers, so
there is no increasing quadruple with both shared endpoints late.  The
survivor cap split likewise does not imply either missing membership.

## Verdict

The second interaction is **not** a genuinely distinct selected row, and the
branch cannot close via Kalmanson directly from the two existing packets.  The
producer above is the smallest required bridge, but it is **not currently
derivable** from the present hypotheses: the unresolved obligation is a
universal positive-incidence theorem constructing `BRow` and the two shared
late witnesses.  Until that theorem is proved, this branch remains open; the
existing packets are producers only, not closure.
