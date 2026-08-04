# Complete-resolution prompt: ATAIL exact-two localized-collision leaf

You are working in the Lean 4 repository
`erdos-97-96-formalization`. Resolve the current load-bearing theorem

```text
Problem97.ATailFrontierLiveClosure.
  false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
```

in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.

The current source, not historical plans or scratch experiments, is
authoritative. Do not weaken, strengthen, replace, or bypass the theorem
statement. Do not add axioms, assumptions, compatibility wrappers, conditional
closers, proposition-valued placeholders, or new `sorry`s.

## §1 Notation preamble

- Work in the Euclidean plane \(\mathbb R^2\), with Euclidean distance
  \(\operatorname{dist}\).
- \(A\) is always a finite set of points. For \(p\in\mathbb R^2\) and
  \(r\in\mathbb R\), write
  \[
  \operatorname{Class}(A,p,r)
    = \{x\in A:\operatorname{dist}(p,x)=r\}.
  \]
  This is Lean's `SelectedClass A p r`.
- `HasNEquidistantPointsAt 4 A p` means that some positive-radius class about
  \(p\) contains at least four points. `HasNEquidistantProperty 4 A` means
  this holds at every \(p\in A\).
- `ConvexIndep A` means that \(A\) is in strict convex position.
- A `CounterexampleData` object \(D\) carries:
  - a nonempty finite carrier \(D.A\subset\mathbb R^2\);
  - strict convexity of \(D.A\);
  - the per-vertex \(K_4\) property `D.K4`;
  - a surplus-cap packet on \(D.A\).
- `D.Minimal` means that no smaller nonempty strictly convex finite set has
  the per-vertex \(K_4\) property:
  \[
  \forall B,\quad
  B\ne\varnothing\land\operatorname{ConvexIndep}(B)\land K_4(B)
  \Longrightarrow |D.A|\le |B|.
  \]
- `S.IsM44` means that both non-surplus opposite closed caps have cardinality
  exactly four:
  \[
  |S.\texttt{oppCap1}|=4\quad\text{and}\quad
  |S.\texttt{oppCap2}|=4.
  \]
- `FullyDeletionRobustAt D p` means that deleting any carrier point still
  leaves a \(K_4\) witness centered at \(p\).
  `notRobustCenters D` is the subset of \(D.A\) consisting of centers where
  this property fails.
- A `SurplusCapPacket D.A` \(S\) consists of a genuine three-vertex,
  non-obtuse, circumscribed minimum-enclosing-circle Moser triangle and its
  exact three-cap partition. It designates one cap as the surplus cap. The
  functions
  `S.capByIndex i`, `S.capInteriorByIndex i`, and
  `S.oppositeVertexByIndex i` give the indexed closed cap, its strict interior
  after deleting the two boundary triangle vertices, and the opposite Moser
  apex. The indices `S.surplusIdx`, `S.oppIndex1`, and `S.oppIndex2` name the
  three roles.
- Do **not** silently identify the packet \(S\) in the target theorem with
  `D.packet`; they are objects of the same type, not definitionally the same
  object.
- A `CriticalShellSystem D.A` \(H\) chooses, for every source \(q\in D.A\):
  - a canonical blocker center \(c_q=\texttt{H.centerAt q}\);
  - a canonical critical shell \(K_q=\texttt{H.selectedAt q}\).

  The support of \(K_q\) is the **entire** positive-radius class about \(c_q\),
  not an arbitrary four-subset. It has exactly four points, contains \(q\),
  and \(c_q\in D.A\setminus\{q\}\). Deleting \(q\) destroys every \(K_4\)
  witness at \(c_q\).
- `IsUniqueFourCenter D.A p` means that \(p\in D.A\) has exactly one positive
  radius carrying at least four points, and that radius class has exactly four
  points. `uniqueFourClass D.A p` is that exact four-point class.
- A `CommonDeletionTwoCenterPacket D H q c₁ c₂` records that \(q,c_1,c_2\in
  D.A\), \(c_1\ne c_2\), and deletion of \(q\) preserves a \(K_4\) at both
  centers. It includes two exact \(q\)-deleted four-point rows with overlap at
  most two. These rows are witnesses in \(D.A\setminus\{q\}\); they are **not**
  automatically canonical rows `H.selectedAt z` for any source \(z\).
