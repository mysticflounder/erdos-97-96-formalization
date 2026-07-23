# Card-eleven exact-two schema decoder

Date: 2026-07-23

Status: **KERNEL-CHECKED SCRATCH DECODER; FOUR MANIFEST TEMPLATES AND BOTH
LINEAR ORIENTATIONS COVERED; NO CLASSIFIER OR SOLVER LEAF ADDED.**

## Result

[`ExactTwoSchemaDecoder.lean`](ExactTwoSchemaDecoder.lean) turns an executable
row-membership occurrence over an actual `FaithfulCarrierPattern` and an
injective CCW `Fin 11` boundary into `False`.

The four templates are copied exactly from the certificate manifests:

1. p4 four-endpoint-`K2`, three-row schema;
2. p5 two-`K1`/two-`K2`, four-row schema;
3. p5 six-role two-`K2` triangle A; and
4. p5 six-role triangle B, obtained from A by block reflection plus a cyclic
   re-cut and not equal to A's ordinary linear reflection.

`orientedSchemaAt` checks the displayed increasing-role schema or its ordinary
linear reflection. The four headline endpoints are:

```lean
false_of_p4OrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedEight)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p4FourEndpointK2Schema = true) :
    False

false_of_p5FourRowOrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p5TwoK1TwoK2Schema = true) :
    False

false_of_p5TriangleAOrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p5TriangleASchema = true) :
    False

false_of_p5TriangleBOrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p5TriangleBSchema = true) :
    False
```

All names are in
`Problem97.ATailUniqueFourExactTwoSchemaDecoderScratch`.

## Geometry reuse

The normalized p4, p5 four-row, and triangle-A adapters call:

- `CorrectedOwnCapKalmansonCoresScratch
    .false_of_four_endpoint_k2_three_row_instances`;
- `CorrectedOwnCapKalmansonCoresScratch
    .false_of_two_k1_two_k2_four_row_instances`; and
- `UniqueFourKalmansonOccurrenceScratch
    .false_of_two_k2_three_row_triangle`.

Triangle B uses the same two endpoint-`K2` cancellation after reversing the
two three-role blocks. The ordinary reflected branches use the existing
decreasing-index adapters
`dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing` and
`complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing`.
No stronger geometric hypothesis or conclusion is introduced.

## Theorem-bank preflight

The mandated registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- four endpoint `K2` inequalities with three selected rows;
- two `K1` plus two `K2` inequalities with four selected rows;
- the six-role two-`K2` triangle and its reflection/re-cut; and
- a `FaithfulCarrierPattern` `Fin 11` executable occurrence decoder.

The search returned the production strict CCW Kalmanson primitives,
`FaithfulCarrierPattern`, and adjacent general carrier bridges, but no existing
decoder for these four manifest schemas. The closest local consumers are
exactly the three modules reused above.

## Validation and axioms

The dependency scratch modules and decoder were checked from `lean/` with
warnings treated as errors:

```bash
LEAN_PATH=../scratch/atail-force/unique4-kalmanson-core-port:\
../scratch/atail-force/unique4-aligned-p5-occurrence \
lake env lean --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-exact-two-schema-decoder/\
CorrectedOwnCapKalmansonCores.olean \
  ../scratch/atail-force/unique4-source-field-audit/\
CorrectedOwnCapKalmansonCores.lean

LEAN_PATH=../scratch/atail-force/unique4-kalmanson-core-port:\
../scratch/atail-force/unique4-aligned-p5-occurrence \
lake env lean --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-exact-two-schema-decoder/\
SixRoleKalmansonTriangle.olean \
  ../scratch/atail-force/unique4-kalmanson-occurrence/\
SixRoleKalmansonTriangle.lean

LEAN_PATH=../scratch/atail-force/unique4-exact-two-schema-decoder:\
../scratch/atail-force/unique4-kalmanson-core-port:\
../scratch/atail-force/unique4-aligned-p5-occurrence \
lake env lean --root=.. -DwarningAsError=true \
  ../scratch/atail-force/unique4-exact-two-schema-decoder/\
ExactTwoSchemaDecoder.lean
```

All three commands exited `0`. The four printed axiom closures are identical:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, declared axiom, `native_decide`, unsafe
declaration, or warning suppression in the decoder.

## Scope

This is an occurrence consumer only. It does not search for an occurrence,
classify a finite row assignment, replay a solver leaf, or prove that either
exact-two source boundary packet must contain one of the four templates.
