# Endpoint classifier soundness-transport map (2026-07-11)

Analysis pass over the committed pinned-seed classifier soundness chain
(`Census554/CapSelectedNativeClosureSound.lean`, c5fcf286, plus its
classifier/sound/coverage/facts dependencies), classifying every declaration
for the K-B-END-GENERAL endpoint transport. Produced by a read-only subagent;
verified claims are file:line-cited. Consumers: increment 3a (endpoint
placement checks) and 3b (soundness transport) of the
`isM44EndpointGeneralMResidualsExcluded` lane.

## Definition index

| Name | Location |
|---|---|
| `IncidenceOK` | `Census554/CapSelectedFiniteCode.lean:209` |
| `PinnedShellOK` | `CapSelectedFiniteCode.lean:218` (8 conjuncts) |
| `ClosureCoreAlternative` | `CapSelectedFiniteCode.lean:472` |
| `hasPrefixCore` | `Census554/CapSelectedNativeClassifier.lean:260` |
| `exactPinnedOffCircleCore` | `CapSelectedNativeClassifier.lean:215` |
| `fixedPinnedRow` | `CapSelectedNativeClassifier.lean:304` |
| `placementCheck` | `CapSelectedNativeClassifier.lean:310`; `variableCenters` `[0,2,3..10]` :308 |
| `ExactOffCircleCore` | `Census554/EqualityCore.lean:138`; `DuplicateCenterCore` :160; `PerpBisectorCore` :215; `EdgeClosure` :106 |
| `EndpointLeftShellOK` | `EndpointCertificate/GeneralMCardEleven.lean:407` |
| `EndpointRightShellOK` | `GeneralMCardEleven.lean:424` |

## Headline results

1. **`ClosureCoreAlternative` is seed-independent.** Its statement mentions
   only `P` and `blocker`; the exact branch is
   `∃ source, ∃ core : ExactOffCircleCore (rowPattern P), core.c = blocker source`,
   which absorbs `core.c = 1` (left, via `blocker 7 = 1`) and `core.c = 2`
   (right, via `blocker 9 = 2`) identically. Both endpoint variants target the
   identical public alternative; downstream geometric consumers are shared
   without change.

2. **The left family reuses the committed native search code verbatim.** The
   left seed is the unique center-1 row (`variableCenters` excludes 1), so
   `hasPrefixCore`/`allKilled` reuse is sound and
   `exactPinnedOffCircleCore_sound` (ClosureSound.lean:616) applies verbatim —
   its proof is generic in the center-1 row's support and never assumes the
   pinned shape `{0,7,8,p}`.

3. **The right family CANNOT reuse the search code.** The exact detector
   hard-codes center literal 1 (Classifier.lean:215) and `hasPrefixCore` keys
   it to `rows.find? (·.center == 1)` (:260). In the right search center 1 is
   a variable center: the detector fires on arbitrary center-1 rows, yielding
   `core.c = 1`, which no `EndpointRightShellOK` conjunct can match to
   `blocker source` (the right blocker conjuncts pin center 2). Consequences:
   the right family needs `exactEndpointOffCircleCoreAt2` (center literal
   1 → 2, ~5 places), `hasPrefixCoreRight`, `allKilledRight`,
   `variableCentersRight = [0,1,3..10]`, and `endpointRightPlacementCheck`
   built on them; the right 32 native placement theorems must run against the
   NEW code — an eval pass against the old code certifies nothing for the
   right family.

4. **Exactly three shape-dependent proof steps in the whole chain** (left
   family), plus the right-family native fork:
   - `exists_blockerSource_one` (ClosureSound.lean:751): witnesses
     `source := 0` via `0 ∈ {0,7,8,pinSource}`; endpoint witness becomes 7
     (left) / 9 (right, concluding `blocker source = 2`).
   - `maskOfFinset_pinnedRow` (ClassifierFacts.lean:121): `native_decide
     +revert` seed-mask identity; endpoint needs the `{7,8,e,f}` and
     `{9,10,e,f}` analogues.
   - `placementCheck_of_interior` (ClosureSound.lean:839): 12-cell grid;
     endpoint grids are 32 cells per family
     (left `(escapee, fourth, deleted) ∈ intO2 × ({2}∪intS) × intS`,
     `fourth ≠ deleted`; right mirror).

## Classification detail

