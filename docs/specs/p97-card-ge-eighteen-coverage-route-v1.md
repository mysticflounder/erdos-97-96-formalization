# Coverage record: the card-≥18 BlockerV residual (v1)

**Status: NO ROUTE EXISTS.** This document is the closure-plan coverage the rigor
gate requires for an open publish-reachable `sorry`. It records the obligation,
demonstrates that the active exact-17 apparatus cannot reach it, inventories what
is and is not available in its context, and states the exact producer a route
must deliver. It closes nothing, promotes nothing, and claims no mathematics.

Lane: `card-ge-eighteen-coverage-20260816`.
Snapshot: source at `d25317ac`, working tree of 2026-08-16.

## 1. The obligation

`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`
— `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:11878`.

It is publish-reachable: `proof-blueprint spine`, rooted at `Problem97.erdos97_rhs`,
lists it among the open obligations. Its proof body is a bare `sorry` at `:11909`,
and every hypothesis binder is `_`-prefixed, so nothing in the context is consumed.

Its only cardinality hypothesis is `_hcard : 18 ≤ D.A.card` (`:11898`). That
hypothesis occurs exactly once elsewhere in the entire Lean tree — at `:11992`,
the `omega` in the parent split that produces it.

### Prior coverage

The obligation is named twice in the documentation, both times negatively:

- `docs/computational-closure-plan-2026-07-28.md:12715` — the exact-17 cap-nine
  route "closes only the exact-17 cap-nine leaf, not the `card_ge_eighteen`
  sibling or full P97."
- `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md:98` — "It does not by
  itself close the `card_ge_eighteen` sibling."

No document describes a route for the child. The plan does state the general
requirement one rung lower, for the parent `17 ≤ |A|` residual (§7); it was never
carried down. That gap is what this record addresses.

## 2. Position: the top of a non-terminating cardinality ladder

`Rigid221SourceHeavy.lean` discharges this residual by peeling one exact stratum
per rung and pushing the remainder upward:

```
…_card_ge_sixteen    :12001  → (exact 16 | …_card_ge_seventeen)
…_card_ge_seventeen  :11920  → (exact 17, cap ∈ {9,10,11} | …_card_ge_eighteen)
…_card_ge_eighteen   :11878  → sorry
```

The exact-17 rung's three-way cap split is derived at `:11965`–`:11987` from:

- the cap-sum identity `|surplusCap| + |oppCap1| + |oppCap2| = |A| + 3`
  (`U1TwoShortCapReduction.lean:100`, from `Cap/PartitionFromMEC.lean:397`);
- `S.surplus_card_gt_four`, i.e. `|surplusCap| ≥ 5` (`:106`);
- `P.surface.firstOppCap_card_ge_four`, i.e. `|oppCap1| ≥ 4`
  (`ATail/ExactFourRobustCapExpansion.lean:286`);
- and, for the lower end, seven named strict-interior points
  (`Rigid221SourceHeavy.lean:4334`, cardinality-free) giving `|oppCap2| ≥ 9`.

Together these give

> `9 ≤ |oppCap2| ≤ |A| − 6`.

At `|A| = 17` that is `9 ≤ |oppCap2| ≤ 11` — exactly the trichotomy the parent
docstring records. At `|A| = 18` it is `9 ≤ |oppCap2| ≤ 12`; at `|A| = n` it is
`9 ≤ |oppCap2| ≤ n − 6`.

**The case count grows linearly with `|A|` and never closes.** Extending the
ladder one rung at a time is an infinite regress, not a route. Any admissible
route must handle all `|A| ≥ 18` by a single argument.

For contrast, the strata below are pinned: at `|A| = 15` every cap is forced to
exactly six (`ATail/ExactFifteenApexProfile.lean:134`) and every cap interior to
exactly four (`:158`). That pinning is what makes finite methods work, and it is
precisely what the ≥18 stratum lacks.

## 3. Why the active exact-17 apparatus provably cannot reach it

This is not a matter of effort or solver capacity. The target object is
exact-17 by construction:

```lean
structure SourceRealization (A : Finset ℝ²) where
  …
  boundary : Fin 17 → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
```

— `ATail/BlockerVExactSeventeenSourceNormalForm.lean:269`, with

```lean
theorem card_eq {A : Finset ℝ²} (r : SourceRealization A) : A.card = 17
```

