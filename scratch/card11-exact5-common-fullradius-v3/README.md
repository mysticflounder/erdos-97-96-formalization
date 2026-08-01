# Card-11 exact-five common full-radius v3

This directory preserves v1 and v2 and starts from the verified v2 encoding
exactly.  For every target, the first 41,602 variables and 494,849 clauses are
the unchanged v2 instance.

V3 adds only the duplicate-center equality obstruction requested for this
round.  It introduces a global equivalence relation on the 55 unordered
nonloop carrier edges.  Its only seeds are:

- the six internal edge equalities forced by every selected Census row; and
- the ten equalities in the proved exact-five first-apex shell.

For every three distinct labels `p,q,r` and two distinct centers `a,b` outside
that triple, v3 forbids the global closure from putting each of
`{a,p},{a,q},{a,r}` in one class and each of
`{b,p},{b,q},{b,r}` in one class.  This is the finite equality pattern ruled
out geometrically by `EqualityCore.not_realizes_of_duplicateCenterCore`; the
row-generated executable detector and its soundness theorem are
`duplicateCenterCore` and `duplicateCenterCore_sound`.

The global relation is encoded as an arbitrary equivalence extension of the
seeds.  This is equisatisfiable with checking the least seeded closure: every
extension contains the least closure, and when that closure is
duplicate-free it is itself a valid extension.  No equality is imported from
the unconstrained parts of v2's local radius partitions, and v1's unsound
all-row exactness is not reintroduced.

Run:

```bash
uv run python scratch/card11-exact5-common-fullradius-v3/audit_v2_models.py
uv run python scratch/card11-exact5-common-fullradius-v3/self_test.py
uv run python scratch/card11-exact5-common-fullradius-v3/probe.py --timeout 1800
```

The four target cases run serially with one CaDiCaL process.  All four are
SAT, with complete models independently checked clause-by-clause and against
the reconstructed local and global semantics.  The four old v2 models are
nevertheless all rejected by the new obstruction; explicit closure witnesses
and seed paths are in `v2-model-rejection.json`.

SAT here does not establish Euclidean realizability or close a Lean theorem.
See `REPORT.md` for exact counts, hashes, witnesses, tests, theorem scope, and
the remaining trust boundary.
