# Lean handoff: exact `C3` reverse/shared-overlay branch

## Result to formalize

Conditional on the sharp defect-four base packet and on the reverse selected row occupying ordinal `C3`, the complete audited reverse/shared overlay is impossible.

The finite computation is exact and independently replayed over:

```text
6,498 decorated base states
62,928 strict actual minimal-O instances
116 minimal signatures
35,018 minimal-common systems
6 exact minimal-common survivors
513 actual survivor profiles
180,063 private P,Q pairs
165,186 structural full occurrences
396 canonical full systems
0 final survivors
```

## Source packet

Structural rows:

```text
reverse row centered at b: {C,D,R0,R1}, K omitted
Q.row centered at O:       {C,J,P,Q}, K,L omitted
common shell centered A:   {C,J,K,L}, D,P,Q omitted
Q.row ∩ common shell = {C,J}
```

Metric equal-radius groups:

```text
center b: {C,D,R0,R1}
center O: {C,D,J,P,Q}
center A: {C,J,K,L}
```

The point `D` in the `O` metric group is nonstructural and must not be lost.

Named source aliases permitted by the audited contract:

```text
A=D, b=K, b=L, O=L
```

subject to pairwise distinctness and incompatible-joint-alias exclusions. `P,Q` may alias any compatible pre-existing carrier point or center but are distinct from each other and from `C,J,O,K,L`.

## Suggested theorem split

```lean
structure ReverseSharedOverlayPacket ... where
  -- source roles and distinctness
  -- three structural rows
  -- three metric groups
  -- exact Q/common intersection
  -- reverse row cap intersection {C,D}
  -- K omission and cap/order facts
  -- shared-pair alternation

structure SharpDefectFourBasePacket ... where
  -- ordered cap and boundary indexing
  -- rows C0,C1,C22
  -- owner/reflection-order transport
  -- reverse-row ordinal

 theorem false_of_reverseSharedOverlay_ordinal_three
    (B : SharpDefectFourBasePacket ...)
    (P : ReverseSharedOverlayPacket ...)
    (hord : B.reverseOrdinal P = 3) : False := ...
```

## Geometry/API prerequisites

1. Uniform real-lifted first-, middle-, and last-apex isosceles identities.
2. Chord-order inequalities in a lifted `BoundaryIndexing` chart.
3. A generic exact integer chord-direction Farkas consumer:
   - nonnegative integer weights on strict inequalities;
   - signed integer weights on equalities;
   - coefficient vector exactly zero;
   - summed RHS negative, or zero with positive strict weight.

## Finite bank strategy

The final full-`Q.row` layer is already compressed to **28 independently verified exact patterns**, each with two or three row centers and 6–12 positive memberships. Use:

```text
inputs/full-qrow-certificate-extracted-patterns.json
artifacts/full-qrow-28-pattern-verification.json
```

The preceding minimal-common classification is larger. Current exact custody is 35,018 systems, with 35,012 negative and six survivors. It contains 24,458 distinct certificate hashes. A preliminary active-incidence compression finds 5,792 patterns, but it is not yet promotion-ready. Before importing a large generated bank, either:

- independently exact-replay and further minimize that compression; or
- prove a smaller source theorem reducing directly to the six survivor signatures.

## Current source blocker

This theorem closes only the branch `reverseOrdinal = 3`. Current source provides strict-interior placement and `C<b<D` or its reflection, but no theorem fixes ordinal `C3`.

The remaining source-level proof must either:

1. prove `reverseOrdinal = 3`; or
2. perform the complete ordinal split and close the other 17 unresolved branches
   `C1,C4..C18,C22`.

## Acceptance criteria

- no `sorry`, `admit`, `native_decide`, or new axiom;
- source structural rows and metric groups remain distinct;
- all role aliases are transported, not assumed away;
- direct focused build and `#print axioms`;
- generated finite bank has a producer-independent replay receipt;
- theorem name and imports remain acyclic and below the live consumer.
