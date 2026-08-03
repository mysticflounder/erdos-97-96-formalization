# Schema-v6 cap-localized rich-double-hit audit

## Scope and verification limit

This is a source-only audit of
`run_full_multiplicity_caplocal.py` against the current Lean sources.  It did
not run Lean, Lake, Z3, or inspect/interfere with a live solver.  Thus
**PROVEN** below means that the stated implication is directly represented in
the current source, not that this checkout was freshly kernel-checked.  An
UNSAT remains external evidence for the finite abstraction, never closure of
the Lean target.

The added clause is at caplocal lines 47--61.  The Lean consumer is
`false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6662-6679`).  Its
actual antecedent is:

```
centerAt x hx in capInteriorByIndex i
i != j
ApexRichClassStructure A (oppositeVertexByIndex j)
IsUniqueFourCenter A (centerAt x hx)
2 <= card (selectedAt x hx).support intersect
       (SelectedClass A (oppositeVertexByIndex j) r intersect capInteriorByIndex j)
```

It concludes `False`; equivalently, that hit count is at most one when the
first four antecedents hold.

## Clause-block audit

| Block | Status | Audit result |
| --- | --- | --- |
| Indexed cap/apex loop | **PROVEN** for the fixed normal form | `INTERIORS[i]` and `APICES[i]` use the same cap index: cap 0 has interior `0..3` and opposite apex 12, cap 1 has `4..7`/13, cap 2 has `8..11`/14 (base README lines 20--30; schema scope).  This agrees with Lean's `capInteriorByIndex` and `oppositeVertexByIndex` definitions (`Cap/PartitionFromMEC.lean:466-480`, `SurplusM44Packet/Shard01.lean:1013-1020`).  Skipping `i == j` is exactly the theorem's `hij : i != j`, not an omission. |
| Rich-slice membership | **PROVEN** in the finite abstraction | Every `rich[j, cls]["support"]` bit is iff equality to the corresponding apex radius, with the apex excluded (`round5_cegar.py:331-350`).  Therefore `support[point]` denotes the whole selected radius class, rather than a chosen subset.  For S6 it is an exact six-class containing all four interior labels; for D44 it is each exact four-class and its two interior slices partition the interior (`round5_cegar.py:351-393`; base README lines 47--51). |
| Strict-interior slice | **PROVEN** in the fixed labelled slice | The list comprehension ranges over exactly `INTERIORS[j]`, not a closed cap or an inferred set.  The schema fixes these as the four strict-interior labels for cap `j`; the Lean definition likewise erases the two cap endpoints.  Thus, under the established finite label bijection, this is precisely the final intersection with `capInteriorByIndex j`. |
| `at_most(hits, 1)` | **PROVEN** | `at_most` is `z3.PbLe([(bit, 1) ...], n)` (`round5_cegar.py:66-67`).  The four labels in each `INTERIORS[j]` are distinct.  Hence the v6 body counts exactly the conjunction `row[center, point] AND rich[...][point]` over the required strict interior.  It is not a pairwise approximation and does not over-prune by double-counting. |
| Actual selected shell | **CONJECTURED** as an encoder-to-Lean bridge; source support is strong | A `CriticalShellSystem` explicitly carries `selectedAt` for each source (`U1CarrierInjection.lean:1020-1043`).  Lean proves that its chosen center is unique-four and that `selectedAt` is exactly that center's `uniqueFourClass` (`MinimalUniqueFourCover.lean:275-310`).  The base encoding uses one full exact-four row per used center: full equality-class iff, exact card four, every assigned source in it, and no other 4-class (`round5_cegar.py:255-301`).  So an interpretation which sets `block[q,c]` from `H.centerAt q` and `row[c,*]` from that center's `uniqueFourClass` makes the one row the *actual* selected shell for every source assigned to `c`.  The script itself, however, has no labelled `H`, no `selectedAt` map, and no proved interpretation lemma; `used(c)` alone is only an abstract OR of block bits (`round5_cegar.py:152-156`). |
| `used(center)` entails `IsUniqueFourCenter` | **CONJECTURED** at the Lean boundary | Inside the abstraction, a used row has a positive exact-four full radius class and every other distance class has at most three points, which is the intended finite analogue of `IsUniqueFourCenter`.  Actual Lean obtains the fact from `H.no_qfree`, not merely from a row bit (`MinimalUniqueFourCover.lean:275-284`).  The source mapping is plausible and compatible with the exact-row clauses, but it is not recorded as a theorem or checked certificate.  Consequently the docstring's bare phrase “used critical-shell centre” is insufficient by itself to invoke the Lean theorem. |
| Richness premise | **CONJECTURED** at the Lean boundary | Exact S6/D44 profiles imply the corresponding disjunct of `ApexRichClassStructure` (six points, or two distinct four-or-more radii; definition in `ApexRichClassStructure.lean:50-54`).  The base lane says the cap-loss reduction makes profiles exact at `n=15` (README lines 47--51), but v6 imports this reduction rather than proving or mechanically checking a profile-to-Lean witness.  The local clause is correct for each named rich class only after that inherited interpretation is supplied. |
| Non-apex/centre coverage | **CONJECTURED** for all intended source instances | `block[q,c]` only permits `c in NONAPICES` and `q != c` (`round5_cegar.py:243-253`).  The base README gives the intended reason: S6/D44 apices survive a deletion, hence cannot be `CriticalShellSystem.no_qfree` blockers (lines 52--56).  This is a required inherited reduction.  V6 itself does not prove it. |

