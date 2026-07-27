# Equality arm: checked local-survival verdict

## Scope

This audit isolates the first equality arm of

```lean
Problem97.ATailFrontierLiveClosure.
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
```

namely

```lean
hc :
  H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁.
```

No production source was changed.

## Verdict

There is no source-clean contradiction from the non-global hypotheses in
this arm.  The arm survives the exact source-row data, `hρne`, disjointness
of the two source pairs, `hblockersNe`, both localized common-deletion
packets, both mutual-omission packets, the unique-four cover, and the tested
strict convex geometry.

Write

```text
c := H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁
e := H.centerAt Pρ.source₁ Pρ.source₁_mem_A.
```

Then `hblockersNe` is `e ≠ c`.  Thus the equality says that the blocker of
the first row is a source of the second row.  It does not identify the two
blockers.

The apparent degeneracy in `LPρ` is legal: after rewriting by `hLPρ`, its
deleted point and second auxiliary center are both `c`.
`CommonDeletionTwoCenterPacket` has no `q ≠ center₂` field.  Its relevant
nondegeneracy field becomes exactly `e ≠ c`.  Moreover,
`qDeletedRow_at_actualBlocker_eq_canonicalSupport` identifies the
q-deleted row at `c` with the first canonical shell; omission of `c` is then
the ordinary center-exclusion fact for that shell.

The MP packets reinforce this compatibility.  They give cross omissions,
not positive cross memberships.  This agrees with the complete
cross-omission rectangle already forced by the two exact, disjoint cap
pairs.

## First-apex q-deleted rows do not normalize automatically

Every localized packet has two rows.  The second row is centered at an
actual blocker and therefore normalizes to the corresponding canonical
critical shell using
`qDeletedRow_at_actualBlocker_eq_canonicalSupport`.  The first row is centered
at `S.oppApex1`; its stored `row₁.radius` is unconstrained.

To normalize all four first-apex rows appearing in `LPρ`, `MPρ`, `LP`, and
`MP` to the two named exact classes, the first missing equalities are

```lean
LPρ.packet.row₁.radius = radius
MPρ.collisionSourcePacket.row₁.radius = ρ
LP.packet.row₁.radius = ρ
MP.collisionSourcePacket.row₁.radius = radius
```

Deleting a source on the `ρ` row excludes that exact `ρ` class as a
four-point deleted row, and symmetrically for `radius`; it does not exclude a
third K4 radius.  No two-radius exhaustiveness or unique-K4-radius premise is
available.  The unique-radius machinery elsewhere in the repository is
inapplicable and, at this apex, incompatible with the two distinct named K4
radii.

The checked scratch theorem
`EqualityArmQDeletedNormalization.
qDeleted_support_eq_exact_ambient_class_of_radius_eq` in
`scratch/hard-branch-math/equality-arm-qdeleted-normalization-bridge.lean`
proves that one
such radius equality, together with the two exact-cardinality facts, is
exactly sufficient for support normalization.  It compiles with only
`propext`, `Classical.choice`, and `Quot.sound`.

Even granting all four radius equalities does not produce a contradiction.
The normalized rows at the common first apex lie on distinct radii and are
disjoint, while each first-apex/blocker-row intersection may be exactly the
corresponding two-source pair.  This is the situation realized by the finite
model below.

## Kernel-checked local model

`scratch/hard-branch-math/equality-arm-model.lean` contains two linked
certificates.

The exact rational metric certificate uses

```text
O = (0,0)
p = (180/17,-96/17)
q = (180/17, 96/17)
u = (11,0)
v = (88/17,165/17)
b = (41/4,123/20).
```

It checks

```text
|Op|² = |Oq|² = 144,
|Ou|² = |Ov|² = 121,
|up|² = |uq|²,
|bu|² = |bv|²,
u ≠ b.
```

Hence the first row has sources `p,q` and blocker `u`, the second has
sources `u,v` and blocker `b`, and the equality arm holds literally while
the blockers and first-apex radii remain distinct.  All cap points lie in
the strict half-plane `x > 1`, the apex lies in `x < 1`, and every increasing
triple in the displayed cyclic order `O,p,u,q,b,v` has positive
orientation.

The finite `Fin 17` shadow checks:

- the disjoint source pairs and blocker-source equality;
- first-cap cardinality exactly eight and strict-interior cardinality six;
- both localized common-deletion packets;
- both mutual-omission cycles;
- the stronger hypothetical normalization of each first-apex q-deleted row
  to the opposite named exact radius class;
