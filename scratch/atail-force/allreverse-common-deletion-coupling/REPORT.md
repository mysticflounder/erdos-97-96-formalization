# Exact-five all-reverse/common-deletion coupling audit

Status: **KERNEL-CHECKED FOUR-ROW INGRESS; NO EXISTING TERMINAL CONSUMER;
ALL-REVERSE OCCURRENCE REMAINS OPEN.**

This lane tested whether the production
`LargeCapUniqueFiveCommonDeletionNormalForm` facts, when combined with the
complete `FullParentExactFiveAllReverseData` parent, force either
`FirstApexCoRadialTransitionReversePairOccurrence` or direct `False`.  They do
not do so through any theorem currently in the imported corpus.  The strongest
new unconditional reduction is kernel-checked in
`AllReverseCommonDeletionCoupling.lean`.

This is a source and consumer audit, not a counterexample to the full
Euclidean/MEC theorem.  In particular, the conclusion is that the implication
is not presently derivable from the registered theorem surface, not that it is
mathematically false.

## Preflight and ownership

Before deriving the reduction, the lane checked the mandated theorem-bank
registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-five all-reverse
transitions, common-deletion rows, co-radial reverse pairs, and multiple
q-deleted rows.  No exact duplicate owner was active.  The nearby
`allreverse-alternative-closer` lane independently proved a four-center
deletion-survival packet; the theorem here does not duplicate it.  It converts
that phenomenon into the exact U5-facing row data and adds a physical
dangerous triple.

No production source, docs, proof-blueprint state, protected module, or git
state was changed.

## Kernel-checked reduction

The scratch structure

```lean
FullParentAllReverseContinuationFourRowIngress A
```

is inhabited for every

```lean
A : FullParentExactFiveAllReverseData L profile continuation
```

by

```lean
nonempty_fullParentAllReverseContinuationFourRowIngress A
```

for deletion of `continuation.first`.  It contains:

1. a `U5DangerousTriple` centered at the physical second apex, selected from
   the exact-five physical class after deleting the continuation source;
2. the exact three-point intersection cardinality of the two stored
   physical-apex continuation rows;
3. a concrete third member of the physical exact-five class, distinct from
   both continuation sources, whose deletion preserves K4 at both the
   continuation blocker and physical apex and which is absent from the
   continuation-blocker support;
4. an arbitrary exact q-deleted four-point row at the retained first apex,
   supplied by first-apex deletion robustness;
5. the complete physical-apex q-deleted row
   `(SelectedClass D.A S.oppApex2 profile.radius).erase continuation.first`;
6. the complete continuation-blocker row, canonically equal to the unused
   source's retained critical support; and
7. the transition-predecessor blocker's complete selected critical row.

The four centers are pairwise distinct:

- the two physical apices are distinct;
- both blocker centers differ from both apices; and
- the two blocker centers differ from each other.

The last inequality uses the global all-reverse transition, not a bare
fixed-row assumption: equal blocker centers would force equal complete
critical supports, contradicting the unused source's radius-class exclusion.

The theorem therefore strictly strengthens a survival-only packet into four
source-faithful `U5QDeletedK4Class` rows at distinct centers, while retaining
the full `R`/`B`/`L` parent as indices of `A`.

## Why the common-deletion normal form does not close the branch

The production normal form also proves:

- the first and second continuation packets use the same complete
  actual-blocker support;
- their physical-apex supports are the two erasures of one exact-five class;
- those supports intersect in exactly three points; and
- there is a third source whose deletion preserves K4 at the actual blocker
  and physical apex.

The last theorem deliberately does **not** place the third source in the
strict physical-cap interior.  Hence it does not make the third source a
`PhysicalVertex profile`, identify it with a period-three cycle source, or
place it in any `transitionReverseOutsidePair`.  The exact three-point
physical-row intersection likewise has no theorem connecting its members to
the two outside members of a reverse transition row.

Consequently the production terminal still lacks exactly the implication

```lean
exists q a b,
  a != b /\
  a \in transitionReverseOutsidePair A.transition q /\
  b \in transitionReverseOutsidePair A.transition q /\
  dist S.oppApex1 a = dist S.oppApex1 b
```

(using ASCII notation here only for readability).  Once this is available,
`false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence` already
closes the leaf.

## Existing U5 consumers and their first absent inputs

The general-N U5 bank does contain many terminal incompatibilities accepting a
dangerous triple and several q-deleted rows.  Their hypotheses do not match the
new ingress automatically.  They require both:

1. **center-role alignment** -- blocker centers must be identified with named
   members of the dangerous triple or its selected tail; and
2. **positive cross-support incidences** -- for example, the dangerous center
   `p` and named dangerous vertices must occur in the other centers' row
   supports.

The common-deletion normal form supplies exact supports but no such
cross-alignment.  In particular, it proves neither that a blocker center lies
in `dangerousSupport` nor even a generic membership such as
`S.oppApex2` in one of the two blocker supports.  Center distinctness and row
existence cannot substitute for these positive hypotheses.

The common-outside-pair consumers have the analogous deficit: the four-row
ingress contains no theorem producing a two-point support intersection shared
by two same-cap centers.  Minimality and `noM44` remain available through the
full parent indices, but no current producer converts them into either this
overlap or the required U5 cross-incidences.

## Regression boundary

Two existing audits prevent overclaiming from weaker abstractions:

- the finite full-role/total-critical-system shadow admits an exact SAT model
  in which every reverse pair is non-co-radial from the first apex; and
- all 990 stored exact rational strict-Kalmanson/LRA survivors make all three
  reverse outside pairs non-co-radial from the first apex.

These refute forcing by the encoded finite or linear-order data alone.  They
are not planar Euclidean/MEC countermodels and therefore do not refute an
aggregate theorem that genuinely uses full-fiber provenance, nonlinear
Euclidean geometry, MEC data, or global minimality.

## Exact next mathematical target

Do not add another bare-row or conditional consumer.  The next load-bearing
producer must work on the complete four-row ingress together with the retained
full parent and prove one of:

1. `FirstApexCoRadialTransitionReversePairOccurrence A` directly; or
2. a complete, already-consumed U5 packet, including the center-role
   identifications and every positive support membership required by that
   consumer.

The first option is the narrower interface and already has a production
terminal.  A viable proof must use information absent from the exact finite
and strict-Kalmanson survivors: full source-indexed radius fibers,
nonlinear Euclidean/MEC geometry, or a genuinely global consequence of
minimality/`noM44`.

## Validation

The scratch file was checked directly in the Lake environment with warnings
as errors:

```text
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/allreverse-common-deletion-coupling/AllReverseCommonDeletionCoupling.lean
```

The final axiom report is:

```text
'Problem97.ATailAllReverseCommonDeletionCouplingScratch.nonempty_fullParentAllReverseContinuationFourRowIngress'
depends on axioms: [propext, Classical.choice, Quot.sound]
```

The source scan found no `sorry`, `admit`, declared `axiom`, `unsafe`, or
`native_decide` escape hatch.
