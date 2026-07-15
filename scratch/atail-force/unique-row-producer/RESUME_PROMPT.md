# Resume the ATAIL FA-UNIQ4 / FA-UNIQ5 lane

Resume the paused first-apex unique-row lane in
`/Users/adam/projects/math-projects/erdos-97-96-formalization`.

## Ownership and anchor

This session owns only the `FA-UNIQ4` / `FA-UNIQ5` branches and the associated
`(6,5,4)` / card-ge-12 work. Another session owns the R double-survival
branch. Do not duplicate or modify that R work.

Read `AGENTS.md`, then set the proof-blueprint anchor:

```bash
proof-blueprint anchor set \
  Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair \
  --note 'FA-UNIQ4/FA-UNIQ5 owner: card-four/card-five unique first-apex radius branches and (6,5,4) work only; R is owned by another session.'
```

Nthdegree working state is session-local. Do not expect to see or replace the
other session's working state. Establish your own only after reconstructing
the lane from the durable artifacts below.

## Read the source-current boundary

Read these before changing or running anything:

- `docs/closure-plan-full-spec-2026-07-09.md`
- `docs/atail-force-producer-plan-2026-07-13.md`
- `docs/closure-matrix-2026-07-09.md`
- `scratch/atail-force/unique-row-producer/REPORT.md`
- `scratch/atail-force/frontier-split-shape-audit/REPORT.md`
- the current Lean definition of
  `Problem97.ATailCriticalPairFrontier.FirstApexSplit`

The first-apex split is:

- `R`: deleting both frontier points preserves a four-point class at the
  first opposite apex. This is not your lane.
- `FA-UNIQ4`: the unique positive first-apex
  radius supporting at least four ambient points has class cardinality
  exactly four.
- `FA-UNIQ5`: the same unique-radius statement,
  with class cardinality exactly five.

Never abbreviate these arms as bare `U4` or `U5`. Those names are reserved
for the original numbered U-lane stages and the associated historical theorem
banks; they are different objects.

The main session has kernel-checked the R descent and is pursuing its separate
geometric producer. Final K-A closure still needs a branch-complete
`FA-UNIQ4` / `FA-UNIQ5` eliminator from this lane.

## Objective

Prove a source-current, branch-complete eliminator for the `FA-UNIQ4` and
`FA-UNIQ5` arms from the full live parent surface. Do not add another merely
conditional consumer.
A direct `False` theorem is acceptable if it visibly consumes the full live
MEC/cap/no-`IsM44`/global-K4/criticality data.

Use the following exact current targets.

### FA-UNIQ4: unique card-four class

Produce the choice-invariant `ExistsSurplusPairCriticalBlocker` packet: a
non-apex point of the surplus cap, an exact deletion-blocking shell centered
there, and membership of both selected off-cap points in that shell.

Do not try to prove a theorem about every arbitrary
`CriticalShellSystem` selector. The checked endpoint-override boundary shows
that an arbitrary selector can choose the first opposite apex as both
blockers. The producer must existentially construct favorable geometry or
eliminate `FA-UNIQ4` before the selector is fixed.

### FA-UNIQ5 with distinct blockers

The checked theorem
`cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross` reduces the
branch to `CardFiveDistinctCapLocalCrossHypothesis`:

```text
at least one directed cross hit
AND
that source's actual blocker lies in the surplus cap.
```

Prove this source-indexed metric-incidence fact from the full live geometry.
The existing adapter and consumer then close the branch.

### FA-UNIQ5 with a coincident blocker

Produce one residual member `x` and a `SelectedFourClass D.A x` whose support
contains the common pair. Global K4 supplies a row at `x`, but does not by
itself choose the required radius; that coupling is the open content.

## Theorem-bank and census discipline

Before deriving a new finite-pattern, row-slot, incidence, or metric
contradiction, check every theorem-bank registry required by `AGENTS.md` and
search the indexed Lean corpus:

```bash
nthdegree docs search --lean '<mathematical statement or theorem name>'
```

The certificate bank was recently improved and some selection IDs were
renumbered. Treat prose and old round-two IDs as potentially stale. Ground
all current mining claims in the files under `census/atail_force/`, especially
`producer_coverage_census_checkpoint.json`, and run each artifact's own
`--check` before using it. If a checkpoint reports `selection ids drift`, stop
and regenerate or reconcile it against the current stream. Do not document or
mine from a stale checkpoint.

SAT/UNSAT, MARCO cores, finite shadows, and exact-coordinate examples are
theorem-discovery or regression evidence only. They do not close a Lean
producer unless the live extraction and kernel-checked consumer are both
present.

Prefer a uniform theorem over the live cardinal range. If a result is only
for `(6,5,4)`, card-ge-12, or another fixed profile, state that boundary
exactly and identify what remains at card 11. Do not silently promote a fixed
profile to the full parent theorem.

## Files and concurrency

You may modify or add files under:

```text
scratch/atail-force/unique-row-producer/
```

You are authorized to create analysis files, focused search scripts, and
scratch Lean modules without asking again.

Do not touch:

- the active R-lane scratch directories;
- any `SurplusM44` file;
- `SevenPointTwinFourCircleCollision.lean`;
- `docs/live-blueprint`;
- production Lean before a focused scratch theorem is kernel-checked; or
- the shared closure-plan/matrix documents while the main R session is
  active.

Preserve unrelated edits in the dirty shared tree. Use focused Lean checks
first. Do not launch a full Lake build while another project build is active;
leave the full publication build for coordinated integration.

## Deliverable and acceptance gate

Report back with:

1. the exact theorem names and file paths;
2. which of `FA-UNIQ4`, `FA-UNIQ5-distinct`, and
   `FA-UNIQ5-coincident` are eliminated;
3. every remaining hypothesis, if any;
4. focused Lean commands and exit status;
5. printed axiom closure and confirmation that no transitive `sorryAx` is
   used; and
6. any synchronized census/checkpoint hashes used as discovery evidence.

Success is either:

- a kernel-checked theorem eliminating both `FA-UNIQ4` and `FA-UNIQ5` on the
  actual live `FirstApexSplit` surface; or
- a sharp, proved decomposition identifying one genuinely missing
  full-geometry producer, without introducing another conditional wrapper or
  relying on a fixed-card abstraction as proof.
