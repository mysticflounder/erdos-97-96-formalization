# Parameterized FreshThird rows-stage replay

Classification: bounded exact-17 diagnostic; SAT is not a P97 counterexample, and UNKNOWN is not UNSAT.

Stages:
- geometry: z3=sat, cvc5=timeout, validation=pass; pinned=sat/sat
- grid_members: z3=unknown:timeout, cvc5=unknown, validation=not applicable; pinned=sat/sat
- grid_exact: z3=unknown:timeout, cvc5=unknown, validation=not applicable; pinned=sat/sat
- rows: z3=unknown:timeout, cvc5=unknown, validation=not applicable; pinned=unsat/unsat
- source_slices: z3=unknown:timeout, cvc5=unknown, validation=not applicable; pinned=unsat/unsat
- kalmanson: z3=unknown:timeout, cvc5=unknown, validation=not applicable; pinned=unsat/unsat

First solver non-SAT/unknown stage: grid_members
First source-faithful finite obstruction(s): [{'orientation': 'direct', 'radial_branch': 0}]
Malformed geometry control: z3=unsat, cvc5=unsat

The pinned exact witness is only a diagnostic seed; a pinned failure does not classify the unpinned stage.
Rows, singleton slices, and Kalmanson are source-faithful finite stages; no general-n lift or universal producer is encoded.
Row cut: direct-0 has three (in fact four) common row points and distinct blocker centers, so its exact rows are impossible under strict boundary geometry; the other frozen arms have no duplicate-three row cut.
