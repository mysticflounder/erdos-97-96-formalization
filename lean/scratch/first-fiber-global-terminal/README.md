# First-fiber global terminal audit

Target:

`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_freshOutsideFirstBlockerFiber_globalDeletion`

## Checked result

`FirstFiberGlobalTerminal.lean` is independent scratch checked against the
pinned Lean 4.27/formal-conjectures dependency surface.  It contains no
`sorry`, `admit`, or custom axiom.

It proves:

1. from the current outcome's `blocked` field and the carrier K4 witness at
   its center, one can cardinal-minimize `G.deleted` again and recover a
   subdeletion `V` for which restoring every `s ∈ V` restores K4;
2. if distinct `s,t ∈ V` are co-radial about `G.center`, the restored four-row
   through `s`, together with the still-deleted `t`, gives an ambient selected
   class of cardinality at least five;
3. consequently the co-radial center is not an `IsUniqueFourCenter`.  In the
   production context this proves it is not the canonical first blocker.

`FirstCapComplementGlobalDeletionOutcome` now retains the restoration field
directly.  The earlier reconstruction theorem remains useful as an audit that
restoration was never the missing mathematical obstruction.

## Exact remaining interfaces

Write `C` for the indexed first cap and `K` for the canonical shell at the
first blocker.  `FreshOutsideFirstBlockerFiber.outside_eq_pair` says

`K \ C = {Q.source, Q.otherOutsidePoint}`.

The smallest useful co-radial producer is:

```text
there are distinct s,t in the reconstructed minimal deletion V such that
  dist G.center s = dist G.center t,
  s ∈ K, and t ∈ K.
```

Since `V ⊆ D.A \ C`, the exact-remainder equality identifies this pair with
the named outside pair.  Both `G.center` and the canonical blocker lie in
`C`; both are equidistant from the two named outside points.  The checked
ordered-cap theorem `CapSelectedRowCounting.outsidePair_unique_capCenter`
then forces the centers to agree, contradicting item 3 above.

The current global-deletion geometry supplies only an arbitrary co-radial
pair in `V`; none of `hcapSource`, `hfirst`, or the tri-apex packet places that
pair in `K`.

More importantly, `CanonicalSingletonWitness.lean` is kernel-checked under
Lean 4.27 and packages every field needed for the canonical singleton outcome:
take the canonical first blocker as center and the fresh fiber source as the
singleton deletion.  The only restoration obligation reduces to `D.K4` after
erasing that singleton, and its chosen critical shell is the singleton
`MinimalDeletionCore`.  Its axiom profile is exactly `propext`,
`Classical.choice`, and `Quot.sound`.

`CanonicalSingletonOutcome.lean` is the thin exact-production-type wrapper.
It is source-complete, but cannot yet be checked against the current
`FirstCapComplementGlobalDeletionOutcome` because the shared rebuild has not
yet refreshed `FrontierLiveClosure.olean`.

Consequently the global-deletion leaf is not a strict narrowing of the fresh
first-fiber arm.  In fact, a parent-derived condition excluding *all*
singleton cores cannot coexist with `hfirst`: the fresh source and its known
blocker explicitly construct one.

## Smallest honest replacement frontier

There are only two honest choices.

1. Prove the fresh first-fiber contradiction directly from `hcapSource` and
   the canonical singleton packet.  This is mathematically the original
   `false_of_capSource_freshOutsideFirstBlockerFiber` obligation; adding the
   global-deletion outcome does not strengthen it.
2. If an arbitrary `FirstCapComplementGlobalDeletionOutcome` remains in the
   interface, split it explicitly into
   `G.deleted.card = 1` and `2 ≤ G.deleted.card`.  The singleton leaf must be
   discharged directly; the non-singleton leaf may use the checked co-radial
   and disjoint-core classification below.  The existing cap-complement
   minimizer does not rule out the singleton leaf, so the `2 ≤ card` child is
   not reachable as the sole replacement without a genuinely new producer.

The exact proposed leaf interfaces are therefore:

```text
false_of_capSource_freshOutsideFirstBlockerFiber_singletonDeletion
  (hcapSource) (Q) (G) (hcard : G.deleted.card = 1) : False

false_of_capSource_freshOutsideFirstBlockerFiber_nonSingletonDeletion
  (hcapSource) (Q) (G) (hcard : 2 ≤ G.deleted.card) : False
```

Nonemptiness of `G.deleted` makes this split exhaustive.  Both leaves are
strictly narrower than the arbitrary-`G` terminal; neither may be described
as closed until it has a proof.  If the coordinator instead uses the explicit
canonical singleton constructor, the first leaf alone is the true remaining
obligation and the non-singleton analysis is only a theorem bank.

The other branch is a
`MinimalDeletionCore D.A V G.center` at an arbitrary point of `C`.
`CoreClassification.lean` now checks that if `2 ≤ V.card`, two disjoint exact
rows make `G.center` fully deletion robust and hence not a unique-four center.
Thus the non-singleton core center is also not the canonical first blocker.
Existing core consumers still require a Moser apex, while this center has no
such alignment.  A sufficient next leaf is a genuine rich/cross-hit theorem
putting two points of one core shell in `K \ C`, or a removable-descent /
second-shared-hit theorem handling the singleton core.  No theorem-bank
declaration located in the required current, sibling, or legacy inventories
has that field-compatible conclusion.

## Localization/coupling tension

Deleting all of `D.A \ C` forces the global blocker center into `C`, but
leaves the minimal deleted pair arbitrary.  Deleting only the named pair
forces coupling, but the global-minimality theorem then gives a blocker
anywhere in `D.A \ {Q.source, Q.otherOutsidePoint}`.  A successful producer
must preserve both localization and coupling; merely changing the prescribed
deletion set trades one missing fact for the other.
