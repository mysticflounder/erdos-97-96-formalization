# D round-1 response B (deep thinker, 2026-07-28)

Second independent run against `2026-07-27-post-card-eleven-unique-radius.md` (D package;
first run: `2026-07-28-d-round1-response-a.md`). Math delimiters preserved verbatim.
No leaf resolved; bankable content: D4 global one-defect two-deletion cover (with a Lean
statement sketch), D1 |Γ₂|≥6, D3 robust/critical split via
`PhysicalSecondApexCommonDeletion`, no-descent warning for D2 swapped-packet iteration,
falsified local-impossibility lemmas (dead-ends material).

---

# Execution result

I did **not** obtain a complete Branch-A contradiction or a complete Branch-B certificate for D1–D4. Therefore, this execution does not satisfy the attached prompt's stated return criterion. I am not replacing any of the four `sorry`s with an unverified argument.

I inspected the live declarations and their producing/consuming modules. The current source still contains the four requested obligations: D1 in the robust two-radius branch, D2 in the swapped unique-four branch, and D3/D4 in the two exact-five obstruction-center branches.

The strongest new result is a global consequence of D4 that is substantially stronger than its source-indexed survival statements.

## D4: global one-defect two-deletion cover

Write

[
q=\widetilde q,\qquad w=\widetilde w,\qquad
a=a_1,\qquad b=\chi(q)=\chi(w).
]

Then D4 implies

[
\boxed{
\forall c\in A,\ c\ne b\ \Longrightarrow
K_4(A\setminus{q},c)\ \lor
K_4(A\setminus{w},c)
}
\tag{1}
]

while simultaneously

[
\boxed{
\neg K_4(A\setminus{q},b)
\quad\text{and}\quad
\neg K_4(A\setminus{w},b).
}
\tag{2}
]

Thus (b) is the **unique possible common defect** of the two singleton deletions.

### Proof

Fix (c\in A) with (c\ne b).

If (c=a), full deletion robustness at the first apex gives both

[
K_4(A\setminus{q},a)
\quad\text{and}\quad
K_4(A\setminus{w},a).
]

Now suppose (c\ne a,b). Choose any radius (r>0) witnessing (K_4(A,c)), and put

[
T=\Lambda_A(c,r),\qquad |T|\ge 4.
]

By D4's no-third-bisector field,

[
d(c,q)\ne d(c,w).
]

Consequently (q) and (w) cannot both belong to (T).

If (q\notin T), the same class (T) remains after deleting (q), proving
(K_4(A\setminus{q},c)). Otherwise (q\in T), hence (w\notin T), and (T) proves
(K_4(A\setminus{w},c)). This proves (1).

For (2), the selected critical row at (q) is centered at (b), contains (q), and its critical-shell field explicitly says that deleting (q) destroys the (K_4) property at (b). The analogous statement for (w), together with
(\chi(w)=b), gives the second failure. These are part of the live D4 residual and the `CriticalShellSystem` semantics.

A Lean-oriented statement for the result is:

```lean
theorem d4_global_twoDeletion_cover_with_unique_common_defect
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R :
      FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    let q := R.interior.frontier.pair.q
    let w := R.interior.frontier.pair.w
    let b :=
      H.centerAt q R.interior.frontier.pair.q_mem_A
    (∀ c : ℝ², c ∈ D.A → c ≠ b →
      HasNEquidistantPointsAt 4 (D.A.erase q) c ∨
      HasNEquidistantPointsAt 4 (D.A.erase w) c) ∧
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q) b ∧
    ¬ HasNEquidistantPointsAt 4 (D.A.erase w) b := by
  -- Split c = first apex.
  -- Otherwise choose the K4 radius supplied by D.K4.
  -- R.no_third_carrier_bisector shows that the chosen class
  -- omits q or omits w.
  -- Reuse that class in the corresponding erased carrier.
  -- The two final negations are the critical-shell no-survival
  -- fields for q and w, transported along R.obstructionCenters_eq.
  ...
```

The mathematical proof above is complete. The Lean body has not been compiled in this environment, so I am not presenting it as kernel-checked code.

## Why this does not yet close D4

The quantifiers in (1) are

[
\forall c\ne b;\exists x\in{q,w}:
K_4(A\setminus{x},c).
]

Minimality would need a single smaller carrier, requiring a uniform deletion and witnesses that also avoid the removed blocker. A sufficient missing statement would be:

[
\boxed{
\exists x\in{q,w}\ \forall c\in A\setminus{b,x}:
K_4(A\setminus{b,x},c).
}
\tag{3}
]

Then (A\setminus{b,x}) would remain nonempty and convex-independent, inherit the (K_4) property, and contradict minimality.

The existing global minimal-deletion machinery does not prove (3). It may return a singleton blocking subdeletion, and in D4 the common blocker (b) is already a legitimate blocking center for both singleton deletions. Moreover, a witness that avoids (q) or (w) may still use (b), so deleting (b) is not automatically harmless. The repository's blocker-multiplicity audit likewise warns that the finite blocker-map geometry alone does not produce a global contradiction.

