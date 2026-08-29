# Stale dirty-file cleanup — 2026-08-28

This attic preserves untracked worktree material that had not changed for at
least three days and was no longer part of an active lane.

The archived Lean files are historical probes, superseded duplicates, or
off-spine candidates. They are retained for audit and later mining, but they
are not current proof authority and were not promoted by this cleanup. In
particular, files using `admit`, local axioms, or duplicate declaration names
must not be imported as trusted proof source.

The archived solve prompt is research provenance rather than a current closure
plan. Its tracked inbound reference now points here.

The still-referenced six-center diagnostic source remains at
`lean/scratch/firstnonhit-common-sixcenter-math/SixCenterMath.lean`; this sweep
does not claim that it is publish-reachable or promoted.
