# Exact equilateral-shell orientation bridge: Lean banking audit

Date: 2026-07-29

## Result

Status: **PROVEN (kernel checked), scoped orientation bridge**.

The new module
`Erdos9796Proof.P97.Census554.EquilateralApexOrientation` proves, without
`sorry`, that an equilateral apex over any nondegenerate base in `ℝ²` is one of
the two points obtained by rotating the base vector through `+60` or `-60`
degrees.

The public declarations are:

```lean
noncomputable def rotate60 (v : ℝ²) : ℝ²
noncomputable def rotateNeg60 (v : ℝ²) : ℝ²

theorem normSim_equilateralHinge_orientation
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hAH : dist A B = dist A H)
    (hBH : dist B A = dist B H) :
    normSim A B H = pt (1 / 2) (Real.sqrt 3 / 2) ∨
      normSim A B H = pt (1 / 2) (-Real.sqrt 3 / 2)

theorem equilateral_apex_eq_rotate60_or_rotateNeg60
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hAH : dist A B = dist A H)
    (hBH : dist B A = dist B H) :
    H = A + rotate60 (B - A) ∨
      H = A + rotateNeg60 (B - A)
```

This is the missing real-geometry-to-finite-orientation bridge: five
equilateral apices over fixed bases now reduce to `2^5 = 32` exact orientation
branches.

## Scope and non-claims

The theorem is uniform over arbitrary points in `ℝ²`. It needs only a
nondegenerate base and the two equidistance equalities. It assumes no
finiteness, convexity, shell incidence pattern, or distinctness beyond
`A ≠ B`.

This does **not** yet prove the full ten-point projected-v2 shell obstruction.
The remaining work is:

1. state the exact ten-point shell hypotheses in Lean and use the orientation
   theorem on its five equilateral triples;
2. translate the 32 exact branch certificates (or a smaller symmetry quotient)
   into kernel-checked algebraic contradictions; and
3. connect that shell theorem to the live structural-constraint consumer.

Accordingly, this is a genuine general theorem and a strict narrowing of the
shell proof, not theorem-level shell closure.

## Theorem-bank preflight

The required registries and indexed Lean corpus were checked before proving a
new result:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- `nthdegree docs search --lean` for the equilateral-apex orientation claim.

No already-banked theorem supplied the two-orientation conclusion. The closest
reusable producer was
`Problem97.Census554.EqualityCore.normSim_equilateralHinge_coordinates`,
which gives normalized horizontal coordinate `1/2` and vertical square
`3/4`. The new proof factors the resulting quadratic into the two signs and
then transports each normalized branch back to the original plane.

## Verification

Source:

`lean/Erdos9796Proof/P97/Census554/EquilateralApexOrientation.lean`

Checks completed:

- Lean LSP full-file diagnostics: no errors or warnings;
- direct source elaboration:
  `lake env lean Erdos9796Proof/P97/Census554/EquilateralApexOrientation.lean`;
- source scan for `sorry`, `admit`, `axiom`, `native_decide`, and `unsafe`:
  no hits;
- transitive axiom audit of both public theorems:
  `{propext, Classical.choice, Quot.sound}`;
- `sorryAx`: absent.

The serialized `lake-build` target invocation could not start because the
existing `Erdos9796Proof.P97.Phase3StructuralConstraintBank` build held the
project lock. This does not weaken the completed per-source elaboration and
kernel/axiom checks; the module should be included in the next aggregate build.

## Promotion recommendation

Import this module from the exact-shell theorem bank (or, once the full shell
consumer is present, from `Phase3StructuralConstraintBank`). Keep the final
ten-point shell contradiction as a separate loud obligation until every
orientation branch has a kernel-checked closer.
