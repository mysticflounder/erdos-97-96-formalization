# Microsharded exact certificate replay

This directory contains a scratch-only, parser-bounded fallback for the exact
fifteen-relation QQ certificate.  It preserves the staged cancellation tree and
the two geometry-consumer statements, but moves every expanded cofactor and
every expanded internal relation polynomial into small reducible definitions.

## Current status

- The generator independently reconstructs all fifteen multiplier-generator
  products with `fractions.Fraction`, replays the pinned fourteen-node merge
  tree, checks every support, and requires the root to be exactly `1`.
- Generation is byte-stable under `--check`.
- The generated Lean source contains no `sorry`, `admit`, `native_decide`, or
  `axiom` declaration.
- The exact statements of `bank_clean15_anchor_collision` and
  `false_of_bank_clean15_rows` are byte-for-byte the same as in the staged
  replay (apart from their enclosing namespace).
- The first v1 Lean attempt reached the header progress marker, then exposed a
  native stack overflow in its first flat, left-associated 96 KB polynomial
  definition.  V2 balanced that definition, but Lean still overflowed while
  elaborating its 1,532 overloaded arithmetic atoms.  V3 therefore imposes
  independent hard bounds of 192 atoms and 16 KB on every polynomial leaf,
  and at most 32 references on every level of a multilevel aggregate.
- V3 also removes the final 120,709-term-plus-120,709-term `ring` call.  The
  two terminal branches are split at identical monomial boundaries; 911 local
  part-pair lemmas and 30 bounded aggregate-pair lemmas establish their sum is
  exactly `1`, after which the root theorem uses only opaque equalities.
- `SimpPayloadSmoke.lean` kernel-checks the recursive generated-simp
  normalizer shape used to keep the earlier weighted-relation commands small.
- The two public theorem-statement hashes match the staged replay:
  `b3c07a7a95835661fa5dbb2962895c2b8263343a8be9140ca9f03a0fccdd47b7`
  for `bank_clean15_anchor_collision` and
  `fabe12ef234afa51810935465609df7cb1e2384f11654655137a933ae8f2cca1`
  for `false_of_bank_clean15_rows`.
- A V3 Lean run and the emitted `#print axioms` audits are **pending**.  Exact
  external replay plus deterministic source generation is not yet a kernel
  proof.

The current manifest records:

- `170938417` output bytes;
- `12108` top-level Lean commands;
- `10734` payload definition parts;
- a largest complete command of `16100` bytes, below the generator's hard
  `16384`-byte ceiling;
- a largest theorem command of `6610` bytes;
- at most `192` signed monomial atoms and tree depth `8` in a part;
- at most `32` children in any aggregate declaration and at most two
  aggregate levels;
- `941` terminal-pair proof commands, each with at most `32` child facts; and
- `33` progress markers.

The generated Lean SHA256 is
`e28f9734e91113173f2f0a4dbea0c954397713d6824286252c9dba05f1e2c657`.

## Proof shape

For each leaf first encountered by the pinned merge tree, its certificate
cofactor is split by both atom count and rendered byte size into definitions
such as `cofactor9Part0`.  Signed monomial atoms inside every part form a
balanced binary addition tree.  Bounded aggregate definitions such as
`cofactor9AggL0Part0` combine no more than 32 parts, and a final balanced
`cofactor9Value` combines those aggregates.  Each exact internal relation
polynomial is split the same way.  Thus neither polynomial leaves nor
aggregate commands have unbounded syntax width or linear parser depth.

The fourteen `weightedRelationN` theorems retain the staged proof structure.  A
theorem consumes only its direct internal-child relation(s) and the newly
introduced leaf relation(s).  Every generated payload definition is a
one-directional simp rule, so a theorem's `linear_combination` command names
only the relevant family aggregates and recursively unfolds their bounded
descendants:

```lean
linear_combination
  (norm := (simp [relevant family aggregates]; ring))
  ...
```

The explicit generated simp rules are essential: the default normalizer does
not unfold reducible coefficient definitions.  They also avoid a 50.8 KB
explicit definition-name list in `weightedRelation26`; no emitted command now
exceeds 16,100 bytes.  At the terminal merge, aligned part-pair lemmas each
unfold only two bounded leaves.  Their bounded aggregate lemmas treat the
already-certified child pairs opaquely.  Consequently
`weightedRelation28` derives `1 = 0` from the two branch equalities and the
final pair lemma without expanding either branch.  `normalized_bankClean15_scalar`
then converts that equality to `False`.  The coordinate,
normalization-similarity, anchor-collision, and final `False` adapters reproduce
the staged geometry interface.

This removes the two observed native-stack failure shapes and the known giant
terminal normalization.  It does not make the first thirteen relation steps
free: each still normalizes its target against at most two direct children.
Their tactic commands are now source-bounded, but their reflected polynomial
work remains the main risk to measure in the next Lean run.  This source is not
kernel checked yet.

## Reproduce

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-bank-clean-micro \
  uv run python \
  scratch/atail-force/bank-clean-lean-certificate/microsharded/generate_microsharded_lean.py \
  --check
```

The generator pins the certificate, merge analysis, fifteen-core record, raw
identity, source-polynomial identity, and staged-helper generator hashes.  Fix
emission defects in the generator; do not edit the 171 MB Lean file manually.

## Deferred Lean validation

Do not start this while another Lean process or top-level build is active in the
same project.  Once the current checks have ended, the intended deliberate
single-file validation is:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/bank-clean-lean-certificate/microsharded/BankClean15MicroshardedCertificate.lean
```

The emitted progress messages distinguish payload parsing from each relation's
normalization.  A successful process still requires inspecting both final
`#print axioms` outputs and rejecting `sorryAx` or any unapproved custom axiom.
