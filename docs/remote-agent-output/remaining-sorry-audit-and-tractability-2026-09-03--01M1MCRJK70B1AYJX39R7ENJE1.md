# Remaining `sorry` Audit and Tractability Study

**Repository:** `mysticflounder/erdos-97-96-formalization`  
**Audit date:** 2026-09-03  
**Primary scope:** publish-reachable proof obligations for the Erdős 97–96 proof root  
**Stable registry baseline:** source head `020e43bfc328879dfdc7d8a558a80fbdbdff2438`  
**Freshness layer:** source-level audits and proof work reported from the live shared checkout through 2026-09-03, including later commits named below

---

## 1. Executive assessment

The checked-in obligation registry records **27 publish-reachable obligation roots and 0 off-spine roots**:

| Registry classification | Count |
|---|---:|
| `OPEN_MATHEMATICAL` | 15 |
| `NORMAL_FORM_CLOSED_TERMINAL_OPEN` | 12 |
| **Total publish-reachable** | **27** |

The central conclusion of this audit is that the remaining work is no longer predominantly Lean plumbing. The project has many source-clean reductions, normal forms, geometry sinks, replay frameworks, and exact finite certificates, but **no remaining registered root appears to be a 5/5 “the proof is already in the library and only needs wiring” obligation**.

The strongest immediate candidate for an actual one-obligation decrement is:

> **`P97-R221-PENTAGONBLOCKER`** — a narrow, source-complete local geometry leaf with a direct downstream consumer and one identifiable missing common-circle/strict-arc midpoint-cycle lemma.

The strongest high-leverage program is:

> **A source-native TwoSource occurrence theorem** — one correctly stated cyclic-order and row-incidence producer could discharge several leaves already marked `NORMAL_FORM_CLOSED_TERMINAL_OPEN`.

The strategically most important but least immediately tractable root is:

> **`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`** — the finite-cardinality experiments have become useful theorem-discovery tools, but the live theorem is genuinely arbitrary-cardinality and lacks a source occurrence theorem.

The deepest current research bottleneck is:

> **The TriApex all-large endpoint branch** — its live context does not yet carry the metric/order relation needed by the exact-15 tools or existing endpoint consumers.

### Recommended division of labor

1. Close `P97-R221-PENTAGONBLOCKER`.
2. Attack the two local TwoDeletion leaves before returning to the broad B1 terminal.
3. Mine and formalize a shared TwoSource occurrence theorem.
4. Close the exact-five three-fan terminal if the TwoSource occurrence work does not subsume it.
5. Formalize the sound `cardGeThirteen` reduction layer, but do not claim closure until a source-open occurrence theorem is proved.
6. Keep TriApex D1 in a separate research lane rather than mixing it with near-term sorry reduction.

---

## 2. What is being counted

Three counts must not be conflated.

### 2.1 Registry obligation roots

These are the 27 declarations in the checked-in publish-reachability registry. This is the right count for project-level proof completion: replacing one registered root by a theorem proved from another registered root does not necessarily reduce the root’s transitive `sorryAx` dependence.

### 2.2 Bare `sorry`/`admit` tokens

A raw token census can differ from the registry because:

- one registered root may delegate to several newer subleaves;
- temporary or generated modules may contain tokens but not be publish-reachable;
- source-clean wrappers may still depend transitively on a registered `sorry`;
- active branches can move faster than the checked-in registry.

The live shared worktree was changing throughout this audit. A single revision-coherent current-HEAD token table was requested from project agents, but no complete machine response arrived before this report was sealed. Therefore this report treats the **27-root registry as the stable census** and uses later source audits to update the mathematical status and line locations. It does not invent an exact current bare-token count from mixed revisions.

### 2.3 Source-clean declarations with transitive `sorryAx`

Many recent theorems compile with only the standard trusted axioms in their own declaration, yet their import graph or parent theorem remains sorry-backed. These are valuable interfaces, but they are not proof-root closure.

---

## 3. Registry distribution