## Soundness and coverage judgment

**No new local over-pruning was found.**  Conditional on the v5 finite-label
interpretation, each v6 clause is exactly the contrapositive of the Lean
theorem for one tuple `(center, i, j, rich radius)`:

* `center in INTERIORS[i]` supplies `hcenter`;
* `i != j` supplies `hij`;
* the named full rich support supplies the `SelectedClass ... r` factor;
* the full critical row supplies the `selectedAt` support factor; and
* `PbLe(..., 1)` negates `htwo`.

Restriction to `center in INTERIORS[i]` is **sound and complete for precisely
the Lean theorem's antecedent within the fixed `(6,6,6)` labelled normal
form**: a center outside that strict interior does not satisfy `hcenter`, so
the theorem supplies no clause.  It is not complete for arbitrary critical
centres: an apex, a center not shown to lie in any strict interior, or a
counterexample outside this exact-15/all-large normal form receives no v6 cut.
That is correct restraint, not a reason to generalize an UNSAT result.

The cap-index handling introduces no additional issue: the Lean index is the
cyclic cap index, and the frozen labels place the opposite apex at the same
array index.  If a future wrapper changes the surplus-cap rotation or relabels
the cyclic order, this correspondence must be recomputed; `APICES[j]` must
not be assumed to mean the right Lean apex without that normalization proof.

## Required adaptations before an UNSAT is trusted for discovery

1. Add a checked, per-case interpretation manifest (preferably a Lean bridge,
   otherwise a source-audited certificate) giving a bijection `Fin 15 ~= A`,
   the three apex equalities, and both directions of membership for every
   `INTERIORS[i]` versus `S.capInteriorByIndex i`.
2. State and prove the preservation map for the actual critical-shell system:
   `block[q,c] <-> label c = H.centerAt (label q)`, and, whenever used,
   `row[c,x] <-> label x` lies in
   `(H.selectedAt (label q) _).toCriticalFourShell.support` for an assigned
   source.  Use `isUniqueFourCenter_centerAt` and
   `uniqueFourClass_centerAt_eq_selectedAt_support` to justify that this is
   independent of which assigned source is selected.
3. Package the S6/D44 case split as explicit witnesses of
   `ApexRichClassStructure A (S.oppositeVertexByIndex j)` and verify that each
   named `rich[j,cls]` is the same full selected class.  Include the inherited
   non-apex-blocker reduction in this package.
4. Emit the caplocal clauses from that manifest (or validate them after model
   construction), recording the exact `(i,j,cls)` and radius witness.  Keep
   the current `i != j` guard and `PbLe` cardinality encoding unchanged.
5. Only then may an UNSAT be described as **external discovery evidence for
   the fully specified exact-15 slice**.  It still requires a separately
   kernel-checked reduction from the anchored Lean obligation before it can
   affect proof closure.
