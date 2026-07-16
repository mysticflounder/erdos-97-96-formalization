# Required theorem-bank and indexed-corpus preflight

Date: 2026-07-14

Before running the fresh equality oracle, this lane inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including
  “Sibling `p97-rvol` banks” and the Census-554 equality/separation surfaces;
- `certificates/p97_rvol_general_n_mining.md` and its exhaustive JSON;
- `certificates/erdos97_legacy_general_n_mining.md` and its exhaustive JSON;
- `certificates/erdos_general_theorem_p97_mining.md` and its exhaustive JSON;
- the live aggregate matcher
  `census.atail_force.producer_bank.scan_all_formalized_cores`; and
- the indexed Lean corpora with

  ```text
  nthdegree docs search --lean \
    "two distinct centers equidistant shared pair critical deletion continuation row strict cap pair" \
    --limit 20
  nthdegree docs search --lean \
    "selected row exact circle split bridge tail circle chain wrap contradiction" \
    --limit 20
  ```

The closest current/importable consumers were:

- `Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `Problem97.Census554.DuplicateCenterCore` and its realization
  contradiction;
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget`
  `.u1TwoLargeCapObstruction` in the sibling inventory;
- `Problem97.CriticalShellSystem`
  `.blocker_centers_ne_of_not_mem_other_selected_support`; and
- the live split-bridge, split-bridge-tail, and circle-chain-wrap order
  consumers exposed by `producer_bank`.

No searched declaration produces the missing continuation-row membership or
the minimal second-apex equality from the current K-A packet. The bank search
therefore supplies consumers and freshness cuts, not the missing uniform
producer.

The broader live scan is materially stronger than the bank label embedded in
the cap-bound source checkpoint. It classifies five of the eleven source SAT
shadows as already covered. Only shards `0,1,2,3,16,20` are eligible for new
core mining; shards `10,12,13,15,21` are retained only in the full-oracle and
freshness ledger.
