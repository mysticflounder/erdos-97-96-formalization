# ATAIL Stage-I separated-pair classifier assessment

Date: 2026-07-13

## Verdict

The requested unconditional classifier

```text
URowOffDangerousSeparatedPairFields
  -> already-consumed MEC/nested/order alternate
```

is **not presently derivable from a banked theorem**.  The theorem-bank
preflight and the checked live-type reduction identify the first missing
antecedent for every nearby consumer.  The strongest honest positive result
is now kernel-checked in
`stage1_separated_pair_classifier_boundary.lean`:

1. the `u`-row critical shell is the *entire* carrier intersection with its
   circle through the outside pair;
2. the `u`-row center is the unique point of the common cap equidistant from
   that pair; and
3. in one retained global convex-boundary enumeration, both centers lie in
   the closed cap interval while both pair points lie outside it.  The two
   center indices and two outside indices each split into their two strict
   orders.

This exhausts what cap order and the full critical-row filter contribute
without another equality producer.  It does not produce a contradiction.

The file also defines a minimal named consumed alternate,
`URowTripleBisectorAlternateFields`.  It asks for two additional distinct
carrier centers equidistant from the same outside pair.  Together with the
`u`-row center, Dumitrescu's banked perpendicular-bisector bound immediately
gives `False`.  The exact open classifier can therefore be stated as

```text
URowOffDangerousSeparatedPairFields
  -> URowTripleBisectorAlternateFields.
```

Its first missing field is one additional carrier center on the pair's
perpendicular bisector; the convexity consumer ultimately needs two.  The
current common-cap point `p` cannot be the first one: its distance inequality
is forced by `outsidePair_unique_capCenter`.

## Required theorem-bank preflight

Before adding the boundary theorem, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section and cyclic-separation surface;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for:

- an outside convex-cap pair equidistant from one cap center and separated by
  another;
- MEC straddling rows with unequal second-center distances;
- same-cap wrong-side/source-pushout consumers;
- nested equal chords from a full critical shell; and
- five-row and cyclic-order consumers for a separated pair.

The exact surviving-shape search returns
`CapSelectedRowCounting.outsidePair_unique_capCenter`; it consumes equality at
the second cap center, whereas the surviving packet contains its negation.
No sibling or legacy candidate changes that polarity.

## Hypothesis map and first missing antecedent

Let

```text
c = rows.uRow.center,
R = rows.uRow.support.
```

The separated packet supplies a cap `C` and points `z,w` with

```text
p,c in C;
z,w in R and outside C;
z != w;
dist c z = dist c w;
dist p z != dist p w.
```

Because `R` is a `CriticalFourShell`, it additionally supplies the exact
full-filter equation

```text
D.A.filter (fun x => dist c x = dist c z) = R.
```

The bank mismatches are:

| Consumer | Fields obtained | First unavailable antecedent |
|---|---|---|
| `outsidePair_unique_capCenter` | `p,c` in one ordered cap; `z,w` outside; equality at `c` | equality at `p`; the packet proves the opposite |
| Dumitrescu / `FourRowPerpBisectorCore` | one carrier bisector center `c` | two further distinct carrier bisector centers for the same `z,w` |
| `MECStraddlingRowCore` | one equality `dist c z = dist c w`; all carrier points are in the MEC disk | identification of the row radius with a Moser side and an equality chain `oa = ap = oc = cz = cw`; the required orientation then still needs a label map |
| `NestedEqualChordCore` | four exact points on the circle centered at `c` | two radius-length cross-chords between those four support points |
| five-row circle-intersection core | one exact row and a block placement | the four additional row-equality closures and the named six-sign cyclic subsequence |
| arc-overtake core | one exact row and two outside points | the `O`- and `A`-centered equality rows plus the exact six-point overtaking order |
| same-cap wrong-side/source-pushout family | outside pair and cap interval | a preconstructed `SameCapIncompatibleEdge`; those consumers use an inside-cap equality pair |

Thus none of these is an adapter problem.  Each needs genuinely new metric
incidence.

## What the remaining live binders do not add automatically

