# `lateFirstApexSystem` and `outsideFirstApexFiber` — definitions and API

Source-read reference, anchored at commit `0cec41a978063497b92751ad5d932f4cf99b7baa`
(2026-08-20).  Anchors re-verified at that commit.  Line numbers and signatures are read from source at that commit
and were re-verified against it; they are **not** kernel-confirmed by a fresh
elaboration in the session that produced this note.  Re-check before relying on
an anchor.

All three carrying production files scan clean for `sorry`.

---

## `lateFirstApexSystem`

**File:** `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:48`
**Namespace:** `Problem97.ATailUniqueFourLateChoiceTerminalScratch`

```lean
/-- Choose the first apex as the actual blocker for every source in the exact
four-point first-apex radius class. -/
noncomputable def lateFirstApexSystem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    CriticalShellSystem D.A :=
  H.overrideExactSelectedClass (firstApex_mem_A S) (frontier_radius_pos F)
    R.class_card_eq_four R.every_class_member_blocks
```

It is one application of `CriticalShellSystem.overrideExactSelectedClass`
(`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1315`), which rebinds
`shellAt q` to `center` exactly on `SelectedClass A center radius` and leaves
it unchanged off that class:

```lean
noncomputable def overrideExactSelectedClass
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {center : ℝ²} {radius : ℝ}
    (hcenter : center ∈ A) (hradius : 0 < radius)
    (hcard : (SelectedClass A center radius).card = 4)
    (hblocked : ∀ q : ℝ², q ∈ SelectedClass A center radius →
      ¬ HasNEquidistantPointsAt 4 (A.erase q) center) :
    CriticalShellSystem A
```

The four side conditions are supplied from `R` and `F`: apex membership
(`firstApex_mem_A S`), positive radius (`frontier_radius_pos F`),
`R.class_card_eq_four`, and `R.every_class_member_blocks`.

### API

Every entry below is public, in the same file, with `R` explicit and the
surrounding data implicit.

| Declaration | Line | Statement |
|---|---|---|
| `lateFirstApexSystem_centerAt_eq` | 86 | `hsourceA : source ∈ D.A`, `hsourceClass : source ∈ SelectedClass D.A S.oppApex1 radius` → `(lateFirstApexSystem R).centerAt source hsourceA = S.oppApex1` |
| `lateFirstApexSystem_support_eq_class` | 99 | same hypotheses → `((lateFirstApexSystem R).selectedAt source hsourceA).toCriticalFourShell.support = SelectedClass D.A S.oppApex1 radius` |
| `lateFirstApexSystem_frontierPair_normalForm` | 154 | four-way conjunction: `centerAt F.pair.q` and `centerAt F.pair.w` both equal `S.oppApex1`, and both complete supports equal `SelectedClass D.A S.oppApex1 radius` |
| `lateFirstApexSystem_centerAt_eq_iff_mem_class` | 175 | `hsourceA : source ∈ D.A` → `(lateFirstApexSystem R).centerAt source hsourceA = S.oppApex1 ↔ source ∈ SelectedClass D.A S.oppApex1 radius` |
| `lateFirstApexSystem_class_blockers_eq` | 210 | two sources, both in `D.A` and both in the class → their `centerAt` agree |

`lateFirstApexSystem_centerAt_eq_iff_mem_class` is the load-bearing member.
It is the `↔` recording that the override adds no hidden sources at the first
apex, and it is the lemma `outsideFirstApexFiber` reasoning routes through.

Sibling in the same file: `lateFirstApexFrontier` (line 58) rebases the
geometric frontier onto the late system without changing its retained pair or
either apex-deletion split.

---

## `outsideFirstApexFiber`

**File:** `lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:79`
**Namespace:** `Problem97.ATailExactFourPhysicalConsumer`

```lean
/-- Sources outside the exact first-apex blocker fiber. -/
noncomputable def outsideFirstApexFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Finset (CarrierVertex D.A) :=
  let Hlate := lateFirstApexSystem R
  Finset.univ \ actualBlockerFiber Hlate
    ⟨F.pair.q, F.pair.q_mem_A⟩
```

`CarrierVertex A` is a local `abbrev` for `CriticalShellSystem.CarrierVertex A`.
`actualBlockerFiber` is at `lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean:40`:

