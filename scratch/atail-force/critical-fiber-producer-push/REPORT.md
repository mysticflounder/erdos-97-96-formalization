# Critical-fiber producer push

Date: 2026-07-17

Status: **PAIR-PRESERVING FALLBACK AUDITED. THE FINITE TWO-SHELL CORE IS
LEAN-LSP-CHECKED; THE PROJECT ADAPTER IS WRITTEN BUT AWAITS RE-ELABORATION
BECAUSE THE CURRENT PROJECT IMPORT GRAPH IS STALE AND THIS LANE IS UNDER A
NO-BUILD GATE. THE EXACT OUTCOME IS COMMON OMISSION OR A DISJOINT TWO-BY-TWO
ROW COVER. BOTH ARMS REACH ONLY EXISTING U5 RESIDUAL SURFACES, NOT A CHECKED
`FALSE` TERMINAL. THE EARLIER ORDERED-CONSTRUCTOR REDUCTION REMAINS A VALID
FALLBACK SUBBRANCH, NOT AN EXHAUSTIVE PARENT CLOSER. NO SOURCE `sorry` IS
CLOSED.**

## Scope and preflight

This lane starts from the requested parent statement

```lean
R : FrontierCommonDeletionParentResidual F
```

and uses the current production modules:

- `ATail/FirstApexCriticalFiber.lean`;
- `ATail/CriticalFiberClosingCore.lean`;
- `ATail/RetainedStrictInteriorPairSelector.lean`;
- `ATail/LocalizedCollisionMutualOmissionCycle.lean`; and
- their production flattening in
  `ATail/RetainedStrictInteriorParentNormalForm.lean`.

Before defining the reduction, the registries required by `AGENTS.md` were
checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered common critical fibers,
source-faithful cross rows, same-cap second centers, ordered cross-row cores,
and three isosceles equalities in convex cyclic order. They recovered the
current production consumers and nearby order cores, but no theorem which
produces a closing constructor from the parent without an additional cap or
order field.

## Earliest honest constructor branch

Production already gives the exact four-way terminal surface

```lean
nonempty_retainedStrictInteriorTerminalSurface R
```

The first branch on this surface which can actually reach one of the two
`CriticalFiberClosingCore` constructors is

```text
matchingEndpointCriticalFiber
  -> EndpointFreshCrossOrCommonDeletion.crossHit.
```

On this branch production supplies:

- a chosen `E.fiber : FrontierCommonDeletionCriticalFiber R`;
- an orientation `C,K` of its two actual sources;
- a genuinely fresh `J` in one selected first-apex row with `C`;
- the equality `dist O J = dist O C` from that row;
- the common-blocker equality `dist A C = dist A K` from the fiber;
- the actual center `X = H.centerAt J`; and
- the positive cross incidence `K` in the exact `J`-critical shell, hence
  `dist X J = dist X K`.

These are every non-order field of the production `OrderedCrossRowCore`.
`CriticalFiberProducerPush.lean` records the remaining datum as

```lean
EndpointOrderedBoundaryPlacement fresh
```

whose mathematical content is the cyclic placement

```text
O < A < X < J < C < K
```

on one injective CCW enumeration of the full carrier. The boundary existence,
injectivity, image, and CCW facts are standard consequences of the parent's
convex carrier; the unproved information is the relative order of these six
specific live roles.

The checked constructor is

```lean
orderedCrossRowCoreOfEndpointCrossHit
```

and the actual target-facing theorem is

```lean
nonempty_criticalFiberClosingCore_of_endpointCrossHit_ordered
```

It returns

```lean
Nonempty (CriticalFiberClosingCore R)
```

with the same chosen endpoint fiber. No anonymous selected row, arbitrary
outside pair, or fixed-cardinality schema is inserted.

## Exact parent residual

The theorem

```lean
nonempty_criticalFiberClosingCore_or_producerResidual
```

is the strongest honest parent reduction obtained in this lane. It returns
the closing core on the endpoint-cross/order branch and otherwise preserves
one of the following exact production residuals:

1. localized strict-interior collision, its fresh common deletion, and its
   source-exact mutual-omission cycle;
