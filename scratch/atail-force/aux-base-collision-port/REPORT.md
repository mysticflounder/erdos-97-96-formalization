# Auxiliary base-collision port

## Source mapping

The certificate registry identifies the source-proved sibling declaration

```text
Problem97.u5_qcritical_aux_base_collision_metric_incompatibility
```

with normalized shape `c8ddb1160fa08dd8` at

```text
/Users/adam/projects/math-projects/p97-rvol/lean/RVOL/P97/
  U5GlobalIncidenceQCriticalAuxBaseCollision.lean:30
```

Its scalar helper is at

```text
/Users/adam/projects/math-projects/p97-rvol/lean/RVOL/P97/
  U5GlobalIncidenceQCriticalAuxBaseCollisionScalar.lean:22
```

The exact-name scratch ports are in `AuxBaseCollisionPort.lean`:

- scalar helper at line 23;
- metric incompatibility at line 73.

## Metric statement

For `p q t₁ t₂ t₃ x : ℝ²` and `r : ℝ`, assume:

- `0 < r`;
- `p` is at distance `r` from each of `q,t₁,t₂,t₃`;
- the chain edges `t₁-q`, `t₁-t₂`, and `t₂-t₃` have length `r`;
- `q ≠ t₂`, `t₁ ≠ t₃`, and `x ≠ p`;
- `dist t₃ x = r`; and
- `dist x t₃ = dist x q`.

Then `False`.

The first seven equalities force `q` and `t₃` to be antipodal about `p`.
The last two metric equalities then force `x = p`, contradicting `x ≠ p`.

## Local reuse

The port imports only
`Erdos9796Proof.P97.U5GlobalIncidenceKernels` and reuses
`Problem97.u5_chain_antipodal_coord` from
`lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:478`.  The sibling scalar
proof was otherwise preserved as the thin bridge from that antipodal conclusion
to `x = p`.

## Validation

The isolated scratch check was run from the nested `lean/` Lake root:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/aux-base-collision-port/AuxBaseCollisionPort.lean
```

It passed.  The two `#print axioms` queries report exactly:

```text
propext, Classical.choice, Quot.sound
```

The scratch module contains no `sorry`, `admit`, or custom axiom.  No production
module, project build, proof-blueprint state, or ShellCurvature file was touched.
