# Compact bank-clean algebra fallback

This directory is scratch-only.  No production theorem or closure document is
changed here.

## Kernel-checked result

`BankCleanFirstBranchSmoke.lean` compiles with:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/bank-clean-lean-certificate/compact-fallback/BankCleanFirstBranchSmoke.lean
```

The last run exited `0`.  Every printed theorem has exactly the axiom set
`[propext, Classical.choice, Quot.sound]`; none has `sorryAx`.

The file proves:

1. `first_circle_intersection_split`: the `A/O/G/K` rows imply either `G=O`,
   or

   ```text
   Gx = 2*Ky^2
   Gy = 2*Ky*(1-Kx).
   ```

   With `delta=(Kx-1)*Gy-Ky*Gx`, the exact factor is
   `delta*(delta+2*Ky)=0`.

2. `coincident_branch_incompatible`: the `G=O` arm closes through a
   six-variable, seven-equation scalar `grobner` kernel and a ten-row adapter.

3. `second_circle_intersection_split`: for the two common intersections `G,Y`
   of circles centered at `K,Z`, set `u=Z-K`, `d=Y-G`,
   `D=|u|^2`, `delta=cross(u,d)`, and
   `q=(G-K) dot rot(u)`.  The checked identities are

   ```text
   D*dx = -delta*uy
   D*dy =  delta*ux
   D*|d|^2 = delta^2
   D*(G-K) dot d = delta*q
   delta*(delta+2*q) = 0.
   ```

   Hence `K=Z`, `Y=G`, or the denominator-free reflected arm

   ```text
   D*dx =  2*q*uy
   D*dy = -2*q*ux.
   ```

4. `reflected_centers_coincident_incompatible`: the `K=Z` arm closes through
   a six-variable, seven-row scalar core, with an adapter from original rows.

5. `reflected_points_coincident_incompatible`: the complete `Y=G` arm closes.
   The key intermediate split is

   ```text
   (Kx=0 and Ky=0) or (Kx=3/2 and 4*Ky^2=3).
   ```

   The nonzero arm minimizes to seven effective variables and eight equations;
   its `grobner` terminal and row adapter are checked.

6. `bank_clean_core_forces_generic_double_reflection`: from all fifteen rows,
   every non-generic arm above is closed.  Any hypothetical solution is forced
   onto the explicit double-reflection equations, with `K != Z` and `Y != G`.
   This is a checked residual boundary, not yet a contradiction.

Lean-file SHA-256:

```text
c1786767df4f2c8f1b80dc09721e7aed7ba11624dc7d669285151d70f4a5f1e9
```

## Exact external algebra evidence

These claims are exact characteristic-zero Singular/msolve computations, but
they are not yet Lean producers.

- `branch_minimization.json` records independently msolve-UNIT and
  Singular-UNIT minimized arms.  SHA-256:
  `8c52b66a1da2e6e8e2affef7bae0d67ccb0f2a7d7b502b6b0aa3b494b0daa722`.
- The unsaturated `O,A,G,K,Y,Z` backbone eliminant in squared radii `R,S`
  has four factors: `S`, `S+R^2-4R`, `P3`, and `P4`.
- Saturating by
  `|G|^2 * |Y-G|^2 * |Z-K|^2` removes the three already-closed coincidence
  components and leaves `P4` alone.  This is reproduced by
  `eliminate_generic_backbone.sing` (SHA-256
  `bd5f4bdd8eca1fc3fb1fd3fe6b2551d5de230b9d40efb6449bdd51036bfaacd7`).
- Two five-vertex colored rigidity-circuit eliminants plus the exact
  six-vertex `FGKXYZ` eliminant were combined with `P4`.  The resulting
  zero-dimensional radius ideal has the lexicographic univariate consequence

  ```text
  R^7 * (R-1)^7 * (R^2-4*R+1) = 0.
  ```

  The six-vertex circuit is reproduced by `eliminate_fgkxyz_circuit.sing`
  (SHA-256
  `0edcd97b2ca8130e3d3e665cb5f8137c8b8c44599f7d415971fe88c9c0c5f248`).
  The radius FGLM check is in `radius_circuit_compatibility.sing` (SHA-256
  `49c900536134e03932b63b409a1a572d6108c45240aa28bb1d9cd4084ce568cd`).
- At `R=1`, `P4=(S-1)^4`; after `S=1`, the second five-vertex circuit is
  `(T-1)^4`.  Thus this radius arm reduces to all four squared radii equal to
  one.  A direct search found no public Census554 collision-header embedding
  into that merged unit graph, even allowing nonadjacent role aliases while
  keeping the normalized anchors distinct.

## Remaining obstruction

Only the generic double-reflection arm remains.  The radius evidence suggests
a staged target much smaller than a full unit certificate:

1. produce the four circuit/radius consequences in Lean;
2. derive `R=0`, `R=1`, or `R^2-4R+1=0`;
3. route `R=0` back to `G=O`;
4. close the all-radii-one `R=1` arm and the two quadratic-radius arms.

The factor/resultant computations alone do not close the proof and should not
be described as a Lean theorem or as a real infeasibility certificate.