2. matching source-return with the production U5 outcome;
3. endpoint fiber with a genuinely fresh common-deletion edge;
4. endpoint fiber with the positive cross hit but no favorable ordered
   placement; or
5. the three-distinct-blocker continuation.

This is intentionally not presented as closure. The residual type does not
assert that any branch is Euclidean-realizable; it records exactly which
production information remains after the one constructor-producing subbranch
has been discharged.

## Why the other branches were not forced into the contract

The localized-collision branch is already stronger than a raw critical fiber:
both retained sources lie in the strict first-opposite cap, their common
blocker localizes to that cap, and production constructs a source-exact
mutual-omission cycle. But the audited `ordered` placement is incompatible
with the mandatory retained-radius alternation, while the `sameCap` constructor
requires a distinct source-faithful second center and two outside sources in
one cap. Neither field follows from the localized cycle.

The checked finite regressions in the adjacent
`critical-fiber-closing-core-samecap` and
`retained-collision-cap-consumer` lanes retain the current represented
critical-map, support-locking, robustness, overlap, alternation, and cap
surfaces without producing the `sameCap` constructor. They are exact only
within those finite abstractions, not counterexamples to the full Euclidean
parent. Their correct use here is as a regression gate against declaring the
two constructors exhaustive.

Thus the requested global theorem

```lean
nonempty_criticalFiberClosingCore R
```

is still sufficient for closure but is not currently justified as an
exhaustive classifier of `RetainedStrictInteriorTerminalSurface R`. Proving it
now requires at least one genuinely new full-geometry result:

- force the six-role endpoint order above (or another order with a checked
  constructor/consumer); or
- map each remaining source-exact collision/cycle branch to `sameCap`,
  `ordered`, or direct `False` using new MEC/cap/order information.

The smallest field expressed by the current production closing contract is
therefore `EndpointOrderedBoundaryPlacement fresh`.  The next section records
a more invariant weakening exposed by the latest proof-facing geometry
ledger; that weakening is not yet a production structure.

## Latest `/opt/nfs` geometry-ledger audit

The 2026-07-17 copies of

```text
/opt/nfs/possible-new-geometry.md
/opt/nfs/verified-results.md
```

were checked after the reduction above was kernel-validated.  The relevant
new result is `PG136`, recorded as proved Lemma 184 in the proof-facing
ledger.  Its three metric equalities are *exactly* the endpoint-cross-hit
equalities under the following role map:

```text
ledger:   D  A  B  P  Z  Q
endpoint: O  C  J  A  K  X
```

Indeed, the ledger hypotheses

```text
DA = DB,  PZ = PA,  QZ = QB
```

become

```text
OC = OJ,  AK = AC,  XK = XJ.
```

Lemma 184 proves a strict nesting law.  If the coarse restricted order is

```text
O, A, X, perm(K, C, J),
```

then `J` must lie strictly between `K` and `C`; only the two tail orders

```text
K, J, C    or    C, J, K
```

remain.  Thus the production order

```text
O, A, X, J, C, K
```

is one of four forbidden tail permutations, not the canonical form of the
underlying geometric fact.

This improves the producer target: a future adapter need not manufacture that
one exact six-index order.  It is enough to prove a coarse same-side placement
of `O,A,X` versus `C,J,K` and then either

- contradict the forced `J`-between-`C,K` nesting using cap order; or
- route one of the two surviving nested orders to another checked consumer.

It does **not** close the parent by itself.  The current
`FrontierCommonDeletionParentResidual` and endpoint continuation retain cap
interior data for `W.first` and `W.second`, but do not retain enough cap/block
placement for the actual blockers `A,X`, the fresh source `J`, and (in every
endpoint-location arm) `W.next` to establish the coarse restricted order.
That missing live cap/order localization, rather than another selected-row
schema, is the next producer problem.

## Pair-preserving four-row fallback audit

The arbitrary endpoint selector keeps one fiber source and then chooses one
fresh support point. It throws away a stronger bounded fact already present
on the retained walk:

```text
W.first, W.second ∈ SelectedClass A O radius ∩ I₁,
```

while the complete class outside `I₁` has cardinality at most two. The new
scratch structure

```lean
FirstApexTwoRemainderRow W
```

therefore chooses a first-apex `SelectedFourClass` which simultaneously
preserves

