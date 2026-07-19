# Frontier common-deletion bank match

## Scope and status

This lane audits the full parent object

```lean
FrontierCommonDeletionParentResidual F
```

without projecting it to an anonymous common-deletion packet.  The audit keeps
the named sources `F.pair.q`, `F.pair.w`, their shared first-apex radius and
off-surplus placement, the original `CriticalShellSystem H`, both prescribed
opposite apices, `D.Minimal`, `¬ ∃ T, T.IsM44`, and the cap/MEC data carried by
`D` and `S`.

Result: **no existing theorem-bank consumer closes this parent residual**.
There is, however, one genuine bank match and one load-bearing interface loss.
Both are kernel-checked in `FrontierCommonDeletionBankMatch.lean`.

## Exact interface loss

`CriticalPairFrontier.originalUnique_or_commonDeletion` constructs its common
branch from the double-deletion arm

```lean
HasNEquidistantPointsAt 4
  ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
```

of `F.firstApexSplit`.  Neither `FrontierCommonDeletionResidual F` nor
`FrontierCommonDeletionParentResidual F` retains that fact.  The current parent
residual only retains the one-source packet for `F.pair.q`.

Consequently, consuming an arbitrary `FrontierCommonDeletionParentResidual F`
requires splitting `F.firstApexSplit` again.  The checked theorem

```lean
originalUnique_or_twoSourceSameApexDeletion
```

returns exactly:

1. the protected `OriginalFrontierUniqueRadiusArm F`; or
2. a strengthened residual containing both the original parent residual and
   the missing first-apex double-deletion fact.

This is not merely a convenience issue: without the retained double deletion,
the second named source `F.pair.w` cannot be transported to the first apex, so
the advertised source-faithful two-source continuation is unavailable from the
current residual type.

Recommended production correction: either add `firstApexDouble` to the common
residual constructed by `originalUnique_or_commonDeletion`, or define a
separate `FrontierDoubleDeletionParentResidual` and make the parent split return

```lean
OriginalFrontierUniqueRadiusArm F ∨
  Nonempty (FrontierDoubleDeletionParentResidual F)
```

The unique arm must remain protected; it must not be erased by repackaging the
result as a generic common-deletion conclusion.

## Smallest existing consumer antecedent

The smallest actual bank match is

```lean
CapSelectedRowCounting.outsidePair_unique_capCenter
```

Suppose the directed cross-membership arm holds:

```lean
F.pair.w ∈
  (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
```

Then `S.oppApex1` and the actual blocker

```lean
H.centerAt F.pair.q F.pair.q_mem_A
```

are distinct centers equidistant from the same distinct pair `q,w`.  Since
`q,w` are outside the surplus cap and `S.oppApex1` lies in it, ordered-cap
uniqueness proves

```lean
H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap.
```

This consequence is checked as

```lean
actualBlocker_not_mem_surplusCap_of_crossMembership
```

It is a useful localization theorem, but it is not a contradiction.

With the strengthened residual that retains the first-apex double deletion,
the complementary arm also has a clean interpretation.  The checked theorem

```lean
crossMembership_or_secondSourceBlockerDeletion
```

returns either the cross membership above, or a source-faithful common-deletion
packet for `F.pair.w` at the first apex and the actual blocker selected for
`F.pair.q`.

Thus the smallest honest next surface is a directed split:

1. cross membership, with the actual blocker localized outside the surplus
   cap; or
2. deletion of `w` survives at both the first apex and `q`'s actual blocker.

## Why the other banks do not match

### Opposite-cap escape

`U2NonSurplusSqueeze.oppCap2_escape_gen` would close a pair shared by the two
opposite apices, but it requires

```lean
dist S.oppApex2 F.pair.q = dist S.oppApex2 F.pair.w.
```

The frontier carries the opposite fact `F.pair.oppApex2_dist_ne`.  This is not
a missing adapter; that antecedent is impossible on this surface.

### `u1TwoLargeCapObstruction`

This consumer requires seven additional named metric incidences on five points.
The parent residual does not produce those incidences.  No banked theorem found
in the required registries derives them from the retained common-deletion,
critical-map, cap, MEC, and minimality data.

### General-n U5 incidence bank

The imported U5 consumers require positive, named row-support incidences (or an
equivalent dangerous-triple packet) and typically at least three coordinated
selected rows after deletion.  The parent residual supplies two arbitrary
exact rows after deleting `q`, plus overlap at most two.  It supplies neither
the required named memberships nor a third row.  Overlap at most two is not a
terminal U5 antecedent.

### Generic common-deletion consumers

Projecting to a generic common-deletion packet discards precisely the data that
could make this branch stronger: the second named source, its shared first-apex
radius, the opposite-apex distance inequality, off-surplus placement, and the
original critical map.  No such projection is proposed here.

## Required searches

The audit checked the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also queried the indexed Lean corpus with `nthdegree docs search --lean` for
two-center deletion, q-deleted-row, opposite-apex, selected-shell, and
`u1TwoLargeCapObstruction` statement shapes.  The only exact cap-level match
was ordered-cap outside-pair uniqueness as described above; the other hits had
the antecedent gaps listed in this report.

## Validation

Validated with:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/frontier-common-deletion-bank-match/FrontierCommonDeletionBankMatch.lean
```

All three nontrivial adapters report exactly:

```text
[propext, Classical.choice, Quot.sound]
```

and do not depend on `sorryAx`.

## Next theorem target

First repair the parent boundary so the common branch retains
`firstApexDouble`.  Then target a consumer of the checked directed split above,
while preserving the full frontier and parent fields.  The missing terminal
ingredient is not another anonymous deletion packet: it is a theorem coupling
either

- an off-surplus actual blocker that also contains the cross source; or
- two source-indexed common-deletion packets sharing the first apex,

with cap order/MEC/minimality strongly enough to produce a named bank
antecedent or `False`.

No countermodel to the full geometric parent was claimed or sought.  The
negative result here is exact only at the present theorem-bank interface: the
current residual omits a fact used to construct it, and the remaining retained
facts do not match a terminal bank consumer.
