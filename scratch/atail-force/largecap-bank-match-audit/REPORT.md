# Large-cap live-surface versus 555/654 theorem-bank audit

Date: 2026-07-17

Status: **NO CURRENT BANK THEOREM INSTANTIATES EITHER
`CriticalFiberClosingCore` CONSTRUCTOR OR DIRECTLY CLOSES THE PHYSICAL
LARGE-RADIUS / EXACT-TWO-FOUR SPLIT.  LEMMA 81 IS THE STRONGEST REUSABLE
CONSUMER, BUT ITS LIVE SOURCE-MAP ANTECEDENT IS STILL MISSING.**

## Question audited

This audit checks the latest artifacts in
`scratch/555-654-general-theorem-mining/` against the corrected live producer
surface

```lean
hcap1 : 6 ≤ S.oppCap1.card
hcap2 : 6 ≤ S.oppCap2.card
B : FrontierBiApexRobustResidual R
```

and asks whether a mined general theorem can do either of the following:

1. instantiate `CriticalFiberClosingCore.ordered` or
   `CriticalFiberClosingCore.sameCap` for the parent residual `R`; or
2. close the physical large-radius or exact-two-four-radius arm directly.

The answer is **no** for the current bank.  This is an antecedent mismatch,
not a failure of the completed generic consumers.

## Required theorem-bank preflight

Before testing a new finite/local target, this audit checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section and the 555/654 section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches were also run for:

- a critical fiber with a source-faithful second center;
- an ordered cross row through the critical pair;
- two disjoint exact four-shells at the physical apex; and
- the front-before-isosceles two-row support pattern.

Those searches recovered the current consumers and internal reductions, but
no external bank theorem producing the missing live incidence, source
provenance, or cap/order placement.  In particular:

- the sibling U5 families consume named dangerous triples, q-deleted packets,
  and explicit cross-incidences which the live large-cap surface does not
  currently produce;
- `u1TwoLargeCapObstruction` consumes seven explicit metric equalities and an
  inequality, but no bank theorem derives those antecedents here; and
- the legacy and older general-theorem banks contain fixed local algebra and
  Radon-style consumers, not a producer from a shared
  `CriticalShellSystem` and the robust bi-apex parent.

Therefore this report does not propose another finite/local theorem.  It
records the first source-valid producer fact needed to use the theorem that
is already banked.

## Corrected live cardinality surface

Production proves

```lean
carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
    (hcap1 : 6 ≤ S.oppCap1.card)
    (hcap2 : 6 ≤ S.oppCap2.card) :
    14 ≤ D.A.card
```

and the robust physical-apex split is

```lean
largePhysicalRadius_or_exactTwoFourRadii_of_robust
```

with outputs:

- `LargePhysicalSecondApexRadiusIngress`, retaining both cap lower bounds,
  `14 ≤ D.A.card`, and a physical-apex radius class of cardinality at
  least five; or
- `PhysicalSecondApexExactTwoFourRadiusResidual`, retaining both cap lower
  bounds, `14 ≤ D.A.card`, and two disjoint exact four-point radius
  classes at the same physical center `S.oppApex2`.

By contrast, `mine_opt_nfs_geometry.py` builds the bank from the exact closed
cap profiles `(5,5,5)` and `(6,5,4)`.  In either profile the closed-cap sum is
15, hence the carrier has cardinality 12 by `S.capSum`; neither profile has
two caps of cardinality at least six.  Thus the bank's fixed-profile coverage
is disjoint from the corrected live cap/cardinality surface.

This does **not** invalidate an ambient-cardinality-independent theorem such
as Lemma 81.  It does mean that the exact 230/230 bank coverage is not an
occurrence theorem for the live `card ≥ 14` parent and cannot be transported
to it without a new source map.

## Strongest reusable bank theorem

The strongest and smallest reusable result in the latest 555/654 report is
the production core

```lean
Problem97.Census554.FivePointCircleIsoscelesOrderCore.Core R
```

with roles `W,F,P,X,Z` and equality closures

```text
WF = WX
WF = WZ
PZ = XZ
```

together with the distinctness required by the core.  The consumer

```lean
FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw
```

closes it when the five roles occur in strict cyclic order

```text
W < F < P < X < Z.
```

The source-independent scratch adapter

```lean
UniformLiveMetricCoreProducer.
  shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding
```

shows the exact useful interface.  Given one actual
`FaithfulCarrierPattern`, one shared `CriticalShellSystem`, a CCW carrier
enumeration, and an `OrderedFrontSchemaEmbedding`, it constructs the final
`GeneralCarrierBridge.ShellMetricCoreAlternative` disjunct.  The adapter is a
consumer: it deliberately does not prove that the live rows contain the
embedding.

