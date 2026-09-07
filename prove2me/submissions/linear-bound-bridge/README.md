# Original conditional P97-to-P96 bridge milestone

**Status: server ACCEPTED; original milestone completed.**

[View the verified bridge](https://prove2.me/theorems/d76e105d-be12-48ae-8965-782674afd985). Proof submission: `babc821b-786f-4c21-8fea-e237eb0030e7`.

Target: `Erdos9796Mission.linear_bound_of_problem97`, theorem ID `d76e105d-be12-48ae-8965-782674afd985`.

This packet transfers the original conditional bridge milestone. Its proof retains `Problem97` as an explicit hypothesis and proves both the per-set bound on unordered unit-distance pairs and the asymptotic supremum statement. It does not discharge the separate Problem97 or Problem96 mission targets.

## Proof provenance and contract

The source argument is `lean/Erdos9796Proof/P96/EuclideanPeeling.lean` (peeling a low-unit-degree vertex and induction) and `lean/Erdos9796Proof/P96/UpstreamBridge.lean` (supremum and Big-O). Convex-independence preservation follows `P97/ConvexIndepHelpers.lean`. The source uses an ordered-pair count divided by two; the mission definition uses the symmetric square. The port proves the deletion inequality directly for the mission's unordered count, using `Finset.sym2_insert`, `Finset.card_union_le`, and `Finset.card_image_le`. No mathematical claim is weakened.

The reuse preflight inspected those source declarations and searched the indexed Lean corpora for symmetric-square filtered-cardinality transport. The first missing adapter was the count representation. Direct deletion on `sym2` removes that adapter from this proof. No migration files or source definitions are changed.

The server definition is byte-identical to `prove2me/Definitions/Def_Erdos9796Mission.lean`. The only submitted import is that published definition; the proof imports no open theorem and no target placeholder. The intended consumer is the existing bridge milestone. The closure measure is one Open original milestone becoming Proved, subject to successful server verification. No new proof obligations or axioms are introduced.

## Validation and publication

The target environment is Lean 4.33.1 with Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`. Local verification uses a deliberate single-file check in the existing Prove2Me workspace, with the server definition embedded and the independently fetched target type applied to `solution`. The source project and running migration are not built or modified. Exact commands, source hashes, axiom output, independent readback, and publication results are recorded in `validation.json` and `receipt.json`.

## Next original milestone

The counting transfer requires extracting and porting its reachable project declarations. A read-only `.ilean` reference inventory found 318 source declarations across 37 local modules; this is a planning estimate, not a fresh kernel dependency certificate. Counting and its six direct modules have migration `.olean` artifacts, but their freshness and axiom closure must be checked before reuse. Nine-point exclusion still lacks most direct migration artifacts. Use the platform declaration-graph and sketch-position extractors before generating either larger packet.
