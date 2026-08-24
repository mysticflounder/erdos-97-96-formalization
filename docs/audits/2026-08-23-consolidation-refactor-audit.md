# Erdős 97/96 Consolidation and Refactor Audit

**Date:** 2026-08-23 (America/Los_Angeles)  
**Repository:** `mysticflounder/erdos-97-96-formalization`  
**Status:** Final consolidated audit — repository, proof API, certificate, tooling, and documentation passes complete

## Audit objective

Identify major consolidations and refactors that reduce proof duplication, authority drift, stale/off-spine noise, trust-boundary ambiguity, and repeated low-level formalization work across the Problem 97/96 project.

## Executive conclusion

There are major consolidations worth doing, but the first wave should be architectural rather than mathematical. The best sequence is:

1. establish one generated obligation/status registry;
2. break the cross-cluster import chain and split heavy “core” modules;
3. introduce provenance-preserving context/packet records and an all-blockers/late-choice API;
4. migrate F1/F3/F2/Rigid221 to intrinsic typed outcomes behind compatibility wrappers; and
5. isolate generated certificates, diagnostics, scripts, and prose checkpoints behind authenticated manifests.

The project should retain one stable public mathematical facade—`GlobalNonM44Contradiction` or the equivalent non-`IsM44` removable-vertex theorem—while treating the 28 current leaves as an internal implementation roster. Problem 96 should remain essentially unchanged.

## Evidence boundary

This is an architecture and proof-interface audit, not a new Lean closure claim. It covers every major proof area and corpus class: the current publication status, P96, the nine live P97 frontier modules, joint-deletion/shared geometry APIs, generated certificates and trust policy, scripts/worktree governance, canonical prose, and the latest A5/F1/F2/F3 checkpoints. Twelve load-bearing Lean modules were downloaded and measured directly.

The full 5,000-plus-file repository was not rebuilt in this runtime, and every generated certificate body was not reread. Build-derived counts are therefore taken from the repository's current measured README/blueprint record, while source-architecture findings come from inspected public-main files and later project checkpoints. Every proposed migration is gated on a pinned-toolchain rebuild, regenerated spine, and axiom mine.

## Current verified repository boundary

The current README states that neither Problem 97 nor Problem 96 is fully proved; both publish targets still reach `sorryAx`. The live publish-spine frontier is measured as 28 reachable leaves in four clusters: Rigid221 (18), TriApex (1), TwoSource (6), and Two-deletion (3). The open-leaf roster must be regenerated from `proof-blueprint spine`, rather than inferred from raw `sorry` counts or prose ledgers.

The repository also reports:

- a 349-module `FrontierLiveClosure/` package of about 196k lines;
- 1,279 files unreachable from any Lake import chain, containing 3 off-spine `sorry`s;
- 2,442 Lean files under the promoted card-eleven certificate directory;
- an exact-12 Rigid221 bank chain that is not on the publication spine;
- two distinct certificate populations, only one of which is publication-connected;
- historical package labels and plans that remain visible beside live material.

## First major finding: the project has four incompatible authority systems

1. **Kernel/build authority** — `#print axioms`, `proof-blueprint spine`, and successful pinned-toolchain builds.
2. **Repository README/status authority** — current high-level description, but manually maintained.
3. **Canonical prose authority** — the unnumbered authoritative descent document plus rapidly changing overlays/checkpoints.
4. **Research-work authority** — cluster-specific ledgers, chat checkpoints, finite-bank reports, and scratch artifacts.

These systems are not mechanically reconciled. Many apparent contradictions are actually authority-layer mismatches: prose-closed versus source-clean, source-clean versus kernel-connected, and finite-validated versus publication-closing.

## Consolidation thesis

The highest-value refactor is not another local theorem extraction. It is to create one generated **proof obligation registry** that joins:

- Lean declaration identity;
- publication-spine reachability;
- axiom closure;
- source file and namespace;
- cluster and terminal family;
- prose theorem/lemma IDs;
- active checkpoint/ledger;
- certificate/trust class;
- exact status and blocker;
- supersession lineage.

Every README table, canonical-prose status section, cluster ledger, and closure matrix should be generated from or checked against that registry. This would eliminate the project’s largest current risk: agents doing correct work against stale or off-spine obligations.

## Initial high-priority refactor candidates

### P0 — Single generated authority ledger

Create `proof-status/obligations.yaml` (or equivalent generated JSON) keyed by fully qualified Lean declaration. Generate:

- the README open-frontier table;
- canonical prose Appendix A/status tables;
- per-cluster work queues;
- off-spine `sorry` policy report;
- certificate/trust-boundary report;
- stale-document warnings.

### P0 — Separate publication source from generated/replay corpus

The current `Erdos9796Proof` source tree mixes handwritten proof API, coordinators, generated replay modules, and finite-bank machinery. Preserve imports, but introduce explicit roots such as:

- `P97/Core/` — general geometric/combinatorial library;
- `P97/Descent/` — handwritten publication proof and typed packets;
- `P97/Frontier/` — only live residual declarations and their consumers;
- `P97/Certificates/Promoted/` — publication-connected generated banks;
- `P97/Certificates/Research/` — off-spine banks and experiments;
- `P97/Legacy/` or repository-level `attic/` — unreachable/superseded Lean.

