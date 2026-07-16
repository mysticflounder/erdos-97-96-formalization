# F2 live-heavy match against the named U5 bank

## Result

No existing named U5 incompatibility closes the current F2 live-heavy packet
directly.

The closest direct match is now isolated in
`F2U5BankMatchAudit.lean`.  Choose one of the two strict live-only witnesses
`x`.  Then:

- the live row, after erasing `x`, is a
  `U5QCriticalTripleClass D x p (C.B₁.erase x)`;
- the second-apex row, after erasing `x`, is a
  `U5QCriticalTripleClass D x S.oppApex2 (C.B₂.erase x)`;
- the two original rows intersect in exactly two points; and
- after erasing their common source `x`, the two q-critical supports intersect
  in exactly one point.

So these two circles share exactly the implicit point `x` and one surviving
point.  This is the sharp allowed two-circle pattern, not a contradiction.

## Bank preflight

The audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- the current source statements in
  `U5GlobalIncidenceSupport.lean` and
  `U5GlobalIncidenceKernels.lean`; and
- focused `nthdegree docs search --lean` queries for a three-row `2-2`
  incidence chain and the two-q-critical-center incompatibilities.

The indexed hit
`U5QCriticalTripleClass.two_triple_centers_third_common_obstruction`
resolves to the current source theorem
`U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`.
It is not an additional stronger bank declaration.

The sibling `p97-rvol` census also contains the superficially closer module
`U5GlobalIncidenceQCriticalExactTetrahedron`.  Its relevant declarations are:

- `U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`;
- `U5QCriticalTripleClass.qcritical_exact_aux_two_intersections_incompatibility`;
- `U5QCriticalTripleClass.qcritical_chain_extra_two_intersections_incompatibility`;
  and
- `U5QCriticalTripleClass.qcritical_exact_aux_tangent_incompatibility`.

Those are source-proved bank candidates, but none is an F2 adapter.  Each
requires centers of the selected classes themselves to occur in other class
supports, together with a directed dangerous-triple chain.  The F2 profile
records intersection cardinalities and cell membership only; it does not
identify the live center, `oppApex2`, or the deleted-source blocker with the
required support points.

## Exact field map

### `two_triple_centers_adjacent_incompatibility`

The theorem requires, for one dangerous triple at deleted point `x`:

1. two q-critical classes centered at two points of that dangerous triple;
2. both classes contain the dangerous center; and
3. one class contains the other class's center.

The direct F2 extraction supplies two q-critical classes, but the first one is
centered at `p`, which is also the center of the canonical dangerous triple at
`x`.  Therefore:

- `p` is not a point of the dangerous triple; and
- `p` is not in the first q-critical support, because a selected class omits
  its own center.

Thus items 1 and 2 already fail before the adjacency hypothesis is considered.
Using another dangerous triple at `x` would require a new critical-system
producer; the retained `LiveDangerousRetainingSystem` deliberately sends every
live source to blocker `p`.

### `two_triple_centers_third_common_incompatibility`

This theorem has the same two triple-centered q-critical classes and common
dangerous-center requirements, plus a third dangerous-triple point lying in
both q-critical supports.

The same center-role failures apply.  In addition, the checked F2 incidence
data gives:

```text
card ((C.B₁.erase x) ∩ (C.B₂.erase x)) = 1.
```

Hence there is only one common surviving point.  Producing the required third
common point would contradict the exact F2 row-intersection count and cannot
come from repackaging the current packet.

### `two_triple_points_incompatibility`

For the canonical dangerous triple at `x`, the second-apex q-critical class
contains exactly one surviving live-row point: the other strict witness `w`.
The other two points are the support-only F2 cell.  The theorem needs two
distinct points of the canonical dangerous triple in that q-critical support.
That second incidence is absent by the exact-cover profile.

### Mixed q-critical/exact U5 chains

The longer U5 chain theorems require named exact and q-critical classes at
dangerous-triple centers, together with directed center-in-support incidences.
F2 provides:

- one live-centered exact row;
- one second-apex exact row;
- a deleted-source critical support centered at its actual blocker; and
- two-by-two support saturation.

It does not identify either `oppApex2` or the deleted-source blocker as a
dangerous-triple point, nor does it supply the directed center memberships
required by those chains.  In particular, the sibling tetrahedron theorem
needs three exact q-deleted classes with incidences such as “the center of one
class belongs to the other two.”  With the original common deletion, the live
and second-apex rows are exact but the deleted-source critical support contains
the deleted point and is q-critical, not q-deleted.  After changing the deleted
point to a strict live witness, the live and second-apex rows become
q-critical, not exact.  Neither choice yields the theorem's three exact rows,
and the required center memberships are absent in both views.

## Correct next object

The F2 packet is not missing another anonymous placement fact.  Any U5-bank
route needs a genuinely new producer of one of the following:

1. a second q-critical class at a non-`p` dangerous-triple center, containing
   the dangerous center and the required adjacent/common point; or
2. a named three-row chain theorem that uses the actual F2 shape directly:
   the second-apex row shares two points with the live row and two points with
   the deleted-source critical support, while those outside rows have
   intersection at most one.

No current bank theorem has the second statement.  Mining should therefore be
keyed to that source-faithful three-row `2-2` chain, not to the existing
two-q-critical-center packet.

## Status and validation

The Lean file is scratch-only and introduces no `sorry`.  It was checked with
the repo-pinned current toolchain, Lean `4.27.0`, after the authoritative
scratch dependency chain had been rebuilt from current source.  The deliberate
single-file command emitted:

```text
Problem97.ATailRF2U5BankMatchScratch
  .nonempty_liveWitnessQCriticalPairAudit
    depends on [propext, Classical.choice, Quot.sound]

Problem97.ATailRF2U5BankMatchScratch
  .liveWitnessQCriticalPair_fails_named_U5_center_roles
    depends on [propext, Classical.choice, Quot.sound]
```

The check exited `0`; neither theorem depends on `sorryAx`.  No full
`lake-build` was run.

No production file, closure document, protected file, or proof-blueprint state
was changed.
