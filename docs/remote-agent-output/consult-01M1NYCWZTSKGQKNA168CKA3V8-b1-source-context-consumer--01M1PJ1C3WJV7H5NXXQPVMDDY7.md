# P97 B1 source-context consumer consult

**Consult:** `01M1NYCWZTSKGQKNA168CKA3V8`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`  
**Original source boundary:** one `ExactFourMutualOmissionJointDeletion` plus one
`ExactFourMutualOmissionSourceContext`  
**Audit date:** 2026-09-04  
**Verdict:** choose a strengthened form of **Option 2**

## Executive verdict

There is no currently justified source-clean terminal from one joint-deletion
packet plus the stored source context. The packet has too little cross-deletion,
boundary-order, and radius information. The strongest mathematically honest
next theorem is instead:

> In the card-six branch, construct a second joint-deletion packet for the same
> source pair, choose it distinct from the existing packet, derive the
> source-clean one-way cross-deletion omission, and retain the resulting
> inequality of the two deleted-source actual blockers.

This improves Option 2. It should not stop at “there exists a second deletion.”
The useful output is a proof-relevant **two-deletion cross residual**.

A source-aligned card-six theorem implementing a closely related selection is
already proof-checked in the current worktree:

```text
Problem97.ATailFrontierLiveClosure.
  exists_b1CardSix_distinctDeletion_or_vRowSaturation
```

That theorem either constructs a second same-`u,v` joint deletion distinct from
the existing one or returns an exact, named `v`-row saturation residual. It
preserves substantially more geometry than a bare cardinality split.

For the pure structural route, however, the existing source-clean theorem

```text
exists_two_exactFourMutualOmissionJointDeletions
```

under class cardinality at least six is stronger: it always provides two
same-pair packets with distinct deleted points. One of those packets must differ
from the existing B1 packet. Combining this with

```text
Problem97.ATailFrontierLiveClosure.
  exactFour_twoDeletion_crossOmission
```

gives the correct immediate target.

This route does **not** close B1. It removes the “second packet is absent” gap in
the card-six branch and in the distinct-deletion arm of the card-five split, but
the resulting one-way cross-deletion/survival-square residual has no current
kernel-clean terminal.

## 1. Why Option 1 is not the right next theorem

The original data are:

```text
P : ExactFourMutualOmissionJointDeletion R rho u v
X : ExactFourMutualOmissionSourceContext R rho source other u v
```

The source context retains useful provenance:

- `source` and `other` lie in the physical second-apex class and the strict
  second-cap interior;
- `source` is outside the first-apex blocker fiber;
- `source` is omitted from the common first-apex row;
- `source` survives deletion of one retained first-apex endpoint;
- the source blocker differs from the common first-apex blocker;
- `source ∈ row(u)`;
- `v ∉ row(source)`;
- either `u = source` or `u ∉ row(source)`;
- the relevant row/class intersection has cardinality at most two.

These facts do not determine a contradiction from one packet.

The current neutral consumers of `ExactFourMutualOmissionSourceContext` are
mostly round-trip or projection theorems. The first genuinely stronger clean
consumer found in the exact-five rigid branch is

```text
Problem97.ATailFrontierLiveClosure.
  exactFourRigid221_context_u_ne_source_normalForm
