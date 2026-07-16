# ff2eb8fb Rabinowitsch strategy race (flux.local, 2026-07-16)

Second application of the cf0a86c8-flux-race strategy (see that
directory's RACE.md for the full rationale): the 654 iter-68 witness
`ff2eb8fb…` routed NONUNIT (msolve NONUNIT ×2 inline on the equality
shadow), but its forced-pair cert — Rabinowitsch pair (7,8), radical
membership — came back msolve UNIT ×2 + Singular TIMEOUT at 900 s
under the production fixed order, so `--core` extraction refused to
run.

## Setup

Target ideal: the EXTENDED system (37 base equalities +
`1 − t·d²(7,8)`, 21 variables), rebuilt with signature replay
(`ff2eb8fb…`) and base-equality-hash replay (`c64c87d1…`) by
`extract_ff2eb8fb_rabinowitsch.py`; extended hash `8557788d…` in
`manifest.json`. Same 12-job grid as cf0a86c8: {std, slimgb,
groebner} × {fwd, rev, 4 seeded permutations} minus slimgb+fwd (the
production order, known TIMEOUT). Smoke gates 6/6 PASS.

## Result

**`slimgb` + perm4 order (seed-4 shuffle of the 21-variable extended
list: x8y, t, x7x, x4y, …) returned UNIT in 20 seconds** — the same
winning strategy as cf0a86c8, on a different system. Verdict payload
`0`, empty stderr, job script md5 matched the local copy.

## Consequence

Rabinowitsch pair-(7,8) verdicts: Singular UNIT (slimgb, dp, perm4) +
msolve UNIT forward + msolve UNIT reverse — full-system radical
membership crosschecked. Admission-grade cert produced by
`ff2eb8fb_admit_cert.py` (a membership_crosscheck.py --radical-only
--core derivative whose Singular calls use the perm4 order; msolve
canonical fwd/rev; perm4 first-vars asserted against the manifest).

Two-for-two for slimgb + seeded-permutation racing over single-order
wall-clock escalation on this witness family.
