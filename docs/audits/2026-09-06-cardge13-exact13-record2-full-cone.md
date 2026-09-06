# Exact-13 record 2 two-center closure audit

Date: 2026-09-06

## Claim boundary

This lane closes the fixed five-row quotient group `[2, 205]` against an
all-center four-point completion using only global centers 2 and 7.  It does
not prove that every source input maps to this group, close the other retained
groups, or provide a Lean theorem.

The authoritative artifact is
`scratch/runs/cardge13-exact13-record2-full-cone-20260906/run-0001/record-002-two-center-closure.json`.
Its domain-separated content hash is
`d4917880cdcee033890611d83c0c3736d40da24d64b8c05ad17bed418ef6f3be`.

## Exact replay result

For each center, the checker enumerates the canonical 495 four-subsets of the
other twelve labels, reconstructs the equality quotient from the pinned five
rows plus the candidate global row, and projects all 1,430 strict Kalmanson
forms.

- Center 2: 493 supports have an exact one- or two-form positive cancellation.
  The only survivors are `1359` and `1459`.
- Center 7: 491 supports have an exact one- or two-form positive cancellation.
  The only survivors are `1235`, `1245`, `1359`, and `1459`.
- The resulting eight survivor pairs all have a one-form zero projection.  In
  lexicographic pair order, the form indices are
  `378, 392, 168, 168, 392, 386, 168, 168`.

Consequently every possible choice of four-point rows at centers 2 and 7 is
covered by an exact cancellation.  No SMT UNSAT status is used in that finite
argument.  The checker independently reconstructs every support, quotient,
and certificate from the pinned source inputs when run with `--verify`.

## PIQD diagnostic

Before the two-center table was found, PIQD/Z3 tested the first center-2
support that defeated the one/two-form checker, `1359`, against the complete
rational cone.  It returned an exact replayed distance certificate.  That
diagnostic is preserved as
`record-002-first-survivor-piqd.json` (SHA-256
`42fc0f7d9e4e849a28af02f53c3391a8e8e971d21c97fb332f58521ca503bfb2`).
It establishes that a single-row full-cone search cannot reject this support;
the second global row is genuinely needed.

The compact retained diagnostic does not itself retain the PIQD receipt,
solver binary identity, journal, or copied producer.  It is therefore an exact
replayed model diagnostic rather than independently custodial PIQD evidence.
The two-center closure and its verifier do not depend on that diagnostic.

## Reproduction

```bash
uv run pytest -q scripts/test_certify_exact13_record2_full_cone.py
uv run --with ruff ruff check scripts/certify_exact13_record2_full_cone.py scripts/test_certify_exact13_record2_full_cone.py
uv run python scripts/certify_exact13_record2_full_cone.py --verify \
  scratch/runs/cardge13-exact13-record2-full-cone-20260906/run-0001/record-002-two-center-closure.json
```

Observed results: three tests passed; Ruff passed; replay reported 493 and 491
single-center rejections, eight pair leaves, and artifact self-hash
`d4917880cdcee033890611d83c0c3736d40da24d64b8c05ad17bed418ef6f3be`.
An independent reconstruction further counted 460/33 one-/two-form leaves at
center 2 and 477/14 at center 7, with no mismatch.

## Promotion requirements

Lean ingress still needs provider-tagged equality paths for the retained form
indices, positive-row proofs for the selected endpoints, a checked weighted
cancellation entry for every leaf, and a source-faithful coverage theorem.
The finite record-2 artifact is therefore proof-producing solver evidence, not
yet a consumer-reachable Lean closure.
