# Executive summary

**Primary verdict:** `CROSS_CARDINALITY_EVIDENCE_INSUFFICIENT`
**Secondary verdicts:** `ENCODING_TOO_WEAK`, `ONLY_RELAXED_SURVIVORS_FOUND`

## Decision

The existing Rigid221 CEGAR corpus does **not** materially reduce the live
`|A| >= 18` risk. There is no source-faithful large-cardinality run, survivor,
UNSAT certificate, role-preserving extension family, or bounded-extraction
rule. Exact-17 is definitionally fixed to `Fin 17`; exact-12/A5 results are
bounded selector cells; n=16 and other SAT objects are weaker incidence/order
shadows.

No full-packet survivor was found. The data therefore does not refute the Lean
terminal. It does show that the current unconditional exact-17 base-CNF-UNSAT
subgoal is too strong: two replayed decoded Boolean row assignments survive but
explicitly record `source_realizable=false`.

## Four required answers

1. **Does the data materially reduce the `|A| >= 18` risk?** No. It clarifies
   the missing mechanism but supplies neither a scalable invariant nor a
   bounded obstruction.
2. **Strongest source-faithful conclusion now?** A verified 472-clause UNSAT
   core closes one fixed exact-12/A5 selector cell, and several other finite
   cells have kernel-checked pure-RUP terminals. Exact-17 has many checked
   per-assignment geometric certificates. None lifts across cardinality or
   covers every selector.
3. **Exact theorem to attack next?** The existing open
   `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`.
   Its first milestone should be a residual-neutral extraction of the existing
   large-cardinality three-profile source-pair producer, followed by an adapter
   from the live `BlockerV` packet. Only then should the crossed branches split
   on the five-incidence conjunction and its complement; the bi-survival branch
   instead needs a common-deletion-rectangle consumer.
4. **What new solver work is necessary?** None immediately. First specify the
   three resulting packet families against the actual Lean context. If
   falsification is then useful, build separate source-audited `n=18` cells for
   the bi-survival rectangle and each distinct crossed missing-incidence packet,
   carrying actual source and blocker provenance, row identity,
   cap/order/radius data, prescribed deletion survival, and the relevant
   minimality/K4 assumptions. Do not launch another broad exact-17 pair-cut
   wave first.

## Evidence snapshot

- 28 inventoried solver/CEGAR waves or validated-but-unrun lineage endpoints.
- 255 identity-canonical retained records: 251 exact-17 row/order shadows, two
  decoded exact-17 Boolean row assignments, one exact-12 blocker-map shadow,
  and one n=16 incidence shadow.
- 8,280 order-0 exact-17 Boolean models in the aggregate audit: 8,259
  strict-linear rejections and 21 metric unknowns, but no Boolean closure.
- Six proposed cross-cardinality/containment edges audited; zero preserve the
  full packet.
- No small-coefficient potential separates the linear-UNSAT-only and
  linear-status-unknown EX17 canonical populations.
- No empirical bound `N` for a source-faithful obstruction has a nonempty tested
  large-residual population.

The full source boundary, predicate implications, model cards, refinement
history, theorem candidates, and reproducibility checks are in `REPORT.md` and
the adjacent machine-readable files.
