# Exact-five all-reverse `noM44` / minimality / unused-row terminal audit

Date: 2026-07-18

Status: **KERNEL-CHECKED SOURCE-FAITHFUL GLOBAL-FIELD BOUNDARY; NO EXISTING
DIRECT TERMINAL FROM `noM44`, MINIMALITY, OR THE UNUSED ROW; THE SMALLEST
REMAINING FIELD IS STILL ONE FIRST-APEX CO-RADIAL REVERSE OUTSIDE PAIR.**

This lane audited the complete production
`FullParentExactFiveAllReverseData` surface for a terminal which had been
missed by the local reverse-row work.  It found no such terminal.  The new
scratch file pins the obstruction at the source level: the actual unused row
is centered at neither physical apex, omits both origin-tagged continuation
sources, and those two sources are physical-cap points rather than members of
any transition reverse outside pair.  The displayed surplus packet is already
non-`IsM44` from the two cap-six bounds.

No production source, shared document, proof-blueprint state, protected
`SurplusM44` or `ShellCurvature` file, git state, or another agent's T0/T1
lane was changed.

## Required theorem-bank preflight

Before deriving the boundary, the lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- an actual unused-source critical row omitting two common-deletion sources;
- full-parent exact-five all-reverse data with `D.Minimal`;
- no-`IsM44` and alternative MEC support triangles;
- four distinct q-deleted centers around a dangerous triple; and
- a third actual source whose row contains a prescribed pair.

The closest exact consumers were the current production declarations:

- `false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence`;
- `false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence`;
- `false_of_largeCapUniqueFiveTwoHitCriticalRow`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `false_of_distinct_actualRow_contains_collisionSources`; and
- `isM44Packet_of_capTriple_two_exact_of_card_gt_nine`.

Every one still needs a positive field not supplied by `noM44`, generic
minimality, or the unused row.  The general-N U5 hits likewise require named
center-role alignments and positive cross-support incidences; four row objects
and center distinctness do not instantiate them.

## Kernel-checked boundary

`AllReverseGlobalFieldBoundary.lean` defines

```lean
FullParentAllReverseGlobalFieldBoundary A
```

for

```lean
A : FullParentExactFiveAllReverseData L profile continuation
```

and proves it inhabited by

```lean
fullParentAllReverseGlobalFieldBoundary A
```

The structure records all of the following without changing the critical
system or support triangle.

1. `not S.IsM44` follows already from `L.firstOppCap_card_ge_six` (and also
   from the second cap-six bound).  This conclusion does not consume
   `R.noM44`.
2. The actual blocker of the unused source differs from `S.oppApex1`, by the
   retained first-apex deletion robustness.
3. It differs from `S.oppApex2`, because deleting the unused source preserves
   the exact-five physical-apex circle while blocking its actual critical
   center.
4. The actual unused-source critical row omits both `continuation.first` and
   `continuation.second`.
5. Deleting the unused source blocks K4 at that actual blocker but preserves
   K4 at the physical second apex.

Two corollaries make the source mismatch explicit:

```lean
unusedCriticalRow_center_ne_firstApex
continuationPair_not_contained_in_unusedCriticalRow
```

The additional theorem

```lean
continuationSources_not_mem_transitionReverseOutsidePair
```

proves, for every physical transition source `q`, that neither continuation
source lies in `transitionReverseOutsidePair A.transition q`.  The reason is
exact: both continuation sources lie in the strict physical cap, while every
reverse residual lies in the complement of the corresponding closed cap.

Thus two tempting identifications are not merely unproved; they contradict
the actual source data:

```text
unused critical row = a retained first-apex row
continuation source pair = a transition reverse outside pair.
```

## Why `noM44` is not a direct closer here

The fixed displayed packet `S` has cap lower bounds at least `(5,6,6)` up to
orientation, so it is already not `IsM44`.  Reindexing the same support
triangle preserves the cap-cardinality multiset and cannot create a packet
with two exact four-caps.

The generic banked constructor

```lean
isM44Packet_of_capTriple_two_exact_of_card_gt_nine
```

requires a concrete nonobtuse circumscribed MEC support triangle, a compatible
cap triple, and exact cardinality four for two caps of that triple.  Neither
the all-reverse transition nor the unused row constructs any of those fields.
Therefore `R.noM44` can add new force only after a **genuinely different** MEC
support triangle and two exact cap counts have been produced.  That is a new
global geometry theorem, not a latent application of the existing negative
hypothesis.

