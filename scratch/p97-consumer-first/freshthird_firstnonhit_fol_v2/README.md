# FreshThird FirstNonHit FOL v2

This is one bounded theorem-discovery probe for the live
`FreshThirdCapSourceNonHit` / `FreshThirdNonCanonicalInteraction` residual. It
is cardinality-independent: there is no fixed `n`, cap-size, or finite carrier
bound in the input theory. Mace4 is used only to find an abstraction model;
Vampire is used for the two deliberately synthetic landing-contract controls.

## Source map and ingress contract

The first-order predicates are an incidence abstraction, not a Euclidean model.
Each named clause is intentionally weakened from the source declarations:

| Label | Lean source | FOL content |
|---|---|---|
| A1 | `ATail/BlockerMultiplicityGeometry.lean:70-113` | carrier, center, and blocker-fiber typing |
| A2 | `ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:132-144` | two canonical source rows and distinct source vertices |
| A3 | `ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:2068-2090` | `FreshThirdCapSourceNonHit.sameBlocker` / source-row omission arms |
| A4 | `ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:2191-2255` | normalized residual and interaction constructors |
| A5 | `ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:1257-1309` | exact-four support, blocked deletion, and the consumer-ready three-blocked landing contract |
| target | `ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:1314-1334` | distinct-center selected row with at least three points in common with Q |

The source map records provenance, not a claim that the FOL predicates are
already a Lean theorem. In particular, `blocked_mem` and the exact-four laws
are source-clean incidence consequences used as an intentionally permissive
abstraction.

## Exact commands

Run from this directory (all runs used one process and were bounded):

```text
mace4 -n 4 -N 8 -m 1 < firstnonhit_base.in > base-mace4.log 2>&1
prover9 -t 30 -f firstnonhit_base.in firstnonhit_base_goals.in > base-prover9.log 2>&1
prover9 -t 10 -f firstnonhit_base.in control_three_overlap.in > control-three-overlap-prover9.log 2>&1
prover9 -t 10 -f firstnonhit_base.in control_three_blocked.in > control-three-blocked-prover9.log 2>&1
/Users/adam/bin/vampire control_three_overlap.p > control-three-overlap-vampire-default.log 2>&1
/Users/adam/bin/vampire control_three_blocked.p > control-three-blocked-vampire-default.log 2>&1
```

## Results

* `base-mace4.log`: model found at displayed domain size 7 (indices `0..6`).
  Thus the source-mapped abstraction plus the
  negation of the requested producer is SAT at a finite size.
* `base-prover9.log`: `SEARCH FAILED` at 30 seconds. This is only an
  incomplete consistency search; the Mace4 model is the positive result.
* Both Vampire controls report `SZS status ContradictoryAxioms` and contain
  refutations. The overlap control directly instantiates the existing
  distinct-center/three-common-point terminal. The blocked control first uses
  `blocked_mem` three times, then reaches the same terminal.
* Both Prover9 controls report `SEARCH FAILED` at 10 seconds. They are retained
  as replayable negative results, not as evidence against Vampire.

The concrete Mace4 model collapses the named `ca/cb` rows onto the Q blocker
center (`ca=qa`, `cb=qb`, with `cen(ca)=cen(cb)=cen(qa)`) and has no required
distinct-center three-overlap source. This identifies the missing clause: a
source-level global producer must force either (i) three Q-supported deletions
blocked at one center distinct from the Q center, or (ii) an equivalent direct
three-point overlap. The current non-hit/same-blocker incidence packet does
not force either.

## Classification

The base model is a finite abstraction countermodel only; it is not a P97
countermodel. The control refutations validate the intended Lean landing
contract only. No Lean declaration was changed and no `sorry` was closed.
There is no universal proof or promotion claim from this probe.
