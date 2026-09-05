# RVOL defect-4 global stage

## Executive result

The next stage produced two sharply different conclusions.

First, the **local structural/order layer does not close the defect-four quotient**. In the completed preceding runtime, a path-ordered abstract selected-row family survived every implemented local cut at

\[
n=986,\;1031,\;1271,\;2076.
\]

Second, the **complete strict K2 layer does expose a genuine global obstruction**. At the smallest member of the same construction family, \(t=11,n=62\), an initially 106-term adjacent-K2 dependence telescopes to a compact exact certificate consisting of only **three ordinary K2 inequalities and five selected-row equalities**.

The compact certificate is the durable mathematical output of this stage. It is cardinality-independent and is ready to formalize as a generic boundary-order theorem.

## Evidence custody note

The high-cardinality structural run completed before this continuation, but its transient witness directory was not mounted into the continuation runtime. The aggregate counts below are recovered from the preserved execution checkpoint and are therefore **not presented as a fresh byte-level replay**. This limitation is recorded in `artifacts/recovered-transient-execution-summary.json`.

By contrast, the three-K2 certificate, its 106-term telescoping identity, and the scan over the 62 retained prior high-\(n\) witnesses were reconstructed and independently checked in the current runtime.

## 1. Defect-four structural frontier

For \(t=|A\setminus C|\), the sharp source-backed cap-capacity boundary is

\[
|C|+4=\binom t2,
\qquad
n=|C|+t=\binom{t+1}2-4.
\]

The completed global construction used a Hamiltonian path through the outside-pair blocks, with nearby blocks disjoint, and a globally optimized cap-inside labeling. The resulting full abstract row systems had one four-point row at every center.

| \(t\) | \(n\) | row-intersection graph triangles | six-role Berge triangles | bad local 3-row Kalmanson certificates | sharp turns | modular Jacobian rank |
|---:|---:|---:|---:|---:|---:|---:|
| 44 | 986 | 555,144 | 17,056 | 0 | 0 | 1,969 = 2n−3 |
| 45 | 1,031 | 607,662 | 18,174 | 0 | 0 | 2,059 = 2n−3 |
| 50 | 1,271 | 919,264 | 24,585 | 0 | 0 | 2,539 = 2n−3 |
| 64 | 2,076 | 2,508,797 | 49,708 | 0 | 3 | 4,149 = 2n−3 |

Across all four cells the recovered verifier recorded:

- row cardinality four and center exclusion;
- all applicable selected-row/cap intersection bounds;
- pair-codegree one and row intersection at most one;
- no reciprocal row incidence;
- no equality-closure forced off-row fifth point;
- strong support connectivity and a bijective source-to-row matching;
- blocker-fiber size one;
- source non-omission clique number three, hence the seven-source mutual-omission conclusion;
- no occurrence of the six Wave-2b motifs or the additional six-role motif;
- no exact local three-row Kalmanson certificate.

A separately seeded sampled scan checked 2,000,000 K1/K2 inequalities across these four systems and found no zero or opposite vector. That is sampled absence only, not a complete Kalmanson-cone result.

The practical construction frontier was \(t=64,n=2076\). The \(t=80,n=3236\) attempt stopped with `UNKNOWN_RUNTIME_CAP`; it produced no satisfiability or impossibility conclusion.

## 2. Generic-rank diagnostic

At each retained high-cardinality cell, two modular evaluations attained rank

\[
2n-3,
\]

the generic maximum allowed by two translations and one rotation. At an actual equal-distance realization, uniform scaling supplies another infinitesimal motion, so its Jacobian must have rank at most \(2n-4\). Consequently, any genuine realization of these abstract incidence systems would have to lie on a non-generic rank-drop locus.

This is a useful algebraic warning, not a nonrealizability proof.

## 3. Complete K2 probe at \(n=62\)

The local motif bank missed the obstruction because it is initially spread over a large portion of the boundary. Define the adjacent K2 margin

\[
\Delta(i,j)=d(i,j)+d(i+1,j+1)-d(i,j+1)-d(i+1,j).
\]

Strict convex Kalmanson order gives \(\Delta(i,j)>0\). The probe found an exact positive dependence formed by

