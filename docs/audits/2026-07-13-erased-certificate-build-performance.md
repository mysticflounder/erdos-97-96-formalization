# Erased-certificate build performance audit (2026-07-13)

## Scope

Target: `Erdos9796Proof.P97.ErasedCertificate`.

This audit distinguishes measured build behavior from expected behavior of the
current refactor. It does not change the finite classifier or any downstream
theorem statement.

## Baseline evidence

The committed P2 layout used 128 independent `native_decide` leaves. The
bounded rebuild driver scheduled them as 16 sequential waves of eight. Build
records in `~/.local/state/lean-usage/build-stats.jsonl` report:

- total wall time across the 16 waves: 14,330 seconds (3h 58m 50s);
- minimum wave: 740 seconds;
- maximum wave: 1,102 seconds; and
- mean wave: 895.625 seconds.

The corresponding P4-S layout used another 128 independent native leaves.
Although each source leaf is only about 720 bytes, native compilation emits an
approximately 5 MB setup artifact per leaf. The exact compiled evaluation gate
checks all 4,543 P2/P4-S/P4-U cells in 845,205 ms, so the proof build's repeated
native-compilation setup is a material cost beyond classifier evaluation.

## Granularity experiment

A temporary certificate combining all four deleted labels and all eight
support chunks for P2 center 7 did not finish within the practical per-module
ceiling. It was interrupted after 2,059 seconds (34m 19s). Therefore one whole
center is too coarse for a restartable certificate unit.

The next experiment combined both deleted labels and all eight chunks for one
P4-S pair using the then-current sequential evaluator. It was still running
about 30 minutes after emitting its native setup artifact and was interrupted.
That rejected pair-wide evaluator rebuilt support-independent domain lists for
every chunk; it is not the hoisted parallel evaluator implemented below.

An intermediate half-pair design was then tested. The completed replica census
records seconds and DFS nodes for every cell. Summing those records by chunk
gave a better scheduling signal than raw mask count. Exhausting all 35 common
four-of-eight P2 partitions selected `[0,1,5,6]` and `[2,3,4,7]`: the largest
empirical half over every center/deleted pair was 247.038 seconds, versus
269.926 seconds for consecutive halves. Aggregate replica time was 1,817.675
versus 1,804.114 seconds.

For P4-S, `[1,3,4,6]` and `[0,2,5,7]` retained a balanced 168/162 raw-mask
split and improved the aggregate DFS-node split from 2,522,314/5,015,467 to
3,755,947/3,781,834. For every individual center/deleted pair, the two replica
time totals differed by at most 5.024 seconds. These measurements define the
balanced half-pair partitions used below.

A final consolidation experiment put all sixteen P2/P4-S pairs behind one
`native_decide` and used eight `Task.Priority.dedicated` branches. A two-check
smoke theorem confirmed in 4.24 seconds that the runtime-task evaluator is
definitionally equal to its sequential kernel implementation. The real shared
certificate, however, produced no `.olean` within 7,215.64 seconds
(2h 00m 15.64s) and was interrupted at the declared operational cutoff. A
second direct Lean job overlapped part of that interval, so this is not a clean
benchmark, but the monolith also failed to finish during a final uncontested
interval with host load near the expected eight-worker level. It is rejected
as a build unit because it has no restartable intermediate artifacts.

The coarser restartable alternative was also tested after the hoists were in
place. `P4SPlacement6ANative`, the lightest empirical full pair, passed
elaboration but produced no `.olean` within the clean 30-minute per-module
ceiling. It too was interrupted. Full-pair native modules are therefore
rejected even when independently restartable.

The four-chunk boundary was then tested directly with
`P4SPlacement6AFirstNative`. In a clean run it passed elaboration but
produced no `.olean` within the same 30-minute ceiling. It was interrupted
without a reusable artifact. Four-chunk native modules are therefore also
rejected as operationally too coarse. The current candidate boundary splits
each balanced half into two two-chunk native units.

