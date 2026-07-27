# Audit of the source-exact two-row hard branch

## Result

`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
does not state a positive terminal.  Its entire conclusion is impossible from
the two collision packets and `hpairsDisjoint`, before any use of
`hcapEightOrCross`, `T`, minimality, or the localized cycles.

Consequently any proof of the current statement must first prove `False` from
its hypotheses and then eliminate `False`.  In the `cap ≥ 8` branch, that
missing contradiction is the real global theorem; the displayed disjunction
does not decompose it.

This is a statement/interface defect, not a countermodel of the complete
`CounterexampleData` hypotheses.  No source-clean derivation of the required
global contradiction was found.

## Kernel-checked negation of the conclusion

The source-clean theorem

```lean
Problem97.ScratchPacketContradictionSearch.
  targetConclusion_impossible_of_exact_disjoint_collisionRows
```

in
`scratch/packet-contradiction-search/TargetConclusionImpossible.lean`
proves the exact negation of the target conclusion from only:

```lean
(P : RetainedInteriorBlockerCollision R)
(Pρ : RetainedInteriorBlockerCollision Rρ)
(hpairsDisjoint :
  Disjoint ({P.source₁, P.source₂} : Finset ℝ²)
    {Pρ.source₁, Pρ.source₂})
```

The proof has two independent parts.

1. The three-hit arm contradicts
   `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`.
   The `ApexRichClassStructure` witness carried by the arm itself supplies
   every hypothesis of that theorem.
2. All four cross-hit arms contradict
   `exact_disjoint_cap_pairs_force_cross_omission_and_two_outside`, applied to
   `P.shell_inter_cap_eq_sources`,
   `Pρ.shell_inter_cap_eq_sources`, and `hpairsDisjoint`.

The first part is also isolated upstream, without importing
`FrontierLiveClosure`, as

```lean
Problem97.HardBranchMathScratch.
  not_exists_canonical_three_hit_at_rich_apex
```

in `scratch/hard-branch-math/NoThreeHit.lean`.

Both checks compile with no `sorryAx`; `#print axioms` reports only
`propext`, `Classical.choice`, and `Quot.sound`.

## What the `cap ≥ 8` branch actually supplies

Away from the four blocker/source coincidences, the two exact rows give six
distinct points in the first strict cap:

```text
P.source₁, P.source₂, Pρ.source₁, Pρ.source₂,
H.centerAt P.source₁ ..., H.centerAt Pρ.source₁ ...
```

The cap-cardinality disjunction therefore records a six-point pigeonhole
split.  In its large-cap arm it adds no positive shell incidence.

The two localized-cycle packages do not supply such an incidence either.
`exists_secondRadiusInterior_localizedCycle` constructs the required
`LPρ, MPρ` from `P` and `Pρ.source₁`, and symmetrically constructs `LP, MP`
from `Pρ` and `P.source₁`.  Thus these packages are available automatically
from the already-established cross-row omissions and distinct radii.

The `hcriticalShellUniqueFourCover` argument is also automatic for every
`CriticalShellSystem`, via:

```lean
centerAt_ne_source
isUniqueFourCenter_centerAt
uniqueFourClass_centerAt_eq_selectedAt_support
```

The genuinely global fields left in `T` give tri-apex richness, the weak
cover inequality

```lean
D.A.card ≤ 4 * (notRobustCenters D).card
```

and exclusion of one center/radius covering all three apices.  None of the
searched source theorems converts those facts into a named cross-shell hit,
two shared outside support points, a deletion-closed proper convex carrier,
or an ordinal/Kalmanson cycle.

## Checked no-go models

Two existing kernel-checked scratch models delimit what cannot prove the
missing contradiction.

- `scratch/exact-leaf-math/TwoCollisionCapOrderModel.lean` gives an exact
  rational Euclidean model with two distinct apex radii, two disjoint
  equidistant source pairs, distinct blockers, all six roles in one strict
  cap, and a compatible strict-convex cyclic order.  It rules out a purely
  local bisector/Kalmanson contradiction in the `cap ≥ 8` arm.
