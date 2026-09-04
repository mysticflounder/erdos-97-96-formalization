# Exact-five opposed-turn residual QF_NRA post-run audit

## Verdict

**CERTIFIED.** The completed
`exactfive-opposed-turn-residual-qfnra-20260903/run-0005` tree passes immutable
replay and custody checks. This is a formula/profile-scope result only. It does
not claim source realizability, a theorem, live Lean closure, or promotion.

## Run identity and complete inventory

The authenticated run manifest self-hash is
`c93b7bcf02abb8b90676470863aa8a60210652d6a2edea3ea5e70d93463c2deb`.
The exact retained-file hashes are:

| File | Raw SHA-256 | Bytes |
|---|---|---:|
| `run_manifest.json` | `5dde5031ee5fa3237b192cf34a3cc60d4b7e891887e5348fe5772595c773af7c` | 7,722 |
| `events/launch.json` | `419df079a460ddf801964ac45443b59f5d2676d6bd10f30e38fca7eae67577a6` | 676 |
| `events/terminal.json` | `137ca473dba9daaf5e86356cdd355768712e067b339a7a7e8afa77a1d2a61d85` | 2,611 |

The launch and terminal self-hashes are respectively
`f5fc5ad777c026765051d23b060cf1722c11a6bc25e74408d3bd27ae642d27ad`
and
`eabfb133d705fc82582d4fd35d2814050f58b4fcc405a1218336f1a4bf4ab485`.
All 40 manifest source/input pins match current retained bytes. All eight
terminal result hashes match their `result.json` files.

The tree contains 477 regular files and 12 directories, totaling 20,442,849
file bytes. No symlink, non-regular entry, or multiply linked regular file is
present. The canonical `(path, bytes, SHA-256)` inventory hash is
`d98eeab7b0bf373ae5ab70cb64326f98e757c54a8905095fc5f6b0dd9e01ddde`.
The content-plus-metadata snapshot hash is
`2b4c13b1c6010e4fa34cbff5a3d27df0a0bcf1bd232d0d0137cbab299650d8b2`.

## Adapter and PIQD custody

The producer's completed-terminal path was run twice with the exact launch
controls `workers=8` and `timeout_s=60.0`. Both invocations reconstructed all
eight adapter result trees and returned terminal hash
`eabfb133d705fc82582d4fd35d2814050f58b4fcc405a1218336f1a4bf4ab485`.
Wall/user/system timings were 22.335/9.653/1.729 seconds and
17.969/9.727/1.074 seconds. The full tree snapshot was unchanged across both
replays.

Replay authenticated, for each of 16 engine cells, the descriptor, original
and journal SMT, all 42 source snapshots, source manifest, exact engine
artifact labels, fresh session, empty prior receipts, one terminal receipt,
solve record, exported journal, closed session, solver identity, result digest,
effective outcome, and terminal cross-links. The positive-control semantic
records were rerun from exact rational values. No response was lost, every
solve index is 1, and all 16 sessions are closed.

The solver identities are:

