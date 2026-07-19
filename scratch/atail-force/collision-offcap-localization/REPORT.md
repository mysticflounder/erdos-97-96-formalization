# Collision off-first-cap localization

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT OFF-CAP LOCALIZATION AND U5 INGRESS. NO
DIRECT `False` AND NO PRODUCTION `sorry` IS CLOSED.**

## Scope and theorem-bank preflight

This scratch lane starts from production
`LocalizedCollisionMutualOmissionCycle` and studies its
`freshBlockerOffFirstCap` arm. It uses the full `SurplusCapPacket` partition,
the common `CriticalShellSystem`, and the retained collision packet. It does
not replace those data with a generic cycle abstraction.

Before deriving a new packet, the lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered cap-partition
localization, fresh critical blockers, cross-cap common-deletion rows,
dangerous triples, q-critical triples, and q-deleted K4 classes. The legacy
registries contain no `CriticalShellSystem` interface. The closest general U5
consumers in the imported sibling bank are

```text
U5QCriticalTripleClass.two_triple_points_incompatibility
U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
```

Both are used below. No registered theorem consumes the resulting exact live
packet to `False`.

## Exact cap localization

`CollisionOffCapLocalization.lean` proves

```lean
nonempty_freshBlockerOffFirstCapLocation
    (L : LocalizedCollisionCommonDeletion P)
    (hblockerOff :
      H.centerAt L.fresh L.packet.q_mem_A ∉
        S.capByIndex S.oppIndex1) :
  Nonempty (FreshBlockerOffFirstCapLocation L)
```

The location has exactly two constructors:

```text
fresh actual blocker in strict surplus-cap interior
fresh actual blocker in strict second-opposite-cap interior.
```

The blocker is a carrier point by `CriticalShellSystem.blockerVertex`. It
cannot be a Moser vertex: the surplus and second-opposite vertices are the two
endpoints of the excluded first opposite cap, while the first-opposite vertex
is the physical first apex and is excluded by the actual critical shell. The
cap-partition cover then leaves exactly the two strict interiors above.

The file also proves

```lean
nonempty_freshBlockerOffFirstCapCrossCapPacket
```

which retains the exact location and shows that

```text
{fresh source, fresh actual blocker}
```

is a `Dumitrescu.IsCrossCapEdge S.partition`. The source is strict interior
to the first opposite cap and the blocker is strict interior to a different
cap, so no cap contains both. Dumitrescu's current consumer only says that
this pair is not a cap witness; it is not a contradiction.

## Exact U5 ingress

The strongest producer is

```lean
nonempty_freshBlockerOffFirstCapU5Ingress
```

which constructs `FreshBlockerOffFirstCapU5Ingress C`. Set

```text
q = the collision source
p = the first physical apex
b = the collision common actual blocker
x = the fresh source's actual blocker.
```

The packet retains the cap location and supplies:

- a dangerous triple `T` on the retained first-apex radius;
- an explicitly chosen second collision source `t0 ∈ T`;
- the exact q-deleted selected row centered at `p`;
- the mutual-omission packet's q-deleted row centered at `x`;
- the actual critical-system q-deleted row centered at `x`, including the
  fresh source in its support;
- the collision source's actual q-critical triple centered at `b`; and
- the incidence `t0` in that actual q-critical triple.

The incidence is not guessed. Equal actual blocker centers force equality of
the complete critical supports through the common
`CriticalShellSystem.selectedFourClass_support_eq_shell` uniqueness theorem.

The dangerous triple is source-faithful. Besides `t0`, its other two points
are selected from the retained first-apex radius class after deleting `q` and
`t0`; noncollinearity follows from `D.convex`.

## The exact current bank boundary

The two imported U5 kernels prove the following additional facts.

```lean
FreshBlockerOffFirstCapU5Ingress
  .otherCollisionSource_unique_in_actualCritical
```

says that every other `t ∈ T`, `t ≠ t0`, is absent from the collision source's
actual q-critical triple. Thus the current two-triple-point contradiction
cannot fire again on that row.

```lean
FreshBlockerOffFirstCapU5Ingress
  .freshActualDeleted_inter_dangerousCircle_card_le_two
```

proves

```text
card (fresh actual q-deleted support ∩ ({q} ∪ T)) ≤ 2.
```

This identifies the missing producer precisely. To reach a current U5
terminal, the live geometry must now do at least one of the following:

1. classify which at-most-two dangerous-circle points occur in the fresh
   actual row and produce the extra named incidences required by a banked
   consumer; or
2. produce an additional q-critical or q-deleted row whose center is one of
   the named dangerous points and whose support has the required cross-row
   incidences.

The present data do neither. The common blocker `b` and fresh blocker `x` are
not shown to belong to `T`, while the stronger imported U5 contradiction
families require their critical/deleted centers to be named triple or
auxiliary vertices together with several support memberships. Consequently
there is no implication-direction match to an existing `False` theorem.

The frontier's second-apex data also do not currently constrain which members
of `{q} ∪ T` occur in the fresh actual row. No existing theorem was found that
transports the second-apex split into those source-indexed support incidences.
That is a genuine missing coupling, not cap-order bookkeeping.

## Validation

From `lean/`:

```bash
lake env lean -s 65536 \
  ../scratch/atail-force/collision-offcap-localization/CollisionOffCapLocalization.lean
```

The command exits successfully. Every public declaration's `#print axioms`
reports only

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, new `axiom`, `native_decide`, or `unsafe`
declaration in this lane.

## Recommendation

The cap localization and exact U5 ingress are suitable production-predecessor
reductions if this arm is retained. The next research target should be the
fresh actual row's intersection with `{q} ∪ T`, or a second-apex theorem that
forces one additional named U5 row. More generic packet or cycle mining would
erase the source and cap information that made this reduction possible.
