# Reverse-apex omission source audit

Date: 2026-07-17

Status: **THE ROUND-13 GEOMETRY HAS AN EXACT ROLE MATCH, BUT THE OPPOSITE-APEX
OMISSION IS NOT DERIVABLE FROM THE CURRENT IMPORTED LEAN BANK.  THE LIVE
SOURCE ALREADY PROVES THE TWO SAME-CAP HITS AND THE EXACT `2 + 2` CAP SPLIT;
THE MISSING IMPORTED INGREDIENT IS THE MEC/CAP-SEGMENT LEMMA WHICH SAYS THAT
AN INTERIOR-CAP-CENTERED SHELL THROUGH TWO CAP POINTS CANNOT ALSO CONTAIN THE
OPPOSITE MEC VERTEX.  COMPLEMENTARY-OPEN-BLOCK LOCALIZATION IS ROUTINE ONCE
THAT ONE LEMMA IS AVAILABLE.  THE CURRENT FULL-QUOTIENT RATIONAL QF_LRA SAT
WITNESS ALREADY OMITS THE APEX, SO THIS TIGHTENING DOES NOT CLOSE THE LIVE
CELL OR A PRODUCTION `sorry`.**

This lane owns only
`scratch/atail-force/reverse-apex-omission-source/`.  It did not edit
production Lean, shared docs, proof-blueprint state, git, protected lanes,
`ShellCurvature`, or `SurplusM44`, and it ran no Lean/Lake/LSP command.

## Bank preflight

The audit checked the required registries before proposing a new geometry
lemma:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran `nthdegree docs search --lean` for:

```text
circle centered in cap interior through opposite MEC vertex at most one point of cap
oppositeVertex not in selected support two capInterior points
MEC straddling row opposite vertex same radius two cap points
```

The search found the existing one-sided cap injectivity lemmas and
`Problem97.Census554.MECStraddlingRowCore`, but no declaration with the
round-13 Lemma-11 statement.  No required certificate registry contains a
matching imported producer.

## Exact live role match

Fix `i : Fin K.period` and abbreviate the reverse row by

```lean
let R :=
  (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
```

The prose roles from
`/opt/nfs/front-a-closure-backup-20260718T025149Z/verified-results.md`, Lemma
11, specialize exactly as follows:

| prose role | live object |
| --- | --- |
| cap `C_i` | `S.capByIndex S.oppIndex2` |
| open block `B_i` | `S.capInteriorByIndex S.oppIndex2` |
| opposite MEC vertex `v_i` | `S.oppApex2` |
| shell center `p` | `H.centerAt (K.source (K.successorIndex i)).1 ...` |
| first cap hit `a` | `(K.source i).1` |
| second cap hit `b` | `(K.source (K.successorIndex i)).1` |
| shell/fiber | `R.support` |

The equality between `S.oppApex2` and
`S.oppositeVertexByIndex S.oppIndex2` is already proved by the private helper
`ATailLargeCapUniqueFive.oppApex2_eq_oppositeVertex_oppIndex2`; a downstream
module would need to export it or repeat its three-case proof.

## What the current field chain already proves

`PhysicalActualCriticalOmissionCycle` and `AllReverseMembership` provide all
non-MEC inputs needed by the specialization:

The live cycle declarations below are in
`Problem97.ATailLargeCapUniqueFivePhysicalOmissionCycle`; the reverse
hypothesis is
`Problem97.ATailThreeRowSharedBoundaryProducerScratch.AllReverseMembership`.
The three checked scratch reductions are fully qualified as
`Problem97.ATailExactFiveReverseMembershipClosureScratch.successor_actualBlocker_mem_physicalCapInterior`,
`Problem97.ATailExactFiveReverseMembershipClosureScratch.successor_actualCriticalSupport_inter_physicalCap_eq_pair`,
and
`Problem97.ATailExactFiveReverseMembershipClosureScratch.successor_actualCriticalSupport_outside_physicalCap_card_eq_two`.
The outside-pair names are in
`Problem97.ATailExactFiveReverseOutsidePairProducerScratch`.

1. `PhysicalActualCriticalOmissionCycle.source_mem_capInterior K i` and the
   same theorem at `K.successorIndex i` put both sources in the physical open
   cap block.
2. `PhysicalActualCriticalOmissionCycle.successor_source_ne K i` makes the
   two sources distinct.
