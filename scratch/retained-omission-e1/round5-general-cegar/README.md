# Round 6: exact-15 retained-omission CEGAR (schema v6)

This directory contains a **target-specific finite abstraction** of

`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`

at `|A| = 15`.  It covers both constructors of
`RetainedOmissionAllLargeNormalForm` and all eight S6/D44 rich-apex profiles.
It is not a proof of the Lean theorem and it is not a universal `n = 15`
counterexample search.

## Trust boundary

The program emits one of `sat`, `unsat`, `unknown`, or `error` for each finite
case.  These are external Z3 results.  A `sat` result is accompanied by an
auditable rational witness.  An `unsat` result is evidence about this encoding,
not a Lean theorem or kernel-checked certificate.  The script is deliberately
fail-closed: timeout and solver uncertainty are recorded as `unknown`.

The fixed labels are a cyclic-order normal form:

```text
13, 0,1,2,3, 14, 4,5,6,7, 12, 8,9,10,11
```

The Moser apices are `12,13,14`.  Apex `12` is opposite the first cap, whose
strict interior is `0..3`; apex `13` is opposite `4..7`; apex `14` is opposite
`8..11`.  Thus the three closed caps are respectively
`{13,0,1,2,3,14}`, `{14,4,5,6,7,12}`, and
`{12,8,9,10,11,13}`.

At `n = 15`, the cap-sum identity and the three lower bounds `|C_i| >= 6`
force the exact profile `(6,6,6)`, hence strict-interior sizes `(4,4,4)`.
Relabelling each strict interior by its actual cyclic order gives the normal
form above.  The retained points are still enumerated in every possible pair
of first-cap positions; no endpoint-adjacency assumption is made.  This is an
explicit normalized finite slice, not a derivation of `n = 15` from the
universal Lean target.

## Encoded sound consequences

1. **Global convex metric relaxation.** One positive unsquared distance
   variable is shared by every unordered carrier pair.  All strict triangle
   inequalities and both strict Kalmanson inequalities for every cyclic
   quadruple are imposed.  Strict inequalities are normalized to margin one;
   this is sound because the finite homogeneous strict system can be scaled.
2. **Full K4 property.** Every non-apex center has a chosen four-point
   equal-distance witness.  The rich profiles supply K4 at the three apices.
3. **Exact rich-apex profiles.** S6 is one full six-class containing the whole
   four-point strict interior.  D44 is two distinct full four-classes whose
   two-point interior slices partition that interior.  Full means both
   membership and nonmembership are tied to equality with the radius.  The
   cap-loss bound makes these profiles exact at `n = 15`.
4. **Critical-shell system.** Every source chooses from all fifteen carrier
   centers other than itself.  Each used center has one full exact four-row,
   contains every source mapped to it, omits its center, and has no competing
   four-point distance class.  Hence the rich-profile/no-qfree incompatibility
   must eliminate an apex blocker inside the encoding; it is not silently
   assumed as a domain restriction.

   The live source also contains the intended domain bridge:
   `fullyDeletionRobustAt_of_apexRichClassStructure` followed by
   `FullyDeletionRobustAt.centerAt_ne` rules a rich apex out as a
   `CriticalShellSystem.centerAt`.  The current checkout cannot freshly
   elaborate that import closure, so schema v6 deliberately retains all
   fifteen candidates.  It nevertheless identifies B2 with the full critical
   row for every one-hot carrier blocker; the rich-profile/full-row/no-qfree
   constraints reject the apex-center branch without using the bridge as an
   unverified domain restriction.
5. **Circle overlap and pair multiplicity.** Distinct named circle classes
   overlap in at most two carrier points.  For every carrier pair, at most two
   carrier centers are equidistant from it (Dumitrescu L1).
6. **No all-apex shell.** No carrier center is equidistant from all three
   Moser apices. This is the exact finite form of
   `TriApexAllLargeContext.no_center_covers_all_apices`, not a consequence
   guessed from Kalmanson geometry.
7. **Common-deletion packets.** Each packet starts with two chosen four-subsets
   after deleting its source, one at the first apex and one at the retained
   blocker; their overlap is at most two and the deleted point and their own
   centers are excluded.  `B1` remains only a chosen subset, so its off-subset
   points are **unknown**.  In each normal-form use, however, the deletion is
   already omitted from the retained blocker's canonical full shell.  The
   banked theorem
   `secondRow_support_eq_criticalShell_of_center_eq` therefore identifies
   `B2` with that full critical row; the encoding records this equality
   explicitly.
8. **Normal-form arms.** The paired arm has mutual critical-row omission and a
   reverse common-deletion packet.  The reverse-hit/fresh arm has the reverse
   hit, first-cap localization, exact reverse-row/closed-cap intersection,
   a distinct omitted fresh point, and its common-deletion packet.
