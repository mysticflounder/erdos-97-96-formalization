# Corrected unique-four source-field audit

Date: 2026-07-22

Scope: the two corrected `n = 11` exact-four / exact-two assignments in
`unique4-star-producer`, after adding the source-proved own-cap bound
`≤ 2` and endpoint-cap bound `≤ 1`.  This lane changes no production Lean or
shared plan document.

## Decision

Both corrected assignments are eliminated by **strict linear Kalmanson
geometry plus their selected-row equalities**.  They are not full-linear
survivors, Euclidean realizations, or Problem 97 counterexamples.

The decisive cores have now been normalized to eight and six ordered roles,
respectively, replayed with exact integer arithmetic, and kernel-checked as
cardinality-generic direct-`False` consumers:

```lean
Problem97.CorrectedOwnCapKalmansonCoresScratch
  .false_of_four_endpoint_k2_three_row_instances

Problem97.CorrectedOwnCapKalmansonCoresScratch
  .false_of_two_k1_two_k2_four_row_instances
```

Both consumers are warning-clean and have axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

This closes the two named assignments, not the arbitrary-cardinality
exact-two source branch and not a production `sorry`.

## Required bank preflight

Before extracting a new incidence core, the registries required by
`AGENTS.md` were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered complete radius
classes, cap-side injectivity, exact-two rows, strict Kalmanson closure, and
global equality quotients.  No source occurrence theorem for either new core
was found.

The two normalized center/member schemas were also checked against all 46
records in
`unique-arm-whole-carrier-source-audit/kalmanson_schema_bank.json`:

| new core | exact old match | old schema subsuming it | match among 36 pending Farkas ports |
|---|---:|---:|---:|
| corrected p4 | 0 | 0 | 0 |
| corrected p5 | 0 | 0 | 0 |

Thus neither core is a duplicate of the ten kernel-checked records or the 36
`EXACT_FARKAS_VERIFIED_PENDING_LEAN_PORT` records.

`GlobalEqualityKalmansonCore.false_of_equal_sum_core` and its complementary
variant do not consume either core directly: no individual Kalmanson
inequality closes after quotienting the row equalities.  Each contradiction
requires the sum of four strict inequalities.

## Exact source-field replay

The independent replay checks every complete serialized radius class, rather
than only the selected four-row at its center.

| source consequence | corrected p4 | corrected p5 | effect |
|---|---|---|---|
| complete class intersects its center's cap in at most two points | pass | pass | does not exclude |
| endpoint-centered class intersects the incident cap in at most one point | pass | pass | does not exclude |
| at most one same-radius point on either boundary side of a cap center | pass | pass | does not exclude |
| no proper nonempty same-carrier K4-closed subset | pass, 2,046 subsets | pass, 2,046 subsets | minimality projection does not exclude |
| collision/singleton/packed normal form | singleton-return | three-distinct-center singleton | classification does not exclude |
| complete strict Kalmanson distance system | UNSAT | UNSAT | excludes |

The p4 audit checks 93 complete-class/cap instances; p5 checks 91.  The
same-carrier minimality replay exhausts every nonempty proper subset of the
eleven serialized vertices.  These are exact facts about the fixed
assignments, not arbitrary-cardinality theorems.

The omitted nonlinear Euclidean coordinates, MEC membership, remaining
deletion-survival data, and `noM44` geometry are not the first missing layer
for these two assignments: the necessary linear convex-boundary inequalities
already refute them.

## Normalized p4 core

The source vertices, in increasing boundary order, are

```text
0, 1, 2, 3, 5, 6, 9, 10.
```

After boundary-rank compression, the three concrete row instances have
incidences

```text
row instance at role 0: {2,4,6}
row instance at role 1: {0,6,7}
row instance at role 3: {2,4,7}.
```

The four strict inequalities are `K2` on ordered roles

```text
(0,1,5,6), (0,3,4,5), (1,2,5,7), (2,3,5,7).
```

Their sum cancels exactly modulo the three row equalities and yields
`0 < 0`.

## Normalized p5 core

The source vertices, in increasing boundary order, are

```text
0, 1, 2, 7, 8, 10.
```

The four concrete row instances have incidences

```text
row instance at role 0: {1,3,5}
row instance at role 1: {0,5}
row instance at role 2: {1,3,4}
row instance at role 5: {0,4}.
```

