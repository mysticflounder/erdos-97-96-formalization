# Arbitrary-cardinality induced witness model

Target:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`.

`model.py` and `cegar.py` build quotients of **named witness occurrences**.  The
v8 `cegar.py --global-tier full` abstraction has 62 occurrences; smaller tiers
retain only the local or local-plus-apex-cover witnesses.  The
quotient allows two role names to denote the same carrier point unless a
distinctness fact is supplied by the checked Lean prefix.  It does **not**
identify this named set `W` with the full carrier `D.A`.

The core contains:

- the three exact critical shells (union cardinality at most 12), their
  canonical blockers `b1,b2,bs`, and the three MEC apices;
- both exact four-point first-apex radius classes and the named
  aligned/singleton trace;
- the new second-row point `z`, its blocker branch, and its exact critical
  shell (support-equal to the second shell in the reuse branch);
- in `--escape-arm critical`, the exact critical escape row centered at one
  of the 12 seed occurrences; the robust arm is explicitly opaque.

Every exact-four exclusion is induced: it ranges only over named `W`.
Distances form a strict quotient metric.  The default lazy checker refines
each SAT candidate with the two strict Kalmanson inequalities violated in its
solver-chosen cyclic order.  It returns SAT only when every four distinct
named quotient points passes the check.  This is a hereditary necessary
relaxation of strict convex Euclidean geometry, not a coordinate realization.
`--geometry eager-kalmanson` materializes all guarded cuts up front;
`--geometry fixed-order-kalmanson` freezes the first quotient/order and makes
a quick sound SAT probe (UNSAT is reported as UNKNOWN because other orders
remain); `--geometry triangle` is only a weaker diagnostic.

## Trust boundary

Global statements are represented only by sound finite projections onto the
named quotient.  In the full v8 tier these include unique-four exclusions for
the named critical and cover centers, pairwise critical-shell coherence,
tri-apex/critical-shell intersection bounds, three minimality cover witnesses,
two additional nonrobust centers forced by the leaf-specific `|D.A| ≥ 17`
bound, and explicit 6/4/4 strict-cap interior witnesses.  The unrestricted
parts of global `D.K4`, full robustness/tri-apex richness, minimality, and
`noM44` remain opaque.  A SAT model is only a survivor of necessary induced
constraints.  UNSAT would still be an uncertified SMT result for this encoding
and would require an encoding audit and independent proof-producing route
before any Lean promotion.

In both escape arms the production theorem now retains `escapePoint` together
with membership in an exact selected four-row, so carrier membership follows
from that row's support inclusion.  In the non-robust arm it additionally
retains the source-indexed critical row and the fact that deleting
`escapePoint` destroys K4 at the escape center.

The live source ingress for the optional `q` constraints is
`exists_globalK4Row_and_sourceFaithfulCriticalCover`.  At `q = Q.source` it
exposes the arbitrary selected four-row required by `--global-k4-center q`
and the canonical exact unique-four critical row required by
`--cover-point q`.  The same packet proves that the cover center avoids all
three rich apices and lies in a strict indexed cap.  The checked theorem
`firstFiber_sourceFaithfulCriticalCover_eq_firstShell` now proves more: this
cover center is exactly the first collision blocker, its canonical support is
the first collision shell and the explicit four-point first row, and the named
first blocker inherits the indexed-cap localization.  The live leaf also uses
`selectedFourClass_support_eq_shell` to prove unconditionally that the escape
center is different from the first, second, and cap-source blockers; hence it
is different from the `q`-cover center.  These are stronger source facts than
the corresponding finite constraints.  The remaining trust boundary is a
terminal geometric contradiction or exhaustive certified finite closure plus
its checked adapter, not row extraction.

A Lean 4.27 build and live kernel audit give the new theorem exactly
`[propext, Classical.choice, Quot.sound]`, with no `sorryAx`.  Reference mining
confirms its direct use by the live leaf and the leaf's path to the configured
publish target.

## Runs

```bash
uv run python model.py --self-test
uv run python model.py --escape-arm robust --z-branch new \
  --output robust-new.json
uv run python model.py --escape-arm critical --z-branch new \
  --output critical-new.json
```

All runs have a 60-second Z3 timeout by default and report `UNKNOWN`
fail-closed.

Observed quick checks on 2026-07-29:

- the hand-known strict-triangle smoke test: `PASS`;
- critical escape/new-`z`, strict triangle relaxation: `SAT` in 2.71 s;
- robust escape/new-`z`, strict triangle relaxation: `SAT` in 0.97 s;
- robust escape/new-`z`, default lazy strict Kalmanson: `UNKNOWN`
  (`canceled` after 20 s, one refinement, 10,717 order cuts).

The two SAT verdicts are candidate witnesses for the explicitly weaker
triangle-only projection.  The strict-Kalmanson run is not a verdict in either
direction.

## Two-level induced-metric CEGAR

`cegar.py` avoids accumulating metric cuts in the unified solver.  Its outer
QF_UFBV map chooses only the quotient/order of named roles and equality classes
of the explicitly queried distance rows.  For each outer witness, a fresh
QF_LRA inner solver freezes those literals and checks strict triangle plus both
strict Kalmanson inequalities.  An outer blocking clause is added only from an
inner `UNSAT` assumption core.  The checkpoint replays the accumulated cuts;
it does not preserve the solver's last assignment.  `UNKNOWN`, wall budget,
cut budget, and iteration budget all stop fail closed.

```bash
uv run python cegar.py --self-test
uv run python cegar.py --escape-arm robust --z-branch new \
  --checkpoint cegar-robust-new.checkpoint.json \
  --output cegar-robust-new.json
