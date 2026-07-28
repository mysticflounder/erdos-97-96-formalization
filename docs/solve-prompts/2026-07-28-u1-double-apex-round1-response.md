# U1 double-apex round-1 response (deep thinker, 2026-07-28)

Response to `2026-07-27-u1-double-apex-shared-radius-pair.md` (retired
restoration target `DoubleApexOffSurplusSharedRadiusPair`,
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2401`, off-spine). Math
delimiters preserved verbatim (source mangling). No resolution; key content:
H9–H14 manufacturable from H8 (reduction to a five-ingredient core,
UNAUDITED), the multi-deletion failure interface (MD), and the blocker-closed
deletion-set obstruction — converging with the banked D1GlobalSurvival
pair-erase refutation (commit `96ced43f`).

---

# Result

I did **not** establish either permitted resolution:

* no proof of `False` from H1–H14;
* no exact algebraic configuration satisfying every one of H1–H14.

Accordingly, there is no sound Lean replacement for the `sorry` in `DoubleApexOffSurplusSharedRadiusPair`. The theorem remains unresolved as stated; using the downstream reflection kernel, the current `erdos97_rhs`, or the newer frontier coordinator would either be circular or inherit existing `sorryAx` dependencies. The attached prompt’s equivalence between the witness conclusion and inconsistency of H1–H14 is correct.

The source audit also confirms that this is a retired restoration target rather than a current direct leaf. The repository now describes the former U-lane Route-B tail as historical and locates the current direct obligations in `ATail/FrontierLiveClosure.lean`; the published theorem still reaches `sorryAx` through those leaves. ([GitHub][1])

## Strongest exact reduction obtained

The most important finding is that **H9–H14 add essentially no global force beyond H8**. They can be manufactured from a critical-shell system once the non-Moser surplus point (q) is chosen.

Let H8 assign to (q) a blocker center (p=c(q)), radius (\rho>0), and exact full shell

[
K_q={y\in A:d(p,y)=\rho},\qquad |K_q|=4,\qquad q\in K_q.
]

Write

[
K_q={q,t_1,t_2,t_3}.
]

Then:

1. The four labels are distinct, and (p\notin K_q), because (\rho>0).

2. The three points (t_1,t_2,t_3) are noncollinear: a line intersects a positive-radius circle in at most two points.

3. H8’s blocker property at (p) is exactly H9 after deleting (q). Erasing (p) additionally changes no positive-radius class centered at (p).

4. The exact shell equality gives

   [
   {y\in(A\setminus{q})\setminus{p}:d(p,y)=d(p,q)}
   ={t_1,t_2,t_3},
   ]

   establishing H10 and H11(b).

5. Since (|A|\ge 11), one can choose

   [
   u\in A\setminus{p,q,t_1,t_2,t_3},
   ]

   establishing the selected-candidate and six-label distinctness requirements.

6. For the five H13 rows, use H8’s exact shells for (q,t_1,t_3,u). For the (t_2)-row, reuse (K_q) centered at (p). This is legitimate because H13’s rows require only an exact full four-shell containing their source; they do not require their blocker provenance to agree with H8.

Thus the old leaf reduces to the following core statement:

[
\boxed{
\begin{array}{c}
\text{convex-independent global K4 carrier}\
+\ \text{two-large-cap packet}\
+\ \text{no same-carrier }(m,4,4)\text{ packet}\
+\ \text{critical shell system}\
+\ |A|>9
\end{array}
\Longrightarrow \bot .
}
]

The dangerous row, selected candidate, and five `CriticalSourceRows` do not strengthen that core in a way usable for contradiction. This explains why searches based on special properties of the five named rows repeatedly fail: the rows can all be chosen independently, and the four dangerous sources can all use the same exact shell centered at (p).

## Exact missing interface: multi-deletion failure

H8 proves the singleton-deletion statement

[
\forall s\in A,\quad
\neg K4(A\setminus{s},c(s)).
]

The current frontier machinery needs the stronger multi-deletion principle

[
\tag{MD}
\forall,\varnothing\ne V\subsetneq A,\quad
\exists c\in A\setminus V,\quad
\neg K4(A\setminus V,c).
]

Global cardinal minimality supplies precisely this: every nonempty proper subset of a minimal carrier fails the global K4 property, and that failure is witnessed at a center remaining in the subset. The repository’s `GlobalMinimalDeletion` module formalizes this implication and then extracts cardinality-minimal blocking subdeletions. ([GitHub][2])

The corresponding failure-cascade theorem repeatedly selects such a remaining failed center and grows any nonempty deletion seed until it reaches all of (A). Its documentation explicitly states that geometric closure additionally requires showing that the cascade remains trapped in a proper region. ([GitHub][3])

H8 alone does not provide (MD). For a deletion set (V), H8 gives a useful failed remaining center whenever there is some (s\in V) with

[
c(s)\notin V.
]

Indeed,

[
A\setminus V\subseteq A\setminus{s},
]

so failure of K4 at (c(s)) after deleting (s) implies failure after deleting all of (V), and (c(s)) remains present.

But H8 says nothing in the case

[
\forall s\in V,\qquad c(s)\in V.
]

That is, a nonempty deletion set may be **closed under the designated blocker map**. In this case all the singleton blockers supplied by H8 have themselves been deleted, and the singleton criticality data produces no failed center in (A\setminus V).

A Lean-facing formulation of the sufficient missing producer would be approximately:

```lean
theorem exists_failed_remaining_center
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    (V : Finset ℝ²)
    (hVne : V.Nonempty)
    (hVA : V ⊆ D.A)
    (hVproper : V ≠ D.A) :
    ∃ c ∈ D.A \ V,
      ¬ Erdos97.HasNEquidistantPointsAt 4 (D.A \ V) c
```

Global minimality proves this. H1–H14 do not contain it as a field.

## Why blocker-cycle combinatorics does not fill the gap

The blocker map satisfies several real restrictions:

* (c(s)\ne s);
* a center’s exact four-shell can contain at most four sources assigned to it;
* when sources and their blocker centers lie in the same physical circle, two-circle intersection can reduce that indegree bound further.

These restrictions still permit proper blocker-closed functional components such as directed cycles. The repository contains an exact rational, strictly convex, kernel-checked local two-cycle. Its carrier includes

[
p=(0,0),\qquad q=(1,0),
]

with exact radius-one classes

[
\operatorname{Cl}(p,1)={q,a,b,c},\qquad
\operatorname{Cl}(q,1)={p,d,e,f},
]

and each center has no other positive-radius class of size four. The report explicitly records that the model is local: it lacks global per-vertex K4, a full `CriticalShellSystem`, MEC/cap data, no-M44, and the remaining parent fields. It therefore is not Branch B, but it rigorously rules out a contradiction based only on convexity plus a blocker cycle’s local exact-four rows. ([GitHub][4])

Consequently, the unresolved geometric content can be stated precisely:

> Use global K4, convex independence, the two-large-cap packet, and no-M44 either to rule out every relevant proper blocker-closed set, or to produce a failed center outside such a set by a mechanism not encoded in the designated H8 blockers.

The stronger current cap/frontier audits reach the same boundary. Even with cap size at least eight and significantly richer collision data, the checked producers yield only partial deletion survivals; they do not produce the positive cross-incidence, common outside pair, or three-apex class needed by the contradiction consumers. The audit also notes that `noM44` has no direct ingress until two actual cap cardinalities are proved equal to four—distance-class cardinalities do not suffice. ([GitHub][5])

## Branch audit

### Branch A

No derivation of `False` survived audit.

In particular, the following attempted mechanisms do not close H1–H14:

* blocker-center diversity among (q,t_1,t_2,t_3);
* common provenance between H8 and H13;
* a local blocker-cycle contradiction;
* single joint-fiber pigeonholing;
* direct use of no-M44 on radius-class cardinalities;
* a minimal-deletion or failure-cascade argument without global minimality;
* importing the current frontier coordinator, whose route explicitly retains the stronger minimality surface and still bottoms out at direct source obligations. ([GitHub][1])

### Branch B

No exact model satisfying all H1–H14 was found.

The exact rational local models encountered certify only weaker subsystems. They fail one or more of the decisive global requirements:

[
\text{global per-center K4},\quad
\text{full critical-shell system},\quad
\text{MEC packet},\quad
\text{complete no-M44 sweep}.
]

Reporting any of them as a counterexample would violate the prompt’s Branch-B contract. The exact blocker-cycle model, for example, expressly omits those fields. ([GitHub][4])

## Source-level consequence

No source edit should be made to the retired theorem on the basis of this analysis. A restoration through the current minimality architecture needs at least one of:

1. `hmin : D.Minimal`;
2. the multi-deletion failure property (MD);
3. a cap-specific theorem that supplies the required remaining failed center for every deletion set actually used by the frontier construction;
4. a wholly different direct contradiction from H1–H14.

Without one of these additions, replacing the `sorry` with an existing downstream theorem would conceal either a circular dependency or an unstated strengthening of H8.

[1]: https://github.com/mysticflounder/erdos-97-96-formalization "GitHub - mysticflounder/erdos-97-96-formalization · GitHub"
[2]: https://github.com/mysticflounder/erdos-97-96-formalization/blob/main/lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean "erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean at main · mysticflounder/erdos-97-96-formalization · GitHub"
[3]: https://github.com/mysticflounder/erdos-97-96-formalization/blob/main/scratch/minimality-closed-set/FailureCascade.lean "erdos-97-96-formalization/lean/scratch/minimality-closed-set/FailureCascade.lean at main · mysticflounder/erdos-97-96-formalization · GitHub"
[4]: https://github.com/mysticflounder/erdos-97-96-formalization/blob/main/scratch/blocker-cycle-geometry/REPORT.md "erdos-97-96-formalization/scratch/blocker-cycle-geometry/REPORT.md at main · mysticflounder/erdos-97-96-formalization · GitHub"
[5]: https://github.com/mysticflounder/erdos-97-96-formalization/blob/main/scratch/triapex-global-bridge/REPORT.md "erdos-97-96-formalization/scratch/triapex-global-bridge/REPORT.md at main · mysticflounder/erdos-97-96-formalization · GitHub"
