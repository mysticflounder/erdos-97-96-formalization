# Exact-five common-deletion to all-reverse coupling audit

Date: 2026-07-18

Status: **NO SOURCE-FAITHFUL IMMEDIATE COUPLING TO AN EXISTING TERMINAL.**
The unused-row/common-deletion modules normalize rows whose incidence polarity
is opposite to the existing exact-five two-hit terminal, and they do not force
the first-apex co-radial reverse outside pair needed by the production
all-reverse terminal.  The smallest genuinely missing global fact remains one
first-apex co-radial occurrence in a transition reverse outside pair.  No
production theorem or `sorry` was changed.

This audit owns only
`scratch/atail-force/period3-common-deletion-coupling-audit/`.  It does not edit
production Lean, shared plans, proof-blueprint state, `ShellCurvature`,
`surplusM44`, or the protected 555/654 lanes.

## Required theorem-bank preflight

Before considering a new row or metric theorem, the audit checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered unused exact-five rows,
common deletion, all-reverse transitions, common outside pairs, ordered-cap
two-center uniqueness, blocker-center distinctness, and first-apex co-radial
residuals.  The nearest hits are the current production normal forms and
consumers discussed below.  No banked theorem supplies the missing aggregate
occurrence.

## What the common-deletion modules actually give

| Surface | Source-faithful output | Terminal match |
| --- | --- | --- |
| `LargeCapUniqueFiveUnusedCriticalRow` | An unused point of the large physical cap, its actual critical row, and an actual blocker distinct from `S.oppApex2`; see `LargeCapUniqueFive.lean:204-223`. | The structure does **not** put the actual blocker in the physical cap and does not put two physical sources in its support. |
| `actualUnusedRow_physicalInterior_inter_card_le_one` | The unused critical support contains at most one point of the physical exact-five strict-cap class; see `LargeCapUniqueFiveLowHit.lean:46-83`. | This is the opposite polarity from `false_of_largeCapUniqueFiveTwoHitCriticalRow`, which needs two physical hits.  The two-hit terminal cannot be recovered from this row. |
| `LargeCapUniqueFiveTwoCommonDeletionSources` | Distinct strict-cap sources `first` and `second`, both explicitly **outside** the unused critical support, with common-deletion packets at the unused blocker and physical apex; see `LargeCapUniqueFiveLowHit.lean:91-124`. | The packet banks two misses, not two hits.  It creates deletion survival and overlap data but no contradiction antecedent. |
| Common-deletion normal form | Both `B1` rows are the same unused critical support; both `B2` rows are the physical exact-five class erased at the selected source; the two `B2` rows meet in three points; see `LargeCapUniqueFiveCommonDeletionNormalForm.lean:77-251`. | These are exact normalizations, but they do not produce a common pair outside the physical cap or a second same-cap center for such a pair. |
| `exists_third_commonDeletionSource` | A third point of the physical radius class outside `B1`, whose deletion preserves K4 at both centers; see `LargeCapUniqueFiveCommonDeletionNormalForm.lean:257-270`. | Its statement deliberately does not place the third point in the strict cap interior.  It therefore cannot be inserted into the physical transition orbit without a new geometric fact. |

The key obstruction is not merely that a proof has not been found.  The checked
source theorem gives an upper bound of one physical hit in the unused row.  Any
route that asks this same row to supply the two hits consumed by the existing
direct-`False` theorem has the wrong logical direction.

## What the all-reverse transition already gives

For a total physical transition `T` and global reverse membership `hreverse`,
production already proves:

- `transitionReverseRowCenter T q` is in the strict physical cap
  (`LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean:180-211`);
- the successor row meets the physical cap in exactly
  `{q, T.successor q}` (`:215-257`);
- `transitionReverseOutsidePair T q` has cardinality two and lies outside the
  physical cap (`:260-302`);
- the global physical vertex set has cardinality three (`:376-400`); and
- two distinct members of one reverse outside pair that are co-radial from
  `S.oppApex1` give `False` through
  `CapSelectedRowCounting.outsidePair_unique_capCenter`
  (`:650-717`).

Thus the period-three/all-reverse side already has the correct terminal.  It
does not need another local contradiction consumer.