at `:290`. Every CNF export, PIQD job, DRAT/LRAT certificate, and Lean-owned
successor child in the exact-17 chain is stated against this type. A terminal
UNSAT on any of them therefore yields a statement about carriers of cardinality
exactly seventeen. No quantity of solver work on that chain can produce evidence
about `|A| ≥ 18`.

Note also that the exact-17 sibling is **itself still open**: its `hexactCover`
arm is a bare `sorry` at `Rigid221SourceHeavy.lean:11874`. The ≥18 leaf is not
waiting on the completion of a working sibling route; both arms are open.

## 4. What is available in the context

Verified present at the sorry:

| Item | Source | Note |
|---|---|---|
| `R.minimal : D.Minimal` | `…/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:47` | global cardinal minimality |
| `D.Minimal` definition | `U1TwoShortCapReduction.lean:158` | `∀ B` nonempty convex K4, `D.A.card ≤ B.card` |
| `not_isRemovableVertex_of_minimal` | `U1TwoShortCapReduction.lean:165` | minimality ⟹ no removable vertex |
| `smaller_counterexample_of_removable` | `P97/SmallerCounterexample.lean:32` | descent glue |
| `R.noM44` | `OriginalUniqueResidualDispatch.lean:48` | excludes the `IsM44` branch |
| `_hnextRowPhysicalHits` | `Rigid221SourceHeavy.lean:11899` | cardinality-independent; producer `:4769` takes no cardinality hypothesis |
| `|oppCap2| ≥ 9` | re-derivable from `…_namedSeven` `:4334` | cardinality-free |

**Minimality is in scope but does not descend in `|A|`.** `CounterexampleData`
itself carries no minimality field (`U1TwoShortCapReduction.lean:83`); the
residual `R` supplies it. Formally a route may contradict `R.minimal` by
producing a removable vertex or a strictly smaller convex K4 set. In practice
this surface has already been audited and the answer recorded — see §5.
Do not treat `R.minimal` as an unexplored descent route.

### The monotone toolkit

The single mechanism in this repository that strengthens as `|A|` grows is the
**blocker-fiber pigeonhole**: every designated-blocker fiber holds at most four
sources, so a `k`-colouring of the sources outside one fiber yields a
monochromatic 5-set once `|A|` is large enough. Reachable instances:

- `ATailSurvivalCover.actualBlockerFiber_card_le_four` — `ATail/SurvivalCover.lean:86`
- `ATailSurvivalCover.exists_pair_distinct_actualBlockers_of_five_le_card` — `:152`
  (the reusable core every downstream pigeonhole calls)
- `…secondApexCommonDeletionPacket_of_card_ge_fourteen` — `:243` (two-colour,
  needs `14 ≤ |A|`, holds a fortiori at ≥18)
- `qBlockerFiber_card_le_four` — `ATail/AnchoredDoubleDeletionProducer.lean:166`

`Rigid221SourceHeavy.lean:49` already has `open ATailSurvivalCover`, so these
names are in scope at the sorry.

## 5. What is NOT available

Each entry below was checked; each is a dead end, and recording why is the point
of this document.

- **No constant upper bound on any cap.** The only upper bounds are
  `|oppCap2| ≤ |A| − 6` (§2) and `m + 4 ≤ C(|A| − m, 2)`
  (`P97/CapSelectedRowCounting.lean:646`); both grow with `|A|`. The one
  constant bound, `surplus_card_le_six_of_convexIndep_K4` (`:832`), requires
  `S.IsM44`, which `R.noM44` explicitly excludes.
- **The Dumitrescu counting obstruction is anti-monotone.** `counting_arithmetic`
  (`P97/CountingArithmetic.lean:26`) squeezes `6n ≤ iCount ≤ (11n² − 18n)/12`,
  which closes only for `n ≤ 8`. At `n = 18` the two bounds differ by 216. The
  tool is vacuous here, structurally and not by accident.
