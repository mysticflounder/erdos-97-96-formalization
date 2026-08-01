# Perpendicular-bisector-core v4 report

Run date: 2026-07-30.

## Terminal result

All four v4 cases are **SAT**. The new theorem-backed clause family rejects
every persisted v3 model, but CaDiCaL finds different valuations that avoid
the obstruction.

| case | variables | clauses | seconds | CNF SHA-256 | model SHA-256 |
|---|---:|---:|---:|---|---|
| `s2_o0` | 43,087 | 594,498 | 3.513 | `f59175a2fd0873982cc691299023b92fda40f4080fee4e523d02c4d33d5ab82c` | `689fb7b707fbf11cfb26aa0fb480919b5fda73601e1265ca1e906be4a9331a62` |
| `s2_o9` | 43,087 | 594,498 | 4.035 | `aa6ca89c01526969e845c33d09f80d0fad99774e22684876d39e019b557698a0` | `00e83553bb7bd506fd719ffe35ad59a316eb04ce5e02d769f868ac69bb19dfee` |
| `s3_o0` | 43,087 | 594,498 | 2.562 | `a55de9aa688cf9ea03d87e66197f100dd47a61b35cdebb0cfe48c28c6fbd12aa` | `e7e8ef9d904117cef058cfa7746d2eafb6836e19143e4333e8217279469031ab` |
| `s3_o9` | 43,087 | 594,498 | 1.729 | `9e4f07dd4b633a2753d59a34f8b4b4d0578a9470a3e54e5607cb036c2bff17bd` | `47dd09a40f285a8fc18fc2d17670ca1fae0304b7bdf71ae478fe4a90b2577fe5` |

The jobs used `-t 1800` serially. Maximum solver concurrency was one, below
the two-core ceiling. Every complete model was checked clause-by-clause by the
independent verifier, which does not import the encoder.

Aggregate artifact hashes:

- `summary.json`: `0bc0f485f2e974c5f94bb26fbb88baa0e67381478b46a5a217805a57c98f5dd7`
- `v3-model-rejection.json`: `1906a7957edbda62b78ebdc81575363ad5cdddcb6a1cdcd26dbb5f2bbaf8c2bb`
- `self-test-artifacts/summary.json`: `552face886b05a215dc8f6660af561862cb6b16f4dc6f34424ec1bbda8d533f1`

Per-case manifests, raw solver output, models, source provenance, and all
verification hashes are preserved under `runs/`.

## Exact v4 delta

The v3 production instance is a literal prefix:

| layer | variables | clauses |
|---|---:|---:|
| exact v3 prefix | 43,087 | 589,878 |
| v4 perpendicular-bisector delta | 0 | 4,620 |
| v4 total | 43,087 | 594,498 |

For every focus pair `a<b` and `p<q<r` outside `{a,b}`, the appended clause is

```text
¬G({p,a},{p,b}) ∨ ¬G({q,a},{q,b}) ∨ ¬G({r,a},{r,b}).
```

There are exactly
`C(11,2) * C(9,3) = 55 * 84 = 4,620` such clauses. They form the final
production block, beginning at clause 589,879. The independent verifier
regenerates them in order, checks the zero-variable suffix boundary, and
confirms the unchanged v3 prefix. V4 adds no `K4_delete` or Corollary D9
logic.

The inherited global-equality surface still has:

| block | count |
|---|---:|
| canonical global equality variables | 1,485 |
| global transitivity clauses | 78,705 |
| guarded selected-row equality seeds | 11,694 |
| exact-five first-apex equality seeds | 10 |
| duplicate-center exclusions | 4,620 |
| new perpendicular-bisector exclusions | 4,620 |

Only selected-row equalities and the proved exact-U5 shell equalities seed the
least closure. No equality is imported from unconstrained local partitions.

## Rejection of all four v3 models

`audit_v3_models.py` independently reads the persisted v3 models, reconstructs
the least closure from the permitted seeds, verifies the exact v3 clause
prefix, and enumerates forbidden cores.

