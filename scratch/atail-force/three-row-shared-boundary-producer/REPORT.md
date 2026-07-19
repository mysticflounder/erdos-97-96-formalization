# Period-three shared-boundary producer audit

Date: 2026-07-17

Status: **THE SINGLE FORWARD FOUR-INEQUALITY PACKET IS OVERSTRONG AS AN
UNCONDITIONAL INTERFACE.  ONE SHARED STRICT-CAP BLOCK AND A TWO-BRANCH
ORIENTATION PACKET ARE SOURCE-FAITHFULLY CONSTRUCTIBLE FROM PERIOD THREE AND
ALL-REVERSE MEMBERSHIP.  THE REMAINING GAP IS THE POINTWISE KALMANSON
CONSUMER/API, NOT A 1,224-CASE CERTIFICATE.  THE INTERFACE FILE NOW
ELABORATES CLEANLY AGAINST THE CURRENT TREE.  NO PRODUCTION THEOREM OR
`sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/three-row-shared-boundary-producer/`.  It did not edit
production Lean, shared documents, blueprint state, `ShellCurvature`,
`SurplusM44`, the card-five lane, or protected census files.  After the
`ShellCurvature` build gate was lifted, the file was checked by a scoped Lean
elaboration through the scratch dependency chain.

## Required preflight

The audit checked the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` discussion;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also searched the indexed Lean corpora for `StrictCapBlockData`, a
three-source straddling cycle, reflected cap order, and the four requested
source/blocker inequalities.  The relevant hits were the current
`CGN.StrictCapBlockData`,
`SurplusCapPacket.capByIndex_cgn4g_strictCapBlockData`, the existing per-row
straddle work, and `CapCrossingKalmanson`.  No banked theorem supplies the
period-three shared orientation packet.  The stale C5D3B declarations in the
sibling census do not address this source-indexed cycle and remain unsuitable
for direct import.

## Verdict

There are two separate questions.

1. **Can all three rows be indexed in one shared cap block?** Yes.  This is
   routine theorem plumbing.
2. **Do the four specific inequalities in the previous pruning report follow
   without a case split?** No source theorem fixes that chirality.  The correct
   invariant output is a two-branch orientation disjunction.

The earlier packet requested

```text
q0 < c0,  q0 < c2,  c1 < q2,  c2 < q2.              (F)
```

This is the forward branch.  In the reflected branch the source order is

```text
q0 < q2 < q1,
```

and the corresponding automatic inequalities are

```text
q0 < c0,  q0 < c2,  c1 < q1,  c0 < q1.              (R)
```

The finite straddle abstraction itself permits `(R)`; for example the linear
word

```text
q0, c2, q2, c0, c1, q1
```

satisfies all three adjacent-pair straddles.  This is not asserted to be a
full `CounterexampleData`, but it is enough to show that choosing `(F)` from
the already-proved straddle facts would be an unjustified orientation
assumption.

The explicit disjunction `(F) or (R)` removes that problem.  It is obtained by
choosing the least of the three source indices in one block and comparing the
remaining successor and twice-successor indices.  No new Euclidean
classification is needed for this normalization.

## Exact existing ingredients

Fix

```lean
K : PhysicalActualCriticalOmissionCycle H profile
hperiod : K.period = 3
hreverse : AllReverseMembership K.
```

The current sources provide:

- `SurplusCapPacket.capByIndex_cgn4g_strictCapBlockData` for one
  `B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)`;
- `PhysicalActualCriticalOmissionCycle.source_mem_capInterior` for every
  cycle source;
- `successor_actualBlocker_mem_physicalCapInterior K hreverse i` for every
  reverse-row blocker;
- `CGN.StrictCapBlockData.exists_index_of_mem_cap` to name every source and
  blocker in this same `B.L`;
- `K.source_injective` and `K.successor_source_ne` for distinct source
  indices;
- `reverseRowCenter_injective K hreverse` for distinct blocker centers;
- `CGN.oneSidedDistanceInjective_of_mecCapPacket B.Packet B.Hside B.Hord`
  plus the actual critical-shell radius equalities to put each blocker
  strictly between its two adjacent sources; and
- the definition `PhysicalActualCriticalOmissionCycle.successorIndex` plus
  `hperiod` to prove the three successor identities.

The per-row theorem
`nonempty_reverseRowGlobalBlockStraddle` already contains almost all of the
fixed-block argument, but it chooses `B` internally on every call.  The only
factoring needed is the same proof with `B` supplied by the caller.  The
candidate name is `FixedBlockReverseRowStraddle` in `CandidateAdapter.lean`.

## Smallest source-faithful packet

`CandidateAdapter.lean` records

```lean
structure PeriodThreeReverseSharedCapOrder (K : ...) where
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  i0 i1 i2 : Fin K.period
  successor_i0 : K.successorIndex i0 = i1
  successor_i1 : K.successorIndex i1 = i2
  successor_i2 : K.successorIndex i2 = i0
  q0 q1 q2 c0 c1 c2 : Fin block.m
  -- exact point identities
  q0_lt_c0 : q0 < c0
  c0_lt_q1 : c0 < q1
  q0_lt_c2 : q0 < c2
  c2_lt_q2 : c2 < q2
  orientation :
    (q1 < c1 ∧ c1 < q2) ∨
      (q2 < c1 ∧ c1 < q1)
