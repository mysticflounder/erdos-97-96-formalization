# FreshThird U3 exact-radius ingress — 2026-08-19

This run is a finite diagnostic projection of
`SixSurvivorU3ExactRadiusAuditObstruction`.  It is not a Lean closure and does
not claim source-totality.

## Encoded source projection

The v10 suffix is layered over the authenticated v9 prefix
(`4edf4687bc2a6d305d10db38ad7cbe730975774b87f57ea0e52fe25002fefdfe`).  It
adds:

- eight distinct carrier selectors for `q`, `p`, `t1`, `t2`, `t3`, `u`,
  `a0`, and `a1`;
- source-linked transport of `q` from the selected common source and `p` from
  that source's common blocker;
- an exact three-point dangerous-radius selector, with precisely `t1,t2,t3`
  on that projected class;
- the six bounded audit centers `u`, `a0`, `a1`, `t1`, `t2`, `t3`;
- one exact-four support projection at each center, with q-deleted and
  critical-shell modes;
- q omission/inclusion for the two modes, positive-radius center exclusion,
  q-deleted `has4` linkage, and the source-proved dangerous-circle distribution;
- an existential obstruction selector: either a q-deleted support point lies
  outside the eight-point bounded support, or the selected mode is a critical
  shell.

The projection deliberately omits Euclidean equal-distance realization,
critical-shell full-radius exactness, and non-collinearity of the dangerous
triple.  Those omissions are named in the manifest; none is encoded as a
Boolean surrogate.

## Result

The corrected instance has:

- 93,751 variables;
- 728,527 clauses;
- CNF SHA-256
  `1d98bbe99487a079b528dbde96fd91ba11ef74b19266e583ece9d686359b9e2e`;
- CaDiCaL 3.0.0: `SAT`;
- Z3 DIMACS cross-check: `SAT`.

The replayed CaDiCaL model selects `delete_one_keep_two`, with
`q = 12`, `p = 16`, dangerous triple `{1,2,3}`, and frame points
`u = 9`, `a0 = 10`, `a1 = 4`.  All six audit centers choose the q-deleted
mode.  The selected obstruction center is `u`, whose projected row is
`{0,1,2,4}` and whose point `0` is outside the bounded support
`{1,2,3,4,9,10,12,16}`.

Thus the finite U3 ingress is consistent and does not itself produce a
contradiction.  The model also shows that the exact-radius obstruction can
survive with no critical-shell arm and no named row collision.  The missing
producer remains a geometric/source-level theorem connecting this escaping
row to a canonical row, a return/collision, or a strict descent measure.

## Encoding corrections

An earlier draft returned `UNSAT` because it paired every three support
indices with every unrelated three dangerous-base indices.  That incorrectly
forbade ordinary four-point rows.  A second draft had the wrong implication
polarity for the outside-support witness.  Both drafts are discarded.  The
reported SAT result is from the corrected pointwise-distribution and witness
encoding.
