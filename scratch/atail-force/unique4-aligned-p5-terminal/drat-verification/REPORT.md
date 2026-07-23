# Aligned-p5 fixed-CNF DRAT verification

Date: 2026-07-22 (America/Los_Angeles)

## Result

**EMPIRICALLY VERIFIED, exact CNF only.** CaDiCaL returned UNSAT for the
pre-existing aligned-p5 CNF and emitted a binary DRAT proof. `drat-trim`
checked that exact CNF/proof byte pair, exited `0`, and printed exactly one
standalone line

```text
s VERIFIED
```

This certifies UNSAT of the recorded DIMACS formula. It does **not** certify
that the formula is a source-faithful encoding of the Lean parent packet, does
not audit the mathematical validity of its hard-clause families, and does not
close a Lean `sorry`. Those are separate obligations.

## Exact input

```text
path:     /private/tmp/p97_unique4_aligned_p5.cnf
header:   p cnf 15192 2791032
bytes:    158895165
sha256:   50a8062cb9b089cc6f3a47497face0a46ceacb5e86152ec04fc5f3c6557b9c7f
```

The header occurs on line 15,254. An independent line count found exactly
2,791,032 clause lines after the header.

## CaDiCaL proof emission

Binary: `/Users/adam/bin/cadical`, version `3.0.0`.

Command:

```bash
/usr/bin/time -p \
  -o /private/tmp/p97_unique4_aligned_p5_verify_20260722.cadical.time \
  cadical -t 120 \
    /private/tmp/p97_unique4_aligned_p5.cnf \
    /private/tmp/p97_unique4_aligned_p5_verify_20260722.drat \
  > /private/tmp/p97_unique4_aligned_p5_verify_20260722.cadical.log 2>&1
```

Result:

```text
exit: 20
real: 38.54 s
user: 38.23 s
sys:   0.29 s
```

Artifacts:

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| DRAT proof | 120497715 | `6a58c8c26732122f53f1d883c44fcd9a0ddee34f501d61e24dd94605abe127f4` |
| CaDiCaL log | 16507 | `79a0766155f62ecbf68a56f91d3980fe7e333942d4ed5c27bc2ef60eb2998a32` |
| time file | 31 | `d8a752db03c17bd4a96394b56698d213f6584c64c96216a8596de5d5e479e5a1` |

## `drat-trim` replay

Binary: `/Users/adam/bin/drat-trim`.

The first bounded smoke replay used `gtimeout 300`. It exited `124` after
300.03 seconds, produced no checker diagnostic, and contained no
`s VERIFIED`; it is recorded only as a timeout and is not evidence for or
against the proof.

The completed replay used:

```bash
/usr/bin/time -p \
  -o /private/tmp/p97_unique4_aligned_p5_verify_20260722_long.drat_trim.time \
  gtimeout 3600 \
    drat-trim \
      /private/tmp/p97_unique4_aligned_p5.cnf \
      /private/tmp/p97_unique4_aligned_p5_verify_20260722.drat \
  > /private/tmp/p97_unique4_aligned_p5_verify_20260722_long.drat_trim.log 2>&1
```

Result:

```text
exit: 0
real: 579.65 s
user: 578.50 s
sys:    1.06 s
exact standalone `s VERIFIED` lines: 1
```

The checker reported:

```text
c parsing input formula with 15192 variables and 2791032 clauses
c finished parsing, read 120497715 bytes from proof file
c detected empty clause; start verification via backward checking
c 18821 of 2791032 clauses in core
c 80351 of 1508721 lemmas in core using 2723854 resolution steps
c 5447 RAT lemmas in core; 42958 redundant literals in core lemmas
s VERIFIED
```

Replay artifacts:

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| `drat-trim` log | 465 | `24a0c270ba8b0792051c9eda9f5e987be9202b8cd76f974d83d7cb8c0eab0c7d` |
| time file | 33 | `588482bc9ee551b0f759640d7d7ab87098d755eb0a90e6bbf731775fe9f97f73` |

## Trust scope and next obligation

The solver-verdict trust gap for this exact fixed CNF is closed by the
independent DRAT replay. The remaining gap is the encoding-to-source map:

1. audit every hard-clause family against source-clean Lean declarations;
2. flag any clause family that assumes an open producer;
3. extract a source-level occurrence theorem or provide a Lean-checked
   CNF/source valuation and LRAT/DRAT replay bridge.

Until that happens, the correct claim is only:

> The exact aligned-p5 DIMACS artifact with SHA-256
> `50a8062cb9b089cc6f3a47497face0a46ceacb5e86152ec04fc5f3c6557b9c7f`
> is DRAT-verified UNSAT.
