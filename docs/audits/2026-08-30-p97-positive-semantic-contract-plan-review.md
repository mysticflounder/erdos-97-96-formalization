# P97 Positive Semantic Contract Plan Review — 2026-08-30

## Result

The review found six material gaps in the original implementation plan. All six
are valid after narrowing several overstatements, and the accepted remedies are
now integrated into the canonical
[implementation plan](../plans/p97-positive-semantic-contract-implementation-plan-2026-08-30.md).

The revised implementation work may proceed in its dependency order. No
positive-authority campaign or production pilot may proceed until the Phase 0
identity is frozen, the Phase 4 R1--R3 producers validate, and the Phase 6 v4
profile binds the checked Lean encoding, variable map, and total decoder.

Evidence classification: **EMPIRICALLY VERIFIED · INFRASTRUCTURE ONLY · SCOPED
TO THE FILES AND SYMBOLS NAMED BELOW**. This review does not establish a
source-level mathematical claim, theorem closure, or publishable proof state.

## Review boundary

The audit text initially appended to the plan named `b5126b10c` as its review
baseline. That label was stale. The review spanned materially dirty worktree
states observed at `c5b7259d`, the integration checkpoint
`beb71db498ad47cca5c343a76a359423ff47f9e2`, and the final read-only recheck at
`7f005b39322c42039ac854baa37ff5b89585e4ce` on `main`. Modified and untracked
Python, Lean, documentation, and generated-status files were present. This
document therefore records symbol- and file-scoped observations, not a claim
that any one clean commit reproduces the complete reviewed state.

The review covered the semantic-contract specifications, the v3 projected
static runner, the PIQD post-wave gate, semantic authority and decoder helpers,
the Card18 Lean bridge family, the Exact17 base route, Exact-12 ingress and
validators, and the live P97 consumer target.

## Validated gaps and accepted remedies

### G1. No contract-complete production profile

Partial typed Card18 bridges already exist:
`source_to_abstract_packet`, `valid_extends_to_model`, and
`model_decodes_to_valid` are present in
[Rigid221Card18AbstractPacket.lean](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18AbstractPacket.lean)
and
[Rigid221Card18ArmCnf.lean](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18ArmCnf.lean).
The repository nevertheless has no contract-complete runner profile that binds
the exact Lean CNF, variable map, total canonical decoder, and accepted
producer receipts. V3 is a global custody profile without that bridge.

Accepted remedy: build `projected-static-v4` beside, rather than in place of,
frozen v3. V4 must use DIMACS generated from the declared `armCnf a` export or
an independently checked byte-identical translation. All F1--F7, survivor,
terminal, and positive-authority criteria are measured on v4; v3 remains
diagnostic and custody-only.

### G2. Phase 0 cannot emit the authoritative v2 receipt

The governing
[v2 contract](../specs/p97-cegar-semantic-contract-v2.md) requires typed
producer references for source coverage, abstract encoding, and assignment
decoding. Those R1--R3 producers are Phase 4 outputs, so an authoritative v2
receipt cannot be the exit artifact of Phase 0 without changing the schema.

Accepted remedy: Phase 0 freezes a draft, non-authoritative contract-input
record. The verifier emits the first authoritative
`p97-cegar-semantic-contract/v2` receipt only after R1--R3 validate in Phase 4.
The plan does not introduce nullable producer slots into v2.

### G3. Invalid solver models need a first-class disposition

The four-way disposition in the semantic specification includes
`INVALID_ENCODING_MODEL`; the original plan listed only the three outcomes
available after successful replay and decode. The direct structural seam has
checks that reject some malformed models indirectly, but it does not provide a
single strict contract covering missing, duplicate, conflicting, out-of-range,
and non-total assignments before semantic assessment.

Accepted remedy: every solver-reported SAT result first receives strict
exactly-one-value validation for every formula variable, followed by formula
replay, canonical decode, and abstract-validity checks. Any failure emits
`INVALID_ENCODING_MODEL`, runs no semantic detector, and learns no clause.

### G4. Lean producer identity lacked a reproducible statement digest

