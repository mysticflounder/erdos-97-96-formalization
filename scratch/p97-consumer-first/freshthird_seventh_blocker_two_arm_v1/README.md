# FreshThird seventh-blocker two-arm exact-17 diagnostic v1

This directory contains one bounded, source-mapped incidence preflight for the
two new packets in `TwoSourceFirstFiberCollision.lean`:

1. `equal_center`: the escaping selected row `E7` and the actual-blocker row
   `AB7` have equal supports after the center equality is supplied;
2. `first_apex`: `z,w ∈ E7`, `z ≠ w`, opposite-deletion selected-four rows
   `Kz,Kw` omit the opposite point, and their actual blocker centers differ.

The carrier is the exact-17 finite universe `{p0,…,p16}`.  Rows are Boolean
support predicates with exact cardinality four.  Center labels are symbolic
integers: no metric, radius, cyclic order, or Euclidean realizability is
claimed.  The encoder does not import or reuse a frozen exact-17 survivor.

`run_diagnostic.py` emits four SMT-LIB cores (two positive packets and two
malformed controls), runs each through Z3 and cvc5, and independently reads
back every model. `validate_artifacts.py` checks the source manifest, clause
map, exact-17 shape, and result/readback records.  This is a bounded/admitted
single wave; SAT is abstraction consistency and UNSAT is only a malformed
finite schema result.