- `ApexRichClassStructure D.A p` means exactly one of:
  \[
  \begin{aligned}
  &\exists r>0,\quad 6\le|\operatorname{Class}(D.A,p,r)|,\\
  \text{or }\
  &\exists r_1,r_2>0,\quad r_1\ne r_2,\quad
    4\le|\operatorname{Class}(D.A,p,r_1)|,\quad
    4\le|\operatorname{Class}(D.A,p,r_2)|.
  \end{aligned}
  \]
- `OppositeCapRichClassInteriorPattern D.A S i` means exactly one of:
  \[
  \begin{aligned}
  &\exists r>0,\quad
    4\le|\operatorname{Class}(D.A,S.\operatorname{opp}(i),r)
      \cap S.\operatorname{intcap}(i)|,\\
  \text{or }\
  &\exists r_1,r_2>0,\quad r_1\ne r_2,\quad
    2\le|\operatorname{Class}(D.A,S.\operatorname{opp}(i),r_1)
      \cap S.\operatorname{intcap}(i)|,\\
  &\hspace{51mm}
    2\le|\operatorname{Class}(D.A,S.\operatorname{opp}(i),r_2)
      \cap S.\operatorname{intcap}(i)|.
  \end{aligned}
  \]
- Finset equality and cardinality are literal: in particular,
  `X = {a,b}` together with \(a\ne b\) means \(X\) has exactly two elements.
- “Canonical row” below always means the exact full shell selected by \(H\).
  “Deleted row” means a row stored in a common-deletion packet. Never conflate
  these notions.

The exact declarations and their authoritative source locations are:

| Object | Source |
|---|---|
| `CounterexampleData`, `D.Minimal` | `P97/U1TwoShortCapReduction.lean` |
| `SurplusCapPacket` and indexed caps | `P97/Cap/PartitionFromMEC.lean` |
| `CriticalFourShell`, `CriticalShellSystem` | `P97/U1CarrierInjection.lean` |
| `CommonDeletionTwoCenterPacket` | `P97/ATail/CommonDeletionTwoCenter.lean` |
| `CriticalPairFrontier` | `P97/ATail/CriticalPairFrontier.lean` |
| `FrontierCommonDeletionParentResidual` | `P97/ATail/OrientedPhysicalApexIngress.lean` |
| `RetainedInteriorBlockerCollision`, `LocalizedCollisionCommonDeletion` | `P97/ATail/RetainedStrictInteriorPairSelector.lean` |
| `LocalizedCollisionMutualOmissionCycle` | `P97/ATail/LocalizedCollisionMutualOmissionCycle.lean` |
| bi-apex and all-large residuals | `P97/ATail/PhysicalSecondApexCommonDeletion.lean`, `LargeOppositeCapsBiApexSurface.lean`, and `FrontierLiveClosure.lean` |

## §2 Problem statement

Resolve the following exact Lean implication completely:

```lean
theorem false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (C : LocalizedCollisionCommonDeletion P)
    (M : LocalizedCollisionMutualOmissionCycle P C)
    (hexactTwo :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.capInteriorByIndex S.oppIndex1) =
        {P.source₁, P.source₂})
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx)
    (hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2) :
    False
```

Here is the complete hypothesis surface that may be used.

1. `F : CriticalPairFrontier D S radius H` carries distinct physical sources
   \(q,w\in D.A\), their first-apex frontier-radius placement, deletion
   survival at the second apex, first- and second-apex structural splits, and
   an explicit double-deletion \(K_4\) at the second apex.
2. `R` carries `D.Minimal`, absence of an `IsM44` surplus packet on \(D.A\),
   \(9<|D.A|\), at least four points on the retained first-apex radius, a
   first-apex double-deletion \(K_4\), and a source-faithful common-deletion
   packet at the two opposite apices.
3. `B` makes both opposite apices fully deletion-robust.
4. `L` gives at least six points in each non-surplus closed cap.
5. `N` gives at least six points in the surplus closed cap as well.
6. `T` gives `ApexRichClassStructure` at all three Moser apices, the cover
   inequality
   \[
   |D.A|\le 4\,|\operatorname{notRobustCenters}(D)|,
   \]
   and says that no carrier center and positive radius contains all three
   Moser vertices in one selected class.
