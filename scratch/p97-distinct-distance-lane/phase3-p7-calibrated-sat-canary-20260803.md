# P7 calibrated SAT-family canary

Date: 2026-08-03

Status: completed; persistent discovery remains experimental and production
promotion is closed.

This run tests whether the earlier 1.456x result was a startup-amortization
effect. It is a discovery-performance measurement only. It is not a new
mathematical certificate, a frozen-v2 replay, or a closure result.

## Configuration

The run used fresh subprocess/persistent workers and fresh run namespaces for
all arms. It reused the authenticated current-hash projected-static-v3
successor prefix bank and the same native CaDiCaL IPASIR library as the first
canary:

```text
bank root sha256:     645a4092854d445134c1ca691f94add287da0a69886d5cac69ef5c32afbcdd01
source prefix sha256: 7f31d598bcf42083a99f0af20abb9b461c015e32acab8ff58984c139544c8ab9
CaDiCaL library sha256: 115744ffabb4375dd43add0fc2846242bc23e822f05b15f5cc3cff4788cb29b6
depth:                5
solver timeout:       120 seconds
bounded raw-SAT cap:   8 per arm
```

The two SAT-producing families were selected from the historical depth-5
shell census (`sat5:5` and `sat8:8`). `frontier:12` was retained as the
terminal-proof control required by the P7 gate.

## Measurements

| family | subprocess | persistent | persistent/subprocess | RSS ratio | outcome |
| --- | ---: | ---: | ---: | ---: | --- |
| sat5:5 | 73.857 models/h | 76.424 models/h | 1.035x | 1.000x | both checkpoint after 8 models |
| sat8:8 | 74.581 models/h | 73.132 models/h | 0.981x | 0.999x | both checkpoint after 8 models |
| frontier:12 | 0 models/h | 0 models/h | n/a | 1.000x | both `SHARD_STRUCTURAL_UNSAT_VERIFIED`, fresh DRAT verified |

All three pairs agreed on status and counts. The terminal pair agreed on the
terminal status and exercised the fresh proof-producing solver plus DRAT
checker. The persistent SAT arms recorded eight discovery solves and one
formula rebuild each; the terminal persistent arm recorded one solve and one
rebuild.

Authenticated artifacts:

- `scratch/p97-distinct-distance-lane/p7-canary-20260803/hard-shard-ab-calibrated/report.json`
- `scratch/p97-distinct-distance-lane/p7-canary-20260803/hard-shard-ab-calibrated/benchmark-manifest.json`

```text
report:   d55be348f44fb5d624246e1e4cde7637e932d530ba1b777474c1b6050b0edadb
manifest: d1da62851c514d948495e2b17b8be914274bd0cef051f578057ecaac1e91a678
```

Both hashes were independently recomputed after completion.

## Gate decision

The two-of-three performance gate requires at least 1.5x persistent-over-
subprocess models/hour and RSS no worse than 1.25x on two families, together
with terminal status agreement. The terminal and RSS checks passed, but both
SAT-family throughput ratios were near parity and neither passed the 1.5x
threshold. The authenticated report records:

```text
P7_PROMOTION_CLOSED_PERFORMANCE_GATE_INCOMPLETE
```

This resolves the immediate uncertainty: the earlier 1.456x result does not
survive a larger fixed model sample. Persistent CaDiCaL should remain an
opt-in discovery backend, with fresh terminal proof production unchanged.

## Next action

Do not spend another long canary on shard selection and do not begin P8
encoding work. The next optimization target is instrumentation-driven: use
the existing per-stage timings to profile loader replay, CNF rendering/writing,
manifest/hash work, and process startup separately from solver time. The
persistent backend should be reconsidered only after a change reduces one of
those fixed costs or materially changes the solver interaction; otherwise the
measured steady-state benefit is not sufficient for promotion.
