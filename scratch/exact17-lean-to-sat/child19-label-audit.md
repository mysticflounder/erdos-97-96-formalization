# Child19 raw-label / Lean-position audit (read-only)

## Mapping convention

For named order 0 the theorem-bank `order` / `boundary_labels` is

```text
position p:    0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
labelAtPos:    0  6  8 11 10  9 12  7  2 15 16  3  4  5  1 13 14
```

Thus raw source label `r` is converted to a Lean positional coordinate by
`P(r) = position 0 r`; conversely a positional coordinate `p` is converted
back to a source label by `boundary_labels[p] = labelAtPosition 0 p`.
For a reverse theorem-bank occurrence, normalize to the forward positional
motif with `p |-> Fin.rev p = 16-p` after applying `P`.  At the source bridge,
`orientedLabelAtPosition` applies the inverse table (and the extra `Fin.rev`
for reverse orientation); do not apply the table twice.

The ordered five-point/five-row matchers return raw labels from `order`, so
their core fields need `P`.  The two-Kalmanson producer explicitly remaps rows
to positions before scanning, so its core/path coordinates are already
positional.  Invariant metric cores return raw labels and need `P` only if a
positional occurrence clause is desired.

## Child18 cross-check

`piqd-eighteenth-root-model-theorem-bank-minimized.json` and the complete bank
both have the same 17 records and the same `boundary_labels` table above.  Its
Kalmanson record has positional quads `[0,1,11,12]`, `[0,1,12,14]` and path
row hits

```text
[(1,11),(1,15),(15,1),(15,12),(12,15),(12,0),(0,12),(0,11),(14,0),(14,1)]
```

which are exactly `cancellationHits` and `cancellationForwardData` in
`BlockerVExactSeventeenEighteenthModelRefinements.lean`; the Lean file keeps
these numbers as positional labels and only maps them through
`orientedLabelAtPosition` in the source bridge.

## Child19 records

All seven minimized files have the same order table.  Cores below are
forward-normalized positional cores.  `baseHits` are positive row incidences
in positional coordinates, suitable as the base list for an
`occurrenceClauses`-style orbit.  For the Kalmanson record, the ten path hits
are listed (the 17-row witness has many additional incidences not needed by
the checked path certificate).

| file / stage | raw core | normalized positional core | baseHits |
|---|---|---|---|
| `-0` five-row-circle | `O=4,A=13,D=14,E=0,C=12,X5=3,X6=6,X9=1` | `O=12,A=15,D=16,E=0,C=6,X5=11,X6=1,X9=14` | `[(0,11),(0,12),(0,14),(12,0),(12,6),(12,15),(12,16),(6,14),(6,16),(15,1),(15,6),(15,12),(16,1),(16,11),(16,15)]` |
| `-1` two-circle reverse | `Q=15,U=12,V=16,Y=11` | raw `P=(9,6,10,3)`; reverse-normalized `(Q,U,V,Y)=(7,10,6,13)` | `[(3,7),(3,13),(13,3),(13,7),(7,3),(7,10),(6,10),(6,13)]` |
| `-2` two-circle forward | `Q=6,U=2,V=0,Y=1` | `(Q,U,V,Y)=(1,8,0,14)` | `[(0,14),(0,8),(0,12),(14,0),(14,1),(12,0),(12,15),(1,8),(1,15),(15,1),(15,12)]` |
| `-3` five-point | `a=3,b=11,c=7,x=14,y=16` | `(a,b,c,x,y)=(11,3,7,16,10)` | `[(7,3),(7,10),(7,16),(16,3),(16,11),(10,3),(10,11)]` |
| `-4` two-Kalmanson | already positional | `firstQuad=[0,1,8,9]`, `secondQuad=[0,1,9,14]`, `perm=[0,2,1,3]` | `[(1,8),(1,15),(15,1),(15,12),(12,15),(12,0),(0,12),(0,8),(14,0),(14,1)]` |
| `-5` duplicate-center | raw `centers=[1,2], triple=[0,5,6]` | `centers=[14,8], triple=[0,13,1]` | `[(0,8),(0,12),(14,0),(14,1),(14,13),(8,0),(8,13),(12,0),(12,15),(1,8),(1,15),(15,1),(15,12)]` |
| `-6` perpendicular-bisector | raw `foci=[1,2], points=[0,5,6]` | `foci=[14,8], points=[0,13,1]` | `[(0,8),(0,12),(14,0),(14,1),(14,8),(14,13),(8,0),(8,13),(8,14),(12,0),(12,15),(1,8),(1,15),(15,1),(15,12)]` |

For source-model membership checks, positional hit `(p,q)` is read as
`(labelAtPosition 0 p, labelAtPosition 0 q)` in forward orientation, or with
`p,q` reflected first for a reverse occurrence.  The invariant rows in `-5`
and `-6` are raw-label metric cores in the bank; the displayed positional
forms are the explicit `P` conversion and should only be used with a
position-based clause wrapper.
