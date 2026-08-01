# Global theorem-bank search for the exact-11 v7 G3 round

Date: 2026-07-30

## Bottom line

No already-existing theorem-bank result closes the G3 formula, and no result
found states satisfaction of its exact stored DIMACS clause list.

The strongest exact reusable pieces are:

1. `exists_livePrefixPacket`, which produces the live exact-five packet,
   source-indexed blocker shadow, `CubeOk`, and cyclic-alternation semantics
   from the production residual at cardinality eleven;
2. `finalAssign_coverIndex_baseSat_of_cubeOk`, which turns `CubeOk` into a
   canonical satisfying assignment for the 207,969-clause Census554 base
   encoding; and
3. `allOccurrenceClauses_sat`, which satisfies the complete 190,080-clause v7
   cyclic-alternation occurrence family under the exact-five source valuation.

These pieces are not yet joined.  In particular, nothing found supplies a
single valuation satisfying the inherited 1,180,698-clause v6 prefix, proves
agreement among the cover assignment, source valuation, and the prefix's
auxiliary/Tseitin variables, or identifies the resulting Lean clause list with
the 1,370,732 common clauses stored in G3.

The first substantive missing semantic bridge is therefore a
**stored-prefix valuation/agreement theorem** from `exists_livePrefixPacket` to
clausewise satisfaction of the exact v6/common prefix.  The selector-guard
lemma is a small subsequent combinator; it is also absent.

## Audited artifact and trust boundary

The G3 manifest records:

- 49,360 variables and 1,370,871 clauses;
- 1,370,732 all-four common clauses;
- one selector-totality clause;
- 138 selector-guarded delta clauses at 46 differing positions;
- selectors `s2_o9 = 49358`, `s3_o0 = 49359`, and `s3_o9 = 49360`;
- output SHA-256
  `17569ab86af1d72db6c66ec385176cc020bd62711cfb2e61953dd3e4d36b4ce8`.

`input.cnf` starts with the selector-totality clause
`49358 49359 49360 0`; guarded deltas have the expected form
`-selector ... 0`.  CaDiCaL exited 20 and wrote a 153 MB DRAT proof.  However,
`proof.lrat` and `drat-trim.log` are currently empty, and the manifest status is
only `CNF_MATERIALIZED`.  Thus this round is externally solver-UNSAT, not yet
LRAT-replayed or kernel-closed.

The four separate v7 case CNF/DRAT pairs remain independently DRAT-verified as
reported in `scratch/card11-exact5-common-fullradius-v7/REPORT.md`; that is a
separate external-certificate fact and does not prove the combined G3 theorem
in Lean.

## Search coverage

The following mandated theorem-bank registries were searched in both their
concise and exhaustive forms:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

No declaration in those registries matched `CubeOk`/cover-index satisfaction,
retained-prefix satisfaction, selector guarding, or LRAT ingress.  The sole
JSON `selector` text hit was the unrelated legacy module
`N9Msolve1457CriticalValueDiscriminantSelectorFrame`.

Non-agentic `nthdegree docs search --lean` queries were run for:

- selector-guarded clause satisfaction;
- `CubeOk` to cover index / base CNF satisfaction;
- retained-prefix source-valuation satisfaction; and
- LRAT / `verifyCert` ingress.

The live repository was then searched by theorem name, statement vocabulary,
imports, and consumers.  No `--agentic` corpus search was run.

## Exact and near-exact hits

### 1. `CubeOk` to index and Census554 `BaseSat`

Source:
`lean/Erdos9796Proof/P97/Census554/CoverIndexBridge.lean`.

| Declaration | Exact statement/consumer | Applicability to G3 | Import reachability |
|---|---|---|---|
| `Problem97.Census554.CoverIndexBridge.exists_coverIndex_of_cubeOk` (line 155) | From `hκ : CubeOk κ`, produces `idx : Nat → Nat`, index bounds, exact row-bit agreement, and the `C2`/`C4` hypotheses required by `CoverCnf`. | Exact reusable producer for the cover-index portion. | `CoverIndexBridge.lean` imports `BaseSat`, but no other Lean module currently imports `CoverIndexBridge`; off the production spine. |
| `...finalAssign_coverIndex_baseDimacs_sat_of_cubeOk` (line 183) | `∀ c ∈ baseDimacs, evalClauseD (finalAssign (coverIndex κ)) c = true`. | Exact for the DIMACS form of the Census554 base encoding. | Same: source-present, not imported by a current consumer. |
| `...finalAssign_coverIndex_baseCnf_sat_of_cubeOk` (line 201) | `Std.Sat.CNF.eval (fun n => finalAssign (coverIndex κ) (n + 1)) baseCnf = true`. | Exact Boolean/CNF endpoint for `baseCnf`. | Same. |
| `...finalAssign_coverIndex_baseSat_of_cubeOk` (line 216) | Packages chosen-`x` truth, all `baseDimacs` clauses, and `baseCnf` evaluation under one canonical assignment. | Best reusable interface.  It does **not** state satisfaction of the source-indexed, order, global-equality, full-radius, or auxiliary-variable portions of G3. | Same. |
| `Problem97.Census554.CoverCnf.baseDimacs_sat` / `baseCnf_sat` (`BaseSat.lean`, lines 716/862) | From explicit `idx`, bounds, `C2`, and `C4`, produces a satisfying assignment for `baseDimacs` / `baseCnf`. | More primitive fallback; `CoverIndexBridge` already discharges its hypotheses from `CubeOk`. | Reachable through an explicit import of `BaseSat`; not a G3 consumer. |

