# Card-`>=14` nonlinear canonical-escape geometry audit

Date: 2026-07-22

Status: **EXACT `Q(sqrt(3))` REGRESSION. THE FULL LOCAL MEC/CAP/NO-`M44`
LAYER, BOTH ROBUST APEX CLASSES, THE FRONTIER DOUBLE-DELETION MARGINALS, AN
EXACT-FIVE SECOND CAP, A CANONICAL `(5,6,5)` ESCAPE, AND ONE
DELETION-CRITICAL REPEATED FIBER ARE JOINTLY REALIZABLE WITHOUT A TERMINAL
ROW. GLOBAL ALL-CENTER K4/TOTAL CRITICAL COUPLING IS INDISPENSABLE.**

This is not a Problem-97 counterexample and does not instantiate the full
production `CounterexampleData`, `CriticalShellSystem`, or minimality
contracts. No production file is modified.

## Question tested

The checked predecessor

```text
exists_faithfulRow_escape_from_canonical565_of_card_ge_fourteen
```

extracts a thirteen-point `(5,6,5)` subcarrier and a selected row centered in
that subcarrier with a support point outside it. The proposed next step was to
use nonlinear Euclidean geometry, the actual MEC caps, complete radius
filters, or `noM44` to force one of:

1. a genuinely distinct row through both sources of a production critical
   fiber;
2. an `OrderedCrossRowCore`; or
3. a second same-carrier support triangle satisfying `IsM44`.

The exact model below realizes all of the local geometry and the proposed
escape, but none of those terminal antecedents. It therefore rules out a
theorem derived only from that local layer.

## Exact carrier

Work over `Q(sqrt(3))`. Put

```text
A = (1,0)
B = (-1/2, sqrt(3)/2)
C = (-1/2,-sqrt(3)/2).
```

The remaining coordinates are explicit in `verify_exact_regression.py`.
They extend the audited three-row MEC construction in
`mec-boundary-critical-rows/verify_model.py` in three ways:

- replace the middle strict `BC` point by
  `wBC = (1-sqrt(3),0)`, placing it on the radius-squared-three circle about
  `A`;
- rotate `wBC` by 120 degrees to obtain `wCA`, placing it on the corresponding
  circle about `B`;
- add one exact outward edge insertion `gAB` and one exact rational-circle
  insertion `gCA`.

The exact CCW boundary order is

```text
A, gAB, xAB, wAB, yAB,
B, xBC, wBC, yBC,
C, gCA, xCA, wCA, yCA.
```

All 168 directed-edge/nonincident-point determinants are strictly positive.

## Actual MEC, caps, and `noM44`

The unit disk centered at zero contains the carrier. Its boundary meets the
carrier exactly in `{A,B,C}`. The identity

```text
(A+B+C)/3 = 0
```

with all three squared norms equal to one is an exact minimum-radius
certificate: for every proposed center, the average of the three squared
distances is at least one. The support triangle is acute.

The production signed-area `OnArcOpposite` filters are checked literally and
give, after naming the roles used by the exact-five branch,

```text
surplus cap        AB   card 6
first opposite cap CA   card 6
second opposite cap BC  card 5.
```

Because the MEC boundary contains only `A,B,C`, every circumscribed support
triangle is a permutation of that triple. Its closed-cap cardinality multiset
is always `{5,6,6}`. Hence no same-carrier `SurplusCapPacket` can satisfy
`IsM44`.

This is an exact geometric `noM44` certificate, not an abstract Boolean
assignment.

## Exact apex classes and parent-row marginals

Let `B` be the first opposite apex and `A` the physical second apex. Complete
all-center distance grouping gives

```text
center A, squared radius 3:
  {B,C,xBC,wBC,yBC}                   exact five

center B, squared radius 3:
  {A,C,gCA,xCA,wCA,yCA}               exact six.
```

There is no other K4 radius at either apex. Thus both apices are fully robust
under every singleton deletion.

Choose the off-surplus first-apex pair

```text
q = xCA,   w = yCA.
```

They are co-radial about `B`. Deleting both leaves four members of the
six-class at `B`, while the exact five-class at `A` is untouched. Therefore
the two local double-deletion facts used by the frontier/common-deletion
parent are realized exactly.

Concrete `q`-deleted selected rows are

```text
at B: {A,C,gCA,wCA}
at A: {B,C,xBC,wBC}.
```

Their intersection has cardinality one. The first row has zero strict
physical-cap hits and the second has exactly two. Thus the parent row-overlap
and exact-five `2`-versus-`<=1` marginals do not by themselves force the
missing coupling.

