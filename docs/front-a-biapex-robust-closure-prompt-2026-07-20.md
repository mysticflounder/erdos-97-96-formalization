Current task statement

Work in the Euclidean plane with the usual distance. A finite set A of
points is in convex position if no point of A lies in the convex hull of
the other points of A. Say A has the four-equidistant property if for
every point p of A there is a radius r > 0 such that the circle of radius
r centered at p passes through at least 4 points of A. A point x of A is
called removable if A minus {x} still has the four-equidistant property.
Every finite nonempty A is contained in a unique smallest closed disk;
call its boundary its minimum enclosing circle.

The ambient configuration has the following already-established data:

(H1) A is in convex position, has the four-equidistant property, has
minimum cardinality among nonempty convex-position sets with that property,
and |A| > 9. Thus no point is removable.

(H2) There is a nonobtuse Moser support triangle on the minimum enclosing
circle, with its three closed boundary caps. One cap S is the surplus cap;
the other two triangle vertices are its physical opposite apices O1 and O2.
The support triangle and cap partition have all of the usual closed-cap
semantics: the two endpoints belong to the cap, every other carrier point
belongs to exactly one cap, and all three caps contain at least four points.
No alternative packet of this kind—no nonobtuse MEC support triangle with its
associated cap partition on this same A—has cap counts (m,4,4) with m > 4.
In particular, because S itself has more than four points, at least one of its
two opposite caps also has more than four points.

(H3) There is a total critical-shell choice H. For every source x in A it
chooses a center b(x) in A and a positive radius such that the corresponding
circle contains exactly four points of A including x; after x is deleted,
the chosen center has no positive radius containing at least four remaining
carrier points. The chosen shell is a complete exact-radius statement: its
four-point support is the whole ambient radius class, not an arbitrary
selected four-subset.

(H4) There are distinct points q,w outside S, on one O1-radius class, such
that deleting both q and w leaves at least four equidistant points at O1 and
also at O2. The O1-radius class contains at least four carrier points. In
addition, the parent retains a concrete packet for the single deletion of q:
a chosen four-point equidistant q-deleted row at O1 and another at O2, whose
two supports overlap in at most two points.

(H5) Both physical opposite apices are fully deletion-robust: deleting any
one point of A still leaves a witness through at least four carrier points at
O1, and also at O2.

The task is to resolve this residual configuration completely:

No configuration satisfying (H1)-(H5) exists.

This is exactly the live Front-A robust branch in the Lean proof:

```lean
Problem97.ATailFrontierLiveClosure.false_of_frontierBiApexRobustResidual
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    False
```

A separate protected unique-radius branch is also open in the full proof, but
it is outside this task. Solving the theorem displayed above closes one actual
source `sorry`; it does not by itself close that separate branch.

The two deletion-robustness hypotheses are not optional
strengthenings. They are the branch assumptions. A proof that treats only a
particular cap-size regime, assumes genericity, chooses arbitrary selected
rows, or silently replaces complete radius classes by selected four-subsets
does not solve this task.

The following facts are already proven and may be assumed without proof:

- Every point of A has a chosen exact critical four-shell as in (H3), and
  every selected support used below is a subset of its full exact-radius
  class.

- The two robust apices O1 and O2 cannot be centers in the image of the
  critical-shell choice H. Since the choice is a self-map of the finite
  carrier, each omitted robust apex forces a repeated blocker fiber. Hence
  there are either two nontrivial blocker fibers or a fiber with at least
  three sources. A useful closing fiber must be chosen after examining the
  full configuration, not fixed in advance by this pigeonhole argument.

