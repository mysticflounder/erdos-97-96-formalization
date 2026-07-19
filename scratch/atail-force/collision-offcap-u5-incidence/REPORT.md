# Collision off-cap U5 incidence continuation

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT INCIDENCE AND CENTER-ROLE SPLITS. NO DIRECT
`False`, NO IMPORTED U5 CONSUMER MATCH, AND NO PRODUCTION `sorry` CLOSED.**

## Scope and bank preflight

This lane continues
`scratch/atail-force/collision-offcap-localization/` and owns only this
directory. It works with the exact `FreshBlockerOffFirstCapU5Ingress`; it does
not replace the retained critical system, cap location, or source tags with a
generic graph packet.

Before deriving anything new, the lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` U5 bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered fresh q-deleted rows,
dangerous-triple centers, second-apex support transport, same-cap two-center
uniqueness, and U5 selected-candidate/same-circle consumers. The closest
imported consumers remain the `U5QCriticalTripleClass` incidence families;
all of them require positive cross-row memberships not forced below.

## Exact dangerous-circle intersection

`CollisionOffCapU5Incidence.lean` proves

```lean
nonempty_freshActualDangerousIntersectionOutcome
    (I : FreshBlockerOffFirstCapU5Ingress C) :
  Nonempty (FreshActualDangerousIntersectionOutcome I)
```

The outcome is exactly one of

```text
fresh actual support ∩ ({collisionSource} ∪ T) = ∅
fresh actual support ∩ ({collisionSource} ∪ T) = {t},       t ∈ T
fresh actual support ∩ ({collisionSource} ∪ T) = {t₁,t₂},   t₁,t₂ ∈ T, t₁ ≠ t₂.
```

This is a complete classification of the previous `card ≤ 2` result. The
collision source itself is impossible in the intersection by the stored
mutual omission, so every surviving point is genuinely one of the three
named dangerous points. The pair branch is not contradictory: the current
two-circle bound allows exactly two common points.

## Unconditional named-center row

The theorem

```lean
nonempty_otherCollisionSourceNamedRow
    (I : FreshBlockerOffFirstCapU5Ingress C) :
  Nonempty (OtherCollisionSourceNamedRow I)
```

applies global K4 at the already named point
`I.otherCollisionSource ∈ I.T`. It yields exactly one of:

```text
an exact q-deleted four-class centered at otherCollisionSource;
an exact q-critical three-class centered at otherCollisionSource.
```

The second arm is not left as a raw radius-filter cardinality statement; the
file packages the filter as `U5QCriticalTripleClass`. This is an exact row
producer, but it does not force `p` or another dangerous point into that row.

## Exact roles of both retained blockers

The collision source's actual blocker already carries `I.actualCritical` and
that q-critical row contains `I.otherCollisionSource ∈ T`. The theorem

```lean
nonempty_collisionBlockerU5Role
```

classifies its center as either:

```text
a named dangerous center in T; or
a U5 selected candidate outside T.
```

The selected-candidate arm is fully justified: the blocker is a carrier
point, differs from the deleted source because it is the center of a critical
shell containing that source, and differs from the first apex by retained
deletion robustness.

Likewise

```lean
nonempty_freshBlockerU5Role
```

classifies the fresh source's actual blocker, carrying
`I.freshActualDeleted`, as exactly one of:

```text
the deleted collision source itself;
a named dangerous center in T; or
a U5 selected candidate outside T.
```

Thus the off-cap ingress now exposes concrete named/candidate q-critical and
q-deleted rows without guessing a center label.

## Why the imported bank still does not fire

The strongest guaranteed positive cross-row membership is still

```text
otherCollisionSource ∈ collision blocker's q-critical row.
```

The exact fresh-row split supplies zero, one, or two `T` memberships, but its
center is only conditionally a dangerous point. The new named row at
`otherCollisionSource` comes with no forced membership beyond its class
record.

For example, the nearest small imported shapes require:

- `two_triple_centers_adjacent_incompatibility`: two dangerous-centered
  q-critical rows, `p` in both rows, and one directed dangerous-center hit;
- `qcritical_exact_selected_center_incompatibility`: a dangerous-centered
  q-critical row containing `p`, another dangerous point, and the candidate;
  a dangerous-centered q-deleted row containing `p` and the candidate; and a
  candidate q-critical row containing the named middle point;
- `qcritical_exact_qcritical_chain_incompatibility`: three named rows and five
  explicit `p`/dangerous-point incidences.

The live packet now supplies the final candidate-row incidence in some role
arms, but it supplies none of the required `p` memberships and no second
named cross-row incidence. Neither the retained second-apex row nor the
current `CriticalShellSystem` interface transports those memberships to the
new named row. Therefore applying any of these consumers would reverse the
implication direction.

## Exact remaining producer

The next load-bearing theorem must use the coupled frontier data to force at
least one of:

1. `p` and a second dangerous point in the named row centered at
   `otherCollisionSource`;
2. a second dangerous-centered q-critical/q-deleted row with a directed hit
   into the first; or
3. a direct cap/MEC contradiction in one of the zero/singleton/pair fresh-row
   branches.

Merely constructing global-K4 rows at all three points of `T` is not enough:
their class records contain no cross-row incidences. Broad U5 row enumeration
should not resume until a geometric theorem produces one of the memberships
above.

## Validation

The continuation imports the predecessor scratch module through a temporary
olean. From `lean/`:

```bash
lake env lean -R ../scratch/atail-force/collision-offcap-localization \
  -o /tmp/CollisionOffCapLocalization.olean \
  -i /tmp/CollisionOffCapLocalization.ilean -s 65536 \
  ../scratch/atail-force/collision-offcap-localization/CollisionOffCapLocalization.lean

env LEAN_PATH=/tmp lake env lean \
  -R ../scratch/atail-force/collision-offcap-u5-incidence -s 65536 \
  ../scratch/atail-force/collision-offcap-u5-incidence/CollisionOffCapU5Incidence.lean
```

Both commands exit successfully. Every public declaration's `#print axioms`
reports only

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, new `axiom`, `native_decide`, or `unsafe`
declaration in this lane.

## Recommendation

Keep this as a negative/normal-form scratch checkpoint for now. The exact
intersection and center-role splits are sound candidates for promotion only
when a coupled cap/MEC/second-apex theorem consumes one of their branches.
Promoting them by themselves would add a wrapper surface without closing a
branch.