| Module | Registered roots | Dominant remaining issue | Portfolio tractability |
|---|---:|---|---:|
| `Rigid221Closure.lean` | 6 | high-level coordinators, exact-five terminal, arbitrary-cardinality two-radius branch | 1–2/5 |
| `Rigid221Placement.lean` | 5 | source/blocker placement and ordered-row geometry | 2/5 |
| `Rigid221SourceHeavy.lean` | 5 | one narrow pentagon leaf plus several large occurrence gaps | 1–4/5 |
| `TriApexEndpointRetainedOmission.lean` | 1 | all-large endpoint/apex metric bridge | 1/5 |
| `TwoSourceFreshThirdResidual.lean` | 4 | normal forms lacking a source occurrence terminal | 2/5 |
| `TwoSourceCanonicalSurface.lean` | 1 | canonical surface lacks cyclic incidence ingress | 2/5 |
| `TwoSourceClosure.lean` | 1 | coordinator dependent on TwoSource terminals | 2/5 |
| `TwoSourceFirstFiberCollision.lean` | 1 | first-fiber collision occurrence/order bridge | 2/5 |
| `TwoDeletionCollision.lean` | 3 | two local common-deletion leaves and broad B1 termination | 2–3/5 |
| **Total** | **27** |  |  |

The status `NORMAL_FORM_CLOSED_TERMINAL_OPEN` should be read literally: the branch has a useful normal form, but its decisive mathematical terminal or occurrence theorem is still missing. It is not equivalent to “one tactic away.”

---

## 4. Tractability rubric

The score measures the chance of producing an actual publish-root decrement with the current source interface, not the amount of code already written.

| Score | Meaning |
|---|---|
| **5/5** | Existing source-clean theorem or routine Lean repair appears sufficient; no new mathematics |
| **4/5** | One bounded local lemma with source-complete hypotheses and a direct consumer |
| **3/5** | New local geometry or occurrence theorem; hypotheses and consumer are substantially known |
| **2/5** | New structural theorem, global occurrence bridge, or major source-preserving refactor |
| **1/5** | Research bottleneck; current interfaces omit decisive facts, and simple routes have countermodels or generality failures |

The score uses five tests:

1. **Ingress completeness:** does the target retain the facts the proposed consumer actually needs?
2. **Consumer locality:** will proving one theorem directly eliminate a registered root?
3. **Generality match:** is the target fixed-cardinality, or genuinely arbitrary-cardinality?
4. **Negative-control pressure:** have exact models refuted weaker candidate statements?
5. **Formalization risk:** is the required mathematics already expressed in reusable source-clean APIs?

---

## 5. Ranked obligation portfolio

### 5.1 Ranked by near-term probability of an actual decrement

| Rank | Target/family | Score | Why |
|---:|---|---:|---|
| 1 | `P97-R221-PENTAGONBLOCKER` | **4/5** | Narrow local packet, direct consumer, one missing geometric kernel |
| 2 | TwoDeletion blocker-coincidence / survival-square leaves | **3/5** | Local exact-four geometry; less global than B1; direct parent structure is known |
| 3 | Rigid221 Placement `blockerV_sourceRowHeavy` | **2–3/5** | Stronger ingress than sibling placement leaves; likely needs one ordered-cap row realization theorem |
| 4 | Shared TwoSource occurrence theorem | **2–3/5** | Harder than a single leaf, but potentially retires several normal-form roots |
| 5 | Exact-five three-fan terminal | **2/5** | Good normal form; decisive three-fan geometry still absent |
| 6 | B1 physical-class-five/six terminal | **2/5** | Mature branch decomposition, but no same-arc/endpoint termination producer |
| 7 | `cardGeThirteen` reduction interfaces | **4/5 as interfaces; 1/5 as closure** | Sound arithmetic/grid reductions are formalizable; the arbitrary-cardinality terminal is not yet discovered |
| 8 | Large Rigid221 missing-incidence / three-center leaves | **1/5** | Need positive cross-incidence and cyclic occurrence, not more normalization |
| 9 | TriApex all-large endpoint leaf | **1/5** | Current context lacks the metric/order bridge needed by all known terminals |

### 5.2 Ranked by strategic leverage

1. `cardGeThirteen` arbitrary-cardinality occurrence theorem.
2. Shared TwoSource occurrence theorem.
3. B1 termination theorem.
4. Exact-five three-fan theorem.
5. `P97-R221-PENTAGONBLOCKER`.
6. TriApex all-large endpoint theorem.

This order is intentionally different from the near-term order. High leverage does not mean high tractability.

---

## 6. Detailed audits

