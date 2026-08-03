# Round 6 full-multiplicity results

## Scope

Schema v4 is an external, exact-`n = 15` target-specific relaxation for
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It keeps schema v3 frozen and replaces its generic global K4 witness with a
positive-radius equality shell: for every non-apex center, membership is
equivalent to equality with the selected radius and the shell has cardinality
at least four.  A center already used by a canonical critical row is tied to
that exact row.

This is sound pruning for a hypothetical P97 counterexample, but it is not a
coordinate realization and it is not a Lean proof of the anchored theorem.

## Runs

| cases | timeout per case | result |
| --- | ---: | --- |
| `fresh_SSS_k1_d3_f2` | 300 s | `unsat` in 14.02 s (smoke/regression case) |
| `paired_DDD_k0_d1` | 300 s | `unknown` (`canceled` at timeout) |
| `fresh_DDD_k0_d2_f1` | 300 s | `unknown` (`canceled` at timeout) |

The DDD twin run used two workers and took 302.40 seconds wall clock.  Its
source-authenticated artifacts are in
`artifacts/20260801T220906.995940Z-cases-pid25658/`; the successful SSS smoke
artifact is in `artifacts/20260801T220757.354027Z-cases-pid20770/`.

## Follow-up: square separation

The pinned/full-shell audit identified one new DDD-specific consequence: if
the blocker selected by the deleted source has retained point `k` in its full
critical row and fresh point `f` outside it, then their squared distances from
that blocker are unequal.  Schema v5 adds exactly this implication, rather
than a global unproved converse between symbolic `d` and `s` variables.

Its SSS regression case remains `unsat`; the 60-second smoke completed in
22.7 seconds at
`artifacts/20260801T222324.430495Z-sqsep-pid82844/`.  The corresponding hard
fresh-DDD run timed out as `unknown` after 302.2 seconds at
`artifacts/20260801T222359.826223Z-sqsep-pid85894/`.  Thus square separation
does not by itself decide the hard DDD representative.

## Follow-up: cross-cap rich-slice localization

The source theorem
`false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap` now proves
that a used critical shell whose center is in strict cap `i` cannot contain two
points from any rich radius slice in a distinct strict cap `j`.  Schema v6
adds only this implication, for every used canonical blocker and every
other-cap rich slice.  Its run is a new sound relaxation experiment and must
not be read as a closure unless its result is both recorded here and connected
to a proved cardinality/normal-form reduction.

The representative `fresh_SSS_k1_d3_f2` is `unsat` in 24.60 solver seconds
under schema v6, with the reproducibility record at
`artifacts/20260801T223839.381376Z-caplocal-pid46925/`. A source-only
encoding audit confirms that this `PbLe` clause is exactly the local Lean
intersection bound under the frozen exact-15 labels. The external encoding
still needs an explicit interpretation bridge from `used(center)` to the Lean
`IsUniqueFourCenter` and selected-shell hypotheses, so this remains
source-matched evidence rather than a formal closure. Direct Lean checking of
`FrontierLiveClosure.lean` accepted the new conditional producer; the ordinary
module build is independently blocked by an existing import cycle through
`WitnessPacketInterface`, `U2`, `N8`, `N9`, and `PinnedMultiplicity`.

The hard representative `fresh_DDD_k0_d2_f1` remained `unknown` at the
five-minute limit under the same v6 schema. Its reproducibility record is
`artifacts/20260801T224403.436616Z-caplocal-pid70174/`. Thus cross-cap
localization alone does not decide the D44/D44/D44 residual.

## Interpretation

The added full-shell multiplicity semantics preserve the previously known SSS
contradiction but did not decide either hard DDD representative within five
minutes.  This yields neither a survivor nor a new theorem.  The next useful
move is to identify a further *sound* clause family from the pinned-multiplicity
bank that strengthens DDD specifically, rather than treating these timeouts as
evidence for feasibility.
