# Real p5 checkpointed-RUP kernel replay — 2026-07-23

## Result

**KERNEL-CHECKED CERTIFICATE RESULT:** the real one-shot first shard is not
tractable as one computation, but all 369 independently rebased windows, both
shard coordinators, and the final checkpoint-0 UNSAT theorem compile under the
project-pinned Lean 4.27 toolchain with warnings as errors. The one-shot
failure was a resource result, not a logical rejection of the certificate.

The verified structural package is `generated/p5-largest/`, with
relocation-stable package SHA-256:

```text
4229c86fd26f38e812d20467c68fbefa04838101611b6e73b00210cb0a444232
```

It is bound to the 32,211-byte
`lean/Erdos9796Proof/P97/Certificate/CheckpointedRup.lean` source with
SHA-256:

```text
6c670c24b989f8024f43f6362ffc031c040eba77e68293060aa65cb9cb25a8e8
```

## Inputs

| artifact | bytes | logical size |
|---|---:|---:|
| `start.cnf` | 172,016 | 8,703 clauses |
| `shard-1.lrat` | 160,182,252 | 728,609 actions |
| `checkpoint.cnf` | 642,197 | 23,857 clauses |
| `shard-2.lrat` | 168,357,572 | 743,104 actions |

Shard 1 has 492,102 additions and 21,491,717 hints. Shard 2 has
492,103 additions and 23,334,553 hints. The terminal empty clause is global
clause ID 992,908.

## Validation completed

- `lake-build Erdos9796Proof.P97.Certificate.CheckpointedRup` passes.
- `TextIngress.checkSeparateText_sound` reports only `propext`,
  `Classical.choice`, and `Quot.sound`; its source scan reports no suspicious
  constructs.
- The canonical text parser is kernel-decided on bounded DIMACS and LRAT
  fixtures, including duplicate-clause and tautology rejection.
- All 60 materializer, emitter, and attestation tests pass.
- The real package verifies independently against its hashes, exact
  checkpoint, rebase map, and checker binding.

## One-shot attempt

The emitter generated separate `Common`, `First`, `Second`, and `Compose`
modules. `Common` compiled successfully.

The first `First` compilation exceeded Lean's default recursion limit. A
second run used unlimited heartbeats, `maxRecDepth = 2000000`, and a 2 GiB
Lean stack. It continued for more than 20 minutes, used at least 23 GiB
resident memory, emitted no theorem result, and produced no `First.olean`.
The run was manually interrupted with exit status 130. The second shard was
not attempted because it has the same one-shot parsing and replay structure.

The observed pressure comes from simultaneously retaining the included
160 MB string as a character list, parsed lines and fields, hundreds of
thousands of actions, the replay state, and the final nested checkpoint
signature equality. Raising limits lets the computation proceed farther but
does not bound any of these objects.

## Full bounded-window result

The verified windowed package has digest
`cd818224ca4c418c084363f82c508460e4ed95c17d457ed04650fe4fa5e938d1`
and contains 183 shard-1 windows plus 186 shard-2 windows.
The first emitter checkpoint used `emit_windowed_rup_replay.py` on shard 1,
window 1:

- checkpoint 0: 8,703 clauses;
- actions: 4,000 lines, comprising 2,477 additions, 1,523 deletions,
  2,279 deleted clause IDs, and 24,532 hints;
- checkpoint 1: 8,901 clauses; and
- rebased LRAT text: 256,795 bytes.

Its `WindowedRupReplay.accepted` theorem uses `native_decide` and compiled in
0.61 seconds with 489,701,376 bytes maximum resident set size. Both
`WindowedRupReplay.accepted` and its logical implication
`WindowedRupReplay.sound` have the exact axiom closure:

```text
propext
Classical.choice
Quot.sound
Lean.ofReduceBool
Lean.trustCompiler
```

This matches `.blueprint.toml`: the first four are approved Lean core axioms
under the project policy, and `Lean.trustCompiler` is explicitly approved.
There is no `sorryAx`, `unsafe`, `implemented_by`, `extern` decision
procedure, or generated per-theorem axiom.

`emit_windowed_rup_replay_package.py` then emitted the complete replay tree:

- 369 consumed shared checkpoint modules;
- 183 shard-1 window modules and 186 shard-2 window modules;
- two shallow shard coordinators; and
- `WindowedRupReplay.startUnsatisfiable`, which closes shard 1 into the
  shard-2 terminal contradiction.

The replay package digest is
`9238dc18ee65a0d1023c786d40b149591759dbafa91eb9d0cc2f75d4385328ad`.
Its manifest is explicitly structural and records `audit_status =
NOT_AUDITED`; the actual Lean build and axiom audit are separate gates.

All 742 modules compiled with `-DwarningAsError=true`. Eleven representative
modules were compiled first; the remaining 731 compiled in 496.57 seconds.
The slowest bounded module took 1.80 seconds, and the largest observed maximum
resident set size was 547,553,280 bytes. The two shard coordinators took
0.32 and 0.31 seconds; the final coordinator took 0.24 seconds.

Exact axiom reports for `Shard1.sound`, `Shard2.sound`, and
`startUnsatisfiable` are identical:

```text
propext
Classical.choice
Lean.ofReduceBool
Lean.trustCompiler
Quot.sound
```

This is exactly the repository-approved trust profile. There is no
`sorryAx`, custom axiom, or hidden coordinator replay.

## Focused p5 composition

The companion occurrence/source lane is now complete.
`P5ExactTwoClosure.lean` checks the exact ground equality between the parsed
checkpoint-0 clause list and its `bridgeClauses`, transfers the bridge
valuation into the checker's native formula semantics, and proves
`false_of_p5ExactTwo` for the `(5,5,4)` exact-two residual. See
[`p5-exact-two-closure-2026-07-23.md`](p5-exact-two-closure-2026-07-23.md).

## Claim boundary

This now establishes the geometric `(5,5,4)` exact-two p5 contradiction in
the scratch proof stack. The replay import closure still depends on an
ignored generated package, so the result is not yet clean-checkout production
code and closes neither live production `sorry`. The p4 exact-two profile and
the arbitrary-cardinality reduction also remain.
