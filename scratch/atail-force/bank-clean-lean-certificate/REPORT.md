# Bank-clean corrected-shadow Lean certificate

## Status

This lane isolates the canonical bank-clean corrected shadow from
`robust-all-center-marco/bank_cegar_checkpoint.json` and proves its metric
equalities inconsistent over `Real` by an explicit rational unit certificate.

- Canonical source replay: **checked** (`analyze.py --check`).
- Fifteen-equality core: **exact UNIT**, crosschecked by Singular and msolve in
  both generator orders, and deletion-minimal within the audited core.
- Rational certificate: **exactly verified** twice, first by Groebner.jl's
  change-matrix check and then by an independent streaming Python `Fraction`
  replay of `sum c_i * g_i = 1`.
- All fifteen geometry-to-coordinate-polynomial maps: **Lean compiled** in
  `../bank-clean-metric-audit/BankClean15MappingSmoke.lean`.
- Fine generated Lean replay: **kernel compiled**.  The 504-module
  `compact-fallback/LambdaKxFine` manifest is 504/504 PASS with zero failures.
  `LambdaKxFine.Terminal` and every geometry-facing wrapper through
  `BankCleanFifteenCollisionCore.lean` compile source-clean and print exactly
  `[propext, Classical.choice, Quot.sound]`; none inherits `sorryAx`.

The certificate closes one corrected bank-clean shadow consumer.  By itself it
does not close K-A-PAIR, A-TAIL, or the remaining production `sorry`s.

## Fine-replay closeout and production cost

The successful replay is recorded by the union of
`compact-fallback/LambdaKxFineBuild/state-*.json`, including the final tail
states `state-g11-final-audit.json` and `state-certificate-final-audit.json`.
The generated tree has:

- 504 Lean modules and 141 algebra nodes;
- 95,044 source lines and 49,996,100 source bytes;
- 6,885,254,248 logical `.olean` bytes (about 6.41 GiB), occupying about
  5.4 GiB on the current filesystem;
- 15,971.421 seconds in the conservative distinct-module PASS sum (for a
  multiply compiled module, taking the largest successful recorded wall time);
- a 384.703-second largest module (`N118FamilyPart00`); and
- a 9,462,896 KiB largest recorded process-tree RSS
  (`N136MergePart00`, about 9.025 GiB).

The seven hand-written bridge/wrapper modules from `LambdaGenericAdapter`
through `BankCleanFifteenCollisionCore` add 1,099 source lines, 44,104 source
bytes, and 8,946,728 `.olean` bytes.  Fresh focused compiles took approximately
2, 22, 5, 29, 30, 50, and 29 seconds respectively; the terminal itself took
66.5 seconds after its generated dependencies were present.

The first fresh compile of `BankCleanFifteenCollisionCore.lean` exposed a
proof-script parsing bug: a fully qualified declaration name was split after a
trailing dot.  Joining the name fixed the error; the repaired module then
compiled with only the three standard axioms above.  This was a wrapper bug,
not a defect in the algebra certificate.

The kernel result is therefore complete, but this exact generated tree is not
an acceptable production import as written.  Productionization requires a
materially smaller checked payload or another import-cost reduction.  No full
Lake build or production-source integration is claimed by this scratch gate.

## Pinned artifacts

- Canonical lane checkpoint:
  `checkpoint.json`, SHA-256
  `75e7a39f3bf474c2e8dcdcd869419cdf083b5066305c5c0e4b85af575a17115a`.
- Canonical source checkpoint SHA-256:
  `b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9`.
- Fifteen-core role-polynomial SHA-256:
  `b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf`.
- Exact QQ certificate:
  `unit_certificate_groebner_jl_15.json`, SHA-256
  `afb111002531a20ca1301afe6d05d8e0184f08183c4b2a7c0acaa0b69d834935`.
- Certificate identity SHA-256:
  `dfbd38fb29cd9feceee945b68339c2a64723573db95219a20d030630c37a6c14`.
- Generated direct Lean source:
  `../bank-clean-metric-audit/BankClean15ExplicitCertificate.lean`, SHA-256
  `b7856cc05312b86d0caac71b0ae222318e8d8d0fab8f61207b334d2681ef28ba`.
- Corrected definition-sharded Lean source:
  `def-sharded/BankClean15DefShardedCertificate.lean`, SHA-256
  `10f41004553bc179e0abcd98e3464a6f931765bd1b9536197a6e31b7ad47b386`.
