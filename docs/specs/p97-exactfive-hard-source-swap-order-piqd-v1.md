# P97 exact-five hard source-swap complete order/equality PIQD census v1

Status: implemented producer and governed runner; no solver run is recorded by
this specification.

## Claim boundary

This lane is conditional diagnostic computation.  Its 2,798 inputs are exact
for the abstract alias rules encoded by
`exactfive_hard_source_swap_grid.iter_source_alias_profiles()`: 961 profiles in
the `c1_eq_surplusApex` regime and 1,837 in the
`c1_ne_surplusApex` regime.  Lean does not yet prove that those profiles exhaust
all live source instances.  Therefore this lane does not establish live
closure, theorem promotion, or source realizability of a SAT assignment.

A SAT result is an over-approximate abstract survivor unless a separate source
realization is proved.  If both PIQD engines report UNSAT for all 2,798
authenticated formulas, that refutes the complete abstract order/equality
model under the encoded alias rules and source consequences.  It still does
not close the Lean obligation without a proved alias-coverage ingress and the
normal certificate/publication gates.

## One formula per alias profile

For each alias profile, the producer quotients the 15 roles

`U, O, c1, c2, a, d, p, q, s, t, u, v, e, x, y`

to canonical equality classes.  A profile is rejected if one class mixes two
incompatible fixed cap blocks.  For `m` quotient classes, the formula contains:

1. one integer rank in `0..m-1` for every class, all ranks distinct, with the
   class containing `U` fixed at rank zero;
2. a solver-selected direct or mirror cap skeleton;
3. one positive real variable for every unordered pair of distinct classes;
4. every alias-substituted circle-row equality;
5. the old/replacement radius disequality at `c2`;
6. the Lean-proved source strict form `d(e,a) - d(e,d) > 0`; and
7. all strict Kalmanson forms for every unordered quartet.

The direct skeleton is

`I2={u,v,x,y} < O < Is={e} < c2 < I1={a,d}`,

and the mirror skeleton reverses the five blocks.  Rank-free roles such as
`c1,p,q,s,t` may appear between these blocks unless an alias places their class
inside a fixed block.  This deliberately avoids imposing a stronger boundary
placement that has not been proved.

The four row packets are:

| row | center | selected support |
|---|---|---|
| `T0` | `O` | `a,d,c1,p,q` |
| `K1` | `c1` | `O,a,s,t` |
| `K2` | `c2` | `O,a,u,v` |
| `L` | `c2` | `d,e,x,y` |

The radius disequality is `d(c2,O) != d(c2,d)`.  If two role names are in the
same quotient class, their mutual distance is the literal zero; no positive
pair variable is created for that self-pair.  Thus an incompatible alias can
make a row formula UNSAT instead of being silently dropped.

These variables are abstract symmetric pair weights.  The formula does not
assert triangle inequalities or Euclidean realizability.

## Complete cyclic-order Kalmanson encoding

Distinct ranks give one cyclic order after cutting at `U`.  The encoding does
not enumerate rank permutations.  For chords `(a,b)` and `(c,d)`, it defines
alternation by

`between(c,a,b) XOR between(d,a,b)`,

where `between` is the strict open interval between the two integer ranks.
This predicate is unchanged by moving the linear cut or reversing the cyclic
order.

For four ranks in the order `a < b < c < d`, the unique crossing matching is
`(a,c),(b,d)`.  The asserted signs are exactly the two signs used by
`Problem97.ExactFourAdjacentGridKalmanson.RadialCyclicOrder.strict_cross_distance`:

```text
d(a,c) + d(b,d) > d(a,b) + d(c,d)
d(a,c) + d(b,d) > d(a,d) + d(b,c)
```

The SMT journal defines all three possible matching-alternation cases once and
instantiates one `strict_kalmanson_quartet` assertion for each unordered
quartet.  Exactly one case triggers, so replay checks exactly
`2 * choose(m,4)` strict forms.  The hand regression for the source roles also
checks the radial pruning step: `d(O,a)=d(O,d)` and `d(e,a)>d(e,d)` make the
wrong direct side order `O<e<a<d` violate Kalmanson, while the side order
`O<e<d<a` satisfies that four-role test.  The mirror case follows after
reversal.

## Smoke controls and exact SAT replay

Every governed launch runs two four-class controls before any profile:

- positive: cyclic adjacent weights are `1` and crossing diagonals are `3`;
  both engines must return SAT and the exact replay must accept;
- negative: all six weights are `1`; both strict crossing forms fail, so both
  engines must return UNSAT.

For every profile SAT, the verifier parses PIQD `get-value` output as exact
rationals and independently checks:

- rank bounds, integrality, distinctness, the `U=0` cut, and the direct/mirror
  skeleton;
- positivity of every pair weight;
- all four row-equality packets;
- the radius disequality and source strict form; and
- the unique crossing matching and both triggered Kalmanson forms for every
  quartet.

The receipt stores all exact ranks and pair weights, counts every replayed
family, and binds the full Kalmanson replay trace by SHA-256.  Missing terms,
non-rational terms, a nonpositive weight, an unrecognized orientation, or any
failed asserted form rejects the SAT replay.

## PIQD custody and governed execution

The entrypoint is:

```bash
uv run python scripts/run_exactfive_hard_source_swap_order_piqd.py \
  --workers 20 --timeout 60
```

Useful bounded selections are `--profile-index N`, `--profile-hash SHA256`, and
`--limit N`.  Indices and hashes cannot be mixed.  The worker count is capped
at 20.  Default output is one terminal summary line; `--verbose` adds one line
per profile.  Errors are always printed.

For the full stream, `--limit N` executes the first `N` selected indices but
the immutable launch still binds the complete selected stream.  A limited
invocation is a checkpoint, not a terminal census.  Increasing or removing the
limit resumes verified directories and extends the same launch; the terminal
record is installed only after every launch-selected profile is present.

The runner writes only below:

`scratch/runs/exactfive-hard-source-swap-order-piqd-20260902/run-0001/`

It creates a `worktree-run-manifest/v1` whose `base_head` is copied from the
lane checkpoint, plus an immutable launch record.  Each control and profile is
submitted through
`phase3_piqd_smt_source_adapter.run_source_semantic_query`, which runs fresh
PIQD Z3 and cvc5 sessions and installs create-once formula, source, session,
solve, model-replay, and receipt artifacts.

Resume accepts only a complete terminal directory.  It rechecks exact
descriptor, journal, source snapshots, every referenced artifact hash, both
terminal engine records, and the absence of unbound artifacts.  A retained SAT
model is replayed again from its exact solve artifact.  A partial, modified, or
cross-bound directory fails closed; it is never treated as completed work.

PIQD custody authenticates formula bytes, solver/session artifacts, and SAT
readback.  Z3/cvc5 UNSAT in this SMT lane is diagnostic and is not a checked
DRAT/LRAT certificate.  No result from this lane is promotion-eligible without
the missing source coverage and Lean-ingress evidence.
