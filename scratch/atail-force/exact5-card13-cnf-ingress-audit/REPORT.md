# Exact-five card-13 CNF ingress audit

Date: 2026-07-21

Status: **PARTIAL SOURCE INGRESS PROVEN. THE TWO EXTERNAL CNFS ARE
DRAT-VERIFIED UNSAT, BUT THEIR SOURCE-TO-CNF MAP IS NOT KERNEL-CHECKED. NO
PRODUCTION `sorry` IS CLOSED.**

## Scope

This audit checks whether the `direct.cnf` and `mirror.cnf` artifacts in
`../exact5-card13-same-radius-terminal/` can be instantiated from the current
production exact-five parent.  It does not edit production Lean and does not
treat external SAT proof replay as a Lean theorem.

Before adding a new lemma, the existing theorem-bank registries and indexed
Lean corpus were searched.  They contain general incidence and metric
consumers, but no card-13 `(5,6,5)` boundary normalization or exact asymmetric
`Fin 5` orbit theorem.

## PROVEN in Lean

The scratch module `Card13BoundaryNormalization.lean` contains three
source-clean theorem groups.

### Ambient card-13 boundary placement

```lean
exists_card13_ccw_boundary_apexPlacement
```

From the live exact-five robust residual `Q` and `D.A.card = 13`, it constructs
an injective CCW enumeration `phi : Fin 13 → ℝ²` with image `D.A`.  The
named Moser vertices have exactly one of the following placements:

```text
direct CCW:  surplus-opposite = 0, first apex = 4, second apex = 8
reverse CCW: surplus-opposite = 0, second apex = 5, first apex = 9
```

The proof derives the exact cap cards `(5,6,5)` from the current parent
fields, uses the production global cap-interval theorems, and counts the two
possible CCW intervals.  It does not assume a preferred orientation.

### Common-label asymmetric role classification

```lean
fin5_straddling_interior_orbits
nonempty_canonicalAsymmetricRolePrepacket
CanonicalAsymmetricRolePrepacket.source_role_orbits
```

For three points in the strict indices `1,2,3` of a five-point cap, if the
blocker lies strictly between the source and the third point, the only two
possibilities are

```text
source = 1, blocker = 2, third = 3
source = 3, blocker = 2, third = 1.
```

These are precisely the finite roles called `asymmetricSourceLeft` and
`asymmetricSourceRight` by the encoder.  `CommonLabelTransport.lean` now
packages the production source, blocker, and third point in the same global
`Fin 13` frame as the finite certificate.  It proves, in both ambient boundary
orientations, that the actual blocker is canonical index `2`; therefore the
source/blocker/third triple is unconditionally either `(1,2,3)` or `(3,2,1)`.
The proof uses the production oriented-cap API and the actual equal-radius
source-row straddle.  It does not add a preferred orientation or change a
production interface.

The packet also preserves the actual source row's support, center, and
physical-cap intersection fields together with
`SourceTwoHitSharedCapOrder`.  This closes boundary/orbit normalization; it
does not yet construct every encoded row table or the distance ranks.

### Exact finite distance-rank assignment

`FiniteDistanceRank.lean` constructs the ordinal of each of the 78 actual
pairwise distances among their distinct real values.  It proves that the
seven-bit representation preserves and reflects equality and strict order,
packs the 78 ranks in the certificate's exact little-endian `BitVec 546`
layout, and proves that `extractLsb' (7*i) 7` recovers rank atom `i`.  The
lexicographic pair list is definitionally the same order as Python's
`itertools.combinations (range 13) 2`.

The module also proves the exact Kalmanson cancellation implication used by
the finite formula.  Its focused replay succeeds with only `propext`,
`Classical.choice`, and `Quot.sound`.  The rank construction and packing are
therefore closed.

### Exact Boolean-table packing

`BooleanPacking.lean` packs the three `13 × 13` selected-row families into
`BitVec 507`, the thirteen four-bit blocker indices into `BitVec 52`, and the
shell and first-apex row into their two `BitVec 13` carriers.  Its extraction
theorems use exactly the generated circuit offsets `169*f + 13*c + p` and
`4*s`.  Independent focused replay again reports only the three core axioms.

Thus every finite carrier layout is now source-constructible.  The remaining
ingress is semantic: instantiate those Boolean tables from the actual fixed
critical and global-cover rows and prove the aggregate selected source-core
predicate.

All three theorem groups elaborate without `sorry`.  The focused validation reports only
the standard axioms `propext`, `Classical.choice`, and `Quot.sound`.

### Reversal-stable Kalmanson transport

```lean
reverseCyclicIndex13
strictKalmanson_pair_reverseCyclicIndex13
```

The zero-fixed reversal is `i ↦ -i mod 13`.  For every
`a < b < c < d` in the reflected labels, the theorem proves both strict
Kalmanson inequalities for `phi (reverseCyclicIndex13 i)`.  It does **not**
claim that this reversed enumeration is CCW.  Instead it orders the same four
raw vertices increasingly in the original CCW enumeration, invokes the two
existing production Kalmanson theorems, and permutes the distance sums.  This
is the source-valid chirality adapter needed by the ordinal encoder.

