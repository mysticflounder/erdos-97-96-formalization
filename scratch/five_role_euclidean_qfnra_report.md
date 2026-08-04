# Five-role endpoint exact Euclidean QF_NRA audit

**Status: bounded local named-geometry diagnostic only. No Lean theorem and no full P97 realization is claimed.**

## Result

All 120 source-faithful M/B insertions were audited: **22 SAT**, **82 UNSAT by a necessary strict-Kalmanson core**, and **16 UNKNOWN**.

Every SAT lane has rational planar coordinates, all 35 exact strict orientations, exact Fraction readback of every named metric/cap/cardinality/multiplicity constraint, and SAT replay of the fixed witness in both Z3 4.17.0 and cvc5 1.3.3. The SAT result is a constructive producer for the bounded named model only.

The UNSAT lanes inherit the source packet's exact-rational Z3 QF_LRA cores. They obstruct Euclidean realization because strict convex cyclic Euclidean distances satisfy the strict Kalmanson inequalities; finite homogeneity permits the packet's gap-1 normalization. These are solver-trusted cores, not independently checked proof certificates.

The UNKNOWN lanes survived the abstract packet, yielded no rational witness in the five-parameter open-cell search, and returned UNKNOWN under 60-second Z3 / 30-second cvc5 exact parametric QF_NRA runs. No infeasibility is inferred.

## Smallest returned witnesses

These are the smallest among the constructed witnesses under the JSON's stated coefficient-height ordering; no global minimality is claimed.

- `A=J` / `OAKXC`: `OAKXMBC`, size `{'max_abs_numerator': 202091232, 'max_denominator': 220863565, 'sum_abs_numerators': 256891834}`, coordinates `{'O': {'x': '0', 'y': '0'}, 'A': {'x': '1', 'y': '0'}, 'C': {'x': '-109969/117169', 'y': '40440/117169'}, 'M': {'x': '41/841', 'y': '840/841'}, 'K': {'x': '344307/117169', 'y': '40440/117169'}, 'X': {'x': '19986158/10662379', 'y': '7518470/10662379'}, 'B': {'x': '-26759936/44172713', 'y': '202091232/220863565'}}`
- `A=J` / `OCXKA`: `OCXBKMA`, size `{'max_abs_numerator': 9571897, 'max_denominator': 9268545, 'sum_abs_numerators': 12348404}`, coordinates `{'O': {'x': '0', 'y': '0'}, 'A': {'x': '-63/65', 'y': '16/65'}, 'C': {'x': '1', 'y': '0'}, 'M': {'x': '-21079/25129', 'y': '13680/25129'}, 'K': {'x': '35473/280865', 'y': '533904/280865'}, 'X': {'x': '9571897/9268545', 'y': '1026976/9268545'}, 'B': {'x': '36475/75387', 'y': '1108840/678483'}}`
- `X=C` / `OCAKJ`: `OCBMAKJ`, size `{'max_abs_numerator': 489947, 'max_denominator': 487835, 'sum_abs_numerators': 1095022}`, coordinates `{'O': {'x': '0', 'y': '0'}, 'C': {'x': '1', 'y': '0'}, 'J': {'x': '-63/65', 'y': '16/65'}, 'M': {'x': '7473/11345', 'y': '8536/11345'}, 'K': {'x': '-19191/20345', 'y': '8192/20345'}, 'A': {'x': '53971/386555', 'y': '285388/386555'}, 'B': {'x': '489947/487835', 'y': '222244/487835'}}`
- `X=C` / `OJKAC`: `OJKAMBC`, size `{'max_abs_numerator': 27310757, 'max_denominator': 31709275, 'sum_abs_numerators': 50474584}`, coordinates `{'O': {'x': '0', 'y': '0'}, 'C': {'x': '-63/65', 'y': '16/65'}, 'J': {'x': '1', 'y': '0'}, 'M': {'x': '-334223/737425', 'y': '657336/737425'}, 'K': {'x': '20617/20345', 'y': '3216/20345'}, 'A': {'x': '17939/386555', 'y': '289892/386555'}, 'B': {'x': '-27310757/31709275', 'y': '21840524/31709275'}}`

## Boundary

The model includes only named planar points and the source-recorded named equalities, exclusions, shell cardinalities, cap/Sigma-B coupling, and named pair/triple multiplicities. It does **not** encode the existential anonymous O-centered deletion rows or their overlap ≤2 with the now-identified exact Sigma_A/Sigma_B rows. Anonymous shell fillers, physical cap/MEC geometry, the full ambient carrier, and global no-K4 are also absent. Therefore SAT means local named geometry only.

P1/P2 are not assumed. Translation/rotation/scale are normalized soundly by fixing O=(0,0) and the next cyclic role=(1,0); rational witnesses use the exact similarity `z ↦ conjugate(next)·z/|next|²`.

Machine-readable results: `scratch/five_role_euclidean_qfnra_results.json`. Fixed-witness SMT-LIB: `scratch/five_role_euclidean_qfnra_witness_instances/`.
