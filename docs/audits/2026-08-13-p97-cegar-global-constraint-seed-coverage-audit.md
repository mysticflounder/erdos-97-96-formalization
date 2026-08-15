# P97 CEGAR Global-Constraint Seed Coverage Audit — 2026-08-13

## Verdict

**VERIFIED NO, at the source-inventory level.** The active P97 CEGAR lanes are
not seeded with every currently known global constraint in the Lean tree. They
start from deliberately scoped finite encodings, then add a mixture of frozen
banks, lane-specific source-order facts, and dynamically discovered cuts.

Two concrete omissions were found:

1. the source-clean FreshThird retained-core/global-row consequences in
   `TwoSourceRetainedMinimalCore.lean` are not serialized into the active
   FreshThird or Phase-3 CEGAR seed; and
2. the 13 `commonOrientation_core_*` declarations in
   `ExactTwelveRigid221OrderedUniversalThreeRowCuts.lean` are not registered by
   declaration name in the 23-entry `PROOF_BACKED_CUBE_BINDINGS` bank used by
   `exact12_v14_ordered_coverage.py`.

This does **not** mean that every omitted theorem should be asserted as a SAT
clause. A theorem is seedable only after its hypotheses, row/role transport,
finite scope, and clause or detector semantics are made exact. The present
finding is a coverage and classification gap, not permission to promote Lean
statements blindly.

## Scope and method

This audit traced current non-test CEGAR constructors and their seed/bank
consumers back to the live Lean sources. It distinguishes four different
states that prior summaries sometimes conflate:

- **initial seed**: clauses asserted before the first solve;
- **eager authenticated bank**: separately produced clauses installed before
  the first solve;
- **dynamic detector**: a sound separation oracle that learns a clause only
  after a model exposes the forbidden pattern; and
- **terminal/proof boundary**: a fact used only to authenticate or replay a
  terminal result, not to constrain discovery.

The audit used source inspection and the indexed Lean corpus. It did not run a
Lean build, solver, or fresh `proof-blueprint`/transitive-axiom audit. In this
document, “source-clean” means only that the inspected declaration file has no
direct `sorry` or `axiom` at the cited declarations; it is not a claim of fresh
transitive `sorryAx` freedom.

## Current seed inventory

| Lane | Initial/eager constraints | Important exclusions or qualifications | Coverage verdict |
| --- | --- | --- | --- |
| Phase-3 projected-static-v3 | The hard encoder emits `S-EXACT`, `S-CIRC2`, projected `B-INDEG`, optional `DUAL2`, `S-MINCUT`, and cap-profile constraints (`census/p97_search/sat_generate.py:292-380`). Pinned-multiplicity is an optional separate extension. | `base.cnf` is the hard encoding plus shard-local clauses. Bootstrap certificates and algebraic cuts are separate learned inputs. The production launcher requires `--no-bootstrap --no-algebraic-bootstrap`, so its production seed is intentionally base-only. The manifest records `phase3_completeness_claimed = false`. | **Partial finite seed, not a global theorem inventory.** |
| Exact12 structural / arm CEGAR | `SourceFaithfulCoverInstance` plus one selected cell forms the initial CNF (`census/card_head/exact12_next_row_structural_cegar.py:1067-1072`). The pristine source-faithful rules are row cardinality, center omission, six Moser one-hit inequalities, two local cap bounds, C2, and C4 (`source_faithful_candidate_surface.py:38-45`). | The source-faithful module explicitly excludes mixed-Moser/same-cap, physical-apex membership, physical-circle C2, physical pair-at-most-one, and blocker injectivity (`source_faithful_candidate_surface.py:47-52`). The source-order bank is captured only after the initial CNF and participates through later CEGAR logic. | **Partial source-faithful seed plus dynamic refinement.** |
| Exact12 static CEGAR | Pristine base plus one cell, static convex extensions, the authenticated 24-role block-spanning family, one ThreeTriad family, and an eagerly installed source-order bank. | Scope remains the selected finite cell and named frozen families. It is not an aggregate inventory of every Lean consequence. | **Richer curated seed, still partial.** |
| Exact12 arm-static | Static base plus the arm suffix and a long authenticated chain of named banks in `exact12_next_row_arm_static_canary.py`. | The PIQD packet explicitly leaves source entitlement, theorem coverage, universal lift, and Lean closure false. The chain is frozen and cell-specific, not automatically synchronized with later Lean declarations. | **Richest frozen finite seed, not globally complete.** |
| Exact12 ordered-v14 coverage | Uses a source-order theorem, PhysicalCycle schedule ingress, SafeCover-generated learned clauses, and `PROOF_BACKED_CUBE_BINDINGS`. | Those consumers are narrow serializers. The active bank does not name the 13 newer ordered universal three-row cuts described below. | **Several global ingresses represented, with a concrete registration gap.** |