## 6.1 Best isolated target: `P97-R221-PENTAGONBLOCKER`

**Declaration:**  
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`  
**Module:** `Rigid221SourceHeavy.lean`  
**Fresh source location:** approximately lines 3451–3523 in the audited checkout  
**Direct consumer:** the pentagon blocker-center split/coordinator near lines 18395–18470

### Current packet

The leaf already has the source roles and deletion/blocker configuration needed to state a local Euclidean contradiction. Unlike many other SourceHeavy leaves, the principal problem is not recovering an arbitrary cyclic occurrence from global data.

### First missing theorem

A common-circle, strict-arc midpoint-cycle lemma is needed to rule out the blocker-deleted placement. The nearest theorem-bank searches found related Kalmanson, same-arc, and circle-intersection statements, but no declaration with the exact midpoint/strict-arc packet.

### Why this is the best target

- The missing mathematics is local.
- The hypotheses are already present at the leaf.
- The downstream consumer is known.
- A successful theorem should remove one continuation rather than merely create another wrapper.
- The resulting geometry lemma is plausibly reusable in TwoDeletion/B1 work.

### Acceptance criterion

The work counts as closure only if:

1. the new local geometry theorem is source-clean;
2. the target body no longer contains `sorry`;
3. the parent pentagon coordinator compiles;
4. the registry/reachability diff decreases by one root or removes that root’s `sorryAx` path.

**Tractability: 4/5.**  
**Confidence: high.**

---

## 6.2 TwoDeletion: three registered roots

The current source audit identifies three active mathematical terminals:

1. `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`;
2. `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`;
3. `false_of_b1PhysicalClassFiveSixNormalForm`.

### Blocker-coincidence and survival-square

These are the preferable first targets. They are local common-deletion configurations, and their missing facts are geometric rather than global-cardinality occurrence theorems.

**Recommended action:** isolate the smallest cyclic-order/equal-distance statement below each leaf, test it against the existing exact negative controls, and formalize only a theorem with a direct invocation in the target.

**Tractability: 3/5.**

### B1 physical-class-five/six normal form

B1 has accumulated substantial source-clean structure:

- the escape-source and good-canonical-endpoint reducer;
- card-five/card-six endpoint residual producers;
- adjacent-cap and blocker-between outcomes;
- a good-canonical-endpoint same-arc interface;
- source-clean same-boundary-arc contradiction sinks;
- MEC component-isolation infrastructure.

Recent commits include:

- `7cdcaef62`: escape-source/good-canonical-endpoint reducer;
- `d0626ba70`: good-canonical-endpoint card-arc interface and dispatcher;
- `5d5e6faf7`: authenticated MEC component modes and isolation infrastructure.

None closes the registered B1 root. The remaining gap is a producer that converts the endpoint/adjacent/blocker-between packet into one of:

- a live-slice same-boundary-arc certificate;
- a second positive shared-pair row;
- a retained-deletion row with enough source provenance;
- a full exact metric contradiction.

### Negative controls

Two exact controls materially lower B1 tractability:

- an exact rational 18-point local model shows that the basic three-row/blocker-between packet is insufficient;
- an exact rational 12-point MEC/physical/blocker core satisfies the bare MEC, common-radius, paired-blocker, disk, and strict-convexity conditions while omitting the completion rows and dynamic deletion data.

Longer repetitions of the same QF_NRA query are therefore low value. The useful next computation must add source provenance or isolate completion blocks.

**Tractability: 2/5.**  
**Confidence: high that another wrapper alone will not close it.**

---

## 6.3 TwoSource cluster: seven registered roots

Distribution:

- `TwoSourceFreshThirdResidual.lean`: 4;
- `TwoSourceCanonicalSurface.lean`: 1;
- `TwoSourceClosure.lean`: 1;
- `TwoSourceFirstFiberCollision.lean`: 1.

A representative registry entry is:

`P97-OFF-TS-OUTSIDESEEDRESIDUAL`  
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual`  
status: `NORMAL_FORM_CLOSED_TERMINAL_OPEN`.

### What is complete

The TwoSource branch has strong canonicalization:

- endpoint pinning;
- outside-seed residuals;
- common-deletion and shell packets;
- corrected Gamma/collision-pair normal forms;
- multiple source-clean Kalmanson and six-role consumers.

### What is missing

