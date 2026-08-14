# Results

## Corrected verdict

**No source-clean producer was found in the corrected model.** The finite gate
is exhaustive for the specified six-point alias abstraction up to cap-order
reversal.  The optimized corrected run uses the complete pair-radius rational
direction chart justified in `INGRESS-CONTRACT.md`, with every increasing
triple CCW and no t-order/apex-order assumption; it does not assume
cocircularity.  Z3 returned SAT for 12 aliases, and all 12 have independent
exact-rational model readback passing; cvc5 timed out on those 12.  The other
186 aliases returned `UNKNOWN:timeout` in both solvers at the bounded
five-second query limit.  No alias returned UNSAT, so this wave establishes no
geometric contradiction.

The known-SAT general-planar geometry control is SAT in both solvers and its
Z3 rational readback passes.  The malformed orientation control is UNSAT in
both solvers.

## Retraction

The earlier unit-circle/cocircular metric encoding was not source-entitled.
Its UNSAT counts are retracted and must not be used as evidence.  The current
artifacts and hashes are from this corrected general-planar rerun.

## Scope boundary

The 12 SAT aliases are bounded geometric witnesses in the encoded six-point
planar model, not countermodels to the full theorem.  They do not close the
universal FirstNonHit leaf:
the omitted ambient rows, carrier points, and general-cardinality lift remain
material.  The 198 unresolved aliases must not be classified as UNSAT.
