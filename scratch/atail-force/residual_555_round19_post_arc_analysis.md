# Post-arc `(5,5,5)` round-19 survivor analysis

## Verdict

The regenerated round-19 survivor does **not** embed any currently registered
formalized metric/order core, and no exact embedding was found in the sibling
U5 direct-metric theorem family.

The survivor is nevertheless highly informative for the live producer.  It
keeps the already-required dangerous row at `p` and the two-point row at
`t2`, but changes the supplied `u` row at center `q` so that it has only one
dangerous-base hit.  In live labels it has

```text
q-row support = {t2,u,6,8},
```

and therefore omits exactly the second dangerous membership

```text
t3 in Kq.support.
```

This is the first unavailable antecedent of the six-point arc-overtake
consumer.  Thus the survivor points to a live forcing statement, not to a
hidden bank theorem: the producer must force an aligned second dangerous hit
in the supplied `u` row, or produce one of the already-consumed alternatives.

No additional CEGAR round is logically required before stating and attacking
that producer.  Further rounds may discover more finite-shadow avoiders, but
the current shadow is explicitly non-target-faithful and cannot by itself
prove the arbitrary-cardinality live producer.

Rigor labels:

- **PROVEN:** the existing arc-overtake Lean consumer and adapter, as recorded
  in their own validation artifacts;
- **EMPIRICALLY VERIFIED / exact finite replay:** the checkpoint data,
  equality quotient, current matcher miss, and direct U5 hypothesis
  unification below;
- **TRUSTED SOLVER RESULT / model not independently replayed:** the order-free
  Z3 SAT result below;
- **UNKNOWN:** real feasibility with the required strict convex order;
- **CONJECTURED:** the live MEC/cap/full-filter/no-`M44` data force the missing
  second hit or an alternate consumed pattern.

## Pinned checkpoint

The inspected artifact was

```text
scratch/atail-force/common_system_metric_probe.json
SHA-256 e578bb92266bb893820a72828f00657fe7d363010b5fa9fdec9fb15a3b2cc782
```

with matcher source

```text
scratch/atail-force/common_system_metric_probe.py
SHA-256 7985430cffbdae7280967e13e0cb72bb5d14b76f21772f471bef427a3f2a0223
```

The `(5,5,5)` case has 19 accepted cuts and ends at

```text
round: 19
assignment SHA-256:
  ef90d3234ee6a42eaebe1728d27a771812e33262b8b098c457f295ef5314d96d
incidence status: SAT (39 nodes)
reported status: UNDECIDED_FAIL_CLOSED
formalized_structural_core: null
exact-oracle verdicts: TIMEOUT, TIMEOUT, NONUNIT
```

Its five metric rows are

```text
0:{1,2,3,4}
1:{0,2,6,7}
2:{3,8,9,10}
3:{1,5,6,8}
4:{0,5,9,11}
```

and the fixed-frame hull order is

```text
(0,9,10,11,1,3,4,5,2,6,7,8).
```

The saved `TIMEOUT/TIMEOUT/NONUNIT` tuple is not a mathematical verdict.  In
particular, `NONUNIT` for one equality-ideal variable order does not establish
a real or strictly convex realization.

## Live-label interpretation

For this seed,

```text
p=0, q=3, t1=2, t2=1, t3=4, u=5.
```

The rows become

```text
p  : {t2,t1,q,t3}
t2 : {p,t1,6,7}
t1 : {q,8,9,10}
q  : {t2,u,6,8}
t3 : {p,u,9,11}.
```

The arc-overtake role map is

```text
(O,A,C,D,E,F) = (p,t2,t1,q,t3,u).
```

The first row supplies `OA=OC=OD=OE`, and the `t2` row still supplies
`AO=AC`.  The old suffix also had the `q`-row equality cluster

```text
DA=DE=DF,
```

through support `{t2,t3,u,...}`.  The new survivor replaces that by

```text
dist q t2 = dist q u = dist q 6 = dist q 8,
```

so `DE`, equivalently `dist q t3`, is absent.  This is exactly the second
dangerous-base hit identified by the live producer-readiness audit.

