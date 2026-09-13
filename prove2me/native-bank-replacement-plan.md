# Plan: replace native certificate banks with general theorems

Date: 2026-09-06. Planning baseline: `fff7305bb6f10ddfc5a9446fe7392541da47d87b`.
Status: package 1 is complete and validated; the package-2 exact-15 and exact-16
classifier pilots are complete with core-only structural proofs. Package 3 has
selected aligned-P5 and checked two proposed reductions; its terminal replacement
remains open. Broader package-2 geometric families and packages 4–5 remain planned.
See the [package-1 audit](../docs/audits/2026-09-05-native-outside-counting.md),
[exact-15 coverage audit](../docs/audits/2026-09-05-native-exact15-coverage.md),
the [exact-16 coverage audit](../docs/audits/2026-09-06-native-exact16-coverage.md),
and the [aligned-P5 investigation](../docs/audits/2026-09-06-native-card11-aligned-p5.md).

Current load-bearing revision, 2026-09-10: the non-`IsM44` descent reaches a
general-`m` CapSelected branch through `PinnedSurplusGeneralM`,
`CapSelectedPinnedShellBridge`, `CapSelectedCarrierBridge`, and
`CapSelectedNativeClosureSound`. That branch contains twelve placement checks
for distinct `p,d ∈ {3,4,5,6}`. Eleven checks are in separate placement modules;
the `p = 6, d = 4` check is in the classifier. This route takes priority within
package 2 because it is on the current `RemovableVertexOfLarge` dependency path.

The first general-`m` trust checkpoint now authenticates the explicit 330-entry
four-point-mask table with kernel reduction. This removes `Lean.trustCompiler`
from `fourPointMasks_eq_reference`; the twelve placement checks and the other
native classifier identities remain to be replaced.

The next checkpoint proves `maskOfFinset_lt_2048` from `Nat.geomSum_lt`: every
label index is below eleven, so the sum of its selected powers of two is below
`2 ^ 11 = 2048`. This replaces exhaustive enumeration with a reusable bitmask
bound. The row-coverage consumer still reaches `has_maskOfFinset` and
`localCandidateOK_maskOfFinset_iff`; the latter remains native at this checkpoint.

The bit-membership checkpoint proves `has_maskOfFinset` through mathlib's
binary-expansion theorem: the bit indices of a sum of distinct powers of two
are exactly the selected indices. This removes exhaustive enumeration from the
encoding interface.

The local-candidate checkpoint then proves
`localCandidateOK_maskOfFinset_iff` from general fold/filter counting lemmas,
finite-set intersections, and the eleven possible center labels. Its ordinary
kernel proof replaces the native enumeration over centers, deleted labels, and
row masks. The immediate candidate-row consumer now has only the standard
`propext`, `Classical.choice`, and `Quot.sound` axioms.

The common-support checkpoint proves
`countPoints_supportPoints_maskOfFinset` by filtering the canonical list of all
eleven labels and identifying its filtered finite set with the right-hand row.
This removes the native overlap-count identity from
`rowIntersectionBound_of_incidenceOK`.

The common-block checkpoint proves `allEmptyCommon_capBlocks_iff` through a
general equivalence between an executable `List.all` test and emptiness of a
triple finite-set intersection. The Q3 pair-filter consumer is now structural
apart from its independent cyclic-separation path. Only
`maskOfFinset_pinnedRow` remained native in this facts module at that checkpoint.

The pinned-row checkpoint closes the module by splitting the
`pinSource ∈ {3,4,5,6}` hypothesis into its four admissible labels and reducing
the four literal masks in the kernel. `CapSelectedNativeClassifierFacts.lean`
now contains no `native_decide` or native-decide linter suppressions. This does
not make the broader classifier path native-free: cyclic separation, placement
checks, and other classifier modules still contain independent native proofs.

## Finite-ten Prove2Me checkpoint, 2026-09-12

The mission's finite-ten theorem is still a statement without an accepted
proof. The local endpoint `Problem97.FiniteN10Closure` remains compiler-trusted,
so it cannot yet be transferred as a core-only proof. Its pinned-surplus branch
contains the following exact spine:

```text
pinnedSurplusCOMPGBankBridge
  -> isM44PinnedSurplusResidualsExcluded_of_card_five
  -> finiteN10_nonSurplusMoserCapContainment
  -> finiteN10_u2FullDistanceClasses
  -> FiniteN10Closure
```

