# Exact source snapshot for the cap-cyclic wave

The wave manifest hashed a concurrently modified source file.  Its `UNKNOWN`
verdict is fail-closed, but commit `7b8ef9f4` by itself does not reproduce the
exact source bytes.  The adjacent binary Git patch freezes the missing delta.

- base commit: `7b8ef9f4`
- source path:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`
- expected reconstructed source SHA-256:
  `5854ec4c373a17cb59c800025d4902f5bfa4b3b871deb97545073fee76d3da01`
- patch: `TwoSourceFreshThirdResidual.lean.patch`
- patch SHA-256:
  `dff2071e48bd7814dd4459e00b044706f71a83b2fed24e2110862585b307d9b7`
- patch byte count: `6620`

To reproduce the source snapshot, check out the base commit in a disposable
worktree, apply the patch with `git apply`, and verify the reconstructed source
hash above.  The patch is provenance only; it is not a promoted source change
or theorem claim.
