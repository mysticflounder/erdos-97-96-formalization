# Exact-six named-blocker `no_qfree_at` semantic gate

Date: 2026-07-18

Status: **ALL SEVEN EXACT-SIX MUTUAL ROLE ORBITS SURVIVE THE COMPLETE
ALL-RADIUS DELETION-CRITICAL SEMANTIC AT EACH OF THE THREE ACTUAL NAMED
BLOCKERS.  ZERO ORBITS ARE ELIMINATED.  THE SMALLEST NEXT OMITTED FORCE IS
THE TOTAL ALL-CENTER K4 / ALL-SOURCE BLOCKER-MANIFEST COMPLETION, NOT ANOTHER
LOCAL EXACT-ROW OR `no_qfree_at` CONDITION.  NO PRODUCTION `sorry` IS
CLOSED.**

This lane owns only
`scratch/atail-force/exact6-noqfree-semantic-gate/`.  It does not edit
production Lean, shared docs, proof-blueprint state, git state,
`ShellCurvature`, `SurplusM44`, `U1LargeCapRouteBTail`, or other scratch
lanes.

## Question tested

The predecessor exact-six manifest gate retained the complete represented
radius class at four centers:

1. the physical second apex, whose class has cardinality five;
2. the continuation unused source's actual critical blocker;
3. the mutual source's actual critical blocker; and
4. the mutual target's actual critical blocker.

Ambient exactness of a represented critical class is weaker than
`CriticalShellSystem.no_qfree_at`.  Exactness says no fifth point occurs at
the represented radius.  `no_qfree_at source` says that after deleting the
actual source, **no positive radius at the actual blocker has four points**.

This lane adds exactly that missing semantic at the three actual critical
blocker rows already named by `FullParentExactFiveMutualData`.  It adds no
anonymous row, no invented center, no invented source, and no literal metric
core occurrence.

## Kernel-checked live manifest

`ExactSixNoQFreeSemanticGate.lean` proves

```lean
all_positive_radius_classes_card_lt_four
exactSixMutualNamedBlockerSemanticManifest
```

The first theorem unfolds the semantic content of a blocked deletion:

```lean
not HasNEquidistantPointsAt 4 (A.erase source) blocker
  -> forall r > 0,
       ((A.erase source).filter
         (fun point => dist blocker point = r)).card < 4.
```

The second theorem applies that result to exactly the live sources and
centers:

- `M.continuation.unusedRow.unused.point` at its retained `H.centerAt`;
- `M.pair.source` at its retained `H.centerAt`; and
- `M.pair.target` at its retained `H.centerAt`.

All three facts come directly from the same retained
`CriticalShellSystem H` through `H.no_qfree_at`.  The theorem also retains
`S.oppCap2.card = 6`, so its statement sits on the same seven-orbit boundary
as the finite gate.  It introduces no conditional producer.

Warnings-as-errors elaboration succeeds, and both printed declarations have
axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `native_decide`, or external solver in
this kernel result.

## Exact finite gate

`noqfree_gate.py` reuses each exact rational carrier from
`exact6-manifest-first-gate` and, for each of the three represented actual
critical blocker rows:

1. deletes the actual named source;
2. enumerates every remaining carrier point;
3. partitions all points at positive squared distance from the actual named
   blocker into complete exact rational distance classes;
4. checks the represented critical class is exactly the three retained
   support points; and
5. checks every positive-radius class has cardinality less than four.

All arithmetic is `fractions.Fraction`.  There is no floating-point
tolerance and no SAT/SMT/CAS verdict.  `results.json` stores the complete
class ledger, including coordinates and exact squared radii, for every
blocker in every orbit.

## Exact verdict

| Role orbit | Named blockers tested | Largest class after source deletion | Verdict |
|---|---:|---:|---|
| `continuationOrder` | 3 | 3 | survives |
| `reverseContinuationOrder` | 3 | 3 | survives |
| `sharesFirstAtSource` | 3 | 3 | survives |
| `sharesFirstAtTarget` | 3 | 3 | survives |
| `sharesSecondAtSource` | 3 | 3 | survives |
| `sharesSecondAtTarget` | 3 | 3 | survives |
| `fourDistinct` | 3 | 3 | survives |

