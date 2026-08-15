# Five-survivor counting audit

Date: 2026-08-06

## Verdict

**NO-GO for the stated counting route.**  The checked five-cycle data certify,
for each physical-class point, omission from three distinct named blocker rows.
Together with the deletion-robust physical apex `O = S.oppApex2`, this gives
four distinct centers, not five.  The hypothesis `6 <= S.oppCap2.card` does not
force an additional actual blocker: the extra cap sources may collide with the
three cycle blockers whose rows still have cap-incidence room.

This is an obstruction to the finite counting implication, not a Euclidean
counterexample to the live theorem.

## Exact checked facts and the counting ceiling

In `scratch/PentagonOffClassProducerProbe.lean`:

- `pentagonOffClass_actualRow_physicalClass_card_le_two_probe` (`:1350`)
  makes every physical-class omission set have cardinality at least three.
- `pentagonOffClass_exact_physical_cycle_traces_probe` (`:2033`) identifies
  the five physical traces as the edges of
  `u-xu-deleted-v-xv-u`.
- `pentagonOffClass_physical_cycle_actualBlockers_injective_probe` (`:2256`)
  proves that the corresponding five blockers are distinct.
- `pentagonOffClass_exists_physicalDeletion_threeDistinctCenters_probe`
  (`:2340`) uses only two omission triples and therefore obtains two distinct
  actual blockers plus `O`.

For the exact cycle, every vertex of the five-point class lies on exactly two
cycle edges and is absent from exactly three.  Thus the cycle rows themselves
certify survival after deleting that vertex at exactly three distinct actual
blockers; `O` supplies a fourth distinct center.  To reach five centers one
still needs a fourth actual blocker omitting the same point.

The available fiber theorem does not provide it.  In
`ATail/SurvivalCover.lean`, `actualBlockerFiber_card_le_four` (`:86`) only says
that five sources yield two distinct blockers via
`exists_pair_distinct_actualBlockers_of_five_le_card` (`:116`).  Equal blockers
force equal supports by `selectedSupports_eq_of_actualBlockers_eq` (`:48`),
but equal-blocker collisions are allowed.  The cap-row bound
`CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
(`CapSelectedRowCounting.lean:278`) excludes a collision only when inserting
the colliding cap source would create a third cap point in that row.

## Combinatorial collision pattern

The following 12-point incidence shadow satisfies all of the above counting
constraints and the live named traces.  Write

```text
C = {u, xu, d, v, xv}                       (physical five-class)
K = {u, xu, xv, c, a, b}                    (second cap)
I = {u, xu, xv, c}                          (strict cap interior)
A = K union {d, v, O, w, f, g}              (12 carrier points)
```

Take five distinct blockers
`B0 = xv`, `B1 = a`, `B2 = b`, `B3 = w`, `B4 = c`, with `O` distinct from
all five, and assign the selected rows/fibers as follows.

| row | physical trace | full four-point support | sources with this blocker |
|---|---|---|---|
| `R0`, center `B0=xv` | `{u,xu}` | `{u,xu,f,g}` | `{u,f,g}` |
| `R1`, center `B1=a` | `{xu,d}` | `{xu,d,c,O}` | `{xu,c,O}` |
| `R2`, center `B2=b` | `{d,v}` | `{d,v,a,w}` | `{d,a,w}` |
| `R3`, center `B3=w` | `{v,xv}` | `{v,xv,b,O}` | `{v,b}` |
| `R4`, center `B4=c` | `{xv,u}` | `{xv,u,f,g}` | `{xv}` |

This includes the live identities `centerAt(u)=xv` and
`centerAt(xv)=c`, with `c in I \ C`.  Every source lies in its selected row,
no blocker lies in its own row, all blocker fibers have size at most three,
and the five named blockers are pairwise distinct.  The cap intersections of
`R0,...,R4` have sizes `2,2,1,2,2`, respectively.  In particular, the three
extra cap sources collide harmlessly as

```text
centerAt(c)=B1,   centerAt(a)=B2,   centerAt(b)=B3.
```

They occupy the three non-saturated cycle rows rather than creating any new
blocker center.  This is compatible with equal blockers forcing equal
supports and with the four-source fiber bound.

Consequently every `x in C` is omitted by only the three nonincident cycle
rows.  All 12 source blockers are among `B0,...,B4`, so the extra cap sources
add no distinct center.  Complete the incidence shadow by taking `Ri` to be
the only four-point class at `Bi` (and declaring no unlisted center to carry
one).  Then deletion of `x` survives at `Bi` exactly when `x` is absent from
`Ri`.  Even after adding `O`, this counting abstraction has only four
surviving centers for any physical deletion.

## Missing bridge

A five-center conclusion needs a genuinely new statement, for example that
some second-cap source has blocker outside `{B0,...,B4}` while omitting a
chosen physical point, or a collision theorem ruling out the simultaneous
placements `c -> B1`, `a -> B2`, `b -> B3`.  Neither `hsecond`, the cap-row
intersection bound, the cycle-trace injectivity theorem, nor the current
fiber lemmas supply such a statement.  Therefore no sound five-survivor
finite counting argument is available from the existing lemmas.