7. `hcriticalShellUniqueFourCover` says every canonical blocker differs from
   its source, is a unique-four center, and has unique four-class equal to its
   canonical shell. This is also derivable from \(H\), but it is supplied
   explicitly.
8. `hfirst`, `hsecond`, and `hsurplus` give the exact binary strict-cap rich
   pattern at all three indexed caps. These are also checked consequences of
   \(T\) and convexity.
9. `hlow` bounds every canonical-shell/rich-apex-radius/strict-cap
   intersection by two. The same upper bound is also available from the
   imported theorem
   `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`.
10. `P` supplies distinct \(a=P.\texttt{source₁}\) and
    \(b=P.\texttt{source₂}\), both in the retained first-apex radius class and
    the first strict cap, with equal canonical blocker \(c\).
    Checked consequences available before the target include:
    - the two complete canonical supports are equal;
    - each source lies in the other source's canonical shell;
    - \(c\) lies in the same strict cap;
    - the first canonical shell meets the whole corresponding closed cap in
      exactly \(\{a,b\}\).
11. `C` supplies a fresh point \(f\) in the same strict cap, distinct from
    \(a,b\), omitted from \(a\)'s canonical shell, together with a
    common-deletion packet for deleting \(f\) at the first apex and \(c\).
12. `M` chooses \(s\in\{a,b\}\), with canonical blocker \(c\), such that
    \(s\ne f\), \(f\notin K_s\), \(s\notin K_f\), and \(c\ne c_f\). It also
    supplies common-deletion packets in both directions:
    - delete \(f\), survive at the first apex and \(c\);
    - delete \(s\), survive at the first apex and \(c_f\).
13. `hexactTwo` states that \(K_a\) meets the retained first-apex radius class
    inside the first strict cap in exactly \(\{a,b\}\). This has cardinality
    exactly two and therefore **saturates**, rather than contradicts, `hlow`.

The target is the inconsistency of this entire fixed collection of data. A
proof that uses only a weakened local subcollection is acceptable only if it
really proves the full implication. A model of a weakened local subcollection
does not refute the theorem.

## §3 Assume-solvable framing

> Assume for purposes of this task that a complete resolution exists, but do
> not assume in advance that the answer is affirmative or negative. A complete
> solution must prove exactly one of the following two statements.

## §4 Dual-branch success criteria

### Affirmative resolution

Prove, without any additional hypothesis, that every fixed tuple
\[
\begin{aligned}
(&D,S,\texttt{radius},H,F,R,P,C,M,\texttt{hexactTwo},B,L,N,T,\\
 &\texttt{hcriticalShellUniqueFourCover},
   \texttt{hfirst},\texttt{hsecond},\texttt{hsurplus},\texttt{hlow})
\end{aligned}
\]
satisfying all hypotheses in §2 yields `False`.

The final result must close the existing Lean theorem with no `sorry`, no
axiom, and no theorem of comparable unproved strength. A complete affirmative
solution may use any valid route, but the three most direct accepted terminal
shapes are:

1. **Distinct canonical row through both collision sources.** Derive
   \[
   \exists z\in D.A,\quad
   c_z\ne c_a,\qquad a\in K_z,\qquad b\in K_z.
   \]
   This closes immediately via the already checked, import-reachable theorem
   `Problem97.ATailRetainedCollisionCapLocalization.
   false_of_distinct_actualRow_contains_collisionSources`.

2. **Non-circular three-hit shell.** Derive
   \[
   \exists i,x\in D.A,r,\quad
   \operatorname{ApexRichClassStructure}(D.A,S.\operatorname{opp}(i))
   \]
   and
   \[
   3\le
   |K_x\cap(
      \operatorname{Class}(D.A,S.\operatorname{opp}(i),r)
      \cap S.\operatorname{intcap}(i))|.
   \]
   This contradicts `hlow` or the imported two-hit upper bound.

3. **Direct global geometric contradiction.** Derive `False` directly from
   the full MEC/cap/frontier/deletion/canonical-selector structure without
   factoring through either interface above.

