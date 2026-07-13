# ERASE card-{10,11} classifier ladder — M2–M8 execution plan (2026-07-12)

> **Status update (2026-07-13):** this pre-stage plan has been fully executed.
> M1-M10, both native fleets, downstream wiring, and the exact-pin gate pass;
> the complete lane is pushed at `652fdfcb`. All pending/OPEN language below is
> historical sequencing, not current work.

Pre-stage of milestones M2–M8 of the ERASE card-{10,11} classifier
(`scratch/erase-classifier-design/DESIGN.md`). Plan only; **no `.lean` created
or modified, no `lake build` run** while M1 (the `#eval` STOP-gate in
`lean/Erdos9796Proof/P97/ErasedCertificate/ErasedNativeEvalGate.lean`) is still
under eval (PID 49093 confirmed running). This plan is written for the
**all-true** M1 outcome — the Python prestage killed 4680/4680 with 0 survivors
(`scratch/erase-m1-prestage/analysis_summary.txt`; smoke test PASS incl. the
endpoint 64/64 parity check). If M1 returns any `false` cell, the affected
`(family, c₀, support, deleted)` signatures drop out of the shard manifest (§M3)
and their consumer rows route to cut research instead; the rest of the plan is
unaffected.

All paths absolute. All committed decls cited `file:line` were read this
session from the working tree.

---

## 0. State of the consumer surface (verified, supersedes DESIGN §0 reconstruction)

`RemovableVertexAxiom/ErasedPinRowResiduals.lean` **exists and is git-tracked**
(496 lines, 20 `sorry`s) — DESIGN said it did not exist at HEAD. Its 20 theorems
are consumed by `Continuation.lean:445-486` (the P2 holes DESIGN cited at
`:312/:337` are gone — replaced by direct calls to these 20 theorems). The 2 P4
holes are live at `Continuation.lean:184` and `:212` (DESIGN cited `:183/:211`;
+1 line drift).

The 20 residual theorems (file `.../RemovableVertexAxiom/ErasedPinRowResiduals.lean`),
all with the identical hypothesis surface
`hne hconv hK4 hgt hMin {S} hM44 hend1 hend2 hpin1 hpin2 hcontain {x p} hx hp hpErase`:

| # | theorem | goal | (m,s,l,r) | side/cap |
|---|---|---|---|---|
| 1 | `right_row0013_residual_excluded` | `RightNonSurplusExactCountRowExcluded S x p 0 0 1 3` | 0,0,1,3 | R/oppIndex1 |
| 2 | `right_row0004_residual_excluded` | `… 0 0 0 4` | 0,0,0,4 | R (pure-surplus) |
| 3 | `right_row0112_residual_excluded` | `… 0 1 1 2` | 0,1,1,2 | R |
| 4 | `right_row0103_residual_excluded` | `… 0 1 0 3` | 0,1,0,3 | R |
| 5 | `right_row1012_residual_excluded` | `… 1 0 1 2` | 1,0,1,2 | R |
| 6 | `right_row1003_residual_excluded` | `… 1 0 0 3` | 1,0,0,3 | R |
| 7 | `right_row1111_residual_excluded` | `… 1 1 1 1` | 1,1,1,1 | R |
| 8 | `right_row1102_residual_excluded` | `… 1 1 0 2` | 1,1,0,2 | R |
| 9 | `right_row2002_residual_excluded` | `… 2 0 0 2` | 2,0,0,2 | R |
| 10 | `right_terminal2101_payload_residual_excluded` | `RightNonSurplusOneSidedTerminalPayloadExcluded S x p` | 2,1,0,1 | R (terminal) |
| 11 | `left_row0031_residual_excluded` | `LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1` | 0,0,3,1 | L/oppIndex2 |
| 12 | `left_row0040_residual_excluded` | `… 0 0 4 0` | 0,0,4,0 | L (pure-surplus) |
| 13 | `left_row0121_residual_excluded` | `… 0 1 2 1` | 0,1,2,1 | L |
| 14 | `left_row0130_residual_excluded` | `… 0 1 3 0` | 0,1,3,0 | L |
| 15 | `left_row1021_residual_excluded` | `… 1 0 2 1` | 1,0,2,1 | L |
| 16 | `left_row1030_residual_excluded` | `… 1 0 3 0` | 1,0,3,0 | L |
| 17 | `left_row1111_residual_excluded` | `… 1 1 1 1` | 1,1,1,1 | L |
| 18 | `left_row1120_residual_excluded` | `… 1 1 2 0` | 1,1,2,0 | L |
| 19 | `left_row2020_residual_excluded` | `… 2 0 2 0` | 2,0,2,0 | L |
| 20 | `left_terminal2110_payload_residual_excluded` | `LeftNonSurplusOneSidedTerminalPayloadExcluded S x p` | 2,1,1,0 | L (terminal) |

