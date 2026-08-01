# Global equality closure / duplicate-center report

Run date: 2026-07-30.

## Terminal result

All four corrected v3 cases are **SAT**.  Thus the new theorem-backed
duplicate-center restriction rejects every persisted v2 model but does not
close any of the four finite target cases: CaDiCaL found different,
duplicate-free valuations.

| case | variables | clauses | seconds | CNF SHA-256 | model SHA-256 |
|---|---:|---:|---:|---|---|
| `s2_o0` | 43,087 | 589,878 | 1.564 | `949ceaf6d0e70a555b17a3dec4f1e4938d7c1a9af366dcd09d1994bd8fccd6fe` | `a02ef2c5a8c18d96bdfa0c7f5d211263d4cae2a9b87ecdda39c1241edcfc8f86` |
| `s2_o9` | 43,087 | 589,878 | 1.330 | `3651143a8394a10cbeb484c85f2903fc57ea169d76ed6a4d491bcff3f293d0d9` | `8af30655900541b9e7d5d1c0b4a9f3d34cef09994db4a44352cf4e2400eda25a` |
| `s3_o0` | 43,087 | 589,878 | 1.556 | `16201aeaf3bfdbeb101bd324d1dcdfde8faa5d4b3a9d49761bca38e425296c7d` | `f2fdf89b043e5819d164ac0ca1cf45c19d9ff2cdcecc7335635b81c4d82295df` |
| `s3_o9` | 43,087 | 589,878 | 1.338 | `9d6052e9ed9b88af952ca5d9b8dace80b2628c6b1ecca48e228b6d194906eba3` | `cbef5bb1c57a1e6a2fca4009ecaa0d2aeeafd6577c37e22e37fa3d98f41835ca` |

The jobs used `-t 1800` serially.  Maximum solver concurrency was one, below
the two-core ceiling.  Every `model.json` is a complete assignment to all
43,087 variables and agrees exactly with the raw CaDiCaL output.

Aggregate artifact hashes:

- `summary.json`: `9afefb889557101c26cbba83f9045fe6283c9c977e3397c915b4662235f4b2eb`
- `v2-model-rejection.json`: `82d3f3473744828edcdf3c8842a34382d50cc7d81b9e20c594007245fbc1b67d`
- `self-test-artifacts/summary.json`: `3b324359cd221dd111517dc9b145513b90f3e435a0cedf28a2b663104fdd22c6`

Per-case manifests, raw solver output, provenance, and verification hashes are
preserved under `runs/`.

## Exact v3 delta

The v2 prefix is preserved literally: 41,602 variables and 494,849 clauses.
`audit_v2_models.py` compares the persisted clause bodies and confirms exact
prefix identity in all four cases.

V3 adds 1,485 variables and 95,029 clauses:

| block | count |
|---|---:|
| global unordered-edge equality variables | 1,485 |
| global equality transitivity | 78,705 |
| selected-row global equality seeds | 11,694 |
| exact-five first-apex global equality seeds | 10 |
| duplicate-center core exclusions | 4,620 |

There are `C(55,2)=1,485` canonical equality variables for the 55 unordered
nonloop edges on 11 labels.  Reflexivity is implicit, symmetry is canonical,
and all three implications for each of `C(55,3)` edge triples give
`3*C(55,3)=78,705` transitivity clauses.

Every selected four-row seeds its six internal equalities.  Across all
candidate selectors this contributes 11,694 guarded clauses.  The named
exact-five shell contributes ten unit seeds.  No v2 local equality variable
is copied into the global relation, so optional equalities in arbitrary local
partitions cannot create a false obstruction.

For `p<q<r` and `a<b` outside `{p,q,r}`, the exclusion is

```text
¬G(ap,aq) ∨ ¬G(ap,ar) ∨ ¬G(bp,bq) ∨ ¬G(bp,br).
```

There are `C(11,3)*C(8,2)=165*28=4,620` such clauses.  Centers belonging to
the triple are omitted because they would require equality to a loop edge;
the native closure leaves those loop roots isolated and the SAT surface
contains only positive, nonloop distance edges.

The equivalence-extension encoding is exact for satisfiability.  Every
equivalence extension contains the least equivalence closure of the seeds, so
a duplicate in the least closure violates every extension.  Conversely, if
the least closure has no duplicate, choosing that closure satisfies the
global layer.

No all-row support/outside exactness was added.  V2's theorem-gated blocker
exactness and source-specific `no_qfree` blocks remain unchanged.  No
`K4_delete` or Corollary D9 logic is duplicated.