Accordingly, the exact missing D4 bridge is:

> **CONJECTURED — D4 deletion purification.**
> Under the complete D4 cap, exact-five, critical-row, and unique-bisector hypotheses, one of (q,w) can be chosen so that every remaining center has a four-point row avoiding both that endpoint and (b).

The weaker abstract implication "one-defect two-deletion cover implies a removable vertex" is not justified and should not be added as an axiom.

# Status of all four leaves

| Leaf   | Status     | Strongest retained conclusion | First unresolved bridge |
| ------ | ---------- | ----------------------------- | ----------------------- |
| **D1** | Unresolved | The two selected supports are the two full exact classes. Their distinct radii make them disjoint, and the two strict-cap lower bounds force at least four distinct points in (\Gamma_2^\circ), hence (|\Gamma_2|\ge6). | A two-radius analogue of the five-class mutual-omission producer is needed. It must find a **good outside source** among the two rows and retain an omitted strict-cap peer plus one of the named ingress deletions. Cardinality alone does not ensure that one of the four strict hits is a good outside source. |
| **D2** | Unresolved | Let (C_1) and (C_2) be the exact classes at (a_1,a_2). The original frontier pair lies outside (C_2), the swapped pair lies outside (C_1), and (|C_1\cap C_2|\le2). The ingress row at (a_2) must equal (C_2), because the swapped radius is the unique (K_4) radius there. | The remaining rigid case is a reciprocal (2+2) incidence pattern among (C_1,C_2), and the ingress blocker row. Reapplying the physical consumer can return to the same swapped state; no strictly decreasing packet, pair, or overlap measure has been proved. |
| **D3** | Unresolved | The directed-survival disjunct gives a genuine common-deletion packet at one obstruction center and (a_2). The existing physical-second-apex theorem then splits into a fully robust (a_2) or a critical shell reorienting to a swapped exact-four frontier. | The critical arm reaches the D2-type state; the robust arm has no terminal that consumes the retained exact-five first-apex data. The existing common-deletion theorem supplies precisely this robust/critical split rather than a contradiction. |
| **D4** | Unresolved | The global unique-common-defect cover (1)–(2) above. | Prove the two-point deletion-purification statement (3), or obtain an independent cap-geometric contradiction from the exact kite (a,q,b,w) and the remaining two points of the exact row at (b). |

# Approach portfolio audited

I pursued more than the required six independent families.

| Family | Outcome |
| ------ | ------- |
| Exact source and dependency audit | Confirmed that D1/D2 retain substantial ingress and surface data, while D3/D4 expose only the exact-five residual fields; no hidden downstream contradiction theorem was being overlooked. |
| Two-circle intersection bookkeeping | Produced the row–class intersection bounds and the D2 reciprocal class exclusions, but all resulting (2+2) patterns remain combinatorially feasible. |
| Cap occupancy and cap-sum arithmetic | D1 strengthens uniformly to (|\Gamma_2|\ge6). The three cap-growth profiles nevertheless remain arithmetically consistent. |
| Perpendicular-bisector geometry | D4 saturates the carrier bisector bound with exactly (a_1,b). The corresponding convex kite is geometrically realizable, so the displayed kite alone is not contradictory. |
| Blocker directed graphs | Each blocker row meets the exact-five class in at most two points, giving out-degree at most one to other class members. The only avoidance residue is a directed three-cycle on three strict-cap members; that local pattern is geometrically realizable. |
| Minimal-deletion cores | Isolated the D4 unique-defect cover, but minimality can legitimately use (b) as the blocker of both singleton deletions. The existing minimal-core alternatives do not purify witnesses away from (b). |
| Swapped-packet iteration | D2 can be sent back through the physical consumer, but the non-surplus swap does not supply a well-founded descent. The second packet's third Moser vertex is not fixed by the hypotheses, so treating the swap as a literal involution would be invalid. |
| Global isosceles-incidence counting | The available bound obtained by counting support pairs against carrier bisector centers is too weak at the permitted cardinalities. |
| Cap redesignation/rotation | Exact-five and large-cap data allow informative rotations, but the fresh unique-radius arm returns to the same family without a decreasing invariant. |
| Coordinate and numerical counterexample tests | Several tempting local impossibility lemmas were falsified by convex local models: the D4 kite, the two-circle support pattern, and the three-cycle support pattern are all locally realizable. None of those models satisfies the full global (K_4), shell-table, no-((m,4,4)), and minimality stack, so none is a Branch-B certificate. |

## Bottom line

No `sorry` can presently be removed on the basis of this execution. The most concrete addition to the formal development is the D4 global cover theorem (1)–(2). It converts D4 from a local common-blocker picture into a sharply defined global deletion problem and identifies the precise quantifier/witness-purification gap that the next terminal must solve.
