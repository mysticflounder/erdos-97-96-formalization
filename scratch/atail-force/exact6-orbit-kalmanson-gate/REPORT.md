# Exact-six mutual four-row cap-order/Kalmanson gate

Date: 2026-07-18

Status: **ALL SEVEN SOURCE-ROLE ORBITS RETAIN EXACT RATIONAL STRICT-METRIC / FULL-
KALMANSON SURVIVORS.  ALL 456 ENUMERATED PHYSICAL-CAP ORDER CELLS SURVIVE IN ONE
LEGAL WHOLE-CARRIER BLOCKER/PRIVATE-COMPLETION PLACEMENT.  THIS RULES OUT A
CONTRADICTION FROM THE FOUR DISPLAYED COMPLETE ROWS PLUS LINEAR CONVEX-ORDER
GEOMETRY ALONE.  IT IS NOT A PLANAR EUCLIDEAN, MEC, TOTAL-CRITICAL-MAP,
MINIMALITY, OR `noM44` REALIZATION.  NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-orbit-kalmanson-gate/`.  It does not edit production
Lean, shared documents, proof-blueprint state, git state, `ShellCurvature`,
`SurplusM44`, `U1LargeCapRouteBTail`, or protected certificate work.

## Required preflight

Before constructing the gate, this lane checked all registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-six mutual complete
rows, strict Kalmanson/crossing inequalities, cap-local selected-row bounds, and
the seven source-role orbits.  The search found the production
`CapCrossingKalmansonBridge` consumers and the current exact-six normal forms,
but no banked theorem deciding this aggregate four-row surface.

## Source input and cap-order quotient

The gate starts from the kernel-checked scratch results

```text
ExactSixMutualCompleteRowManifest
ExactSixMutualRoleOrbit
```

and the later kernel-checked physical-apex distribution split in
`exact6-physical-apex-distribution/ExactSixPhysicalApexDistribution.lean`.
It never adds an anonymous row.  The only equality rows are:

1. the physical-apex complete exact-five class;
2. the continuation unused-source actual critical row;
3. the mutual-source actual critical row; and
4. the mutual-target actual critical row.

Write `p0,p1` for the ordered continuation sources.  The mutual source/target
roles are respectively

| Orbit | Mutual source | Mutual target |
|---|---|---|
| `continuationOrder` | `p0` | `p1` |
| `reverseContinuationOrder` | `p1` | `p0` |
| `sharesFirstAtSource` | `p0` | `p2` |
| `sharesFirstAtTarget` | `p2` | `p0` |
| `sharesSecondAtSource` | `p1` | `p2` |
| `sharesSecondAtTarget` | `p2` | `p1` |
| `fourDistinct` | `p2` | `p3` |

For each of the first six orbits, the exact physical-cap cases are:

- physical cardinality three, unused point the unique fourth strict-cap point:
  all `4! = 24` orders;
- physical cardinality three, unused point a cap endpoint: all `4! = 24`
  interior orders, with its choice of endpoint quotiented by global boundary
  reflection; and
- physical cardinality four, unused point a cap endpoint: all `4! = 24`
  interior orders, again modulo endpoint reflection.

The `fourDistinct` orbit forces physical cardinality four, so it has only the
last 24 cases.  Total:

```text
6 * 72 + 24 = 456 physical-cap order cells.
```

This is a complete quotient of the **six-point physical cap order** for the
chosen private-completion identity cell.  It is not an enumeration of every
possible blocker cap or every identity/order partition of the unnamed support
completions.

## Corrected source-faithful carrier cell

Every cell has 21 distinct named carrier roles:

- the six physical-cap vertices;
- the opposite physical apex `o`;
- three actual blockers `bu,bs,bt`; and
- disjoint private completions for the four displayed complete rows.

The private completions are a legal identity cell, not a theorem that live
supports must be disjoint.  Choosing one legal cell is sufficient for a SAT
countermodel to the proposed linear implication; it would not be sufficient
for an UNSAT coverage claim.

The whole boundary word places all three blockers in one complementary-cap
interior.  This is deliberate: production does **not** say that either mutual
blocker lies in the physical second cap.  The fixed blocker placement is one
legal whole-carrier branch.  An UNSAT result on it would eliminate only that
branch, while a SAT result shows that the orbit survives the tested linear
surface.

The physical-apex completions use the corrected kernel split:

- in physical cardinality three, one exact-five completion lies in each cap
  adjacent to `o`; and
- in physical cardinality four, the single completion lies in their union.

The gate also checks the production cap-local selected-row bounds in this
placement:

- the physical apex, an endpoint of both adjacent caps, has at most one shell
  hit in each adjacent cap (exactly one each in the card-three arm); and
- each blocker is a strict interior point of its chosen complementary cap and
  its actual critical support has at most two hits in that same cap.

Thus the earlier invalid draft with both card-three apex completions on one
side of `o` is not part of this result.

## Exact linear system

For every cell, `orbit_kalmanson_gate.py` quotients the 210 abstract distance
terms by exactly the four displayed row-equality classes.  It then imposes:

- positive distance for every distinct named pair;
- all `3 * C(21,3) = 3,990` strict triangle inequalities;
- both strict Kalmanson inequalities for every increasing cyclic quadruple,
  `2 * C(21,4) = 11,970` inequalities;
- every named-point off-radius exclusion for all four complete rows; and
- a pairwise-distinct off-class distance cell at `o`, which in particular
  satisfies the profile's unique-K4-radius condition on the named carrier.

All strict inequalities are normalized to unit slack.  HiGHS is used only to
discover a rational branch.  Every reported model is scaled, reconstructed as
`fractions.Fraction`, and substituted back into every inequality and row
condition.  The committed independent verifier does not call HiGHS or Z3.

Solver guardrails:

- a hand-checkable strict-Kalmanson four-point ledger is replayed;
- a Z3 smoke gate verifies the ordinal corollary by making its negation UNSAT;
- SAT models are independently substituted into the original named-distance
  formulas; and
- `unknown` is fail-closed and would make the census command exit nonzero.

## Verdict

| Orbit | Cells | SAT | UNSAT | UNKNOWN |
|---|---:|---:|---:|---:|
| `continuationOrder` | 72 | 72 | 0 | 0 |
| `reverseContinuationOrder` | 72 | 72 | 0 | 0 |
| `sharesFirstAtSource` | 72 | 72 | 0 | 0 |
| `sharesFirstAtTarget` | 72 | 72 | 0 | 0 |
| `sharesSecondAtSource` | 72 | 72 | 0 | 0 |
| `sharesSecondAtTarget` | 72 | 72 | 0 | 0 |
| `fourDistinct` | 24 | 24 | 0 | 0 |
| **Total** | **456** | **456** | **0** | **0** |

`results.json` banks one complete exact rational distance ledger per orbit.
The independent replay reports minimum triangle and Kalmanson margins at least
`33554431999 / 33554432`, in particular strictly greater than one.

This is exact, exhaustive over the displayed 456 physical-cap order cells, and
substitution-checked inside the stated abstract-distance system.  It does not
assert that any ledger is a Euclidean distance matrix.

## Consequence for closure

No one of the seven mutual-role orbits can be closed from the four displayed
complete rows, their exact named exclusions, the corrected cap distribution,
cap-local hit bounds, strict metric axioms, and all linear Kalmanson/crossing
inequalities alone.  Enlarging this same linear quotient or mining Farkas cores
from it is not load-bearing after exact survivors exist in every orbit.

The first missing input is nonlinear/global:

1. one planar Euclidean rank-two realization of the named rows and boundary
   word (or a certified obstruction to it);
2. MEC containment, the nonobtuse support triangle, and cap-segment geometry;
3. the total critical-shell map at sources beyond the three displayed actual
   rows, retaining full-fiber provenance; or
4. global minimality / `noM44`.

The next bounded gate should keep one banked source-role/cap-order cell and add
coordinate variables plus strict-convex orientation determinants.  If that is
SAT, add the MEC block to the same cell.  A numerical `unknown` or bare nonlinear
UNSAT is not a proof; an UNSAT route needs an exact algebraic certificate and an
occurrence theorem, while a SAT hit must be substituted and then audited against
the omitted parent fields.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/p97-exact6-orbit-kalmanson-uv \
  uv run python \
  scratch/atail-force/exact6-orbit-kalmanson-gate/orbit_kalmanson_gate.py \
  --jobs 1 \
  --output \
  scratch/atail-force/exact6-orbit-kalmanson-gate/results.json

UV_CACHE_DIR=/tmp/p97-exact6-orbit-kalmanson-uv \
  uv run python \
  scratch/atail-force/exact6-orbit-kalmanson-gate/verify_results.py \
  scratch/atail-force/exact6-orbit-kalmanson-gate/results.json
```

Epistemic status:

- **PROVEN / KERNEL-CHECKED INPUT:** seven source-role orbits and the corrected
  physical-apex cap-distribution split, from sibling scratch Lean files;
- **EXACT / EXHAUSTIVE WITHIN THE STATED LRA CELL FAMILY:** 456/456 SAT;
- **EXACT / SUBSTITUTION-CHECKED:** one full rational witness per orbit;
- **NOT PROVED:** planar Euclidean or MEC realizability of any witness;
- **NOT ENUMERATED:** every blocker/private-completion identity and carrier
  order; and
- **PRODUCTION `sorry` CLOSED:** none.
