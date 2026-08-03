# Producer audit for `false_of_retainedOmission_triApexAllLarge_core`

Source snapshot: `FrontierLiveClosure.lean` SHA-256
`0b79fe852667807e999f55f10f52f8d08690572beb23f07cde33234bbf7dff90`.

## Exact interface

The open core receives:

* the parent residual `R` (minimality, no-M44, `|A| > 9`, the first-apex
  frontier and common-deletion data);
* one of the two constructors of `RetainedOmissionAllLargeNormalForm P`; and
* `TriApexAllLargeContext D S` (all three caps have cardinality at least six,
  each indexed apex is rich, the nonrobust cover inequality, and no selected
  positive-radius class contains all three Moser apices).

The two normal-form constructors have materially different closing frontiers.

### `pairedCommonDeletion`

The kept and deleted first-cap sources omit one another from their canonical
critical shells, have distinct blockers, and each deletion supplies a
common-deletion packet at the first apex and the other source's blocker.  No
field places either canonical blocker in a cap, and packet rows are four-point
subsets of classes in a deleted carrier rather than full ambient circle
classes.

### `reverseHitFreshCommonDeletion`

The deleted source's canonical blocker is already in the first strict cap, and
its shell meets the whole first cap in exactly `{kept, deleted}`.  Its remaining
two shell points are therefore outside that cap.  The hypotheses do not place
those two points in the same other cap, much less on one rich-apex radius.
They may both be Moser apices; `no_center_covers_all_apices` only forbids all
three apices on one class.  The fresh common-deletion packet adds survival
rows, not a positive incidence into the reverse shell.

## Existing checked consumer

The source-clean theorem
`criticalShellCenter_mem_capInteriorByIndex_of_two_hits` localizes a canonical
critical-shell center to indexed cap `i` from two hits in one rich class slice
inside that strict cap.  Together with
`SurplusCapPacket.capInteriorByIndex_ne_of_mem_of_mem_ne`, this already closes
any witness in which one canonical shell has such a two-hit slice at two
distinct cap indices.  `isUniqueFourCenter_centerAt H x hx` discharges the
unique-four premise; it need not be added to the producer.

A useful abbreviation for a prospective producer is:

```lean
def CanonicalShellRichDoubleHit
    (G : TriApexAllLargeContext D S)
    (x : R2) (hx : x in D.A) (i : Fin 3) (r : R) : Prop :=
  2 <= ((H.selectedAt x hx).toCriticalFourShell.support inter
    (SelectedClass D.A (S.oppositeVertexByIndex i) r inter
      S.capInteriorByIndex i)).card
```

(The ASCII notation above is deliberately schematic; the production theorem
should use the repository's Unicode notation.)

The generic sufficient producer is:

```lean
exists_canonicalShell_two_distinctCapRichDoubleHits :
  exists x hx i j ri rj,
    i != j /\
    CanonicalShellRichDoubleHit G x hx i ri /\
    CanonicalShellRichDoubleHit G x hx j rj
```

Its consumer is immediate: localize `H.centerAt x hx` into both strict caps and
apply cap-interior disjointness to the center against itself.  This statement
is stronger than is needed in the reverse-hit arm.

For `reverseHitFreshCommonDeletion`, the weakest evident cap-local producer is:

```lean
exists_reverseShell_otherCapRichDoubleHit :
  exists j r,
    S.oppIndex1 != j /\
    2 <= ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
      inter (SelectedClass D.A (S.oppositeVertexByIndex j) r inter
        S.capInteriorByIndex j)).card
```

The constructor already places this shell's center in strict cap
`S.oppIndex1`; the new witness localizes it into `j`, giving the same immediate
contradiction.  Thus this is the preferred narrow target for that arm.

For `pairedCommonDeletion`, neither blocker has a pre-existing cap location.
The generic two-distinct-caps producer (or an independent metric contradiction)
is still required; the reverse-arm producer does not cover it.

## Literal-shadow obstruction to an incidence/counting proof

The checked 15-point equality shadow has cap-interior hit counts, for the twelve
canonical shells and the three exact S6 rich slices, as follows:

```text
center 0:  (1,1,1)   center 1:  (1,1,1)
center 2:  (1,1,1)   center 3:  (1,1,1)
center 4:  (1,2,1)   center 5:  (1,1,1)
center 6:  (1,1,1)   center 7:  (1,1,1)
center 8:  (1,1,2)   center 9:  (1,1,1)
center 10: (1,1,0)   center 11: (1,1,0)
```

No shell has a two-hit rich slice at two cap indices.  The model also realizes
the incidence analogue of `pairedCommonDeletion` with `kept = 0`,
`deleted = 1`, and blockers `10` and `4`: shell 10 omits 1, shell 4 omits 0,
and deleting either source leaves both an apex K4 and the other named blocker
K4.  Its equality closure checks exact critical shells, exact S6 apex classes,
the expected unique-four/rich profiles, no all-three-apex distance class, and
no proper nonempty equality-K4 subcarrier.

Therefore neither the generic producer nor a three-hit producer follows from
the current **finite incidence, exact-class, cardinality, and deletion-survival
content alone**.  Any valid universal proof must use geometry absent from the
shadow (convex/MEC order, Euclidean distance-matrix or power structure,
Ptolemy/Kalmanson, or another genuinely metric/global consequence).  This is
not a countermodel to the Lean theorem because the shadow has no asserted
planar convex realization.

The existing theorem-bank registries contain no declaration matching either
producer shape under searches for two-hit, multi-cap, rich-slice, power,
Ptolemy, Miquel, or skew motifs.  The corrected exhaustive 5x5 power-pattern
test is recorded separately in `power-pattern-5x5-audit.md`; it finds no
unique-possible-perfect-matching minor in this literal shadow.

## Recommendation

Split mathematical discovery by constructor, but do not promote the two
producer statements to new Lean `sorry` leaves until a source-clean covering
argument or a genuine metric proof exists:

1. reverse-hit arm: seek the narrow other-cap two-hit producer for the two
   outside points of the reverse shell;
2. paired-common-deletion arm: search for a power/EDM/Kalmanson obstruction or
   a canonical shell with rich two-hits in two caps;
3. reject further pure cover-counting attempts unless they add a theorem that
   defeats the explicit 15-point shadow.