```

The first orientation yields `(F)`.  The second yields `(R)`.  Storing the
whole previously sampled word

```text
left, q0, c0, c2, q1, c1, q2, right
```

would still be too strong: the existing source only needs and only proves the
coarser inequalities above.  In particular, it does not order `c0` against
`c2` or force either one to lie on a specified side of the middle source.

## Proof outline

### Routine fixed-block extraction

1. Choose `B` once using
   `S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2`.
2. For each source and blocker, compose its strict-interior theorem with
   `S.capInteriorByIndex_subset_capByIndex`, then apply
   `B.exists_index_of_mem_cap`.
3. For a row `i`, rewrite the two shell-radius equalities at
   `reverseRowCenter K i` into `B.L.points` form.
4. Exclude equality of the blocker index with either source index using
   `CriticalFourShell.center_not_mem_support`.
5. Apply
   `CGN.oneSidedDistanceInjective_of_mecCapPacket B.Packet B.Hside B.Hord`.
   If both sources were on the same side of the blocker, one of its two
   injectivity directions would contradict their equal distances.  Hence the
   blocker is strictly between them.

This is the proof already present in
`nonempty_reverseRowGlobalBlockStraddle`, minus its repeated internal choice
of `B`.

### Routine period-three normalization

1. Use `hperiod` to name the three cycle indices and prove that successor is
   a 3-cycle by `Fin.ext`, unfolding
   `PhysicalActualCriticalOmissionCycle.successorIndex`.
2. Use source injectivity and `B.L.injective` to show the three source indices
   are pairwise distinct.
3. Rotate the choice of `i0` so `q0` is the least source index.  This is a
   three-element `Finset.min'`/`fin_cases` argument, not geometry.
4. Totality leaves exactly `q1 < q2` or `q2 < q1`.
5. Orient the three fixed-block straddles using the least-index facts.  The
   row-0 and row-2 conclusions are common to both branches; the row-1
   straddle is precisely the stored disjunction.

Thus the disjunctive producer is finite order bookkeeping.  The unsupported
step would be deleting the reflected branch.

## Consumer/API caveat

`CGN.StrictCapBlockData` retains:

- `B.Block.phi_image`;
- the local-to-global interval embedding `B.Block.idx`; and
- the strong local cap predicate `B.Hord`.

It does **not** retain either

```lean
Function.Injective B.phi
EuclideanGeometry.IsCcwConvexPolygon B.phi.
```

Those facts are used internally when CGN4g constructs the particular block,
but they are not projections from the public structure.  Consequently an
arbitrary `B : StrictCapBlockData ...` cannot directly feed
`CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw` or
`false_of_two_selected_rows_shared_late_pair`, whose boundary argument also
uses `Fin carrier.card`.

There are two honest follow-ups:

1. prove the needed pointwise exclusion directly from `B.Hord` and the fact
   that an outside-pair member is not in `B.cap_image`; or
2. strengthen/refactor the CGN4g export to retain its global injective/CCW
   evidence and generalize the Kalmanson theorem from `Fin A.card` to an
   arbitrary injective enumeration `Fin n` with image `A`.

The first route is smaller.  `StrictCapOrder.subchord_open_side_iff_A`
already puts every outside target on the nonpositive side of every relevant
cap subchord, and `D.convex.not_three_collinear` upgrades that to strict side
information.  The remaining proof should be a direct signed-area/diagonal
intersection wrapper followed by the two exact row-radius rewrites.

## Effect on the pruning normal form

In the forward orientation, the Kalmanson exclusions should give

```text
Disjoint P0 P2
Disjoint P1 P2,
```

so only `P0/P1` may overlap at union cardinality five.

In the reflected orientation, the symmetric expected output is

```text
Disjoint P0 P2
Disjoint P0 P1,
```

so only `P1/P2` may overlap at union cardinality five.

The invariant finite conclusion is therefore:

```text
one of the three outside pairs is disjoint from both other pairs;
the union has cardinality at least five;
at union cardinality five, exactly the other two pairs overlap once.
```

This is the source-faithful form that the next Euclidean/MEC or global
critical-map consumer should accept.  It is still pruning, not `False`.

## Validation status

`CandidateAdapter.lean` now elaborates successfully with Lean 4.27.0 after
splitting the grouped dependent structure fields into ordinary individual
fields.  The check used the production Lake environment, `-R ..`, the
16-GiB worker cap, and a fresh temporary `LEAN_PATH` containing freshly
elaborated scratch dependencies.  There are no `sorry`, `admit`, or `axiom`
commands in the file, and it still contains no claimed producer proof: the
producer boundary remains an `abbrev`.  No full project build was run because
this scratch module is not a Lake target.  This audit closes an interface and
elaboration ambiguity; it does not close a production `sorry`.
