# Mirror schema 5/8 closure

## Result

`MirrorSchema58.lean` closes the mirror-side Kalmanson terminal gap for the two
retained clauses whose stored constructors exist only in reflected role order.
It adds normalized consumers for schemas `5` and `8`, then packages them behind
one occurrence surface for a `P5MirrorBoundaryPacket`.

Public declarations:

- `Problem97.P5MirrorSchema58Scratch.false_of_schemaFive_normalized_at`
- `Problem97.P5MirrorSchema58Scratch.false_of_schemaEight_normalized_at`
- `Problem97.P5MirrorSchema58Scratch.NormalizedSchema58Occurrence`
- `Problem97.P5MirrorSchema58Scratch.P5MirrorBoundaryPacket.boundary_mem`
- `Problem97.P5MirrorSchema58Scratch.P5MirrorBoundaryPacket.false_of_normalizedSchema58Occurrence`

The schema-5 proof reverses the existing endpoint argument and uses one
decreasing-order complementary Kalmanson inequality.  Its contradiction needs
the normalized memberships

```text
0:{1,2}; 2:{3,4}; 3:{2,4}; 4:{1,3}.
```

Thus the stored extra schema-5 membership `(0,4)` is not needed by the metric
core.  The schema-8 proof reverses the existing three-inequality argument and
uses all twelve normalized memberships:

```text
0:{1,2,7}; 5:{1,4,6}; 6:{3,4,7}; 7:{2,3,6}.
```

## Exact assumptions

Each generic normalized terminal assumes:

- a convex-independent carrier `A` with `A.card = 11`;
- an injective CCW boundary `Fin 11 -> Real^2` whose image is `A`;
- pointwise carrier membership for that boundary;
- a `FaithfulCarrierPattern A`;
- strictly increasing retained roles (`OrderedFive` or `OrderedEight`); and
- Boolean truth of `schemaAt (patternCode boundary hmem F) T.values schema5`
  or the analogous normalized `schema8` clause.

The packet theorem assumes only a `(5,5,4)` `P5MirrorBoundaryPacket` and a
`NormalizedSchema58Occurrence` for its core valuation.  Carrier cardinality
eleven is derived from the cap profile and `SurplusCapPacket.capSum`; all
geometric and faithful-pattern fields come from `Q.core`.

## Verification

The scratch file is outside the repository's Lean-project root, so the first
LSP diagnostic request correctly rejected the path as not belonging to a Lean
project.  Verification then used the repository's locked, memory-capped build
wrapper with `-DwarningAsError=true`.

The focused build passed.  The three printed theorem closures are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, custom axiom, `admit`, or unsafe declaration in the
terminal closure.

## Remaining ingress

What remains is source occurrence transport, not another metric contradiction.
The source-side mirror trace must prove one of:

```text
schemaAt (patternCode Q.core.boundary Qmem Q.core.carrierPattern)
  T.values schema5 = true
```

or the analogous normalized `schema8` clause, and then construct
`NormalizedSchema58Occurrence`.  Equivalently, an upstream theorem may prove
the Boolean reindexing identity induced by `rho(i) = -i mod 11` and transport
the retained reflected schema-5/schema-8 occurrence through it.  This file
does not assert that either clause occurs.