3. `AllReverseMembership K`, evaluated at `i`, puts `(K.source i).1` in
   `R.support`.
4. `CriticalFourShell.q_mem_support` puts the successor source in
   `R.support`.
5. The checked scratch theorem
   `successor_actualBlocker_mem_physicalCapInterior K hreverse i` puts the
   reverse blocker/row center in the same physical open block.  Its proof uses
   the two row equalities, the common physical-radius equality, and
   `commonPhysicalPair_center_mem_secondCapInterior`.
6. The checked scratch theorem
   `successor_actualCriticalSupport_inter_physicalCap_eq_pair K hreverse i`
   upgrades the two hits to the exact identity

   ```text
   R.support ∩ S.capByIndex S.oppIndex2
     = {source i, source (successorIndex i)}.
   ```

   Its upper bound is exactly
   `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`.
7. Consequently,
   `successor_actualCriticalSupport_outside_physicalCap_card_eq_two` and
   `reverseOutsidePair_card_eq_two` prove that the remaining reverse pair has
   exactly two points outside the physical cap.

This is the strongest current source-level conclusion.  It saturates the
available cap-counting bound: the existing bank says “at most two cap hits”,
and the live row already has exactly those two hits.

Two tempting cycle fields do **not** supply the missing conclusion:

- `actualBlocker_ne_physicalApex` says that the row **center** differs from
  `S.oppApex2`; it does not say that the apex is absent from the row support.
- `successor_not_mem_actualCriticalSupport` omits the next source from the
  current forward row; it says nothing about the physical apex in the
  successor reverse row.

Thus there is no projection or rewriting chain from the current cycle fields
to

```lean
S.oppApex2 ∉ R.support.
```

## Why `MECStraddlingRowCore` is not the missing import

`Problem97.Census554.MECStraddlingRowCore.metric_orientation_incompatibility`
is a genuine production MEC obstruction, but it is not the general Lemma-11
statement.  Besides disk and orientation fields, it requires the special
metric chain

```text
dist o a = dist a p = dist o s = dist s x = dist s y.
```

The reverse-row surface gives `dist s x = dist s y = dist s o` only under
the apex-membership contradiction hypothesis.  It does not give the extra
triangle-side equalities `dist o a = dist a p`, and the prose proof of Lemma
11 does not assume them.  The module is also not in the production import
chain of `LargeCapUniqueFivePhysicalOmissionCycle`; the only direct import
found in the audited tree is a scratch validation file.

Therefore importing `MECStraddlingRowCore` would not by itself close the
gap.  An adapter would still need stronger equalities that are absent from
the live packet.

## Exact missing imported lemma

The smallest reusable missing geometry producer has this mathematical Lean
shape.  This is a source draft, not an elaboration claim:

```lean
theorem oppositeVertexByIndex_not_mem_criticalSupport_of_two_capInterior_hits
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {q center x y : ℝ²}
    (R : CriticalFourShell A q center)
    (hcenter : center ∈ S.capInteriorByIndex i)
    (hxI : x ∈ S.capInteriorByIndex i)
    (hyI : y ∈ S.capInteriorByIndex i)
    (hxy : x ≠ y)
    (hxR : x ∈ R.support)
    (hyR : y ∈ R.support) :
    S.oppositeVertexByIndex i ∉ R.support
```

This is the direct `CriticalFourShell` form of prose Lemma 11.  A still more
general selected-class or arbitrary-radius-circle version is possible, but
is not needed to close this source bridge.

Once that declaration exists in an imported predecessor module, the smallest
reverse-row specialization is:

```lean
theorem successor_actualCriticalSupport_oppApex2_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : AllReverseMembership K)
    (i : Fin K.period) :
    S.oppApex2 ∉
      (H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
  let R :=
    (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell
  have hcenter :=
    successor_actualBlocker_mem_physicalCapInterior K hreverse i
  have hxy : (K.source i).1 ≠ (K.source (K.successorIndex i)).1 := by
    intro h
    exact K.successor_source_ne i (Subtype.ext h.symm)
  have hnot :=
    S.oppositeVertexByIndex_not_mem_criticalSupport_of_two_capInterior_hits
      D.convex S.oppIndex2 R hcenter
      (K.source_mem_capInterior i)
      (K.source_mem_capInterior (K.successorIndex i)) hxy
      (hreverse i) R.q_mem_support
  -- rewrite `S.oppApex2` with the exported/local three-case equality helper
  simpa [oppApex2_eq_oppositeVertex_oppIndex2 S] using hnot
```

