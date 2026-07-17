# Generated-successor source-split audit

Date: 2026-07-16

Status: **SUPERSEDED FOR THE LIVE-CENTER ARM: ONE WHOLE `SourceSplit`
CONSTRUCTOR IS NOW TERMINAL; THE REMAINING FOUR-WAY FRONTIER IS EXPLICIT.**

## Scope and verdict

This audit matches the five constructors of
`OriginalQGeneratedSuccessorPair.SourceSplit` against the complete retained
parent surface and the current theorem banks. It adds no Lean theorem and
changes no production file, closure document, proof-blueprint state,
protected file, or unique-row lane.

Let

```text
rowX = Q.generated.toTwoContinuationRows.row1
rowY = Q.generated.toTwoContinuationRows.row2
cap  = S.oppCap2
sx   = Q.at_x.source
sy   = Q.at_y.source.
```

The original audit conclusion was:

- none of the five constructors had yet been shown uniformly contradictory;
- `equalSource_atLiveCenter` and `equalSource_atSecondApex` are already
  contradictory when **both** generated rows are q-critical;
- the distinct-source and cross-survival arms still need a repeated
  outside-cap pair across the two generated rows;
- the remaining metric arms split into the existing non-equilateral common-hit
  terminal and the equilateral joint-transition terminal.

The subsequent kernel-checked
`../equal-source-metric-terminal/EqualSourceMetricTerminal.lean` supersedes
the first and fourth bullets: `equalSource_atLiveCenter` is contradictory for
all four q-deleted/q-critical constructor combinations.  Its
`ReducedSourceSplit` retains only distinct sources, the two oriented
equal-source cross-survival arms, and the second-apex equilateral arm.

## Retained facts used in this audit

The generated-successor pair already supplies:

```text
sx in rowX.support
sy in rowY.support
sx,sy notin {q,t1,t2,t3}
deleting sx or sy preserves K4 at p and S.oppApex2.
```

If `sx = sy = a`, then `a` belongs to both generated rows. The full parent
also retains the common `CriticalShellSystem`, the MEC/cap order, distinct
strict-`oppCap2` centers `x,y`, the live and physical rows, and all
no-removability/no-M44 hypotheses.

The checked `AnchoredF2LiveHeavyReduction.liveCapFacts` gives

```text
p in strictSecondCap S,
q notin cap,
R.sourcePair.x notin cap.
```

Thus `p` is inside `cap`, while both `q` and `S.oppApex2` are outside it.
The new full-parent adapter

```text
OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2
```

derives `q != S.oppApex2` from the retained `q notin M.verts` hypothesis.
Composed with the checked local metric theorem, it gives the source-clean
full-parent terminal

```text
OriginalQOutsideMiddleParentContext.
  false_of_qCritical_qCritical_metricResidual.
```

This is the only newly available unconditional branch sink found by the
audit.

## Exact direct-consumer normal form

For the non-metric arms, the weakest checked ordered-cap sink found is the
following semantic packet:

```text
CommonOutsidePair(rowX,rowY,cap) :=
  exists a b,
    a != b
    and a in rowX.support and a in rowY.support and a notin cap
    and b in rowX.support and b in rowY.support and b notin cap.
```

The two row centers are already distinct ordered-cap centers, so this packet
feeds `CapSelectedRowCounting.outsidePair_unique_capCenter` directly. This is
the weakest **current checked consumer antecedent found**, not a claim of
logical minimality among all possible future geometric theorems.

When both generated rows are q-critical, `q` is already one common point
outside `cap`. Consequently the deficit drops from a common pair to one
additional common outside point.

## Five-arm matrix

### 1. `distinctSources`

Status: **OPEN in every generated-constructor combination.** Distinct source
witnesses are not automatically cross-members of the opposite generated
rows, and neither source has a source-implied cap side.

Exact first antecedent for the current direct sink:

```text
CommonOutsidePair(rowX,rowY,cap).
```

The source-faithful specialization is

```text
sx notin cap and sy notin cap
and sx in rowY.support and sy in rowX.support.
```

For q-critical x q-critical only, one symmetric half suffices, for example

```text
sx notin cap and sx in rowY.support,
```

because `q` supplies the other common outside point and `sx != q` follows
from `sx` being outside the live four-set.

### 2. `equalSource_crossAtX`

Status: **OPEN.** Write `a = sx = sy`. The constructor's deletion-survival
fact is a genuine continuation fact, not a contradiction and not an extra
row incidence. The checked cross-survival audit already rules out treating
one survivor row as if it contained a repeated first-apex radius.