## Rejection of the four old v2 models

The independent audit reconstructs the least global closure from each
persisted v2 model.  Its first explicit duplicate witness is:

| v2 case | triple `(p,q,r)` | centers `(a,b)` | total witnesses |
|---|---|---|---:|
| `s2_o0` | `(0,5,8)` | `(6,10)` | 7 |
| `s2_o9` | `(0,1,2)` | `(7,8)` | 95 |
| `s3_o0` | `(0,1,2)` | `(3,10)` | 156 |
| `s3_o9` | `(0,1,2)` | `(4,6)` | 20 |

For example, `s2_o0` has the direct row-55 equalities at center 6
`d(6,0)=d(6,5)=d(6,8)` and closure paths at center 10 giving
`d(10,0)=d(10,5)=d(10,8)`.  The latter `0→8` path crosses the selected
rows at centers `10,9,0,6,8`.  The JSON audit records every edge in all four
paths, the responsible row index and support, the exact-five seed when used,
the old model hash, and all prefix hashes.

## Independent verification and mutations

`verify_artifact.py` does not import the encoder.  In addition to the complete
v2 semantic audit, it:

- checks that the 1,485 global variable IDs form the exact final contiguous
  surface with no aliases;
- regenerates and compares, in order, every global transitivity, row-seed,
  exact-five-seed, and duplicate-center clause;
- exhaustively checks global transitivity in a SAT assignment;
- independently rebuilds the least seeded closure with union-find;
- checks both the least closure and the assigned equivalence extension for
  duplicate-center witnesses; and
- checks every DIMACS clause, model completeness, solver/model identity, and
  all persisted hashes.

Each target verification reports 66 active selected-row seeds, ten
exact-five seeds, a duplicate-free least closure, and a duplicate-free
assigned extension.  Structural regeneration confirms the exact counts
78,705, 11,694, 10, and 4,620.

The self-test suite passes the inherited v2 controls and adds:

- a forced nontransitive global edge relation, rejected as UNSAT with a
  `drat-trim`-verified proof;
- a forced duplicate core `(p,q,r)=(0,1,2)`, `(a,b)=(3,4)`, rejected as
  UNSAT with a `drat-trim`-verified proof;
- the identical forced core with only the duplicate block disabled, SAT with
  every clause checked and the exact semantic witness recovered; and
- a one-literal mutation of an expected duplicate clause, rejected by the
  independent structural checker.

The two new mutation-proof SHA-256 hashes are respectively
`805b5b0e64686e44e517a5e84aa6245c69c490bf1e99d410af32ede3c44c3e32`
and
`c5adfa9ad26e314ebf2daa83d9b0a933c70c19a4b2c670af925fd6d72a41d053`.

## Theorem scope and trust boundary

The geometric obstruction is the one formalized by:

- `EqualityCore.DuplicateCenterCore`
  (`EqualityCore.lean:160-173`);
- `EqualityCore.not_realizes_of_duplicateCenterCore`
  (`EqualityCore.lean:176-211`);
- executable `duplicateCenterCore`
  (`CapSelectedNativeClassifier.lean:206-213`); and
- `duplicateCenterCore_sound`
  (`CapSelectedNativeClosureSound.lean:514-564`).

The source proof reduces the core to
`Problem97.not_dist_eq_three_of_ne`: two distinct points cannot both be
equidistant from three pairwise-distinct points.

Scope matters.  `duplicateCenterCore_sound` literally certifies the native
closure generated by selected rows.  V3 additionally seeds the proved
exact-five shell.  For paths using that extra seed, necessity follows from
the shell's actual distance equalities, transitivity of equality, and the
same `not_dist_eq_three_of_ne` geometric lemma; it is not literally a direct
application of `duplicateCenterCore_sound`.  An explicit Lean bridge from
this augmented closure/CNF to distance equality was not added in this round.

The inspected declaration files have no source `sorry` or `axiom`, but no
fresh Lean build or transitive axiom audit was run, as required.  No Lean file
was edited and no project signal was sent.

For SAT, the Python verifier establishes only a model of the exact finite
abstraction.  It does not establish Euclidean coordinates, triangle
inequalities, or geometric realizability.  The theorem-backed ingress from
an arbitrary geometric residual to the fixed Census-554 candidate table,
boundary selectors, source/blocker valuation, and four displayed shell cases
also remains outside these artifacts.  Consequently this is a terminal
finite SAT result, not kernel closure of the Lean residual.
