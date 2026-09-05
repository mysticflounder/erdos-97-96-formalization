# P97 card-14 selected-support adapter checkpoint

**Date:** 2026-09-03  
**Objective:** unblock the Wave-3 source-faithful card-14 rerun by bridging one-hot K4 support selectors to the complete four-orbit Kalmanson no-good bank.  
**Status:** adapter core, host shim, base-CNF replay, merged-CNF generation, exact unit-refutation checker, adversarial tests, and a full 10,010-selector smoke packet are complete. The current repository-specific profile encoder has not been modified or run in this environment.

## 1. Implemented bridge

`selected_support_adapter.py` introduces, for each bank-used center/pair triple,

```text
P(c;p,q) := “the one-hot selected support at center c contains p and q”.
```

For every original selector `K4(c,S)` with `{p,q} ⊆ S`, the patch adds

```text
¬K4(c,S) ∨ P(c;p,q).
```

Every forbidden three-row Berge triangle is then one width-three clause

```text
¬P(c0;p0,q0) ∨ ¬P(c1;p1,q1) ∨ ¬P(c2;p2,q2).
```

Auxiliary variables occur only negatively in geometric no-goods. Consequently, every geometrically admissible base selector assignment has a canonical extension, while a forbidden selected-row pattern forces its three auxiliary variables true and contradicts the corresponding no-good.

Replay never trusts the auxiliary variables to describe supports. It decodes exactly one original selector at every center, derives all pair-pattern values from those supports, and rejects any supplied auxiliary value that disagrees.

## 2. Base formula custody

The adapter can now replay an actual host base CNF as well as the geometric patch:

- the supplied base CNF bytes must match `layout.base_cnf_sha256`;
- its DIMACS variable ceiling must equal the frozen base ceiling;
- the raw SAT assignment must satisfy every base clause;
- selector decoding then runs from that same assignment;
- a combined CNF can be emitted with the final variable and clause counts.

The smoke packet does **not** contain the vanished historical 12.8-million-clause profile CNF. Its `known-base.cnf` is a deterministic frozen-model fixture containing 10,010 unit clauses that pin every candidate selector to the authenticated maximal support map. This is sufficient to prove the adapter gate and exact rejection, but it is not a profile-wide rerun.

## 3. Full-size n=14 gate

The smoke harness instantiated all

```text
14 * choose(13,4) = 10,010
```

selected-four candidates. Using the historical base variable ceiling `14,313`, the complete patch has:

| Quantity | Exact value |
|---|---:|
| Pair-pattern variables | 1,078 |
| Selector-to-pattern implications | 59,290 |
| Four-orbit geometric no-goods | 120,120 |
| Total patch clauses | 179,410 |
| Frozen selector-fixture clauses | 10,010 |
| Combined smoke clauses | 189,420 |
| Final variable ceiling | 15,391 |

The full four-orbit bank SHA-256 is

```text
7b1d51ea495c424fbc43fd1387d9e3b15c00a970c3e691bcc3052004225d3fb7
```

The current full-scale layout SHA-256 is

```text
32a59bc6d729401bb10cd54e49b6f1a5c4da76a820a2ffc7731cf0aee8993620
```

The current full-scale patch SHA-256 is

```text
dda057f61e0ff91a027e3167629eaab485ee82f534ceb31dd453fca3a1761716
```

## 4. Exact rejection of the authenticated maximal witness

The maximal `firstOppositeO1Six` support map:

- satisfies and exactly replays the 10,010-clause frozen selector fixture;
- decodes exactly one four-support at all fourteen centers;
- violates exactly **44** semantic bank clauses;
- has exactly 44 failing compiled no-goods under the canonical auxiliary extension.

The merged 189,420-clause smoke CNF has an independently checked **seven-clause unit-propagation refutation**:

```text
selector at center 3 chooses {4,6,11,13}
selector at center 4 chooses {1,5,8,11}
selector at center 5 chooses {0,3,6,8}

therefore P(3;6,11)
therefore P(4;8,11)
therefore P(5;6,8)

but ¬P(3;6,11) ∨ ¬P(4;8,11) ∨ ¬P(5;6,8).
```

The proof is stored in `smoke-output/unit-propagation-proof.json`; it contains the seven literal clauses, variable decoding, assignments, reasons, and the combined-CNF hash. Its file SHA-256 is

```text
4337e81fd06b41e38400345990a21b6664820ce58a6afb2dc54d8b2f7dd5adad
```

This is an exact CNF-level regression certificate for one historical model, not a profile UNSAT proof.

## 5. Verification

Twenty unit/adversarial tests pass. They cover:

- complete bank and patch counts;
- deterministic patch identity;
- exact 44-violation semantic/CNF replay;
- selector-only, base-CNF, and geometric-bank verdict separation;
- base CNF digest, header, and clause replay;
- combined CNF header/count correctness;
- forged auxiliary-value rejection;
- malformed support and duplicate selector rejection;
- bank digest tampering;
- cyclic-order mismatch;
- DIMACS patch correctness;
- raw-model custody binding;
- host-shim clause streaming;
- missing-center fail-closed behavior;
- independent unit-propagation conflict and no-conflict controls.

`verify_adapter_bundle.py` recompiles all scripts, reruns all twenty tests, regenerates the full-scale smoke in a fresh directory, compares eleven authoritative smoke artifacts byte-for-byte, and independently exercises the command-line build/merge/replay path. Current verification:

```text
PASS
verification SHA-256:
9a4c51b190dc91be7fce74f913a9d1954982357b82f792ede9e581d45beaa554
```

The non-authoritative runtime timing file is deliberately excluded from byte-identity checks.

## 6. Host integration boundary

The included `encoder_integration_shim.py` needs one map from the current profile encoder:

```text
(center, four-element support) -> one-hot selector variable
```

The host then supplies:

- the true profile cyclic order;
- the frozen base variable ceiling;
- base CNF bytes/hash;
- source revision and source-file hashes;
- its normal `add_clause` callback.

The shim validates and serializes the selector layout, allocates pair-pattern variables deterministically, and streams all implication/no-good clauses. A SAT result must preserve the raw total assignment bytes and the independently decoded center-to-support map.

The sealed Wave-1/2/3 archives contain no historical base profile CNF, and the current repository encoder source was not available as local bytes in this execution environment. No source file was therefore patched speculatively.

## 7. Next deterministic action

Against a current checkout:

1. expose the profile encoder's existing K4 selector map;
2. bind and replay the true base CNF;
3. add the shim and the two acceptance gates: uncut control plus known-model rejection;
4. regenerate `surplusS7` first;
5. preserve raw assignment bytes and decoded center-to-support map in the immutable run root;
6. add violated width-three cuts lazily or use the complete 179,410-clause patch;
7. iterate to authenticated SAT or proof-producing UNSAT;
8. audit any UNSAT core for dependence on exact card 14, cap exhaustion, in-label `k4_everywhere`, or global blockers before proposing a general theorem.

## 8. Claim boundary

Proved by executable replay here:

- the pair-pattern extension is deterministic and existentially conservative over the one-hot support selectors;
- it scales to all 10,010 n=14 selected-four candidates;
- it hashes and replays the base CNF, raw model, selector layout, bank, patch, and decoded support map;
- it compiles the complete 120,120-cut bank;
- it rejects the known maximal witness in exactly 44 places;
- one rejection has a seven-clause unit-propagation proof;
- the authoritative outputs regenerate byte-for-byte.

Not proved here:

- any of the six card-14 profiles is UNSAT;
- the current repository encoder has been patched;
- a new authenticated profile assignment has been generated;
- a finite result lifts to arbitrary cardinality.