```lean
noncomputable def actualBlockerFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A) :
    Finset (CriticalShellSystem.CarrierVertex A) :=
  Finset.univ.filter fun source =>
    H.blockerVertex source = H.blockerVertex anchor
```

So `outsideFirstApexFiber R` is the set-difference complement, taken in the
late system, of the blocker fiber of the retained frontier point `F.pair.q`.

### Derived Finsets, same file

```lean
/-- An outside source is bad when neither retained singleton deletion
preserves K4 at its actual late blocker. -/
noncomputable def badOutsideSources … : Finset (CarrierVertex D.A) :=       -- line 90
  let Hlate := lateFirstApexSystem R
  (outsideFirstApexFiber R).filter fun source =>
    ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        (Hlate.centerAt source.1 source.2) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        (Hlate.centerAt source.1 source.2)

/-- Outside sources at which at least one retained singleton deletion
survives at the actual late blocker. -/
noncomputable def goodOutsideSources … : Finset (CarrierVertex D.A) :=      -- line 104
  outsideFirstApexFiber R \ badOutsideSources R
```

### API

| Declaration | File : line | Statement |
|---|---|---|
| `seven_le_outsideFirstApexFiber_card` | `ExactFourPhysicalConsumer.lean:342` | `7 ≤ (outsideFirstApexFiber R).card` |
| `badOutsideSources_card_le_two` | `ExactFourPhysicalConsumer.lean:229` | `(badOutsideSources R).card ≤ 2` |
| `five_le_goodOutsideSources_card` | `ExactFourPhysicalConsumer.lean:373` | `5 ≤ (goodOutsideSources R).card` |
| `outsideFirstApexFiber_centerAt_ne_firstApex` | `ExactFourRobustCapExpansion.lean:453` | `hsource : source ∈ outsideFirstApexFiber R` → `(lateFirstApexSystem R).centerAt source.1 source.2 ≠ S.oppApex1` |
| `b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass` | `FrontierLiveClosure/B1Live.lean:1394` | `hnot : source.1 ∉ SelectedClass D.A S.oppApex1 radius` → `source ∈ outsideFirstApexFiber R` |

### Membership directions are split across files on purpose

The introduction rule (`source ∉ class → source ∈ outsideFirstApexFiber`)
exists privately in two places:

- `ExactFourRobustCapExpansion.lean:637` — `private theorem mem_outsideFirstApexFiber_of_not_mem_firstClass`
- `ExactFourPhysicalConsumer.lean:111` — `private theorem source_not_mem_firstClass_of_mem_outside`

`B1Live.lean:1394` re-exposes it publicly, and its own doc-comment states why:
the reusable robust-cap ingress keeps these implications private in its
implementation file, and the B1 live-source branch needs the source-clean form
before it can consume that ingress.

Consequence for a caller outside those files:

- **introduction** — use `b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass`;
  it is currently the only public route.
- **elimination** — use `outsideFirstApexFiber_centerAt_ne_firstApex`.

---

## Reuse caution: scratch duplicates

Both names are also defined under `scratch/`, with different statements.  Import
the production paths above, not these:

| Path | Line | Note |
|---|---|---|
| `scratch/atail-force/unique4-late-choice-terminal/UniqueFourLateChoiceTerminal.lean` | 48 | copy of `lateFirstApexSystem` plus the same five lemma names |
| `scratch/atail-force/unique4-source-closer/ExactFourSurvivalCover.lean` | 79 | copy of `outsideFirstApexFiber`; carries `seven_le_outsideFirstApexFiber_card` at line 310 |
| `scratch/atail-force/unique4-multicenter-occurrence/UniqueFourMulticenterOccurrence.lean` | 50 | separate `outsideFirstApexFiber`; carries only the **weaker** `six_le_outsideFirstApexFiber_card` at line 59 |

The multicenter copy is the one most likely to mislead: same name, weaker
cardinality bound.


---

## Addendum — what places a point in the first-apex class

Added 2026-08-20 after a follow-up question.  Anchors re-verified at
`0cec41a9`.

### The membership is structure data, not a lemma

