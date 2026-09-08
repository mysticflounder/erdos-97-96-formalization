# Counting milestone transfer

This packet transfers the proved milestone
`Erdos9796Mission.counterexample_card_ge_nine`: every nonempty finite
convex-independent planar set with the four-equidistant property has at least
nine points.

The dependency closure contains 17 definition bundles and 75 theorem nodes.
Each theorem has a generated platform stub and an exact-source proof body. The
root is adapted to the already-published mission statement: its explicit set
binder and mission-local aliases are definitionally equal to the generated
solution type.

The mathematical route follows Adrian Dumitrescu's 2006 isosceles-count
argument in *On Distinct Distances from a Vertex of a Convex Polygon*. The
source associates its cap-witness refinements with the 2013 paper of Gabriel
Nivasch, János Pach, Rom Pinchasi, and Shira Zerbib. The Lean declarations and
proofs are this project's own formalization; the citations record provenance
and do not identify imported machine-checked paper proofs. See
`attribution-audit.md` and the theorem-level metadata for the attribution
boundary.

## Local validation

- The 75 solution roots build in a clean Lean 4.33.1 workspace containing no
  original project modules.
- Seventy-four supporting theorem types match the migration source exactly.
- The root solution type is definitionally equal to the existing mission
  theorem type.
- All 75 source theorem closures use only `propext`, `Classical.choice`, and
  `Quot.sound`.
- Generated definitions and solutions contain no `sorry`.

`validation.json` binds these checks to every generated file hash. The retained
build, type-comparison, and axiom-audit logs live in the lane's registered
`scratch/runs/prove2me-counting-transfer-20260907/run-0001/` tree.

## Reproduce

```bash
uv run python submissions/counting-transfer/generate.py --check
uv run python submissions/counting-transfer/generate.py --generate
uv run python submissions/counting-transfer/upload.py --dry-run
```

The uploader makes no network calls unless `--execute` is supplied. Execute
mode also requires an immutable artifact commit, refreshes authentication,
uploads leaves first, records asynchronous IDs before polling, and resumes from
`receipt.json`.

