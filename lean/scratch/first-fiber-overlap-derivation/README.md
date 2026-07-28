# First-fiber overlap derivation

This scratch shard isolates the next honest mathematical bridge for
`false_of_capSource_freshOutsideFirstBlockerFiber`.

`FirstFiberOverlapDerivation.lean` checks:

1. the first collision shell is exactly
   `{P.source₁, P.source₂, Q.source, Q.otherOutsidePoint}`;
2. the cap source chosen outside both collision pairs is not itself in that
   shell, so its automatic self-hit contributes no overlap;
3. three hits by the cap-source row in that explicit four-point set close by
   the existing two-circle terminal; and
4. the literal sufficient packet for those three hits is
   `Q.source`, `Q.otherOutsidePoint`, and either one of the two original
   collision sources; and
5. alternatively, if the cap-source blocker lies in the first cap, hits on
   both named off-cap points close by ordered-cap uniqueness.

Thus the current hypotheses still need one of the following positive
producers:

```text
3 ≤ (capSourceRow ∩
  {P.source₁, P.source₂, Q.source, Q.otherOutsidePoint}).card
```

or

```text
capSourceBlocker ∈ firstCap
∧ Q.source ∈ capSourceRow
∧ Q.otherOutsidePoint ∈ capSourceRow.
```

The second interface makes precise an important caveat in the closure plan:
coupling the row to the two named off-cap points alone gives only a legal
two-point intersection.  It closes only after localizing the second center
into the same ordered cap.  For the three-overlap route, because the cap
source itself is not in the first collision row, both off-cap hits plus at
least one of `P.source₁` and `P.source₂` are sufficient.

Moreover, `hcapSource` already says that the cap-source row omits at least one
of `P.source₁` and `P.source₂`. Consequently the concrete three-overlap route
cannot use both original collision sources: its exact useful shape is the two
off-cap hits plus the one permitted original-pair hit. This isolates the next
positive producer as

```text
Q.source ∈ capSourceRow
∧ Q.otherOutsidePoint ∈ capSourceRow
∧ (P.source₁ ∈ capSourceRow ∨ P.source₂ ∈ capSourceRow).
```

The center-localization alternative cannot be obtained from the whole
`P`-pair or `Pρ`-pair either, because `hcapSource` explicitly omits at least
one endpoint of each pair. It therefore needs a genuinely new same-radius
two-hit slice before the ordered-cap two-outside-hit terminal applies.

No current field of `hcapSource`, `Q`, `T`, `LPρ/MPρ`, or `LP/MP` supplies
those positive memberships.  The retained cycles supply cross omissions and
common-deletion rows, while `hcapSource` supplies one self-hit and at least one
omission from each collision pair.

## Unconditional removable descent

There is nevertheless a stronger unconditional consequence in the opposite
direction.  The cap-source row and the first collision row are both exact
four-rows at distinct centers, so the existing two-circle theorem bounds their
intersection by two.  Therefore the cap-source row omits at least two distinct
points `y,z` of

```text
{P.source₁, P.source₂, Q.source, Q.otherOutsidePoint}.
```

For each omitted point, the critical-shell deletion equivalence gives

```text
K4 (D.A.erase y) capSourceCenter
K4 (D.A.erase z) capSourceCenter.
```

The tri-apex packet makes each of the three Moser apices fully
deletion-robust.  Consequently the same two deletions each preserve K4 at all
four centers:

```text
                    capSourceCenter  oppApex1  oppApex2  surplusApex
D.A.erase y               K4            K4        K4          K4
D.A.erase z               K4            K4        K4          K4
```

Keeping the already-wired localized common-deletion packet `LP` gives a
sharper asymmetric descent at `P.source₁`.  The checked finite incidence
bound forces the following disjunction:

```text
(P.source₁ ∈ capSourceRow
 ∧ P.source₂ ∉ capSourceRow
 ∧ (Q.source ∉ capSourceRow
    ∨ Q.otherOutsidePoint ∉ capSourceRow))
∨
(K4 (erase P.source₁) capSourceCenter
 ∧ K4 (erase P.source₁) oppApex1
 ∧ K4 (erase P.source₁) blocker(Pρ.source₁)
 ∧ K4 (erase P.source₁) oppApex2
 ∧ K4 (erase P.source₁) surplusApex).
```

The right arm uses no new hypothesis: omission of `P.source₁` preserves the
cap-source row, `LP` preserves the first apex and the second collision
blocker, and tri-apex robustness preserves the other two apices.  In the left
arm, `hcapSource` forces omission of `P.source₂`; the two-circle intersection
bound then forces at least one of the two named off-cap points to be omitted.

Applying the same argument to the `Pρ` anchor and then retaining `MPρ/MP`
leaves an even narrower exact residual. Unless one of
`P.source₁`, `P.source₂`, `Pρ.source₁`, `Pρ.source₂` is a deletion preserving
K4 at the cap-source blocker, first apex, opposite collision blocker, second
apex, and surplus apex, all of the following hold:

```text
P.source₁ ∈ capSourceRow        P.source₂ ∉ capSourceRow
Pρ.source₁ ∈ capSourceRow       Pρ.source₂ ∉ capSourceRow
Q.source ∉ capSourceRow ∨ Q.otherOutsidePoint ∉ capSourceRow
MPρ.collisionSource = P.source₁
MP.collisionSource = Pρ.source₁.
```

So the current fields do produce two positive collision-source hits, but they
belong to different first-apex radius classes (`radius ≠ ρ`) and therefore do
not by themselves form the needed three-hit same-radius slice.  The remaining
work is no longer an unspecified search for coupling: eliminate this
cycle-aligned hit/omit pattern, or eliminate the concrete five-center
single-deletion alternatives.

`FiniteOverlapKernel.lean` kernel-checks the finite omitted-pair lemma.
`FirstFiberOverlapDerivation.lean` contains the geometric specialization and
the generic two-deletion/four-center survival packet, plus the sharper
`firstFiber_firstSourceHit_or_fiveCenterDeletion`,
`firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion`, and
`firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` disjunctions
above.

This packet does **not** by itself close the live leaf.  The next honest
terminal is now precise: eliminate both arms of the sharper disjunction (most
likely through a five-center single-deletion terminal on the right and a
retained-cycle consequence on the left), or prove that one arm forces the
positive three-hit packet above. Existing survival-square results inspected in
`FrontierLiveClosure.lean` are tied to a different residual and retain their
own open terminal, so importing them here would only move the obligation.

## Five-center boundary

`FiveCenterBoundary.lean` trims every five-center deletion arm to five exact
`U5QDeletedK4Class` rows. It also exposes the deleted source's actual blocker
as a sixth, distinct unique-four center where deletion fails.

This rules out an accidental direct application of the bounded U5 audit: that
audit needs six surviving q-deleted rows (and bounded-support confinement).
Here the naturally supplied sixth center is precisely the blocked one.

The generic boundary theorem
`ATailFirstFiberOverlapDerivation.fiveSurvivorExactRowsBoundary` elaborates
cleanly and passes the axiom/source scan (only `propext`, `Classical.choice`,
and `Quot.sound`). It deliberately uses a local copy of the five-survivor
interface because the newly promoted production
`FirstFiberOverlapDescent.lean` currently fails its targeted build: it uses
`FrontierCommonDeletionParentResidual` and
`LocalizedCollisionMutualOmissionCycle` without importing their defining
modules.