## Decisive mismatch in the current artifact names

The CNF names `direct` and `mirror` do **not** denote the two ambient CCW
placements above.  Both artifacts hard-code the same canonical frame:

```text
surplus-opposite = 0
first apex       = 4
second apex      = 8
physical cap     = {0,1,2,3,4}
surplus cap      = {4,5,6,7,8}
first opp cap    = {8,9,10,11,12,0}.
```

Their only difference is the asymmetric row role:

```text
direct.cnf = source 1, blocker 2, third 3
mirror.cnf = source 3, blocker 2, third 1.
```

The scratch common-label packet now proves that these two roles exhaust the
actual source configuration after canonical normalization.  The CNFs still do
not, by themselves, instantiate the remaining fixed-critical and global-cover
row tables.

The reindexing `i ↦ -i mod 13` sends the reverse placement to the canonical
positions `(0,4,8)` but reverses chirality.  The scratch theorem
`strictKalmanson_pair_reverseCyclicIndex13` now supplies the required
reversal-stable Kalmanson inequalities without asserting false CCW
orientation.  Therefore the ordinal inequality schema can use the same
canonical labels on both raw boundary branches.  The named source roles are
now packaged in that frame; the remaining ingress is the full row/rank
assignment.

## Source-block audit

| Encoded block | Source status |
| --- | --- |
| Exact card profile `(5,6,5)` | **PROVEN** in the scratch normalization from current production fields. |
| One ambient cyclic boundary order | **PROVEN** in production and specialized here. |
| Direct/reverse CCW apex placements | **PROVEN** here. |
| Canonical reversal of the reverse placement | **PROVEN for both strict Kalmanson inequalities** in scratch. |
| Two asymmetric strict-cap role orbits | **PROVEN in the common global `Fin 13` frame**; the blocker is index `2`, giving exactly `(1,2,3)` or `(3,2,1)`. |
| Finite Boolean carrier layout | **PROVEN and packed in Lean** for all three row families, blockers, shell, and first-apex row. |
| Fixed critical blocker/row family | Source data exist in `CriticalShellSystem`; semantic instantiation of the packed table remains. |
| Two independent global-cover row families | Source constructors exist; semantic instantiation of the two packed tables remains. |
| Exact-five second-apex shell | Source theorem family exists; semantic instantiation of the packed shell remains. |
| Same-radius exact-six first-apex class | Source-valid current theorem family; semantic instantiation of the packed first-apex row remains. |
| Retained parent q-deleted rows | Deliberately omitted from the final CNFs.  This weakens the formula and is safe for UNSAT. |
| Selected-row strong connectivity | Not present in `asymmetric_ordinal_rank.build`; the exported CNFs do not depend on lazy SCC cuts from the older search driver. |
| Rank assignment from real distances | **PROVEN and packed in Lean** for the exact 78-pair / 546-bit certificate layout. |
| Kalmanson cancellation implications | **PROVEN generically in Lean** from a strict distance-sum inequality and one canceled equality; aggregate block instantiation remains. |
| Boolean CNF contradiction | **DRAT_VERIFIED externally** for both artifacts; not yet replayed by the Lean kernel. |

The row-table clauses are credible necessary consequences of existing source
families, but that is not enough for closure.  The final theorem must construct
one Boolean/rank assignment from an arbitrary live source configuration and
prove every encoded clause, block by block.

## External certificate status

The current manifest reports:

| Artifact | Variables | Clauses | Trimmed core clauses | External result |
| --- | ---: | ---: | ---: | --- |
| `direct` / source-left | 53,279 | 383,487 | 31,792 | DRAT verified |
| `mirror` / source-right | 53,279 | 383,465 | 26,490 | DRAT verified |

This is **EMPIRICALLY/EXTERNALLY VERIFIED EXACTLY WITHIN THE ENCODED MODEL**.
It is not yet a theorem about the Lean parent because neither the full source
map nor a kernel proof replay has landed.

## Minimal next implementation sequence

1. Instantiate the checked Boolean packers with the fixed blocker/row system,
   both independent global-cover row tables, the exact-five shell, and the
   first-apex double row.
2. Prove the aggregate selected source-core predicate from those semantic
   source facts and `packedCardThirteenDistanceRanks`.
3. Port/replay the finite contradiction in a kernel-accepted form.

Only after all three steps can the certificate close the **card-13,
exact-five, same-radius, asymmetric** subcase.  It would still not close the
distinct-radius mode, `allRowsOneHit`, card at least 14, or the entire
exact-five residual.

## Validation

Run `Card13BoundaryNormalization.lean` first with an output `.olean`, add its
scratch directory to `LEAN_PATH`, and then check `CommonLabelTransport.lean`.
The independent focused replay completed successfully.  The public packet and
orbit theorems print exactly `[propext, Classical.choice, Quot.sound]`.