At minimum, enforce these roles through manifests and import-linting before physically moving thousands of files.

### P0 — Canonical packet/API layer across F1/F2/F3/A5

The recent work repeatedly reconstructs the same semantic payload under different names: source identity, deletion provenance, surviving centers, failing blocker, canonical row equality, cap membership, radius provenance, and ordered cyclic trace. Introduce a small hierarchy of typed packets rather than branch-specific conjunctions:

- `DeletionTrace`;
- `CanonicalRowTrace`;
- `CommonDeletionPacket`;
- `MultiCenterSurvivalPacket`;
- `RadiusProvenance` (`sameRadius` / `crossRadius` retained as data);
- `OrderedCapTrace`;
- `FiveSurviveOneFailPacket`;
- `TwoShellInteractionPacket`.

Cluster-specific contexts should extend these packets, not copy their fields.

### P1 — Consolidate finite-computation interfaces

Use one aggregate certificate per substantive finite enumeration and ordinary Lean projections for public theorem names. Replace small concrete `native_decide` calls with `decide` where practical. Do not count off-spine cleanup as a trust-cone improvement. Add a machine-generated certificate map recording:

- root computational theorem;
- checker definition;
- public projection theorems;
- trust axioms;
- publication reachability;
- source/replay hashes.

### P1 — Replace numbered prose copies with overlays/patch log

The file library contains many full copies (`authoritative(4)`, `(5)`, `v10`, A5 overlays, checkpoint-numbered F2 ledgers). Keep one canonical manuscript and append cluster updates as small, machine-mergeable fragments with stable section IDs. Full snapshots should be release artifacts, not active editing surfaces.

## Audit passes completed

- Current README, blueprint boundary, live frontier modules, coordinators, and shared packet definitions inspected.
- Cluster documents compared against current and later F1/F2/F3/A5 checkpoints.
- Generated/off-spine corpus and `native_decide` boundary reviewed at the public-interface level.
- Source import chain, repeated argument bundles, and representative module sizes measured.
- Prioritized migration sequence, acceptance gates, and anti-refactor warnings recorded below.


## Checkpoint 2 — source-architecture audit

### Measured frontier shape

The current README reports 28 reachable `sorry` leaves: 18 Rigid221, 1 TriApex, 6 TwoSource, and 3 TwoDeletion. A direct source scan of the nine named frontier modules found 30 distinct `sorry`-bearing declarations: 19 Rigid221, 1 TriApex, 7 TwoSource, and 3 TwoDeletion. The README separately lists off-spine placeholders, including files outside those nine modules. The exact source-to-spine reconciliation therefore requires a fresh built dependency mine; raw tokens and the current prose roster are not sufficient. This mismatch is itself evidence that the roster must be generated.

Selected source size:

| Cluster | Live modules inspected | Lines | Textual open declarations | README reachable |
|---|---:|---:|---:|---:|
| Rigid221 | 3 | 20,619 | 19 | 18 |
| TriApex | 1 | 6,092 | 1 | 1 |
| TwoSource | 4 | 20,292 | 7 | 6 |
| TwoDeletion | 1 | 1,154 | 3 | 3 |
| **Total** | **9** | **48,157** | **30** | **28** |

The large modules encode branch history in declarations rather than exposing a small intrinsic API. The strongest symptom is `Rigid221SourceHeavy.lean`: 18,439 lines, 148 declarations, and theorem names up to 158 characters long. These names are effectively serialized decision-tree paths.

### P0 refactor — stable public non-`IsM44` facade

Expose one stable theorem contract for the unresolved mathematics, for example:

```lean
theorem globalNonM44Contradiction
    (D : CounterexampleData)
    (hlarge : 10 ≤ D.A.card)
    (hnonM44 : ¬ IsM44 D.A) : False := ...
```

or the equivalent direct removable-vertex statement. The 28 leaves should remain tracked individually for implementation, but they should not be the permanent public mathematical API. This lets the internal strategy be regrouped without forcing upstream theorem signatures, prose chapters, or external agents to follow every branch split.

### P0 refactor — replace branch-path theorem APIs with normal-form APIs

Do not delete the old declarations immediately. Introduce a new layer:

```text
source/caller adapter
  -> intrinsic normal-form packet
  -> generic finite or geometric consumer
  -> legacy theorem-name wrapper
```

The legacy wrappers preserve compatibility while the proof spine migrates. Once every caller uses the intrinsic packet, the path-named declarations can be deprecated and later archived.

### P0 refactor — provenance-preserving joint-deletion hierarchy

F1 and F2 independently discovered the same architectural defect: the historical D1 packet forgets caller provenance needed by the strongest closure arguments. Introduce a shared hierarchy rather than one giant flattened structure:

```lean
structure JointDeletionCore ... where
  source : P
  sourceBlocker : P
  exactSourceRow : ExactFourCanonicalRow ...
  fixedSurvivals : Finset P
  fixedOmissions : ...

inductive ApexRadiusMode ...
  | sameRadius (P : SameRadiusJointDeletion ...)
  | crossRadius (P : CrossRadiusJointDeletion ...)

structure TriApexJointDeletionProvenance ... extends JointDeletionCore ... where
  allApexSurvivals : ...
  globalEscapeSet : ...
  capLabels : ...

structure TwoSourceJointDeletionProvenance ... extends CrossRadiusJointDeletion ... where
  smallRadius largeRadius : ℝ
  radii_lt : smallRadius < largeRadius
  smallClass largeClass : Finset P
  exactFourClasses : ...
  dangerousTriple : Finset P
  retainedTrace : ...
```

This makes the shared same-radius descent and cross-radius transport reusable while preserving the extra facts required by each caller.

### P0 refactor — split producers, normalizers, consumers

The current giant files mix source extraction, exact-cardinality bookkeeping, case classification, geometric contradiction, finite replay, and final dispatch. Proposed folder boundary:

```text
P97/ATail/Frontier/
  Core/                 -- canonical rows, blockers, source identity, deletion provenance
  Geometry/             -- shared Euclidean consumers
  Finite/               -- generic exact-cover/parity/overlap consumers
  NormalForms/
    Rigid221.lean
    TriApex.lean
    TwoSource.lean
    TwoDeletion.lean
  Clusters/
    Rigid221/{Ingress,Consumers,Coordinator}.lean
    TriApex/{Ingress,Consumers,Coordinator}.lean
    TwoSource/{Ingress,Consumers,Coordinator}.lean
    TwoDeletion/{Ingress,Consumers,Coordinator}.lean
  Legacy/               -- temporary wrappers under existing declaration names
```

### Cluster-specific consolidation candidates

#### Rigid221

The 18 reachable leaves should first be regrouped into a small set of intrinsic roots, while retaining wrappers:

1. exact-17 / cap-9 exact-cover root;
2. cardinality-at-least-18 source-heavy transport root;
3. exact-12 late-choice/A5 escape root;
4. source-heavy pentagon/off-class root;
5. global placement/nonphysical collision root;
6. post-card-eleven/two-radius residual root.

This does not assert that six roots are mathematically equivalent to all 18 leaves; it is the proposed packet boundary after shared producers and common split logic are factored out. A source audit must prove each wrapper factors through exactly one packet before any old leaf is removed.

#### TriApex

The mathematical work has already consolidated nine historical leaves to one reachable source theorem, and the latest prose closes the recursion/termination architecture. The code should now expose the bounded output type directly:

```lean
inductive TriApexJointDeletionOutcome ...
  | contradiction
  | crossApexExactFourPaired (...)
  | exactNonFirstSaturation (...)
  | transverseTwoRadius (...)
```

The one live theorem should be a thin coordinator over these bounded consumers. The 6,000-line historical module should not remain the permanent API surface.

#### TwoSource

The six live leaves are choice-dependent historical boundaries. The preferred architecture is intrinsic:

```text
all legal blockers
  -> choose fresh sources
  -> same-radius / cross-radius
  -> common-blocker / mutual-omission
  -> source-faithful L/S/X and five-row normal forms
```

The latest checkpoint work now closes the entire OLD-APEX role classifier A/B/C/D in prose, independently of carrier cardinality: A/B by a two-circle cone theorem, C by a strict convex-combination identity, and D by a polar half-span contradiction. The earlier `n = 17/18/19/20` cover analysis remains useful as a regression path but is no longer load-bearing for OLD-APEX. State-X transversality, exact overlap decomposition, adjacent-cap capacity, and these three metric kernels should be extracted as generic consumers rather than left inside cumulative F2 ledgers. Lean integration and a rebuilt spine remain required before any code-closure claim.

#### TwoDeletion

The three live source declarations are historical contracts. The newest source-faithful reduction bypasses them with a trace-family/common-grid/exact-five program and shares same-radius terminals with F1. Refactor to one producer returning a typed outcome, then a small coordinator whose only open dependencies are the genuinely Euclidean terminal consumers. Do not separately patch the three historical theorem bodies unless used as temporary wrappers.

### P96 conclusion

The P96 library is already well-factored: a 294-line Euclidean peeling proof plus a 101-line upstream bridge. Its conditional chain takes `UniversalProblem97Statement` explicitly, and all openness enters through the single unconditional P97 gateway. Preserve that separation. A generic graph-peeling abstraction could be extracted later, but it is not a high-priority refactor and should not be mixed into the P97 frontier migration.

---

## Checkpoint 3 — cross-cluster dependency and repeated-context audit

### P0 refactor — break the frontier cluster import chain

The current source has a literal cluster-to-cluster dependency chain:

```text
TwoSourceCanonicalSurface
  -> TriApexEndpointRetainedOmission
  -> Rigid221Closure
  -> Rigid221SourceHeavy
  -> Rigid221Placement
  -> TwoDeletionCollision
  -> B1Live
```

This is not a mathematical dependency order. It is an accumulation order: later modules import earlier cluster coordinators to reuse a few generic helpers or already-assembled surfaces. The import-only `FrontierLiveClosure.lean` already imports the cluster modules as siblings, so the reverse chain inside those siblings is redundant and materially enlarges every edit's build, review, and axiom cone.