- **`pentagonOffClassBlocker_largeCard_threeColor_pair` closes nothing.**
  `Rigid221SourceHeavy.lean:13286` is the sharpest cardinality-monotone statement
  on the spine — a three-colour pigeonhole against the fiber-4 bound, using
  `17 ≤ |A|` only to obtain `13 ≤ |outside|` at `:13379`. Its proof body
  (`:13328`–`:13426`) projects only `Q.hxvA` and `Q.huXvRow`, both of which are
  fields of the BlockerV residual as well (`:3527`, `:3528`), so generalizing its
  hypotheses to reach this branch is a statement-generality edit, not
  mathematics. **However, a corpus-wide search finds it has zero consumers**, as
  does its companion `pentagonOffClassBlocker_biSurvival_commonDeletionRectangle`
  (`:13432`). Both are orphan producers. Porting them would add reachable-but-unconsumed
  lemmas and close nothing. The same holds for its own branch: the OffClass arm
  `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
  is an active anchor and is open.
- **`MDBlockerClosed.card_le_four_mul_card_blockerImage` is not importable.**
  `lean/scratch/md-blocker-closed-bank/MDBlockerClosed.lean:381` is sorry-free
  and elaborates with core axioms only, but `lean/scratch/` is not a `lean_lib`
  root and the directory name is not a legal Lean identifier, so no `.olean` is
  ever produced. It is the global/image form of the fiber pigeonhole and is
  strictly stronger than the on-spine per-anchor version (it bounds fibers at
  arbitrary, possibly unattained centres). At `V = A` it yields "at least
  `⌈|A|/4⌉` distinct blocker centres" — but that conclusion has **no consumer
  anywhere in the tree**, so relocating the file would not by itself create a
  route. {{NEEDS_PROOF}} whether it typechecks against the live interfaces after
  relocation; no Lean build of a relocated copy has been run.
- **`seven_le_outside_two_selected_supports_card`** (`ATail/SevenSourcesOutsideTwoShells.lean:24`)
  is monotone in substance but is an orphan module reachable from no `lean_lib`
  root, and hard-codes its threshold at 15 rather than stating `|A| − 8`, so the
  slack at ≥18 is discarded by the statement itself.
- **Minimality on this surface is a cap-lower-bound engine, not a descent.**
  This is a recorded negative result, not an open question. Commit `f41f0e34`
  (2026-07-25, "audit(atail): minimality on this surface is a cap-lower-bound
  engine") found that `D.Minimal` is discharged here by exactly three mechanisms
  — no-removable-vertex, proper-subset closure, and the global finite-deletion
  core (`ATail/GlobalMinimalDeletion.lean:32`, `:101`, `:143`) — and that **every
  one produces a cap lower bound**, which the cap-sum identity converts into an
  `|A|` lower bound, loosening every packing inequality it touches. The
  machinery minimizes a *deletion set at a fixed centre*, never the carrier.
  `docs/dead-ends.md:422` records the complementary finding: no additive-scalar
  monovariant is well-founded on the escape recursion, and all four candidate
  monovariants fail. Genuine cardinality descent occurs on the P97 spine in
  exactly one place — `Nat.strong_induction_on` at
  `P97/UniversalProblem97.lean:71` — which is the circularity of §6.
- **No unbounded stratum has ever been closed in this repository.** Every
  `N ≤ |A|` obligation that left the frontier was either a coordinator that
  peeled one exact stratum and forwarded `N+1 ≤ |A|`, or a producer whose
  conclusion is a cardinality bound or a disjunction rather than `False`. The
  three commits that created this family are all dated 2026-08-07 — `18018288`
  (created `…_card_ge_sixteen`), `9548724d` (`…_card_ge_seventeen`), `2f99e274`
  (`…_card_ge_eighteen`) — each closing one exact stratum and creating the next
  tail. `FiniteN11Closure` remains the highest unconditionally closed
  cardinality. History searches for "unbounded", "general-cardinality" and
  "cardinality-independent" return zero commits.
- **The E1 cap-interior squeeze does not transfer here.** Commit `c8b65fba`
  records that the sharp per-row `≤ 1` bound requires the blocker cap index to
  differ from the class apex index; in the pentagon both are `oppIndex2`.
  Commit `ed6d932f` separately records that no general-`n` family refutes the
  pinned five-cycle, and that the tree has class-card and interior lower bounds
  but no upper bound on class-meets-interior.
- **The general-`n` registries offer nothing.** Both legacy censuses record
  verbatim that the count of "theorems genuinely quantified by ambient `n`" is
  **zero** (`certificates/erdos97_legacy_general_n_mining.md`,
  `certificates/erdos_general_theorem_p97_mining.md`; see
  `docs/general-n-certificate-bank-mining-2026-07-09.md`). Treat every sibling-bank
  statement as unbuilt and of unknown current axiom status; the mining document
  itself records build failures in two of the three sibling repositories.

## 6. Circularity constraint

`RemovableVertexOfLargeStatement` (`P97/RemovableVertexAxiom/Base.lean:53`) says
that every nonempty convex K4 set with `|A| > 9`, given the strong-induction
hypothesis that no smaller counterexample exists, admits a removable vertex. Its
module docstring splits the proof three ways and assigns this branch its
mechanism: "closing the config-level no-`IsM44` branch by descent." `R.noM44`
places `card_ge_eighteen` in exactly that branch.

**`RemovableVertexOfLarge` must not be cited to close `card_ge_eighteen`.** The
≥18 leaf is an interior node of that statement's own proof; citing it is circular.

What *is* legitimately available is the weaker consequence already banked on the
spine: construct a removable vertex, or a strictly smaller convex K4 set,
**directly** in the ≥18 context, and discharge via
`not_isRemovableVertex_of_minimal` or `smaller_counterexample_of_removable`.

## 7. The required producer

A route must deliver one of the following. Both are stated so that a candidate
can be checked against them without re-deriving this document.

**(R1) A cardinality-independent incidence producer.** This is the only shape
with a working precedent in this repository.

`pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_false_of_tetrahedron_incidences`
(`Rigid221SourceHeavy.lean:15406`) and its sibling `…_xvDeletion_…` (`:12989`)
carry **no cardinality hypothesis at all**, and both are core-axiom-clean. From
five cross-centre incidences they force a planar four-point equidistant
tetrahedron and conclude `False`. Their metric kernel is
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`
(`P97/U5GlobalIncidenceQDeletedTetrahedron.lean:23`). Because they quantify over
an arbitrary carrier, they eliminate their subcases at every cardinality
including `≥ 18`.

