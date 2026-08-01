# Source-indexed common-blocker lane report

## Result

All four fixed common-blocker shells are **SAT** in the strengthened finite
projection.  Each returned assignment passed direct DIMACS evaluation, the
pre-existing independent Census-554/separation checks, an independent total
source-to-valuation decoder, pair capacity `<= 2`, triple capacity `<= 1`, and
the displayed `{6,7}` two-center saturation check.

| shell `(s,o)` | variables | clauses | CaDiCaL wall seconds | CNF SHA-256 |
|---|---:|---:|---:|---|
| `(2,0)` | 41,004 | 414,047 | 1.407 | `370e6e3f1f3cc77e1b08e0b823a15f92019c8142d0d8ce48bef97afaf5491a95` |
| `(2,9)` | 41,004 | 414,047 | 1.420 | `39770dc2822b7cab4ead996a2ffdcaa72584255c2c204dda7016c5bfec4508bf` |
| `(3,0)` | 41,004 | 414,047 | 1.369 | `92592d62e3c0a20ad105a035b272d15dd60412a13364d3b75178626fc7fafba2` |
| `(3,9)` | 41,004 | 414,047 | 1.374 | `1f4a2446173af16baae7fa9cb16ddc63df87481d834b6f00f2de34193731deb2` |

Runs were serial, one default single-threaded CaDiCaL process at a time, with
`-t 900` (well below the requested 1,800-second cap).  Exact command:

```bash
uv run python scratch/card11-exact5-common-source-indexed/self_test.py
uv run python scratch/card11-exact5-common-source-indexed/probe.py --timeout 900
```

The generated machine-readable record is [`summary.json`](summary.json); each
case preserves its exact `input.cnf`, transcript, source hashes, schema, and
independently checked model under `runs/`.

## Schema and mapping

For each source label `s`, `y[s,c,row]` is total and functional, entails the
selected Census row `x[c,row]`, and is present only when `s` belongs to that
four-element row.  Thus its decoded valuation records `(c, R)` and
`R \ {s}` of cardinality three.  In common shells, sources `6` and `7` are
forced to the displayed blocker `8`; the row at `8` contains both, and the row
at `1` contains both inside the named U5 support.  Imported C4 makes the pair
occur at no third selected center; imported C2 makes every triple occur at no
second selected center.

The source interface is the live
`CriticalShellSystem.shellAt`, `source_mem_selectedFourClass`, and
`selectedFourClass_support_eq_shell` declarations in
`U1CarrierInjection.lean`.  Full per-source mappings appear in each case's
[`model.json`](runs/s2_o0/model.json) under `source_to_valuation`.

## Self-tests and mutation rejection

The base source-indexed domain (without a shell) has 43,496 variables and
419,029 clauses and is SAT with an independently validated model.  A mutation
forces one source-index choice while selecting a different row at that chosen
center; it is UNSAT and its preserved DRAT proof is independently accepted by
`drat-trim` (`s VERIFIED`).  The mutated CNF has 43,496 variables and 419,031
clauses; the proof is 22,533 bytes.  This checks that the new `y -> x` linkage,
not merely the inherited common-blocker clauses, rejects the mutation.

## First missing mathematical constraint and promotion status

The first missing justified constraint is the universal deletion assertion
`CriticalShellSystem.no_qfree`: after deleting source `s`, **every** K4 witness
at the selected geometric center is absent.  The Census quotient has only one
selected exact-four row per labelled center, so it proves only that deleting
`s` leaves three points in that named row; it cannot exclude an unrepresented
same-radius class.  A source-to-valuation quotient/ingress theorem is also
needed to identify arbitrary geometric centers with these 11 labels.

Therefore this SAT result is **not promotable**.  It establishes feasibility of
the explicitly documented finite incidence shadow only; it is not a Lean proof,
does not close a `sorry`, and supplies no geometric counterexample.
