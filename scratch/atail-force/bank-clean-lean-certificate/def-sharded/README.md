# Definition-sharded exact certificate

This scratch candidate replays the pinned fifteen-relation rational unit
certificate with deterministic private polynomial chunks.  Every chunk and
every cofactor's chunk aggregate is emitted as a balanced binary addition tree,
so addition syntax depth grows logarithmically.  The generated scalar theorem
has target `False`; its only large normalization is explicitly scoped to

```lean
linear_combination
  (norm := (simp only [cofactor/chunk definitions]; ring))
  ...
```

The generator independently reconstructs every cofactor from signed terms,
replays the exact `QQ` identity, pins the certificate and core hashes, requires
every chunk declaration to be at most 200 KB, and requires every emitted command
block to be below 250 KB.  It also emits one `#check` progress marker after each
of the fifteen cofactor groups.

## Current validation

- Exact `QQ` identity replay: passed.
- Byte-stable `--check` regeneration: passed.
- Generated-source scan for `sorry`, `admit`, `native_decide`, and axiom
  declarations: clean.
- Maximum emitted command: 180,112 bytes.
- Generated Lean SHA256:
  `0dcc045b3341e1726e60be9afcf5e9251f9314bbf31d92683b1fe5aa7fcd9c5e`.
- Global heartbeat and recursion-depth overrides precede every generated chunk
  declaration, so chunk elaboration does not inherit Lean's default budget.
- Maximum generated addition-tree depth: 11.
- Full Lean elaboration and axiom output: pending.

A deliberately undersized 2 GiB syntax-smoke process exhausted memory while
loading the imported environment, before reporting a source diagnostic.  The
same private-definition normalizer pattern was previously compiled in
`../DefCoefficientSmoke.lean`.

## Commands

Regenerate or check determinism from the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/bank-clean-lean-certificate/def-sharded/generate_def_sharded_lean.py

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/bank-clean-lean-certificate/def-sharded/generate_def_sharded_lean.py \
  --check
```

When the other active Lean checks have released resources, run the deliberate
single-file validation from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/bank-clean-lean-certificate/def-sharded/BankClean15DefShardedCertificate.lean
```

Do not describe this as kernel checked unless that command exits successfully
and both emitted `#print axioms` reports are audited.