- For a repeated blocker fiber with distinct sources C,K and common blocker
  B0, one has dist(B0,C) = dist(B0,K). The live terminal consumers already
  refute either of the following complete outputs.

  (a) Ordered cross-row output: there is a source J with critical center X,
  K lies on J's exact chosen shell, dist(O1,J) = dist(O1,C), and the six
  points O1,B0,X,J,C,K occur in that cyclic order (up to the orientation
  convention). Strict convex-quadrilateral inequalities then contradict the
  three shell equalities.

  (b) Same-cap collision output: B0 and a distinct second center X lie in a
  common cap, C and K lie outside that cap, and X is either O1 itself — in
  which case the equality dist(O1,C) = dist(O1,K) must also be supplied,
  since it does not follow from the fiber alone — or is the chosen critical
  center of a source whose exact shell contains both C and K. Cap-local
  outside-pair uniqueness then gives a contradiction.

  In Lean these are the two constructors of
  `CriticalFiberClosingCore R`; `false_of_criticalFiberClosingCore` is
  already machine-checked. Producing either complete constructor finishes
  the branch immediately.

- At the blocker b(q) selected for q, there is an unconditional exact split:
  either deleting w preserves a four-point witness at b(q), or w belongs to
  q's exact chosen critical shell. In the first arm, O1-robustness packages a
  source-faithful common-deletion packet at O1 and b(q). In the second arm,
  O1 and b(q) are two distinct carrier centers equidistant from q and w, and
  b(q) lies outside the surplus cap. Neither arm is contradictory by itself.

- A source can be chosen from the physical-second-apex q-deleted row which is
  outside both q's exact chosen critical support and the off-surplus
  O1-radius marginal containing q,w. Its chosen blocker is distinct from O1
  and from b(q): it cannot be O1 by O1-robustness, and it cannot be b(q)
  because b(q) survives deletion of this escape source. This is a role
  constraint only; it does not itself give a cross membership.

- On the directed cross-membership arm w in the exact q-shell, a chosen
  blocker distinct from both O1 and b(q) cannot have an exact shell containing
  both q and w. Thus, on that arm, a proposal whose only new conclusion is
  “find a third distinct blocker row through q and w” is impossible, not a
  route to closure. This exclusion is not available before the
  cross-membership arm has been established.

- On the directed cross-membership arm, and away from the protected
  exact-card-four alternative, the total critical map yields a source-indexed
  two-deletion survival cover: every source outside the q-blocker fiber
  preserves deletion of q or of w at its actual chosen blocker. That fiber
  has at most four sources, so at least six
  carrier sources lie outside it under the live cardinality bound. This
  kernel-checked scratch cover is a constraint, not the target: its existing
  card-≥14 consumer manufactures another physical-second-apex
  common-deletion packet and returns to the same robust/critical split, so it
  is not the generic closer.

- The original displayed surplus-cap packet is not an (m,4,4) packet.
  Therefore the no-(m,4,4) hypothesis cannot be invoked directly. It may be
  used only after constructing a different valid Moser support triangle on
  the same A with verified exact cap counts (m,4,4), m > 4.

Consequently, any of the following finishes the task:

1. Construct a complete ordered cross-row output as in (a) for a favorable
   repeated blocker fiber.
2. Construct a complete same-cap collision output as in (b) for a favorable
   repeated blocker fiber.
3. Construct a different valid (m,4,4) Moser support triangle on A, thereby
   contradicting the no-(m,4,4) hypothesis.
4. Derive another direct contradiction that genuinely uses the full robust
   parent data.

The current production plan designates the following **CONJECTURED**
terminal-facing coverage theorem as the preferred target; it is not yet a
Lean declaration:

```lean
nonempty_criticalFiberClosingCore_of_biApexRobust
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    Nonempty (CriticalFiberClosingCore R)
```

The intended proof would choose the closing fiber after inspecting the full
parent and discharge any retriangulated (m,4,4) branch internally to False
before returning; its caller would immediately apply
`false_of_criticalFiberClosingCore`.

Assume for purposes of this task that a complete proof exists. A complete
solution must prove exactly the stated residual nonexistence for every
cardinality |A| > 9 and every cap pattern compatible with the hypotheses.
It may not assume a bound such as |A| = 11 or |A| >= 14 unless it separately
covers all omitted cardinalities. It may not assume distinct radii, distinct
critical centers, general position beyond convex position, or a prescribed
critical-shell selection different from H.