`pinnedSurplusCOMPGBankBridge` itself only composes two implications:

```text
isValidPinnedFragment
  -> fragmentShadowAcceptedBySearch
  -> shadowInBank
```

There is no core-only replacement for either the bridge or its bank-coverage
premises in the current indexed project corpus or the canonical general-n bank
registry. The four source files in its immediate generated subtree contain 41
`native_decide` calls: 38 in `SurplusCOMPGBank.lean` and one in each of
`SurplusCOMPGBankDFS/Depth2S1.lean`, `Depth2S2.lean`, and `Depth2S3.lean`.
The bridge's transitive axiom closure reaches the three depth-shard coverage
facts, candidate-mask computations, Boolean equality branches, and the static
search-key/bank-key identities. Replacing a single call at the bridge would
therefore hide the same trust boundary rather than remove it.

The useful structural seam is already present:
`computedFragmentShadowAcceptedBySearch_of_isValidPinnedFragment` proves,
without the depth-shard enumeration, that every valid pinned fragment occurs in
`computedFragmentSearchShadowKeys`. It is not yet core-only: its proof reaches
`Label.beq_eq_decide_eq` across 100 constructor pairs,
`candidateMasks_eq_filter_of_isSurplusStar` across 30 admissible
star/center pairs, and `candidateMaskOK_of_isValidPinnedFragment` across the
three surplus-star cases. Those three families must first receive ordinary
kernel proofs, or the computed-search producer must be reproved without them.

The first structural replacement checkpoint removes two of those three native
families completely. `Label.beq_eq_decide_eq` now closes by constructor
reduction, and `candidateMaskOK_of_isValidPinnedFragment` derives the Boolean
checks from the validity hypothesis. Direct axiom probes report no axioms for
the equality lemma and only `propext` and `Quot.sound` for the validity lemma.

The candidate-list family is partially structural. For center `v`, the three
surplus-star cases now prove that the filter contains exactly the singleton
masks 201, 209, and 225. A general recursive lemma isolates the unique true
entry of a filtered natural-number range; each branch identifies its mask from
the pinned-mask conjunct and proves the remaining Boolean check directly. This
removes three of the 30 native branch axioms. At that checkpoint the theorem
had 27 native branch axioms for the remaining centers. The source module has
36 textual `native_decide` calls, and the three depth shards still contribute
one each.