Exact first antecedent for the current direct sink is again
`CommonOutsidePair(rowX,rowY,cap)`. Using the retained common source, this can
be supplied as

```text
a notin cap
and exists b, b != a and b notin cap
  and b in rowX.support and b in rowY.support.
```

For q-critical x q-critical, the exact remaining antecedent reduces to

```text
a notin cap,
```

since `q` is already the second common outside point and `a != q`.

### 3. `equalSource_crossAtY`

Status and deficit are exactly symmetric to `equalSource_crossAtX`:

```text
CommonOutsidePair(rowX,rowY,cap),
```

or, using the shared source, `a` outside `cap` plus one further common
outside point. In the q-critical x q-critical subcase, `a notin cap` alone
is enough.

### 4. `equalSource_atLiveCenter`

Here `sx = sy = p` and the rows satisfy `MetricResidual`.

- **CLOSED uniformly**, including every constructor pair with a q-deleted
  row, by `false_of_equalSource_atLiveCenter_metricResidual`.

The metric residual itself places each opposite named center in the
corresponding completed generated row.  Since those centers differ from the
deleted point `q`, both memberships descend to the raw generated supports.
The common source and both named centers then lie in `oppCap2`, and the
shared ordered-cap theorem makes the two mutual companion incidences
contradictory.

The former `StrictOppCap1CommonHit`, surplus-heavy completion, and
three-reverse-equality routes are retired for this arm: follow-up checked
audits prove those proposed positive packets impossible or wrong-polarity.

### 5. `equalSource_atSecondApex`

Here `sx = sy = S.oppApex2` and the rows satisfy `EquilateralResidual`.

- **CLOSED** when both generated rows are q-critical, again by the
  full-parent q-critical/q-critical metric terminal (an equilateral residual
  is a metric residual).
- **OPEN** when at least one row is q-deleted.

The exact first current antecedent for a realized residual is a
`JointTransitionClosingSelection` for its produced joint-transition packet;
the uniform parent field is `JointTransitionCoreEliminator D S H`.

Do not target a second common point outside `cap` here. The checked theorem

```text
TwoContinuationRows.
  common_support_outside_oppCap2_eq_singleton_of_equilateralResidual
```

proves that `S.oppApex2` is the **unique** common outside-cap support point in
this arm. The ordered-cap common-pair route therefore has the wrong polarity.

## Bank preflight

Before proposing these antecedents, the audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- the current generated-row, continuation, cross-survival, joint-transition,
  and U5 consumer reports; and
- focused `nthdegree docs search --lean` queries for common critical-map
  deletion survival, equal successor sources, equilateral residuals, and
  repeated outside-cap pairs.

The original bank audit found no theorem directly consuming a bare
`SourceSplit` arm.  The follow-up live-center terminal instead reuses the
checked ordered-cap contradiction after proving the missing raw companion
memberships.  The other closest reusable endpoints are
`outsidePair_unique_capCenter`,
`false_of_nonEquilateral_of_strictOppCap1CommonHit`, the joint-transition
consumer, and the now-composed full-parent q-critical metric terminal.

## Recommended next routing

1. Eliminate the whole equal-source-at-live-center constructor with
   `false_of_equalSource_atLiveCenter_metricResidual`.
2. Eliminate q-critical x q-critical in the remaining metric surface with the
   checked full-parent terminal.
3. For the second-apex equilateral arm with at least one q-deleted row, retain
   the branch-indexed `JointTransitionClosingSelection` target unless a
   stronger direct terminal is proved.
4. For distinct/cross-survival arms, target the source-faithful repeated
   outside-pair packet. Do not recurse through a bare successor, infer a
   metric from support omission, or mine a repeated first-apex radius.
5. Use the geometry/rank classifier only as a refinement: its rank-move arm
   has no checked no-wrap theorem and its other arms do not supply the missing
   cross-memberships.

## Epistemic status

- **PROVEN in focused scratch Lean:** the five-way source split, all retained
  membership/survival facts, the q-critical/q-critical metric terminal, its
  full-parent `q != oppApex2` discharge, the equilateral unique-outside-point
  theorem, the whole live-center terminal, the four-way reduced split, and
  the named branch consumers cited above.
- **OPEN:** the four constructors of `ReducedSourceSplit`, except for
  constructor-indexed subcases already eliminated elsewhere.
- **AUDIT CONCLUSION:** the live-center antecedent list is superseded; the
  remaining displayed antecedents are the weakest matching inputs to current
  checked consumers found after the required bank search.

No full Lake build was run for this documentation-only audit.
