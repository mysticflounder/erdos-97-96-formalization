# Exact-11 theorem-bank inventory (2026-07-31)

Status: read-only static audit of the concurrently changing worktree at
`HEAD 1b867b3f`.  No Lean build or transitive axiom audit was started.  The
exact-11 files were untracked at this snapshot, so reachability and counts
below are a point-in-time result, not a publish gate.

## Answer

No, not in the reusable-bank sense.

Two different claims need to be separated:

1. **Exact-11 proof ingress.**  The older exact-four promotion manifest says
   all `2061/2061` candidate files were promoted, and the current exact-11
   certificate subtree contains `2441` Lean files with `10751` theorem/lemma
   declarations.  A recursive static import scan from `FiniteN11` reaches
   `2437/2441` files.  In the V7 exact-five common-center subtree it reaches
   `41/45` files and all three G3 selector branches.  The four unreached files
   are the in-progress `s2_o0` ingress listed below.  The live frontier still
   has one load-bearing `sorry` at that branch.  Thus exact-11 itself was not
   yet unconditionally banked at this snapshot.

2. **Reusable theorem bank.**  The general-n registries are dated 2026-07-09
   and predate the exact-11 exact-four/exact-five mining tree.  They do not
   enumerate or shape-deduplicate these `2441` files.  Exact-11 has banked the
   rules needed for its certificate mostly as packet-specific semantic and
   occurrence theorems, but several genuinely reusable mathematical lemmas
   remain filed inside exact-11 support directories and have not been
   classified against the other live lanes.

The right headline is therefore:

> The exact-11 search rules are mostly represented in Lean, but the reusable
> mathematics discovered while finding them has not received an exhaustive
> post-exact-11 general-n inventory.

## Current source census

| Scope | Lean files | Reachable from `FiniteN11` | theorem/lemma declarations |
|---|---:|---:|---:|
| `CardElevenUniqueFourCertificate` | 2441 | 2437 | 10751 |
| `ExactFiveCommonShellV7` | 45 | 41 | 338 |

The only statically unreachable files inside the exact-11 certificate subtree
were:

- `ExactFiveCommonShellV7/S2O0SpecialFamilySemantics.lean`
- `ExactFiveCommonShellV7/S2O0RetainedCoreSemantics.lean`
- `ExactFiveCommonShellV7/S2O0RetainedCoreClauseBank.lean`
- `ExactFiveCommonShellV7/S2O0TextIngress.lean`

Those are active work, not abandoned orphans.  At the same snapshot,
`FiniteN11Frontier.lean` still imported `G3Checkpoint0ClauseBank` directly and
the `s2_o0` terminal body was `sorry`.

No actual `sorry` token occurred in the exact-11 certificate subtree; the two
matches there were prose comments.  That is only a source scan.  It does not
replace a completed build plus transitive `#print axioms`/proof-blueprint
audit.

## Classification of what was discovered

### 1. Imported Lean theorems already reusable as mathematics

These are the most important confirmed theorem-level products of the mining,
not merely certificate clauses:

| Family | Representative declaration | Scope |
|---|---|---|
| exact row semantics | `Census554.Realizes.exactRowSemantic` | generic semantic row theorem; promoted outside exact-11 support |
| equality-clause semantics | `Census554.evalClauseD_transitivityClause` | valuation-independent; promoted outside exact-11 support |
| U5 nontriple obstruction | `u5_nontriple_equilateral_on_p_circle_incompatibility` | general geometric kernel |
| U5 common-bisector obstruction | `u5_common_bisector_triple_incompatibility` | general geometric kernel |
| two-center cyclic alternation | `P5IndexedSourceScratch.false_of_nonalternating_equidistant` | ambient carrier is arbitrary, though its role labels are fixed to the 11-label encoder |
| Kalmanson row triangles | `UniqueFourKalmansonOccurrenceScratch.false_of_two_k2_three_row_triangle` | explicitly independent of ambient cardinality |
| Kalmanson selected-row cores | the ten `false_of_...selected_rows` theorems in `UniqueFourKalmansonCores.lean` | ambient-cardinality-uniform metric contradictions |
| card-five cap localization | `selectedClass_capInteriorByIndex_card_ge_three_of_card_five`, `exists_cardFiveInteriorSurvivorPair`, `interior_pair_bisector_center_mem_capInterior` | class/cap-size lemmas, not intrinsically exact-11 |
| cross-blocker localization | `false_of_two_cap_centers_equidistant_outside_pair`, `q_blocker_mem_firstInterior_of_cross`, `w_blocker_mem_firstInterior_of_cross` | geometric localization with plausible other-lane consumers |

The first four are already in generic semantic/kernel modules.  The remaining
families are source-banked but are easy to miss because they live under
`CardElevenUniqueFourCertificate/Support` and are absent from the dated
general-n registry.

### 2. Exact-11-scoped Lean theorems that are potentially liftable

- `false_of_nonalternating_equidistant` should be refactored or re-exported
  with four abstract ordered roles instead of the fixed `Label = Fin 11`
  interface.  Its proof itself is cardinality-independent.
- The card-four/card-five interior-survivor, bisector-localization, and
  cross-blocker lemmas should be indexed by their actual hypotheses rather
  than by their current `UniqueRowProducer/card_five_*` location.
- The Kalmanson occurrence/core-port theorems already quantify over an
  arbitrary convex carrier.  They need registry entries and consumer matching,
  not new proofs.
