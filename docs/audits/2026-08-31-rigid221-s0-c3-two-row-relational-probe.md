# Rigid221 S0 C3 two-row relational probe

**Date:** 2026-08-31
**Lane:** rigid221-s0-c3-two-row-relational-probe-20260831
**Base:** 36f6bcf59d95ec323b1612ced1384b39496157e7
**Status:** formula-scoped exact positive controls replayed; fresh PiQD Z3
sessions returned SAT

## Scope

This audit records a bounded named-role QF_NRA positive control. It has no
source bridge, complete-carrier coverage, decoder, or Lean consumer. Any solver
result is therefore formula-scoped only.

The exact formula contract is
[the v1 specification](../specs/p97-rigid221-s0-c3-two-row-relational-probe-v1.md).
It retains the literal source blocker v, two named four-point radius fibers,
the physical five-fiber, the fixed MEC disk, actual C3 arc polynomials, and
the first source-row midpoint equality.

## Source boundary

The first midpoint relation is motivated by the kernel-checked theorem
exists_sourceRow_partner_with_blocker_index_strictly_between in
Rigid221SourceRowCapBetweenness.lean:191. The live source data does not provide
a second opposite-row or next-blocker metric relation. In particular, the
source dispatcher leaves other = v or a closed second cap of cardinality at
least six.

This probe does not encode the contextual peer, deletion packets, full cap
construction, convex carrier, robust surface, legal equality cells, or any
source-cardinality coverage. The named fiber tests range only over the thirteen
listed roles.

## Local validation

The independently replayed exact controls use Fraction arithmetic. In both
strict turn cells they verify:

~~~text
physical O-radius squared = 289/100
literal-blocker v row radius squared = 289/1625
cv row radius squared = 221/400.
~~~

Focused contract tests and static checking completed before solver submission:

~~~text
uv run pytest -q scripts/test_rigid221_s0_c3_two_row_relational_probe.py
8 passed

uv run --with ruff ruff check
All checks passed
~~~

The smoke gate parses the generated flat SMT-LIB, binds the exact witness into
a fresh local QF_NRA solver, and confirms that adding False is UNSAT. The
emitter prohibits exponent syntax and checks stable formula hashes across two
Python hash seeds.  The unbound local Z3 executions also returned SAT for both
cells; their role here is formula execution corroboration, not a source claim.

## PiQD execution

A governed run root exists at:

~~~text
scratch/runs/rigid221-s0-c3-two-row-relational-probe-20260831/piqd-v1/
~~~

An isolated loopback PiQD daemon ran with a twenty-worker ceiling.  Each cell
used one fresh Z3 4.17.0 SMT session, one solve, no model request, no replay,
and no minimization.  The sessions closed after their single receipt.

| Cell | Source-session SHA-256 | Normalized SHA-256 | Session | PiQD solve | Status |
|---|---|---|---|---:|---|
| forward | `7af9442f918999534d118ec9f39b18047600a2494cae9e85a18f260bb42407b5` | `f50b274d2cafa60046b0ccab5d533014cfdd9d5adf39c218b996bb3029222d7a` | `9d8cd2d9-6f38-42b2-aa9d-6119a2af8784` | 14 ms | `SAT` |
| reverse | `1f86d70c8767264483bebd55ab9ab65db9a5f5f604f2cb5281c22d358f08758a` | `9916bde08dcc9307ee7a22b90a19db90ab3e6550d1f85bc94348657d766bbc74` | `9dcf1293-7b8e-4e5b-a5a4-90e552720907` | 15 ms | `SAT` |

Both driver receipts record 147 input assertions, 147 retained assertions,
180 normalized commands, and a 60,000 ms requested timeout.  PiQD recorded a
90,000 ms effective deadline and the shared result digest
`e1924c92e6d58322ac1609aac6ff0800aaec81edba4a925aa05a953b703fd943`.
The driver checked the exact source bytes, normalized bytes, session receipt,
and close response for each cell.

A timeout, unknown response, byte mismatch, receipt mismatch, or replay failure
is inconclusive. A SAT reply paired with exact replay establishes only that the
named-role relation package is satisfiable.