The normalized-bitmask decomposition is now structural. `labelsOfMaskBits`
maps `Nat.bitIndices` back to bank labels. For every mask below
`2 ^ labelCount`, the new lemmas prove that this support has no duplicates,
that label membership is exactly the corresponding `maskHas` test, that
re-encoding the support reconstructs the original mask, and that `maskCard` is
the support length. These proofs use the general `Nat.bitIndices` API. Their
axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound` as
applicable. The only dedicated `interval_cases` split is the ten-case proof
that `labelAt` preserves an in-range index; the cardinality proof also performs
a structural case split on the ten label constructors.

The center-`u` classification now partitions every admissible four-label
support into four reusable families: nine supports with
`w`, one of `{v,Q1,Q2}`, and two surplus labels; six supports with one of
`{Pw,Pu}`, one of `{v,Q1,Q2}`, and the two surplus labels other than `sstar`;
three supports containing `{s1,s2,s3}` and one of `{v,Q1,Q2}`; and the single
support `{w,s1,s2,s3}`. Re-encoding those `9 + 6 + 3 + 1` supports yields the
19 masks for each surplus star. A separate sorted-filter theorem promotes the
membership classification to ordered list equality. This removes the host
`u` branch for all three surplus stars from the native fallback, leaving 24
native branch axioms in `candidateMasks_eq_filter_of_isSurplusStar`.

The generator template now contains the previously omitted separation and
pair-count bridges as well as the normalized-support and center-`u` blocks. A
fresh semantic comparison finds the same 228 declarations and imports in the
tracked module and generated output; declaration docstrings remain a separate
source-formatting layer.

After that prerequisite, the bridge should route through the computed list and
target the one-way coverage actually needed by the consumer:

```lean
∀ masks, masks ∈ computedFragmentSearchShadowKeys → masks ∈ rowShadowKeys
```

Full list equality, uniqueness, and census counts are stronger than this
consumer requires. The proof must derive the inclusion from reusable row-family
or certificate invariants. Assuming bank membership, using the static table to
prove DFS coverage, or merely parameterizing the inclusion would be circular or
would leave the native evidence unchanged. The existing 135 rows split into two
empty-common-core verdicts and 133 no-valid-real verdicts; that split is a lead
for extracting shared certificate schemas, not yet a proof of coverage.

The bridge is only the first finite-ten trust gate. Downstream
`false_of_shadowInBank_of_metricShadow` still reaches the row-zero banks, whose
current source inventory includes 102 direct checks and 35 product checks.
Closing the computed-to-row inclusion would remove the depth-shard and static
search-key facts from the bridge. The candidate-table classifier and the nearby
computed fragment-search producer now have core-only axiom closures.
`FiniteN10Closure` becomes transferable only after the computed-to-row
inclusion, the downstream certificate families, and the other endpoint inputs
also have core-only axiom closures.

The three center-`w` branches are now structural. Their predicate is
independent of the surplus-star choice and has one shared 12-mask table: every
support contains `Q1` and `Q2`, one label from `{v,s1,s2,s3}`, and one from
`{u,Pw,Pu}`. The proof reconstructs those supports and reuses the sorted-filter
theorem, removing three more native branch axioms.

The six private-center branches at `Pw` and `Pu` are also structural. Their
predicate is independent of the surplus-star choice: an admissible support has
four labels, omits its center, and does not contain all of `u`, `v`, and `w`.
The proof enumerates `powersetCard 4` of the label support, maps each support to
its binary mask, and sorts the resulting finite set. Two closed kernel `decide`
checks identify the sorted support families with the existing 120-mask tables;
they introduce no native axiom and do not rerun the old 0--1023 filter search.

The three surplus centers occurring after the chosen surplus star reuse the
same four-support enumeration. Their local trigger is vacuous, so two more
closed table-identification checks cover the three 120-mask branches without a
new search or native axiom.

The nine trigger-restricted branches are structural as well. They cover `Q1`,
`Q2`, and surplus centers occurring before the chosen surplus star. Their
75-mask support family starts from the same four-element supports and adds one
rule: a support containing the chosen surplus star contains none of `u`, `Pw`,
or `Pu`. The proof filters supports before encoding them as masks; it does not
filter the 0--1023 mask range.

The final three diagonal branches are structural. Here the center is the chosen
surplus star, and the support contains at most one of `u`, `Pw`, and `Pu`. This
71-mask support family removes the last native fallback from
`candidateMasks_eq_filter_of_isSurplusStar`. The global
`candidate_masks_match_filter` certificate now folds that theorem over its 30
listed center pairs instead of running a separate native check.

The recursive search now has a core proof that every emitted terminal passes
`isValidPinnedFragment`. Together with the existing construction of a search
path from any valid fragment, this characterizes
`computedFragmentSearchShadowKeys` as exactly the masks valid for at least one
surplus star. This separates DFS correctness from the remaining row-bank
classification.

The depth-two search boundary is also semantic. A result belongs to
`depth2SubtreeResult sstar wmask` exactly when it is a valid pinned fragment
whose `v` mask is `pinnedMaskOf sstar` and whose `w` mask is `wmask`. The proof
uses general preservation lemmas for centers absent from the remaining search
plan and a reusable reconstruction of the suffix beginning at `u`; it does not
evaluate a subtree. An independent prefix census reproduces all 135 terminal
keys and the 15 nonempty `(sstar, w-mask)` cells. Three cells have one terminal
key each: `(s1, 777)`, `(s1, 912)`, and `(s3, 801)`.

**Next implementation checkpoint:** prove that every valid pinned fragment is
covered by `rowShadowKeys`. Start with a shared structural classifier for the
three singleton depth-two cells, then extend it across the other 12 live cells
using the 17 relaxed-split certificate groups. Prove the 21 remaining cells
empty through the first failed search constraint recorded by the prefix census.
Then derive the computed-key inclusion and wire `pinnedSurplusCOMPGBankBridge`
through it. Require a direct `#print axioms` probe of the bridge to report only
`propext`, `Classical.choice`, and `Quot.sound`. Stop and record the first row
whose certificate data does not fit a shared schema rather than replacing its
native check with another evaluator.