## Canonical escape and stuttering critical fiber

Delete `xAB`. The remaining thirteen points have the canonical profile

```text
(surplus, first opposite, second opposite) = (5,6,5).
```

The complete radius-squared-three class at `C` is the exact four-shell

```text
K_C = {A,B,xAB,yAB}.
```

It is the only K4 radius at `C`, so deleting any member destroys K4 at `C`.
The row is centered in the canonical carrier and escapes it exactly at
`xAB`. This is a literal nonlinear realization of the canonical faithful-row
escape.

Take `A` and `yAB` as two sources with common critical blocker `C`. Both lie
in `K_C`, and deleting either destroys the only K4 radius at `C`. Hence the
model also contains the complete local metric content of a two-source
deletion-critical fiber.

The escape nevertheless stutters:

```text
escape center = common blocker = C.
```

Exact enumeration of every carrier center equidistant from `A,yAB` returns
only `{C}`. Therefore no distinct-center row through both fiber sources can
exist in this carrier, regardless of selected-subrow choices.

Complete distance grouping at every carrier center finds K4 centers exactly

```text
{A,B,C}.
```

An `OrderedCrossRowCore` for this fiber needs a second row center at a strict
boundary position distinct from the first apex `B`, common blocker `C`, and
the two sources `A,yAB`. No displayed K4 center can occupy that role.

## Exact conclusion

The following data are jointly satisfiable:

- card `14` and strict convexity;
- the actual unique MEC, acute support triangle, literal cap filters, and
  cap profile `(6,6,5)`;
- genuine absence of every alternative `IsM44` support frame;
- an exact-five unique K4 radius at the physical second apex;
- an exact-six class at the first apex;
- a valid off-surplus frontier pair whose double deletion preserves K4 at
  both apices;
- concrete retained `q`-deleted rows and their sharp overlap/hit counts;
- a canonical thirteen-point `(5,6,5)` skeleton;
- an exact selected row escaping that skeleton; and
- one exact two-source deletion-critical common-blocker fiber.

But the escape is only the common-blocker row, there is no distinct center
through its fiber pair, there is no available ordered second-row center, and
there is no alternative `IsM44` packet.

Therefore the card-`>=14` route cannot be closed by more MEC/cap localization,
complete-filter bookkeeping at the displayed centers, or `noM44` alone.

## First indispensable global fact

The model fails precisely where the production parent becomes global:

```text
K4 centers in the model = {A,B,C}, not all fourteen carrier points.
```

Consequently it has no total `CriticalShellSystem` and no `D.Minimal` proof.
The first load-bearing successor must be an aggregate occurrence theorem that
uses global all-center K4 together with the fixed total critical map and
minimality to force a **non-stuttering** row/fiber alignment. A consumer-ready
contract is:

```text
from the full card-ge-14 parent and a canonical escape,
produce either
  * a critical fiber and an actual row at a distinct non-apex center
    containing both fiber sources; or
  * a complete OrderedCrossRowCore; or
  * a complete alternative IsM44 packet.
```

The proof must use rows centered outside `{first apex, second apex, common
blocker}` and couple one of them to the chosen fiber. Merely proving that more
K4 rows exist, reselecting the faithful pattern, or repeating cap localization
does not provide that incidence.

Equivalently, the first mathematical ingress still missing before either
existing terminal can fire is:

```text
exists P J,
  H.centerAt J != commonBlocker(P)
  and a terminal-compatible cross incidence between H.selectedAt J and P,
```

where “terminal-compatible” means both fiber sources for the equality-core
arm, or the full membership/equality/order fields of `OrderedCrossRowCore`.

This theorem is **CONJECTURAL / OPEN**. The exact regression proves only that
its global hypotheses are indispensable.

## Source-first terminal audit and route correction

The production global-deletion API does not apply to the exact-five branch
tested above.  The theorem

```lean
frontierPair_globalDeletion_split
```

requires