The source does not yet produce the exact positive memberships and cyclic role order required by the existing geometric sinks. In particular:

- disjoint collision pairs and cross omissions do not imply a Berge row triangle;
- a residual selected row is not automatically one of the rows in the finite occurrence bank;
- importing a FreshThird consumer into the canonical-surface producer can create an import cycle;
- fixed-card role maps are not a substitute for a cardinality-generic source occurrence theorem.

### Best theorem-mining target

A single theorem should package:

1. one ambient `BoundaryIndexing`;
2. a bounded tuple of source-owned selected rows;
3. explicit positive support memberships;
4. the cyclic order of the six to eight roles;
5. the exact row equality pattern consumed by an existing Kalmanson terminal.

The proof should be source-native: it must derive the occurrence from the TwoSource packet, not from an exact-card SAT assignment.

### Leverage

One correct occurrence theorem could discharge several `NORMAL_FORM_CLOSED_TERMINAL_OPEN` roots. This is the highest-leverage medium-term target in the repository.

**Tractability: 2–3/5.**  
**Leverage: very high.**  
**Confidence: high.**

---

## 6.4 Exact-five Rigid221 endpoint

**Registry root:** `P97-OFF-R221-POSTCARDELEVEN`  
**Declaration:** `false_of_exactFiveDistinct_biApexRobust_postCardEleven`

This appears to be the remaining independent exact-five terminal.

### Current normal form

The source-clean theorem  
`RobustApexFourIncidenceContinuationPacket.threeFan_shared_support_intersection_normalForm`  
reduces the branch to a constrained three-fan/shared-support configuration. The residual classifies the relevant intersection as absent, singleton, or a small two-point alternative.

### Remaining gap

No existing theorem converts this normal form into a contradiction. The missing step is not cardinality bookkeeping; it is a three-fan cyclic-order/metric theorem with source-authenticated roles.

Finite solver survivors and rational local controls show that weakened incidence-only versions are satisfiable. Any proposed theorem must retain the full source packet and exact convex-order hypotheses.

**Tractability: 2/5.**  
**Confidence: medium-high.**

---

## 6.5 Rigid221 Placement: five registered roots

The audited leaves are:

1. `false_of_exactFourMutualOmissionRigid221_minimalCore`;
2. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted`;
3. `false_of_exactFourMutualOmissionRigid221_blockerV_sourceRowHeavy`;
4. `false_of_exactFourMutualOmissionRigid221_blockerVRow_oppositeRowHeavy`;
5. `false_of_exactFourMutualOmissionRigid221_blockerVRow_sparseRows`.

### Leaf-by-leaf assessment

| Leaf | First missing theorem | Score |
|---|---|---:|
| `minimalCore` | distinct-radius minimal-core boundary contradiction | 2/5 |
| `sourceEqU_blockerDeleted` | deleted-row/source-blocker cyclic geometry | 2/5 |
| `blockerV_sourceRowHeavy` | ordered-cap realization of the source row and its partner | 2–3/5 |
| `blockerVRow_oppositeRowHeavy` | source-faithful ordered placement plus metric terminal | 2/5 |
| `blockerVRow_sparseRows` | sparse-row occurrence producer plus 3/4-row contradiction | 2/5 |

`blockerV_sourceRowHeavy` is the best Placement target because its packet already contains a strict second-cap source, an opposite-row partner, and useful equal-distance data. It is still not a tactical leaf: the current result is a disjunction rather than `False`.

**Family tractability: 2/5, with `sourceRowHeavy` at 2–3/5.**

---

## 6.6 Rigid221 SourceHeavy: heterogeneous risk

This module has five registered roots, but they should not be treated as one tractability class.

### Narrow leaf

`P97-R221-PENTAGONBLOCKER` is 4/5 and should be isolated from the rest.

### Large missing-incidence leaves

Representative registered roots include:

- `P97-R221-MISSINGINCIDENCE`;
- the exact-three-center deletion/missing-incidence continuation;
- source-heavy exact-12/A5/A8 residuals.

The repository has an extensive finite theorem bank and exact certificate infrastructure. The remaining failure is usually **occurrence**:

- the live packet does not force the selected support pattern used by the certificate;
- positive cross-incidences are missing;
- a boundary order is assumed by the sink but not produced by the source;
- exact-card labels do not lift to arbitrary ambient carriers.

Exact rational and abstract survivors have repeatedly shown that pairwise overlap bounds, source coverage, blocker nonfixedness, and strong connectivity do not force the desired short configuration.

**Tractability of the giant leaves: 1/5.**  
**Recommended policy:** do not add more terminal schemas unless a source producer for their occurrence is identified simultaneously.

---

## 6.7 The principal bottleneck: `cardGeThirteen`

**Declaration:**  
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`

