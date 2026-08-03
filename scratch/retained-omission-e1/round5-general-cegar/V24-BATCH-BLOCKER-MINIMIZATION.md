# V24 authenticated batch blocker minimization

V24 snapshots one representative of every observed 55-variable assignment
signature in the authenticated v19-resume and live-v20 journal prefixes.  It
also includes the authenticated terminal-v19 population, whose 190 proposals
collapse to one such signature.  Source journals remain read-only; their
record counts and hash-chain heads are pinned in the immutable v24 manifest.

The four-assignment canary deliberately covers the terminal-v19 signature, the
alternate v19-resume basin, and representatives associated with v20 cubes 008
and 010.  Production may start only after all four canaries admit a strict
reduction from the 825-fix complete assignment.  At most four worker processes
run, each at inherited nice level 15 and with one Z3 thread.

Discovery is not admission.  Each candidate is checked twice from independent
fresh Z3 contexts and fresh parses of the exact gzip-attested raw formula.
Both checks must be UNSAT and agree on raw, candidate, assertion-count, and
derived-formula hashes.  SAT, UNKNOWN, timeout, malformed evidence, or any
identity disagreement fails closed to the complete assignment.  Every worker
event is an atomic file in a content-hash chain.

The terminal compact bank deduplicates admitted candidates and removes blockers
subsumed by a stronger retained blocker.  It is ingress evidence for a future
Boolean master only and must not be injected into the already-running v20
wave.  Trust boundary: exact-arithmetic external Z3 UNSAT evidence without a
proof certificate or Lean kernel check.
