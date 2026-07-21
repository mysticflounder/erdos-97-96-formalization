# Exact-five parent-row bridge

Establish or refute the following source-level bridge for the live theorem
`false_of_frontierBiApexRobustExactFiveSecondCapProfile`.

```lean
∃ x,
  x ∈ P ∧ x ∈ U2 ∧ x ∉ U1
```

The inputs are exactly the live
`F : CriticalPairFrontier D S radius H`,
`R : FrontierCommonDeletionParentResidual F`,
`B : FrontierBiApexRobustResidual R`,
`Q : FrontierBiApexRobustExactFiveSecondCapResidual B`, and
`profile : LargeCapUniqueFiveSecondApexRadius D S`.

Define:

```text
C  = R.common.packet
U1 = C.B₁                         -- q-deleted row at S.oppApex1
U2 = C.B₂                         -- q-deleted row at S.oppApex2
E  = SelectedClass D.A S.oppApex2 profile.radius
P  = E ∩ S.capInteriorByIndex S.oppIndex2
```

`C.row₁` and `C.row₂` are selected four-point q-deleted classes; both row
supports have cardinality four, and `(U1 ∩ U2).card ≤ 2`.

## Available facts

```lean
three_le_capInterior_hits_of_largeCapUniqueFive profile
```

gives `3 ≤ P.card`.

The profile says `E.card = 5` and that every positive `O2` radius whose
ambient selected class has cardinality at least four equals
`profile.radius`.

The existing first-apex adjacent-cap one-hit theorem is:

```lean
U2NonSurplusSqueeze.oppApex1_otherCap_one_hit
```

It is stated using `D.packet`. Since this problem carries an arbitrary
`S : SurplusCapPacket D.A`, any use must construct the source-faithful
counterexample record with the same carrier, convexity, K4 data, and packet
`S`; do not silently replace `S` by `D.packet`.

## Candidate proof route to audit

1. Lift `U2` from `C.row₂` to the ambient selected class at its radius.
   Use `profile.unique_K4_radius` to show that radius is
   `profile.radius`, then prove `U2 ⊆ E`.
2. From `E.card = 5`, `U2.card = 4`, `U2 ⊆ E`, and `3 ≤ P.card`, prove
   `2 ≤ (P ∩ U2).card`.
3. Lift `U1` from `C.row₁` to its ambient first-apex selected class. Apply
   the first-apex/other-cap one-hit theorem, using
   `P ⊆ S.oppCap2`, to prove `((P ∩ U1).card ≤ 1)`.
4. Extract a member of `(P ∩ U2) \ U1`.

The bridge starts the existing
`nonempty_physicalActualCriticalOmissionCycle_from_start H profile`; it is
not itself `False`.

## Rigor requirements

- Use only the stated live inputs and named existing theorems.
- Keep the complete ambient class `E` distinct from the selected rows. In
  particular, prove only the containment actually needed; do not assume a
  row equals `E` or contains all physical strict-cap points.
- Retain the fixed `H`; do not choose a new blocker or a new q-deleted row.
- Do not assume genericity, distinct radii, or a different support packet.
- Label the result `PROVEN`, `EMPIRICALLY VERIFIED`, `CONJECTURED`, or
  `HEURISTIC`. A claimed proof must map every line above to an exact source
  field or theorem and identify the Lean construction needed for the
  `D.packet := S` adapter.

If the bridge does not follow, provide a source-faithful countermodel or name
the first exact field missing from the route. Do not discuss later cycle arms,
MEC retriangulation, CEGAR, or cap-at-least-six continuations.