Partial progress does not count unless it supplies one of the four terminal
outcomes above with complete coverage. In particular, a new repeated blocker,
an additional common-deletion packet, a bare equality list, a local cap
placement fact, a selected-row count, or a conditional theorem whose premise
is the missing cross membership is not a solution.

The following failure modes are known; treat them as mandatory adversarial
tests:

- Pure selected-row/minimality reasoning is insufficient. Corrected
  full-fiber structural models satisfy the strongest known connectivity and
  blocker-multiplicity consequences while avoiding both terminal outputs.
  Strong connectivity of a selected witness digraph is valid, but it is not
  a closing consumer without a specifically Euclidean/MEC source fact.

- Pure convex-order, ordinal-distance, linear Kalmanson, triangle-inequality,
  or Farkas reasoning is insufficient. A source-faithful card-11 structural
  SAT shadow survives after every current such consumer is imposed. This is
  not a Euclidean counterexample, but it is a regression test: a proposed
  proof that only uses those abstract constraints cannot be valid.

- Literal 555/654, arbitrary-row, and fixed-initial-critical-system CEGAR
  searches are not evidence of this theorem. SAT can refute an overstrong
  proposed intermediate claim. UNSAT is relevant only after a coverage proof
  maps every source-level parent configuration to the encoded manifest.

- The exact-five, exact-six, and exact-seven cap-first terminal families are
  supporting results, not the live theorem. The generic robust residual does
  not presently provide their two large-cap lower bounds. Do not claim that
  proving a cap-first leaf closes this branch without an explicit source-valid
  ingress theorem.

- On the directed cross-membership arm, a row through both retained sources
  q,w at a blocker distinct from O1 and b(q) is excluded by the checked
  third-center classifier. Do not apply that classifier outside this arm or
  rediscover its forbidden conclusion as a desired lemma.

- The no-(m,4,4) condition is not a contradiction at the displayed surplus
  triangle. A retriangulation route must provide the new triangle, its MEC
  membership, nonobtuseness, closed-cap partition, and exact cap counts.

Use your multiagent harness aggressively and dynamically. Do not use a fixed
assignment such as “N agents for strategy X.” Instead, manage the search with
the following heuristics:

- Begin with independent approaches that use genuinely missing information:
  nonlinear Euclidean rank/coordinates; minimum-enclosing-circle and cap
  placement; complete exact-radius fibers; source-indexed global minimality;
  and retriangulation/exchange of Moser support triangles. Do not let agents
  merely repackage the blocked linear abstraction.

- Keep a registry of approach families by mathematical mechanism. Separate
  a lemma proved from the stated hypotheses, a finite-model observation, a
  numerical experiment, and a conjectural bridge. Do not upgrade a solver
  result or a source-clean adapter to a proof of the residual.

- Make every candidate bridge state its exact input and terminal output.
  Require a hypothesis-by-hypothesis audit against (H1)-(H5), including
  whether it uses whole exact-radius fibers rather than arbitrary four-point
  selections and whether it applies uniformly to all carrier sizes.

- Use adversarial agents throughout. Reject hidden assumptions about cap
  membership, boundary cyclic order, center/radius distinctness, critical
  choice freedom, automatic occurrence of cross membership, or reuse of the
  already-excluded third-blocker packet. Require every proposed retriangulation
  to verify the full Moser/MEC and cap-count contract.

- When a route ends in a theorem-strength missing lemma, mark it blocked.
  Reopen it only if a new nonlinear Euclidean, full-fiber, MEC, or global
  minimality mechanism is identified. Do not continue a route merely because
  it yields elegant local reductions.

