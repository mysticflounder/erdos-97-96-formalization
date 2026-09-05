# P97 exact-five profile 0034 NEW-mirror physical block deletion recovery

Status: fresh governed producer; no solver result, mathematical claim, or Lean
promotion claim.

This recovery repeats the authenticated NEW-mirror PIQD/Z3 physical block
deletion from a new lane rooted at commit
`abab02eb9ffc1b0063731263c2821aa7d3c729e8`.  Its run root is
`scratch/runs/exactfive-profile0034-new-mirror-physical-block-deletion-recovery-piqd-20260905/run-0001/`.
The producer neither reads nor resumes the incomplete predecessor run.  No
query tree, receipt, tombstone, launch record, or other runtime payload is
copied from that run.  The new lane identifier also gives every deterministic
PIQD request a new request namespace.

The mathematical input remains the authenticated order
`U,p,a,s,d,c2,q,O,y,x,v,t,u` and source-journal hashes
`db29694cf075b978bb586fde6b5490fa0aa3cf318635cef59cddbf4c18c3862a`
(lt) and
`9a5c4cfd3154224d46f3cb81df6c5e4a13f0ecc8783e9bfaadcdeb9040402cbf`
(gt).  The producer submits full formulas first, then physically removes
complete blocks: thirteen eleven-assertion supporting-edge blocks, eleven
source-row equalities, `radius-branch`, and `source-strict`.  No Boolean
assumption guards are introduced.

Only custody-valid raw UNSAT accepts a deletion.  SAT, rejected or failed
semantic replay, UNKNOWN, transport loss, malformed artifacts, and errors do
not remove a block.  Exact-rational replay converts unsupported algebraic
readback, including `root-obj` and trailing-`?` numerals, into fail-closed
`exact_readback_unsupported` evidence.  An adapter
`INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE` record is accepted only when a local
rerun of the bound verifier raises the same exception class and reproduces the
complete semantic failure record.  It is always classified as unresolved,
never as replayed SAT.

The producer preserves create-once publication, descriptor and journal
reconstruction, exact source and result digests, fresh closed PIQD sessions,
and no-follow regular single-link reads.  Symlinks, FIFOs, hard links,
replacement races, unbound files, and incomplete runtime trees fail closed.
Initialization and offline verification perform no network transport.  A
nonterminal root cannot be resumed; a further recovery requires another fresh
lane and run identifier.

All claims remain false.  Raw UNSAT is discovery-only and does not establish a
source obstruction, theorem, or promotion.  The worker bound is at most 20 and
the per-branch query cap is 128.  This specification and producer do not
authorize a solver launch.