9. **Cyclic-alternation propagation.** If two distinct carrier centers are
   equidistant from the same two carrier points, the center pair and point pair
   must alternate in hull order.  The four forbidden order cases are already
   banked as
   `false_of_two_centers_equidistant_pair_{after,enclosed,split,before}` in
   `TwoCenterBisectorParity.lean`.  These clauses are redundant consequences
   of the global strict Kalmanson system, but expose the contradiction to SAT
   propagation instead of making Z3 rediscover each linear-arithmetic case.
10. **Same-rich-shell squared-distance cut (schema v3).** A second positive
    variable is introduced for every squared carrier distance.  Equality of
    two unsquared distances from the same center implies equality of their
    squared variables; no nonlinear `s = d^2` equation is assumed.  For three
    angularly ordered points `x < y < z` on one full rich shell centered at an
    extreme apex, the open-semicircle geometry gives
    `s(x,z) > s(x,y) + s(y,z)`.  As with the unsquared strict system, the
    finite homogeneous inequalities are normalized to margin one.  This is a
    sound equality-pattern relaxation, not a complete squared Euclidean
    distance model.

The abstraction intentionally does not encode coordinates, Euclidean distance
matrix rank, Ptolemy, power-matrix rank, radical-axis signs, or unnamed
consequences from the rest of the live residual.  A surviving model therefore
identifies an abstraction gap rather than a Euclidean realization.

## Running

The local environment is managed by `uv`:

```bash
uv run --project scratch/retained-omission-e1/round5-general-cegar \
  python scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py \
  smoke
```

Run one fixed case (profiles are ordered by apices `12,13,14`):

```bash
uv run --project scratch/retained-omission-e1/round5-general-cegar \
  python scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py \
  case --arm paired --profiles SDD --kept 0 --deleted 2 --timeout-ms 300000
```

For the fresh arm, also pass `--fresh` with one of the two remaining first-cap
positions.  The complete finite role/profile matrix is:

```bash
uv run --project scratch/retained-omission-e1/round5-general-cegar \
  python scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py \
  matrix --workers 12 --timeout-ms 300000
```

Retry only the `unknown` cases from a completed matrix summary with a longer
timeout:

```bash
uv run --project scratch/retained-omission-e1/round5-general-cegar \
  python scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py \
  retry --summary PATH/TO/matrix_summary.json --workers 12 --timeout-ms 900000
```

Pass `--include-error` only after inspecting the original errors; it does not
silently treat infrastructure failures as mathematical residuals.

Artifacts are append-only under `artifacts/`: one JSON result per case, compact
solver logs, SAT models, and a matrix summary. Every invocation gets a new
timestamped artifact directory, so reruns never overwrite earlier evidence.
Invocations and summaries record the target, schema version, and hashes of the
script, schema, lockfile, live-source contract, and individual SMT encodings.  `retry` refuses a
summary from a different target, schema, or source hash.

## Reading outcomes

- All cases `unsat`: the encoded relaxation has no model.  The next step is to
  minimize a recurring core and promote its missing mathematical producer.
- Any case `sat`: the target is not closed by these consequences.  Inspect the
  witness and add only a separately proved geometric/metric consequence.
- Any case `unknown`/`error`: the census is incomplete.

Tracked families are operational solver groups, not a modular theorem
dependency graph. In particular, each fixed case compiles its arm-specific
packet roles into `common_deletion_packets`; an UNSAT core that omits the
separate `normal_form` group does not show that the normal form is unnecessary.

`schema.json` is the machine-readable manifest for labels, case axes, encoded
constraint families, and result fields.

See `REPORT.md` for the frozen schema-v1/v2 censuses and the separately hashed
schema-v3 smoke results.  Results from different schema/source hashes must not
be merged into one census.

## Schema-v4 and schema-v5 withdrawals

The interrupted schema-v4 second-cap run recorded 250 external `unsat` cases,
but its blocker map ranged only over the twelve non-apex labels.  The live
`CriticalShellSystem` supplies only a carrier blocker distinct from its source;
the required apex-exclusion bridge had not been formalized.  Those results are
therefore retained only as a strengthened diagnostic and must not be reported
as source-frozen evidence.  Schema v5 repairs that domain restriction.

The schema-v5 matrix is also withdrawn.  Although it admitted all carrier
blockers, its B2-to-critical-row identification was accidentally guarded by
the twelve non-apex labels.  Thus an apex blocker left B2 unconstrained from
its selected full shell.  Schema v6 applies that identification to all
one-hot blocker labels.  Its artifacts are the first eligible results for
this source contract; schema-v5 results remain diagnostics only.
