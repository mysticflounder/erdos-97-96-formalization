# FreshThird FirstNonHit rich-apex depletion wave v1

This directory contains one bounded, cardinality-independent exact-rational
feasibility wave for the alias-aware `2+1` radius partition of the rich-apex
minimal-deletion packet. It deliberately stops after finding a source-allowed
`2+1` witness; the `2+2` and `2+1+1` partitions were not searched.

Run it with:

```bash
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1/run_wave.py
```

The driver performs a deterministic rational-rotation grid search, writes one
pinned SMT2 witness plus one known-SAT and three malformed-UNSAT controls, runs
the byte-identical files through Z3 and cvc5, and independently reloads the
witness and each solver's returned model through `fractions.Fraction` to check
the metric and convexity contract. Every SMT2 artifact contains exactly one
`(check-sat)`; the pinned witness follows it with one `get-value` readback.

## Verdict boundary

`SAT_LOCAL_PACKET` means only that this named finite local packet is exactly
realizable. It is not a P97 counterexample, it is not a universal theorem, it
does not close the FreshThird residual, and it does not provide a finite-to-
universal lift. A future UNSAT in another exact scope would likewise apply only
to that explicitly encoded scope unless separately promoted through the Lean
ingress/coverage/certificate/consumer/lift contract.

See `SOURCE_MAP.md` for the ENCODED/OMITTED ledger and `RESULTS.md` for the
checked outcome.
