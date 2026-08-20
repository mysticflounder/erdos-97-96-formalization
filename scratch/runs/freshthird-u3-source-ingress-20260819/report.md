# FreshThird U3 source ingress — 2026-08-19

## Result

`lean/scratch/U3LeanSatSourceIngress.lean` is a compiling Lean adapter from
the live `SixSurvivorU3ExactRadiusAuditObstruction` to a finite carrier
indexed by `Fin D.A.card`.

The adapter has two source-preserving output records:

* `U3FiniteEscapePacket`, for the q-deleted row; it retains the actual
  escaping point and its non-membership in the bounded support.
* `U3FiniteCriticalShellPacket`, for the critical-shell row; it does not
  invent an escaping point.

The tagged source theorem is
`SixSurvivorU3ExactRadiusAuditObstruction.toFiniteIngress`.

## What is carried into the finite boundary

The point map is the canonical `Fin D.A.card → ℝ²` enumeration supplied by
`Finset.equivFinOfCardEq`.  The exported finite sets are image-indexed from
the source `Finset`s, with proved cardinality and membership transport:

* the four-point dangerous circle `{q,t1,t2,t3}`;
* the exact-radius class around the audit center, with cardinality three;
* the eight-point bounded support;
* the selected four-row or full critical shell;
* row intersection with the dangerous circle, bounded by two;
* row points outside the dangerous circle, with cardinality at least two.

The q-deleted constructor also carries the escaping point in the row and
outside the bounded support.  The critical-shell constructor carries the
source fact that `q` lies in the shell.

The helper lemmas `indexSet_card`, `mem_indexSet_iff`, and the intersection
and set-difference transport lemmas keep these facts tied to the source
carrier instead of accepting independently supplied finite tables.

## Validation

The source file was checked with:

```text
lake env lean scratch/U3LeanSatSourceIngress.lean
```

Exit code was 0.  The final log at
`run-0001/artifacts/compile-final.log` contained warnings only (three linter
warnings); there were no Lean errors and no `sorry` declarations in this
adapter.

Source SHA-256:

```text
f4289a051044e019109d721e0b62f2926440a660dead22020141101f6fa8df06
```

## Scope and next target

This is an ingress contract, not a universal closure and not a SAT result.
The serializer target is now implemented in
`scratch/runs/freshthird-u3-serializer-20260819/packet_to_lean_sat_ir.py`.
For the validated q-deleted packet it records the packet SHA, arm, and the
SHA-256 of this compiling ingress source in
`scratch/runs/freshthird-u3-cegar-packet-20260819/run-0001/artifacts/validated-u3-ir-source-bound.json`.
The focused serializer tests and combined packet tests pass.  This still does
not supply the Lean replay theorem or universal coverage theorem required for
promoting a piqd UNSAT result, and the current packet is SAT finite evidence.