**Fresh source location:** `Rigid221Closure.lean`, approximately lines 1250–1267

### Live theorem shape

The target retains:

- arbitrary `D.A` with `12 < D.A.card`;
- an `OriginalUniqueFourResidual`;
- an `ExactFourPostCardElevenRobustSurface`;
- two disjoint `SelectedFourClass` rows centered at `S.oppApex2`;
- distinct radii for those rows;
- a global no-five condition for every positive radius at `S.oppApex2`.

It does **not** have an upper cardinality bound. The production chain starts from an arbitrary carrier of cardinality greater than nine; “17-point provenance” belongs to historical finite lanes, not this theorem.

### Decisively invalid routes

#### Proper-subcarrier reduction

A bounded union of named points cannot be promoted to a smaller `CounterexampleData`:

- global K4 is non-hereditary;
- minimality explicitly makes proper subcarriers fail the global property;
- cap/MEC packets, critical shell systems, robust surfaces, and boundary indexing are all indexed by the ambient carrier;
- shell-support closure can expand back to the whole carrier.

#### Partial-label replay of the exact-card CNF

A partial label map can transport local equalities and order, but not the global formula. The first obstruction is `k4_everywhere`: an ambient selected support may contain points outside the label image. Blocker existence and exact cap exhaustion are also non-hereditary.

#### Bare blocker cycles or support strong connectivity

The source supplies a nontrivial blocker cycle, but no strict potential along blocker edges and no bridge to `SelectedRowOrdinalComparison`. Abstract cyclic row systems satisfy the exported incidence properties.

#### Treating card-14 witnesses as the theorem

The authenticated maximal card-14 witness was refuted by a short exact Kalmanson chain, and every one of the six historical profile witnesses contains a banked six-role contradiction. This eliminates those assignments, not all models of the profiles and not the arbitrary-cardinality theorem.

### Genuine positive progress

#### Indexed cap-count inequality

For every indexed cap, source data support the inequality

`cap.card + 4 ≤ choose((D.A \ cap).card, 2)`.

The generic indexed wrapper is a tractable formalization task.

#### Cap-excess decomposition

Using baseline cap sizes `(5,4,6)`, write excesses `(x,y,z)`. Then

`D.A.card = 12 + x + y + z`.

If at most one excess is positive, the cap-count inequality gives finite pure-growth bounds:

| Pure growth arm | Profiles | Bound |
|---|---|---:|
| surplus only | `(s,4,6)` | `card ≤ 24` |
| first-opposite only | `(5,o1,6)` | `card ≤ 32` |
| second-opposite only | `(5,4,o2)` | `card ≤ 17` |

These are **not** bounds for the whole corresponding `capGrowth` constructor. MultiGrowth, where at least two excesses are positive, remains unbounded under the current arithmetic inequalities.

#### `o2 = 6` grid reduction

If the second-opposite cap has cardinality six, its strict interior has cardinality four. The two disjoint full A2 radius classes each contribute at least two strict-interior points, so they partition that interior and produce an exact two-radius adjacent-cap grid. This is cardinality-independent and should be factored out of the exact-five module.

The grid is not yet a contradiction. Current consumers first need a named membership such as `S.oppApex1 ∈ firstRow.support`, and then still lack a reverse inequality or terminal.

#### Third-radius ingress split

The common-deletion ingress supplies a q-deleted A2 row. Under the no-five hypothesis it can be promoted to a full four-point A2 class. Its radius may equal either named radius, or be a third radius. In the third-radius arm, three disjoint four-classes give at least six strict A2-interior points and hence `oppCap2.card ≥ 8`. No current general terminal consumes this arm.

#### Exact Kalmanson bank

A complete four-orbit six-role/three-row infeasibility bank was added in commit `f6c1a632e`. This is valuable for lazy CEGAR and local certificate replay. It does not supply the missing source occurrence theorem.