## Equality quotient

The five rows generate exactly three nontrivial undirected distance classes:

```text
{0-1,0-2,0-3,0-4,1-2,1-6,1-7,4-5,4-9,4-11}
{2-3,2-8,2-9,2-10}
{1-3,3-5,3-6,3-8}.
```

The first class merges the rows at centers `0`, `1`, and `4` through the
shared edges `0-1` and `0-4`.  Exhaustive enumeration of this quotient finds
no pair of distinct centers with two distinct common equidistant points.  In
particular, the four-point same-side reflection consumer has no equality-side
antecedent here.

## Required theorem-bank preflight

Before considering a new core, the required registries were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches included six-point/two-circle cyclic-order
contradictions, same-side reflection and perpendicular-bisector kernels, and
finite carrier shared-radius incidence patterns.  They recovered the existing
`SixPointTwoCircleOrderCore`, circle-chain/nested-center families,
`two_circle_noncollinear_common_point_elim`, the same-side reflection theorem,
and the sibling U5 incidence kernels.  None supplied this survivor's exact
hypotheses.

The current `scan_formalized_core` checks the full registered equality family,
both cyclic orientations of every registered order family, and the new
arc-overtake core first.  Direct replay on these five rows returns `None`.

As a separate exact hypothesis-unification check, all 98 source-proved sibling
declarations classified

```text
family = U5GlobalIncidence
category = metric-point-uniform
conclusion = False
```

were tested against the undirected row-equality quotient.  The check parsed
every radius equality and distance-class equality, enforced positive radii,
positive distances, and each theorem's explicit point inequalities, and
allowed role aliasing whenever the declaration allowed it.  The one theorem
with an additional off-radius hypothesis already failed its equality-side
requirements, so that disequality was not needed.  The result was zero
embeddings.  This is exhaustive within that declared direct-metric family and
unification model; it does not rule out a future composition of bank lemmas or
a theorem with additional geometric antecedents.

## Solver evidence and its boundary

The existing cvc5 and Z3 QF_NRA encoders were first replayed on their known
SAT and UNSAT smoke systems; both gates passed.

On the survivor, Z3 returned `SAT` for the exact metric relaxation containing

```text
15 row equalities
66 pairwise-distinctness constraints
35 exact-row off-circle exclusions
```

in 59.037 seconds.  The staged runner did not retain that intermediate model
after the later convex query timed out, so the SAT model was not independently
substituted back into the original constraints.  This is a trusted solver
result, not a checked witness.  It supports the conclusion that the order-free
surface is consistent; it is not promoted to a proof of realizability.

After adding the 120 strict-convex half-plane constraints:

```text
Z3 full exact+convex: UNKNOWN (60-second timeout)
Z3 equality+distinctness+convex relaxation: UNKNOWN (60-second timeout)
cvc5 --nl-cov full exact+convex: UNKNOWN (60-second timeout)
```

A 32-start SLSQP discovery search found no accepted strict-convex witness, but
its best candidate still violated the row equations substantially.  It is not
evidence of UNSAT.  A subsequent edge-fan localization run was stopped during
the pair-fan phase and no result from it is banked.

Therefore strict-convex realizability remains **UNKNOWN**.  The timeouts must
not be upgraded to either feasibility or contradiction.

## Producer consequence

The finite replay has now performed the useful falsification test against the
old recurrence: once the three-row arc-overtake cut is installed, the shadow
can choose a `q` row with only one dangerous hit.  Consequently the repeated
rounds 10--28 were not evidence that the two-hit row was incidence-forced.

The next live theorem should be an arc-overtake-or-alternate coverage lemma on
the actual live surface.  Its decisive content is:

```text
either
  the supplied u row meets {q,t1,t2,t3} in an aligned second point
  and a compatible critical t2 row/order is selected,
or
  one of the already-consumed five-row/global-nested-pair alternatives holds.
```

The proof must use a live field omitted by this shadow, most plausibly the MEC,
cap, full-filter, or no-`M44` geometry.  Merely requesting more unstructured
common-system rounds does not address that missing forcing principle.
