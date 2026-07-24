# Card-`>=14` canonical `(5,6,5)` faithful-row escape audit

## Verdict

**PROVEN:** on the exact-five second-cap branch, the live cap bounds construct
a genuine thirteen-point `(5,6,5)` subcarrier.  If `14 <= D.A.card`,
minimality forces a globally selected K4 row centered in that subcarrier to
contain a carrier point outside it.

The escaping point is more localized than the generic proper-subset theorem
states: it is an omitted strict point of either the surplus cap or the first
opposite cap.  It cannot be a Moser vertex or a strict point of the exact-five
second cap, because the canonical subcarrier contains all of those points.

**BLOCKED AS A CLOSURE ROUTE:** the resulting row does not satisfy the input
contract of any existing ATail terminal.  Its center is arbitrary inside the
thirteen-point skeleton and the theorem supplies only one distinguished
outside support point.  It does not identify that row with an actual fixed-`H`
critical shell, make it contain a repeated critical-fiber pair, or provide a
second row and shared boundary order.

## Checked Lean result

The file `Canonical565Escape.lean` proves:

```lean
nonempty_canonical565Skeleton
```

from

```lean
6 <= S.oppCap1.card
S.oppCap2.card = 5
```

and proves the source-level endpoint

```lean
exists_faithfulRow_escape_from_canonical565_of_card_ge_fourteen
```

from `D.Minimal`, the exact-five residual `Q`, and
`14 <= D.A.card`.  Its witnesses are:

```text
K       canonical thirteen-point `(5,6,5)` skeleton
P       one FaithfulCarrierPattern selected before the escape
center  a point of K.carrier
z       a member of P.classAt(center).support outside K.carrier
```

with the additional checked location split

```text
z in surplus strict interior \ K.surplusInterior
or
z in first-opposite strict interior \ K.firstInterior.
```

The skeleton consists of:

```text
3 Moser vertices
+ 3 chosen surplus strict points
+ 4 chosen first-opposite strict points
+ all 3 exact-five second-opposite strict points
= 13 points.
```

Pairwise strict-cap disjointness and disjointness from the Moser vertices are
proved from the production cap partition, not assumed.

## Why no current terminal consumes it

| Existing consumer | Required input absent from the escape |
| --- | --- |
| `false_of_transitionReverseOutsidePair_coRadial_firstApex` | a fixed-`H` omission transition, reverse membership, two distinct members of one reverse outside pair, and their first-apex co-radiality |
| `false_of_criticalFiberClosingCore` ordered arm | a production critical fiber, an actual fixed-`H` cross-row membership, a robust first-apex equality, and one six-point cyclic order |
| `false_of_criticalFiberClosingCore` same-cap arm | both sources of one production critical fiber in a second row, both outside one cap, and two distinct centers in that cap |
| `false_of_two_selected_rows_shared_late_pair` | two selected rows sharing the same two ordered support points |
| `false_of_selected_rows_in_five_ccw_order` | three rows, six named incidences, and a five-point cyclic order |

The `FaithfulCarrierPattern` row is a genuine selected K4 row, but it is not
definitionally a row of the fixed source-indexed `CriticalShellSystem H`.
`H.selectedAt J` is centered at `H.centerAt J`; the escape theorem neither
produces such a source `J` nor proves that its arbitrary `center` lies in the
image of `H.centerAt`.

## Exact next consumer gap

The smallest consumer-ready strengthening of this route is a **paired escape
at a useful center**, not another one-point escape.  One exact target is:

```text
choose Pcrit : FrontierCommonDeletionCriticalFiber R,
       center in D.A, capIndex,
such that
  Pcrit.source1 and Pcrit.source2 are both in one selected row at center,
  center and Pcrit's common blocker are distinct points of capIndex, and
  both fiber sources lie outside capIndex.
```

The two row equalities then feed
`CapSelectedRowCounting.outsidePair_unique_capCenter` directly.  A fixed-`H`
version can instead construct `SameCapCollisionPairCore Pcrit` and feed
`false_of_criticalFiberClosingCore`.

The present theorem supplies only `center`, one outside member `z`, and its
surplus/first-cap location.  It supplies none of the following load-bearing
facts:

```text
z = one of the two critical-fiber sources
the other fiber source is in the same row
center is an actual H.centerAt source
center and the common blocker lie in one cap
both fiber sources lie outside that cap.
```

Therefore the next mathematical producer must couple the escape row to the
already available production critical fiber (or produce the ordered closing
core).  Iterating proper-subset escape or selected-row connectivity alone does
not add that coupling.

## Theorem-bank and regression preflight

Before formalization, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for proper-subset row escape and for a
one-row/one-outside-point terminal.  The nearest result is exactly
`FaithfulCarrierPattern.exists_row_escape_of_proper_subset`; no banked theorem
adds the missing paired critical-fiber incidence.

This agrees with the earlier exact finite regression in
`row-triangle-connectivity-audit`: selected-row strong connectivity does not
force a pinned paired-row triangle.  The corrected 101-survivor audit in
`incidence-surplus-producer` likewise reports full one-seed row closure for
every survivor.  Those are finite abstraction results, not Euclidean
counterexamples, but they show that repeating the same connectivity argument
cannot supply the missing pair.

## Validation

Run from `lean/`:

```bash
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/cardge14-faithful-carrier-escape-audit/Canonical565Escape.lean
```

Result: success.

The reported axiom closure of both public endpoints is:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorry`, `admit`, or `sorryAx` dependency.

