# B1 full-geometric source-context ingress audit

Date: 2026-09-04
Lane: `luna-swarm-b1-full-geometric-source-context-ingress-20260904`
Assignment: nthdegree message `#11983`

## Result

Added the source-clean adapter
`B1FullGeometricCoupledSourceResidual.toExactFourMutualOmissionSourceContext`
in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1FullGeometricSourceContextIngress.lean`.
All source-context fields are forwarded directly from `G`.  The sole derived
field, `source_cross_card_le_two`, uses `Finset.card_le_card` on the inclusion
of the source-row intersection with `(class ∩ interior)` into the source-row
intersection with `class`, followed by `G.source_row_card_le_two`.

No producer corollary or terminal wrapper was added.  The adapter imports only
`B1FullGeometricCoupledSource`.

## Verification

- Base `HEAD`: `e846707a8a319fd097dbb4282773d001b3520c00`.
- Direct check: `lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1FullGeometricSourceContextIngress.lean` — exit 0.
- Governed check: `LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricSourceContextIngress` — exit 0, `10872` jobs.
- Axiom probe for the adapter theorem: `[propext, Classical.choice, Quot.sound]`; no `sorryAx`.
- Marker scan of the source module for `sorry`, `axiom`, `native_decide`, `unsafe`, `admit`, and `exact?`: no matches.
- Import check: one import, the requested source-clean producer module.
- The source SHA-256 is `701a1fb0e2b17e33652baa5317cc1a8d513e7955e62b9a8db335bd10e3807028`.
- The lane checkpoint SHA-256 is `ac666c773b994e8a0e6fd3f3fc65f174aab5cf796883083f073b41335424582b`.
- Nothing was staged or committed.  Existing foreign dirty/staged paths were preserved.

## Indexed preflight

The required single indexed Lean-corpus preflight was attempted for this exact
adapter candidate.  It returned no search result because the configured
`gpt-5.3-codex-spark` search quota was exhausted and the search command failed
during fallback.  The candidate was then checked directly against the exact
context structure and existing source-clean producer module.
