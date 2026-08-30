# Rigid221 S0 common-core run report

Date: 2026-08-30  
Lane: `rigid221-s0-common-core-20260830`  
Run: `common-core-v1`  
Scope: bounded fixed-order source subsets only

## Result

The corrected retained-role common packet has 68 assertions and is `UNSAT`
through PiQd/Z3. Its exact authenticated journal SHA-256 is
`473922d0a24715e51bf7189fb20cc757429eb1b559763f36b930e5426e090a67`.

Two fresh-session deletion passes reduced it to a 12-assertion packet. The
final journal SHA-256 is
`b9483a6e92b5fff90cc127ebda3a2459d2c88259465b99975b72e72966c5e0f2`.
All twelve single-assertion omissions returned `SAT`, so the packet is locally
irredundant for this occurrence order and solver configuration.

The final source assertion indices are:

```text
0, 3, 4, 5, 115, 118, 148, 156, 158, 198, 213, 349
```

Only `O`, `m1`, `m2`, `delta`, and `v` occur. A direct coordinate proof is
recorded in
`docs/audits/2026-08-30-rigid221-s0-common-core-theorem-extraction.md`.

## Independent replay

The same twelve mathematical assertions, with only the three Z3-specific
options removed, were replayed through PiQd/cvc5 1.3.3. cvc5 returned
`UNKNOWN` at the 330-second daemon deadline. This is neutral evidence.

## Custody

- `certificates/rigid221_s0_common_core_v1/SHA256SUMS` checks the deterministic
  extraction bundle.
- `certificates/rigid221_s0_common_core_v1/PIQD_SHA256SUMS` checks the promoted
  journals, necessity ledgers, full PiQd results, and receipt summary.
- `results.json` is the sparse machine-readable run summary.
- `run_manifest.json` pins the lane base plus source and input digests.

No source-universal or Lean theorem is claimed. The next proof obligation is a
coordinate-level Lean helper followed by a fixed-cell source-ingress lemma.
