# Exact-11 v7 four-case certificate-reuse audit

## Scope and trust status

This is a read-only audit of
`scratch/card11-exact5-common-fullradius-v7/runs/{s2_o0,s2_o9,s3_o0,s3_o9}`.
No existing CNF, manifest, proof, verification result, ingress file, or Lean
file was changed. No solver, DRAT checker, Lean elaboration, or Lake build was
started.

The reproducible complete-file scan is `audit.py` (run with
`uv run scratch/card11-exact5-common-fullradius-v7-case-reuse-audit/audit.py`).
It reads all 1,370,778 clauses in every CNF.

## Verdicts

### (a) Exact carrier-label / variable-permutation isomorphisms: REFUTED

There is no carrier-label-induced variable permutation between any two of the
four cases.

The selected-row surface already proves the obstruction:

- centers 1 and 2 have the unique candidate counts 43 and 16, so every profile
  automorphism fixes both;
- label occurrence counts in the candidate families at those two fixed centers
  partition the labels as
  `{0}`, `{1}`, `{2}`, `{3,4,5}`, `{6,7,8}`, `{9,10}`;
- therefore the exhaustive profile automorphism group has
  `3! * 3! * 2! = 72` elements, fixing 0, 1, and 2 and preserving the other
  three displayed classes; and
- all 72 maps leave each of the four shell sets in its own orbit.

In particular, the three tempting maps from `s2_o0` fail before a complete
49,357-variable map can be defined:

| target | tempting label map | selected-row images absent from target surface |
|---|---:|---:|
| `s2_o9` | `0 <-> 9` | 12 |
| `s3_o0` | `2 <-> 3` | 194 |
| `s3_o9` | both swaps | 194 |

For example, under `0 <-> 9`, the legal center-2 support `{1,6,9,10}` would
have to map to `{0,1,6,10}`, which is not a legal center-2 candidate. Thus
there is no total semantic variable map to authenticate on the clause
multisets. This refutes certificate transport by exact label renaming; shell
metadata alone had misleadingly suggested those swaps.

### (b) Common prefix plus four assumptions/cases: REFUTED as replay elimination

The strong structural premise is **PROVEN**:

- all four CNFs have 49,357 variables and 1,370,778 clauses;
- 1,370,732 clause positions are byte-identical in all four files;
- exactly 46 positions per case differ; and
- the first 387,856 clauses form an exact byte-identical prefix.

The 46 case positions are exactly:

| 1-based clause range | count | block |
|---|---:|---|
| 387857 | 1 | inherited shell-choice clause |
| 494815--494849 | 35 | first-apex named exact-five entire class |
| 585249--585258 | 10 | first-apex exact-five global-equality seeds |

The scan partitions every clause position into the common sequence or the
case delta; reinserting each delta at its recorded positions reconstructs that
original CNF byte-for-byte. Pairwise differing-position counts are 46 for
`s2_o0/s2_o9` and `s3_o0/s3_o9`, 17 for `s2_o0/s3_o0` and
`s2_o9/s3_o9`, and 45 for the other two pairs.

This decomposition can share CNF materialization and the semantic bridge, but
it does not transport UNSAT. A coordinator theorem with four verified
certificate hypotheses still causes four certificate normalizations upstream;
with four unverified assumptions it is only conditional bookkeeping. Hence
common-prefix sharing alone does not avoid four expensive kernel replays.

It is currently **UNKNOWN** whether the 1,370,732-clause common core is itself
UNSAT. The existing verification summaries report core sizes but not the
identities of retained input clauses. Testing that would require a fresh
solver/checker run and was deliberately excluded from this audit.

### (c) One combined selector CNF/certificate: PROVEN construction, not yet certified

Let `C` be the 1,370,732 common clauses and let `D_i` be the 46-clause delta
for case `i`. Introduce fresh selectors `s_i` and form

`G = C AND (s_1 OR s_2 OR s_3 OR s_4)
       AND, for every i and d in D_i, (NOT s_i OR d)`.

No at-most-one constraints are needed. This exact four-case combined CNF has:

- 49,361 variables;
- 1,370,917 clauses; and
- 184 guarded delta clauses plus one selector-totality clause.

The reduction is logically exact:

`UNSAT(G) <-> for every i, UNSAT(C AND D_i)`.

If one case were satisfiable, extend its valuation by making only its selector
true to satisfy `G`. Conversely, any valuation of `G` selects at least one
case and hence satisfies that case's complete delta, contradicting its UNSAT
status. Therefore one externally authenticated certificate for `G`, replayed
once in the kernel, can soundly produce all four case theorems.

This is a **PROVEN CNF/theorem reduction**, not a present certificate result.
No combined CNF was emitted, no proof was generated, and no kernel replay was
attempted here.

## Least-cost sound kernel plan

Preserve and finish the already-running `s2_o0` ingress replay. For the three
remaining cases, use the analogous three-selector formula

`G_3 = C AND (s_2 OR s_3 OR s_4)
          AND guarded(D_2) AND guarded(D_3) AND guarded(D_4)`,

which has 49,360 variables and 1,370,871 clauses. Generate and externally
verify one certificate for `G_3`, then perform one kernel replay and use the
small selector-extension theorem to obtain the three individual UNSAT
theorems. This gives two total kernel replays including the work already in
flight, without trusting an isomorphism or hiding a case behind an assumption.

Before committing to certificate emission, benchmark the combined proof
outside Lean with a strict resource cap. The available independent DRAT files
are approximately 28 MB, 34 MB, 57 MB, and 126 MB, and their verified cores
grow from 81,253 to 203,437 input clauses; a naively concatenated/guard-lifted
proof could be much larger than the shortest replay. If `G_3` does not produce
a tractable checked certificate, the sound fallback is three separate
ingresses sharing the single common-clause definition. Structural sharing
reduces source/materialization duplication but does not change the honest
three-replay status.

The only potentially cheaper route is first proving the common core `C`
itself UNSAT. That status is currently unknown and must not be inferred from
the four case certificates.

## Exact input identities

| case | CNF SHA-256 |
|---|---|
| `s2_o0` | `94bc1ddb59166cc86e146c036ab7229a7eea878c28579e2df0520eec1b2a892d` |
| `s2_o9` | `bdd863e9d146cd64693d9c201f770b64b43082d34598d554434abcfd1bc50b57` |
| `s3_o0` | `062a4dc3659894758daf047119207f4889d5372d5a11d06c99a5b0ed656561d8` |
| `s3_o9` | `764ad8c855afde936150fd0bc422bc315b75311286fa15cfb3cb8dff23b739ee` |
