# FreshThird five-survivor retained-row query (diagnostic)

This is a bounded retained-row weakening for the two aligned-mutual
deletion arms of `FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual`.
It incorporates the source theorem
`fiveSurvivor_firstApexRow_eq_retained_and_deleted_not_mem` by fixing the
q-deleted `B₂` row to either retained full class, while asserting that the
deleted point is absent from that row.

The query is deliberately diagnostic.  In particular, it does not model the
five row centers or their source-permitted aliases: the live
`FiveSurvivorExactRowsBoundary` does not assert that those centers are pairwise
distinct.  It also has no geometric realization, cyclic order, Kalmanson, or
general-`n` lift, so SAT/UNSAT here is not a production closure result.

Run `python3 run_query.py` (the script uses only the standard library and the
installed `z3`/`cvc5` binaries).  It runs one wave, serially, with one solver
process at a time.
