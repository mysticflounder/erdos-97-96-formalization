# Exact-11 two-radius branch: theorem-bank audit

Date: 2026-07-31  
Scope: read-only audit of `Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch`.

## Verdict

This branch is **not banked as a kernel-clean contradiction**.  The exact-
11 radius split and all of its local inputs are checked, but the final
two-radius theorem remains a `sorry`.  The searched theorem banks contain no
source-clean `False` consumer for the resulting same-center, disjoint 4+4
classes.

## Live declaration and checked producer

The open terminal is

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5983
Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch
```

Its parent at line 6005 performs a checked split using
`interiorPairGood_or_twoDistinctExactFourInteriorRows`, defined at
`ExactFourRobustCapExpansion.lean:1085`.  The two-radius arm supplies:

* two positive, distinct radii at `S.oppApex2`;
* two selected rows with those radii and disjoint supports;
* the no-five hypothesis for every positive radius class;
* exact cardinality four for both full selected classes (derived by `omega`);
* at least two strict-second-cap hits for each class (derived from the cap
  loss bound).

The parent surface is the structure at
`ExactFourRobustCapExpansion.lean:280`; it also retains the original frontier,
minimality/no-`M44`, deletion ingress, and cap-growth profile.  Thus the
unresolved theorem is not missing a local radius-classification premise.

## What was searched and what is reusable

The required theorem-bank registries and indexed Lean corpus were searched,
along with the dedicated scratch bank audit
`scratch/atail-force/two-radius-bank-audit/REPORT.md`.  No declaration with a
compatible statement shape closes this branch.

The closest production route is the statement-compatible adapter from the
frontier-coupled physical residual to
`false_of_criticalPairFrontier` (`FrontierLiveClosure.lean:12498`).  The adapter
is not a closure: its axiom print includes `sorryAx`, because the frontier
closer depends on the still-open original-frontier and common-deletion leaves.
It is also downstream of the exact-four arm, so using it here would be
source-order/circular rather than an independent proof of this branch.

The closest scratch result,
`frontier-coupled-two-four-radius-consumer/FrontierCoupledTwoFourRadiusConsumer.lean`,
only reduces a duplicate scratch residual to

```text
OriginalFrontierUniqueRadiusArm ∨
  ∃ deleted center, Nonempty (CommonDeletionTwoCenterPacket ...)
```

It is not `False`, consumes a duplicate scratch type, and has no production
adapter.  The six-point Euclidean/sparse obstructions and unique-five banks
also do not apply: they require interleaved distinct-center support data or a
unique exact-five class, whereas this branch has two disjoint exact-four
classes with one common center.

## First missing producer

The next theorem must couple the two same-center radius classes to the retained
frontier/deletion context.  A useful source-faithful producer would yield one
of:

1. a common-deletion/critical-fiber packet already consumed by a checked,
   axiom-clean terminal;
2. a concrete cyclic-order or metric certificate involving both four-point
   supports and an actual distinct row center; or
3. a uniform deletion/purification contradiction from `R.minimal` and the
   ingress data.

Local 4+4 circle incidence alone is insufficient: the banked scratch analysis
found the marginal locally satisfiable.  The missing ingredient is therefore
global coupling (frontier history, deletion robustness, or a metric/order
certificate), not another cardinality split.

## Status for cross-lane reuse

The exact-11 work has banked the radius-normal-form producers and several
positive cap/interior lemmas, but **not the contradiction at this terminal**.
Those positive lemmas may be reused by other lanes; the two-radius `False`
statement itself must remain marked open until an independent producer is
proved and wired to a publish target.

