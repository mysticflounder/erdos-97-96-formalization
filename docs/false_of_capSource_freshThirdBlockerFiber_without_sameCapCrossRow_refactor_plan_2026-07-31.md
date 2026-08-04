> **Status 2026-08-03 — LANDED, with a naming divergence.** The positive
> normal form this plan proposes is implemented, at
> `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:10375-11343`, as the
> `FreshThirdCapSourceInteraction` / `FreshThirdTwoCapSourceObstruction`
> machinery. The public theorem name proposed below,
> `false_of_capSource_freshThirdBlockerFiber_core`, was **not** adopted and
> exists nowhere in `lean/`. The descendant obligation that actually carries
> the `sorry` is
> `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
> (`:11324`), which is a current active anchor. Dispatch against that name.

## Verdict

**Yes.** This is a strong refactor candidate, but the right refactor is more surgical than the E1 refactor.

The source has already completed the first useful narrowing: the positive `FreshThirdSameCapCrossRowAlignment` branch is kernel-closed by ordered-cap uniqueness. The remaining `sorry` receives only

```lean
hnoAlignment :
  ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source
```

where `FreshThirdSameCapCrossRowAlignment` is an existential containing seven separate geometric/incidence conjuncts. Thus the core theorem is presently asked to consume a **negated compound packet** without being told which constituent fails. ([GitHub][1])

I would refactor it into a **positive exhaustive interaction normal form** between:

[
K_s=\Sigma(\text{source}),\qquad
K_Q=\Sigma(Q.\mathrm{source}_1),
]

and their centers

[
c_s=c(\text{source}),\qquad
c_Q=c(Q.\mathrm{source}_1)=c(Q.\mathrm{source}_2).
]

The open core should no longer take `hnoAlignment`.

---

## Why the current negative interface is obstructive

`hnoAlignment` says only that, for every cap index, at least one of the following fails:

* (c_Q) lies in the cap;
* (c_s) lies in the cap;
* (c_Q\ne c_s);
* (Q_1) lies outside the cap;
* (Q_2) lies outside the cap;
* (Q_1\in K_s);
* (Q_2\in K_s).

Those failure modes have completely different mathematical meanings:

* (c_Q=c_s) means the two canonical rows are actually the same full circle class;
* (Q_j\notin K_s) gives a deletion surviving at (c_s);
* the centers may occupy different caps;
* the centers may share a cap, but one of the common row points lies inside that cap.

Those are not variants of one argument. They feed different consumers.

The source already has the checked theorem that **every actual blocker center lies in some indexed strict cap interior**, but it occurs later in the file, after the present `sorry`. ([GitHub][1]) That declaration-order mismatch is a strong signal that this leaf is sitting above its proper source-clean normal form.

There is also an engineering issue: `CapSourceThirdCanonicalRowWitness` is currently an `abbrev` consisting of a long nested conjunction. It contains useful named facts—cap-eight, first-cap source membership, freshness, center separation, the exact actual row, and two cross-pair deletion views—but exposes none of them through projections. ([GitHub][1])

---

# Recommended normal form

Schematically, I would introduce something like this:

```lean
inductive FreshThirdCapSourceInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Type

  | sameBlocker
      (center_eq :
        H.blockerVertex source = H.blockerVertex Q.source₁)
      (support_eq :
        sourceRow source = freshRow Q)

  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq :
        deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉ sourceRow source)
      (deletion_survives :
        HasNEquidistantPointsAt 4
          (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))

  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem : Q.source₁.1 ∈ sourceRow source)
      (source₂_mem : Q.source₂.1 ∈ sourceRow source)
      (overlap_eq :
        sourceRow source ∩ freshRow Q =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈
          S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)

  | sameCapWithInternalFiberSource
      (centers_ne : ...)
      (source₁_mem : Q.source₁.1 ∈ sourceRow source)
      (source₂_mem : Q.source₂.1 ∈ sourceRow source)
      (overlap_eq :
        sourceRow source ∩ freshRow Q =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem : ...)
      (freshCenter_mem : ...)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
        Q.source₂.1 ∈ S.capByIndex capIndex)
