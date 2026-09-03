# Gauge circumdisk polynomial lemma audit

Date: 2026-09-03

## Reuse preflight

The project Lean-corpus search found the existing kernel-clean chain in
`P97.N4d.SmallSReductions`: `mec_circumcenter_x`,
`mec_circumcenter_y`, `nonobtuse_v₃_numerator_nonneg`, and
`mec_circumcenter_y_nonneg`.  The first missing reusable step was the direct
polynomial disk test consumed by the full MEC-elimination encoder.

## Added theorem

`Problem97.gauge_boundary_disk_sq_iff_polynomial` proves that, under positive
third-apex height and its boundary equation, the normalized squared-disk test
is characterized by

```text
v * (x^2 - x + y^2) <= y * (u^2 - u + v^2).
```

The proof first derives `2*v*m = u^2-u+v^2`, normalizes the disk inequality,
and uses positivity of `v` in both directions.  It never divides by the tested
point's `y` coordinate.

## Verification state

- focused `lake env lean Erdos9796Proof/P97/N4d/SmallSReductions.lean`: exit 0;
- source scan: no new `sorry`, custom axiom, unsafe computation, or external
  evidence dependency;
- independent mathematical/source audit: PASS; and
- `git diff --check`: clean.

The authoritative
`lake-build Erdos9796Proof.P97.N4d.SmallSReductions` completed successfully
with 8,009 jobs.  Its best-effort proof-blueprint resync subsequently reported
an unrelated stale indexed declaration in
`ATailSevenSourcesOutsideTwoShells`; the wrapper explicitly reported the build
itself as successful.