#### Target dependency rule

```text
Frontier/Core
Frontier/Geometry
Frontier/Finite
Frontier/NormalForms
        ^
        |
Clusters/{Rigid221,TriApex,TwoSource,TwoDeletion}
        ^
        |
FrontierLiveClosure coordinator
```

A cluster implementation must not import another cluster's coordinator or leaf module. When a helper has two consumers, move it to the lowest shared layer. When a theorem is genuinely cumulative, place the cumulative adapter in the top coordinator rather than importing the earlier cluster implementation.

#### Enforcement

Add a fast import-lint check that rejects edges matching:

```text
...FrontierLiveClosure.<ClusterA>
  imports
...FrontierLiveClosure.<ClusterB>
```

except from explicitly named `Legacy` wrappers during migration. The check should run before the full build and report the exact forbidden edge.

### P0 refactor — introduce context records for repeated argument bundles

A normalized six-line clone scan over the twelve source-audited modules found 138 cross-file repeated windows. This is a heuristic, not a semantic equivalence proof, but the leading clones are unambiguous API smells.

The same TwoSource argument bundle occurs in 34–35 locations across `TwoSourceFreshThirdResidual.lean`, `TwoSourceFirstFiberCollision.lean`, and `TwoSourceClosure.lean`:

```lean
(P := P) (Pρ := Pρ)
(hρne := hρne)
(hfrontierFour := hfrontierFour)
(hρfour := hρfour)
(hfrontierInteriorEq := hfrontierInteriorEq)
(hρInteriorEq := hρInteriorEq)
(T := T) (hpairsDisjoint := hpairsDisjoint)
(hblockersNe := hblockersNe)
(LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
(LP := LP) (hLP := hLP) (MP := MP)
```

Replace that surface with one structure, tentatively:

```lean
structure TwoSourceCollisionFrame ... where
  P Pρ : ExactFourInteriorPair ...
  radii_ne : ...
  frontier_exactFour : ...
  second_exactFour : ...
  frontier_interior_eq : ...
  second_interior_eq : ...
  pairsDisjoint : ...
  blockersNe : ...
  frontierLocalization : ...
  secondLocalization : ...
```

Similarly, the post-card-eleven bundle

```lean
(R : OriginalUniqueFourResidual F)
(hcard : 12 ≤ D.A.card)
(surface : ExactFourPostCardElevenRobustSurface R)
```

is repeated across `Rigid221Closure.lean` and `TwoDeletionCollision.lean`. Package it as `PostCardElevenSurfaceFrame`. Other repeated families warrant small records for robust-apex facts, common-radius/FreshThird support alignment, and first-fiber crossed exact supports.

The goal is not shorter syntax alone. Context records make provenance fields stable, let consumers state exactly which facts they use, and prevent theorem signatures from changing every time a new invariant is discovered.

### P0 refactor — split the existing `JointDeletionCore`

`JointDeletionCore.lean` is not a core module in dependency terms. The audited version is 755 lines with 36 direct imports spanning certificate ingress, Kalmanson geometry, cap localization, pinned multiplicity, exact-five splitting, constructors, and public packet types.

Split it without changing public statements:

```text
JointDeletion/Types.lean
  -- minimal imports; data structures and elementary projections only

JointDeletion/Constructors.lean
  -- source-faithful constructors and deletion-semantics adapters

JointDeletion/ExactFiveSplit.lean
  -- private finite exact-five classifications

JointDeletion/PinnedMultiplicity.lean
  -- pinned-multiplicity ingress and projections

JointDeletion/CardElevenBridge.lean
  -- certificate-facing/card-eleven adapters

Legacy/JointDeletionCore.lean
  -- temporary re-export preserving current imports
```

The minimal `Types` file should become the shared import for F1, F2, F3, and Rigid221. Heavy certificate or geometry modules must not be imported merely to mention a joint-deletion packet.

### P0 refactor — make “all blockers, late choice” the canonical API

Several historical F2 leaves exist because `CriticalShellSystem` chooses one blocker per source before the useful source pair, radius mode, or target cap is known. The newer F2 reduction avoids this by retaining all legal blockers and selecting a section only after the intrinsic branch is identified. This should be promoted from a local F2 workaround to the canonical blocker API.

Recommended split:

```lean
def IsCanonicalBlocker (A : Finset P) (source center : P) : Prop := ...

structure CanonicalBlockerRelation ... where
  blocks : P → P → Prop
  blocks_iff : ...
  source_nonempty : ∀ source, source ∈ A → ∃ center, blocks source center

structure BlockerPreference ... where
  preferred : source → center → Prop
  exists_preferred_or_default : ...

def chooseCriticalShellSystem
    (R : CanonicalBlockerRelation ...)
    (pref : BlockerPreference ...) : CriticalShellSystem ... := ...
```

Core combinatorial and geometric arguments should quantify over the relation. A total selected system remains available as a compatibility adapter and for finite encodings that genuinely need a function. This prevents arbitrary early choices from becoming theorem branches.

---