**Singleton classifier pilot:** the first cell, `(s1, 777)`, is encoded as a
candidate-choice CNF over the eight centers other than the fixed `v` and `w`.
Each center chooses one structurally classified candidate mask; binary clauses
exclude pairs that violate cross-separation; one clause blocks the known target
row. Pair-count clauses are unnecessary for this pilot: the weaker
separation-only formula already has that row as its sole model. The instance has
248 variables and 18,819 clauses. A generic Lean theorem maps every valid
pinned fragment with a different free-center mask to a satisfying assignment,
and a length-aware extensionality theorem turns exclusion of such an assignment
into equality with the ten-mask row. This is the required semantic boundary;
it assumes neither bank membership nor a static-search equality.

CaDiCaL and `drat-trim` produced a 1.88 MB pure-RUP LRAT certificate for the
blocked formula. Its compact replay remained diagnostic: seven window checks
used `native_decide`, kernel `decide` timed out even at one action per window,
and the direct proof-term form expanded to about 26 MB. The promoted proof uses
the same separation classifier as a smaller structural decision certificate.
A generic soundness theorem checks exact candidate-domain coverage at every
split, permits a prune only when a concrete earlier mask is separation-
incompatible, and requires every terminal assignment to equal the target. The
`(s1, 777)` certificate has 1,115 split states, 37,862 explicit prunes, and one
terminal. Its 31 generated Lean modules total 1.41 MB and give a core-only
theorem that every member of `depth2SubtreeResult .s1 777` is the stored target
row. The same parameterized generator now covers `(s1, 912)` with 283 partial
states and 10 Lean modules, and `(s3, 801)` with 855 partial states and 30 Lean
modules. Both roots prove that every result in their depth-two cell is the
corresponding stored target row with core-only axiom closure. The next checkpoint
packages the three target rows into one singleton-cell predicate, proves their
membership in `rowShadowKeys`, and dispatches computed search results in those
cells through that predicate.

**Singleton row-dispatch checkpoint:** `IsSingletonDepthTwoCell` now packages
the three structurally classified cells. Their target rows are proved directly
to occur in `rowShadowKeys`, and one quantified theorem sends every result of a
packaged depth-two cell to that stored-row list. A Boolean `List.all` corollary
exposes the same fact in the form needed by the computed-search dispatcher. The
exported theorems use no native reduction and their axiom probes report only
`propext`, `Classical.choice`, and `Quot.sound`.

The required theorem-bank reuse preflight found the three target-uniqueness
theorems in the generated roots and the matching stored rows `s1_002`, `s1_028`,
and `s3_000`. No existing all-three aggregation theorem was present. The only
missing antecedent was direct membership of each concrete target in
`rowShadowKeys`; simplification of `rows.map Row.shadowKey` proves those facts.
The immediate consumer is the all-cell depth-two coverage theorem. This search
used the indexed Lean corpus at revision `8e6075c94`, with repository HEAD
`6757dd7e9`; the source roots were at revisions `f160c0cd` and `6757dd7e9`.
The next checkpoint should fit the first non-singleton live cell to a shared
certificate schema before extending the remaining 11 live cells.

**First multiple-row pilot:** the 12 remaining live cells contain between two
and 36 rows. The smallest is `(s1, 834)`, with exactly the stored rows `s1_000`
and `s1_001`. The existing 17 relaxed-split groups partition already identified
rows for later algebraic certificates; their soundness interfaces require row
membership and therefore cannot establish depth-two coverage without circularity.
The coverage proof instead extends the structural compatibility checker so a
terminal assignment may agree with any member of a finite target list. Its
soundness theorem returns the selected target and pointwise agreement, and the
valid-fragment adapter supplies the same conclusion from the search invariants.
The reuse preflight found the existing single-target soundness theorem but no
multi-target consequence. Its first missing antecedent for `(s1, 834)` was the
concrete checked tree. The search used the Lean corpus indexed from revision
`8e6075c94` against repository HEAD `ffcbe380`.

The generator now supports the two `(s1, 834)` targets while preserving the
three singleton outputs byte-for-byte. A greedy center order produces 1,382
partial states, 1,380 splits, 47,963 explicit separation prunes, and two
terminals. The promoted proof has 62 Lean modules totaling 1,868,329 bytes.
It proves that every result in `depth2SubtreeResult .s1 834` is one of the two
targets, and the broader stored-row dispatcher now covers this cell together
with the three singleton cells. Lean LSP validates the generated root and the
dispatcher. A targeted `lake-build` compilation completed all 1,159 jobs, and
the governed Lean-ingress binding check passed its semantic probe with only the
standard axioms `propext`, `Classical.choice`, and `Quot.sound`. The next
structural checkpoint should add the four-row `(s1, 848)` cell, the
next-smallest live target set.

