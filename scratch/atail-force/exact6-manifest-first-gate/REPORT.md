# Exact-six manifest-first Euclidean-row gate

Date: 2026-07-18

Status: **ALL SEVEN ROLE ORBITS HAVE EXACT RATIONAL WITNESSES FOR THE
COMPLETE INITIAL EUCLIDEAN-ROW / FINITE-CAP PROJECTION.  THIS DOES NOT YET
DECIDE REALIZABILITY OF ANY LIVE FULL-PARENT ORBIT, BECAUSE STRICT CONVEX
CYCLIC ORDER, MEC/NONOBTUSE SUPPORT-TRIANGLE GEOMETRY, GLOBAL MINIMALITY,
AND `noM44` ARE DELIBERATELY NOT ENCODED.  NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-manifest-first-gate/`.

## Required theorem-bank preflight

Before constructing the finite metric object, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

A focused `nthdegree docs search --lean` query covered exact-six mutual
complete rows, blocker distinctness, physical intersections, and exact cap
identity roles.  It found the current production normal forms and consumers,
but no theorem deciding this seven-orbit initial-row surface.  The replay below
therefore tests a new bounded projection rather than reproving a banked local
consumer.

## Exact object tested

The replay starts from the kernel-checked
`ExactSixMutualCompleteRowManifest` and the seven constructors of
`ExactSixMutualRoleOrbit`.  It adds no row.  In every orbit it retains only:

1. the physical-apex complete radius class of cardinality five;
2. the continuation unused-source complete actual row;
3. the mutual-source complete actual row; and
4. the mutual-target complete actual row.

For those four rows the exact rational replay checks:

- the exact six-point physical cap and four-point cap interior;
- `physical = apexClass ∩ capInterior`, of cardinality three or four;
- every orbit identity and inequality among continuation first/second and
  mutual source/target;
- the unused source is in the cap, outside the apex class and physical set;
- every critical blocker is a distinct carrier point, differs from its own
  source and the physical apex, and the two mutual blockers differ;
- each critical support is exactly the complete carrier radius class at its
  blocker and has cardinality four;
- each row contains its actual source and omits its blocker;
- the unused row omits both continuation sources;
- the mutual rows omit one another;
- the unused-row physical intersection has size at most one;
- each mutual-row physical intersection has size at most two; and
- the two mutual supports intersect in at most two points.

All coordinates and all squared-distance comparisons are
`fractions.Fraction`; no floating-point or solver verdict is used.

## Orbit verdicts

Each constructor has an exact projection witness:

| Orbit | Physical-card witness | Projection verdict | Live full-parent verdict |
|---|---:|---|---|
| `continuationOrder` | 3 | exact witness | unresolved |
| `reverseContinuationOrder` | 3 | exact witness | unresolved |
| `sharesFirstAtSource` | 3 | exact witness | unresolved |
| `sharesFirstAtTarget` | 3 | exact witness | unresolved |
| `sharesSecondAtSource` | 3 | exact witness | unresolved |
| `sharesSecondAtTarget` | 3 | exact witness | unresolved |
| `fourDistinct` | 4 | exact witness | unresolved |

Thus **no orbit closes from the displayed complete-row equalities,
off-circle exclusions, support cardinalities, physical-hit bounds, blocker
inequalities, and exact cap identities alone**.  This is stronger than a
non-unit ideal result: each projected surface has a substituted exact
rational model.  It is weaker than a live geometric realization.

## Omitted geometry and correct interpretation

The witness treats the cap and cap interior as exact finite identity sets.
It does **not** assert that the rational points admit one strict-convex cyclic
order realizing those cap sets.  It also omits MEC containment and a
nonobtuse support triangle.  Therefore it must not be called a realization
of `FullParentExactFiveMutualData`, a `CounterexampleData` model, or even a
realization of the entire Lean manifest in its ambient indexed context.

The proof-grade conclusion is narrower:

> Any pre-row-expansion closure must consume strict convex order,
> MEC/nonobtuse support-triangle geometry, global minimality/`noM44`, or
> another concrete parent consequence.  Algebra on only the four displayed
> complete rows and their finite cap identities cannot close an orbit.

This is the exact residual to hand to a stronger geometry gate.  Additional
anonymous critical rows are not justified by this result.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/p97-manifest-first-gate-uv \
  uv run --no-project python \
  scratch/atail-force/exact6-manifest-first-gate/first_gate.py \
  --output scratch/atail-force/exact6-manifest-first-gate/results.json
```

The command exits zero only if every exact check succeeds.  The committed
`results.json` records every rational coordinate, support, role assignment,
check, and the omitted-hypothesis ledger.

Epistemic status:

- **EXACT / SUBSTITUTION-CHECKED:** all seven Euclidean-row/finite-cap
  projection witnesses;
- **UNRESOLVED:** strict-convex/MEC realizability of every live orbit;
- **NOT CLAIMED:** a production theorem, kernel proof of a live orbit, or
  closure of a source `sorry`.
