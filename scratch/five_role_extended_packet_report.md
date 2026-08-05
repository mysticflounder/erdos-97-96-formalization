# Eight-role endpoint packet diagnostic

**Status: bounded solver diagnostic only. No Lean theorem or Euclidean realization is claimed.**

This extends the existing five-role miners to the named packet `O,C,M,K,A,B,J,X`,
quotiented by `A=J` or `X=C`. Unlike the prior extension, every ordered quadruple
of the seven distinct representatives receives both strict Kalmanson inequalities.

## Result

**Neither residual order pair is eliminated. P1/P2 is never forced.** Each of
the four five-role residuals has SAT seven-role insertions; in every branch/residual
seven insertions admit both P and not-P, while a few other SAT insertions refute P.

### A=J

- `OAKXC`: 30 insertions checked under the cap model; 7 SAT/independent, 3 SAT/refuted, 20 UNSAT/vacuous.
  SAT orders: `OAKXCBM`, `OAKXMBC`, `OAKMXBC`, `OAKMBXC`, `OAMKXBC`, `OAMKBXC`, `OMAKXBC`, `OMAKBXC`, `OMABKXC`, `OMBAKXC`
- `OCXKA`: 30 insertions checked under the cap model; 7 SAT/independent, 3 SAT/refuted, 20 UNSAT/vacuous.
  SAT orders: `OCXKABM`, `OCXKBAM`, `OCXBKAM`, `OCXBKMA`, `OCXBMKA`, `OCBXKAM`, `OCBXKMA`, `OCBXMKA`, `OCBMXKA`, `OMBCXKA`

### X=C

- `OCAKJ`: 30 insertions checked under the cap model; 7 SAT/independent, 2 SAT/refuted, 21 UNSAT/vacuous.
  SAT orders: `OCAKJBM`, `OCAKBJM`, `OCAKBMJ`, `OCABKJM`, `OCABKMJ`, `OCBAKMJ`, `OCBAMKJ`, `OCBMAKJ`, `OMBCAKJ`
- `OJKAC`: 30 insertions checked under the cap model; 7 SAT/independent, 2 SAT/refuted, 21 UNSAT/vacuous.
  SAT orders: `OJKACBM`, `OJKAMBC`, `OJKMABC`, `OJMKABC`, `OJMKBAC`, `OJMBKAC`, `OMJKBAC`, `OMJBKAC`, `OMBJKAC`

The JSON contains an exact rational witness for every SAT lane and a tracked Z3
core for every UNSAT lane, separately for the baseline, the proposed equality,
and its negation. Thus `forced` means baseline + negated P1/P2 is UNSAT;
`independent` means both the equality and its negation have witnesses.

## Encoded source abstraction

- `Sigma_A`: center `A`, `C,K` in, `A,M` out, full support cardinality four.
- `Sigma_B`: center `B`, `C,M` in, `B,K` out, and closed-cap intersection exactly `{C,M}`.
- `Sigma_X`: center `X`, `J,K` in, `X` out, full support cardinality four.
- `Q.row`: O-centered selected four-subset with `C,J` in and `O` out; it is not treated as a full O-shell.
- `C,M,K,B` are in the closed first cap, `O` is out, and all named cap members are cyclically contiguous.
- Every named pair has at most two named equidistant centers; `{C,M}` is saturated by `O,B`. Every named triple has at most one named equidistant center.

## Deletion packets and omissions

The delete-`M` packet at centers `O,A` and delete-`K` packet at centers `O,B`
are represented in JSON by anonymous four-support witnesses with overlap two.
They do not constrain named cyclic order because the source forces no additional
named membership in those erased rows.

- No Euclidean coordinates, Cayley-Menger/planarity constraints, orientations beyond Kalmanson, or global A-carrier realization.
- Unknown cap membership of A/J/X is existential; it is not guessed outside the cap.
- Q.row is only a selected four-subset: C,J are named members and O is its center; no other named membership is asserted.
- The two erased deletion rows have no source-forced named memberships, so only separate decoupled local support shapes are recorded, not a simultaneous global ambient-carrier witness.
- Multiplicity is enforced only among named representatives, not anonymous support fillers or the full ambient carrier.
- UNSAT cores are tracked Z3 cores, not independently checked proof certificates; no second solver backend was run.

## Source anchors

- `RetainedMatchingCommonDeletionCycle.lean:66-116` supplies the two-step walk, retained cap/radius facts, and the `M`/`K` shell omissions.
- `RetainedMatchingEndpointContinuation.lean:76-145,186-205` supplies `C,K,J`, `Q.row`, the retained O-radius, and the `Sigma_X` cross shell.
- `CommonDeletionTwoCenter.lean` supplies the erased two-center packet contract.
- `EndpointFreshFiveRoleKalmanson.lean` supplies the branch equalities and five-role residual schemas reused by the prior miners.

Machine-readable artifact: `scratch/five_role_extended_packet_results.json`.
