# Family B — deep-thinker round 1 response (2026-07-27)

Provenance: first response of the deep-thinker harness run on
`2026-07-27-mutual-omission-four-center-deletion.md` (leaves B1–B3).
Reproduced verbatim below the rule. Audit status (rigid221-collapse
session, same day): every repository citation verified real —
`OriginalUniqueResidualDispatch.lean` (quoted phrase at :152),
`scratch/full-local-circle-terminal/REPORT.md` (8-point rational model;
exact intersection `{p,q}` saturation at :133),
`scratch/collision-equality-arms/REPORT.md` (its
`CollisionEqualityArms.lean` is sorry-free; note its theorems formalize the
center-exclusion mechanism for the F1 equality arms, not B2's three arms),
`scratch/minimality-incidence-audit/REPORT.md`. The circularity claim about
`false_of_exactFourPostCardElevenRobustSurface` is correct: its
interior-deletion branch feeds the coordinator calling B2 (:1408–:1424) and
B3 (:1432–:1456) and B1 (:1740), and its two-radius branch is itself a
frontier sorry. Statement fidelity checked against
`FrontierLiveClosure.lean`: B1 (:693), B2 (:1165, three collision arms
verbatim), B3 (:1239, four-arm survival square verbatim); the `b ≠ a₂`
claim is packet field `actual_blocker_ne_center₂`
(`CommonDeletionTwoCenter.lean:39`); the mutual-omission disjunction is
`exactFour_jointDeleted_mutualOmission_with_one_original` (:1047), which is
bidirectionally stronger than quoted. NOT verified (CONJECTURE until
kernel-checked): the B2 canonical-row forcing `B_{u,z₁} = Row(u)` under
`z₁ = β(u)`; the B3-rem removability equivalence (both directions); the B1
bisector-saturation step (needs the ≤2-carrier-points-on-a-line bound from
Γ). The three sandbox `.lean` reductions cited at the end are harness-side
files not present in this repository and are unverifiable.

The three boxed gap statements — (B1-gap) a third carrier bisector point,
(B2-gap) a global consequence of a source–center coincidence, (B3-gap)
deletion survival at every center outside the four named — are the round-2
candidates for this family.

---

## Status

I did **not** obtain a complete Branch-A proof or Branch-B certificate for any of B1–B3. Claiming a resolution would require either using one of the target `sorry`s circularly or adding a hypothesis not present in the prompt. The attached specification correctly requires substantially more than the local circle and row-incidence contradictions currently available.

I inspected the current `FrontierLiveClosure.lean` and the surrounding production and scratch files. The upstream exact-four residual dispatcher itself describes proving `False` for its residual outputs as "precisely the remaining mathematical work."

A later theorem named

```lean
false_of_exactFourPostCardElevenRobustSurface
```

has the tempting common-parent conclusion `False`, but it is not an independent solution. Its five-point branch eventually calls the two-distinct-joint-deletion coordinator, whose blocker-collision and four-center branches call B1, B2, and B3. Its two-radius branch also ends in another `sorry`. Therefore replacing any target proof with an invocation of this later theorem would be circular, and its axiom closure would still contain the unresolved leaves.

## Leaf B1 — exact normal form reached

Let

$$z_i=z(J_i),\qquad b=\beta(z_1)=\beta(z_2),\qquad K=\operatorname{Row}(z_1)=\operatorname{Row}(z_2).$$

The stated hypotheses rigorously imply:

$$K\cap C=\{z_1,z_2\}.$$

Indeed, both points belong to the intersection, they are distinct, and the intersection has cardinality two.

Moreover:

1. $b,a_2\in A$.
2. $b\neq a_2$, from the joint-deletion packet's actual-blocker separation.
3. Both are equidistant from $z_1,z_2$:
   $$d(b,z_1)=d(b,z_2),\qquad d(a_2,z_1)=d(a_2,z_2).$$
4. Consequently the perpendicular-bisector bound is saturated:
   $$\{c\in A:d(c,z_1)=d(c,z_2)\}=\{b,a_2\}.$$

Thus B1 would be closed immediately by producing any third carrier point $c$ satisfying

$$c\neq b,\qquad c\neq a_2,\qquad d(c,z_1)=d(c,z_2).\tag{B1-gap}$$

The common prefix does not currently produce such a point. In particular, none of $\beta(u),\beta(v),a_1$ is stated or presently proved to bisect $z_1z_2$.

This is not merely a failure of one proof attempt. The repository contains an exact rational strictly convex model of the sharp local geometry: two full four-point circles with distinct carrier centers and intersection exactly the same two carrier points. It saturates both the two-circle bound and the perpendicular-bisector bound. Hence the local circle geometry used above is consistent; a B1 proof must use additional global shell, deletion, MEC/cap, minimality, or no-$(m,4,4)$ structure.

**B1 status:** not resolved. The exact remaining bridge is a proof of `(B1-gap)`—or a different genuinely global contradiction—from the full packet data.

## Leaf B2 — all collision arms normalized

The canonical-support argument gives the following exact consequences.

### Case $z_1=\beta(u)$

The blocker-centered deleted row in `first.uPacket` is forced to be the canonical row:

$$B_{u,z_1}=\operatorname{Row}(u).$$

But $z_1$ is the center of this circle, so

$$z_1\notin\operatorname{Row}(u).$$

Thus this collision does **not** provide a positive incidence.

The proved "mutual omission with one original" lemma gives one of:

$$u\notin\operatorname{Row}(z_1)\quad\text{or}\quad v\notin\operatorname{Row}(z_1).$$

Together with the joint packet's omissions, this yields a mutually omitted source pair—either $(z_1,u)$ or $(z_1,v)$—and therefore bidirectional single-deletion survival at their two blockers. That is a valid strengthening, but it is not a contradiction.

### Case $z_1=\beta(v)$

The same argument gives

$$B_{v,z_1}=\operatorname{Row}(v),\qquad z_1\notin\operatorname{Row}(v),$$

followed by the same two-way omission/survival split with one of $u,v$.

### Case $z_1=\beta(z_2)$

The cross packet's blocker-centered row is

$$B_{\mathrm{cross}}=\operatorname{Row}(z_2),$$

but again the collided point is the center, so

$$z_1\notin\operatorname{Row}(z_2).$$

This is the opposite of the positive cross-membership needed by the proved blocker-two-cycle contradiction.

The repository's equality-arm audit independently formalizes this issue: every relevant point–center equality identifies the proposed "cross-hit" with the center of the corresponding shell, and the center is excluded from that shell. Those scratch theorems were checked without `sorry`.

**B2 status:** not resolved. The exact missing step is a global consequence of one of these source–center coincidences—such as removability, a third carrier bisector, an alternative $(m,4,4)$ packet, or a positive row incidence not contradicted by center exclusion. None follows from the existing local packet fields.

## Leaf B3 — exact removability criterion

The three common-deletion packets already show that deleting $z_1$ preserves K4 at the four named centers

$$a_2,\quad \beta(u),\quad \beta(v),\quad\beta(z_2).$$

There is an exact formalizable equivalence:

$$z_1\text{ is removable}\quad\Longleftrightarrow\quad \forall c\in A\setminus\{z_1\},\ c\notin\{a_2,\beta(u),\beta(v),\beta(z_2)\}\Longrightarrow E_4(A\setminus z_1,c).\tag{B3-rem}$$

The forward direction is immediate. For the reverse direction, the four excluded centers are handled respectively by `first.uPacket`, `first.vPacket`, and the cross packet; the displayed complement condition handles every remaining center. Minimality then contradicts removability.

The B3 survival square does not establish the right-hand side of `(B3-rem)`. For a chosen named center $c$, its second conjunct is merely

$$E_4(A\setminus c,\beta(z_1))\iff c\notin\operatorname{Row}(z_1).$$

Thus it records one omission from the four-point row of $z_1$. It supplies no survival information after deleting $z_1$ at arbitrary centers outside the four named ones.

**B3 status:** not resolved. The precise missing statement is

$$\forall c\in A\setminus\{z_1\},\quad c\notin\{a_2,\beta(u),\beta(v),\beta(z_2)\}\Longrightarrow E_4(A\setminus z_1,c).\tag{B3-gap}$$

Once `(B3-gap)` is proved, B3 closes immediately by minimality.

## Why the remaining gap is global

The repository's independent minimality/incidence audit reaches the same structural boundary: minimal deletion cores, exact rows, cap ordering, and third-row connectors are available, but they do not force the required **positive occurrence**—a row point in a rich apex slice, a named positive cross-row membership, or complete survival at all remaining centers.

That rules out three superficially attractive but invalid closures:

* B1 cannot be closed from the two-circle and bisector bounds alone.
* B2 collision equalities cannot be turned into positive row incidences; they imply center exclusion.
* B3's four-center square cannot be promoted to removability without proving survival at every other carrier center.

No Branch-B certificate was obtained. The exact local models found in the repository do not satisfy the global K4 property at every point, the full critical shell system, the MEC packet, minimality, and no-$(m,4,4)$. They are therefore diagnostics against local lemmas, not realizability certificates in the sense required by the prompt.

## Inspected source and strongest scratch reductions

* Current inspected `FrontierLiveClosure.lean`
* B2 blocker-coincidence reduction (`scratch_BlockerCoincidence.lean`, harness-side)
* B3 removability equivalence (`scratch_SurvivalSquare.lean`, harness-side)
* Cross-blocker equality audit (`scratch_CrossBlockerEqualityAudit.lean`, harness-side)

Accordingly, the honest family status is: **B1 not resolved; B2 not resolved; B3 not resolved.**

Cited repository artifacts (all verified present):
`lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean`,
`scratch/full-local-circle-terminal/REPORT.md`,
`scratch/collision-equality-arms/REPORT.md`,
`scratch/minimality-incidence-audit/REPORT.md`.