**VERBATIM-REUSABLE** — the entire union-find soundness layer and three of
four detector soundness proofs (ClosureSound.lean lines ~30–735: `edgeOfCode`
through `convexFivePointCore_sound`, including `duplicateCenterCore_sound`
:514, `perpendicularBisectorCore_sound` :568); all of ClassifierFacts.lean
except the seed-mask identity; all of ClassifierSound.lean except the two
items below; Coverage's `insertDomain_perm`/`sortDomains_perm`/
`allKilled_eq_false_of_semanticTrace` (:53, left) /
`variableCenters_nodup`/`variableCenter_lt_eleven` (left).

**PARAMETER-SWAP** (mechanical restatement, endpoint seed or mirrored center):
`localCandidateSpec_of_incidenceOK_pinnedShellOK` (ClassifierSound.lean:57 —
consumes only conjunct 5, `deleted ∈ row P 0`, at :84; only the `rcases`
pattern changes); `rowOfPattern_mem_candidateRows` (:88);
`placementCheck_eq_false_of_no_semanticPrefixCore` (Coverage.lean:212) and
`exists_semanticPrefixCore_of_placementCheck` (:299);
`closureCoreAlternative_of_hasPrefixCore` (ClosureSound.lean:765),
`closureCoreAlternative_of_placementCheck` (:825), final wrapper (:852);
right-only: `exactPinnedOffCircleCore_sound` with literal 1 → 2,
`row_eq_rowOfPattern_one_of_find?_eq_some` (:738) at center 2, Coverage's
right-keyed variants.

**REAL-ADAPTATION**: `exists_blockerSource_one` (ClosureSound.lean:751),
`rowOfPattern_eq_fixedPinnedRow` (ClassifierSound.lean:409, uses conjuncts
1+4 via the seed-mask fact), `maskOfFinset_pinnedRow`
(ClassifierFacts.lean:121), `placementCheck_of_interior`
(ClosureSound.lean:839), and the right-family native fork (item 3 above).

## PinnedShellOK conjunct consumption map

| # | Pinned conjunct | Consumed at | Endpoint analogue |
|---|---|---|---|
| 1 | `pinSource ∈ intS` | ClassifierSound.lean:418 (seed mask); ClosureSound.lean:858 (grid) | Left/right conjuncts 1+2. No gap |
| 2 | `deleted ∈ intS` | ClosureSound.lean:858 (grid) | Conjunct 3. No gap |
| 3 | `pinSource ≠ deleted` | ClosureSound.lean:858 (grid diagonal) | Conjunct 4 (`fourth ≠ deleted`); `escapee ≠ deleted` automatic. No gap |
| 4 | `row P 1 = {0,7,8,pinSource}` | ClassifierSound.lean:418; ClosureSound.lean:759–761 (membership of 0) | Conjunct 5; blocker-source witness changes 0 → 7 / 9 |
| 5 | `deleted ∈ row P 0` | ClassifierSound.lean:84 | Conjunct 6, identical |
| 6 | blocker totality | NOT consumed in this chain (downstream geometric consumers only) | Conjunct 7 present |
| 7 | `∀ q ∈ row P 1, blocker q = 1` | ClosureSound.lean:759 | Conjunct 8 (right: `blocker q = 2`) |
| 8 | `blocker deleted ≠ 1` | NOT consumed in this chain | Conjunct 9 present |

No endpoint conjunct is missing for anything the chain consumes.

## Dependency-ordered work items (3a/3b dispatch plan)

1. **Empirical gate (riskiest item):** eval all 32 left checks against reused
   code and all 32 right checks against the NEW right code. A false anywhere
   is a mathematical outcome (detector set does not kill the endpoint-seeded
   tree), not a transport question — STOP and redesign.
2. Native defs in `EndpointCertificate/EndpointNativeClassifier.lean`
   (never modifying `Census554/`): left/right fixed rows, left check;
   right-family fork (`exactEndpointOffCircleCoreAt2`, `hasPrefixCoreRight`,
   `allKilledRight`, `variableCentersRight`, right check).
3. 64 `native_decide` placement shards under
   `EndpointCertificate/EndpointNativePlacements/` + per-family aggregates.
4. Two seed-mask `native_decide +revert` identities (endpoint analogues of
   `maskOfFinset_pinnedRow`).
5. ClassifierSound additions: `rowOfPattern_eq_fixedEndpointLeft/RightRow`,
   endpoint `localCandidateSpec` restatement.
6. Coverage restatements (left swaps only; right additionally the
   `allKilledRight` trace lemma + `variableCentersRight` facts).
7. ClosureSound endpoint assembly: blocker-source witnesses (7 left, 9
   right), `hasPrefixCore(Right)` alternative extraction, 32-cell
   `fin_cases` dispatchers, final
   `closureCoreAlternative_of_incidenceOK_endpointLeft/RightShellOK`
   targeting the unchanged `ClosureCoreAlternative P blocker`.