Goal shapes (unfolded, `Base.lean`):
- `RightNonSurplusExactCountRowExcluded S x p m s l r` (`Base.lean:6256`) =
  `S.moserCount p (dist p x)=m → S.sameCapCount S.oppIndex1 p (dist p x)=s →
  S.leftAdjCount S.oppIndex1 …=l → S.rightAdjCount S.oppIndex1 …=r → False`.
  **Not literally `False`** — the proof `intro`s the four count equations, which
  are exactly what pin the row's `(m,s,l,r)` cell. `Left…` mirrors on
  `S.oppIndex2`.
- `RightNonSurplusOneSidedTerminalPayloadExcluded S x p` (`Base.lean:8826`) =
  `S.RightOneSidedErasedPayload S.oppIndex1 p x (dist p x) → False`. The payload
  (`SurplusM44Packet.lean:6936`) unfolds to the exact `(2,1,0,1)` class:
  2 Moser, 1 same-cap `s`, 0 left-adj, 1 right-adj (= the erased `x`), card 4.
  `Left…` = `(2,1,1,0)`.

The count vocabulary (`SurplusM44Packet.lean:990/995/1001/1007`): `moserCount`,
`sameCapCount i`, `leftAdjCount i`, `rightAdjCount i`, all
`(SelectedClass A p radius ∩ …).card`. Adjacency indexed by cap `i`
(`oppIndex1` = right family, `oppIndex2` = left family).

`ErasedPinTriple A x p` (`WitnessPacketInterface.lean:198`) =
`0 < dist p x ∧ (((A.erase x).erase p).filter (dist p · = dist p x)).card = 3`;
converse to the exact 4-point selected class through `x` at `p`
(`exact_erased_pin_of_erasedPinTriple :248`).

---

## (a) M2 — `ErasedNativeClassifier.lean` skeleton

**File:** `/Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ErasedCertificate/ErasedNativeClassifier.lean`
**Namespace:** `Problem97.ErasedCertificate.ErasedNativeClassifier`
**Imports:** `Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier`,
`Erdos9796Proof.P97.Census554.CapSelectedFiniteCode`,
`Erdos9796Proof.P97.EndpointCertificate.GeneralMCardEleven` (for `intO1/intO2/intS/capS`).
`open Census554.CapSelectedNativeClassifier`, `open Census554.CapSelectedFiniteCode`.

**KEY DE-RISK:** the five parametric search defs already exist, written and
type-checking, inside the M1 module `ErasedNativeEvalGate.lean:53-120`. M2 = lift
them verbatim into this proof-bearing module (dropping the `#eval` driver,
`Cell`/`allCells`/`runGate`). They are parametrizations of committed decls, with
definitional parity asserted in-module (`c₀=1` vs committed `placementCheck`
line 222; `c₀=2` vs endpoint per module header) — a built-in R4 mitigation.

### Parametric search defs (copy-parametrized from `ErasedNativeEvalGate.lean`)

| decl | signature | origin |
|---|---|---|
| `variableCentersAt (c₀ : Nat) : List Nat` | `labels.filter (· != c₀)` | copy `EvalGate:53`; parametrizes committed `variableCenters` (`CapSelectedNativeClassifier.lean:308`) / `variableCentersRight` (`EndpointNativeClassifier.lean:50`) |
| `exactSeedOffCircleCoreAt (c₀) (roots) (pinned) : Bool` | center-literal fork | copy `EvalGate:62`; parametrizes `exactPinnedOffCircleCore` (`…Classifier.lean:215`, literal `1`) / `exactEndpointOffCircleCoreAt2` (`EndpointNativeClassifier.lean:56`, literal `2`) |
| `hasPrefixCoreAt (c₀) (rows) : Bool` | dup ∥ off-circle@c₀ ∥ perp ∥ convex5 | copy `EvalGate:72`; parametrizes `hasPrefixCore` (`…Classifier.lean:260`) / `hasPrefixCoreRight` (`EndpointNativeClassifier.lean:65`) |
| `allKilledAt (c₀) : Nat→List Row→List Domain→Bool` | DFS w/ `hasPrefixCoreAt c₀` | copy `EvalGate:85`; parametrizes `allKilled` (`…Classifier.lean:284`) / `allKilledRight` (`EndpointNativeClassifier.lean:77`) |
| `erasedPlacementCheckAt (c₀ support deleted : Nat) : Bool` | fixed row `⟨c₀,support⟩`, gate, restrict, search | copy `EvalGate:109`; parametrizes `placementCheck` (`…Classifier.lean:310`) / `endpointRightPlacementCheck` (`EndpointNativeClassifier.lean:117`) |

All detector cores `duplicateCenterCore`, `perpendicularBisectorCore`,
`convexFivePointCore` and all primitives (`localCandidateOK`, `candidateRows`,
`compatibleWith`, `restrictDomain`, `sortDomains`, `equalityClosure`,
`normalizedRoots`, `edgesEqual`) are the committed ones, imported, unforked. No
`unsafe`/`@[implemented_by]`/`@[extern]` enters (native_decide policy).

### Shell records (new; mirror `PinnedShellOK` / `EndpointLeftShellOK`)

