# FirstNonHit full-carrier solver-ingress preflight

Date: 2026-08-11  
Anchor: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`

## Verdict

Do not launch a solver wave from the current ingress.  There is no materially
new cardinality-independent finite quotient of the **full** carrier-wide
K4/blocker/minimality/cap/order hypotheses in the current source or scratch
packages.  The existing named-fan encoder is a useful abstraction regression
test, but it deliberately has anonymous rows and no transport from those rows
to the canonical Q row; adding another local Boolean wave would therefore
either omit a universal premise or impose an artificial finite carrier.

The smallest source theorem that makes a computation unnecessary for this
anchor (and gives a valid computation landing if discovered by mining) is the
three-blocked-deletions producer below.  It is exactly the existing clean
consumer interface, expressed before the final support-membership step.

## Source-origin / guard table

| Intended solver fact | Source origin | Guard required for a sound finite encoding | Current status |
|---|---|---|---|
| Carrier points and source witnesses are in `D.A` | `CounterexampleData.A`; `CriticalShellSystem.CarrierVertex D.A` | Every represented role must be an actual subtype of `D.A`; anonymous roles need an explicit extraction/coverage theorem | Named roles only; no anonymous-row lift |
| K4 holds at every relevant carrier center | `D.K4`; `erase_survives_or_criticalSelectedFourClass_at` | Encode the universal quantifier over every carrier center and every deletion, or prove a bounded-core theorem first | Named Q/blocker centers only |
| A selected row has exact four-point support | `CriticalSelectedFourClass`; `H.selectedAt`; `source_mem_critical_support_of_no_qfree` | Preserve center, source/deletion, radius, support inclusion in `D.A`, and `support.card = 4` | Present for named rows; not for arbitrary retained rows |
| Actual blocker identity and center distinction | `H.centerAt`, blocker fields in the frontier packets, `actual_blocker_ne_of_deletion_survives` | The encoded blocker must be the actual blocker attached to the source, not an unconstrained row label; retain all distinctness guards | Partial: Q/blocker fiber only |
| Deletion blocking/minimality | `HasNEquidistantPointsAt 4 (D.A.erase w) center`; `cross_deletion_survives_iff_not_mem_selected_support` | For every represented `w`, preserve the exact erase predicate; no finite-domain truncation may discard an unrepresented `w` | Local named deletions only |
| Q blocker fiber and mutual shell membership | `FreshThirdBlockerFiber` | Bind the two source vertices, same blocker, freshness from all four P/Pρ endpoints, and both shell-membership facts | Available for Q; does not link anonymous rows to Q |
| Retained exact-four two-radius grid | `freshThird_retainedExactFourTwoRadiusAdjacentCapGrid`; `RetainedInteriorBlockerCollision` | Identify the retained rows' points and centers and prove their relation to the target Q support before using them as Q endpoints | Grid is source-clean, but endpoint/Q identity is absent |
| Cap membership and cap cardinality | `SurplusCapPacket.capByIndex`, `capInteriorByIndex`, `cap_card_ge_eight` | Encode the full cap partition, membership, interior/boundary distinction, and cardinality assumptions; Boolean cap labels alone are insufficient | Partial named cap labels |
| Cyclic boundary order | `BoundaryIndexing`; order/Kalmanson consumers such as `KalmansonRadiusOrderReversal` | Supply a complete order on all relevant carrier points plus the theorem connecting encoded order to `H.selectedAt` supports | No full order packet in the current ingress |
| Euclidean metric constraints | `dist`, `support_eq_radius`, selected-four radius facts, two-circle/cardinality consumers | Either retain exact metric witnesses and all required equalities or import a source theorem that eliminates them; incidence labels alone do not imply them | Not represented by named-fan encoder |
| Universal-to-finite promotion | No current source declaration | A Lean extraction theorem must map every live counterexample to the finite representation, and a coverage/lift theorem must map solver UNSAT back to the universal leaf | Missing |

## Exact landing contract

The preferred producer is:

```lean
∃ source : CriticalShellSystem.CarrierVertex D.A,
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
  ∃ W : Finset (EuclideanSpace ℝ (Fin 2)),
    W ⊆
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
    3 ≤ W.card ∧
    ∀ w ∈ W,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2)
```

This is consumed directly by
`exists_selectedRow_overlap_card_ge_three_of_blocked_deletions` in
`TwoSourceFreshThirdResidual.lean`; the clean lemma
`source_mem_critical_support_of_no_qfree` puts each point of `W` in the new
selected support, and the existing finite-cardinality argument supplies the
three-point intersection.  Thus the producer has no hidden exact-`n` premise.

An equally valid landing is a source-clean direct contradiction under the full
current ingress.  A solver UNSAT result is not a landing by itself: it must be
replayed in Lean and accompanied by the extraction and universal-lift theorem
for every premise in the table above.  Dual Z3/cvc5 agreement, malformed
controls, independent readback, and exact certificates are necessary replay
checks but do not replace that lift.

## Smallest missing theorem / next action

The current named-row results already prove the negative classification
`freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two` (and its interaction
analogue): no named C source supplies the required three-point Q overlap.
The existing carrier-wide K4 and escape producers do not transport three Q-row
endpoints to one distinct center.  The next source-level target is therefore
one of:

1. the three-blocked-deletions theorem above;
2. a row-relocation theorem that produces the same three Q memberships; or
3. a direct cap-order/metric contradiction consuming the full packet.

Absent one of these, the only honest finite alternatives are (a) an explicit
exact-cardinality model with every carrier point and all K4/deletion clauses,
which proves only that fixed `n`, or (b) a proved bounded-core theorem.  Neither
is currently available.  No solver was run in this preflight.
