# Duplicate-center equality-closure cuts

The QF Boolean CEGAR driver now checks every outer SAT witness for a dynamic
edge-equality obstruction before connectivity and metric checks.

For each positive row pair `member[c,x] ∧ member[c,y]`, the checker adds an
edge-equality link

```text
{c,x} = {c,y}
```

where braces mean that distance edges are unordered. It computes the
transitive closure of these links and searches for distinct centers `a,b` and
distinct points `p,q,r` such that the four equalities

```text
ap = aq, ap = ar, bp = bq, bp = br
```

all have explicit paths through the closure graph. Each saved refinement
contains those four paths. Resume validates every primitive step and endpoint,
reconstructs the exact positive membership antecedents, and adds the nogood

```text
OR { NOT member[c,x] | (c,x) is used by a checked path }
```

The checker is intentionally model-side: it generates cuts only from positive
memberships in the returned outer witness. Up to 32 distinct cuts are retained
per witness by default; `--duplicate-center-cuts-per-witness` changes that
batch limit.

## Soundness and trust boundary

The mathematical certificate shape is the one proved in Lean by:

- `Problem97.Census554.EqualityCore.EdgeClosure.sound`
- `Problem97.Census554.EqualityCore.not_realizes_of_duplicateCenterCore`

The concrete 14-antecedent regression test matches the certificate in
`Problem97.Phase3DuplicateCenterA2B5P0Q1R6.not_realizes`.

This lane does **not** replay dynamically generated paths in the Lean kernel.
Path validation and clause construction are trusted Python encoder work.
Consequently, a final Z3 `UNSAT` remains bounded n=17 solver evidence without a
proof artifact; `UNKNOWN` remains no mathematical result. The checkpoint
schema is v2 so older checkpoints cannot be silently resumed under the new
refinement language.

The sibling CaDiCaL directory is still a one-shot base-CNF exporter. It does
not currently ingest these witness-dependent cuts, and existing CNF or solver
artifacts are unchanged.
