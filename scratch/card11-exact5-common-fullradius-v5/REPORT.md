# Convex-five-point-core v5 report

Run date: 2026-07-30.

## Terminal result

All four v5 cases are **SAT**. The new theorem-backed clause family rejects
every persisted v4 model, but CaDiCaL finds different valuations that avoid
the obstruction.

| case | variables | clauses | seconds | CNF SHA-256 | model SHA-256 |
|---|---:|---:|---:|---|---|
| `s2_o0` | 43,087 | 927,138 | 2.266 | `d1ed28c3877ec90a8e9eadebc24caac6fa65a9ed25c6a30728c38c80f326bd91` | `215da98007ac0e9764d9a0cd796bcfed7821c3cca261e4639fabcc9d97acb6f3` |
| `s2_o9` | 43,087 | 927,138 | 3.972 | `5dda84a639c0289d98aeb59c5dd7b4fc96417552d10ccf6d68db1ee93c3ca9ed` | `15dc81842b3782b49547d0e12ac239559bed7e2374cab9cfafc2c95de046dd82` |
| `s3_o0` | 43,087 | 927,138 | 3.955 | `8bb203ecdcc3bae6306e72626b77d8627351c6ff532fa975173b8421a53171f7` | `b9182adba6efb8546c6d65a3d1bbdf646faadf8aef9cacb30acb720818e7e895` |
| `s3_o9` | 43,087 | 927,138 | 6.949 | `c90656becd8c8eb4e2f03125bcdc518b2e0cf8cbcb193c0b0fece40ce52e0351` | `2692c169eac0b9839f0af7a75e27aa969edb46222962496bd02d24a32ce46b6b` |

The jobs used `-t 1800` serially. Maximum solver concurrency was one, below
the two-core ceiling. Every complete model was independently checked
clause-by-clause; the verifier does not import the encoder.

Aggregate artifact hashes:

- `summary.json`: `a5d610bdad8f9a7669b7b627224680da39a8d007ce43b592f9007527c1710681`
- `v4-model-rejection.json`: `0d6783cacdbdd58b2611600faa4b8dd50bc5065901390952e8eddfacff9670a2`
- `self-test-artifacts/summary.json`: `16600ea6d51056d144f9ad4b368a39c9b79fb1788f4f46bc1d328acb1ce80a62`

Per-case manifests, raw solver output, models, source provenance, and
verification hashes are under `runs/`.

## Exact v5 delta

| layer | variables | clauses |
|---|---:|---:|
| exact v4 prefix | 43,087 | 594,498 |
| v5 convex-five-point delta | 0 | 332,640 |
| v5 total | 43,087 | 927,138 |

For each boundary-order selector `Oπ` and every five distinct labels occurring
forward-cyclically as `(a,x,b,c,y)`, the appended clause is

```text
¬Oπ
∨ ¬G({x,a},{x,b})
∨ ¬G({y,a},{y,b})
∨ ¬G({c,b},{c,x})
∨ ¬G({c,b},{c,y}).
```

There are 72 direct and 72 mirror selectors. Each order contributes
`11 * C(10,4) = 2,310` clauses, so the naive total is
`144 * 2,310 = 332,640`. Safe exact canonical-clause deduplication removes
zero clauses. The suffix begins at clause 594,499 and ends at 927,138.
The independent verifier regenerates every clause in order and confirms the
exact v4 prefix. V5 adds no `K4_delete` or Corollary D9 logic.

## Rejection of all four v4 models

`audit_v4_models.py` independently reads the persisted v4 models,
reconstructs the least global equality closure from the eleven selected rows
only, verifies the exact v4 clause prefix, and enumerates forbidden forward
cores.

| v4 case | selected order | first tuple `(a,x,b,c,y)` | least witnesses | assigned witnesses |
|---|---|---|---:|---:|
| `s2_o0` | mirror 61, selector 27894 | `(8,3,1,9,10)` | 3 | 3 |
| `s2_o9` | direct 57, selector 27818 | `(9,1,7,0,10)` | 2 | 3 |
| `s3_o0` | mirror 69, selector 27902 | `(7,2,10,0,8)` | 3 | 3 |
| `s3_o9` | direct 3, selector 27764 | `(0,3,4,5,7)` | 3 | 4 |

Every one of the four equalities in every displayed witness has a one-edge
path labelled by a selected row in the JSON audit. Exact-U5 contributes zero
seeds. Thus these particular model rejections do not depend on extending the
native selected-row closure with the exact-U5 seed.

## Independent verification and controls

`verify_artifact.py` independently:

- checks the exact v4 prefix and regenerates all 332,640 v5 clauses;
- confirms 144 order selectors, split 72 direct and 72 mirror;
- confirms 332,640 naive clauses, 332,640 retained clauses, and zero dedup;
- checks both the least seeded closure and assigned global extension for
  duplicate-center, perpendicular-bisector, and convex-five-point cores;
- checks DIMACS satisfaction, complete models, solver/model identity, and
  persisted hashes.

The inherited adversarial suite passes. V5 adds these controls:

- forcing the persisted `s2_o0` witness—mirror selector 27894 and tuple
  `(8,3,1,9,10)`—is UNSAT, with exact DRAT independently accepted by
  `drat-trim`;
- disabling only the v5 block on the otherwise identical formula is SAT,
  every clause is checked, and the semantic witness is recovered;
- changing one literal of the first v5 clause is rejected by the independent
  structural verifier.

The forced-witness CNF SHA-256 is
`de1d270f71a6a162625398b815b3ddb01694aee0e580291afb9e2f77b955c7ae`;
its DRAT SHA-256 is
`f6518f435abcb56cd5810da5b9122f3097ad4878135fe915f3bc525a0ff00576`.
The disabled-block SAT control CNF SHA-256 is
`5c0165ff47f55cc74132d5a07d019f24d253f77cbe86c8b645e5afa4965738c6`.

## Theorem scope and trust boundary

The source-censused declarations are:

- `ConvexFivePointCore.Core` and its four equality fields
  (`lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean:135`);
- `ConvexFivePointCore.false_of_core` and
  `ConvexFivePointCore.false_of_core_of_neg`
  (`ConvexFivePointCore.lean:151` and `:169`);
- the signed-area convention and complete order-branch derivation
  (`lean/Erdos9796Proof/P97/EndpointCertificate/OrderedCoreSigns.lean:66`
  and `:163`).

Under the live sign convention, increasing indices in either stored selector
order give the negative orientation. Therefore the forward tuple uses
`false_of_core_of_neg`; reversing it gives the positive orientation handled by
`false_of_core`. Both consumers rule out the same four equality atoms, so the
CNF clause is orientation-independent once guarded by its stored selector.

The theorem-backed forward clause still has live premises. A positive selector
must denote the actual strict-convex boundary order of the realized carrier,
and each positive `G` atom must denote genuine squared-distance equality.
The SAT layer itself treats `G` as an arbitrary equivalence extension. A
geometric source-to-valuation adapter must therefore choose the genuine
distance relation and correct boundary selector. The four old-model witnesses
avoid the separate exact-U5 closure concern because all equality paths are
direct selected-row seeds, but they do not supply this adapter.

The inspected Lean sources contain no source `sorry` or named `axiom`. This
run made no Lean edits, ran no Lean build or transitive axiom audit, and sent
no project signal. This is a source census plus finite-artifact result, not a
claim of kernel closure.

For SAT, the artifact establishes only complete models of the exact finite
CNFs. It does not establish Euclidean coordinates, realizability, or closure
of the live Lean residual.
