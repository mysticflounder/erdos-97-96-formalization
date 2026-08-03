# Round 6: parity bridge trace

## Result

**No direct application is available from the E1 core inputs.**  The smallest
missing content is a **positive two-hit, nonalternating cross-row producer**:
it must name two distinct chord points that are equidistant from each of two
distinct centers, and certify one of the four nonalternating cyclic orders.
Packet cardinalities, overlap upper bounds, omissions, and the tri-apex rich
structure do not supply this.

For the fresh arm there is a particularly sharp candidate.  Put

```text
a = S.oppApex1
b = H.centerAt O.deleted O.deleted_mem_A
x = O.kept
y = O.deleted.
```

The arm already gives `x,y` in the full critical shell centered at `b`:
`reverse_mem` gives `x`, and the shell's own deleted source gives `y`.
Moreover `freshPacket.B₂` identifies with that shell.  Thus the minimal
*new positive membership* is

```text
x ∈ freshPacket.B₁  and  y ∈ freshPacket.B₁,
```

where `B₁` is the q-deleted four-row centered at `a`.  These two memberships
would supply both radius equalities.  A usable producer must additionally
certify that `(a,b;x,y)` occurs in an `after`, `enclosed`, `split`, or
`before` order (equivalently: `x,y` lie in the same open cyclic arc between
`a,b`).  Neither membership nor this order is a field or consequence visible
in `Q` or `G`.  So the actual bridge target is the bundled positive
cross-incidence-plus-order fact, not a new parity calculation.

In the paired arm even that partial shared pair is absent.  `O.packet` is
deleted at `O.deleted`; `reversePacket` is deleted at `O.kept`; their row
supports are only chosen q-deleted K4 subsets.  The fields provide no named
common support point (let alone a pair) between any two distinct-center rows.
The smallest producer there must directly return a pair of common positive
memberships for a selected pair of rows, together with its nonalternating
order certificate.

## Banked terminals

All four terminals live in the one production module
`lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean`:

| theorem | lines | required order |
|---|---:|---|
| `Problem97.false_of_two_centers_equidistant_pair_after` | 53-69 | `i1 < i2 < j1 < j2` |
| `Problem97.false_of_two_centers_equidistant_pair_enclosed` | 74-89 | `i1 < k2 < k1 < i2` |
| `Problem97.false_of_two_centers_equidistant_pair_split` | 112-127 | `j2 < i1 < i2 < j1` |
| `Problem97.false_of_two_centers_equidistant_pair_before` | 134-148 | `j2 < j1 < i1 < i2` |

Each takes a convex carrier, an injective CCW boundary enumeration, its image
identity, three strict index inequalities, and two equations
`dist c₁ x = dist c₁ y` and `dist c₂ x = dist c₂ y`.  The terminal module is
also the literal source behind Round 5's `cyclic_alternation_cut`; Round 5
only encoded the resulting Boolean propagation and did not produce Lean
memberships/order witnesses.

`TwoCenterBisectorParity.lean` itself contains no `sorry`; each theorem is
proved by a strict Kalmanson kernel.  The closure matrix records a prior
declaration-level axiom report of only `propext`, `Classical.choice`, and
`Quot.sound` for the enclosed terminal.  This trace ran no Lean build or
fresh transitive axiom audit, so that is not a current kernel-closure claim.

## Exact input comparison

`RetainedOmissionAllLargeNormalForm` is declared at
`FrontierLiveClosure.lean:6763-6801`; the target is still a `sorry` at
`6918-6927` (also marked `[sorry]` in `docs/live-blueprint.md`).

* A `CommonDeletionTwoCenterPacket` gives distinct centers and rows `B₁,B₂`,
  but only `B₁.card = B₂.card = 4` and `(B₁ ∩ B₂).card ≤ 2`
  (`CommonDeletionTwoCenter.lean:29-46`).  Each `U5QDeletedK4Class` supplies
  a common radius only *after a point has been shown to belong to its support*
  (`U5GlobalIncidenceBasic.lean:243-250`).  Its overlap bound is an upper
  bound, not a positive shared pair.
* In the paired constructor the only extra fact is the negative
  `O.kept ∉` reverse critical shell, plus a reverse packet
  (`FrontierLiveClosure.lean:6769-6777`).  This cannot yield either parity
  equality.
* In the fresh constructor `reverse_mem` and the canonical shell intersection
  give the one complete blocker-side pair, while `freshPacket` installs the
  apex/blocker two-center packet (`FrontierLiveClosure.lean:6778-6801`).
  The available support-identification theorem is
  `ATailPhysicalSecondApexCommonDeletion.secondRow_support_eq_criticalShell_of_center_eq`
  (`PhysicalSecondApexCommonDeletion.lean:97-108`); it identifies only `B₂`.
  It does not put `O.kept` or `O.deleted` in `freshPacket.B₁`.
* `TriApexAllLargeContext` supplies cap cardinalities, three rich apex
  structures, a cover bound, and a no-three-apex shell condition
  (`FrontierLiveClosure.lean:6832-6846`).  None is a packet-support
  membership, a second radius equality, or a boundary-order witness.

Therefore importing/reusing the terminal alone cannot close E1.  The next
direct theorem should be arm-specific and return full-row/packet membership
evidence plus the cyclic placement; it should not infer nonmembership from a
chosen `B₁` subset or promote the Round 5 SMT cut to Lean evidence.

## Source/dependency notes

`FrontierLiveClosure.lean` receives the normal-form vocabulary through
`RetainedMatchingLargeCapConsumer.lean` (the oriented packet is at lines
203-223 and the reverse-coupling split at 277-301).  The exact-four indexed
source lane imports `TwoCenterBisectorParity` at
`.../IndexedSource/CyclicAlternationCore.lean:8`, which confirms live
production use of the bank but is a different certificate lane.  No build or
import-closure audit was authorized here.