The plan named Proof Blueprint as a publication check, but it did not define a
verifier-side mechanism that reproducibly computes the normalized Lean
statement and toolchain identity stored in a producer reference. At review
time, Proof Blueprint was not publish-clean: its status included stale indexed
state and uncommitted Lean sources. That observation is operational evidence
only, not a publish audit.

Accepted remedy: a pinned-toolchain exporter elaborates the qualified
declaration and serializes a versioned canonical representation of its type,
universes, constants, hypotheses, and imports. The producer reference hashes
that representation and the toolchain identity. Proof Blueprint separately
checks declaration reachability, proof spine, and approved axioms;
`verify-publish` is a publication gate, not the statement-digest generator.

PIQD's `piqd_checked` receipt remains custody evidence. The P97 verifier
rechecks the proof with its own closed checker registry.

### G5. Promotion-capable consumers could bypass authority

The v3 `verify_shard_coverage` path in
[phase3_structural_cegar_projected_static_v3.py](../../census/p97_search/phase3_structural_cegar_projected_static_v3.py)
tolerates an absent authority-gate reference in legacy states, and the current
[benchmark consumer](../../census/p97_search/benchmarks/phase3_cegar_benchmark.py)
does not consume semantic authority. That is compatible with custody and
benchmarking, but not with positive promotion.

Accepted remedy: inventory every terminal-, aggregate-, or theorem-promotion
consumer. Each v4 promotion-capable consumer must require and independently
validate the authority gate. Diagnostic consumers may remain ungated only when
their output schema cannot claim more than custody or finite-local status.
Legacy v3 support is optional compatibility, never a promotion route.

### G6. `decodeBase` is not the required total decoder

Lean's `decodeBase` in
[Rigid221Card18SearchBase.lean](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18SearchBase.lean)
takes a `baseWellFormed` proof argument. It is therefore not, as currently
typed, the required function from every complete semantic projection to an
abstract object. The existing `model_decodes_to_valid` result returns an
existential packet rather than the public canonical decode result.

Accepted remedy: expose a raw total decoder on every complete projection and
state validity separately. An alternative proof-carrying input domain would
change the public contract and therefore requires a successor schema, not a
silent reinterpretation. This Lean function must not be conflated with the
Python `Encoding.decode` or `decode_canonical` helpers.

## Additional corrections to the original audit text

- Exact17's missing terminal-adapter observation applies to the finite cap-nine
  base
  `extendedCnf` route in
  [BlockerVExactSeventeenSourceCnfCdefg.lean](../../lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefg.lean),
  not every Exact17 child route; other child routes have terminal adapters.
  Its exported CNF and validators are finite custody or empirical evidence,
  not universal or `erdos97_rhs` closure.
- Historical `p97-cegar-semantic-terminal/v1` remains unchanged.
  `p97-cegar-terminal-promotion/v2` is its explicit successor, not a retrofit
  or a nonexistent `terminal-promotion/v1` rename.
- Card18 is deliberately off-spine in
  [Rigid221Card18Aggregate.lean](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18Aggregate.lean).
  Promotion requires a named aggregate import and consumer reaching
  `Problem97.erdos97_rhs`; no unmeasured module-count claim is retained.
- Exact-12 validators pin multiple expected hashes across their separate
  modules. The transferable pattern is independent byte replay under a closed
  registry, not one universal `EXPECTED_CNF_SHA256` constant.
- The tiny complete control is explicitly off-spine.
- The original Lean command-timeout anecdote was unsupported and is omitted.

## Resulting plan changes

The canonical plan now:

1. separates the Phase 0 draft identity from the post-Phase-4 authoritative
   receipt;
2. defines the normalized Lean-statement exporter and its trust boundary;
3. requires a total canonical decoder and strict invalid-model handling;
4. adds a contract-aligned v4 production-profile phase beside frozen v3;
5. measures refinement, survivor, and terminal acceptance only on v4; and
6. makes authority-gate validation mandatory at every promotion-capable
   consumer, with adversarial tests for bypass and substitution.

The evidence review is complete. Remaining work is implementation and
verification under the plan's phase exit criteria.
