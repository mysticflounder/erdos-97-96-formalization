# Exact-five `allRowsOneHit` terminal audit

Date: 2026-07-21

Status: **EXACT FINITE-METRIC REGRESSION. NO SOURCE `sorry` CLOSED.**

## Result

No existing theorem-bank declaration closes
`ExactFiveGlobalCoverStarOutcome.allRowsOneHit star hall` from the supplied
parent data. The accompanying verifier checks an exact 13-point model
satisfying all currently extracted finite-metric consequences while admitting
neither constructor of `CriticalFiberClosingCore R`.

This is not a planar Euclidean/MEC model and therefore is not a Problem 97
counterexample. Its purpose is narrower: it rules out a terminal proof using
only K4, exhaustive subset minimality, the fixed total singleton-critical map,
the two robust apices, the exact-five profile, retained rows, cap-cardinality
and pairwise circle/cap-hit shadows, and the two global cover-star edges.

## Exact verified model

- carrier cardinality: 13;
- abstract closed-cap cardinalities: `(5,6,5)`;
- exact-five physical triple: `{0,1,2}`;
- robust apices: `11,12`, with unique displayed classes of sizes `6,5`;
- retained pair: `q=3`, `w=5`;
- cover star: hub `0`, spokes `1,2`;
- all three physical actual critical rows are one-hit;
- the fixed critical map is total and singleton-critical;
- there is no proper nonempty witness-closed subset;
- the sole nontrivial fixed-map fiber is `{0,11,12}` at center `10`;
- no distinct second row contains two members of that fiber; and
- no member of that fiber has a distinct first-apex co-radial partner, so the
  ordered closing-core constructor cannot start either.

The verifier uses exact `Fraction` arithmetic and checks symmetry, positivity,
strict triangle inequalities, complete radius classes, and every assertion
above exhaustively.

## First missing source-level implication

An actual closer must use planar rank-two Euclidean geometry, MEC boundary
structure, or the no-`(m,4,4)` hypothesis to prove one of the already-terminal
occurrences:

1. `Nonempty (CriticalFiberClosingCore R)`, including all fields of one
   existing constructor; or
2. a genuine alternative MEC support packet `T` with `T.IsM44`.

The star itself supplies only negative incidence: for each star edge and each
carrier center, at least one endpoint deletion preserves K4. In a unique
exact-four critical row this forbids that row from containing both edge
endpoints. It does not create the positive cross-membership, second bisector
center, first-apex co-radial pair, cyclic order, or MEC-boundary vertex needed
by either terminal.

The narrowest honest next theorem is therefore the following occurrence
statement. It is **CONJECTURED**, not proved:

```lean
theorem closingCore_or_alternativeM44_of_exactFive_allRowsOneHit
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) :
    Nonempty (CriticalFiberClosingCore R) ∨
      ∃ T : SurplusCapPacket D.A, T.IsM44
```

Weakening this to another conditional packet or bare star-incidence lemma
would not advance the live terminal.

## Preflight and replay

The required current and legacy theorem-bank registries and focused
`nthdegree docs search --lean` queries were checked. They contain the known
closing-core consumers and source-unit/metric kernels, but no occurrence
producer for this exact-five all-one parent.

Replay from the repository root:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project \
  scratch/atail-force/exact5-all-one-finite-metric-regression/verify.py
```

Expected output begins:

```text
PASS exact-five allRowsOneHit finite-metric regression
```
