# Card-ge-thirteen exact-13 coarse-cell classifier

Date: 2026-09-05
Lane: `cardge13-exact13-coarse-cell-classifier-20260905`
Base commit: `7951fe6cc6d540655cf48f1775c09a943452c3f8`

## Claim scope

This checkpoint defines the first source-facing finite split for the variable
five-row exact-13 packet. It does not close the exact-13 branch and does not
promote any PIQD verdict into Lean.

The finite signature retains:

- direct or reflected boundary orientation;
- the uncovered raw label `z` in the fixed five-label second-opposite
  interval `I2 = {8,9,10,11,12}`;
- the exact `K ∩ I2` slice, of cardinality two or three and disjoint from `z`;
- the complementary `L ∩ I2` slice; and
- the four cardinality-at-most-two intersections `C0 ∩ K`, `C1 ∩ K`,
  `C0 ∩ L`, and `C1 ∩ L`.

There are exactly

```text
2 orientations × 5 choices of z × (C(4,2) + C(4,3)) = 100 cells.
```

The generated catalog records `source_coverage: false` until the Lean ingress
is governed-built and a catalog-membership theorem is connected to it.

## Source bridge

`CardGeThirteenExact13CoarseCellIngress.lean` defines
`ExactThirteenCoarseCellSignature` and constructs it from the source packet.
The proof normalizes `K` as the tight-cover row omitting `z` and `L` as the
other second-apex row containing `z`; it does not assume that the original
named `firstRow` is always `K`.

The four overlap bounds come from the current raw ingress theorems
`fivePositionalRows_sourceRow₁_firstRow_inter_card_le_two`,
`fivePositionalRows_sourceRow₂_firstRow_inter_card_le_two`,
`fivePositionalRows_sourceRow₁_secondRow_inter_card_le_two`, and
`fivePositionalRows_sourceRow₂_secondRow_inter_card_le_two`. The prior Boolean
formula encoded only the two bounds against `L`; the new producer also emits
the `C0/K` and `C1/K` bounds.

The new module has no `sorry`, `admit`, named axiom, `native_decide`, or unsafe
declaration. It is not yet kernel-validated because the repository's governed
build slot is occupied by foreign live `lake-build` PID 27317.

## PIQD runs

Run `run-0001` generated a self-hashed 100-cell catalog. Its file SHA-256 is
`161e25d990ff527e3826af1a405d891540680bfc21e4a51bd62c144aeff4f160`.

The first pilot selected cell 0:

```text
orientation = direct
z = 8
K ∩ I2 = {9,10}
L ∩ I2 = {8,11,12}
```

The Boolean journal has 49,528 commands, including 21,842 one-form provider
conflicts. PIQD/Z3 replayed every SAT model and reached the 250-refinement
budget. Its status is `REFINEMENT_BUDGET`, not `SAT_SURVIVOR`; no mathematical
conclusion follows from the terminal SAT assignment.

Run `run-0002` resumed from all 250 authenticated cuts with the stronger
one/two-form incidence-path learner. PIQD/Z3 replayed every SAT model and
reached the 1,000-new-refinement budget, for 1,001 recorded solver receipts.
Its terminal status is again `REFINEMENT_BUDGET`, not `SAT_SURVIVOR`; no
mathematical conclusion follows from the final replayed SAT assignment. The
compact event has SHA-256
`012b57bdf613bf160c8e6964e40c0da1e8fe4c67e4e797552e46c43d0d6a9394`,
and the 49,778-command journal has SHA-256
`342dcceb535d61c610e6a74ead1ae08bc456d3e7d787a102d8ce5b34020d03d4`.
The event schema omits full model text and the repeated receipt array while
retaining cut, replay, result-hash, session, and receipt-path custody.

All solver calls use PIQD sessions. No solver binary is invoked directly.

## Validation

The focused producer tests cover the exact 100-cell census, malformed cells,
the `K/L` partition pins, both added overlap bounds, orientation selection,
seed-cut continuation, compact receipts, manifest source authentication, and
registered-run-root output confinement.

```text
uv run pytest scripts/test_cardge13_exact13_coarse_cell_boolean_piqd.py \
  -q --tb=short
14 passed

uv run --with ruff ruff check \
  scripts/cardge13_exact13_coarse_cell_boolean_piqd.py \
  scripts/test_cardge13_exact13_coarse_cell_boolean_piqd.py
All checks passed
```

## Remaining closure work

The exact-13 tight arm still needs all of the following:

1. a governed build and axiom audit of the Lean coarse signature;
2. a typed theorem that its finite signature is represented by one catalog
   member;
3. terminal classification or explicit survivor discharge for all 100 cells;
4. checked provider-cancellation data for each terminal cell;
5. Lean ingress binding and connection to the live outcome consumer.

The fresh-point and adjacent-grid arms remain separate mathematical residuals.
