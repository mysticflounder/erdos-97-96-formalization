# Staged fifteen-relation replay

This directory is the resource fallback for the monolithic exact QQ replay.
It is scratch-only and does not change a production theorem or closure record.

## Current evidence

- The generator reconstructs all fifteen multiplier-generator products over
  `fractions.Fraction`, replays the pinned cancellation-greedy merge tree, and
  checks that its root is exactly the constant polynomial `1`.
- All leaf and internal-node support sizes match the pinned merge analysis.
- The tree height is `8`. Its peak support is `132499`, equal to the largest
  leaf support, so that peak is optimal among trees when leaves are included.
- `BankClean15StagedCertificate.lean` regenerates byte-for-byte under `--check`.
- Lean elaboration and kernel axiom output are **pending**. The external exact
  replay and generated source are not by themselves a kernel proof.

The generated Lean file has fourteen separate scalar relation lemmas. Each
certificate multiplier is introduced exactly once. A later lemma combines only
one or two previously established subtree relations, and the final scalar
consumer obtains `(1 : ℝ) = 0`. The existing normalization, coordinate mapping,
anchor-collision, and `False` adapters are then reproduced with the same theorem
statements in the staged namespace.

## Reproduce

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-bank-clean-staged \
  uv run python \
  scratch/atail-force/bank-clean-lean-certificate/staged/generate_staged_lean.py \
  --check
```

Fix the generator rather than hand-editing the generated Lean file.

## Deferred Lean check

Do not run this concurrently with another raw Lean process or top-level build in
the same project. Once the active monolithic check has ended, the intended
single-file validation is:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/bank-clean-lean-certificate/staged/BankClean15StagedCertificate.lean
```

Success still requires inspecting the two emitted `#print axioms` results and
rejecting `sorryAx` or any unapproved custom axiom.