### Best current closure architecture

1. Formalize the indexed cap-count wrapper.
2. Formalize the cap-excess/pure-growth/MultiGrowth outcome.
3. Factor the cardinality-generic `o2 = 6` grid producer.
4. Preserve the ingress A2 row and split its radius against the two named radii.
5. Build a **source-open** local encoder: selected rows may introduce fresh ambient support roles; do not assert exact ambient cardinality or K4 on a chosen subset.
6. Use exact Kalmanson/weighted-cancellation replay before nonlinear coordinate solving.
7. Promote only a core that survives the source-open heredity audit into a Lean occurrence theorem.
8. Rewire the live leaf only after every outcome has a source-clean terminal.

A newer good-outside-source normalization reported after this audit may produce a stronger route, but its decisive global cardinality bound was still under source audit when this report was sealed. It is therefore recorded as a lead, not as established closure progress.

### Tractability verdict

- **Reduction/interface layer:** 4/5.
- **Finite pure-growth campaign:** 2–3/5.
- **Arbitrary-cardinality terminal:** 1/5.
- **Whole registered root today:** 1/5.

---

## 6.8 TriApex all-large endpoint leaf

**Module:** `TriApexEndpointRetainedOmission.lean`  
**Fresh source location:** approximately lines 2874–2923

### Current context

`TriApexAllLargeContext` supplies cap-cardinality and apex-richness information, but not the endpoint/apex distance or cyclic placement relation required by the available exact-15 and endpoint-fiber terminals.

### Why exact-15 progress does not close it

The recent exact-15 μ=0/Groebner work is conditional on a much richer finite packet. The live all-large leaf does not yet produce that packet. Likewise, `EndpointRadiusAt` producers require exact-cardinality or M44 assumptions absent from the target.

A prior selector argument also required correction: the available selector shape does not by itself exclude the outer role.

### First missing theorem

A source-clean all-large endpoint/apex metric bridge, strong enough to produce either:

- the exact-15 normalized cell;
- a first-apex endpoint radius relation;
- or a direct ordered Kalmanson occurrence.

This is new structural mathematics, not packaging.

**Tractability: 1/5.**  
**Confidence: high.**

---

## 7. Coordinator obligations versus leaf obligations

Several `Rigid221Closure` and `TwoSourceClosure` roots are coordinators. Attacking them directly tends to produce wrappers that simply move `sorryAx` into a child theorem.

A coordinator should be considered tractable only after all of its leaf outcomes have a source-clean terminal. In particular:

- `P97-R221-EXACTFOURPHYSICAL` should not be targeted before its SourceHeavy/Placement outcomes;
- `P97-R221-FIRSTAPEXUNIQUE` depends on exact-five and exact-four residual terminals;
- the generic two-radius parent is not closed by exact-card-13/14 infrastructure;
- `TwoSourceClosure` should follow, not precede, the shared occurrence theorem.

---

## 8. Rejected or low-value work patterns

### 8.1 Wrapper-only progress

Do not add a new structure, normal-form theorem, or dispatcher unless the same change identifies and invokes a terminal consumer. The project already has 12 registered “normal form closed, terminal open” roots.

### 8.2 Repeating identical nonlinear solver timeouts

B1 and card-14 have exact or rational negative controls showing that weakened static packets are satisfiable. New solver runs must add a source-backed fact, isolate a constraint block, or produce an independently replayable exact certificate.

### 8.3 Fixed-cardinality results presented as general closure

Exact-card-13 and card-14 work is useful for theorem discovery. It does not prove a theorem whose only cardinality hypothesis is `12 < D.A.card`.

### 8.4 Subcarrier inheritance

Do not reconstruct a smaller `CounterexampleData` from named roles. The global K4/minimality and cap/shell structures are not hereditary.

### 8.5 Terminal-bank growth without occurrence work

Adding another Kalmanson schema is low value unless the live source packet produces its six/eight roles and positive memberships. The present bank is already richer than the source occurrence layer.

### 8.6 Import-cycle workarounds that duplicate mathematics

If a consumer lives above the producer and importing it would cycle, factor the pure geometric kernel downward. Do not clone the theorem under a new namespace.

---

## 9. Recommended execution plan

## Stage A — actual decrement lane

### A1. Close `P97-R221-PENTAGONBLOCKER`