`PinnedShellOK` (`CapSelectedFiniteCode.lean:218`) and `EndpointLeftShellOK`
(`GeneralMCardEleven.lean:407`) are the templates. Define **four** shell
predicates keyed by seed family, all `Prop`, over the committed `Label = Fin 11`
`PatternCode` vocabulary. Structure (DESIGN §3), for a seed center `c₀`, pin
label `pin`, deleted pivot `deleted`, and bucket signature `(m,s,l,r)`:

```
ErasedRowShellOK_<fam> (P : PatternCode) (blocker : Label → Label)
    (pin deleted : Label) (m s l r : ℕ) : Prop :=
  <c₀-membership> ∧                      -- P2R: c₀ ∈ intO1 ; P2L: intO2 ; P4U: c₀=0 ; P4S: c₀ ∈ intS
  pin ∈ intS ∧ pin ∈ row P c₀ ∧ pin ≠ c₀ ∧
  (row P c₀ ∩ moserLabels).card = m ∧    -- four bucket-count conjuncts,
  (row P c₀ ∩ sameCapLabels).card = s ∧  --   convention-bridged to the census
  (row P c₀ ∩ leftAdjLabels).card = l ∧  --   Fin 11 label sets (DESIGN §3.1 item 4)
  (row P c₀ ∩ rightAdjLabels).card = r ∧
  deleted ∈ intS ∧ deleted ∈ row P 0 ∧
  (∀ q, blocker q ≠ q ∧ q ∈ row P (blocker q)) ∧
  (∀ q ∈ row P c₀, blocker q = c₀) ∧
  blocker deleted ≠ c₀                   -- OMIT this conjunct for the P4U (c₀=0) family (DESIGN §3.1(7))
```

- 4 families: `ErasedRowShellOK_P2Right` (c₀ ∈ intO1={7,8}),
  `_P2Left` (c₀ ∈ intO2={9,10}), `_P4U` (c₀=0, no `blocker deleted ≠ c₀`),
  `_P4S` (c₀ ∈ intS={3,4,5,6}).
- The literal `row P c₀ = {…}` conjunct of the templates is **replaced** by the
  four bucket-count conjuncts (ERASE seeds are arbitrary 4-masks characterized by
  counts, not literal sets). Consequence for M4: the fixed-row identity is a
  *per-cell* `rowOfPattern P c₀ = ⟨c₀, s⟩` from `row P c₀ = labelsOfMask s`, not a
  single `native_decide +revert` (DESIGN §3 item 4). **New vs template.**
