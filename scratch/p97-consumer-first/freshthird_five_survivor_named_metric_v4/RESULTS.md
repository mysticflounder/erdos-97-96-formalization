# Results

All eight exact-17 tags have a dual-SAT, independently validated structural survivor under the v4 endpoint/outside cuts.

Metric classifications: `{"DUAL_UNSAT_MINIMIZED_FROZEN_MOTIF_ONLY": 2, "INCONCLUSIVE": 22}`.

Two exact-off-support frozen motifs produced fast cvc5 UNSAT results. Source-labeled cvc5 group and atom cores were extracted, deletion-minimized with Z3, and the minimized subsets replayed UNSAT in both Z3 and cvc5. The other 22 metric-stage queries remain bounded-inconclusive.

These two results reject only the two frozen incidence motifs, not their tags. No exhaustive survivor coverage was attempted.

`FiveRowCircleIntersectionOrderCore` was not emitted because its complete source-entitled premise map is absent.

This remains finite exact-17 producer discovery: no P97 counterexample, universal contradiction, or Lean closure follows.