`CoverCnf.lean` fixes this base encoding at 27,286 variables and 207,969
clauses.  No theorem found identifies `baseDimacs` or `baseCnf` with a literal
sublist/slice of the stored G3 input, so even this exact local satisfaction
result still needs a stored-formula agreement lemma.

### 2. Exact live packet producer

Source:
`lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/ExactFiveCommonShellV7/PrefixSemanticCore.lean`.

`Problem97.ExactFiveCommonShellV7.exists_livePrefixPacket` (line 168) has the
exact live consumer:

```lean
(R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
(hcard : D.A.card = 11)
```

and produces a frame, labeling, `CanonicalPacket`, and
`SourceIndexedShadow`, together with:

- the named source and common-center label equalities;
- source-row membership and blocker choices;
- `CubeOk P.cube.cube`; and
- `CyclicAlternationSat P.boundaryOrder`.

This is the correct upstream producer for the fixed-cardinality production
leaf in `FiniteN11Frontier.lean`.  A direct Lean check in this audit reports
only the standard axioms `[propext, Classical.choice, Quot.sound]`.

Import reachability: `FiniteN11Frontier.lean` imports only
`FrontierLiveClosure`.  No module imports `PrefixSemanticCore`; it is
source-present but off-spine.  It also does not itself state any DIMACS
satisfaction theorem.

### 3. Exact v7 occurrence-family satisfaction

Source:
`lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/ExactFiveCommonShellV7/OccurrenceCore.lean`.

The file proves:

```lean
theorem occurrence_card : Fintype.card Occurrence = 190080

theorem allOccurrenceClauses_sat
    (P : SelectedBoundaryOrder pointOf)
    (hcyclic : CyclicAlternationSat P) :
    ∀ o : Occurrence,
      P5OccurrenceBridgeScratch.clauseSat
        (sourceVal P) (occurrenceClause o)
```

This is exact semantic satisfaction of the full v7 cyclic-alternation family,
whose size matches the 190,080-clause v7 suffix.  A direct Lean check reports
only `[propext, Classical.choice, Quot.sound]`.

It is not yet an exact stored-CNF bridge:

- there is no theorem equating
  `List.ofFn occurrenceClause` (or another Lean aggregate) to the actual v7
  suffix in the per-case/G3 DIMACS lists;
- `sourceVal` covers the exact-five order-selector and global-edge-equality
  atoms, not all variables in the inherited prefix; and
- no theorem joins this valuation to `BaseSat.finalAssign`.

Import reachability: no module imports `OccurrenceCore`; it is another
source-present terminal support file.  There is also no module that imports
both `PrefixSemanticCore` and `OccurrenceCore`.

### 4. Retained-prefix satisfaction analogies

Two mature certificate lanes demonstrate the required architecture but are
not statement-compatible with G3.

#### P5 exact-two lane

`Unique4ExactTwoSourceBridge/IndexedSource/IndexedSourceValuation.lean`
defines `DenseFamilySatisfaction`, `DirectSatisfaction`, and
`MirrorSatisfaction` for an `ExactTwoBoundaryCore`.

`Unique4ExactTwoSourceBridge/OccurrenceBridge/BridgeMain.lean` proves:

```lean
theorem bridgeClauses_length : bridgeClauses.length = 8703

theorem bridge_clauses_sat
    (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label)
    (hQ : DenseFamilySatisfaction Q σ) :
    ∀ clause ∈ bridgeClauses, clauseSat (bridgeVal Q σ) clause
```

and direct/mirror corollaries.  This is the closest reusable *shape*, but its
packet, retained families, variable numbering, and 8,703-clause formula are
specific to the P5 exact-two certificate.  It cannot discharge a G3 clause.

It is production-reachable through
`Unique4ExactTwoLratIngress/P5ExactTwoClosure.lean`, which is imported by
`CardElevenUniqueFourCertificate/Coordinator.lean`.

#### P4 full-ledger lane

`Unique4P4DirectValuation/P4FullLedgerSatisfaction.lean` proves
`directTotalVal_p4CompactLedger_sat`, satisfying every clause of the exact P4
compact ledger under a source-faithful total valuation.  This is another good
assembly pattern, but it consumes `DirectSource` for the P4/exact-two route and
the P4 ledger, not an exact-five common-center packet or G3.  It is
production-reachable from the same coordinator.

These lanes provide templates for the missing agreement/ledger theorem; they
do not provide reusable terminal propositions at G3's statement.