```text
W.first,
W.second,
SelectedClass A O radius \ I₁.
```

Its support has exactly two named remainder points `J₁,J₂`. The scratch
adapter records the following exact cap profile:

- each `Jk` is in `I₁`, the left adjacent closed cap, or the right adjacent
  closed cap;
- `J₁,J₂` cannot both lie in the left adjacent cap;
- `J₁,J₂` cannot both lie in the right adjacent cap; and
- at least one remainder is different from the endpoint source `W.next`.

This is strictly stronger than choosing an arbitrary `J`: it retains both
complement choices and every outside-interior member of the complete radius
class.

### Exact actual-shell split

Intersect the actual critical shells at `W.first` and `W.second` with the
pair-preserving four-row. Each intersection has cardinality at most two by
the production two-circle theorem, and each is nonempty because it contains
its own source. The checked finite core

```lean
nonempty_complement_or_exact_disjoint_two_pair_cover
```

then gives exactly two arms:

1. a remainder is omitted by both actual shells; or
2. the two shell intersections are disjoint two-point sets whose union is
   the full selected row.

`TwoRemainderFirstApexRow.lean` specializes this as

```lean
nonempty_pairRowActualShellOutcome
```

and strengthens the common-omission arm by constructing both concrete
`CommonDeletionTwoCenterPacket`s, at the first apex paired respectively with
the actual blockers of `W.first` and `W.second`. No source-return hypothesis
is used. In particular, if the second actual shell contains `W.first`, the
two intersections overlap, so the disjoint-cover arm is impossible and a
common omission is forced.

### Terminal audit

Neither arm currently closes.

- The common-omission arm has exactly the mathematical payload used by
  `RetainedSourceReturnJointDeletion.nonempty_u5Ingress`, except that the
  latter structure carries the unrelated tag `W.next = W.first`. That tag is
  not used by the ingress constructor. Generalizing the adapter would expose
  one dangerous first-apex triple, two source-exact q-deleted blocker rows,
  and the source's actual q-critical row. There is no checked `False`
  consumer of that ingress in production.
- The disjoint-cover arm is the row-local analogue of
  `RetainedSourceReturnExactFourPartition`. Production explicitly describes
  its dual U5 ingress as a mining surface, "not itself a terminal
  incompatibility." The theorem-bank search found the same ingress and
  nearby U5 incompatibility families, but no adapter whose antecedent is just
  this exact two-pair cover.
- Neither arm supplies the cyclic placement required by
  `OrderedCrossRowCore`, nor the cap/blocker localization required by
  `SameCapCollisionPairCore`.

The pair-row refactor is therefore a useful bounded fallback and a cleaner U5
mining object, but it is **nonterminal**. It must not replace the load-bearing
two-omission route or be reported as progress toward an already checked
contradiction.

The broader `nonempty_criticalFiberClosingCore R` target is also too strong
for the advertised two-omission proof shape: that contract does not consume
the second-apex robustness carried by the intended parent branch. The
pair-row work is retained only as a fallback audit.

## Validation

The focused single-file scratch check was run from `lean/`:

```text
lake env lean -M 16384 -s 65536 \
  ../scratch/atail-force/critical-fiber-producer-push/\
CriticalFiberProducerPush.lean
```

It exits zero. The three explicit axiom queries report exactly:

```text
propext
Classical.choice
Quot.sound
```

The file contains no `sorry`, `admit`, custom axiom, `native_decide`, or
unsafe declaration. No production source, shared plan document, generated
blueprint, protected unique arm, `SurplusM44`, or shell-curvature file was
modified. Per the active gate, no production Lake build was run.

The generic finite two-shell theorem in `FiniteTwoShellCover.lean` was also
checked with Lean LSP and reports exactly the same three standard axioms. The
project-specific `TwoRemainderFirstApexRow.lean` adapter could not be
re-elaborated in this checkpoint because Lean LSP reports:

```text
Imports are out of date and must be rebuilt.
```

No build was started because this lane was explicitly instructed not to run
Lean or Lake builds. Accordingly, the generic finite core is checked, while
the project adapter remains **WRITTEN / RECHECK REQUIRED** rather than being
described as kernel-checked.