If the proof introduces intermediate lemmas, give their exact fully quantified
statements, prove them, and show their source-level import reachability at the
target line. An adapter that only repackages `P` as a
`RetainedRadiusCollision` is routine bookkeeping and is not the missing
mathematics.

### Negative resolution

Construct one fixed, exact Euclidean realization of **all** hypotheses of §2:
explicit finite coordinates for \(D.A\), all required centers and positive
radii, the relevant Moser triangle and cap partition, the complete canonical
shell system \(H\), and witnesses for every field of
\(F,R,P,C,M,B,L,N,T\), `hcriticalShellUniqueFourCover`, the three rich
patterns, `hexactTwo`, and universal `hlow`.

Then rigorously verify every field and conclude that the implication in §2 is
false in the standard Euclidean model. Merely giving an abstract incidence
table is insufficient unless you also prove it has an exact Euclidean
realization and that the realization satisfies the canonical-selection,
minimality, `D.K4`, no-`IsM44`, MEC, cap, and universal low-hit semantics.

The quantifier order is essential. The negative branch must construct **one
fixed tuple** satisfying all assumptions simultaneously. It is insufficient
to choose different configurations for different fields, rows, radii,
candidate lemmas, or finite tests.

If you find a model only of a weakened local subsystem, use it to kill that
intermediate route and continue. Such a model is not a negative resolution.
If a full countermodel reveals that one of the two displayed affirmative
interfaces becomes true after adding a natural global condition, identify the
weakest exact condition and explain where it fails in the countermodel; this
diagnosis supplements, but does not replace, the full countermodel.

Neither branch may assume a distinct row through both sources, a three-hit
shell, a dangerous-triple packet, a global return incidence, or a special
cyclic order unless that datum is derived from the current hypotheses.

## §4b Sanctioned reformulations

You may use the following reformulations, but every translation must be proved
source-faithful before its output is used.

1. **Canonical-shell incidence hypergraph.** Vertices are points of \(D.A\);
   each source \(q\) has one directed blocker \(c_q\) and one exact four-point
   hyperedge \(K_q\). Preserve:
   - \(q\in K_q\);
   - exact full-circle semantics of \(K_q\);
   - blocker/source separation;
   - deletion failure at \(c_q\);
   - unique-four-center semantics;
   - all cap and radius labels.

   A bare four-uniform hypergraph is lossy because it forgets Euclidean circle
   realization, the selected-center map, and the MEC/cap order.

2. **Cyclic-order or oriented-matroid encoding.** Strict convexity permits a
   cyclic boundary order and Kalmanson-type metric consequences. Preserve both
   orientations and all wraparound cases. Do not assume a single anchored
   order unless it is derived.

3. **Distance-algebra encoding.** You may introduce exact squared-distance
   variables, circle equations, determinant/orientation inequalities,
   perpendicular-bisector equations, and MEC/cap inequalities. Prove that the
   encoding is equivalent to the required Euclidean realization; a satisfiable
   distance table without a rank-two Euclidean realization is not enough.

4. **SAT/SMT/CAD/real-algebraic search.** Use computation to discover proofs,
   exact models, incompatible order cells, or counterexamples to intermediate
   lemmas. A solver `unknown`, floating-point witness, finite bounded search,
   or unchecked UNSAT result is evidence only. A completing result needs an
   exact witness or a checked certificate plus a proved reduction from the
   Lean hypotheses.

5. **Existing theorem-bank packets.** You may use a U5 or general-\(n\)
   contradiction only after constructing every antecedent from the live
   structures and establishing import reachability. Similar names and
   normalized statement shapes are not bridges.

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the complete
outcomes in §4. In particular, the following do **not** count as resolving the
target:

- rewriting `hexactTwo` to cardinality two and observing `hlow`;
- re-proving that the common blocker lies in the first strict cap;
- merely exposing or moving the private adapter from
  `RetainedInteriorBlockerCollision` to `RetainedRadiusCollision`;
- treating a q-deleted row from `C.packet`, `M.freshPacket`, or
  `M.collisionSourcePacket` as a canonical row `H.selectedAt z`;