What is missing is their **producer**: nothing supplies the five incidences in
general. The complementary "missing incidence" subcases are themselves open
obligations (`Rigid221SourceHeavy.lean:16021`, `:16113`). The same family of
cardinality-independent terminals exists in the Kalmanson schemas
(`ATail/KalmansonThreeEqualitySchemas.lean:741` and following), and is reachable
today only through an exact-`n` coverage theorem — which is precisely the half
that fails at ≥18.

So the required deliverable is: **from the pentagon BlockerV residual context,
with no upper bound on `|A|`, produce the cross-centre incidence data that an
existing cardinality-independent terminal consumes.** A candidate must name the
terminal it feeds and map its hypotheses one by one.

**(R2) A carrier upper bound.** Prove `D.A.card ≤ 17` in this residual context,
making the leaf vacuous. {{NEEDS_RESEARCH}} — no mechanism for this is visible.
By the cap-sum identity it would require bounding all three caps above
simultaneously, and §5 records that no constant cap bound exists outside the
`IsM44` branch that `R.noM44` excludes.

**Ruled out: descent via `R.minimal`.** See §5. The audit of 2026-07-25
(`f41f0e34`) established that this surface's minimality machinery yields cap
lower bounds only. A route proposing carrier descent must first refute that
audit, not merely cite the availability of `R.minimal`.

### Relation to existing plan language

The closure plan already states this requirement one rung lower, for the parent
`17 ≤ |A|` residual, and never carries it down to the ≥18 child:

- `docs/computational-closure-plan-2026-07-28.md:8450` lists the three
  admissible next results, the third being "a cardinality-independent
  producer/lift that bypasses exact-17";
- `:8605` — "Universal closure of the `17 ≤ |A|` residual additionally needs a
  cardinality-independent producer or lift";
- `:6040` (workstream table) — "reject any claimed uniform closure lacking the
  general-cardinality lift";
- `:2414` — "A finite exact-cardinality certificate is likewise only an
  exact-cardinality theorem until a deletion/minimality or bounded-core lift is
  proved."

This record carries that requirement down to the child it now governs, and adds
the evidence in §3 and §5 that fixes which lifts are already refuted.

Any candidate producer must additionally be checked against the reuse preflight
in the `lean-usage` skill: exact current statement, import reachability from
`Rigid221SourceHeavy.lean`, kernel axiom closure, hypothesis-by-hypothesis map,
and named immediate consumer.

## 8. Measure and fan-out

Coordinator-interface frontier: one child, `18 ≤ |A|`, with immediate constructor
fan-out one. This document does not change the frontier — it adds no obligation,
splits nothing, and closes nothing.

A future split of this leaf is admissible only under the standing rule: proved
exhaustive, every new leaf on-spine and wired to its consumer, every branch
strictly narrowing the recorded measure. **Splitting `≥18` into `= 18` and `≥19`
does not satisfy that rule**, because §2 shows the resulting measure does not
strictly decrease — the case count grows.