The strict inequalities are

```text
K1 (0,1,2,5), K2 (0,1,3,4),
K1 (0,2,4,5), K2 (1,2,3,4).
```

Again their sum cancels exactly modulo the row equalities and yields
`0 < 0`.

The complete machine-readable forms, including the original source-role
maps, are in `kalmanson_row_instance_schemas.json`.

## Row-instance warning

Each new fixed core happens to use exactly one selected-row instance at every
participating center.  The JSON therefore gives every row an explicit
`row_instance_id` even though the center roles are distinct.

This does **not** authorize the legacy `(center, point)` matcher to merge
rows in the robust collision or packed-core ingress:

- collision may retain distinct four-subsets of one class at one center;
- packed ingress may retain distinct-radius rows at one center.

Using either new consumer there requires an explicit adapter selecting a
concrete row argument for every row-instance id.  No repeated-center
transport is claimed here.

## Exact next source producer

The immediate missing source statement for these new consumers is an
occurrence theorem, not another metric contradiction.  In schematic form:

```lean
exists_correctedOwnCapKalmansonOccurrence
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (P4FourK2RowInstanceOccurrence D.A) ∨
      Nonempty (P5TwoK1TwoK2RowInstanceOccurrence D.A)
```

Each occurrence packet must retain:

1. one injective CCW enumeration of the whole carrier;
2. the ordered roles used by the corresponding consumer;
3. the concrete selected-row instance at every named center; and
4. every displayed membership in that exact row instance.

This statement is **CONJECTURED and presently over-narrow as a whole-branch
coverage claim**.  The audit verifies it only for the two named fixed
assignments.  The source-faithful branch-closing target should therefore be a
coverage disjunction whose other arm is the already-defined
`SupportOrBlockerStarMiddleArcPlacement` (or another existing direct-`False`
terminal packet), rather than asserting without evidence that these two
schemas cover every arbitrary-cardinality residual.

The discovery route is:

1. exhaust the corrected finite outer with the full-linear oracle;
2. port every genuinely new row-instance schema encountered;
3. prove a source-level coverage/occurrence theorem from `R` and `Q`; and
4. dispatch each occurrence to its kernel-checked direct-`False` consumer or
   to `false_of_supportOrBlockerStarMiddleArcPlacement`.

## `run_full_linear_cegar.py` compatibility

The current driver **cannot load**
`kalmanson_row_instance_schemas.json` as a seed bank.  It starts from the
legacy center/member bank, asks the full-linear oracle about the first SAT
table, and only then adds a center/member cut.

For the immediate corrected p4/p5 rerun, that behavior is sound because the
outer has one selected row per center and both new cores use distinct centers.
The driver will rediscover the relevant core and add all order-preserving and
reflected cuts automatically.  It will, however, pay for the first SAT solve
again.

A seed-loader may flatten either new record only after checking

```text
all row_instance center roles are distinct.
```

It can then pass `source_vertices_by_role` and the flattened memberships to
`add_schema_cuts`.  The same flattening must be rejected for a repeated-center
record; the runner's current `center -> support` decoded table cannot represent
that case faithfully.

Example fresh runs:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with z3-solver python \
  scratch/atail-force/unique4-star-producer/run_full_linear_cegar.py \
  --opp1-card 4 \
  --work-cnf /tmp/p97-u4-p4-full-linear.cnf \
  --work-log /tmp/p97-u4-p4-full-linear.log \
  --output /tmp/p97-u4-p4-full-linear.json

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with z3-solver python \
  scratch/atail-force/unique4-star-producer/run_full_linear_cegar.py \
  --opp1-card 5 \
  --work-cnf /tmp/p97-u4-p5-full-linear.cnf \
  --work-log /tmp/p97-u4-p5-full-linear.log \
  --output /tmp/p97-u4-p5-full-linear.json
```

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-source-field-audit/audit_corrected_survivors.py \
  --output scratch/atail-force/unique4-source-field-audit/\
corrected_survivor_source_field_audit.json --check

cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-source-field-audit/\
CorrectedOwnCapKalmansonCores.lean
```

The replay artifact is exact and drift-checking.  It separately records that
the fixed occurrence is verified, the four-inequality integer sum is exact,
and no existing legacy schema subsumes either new core.
