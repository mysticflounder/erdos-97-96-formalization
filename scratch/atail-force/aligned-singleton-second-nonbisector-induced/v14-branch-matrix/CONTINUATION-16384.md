# local / critical / new continuation to 16,384 cuts

The exact serial command is recorded in
`resume_local_critical_new_16384.sh`. It cloned
`local-critical-new.checkpoint.json`, then invoked `cegar.py --resume` with the
same v14 branch and solver settings and `--max-cuts 16384`.

Terminal outcome: checkpoint-validation `UNKNOWN`, fail closed.

The inner replay of checkpoint core 62 returned `canceled` after the run
consumed the 600-second wall budget. `cegar.py` raised:

```text
ValueError: checkpoint core 62 failed INNER-UNSAT replay: canceled
```

The process exited 1 and emitted no result JSON or survivor. CEGAR did not
resume and banked no new cuts. The cloned continuation checkpoint still has
4,096 cuts and is byte-identical to its source:

`967e51963bbcad9a788aced593988fdf4b185b46f77189f1da07cd7b88099611`

Its recorded implementation hash still matches the current `cegar.py`:

`b09301016aabdb65a97eade8b3a38a043bca009feb69de31a235c739dfd0c7a7`

The stderr artifact SHA-256 is:

`9065a877dc0781a1293645fe247cf1ae6833f6deea272ca05e2a0732b167538e`