## The only direct coupling available from the current fields is nonterminal

The unused point is not in the physical exact-five radius class.  In an
all-reverse successor row, the intersection with the physical cap is exactly
the adjacent pair of physical vertices.  Consequently, the unused point is
omitted from every transition successor row: membership would force it to equal
a physical vertex, contradicting its exclusion from the physical radius class.

Combined with the stored facts that `first` and `second` are omitted from the
unused row, this yields mutual-omission relations between the unused source and
the corresponding physical rows.  That is a valid consequence, but it only
produces more deletion-survival/common-deletion packets.  The current consumer
graph returns to the same robustness/normal-form surface; it does not end in
`False`.  Formalizing it as a new endpoint would therefore be another
nonterminal adapter, which this lane intentionally does not add.

The all-reverse cardinality-three result also leaves at most one other physical
vertex after choosing the two stored sources.  It reinforces, rather than
repairs, the mismatch with the unused-row two-hit terminal.

## Why the unused blocker cannot currently replace the first apex

One could try to apply `outsidePair_unique_capCenter` using the transition
blocker and the unused blocker as the two centers.  Current source would allow
their distinctness to be proved from a stored omission via
`blocker_centers_ne_of_not_mem_other_selected_support`
(`CriticalPairFrontier.lean:807-824`).  But two genuinely absent positive facts
remain:

1. the unused blocker lies in the physical cap; and
2. some `transitionReverseOutsidePair T q` is contained in, or co-radial on,
   the unused critical support.

Neither the unused-row structure nor the common-deletion normal form supplies
either fact.  This alternative is therefore strictly stronger and less direct
than using the already-retained first apex.

## Smallest genuinely missing global fact

The exact source-faithful target remains the aggregate occurrence below.  It
must retain the full large-opposite-caps parent `L`, the common critical system
`H`, the exact-five profile and continuation, the total transition `T`, and its
global reverse-membership arm.  Those global inputs are essential: finite row
marginals do not imply the occurrence.

```lean
-- Architectural statement; not elaborated here.
theorem exists_transitionReverseOutsidePair_coRadial_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : Real} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : forall q : PhysicalVertex profile,
      q.1 in
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q)))
          .toCriticalFourShell.support) :
    exists q : PhysicalVertex profile, exists a b : Real^2,
      a != b /\
      a in transitionReverseOutsidePair T q /\
      b in transitionReverseOutsidePair T q /\
      dist S.oppApex1 a = dist S.oppApex1 b
```

The exact-pair variant

```lean
exists q a b,
  transitionReverseOutsidePair T q = {a, b} /\
  dist S.oppApex1 a = dist S.oppApex1 b
```

is equivalent after using `exists_transitionReverseOutsidePair_eq_pair`.
Either form feeds
`false_of_transitionReverseOutsidePair_coRadial_firstApex` immediately and
closes the all-reverse branch.  The stronger identity
`transitionReverseOutsidePair T q = {F.pair.q, F.pair.w}` also closes it, but
should not be required unless the proof genuinely derives those named points.

## Decision

- **Do not** promote another unused-row/common-deletion conditional consumer.
- **Do not** target the already-source-refuted two-hit shape for the unused row.
- Keep the common-deletion normal form available as parent data, but do not make
  it a separate closure lane.
- Target the aggregate first-apex co-radial reverse-pair occurrence directly.
- If that occurrence proof uses the unused-row packet, it must visibly derive a
  new positive cross-row incidence; the current normal forms alone do not do so.

## Epistemic ledger

- **PROVEN IN CURRENT SOURCE:** the row normal forms, at-most-one physical hit,
  transition exact `2 + 2` split, global physical-cardinality-three result, and
  the first-apex co-radial terminal.
- **DERIVABLE, NOT FORMALIZED HERE:** omission of the unused point from every
  all-reverse successor row and the resulting mutual-omission packets.
- **OPEN:** the displayed aggregate occurrence and any theorem locating the
  unused blocker in the physical cap.
- **REFUTED AS A ROUTE SHAPE:** producing two physical hits in the unused row.
- **NOT NEEDED FOR THIS AUDIT:** Lean/Lake build or a production edit.  The
  user lifted the build gate on 2026-07-18 for subsequent implementation work.