# Add --resume to continue a matching checkpoint.
```

Observed bounded robust/new check on 2026-07-29 used
`--inner-timeout-ms 120000 --wall-timeout-seconds 240 --max-iterations 8
--max-cuts 8 --core-shrink-checks 4 --core-shrink-timeout-ms 3000`:

- one sound five-literal inner-`UNSAT` cut was checkpointed;
- the next inner call returned `UNKNOWN` (`canceled`);
- terminal status: `UNKNOWN_FAIL_CLOSED`, not SAT or UNSAT.

The first core is the local cyclic pattern
`a0 < p1 < p2 < b1` together with
`d(a0,p1) = d(a0,p2)` and `d(b1,p1) = d(b1,p2)`.
This is solver-discovered obstruction evidence for the induced relaxation, not
a proof or a carrier-wide result.

The later batched local robust/new run
`cegar-v8-local-robust-batched32k.json` banked 1,985 independently valid
five-literal four-point Kalmanson cuts in five batches.  Its sixth outer model
was `UNSAT` in the exact quotient metric checker, but the older full named-map
replay returned `UNKNOWN` after cancellation, so the run remains
`UNKNOWN_FAIL_CLOSED`.

`metric_core_extractor.py` loads those 1,985 cuts into a fresh solver and finds
a new checkpoint survivor with an inclusion-minimal two-row/one-Kalmanson
metric core.  That core is valid and is exactly the already-proved
`false_of_four_ccw_endpoint_centers_bisect_middle_pair` schema, but it is not
the lost sixth outer model: the checkpoint did not record that assignment, and
the direct separator finds the fresh survivor's obstruction immediately.
Consequently this artifact is diagnostic only.  The next exhaustive run must
extract a tracked quotient core from the current model before it is discarded.

## Full v8 incidence projection

The target leaf has a stronger cardinality floor than the ambient all-large-cap
residual.  Its source packet gives one closed cap cardinality at least eight;
the other two closed caps have cardinality at least six.  The cap-sum identity
therefore gives `17 ≤ |D.A|`.  Combined with the four-to-one nonrobust cover,
this forces five nonrobust centers, so two further centers can be named beyond
the three canonical blockers.

The following outer-only runs ask whether all extracted incidence, quotient,
cyclic-order, cover, and cardinality consequences already contradict each
other, without introducing metric variables:

```bash
uv run python cegar.py --global-tier full --escape-arm robust \
  --z-branch new --outer-only --outer-timeout-ms 600000 \
  --wall-timeout-seconds 650 \
  --output cegar-v8-full-robust-new-outer.json
uv run python cegar.py --global-tier full --escape-arm critical \
  --z-branch new --outer-only --outer-timeout-ms 600000 \
  --wall-timeout-seconds 650 \
  --output cegar-v8-full-critical-new-outer.json