## Checkpoint 4 — generated certificates, trust boundary, tooling, and documentation

### P0 refactor — separate four code populations explicitly

The repository currently mixes four very different populations under one default import closure:

1. handwritten mathematical library;
2. generated finite certificates and replay modules;
3. open frontier/research coordinators;
4. off-spine diagnostics and historical experiments.

The current README reports 5,213 Lean files and roughly 1.46 million lines, while the published spine is roughly 320,000 lines. It also reports 1,279 files and 11,114 symbols unreachable from any Lake import chain. This is not necessarily waste—much of it is retained evidence—but it requires explicit boundaries.

Recommended roots:

```text
Erdos9796Proof.Handwritten
Erdos9796Proof.GeneratedCertificates
Erdos9796Proof.Frontier
Erdos9796Proof.Publish
Erdos9796Proof.ResearchDiagnostics   -- never imported by Publish
```

Recommended CI matrix:

| Target | Purpose | Required checks |
|---|---|---|
| `handwritten` | fast semantic library regression | build, lint, no `sorry`, no unapproved trust roots |
| `generated` | certificate/replay integrity | generator digest, source manifest, replay build, axiom audit |
| `frontier` | all live research APIs | build, reachable-`sorry` roster, forbidden-import lint |
| `publish` | actual claims | full build, generated spine, `#print axioms`, publish verification |
| `diagnostics` | optional regression models | separate build; never affects publication status |

The default developer loop should not rebuild every frozen generated bank after a change to an unrelated shared theorem. The existing kernel-mined narrow source manifests are the right mechanism; the root split makes their scope visible.

### P1 refactor — one authenticated certificate interface per bank

The native-decision audit already identifies the preferred boundary:

```text
small closed propositions
  -> kernel `decide` where practical

large generated search
  -> one or a few mathematically meaningful aggregate certificates
  -> ordinary structural projection theorems
```

Do not optimize raw counts of `native_decide` calls without checking publication reachability. Off-spine F2 diagnostics can move six explicit checks to `decide`, but that does not shrink the publication trust cone. Conversely, the Surplus bank audit found structural arguments that can reduce the published source-level native roots while retaining five meaningful aggregate certificates.

Every generated bank should expose a manifest record containing:

```yaml
bank_id:
generator_entrypoint:
generator_version:
input_sha256:
generated_source_sha256:
lean_dependency_manifest_sha256:
checker_theorem:
aggregate_certificate_theorems:
public_projection_theorems:
trust_mode: kernel | native_decide | replay
publication_reachable: true | false
last_verified_head:
```

The public API should name semantic results, not parser counts, array lengths, or duplicated whole-list equalities unless a consumer truly needs them.

### P1 refactor — unified theorem-asset catalog

The project has several mined theorem-bank registries, certificate censuses, and semantic-search corpora. Consolidate their metadata—not the theorem sources—into one generated catalog:

```yaml
declaration:
statement_hash:
source_head:
source_file:
axiom_class:
publication_reachable:
semantic_tags:
immediate_consumers:
supersedes:
search_corpus_status:
```

Feed the catalog into nthdegree/semantic Lean search so agents can distinguish a current kernel-clean theorem from a historical, generated, off-spine, or transitively open match before attempting reuse. Keep the existing bounded “search once per concrete candidate” workflow; the consolidation is about authoritative metadata, not repeated global search.

### P1 refactor — script registry and command consolidation

The repository has 361 scripts and intentionally uses per-lane entrypoints rather than one global `test.sh`. Preserve lane ownership, but add a machine-readable script registry instead of making users infer status from filenames.

Suggested `scripts/manifest.yaml` fields:

```yaml
- id: surplus-compg-shadow
  entrypoint: scripts/surplus-compg-shadow.py
  status: production-generator
  owner_area: P97/surplus
  inputs: [...]
  outputs: [...]
  generated_root_policy: governed
  replay_command: ...
  consumers: [...]

- id: old-f2-diagnostic
  entrypoint: ...
  status: archived-diagnostic
  publication_reachable: false
```

Add a small `uv run python -m p97tools` dispatcher only for discoverability and validation; do not rewrite the working generators merely to share a CLI. Archive or quarantine scripts only after a reference/writer scan, consistent with the existing move-only hygiene policy.

### P0 refactor — generated obligation registry as the sole status source

The present documentation has at least four authorities:

1. built Lean dependency/axiom truth;
2. README status prose;
3. the “authoritative” full prose manuscript;
4. rapidly advancing cluster checkpoints and overlays.

They are already out of sync. The current repository whole-manuscript file still advertises F1 D1-v23/F2 checkpoint 36/F1 v87-era details, while active work has advanced to the F1 checkpoint-117 architecture, F2 checkpoint 95 with OLD-APEX prose-closed, F3 v13 with a three-root metric frontier, and the later A5 Cell-5 closure overlay. A file named `v90` even contains Checkpoint 117, showing that filenames can no longer carry authority safely.

Create a checked-in registry generated from the built spine and augmented by reviewed research metadata:

```yaml
schema: p97-obligation-registry/v1
source_head: <commit>
build_fingerprint: <hash>
publish_target: Problem97.erdos97_rhs
obligations:
  - id: P97-F1-D1
    lean_decl: Problem97....false_of_...
    reachable: true
    source_file: ...
    mathematical_packet: TriApexJointDeletionOutcome
    code_status: sorry
    prose_status: bounded-outcome-architecture-closed
    evidence_status: prose-derived
    latest_checkpoint: ...
    supersedes: [...]
    open_children: [...]
    trust_notes: ...
```

Generate from it:

- README frontier table;
- `docs/live-blueprint.md` annotations;
- cluster `CURRENT.md` pages;
- the prose manuscript status appendix;
- agent task ledgers.

Human-authored prose may explain a result, but must not independently restate leaf counts or claim current authority.

#### Stable obligation IDs and legacy labels

Do not use theorem names, section labels such as `D1`, or checkpoint filenames as primary identities. Assign stable IDs such as:

```text
P97-R221-EX17
P97-TA-JOINT
P97-TS-LR8
P97-TD-DIAG
```

Store `lean_decl`, `legacy_labels`, and `prose_section_ids` as aliases. This resolves the current overload among A5/B-family/F1/F2/F3/D1/I-series names and allows declarations to be renamed or regrouped without losing history.

### P1 refactor — checkpoint deltas, not complete manuscript copies

The current project library has repeated full-manuscript exports, checkpoint-numbered copies, overlays, patches, status manifests, and handoffs. The previous organization pass correctly separated canonical, active supplements, references, supporting artifacts, and archive. The next step is to make that model native to the repository:

```text
docs/proof/
  canonical-body.md                 -- stable exposition, minimal live status
  status.generated.md               -- generated from obligation registry
  clusters/
    F1/CURRENT.md                   -- generated pointer + concise human summary
    F1/checkpoints/0117-....md       -- append-only delta
    F2/checkpoints/0092-....md
  overlays/                         -- unmerged whole-body patches, temporary only
  archive/                          -- explicit supersession metadata
```

A checkpoint should contain:

- exact source/head anchor;
- theorems or packets added/changed;
- proof or countermodel delta;
- obligations removed/created;
- implementation impact;
- validation performed and not performed;
- explicit predecessor.

The canonical body should be rebuilt mechanically from reviewed deltas only when a coherent mathematical chapter needs rewriting. Do not create a new complete “authoritative” copy for every cluster advance.

### P1 refactor — controlled status vocabulary

Use one enum across Lean comments, YAML, README, and prose:

```text
KERNEL_CLEAN
CERTIFIED_APPROVED_TRUST
SOURCE_CLEAN_TRANSITIVELY_OPEN
PROSE_CLOSED_LEAN_UNIMPLEMENTED
NORMAL_FORM_CLOSED_TERMINAL_OPEN
OPEN_MATHEMATICAL
REFUTED_LOCAL_STATEMENT
OFF_SPINE_DIAGNOSTIC
SUPERSEDED
```

Keep implementation effect (`direct closer`, `branch closer`, `helper`, `bypass`) as a separate field. This prevents “closed” from ambiguously meaning a local branch, a normalizer, a source-clean wrapper, or a kernel-clean publication dependency.

---

## Checkpoint 5 — shared mathematical libraries worth extracting

### P1 refactor — reusable finite incidence normal forms

Several recent closures are not cluster-specific and should become small, tested libraries:

1. **Two-sided pair-code saturation.** F3's three covered common rows force two bijective pair codes, disjoint source remainders, a permutation normal form, and ultimately parity contradiction. Export the general finite theorem independently of joint deletion.
2. **Covered-row bound.** The same argument strengthens a common grid from “at most three covered rows” to “at most two.” Make this the only public coverage theorem; leave the weaker result as a wrapper.
3. **Exact overlap decomposition.** F2's identity relating new-old hits, new-new overlap, and `20 - |A|` is a generic four-row/five-row cover lemma.
4. **Adjacent-cap incidence capacity.** The bound that two new rows contribute at most three strict incidences to one adjacent cap is reusable in F1/F2/Rigid placements.
5. **Finite exact-cardinality dispatchers.** Consolidate repeated `card = 12/15/16/17/...` arithmetic and exact support decomposition into packet constructors rather than reproving `Finset` bookkeeping in each leaf.

Each theorem should have a minimal finite-set statement plus source-facing adapters. Do not bake Moser-apex or blocker names into the finite core.

### P1 refactor — focused Euclidean consumers

The new proof work repeatedly uses a small set of geometric mechanisms:

- two-hit center localization in a strict cap;
- perpendicular-bisector arc separation/codegree bounds;
- circumcenter/chord-side sign and obtuse-angle consequences;
- strict convex-combination contradictions from circle equalities;
- Kalmanson strict inequalities for named cyclic orders;
- cap-sum counting against exact four-row covers;
- scalar normal forms for three centers on pair bisectors.

The repository already has many Kalmanson and cap modules, so the refactor should begin with an inventory and re-export layer, not another generic “Geometry” dumping ground. For each mechanism:

```text
mathematical core theorem
  + order/cap adapter
  + cluster-specific packet adapter
```