No body above was elaborated in this lane.  The point of the draft is to show
that after the one missing geometry lemma, the cycle specialization has no
further mathematical obligation.

## Complementary-open-block localization

After the apex omission, the desired localization is already sourceable from
the packet partition.  For `z ∈ reverseOutsidePair K i`:

1. `reverseOutsidePair_subset_complement` gives `z ∈ D.A` and
   `z ∉ S.capByIndex S.oppIndex2`.
2. `CriticalFourShell.support_eq_radius`, `support_subset_A`, and
   `mem_selectedClass` put `z` in the complete selected class at the reverse
   blocker and row radius.
3. `SurplusCapPacket.selectedClass_subset_groupUnion` places `z` in one of:
   the Moser triangle, the erased physical cap interior, the left adjacent
   interior, or the right adjacent interior.
4. The erased physical-cap case contradicts `z ∉ capByIndex` using
   `capInteriorByIndex_subset_capByIndex`.
5. In the Moser-triangle case, the two endpoints of the physical cap
   contradict `z ∉ capByIndex` via
   `leftOuterVertexByIndex_mem_capByIndex` and
   `rightOuterVertexByIndex_mem_capByIndex`; the third vertex is the opposite
   vertex and contradicts the new apex-omission theorem.  A local `fin_cases`
   helper classifying the three triangle vertices is only bookkeeping.

Hence the conditional target is:

```lean
reverseOutsidePair K i ⊆
  S.leftAdjacentInteriorByIndex S.oppIndex2 ∪
  S.rightAdjacentInteriorByIndex S.oppIndex2.
```

This step needs no additional geometric producer beyond the apex omission.

## Effect on the live SAT witnesses

The finite outside-target universe in
`t0-t1-reverse-occurrence-audit/check_full_role_occurrence.py` is already the
physical apex plus the two complementary private/open blocks.  Therefore the
round-13 tightening has exactly one finite effect: remove cells in which a
reverse outside pair contains the physical-apex label.  The open-block
localization removes nothing further after that exclusion.

Among the six displayed representative witnesses in that audit, five use the
apex label in at least one reverse pair.  The representative for
`rho = r`, role `IO`, already avoids it:

```text
{7,9}, {6,9}, {3,6}.
```

More decisively, the current source-faithful full-role/identity-quotient
witness in
`period-three-full-role-identity-quotient/{REPORT.md,RESULT.json}` already
uses six fresh reverse targets, one disjoint pair per row, and explicitly
imposes that the physical apex has distance unequal to every reverse radius.
Its rational QF_LRA ledger is still SAT with minimum triangle and Kalmanson
margin `1`.  `RESULT.json` records:

```text
round13_opposite_apex_exclusion:
  encoded: the physical apex is unequal to every reverse radius
```

So the apex omission is valuable source tightening and should be formalized,
but it does **not** reject the current fully disjoint live SAT cell.  The next
constraint needed against that cell remains information outside the linear
distance abstraction: planar Euclidean rank/coordinate realization, then MEC
geometry or total-CSS/minimality extension.

## Epistemic ledger

- **PROSE-PROVEN / NOT LEAN-IMPORTED:** round-13 Lemma 11 in the copied
  `/opt/nfs` backup.
- **EXACT SOURCE MATCH:** the reverse blocker, adjacent source pair, cap, and
  opposite-apex roles listed above.
- **LEAN-CHECKED IN EXISTING SCRATCH, NOT PRODUCTION:** blocker-in-cap,
  exact two-point cap intersection, and exact two-point outside pair.
- **NOT SOURCEABLE FROM CURRENT IMPORTED BANK:** opposite-apex omission.
- **SOURCEABLE CONDITIONAL ON THAT LEMMA, NOT ELABORATED HERE:** localization
  of the outside pair to the two complementary open blocks.
- **EXACT PROJECTED SAT SURVIVES:** the current fully disjoint rational QF_LRA
  witness already satisfies the apex exclusion.
- **NOT CLAIMED:** a Lean proof of prose Lemma 11, Euclidean/MEC realization
  of the SAT ledger, direct `False`, or production closure.
- **PRODUCTION `sorry` CLOSED:** none.