- choosing \(z=a\) or \(z=b\) for the distinct-row terminal: their blockers
  equal the common blocker, so the required center inequality fails;
- choosing \(z=f\): its blocker is distinct, but `M` explicitly says its
  canonical shell omits the chosen collision source;
- using a deletion-surviving row that erases one of the desired sources as a
  row through both sources;
- proving that three points lie in a cap, a rich class, a union of radii, or a
  union of canonical shells without proving three points lie in the **same**
  canonical-shell/radius/strict-cap intersection;
- applying
  `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex`.
  That later theorem builds `hlow` and invokes the all-low coordinator, which
  returns to the current leaf. It is both unavailable by declaration order and
  logically circular;
- moving that later theorem earlier without removing the dependency cycle;
- presenting a first-apex-only argument that leaves the global hypotheses
  unused **and still contains an unproved gap**. A genuinely complete
  contradiction from a subset of the assumptions is valid; unused hypotheses
  are not themselves a defect;
- assuming three separate two-hit cap localizations force a repeated blocker:
  they may have three distinct blockers;
- invoking pairwise circle-overlap \(\le2\), bare convexity, mutual omission,
  or unique-four counting as though any one of them closed the branch;
- importing a theorem requiring `U5DangerousTriple`, positive cross-incidence,
  total blocker-map omissions, or a prescribed cyclic order without producing
  those hypotheses;
- presenting an abstract SAT/incidence model without exact Euclidean,
  canonical-selector, and full-parent realization;
- presenting a model of only the local `P,C,M` subsystem as a countermodel to
  the target;
- reporting solver `SAT`, `UNSAT`, or `unknown` without the exact witness,
  faithful reduction, and certificate appropriate to the claim;
- proving finitely many carrier sizes, coordinate grids, or cyclic orders
  without a complete reduction of the unbounded theorem to those cases;
- assuming the desired row, three-hit witness, global return, or another lemma
  of essentially equivalent strength;
- replacing the leaf by a conditional theorem, outcome enumerator, `Closers`
  structure, proposition-valued definition, source-clean wrapper, or more
  load-bearing `sorry`s;
- changing the theorem statement or adding a hypothesis unless the existing
  parent is also proved to supply that hypothesis;
- deriving a contradiction from inconsistent auxiliary assumptions that were
  not consequences of §2;
- calling a computationally observed pattern “routine” or “clearly general”;
- claiming whole-project closure because a scratch file elaborates or a local
  theorem compiles;
- reducing the problem to another unproved Euclidean-geometry or
  finite-incidence statement of comparable strength.

## §6 Allowed background

You may freely use standard exact facts about Euclidean distance, convex
polygons, circles, perpendicular bisectors, minimum enclosing circles,
finite-set cardinality, and the Lean/mathlib results already imported at the
target.

Standard proved theorems from Euclidean geometry, finite combinatorics, graph
theory, real algebraic geometry, and Lean/mathlib may be used, but they must be
stated accurately and applied with all necessary hypotheses and uniformity.

The following checked declaration facts, kernel-mined status facts, and dated
audit findings may be treated as established only with the labels shown:

1. **Kernel-mined blueprint snapshot (2026-07-26).** The current theorem was
   the sole open node in its 32-declaration subtree and the sole open node on
   its 20-hop ancestor path to
   `Problem97.erdos97_rhs`. This says the leaf is load-bearing; it does not say
   unrelated P97 branches are closed. Refresh this status before claiming
   closure.
2. **Checked source fact.** The parent coordinator constructs `C`, `M`, and
   `hexactTwo` from `P` by checked theorems and delegates to this exact leaf.
3. **Checked source fact.** `P` yields equality of the two complete canonical
   supports, both cross-incidences, common-blocker strict-cap placement, and
   exact closed-cap intersection \(\{a,b\}\).
4. **Checked source fact.** The generic two-hit localizer
   `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` is checked. Applied
   here, it reproduces an already known blocker-in-cap fact and does not close
   the theorem.
5. **Checked source fact.** The direct contradiction theorem
   `false_of_distinct_actualRow_contains_collisionSources` is checked and
   import-reachable.
6. **Checked source fact.** A non-circular three-hit witness contradicts the
   checked universal two-hit bound.