The `(s1, 848)` prototype covers four certified target rows, `s1_024` through
`s1_027`. With center order `u, Q1, Q2, Pw, Pu, s3, s2, s1`, its generated
target-set tree has 949 partial states, 945 splits, 36,842 separation prunes,
and four terminals. Two independent generations emitted the same 30 Lean
modules, totaling 1,424,940 bytes, with aggregate digest
`ed809ca7a100d8dc9bc3c7c84306196e43dc7a59f4a9d6fd5dba3f5985db685d`.
The generated source contains no `sorry`, `admit`, `unsafe`, or `native_decide`
occurrences and requires no checker-interface change. Targeted `lake-build`
completed all 1,189 jobs, and the governed Lean-ingress binding passed semantic
validation with only `propext`, `Classical.choice`, and `Quot.sound` in the
exported declarations' axiom closures.

The `(s1, 928)` prototype covers the four certified target rows `s1_037` through
`s1_040`. With the same center order, its generated target-set tree has 442
partial states, 438 splits, 17,497 separation prunes, and four terminals. Two
independent generations emitted the same 25 Lean modules, totaling 669,902
bytes, with aggregate digest
`766b680367069cbc3a58dffb80fba3b4904939ea753b97627667841e9fcf7311`.
The generated source contains no `sorry`, `admit`, `unsafe`, or `native_decide`
occurrences and requires no checker-interface change. The dispatcher integration
extends structural coverage to six cells. Targeted `lake-build` completed all 1,214
jobs, and the governed Lean-ingress binding passed semantic validation with only
`propext`, `Classical.choice`, and `Quot.sound` in the exported declarations' axiom
closures.

The `(s3, 928)` prototype covers the five certified target rows `s3_018` through
`s3_022`. With center order `u, Q1, Q2, Pw, Pu, s1, s2, s3`, its generated target-set
tree has 1,814 partial states, 1,809 splits, 67,643 separation prunes, and five
terminals. Two independent generations emitted the same 82 Lean modules, totaling
2,501,298 bytes, with aggregate digest
`605ff7e6794fc3351f87a9898fc9a0e0ccc7801b6a0cf210565e81c0844fe236`.
The generated source contains no `sorry`, `admit`, `unsafe`, or `native_decide`
occurrences and requires no checker-interface change. Dispatcher integration extends
structural coverage to seven cells. Targeted `lake-build` completed all 1,296 jobs,
and the governed Lean-ingress binding passed semantic validation with only `propext`,
`Classical.choice`, and `Quot.sound` in the exported declarations' axiom closures.

## Objective and boundaries

Replace computational proof steps on the P97/P96 dependency paths with reusable
mathematical arguments, preserving the current theorem statements and hypotheses.
Prioritize replacements that retire whole certificate families. The first small
delivery removes two native cardinality checks using an existing general theorem.

This is a trust-removal and theorem-reuse plan, not a claim to solve either Erdős
problem. Open geometric obligations remain open until separately proved. Changing
`native_decide` to another evaluator, adding a wrapper around a bank, or repeating
checker soundness does not count as the requested mathematical generalization.

Inputs:

- [Native-bank audit](native-bank-audit.md), including exact candidate statements.
- [Independent claim review](native-bank-audit-review.md).
- [Full tracked-source inventory](native-bank-inventory.json) and
  [reproducible scanner](audit_native_banks.py).
- [Existing theorem-bank registry](../docs/general-n-certificate-bank-mining-2026-07-09.md).
- [Active exact-five closure plan](../docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md)
  and the live plans governing any other touched residual.

The inventory found 5,035 native token sites in the main first-party Lean tree.
That dated figure is a historical source census, not a current count of reachable
proof obligations. Historical and scratch totals remain separate. This plan does not require rewriting
every archived experiment or changing the repository's approved native-trust policy.

Keep the source repository on its existing Lean/Mathlib pins during mathematical
replacement work. Port completed results separately to the mission's pinned
environment. Prove2Me's documented upload workflow requires core-only axioms;
actual server acceptance of native proofs was not tested. This plan pursues the
stronger proof form regardless, without presenting an untested server restriction
as established behavior.

## Ordered work packages