- Require concrete deliverables: a complete proof, a counterexample to a
  proposed bridge, an exact source-level lemma with a proof, a coordinate or
  polynomial model that falsifies a claimed abstraction, or a formally
  checkable coverage reduction. Reject status reports and vague optimism.

Do not return merely because the current favored approach stalls. Continue
opening materially different routes and use failures to sharpen the exact
missing bridge. However, do not report a partial reduction as closure.

Return only when a complete proof of the residual nonexistence has been found
and survives adversarial audit. If the search budget expires without that
proof, report the strongest rigorously established derivation, the precise
first missing statement, and whether it is PROVEN, EMPIRICALLY VERIFIED,
CONJECTURED, or HEURISTIC. Do not call the residual closed unless it produces
`False` from exactly (H1)-(H5).

Spend at least 8 hours on this before even thinking of returning or giving up.

Public search may be used only for ordinary mathematical background or
standard named theorems, not to search for a solution to this exact
configuration problem or to similar open Erdős problems. Do not search the
public web merely to determine whether the problem is open, and do not answer
that it is open.

---

## Changes in this copy (2026-07-20 faithfulness audit)

This is the audited project copy of
`~/scratch/front-a-biapex-robust-closure-prompt-2026-07-20.md`. The original
was audited against the Lean source (post-`74fb6ccc` wiring) and the
2026-07-20 direct-parent manifest
(`scratch/atail-force/direct-parent-retained-pair-manifest/REPORT.md`). The
source-backed hypotheses, already-proven bullets, and failure-mode claims
were checked against their cited declarations; the two-deletion cover is
kernel-checked scratch, while the named coverage theorem is explicitly
CONJECTURED. Four corrections were applied:

1. **Same-cap output (b), O1 arm.** The original omitted a required conjunct:
   `HasSourceFaithfulSecondCenter` (`ATail/CriticalFiberClosingCore.lean`)
   demands `dist(O1,C) = dist(O1,K)` when the second center is O1 itself.
   The prose now states the equality must be supplied.

2. **Two-deletion survival cover.** Added the kernel-checked scratch
   source-indexed cover (from the `AnchoredDoubleDeletionProducer` audit,
   recorded in commits `3a54fb85`/`6dc4e581`), valid only on the directed
   cross-membership arm and away from exact card four: outside the
   at-most-four-source q-blocker fiber, every source preserves deletion of q
   or of w at its actual blocker, with at least six such sources — plus the
   routing caveat that its card-≥14 consumer loops back to the physical
   robust/critical splitter and is not the generic closer.

3. **Designated coverage target.** Named the production plan's CONJECTURED
   packaging of outcomes 1-2, `nonempty_criticalFiberClosingCore_of_biApexRobust :
   Nonempty (CriticalFiberClosingCore R)`, so a solver targets the exact
   theorem shape the closure matrix designates. The displayed theorem is not
   yet a production Lean declaration; it specifies the exact output a solver
   or prover must establish.

4. **(H4) retained packet.** Added the concrete single-deletion packet
   carried by the parent residual (`CommonDeletionTwoCenterPacket` at O1 and
   O2 for deleting q): two chosen four-point q-deleted rows whose supports
   overlap in at most two points. The blocker-avoidance fields (b(q), b(w)
   avoiding the apices) were not added separately: they follow from the
   existing bullet that O1, O2 are omitted from the image of H. The
   `F.firstApexSplit`/`F.secondApexSplit` disjunctions were not listed
   separately: on this common-deletion branch the required double-deletion
   witnesses are stated in (H4); the remaining split data is derived
   auxiliary structure, not an additional prompt assumption.

Known context caveat, not a prompt error: `docs/live-blueprint.md` still
shows the pre-`74fb6ccc` kernel-mined tree (the liveData chain ending at
`DoubleApexOffSurplusSharedRadiusPair`). The blueprint predates the rewiring
of `u1_largeCap_routeB_tail_liveData_false` through
`ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`; against
current source, the two `FrontierLiveClosure` sorries are the live frontier
exactly as this prompt states.
