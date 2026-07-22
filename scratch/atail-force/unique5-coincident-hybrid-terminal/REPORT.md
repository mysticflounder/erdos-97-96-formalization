# Exact-five coincident-blocker hybrid terminal audit

Date: 2026-07-22

Status: **NO DIRECT `False`. THE UNIFORM KALMANSON COUNTERFAMILY IS
EXCLUDED BY PLANARITY, BUT THE LIVE FIRST-CAP HIT SURFACE REMAINS FEASIBLE
IN THE FULL LINEAR METRIC/KALMANSON RELAXATION. THE FIRST MISSING THEOREM IS
THE EXISTING DIRECT JOINT-DELETION CLOSING STATEMENT, AND IT MUST USE GLOBAL
K4/TOTAL-CRITICAL-SYSTEM/MEC OR `noM44` INFORMATION.**

This lane owns only
`scratch/atail-force/unique5-coincident-hybrid-terminal/`.  It changes no
production Lean, shared closure document, or proof-blueprint state.

## Exact source target

The source-clean predecessor
`../unique5-coincident-direct-false/CoincidentBlockerContinuation.lean`
constructs, unconditionally from

```lean
R : OriginalUniqueFiveCoincidentBlockerResidual F
```

the chain

```lean
L : CoincidentBlockerFreshCommonDeletion R
C : CoincidentBlockerMutualOmissionCycle R L
J : CoincidentBlockerJointDeletion R L C.
```

The terminal-grade target is already declared there:

```lean
def CoincidentBlockerJointDeletionClosingStatement
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : Prop :=
  forall (L : CoincidentBlockerFreshCommonDeletion R)
    (C : CoincidentBlockerMutualOmissionCycle R L),
      CoincidentBlockerJointDeletion R L C -> False
```

and

```lean
false_of_jointDeletionClosingStatement
```

turns a proof of it into `False` for the original coincident-blocker leaf.
This audit does not replace that goal with another occurrence packet.

## Theorem-bank and source preflight

Before testing a new local contradiction, the required registries were
checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered exact-five coincident blockers, joint deletion
at three centers, outside-pair uniqueness, ordered cross rows,
`CriticalFiberClosingCore`, and alternative `IsM44` packets.  No banked
theorem consumes the present joint-deletion packet to `False`.

The closest general production reduction is
`RetainedSourceReturnJointDeletion.nonempty_u5Ingress`, but it only converts
a three-center joint deletion into one dangerous triple, two q-deleted rows,
and the source's own q-critical row.  It is another nonterminal mining
surface, not a closer, and its parent interface is different.  Rebuilding
that adapter here would not advance the proof.

## What the current source already forces

Write

```text
O = S.oppApex1
A = the common actual blocker of q and w
J = L.fresh
X = the actual blocker of J
T = the complete exact-five O-radius class
KX = the exact critical support selected at J.
```

The checked continuation gives:

- `q,w,J` are distinct members of `T` in the strict first-cap interior;
- `A` is in that strict interior and is equidistant from `q,w`;
- the common exact critical support meets the first closed cap exactly in
  `{q,w}`;
- `X` is distinct from `O,A`, and `KX` contains `J`;
- `KX` cannot contain both `q,w`;
- one source of `T` is omitted by both the common support and `KX`, and its
  deletion leaves K4 witnesses at the three distinct centers `O,A,X`.

The cap split for `X` is exact:

```text
X in the first closed cap,
or X in the strict surplus-cap interior,
or X in the strict second-opposite-cap interior.
```

The adjacent audit
`../unique5-coincident-othercap-terminal/REPORT.md` proves at the mathematical
source level that either other-cap location forces

```text
q notin KX and w notin KX
```

by `CapSelectedRowCounting.outsidePair_unique_capCenter`.  Thus the only
possible positive hit of an original source by `KX` occurs on the first-cap
arm.

## Audit of the uniform non-Euclidean counterfamily

The even-card uniform Kalmanson counterfamily does not survive the full
ambient type `D.A : Finset R^2`.  Already on four consecutive labels its
centered Gram determinant is

```text
-36 * (n - 7)^2 * (n - 8)^2 * (8*n - 55)^2,
```

which is strictly negative for every even `n >= 12`.  The card-twelve
instance has determinant `-24,206,400`.  Therefore the first full source
field excluding that family is ordinary Euclidean planarity, before MEC,
minimality, or the critical system is used.

The corresponding general Lean bridge already exists and is source-clean:

```lean
Problem97.PlanarRankTwoDistanceIdentityScratch
  .false_of_six_distance_squares_of_determinant_ne_zero
```

in
`../planar-rank-two-distance-identity/PlanarRankTwoDistanceIdentity.lean`.
There is no reason to duplicate it.

This observation is not a closure route for the live residual.  The exact
rational 26-point construction in
`../full-parent-t0t1-exact-model/REPORT.md` realizes substantially stronger
local Euclidean, convex-order, MEC/cap, and selected-row data.  It is rejected
by global `D.K4` at twenty of its twenty-six vertices and independently lacks
a total deletion-critical system.  A universal closer must therefore couple
the full carrier/global K4/total `H` to the geometry; a four-point planarity
minor of the old abstract family is not enough.