In particular, the complete F2 OLD-APEX closure now decomposes into three cardinality-independent geometric consumers: one cone theorem covering roles A/B, one convex-combination theorem for role C, and one polar half-span theorem for role D. Promote those cores to named five-/six-point theorems; the four F2 role declarations should become thin adapters and the cardinality cover route should remain only as a regression/audit theorem family.

### P0/P1 refactor — one source-faithful diagonal joint-deletion packet

The latest F2 work identifies its State-X distinct-support terminal with the same three-source/three-critical diagonal packet appearing in F1 D1 exact-five; F3's common-grid diagonal route has the same incidence shadow but different provenance. This is the strongest cross-cluster mathematical consolidation found in the audit.

Define a minimal core:

```lean
structure DiagonalJointDeletionCore ... where
  centers : Fin 3 → P
  sources : Fin 3 → P
  rows : (i : Fin 3) → ExactCanonicalFourRow (centers i)
  source_mem_own : ∀ i, sources i ∈ (rows i).support
  source_not_mem_other : ∀ i j, i ≠ j → sources i ∉ (rows j).support
  centers_injective : Function.Injective centers
  sources_injective : Function.Injective sources
  deletionSurvival : ...
```

Then add provenance extensions:

```text
F1: exact-five / 2+2+1 / all-large TriApex provenance
F2: original rich source, two radii, retained L/S/X trace provenance
F3: common-grid trace family and diagonal support-location provenance
```

The first shared consumer should be a strict continuation theorem, not necessarily an immediate contradiction: diagonal packet implies a fourth critical center, a 15/16-point four-row cover, or a fifth-center escape. Cluster-specific terminal geometry can then consume the extension. Do not identify the three callers merely from the diagonal matrix; the extension records are essential.

### P1 refactor — one same-radius descent shared by F1 and F3/F2 callers

The latest F1 architecture has exactly one recursive mechanism: same-apex, same-radius interval descent on the natural-number measure `mu`. Cross-apex or cross-radius changes are terminals, not recursive calls. This should be implemented once as a generic theorem over a provenance-preserving source interface.

```lean
inductive SameRadiusDescentResult ...
  | contradiction
  | exactFourPaired (...)
  | twoCapExport (...)
```

F1, F2, and F3 should provide ingress adapters and terminal extensions. No caller should reimplement the measure or flatten a cross-radius terminal back into the recursive state.

### P1 refactor — promote the universal physical-source package

The prose work already generalizes several named-source arguments to a universal `∀ v` package: exact traces, blocker fibers, deletion fans, sparse conflict graphs, and survival amplification. Put the Lean versions behind one shared module and make named-`v` theorems projections or aliases. This is a direct consolidation across F1/F3 and prevents future agents from re-proving the same fan theorem after choosing a different source label.

### P2 refactor — generic P96 graph peeling only after P97 stabilization

P96's peeling argument could eventually be abstracted into a graph-theoretic degeneracy/counting theorem with the Euclidean degree bound as an adapter. That may improve reuse and exposition, but the current 395-line P96 library is already clean and isolated. It offers much less payoff than the P97 frontier and should be deferred.

---

## Checkpoint 6 — what not to consolidate

1. **Do not merge P96 and P97 proof internals.** P96 should continue to depend on the explicit universal P97 statement through one bridge.
2. **Do not flatten caller provenance into one universal mega-structure.** Use a small core plus caller-specific extensions.
3. **Do not force all finite checks into one opaque certificate.** Keep distinct semantic theorem names; aggregate only the expensive computation.
4. **Do not replace working generated banks with handwritten proofs solely to reduce line count.** Optimize the authenticated public boundary, not repository aesthetics.
5. **Do not delete legacy theorem names during the first migration.** Preserve them as wrappers until all callers and external agents have moved.
6. **Do not treat checkpoint chronology as a dependency graph.** Encode actual theorem/packet dependencies in the obligation registry.
7. **Do not abstract a lemma after one use.** Promote it when it has at least two genuine consumers or when it removes an import inversion.
8. **Do not combine F1/F2/F3 metric terminals merely because their incidence shadows look alike.** Share the core shadow and retain provenance extensions until an equivalence theorem is proved.
9. **Do not spend production integration effort on off-spine diagnostics unless they remain useful regressions.** Their trust cleanup is secondary to publication-reachable roots.
10. **Do not claim a refactor reduces openness until a rebuilt spine and axiom mine confirm it.** Moving a `sorry`, bypassing a declaration, or producing a source-clean wrapper is not closure.

---

## Consolidation scorecard

