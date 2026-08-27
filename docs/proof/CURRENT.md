# Current proof pointer

The documented head is receipt seal
`49850c7a2a7a15415bb638ed5736d9cd34331381`, recorded in the
[consolidation checkpoint](checkpoints/consolidation-refactor-w3-w4-2026-08-26.md).
Its explicit predecessor is `0b752f3a2e3ffdb1f25ad0e27a05e18432d8fbfa`.

The bounded W1–W4 consolidation packet is **COMPLETE** under its recorded
receipts. The strict original refactor's cluster-isolation status is **OPEN**:
the two live implementation waivers are
`TwoSourceCanonicalSurface → TriApexEndpointRetainedOmission` and
`FreshThirdPinnedFanPacket → TriApexEndpointRetainedOmission`.

The current proof frontier has 28 reachable obligations and 6 deliberately
off-spine obligations. Neither Problem 97 nor Problem 96 is proved. The
[completion-qualification receipt](../../proof-status/receipts/consolidation-refactor-completion-qualification-gate-receipt.json)
records this scope qualification.

For machine/live status, see
[proof-status/README.md](../../proof-status/README.md) and the
[live blueprint](../live-blueprint.md). Future accepted deltas replace only
this pointer; checkpoint files remain append-only.
