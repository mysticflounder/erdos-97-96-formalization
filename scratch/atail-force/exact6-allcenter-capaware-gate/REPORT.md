# Exact-six all-center cap-aware gate

Date: 2026-07-18

Status: **SEVEN CORRECTED ORBITS REMAIN `UNKNOWN` UNDER A 180-SECOND
BOUND.  EVERY EXAMINED POST-BANK CANDIDATE IS EXACT-LRA `UNSAT`.  TWO
INDEPENDENT CORE-MINING ROUNDS PRODUCED 30 COMPACT CANONICAL SCHEMAS, BUT
THE COMPACT FRONTIER GREW FROM 8 TO 22 NEW FAMILIES AND IS NOT SATURATING.
NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-allcenter-capaware-gate/`.  It made no production
Lean, closure-plan, or git edit.  One accidental `lake-build --help`
invocation refreshed the shared generated `docs/live-blueprint.md` against
the current concurrent source tree; this lane did not stage, rewrite, or
revert that shared generated file.

## Scope and epistemic boundary

`allcenter_gate.py` is the n=14 `(5,6,6)` retained-subsystem gate for the
seven constructors of `ExactSixMutualRoleOrbit`.  It is not a full-parent
model and does not claim a planar counterexample.

The Boolean outer retains:

1. one selected K4 row at every one of the 14 actual carrier centers;
2. one total source-indexed actual blocker at every source;
3. blocker-row locking through the one global row table;
4. both physical apices omitted from the blocker image;
5. the exact contiguous `(5,6,6)` cap blocks and per-cap row-hit bounds;
6. the exact-five second-apex class with the corrected exact-six card-three
   or card-four physical distribution;
7. the continuation unused source in the closed physical cap and outside
   the exact-five shell;
8. the complete named unused/source/target critical-row incidence fields;
9. the intrinsic mutual source/target blocker distinctness supplied by
   `mutualBlockers_ne`; and
10. selected-witness strong connectivity, enforced by lazy sink-SCC cuts.

The exact metric phase adds all positive-distance, strict triangle, and both
strict Kalmanson inequalities.  If a linear survivor is found, the semantic
phase then enforces the full exact blocker-radius filter and true
`no_qfree_at` at every source.  If that survives, the script replays the
exact rational model and sends its Euclidean equality ideal to msolve in two
variable orders and Singular over `QQ`.

The gate deliberately omits:

- rank-two Euclidean coordinate realization beyond the equality ideal;
- MEC containment and nonobtuse support-triangle inequalities;
- `noM44` alternate-support-triangle quantification;
- full first-apex robustness, its frontier radius, and retained
  double-deletion rows;
- minimality beyond selected-witness strong connectivity; and
- the classification of the continuation-unused blocker against the
  oriented partner blocker.

Accordingly, a future SAT result is labeled only

```text
SAT_VERIFIED_EXACT6_MUTUAL_RETAINED_SUBSYSTEM_ABSTRACT_DISTANCE_SHADOW
```

and the independent verifier rejects the former full-source-faithful SAT
overclaim.

## Source-faithful Lean inputs

The search surface is justified by existing scratch kernel interfaces:

- `../exact6-uniform-core-occurrence/ExactSixUniformCoreOccurrence.lean`
  supplies `exactSixMutualCompleteRowManifest` and the seven-role orbit;
- `../selected-row-strong-connectivity/SelectedRowStrongConnectivity.lean`
  supplies `exists_selectedRow_escape_of_minimal`; and
- the production all-center row/blocker extractors supply the global K4 row
  table and `BlockerRowManifest` surface.

The first two files pass direct warnings-as-errors validation from the Lean
workspace.  Their printed axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

No scratch theorem in this lane depends on `sorryAx`.

## Verified starting bank

The prior exact 2-Kalmanson/3-row bank contains 203 independently replayed
Farkas certificates grouped into 20 canonical five- or six-role schemas.
Their complete increasing/reflected n=14 closure has 102,102 distinct
six-membership applications, not the retired 1.68-million-cut literal bank.

`transported_2k3_bank.replay.json` independently checks:

```text
certificate count                 203
canonical schema count             20
all row memberships replayed       yes
all rational coefficients cancel   yes
all canonical schemas rebuilt      yes
```

SHA-256:

```text
72df9d11eaf5c53c174b35a7b2b6fcc6b75eb88e14eb2d32a6b151d5cd0ed9d4
```

## Baseline seven-orbit run

Each orbit received the full 102,102-application bank and a 180-second wall
budget.  Every decoded candidate that reached the exact linear oracle was
`UNSAT`; no linear, semantic, or CAS survivor was produced.

| orbit | attempts | exact-LRA UNSAT candidates | online transported applications | verdict |
| --- | ---: | ---: | ---: | --- |
| `continuationOrder` | 83 | 82 | 30,222 | `UNKNOWN` |
| `reverseContinuationOrder` | 75 | 74 | 32,750 | `UNKNOWN` |
| `sharesFirstAtSource` | 57 | 56 | 14,058 | `UNKNOWN` |
| `sharesFirstAtTarget` | 107 | 106 | 23,382 | `UNKNOWN` |
| `sharesSecondAtSource` | 43 | 42 | 24,908 | `UNKNOWN` |
| `sharesSecondAtTarget` | 54 | 53 | 22,630 | `UNKNOWN` |
| `fourDistinct` | 52 | 51 | 18,256 | `UNKNOWN` |

`baseline_marco.replay.json` reconstructs all 464 stored exact metric cores,
all shell conditionings, all generalized schemas, and the complete original
bank closure.  It reports `VERIFIED`.

This is not structural exhaustion.  `UNKNOWN` means timeout after the listed
attempts.

## Exact offline deletion minimization

The online wall budget leaves many cores unnecessarily large.  The offline
minimizer therefore ran four deterministic deletion orders per shell-free
core in independent single-process shards.  Every emitted core was checked
again for exact-LRA `UNSAT`, and every one-constraint deletion was checked
for exact-LRA `SAT`.

### Round one

From the 82 `continuationOrder` cores, 76 were shell-free.  Exact minimization
produced 76 unique canonical schemas.  Eight were compact (`k <= 8`):

```text
k = 5: 1
k = 6: 2
k = 7: 1
k = 8: 4
```

Their union contributes 23,078 concrete n=14 applications, with zero overlap
with the original 102,102 applications.  On the stored baseline cores, these
eight schemas directly cover 15 of 464 exact cores: 8 in
`continuationOrder` and 7 spread over five other orbits.  This is a lower
bound because only the stored core memberships, not each complete decoded
row table, are used by the coverage audit.

### Compact-eight replay

The same seven corrected orbits were rerun for 180 seconds with the first
eight compact schemas preloaded:

| orbit | attempts | exact-LRA UNSAT candidates | verdict |
| --- | ---: | ---: | --- |
| `continuationOrder` | 46 | 45 | `UNKNOWN` |
| `reverseContinuationOrder` | 21 | 20 | `UNKNOWN` |
| `sharesFirstAtSource` | 58 | 57 | `UNKNOWN` |
| `sharesFirstAtTarget` | 15 | 14 | `UNKNOWN` |
| `sharesSecondAtSource` | 19 | 18 | `UNKNOWN` |
| `sharesSecondAtTarget` | 37 | 36 | `UNKNOWN` |
| `fourDistinct` | 18 | 17 | `UNKNOWN` |

Again every examined candidate was exact-LRA `UNSAT`, and no orbit
exhausted.  The reduced attempt counts are not a proof of stronger coverage:
the additional clauses also make each outer solve more expensive.

### Round two and convergence verdict

Of the 207 compact-eight-run cores, 187 were shell-free.  Exact minimization
produced 187 unique schemas, including 22 new compact families:

```text
k = 5: 3
k = 6: 5
k = 7: 6
k = 8: 8
```

Those 22 families have 89,100 concrete applications.  Only 420 overlap the
round-one compact applications, and none overlap the original 20-schema
bank.  Thus round two adds 88,680 genuinely new applications.

The combined exact bank contains:

```text
deletion-minimal exact cores        263
unique canonical schemas           263
compact schemas with k <= 8          30
compact n=14 applications       111,758
overlap with original bank             0
original + compact union         213,860
```

This is evidence against bank saturation: the second pass found 22 new
compact families after the first eight were already active.  Literal
schema-by-schema enumeration is therefore not presently a convergent closure
route.

`combined_round1_round2_minimized_schema_bank.replay.json` independently
checks all 263 cores, all 263 deletion-minimality claims, all source hashes,
and every canonical transport.  It reports `VERIFIED`.

## Combined-CNF and shell/row alternation follow-up

The dedicated deterministic CNF run with all 213,860 original-plus-compact
applications is SAT in all seven role orbits.  The first assignment revealed
one omitted source-valid necessary family: the complete physical-apex
exact-five shell and a selected row cannot share two target points when their
centers lie on the same boundary arc determined by those targets.  In the
normalized endpoint-center order, the complementary strict Kalmanson
inequality cancels directly against the two radius equalities.

The generic raw-equality theorem and its selected-row/complete-`SelectedClass`
adapter are kernel-checked in
`../exact5-shell-selected-row-alternation/`.  `allcenter_gate.py` now contains
the corresponding mixed shell/row alternation constraints in addition to the
older selected-row/selected-row family.

Adding all 572 instances removes the motivating assignment but does not close
an orbit.  Regeneration plus full assignment substitution gives SAT in all
seven strengthened combined CNFs, with 331,193--331,233 clauses.  The next
continuation assignment is accepted by the pinned active outer and is exact-
LRA UNSAT by a shell-free five-`K2`, four-row telescoped core requiring eleven
memberships.  This is not another missing local source clause.  It reinforces
the aggregate positive-dual target and the decision to stop broad literal
schema enumeration.

## What this establishes

**Exact within the retained linear model:**

- the old 20-schema bank is not complete for the corrected all-center
  surface;
- every one of 464 baseline and 207 compact-eight-run candidates examined
  by the linear oracle is inconsistent with strict triangle/Kalmanson
  geometry;
- 30 compact, exact, deletion-minimal schema families have been extracted
  and independently replayed; and
- all seven role orbits remain unresolved under the bounded outer search.

**Not established:**

- structural UNSAT for any role orbit;
- a planar Euclidean/MEC survivor;
- a full-parent contradiction;
- the direct `false_of_largeOppositeCapsBiApexRobust` producer;
- K-A-PAIR; or
- closure of any production `sorry`.

## Recommended next move

Do not spend another broad round enumerating linear membership schemas in
this Python/Z3 loop.  The combined-CNF test has been completed and remains
SAT even after the proved mixed shell/row family.  The next proof-facing steps
are:

1. decide the corrected Boolean and distance variables together in one
   integrated QF_LRA model, omitting the literal cut bank;
2. if that system is UNSAT, extract a finite weighted-cut cover, validate each
   cut with the kernel-checked typed certificate checker, and regenerate a
   terminal DRAT/LRAT proof; or
3. prove the variable-card positive-dual/Kalmanson coverage theorem that
   turns selected-row strong connectivity into the contradiction uniformly.

If a combined-bank candidate finally becomes full-LRA SAT, the next oracle
must be the existing exact semantic and nonlinear Euclidean/MEC/CAS gate.
Adding more cap-local or anonymous selected-row consumers is not indicated.

## Authoritative artifacts

- `allcenter_gate.py` — corrected all-center gate;
- `verify.py` — independent result/cut replay;
- `minimize_metric_cores.py` — deterministic exact deletion minimizer;
- `verify_minimized_schema_bank.py` — independent exact core and canonical
  transport verifier;
- `combined_round1_round2_minimized_schema_bank.json` — complete 263-schema
  bank; use `--learned-max-k 8` for the 30 compact families;
- `combined_round1_round2_minimized_schema_bank.replay.json` — exact replay;
- `baseline_marco.replay.json` and `compact8_round.replay.json` — seven-orbit
  replay ledgers;
- `compact8_baseline_core_coverage.json` — direct stored-core coverage audit;
  and
- `transported_2k3_bank.replay.json` — original bank replay.

The earlier `smoke`, `continuationOrder`, `continuationOrder_v2`,
`continuationOrder_v3`, and `continuationOrder_full20` files are superseded
development runs.  They predate one or more of the unused-source-cap,
scope-label, exact-ledger, or compact-core corrections and must not be cited
as current verdicts.

Important SHA-256 values:

```text
allcenter_gate.py
2af4ebe69459f371f25100a80de1a092e81cae75bd62ad87175c1d4c19a5f27b