- Z3 `z3-4.17.0`, SHA-256
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`;
- cvc5 `cvc5-1.3.3`, SHA-256
  `fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`.

The PIQD session inventory contains exactly the same 16 session IDs as the
retained result trees, with 8 sessions per solver. The observed session window
was 2026-09-04T00:25:14Z through 2026-09-04T00:27:05Z, 111 seconds wall time.
Per-session elapsed seconds were
`0,0,0,0,1,2,7,7,15,15,15,15,35,35,90,90`.
The launch requested 60,000 ms; every authenticated solve record carries the
daemon's 90,000 ms effective deadline. Transport is recorded as the PIQD HTTP
adapter only.

## Exact outcomes

| Query | Z3 outcome / ms | cvc5 outcome / ms | `result.json` SHA-256 |
|---|---:|---:|---|
| positive control | SAT replayed / 3 | SAT replayed / 2 | `449e89c2d75b33542ebb9a9812c6b654688a5ab88f9016ded5a9a831cd16a216` |
| negative control | UNSAT / 0 | UNSAT / 1 | `39e841b094be0fbe4639802c4166502d4bc24e1b12610d760bdedfe87716d349` |
| profile 360 | UNSAT / 15 | UNSAT / 6,625 | `0681718cf605f36a61fc14dad1d0a2358878c07ecd3295b16db5748b86ebb08d` |
| profile 363 | UNSAT / 14,231 | UNSAT / 35,144 | `a5c2702cf08778d8c5818ddbb6de8687e7686da74105bb2295c1d5da20c587e1` |
| profile 376 | UNSAT / 14,363 | UNKNOWN / 90,002 | `fcdb7312a7172c5fb07c3b200ba209f032d9f171030cf8e108201ac05d6d2321` |
| profile 467 | UNSAT / 16 | UNSAT / 6,738 | `c293f2e8f840332a75e92f65aeb8cd7164d11c0134f5bc39d74d0f1caff4c0bd` |
| profile 470 | UNSAT / 14,251 | UNSAT / 34,970 | `3722269836394b4b797cd80f60342f0f013e804519c3155b2031b29e2110d63a` |
| profile 483 | UNSAT / 14,222 | UNKNOWN / 90,024 | `c549dad396e26447712337082b1e3092282e780d633d39f44e513a69ffc204f9` |

All UNSAT solve records have result digest
`263c80e04403ba263e76bb8855a11960feb3a9e8341fd6e577c0a8b6e4104dcf`.
The two UNKNOWN records have digest
`beff21f8ac8e0d1f15e4f2fc020b3c717ba7b520cb91e001e49ac8d2f5096f3a`.
The positive-control Z3 and cvc5 SAT digests are
`354314eefb388fafc650ec0bd329a6b902eb560321ee96e4956417cbbaf8a719`
and
`c15973ba72d2f95738cea571c1199fa98922724a739b3f789f9e0654c00df039`.

The terminal status `TARGET_INCONCLUSIVE` is correct because profiles 376 and
483 contain a cvc5 UNKNOWN. The four profiles with two-engine UNSAT remain
discovery-only, and the Z3 UNSAT results for 376 and 483 remain
discovery-only. Every retained claim boundary is false for source realization,
theorem, live closure, and promotion.

## Governed completed-wave theorem mine

This mine used only the six new target formulas and outcomes. Sorting each
complete SMT command multiset reveals two exact quotient-formula families:

1. the 12-class family `{360,467}`, with 237 asserted atoms and sorted-command
   hash `d1d2ba36587f0a4f9e29140632113e354e4754e77692363d4df6a0099050e2ca`;
2. the 13-class family `{363,376,470,483}`, with 303 asserted atoms and
   sorted-command hash
   `1daf80dcd3eba9b831759a1254ce5e1b626f2140a4d356406820a39d6ee3b849`.

Within each family, the apparent profile differences only permute symmetric
row entries such as `p/q` and, in the 13-class family, `s/t`. The smallest
concrete reusable candidates presently justified by the wave are therefore
two quotient-family contradiction lemmas, one for each assertion set. Their
immediate consumer would be
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` after a
source-facing adapter selects the family.

The first missing antecedent is still the live-source routing theorem: the
broad five-incidence branch must supply the authenticated quotient aliases and
cyclic order and prove that its full source ledger instantiates one of these
two families. A second gap is proof promotion: solver UNSAT custody alone is
not a Lean proof.

Because this state-only lane requested no named atoms and no assumptions, it
produced no usable UNSAT core. Every descriptor has `named_atoms=[]` and
`assumption_ids=[]`; every UNSAT provenance record reports
`named_core_support=false` and an empty source-atom list. Consequently this
wave does not justify dropping any of the 237 or 303 atoms.

One bounded Lean-corpus search was warranted because the two-family candidate
is new. At revision `47d9d140eb65434f336788f1caf093e98e36d7a6`, the query

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean --kind theorem
  "exact-five three-center c1 surplus-apex fixed cyclic order quotient row equal-distance contradiction"
```

returned `six_point_twoCircle_order_incompatible` as the nearest result at
77%. That theorem needs a specific six-point distance-and-order packet. No
current adapter extracts that packet from either full quotient family, so it
does not close the new candidates. The corpus reported index revision
`3b2c14231` at 2026-09-04T00:15Z. No second Lean search was run.

The next governed computation should be a PIQD-only named-core lane over one
representative per family, preferably profiles 360 and 363. It should assign
stable IDs to the normalization equation, `r>0`, all 13 row equalities, all
220 or 286 signed-area atoms, the radius disequality, and the strict source
comparison; request all 237 or 303 IDs; require two-engine UNSAT and supported
core custody; replay each returned core in fresh sessions; and deletion-minimize
in deterministic ID order. The minimized cores must then be replayed against
every member of their family under the recorded row permutation. A smaller
geometric lemma or another Lean reuse search is warranted only after that lane
produces a concrete reduced hypothesis set.

## Audit validation

The focused producer suite passed all 32 tests in 8.06 seconds, and Ruff
passed. The two completed-terminal replays, pre/post tree snapshots, manifest
pin check, filesystem safety inventory, PIQD session comparison, formula-family
mine, and bounded Lean search were read-only. Sparse hygiene for the audit lane
reported zero lane issues; its global blocking flag is caused by unrelated
shared-worktree entries.