## Finding 1: FreshThird global-row constraints are not seeded

`TwoSourceRetainedMinimalCore.lean` contains a source-clean retained-core
producer:

- `exists_freshThird_retained_minimalDeletionCoreProducer`
  (`TwoSourceRetainedMinimalCore.lean:98-140`).

The same file then states the first explicitly global incidence consequences:

- `firstFiber_globalRow_inter_firstShell_card_le_two`
  (`TwoSourceRetainedMinimalCore.lean:1006-1030`);
- `firstFiber_globalRow_sdiff_firstShell_card_ge_two`
  (`TwoSourceRetainedMinimalCore.lean:1035-1060`); and
- `exists_two_firstFiber_globalRow_points_outside_firstShell`
  (`TwoSourceRetainedMinimalCore.lean:1065-1077`).

The module documentation itself calls the first of these “the first genuinely
global incidence constraint missing from the local two-selected-row order
model.” The active FreshThird SMT adapter instead authenticates older closure
and U5 sources (`phase3_piqd_freshthird_smt_session.py:72-81`) and explicitly
sets `source_entitlement`, `universal_closure`, and `lean_closure` to false
(`:270-274`). No non-test Python seed consumer was found for the retained-core
producer or the three global-row declarations.

The downstream contradiction is not available for promotion: the live
`false_of_twoCapSources_firstFiberDescentResidual` theorem still ends in
`sorry` (`TwoSourceFreshThirdFiber.lean:833-843`). Therefore the wave may use
only the proved retained-core/global-row consequences after an exact finite
serializer or sound detector is supplied; it must not assert the open residual
as a fact.

### Required wave action

The FreshThird owner should classify these declarations in the next wave:

1. map each applicable hypothesis to authenticated wave state;
2. implement either exact clauses/SMT assertions or a complete deterministic
   detector for the global-row cardinality consequences;
3. bind the exact Lean source declaration and source bytes in the wave
   manifest; and
4. keep the open first-fiber residual out of the seed and proof claims.

If the current finite abstraction cannot express the global row or shell, the
correct action is an explicit `EXCLUDED_UNREPRESENTABLE` manifest entry and a
named encoder task—not silent omission and not an unsound projection.

## Finding 2: 13 ordered universal three-row cuts are absent from the active bank

`ExactTwelveRigid221OrderedUniversalThreeRowCuts.lean` contains 13 distinct
`commonOrientation_core_*` declarations. The current Python ordered-coverage
module contains 23 distinct declarations with the same prefix, but the two
name sets have intersection size zero. The 13 Lean declarations are:

```text
commonOrientation_core_0_6_2_3_1
commonOrientation_core_10_2_0_1_6
commonOrientation_core_11_0_3_10_2
commonOrientation_core_2_3_0_4_1
commonOrientation_core_2_6_0_10_1
commonOrientation_core_2_9_0_10_1
commonOrientation_core_3_0_2_1_6
commonOrientation_core_3_6_0_11_4
commonOrientation_core_4_0_2_3_11
commonOrientation_core_5_0_11_3_2
commonOrientation_core_5_7_8_9_0
commonOrientation_core_8_1_2_0_5
commonOrientation_core_8_1_2_9_4
```

