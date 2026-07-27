# Three-omitted blocker-map count

## Verdict

Let `f : A → A` be a self-map of a finite type. Suppose:

- three pairwise-distinct values are omitted from `f`;
- `f a₁ = f a₂` and `f b₁ = f b₂`;
- the two displayed image values are distinct.

The strongest unconditional conclusion is the disjunction

1. a third collision fiber exists, with image value different from both known
   values; or
2. the first known fiber contains a source different from both `a₁` and `a₂`;
   or
3. the second known fiber contains a source different from both `b₁` and `b₂`.

Thus three omitted values force **third collision or enlargement of a known
fiber**, not either branch separately. Fixed-point-freeness is not used.

No cardinal lower bound beyond finiteness is needed. The assumptions already
imply `|A| ≥ 5`: the three omitted values and two distinct attained values are
five distinct elements.

## Scratch Lean theorems

File:

`scratch/exact-four-three-omitted-counting/ThreeOmittedMultiplicity.lean`

Main theorem:

`Scratch.ExactFourThreeOmittedCounting.third_fiber_or_larger_known_fiber_of_three_omissions`

Its exact conclusion is:

```lean
(∃ x y, x ≠ y ∧ f x = f y ∧
    f x ≠ f a₁ ∧ f x ≠ f b₁) ∨
  (∃ x, x ≠ a₁ ∧ x ≠ a₂ ∧ f x = f a₁) ∨
    ∃ x, x ≠ b₁ ∧ x ≠ b₂ ∧ f x = f b₁
```

The proof repairs `a₂` and `b₂` to two omitted values. If none of the three
conclusion arms holds, the repaired self-map is injective; finiteness makes it
surjective, contradicting omission of the third value.

The file also proves:

`Scratch.ExactFourThreeOmittedCounting.third_fiber_of_three_omissions_of_known_fibers_exact_two`

This derives the third-fiber arm alone if each known pair is additionally
assumed to exhaust its entire global fiber. Merely having two named collision
rows does not supply those global exhaustion hypotheses.

Validation command:

```bash
cd lean
lake env lean -M 12288 \
  ../scratch/exact-four-three-omitted-counting/ThreeOmittedMultiplicity.lean
```

Result: exit code `0`, no output.

## Sharpness

There is no cardinal-only route to the third-fiber arm. For every `n ≥ 5`, a
fixed-point-free map on `Fin n` may have only the two collision fibers:

```text
q(0)=1, q(1)=0, q(2)=0, q(3)=1, q(i)=0 for i≥4.
```

It omits at least three values. Its two fibers have sizes `2` and `n-2`, so a
known fiber enlarges and no third collision value exists.

Conversely, enlargement of a known fiber is not forced. On `Fin 6`:

```text
q(0)=2, q(1)=0, q(2)=1, q(3)=0, q(4)=1, q(5)=2.
```

This is fixed-point-free, omits `3,4,5`, and has three collision fibers, each
of size two. Hence all three disjuncts in the main theorem are necessary.

## Production inventory and live-anchor mapping

The current two-omission theorem is

`Problem97.ATailBiApexBlockerMultiplicity.second_fiber_or_larger_first_fiber_of_two_omissions`

in `lean/Erdos9796Proof/P97/ATail/BiApexBlockerMultiplicity.lean:35`.
Its packaged consumer is

`Problem97.ATailBiApexBlockerMultiplicity.FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber`

at line 108. Applying either result when two distinct collision fibers are
already known is vacuous on its "second fiber" branch: the other known fiber
can witness it. The three-omitted theorem is therefore a genuine strengthening.

At the live anchor

`Problem97.ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`

in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7372`, instantiate:

- `f` with `H.blockerVertex` on `CriticalShellSystem.CarrierVertex D.A`;
- the three omitted values with the three robust apices in `T`;
- `(a₁,a₂)` with `(P.source₁,P.source₂)`;
- `(b₁,b₂)` with `(Pρ.source₁,Pρ.source₂)`;
- `hfa`, `hfb` with `P.blockers_eq`, `Pρ.blockers_eq`;
- distinct known image values with `hblockersNe`.

The omission facts follow from
`FullyDeletionRobustAt.blockerVertex_ne`
(`ATail/DeletionRobustness.lean:134`) after converting the three richness
fields in `T` using
`fullyDeletionRobustAt_of_apexRichClassStructure`
(`ATail/ApexRichClassStructure.lean:105`). Distinctness of the three apices
comes from their distinct surplus-packet indices and
`oppositeVertexByIndex_ne_of_ne`
(`SurplusM44Packet/Shard01.lean:1348`).

The three theorem arms map to the production anchor as follows:

- **third fiber:** a new equal-blocker source pair outside both named blocker
  values;
- **larger `P` fiber:** a third carrier source has `P`'s blocker;
- **larger `Pρ` fiber:** a third carrier source has `Pρ`'s blocker.

This is a sharp finite reduction, but it does not close the anchor. The third
fiber has no automatic localization to either exact-four row/cap. In either
enlargement arm, the extra source is not automatically one of the opposite
row's two named sources. Consequently the count alone proves neither a named
three-hit shell nor one of the four required cross-memberships.

The missing geometric bridge must show one of:

- an extra source in a known blocker fiber is an opposite-row named source,
  yielding a cross-hit;
- a third collision localizes to a named exact-four shell and yields the
  three-hit arm; or
- both known global fibers are exhausted by their named pairs, forcing the
  third-fiber branch, followed by such a localization result.

Existing exact-four locking only gives a global fiber upper bound of four:
`Problem97.ATailAnchoredDoubleDeletionProducer.qBlockerFiber_card_le_four`
in `ATail/AnchoredDoubleDeletionProducer.lean`. It does not provide the
exact-two exhaustion needed to eliminate the enlargement arms.