7. **Checked dependency fact.** The later same-file theorem that appears to
   produce a three-hit witness is an ex-falso compatibility consumer of the
   all-low coordinator and is circular for this leaf.
8. **Theorem-bank audit snapshot (2026-07-26).** The existing sibling and
   legacy registries contain many real general-\(n\) contradiction consumers,
   but the audit found no import-reachable producer whose hypotheses match
   this localized packet. The closest mutual-incompatibility bank theorem
   requires a dangerous triple, exact rows, and six positive
   cross-memberships; `M` instead records mutual omissions.
9. **Source-audit snapshot (2026-07-26).** A checked different-pair route
   exists in
   `RetainedCollisionDifferentPairConsumer.lean`, but its cyclic-order and
   positive cross-hit packet are not currently produced by this leaf.

The following are **empirical route-refutation evidence only**, not facts from
which the target may be concluded:

- older card-agnostic mutual-omission/overlap-\(\le2\) abstractions have exact
  rational QF_NRA-SAT realizations;
- an exact-rational 13-point strictly convex witness satisfies a full older
  local SI1 system;
- an exact-rational eight-point realization satisfies a same-pair marginal,
  and five acyclic different-pair order placements survive related local
  tests;
- those artifacts omit the full `CounterexampleData`/`D.K4` surface and the
  complete \(F,R,P,C,M,B,L,N,T\), global cover, three rich patterns, and
  universal low-hit hypotheses.

The relevant weaker-model artifacts are:

- `scratch/atail-arm2/si1_coupled.py` together with the independent exact
  `Fraction` checker `scratch/atail-arm2/independent_verify.py`; replay the
  latter with
  `uv run python scratch/atail-arm2/independent_verify.py`;
- `scratch/atail-arm2-analysis/fixed_order_convex.py`,
  `core13_convex.py`, `core8_convex.py`, and
  `witness_convexity_check.py`; replay the convexity discriminator with
  `uv run python scratch/atail-arm2-analysis/witness_convexity_check.py`;
- the scope and interpretation notes in
  `scratch/atail-arm2-analysis/ARM2_WALK_UNIFICATION.md` and
  `docs/atail-force-producer-plan-2026-07-13.md`.

Therefore these witnesses refute some tempting local lemmas. They neither
prove nor disprove the present theorem. Any proposed local mechanism should be
tested against them before proof effort is invested.

## §7 Multiagent orchestration block

Use multiagent v2 aggressively and dynamically. You have up to 4 total
concurrent agents available, including the root. Use a root-and-portfolio
architecture: launch independent agents on genuinely different mechanisms,
keep affirmative and negative routes alive, and assign separate adversarial
agents to attack every promising lemma. Include computational sanity checks
throughout. Use at least eight full synthesis/redispatch rounds before
considering a return.

Initial approach portfolio:

1. Reconstruct the exact formal dependency surface and derive every
   non-circular consequence of \(F,R,P,C,M,B,L,N,T\).
2. Seek a direct producer for a distinct canonical row through \(a,b\).
3. Seek a non-circular three-hit canonical-shell/rich-class/cap witness.
4. Exploit global `D.K4`, minimality, and no-`IsM44` to rule out the known
   local SAT escapes.
5. Exploit all three rotations of the Moser packet and tri-apex richness,
   rather than staying at the first apex.
6. Develop a genuinely Euclidean circle/bisector proof using the exact full
   shell property and blocker-center geometry.
7. Develop an MEC, cap-arc, angle, or curvature proof using the all-large-cap
   hypotheses.
8. Develop a cyclic-order/Kalmanson route with both orientations and complete
   wraparound handling.
9. Develop a canonical-shell incidence/hypergraph counting route that retains
   center and radius labels.
10. Find a valid bridge from bidirectional deletion packets to canonical
    selector rows, or prove by counterexample that the proposed bridge fails.
11. Complete the different-pair cross-hit/cyclic-order route or find exact
    countermodels to each candidate antecedent.
12. Search existing in-project, sibling, and legacy theorem banks for a
    source-faithful consumer and construct its full antecedent.
13. Build exact real-algebraic encodings for bounded geometric cores and use
    CAD/QE/Gröbner methods where a faithful finite reduction is proved.