| v3 case | first least-closure witness `(a,b; p,q,r)` | least witnesses | assigned-extension witnesses |
|---|---|---:|---:|
| `s2_o0` | `(1,9; 2,6,10)` | 3 | 6 |
| `s2_o9` | `(0,5; 4,7,8)` | 3 | 10 |
| `s3_o0` | `(1,8; 6,7,10)` | 3 | 11 |
| `s3_o9` | `(3,9; 0,1,4)` | 1 | 5 |

The JSON records a seed-by-seed equality path for every displayed point. It
also records first witnesses in the complete assigned v3 extensions:
`(1,9;2,6,10)`, `(0,4;3,5,9)`, `(0,5;3,4,9)`, and `(0,2;1,3,7)`.

There are selected-row-only witnesses for `s2_o0`, `s2_o9`, and `s3_o0`.
The sole least-closure witness for `s3_o9` uses the exact-U5 seed
`d(1,3)=d(1,9)`. This distinction is material to the Lean soundness boundary
below.

## Independent verification and mutation controls

`verify_artifact.py` independently:

- checks the exact v3 prefix and regenerates every v4 clause in order;
- verifies the 1,485-variable global equality surface and all 78,705
  transitivity clauses;
- reconstructs the least seeded closure;
- checks both the least closure and the assigned extension for duplicate-center
  and perpendicular-bisector witnesses;
- verifies all DIMACS clauses, model completeness, solver/model identity, and
  persisted hashes.

The inherited adversarial suite passes. V4 adds three specific controls:

- forcing focus `(0,1)` and points `(2,3,4)` to form a perpendicular-bisector
  core is UNSAT, with exact DRAT independently accepted by `drat-trim`;
- disabling only the new block on the otherwise identical instance is SAT,
  every clause is checked, and the expected semantic witness is recovered;
- changing one literal of the first expected v4 clause is rejected by the
  structural verifier.

The forced-core CNF SHA-256 is
`2d245fa0bb9b2f1ff07cf773838b07d90e4d324562755ca3f5d88c3adba2a4f6`;
its independently checked DRAT SHA-256 is
`7dd815f0e7da2446a82dd8f4191594a4b3abd302c3cd9a69a2ddc290c4c70541`.
The disabled-block SAT control CNF SHA-256 is
`01f1c07def2b7e3ff2a0271f42be7759e9f0c1d7d0337d9ec9d608167e753491`.

## Theorem scope and trust boundary

The inspected Lean declarations are:

- `EqualityCore.PerpBisectorCore`
  (`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean:215-227`);
- `EqualityCore.false_of_convexIndep_of_perpBisectorCore`
  (`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean:231-279`);
- executable `perpendicularBisectorCore`
  (`lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClassifier.lean:220-224`); and
- `perpendicularBisectorCore_sound`
  (`lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClosureSound.lean:568-613`).

The geometric theorem directly rules out three distinct carrier points lying
on the perpendicular bisector of a distinct focus pair, when the corresponding
distance equalities are available.

The executable soundness theorem literally covers
`normalizedRoots (equalityClosure (centers.map (rowOfPattern P)))`: closure
generated by selected rows. V4's SAT layer also seeds the proved exact-U5
shell. Consequently, selected-row-only witnesses are directly within the
native theorem's closure scope, while paths using exact-U5 require an explicit
augmented-closure soundness bridge or direct production of the three distance
equalities before they count as Lean proof progress. In particular, the
displayed `s3_o9` least witness is not by itself certified by
`perpendicularBisectorCore_sound`.

The inspected source files contain no source `sorry` or `axiom`, but this run
made no Lean edits, ran no Lean build or transitive axiom audit, and sent no
project signal, as required.

For SAT, the artifact establishes only complete models of the exact finite
CNFs. It does not establish Euclidean coordinates, geometric realizability,
or the theorem-backed adapter from an arbitrary geometric residual to the
fixed Census-554 candidate table, boundary indexing, source/blocker valuation,
and four shell cases. The result is therefore terminal SAT for this finite
abstraction, not kernel closure of the Lean residual.
