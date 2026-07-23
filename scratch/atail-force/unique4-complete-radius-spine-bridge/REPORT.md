# Unique-four complete-radius spine bridge audit

Date: 2026-07-22

Scope: the current `OriginalUniqueFourResidual F` and
`ExactTwoStrictHitDistribution R` source interfaces, the late fixed critical
system, and the complete-radius three-row refinement.  This lane changes no
production Lean and claims no source `sorry` closure.

## Result

The three-row equality refinement is **PROVEN**, but its occurrence is **not
source-forced by the currently checked declarations**.

The useful universal source extraction is kernel-checked in
[`UniqueFourCompleteRadiusSpineBridge.lean`](UniqueFourCompleteRadiusSpineBridge.lean):

```lean
exists_completeRadiusSpineIngress
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (CompleteRadiusSpineIngress R Q)
```

`CompleteRadiusSpineIngress` contains:

1. the two actual fixed-system rows already supplied by
   `FixedImageTwoRowIngress`;
2. their distinct blocker-image centers;
3. a third carrier center outside the entire late blocker image;
4. a global-K4 selected row at that third center; and
5. the proof that the third center differs from both fixed centers and the
   first apex.

At either fixed center, every selected four-class has exactly the support of
the corresponding critical shell:

```lean
anyRowAt_center₁_support_eq_row₁
anyRowAt_center₂_support_eq_row₂
```

This is the source-level complete-radius lock.  The third completion center is
deliberately outside the blocker image, so no analogous lock is claimed there.

If the completion row and first fixed row have the five positive incidences
of the observed equality triangle, then

```lean
completionCenter_mem_row₂_of_forwardTriangle
```

forces the missing reverse membership in the second fixed row.  This theorem
reuses, rather than duplicates,
`mem_blockerImageSelectedRow_of_twoStep_mutualTriangle`.

Every declaration in the new Lean file is warning-clean and has axiom closure
exactly:

```text
propext, Classical.choice, Quot.sound
```

## Why this is not yet a universal ingress-to-False theorem

The current source extraction supplies **no cross-row membership** among the
three rows.  In particular, neither `OriginalUniqueFourResidual` nor
`ExactTwoStrictHitDistribution` supplies any of:

```text
center₁, center₂ ∈ completionRow;
completionCenter, center₂ ∈ row₁;
center₁ ∈ row₂.
```

Even when those five positive incidences occur, complete-radius exactness
proves the sixth positive incidence.  It gives `False` only against a finite
projection or named row packet that also asserts the corresponding omission.
An actual source row cannot simultaneously carry that omission.

Thus the production theorem

```lean
Problem97.false_of_mutualClassPair_sharedMember_thirdClassExcludes
```

is an exact negative consumer for a bad selected-row projection, but it does
not manufacture the occurrence or the omission from `R` and `Q`.

## Current finite regression

The earlier profile-4 and profile-5 terminal fixtures each contained one
three-center omission certificate and were correctly rejected by the
complete-radius equality chain.  That did not establish universal occurrence.

The clean `a61b34a6` profile-4 run supplied a direct regression at round 4.
The compact pinned payload
[`profile4_round4_support_lock_regression.json`](profile4_round4_support_lock_regression.json)
has all of the following exact finite properties:

- eleven selected four-rows;
- a fixed-point-free total blocker map;
- every critical source lies in its critical support;
- for every source, its critical support is exactly the selected row at its
  blocker center;
- the first-apex blocker fiber and row are exactly the designated four-class;
- the exact-two strict-hit overlay is present; and
- there is **no** complete-radius triangle omission certificate.

The same model is separately eliminated by the checked curvature layer: its
pinned curvature artifact records 326 replayed four-arc terminal witnesses
(318 strict-open-window and 8 cyclic full-cover witnesses).  Therefore this
is not a survivor of the union of the two consumers.  It is nevertheless an
exact counterexample to the claim that the complete-radius triangle omission
itself occurs in every current finite projection.

Run the independent replay with:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-complete-radius-spine-bridge/audit_spine_bridge.py \
  --check
```

It prints:

```text
PASS: support locks hold and no triangle omission is forced
```

This is **EXACT FINITE REPLAY OF A PINNED N=11 PROJECTION**, not Euclidean
realizability and not a Lean countermodel to the full source structures.

## Theorem-bank preflight

The mandatory registries and indexed Lean corpus were searched before adding
the source packet.

| Candidate | Exact applicability | Outcome |
|---|---|---|
| `false_of_mutualClassPair_sharedMember_thirdClassExcludes` | Consumes the five positive incidences and one incompatible omission | Reused as the existing negative endpoint; it is not an occurrence producer. |
| `mem_blockerImageSelectedRow_of_twoStep_mutualTriangle` | Uses a fixed critical source at the last center and the same five positive incidences | Reused for the sixth positive membership. |
| `CriticalShellSystem.selectedFourClass_support_eq_shell` | Applies at each fixed blocker-image center | Used to prove the two arbitrary-row support locks. |
| `blocker_centers_eq_iff_mutual_cross_membership_of_five_le` and siblings | Require a size-at-least-five first-apex class or deletion-survival hypotheses absent on the exact-four unique arm | Not applicable. |
| sibling/general-n U5 and legacy incidence banks | Supply local contradiction consumers after named incidences | No producer for this three-row occurrence from `R/Q`; no import added. |

The semantic search result was headed by the same `MutualShellPairSharedMember`
terminals.  No second theorem was found that derives the missing cross-row
memberships from the exact-four parent fields.

## First missing coverage statement

The complete-radius rule should be installed as a sound refinement in the
finite coverage loop.  The next useful coverage statement is not “every
source packet contains the bad triangle.”  It is:

> Every finite selected-row projection satisfying the exact-four source
> encoding either supplies a checked strict-window/full-cover curvature
> terminal, or violates one of the complete-radius support locks at a
> blocker-image center.

At the direct Lean source level, the second alternative is impossible by
`selectedFourClass_support_eq_shell`; therefore a proof-grade finite coverage
theorem would return the curvature terminal.  Until such coverage is proved,
the remaining geometric occurrence target is still a source construction of
`ThreeRowMiddleArcPlacement` (or the weaker two-completion-row packet on the
robust global-deletion arms), not another conditional equality consumer.

The CEGAR outer now installs both the cross-center radius transport and the
direct blocker-image membership closure, and its independent semantic verifier
replays both rules.  The driver hash-binds this Lean producer.  Fresh corrected
profile-four/profile-five runs were launched from empty output directories;
until they terminate, no new coverage claim is made.

## Validation

The Lean module was elaborated from the Lake root with fresh scratch
dependencies on `LEAN_PATH` and `-DwarningAsError=true`.  The replay script
passes under the repository's offline `uv` environment.  A forbidden-token
scan finds no `sorry`, `admit`, declared `axiom`, `unsafe`, or
`native_decide` in this lane.

## Epistemic boundary

- **PROVEN:** the universal three-center source ingress, pairwise center
  distinctions, fixed-center complete-support locks, and conditional sixth
  membership.
- **EXACT FINITE REPLAY:** the pinned round-4 projection satisfies all replayed
  support-lock facts and has zero triangle-omission certificates.
- **EMPIRICALLY VERIFIED FROM THE PINNED CHECKED ARTIFACT:** that projection
  has 326 separately replayed curvature terminal witnesses.
- **CONJECTURED / OPEN:** arbitrary-cardinality coverage by curvature terminal
  or complete-radius refinement.
- **NOT CLAIMED:** a Euclidean counterexample, closure of the exact-four arm,
  or closure of either live source `sorry`.