| Order | Package | Deliverable | Completion condition |
| --- | --- | --- | --- |
| 0 | Establish current dependencies | Per-target native-dependency ledger and owned lanes | Current source/build identities, consumers, and trust boundaries recorded |
| 1 | Replace outside-slice counting | Shared finite-set proof and exact-15/16 adapters | Both named cardinality declarations have core-only proof dependencies; consumers still build |
| 2 | Geometric core coverage | Source-derived adapters to five-point and Kalmanson contradictions | Every retired case has proved antecedents and exhaustive dispatch |
| 3 | Card-eleven terminal reduction | Direct argument for one selected terminal | That terminal's replay subtree leaves its dependency closure |
| 4 | Polynomial family reduction | A symbolic identity family or geometric contradiction | Concrete native identity premises disappear from a named consumer |
| 5 | Integrate and transfer | Audited proof packages linked to the existing private mission | Exact transferred statements and proofs accepted by the server |

Packages 2, 3, and 4 can run as independent bounded research lanes after package 0.
The package-2 exact-15 and exact-16 classifier pilots are complete; broader
geometric families are open. Package 3 is under investigation; packages 4–5 remain
planned. Assess one family-level
pilot in each research lane before expanding it.

### 0. Establish a fresh baseline

1. Read the current repository instructions, closure plans, source imports, and
   bank manifests. Recheck all candidates against current source; the audit's
   cached call graph predates some working-tree changes.
2. Trace both `Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`. P97 is the only
   configured blueprint publish target; check P96 explicitly. Also trace the
   counting, nine-point exclusion, and conditional P97-to-P96 milestone roots:
   some useful results may already be transferable without these banks.
3. For each selected bank, record its actual native proof leaves, immediate
   consumer, exported consumer, source hash, toolchain, and current axiom closure.
   Include generated certificate boundaries omitted from blueprint's detailed
   mining; an absent mined edge is not proof of independence.
4. Classify each candidate as geometric exclusion, combinatorial classification,
   polynomial identity, replay check, or data/encoding agreement. Distinguish
   current consumers from archived and unimported material.
5. Register exact ownership and retained artifacts before edits. Generated work
   belongs under `scratch/runs/<lane-id>/<run-id>/`, with the required checkpoint
   and run manifest. The coordinator alone owns shared lane records and aggregate
   imports; a worker must not rewrite another lane's checkpoint.

**Exit:** a reviewed ledger for the selected pilots. Do not rebuild the entire
repository merely to count source tokens. Use the smallest builds/probes needed
to establish the selected consumer's current state.

### 1. Replace the exact-15 and exact-16 cardinality computations

Targets:

- `Problem97.BlockerVExactFifteenFourRowCoverage.outsideHits_card_eq_two`.
- `Problem97.BlockerVExactSixteenFourRowCoverage.outsideHits_card_eq_two`.

Reuse `Problem97.ATailBlockerVExactSeventeenSourceNormalForm.outsideSlice_card_eq_two`
from [the exact-17 module](../lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean).
Its finite-set argument proves: a four-point support with two distinct known cap
members and at most two cap members has two points outside the cap.

1. Verify that declaration's body and trust closure. Inspect import direction.
   Extract the existing argument to a small shared combinatorics module if needed
   to avoid importing a large exact-17 source model or introducing a cycle.
2. Preserve the existing exact-15/16 public signatures and docstrings. Translate
   the Boolean filtered universe to a support finset, and `longLabelBool` to a cap
   finset. Convert the Boolean conjunction bound to an intersection-cardinality
   bound.
3. Prove the two fixed hits are distinct and in that intersection for each row.
4. Prove `outsideLabel` injective and that the image of `outsideHits` is exactly
   the support minus the cap. Use image-cardinality transport to finish.
5. Replace the two native proof bodies. Keep the existing
   `outsidePairOfMembership` and geometric consumers connected. Tiny fixed label
   tables may use kernel-checked finite cases; do not enumerate all row predicates.
6. Build the two modules and the actual affected consumer in
   `ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`. Audit the changed
   declarations' axioms and inspect the consumer graph.

**Exit:** both computations are replaced by the shared counting argument plus
label adapters. The separate classifier replacements are recorded under package 2.
Do not report the whole banks or the P97 root as native-free.

### 2. Replace finite geometric cases by structural coverage

Start with these existing source theorems:

- `Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`:
  five ordered vertices W < F < P < X < Z, a W-centred selected row containing
  F,X,Z, and a Z-centred selected row containing P,X cannot coexist.