The current finite artifact reports a direct literal two-row match in all
230 stored cores:

```text
unit-core-555          89
forced-pair-core-555   17
unit-core-654          48
forced-pair-core-654   76
```

Each match has one row centered at `W` containing `F,X,Z` and another row
centered at `Z` containing `P,X`.  This is exact finite coverage of the fixed
bank, not a theorem that every live robust large-cap carrier contains that
two-row motif.

## Match against `CriticalFiberClosingCore`

Production defines

```lean
inductive CriticalFiberClosingCore (R : FrontierCommonDeletionParentResidual F)
  | ordered
      (P : FrontierCommonDeletionCriticalFiber R)
      (core : OrderedCrossRowCore P)
  | sameCap
      (P : FrontierCommonDeletionCriticalFiber R)
      (core : SameCapCollisionPairCore P)
```

and `false_of_criticalFiberClosingCore` consumes either constructor.  Lemma
81 produces neither constructor.

### Ordered constructor

`OrderedCrossRowCore P` needs a chosen source-faithful critical fiber, an
orientation `C,K` of its two sources, and a source `J` such that the live
carrier has

```text
O = S.oppApex1
A = H.centerAt P.source₁
X = H.centerAt J
O < A < X < J < C < K
dist O J = dist O C
K ∈ (H.selectedAt J).support.
```

The fiber itself supplies `dist A C = dist A K`; the actual `J`-row supplies
`dist X J = dist X K` once the cross membership is known.  Lemma 81 instead
needs a five-role, two-row pattern with a three-target `W` row and a
two-target `Z` row.  It does not return a critical fiber, the required
source-indexed cross hit, or the six-role placement above.

The earliest current source-faithful branch which has all non-order fields is
the endpoint `crossHit` arm recorded in
`critical-fiber-producer-push/REPORT.md`.  Its first missing fact is the
compatible boundary placement (or a different checked order consumer for the
orders that actually occur).  The 555/654 role assignments do not prove that
placement on the live carrier.

**Verdict:** no instantiation of `CriticalFiberClosingCore.ordered`.

### Same-cap constructor

`SameCapCollisionPairCore P` needs one cap containing both

```text
H.centerAt P.source₁
secondCenter
```

while excluding both fiber sources `C,K`, with the two centers distinct.  It
also needs

```lean
HasSourceFaithfulSecondCenter P C K secondCenter
```

meaning that the second center is either the robust first apex with a proved
equality on `C,K`, or an actual center `H.centerAt J` whose exact selected
critical shell contains both `C` and `K`.

Lemma 81's second row is an abstract row at role `Z`.  Bank membership does
not identify it as the required second center for the chosen critical-fiber
pair, and the fixed role map supplies no live cap containing both centers
while excluding both pair points.

The first missing source-valid facts are therefore:

1. a second actual row (or the physical first-apex row) equidistant on the
   **same chosen fiber pair**; and
2. the corresponding same-cap center localization with both pair points
   outside that cap.

**Verdict:** no instantiation of `CriticalFiberClosingCore.sameCap`.

## Match against the physical large-radius arm

The current source reduction is

```lean
nonempty_reducedOutcome_of_largeSecondApexRadius
```

with only two continuations:

1. a source-faithful `CommonDeletionTwoCenterPacket`; or
2. an `exactUniqueFive` profile with
   `LargeCapUniqueFiveTwoCommonDeletionSources`.

The latter retains two distinct physical-cap sources, two concrete
common-deletion packets, and survival at the actual blocker and physical
apex.  It does not retain a five-role front-before-isosceles occurrence, the
ordered critical-fiber cross hit, or a same-cap second center for one chosen
fiber pair.

The 555/654 bank originally came from exact-card-five first-apex shadows on
the 12-point `(5,5,5)` and `(6,5,4)` profiles.  No current theorem maps either
`RobustLargeRadiusReducedOutcome` constructor on the corrected live surface
to `OrderedFrontSchemaEmbedding`, `ShellMetricCoreAlternative`, or one of the
two critical-fiber closing constructors.

The first missing source-valid fact is an occurrence/placement theorem from
one of these actual outcome packets.  In its weakest Lemma-81-facing form it
would have to produce actual rows and five cyclically ordered roles satisfying
the two-row membership pattern.  In the preferred critical-fiber form it
would produce a source-faithful cross row for one chosen pair plus the
compatible order or cap localization.  The cap lower bounds themselves add
boundary positions, not selected-row incidence.

