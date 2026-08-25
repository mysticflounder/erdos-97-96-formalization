# Attic bundle — two-deletion transcription oracle (2026-08-25)

## What this bundle is

`TwoDeletionTranscriptionOracle.lean` holds eight declarations that were **moved
out of the live Lean tree, verbatim and byte for byte**, during wave
W3-TD-cleanup of the consolidation refactor. Nothing was deleted, rewritten,
re-indented, or re-proved: the text in the attic file is the exact text that
stood in the source file at commit `fc4c0c7c`, in source order.

Their role in the branch was as a **retained transcription oracle** for
`twoDeletionOutcome_of_ingress`, recorded in
`proof-status/receipts/w3-td-gate-receipt.json`. They are kept here so that
role stays auditable after the live file was narrowed.

## Source

| field | value |
| --- | --- |
| source path | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean` |
| source commit | `fc4c0c7c` |
| namespace | `Problem97.ATailFrontierLiveClosure` |
| lines moved | 616 |
| source file length before | 1360 lines |
| source file length after | 744 lines |

The removal from the source file is a **deletion-only** diff: two hunks,
`-153,105` and `-848,511`, with no added or modified lines and no change to the
import block.

## Per-declaration line ranges at `fc4c0c7c`

Each range covers the declaration's docstring through the line before the next
top-level item in the source file.

| lines | declaration |
| --- | --- |
| 153–211 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_frame` |
| 212–257 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` |
| 848–974 | `false_of_exactFourMutualOmission_fourCenterCommonDeletion_frame` |
| 975–1048 | `false_of_exactFourMutualOmission_fourCenterCommonDeletion` |
| 1049–1143 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame` |
| 1144–1215 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission` |
| 1216–1291 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters_frame` |
| 1292–1358 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters` |

## Callers map

The kernel callers of these eight declarations were only each other. Nothing
outside the bundle reached any of them, which is why the move is closed under
the live build.

| callee | kernel callers |
| --- | --- |
| `..._blockerCollision_frame` | `..._blockerCollision` |
| `..._blockerCollision` | none |
| `..._fourCenterCommonDeletion_frame` | `..._fourCenterCommonDeletion`, `..._oneWayCrossOmission_frame` |
| `..._fourCenterCommonDeletion` | none |
| `..._oneWayCrossOmission_frame` | `..._oneWayCrossOmission`, `..._fiveCenters_frame` |
| `..._oneWayCrossOmission` | none |
| `..._fiveCenters_frame` | `..._fiveCenters` |
| `..._fiveCenters` | none |

The three two-deletion leaves that the bundle's proofs consume —
`b1_globalGapOrClosedTerminal_of_counterexample`,
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`,
and `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` —
stayed in the live source file, byte-identical.

## Integrity

```
sha256(TwoDeletionTranscriptionOracle.lean) =
  70842f503d5b810c3d564420e1864587b22edd16ab2864bddc97099ca0b6be1b
```

The moved region of the attic file (the lines after the provenance header,
import, namespace/open/attribute preamble, and before the closing `end`s) was
compared line for line against the `-` lines of
`git diff HEAD -- lean/.../TwoDeletionCollision.lean` with the leading `-`
stripped. Both sides are 616 lines and hash to
`73636ac7d6e480c213caac9e55768d6a38fa2e370703e649c10903c7a8b7e6fc`.

## Not in the Lake build

This directory sits outside the Lake source tree (`lean/`) and is named by no
target in `lean/lakefile.toml`. `lake build` never reads it, and no `.olean` is
produced for it. Its `import` line and preamble exist only so the text can be
opened in an editor with the right context and, when the surrounding branch
state permits, checked by hand with:

```bash
cd lean && lake env lean ../attic/twodeletion-transcription-oracle-2026-08-25/TwoDeletionTranscriptionOracle.lean
```

### Standalone elaboration status

Checked on 2026-08-25 against the tree built at the W3-TD-cleanup checkpoint:
the command above exits `0` with **zero errors**. The only output is the
`linter.style.moduleDocstring` style warning, repeated on some of the
preamble `open` lines because the file opens with a declaration docstring
rather than a `/-! ... -/` module docstring. The number of repeats is not
stable across runs (2, 5 and 8 were observed in three runs on 2026-08-25);
no run reported an error or a `declaration uses 'sorry'` warning. No private helper of the source file is reached — the five live
declarations the moved proofs consume
(`b1_globalGapOrClosedTerminal_of_counterexample`,
`exactFour_twoDeletion_crossOmission`,
`exactFour_fourSurvivingCenters_survivalSquare_split`,
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`,
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`) are
all public and all stayed in the live file. The one `private` declaration in
the source file, `four_mem_card_four_split`, is used only by
`exactFour_fourSurvivingCenters_survivalSquare_split`, which was not moved.

This status is a convenience check, not a gate. The file is still outside the
build and no receipt depends on it elaborating.

## Do not resurrect

These eight declarations are **not** a current proof obligation and must not be
re-imported into the live tree, re-stated, or counted in the open frontier. They
are retained evidence for the two-deletion transcription-oracle role only. Any
proposal to bring them back has to go through `docs/dead-ends.md` first.