```

The exact names can differ, but these are the four genuine positive cases.

## Why this split is exhaustive

The normalizer can be completely sorry-free:

1. **Split on (c_s=c_Q).**
   When equal, the selected supports are equal; current source already uses the checked `selectedSupports_eq_of_actualBlockers_eq` theorem for exactly this purpose. ([GitHub][1])

2. **Assume the centers are distinct. Split on**
   [
   Q_1\in K_s,\qquad Q_2\in K_s.
   ]
   If either membership fails, row survival gives the `sourceRowOmission` constructor. The project already has the exact equivalence between deletion survival and omission from the actual selected support. ([GitHub][2])

3. **If both memberships hold**, then both (Q_1,Q_2) lie in (K_s\cap K_Q). Since the centers are distinct and the two sources are distinct, the ordinary two-circle bound yields
   [
   K_s\cap K_Q={Q_1,Q_2}.
   ]

4. Use `exists_blockerCenter_mem_capInteriorByIndex` for (c_s) and (c_Q). If their cap indices differ, return `distinctBlockersDifferentCaps`.

5. If the indices agree and both (Q_1,Q_2) lie outside that cap, all seven fields of `FreshThirdSameCapCrossRowAlignment` hold, contradicting the already-proved alignment theorem. Therefore at least one (Q_j) lies in the common cap, giving `sameCapWithInternalFiberSource`.

This is exactly the logical complement of the closed alignment case, but expressed as positive mathematical data rather than a negated existential.

---

# The new core theorem

I would leave exactly **one** new load-bearing theorem:

```lean
theorem false_of_capSource_freshThirdBlockerFiber_core
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowData P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction :
      FreshThirdCapSourceInteraction P Pρ source Q) :
    False := by
  sorry
