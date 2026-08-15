# Ingress contract

## Scope

This round covers only the exact-17, direct-crossed FreshThird incidence
abstraction inherited from `freshthird_aligned_mutual_crossed_v1` and all three
source-entitled v3 preflights. It does not cover the reversed crossed arm,
either deletion residual constructor, another cardinality, or a universal
finite-core lift.

## Source entitlement

`FaithfulCarrierPattern.classAt` chooses one `SelectedFourClass` at every
carrier center. The encoder's `point_k4[c]` is exactly this chosen support.
Consequently, for each row center `r` and any two selected members `u,v`, the
nodes representing the unordered carrier edges `{r,u}` and `{r,v}` lie in the
same `EqualityCore.EdgeClosure` component. Canonicalizing unordered edges is
sound because `EdgeClosure.flip` supplies the orientation reversal.

`GeneralCarrierBridge.exactAt_blocker` supplies exactness only at an actual
blocker image. Therefore a separator is enabled only under an explicit
`blocker[source] = center` guard. The inherited global-K4 encoding also locks
`point_k4[center]` to that source's selected shell under this identity.
No exactness is assumed at the four final non-blocker centers `4,7,12,16`.

At a guarded blocker center `c`, if a support edge `{c,a}` and an off-support
edge `{c,z}` share an equality component, the recorded row path constructs an
`EqualityCore.ExactOffCircleCore`. The theorem
`false_of_exactAt_of_exactOffCircleCore`, applied with
`GeneralCarrierBridge.realizes` and `exactAt_blocker`, rules out that Boolean
choice pattern.

## Lazy clause schema

Every generated clause is the negation of a conjunction containing:

1. the actual blocker/source identity;
2. membership of `a` in `point_k4[c]`;
3. non-membership of `z` in `point_k4[c]`; and
4. both row-membership literals used by every equality step on the path.

The clause is thus generalized beyond one complete assignment but cannot fire
unless every fact needed to reconstruct the same Lean obstruction core is
present. `generated/cuts.jsonl` records the complete path, the guards, the
generating iteration, source declarations, and a metadata SHA-256 for every
cut.

## Promotion boundary

An incidence `UNSAT` here would be exact-17/direct-crossed finite obstruction
coverage only. The actual result is a closure-clean incidence `SAT` survivor.
Neither result by itself closes a Lean theorem or establishes a P97
counterexample, because the omitted ingress and universal lift remain absent.
