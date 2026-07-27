# Equality-arm q-deleted/U5 audit

## Scope and verdict

Audited only
`Problem97.ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5118`,
under

```lean
hc :
  H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁
```

No imported `CommonDeletionTwoCenter`/U5/two-center incompatibility closes
this arm from the supplied packet data.  The first-apex `B₁` rows are
existential, noncanonical K4 witnesses.  The equality `hc` rewrites a packet's
second center but supplies no radius equality for any first-apex `row₁`.

No production file was edited.

## Checked imported candidates

Lean reports the exact signature

```lean
Problem97.U5QDeletedK4Class.inter_card_le_two
    {D : Problem97.CounterexampleData}
    {q x y : EuclideanSpace ℝ (Fin 2)}
    {Bx By : Finset (EuclideanSpace ℝ (Fin 2))}
    (Kx : Problem97.U5QDeletedK4Class D q x Bx)
    (Ky : Problem97.U5QDeletedK4Class D q y By)
    (hxy : x ≠ y) :
    (Bx ∩ By).card ≤ 2
```

Source:
`lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean:412`.

`lean_verify` found no source-scan warnings.  Its axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

Within one `CommonDeletionTwoCenterPacket`, this theorem applies using
`packet.centers_ne`, but its result is already stored as
`packet.overlap_le_two`; it is only an upper bound, not a contradiction.

It does not compare first-apex rows across packets:

- when the deletion parameter agrees, both centers are definitionally
  `S.oppApex1`, so the required premise becomes
  `S.oppApex1 ≠ S.oppApex1`;
- for rows from oppositely deleted packets, the common implicit `q` parameter
  also fails to unify, independently of the reflexive center failure.

Lean also reports the exact signature

```lean
Problem97.ATailFrontierLiveClosure.qDeletedRow_at_actualBlocker_eq_canonicalSupport
    {D : Problem97.CounterexampleData}
    {H : Problem97.CriticalShellSystem D.A}
    {q source : EuclideanSpace ℝ (Fin 2)}
    (hsource : source ∈ D.A)
    {B : Finset (EuclideanSpace ℝ (Fin 2))}
    (row :
      Problem97.U5QDeletedK4Class
        D q (H.centerAt source hsource) B)
    (hBcard : B.card = 4) :
    B = (H.selectedAt source hsource).support
```

Source:
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:1101`.

Its axiom closure is likewise exactly
`[propext, Classical.choice, Quot.sound]`.  The source scan found only the
file's unrelated `local instance` warning at line 59, and no `sorry` or
unsafe/source-cleanliness issue in this theorem.

This theorem can normalize appropriate packet `B₂` rows centered at actual
blockers.  It cannot normalize a `B₁` row centered at `S.oppApex1`; the
available residual instead proves that actual blockers differ from that
first apex.

## Exact first-apex premise mapping

The four intended intact-class normalizations require the following missing
radius equalities:

```lean
LPρ.packet.row₁.radius = radius
MPρ.collisionSourcePacket.row₁.radius = ρ
LP.packet.row₁.radius = ρ
MP.collisionSourcePacket.row₁.radius = radius
```

Their deletion mapping is:

1. `LPρ.packet.row₁` deletes
   `LPρ.fresh = Pρ.source₁`.  The `radius` class is intact by
   `hpairsDisjoint`, but the existential row may use another intact K4
   radius.  The first missing premise is
   `LPρ.packet.row₁.radius = radius`.

2. `MPρ.collisionSourcePacket.row₁` deletes
   `MPρ.collisionSource`, which is `P.source₁` or `P.source₂`.
   Hence the `ρ` class is intact, but the first missing premise is
   `MPρ.collisionSourcePacket.row₁.radius = ρ`.

3. `LP.packet.row₁` deletes `LP.fresh = P.source₁`.  The `ρ` class is
   intact, but the first missing premise is
   `LP.packet.row₁.radius = ρ`.

4. `MP.collisionSourcePacket.row₁` deletes `MP.collisionSource`, which is
   `Pρ.source₁` or `Pρ.source₂`.  Hence the `radius` class is intact, but the
   first missing premise is
   `MP.collisionSourcePacket.row₁.radius = radius`.

Once any listed radius equality is supplied, the row's ambient
`SelectedClass` subset and the two exact-card-four hypotheses give the
corresponding support equality by finite-set extensionality/cardinality.
Without it, deletion membership can rule out the class containing the deleted
source, but it cannot rule out a third K4 radius.

An adequate common bridge would therefore be a two-radius exhaustiveness
statement for every first-apex K4 row, after which deletion membership selects
the intact named radius.  The available
`FirstApexUniqueRadiusResidual.unique_fourClass_radius` is not such a bridge:
it asserts one unique K4 radius and is incompatible with the present
`radius ≠ ρ` plus two exact-four classes.

## Search/import conclusion

Indexed nthdegree Lean-corpus searches and source searches found no imported
stronger theorem whose premises are furnished here.  The analogous
normalization pattern in
`LargeCapUniqueFiveCommonDeletionNormalForm.lean` explicitly consumes a
`unique_K4_radius` premise.  A direct Lean import-reachability check from
`Erdos9796Proof.P97.ATail.FrontierLiveClosure` reports its normalization
declarations as unknown identifiers, so they are not available at this
theorem.

Even under hypothetical normalization, the two named rows have the same
center `S.oppApex1` and distinct radii.  Such rows are compatible (indeed,
their ambient selected classes are disjoint by radius), so normalization alone
does not trigger `U5QDeletedK4Class.inter_card_le_two` or another imported
two-center contradiction.
