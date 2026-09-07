# Exact-thirteen wave6 partial replay and third-apex measurement

**Status: NONTERMINAL.** This is a read-only recovery audit of an interrupted
finite campaign. It establishes no exhaustive coverage, UNSAT result, Lean
terminal, or aggregate proof closure. The frozen checker completed its full
7,509-addition replay successfully on September 6, 2026.

The current proof authority is
[the atomic descent proof](../erdos-97-descent-prose-proof-atomic.md).
The [original wave6 closeout](2026-09-06-exact13-witnessed-key-guarded-cegar-wave6.md)
remains the historical producer record. This audit preserves that run tree
and writes its output in a separate registered lane.

## Recovery boundary

The interrupted bank contains 63,509 sequential records. Its state file
records 63,508 refinements: the final appended row is retained, and the
one-row state lag is reported. No terminal record is inferred from that lag.

| Artifact | SHA-256 |
|---|---|
| Original effective root, 432 variables and 31,283 clauses | `238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f` |
| Imported immutable 56,000-row bank | `ed2bf13c87c5969be1b3ff45711a37fd7fc2346dfb1402122549141088f74f11` |
| Interrupted 63,509-row bank | `2f18fb2f8930767e641049286dbe40da7d6fb0b8543f20fc8abd519483c8b8c2` |
| Retained completed import-replay report | `3a01167ee3307cf7d6401e1144c77114a03416e760fe2f34c56a97f593060372` |

Only the 7,509 additions receive a new model-and-cut replay here. The
56,000-row prefix inherits the authenticated prior import replay; this audit
does not recheck all historical parent assignments against the later root.
The live bank and the separate copied bank retain all 63,509 rows.

## Proposed third-apex refinement

Write `G_c` for the raw global row at center `c`, interpreted as empty when
that center is one of the two suppressed blocker centers. The proposed
additional condition is

> For every global center `c`, if `2 ∈ G_c`, then `|G_c ∩ G_2| ≤ 1`.

The source proof route uses raw label 2 as the third Moser apex, proves it
lies on the original boundary, and applies the existing one-boundary
intersection bound. Transport to raw labels uses injectivity of the label
map. The finite measurement below does not itself prove this source
implication; the separately owned Lean successor module must supply its
checked source producer and coverage consumer.

For each `c ∈ {3,…,12}` and unordered pair `{i,j}` outside `{2,c}`, the
candidate CNF adds

```text
B0_c ∨ B1_c ∨ B0_2 ∨ B1_2 ∨
¬G_c[2] ∨ ¬G_c[i] ∨ ¬G_c[j] ∨ ¬G_2[i] ∨ ¬G_2[j].
```

There are `10 × choose(11,2) = 550` clauses and no new variables. Both
source-row and target-row blocker guards are required. When either row is
suppressed, a guard literal satisfies the clause and the semantic
intersection is empty. When both rows are active and contain two common
points, the clause for that pair is false if `2 ∈ G_c`. Conversely, a false
clause witnesses two common points in active rows with `2 ∈ G_c`.
The root's own-center exclusions justify omitting center 2 and pairs
containing 2 or `c`. These implications concern the finite encoding under
its root constraints; they make no assertion that arbitrary keys have a
geometric realization.

The final complete scan found 1,669 exclusions among the 7,509 additions.
The first is `model-56023.json`, with SHA-256
`540f751bb5389fa8e1a0570a966a78fa0303060e089166447cd1e5abce8859b1`:
mirror orientation, blockers `{4,5}`, `G_2 = {1,4,5,6}`, and
`G_3 = {1,2,6,12}`. Thus `2 ∈ G_3` and the intersection is `{1,6}`.
This model satisfies the previous root and guarded conditions. The last
retained model, index 63,508, survives the new condition. No exhaustive
coverage claim follows from excluding some previously admitted models.

## Validation and retained receipt

Checker: [audit_exact13_wave6_partial_replay.py](../../scripts/audit_exact13_wave6_partial_replay.py).
Tests: [test_audit_exact13_wave6_partial_replay.py](../../scripts/test_audit_exact13_wave6_partial_replay.py).
Registered output:
`scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/`.
The retained [receipt](../../scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/partial-replay-receipt.json)
has file SHA-256
`328919a9ff0501621231094fd529b1ec4f15b6c3f75af7140549d2d5d12f3c11`
and internal event hash
`1b60a2db18111fd8886e5c142af6ad81d43fb2daaa815547f7117166c80a5d5a`.
The [run manifest](../../scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/run_manifest.json)
binds fifteen source files and six input artifacts. Its lane base remains
`9852eb8cb5f8283d7f5a8e0d06508590c45934bc`; the final replay ran after
documentation checkpoint `6806d13fc`. The receipt separately identifies
the original producer base `fd020fbb3255253b07ffc8229ca6b2c7883ff1d1`.

The checker SHA-256 is
`a00c86e7d456b9dbcf849e2ee02f93293917193aaa042cea896836656070a02c`;
the test SHA-256 is
`957867b4145a4fd65b275ea707ed74037904384bbb9c24918df961685176fb8c`.

Validation commands, run from the repository root:

```bash
PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=scripts uv run --no-cache --no-sync pytest -p no:cacheprovider --basetemp scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/tmp/pytest scripts/test_audit_exact13_wave6_partial_replay.py
PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=scripts uv run --no-cache --no-sync python scripts/audit_exact13_wave6_partial_replay.py
```

Nine tests passed, including the retained import-replay preflight and
rejection checks for incorrect solve indices, cut kinds, and overlapping
input/output trees. The full replay exited successfully with:

- 7,509 reconstructed valid models and 7,509 reconstructed cuts;
- 5,700 one-form and 1,809 two-form additions;
- agreement between the semantic third-apex test and its 550-clause CNF on
  every model: 1,669 excluded models, with 1,746 violated clauses in total;
- identical before/after hashes for all 190,546 files in the original run;
- an authenticated 63,509-row copied bank with the original bank hash.

The inherited 56,000-row prefix is checked against its pinned migration
receipt and corresponding immutable rows; it is not counted as newly
replayed models. The large copied bank remains generated replay output;
its path, count, and hash are bound by the retained receipt.

An independent read-only audit accepted the final replay's authentication
and bounded claims. The manifest's source set covers the replay dependency
chain; it is not a census of every transitively imported module. In
particular, the imported quotient-cone diagnostic is not executed by this
replay and is outside that source set.

No solver is launched by this lane. Universal checked bank coverage
remains the open finite obligation.
