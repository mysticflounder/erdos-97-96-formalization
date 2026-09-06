# Exact13 semantic canonicalization focused validation

Lane: `exact13-semantic-canonicalization-20260906`
Base head: `2edd257558de796a0a45e8b8bda8cc99d172c0d2`

## Result

The new module
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SemanticCanonicalization.lean`
passes the focused Lean 4.27 check from the `lean/` project root:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SemanticCanonicalization.lean
```

The RawCover dependency was materialized first at its exact `.olean` and
`.ilean` paths.  The directly reported `FreshThirdCrossDeletionRows` import
was then materialized at its exact `.olean` and `.ilean` paths.  No aggregate
`lake build` was invoked and no existing imported source was edited.

The source scan found no `sorry`, `admit`, `unsafe`, `partial`, or
`native_decide` marker.  All three declarations in the new module have
docstrings, including the private radius helper.

The generated axiom probe checks both public declarations:

```text
selectedFourRow_on_erase_z_support_eq_third
not_four_survives_double_erase_of_mem_third
```

Both declarations report exactly:

```text
[propext, Classical.choice, Quot.sound]
```

This validates the focused source and its trust closure only.  It does not
claim aggregate-spine reachability or a terminal contradiction.
