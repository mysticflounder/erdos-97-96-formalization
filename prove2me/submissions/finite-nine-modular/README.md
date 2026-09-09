# Finite-nine modular publication packet

This lane turns the preserved 1.36 MB finite-nine submission into a concrete
nine-cut publication packet. It is not upload-ready yet: the exact source split,
candidate child statements, dependency order, and tiny root reduction now exist, while
public-definition extraction and child proof elaboration remain.

The generator authenticates the two retained live snapshots, splits the larger
failed solution into all 87 original `Batch3N9` module units, and cross-checks the
42 N9 source modules against both the Lean 4.33.1 migration tree and the current
project tree. Thirty-three modules are byte-identical. Nine have later source
edits, but all 13 semantic target declaration headers are unchanged, and the
top-level `Closure.lean` bytes are identical.

## Concrete outputs

- `source-inventory.json` binds every N9 module unit to preserved-stream and
  source-file hashes.
- `cuts.json` records nine public theorem cuts and their leaf-first dependency
  order.
- `source-fragments/` contains the exact preserved proof material assigned to
  each cut. The four largest fragments are 555,787, 306,175, 176,077, and
  171,986 bytes, as recorded in `cuts.json`. No fragment contains `sorry`,
  native reduction, `unsafe`, `implemented_by`, or `extern` markers.
- `platform/Theorems/` contains the nine fixed candidate theorem stubs. They are
  statement stubs and therefore deliberately contain `sorry`; each is labelled
  `SKETCH — NOT PROMOTABLE`.
- `platform/Solutions/Sol_Erdos9796Mission_finite_nine_exclusion.lean` is the
  tiny candidate root reduction. It is visibly labelled `SKETCH — NOT
  PROMOTABLE`: it has no direct `sorry`, but imports nine sketch child nodes.
  Its proof term mirrors the endpoint assembly in `Problem97.FiniteN9Closure`;
  formal source-to-wrapper correspondence remains Stage-2 work.
- `extract_decl_graph.lean` is the read-only Lean kernel extractor for the next
  command-level dependency pass once `N9Endpoint.Closure.olean` is available.

The cut order is:

1. endpoint shell;
2. Form `b` exclusion at `v₁`;
3. its early cyclic transport to `v₂`;
4. Form `a` exclusion at `v₁`;
5. Form `c` exclusion at `v₁`;
6. the remaining cyclic transports;
7. N4 cap containment;
8. N6/N7 common-radius circle placement;
9. N8 single-apex exhaustion.

This order breaks the real Form-A/Form-B dependency: the Form-A proof consumes
the transported Form-B-at-`v₂` result, so Form B and that one transport must be
public first.

## Validation performed

```bash
uv run python submissions/finite-nine-modular/generate.py --check
```

The command reports `PASS_WITH_RESIDUALS`, 87 sequential unit envelopes, nine
cuts, 42 source-module cross-checks, and 13 unchanged target statements. The
generated root has no direct `sorry`; this is not a transitive closure check.
`validation.json` and `cuts.json` bind the output hashes.

The Lean 4.33.1 migration sources are untracked files in that workspace. Their
per-file hashes are authenticated in `source-inventory.json`, but the recorded
workspace HEAD does not reproduce them by itself. The current tracked project
tree supplies the independently hashed cross-check; promotion still requires a
durable source-custody record for the migration copy or a clean rebuild from the
tracked tree.

## Exact residual work

1. Run Stage-2 skeleton subtraction and the supplied kernel graph extractor to
   replace the documentation-only interface candidate with public definition
   bundles. The necessary names are fixed in
   `platform/Definitions/Def_Erdos9796FiniteNine_Interface.lean`.
2. Rewrite each authenticated source fragment against the public definitions
   and earlier child theorem imports, producing one no-`sorry` solution per cut.
3. Elaborate the child solutions leaf-first under Lean 4.33.1 and audit
   `#print axioms` on every child and the final root. The accepted closure is
   exactly `{propext, Classical.choice, Quot.sound}`; native/compiler trust is
   out of scope.
4. Run the generic uploader in no-network dry-run mode, then obtain independent
   promotion verification before any network submission.

No network calls, uploads, commits, or server mutations were made by this lane.
