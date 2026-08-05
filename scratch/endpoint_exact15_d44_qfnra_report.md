# Exact-n=15 D44 endpoint Euclidean QF_NRA audit

**Status: bounded named-role solver diagnostic only. This is neither a Lean theorem nor a full 15-point Euclidean realization.**

## Result

The audit ran the exact seven-role Euclidean encoding on all **38** D44 cyclic-order lanes that survived the earlier QF_LRA profile filter.

- Z3: 0 SAT, 0 UNSAT, 38 UNKNOWN.
- cvc5: 0 SAT, 0 UNSAT, 38 UNKNOWN.
- Independently exact-validated rational SAT witnesses: 0.
- Cross-solver terminal disagreements: 0.

UNSAT labels are solver-trusted QF_NRA diagnostics, not proof certificates. Timeout and UNKNOWN lanes remain open and are never counted as UNSAT.

## Remaining UNKNOWN lanes

- `A=J` / `OAKXC` / `OAKXCBM`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OAKXMBC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OAKMXBC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OAKMBXC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OAMKXBC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OAMKBXC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OMAKXBC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OMAKBXC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OMABKXC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OAKXC` / `OMBAKXC`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCXKABM`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCXKBAM`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCXBKAM`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCXBKMA`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCXBMKA`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCBXKAM`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCBXKMA`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCBXMKA`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OCBMXKA`: Z3 `timeout`; cvc5 `unknown`.
- `A=J` / `OCXKA` / `OMBCXKA`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCAKJBM`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCAKBJM`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCAKBMJ`: Z3 `canceled`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCABKJM`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCABKMJ`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCBAKMJ`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCBAMKJ`: Z3 `canceled`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OCBMAKJ`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OCAKJ` / `OMBCAKJ`: Z3 `canceled`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OJKACBM`: Z3 `canceled`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OJKAMBC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OJKMABC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OJMKABC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OJMKBAC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OJMBKAC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OMJKBAC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OMJBKAC`: Z3 `timeout`; cvc5 `unknown`.
- `X=C` / `OJKAC` / `OMBJKAC`: Z3 `timeout`; cvc5 `unknown`.

## Exact witness checks

Every claimed SAT witness has rational coordinates and passes an independent Python `Fraction` evaluation of all base constraints plus `dist(O,K)=dist(O,B)` and `dist(O,C) != dist(O,K)`. The fully fixed witness is then replayed SAT in both Z3 and cvc5.

## Encoding and trust boundary

The imported encoding fixes O=(0,0) and the next cyclic role=(1,0), requires all 35 ordered triple orientations to be positive, and includes the recorded named metric equalities/inequalities, shell cardinality, cap/Sigma-B coupling, and named pair/triple multiplicity constraints. This audit adds only the two D44 radius facts.

It omits anonymous shell fillers, erased-row support coupling, physical cap/MEC geometry, full ambient 15-point completion, and global no-K4. Thus SAT is only a local named-geometry witness; UNSAT is conditional on the audited encoding-to-claim correspondence.

## Reproducibility

- Workers: 12 (maximum allowed: 12).
- Z3 timeout: 60 seconds per lane.
- cvc5 timeout: 30 seconds per lane.
- Z3 version: `4.16.0`.
- cvc5 version: `This is cvc5 version 1.3.3 [git 8ff882e on branch HEAD]`.
- Canonical 38-lane SHA-256: `f5611486803bff3e00bf2af12562a6a8ddfff13825abc87be9c3c6e9cae7fa79`.

Source SHA-256 hashes:

- `scratch/endpoint_exact15_profile_results.json`: `cd38800a7843878a50daaf70041ef1873e46e6bf7fb6cfb392a002bbed2ec40e`
- `scratch/endpoint_exact15_profile_miner.py`: `b43456c17a623d4b415b071a4949a04fc05613daebfa509e6cf5deadaa0e5079`
- `scratch/five_role_euclidean_qfnra_audit.py`: `60fb18a3e72b21b02f98ae23a77556d73ad5316d3080476eafc89d0588c861f3`
- `scratch/endpoint_exact15_d44_qfnra_audit.py`: `a76bca4860ef90815b57c739685c197cf0d5488540c60b87e55903922929f8cc`

Machine-readable results: `scratch/endpoint_exact15_d44_qfnra_results.json`.
SMT-LIB instances: `scratch/endpoint_exact15_d44_qfnra_instances/`.