Thus the exact count is:

```text
eliminated role orbits = 0
surviving role orbits  = 7
```

For every blocker/orbit pair, deletion leaves twenty carrier points.  There
are seventeen positive-radius classes: one class of cardinality three (the
represented critical shell after deleting its source) and sixteen singleton
classes.  This is a complete exact replay of all positive radii in the finite
projection, not a sample.

## Rigor boundary

This result is **EXACT WITHIN THE NAMED-ROW / FINITE-CARRIER PROJECTION**.  It
does not prove that any orbit is realizable by `FullParentExactFiveMutualData`
or `CounterexampleData`.

The projection still omits:

- global K4 rows at every carrier center;
- critical rows and `no_qfree_at` manifests for every unnamed carrier source;
- one strict-convex cyclic boundary order;
- MEC containment and nonobtuse support-triangle geometry;
- global minimality and `noM44`.

The exact diagnostic makes the first omission visible.  Each rational
witness has twenty-one carrier points, but only four centers have any
four-point positive-radius class: the physical apex and the three represented
blockers.  The other seventeen centers fail global K4.  Therefore these
witnesses cannot be promoted to live countermodels.

The proved conclusion is narrower and decisive for route selection:

> Full all-radius deletion-criticality at the three currently named blockers
> adds no force beyond the existing seven-orbit projection.  Another local
> exact-row or named-blocker `no_qfree_at` lemma cannot close the exact-six
> mutual branch.

## Smallest next missing ingredient

The next source-faithful gate must use the existing
`WholeCarrierBiApexKalmansonSurface` and `BlockerRowManifest` at their **total**
scope:

1. one actual selected K4 row at every actual carrier center;
2. one actual `H.centerAt source` blocker row for every actual carrier source;
3. complete support exactness and `H.no_qfree_at source` at every such row;
4. the same source identities, cap roles, cyclic order, and parent data.

That is a total-map completion problem, not permission to append anonymous
rows.  The smallest new terminal producer would be a forced cross-row
incidence/comparison cycle from this total completion.  If the total object
still admits a source-faithful model, the next missing force is genuinely
MEC/nonobtuse or global minimality geometry.

## Theorem-bank preflight

Before constructing the gate, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered `CriticalShellSystem.no_qfree_at`,
blocker source deletion, all K4 radii, `FullParentExactFiveMutualData`,
`WholeCarrierBiApexKalmansonSurface`, and `BlockerRowManifest`.  The closest
current declarations are the production `no_qfree_at` theorem and the
scratch `BlockerRowManifest`; neither gives a terminal consumer for the
three-row exact-six mutual surface.  No banked theorem was rederived.

## Reproduction

Exact finite replay:

```bash
UV_CACHE_DIR=/tmp/p97-noqfree-uv uv run --no-project python \
  scratch/atail-force/exact6-noqfree-semantic-gate/verify.py
```

Expected terminal:

```text
EXACT6_NAMED_NO_QFREE_GATE_REPLAY_PASS
orbits = 7; eliminated = 0; survived = 7
named blockers per orbit = 3; maximum deleted radius class = 3
global K4 remains omitted and false in the diagnostic witnesses
```

Lean gate:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact6-noqfree-semantic-gate/\
ExactSixNoQFreeSemanticGate.lean
```

Epistemic summary:

- **PROVEN / KERNEL-CHECKED:** the live exact-six mutual packet retains
  complete all-positive-radius deletion-criticality at its three named
  blockers.
- **EXACT / EXHAUSTIVE WITHIN THE FINITE PROJECTION:** all seven role orbits
  have rational witnesses satisfying that semantic at all three named
  blockers.
- **NOT PROVED:** any live geometric orbit exists or is impossible.
- **PRODUCTION `sorry` CLOSED:** none.
