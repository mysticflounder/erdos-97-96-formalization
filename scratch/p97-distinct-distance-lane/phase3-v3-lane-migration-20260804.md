# Phase-3 v3 lane migration — 2026-08-04

The first migration adapter is
`launch_phase3_projected_static_v3.py`.  It is a dry-run-by-default,
provenance-pinned fixed-shard launcher for the
`phase3_structural_cegar_projected_static_v3.py` successor.

The adapter deliberately passes `--no-bootstrap`: projected-static-v2 learned
streams are not schema-compatible with v3.  The authenticated v2
three-rhombus prefix bank is the explicit v3 ingress, pinned by its
`SHA256SUMS` root and source-journal prefix hash.  The warm prefix cache is
available only with the explicit `--use-prefix-cache` opt-in; source replay
remains authoritative at publication boundaries.

## First canary

The first bounded canary was launched at:

`phase3_projected_static_v3_migration_canary_20260804/shard-04`

It uses depth 5, one sequential worker, the current authenticated prefix
cache, and `--max-new-raw 2`.  Its launch manifest records the exact command,
source hashes, prefix-bank pins, and process identifiers.  It is a migration
canary only, not a terminal or Problem 97 closure result.

## Remaining migration boundary

The existing `launch_phase3_*` wrappers remain frozen v2 launchers until this
canary is checked for successful v3 configuration, bounded checkpoint output,
and artifact replay.  Once those checks pass, migrate the projected depth-5
wave first, then the shared-pair and supplemental fixed-shard wrappers, each
to a fresh v3 output root.  Do not resume or mix v2 output directories with a
v3 run.

## Resume gate correction

The first attempted checkpoint replay exposed a v3 resume bug: `CHECKPOINT`
was not included in the idempotent prior-manifest status set, so `--resume`
continued the bounded run and added two more raw-SAT records.  The driver now
treats `CHECKPOINT` like the other completed/checkpoint states, and a regression
test verifies that resume neither calls the solver nor creates a new manifest
generation.  The original output root is retained as a historical continuation
record; a fresh canary with the corrected source hash is required before wave
promotion.