```lean
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

and hence both `6 <= S.oppCap1.card` and `6 <= S.oppCap2.card`.  The exact
model, and the live exact-five branch it guards, have
`S.oppCap2.card = 5`.  Using this split as the successor of the canonical
`(5,6,5)` escape would therefore cross a branch boundary.

The same source audit also shows that the split is not a hidden fixed-`H`
producer on its own large-opposite-cap branch:

1. On the singleton arm, the fresh deletion-critical center need not be the
   blocker chosen by the retained `H`.  Installing it requires changing the
   critical system, so it cannot silently be used as `H.centerAt J` in an
   `OrderedCrossRowCore`.
2. On the full-pair arm, production constructs a two-source
   `MinimalDeletionCore`.  Its two exact four-shells at the fresh center are
   disjoint, so
   `fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses` makes that
   center fully singleton-deletion robust.  Consequently
   `FullyDeletionRobustAt.centerAt_ne` proves that it is **not**
   `H.centerAt J` for any source `J`.  The fresh center therefore has the
   wrong polarity for the source-indexed second center of
   `OrderedCrossRowCore` or `SameCapCollisionPairCore`.
3. Neither deletion-core arm places a new carrier point on the MEC boundary
   or constructs the complete cap partition of another support triangle.
   It therefore supplies no antecedent of `SurplusCapPacket.IsM44`.

These are source-level implication checks, not merely failures of the exact
model.  In particular, the full-pair center must not be mined as the missing
actual-row center.

### Correct terminal contract for the exact-five card-`>=14` leaf

The narrow source-faithful successor remains branch-sensitive on the existing
`ExactFiveGlobalCoverStarOutcome Q profile`:

```text
14 <= D.A.card
+ full F/R/B/Q/profile
+ outcome

spoke-one or spoke-two two-hit:
  dist S.oppApex1 normal.outside1 =
    dist S.oppApex1 normal.outside2
  OR a complete alternative IsM44 SurplusCapPacket;

all rows one-hit:
  Nonempty (CriticalFiberClosingCore R)
  OR a complete alternative IsM44 SurplusCapPacket.
```

Every output is already terminal:

- the asymmetric equality is consumed by
  `SourceTwoHitNormalForm.false_of_firstApex_coRadial`;
- the all-one packet is consumed by
  `false_of_criticalFiberClosingCore`; and
- the alternative packet contradicts `R.noM44` immediately.

This is narrower than asking an arbitrary canonical escape to align with an
arbitrary preselected fiber.  It preserves the actual global-cover outcome
and asks only for the exact antecedent of a checked terminal.  Its full
`CounterexampleData`, fixed `H`, minimality, and global-cover hypotheses also
exclude the `Q(sqrt(3))` regression, which has K4 only at `A,B,C` and no total
critical system.

### Correct terminal contract for the separate large-opposite-cap leaf

For

```lean
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

the public theorem should remain direct `False`.  If
`CriticalFiberClosingCore` is used internally, the source-faithful helper is
choice-late rather than tied to the initial critical system:

```text
exists Hfav : CriticalShellSystem D.A,
  Nonempty (CriticalFiberClosingCore
    (rebaseFrontierCommonDeletionParentResidual R Hfav)).
```

The existing rebase ladder preserves the geometric parent.  A theorem that
forces a closing core for the arbitrarily chosen initial `H` is stronger than
the public contradiction and is not justified by the deletion split.  This
large-cap contract also does not resolve the exact-five leaf: its hypothesis
already excludes `S.oppCap2.card = 5`.

Epistemic status:

- **PROVEN FROM CURRENT SOURCE:** the branch mismatch and the singleton/full-
  pair polarity statements above.
- **CONJECTURED / OPEN:** both terminal-producing contracts.
- **ROUTE DECISION:** do not extend the canonical exact-five escape with
  `frontierPair_globalDeletion_split`, and do not use a full-pair
  minimal-deletion center as an actual fixed-`H` row center.

## Validation

Run from the repository root:

```bash
UV_CACHE_DIR=/private/tmp/p97-cardge14-uv-cache \
  uv run --no-project python \
  scratch/atail-force/cardge14-nonlinear-escape-geometry/verify_exact_regression.py
```

The replay uses `fractions.Fraction` for all coefficients in
`Q(sqrt(3))`; its sign procedure uses exact rational comparisons after one
squaring. It reports:

```text
carrier_card = 14
cap_profile_surplus_first_second = (6,6,5)
no_m44 = True
first_apex_after_double_deletion_card = 4
second_apex_after_double_deletion_card = 5
canonical_profile = (5,6,5)
escape_points = (xAB,)
owners_of_fiber_pair = (C,)
k4_centers = (A,B,C)
ordered_cross_row_center_candidates = ()
ALL_EXACT_QSQRT3_CHECKS_PASS
```

Epistemic label: **EXACT WITHIN THE DISPLAYED NONLINEAR SOURCE GEOMETRY;
NOT A FULL-PARENT OR PROBLEM-97 COUNTERMODEL.**
