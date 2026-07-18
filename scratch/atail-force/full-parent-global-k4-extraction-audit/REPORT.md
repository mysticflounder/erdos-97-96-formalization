# Full-parent global K4 extraction audit

Date: 2026-07-18

Status: **THE PROFILE-INDEPENDENT EXTRACTION ALREADY EXISTS; THE FIXED
`(8,4,5)` SAVED STREAM IS NOT A FAITHFUL LIVE TARGET; FULL
DELETION-CRITICALITY IS THE ONE USEFUL SEARCH-SURFACE DELTA.**

This directory is scratch-only. It changes no production Lean, shared docs,
proof-blueprint state, or git state, and it runs no numeric K4 or survivor
search.

## Verdict

There is no remaining all-center row-table extraction gap.

The prior scratch file

```text
scratch/atail-force/generic-biapex-kalmanson-search/
  WholeCarrierBiApexKalmansonSurface.lean
```

already kernel-extracts from every

```lean
R : FrontierBiApexRobustResidual parent
```

the correct arbitrary-cardinality object:

- a CCW enumeration indexed by `Fin D.A.card` whose image is exactly `D.A`;
- one `FaithfulCarrierPattern D.A`, hence one global K4 selected row at every
  actual carrier center;
- the same common `CriticalShellSystem H` retained through the parent indices;
- omission of both physical apices from `H.blockerVertex`;
- exact blocker rows, source membership, row/pair incidence bounds, strong
  connectivity from `parent.minimal`, and both strict Kalmanson inequalities.

The live cap wrapper `L` adds the two facts

```lean
6 <= S.oppCap1.card
6 <= S.oppCap2.card.
```

It is not needed to construct the generic whole-carrier table. It is needed
to prevent returning to finite profiles already dispatched by the cap-first
routing.

Therefore this lane does **not** propose a second row-table record. The
smallest usable extraction language remains the existing
`WholeCarrierBiApexKalmansonSurface`.

## New checked delta: the complete blocker-row manifest

The existing surface proves that a represented blocker row is ambient-exact.
For a deletion-critical MUS search, one further distinction must be explicit:

```lean
not HasNEquidistantPointsAt 4 (D.A.erase source)
  (H.centerAt source source_mem_A).
```

This is stronger than saying that the represented radius class is exact. It
rules out **every** radius with four remaining points after deleting the
source, not merely extra points on the represented critical circle.

`GlobalK4RowTableExtraction.lean` kernel-checks a compact
`BlockerRowManifest` containing exactly:

1. the global K4 row at the blocker has support equal to the exact CSS shell;
2. that row contains the source; and
3. deleting the source destroys all K4 witnesses at the blocker.

All three fields are theorem-derived for every source. The manifest uses the
production theorems

- `Census554.GeneralCarrierBridge.blocker_row_support_eq_shell`;
- `CriticalFourShell.q_mem_support`; and
- `CriticalShellSystem.no_qfree_at`.

It makes no new mathematical claim and should be viewed as a solver-facing
manifest, not a new proof producer.

## Why the saved `(8,4,5)` stream cannot be extracted from `L`

The fixed fourteen-role surface defines its profile as follows:

```text
census S   = live first opposite cap   = 8
census O1  = live second opposite cap  = 4
census O2  = live surplus cap          = 5
```

Thus a role-preserving map would imply `S.oppCap2.card = 4`. But `L` proves
`6 <= S.oppCap2.card`. The contradiction remains after swapping the two
opposite-cap names because one of them still has cardinality four.

The scratch theorem

```lean
no_fixed_profile_with_opposite_cap_card_four
```

kernel-checks this obstruction directly.

There are two further mismatches even without the cap-four contradiction:

- the saved surface has exactly fourteen carrier roles, whereas `L` gives
  only `14 <= D.A.card`, with no upper bound; and
- the saved surface fixes one full first-apex class of cardinality five,
  whereas the generic robust `L` surface does not uniformly assert that this
  is the live first-apex normal form.

The fixed stream remains valid theorem-discovery evidence for its own named
surface. It is not a codomain for a live extraction theorem and its 143 saved
assignments are not live-parent coverage.

## Exact theorem path

The current production/scratch path is:

```text
L
  indexes B : FrontierBiApexRobustResidual R
          R : FrontierCommonDeletionParentResidual F
          F : CriticalPairFrontier D S radius H
          H : CriticalShellSystem D.A

D.convex + R.carrier_card_gt_nine
  -> whole-carrier CCW BoundaryIndexing over Fin D.A.card

D.K4
  -> FaithfulCarrierPattern D.A
  -> one SelectedFourClass at every carrier center

H + arbitrary selected row at H.centerAt source
  -> row support = H.selectedAt source support
  -> source belongs to represented blocker row
  -> represented blocker row is ambient-exact

H.no_qfree_at
  -> deleting source destroys every K4 radius at its blocker

B.firstApex_robust + B.secondApex_robust
  -> both physical apices omitted from blocker-map image
  -> production blocker-fiber multiplicity alternatives

R.minimal + chosen global rows
  -> every nonempty proper subset emits an escaping row
  -> selected-witness digraph is strongly connected

D.convex + whole-carrier boundary
  -> all strict Kalmanson inequalities

L
  -> both live opposite-cap cardinalities are at least six.
```

