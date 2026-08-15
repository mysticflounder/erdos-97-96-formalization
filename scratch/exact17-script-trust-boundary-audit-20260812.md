# Exact-17 script trust-boundary audit (read-only)

Scope: `scripts/analyze_exact17_lean_cdefg_model.py` and
`scripts/mine_exact17_cdefg_model_bank.py`; no solver/build was run.

## Caller trace

`git grep` finds no tracked shell/CI/caller for either CLI.  The only tracked
consumer of the analyzer is
`scripts/validate_exact17_piqd_legacy_model_serialization_migration.py:23,135-195`;
it imports the module and passes pinned CNF SHA/count, while separately
requiring exact model fields, job ID, `SAT`, and `num_assigned = 308`.  The
miner is therefore a manually-invoked/discovery boundary, not currently a
wired production consumer.  `producer_bank` explicitly calls itself discovery
infrastructure, not a proof checker (`census/atail_force/producer_bank.py:1-12`).

## Findings (severity)

1. **Critical — analyzer authority override.**  CLI options
   `--authorized-sha256` and `--clause-count` (`analyze...py:127-145`) replace
   the immutable constants.  A satisfying alternate 308-variable CNF can
   consequently produce `status: PASS`; its decoded rows may become a false
   successor.  Smallest gate: remove these options from the release CLI and
   make `replay_cnf` assert the canonical constants (or require a signed,
   allow-listed root manifest).

2. **Critical — miner accepts forged analysis.**  `mine...py:23-27,112-125`
   only requires a JSON object, one named order, and whatever `rows` mapping
   the caller supplies.  It does not require analyzer schema/version,
   `status=PASS`, canonical CNF SHA, dimensions, model/job identity, or a
   complete 17-row/range/duplicate-free row schema.  A hand-written rows JSON
   yields scanner hits even though it is unrelated to a SAT model.  The bank
   itself only names Lean consumers; it does not prove the input model.
   Smallest gate: validate exact analyzer schema + canonical root SHA/counts,
   complete row shape, and model/job provenance before scanning; independently
   replay the source assignment/CNF at promotion.

3. **High — missing code/provenance binding and TOCTOU.**  Miner output binds
   only `source_analysis_sha256` (`:163-176`), and computes it after scanning;
   the analysis can change between parse and hash.  It records no miner,
   `producer_bank`, Lean-consumer, or order-table hash.  Smallest gate: hash
   one immutable input byte snapshot before parsing; emit/pin all producer
   code/source hashes and reject stale versions in export validators.

4. **High — historical NamedOrder-1 bug.**  HEAD v2 used
   `tuple(reversed(ORDER))` (`git show b6de2574`, old `:109-113`); the current
   unstaged v3 changes this to the explicit 9/12 swap (`:17-20,116-120`).
   Any old order-1 bank is untrusted and can miss/admit hits.  Smallest gate:
   quarantine and rescan all v2/order-1 artifacts; require v3/current script
   hash and expected order tuple before promotion.

5. **High — false replay claim.**  `unreplayed` is hard-coded to `[]`
   (`mine...py:132-135`); only selected minimized records are rescanned
   (`:143-148`).  This can report complete replay without checking every hit.
   Smallest gate: replay every emitted hit, or remove the field and make the
   output explicitly diagnostic.

6. **Medium — non-atomic publication.**  Both CLIs use direct `write_text`
   (`analyze...py:153-158`, `mine...py:178`).  A crash/concurrent reader can
   observe partial JSON or retain a stale prior output.  Smallest gate:
   same-directory temp file, flush/fsync, atomic `os.replace`, then directory
   fsync (and publish paired outputs transactionally).

7. **Medium — analyzer model schema/provenance gap.**  `load_assignment` uses
   only `payload["assignment"]` (`analyze...py:26-44`), ignoring `result`,
   `job_id`, `num_assigned`, schema, and model SHA.  The migration validator
   repairs this caller-side, but standalone CLI output can bless a hand-made
   satisfying assignment.  Smallest gate: require exact model schema, `SAT`,
   known job ID/model SHA, and reject duplicate JSON keys at the top level.

The current working tree has an **uncommitted** miner change from v2 to v3;
no source was edited by this audit.