14. Build SAT/SMT incidence abstractions to falsify intermediate claims and
    isolate precisely which global field kills each surviving model.
15. Attempt a full countermodel from explicit Euclidean coordinates, checking
    every field in §2.
16. Independently audit any claimed proof or model without access to the
    producer's reasoning trace.

Continue dynamically with proof attempts, model searches, adversarial audits,
theorem mining, formalization, and computational sanity checks.

Two attractors are especially dangerous and should be assigned dedicated
skeptics:

- “exactly two plus a low bound of two must be contradictory”;
- “a common-deletion row can be treated as the canonical row needed by the
  equality-core terminal.”

Do not tell most agents the currently favored approach. Give each a
self-contained statement and let independent mechanisms compete. The root
must maintain an approach registry recording each route, owner, precise
intermediate claim, evidence label, failure mode, and whether a genuinely new
mechanism justifies reopening it. An elegant reformulation must not dominate
the portfolio unless it produces a strictly stronger proved consequence or
removes a certified obstruction.

Operational requirements:

> * Do not let all agents converge on one approach after the first promising
>   observation. Keep several incompatible mechanisms alive through multiple
>   rounds.
>
> * Require concrete outputs: fully quantified lemmas, exact coordinate
>   systems, determinant or distance identities, faithful encodings, checked
>   certificates, counterexamples to intermediate claims, or compilable Lean
>   terms. Reject vague status reports.
>
> * When an approach stalls at a theorem-strength missing lemma, mark it
>   blocked. Reopen it only if an agent supplies a materially new mechanism,
>   invariant, construction, geometric inequality, or global-field use.
>
> * Use computational agents throughout for exact small-core search,
>   cyclic-order enumeration, SAT/SMT/CAD encodings, rational reconstruction,
>   and counterexamples to intermediate lemmas. Computation is evidence until
>   converted into a rigorous proof or a complete exact model.
>
> * Search aggressively for counterexamples to every proposed intermediate
>   lemma before relying on it. Test local claims against the existing exact
>   rational witnesses from §6.
>
> * After each round, the root must maintain a ledger with four labels:
>   `PROVEN`, `EMPIRICALLY VERIFIED`, `REFUTED`, and `OPEN`. Do not upgrade an
>   item between these labels without matching evidence.
>
> * The root must repeatedly synthesize, challenge, redirect, and launch new
>   rounds. A failed first wave is not a stopping condition. Produce a complete
>   solution only if it survives independent audit. If a hard external
>   execution limit ends the run first, report the strongest rigorously proved
>   derivation and the exact remaining gap, explicitly labeled `UNRESOLVED`;
>   never disguise that fallback as a resolution.

Every candidate affirmative proof must be audited line by line for:

- for the distinct-row terminal, one canonical row \(K_z\) containing both
  collision sources and the exact inequality
  `H.centerAt z hz ≠ H.centerAt P.source₁ P.source₁_mem_A`;
- for the three-hit terminal, three points in one and the same canonical shell,
  selected class at one fixed indexed apex and radius, and strict cap
  interior—not three separate two-hit or marginal statements;
- the fact that `hexactTwo` plus a bound by two is equality saturation, not a
  contradiction;
- actual use or legitimate redundancy of `D.K4`;
- strict convexity and all Euclidean realization assumptions;
- minimality and no-`IsM44`;
- \(9<|D.A|\) and the three all-large-cap bounds;
- the distinction between \(S\) and `D.packet`;
- exact MEC triangle, cap-role, closed-cap, and strict-interior conventions;
- positivity and equality of every radius;
- exact-full-shell semantics, support cardinality four, and source membership;
- canonical blocker/source separation and unique-four-center semantics;
- every field of \(F\) and \(R\), including deletion-survival provenance;
- both apex-robustness fields and all three tri-apex rich structures;
- the global non-robust-cover inequality and no-center-covers-all-apices field;
- both collision sources, their distinctness, radius/cap placement, equal
  blocker, equal supports, and cross incidences;
