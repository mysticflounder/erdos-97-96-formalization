# Exact-five profile 0034 NEW-mirror physical deletion run-0001 failure audit

Status: incomplete external run; forensic artifacts only; no terminal record
and no mathematical or promotion claim.

The untouched failed root is
`scratch/runs/exactfive-profile0034-new-mirror-physical-block-deletion-piqd-20260904/run-0001/`.
Its run-manifest file SHA-256 is
`ed0fc67c3eb8623fc1a40ef5f9d039ed743e40b139550aad66be17c6a6c69641`
and its embedded manifest hash is
`8e548d3982ceaae72f09e4c935d792740313ce64a44e51fee14f758428a53e06`.
Its launch file SHA-256 is
`fa691deebdbccd43424cf0a53416c0bd3c8d3e91d9a2c7c7b2377200db986902`
and its embedded launch hash is
`680a10b1487ce21e5e40177a7ad44eeca8f931ae54da0d75826019aebe29a869`.
The launch records execution commit
`abab02eb9ffc1b0063731263c2821aa7d3c729e8`, 20 workers, a 60,000 ms
per-query timeout, a per-branch cap of 128, and `resume: false`.

There is no `events/terminal.json`.  No branch report, terminal status,
completed-wave mine, retained core, source claim, theorem claim, or promotion
claim can be recovered from this root.

Eight complete forensic query trees remain:

| Query | Disposition | Raw/effective status | Result self-hash |
| --- | --- | --- | --- |
| `z3-control-positive` | `SAT_REPLAYED` | `SAT` / `SAT_SEMANTICALLY_REPLAYED` | `3066bb0229f9735a4f2b76ac2a31d63ae114862432c096291764f98dbec7ed9f` |
| `z3-control-negative` | `UNSAT_CUSTODY_VALID` | `UNSAT` / `UNSAT_DISCOVERY_ONLY` | `2442bf76cc88278160787ad8e4dec20bc0dec37977615bed5821e629a7101fdd` |
| `z3-lt-anchor-60b11c21cfda49f4` | `UNSAT_CUSTODY_VALID` | `UNSAT` / `UNSAT_DISCOVERY_ONLY` | `a53d52fb8c77f661d111be95a6008553e7a84dc48dcb205f21af46792ae12a31` |
| `z3-lt-r001-60b11c21cfda49f4-drop-76c71aa473852cef` | `UNKNOWN` | `UNKNOWN` / `INCONCLUSIVE_UNKNOWN` | `82a78a38b5603ea1b7e9db51c9abd52d13a53e6bc99a709da068ecb39417a3a2` |
| `z3-gt-anchor-60b11c21cfda49f4` | `UNSAT_CUSTODY_VALID` | `UNSAT` / `UNSAT_DISCOVERY_ONLY` | `b24b25e767fce95a58c789bc2d57a53f516f06b5470b34e187cfc974fef33d69` |
| `z3-gt-r001-60b11c21cfda49f4-drop-7025082bfa4971cd` | `UNKNOWN` | `UNKNOWN` / `INCONCLUSIVE_UNKNOWN` | `65110c54d1b4b66ab002ea7e284858323992707e843b101f6d6fc3e11c985b8a` |
| `z3-gt-r001-60b11c21cfda49f4-drop-c073ee0b8e2acc73` | `UNSAT_CUSTODY_VALID` | `UNSAT` / `UNSAT_DISCOVERY_ONLY` | `f07d1520efb21c8768fc7804e34475e99a61098a9b7e5e835054346ec39a97b6` |
| `z3-gt-r002-52501cc3913aba85-drop-6e973a3d8e77dac3` | `UNSAT_CUSTODY_VALID` | `UNSAT` / `UNSAT_DISCOVERY_ONLY` | `531a5651f8fa6f8bdf4af38e66e282f0c9c67e2a19cfe1d4ddfffb6e54cf7497` |

Two transaction tombstones are present and empty:

- `.piqd-smt-tombstone-0e89a1f3-9b15-4c5d-9cc9-423f75b9d627`;
- `.piqd-smt-tombstone-b40d9b0f-e599-42f0-8992-d7f7c83ed3d9`.

The deterministic deletion schedule shows that the two missing candidate
trees are
`z3-lt-r001-60b11c21cfda49f4-drop-ab45598c5eb09c83` and
`z3-gt-r002-52501cc3913aba85-drop-1d86f6e406ca3cfc`.  The empty tombstones
contain no result, model, readback, receipt, or candidate identity, so the
mapping from a particular tombstone UUID to a missing candidate is not known.
Neither candidate has a usable result.

The failure mode exposed an exact-readback boundary: unsupported algebraic
values could escape the producer verifier as
`BoSourceQfnraError`, after which the adapter correctly recorded an
inconclusive verifier failure but the producer rejected that status during
local custody validation.  The failed root is retained byte-for-byte for
forensics.  Recovery uses a fresh producer, request namespace, and run root;
it does not resume, copy, rename, or transport any partial state from this
run.
