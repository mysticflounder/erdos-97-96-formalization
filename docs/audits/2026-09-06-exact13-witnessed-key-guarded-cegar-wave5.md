# Exact13 witnessed-Key guarded CEGAR wave5

Lane: `exact13-witnessed-key-guarded-cegar-wave5-20260906`
Base: `ba3806303ddfd3b9a23e885367baa440e07427f8`
Claim status: formula-scoped solver discovery only; no Lean closure or promotion claim.

## Contract and imported frontier

Wave5 preserved the corrected guarded root byte-for-byte:

- 432 variables, 31,283 clauses, 1,815 guarded clauses;
- root SHA-256: `238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f`;
- immutable wave4 final bank: 36,000 rows, SHA-256
  `2c1607d847dcb1417a067419b3494d285d52cc2bd98337099993bbb3d19a3e90`.

All 36,000 imported cuts were independently reconstructed from their source
certificate, parent model, raw PIQD solve, provider atoms, clause, and zero
projection. The mixed historical semantics were preserved: the first 6,000
parents were replayed against the 29,468-clause historical root, with 4,431
outside `StrongValid` and 1,569 satisfying `StrongValid`; the remaining 30,000
imported parents satisfied the corrected guarded root and `StrongValid`. The
historical parent status is not used as a cut-soundness antecedent.

## PIQD session and terminal

Session: `fca0e4c1-4d09-462b-99b8-729b9eda6104`
Solver: `piqd-satworker-cadical-3.0.1`
Solver SHA-256: `d2cb8bd4440f2fae71d9d03373dd471b185aec26b5b5f3488f1fbed701c16736`
Session created: `2026-09-06T21:03:02Z`
Session closed: `2026-09-06T22:11:53Z`
Final solve timestamp: `2026-09-06T22:08:42Z`

The configured authorization was `wall_seconds=3600.0`, with 120,000 ms per
solve and 20,000 additional cuts. The producer's authenticated
`wall_elapsed_seconds` is `4132.518`, exceeding the configured bound by
532.518 seconds. This overrun is recorded explicitly; no wall extension or
solver restart was issued. Because the producer checks the deadline at the top
of each solve loop and this report field may include import and terminal work,
the evidence does not prove strict solve-loop or total-wall compliance; no
strict total-wall compliance claim is made. The terminal is therefore reported honestly as
`REFINEMENT_BUDGET` with final solve status `SAT`, not `UNSAT`.

Final counts:

- 56,000 total cuts: 50,123 one-form and 5,877 two-form;
- 20,001 PIQD solves, all `SAT` with models recorded;
- 20,001 new models independently replayed as guarded-root valid,
  `Key.Valid`, `GlobalOneBoundaryValid`, and `StrongValid`;
- no uncancellable survivor and no terminal UNSAT.

## Authenticated artifacts

- final cut bank: `ed2bf13c87c5969be1b3ff45711a37fd7fc2346dfb1402122549141088f74f11`;
- PIQD exported journal: `4b44d503d310894c4d901ee04238426321b8a93e079cb652f2a7a38c65d7ed61`;
- expected deterministic journal: `47d9eec34b43b8005b0d8c9b3e6d47a01c4d73c7f96d8130cbf06c4f0941abbe`;
- PIQD receipts: `6f3d40f916cf7c47e7927bc79df98c2a3ba8666b759e77bd4da5919ec7138fef`;
- PIQD custody: `bb7d55da174adbb5c5ac70cdf0ceb2bbd6cbfaa914979f88da510ac99820ee00`;
- close receipt: `e645b65619cd21a333b57a68222a29733e79d5ad0bd9e09a762f03852a0780d6`.

The 20,001 receipts were independently checked for sequential solve indices,
SAT status, empty assumptions, model recording, 120,000 ms timeout, monotone
timestamps, and session identity. Exported and expected journals matched after
the documented PIQD export normalization. The independent audit checked 112,009
sealed JSON records, all 56,000 bank-to-certificate links, and the run-manifest
self-hash.

Closeout repaired the lane checkpoint only: its run manifest had been listed in
both `owned_paths` and `durable_paths`, which the hygiene schema rejects. The
duplicate ownership entry was removed and the checkpoint self-hash was
recomputed. No generated-root file was rewritten.

## Validation boundary

The final result is a bounded formula census checkpoint. It carries no claim
that the guarded finite formula proves the P97 theorem or any Lean declaration.
The generated logs, models, certificates, and solver streams remain under the
wave5 generated run root and are not staged.
