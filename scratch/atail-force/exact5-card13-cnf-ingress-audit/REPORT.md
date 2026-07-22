# Exact-five card-13 CNF ingress audit

Date: 2026-07-21

Status: **THE CARD-13 SAME-RADIUS ASYMMETRIC LEAF IS PROVEN IN LEAN FOR BOTH
SPOKE ORIENTATIONS. THE 1,899-ASSERTION SOURCE INGRESS AND VERIFIED LRAT
CONTRADICTION ARE FULLY COMPOSED. NO PRODUCTION `sorry` IS CLOSED.**

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

Thus every finite carrier layout is source-constructible.  The semantic
row-table constructor below supplies the actual fixed-critical and
global-cover rows, and the later source-ingress modules prove the complete
selected source core against those values.

### Total source-faithful semantic witness table

`SemanticRowTable.lean` now closes the first half of that semantic ingress.
It proves

```lean
CanonicalAsymmetricSemanticRowTable.nonempty_from_parent
```

from the canonical role prepacket and a physical global-deletion-cover star.
The table contains:

- an arbitrary selected K4 row at every canonical carrier center, with row
  `4` fixed to the retained first-apex row;
- two independently chosen all-center cover-row families, one for each star
  edge;
- all thirteen actual blocker indices pulled back through the canonical
  enumeration;
- the exact five-point second-apex shell; and
- the first-apex double-deletion row at canonical center `4`.

The two cover families are separate dependent choices.  They are not assumed
equal away from blocker-image centers.  The theorem
`blocker_image_supports_eq` derives their equality with the main row at an
actual blocker-image center from
`CriticalShellSystem.selectedFourClass_support_eq_shell`.

The focused replay of the constructor, parent wrapper, and blocker-image
synchronization theorem reports only `propext`, `Classical.choice`, and
`Quot.sound`.

All three theorem groups elaborate without `sorry`.  The focused validation reports only
the standard axioms `propext`, `Classical.choice`, and `Quot.sound`.

### Complete source assertion ingress

The selected pass-five core has now been classified and proved source-first:

| Range | Count | Lean source |
| --- | ---: | --- |
| `h0000`--`h0144` | 145 | `DirectSourceBaseFacts.lean` |
| `h0145`--`h0169` | 25 | `DirectFlatSourceIngress.lean` plus the final coordinator |
| `h0170`--`h0236` | 67 | exact distance-rank bounds |
| `h0237`--`h0488` | 252 | selected-row rank guards |
| `h0489`--`h0527` | 39 | first-apex-row rank guards |
| `h0528`--`h0570` | 43 | exact-five-shell rank guards |
| `h0571`--`h1898` | 1,328 | strict Kalmanson cancellation guards |

`DirectSourceBaseAssertions` packages the first 145 facts, and
`directSource_baseAssertions` constructs that package from the semantic
table.  `DirectSourceRankInstances.lean` and its generated chunks prove all
1,729 rank/row/shell/Kalmanson facts.  The generator checks every saved
pass-five expression against the rebuilt 45,878-assertion source surface
before emitting Lean.  All generated chunks compile with warnings as errors.

The four-bit `blockers` carrier in the finite certificate is an auxiliary SAT
witness, not the fixed critical map itself.  Whenever it activates the
center-two row-equality guards, the source proof separately establishes those
equalities using `directSource_leftTwo_eq_mainTwo`.  No actual blocker identity
is inferred from a chosen certificate bit pattern.

### Kernel-verified finite contradiction

`VerifiedPass5Direct.lean` rebuilds the 1,899 assertions as Lean's verified
`BVLogicalExpr`, uses the factor-free CaDiCaL LRAT proof, and proves
`directExpr_unsat`.  `VerifiedPass5DirectIngress.lean` constructs the exact
191-entry packed assignment, proves all 30 source-to-expression chunks, and
exports:

```lean
false_of_directChunks_each
false_of_directSource_flat
```

The LRAT endpoint compiles in about five seconds.  The complete flat source
wrapper compiles with warnings as errors in about 125 seconds.  Its axiom
closure is exactly

```text
propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

with no `sorryAx`.  The two compiler axioms are the expected trust boundary of
Lean's native verified-certificate replay.

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
| Fixed critical blocker/row family | **CONSTRUCTED semantically**; blocker indices and blocker-image support synchronization are kernel-checked. |
| Two independent global-cover row families | **CONSTRUCTED semantically** as separate choice functions; no false cross-edge equality is assumed. |
| Exact-five second-apex shell | **CONSTRUCTED semantically** with exact cardinality five. |
| Same-radius exact-six first-apex class | The retained and double rows are **CONSTRUCTED semantically**; the selected union/saturation predicates remain in the aggregate proof. |
| Retained parent q-deleted rows | Deliberately omitted from the final CNFs.  This weakens the formula and is safe for UNSAT. |
| Selected-row strong connectivity | Not present in `asymmetric_ordinal_rank.build`; the exported CNFs do not depend on lazy SCC cuts from the older search driver. |
| Rank assignment from real distances | **PROVEN and packed in Lean** for the exact 78-pair / 546-bit certificate layout. |
| Kalmanson cancellation implications | **PROVEN generically in Lean** from a strict distance-sum inequality and one canceled equality; aggregate block instantiation remains. |
| Boolean contradiction | **PROVEN in Lean** for the direct/source-left orbit through the generated `BVLogicalExpr` and factor-free LRAT replay.  The reflected source role is handled by source normalization into the same canonical finite witness. |

The total row-table assignment is now a kernel-checked source construction.
That is not enough for closure: the next theorem must prove every selected
encoded predicate from this table and the already constructed distance ranks.

## Certificate status

The historical Z3 artifacts report:

| Artifact | Variables | Clauses | Trimmed core clauses | External result |
| --- | ---: | ---: | ---: | --- |
| `direct` / source-left | 53,279 | 383,487 | 31,792 | DRAT verified |
| `mirror` / source-right | 53,279 | 383,465 | 26,490 | DRAT verified |

Those historical artifacts remain **EMPIRICALLY/EXTERNALLY VERIFIED EXACTLY
WITHIN THEIR ENCODED MODEL**, but they are no longer the proof boundary.  The
new pass-five expression is regenerated directly in Lean, its factor-free
LRAT certificate is checked by Lean's verified replay path, and all 1,899
finite antecedents have source proofs.  `DirectSourceExactFiveCoordinator.lean`
now constructs the canonical role/table objects from the exact geometric
parent and supplies those antecedents.

## Minimal next implementation sequence

The completed public scratch endpoints are:

```lean
false_of_exactFive_card13_sameRadius_spoke₁
false_of_exactFive_card13_sameRadius_spoke₂
```

Each constructs the canonical role prepacket, semantic row table, and the
appropriate spoke cover family, then applies the 1,899-assertion verified
endpoint.  Both compile with warnings as errors.  Their axiom closure is
exactly the native certificate boundary listed above, with no `sorryAx`.

This closes the **card-13, exact-five, same-radius, asymmetric** subcase.  It
does not close the distinct-radius mode, `allRowsOneHit`, card at least 14, or
the entire exact-five residual.  The next closure work must attack one of
those remaining source-level siblings rather than extend this finite core.

## Validation

Run `Card13BoundaryNormalization.lean` first with an output `.olean`, add its
scratch directory to `LEAN_PATH`, and then check `CommonLabelTransport.lean`.
The independent focused replay completed successfully.  The public packet and
orbit theorems print exactly `[propext, Classical.choice, Quot.sound]`.