```

Both runs returned `OUTER_SAT_INDUCED`: robust/new in 627.62 seconds with
44 quotient vertices, and critical/new in 391.77 seconds with 40 quotient
vertices.  A source audit of every nontrivial alias in both survivors found no
omitted forced inequality.  Thus the desired contradiction is not a pure
incidence/order consequence at this finite projection.  Metric or Euclidean
realizability, or a stronger carrier-wide projection, is the next required
computational layer.

## v17 mirror-interleaving checkpoint

The exact full-Euclidean audit of the frozen v16
local/critical/reuse-second survivor found a six-class obstruction in the
cyclic order

```text
a0 < p2 < r1 < b2 < r2 < p1
```

with selected rows

```text
a0 : {p2,p1},  a0 : {r1,r2},
b2 : {a0,r1,r2},  r2 : {p2,p1}.
```

`ATail/SixPointEuclideanObstruction.lean` now proves the corresponding
mirror-interleaving theorem over `ℝ²`, and `FrontierLiveClosure.lean` imports
that module.  Its public terminal has transitive axioms exactly
`[propext, Classical.choice, Quot.sound]`; it has no `sorryAx`.

The v17 direct-cut detector emits the theorem's five successor-order and five
positive row literals.  Its self-test:

- matches the exact frozen v16 tuple `(a0,p2,r1,b2,r2,p1)`;
- checks that the frozen assignment entails every literal;
- checks that adding the cut makes that assignment `UNSAT`; and
- independently revalidates the cut's checkpoint schema.

The completed 100,000-cut v16 custom checkpoint was migrated non-destructively
to v17.  All cuts parsed, were unique, and matched exactly one older
theorem-shaped schema: 99,911 four-point Kalmanson, 39 five-point Euclidean,
18 reversed-second five-point, 22 circle-isosceles five-point, and 10 sparse
six-point cuts.  The migrated checkpoint SHA-256 is
`091df43dd5c14ff164882826551a833ee08faaaa259d9c1e4f38a3161fd31643`.

The first one-cut resume did not reach another model.  After 615.16 seconds
the outer solver returned `UNKNOWN` with reason `timeout`; it retained exactly
100,000 cuts, emitted no survivor, and banked no v17 cut.  The result is
`UNKNOWN_FAIL_CLOSED`, not exhaustion or Lean closure.  The run is recorded in
`v16-v9-checkpoint-rebase/cegar-v17-custom-critical-reuse-second-cut1.json`
(SHA-256
`93b08cf60b186cc9fede435ddd996d69c9e780fea553defe949ccf7469713b3c`).

This checkpoint therefore closes the known frozen v16 survivor but does not
close the live Lean leaf.

The smaller v16 local/critical/reuse-second checkpoint contained 4,086 cuts.
The generalized migration retained and revalidated 4,078 universal
theorem-shaped cuts and deliberately dropped eight old quotient-specific
relation cuts for rediscovery.  A v17 resume then banked 1,855 new cuts and
returned `ALIVE` after 16.42 seconds with 5,933 total cuts and an 18-class
survivor.  The immutable 4,078-cut migration artifact is
`cegar-v17-local-critical-reuse-second.original-migrated.checkpoint.json`
(SHA-256
`cace3498b7ce04e0cc186edc9b10268b742e1070de2b001d29756f29ca244586`);
`v17-local-migration-report.json` records the exact eight dropped indices and
schema census.  The result and resumed checkpoint are respectively

```text
cegar-v17-local-critical-reuse-second.json
  sha256 bd3e6567e7d130932d51c14edd6980c6fa3d046cc0e3194c88afdab6c8eb783c
cegar-v17-local-critical-reuse-second.migrated.checkpoint.json
  sha256 11234e5710d46b46550689929767b522e2d77c1b76f3ca4841654d7a54086f2a
```

The hash-pinned survivor has 35 recorded positive quotient-row equations.
An exact-coordinate `QF_NRA` feasibility probe over all 18 ordered classes
ended `UNKNOWN_FAIL_CLOSED` at its hard 600-second subprocess wall limit.  It
is neither a realization nor a contradiction.  Exact induced-subset mining
then exhausted all 3,060 four-class and 8,568 five-class subsets; every checked
case was `SAT`, so `NONE_FOUND_IN_EXHAUSTED_RANGE`.  The six-class pass visited
all 18,564 subsets but left 205 solver-`UNKNOWN` cases and therefore ended
`UNKNOWN_NO_VALIDATED_CORE` after 324.564392 seconds.  No candidate passed the
required shrinking plus fresh Z3 and independent cvc5 validation gates.

## v18 `q`-cover checkpoint and source correction

The guarded rebase and resume with both `--global-k4-center q` and
`--cover-point q` completed before the CEGAR pause.  The result
`v17-v18-checkpoint-rebase/cegar-v18-custom-q-cover-q-critical-reuse-second.json`
is `ALIVE` with epistemic status `INDUCED_NECESSARY_CONDITION_ONLY`: iteration
3 returned a 23-class exact strict-Kalmanson quotient survivor after
1714.299807 seconds with 14,740 total cuts.  It is not a Euclidean-coordinate
model.  The iteration-1 quotient core is `VALIDATED_AND_BANKED`, with five
shrunk relations and fourteen translated outer literals.  No new solver
process was started at this source checkpoint.

The saved survivor gives `cover_q` and `b1` distinct quotient classes.  That
assignment is now source-incompatible: `Q.blockers_eq`, support transport, and
the explicit first-fiber shell prove `cover_q = b1` exactly.  A future resumed
projection must identify those roles and must encode the unconditional
nonaliases between the escape center and all three canonical blockers.  Merely
adding the weaker first-cap order `a1 < cover_q < a2` would lose a proved
equality and is therefore superseded.

This checkpoint closes no `sorry`.
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
remains the one load-bearing leaf.  Its coordinator frontier is unchanged:
one direct leaf, with the same two-way second-row continuation and two-way
robust-versus-critical escape continuation (constructor fan-out `2 × 2`).
The nearest existing production consumer is
`SixPointEuclideanObstruction.false_of_six_ccw_two_selected_rows`: take the
first-apex radius row and the first-blocker critical row, with
`P.source₁,P.source₂` as their shared pair.  Their row memberships,
distinctness, remaining support points, and the no-third-common-point bound
are already available.  The exact missing bridge is to choose one remaining
point from each row and prove an exhaustive common-boundary cyclic-order split
whose matching branches give the consumer's
`A < B < C < D < E < F` placement; assuming only that order would leave the
complementary placements open.  The escape-row circle/intersection route
remains a fallback after the three blocker aliases are excluded.  Any future
finite `UNSAT` still needs independent certificate validation and a checked
source-to-certificate adapter.