**Verdict:** no direct closure of the physical large-radius arm.

## Match against the physical exact-two-four arm

`PhysicalSecondApexExactTwoFourRadiusResidual` supplies two distinct radii at
the **same** center `S.oppApex2`, exact support cardinality four, and disjoint
supports.

This is structurally incompatible with a direct literal Lemma 81 match:

- Lemma 81 uses rows centered at two distinct roles `W` and `Z`; and
- its rows share the role `X`, whereas the two physical exact-four supports
  are disjoint.

The two physical rows also cannot be treated as two different source rows of
one `FaithfulCarrierPattern`, which selects one source-indexed row at each
carrier center.  An additional actual critical row at a distinct source is
required before the Lemma 81 interface can even be formed.

Independent of the 555/654 bank, the scratch theorem
`protectedOriginal_or_commonDeletion` already reduces the fully coupled
exact-two-four residual to a protected original-frontier arm or a production
common-deletion packet.  That reduction is not a direct contradiction, and
the bank adds no terminal for either output.

The first missing source-valid fact for a bank route is therefore a distinct
actual row center containing a prescribed cross-support pair together with
the compatible cyclic placement.  For a `CriticalFiberClosingCore` route it
is the corresponding source-faithful second center or ordered cross hit.

**Verdict:** no direct closure of the physical exact-two-four arm.

## Exact producer statement still missing

The preferred load-bearing theorem remains a cap-strengthened producer of
the already checked terminal contract, schematically:

```lean
theorem nonempty_criticalFiberClosingCore_of_largeCapBiApexRobust
    (hcap1 : 6 ≤ S.oppCap1.card)
    (hcap2 : 6 ≤ S.oppCap2.card)
    (B : FrontierBiApexRobustResidual R) :
    Nonempty (CriticalFiberClosingCore R)
```

The bank supplies no proof of this statement.  A weaker alternate route is
to construct the antecedent of the completed Lemma 81 adapter:

```lean
∃ rows : FaithfulCarrierPattern D.A,
  OrderedFrontSchemaEmbedding (rowPattern rows) boundary
```

or directly `ShellMetricCoreAlternative rows H`, with `rows` sourced from the
same live carrier and critical system.  This alternate statement is also
unproved.  The exact SAT outer models at card 12 and 13 which avoid the
currently transported schema family show why pure row-incidence coverage is
not enough: the producer must visibly use additional Euclidean, cap/MEC,
full-radius, common-critical-map, or bi-apex deletion information.

## Epistemic ledger

### Source-complete declarations inspected

The following current source declarations have complete proof bodies and are
the checked logical interfaces for this audit:

- `carrier_card_ge_fourteen_of_both_opposite_caps_ge_six`;
- `largePhysicalRadius_or_exactTwoFourRadii_of_robust`;
- `nonempty_frontierCommonDeletionCriticalFiber`;
- `OrderedCrossRowCore.false`;
- `SameCapCollisionPairCore.false`;
- `false_of_criticalFiberClosingCore`; and
- `nonempty_reducedOutcome_of_largeSecondApexRadius`.

The scratch reports record successful focused elaboration for the Lemma 81
adapter and several nearby reductions.  This audit did not rerun Lean or Lake
and therefore does not relabel those recorded checks as a fresh validation.

### Exact finite evidence

- Lemma 81 has a literal two-row role assignment for 230/230 cores in the
  pinned current 555/654 bank.
- That coverage is exact for the stored fixed-profile bank.
- The card-12/card-13 Boolean outer audits can avoid the larger transported
  schema family; those are exact abstract models, not Euclidean
  counterexamples.

### Unproved / heuristic

- Every live `card ≥ 14` robust large-cap parent contains a Lemma 81 motif.
- Every such parent produces `CriticalFiberClosingCore R`.
- Either physical radius arm is directly contradictory from its current
  marginal data.

Those are the missing producer claims.  None follows from the current bank
coverage, and none should be described as closed.

## Bottom line

The bank has found a very good **consumer**: Lemma 81 replaces all 230 local
bank certificates once a matching two-row ordered occurrence is available.
It has not found the **producer** required by the corrected live large-cap
surface.  Mining more fixed 555/654 cores is not load-bearing for this goal.
The next theorem must be source-faithful and cap-strengthened: it must produce
the ordered cross row, the same-pair second center with cap localization, or
an actual Lemma 81 row/order occurrence from `(hcap1,hcap2,B)`.

No production file or shared plan document was changed, and no Lean/Lake
build was run for this audit.
