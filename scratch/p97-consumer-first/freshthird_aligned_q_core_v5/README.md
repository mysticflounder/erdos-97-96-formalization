# FreshThird aligned Q/core v5 diagnostic

Scratch-only bounded diagnostic. It does not modify production Lean, consume a
theorem as a universal producer, or establish a contradiction.

The v5 wrapper reuses the v3 finite source controls and adds:

- unconditional synchronization of the two core x-shell supports, and
  likewise of the y-shell supports;
- membership of both P endpoints in every x-shell and both Pρ endpoints in
  every y-shell;
- unconditional ≤2 support intersections between every synchronized apex
  shell and each source exact row, by the kernel-checked critical-shell
  two-circle theorem;
- the same unconditional ≤2 intersection between the canonical Q row and each
  synchronized apex shell;
- equal exact source rows in the equal-blocker branch, otherwise source-row
  overlap ≤2.

The shell identities and all row/apex/Q-apex bounds are sourced from the
kernel-checked scratch theorem
`FreshThirdAlignedCoreGeometry.fixedDeletionCore_exactRetainedShells_and_rowBounds`.
Only the source-row equal-blocker/distinct-blocker relation remains
mode-specific.

The campaign runs both blocker modes for all 12 v3 structural arms (24 arm
queries), plus smoke and clause-specific negative controls, with Z3 and cvc5.
