# cf0a86c8 Singular strategy race (flux.local, 2026-07-16)

Adam-authorized resolution of the 654 iter-67 blocker: witness
`cf0a86c8…` returned msolve UNIT ×2 + Singular TIMEOUT identically at
45 s / 900 s / 3600 s, freezing the 654 track fail-closed.

## Setup

The production Singular test (`equality_ideal_probe.singular_script`)
runs `slimgb` over `dp` with one fixed (forward) variable order — the
only strategy that ever ran. A variable permutation in the ring
declaration changes only the monomial order: same ring, same
generators, same ideal; `reduce(1, G) == 0` reads UNIT off a Gröbner
basis under any order. So racing (algorithm × order) variants stays
entirely inside the "Singular verdict on the identical system"
standard.

The exact system (20 variables, 37 polynomials) was rebuilt from the
witness with signature replay (`cf0a86c8…`) and equality-hash replay
(`2155491f…`) — see `manifest.json`. 12 jobs = {std, slimgb, groebner}
× {fwd, rev, 4 seeded permutations}, minus slimgb+fwd (known TIMEOUT
at 3600 s). Encoding smoke-gated per algorithm (unit + nonunit
gates, all PASS) before launch. flux.local: 16 cores, Singular 4.4.1.

## Result

**`slimgb` + perm4 order (seed-4 shuffle: x10y, x11y, x7x, x9x, …)
returned UNIT in 20 seconds.** Verdict payload `0` between markers,
empty stderr (`slimgb_perm4.out`, `WINNER.json`); job script md5
matched the locally generated copy. The blocker was purely the
monomial order, not the ideal's difficulty.

## Consequence

Full-system verdicts for cf0a86c8: Singular UNIT (slimgb, dp, perm4)
+ msolve UNIT forward + msolve UNIT reverse = CROSSCHECKED_UNIT.
Admission-grade artifact produced locally by
`cf0a86c8_admit_recheck.py` (scratchpad; a system_unit_recheck.py
derivative whose Singular calls use the perm4 order — msolve keeps
canonical fwd/rev), including the deletion pass and retained-core
crosscheck. 654 track resumes on admission.

Lesson recorded for the CEGAR parameter surface: when Singular alone
times out against a double msolve UNIT, race variable orders before
escalating wall clock — 6 orders × 3 algorithms found a 20 s win
where single-order escalation burned 3600 s.
