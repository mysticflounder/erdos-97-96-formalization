# Fixed-witness Euclidean realization audit

## Verdict

`UNKNOWN` (`timeout`).  The single target Z3 4.16.0 QF_NRA check used a
nominal 300,000 ms solver timeout and returned after 340,620 ms (340.81 s wall
time).  A timeout is the absence of a verdict; it is not evidence for SAT or
UNSAT.  No second expensive solver or optimizer was run.

The input is the replay-`PASS` witness at
`../incidence-audit/n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-full-shared-pair-separation/witness.json`,
SHA-256 `412e9cb06936661e5e9d59ff436e4de16684f240a43359a135ec3d85727dfe60`.

## Why the previous model was not reused unchanged

`../model.py` has useful coordinate, squared-distance, orientation, and Z3
machinery, but it does not load this witness.  It branches over 597,196,800
synthetic geometric cases, encodes only one exact common row plus three apex
classes, and adds MEC/non-obtuse assumptions not present in the fixed
incidence artifact.  Reusing it unchanged would both omit 16 selected rows and
strengthen the query with unrelated assumptions.

`fixed_witness_qf_nra.py` instead constructs one formula for exactly the saved
cyclic branch.

## Encoded assumptions

- One shared pair of real coordinates for all 17 named carrier points.
- The orientation-preserving similarity gauge `a1=(0,0)`, `a2=(1,0)`.
- Positive orientation of all 680 increasing triples in the reported cyclic
  order.  This encodes the specified CCW strict-convex boundary order, point
  distinctness, and no three collinear carrier points.
- Three spanning squared-distance equalities for each of all 17 selected
  four-point Boolean rows: 51 equalities.
- At the nine centers in the image of the witness's blocker map, replay says
  the selected row is the complete radius class of its critical source.  The
  formula therefore has 108 complementary radius disequalities.
- At `a1`, the selected row and the reported p/r/q exact classes partition all
  16 targets.  Nine additional within-class equalities and six representative
  cross-class disequalities encode that exact partition.

Total: 858 asserted constraints, including four gauge equations.

The two-circle-overlap and equal-pair-bisector-center projections are not
separate assumptions: any actual Euclidean coordinates satisfying this
formula satisfy those Euclidean incidence consequences automatically.

## Omitted assumptions and scope boundary

- The saved JSON does not contain the full Boolean `eq[c,x,y]` truth table.
  Unreported radius-equivalence classes away from selected rows therefore
  cannot be matched or negated faithfully from this artifact.
- The Boolean no-other-K4-after-source-deletion condition quantifies over
  those unreported classes, so it is not encoded.
- MEC and non-obtuse-apex assumptions are omitted because they were not part
  of the fixed incidence witness supplied to this audit.
- The full `CounterexampleData.noM44` surface and arbitrary-cardinality
  reduction are omitted.

Thus even a future `SAT` answer to this exact formula would realize the saved
cyclic order, all selected rows, and all reportable exact classes, but not the
entire hidden Boolean equivalence assignment.  The present `UNKNOWN` answer
settles nothing in either direction.

This is external solver evidence only.  No Lean command, build, proof-blueprint
gate, axiom audit, or kernel verification was run, and this audit does not
claim Lean closure.

## Artifacts and commands

- `fixed_witness_qf_nra.py`: audited fixed-witness encoder, structural gate,
  tiny known-SAT/known-UNSAT solver smoke test, target solver driver, and SMT2
  emitter.
- `self-check.json`: solver-free input and exact-class validation.
- `formula.smt2`: exact target formula, including `(check-sat)`.
- `result.json`: target status, counts, assumptions ledger, and trust boundary.
- `solver.log`: complete bounded-run stdout and `/usr/bin/time` footer.

```bash
uv run --offline python fixed_witness_qf_nra.py --self-check
uv run --offline python fixed_witness_qf_nra.py --emit-smt2 --output formula.smt2
uv run --offline python fixed_witness_qf_nra.py --solve --timeout-ms 300000 --output result.json
```
