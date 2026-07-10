# Lean Codebase Audit

Audit date: 2026-07-09

Scope: the Lean source tree, certificate and census boundaries, proof-blueprint
state, build warnings, and obvious duplication or simplification opportunities.
This audit was performed against a heavily modified working tree. No Lean or
generated source files were changed as part of the audit.

## Findings

### P1: Hidden proof surface inside five leaves

The proof-blueprint reports five live leaf declarations, but the source contains
87 code-level `sorry` terms:

- `U1LargeCapRouteBTail.lean`: 81 occurrences, of which 80 are code terms and one is a docstring mention. The main concentration is the live theorem at [line 3525](../../lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean#L3525), with branch-local holes such as [line 3792](../../lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean#L3792).
- `RemovableVertexAxiom/Base.lean`: 2 code terms inside [the endpoint residual theorem](../../lean/Erdos9796Proof/P97/RemovableVertexAxiom/Base.lean#L10055).
- `RemovableVertexAxiom/Continuation.lean`: 4 code terms inside [the erased-pin residual theorem](../../lean/Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean#L107).
- `RemovableVertexAxiom/PinnedSurplusProducer.lean`: 1 code term inside [the pinned-surplus producer](../../lean/Erdos9796Proof/P97/RemovableVertexAxiom/PinnedSurplusProducer.lean#L300).

The five-leaf metric remains useful for aggregate tractability, but branch-local
holes are not independently auditable or directly mineable. The recommended
refactor is to extract named producer and case lemmas, leaving the existing
consumer declarations as the public closure boundary.

Resolution update, 2026-07-09: the pinned-surplus source term has moved from
`isM44PinnedSurplusNonVExactShapeProducer` to the direct larger-regime theorem
`isM44PinnedSurplusGeneralMResidualsExcluded` in
`RemovableVertexAxiom/PinnedSurplusBank.lean`.  The exact-shape and
metric-shadow producers are now proved for `S.surplusCap.card = 5`; the total
source-`sorry` count is unchanged by this split.  Both orientation-specific
extra-critical-packet extraction theorems are now proved.  The one source term
remains at the direct obstruction from those packets and a critical-shell
system, rather than at the extraction boundary.  The extracted surface now
includes the exact critical shell, a fixed-triple label outside the pinned
class, and the full selected-candidate/two-auxiliary bounded audit frame.  The
frame's centers have a proved q-deleted-four/q-critical-three dichotomy, but
not bounded-support confinement.  The direct terminal consumer is now proved:
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses` turns exact
rowwise confined classes into audited support and the finite contradiction,
without U2 or Mode A.  The remaining finite-route risk is entirely producer
side: q-critical rows must be eliminated or promoted, and each q-deleted class
must be confined to the bounded support.

### P1: Blueprint anchor and status documentation are stale

At audit time, the live blueprint anchor was still
`Problem97.isM44PinnedSurplusResidualsExcluded`, while the actual open producer
was `Problem97.isM44PinnedSurplusNonVExactShapeProducer`. The README and several
working documents used the old name. The root module also claimed that the
proof reached a single remaining `sorry` at
[line 10](../../lean/Erdos9796Proof.lean#L10).

The current pinned-surplus anchor should be the general-m residual above, not
either of the two superseded producer names.

The README link to `RemovableVertexAxiom.lean#L546` is invalid: that file is a
9-line coordinator, while the declarations now live under the
`RemovableVertexAxiom/` directory. This can direct future agents to the wrong
anchor and wrong file.

### P1: The relaxed singleton bank is not a general-m coverage theorem

The empty-residue generator report classifies every nonzero generator after a
singleton leaf is chosen, but does not prove that a general-m submask assignment
satisfies any leaf.  The reproducible finite probe
`scripts/pinned-generalm-certificate-coverage.py` enforces candidate-submask
domains, cyclic cross-separation, and the global point-pair class-count bound.
All 15 fixed `.v/.w` rows admit assignments defeating every available leaf at
nonfixed labelled-cardinality floors 2 and 3; all 15 are covered at floor 4.

This is a finite-interface countermodel, not a geometric realization.  It
nevertheless falsifies the claimed implication from the currently formalized
finite constraints to singleton-leaf coverage.  General-m closure needs a
four-label confinement/selection theorem, additional geometric constraints
that eliminate these models, a direct obstruction from the newly extracted
audit frame, a proof of `H.RowwiseConfinedQDeletedClasses` resolving both its
q-critical and confinement subobligations, or a broader verified certificate
family.  Minimality does produce the frame and its finite consumer, but does
not itself produce the rowwise proposition or reduce the configuration to
`m = 5`.

### P1: Root-build coverage excludes active source

The full proof-blueprint spine reports 50 unimported Lean files containing 1,319
symbols. These files compile only when targeted and are not covered by the
default published-theorem build. Examples include:

- [Census554/Bank/Pat05043.lean](../../lean/Erdos9796Proof/P97/Census554/Bank/Pat05043.lean), an untracked 7.1 MB generated file.
- [MultiCenter/Certificate/ProfileClassIncidence.lean](../../lean/Erdos9796Proof/P97/MultiCenter/Certificate/ProfileClassIncidence.lean), approximately 1.6 MB and unimported from the root closure.
- `ErasedPinOrderedProducer.lean` and the remaining MultiCenter and Census554 branches.

Each active branch should either receive an explicit build/CI target or be moved
outside `lean/`. The untracked 7.1 MB census file should not be staged
accidentally.

### P2: Mining exclusions are broader than generated data

The globs at [.blueprint.toml:35](../../.blueprint.toml#L35) and
[.blueprint.toml:36](../../.blueprint.toml#L36) exclude entire
`EndpointCertificate` and `SurplusCertificate` namespaces. That includes
hand-written checker, geometry, and soundness modules as well as generated
payload shards. The status report consequently places 7,683 symbols outside the
mined call graph.

The skip list should target generated banks and term shards specifically, while
checker and soundness modules should remain visible to the proof graph. The
source and kernel scans found no actual `axiom`, `unsafe`, `extern`, or
`implemented_by` declarations; the only unapproved custom axiom on the publish
spine is the expected `sorryAx`.

### P2: Direct simplification and DRY opportunities

- The U1 leaf manually repeats the same four-label support/permutation cases.
  A generic finite-support permutation lemma around [U1LargeCapRouteBTail.lean:3715](../../lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean#L3715) should replace the branch enumeration.
- `interior1/2/3_card_ge_two` and `interior1/2/3_card_add_two` repeat the same
  proof shape in [U1OppositeCapLowerBounds.lean:107](../../lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean#L107), [line 193](../../lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean#L193), and [line 279](../../lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean#L279). An indexed/cyclic helper would remove most of this duplication.
- `SurplusCOMPGBankGeometry.lean` has right, left, and reflected theorem families
  despite already defining relabelling maps at [line 50](../../lean/Erdos9796Proof/P97/SurplusCOMPGBankGeometry.lean#L50) and [line 69](../../lean/Erdos9796Proof/P97/SurplusCOMPGBankGeometry.lean#L69). A generic relabel-transport theorem should replace the repeated bodies.
- `ErasedPinFixedSeedDFS.lean` and `ErasedPinOrderedProducer.lean` contain
  generated left/right row schemas and one corollary per row. The generator
  should emit a parameterized row schema and shared corollaries instead of
  duplicating the source surface.

### P2: Dead compatibility wrappers

The namespace beginning at [U1LargeCapRouteBTail.lean:6073](../../lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean#L6073) repeats three giant theorem statements as `simpa` wrappers. No references to this namespace were found elsewhere in the Lean tree. Remove it or move it into an explicitly named compatibility module if external consumers still require it.

### P2: Warning noise and unbounded proof settings

The cached root build passed 9,230 jobs but emitted 839 warning lines:

- 112 unused-variable warnings
- 57 flexible-tactic warnings
- 37 max-heartbeat justification warnings
- 83 long-line warnings
- 53 whitespace warnings
- 14 module-docstring warnings
- 5 declarations using `sorry`

The highest warning concentration was `N9Endpoint/N4e.lean`. The first cleanup
pass should address unused variables, flexible `simp`, and undocumented
heartbeat overrides. Examples of simplification candidates include
`N4d/SmallSReductions.lean:1508` and `N9Endpoint/N4e.lean:494`; use `simp only`
or explicit intermediate statements where the linter suggests them.

### P3: Oversized modules

Several hand-written modules are difficult to review and expensive to rebuild:

| File | Lines | Bytes |
|---|---:|---:|
| `SurplusCOMPGBankGeometry.lean` | 16,385 | 726 KB |
| `SurplusM44Packet.lean` | 12,018 | 535 KB |
| `RemovableVertexAxiom/Base.lean` | 10,108 | 466 KB |
| `N9Endpoint/N4e.lean` | 9,214 | 448 KB |
| `U1LargeCapRouteBTail.lean` | 6,171 | 292 KB |

Split these by concept or route, keeping generated data in separate modules and
coordinators thin.

## Validation

- `LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof`: passed, 9,230 jobs, warm/cached build.
- `LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.P97.MultiCenter.GeneralN`: passed, 744 jobs.
- `LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.P97.ErasedPinOrderedProducer`: passed, 5 jobs.
- `proof-blueprint axioms Problem97.erdos97_rhs`: reports `sorryAx` as the only unapproved custom axiom; `Lean.trustCompiler` is the declared certificate trust boundary.
- No exact duplicate hand-written files were found after excluding generated certificate directories.

## Recommended Order

1. Correct the proof-blueprint anchor and synchronize README, live status, and closure-plan names.
2. Extract named U1 and residual producer/case lemmas so the real proof surface is auditable.
3. Add explicit build targets for active unimported branches and keep multi-megabyte generated files out of Git.
4. Factor the orientation, indexed-cap, and finite-permutation lemmas.
5. Narrow mining skips and reduce warning noise before larger certificate rebuilds.