- freshness, same-cap placement, and fresh-point omission;
- both directions of mutual omission and blocker inequality;
- the exact semantics of all common-deletion rows;
- `hexactTwo` as equality of a triple intersection, not merely a lower bound;
- all quantifiers in `hlow`, especially the dependence on the rich-apex
  hypothesis and arbitrary \(x,r\);
- correct distinction between canonical and q-deleted rows;
- every case of a cyclic-order or orientation split;
- correct hypotheses for circle-intersection and bisector uniqueness results;
- a faithful solver encoding and independently checked certificate for every
  computational `UNSAT` claim, and a fixed exact witness for every `SAT`
  claim;
- a proved exhaustive reduction before any finite carrier-size, coordinate,
  or cyclic-order enumeration is promoted to the unbounded theorem;
- import reachability and declaration order of every Lean theorem invoked;
- absence of any dependency through the all-low coordinator or another
  descendant of the target;
- absence of hidden new assumptions or a lemma equivalent to the target;
- absence of `sorry`, `admit`, unsafe axioms, or source-clean wrappers;
- circular use of a statement equivalent to the desired contradiction;
- confusion between scratch elaboration, local target compilation, closure of
  this proof-blueprint leaf, and a clean whole-project build.

Every candidate negative model must be independently audited for:

- exact rational or exact algebraic coordinates, not floating-point proximity;
- distinctness and strict orientation inequalities;
- strict convexity;
- the complete per-vertex `D.K4` property;
- genuine minimality among all smaller counterexamples;
- the full no-`IsM44` universal statement over surplus packets;
- a valid non-obtuse circumscribed MEC Moser triangle and exact cap partition;
- every field of \(F,R,P,C,M,B,L,N,T\);
- a total canonical shell system \(H\) for **every** point of \(D.A\);
- exact full radius classes of cardinality four;
- all deletion-failure and deletion-survival facts;
- all-large-cap and tri-apex-rich fields;
- the global unique-four cover;
- all three rich strict-cap patterns;
- `hexactTwo`;
- universal `hlow` for all indices, sources, proofs of membership, and radii;
- one fixed realization satisfying all fields simultaneously.

## §8 Anti-quit block

> Do not return merely because current approaches fail or agents report
> theorem-strength gaps. Continue launching new rounds, reopening blocked
> approaches only when there is a genuinely new mechanism, and searching for
> fresh formulations. The known local SAT witnesses are instructions to use
> more of the global source-faithful surface, not permission to stop.

## §9 Return contract

> Return only when the exact implication in §2 has been completely resolved
> and the result survives independent adversarial audit. Do not return a
> reduction, conditional refinement, isolated missing lemma, finite
> computation, numerical guess, “best effort” summary, or explanation of why
> the leaf is difficult.
>
> Do not stop, return, or give up until you have found either:
>
> 1. a complete affirmative proof that closes
>    `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits`
>    without new axioms or `sorry`s; or
> 2. one exact full Euclidean countermodel satisfying every hypothesis of that
>    theorem simultaneously.

For an affirmative result, provide:

- the complete mathematical derivation;
- exact Lean statements for all new lemmas;
- compilable Lean code closing the target;
- a source-dependency explanation showing that no invoked result depends on
  the target;
- target-file diagnostics or an equivalent kernel check;
- refreshed proof-blueprint evidence that this leaf is closed.

Do not manually edit generated status files such as `docs/live-blueprint.md`.
Do not claim a clean whole-project build if unrelated shared-worktree modules
fail; distinguish target closure from global build health.

For a negative result, provide:

- the fixed coordinates and every selected center, radius, shell, row, cap,
  and packet witness;
- an exact verification of every field;
- a machine-checkable exact certificate or a formal realization proof;
- a field-by-field map from the model to the theorem signature;
- the weakest additional source-faithful hypothesis, if any, that separates
  the countermodel from either direct affirmative terminal.

Spend at least eight full rounds of the approach portfolio before even
considering a return.

## §10 Web-search restriction

> Public search may be used only for ordinary mathematical background or
> standard named theorems, not to search for a solution to this exact Erdős
> problem, this Lean theorem, or this benchmark. Do not search the public web
> merely to determine whether the problem is open, and do not answer that it
> is open. Prefer the repository source, the indexed Lean corpora, and the
> checked theorem-bank registries.
