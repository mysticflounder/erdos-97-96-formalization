# Cross-blocker coincidence terminal audit

## Verdict

The four equality arms in
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
do **not** force `False` through the currently imported ordered-cap,
Kalmanson, shell-intersection, or collision-packet lemmas.

More strongly, the conclusion displayed by that theorem is already impossible
from its two exact disjoint collision rows:

- the three-hit arm contradicts
  `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`;
- all four cross-hit arms contradict the exact closed-cap intersections and
  disjointness of the two source pairs.

Therefore this leaf cannot be proved by positively constructing any displayed
alternative.  A valid proof must derive `False` from its **global** hypotheses
first.  In particular, a blocker/source equality makes its corresponding
cross-hit false, because the identified foreign source is the center of that
shell and `CriticalFourShell.center_not_mem_support` applies.

The checked source certificate is
`scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean`.

## Kernel-checked facts

The file proves, separately for all four syntactic equality arms,

```text
cP  = Pρ.source₁  -> Pρ.source₁ is not in P's shell
cP  = Pρ.source₂  -> Pρ.source₂ is not in P's shell
cPρ = P.source₁   -> P.source₁  is not in Pρ's shell
cPρ = P.source₂   -> P.source₂  is not in Pρ's shell
```

It also proves
`targetConclusion_impossible_of_exactDisjointCollisionRows`, the negation of
the full conclusion at `FrontierLiveClosure.lean:7423-7440`, using only the two
collision rows and `hpairsDisjoint`.

## Exact local realizability certificate

Ordered-cap/bisector geometry alone cannot refute the equalities.  The same
Lean file checks the following exact rational configuration:

```text
a  = (1, 15/4)
p  = (0, 1)
b0 = u = (1, 0)
q  = (2, 1)
b1 = (3, 11/4)
v  = (4, 6)
```

The cyclic order `a,p,u,q,b1,v` is strictly convex: all 20 increasing
orientation determinants are positive.  The two source pairs `{p,q}` and
`{u,v}` are disjoint, the blockers are distinct, and each blocker is strictly
between its own source endpoints.  Exact squared distances are

```text
|a-p|² = |a-q|² = 137/16
|a-u|² = |a-v|² = 225/16
|b0-p|² = |b0-q|² = 2
|b1-u|² = |b1-v|² = 185/16.
```

Thus the common apex supports two distinct radii and the first blocker is the
first source of the second row.  Swapping source labels and swapping the two
rows realizes all four equality-arm shapes.  This is an exact countermodel to
an **ordered-cap/Kalmanson-only** contradiction.

Epistemic boundary: this certificate is not a model of the full
`CounterexampleData`, `FrontierAllLargeCapsTriApexRobustResidual T`, or all
`LP/MP` fields.  It does not refute the production theorem.  It isolates the
missing step as global rather than local metric/order geometry.

## Why the collision packets do not close an equality arm

`LocalizedCollisionMutualOmissionCycle` stores two negative cross incidences,
distinct blockers, and common-deletion packets.  It does not store a positive
shared support point.

The equality degeneration is legal in `CommonDeletionTwoCenterPacket`.  That
structure requires `center₁ ≠ center₂` and requires the actual blocker at `q`
to differ from both centers, but it has no field `q ≠ center₂`.  For example,
under `cP = Pρ.source₁`, the normalization `LPρ.fresh = Pρ.source₁` permits
`LPρ.packet.q = cP`; `hblockersNe` only separates the two actual blockers.

Exact-four/exact-two normalization and disjoint source pairs strengthen the
omissions; they do not create a Kalmanson input.

## Exact missing incidence / bridge

The current consumers need one of the following data packages, none of which
is produced by the equality, `LP/MP`, or the exact-two normalization:

1. `false_of_distinct_actualRow_contains_collisionSources` needs **both**
   sources of one collision in one genuinely distinct actual selected row.
2. `false_of_two_selected_rows_shared_late_pair` needs two distinct vertices
   positively contained in both selected rows, plus their increasing cyclic
   order.  The live interface supplies disjoint source pairs and omissions.
3. `OrderedDifferentPairCrossHit.false` additionally needs a fresh selected
   row, a positive cross membership, and a prescribed six-point order.
4. `outsidePair_unique_capCenter` needs a common two-point pair outside a cap;
   the available collision sources and blockers are in the first cap.

Accordingly, the minimal honest replacement for the missing equality-arm step
is a global contradiction bridge of the form

```text
T + exact-two rows + LP/MP + one blocker/source equality -> False
```

or a producer from those hypotheses to one of the positive-incidence packages
above.  A bridge merely to the matching named cross-hit is impossible.

## Theorem-bank audit

The project registries and `nthdegree docs search --lean` were searched before
proof work.  The closest reusable results were:

- `CGN6e_indexedWitness_of_twoApices` and
  `CGN6e4_positive_side_apex_to_indexed_witness`: place each common blocker
  between its sources, but give no contradiction or cross membership.
- `false_of_nonalternating_equidistant` and the four
  `TwoCenterBisectorParity` order terminals: forbid nonalternating orders; the
  live apex-outside/blocker-inside arrangement has the allowed alternating
  order.
- `false_of_two_selected_rows_shared_late_pair`: missing two positive shared
  incidences.
- `false_of_one_k1_three_cyclic_selected_rows`: needs three rows and six
  positive memberships.
- sibling `u1TwoLargeCapObstruction`: needs a seven-equality five-point pattern
  not supplied by the two collision rows.

The bank census likewise contains consumers but no classifier/producer from
this live packet to their required incidence patterns.

## Validation

Run from `lean/`:

```bash
lake env lean ../scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean
```

This succeeds on Lean 4.27.0.  Every `#print axioms` reports only
`[propext, Classical.choice, Quot.sound]`.  The file contains no
`sorry`, `admit`, `axiom`, or `native_decide`.
