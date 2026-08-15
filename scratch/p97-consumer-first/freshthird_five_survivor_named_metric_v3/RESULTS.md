# Results

Classification: **DUAL_UNSAT_FROZEN_MOTIF_ONLY**.

- Exact scope: one frozen exact-17 incidence proposal for tag `first_qsource_radius`.
- Incidence: z3 `sat`, cvc5 `sat`; both independent incidence validators passed.
- Named metric: z3 `unsat`, cvc5 `unsat`.
- Exact Fraction replay: `not applicable`.
- Minimized source atom(s): `['first_cap_on_arc_opposite__point_1']`.
- Frozen-role witness: `{'carrier_slot': 1, 'roles_at_slot': ['C3', 'Q1'], 'incidence_marks_first_cap': False, 'source_reason': 'the frozen proposal aliases an outside-Q role with a closed-cap endpoint apex, making the strict nonmembership atom identically false'}`.
- Complete `FiveRowCircleIntersectionOrderCore` map: **absent**, so no order-core query was emitted.

This result classifies only the emitted frozen motif.  It is not coverage of
the other seven tags, not a P97 counterexample, not a universal contradiction,
and not Lean closure.  See `results.json` for timings, hashes, omissions, and
any minimized source-labeled core.