## Exact first-cap Kalmanson boundary

`check_first_cap_kalmanson_boundary.py` tests the strongest natural
six-role linear completion of a positive first-cap hit.  It enumerates cyclic
orders of distinct roles `O,A,X,J,q,w`, fixes reflection by `q < A < w`, and
adds:

```text
d(O,J) = d(O,q) = d(O,w)
d(A,q) = d(A,w)
d(X,J) = d(X,K), where K is q or w
```

together with positivity, every metric triangle inequality, and both strict
Kalmanson inequalities for every cyclic quadruple.  Strict slacks are
homogeneously normalized to at least one.

For the first-cap branch, endpoint-chain monotonicity requires `X` to lie
between the two equal-distance points `J,K`.  Among the resulting fourteen
order/hit types, the exact result is:

```text
10 SAT
 4 UNSAT
```

Every SAT assignment is rational and is independently replayed with
`fractions.Fraction` outside Z3.  Thus even metric triangle inequalities plus
the complete strict Kalmanson system do not derive a contradiction on the
first-cap positive-hit branch.

As a regression check, all sixteen order/hit types with `X` outside the
first-cap role block are UNSAT.  That agrees with the stronger source theorem
using outside-pair uniqueness, but these UNSAT verdicts are solver evidence,
not exported certificates and are not used as Lean facts.

Run and replay:

```bash
UV_CACHE_DIR=/tmp/p97-unique5-hybrid-uv \
uv run --no-project --with z3-solver python \
  scratch/atail-force/unique5-coincident-hybrid-terminal/\
  check_first_cap_kalmanson_boundary.py \
  --check \
  --output /tmp/p97-unique5-kalmanson-replay.json

cmp /tmp/p97-unique5-kalmanson-replay.json \
  scratch/atail-force/unique5-coincident-hybrid-terminal/\
  kalmanson_boundary_result.json
```

Expected audit digest:

```text
9e02097ac55ff5cf60af89f1a160363021806a97f4f187b2f0553fabb3e79682
```

Artifact SHA-256 values:

```text
7d2c1baba7fe0080e790a82d4af4ac73db7a530eff8c0062d20d7d283f7760aae  checker
f504f2986eb8912648ce103b76312aaef6c7a9adfdeb6ebf4fc3ca1096780aae  result
```

This result is **EXACT WITHIN RATIONAL METRIC/KALMANSON LRA**.  It is not a
Euclidean realization, does not construct `CounterexampleData`, and does not
refute the Lean residual.  It does refute any claimed proof of the first-cap
hit branch that uses only these equalities, triangle inequalities, and
convex-quadrilateral linear inequalities.

## Why no new Lean adapter was added

The remaining elementary consequences are all nonterminal:

- other-cap location gives omit-two;
- first-cap positive hit gives an ordered six-role surface, but ten exact
  linear survivors remain;
- first-cap omit-two gives only more negative incidence; and
- joint deletion converts to a U5 ingress, whose producer is still missing.

Adding any of those as a new structure would only move the same gap one name
downstream.  The reusable planarity theorem and the complete source-valid
joint-deletion construction are already kernel checked.  No additional Lean
declaration in this lane would be both new and terminal-grade.

## First exact missing theorem

The first missing statement remains exactly:

```lean
theorem false_of_coincidentBlockerJointDeletion
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (L : CoincidentBlockerFreshCommonDeletion R)
    (C : CoincidentBlockerMutualOmissionCycle R L)
    (J : CoincidentBlockerJointDeletion R L C) : False
```

Equivalently, prove `CoincidentBlockerJointDeletionClosingStatement R`.
Unlike another row adapter, this target retains every load-bearing input:

- the full carrier and its global K4 property;
- the fixed total deletion-critical system `H`;
- convex/MEC/cap geometry;
- minimality;
- `noM44`; and
- the concrete three-center joint deletion.

The exact occurrence it must force is one already consumed by the production
terminals:

1. a source-faithful second center in one cap through a common outside pair;
2. an order-compatible cross membership for an ordered Kalmanson terminal;
3. a complete alternative `SurplusCapPacket` satisfying `IsM44`; or
4. `False` directly from the global packet.

The present audits show why the theorem must quantify beyond the six named
roles: planarity kills the old abstract uniform family, while local
Euclidean/MEC geometry still has a 26-point realization and the surviving
first-cap linear order types are rationally feasible.  The next proof attempt
should start from a genuinely additional source selected by global K4/`H`,
not from another rearrangement of `O,A,X,J,q,w`.

## Validation

The existing source interface was re-elaborated with warnings as errors:

```text
CoincidentBlockerContinuation.lean: PASS
```

Every printed declaration, including
`CoincidentBlockerJointDeletionClosingStatement` and
`false_of_jointDeletionClosingStatement`, reports only:

```text
propext, Classical.choice, Quot.sound
```

The generic planar determinant file was also re-elaborated with warnings as
errors and reports the same three axioms.  Neither file reaches `sorryAx`.

This checkpoint closes no source `sorry`; it removes the local linear route
from consideration and fixes the next goal at the direct global
joint-deletion consumer.