`SelectedClass A s d` is `A.filter (fun q => dist s q = d)`
(`P97/WitnessPacketInterface.lean:59`).  First-apex-class membership for the
retained frontier pair is carried **as a field of `CriticalPairFrontier`**
(`P97/ATail/CriticalPairFrontier.lean:568`, via its `pair` field), in unfolded
form:

```lean
q_mem_marginal : q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
w_mem_marginal : w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
```

That is first-apex-class membership modulo two things: the `dist` arguments are
flipped relative to `SelectedClass` (hence `dist_comm` in every proof below),
and the surplus cap is removed.

Two further distinguished points get the same treatment as **fields of
`OriginalUniqueFourResidual`**
(`…/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43`, fields at
lines 59 and 62):

```lean
interior_q_mem : interior_q ∈ SelectedClass D.A S.oppApex1 radius ∩
  S.capInteriorByIndex S.oppIndex1
interior_w_mem : interior_w ∈ SelectedClass D.A S.oppApex1 radius ∩
  S.capInteriorByIndex S.oppIndex1
```

plus the universal `every_class_member_blocks : ∀ x : ℝ², x ∈ SelectedClass
D.A S.oppApex1 radius → …` (line 54).  The same shape recurs in
`FirstApexUniqueRadiusExactFourResidual`
(`P97/ATail/FirstApexUniqueRadiusResidual.lean:121`) and in the private
`SurvivingPair` (`P97/ATail/FirstApexExactFiveInteriorFrontier.lean:96`).

**Practical consequence:** reach `q`/`w` membership by field projection from the
frontier, and `interior_q`/`interior_w` membership by field projection from the
residual.  No lemma is required for either.

### Five duplicate lemma copies, one public

Every copy below has the identical statement `F.pair.q ∈ SelectedClass D.A
S.oppApex1 radius` (and the `w` twin) and the identical three-line proof —
unfold `q_mem_marginal` as a `Finset.mem_sdiff`, take the filter component,
close with `mem_selectedClass.mpr` under `dist_comm`.  They are thin
re-exports of the frontier field, not independent content.

| Declaration | Location | Visibility |
|---|---|---|
| `frontier_pair_q/w_mem_firstApexClass` | `…/Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:135,144` | **public** |
| `q/w_mem_firstApex_class` | `…/UniqueArmRouteAudit/UniqueArmDeletionNormalForm.lean:42,51` | private |
| `q/w_mem_firstApex_class` | `P97/ATail/FirstApexUniqueRadiusResidual.lean:42,51` | private |
| `frontier_pair_q/w_mem_firstClass` | `P97/ATail/BiApexRobustCapBounds.lean:77,86` | private |
| `pair_q/w_mem_firstClass` | `P97/ATail/PhysicalSecondApexSwap.lean:136,145` | private |

Depend on the public pair.  The other four are local re-derivations and are a
dedup candidate.

### The apexes

`S.oppApex1` is the **center** of the class, not a member.  Membership would
need `dist oppApex1 oppApex1 = radius`, i.e. `radius = 0`, against
`frontier_radius_pos F : 0 < radius`
(`…/UniqueArmRouteAudit/UniqueArmDeletionNormalForm.lean:35`, projecting
`CriticalPairFrontier.radius_pos`).  Rigor label: this is a sound informal
derivation from source-read definitions plus `dist_self`.  It is **not** a
declaration in this repository and was not elaborated — do not cite it as
PROVEN.

For `S.oppApex2`: a multiline search over `lean/` and `scratch/` for a
membership assertion into `SelectedClass … S.oppApex1 …` found none naming
`oppApex2`, in either direction.  Rigor label: EMPIRICAL search result over
those two trees with that pattern, not a proof of absence.  It would miss
membership routed through a `let`-bound or otherwise abbreviated class.  A
plain literal grep is **not** sufficient here — statements wrap across lines in
this codebase, and a single-line pattern demonstrably misses real hits.

Only carrier membership exists for apexes (`S.oppApexᵢ ∈ D.A`), re-proved
privately in roughly thirty files as `firstApex_mem_A` / `oppApex1_mem_A` /
`oppApex2_mem_A` and prefixed variants.  All are `private`; each consumer
re-derives by `interval_cases` on `S.surplusIdx`.