- The cardinality-independent contradictions in
  `ATail/KalmansonThreeEqualitySchemas.lean` and
  `ATail/KalmansonFourEqualitySchemas.lean`.

**Pilot status:** the exact-15 and exact-16 classifier replacements are complete
with core-only structural proofs and governed validation. In exact16, the
OldB/OldC/NewB cases are exhaustive; `NewAMotifOccurs` remains a preserved public
interface but is unused by the proof. This does not close the remaining broader
geometric-family coverage work in package 2.

**Current CapSelected pilot:** the first general-`m` case is `p = 3, d = 4`.
After unfolding `PinnedShellOK`, its missing source theorem is the finite
structural coverage statement

```lean
IncidenceOK P →
  row P 1 = {0, 7, 8, 3} →
  4 ∈ row P 0 →
  ClosureCoreAlternative P blocker
```

where the active alternatives are duplicate center, exact off-circle at center
`1`, perpendicular bisector, and convex five with a cyclic witness. No indexed
nonnative theorem currently supplies this coverage. A direct kernel `decide`
attempt is a bounded diagnostic only: the existing native instance took about
54 minutes, and replacing the evaluator without exposing reusable structure does
not satisfy this package. The semantic adapter also reaches
`fourPointMasks_eq_reference`; that separate 330-mask authentication is now
kernel-checked. Other native classifier identities still keep the consumer from
being core-only.

1. Select one native classifier or finite case family and its immediate consumer.
   Search the existing indexed Lean corpus once for that concrete hypothesis set.
2. Extract its actual admissibility conditions, including distinctness, radius
   class membership, convexity, cyclic order, and orientation. Preserve them in
   the candidate statement.
3. Match cases to the existing geometric cores. Retain a coverage table containing
   proved matches, unmatched cases, and the first missing antecedent for each.
   Historical coverage of 230 cores is a search lead, not current coverage proof.
4. Prove the order/membership adapters from the source geometry. The completed
   exact-15 and exact-16 pilots use cyclic separation; exact16's finite step is the
   structural union argument with eight incidences in a seven-label universe.
5. Check proposed generalizations against the existing finite cases and known
   countermodels before investing in a large formalization. A finite successful
   test is supporting evidence only; a counterexample identifies a needed
   hypothesis or ends that candidate.
6. Prove exhaustive coverage for each retired family, or retain a precise residual
   classifier for uncovered cases. Wire the new proof into the original consumer.

**Exit:** at least one finite subfamily is replaced at a real consumer by proved
geometric adapters and exhaustive coverage. An unordered equality match or an
off-spine helper does not satisfy this gate.

**Stop/revise:** if coverage requires an unproved source producer, or a proposed
weaker statement has a counterexample, record the obstruction. Do not move the
same difficulty into a new `sorry` or enlarge the finite search without a new
mathematical constraint.

### 3. Attack one card-eleven terminal

**Pilot status:** aligned-P5 is selected; the terminal remains open. Its current
source closure uses seven direct and seven reflected native classifier leaves.
The [investigation](../docs/audits/2026-09-06-native-card11-aligned-p5.md) records
two checked limits on a replacement argument:

- In the historical four-schema compact Boolean projection, removing the
  four-row existence requirement at any one center other than the first apex
  admits a checked satisfying assignment. Merely reducing the number of selected
  rows cannot establish that projection's contradiction.
- Keeping just the three cap-vertex rows admits an exact rational metric with all
  strict Kalmanson inequalities, strict triangle inequalities, and the checked
  complete-radius constraints. It violates Ptolemy and is not a Euclidean model.

The next mathematical target is incidence propagation involving nonapex rows,
or an additional source-derived Euclidean constraint. A three-cap-vertex counting
argument using only those metric constraints is insufficient. The extracted
six-incidence Kalmanson pattern in the audit still needs an occurrence producer.
No native leaf was removed by these diagnostic checks.

Consumer:
`ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual`.
The coordinator's terminals are direct/reflected P4 exact-two, P5 exact-two, and
aligned-P5. Keep the exact-four, unique-radius, minimality, no-M44, obstruction,
and interior/bisector hypotheses explicit.

1. Choose one terminal by the size of its mathematical interface and availability
   of a small contradictory clause core, not by generated file count alone.
2. Map the selected clauses back to radius partitions, cyclic separation, mutual
   transport, and Kalmanson/other geometric statements. Separate these from ledger
   membership, index bounds, and checkpoint encoding.
