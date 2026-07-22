# Audit of the four-row planar bank cut

## Conclusion

The obstruction in
`../whole-carrier-planar-rank-cegar/WholeCarrierPlanarRankCut.lean` is
mathematically source-faithful for the current corrected eleven-label row
table, and its four-row core is minimum for every auxiliary-base-collision
role match in that table.

This closes exactly one fixed selected-row equality cell.  It does not prove
coverage of any live A-tail residual or close a production `sorry`.

## Bank and source preflight

The theorem-bank registry records

```text
Problem97.u5_qcritical_aux_base_collision_metric_incompatibility
```

with the same hypotheses used by the scratch port in
`../aux-base-collision-port/AuxBaseCollisionPort.lean`.  The port reuses the
production-local scalar kernel `Problem97.u5_chain_antipodal_coord`; it does
not introduce a new metric claim.

For the current source
`../uniform-cycle-coverage-audit/n11_a1_minimal0.full_lra.json`, the role map is

```text
(p,q,t1,t2,t3,x) = (0,2,4,9,10,8).
```

The four rows used are exactly

```text
row 0  = {2,4,9,10}
row 2  = {0,3,4,8}
row 4  = {0,2,6,9}
row 10 = {0,1,8,9}.
```

They supply the adapter hypotheses as follows:

- row 0: `p-t1 = p-q`, `p-t2 = p-q`, and `p-t3 = p-q`;
- row 2: `q-t1 = q-p` and `q-x = q-p`;
- row 4: `t1-t2 = t1-p`;
- row 10: `t3-t2 = t3-p` and `t3-x = t3-p`.

Distance symmetry then gives every premise of the banked metric theorem.  The
four point-inequality hypotheses of the adapter are exactly what an injective
geometric interpretation of the six distinct labels supplies.

## Minimality replay

The independent verifier passed on the current source and certificate.  It
replayed every equality path and exhaustively rejected every subset of zero,
one, two, or three row centers for the displayed role map.

There are four role matches in the complete equality closure.  An independent
enumeration gave the following minimum cores:

```text
(0,2,4,9,10,8) -> {0,2,4,10}
(0,10,9,4,2,8) -> {0,2,4,10}
(5,3,1,7,6,8)  -> {1,3,5,6}
(5,6,7,1,3,8)  -> {1,3,5,6}.
```

Thus four rows are minimum not only for the chosen roles but across all four
matches in this fixed table.  This is finite-table minimality, not a theorem
about arbitrary whole-carrier row systems.

## Lean validation

The dependency and adapter were independently compiled with warnings as
errors.  Their axiom closures are exactly

```text
propext, Classical.choice, Quot.sound
```

for:

```text
Problem97.u5_qcritical_aux_base_collision_coord_eq_base
Problem97.u5_qcritical_aux_base_collision_metric_incompatibility
Problem97.WholeCarrierPlanarRankCut.false_of_four_selected_rows_auxBaseCollision
```

There is no `sorryAx` or custom axiom in this implication.

## Remaining artifact boundary

The Lean adapter is generic over six points and consumes the eight row-derived
equalities directly.  The identification of those equalities with rows
`0,2,4,10` of the fixed JSON table is checked by the exact Python replay, not
encoded as a Lean `RowPattern` realization theorem.  Therefore:

- the mathematical implication is kernel checked;
- the fixed-table extraction is exact and independently replayed externally;
- the combined claim is not yet a wholly kernel-internal fixed-cell theorem.

That boundary is acceptable for eliminating this solver cell during search.
If this cell is later promoted into a Lean coverage certificate, add a small
`RowPattern`/`Realizes` wrapper that derives the eight equalities from those
four supports and then calls the existing adapter.  Do not duplicate the
metric port.

The scratch import `import AuxBaseCollisionPort` also relies on a temporary
olean/`LEAN_PATH` setup.  It is adequate for this isolated validation but must
be replaced by a stable production import if the adapter is promoted.
