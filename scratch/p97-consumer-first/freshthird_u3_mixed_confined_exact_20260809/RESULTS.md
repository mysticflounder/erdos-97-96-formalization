# Results: bounded U3 mixed confined exact census

Status: `EMPIRICALLY VERIFIED` finite abstraction only.  This is not a
geometric counterexample, a universal closure, a CE, or a Lean proof.

## Wave

The six rows are centered at `(u,a0,a1,t1,t2,t3)`.  Each row mode is:

* `Q`: an exact card-4 q-deleted support `B`, with `q ∉ B`, own center omitted,
  support in the eight-label old support, dangerous-circle intersection ≤2,
  and at least two off-circle points.
* `S`: an exact `CriticalFourShell` support, with `q ∈ support`, own center
  omitted, the same circle/off-circle bounds, and exact support equality
  closure on all eight ambient labels.

Every pair of distinct rows has support intersection ≤2.  Q rows have no
off-support disequality constraints.  The 64 mode assignments and all support
tuples were exhaustively enumerated by `enumerate_u3_packet.py`.

## Verdict

All 64 mode assignments are SAT in this structural abstraction.  The exact
enumerator found 1,552,476 compatible six-row support tuples.  Z3 and cvc5
agreed (`sat`) independently on every one of the 64 mode assignments, and the
independent `readback.py` checker passed.

Representative counts (full per-mode counts are in `results.json`):

```
QQQQQQ  468       QQQQQS  7116       QQQQSS  46728      QQQSSS  72558
QQSSSS  16176     QSSSSS  1248       SSSSSS  216
```

Thus this source-faithful finite support surface has compact SAT models in
every mode, including all-shell and all-q-deleted cases.  There is no UNSAT
obstruction to minimize and no certificate consumer to request from this
wave.  The missing item remains the universal pointwise no-shift producer in
`INGRESS-CONTRACT.md`; after that producer, further geometric constraints or a
consumer theorem would be needed to turn a model census into proof progress.

## Malformed controls

`malformed_controls.py` deliberately drops source guards and reports:

```
clean_Q_all_rows                         468
drop_own_center_Q                      47520
models containing an own center        47052
allow q in Q rows                     1552476
```

The first control creates models with a row containing its own center, directly
showing why `erase center` / `center_not_mem_support` cannot be omitted.  The
q-in-Q relaxation is not source-entitled; it is retained only as a malformed
control.  No malformed result is used in the main verdict.

## Reproduction and checks

From this directory:

```
uv run python enumerate_u3_packet.py
uv run python readback.py results.json
uv run python malformed_controls.py
```

The source theorem scratch ingress was checked with the existing Lake olean:

```
cd lean && lake env lean ../scratch/U3EscapeShiftScratch.lean
```

It exits 0 with only the module-docstring warning.  A concurrent `lake-build`
lock prevented a fresh package build; no production file was touched.