- the q-deleted blocker-row/canonical-row identifications;
- four-point canonical rows and their cover;
- the cardinal shadow of `T.notRobustCover_card`;
- the complete cross-omission rectangle;
- the relevant row/interior overlaps are at most two; and
- no three-hit or cross-hit shadow occurs.

Verification command:

```bash
cd lean
lake env lean ../scratch/hard-branch-math/equality-arm-model.lean
```

It succeeds.  The four printed axiom reports contain only `propext`,
`Classical.choice`, and `Quot.sound`; the file contains no `sorry`,
`admit`, `axiom`, or `native_decide`.

This is an exact local metric/incidence certificate, not a production
`CounterexampleData`.  In particular, it does not realize all seventeen
incidence points in Euclidean geometry and does not assert `Minimal`,
global distinct distances, global general position, `noM44`, or the actual
tri-apex residual `T`.

## Imported-consumer audit

The closest source-clean equality-specific terminal is

```lean
Problem97.ATailRetainedCollisionCapLocalization.
  false_of_distinct_actualRow_contains_collisionSources
```

With the actual row based at `c = Pρ.source₁`, it needs both `P.source₁`
and `P.source₂` in the `Pρ` shell.  The available data instead prove both
are absent from that shell.  In the reverse orientation it needs both
`Pρ` sources in the `P` shell, while both are absent there.  Packaging is
not the obstruction; the required positive memberships are.

The other checked terminals fail at the same semantic boundary:

- blocker-center rigidity needs a common radius and positive mutual hits,
  but `hρne` and the omission rectangle give the opposites;
- the exact-four two-deletion terminal needs another residual interface
  and positive mutual memberships;
- Kalmanson needs a common support pair in two selected rows;
- the third-center terminal needs a relocation packet with a directed
  positive hit.

The equality-shaped `Rigid221` declarations are not consumers: they have a
different context and are themselves proved by `sorry`.

See `scratch/hard-branch-math/equality-arm-consumer-audit.md` for the
declaration-by-declaration census.

The generic U5 theorem
`U5QDeletedK4Class.inter_card_le_two` also does not advance the branch.
Within one packet it merely reproves `packet.overlap_le_two`; between two
first-apex rows its distinct-center premise specializes to
`S.oppApex1 ≠ S.oppApex1`; across the remaining rows the common deleted-point
parameter does not unify.  The stronger sibling U5 incompatibility families
require a dangerous-triple classifier and several positive row memberships,
none of which the localized packets expose.

## What cap cardinality eight actually forces

The cap-eight arm gives

```text
(S.capInteriorByIndex S.oppIndex1).card ≥ 6.
```

The four disjoint named sources account for four of those points, so there
are at least two extra strict-interior points.  Each extra point lies on a
first-apex radius different from both `radius` and `ρ`, by the two exact
class/interior equations.  Thus the arm forces a third first-apex radius.

It does not force four points on that radius.  The two extras may lie in one
two-point class or in two singleton classes.  `T.oppApex1_rich` adds no
multiplicity because its two-K4 branch is already witnessed by the named
`radius` and `ρ` classes.  The checked cap/radius theorems run from a known
large radius class to a cap lower bound, not conversely.

See `scratch/hard-branch-math/equality-arm-cap-eight-audit.md` and
`scratch/hard-branch-math/equality-arm-qdeleted-u5-audit.md` for the two
focused audits.

## Exact first missing global bridge

All local identifications and omission adapters are already present.  The
first missing step is a genuinely global positive-incidence producer from
the tri-apex residual `T` (and hence the global counterexample structure):

```text
equality arm + T + normalized local packets
  ==> a three-hit canonical shell at one of the three rich apices
      OR one of the four named cross-row memberships.
```

Any one named cross membership is immediately contradictory to the checked
cross-omission rectangle.  A three-hit shell is already the desired global
output.  No imported theorem currently extracts either alternative from
`T` in this equality arm.

Equivalently, the exact missing bridge is the `hc`-specialization of
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`;
there is no smaller source-clean bridge in the present theorem bank.
Neither first-apex q-deleted-row normalization nor the cap-eight-derived
third radius is this bridge: the kernel-checked finite model already satisfies
the former and realizes the latter while keeping every desired positive
incidence false.
For the closest existing equality-specific rigidity terminal, the sharper
missing input would be both sources of one collision row lying in the
other actual row, but the current local hypotheses prove those memberships
false.  That route therefore cannot be completed by a mere adapter.
