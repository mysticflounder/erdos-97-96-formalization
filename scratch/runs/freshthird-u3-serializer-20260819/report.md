# FreshThird U3 packet-to-LeanSatIr serializer — 2026-08-19

## Status

This tranche implements the next exact target after the Lean source ingress:
a validated finite packet can be serialized into a source-arm-aware LeanSatIr
formula with pinned function tables and an explicit replay/coverage contract.
It is an adapter and audit artifact, not a proof of either universal source
arm and not a closed FreshThird leaf.

## Implemented contract

`packet_to_lean_sat_ir.py` accepts
`freshthird-u3-finite-packet/v1` packets with carrier index domain `0..n-1`.
It checks:

- eight distinct frame roles and a source row containing `x`;
- dangerous support exactly `{q,t1,t2,t3}`;
- exact radius exactly `{t1,t2,t3}`;
- bounded support containing all eight frame roles;
- row cardinality four, dangerous intersection at most two, and at least two
  row points outside dangerous;
- `qDeleted`: `q` is omitted, `z` is in the row, and `z` is outside bounded;
- `criticalShell`: `q` is in the row and no `z` table is introduced.

The output pins every zero-argument role function and every `S3`, `S4`, and
`S8` table entry to the packet. The formula also replays the finite selector
constraints and the no-three-point dangerous-row overlap condition. Its
`source` object records the arm, canonical packet SHA-256, packet fields,
common checks, and arm-specific checks. This is the coverage contract for a
later decoded model: the model must reproduce the packet hash and the listed
checks before it can be treated as a source-ingress replay.

## Validation

The five-test suite passes:

```text
uv run --no-sync python -m pytest -q scratch/runs/freshthird-u3-serializer-20260819/test_packet_to_lean_sat_ir.py
5 passed in 0.19s
```

Both arm fixtures serialize and pass piqd's encoder preparation without an
error. The `qDeleted` preparation has 14 functions and a 6,145,988-byte
encoded body. The `criticalShell` preparation has 13 functions and a
6,125,638-byte encoded body. No solver job was queued in this tranche;
`piqc prepare` only checked the IR and stored a prepared body.

## Source boundary

The fixture packets are deliberately small synthetic finite packets for
round-trip testing. The Lean ingress currently exposes an existential finite
packet type; it does not yet export a concrete JSON value. Therefore this
serializer does not claim that either fixture was extracted from a universal
Lean witness. The next source-faithful target is a concrete packet exporter or
an exact packet supplied by a validated CEGAR result, followed by a piqd run
whose decoded model is checked against the recorded packet hash and arm.

## Durable artifacts

- `run-0001/artifacts/qdeleted-packet.json`
- `run-0001/artifacts/qdeleted-ir.json`
- `run-0001/artifacts/piqc-prepare.json`
- `run-0001/artifacts/critical-shell-packet.json`
- `run-0001/artifacts/critical-shell-ir.json`
- `run-0001/artifacts/critical-shell-piqc-prepare.json`

All generated artifacts and source digests are recorded in the run manifest.
