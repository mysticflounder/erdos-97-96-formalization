# Exact-five seven-order coverage run-0001 failure

Date: 2026-09-05 UTC

The original lane `exactfive-profile0034-seven-order-coverage-piqd-20260904`
was launched under its immutable launch record
`d284273b3ef651fe4fde66c28132d27c50ca9be37b30b43e09b8509f72390bd7`. It
failed before the first solver session with the compact error:

`cannot open artifact root without following links`

No solver sessions or solver artifacts were created. The launch record and
its governed run manifest remain retained as immutable failed evidence.

The cause was structural: `run_census` created the top-level `artifacts`,
`events`, and `tmp` directories but omitted `artifacts/controls` and
`artifacts/profiles`. The PIQD adapter requires each output directory's parent
to exist before reserving its no-follow staging root.

The successor lane
`exactfive-profile0034-seven-order-coverage-piqd-r2-20260904` uses a fresh
checkpoint and fresh `run-0001` manifest. It creates both artifact category
directories before controls or profiles are submitted, retains all custody
and replay checks, and must be reviewed before any launch. The old run tree is
not copied, resumed, deleted, or overwritten.
