# Wave manifest

Terminal status: `TERMINAL` — exhaustive finite wave completed; no successor
wave started.

## Scope and case matrix

- Source arm: the mixed/no-shift arm after
  `exists_escaping_shift_or_mixedConfinedAuditPacket`; this wave does not cover
  the escaping-shift alternative or the whole live hard residual.
- Finite representation: eight distinct labels `p,q,u,a0,a1,t1,t2,t3`.
- Rows: the six centers `u,a0,a1,t1,t2,t3`.
- Case matrix: all 64 fixed mode vectors in `{Q,S}⁶`.
- This wave covers all 64 arms once and starts no successor wave.
- Per-SMT-call timeout: 30 seconds.
- Global core lease: 1 local runner; no concurrent solver fleet.
- Niceness: inherited interactive-shell default.
- Exact readback: independent support-domain reconstruction and enumeration.
- Engines: Z3 and cvc5 on the same per-mode QF_LIA formulas.

## Source and schema hashes

```text
c4e990e681a3eac784386cd443bf82d664cf90264d9df42e12b8037995cb7d64  lean/Erdos9796Proof/P97/U3ToU5MixedExtraction.lean
30392ce5811290306dcb95496c697d36467cd5c943cd6a6e1370a052bcf72a79  ../enumerate_u3_packet.py
0f17c985b23e14e02ab9c5d8a7aabce414d9587676c34512d5e8ef222c7a5a84  enumerate_successor.py
1b403ee725329736a372c7caa2520c57dcf46e84691d8f6539a1731dabad7df2  readback.py
3b6276f5e9d15bca8e9c53828b153f04d034e58b5fe92f2964b8c5e7779b79db  analyze_wave.py
3d1e3550feb7a0ddd86cd12059b3fe12c5c4c0c2c986aba22ec45c9572b09325  results.json
8ec679bcef8f2222e699e9fcaa6ca8c265cb68d2b4e1e6347adea02567498249  analysis.json
```

## Cut admission record

1. Lean theorem:
   `Problem97.U3ToU5MixedExtraction.MixedSixRowPatternWithDangerousCircle.shell_p_at_most_two`.
2. Exact antecedent: a canonical `MixedSixRowPatternWithDangerousCircle`
   extracted from a `U3FixedTripleAuditFrame.MixedConfinedAuditPacket`. The
   source field universally forbids, for every three pairwise-distinct audited
   centers, the conjunction that all three rows have mode
   `criticalFourShell` and label `p` lies in all three supports.
3. Active schema arm: every fixed mode vector with at least three `S`
   positions; within each such arm it enforces that at most two `S`-row
   supports contain `p`.

No other cut or unsourced clause is added. The pre-existing row-domain and
pairwise-overlap constraints are inherited byte-for-byte through the parent
runner's domain constructor.

## Claim boundary

This wave can establish only exhaustive SAT/UNSAT within the encoded finite
support abstraction of the mixed/no-shift arm. It does not prove realizability, a geometric
counterexample, a universal lift, or closure of the live Lean residual.
