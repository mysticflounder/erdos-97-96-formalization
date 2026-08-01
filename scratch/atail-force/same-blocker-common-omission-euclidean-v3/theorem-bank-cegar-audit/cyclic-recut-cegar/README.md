# Cyclic-recut five-point CEGAR audit

This owned scratch lane extends the sibling theorem-bank audit with the exact
direction-preserving recut theorem
`Problem97.FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows_cyclicShift`.

For each increasing CCW quintuple, the encoder generates all five cyclic
rotations and no reversal.  For a cyclic tuple `(a,b,c,d,e)`, it adds exactly

```text
not cyclicCCW(a,b,c,d,e)
or not m[d,a] or not m[d,c] or not m[d,e]
or not m[e,a] or not m[e,b].
```

Thus the positive antecedent stays grouped into the row at `d` containing
`a,c,e` and the row at `e` containing `a,b`; no negative membership or fixed
fourth row member is assumed.  The cut is sound only under the intended common
injective strict-CCW Euclidean realization of the existential order and rows.

## Checks and run

The self-check exhausts all 120 linear orders of five symbolic points.  It
rejects exactly the five positive cyclic rotations and permits the other 115,
including all reversed rotations.  It also recovers 13 cyclic target matches
(2 anchored) in the prior source witness.

Command:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/cyclic-recut-cegar/cyclic_recut_cegar.py --self-check --run --timeout-ms 300000 --max-iterations 500
```

Result: **SAT** in 5,887 ms.  Four connected candidates were checked; the first
three contributed 13, 17, and 2 fresh theorem cuts, respectively.  Total: 32
target matches seen, 32 theorem cuts, 0 connectivity cuts.  The fourth candidate
survived.

The independent solver-free replay checks all `C(17,5) = 6,188` increasing
quintuples and their 30,940 positive cyclic rotations.  It finds 0 anchored and
0 cyclic target matches.  A separate replay through the sibling general theorem
matcher agrees.

## Live outside-pair classification

In the surviving witness, `Q.source=s3`, `Q.otherOutsidePoint=t3`, the cap-source
row center is `bq=r2`, and the opposite blocker row center is `br=q1`.  Both
`s3` and `t3` are omitted from both live split rows, so both common-deletion
propositions happen to be true; the four-arm truth table is not exclusive in
this finite model.  This is distinct from the older selected five-center arm,
which deletes `p1` (`delete-P.source1`).

No target match survives.  Across the other audited five-point schemas, 21
cyclic matches survive; 10 use a live split row, but none uses either deleted
outside point positively at those rows.  None is forced by the common-deletion
branch: that branch supplies negative omissions, while these theorem-shape
antecedents use positive memberships.  They remain arbitrary SAT row choices
relative to the live branch.

## Trust boundary

This is `EMPIRICALLY VERIFIED`, exhaustive only for the stated finite Boolean/
incidence abstraction at `n=17`, profile `(6,8,6)`.  The SAT witness is replayed
against the existing finite constraints and independently against the target
shape.  SAT needs no UNSAT certificate.  Omitted are coordinates, QF_NRA
realizability, direct Euclidean injective/strict-CCW proof objects, MEC and
nonobtuse inequalities, full `CounterexampleData` geometry, reversal cuts, Lean
build/kernel checking, and a transitive axiom audit.  This is neither Lean
closure nor a universal-`n` result.

Artifacts are under `n17-profile-6-8-6/`; `result.json` and `iterations.jsonl`
record the run, `witness.json` the survivor, and both `independent-*.json` files
record the independent replays.
