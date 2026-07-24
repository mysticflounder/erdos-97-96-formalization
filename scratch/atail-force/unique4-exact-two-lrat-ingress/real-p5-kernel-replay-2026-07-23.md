# Real p5 checkpointed-RUP kernel replay — 2026-07-23

## Result

**EMPIRICALLY UNFINISHED:** the bounded checker and text-ingress fixture pass,
but the real first shard is not tractable as one `by decide` computation. This
is a resource result, not a logical rejection of the certificate.

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
- All 23 materializer, emitter, and attestation tests pass.
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

## Required next endpoint

Preserve the major two-shard checkpoint, but split each logical shard into
independently rebased windows. Each window must contain:

1. its exact dense start CNF;
2. a whole-line LRAT action slice;
3. its exact dense end CNF; and
4. a total, injective global/local clause-ID map.

Use configurable initial caps of 4,000 actions and 4 MiB of LRAT text per
window, and monitor endpoint-CNF size. Each window gets its own bounded
`checkRebaseText = true` theorem in a separate module. Compose the resulting
logical implications transitively, with the final shard-2 window deriving the
empty clause.

Adjacent modules must use the same shared canonical checkpoint array
definition. The checker exposes caller-named parsed endpoints and replay-free
implication/terminal composition for this purpose.

Plain action-list chunking is insufficient: without exact rebased endpoints,
the checker still retains the full preceding clause state and the giant
terminal equality.

## Claim boundary

This work does not establish the p5 UNSAT theorem, does not provide the
source-to-CNF theorem, and does not close either live production `sorry`.