The previously checked `nom44-alternative-packet` audit reaches the same
boundary for the robust-radius classification.  The present file sharpens it
at the complete all-reverse source packet and confirms that the unused row
does not supply the missing re-triangulation.

## Why full minimality is not a direct closer here

The exact omission-cycle minimality audit already proves the strongest generic
consequence available from deleting the physical cycle sources:

- deleting a source set blocks K4 at every retained actual blocker of a
  deleted source;
- if one such blocker remains, it explicitly witnesses failure of global K4
  on the cumulative carrier;
- otherwise minimality produces a fresh remaining center and the existing
  shared-radius-pair / `MinimalDeletionCore` alternative.

This has the wrong polarity for a smaller-carrier descent.  Single-successor
deletion survival does not compose into K4 after deleting the whole cycle,
because the whole deletion also removes each critical source from its own
shell.  The fresh minimality outcome is a nonterminal producer unless it is
coupled back to the retained T0/T1 rows, the physical transition, or a named
same-cap collision consumer.

No indexed theorem converts that generic fresh outcome into either:

- a reverse outside pair co-radial from the first apex;
- a selected row through the reverse outside pair at a second same-cap
  center; or
- an alternative `IsM44` packet.

Consequently a new minimality adapter without one of those positive outputs
would only rename the existing open endpoint.

## Why the actual unused row has the wrong polarity

The existing exact-five two-hit terminal says that two distinct strict
physical-class hits in the unused source's actual row are impossible.
Production uses its complement to choose `continuation.first` and
`continuation.second`; by construction both are absent from that row and both
deletions survive at its blocker.

The unused row therefore cannot instantiate the two-hit terminal, nor can it
be identified with a first-apex row: its center is provably different from
the first apex.  It also cannot turn the continuation pair into the terminal
reverse outside pair, because those two kinds of points lie on opposite sides
of the physical-cap membership split.

There is a more expensive possible use of the unused row.  If one proved that
its blocker lies in the physical second cap **and** that its support shares a
complete transition reverse outside pair with the corresponding transition
row, `outsidePair_unique_capCenter` would close from the two distinct same-cap
centers.  Neither field is available.  This route is strictly broader than
proving first-apex co-radiality directly, because it needs both cap placement
and two positive overlap memberships.

## Exact smallest missing field

The narrowest existing production terminal remains

```lean
FirstApexCoRadialTransitionReversePairOccurrence A
```

which expands to

```lean
exists q a b,
  a != b /\
  a in transitionReverseOutsidePair A.transition q /\
  b in transitionReverseOutsidePair A.transition q /\
  dist S.oppApex1 a = dist S.oppApex1 b.
```

Once this one equality-bearing occurrence is produced,
`false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence` closes the
all-reverse leaf immediately.  The named T0/T1 containment occurrence remains
a sufficient stronger producer.  The audit here shows that neither `noM44`,
generic minimality, nor the unused row reduces that target further on its own.

Accordingly the active T0/T1 plus global-parent coupling lane is still the
load-bearing route.  A useful alternative must yield direct `False` or the
displayed occurrence; another row-existence, deletion-survival, or fresh-core
packet without the equality/cross-incidence is nonterminal.

## Validation

The scratch file was checked as a deliberate single-file Lean elaboration
with warnings as errors:

```text
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/allreverse-nom44-direct-closer/\
AllReverseGlobalFieldBoundary.lean
```

Every printed declaration has exactly the three core axioms:

```text
propext, Classical.choice, Quot.sound
```

The source contains no `sorry`, `admit`, declared `axiom`, `unsafe`, or
`native_decide` escape hatch.

## Epistemic status

- **PROVEN (kernel-checked scratch):** the global-field boundary and all three
  source-mismatch corollaries.
- **PROVEN (current production):** the ready first-apex occurrence terminal,
  the two-hit unused-row terminal, the cap/order outside-pair terminal, and the
  exact origin-tagged continuation fields used above.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** no registered theorem derives a direct
  contradiction or ready consumer antecedent from only `noM44`, `D.Minimal`,
  and the actual unused-source continuation row on this full parent.
- **NOT CLAIMED:** logical independence from every possible future global
  Euclidean/MEC theorem, or existence of a full Problem-97 countermodel.
- **OPEN:** the first-apex co-radial reverse-pair occurrence, or an equally
  direct parent-scoped geometric contradiction.