Deliver:

- the minimal common-circle/strict-arc theorem;
- a proof of the target;
- parent-consumer compilation;
- reachability diff.

### A2. Attack the two local TwoDeletion leaves

For blocker coincidence and survival square:

- extract the smallest exact metric/order kernel;
- test it against existing rational controls;
- formalize only after the statement survives.

## Stage B — shared occurrence lane

### B1. TwoSource occurrence theorem

Build one source-native bounded occurrence packet and connect it to an existing Kalmanson sink. Measure success by the number of registered roots whose terminal becomes source-clean.

### B2. Exact-five three-fan terminal

Reuse the same occurrence/order infrastructure where possible. Avoid an exact-five-specific duplicate if the TwoSource theorem factors generically.

## Stage C — `cardGeThirteen` reduction lane

Formalize, without rewiring the target prematurely:

1. indexed cap-count wrapper;
2. cap-excess outcome;
3. pure-growth bounds;
4. generic `o2 = 6` grid producer;
5. third-radius ingress split;
6. cardinality-generic weighted Kalmanson source adapter.

Then run source-open CEGAR on the remaining grid/deep-growth packets.

## Stage D — research lane

Keep B1 and TriApex independent:

- B1: completion-block isolation followed by retained-deletion-row CEGAR;
- TriApex: discover the all-large endpoint/apex bridge before further exact-15 formalization.

---

## 10. Verification and checkpoint protocol

Every claimed closure should include:

1. exact commit and clean/dirty status;
2. `rg` census of bare `sorry`/`admit` in the affected import closure;
3. registry generation/check output;
4. focused `lake env lean` or scoped Lake build;
5. `#print axioms` for the target and its new kernel;
6. direct parent consumer compilation;
7. before/after `sorryAx` reachability from the publication root;
8. exact test or independent replay for any computational certificate;
9. a source-heredity audit for any finite-cardinality certificate used in a general theorem.

A local theorem with standard axioms but an unchanged publication-root `sorryAx` path is interface progress, not closure.

---

## 11. Evidence ledger

### Stable repository evidence

- checked-in obligation registry source head: `020e43bfc328879dfdc7d8a558a80fbdbdff2438`;
- registry totals: 27 publish-reachable roots, 0 off-spine;
- registry status split: 15 `OPEN_MATHEMATICAL`, 12 `NORMAL_FORM_CLOSED_TERMINAL_OPEN`.

### Fresh source-audit anchors

- TwoDeletion/B1 source audit: project-channel messages around `#9251`, `#9349`, `#9352`, `#9362`, `#9374`, `#9380`;
- Rigid221 Placement audit: `#9269`;
- Pentagon-blocker audit: `#9317`;
- TwoSource canonical-surface audit: `#9331`;
- `cardGeThirteen` source signature and arbitrary-cardinality audits: `#9358`–`#9386`, `#9436`–`#9542`;
- TriApex live-leaf audit: `#9760`, corrected by `#9765`;
- `cardGeThirteen` later good-source lead: `#9777`–`#9778`, deliberately not treated as proved.

### Material later commits

- exact-13 infrastructure: `3eb548342`, `5e6731853`, `255ea7e1d`, `4a12071f4`, `ac582e6e7`;
- B1 reducer/interface work: `7cdcaef62`, `d0626ba70`;
- B1 MEC component isolation: `5d5e6faf7`;
- generic four-orbit Kalmanson cut bank: `f6c1a632e`.

---

## 12. Bottom line

The repository is not blocked by 27 equally difficult proofs.

- **One leaf is a credible near-term closure:** `P97-R221-PENTAGONBLOCKER`.
- **Two local TwoDeletion leaves are the next-best decrement candidates.**
- **Several TwoSource roots share one missing occurrence theorem and should be attacked as a group.**
- **Exact-five is normalized but still needs a new geometric terminal.**
- **B1 needs a genuinely stronger producer, not another endpoint wrapper.**
- **`cardGeThirteen` has a sound and increasingly sharp reduction program, but its arbitrary-cardinality terminal remains the main global research problem.**
- **TriApex D1 remains the least tractable live leaf because the decisive metric ingress is absent.**

The most important management rule is to measure progress by publication-root `sorryAx` reachability and direct leaf closure, not by the number of source-clean wrappers or finite models produced.
