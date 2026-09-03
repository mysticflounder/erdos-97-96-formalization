# Profile-1697 B--O source QF_NRA implementation plan

Date: 2026-09-03

Status: implementation checkpoint; target computation not launched.

## Goal

Build two source-ledger QF_NRA queries from the current authenticated adaptive
orders using the B--O gauge and the exact five-point substitution recorded in
the v1 specification. The computation is diagnostic. It cannot close a live
Lean obligation without a separate live-source alias-completeness bridge and
promotion evidence.

## Required gates

1. Replay the completed adaptive run without transport and bind its immutable
   manifest, launch, terminal, summary, order, and origin records.
2. Reconstruct the profile role map and four source rows from current producer
   bytes.
3. Generate and retain the complete 165-area, 13-row, radius-disequality, and
   source-strict ledgers after exact symbolic substitution.
4. Require the three sign-check areas to be `r`, require the relevant row
   equations to vanish modulo `4*r^2-3`, and require `(S,O,Q)` to reduce to
   zero while preserving its strict assertion.
5. Run rational SAT and UNSAT controls before interpreting targets.
6. Use PIQD as the sole solver transport. Treat unsupported algebraic readback,
   UNKNOWN, disagreement, or custody failure as inconclusive.
7. On rational SAT, expand all eleven coordinates and pass the original exact
   source checker after an orientation-preserving rational gauge transform.
8. Reconstruct every artifact and terminal record on resume without transport.

## Reuse preflight

At revision `c07dbadc08332e1e52a4857e5365611029a9f814`, the bounded Lean corpus
search for a `B != O` source theorem returned no candidate. The immediate
consumer is this gauge; the first missing antecedent is the live-source-to-
profile-1697 alias completeness bridge. No further Lean search is planned for
this wave unless a new candidate appears or the search key materially changes.

## Expected interpretation

The exact substitution makes the ordered fixed triple `(S,O,Q)` collinear, so
each target ledger contains a retained strict assertion with zero left side.
That is an encoding-level structural check, not a promoted contradiction.
Terminal UNSAT remains scoped to the two authenticated formulas. No run result
is claimed by this plan.
