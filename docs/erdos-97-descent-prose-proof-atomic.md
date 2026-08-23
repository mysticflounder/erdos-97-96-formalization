---
title: "The Erdős 97 Descent Argument"
subtitle: "Authoritative merged atomic prose proof, blocker reformulation, and exact open frontier"
author: "Working proof manuscript"
date: "23 August 2026"
---

**Repository:** `mysticflounder/erdos-97-96-formalization`
**Git repository:** `https://github.com/mysticflounder/erdos-97-96-formalization`
**Built-spine status measurement:** refreshed kernel mine of 23 August 2026
**Source-read anchor used for the late-first-apex API:** commit `bc4c04db398979c57edaf4af9c60e1eae984f436` (20 August 2026)
**Authoritative consolidation:** 22 August 2026
**Latest companion-agent merge:** A5 same-side metric-cell audit, F1 checkpoint-4/D1-v23/D8 reconciliation, F2 checkpoint 36, FreshThird preferred-choice patch kit, and the F3 third-pass trace-system correction, 22 August 2026
**Latest theorem-discovery checkpoint:** universal physical-source (`∀v`) trace, blocker-fiber, deletion-fan, sparse-graph, and survival-amplification package extracted from the F3 trace-digraph pass, 22 August 2026
**Current Lean-frontier annotation audit:** live source and all 117 archive files reconciled on 22 August 2026; the F1 reverse-hit refactor was built and kernel-mined on 23 August 2026, reducing the global reachable frontier from 36 to 29 and TriApex from nine roots to D1 and D2
**Document status:** Authoritative merged research manuscript. It consolidates the latest A5 escape metric-cell audit, the source-audited TriApex specification and implemented reverse-hit-to-D1 bypass, the intrinsic F2 all-blockers/late-choice reduction through checkpoint 36, the preferred-first-cap FreshThird compatibility proof, the corrected nonrecursive F3 physical-trace program, and the universal physical-source (`∀v`) theorem package. The elementary descent, packet extraction, and `IsM44` branch are reconstructed in full. A5 same-side Cell 7 and the rebased raw-main FreshThird route are locally prose-closed as stated below; the TriApex D1 and D2 consumers, four intrinsic F2 terminals and F8 adapter, five F3 metric roots, and the general non-`IsM44` theorem remain open.

> **Merge authority and verification boundary.** This file supersedes the prior authoritative merge and incorporates the A5 escape-refactor audit, the F1 checkpoint-4 continuation and D1-v23 ingress, F2 checkpoint 36, the FreshThird preferred-choice v2 patch kit, the third-pass correction to the F3 program, and the universal physical-source checkpoint. The A5 finite audit was replayed by exact scripts; the FreshThird patch passed static source and `git apply --check` audits; and the F1/F2/F3 source declarations were read in the live checkout. The 23 August F1 refactor additionally passed a focused `lake-build`, refreshed kernel reference mining, and direct axiom audits. Its selector is kernel-clean, but its contradiction route and the publication target still reach `sorryAx` through D1/D2 and the other clusters. Prose-complete reductions, static patches, source-clean helpers, frontier reductions, and kernel-verified closure are therefore kept separate throughout.
>
> **Bundle-integration receipt.** This revision synthesizes every file in `/tmp/Erdos-97-Proof-complete-2026-08-22.tar` (SHA-256 `e0a2df74165ed4ed13925273bc2e064eaafc51696139f02307cf861a551fc357`) into this manuscript, the dated branch audits, the literature note, the B-family plan, the dead-end/status ledgers, or the source-accounting ledger. Superseded drafts and duplicate exports contribute provenance and corrected lessons; they are not copied back as competing proof authorities.

# Contents

**0.** Reader's guide and status convention
  - **0.2.** Git repository and Lean codebase navigation for agents
**1.** Basic objects
**2.** Atomic calculus of a selected class under deletion
**3.** Exact deletion failure and canonical blockers
**4.** Pinned multiplicity reformulation
**5.** Incidence consequences of the all-blockers relation
   - **I15.** Universal physical-source (`∀v`) theorem package
**6.** Elementary descent and strong induction
**7.** Minimum-enclosing-circle and surplus-cap extraction
**8.** Atomic erased-pin interfaces in the `IsM44` branch
**9.** The `IsM44` branch, expanded atomically
**10.** The non-`IsM44` branch, expanded atomically
**11.** Current decomposition of the open theorem
**12.** Results of the strengthened geometric attack
**13.** What the missing global theorem must add
**14.** Proposed atomic all-blockers API
**15.** Conditional complete proof of descent
**16.** Complete proof-status ledger
**17.** Theorem-to-source crosswalk
**Appendix A.** Exact rational local B2 stress model
**Appendix B.** Adversarial checklist for terminal lemmas
**Appendix C.** Final research conclusion

## 0. Reader's guide and status convention

This document expands the descent argument into small, individually checkable statements. Its purpose is not merely to restate the Lean call graph. It makes explicit every logical transition normally compressed into phrases such as “deletion destroys the witness,” “minimality gives a blocker,” or “the cap argument supplies a removable point.”

Four mathematical status labels are used.

- **[PROVED]** The statement is proved in the current Lean development without a `sorry` on its transitive path, apart from the repository's ordinary core axioms.
- **[CERTIFIED]** The statement is closed on the current proof spine using the project's declared `native_decide` certificate trust boundary. It does not reach `sorryAx`, but its axiom closure includes `Lean.ofReduceBool` and `Lean.trustCompiler`.
- **[DERIVED]** The statement follows mathematically from proved repository lemmas, and a complete prose proof is supplied here, but the exact standalone declaration proposed in this manuscript may not yet exist under that name in Lean.
- **[OPEN]** A genuinely new theorem is still required. An open coordinator, a finite abstraction, or an intended geometric picture is not counted as a proof.

### 0.1 Lean-closure annotation convention

A second, independent set of annotations records the expected effect of formalizing a prose section against the **current Lean source**. These annotations concern implementation impact, not mathematical truth status.

- **[LEAN-DIRECT-CLOSER]** The section contains a complete proof matching the full statement of a current `sorry`-carrying declaration. Formalizing it should remove that `sorry` without strengthening the theorem or introducing a new open child.
- **[LEAN-BRANCH-CLOSER]** The section completely refutes a strict child case inside a current `sorry`, but the existing declaration must first be split or its proof must explicitly perform that case split. It reduces the current leaf but does not remove the parent `sorry` by itself.
- **[LEAN-HELPER-READY]** The section gives a complete prose proof of a helper, normalizer, classifier, or continuation theorem that should be formalizable from already proved source facts. It is not itself the full statement of a current `sorry`.
- **[LEAN-BYPASS-CANDIDATE]** The section describes a source-faithful refactor that could remove a current `sorry` from the reachable spine without proving that declaration at its present information-poor boundary. Every downstream root named by the refactor must still be closed.
- **[LEAN-NOT-A-CLOSER]** The section is a stress model, conditional calculation, scope correction, or negative result. It is useful proof-safety information but should not be assigned as a task to fill a `sorry`.

> **Current audit conclusion.** No remaining open root yet qualifies as `[LEAN-DIRECT-CLOSER]`. The implemented TriApex bypass proves the reverse-hit selector and removes seven endpoint-specific declarations from the reachable frontier by routing them through D1; it does not prove D1. The current publication spine has 29 `sorry` leaves. The newest prose work also adds a complete A5 same-side Cell 7 proof, gives a prose-complete preferred-system proof of the later raw-main FreshThird packet, reduces the old six-leaf F2 architecture to two intrinsic open roots, and closes the finite-set/state calculus underlying a proposed F3 well-founded descent. The latter F2/F3 results are bypass/helper frameworks, not proofs of their terminal roots.

The current positive annotation map is:

| Prose section | Annotation | Expected Lean effect |
|---|---|---|
| A5.9 | `[LEAN-BRANCH-CLOSER]` | closes the `d = xv` child of the current A5 exact-twelve leaf after a source-faithful split |
| A5.12 | `[LEAN-BRANCH-CLOSER]` | closes the complete `Bxu` role family, six source-tagged A5 cells |
| A5.13e | `[LEAN-BRANCH-CLOSER]` | closes the U-family collision `d = a` |
| A5.13g | `[LEAN-BRANCH-CLOSER]` | closes the U7 physical traces `{t,v}` and `{v,xv}` |
| A5.13j1 | `[LEAN-BRANCH-CLOSER]` | closes the additional escape trace `{xu,xv}` |
| A5.13j6b | `[LEAN-BRANCH-CLOSER]` | closes the physical-apex collision `O ∈ Kxv` |
| A5.13j8a, same-side Cell 7 | `[LEAN-BRANCH-CLOSER]` | closes one of the ten exact same-side A5 slot cells by the cocircular nested-bisector midpoint contradiction; nine same-side cells remain |
| A5.13k | `[LEAN-BRANCH-CLOSER]` | closes twenty of the forty-nine raw U7 trace/hit products |
| A5.7a, A5.10-A5.11, A5.13c, A5.13j6e-A5.13j6i, A5.13j6o-A5.13j6v, A5.13j8-A5.13j8a, A5.16 | `[LEAN-HELPER-READY]` | supplies prose-complete A5 normalizers, exact fiber/cardinality facts, order classifiers, continuation producers, exact ten-cell coverage contracts, and the nine-cell residual interface |
| TriApex D8.a | `[LEAN-BRANCH-CLOSER]` | historical local closer retained for research value; D8 is now a source-clean compatibility wrapper through D1 and is off the active reverse-hit spine |
| TriApex reverse-hit selector / D0-D13 | `[LEAN-BYPASS-CANDIDATE]` (implemented and kernel-checked) | proves `nonempty_pairedApexClassJointDeletion_of_reverseHit`, routes D3--D9 through D1, and reduces nine TriApex roots to D1 and D2; it does not prove either root |
| CD1-CD11 in §16.5.38 | `[LEAN-HELPER-READY]` | supplies the canonical common-deletion calculus and robust-apex tetrahedron-or-continuation theorem used to reduce A5/A7/A8 |
| I15.0-I15.11, universal physical-source package | `[LEAN-HELPER-READY]` | promotes named-`v` trace, blocker-fiber, boundary-placement, deletion-fan, sparse conflict-graph, and survival-amplification arguments to a source-independent API; no whole leaf closes |
| F2 §§0-11, intrinsic all-blockers reduction | `[LEAN-BYPASS-CANDIDATE]` plus `[LEAN-HELPER-READY]` | replaces the old E1/E2/E3/F1/G1/H1 architecture by four intrinsic packets and two open roots; all finite late-choice and trace normalizers are prose-complete |
| F2 §19 preferred-choice compatibility lane | `[LEAN-BYPASS-CANDIDATE]` | closes the raw-main common-radius distinct-cap FreshThird route after rebasing onto a first-cap-preferred system; source patch is statically checked, Lean build pending |
| F3.32-F3.73 and §16.5.I0-I32 | `[LEAN-HELPER-READY]` | preserves the local joint-locus calculus and adds the physical-trace, sparse-graph, survival-fan, bounded, grid, and diagonal packages; the former recursive wrapper is rejected and five metric roots remain open |

Sections carrying no Lean-closure annotation retain their ordinary mathematical status only. In particular, `[DERIVED]` does not automatically mean that a current Lean leaf is closed.

The current public README says that neither Problem 97 nor Problem 96 is proved. It reports 29 `sorry`-carrying leaves reachable from the Problem 97 publication target, all below the general non-`IsM44` A-tail contradiction. Those leaves are one refinement tree for a single load-bearing mathematical assertion.

> **Global non-`IsM44` contradiction.** There is no minimal nonempty convexly independent K4 set of cardinality greater than nine that admits a surplus-cap packet but admits no `IsM44` surplus-cap packet.

If that assertion is proved, the existing source-clean adapters immediately close `RemovableVertexOfLarge`, then the descent theorem, then the strong-induction wrapper. A different theorem that produces a removable vertex under the same hypotheses would close the same spine.

### 0.2 Git repository and Lean codebase navigation for agents

This manuscript is intended to be used together with the live Lean development, not instead of it. An agent who needs to verify a theorem signature, recover a producer hypothesis, test whether a prose lemma really closes a branch, or locate the current import boundary should consult the repository directly.

#### 0.2.1 Canonical live repository

The live repository is:

```text
https://github.com/mysticflounder/erdos-97-96-formalization
```

The normal working branch is `main`. The historical companion repository `p97-rvol` is not the live integration target; material imported from it now lives under the `Erdos9796Proof.P97` namespace in this repository. Historical names, line numbers, and file paths in old notes should therefore be treated as search hints, not as current source authority.

Before relying on a source statement, record the exact checkout identity:

```bash
git rev-parse --verify HEAD
git branch --show-current
git status --short
```

Every source-sensitive proof note should name either the exact commit hash or the date and branch inspected. Line numbers drift quickly in this codebase. A fully qualified Lean declaration name plus a commit hash is a more durable reference than a bare file-and-line citation.

The late-first-apex API used in the A5 escape analysis is anchored in this manuscript at commit

```text
bc4c04db398979c57edaf4af9c60e1eae984f436
```

Other sections may reflect later source-audited snapshots. Agents must therefore check the provenance note attached to the particular section they are implementing rather than assuming one global commit for every paragraph.

#### 0.2.2 Repository governance and edit discipline

Before modifying Lean, read the repository-local instructions:

```text
AGENTS.md
CLAUDE.md
```

Also inspect any more specific instruction file that applies to the subtree being edited. The repository uses lane ownership, worktree checkpoints, and artifact-hygiene rules because several proof and certificate tasks may be active simultaneously. Do not overwrite another agent's changes, regenerate frozen banks casually, or edit generated certificate material merely to make a local theorem compile.

The files that control the reproducible environment include:

```text
lean-toolchain
lean/lake-manifest.json
lean/lakefile.toml
.blueprint.toml
pyproject.toml
uv.lock
```

`lake-manifest.json` pins the Lean dependencies. Do **not** run `lake update` unless the repository owner explicitly authorizes a dependency change.

#### 0.2.3 Where the main proof lives

The principal Lean library is:

```text
lean/Erdos9796Proof/
```

The most important entry points for this manuscript are:

| Mathematical role | Lean location |
|---|---|
| Published Problem 97 theorem | `lean/Erdos9796Proof/P97/UpstreamBridge.lean` |
| Strong-induction wrapper | `lean/Erdos9796Proof/P97/UniversalProblem97.lean` and `UniversalLocal.lean` |
| Counting engine | `lean/Erdos9796Proof/P97/Counting.lean` |
| Exact-nine endpoint | `lean/Erdos9796Proof/P97/N9Endpoint/Closure.lean` |
| Descent assembly | `lean/Erdos9796Proof/P97/Descent.lean` |
| Deleting a removable vertex | `lean/Erdos9796Proof/P97/SmallerCounterexample.lean` |
| Removable-vertex assembly | `lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean` and the directory `P97/RemovableVertexAxiom/` |
| Pinned multiplicity | `lean/Erdos9796Proof/P97/PinnedMultiplicity.lean` |
| Canonical unique-four cover and deletion semantics | `lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean` |
| Open A-tail coordinator | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` |
| Current Rigid221, TriApex, TwoSource, and two-deletion leaves | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/` |
| Promoted card-eleven certificates | `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/` |
| Problem 96 bridge and peeling proof | `lean/Erdos9796Proof/P96/` |
| Shared planar geometry | `lean/Erdos9796Proof/Geometry/` |

The file `P97/ATail/FrontierLiveClosure.lean` is primarily an import coordinator. The substantive open declarations are in the directory beside it. The names most relevant to the current frontier include:

```text
Rigid221SourceHeavy.lean
Rigid221Placement.lean
Rigid221Closure.lean
TriApexEndpointRetainedOmission.lean
TwoSourceFreshThirdResidual.lean
TwoSourceFirstFiberCollision.lean
TwoSourceClosure.lean
TwoSourceCanonicalSurface.lean
TwoDeletionCollision.lean
```

When this prose document names an A5, D, E, F, G, H, or I obligation, the theorem-to-source crosswalk in §17 should be used together with a repository search for the exact declaration.

#### 0.2.4 Useful non-Lean directories

Several repository directories contain evidence or workflow material rather than the final proof term:

| Directory | Use |
|---|---|
| `docs/` | prose proofs, audits, plans, specifications, and source notes |
| `docs/audits/` | dated source and frontier audits |
| `docs/dead-ends.md` | arguments and encodings that should not be repeated without a new ingredient |
| `docs/live-blueprint.md` | generated dependency-spine snapshot; do not edit manually |
| `census/` | finite classifier and solver-lane census data |
| `certificates/` | certificate-bank data and replay inputs |
| `comparator/` | mathlib-vocabulary restatements and independent conformance checks |
| `scratch/` | temporary lanes, experiments, generated reports, and solver output |
| `scripts/` | build, hygiene, mining, replay, and certificate utilities |
| `attic/` | retired or historical off-spine work |

A SAT model, CEGAR table, or certificate artifact under `scratch/`, `census/`, or an off-spine bank is evidence only for the exact encoded proposition. It is not automatically a proof of a live Lean leaf. The source-to-encoding coverage theorem and a replayable contradiction consumer must both be present before such material is promoted as closure.

#### 0.2.5 Finding declarations and their producers

Search by fully qualified or distinctive declaration name rather than by approximate line number. Typical commands are:

```bash
# Find a theorem, structure, or definition.
rg -n --glob '*.lean' \
  'lateFirstApexSystem_centerAt_eq_iff_mem_class' \
  lean/Erdos9796Proof

# Find all references to a current leaf.
rg -n --glob '*.lean' \
  'false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion' \
  lean/Erdos9796Proof

# Inspect import boundaries around a candidate module.
rg -n '^import ' \
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure

# Find the current source occurrences of placeholders.
rg -n --glob '*.lean' '\bsorry\b|\badmit\b' lean/Erdos9796Proof
```

After locating a declaration, inspect:

1. its exact theorem type;
2. every structure field and local hypothesis available at its call site;
3. its immediate callers and consumers;
4. whether a similarly named declaration is in `scratch/`, `attic/`, or a production namespace;
5. whether the theorem is before or after a reindexing or override such as `contextNew`, `Gnew`, or `lateFirstApexSystem`; and
6. whether a support is a full exact radius class, a selected four-subset, or merely an existential K4 witness.

Do not identify two radii, supports, blockers, or source roles merely because their informal descriptions look similar. Search for and cite the exact equality theorem.

#### 0.2.6 Building and checking a theorem

A clean checkout requires `elan` and `uv`. The repository's standard setup and build path is:

```bash
git clone https://github.com/mysticflounder/erdos-97-96-formalization.git
cd erdos-97-96-formalization

cd lean
lake exe cache get
cd ..

./scripts/lake-build.sh
```

Use the serialized wrapper rather than launching competing full `lake build` processes. For a focused source check, run Lean from the `lean/` directory:

```bash
cd lean
lake env lean \
  Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean
```

Replace the path with the module actually edited.

A source file that contains no `sorry` may still depend transitively on `sorryAx`. Check the axiom closure of the exact target:

```bash
mkdir -p scratch/checks
cat > scratch/checks/ax_check.lean <<'EOF'
import Erdos9796Proof.P97.UpstreamBridge

#print axioms Problem97.erdos97_rhs
-- Add the exact declaration being audited:
-- #print axioms Problem97.ATailFrontierLiveClosure.<declaration>
EOF

cd lean
lake env lean ../scratch/checks/ax_check.lean
```

For current reachability and leaf counts, regenerate the dependency spine:

```bash
proof-blueprint spine
```

Do not infer the current open roster from a raw `rg sorry` count. Raw placeholders may be off-spine, unreachable, newly split, or superseded. `proof-blueprint spine` is the reachability authority; `#print axioms` is the theorem-level trust authority.

#### 0.2.7 Source-of-truth hierarchy

When the manuscript, a dated audit, and the code disagree, use the following order:

1. the exact Lean source and theorem type at the pinned commit;
2. successful elaboration in the repository's pinned toolchain;
3. `#print axioms` for the exact declaration;
4. a freshly generated `proof-blueprint spine` report for reachability;
5. the current repository README and generated blueprint;
6. dated audit documents; and
7. this prose manuscript.

This manuscript is the authoritative **mathematical and implementation narrative**, but it is not permitted to overrule an exact Lean signature. When code changes invalidate a prose contract, update the contract and its source provenance rather than coercing the code into an obsolete description.

#### 0.2.8 Agent checklist before claiming closure

An agent proposing to mark a section `[PROVED]`, `[CERTIFIED]`, or `[LEAN-DIRECT-CLOSER]` should record all of the following:

- exact repository commit;
- exact fully qualified target declaration;
- exact theorem type before and after the change;
- every nontrivial producer theorem used;
- focused build result;
- relevant `#print axioms` output;
- before/after `proof-blueprint spine` effect when the target is publish-connected;
- whether generated banks or source manifests were touched;
- whether any caller uses a reindexed or overridden shell system;
- whether the proof preserves named source and deletion provenance; and
- whether the manuscript's theorem-to-source crosswalk and status ledger were updated.

A proof is not closed merely because the edited file is source-clean. For this project, the publication-relevant standard is kernel-clean closure of the intended target under the repository's declared trust boundary.

### 0.3 The proof in one dependency diagram

```text
Counting floor: every counterexample has at least 9 points       [PROVED]
Exact 9-point endpoint is impossible                              [PROVED]

For |A| > 9:
  MEC/K4 geometry produces a surplus-cap packet                   [PROVED]
  Split on existence of an IsM44 packet
    IsM44 packet exists -> construct a removable point             [CERTIFIED]
    no IsM44 packet exists -> global A-tail contradiction          [OPEN]
  Therefore a removable point exists                              [OPEN transitively]
  Delete it to obtain a smaller counterexample                    [PROVED]
  Contradict strong-induction minimality                           [PROVED]
```

The only unconditional gap in this diagram is the general non-`IsM44` assertion. The rest of this manuscript explains exactly why.

---

## 1. Basic objects

Let `A` be a finite set of points in the Euclidean plane. In Lean it is a `Finset ℝ²`.

For any finite set `S` and point `x`, write

\[
S-x:=S.\operatorname{erase}(x).
\]

This notation is used only in prose formulas; Lean continues to use `S.erase x`.

### A0. Selected distance class

For a center `p` and radius `r`, define

\[
C_A(p,r)=\{q\in A:\operatorname{dist}(p,q)=r\}.
\]

This is `SelectedClass A p r`.

**Status:** [PROVED definition]

### A1. K4 at a center

Write `K4At(A,p)` for the assertion that there is a positive radius `r` such that

\[
|C_A(p,r)|\ge 4.
\]

This is `HasNEquidistantPointsAt 4 A p`.

**Status:** [PROVED definition]

### A2. Global K4 property

Write `K4(A)` for

\[
\forall p\in A,\;K4At(A,p).
\]

This is `HasNEquidistantProperty 4 A`.

**Status:** [PROVED definition]

### A3. Convex independence

`ConvexIndep A` means that no point of `A` lies in the convex hull of the other points of `A`. For finite planar sets this is the strict-convex-position condition used throughout the repository.

**Status:** [PROVED definition]

### A4. Counterexample

A Problem 97 counterexample is a finite set `A` such that

1. `A` is nonempty;
2. `A` is convexly independent; and
3. `K4(A)` holds.

The Lean predicate is

```lean
def IsCounterexample (A : Finset ℝ²) : Prop :=
  A.Nonempty ∧ ConvexIndep A ∧ HasNEquidistantProperty 4 A
```

**Status:** [PROVED definition]

### A5. Removable vertex

A point `x` is removable from `A` if

\[
x\in A
\quad\text{and}\quad
K4(A-x).
\]

The Lean definition is

```lean
def IsRemovableVertex (A : Finset ℝ²) (x : ℝ²) : Prop :=
  x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)
```

Convex independence is not repeated because it is inherited by subsets.

**Status:** [PROVED definition]

### A6. Strong-induction minimality

For a fixed counterexample `A`, the hypothesis used by descent is

\[
\forall B,
\bigl(|B|<|A|\bigr)\land
\bigl(B\ne\varnothing\bigr)\land
\operatorname{ConvexIndep}(B)\land
K4(B)
\Longrightarrow\bot.
\tag{Min}
\]

This does not assert that `A` was selected by a separate global minimization operation. It is exactly the induction hypothesis available while proving the cardinality-`|A|` case by strong induction.

**Status:** [PROVED interpretation of the Lean hypothesis]

---

## 2. Atomic calculus of a selected class under deletion

Fix a finite set `A`, a deleted point `x`, a surviving center `p`, and a real radius `r`.

### L0. Membership in a selected class

For any point `q`,

\[
q\in C_A(p,r)
\quad\Longleftrightarrow\quad
q\in A\text{ and }\operatorname{dist}(p,q)=r.
\]

**Proof.** This is the definition of the filtered finite set `SelectedClass`. QED.

**Status:** [PROVED]

### L1. A positive-radius class does not contain its center

If `r>0`, then

\[
p\notin C_A(p,r).
\]

**Proof.** `dist(p,p)=0`, so membership would imply `r=0`, contrary to `r>0`. QED.

**Status:** [DERIVED from metric identities]

### L2. Exact erase identity

For every `p,r,x`,

\[
C_{A-x}(p,r)=C_A(p,r)-x.
\tag{2.1}
\]

**Proof.** A point `q` belongs to the left side exactly when `q∈A`, `q≠x`, and `dist(p,q)=r`. Those are exactly the membership conditions for the right side. QED.

**Status:** [PROVED as `selectedClass_erase_eq`]

### L3. Deleting a point outside a class leaves the class unchanged

If `x∉C_A(p,r)`, then

\[
C_{A-x}(p,r)=C_A(p,r).
\]

**Proof.** Apply (2.1); erasing a nonmember changes nothing. QED.

**Status:** [DERIVED]

### L4. Deleting a member lowers the class cardinality by exactly one

If `x∈C_A(p,r)`, then

\[
|C_{A-x}(p,r)|=|C_A(p,r)|-1.
\]

**Proof.** Apply (2.1) and the finite-set cardinality formula for erasing a member. QED.

**Status:** [DERIVED]

### L5. A class of at least five survives every single deletion

If `r>0` and `|C_A(p,r)|≥5`, then for every `x`,

\[
|C_{A-x}(p,r)|\ge4.
\]

**Proof.** If `x` is outside the class, use L3. If `x` is inside, L4 leaves at least four points. QED.

**Status:** [PROVED in the robustness library]

### L6. Two distinct heavy radii cannot both be destroyed by one deletion

Suppose `r₁,r₂>0`, `r₁≠r₂`, and both selected classes have cardinality at least four. Deleting one point `x` leaves at least one of the two classes with cardinality at least four.

**Proof.** A point cannot belong to both classes: otherwise its distance from `p` would equal both radii, forcing `r₁=r₂`. Hence `x` can lie in at most one class. The other class is unchanged by L3. QED.

**Status:** [PROVED as the two-heavy-radii robustness theorem]

### L7. Exact four containing the deleted point is the only way to destroy a specified heavy class

Assume `|C_A(p,r)|≥4`. If the class at radius `r` has fewer than four points after deleting `x`, then

\[
x\in C_A(p,r)
\quad\text{and}\quad
|C_A(p,r)|=4.
\tag{2.2}
\]

**Proof.** If `x` were outside, L3 would preserve at least four points. Thus `x` lies in the class. L4 says the new cardinality is the old cardinality minus one. Being at most three forces the old cardinality to be at most four; the assumed lower bound makes it exactly four. QED.

**Status:** [DERIVED]

### L8. Exact erased pin

An **exact erased pin** at `(p,x)` is a positive radius `r` satisfying (2.2). Deleting `x` changes that exact four-point class into a three-point class. The three surviving points form the `ErasedPinTriple A x p` used by the continuation proof.

**Status:** [PROVED interface]

### L9. Excluding exact erased pins is sufficient for survival at a center

Assume `K4(A)` and `p∈A-x`. If no positive radius at `p` is an exact erased pin through `x`, then `K4At(A-x,p)`.

**Proof.** Since `p∈A`, global K4 provides a positive radius `r` with at least four points in `C_A(p,r)`. If deletion left fewer than four at that radius, L7 would produce an exact erased pin, contrary to the hypothesis. At least four therefore survive. QED.

**Status:** [PROVED as `selectedClass_erase_witness_of_no_exact_erased_pin`]

### L10. Centerwise witnesses assemble to removability

Suppose `x∈A` and every `p∈A-x` has a positive-radius class of at least four points in `A-x`. Then `x` is removable.

**Proof.** The centerwise witnesses are exactly the universal quantifier in `K4(A-x)`. Pair that property with `x∈A`. QED.

**Status:** [PROVED as `removableVertex_of_selectedClass_erase_witnesses`]

### Important caution

An exact four-point class containing `x` does **not** by itself prove that deletion fails at `p`. A second heavy radius might survive. Failure at a center is stronger: every heavy radius must be destroyed. The next section atomizes that stronger conclusion.

---

## 3. Exact deletion failure and canonical blockers

### B0. Semantic failure predicate

For `p∈A-x`, define

\[
\operatorname{Fail}_A(p,x)
:\Longleftrightarrow
\neg K4At(A-x,p).
\]

Equivalently, every positive-radius class at `p` in the erased carrier has cardinality at most three.

**Status:** [DERIVED definition]

### B1. Failure bounds every erased class by three

If `Fail_A(p,x)`, then for every `ρ>0`,

\[
|C_A(p,\rho)-x|\le3.
\tag{3.1}
\]

**Proof.** By L2, the left side is the selected class at radius `ρ` in `A-x`. If it had cardinality at least four, it would witness `K4At(A-x,p)`. QED.

**Status:** [PROVED inside the minimal unique-four construction]

### B2. Every heavy full-carrier class contains the deleted point

Assume `Fail_A(p,x)`. If `ρ>0` and `|C_A(p,ρ)|≥4`, then

\[
x\in C_A(p,\rho).
\]

**Proof.** If `x` were outside, L3 would preserve the class with at least four points, contradicting failure. QED.

**Status:** [PROVED]

### B3. Every heavy full-carrier class has exactly four points

Under the same hypotheses, every positive heavy radius `ρ` satisfies

\[
|C_A(p,\rho)|=4.
\]

**Proof.** B2 says `x` lies in the class. Equation (3.1) and L4 show that the full class has at most four points. It already has at least four. QED.

**Status:** [PROVED]

### B4. The heavy radius is unique

Assume `Fail_A(p,x)` and `K4(A)`. Then there is exactly one positive radius at `p` whose selected class has at least four points.

**Proof.** K4 at `p` supplies at least one heavy radius. If `ρ` and `r` were two heavy radii, B2 would put `x` in both corresponding classes. Equality of both distances to `dist(p,x)` forces `ρ=r`. QED.

**Status:** [PROVED]

### B5. Unique-four center

A point `p` is a **unique-four center** if

1. `p∈A`;
2. there is a positive radius `r` with `|C_A(p,r)|=4`; and
3. every positive radius with at least four points equals `r`.

This is `ATailMinimalUniqueFourCover.IsUniqueFourCenter A p`.

By B1-B4, if `A` is K4 and deletion of `x` fails at a surviving center `p`, then `p` is a unique-four center and `x` belongs to its unique four-point class.

**Status:** [PROVED]

### B6. Canonical unique four-class

Write `U_p` for `uniqueFourClass A p`. At a unique-four center this is the unique selected class of cardinality four. It satisfies

\[
|U_p|=4,
\qquad
U_p\subseteq A,
\qquad
p\notin U_p.
\tag{3.2}
\]

**Proof.** The first two properties belong to the selected-class construction. The defining radius is positive, so L1 gives the last property. QED.

**Status:** [PROVED, with the last clause DERIVED explicitly here]

### B7. Membership in a canonical row destroys the center

If `p` is a unique-four center and `x∈U_p`, then

\[
\neg K4At(A-x,p).
\]

**Proof.** The unique heavy class loses `x` and has only three survivors. Every other positive radius had fewer than four points before deletion and cannot gain points under deletion. QED.

**Status:** [PROVED as `not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass`]

### B8. Exact semantic blocker equivalence

Assume `K4(A)` and `p∈A-x`. Then

\[
\operatorname{Fail}_A(p,x)
\quad\Longleftrightarrow\quad
\bigl(p\text{ is a unique-four center and }x\in U_p\bigr).
\tag{3.3}
\]

**Proof.** The forward implication is B1-B5. The reverse implication is B7. QED.

**Status:** [DERIVED from proved repository lemmas; recommended as a standalone Lean adapter]

### B9. Canonical blocker relation

Define

\[
\operatorname{Blocks}_A(p,x)
:\Longleftrightarrow
p\in A-x
\text{ and }
\operatorname{Fail}_A(p,x).
\]

Under K4, equation (3.3) gives

\[
\operatorname{Blocks}_A(p,x)
\quad\Longleftrightarrow\quad
p\text{ is a unique-four center and }x\in U_p.
\tag{3.4}
\]

The terminology is source-oriented: `p` blocks deletion of the source `x`.

**Status:** [DERIVED]

### B10. Removable if and only if unblocked

Assume `K4(A)` and `x∈A`. Then

\[
\operatorname{IsRemovableVertex}(A,x)
\quad\Longleftrightarrow\quad
\neg\exists p\in A,\;\operatorname{Blocks}_A(p,x).
\tag{3.5}
\]

**Proof.** `x` is removable exactly when K4 survives at every center of `A-x`. Negating that universal statement gives a surviving center at which K4 fails, which is exactly a blocker. QED.

**Status:** [DERIVED; recommended standalone interface]

### B11. Minimality forces every source to be blocked

Let `A` be a minimal counterexample with more than one point. Then

\[
\forall x\in A,\;\exists p\in A,\;\operatorname{Blocks}_A(p,x).
\tag{3.6}
\]

**Proof.** If some `x` had no blocker, B10 would make it removable. The elementary deletion theorem would produce a smaller nonempty convexly independent K4 set, contradicting minimality. QED.

**Status:** [PROVED in existential unique-four form]

### B12. Critical shell systems choose blockers; they do not retain all blockers

A `CriticalShellSystem` chooses, for every source `x`, one blocker center `β(x)` and one exact four-point row through `x`. The repository proves that

\[
\beta(x)\text{ is a unique-four center},
\qquad
\beta(x)\ne x,
\qquad
x\in U_{\beta(x)},
\]

and that the chosen shell support equals the canonical class `U_{β(x)}`.

The all-blockers relation is stronger data: a source may belong to several canonical rows, while a critical shell system records only one selected row. This matters whenever a later argument needs to choose a blocker strategically.

**Status:** [PROVED for the selected blocker; all-blockers packaging is DERIVED]

---

## 4. Pinned multiplicity reformulation

### P0. Pinned multiplicity

Let

\[
\mu_A(p)=\max_{r>0}|C_A(p,r)|.
\]

This is the repository's `pinnedMultiplicity A p`.

**Status:** [PROVED definition]

### P1. K4 is a multiplicity lower bound

For every center `p`,

\[
K4At(A,p)
\quad\Longleftrightarrow\quad
4\le\mu_A(p).
\tag{4.1}
\]

Consequently,

\[
K4(A)
\quad\Longleftrightarrow\quad
\forall p\in A,\;4\le\mu_A(p).
\]

**Status:** [PROVED in `PinnedMultiplicity.lean`]

### P2. One deletion changes pinned multiplicity by at most one

For a surviving center `p`,

\[
\mu_{A-x}(p)\le\mu_A(p)
\le\mu_{A-x}(p)+1.
\tag{4.2}
\]

**Proof.** Every erased selected class is obtained by deleting at most one member from the corresponding full class. Taking maxima preserves both inequalities. QED.

**Status:** [DERIVED]

### P3. Multiplicity blocker

Define

\[
\operatorname{MultiplicityBlocks}_A(p,x)
:\Longleftrightarrow
p\in A-x,
\quad
\mu_A(p)=4,
\quad
\mu_{A-x}(p)=3.
\]

### P4. Three equivalent blocker descriptions

Assume `K4(A)` and `p∈A-x`. The following are equivalent:

1. deletion of `x` destroys K4 at `p`;
2. `p` is a unique-four center and `x∈U_p`;
3. `MultiplicityBlocks_A(p,x)`.

**Proof.** The equivalence of (1) and (2) is B8. Under (2), the unique heavy class has cardinality four and becomes a three-point class after erasing `x`; every other class has cardinality at most three, so the two multiplicities are exactly four and three. Under (3), equation (4.1) says K4 fails after deletion, giving (1). QED.

**Status:** [DERIVED; this is the most useful pinned-multiplicity adapter]

### P5. Why a bare multiplicity restatement does not close descent

The statement

\[
\exists x\in A,\;\forall p\in A-x,\;4\le\mu_{A-x}(p)
\]

is definitionally the same removable-vertex goal. Merely restating `RemovableVertexOfLarge` in this notation adds no mathematical information.

The useful strengthening is to retain the complete relation of all pairs `(p,x)` satisfying P4. That relation canonically records every possible blocker rather than selecting one blocker too early.

**Status:** [DERIVED architectural conclusion]

---

## 5. Incidence consequences of the all-blockers relation

Let

\[
U=\{p\in A:p\text{ is a unique-four center}\},
\qquad
u=|U|,
\qquad
n=|A|.
\]

For `p∈U`, let `R_p=U_p`. Define the blocker degree of a source `x` by

\[
d(x)=|\{p\in U:x\in R_p\}|.
\]

Assume throughout this section that `A` is a minimal counterexample.

### I0. Every row has exactly four sources

For every `p∈U`,

\[
|R_p|=4.
\]

**Status:** [PROVED]

### I1. No center lies in its own row

For every `p∈U`,

\[
p\notin R_p.
\]

**Proof.** The row radius is positive. QED.

**Status:** [DERIVED]

### I2. Every source has positive blocker degree

For every `x∈A`,

\[
d(x)\ge1.
\]

**Proof.** This is B11 in incidence notation. QED.

**Status:** [PROVED in existential form]

### I3. Exact incidence count

Let

\[
I=\{(p,x):p\in U,\;x\in R_p\}.
\]

Then

\[
|I|=4\nu
\quad\text{and}\quad
\sum_{x\in A}d(x)=4\nu.
\tag{5.1}
\]

**Proof.** Sum the exact row cardinality four over all centers, then count the same incidences by sources. QED.

**Status:** [DERIVED]

### I4. Cover bound

\[
n\le4\nu.
\tag{5.2}
\]

**Proof.** By I2, each source contributes at least one to the incidence sum. Hence

\[
n=\sum_{x\in A}1
\le\sum_{x\in A}d(x)
=4\nu.
\]

QED.

**Status:** [PROVED as `card_le_four_mul_uniqueFourCenters`]

### I5. Average blocker degree

\[
\frac1n\sum_{x\in A}d(x)=\frac{4\nu}{n}.
\]

Since `U⊆A`, one has `ν≤n`; therefore the average blocker degree is at most four. Together with I2, some source has between one and four blockers.

**Status:** [DERIVED]

### I6. Distinct-center rows meet in at most two points

If `p,q∈U` and `p≠q`, then

\[
|R_p\cap R_q|\le2.
\tag{5.3}
\]

**Proof.** `R_p` and `R_q` lie on two circles with distinct centers. Two distinct Euclidean circles have at most two common points. The repository proves the exact finite-set form used here. QED.

**Status:** [PROVED]

### I7. The canonical row map is injective

If `R_p=R_q` for `p,q∈U`, then `p=q`.

**Proof.** If the centers were distinct, their row intersection would have cardinality four, contradicting I6. QED.

**Status:** [DERIVED]

### I8. Strict convexity forbids three carrier points on one line

Every line contains at most two points of `A`.

**Proof.** Among three distinct collinear points, one lies between the other two and therefore belongs to their convex hull, contradicting convex independence. QED.

**Status:** [DERIVED from `ConvexIndep`]

### I9. Pair codegree is at most two

Fix distinct sources `x,y∈A`. At most two centers `p∈U` have both `x,y∈R_p`.

**Proof.** Such a center satisfies `dist(p,x)=dist(p,y)`, so it lies on the perpendicular bisector of segment `xy`. All candidate centers are carrier points. I8 allows at most two carrier points on that line. QED.

**Status:** [DERIVED; potentially useful new generic lemma]

### I10. Pair-incidence inequality

Each row contains six unordered source pairs. By I9 each source pair occurs in at most two rows. Therefore

\[
6\nu\le2\binom n2=n(n-1).
\tag{5.4}
\]

**Status:** [DERIVED]

### I11. Shared-source second-moment inequality

Counting triples consisting of a source and two distinct blockers gives

\[
\sum_{x\in A}\binom{d(x)}2
=
\sum_{\{p,q\}\subseteq U}|R_p\cap R_q|
\le2\binom\nu2.
\tag{5.5}
\]

**Status:** [DERIVED]

### I12. Why the incidence inequalities do not contradict minimality

The bounds I4, I10, and I11 are compatible for every `n>9`. For example, I4 only forces `ν≥n/4`, while I10 is a quadratic upper bound. Even the Cauchy lower bound on the left side of (5.5) is vacuous in the relevant range.

Abstract four-uniform covers also satisfy all these conditions. For `n=4ν` with `ν≥2`, partition the sources into disjoint blocks of four. Choose one center in the preceding block cyclically and assign each chosen center the next block as its row. The rows cover every source, omit their own centers, have pairwise intersection zero, and have pair codegree one. This abstract system is not asserted to be Euclidean; it proves that pure finite incidence data cannot be the terminal contradiction.

**Status:** [DERIVED negative result]

### I13. A blocker map forces a directed cycle

Choose one blocker `β(x)∈U` for every source `x∈A`. Because no center lies in its own row, `β(x)≠x`. Restricting to `U` gives a fixed-point-free map

\[
\beta:U\longrightarrow U.
\]

Every finite self-map has a directed cycle, and the absence of fixed points makes the cycle length at least two.

**Status:** [DERIVED; the existing critical shell system supplies such a chosen map]

### I14. A directed cycle alone is not contradictory

For an edge `x→p`, the only immediate metric relation is

\[
x\in R_p,
\qquad
\operatorname{dist}(p,x)=r_p,
\]

where `r_p` is the canonical radius at `p`. Radii at different centers need not agree. A two-cycle merely makes both canonical radii equal to the distance between the two centers; two equal-radius circles with that separation are geometrically possible. Longer cycles likewise carry no monotone quantity by themselves.

A successful cycle proof therefore needs an additional potential—cap index, cyclic boundary order, signed orientation, or another global invariant—that changes strictly along every strategically chosen blocker edge.

**Status:** [DERIVED research boundary]

---

### I15. Universal physical-source (`∀v`) theorem package

> **Checkpoint, 22 August 2026.** The named point `v` in several Rigid221, A5, and F3 branches is not carrying the essential mathematics. The proofs use only that the source belongs to a fixed positive-radius class centered at a fully deletion-robust carrier point and that its blocker row is canonical. The following package therefore quantifies over **every** source in that class and, in I15.1--I15.3 and I15.5--I15.6, over **every legal canonical blocker** of that source, not merely the value selected by one `CriticalShellSystem`.

Let `A` be a convexly independent minimal K4 carrier. Fix a fully deletion-robust carrier center `O`, a radius `ρ>0`, and the physical class

\[
C=\operatorname{SelectedClass}(A,O,\rho).
\]

For a unique-four center `b`, write `U_b` for its canonical exact four-point row. Write

\[
\operatorname{Blocks}(b,v)
\quad\Longleftrightarrow\quad
v\in U_b
\]

with the understood unique-four and positive-radius data. Under the deletion semantics developed above, this is equivalent to deletion of `v` destroying K4 at `b`.

#### I15.0. Saturation of a carrier perpendicular bisector

Let `x≠y` be carrier points. Suppose two distinct carrier points `p,q` satisfy

\[
\operatorname{dist}(p,x)=\operatorname{dist}(p,y),
\qquad
\operatorname{dist}(q,x)=\operatorname{dist}(q,y).
\]

Then every carrier point `r` equidistant from `x,y` satisfies

\[
r=p\quad\text{or}\quad r=q.
\tag{UV.1}
\]

**Proof.** Every such center lies on the perpendicular bisector of `xy`. Three distinct carrier points on that line would be collinear, contradicting convex independence. QED.

This is the coordinate-free saturation principle behind the pair-codegree bound, the opposite-side theorem, and the reciprocal-trace theorem below.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.1. Universal robust-class trace bound

Let `v∈C`, and let `b` be **any** legal canonical blocker of `v`. Then

\[
b\ne O
\tag{UV.2}
\]

and

\[
|U_b\cap C|\le2.
\tag{UV.3}
\]

**Proof.** If `b=O`, deletion of `v` would both fail and survive at `O`, contrary to full deletion robustness. Thus the circles carrying `U_b` and `C` have distinct centers. Two distinct Euclidean circles meet in at most two points, proving (UV.3). QED.

The quantifier over `b` is load-bearing: the conclusion survives every later rebase or preferred choice of the blocker section.

**Status:** [DERIVED AND PROVED IN PROSE; UNIVERSAL OVER ALL LEGAL BLOCKERS]

#### I15.2. Exact universal `v`-trace dichotomy

Under I15.1, the source belongs to both the physical class and its blocker row:

\[
v\in U_b\cap C.
\]

Consequently exactly one of the following holds.

1. **Isolated trace:**
   \[
   U_b\cap C=\{v\}.
   \tag{UV.4a}
   \]
2. **Paired trace:** there is a unique `w∈C`, `w≠v`, such that
   \[
   U_b\cap C=\{v,w\}.
   \tag{UV.4b}
   \]

**Proof.** The intersection is nonempty and has cardinality at most two by I15.1. If its cardinality is one, source membership identifies the singleton. If its cardinality is two, erasing `v` leaves one point `w`; extensionality gives the displayed equality, and the two-point bound gives uniqueness. QED.

This is the cleanest universalization of the named `v` arguments. Every physical-source row has one source and at most one physical companion. No rigid-pentagon label is needed.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.3. Universal blocker-fiber bound and image lower bound

For any canonical center `b`, define its physical blocker fiber

\[
F_C(b)=\{v\in C:\operatorname{Blocks}(b,v)\}.
\]

If this fiber is nonempty, then

\[
F_C(b)=C\cap U_b,
\qquad
|F_C(b)|\le2.
\tag{UV.5}
\]

Now choose any blocker section `β` on `C`, with `Blocks(β(v),v)` for every `v∈C`. Every fiber of `β|_C` has cardinality at most two, so

\[
|C|\le2\,|\beta(C)|.
\tag{UV.6}
\]

In particular, an exact five-point physical class has at least three distinct chosen blocker centers.

**Proof.** The fiber identity is the definition of canonical blocking. The cardinality bound is I15.1. Partition `C` into the nonempty fibers of the image points; each has size at most two, so their cardinalities sum to at most twice the number of image points. QED.

This is stronger and cleaner than proving pairwise distinctness separately for one hand-picked five-cycle: it identifies the optimal universal multiplicity bound.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.4. Equal blockers are exactly reciprocal physical traces

Fix a blocker section `β` on `C`. For distinct `v,w∈C`, define

\[
v\rightsquigarrow w
\quad\Longleftrightarrow\quad
w\in U_{\beta(v)}.
\]

Then

\[
\beta(v)=\beta(w)
\quad\Longleftrightarrow\quad
v\rightsquigarrow w\ \land\ w\rightsquigarrow v.
\tag{UV.7}
\]

**Proof.** If the blockers agree, canonical uniqueness identifies the two rows. Since each source lies in its own blocker row, both cross-memberships follow.

Conversely, reciprocal traces put `v,w` in both rows. The three carrier points

\[
O,\ \beta(v),\ \beta(w)
\]

are all equidistant from `v,w`. The blockers are different from `O` by I15.1. If they were distinct from each other, I15.0 would be violated. Hence they agree. QED.

Thus blocker equality is not merely analogous to a two-cycle; it is exactly a reciprocal edge in the physical trace digraph.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.5. Universal boundary placement of a paired trace

Suppose the paired alternative (UV.4b) holds. Then `O` and `b` are the two carrier centers on the perpendicular bisector of `vw`. They lie in opposite open half-planes determined by the chord line `vw`. In the cyclic boundary order of the convex carrier, `b` lies in the open boundary interval from `v` to `w` that avoids `O`:

\[
b\in(v,w)_O.
\tag{UV.8}
\]

**Proof.** The opposite-side lemma for two carrier centers equidistant from one carrier pair applies to `O,b;v,w`. If the centers were on the same side of the chord, one would lie in the convex hull of the other center and the chord endpoints. The boundary-interval formulation is the standard convex-polygon translation of this signed separation. QED.

This is the label-free form of the five A5 physical-row interval statements. It is the correct universal order theorem to use before any angular or midpoint specialization.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.6. Universal common-deletion fan of one physical source

Let `v∈C`, let `b` be any legal blocker of `v`, and let

\[
D(v,b)=C\setminus U_b.
\]

For every `z∈D(v,b)`, deletion of `z` preserves K4 at both `O` and `b`. Hence there is a source-exact common-deletion packet

\[
\operatorname{CD}_A(z;O,b).
\tag{UV.9}
\]

Moreover the fan size is exact:

\[
|D(v,b)|=
\begin{cases}
|C|-1,&U_b\cap C=\{v\},\\
|C|-2,&U_b\cap C=\{v,w\}.
\end{cases}
\tag{UV.10}
\]

Thus, when `|C|=5`, **every** physical source and **every** legal blocker of that source produces either a four-source or a three-source common-deletion fan.

**Proof.** Full robustness gives survival at `O`. Since `z∉U_b`, the unchanged exact row `U_b` survives in `A-z`. Survival excludes the actual blocker of `z` from both centers, giving the source-exact packet. The two cardinality identities are immediate from the exact trace dichotomy. QED.

This theorem subsumes several source-specific “delete any physical point omitted by the row” constructions in A5 and F3.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.7. Universal simultaneous deletion fan for several rows

Let `B` be a finite set of pairwise distinct nonapex canonical centers, with rows `U_b`. Define the common omitted locus inside `C` by

\[
J_B=C\setminus\bigcup_{b\in B}U_b.
\tag{UV.11}
\]

Then

\[
|C|\le |J_B|+2|B|.
\tag{UV.12}
\]

For every `z∈J_B`, deletion of `z` survives at `O` and simultaneously at every center in `B`. Consequently the actual blocker of `z` is distinct from `O` and from every member of `B`.

**Proof.** Each physical trace `C∩U_b` has cardinality at most two by I15.1. The union of `|B|` such traces has cardinality at most `2|B|`. The exact complement decomposition of `C` gives (UV.12). Exact-row persistence and robustness give all survival statements. QED.

The case `|B|=1` is I15.6. The case `|B|=2` is the F3 joint-deletion locus. This is the natural universal `v` theorem behind both constructions.

**Status:** [DERIVED AND PROVED IN PROSE; LEAN-HELPER-READY]

#### I15.8. Sparse physical trace graph and a one-third mutually omitted family

Fix a blocker section `β`, and let `X⊆C`. The directed trace relation on `X` has outdegree at most one by I15.2. Let the undirected conflict graph join `v,w` when at least one of

\[
v\rightsquigarrow w,
\qquad
w\rightsquigarrow v
\]

holds. Every induced subgraph on `Y⊆X` satisfies

\[
|E(Y)|\le |Y|.
\tag{UV.13}
\]

Consequently there exists `M⊆X` such that

\[
|X|\le3|M|
\tag{UV.14}
\]

and distinct members of `M` are pairwise mutually omitted:

\[
v\ne w\in M
\Longrightarrow
w\notin U_{\beta(v)}
\ \land\
 v\notin U_{\beta(w)}.
\tag{UV.15}
\]

**Proof.** Every conflict edge has at least one directed witness, and every source contributes at most one directed edge, proving (UV.13). Every nonempty induced graph therefore has a vertex of degree at most two. Greedily choose such a vertex, remove its closed neighborhood of size at most three, and iterate. The chosen vertices form an independent set and the removed neighborhoods prove (UV.14). QED.

Useful threshold consequences are:

\[
\begin{array}{c|c}
|X|\text{ lower bound}&\text{mutually omitted family guaranteed}\\
\hline
7&3\\
10&4\\
13&5\\
19&7
\end{array}
\tag{UV.16}
\]

**Status:** [PROSE-CLOSED IN THE F3 TRACE-DIGRAPH PASS; LEAN-HELPER-READY AFTER SOURCE ADAPTER]

#### I15.9. Universal survival amplification from a mutually omitted family

Let `M⊆C` be pairwise mutually omitted under `β`. For fixed `v∈M`, define

\[
S_v=\{O\}\cup\{\beta(w):w\in M,\ w\ne v\}.
\tag{UV.17}
\]

Then:

1. the blockers `β(w)`, `w∈M`, are pairwise distinct;
2. none equals `O`;
3. `|S_v|=|M|`;
4. deletion of `v` survives at every center in `S_v`; and
5. `β(v)∉S_v`.

Let

\[
R_v=S_v\setminus U_{\beta(v)}.
\]

Since `|U_{β(v)}|=4`,

\[
|M|\le |R_v|+4.
\tag{UV.18}
\]

For every `p∈R_v`, deletion of `v` survives at `p`, while deletion of `p` survives at `β(v)`. Thus each `p` gives a source-faithful bidirectional deletion pair.

**Proof.** Equal blockers for two members of `M` would give reciprocal trace edges by I15.4, contrary to mutual omission. The survival statements use robustness at `O` and the unchanged row `U_{β(w)}` at every other center. The reverse statement uses `p∉U_{β(v)}`. QED.

If a branch supplies additional fixed surviving centers omitted by every source in `M`, they may be adjoined to `S_v`. In the F3 ingress the two fixed rows at `b_u,b_v` strengthen (UV.18) to the recorded bound `|M|≤|R_v|+2`.

**Status:** [DERIVED AND PROVED IN PROSE; GENERIC FAN PLUS F3 SPECIALIZATION]

#### I15.10. Five-source shape split and the exact limitation

For an exact five-source mutually omitted family, apply I15.2 to each source. Each trace is isolated or paired, so at least three sources have the same trace type. This produces either:

1. three rows whose physical traces are the three source singletons; or
2. three rows with one named physical companion each.

The companions in the second arm need not be distinct and must remain explicit.

This shape split is a useful universal producer, but it is **not** a contradiction. An exact rational strictly convex configuration realizes a directed trace triangle together with:

- one common physical circle;
- the trace-cardinality bound two;
- the opposite-side placement of every blocker; and
- the complete cyclic order of the named skeleton.

Therefore no valid theorem may assert that a directed trace cycle is impossible from those hypotheses alone, and the factor `1/3` in I15.8 cannot be improved to `1/2` by trace/order reasoning alone. A terminal theorem must additionally use complete four-point row supports, cap capacities, source-authenticated deletion synchronization, or another global K4 condition.

**Status:** [PROSE-CLOSED PRODUCER; EXACT RATIONAL SHARPNESS BOUNDARY]

#### I15.11. Lean-facing package and current proof impact

The reusable declarations suggested by this checkpoint are:

```lean
theorem carrier_equidistant_center_eq_of_two ...

theorem canonicalBlocker_physicalTrace_card_le_two ...

inductive CanonicalBlockerPhysicalTraceShape ...
  | isolated ...
  | paired ...

theorem canonicalBlockerFiber_inter_robustClass_card_le_two ...

theorem card_robustClass_le_two_mul_blockerImage ...

theorem blocker_eq_iff_reciprocal_physicalTrace ...

theorem pairedPhysicalTrace_center_mem_avoidingInterval ...

theorem robustClass_commonDeletionFan ...

theorem robustClass_multirow_jointDeletionFan ...

theorem exists_large_pairwise_mutuallyOmitted ...

theorem amplifiedSurvivalFan_of_mutuallyOmitted ...
```

The expected effects are:

- **A5/Rigid221:** replace repeated source-specific row-trace, blocker-fiber, boundary-placement, and physical deletion-fan arguments by one generic API;
- **F2:** recover the universal fresh-cap blocker restrictions and late-choice common-blocker/mutual-omission split without fixing an early blocker map;
- **F3:** make the trace-digraph, one-third family, and survival-amplification constructions ordinary shared lemmas rather than branch-local prose; and
- **TriApex:** construct larger simultaneous deletion-survival fans, while retaining the need for a separate geometric consumer.

No current whole `sorry` is closed by this package. Its value is that it converts a collection of named-`v` arguments into a source-independent theorem layer and exposes the next genuine theorem: refute one of the amplified fan packets using the complete K4 rows and cap order.

**Status:** [NEW UNIVERSAL-`v` CHECKPOINT; LEAN-HELPER-READY, NOT A DIRECT CLOSER]

---

## 6. The elementary descent and strong induction

### D0. Deletion of a removable vertex

Let `A` be convexly independent, let `x` be removable, and suppose `1<|A|`. Set

\[
B=A-x.
\]

Then:

1. `B` is nonempty;
2. `|B|<|A|`;
3. `B` is convexly independent; and
4. `K4(B)`.

**Proof.** Since `x∈A`, `|B|=|A|-1`, which is positive and strictly smaller. Convex independence is hereditary under subsets. K4 of `B` is the second component of removability. QED.

**Status:** [PROVED as `smaller_counterexample_of_removable`]

### D1. Descent contradicts minimality

Let `A` be a nonempty convexly independent K4 set with `9<|A|`, and assume `(Min)`. If `A` has a removable vertex, then `False`.

**Proof.** Since `|A|>9`, one has `|A|>1`. Apply D0 to obtain a smaller nonempty convexly independent K4 set `B`. This contradicts `(Min)`. QED.

**Status:** [PROVED; this is the body of `descent_contradicts_minimality` after the removable vertex is obtained]

### D2. Strong-induction assembly

Suppose:

1. every counterexample has at least nine points;
2. no nine-point counterexample exists; and
3. every counterexample of size greater than nine contradicts the strong-induction minimality hypothesis.

Then no counterexample exists.

**Proof.** Strongly induct on `n=|A|`. A putative counterexample has `n≥9`. If `n=9`, use the endpoint theorem. If `n>9`, the strong-induction hypothesis excludes every smaller counterexample and therefore supplies `(Min)`; apply descent. QED.

**Status:** [PROVED as `UniversalProblem97_of_reduction`]

### D3. Exact location of the hard theorem

The current theorem `descent_contradicts_minimality` obtains the removable point by calling `RemovableVertexOfLarge`, then applies D0 and `(Min)`. No additional geometry occurs in `Descent.lean`.

**Status:** [PROVED source reading]

---

## 7. Minimum-enclosing-circle and surplus-cap extraction

This section expands `MEC.nonempty_surplusCapPacket_of_K4` into its atomic geometric and counting claims.

### M0. At least three carrier points

If `9<|A|`, then `A` has at least three points.

**Status:** [PROVED arithmetic]

### M1. Convex independence implies noncollinearity

If `A` is convexly independent and has at least three points, then `A` is not collinear.

**Proof.** Three distinct collinear points contain one point between the other two, contradicting convex independence. QED.

**Status:** [PROVED]

### M2. Minimum enclosing circle exists

A nonempty finite planar set has a minimum enclosing circle, with a center and nonnegative radius containing every point of `A`.

**Status:** [PROVED in the repository's MEC development]

### M3. Boundary-support dichotomy

For a noncollinear finite planar set, the minimum enclosing circle is supported either

1. by a diametrically opposite pair of carrier points; or
2. by at least three carrier points on the boundary.

**Status:** [PROVED in the repository's Sylvester/MEC development]

### M4. K4 excludes the diameter branch

For a nonempty noncollinear convexly independent K4 set, the diameter-supported alternative is impossible. Hence at least three points of `A` lie on the MEC boundary.

**Status:** [PROVED as `no_diameter_under_k4`]

### M5. Non-obtuse circumscribed boundary triple

From the boundary set one can choose three pairwise distinct boundary points

\[
v_1,v_2,v_3
\]

forming a non-obtuse circumscribed Moser triangle. They are noncollinear and belong to `A`.

**Status:** [PROVED]

### M6. Structural Moser triangle

The circumscribed branch records the pairwise-distinctness proofs, allowing the MEC triangle to be projected to the structural `Problem97.MoserTriangle` consumed by the cap library.

**Status:** [PROVED as `MoserTriangle.toStructural`]

### M7. Closed caps

Define three closed caps by the opposite-arc/chord predicate:

\[
C_1=A\cap\operatorname{Cap}(v_2v_3;v_1),
\quad
C_2=A\cap\operatorname{Cap}(v_3v_1;v_2),
\quad
C_3=A\cap\operatorname{Cap}(v_1v_2;v_3).
\]

In Lean these are filters using `OnArcOpposite`.

**Status:** [PROVED construction]

### M8. Triangle-vertex cap incidences

Each triangle vertex lies in the two caps for which it is a chord endpoint and does not lie in the cap opposite itself. Thus each of `v₁,v₂,v₃` contributes exactly two cap incidences.

**Proof.** Endpoint membership follows because the relevant signed area is zero. Opposite-cap exclusion follows from the nonzero signed area of the triangle. QED.

**Status:** [PROVED]

### M9. Every non-triangle carrier point lies in exactly one cap

For every `q∈A` distinct from the triangle vertices, the MEC arc geometry and convex independence imply that exactly one of the three `OnArcOpposite` predicates holds.

**Status:** [PROVED as `arc_partition_count_eq_one`, then consumed by `cap_partition_from_moser_circumscribed`]

### M10. Cap-sum identity

Counting cap incidences by points gives

\[
|C_1|+|C_2|+|C_3|
=(|A|-3)\cdot1+3\cdot2
=|A|+3.
\tag{7.1}
\]

**Status:** [PROVED as `CapTriple.cap_sum_identity` and `SurplusCapPacket.capSum`]

### M11. Existence of a surplus cap

If `9<|A|`, then the sum in (7.1) is greater than twelve. Therefore not all three cap cardinalities are at most four. At least one cap has cardinality at least five.

**Status:** [PROVED pigeonhole]

### M12. Surplus-cap packet

A `SurplusCapPacket A` packages:

1. nonemptiness and noncollinearity of `A`;
2. the non-obtuse circumscribed Moser triangle;
3. the circumscribed-branch witness;
4. the three-cap partition;
5. an index selecting one cap; and
6. a proof that the selected cap has cardinality greater than four.

`MEC.nonempty_surplusCapPacket_of_K4` constructs such a packet from the hypotheses of `RemovableVertexOfLarge`.

**Status:** [PROVED]

### M13. `IsM44`

For a packet `S`, let `C*` be the selected surplus cap and let `C₁'`, `C₂'` be the two opposite caps. The predicate `S.IsM44` is

\[
|C_1'|=4
\quad\text{and}\quad
|C_2'|=4.
\]

Since `|C*|≥5`, this is the `(m,4,4)` regime.

**Status:** [PROVED definition]

### M14. Cardinality identity in the `IsM44` regime

If `m=|C*|`, then

\[
m+4+4=|A|+3,
\qquad
m+5=|A|.
\tag{7.2}
\]

**Status:** [PROVED as `SurplusCapPacket.IsM44.surplus_card_eq`]

### M15. The top-level split is global

The proof splits on

\[
\exists S:\operatorname{SurplusCapPacket}(A),\;S.\operatorname{IsM44}.
\tag{7.3}
\]

The negative branch assumes that **no** surplus packet on `A` is `IsM44`. This global quantifier is stronger than saying that one selected packet fails `IsM44` and must be preserved in any replacement argument.

**Status:** [PROVED from `RemovableVertexOfLarge_from_threeWaySplit`]

---

## 8. Atomic erased-pin interfaces used in the `IsM44` branch

The continuation proof packages L7-L10 into named interfaces. Expanding them prevents the certificate route from appearing magical.

### E0. From an exact pin to a residual triple

Suppose `r>0`, `|C_A(p,r)|=4`, and `x∈C_A(p,r)`. Since `p` is not in the positive-radius class, erasing `x` and the center leaves exactly three carrier points at distance `dist(p,x)=r` from `p`.

This is the content of `erasedPinTriple_of_exact_erased_pin`.

**Status:** [PROVED]

### E1. Naming the three residual points

A three-element residual class can be written as `{t₁,t₂,t₃}` with pairwise distinct points. The theorem `exists_u3FixedTriplePacket_of_erasedPinTriple` packages their carrier membership and equal-distance identities.

**Status:** [PROVED]

### E2. Exact cardinality in skeleton notation

The same residual statement is transported to the deleted skeleton notation used by the U5 interfaces:

\[
\left|
\left\{y\in A-x-p:
\operatorname{dist}(p,y)=\operatorname{dist}(p,x)
\right\}
\right|=3.
\]

This is `u5ExactRadiusClassCard_of_erasedPinTriple`.

**Status:** [PROVED]

### E3. Triple exclusion implies exact-pin exclusion

If every residual triple of the form E0 is impossible for a category of centers, then no exact erased pin occurs in that category.

**Proof.** An exact pin would produce such a triple by E0. QED.

**Status:** [PROVED in `isM44NonSurplusContainmentExactPinResidualsExcluded`]

### E4. Exact-pin exclusion implies a surviving witness

Apply L9 center by center.

**Status:** [PROVED in `isM44NonSurplusContainmentResidualErasureWitnesses`]

### E5. All surviving witnesses imply removability

Apply L10.

**Status:** [PROVED in `isM44NonSurplusContainmentRemovable`]

---

## 9. The `IsM44` branch, expanded atomically

The branch theorem is `removableVertexOfLarge_of_isM44PinnedSurplus`. Its transitive proof is closed under the repository's approved certificate trust boundary.

Fix a minimal large counterexample `A` and an `IsM44` packet `S`.

### Q0. Endpoint residual exclusions

Two endpoint-escape families are ruled out:

- left endpoint escape at the first opposite index;
- right endpoint escape at the second opposite index.

These exclusions prevent a K4 class from escaping the intended opposite-cap geometry through a Moser endpoint.

**Status:** [CERTIFIED/source-clean consumer]

### Q1. Pinned-surplus residual exclusions

Two pinned families are ruled out:

- right-pinned surplus residuals;
- left-pinned surplus residuals.

They are discharged by the pinned-surplus certificate bank imported only at the final composition shard.

**Status:** [CERTIFIED]

### Q2. Non-surplus Moser-cap containment

The `IsM44` geometry, K4, convex independence, Q0, and Q1 imply `S.NonSurplusMoserCapContainment`.

This is the first conceptual payoff of the endpoint and pinned certificates: the two non-surplus sides have their relevant exact classes confined to the prescribed cap structure.

**Status:** [PROVED from certified premises]

### Q3. The surplus interior is nonempty

Write the selected surplus cap as $C_{\mathrm{sur}}$. An `IsM44` packet has $|C_{\mathrm{sur}}|\ge 5$. Its closed surplus cap contains the two Moser endpoints, so its strict cap interior has at least three points. Choose

\[
x\in C_{\mathrm{sur}}^{\circ}.
\]

Then `x∈A` and `x` is distinct from all three triangle vertices.

**Status:** [PROVED]

### Q4. Goal after choosing `x`

To prove that `x` is removable it is enough to show

\[
\forall p\in A-x,\;K4At(A-x,p).
\tag{9.1}
\]

By L9, for most categories it suffices to rule out exact erased pins through `x`.

**Status:** [PROVED reduction]

### Q5. Exhaustive location partition for a surviving center

Every `p∈A-x` is exactly one of the following:

1. the Moser vertex opposite the first non-surplus cap;
2. the Moser vertex opposite the second non-surplus cap;
3. the Moser vertex opposite the surplus cap;
4. a point in the strict interior of the surplus cap;
5. a point in the strict interior of the first opposite cap; or
6. a point in the strict interior of the second opposite cap.

**Proof.** Every carrier point is either a triangle vertex or a non-triangle point. M9 places every non-triangle point in exactly one cap interior. The three indexed triangle vertices exhaust the first alternative. QED.

**Status:** [PROVED by packet membership lemmas]

### Q6. Direct survival at the two non-surplus opposite vertices

For categories 1 and 2, exact-cap containment gives a positive-radius class that survives deletion of the surplus-interior point `x`.

These are the theorems

```text
exists_oppIndex1_erase_witness_of_surplusInterior
exists_oppIndex2_erase_witness_of_surplusInterior
```

**Status:** [PROVED]

### Q7. Four residual categories

The remaining categories are:

- the surplus-opposite triangle vertex;
- a surplus-interior center distinct from `x`;
- a first-opposite-interior center;
- a second-opposite-interior center.

For each category, assume for contradiction that an exact erased pin exists. E0-E2 convert it into a named three-point residual circle in the exact U3/U5 format.

**Status:** [PROVED reduction]

### Q8. Cardinality split inside the surplus packet

Equation (7.2) links the surplus-cap size to `|A|`.

- If `|C*|=5`, then `|A|=10`.
- If `|C*|>5`, the continuation proves `|C*|=6`, hence `|A|=11`.

The first case is routed to Proposition E/card-ten consumers. The second is routed to card-eleven certificate consumers.

**Status:** [CERTIFIED overall; arithmetic PROVED]

### Q9. Surplus-opposite triple is impossible

In the card-ten arm, the fixed U2/full-distance-class theorem gives the contradiction. In the card-eleven arm, the promoted erased certificate gives the contradiction.

**Status:** [CERTIFIED]

### Q10. Surplus-interior triple is impossible

The same card-ten/card-eleven split excludes an exact erased pin centered at another surplus-interior point.

**Status:** [CERTIFIED]

### Q11. First opposite-interior triple is impossible

The exact selected-count family for the first opposite cap, together with containment and the `IsM44` cardinalities, excludes the residual triple.

**Status:** [CERTIFIED]

### Q12. Second opposite-interior triple is impossible

The symmetric exact selected-count family excludes the residual triple in the second opposite cap.

**Status:** [CERTIFIED]

### Q13. All exact erased pins in residual categories are excluded

Combine Q9-Q12 and E3.

**Status:** [PROVED from certified premises]

### Q14. Every residual center has a surviving K4 witness

Apply L9 to each of the four residual categories.

**Status:** [PROVED]

### Q15. Every surviving center has a witness

Use Q5 to split an arbitrary `p∈A-x`. Use Q6 for the two direct apex cases and Q14 for the remaining four cases.

**Status:** [PROVED]

### Q16. The chosen point is removable

Q3 gives `x∈A`; Q15 gives `K4(A-x)`. Therefore `IsRemovableVertex A x`.

**Status:** [PROVED from certified premises]

### Q17. Branch conclusion

If there exists an `IsM44` surplus packet on `A`, then `A` has a removable vertex.

**Status:** [CERTIFIED; no current `sorryAx` dependency]

### Trust-boundary note

The prose argument is logically complete, but some terminal finite exclusions are proved with generated `native_decide` certificate banks. The current repository policy treats `Lean.ofReduceBool` and `Lean.trustCompiler` as approved for those banks. Calling the branch “certified” distinguishes that trust boundary from both ordinary kernel-only proofs and open `sorry` leaves.

---

## 10. The non-`IsM44` branch, expanded atomically

The current theorem is `removableVertexOfLarge_of_nonIsM44`. Its own Lean body is short and source-clean; the last general call reaches the open frontier.

Assume

\[
\neg\exists S:\operatorname{SurplusCapPacket}(A),\;S.\operatorname{IsM44}.
\tag{10.1}
\]

### N0. A surplus packet still exists

M12 provides at least one surplus packet `S` because `A` is nonempty, convexly independent, K4, and has more than nine points.

**Status:** [PROVED]

### N1. Counterexample data

Package `A`, its three counterexample hypotheses, and the chosen packet `S` into `CounterexampleData D`.

**Status:** [PROVED construction]

### N2. The strong-induction hypothesis implies structure-level minimality

`D.Minimal` says that no smaller nonempty convexly independent K4 set exists. If a candidate `B` violated this, then `|B|<|A|` and the original `hMin` would give `False`.

**Status:** [PROVED]

### N3. Global no-`IsM44` transports to `D.A`

Since `D.A` is definitionally `A`, equation (10.1) becomes

\[
\neg\exists T:\operatorname{SurplusCapPacket}(D.A),\;T.\operatorname{IsM44}.
\]

**Status:** [PROVED]

### N4. Minimality produces a critical shell system

For every source `x∈D.A`, minimality says `x` is not removable. Therefore deletion fails at some surviving center. B8 converts that failure into a unique-four blocker and canonical four-row through `x`. Choosing one blocker and row for every source yields a `CriticalShellSystem D.A`.

**Status:** [PROVED by `D.exists_criticalShellSystem_of_minimal`]

### N5. Canonical interpretation of the chosen system

For every source `x`:

1. `H.centerAt x` is a unique-four center;
2. `H.centerAt x ≠ x`;
3. the selected shell support equals the canonical row of that center; and
4. `x` belongs to that row.

**Status:** [PROVED in `MinimalUniqueFourCover.lean`]

### N6. Switch the target to contradiction

The formal branch target is an existential removable vertex. The proof executes `exfalso`: it is enough to show that no minimal configuration satisfying N0-N5 can exist.

This is logically sound because `False` implies every proposition, including the requested existential. It also means the negative branch need not name a geometrically canonical removable point.

**Status:** [PROVED logical step]

### N7. Exact cardinality-eleven branch

If `|D.A|=11`, apply

```text
false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven
```

with the packet, minimality, global no-`IsM44` condition, cardinality equation, and critical shell system.

The current repository records this branch as closed by promoted finite certificates and source-clean coordinators.

**Status:** [CERTIFIED]

### N8. General cardinality branch

If `|D.A|≠11`, the source calls

```text
ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap
```

with the packet, minimality, global no-`IsM44`, `9<|D.A|`, and the critical shell system.

**Status:** [OPEN transitively]

### N9. Exact single theorem needed for unconditional closure

The entire negative branch would be unconditional if the following theorem were proved without `sorryAx`.

> **GlobalNonM44Contradiction.** Let `D` be counterexample data. Assume `D` is minimal, `9<|D.A|`, no surplus packet on `D.A` is `IsM44`, and `H` is a critical shell system on `D.A`. Then `False`.

The current 29 leaves are one refinement tree for this theorem. Because unrestricted refactoring is allowed, those theorem boundaries need not be preserved. A different proof of `GlobalNonM44Contradiction`, or a direct removable-vertex theorem under the same hypotheses, would close the same spine.

**Status:** [OPEN]

---

## 11. Current decomposition of the open theorem

The current README measures 29 `sorry`-carrying leaves reachable from the publication target. They are all descendants of N8 and fall into four clusters.

### F0. Rigid221 cluster - 18 leaves

This cluster studies a five-point physical class split as `2+2+1` across two canonical rows and a fifth point. Its most developed exact-cardinality route reaches a 17-point configuration.

Atomic established facts in the described 17-point subbranch include:

1. a relevant cap has size 9, 10, or 11;
2. each of four rows meets that cap in at most two points;
3. cap sizes 10 and 11 provide spare interior points outside all four rows;
4. deleting those spares reduces to checked 16- and 15-point certificate banks;
5. for cap size 9, either an outside point is unused by all rows, which is closed, or the four rows partition all eight outside points into exact pairs, which is open.

The route is not unbounded: the current source has no transfer theorem for `|A|≥18` in this branch.

**Status:** [OPEN cluster]

### F1. TriApex cluster - 2 roots (kernel-mined 23 August 2026)

The current `TriApexEndpointRetainedOmission.lean` has exactly two reachable `sorry` declarations in this cluster, D1 and D2.  The 22 August ledger described nine declarations before the reverse-hit bypass was implemented.  Three source facts remain important.

1. The all-large input is not merely a statement that three caps are large. `TriApexAllLargeContext` supplies an indexed six-point floor on every MEC cap, rich-class structure at every opposite apex, the global nonrobust-center cover inequality, and the theorem that no one positive-radius class covers all three MEC apices.
2. The source already proves most of the normalization that the old closure programs proposed as future work. In particular, it provides a source-faithful deletion fan over every selected four-row, exact blocker-cap localization, a nonrobust/equal-support versus distinct-center/small-overlap dichotomy, the reverse-blocker order between the retained endpoints, the paired-grid cap census, the endpoint shared-blocker support collapse, and the exact cross-hit-or-third-packet continuation of a three-distinct-blocker path.
3. The old D2 statement was false: the eight points of the two-radius grid do **not** all lie in the strict first-cap interior. Exactly four lie there. On each of the two first-apex radii, the remaining two points escape to opposite adjacent caps.

Before the bypass, the nine leaves were organized into five typed geometry/continuation kernels:

- `TA-JOINT-DELETION`: D1 and the distinct-secondary-blocker arm of D8;
- `TA-TWO-RADIUS-GRID`: D2;
- `TA-ENDPOINT-CROSS-ORDER`: D3, D6, D7, and the cross-hit arm of D9;
- `TA-SHARED-SIX-SEED`: D4 and D5; and
- `TA-THREE-PACKET-CYCLE`: the cycle arm of D9.

The 23 August implementation proves
`nonempty_pairedApexClassJointDeletion_of_reverseHit`.  Each retained shell
meets the frontier radius class in at most two points, and `O.kept` lies in
both intersections; hence their union has cardinality at most three.  The
frontier class has at least four points, so one source escapes both shells.
Deletion of that source survives at the robust first apex and at both retained
blockers, producing the D1 packet.  D3--D9 now call this route transparently,
and the main reverse-hit coordinator uses it before endpoint classification.

The selector's direct axiom closure is exactly the ordinary core set
`{propext, Classical.choice, Quot.sound}`.  The contradiction route still
reaches `sorryAx` through D1, while D2 remains prose-closed but Lean-open.
Thus the independent F1 frontier is exactly D1 plus D2; no F1 closure is
claimed.

**Status:** [TWO LIVE SORRIES; D1 RESEARCH KERNEL OPEN; D2 PROSE-CLOSED/LEAN-OPEN; D3--D9 SOURCE-CLEAN WRAPPERS THROUGH D1]

The consolidated source review and full F1 archive accounting is in
`docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md`.

### F2. TwoSource cluster — semantic all-blockers reduction

The earlier six-leaf roster reflects an early choice of a total `CriticalShellSystem`. The newest refactor retains all legal canonical blockers, chooses two fresh strict-first-cap sources first, and chooses a blocker section only after the useful source pair and branch are known.

The semantic reduction is now prose-complete:

1. the cap-eight margin gives two fresh strict-cap sources;
2. their first-apex radii are either common or aligned singleton radii;
3. they either possess a common canonical blocker or admit distinct mutually omitting canonical rows; and
4. the entire F2 branch therefore reduces to four intrinsic packets:
   `CR-CB`, `CR-MO`, `AR-CB`, and `AR-MO`.

These four packets group into two genuinely new theorem families:

- **Root A:** exclude a common canonical blocker for the selected fresh pair; and
- **Root B:** exclude the mutual-omission failure/survival square.

This bypasses the old FreshThird finite-map split and the E1, E2, E3, F1, G1, and H1 theorem boundaries as load-bearing architecture. It does **not** prove Root A or Root B, and it does not yet remove the old leaves from the Lean spine.

A separate compatibility lane remains useful: the later raw-main common-radius FreshThird distinct-cap route has a prose-complete preferred-first-cap blocker proof and a statically checked source patch. That route is independently valuable for existing callers, but the all-blockers reduction is now the recommended F2 architecture.

Checkpoint 36 adds one exact producer to the hard two-cap-hit branch. Unless a four-survivor upgrade fires, it yields a cross-radius mutual-omission cycle. The exceptional F8 arm, where the source-blocker row contains the full smaller-radius pair, is not covered by the ordinary cycle consumer and needs a provenance-preserving saturation adapter. The preferred source patch is not integrated in the live tree, and the old six theorem boundaries remain on the current Lean spine.

**Status:** [FOUR INTRINSIC PACKETS / TWO THEOREM FAMILIES OPEN; CROSS-RADIUS CYCLE PRODUCER PROSE-CLOSED; F8 ADAPTER OPEN; EIGHT LIVE F2 SORRIES; PREFERRED-FRESHTHIRD ROUTE PROSE-CLOSED, LEAN BUILD PENDING]
### F3. Two-deletion cluster - 3 tracked leaves, reduced to typed global continuations

The live source still contains the three historical B1/B2/B3 `sorry`s. The third-pass audit preserves the ingress, blocker split, two-cycle exclusion, cross-omission normalization, common-deletion packet, seven-way split, physical-class/joint-locus finite calculus, and local equal-blocker escape. It rejects the second pass's generic `JointCapCover`/well-founded-successor interface: successor centers need not stay in the physical joint locus, survival pairs do not retain the required source/row/deletion data, and the literal collision forms are locally consistent rather than contradictory.

The corrected program uses the nonrecursive physical trace system: each source has at most one companion, reciprocal arrows are the equal-blocker pairs, blocker fibers have size at most two, a sparse conflict graph yields a one-third mutually omitted family, and survival amplification produces bounded fan/grid/diagonal packets. The remaining global roots are `F3-BOUND-ROOT`, `F3-THREE-ROOT`, and the three diagonal roots `F3-DIAG-A-ROOT`, `F3-DIAG-P-ROOT`, `F3-DIAG-X-ROOT`.

**Status:** [LOCAL CALCULUS PRESERVED; SECOND-PASS RECURSIVE INTERFACE REJECTED; THREE LIVE SORRIES; FIVE METRIC ROOTS OPEN]

> **Third-pass authority.** Sections F3.32--F3.54 below are retained as the audited development record, but their recursive closure proposal is superseded wherever it conflicts with the third-pass physical-trace correction summarized above and in Section 16.5.I32.

<!-- F3-JOINT-LOCUS-DESCENT-BEGIN -->

### F3.32. Second closure pass: preserve the whole joint-deletion locus

The previous F3 expansion correctly normalized the equal-blocker branch into nine typed continuations and the distinct-blocker branch into seven typed continuations.  It still treated the two retained deletion witnesses as isolated points.  That loses the finite-set invariant that is needed both for recursion and for the small residual cases.  The invariant to retain is the **entire joint-deletion locus**.

Throughout this addendum, `C` denotes the physical class, `K_u` and `K_v` denote the two canonical rows attached to the current sources `u` and `v`, and `q,w` denote the two retained deletion witnesses.  All complements below are complements **inside `C`**.  They are never complements in the ambient carrier.

For a finite physical class, define

\[
T_u := C\cap K_u,\qquad T_v := C\cap K_v,
\]

and

\[
J(u,v):=C\setminus(T_u\cup T_v).
\]

Thus `J(u,v)` is the set of physical-class points omitted by both current canonical rows.  A point belongs to `J(u,v)` exactly when it is in `C`, is not in `K_u`, and is not in `K_v`.

A direct Lean definition should use the representation already used for the physical class and rows.  If both are `Finset`s, the definitions are:

```lean
variable {P : Type*} [DecidableEq P]

def rowTrace (C K : Finset P) : Finset P := C ∩ K

def jointDeletionLocus (C K_u K_v : Finset P) : Finset P :=
  C \ (rowTrace C K_u ∪ rowTrace C K_v)
```

Do not introduce these as a second competing notion if the code already has a row-intersection helper.  In that case define only `jointDeletionLocus` in terms of the existing helper and add simp lemmas exposing the pointwise meaning.

The minimum simp interface is:

```lean
@[simp] theorem mem_rowTrace_iff :
    x ∈ rowTrace C K ↔ x ∈ C ∧ x ∈ K := by
  simp [rowTrace]

@[simp] theorem mem_jointDeletionLocus_iff :
    x ∈ jointDeletionLocus C K_u K_v ↔
      x ∈ C ∧ x ∉ K_u ∧ x ∉ K_v := by
  simp [jointDeletionLocus, rowTrace, and_assoc, and_left_comm,
    and_comm]
```

The exact normalization of conjunctions may differ.  The theorem statement, rather than a particular `simp` normal form, is the contract that later code may use.

#### F3.32.1. The context view that must be retained

The existing `ExactFourMutualOmissionSourceContext` is the correct provenance object.  The terminal theorems must not receive only detached blockers, support finsets, or branch tags.  Define a view from that context containing at least the following projections:

```lean
structure F3TraceFrame (P : Type*) [DecidableEq P] where
  C       : Finset P
  u v     : P
  K_u K_v : Finset P
  q w     : P

  huC : u ∈ C
  hvC : v ∈ C
  huv : u ≠ v

  huKu : u ∈ K_u
  hvKv : v ∈ K_v
  hv_not_Ku : v ∉ K_u
  hu_not_Kv : u ∉ K_v

  hqJ : q ∈ jointDeletionLocus C K_u K_v
  hwJ : w ∈ jointDeletionLocus C K_u K_v
  hqw : q ≠ w

  trace_u_le_two : (rowTrace C K_u).card ≤ 2
  trace_v_le_two : (rowTrace C K_v).card ≤ 2
```

This is a specification, not a request to duplicate data.  In Lean, prefer

```lean
def ExactFourMutualOmissionSourceContext.toF3TraceFrame
    (ctx : ExactFourMutualOmissionSourceContext ...) : F3TraceFrame ... := ...
```

so that every field is proved from the authoritative context.  In the exact-companion subbranch, add the stronger facts

```lean
trace_u_card_two : (rowTrace C K_u).card = 2
trace_v_card_two : (rowTrace C K_v).card = 2
```

as hypotheses of the relevant theorem, not as global axioms.  The two-circle intersection theorem supplies `≤ 2`; exact cardinality `= 2` also requires the source and its named companion to be distinct members of the trace.

The full terminal input must continue to retain the following data from `ExactFourMutualOmissionSourceContext` even though they are not fields of the small finite-set view above:

* the physical apex and the equation defining `C`;
* both blockers and the canonical-row identities;
* the exact-four support of each row and every source-to-support membership proof;
* the strict-cap parameter or strict-cap order;
* the strict-cap source and its companion source;
* `q,w` together with their deletion-survival provenance;
* all radius witnesses, kept separate until a theorem explicitly identifies them;
* every robustness statement used to transport a row across a deletion.

The hard F3 consumers need these fields.  Erasing them before the final pattern match is an interface bug, not a mathematical simplification.

### F3.33. Closed finite-set calculus for the joint-deletion locus

All lemmas in this subsection are elementary finite-set statements.  They should be proved before any branch-specific geometry.  No Euclidean argument belongs in these proofs.

#### F3.33.1. Exact decomposition and disjointness

Let

\[
U:=T_u\cup T_v,
\qquad
J:=C\setminus U.
\]

Then

\[
C=U\mathbin{\dot\cup}J.
\]

Concretely:

```lean
theorem traceUnion_union_jointDeletionLocus
    (C K_u K_v : Finset P) :
    (rowTrace C K_u ∪ rowTrace C K_v) ∪
        jointDeletionLocus C K_u K_v = C := by
  ext x
  simp [jointDeletionLocus, rowTrace]

theorem traceUnion_disjoint_jointDeletionLocus
    (C K_u K_v : Finset P) :
    Disjoint (rowTrace C K_u ∪ rowTrace C K_v)
      (jointDeletionLocus C K_u K_v) := by
  simp [Finset.disjoint_left, jointDeletionLocus, rowTrace]
```

From these two lemmas, derive the exact cardinality identity

\[
|C|=|T_u\cup T_v|+|J|.
\]

The Lean proof should use `Finset.card_union_of_disjoint` and rewrite by the decomposition theorem.  Do not prove the cardinality result by `omega` from loose inequalities; the exact identity is used again in the five-/six-point classification.

#### F3.33.2. The uniform lower bound

The circle-intersection input gives

\[
|T_u|\le 2,
\qquad
|T_v|\le 2.
\]

Therefore

\[
|T_u\cup T_v|\le 4
\]

and hence

\[
|C|\le |J|+4.
\]

This last inequality is preferable in Lean to a statement written with truncated natural subtraction.  The familiar form

\[
|J|\ge |C|-4
\]

may be exported as a corollary when convenient.

A mechanical Lean proof is:

```lean
theorem traceUnion_card_le_four
    (hu : (rowTrace C K_u).card ≤ 2)
    (hv : (rowTrace C K_v).card ≤ 2) :
    (rowTrace C K_u ∪ rowTrace C K_v).card ≤ 4 := by
  calc
    (rowTrace C K_u ∪ rowTrace C K_v).card
        ≤ (rowTrace C K_u).card + (rowTrace C K_v).card :=
          Finset.card_union_le _ _
    _ ≤ 4 := by omega

theorem card_physicalClass_le_joint_add_four
    (hu : (rowTrace C K_u).card ≤ 2)
    (hv : (rowTrace C K_v).card ≤ 2) :
    C.card ≤ (jointDeletionLocus C K_u K_v).card + 4 := by
  have hsplit := card_traceUnion_add_card_jointDeletionLocus
    (C := C) (K_u := K_u) (K_v := K_v)
  have hunion := traceUnion_card_le_four (C := C) (K_u := K_u)
    (K_v := K_v) hu hv
  omega
```

The name `card_traceUnion_add_card_jointDeletionLocus` denotes the exact cardinality theorem from F3.33.1.

#### F3.33.3. Fresh third versus exact exhaustion

Assume `q,w ∈ J` and `q ≠ w`.  Exactly one of the following useful outcomes holds:

1. there is `t ∈ J` with `t ≠ q` and `t ≠ w`; or
2. `J = {q,w}`.

Use the following pointwise theorem.  It avoids any dependence on a library theorem about finsets of cardinality two.

```lean
theorem exists_fresh_third_or_joint_eq_pair
    (hq : q ∈ J) (hw : w ∈ J) (hqw : q ≠ w) :
    (∃ t, t ∈ J ∧ t ≠ q ∧ t ≠ w) ∨ J = {q, w} := by
  classical
  by_cases h : ∃ t, t ∈ J ∧ t ≠ q ∧ t ≠ w
  · exact Or.inl h
  · right
    ext x
    constructor
    · intro hx
      by_cases hxq : x = q
      · simp [hxq]
      · have hxw : x = w := by
          by_contra hxw
          exact h ⟨x, hx, hxq, hxw⟩
        simp [hxw]
    · intro hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact hq
      · exact hw
```

The proof does not use `hqw`; that hypothesis is needed for the subsequent conclusion that the pair has cardinality two.  Keep it in the public theorem because every F3 caller has and needs it.

As immediate consequences:

* if `J.card ≥ 3`, a fresh third exists;
* if `C.card ≥ 7`, a fresh third exists, because `C.card ≤ J.card+4` forces `J.card ≥ 3`;
* if there is no fresh third and `C.card ≥ 5`, then `C.card` is either five or six.

The last statement uses `J={q,w}`, hence `J.card=2`, and the union bound.

### F3.34. Exact five- and six-point trace normal forms

This subsection closes the bounded combinatorics completely.  It does not claim the final Euclidean contradiction in either normal form.

Assume:

* `u,v ∈ C` and `u ≠ v`;
* `u ∈ K_u` and `v ∈ K_v`;
* mutual omission: `v ∉ K_u` and `u ∉ K_v`;
* `|T_u|=|T_v|=2`;
* `q,w ∈ J`, `q ≠ w`;
* there is no third member of `J` distinct from `q,w`;
* `|C|≥5`.

The no-fresh-third theorem gives `J={q,w}`.  Therefore

\[
|C|=|T_u\cup T_v|+2.
\]

For arbitrary finite sets, inclusion-exclusion gives

\[
|T_u\cup T_v|+|T_u\cap T_v|=|T_u|+|T_v|=4.
\]

Combining the two equalities gives the subtraction-free balance law

\[
|C|+|T_u\cap T_v|=6. \tag{F3-balance}
\]

Since `|C|≥5`, the intersection has cardinality zero or one.  Thus exactly one of the following holds.

#### F3.34.1. Five-point shared-mate normal form

There is a point `r` such that

\[
T_u=\{u,r\},
\qquad
T_v=\{v,r\},
\qquad
C=\{u,v,r,q,w\},
\]

and the list `[u,v,r,q,w]` has no duplicate.

The point `r` is forced.  Each two-element trace has a unique member other than its source.  Because `|T_u∩T_v|=1`, those two companions coincide.  Mutual omission excludes the two false possibilities in which the common trace point is `u` or `v`.  Membership of `q,w` in `J` makes both deletion witnesses different from every trace point.

Package the output rather than repeatedly destructing existential witnesses:

```lean
structure FivePointTraceNormalForm
    (C K_u K_v : Finset P) (u v q w : P) where
  r : P
  trace_u : rowTrace C K_u = {u, r}
  trace_v : rowTrace C K_v = {v, r}
  class_eq : C = {u, v, r, q, w}
  nodup : [u, v, r, q, w].Nodup
```

Here `{u,v,r,q,w}` is schematic notation.  In Lean, nested `Finset.insert` notation parses as expected, but the low-level proof should usually establish `class_eq` by `ext x; simp [...]`, not by trying to normalize insert order manually.

#### F3.34.2. Six-point disjoint-mate normal form

There are points `r,s` such that

\[
T_u=\{u,r\},
\qquad
T_v=\{v,s\},
\qquad
C=\{u,v,r,s,q,w\},
\]

and `[u,v,r,s,q,w]` has no duplicate.

This is the case `T_u∩T_v=∅`, equivalently `|C|=6` by (F3-balance).  The distinctness of `r` and `s` follows from disjointness.  All remaining inequalities follow from mutual omission and membership of `q,w` in the joint-deletion locus.

```lean
structure SixPointTraceNormalForm
    (C K_u K_v : Finset P) (u v q w : P) where
  r s : P
  trace_u : rowTrace C K_u = {u, r}
  trace_v : rowTrace C K_v = {v, s}
  class_eq : C = {u, v, r, s, q, w}
  nodup : [u, v, r, s, q, w].Nodup
```

Define the bounded output as an indexed sum:

```lean
inductive BoundedTwoTraceNormalForm
    (C K_u K_v : Finset P) (u v q w : P)
  | five : FivePointTraceNormalForm C K_u K_v u v q w →
      BoundedTwoTraceNormalForm C K_u K_v u v q w
  | six : SixPointTraceNormalForm C K_u K_v u v q w →
      BoundedTwoTraceNormalForm C K_u K_v u v q w
```

The principal theorem is:

```lean
theorem bounded_two_trace_normal_form
    (huC : u ∈ C) (hvC : v ∈ C) (huv : u ≠ v)
    (huKu : u ∈ K_u) (hvKv : v ∈ K_v)
    (hv_not_Ku : v ∉ K_u) (hu_not_Kv : u ∉ K_v)
    (htrace_u : (rowTrace C K_u).card = 2)
    (htrace_v : (rowTrace C K_v).card = 2)
    (hqJ : q ∈ jointDeletionLocus C K_u K_v)
    (hwJ : w ∈ jointDeletionLocus C K_u K_v)
    (hqw : q ≠ w)
    (hnoFresh : ¬ ∃ t,
      t ∈ jointDeletionLocus C K_u K_v ∧ t ≠ q ∧ t ≠ w)
    (hC5 : 5 ≤ C.card) :
    BoundedTwoTraceNormalForm C K_u K_v u v q w := by
  -- 1. J = {q,w}.
  -- 2. Derive the exact class/union/intersection cardinality identities.
  -- 3. `omega` gives C.card = 5 or C.card = 6.
  -- 4. Extract the unique non-source member of each two-element trace.
  -- 5. In the five case, prove the mates equal from intersection card one.
  -- 6. In the six case, prove the mates differ from disjointness.
  -- 7. Prove `class_eq` by extensionality and `nodup` from the stored
  --    omission and joint-locus facts.
  ...
```

The ellipsis marks routine Lean bookkeeping, not missing mathematics.  The proof should be split into the helper lemmas listed below rather than implemented as one large tactic block.

#### F3.34.3. Required helper lemmas

A low-level implementation should first add these reusable helpers:

```lean
-- Extract the unique companion of a named member of a two-element finset.
theorem exists_unique_companion_of_mem_card_two
    (hu : u ∈ T) (hcard : T.card = 2) :
    ∃ r, r ≠ u ∧ T = {u, r}

-- Cardinal inclusion-exclusion in the exact form used here.
theorem card_union_add_card_inter_eq
    (S T : Finset P) :
    (S ∪ T).card + (S ∩ T).card = S.card + T.card

-- A one-element intersection supplies a unique common member.
theorem eq_singleton_of_card_inter_eq_one
    (h : (S ∩ T).card = 1) :
    ∃! r, r ∈ S ∩ T

-- Pair decomposition plus a two-point complement gives the named class.
theorem class_eq_of_trace_union_and_joint_pair ...
```

Mathlib may already contain the first three under different names.  Reuse a library theorem only if its statement is more convenient than the local contract.  Do not make the rest of F3 depend on a fragile normal form for `Finset.card_eq_two`.

### F3.35. Consequences for the equal-blocker branch

In the equal-blocker branch, canonical-row equality and the common-row trace theorem give

\[
K_u=K_v=:K,
\qquad
C\cap K=\{u,v\}.
\]

Therefore

\[
J(u,v)=C\setminus\{u,v\}.
\]

If `q,w ∈ J`, `q ≠ w`, and `|C|≥5`, then `q,w` cannot exhaust `J`.  There is a point

\[
t\in C,
\qquad
t\notin K,
\qquad
t\ne q,
\qquad
t\ne w.
\]

This closes the bounded-residual alternative in B1.  There is no equal-blocker five-/six-point terminal to prove: the equal-blocker branch always has a fresh third physical source.

The exact Lean theorem should be independent of Euclidean geometry once the common trace equality is supplied:

```lean
theorem equal_blocker_has_fresh_joint_source
    (htrace : rowTrace C K = {u, v})
    (huv : u ≠ v)
    (hq : q ∈ jointDeletionLocus C K K)
    (hw : w ∈ jointDeletionLocus C K K)
    (hqw : q ≠ w)
    (hC5 : 5 ≤ C.card) :
    ∃ t,
      t ∈ jointDeletionLocus C K K ∧ t ≠ q ∧ t ≠ w := by
  classical
  rcases exists_fresh_third_or_joint_eq_pair
    (J := jointDeletionLocus C K K) hq hw hqw with h | hpair
  · exact h
  · have hC_le_four : C.card ≤ 4 := by
      -- Rewrite C as {u,v} ∪ {q,w} using the trace/joint decomposition.
      -- Then bound the card of the union by four.
      ...
    omega
```

This theorem is stronger and cleaner than selecting one escape point before retaining the full complement.  The selected `t` should be threaded into the existing strict-cap cover theorem.  If the strict-cap theorem requires an interior point rather than an arbitrary member of `J`, add a separate selection lemma converting the fresh joint source into an interior-oriented source.  Do not silently conflate “outside both rows” with “strictly inside the cap.”

#### F3.35.1. Revised equal-blocker obligation

The remaining equal-blocker mathematics is no longer “derive one of the old overlap terminals.”  It is the following source-faithful step theorem:

> **Equal-blocker fresh-step theorem.**  From the full `ExactFourMutualOmissionSourceContext`, equal blockers, and a fresh `t∈J\{q,w}`, produce either a directly contradictory terminal packet or a new F3 state whose strict-cap interval is smaller.

The existing nine-way continuation dispatcher remains useful, but its seven support-location constructors must be consumed while the full source context and `q,w,t` are still available.  A theorem receiving only the detached nine-way packet is too weak to prove the interval decrease.

### F3.36. Consequences for the distinct-blocker branch

For distinct blockers, the existing local proof already supplies:

1. contradiction for the genuine two-blocker cycle;
2. an orientation in which one cross-membership is absent;
3. a prescribed deletion producing the exact common-deletion packet;
4. a seven-constructor continuation: three literal source/blocker collisions and four bidirectional survival alternatives.

The joint-locus split now refines the input to the final consumer.

* If there is `t∈J\{q,w}`, route to a fresh-step theorem, retaining the orientation and prescribed-deletion witness.
* If there is no such `t`, invoke `bounded_two_trace_normal_form` and work in the exact five- or six-point named configuration.

This is exhaustive.  There is no third residual branch.

#### F3.36.1. Five-point branch target

The exact remaining packet is:

```lean
structure FivePointF3TerminalInput extends
    FivePointTraceNormalForm C K_u K_v u v q w where
  -- authoritative geometric provenance, projected from ctx
  physicalApex : P
  blocker_u blocker_v : P
  blockers_ne : blocker_u ≠ blocker_v
  canonical_u : ...
  canonical_v : ...
  exactSupport_u : ...
  exactSupport_v : ...
  deletion_q : ...
  deletion_w : ...
  capData : ...
```

The literal field types represented by `...` must be copied from `ExactFourMutualOmissionSourceContext`; do not restate equal-distance claims with newly chosen radii.  The terminal theorem is:

```lean
theorem fivePointF3TerminalInput_false
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (nf : FivePointTraceNormalForm
      ctx.C ctx.K_u ctx.K_v ctx.u ctx.v ctx.q ctx.w) : False := by
  ...
```

A likely reuse path is an adapter to the F1 TriApex consumer: the physical apex and the two distinct blockers are three named centers, while the shared mate `r` lies in both row traces.  This reuse is valid only after checking every F1 input field.  In particular, do not identify the physical radius with either blocker-row radius, and do not infer that the independently selected exact-four supports are equal.  The adapter obligation is:

```lean
def fivePointNormalForm.toTriApexPacket
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (nf : FivePointTraceNormalForm ...) :
    TriApexInput ...
```

If the F1 packet requires a common radius or a point lying in all three exact rows, this adapter is unavailable and the five-point theorem needs a direct proof.  The first implementation step is therefore a field-by-field compatibility audit, not an optimistic constructor call.

#### F3.36.2. Six-point branch target

The exact remaining packet is:

```lean
theorem sixPointF3TerminalInput_false
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (nf : SixPointTraceNormalForm
      ctx.C ctx.K_u ctx.K_v ctx.u ctx.v ctx.q ctx.w) : False := by
  ...
```

The natural reuse candidate is the F2 packet-level FreshThird synchronization theorem.  The two disjoint trace pairs give two independently selected blocker rows, and `q,w` supply the retained deletion witnesses.  Again, the adapter must preserve both radii and both support choices until the FreshThird theorem performs the synchronization.  The required audit target is:

```lean
def sixPointNormalForm.toFreshThirdPacket
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (nf : SixPointTraceNormalForm ...) :
    FreshThirdPacket ...
```

If the current FreshThird theorem requires an additional strict-cap interior source, that source must come from the original context and must be shown, using `nf.class_eq`, to equal one of the six named slots.  This turns an unbounded existential into six explicit cases.

### F3.37. The strict-cap descent measure

The two global terminal theorems should be replaced by a single well-founded descent over a context-indexed state.  The retained deletion witnesses `q,w` are the natural endpoints of the strict cap.  The context must expose a real-valued cap parameter `τ` (or an equivalent strict linear order) with

\[
\tau(q)<\tau(w).
\]

For a finite physical class define

\[
I_C(q,w):=\{x\in C:\tau(q)<\tau(x)<\tau(w)\}
\]

and

\[
\mu(q,w):=|I_C(q,w)|.
\]

A Lean implementation that avoids installing a new order instance on points is:

```lean
def capOpenInterval
    (C : Finset P) (τ : P → ℝ) (q w : P) : Finset P :=
  C.filter fun x => τ q < τ x ∧ τ x < τ w

def capSpan
    (C : Finset P) (τ : P → ℝ) (q w : P) : Nat :=
  (capOpenInterval C τ q w).card
```

No injectivity of `τ` is needed for the elementary shrink lemmas below.  Injectivity may be needed elsewhere to turn parameter equality into point equality; keep that as a separate context field.

#### F3.37.1. Closed interval-shrink lemmas

If `m∈C` and

\[
\tau(q)<\tau(m)<\tau(w),
\]

then both replacement intervals are strictly smaller:

\[
\mu(q,m)<\mu(q,w),
\qquad
\mu(m,w)<\mu(q,w).
\]

The proof is finite-set inclusion plus one explicit missing point.  For the left replacement, every point strictly between `q` and `m` is strictly between `q` and `w`, while `m` belongs to the larger interval and not the smaller one.  The right replacement is symmetric.

```lean
theorem capSpan_left_lt
    (hmC : m ∈ C)
    (hqm : τ q < τ m)
    (hmw : τ m < τ w) :
    capSpan C τ q m < capSpan C τ q w := by
  apply Finset.card_lt_card
  refine Finset.ssubset_iff_subset_ne.mpr ?_
  constructor
  · intro x hx
    simp only [capOpenInterval, Finset.mem_filter] at hx ⊢
    exact ⟨hx.1, hx.2.1, lt_trans hx.2.2 hmw⟩
  · intro heq
    have hmBig : m ∈ capOpenInterval C τ q w := by
      simp [capOpenInterval, hmC, hqm, hmw]
    have hmSmall : m ∉ capOpenInterval C τ q m := by
      simp [capOpenInterval]
    exact hmSmall (heq ▸ hmBig)
```

The exact `ssubset` API may differ by Mathlib version.  A robust alternative is to prove subset, prove membership of `m` in the set difference, and use `Finset.card_lt_card`.  Add the symmetric `capSpan_right_lt` and the two-interior-endpoint theorem

```lean
theorem capSpan_inner_lt
    (hmC : m ∈ C) (hnC : n ∈ C)
    (hqm : τ q < τ m) (hmn : τ m < τ n) (hnw : τ n < τ w) :
    capSpan C τ m n < capSpan C τ q w
```

by the same argument.

These lemmas are globally reusable and mathematically closed.

### F3.38. Context-indexed one-step semantics

Define an F3 state by retaining the authoritative source context together with the cap orientation needed by the measure.  The exact declaration should wrap, not copy, the existing context.

```lean
structure F3DescentState where
  ctx : ExactFourMutualOmissionSourceContext ...
  τ : P → ℝ
  hcap_qw : τ ctx.q < τ ctx.w
  -- proofs that τ is the parameter supplied by ctx.capData
  cap_provenance : ...
```

Define

```lean
def F3DescentState.measure (S : F3DescentState ...) : Nat :=
  capSpan S.ctx.C S.τ S.ctx.q S.ctx.w
```

The terminal alternatives must remain indexed by the state whose data they use:

```lean
inductive F3TerminalCase (S : F3DescentState ...)
  | equalCollision₁ : ... → F3TerminalCase S
  | equalCollision₂ : ... → F3TerminalCase S
  | distinctCollision₁ : ... → F3TerminalCase S
  | distinctCollision₂ : ... → F3TerminalCase S
  | distinctCollision₃ : ... → F3TerminalCase S
  | boundedFive : FivePointTraceNormalForm ... → F3TerminalCase S
  | boundedSix : SixPointTraceNormalForm ... → F3TerminalCase S
```

Use the exact constructor names of the existing nine- and seven-way packets in the implementation.  The schematic names above describe their role only.

The one-step result is:

```lean
inductive F3OneStep (S : F3DescentState ...)
  | terminal (h : F3TerminalCase S)
  | descend (S' : F3DescentState ...)
      (hμ : S'.measure < S.measure)
```

The branch dispatcher to prove is:

```lean
theorem f3_oneStep (S : F3DescentState ...) : F3OneStep S := by
  by_cases hblock : S.ctx.blocker_u = S.ctx.blocker_v
  · -- invoke the existing equal-blocker nine-way producer
    -- retain S.ctx and the fresh joint source
    -- map each constructor to a terminal or a smaller successor
    ...
  · -- invoke the existing distinct-blocker seven-way producer
    -- first split fresh third versus bounded normal form
    -- map the three collision constructors to terminal
    -- map the four survival constructors to a smaller successor
    ...
```

This theorem is the correct location for the remaining branch-specific mathematics.  It has all provenance in scope and its output type makes non-decreasing recursion impossible.

#### F3.38.1. Exact successor obligations

For every recursive constructor, the proof must construct a new `ExactFourMutualOmissionSourceContext`, not just a new pair of endpoint points.  The constructor proof has six independent obligations:

1. **ambient preservation:** the ambient carrier, physical apex, and physical class are unchanged;
2. **source provenance:** the new sources and blockers come from the row/deletion witnesses named by the constructor;
3. **canonical-row provenance:** each new row is identified with the canonical row chosen by the source context, without choosing a new radius silently;
4. **mutual omission and deletion survival:** all fields required by the source context are rebuilt explicitly;
5. **cap orientation:** the new endpoints are either `(q,t)`, `(t,w)`, or two ordered strict-interior points;
6. **strict decrease:** discharge with `capSpan_left_lt`, `capSpan_right_lt`, or `capSpan_inner_lt`.

If one of the current continuation constructors does not contain enough data for obligations 2–5, strengthen that constructor at its producer.  Do not add an axiom to the consumer and do not recover the missing witness with an unrelated classical choice.

### F3.39. Generic well-founded closure theorem

> **Superseded interface.** The theorem below is a valid conditional induction
> scheme, but the third-pass audit rejects it as the active F3 interface. The
> required `JointCapCover` and provenance-preserving successor are not produced
> by the current source packets. Do not implement this scheme or assign it
> closure credit unless those missing invariants are proved independently.

Once `f3_oneStep` and direct contradictions for all terminal constructors are available, the global recursion is completely mechanical.

```lean
theorem f3TerminalCase_false
    (S : F3DescentState ...)
    (h : F3TerminalCase S) : False := by
  cases h with
  | equalCollision₁ h₁ => exact ...
  | equalCollision₂ h₂ => exact ...
  | distinctCollision₁ h₁ => exact ...
  | distinctCollision₂ h₂ => exact ...
  | distinctCollision₃ h₃ => exact ...
  | boundedFive nf => exact fivePointF3TerminalInput_false S.ctx nf
  | boundedSix nf => exact sixPointF3TerminalInput_false S.ctx nf

theorem f3DescentState_false (S : F3DescentState ...) : False := by
  refine (measure_wf F3DescentState.measure).induction S ?_
  intro S ih
  rcases f3_oneStep S with hterm | ⟨S', hlt⟩
  · exact f3TerminalCase_false S hterm
  · exact ih S' hlt
```

No separate base case is required.  At measure zero, `f3_oneStep` cannot construct a strictly smaller successor, so it must return a terminal constructor.

This theorem closes the global logical architecture.  It must not be marked as closing F3 until `f3_oneStep` and both bounded terminal consumers are proved from the existing geometric hypotheses.

### F3.40. Constructor-by-constructor proof protocol

The existing nine equal-blocker constructors and seven distinct-blocker constructors must be audited in their current source order.  For each constructor, add a row to the closure matrix and record exactly one of the following outcomes:

* `TERMINAL`: construct a state-indexed terminal packet and cite the direct contradiction theorem;
* `LEFT`: construct the successor with endpoints `(q,t)` and apply `capSpan_left_lt`;
* `RIGHT`: construct the successor with endpoints `(t,w)` and apply `capSpan_right_lt`;
* `INNER`: construct the successor with two ordered interior endpoints and apply `capSpan_inner_lt`;
* `BOUNDED-FIVE` or `BOUNDED-SIX`: construct the corresponding exact normal form;
* `IMPOSSIBLE`: derive `False` directly from constructor equalities and stored distinctness;
* `NEEDS-STRENGTHENING`: the producer omitted data needed to choose one of the preceding outcomes.

A constructor may not be recorded merely as “survival” or “continue.”  The matrix must name the successor context and the strict-decrease lemma.

For each recursive constructor, the prose proof must include the following literal data:

```text
old endpoints: q, w
chosen interior point(s): ...
new endpoints: ...
new source pair: ...
new blocker pair: ...
new canonical rows: ...
new deletion witnesses and survival proofs: ...
strict inequalities in τ: ...
measure lemma: capSpan_left_lt / capSpan_right_lt / capSpan_inner_lt
```

This is the level at which a low-level Lean agent can implement the branch without inventing geometry.

### F3.41. Bounded terminal proof strategy

The five- and six-point normal forms are the only genuinely bounded residual cases.  They should be attacked before attempting a new unbounded argument.

#### F3.41.1. First route: reuse F1 and F2 consumers

Perform two exact interface audits:

1. `FivePointTraceNormalForm → TriApexInput`;
2. `SixPointTraceNormalForm → FreshThirdPacket`.

For each target structure, make a table with one row per field and classify it as:

* direct projection from `ctx`;
* consequence of `nf.trace_u`, `nf.trace_v`, or `nf.class_eq`;
* consequence of `nf.nodup`;
* requires canonical-row uniqueness;
* unavailable.

The adapter exists only if every field is discharged without identifying unrelated radii or unrelated post-deletion supports.  An unavailable field is a mathematical obstruction, not a cue to weaken the type.

#### F3.41.2. Second route: direct finite Euclidean certificate

If either adapter fails, use the named normal form to construct a finite incidence certificate.  The direct proof should proceed in the following order.

1. Replace every quantified physical-class point by one of the five or six named slots using `nf.class_eq`.
2. Replace both physical traces by the exact pairs from `nf.trace_u` and `nf.trace_v`.
3. Retain the two external support points on each exact-four row as separately named witnesses.
4. Split all equalities among external support points, blockers, and the named physical points.  Discharge impossible equalities from row-center nonmembership, source/blocker distinctness, and `nf.nodup`.
5. Apply the two-circle intersection bound whenever two distinct rows would share three named support points.
6. Translate every equality of two distances to a perpendicular-bisector incidence.  Use bisector saturation only after proving that the candidate center is a carrier point in the exact ambient set to which saturation applies.
7. Use the strict-cap order to orient all remaining companion chords.  Any recursive interior configuration should be returned as a smaller F3 state rather than re-proved locally.
8. The final purely finite incidence table may be discharged with `native_decide`, but only after a theorem transfers every Boolean atom back to the original Euclidean predicates.

The direct route is not yet a proof.  It is a finite, auditable target whose variables are now bounded by the five-/six-point normal forms.

### F3.42. Historical second-pass closure matrix (superseded)

> Every status in this matrix is a second-pass development label. The third
> pass makes the recursive rows dormant by rejecting their missing
> `JointCapCover`/successor interface. Only the local finite-set and trace facts
> carried forward into F3.55--F3.73 remain active; the five roots in
> Section 16.5.I32 are the current frontier.

Status vocabulary:

* **CLOSED-PROSE** — the mathematical proof is complete above; only Lean transcription remains.
* **MECHANICAL-LEAN** — no new mathematical idea is required, but code has not yet been written.
* **INTERFACE-REFACTOR** — authoritative data already exist but must be threaded through theorem signatures.
* **OPEN-BRANCH** — a constructor-specific geometric reconstruction or contradiction remains.
* **OPEN-BOUNDED** — one of the exact five-/six-point Euclidean consumers remains.
* **CANDIDATE-REUSE** — a proposed adapter must be checked field by field against another cluster theorem.
* **BLOCKED** — the row cannot close before listed dependencies close.

| ID | Obligation | Exact output | Status | Dependencies | Next proof action |
|---|---|---|---|---|---|
| F3-J0 | Define `rowTrace` and `jointDeletionLocus` inside `C` | simp-normalized membership API | CLOSED-PROSE | none | Transcribe definitions or map to existing helpers. |
| F3-J1 | Trace-union/joint-locus decomposition | `C = (T_u∪T_v) ⊔ J` and exact card identity | CLOSED-PROSE | F3-J0 | Implement by extensionality and disjoint union cardinality. |
| F3-J2 | Joint-locus lower bound | `C.card ≤ J.card + 4` | CLOSED-PROSE | F3-J1, two-circle trace bounds | Implement `card_union_le`; finish with `omega`. |
| F3-J3 | Fresh third or exact pair | `∃t∈J\{q,w}` or `J={q,w}` | CLOSED-PROSE | q,w membership and distinctness | Implement the pointwise by-cases proof. |
| F3-J4 | Large-class fresh third | `7 ≤ C.card → ∃t∈J\{q,w}` | CLOSED-PROSE | F3-J2, F3-J3 | Cardinal arithmetic. |
| F3-N0 | Companion extraction from a two-element trace | `T={u,r}`, `r≠u` | CLOSED-PROSE | finite-set helper | Add reusable helper lemma. |
| F3-N1 | Bounded balance law | `C.card + (T_u∩T_v).card = 6` | CLOSED-PROSE | F3-J1, `J={q,w}`, exact trace cards | Use inclusion-exclusion; avoid Nat subtraction. |
| F3-N2 | Five-point normal form | shared mate `r`, exact class, `Nodup` | CLOSED-PROSE | F3-N0, F3-N1, mutual omission | Implement structure constructor field by field. |
| F3-N3 | Six-point normal form | disjoint mates `r,s`, exact class, `Nodup` | CLOSED-PROSE | F3-N0, F3-N1, mutual omission | Implement structure constructor field by field. |
| F3-E0 | Equal-blocker common trace | `T_u=T_v={u,v}` | previously locally closed | canonical-row equality and B1 trace theorem | Keep authoritative existing proof. |
| F3-E1 | Equal-blocker fresh joint source | `t∈J`, `t≠q,w` | CLOSED-PROSE | F3-E0, `5≤C.card`, F3-J3 | Implement theorem F3.35. |
| F3-E2 | Convert fresh joint source to strict-cap interior source | named `t` with cap inequalities | OPEN-BRANCH | F3-E1, strict-cap cover theorem | Prove selection/orientation without conflating joint omission with cap interior. |
| F3-E3 | Equal nine-way producer | dependent continuation packet | previously locally closed | existing B1 code | Preserve as producer; do not erase `ctx`. |
| F3-E4 | Consume two equal-branch collision constructors | state-indexed terminal contradiction | OPEN-BRANCH | full context, F3-E3 | Reprove with `ctx` in scope; record exact constructor equalities. |
| F3-E5 | Consume seven support-location constructors | terminal or strictly smaller successor state | OPEN-BRANCH | F3-E2, F3-E3, cap shrink lemmas | Audit one constructor at a time using F3.40 protocol. |
| F3-D0 | Distinct two-blocker cycle | `False` | previously locally closed | existing distinct-blocker code | Keep authoritative proof. |
| F3-D1 | Oriented cross omission and prescribed deletion | exact common-deletion packet | previously locally closed | existing distinct-blocker code | Keep authoritative proof and provenance. |
| F3-D2 | Seven-way distinct dispatcher | three collisions or four survivals | previously locally closed | F3-D1 | Keep dependent constructors indexed by `ctx`. |
| F3-D3 | Distinct fresh/bounded split | fresh `t` or five/six normal form | CLOSED-PROSE | F3-J3, F3-N2, F3-N3 | Implement split before consuming D2. |
| F3-D4 | Consume three literal collision constructors | state-indexed terminal contradiction | OPEN-BRANCH | F3-D2, full context | Pattern match with source/blocker distinctness in scope. |
| F3-D5 | Consume four survival constructors | smaller successor state | OPEN-BRANCH | F3-D2, cap shrink lemmas | Rebuild complete successor context; no detached omission pair. |
| F3-B5 | Five-point Euclidean consumer | `FivePointTraceNormalForm → False` | OPEN-BOUNDED | exact ctx threading | First audit possible F1 adapter. |
| F3-B5A | Five-point to F1 adapter | `TriApexInput` | CANDIDATE-REUSE | F1 public interface | Produce field-by-field compatibility table; reject if any radius/support is forced illegally. |
| F3-B6 | Six-point Euclidean consumer | `SixPointTraceNormalForm → False` | OPEN-BOUNDED | exact ctx threading | First audit possible F2 FreshThird adapter. |
| F3-B6A | Six-point to F2 adapter | `FreshThirdPacket` | CANDIDATE-REUSE | packet-level FreshThird theorem | Preserve separately chosen radii/supports; enumerate strict-cap source slot via `class_eq`. |
| F3-I0 | Thread `ExactFourMutualOmissionSourceContext` into terminal theorems | context-indexed APIs | INTERFACE-REFACTOR | none | Change signatures before proving any consumer. |
| F3-M0 | Define cap interval and `capSpan` | finite Nat measure | CLOSED-PROSE | cap parameter projection | Implement definitions. |
| F3-M1 | Left/right/inner interval shrink | strict Nat inequalities | CLOSED-PROSE | F3-M0 | Implement finite strict-subset proofs. |
| F3-M2 | Define `F3DescentState`, terminal cases, and one-step type | no data erasure | MECHANICAL-LEAN | F3-I0, F3-M0 | Wrap authoritative context; use dependent constructors. |
| F3-M3 | Branch-specific `f3_oneStep` | terminal or smaller state | BLOCKED | F3-E2/E4/E5, F3-D3/D4/D5 | Assemble only after each constructor has a matrix outcome. |
| F3-M4 | Terminal-case contradiction dispatcher | `F3TerminalCase S → False` | BLOCKED | F3-E4, F3-D4, F3-B5, F3-B6 | Mechanical cases after consumers close. |
| F3-M5 | Well-founded global closure | `F3DescentState → False` | SUPERSEDED-CONDITIONAL | F3-M3, F3-M4 | Dormant unless the rejected cover and successor interfaces are independently proved. |
| F3-FINAL | Close all three current F3 placeholders | no `sorry` in F3 leaf | BLOCKED | F3-M3, F3-M4 plus entry-state constructor | Wire old theorem statements to the new state theorem. |

### F3.43. Ordered implementation sequence

A low-level Lean agent should work in this order:

1. Add the finite-set definitions and prove F3-J0 through F3-J4 in a small support file.
2. Add the companion extraction and normal-form structures; prove F3-N0 through F3-N3.
3. Refactor the two terminal theorem signatures so they retain `ExactFourMutualOmissionSourceContext` and `q,w`.
4. Add `capOpenInterval`, `capSpan`, and the three strict-shrink lemmas.
5. Define the context-indexed state and terminal/step inductives.
6. Prove the equal-blocker fresh-source theorem F3-E1 and then the cap-orientation theorem F3-E2.
7. Audit the nine equal-blocker constructors in source order, updating the matrix after every constructor.
8. Prove the distinct fresh/bounded split F3-D3.
9. Audit the seven distinct-blocker constructors in source order.
10. Audit the F1 and F2 adapter candidates.  Implement only adapters whose fields are all source-faithful.
11. Prove any bounded consumer not discharged by reuse.
12. Assemble `f3_oneStep`, `f3TerminalCase_false`, and the generic well-founded theorem.
13. Replace the three historical F3 `sorry`s with wrappers around the new entry-state theorem.
14. Run a final provenance audit: search the F3 implementation for fresh radius choices, fresh support choices, and theorem arguments that no longer carry `ctx`.

### F3.44. Current mathematical status after this pass

This pass closes the finite combinatorics that was previously implicit:

* the full joint-deletion locus and its exact decomposition;
* the fresh-third/exhaustion dichotomy;
* the `|C|-4` lower bound in a Lean-friendly form;
* impossibility of bounded exhaustion in the equal-blocker branch;
* the exact five-point shared-mate normal form;
* the exact six-point disjoint-mate normal form;
* a concrete strict-cap cardinal measure and its decrease lemmas;
* the generic well-founded recursion theorem.

It does **not** yet prove the branch-specific one-step theorem or the two bounded Euclidean consumers.  Those are now the only mathematical consumers in F3 that cannot be discharged by finite-set bookkeeping and generic well-founded induction.  The next proof pass must therefore work constructor by constructor on F3-E2/E4/E5 and F3-D4/D5, while simultaneously checking whether F3-B5 and F3-B6 reduce to the public F1/F2 cluster theorems.

<!-- F3-JOINT-LOCUS-DESCENT-END -->

<!-- F3-LIVE-SOURCE-AUDIT-BEGIN -->

### F3.45. Live `TwoDeletionCollision.lean` reconciliation

The repository source was not available in the working container during this pass.  The mathematical contracts above remain valid, but exact declaration-name reconciliation must be rerun when the source is mounted.

<!-- F3-LIVE-SOURCE-AUDIT-END -->

<!-- F3-GENERAL-BOUNDED-PROFILE-BEGIN -->

### F3.46. General bounded profile: do not assume two companions prematurely

The exact-two classification in F3.34 is correct under the explicit hypotheses

\[
|T_u|=|T_v|=2.
\]

Before using it at the distinct-blocker entry point, prove those two equalities from `ExactFourMutualOmissionSourceContext`.  The two-circle theorem gives only `≤2`; source membership gives only `≥1`.  Without a retained distinct companion in each trace, two additional five-point profiles exist.

Assume only:

* `u∈T_u` and `v∈T_v`;
* `u≠v`;
* mutual omission, so `v∉T_u` and `u∉T_v`;
* `|T_u|≤2` and `|T_v|≤2`;
* `J={q,w}` with `q≠w`;
* `5≤|C|`.

Write

\[
a:=|T_u|,\quad b:=|T_v|,\quad i:=|T_u\cap T_v|.
\]

Source membership gives `1≤a,b`; the trace bound gives `a,b≤2`.  The exact decomposition and inclusion-exclusion give

\[
|C|=a+b-i+2.
\]

Since `|C|≥5` and `a+b≤4`, exactly one of the following four profiles occurs.

#### F3.46.1. Five-point left-singleton profile

\[
T_u=\{u\},
\qquad
T_v=\{v,s\},
\qquad
C=\{u,v,s,q,w\},
\]

with `[u,v,s,q,w].Nodup`.

This is the cardinal profile `(a,b,i)=(1,2,0)`.

```lean
structure FivePointLeftSingletonNormalForm
    (C K_u K_v : Finset P) (u v q w : P) where
  s : P
  trace_u : rowTrace C K_u = {u}
  trace_v : rowTrace C K_v = {v, s}
  class_eq : C = {u, v, s, q, w}
  nodup : [u, v, s, q, w].Nodup
```

#### F3.46.2. Five-point right-singleton profile

\[
T_u=\{u,r\},
\qquad
T_v=\{v\},
\qquad
C=\{u,v,r,q,w\},
\]

with `[u,v,r,q,w].Nodup`.

This is `(a,b,i)=(2,1,0)`.

```lean
structure FivePointRightSingletonNormalForm
    (C K_u K_v : Finset P) (u v q w : P) where
  r : P
  trace_u : rowTrace C K_u = {u, r}
  trace_v : rowTrace C K_v = {v}
  class_eq : C = {u, v, r, q, w}
  nodup : [u, v, r, q, w].Nodup
```

#### F3.46.3. Five-point shared-mate profile

\[
T_u=\{u,r\},
\qquad
T_v=\{v,r\},
\qquad
C=\{u,v,r,q,w\}.
\]

This is `(a,b,i)=(2,2,1)` and is the five-point constructor from F3.34.

#### F3.46.4. Six-point disjoint-mate profile

\[
T_u=\{u,r\},
\qquad
T_v=\{v,s\},
\qquad
C=\{u,v,r,s,q,w\}.
\]

This is `(a,b,i)=(2,2,0)` and is the six-point constructor from F3.34.

No other profile is arithmetically possible.  In particular:

* `(1,1,0)` gives `|C|=4`;
* an intersection in either singleton profile is impossible by mutual omission;
* `(2,2,2)` would give `|C|=4` and would force equal traces;
* `|C|>6` contradicts the two trace bounds and `J.card=2`.

Package the unconditional result as:

```lean
inductive GeneralBoundedTwoTraceNormalForm
    (C K_u K_v : Finset P) (u v q w : P)
  | fiveLeftSingleton :
      FivePointLeftSingletonNormalForm C K_u K_v u v q w →
      GeneralBoundedTwoTraceNormalForm C K_u K_v u v q w
  | fiveRightSingleton :
      FivePointRightSingletonNormalForm C K_u K_v u v q w →
      GeneralBoundedTwoTraceNormalForm C K_u K_v u v q w
  | fiveSharedMate :
      FivePointTraceNormalForm C K_u K_v u v q w →
      GeneralBoundedTwoTraceNormalForm C K_u K_v u v q w
  | sixDisjointMates :
      SixPointTraceNormalForm C K_u K_v u v q w →
      GeneralBoundedTwoTraceNormalForm C K_u K_v u v q w
```

The theorem requires only the `≤2` trace bounds:

```lean
theorem general_bounded_two_trace_normal_form
    (huC : u ∈ C) (hvC : v ∈ C) (huv : u ≠ v)
    (huKu : u ∈ K_u) (hvKv : v ∈ K_v)
    (hv_not_Ku : v ∉ K_u) (hu_not_Kv : u ∉ K_v)
    (htrace_u : (rowTrace C K_u).card ≤ 2)
    (htrace_v : (rowTrace C K_v).card ≤ 2)
    (hqJ : q ∈ jointDeletionLocus C K_u K_v)
    (hwJ : w ∈ jointDeletionLocus C K_u K_v)
    (hqw : q ≠ w)
    (hnoFresh : ¬ ∃ t,
      t ∈ jointDeletionLocus C K_u K_v ∧ t ≠ q ∧ t ≠ w)
    (hC5 : 5 ≤ C.card) :
    GeneralBoundedTwoTraceNormalForm C K_u K_v u v q w := by
  -- J={q,w}; hence J.card=2.
  -- Let a,b,i be the three trace cardinalities.
  -- Source membership and trace bounds give a,b∈{1,2}.
  -- Exact decomposition and inclusion-exclusion give C.card=a+b-i+2.
  -- `omega` leaves exactly the four profiles above.
  -- Extract companions only in branches whose trace card is two.
  ...
```

#### F3.46.5. How to eliminate the singleton profiles

There are two source-faithful possibilities.

**Preferred elimination.**  If the authoritative context already retains a point `uMate` with

```lean
uMate ∈ C
uMate ∈ K_u
uMate ≠ u
```

then `T_u.card=2` follows from source membership, mate membership, mate distinctness, and `T_u.card≤2`.  The same applies to `v`.  Add explicit projection lemmas:

```lean
theorem trace_u_card_two_of_sourceContext
    (ctx : ExactFourMutualOmissionSourceContext ...) :
    (rowTrace ctx.C ctx.K_u).card = 2

theorem trace_v_card_two_of_sourceContext
    (ctx : ExactFourMutualOmissionSourceContext ...) :
    (rowTrace ctx.C ctx.K_v).card = 2
```

These two lemmas reduce the general four-profile theorem to the exact two-profile theorem in F3.34.

**Fallback terminal treatment.**  If either companion is not part of the context, retain the corresponding singleton profile as a separate terminal constructor.  A singleton may not be dismissed merely because the canonical ambient row has four points: the other three support points may lie outside `C`.

Accordingly, replace the bounded terminal inventory in F3.38 by either:

```lean
| boundedFive : FivePointTraceNormalForm ... → F3TerminalCase S
| boundedSix  : SixPointTraceNormalForm ... → F3TerminalCase S
```

when both trace-cardinality projection lemmas are proved, or by all four general constructors when they are not.

#### F3.46.6. Closure-matrix corrections

| ID | Obligation | Status | Resolution rule |
|---|---|---|---|
| F3-N-EXACT-U | Prove `|T_u|=2` from the source context | OPEN-INTERFACE-CHECK | Close from a retained distinct companion, or keep the left-singleton terminal. |
| F3-N-EXACT-V | Prove `|T_v|=2` from the source context | OPEN-INTERFACE-CHECK | Close from a retained distinct companion, or keep the right-singleton terminal. |
| F3-N-GEN | Prove the unconditional four-profile normal form | CLOSED-PROSE | Implement cardinal profile split before specializing. |
| F3-B5L | Refute left-singleton bounded terminal if not eliminated | CONDITIONAL-OPEN | Needed only if F3-N-EXACT-U fails. |
| F3-B5R | Refute right-singleton bounded terminal if not eliminated | CONDITIONAL-OPEN | Needed only if F3-N-EXACT-V fails. |

The implementation must resolve F3-N-EXACT-U and F3-N-EXACT-V before claiming that the bounded residual has only two constructors.

<!-- F3-GENERAL-BOUNDED-PROFILE-END -->

<!-- F3-CARDINALITY-FLOOR-BEGIN -->

### F3.47. Cardinality-floor audit and the four-point guard case

The equal-blocker fresh-source theorem in F3.35 and the bounded profiles in F3.34/F3.46 use the hypothesis

\[
5\le |C|.
\]

This hypothesis must be a named projection or a named upstream theorem.  It may not be inferred from the phrase “physical class.”  Before applying those results, add the exact adapter:

```lean
theorem physicalClass_card_ge_five
    (ctx : ExactFourMutualOmissionSourceContext ...) :
    5 ≤ ctx.C.card := by
  -- cite the precise upstream certificate/cardinality theorem
  ...
```

If this theorem already exists, record its authoritative name in the F3 closure matrix.  If only `4 ≤ C.card` is available, the exhaustion branch has one additional profile.

#### F3.47.1. Four-point double-singleton profile

Under mutual omission, source membership, trace cardinalities at most two, and `J={q,w}`, the only profile with `|C|=4` is

\[
T_u=\{u\},
\qquad
T_v=\{v\},
\qquad
C=\{u,v,q,w\},
\]

with `[u,v,q,w].Nodup`.

Indeed, the exact identity

\[
|C|=|T_u|+|T_v|-|T_u\cap T_v|+2
\]

becomes

\[
2=|T_u|+|T_v|-|T_u\cap T_v|.
\]

Each trace is nonempty.  Mutual omission prevents `u` or `v` from lying in the opposite trace.  Any nonempty intersection would therefore require a companion in each trace, which would make both traces have cardinality two and the right-hand side at least three unless the traces were equal; equality of the traces is incompatible with mutual omission.  Hence the intersection is empty and both traces are singletons.

```lean
structure FourPointDoubleSingletonNormalForm
    (C K_u K_v : Finset P) (u v q w : P) where
  trace_u : rowTrace C K_u = {u}
  trace_v : rowTrace C K_v = {v}
  class_eq : C = {u, v, q, w}
  nodup : [u, v, q, w].Nodup
```

The fully unconditional bounded profile for a context with `4≤C.card` therefore has five constructors:

```lean
inductive GeneralBoundedTwoTraceNormalFormGeFour ...
  | fourDoubleSingleton : FourPointDoubleSingletonNormalForm ... → ...
  | fiveLeftSingleton  : FivePointLeftSingletonNormalForm ... → ...
  | fiveRightSingleton : FivePointRightSingletonNormalForm ... → ...
  | fiveSharedMate     : FivePointTraceNormalForm ... → ...
  | sixDisjointMates   : SixPointTraceNormalForm ... → ...
```

#### F3.47.2. Effect on the equal-blocker branch

If the common trace is exactly `{u,v}`, then both traces have cardinality two and are equal.  Mutual omission is not the appropriate trace hypothesis in this equal-blocker subbranch; the common row intentionally contains both original sources.  If `J={q,w}`, the exact decomposition gives

\[
C=\{u,v,q,w\}
\]

and hence `|C|=4`.

Therefore:

* with `5≤C.card`, exhaustion is contradictory and F3.35 supplies a fresh source;
* without `5≤C.card`, exhaustion produces an exact four-point equal-blocker terminal packet and must be consumed directly.

Define the guard packet if needed:

```lean
structure FourPointEqualBlockerTerminalInput ... where
  class_eq : C = {u, v, q, w}
  common_trace : rowTrace C K = {u, v}
  nodup : [u, v, q, w].Nodup
  -- all blocker, exact-four-support, deletion, and cap provenance from ctx
```

Do not confuse this equal-blocker four-point packet with the distinct-blocker double-singleton profile above.

#### F3.47.3. Matrix additions

| ID | Obligation | Status | Consequence |
|---|---|---|---|
| F3-CARD5 | Prove `5 ≤ ctx.C.card` from the authoritative source context | OPEN-INTERFACE-CHECK | If closed, all four-point guard terminals disappear. |
| F3-B4D | Distinct-blocker four-point double-singleton consumer | CONDITIONAL-OPEN | Required only if F3-CARD5 is unavailable. |
| F3-B4E | Equal-blocker four-point exact-common-trace consumer | CONDITIONAL-OPEN | Required only if F3-CARD5 is unavailable. |

No theorem in F3 may use `5≤C.card` until F3-CARD5 has been resolved by an explicit citation or projection.

<!-- F3-CARDINALITY-FLOOR-END -->

<!-- F3-JOINT-CAP-COVER-BEGIN -->

### F3.48. Bridge invariant: the joint locus must be covered by the measured cap

The cardinal split in F3.33 and the cap measure in F3.37 become a valid descent only after adding the following bridge invariant:

\[
\forall t\in J(u,v),\quad
 t\ne q\land t\ne w
 \Longrightarrow
 \tau(q)<\tau(t)<\tau(w). \tag{F3-cover}
\]

Equivalently,

\[
J(u,v)\subseteq\{q,w\}\cup I_C(q,w).
\]

This is the exact form in which the existing strict-cap cover result should be exposed.  A statement that merely says every relevant point is “on the cap,” without orienting it strictly between `q` and `w`, is insufficient for the Nat-valued descent.

```lean
def JointCapCover
    (C K_u K_v : Finset P) (τ : P → ℝ) (q w : P) : Prop :=
  ∀ ⦃t⦄,
    t ∈ jointDeletionLocus C K_u K_v →
    t ≠ q → t ≠ w →
    τ q < τ t ∧ τ t < τ w
```

Add this field to `F3DescentState`:

```lean
structure F3DescentState where
  ctx : ExactFourMutualOmissionSourceContext ...
  τ : P → ℝ
  hcap_qw : τ ctx.q < τ ctx.w
  jointCapCover :
    JointCapCover ctx.C ctx.K_u ctx.K_v τ ctx.q ctx.w
  cap_provenance : ...
```

#### F3.48.1. Fresh joint point gives a positive measured interval

```lean
theorem freshJoint_mem_capOpenInterval
    (S : F3DescentState ...)
    (htJ : t ∈ jointDeletionLocus S.ctx.C S.ctx.K_u S.ctx.K_v)
    (htq : t ≠ S.ctx.q)
    (htw : t ≠ S.ctx.w) :
    t ∈ capOpenInterval S.ctx.C S.τ S.ctx.q S.ctx.w := by
  have htC : t ∈ S.ctx.C :=
    (mem_jointDeletionLocus_iff.mp htJ).1
  have hbetween := S.jointCapCover htJ htq htw
  simp [capOpenInterval, htC, hbetween.1, hbetween.2]
```

Consequently, a fresh joint point implies `0 < S.measure`.

#### F3.48.2. Measure zero forces bounded exhaustion

If `S.measure=0`, then no member of the joint-deletion locus is distinct from `q,w`; otherwise F3.48.1 would put that point into the empty cap interval.  Hence

\[
J(u,v)=\{q,w\}.
\]

```lean
theorem joint_eq_pair_of_measure_eq_zero
    (S : F3DescentState ...)
    (hqJ : S.ctx.q ∈ jointDeletionLocus ...)
    (hwJ : S.ctx.w ∈ jointDeletionLocus ...)
    (hqw : S.ctx.q ≠ S.ctx.w)
    (hμ : S.measure = 0) :
    jointDeletionLocus S.ctx.C S.ctx.K_u S.ctx.K_v =
      {S.ctx.q, S.ctx.w} := by
  apply Or.resolve_left
    (exists_fresh_third_or_joint_eq_pair hqJ hwJ hqw)
  rintro ⟨t, htJ, htq, htw⟩
  have htI := freshJoint_mem_capOpenInterval S htJ htq htw
  have : 0 < S.measure := by
    -- A finset containing t has positive cardinality.
    simpa [F3DescentState.measure, Finset.card_pos] using
      (show (capOpenInterval ...).Nonempty from ⟨t, htI⟩)
  omega
```

The exact proof of positivity may use `Finset.card_pos.mpr ⟨t,htI⟩`.

This theorem supplies the base-case route of the well-founded induction: measure zero reduces automatically to one of the bounded normal forms.

#### F3.48.3. Successor states must re-establish cover

The old cover does not automatically imply the cover for a successor, because the successor generally has new source rows and therefore a new joint-deletion locus.  Every recursive continuation constructor must prove:

```lean
JointCapCover C K_u' K_v' τ q' w'
```

for the new rows and endpoints.  This is a seventh successor obligation, in addition to the six listed in F3.38.1.

The proof should normally have the form:

1. take `x` omitted by both successor rows;
2. use the constructor's survival/omission data to place `x` in the source-faithful strict-cap cover supplied by the original context;
3. exclude `x=q'` and `x=w'` by the hypotheses of `JointCapCover`;
4. derive the two strict parameter inequalities.

If the current seven-way or nine-way constructor does not retain the cover alternative used in step 2, strengthen the producer.  A successor carrying only row omissions but no cap-location theorem does not inhabit `F3DescentState`.

#### F3.48.4. Exact one-step normal form

With the bridge invariant, the one-step theorem can be organized without an ad hoc base case:

```lean
theorem f3_oneStep (S : F3DescentState ...) : F3OneStep S := by
  by_cases hfresh : ∃ t,
      t ∈ jointDeletionLocus S.ctx.C S.ctx.K_u S.ctx.K_v ∧
      t ≠ S.ctx.q ∧ t ≠ S.ctx.w
  · obtain ⟨t, htJ, htq, htw⟩ := hfresh
    have htBetween := S.jointCapCover htJ htq htw
    -- Invoke equal/distinct branch producer with t and map its constructor
    -- to terminal or a successor using one endpoint t.
    ...
  · have hpair : jointDeletionLocus ... = {S.ctx.q, S.ctx.w} :=
      Or.resolve_left
        (exists_fresh_third_or_joint_eq_pair S.ctx.hqJ S.ctx.hwJ S.ctx.hqw)
        hfresh
    -- Invoke the cardinality-floor theorem and the general bounded profile.
    -- Return the corresponding terminal constructor.
    ...
```

This ordering is preferable to branching first on blocker equality.  It separates the universal finite-set dichotomy from the geometric equal/distinct dispatch and guarantees that every recursive branch starts with an explicitly interior fresh point.

#### F3.48.5. Matrix additions

| ID | Obligation | Status | Blocking effect |
|---|---|---|---|
| F3-COV0 | Expose strict-cap cover in the exact `JointCapCover` form | SUPERSEDED-OPEN | Missing invariant in the rejected recursive interface. |
| F3-COV1 | Prove fresh joint point lies in `capOpenInterval` | SUPERSEDED-CONDITIONAL | Only meaningful after F3-COV0. |
| F3-COV2 | Prove measure-zero joint exhaustion | SUPERSEDED-CONDITIONAL | Only meaningful after F3-COV0 and F3-J3. |
| F3-COV3 | Re-establish `JointCapCover` for every successor | SUPERSEDED-OPEN | No source packet supplies this transport. |

The F3 closure matrix must not mark a survival constructor as descending until both the strict measure inequality and F3-COV3 are proved.

<!-- F3-JOINT-CAP-COVER-END -->

<!-- F3-ORIENTED-WINDOW-BEGIN -->

### F3.49. Ordered deletion windows and safe endpoint reversal

The notation `q,w` in the source context may encode asymmetric provenance: one point may come from the first deletion and the other from the second, or their survival fields may be stored in different directions.  The strict-cap measure, however, needs an **ordered geometric window**.  Do not identify these two roles implicitly.

Introduce a view saying that a point is admissible as one endpoint of the current deletion window.  Its fields must be projections of the actual deletion/survival predicates in the authoritative context.

```lean
structure F3DeletionEndpoint
    (ctx : ExactFourMutualOmissionSourceContext ...) where
  point : P
  memC : point ∈ ctx.C
  omitted_u : point ∉ ctx.K_u
  omitted_v : point ∉ ctx.K_v
  deletionProvenance : IsRetainedDeletionWitness ctx point
```

If there is no single existing predicate `IsRetainedDeletionWitness`, define the view with the literal first-/second-deletion alternatives and prove adapters from both source witnesses.

An ordered window is:

```lean
structure F3DeletionWindow
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (τ : P → ℝ) where
  left right : F3DeletionEndpoint ctx
  ne : left.point ≠ right.point
  lt : τ left.point < τ right.point
```

The descent state should use this window:

```lean
structure F3DescentState where
  ctx : ExactFourMutualOmissionSourceContext ...
  τ : P → ℝ
  window : F3DeletionWindow ctx τ
  jointCapCover :
    ∀ ⦃t⦄,
      t ∈ jointDeletionLocus ctx.C ctx.K_u ctx.K_v →
      t ≠ window.left.point →
      t ≠ window.right.point →
      τ window.left.point < τ t ∧ τ t < τ window.right.point
  cap_provenance : ...
```

Then

```lean
def F3DescentState.measure (S : F3DescentState ...) : Nat :=
  capSpan S.ctx.C S.τ S.window.left.point S.window.right.point
```

The original `q,w` produce the entry window after orienting their cap parameters.  There are two legitimate constructions:

```lean
def entryWindow_qw (h : τ ctx.q < τ ctx.w) : F3DeletionWindow ctx τ := ...

def entryWindow_wq (h : τ ctx.w < τ ctx.q) : F3DeletionWindow ctx τ := ...
```

If parameter equality is possible, it must be excluded by a theorem using `q≠w` and injectivity of the strict-cap parameter.  The entry theorem should split `lt_or_gt_of_ne` only after proving `τ q ≠ τ w`.

#### F3.49.1. Endpoint constructors for a fresh interior point

For `t` in the joint locus, construct its endpoint view from the joint-locus membership and the retained-deletion theorem supplied by the branch.  Joint omission alone proves only membership in `C` and omission from the two rows; it does **not** prove deletion provenance.

```lean
def freshEndpoint
    (S : F3DescentState ...)
    (htJ : t ∈ jointDeletionLocus S.ctx.C S.ctx.K_u S.ctx.K_v)
    (htDel : IsRetainedDeletionWitness S.ctx t) :
    F3DeletionEndpoint S.ctx := ...
```

The two smaller windows are then:

```lean
def leftSubwindow
    (S : F3DescentState ...)
    (tEnd : F3DeletionEndpoint S.ctx)
    (h₁ : S.τ S.window.left.point < S.τ tEnd.point)
    (h₂ : S.τ tEnd.point < S.τ S.window.right.point) :
    F3DeletionWindow S.ctx S.τ :=
  { left := S.window.left, right := tEnd,
    ne := fun h => lt_irrefl _ (h ▸ h₁), lt := h₁ }

def rightSubwindow ... :=
  { left := tEnd, right := S.window.right, ... }
```

The measure decrease is exactly F3-M1.

#### F3.49.2. When the source context itself must change

A smaller window over the same `ctx` is not always a valid recursive F3 state.  If the continuation changes the source pair or canonical rows, construct `ctx'` first and then build endpoint views for `ctx'`.  The old endpoint records cannot be reused by type coercion because their omission and deletion proofs are indexed by `ctx`.

For each recursive constructor, the correct order is:

1. construct `ctx'` with its new source pair and canonical rows;
2. prove that the selected old endpoint and the interior point are retained deletion witnesses for `ctx'`;
3. build `F3DeletionEndpoint ctx'` values;
4. orient them using the inherited strict inequalities;
5. prove the new joint-cap cover;
6. apply the generic cap-span shrink theorem, whose set `C` and parameter `τ` are unchanged.

This order prevents a common dependent-type error in which a proof about omission from `ctx.K_u` is reused as if it concerned `ctx'.K_u`.

#### F3.49.3. Safe swap theorem

If the underlying terminal or continuation theorem is symmetric in its two deletion witnesses, prove symmetry once:

```lean
def swapDeletionRoles
    (ctx : ExactFourMutualOmissionSourceContext ...) :
    ExactFourMutualOmissionSourceContext ... := ...
```

and prove projection lemmas showing exactly which source, blocker, row, radius, support, and deletion fields are exchanged.  The theorem must be definitional or proved field by field.  A bare `simpa [and_comm]` is not an acceptable replacement if the structure stores independently chosen witnesses.

If the context is not symmetric, do not define `swapDeletionRoles`.  Retain separate left- and right-oriented continuation constructors instead.

#### F3.49.4. Revised constructor worksheet fields

Every recursive constructor row in F3.40 must now record:

```text
old source context: ctx
new source context: ctx'
old ordered window: (left,right)
new ordered window: (left',right')
endpoint-provenance theorem for left': ...
endpoint-provenance theorem for right': ...
new joint-cap cover theorem: ...
strict parameter inequalities: ...
cap-span shrink theorem: ...
```

A branch is not closed merely because the two new endpoint points are named.  Their context-indexed deletion provenance is part of the proof.

#### F3.49.5. Matrix additions

| ID | Obligation | Status | Next action |
|---|---|---|---|
| F3-WIN0 | Define endpoint and ordered-window views | MECHANICAL-LEAN | Project literal deletion predicates from the source context. |
| F3-WIN1 | Build and orient the entry `q/w` window | OPEN-INTERFACE-CHECK | Prove parameter inequality from cap injectivity/order data. |
| F3-WIN2 | Build fresh-point endpoint views | OPEN-BRANCH | Requires branch theorem giving retained-deletion provenance, not just joint omission. |
| F3-WIN3 | Prove source-context swap or retain asymmetric constructors | OPEN-INTERFACE-CHECK | Audit whether all independently chosen fields are genuinely symmetric. |
| F3-WIN4 | Transport old endpoints into each successor context | OPEN-BRANCH | Prove context-indexed omission and deletion fields constructor by constructor. |

<!-- F3-ORIENTED-WINDOW-END -->

<!-- F3-JOINT-WITNESS-PAIR-BEGIN -->

### F3.50. Joint-witness audit: `q,w` must both lie in the joint locus

Every theorem in F3.33–F3.49 that uses `q,w` as the distinguished pair assumes

\[
q,w\in J(u,v)=C\setminus(T_u\cup T_v).
\]

Expanded pointwise, the required facts are

```text
q ∈ C,  q ∉ K_u,  q ∉ K_v,
w ∈ C,  w ∉ K_u,  w ∉ K_v,
q ≠ w.
```

A proof that deleting `q` preserves only `K_u`, together with a proof that deleting `w` preserves only `K_v`, does not establish this contract.  The two cross-omission facts are essential.

Package the exact prerequisite:

```lean
structure JointDeletionWitnessPair
    (C K_u K_v : Finset P) where
  q w : P
  q_mem : q ∈ jointDeletionLocus C K_u K_v
  w_mem : w ∈ jointDeletionLocus C K_u K_v
  ne : q ≠ w
```

The authoritative source-context adapter is:

```lean
def ExactFourMutualOmissionSourceContext.toJointDeletionWitnessPair
    (ctx : ExactFourMutualOmissionSourceContext ...) :
    JointDeletionWitnessPair ctx.C ctx.K_u ctx.K_v := by
  refine
    { q := ctx.q
      w := ctx.w
      q_mem := ?_
      w_mem := ?_
      ne := ctx.q_ne_w }
  · exact mem_jointDeletionLocus_iff.mpr
      ⟨ctx.q_mem_C, ctx.q_not_K_u, ctx.q_not_K_v⟩
  · exact mem_jointDeletionLocus_iff.mpr
      ⟨ctx.w_mem_C, ctx.w_not_K_u, ctx.w_not_K_v⟩
```

The field names are schematic; each proof must cite the actual source theorem.

#### F3.50.1. If the cross omissions are not stored

There are only three legitimate repairs.

1. **Recover them from row preservation.**  If an exact row survives deletion of a point, prove that the deleted point was not in its exact support and then transport the canonical-row identity.  This is the preferred repair when the current code already has deletion-survival witnesses.
2. **Strengthen the source producer.**  Choose `q,w` from the joint complement at the point where the exact rows are both in scope, and store all six pointwise facts in `ExactFourMutualOmissionSourceContext`.
3. **Prove a new pair-existence theorem.**  Use the cardinal lower bound to choose two distinct points of `J`.  This requires `2≤J.card`, which follows from `6≤C.card` and the trace-union bound but not from `5≤C.card` alone.

Do not use the original `q,w` in the joint-locus theorem if only asymmetric omissions are known.

#### F3.50.2. Pair existence from cardinality

The generic fallback theorem is:

```lean
theorem exists_jointDeletionWitnessPair_of_card
    (hC6 : 6 ≤ C.card)
    (hu : (rowTrace C K_u).card ≤ 2)
    (hv : (rowTrace C K_v).card ≤ 2) :
    Nonempty (JointDeletionWitnessPair C K_u K_v) := by
  have hJ2 : 2 ≤ (jointDeletionLocus C K_u K_v).card := by
    have hbound := card_physicalClass_le_joint_add_four
      (C := C) (K_u := K_u) (K_v := K_v) hu hv
    omega
  -- Extract two distinct elements of J from hJ2.
  ...
```

This newly selected pair does not automatically inherit the deletion provenance or strict-cap endpoint roles of the original `q,w`.  If those are needed, the producer must prove them.  Cardinal selection alone supplies only joint membership and distinctness.

#### F3.50.3. Row-survival-to-omission adapter

For an exact support finset `K`, deletion of `x` should be represented by `K.erase x` or by intersection with the deleted ambient carrier.  The reusable implication is:

> If the same exact support `K` is a subset of the carrier after deletion of `x`, then `x∉K`.

A typical finset contract is:

```lean
theorem not_mem_of_subset_erase
    (hK : K ⊆ A.erase x) : x ∉ K := by
  intro hx
  have := hK hx
  simpa using this
```

If row survival is stored as equality after restricting the carrier, first rewrite the equality to a subset statement and then apply this lemma.  This is how a deletion-survival witness should produce the needed cross omission.

#### F3.50.4. Matrix additions

| ID | Obligation | Status | Failure mode if omitted |
|---|---|---|---|
| F3-JW0 | Prove `q∈J` | OPEN-INTERFACE-CHECK | Fresh/exhaustion split cannot use `q`. |
| F3-JW1 | Prove `w∈J` | OPEN-INTERFACE-CHECK | Fresh/exhaustion split cannot use `w`. |
| F3-JW2 | Prove `q≠w` | expected existing | Pair cardinality may be one. |
| F3-JW3 | Construct `JointDeletionWitnessPair` from `ctx` | BLOCKED by F3-JW0/1/2 | All joint-locus terminal statements remain unavailable. |
| F3-JW4 | Recover cross omissions from row survival if absent | MECHANICAL/LOCAL | Use `not_mem_of_subset_erase`; no geometry required. |

The first executable task in the live source is to resolve F3-JW0–F3-JW2 by exact theorem names.

<!-- F3-JOINT-WITNESS-PAIR-END -->

<!-- F3-TRACE-BOUND-GEOMETRY-BEGIN -->

### F3.51. Geometric prerequisites for the two-point trace bound

The finite-set inequality

\[
|C\cap K_u|\le2
\]

is not a purely combinatorial property of an exact-four row.  It comes from intersecting two distinct Euclidean circles: the physical class centered at the physical apex `a`, and the canonical row centered at the blocker `b_u`.  The proof must expose the hypotheses under which the circle-intersection theorem applies.

A source-faithful trace-bound adapter has the following conceptual inputs:

```text
C = ambient ∩ sphere(a, R)
K_u = ambient ∩ sphere(b_u, r_u)
b_u ≠ a
```

and output:

```lean
(rowTrace C K_u).card ≤ 2
```

The radius witnesses `R` and `r_u` remain independent.  Distinct centers are enough: two circles with different centers have at most two common points, regardless of whether their radii agree.

#### F3.51.1. Blocker–apex equality must be split first

Before invoking the trace bound, perform

```lean
by_cases hba : ctx.blocker_u = ctx.physicalApex
```

If equality is already impossible from source/blocker typing or a no-self-center theorem, discharge it immediately.  Otherwise analyze it explicitly.  Since the source `u` lies in both the physical class and its blocker row, equal centers force equality of the two radii:

\[
\operatorname{dist}(a,u)=R,
\qquad
\operatorname{dist}(b_u,u)=r_u,
\qquad
b_u=a
\Longrightarrow R=r_u.
\]

After rewriting the centers and radii, the two circle predicates coincide.  Thus either:

* the canonical row trace is the whole physical class, contradicting an exact-four or omission field; or
* blocker–apex equality is one of the literal collision terminals already present in the F3 dispatcher.

Do not continue to the `≤2` theorem in this equality branch.

The same split is required for `b_v`.

#### F3.51.2. Exact trace-bound theorem contract

Use a theorem whose statement makes ambient restriction explicit.  Schematically:

```lean
theorem physicalClass_inter_canonicalRow_card_le_two
    (ha_ne_b : a ≠ b)
    (hC : C = A.filter fun x => dist a x = R)
    (hK : K = A.filter fun x => dist b x = r) :
    (C ∩ K).card ≤ 2 := by
  -- Map the finite intersection into the geometric intersection of two
  -- circles and invoke the existing two-circle theorem.
  ...
```

If the repository theorem is stated for `Set`s, use `Finset.coe_subset` and a finite-cardinality transfer lemma.  Do not re-prove circle intersection algebra in F3.

#### F3.51.3. Canonical-row extensionality is a separate theorem

Equality of blockers does not by itself imply equality of canonical support finsets if the rows were chosen with independent radius/support witnesses.  The equal-blocker branch needs the authoritative canonical-row uniqueness theorem:

```lean
theorem canonicalRow_eq_of_blocker_eq
    (h : ctx.blocker_u = ctx.blocker_v) :
    ctx.K_u = ctx.K_v
```

Its proof must use the unique-four certificate or the exact canonical-choice theorem.  It may not infer equality from center equality alone: concentric circles of different radii are different rows.

Conversely, distinct blockers imply distinct circle centers, but not automatically distinct support finsets.  If a later proof needs `K_u≠K_v`, prove it from source membership plus mutual omission, for example:

```lean
intro hrows
exact ctx.v_not_K_u (hrows ▸ ctx.v_mem_K_v)
```

This proof is combinatorial and stronger than appealing to centers.

#### F3.51.4. Trace-cardinality projection API

The context view should expose four separate facts:

```lean
blocker_u_ne_physicalApex : ctx.blocker_u ≠ ctx.physicalApex
blocker_v_ne_physicalApex : ctx.blocker_v ≠ ctx.physicalApex
trace_u_card_le_two : (rowTrace ctx.C ctx.K_u).card ≤ 2
trace_v_card_le_two : (rowTrace ctx.C ctx.K_v).card ≤ 2
```

The last two should be derived lemmas, not stored proof fields, unless computation cost makes that impractical.  Keeping the center inequalities public makes the geometric provenance auditable.

#### F3.51.5. Matrix additions

| ID | Obligation | Status | Required before |
|---|---|---|---|
| F3-GT0 | Prove blocker `u` differs from physical apex or route equality to terminal | OPEN-INTERFACE/BRANCH | F3-J2, all bounded normal forms |
| F3-GT1 | Prove blocker `v` differs from physical apex or route equality to terminal | OPEN-INTERFACE/BRANCH | F3-J2, all bounded normal forms |
| F3-GT2 | Adapt the repository two-circle theorem to finite row traces | expected existing/mechanical | F3-J2 |
| F3-GT3 | Prove equal blockers give equal canonical rows by canonical uniqueness | expected existing | equal-blocker B1 |
| F3-GT4 | Prove distinct-branch row finsets differ from mutual omission | CLOSED-PROSE | any row-inequality consumer |

No cardinality theorem in the joint-locus calculus may be applied until F3-GT0–F3-GT2 are in scope.

<!-- F3-TRACE-BOUND-GEOMETRY-END -->

<!-- F3-EXACT-TRACE-PAIR-BEGIN -->

### F3.52. Exact trace pairs from two named members

The repeated finite-set step in both blocker branches is:

> A finset of cardinality at most two that contains two distinct named points is exactly the pair of those points.

Prove it once.

```lean
theorem eq_pair_of_mem_mem_card_le_two
    (hx : x ∈ S) (hy : y ∈ S) (hxy : x ≠ y)
    (hcard : S.card ≤ 2) :
    S = {x, y} := by
  classical
  apply Finset.Subset.antisymm
  · intro z hz
    by_contra hzpair
    have hzx : z ≠ x := by
      intro h
      apply hzpair
      simp [h]
    have hzy : z ≠ y := by
      intro h
      apply hzpair
      simp [h]
    have hthree : ({x, y, z} : Finset P) ⊆ S := by
      intro t ht
      simp only [Finset.mem_insert, Finset.mem_singleton] at ht
      rcases ht with rfl | rfl | rfl
      · exact hx
      · exact hy
      · exact hz
    have hpairwise : ({x, y, z} : Finset P).card = 3 := by
      simp [hxy, hzx, hzy]
    have := Finset.card_le_card hthree
    omega
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hx
    · exact hy
```

The first half can also be implemented by proving `{x,y}⊆S`, comparing cardinalities, and applying `Finset.eq_of_subset_of_card_le`; use whichever Mathlib API is clearest.  The public theorem should have the exact contract above.

A companion corollary is:

```lean
theorem card_eq_two_of_mem_mem_card_le_two
    (hx : x ∈ S) (hy : y ∈ S) (hxy : x ≠ y)
    (hcard : S.card ≤ 2) :
    S.card = 2 := by
  rw [eq_pair_of_mem_mem_card_le_two hx hy hxy hcard]
  simp [hxy]
```

#### F3.52.1. Equal-blocker common trace, fully reduced

Assume:

* `b_u=b_v`;
* canonical uniqueness gives `K_u=K_v=:K`;
* `u∈C∩K_u` and `v∈C∩K_v`;
* `u≠v`;
* the physical apex differs from the common blocker, so `|C∩K|≤2`.

After rewriting `K_u=K_v`, both sources lie in `rowTrace C K`.  Therefore F3.52 gives

\[
C\cap K=\{u,v\}.
\]

The exact theorem should be assembled from existing context projections:

```lean
theorem equalBlocker_commonTrace_eq_pair
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (hblock : ctx.blocker_u = ctx.blocker_v) :
    rowTrace ctx.C ctx.K_u = {ctx.u, ctx.v} := by
  have hrows : ctx.K_u = ctx.K_v :=
    canonicalRow_eq_of_blocker_eq ctx hblock
  have hu : ctx.u ∈ rowTrace ctx.C ctx.K_u := by
    simp [rowTrace, ctx.u_mem_C, ctx.u_mem_K_u]
  have hv : ctx.v ∈ rowTrace ctx.C ctx.K_u := by
    have hv' : ctx.v ∈ rowTrace ctx.C ctx.K_v := by
      simp [rowTrace, ctx.v_mem_C, ctx.v_mem_K_v]
    simpa [hrows] using hv'
  exact eq_pair_of_mem_mem_card_le_two
    hu hv ctx.u_ne_v (trace_u_card_le_two ctx)
```

This proof makes clear that equal blockers alone are insufficient: the canonical-row equality theorem is an explicit dependency.

#### F3.52.2. Exact trace cards from retained companions

Suppose the source context retains a companion `u⁺` satisfying

```text
u⁺ ∈ C,
u⁺ ∈ K_u,
u⁺ ≠ u.
```

Then

```lean
theorem trace_u_eq_source_companion
    (ctx : ExactFourMutualOmissionSourceContext ...) :
    rowTrace ctx.C ctx.K_u = {ctx.u, ctx.uCompanion} := by
  apply eq_pair_of_mem_mem_card_le_two
  · exact ⟨ctx.u_mem_C, ctx.u_mem_K_u⟩
  · exact ⟨ctx.uCompanion_mem_C, ctx.uCompanion_mem_K_u⟩
  · exact ctx.u_ne_uCompanion
  · exact trace_u_card_le_two ctx
```

and the cardinality-two projection follows immediately.  Repeat symmetrically for `v` if a distinct companion for `v` is actually retained.

If the context contains only one companion source shared across a later continuation, do not manufacture the second exact trace.  Use the general profile from F3.46.

#### F3.52.3. Exact common trace gives the equal-branch fresh-source theorem

Combining F3.52.1 with the exact joint decomposition yields:

```lean
theorem equalBlocker_freshJointSource
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (hblock : ctx.blocker_u = ctx.blocker_v)
    (hpair : JointDeletionWitnessPair ctx.C ctx.K_u ctx.K_v)
    (hC5 : 5 ≤ ctx.C.card) :
    ∃ t,
      t ∈ jointDeletionLocus ctx.C ctx.K_u ctx.K_v ∧
      t ≠ hpair.q ∧ t ≠ hpair.w := by
  have htrace := equalBlocker_commonTrace_eq_pair ctx hblock
  -- Rewrite K_v to K_u, apply fresh-or-pair, and contradict C.card≥5
  -- in the pair-exhaustion branch using the exact decomposition.
  ...
```

At this point the equal-blocker finite combinatorics are completely reduced to four explicit upstream projections:

1. canonical-row equality from blocker equality;
2. blocker distinct from physical apex;
3. the joint deletion witness pair;
4. `5≤C.card`.

No additional Euclidean argument is needed until the fresh source is converted into a successor or terminal packet.

#### F3.52.4. Matrix updates

| ID | Obligation | Status | Effect |
|---|---|---|---|
| F3-FIN-PAIR | Prove `eq_pair_of_mem_mem_card_le_two` | CLOSED-PROSE | Reused by equal common trace and companion traces. |
| F3-E0 | Derive equal-blocker common trace `{u,v}` | CLOSED-PROSE modulo GT0/GT2/GT3 | No longer a separate geometric leaf. |
| F3-N-EXACT-U | Derive exact `u` trace from retained companion | CLOSED-PROSE if companion fields exist | Eliminates left-singleton profile. |
| F3-N-EXACT-V | Derive exact `v` trace from retained companion | CLOSED-PROSE if companion fields exist | Eliminates right-singleton profile. |

<!-- F3-EXACT-TRACE-PAIR-END -->

<!-- F3-DEPENDENT-API-BEGIN -->

### F3.53. Dependent packet API: preserve witnesses definitionally

The remaining F3 consumers should be indexed by the exact source context that produced them.  Passing an unindexed disjunction of equalities and omissions forces the consumer to reconstruct canonical rows, radii, supports, deletion witnesses, and cap provenance.  That reconstruction is both unnecessary and unsafe.

#### F3.53.1. Equal-blocker continuation

Use a context-indexed inductive:

```lean
inductive EqualBlockerContinuation
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (hblock : ctx.blocker_u = ctx.blocker_v) : Type
  | collision₁ (h : ...) : EqualBlockerContinuation ctx hblock
  | collision₂ (h : ...) : EqualBlockerContinuation ctx hblock
  | supportCase₁ (data : ...) : EqualBlockerContinuation ctx hblock
  -- continue with the exact nine live constructors
```

The producer has type

```lean
theorem produceEqualBlockerContinuation
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (hblock : ctx.blocker_u = ctx.blocker_v)
    (fresh : FreshJointInteriorSource ctx ...) :
    EqualBlockerContinuation ctx hblock := by
  ...
```

and the consumer keeps all three inputs:

```lean
theorem consumeEqualBlockerContinuation
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (hblock : ctx.blocker_u = ctx.blocker_v)
    (fresh : FreshJointInteriorSource ctx ...)
    (k : EqualBlockerContinuation ctx hblock) :
    F3OneStep (stateOf ctx ...) := by
  cases k with
  | collision₁ h => ...
  | collision₂ h => ...
  | supportCase₁ data => ...
```

Do not define the consumer as `EqualBlockerContinuation ... → False`; most support constructors should produce a smaller state, not an immediate contradiction.

#### F3.53.2. Distinct-blocker continuation

Similarly:

```lean
inductive DistinctBlockerContinuation
    (ctx : ExactFourMutualOmissionSourceContext ...)
    (hblock : ctx.blocker_u ≠ ctx.blocker_v) : Type
  | collision₁ (h : ...) : DistinctBlockerContinuation ctx hblock
  | collision₂ (h : ...) : DistinctBlockerContinuation ctx hblock
  | collision₃ (h : ...) : DistinctBlockerContinuation ctx hblock
  | survival₁ (data : ...) : DistinctBlockerContinuation ctx hblock
  | survival₂ (data : ...) : DistinctBlockerContinuation ctx hblock
  | survival₃ (data : ...) : DistinctBlockerContinuation ctx hblock
  | survival₄ (data : ...) : DistinctBlockerContinuation ctx hblock
```

Use the exact existing constructor names and fields.  If the live type is already dependent in this way, keep it and change only the terminal theorem signatures.

#### F3.53.3. Existentially packaged entry point

When a caller should not name all indices, package them with a dependent sum:

```lean
structure F3EntryPacket where
  ctx : ExactFourMutualOmissionSourceContext ...
  τ : P → ℝ
  window : F3DeletionWindow ctx τ
  cover : JointCapCover
    ctx.C ctx.K_u ctx.K_v τ window.left.point window.right.point
  cap_provenance : ...
```

For a branch-selected successor whose context is not definitionally known to the caller, use

```lean
{ S' : F3DescentState ... // S'.measure < S.measure }
```

rather than returning the context, endpoint points, and decrease proof as unrelated existentials.

#### F3.53.4. Rewrite discipline

The low-level implementation should follow these rules.

1. **Do not `subst` a blocker equality through the entire context.**  First obtain canonical-row equality with the authoritative uniqueness theorem, then rewrite only the row expressions that need it.
2. **Do not unfold canonical choice definitions in terminal consumers.**  Use public projection theorems and extensional equality.
3. **Do not use `choose` to recover a radius or exact support already stored in `ctx`.**  Project it.
4. **Do not use proof irrelevance to identify data-bearing subtypes.**  Proof irrelevance identifies proof fields, not independently chosen radius values or support finsets.
5. **Normalize finite-set equalities by extensionality.**  Avoid long `rw` chains through nested `Finset.insert` terms.
6. **Keep branch equalities in named hypotheses.**  A constructor field such as `blocker_u = source_v` is provenance needed by later collision lemmas; do not immediately rewrite it away.

#### F3.53.5. Compatibility wrapper for the existing detached API

If changing all upstream producers at once is disruptive, add a temporary wrapper:

```lean
structure ContextualizedOldContinuation where
  ctx : ExactFourMutualOmissionSourceContext ...
  branchProof : ctx.blocker_u = ctx.blocker_v  -- or ≠
  oldPacket : OldContinuationType ...
  packet_provenance : OldPacketWasProducedFrom ctx oldPacket
```

This wrapper is acceptable only if `packet_provenance` contains enough equalities to recover every old packet field from `ctx`.  Prefer replacing the old type directly; a weak proposition saying merely that the packet “corresponds” to the context does not solve the provenance problem.

#### F3.53.6. Matrix additions

| ID | Obligation | Status | Completion test |
|---|---|---|---|
| F3-API0 | Index equal continuation by `ctx` and blocker equality | INTERFACE-REFACTOR | Consumer pattern match retains every source-context projection. |
| F3-API1 | Index distinct continuation by `ctx` and blocker inequality | INTERFACE-REFACTOR | Four survival branches can build successor contexts without new choices. |
| F3-API2 | Package successors as subtype of smaller states | MECHANICAL-LEAN | No parallel existential fields. |
| F3-API3 | Remove detached terminal signatures | INTERFACE-REFACTOR | No hardest theorem receives only blockers/supports and omits `ctx`. |
| F3-API4 | Audit all `choose`, `Classical.choose`, and fresh radius/support definitions in F3 consumers | OPEN-AUDIT | Every data choice is either projected or justified by canonical uniqueness. |

<!-- F3-DEPENDENT-API-END -->

<!-- F3-AUTHORITATIVE-CLOSURE-MATRIX-BEGIN -->

### F3.54. Superseded closure matrix for the second F3 pass

This matrix superseded the preliminary matrix in F3.42 and the incremental
tables in F3.46--F3.53. It is retained as development provenance. The active
authority is the third-pass F3.55--F3.73 correction summarized in
Section 16.5.I32; in particular, `F3-COV-*`, `F3-STATE-*`, `F3-STEP`,
`F3-TERM`, and `F3-WF` are not current closure tasks unless the missing
joint-cover and successor-provenance theorems are supplied.

Status meanings:

* **PROSE-CLOSED** — complete mathematical argument is written and can be transcribed mechanically.
* **VERIFY-EXISTING** — the needed theorem or field is expected in the current source context, but its exact public declaration must be identified.
* **LEAN-REFRACTOR** — no new mathematics; dependent data must be threaded through declarations.
* **BRANCH-OPEN** — constructor-specific Euclidean or deletion reconstruction remains.
* **BOUNDED-OPEN** — an exact four-, five-, or six-point terminal consumer remains.
* **CONDITIONAL** — required only if the listed stronger source projection is unavailable.
* **BLOCKED** — cannot be attempted soundly until dependencies close.

| ID | Exact obligation | Status | Depends on | Completion witness / next action |
|---|---|---|---|---|
| F3-BASE-0 | Identify the three live F3 placeholders and exact theorem signatures | VERIFY-EXISTING | live `TwoDeletionCollision.lean` | Use F3.45 source audit; record exact names and lines here. |
| F3-API-0 | Hard consumers receive full `ExactFourMutualOmissionSourceContext` | LEAN-REFRACTOR | none | Remove detached terminal signatures; retain `ctx` through pattern matches. |
| F3-API-1 | Equal continuation indexed by `ctx` and blocker equality | LEAN-REFRACTOR | F3-API-0 | Existing nine constructors remain definitionally tied to producer context. |
| F3-API-2 | Distinct continuation indexed by `ctx` and blocker inequality | LEAN-REFRACTOR | F3-API-0 | Existing seven constructors remain definitionally tied to producer context. |
| F3-API-3 | Successor returned as `{S' // measure S' < measure S}` | PROSE-CLOSED / mechanical Lean | state definition | No parallel existential witness bundle. |
| F3-GEO-0 | `blocker_u ≠ physicalApex`, or equality routed to explicit terminal | VERIFY-EXISTING / BRANCH-OPEN | source typing/collision lemmas | Exact theorem name or new equality split. |
| F3-GEO-1 | `blocker_v ≠ physicalApex`, or equality routed to explicit terminal | VERIFY-EXISTING / BRANCH-OPEN | source typing/collision lemmas | Exact theorem name or new equality split. |
| F3-GEO-2 | Finite two-circle adapter gives `|C∩K_u|≤2` | VERIFY-EXISTING / mechanical | F3-GEO-0 | Cite public two-circle theorem; no local algebra. |
| F3-GEO-3 | Finite two-circle adapter gives `|C∩K_v|≤2` | VERIFY-EXISTING / mechanical | F3-GEO-1 | Symmetric adapter. |
| F3-GEO-4 | Equal blockers imply equal canonical rows | VERIFY-EXISTING | canonical unique-four choice | Cite authoritative uniqueness theorem; center equality alone is insufficient. |
| F3-CARD-0 | Prove `5 ≤ C.card` from authoritative context | VERIFY-EXISTING | upstream certificate/cardinality theorem | Record exact projection. If unavailable, retain four-point terminals. |
| F3-JW-0 | Prove original `q ∈ C`, `q∉K_u`, `q∉K_v` | VERIFY-EXISTING / local | deletion-survival fields | Recover cross omission via support subset of erased carrier if needed. |
| F3-JW-1 | Prove original `w ∈ C`, `w∉K_u`, `w∉K_v` | VERIFY-EXISTING / local | deletion-survival fields | Symmetric recovery. |
| F3-JW-2 | Prove `q≠w` | VERIFY-EXISTING | source context | Exact projection. |
| F3-JW-3 | Build `JointDeletionWitnessPair` | PROSE-CLOSED / mechanical Lean | F3-JW-0/1/2 | Constructor with two joint-membership proofs. |
| F3-J-0 | Define `rowTrace` and `jointDeletionLocus` inside `C` | PROSE-CLOSED | none | Definitions and simp membership theorem in F3.32. |
| F3-J-1 | Exact decomposition `C=(T_u∪T_v) ⊔ J` | PROSE-CLOSED | F3-J-0 | Extensionality, disjointness, exact card identity. |
| F3-J-2 | Bound `C.card ≤ J.card+4` | PROSE-CLOSED | F3-J-1, F3-GEO-2/3 | `card_union_le` plus `omega`. |
| F3-J-3 | Fresh third or `J={q,w}` | PROSE-CLOSED | F3-JW-3 | Pointwise by-cases theorem in F3.33.3. |
| F3-J-4 | `7≤C.card` forces fresh third | PROSE-CLOSED | F3-J-2/3 | Pure arithmetic. |
| F3-FIN-0 | A ≤2 finset containing distinct `x,y` equals `{x,y}` | PROSE-CLOSED | none | Helper F3.52. |
| F3-E-TRACE | Equal-blocker common trace is `{u,v}` | PROSE-CLOSED modulo adapters | F3-GEO-2/4, source memberships, F3-FIN-0 | Implement theorem F3.52.1. |
| F3-N-EXACT-U | Prove `|T_u|=2` from a retained distinct companion | VERIFY-EXISTING / conditional | F3-GEO-2, companion fields | If unavailable, retain left-singleton profile. |
| F3-N-EXACT-V | Prove `|T_v|=2` from a retained distinct companion | VERIFY-EXISTING / conditional | F3-GEO-3, companion fields | If unavailable, retain right-singleton profile. |
| F3-N-GEN | General bounded profile with trace cards ≤2 | PROSE-CLOSED | F3-J-1/3, F3-CARD-0 or `4≤C.card` | Four profiles for card≥5; add double-singleton at card4. |
| F3-N-2 | Exact-two specialization: shared-mate five or disjoint-mate six | PROSE-CLOSED | F3-N-GEN, F3-N-EXACT-U/V | Structures and balance law in F3.34. |
| F3-B4D | Distinct four-point double-singleton contradiction | CONDITIONAL / BOUNDED-OPEN | failure of F3-CARD-0 | Direct finite terminal consumer. |
| F3-B4E | Equal four-point common-trace contradiction | CONDITIONAL / BOUNDED-OPEN | failure of F3-CARD-0 | Direct equal-blocker terminal consumer. |
| F3-B5L | Five-point left-singleton contradiction | CONDITIONAL / BOUNDED-OPEN | failure of F3-N-EXACT-U | Direct terminal or upstream adapter. |
| F3-B5R | Five-point right-singleton contradiction | CONDITIONAL / BOUNDED-OPEN | failure of F3-N-EXACT-V | Direct terminal or upstream adapter. |
| F3-B5S | Five-point shared-mate contradiction | BOUNDED-OPEN | exact normal form + full ctx | Audit adapter to F1 TriApex; otherwise direct finite geometry. |
| F3-B6 | Six-point disjoint-mate contradiction | BOUNDED-OPEN | exact normal form + full ctx | Audit adapter to F2 FreshThird; otherwise direct finite geometry. |
| F3-CAP-0 | Expose cap parameter/order and endpoint inequality | VERIFY-EXISTING | strict-cap packet | Do not create a new unrelated parameter. |
| F3-CAP-1 | Define `capOpenInterval` and `capSpan` | PROSE-CLOSED | F3-CAP-0 | Finset filter and card. |
| F3-CAP-2 | Left/right/inner cap-span shrink lemmas | PROSE-CLOSED | F3-CAP-1 | Strict-subset proof with interior endpoint witness. |
| F3-COV-0 | Current joint locus covered by endpoint pair plus open cap | VERIFY-EXISTING / BRANCH-OPEN | strict-cap cover theorem | Export exact `JointCapCover` contract. |
| F3-COV-1 | Fresh joint point is measured interior | PROSE-CLOSED | F3-COV-0 | Membership simp theorem. |
| F3-COV-2 | Measure zero implies `J={q,w}` | PROSE-CLOSED | F3-COV-1, F3-J-3 | Positive-card contradiction. |
| F3-WIN-0 | Define context-indexed deletion endpoint/window views | PROSE-CLOSED / mechanical Lean | deletion predicates | Separate semantic witness roles from geometric orientation. |
| F3-WIN-1 | Orient entry `q,w` window | VERIFY-EXISTING / local | cap injectivity/order, F3-JW-2 | Prove parameter values unequal, choose orientation. |
| F3-WIN-2 | Build fresh point as deletion endpoint | BRANCH-OPEN | fresh deletion provenance | Joint omission alone is insufficient. |
| F3-WIN-3 | Prove safe context swap or retain asymmetric branches | VERIFY-EXISTING / LEAN-REFRACTOR | all data fields | No `simpa` across independently chosen radii/supports. |
| F3-STATE-0 | Define `F3DescentState`, `F3TerminalCase`, `F3OneStep` | PROSE-CLOSED / mechanical Lean | F3-API, F3-CAP, F3-WIN | Use context-indexed structures from F3.38/F3.49. |
| F3-E-0 | Equal-blocker exhaustion impossible when `5≤C.card` | PROSE-CLOSED | F3-E-TRACE, F3-J-3, F3-CARD-0 | Produce fresh joint source. |
| F3-E-1 | Fresh equal-branch source is strict-cap interior | PROSE-CLOSED after cover adapter | F3-E-0, F3-COV-0 | Apply `JointCapCover`. |
| F3-E-2 | Equal nine-way producer retains `ctx`, fresh source, window | VERIFY-EXISTING / LEAN-REFRACTOR | F3-API-1 | Strengthen producer output if data were erased. |
| F3-E-3 | Two equal-branch collision constructors are terminally false | BRANCH-OPEN | F3-E-2, full ctx | Prove exact literal equalities contradict stored distinctness/robustness. |
| F3-E-4 | Seven equal support-location constructors map to terminal or smaller state | BRANCH-OPEN | F3-E-2, F3-WIN-2, F3-COV-0, F3-CAP-2 | Rebuild `ctx'`, window, cover, and strict decrease per constructor. |
| F3-D-0 | Genuine two-blocker cycle contradiction | previously locally closed / verify | live distinct branch | Preserve authoritative proof. |
| F3-D-1 | Cross-omission orientation and prescribed common deletion | previously locally closed / verify | live distinct branch | Preserve provenance. |
| F3-D-2 | Seven-way distinct producer retains `ctx` | VERIFY-EXISTING / LEAN-REFRACTOR | F3-API-2 | Three collisions, four survivals. |
| F3-D-3 | Fresh/bounded split before distinct consumer | PROSE-CLOSED | F3-J-3, F3-N-GEN, F3-CARD-0 | Exhaustive split. |
| F3-D-4 | Three distinct literal collisions are terminally false | BRANCH-OPEN | F3-D-2, full ctx | Pattern match with exact source/blocker inequalities in scope. |
| F3-D-5 | Four survival constructors produce smaller states | BRANCH-OPEN | F3-D-2, F3-WIN-2, F3-COV-0, F3-CAP-2 | Constructor-by-constructor successor reconstruction. |
| F3-COV-SUCC | Re-establish joint-cap cover for every successor context | BRANCH-OPEN | F3-E-4/F3-D-5 | Mandatory field; old cover does not transport automatically. |
| F3-TERM | Dispatch every terminal constructor to `False` | BLOCKED | F3-E-3, F3-D-4, all live bounded consumers | Mechanical cases after local consumers close. |
| F3-STEP | Prove `f3_oneStep : terminal ∨ smaller state` | BLOCKED | F3-E-4, F3-D-5, bounded split | Assemble dependent branch dispatch. |
| F3-WF | Generic well-founded closure from `F3-STEP` and `F3-TERM` | PROSE-CLOSED | F3-STEP, F3-TERM | `measure_wf` induction in F3.39. |
| F3-ENTRY | Build initial state from live leaf hypotheses | VERIFY-EXISTING / local | context, window, cover adapters | Exact wrapper for each historical placeholder. |
| F3-FINAL | Replace all three F3 `sorry`s | BLOCKED | F3-ENTRY, F3-STEP, F3-TERM | Apply `f3DescentState_false`. |

#### F3.54.1. Historical second-pass frontier (superseded)

The source-identification, successor-classification, `F3-STEP`, and `F3-WF`
items above are dormant provenance, not current tasks. The third pass preserves
the valid local finite and trace lemmas but rejects the missing recursive cover
and successor interface. Current F3 work is the nonrecursive producer sequence
and the five metric roots `F3-BOUND-ROOT`, `F3-THREE-ROOT`,
`F3-DIAG-A-ROOT`, `F3-DIAG-P-ROOT`, and `F3-DIAG-X-ROOT` recorded in
Section 16.5.I32.

<!-- F3-AUTHORITATIVE-CLOSURE-MATRIX-END -->
### F4. Source-clean coordinators do not change this status

The parent coordinators exhaustively dispatch to these leaves and may contain no `sorry` in their own files. Their transitive axiom closure still reaches `sorryAx`. Publication closure requires the leaves to be proved, bypassed by a stronger source-clean theorem, or removed from the dependency path.

**Status:** [PROVED dependency interpretation]

---

## 12. Results of the strengthened geometric attack

The attempted strengthening did not obtain a terminal geometry theorem. It did identify invalid or insufficient routes.

### G0. B1's old terminal is a consumer gap in the wrong interface

The existing code has a contradiction consumer

\[
T\Longrightarrow\bot
\]

for a terminal disjunction `T`. Every constructor of `T` is already incompatible with the local B1 normal form, so re-proving the consumers does not produce `T`. The available escape theorem gives an overlap upper bound of two, not the lower bound of three demanded by the third constructor.

Section 16.5.I supplies the correct positive reduction. For a strict-cap escape `t`, its canonical row must omit at least one original deleted source; otherwise `beta(t)` would be a third carrier on the exactly saturated deleted-source bisector. That omission yields a source-exact common-deletion packet and a finite nine-way continuation split.

**Conclusion:** bypass the old `B1GlobalGapOrClosedTerminal` producer. B1 needs a global consumer for the new source-faithful continuation packet, not a proof of the artificial terminal disjunction.
### G1. The proposed B2 four-point intersection contradicts its own hypotheses

The rejected argument asserted that four named points lie in a row/physical-class intersection while also assuming that one of those points is not in the row. Branch-specific mutual omissions exclude additional named points. The live source already bounds the relevant late-row intersection by two.

**Conclusion:** the four-point-intersection narrative is false for the live contract.

### G2. B2 local counting is realizable in strict convex position

An exact rational eight-point configuration realizes all of the following simultaneously:

- a five-point unit-circle class centered at the origin;
- a four-point circle centered at `(-1,0)` with radius two;
- intersection of those selected point sets equal to `{(1,0)}`;
- four physical-class points outside the second row; and
- strict convex position, verified by positive exact orientation determinants.

This is not a Problem 97 counterexample and does not realize the full critical-shell/minimality packet. It proves that local two-circle incidence, the `5-2≥3` counting fact, and strict convexity do not imply a contradiction.

**Conclusion:** a valid B2 theorem must use global provenance, cap order, exact deletion identities, or minimality data absent from the model.

### G3. B3 was misread as four simultaneous circles

The live survival-square hypothesis is a disjunction of four alternatives. Each alternative supplies a pair of existential K4-survival statements for one selected role. It does not provide four simultaneous centers, common radii, common supports, or pairwise equidistance of centers.

**Conclusion:** each alternative must be normalized separately, and every support or radius identification used later must be proved.

### G4. Partial shell geometry is realizable

The repository records an exact eleven-point partial Euclidean witness with two complete blocker shells, four cross omissions, strict convexity, and cyclic order. It does not satisfy the full global theorem, but it rules out any terminal statement based only on those local shell facts.

**Conclusion:** the missing contradiction must consume a genuinely global hypothesis.

### G5. Consolidated impossibility boundary

The strengthened attack proves the following negative methodological result:

> Local circle incidences, small cardinality inequalities, and strict convexity do not by themselves imply a contradiction.

This is useful progress. It prevents the proof from being “closed” by an overstrong false lemma and identifies information that must not be discarded.

---

## 13. What the missing global theorem must add

The all-blockers analysis and failed local attacks narrow the research target.

### H0. Pure cover counting is insufficient

The exact cover identity, pairwise row-intersection bound, pair-codegree bound, and forced directed cycle are all compatible with abstract finite systems. None uses the cyclic order of the convex polygon or cap geometry strongly enough.

### H1. A fixed number of robust points cannot close an unbounded theorem

The cover bound is

\[
n\le4|U|=4|\{\text{nonrobust centers}\}|.
\]

To contradict it by harvesting robust points alone, more than three quarters of the carrier would have to be proved robust. Producing a fixed number of robust Moser or apex points cannot scale with `n`.

### H2. Same-cap row bounds need a single-source upper bound

Existing cap geometry often yields a fact of the form:

> A canonical circle centered in a strict cap contains at most two points of that same cap.

Thus a four-row centered there contains at least two points outside the cap. Summing over centers gives a lower bound on cross-cap incidences. To turn it into a contradiction, one also needs a strong upper bound on how many such rows can pass through one outside source, or an order theorem forcing incompatible pairings. Pair-codegree controls rows sharing **two** sources, not rows sharing one source, and is too weak by itself.

### H3. A blocker-cycle proof needs a strict potential

The forced cycle from I13 becomes contradictory if one can choose blockers so that every edge strictly decreases a finite potential. Candidate potentials include:

- cyclic boundary position within a cap;
- distance from a designated cap endpoint;
- signed orientation relative to a Moser side;
- a lexicographic pair of cap index and boundary rank; or
- inclusion/overlap data of canonical rows.

The all-blockers relation is useful because it preserves alternative blocker choices. A critical-shell system that chooses arbitrarily may discard the edge satisfying the desired monotonicity.

### H4. Acceptable shapes for a new theorem

A genuinely useful global producer would have one of the following forms.

#### H4a. Cap-weighted incidence inequality

Prove an upper bound on total blocker incidence crossing a chosen cap boundary that is smaller than the lower bound forced by four-point rows centered in that cap.

#### H4b. Hall defect for canonical blockers

Construct source and blocker subsets whose neighborhood violates the cover forced by minimality, using cyclic intervals or cap membership rather than cardinality alone.

#### H4c. Extremal-blocker theorem

For an extremal source in a cap, prove that at least one canonical blocker has a strictly earlier or later boundary position. Iterating the strategic choice would contradict finiteness.

#### H4d. Forbidden orientation cycle

Normalize a blocker cycle and prove that equal-distance constraints force a strict cyclic chain of signed orientations that cannot close.

#### H4e. Global row-overlap theorem

Use exact source provenance and multiple prescribed deletions to force two distinct-center canonical rows to share at least three points, contradicting the proved two-circle bound.

### H5. Research acceptance gate

Before rebasing the full A-tail development around a new interface, a proposed route must produce at least one source-clean theorem strictly stronger than the existing local facts. It must:

1. use a global minimality, all-blockers, cap-order, or orientation hypothesis;
2. remain compatible with the known exact partial witnesses;
3. imply a live terminal contradiction or a removable vertex;
4. avoid synchronizing existential radii or supports without proof; and
5. avoid a fixed ambient cardinality unless paired with an explicit unbounded transfer theorem.

---

## 14. Proposed atomic all-blockers API

The following declarations would consolidate already-proved facts and preserve the data needed by a new global attack. They are specifications, not new axioms.

```lean
def MultiplicityBlocks
    (A : Finset ℝ²) (p x : ℝ²) : Prop :=
  p ∈ A.erase x ∧
  pinnedMultiplicity A p = 4 ∧
  pinnedMultiplicity (A.erase x) p = 3

def CanonicalBlocks
    (A : Finset ℝ²) (p x : ℝ²) : Prop :=
  ATailMinimalUniqueFourCover.IsUniqueFourCenter A p ∧
  x ∈ ATailMinimalUniqueFourCover.uniqueFourClass A p

theorem multiplicityBlocks_iff_canonicalBlocks
    (hK4 : HasNEquidistantProperty 4 A) :
  MultiplicityBlocks A p x ↔ CanonicalBlocks A p x

theorem failure_iff_canonicalBlocks
    (hK4 : HasNEquidistantProperty 4 A)
    (hp : p ∈ A.erase x) :
  (¬ HasNEquidistantPointsAt 4 (A.erase x) p) ↔
    CanonicalBlocks A p x

theorem isRemovableVertex_iff_no_canonicalBlocker
    (hK4 : HasNEquidistantProperty 4 A) (hx : x ∈ A) :
  IsRemovableVertex A x ↔
    ∀ p ∈ A, ¬ CanonicalBlocks A p x

theorem minimal_all_sources_have_canonicalBlocker
    (hmin : D.Minimal) :
  ∀ x ∈ D.A, ∃ p ∈ D.A, CanonicalBlocks D.A p x

theorem canonicalBlocker_pair_codegree_le_two
    (hconv : ConvexIndep A) (hxy : x ≠ y) :
  ((A.filter fun p => CanonicalBlocks A p x ∧
                      CanonicalBlocks A p y).card) ≤ 2
```

The existing `CriticalShellSystem` can then be described explicitly as a chosen section of `CanonicalBlocks`. Downstream enriched packets should retain the complete set of eligible blockers when strategic choice matters.


### 14.1 Finite late-choice API for the intrinsic F2 reduction

The new F2 reduction requires one semantic strengthening of the API: a critical-shell system must be treated as a **section** of the all-blockers relation, not as the definition of that relation. Finite legal prescriptions can then be imposed after the useful sources and blockers are known.

```lean
structure BlockerPrescription (D : CounterexampleData) where
  domain : Finset ℝ²
  value : ℝ² → ℝ²
  legal :
    ∀ x, x ∈ domain →
      CanonicalBlocks D.A (value x) x

structure CanonicalBlockerSection (D : CounterexampleData) where
  center : ℝ² → ℝ²
  legal :
    ∀ x, x ∈ D.A → CanonicalBlocks D.A (center x) x

theorem BlockerPrescription.exists_section
    (hmin : D.Minimal)
    (P : BlockerPrescription D) :
    ∃ β : CanonicalBlockerSection D,
      ∀ x, x ∈ P.domain → β.center x = P.value x
```

The F2-specific semantic layer should then expose:

```lean
structure IntrinsicRetainedTwoRowCore ...
def FreshFirstCapSources ...
inductive FreshRadialMode ...
structure CommonCanonicalBlockerPacket ...
structure MutualOmissionSquarePacket ...
inductive IntrinsicTwoCapSourceTerminal ...
  | commonRadius_commonBlocker ...
  | commonRadius_mutualOmission ...
  | aligned_commonBlocker ...
  | aligned_mutualOmission ...
```

The finite late-choice theorem, two-fresh-source lemma, universal fresh-blocker restrictions, radial dichotomy, common-blocker/mutual-omission dichotomy, and four-packet master reduction are all prose-complete in §16.5.E-H. Only the two terminal consumers remain new mathematics:

```lean
false_of_twoFreshCapSources_commonBlocker
false_of_twoFreshCapSources_mutualOmission
```

**Status:** [API AND REDUCTION PROSE-COMPLETE; TWO TERMINAL ROOTS OPEN]

### 14.2 Joint-deletion-locus and nonrecursive trace API for F3

The joint-deletion locus remains a useful local invariant: it is the set of
physical-class points omitted by both current canonical rows.

```lean
def rowTrace (C K : Finset P) : Finset P := C ∩ K

def jointDeletionLocus (C K_u K_v : Finset P) : Finset P :=
  C \ (rowTrace C K_u ∪ rowTrace C K_v)
```

The exact finite-set calculus proves:

\[
C=(T_u\cup T_v)\mathbin{\dot\cup}J,
\qquad
|C|\le |J|+4,
\]

and, once two retained joint-deletion witnesses are named, either a fresh third
point lies in `J` or `J` is exactly that retained pair. The third pass shows
that `J` is not preserved by the proposed recursive successors. The active API
must therefore retain nonrecursive physical traces, blocker fibers, the sparse
conflict graph, amplified survival fans, common-center grids, diagonal cases,
and bounded finite projections directly in the producing context.

The former `JointCapCover`, `F3DescentState`, `F3OneStep`, and generic
well-founded wrapper are not current proof interfaces. The active consumers
are the five roots `F3-BOUND-ROOT`, `F3-THREE-ROOT`, `F3-DIAG-A-ROOT`,
`F3-DIAG-P-ROOT`, and `F3-DIAG-X-ROOT`.

**Status:** [LOCAL JOINT-LOCUS AND TRACE/GRAPH/FAN APIS PROSE-COMPLETE;
RECURSIVE STATE API REJECTED; FIVE METRIC CONSUMERS OPEN]

---

## 15. Conditional complete proof of descent

This section states the complete argument with the exact open theorem isolated as a hypothesis.

### Theorem 15.1 - Conditional removable-vertex theorem

Let `A` be a nonempty convexly independent K4 set with `9<|A|`, and assume `(Min)`. Assume additionally `GlobalNonM44Contradiction`. Then `A` has a removable vertex.

**Proof.** By M0-M12, choose a surplus-cap packet on `A`. Split on (7.3).

If an `IsM44` packet exists, Q0-Q17 produce a removable point.

If no `IsM44` packet exists, construct `D` and `H` by N0-N5. `GlobalNonM44Contradiction` gives `False`. By contradiction elimination, the required existential removable-vertex statement follows.

Thus in either branch a removable vertex exists. QED.

**Status:** [PROVED conditional on one OPEN theorem]

### Theorem 15.2 - Descent

Under the same global theorem, no counterexample with more than nine points can be minimal.

**Proof.** Apply Theorem 15.1 to obtain a removable point. D0 gives a strictly smaller counterexample. This contradicts `(Min)`. QED.

**Status:** [PROVED conditional]

### Theorem 15.3 - Universal Problem 97 statement

Assume the proved counting floor, the proved nine-point endpoint, and `GlobalNonM44Contradiction`. Then no finite nonempty convexly independent K4 set exists.

**Proof.** Apply D2 using Theorem 15.2 as the descent hypothesis. QED.

**Status:** [PROVED conditional]

### Corollary 15.4 - What a closure commit must accomplish

No change is required in `SmallerCounterexample.lean`, `Descent.lean`, or the strong-induction body. A valid closure commit must make one of the following true:

1. `ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap` becomes transitively free of `sorryAx`;
2. `removableVertexOfLarge_of_nonIsM44` is rewritten to call a different source-clean contradiction; or
3. `RemovableVertexOfLarge` is replaced by a direct theorem that avoids the current non-`IsM44` split.

Afterward, `#print axioms Problem97.erdos97_rhs` must contain no `sorryAx`.

---

## 16. The complete proof-status ledger

### 16.1 Closed ordinary logic and finite-set steps

- definitions of counterexample and removability;
- selected-class erase identity;
- exact class-cardinality behavior under one deletion;
- hereditary convex independence;
- smaller counterexample from a removable vertex;
- contradiction with strong-induction minimality;
- universal strong-induction assembly.

**Status:** [PROVED]

### 16.2 Closed global geometric infrastructure

- noncollinearity from convex independence and cardinality;
- minimum-enclosing-circle support analysis;
- exclusion of the diameter branch under K4;
- non-obtuse circumscribed Moser triangle;
- exact three-cap partition and cap-sum identity;
- surplus-cap packet extraction.

**Status:** [PROVED]

### 16.3 Closed deletion-semantics infrastructure

- deletion robustness from a class of at least five;
- deletion robustness from two heavy radii;
- unique-four characterization of a nonrobust carrier center;
- minimality cover by canonical four-classes;
- exact survival iff robust or deleted point lies outside the canonical row;
- selected critical-shell blocker equals canonical unique-four blocker;
- distinct-center row intersection at most two.

**Status:** [PROVED]

### 16.4 Closed `IsM44` branch

- endpoint residual exclusions;
- pinned-surplus residual exclusions;
- non-surplus cap containment;
- residual triple and exact-pin exclusions;
- card-ten/card-eleven finite terminal consumers;
- assembly of erasure witnesses;
- removable surplus-interior point.

**Status:** [CERTIFIED]

### 16.5 The open theorem decomposed into its reachable leaves

The single prose statement `GlobalNonM44Contradiction` is not a single unstructured gap in the current Lean development. In the 23 August 2026 kernel-mined dependency spine it reaches twenty-nine declarations containing `sorry`. This subsection retains the detailed historical contracts while marking declarations removed from the active frontier by later refactors. The purpose is to prevent a source-clean coordinator, an exhaustive case split, or a stronger-looking packet type from being mistaken for a proof of its unresolved terminal.

#### 16.5.0 Roster authority, snapshot discipline, and counting rule

The current roster follows the refreshed `proof-blueprint spine` measurement: twenty-nine reachable leaves below `Problem97.erdos97_rhs`. This is the reachability authority for this manuscript. A raw grep for `sorry` is not equivalent to a dependency-spine measurement: raw source may contain newly added placeholders not yet present in a build, old declarations that have become unreachable, and explicitly parked off-spine declarations.

The seven former TriApex D3--D9 terminals are also excluded from the current count: their declarations remain source-clean compatibility wrappers, but the active reverse-hit coordinator now routes directly through D1. Historical sections below remain useful descriptions of their stronger endpoint geometry, not current independent obligations.

For each numbered leaf, five distinctions are maintained. The *contract* is what the theorem actually assumes and concludes. The *available data* are facts already produced by callers. The *missing implication* is the smallest presently unproved mathematical step. The *candidate closure program* is a research route, not a claim of proof. The *rejection tests* identify shortcuts that would be unsound or contradicted by known realizable local models.

**Status.** [OPEN-ROSTER; 29 BUILT-SPINE LEAVES; TRIAPEX ROOTS D1 AND D2]

**Merged frontier progress.** The robust-apex tetrahedron-or-continuation theorem in §16.5.38 remains a valid generic reduction for A7 and A8. A5 retains the exact late-first-apex `5+4+3` partition, boundary-separation certificates, and the exact ten-cell same-side classifier; Cell 7 is midpoint-impossible, while nine full-A5 same-side cells and the opposite-side family remain. TriApex now has two independent roots: the kernel-clean reverse-hit selector routes D3--D9 through open D1, while D2 is prose-closed and Lean-open. F2 is reorganized intrinsically: the old six-leaf tree is bypassed in prose by a four-packet reduction with two open roots, checkpoint 36 adds a cross-radius cycle producer, and F8 remains separate. F3 preserves its local joint-locus calculus but replaces the unsupported recursive state framework by the third-pass physical-trace, sparse-graph, amplified-fan, bounded, grid, and diagonal program with five open metric roots.


#### 16.5.A `Rigid221SourceHeavy.lean` - eight reachable leaves

These leaves refine the source-heavy side of an exact `2+2+1` decomposition of a five-point physical radius class. They retain unusually rich provenance: named row companions, exact physical-class traces, cap-interior placement, actual blocker identities, and prescribed deletions. The main opportunity is to replace repeated local case trees by one or two order-sensitive lemmas on points lying on a common physical circle.

##### 16.5.A1 - The pentagon blocker is the distinguished deleted point

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 3379-3457. This is the first terminal after the source-heavy pentagon is normalized and the blocker of the `xv` row is identified with the joint-deletion point.

**Atomic contract.** From the complete source-heavy pentagon packet, the exact five-point physical class, the full row-membership and omission trace, strict second-cap locations, and the equality `centerAt(xv)=deleted`, derive `False`.

**Data already proved upstream.** The physical class is exactly the five named points `u`, `xu`, `deleted`, `v`, and `xv`. The source row and opposite row meet that class in exact two-point blocks. The blocker of the source row is `xv`; `xv` lies in the strict second-cap interior. The blocker of the `xv` row is the deleted point, and that blocker is also localized to the same strict interior. The row at `xv` contains `xv` and `u`, while the blocker center itself is not in that row. The theorem also receives the carried five-cycle support traces rather than anonymous existential circles.

**Exact missing implication.** The missing statement is not merely that several points are concyclic or equidistant. One must show that the complete named blocker cycle and the strict cap order cannot be realized simultaneously by a convexly independent carrier.

**Candidate closure program.**

1. Introduce an angular-coordinate lemma for a fixed physical circle: if three distinct points `a,b,c` lie in one open cap arc and `b` is equidistant from `a` and `c`, then `b` is the unique arc midpoint between `a` and `c` in that arc. State this without trigonometric branch ambiguity by using oriented cyclic order and equal-chord lemmas.

2. Translate each carried row equality whose center also lies on the physical circle into an arc-midpoint equation. In particular, `centerAt(u)=xv` and the two physical members of the source row give one midpoint relation; `centerAt(xv)=deleted` and the pinned pair `{xv,u}` give a second.

3. Enumerate every additional relation contained in the five-cycle trace and prove that they form either a strict cyclic chain of arc midpoints or a closed affine equation in angular coordinates. A closed chain of strict midpoints forces equality of two named distinct points.

4. Package the result as a generic `false_of_commonCircle_strictArc_blockerMidpointCycle` theorem, then discharge this leaf by a source-faithful adapter.


**Known limits and rejection tests.** Two midpoint equations alone are geometrically realizable, so the proof must consume the complete cycle trace. It may not assume that cap membership automatically gives a common semicircle until the cap-to-open-arc lemma is proved. It also may not use `center = deleted` as an immediate contradiction: a center need not belong to the erased support.

**Immediate consumer.** The source-heavy second-opposite-large pentagon coordinator. Closing it removes one of the two named pentagon continuations and supplies a reusable common-circle cycle theorem for several later Rigid221 leaves.

**Status.** [OPEN]

##### 16.5.A2 - Exact seventeen, second-cap nine, and the four-row exact cover

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 11710-11757. The theorem has already split the exact-cardinality-seventeen branch into an unused-outside-point arm and an exact-cover arm; the first arm is proved and only the exact-cover arm reaches `sorry`.

**Atomic contract.** Assume `|A|=17`, the indexed second cap has cardinality nine, the next blocker is strict-cap interior but outside the physical five-class, and its next row has at most one physical-class hit. The checked splitter says four named exact rows cover all eight carrier points outside the second cap. Prove that this exact cover is impossible.

**Data already proved upstream.** All four rows have cardinality four and retain their centers and source identities. The cap has an exact cyclic boundary model. Every point outside the cap is assigned to at least one of the four rows, and the complementary unused-point alternative has already been closed. The source file already contains certified boundary-order infrastructure for the seventeen-point normalization.

**Exact missing implication.** The unresolved implication is a finite cyclic-order obstruction: no assignment of the eight outside-cap points to the four named rows can satisfy all exact support memberships, center-not-in-support conditions, circle-intersection bounds, and the inherited physical-class omissions.

**Candidate closure program.**

1. Extract a minimal finite packet containing the seventeen boundary labels, the nine cap labels, the four row centers, the four exact support sets, and every forced membership and nonmembership. Do not encode arbitrary K4 witnesses not used by the terminal.

2. Normalize reflection and rotation symmetries of the boundary order so the certificate searches one representative per dihedral orbit.

3. For every candidate support assignment, derive exact orientation or circle-incidence constraints. Reject assignments by a small library of kernel lemmas: distinct-center circles meet in at most two carrier points; a row omits its own center; three collinear carrier points are impossible; and interlacing equal-chord pairs force a convex-hull crossing.

4. If the remaining state space is finite, emit a replayable certificate bank keyed by the normalized support assignment. A project-approved `native_decide` endpoint is acceptable here only after the geometric reduction to finite predicates is explicit and audited.


**Known limits and rejection tests.** A cardinality count alone cannot reject the exact cover: four four-point rows can cover eight points abstractly. The finite checker must encode the branch's exact provenance and geometric predicates, not just an incidence hypergraph. The existing exact rational B2 stress model warns that local two-circle counting plus strict convexity is insufficient.

**Immediate consumer.** The exact-seventeen deleted-row off-class coordinator. This is a bounded endpoint and is one of the best candidates for certificate closure without discovering a new unbounded theorem.

**Status.** [OPEN]

##### 16.5.A3 - The unbounded deleted-row off-class continuation

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 11760-11791. The source comment explicitly identifies this as the unbounded continuation after the exact-seventeen stratum is isolated.

**Atomic contract.** Under the same rigid pentagon and deleted-row off-class hypotheses, but with `18 <= |A|`, prove `False`.

**Data already proved upstream.** The physical five-class, prescribed deletion, interior next blocker, off-class condition, and next-row physical-intersection bound are all available. Exact-cardinality fifteen, sixteen, and the cap-ten/cap-eleven portions of seventeen have separate finite closures. No upper bound on the carrier is available here.

**Exact missing implication.** A cardinality-independent contradiction is missing. No finite label enumeration can prove this theorem unless one first establishes a bounded-obstruction reduction that preserves every hypothesis needed by the endpoint certificate.

**Candidate closure program.**

1. Attempt a cap-weighted all-blockers inequality. Count incidences from sources outside the physical second cap into canonical four-rows, but weight a row by the number of its support points forced outside that cap. The current branch supplies a row with at most one physical-class hit and should force at least three supports elsewhere.

2. Combine this lower bound with an order-sensitive upper bound: for centers in a fixed cap interval, canonical rows should not be able to use too many separated outside-cap pairs without producing interlacing chords or a repeated source pair. Pure pair-codegree at most two is too weak; the upper bound must use boundary intervals.

3. As an alternative, prove a genuine bounded-obstruction theorem: from any realization of the unbounded residual, select a bounded set of named centers and supports that itself violates a generic Euclidean lemma. This must not delete arbitrary carrier points or assume K4 is hereditary under taking subsets.

4. Only after one of those global reductions is proved should the exact-seventeen certificate be considered as a terminal for the unbounded branch.


**Known limits and rejection tests.** The tempting statement 'four rows have at most sixteen points, so an eighteenth point is unused' is invalid: the relevant rows need not cover the whole carrier, and an unused point can still be blocked by another canonical center. Deleting that point is not justified. This leaf is the clearest evidence that the current route needs a scalable invariant rather than more finite splitting.

**Immediate consumer.** The `card_ge_seventeen` coordinator and, transitively, the source-heavy pentagon route. This is the highest-risk single leaf in the current Rigid221 cluster.

**Status.** [OPEN]

##### 16.5.A4 - The blocker centered at `v` lies off the physical class

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerOffClass`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 12004-12019. All named physical-class placements of the next blocker have already been split; center-not-in-row, equilateral, and ordered-betweenness arguments close the other physical alternatives.

**Atomic contract.** Given the complete pentagon residual and the fact that the blocker selected at `v` is not in the exact physical five-class, derive `False`.

**Data already proved upstream.** The preceding packet identifies the physical five-class and its `2+2+1` row decomposition, the blocker chain through `u` and `xv`, cap-interior positions for the first two fresh blockers, and all row omissions. The only new center is the blocker of `v`, known to be a carrier point and the center of a canonical four-row.

**Exact missing implication.** The missing theorem must localize an off-circle blocker strongly enough to force either a previously closed physical placement, a forbidden row intersection, or a convex-order violation.

**Candidate closure program.**

1. Use each pair of physical-class support points in the `v` row to place the new blocker on a named perpendicular bisector. Derive a second independent bisector from another forced pair in its row or from a common-deletion support; one bisector alone leaves a one-dimensional family.

2. Prove a cap-localization lemma for the intersection of two such bisectors relative to the strict second-cap arc. The desired conclusion is that the intersection is either one of the named physical points, outside the convex hull, or in a cap region incompatible with the inherited blocker localization.

3. If only one physical pair is currently retained, strengthen the upstream packet additively with the exact second pair before restating the terminal. Do not guess it from an existential K4 witness.

4. Share the resulting `offPhysicalCircle_twoPinnedPairs` lemma with the nonphysical-collision and generic source-ne-`u` leaves.


**Known limits and rejection tests.** An off-class blocker is not impossible by itself; a point off one circle can be the center of a circle through two points on it. The proof needs two independent pair constraints or a global order condition. It must also preserve the independent radii of different selected rows unless equality is separately derived.

**Immediate consumer.** The `BlockerV` pentagon coordinator. A successful two-bisector localization theorem could also reduce leaves C1 and C2.

**Status.** [OPEN]

##### 16.5.A5 - Exact-twelve common-deletion residue: refined source-level analysis

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15438-15505 in the inspected source lineage. This is the exact-twelve `(5,4,6)` endpoint after the complete tetrahedron-incidence pattern has already been eliminated by a proved consumer. The present theorem is not merely a five-way incidence puzzle: it also receives an exact cap profile, a source-authenticated six-arm deletion clause, two concrete `xu`-deletion packets, and the complete source-heavy physical-cycle trace.

###### A5.0. Atomic notation

Write

- `O` for the physical second apex `S.oppApex2`;
- `t` for the distinguished point `P.jointDeletion.deleted`;
- `u,xu,v,xv` for the four named physical-class points;
- `C` for the exact five-point physical class centered at `O`;
- `c = β(xv)` for the actual blocker of `xv`;
- `d = β(c)` for the actual blocker of `c`;
- `Kxv` for the canonical exact four-row centered at `c` and selected by source `xv`;
- `Kc` for the canonical exact four-row centered at `d` and selected by source `c`; and
- `BO` for the physical radius class after deleting `xu`.

Thus

\[
C=\{u,xu,t,v,xv\},
\qquad
BO=C\setminus\{xu\}.
\tag{A5.0}
\]

The three exact rows used by the checked tetrahedron consumer are `BO`, `Kc`, and `Kxv`.

**Status:** [NOTATION]

###### A5.1. Exact physical row after deleting `xu`

One has

\[
BO=\{u,t,v,xv\},
\qquad |BO|=4.
\tag{A5.1}
\]

**Proof.** The source-heavy packet identifies `C` exactly as the five named points. The point `xu` belongs to `C`, and selected classes commute with erasure. Therefore deleting `xu` removes exactly that one point from `C`. QED.

**Status:** [DERIVED FROM PROVED SOURCE LEMMAS]

###### A5.2. Exact second-cap profile and forced order

At this endpoint,

\[
|A|=12,
\qquad
(|S_0|,|S_1|,|S_2|)=(5,4,6),
\tag{A5.2}
\]

and the strict interior of the physical second cap is exactly

\[
\{u,c,xv,xu\}.
\tag{A5.3}
\]

Up to reversal of the oriented cap, these four points occur in the order

\[
u<c<xv<xu.
\tag{A5.4}
\]

The order is not an arbitrary label choice. It is forced by two equal-chord relations: `xv` is equidistant from `u` and `xu`, while `c` is equidistant from `u` and `xv`.

**Status:** [PROVED IN THE SOURCE]

###### A5.3. Exact trace of `Kxv`

The `xv` row has the exact cap trace

\[
K_{xv}\cap S_2=\{u,xv\}.
\tag{A5.5}
\]

It also has the exact physical-class trace

\[
K_{xv}\cap C=\{u,xv\}.
\tag{A5.6}
\]

Consequently,

\[
K_{xv}\cap BO=\{u,xv\}.
\tag{A5.7}
\]

In particular,

\[
c\notin K_{xv},
\qquad
xu\notin K_{xv},
\tag{A5.8}
\]

and the other two members of `Kxv` lie outside the physical second cap.

**Proof.** Equation (A5.5) is the proved cap-intersection theorem for the `xv` row. Equation (A5.6) is one edge of the proved five-cycle trace. Equation (A5.7) follows from (A5.1) and (A5.6). The center `c` is omitted from its own positive-radius row, and `xu` is excluded by (A5.6). QED.

**Status:** [PROVED/DERIVED]

###### A5.4. The concrete `xu`-deleted three-row packet

The common arm supplies exact rows in `A-xu` at all three centers `O,c,d`. More precisely:

1. `BO` is an exact four-row centered at `O`;
2. `Kxv` is an exact four-row centered at `c` and omits `xu`;
3. `Kc` is an exact four-row centered at `d` and omits `xu`; and
4. every pair of these three rows has intersection cardinality at most two.

The two original common-deletion packets are

\[
\operatorname{CD}(xu;c,O)
\quad\text{and}\quad
\operatorname{CD}(xu;d,O).
\tag{A5.9}
\]

They imply that the actual blocker of `xu` is distinct from each of `O,c,d`.

**Status:** [PROVED IN THE SOURCE]

###### A5.5. The next-row strict-triple bound

The row `Kc` contains at most one of the three named points `u,xu,xv`:

\[
|K_c\cap\{u,xu,xv\}|\le 1.
\tag{A5.10}
\]

Since the common arm already gives `xu∉Kc`, at most one of `u` and `xv` belongs to `Kc`.

This fact is stronger than the generic two-circle intersection bound and must be retained in every exact-twelve classifier.

**Status:** [PROVED IN THE SOURCE]

###### A5.6. The exact four-source second-cap deletion fan

Let

\[
T_2=S_2\setminus K_{xv}.
\]

Because `|S2|=6` and `Kxv∩S2={u,xv}`,

\[
|T_2|=4.
\tag{A5.11}
\]

Every `q∈T2` is a common deletion for the centers `c` and `O`:

\[
q\in T_2
\quad\Longrightarrow\quad
\operatorname{CD}(q;c,O).
\tag{A5.12}
\]

The four points of `T2` are exactly `c`, `xu`, and the two boundary endpoints of the six-point cap. Thus A5 already contains a four-source deletion fan, not merely the single `xu` packet displayed by the leaf theorem.

The source also proves that the actual blocker map is not constant on this four-source fan. In particular, at least two sources in `T2` have distinct actual blockers, both different from `c` and `O`.

**Status:** [PROVED, WITH EXACT CARDINALITY DERIVED]

###### A5.7. The physical five-class deletion fan

Let

\[
T_C=C\setminus K_c.
\]

The source proves

\[
|T_C|\ge 3,
\tag{A5.13}
\]

and every `q∈TC` is a common deletion for `d` and `O`:

\[
q\in T_C
\quad\Longrightarrow\quad
\operatorname{CD}(q;d,O).
\tag{A5.14}
\]

The original `xu` packet belongs to this fan because `xu∉Kc`. This physical fan and the exact four-source cap fan are the two main global incidence resources that were not explicit in the earlier A5 prose reduction.

**Status:** [PROVED IN THE SOURCE]

###### A5.7a. The three concrete rows leave a row-avoiding deletion source

> **Lean closure annotation — [LEAN-HELPER-READY].** This is a complete prose proof of a new row-avoiding-source lemma. It should be formalized as an auxiliary producer for the A5 leaf; it does not alone discharge the current A5 `sorry`.

Let

\[
I_2=\{u,c,xv,xu\}
\]

be the strict second-cap interior, and define

\[
Z=(A\setminus I_2)\setminus(BO\cup K_{xv}\cup K_c).
\tag{A5.14a}
\]

Then

\[
|Z|\ge 1.
\tag{A5.14b}
\]

If `Kc` contains `u` or `xv`, then in fact

\[
|Z|\ge 2.
\tag{A5.14c}
\]

**Proof.** Since `|A|=12` and `|I2|=4`, exactly eight carrier points lie outside `I2`.

- By A5.1, `BO\I2={t,v}`, so `BO` uses exactly two outside points.
- By A5.3, `Kxv` has exactly two points outside the entire second cap, hence exactly two outside `I2`. Equation (A5.7) shows that these two points are disjoint from `{t,v}`.
- The row `Kc` contains `c` and at most one of `u,xv`, while omitting `xu`. Therefore it uses at most three points outside `I2`, and only two when it contains `u` or `xv`.

Thus the three rows use at most `2+2+3=7` of the eight outside points, or at most six in the latter two traces. QED.

Choose `z∈Z`. Then

\[
z\notin I_2,
\qquad
z\notin BO\cup K_{xv}\cup K_c,
\qquad
z\notin C.
\tag{A5.14d}
\]

The last assertion follows from `C=BO∪{xu}` and `xu∈I2`. Since `z` is absent from every concrete row, the unchanged supports prove

\[
\operatorname{Survives}_A(z;O),
\qquad
\operatorname{Survives}_A(z;c),
\qquad
\operatorname{Survives}_A(z;d).
\tag{A5.14e}
\]

No robustness argument is needed here: exact-row persistence proves all three survivals, including the cases `z=O` or `z=d`. If `e=beta(z)` is the actual blocker of `z`, blocker semantics therefore give

\[
e\ne O,
\qquad
e\ne c,
\qquad
e\ne d.
\tag{A5.14f}
\]

Equivalently, the exact-twelve common arm always contains a source-exact three-center deletion fan at some point outside both the physical five-class and the strict second-cap interior. It may be represented by the pair of packets

\[
\operatorname{CD}(z;O,c)
\quad\text{and}\quad
\operatorname{CD}(z;O,d),
\tag{A5.14g}
\]

with the same named deleted source `z`, or by one three-center packet retaining all three exact rows simultaneously.

This conclusion is independent of the missing-incidence branch and of the six-arm source choice. It is therefore available in every A5 branch and should be part of the common ingress rather than reconstructed in every source-tagged coverage cell.

**Scope caution.** The point `z` is new relative to the three row supports and the physical five-class, but it is not yet proved distinct from `O` or `d`. Any argument requiring a fourth distinct source point must first exclude those equalities. The blocker `e`, however, is provably distinct from all three row centers.

**Status:** [NEW DERIVED LEMMA; PROVED IN PROSE]

###### A5.8. The source-authenticated six-arm clause

Independently of the five tetrahedron incidences, the exact-twelve theorem receives a named source

\[
s\in\{u,xv,xu\}
\tag{A5.15}
\]

and one of the two prescribed first-apex deletions `q,w` such that deletion of that point preserves K4 at `β(s)`. Equivalently, one of the six exact clauses holds:

\[
(s,\delta)\in
\{u,xv,xu\}\times\{q,w\},
\qquad
\delta\notin K_s.
\tag{A5.16}
\]

The same theorem proves `β(s)≠O1`, where `O1` is the first apex. This six-arm clause is source-authenticated and must be included in any finite coverage theorem; it is not implied by the three concrete `xu`-deleted rows.

**Status:** [PROVED IN THE SOURCE]

###### A5.9. The next blocker cannot be `xv`

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** Formalizing this argument should discharge the `d = xv` child of `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence`. The current theorem must expose that child explicitly or incorporate the case split in its proof.

One has

\[
d\ne xv.
\tag{A5.17}
\]

**Proof.** The rigid source packet identifies the actual blocker of `u` with `xv`:

\[
\beta(u)=xv.
\]

Suppose, for contradiction, that `d=xv`. Since `d=beta(c)`, the sources `c` and `u` would then have the same actual blocker. Canonical-row uniqueness at a fixed actual blocker gives

\[
K_c=K_u,
\]

where `Ku` is the canonical row selected by source `u`. The exact source-row trace gives `xu∈Ku`. Hence `xu∈Kc`. But the `xu` common-deletion arm gives `xu∉Kc`. Contradiction. QED.

This argument uses support equality only; it does not identify any independently chosen radii.

**Status:** [DERIVED AND PROVED IN PROSE]

###### A5.10. The five-incidence hypothesis is redundant

> **Lean closure annotation — [LEAN-HELPER-READY].** This proof should become a source-level simplification lemma for the current A5 leaf. It removes a redundant premise and replaces the old missing-incidence dispatcher with the stronger role split, but it is not a terminal contradiction.

The following three incidences are already incompatible:

\[
u\in K_c,
\qquad
d\in BO,
\qquad
d\in K_{xv}.
\tag{A5.18}
\]

**Proof.** By A5.3,

\[
BO\cap K_{xv}=\{u,xv\}.
\]

Thus the last two incidences force `d=u` or `d=xv`. The first alternative is impossible because `d` is the center of the positive-radius row `Kc` while `u∈Kc`. The second is excluded by A5.9. QED.

Consequently the full conjunction used by the planar-tetrahedron consumer is impossible even before the two incidences involving `O` are considered. In particular, the theorem parameter

```text
not (d in BO and O in Kc and u in Kc and O in Kxv and d in Kxv)
```

is derivable from the remaining A5 hypotheses and should be removed from the conceptual theorem statement. The source-level `by_cases` on that conjunction remains a valid implementation device, but it is not the mathematical classification of the exact-twelve residue.

**Status:** [DERIVED AND PROVED IN PROSE; ONE REDUNDANT HYPOTHESIS IDENTIFIED]

###### A5.11. The correct disjoint five-family role split

> **Lean closure annotation — [LEAN-HELPER-READY].** This exhaustive disjoint classifier is implementation-ready and should replace overlapping nested `Or` reasoning in the current A5 proof. It is a dispatcher, not a leaf closer.

The common arm belongs to exactly one of the following five role families:

\[
\begin{array}{lll}
\mathsf U:      & u\notin K_c,\[1mm]
\mathsf{B_{xu}}:& u\in K_c\ \text{and}\ d=xu,\[1mm]
\mathsf{B_{off}}:&u\in K_c\ \text{and}\ d\notin C,\[1mm]
\mathsf{X_t}:   & u\in K_c\ \text{and}\ d=t,\[1mm]
\mathsf{X_v}:   & u\in K_c\ \text{and}\ d=v.
\end{array}
\tag{A5.19}
\]

**Proof.** Split first on `u∈Kc`.

- If `u∉Kc`, one is in `U`.
- Assume `u∈Kc`. Split on `d∈BO`.
  - If `d∉BO`, the identity `C=BO∪{xu}` gives `d=xu` or `d∉C`, producing `Bxu` or `Boff`.
  - If `d∈BO={u,t,v,xv}`, then `d≠u` because a positive-radius row omits its center, and `d≠xv` by A5.9. Hence `d=t` or `d=v`, producing `Xt` or `Xv`.

The alternatives are pairwise disjoint by construction. QED.

In the last two families, A5.3 also gives automatically

\[
d\notin K_{xv},
\tag{A5.20}
\]

because `t,v∈BO` while `BO∩Kxv={u,xv}`.

Crossing these five role families with the six source-authenticated clauses of A5.8 gives thirty source-faithful cells. The next theorem closes all six cells in the `Bxu` family, leaving twenty-four cells rather than thirty.

**Status:** [DERIVED AND PROVED IN PROSE]

###### A5.12. The `Bxu` family is impossible

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** This is a complete contradiction for the `Bxu` role family of the current A5 leaf. A Lean split on A5.11 should allow this proof to close all six source-authenticated `Bxu` cells with no additional mathematics.

The family

\[
u\in K_c,
\qquad
d=xu
\tag{A5.21}
\]

cannot occur.

**Proof.** The row `Kc` is centered at `d=xu` and contains both its source `c` and, by assumption, `u`. Therefore

\[
\operatorname{dist}(xu,u)
=
\operatorname{dist}(xu,c).
\tag{A5.22}
\]

The three distinct points `u,c,xu` all lie in the strict interior of the same second cap. The strict-cap equal-distance betweenness theorem therefore places the center `xu` strictly between the two equidistant endpoints `u` and `c` in cap order.

But A5.2 gives, up to reversal,

\[
u<c<xv<xu.
\]

Thus `c`, not `xu`, lies between `u` and `xu`; in particular `xu` is not between `u` and `c`. Contradiction. QED.

This proof consumes the source-derived cap order and the canonical-row identity. It does not use the six-arm clause or any finite certificate.

**Status:** [DERIVED AND PROVED IN PROSE; SIX OF THIRTY COVERAGE CELLS CLOSED]

###### A5.13. The `U` family: exact-eleven two-failure normal form

Assume

\[
u\notin K_c.
\tag{A5.U0}
\]

For this section, introduce the three remaining physical-cycle blockers

\[
a=\beta(xu),
\qquad
b=\beta(t),
\qquad
g=\beta(v),
\tag{A5.U1}
\]

and write

\[
M=C\setminus\{u\}=\{xu,t,v,xv\}.
\tag{A5.U2}
\]

Thus `M` is the exact physical row centered at `O` after deleting `u`.

The generic `FiveSurvivorExactRowsBoundary` is useful as an ingress, but it hides two facts that are decisive for this source-specific endpoint:

1. all five surviving supports can be chosen deterministically from the already named canonical rows; and
2. deletion of `u` is known to fail at **two** named centers, not merely at the one selected actual blocker.

The following statements expose that stronger normal form.

**Status:** [U-FAMILY NOTATION]

###### A5.13a. The five surviving rows are deterministic

After deleting `u`, the following exact four-point rows survive unchanged:

\[
\begin{array}{c|c|c}
\text{center} & \text{exact surviving row} & \text{physical trace}\\
\hline
a & K_{xu} & \{xu,t\}\\
b & K_t    & \{t,v\}\\
O & M      & \{xu,t,v,xv\}\\
g & K_v    & \{v,xv\}\\
d & K_c    & K_c\cap C.
\end{array}
\tag{A5.U3}
\]

**Proof.** The exact physical-cycle trace gives

\[
K_{xu}\cap C=\{xu,t\},
\quad
K_t\cap C=\{t,v\},
\quad
K_v\cap C=\{v,xv\}.
\]

Hence all three rows omit `u`. The row `M` is obtained by deleting `u` from the exact five-point physical class. The U hypothesis gives `u\notin K_c`. Therefore each displayed support remains an exact four-point support in `A-u`. QED.

This is stronger than extracting five arbitrary four-subsets from five survival statements. Every later support equality, omission, or intersection refers to a canonical named row.

**Status:** [DERIVED FROM PROVED SOURCE TRACES]

###### A5.13b. Deletion of `u` fails at two named centers

Deletion of `u` fails at both

\[
xv=\beta(u)
\qquad\text{and}\qquad
c=\beta(xv).
\tag{A5.U4}
\]

At `xv`, the canonical row is `K_u`; at `c`, the canonical row is `K_{xv}`. Their exact physical traces are

\[
K_u\cap C=\{u,xu\},
\qquad
K_{xv}\cap C=\{u,xv\}.
\tag{A5.U5}
\]

Put

\[
D_{xv}=K_u\setminus\{u\},
\qquad
D_c=K_{xv}\setminus\{u\}.
\tag{A5.U6}
\]

Then

\[
|D_{xv}|=|D_c|=3,
\tag{A5.U7}
\]

and the pinned multiplicities in the erased carrier satisfy

\[
\mu_{A-u}(xv)=3,
\qquad
\mu_{A-u}(c)=3.
\tag{A5.U8}
\]

**Proof.** The first failure is the defining property of the selected actual blocker `β(u)=xv`. For the second, `c` is a unique-four center because it is the actual blocker of `xv`, and its unique row `Kxv` contains `u`. The exact deletion semantics of a unique-four row therefore show that erasing `u` destroys K4 at `c` as well. In each case one point is removed from an exact four-class and every other radius class had cardinality at most three. QED.

Thus the U endpoint is not merely an eleven-point carrier with five known survivals. It is an eleven-point carrier with **five named surviving rows and two named dangerous three-point residual circles**.

**Status:** [DERIVED FROM CANONICAL BLOCKER SEMANTICS]

###### A5.13c. Exact traces of the two dangerous triples

> **Lean closure annotation — [LEAN-HELPER-READY].** The exact triple traces are prose-complete and should be formalized as canonical deletion-normalization lemmas used by every surviving U-family branch.

Let

\[
N=A\setminus C.
\tag{A5.U9}
\]

Since `|A|=12` and `|C|=5`, one has `|N|=7`. There are exact two-point subsets `Q_u,Q_{xv}\subseteq N` such that

\[
K_u=\{u,xu\}\mathbin{\dot\cup}Q_u,
\qquad
K_{xv}=\{u,xv\}\mathbin{\dot\cup}Q_{xv}.
\tag{A5.U10}
\]

Consequently

\[
D_{xv}=\{xu\}\mathbin{\dot\cup}Q_u,
\qquad
D_c=\{xv\}\mathbin{\dot\cup}Q_{xv}.
\tag{A5.U11}
\]

Moreover,

\[
D_{xv}\cap M=\{xu\},
\qquad
D_c\cap M=\{xv\},
\tag{A5.U12}
\]

and

\[
|D_{xv}\cap D_c|\le1.
\tag{A5.U13}
\]

**Proof.** The first two identities are the exact physical traces in (A5.U5). The intersections with `M` follow because `M\subseteq C`. The full circles supporting `K_u` and `K_{xv}` have distinct centers `xv` and `c` and already share `u`; two distinct planar circles have at most two common points. After deleting `u`, at most one common point remains. QED.

Every point of `(A-u)\setminus D_{xv}` is excluded from the dangerous radius at `xv`, and every point of `(A-u)\setminus D_c` is excluded from the dangerous radius at `c`. These are metric nonincidences, not merely omissions from arbitrarily selected supports.

**Status:** [DERIVED AND PROVED IN PROSE]

###### A5.13d. Collision classification for the fifth surviving center

The five physical-cycle blockers

\[
xv=\beta(u),
\quad
a=\beta(xu),
\quad
b=\beta(t),
\quad
g=\beta(v),
\quad
c=\beta(xv)
\tag{A5.U14}
\]

are pairwise distinct. The robust apex `O` is distinct from every actual blocker. In addition,

\[
d\ne c,
\qquad
d\ne O,
\qquad
d\ne xv.
\tag{A5.U15}
\]

The first inequality is the blocker/source inequality for `d=β(c)`; the second follows from deletion robustness at `O`; the third is A5.9.

Therefore a collision among the five surviving centers `a,b,O,g,d` can occur only when

\[
d=a,
\qquad d=b,
\qquad\text{or}\qquad d=g.
\tag{A5.U16}
\]

**Status:** [DERIVED FROM PROVED BLOCKER INJECTIVITY]

###### A5.13e. The collision `d=a` is impossible

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** This is a complete contradiction for the U-family center collision `d = a`. It should close that child once the current A5 `sorry` is split through the U-family center trichotomy.

One has

\[
d\ne a.
\tag{A5.U17}
\]

**Proof.** If `d=a`, then the sources `c` and `xu` have the same actual blocker. Canonical support uniqueness at a fixed actual blocker gives

\[
K_c=K_{xu}.
\]

The source `xu` belongs to `Kxu`, so `xu\in Kc`. But the original `xu` common-deletion packet proves `xu\notin Kc`. Contradiction. QED.

Thus the U family has exactly three center types:

\[
\begin{array}{ll}
\mathsf U_t: & d=b,\\
\mathsf U_v: & d=g,\\
\mathsf U_7: & d\notin\{a,b,g\}.
\end{array}
\tag{A5.U18}
\]

In `U7`, the seven centers

\[
a,b,O,g,d,xv,c
\tag{A5.U19}
\]

are pairwise distinct.

**Status:** [DERIVED AND PROVED IN PROSE; ONE COLLISION FAMILY CLOSED]

###### A5.13f. Exact support normal forms in the two collision types

In `Ut`, equal blockers give `Kc=Kt`. Since `Kt\cap C={t,v}` and `c\in Kc` with `c\notin C`, there is a unique point `p_t\notin C` such that

\[
K_c=K_t=\{t,v,c,p_t\}.
\tag{A5.U20}
\]

In `Uv`, equal blockers give `Kc=Kv`. Hence there is a unique point `p_v\notin C` such that

\[
K_c=K_v=\{v,xv,c,p_v\}.
\tag{A5.U21}
\]

These identities collapse the nominal five-row boundary to four distinct surviving circles. They are not contradictions: each remains a concrete six-center geometric endpoint, with the two dangerous triples of A5.13b still present.

**Status:** [DERIVED COLLISION NORMAL FORMS; TERMINALS OPEN]

###### A5.13g. Edge-bisector saturation sharpens the seven-center trace classification

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** The edge-bisector argument completely excludes the U7 traces `{t,v}` and `{v,xv}`. The remaining trace classifier is helper data; these two trace families themselves should close in Lean.

Assume `U7`, and put

\[
T_c=K_c\cap C.
\tag{A5.U22}
\]

The U hypothesis and the common arm give

\[
u\notin K_c,
\qquad
xu\notin K_c.
\tag{A5.U23}
\]

There is a stronger restriction than the generic two-circle bound.  Regard the five physical points as the cycle

\[
u-xu-t-v-xv-u.
\]

For its five adjacent edges, the physical apex and the corresponding actual blocker are already two distinct carrier points on the edge's perpendicular bisector:

\[
\begin{array}{c|c}
\text{physical edge} & \text{the two known carrier bisector centers}\\
\hline
\{u,xu\}   & O,\ xv,\\
\{xu,t\}   & O,\ a,\\
\{t,v\}    & O,\ b,\\
\{v,xv\}   & O,\ g,\\
\{xv,u\}   & O,\ c.
\end{array}
\tag{A5.U24}
\]

These are the only carrier bisector centers for the respective edges.

**Proof.**  A carrier point equidistant from the endpoints of an edge lies on that edge's perpendicular-bisector line.  Convex independence permits at most two carrier points on any line.  The two displayed points are distinct and already lie on that line, so no third carrier point can do so. QED.

Since the center `d` of `Kc` is distinct from all six points

\[
O,xv,a,b,g,c
\]

in the `U7` branch, `Kc` cannot contain any adjacent pair of the physical five-cycle.  Together with (A5.U23), this leaves exactly

\[
T_c\in
\bigl\{
\varnothing,
\{t\},
\{v\},
\{xv\},
\{t,xv\}
\bigr\}.
\tag{A5.U25}
\]

In particular, the formerly retained traces `\{t,v\}` and `\{v,xv\}` are impossible: their two points are adjacent physical-cycle vertices whose bisector line is already saturated by `O` and, respectively, `b` or `g`.

Let

\[
P_c=K_c\setminus C.
\tag{A5.U26}
\]

Then

\[
K_c=T_c\mathbin{\dot\cup}P_c,
\qquad
|P_c|=4-|T_c|,
\qquad
c\in P_c.
\tag{A5.U27}
\]

Thus every genuine seven-center U packet has one of five, not seven, possible physical traces.

**Status:** [NEW DERIVED SHARPENING; TWO COMPLETE U7 TRACE FAMILIES CLOSED]

###### A5.13h. If `xv` lies in `Kc`, the center `d` lies outside the strict second-cap interior

Assume

\[
xv\in K_c.
\tag{A5.U29}
\]

Then

\[
d\notin\{u,c,xv,xu\}.
\tag{A5.U30}
\]

**Proof.** The equalities `d\ne c` and `d\ne xv` are already known. Suppose `d` were one of `u` or `xu`. Since both `c` and `xv` belong to the row centered at `d`,

\[
\operatorname{dist}(d,c)=\operatorname{dist}(d,xv).
\]

All three points `d,c,xv` would lie in the strict second-cap interior. The strict-cap equal-distance theorem would then put `d` strictly between `c` and `xv`. But the exact order is

\[
u<c<xv<xu,
\]

so neither `u` nor `xu` lies between `c` and `xv`. Contradiction. QED.

This eliminates both interior endpoint placements for `d` in the three trace types with `xv\in T_c`.

**Status:** [NEW DERIVED GEOMETRIC RESTRICTION]

###### A5.13i. Exact outside-support ladder

There are exact two-point subsets

\[
P_{xu},P_t,P_v\subseteq N
\tag{A5.U31}
\]

such that

\[
\begin{aligned}
K_{xu}&=\{xu,t\}\mathbin{\dot\cup}P_{xu},\\
K_t&=\{t,v\}\mathbin{\dot\cup}P_t,\\
K_v&=\{v,xv\}\mathbin{\dot\cup}P_v.
\end{aligned}
\tag{A5.U32}
\]

Together with (A5.U10), the five physical-cycle rows give the exact chain

\[
D_{xv}
\xleftrightarrow{\ xu\ }
K_{xu}
\xleftrightarrow{\ t\ }
K_t
\xleftrightarrow{\ v\ }
K_v
\xleftrightarrow{\ xv\ }
D_c.
\tag{A5.U33}
\]

More precisely, the consecutive outside-pair intersections satisfy

\[
\begin{aligned}
|Q_u\cap P_{xu}|&\le1,\\
|P_{xu}\cap P_t|&\le1,\\
|P_t\cap P_v|&\le1,\\
|P_v\cap Q_{xv}|&\le1,\\
|Q_{xv}\cap Q_u|&\le1.
\end{aligned}
\tag{A5.U34}
\]

**Proof.** Each pair of consecutive full rows has distinct centers and already shares the displayed physical point. A second shared point is possible, but a third would contradict the two-circle intersection bound. The last inequality uses the common point `u` of the two full failure rows before deletion. QED.

The U endpoint is therefore a seven-point outside-support problem consisting of five exact two-subsets, one additional support `P_c`, and a cyclic sequence of saturated or nearly saturated circle intersections.

**Status:** [DERIVED EXACT SUPPORT NORMAL FORM]

###### A5.13j. Cover status and cross-hit status must be kept separate

Put

\[
P_{\mathrm{cyc}}
=Q_u\cup P_{xu}\cup P_t\cup P_v\cup Q_{xv}
\subseteq N,
\qquad
H=N\setminus P_{\mathrm{cyc}}.
\tag{A5.U35}
\]

There are two exclusive **cover-status** branches.

1. **Cycle-pair cover:** `H=\varnothing`, equivalently `Pcyc=N`.
2. **Escape:** `H\ne\varnothing`.

In the cover branch, the earlier argument is valid: because `c\in N`, `c\notin Q_{xv}` by center omission, and `c\notin Q_u` by strict-cap betweenness, one has

\[
c\in K_{xu}\cup K_t\cup K_v.
\tag{A5.U36}
\]

In the escape branch, choose

\[
z\in H.
\tag{A5.U37}
\]

Then `z` is omitted from the physical class and from all five physical-cycle rows.  Deleting `z` preserves the unchanged exact rows at the six pairwise-distinct centers

\[
O,xv,a,b,g,c.
\tag{A5.U38}
\]

If

\[
e=\beta(z),
\]

then blocker semantics give

\[
e\notin\{O,xv,a,b,g,c\}.
\tag{A5.U39}
\]

The important correction is that **escape and cross-hit are not logical complements**.  The cover branch forces a cross hit, but an escape configuration may also have `c\in Kxu\cup Kt\cup Kv`.  In particular, the collision types `Ut` and `Uv` always have a cross hit because `Kc=Kt` or `Kc=Kv`, yet their five outside pairs may still omit another point of `N`.

Accordingly, the correct reusable producer is

\[
\boxed{
H=\varnothing\ \Longrightarrow\ c\text{ cross-hits a cycle row},
\qquad
H\ne\varnothing\ \Longrightarrow\ \text{an escape source }z\text{ exists}.}
\tag{A5.U40}
\]

The two conclusions can coexist in the second branch.

**Status:** [CORRECTED DICHOTOMY; ESCAPE AND CROSS-HIT DECOUPLED]

###### A5.13j1. The escape source and blocker row are sharply cap-localized

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** The localization proof includes a complete contradiction for the escape-row trace `{xu,xv}`. The rest of the section is `[LEAN-HELPER-READY]` normalization for the surviving escape cases.

Let `Kz` be the canonical exact four-row centered at

\[
e=\beta(z)
\]

and selected by the escape source `z`. Thus

\[
z\in K_z,
\qquad
|K_z|=4,
\qquad
e\notin K_z.
\]

Write the six-point physical second cap as

\[
S_2=\{\ell_2,u,c,xv,xu,r_2\},
\tag{A5.U41a}
\]

where `ell2,r2` are its two boundary endpoints and the displayed middle four points are in strict cap order. Since

\[
C=\{u,xu,t,v,xv\}
\]

and `t,v\notin S2`, one has

\[
N\cap S_2=\{\ell_2,c,r_2\},
\qquad
W:=N\setminus S_2,
\qquad
|W|=4.
\tag{A5.U41b}
\]

The two outside pairs in the failure rows satisfy

\[
Q_u\subseteq W,
\qquad
Q_{xv}\subseteq W.
\tag{A5.U41c}
\]

Indeed, `Ku` is centered at the strict-cap point `xv` and already contains the two cap points `u,xu`; the strict-cap circle bound permits no third point of `S2` in that row. The exact trace theorem for `Kxv` similarly gives `Kxv\cap S2={u,xv}`. Since the two full rows have distinct centers and already share `u`,

\[
|Q_u\cap Q_{xv}|\le1,
\qquad
|Q_u\cup Q_{xv}|\ge3.
\tag{A5.U41d}
\]

Consequently

\[
|H\cap W|\le1.
\tag{A5.U41e}
\]

Thus every escape source lies in the three-point set

\[
\{\ell_2,c,r_2\}
\]

or is the unique possible uncovered point outside the second cap. More precisely:

- in the pure-escape branch of A5.13j3 one may and will choose `z=c`;
- in a simultaneous cross-hit/escape branch, `c\notin H`, so every escape source is one of `ell2,r2` or the unique possible point of `W\setminus Pcyc`.

This localization is much stronger than the original statement `z\in N`: the finite escape classifier has at most three boundary roles after the pure `z=c` case is separated.

Now apply the edge-bisector saturation of A5.13g to the escape blocker `e`. Equation (A5.U39) makes `e` distinct from `O` and from all five physical-cycle blockers, so `Kz` contains no adjacent pair of the physical cycle

\[
u-xu-t-v-xv-u.
\]

Put

\[
T_z=K_z\cap C.
\tag{A5.U41}
\]

Then `Tz` is an independent set in that five-cycle, and hence

\[
|T_z|\le2.
\tag{A5.U42}
\]

The only nonadjacent physical pair lying entirely in the strict second-cap interior is `\{xu,xv\}`. That pair is impossible as well.

**Proof.** Suppose `xu,xv\in Kz`. Then `e` is a carrier point equidistant from `xu` and `xv`. The common-physical-pair localization theorem places any non-apex carrier center for this pair in the strict second-cap interior. Therefore

\[
e\in\{u,c,xv,xu\}.
\]

The center-omission property excludes `e=xu` and `e=xv`, while (A5.U39) excludes `e=c`. Hence `e=u`. But then the row centered at `u` contains `xu` and `xv`, so

\[
\operatorname{dist}(u,xu)=\operatorname{dist}(u,xv).
\]

All three points are strict second-cap interior points, and the strict-cap equal-distance theorem would place the center `u` strictly between `xv` and `xu`. The actual order is

\[
u<c<xv<xu,
\]

so `u` lies before both endpoints. Contradiction. QED.

Accordingly, if `|Tz|=2`, its only possibilities are

\[
\{u,t\},
\quad
\{u,v\},
\quad
\{xu,v\},
\quad
\{t,xv\}.
\tag{A5.U43}
\]

In particular,

\[
|K_z\cap\{u,xv,xu\}|\le1.
\tag{A5.U43a}
\]

Since `z\in N\cap Kz` and `|Kz|=4`, equation (A5.U42) also gives

\[
|K_z\cap N|\ge2.
\tag{A5.U44}
\]

Thus every escape packet contains a named outside pair in the blocker row, one member of which is the escaped source `z`. The exact cap role of `z`, the physical trace `Tz`, and this outside pair must all be retained by any finite certificate.

**Status:** [NEW DERIVED ESCAPE NORMAL FORM; ONE FURTHER TWO-POINT TRACE CLOSED]

###### A5.13j2. Exact trichotomy according to the next row `Kc`

The escape source belongs to exactly one of the following three row/blocker types.

1. **Eight-center type `E8`:**
   \[
   z\notin K_c.
   \]
   Then deletion of `z` preserves `Kc` at `d`, so
   \[
   e\ne d.
   \tag{A5.U45}
   \]
   In `U7`, the eight carrier centers
   \[
   O,xv,a,b,g,c,d,e
   \tag{A5.U46}
   \]
   are pairwise distinct.  In `Ut` or `Uv`, where `d=b` or `d=g`, there are seven distinct center roles.

2. **Repeated-blocker type `Eeq`:**
   \[
   z\in K_c,
   \qquad
   e=d.
   \]
   Since the sources `z` and `c` have the same actual blocker, canonical-row uniqueness gives
   \[
   K_z=K_c.
   \tag{A5.U47}
   \]

3. **Two-blocker type `E2`:**
   \[
   z\in K_c,
   \qquad
   e\ne d.
   \]
   Then deletion of `z` fails at both distinct centers `d` and `e`; equivalently, `z` has blocker degree at least two in the all-blockers relation.

This split is exhaustive because `z\in Kc` is equivalent to failure at `d`, while `e` is the selected actual blocker of `z`.

**Status:** [NEW DERIVED ESCAPE TRICHOTOMY]

###### A5.13j3. Pure escape and simultaneous cross-hit

Define the exact cycle-row hit set of `c` by

\[
\mathcal H_c
=
\{\mathsf X:c\in K_{xu}\}
\cup
\{\mathsf T:c\in K_t\}
\cup
\{\mathsf V:c\in K_v\}.
\tag{A5.U48}
\]

In the escape branch there are two essentially different cases.

**Pure escape:** `Hc=\varnothing`.  Since `c\notin Q_u\cup Q_{xv}` and it lies in none of `P_xu,P_t,P_v`, one has `c\in H`.  Choose the escape source to be

\[
z=c.
\]

Then

\[
e=\beta(c)=d,
\qquad
K_z=K_c.
\tag{A5.U49}
\]

Thus pure escape can occur only in `U7`; it is exactly the `Eeq` branch with the already named source `c`, not a genuinely new seventh blocker.  A5.13j6a excludes its only two-point physical trace, so its residual trace is one of `\varnothing`, `{t}`, `{v}`, or `{xv}`.  The five surviving cycle rows and the first-apex source tag remain.

**Simultaneous cross-hit and escape:** `Hc\ne\varnothing` and `H\ne\varnothing`.  Then every escape source `z\in H` is distinct from `c`, and the exact cross-hit compatibility table of A5.13k remains available in addition to one of the escape types `E8`, `Eeq`, or `E2`.

This split prevents a finite classifier from counting the cover/cross-hit and escape branches as disjoint when they are not.

**Status:** [NEW DERIVED DEPENDENT SPLIT]

###### A5.13j4. Pair-codegree restrictions on the escape row

Let `x\ne y` be two points of `Kz`.  At most one physical-cycle row can contain both `x` and `y`.

**Proof.**  If two distinct cycle rows contained the pair, their two distinct blocker centers and the escape blocker `e` would be three carrier points on the perpendicular bisector of `xy`.  This contradicts convex independence. QED.

Two useful specializations are:

1. If `x\in C` and an outside point `y\in N` occurs in both cycle rows incident with `x`, then `\{x,y\}\nsubseteq Kz`.
2. If one outside pair is repeated by two nonconsecutive cycle rows, then `Kz` cannot contain both members of that repeated pair.

Together with A5.13j1, these give a complete incidence filter for the support of `Kz`: it may use no physical edge and no source pair already witnessed by two distinct cycle blockers.

**Status:** [NEW DERIVED ESCAPE SUPPORT FILTER]

###### A5.13j5. Location and finite iteration of the escape blocker

Because `A=C\mathbin{\dot\cup}N` and `N=Pcyc\mathbin{\dot\cup}H`, the escape blocker lies in exactly one of

\[
e\in C,
\qquad
e\in P_{\mathrm{cyc}},
\qquad
e\in H.
\tag{A5.U50}
\]

The known inequality `e\ne xv` narrows the first alternative, and (A5.U39) removes any cycle blocker that happens to occupy one of these sets.

If `e\in H`, then `e` is itself omitted from the physical class and all five cycle rows.  Applying the escape argument again to the source `e` shows that `\beta(e)` also avoids the six centers `O,xv,a,b,g,c`.  Iterating the blocker map while the source remains in `H` has only two outcomes:

1. the orbit leaves `H` and enters `C\cup Pcyc`; or
2. two sources repeat and a fixed-point-free directed blocker cycle is formed entirely inside `H`.

The second outcome is not by itself contradictory—blocker cycles are locally realizable.  A closing proof must supply a strict cap-order or signed-orientation potential along these escape-blocker transitions.

**Status:** [NEW DERIVED FINITE-ORBIT NORMAL FORM; STRICT POTENTIAL OPEN]

###### A5.13j5a. Six source-blocker pairs force a matching extension or a row collision

For a fixed escape source `z`, put

\[
S_z=\{u,xu,t,v,xv,z\}
\tag{A5.U50a}
\]

and

\[
B_z=\{xv,a,b,g,c,e\},
\qquad e=\beta(z).
\tag{A5.U50b}
\]

Both sets have cardinality six.  The source set has six elements because `z\notin C`; the blocker set has six elements because the five physical-cycle blockers are pairwise distinct and the escape-survival facts give

\[
e\notin\{xv,a,b,g,c\}.
\]

Moreover `xv\in S_z\cap B_z`.  Hence

\[
|S_z\cup B_z|\le 11<12=|A|.
\tag{A5.U50c}
\]

Choose

\[
r\in A\setminus(S_z\cup B_z).
\tag{A5.U50d}
\]

Let `h=\beta(r)`.  Exactly one of the following occurs.

1. **Matching extension:** `h\notin B_z`.  Then the six source-blocker pairs
   \[
   u\mapsto xv,
   \quad xu\mapsto a,
   \quad t\mapsto b,
   \quad v\mapsto g,
   \quad xv\mapsto c,
   \quad z\mapsto e
   \]
   extend to a seventh pair `r\mapsto h` with a new blocker center.
2. **Canonical-row collision:** `h\in B_z`.  If `h` is the blocker of the corresponding named source `s\in S_z`, then canonical uniqueness at the common blocker gives
   \[
   K_r=K_s,
   \qquad r\in K_s.
   \tag{A5.U50e}
   \]
   Thus `r` cross-hits one of the six source-exact rows
   \[
   K_u,K_{xu},K_t,K_v,K_{xv},K_z.
   \]

This is an exact positive producer, not a contradiction.  It says that an escape packet cannot be terminally isolated: the six distinct blocker assignments either enlarge to seven distinct blockers or absorb an additional carrier source into one of the six canonical rows.

In the pure-escape case `z=c`, the two distinct points `xv,c` lie in `S_z\cap B_z`.  Therefore

\[
|S_z\cup B_z|\le10,
\qquad
|A\setminus(S_z\cup B_z)|\ge2.
\tag{A5.U50f}
\]

Hence pure escape supplies two further sources to which the same matching-extension/row-collision split applies.  Closing the escape arm by this route requires a geometric consumer for the resulting collision rows or a Hall-type argument using the exact row supports; cardinality alone does not decide the alternatives.

**Status:** [NEW DERIVED MATCHING PRODUCER; TERMINAL CONSUMER OPEN]

###### A5.13j6. An incidence stress model for the escape arm

The set-theoretic part of the escape arm is consistent.  For example, let

\[
N=\{z,1,2,3,4,5,6\}
\]

and take

\[
\begin{aligned}
Q_u&=\{1,2\},&
P_{xu}&=\{2,3\},&
P_t&=\{3,4\},\\
P_v&=\{4,5\},&
Q_{xv}&=\{5,6\}.&&
\end{aligned}
\tag{A5.U51}
\]

Then `z` is omitted from all five pairs, every consecutive pair intersection has cardinality at most one, and no source pair occurs in more than one cycle pair.  An abstract blocker support

\[
K_z=\{z,1,3,5\}
\tag{A5.U52}
\]

has empty physical trace and satisfies the pair-codegree filter of A5.13j4.

This is not a Euclidean realization, not a faithful A5 carrier pattern, and not a Problem 97 counterexample.  It proves only that cardinality, pair-intersection, and blocker-cover incidence facts cannot close the escape arm.  The remaining theorem must use the exact cap order, equal-distance equations, source-authenticated deletion tag, or a shell-metric certificate.

**Status:** [DERIVED NEGATIVE RESULT: INCIDENCE-ONLY ESCAPE EXCLUSION IS FALSE]

###### A5.13j6a. Conditional coordinate analysis of the pure-escape two-physical-hit trace

> **Lean closure annotation — [LEAN-NOT-A-CLOSER].** This calculation is conditional on a full physical angular order that is not supplied by the current packet. It must not be used to fill a `sorry` outside the opposite-side child where that order is independently established.

> **Audit correction.**  The algebra below is valid under its displayed full angular order, but that order is not currently exported by the A5 source packet.  In particular, `t` has not been proved to lie on the specified side of the strict second-cap interval.  This subsection is retained as a candidate terminal, not as a proof of the source theorem.


Assume pure escape.  Then `z=c`, `e=d`, and `K_z=K_c`.  By A5.13g the only possible two-point physical trace is

\[
K_c\cap C=\{t,xv\}.
\tag{A5.U52a}
\]

This trace cannot occur.

**Proof.**  The physical five-class lies on a circle of radius `rho` centered at `O`, and all five physical points lie in one open semicircle because `O` is itself an exposed carrier vertex.  Apply an orientation-preserving Euclidean similarity and divide all lengths by `rho`.  Choose angular coordinates so that

\[
\begin{aligned}
O&=(0,0),\\
u&=(\cos\alpha,-\sin\alpha),\\
 xv&=(\cos\alpha,\sin\alpha),\\
 c&=(R,0).
\end{aligned}
\tag{A5.U52b}
\]

The equality `|cu|=|cxv|` and the fact that `c` lies on the cap side of the chord `uxv` justify this normalization and give `R>\cos\alpha`.  The equality

\[
|xv-u|=|xv-xu|
\]

and the strict cap order `u<c<xv<xu` then give

\[
xu=(\cos3\alpha,\sin3\alpha).
\tag{A5.U52c}
\]

Write

\[
t=(\cos\tau,\sin\tau),
\qquad
v=(\cos\nu,\sin\nu).
\]

Up to reflection, the physical and cap order gives

\[
\tau< -\alpha<\alpha<3\alpha<\nu,
\qquad
\nu-\tau<\pi.
\tag{A5.U52d}
\]

In particular

\[
0<\alpha<\frac\pi4,
\qquad
\tau>3\alpha-\pi.
\tag{A5.U52e}
\]

Put

\[
m=\frac{\tau+\alpha}{2},
\qquad
\Delta=\frac{\alpha-\tau}{2},
\qquad
n=(\cos m,\sin m).
\tag{A5.U52f}
\]

The points `t` and `xv` are symmetric about the line `\mathbb R n`, and

\[
t+xv=2\cos\Delta\,n.
\tag{A5.U52g}
\]

Since the row `K_c` is centered at `d` and contains `c,t,xv`, the point `d` is the circumcenter of these three points.  Hence `d` lies on the perpendicular bisector of `txv`, so

\[
d=\lambda n.
\]

The chord `txv` separates `O` from `c` in the strict convex boundary order.  Its equation is `x\mathbin\cdot n=\cos\Delta`; therefore

\[
R\cos m-\cos\Delta>0.
\tag{A5.U52h}
\]

Comparing the squared distances from `d` to `t` and `c` gives the exact formula

\[
\lambda=
\frac{R^2-1}{2(R\cos m-\cos\Delta)}.
\tag{A5.U52i}
\]

There are three cases.

**Case 1: `R<1`.**  Then `\lambda<0`.  Write `s=-\lambda>0`.  Equation (A5.U52g) gives the strict barycentric identity

\[
O=
\frac{\cos\Delta}{s+\cos\Delta}\,d
+
\frac{s}{2(s+\cos\Delta)}\,t
+
\frac{s}{2(s+\cos\Delta)}\,xv.
\tag{A5.U52j}
\]

All three coefficients are positive and sum to one.  Thus `O` lies in the interior of `conv\{d,t,xv\}`, contrary to convex independence.

**Case 2: `R=1`.**  Equation (A5.U52i) gives `d=O`.  This is impossible because `d=\beta(c)` is an actual blocker whereas `O` is fully deletion-robust.

**Case 3: `R>1`.**  Then `\lambda>0`.  Strict convexity at the consecutive vertices `c,xv,xu` gives

\[
0<\operatorname{orient}(c,xv,xu)
=2\sin\alpha\,(\cos\alpha-R\cos2\alpha),
\]

and therefore

\[
R<\frac{\cos\alpha}{\cos2\alpha}.
\tag{A5.U52k}
\]

Because `m=\alpha-\Delta`, equation (A5.U52e) implies

\[
0<\alpha+\Delta<\frac\pi2.
\]

A direct cross multiplication gives

\[
\frac{\sin\Delta}{-\sin m}
-
\frac{\cos\alpha}{\cos2\alpha}
=
\frac{\sin\alpha\cos(\alpha+\Delta)}
     {(-\sin m)\cos2\alpha}>0.
\tag{A5.U52l}
\]

Combining (A5.U52k) and (A5.U52l),

\[
R\sin m+\sin\Delta>0.
\tag{A5.U52m}
\]

The ray `\mathbb R_{\ge0} n` lies strictly between the rays `Ot` and `Oc`; let `\mu n` be its intersection with the segment `tc`.  Solving the two-coordinate equation gives

\[
\mu=
\frac{-R\sin\tau}{\sin\Delta-R\sin m}>0.
\tag{A5.U52n}
\]

Using (A5.U52i), one obtains the factored difference

\[
\mu-\lambda
=
\frac{(R\sin m+\sin\Delta)
      (R^2-2R\cos\tau+1)}
     {2(R\cos m-\cos\Delta)
      (\sin\Delta-R\sin m)}.
\tag{A5.U52o}
\]

Every factor on the right is positive: the first by (A5.U52m), the second is `|c-t|^2`, and the denominator factors are positive by (A5.U52h), `\Delta>0`, and `m<0`.  Thus

\[
0<\lambda<\mu.
\]

Therefore `d=\lambda n` lies strictly inside the triangle `Oct`, again contradicting convex independence.

All cases are impossible.  Hence (A5.U52a) cannot occur. QED.

Consequently pure escape has only the four residual physical traces

\[
\varnothing,
\qquad
\{t\},
\qquad
\{v\},
\qquad
\{xv\}.
\tag{A5.U52p}
\]

The proof uses the full cap/adjacent-cap order and three exact row equalities; it is not an incidence argument and is not contradicted by the stress model of A5.13j6.

**Status:** [CONDITIONAL COORDINATE CALCULATION ONLY; NOT LOAD-BEARING UNTIL THE FULL PHYSICAL ANGULAR ORDER IS PROVED]

###### A5.13j6b. The physical apex cannot lie in the `xv` row

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** This is a complete source-supported contradiction for the branch `O ∈ Kxv`. It should close that collision child in a split implementation of the A5 escape proof.

One has

\[
O\notin K_{xv}.
\tag{A5.U52q}
\]

Consequently the actual blocker of the source `O` cannot be `c`:

\[
\beta(O)\ne c.
\tag{A5.U52r}
\]

**Proof.**  Use the normalization from A5.13j6a.  The rays `Ou` and `Oxv` have arguments `-\alpha` and `\alpha`, with

\[
0<\alpha<\frac\pi4.
\]

Suppose `O\in Kxv`.  The row `Kxv` is centered at `c` and already contains `u,xv`; hence `c` is equidistant from the three vertices `O,u,xv`.  Thus `c` is the circumcenter of the triangle `Ouxv`.

That triangle is acute.  Its angle at `O` is `2\alpha<\pi/2`, while its two base angles are

\[
\frac{\pi-2\alpha}{2}
=\frac\pi2-\alpha
\in\left(\frac\pi4,\frac\pi2\right).
\]

The circumcenter of an acute triangle lies strictly in its interior.  Hence `c` lies in the interior of `conv\{O,u,xv\}`, contradicting convex independence.  This proves (A5.U52q).

If `\beta(O)=c`, canonical-row uniqueness at the common blocker gives `K_O=Kxv`.  Since the source `O` belongs to `K_O`, this would put `O` in `Kxv`, contrary to (A5.U52q). QED.

This argument is independent of the physical trace of `Kc`; it is available in every escape subtype and every non-escape U branch.

**Status:** [DERIVED AND PROVED IN PROSE; ONE APEX ROW COLLISION CLOSED]

###### A5.13j6c. Conditional coordinate analysis of `O\in Kc` when `xv\in Kc`

> **Lean closure annotation — [LEAN-NOT-A-CLOSER].** The final radius bound uses an unexported placement of `t`; this section is retained as conditional algebra and must not be promoted to a current-leaf proof without a producer for that placement.

> **Audit correction.**  The circumcenter formula and the first two cases are valid.  The bound used to close the third case invokes a placement inequality involving `t` that is not presently a proved A5 interface.  Accordingly, only the formula and the resulting bounded subcases are retained unconditionally.


Assume

\[
xv\in K_c.
\tag{A5.U52s}
\]

Then

\[
O\notin K_c.
\tag{A5.U52t}
\]

In particular, in the pure-escape singleton trace `Kc\cap C=\{xv\}`, the actual blocker of `O` cannot equal `d`.

**Proof.**  Suppose `O\in Kc`.  Continue with the normalization of A5.13j6a, but write

\[
p=\cos\alpha,
\qquad
s=\sin\alpha.
\]

Thus

\[
O=(0,0),
\quad
u=(p,-s),
\quad
xv=(p,s),
\quad
c=(R,0),
\tag{A5.U52u}
\]

where `0<\alpha<\pi/4`.  The strict order and convexity at `u,c,xv` give `R>p`; convexity at `c,xv,xu` gives

\[
R<\frac{p}{\cos2\alpha}.
\tag{A5.U52v}
\]

Write `t=(cos tau,sin tau)`.  The physical order gives

\[
3\alpha-\pi<\tau<-\alpha.
\tag{A5.U52w}
\]

Because `Kc` is centered at `d` and contains `O,c,xv`, the point `d` is the circumcenter of those three points.  Directly from the perpendicular bisectors,

\[
d=
\left(
\frac R2,
\frac{1-Rp}{2s}
\right).
\tag{A5.U52x}
\]

We first prove

\[
R<\frac{1+s}{p}.
\tag{A5.U52y}
\]

If `s<1/2`, then (A5.U52v) suffices, because

\[
\frac{1+s}{p}-\frac{p}{\cos2\alpha}
=
\frac{s(1+s)(1-2s)}{p\cos2\alpha}>0.
\]

Assume instead `s\ge1/2`.  Put

\[
\Delta=\frac{\alpha-\tau}{2}.
\]

Equation (A5.U52w) gives

\[
\alpha<\Delta<\frac\pi2-\alpha.
\]

Strict convexity at the consecutive points `t,u,c` says

\[
0<\operatorname{orient}(t,u,c)
=R(\sin\alpha+\sin\tau)-\sin(\alpha+\tau).
\]

Both terms used as the divisor are negative, so division reverses the inequality and yields

\[
R<
\frac{\sin(\alpha+\tau)}
     {\sin\alpha+\sin\tau}
=
\frac{\cos(\Delta-\alpha)}{\cos\Delta}
=p+s\tan\Delta
<2p.
\]

Since `s\ge1/2`,

\[
2p\le\frac{1+s}{p}.
\]

This proves (A5.U52y).

Now split according to `R`.

**Case 1: `R<1/p`.**  The triangle `Ocxv` is acute.  Indeed, the scalar products at its three vertices are respectively

\[
Rp>0,
\qquad
R(R-p)>0,
\qquad
1-Rp>0.
\]

Its circumcenter `d` therefore lies strictly inside `conv\{O,c,xv\}`, contradicting convex independence.

**Case 2: `R=1/p`.**  The triangle is right at `xv`, so `d` is the midpoint of the hypotenuse `Oc`.  Thus `d` lies in the open segment `Oc`, again contradicting convex independence.

**Case 3: `R>1/p`.**  Define

\[
\begin{aligned}
\lambda_O&=
\frac{2R-p(R^2+1)}{2Rs^2},\\
\lambda_c&=
\frac{p-R\cos2\alpha}{2Rs^2},\\
\lambda_u&=
\frac{Rp-1}{2s^2}.
\end{aligned}
\tag{A5.U52z}
\]

These coefficients sum to one, and substitution in (A5.U52x) gives

\[
d=\lambda_O O+\lambda_c c+\lambda_u u.
\tag{A5.U52aa}
\]

All three coefficients are positive:

- `lambda_u>0` because `R>1/p`;
- `lambda_c>0` by (A5.U52v); and
- `lambda_O>0` because the two roots of
  `pR^2-2R+p` are `(1-s)/p` and `(1+s)/p`, while
  \[
  \frac{1-s}{p}<\frac1p<R<\frac{1+s}{p}
  \]
  by (A5.U52y).

Thus `d` lies strictly inside `conv\{O,c,u\}`, again impossible.

All cases contradict convex independence, proving (A5.U52t).  If `\beta(O)=d`, canonical-row uniqueness would identify `K_O` with `Kc` and put `O\in Kc`; hence that blocker collision is impossible whenever `xv\in Kc`. QED.

**Status:** [PARTIALLY AUDITED COORDINATE CALCULATION; THE FINAL RADIUS BOUND USES AN UNEXPORTED PLACEMENT OF `t` AND IS NOT LOAD-BEARING]

###### A5.13j6d. The first pure-escape matching extension has an exact metric table

> **Lean closure annotation — [LEAN-NOT-A-CLOSER].** Only the explicitly audited inequalities are unconditional. The angular rows depending on the unsupported full physical order are diagnostic normal forms, not current `sorry` closers.

Assume pure escape, so `z=c`, `e=d`, and the two carrier points outside the six-source/six-blocker union include `O`. Put

\[
h=\beta(O).
\]

The unconditional blocker exclusion is

\[
h\ne c,
\tag{A5.U52ab}
\]

by A5.13j6b.

In the opposite-adjacent-cap branch (A5.U84), the complete physical angular order is available. In that branch, if the physical trace of `Kc` is `{xv}`, the conditional calculation of A5.13j6c applies and gives

\[
h\ne d.
\tag{A5.U52ac}
\]

Outside the opposite-side branch, `h=d` remains a live collision and must be routed through one of the three physical-blocker collision children of A5.13j6v.

The collision `h=xv` already gives the exact equation

\[
\alpha=\pi/6.
\]

In the opposite-side branch, collisions with the other three physical-cycle blockers have the following exact angular consequences:

\[
\begin{array}{c|c}
\text{blocker collision} & \text{forced metric condition}\\
\hline
h=a & 3\alpha-\tau>\pi/2,\\
h=b & \nu-\tau>\pi/2,\\
h=g & \nu-\alpha>\pi/2.
\end{array}
\tag{A5.U52ad}
\]

**Proof.** If `h=xv`, then canonical uniqueness gives `K_O=K_u`, so `O\in K_u`. The row centered at `xv` contains `u,xu`; after unit normalization,

\[
|xv-u|=|xv-xu|=2\sin\alpha.
\]

Since `|xv-O|=1`, one obtains `2\sin\alpha=1`; the proved nested interval gives `0<\alpha<\pi/4`, hence `\alpha=\pi/6`.

Under (A5.U84), if `h=a`, canonical uniqueness gives `O\in K_{xu}`. Thus `a` is the circumcenter of `O,xu,t`, and the angle at `O` is the displayed separation `3\alpha-\tau\in(0,\pi)`. An acute or right triangle would place the circumcenter inside the triangle or on the open opposite side, contradicting convex independence. Hence the angle is obtuse. The `h=b` and `h=g` rows are identical, using `O,t,v` and `O,v,xv`. QED.

Accordingly, a first pure-escape matching step produces one of:

1. a genuinely new blocker `h`;
2. the unconditional metric row `h=xv` with `\alpha=\pi/6`;
3. in the opposite-side branch, one of the three obtuse-angle rows in (A5.U52ad);
4. the collision `h=d`, except where the opposite-side `{xv}` subcase has been eliminated; or
5. one of the three physical-blocker collision children from A5.13j6v.

No item in this list is silently treated as `False`.

**Status:** [AUDITED CONDITIONAL METRIC NORMAL FORM; ONLY `h\ne c` AND THE `h=xv` EQUATION ARE UNCONDITIONAL]
###### A5.13j6e. The late first-apex blocker fiber is exactly the first-apex class

> **Lean closure annotation — [LEAN-HELPER-READY].** This exact fiber identity follows from the public late-system API and should be formalized as a reusable adapter for the A5 escape classifier.

Let

\[
J=S.\operatorname{oppApex1},
\qquad
Q=\operatorname{SelectedClass}(A,J,r_1),
\qquad
H_{\mathrm{late}}=\operatorname{lateFirstApexSystem}(R).
\tag{A5.U64a}
\]

The retained frontier points satisfy

\[
q,w\in Q,
\tag{A5.U64b}
\]

and the production override gives, for every carrier source `x`,

\[
H_{\mathrm{late}}.\operatorname{centerAt}(x)=J
\quad\Longleftrightarrow\quad
x\in Q.
\tag{A5.U64c}
\]

Since the anchor `q` belongs to `Q`, its late blocker is `J`. Therefore

\[
\operatorname{actualBlockerFiber}(H_{\mathrm{late}},q)
=
\{x\in A:x\in Q\}.
\tag{A5.U64d}
\]

Taking the complement in the carrier gives

\[
\operatorname{outsideFirstApexFiber}(R)
=
\{x\in A:x\notin Q\},
\tag{A5.U64e}
\]

and hence, for every carrier source `x`,

\[
x\in\operatorname{outsideFirstApexFiber}(R)
\quad\Longleftrightarrow\quad
x\notin Q
\quad\Longleftrightarrow\quad
H_{\mathrm{late}}.\operatorname{centerAt}(x)\ne J.
\tag{A5.U64f}
\]

**Proof.** The public theorems `frontier_pair_q_mem_firstApexClass` and `frontier_pair_w_mem_firstApexClass` give (A5.U64b). Apply `lateFirstApexSystem_centerAt_eq_iff_mem_class` to `q` and then to an arbitrary source `x`. Membership in `actualBlockerFiber Hlate q` is equality of the two late blocker vertices, hence equality with `J`; (A5.U64c) converts that equality back to class membership. Complementing in `Finset.univ` proves (A5.U64e)--(A5.U64f). QED.

**Source boundary.** The API statements used here were source-read at commit `bc4c04db398979c57edaf4af9c60e1eae984f436`. The displayed combined identity is a prose-derived adapter, not a freshly elaborated declaration in this manuscript.

**Status:** [DERIVED IN PROSE FROM THE PUBLIC LATE-SYSTEM API]

###### A5.13j6f. Exact outside-fiber and good-source cardinalities at twelve points

> **Lean closure annotation — [LEAN-HELPER-READY].** The exact counts `8` and `≥6` are complete finite-set deductions and should be added as exact-twelve helper lemmas.

The class `Q` has cardinality four and `|A|=12`. Equation (A5.U64e) therefore gives

\[
\bigl|\operatorname{outsideFirstApexFiber}(R)\bigr|=8.
\tag{A5.U65}
\]

Together with `badOutsideSources_card_le_two`, this sharpens the reusable good-source estimate to

\[
\bigl|\operatorname{goodOutsideSources}(R)\bigr|\ge6.
\tag{A5.U66}
\]

These counts remove the slack in the first-apex-fiber part of the exact-twelve classifier. They are not, by themselves, a contradiction.

**Status:** [DERIVED EXACT CARDINALITIES]

###### A5.13j6g. The physical five-class is disjoint from the first-apex class

> **Lean closure annotation — [LEAN-HELPER-READY].** The disjointness proof and the exact `5+4+3` carrier partition are complete prose deductions from the late-system API and physical-cycle blocker injectivity.

One has

\[
C\cap Q=\varnothing.
\tag{A5.U67}
\]

**Proof.** Suppose a physical source `x` belonged to `Q`. By (A5.U64c), its late blocker would be `J`, and `lateFirstApexSystem_support_eq_class` would identify its complete late support with `Q`. The A5 physical five-cycle traces are already stated for the same late system. The trace at `x` contains a second physical source `x^+`, so `x^+\in Q`; (A5.U64c) gives late blocker `J` for `x^+` as well. This contradicts the proved pairwise distinctness of the five physical-cycle blockers

\[
\beta(u),\beta(xu),\beta(t),\beta(v),\beta(xv)
=
xv,a,b,g,c.
\]

QED.

Writing `N=A\setminus C`, equations (A5.U65) and (A5.U67) give the exact partition

\[
A=C\mathbin{\dot\cup}Q\mathbin{\dot\cup}E,
\qquad
|C|=5,\quad |Q|=4,\quad |E|=3,
\tag{A5.U68}
\]

where

\[
E=\operatorname{outsideFirstApexFiber}(R)\setminus C.
\tag{A5.U69}
\]

In particular, `q,w\in Q\subseteq A\setminus C`.

**Status:** [DERIVED CLASS-SEPARATION AND EXACT `5+4+3` PARTITION]

###### A5.13j6h. Correct apex statements

> **Lean closure annotation — [LEAN-HELPER-READY].** The first-apex exclusion is a direct positive-radius lemma; the physical-apex nonclassification is a scope guard. Formalizing both prevents unsound case elimination in the A5 proof.

The first apex is the center of `Q`, not a member of it:

\[
J\notin Q.
\tag{A5.U69a}
\]

Indeed, membership would imply `dist J J=r1`, contradicting `frontier_radius_pos F`.

No analogous class-membership decision is available for the physical apex `O=S.oppApex2` from the class definition alone:

\[
O\in Q
\quad\Longleftrightarrow\quad
\operatorname{dist}(J,O)=r_1.
\tag{A5.U69b}
\]

Thus the prose may not place `O` inside or outside `Q` without an additional metric theorem. Likewise, the four-point identity for the strict second-cap interior does not by itself classify the two boundary endpoints of the six-point closed cap relative to `C`.

**Status:** [CORRECTED SCOPE; FIRST APEX EXCLUDED, PHYSICAL APEX UNCLASSIFIED]

###### A5.13j6i. Exact late-system split for a pure escape source

> **Lean closure annotation — [LEAN-HELPER-READY].** This is an exact two-way blocker/support classifier for pure escape. It should be a typed Lean branch packet, but neither geometric child is yet contradictory.

In pure escape the uncovered source is `z=c`, and its actual late blocker is `d=\beta(c)`. Equations (A5.U64c)--(A5.U64f) give exactly two cases:

\[
\begin{array}{lll}
\mathsf{PE}_{Q}:&
c\in Q,&
d=J\ \text{and}\ K_c=Q,\\[1mm]
\mathsf{PE}_{E}:&
c\notin Q,&
c\in E\ \text{and}\ d\ne J.
\end{array}
\tag{A5.U69c}
\]

There is no third case. Since `C\cap Q=\varnothing`,

\[
\mathsf{PE}_{Q}
\quad\Longrightarrow\quad
K_c\cap C=\varnothing.
\tag{A5.U69d}
\]

Every nonempty physical trace of `Kc` therefore lies in `PE_E`. In the empty-trace arm, `d=J` is now equivalent to `c\in Q`; it is not an informal blocker identification.

If a later matching step gives `\beta(O)=d` in `PE_Q`, then

\[
\beta(O)=J
\quad\Longleftrightarrow\quad
O\in Q
\tag{A5.U69e}
\]

by (A5.U64c). This records the exact remaining physical-apex metric branch.

**Status:** [PURE-ESCAPE FIBER LOGIC CLOSED; GEOMETRIC EXCLUSION OF BOTH ARMS OPEN]

###### A5.13j6o. Opposite-side lemma for two carrier bisector centers

> **Lean closure annotation — [LEAN-HELPER-READY].** This coordinate-free opposite-side theorem has a complete prose proof and should be promoted as a generic convex-geometry helper.

Let `A` be strictly convex, and let `r,s,p_0,p_1` be four distinct carrier points.  Assume

\[
|p_0r|=|p_0s|,
\qquad
|p_1r|=|p_1s|.
\tag{A5.U70}
\]

Then `p0` and `p1` lie in opposite open half-planes determined by the line `rs`.

**Proof.**  Both centers lie on the perpendicular bisector of `rs`.  Let `m` be the midpoint of `rs`, let `n` be a unit normal to `rs`, and write

\[
p_0=m+\lambda n,
\qquad
p_1=m+\mu n.
\]

Neither coefficient is zero, because the midpoint of two carrier vertices lies in the open segment `rs` and hence is not a carrier vertex of a strictly convex finite set.  If `lambda` and `mu` had the same sign, relabel so that `0<|lambda|<|mu|`.  Then

\[
p_0=
\frac{|\lambda|}{|\mu|}p_1
 +\frac{1-|\lambda|/|\mu|}{2}r
 +\frac{1-|\lambda|/|\mu|}{2}s.
\tag{A5.U71}
\]

All three coefficients are positive and sum to one.  Hence `p0` lies strictly inside `conv{p1,r,s}`, contradicting convex independence.  Therefore `lambda*mu<0`. QED.

Equivalently, the four carrier points alternate in cyclic boundary order:

\[
\operatorname{Sep}(r,s;p_0,p_1).
\tag{A5.U72}
\]

This strengthens the previously used no-three-collinear bisector rule.  The latter merely forbids a third center; (A5.U72) records the orientation forced by the two centers that do exist.

**Status:** [DERIVED AND PROVED IN PROSE]

###### A5.13j6p. Every physical critical row carries an exact boundary-separation certificate

> **Lean closure annotation — [LEAN-HELPER-READY].** This is the source-supported replacement for the earlier unsupported global angular order. It should be formalized before any remaining A5 coordinate branch.

Let `x_i,x_{i+1}` be the two physical-class members of one of the five exact cycle rows, and let `p_i` be that row's center.  The physical apex `O` and `p_i` are two distinct carrier centers equidistant from `x_i,x_{i+1}`.  Therefore

\[
\operatorname{Sep}(x_i,x_{i+1};O,p_i).
\tag{A5.U73}
\]

After cutting the cyclic boundary order at `O`, the point `p_i` lies strictly in the linear boundary interval between `x_i` and `x_{i+1}`.  Applied to the five rows, this gives

\[
\begin{aligned}
&xv\in (u,xu)_O,\\
&a\in (xu,t)_O,\\
&b\in (t,v)_O,\\
&g\in (v,xv)_O,\\
&c\in (xv,u)_O.
\end{aligned}
\tag{A5.U74}
\]

Here `(r,s)_O` denotes the open boundary interval between `r` and `s` that does not contain `O`.  The first and last relations refine to the already proved strict-cap order

\[
u<c<xv<xu
\tag{A5.U75}
\]

in the physical second-cap interval.

In an orthonormal frame centered at `O`, (A5.U73) also selects the outward branch of the perpendicular bisector.  Thus the polar direction of `p_i` is the midpoint direction of the physical chord `x_ix_{i+1}` on the `O`-avoiding arc.  This midpoint statement is valid without assuming that `t` or `v` is a Moser endpoint.

**Status:** [DERIVED AND PROVED IN PROSE; SOURCE-INDEPENDENT REPLACEMENT FOR THE UNSUPPORTED FULL ANGULAR ORDER]

###### A5.13j6q. Exact refinement of the adjacent common-omission child

> **Lean closure annotation — [LEAN-HELPER-READY].** The finite refinement is exhaustive and implementation-ready, but its terminal metric contradiction remains open.

Assume consecutive physical sources `x_i,x_{i+1}` omit the same retained deletion `delta`.  Let `epsilon` be the other member of `{q,w}`.  There are three disjoint row types.

1. **Double-singleton.**  Both rows contain `epsilon`.  Then the two exact rows share the two points `x_{i+1},epsilon`.  Their distinct centers satisfy
   \[
   \operatorname{Sep}(x_{i+1},\epsilon;p_i,p_{i+1}).
   \tag{A5.U76}
   \]
   Since two distinct circles already share these two points, their remaining two support points are pairwise distinct.

2. **Left-free.**  The row at `p_i` omits both `q,w`; the row at `p_{i+1}` contains `epsilon` and omits `delta`.

3. **Right-free or double-free.**  The reflected case, including the possibility that both rows omit both retained points.

In every type the complementary deletion matrix of A5.13j6i remains valid.  In the double-singleton type it is augmented by the forced cyclic separation (A5.U76).  In a free type, the free row has both outside supports in

\[
(Q\setminus\{q,w\})\mathbin{\dot\cup}E,
\tag{A5.U77}
\]

and hence exposes an exact first-apex-class member or an `E`-support pair.  These alternatives must not be merged: only the double-singleton child has a proved second shared row point.

**Status:** [DERIVED EXHAUSTIVE REFINEMENT; TERMINAL METRIC CONTRADICTION OPEN]

###### A5.13j6r. Exact orientation core in the exceptional alternating child

> **Lean closure annotation — [LEAN-HELPER-READY].** The six-separation orientation packet is prose-complete. The following stress test shows that it is a normal form rather than a contradiction.

Assume the exceptional alternating pattern, and cyclically relabel so that the unique bad physical row is

\[
K_0=\{x_0,x_1,q,w\}
\tag{A5.U78}
\]

with center `p0`.  Up to swapping `q,w`, the two neighboring rows have the forms

\[
K_1=\{x_1,x_2,w,r_1\},
\qquad
K_4=\{x_4,x_0,q,r_4\}.
\tag{A5.U79}
\]

The opposite-side lemma gives four simultaneous, source-faithful orientation constraints:

\[
\begin{aligned}
&\operatorname{Sep}(x_0,x_1;O,p_0),\\
&\operatorname{Sep}(q,w;J,p_0),\\
&\operatorname{Sep}(x_1,w;p_0,p_1),\\
&\operatorname{Sep}(x_0,q;p_4,p_0).
\end{aligned}
\tag{A5.U80}
\]

The first two come from the physical and first-apex circles; the last two come from the exact two-point intersections `K0∩K1={x1,w}` and `K4∩K0={x0,q}`.  In addition,

\[
\operatorname{Sep}(x_1,x_2;O,p_1),
\qquad
\operatorname{Sep}(x_4,x_0;O,p_4).
\tag{A5.U81}
\]

Every exact realization of the alternating child must realize (A5.U78)--(A5.U81), the remaining two alternating rows, and the exact `5+4+3` carrier partition.  This is the smallest orientation packet that a finite certificate or an analytic proof may consume.

**Status:** [DERIVED AND PROVED IN PROSE; EXACT ORIENTATION CORE]

###### A5.13j6s. The orientation core alone is satisfiable

> **Lean closure annotation — [LEAN-NOT-A-CLOSER].** This finite witness rules out an orientation-only closure theorem. It is a rejection test, not a proof task.

The separation relations (A5.U80)--(A5.U81) are not themselves contradictory as an abstract circular-order system.  A direct finite check finds a cyclic order satisfying the four central constraints; one representative order for the displayed labels is

\[
\text{O — J — p1 — p4 — x0 — w — p0 — x1 — q}.
\tag{A5.U82}
\]

The omitted physical labels can be inserted in the unconstrained intervals while preserving the six displayed separations.  Thus a proof that stops at `Sep` predicates would overclaim.  The missing step must use at least one of:

- the equal-radius equations within each complete four-row;
- the exact radial midpoint branch selected by (A5.U73);
- cap membership and the `5,4,6` strict-interior capacities;
- the first-apex circle equations for all four members of `Q`; or
- a checked `ShellMetricCoreAlternative` replay.

**Status:** [FINITE ORDER-TYPE STRESS TEST; ORIENTATION-ONLY CLOSURE RULED OUT]

###### A5.13j6t. Corrected status of the earlier coordinate sublemmas

The following status distinctions are now load-bearing.

- `O∉Kxv` from A5.13j6b uses only the nested midpoint packet `u,c,xv,xu`, the `O`-visible semicircle bound, and the acute-triangle circumcenter fact.  It remains a valid prose theorem.
- The claimed exclusion of the pure trace `{t,xv}` in A5.13j6a additionally chose a full angular placement of `t`.  That placement is not presently exported, so the exclusion is conditional.
- The final case of A5.13j6c uses a radius bound derived from the same unexported `t` placement.  The circumcenter formula and the two bounded subcases remain useful; the unconditional conclusion `O∉Kc` is not yet available from that subsection.
- The rows in A5.13j6d are exact consequences *once* the indicated physical angular separations are interpreted on the `O`-visible branch.  They are metric branch conditions, not contradictions by themselves.

Accordingly, no escape trace or blocker collision is counted as closed merely because one of the conditional coordinate calculations reaches a convex-hull contradiction.

**Status:** [AUDIT COMPLETE; UNSUPPORTED CLOSURE CLAIMS REMOVED]

###### A5.13j6u. Exhaustive adjacent-cap slot classifier for the three remaining physical blockers

> **Lean closure annotation — [LEAN-HELPER-READY AFTER ONE SOURCE ADAPTER].** The finite predicate is decidable, but the published CSV also excludes the variable blockers from slot `J`.  That source fact must be proved explicitly before the classifier is invoked.  The classifier does not itself produce `False`.

Cut the carrier boundary at `O`.  The exact cap profile gives two nonphysical chains of strict-interior capacities two and three, separated from the four-point physical second-cap chain by the Moser apices `J,K`.  Impose the interval constraints (A5.U74), blocker injectivity, center-not-in-row, and the additional source predicate `a≠J ∧ b≠J ∧ g≠J` encoded by the published CSV.  The resulting finite role-placement problem is completely enumerable.  Without the last predicate, the stated finite model has 344 assignments rather than 178, so it may not remain implicit.

| Side of `t` | Side of `v` | Number of role assignments | One representative |
|---|---|---:|---|
| `R` | `R` | 0 | `—` |
| `R` | `L` | 100 | `t=R1, v=K, a=R2, b=u, g=xu` |
| `L` | `R` | 68 | `t=L1, v=R1, a=K, b=R2, g=u` |
| `L` | `L` | 10 | `t=L1, v=L3, a=K, b=L2, g=xu` |

The accompanying CSV lists every assignment.  The enumeration is deliberately conservative: unnamed slots may later be identified with `q,w`, the remaining first-apex-class points, or the three `E` points.  Therefore a surviving row is a genuine order-theoretic possibility, not a Euclidean realization.

This finite check has two consequences.

1. The boundary-interval and cap-capacity data do not by themselves close the escape arm.
2. Every remaining proof may split on this finite table rather than use an unproved global angular order for `t,v`.  A terminal must add the exact circle equations, a source identity excluded upstream, or a shell-metric certificate.

**Status:** [FINITE ENUMERATION VERIFIED; SOURCE-TO-CLASSIFIER ADAPTER `a,b,g≠J` STILL REQUIRED]

###### A5.13j6v. Cap-slot forcing: opposite physical sides or one of three blocker collisions

> **Lean closure annotation — [LEAN-HELPER-READY AFTER THE `a,b,g≠J` ADAPTER].** The opposite-side versus same-side split is disjoint.  Inside the same-side branch, `g=xu`, `g=t`, and `a=v` are only a covering disjunction and overlap; they are not three disjoint terminal constructors.

Conditional on the complete finite predicate of A5.13j6u, exactly one of these two top-level alternatives holds:

1. `t` and `v` lie in the two different adjacent-cap boundary chains; or
2. the physical blocker identities satisfy
   \[
   g=xu
   \quad\lor\quad
   g=t
   \quad\lor\quad
   a=v.
   \tag{A5.U83}
   \]

There is no realization in which `t,v` both lie on the two-point side.  If they both lie on the three-point side, every slot assignment forces one of the three equalities in (A5.U83).

**Proof.**  Cut at `O` and use the exact strict-interior slot sequence

\[
R_1,R_2,J,u,c,xv,xu,K,L_1,L_2,L_3.
\]

The interval constraints (A5.U74), center-not-in-row, and pairwise distinctness of `xv,a,b,g,c` form a finite order problem.  On the two-slot side, `b` can occur only when `t,v` occupy the two endpoints with one slot between them; then both `a` and `g` are forced to `u`, contradicting blocker injectivity.  On the three-slot side, direct interval enumeration gives precisely the alternatives `g=xu`, `g=t`, or `a=v`.  The machine-readable enumeration is the CSV attached to A5.13j6u. QED.

In the first alternative, the valid full physical angular order is, up to reflection,

\[
t<u<c<xv<xu<v
\tag{A5.U84}
\]

with the two Moser boundary vertices inserted between `t,u` and `xu,v` as dictated by the cap packet.  Thus the coordinate calculations in A5.13j6a and A5.13j6c become applicable only in this opposite-side branch.  In the second alternative they must be replaced by one of three explicit physical blocker-collision theorems.

**Status:** [TOP-LEVEL SIDE SPLIT VERIFIED CONDITIONALLY; SAME-SIDE BRANCH REQUIRES THE EXACT TEN-CELL DISPATCHER OF A5.13j8a]

###### A5.13j7. Exact remaining escape theorem

The escape arm is now exhaustively specified by a common ingress and two top-level geometric children.

The common ingress consists of:

1. the exact carrier partition
   \[
   A=C\mathbin{\dot\cup}Q\mathbin{\dot\cup}E,
   \qquad (|C|,|Q|,|E|)=(5,4,3);
   \]
2. the five deterministic physical-cycle rows and their source/blocker provenance;
3. a nonempty escape set `H=N\setminus Pcyc` and a source `z\in H`;
4. the exact canonical row `Kz` and its blocker `e=\beta(z)`;
5. the strict second-cap order `u<c<xv<xu`;
6. the pair-codegree and no-physical-edge filters of A5.13j1 and A5.13j4;
7. the matching-extension/row-collision producer of A5.13j5a;
8. the `Q`-escape versus `E`-escape split from A5.13j6e--A5.13j6i;
9. the pure-escape versus simultaneous-cross-hit tag; and
10. the literal retained deletion `q` or `w`, with its source-authenticated survival clause.

A5.13j6v gives the exhaustive geometric split.

**Child O — opposite adjacent-cap chains.** The two remaining physical points `t,v` lie on opposite adjacent-cap chains, so, up to reflection, the full physical order is

\[
t<u<c<xv<xu<v.
\]

Only in this child may the full angular calculations of A5.13j6a and A5.13j6c be used. They eliminate the two-physical-hit pure trace and the indicated `O\in Kc` subcase here, not globally. The remaining opposite-side terminals are:

- pure escape with empty or singleton physical trace;
- the `PE_Q`/`PE_E` blocker split;
- the matching-extension outputs of A5.13j5a;
- the unconditional `h=xv,\alpha=\pi/6` row;
- the three conditional obtuse-angle rows of A5.13j6d;
- simultaneous cross-hit/escape products surviving A5.13k; and
- any new blocker extension not absorbed by a canonical-row collision.

**Child C — exact same-side slot cells.** The collision disjunction

\[
g=xu\;\lor\;g=t\;\lor\;a=v
\]

holds, but its three labels overlap and do not define a partition.  The exact classifier has ten same-side cells.  A5.13j8a proves the seventh cell impossible from the full outward-midpoint equations and gives exact rational physical-core witnesses for the other nine.  Therefore the source-faithful child is an exact ten-cell dispatcher followed by a nine-cell residual, not three coarse collision terminals.

Every residual constructor retains the other four physical rows, the late `5+4+3` partition, every source omission, the `q/w` deletion tag, the escape row, and the boundary-separation certificates.  A residual terminal must use at least one full-A5 ingredient absent from the physical core: unnamed K4 support members, late-fiber identities, retained-deletion synchronization, matching-extension data, or a checked `ShellMetricCoreAlternative`.

The exact remaining theorem is therefore:

> **A5 U-escape exclusion.** No twelve-point convexly independent A5 carrier realizes the common ingress together with Child O or one of the nine residual same-side cells `1,2,3,4,5,6,8,9,10`.

**Status:** [ONE SAME-SIDE CELL CLOSED; ONE OPPOSITE-SIDE FAMILY AND NINE EXACT FULL-A5 SAME-SIDE CELLS OPEN]

The exact closure program, theorem interfaces, finite coverage obligations, and rejection tests are given in A5.13j8.


###### A5.13j8. Exact next-step program for closing the escape theorem

> **Lean closure annotation — [LEAN-HELPER-READY].** This section is a fully specified research and implementation program. It is not itself a proof of the escape theorem, but it fixes the remaining theorem interfaces, case coverage, and certificate obligations so that no later agent may replace the missing geometry with an incidence-only shortcut.

The escape theorem must now be attacked through the two children of A5.13j7. The correct order is to close the three physical-blocker collisions first and only then enumerate the residual opposite-side cells.

**Phase E0 — promote the common escape API.** Formalize, in dependency order:

1. the late-fiber equivalence and exact partition
   \[
   A=C\mathbin{\dot\cup}Q\mathbin{\dot\cup}E,
   \qquad (|C|,|Q|,|E|)=(5,4,3);
   \]
2. the opposite-side lemma for two carrier centers on one perpendicular bisector;
3. the five boundary-separation certificates for the physical critical rows;
4. the cap-slot classifier A5.13j6u and its conclusion A5.13j6v;
5. the matching-extension/row-collision producer A5.13j5a; and
6. the source-faithful `q/w` deletion-behavior classifier.

These are ordinary helper lemmas. Their acceptance test is that the later escape theorem contains no anonymous chosen row, no unproved equality of independent radii, and no implicit use of the full physical order outside Child O.

**Phase E1 — use the exact ten-cell same-side dispatcher.**  The former theorem names

```text
false_of_A5_escape_g_eq_xu
false_of_A5_escape_g_eq_t
false_of_A5_escape_a_eq_v
```

are rejected as terminal interfaces: the labels overlap, and nine exact rational physical-core witnesses satisfy the corresponding collision equations together with all five physical midpoint equations.  Replace them by:

```text
a5_escape_variableBlockers_ne_J
a5_escape_slotAssignment_valid
a5_escape_sameSide_exactTen
false_of_A5_escape_sameSide_cell7
A5EscapeSameSideResidualCell  -- constructors 1,2,3,4,5,6,8,9,10
```

The first theorem supplies the classifier premise omitted from the prose but encoded by the CSV.  The second transports the source packet into the decidable finite predicate.  The third is `native_decide` coverage.  The fourth consumes the generic cocircular nested-bisector contradiction from A5.13j8a.  The residual type retains the full A5 packet and exact role-to-slot equalities; it must not be weakened to one blocker equality.

**Phase E2 — expose the complete Child O order.** In the opposite-adjacent-cap child, formalize the order adapter

\[
t<u<c<x_v<x_u<v
\]

up to a single explicit reflection. Only beneath this adapter may the coordinate arguments of A5.13j6a, A5.13j6c, and the conditional rows of A5.13j6d be invoked. Reprove each conditional result as a theorem whose first argument is the Child O packet, so that Lean cannot apply it in a collision child.

**Phase E3 — construct the residual Child O cell matrix.** After applying the already closed trace and collision children, enumerate only source-faithful explicit-class cells. A cell must record:

- `Q`-escape or `E`-escape;
- pure escape or simultaneous cross hit;
- the remaining physical trace of the escape row;
- the exact `q`- or `w`-deletion behavior;
- every selected support as a named four-element set with its own center and radius;
- the first matching-extension outcome: new blocker or one named canonical-row collision;
- all strict boundary-order and cap-membership predicates used by replay; and
- all center/source inequalities.

The finite reduction has two independent proof obligations:

\[
\text{A5 Child O source packet}
\Longrightarrow
\text{one listed cell},
\tag{A5.E1}
\]

and

\[
\text{each listed cell}
\Longrightarrow
\bot\ \text{or a named metric core}.
\tag{A5.E2}
\]

No certificate bank is accepted until both implications are proved.

**Phase E4 — replay metric cells.** Prefer a common analytic theorem when several cells share the same equal-chord or circumcenter mechanism. Use exact per-cell QF_NRA only for residual cells with every support and strict sign condition fixed in advance. A solver result is admissible evidence only when the input uses exact rational/algebraic literals, the source-to-formula transport is written down, and the output is replayed by an independently checkable certificate or a project-approved finite decision procedure. Numerical infeasibility and monolithic Boolean-selected supports do not close a cell.

**Phase E5 — assemble the escape theorem.** Define a typed dispatcher

```text
A5EscapeTerminal
  | oppositeSide (cell : A5OppositeSideCell)
  | sameSideCell7 (packet : A5SameSideCell7Packet)
  | sameSideResidual (cell : A5EscapeSameSideResidualCell)
```

and prove coverage and replay separately:

```text
a5_escape_terminal_of_source_packet :
  A5EscapeSourcePacket -> A5EscapeTerminal

false_of_a5_escape_sameSideCell7 :
  A5SameSideCell7Packet -> False

false_of_a5_escape_oppositeSide :
  A5OppositeSideCell -> False

false_of_a5_escape_sameSideResidual :
  A5EscapeSameSideResidualCell -> False
```

Only the Cell 7 replay is now prose-closed.  The last two replay theorems remain the genuine escape frontier.

**Priority.** First prove the missing `a,b,g≠J` source adapter and kernel-check the exact ten-cell dispatcher.  Then close Cell 7 through the generic nested-bisector theorem.  For the nine residual cells, expose complete named supports and deletion semantics before metric search.  Work on Child O only under its explicit order adapter.

**Hard rejection tests.**

- Do not infer a common circle from cap membership.
- Do not identify two post-deletion rows from a common center without canonical-support uniqueness.
- Do not use A5.13j6a or A5.13j6c outside Child O.
- Do not treat the matching-extension producer as a contradiction.
- Do not enumerate incidence hypergraphs without cyclic order and metric equations.
- Do not claim complete escape closure until both coverage (A5.E1) and replay (A5.E2) are proved.

**Status:** [FINITE COLLISION FRONTIER CORRECTED; CELL 7 PROSE-CLOSED; NINE FULL-A5 SAME-SIDE CELLS AND CHILD-O COVERAGE/REPLAY REMAIN OPEN]

###### A5.13j8a. Collision-leaf audit: one metric cell closes and nine survive

> **Lean closure annotation — [LEAN-CONSUMER-READY / SOURCE-ADAPTER-OPEN].** This subsection supersedes the former proposal to prove three coarse terminals named only by `g=xu`, `g=t`, and `a=v`.  The exact finite table and the linear midpoint consumer are completely specified.  One of the ten same-side cells is contradictory.  The other nine have exact rational Euclidean witnesses for the entire physical/order core, so no theorem using only that core may conclude `False`.

**Audit correction 1 — one source predicate was hidden by the CSV.**  The published 178-row table is recovered exactly from the eleven-slot sequence

\[
R_1,R_2,J,u,c,xv,xu,K,L_1,L_2,L_3
\]

using the stated role exclusions, the three open-interval constraints, pairwise distinctness of `xv,a,b,g,c`, center-not-source, **and**

\[
a\ne J,\qquad b\ne J,\qquad g\ne J.
\tag{A5.E3}
\]

Without (A5.E3), the same stated finite predicate has 344 assignments rather than 178, including two `R/R` assignments.  Thus (A5.E3) must be an explicit field of the source-to-slot adapter or proved immediately before the `native_decide` classifier.  It may not remain implicit in the CSV.  An apparent extra condition `t\ne K` is not independent: it already follows from `a\in(xu,t)` because `xu,K` are consecutive slots.

**Audit correction 2 — the three collision labels overlap.**  The ten same-side cells are:

| Cell | `t` | `v` | `a` | `b` | `g` | Collision labels | Midpoint status |
|---:|---|---|---|---|---|---|---|
| 1 | `L1` | `L3` | `K` | `L2` | `xu` | `g=xu` | exact physical-core witness |
| 2 | `L1` | `L3` | `K` | `L2` | `L1` | `g=t` | exact physical-core witness |
| 3 | `L2` | `K` | `K` | `L1` | `xu` | `g=xu`, `a=v` | exact physical-core witness |
| 4 | `L3` | `K` | `K` | `L1` | `xu` | `g=xu`, `a=v` | exact physical-core witness |
| 5 | `L3` | `K` | `K` | `L2` | `xu` | `g=xu`, `a=v` | exact physical-core witness |
| 6 | `L3` | `K` | `L1` | `L2` | `xu` | `g=xu` | exact physical-core witness |
| 7 | `L3` | `K` | `L2` | `L1` | `xu` | `g=xu` | **impossible by midpoint monotonicity** |
| 8 | `L3` | `L1` | `K` | `L2` | `xu` | `g=xu` | exact physical-core witness |
| 9 | `L3` | `L1` | `L1` | `L2` | `xu` | `g=xu`, `a=v` | exact physical-core witness |
| 10 | `L3` | `L1` | `L1` | `L2` | `K` | `a=v` | exact physical-core witness |

Consequently, `g=xu | g=t | a=v` is a useful covering disjunction but not a disjoint terminal type.  The correct same-side dispatcher has ten exact constructors, or nine after Cell 7 is removed.

**The complete midpoint layer.**  Choose a strictly increasing lifted direction `theta` along the displayed slot sequence.  The outward branch of the five physical perpendicular bisectors gives

\[
\begin{aligned}
2\theta(c)&=\theta(xv)+\theta(u),\\
2\theta(xv)&=\theta(u)+\theta(xu),\\
2\theta(a)&=\theta(xu)+\theta(t),\\
2\theta(b)&=\theta(t)+\theta(v),\\
2\theta(g)&=\theta(v)+\theta(xv).
\end{aligned}
\tag{A5.E4}
\]

This is the exact arithmetic output required from the cocircular-bisector adapter.  The adapter must use the common physical circle, convex cyclic order, the `O`-avoiding boundary-separation certificate, and the positive/outward bisector branch.  It must not infer (A5.E4) from cap membership alone.

**Cell 7 closes.**  Cell 7 has

\[
xu<v=K<b=L_1<a=L_2<t=L_3.
\]

Its `a`- and `b`-equations are

\[
2\theta(a)=\theta(xu)+\theta(t),
\qquad
2\theta(b)=\theta(v)+\theta(t).
\]

Since `theta(xu)<theta(v)`, subtraction gives `theta(a)<theta(b)`.  But the slot order gives `theta(b)<theta(a)`.  This is a direct `linarith` contradiction.  No escape-row support, deletion tag, or matching extension is needed in this one cell.

The preferred generic source-level theorem is:

```lean
theorem false_of_cocircular_twoNestedBisectors_swapped
    {A : Finset ℝ²} {n : ℕ} (hA : ConvexIndep A)
    {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ix iv ib ia it iO : Fin n} {rho : ℝ}
    (hxv : ix < iv) (hvb : iv < ib) (hba : ib < ia)
    (hat : ia < it) (htO : it < iO)
    (hrho : 0 < rho)
    (hOx : dist (phi iO) (phi ix) = rho)
    (hOv : dist (phi iO) (phi iv) = rho)
    (hOt : dist (phi iO) (phi it) = rho)
    (ha : dist (phi ia) (phi ix) = dist (phi ia) (phi it))
    (hb : dist (phi ib) (phi iv) = dist (phi ib) (phi it)) :
    False
```

A low-level implementation may prove this theorem through a reusable angle-lift packet, or directly through the existing perpendicular-bisector sum-direction API.  The angle-lift route has four mechanical sublemmas:

1. obtain a strict half-plane separator for the five vertices `x,v,b,a,t` relative to `O`; this is the radius-free generalization of `exists_strict_separating_vector_of_convexIndep_cocircular` (its current proof already uses common radius only to re-prove deletion from `O`);
2. turn the convex boundary inequalities into a strictly increasing real angle lift on that open half-plane;
3. use `exists_bisector_direction_ne_zero`, followed by the signed-side branch or `positive_parameter_of_strict_halfplane`, to show that the rays `Oa` and `Ob` have directions `(theta(x)+theta(t))/2` and `(theta(v)+theta(t))/2`; and
4. finish by `linarith` from `theta(x)<theta(v)` and `theta(b)<theta(a)`.

The branch-specific adapter is then only name transport:

```lean
theorem false_of_A5_escape_sameSide_cell7
    (X : A5EscapeCommonPacket D S H R P packet Q)
    (hcell : X.slotAssignment = A5SameSideCell.cell7) : False
```

After unfolding the names, instantiate the generic theorem with

```text
O = S.oppApex2,
x = packet.xu,
v = P.v.1,
b = centerAt deleted,
a = centerAt packet.xu,
t = P.jointDeletion.deleted.1.
```

The three equal-radius premises come from membership in the exact physical class.  The two equal-distance premises come from `Q.hdeletedXuRow`, `Q.hvDeletedRow`, and each selected shell's `support_eq_radius`.  The six index inequalities come from the Cell 7 slot constructor.

**Nine exact rejection witnesses.**  For every other cell, the following integral lifts satisfy strict slot order and all five equations (A5.E4):

| Cell | `(theta_R1,...,theta_L3)` |
|---:|---|
| 1 | `(-6,-4,-2,0,2,4,8,9,10,11,12)` |
| 2 | `(-6,-4,-2,0,2,4,8,9,10,13,16)` |
| 3 | `(-6,-4,-2,0,2,4,8,12,14,16,18)` |
| 4 | `(-6,-4,-2,0,2,4,8,12,14,15,16)` |
| 5 | `(-6,-4,-2,0,2,4,8,12,13,14,16)` |
| 6 | `(-6,-4,-2,0,2,4,8,12,14,16,20)` |
| 8 | `(-6,-4,-2,0,2,4,8,11,12,13,14)` |
| 9 | `(-6,-4,-2,0,2,4,8,10,12,14,16)` |
| 10 | `(-6,-4,-2,0,2,4,8,9,14,17,20)` |

These are not merely formal angle assignments.  Put

\[
\zeta=\left(\frac{9999}{10001},\frac{200}{10001}\right),
\qquad \varepsilon=10^{-8},
\]

identify `zeta` with a unit complex number, set `O=0`, and set the point in slot `s` to

\[
p_s=r_s\zeta^{\theta_s},
\qquad
r_s=\begin{cases}
1,&s\in\{u,xv,xu,t,v\},\\
1-\varepsilon,&\text{otherwise}.
\end{cases}
\tag{A5.E5}
\]

Exact rational arithmetic verifies, for all nine rows, that the twelve displayed points are strictly convex in the prescribed cyclic order, exactly the five physical points have distance one from `O`, the five blockers are distinct and not their own sources, and all five physical-edge equal-distance equations hold.  Therefore the following proposed terminal is false for each of the nine cells:

> convexity + common physical circle + slot order + the five physical-row equal-distance equations `implies False`.

The witnesses do **not** realize the two unnamed support members of every exact K4 row, the late `5+4+3` partition, the escape row, or the deletion synchronization.  Those are now the only legitimate places from which the remaining contradictions can come.

**Corrected Lean interfaces.**  Replace the three coarse collision terminals by this dependency graph:

```text
A5EscapeSourcePacket
  └─ a5_escape_capSlotFrame
       ├─ a5_escape_variableBlockers_ne_J        -- proves a≠J,b≠J,g≠J
       ├─ a5_escape_slotAssignment_valid         -- source → finite Valid
       └─ a5_escape_sameSide_exactTen            -- native_decide coverage
            ├─ false_of_A5_escape_sameSide_cell7
            └─ A5EscapeSameSideResidualCell      -- cells 1,2,3,4,5,6,8,9,10
```

Use an explicit nine-constructor residual type:

```lean
inductive A5EscapeSameSideResidualCell
  | cell1 | cell2 | cell3 | cell4 | cell5
  | cell6 | cell8 | cell9 | cell10
```

Every constructor must retain the full `A5EscapeSourcePacket`; the constructor adds only its exact five role-to-slot equalities.  Do not project the packet down to the single collision equality printed in the seventh column of the table.

**Revised closure matrix.**

| Obligation | Result of this audit | Lean acceptance test |
|---|---|---|
| Reproduce the published 178-row classifier | proved by exact enumeration | `validAssignments.card = 178` by `native_decide` |
| Explain the `100/68/10/0` side counts | proved by exact enumeration | four filtered-cardinality equalities by `native_decide` |
| Expose every classifier premise | **one missing source premise found:** `a,b,g≠J` | three named source lemmas, no CSV-only assumption |
| Treat `g=xu`, `g=t`, `a=v` as disjoint | refuted; four cells have overlapping labels | exact ten-cell dispatcher |
| Close Cell 7 | proved in prose; arithmetic consumer is `linarith`-complete | generic cocircular nested-bisector theorem plus name adapter |
| Close the other nine from the physical midpoint core | refuted by exact rational witnesses | these hypotheses must never be used as a terminal alone |
| Close the other nine from full A5 data | open | one theorem per exact cell or a proved common full-support/deletion theorem |
| Opposite-side child | unchanged and open | source-faithful cell coverage plus replay |

**Immediate implementation order.**

1. Kernel-check the standalone finite file `A5EscapeCollisionMetricCells.lean` and adapt names only as needed.
2. Prove `a5_escape_variableBlockers_ne_J`; do not run the CSV classifier before this fact exists in Lean.
3. Build the source cap-slot frame and prove `a5_escape_slotAssignment_valid`.
4. Prove `false_of_cocircular_twoNestedBisectors_swapped` and close Cell 7.
5. Replace the old three-constructor collision dispatcher by the exact nine-cell residual.
6. For each residual cell, expose the two unnamed members of all five exact K4 rows and the source-authenticated retained deletion before attempting another metric terminal.

**Status:** [ONE OF TEN SAME-SIDE CELLS PROVED IMPOSSIBLE; PHYSICAL-CORE-ONLY CLOSURE REFUTED IN THE OTHER NINE; EXACT NINE-CELL FULL-A5 FRONTIER OPEN]

###### A5.13k. Cross-hit/trace compatibility in `U7`

> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** The exclusions in this table completely close twenty of the forty-nine raw U7 trace/hit products. The twenty-nine listed products remain open and must not be conflated with the closed cells.

Assume `U7` and `\mathcal H_c\ne\varnothing`.  This includes the cycle-pair cover branch and the simultaneous cross-hit/escape branch of A5.13j3.  Pairwise circle intersection and pair-codegree at most two impose the following restrictions.

1. If `t\in T_c`, the two hits `X,T` cannot both occur. Otherwise the three distinct centers `a,b,d` would all be equidistant from the pair `c,t`.
2. If `v\in T_c`, the two hits `T,V` cannot both occur. Otherwise the three distinct centers `b,g,d` would all be equidistant from the pair `c,v`.

The two stronger trace/intersection contradictions formerly listed for `T_c=\{t,v\}` and `T_c=\{v,xv\}` are now subsumed by edge-bisector saturation: those traces cannot occur at all.

The complete compatibility table is therefore:

| Physical trace `T_c=Kc\cap C` | Allowed nonempty hit sets `\mathcal H_c` |
|---|---|
| `\varnothing` | `X`, `T`, `V`, `XT`, `XV`, `TV`, `XTV` |
| `\{t\}` | `X`, `T`, `V`, `XV`, `TV` |
| `\{v\}` | `X`, `T`, `V`, `XT`, `XV` |
| `\{xv\}` | `X`, `T`, `V`, `XT`, `XV`, `TV`, `XTV` |
| `\{t,xv\}` | `X`, `T`, `V`, `XV`, `TV` |

Starting from the old forty-nine trace/hit products, edge-bisector saturation removes all fourteen products based on the impossible traces `\{t,v\}` and `\{v,xv\}`.  The two pair-codegree restrictions remove six more.  Exactly twenty-nine `U7` cross-hit products remain.

The table is a finite incidence consequence, not the terminal contradiction.  In the simultaneous escape branch it must be crossed with the exact escape-row type from A5.13j2; in the cover branch no escape row is present.

**Status:** [SHARPENED PRUNING TABLE; TWENTY OF FORTY-NINE RAW U7 PRODUCTS CLOSED]

###### A5.13l. The six source-authenticated tags reduce to three deletion behaviors

Let `δ` denote the selected first-apex deletion, with `δ=q` or `δ=w`. The six clauses of A5.8 are the product of that two-way choice with exactly three semantic behaviors.

1. **Source `u`.** Deletion of `u` fails at `xv`, while deletion of `δ` survives at `xv`:
   \[
   u\in K_u,
   \qquad
   \delta\notin K_u.
   \tag{A5.U55}
   \]

2. **Source `xv`.** Deletion of `u` fails at `c`, while deletion of `δ` survives at `c`:
   \[
   u\in K_{xv},
   \qquad
   \delta\notin K_{xv}.
   \tag{A5.U56}
   \]

3. **Source `xu`.** Both deletions preserve the canonical row at `a`:
   \[
   u\notin K_{xu},
   \qquad
   \delta\notin K_{xu}.
   \tag{A5.U57}
   \]

The `q` and `w` tags must remain distinct because no orientation-preserving symmetry between their complete dependent packets has been proved. Nevertheless, the finite endpoint should factor the six leaves as three row behaviors times two named deletion points rather than duplicate the row reasoning six times.

**Status:** [DERIVED SOURCE-TAG NORMALIZATION]

###### A5.13m. Fully specified dependent classifier for the U family

A complete finite or analytic treatment of `U` uses the following dependent decision tree.

1. **Center type:** `Ut`, `Uv`, or `U7` from (A5.U18).
2. **Support type:**
   - `Ut` has the fixed support (A5.U20);
   - `Uv` has the fixed support (A5.U21);
   - `U7` has one of the physical traces retained by A5.13g and A5.13k.
3. **Cycle-pair cover status:** `H=\varnothing` or `H\ne\varnothing`.
   - In the cover branch, the cross-hit set is nonempty and must satisfy A5.13k.
   - In the escape branch, retain a literal source `z\in H`, its exact canonical row `Kz`, and its blocker `e=\beta(z)`.
4. **Late-fiber type in an escape branch:** `z\in Q` or `z\in E`.
   - If `z\in Q`, then `\beta(z)=J` and `Kz=Q`.
   - If `z\in E`, then `\beta(z)\ne J`.
5. **Physical cap-slot type in an escape branch:**
   - **Child O:** `t,v` occupy opposite adjacent-cap chains, so the full order (A5.U84) is available; or
   - **Child C:** one of `g=xu`, `g=t`, or `a=v`.
6. **Cross-hit type:** pure escape or simultaneous cross hit. In the simultaneous case, retain the compatible `U7` trace/hit product and any auxiliary `E8/Eeq/E2` row type still carried by the source constructor.
7. **Continuation type:** a new blocker extension or a source-exact canonical-row collision from A5.13j5a.
8. **Source behavior:** one of the three row behaviors in A5.13l.
9. **Named retained deletion:** `\delta=q` or `\delta=w`.

Every terminal certificate must retain:

- the original twelve-point carrier and the exact eleven-point erased carrier `A-u`;
- the five deterministic surviving rows, not arbitrary witnesses;
- both dangerous triples and their exact omissions;
- the center type and exact physical trace;
- the `5+4+3` partition `A=C\dot\cup Q\dot\cup E`;
- the exact cover/escape and `Q`/`E` statuses;
- in Child O, the full order (A5.U84) and all equal-distance equations used by a coordinate proof;
- in Child C, the literal equality `g=xu`, `g=t`, or `a=v`, with the corresponding source row;
- the matching-extension/row-collision output;
- the literal source behavior and deletion point; and
- every center/source inequality required by the faithful carrier pattern.

The replay target must be one of:

1. a third point in the intersection of two distinct exact circles;
2. a center in its own positive-radius row;
3. a proved strict cyclic-order, midpoint, or convex-hull contradiction;
4. a bounded `ShellMetricCoreAlternative`; or
5. an audited exact finite certificate with a separately proved source-to-cell coverage theorem.

An incidence-only or separation-only model is not a certificate.

**Status:** [FULLY SPECIFIED DEPENDENT CLASSIFIER; TERMINAL METRIC GEOMETRY OPEN]
###### A5.13n. Exact remaining U theorem

The `U` family is the disjunction of two endpoint theorems.

1. **U-cover exclusion.** No A5 carrier realizes the five deterministic physical-cycle rows with `Pcyc=N`, one compatible cross-hit/trace product from A5.13k, one center type, and one source-authenticated retained-deletion behavior.
2. **U-escape exclusion.** No A5 carrier realizes the source-exact escape packet of A5.13j7.

Equivalently, after deleting `u`, no eleven-point carrier can realize simultaneously:

- the five deterministic surviving rows of A5.13a;
- the two dangerous triples of A5.13b--A5.13c;
- one center type `Ut`, `Uv`, or `U7`;
- either the cover packet or the authoritative escape classifier of A5.13m; and
- one literal `q`- or `w`-deletion behavior.

The exact status is:

- edge-bisector saturation and pair-codegree arguments close several trace/hit products;
- `O\notin Kxv` is an unconditional prose theorem;
- the late-first-apex fiber logic and the `5+4+3` partition are closed in prose from the source-read API;
- the two-physical-hit and `O\in Kc` coordinate contradictions are valid only in Child O, where (A5.U84) supplies their angular order;
- the abstract separation core is satisfiable;
- Child C consists of the three explicit physical blocker collisions `g=xu`, `g=t`, `a=v`; and
- the matching producer always yields either a new blocker or a source-exact row collision, but no existing theorem refutes every output.

Thus the remaining theorem is metric and source-faithful. It cannot be replaced by counting, pair-codegree, an abstract circular-order UNSAT claim, or an unproved synchronization of independent rows.

**Status:** [EXHAUSTIVELY REDUCED BUT OPEN: COVER FAMILY, OPPOSITE-SIDE ESCAPE FAMILY, AND THREE PHYSICAL-COLLISION FAMILIES]
###### A5.14. The `Boff` family

Assume

\[
u\in K_c,
\qquad
d\notin C.
\tag{A5.24}
\]

Then `d` is outside the strict second-cap interior. Indeed that interior is exactly `{u,c,xv,xu}`; the three physical points are excluded by `d∉C`, and `d≠c` because an actual blocker differs from its source.

The row `Kc` nevertheless contains `c` and `u`, so

\[
\operatorname{dist}(d,c)=
\operatorname{dist}(d,u).
\tag{A5.25}
\]

Hence `d` lies on the perpendicular bisector of the strict-cap chord `cu`, but outside the four-point strict interior. The exact residual is therefore an **off-physical-class two-pinned-point localization problem**, not a generic common-deletion problem.

The branch still carries:

- the forced order `u<c<xv<xu`;
- the exact row `Kxv`, centered at `c`, through `u,xv`;
- the exact physical row `BO`;
- the two deletion fans of A5.6-A5.7;
- the row-avoiding source of A5.7a; and
- one source-authenticated six-arm clause.

A closing theorem must use those data to place `d` in a forbidden cap region, force a third point into a two-circle intersection, or produce a shell-metric core. The equality (A5.25) alone is realizable.

**Status:** [NORMAL FORM DERIVED; SIX SOURCE-TAGGED CELLS OPEN]

###### A5.15. The `Xt` and `Xv` five-point chain families

In either remaining physical family,

\[
u\in K_c,
\qquad
d\in\{t,v\},
\qquad
d\notin K_{xv}.
\tag{A5.26}
\]

The following equalities are forced:

\[
\begin{aligned}
&|Ou|=|Oxv|=|Od|=\rho,\\
&|cu|=|cxv|,\\
&|du|=|dc|.
\end{aligned}
\tag{A5.27}
\]

Thus the five named points `O,u,c,xv,d` form a source-faithful circle-isosceles chain:

- `u,xv,d` lie on the physical circle centered at `O`;
- `u,xv` lie on the row centered at `c`;
- `u,c` lie on the row centered at `d`; and
- `d` is explicitly omitted from the row centered at `c`.

The two cases `d=t` and `d=v` are distinct physical-cycle placements. They may be related by a reflection only after the adjacent-cap orientation and every source label are transported explicitly.

The remaining geometric target is to turn (A5.27), the strict order `u<c<xv<xu`, and the placement of `t,v` into one of the existing metric cores—most naturally a five-point circle-isosceles order core or a six-point circle-chain collision. The current packet does not yet contain the crossing/orientation premise required by those generic consumers, so that premise must be derived rather than assumed.

**Status:** [TWO METRIC NORMAL FORMS DERIVED; TWELVE SOURCE-TAGGED CELLS OPEN]

###### A5.16. The three-row union forces additional global escape data

> **Lean closure annotation — [LEAN-HELPER-READY].** Both escape producers have complete prose proofs and should be formalized as carrier-wide A5 helper lemmas. They force continuation data but not a contradiction.

Let

\[
B=BO\cup K_{xv}\cup K_c.
\tag{A5.28}
\]

Since `|BO|=|Kxv|=4` and `BO∩Kxv={u,xv}`,

\[
|BO\cup K_{xv}|=6.
\]

Adding the four-point row `Kc` gives

\[
|B|\le10<12=|A|.
\tag{A5.29}
\]

Moreover `xu∉B`: it is erased from `BO` and omitted from both canonical rows. Therefore `A\B` contains `xu` and at least one further point `z0≠xu`. For such a point,

\[
z_0\notin BO\cup K_{xv}\cup K_c.
\tag{A5.30}
\]

Exact-row persistence gives survival after deleting `z0` at all three centers `O,c,d`, and hence

\[
\beta(z_0)\notin\{O,c,d\}.
\tag{A5.31}
\]

This is a simpler carrier-counting companion to the stronger cap-localized source `z` constructed in A5.7a.

There is also a carrier-wide minimality consequence. In any faithful carrier pattern extending the A5 rows, the proper nonempty subset `B` has a center `e∈B` such that **every** selected four-support at `e` contains a point outside `B`. This is the proper-subset row-escape theorem applied to (A5.29). It produces a fourth selected row that genuinely leaves the three-row union.

Neither escape statement is itself a contradiction. Together they provide the missing global producer that a finite coverage proof may use:

- a named deletion source outside all three concrete rows, whose blocker avoids all three centers; and
- a center inside the three-row union whose selected row must escape that union.

**Status:** [DERIVED AND PROVED IN PROSE; GLOBAL ESCAPE PRODUCERS ADDED]

###### A5.17. Revised finite coverage contract: twenty-four coarse cells

The source constructs a twelve-point faithful carrier pattern whose exact rows at `O,c,d` are `BO,Kxv,Kc`. It also supplies a source-clean contradiction consumer once the pattern is shown to satisfy a `ShellMetricCoreAlternative`. What remains is coverage.

After A5.12, the four surviving structural families are

\[
\mathsf U,
\quad
\mathsf{B_{off}},
\quad
\mathsf{X_t},
\quad
\mathsf{X_v},
\tag{A5.32}
\]

crossed with the six source-authenticated clauses of A5.8. Thus there are twenty-four **coarse** source-tagged cells.

Every cell receives:

1. the exact twelve-point `(5,4,6)` cap profile;
2. the strict order `u<c<xv<xu`;
3. the exact supports `BO,Kxv,Kc` and all proved intersection bounds;
4. the second-cap and physical-class deletion fans;
5. the two original `xu` common-deletion packets;
6. the row-avoiding sources and blocker exclusions;
7. the proper-subset row-escape producer;
8. the exact late-system partition `A=C\dot\cup Q\dot\cup E`; and
9. one structural tag and one literal source/deletion tag.

The `U` family is no longer represented by the older flat `E8/Eeq/E2` sketch alone. Its authoritative refinement is A5.13j7:

- split first into the opposite-side child or one of `g=xu`, `g=t`, `a=v`;
- retain the `Q`-escape/`E`-escape distinction;
- retain pure versus simultaneous cross hit;
- use the exact matching-extension/row-collision producer; and
- do not promote the conditional coordinate calculations outside the opposite-side child.

The other three coarse families remain as before:

- `Boff` is an off-class two-bisector/cap-localization endpoint;
- `Xt` and `Xv` are source-faithful five-point circle-isosceles chains requiring an oriented metric terminal.

An incidence-only SAT certificate is insufficient. Coverage and replay must be proved separately, and every replay cell must retain the exact row equations and source provenance used by its terminal.

**Status:** [EXACT TWENTY-FOUR-CELL COARSE COVERAGE CONTRACT; `U` REFINED EXHAUSTIVELY BY A5.13j7]
###### A5.18. Exact remaining implication

The A5 leaf has been reduced to:

> No twelve-point faithful carrier pattern realizes the complete common A5 ingress together with one of the twenty-four coarse cells in (A5.32), its source-authenticated six-arm clause, and the applicable refined geometric child.

The `Bxu` structural family is closed by the strict-cap betweenness contradiction of A5.12. The original five-incidence negation is redundant, and `d=xv` is impossible.

The four remaining families are:

- `U`: an exact-eleven five-survivor/two-failure endpoint with the late `5+4+3` partition, the opposite-side-or-three-collisions fork, and the exact matching/collision continuation;
- `Boff`: an off-physical-class bisector-localization endpoint;
- `Xt` and `Xv`: two distinct circle-isosceles chain endpoints.

No complete `U` role family is presently closed. The conditional coordinate calculations close specified opposite-side subcases only. The current repository supplies the faithful-pattern constructor and conditional shell-metric consumer, but not the exhaustive metric coverage theorem.

**Immediate consumer.** The exact-twelve interior-deletion physical-radius coordinator. Together with A6, A5 exhausts that endpoint.

**Status.** [PARTIALLY CLOSED: `Bxu` PROVED IMPOSSIBLE; FOUR STRUCTURAL FAMILIES / TWENTY-FOUR COARSE SOURCE-TAGGED CELLS REMAIN]
##### 16.5.A6 - Exact-twelve next row has only the named `xu` hit

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15506-15554. This is the complement of A5 after the common-deletion arm is absent.

**Atomic contract.** Under the same exact-twelve `(5,4,6)` cap profile, prove impossibility when the next canonical row contains `xu` but omits `u` and `xv`.

**Data already proved upstream.** The strict second-cap interior is exactly the four named points `u`, `centerAt(xv)`, `xv`, and `xu`. The next row has its source `centerAt(xv)` automatically, contains `xu`, and omits the other two named physical points. Its remaining two support points must therefore be outside that four-point interior set. The full twelve-point cap partition and the source-survival alternative are retained.

**Exact missing implication.** The unresolved step is to show that no exact four-row with precisely those two named interior hits can be placed among the remaining cap and boundary points while satisfying the other canonical rows and deletion semantics.

**Candidate closure program.**

1. Derive an exact support-location table for the two unnamed members of the next row. The `(5,4,6)` cap sizes determine the cardinalities of the three cap interiors and the shared Moser vertices; use these identities to replace broad carrier membership with a short list of cap regions.

2. For each region pair, use a circle-versus-convex-order lemma: two strict-cap points and two points in specified adjacent caps lie on a common circle centered at the named blocker only in certain noninterlacing orders.

3. Exploit the source-survival disjunction to eliminate the region assignments that place a deleted first-apex point in the canonical row.

4. Because the carrier has exactly twelve points, certify any residual finite order cases after all metric conditions have been reduced to exact orientation and equal-distance predicates.


**Known limits and rejection tests.** A same-cap row may contain two points without contradiction, and two additional points can lie outside the cap. The proof cannot stop at the observation that the row has only two physical-class hits. A finite endpoint must encode the full cap partition and all inherited rows.

**Immediate consumer.** The exact-twelve physical-radius split. Together with A5, this exhausts that endpoint.

**Status.** [OPEN]

##### 16.5.A7 - Deletion of `u` with a fixed physical source pair and a missing incidence

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_missingIncidence`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15826-15856 in the inspected source lineage. This is the source-clean `u`-deletion endpoint with the fixed physical pair `xu` and `deleted`.

**Atomic contract.** Let

- `cxu` be the actual blocker selected at source `xu`, with exact row `Kxu` centered at `cxu`;
- `cd` be the actual blocker selected at source `deleted`, with exact row `Kdeleted` centered at `cd`; and
- `BO` be the exact physical-radius row centered at the fully deletion-robust apex `O`.

The fixed-pair packet supplies the three seed incidences placing `deleted` in `BO`, `Kxu`, and `Kdeleted`. The checked tetrahedron consumer additionally requires

\[
c_{xu}\in BO,\quad O\in K_{xu},\quad c_d\in K_{xu},
\quad O\in K_{deleted},\quad c_{xu}\in K_{deleted}.
\tag{A7.1}
\]

The leaf assumes that at least one incidence in (A7.1) is absent.

**Canonical reduction now proved.** By the robust-apex tetrahedron-or-continuation theorem of Section 16.5.38, the five branches become exactly:

| Missing incidence | Deleted source | Surviving centers |
|---|---|---|
| `cxu ∉ BO` | `cxu` | `O` and `cxu` |
| `O ∉ Kxu` | `O` | `O` and `cxu` |
| `cd ∉ Kxu` | `cd` | `O` and `cxu` |
| `O ∉ Kdeleted` | `O` | `O` and `cd` |
| `cxu ∉ Kdeleted` | `cxu` | `O` and `cd` |

If all five incidences held, the exact rows would make `O`, `cxu`, `cd`, and `deleted` pairwise equidistant, contradicting planar geometry. If one is absent, exact-row persistence and robustness construct the corresponding common-deletion packet.

**Exact remaining implication.** The leaf is therefore equivalent to an unbounded continuation theorem: under the full source-heavy rigid packet and `13 ≤ |A|`, none of the five typed common-deletion continuations above can occur. Unlike A5, this cannot be completed by a single exact-cardinality certificate.

**Candidate closure program.**

1. Normalize the five packets into one tagged family while retaining the deleted source, the non-apex center, and the exact row that survived.

2. Compare each continuation to the original `u`-deletion data. In the three arms whose deleted source is one of `O`, `cxu`, or `cd`, determine whether the continuation creates a two-cycle in the chosen blocker map, a repeated common-deletion source, or a third distinct deletion.

3. For a repeated source, use canonical-row uniqueness at every nonrobust center to obtain exact support equality. For a new source, preserve it as a strictly larger source-faithful deletion fan; do not flatten it to anonymous survivals.

4. The required terminal must use the rigid cap placement. A promising form is a strict boundary-order potential on the sequence

\[
\text{deleted source}\longmapsto
\text{surviving non-apex center}\longmapsto
\text{its actual blocker}.
\]

Prove that every continuation arm strictly advances the potential, while finiteness forces a cycle.

5. If such a potential cannot be proved, this branch should be routed to the unbounded cap-weighted blocker theorem rather than split into more local leaves.

**Known limits and rejection tests.** The complete-incidence contradiction cannot be contraposed into positive incidence production. A directed blocker cycle is not contradictory without a strict potential. The two centers in a common-deletion packet may use independent radii. A finite list of cardinality slices does not close the unbounded `13 ≤ |A|` theorem.

**Immediate consumer.** The `threeCenterDeletion_u` coordinator. Its canonical five-way reduction is now closed; its continuation geometry remains open.

**Status.** [PARTIALLY REDUCED: canonical reduction PROVED in prose; unbounded five-arm continuation theorem OPEN]

##### 16.5.A8 - Deletion of `xv` with two failing-then-surviving blockers and a missing incidence

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15917-15973 in the inspected source lineage. This is the `xv`-deletion endpoint after two nonphysical blockers are known to fail under deletion of `u` and survive under deletion of `xv`.

**Atomic contract.** Let `c1,c2` be the two distinct nonphysical blockers, with exact canonical rows `K1,K2`, and let `BO` be the exact row centered at the fully deletion-robust physical apex `O`. Failure after deleting `u` gives

\[
u\in K_1\cap K_2,
\]

and the physical packet gives `u ∈ BO`. The checked complete-incidence consumer requires the additional five incidences

\[
c_1\in BO,\quad O\in K_1,\quad c_2\in K_1,
\quad O\in K_2,\quad c_1\in K_2.
\tag{A8.1}
\]

The leaf assumes at least one incidence in (A8.1) is absent.

**Canonical reduction now proved.** Section 16.5.38 converts the five missing-incidence branches to:

| Missing incidence | Deleted source | Surviving centers |
|---|---|---|
| `c1 ∉ BO` | `c1` | `O` and `c1` |
| `O ∉ K1` | `O` | `O` and `c1` |
| `c2 ∉ K1` | `c2` | `O` and `c1` |
| `O ∉ K2` | `O` | `O` and `c2` |
| `c1 ∉ K2` | `c1` | `O` and `c2` |

The already-proved failed-then-surviving semantics are used only to identify `K1` and `K2` canonically and to establish `u ∈ K1∩K2`; no existential survival support is synchronized by choice. If all five additional incidences held, `O,c1,c2,u` would be four pairwise equidistant planar points.

**Exact remaining implication.** It remains to show that no one of these five continuation packets is compatible with the source-heavy cap order, the distinct nonphysical blocker placement, and the original `u`-failure/`xv`-survival asymmetry.

**Candidate closure program.**

1. Retain the multiplicity information at `c1` and `c2`: deletion of `u` drops each center from multiplicity four to three, while deletion of `xv` leaves each at multiplicity at least four. Hence `u` lies in both canonical rows and `xv` lies in neither.

2. For each continuation arm, compare its deleted source with `u` and `xv`. If the source is `c1`, `c2`, or `O`, record a three-deletion table at both blockers rather than discarding the asymmetry.

3. Since `K1` and `K2` already share `u`, any additional forced shared point saturates their two-circle intersection. Use the continuation packet to determine whether a third shared point is forced; otherwise retain the exact second point as a named pair and place both centers on its perpendicular bisector.

4. Combine that perpendicular-bisector placement with the strict cap locations of `c1` and `c2`. The desired terminal is either three carrier centers on one line, an interlacing-chord violation, or a strict boundary-order cycle.

5. A branch that yields only a new common-deletion packet should be handed to the same tagged continuation dispatcher as A7, not represented by a fresh opaque `False` leaf.

**Known limits and rejection tests.** Two distinct exact rows may share exactly two points, and independent radii may coexist. The common source `u` alone is not a contradiction. No radius equality follows merely from both rows containing `u`. The geometric step must use either a second named shared point or cap order.

**Immediate consumer.** The `threeCenterDeletion_xv` coordinator. The common-deletion reduction is complete; the cap-sensitive continuation terminal remains open.

**Status.** [PARTIALLY REDUCED: canonical reduction PROVED in prose; five cap-sensitive continuation arms OPEN]

#### 16.5.B `Rigid221Placement.lean` - five reachable leaves

These are the stable placement terminals immediately below the contextual rigid `2+2+1` decomposition. They are smaller than the source-heavy continuations but often lack the later named companions. Where necessary, the correct repair is to enrich the terminal with data already available to its caller rather than to invent a local geometric axiom.

##### 16.5.B1 - Pairwise-distinct-radius minimal deletion core

**Declaration.** `false_of_exactFourMutualOmissionRigid221_minimalCore`

**Source and role.** `Rigid221Placement.lean`, approximately lines 531-574. This is the minimal-core geometry arm of `ExactFourMutualOmissionRigid221GlobalDeletion` when the global deletion center is not the physical apex.

**Atomic contract.** From a minimal counterexample, a positive physical class of exact size five, mutual omission of two source rows, a rigid `2+2+1` decomposition, and a `MinimalDeletionCore` at a nonphysical center, derive `False`.

**Data already proved upstream.** The deleted set is nonempty, contained in the physical five-class, and has cardinality at most five. K4 fails at the global center after deleting the whole set but is restored when any one deleted point is put back. The core supplies a critical four-shell for each restored point and pairwise-disjoint shell supports. The rigid packet records how the physical class meets the two principal rows.

**Exact missing implication.** The missing theorem is a cap-sensitive bound on a family of pairwise-disjoint exact four-shells centered at one point and indexed by a small subset of one physical circle.

**Candidate closure program.**

1. Expand the minimal-core semantics into exact multiplicity statements. For each deleted source `s`, identify the unique radius at the common center whose four-class in the partially restored carrier contains `s` and fails when `s` is removed.

2. Prove that the core radii are pairwise distinct and their supports are disjoint in the original carrier, with each support containing exactly one deleted point. Make all cardinality consequences explicit.

3. Intersect every support with the three Moser caps. A circle centered at one fixed nonphysical carrier point should have a uniform upper bound on points in the physical strict cap or on repeated boundary intervals. Sum that bound over the disjoint shells.

4. If the resulting inequality is not contradictory, use the rigid `2+2+1` row traces to show that at least two core shells must share a named physical or boundary point, contradicting disjointness.


**Known limits and rejection tests.** Pure counting gives only `4 * |deleted|` support incidences and is compatible with sufficiently large carriers. The contradiction must use cap location or forced shared points. The theorem cannot be closed by asserting that distinct radii at one center are impossible; concentric circles are entirely possible.

**Immediate consumer.** The nonphysical branch of the Rigid221 placement dispatcher. A successful common-center/disjoint-shell cap bound would also inform the two-radius and unbounded leaves.

**Status.** [OPEN]

##### 16.5.B2 - The source blocker is the rigid singleton deletion

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted`

**Source and role.** `Rigid221Placement.lean`, approximately lines 734-746. The physical apex is the global-deletion center, `u` is the retained source, and the actual blocker of `u` is the distinguished singleton omitted from the two rigid two-point blocks.

**Atomic contract.** Prove impossibility of the exact placement `centerAt(u)=deleted` inside the rigid physical five-class context.

**Data already proved upstream.** The blocker and the source-row physical companion lie on the same physical circle centered at the second apex. The source row contains `u` and its companion but omits its own center. The deleted point is the fifth physical-class point outside the two disjoint row blocks. Mutual omission, exact class size five, cap-growth data, and the joint-deletion packet remain available through `P`.

**Exact missing implication.** One must turn the equal-chord relation at the deleted point and the known cap positions of the two-point blocks into a contradiction with the singleton's placement.

**Candidate closure program.**

1. Name the second physical member `xu` of the source row. From `centerAt(u)=deleted`, derive `dist(deleted,u)=dist(deleted,xu)`.

2. Use the common physical circle to convert that equality into an arc-midpoint alternative for `deleted` relative to `u` and `xu`.

3. Prove where the rigid singleton deletion lies in the cap partition. If it lies outside the open arc containing the source block, the midpoint alternative should place it at the opposite arc midpoint; compare that location with the two other physical-block points and convex order.

4. Close the remaining reflected orientation by one generic equal-chord/cap-separation lemma rather than two ad hoc coordinate calculations.


**Known limits and rejection tests.** The equality of two chord lengths is not itself contradictory. The proof needs an explicit theorem connecting the geometric cap to a unique open arc of the physical circle. It must not assume the singleton lies outside that arc without deriving its cap membership from the rigid packet.

**Immediate consumer.** The physical-apex source-equals-`u` placement dispatcher. The same common-circle arc lemma is expected to support A1 and B3.

**Status.** [OPEN]

##### 16.5.B3 - Blocker `v` and a source-row-heavy cap shape

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`

**Source and role.** `Rigid221Placement.lean`, approximately lines 882-897. The checked normalization already proves that `v` lies in the strict physical second-cap interior.

**Atomic contract.** Assume `centerAt(u)=v`, both physical members of the source row are strict second-cap interior, and `v` is also strict interior. Prove `False`.

**Data already proved upstream.** The source row meets the physical five-class in an exact two-point block containing `u`; call the companion `xu`. Thus `u`, `xu`, and the center `v` are distinct points on the same physical circle and in the same strict cap, with `dist(v,u)=dist(v,xu)`. The opposite row is mutually omitted from the source row and contributes the other rigid two-point block.

**Exact missing implication.** The immediate geometry yields a strict-arc midpoint relation, but a single midpoint is realizable. The missing step is to connect that midpoint to the opposite row or to the next blocker so that a closed order cycle is formed.

**Candidate closure program.**

1. Prove the arc-midpoint identity for `v` between `u` and `xu`.

2. Extract the exact cap locations of the opposite block `{v,xv}`. Because `v` is itself one member of that block, identify whether `xv` lies in the same strict arc or an adjacent cap.

3. Use mutual omission (`v` omitted from the `u` row and `u` omitted from the `v` row`) together with canonical blocker semantics to constrain the next blocker of `v`. Split it into the already named physical placements and an off-class center.

4. In the physical placements, derive a second arc-midpoint relation and close a strict cycle. In the off-class placement, invoke the two-pinned-pair localization proposed for A4.


**Known limits and rejection tests.** Three same-circle strict-cap points with one midpoint relation are feasible. Any proof stopping at that fact is incomplete. This leaf may need to be weakened into a source-clean producer for the later source-heavy pentagon rather than proved directly at the present information boundary.

**Immediate consumer.** The `blockerV` cap-shape splitter. It can be bypassed if the richer source-heavy continuation is made the primary terminal and this theorem becomes an adapter.

**Status.** [OPEN]

##### 16.5.B4 - A blocker in the opposite rigid row and an opposite-row-heavy shape

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy`

**Source and role.** `Rigid221Placement.lean`, approximately lines 907-921. This terminal is deliberately blocker-identity independent: it records membership in the opposite row and the physical class rather than a particular named point.

**Atomic contract.** The actual source blocker lies in the opposite row's physical two-point block; the source row is not heavy, while both opposite-row physical points lie in the strict cap. Prove `False`.

**Data already proved upstream.** The rigid class is exactly `2+2+1`. The blocker is one of the two opposite-block points and is a carrier center. The source itself is strict interior. The opposite row has exactly two physical strict-cap hits, while the source row has fewer than two. Mutual omissions and all exact row cardinalities are available.

**Exact missing implication.** The missing theorem must show that a canonical center chosen from the heavy opposite block cannot support the source row under the inherited cap order.

**Candidate closure program.**

1. Name the two opposite-block points and split the blocker membership into the source `v` and its companion. Keep both branches symmetric through a typed packet.

2. For each branch, derive the equal-chord relation from the blocker to the two physical members of the source row. Determine the source row's one or zero strict-cap physical hits from the `not heavy` hypothesis and the rigid `2+2+1` count.

3. Apply a common-circle separation lemma: a center on the heavy interior block cannot be equidistant to a source-block pair separated across the adjacent-cap boundary without forcing the center or one source onto the wrong arc.

4. If the row has only one physical-class member, retain the two nonphysical support points and use their cap regions; otherwise the equal-chord argument is underdetermined.


**Known limits and rejection tests.** The heavy count refers to an intersection cardinality, not automatically to a named pair until the exact two-point block is unpacked. A generic same-cap-circle bound of at most two points gives equality here, not a contradiction. The proof needs order, not another cardinality estimate.

**Immediate consumer.** The shared blocker-in-opposite-row dispatcher, used by both blocker-equality and blocker-other parents.

**Status.** [OPEN]

##### 16.5.B5 - The exceptional sparse `1+1+1` row pattern

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows`

**Source and role.** `Rigid221Placement.lean`, approximately lines 930-944. Both row-heavy alternatives have been excluded; the rigid class and the three-interior-point bound normalize the remaining case to one interior point from each two-point block plus the singleton.

**Atomic contract.** Prove that the normalized sparse placement is impossible when the source blocker lies in the opposite row's physical block.

**Data already proved upstream.** There are exactly three strict physical-cap interior points. The source row contributes exactly one, the opposite row contributes exactly one, and the singleton physical-class point is the third. The two unused members of the rigid blocks lie outside the strict interior. The actual blocker is in the opposite block and in the physical class.

**Exact missing implication.** The missing step is an exact cyclic-order exclusion of this `1+1+1` placement together with the equal-distance relations from the two canonical rows.

**Candidate closure program.**

1. Introduce names for all five physical-class points and derive the two possible cyclic orders of the `1+1+1` cap split, modulo reflection.

2. Translate each row's exact two-point physical intersection into a chord. Determine whether the two chords cross, nest, or are separated on the physical circle.

3. Use the fact that each row center is itself a carrier point, one center lies in the opposite block, and centers are omitted from their own supports. Derive either an interlacing equal-chord configuration or a point lying in the convex hull of two neighbors.

4. Certify the finitely many residual orientation cases if the generic chord lemma leaves endpoint equalities.


**Known limits and rejection tests.** The abstract `1+1+1` distribution is realizable on a circle. The contradiction, if true, comes from the row centers and mutual omissions, not from the cap count alone. The proof must enumerate endpoint coincidences rather than silently assuming all five named roles are distinct.

**Immediate consumer.** The final sparse child of the physical-apex source-equals-`u` dispatcher.

**Status.** [OPEN]

#### 16.5.C `Rigid221Closure.lean` - five reachable leaves

These leaves coordinate the placement modules and the post-card-eleven continuation. One raw theorem in this module, `false_of_exactFiveDistinct_biApexRobust_postCardEleven`, is excluded here because the built status report marks it off-spine.

##### 16.5.C1 - The physical-apex branch with a genuine third source

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`

**Source and role.** `Rigid221Closure.lean`, approximately lines 45-97. Here the contextual source is not `u`, so its selected row is genuinely distinct from the two rigid principal rows.

**Atomic contract.** Close the physical-apex rigid branch when the actual source blocker is localized to one of three placements: the distinguished deletion, `u`, or the opposite-row physical block.

**Data already proved upstream.** The source row retains its source identity and physical-class membership. The placement theorem has already reduced the blocker to a finite union. The complete Rigid221 context, mutual omissions, cap-growth surface, and joint-deletion data are still available.

**Exact missing implication.** Each placement requires a source-faithful contradiction. Existing source-equals-`u` leaves cannot simply be applied because the third source row has different support and omission facts.

**Candidate closure program.**

1. Split the theorem into three named child packets, one per placement, and carry the source row's exact physical-class intersection into each child.

2. For `blocker=deleted` and `blocker=u`, derive common-circle arc relations using the third source and its physical companion. Compare them with the already fixed principal-row chords.

3. For blocker membership in the opposite block, reuse B4/B5 only after proving an adapter that replaces their source-equals-`u` assumptions with the exact third-row traces they actually consume.

4. If the third row carries strictly more information than the stable B4/B5 interface, move the terminal downstream rather than discarding that information.


**Known limits and rejection tests.** Equality of the source with `u` is not cosmetic; it changes which canonical row is being discussed. Rewriting a third-row support as the `u` row would be unsound. The blocker-placement disjunction alone is not contradictory.

**Immediate consumer.** The physical-apex side of the top-level Rigid221 closure.

**Status.** [OPEN]

##### 16.5.C2 - Nonphysical global center with an equal-distance deleted pair

**Declaration.** `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`

**Source and role.** `Rigid221Closure.lean`, approximately lines 215-260. This is the collision geometry arm when the rigid global-deletion center is not the physical apex.

**Atomic contract.** Given two distinct deleted physical-class points at equal distance from a nonphysical center, together with the rigid `2+2+1` decomposition and global-deletion minimality, prove `False`.

**Data already proved upstream.** The nonphysical center is a carrier point outside the deleted set. The deleted points lie on the physical circle and on one circle centered at the global center. The minimal deletion packet records failure after deleting the full set and restoration when individual points return. The rigid rows specify which physical points belong to which principal supports.

**Exact missing implication.** The missing implication is to show that the equal-distance pair cannot be accommodated by the minimal-core shells and rigid physical-class partition.

**Candidate closure program.**

1. Intersect the global center's relevant radius circle with the physical circle. Distinct centers imply at most two common points, so the named deleted pair exhausts that intersection.

2. Use restoration for each deleted point to identify which minimal-core shell uses that point. Prove that any shell requiring another physical-class point at the same global-center radius would exceed the two-circle intersection bound.

3. Show that the rigid `2+2+1` partition or mutual omission forces such a third physical point, or else forces two core shells to share a nonphysical support, contradicting pairwise disjointness.

4. If neither follows from the present contract, enrich this terminal with the exact core-shell-to-rigid-row incidence already available at the caller.


**Known limits and rejection tests.** Two circles with distinct centers can meet in exactly two points, so the named collision is locally realizable. The proof must use the minimal-core restoration or a forced third intersection. It may not assert that the equal-distance pair makes the two centers equal.

**Immediate consumer.** The nonphysical side of the Rigid221 closure, immediately above the minimal-core and collision split.

**Status.** [OPEN]

##### 16.5.C3 - Two disjoint exact-four classes at two radii of one apex

**Declaration.** `false_of_exactFourPostCardElevenTwoRadiusBranch`

**Source and role.** `Rigid221Closure.lean`, approximately lines 694-714. This is the post-card-eleven branch when no positive radius class has size five but two distinct rich radii each give an exact four-class at the second apex.

**Atomic contract.** Prove that two disjoint four-point classes on concentric circles centered at the same apex cannot occur with the robust post-card-eleven surface and the inherited cap constraints.

**Data already proved upstream.** Both radii are positive and distinct. Each selected support has exactly four carrier points, the supports are disjoint, and their cap-interior slices are retained by the producer. The absence of any five-point class rules out a simple robustness escape. The carrier is convexly independent and the second apex is a Moser vertex.

**Exact missing implication.** Concentric exact-four classes are geometrically possible in isolation. The missing theorem must use the precise angular/cap placement to show that all eight points cannot simultaneously be exposed vertices of the carrier.

**Candidate closure program.**

1. Develop a polar exposed-point criterion. For an inner-circle point to be a convex-hull vertex in the presence of outer-circle points, its angular coordinate must lie in a sufficiently large gap between adjacent outer points; formulate this using supporting lines rather than analytic trigonometry where possible.

2. Apply the criterion to all four inner points. The four required outer angular gaps are disjoint. Combine their lower bounds with the known cap angular span or with reflected-pair identities supplied by the downstream two-radius grid route.

3. If the radius ratio is unconstrained, derive the additional equal-distance equations from the two canonical rows before expecting a contradiction. A purely concentric theorem with arbitrary close radii is likely false.

4. Share the strengthened result with D2, where the reflected-pair grid provides exactly the extra algebraic constraints missing here.


**Known limits and rejection tests.** Do not state that points on the smaller concentric circle are automatically inside the convex hull of the larger four points; that is false when the outer points leave large angular gaps. A valid theorem must include enough angular coverage or row equations to control those gaps.

**Immediate consumer.** The post-card-eleven robust-surface dispatcher. It is a likely beneficiary of a single two-radius convex-order theorem shared with the TriApex grid leaf.

**Status.** [OPEN]

##### 16.5.C4 - The swapped protected exact-four outcome

**Declaration.** `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`

**Source and role.** `Rigid221Closure.lean`, approximately lines 756-770. The theorem receives the original residual, a physical common-deletion ingress, and a swapped protected exact-four frontier.

**Atomic contract.** Show that the swapped exact-four outcome is impossible or strictly decreases a well-founded measure, so the physical consumer cannot recurse symmetrically without progress.

**Data already proved upstream.** The swap retains source and deletion provenance and exchanges protected roles. The surrounding coordinator already handles the nonswapped outcome. The original surplus index, cap labels, and ordered source pair remain available outside the flattened swapped packet.

**Exact missing implication.** A symmetric packet is not contradictory by itself. The missing proof must identify an asymmetry that is preserved by construction and changes strictly under the swap, or bypass the swap with a direct geometric argument.

**Candidate closure program.**

1. List every field changed by the swap and every field fixed. Candidate measures include the ordered pair of cap indices, boundary positions of protected sources, and lexicographically ordered cap sizes.

2. Prove that the producer's choice rule is extremal with respect to one candidate measure. Then show the swapped outcome yields a strictly smaller admissible choice, contradicting extremality.

3. If no such measure is present, strengthen the producer to select the protected pair canonically before performing the split. Do not add an arbitrary orientation field after the fact.

4. As a fallback, unfold both protected frontiers simultaneously and prove a direct two-orientation contradiction, making clear which original asymmetry distinguishes them.


**Known limits and rejection tests.** A theorem whose hypotheses are invariant under the role swap cannot prove `False` solely because the roles are swapped. Any recursive call without a decreasing measure risks circularity. This leaf should be treated first as a well-foundedness audit, not as a metric endpoint.

**Immediate consumer.** The exact-four physical consumer and its protected-outcome dispatcher.

**Status.** [OPEN]

##### 16.5.C5 - Exact-five first-apex residual with a common obstruction center

**Declaration.** `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`

**Source and role.** `Rigid221Closure.lean`, approximately lines 1107-1116. Both obstruction sources select the same canonical blocker in the exact-five first-apex residual.

**Atomic contract.** From the exact-five first-apex class and the equality of the two obstruction blockers, derive `False`.

**Data already proved upstream.** The common blocker has one canonical four-row containing both obstruction sources. The exact-five apex class, omission data, robust surface, and source identities are retained. Equal blockers imply equality of canonical rows without any support-choice ambiguity.

**Exact missing implication.** Two sources in one canonical row are allowed. The missing step is to force either a third point of the exact-five apex class into that row, a forbidden center/support coincidence, or a cap-order obstruction.

**Candidate closure program.**

1. Compute the intersection of the common canonical row with the exact-five apex class. It already contains the two obstruction sources and has cardinality at most two if its center differs from the apex. Therefore those two points exhaust the intersection in the distinct-center case.

2. Use every other member of the exact-five class as a deletion source. The obstruction definition should say why it cannot use the same blocker; translate that into survival or omission statements for the common row.

3. Apply a blocker-fiber pigeonhole or all-blockers selection theorem to force one additional class source to the same blocker, yielding a third circle intersection. If the common blocker equals the apex, use center-not-in-support because the apex's selected class cannot contain its center at positive radius.

4. If current obstruction data mention only two sources, move this leaf to the earliest caller where the remaining three exact-five points and their blockers are still available.


**Known limits and rejection tests.** The equality of two blockers is not enough for a contradiction: a four-row can contain two prescribed sources. The required third incidence must be positively produced, not inferred from the class having five points. This route is promising only if the global cover supplies blocker information for the other class members.

**Immediate consumer.** `false_of_originalFrontierUniqueRadiusArm`. This leaf has a compact contract and may be a high-leverage test of the all-blockers formulation.

**Status.** [OPEN]

#### 16.5.D `TriApexEndpointRetainedOmission.lean` - two-root frontier and historical endpoint specification

This section replaces the former D1-D9 research sketches. It is checked against the current theorem signatures and against the packet fields that the callers actually retain.  The 23 August refactor implemented the common reverse-hit-to-D1 route.  D3--D9 remain below as historical stronger endpoint specifications and compatibility APIs, but only D1 and D2 are independent live roots.

##### 16.5.D0 - Audit anchor, status vocabulary, and editing rule

As of 23 August 2026, the two `sorry` declarations are the following.

1. `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`
2. `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`

The former D3--D9 declarations retain their public theorem signatures but have
source-clean bodies calling
`false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core` with
`C.reverse_mem` and `C.allLarge`.  The main reverse-hit coordinator makes the
same call directly.  The producer
`nonempty_pairedApexClassJointDeletion_of_reverseHit` is independently
kernel-clean; the generic route inherits `sorryAx` only from D1.

The statuses used below are deliberately distinct.

- **[LEAN-CLOSED]** means the declaration has a source-clean proof and `#print axioms` does not reach `sorryAx`.
- **[PROSE-CLOSED SUBCASE]** means a complete mathematical reduction and Lean-facing proof skeleton are supplied for a proper branch, but the enclosing declaration still has another branch.
- **[REDUCED TO KERNEL]** means all normalization and caller-specific bookkeeping are specified and the only remaining theorem is a named, typed kernel.
- **[KERNEL-OPEN]** means the final geometric or finite-continuation implication has not yet been proved.
- **[SOURCE-CLEAN WRAPPER]** means the historical declaration remains for API compatibility but transparently calls one of the two live roots.

**Editing rule.** Preserve the public D3--D9 signatures while D1 and D2 are attacked.  Refactor helper placement only when it shortens the D1/D2 dependency surface; do not reactivate the endpoint fan-out unless a new theorem proves a strictly stronger independent consequence than the live reverse-hit selector.

##### 16.5.D0.1 - Exact all-large input

Every leaf receives, directly or through `C.allLarge`, the following proposition.

```lean
structure TriApexAllLargeContext
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  cap_card_ge_six :
    ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card
  apex_rich :
    ∀ i : Fin 3,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i)
  notRobustCover_card :
    D.A.card ≤ 4 * (notRobustCenters D).card
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
         S.triangle.v2 ∈ SelectedClass D.A p r ∧
         S.triangle.v3 ∈ SelectedClass D.A p r)
```

The first field already yields

```lean
have hcard15 : 15 ≤ D.A.card :=
  ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
    S G.cap_card_ge_six
```

or the same expression with `C.allLarge`. Every shared-seed proof should use this existing theorem; no new cap-sum arithmetic lemma is needed.

The source also proves the following global interfaces and they must be reused rather than reproved.

```text
exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
exists_criticalShell_center_with_otherRichCapSlice_card_le_one
exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
sourceFaithfulDeletionFan_of_triApexAllLargeContext
exists_distinct_outsideCap_sourceFaithful_packets
exists_distinct_support_points_with_same_blockerCap
crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair
crossDeletion_survives_of_distinct_selectedRow_blockers
exists_repeatedBlockerCap_pair_outcome
exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
exists_nonrobustCenter_witness_of_sourceFaithfulFan
nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan
nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion
exists_escaping_sourceFaithfulRow_of_endpoint_split
```

In particular, `SourceFaithfulSelectedFourDeletionFan D S H Row` already says, for every `w ∈ Row.support`, that the actual blocker of `w` lies in a named strict cap, deletion of `w` fails at that blocker, and exactly one of the following holds:

1. the row center equals the actual blocker, the selected support equals the canonical critical support, and the row center is not fully deletion robust; or
2. the centers are distinct and the two four-supports overlap in at most two points.

No leaf should introduce a fresh “canonicalize the row” phase before consuming this interface.

##### 16.5.D0.2 - Endpoint notation and invariant table for D3-D9

The source uses `O` both for an oriented packet and informally for the first apex. To prevent role errors, every endpoint proof should begin with the following local abbreviations in comments or `let` bindings.

```text
o := S.oppApex1
c := Q.C                         = C.walk.first  = O.kept
m := C.walk.second              = O.deleted
k := Q.K                         = C.walk.next   = C.fresh
a := H.centerAt c                = H.centerAt k  (endpoint collision blocker)
b := H.centerAt m                                 (reverse blocker)
j := Q.J                                           (fresh first-apex row source)
x := H.centerAt j                                  (actual blocker of j)
```

The equalities involving `c`, `m`, and `k` are dependent equalities. The implementation must use `Q.C_eq_fiber_source₁`, `Q.K_eq_fiber_source₂`, `E.fiber_source₁_eq_first`, `E.fiber_source₂_eq_next`, and `C.walk_*_eq`; it must not expect `simp` to discover every transport automatically.

The following facts are available before any D3-D9 case split.

| Kind | Exact inherited fact |
|---|---|
| carrier | `c,m,k,j,o,a,b,x ∈ D.A` after the standard subtype projections |
| retained radius | `c,m,j ∈ SelectedClass D.A o radius` |
| first-cap interior | `c,m,k,b ∈ S.capInteriorByIndex S.oppIndex1` |
| apex placement | `o ∉ S.capByIndex S.oppIndex1` |
| reverse row | the canonical shell centered at `b` contains `c` and `m`, and omits `k` |
| endpoint row | the common canonical shell centered at `a` contains `c` and `k` |
| first-apex row | `Q.row` is centered at `o` and contains `c` and `j` |
| cross-hit branch | the canonical shell centered at `x` contains `j` and `k` |
| first omission | `m ∉` the canonical shell centered at `a` |
| second omission | `k ∉` the canonical shell centered at `b` |
| retained equality | `dist o c = dist o m = dist o j` |
| reverse equality | `dist b c = dist b m` |
| endpoint equality | `dist a c = dist a k` |
| cross equality | `dist x j = dist x k` in D3-D7 and the D9 cross arm |
| cap order | `b` lies strictly between `c` and `m` in the ordered first cap |
| role inequalities | `c ≠ m`, `k ≠ c`, `k ≠ m`, `j ≠ c`, `j ≠ k`, and `j ≠ m` |

The cap-order fact is already packaged by

```text
exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit
```

and its metric consequence by

```text
reverseHit_twoCenter_sqdist_acute
```

A new cross-order producer must consume these theorems. It must not discard `m` and `b` merely because the final Kalmanson consumer displays only `o,a,x,j,c,k`.

##### 16.5.D0.3 - Historical pre-bypass closure graph

Before the reverse-hit selector was formalized, the endpoint program proposed five named kernels.  The table is retained as a record of stronger geometric subproblems, but D3--D9 no longer require these kernels for closure; they route through D1.  Only `TA-JOINT-DELETION` (D1) and `TA-TWO-RADIUS-GRID` (D2) remain active roots.

| Kernel ID | Consumers | Exact purpose |
|---|---|---|
| `TA-JOINT-DELETION` | D1; D8 with `b ≠ x` | Rule out a caller-tagged same-source deletion surviving at the first apex and two distinct non-apex centers, while retaining the source's actual blocker, cap provenance, and the caller's omission/reverse data. |
| `TA-TWO-RADIUS-GRID` | D2 | Rule out the exact two-radius grid using its four pair-separation identities and the proved four-inside/four-escape cap census. |
| `TA-ENDPOINT-CROSS-ORDER` | D3, D6, D7; D9 cross arm | Produce one of the existing Kalmanson-forbidden boundary orders from the full reverse-hit endpoint context, including the `b`-between-`c,m` invariant. |
| `TA-SHARED-SIX-SEED` | D4, D5 | Continue from the exact six-point union of the common blocker shell and first-apex row, using the pinned-center universal escape dichotomy. |
| `TA-THREE-PACKET-CYCLE` | D9 cycle arm | Rule out the exact three-source cycle of source-faithful common-deletion packets. |

The kernels must be caller-tagged. A theorem stated only as “three distinct centers survive deletion of one point” is too weak and is locally realizable. Likewise, a theorem stated only as “three actual blockers are distinct” is false as a terminal principle. The packet must retain the cap location, the named pre-deletion shell hits and omissions, and the exact source order generated by the caller.

A safe way to avoid accidental weakening is to use small inductive wrappers rather than one over-general structure. For example:

```lean
inductive TriApexJointDeletionInput ... : Type
  | paired
      (O : OrientedRetainedCommonDeletion P)
      (J : PairedApexClassJointDeletion O)
  | endpointMiss
      (O : OrientedRetainedCommonDeletion P)
      (C : ReverseHitFreshEndpointContext R O)
      (E : RetainedMatchingEndpointCriticalFiber C.walk)
      (Q : EndpointFreshFirstApexRowSource E)
      (K_not_mem_J_shell : ...)
      (packet : CommonDeletionTwoCenterPacket D H Q.K o x)
      (hbx : b ≠ x)
```

The kernel can then pattern-match and use the provenance appropriate to each constructor. Do not erase the constructor tag by projecting only the two packets.

##### 16.5.D0.4 - Existing metric consumers to target

The repository already contains the relevant Kalmanson layer in `CapCrossingKalmanson.lean`. Before creating any coordinate algebra, attempt to reduce to these theorems:

```text
false_of_five_ccw_three_shell_equalities
false_of_selected_rows_in_five_ccw_order
false_of_two_selected_rows_shared_late_pair
false_of_three_selected_rows_bridged_late_pair
false_of_four_ccw_endpoint_centers_bisect_middle_pair
false_of_four_ccw_middle_centers_bisect_endpoint_pair
false_of_four_ccw_late_centers_bisect_early_pair
false_of_four_selected_rows_chained_late_pair
false_of_freshThird_four_order_arms
false_of_seven_ccw_three_chained_bisectors
false_of_seven_ccw_three_chained_selected_rows
false_of_two_selected_middle_rows_shared_endpoint_pair
false_of_six_ccw_two_k2_three_selected_rows
```

The endpoint file itself already proves

```text
false_of_endpointFreshCrossHit_of_orderedPlacement
```

for the six-point order

```text
o < a < x < j < c < k.
```

Therefore D3, D6, and D7 are not missing metric contradiction consumers. They are missing a finite boundary-placement producer or a proof that every non-forbidden placement routes to another already named terminal.

---

##### 16.5.D1 - Paired apex-class joint deletion

**Declaration.** `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`

**Exact signature.** The only explicit arguments are

```lean
(J : PairedApexClassJointDeletion O)
(G : TriApexAllLargeContext D S)
```

but `J` retains both `O` and the complete source-exact packets.

**Correct source inventory.** Let

```text
s := J.source
u := H.centerAt O.kept
v := H.centerAt O.deleted
y := H.centerAt s
o := S.oppApex1.
```

Then the source already gives all of the following.

1. `J.sourceRadius > 0`, `s` lies on that first-apex radius, and the class has cardinality at least four.
2. `s` is omitted by the canonical shells selected at `O.kept` and `O.deleted`.
3. `J.keptPacket` deletes `s` and preserves K4 at `o` and `u`.
4. `J.deletedPacket` deletes `s` and preserves K4 at `o` and `v`.
5. The actual blocker `y` is distinct from `o`, `u`, and `v`.
6. The retained packet `O.packet` makes `u ≠ v`; hence `o,u,v,y` are pairwise distinct.
7. The canonical shell centered at `y` contains `s`; the canonical shells centered at `u` and `v` omit `s`.

The former ledger's first step, “canonicalize all three post-deletion witnesses,” is unnecessary and potentially wrong. Each common-deletion packet already retains its own exact erased-carrier supports and selected rows; these supports need not agree across centers.

**Required normalization block.** Insert the following helper immediately before D1.

```lean
private structure PairedJointDeletionNormalized ... where
  source : ℝ²
  source_mem_A : source ∈ D.A
  sourceRadius : ℝ
  sourceRadius_pos : 0 < sourceRadius
  source_mem_class : source ∈ SelectedClass D.A S.oppApex1 sourceRadius
  sourceClass_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 sourceRadius).card
  keptPacket : CommonDeletionTwoCenterPacket D H source S.oppApex1 keptBlocker
  deletedPacket : CommonDeletionTwoCenterPacket D H source S.oppApex1 deletedBlocker
  centers_pairwise : Set.Pairwise {S.oppApex1, keptBlocker, deletedBlocker, sourceBlocker} (· ≠ ·)
  source_not_mem_keptShell : ...
  source_not_mem_deletedShell : ...
```

If `Set.Pairwise` becomes cumbersome over a literal set, store the six inequalities separately. The normalizer is pure field projection plus the two existing theorems

```text
PairedApexClassJointDeletion.blocker_ne_keptBlocker
PairedApexClassJointDeletion.blocker_ne_deletedBlocker.
```

It must contain no geometry and no `by_cases` split.

**First global continuation.** Choose a selected four-row at the first apex that retains `s`:

```lean
obtain ⟨Row, hsRow⟩ :=
  ATailFirstApexCriticalFiberRow.nonempty_selectedFourClass_preserving_point
    J.sourceRadius_pos J.source_mem_class J.sourceClass_card_ge_four
have hfan := sourceFaithfulDeletionFan_of_triApexAllLargeContext G Row
```

Because the first apex is fully deletion robust in `R`, the nonrobust-center arm of

```text
nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion
```

is impossible. The output therefore gives two distinct support sources in `Row`, their blocker centers in the same strict cap, and one of:

1. the two blocker centers are equal;
2. deleting the second source preserves K4 at the first source's blocker; or
3. deleting the first source preserves K4 at the second source's blocker.

This is the exact point at which the D1-specific continuation kernel begins.

**New typed producer.** Add:

```lean
inductive PairedJointDeletionContinuation ... : Type
  | blockerFiber
      (z w : CriticalShellSystem.CarrierVertex D.A)
      (hzRow : z.1 ∈ Row.support)
      (hwRow : w.1 ∈ Row.support)
      (hzw : z ≠ w)
      (blockerCap : Fin 3)
      (hzCap : H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap)
      (hwCap : H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap)
      (hblockers : H.centerAt z.1 z.2 = H.centerAt w.1 w.2)
  | renewedPacketLeft (... exact CommonDeletionTwoCenterPacket ...)
  | renewedPacketRight (... exact CommonDeletionTwoCenterPacket ...)
```

The two renewed-packet constructors must carry an actual `CommonDeletionTwoCenterPacket`, not merely a `HasNEquidistantPointsAt` proposition. Build it with `nonempty_commonDeletionTwoCenterPacket`, using first-apex robustness for the apex survival, the returned cross-deletion survival for the second center, and the existing actual-blocker inequalities. Preserve the deleted source and both centers literally.

**Final D1 kernel.** The final theorem may be stated as:

```lean
theorem false_of_pairedJointDeletionContinuation_triApex
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S)
    (Row : SelectedFourClass D.A S.oppApex1)
    (hsRow : J.source ∈ Row.support)
    (K : PairedJointDeletionContinuation J Row) : False
```

Its three constructors should route as follows.

- `blockerFiber`: construct the origin-tagged critical fiber using the same field pattern as `RetainedMatchingEndpointCriticalFiber`; then use the selected first-apex row hit to enter the endpoint-cross/common-deletion dispatcher. Do not drop the fact that the colliding sources lie on `Row`.
- `renewedPacketLeft` and `renewedPacketRight`: combine the renewed packet with `J.keptPacket` and `J.deletedPacket`. If a new center equals `u` or `v`, use exact packet equality/omission to collapse. If it is new, construct the caller-tagged `TriApexJointDeletionInput.paired` continuation rather than recursively invoking D1 without a measure.

**Required well-founded measure.** A recursive implementation is permitted only after defining a finite measure. The recommended measure is the lexicographic pair

```text
(number of distinct actual blockers on Row,
 number of unordered Row-source pairs whose cross deletion is not yet certified).
```

The support has exactly four points, so the first coordinate is in `1..4` and the second in `0..6`. A blocker collision strictly decreases the first coordinate after quotienting by blocker fibers; a renewed cross-deletion strictly decreases the second. The kernel must state and prove the decrease at the constructor that recurses. “Choose another source” is not a measure.

**Rejection tests.** Reject a proposed D1 proof if it does any of the following.

- Treats the erased-carrier supports from `J.keptPacket` and `J.deletedPacket` as one circle.
- Infers a contradiction merely from four distinct centers surviving one deletion.
- Recreates blocker-cap localization already supplied by the source-faithful fan.
- Recurses on a new common-deletion packet without a finite decreasing state.

**Completion criterion.** D1 is Lean-closed only when the final body contains no `sorry`, every renewed packet is source-exact, the recursion is visibly well-founded or finite-enumerated over the four-row, and `#print axioms false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core` contains no `sorryAx`.

**Status.** [REDUCED TO `TA-JOINT-DELETION`; KERNEL-OPEN]

---

##### 16.5.D2 - Paired two-radius grid

**Declaration.** `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`

**Exact signature.** The leaf receives

```lean
(Gr : PairedTwoRadiusGrid O)
(place : PairedGridCapPlacement Gr)
(G : TriApexAllLargeContext D S).
```

**Correction to the former ledger.** It is false that all eight grid points lie in the strict first-cap interior. The exact census is:

1. the retained-radius class meets that interior in exactly `{O.kept, O.deleted}`;
2. `Gr.keptPartner` and `Gr.deletedPartner` lie outside it;
3. the other-radius class contributes exactly two interior points;
4. each retained shell contributes exactly one of those two other-radius interior points;
5. the two retained partners lie in opposite adjacent caps; and
6. the two other-radius escapees also lie in opposite adjacent caps.

The last two statements are already proved by

```text
grid_retainedPartners_mem_distinct_adjacentCaps
grid_otherClass_escapees_mem_distinct_adjacentCaps.
```

**Named points.** Use the following neutral names in the new kernel.

```text
r0 := radius
r1 := Gr.otherRadius
p  := S.oppApex1
c0 := O.kept
c1 := O.deleted
c0' := Gr.keptPartner
c1' := Gr.deletedPartner
u0,u1 := Gr.keptOtherFirst, Gr.keptOtherSecond
v0,v1 := Gr.deletedOtherFirst, Gr.deletedOtherSecond.
```

The two shells are disjoint and their union is exactly the union of the two exact four-classes. Each shell consists of one retained-radius pair and one other-radius pair. The source already proves four signed-area reflection identities through `shellClassPair_sep`; use the fields/theorems named

```text
keptRetainedPair_sep
keptOtherPair_sep
deletedRetainedPair_sep
deletedOtherPair_sep.
```

Do not replace these identities by an informal statement that the pairs are mirror images.

**Finite label normalization.** Add a structure that chooses, in each shell's other-radius pair, the interior point and the escapee:

```lean
structure PairedGridOrientedLabels (Gr : PairedTwoRadiusGrid O)
    (place : PairedGridCapPlacement Gr) where
  keptInside keptEscape deletedInside deletedEscape : ℝ²
  kept_pair_eq : {keptInside, keptEscape} = {Gr.keptOtherFirst, Gr.keptOtherSecond}
  deleted_pair_eq : {deletedInside, deletedEscape} =
    {Gr.deletedOtherFirst, Gr.deletedOtherSecond}
  keptInside_mem_firstInterior : ...
  deletedInside_mem_firstInterior : ...
  keptEscape_not_mem_firstInterior : ...
  deletedEscape_not_mem_firstInterior : ...
  retainedEscape_orientation :
    (Gr.keptPartner ∈ left ∧ Gr.deletedPartner ∈ right) ∨
    (Gr.keptPartner ∈ right ∧ Gr.deletedPartner ∈ left)
  otherEscape_orientation :
    (keptEscape ∈ left ∧ deletedEscape ∈ right) ∨
    (keptEscape ∈ right ∧ deletedEscape ∈ left)
```

Construct it by the existing exact-cardinality slice lemmas and the two distinct-adjacent-cap theorems. This construction has only four binary choices: which named member is inside for each shell, and the two left/right orientations. Keep those choices in typed fields; do not immediately explode into sixteen nearly identical goals.

**Blocker localization.** For each retained shell center, call

```text
exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge.
```

This gives two blocker-cap indices. Split only on equality of those indices.

- **Same blocker cap.** Use the source's one-hit theorem for every rich *other* cap and the fact that each shell has a named pair on each first-apex radius. The goal is to force one shell to have two points in a radius slice belonging to a rich apex different from its blocker cap, contradicting `exists_criticalShell_center_with_otherRichCapSlice_card_le_one`. The label structure is needed to identify which of the four escapees is in that other cap.
- **Different blocker caps.** The two blocker caps and the first-apex cap exhaust the three indices. Orient the boundary by the first-apex cap, transport the four pair-separation identities to `btw` alternation statements with `SurplusCOMPGBank.btw_sep`, and reduce the resulting six- or eight-point order to one of the existing Kalmanson consumers.

**Exact kernel statement.** The new theorem should consume the full structures, not a manually copied list of equalities:

```lean
theorem false_of_pairedTwoRadiusGrid_capCensus
    (Gr : PairedTwoRadiusGrid O)
    (place : PairedGridCapPlacement Gr)
    (labels : PairedGridOrientedLabels Gr place)
    (G : TriApexAllLargeContext D S) : False
```

**Suggested finite order output.** Instead of proving `False` directly in the producer, define an inductive `PairedGridForbiddenOrderOutcome` whose constructors each contain the exact indices and inequalities required by one existing Kalmanson theorem. The proof of `false_of_pairedTwoRadiusGrid_capCensus` should be only:

```lean
obtain ⟨outcome⟩ := nonempty_pairedGridForbiddenOrderOutcome Gr place labels G
cases outcome <;> exact <corresponding existing Kalmanson consumer>
```

This separates finite cap/order bookkeeping from metric contradiction and makes each constructor independently testable.

**Rejection tests.** Reject any proof based on “inner-circle points lie inside the outer hull”; two concentric four-sets can be convexly independent. Reject any proof that assumes `r0 < r1` without a `lt_or_gt_of_ne` split. Reject any proof that treats the four `*_sep` identities as one global reflection across a common axis: the two shell blockers may be different.

**Completion criterion.** The cap census must be used exactly as stated, both blocker-cap cases must be exhausted, and every terminal must invoke a checked strict-convexity/Kalmanson theorem or an exact one-hit contradiction. A coordinate proof is acceptable only if it is derived from the same finite outcome and includes all positivity and distinctness hypotheses.

**Status.** [REDUCED TO `TA-TWO-RADIUS-GRID`; KERNEL-OPEN]

---

##### 16.5.D3 - Endpoint cross hit with `a = j`

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core`

**Exact role collision.** The hypothesis is

```lean
hAJ : H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J,
```

that is, `a = j`. It does **not** make `j` the center of `Q.row`; `Q.row` remains centered at `o`.

**Exact metric core after rewriting.** The five distinct points `j,o,x,k,c` satisfy

```text
dist x j = dist x k          -- cross shell at x
dist j k = dist j c          -- common endpoint shell, after a = j
dist o c = dist o j          -- first-apex row.
```

These equalities fit `CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities` under the role assignment

```text
iO = j,  iA = o,  iY = x,  iE = k,  iC = c,
```

provided the boundary can be rotated/reversed to the strict order

```text
j < o < x < k < c.
```

The former claim that `a = j` should immediately force center-in-own-support is incorrect. None of the three displayed rows has its center among the two displayed support points solely from this equality.

**Required producer.** Add:

```lean
inductive FirstCenterEqFreshSourceOrderOutcome ... : Type
  | kalmansonFive
      (boundary : Fin D.A.card → ℝ²) ...
      (ij io ix ik ic : Fin D.A.card)
      (hjo : ij < io) (hox : io < ix) (hxk : ix < ik) (hkc : ik < ic)
      (hj : boundary ij = Q.J)
      (ho : boundary io = S.oppApex1)
      (hx : boundary ix = H.centerAt Q.J Q.J_mem_A)
      (hk : boundary ik = Q.K)
      (hc : boundary ic = Q.C)
  | routeSharedSeed (... exact data proving a shared-blocker/adjacent-cap branch ...)
  | routeJointDeletion (... exact source-exact packet ...)
```

The producer must use the full `C` context, especially the reverse blocker `b` between `c` and `m`; it is not enough to enumerate orders of the five displayed points in isolation. Any boundary order not yielding the Kalmanson arm must be shown to imply a previously named route, not silently discarded.

**Leaf proof skeleton.** Once the producer exists:

```lean
rcases nonempty_firstCenterEqFreshSourceOrderOutcome
    R O C E Q K_mem_J_shell hAJ with ⟨outcome⟩
cases outcome with
| kalmansonFive boundary hinj himage hccw ij io ix ik ic
    hjo hox hxk hkc hj ho hx hk hc =>
    apply CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities
      D.convex hinj himage hccw hjo hox hxk hkc
    · -- x-row, j and k
      simpa [hj, hx, hk] using <cross-shell radius equality>
    · -- j-row after a = j, k and c
      simpa [hj, hk, hc, hAJ] using <endpoint-shell radius equality>
    · -- o-row, c and j
      simpa [ho, hc, hj] using <Q.row radius equality>
| routeSharedSeed data => exact <D4/D5 shared-seed consumer> data
| routeJointDeletion data => exact <TA-JOINT-DELETION consumer> data
```

Use `dist_comm` only at the final `simpa` boundary; keep the source equalities in their natural center-first orientation.

**Completion criterion.** Every boundary placement consistent with the cap and reverse-hit context is covered by one constructor, and the `kalmansonFive` constructor invokes the existing five-point theorem exactly once.

**Status.** [REDUCED TO ROLE-COLLAPSED `TA-ENDPOINT-CROSS-ORDER`; KERNEL-OPEN]

---

##### 16.5.D4 - Shared blocker, `j` in the left adjacent cap

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`

**Exact hypotheses.** In addition to the cross hit, the leaf has

```text
a = x,
j ∉ first strict-cap interior,
j ∈ leftAdjacentCapByIndex first-index.
```

**Normalization already proved in the source.** Do not repeat it. The following checked theorems are available.

```text
endpointFresh_support_eq_of_sharedBlocker
endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
endpointFresh_sharedBlocker_fourth_packet
endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker
endpointFresh_sharedBlocker_frontierRadius_fourth_packet
endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton
endpointFresh_frontierRadiusClass_inter_rightAdjacentCap_eq_singleton
endpointFresh_sharedBlocker_pair_alternates
endpointFresh_twoShellSeed_subset_carrier
endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker
endpointFresh_exists_selectedRow_escape_twoShellSeed
endpointFresh_exists_criticalRow_escape_or_fullyDeletionRobust_twoShellSeed
endpointFresh_exists_prescribedRow_escape_twoShellSeed_of_sharedBlocker
endpointFresh_exists_seedCenter_all_selectedRows_escape_twoShellSeed_of_sharedBlocker
endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_of_sharedBlocker
endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_selectedClass_seed_card_le_three
endpointFresh_exists_pinnedCenter_universal_escape_dichotomy.
```

In particular, the common shell centered at `a=x` has an exact support

```text
{c,k,j,L}
```

for a unique fourth point `L`; its intersection with `Q.row.support` is exactly `{c,j}`; `k` and `L` lie outside `Q.row` and outside the retained first-apex radius; and

```lean
(endpointFreshTwoShellSeed E Q).card = 6.
```

The source also proves that `c` and `j` alternate across the chord `o-a` in every compatible boundary indexing.

**Required first lines.** The D4 proof must begin:

```lean
have hcard15 : 15 ≤ D.A.card :=
  ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
    S C.allLarge.cap_card_ge_six
obtain ⟨p, hpSeed, hp_ne_o, hp_ne_a, hpMult, hpFan⟩ :=
  endpointFresh_exists_pinnedCenter_universal_escape_dichotomy
    R E Q K_mem_J_shell hAX hcard15
```

Here `p` is chosen once. For every selected four-row `Kp` centered at `p` and every `z ∈ Kp.support` outside the six-point seed, `hpFan` returns exactly one of:

1. `p = blocker(z)`, support equality, and `¬ FullyDeletionRobustAt D p`; or
2. `p ≠ blocker(z)` and support overlap at most two.

**Finite continuation state.** Define:

```lean
structure SharedSeedState ... where
  seed : Finset ℝ² := endpointFreshTwoShellSeed E Q
  pinned : ℝ²
  pinned_mem_seed : pinned ∈ seed
  pinned_ne_apex : pinned ≠ o
  pinned_ne_sharedBlocker : pinned ≠ a
  seed_card : seed.card = 6
  multiplicity_le_three :
    ∀ r, 0 < r → ((SelectedClass D.A pinned r) ∩ seed).card ≤ 3
  universal_escape : ...
  side : AdjacentSide := .left
  j_side : j ∈ leftAdjacentCapByIndex ...
  pair_alternates : ...
```

Do not store only the six-point finset; the side and alternation data are load-bearing.

**Exact continuation producer.** For an arbitrary selected row `Kp` at `p`, choose its source-faithful fan with

```lean
have hfan := sourceFaithfulDeletionFan_of_triApexAllLargeContext C.allLarge Kp
```

and obtain an escaping `z` from `hpFan`. Then produce one of the following typed outcomes.

```lean
inductive SharedSeedContinuationOutcome ... : Type
  | pinnedNonrobust
      (Kp : SelectedFourClass D.A p)
      (z : ℝ²) ...
      (hcenter : p = H.centerAt z ...)
      (hsupport : Kp.support = shell(z).support)
      (hnotRobust : ¬ FullyDeletionRobustAt D p)
  | sameCapBlockerFiber
      (z w : CarrierVertex D.A) ...
      (hblockers : blocker z = blocker w)
  | renewedCrossDeletion
      (z w : CarrierVertex D.A) ...
      (packet : CommonDeletionTwoCenterPacket D H w p (blocker z))
  | forbiddenBoundaryOrder
      (placement : <indices needed by an existing Kalmanson theorem>)
```

The producer should call

```text
nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion
```

on `Kp`. The equal-center/nonrobust result from `hpFan` is retained as the first constructor; the other fan outcomes yield the next two constructors after building a source-exact packet. The left-adjacent side and `pair_alternates` must be used to convert any same-cap blocker pair that touches the exposed seed into `forbiddenBoundaryOrder` whenever possible.

**Global count use.** The `pinnedNonrobust` constructor is not itself a contradiction. To consume it, maintain a finite map from each pinned seed center to its witnessed nonrobust center and use `C.allLarge.notRobustCover_card` only after proving a bound on the number of distinct centers obtainable from the six seed roles. The target inequality is

```text
(notRobustCenters D).card ≤ 3,
```

which together with `15 ≤ D.A.card` and `D.A.card ≤ 4 * ...` would contradict arithmetic. Do not assert this bound without proving that every nonrobust center is represented by one of the three exposed center roles; the current source does not provide that conclusion automatically.

**Well-founded alternative.** If the count bound cannot be proved, use a finite state over the six seed sources. Record, for every ordered pair of seed sources, whether its cross deletion has been certified. There are at most `6*5 = 30` directed pairs. A renewed packet must mark a previously unmarked pair; a blocker-fiber constructor reduces the blocker partition. This gives a lexicographic finite measure analogous to D1. The state must include source identities, not just blocker centers.

**Rejection tests.** Reject any proof that:

- tries to identify the selected first-apex four-support with the full retained physical class;
- claims the six-point seed exhausts the carrier;
- treats the nonrobust branch as an immediate contradiction;
- invokes informal left/right symmetry; or
- discards the unique fourth common-shell point `L`.

**Completion criterion.** The final shared-seed kernel must exhaust the universal-escape dichotomy at the fixed pinned center and either terminate in a checked Kalmanson contradiction or decrease an explicit finite state. Merely producing another escaping row is not closure.

**Status.** [REDUCED TO `TA-SHARED-SIX-SEED`; KERNEL-OPEN]

---

##### 16.5.D5 - Shared blocker, `j` in the right adjacent cap

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core`

This is the reflected placement companion of D4, but Lean cannot close it by the phrase “by symmetry.” There are two acceptable implementations.

**Preferred implementation: explicit boundary reversal adapter.** Prove once, immediately before D4, a theorem transporting all of the following under reversal of a `BoundaryIndexing D.A`:

1. membership in `leftAdjacentCapByIndex` and `rightAdjacentCapByIndex` is exchanged;
2. `SurplusCOMPGBank.btw` is transformed with the correct negation/order reversal;
3. `endpointFresh_sharedBlocker_pair_alternates` is preserved;
4. the selected-row and shell equalities are unchanged because Euclidean distance is symmetric; and
5. the source roles `c,k,j,L` and blocker roles `o,a` are not relabeled.

The adapter should return a right-side `SharedSeedState` as a left-side state over the reversed boundary. D5 then becomes a one-line application of the side-neutral shared-seed kernel.

**Fallback implementation: side parameter.** Parameterize the D4 kernel by

```lean
inductive AdjacentSide | left | right
```

and define side-dependent cap membership and order predicates. Prove both branches by `cases side`. This is preferable to duplicating the entire D4 continuation.

**Forbidden shortcut.** Do not exchange `O.kept` and `O.deleted`, or `c` and `k`, as part of the reflection. The cross-hit, row-hit, and retained-radius roles are directed and are not symmetric under that swap.

**Completion criterion.** D5 must reduce to exactly the same kernel as D4 through a checked reversal/side adapter, with no second copy of the global continuation proof.

**Status.** [REDUCED TO D4 VIA EXPLICIT SIDE ADAPTER; ADAPTER AND `TA-SHARED-SIX-SEED` OPEN]

---

##### 16.5.D6 - Endpoint cross hit with `x = c`

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core`

**Exact role collision.** The hypothesis is

```lean
hXC : H.centerAt Q.J Q.J_mem_A = Q.C,
```

that is, `x = c`. It does not identify the endpoint blocker `a` with `c`.

**Exact metric core after rewriting.** The five distinct points `c,a,o,j,k` satisfy

```text
dist o c = dist o j          -- first-apex row
dist c j = dist c k          -- cross shell after x = c
dist a k = dist a c          -- endpoint common shell.
```

They fit `false_of_five_ccw_three_shell_equalities` under

```text
iO = c,  iA = a,  iY = o,  iE = j,  iC = k,
```

provided the boundary can be normalized to

```text
c < a < o < j < k.
```

The former “look for self-support or a blocker two-cycle” program is not complete: the displayed equalities are a realizable local five-point pattern in some orders. Cap and reverse-hit provenance are required to force a forbidden order or another terminal.

**Required producer and proof skeleton.** Mirror D3 with a distinct inductive `SecondCenterEqFirstSourceOrderOutcome`. Its Kalmanson constructor stores the five indices in the order above; its other constructors route to the shared-seed or joint-deletion kernels with exact packet data. In the Kalmanson branch, instantiate the existing theorem with:

```text
Y-row = Q.row centered at o, hitting c,j;
O-row = canonical shell centered at c=x, hitting j,k;
A-row = canonical shell centered at a, hitting k,c.
```

Use `hXC` only to rewrite the center of the cross shell; do not rewrite every occurrence of the source point `c` through dependent packet fields.

**Completion criterion.** Same as D3: exhaustive placement/route outcome, one checked Kalmanson call in the forbidden-order arm, and no unsupported self-support claim.

**Status.** [REDUCED TO ROLE-COLLAPSED `TA-ENDPOINT-CROSS-ORDER`; KERNEL-OPEN]

---

##### 16.5.D7 - Generic six-role endpoint cross hit

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core`

**Exact distinctness.** The explicit hypotheses exclude

```text
a = j,
a = x,
x = c.
```

Together with the endpoint structures' inherited inequalities, the displayed roles

```text
o,a,x,j,c,k
```

are pairwise distinct. The middle source `m` and reverse blocker `b` remain additional named points and must not be forgotten by the order producer.

**Existing terminal.** The source already defines `EndpointFreshOrderedCrossRowPlacement Q` and proves

```lean
false_of_endpointFreshCrossHit_of_orderedPlacement
```

for the strict order

```text
o < a < x < j < c < k.
```

No new proof of that metric implication is needed.

**Exact missing producer.** Add:

```lean
inductive EndpointFreshCrossGlobalOutcome ... : Type
  | orderedCross
      (placement : EndpointFreshOrderedCrossRowPlacement Q)
  | firstCenterEqFreshSource (hAJ : a = j)
  | sharedBlocker (hAX : a = x)
  | secondCenterEqFirstSource (hXC : x = c)
  | endpointMiss
      (K_not_mem_J_shell : ...)
      (packet : CommonDeletionTwoCenterPacket D H k o x)
  | threePacketCycle (...)
```

For D7 the three equality constructors are impossible by its hypotheses, but including them in the producer makes the finite classification reusable by D3 and D6 and prevents duplicated order analysis.

The producer must consume:

1. `C.reverseShell_inter_cap_eq`;
2. `exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit`, retaining the indices of `c,b,m`;
3. `reverseHit_twoCenter_sqdist_acute`;
4. the cap locations of `c,m,k,b`;
5. the first-apex equalities on `c,m,j`;
6. the endpoint and cross equalities; and
7. blocker-cap localization for `a` and `x` from `C.allLarge`.

**Finite order implementation.** Use a `BoundaryIndexing D.A` and record only `btw` predicates until the final constructor. Split first on the cap index of `a`, then on the cap index of `x`. There are nine index pairs, but most collapse by `triApexAllLargeContext_index_cases`. Within each pair, use:

```text
SurplusCOMPGBank.btw_sep
criticalShellCenter_mem_capInteriorByIndex_of_two_hits
criticalShell_inter_otherRichCapSlice_card_le_one
```

and the reverse `c-b-m` order to decide whether `a` and `x` can lie in the same interval. Only after proving the cyclic `btw` pattern should the producer choose a linear cut and construct `EndpointFreshOrderedCrossRowPlacement`.

**No unproved strict potential.** The former program proposed a cyclic potential but did not define one. Do not introduce a “strictly advances” lemma unless its codomain, order, and edge-by-edge proof are all explicit. A finite order outcome is preferable because the consumer already exists.

**Leaf body after producer.** It should be structurally trivial:

```lean
rcases nonempty_endpointFreshCrossGlobalOutcome R O C E Q K_mem_J_shell with
  ⟨outcome⟩
cases outcome with
| orderedCross placement =>
    exact false_of_endpointFreshCrossHit_of_orderedPlacement placement K_mem_J_shell
| firstCenterEqFreshSource h => exact False.elim (hAJ h)
| sharedBlocker h => exact False.elim (hAX h)
| secondCenterEqFirstSource h => exact False.elim (hXC h)
| endpointMiss hmiss packet => exact <D8 consumer> ...
| threePacketCycle cycle => exact <D9 cycle consumer> cycle
```

If the producer is used only after the cross hit is known, `endpointMiss` can be omitted; if a more upstream producer is chosen, retain it exactly as shown.

**Completion criterion.** D7 is closed when every cap-index/order arm constructs one of the typed outcomes and the leaf body itself contains no geometric reasoning beyond calling existing consumers.

**Status.** [REDUCED TO GENERIC `TA-ENDPOINT-CROSS-ORDER`; KERNEL-OPEN]

---

##### 16.5.D8 - Endpoint cross miss and a fresh common-deletion packet

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`

**Major correction to the former ledger.** This leaf does not contain only one two-center packet. It contains two packets deleting the **same** source `k`:

```text
C.freshPacket : CommonDeletionTwoCenterPacket D H k o b
packet        : CommonDeletionTwoCenterPacket D H k o x.
```

The cross miss is

```text
k ∉ shell(j),
```

and is the source of the second packet. The correct first split is therefore

```lean
by_cases hbx : b = x
```

not a robust-versus-critical split.

###### 16.5.D8.a - Equal secondary blockers: complete contradiction


> **Lean closure annotation — [LEAN-BRANCH-CLOSER].** This is a complete contradiction for the equal-secondary-blocker child of `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`. Formalizing the displayed support rewrite and three-point intersection count should close that child; the distinct-secondary-blocker child remains routed to `TA-JOINT-DELETION`.
Assume `hbx : b = x`. The canonical shell selected at `m` is centered at `b`; the canonical shell selected at `j` is centered at `x`. By uniqueness of the critical support at a chosen center, `hbx` gives equality of these supports. The common support contains:

1. `c`, by `C.reverse_mem`;
2. `m`, because every selected critical shell contains its own source; and
3. `j`, after transporting the own-source membership of `shell(j)` across the support equality.

The three points are pairwise distinct and all lie on the retained first-apex radius:

```text
c ≠ m                 from O.sources_ne / walk.first_ne_second,
j ≠ c                 from Q.J_ne_C,
j ≠ m                 from Q.J_ne_middle plus C.walk_second_eq,
c,m,j ∈ SelectedClass D.A o radius.
```

The shell center `b` is distinct from `o` because `C.freshPacket.centers_ne` or `R.actualBlocker_ne_firstApex` supplies that inequality. Thus the canonical shell at `b` and any selected four-class at `o` preserving `c,m,j` are circles with distinct centers and at least three common points, contradicting `SelectedFourClass.inter_card_le_two`. An even shorter implementation can use the existing frontier-specific bound

```text
ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two.
```

**Lean-facing skeleton.** The exact support-equality theorem name already used elsewhere in this file is

```text
ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support.
```

The branch should have the following shape.

```lean
· have hsupp :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support =
        (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support := by
    rw [← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
          H O.deleted O.deleted_mem_A,
        ← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
          H Q.J Q.J_mem_A,
        hbx]

  have hj_reverse :
      Q.J ∈ (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    rw [hsupp]
    exact (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.q_mem_support

  have hthree :
      3 ≤ ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius).card := by
    -- show `{Q.C, O.deleted, Q.J}` is a subset of the intersection;
    -- prove its card is three from Q.J_ne_C, Q.J_ne_middle, and O.sources_ne;
    -- then apply `Finset.card_le_card`.

  have htwo :=
    ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
      R O.deleted O.deleted_mem_A
  omega
```

The exact argument order of `criticalShell_inter_frontierRadiusClass_card_le_two` should be copied from its existing calls around the shared-blocker helpers. Do not invent a new circle-intersection theorem.

This is a complete mathematical contradiction. The only remaining work is dependent rewriting and finset-cardinality syntax.

**Status of D8.a.** [PROSE-CLOSED SUBCASE; LOW-LEVEL LEAN PATCH SPECIFIED]

###### 16.5.D8.b - Distinct secondary blockers

Assume `hbx : b ≠ x`. Then the two packets show that deletion of `k` preserves K4 at the three pairwise-distinct centers

```text
o, b, x,
```

while the actual blocker `a = H.centerAt k` is distinct from all three. Retain the following caller-specific facts:

1. `b` lies in the strict first cap and strictly between `c` and `m`;
2. the shell centered at `b` contains `c,m` and omits `k`;
3. `x` is the actual blocker of `j`;
4. `j,c,m` lie on the retained first-apex radius;
5. `k` lies in the strict first cap and is omitted by both the `b`-shell and the `x`-shell; and
6. `Q.row` contains `c,j`.

Package this as the `.endpointMiss` constructor of `TriApexJointDeletionInput`; do not project it to a bare pair of packets. The `TA-JOINT-DELETION` kernel must either produce a forbidden endpoint order, a blocker collision routed to D3-D6, or a finite-state decrease.

**Leaf body.** After adding the direct branch and the kernel:

```lean
by_cases hbx :
    H.centerAt O.deleted O.deleted_mem_A = H.centerAt Q.J Q.J_mem_A
· exact <D8.a proof>
· exact false_of_triApexJointDeletionInput
    (.endpointMiss O C E Q K_not_mem_J_shell packet hbx)
```

**Rejection tests.** Do not claim D8 lacks a third center; it has `o,b,x`. Do not treat the two first-apex erased supports as equal. Do not route the distinct branch to a tetrahedron theorem unless that theorem's three exact rows and four-point seed are actually constructed.

**Overall status.** [EQUAL-BLOCKER ARM PROSE-CLOSED; DISTINCT ARM REDUCED TO `TA-JOINT-DELETION`; LEAF STILL OPEN]

---

##### 16.5.D9 - Three consecutive distinct blockers

**Declaration.** `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core`

**Exact first step already proved upstream.** The leaf must begin with

```lean
rcases ATailRetainedMatchingEndpointContinuation.nonempty_threeDistinctEndpointCrossOrCycle
    path with ⟨outcome⟩
cases outcome with
| crossHit first_mem_next_shell => ...
| threeStepCycle first_not_mem_next_shell thirdPacket => ...
```

The old program's first step, “define a potential on three blocker edges,” skipped this checked dichotomy and should be removed.

###### 16.5.D9.a - Cross-hit arm

The cross hit is

```text
c ∈ shell(k),
```

where the shell center is `x = H.centerAt k`. Together with the first-apex and reverse rows, the arm has the metric equalities

```text
dist o c = dist o m,
dist b c = dist b m,
dist x c = dist x k.
```

It also has the strict first-cap order with `b` between `c,m`, the omissions `m ∉ shell(c)` and `k ∉ shell(m)`, and pairwise distinct blockers `a,b,x` from `path`.

This is a variant of `TA-ENDPOINT-CROSS-ORDER`, but it does not yet have the fresh first-apex row source `j`. Use the exact continuation theorem that produced `EndpointFreshFirstApexRowSource` in the collision branch, or prove a small row-source selector at `o` preserving `c` and avoiding `{m,k}`. The selector must use a four-or-larger first-apex class and return source membership proofs. Then split on whether the selected source's canonical shell hits `k`, reproducing D3-D8 with source provenance.

Recommended helper:

```lean
inductive ThreeDistinctCrossContinuation ... : Type
  | endpointRow
      (Q : EndpointFreshFirstApexRowSource <constructed fiber/context>)
      (hitOrPacket : EndpointFreshCrossOrCommonDeletion Q)
  | directKalmanson
      (placement : <existing four/six-point consumer input>)
```

If constructing an endpoint critical fiber is impossible because `a ≠ x`, do not fake one. In that case use the direct Kalmanson constructor and the rows centered at `o,b,x`.

###### 16.5.D9.b - Three-step cycle arm

The source returns

```lean
thirdPacket : CommonDeletionTwoCenterPacket D H c o x.
```

Together with the walk, the exact source cycle is:

```text
firstPacket  : delete m, survive at o and a;
secondPacket : delete k, survive at o and b;
thirdPacket  : delete c, survive at o and x.
```

The sources `c,m,k` are pairwise distinct; the blockers `a,b,x` are pairwise distinct; all three sources lie in the first strict cap except that only `c,m` are on the retained radius; and the first two directed omissions are already named by the walk. The third arm explicitly gives `c ∉ shell(k)`.

Package exactly this data:

```lean
structure TriApexThreePacketCycle ... : Type where
  first second next : ℝ²
  sources_pairwise : ...
  firstBlocker secondBlocker nextBlocker : ℝ²
  blockers_pairwise : ...
  first_mem_radius : ...
  second_mem_radius : ...
  first_mem_firstInterior : ...
  second_mem_firstInterior : ...
  next_mem_firstInterior : ...
  firstPacket : CommonDeletionTwoCenterPacket D H second o firstBlocker
  secondPacket : CommonDeletionTwoCenterPacket D H next o secondBlocker
  thirdPacket : CommonDeletionTwoCenterPacket D H first o nextBlocker
  first_to_second_omission : ...
  second_to_next_omission : ...
  next_to_first_omission : ...
  reverseHit : c ∈ shell(m)
  reverseBlocker_between : <ordered-cap packet or its existential theorem input>
```

The last two fields distinguish this live cycle from an arbitrary realizable three-packet cycle.

**Cycle kernel implementation choices.** Use one of the following, in order of preference.

1. **Finite boundary-order outcome.** Localize `a,b,x` to cap indices, combine the `b`-between-`c,m` order with the three omission edges, and produce one of the existing seven-point chained-bisector Kalmanson consumers.
2. **Finite source/blocker state.** Enumerate the three source rows and the blocker partition. Any continuation must either repeat a blocker, routing to the endpoint equality/shared-blocker leaves, or certify a new directed cross deletion. There are only six directed source pairs. Prove strict decrease in the number of uncertified pairs.
3. **Strict cyclic potential.** Acceptable only if a concrete finite ordered type is defined and all three packet edges prove strict increase. The phrase “cap interval advances” is not sufficient.

**Leaf proof skeleton.** After the exact split:

```lean
cases outcome with
| crossHit hcross =>
    exact false_of_threeDistinctCrossContinuation ... hcross
| threeStepCycle hmiss thirdPacket =>
    exact false_of_triApexThreePacketCycle
      (triApexThreePacketCycle_of_walk C path hmiss thirdPacket)
```

**Rejection tests.** Three distinct successive blockers do not by themselves contradict finiteness. A three-packet cycle is not a contradiction without using the reverse hit, cap order, or a finite decrease. Do not use blocker radius as a potential: the three canonical radii are unrelated.

**Status.** [EXACTLY SPLIT INTO `TA-ENDPOINT-CROSS-ORDER` AND `TA-THREE-PACKET-CYCLE`; BOTH KERNELS OPEN]

---

##### 16.5.D10 - Low-level implementation order

The reverse-hit portion of the former order is complete.  The remaining order is:

1. **Formalize D2.** Port the trig-free polynomial core, then supply the three
   coordinate/order adapters from `PairedTwoRadiusGrid` and
   `PairedGridCapPlacement`.
2. **Attack D1 with its full provenance.** Consume the six-center
   fail-vs-survive surface carried by `PairedApexClassJointDeletion`; do not
   weaken it to an anonymous multi-center survival claim.
3. **Keep D3--D9 transparent.** Their endpoint-specific APIs may support
   auxiliary research, but no new `sorry` may be introduced below them.
4. **Rebuild and re-mine after each root closes.** The module token count must
   fall from two to one to zero, and `#print axioms` must confirm that
   `sorryAx` disappears from the corresponding route.

##### 16.5.D11 - Completion matrix

| Leaf | Normalization complete in current source | New mechanical work | Final kernel | Current status |
|---|---:|---|---|---|
| D1 | yes | selected apex row preserving `J.source`; source-faithful fan outcome; exact renewed-packet constructor; finite measure | `TA-JOINT-DELETION` | kernel open |
| D2 | yes | oriented inside/escape labels; blocker-cap split; finite forbidden-order outcome | `TA-TWO-RADIUS-GRID` | kernel open |
| D3 | reverse-hit selector proved | none for closure; endpoint data retained by API | D1 | source-clean wrapper |
| D4 | reverse-hit selector proved | none for closure; endpoint data retained by API | D1 | source-clean wrapper |
| D5 | reverse-hit selector proved | none for closure; endpoint data retained by API | D1 | source-clean wrapper |
| D6 | reverse-hit selector proved | none for closure; endpoint data retained by API | D1 | source-clean wrapper |
| D7 | reverse-hit selector proved | none for closure; endpoint data retained by API | D1 | source-clean wrapper |
| D8 | reverse-hit selector proved; historical equal-blocker closer retained | none for closure; distinct-cycle evidence is off the active route | D1 | source-clean wrapper |
| D9 | reverse-hit selector proved | none for closure; historical cross/cycle producer retained | D1 | source-clean wrapper |

##### 16.5.D12 - Build, axiom, and regression checks

Every low-level agent working this cluster must use the following completion protocol.

1. Compile the edited module directly with the repository's normal Lean command before running the full build.
2. Run the full project build after every new imported theorem or refactor.
3. Add temporary `#check` commands for every existing theorem name used in a skeleton; remove them after the proof elaborates.
4. Run

```bash
rg -n '\bsorry\b|axiom ' lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean
```

and inspect every match. New `axiom` declarations are forbidden.
5. Run `#print axioms` on D1, D2, the selector, the generic reverse-hit route,
   and the publish target.  The selector must remain kernel-clean; the route is
   expected to contain `sorryAx` until D1 closes.
6. Preserve exact source identities through every `CommonDeletionTwoCenterPacket`. A packet deleting `q` may not be rebuilt with a proposition about an unnamed deletion source.
7. Never identify two selected supports merely because they have the same cardinality or radius. Support equality requires equal canonical centers or an explicit existing theorem.
8. Never treat a selected four-support as the entire physical `SelectedClass` unless exact class cardinality four and both inclusions have been proved.
9. In D2, assert the exact four-inside/four-escape census in a regression lemma. This catches reintroduction of the former “all eight inside” error.
10. In D4/D5, retain the unique fourth common-shell point and verify the seed cardinality remains six.
11. Preserve the historical D8 equal-secondary-blocker theorem and D9
    cross-or-cycle producer as source-clean auxiliary results; neither is a
    prerequisite on the active reverse-hit spine.

##### 16.5.D13 - Confidence assessment

The source-level confidence is high: the live theorem signatures, caller packets, cap census, shared-support collapse, and endpoint continuation splits are now identified exactly, and the former inaccurate closure programs have been removed.

The formalization risk is uneven.

- **Completed low-risk layer:** the reverse-hit finite selector, both renewed
  source-exact packets, the generic D1 route, and the seven compatibility
  wrappers compile and have been kernel-mined.
- **Medium risk:** D2's finite label normalization and the three adapters into
  the prose-closed polynomial contradiction.
- **High risk:** the provenance-rich D1 six-center fail-vs-survive
  contradiction.  This is the remaining mathematical F1 research kernel, not
  an endpoint bookkeeping gap.

Accordingly, this section is now low-level complete as a **formalization specification** for the bypass.  The TriApex cluster is not mathematically or kernel-closed until D1 and D2 are proved.

**Overall status.** [REVERSE-HIT BYPASS KERNEL-CHECKED; TWO MATHEMATICAL ROOTS OPEN; NO CLAIM OF FINAL LEAN CLOSURE]

#### 16.5.E-H F2 TwoSource cluster — all-blockers semantic refactor

**Date:** 22 August 2026
**Scope:** the F2 TwoSource branch after two disjoint retained first-cap
collision pairs and the cap-eight margin have been obtained
**Status:** **[THE OLD SIX-LEAF REDUCTION IS BYPASSED; THE NEW SEMANTIC
REDUCTION IS PROSE-CLOSED; FOUR INTRINSIC TERMINALS REMAIN OPEN]**

##### 0. Main conclusion

The present F2 decomposition is not the mathematically natural one.  It fixes
a total `CriticalShellSystem` before the two additional cap sources and before
the useful source pairs are known.  The later FreshThird, outside-fiber,
cross-blocker, and acyclic-hard cases then record accidents of that early
choice.

The correct semantic order is:

1. retain the two canonical collision rows intrinsically;
2. retain **all** legal canonical blockers of every source;
3. choose two fresh strict-first-cap sources;
4. classify their first-apex radii;
5. only then ask whether they have a common canonical blocker; and
6. choose a blocker section realizing the selected branch.

This removes the finite-map multiplicity split and the FreshThird fiber from
the load-bearing proof.  The six old F2 leaves are replaced by four intrinsic
packets:

| Radius mode | Blocker mode | New packet |
|---|---|---|
| common first-apex radius | common canonical blocker | `CR-CB` |
| common first-apex radius | no common canonical blocker | `CR-MO` |
| aligned singleton first-apex radii | common canonical blocker | `AR-CB` |
| aligned singleton first-apex radii | no common canonical blocker | `AR-MO` |

The reduction to these four packets is proved below.  It is
cardinality-independent once the first cap has cardinality at least eight.

The four packets are not yet contradicted.  They are the genuine geometric
frontier after removing blocker-map choice artifacts.  In particular, this
document does **not** assert that F2 as a whole is proved.

---

##### 1. Intrinsic context

Let \(A=D.A\), and let

\[
O=S.\mathrm{oppApex1},\qquad
C=S.\mathrm{capByIndex}(S.\mathrm{oppIndex1}),\qquad
I=S.\mathrm{capInteriorByIndex}(S.\mathrm{oppIndex1}).
\]

The F2 ingress supplies two distinct positive first-apex radii
\(r\ne \rho\) and four pairwise distinct points

\[
p_1,p_2,q_1,q_2\in I
\]

such that

\[
\begin{aligned}
\operatorname{Sel}_A(O,r)\cap I&=\{p_1,p_2\},\\
\operatorname{Sel}_A(O,\rho)\cap I&=\{q_1,q_2\},\\
|\operatorname{Sel}_A(O,r)|&=4,\\
|\operatorname{Sel}_A(O,\rho)|&=4.
\end{aligned}
\tag{F2.1.1}
\]

Write

\[
P=\{p_1,p_2\},\qquad Q=\{q_1,q_2\},\qquad R=P\cup Q.
\tag{F2.1.2}
\]

The retained collision rows have distinct canonical centers \(b\ne b_\rho\)
and canonical supports

\[
U_b,\qquad U_{b_\rho}
\]

with

\[
P\subseteq U_b,\qquad Q\subseteq U_{b_\rho},
\tag{F2.1.3}
\]

and the cap-localization theorem gives

\[
b,b_\rho\in I,\qquad
U_b\cap C=P,\qquad
U_{b_\rho}\cap C=Q.
\tag{F2.1.4}
\]

All three Moser apices are fully deletion-robust.  In particular, none is a
canonical blocker of a source.

Finally,

\[
|C|\ge8.
\tag{F2.1.5}
\]

Because a closed indexed cap consists of its two boundary endpoints and its
strict interior,

\[
|I|=|C|-2\ge6.
\tag{F2.1.6}
\]

The retained source set \(R\) has cardinality four and lies in \(I\).

---

##### 2. The all-blockers relation

###### 2.1 Canonical blocker relation

For \(c,x\in A\), define

\[
\operatorname{Blocks}(c,x)
\]

to mean:

1. \(c\) is a unique-four center;
2. \(U_c\) is its canonical positive-radius four-point row; and
3. \(x\in U_c\).

Under the K4 hypothesis this is equivalent to

\[
\neg K4At(A-x,c).
\tag{F2.2.1}
\]

The row center is never in its own row, so `Blocks(c,x)` implies \(c\ne x\).

###### 2.2 Every source has a blocker

Minimality gives

\[
\forall x\in A,\quad
\exists c\in A,\ \operatorname{Blocks}(c,x).
\tag{F2.2.2}
\]

Define the nonempty eligible-blocker set

\[
\mathcal B(x)=\{c\in A:\operatorname{Blocks}(c,x)\}.
\tag{F2.2.3}
\]

###### 2.3 A critical-shell system is only a section

A chosen blocker map is a section

\[
\beta:A\to A,\qquad \beta(x)\in\mathcal B(x).
\tag{F2.2.4}
\]

All canonical rows \(U_c\) and all incidences `Blocks(c,x)` exist before
\(\beta\) is selected.

This distinction is load-bearing.  The current `FreshThirdBlockerFiber`
records equality of two values of one section.  The intrinsic statement is
that two sources possess a common element of their eligible-blocker sets.

---

##### 3. Finite late choice

###### Theorem 3.1 — finite prescriptions extend

Let \(J\subseteq A\) be finite, and suppose a function

\[
\sigma:J\to A
\]

satisfies

\[
\operatorname{Blocks}(\sigma(x),x)
\quad\text{for every }x\in J.
\tag{F2.3.1}
\]

Then there exists a blocker section \(\beta\) extending \(\sigma\).

###### Proof of finite-prescription extension

For \(x\in J\), set \(\beta(x)=\sigma(x)\).  For \(x\notin J\), choose any
member of the nonempty set \(\mathcal B(x)\).  The choices are pointwise; no
matching, injectivity, capacity, or compatibility condition connects two
different sources.  Thus \(\beta(x)\in\mathcal B(x)\) for every source and
\(\beta|_J=\sigma\). QED.

###### Formalization contract

A low-level implementation should use a partial function, not a list with
possibly conflicting duplicate keys.

```lean
structure BlockerPrescription (D : CounterexampleData) where
  domain : Finset ℝ²
  value : ℝ² → ℝ²
  legal :
    ∀ x, x ∈ domain →
      CanonicalBlocks D.A (value x) x

theorem BlockerPrescription.exists_section
    (hmin : D.Minimal)
    (P : BlockerPrescription D) :
    ∃ β : CanonicalBlockerSection D,
      ∀ x, x ∈ P.domain → β.center x = P.value x
```

**Status:** [PROSE-PROVED]

---

##### 4. Fresh strict-cap sources

Define

\[
X=I\setminus R.
\tag{F2.4.1}
\]

###### Lemma 4.1 — two fresh cap sources exist

\[
|X|\ge2.
\tag{F2.4.2}
\]

###### Proof of the two-fresh-source lemma

The retained set \(R\) has cardinality four and is contained in \(I\).
Equation (F2.1.6) gives \(|I|\ge6\).  Therefore

\[
|I\setminus R|=|I|-|R|\ge2.
\]

QED.

Choose distinct

\[
s,t\in X.
\tag{F2.4.3}
\]

The choice of \(s,t\) will later be refined by their first-apex radii.

**Status:** [PROSE-PROVED]

---

##### 5. Every blocker of a fresh cap source has the same intrinsic restrictions

###### Theorem 5.1 — universal fresh-cap blocker theorem

Let \(s\in X\), and let \(c\in\mathcal B(s)\).  Then:

1. \(c\ne b\);
2. \(c\ne b_\rho\);
3. \(c\) is distinct from all three robust apices;
4. \(U_c\) contains at most one point of \(P\);
5. \(U_c\) contains at most one point of \(Q\); and
6. consequently
   \[
   |U_c\cap R|\le2.
   \tag{F2.5.1}
   \]

Equivalently, \(U_c\) omits at least one endpoint from each retained pair.

###### Proof of universal fresh-blocker restrictions

Because \(c\) blocks \(s\), one has \(s\in U_c\).

If \(c=b\), then \(s\in U_b\).  Since \(s\in I\subseteq C\), equation (F2.1.4)
would give \(s\in P\), contrary to \(s\in X\).  Hence \(c\ne b\).  The proof
that \(c\ne b_\rho\) is identical.

A fully deletion-robust center cannot block any source, because deletion at
that source survives there.  Therefore \(c\) is not any of the three robust
apices.

Suppose both \(p_1,p_2\) belonged to \(U_c\).  Then each of the three carrier
points

\[
O,\quad b,\quad c
\]

is equidistant from \(p_1,p_2\):

- \(O\) because \(p_1,p_2\) lie on the same selected first-apex radius;
- \(b\) because \(P\subseteq U_b\); and
- \(c\) because \(P\subseteq U_c\).

The points \(O,b,c\) are pairwise distinct.  All lie on the perpendicular
bisector of \(p_1p_2\), producing three collinear carrier points.  This
contradicts convex independence.  Thus \(U_c\cap P\) has cardinality at most
one.  Replacing \(P,b,r\) by \(Q,b_\rho,\rho\) proves the same bound for
\(Q\).

The pairs are disjoint, so (F2.5.1) follows by adding the two bounds. QED.

###### Important strengthening

This theorem concerns **every** legal blocker of \(s\), not merely the blocker
chosen by an earlier shell system.  It is therefore invariant under every
late blocker rebase.

**Status:** [PROSE-PROVED]

---

##### 6. Every fresh-cap blocker row contains a second fresh source

###### Theorem 6.1 — fresh mate

Let \(s\in X\) and \(c\in\mathcal B(s)\).  Then there exists

\[
u\in U_c\setminus R
\]

with \(u\ne s\).  Moreover `Blocks(c,u)`.

###### Proof of the fresh-mate theorem

The canonical row has cardinality four.  Theorem 5.1 gives

\[
|U_c\cap R|\le2.
\]

Hence

\[
|U_c\setminus R|\ge2.
\]

The source \(s\) belongs to this difference.  Choose another member \(u\).
Because \(u\in U_c\), the canonical blocker relation gives
`Blocks(c,u)`. QED.

###### Corollary 6.2 — a manufactured collision fiber

For every \(s\in X\) and every \(c\in\mathcal B(s)\), there is a blocker
section satisfying

\[
\beta(s)=\beta(u)=c
\]

for some fresh \(u\ne s\), while simultaneously preserving

\[
\beta(p_1)=\beta(p_2)=b,\qquad
\beta(q_1)=\beta(q_2)=b_\rho.
\]

###### Proof of the manufactured-collision corollary

The four retained assignments and the two assignments \(s,u\mapsto c\) are
all legal.  Their source domains are disjoint.  Apply Theorem 3.1. QED.

This proves that a FreshThird pair can always be manufactured after the
cap-source row is known.  The converse lesson is more important: a separate
finite-map multiplicity theorem is unnecessary.

**Status:** [PROSE-PROVED]

---

##### 7. Intrinsic radial dichotomy for the fresh set

For \(x\in I\), write

\[
\lambda(x)=\operatorname{dist}(O,x).
\]

Exactly one of the following modes holds.

###### Mode CR — a fresh common radius

There exist distinct \(s,t\in X\) and a real \(\tau\) such that

\[
\lambda(s)=\lambda(t)=\tau.
\tag{F2.7.1}
\]

The radius \(\tau\) is distinct from \(r\) and \(\rho\).

###### Mode AR — all nonretained cap radii are singleton

No two distinct points of \(X\) have the same \(\lambda\)-value.  Choose any
distinct \(s,t\in X\).  Then

\[
\lambda(s)\ne\lambda(t),
\tag{F2.7.2}
\]

and

\[
\begin{aligned}
\operatorname{Sel}_A(O,\lambda(s))\cap I&=\{s\},\\
\operatorname{Sel}_A(O,\lambda(t))\cap I&=\{t\}.
\end{aligned}
\tag{F2.7.3}
\]

Moreover every first-apex radius whose strict-cap slice has at least two
points is one of \(r,\rho\):

\[
2\le|\operatorname{Sel}_A(O,\eta)\cap I|
\Longrightarrow
\eta=r\ \lor\ \eta=\rho.
\tag{F2.7.4}
\]

###### Proof of the intrinsic radial dichotomy

Split on whether two distinct points of \(X\) have equal \(\lambda\)-value.

In the positive branch, choose them.  Their radius cannot equal \(r\):
otherwise the exact equality
\(\operatorname{Sel}_A(O,r)\cap I=P\) would put both fresh points in \(P\).
Likewise it cannot equal \(\rho\).

In the negative branch, choose distinct \(s,t\in X\).  Their radii are
distinct.  To prove the first singleton equality in (F2.7.3), let \(z\in I\)
have \(\lambda(z)=\lambda(s)\).

- If \(z\in X\), the no-equal-fresh-pair hypothesis gives \(z=s\).
- If \(z\in P\), then \(\lambda(s)=r\), which would put \(s\) in the exact
  cap trace \(P\), impossible.
- If \(z\in Q\), the same argument uses \(\rho\).

Because \(I=R\mathbin{\dot\cup}X\), these cases are exhaustive.  The proof for
\(t\) is identical.

For (F2.7.4), let \(z,w\) be two distinct points in the slice at \(\eta\).  They
cannot include a fresh point: two fresh points would violate the negative
branch, while a fresh and retained point would put the fresh point in one of
the exact retained traces.  Hence both lie in \(R\).  Distinct retained
radii force them to lie in the same retained pair, so \(\eta=r\) or
\(\eta=\rho\). QED.

###### Consequence in AR mode

Deleting one point \(x\in P\) and one point \(y\in Q\) destroys K4 at \(O\).
Indeed, every possible first-apex K4 radius is \(r\) or \(\rho\), and each
exact four-class loses one point.

Restoring \(x\) restores the \(r\)-class; restoring \(y\) restores the
\(\rho\)-class.  Thus \(\{x,y\}\) is an exact two-point minimal deletion core
at \(O\).

**Status:** [PROSE-PROVED]

---

##### 8. Common-blocker versus no-common-blocker dichotomy

For distinct fresh sources \(s,t\in X\), define

\[
\operatorname{CommonBlocker}(s,t)
:\Longleftrightarrow
\exists c\in A,\
\operatorname{Blocks}(c,s)\land
\operatorname{Blocks}(c,t).
\tag{F2.8.1}
\]

Equivalently, \(s,t\in U_c\) for one canonical center \(c\).

###### Theorem 8.1 — blocker dichotomy

Exactly one of the following holds.

#### Mode CB — common canonical blocker

There is a center \(c\) with

\[
s,t\in U_c.
\tag{F2.8.2}
\]

The row \(U_c\) is exact, \(c\) is distinct from the retained blockers and all
three apices, and it omits at least one endpoint from each retained pair.

#### Mode MO — mutual omission square

There are centers

\[
c_s\in\mathcal B(s),\qquad
c_t\in\mathcal B(t)
\]

such that

\[
c_s\ne c_t,\qquad
t\notin U_{c_s},\qquad
s\notin U_{c_t}.
\tag{F2.8.3}
\]

Consequently,

\[
\begin{array}{c|cc}
 & \text{delete }s & \text{delete }t\\
\hline
c_s & \text{fails} & \text{survives}\\
c_t & \text{survives} & \text{fails}
\end{array}
\tag{F2.8.4}
\]

with the unchanged canonical rows witnessing both survival statements.

###### Proof of the common-blocker/mutual-omission dichotomy

Split on (F2.8.1).

If it holds, choose \(c\).  The additional fields follow from Theorem 5.1.

Suppose it does not hold.  Choose arbitrary
\(c_s\in\mathcal B(s)\) and \(c_t\in\mathcal B(t)\).
If \(c_s=c_t\), that center would block both sources, contradicting the
negative branch.  If \(t\in U_{c_s}\), then \(c_s\) would block both sources;
likewise for \(s\in U_{c_t}\).  This proves (F2.8.3).

Deleting a member of its unique canonical row destroys K4 at the row center.
Deleting a point omitted from the row leaves the exact four-point support
unchanged.  Hence (F2.8.4). QED.

###### Late-choice realization

In CB mode choose a blocker section with

\[
\beta(s)=\beta(t)=c.
\]

In MO mode choose

\[
\beta(s)=c_s,\qquad \beta(t)=c_t.
\]

Both choices extend by Theorem 3.1.  The blocker section is therefore an
output of the dichotomy, not an input to it.

**Status:** [PROSE-PROVED]

---

##### 9. The four intrinsic terminal packets

Combining Sections 7 and 8 gives four and only four cases.

###### 9.1 `CR-CB` — common first-apex radius and common blocker

Data:

1. distinct \(s,t\in X\);
2. \(\lambda(s)=\lambda(t)=\tau\), with \(\tau\ne r,\rho\);
3. one canonical center \(c\) with \(s,t\in U_c\);
4. \(c\ne b,b_\rho\) and \(c\) is not an apex;
5. \(U_c\) omits one endpoint of each retained pair.

The existing equal-radius cap-localization geometry gives

\[
c\in I
\tag{F2.9.1}
\]

and the same-cap selected-row bound then gives

\[
U_c\cap C=\{s,t\}.
\tag{F2.9.2}
\]

Thus all four retained sources are omitted from \(U_c\), and the two remaining
members of \(U_c\) lie outside \(C\).

The perpendicular bisector of \(st\) already contains the two distinct carrier
points \(O,c\).  Convex independence therefore gives the saturation theorem:

\[
z\in A,\quad
\operatorname{dist}(z,s)=\operatorname{dist}(z,t)
\Longrightarrow
z=O\ \lor\ z=c.
\tag{F2.9.3}
\]

In particular, \(c\) is the unique canonical common blocker of \(s,t\).

**Status:** [EXACT TERMINAL; localization consequences PROVED]

###### 9.2 `CR-MO` — common first-apex radius and mutual omission

Data:

1. distinct \(s,t\in X\);
2. \(\lambda(s)=\lambda(t)=\tau\ne r,\rho\);
3. distinct canonical centers \(c_s,c_t\);
4. \(s\in U_{c_s}\), \(t\notin U_{c_s}\);
5. \(t\in U_{c_t}\), \(s\notin U_{c_t}\);
6. the exact failure/survival square (F2.8.4);
7. each row omits at least one endpoint of each retained pair; and
8. no canonical row has both \(s,t\) as members.

The first apex \(O\) is a robust equidistance center of \(s,t\), but by
definition no nonrobust canonical center is another common center.

**Status:** [EXACT TERMINAL]

###### 9.3 `AR-CB` — aligned singleton radii and common blocker

Data:

1. distinct \(s,t\in X\);
2. distinct singleton first-apex radii as in (F2.7.2)-(F2.7.3);
3. the global retained-radii property (F2.7.4);
4. one canonical center \(c\) with \(s,t\in U_c\);
5. one endpoint \(x\in P\) and one endpoint \(y\in Q\) omitted from \(U_c\).

Deleting \(x,y\) preserves \(U_c\) but destroys K4 at \(O\):

\[
K4At(A-\{x,y\},c),\qquad
\neg K4At(A-\{x,y\},O).
\tag{F2.9.4}
\]

The same pair \(\{x,y\}\) is a minimal deletion core at \(O\).
There is only one source row in this packet; the duplicate first-source and
second-source deletion-core packets of the old E1 same-blocker cell are the
same canonical support.

**Status:** [EXACT TERMINAL; deletion-core normalization PROVED]

###### 9.4 `AR-MO` — aligned singleton radii and mutual omission square

Data:

1. distinct \(s,t\in X\);
2. the aligned radial data (F2.7.2)-(F2.7.4);
3. distinct exact rows \(U_{c_s},U_{c_t}\);
4. the mutual failure/survival square (F2.8.4);
5. each row omits at least one endpoint from each retained pair; and
6. each row carries an exact two-endpoint deletion core against \(O\).

For each row choose

\[
x_s\in P\setminus U_{c_s},\quad
y_s\in Q\setminus U_{c_s},
\]

and similarly \(x_t,y_t\).  Then

\[
\begin{aligned}
K4At(A-\{x_s,y_s\},c_s)&,\qquad
\neg K4At(A-\{x_s,y_s\},O),\\
K4At(A-\{x_t,y_t\},c_t)&,\qquad
\neg K4At(A-\{x_t,y_t\},O).
\end{aligned}
\tag{F2.9.5}
\]

**Status:** [EXACT TERMINAL]

---

##### 10. Exact retained-pair trace normalization in MO mode

For a row \(K\) and a retained pair \(P=\{p_1,p_2\}\), Theorem 5.1 says

\[
K\cap P\in\{\varnothing,\{p_1\},\{p_2\}\}.
\tag{F2.10.1}
\]

For the two MO rows \(K_s=U_{c_s}\) and \(K_t=U_{c_t}\), exactly one of the
following pair-level statuses holds.

###### 10.1 Common omission

Some \(p\in P\) is absent from both rows:

\[
p\notin K_s\cup K_t.
\tag{F2.10.2}
\]

Deleting \(p\) preserves both exact rows.

###### 10.2 Split coverage

There is an orientation of the pair such that

\[
K_s\cap P=\{p_1\},\qquad
K_t\cap P=\{p_2\}.
\tag{F2.10.3}
\]

###### Proof of the retained-pair trace dichotomy

If \(K_s\cup K_t\) does not cover \(P\), use (F2.10.2).
If it covers \(P\), each row contributes at most one point, so both
intersections are singletons and they are complementary. QED.

Apply this independently to \(P\) and \(Q\).  Thus every MO terminal has one
of four semantic trace modes:

```text
CC  common omission on P, common omission on Q
CS  common omission on P, split coverage on Q
SC  split coverage on P, common omission on Q
SS  split coverage on P, split coverage on Q
```

This replaces the old source-tagged constructor products.

###### 10.3 Exact `SS` support normal form

After orienting both retained pairs, the two rows have the form

\[
\begin{aligned}
U_{c_s}&=\{s,p_i,q_j,u\},\\
U_{c_t}&=\{t,p_{1-i},q_{1-j},v\},
\end{aligned}
\tag{F2.10.4}
\]

where \(u,v\) are the remaining row points.  The two rows have no retained
source in common and omit each other's cap source, so

\[
U_{c_s}\cap U_{c_t}\subseteq\{u,v\}.
\tag{F2.10.5}
\]

Consequently the intersection is empty or a singleton.

###### 10.4 Exact `CC` deletion packet in AR mode

Choose \(x\in P\) and \(y\in Q\) omitted from both rows.  Then the same
two-point deletion satisfies

\[
\begin{aligned}
K4At(A-\{x,y\},c_s),\\
K4At(A-\{x,y\},c_t),\\
\neg K4At(A-\{x,y\},O).
\end{aligned}
\tag{F2.10.6}
\]

This is the correct three-center exact-row packet.  No arbitrary support
synchronization is needed.

**Status:** [PROSE-PROVED NORMALIZATION]

---

##### 11. Master reduction theorem

###### Theorem 11.1 — intrinsic F2 four-packet reduction

Assume the intrinsic context of Section 1.  Then one of

```text
CR-CB ∨ CR-MO ∨ AR-CB ∨ AR-MO
```

holds.

###### Proof of the four-packet master reduction

By Lemma 4.1, choose two fresh strict-cap sources.  Apply the radial
dichotomy of Section 7.

- In CR mode, choose a same-radius fresh pair \(s,t\).
- In AR mode, choose any two fresh sources and retain the singleton and
  global alignment conclusions.

For the selected \(s,t\), apply the blocker dichotomy of Section 8.

- Common blocker gives CB.
- No common blocker gives MO.

The two binary decisions are independent and exhaustive, yielding exactly the
four products. QED.

###### Corollary 11.2 — one theorem closes the entire F2 branch

It is enough to prove

```lean
theorem false_of_intrinsicTwoCapSourceTerminal
    (T : IntrinsicTwoCapSourceTerminal Core) : False
```

where `IntrinsicTwoCapSourceTerminal` has the four constructors above.

Equivalently, prove four constructor-specific children and make the parent a
four-line dispatcher.

**Status:** [PROSE-PROVED REDUCTION]

---

##### 12. Why the old six leaves are no longer load-bearing

###### E1 — aligned first non-hit

The old first interaction existed because the FreshThird pair was chosen
before the first cap source.  In the refactor there is no FreshThird pair.
The two cap sources are selected first, and blocker commonality is tested
intrinsically.  E1 is replaced by `AR-CB` or `AR-MO`.

###### E2 — independent common-radius first non-hit

The common-radius surface is now the active source pair by construction.
There is no unrelated generic surface to synchronize.  E2 disappears
completely.

###### E3 — equal source-row center

Equality of the two chosen source-row centers is exactly CB mode.  It is not a
separate product of two FreshThird interactions.  The coherent E3 cases are
absorbed by `CR-CB` and `AR-CB`.

###### F1 — outside-pair deletion exact rows

The outside-fiber route was one way of manufacturing another source in a
chosen blocker fiber.  Theorem 6.1 manufactures such a mate directly from any
fresh cap-source row, but the master reduction does not need it.  F1 may
remain useful as a consumer of an MO trace mode; it is not required as a
top-level leaf.

###### G1 — acyclic hard residual

The three G1 constructors distinguish aligned versus independent surfaces and
different methods of obtaining a fresh source.  Both distinctions are removed
before the semantic terminal.  G1 is replaced by the four-packet theorem.

###### H1 — cross-blocker coincidence

The direct fresh-cap source argument uses only the two retained canonical rows,
their exact cap traces, cap cardinality, minimality, and robust apices.
It does not require the global finite-map split that produced
`CrossBlockerCoincidence ∨ CapSourceSurface`.  Therefore H1 is bypassed even
when a retained blocker happens to equal a source in the opposite retained
pair.

This does not prove that cross-blocker coincidences are impossible.  It proves
that F2 need not solve them before reaching its two fresh cap sources.

---

##### 13. The exact remaining mathematics

The old 55 source-tagged cells have been reduced to four intrinsic terminals.
They can be grouped into two theorem families.

###### Root A — common canonical blocker

```lean
theorem false_of_twoFreshCapSources_commonBlocker
    (mode : FreshRadialMode Core s t)
    (packet : CommonCanonicalBlockerPacket Core s t) :
    False
```

The proof must treat:

- `CR-CB`: a first-cap unique-four row with exact cap trace `{s,t}`, two
  outside-cap row points, and a saturated perpendicular bisector;
- `AR-CB`: one common row carrying two singleton-radial cap sources and an
  exact retained-pair double-deletion core against \(O\).

###### Root B — no common blocker

```lean
theorem false_of_twoFreshCapSources_mutualOmission
    (mode : FreshRadialMode Core s t)
    (packet : MutualOmissionSquarePacket Core s t) :
    False
```

The proof must treat:

- `CR-MO`: a same-apex-radius source pair with no canonical common blocker and
  a two-center failure/survival square;
- `AR-MO`: the same square plus two exact retained-endpoint deletion cores.

The four retained-pair trace products `CC`, `CS`, `SC`, `SS` are the complete
finite normalization inside Root B.

No theorem in the supplied material currently proves Root A or Root B.

---

##### 14. Recommended larger refactor

The cleanest architecture is not to retrofit this reduction into the existing
FreshThird files.  Introduce a new semantic layer above them.

###### 14.1 New semantic objects

```lean
def CanonicalBlocks
    (A : Finset ℝ²) (center source : ℝ²) : Prop := ...

structure IntrinsicRetainedTwoRowCore where
  firstRadius secondRadius : ℝ
  firstPair secondPair : Finset ℝ²
  firstCenter secondCenter : ℝ²
  firstRow secondRow : Finset ℝ²
  -- exact radius, cap-trace, uniqueness, disjointness, robustness fields

def FreshFirstCapSources
    (Core : IntrinsicRetainedTwoRowCore) : Finset ℝ² :=
  Core.firstCapInterior \ (Core.firstPair ∪ Core.secondPair)

inductive FreshRadialMode
    (Core : IntrinsicRetainedTwoRowCore) (s t : ℝ²)
  | commonRadius ...
  | alignedSingleton ...

structure CommonCanonicalBlockerPacket ...
structure MutualOmissionSquarePacket ...

inductive IntrinsicTwoCapSourceTerminal
    (Core : IntrinsicRetainedTwoRowCore)
  | commonRadius_commonBlocker ...
  | commonRadius_mutualOmission ...
  | aligned_commonBlocker ...
  | aligned_mutualOmission ...
```

###### 14.2 Producers

```lean
theorem two_le_card_freshFirstCapSources ...

theorem universal_freshCap_blocker_restrictions ...

theorem freshCap_blocker_has_fresh_mate ...

theorem freshRadialMode_exists ...

theorem commonBlocker_or_mutualOmissionSquare ...

theorem intrinsicTwoCapSourceTerminal_exists ...
```

Every producer above is proved in this document.

###### 14.3 Consumers

Only the two root theorem families in Section 13 require new mathematics.

###### 14.4 Optional compatibility adapter

After the semantic proof closes, a thin adapter may project the existing
`P`, `Pρ`, and all-large residuals to `IntrinsicRetainedTwoRowCore`.  The
current FreshThird, F1, G1, and H1 modules can remain in the repository as
historical/off-spine experiments.

---

##### 15. Low-level proof obligations

###### 15.1 Finite-set obligations

A low-level agent must prove:

1. `card R = 4`;
2. `R ⊆ I`;
3. `2 ≤ card (I \ R)`;
4. from `card U = 4` and `card (U ∩ R) ≤ 2`,
   `2 ≤ card (U \ R)`;
5. the singleton radial slices in AR mode; and
6. the pair-trace `common omission ∨ split coverage` theorem.

All are elementary `Finset` arguments.

###### 15.2 Geometry obligations already available

Use existing source theorems for:

1. canonical blocker iff deletion failure;
2. exact canonical row cardinality four;
3. no center in its own positive-radius row;
4. no three carrier points on one line;
5. robust apex cannot be a blocker;
6. retained blocker localization into the first cap;
7. retained row exact cap trace;
8. same-first-apex-radius common blocker localization; and
9. same-cap selected-row intersection cardinality at most two.

###### 15.3 New geometry obligations

Only Root A and Root B remain.

---

##### 16. Rejection tests

Reject any proof or implementation that:

1. fixes a total blocker map before selecting the two fresh cap sources;
2. treats equality of two chosen blockers as the intrinsic definition of a
   common blocker;
3. retains E2's unrelated generic/common-radius surfaces;
4. invokes the finite-map multiplicity split before using the cap-eight
   counting argument;
5. assumes a common blocker exists merely because the sources share a
   first-apex radius;
6. identifies a K4 witness after deletion with a canonical full-carrier row
   without a uniqueness theorem;
7. claims that the failure/survival square is itself contradictory;
8. claims that the common-row packet is locally impossible;
9. drops the literal retained endpoint traces in the MO classifier;
10. marks F2 closed before Root A and Root B are proved.

---

##### 17. Completion matrix

| Obligation | Status |
|---|---|
| All-blockers semantic reformulation | **[PROSE-PROVED]** |
| Finite late-choice extension | **[PROSE-PROVED]** |
| Two fresh strict-cap sources | **[PROSE-PROVED]** |
| Universal blocker restrictions for a fresh cap source | **[PROSE-PROVED]** |
| Fresh mate/manufactured fiber theorem | **[PROSE-PROVED]** |
| Intrinsic radial dichotomy | **[PROSE-PROVED]** |
| Common blocker vs mutual omission square | **[PROSE-PROVED]** |
| Four-packet master reduction | **[PROSE-PROVED]** |
| Common-radius common-blocker localization and exact cap trace | **[SOURCE-PROVED / SEMANTIC ADAPTER REQUIRED]** |
| MO retained-pair trace normalization | **[PROSE-PROVED]** |
| Root A: common canonical blocker exclusion | **[OPEN]** |
| Root B: mutual omission square exclusion | **[OPEN]** |
| Entire F2 cluster | **[OPEN, BUT REDUCED TO TWO THEOREM FAMILIES]** |

---

##### 18. Research conclusion

Allowing larger refactoring changes the correct F2 frontier substantially.

The true issue is not the interaction of two arbitrary cap-source rows with an
independently chosen FreshThird fiber.  The true issue is:

> Two fresh strict-first-cap sources exist.  Either they possess a common
> canonical blocker, or their chosen canonical rows may be made mutually
> omitting.  Show that neither intrinsic packet is compatible with the
> retained two-radius rows and the all-large minimal counterexample context.

That is the smallest source-faithful statement presently supported by the
proof data.

The reduction is complete.  The contradiction is not.

---

##### 19. Compatibility lane: FreshThird preferred-choice synchronization

> **Architectural status.** The semantic all-blockers reduction in §§0–18 is the preferred load-bearing F2 architecture. This compatibility lane is retained because it gives a source-faithful closure of the later raw-main common-radius distinct-cap FreshThird route and supplies a practical patch for existing callers. It does not prove the two intrinsic roots of §13 and is not needed by the eventual semantic dispatcher.

**Closure date:** 2026-08-22
**Source status:** an apply-ready seven-file patch plus one new Lean module has
been written against the inspected current source. A static
`git apply --check` and complete 25-node caller-chain audit passed. Lean
elaboration, `lake build`, and publication-target `#print axioms` remain
mandatory acceptance gates.

###### 19.1. Final result

The former packet-level target asked for a new Euclidean theorem forcing the
pinned deletion fan to meet the FreshThird `Q` row. That theorem is not needed.
The packet is contradictory strictly earlier.

The decisive choice-order fact is:

> The global proof is free to choose the critical-shell system pointwise. For
> every source, whenever at least one legal critical blocker lies in the
> strict first cap, choose a legal blocker in the strict first cap.

Under this choice policy, a selected row whose center lies in the strict first
cap cannot contain a source whose chosen blocker lies in another strict cap.
The FreshThird distinct-cap packet has exactly that forbidden configuration.

For the common-radius route, write

\[
s=C.\mathrm{surface}.\mathrm{firstSource},\qquad
q=Q.\mathrm{source}_1,\qquad
c=\beta_H(s).
\]

The interaction supplies `q ∈ K_s`. Common-radius cap geometry puts `c` in the
strict first cap. Since `c` is a chosen blocker center, it is nonrobust. At a
nonrobust exact selected row, deleting every row member destroys K4 at the row
center. Hence `c` is a legal critical blocker of `q`. First-cap preference
forces `β_H(q)` into the strict first cap. The interaction simultaneously puts
`β_H(q)` in a distinct strict cap. Strict cap interiors are disjoint, so the
branch is impossible.

Only one positive interaction is used. The second cap-source interaction, the
boundary indexing, the endpoint row, the six-point seed, the pinned center, the
source-faithful fan, and the exact-three blocker-fiber boundary are irrelevant.

The full pinned packet theorem remains useful as a four-field corollary, but it
is no longer the live proof root.

---

###### 19.2. Correction to the previous formulation

The earlier prose used

```lean
HasCriticalBlockerInRegion D region source
```

with `D : CounterexampleData` hidden inside the preference class. That is
mathematically harmless but unnecessarily difficult for Lean: a value of type
`CriticalShellSystem D.A` need not determine the whole dependent record `D` by
unification.

The corrected API is carrier-generic:

```lean
HasCriticalBlockerInRegion A region source
CriticalShellSystem.PrefersRegion H region
```

where `H : CriticalShellSystem A`. `CounterexampleData` appears only in the
lemma converting nonrobust row membership into a legal blocker and in the
minimality wrapper constructing a fallback system.

This change removes a genuine elaboration risk without changing the theorem.

---

###### 19.3. Intrinsic legal blocker choices

**3.1 Complete blocker-choice object**

```lean
structure CriticalBlockerChoice
    (A : Finset ℝ²) (source : ℝ²) where
  center : ℝ²
  shell : CriticalSelectedFourClass A source center
  blocked :
    ¬ HasNEquidistantPointsAt 4 (A.erase source) center
```

A value contains every field required by `CriticalShellSystem.shellAt` and
`CriticalShellSystem.no_qfree`:

1. a center;
2. a named critical full selected four-class through `source`; and
3. the proof that deleting `source` destroys K4 at that center.

No chosen-system data occurs in the object.

**3.2 Region eligibility**

```lean
def HasCriticalBlockerInRegion
    (A region : Finset ℝ²) (source : ℝ²) : Prop :=
  ∃ choice : CriticalBlockerChoice A source,
    choice.center ∈ region
```

This says that the complete legal-blocker relation has at least one witness in
`region`. It is stronger than merely saying that some carrier point in the
region is equidistant from four points: the selected class must pass through
the source and deletion of the source must actually block the center.

---

###### 19.4. Region-preferred critical-shell systems

```lean
namespace CriticalShellSystem

class PrefersRegion
    {A : Finset ℝ²}
    (H : CriticalShellSystem A)
    (region : Finset ℝ²) : Prop where
  centerAt_mem_region :
    ∀ source : ℝ², ∀ hsource : source ∈ A,
      HasCriticalBlockerInRegion A region source →
        H.centerAt source hsource ∈ region

end CriticalShellSystem
```

For a surplus-cap packet, define:

```lean
abbrev CriticalShellSystem.PrefersFirstCap
    {D : CounterexampleData}
    (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop :=
  CriticalShellSystem.PrefersRegion
    H (S.capInteriorByIndex S.oppIndex1)
```

The class does not assert that the region blocker is unique. It requires only
that the chosen center lie in the region whenever at least one legal region
choice exists.

---

###### 19.5. Existence of a preferred system

**Theorem 5.1 — pointwise preferred choice**

For any fallback system `H₀`, region, source, and carrier-membership proof,
there is a legal blocker choice satisfying the conditional preference:

```lean
theorem CriticalShellSystem.exists_preferredChoiceAt
    {A : Finset ℝ²}
    (H₀ : CriticalShellSystem A)
    (region : Finset ℝ²)
    (source : ℝ²) (hsource : source ∈ A) :
    ∃ choice : CriticalBlockerChoice A source,
      HasCriticalBlockerInRegion A region source →
        choice.center ∈ region
```

*Proof.*

Split on `HasCriticalBlockerInRegion A region source`.

* In the positive branch, choose its witness `choice`. Its center-membership
  proof discharges the conditional conclusion.
* In the negative branch, use the fallback choice
  `H₀.centerAt source hsource`, `H₀.selectedAt source hsource`, and
  `H₀.no_qfree_at source hsource`. The conditional conclusion follows from
  the contradiction between the negative branch and its antecedent.

Both branches return a complete `CriticalBlockerChoice`. QED.

**Definition 5.2 — preferred pointwise choice**

```lean
noncomputable def CriticalShellSystem.preferredChoiceAt ... :=
  Classical.choose
    (H₀.exists_preferredChoiceAt region source hsource)
```

Its specification is the `Classical.choose_spec` of Theorem 5.1.

**Definition 5.3 — preferred system**

```lean
noncomputable def CriticalShellSystem.preferRegion
    {A : Finset ℝ²}
    (H₀ : CriticalShellSystem A)
    (region : Finset ℝ²) :
    CriticalShellSystem A where
  shellAt := fun source hsource =>
    let choice := H₀.preferredChoiceAt region source hsource
    ⟨choice.center, choice.shell⟩
  no_qfree := fun source hsource =>
    (H₀.preferredChoiceAt region source hsource).blocked
```

The same pointwise expression is used in both structure fields, so the
`no_qfree` center is definitionally the selected `shellAt` center.

**Theorem 5.4 — the constructed system prefers the region**

```lean
theorem CriticalShellSystem.preferRegion_prefersRegion
    (H₀ : CriticalShellSystem A)
    (region : Finset ℝ²) :
    CriticalShellSystem.PrefersRegion
      (H₀.preferRegion region) region
```

This is the specification of `preferredChoiceAt` after unfolding
`preferRegion.centerAt`.

**Theorem 5.5 — minimality supplies a preferred system**

```lean
theorem CounterexampleData.exists_prefersRegionCriticalShellSystem_of_minimal
    {D : CounterexampleData}
    (hmin : D.Minimal)
    (region : Finset ℝ²) :
    ∃ H : CriticalShellSystem D.A,
      CriticalShellSystem.PrefersRegion H region
```

*Proof.*

Minimality gives `Nonempty (CriticalShellSystem D.A)`. Choose a fallback
`H₀`, return `H₀.preferRegion region`, and apply Theorem 5.4. QED.

**Why this is logically admissible**

`CriticalShellSystem.shellAt` has no compatibility field connecting choices at
two different sources. The system is literally a dependent function assigning
one legal critical shell to each source. Therefore pointwise refinement is not
an optimization theorem, matching theorem, compactness argument, or additional
axiom. It is a different witness to the same existing existential choice.

---

###### 19.6. Every member of a chosen nonrobust row has the row center as a legal blocker

**Lemma 6.1 — chosen blocker centers are nonrobust**

```lean
theorem CriticalShellSystem.not_fullyDeletionRobustAt_centerAt
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    (source : ℝ²) (hsource : source ∈ D.A) :
    ¬ FullyDeletionRobustAt D (H.centerAt source hsource)
```

*Proof.*

Assume full deletion robustness. Its `survives` field, applied to `source`,
gives K4 after deleting `source` at the chosen center. This contradicts
`H.no_qfree_at source hsource`. QED.

**Lemma 6.2 — selected-row membership gives an intrinsic blocker**

```lean
theorem CriticalShellSystem.hasCriticalBlockerInRegion_of_mem_selectedAt
    {D : CounterexampleData}
    {H : CriticalShellSystem D.A}
    {region : Finset ℝ²}
    {anchor source : ℝ²}
    (hanchor : anchor ∈ D.A)
    (hcenterRegion :
      H.centerAt anchor hanchor ∈ region)
    (hsourceRow :
      source ∈
        (H.selectedAt anchor hanchor).toCriticalFourShell.support) :
    HasCriticalBlockerInRegion D.A region source
```

*Proof.*

Let `c = H.centerAt anchor hanchor` and let
`K = (H.selectedAt anchor hanchor).toSelectedFourClass`.

1. `c ∈ D.A` follows from the critical shell's `center_mem` field by removing
   the erase membership.
2. Lemma 6.1 gives `¬ FullyDeletionRobustAt D c`.
3. `hsourceRow` says `source ∈ K.support`.
4. Apply the existing theorem
   `exists_criticalSelectedFourClass_of_mem_of_not_fullyDeletionRobust` to
   `c`, `K`, `source`, and the nonrobustness proof.
5. It returns a `CriticalSelectedFourClass D.A source c` and the exact proof
   `¬ K4(D.A.erase source,c)`.
6. Package those fields as a `CriticalBlockerChoice D.A source`; its center is
   `c`, which lies in `region` by `hcenterRegion`.

Thus `source` has an intrinsic legal blocker in `region`. QED.

This is the load-bearing use of unique-four semantics. Mere row membership at
an arbitrary robust center would not suffice.

**Theorem 6.3 — preferred-region synchronization**

```lean
theorem CriticalShellSystem.centerAt_mem_region_of_mem_selectedAt
    {D : CounterexampleData}
    {H : CriticalShellSystem D.A}
    {region : Finset ℝ²}
    [CriticalShellSystem.PrefersRegion H region]
    {anchor source : ℝ²}
    (hanchor : anchor ∈ D.A)
    (hsource : source ∈ D.A)
    (hcenterRegion :
      H.centerAt anchor hanchor ∈ region)
    (hsourceRow :
      source ∈
        (H.selectedAt anchor hanchor).toCriticalFourShell.support) :
    H.centerAt source hsource ∈ region
```

*Proof.*

Lemma 6.2 supplies `HasCriticalBlockerInRegion D.A region source`. Apply the
single field of `PrefersRegion`. QED.

This is the actual synchronization theorem. It synchronizes the **chosen
blocker region**, not two selected-row supports and not fan indices.

---

###### 19.7. The four-fact first-cap conflict

**Theorem 7.1 — a preferred first-cap row cannot point out of the first cap**

```lean
theorem false_of_selectedAt_member_blocker_in_nonfirstCap_of_prefersFirstCap
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    [CriticalShellSystem.PrefersFirstCap S H]
    (anchor source : CriticalShellSystem.CarrierVertex D.A)
    (hanchorCenterFirst :
      H.centerAt anchor.1 anchor.2 ∈
        S.capInteriorByIndex S.oppIndex1)
    (hsourceRow :
      source.1 ∈
        (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support)
    {sourceCap : Fin 3}
    (hsourceCapNeFirst : sourceCap ≠ S.oppIndex1)
    (hsourceCenterCap :
      H.centerAt source.1 source.2 ∈
        S.capInteriorByIndex sourceCap) :
    False
```

*Proof.*

Theorem 6.3 puts `H.centerAt source` in the strict first cap. The final
hypothesis puts the same point in `sourceCap`, and the cap indices are unequal.
Apply `S.capInteriorByIndex_ne_of_mem_of_mem_ne` and then apply the resulting
point inequality to `rfl`. QED.

The theorem consumes exactly four semantic facts:

1. the anchor blocker is in the first cap;
2. the source lies in the anchor row;
3. the source's chosen blocker is in a named cap; and
4. that cap is not the first cap.

---

###### 19.8. Direct common-radius distinct-cap closure

**Theorem 8.1**

```lean
theorem false_of_freshThird_commonRadius_distinctCaps_of_prefersFirstCap
    [CriticalShellSystem.PrefersFirstCap S H]
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters : ...)
    (centers_ne : ...)
    (source₁_mem : Q.source₁.1 ∈ K_s)
    (source₂_mem : Q.source₂.1 ∈ K_s)
    (overlap_eq : K_s ∩ K_q = {Q.source₁.1,Q.source₂.1})
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem : β(s) ∈ S.capInteriorByIndex sourceCap)
    (freshCenter_mem : β(q) ∈ S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap) :
    False
```

*Proof.*

Call the existing source-clean producer
`false_or_freshCap_ne_opp_of_commonRadius_distinctCaps`.

* If it returns `False`, close immediately.
* Otherwise it returns

  ```lean
  sourceCap = S.oppIndex1 ∧
  freshCap ≠ S.oppIndex1 ∧
  Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
  Q.source₂.1 ∉ S.capByIndex S.oppIndex1
  ```

  Rewrite `sourceCenter_mem` by the first equality. Then invoke Theorem 7.1
  with `anchor = C.surface.firstSource` and `source = Q.source₁`, using
  `source₁_mem`, `freshCenter_mem`, and `freshCap ≠ S.oppIndex1`.

QED.

The endpoint-off-cap conclusions are not used. They remain part of the old
producer's stronger packet but are dead data on the preferred route.

**Stronger branch reduction**

The current common-radius normalized helper case-splits both positive
interactions. Under the preferred theorem it should instead be:

```lean
| equalCrossRowCenters hfirst hsecond hcenters
    firstInteraction secondInteraction =>
  cases firstInteraction with
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
      exact
        false_of_freshThird_commonRadius_distinctCaps_of_prefersFirstCap
          ... C Q hcenters centers_ne source₁_mem source₂_mem overlap_eq
          sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      overlap_eq capIndex sourceCenter_mem freshCenter_mem
      fiberSource_mem_cap hcapIndex =>
      exact
        false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
          ... C T.oppApex1_rich sourceCenter_mem hcapIndex hcenters
```

`secondInteraction` is unused. The four coherent/mixed products collapse to
two cases determined solely by the first interaction:

* first interaction `D` — Theorem 8.1;
* first interaction `S` — the existing same-cap common-radius consumer.

This removes the current one-arc theorem from the live route. That theorem is
only a compatibility consequence obtained by eliminating the open surviving-
row theorem, so bypassing it also removes the hidden transitive dependency on
the pinned `sorry`.

---

###### 19.9. Full pinned packet as a corollary

The packet contains the four facts required by Theorem 7.1.

```lean
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_prefersFirstCap
    [CriticalShellSystem.PrefersFirstCap S H]
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    False
```

**Proof**

From

```lean
Packet.exactRow.first_support_eq :
  K_s = {s₁,s₂,q₁,q₂}
```

derive:

```lean
have hq₁Row : Q.source₁.1 ∈ K_s := by
  rw [Packet.exactRow.first_support_eq]
  simp
```

Then call Theorem 7.1 with:

```text
anchor-center-first-cap = Packet.source_center_first_cap
source-row-membership    = hq₁Row
nonfirst-cap tag         = Packet.fresh_cap_ne_first
source-blocker cap       = Packet.fresh_center_cap
```

QED.

The following packet fields are not used:

```text
seedOverlap
endpointNames
orderedRow
center_mem_seed
center_location
center_ne_source
center_ne_fresh
seed_multiplicity
endpoint_center
endpoints_outside_first
orderedRowAt
row_center_cap
row_cap_ne_first
row_cap_inside
row_cap_outside
seed_card
fan
```

They may remain in the source for other diagnostics, but none is a prerequisite
for this contradiction.

---

###### 19.10. Exact source integration

**10.1 New low-level module**

Add:

```text
lean/Erdos9796Proof/P97/ATail/RegionPreferredCriticalShell.lean
```

containing the declarations in §§7.3–7.6. The complete proposed file accompanies
this proof as `RegionPreferredCriticalShell.lean`.

**10.2 `TwoSourceCanonicalSurface.lean`**

1. Import `RegionPreferredCriticalShell`.
2. Add `CriticalShellSystem.PrefersFirstCap`.
3. Add Theorem 7.1.
4. Add Theorem 8.1 immediately after
   `false_or_freshCap_ne_opp_of_commonRadius_distinctCaps`.

This placement avoids a dependency cycle: the preferred theorem depends on the
common-radius cap producer, while the residual module already imports the
canonical-surface layer through `TwoSourceFreshThirdFiber`.

**10.3 `TwoSourceFreshThirdResidual.lean`**

1. Add the packet corollary immediately after
   `FreshThirdPinnedEndpointOutsideSeedQueryPacket`.
2. Add `[CriticalShellSystem.PrefersFirstCap S H]` to
   `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius`.
3. Replace its equal-center interaction product by the two-case body in §7.8.
4. Add the same instance parameter to
   `false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius`.
5. The current pinned outside-seed theorem may be closed by
   `exact Packet.false_of_prefersFirstCap` after packet construction, but it is
   no longer on the shortest live route.

**10.4 `TwoSourceRetainedMinimalCore.lean`**

Thread the proof-only instance through:

```text
false_of_twoCapSources_freshThirdBlockerFiber_on_commonRadius_surface
false_of_twoCapSources_freshThirdBlockerFiber
false_of_capSource_freshThirdBlockerFiber
false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
false_of_capSourceThirdCanonicalRowSurface
```

The retained-surface helper does not use the instance, but its parent theorem
requires it because the source producer may select the independent
common-radius branch.

**10.5 `TwoSourceAlignedLowHits.lean`**

Thread the instance through these four declarations:

```text
exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
exists_three_hit_of_two_collisionRows_capCross_normalForm
exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
```

No theorem statement changes except the implicit Prop-valued instance.

**10.6 `Coordinator.lean`**

Thread the instance through the exact live chain:

```text
false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
false_of_exactFourCollision_secondRadius_and_all_low_hits
false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
false_of_retainedInteriorBlockerCollision_and_all_low_hits
false_of_frontierAllLargeCapsTriApex_all_low_hits
exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
false_of_frontierAllLargeCapsTriApexUniformMetricResidual
false_of_frontierAllLargeCapsTriApexRobustResidual
false_of_frontierAllLargeCapsBiApexRobustResidual
false_of_frontierLargeOppositeCapsBiApexRobustResidual
false_of_frontierBiApexRobustResidual
false_of_frontierCommonDeletionPhysicalSecondApex
false_of_criticalPairFrontier
false_of_twoLargeCaps_commonCriticalMap
```

This list is the reverse call graph from the common-radius helper to the
parent-facing theorem. It is complete for the inspected current source.

**10.7 `Continuation.lean`**

The current source chooses one arbitrary `H` before the cardinality split. Move
the choice inside the branches:

```lean
exfalso
by_cases hcard11 : D.A.card = 11
· obtain ⟨H⟩ := D.exists_criticalShellSystem_of_minimal hmin
  exact false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven
    D.packet hmin hNoM44D hcard11 H
· obtain ⟨H, hHpref⟩ :=
    D.exists_prefersRegionCriticalShellSystem_of_minimal hmin
      (D.packet.capInteriorByIndex D.packet.oppIndex1)
  letI : CriticalShellSystem.PrefersFirstCap D.packet H := hHpref
  exact ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap
    D.packet hmin hNoM44D hDcard H
```

The card-eleven certificate path remains unchanged. The arbitrary-cardinality
path receives the preferred witness it needs.

---

###### 19.11. Complete live propagation matrix

The inspected current call graph from the direct common-radius consumer to the
publication-side continuation has twenty-five ancestor declarations. The
instance is needed at the following nodes.

| Depth | File | Declaration | Required edit |
|---:|---|---|---|
| 0 | `TwoSourceCanonicalSurface.lean` | `false_of_freshThird_commonRadius_distinctCaps_of_prefersFirstCap` | new theorem |
| 1 | `TwoSourceFreshThirdResidual.lean` | `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius` | add instance; replace D/D product |
| 2 | same | `false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius` | add instance |
| 3 | `TwoSourceRetainedMinimalCore.lean` | `false_of_twoCapSources_freshThirdBlockerFiber_on_commonRadius_surface` | add instance |
| 4 | same | `false_of_twoCapSources_freshThirdBlockerFiber` | add instance |
| 5 | same | `false_of_capSourceThirdCanonicalRowSurface` | add instance |
| 6 | `TwoSourceAlignedLowHits.lean` | `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows` | add instance |
| 7 | same | `exists_three_hit_of_two_collisionRows_capCross_normalForm` | add instance |
| 8 | same | `exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions` | add instance |
| 9 | same | `false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits` | add instance |
| 10 | `Coordinator.lean` | `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits` | add instance |
| 11 | same | `false_of_exactFourCollision_secondRadius_and_all_low_hits` | add instance |
| 12 | same | `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits` | add instance |
| 13 | same | `false_of_retainedInteriorBlockerCollision_and_all_low_hits` | add instance |
| 14 | same | `false_of_frontierAllLargeCapsTriApex_all_low_hits` | add instance |
| 15 | same | `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex` | add instance |
| 16 | same | `false_of_frontierAllLargeCapsTriApexUniformMetricResidual` | add instance |
| 17 | same | `false_of_frontierAllLargeCapsTriApexRobustResidual` | add instance |
| 18 | same | `false_of_frontierAllLargeCapsBiApexRobustResidual` | add instance |
| 19 | same | `false_of_frontierLargeOppositeCapsBiApexRobustResidual` | add instance |
| 20 | same | `false_of_frontierBiApexRobustResidual` | add instance |
| 21 | same | `false_of_frontierCommonDeletionPhysicalSecondApex` | add instance |
| 22 | same | `false_of_criticalPairFrontier` | add instance |
| 23 | same | `false_of_twoLargeCaps_commonCriticalMap` | add instance |
| 24 | `Continuation.lean` | `removableVertexOfLarge_of_nonIsM44` | construct and install preferred instance |

Compatibility declarations
`false_of_capSource_freshThirdBlockerFiber` and
`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow` also require
the instance if retained on the compiled API, but they are not additional
publication-spine nodes in the reverse graph above.

---

###### 19.12. Why the old finite diagnostic remains correct

The finite diagnostic records the currently chosen blocker center of each
visible source. It does not quantify over every alternative legal blocker and
therefore cannot express:

```text
if a legal first-cap blocker exists, the chosen blocker is first-cap.
```

The new proof changes the witness chosen before the frontier construction. It
does not derive the preference implication from the old finite predicates.
Consequently:

1. the diagnostic model still refutes the old fan-contact consequence;
2. no old finite UNSAT claim is made;
3. no additional unconstrained cap labels are introduced;
4. the source proof lives above the finite projection at the existential
   choice of `CriticalShellSystem`.

This is exactly why the new argument is not contradicted by the model.

---

###### 19.13. Soundness and provenance checks

The proof passes the following rejection tests.

1. **No arbitrary-system claim.** The theorem explicitly assumes
   `PrefersFirstCap`; it is not asserted for every `H`.
2. **Complete blocker witness.** Region eligibility includes a
   `CriticalSelectedFourClass` and deletion-failure proof.
3. **Nonrobustness used explicitly.** Row membership is converted to a blocker
   only after proving the row center is not fully deletion-robust.
4. **Canonical row only.** No arbitrary post-deletion support is identified
   with a chosen row.
5. **No radius identification.** Independent selected radii are never equated.
6. **No fan incidence assumption.** The fan and exact-three synchronization
   are unused.
7. **No `False.elim` producer.** The direct theorem does not manufacture a
   positive packet from an open contradiction.
8. **No fixed cardinality.** The construction is arbitrary-cardinality.
9. **No change to card-eleven certification.** The certified branch keeps its
   existing arbitrary system.
10. **No hidden choice compatibility.** The definition of
    `CriticalShellSystem` has no cross-source coherence field.

---

###### 19.14. Lean implementation and audit order

1. Add `RegionPreferredCriticalShell.lean` and compile it alone.
2. Add `PrefersFirstCap` and Theorem 7.1.
3. Compile the packet corollary independently.
4. Add Theorem 8.1 and run `#print axioms` on it.
5. Replace the common-radius equal-center D branch by Theorem 8.1.
6. Add the instance parameter through the declarations in §7.11, working upward
   in table order.
7. Refactor `Continuation.lean` to choose the preferred system only in the
   non-card-eleven arm.
8. Run a clean build.
9. Run the repository's sorry-reachability report; raw grep is insufficient.
10. Confirm that the publication theorem no longer reaches:
    `false_of_freshThird_pinnedEndpoint_outsideSeedResidual`,
    `false_of_freshThird_commonRadius_distinctCaps_survivingRow`, or the
    one-arc compatibility theorem.
11. Run:

```lean
#print axioms
  Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
    false_of_freshThird_commonRadius_distinctCaps_of_prefersFirstCap

#print axioms Problem97.erdos97_rhs
```

12. Accept closure only if neither result contains `sorryAx` through this
    route.

---

###### 19.15. Exact completion status

| Obligation | Status |
|---|---|
| Carrier-generic preferred-choice definition | **[COMPLETE PROSE AND LEAN HANDOFF]** |
| Existence of a region-preferred system | **[PROVED IN PROSE; NO MATHEMATICAL GAP]** |
| Row member → legal blocker at row center | **[PROVED FROM EXISTING NAMED THEOREM]** |
| Preferred-region synchronization | **[PROVED IN PROSE]** |
| Four-fact first-cap conflict | **[PROVED IN PROSE]** |
| One-interaction common-radius D contradiction | **[PROVED IN PROSE]** |
| Full pinned packet contradiction | **[PROVED IN PROSE AS COROLLARY]** |
| Elimination of fan/Q synchronization from live route | **[FULLY SPECIFIED]** |
| Exact propagation path to root | **[FULLY ENUMERATED]** |
| Lean elaboration | **[PENDING — TOOLCHAIN UNAVAILABLE HERE]** |
| Publication-spine `sorryAx` audit | **[PENDING CLEAN BUILD]** |
| Entire F2 cluster | **[STILL OPEN OUTSIDE THIS COMMON-RADIUS FRESHTHIRD ROUTE]** |

The packet-level FreshThird synchronization theorem is therefore closed in
prose and reduced to implementation-grade Lean declarations. The only
remaining uncertainty for this route is syntactic/elaboration integration and
reachability, not a missing mathematical implication.

---

##### 20. Checkpoint 36: cross-radius cycle and the F8 saturation exception

Checkpoint 36 preserves the intrinsic late-choice order of this section and
sharpens the two-cap-hit branch. Retain the two exact collision rows
`U_b,U_{bρ}` with distinct positive radii `r ≠ ρ`, retain the full legal-blocker
fibers, and select the fresh strict-first-cap sources before choosing blockers.
If the four-survivor upgrade does not fire, the resulting rows form an exact
cross-radius mutual-omission cycle. This is a positive producer theorem: it
supplies the tagged rows, their two radii, and both cross omissions required by
the Root B consumer.

There is one separate exception. In the F8 full-smaller-pair saturation arm,
the source-blocker row contains the complete smaller-radius pair. The ordinary
mutual-omission consumer does not retain enough provenance to absorb this arm.
Its exact remaining adapter must either preserve that pair through the blocker
choice or derive a four-survivor upgrade before forgetting it. Consequently,
checkpoint 36 does not close Root B and does not close any of the eight live F2
`sorry` declarations.

The current source also does not contain the proposed
`RegionPreferredCriticalShell.lean`; the preferred-choice patch remains a
statically audited handoff. The consolidated implementation and source audit is
recorded in `docs/audits/2026-08-22-f2-twosource-checkpoint36-synthesis.md`.

**Checkpoint-36 status:** `[CROSS-RADIUS PRODUCER PROSE-CLOSED; F8 ADAPTER,
ROOT A, ROOT B, LEAN ELABORATION, AND AXIOM AUDIT OPEN]`.

---
#### 16.5.I `TwoDeletionCollision.lean` — F3 two-deletion cluster, source-oriented expansion with live reconciliation pending

##### 16.5.I0 — Audit verdict and exact scope

The last audited source lineage contains three unresolved declarations in this cluster:

1. `b1_globalGapOrClosedTerminal_of_counterexample`;
2. `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`; and
3. `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`.

The enclosing coordinators are source-clean. They already perform the equal-blocker/distinct-blocker split, rule out a genuine two-row blocker cycle, choose a directed cross omission, construct the required common-deletion packet, and reduce the distinct-blocker branch to three literal source/blocker collisions or four bidirectional deletion-survival alternatives. The unresolved mathematics begins only after those reductions.

The previous F3 ledger correctly warned that neither I2 nor I3 is a direct application of the robust-apex tetrahedron theorem. It nevertheless left the branch products too implicit. The present audit does four additional things.

1. It gives every source, blocker, exact row, deletion, and erasure slice a fixed name.
2. It proves a new equal-blocker reduction: the canonical row of an escaped source omits at least one of the two original deleted sources.
3. It replaces the flat I2/I3 disjunctions by dependent, source-faithful continuation packets whose constructors are mechanically exhaustive.
4. It isolates the actual remaining theorem as a global cap-order or well-founded-continuation consumer. No local incidence argument presently proves that consumer.

Accordingly, the section is **fully expanded and low-level formalization ready through the continuation producer**, but the global contradiction is not honestly closed by the current hypotheses. Any implementation that marks all three declarations proved without adding the global consumer described below would merely move `sorryAx` or assume an unsupported geometric implication.

**Cluster status:** `[CANONICAL REDUCTIONS CLOSED IN PROSE; TWO SOURCE-FAITHFUL GLOBAL CONTINUATION CONSUMERS OPEN]`.

---

##### 16.5.I1 — Fixed notation for the complete two-deletion ingress

Fix the live context

```lean
{D : CounterexampleData}
{S : SurplusCapPacket D.A}
{radius : ℝ}
{H : CriticalShellSystem D.A}
{F : CriticalPairFrontier D S radius H}
(R : OriginalUniqueFourResidual F)
(hcard : 12 ≤ D.A.card)
(surface : ExactFourPostCardElevenRobustSurface R)
(rho : ℝ)
(hrho : 0 < rho)
(hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
(u v : CarrierVertex D.A)
(huNeV : u ≠ v)
(huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
(hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
(hvOmitted : v.1 ∉ row u)
(huOmitted : u.1 ∉ row v)
(first second : ExactFourMutualOmissionJointDeletion R rho u v)
(hdeletedNe : first.deleted ≠ second.deleted)
```

where `row x` abbreviates the canonical exact four-support selected by the late first-apex system at source `x`.

Use the following names throughout:


a. `H* = lateFirstApexSystem R`;

b. `a = S.oppApex2`, the physical second apex;

c. `C = SelectedClass D.A a rho`, the positive physical radius class;

d. `q = first.deleted.1` and `r = second.deleted.1`;

e. `b_u = H*.centerAt u.1 u.2`, `b_v = H*.centerAt v.1 v.2`;

f. `b_q = H*.centerAt q first.deleted.2`, `b_r = H*.centerAt r second.deleted.2`;

g. `K_u`, `K_v`, `K_q`, `K_r` for the corresponding canonical exact four-supports.

The joint-deletion structures supply all of the following source-authenticated facts:

\[
q,r\in C,
\qquad
q,r\notin K_u\cup K_v,
\qquad
q\ne r,
\qquad
q,r\notin\{u,v\}.
\tag{F3.I.1}
\]

They also supply

\[
b_u\ne b_v,
\tag{F3.I.2}
\]

and exact common-deletion packets showing that deletion of either `q` or `r` preserves K4 at each of `b_u`, `b_v`, and `a`:

\[
\operatorname{Survives}(q;b_u),
\quad
\operatorname{Survives}(q;b_v),
\quad
\operatorname{Survives}(q;a),
\tag{F3.I.3}
\]

\[
\operatorname{Survives}(r;b_u),
\quad
\operatorname{Survives}(r;b_v),
\quad
\operatorname{Survives}(r;a).
\tag{F3.I.4}
\]

Because `b_q` blocks deletion of `q` and `b_r` blocks deletion of `r`, blocker semantics give

\[
b_q\notin\{b_u,b_v,a\},
\qquad
b_r\notin\{b_u,b_v,a\}.
\tag{F3.I.5}
\]

Every named canonical support has cardinality exactly four, contains its source, omits its center, and is the unique heavy row at that center.

**Status:** `[PROVED SOURCE NORMAL FORM]`.

---

##### 16.5.I2 — The physical-class intersection bound used everywhere

For every carrier source `x`, the canonical late row at `x` meets `C` in at most two points whenever its center differs from `a`:

\[
|K_x\cap C|\le2.
\tag{F3.I.6}
\]

In the present ingress, the second-apex robustness surface proves `beta(x) != a` for every source used below. Thus (F3.I.6) applies to `K_u`, `K_v`, `K_q`, `K_r`, and every subsequently introduced escape row.

The reason is exact and geometric. `K_x` lies on a circle centered at `beta(x)`, while `C` lies on the circle centered at `a`. Distinct-center circles meet in at most two points.

This upper bound has two different uses and they must not be conflated.

1. It produces new deleted sources by finding points of `C` outside one or two canonical rows.
2. Once two named points are already in an intersection, it identifies the intersection exactly with that pair.

It never supplies a three-point overlap. In particular, it cannot prove the old B1 lower-overlap terminal.

**Status:** `[PROVED]`.

---

##### 16.5.I3 — The top-level blocker split is exact

The parent theorem performs

```lean
by_cases hblockersEq : b_q = b_r
```

and has exactly two children.

1. **Equal-blocker/B1 child:** `b_q = b_r`.
2. **Distinct-blocker/five-center child:** `b_q ≠ b_r`.

No third blocker relation is hidden. The two branches require different normalization because equal blockers canonically identify the rows, whereas distinct blockers permit only the two-circle intersection bounds.

**Status:** `[PROVED EXHAUSTIVE SPLIT]`.

---

### 16.5.I.A — Equal-blocker/B1 branch

##### 16.5.I4 — Exact equal-blocker normal form

Assume

\[
b_q=b_r=:b.
\tag{F3.I.A1}
\]

Canonical uniqueness at a fixed actual blocker gives

\[
K_q=K_r=:K.
\tag{F3.I.A2}
\]

Since each selected row contains its own source, equality of supports yields

\[
q,r\in K.
\tag{F3.I.A3}
\]

The two points are distinct and both lie in `C`. Equation (F3.I.6) applied to `K` therefore gives the exact trace

\[
K\cap C=\{q,r\},
\qquad
|K\cap C|=2.
\tag{F3.I.A4}
\]

Consequently every other physical-class point is omitted from `K`. In particular,

\[
u,v\notin K,
\tag{F3.I.A5}
\]

because `u,v` are distinct from `q,r` and belong to `C`.

Together with the original joint-deletion omissions `q,r notin K_u union K_v`, equation (F3.I.A5) means that each of the pairs `(q,u)`, `(q,v)`, `(r,u)`, and `(r,v)` is mutually omitted at the source-row level. This is useful continuation data; it is not yet a contradiction.

**Proof.** Support equality is `selectedSupports_eq_of_actualBlockers_eq`. Membership of `q,r` follows from the source-in-own-row fields. The upper bound (F3.I.6) and the two distinct members give exact cardinality two and then finite-set extensionality gives (F3.I.A4). QED.

**Status:** `[PROVED AS b1_live_normalForm, WITH (F3.I.A5) DERIVED EXPLICITLY]`.

---

##### 16.5.I5 — Exact saturation of the deleted-source perpendicular bisector

Both `a` and `b` are carrier points equidistant from `q` and `r`:

\[
\operatorname{dist}(a,q)=\operatorname{dist}(a,r)=\rho,
\tag{F3.I.A6}
\]

and, because `q,r∈K`,

\[
\operatorname{dist}(b,q)=\operatorname{dist}(b,r).
\tag{F3.I.A7}
\]

The centers are distinct: `b != a`, because deletion of `q` survives at `a` but fails at its actual blocker `b`. Strict convexity allows at most two carrier points on the perpendicular bisector of two distinct carrier points. Hence

\[
D.A.\operatorname{filter}
  \bigl(p\mapsto \operatorname{dist}(p,q)=\operatorname{dist}(p,r)\bigr)
=
\{b,a\}.
\tag{F3.I.A8}
\]

This is stronger than a cardinality upper bound. Every future carrier point equidistant from `q,r` must be literally `b` or `a`.

**Status:** `[PROVED AS b1_live_bisectorSet_eq_pair]`.

---

##### 16.5.I6 — The physical-class surplus produces a strict-cap escape

The cap inequality gives

\[
3\le |C\cap I_2|,
\qquad
I_2:=S.\operatorname{capInteriorByIndex}(S.\operatorname{oppIndex2}).
\tag{F3.I.A9}
\]

Since `K∩C={q,r}`, one can choose

\[
t\in C\cap I_2,
\qquad
t\ne q,
\qquad
t\ne r,
\qquad
t\notin K.
\tag{F3.I.A10}
\]

Let

\[
c=\beta(t),
\qquad
K_t=U_c.
\tag{F3.I.A11}
\]

Because `t∉K`, the unchanged exact row `K` witnesses survival after deleting `t` at `b`. Therefore `c≠b`. Deletion robustness at the physical apex similarly gives `c≠a`. Thus

\[
c\notin\{a,b\}.
\tag{F3.I.A12}
\]

The distinct-center circle bound gives

\[
|K_t\cap K|\le2.
\tag{F3.I.A13}
\]

This is the exact live B1 escape packet.

**Status:** `[PROVED; c≠a IS A DIRECT ROBUSTNESS ADAPTER]`.

---

##### 16.5.I7 — Why the old B1 terminal is a consumer, not a producer

The type `B1GlobalGapOrClosedTerminal C` is the disjunction of:

1. a third carrier point on the perpendicular bisector of `q,r`;
2. a proof that the bisector fiber has cardinality at least three; or
3. a universal assertion that every eligible escape row meets `K` in at least three points.

Every arm contradicts facts already proved in I5-I6:

- the first two contradict (F3.I.A8);
- the third contradicts (F3.I.A13).

Thus `false_of_b1_global_gap_or_closed_terminal` is a valid contradiction consumer. The missing declaration

```lean
b1_globalGapOrClosedTerminal_of_counterexample
```

asks the source context to produce a disjunction all of whose arms are already impossible. Nothing in the local source data implies that disjunction. In particular, the available theorem gives `|K_t∩K|≤2`, not `3≤|K_t∩K|`.

The correct repair is not to search for a lower-overlap proof. It is to retain the small-overlap escape and continue with its actual blocker.

**Status:** `[PROVED DIAGNOSIS; OLD PRODUCER INTERFACE REJECTED AS THE AUTHORITATIVE RESEARCH TARGET]`.

---

##### 16.5.I8 — New derived lemma: the escape row omits an original deleted source

The escape row cannot contain both `q` and `r`:

\[
q\notin K_t
\quad\text{or}\quad
r\notin K_t.
\tag{F3.I.A14}
\]

**Proof.** Suppose `q,r∈K_t`. Since `K_t` is a selected circle centered at `c`,

\[
\operatorname{dist}(c,q)=\operatorname{dist}(c,r).
\]

The point `c` is a carrier point. By (F3.I.A8), `c=b` or `c=a`. Both alternatives contradict (F3.I.A12). Hence `K_t` omits at least one of `q,r`. QED.

This lemma is stronger and more useful than (F3.I.A13). It produces a named deletion that survives at the new blocker `c`.

A direct Lean statement is:

```lean
theorem b1_escapeRow_crossOmission
    (C : B1GlobalTransportContext ...)
    {t : ℝ²} (ht : B1EscapeWitness C t) :
    C.first.deleted.1 ∉ rowAt t ∨
      C.second.deleted.1 ∉ rowAt t
```

The implementation uses `b1_live_bisectorSet_eq_pair`, source-in-own-row equal-distance identities, and the two inequalities `beta(t) != b`, `beta(t) != a`.

**Status:** `[NEW DERIVED LEMMA; COMPLETE PROSE PROOF]`.

---

##### 16.5.I9 — Source-exact common deletion generated by the escape

Choose

\[
s\in\{q,r\}
\tag{F3.I.A15}
\]

such that `s∉K_t`, and let `s'` be the other deleted source. Then deletion of `s` survives at `c` by exact-row persistence. It also survives at `a` by physical-apex deletion robustness. Therefore there is a source-exact packet

\[
\operatorname{CD}(s;c,a).
\tag{F3.I.A16}
\]

The actual blocker of `s` is the common blocker `b`, so blocker semantics record

\[
b\ne c,
\qquad
b\ne a.
\tag{F3.I.A17}
\]

At the same time, the original joint-deletion packet for `s` supplies

\[
\operatorname{Survives}(s;b_u),
\qquad
\operatorname{Survives}(s;b_v),
\qquad
\operatorname{Survives}(s;a).
\tag{F3.I.A18}
\]

Thus one deletion source now has four named surviving centers

\[
a,\,b_u,\,b_v,\,c.
\tag{F3.I.A19}
\]

The first three are pairwise distinct. The new center `c` is distinct from `a`, but may coincide with `b_u` or `b_v`. Those two collisions must be split explicitly rather than silently excluded.

A suitable packet is:

```lean
structure B1EscapeCrossDeletionPacket (C : B1GlobalTransportContext ...) where
  t : CarrierVertex D.A
  t_mem_class : t.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  t_mem_interior : t.1 ∈ S.capInteriorByIndex S.oppIndex2
  t_ne_first : t ≠ C.first.deleted
  t_ne_second : t ≠ C.second.deleted
  t_not_mem_commonRow : t.1 ∉ commonRow C
  escapeBlocker_ne_common : beta t ≠ commonBlocker C
  escapeBlocker_ne_apex : beta t ≠ S.oppApex2
  deletedSide : Fin 2
  deleted : CarrierVertex D.A
  deleted_eq : deleted = C.first.deleted ∨ deleted = C.second.deleted
  deleted_not_mem_escapeRow : deleted.1 ∉ row t
  packet : CommonDeletionTwoCenterPacket D Hlate deleted.1 (beta t) S.oppApex2
```

Every field is source-producible from I6-I8. The packet contains no desired contradiction as a field.

**Status:** `[NEW DERIVED PACKET; CONSTRUCTOR PROOF CLOSED IN PROSE]`.

---

##### 16.5.I10 — Exhaustive continuation split in the equal-blocker branch

Let `s` and `c` be as in I9, and let `K_s=K`. Split first on

\[
c=b_u
\quad\lor\quad
c=b_v
\quad\lor\quad
c\notin\{b_u,b_v\}.
\tag{F3.I.A20}
\]

The first two alternatives are exact blocker-fiber collisions:

- `c=b_u` gives `beta(t)=beta(u)` and therefore `K_t=K_u`;
- `c=b_v` gives `beta(t)=beta(v)` and therefore `K_t=K_v`.

Neither is an immediate contradiction. Each identifies the complete canonical support and must retain the exact source identities `t,u` or `t,v`.

In the fresh alternative, the four centers `a,b_u,b_v,c` are pairwise distinct. The exact row `K_s` has cardinality four and contains `s`. The source `s` cannot equal `a`, because `s∈C` and `rho>0`. Applying the same five-points-in-a-four-row finite lemma used by the live distinct-blocker branch gives exactly seven possibilities:

\[
\begin{array}{lll}
\mathsf{B1U}:&s=b_u,\\
\mathsf{B1V}:&s=b_v,\\
\mathsf{B1E}:&s=c,\\
\mathsf{B1A}:&a\notin K_s,\\
\mathsf{B1OU}:&b_u\notin K_s,\\
\mathsf{B1OV}:&b_v\notin K_s,\\
\mathsf{B1OE}:&c\notin K_s.
\end{array}
\tag{F3.I.A21}
\]

The four omission cases are equivalent to bidirectional survival pairs:

\[
\operatorname{Survives}(s;x)
\quad\text{and}\quad
\operatorname{Survives}(x;b)
\tag{F3.I.A22}
\]

for `x=a,b_u,b_v,c`, respectively. The first survival is already carried by the exact packets; the second follows from `x∉K_s` and canonical deletion semantics.

Hence the equal-blocker branch has nine source-faithful continuation constructors: two escape-blocker collisions plus the seven alternatives in (F3.I.A21). There is no residual default branch.

A faithful dependent type is:

```lean
inductive B1ContinuationCase (P : B1EscapeCrossDeletionPacket C) : Prop
  | escapeBlocker_eq_u
      (h : beta P.t = blocker C.u)
  | escapeBlocker_eq_v
      (h : beta P.t = blocker C.v)
  | deleted_eq_uBlocker
      (h : P.deleted.1 = blocker C.u)
  | deleted_eq_vBlocker
      (h : P.deleted.1 = blocker C.v)
  | deleted_eq_escapeBlocker
      (h : P.deleted.1 = beta P.t)
  | apex_pair
      (forward : Survives P.deleted.1 S.oppApex2)
      (reverse : Survives S.oppApex2 (commonBlocker C))
  | uBlocker_pair
      (forward : Survives P.deleted.1 (blocker C.u))
      (reverse : Survives (blocker C.u) (commonBlocker C))
  | vBlocker_pair
      (forward : Survives P.deleted.1 (blocker C.v))
      (reverse : Survives (blocker C.v) (commonBlocker C))
  | escapeBlocker_pair
      (forward : Survives P.deleted.1 (beta P.t))
      (reverse : Survives (beta P.t) (commonBlocker C))
```

**Status:** `[NEW EXHAUSTIVE REDUCTION; PRODUCER PROOF CLOSED IN PROSE]`.

---

##### 16.5.I11 — Mechanical Lean proof of the B1 continuation producer

The producer has the following shape:

```lean
theorem b1ContinuationCase_of_counterexample
    (C : B1GlobalTransportContext ... ) :
    ∃ P : B1EscapeCrossDeletionPacket C,
      B1ContinuationCase P := by
  obtain ⟨t, ht⟩ := b1_live_exists_third_interior_escape ...
  have hcross : q ∉ rowAt t ∨ r ∉ rowAt t :=
    b1_escapeRow_crossOmission C ht
  rcases hcross with hq | hr
  · let P := B1EscapeCrossDeletionPacket.of_first C t ht hq
    exact ⟨P, b1ContinuationCase_of_packet P⟩
  · let P := B1EscapeCrossDeletionPacket.of_second C t ht hr
    exact ⟨P, b1ContinuationCase_of_packet P⟩
```

The helper `b1ContinuationCase_of_packet` performs:

```lean
by_cases hcu : beta P.t = blocker C.u
· exact .escapeBlocker_eq_u hcu
by_cases hcv : beta P.t = blocker C.v
· exact .escapeBlocker_eq_v hcv
have hsplit := four_mem_card_four_split
  (K := commonRow C)
  (q := P.deleted.1)
  (a := S.oppApex2)
  (b := blocker C.u)
  (c := blocker C.v)
  (d := beta P.t)
  ...
rcases hsplit with hqa | hqu | hqv | hqe | ha | hu | hv | he
· exact (deleted_ne_apex P hqa).elim
· exact .deleted_eq_uBlocker hqu
· exact .deleted_eq_vBlocker hqv
· exact .deleted_eq_escapeBlocker hqe
· exact .apex_pair P.packet.survives₂
    ((cross_deletion_survives_iff_not_mem_selected_support ...).2 ha)
· exact .uBlocker_pair (original_u_survival P)
    ((cross_deletion_survives_iff_not_mem_selected_support ...).2 hu)
· exact .vBlocker_pair (original_v_survival P)
    ((cross_deletion_survives_iff_not_mem_selected_support ...).2 hv)
· exact .escapeBlocker_pair P.packet.survives₁
    ((cross_deletion_survives_iff_not_mem_selected_support ...).2 he)
```

All required inequalities are already available or follow from the two collision splits. This is low-level implementation work, not new geometry.

The current declaration `b1_globalGapOrClosedTerminal_of_counterexample` should therefore be bypassed or replaced by this continuation producer. Keeping the old theorem as a required public root would force a proof of an unnatural disjunction that the source does not support.

**Status:** `[MECHANICALLY FORMALIZABLE; NO OPEN LOCAL SUBCLAIMS]`.

---

##### 16.5.I12 — Exact remaining equal-blocker theorem

After I8-I11, the honest load-bearing statement is:

```lean
theorem false_of_B1ContinuationCase
    (C : B1GlobalTransportContext ...)
    (P : B1EscapeCrossDeletionPacket C)
    (Case : B1ContinuationCase P) : False
```

Equivalently:

> No minimal non-`IsM44` carrier realizes the equal-blocker normal form, its saturated two-point bisector fiber, the source-exact strict-cap escape, and one of the nine continuation constructors in I10.

This theorem must consume data not used by the local B1 consumers: cap order, first-apex fiber provenance, an extremal choice, a well-founded blocker transition, or a faithful bounded metric certificate. The source currently contains useful producer-side narrowing:

1. either one of `q,r` is in the strict second-cap interior;
2. or a third strict-interior joint deletion exists;
3. or one of the original sources `u,v` is strict-interior;
4. when both `u,v` are strict-interior, either both lie outside the first-apex blocker fiber and one named `q/w` deletion survives at one of their blockers, or exactly one belongs to the first-apex class.

Those alternatives should be stored as tags in the consumer packet. None is presently a contradiction.

**Status:** `[OPEN GLOBAL EQUAL-BLOCKER CONTINUATION CONSUMER]`.

---

### 16.5.I.B — Distinct-blocker/five-center branch

##### 16.5.I13 — The mutual cross-hit subbranch is impossible

Assume

\[
b_q\ne b_r.
\tag{F3.I.B1}
\]

If both cross memberships held,

\[
q\in K_r,
\qquad
r\in K_q,
\tag{F3.I.B2}
\]

then the three carrier centers `a,b_q,b_r` would all be equidistant from `q,r`:

- `a` because `q,r∈C`;
- `b_q` because `q,r∈K_q`;
- `b_r` because `q,r∈K_r`.

The centers are pairwise distinct by (F3.I.5) and (F3.I.B1), contradicting the carrier perpendicular-bisector bound. Therefore

\[
q\notin K_r
\quad\text{or}\quad
r\notin K_q.
\tag{F3.I.B3}
\]

**Status:** `[PROVED AS false_of_exactFour_twoDeletion_blockerTwoCycle AND exactFour_twoDeletion_crossOmission]`.

---

##### 16.5.I14 — Symmetric normalization to one directed cross omission

By exchanging `first` and `second` if necessary, the parent may assume

\[
q\notin K_r.
\tag{F3.I.B4}
\]

Then the unchanged exact row `K_r` witnesses survival after deleting `q` at `b_r`. Deletion of `q` also survives at the physical apex `a`. The source constructs

\[
\operatorname{CD}(q;b_r,a).
\tag{F3.I.B5}
\]

This packet keeps exact q-deleted supports at both centers, proves `b_q≠b_r,a`, and retains the literal deleted source `q`. It must not be flattened to two anonymous existential survivals.

Together with the original two joint-deletion packets, deletion of `q` survives at exactly the four named centers

\[
a,\ b_u,\ b_v,\ b_r.
\tag{F3.I.B6}
\]

These centers are pairwise distinct by the branch hypotheses.

**Status:** `[PROVED]`.

---

##### 16.5.I15 — Exact seven-way finite split

The canonical row `K_q` has four points and contains `q`. The five points

\[
q,\ a,\ b_u,\ b_v,\ b_r
\tag{F3.I.B7}
\]

cannot all be distinct members of `K_q`. The source proves `q≠a`; the other four centers are pairwise distinct. Therefore exactly one of the following seven alternatives is produced:

\[
\begin{array}{lll}
\mathsf U:&q=b_u,\\
\mathsf V:&q=b_v,\\
\mathsf R:&q=b_r,\\
\mathsf A:&a\notin K_q,\\
\mathsf{OU}:&b_u\notin K_q,\\
\mathsf{OV}:&b_v\notin K_q,\\
\mathsf{OR}:&b_r\notin K_q.
\end{array}
\tag{F3.I.B8}
\]

The live theorem `exactFour_fourSurvivingCenters_survivalSquare_split` expresses the last four alternatives as pairs of K4-survival assertions rather than support omissions. The omission form is more canonical and easier to compare with ambient rows.

**Status:** `[PROVED EXHAUSTIVE SPLIT]`.

---

##### 16.5.I16 — Three literal collision normal forms

The first three constructors of (F3.I.B8) must remain distinct.

###### I16.U — `q=b_u`

The actual blocker of `u` is the deleted source `q`:

\[
\beta(u)=q,
\qquad
\beta(q)=b_q.
\tag{F3.I.B9}
\]

The exact row `K_u` is centered at `q`, contains `u`, and omits `q` because its radius is positive. The joint-deletion packet already records `q∉K_u`, so the equality is consistent rather than contradictory. The branch contains the source-faithful blocker path

\[
u\longmapsto q\longmapsto b_q.
\tag{F3.I.B10}
\]

###### I16.V — `q=b_v`

Symmetrically,

\[
v\longmapsto q\longmapsto b_q,
\tag{F3.I.B11}
\]

with `K_v` centered at `q`, containing `v`, and omitting its center `q`.

###### I16.R — `q=b_r`

Here

\[
r\longmapsto q\longmapsto b_q.
\tag{F3.I.B12}
\]

The row `K_r` is centered at `q`, contains `r`, and omits `q`. This is exactly compatible with the chosen cross omission (F3.I.B4); it is not a center-in-own-row contradiction.

A faithful type is:

```lean
inductive TwoDeletionBlockerCollisionArm (P : TwoDeletionFiveCenterIngress ...) : Prop
  | deleted_eq_uBlocker
      (h : P.q = P.bu)
  | deleted_eq_vBlocker
      (h : P.q = P.bv)
  | deleted_eq_secondBlocker
      (h : P.q = P.br)
```

Each constructor should additionally expose the rewritten canonical row and the two-step blocker path through projection lemmas. Do not store those consequences as independent assumptions.

**Status:** `[NORMAL FORMS DERIVED; THREE GLOBAL COLLISION CONSUMERS OPEN]`.

---

##### 16.5.I17 — Four survival alternatives canonically become omission pairs

The four remaining constructors of (F3.I.B8) are:

\[
\begin{array}{lll}
\mathsf A:&\operatorname{Survives}(q;a)	ext{ and }\operatorname{Survives}(a;b_q),\\
\mathsf U_s:&\operatorname{Survives}(q;b_u)	ext{ and }\operatorname{Survives}(b_u;b_q),\\
\mathsf V_s:&\operatorname{Survives}(q;b_v)	ext{ and }\operatorname{Survives}(b_v;b_q),\\
\mathsf R_s:&\operatorname{Survives}(q;b_r)	ext{ and }\operatorname{Survives}(b_r;b_q).
\end{array}
\tag{F3.I.B13}
\]

The first survival in each line is already attached to a named exact q-deleted row:

- at `a`, from physical-apex robustness;
- at `b_u`, from `first.uPacket`;
- at `b_v`, from `first.vPacket`;
- at `b_r`, from the directed cross packet.

The second survival is equivalent to omission from `K_q`:

\[
a\notin K_q,
\quad
b_u\notin K_q,
\quad
b_v\notin K_q,
\quad
b_r\notin K_q,
\tag{F3.I.B14}
\]

respectively.

At a nonrobust center, any exact four-row extracted in an erased carrier at the actual blocker of a named source canonically equals that source's ambient row. The theorem

```lean
qDeletedRow_at_actualBlocker_eq_canonicalSupport
```

performs exactly this transport. Therefore the normalized branch packets can and should name ambient supports rather than retain unrelated post-deletion support variables.

The resulting exact omission forms are:

1. **Apex arm:** `a∉K_q`. The forward survival at `a` is robust, not canonicalized to a unique row at `a`.
2. **U arm:** `q∉K_u` and `b_u∉K_q`.
3. **V arm:** `q∉K_v` and `b_v∉K_q`.
4. **R arm:** `q∉K_r` and `b_r∉K_q`.

The first omissions in U,V,R are source-proved: U and V come from the joint-deletion structure, and R is the directed cross omission. No synchronization of independent radii is needed.

A faithful type is:

```lean
inductive NormalizedTwoDeletionSurvivalPair
    (P : TwoDeletionFiveCenterIngress ...) : Prop
  | apex
      (apex_not_mem_qRow : P.a ∉ P.Kq)
  | uBlocker
      (q_not_mem_uRow : P.q ∉ P.Ku)
      (uBlocker_not_mem_qRow : P.bu ∉ P.Kq)
  | vBlocker
      (q_not_mem_vRow : P.q ∉ P.Kv)
      (vBlocker_not_mem_qRow : P.bv ∉ P.Kq)
  | secondBlocker
      (q_not_mem_secondRow : P.q ∉ P.Kr)
      (secondBlocker_not_mem_qRow : P.br ∉ P.Kq)
```

**Status:** `[CANONICALIZATION CLOSED IN PROSE; FOUR GLOBAL PAIR CONSUMERS OPEN]`.

---

##### 16.5.I18 — One exact dependent case type replaces the two opaque leaves

Package the common ingress before splitting:

```lean
structure TwoDeletionFiveCenterIngress where
  R : OriginalUniqueFourResidual F
  hcard : 12 ≤ D.A.card
  surface : ExactFourPostCardElevenRobustSurface R
  rho : ℝ
  hrho : 0 < rho
  hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card
  u v : CarrierVertex D.A
  huNeV : u ≠ v
  huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvOmitted : v.1 ∉ row u
  huOmitted : u.1 ∉ row v
  first second : ExactFourMutualOmissionJointDeletion R rho u v
  deleted_ne : first.deleted ≠ second.deleted
  deletedBlockers_ne : beta first.deleted ≠ beta second.deleted
  firstBlocker_ne_u : beta first.deleted ≠ beta u
  firstBlocker_ne_v : beta first.deleted ≠ beta v
  firstBlocker_ne_apex : beta first.deleted ≠ S.oppApex2
  secondBlocker_ne_u : beta second.deleted ≠ beta u
  secondBlocker_ne_v : beta second.deleted ≠ beta v
  secondBlocker_ne_apex : beta second.deleted ≠ S.oppApex2
  crossOmission : first.deleted.1 ∉ row second.deleted
  crossPacket : CommonDeletionTwoCenterPacket
    D Hlate first.deleted.1 (beta second.deleted) S.oppApex2
```

Then define

```lean
inductive TwoDeletionContinuationCase
    (P : TwoDeletionFiveCenterIngress ...) : Prop
  | collision
      (arm : TwoDeletionBlockerCollisionArm P)
  | survival
      (arm : NormalizedTwoDeletionSurvivalPair P)
```

There are exactly `3+4=7` constructors after expanding the two nested types. Every constructor retains the literal source, blocker, ambient row, and omission orientation.

**Status:** `[SPECIFIED; STRUCTURE DEFINITIONS ARE LOW-LEVEL WORK]`.

---

##### 16.5.I19 — The continuation producer is completely proved by the current source

The theorem

```lean
theorem twoDeletionContinuationCase_of_ingress
    (P : TwoDeletionFiveCenterIngress ...) :
    TwoDeletionContinuationCase P
```

requires no new global geometry. Its proof is the existing finite split plus exact deletion semantics:

```lean
have hsplit := exactFour_fourSurvivingCenters_survivalSquare_split
  P.hrho P.first P.second
  P.secondBlocker_ne_u P.secondBlocker_ne_v P.secondBlocker_ne_apex
  P.crossPacket
rcases hsplit with hqu | hqv | hqr | ha | hu | hv | hr
· exact .collision (.deleted_eq_uBlocker hqu)
· exact .collision (.deleted_eq_vBlocker hqv)
· exact .collision (.deleted_eq_secondBlocker hqr)
· exact .survival (.apex
    ((cross_deletion_survives_iff_not_mem_selected_support ...).1 ha.2))
· exact .survival (.uBlocker
    P.first.deleted_not_mem_uRow
    ((cross_deletion_survives_iff_not_mem_selected_support ...).1 hu.2))
· exact .survival (.vBlocker
    P.first.deleted_not_mem_vRow
    ((cross_deletion_survives_iff_not_mem_selected_support ...).1 hv.2))
· exact .survival (.secondBlocker
    P.crossOmission
    ((cross_deletion_survives_iff_not_mem_selected_support ...).1 hr.2))
```

The direction `.1` or `.2` of the equivalence should be selected according to the actual theorem orientation in the source; no mathematical ambiguity remains.

This producer replaces both the flat `_hcollision` and `_hsquare` parameters by one exact dependent sum.

**Status:** `[PROVED IN PROSE FROM EXISTING LEAN THEOREMS; MECHANICAL TO IMPLEMENT]`.

---

##### 16.5.I20 — Mechanical rewrite of the live parent coordinator

After defining the packet and case type, the current theorem

```lean
false_of_exactFourMutualOmission_fourCenterCommonDeletion
```

can be rewritten as:

```lean
let P : TwoDeletionFiveCenterIngress :=
  TwoDeletionFiveCenterIngress.ofSource
    R hcard surface rho hrho hfive u v huNeV
    huClass hvClass hvOmitted huOmitted
    first second hdeletedNe hdeletedBlockersNe
    hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
    hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
    crossPacket crossOmission
exact false_of_twoDeletionContinuationCase P
  (twoDeletionContinuationCase_of_ingress P)
```

The only subtlety is that the current parent receives `crossPacket` but not the omission used to construct it. The omission is still available in the immediate caller `false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission`; it should be added to the ingress constructor rather than reconstructed from an arbitrary exact q-deleted row.

This is an additive refactor. It preserves every existing caller and removes duplicated seven-way dispatch code.

**Status:** `[LOW-LEVEL REFACTOR FULLY SPECIFIED]`.

---

##### 16.5.I21 — Exact remaining distinct-blocker theorem

The honest load-bearing theorem is:

```lean
theorem false_of_twoDeletionContinuationCase
    (P : TwoDeletionFiveCenterIngress ...)
    (Case : TwoDeletionContinuationCase P) : False
```

Equivalently:

> No minimal non-`IsM44` carrier realizes the source-faithful five-center ingress together with one of the three blocker-path collisions or one of the four normalized bidirectional deletion pairs.

A proof must use more than the local rows. The known partial Euclidean shell witnesses and the exact rational B2 model show that blocker equalities, two independent survivals, two-circle intersection bounds, and strict convexity can coexist locally. The consumer must exploit at least one global field that is presently absent from the flat leaves:

- an exact boundary order of the source, its blocker, and the relevant physical-class points;
- cap-index localization of the blockers and unnamed support points;
- a source-faithful third row whose overlap is named;
- a strict potential that advances under every continuation; or
- a bounded metric obstruction with a proved source-to-certificate coverage theorem.

**Status:** `[OPEN GLOBAL DISTINCT-BLOCKER CONTINUATION CONSUMER]`.

---

> **Historical v8 proposal (I22--I31).** The following generic-continuation,
> strict-potential, and bounded-transfer program is retained as provenance. It
> is superseded as an active implementation plan by I32/F3.55--F3.73. In
> particular, I25's recursive theorem and I28's two-root implementation order
> must not be used without first proving the missing cover and
> provenance-preserving successor invariants.

##### 16.5.I22 — The equal- and distinct-blocker branches can share one generic continuation interface

The B1 continuation in I10 and the distinct-blocker continuation in I18 have the same semantic shape:

1. a named deleted source `s`;
2. its actual blocker `b_s` and canonical row `K_s`;
3. a fully deletion-robust physical apex `a`;
4. three additional named surviving centers;
5. either a literal equality between `s` or a new blocker and one of those centers, or an omitted center in `K_s` producing a reverse survival.

This suggests one generic packet:

```lean
structure FourSurvivingCentersAtBlockedSource where
  source : CarrierVertex D.A
  blocker : ℝ²
  blocker_eq : blocker = beta source
  sourceRow : SelectedFourClass D.A blocker
  sourceRow_eq : sourceRow.support = row source
  apex : ℝ²
  c₁ c₂ c₃ : ℝ²
  centers_mem_A : ...
  centers_pairwise_ne : ...
  source_ne_apex : source.1 ≠ apex
  survives_apex : Survives source.1 apex
  survives₁ : Survives source.1 c₁
  survives₂ : Survives source.1 c₂
  survives₃ : Survives source.1 c₃
```

and a generic finite producer

```lean
inductive FourSurvivingCentersContinuation (P : FourSurvivingCentersAtBlockedSource) : Prop
  | source_eq_c₁ | source_eq_c₂ | source_eq_c₃
  | apex_omitted | c₁_omitted | c₂_omitted | c₃_omitted
```

The existing `four_mem_card_four_split` proves this producer whenever the four centers are pairwise distinct. B1 first splits the possible collisions of its newly produced escape blocker; the distinct-blocker branch already has all distinctness fields.

This abstraction is optional. It reduces code duplication, but it must not erase the branch-specific provenance needed by the global consumer. The concrete B1 and five-center packets should therefore remain as dependent refinements of the generic packet.

**Status:** `[DERIVED ARCHITECTURAL CONSOLIDATION]`.

---

##### 16.5.I23 — Why the tetrahedron continuation theorem still does not close F3

The robust-apex tetrahedron theorem requires three exact rows `B0,B1,B2`, an anchor source already present in all three required positions, and a seven-incidence saturation/missing-incidence split. The F3 continuation packets do not automatically provide that seed.

- A collision such as `q=b_u` identifies a center with a source. It does not place the remaining centers in `K_u` or `K_q`.
- A survival pair supplies an omission and two exact rows in different erased carriers. It does not supply the five positive cross-incidences needed by the tetrahedron pattern.
- The four survival alternatives are disjunctive. They are not four simultaneous row systems.

CD1-CD5 remain useful for converting omissions into common-deletion packets. CD7 may be called only in a subbranch that has independently produced all three ambient rows and all seed incidences.

**Status:** `[PROVED NON-APPLICATION BOUNDARY]`.

---

##### 16.5.I24 — Exact cap-order packet required by an analytic closure

A source-faithful order theorem should not accept anonymous points or an informal phrase such as “the blocker lies between the sources.” The minimum useful packet is:

```lean
structure TwoDeletionBoundaryPacket (P : TwoDeletionGlobalIngress ...) where
  B : BoundaryIndexing D.A
  sourceIndex : Fin B.n
  partnerIndex : Fin B.n
  blockerIndex : Fin B.n
  apexIndex : Fin B.n
  source_eq : B.boundary sourceIndex = P.source.1
  partner_eq : B.boundary partnerIndex = P.partner.1
  blocker_eq : B.boundary blockerIndex = P.blocker
  apex_eq : B.boundary apexIndex = P.apex
  source_ne_partner : sourceIndex ≠ partnerIndex
  separation : Sep sourceIndex partnerIndex blockerIndex apexIndex
  capTag_source : ...
  capTag_partner : ...
  capTag_blocker : ...
  rowSupportIndices : Fin 4 → Fin B.n
  rowSupport_exact : ...
  rowCenterOmission : ...
```

For any exact row centered at `p` containing two physical-class sources `x,y`, the opposite-side lemma gives

\[
\operatorname{Sep}(x,y;a,p).
\tag{F3.I.15}
\]

This orientation certificate is source-clean. It is not itself contradictory. The global theorem must compare several such certificates and prove a strict boundary transition or a forbidden interlacing.

**Status:** `[EXACT REQUIRED INTERFACE; PRODUCER PARTLY AVAILABLE, GLOBAL COMPARISON OPEN]`.

---

##### 16.5.I25 — A well-founded continuation theorem that would close both consumers

The most economical unbounded route is a strict-potential theorem. It should have the following semantic content.

> Given either a B1 continuation case or a distinct-blocker continuation case, construct a new source-faithful two-deletion packet whose potential is strictly smaller than the original packet's potential.

A valid potential must be finite and already determined by source data. Candidate values are:

1. the length of the `a`-avoiding boundary interval between the two physical sources of a row;
2. a lexicographic pair consisting of cap index and boundary interval length;
3. the number of physical-class points strictly between a source and its blocker;
4. an extremal rank of the deleted source among all joint deletions outside two named rows.

The theorem must state the decrease explicitly:

```lean
structure TwoDeletionProgress (P P' : TwoDeletionGlobalPacket ...) : Prop where
  sameCarrier : P'.A = P.A
  sourceFaithfulTransport : ...
  potential_lt : potential P' < potential P
```

Then

```lean
theorem next_or_false_of_twoDeletionContinuation
    (P : TwoDeletionGlobalPacket ...)
    (Case : TwoDeletionGlobalContinuation P) :
    False ∨ ∃ P', TwoDeletionProgress P P'
```

combined with well-founded induction on `potential` would close both global consumers.

The present source has no proved decrease theorem. A blocker cycle without a strict potential is locally realizable and cannot substitute for this obligation.

**Status:** `[PREFERRED UNBOUNDED CLOSURE SHAPE; OPEN MATHEMATICS]`.

---

##### 16.5.I26 — Bounded-certificate route and its required transfer theorem

The branch assumes `12 ≤ |A|` but has no upper bound. A finite certificate route is sound only after splitting:

\[
|A|=12,
\quad
|A|=13,
\quad
14\le |A|.
\tag{F3.I.16}
\]

For the first two arms, an exact metric certificate is plausible once the packet exports:

- a complete boundary indexing;
- all named source and blocker roles;
- all exact row supports;
- every required membership and omission;
- cap indices and exact cap cardinalities; and
- the equal-distance equations, not merely an incidence hypergraph.

For `14≤|A|`, the survival-cover library produces a source-faithful common-deletion packet and reduces to a physical-second-apex robust/critical residual. It does not prove `False`. A valid unbounded transfer theorem must map every F3 continuation case into a previously closed robust/critical endpoint or into a strictly smaller continuation packet.

The following shortcut is invalid:

> “The twelve- and thirteen-point cases are finite, and every larger carrier has an unused point, so delete it.”

K4 is not hereditary under arbitrary deletion, and an unused point may have a different canonical blocker.

**Status:** `[BOUNDED ENDPOINT PROGRAM SPECIFIED; UNBOUNDED TRANSFER OPEN]`.

---

##### 16.5.I27 — Rejection tests specific to F3

A low-level agent must reject any patch that performs one of the following moves.

1. **Produces the old B1 terminal by contradiction.** Proving `not Terminal` from the local geometry does not construct `Terminal`.
2. **Reverses the overlap inequality.** The live escape theorem proves `|K_t∩K|≤2`; no premise gives a lower bound of three.
3. **Treats blocker equality as support membership.** `q=b_u` makes `q` the center of `K_u`; it therefore explains `q∉K_u` rather than contradicting it.
4. **Treats four survival alternatives as simultaneous.** `_hsquare` is a disjunction of four pairs.
5. **Identifies radii across erased carriers.** Exact rows after different deletions remain independent until ambient canonicalization is proved.
6. **Identifies supports from equal center values without the unique-four theorem.** Use `qDeletedRow_at_actualBlocker_eq_canonicalSupport` or `selectedSupports_eq_of_actualBlockers_eq` explicitly.
7. **Calls CD7 without three actual rows and the seed incidences.** A common-deletion packet alone is not a tetrahedron packet.
8. **Uses a blocker cycle as a contradiction.** A strict finite potential is required.
9. **Uses only incidence counting.** Four-point rows can realize the abstract cover constraints.
10. **Uses only `Sep` predicates.** Abstract circular-order systems satisfying several separation clauses are realizable; complete row equalities or cap capacities are needed.
11. **Drops the literal deleted source.** Survival at a center after deleting `q` cannot be transported to deletion of `r`.
12. **Invokes a finite certificate without a coverage theorem.** The certificate must replay every source-faithful branch of the packet.

---

##### 16.5.I28 — Low-level implementation order

The following work is mechanical and should be completed before further proof discovery.

###### Step F3.1 — Introduce notation projections

Add stable projections for `a,C,q,r,b_u,b_v,b_q,b_r,K_u,K_v,K_q,K_r`. Prove all carrier-membership and distinctness facts once.

**Completion condition:** no downstream theorem unfolds `lateFirstApexSystem` merely to recover one of these names.

###### Step F3.2 — Prove `b1_escapeRow_crossOmission`

Formalize I8 directly from `b1_live_bisectorSet_eq_pair`.

**Completion condition:** the theorem returns the literal disjunction `q∉K_t ∨ r∉K_t` and contains no existential support choice.

###### Step F3.3 — Build `B1EscapeCrossDeletionPacket`

Construct the packet in both sides of the I8 disjunction. Derive `beta(t)≠a` from `surface.secondApex_robust` rather than adding it as an axiom.

**Completion condition:** both common-deletion supports elaborate in the original carrier and the packet retains which of `q,r` was selected.

###### Step F3.4 — Implement `B1ContinuationCase`

Split on `beta(t)=b_u`, `beta(t)=b_v`, then call `four_mem_card_four_split` in the fresh arm.

**Completion condition:** exactly nine constructor products are generated and no default branch remains.

###### Step F3.5 — Introduce `TwoDeletionFiveCenterIngress`

Move the directed cross omission from the immediate caller into the packet. Preserve `crossPacket` as a dependent field constructed from that omission.

**Completion condition:** the packet alone suffices to call the finite seven-way splitter.

###### Step F3.6 — Implement the typed collision and survival cases

Add `TwoDeletionBlockerCollisionArm`, `NormalizedTwoDeletionSurvivalPair`, and `TwoDeletionContinuationCase`. Prove ambient support canonicalization lemmas once.

**Completion condition:** the current I2 and I3 parent bodies become constructor adapters with no mathematical reasoning.

###### Step F3.7 — Replace the three source `sorry`s by two explicit global roots

The preferred declarations are:

```lean
theorem false_of_B1ContinuationCase ... : False

theorem false_of_twoDeletionContinuationCase ... : False
```

The old B1 producer may be removed from the spine. The old I2/I3 declarations become wrappers that construct the appropriate typed case and call the second root.

**Completion condition:** raw `grep` shows only the two explicit research roots in this cluster, and reachability regeneration confirms no accidental duplicate leaf remains.

###### Step F3.8 — Prove the global consumer or rebase it to a stronger theorem

This is the only nonmechanical step. Acceptable implementations are:

- a strict-potential continuation theorem;
- a cap-order forbidden-cycle theorem;
- a source-faithful bounded obstruction plus a `|A|≥14` transfer theorem; or
- a stronger global contradiction that bypasses the F3 coordinator entirely.

**Completion condition:** `#print axioms` for both global roots, the F3 parent, and the publication target contains no `sorryAx` or new axiom.

---

##### 16.5.I29 — Completion matrix

| ID | Obligation | Kind | Exact output | Current status |
|---|---|---|---|---|
| F3-A01 | Equal blockers give equal supports | canonicalization | `K_q=K_r` | **PROVED** |
| F3-A02 | Exact physical trace of common row | finite/circle | `K∩C={q,r}` | **PROVED** |
| F3-A03 | Exact deleted-source bisector fiber | convex geometry | fiber `={b,a}` | **PROVED** |
| F3-A04 | Strict-cap escape outside common row | counting/cap | named `t` | **PROVED** |
| F3-A05 | Escape blocker differs from `b,a` | blocker semantics | two inequalities | **PROVED/DERIVED** |
| F3-A06 | Escape row omits `q` or `r` | bisector saturation | literal disjunction | **NEW PROSE-PROVED** |
| F3-A07 | Escape common-deletion packet | deletion semantics | `CD(s;c,a)` | **NEW PROSE-PROVED** |
| F3-A08 | Equal-blocker nine-way continuation | finite split | `B1ContinuationCase` | **NEW PROSE-PROVED** |
| F3-A09 | Equal-blocker global consumer | new geometry | `False` | **OPEN** |
| F3-B01 | Distinct-blocker mutual cross hit impossible | bisector bound | cross omission | **PROVED** |
| F3-B02 | Directed cross common-deletion packet | deletion semantics | `CD(q;b_r,a)` | **PROVED** |
| F3-B03 | Seven-way finite split | cardinality four | 3 collisions or 4 pairs | **PROVED** |
| F3-B04 | Collision branch packetization | bookkeeping | 3 typed arms | **DERIVED; MECHANICAL** |
| F3-B05 | Survival ambient canonicalization | deletion transport | 4 typed omission arms | **DERIVED; MECHANICAL** |
| F3-B06 | Unified distinct-blocker producer | dispatcher | `TwoDeletionContinuationCase` | **PROSE-PROVED** |
| F3-B07 | Distinct-blocker global consumer | new geometry | `False` | **OPEN** |
| F3-C01 | Parent coordinators | dispatch | calls A09/B07 | **MECHANICAL AFTER PACKETS** |
| F3-C02 | Publication-spine audit | verification | no `sorryAx` | **BLOCKED BY A09/B07** |

---

##### 16.5.I30 — Exact theorem statements for proof discovery

The equal-blocker root should be stated no more weakly than:

> **F3EqualBlockerGlobalContradiction.** Let `C` be a live B1 transport context. Let `P` be the source-exact escape packet constructed from a strict second-cap physical-class point outside the common row. Assume one of the nine constructors of `B1ContinuationCase P`. Then `False`.

The distinct-blocker root should be stated no more weakly than:

> **F3DistinctBlockerGlobalContradiction.** Let `P` be a source-faithful two-deletion five-center ingress with a directed cross omission and its exact common-deletion packet. Assume one of the seven constructors of `TwoDeletionContinuationCase P`. Then `False`.

A single combined theorem is acceptable:

```lean
inductive F3GlobalPacket
  | equalBlocker
      (C : B1GlobalTransportContext ...)
      (P : B1EscapeCrossDeletionPacket C)
      (Case : B1ContinuationCase P)
  | distinctBlocker
      (P : TwoDeletionFiveCenterIngress ...)
      (Case : TwoDeletionContinuationCase P)

theorem false_of_F3GlobalPacket (P : F3GlobalPacket ...) : False
```

but only if its proof still pattern-matches on the two provenance constructors before using branch-specific data.

**Status:** `[EXACT RESEARCH ROOTS; NOT YET PROVED]`.

---

##### 16.5.I31 — Final F3 conclusion

The F3 cluster is no longer an opaque three-leaf family.

- The B1 equal-blocker row, its exact physical trace, its saturated bisector, and its strict-cap escape are source-clean.
- The new escape-row cross-omission theorem turns that escape into a positive, source-exact common-deletion continuation.
- The distinct-blocker branch is already reduced source-cleanly to three blocker paths or four normalized omission pairs.
- Every local case split and support canonicalization is now specified to the point where a low-level Lean agent can implement it without inventing mathematics.

What remains is genuinely global: refuting the nine equal-blocker continuation packets and the seven distinct-blocker continuation packets, preferably through one strict cap-order potential or one source-faithful bounded-obstruction/transfer theorem. Local circle incidence, the two-circle bound, or two deletion survivals do not supply that contradiction.

**Second-pass status:** `[LOCAL PROSE PRESERVED; GENERIC RECURSIVE CONTINUATION INTERFACE SUPERSEDED BY THE THIRD PASS]`.

#### 16.5.I32 — Third-pass correction: nonrecursive physical trace system

The active third-pass addendum F3.55--F3.73 replaces the unsupported
`JointCapCover`/well-founded-successor interface while preserving the valid
local calculus of I0--I21. A successor center need not lie in the physical joint
locus, and a deletion-survival pair does not by itself retain the two physical
sources, their rows, and both deletions. The literal collision constructors are
also locally consistent. They must therefore be treated as packet producers,
not terminal contradictions.

The corrected global interface is the physical trace system. For each physical
source, its trace is isolated or has one companion; reciprocal trace arrows are
exactly the equal-blocker pairs; and every blocker fiber contains at most two
physical sources. The induced conflict graph has at most as many edges as
vertices, so it contains a constructively selected mutually omitted family of
size at least one third. Such a family amplifies to simultaneous deletion
survival fans. The third pass then derives:

1. complete small conflict-graph normal forms and a rational sharpness witness;
2. the isolated-row versus paired-chord split for a five-source fan;
3. a common-center grid from four mutually omitted sources;
4. a fixed six-center grid from three isolated rows;
5. paired-chord companion multiplicity packets;
6. an exact support escape from four fixed common rows;
7. apex, physical, and external diagonal normal forms;
8. finite projections for the bounded joint-trace root; and
9. a complete reverse-center normal form for the three-source fan.

No metric contradiction is supplied by those reductions. The exact live roots
are:

| Root | Required contradiction |
|---|---|
| `F3-BOUND-ROOT` | refute the bounded joint-trace projections with `|J| ≤ 6`, hence `|C| ≤ 10` |
| `F3-THREE-ROOT` | refute the amplified three-source survival fan |
| `F3-DIAG-A-ROOT` | refute the apex-diagonal packet |
| `F3-DIAG-P-ROOT` | refute the three-physical-source diagonal packet |
| `F3-DIAG-X-ROOT` | refute the external-support diagonal packet |

The live module still has the three unresolved B1/B2/B3 declarations named in
I0. The detailed correction and historical-source accounting is in
`docs/audits/2026-08-22-f3-twodeletion-third-pass-synthesis.md`.

**Third-pass status:** `[LOCAL TRACE/GRAPH/FAN/NORMAL-FORM CALCULUS PROSE-CLOSED;
RECURSIVE INTERFACE REJECTED; FIVE METRIC ROOTS AND THREE LIVE SORRIES OPEN]`.

#### 16.5.37 Shared closure lemmas suggested by the leaf ledger

The twenty-nine current leaves do not appear to require twenty-nine unrelated discoveries. The ledger exposes reusable theorem families, and the TriApex reverse-hit refactor has already demonstrated that a proved producer can collapse several source leaves onto one genuine root. The robust-apex tetrahedron-or-continuation theorem has a complete prose proof in Section 16.5.38; the remaining families are research targets.

1. **Common-circle strict-arc blocker-cycle theorem.** Convert equal-distance rows whose centers and support pairs lie on one physical circle into oriented arc-midpoint relations. A closed strict midpoint cycle would discharge A1 and parts of B2-B5, and would provide the physical-placement side of C1.

2. **Robust-apex tetrahedron-or-common-deletion continuation theorem.** Three exact rows around a fully deletion-robust apex cannot realize the complete planar tetrahedron incidence pattern. Every missing incidence canonically produces a tagged common-deletion packet. This theorem is proved in Section 16.5.38. For A7 and A8 it remains the correct generic reduction. A5 now has a stronger source-specific analysis: A5.9-A5.12 show that the five-incidence hypothesis is redundant, exclude `d=xv`, and close the entire `d=xu` role family by strict-cap betweenness.

3. **Two-row retained-omission common-deletion cycle theorem.** Starting from one source-exact common-deletion packet in the tri-apex all-large context, prove a new cross hit, a forbidden repeated packet, or strict advance of a finite cap-order potential. This is the proper common engine for D8.

4. **Typed F3 continuation theorem.** The distinct-blocker branch has exactly three literal blocker-path collisions and four ambient canonical-row omission pairs. The equal-blocker branch now produces a strict-cap escape, a cross omission of one original deleted source, and nine typed continuation cases. A branch may call the tetrahedron theorem only after it has independently produced the required third row and anchor incidences. The preferred common closure is a strict cap-order potential or a source-faithful bounded-obstruction/transfer theorem.

5. **Two-radius convex-order theorem.** Combine concentric exact-four classes with reflected-pair or cap-span data to prove an exposed-vertex obstruction. D2 supplies the strongest contract; C3 should be reduced to it only after the missing grid identities are produced.

6. **Source-faithful six-center orientation theorem.** Normalize the F1, G1, H1, and fresh-third packets into exact rows with branch tags, then prove a cross-blocker, row-collision, or strict cyclic-potential terminal. This theorem must retain source and prescribed-deletion provenance.

7. **Unbounded cap-weighted blocker inequality or bounded-obstruction theorem.** A3 cannot be closed by finite endpoint enumeration alone. A scalable theorem must either contradict the all-blockers cover using convex boundary intervals or prove that every unbounded residual contains a bounded forbidden packet without deleting arbitrary carrier points.

The revised proof-discovery order is: finish A5's twenty-four-cell coverage after the strict-cap proof has removed the `Bxu` family; implement the source-clean F3 packetization and test a common strict boundary potential on its sixteen typed continuations; seek a strict potential for the unbounded A7/A8 continuation families; develop D8's two-row cycle theorem separately; then return to the two-radius, six-center, and unbounded global routes.

**Status:** [ONE SHARED THEOREM PROVED IN PROSE; SIX RESEARCH FAMILIES OPEN]

#### 16.5.38 Canonical common-deletion calculus and the robust-apex tetrahedron continuation theorem

This section replaces the earlier, overstrong “incidence-completion” target. The direction of implication matters. A deletion-survival witness naturally proves that a deleted point is absent from a critical exact row, or that the center has a second heavy radius. It does not force a positive cross-incidence. The valid reusable theorem is therefore a **tetrahedron-or-continuation theorem**: the complete incidence pattern is impossible, and every absent incidence creates a new source-exact common-deletion packet.

##### CD0. Exact rows and local survival

For a finite carrier `A`, write

\[
\operatorname{ExactRow}_A(c,R)
\]

when `R ⊆ A`, `|R|=4`, and there is a radius `r>0` such that every point of `R` is at distance `r` from `c`.

Write

\[
\operatorname{Survives}_A(z;c)
\]

when the erased carrier `A-z` still has four equidistant points at center `c`. The center itself need not belong to `A-z`; only the four support points must.

In a minimal no-removable configuration with a chosen actual blocker map `β`, a **source-exact common-deletion witness**

\[
\operatorname{CD}_A(z;p,q)
\]

records:

1. `z,p,q ∈ A` and `p ≠ q`;
2. `Survives_A(z;p)` and `Survives_A(z;q)`;
3. `β(z) ≠ p` and `β(z) ≠ q`; and
4. exact four-point supports for both survivals in `A-z`.

This is the semantic content needed from a `CommonDeletionTwoCenterPacket`; the present prose theorem does not depend on the current Lean structure boundary.

**Status:** [DEFINITIONAL REFORMULATION]

##### CD1. Exact-row persistence under an omitted deletion

If `ExactRow_A(c,R)` and `z ∉ R`, then

\[
\operatorname{Survives}_A(z;c).
\tag{F3.CD1}
\]

**Proof.** Since `R ⊆ A` and `z ∉ R`, one also has `R ⊆ A-z`. Its four points remain at the same positive radius from `c`. Thus `R` itself witnesses survival. QED.

**Status:** [PROVED]

##### CD2. A positive-radius row omits its center

If `ExactRow_A(c,R)`, then `c ∉ R`.

**Proof.** Every member of `R` is at a positive distance from `c`, whereas `dist(c,c)=0`. QED.

**Status:** [PROVED]

##### CD3. Survival excludes the actual blocker

Assume `β(z)` is chosen so that deletion of `z` destroys K4 at `β(z)`. If `Survives_A(z;c)`, then

\[
\beta(z)\ne c.
\tag{F3.CD3}
\]

**Proof.** Equality would say that deletion of `z` both destroys and preserves K4 at the same center. QED.

**Status:** [PROVED from blocker semantics]

##### CD4. Two omitted exact rows produce a common-deletion witness

Suppose `p≠q`, `ExactRow_A(p,Rp)`, `ExactRow_A(q,Rq)`, and

\[
z\notin R_p\cup R_q.
\]

Then `CD_A(z;p,q)`.

**Proof.** CD1 gives survival at both centers. CD3 gives both actual-blocker inequalities. The unchanged rows `Rp` and `Rq` are exact four-point supports in the erased carrier. QED.

**Status:** [PROVED]

##### CD5. A robust center paired with one omitted row

Call `O` **fully deletion-robust** when

\[
\forall z\in A,
\quad \operatorname{Survives}_A(z;O).
\]

If `O` is fully deletion-robust, `O≠c`, `ExactRow_A(c,R)`, and `z∉R`, then

\[
\operatorname{CD}_A(z;O,c).
\tag{F3.CD5}
\]

**Proof.** Robustness gives survival at `O`; CD1 gives survival at `c`; CD3 gives the blocker inequalities; exact supports may be retained or extracted from the two survival witnesses. QED.

**Status:** [PROVED]

##### CD6. The saturated three-row pattern is a planar tetrahedron

Let `B0,B1,B2` be exact rows centered at `O,c1,c2`, respectively. Let `a` be a carrier point. Assume the eight incidences

\[
\begin{aligned}
&a,c_1\in B_0,\\
&O,a,c_2\in B_1,\\
&O,c_1,a\in B_2.
\end{aligned}
\tag{F3.CD6.1}
\]

Then `O,c1,c2,a` are four distinct pairwise equidistant points.

**Proof.** Let the positive row radii be `r0,r1,r2`. From `a,c1∈B0`,

\[
\operatorname{dist}(O,a)=r_0=
\operatorname{dist}(O,c_1).
\]

From `O,a,c2∈B1`,

\[
\operatorname{dist}(c_1,O)=r_1=
\operatorname{dist}(c_1,a)=
\operatorname{dist}(c_1,c_2).
\]

Distance symmetry gives `r1=r0`. From `O,c1,a∈B2`,

\[
\operatorname{dist}(c_2,O)=r_2=
\operatorname{dist}(c_2,c_1)=
\operatorname{dist}(c_2,a).
\]

Since `dist(c2,c1)=dist(c1,c2)=r0`, one has `r2=r0`. Hence every one of the six pairwise distances among `O,c1,c2,a` equals the same positive number `r0`. Positive row radii also make all four points distinct.

Four pairwise equidistant points cannot lie in the Euclidean plane. Equivalently, three of them form an equilateral triangle and there is no planar point at the same edge distance from all three vertices. This is precisely the repository's proved three-exact-classes tetrahedron incompatibility. QED.

**Status:** [PROVED]

##### CD7. Robust-apex tetrahedron-or-common-deletion continuation

Assume:

1. `O` is fully deletion-robust;
2. `B0,B1,B2` are exact rows centered at pairwise distinct centers `O,c1,c2`;
3. `a∈B0`; and
4. all named points belong to `A`.

Then at least one of the following seven tagged continuation witnesses exists:

| Tag | Missing incidence | Common deletion produced |
|---|---|---|
| `T0` | `c1 ∉ B0` | `CD_A(c1; O,c1)` |
| `T1` | `O ∉ B1` | `CD_A(O; O,c1)` |
| `T2` | `a ∉ B1` | `CD_A(a; O,c1)` |
| `T3` | `c2 ∉ B1` | `CD_A(c2; O,c1)` |
| `T4` | `O ∉ B2` | `CD_A(O; O,c2)` |
| `T5` | `c1 ∉ B2` | `CD_A(c1; O,c2)` |
| `T6` | `a ∉ B2` | `CD_A(a; O,c2)` |

**Proof.** Suppose none of the seven tags holds. Then all seven listed incidences are present. Together with the assumed `a∈B0`, these are exactly the eight incidences (F3.CD6.1), contradicting CD6.

It remains to construct the advertised packet in each missing-incidence branch.

- In `T0`, the exact row `B0` omits `c1`; the exact row `B1` also omits `c1` by CD2 because it is centered at `c1`. CD4 gives `CD_A(c1;O,c1)`.
- In `T1`, robustness gives survival at `O` after deleting `O`, while `O∉B1` and CD1 give survival at `c1`. CD5 gives `CD_A(O;O,c1)`.
- The proofs of `T2` and `T3` are identical, deleting `a` and `c2`, respectively.
- The proofs of `T4`, `T5`, and `T6` use the exact row `B2` and CD5 in the same way.

Thus saturation is impossible and every failure of saturation has a canonical source-exact continuation. The `T0` packet is degenerate in the following precise sense: because `B1` is centered at `c1` and `O` is fully robust, `CD_A(c1;O,c1)` exists even without the missing incidence `c1∉B0`. The `T0` tag is still a valid branch label, but its packet should not be counted as new progress. QED.

**Status:** [DERIVED AND PROVED IN PROSE; T0 DEGENERACY RECORDED]

##### CD8. Why this is not positive incidence completion

CD7 proves

\[
\text{not saturated}
\quad\Longrightarrow\quad
\text{typed common-deletion continuation}.
\]

It does **not** prove that the seven incidences hold, nor that a continuation packet is contradictory. This direction is forced by the semantics: survival after deleting `z` is naturally witnessed when `z` is absent from an exact row. The missing incidence is therefore useful negative information, not a defect to be filled by fiat.

A generic positive-incidence theorem would be false without additional global hypotheses. Exact rows and common-deletion packets can occur in realizable local configurations. The remaining proof must consume cap order, exact cardinality, retained source provenance, or another global invariant.

**Status:** [PROVED SCOPE BOUNDARY]

##### CD9. Specialization to A5

Use

\[
(B_0,B_1,B_2;O,c_1,c_2,a)
=(BO,K_c,K_{xv};O,d,c,u).
\]

The branch already supplies `u∈BO`, `c∈Kc`, and `u∈Kxv`, so the generic theorem still produces the five missing-incidence positions formerly used by A5. However, the source-specific information is strictly stronger. A5.9 proves `d≠xv`, A5.10 shows that `u∈Kc`, `d∈BO`, and `d∈Kxv` are already incompatible, and A5.11 replaces the missing-incidence tags by the disjoint role families `U`, `Bxu`, `Boff`, `Xt`, and `Xv`. A5.12 then refutes `Bxu` outright. Consequently CD7 is a valid generic adapter, but it is no longer the preferred A5 dispatcher.

**Status:** [DERIVED; GENERIC REDUCTION SUPERSEDED BY THE STRONGER A5 ROLE SPLIT]

##### CD10. Specialization to A7

Use

\[
(B_0,B_1,B_2;O,c_1,c_2,a)
=(BO,K_{xu},K_{deleted};O,c_{xu},c_d,deleted).
\]

The fixed physical pair supplies `deleted` in all three seed rows, eliminating `T2` and `T6`; the remaining five tags are exactly the five missing incidences in A7.

**Status:** [DERIVED; canonical reduction complete]

##### CD11. Specialization to A8

Use

\[
(B_0,B_1,B_2;O,c_1,c_2,a)
=(BO,K_1,K_2;O,c_1,c_2,u).
\]

Failure after deleting `u` identifies `u` in both canonical rows, while the physical packet gives `u∈BO`. Again `T2` and `T6` are eliminated and the five remaining tags are exactly A8's missing-incidence split.

**Status:** [DERIVED; canonical reduction complete]

##### CD12. The three residual continuation theorems

After CD7, the former common-deletion incidence-completion target has separated into three honest geometric obligations:

1. **Exact-twelve twenty-four-cell coverage.** In A5's full `(5,4,6)` packet, the `Bxu` family is already impossible. Refute the four surviving role families `U`, `Boff`, `Xt`, and `Xv`, each crossed with the six source-authenticated deletion clauses. The `U` family has an exact-eleven five-survivor/two-failure normal form; `Boff` is an off-class bisector-localization problem; and `Xt`,`Xv` are named five-point circle-isosceles chains.
2. **Unbounded `u`-deletion continuation exclusion.** In A7's source-heavy rigid packet, refute the five tagged continuations by a cap-order potential or a scalable blocker inequality.
3. **Failed-then-surviving continuation exclusion.** In A8, combine the five tags with the exact multiplicity drops at `c1,c2` and the omission of `xv` from both canonical rows.

These are smaller than the original leaves and preserve the exact source and row responsible for every continuation. They should be stated as three dispatchers over one shared tag type, not as another five opaque `False` declarations per leaf.

**Status:** [OPEN GEOMETRIC TERMINALS; canonical logic closed]

##### CD13. Non-applications: D8, I2, and I3

The shared theorem originally proposed for A5, A7, A8, D8, I2, and I3 was too broad.

- **D8** has one two-row common-deletion packet and no third row, so CD6 cannot be instantiated.
- **I2** begins with blocker equalities, not missing tetrahedron incidences. A three-row seed must first be derived branch by branch.
- **I3** supplies one of four pairs of survival assertions. The rows, radii, and supports are not simultaneous or synchronized.

All three may reuse CD1-CD5. None is closed by CD7 without additional branch-specific geometry.

**Status:** [PROVED SCOPE CLASSIFICATION]
### 16.6 New prose-derived adapters

The following adapters and reductions are now complete at the prose level.

#### 16.6.1 Global deletion and all-blockers adapters

- semantic blocker iff canonical unique-four membership;
- semantic blocker iff pinned multiplicity drops from four to three;
- removable iff no canonical blocker;
- exact all-blocker incidence identity;
- canonical row injectivity;
- pair-codegree at most two;
- forced directed cycle on unique-four centers;
- finite legal blocker prescriptions extend to a total blocker section.
- universal robust-class trace bound for every source and every legal blocker;
- exact isolated-or-paired physical trace shape with a unique companion;
- physical blocker fibers have cardinality at most two and every chosen blocker image satisfies `C.card ≤ 2 * image.card`;
- blocker equality iff reciprocal physical trace;
- paired-trace blocker lies in the apex-avoiding boundary interval;
- universal one-row and multirow common-deletion fans inside a robust class;
- sparse physical trace graphs admit a pairwise mutually omitted family of size at least one third;
- mutually omitted families produce source-faithful amplified survival fans.

#### 16.6.2 Common-deletion and A5 adapters

- exact-row persistence under an omitted deletion;
- robust-apex tetrahedron-or-common-deletion continuation;
- U-family deterministic five-survivor/two-dangerous-triple normal form;
- U-family center-collision trichotomy and exclusion of `d = β(xu)`;
- U-family cycle-pair escape-or-cross-hit dichotomy;
- U-family cross-hit/physical-trace pruning table;
- exact-twelve three-row noncoverage and the row-avoiding deletion source;
- late first-apex fiber equals the exact first-apex class;
- exact partition
  \[
  A=C\mathbin{\dot\cup}Q\mathbin{\dot\cup}E,
  \qquad (|C|,|Q|,|E|)=(5,4,3);
  \]
- boundary-separation certificates for all five physical critical rows;
- exact cap-slot coverage, including the explicit premise `a,b,g ≠ J`;
- exact ten-cell same-side dispatcher;
- generic cocircular nested-bisector consumer closing Cell 7;
- nine-constructor same-side residual type retaining the full A5 source packet.

#### 16.6.3 Intrinsic F2 adapters

- a `CriticalShellSystem` is a chosen section of `CanonicalBlocks`;
- every finite legal blocker prescription extends to a total section;
- two fresh strict-first-cap sources exist from the cap-eight margin;
- every legal blocker of a fresh source avoids the two retained blockers and the three robust apices;
- every such blocker row contains a second fresh source;
- fresh radial mode is either common radius or aligned singleton radii;
- two selected fresh sources either have a common canonical blocker or admit mutually omitting blocker rows;
- the F2 branch reduces to `CR-CB`, `CR-MO`, `AR-CB`, or `AR-MO`;
- mutual-omission rows have the exact `CC`, `CS`, `SC`, or `SS` retained-pair trace mode;
- the four intrinsic packets reduce further to two open theorem families: common-blocker exclusion and mutual-omission-square exclusion.

The first-cap-preferred FreshThird API remains useful as a compatibility adapter for existing raw-main callers:

- `HasCriticalBlockerInRegion`;
- `CriticalShellSystem.PrefersRegion`;
- existence of a pointwise region-preferred system;
- row membership implies that the row center is a legal blocker;
- the four-fact first-cap conflict;
- direct common-radius distinct-cap contradiction under `PrefersFirstCap`.

#### 16.6.4 F3 joint-locus and third-pass trace adapters

- `rowTrace` and `jointDeletionLocus`;
- exact disjoint decomposition of the physical class into the two traces and the joint locus;
- the bound `C.card ≤ J.card + 4`;
- fresh-third-or-exact-retained-pair exhaustion;
- five-point shared-mate and six-point disjoint-mate normal forms;
- exact common trace in the equal-blocker branch, modulo source adapters;
- physical traces with at most one companion;
- reciprocal-trace/equal-blocker identification and blocker-fiber size at most two;
- sparse conflict graphs and the constructive one-third mutually omitted family;
- survival amplification to source-faithful fans;
- small conflict-graph, five-source, common-grid, paired-chord, and diagonal normal forms;
- finite bounded-root and three-source reverse-center projections.

The former strict-cap-span state and generic well-founded wrapper remain a
historical second-pass proposal. They are not an available closure interface
without the missing `JointCapCover` invariant and provenance-preserving
successor construction.

**Status:** [PROSE-COMPLETE AS STATED; A5 SOURCE ADAPTERS, F2 ROOT A/ROOT B, AND F3 CONSTRUCTOR CONSUMERS REMAIN OPEN]

---

### 16.7 Current Lean `sorry` impact ledger

This ledger records the expected effect of formalizing the authoritative prose against the current codebase. It does not treat a prose reduction, static source patch, or structural validation as a kernel build.

| Current declaration or frontier | Latest prose impact | Classification |
|---|---|---|
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence` | Existing A5 branch proofs close seven earlier child families; A5.13j8a additionally closes same-side Cell 7. The exact remaining escape frontier is Child O plus same-side cells `1,2,3,4,5,6,8,9,10`. | `[LEAN-BRANCH-CLOSER]` plus `[LEAN-HELPER-READY]`; parent still open |
| A5 same-side classifier | The 178-assignment table is reproduced only after the explicit source premise `a,b,g ≠ J`; ten exact same-side cells result. Cell 7 is prose-contradictory, while the other nine have exact rational witnesses for the physical midpoint core. | one branch closer; source adapter and nine full-A5 consumers open |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_missingIncidence` | CD10 gives the complete canonical five-tag continuation reduction. | `[LEAN-HELPER-READY]`; five geometric continuations open |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence` | CD11 gives the complete canonical five-tag reduction with multiplicity-drop data retained. | `[LEAN-HELPER-READY]`; five cap-sensitive continuations open |
| `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core` | D8.a completely refutes the equal-secondary-blocker child by canonical-support equality and a three-point circle intersection. | `[LEAN-BRANCH-CLOSER]`; distinct-blocker child remains `TA-JOINT-DELETION` |
| the other eight TriApex leaves | Source-audited normalization reduces the cluster to five typed geometry/continuation kernels. | specification complete; five kernels open |
| old built F2 leaves E1, E2, E3, F1, G1, H1 | The intrinsic all-blockers reduction bypasses their early-choice boundaries and produces four packets `CR-CB`, `CR-MO`, `AR-CB`, `AR-MO`. | `[LEAN-BYPASS-CANDIDATE]`; Root A and Root B open |
| F2 Root A | Exclude the common canonical blocker packets in common-radius and aligned-singleton modes. | `[OPEN]` new geometry |
| F2 Root B | Exclude the mutual-omission failure/survival square, with `CC/CS/SC/SS` trace normalization. | `[OPEN]` new geometry |
| raw-main common-radius FreshThird distinct-cap lineage | The first-cap-preferred-system proof and patch kit close this route mathematically after rebasing the shell choice. | `[LEAN-BYPASS-CANDIDATE]`; static audit passed, Lean build/axiom check pending |
| the three F3/two-deletion leaves | The old detached B1/B2/B3 boundaries are reduced to source-clean local packets and the third-pass physical trace system. The second-pass recursive interface is rejected. | `[LEAN-HELPER-READY]`; all three live `sorry`s remain |
| F3 trace/graph/fan calculus | Trace shape, blocker-fiber bound, sparse conflict graph, one-third mutually omitted family, survival amplification, and bounded/grid/diagonal normal forms are prose-complete. | source adapters and metric consumers open |
| F3 metric roots | `F3-BOUND-ROOT`, `F3-THREE-ROOT`, `F3-DIAG-A-ROOT`, `F3-DIAG-P-ROOT`, and `F3-DIAG-X-ROOT` require new Euclidean contradictions. | `[OPEN]` |
| universal physical-source package I15 | Every source in a robust physical class, and every legal blocker of that source, has an isolated or uniquely paired physical trace; blocker fibers have size at most two; paired traces have a forced boundary interval; the resulting trace graph and deletion fans admit generic sparse-family and amplification theorems. | `[LEAN-HELPER-READY]`; source adapters and downstream geometric consumers remain |
| all remaining publish-spine leaves | No complete prose proof currently matches the full declaration. | open |

A safe implementation order is now:

1. prove the A5 source adapter `a,b,g ≠ J`;
2. kernel-check the exact ten-cell classifier and the standalone Cell 7 finite/metric file;
3. formalize `false_of_cocircular_twoNestedBisectors_swapped` and remove Cell 7 from the A5 residual;
4. expose the unnamed supports and deletion semantics needed by the nine A5 same-side cells and Child O;
5. add the intrinsic F2 semantic structures and prose-complete producers, then attack Root A and Root B;
6. optionally land the first-cap-preferred FreshThird patch and run focused builds plus `#print axioms`;
7. formalize the third-pass physical-trace, blocker-fiber, sparse-graph, and
   survival-amplification producers against the live source;
8. attack `F3-BOUND-ROOT`, `F3-THREE-ROOT`, and the three diagonal roots with
   source-faithful metric consumers; do not revive the rejected recursive
   wrapper without new invariant theorems;
9. regenerate direct, coordinator, and publication spines before deleting or deprecating old leaves.

**Current frontier effect:** the built 23 August spine has 29 reachable
`sorry` leaves.  The TriApex reverse-hit selector is kernel-clean and removes
seven endpoint-specific leaves by transparent reduction to D1; D1 and D2 remain
open.  Eight A5 branch-closer families, including same-side Cell 7, remain
prose-complete; one later raw-main FreshThird route is prose-closed after a
source-choice refactor; the old six-leaf F2 architecture is reduced in prose to
two intrinsic roots; and the F3 trace/graph/fan normalization still has five
metric roots and three live `sorry`s.

**Status:** [LEAN IMPACT AUDIT UPDATED 23 AUGUST 2026; SEVEN-LEAF TRIAPEX FRONTIER REDUCTION VERIFIED; NO PROOF CLOSURE CLAIMED]

---
## 17. Theorem-to-source crosswalk

- **A4, D2** — `P97/UniversalProblem97.lean`
- **A5, D0** — `P97/SmallerCounterexample.lean`
- **D1, D3** — `P97/Descent.lean`
- **L2, L5-L10, E0-E5** — `P97/RemovableVertexAxiom/Base.lean`, `Continuation.lean`, and deletion helpers
- **B5-B12, I0-I7** — `P97/ATail/MinimalUniqueFourCover.lean`
- **P0-P1** — `P97/PinnedMultiplicity.lean`
- **Deletion robustness** — `P97/ATail/DeletionRobustness.lean`
- **M0-M15** — `P97/CapBridgeFromK4.lean` and `P97/Cap/PartitionFromMEC.lean`
- **Q0-Q17** — `P97/RemovableVertexAxiom/Continuation.lean`, plus pinned-surplus and certificate imports
- **N0-N9** — `P97/RemovableVertexAxiom/Continuation.lean`, `P97/ATail/FiniteN11Frontier.lean`, and `P97/ATail/FrontierLiveClosure/`
- **16.5.A1-A8** — `P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
- **A5 late-fiber API** — `UniqueFourLateChoiceTerminal.lean`, `ExactFourPhysicalConsumer.lean`, and `ExactFourRobustCapExpansion.lean`, source-read at commit `bc4c04db…`
- **A5 exact same-side classifier and Cell 7 audit** — `A5EscapeCollisionMetricCells.lean`, `a5-escape-same-side-metric-cells.csv`, `verify_a5_escape_metric_cells.py`, and `a5-escape-metric-audit-output.txt`
- **16.5.B1-B5** — `P97/ATail/FrontierLiveClosure/Rigid221Placement.lean`
- **16.5.C1-C5** — `P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`
- **16.5.D0-D13; live leaves D1-D9** — `P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean`; the authoritative source audit is `erdos-97-descent-prose-proof-atomic-leaf-ledger-f1-triapex-source-audited.md`
- **TriApex D8 equal-blocker branch** — canonical support equality from `ATailMinimalUniqueFourCover` and the frontier-radius intersection bound from `ATailFirstApexCriticalFiberRow`
- **F2 old built leaves E1-E3, F1, G1, H1** — `TwoSourceFreshThirdResidual.lean`, `TwoSourceFirstFiberCollision.lean`, `TwoSourceClosure.lean`, and `TwoSourceCanonicalSurface.lean`
- **F2 intrinsic all-blockers reduction** — `F2-all-blockers-two-cap-source-refactor.md`, `F2-TwoSource-semantic-all-blockers-ledger.md`, and `F2-all-blockers-semantic-refactor.patch`
- **F2 preferred-first-cap compatibility lane** — `FreshThird-first-cap-preferred-blocker-synchronization-prose-proof-v2.md`, `RegionPreferredCriticalShell.lean`, `FreshThird-first-cap-preferred-source.patch`, and the associated static audit/README
- **F2 finite no-go witness** — `TwoSourceFreshThirdResidualDiagnostics.lean`; it remains a no-go for the old projected finite synchronization proposal, not a contradiction to the semantic or preferred-choice proofs
- **16.5.I0-I31 and F3.32-F3.54** — `P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean` together with the second-pass F3 manuscripts; their local calculus is retained but their generic recursive interface is superseded
- **16.5.I32 / authoritative F3 correction** — `f3_trace_graph_third_pass_addendum.md`, especially F3.55-F3.73, and `docs/audits/2026-08-22-f3-twodeletion-third-pass-synthesis.md`
- **Universal physical-source / F3 trace-digraph package** — the trace lemmas, one-third family theorem, survival amplification, grid/diagonal reductions, and rational sharpness witness are prose-closed; the five metric roots and live Lean adapters remain open
- **Final composition** — `P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean`
- **Current frontier measurement and off-spine exclusions** — repository `README.md`, proof-status section

---
# Appendix A. Exact rational local B2 stress model

The following eight rational points are in strict convex position:

```text
z1 = (-1, 0)
x  = (1, 0)
c1 = (-16/65, -63/65)
c2 = (8/17, -15/17)
c3 = (3/5, -4/5)
r1 = (-33/17, 30/17)
r2 = (-59/85, 168/85)
r3 = (-1, 2)
```

The five points `z1,x,c1,c2,c3` lie on the unit circle centered at the origin. The four points `x,r1,r2,r3` lie on the radius-two circle centered at `z1=(-1,0)`. The two selected point sets meet only at `x`.

One strict hull order is

```text
r1 -> z1 -> c1 -> c2 -> c3 -> x -> r2 -> r3.
```

The eight consecutive orientation determinants are

```text
462/1105, 168/221, 264/5525, 6/85,
912/425, 48/85, 8/85, 32/17.
```

All are positive. This model refutes only the proposed local implication; it does not satisfy the full counterexample or minimality hypotheses.

---

# Appendix B. Adversarial checklist for every proposed terminal lemma

Before a new geometric statement is accepted into the prose proof or Lean implementation, verify all of the following.

1. **Quantifiers.** Is the hypothesis one simultaneous configuration or a disjunction of alternatives?
2. **Radius identity.** Are two existentially chosen radii actually proved equal before they are compared?
3. **Support identity.** Are selected four-point supports canonical at their centers, or merely arbitrary witnesses?
4. **Source identity.** Is the deleted point named and preserved through every adapter?
5. **Blocker provenance.** Is the center the blocker of the intended source, not an anonymous center obtained later?
6. **Distinctness.** Are all center/source and center/center inequalities explicitly available?
7. **Cap location.** Does every claimed cap-interior or endpoint fact have a producer?
8. **Cyclic order.** Does a crossing or orientation conclusion have an actual order hypothesis?
9. **Partial witnesses.** Does the theorem accidentally contradict the exact eight- or eleven-point partial models?
10. **Unboundedness.** If the theorem is fixed-cardinality, what transfers it to every larger cardinality?
11. **Dependency closure.** Does the final declaration avoid `sorryAx` transitively, not merely in its own file?
12. **Trust boundary.** Are any `native_decide` or external certificates declared and audited under project policy?

---

# Appendix C. Final research conclusion

The prose proof is complete through the elementary deletion calculus, pinned-multiplicity semantics, canonical blocker extraction, minimum-enclosing-circle packet construction, and the certified `IsM44` branch. The 22 August consolidation and the present checkpoint add six concrete advances.

1. **A5 escape metric frontier.** The escape arm has the exact
   \[
   A=C\mathbin{\dot\cup}Q\mathbin{\dot\cup}E,
   \qquad (|C|,|Q|,|E|)=(5,4,3)
   \]
   partition, boundary-separation certificates, an exact opposite-side/same-side split, and an audited ten-cell same-side classifier. Cell 7 is prose-closed by a cocircular nested-bisector midpoint contradiction. Exact rational physical-core witnesses show that cells `1,2,3,4,5,6,8,9,10` cannot be closed from the midpoint/order core alone. The genuine A5 escape frontier is therefore Child O plus those nine full-A5 cells.

2. **TriApex.** A kernel-clean reverse-hit selector now produces the D1
   joint-deletion packet before endpoint classification.  D3--D9 are
   source-clean wrappers through D1, leaving exactly D1 and D2 as independent
   open roots.  The historical equal-secondary-blocker child of D8 remains a
   useful local contradiction but is off the active route.

3. **F2/TwoSource semantic refactor.** The old six-leaf FreshThird/fiber architecture is no longer the recommended mathematical boundary. An intrinsic all-blockers and finite-late-choice argument proves a four-packet reduction:
   \[
   \mathrm{CR\!-\!CB},\quad
   \mathrm{CR\!-\!MO},\quad
   \mathrm{AR\!-\!CB},\quad
   \mathrm{AR\!-\!MO}.
   \]
   These group into two open roots: common canonical blocker exclusion and mutual omission square exclusion. The reduction is prose-complete; the two roots are not.

4. **FreshThird compatibility closure.** Independently of the semantic refactor, the later raw-main common-radius distinct-cap route is mathematically closed after choosing a critical-shell system that prefers legal first-cap blockers. A source patch and static propagation audit exist, but focused Lean builds and axiom checks remain mandatory.

5. **F3/two-deletion third pass.** The latest pass preserves the valid
   joint-locus calculus but rejects the unsupported recursive successor
   interface. It proves the physical-trace, blocker-fiber, sparse-graph,
   mutually-omitted-family, survival-fan, bounded, common-grid, and diagonal
   normal forms. The active frontier is the five metric roots listed in
   Section 16.5.I32, plus live Lean adapters.

6. **Universal physical-source (`∀v`) package.** Every source in a positive-radius class centered at a fully deletion-robust carrier point, and every legal canonical blocker of that source, has a physical trace of the form `{v}` or `{v,w}` with a unique companion. Blocker fibers over that class have size at most two; reciprocal traces are exactly equal-blocker pairs; paired traces have a forced apex-avoiding boundary placement; and the complements of one or several rows produce source-exact deletion fans. After choosing any blocker section, the trace conflict graph is one-third sparse and pairwise mutually omitted families amplify to many simultaneous survival centers. An exact rational trace triangle shows that these universal statements are sharp at the trace/order level and are helpers rather than a terminal contradiction.

These advances do not prove the general non-`IsM44` theorem. The strongest clean reformulation remains:

> In a minimal non-`IsM44` configuration, the canonical four-point rows of all unique-four centers cover the carrier, omit their own centers, meet pairwise in at most two points, and interact with a three-cap convex order. Prove that no such Euclidean configuration exists, or directly produce a removable vertex.

The cover, multiplicity, circle-intersection, pair-codegree, and abstract orientation consequences alone do not prove this. The remaining proof must use complete metric rows, source-authenticated deletion synchronization, cap order, a strategic all-blockers choice, a provenance-preserving continuation whose invariant is actually proved, or a replayable exact certificate whose coverage is proved from the source packet.

The immediate research and implementation priorities are now:

1. prove the A5 `a,b,g ≠ J` source adapter, kernel-check the exact ten-cell dispatcher, and formalize the generic Cell 7 nested-bisector theorem;
2. expose the unnamed support members and deletion semantics needed by the nine A5 residual cells and Child O;
3. formalize the I15 universal physical-source API before adding more named-source lemmas, then use it to simplify A5, F2, and F3 callers;
4. implement the intrinsic F2 producers and attack Root A and Root B rather than extending the old six-leaf tree;
5. land and build-check the preferred-first-cap FreshThird compatibility patch where it removes a real caller;
6. formalize the F3 trace/graph/fan producers, then attack the bounded,
   three-source, and three diagonal metric roots without reviving the rejected
   `JointCapCover` recursion;
7. close only the bounded F3 profiles that survive the cardinality and companion audits; and
8. regenerate the actual Lean dependency spine and axiom closure before reclassifying any current `sorry`.

For A5 and bounded F3 endpoints, finite work must be explicit-class, order-decorated, and separately prove source-to-cell coverage and cell replay. For F2 Root A/Root B and the unbounded global branches, a new Euclidean or carrier-wide theorem is still required.

That is the exact frontier of the authoritative prose proof.

---

## Source notes

- **[R1]** Repository `README.md`, proof-status and frontier snapshot measured 18 August 2026.
- **[R2]** `lean/Erdos9796Proof/P97/UniversalProblem97.lean`.
- **[R3]** `lean/Erdos9796Proof/P97/SmallerCounterexample.lean`.
- **[R4]** `lean/Erdos9796Proof/P97/Descent.lean`.
- **[R5]** `lean/Erdos9796Proof/P97/CapBridgeFromK4.lean`.
- **[R6]** `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean`.
- **[R7]** `lean/Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean`.
- **[R8]** `lean/Erdos9796Proof/P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean`.
- **[R9]** `lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean`.
- **[R10]** `lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean`.
- **[R11]** `lean/Erdos9796Proof/P97/PinnedMultiplicity.lean`.
- **[R12]** `docs/plans/2026-08-18-b-family-closure-plan.md`, revision 4, its full audit, and the exact rational stress-test artifact.
- **[R13]** `docs/notes/late-first-apex-system-outside-first-apex-fiber-api-2026-08-20.md`, source-read at commit `bc4c04db398979c57edaf4af9c60e1eae984f436`.
- **[R14]** The A5 escape/cap-slot work through `erdos-97-descent-prose-proof-authoritative(4)-escape-refactor-2026-08-21.md`.
- **[R15]** `docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md`, synthesizing checkpoint 4, D1 v23, continuation v4, the independent review, and superseded F1 provenance.
- **[R16]** `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-FreshThird-synchronization-prose-closed.md`.
- **[R17]** `FreshThird-first-cap-preferred-blocker-synchronization-prose-proof-v2.md`.
- **[R18]** `FreshThird-first-cap-preferred-source.patch`, `RegionPreferredCriticalShell.lean`, and `FreshThird-first-cap-preferred-static-audit.txt`.
- **[R19]** Source-read checks against `Rigid221SourceHeavy.lean` and the late-first-apex production API at commit `bc4c04db…`.
- **[R20]** `A5EscapeCollisionMetricCells.lean`, `a5-escape-same-side-metric-cells.csv`, `verify_a5_escape_metric_cells.py`, and `a5-escape-metric-audit-output.txt`.
- **[R21]** `docs/audits/2026-08-22-f2-twosource-checkpoint36-synthesis.md`, including the all-blockers refactor, cross-radius cycle, F8 exception, FreshThird handoff, and superseded F2 lineage.
- **[R22]** `FreshThird-first-cap-preferred-closure-README.md` and the v2 closure bundle; static/source-patch checks passed, Lean/Lake was unavailable.
- **[R23]** `docs/audits/2026-08-22-f3-twodeletion-third-pass-synthesis.md`; second-pass joint-locus manuscripts are retained there as corrected provenance.
- **[R24]** `f3_live_source_reconciliation.md` and `F3-closure-work-validation.txt`; prose structure was validated, but exact live-source declaration reconciliation and an integrated Lean build remain outstanding.
- **[R25]** `f3_trace_graph_third_pass_addendum.md`, F3.55-F3.73; source of the rejection of the recursive interface and the universal physical-trace, sparse conflict-graph, survival-amplification, five-source, common-grid, diagonal, bounded-normal-form, and exact rational sharpness results.
- **[R26]** `docs/notes/2026-08-22-p97-literature-bridge.md` and `docs/p97-prose-material-integration-ledger-2026-08-22.md`; project-native literature-status matrix and exact accounting for all 117 archive sources.