| ID | Refactor | Priority | Expected payoff | Mathematical risk | Migration risk |
|---|---|---:|---:|---:|---:|
| R0 | Generated obligation registry and status generation | P0 | Very high | Low | Low–medium |
| R1 | Break cross-cluster import chain | P0 | Very high | Low | Medium |
| R2 | Split `JointDeletionCore` into minimal layers | P0 | High | Low | Medium |
| R3 | Context records for TwoSource/post-card-eleven/robust-apex bundles | P0 | High | Low | Low–medium |
| R4 | Canonical all-blockers relation with late selected-system adapter | P0 | Very high | Medium | High |
| R5 | Provenance-preserving joint-deletion hierarchy and shared same-radius descent | P0 | Very high | Medium | High |
| R6 | Typed outcome coordinators for F1/F3; legacy wrappers | P1 | High | Medium | Medium |
| R7 | Intrinsic F2 coordinator replacing choice-dependent six-leaf API | P1 | Very high | Medium | High |
| R8 | Rigid221 regrouping into packet roots | P1 | Very high | Medium–high | High |
| R9 | Shared finite incidence/parity/overlap library | P1 | High | Low–medium | Medium |
| R10 | Focused geometric consumer extraction | P1 | High | Medium | Medium |
| R11 | Generated certificate manifests and aggregate interfaces | P1 | High | Low | Medium |
| R12 | Script registry and research-diagnostic isolation | P1 | Medium | Low | Low–medium |
| R13 | Delta-based proof documentation | P1 | High | Low | Medium |
| R14 | Unified theorem-asset catalog and search metadata | P1 | Medium–high | Low | Low–medium |
| R15 | Generic graph peeling for P96 | P2 | Low–medium | Low | Medium |
| R16 | Shared diagonal joint-deletion core plus caller provenance | P0/P1 | Very high | Medium | High |

---

## Recommended migration sequence

### Phase 0 — freeze and measure

1. Record exact `HEAD`, dirty state, toolchain, and dependency pins.
2. Run the full build, generated spine, publish verification, and axiom mine.
3. Materialize `proof-status/obligations.yaml` from the measured 28-leaf roster plus the three off-spine `sorry`s.
4. Record per-module source hashes and the current forbidden cluster-import edges.
5. Make no mathematical changes in this phase.

**Gate:** generated README/status tables exactly reproduce the existing build-derived roster.

### Phase 1 — dependency extraction with compatibility wrappers

1. Split `JointDeletionCore` while retaining a re-export module.
2. Add `TwoSourceCollisionFrame`, `PostCardElevenSurfaceFrame`, and the first two high-frequency context structures.
3. Move generic helpers that cause cluster imports into shared modules.
4. Add the forbidden cluster-import lint.
5. Leave every current open declaration and caller intact through wrappers.

**Gate:** full build and axiom closures unchanged; reachable open count remains exactly 28; no new cluster-to-cluster import edge.

### Phase 2 — provenance and blocker API

1. Introduce `CanonicalBlockerRelation` and a late-choice compatibility constructor for `CriticalShellSystem`.
2. Introduce the small `JointDeletionCore` plus `SameRadius`/`CrossRadius` variants and caller extensions.
3. Port the already source-clean producers first; do not port terminal consumers simultaneously.
4. Prove round-trip adapter lemmas where old and new packets carry equivalent data.

**Gate:** old public theorem signatures elaborate unchanged; new packets can reconstruct every field used by current callers; no provenance is inferred from cardinality alone.

### Phase 3 — cluster coordinators

Recommended order:

1. **TriApex**, because one reachable root and the same-radius termination architecture are already sharply defined.
2. **TwoDeletion/F3**, because its three old placeholders are explicitly bypassed by a typed trace/common-grid program and it shares the joint-deletion core.
3. **TwoSource**, migrating to all-blockers and intrinsic radius/blocker modes while retaining the seven-cell and L/S/X normal forms.
4. **Rigid221**, last, after the shared post-card-eleven, exact-cover, and joint-deletion APIs are stable.

For each cluster:

```text
ingress adapter
  -> intrinsic outcome
  -> existing/new consumers
  -> legacy leaf wrappers
```

**Gate:** every old leaf has a machine-checked factorization entry in the obligation registry; no leaf is removed merely because it is bypassed.

### Phase 4 — certificates and documentation

1. Add bank manifests and aggregate semantic interfaces on publication-reachable certificate banks.
2. Convert small explicit finite regressions to `decide` where benchmarks pass.
3. Generate all live status pages from the obligation registry.
4. Convert future research checkpoints to append-only deltas.
5. Archive superseded full copies only after replacement links and hashes are recorded.

**Gate:** publication axiom/trust report is no worse; generated docs contain no manually maintained leaf counts; all active checkpoints identify one exact predecessor and source anchor.

---

## Acceptance criteria for the refactor program

The refactor is successful before it closes any new mathematics when all of the following hold:

- `proof-blueprint spine` and `#print axioms` agree with the pre-refactor baseline;
- one generated registry identifies every reachable and off-spine open declaration;
- no cluster implementation imports another cluster implementation;
- shared packet types have minimal import cones;
- the long repeated TwoSource and post-card-eleven bundles are context records;
- current theorem names remain available as wrappers;
- F1/F2/F3 source identity, blocker identity, radius mode, cap labels, and deletion provenance survive every adapter;
- generated banks have authenticated manifests and a small semantic public surface;
- research diagnostics cannot enter the publication root accidentally;
- README, live blueprint annotations, cluster pointers, and prose status appendices are generated from one source;
- every checkpoint states what was validated, what was not, and what it supersedes.

Only after these invariants are in place should source line-count reduction or legacy-declaration deletion become a goal.