The active bank is built exclusively from `PROOF_BACKED_CUBE_BINDINGS`
(`exact12_v14_ordered_coverage.py:5054-5067`, consumed at `:5464`). Thus these
13 declarations are not registered by theorem identity in that bank. A zero
name intersection does not prove semantic independence—some cuts could be
redundant—but it does prove that the current provenance ledger neither names
nor classifies them.

### Required wave action

The Exact12/Twelvefold owner should, before the next affected cell wave:

1. check each declaration against the current frozen boundary order and
   selected row/role transport;
2. classify it as `APPLICABLE`, `REDUNDANT_WITH_PROOF`, `OUT_OF_SCOPE`, or
   `UNREPRESENTABLE`;
3. append applicable proof-backed bindings without reordering the existing
   authenticated bank; and
4. add a regression comparing the approved Lean declaration inventory with
   the serialized binding inventory.

This is particularly relevant to waves extending ThreeTriad or block-spanning
families: the new declarations should be checked before spending another
solver wave rediscovering consequences already proved in Lean.

## Known narrow ingresses that are already represented

The negative verdict should not obscure existing integration:

- `FrozenBoundaryOrder` is source-clean in
  `ExactTwelveRigid221BoundaryOrderIngress.lean:59-76`, and the ordered-v14
  module binds its source-order theorem.
- Physical-cycle ingress is bound through `LEAN_CONTRACT_SYMBOL` and source
  hashes in `exact12_v14_schedule.py:54-83`.
- `exists_coverIndex_of_safeCubeOK` is source-clean in
  `ExactTwelveRigid221SafeCoverIndexBridge.lean:193-212`; current exporters
  consume generated SafeCover `learnedClause` artifacts rather than importing
  an unrestricted theorem oracle.

These are evidence that the desired Lean-to-CEGAR bridge is feasible. They are
also examples of why “the theorem exists” and “every relevant instance is in
the initial seed” must remain separate claims.

## Recommended coverage contract

Every production CEGAR wave should publish a generated global-constraint
coverage manifest with one row per approved candidate:

```text
Lean declaration
exact source path and digest
direct and transitive axiom status
hypothesis/scope packet
serializer or detector schema and digest
applicable lanes/cells
phase = INITIAL | EAGER_BANK | DYNAMIC | TERMINAL | EXCLUDED
exclusion reason or redundancy witness
```

The launch gate should fail when an approved, applicable declaration is
unclassified. It should not fail merely because a theorem is inapplicable to a
lane. Monotone, source-clean, exactly transported constraints should be seeded
eagerly; large or conditional families may remain deterministic detectors if
their coverage is complete and authenticated. Open or axiom-dependent claims
must never be silently converted into clauses.

## Immediate owner notifications

- **FreshThird / Frontier Ledger:** modify the next wave to classify and, where
  expressible, serialize the retained-core global-row consequences. Do not
  promote `false_of_twoCapSources_firstFiberDescentResidual`.
- **Exact12 / Twelvefold Refiner:** reconcile the 13-declaration universal
  three-row inventory with `PROOF_BACKED_CUBE_BINDINGS` before the next
  relevant cell/ThreeTriad wave.
- **Phase-3 projected-static-v3:** no automatic seed expansion is authorized
  by this audit. First produce an exact finite transport for any Lean theorem;
  retain the honest base-only/no-bootstrap classification meanwhile.

## Mathematical status

This audit is a **source-level coverage audit**, not a theorem, solver result,
or proof-spine closure. It establishes that current CEGAR seed provenance is
incomplete relative to the inspected Lean inventory. It does not establish
that the missing constraints alone close any finite cell, CEGAR wave, or P97.
