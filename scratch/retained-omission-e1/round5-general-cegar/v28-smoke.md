# v28 rich-support Kalmanson CEGAR

- Terminal status: `max_iterations_fail_closed`
- Learned deletion-minimal cores: 1
- Cores matching existing `KalmansonThreeEqualitySchemas`: 0/1
- Terminal paired fresh master replay: `paired_replay_fail_closed`
- Master: raw `exact_rich_profiles` + raw `cyclic_alternation_cut` + `rich_2_1_4=true` + `rich_2_1_12=true`.
- Oracle: all 2,730 raw strict Kalmanson inequalities plus pairwise same-rich-class distance equalities.
- Trust boundary: external exact-rational Z3 only; no proof certificate and no Lean/kernel ingress.

The exploratory raw AST, master, and Kalmanson oracle are built once and reused. Each admitted clause was replayed UNSAT in two fresh Z3 contexts, with every single-atom deletion replayed SAT in both. Final aggregate UNSAT requires two fresh raw-gzip parses. Schema matches are combinatorial cyclic-dihedral matches only; they do not supply the missing Lean order/antecedent adapter.