\[
\sum_{j=5}^{50}\Delta(2,j)
+\sum_{j=5}^{50}\Delta(3,j)
+\sum_{j=54}^{55}\Delta(4,j)
+\sum_{i=5}^7\sum_{j=52}^{55}\Delta(i,j).
\]

There are 106 terms. Exact integer telescoping reduces this sum to three ordinary K2 margins.

## 4. Compact three-K2 / five-row certificate

Use the eight ordered labels

\[
2<4<5<8<51<52<54<56.
\]

The three strict inequalities are

\[
\begin{aligned}
K2(2,4,5,51):\;&d(2,5)+d(4,51)>d(2,51)+d(4,5),\\
K2(4,5,54,56):\;&d(4,54)+d(5,56)>d(4,56)+d(5,54),\\
K2(5,8,52,56):\;&d(5,52)+d(8,56)>d(5,56)+d(8,52).
\end{aligned}
\]

Five selected rows give

\[
\begin{aligned}
d(2,5)&=d(2,51),\\
d(4,51)&=d(4,56),\\
d(54,4)&=d(54,5),\\
d(5,4)&=d(5,52),\\
d(8,52)&=d(8,56).
\end{aligned}
\]

After distance symmetry, summing the three strict inequalities and substituting these five equalities gives \(0>0\).

Current-runtime verification:

```text
three K2 inequalities:       3
selected-row equalities:     5
adjacent K2 terms:           106
adjacent telescoping exact:  true
reduced coefficient vector:  zero
independent verifier:        PASS
```

Certificate file SHA-256:

```text
d915fd7e682a793063edff1bc5bda5b613ba00919130dc87b7cc8e47709c730c
```

## 5. Theorem-bank audit

ProofRelay97’s source audit in nthdegree message **8850** found no existing theorem dedicated to this exact three-K2 cycle. The reusable ingredients are:

- `Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw`, supplying each arbitrary-cardinality K2 inequality;
- `Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`, a smaller two-K2 consumer;
- `Problem97.TwoKalmansonEqualityChainBridge.false_of_five_selected_rows_two_kalmanson_chain`, a five-row/two-K2 chain;
- `Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`, which can consume arbitrary checked weighted cancellation data but is unnecessary for this compact specialization.

The recommended new theorem is

```text
Problem97.CapCrossingKalmansonBridge.
  false_of_five_selected_rows_three_k2_cycle_of_eight_order
```

with eight increasing boundary indices, five `SelectedFourClass` rows, and the ten support memberships listed in `three-k2-five-row-lean-handoff.md`. Its proof should be three applications of the existing K2 inequality followed by the five row equalities, distance symmetry normalization, and `linarith`.

## 6. How far the certificate reaches

The concrete eight-role pattern was scanned exactly in the **62 retained witnesses** from the previous high-\(n\) experiment, in both direct and reflected orientations. It occurred in **0** of them. The additional injected control also contained no occurrence.

Therefore the theorem is a genuine new obstruction schema, but it does **not** by itself eliminate the earlier high-\(n\) A-ROW witness family. A source-level occurrence or coverage producer remains the load-bearing next step.

## 7. Formalization priorities

1. **Formalize the compact three-K2 theorem.** Do not formalize the 106-term certificate separately; it is only a discovery/telescoping provenance record.
2. **Add cyclic-shift/reindex wrappers only as needed.** The core theorem should stay in an increasing eight-index form.
3. **Build a generic occurrence miner.** Search for three K2 margins whose coefficient sum closes through five selected-row classes, rather than matching one frozen role pattern.
4. **Seek a defect-four occurrence producer.** The real high-\(n\) question is whether tight ordered-cap pair counting and its equality conditions force some member of this or a related three-K2 cycle bank.
5. **Retain the sharp-turn theorem as a secondary target.** It is useful preprocessing, but the complete K2 certificate is now higher leverage.

## 8. Claim boundary

Nothing in this stage constructs Euclidean coordinates, a literal `CriticalShellSystem`, a genuine MEC/Moser packet, deletion blocking, `CounterexampleData`, or minimality. The high-cardinality systems are abstract selected-row shadows. The compact theorem is an exact conditional geometric contradiction once its boundary-order and row-membership hypotheses are supplied.

The stage therefore establishes a **new generic theorem target and a sharper computational frontier**, not RVOL or Problem 97 closure.