- `CanonicalPacket.localFourHolds_to_hasNEquidistantPointsAt_erase` and
  `CanonicalPacket.localFourHolds_to_u5QDeletedK4Class` contain reusable
  deletion/class conversion arguments, but their present statements depend on
  the exact-11 label encoder.  The mathematical core can be factored from the
  label-decoding wrapper.
- `CanonicalPacket.u5NontripleChoice_incompatible` and
  `CanonicalPacket.u5CommonBisectorChoice_incompatible` are useful adapters to
  general U5 kernels.  Their conclusions are not new geometry, but their
  source-choice-to-kernel bridge may apply to other source-indexed lanes after
  the exact-11 packet fields are abstracted.

### 3. Certificate/solver families with semantics but no generalized theorem

The retained G3 core has `273017` clauses, `42` literal shapes, and `22`
semantic families.  The round-2 audit classified the shapes as `28` already
covered, `7` needing reusable semantic lemmas, and `7` exact-11 finite-map or
Tseitin glue.  The seven reusable shapes were subsequently covered by:

- `Realizes.exactRowSemantic`; and
- `evalClauseD_transitivityClause`.

The remaining non-generalized portion is intentionally encoder glue:

- source-center iff a finite source-row choice;
- used-center iff the finite source-center map;
- local-four witness iff;
- q-deleted-pair witness iff;
- exact first-apex shell-case seeds and selector guards;
- retained source-position/ordinal decoding.

These are banked locally in G3 slice ledgers, not as general mathematical
theorems.  That is appropriate for replay, but they should be tagged
`encoder-glue` so a future inventory does not count thousands of ordinal
lemmas as new geometry.

The `s2_o0` retained core reuses `54938` G3-common source positions, has only
`18` G3-selected-only first-apex positions, and adds `26297` S2-only
positions.  This is strong source-position reuse evidence; it is not a
generalized semantic theorem until its retained-family decoder and clause-bank
ingress are root-imported and axiom-audited.

### 4. Empirical or conjectured patterns, not theorem-bank entries

- V6 survivor intersection histograms and the per-case counts of cyclic-parity
  violations are model fingerprints only.  They were explicitly not claimed
  to be graph-isomorphism classifiers.
- The absence of q-critical adjacent/third-common witnesses in the four V6
  models is empirical for those assignments.
- SAT of V1--V6 and the mutation/control experiments establish formula and
  implementation behavior, not geometric theorems.
- The smaller seven-literal U1 obstruction also rejected the V6 models.  Its
  source consumer was unimported in the sibling repository, but it is already
  recorded by the existing `p97-rvol` registry; it is not a newly banked
  exact-11 theorem.

### 5. Orphan/unimported or API-hidden declarations

- The four S2 files above were the only files in the exact-11 certificate
  subtree not reachable from `FiniteN11` in this snapshot.
- The G3 ledgers contain many deliberately private decoder helpers.  Most are
  implementation detail, but private declarations become a reuse defect when
  another authenticated bank needs the exact occurrence API.  A current
  example is `convexFiveOccurrenceAt` and
  `g3ConvexFiveSlice_valid`, both private in
  `G3ConvexFiveSliceLedger.lean` at audit time.
- “Private” is not the same as “unproved.”  The inventory should report
  separately: import reachability, public API visibility, source `sorry`, and
  transitive axioms.

## How to inventory the unbanked discoveries

Extend the existing `scripts/general-n-bank-miner.py` workflow with a focused
post-finite-n pass rather than manually reading generated files.

### Inputs

1. Every Lean declaration under the exact-n certificate/support root.
2. The finite search manifests, rule-family summaries, survivor motif files,
   DRAT/core manifests, and source-position ledgers under `scratch/card11-*`.
3. The existing canonical, sibling `p97-rvol`, legacy, and
   `erdos-general-theorem` registry JSON files.

### Per-declaration fields

- fully-qualified name, source path, declaration kind, and normalized header;
- imports/reachability from `FiniteN11`, the P97 publish root, and candidate
  general-n lane roots;
- public/private visibility;
- source `sorry` and transitive axiom status;
- fixed-cardinality dependencies (`A.card = 11`, `Label = Fin 11`, literal
  ordinals, hard-coded support maps);
- semantic dependencies (`ConvexIndep`, selected four-class, exact row,
  deletion survival, cap size, U5 kernel, Kalmanson order);
- class: `geometry`, `semantic-adapter`, `finite-map`, `Tseitin`,
  `occurrence-ledger`, or `certificate-replay`;
- normalized-shape match against every existing registry;
- immediate consumers in other live lanes.

### Per solver rule-family fields

- manifest family name and clause count;
- semantic theorem(s) justifying the family;
- exact source-to-occurrence decoder theorem;
- replay consumer;
- status among `theorem-backed`, `external-certificate-only`, `empirical`, or
  `conjectured`;
- whether the semantic theorem is exact-n-specific or ambient-n-uniform.

### Output and gate

Emit one JSON row per declaration/rule family and a short Markdown table of:

1. source-proved ambient-n candidates absent from the registries;
2. exact-n statements with only syntactic fixed-label/cardinality dependence;
3. theorem-backed clause families whose semantic theorem is still local;
4. empirical motifs with no theorem claim;
5. unreachable files and public-API blockers.

Then run a human consumer-matching pass against the current live leaves.  A
normalized statement match is discovery evidence, not proof closure: any
promotion still needs an explicit import, a focused build, and transitive
axiom audit.

The most useful first batch is small: the general Kalmanson cores, cyclic
alternation core, card-five/bisector localization family, and the two
local-four-to-U5 adapters.  Those contain actual mathematics.  Re-indexing the
thousands of generated ordinal ledgers should come only after those candidates
have been matched to live consumers.

