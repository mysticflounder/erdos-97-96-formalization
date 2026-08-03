# V11 row-difference rank-three postmortem

Date: 2026-08-02

Target:
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.

## Scope and authentication

The diagnostic replayed the 16 completed Boolean formulas under
`artifacts-v11/20260802T093313.097282Z-retry-pid99343`.  These are the same
formulas authenticated by `V11-FULL-SHELL-STRUCTURAL-CENSUS.md`:

- v11 invocation SHA-256:
  `2a7af78eac6f2949b2ce9dc4d5808fffd6b87d3af1cb3ab9118cfb28ed76d4b5`;
- compressed-formula manifest SHA-256:
  `59b894b28e6de256f40d2d9279d1d55ab4a3a9cb19a418eacd257d6cb0578a5f`;
- decompressed-formula manifest SHA-256:
  `54f3f8c4e97817593e984fe1ef208c76f511773d7f9023d49de3d9b0df076999`;
- diagnostic script SHA-256:
  `c08998e28fe52bb5a9a5e18f4e85d38b831038fdee5865e29716a74b463cded6`.

This is a first-model diagnostic, not an exhaustive Boolean-model census and
not a Lean proof.

## Result

Running `uv run python diagnose_v11_row_difference.py` from this directory
gave:

- 16 cases replayed;
- 0 rank-three row-difference pattern certificates;
- 0 candidate chains checked in every case;
- 5.72 seconds elapsed.

Thus the proposed `rank <= 3` row-difference determinant lane does not merely
fail at the final unique-matching test on these models: the licensed full-shell
incidence data never supplies the prerequisite four-row chain.  Broadening the
same zero-pattern search is therefore not justified without a new producer for
additional actual full shells or their memberships.

## Theorem-bank follow-up

The mandatory post-round Lean-bank search found no reusable general theorem
that converts the available common-deletion rows into the missing four-row
chain, Hall deficiency, positive cross-incidence, support confinement, or cap
bound.  The nearest source-clean theorem is
`Problem97.Census554.CirclePowerMatrix.false_of_powerMatrix_unique_possible_matching`,
but it requires five actual full carrier circle classes.  The current packet
rows are selected four-subsets after deletion, so their omitted points are not
certified nonmembers of the ambient circles.

The first missing bridge for this lane remains: derive five actual canonical
full shells, together with enough membership and nonmembership facts to make a
unique possible perfect matching.