No fresh `CriticalShellSystem` is chosen in this path. If a future proof
chooses a favorable system late, it must use the production rebase operation
on the whole `F/R/B/L` parent first; after that rebase the same extraction
applies to the new fixed system.

## Derived facts versus search variables

### Theorem-derived after `H` and the all-center table are fixed

- actual carrier cardinality and full CCW boundary enumeration;
- every row has support cardinality four, lies in `D.A`, omits its center,
  and is one equal-radius selected class;
- every blocker lies in `D.A` and differs from its source;
- every blocker row contains its source;
- every blocker row support equals the corresponding exact CSS support;
- deletion of the source leaves no K4 witness at the blocker at any radius;
- both physical apices are absent from the blocker image;
- selected-row pairwise intersection and pair-of-points center bounds;
- strong connectivity / proper-subset row escape from `D.Minimal`;
- strict Kalmanson inequalities from convex cyclic order; and
- both live opposite-cap lower bounds from `L`.

### Genuine search choices

- the selected K4 row at a center not forced by the blocker-image exactness;
- if one deliberately quantifies over a favorable late critical system, the
  blocker choice for each source, subject to the full CSS laws;
- the occurrence of a particular terminal row pattern or ordinal cycle;
- symmetry/bookkeeping choices such as a cyclic cut or names for the four
  support members.

Once the inherited `H` is fixed, its blocker values are theorem data, not
free row-table variables. Likewise, at a blocker-image center the global row
support is forced by `H`; a solver must not choose it independently.

## What the selected-row surface still omits

The fixed and generic structural solvers represent `no_qfree` only
indirectly, if at all. Marking the chosen blocker row exact is insufficient:
it excludes additional points on that one circle but does not exclude a
different four-point radius after the source is erased.

A search that intends to exploit deletion-criticality must therefore use one
of these sound interfaces:

1. a complete distance-class partition at every blocker, with every class in
   `D.A.erase source` constrained to cardinality at most three; or
2. a semantic oracle whose queried candidate is rejected unless the full
   `CriticalShellSystem.no_qfree` predicate can be realized.

Adding a Boolean `exact_blocker_row` flag to the old selected-row table does
not encode this force.

## Exact missing occurrence field

The profile-independent extraction is complete. What is unproved is a
terminal occurrence theorem.

For the direct shared-middle consumer, after choosing the already-derived
whole-carrier boundary, the missing field is precisely the existence of

```text
ia < ib < ic < id
row(boundary ia) contains boundary ib and boundary ic
row(boundary id) contains boundary ib and boundary ic.
```

Those four incidences instantiate
`false_of_two_selected_rows_shared_middle_pair` immediately. No current
theorem derives them from `L`.

For the production ordinal-cycle route, the analogous missing field is a
nonempty `SelectedRowOrdinalComparison` transitive cycle built from the actual
whole-carrier rows. The generic pure-Kalmanson audit already has an exact
QF-LRA SAT card-11 shadow, so this occurrence is not forced by the currently
encoded selected-row/Kalmanson/strong-connectivity surface alone.

The next honest MUS object is therefore **not** the saved `(8,4,5)` stream and
not another fixed role table. It is the existing arbitrary-cardinality whole
carrier object enriched with full deletion-criticality semantics. A mined
core is useful only if every atom transports back to this source-level
manifest and lands in an existing consumer.

## Theorem-bank and indexed-corpus preflight

Before writing the scratch manifest, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries for all-center rows,
`CriticalShellSystem`, blocker exactness, shared-middle rows, and
deletion-critical row tables found the reusable production declarations
listed above. No banked theorem supplies the missing aggregate occurrence.

The later comparison against
`WholeCarrierBiApexKalmansonSurface.lean` showed that a new row-table
extraction would be duplicate work, so the original draft structure was
removed.

## Kernel validation

Command, from `lean/`:

```bash
lake env lean \
  ../scratch/atail-force/full-parent-global-k4-extraction-audit/\
GlobalK4RowTableExtraction.lean
```

The check exits zero. Lean reports only the standard project axioms

```text
propext, Classical.choice, Quot.sound
```

for:

- `blockerRowManifest`;
- `all_blockerRowManifests`; and
- `no_fixed_profile_with_opposite_cap_card_four`.

There is no `sorryAx` dependency.

## Closure effect

- **KERNEL-CHECKED:** deletion-critical blocker-row manifest and fixed-profile
  cap-cardinality obstruction.
- **ALREADY KERNEL-CHECKED ELSEWHERE:** complete profile-independent
  whole-carrier extraction.
- **NOT PROVED:** shared-middle occurrence, ordinal-cycle occurrence,
  arbitrary-cardinality MUS coverage, the large-opposite-caps contradiction,
  K-A-PAIR, or any source `sorry` closure.