On the published K-A-PAIR signature,

```text
rows      : CriticalSourceRows ...
hcritical : Nonempty (CriticalShellSystem D.A)
```

remain independent arguments.  The outer caller constructed `rows` from one
critical system, but the residual signature does not retain that equality.
Consequently `hcritical` cannot be used to manufacture cross-row equalities
for the particular `uRow` without restoring provenance at the outer scope.

The available consequence of `hNoM44` is a second cap-cardinality witness.
It provides no membership in the perpendicular bisector of `z,w`, no
identification of `c` with a Moser apex, and no chord equality between row
support points.  Full-shell exactness is also exclusionary: it rules out a
fifth point on the `c`-circle, but it does not produce a new center equidistant
from `z,w`.

## Strongest honest cyclic-order refinement

`OutsidePairGlobalBlockPlacement` retains the global boundary enumeration
which the older cap wrapper forgot.  For suitable indices it proves

```text
lo <= pIndex <= hi;
lo <= cIndex <= hi;
not (lo <= zIndex <= hi);
not (lo <= wIndex <= hi);
pIndex < cIndex or cIndex < pIndex;
zIndex < wIndex or wIndex < zIndex.
```

These are exact order facts, not a heuristic.  They leave the possible
outside wrap placements and the two pair orientations open.  More
importantly, none supplies any new equality closure, so no current order core
can be constructed from them alone.

## Scoped feasibility evidence

The saved exact `(4,5,6)` residual report records a realization of the
separated packet on a strictly convex Euclidean carrier with exact four-point
rows:

```text
p = 0,
c = 1,
R = {0,2,5,6},
dangerous = {1,3,4,5},
C = O2 = {0,1,8,9,10,11}.
```

Taking `z=2` and `w=5`, both points lie outside `C`, the exact `c`-row makes
them equidistant from `c`, and exactness of the dangerous `p`-row makes their
`p`-distances unequal.  This is a feasibility witness for strict convexity,
cyclic cap placement, and exact row filters together—not merely an incidence
shadow.

It is not a live counterexample.  Its named Moser triangle is not an MEC
frame, global K4 fails at eight centers, and it does not certify the
quantified live `hNoM44`/critical-system package.  In fact the already-banked
MEC straddling consumer rejects this residual through a different three-row
pattern.  That co-occurrence does not create a uniform classifier from the
separated pair.

The auxiliary exact-witness replay was not green at this checkpoint:
`residual_456_exact_witness.py --check` reported that its saved report is
stale, and `urow_cap_multiplicity_falsifier.py --check` reported source-SHA
drift in that same residual input.  No generated artifact was overwritten.
Accordingly this subsection is discovery evidence from the saved report, not
a current replay claim; none of the kernel-checked boundary theorems depends
on it.

Epistemic labels:

- **PROVEN / kernel-checked:** full-filter upgrade, unique cap-bisector
  center, global block placement, triple-bisector consumer, and classifier
  adapter;
- **SAVED EXACT-ARTIFACT EVIDENCE, CURRENTLY STALE:** the `(4,5,6)`
  feasibility substitution above; its present replay gate must be refreshed
  by the artifact owner before it is again reported as empirically verified;
- **NOT CLAIMED:** a target-faithful K-A-PAIR counterexample; and
- **OPEN-PROOF:** production of any additional equality center or one of the
  more structured MEC/nested/five-row equality packets from the full live
  binders.

## Validation

The dependency-order single-file check compiled
`stage1_common_cap_confinement_boundary.lean` to a temporary olean and then
compiled `stage1_separated_pair_classifier_boundary.lean` against it.  All six
printed endpoints have exactly

```text
propext, Classical.choice, Quot.sound
```

as axioms.  There is no `sorry`, `admit`, named axiom, or `native_decide` in
the new source.  Lean source SHA-256:

```text
d69b7e403444c5cc926c16dad24caac380f3c392794f4f2276f671513c788863
```

The two auxiliary exact-residual checks failed closed for the stale-report
and source-drift reasons stated above.  They are not Lean dependencies of this
module and were not repaired in this bounded pass.
