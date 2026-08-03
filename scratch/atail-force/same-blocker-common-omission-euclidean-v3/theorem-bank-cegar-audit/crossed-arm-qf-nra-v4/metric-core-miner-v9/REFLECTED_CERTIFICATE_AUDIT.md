# Reflected-certificate audit

Date: 2026-08-01

## Scope and terminal status

This audit tested whether the current exact Singular lifts could become
kernel-usable Lean certificates by reflecting a polynomial identity and proving
the reflected equality with `native_decide`.

**Terminal status: negative for the current lifts.** No Lean theorem was proved,
no production source was changed, and no axiom was accepted. The current G3
certificate should not be embedded in Lean. A substantially more compact
elimination chain or certificate is required before revisiting reflection.

The accompanying `reflected-b3-build.log` is a failed scratch experiment, not a
proof artifact.

## Direct `MvPolynomial` experiment

The experiment used the already-reduced B3 lift (480 multiplier terms) and
generated a 17,745-byte Lean source whose proposed certificate was an equality
in `MvPolynomial (Fin 4) ℚ`. The intended trust split was:

1. `native_decide` checks the exact reflected polynomial equality;
2. an ordinary theorem applies `MvPolynomial.eval₂Hom` and the five zero
   hypotheses to transport the checked identity into any commutative
   ℚ-algebra.

This does not work with Mathlib's `MvPolynomial` as the executable reflected
carrier. Lean reports that `MvPolynomial.X` and
`MvPolynomial.instCommRingMvPolynomial` have no executable code. Elaboration
then reached deterministic `whnf` / `isDefEq` heartbeat limits. The focused
command failed after 55.16 seconds with 5,387,223,040 bytes maximum resident set
size. The exact diagnostics and `/usr/bin/time -l` record are retained in
`reflected-b3-build.log`.

Marking the definitions `noncomputable` cannot repair this route: it would make
the proposed `native_decide` equality unavailable rather than executable.

## G3 payload audit

The stable exact reduced G3 lift is
`q1-G3-syz-reduced.singexpr`. Its relevant payload measurements are:

| Measure | Value |
| --- | ---: |
| File size | 21,793,770 bytes |
| Certificate rows | 6 |
| Multiplier terms (reported by certificate lane) | 4,095 |
| Rational literals found in the serialized rows | 4,092 |
| Distinct denominators | 2,475 |
| Largest numerator | 3,282 decimal digits |
| Largest denominator | 3,269 decimal digits |
| `gzip -9` size | 9,905,611 bytes |

The most frequent single denominator occurs only 21 times. Thus extracting one
common denominator per row does not remove the dominant payload. The compressed
size also shows that this is not mostly superficial repetition introduced by
the Singular printer.

For comparison, the older unreduced `q1-gA-certificate.singexpr` is 10,976,190
bytes and remains 4,617,339 bytes under `gzip -9`. It is smaller on disk but is
still not an acceptable generated Lean certificate.

## Trust boundary

The G3 identity is externally exact according to the Singular certificate
lane (`IDENTITY=1`). This audit did not replay it in Lean, so it is not
kernel-checked closure. The failed B3 compilation likewise establishes no
theorem and its diagnostic `sorryAx` output must not be interpreted as an
accepted dependency.

## Revisit criterion

Reflection becomes worth retrying only after a new producer yields a compact
certificate or elimination chain. At that point, use a small executable sparse
polynomial datatype (not `MvPolynomial`) and separately prove its evaluator and
normalizer sound in Lean. Audit the complete native executable dependency
closure before accepting `Lean.trustCompiler`; do not hide the current payload
behind file I/O, an `extern`, `implemented_by`, or an unsafe decompressor.