## 9. Evidence status

**CONJECTURED / OPEN.** Nothing here is proved. §2, §3, §4 and §5 are source
audit: statements, line numbers, and structural facts read from the current tree.
§7 is a specification of required work, not a claim that the work is possible.

The honest summary is that the ≥18 stratum is architecturally unlike every other
open leaf on this frontier. All others are finite or exact strata within reach of
the CEGAR apparatus. This one is reachable by no existing method in the
repository. Every cardinality-monotone tool that exists is either an orphan
producer with no consumer, or already consumed at a lower threshold; and the two
routes a reader would reach for first — extend the ladder, or descend via
minimality — are refuted here by §2 and by the 2026-07-25 audit respectively.

The one template that does work is the cardinality-independent terminal (§7 R1),
and its producer side is unbuilt. That is the whole of the required mathematics.

## 10. Verification log

Checked directly against the tree at `d25317ac` plus the working tree of
2026-08-16:

- ladder rungs and the parent split body — `Rigid221SourceHeavy.lean:11827`,
  `:11878`, `:11920`, `:11951`–`:11999`, `:12001`;
- `18 ≤ D.A.card` occurrence count on the spine — 1 (the sorry) plus the `omega`
  that produces it at `:11992`;
- cap-sum identity and the `≥5` / `≥4` lower bounds yielding `|oppCap2| ≤ |A| − 6`;
- `SourceRealization.boundary : Fin 17 → ℝ²` and `card_eq` —
  `BlockerVExactSeventeenSourceNormalForm.lean:269`, `:290`;
- the open `hexactCover` arm — `Rigid221SourceHeavy.lean:11874`;
- `D.Minimal`, `R.minimal`, `not_isRemovableVertex_of_minimal`;
- three-colour theorem body extent `:13328`–`:13426`, its two `Q.` projections,
  the matching BlockerV fields at `:3527`/`:3528`, and its **zero** consumers;
- prior-coverage mentions at plan `:12715` and spec `:98`.

Established by delegated read-only audit and reproduced here with citations, but
**not** re-checked line by line by the author of this document: the axiom
measurements in §5 and the precedent table behind §5 and §7 (including the
`f41f0e34`, `c8b65fba`, `ed6d932f` commit findings, the `dead-ends.md:422`
monovariant result, the plan quotations at `:2414`, `:6040`, `:8450`, `:8605`,
and the git-history sweeps). Treat these as sourced claims to verify before
relying on them in a proof, per the standing reuse preflight.

**No Lean build was run for this document.** It edits no Lean source and asserts
no build state. The `#print axioms` results quoted in §5 were measured by the
delegated audit, not by this lane.

## 11. Required closure-plan insertion

The rigor gate is satisfied by the active closure plan pointing at this record.
`docs/computational-closure-plan-2026-07-28.md` is currently carrying a large
volume of another lane's uncommitted work, so this lane does not edit it. A plan
owner should land the following paragraph verbatim:

> **card-≥18 BlockerV residual.** The unbounded continuation
> `false_of_…_deletedRowBlockerOffClass_card_ge_eighteen`
> (`Rigid221SourceHeavy.lean:11878`) has no route. The exact-17 apparatus cannot
> reach it: `SourceRealization` carries `boundary : Fin 17 → ℝ²` and proves
> `A.card = 17`, so every CNF, PIQD job and certificate in that chain speaks only
> about exact seventeen. Extending the cardinality ladder rung by rung does not
> terminate — the cap bound is `9 ≤ |oppCap2| ≤ |A| − 6`, so the case count grows
> linearly and the recorded measure does not strictly decrease. Descent via
> `R.minimal` is refuted for this surface by the 2026-07-25 audit (`f41f0e34`):
> the minimality machinery here yields cap lower bounds, not carrier descent.
> This carries down to the ≥18 child the general-cardinality-lift requirement
> already stated for the parent `17 ≤ |A|` residual at `:8450` and `:8605`. The
> one working template is the cardinality-independent terminal — the
> tetrahedron-incidence family at `Rigid221SourceHeavy.lean:15406` and `:12989`
> takes no cardinality hypothesis and is core-axiom-clean — and its producer is
> unbuilt. Full coverage, context, dead ends and the two admissible producer
> shapes are in `docs/specs/p97-card-ge-eighteen-coverage-route-v1.md`. Status:
> OPEN, no route. `RemovableVertexOfLarge` must not be cited against this leaf —
> the leaf is interior to that statement's own proof.