- The `moserLabels/sameCapLabels/leftAdjLabels/rightAdjLabels` label sets are the
  `Fin 11` census sets. NOTE the convention gap (DESIGN §3.1 item 4, "single most
  error-prone step"): `capS = {1..6}` includes Moser endpoints `v,w`, while the
  row `m`-bucket counts all of `{u,v,w}`. Pin the bridge with `decide`-checked
  label-set identities in M6, not here.

**Also in M2 (or a sibling `ErasedSeedPredicates.lean`):** the fixed-row builder
`erasedFixedRow (c₀ support : Nat) : Row := ⟨c₀, support⟩` (trivial; the seed is
already a raw mask, unlike `fixedPinnedRow`/`fixedEndpointLeftRow`).

**M2 gate:** `lake build Erdos9796Proof.P97.ErasedCertificate.ErasedNativeClassifier`
(single module; defs + `Prop` records only, no proofs beyond `rfl`-parity `example`s if desired).

---

## (b) M3 — placement shard manifest

**Dir:** `/Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ErasedCertificate/ErasedNativePlacements/`
**Namespace:** `Problem97.ErasedCertificate.ErasedNativeClassifier`
Convention: mirror `EndpointNativePlacements/` (one file per seed group, N
`native_decide` theorems each) and `CapSelectedNativePlacements/`
(`set_option maxHeartbeats 0 / maxRecDepth 100000 / linter.style.nativeDecide false`
per theorem). The eval superset domain (`ErasedNativeEvalGate.lean`) fixes the
per-center support counts:

| family | c₀ | pin-compat supports/center | deleted range | searches |
|---|---|---|---|---|
| P4U | 0 | 79 | `s ∩ intS` (per support) | 184 |
| P4S | 3,4,5,6 | 90 | `intS` (4) | 1440 |
| P2 | 7,8,9,10 | 191 | `intS` (4) | 3056 |
| | | | **total** | **4680** |

**Batching (the R1 dial).** Endpoint used one `native_decide` per single search
(64 total); ERASE's 4680 searches forbid that. Each `native_decide` folds a
support chunk with `List.all` (as the M1 `checkCell`/`allCells` fold already
does under `#eval`). Prestage node budget: median 4116, p99 28201, max 41767
nodes/search — a chunk of ~48 supports × 4 deleted ≈ 192 searches ≈ ≤8M kernel
nodes per replay, the tunable ceiling. **Default manifest (9 shard files, 28
`native_decide` theorems):**

| file | c₀ | theorems (each = `List.all` over a chunk) | searches/file |
|---|---|---|---|
| `P2C7.lean` | 7 | 4 chunks of ≤48 supports × `intS.all` | 764 |
| `P2C8.lean` | 8 | 4 | 764 |
| `P2C9.lean` | 9 | 4 | 764 |
| `P2C10.lean` | 10 | 4 | 764 |
| `P4SC3.lean` | 3 | 2 chunks of ≤45 × `intS.all` | 360 |
| `P4SC4.lean` | 4 | 2 | 360 |
| `P4SC5.lean` | 5 | 2 | 360 |
| `P4SC6.lean` | 6 | 2 | 360 |
| `P4UC0.lean` | 0 | 4 chunks over the 184 `(support,deleted)` cells | 184 |

Each theorem shape, e.g.:
`theorem erasedPlacementCheckAt_c7_chunk0 : ((c7chunk0Supports).all fun s => intS.all fun d => erasedPlacementCheckAt 7 s d) = true := by native_decide`
where `c7chunk0Supports : List Nat` is a literal sublist. **Independent /
parallel-dispatch units = the 9 files** (no cross-file deps; each imports only
`ErasedNativeClassifier`).

**Chunk-cover completeness (`decide`, kernel-pure preferred).** For the M5
dispatcher to extract a transported support, add one `decide` lemma per c₀:
`erasedCandidateSupportsAt c₀ = c₀chunk0 ++ c₀chunk1 ++ …` (the chunks partition
`(List.range 2048).filter (localCandidateOK c₀ 3 ·)`). Ranges over ≤2048 masks,
counting only — kernel `decide`, no `native_decide`. Put these in the dispatch
module.

**Dispatch module** `ErasedPlacementDispatch.lean` (mirror
`EndpointPlacementDispatch.lean:48` / `CapSelectedNativeClosureSound.placementCheck_of_interior:838`):
one theorem per family,
`erasedPlacementCheckAt_of_seed_<fam> : <c₀ ∈ set> → <support gate> → deleted ∈ intS → erasedPlacementCheckAt c₀ support deleted = true`,
proved by `List.all_eq_true` + the chunk-cover `decide` + `List.mem_filter` from
`localCandidateOK`. (Endpoint used `fin_cases … <;> simp_all [<32 theorems>]`;
ERASE case-splits c₀ over its small set but folds supports via `all_eq_true`
rather than `fin_cases`.)

**M3 gate (per shard):** `lake build …ErasedNativePlacements.P2C7` (etc.).
Dispatch gate after all shards: `lake build …ErasedPlacementDispatch`.

---

## (c) M4–M8 chain map (theorem names, mirror, axiom budget, gate)

### Axiom budget

`Lean.ofReduceBool` + `Lean.trustCompiler` enter **only** at the M3
`native_decide` shard theorems (28 of them) and, if the M4 mask roundtrip / M5
`variableCentersAt_nodup` cannot be discharged by kernel `decide`, at those.
Every M4/M5/M6/M7 transport theorem is ordinary Lean over the M3 booleans — no
new native surface. Final leaf axiom check (M10):
`proof-blueprint axioms <leaf>` must show only
`propext, Classical.choice, Quot.sound, Lean.ofReduceBool, Lean.trustCompiler`
(bv_decide standard; DESIGN §2.2). Prefer kernel `decide` for: the mask roundtrip
(§M4), `variableCentersAt_nodup`, and all chunk-cover lemmas.

### M4 — classifier soundness — `ErasedClassifierSound.lean`
Namespace `Problem97.ErasedCertificate.ErasedNativeClassifier`. Imports
`ErasedNativeClassifier`, `Census554.CapSelectedNativeClassifierSound`,
`Census554.CapSelectedNativeClassifierFacts`.

| new theorem | mirrors (file:line) | note |
|---|---|---|
| `maskOfFinset_labelsOfMask` (`∀ s<2048, maskOfFinset (labelsOfMask s) = s`) | `EndpointClassifierSound.lean:47/57` (`maskOfFinset_endpointLeftRow/RightRow`) | generic; `decide` preferred (native fallback) — **simpler** than template (no per-seed literal) |
| `rowOfPattern_eq_erasedFixedRow_<fam>` | `EndpointClassifierSound.lean:66/80` (`rowOfPattern_eq_fixedEndpointLeftRow`) | per-cell, from `row P c₀ = labelsOfMask s` |
| `localCandidateSpec_of_incidenceOK_erasedRowShellOK_<fam>` | `EndpointClassifierSound.lean:98/128`; pinned `CapSelectedNativeClassifierSound.lean:57` | consumes only `deleted ∈ row P 0`; `rcases` pattern per family |
| `rowOfPattern_mem_candidateRows_erased_<fam>` | `EndpointClassifierSound.lean:159/171`; pinned `:88` | verbatim shape |

Parallel with M3. Gate: `lake build …ErasedClassifierSound`.

### M5 — closure soundness — `ErasedClosureSound.lean`
Imports `ErasedClassifierSound`, `Census554.CapSelectedNativeClassifierCoverage`,
`Census554.CapSelectedNativeClosureSound`, `ErasedPlacementDispatch`.
**Fork once, parametric in `c₀`** (covers all 9 seed centers in one proof each).

| new theorem | mirrors (file:line) |
|---|---|
| `allKilledAt_eq_false_of_semanticTrace` | `EndpointClosureSound.lean:161` (`allKilledRight_…`); `CapSelectedNativeClassifierCoverage.lean:53` |
| `variableCentersAt_nodup / _lt_eleven / _ne_c₀` | `EndpointClosureSound.lean:305/308/313`; `Coverage.lean:196/199/204` |
| `erasedPlacementCheckAt_eq_false_of_no_semanticPrefixCore` | `EndpointClosureSound.lean:47/322`; `Coverage.lean:212` |
| `exists_semanticPrefixCore_of_erasedPlacementCheckAt` | `EndpointClosureSound.lean:133/408`; `Coverage.lean:299` |
| `exists_blockerSource_erased_<fam>` (`source := pin`) | `EndpointClosureSound.lean:436/450`; `CapSelectedNativeClosureSound.lean:752` |
| `exactSeedOffCircleCoreAt_sound` (param c₀) | `EndpointClosureSound.lean:466`; `CapSelectedNativeClosureSound.lean:616` |
| `row_eq_rowOfPattern_c₀_of_find?_eq_some` (param c₀) | `EndpointClosureSound.lean:499`; `CapSelectedNativeClosureSound.lean:738` |
| `closureCoreAlternative_of_hasPrefixCoreAt_erased` | `EndpointClosureSound.lean:516/576`; `CapSelectedNativeClosureSound.lean:765` |
| `closureCoreAlternative_of_incidenceOK_erasedRowShellOK_<fam>` (×4) | `EndpointClosureSound.lean:639/655`; `CapSelectedNativeClosureSound.lean:852` |

All four family finals target the **unchanged** `ClosureCoreAlternative P blocker`
(`CapSelectedFiniteCode.lean:472`) — seed-independent (transport-map headline 1).
After M3-dispatch + M4. Gate: `lake build …ErasedClosureSound`.

**R4 guard:** since `1 ∈ variableCentersAt c₀` for all ERASE seed centers
(c₀ ≠ 1), never reuse the committed center-`1`-keyed `hasPrefixCore`; the
parametric `hasPrefixCoreAt c₀` is mandatory. The eval-gate module header already
flags this.

### M6 — bridge staging / carrier — `ErasedBridgeAssembly.lean`
The geometry side (DESIGN §3.1). Independent of M3–M5; can start at G-A.

| step | producer | status |
|---|---|---|
| `CanonicalLabeling L` | `exists_boundaryBlocks_of_isM44_surplus_card_eq_six` (`CapSelectedGeometry.lean:531`) + `nonempty_canonicalLabeling` | **reused as-is** |
| carrier `F` | `exists_faithfulCarrierPattern_with_class` (`BridgeCarrier.lean:70`), `K` from `ErasedPinTriple`/exact class via `WitnessPacketInterface.lean:198/205` | reused; K-builder new per hole |
| `IncidenceOK (patternCode L F)` | `incidenceOK_patternCode` (`CapSelectedCarrierBridge.lean:1100`, needs `hcard6`) | **reused as-is** |
| bucket-count conjuncts (item 4) | new; pattern of `endpointLeft_row_one_eq` (`BridgeCarrier.lean:122`) + cap identities `surplusInterior_eq/oppInterior1_eq/oppInterior2_eq` (`CapSelectedGeometry.lean:145-151`); `decide`-pinned `capS` vs `{u,v,w}` label bridge | **new (error-prone)** |
| blocker system | mirror `exists_shellSystem_endpointBlocker_of_endpointEscapeLeft` (`BridgeAssembly.lean:240`); exactness `exactAt_endpointBlocker` (`BridgeAssembly.lean:119`) | new per family |
| final consumer | `false_of_closureCoreAlternative_of_canonical` (`BridgeAssembly.lean:326`) | **reused as-is** (inputs mention no endpoint data) |

Gate: `lake build …ErasedBridgeAssembly`.

### M7 — per-row consumers (card-11 arms) — fill sorries in
`ErasedPinRowResiduals.lean` (20) + `Continuation.lean:184/:212` (2 P4).
Whole-hole assembler mirrors `false_of_endpointEscapeLeft_cardEleven`
(`BridgeAssembly.lean:376`) end-to-end: card6 → labeling → carrier → shell →
`closureCoreAlternative_of_incidenceOK_erasedRowShellOK_<fam>` (M5) →
`false_of_closureCoreAlternative_of_canonical`. After M5+M6. See §(d) for the
m∈{5,6} split and which arm each row needs.
Gate: `lake build …RemovableVertexAxiom.ErasedPinRowResiduals` and
`…RemovableVertexAxiom.Continuation`.

### M8 — card-10 P2 lane — `ErasedCardTenProducer.lean`
Consumer `false_of_erasedPinFixedSeedRelaxedShape_pointClasses`
(`SurplusCOMPGBankGeometry.lean:10761`) + the **already-committed** per-row
seed-candidate lists (see §(d)/§(e)). No native surface (the bank DFS is already
kernel-checked upstream). Gate: `lake build …ErasedCardTenProducer`.

### M8-adjacent axioms
M6/M7/M8 add **no** native axioms. The only compiler-trust cost is the M3 (and
possibly M4-roundtrip) `native_decide`s plus whatever the committed bank pipeline
already carries under `false_of_erasedPinFixedSeedRelaxedShape_pointClasses`.

---

## (d) Consumer wiring plan (per residual + per P4 hole)

Each residual theorem's proof body:
```
intro hm hs hl hr                                   -- the four count equations (payload rows: intro the payload, extract its 4 counts)
have h6 := S.surplus_card_le_six_of_convexIndep_K4 hconv hK4 hM44   -- (CapSelectedRowCounting.lean:765)
have heq := hM44.surplus_card_eq                                    -- m + 5 = A.card (U1TwoShortCapReduction.lean:136 / Cap/PartitionFromMEC.lean:448)
-- ⇒ A.card ∈ {10,11}; rcases surplusCap.card = 5 ∨ = 6:
case card=11 (m=6):  M6 chain → ErasedRowShellOK_<fam> → M5 final → false_of_closureCoreAlternative_of_canonical
case card=10 (m=5):  M8 bank chain (per-row candidate list below)
```
Per-row glue = the count-to-cell selection: `hm hs hl hr` fix `(m,s,l,r)`, which
select both the M3 native cell (card-11 arm) and the bank candidate list (card-10
arm). No extra glue lemma beyond the M6 shell producer and the M8 producer.

**Card-11 arm (all 22 items):** discharged by the M2–M7 instrument. Seed center:
- Rows 1–10 (right): c₀ ∈ intO1 = {7,8}, family `P2Right`.
- Rows 11–20 (left): c₀ ∈ intO2 = {9,10}, family `P2Left`.
- P4 hole `Continuation.lean:184` (surplus-opposite apex, `p = S.oppositeVertexByIndex S.surplusIdx`): c₀ = 0, family `P4U` (`point_zero_eq_opposite`, `CapSelectedGeometry.lean:157`).
- P4 hole `Continuation.lean:212` (surplus interior): c₀ ∈ intS = {3,4,5,6}, family `P4S`.

**Card-10 arm (per residual):** consumer
`false_of_erasedPinFixedSeedRelaxedShape_pointClasses` needs
`hseed, hs, hv, hwMask, hprivate, hcard, hself, hno3, hcounts, hsep, hsearchSep`
(`SurplusCOMPGBankGeometry.lean:10761-10784`). The **per-row seed-candidate lists
already exist** (§(e)) — 18 of the 20 rows map to a committed
`erasedPinRow_ep_{right,left}_m…_s…_l…_r…_seeds_candidates` list, and the 2
terminals additionally have a **fully-assembled** row consumer
(`false_of_erasedPinRow_ep_right_m2_s1_l0_r1_relaxedShape_pointClasses`
`:10793`, `…_ep_left_m2_s1_l1_r0_…` `:10824`). M8's only new work is the
geometry producer discharging `hv/hwMask/hprivate/hcard/hself/hno3/hcounts/hsep/
hsearchSep` from the hole hypotheses at `A.card = 10` (mirror
`GeometryProducer.lean:12-25`), split per side.

Row-by-row card-10 disposition:

| rows | card-10 handling |
|---|---|
| #1,3–9,11,13–19 (16 count rows) | bank list exists; M8 producer + generic consumer `false_of_erasedPinFixedSeedRelaxedShape_pointClasses` |
| #10, #20 (terminals `2,1,0,1`/`2,1,1,0`) | bank **row consumer already built** (`:10793/:10824`); M8 producer only |
| #2 `(0,0,0,4)`, #12 `(0,0,4,0)` | **no card-10 arm needed** — pure-surplus rows need 4 surplus interiors; at card 10 `surplusInterior.card = 3` (`IsM44.surplusInterior_card_ge_three` gives ≥3, `=3` at m=5), so the m=5 case is a cheap count contradiction (DESIGN §4.1), consistent with the **absence** of `ep_*_m0_s0_l0_r4`/`_l4_r0` bank lists |

**P4 holes card-10 (m=5) — DEAD-END, deferred to M9 (Adam-gated).** The bank has
only `privateCenter ∈ {.Pw, .Pu}` seeds (P2 opp-cap centers); no `u`- or
`s_i`-centered seeds. The Route-B card-10 witnesses (`SO_t2_PuQ1`,
`SI_c-s1_Q2vPu`, DESIGN R3) are real, so the m=5 P4 case cannot be waved away.
M9 = new `u`/`s`-centered bank-seed generation (python) + DFS exclusion + bank
shards + producer wiring — new search compute behind gate **G-B (Adam sign-off)**.
**Flag these two `Continuation.lean:184/:212` holes as blocked-on-M9 for their
m=5 arm.**

**What closes at card 11 alone (i.e. by the M2–M7 instrument, no card-10 lane):**
- Both P4 holes' m=6 arm (fully closes them *at card 11*; m=5 → M9).
- All 20 residuals' m=6 arm.
- Rows #2 and #12 **fully** (m=5 arm is the trivial count contradiction).
So the classifier instrument alone leaves exactly: the m=5 arm of the other 18
residuals (→ M8, all machinery committed except the producer) and the m=5 arm of
the 2 P4 holes (→ M9, Adam-gated).

---

## (e) Risk register deltas (R5 — landed code vs DESIGN reconstruction)

Report, not paper over. Statement-level mismatches found:

1. **Goal is not literally `False`.** DESIGN §0/§4.1 say the 20 holes have goal
   `False`. Landed: `RightNonSurplusExactCountRowExcluded S x p m s l r`
   (`Base.lean:6256`, a 4-premise `→ False`) and
   `RightNonSurplusOneSidedTerminalPayloadExcluded` (`Base.lean:8826`,
   `Payload → False`). Consistent in spirit — the premises ARE the cell selector
   — but the proof must `intro` them; the terminal rows carry a *structure*, not
   count equalities (extract counts from `RightOneSidedErasedPayload`,
   `SurplusM44Packet.lean:6936`, which is exactly `(2,1,0,1)`).

2. **The 20-row list and exact `(m,s,l,r)` signatures are now known** (were
   `{{UNVALIDATED}}` in DESIGN R5). 9 count rows + 1 terminal per side; full table
   in §0/§(d). "Why 20 not 26": the 20 are the *remainder-dependent* rows
   (`RightNonSurplusRemainderRowsExcluded`, `Base.lean:8842`); the other 6 of the
   26 realizable are discharged non-residually upstream.

3. **Card-10 bank is far more complete than DESIGN §1.3/§4.2 states.**
   `SurplusCOMPGBankGeometry.lean` already commits **26 per-row seed-candidate
   lists** (`erasedPinRow_ep_{right,left}_m…_seeds_candidates`, 13+13) covering 18
   of the 20 residual rows, **plus 2 fully-assembled per-row consumers** for the
   terminals (`:10793`, `:10824`). DESIGN framed the card-10 per-row bank-coverage
   lemma as `{{NEEDS_PROOF}}` from scratch and characterized coverage only by the
   `privateCenter ∈ {.Pw,.Pu}` tally (660+660). Reality: seed enumeration + subset
   lemmas are committed; **only the geometry producer remains** for M8. The 2 rows
   with no bank list (`ep_right (0,0,0,4)`, `ep_left (0,0,4,0)`) are exactly the
   m=6-only pure-surplus rows — their absence is correct, not a gap. **Net: M8 is
   materially smaller than DESIGN sized it; M9 (P4 card-10) remains the real gap.**

4. **Continuation.lean hole topology changed.** DESIGN §0 cites P4 holes at HEAD
   `:183/:211` and P2 holes at `:312/:337`. Working tree: P4 holes at `:184/:212`
   (+1 drift); the P2 holes are **gone** — `Continuation.lean:445-486` now calls
   the 20 `*_residual_excluded` theorems directly, so the P2 obligations live as
   the 20 `sorry`s in `ErasedPinRowResiduals.lean`, not as Continuation holes.
   DESIGN's claim that `ErasedPinRowResiduals.lean` "does not exist at HEAD" is
   stale — it exists, is tracked, 496 lines.

5. **The M2 parametric defs already exist and type-check** inside the M1 module
   (`ErasedNativeEvalGate.lean:53-120`) — M2 is a lift, not a from-scratch write.
   The module also asserts definitional parity at `c₀=1` (committed
   `placementCheck`) and `c₀=2` (endpoint), a standing R4 mitigation. DESIGN
   treats these as M2-new.

6. **P4U `deleted` convention.** DESIGN §1.2/§3.1(7): P4-U may take `deleted := pin`
   (x ∈ row P 0 ∩ intS). The M1 gate instead ranges `deleted ∈ s ∩ intS` (a
   superset, `ErasedNativeEvalGate.lean:150-154`). No contradiction, but the
   `P4U` shell/coverage must consume whichever `deleted` the M6 producer supplies;
   pick one and keep it consistent across M5 dispatch and M6. Minor.

No mismatch found in: the count vocabulary (`SurplusM44Packet.lean:990-1010`
matches DESIGN §0), the card forcing chain (`CapSelectedRowCounting.lean:765/813`,
`Cap/PartitionFromMEC.lean:448`), the `ClosureCoreAlternative` target
(`CapSelectedFiniteCode.lean:472`), or the endpoint transport shape (mirrors as
DESIGN §3 describes).

---

## (f) Dispatch schedule (independent agent-sized packets)

Entry gate G-A = ERASE-P2 redraft landed (**done** — holes exist) + build freeze
lifted (pending) + **M1 PASS** (pending eval; all-true expected). G-B = Adam
approves card-10 P4 compute (M9 only).

Serial gate first, then fan out. One packet = one agent, one file/shard-group,
one single-file gate.

| # | packet | file(s) | dep | gate |
|---|---|---|---|---|
| P0 | **M2 classifier + shell records** | `ErasedNativeClassifier.lean` (+ optional `ErasedSeedPredicates.lean`) | M1 PASS | build `ErasedNativeClassifier` |
| P1 | M3 shard P2C7 | `ErasedNativePlacements/P2C7.lean` | P0 | build P2C7 |
| P2 | M3 shard P2C8 | `…/P2C8.lean` | P0 | build P2C8 |
| P3 | M3 shard P2C9 | `…/P2C9.lean` | P0 | build P2C9 |
| P4 | M3 shard P2C10 | `…/P2C10.lean` | P0 | build P2C10 |
| P5 | M3 shards P4S (×4) | `…/P4SC3..6.lean` | P0 | build each |
| P6 | M3 shard P4U | `…/P4UC0.lean` | P0 | build P4UC0 |
| P7 | M3 dispatch + chunk-cover | `ErasedPlacementDispatch.lean` | P1–P6 | build dispatch |
| P8 | M4 classifier soundness | `ErasedClassifierSound.lean` | P0 (parallel w/ P1–P7) | build |
| P9 | M5 closure soundness | `ErasedClosureSound.lean` | P7 + P8 | build |
| P10 | M6 bridge/carrier | `ErasedBridgeAssembly.lean` | P0 (parallel from G-A) | build |
| P11 | M8 card-10 producer (right) | `ErasedCardTenProducer.lean` (R side) | G-A (bank committed) | build |
| P12 | M8 card-10 producer (left) | same/sibling (L side) | G-A | build |
| P13a…P13t | M7 per-row consumers (20 rows) | fill `ErasedPinRowResiduals.lean` sorries | P9 + P10 + P11/P12 | build `ErasedPinRowResiduals` |
| P14 | M7 P4 card-11 holes (2) | fill `Continuation.lean:184/:212` (m=6 arm) | P9 + P10 | build `Continuation` |
| P15 | **M9 P4 card-10 (deferred)** | python seedgen + DFS + bank shards + producer | **G-B** + P11/P12 | build |
| P16 | M10 wiring + spine | — | all above | `proof-blueprint spine` + `proof-blueprint axioms <leaf>` |

Immediately fan-outable on M1 PASS: **P0**, then in parallel **P1–P6, P8, P10,
P11, P12** (P8/P10/P11/P12 need only committed deps or P0). P13* fan out
per-row after P9+P10+P11/P12. **P15 (M9) is the only Adam-gated / genuinely-new
compute packet — keep it visibly deferred.** Note that P13/P14/P16 edit
`RemovableVertexAxiom/{ErasedPinRowResiduals,Continuation}.lean`, released from
the ERASE-P2 redraft ownership by M10 time; do not touch them before then.

---

## Source index (verified this session)

Consumer: `RemovableVertexAxiom/ErasedPinRowResiduals.lean` (20 sorries);
`RemovableVertexAxiom/Continuation.lean:108/150/184/212/445-486`;
`RemovableVertexAxiom/Base.lean:6256/6266/8826/8842`;
`SurplusM44Packet.lean:990-1010/6936`; `WitnessPacketInterface.lean:198/248`.
Template chain: `Census554/CapSelectedNativeClassifier.lean:108/215/260/284/308/310`;
`Census554/CapSelectedNativeClassifierSound.lean:57/88`;
`Census554/CapSelectedNativeClassifierCoverage.lean:53/196/212/299`;
`Census554/CapSelectedNativeClosureSound.lean:616/738/752/765/825/838/852`;
`Census554/CapSelectedFiniteCode.lean:218/472`;
`Census554/CapSelectedGeometry.lean:145-151/157/531`;
`Census554/CapSelectedCarrierBridge.lean:1100`;
`EndpointCertificate/EndpointNativeClassifier.lean:50/56/65/77/117`;
`EndpointCertificate/EndpointNativePlacements/*.lean` (20 files, 64 theorems);
`EndpointCertificate/EndpointPlacementDispatch.lean:48/90`;
`EndpointCertificate/EndpointClassifierSound.lean:47/66/98/159`;
`EndpointCertificate/EndpointClosureSound.lean:161/305/436/466/499/516/576/639/655`;
`EndpointCertificate/GeneralMCardEleven.lean:407/424`;
`EndpointCertificate/BridgeCarrier.lean:70/122`;
`EndpointCertificate/BridgeAssembly.lean:119/240/326/376`;
`EndpointCertificate/GeometryProducer.lean:12-25`.
ERASE finite/bank: `ErasedCertificate/ErasedNativeEvalGate.lean:53-120/150-187`;
`SurplusCOMPGBankGeometry.lean:10761/10793/10824` + 26 `erasedPinRow_*_seeds_candidates`;
`CapSelectedRowCounting.lean:765/813`; `Cap/PartitionFromMEC.lean:448`;
`SurplusM44Packet.lean:3989` (`surplusInterior_card_ge_three`);
`U1TwoShortCapReduction.lean:136` (`surplus_card_eq`).
Prestage: `scratch/erase-m1-prestage/{analysis_summary.txt,REPORT.md}` (4680/4680
killed, smoke PASS incl. endpoint 64/64). M1 live: PID 49093.
