# FreshThird FirstNonHit common-radius cap-fiber v2

This directory contains exactly one bounded named-row diagnostic wave for the
`FreshThirdCapSourceInteraction.sameBlocker` / `FreshThirdNonHit.sameBlocker`
branch. It is discovery evidence only. It is not a finite negation of the
Lean target, a universal carrier model, a proof, or a promoted CEGAR cut.

Preflight: the packet has a finite named-role shadow, but no proved
cardinality-independent quotient or universal extraction/lift. All hard
clauses are source-mapped in `SOURCE-MAP.md`; `hingress` is intentionally
opaque and absent. The carrier is represented by 16 identity atoms only to
provide a bounded diagnostic universe.

The packet uses C sources `c0,c1`, Q sources `q0,q1`,
`K = Q.selectedShell.support` with card 4, canonical cap `Cap`, and blocker
center `b`. It asserts `K ∩ Cap = {c0,c1}`, four distinct witnesses in
`Cap \ K` (without exhausting that difference), the five-way alias-or-exact
named-shell split, and the at-most-two named canonical-cap sources in the
`b` blocker fiber. The exact-radius class is represented only by equality of
positive radius atoms; no Euclidean realization is claimed.

Named selected rows `C0,C1` have support exactly `K` and blocker `b`.
Diagnostic rows `R0,R1` have their own source (`u0,u1`), distinct blockers,
cardinality four, and overlap at most two with `K`. Equal blockers force equal
support; distinct blockers force overlap at most two. The queried negative
condition is only “every asserted named distinct-from-`b` row overlaps `K` by
at most two.” It is not universal over unmentioned rows.

Run and validate:

```bash
UV_CACHE_DIR=$PWD/scratch/.uv-cache uv run --offline python \
  scratch/p97-consumer-first/freshthird_firstnonhit_commonradius_capfiber_v2/runner.py
UV_CACHE_DIR=$PWD/scratch/.uv-cache uv run --offline python \
  scratch/p97-consumer-first/freshthird_firstnonhit_commonradius_capfiber_v2/tests/test_wave.py
```

The runner emits one SMT file per case, each with exactly one `check-sat`, and
cross-checks every case with Z3 and cvc5. SAT models are written to
`readback/`; `tests/test_wave.py` independently checks the source clauses and
row conditions from those models.