### 5. Generic signed-clause to checker semantics

`Unique4ExactTwoLratIngress/P5ExactTwoClosure.lean` contains two genuinely
generic helpers:

```lean
theorem entails_defaultClause_of_clauseSat ...

theorem entails_formula_of_signedClauses_sat
    (v : Nat → Prop) (formula : DefaultFormula n)
    (h : ∀ clause ∈ signedClausesOfFormula formula, clauseSat v clause) :
    Entails.eval (checkerAssignment v) formula
```

They are reusable after an exact clause-list identity is available.
`checkpoint0_clauses_eq_bridgeClauses` and
`false_of_bridgeClauses_sat`, however, are fixed to the P5 checkpoint-zero
formula and cannot be reused for G3.  The generic helpers currently live in a
module that imports the large P5 replay; factoring them into a neutral support
module would avoid importing an unrelated certificate.

## Selector-guard search

No generic or G3-specific theorem was found for any of the following:

- satisfaction of `selector₁ ∨ selector₂ ∨ selector₃`;
- satisfaction of `¬selector ∨ deltaClause` from the selected branch's
  `deltaClause`;
- setting one selector true and the other two false; or
- translating an exact-five `ShellCase` into the G3 selector numbers and
  guarded clause list.

`CanonicalPacket.lean` does prove the exact four-way shell classification:

```lean
ShellCase.support =
  {0,2,6,7,8} ∨ {9,2,6,7,8} ∨
  {0,3,6,7,8} ∨ {9,3,6,7,8}.
```

Thus the mathematical case split exists, but no theorem routes the
`s2_o0` case to its separate certificate and the other three cases to G3.
The guard lemma itself should be elementary once the exact selected case
formula is satisfied; it is not the large missing proof.

## LRAT / certificate-ingress hits

### Applicable generic checker API

The applicable kernel checker endpoint is
`Std.Tactic.BVDecide.Reflect.verifyCert_correct`.  The existing scratch file

`scratch/card11-exact5-common-fullradius-v7-ingress/s2_o0-ingress/Card11Exact5CommonFullradiusV7S2O0Core.lean`

shows the exact ingress pattern:

```lean
apply Reflect.verifyCert_correct certificateCnf lrat
native_decide
```

followed by removal of a tautological certificate-padding clause.

This is only a pattern, not a reusable G3 theorem.  The file is specific to a
reduced `s2_o0` core, is outside the production import graph, and its
`ingress-report.json` status is
`LRAT_MATERIALIZED_LEAN_REPLAY_PENDING`.  Its generated Lean source contains a
`Core_unsat` theorem, but the pending replay means it must not be reported as a
verified kernel endpoint yet.

### Existing checkpointed replay

The production P5 exact-two lane has:

```lean
WindowedRupReplay.startUnsatisfiable :
  Unsatisfiable (PosFin n)
    (formulaOfText Checkpoint.C0000.text)
```

and the corresponding P4 compact replay.  These theorems are formula-specific.
They cannot certify G3 without a new G3 replay and an exact checkpoint/CNF
identity.  No existing LRAT theorem was found whose formula is the G3 input or
any of its three selected per-case inputs.

### Current G3 ingress status

There is presently no materialized G3 LRAT, no generated Lean CNF, no
`verifyCert_correct` invocation for G3, and no exact theorem equating a
Lean-native G3 clause list with `input.cnf`.  Certificate ingress is therefore
an independent open lane even after semantic satisfaction is completed.

## First missing bridge and recommended theorem boundary

The first missing bridge on the live semantic route should consume the output
of `exists_livePrefixPacket` and produce one coherent valuation for the exact
stored common prefix.  A useful boundary is morally:

```lean
theorem commonPrefix_sat_of_livePrefixPacket
    (P : CanonicalPacket L)
    (sourceShadow : SourceIndexedShadow H L P.cube)
    (hCube : CubeOk P.cube.cube)
    (hcyclic : CyclicAlternationSat P.boundaryOrder) :
    ∃ v : Nat → Bool,
      coverAgreement v P.cube ∧
      sourceIndexedAgreement v sourceShadow ∧
      orderGlobalAgreement v P.boundaryOrder ∧
      auxiliaryAgreement v ∧
      ∀ clause ∈ exactV7CommonClauses,
        evalClauseD v clause = true
```

The exact statement should use a checked Lean representation of the stored
clause list, not a proposition-valued placeholder.

After that theorem, the remaining G3 semantic assembly is small and explicit:

1. case-split `ShellCase`;
2. route `s2_o0` to its separate certificate lane;
3. for `s2_o9`, `s3_o0`, or `s3_o9`, set the corresponding selector true and
   the other selectors false;
4. prove selector-totality and all 138 guarded deltas;
5. identify the assembled clause list exactly with G3 `input.cnf`; and
6. contradict a newly replayed G3 LRAT theorem.

Until both the common-prefix satisfaction theorem and the G3 LRAT/formula
identity exist, the completed solver round is not a Lean closure of
`false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven`.
