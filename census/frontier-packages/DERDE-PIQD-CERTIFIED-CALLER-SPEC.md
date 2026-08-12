# DE/DR/E certified PIQD caller contract

## Scope

This contract covers only the named-local DE, DR, and E frontier projections.
Every result remains `FINITE_LOCAL` / `LOCAL_CERTIFICATE` evidence.  Neither a
SAT witness nor a certified UNSAT result promotes a theorem or closes a
universal carrier claim.

## Backend selection and execution

- `piqd` is the default backend.
- `legacy-local` is available only through the explicit
  `--solver-backend legacy-local` option.
- A PIQD construction, transport, or replay failure is terminal for that
  caller invocation.  It never falls back to the local solver.
- `--workers` accepts only `1`.  Official runs and smoke probes are submitted
  sequentially in their existing deterministic order.
- DR's `direct-double-role-swap` check remains a direct, non-solver gate.

## Exact query package

For every effective DIMACS query, including every smoke probe with extra
clauses, the caller creates exactly one fresh `FrontierAuthenticatedPackage`.
It contains:

- the exact effective DIMACS bytes;
- a complete variable map made from the selected encoder's exact name-to-id
  dictionary;
- exact path snapshots of that lane's `encoding.py` and encoding spec;
- a build ledger whose terminal query authenticates the same DIMACS bytes; and
- a closed DE, DR, or E finite/local lane profile.

The package is used to create one fresh transport attempt and one fresh
`LeanLratReplayer`.  The shared public solve callable is
`PiqdPerQueryCertifiedSolver(query_factory)`.

## Proof custody

The caller continues to pass a requested path ending in `.drat` for interface
compatibility.  Backend artifacts are not relabeled:

| Backend | Requested `.drat` | Proof manifest | Additional custody |
| --- | --- | --- | --- |
| `piqd` | must remain untouched | `proof_format: LRAT`, `.lrat` proof | kept CNF, proof clause map, Lean replay source, replay receipt, certified receipt |
| `legacy-local` | raw local proof destination | `proof_format: DRAT`, `.drat` proof | none claimed by this caller contract |

Certified PIQD UNSAT is accepted only after the existing exact packet checks
and local Lean LRAT replay return `proof_verified: true`.

## Gate and exit semantics

- The existing DE and DR smoke UNSAT gates still require
  `proof_verified: true`.
- Each E smoke probe expected to be UNSAT passes only when its verdict is
  `UNSAT` and `proof_verified` is true.
- E official runs exit successfully only when every run is SAT or verified
  UNSAT.  `UNKNOWN`, `TIMEOUT`, and unverified UNSAT are inconclusive and make
  the process exit nonzero.

## Focused fake-only test

Run:

```bash
bash census/frontier-packages/test-derde-piqd-callers.sh
```

The script caps common native thread pools and runs one pytest process.  Its
fakes do not contact a daemon, invoke a SAT solver, or run Lean.
