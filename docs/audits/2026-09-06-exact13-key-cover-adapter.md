# Exact-13 source-indexed key coverage adapter (2026-09-06)

Lane: `exact13-key-cover-adapter-20260906`

Base HEAD: `be28c8c1c44f57a69009f33da061062f70207ff4`

## Deliverable

Added `KeyCandidateMatches`, `KeyEntryCovers`, and `ValidKeyCover` in
`CardGeThirteenExact13SourceIndexedBankCoverage.lean`.  The adapter transports
raw candidate endpoints through the key's certified `orderIndex`, proves that
key-matched candidates satisfy the source `candidatePredicate`, and exposes:

- `entry_covers_of_key_match`, from exact center/support equality and
  `sourceOrderValid` to `Entry.Covers`;
- `bankCovers_of_validKeyCover`, from coverage of every member of `validKeys`
  to the existing `BankCovers` predicate.

No concrete bank, generated certificate, exhaustive root refutation, or
promotion claim is introduced.  The first missing antecedent remains a genuine
`ValidKeyCover` witness for a concrete bank.

## Verification

- `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverage` — exit 0.
- `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverageTest` — exit 0.
- Direct `lake env lean` check of the focused test module — exit 0.
- The focused test module prints both requested theorem types and their axioms:
  `[propext, Classical.choice, Quot.sound]`; no `sorryAx`.

The global proof-blueprint resync emitted an unrelated pre-existing private
symbol/environment mismatch while the Lean targets themselves built
successfully.  No commit or push was performed; foreign dirty paths were not
edited, staged, reverted, or cleaned.