```

The current exported theorem becomes a compatibility wrapper:

```lean
theorem false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
    ...
    (hnoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False := by
  obtain ⟨interaction⟩ :=
    nonempty_freshThirdCapSourceInteraction_of_noAlignment
      source hsource Q hnoAlignment
  exact false_of_capSource_freshThirdBlockerFiber_core
    source hsource Q interaction
```

The public parent can retain its present alignment split, so no callers need change immediately.

I would **not** introduce four separate permanent `sorry`s at first. Keep the case split inside one core. Split constructors into separate open leaves only after one arm closes or experiments establish that they require truly unrelated theorems.

---

# Move the core below the checked cap-location helpers

The current leaf is at approximately line 7236. The blocker-cap localization theorem appears at approximately line 7862, and the next sibling open theorem does not begin until approximately line 8501. ([GitHub][1])

I would move the normalizer and new open core into that interval:

[
\texttt{exists_blockerCenter_mem_capInteriorByIndex}
\quad\text{before}\quad
\texttt{false_of_twoCapSources_oneSidedDeletionSurvival}.
]

That permits the core to consume the checked blocker-cap placement theorem while keeping it above the next open sibling. The positive alignment contradiction can remain where it is.

A cleaner but more invasive version would extract the blocker-cap localization theorem and the normal-form structure into a source-clean module. Moving within the file is adequate initially.

---

# Preserve stronger producer provenance

The generic normal form is necessary because the top-level coordinator only supplies an arbitrary `FreshThirdBlockerFiber`. But two important call sites know much more and should not immediately discard it.

## 1. Two cap sources with the same blocker

In `false_of_twoCapSources_firstFiber`, the equal-blocker arm constructs (Q) directly from two mutually incident cap-source witnesses. Consequently:

[
Q.\mathrm{source}_1=\mathrm{source},\qquad
Q.\mathrm{source}_2=\mathrm{source}',
]

and both points retain their cap-source and common-radius provenance. The current code then routes this through the generic parent. ([GitHub][1])

That call should enter a specialized `sameBlocker` consumer retaining:

* both cap-source witnesses;
* their distinctness;
* their common first-apex radius;
* mutual row membership;
* common blocker;
* both cross-pair deletion views.

That is substantially stronger than an arbitrary `sameBlocker` constructor.

## 2. The canonical-row override producer

`false_of_freshCanonicalRowOverride` begins with the explicit fact

[
q\notin K_s
]

and proves that the original center of (q)'s row differs from the cap-source blocker before constructing the override system. ([GitHub][1])

Depending on whether the installed second point equals the cap source, the rebased configuration lands either in:

* the `sourceRowOmission` arm; or
* the `sameBlocker` arm.

The wrapper should preserve this provenance rather than rediscover it from `¬ alignment`. In particular, the original `hqSource` is exactly the kind of certified nonzero/omission datum useful to power-matrix and deletion arguments.

---

# What each arm is really asking for

| Normal-form arm                  | Likely mathematical consumer                                                                                |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `sameBlocker`                    | Larger source fiber, exact support equality, minimality/cover pressure, same-center power-row deduplication |
| `sourceRowOmission`              | One-sided deletion synchronization, Hall/Dulmage–Mendelsohn, power-matrix zero/nonzero patterns             |
| `distinctBlockersDifferentCaps`  | Radical-axis sign order, Kalmanson comparisons across caps, global tri-apex geometry                        |
| `sameCapWithInternalFiberSource` | Exact cap occupancy, ordered-cap row bounds, two-hit localization and interval geometry                     |

This classification also tells the miner what to retain. It should not search one undifferentiated `hnoAlignment` model.

---

# Dead-ends audit

This refactor does **not** revive the dead bare blocker-digraph route. The blocker-digraph failure came from using only an outdegree-one map and hoping a cycle alone forced a contradiction. Here the normal form retains two actual full circle classes, exact cross-memberships or omissions, blocker-cap locations, and convex cap geometry. ([GitHub][3])

It also avoids the exhausted single-center-window language. The dead-ends document explicitly says that a viable future pattern must couple at least two centers; every nontrivial constructor above does precisely that. ([GitHub][3])

Nor should this become a fixed named-slot SAT refactor. The audited F-(\Gamma) package has no source-faithful finite completeness reduction: a 17-point shadow and an unbounded extension survive. The audit identifies the missing bridge as a positive incidence, center, or rich-slice relation between the cap-source row and the fresh fiber. ([GitHub][4]) The proposed normal form exposes exactly those positive relations without asserting that the named universe is complete.

Finally, all fields should refer to the **actual full `CriticalShellSystem` rows**. A chosen four-subset from a common-deletion certificate is not interchangeable with a full circle class; the same semantic guard is load-bearing in the expanded E1 interface. 

---

# What not to do

I would avoid:

* turning the seven failed alignment conjuncts into seven separate open leaves;
* enumerating all nine ordered pairs of cap indices;
* merely bundling the huge section context into a structure without deriving stronger facts;
* replacing actual selected rows with common-deletion four-subsets;
* creating a finite incidence census and treating its named points as exhaustive;
* retaining `hnoAlignment` as the central hypothesis of the mathematical proof;
* discarding the two-source or override provenance at specialized call sites.

---

## Expected effect

This refactor will not make the leaf easy. It will probably remain the hardest current residual. But it changes the research problem from

[
\neg(\text{one seven-part alignment packet})\Longrightarrow\bot
]

into four explicit geometric mechanisms, each with a plausible theorem family and computational encoding.

I would do this refactor **before investing further inference or compute into this leaf**. It is likely a one-to-three-day source refactor, preserves the public API, adds no new mathematical assumption, and should substantially improve both proof search and countermodel mining.

[1]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"
[2]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean"
[3]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/dead-ends.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/dead-ends.md"
[4]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/census/frontier-packages/SESSION3-TRIAGE-2026-07-28.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/census/frontier-packages/SESSION3-TRIAGE-2026-07-28.md"