The first clean two-chunk benchmark,
`P4SPlacement6AFirstPart1Native` over chunks `[1,3]`, completed
`native_decide` in 1,297 seconds and the full `lake-build` wrapper in
21m39s. It produced a 56 KiB `.olean` and passed proof-blueprint resync. This
accepts the two-chunk boundary for that measured leaf, with 8m21s of margin
below the per-module cutoff. It does not establish that the other 63 leaves
have the same runtime or all remain below the cutoff. A cached rerun of the
same target completed in 6.34 seconds, confirming that the produced artifact
is reusable without repeating the native evaluation.

## Implemented refactor

The current source layout has four restartable native theorems for each
center/deleted-label pair:

- thirty-two P2 two-chunk modules, built in four eight-target waves;
- thirty-two P4-S two-chunk modules, built in four eight-target waves; and
- the existing independent P4-U certificate over its 47-support domain.

P2 and P4-S hoist each support-independent candidate-row domain construction
out of the support loop. Each native evaluator constructs its two
deleted-label domain lists once across two chunks, rather than once per chunk.
The corresponding equality to the existing chunk-set predicate is proved by
`rfl`. A generic `List.all_append` theorem combines each two-chunk pair into
the existing four-chunk half statement without re-running the classifier;
proof-only aggregators then reconstruct each full-pair predicate from its two
halves.

The existing thirty-two half theorem names and sixteen P2/P4-S pair theorem
names are proof-only aggregators. The existing 256 chunk theorem names and
statements remain cheap projections from those pair theorems. The
proof-bearing placement bank is therefore reduced from 257 native sites to 65:
64 two-chunk sites plus P4-U. This removes 192 repeated P2/P4-S native setups
while retaining an artifact after each completed two-chunk unit. The stable
aggregate module remains
`Erdos9796Proof.P97.ErasedCertificate`.

`scripts/build-p2-certificates.sh` builds the thirty-two P2 two-chunk targets
in bounded batches and then P2 closure.
`scripts/build-erased-certificates.sh` runs the P2 and P4-S two-chunk targets
in separate bounded batches, then builds P4-U and the stable aggregate. Both
batch-size variables accept only one through eight. No in-process task wrapper
or unsafe implementation override is used.

## Status and acceptance gates

PROVEN at this checkpoint:

- the hoisted full-pair evaluators are definitionally equal to the existing
  pair predicates;
- proved chunk sets compose by `List.all_append`, without another classifier
  evaluation;
- all retained chunk projection statements and theorem names are unchanged;
- the failed task-wrapper experiment introduced no accepted proof artifact;
- `P4SPlacement6AFirstPart1Native` evaluates to `true` under
  `native_decide` and has a reusable `.olean`; and
- the P2/P4-S native-site source inventory is reduced from 256 to 64.

PENDING MEASUREMENT:

- the remaining 63 two-chunk certificates evaluate to `true` under
  `native_decide`;
- the concrete half/pair aggregators build after their native prerequisites;
- all 256 projection modules and the aggregate target build;
- clean/restart wall time for each bounded wave; and
- downstream axiom closure remains unchanged and contains no `sorryAx`.

The speedup is expected from eliminating 192 repeated native compilation
sites and reducing 32 P2/P4-S waves to eight at batch size eight. No final
speedup factor is claimed until the two-chunk boundary and the full bounded
build are measured.

## Larger optimization boundary

The separate compiled Lean evaluation gate checked all 4,543 cells in
845,205 ms using eight runtime tasks. That gate evaluates the literal Lean
classifier, but it is an empirical timing/integrity gate rather than a
kernel-checked certificate.

The Python replica supplies the per-cell seconds and DFS-node counts used for
the partition choices above. It is not a literal execution of the current Lean
DFS: it carries pair counts incrementally, filters each remaining domain
against only the newly assigned row, omits a redundant selected-row
compatibility check under a maintained invariant, and stops constructing
domains after the first empty result. The Lean `allKilledAt` kernel instead
recomputes full-list compatibility and pair counts at every node.

Porting those optimizations is the strongest remaining performance route, but
it requires a Lean invariant and an equivalence or direct soundness theorem.
No matching theorem was found in the indexed Lean corpora. Until that bridge
exists, the optimized replica remains empirical corroboration and must not
replace the current proof-bearing classifier.