- `scratch/FullTriApexExactTwoIncidenceModel.lean` gives a 17-point finite
  incidence model matching the cap sizes `8,6,6`, the canonical four-row
  cover shadow, three robust rich apices, two exact collision rows, distinct
  blockers, all low-hit bounds, and the cover inequality, while the target
  conclusion fails.  It rules out a proof from the cardinality/incidence
  shadow alone.

Neither model is a Euclidean `CounterexampleData` model, so neither is a
counterexample to the full target hypotheses.

## Lean-ready correction and missing bridge

The honest hard-branch interface is a direct contradiction statement:

```lean
theorem false_of_two_sourceExactCollisionRows_cap_ge_eight
    (...the meaningful current hypotheses...)
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    False
```

Merely restating this theorem is not progress: it is the unresolved global
branch.  A useful next lemma must manufacture at least one new positive
global object.  The closest already-checked terminal is:

```lean
false_of_two_sourceExactCollisionRows_two_shared_outside
```

from `scratch/ResidualFieldAttack.lean`.  It closes by the ordered-cap overlap
bound once one proves

```lean
2 ≤
  (((K₀.support \ S.capByIndex S.oppIndex1) ∩
      (K₁.support \ S.capByIndex S.oppIndex1)).card)
```

for the two canonical rows.  The current hypotheses give each outside part
cardinality exactly two, but do not give a positive overlap.  Other genuinely
useful bridge shapes are:

1. one named cross-shell membership;
2. a proper convex deletion-closed subcarrier contradicting `D.Minimal`; or
3. explicit ordinal comparisons producing a blocker-cycle contradiction.

Without one of these positive bridges, the current disjunctive target cannot
be proved source-cleanly.

## Exact `D.Minimal` instantiation and its first missing arm

`scratch/hard-branch-math/GlobalMinimalityOffCapInstantiation.lean` checks the
strongest immediate ordered-cap placement available from
`ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore`.
It takes

```lean
C := S.capByIndex S.oppIndex1
U := D.A \ C
```

as the prescribed deletion.  The exact-row fact
`(K₀.support \ C).card = 2` proves `U.Nonempty`, while `8 ≤ C.card` supplies a
surviving point.  The resulting source-clean theorem is:

```lean
Problem97.HardBranchGlobalMinimalityScratch.
  exists_capCenter_sharedOutsidePair_or_offCapMinimalCore
```

It returns a center in `C`, a nonempty `V ⊆ D.A \ C`, and either:

1. two distinct members of `V` equidistant from that one cap center; or
2. `Nonempty (MinimalDeletionCore D.A V center)`.

The first arm is already unconsumed.  The closest checked terminal,
`CapSelectedRowCounting.outsidePair_unique_capCenter`, requires two distinct
cap centers equidistant from the same outside pair.  Minimality supplies only
one center, does not identify its pair with either canonical row's outside
pair, and permits the center to equal that row's named center.  The first
genuinely missing premise is therefore a second-center producer of the shape:

```lean
∃ d ∈ C, d ≠ center ∧ dist d s = dist d t
```

(or a stronger identification of `{s,t}` with a canonical outside pair plus
inequality from its named center).

The minimal-core arm has no general source-clean terminal either.
`MinimalDeletionCore.capByIndex_card_ge_six_of_two_sources` and
`MinimalDeletionCore.capByIndex_card_ge_six` require an unavailable equality
between the core center and an indexed opposite apex, and in any event yield
only the already-known cap lower bound six.  The more contextual
`false_of_exactFourMutualOmissionRigid221_minimalCore` is itself proved by
`sorry`.  Finally, `R.noM44` cannot fire without a new construction of an
alternative `SurplusCapPacket` satisfying `IsM44`.

Thus global minimality does not bridge the `cap ≥ 8` arm to an existing
source-clean contradiction.  The shared-radius arm is the first exact stop.

## Validation commands

From `lean/`:

```bash
lake env lean ../scratch/hard-branch-math/NoThreeHit.lean
lake env lean ../scratch/hard-branch-math/GlobalMinimalityOffCapInstantiation.lean
lake env lean ../scratch/packet-contradiction-search/TargetConclusionImpossible.lean
lake env lean ../scratch/exact-leaf-math/TwoCollisionCapOrderModel.lean
lake env lean ../scratch/FullTriApexExactTwoIncidenceModel.lean
```

All five commands exit successfully.  Their printed axiom sets contain no
`sorryAx`.
