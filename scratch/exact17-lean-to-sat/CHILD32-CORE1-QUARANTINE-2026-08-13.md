# Child32 Core-1 quarantine

Job `547cca82-e479-468c-abe1-fb318d7004e6` is infrastructure evidence only.
It is not a SAT, UNSAT, theorem-mining, or closure checkpoint.

The immutable inputs were:

- CNF SHA-256 `c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d`;
- producer-manifest SHA-256 `3f7f043c81ffbedb34def0621a5ac84b363e6e492a7315b270678568dbd035f8`;
- identity hash `ae97ed382276fc089b92594e6415761eb2f0954370811da100664cf79d3a3a22`;
- `requested_core_limit = 1`.

The first daemon claim started at Unix time `1786605560` and ran CaDiCaL as
PID `95830`.  A daemon restart reset the database row and reclaimed the same
job.  The replacement claim started at `1786606470` as PID `80162` while PID
`95830` was still alive.  Both processes therefore ran the same job's
`input.cnf` concurrently.

Both solver processes were sent `SIGTERM`.  The terminal job row is retained
in `piqd-child32-core1-status-terminal-quarantined.json`: result `UNKNOWN`,
with the replacement start time and `SINGLE_PROCESS_NO_PARALLEL_FLAG` /
`attested_solver_processes = 1`.  That terminal attestation describes only the
replacement claim and does not account for the overlapping pre-restart solver.

Consequences:

1. Never finalize, promote, or reuse this job.
2. Its `UNKNOWN` result says nothing about the formula.
3. Submit a fresh child32 Core-1 job only after PIQD provides restart-safe
   daemon-generation and execution-attempt custody, and bind those fields in
   the runner.
4. The independently replayed SAT model from the earlier diagnostic job on the
   same CNF may guide child33 theorem mining, but it is not a production
   execution checkpoint.
