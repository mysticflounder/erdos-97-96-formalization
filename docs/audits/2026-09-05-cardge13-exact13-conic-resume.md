# Exact-13 conic-cut resume audit (2026-09-05)

## Scope

This lane extends the exact-13 seed loader to accept the authenticated direct
cut record emitted by the positive-cone producer, then performs one replayed
Boolean solve for catalog cell `direct-z08-k09-10`.  It is a formula-level
transition between two decoded models, not a source-coverage or theorem claim.

## Source and manifest checks

The loader accepts a solve-level `cut` only when no iteration array is present;
all existing iterative and batched formats retain their previous validation.
Seventeen focused loader/coarse-cell tests passed and Ruff passed.

- Lane base: `d9277829cd73cff80d4b2c16f4a001758d5ad142`
- Run manifest self-hash:
  `88aba7100fb151f2d3818579e7cea5cc437535db029e57b539f28e4f150b177f`
- Run manifest file SHA-256:
  `6aca7c49fc56cf0f7758fba5cb313296beaa7613126b2ce98f7564bfd3a2a20d`
- Source conic event file SHA-256:
  `60f2f15ee347e7b9d759fe858f1d8622d9c23afa3a212f465ce87b07684fcffe`

The run manifest pins all eight predecessor events and the five Boolean-resume
source modules.  Its `base_head` matches the lane checkpoint.

## PIQD result

The Boolean journal contains 64,424 commands and 14,896 distinct seed cuts.
PIQD ran one assumption-free Z3 4.17.0 solve.  The returned SAT model replayed
successfully and the session closed normally.

- Event self-hash:
  `826dc767999a5d73855cd74aafc2c8fccabd0af419409dbc86e08b258c706786`
- Event file SHA-256:
  `c04594d844603f9a7935c9f6b4f337f01bd3655f3be853b0f15ae24b0cc1c5fd`
- Journal SHA-256:
  `035f0b42dc37ba72b013a561268d4663ae13dbbfdb9bfbe7d9542009ff7fbe84`
- Solve result SHA-256:
  `e60c6a462b45ee3305b2365b85c469771e8fb8d9f9c97b30185a5493946995f0`

The next model exposes a new eight-atom `transitive-incidence-path` conflict
for strict form `[11,4,5,0,0]`.  Thus the preceding weighted clause excluded
its intended model, but the cell remains SAT at this abstraction.

## Next refinement

The first cone query included zero projected forms, so its normalized model
selected the outstanding one-form conflict with weight one.  Repeating that
query on this model would only rediscover the new ordinary conflict.  The next
cone query should remove zero projected vectors before solving.  Any resulting
positive dependence then contains at least two strict forms and can expose
unequal-weight or larger-support cancellation data not covered by the ordinary
one-form learner.
