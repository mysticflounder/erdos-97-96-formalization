# CardGeThirteen exact-13 coarse-cell catalog

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Scope

`CardGeThirteenExact13CoarseCellCatalog.lean` defines the finite catalog used
to index the source-derived exact-13 coarse signature. Its entries retain the
boundary orientation, the uncovered label in the five-label second-opposite
interval, and the first second-apex row's two-or-three-label interval slice.

The ordinary kernel `decide` theorem
`exact13CoarseCellCatalog_card` proves that the catalog has 100 entries.
`exact13CoarseCellOfSignature_mem_catalog` sends every source signature to a
catalog member. The orientation specification proves that the selected code
uses the ingress's direct or reflected order, and the complementary-slice
theorem proves the exact `L` pins used by the computational catalog.

This is a source-coverage bridge only. It does not prove that any catalog cell
is contradictory and does not promote a PIQD result into Lean.

## Validation

Lean language-server elaboration is clean for both the catalog and its coarse
signature ingress. Their printed axiom closures contain only `propext`,
`Classical.choice`, and `Quot.sound`. The forbidden-declaration scan and
`git diff --check` are clean.

A governed `lake-build`, aggregate import, fresh spine inspection, independent
promotion review, and Lean-ingress binding remain pending. A foreign governed
build was active while this source was prepared, so its output cannot validate
these edits.