3. Attempt a direct contradiction from a smaller set of source-owned hypotheses.
   Any solver-derived core must retain a checked mapping to the Lean statements.
4. Prove that contradiction and replace the selected terminal's certificate call.
   Verify that its replay subtree is no longer reachable from that consumer.

**Exit:** one terminal loses its native replay dependency without stronger
assumptions or new proof holes. General RUP checker soundness already exists and
does not count as progress here. Ledger construction improvements may be useful,
but record them as proof engineering rather than new geometry.

### 4. Find shared polynomial identities or geometric contradictions

Scope: `EndpointCertificate/Patterns`, `SurplusCertificate/RelaxedSplit`, and
`SurplusCertificate/RowZeros`, starting with a small representative family.

1. Group payloads by generator structure, coordinate symmetries, and shared
   coefficient/factor patterns. Keep rule/mask alignment separate from the
   polynomial identity itself.
2. State a candidate symbolic identity with explicit parameters and assumptions.
   Prove its coefficient-generation invariant or derive a geometric contradiction
   that makes those payloads unnecessary.
3. Supply the actual geometric zero and mask hypotheses at the existing consumer.
   Existing evaluation-zero and checker-soundness lemmas can support the proof,
   but their concrete success premises must also be discharged without native
   evaluation.
4. Pilot the result on every case in the selected family, retaining exceptions
   explicitly. Only expand after the family-level argument compiles and audits.

**Exit:** the selected family's native identity/alignment premises disappear from
a named consumer. A theorem of the form “if the checker succeeds, then False” is
already available and is not a replacement.

**Stop/revise:** if no useful parameterized invariant emerges, record which
coefficient or mask facts remain instance-specific. Kernel-checkable certificate
replay can be assessed separately as a fallback; keep it distinct from this
plan's mathematical extraction work.

### 5. Integrate, audit, and transfer incrementally

For each completed replacement:

1. Build the smallest changed targets using the governed `lake-build` workflow,
   followed by the actual aggregate consumer. Avoid edits to a running build's
   source graph. Use isolated single-file probes only under the permitted audit
   exceptions.
2. Check exact statement fidelity, imports, and transitive axioms. For transferable
   proved results require only `propext`, `Classical.choice`, and `Quot.sound`;
   no `sorryAx`, native-computation axioms, or hidden external assumptions.
3. Refresh source/kernel evidence and inspect both relevant export roots. Preserve
   known open obligations; run the full publication gate only when appropriate,
   without interpreting existing open roots as closed.
4. If an edited module belongs to a frozen bank source manifest, re-mine and
   refreeze the affected chain and require its verify walk to pass. Regenerate
   applicable Lean-ingress binding records when their authenticated bytes change.
5. Obtain an independent review of mathematical fidelity, consumer reachability,
   build evidence, and trust. Update the affected live closure records, then stage
   exact owned paths, pass the hygiene gate, commit, and push.
6. Port the finished dependency slice in the separate Prove2Me environment. Check
   its current pin, preserve statements, and obtain fresh read-backs where the
   contribution workflow requires them. Submit actual proofs to the existing
   private mission `1061a384-cdea-43b4-adb5-273627ea45a0`; verify server receipts.
   Update transfer notices only for accepted results. Do not create a duplicate
   mission or change its visibility as part of this work.

## Progress accounting and handoff

Keep a ledger per replacement: exact declaration, assumptions, source hash,
original native leaves, replacement theorem, immediate/exported consumer,
remaining obligations, build/axiom evidence, independent review, and transfer
receipt if applicable.

Measure trust-removal progress by native proof sites actually eliminated from
the selected compiled dependency slice and by certificate subtrees retired.
Track source token totals only as diagnostics. Removing two sites may leave the
same two native axiom names at the root because other sites still use them.
Report this as a local trust improvement, not headline proof closure.

If a lane changes a mathematical obligation, use the active closure plan's
well-founded measure and show strict reduction at its named residual, with
exhaustive dispatch. Do not create orphan lemmas or uncovered `sorry` obligations.

At each family-level pilot, decide whether to expand, refine one missing
antecedent, or stop that candidate. Assign disjoint source paths to parallel
workers; keep a separate reviewer and one owner for shared imports/manifests.
No reliable end-to-end duration is known: the completed pilots were bounded
implementations, while broader package-2 work and packages 3–5 contain open
mathematical work.
