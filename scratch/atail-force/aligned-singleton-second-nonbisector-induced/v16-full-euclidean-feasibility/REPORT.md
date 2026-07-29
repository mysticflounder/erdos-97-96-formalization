# Frozen v16 full Euclidean feasibility

## Classification

`VALIDATED_UNSAT`.

The frozen 19-quotient-class positive-row system has no strictly convex planar
realization in its prescribed cyclic order.  The obstruction already occurs on
the induced quotient-class subset

```text
(5, 7, 9, 10, 11, 12)
```

so any putative 19-class realization would restrict to an impossible
six-class realization.

This is a Euclidean feasibility classification of the frozen positive-row
survivor.  It is not by itself a replayed CEGAR cut, a Lean theorem, or closure
of a production `sorry`.

## Exact obstruction

The six induced source equalities are:

```text
16: d(5,7)  = d(5,12)
19: d(5,9)  = d(5,11)
22: d(5,10) = d(9,10)
23: d(5,10) = d(10,11)
34: d(7,11) = d(11,12)
36: d(9,10) = d(10,11)
```

Source 36 is a transitive duplicate of sources 22 and 23.  Thus the obstruction
uses the five-equation basis `{16,19,22,23,34}`.

The direct six-point QF_NRA encoding uses the similarity gauge
`q5=(0,0), q10=(1,0)`, all strict cyclic-orientation constraints, and the exact
distance equalities.  cvc5 returns `UNSAT` on this unreduced formula.

An independent normalized encoding sets

```text
q9  = (u,-v)
q11 = (u, v)
q7  = (a, b)
q12 = (c, d)
```

The first circle forces `u^2+v^2=2u`, while the two sides of chord `q9-q11`
force `0<u<1` and `v>0`.  The second equal-radius pair is encoded exactly as
reflection across line `q5-q11` using two polynomial equations without
division.  The retained cyclic determinants then make the first angular gap
both greater than and less than 90 degrees.  Z3 and cvc5 independently return
`UNSAT` on that normalized QF_NRA formula.

## Minimality

The obstruction is vertex-minimal relative to the frozen 19-class system:
the completed exact-subset census checked all `11628` five-class subsets and
found every one exact `SAT`.

Equality-deletion minimality is not fully established.  Removing source 36 is
sound because it is transitive.  Of the five remaining basis equalities,
deleting source 34 has an exact Z3 `SAT` model that passes substitution, while
the four other deletion checks remain fail-closed `UNKNOWN`.  Do not call the
five-equation basis deletion-minimal without finishing those four witnesses.

## Artifacts

- `core6-rebased.smt2` / `core6-rebased.json`: direct six-point formula; cvc5
  `UNSAT`, Z3 timed out.
- `core6-normalized-obstruction.smt2` /
  `core6-normalized-obstruction.json`: exact normalized obstruction; Z3 and
  cvc5 both `UNSAT`.
- `core6-equality-minimality.json`: equality-deletion audit, including the
  explicit `UNKNOWN` results.
- `v16-euclidean-probe.json`: original full 19-class exact probe, which timed
  out and was correctly classified `UNKNOWN_FAIL_CLOSED`.
- `v16-numerical-fit.json` and `edge-turn-fit.json`: numerical leads only; they
  are not used as proof evidence.

Input and principal artifact SHA-256 digests:

```text
4305fde6500059ef45b268fe09bd99edd3e3ea63386e162b6524ce27e0ef61a3  cegar-v16-local-critical-reuse-second.json
a6d51eabb1c4cdf0aeaef3aa99f1cdff4825cf7beef3f121277a2e370704e280  v16-exact-subset-mining/terminal-summary.json
1ff35e6f229a098892343477c2b4d00be1e79445aa5b221cfe7046ef138c89cb  core6-rebased.json
34a8fe14543c19186630d19d66ff7bc7d38a1c042f7d6b9c95aa7419b86b41e5  core6-rebased.smt2
34f2ed653f35911690f098ac73fc4752341413ae4c83e55f15b33091536b1ccf  core6-normalized-obstruction.json
0a14b85156a85becf1069f4655e3dea94628eb28b28a7de2f7a4abc706953535  core6-normalized-obstruction.smt2
26d97335eb7656e9690a6ac8733261599c056321eafd72a2886c4854565c31e7  core6-equality-minimality.json
```

## Promoted constraint and replay boundary

The six-point mirror-interleaving obstruction has been promoted as a
kernel-checked geometric lemma:

```text
strictConvex cyclic order (q5,q7,q9,q10,q11,q12)
∧ d(5,7)=d(5,12)
∧ d(5,9)=d(5,11)
∧ d(5,10)=d(9,10)
∧ d(5,10)=d(10,11)
∧ d(7,11)=d(11,12)
→ False
```

`Problem97.SixPointEuclideanObstruction.
false_of_six_ccw_mirror_interleaving_row_equalities` follows the normalized
reflection argument above and has transitive axioms exactly
`[propext, Classical.choice, Quot.sound]`.  The v17 CEGAR detector wires the
five source rows to its ten-literal cut.  The self-test replays the exact
frozen v16 assignment, finds the intended tuple
`(a0,p2,r1,b2,r2,p1)`, proves that every cut literal is entailed, and makes
that assignment `UNSAT`.

The non-destructive v16-to-v17 migration preserved and revalidated all 100,000
older theorem-shaped cuts.  Its first resumed outer solve returned
`UNKNOWN_FAIL_CLOSED` after 615.16 seconds because Z3 timed out before finding
a next model; no v17 cut was banked.  Thus this report's six-point
classification is now converted into a checked local cut, but neither the
100,000-cut ledger nor the live Lean leaf is exhausted.  The next action is a
smaller local v17 replay followed by cyclic-order sharding or a similarly
sound outer-search decomposition.
