# Profile-0034 mirror supporting-edge cvc5 long replay, v1

This lane replays the authenticated `mirror-radius-lt` and
`mirror-radius-gt` source query bytes from the completed QF_NRA parent through
PIQD's cvc5 adapter. The requested default timeout is 300 seconds; PIQD's
disclosed effective deadline is 330 seconds. The controls are positive SAT and
negative UNSAT checks. Results are discovery-only: no theorem, source
realization, Lean ingress, or promotion claim is made.

The parent manifest, launch, terminal, source manifests, result files, and
source producer bytes are pinned by digest. A target is submitted only after
its generated SMT-LIB and journal bytes match the parent byte-for-byte.
`--verify` reads the immutable run tree and makes no HTTP or solver calls.