```

but it additionally needs the exact-five rigid cover, a constructed global
deletion, blocker separation, and `u ≠ source`. Its conclusion is another
third-row normal form, not `False`.

In the `u = source` branch, the clean placement split similarly produces
inside/outside blocker residuals. The available contradiction theorems for
those placements either require a physical-apex context not present in B1 or
have a `sorryAx`-dependent terminal downstream.

The one-packet interface has no:

- relation between two deleted-source rows;
- second positive radius at a relevant center;
- common cyclic-order chart for the source-selected rows;
- same-boundary-arc fact;
- three-point perpendicular-bisector witness;
- source-to-escape or fresh-pair-to-canonical-pair alignment.

A “one-packet terminal” would therefore either add a genuinely new geometric
hypothesis or conceal an open branch. It is not the next theorem supported by
the current source.

## 2. Why Option 3 is not presently available

The most promising direct terminal in the B1 order infrastructure is a
same-boundary-arc contradiction. A typical clean consumer requires a
`B1SliceSameBoundaryArc` or `B1WinningLiveSliceSameBoundaryArc` witness for a
two-point live slice relative to the physical apex and the live-row blocker.

The current source does not produce this.

The relevant source selection and boundary construction are independent:

- the fresh source pair `u,v` is selected by the mutual-omission producer;
- the escape star and its boundary/cap data are built independently;
- no field identifies the fresh pair with the canonical live pair;
- no field identifies `G.source` with the escape source;
- blocker-between-endpoints is a separation fact, not the same-side fact
  required by `B1SliceSameBoundaryArc`.

In the card-six interior-pair case, current clean geometry actually places the
live-row blocker between the two endpoints. This is the alternating hard cell,
not a proof of same arc. Extremal selection of the third point does not identify
its live mate and gives no control over the blocker, which need not lie in the
physical class.

The Kalmanson and affine terminals now available in the project likewise need a
named role map, six or more positive row incidences, and a common cyclic order.
The B1 source packet does not produce those data.

Thus a direct contradiction is not currently derivable from the stored fields.

## 3. Existing source-clean card-six selection theorem

The proof-checked source-aligned theorem has the exact shape:

```lean
theorem
  Problem97.ATailFrontierLiveClosure.
    exists_b1CardSix_distinctDeletion_or_vRowSaturation
    (C :
      B1GlobalTransportContext
        (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hsix :
      (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (hu : G.u = G.source)
    (hvOutside :
      G.v.1 ∉ S.capInteriorByIndex S.oppIndex2) :
    (∃ K : ExactFourMutualOmissionJointDeletion
        C.R C.rho G.u G.v,
      K.deleted ≠ G.jointDeletion.deleted) ∨
    Nonempty (B1CardSixVRowSaturationResidual C G)
```

The saturation residual is proof-relevant and retains:

```lean
structure B1CardSixVRowSaturationResidual
    (C : B1GlobalTransportContext ...)
    (G : B1FullGeometricCoupledSourceResidual C) where
  mate : CarrierVertex D.A

  mate_ne_source : mate ≠ G.source
  mate_ne_v : mate ≠ G.v
  mate_ne_deleted : mate ≠ G.jointDeletion.deleted

  deleted_mem_class :
    G.jointDeletion.deleted.1 ∈
      SelectedClass D.A S.oppApex2 C.rho
  mate_mem_class :
    mate.1 ∈ SelectedClass D.A S.oppApex2 C.rho

  deleted_mem_interior :
    G.jointDeletion.deleted.1 ∈
      S.capInteriorByIndex S.oppIndex2
  mate_mem_interior :
    mate.1 ∈ S.capInteriorByIndex S.oppIndex2

  deleted_not_mem_source_row :
    G.jointDeletion.deleted.1 ∉
      b1FullGeometricActualRow C G.source
  deleted_not_mem_u_row :
    G.jointDeletion.deleted.1 ∉
      b1FullGeometricActualRow C G.u
  mate_not_mem_source_row :
    mate.1 ∉ b1FullGeometricActualRow C G.source
  mate_not_mem_u_row :
    mate.1 ∉ b1FullGeometricActualRow C G.u

  deleted_not_mem_v_row :
    G.jointDeletion.deleted.1 ∉
      b1FullGeometricActualRow C G.v
  mate_mem_v_row :
    mate.1 ∈ b1FullGeometricActualRow C G.v

  v_row_intersection :
    b1FullGeometricActualRow C G.v ∩
        SelectedClass D.A S.oppApex2 C.rho =
      {G.v.1, mate.1}

  source_deleted_blockers_ne :
    (lateFirstApexSystem C.R).centerAt
        G.source.1 G.source.2 ≠
      (lateFirstApexSystem C.R).centerAt
        G.jointDeletion.deleted.1
        G.jointDeletion.deleted.2

  source_mate_blockers_ne :
    (lateFirstApexSystem C.R).centerAt
        G.source.1 G.source.2 ≠
      (lateFirstApexSystem C.R).centerAt mate.1 mate.2
```

Its main clean inputs are:

```text
Problem97.ATailFrontierLiveClosure.B1TwoOmittedInteriorPeers.
  exists_two_omittedSecondClassInteriorPeers

Problem97.ATailFrontierLiveClosure.
  exactFourMutualOmissionJointDeletion_of_prescribed
```

The surrounding card-six ingress also has the coupled one-peer corollary and the
prescribed-deletion theorem:

```text
exists_coupled_omittedSecondClassInteriorPeer

exists_b1CardSix_prescribedDeletion_of_source_eq_and_v_outsideInterior
```

The proof is genuinely source-selecting:

1. Card six and the strict-cap physical-class lower bound provide enough
   strict-interior class points.
2. The actual source-row trace bound removes at most two of them, leaving two
   distinct peers omitted from the source row.
3. When `v` lies outside the strict interior and the `v`-row class trace has
   cardinality at most two, one peer is also omitted from the `v` row.
4. `exactFourMutualOmissionJointDeletion_of_prescribed` builds the same-`u,v`
   packet with that peer as its deleted point.
5. If the peer differs from the existing deletion, the first branch is
   obtained.
6. The remaining finite case is preserved as the exact `v`-row saturation
   residual above.

The theorem and its two prerequisite modules were checked in the current
worktree with focused/governed Lean builds and with axiom closures containing
only:

```text
propext, Classical.choice, Quot.sound
```

They are not yet a proof of the target theorem.

## 4. Strongest proposed next theorem

For the pure structural card-six branch, the next theorem should not require
`hu` or `hvOutside`. It should use the general six-point second-deletion
producer and return the cross-deletion information needed downstream.

A suitable proof-relevant record is:

```lean
structure B1CardSixTwoDeletionCrossResidual
    (C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) where

  second :
    ExactFourMutualOmissionJointDeletion
      C.R C.rho G.u G.v

  deleted_ne :
    second.deleted ≠ G.jointDeletion.deleted

  cross_omission :
    G.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem C.R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support
      ∨
    second.deleted.1 ∉
        ((lateFirstApexSystem C.R).selectedAt
          G.jointDeletion.deleted.1
          G.jointDeletion.deleted.2).toCriticalFourShell.support

  deleted_blockers_ne :
    (lateFirstApexSystem C.R).centerAt
        G.jointDeletion.deleted.1
        G.jointDeletion.deleted.2 ≠
      (lateFirstApexSystem C.R).centerAt
        second.deleted.1 second.deleted.2
```

The proposed theorem is:

```lean
theorem nonempty_b1CardSixTwoDeletionCrossResidual
    (C :
      B1GlobalTransportContext
        (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hsix :
      (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    Nonempty (B1CardSixTwoDeletionCrossResidual C G)
```

The name may be adjusted to the repository convention, but the content should
not be weakened.

### Proof route

Let

```text
P := G.jointDeletion.
```

1. Apply the source-clean theorem in
   `JointDeletion/ExactFiveSplit.lean`

   ```text
   exists_two_exactFourMutualOmissionJointDeletions
   ```

   using the robust surface, `C.rho`, `6 ≤ physicalClass.card`, `G.u`, `G.v`,
   and `P.blockers_ne`. Obtain `J₀,J₁` with
   `J₀.deleted ≠ J₁.deleted`.

2. Choose one of `J₀,J₁` whose deletion is different from `P.deleted`.
   This is elementary: both cannot equal `P.deleted`, because then their
   deletions would be equal.

3. Apply the source-clean theorem

   ```text
   Problem97.ATailFrontierLiveClosure.
     exactFour_twoDeletion_crossOmission
   ```

   to `P`, the chosen packet, and the deleted-point inequality. This gives one
   of the two directed omissions stored in `cross_omission`.

4. Derive `deleted_blockers_ne`.

   Suppose the actual blockers of the two deleted points were equal. Then

   ```text
   Problem97.ATailSurvivalCover.
     selectedSupports_eq_of_actualBlockers_eq
   ```

   identifies their selected supports. Each deleted source belongs to its own
   selected support by `CriticalFourShell.q_mem_support`. Transporting that
   membership through the support equality contradicts whichever directed
   omission was returned in step 3.

5. Package the record.

This theorem is substantive rather than a conditional terminal wrapper:

- it constructs a new deletion packet;
- proves the deletion is genuinely different;
- extracts a new directed row omission;
- proves a new blocker inequality;
- preserves the original full source-rich residual `G`.

A direct search found no already named theorem packaging all four pieces as one
residual.

## 5. Relation to the source-aligned saturation theorem

The two card-six theorems serve different purposes.

### General two-deletion cross theorem

Advantages:

- unconditional in the card-six branch;
- no `u = source` assumption;
- no `v`-outside-interior assumption;
- directly enters the two-deletion/cross-omission machinery.

Limitation:

- the new deletion is not selected for a particularly useful cap or source
  position beyond what the joint-deletion record itself retains.

### Source-aligned prescribed-peer theorem

Advantages:

- the deleted point lies in the strict second-cap interior;
- its omissions and source-blocker inequality are explicit;
- the saturation alternative retains an exact `v`-row physical pair.

Limitation:

- it has the honest saturation branch;
- the saturation branch has no current terminal.

For immediate formalization, the general cross-residual theorem is the
highest-leverage clean structural result. The existing saturation theorem should
remain available for the geometric continuation.

## 6. The first missing fact after the proposed theorem

The proposed theorem does not yield `False`.

The obvious checked terminal

```text
false_of_exactFour_twoDeletion_blockerTwoCycle
```

is not the landing point. It needs reciprocal positive cross-memberships of the
two deleted points in one another's rows. The new theorem proves that at least
one such membership is false.

The source-clean splitter

```text
exactFour_fourSurvivingCenters_survivalSquare_split
```

can be reached only after its additional common-deletion and blocker-separation
packet is assembled. Even then it returns equality or survival-square
alternatives. The existing contradiction declarations

```text
false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence

false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
```

are still open and cannot be used in this consult.

The first genuinely missing mathematical input is therefore a
**branch-native geometric consumer of the one-way cross-deletion residual**.
Current square data record only isolated `HasNEquidistantPointsAt 4` survival
facts. They do not retain the selected support identity, boundary order, or
radius comparison needed by the existing clean geometric terminals.

A closure theorem would need at least one of:

- an additional cross-row incidence producing a checked tetrahedron or
  Kalmanson pattern;
- a third carrier point on the relevant perpendicular bisector;
- a cap/order theorem locating the two deleted blockers and endpoints;
- a comparison between the blocker-row radius and the physical radius,
  sufficient for a clean two-sided large-radius fork exclusion.

No one of these facts follows from `P`, `X`, or the new directed omission alone.

## 7. First missing fact in the saturation branch

For

```text
R : B1CardSixVRowSaturationResidual C G
```

the exact `v`-row class trace is:

```text
{G.v.1, R.mate.1}.
```

The available cyclic-order algebra gives the separated/alternating relation for
that pair relative to the physical apex and the `v`-row blocker.

The clean contradiction would need the opposite relation:

```text
B1SliceSameBoundaryArc
  boundary
  physicalApex
  vRowBlocker
  {G.v.1, R.mate.1}.
```

Equivalently, it needs the two endpoints on the same side of the
apex/blocker cut. The current upstream facts do not provide this. `G.v` is only
known to lie in an adjacent cap while `mate` lies in the strict opposite cap
interior; neither fact determines the cut made by the actual blocker.

This is the exact first missing geometric premise in the saturation branch.
It should not be added as an assumption to a wrapper. A genuine source theorem
would need to derive it, or derive a different contradiction from the exact
separation packet.

## 8. Card-five status

The target also has a physical-class-cardinality-five branch.

The source-clean theorem

```text
exactFourMutualOmissionJointDeletion_exactFive_strongSplit
```

returns:

```text
a second distinct same-pair joint deletion
or
the exact rigid 2+2 physical-class partition.
```

The second-deletion arm can enter the proposed cross-residual proof in the same
way as card six.

The rigid arm has now been source-cleanly retained in the current worktree by:

```text
B1ExactFiveSourceThirdRowIngress
B1ExactFiveSourceBlockerOutcome
```

These preserve the source-equals-`u` and genuine-third-row cases and the
inside/outside source-blocker placement. They still have no source-clean
terminal. The repeated first missing facts are:

- same-boundary-arc/order data;
- a second-radius relation;
- a named positive cross-row incidence pattern;
- or a source-to-canonical-pair alignment theorem.

Thus Option 2 eliminates the second-packet gap where the distinct-deletion arm
exists, but it cannot close the exact-five rigid branch.

## 9. Realistic closure assessment

### What the recommended theorem achieves

It should completely remove the following uncertainty in the card-six branch:

```text
“Perhaps only one same-pair joint deletion exists.”
```

It replaces that uncertainty with a sharply typed residual containing:

- two same-pair joint-deletion packets;
- distinct deleted points;
- a directed cross-deletion omission;
- distinct deleted-source actual blockers;
- the full original source-rich B1 data.

It also handles the distinct-deletion side of the exact-five split.

### What it does not achieve

It does not prove the B1 theorem. The remaining hard objects are:

1. the one-way cross-deletion/survival-square residual;
2. the exact card-six `v`-row saturation residual when using the
   source-aligned selection;
3. the exact-five rigid 2+2 residual.

A full B1 closure requires one new geometric incidence/order theorem for at
least the first residual and a separate treatment of the exact-five rigid arm,
unless one stronger source theorem simultaneously supplies both.

## Final recommendation

Choose **Option 2**, strengthened as follows:

```text
second same-pair joint deletion
+ deleted-point inequality
+ one-way cross-deletion omission
+ deleted-blocker inequality.
```

Formalize it as the proposed
`B1CardSixTwoDeletionCrossResidual` and
`nonempty_b1CardSixTwoDeletionCrossResidual`.

Do not invest next in a neutral one-packet terminal: the current packet is
missing precisely the geometry such a terminal would need. Do not attempt to
reconstruct a same-boundary-arc theorem from the arbitrary escape witness:
current source selection does not retain the required role relation and often
produces the alternating order instead.

The recommended theorem is realistically formalizable now from clean,
already-checked components. It is high leverage because it gives the strongest
unconditional card-six ingress into the exact two-deletion machinery. Its
claim boundary must remain explicit: **it produces a substantially sharper
residual; it does not by itself close B1.**
