# Round 6 four-point EDM CEGAR report

## Scope and trust boundary

This is a target-specific exact-`n = 15` experiment for
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It extends the frozen round-5 schema-v3 abstraction and probes only
`paired_DDD_k0_d1` and `fresh_DDD_k0_d2_f1`.

The outcome is external Z3 evidence.  It is not a Lean theorem, it is not a
general-`n` result, and it does not close the target.  In particular, an
`UNKNOWN` result excludes nothing.

## Added sound relaxation

For every four carrier points and every balanced partition into a positive
pair `{p0,p1}` and a negative pair `{n0,n1}`, schema v4 adds

```text
s(p0,p1) + s(n0,n1)
  <= s(p0,n0) + s(p0,n1) + s(p1,n0) + s(p1,n1).
```

For `b = (+1,+1,-1,-1)` this is `b^T S b <= 0`, after cancelling a
factor of two.  If `s(i,j) = ||x_i-x_j||^2` in an actual Euclidean
realization, then

```text
b^T S b = -2 ||sum_i b_i x_i||^2 <= 0,
```

because `sum_i b_i = 0`.  There are three balanced partitions modulo global
sign for each four-set, so the exact added count is
`3 * C(15,4) = 4095`.

The round-5 equality transport remains intact:

```text
d(c,x) = d(c,y) -> s(c,x) = s(c,y).
```

Its exact count is 1,365.  The `s` variables remain independent positive
variables: the encoding deliberately does **not** assert the nonlinear
equations `s(i,j) = d(i,j)^2`.  This is still a sound necessary-condition
relaxation because every actual Euclidean realization supplies a satisfying
assignment to `s` by using its true squared distances.

The structural self-test passed.  It checked the two exact constraint counts,
verified that all newly added constraints mention only `s_` variables, checked
the inequality on a Euclidean square, and exhibited a fake squared-distance
assignment rejected by the new family.

## Fixed smoke results

Run directory:
`artifacts/20260801T220044.186415Z-smokes-pid93606/`

The run used Z3 4.15.3, one solver thread per case, two cases concurrently,
and a 300,000 ms timeout per case.

| Case | Status | Solver time | Constraints | Encoding SHA-256 |
| --- | --- | ---: | ---: | --- |
| `paired_DDD_k0_d1` | UNKNOWN (`canceled`) | 300.025 s | 17,785 | `0fcef2c77635d102bddcdd95fd669ec9f620eb229927e78617c06f635121cc15` |
| `fresh_DDD_k0_d2_f1` | UNKNOWN (`canceled`) | 300.016 s | 17,793 | `adc479280d32e9f27e95e4bedaad04baaacc7cb41cbb5af3136867c22422301c` |

Both cases reached the timeout.  There is therefore no UNSAT core, no model,
and no closure claim.  The corresponding schema-v3 probes were also UNKNOWN
at about 122 seconds; the longer schema-v4 run does not establish whether the
new inequalities materially change eventual decidability.

## Provenance

| Artifact | SHA-256 |
| --- | --- |
| frozen round-5 runner | `451aae82966ddea02fa81da2d656415cf4e942e9ba7b2eefc96c915f7d62e857` |
| round-5 schema | `6df622330bcc9026910acc77aae9b0a0d811798ed0f53bcdd3223dec871f7301` |
| round-5 `uv.lock` | `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c` |
| round-6 wrapper | `6b973a248d6f909c6834ccdcf83c299602a3787ccb0258cd1f7086265420234c` |
| round-6 schema overlay | `13c4f3d6e535a7d30c12ed0dee33ce7e2471977b4ccf09cef0c8920942ecc9ea` |

The wrapper refuses to run if the frozen base-runner hash changes.  Each
invocation and result records these hashes, the solver configuration, the
constraint-family counts, and the compressed SMT encoding.

## Conclusion

The four-point Schoenberg family is now implemented and auditable in the
exact-`n = 15` target abstraction.  It is mathematically sound and preserves
the schema-v3 abstraction boundary, but this two-case smoke did not classify
either hard DDD case.  The evidence supports retaining the family for future
CEGAR rounds; it does not justify promoting a theorem or claiming progress on
the live Lean obligation by itself.