verify.py
d49ad713d494fb7df60b88f363142ddba51a152546780978052bb233741bb9c7

combined_round1_round2_minimized_schema_bank.json
25aac2f8f0b2bc89c37610737aa5df55cb01b58207fe9810dd5cf5935e272b2a

combined_round1_round2_minimized_schema_bank.replay.json
08125e1c61113a2c5b52490a7aed65e5526c89991102a95bc442d375d6fa6ee1

baseline_marco.replay.json
2fdcf18592da1030f33f54be982a7a2e3825f0d3ebeaa20e4ff8e1ba7c36945a

compact8_round.replay.json
25cad5dd9051a871472f9b3a5093e625b77918c7a1bf1fefe790b120c46be0a0
```

## Reproduction

From the repository root, with a writable uv cache:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-allcenter-uv \
  uv run --no-project python \
  scratch/atail-force/exact6-allcenter-capaware-gate/allcenter_gate.py \
  --orbit continuationOrder \
  --outer-engine qffd \
  --preload-transported-schemas \
  --learned-schema-bank \
    scratch/atail-force/exact6-allcenter-capaware-gate/combined_round1_round2_minimized_schema_bank.json \
  --learned-max-k 8 \
  --wall-seconds 180 \
  --output /tmp/continuationOrder.json
```

Independent replay:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-allcenter-uv \
  uv run --no-project python \
  scratch/atail-force/exact6-allcenter-capaware-gate/verify_minimized_schema_bank.py \
  scratch/atail-force/exact6-allcenter-capaware-gate/combined_round1_round2_minimized_schema_bank.json \
  --output /tmp/combined-bank.replay.json
```

Warnings-as-errors Lean checks are run from `lean/`:

```bash
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/exact6-uniform-core-occurrence/ExactSixUniformCoreOccurrence.lean

lake env lean -DwarningAsError=true \
  ../scratch/atail-force/selected-row-strong-connectivity/SelectedRowStrongConnectivity.lean
```