- Corrected hardened microsharded Lean source:
  `microsharded/BankClean15MicroshardedCertificate.lean`, SHA-256
  `fd22db9f4b6388a8cf8e882d5618118cbd2ea4d7889479eea66c6a8f6c11d89f`.
- Exact merge analysis:
  `../bank-clean-unit-independent-audit/unit_certificate_groebner_jl_15_merge_analysis.json`,
  SHA-256
  `936540291da3f1c1fc2b4bc0e355af50660a4d7eac4ce0ef9e1e1a5217569a37`.

The QQ certificate has 15 nonzero multipliers, 275,588 multiplier terms, 14
active coordinate variables, and maximum multiplier degree 8.

## Geometry-facing statements

The generated source exports, in namespace
`Problem97.ATailBankClean15Explicit`:

- `bank_clean15_anchor_collision`: the fifteen equal-distance rows force
  `O = A`;
- `false_of_bank_clean15_rows`: the same rows together with `O != A` imply
  `False`.

The proof normalizes `O` and `A` to `(0,0)` and `(1,0)` with `normSim`, derives
the fifteen pinned coordinate polynomials from squared distance equalities,
and replays the explicit identity with `linear_combination`.

## Existing-bank preflight

The required theorem-bank registries and indexed Lean corpus were searched
before deriving a new consumer.  `match_existing.py` finds neither a distinct-
role nor aliased-role embedding into the existing production six-row or
scratch seven-row anchor-collision consumers.  The old U1 equality closure is
also missing two terminal rows for this pattern.  The new consumer is therefore
not a direct restatement of an already-reachable theorem.

## Direct and fallback replay

The direct 25-, 17-, and 15-equality `grobner` attempts exhausted the 16 GiB
Lean limit.  Singular rational and modular cofactor-lift attempts also timed
out.  Groebner.jl's modular F4 change-matrix computation over `QQ` produced the
exact certificate used here.

If the monolithic 30 MiB Lean source cannot elaborate within the resource
limit, `staged/` contains a deterministic fallback.  It uses a height-8
cancellation-greedy merge tree and 14 intermediate scalar lemmas.  Its peak
expanded support is 132,499 terms, equal to the largest leaf support and hence
optimal among merge trees when leaves are counted.  The staged source is much
larger (about 156 MiB), so it is a fallback rather than the first choice.

The first sharded experiments identified source-shape rather than algebraic
failures.  Flat 30 MiB tactic and 156 MiB theorem-header commands remained in
parser/header elaboration; 96 KiB left-associated definitions overflowed the
native stack; balanced 96 KiB definitions still exceeded the elaborator's
native-stack limit; and the first 16 KiB microsharded run exposed missing
`noncomputable section` declarations for rational functions over `Real`.
The next run then confirmed successful definition elaboration but exposed an
expected unused-binder warning for each sparse helper; the generators now
disable only `linter.unusedVariables` to avoid a 10,000-definition diagnostic
storm.  Those defects are corrected at generator level.  The hardened microsharded
source now has 192-atom and 16,000-byte polynomial-body limits, a 16,100-byte
maximum command, bounded multilevel aggregates, and a paired terminal
cancellation which never unfolds both 120,709-term branches together.  Both
corrected emitters pass exact rational replay, byte-stable `--check`, Python
compilation, and prohibited-token scans.  A focused Lean smoke confirms the
generated `noncomputable section` permits rational `Real` helper definitions.

## Reproduction and trust gates

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/bank-clean-lean-certificate/analyze.py --check

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/bank-clean-lean-certificate/match_existing.py
```

From `lean/`, the two current decisive scratch compiles are:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/bank-clean-lean-certificate/def-sharded/BankClean15DefShardedCertificate.lean

lake env lean -M 16384 \
  ../scratch/atail-force/bank-clean-lean-certificate/microsharded/BankClean15MicroshardedCertificate.lean
```

The emitter pins the fifteen-core polynomial hash, certificate file hash, and
streaming-verifier hash.  It requires byte-stable regeneration, the internal
Groebner.jl exact change-matrix check, and the independent exact Python replay
before emitting Lean.  Static scans find no `sorry`, `admit`, `native_decide`,
or axiom declaration in the generated sources.

No production source or shared closure document is modified by this lane.
