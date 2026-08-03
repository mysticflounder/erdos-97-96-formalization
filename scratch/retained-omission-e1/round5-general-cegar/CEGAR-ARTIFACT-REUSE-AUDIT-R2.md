# CEGAR artifact reuse audit (R2)

Date: 2026-08-02
Scope: retained omission-E1 / round5-general-cegar, exact-four/five algebra,
and the v26 PB-lowering/source-core pilot.  This is a source/artifact audit;
no Lean build, solver run, DRAT check, or production edit was performed.

## Live target and trust boundary

`FreshThirdNormalizedResidualCase` is the three-constructor packet in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9201`:

* `firstNonHit data`;
* `secondNonHit data`; and
* `equalCrossRowCenters firstHit secondHit centers_eq`.

`freshThirdNormalizedResidualCase_of_crossRowResidual` (lines 9219--9228)
is source-clean, but only turns the residual disjunction into this packet.  It
does not prove a contradiction.  The load-bearing consumer
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` (lines
9738--9749) remains `sorry`.  The distinct-center arm is already source-clean;
the first/second non-hit and equal-center arms still require a producer or
terminal.  Therefore an external finite SAT/SMT result cannot be promoted as
closure without a source-faithful adapter and a transitive kernel/axiom audit.

## Retained artifact census

| artifact | result | reusable mathematical interface? |
|---|---|---|
| `V21-FRESH-RESIDUAL-PROBE.md` | exact-n15 `(6,6,6)` selector relaxations all `unknown/canceled` | No model, core, or generalized cut. |
| `V22-BLOCKER-MINIMIZATION.md`, `V24-BATCH-BLOCKER-MINIMIZATION.md` | authenticated 55-fix replay; other fix counts fail-closed on timeout/UNSAT disagreement | External blocker evidence only; no minimality theorem or Lean ingress. |
| `V25-rich-profile-canonicalization.md` | 39 exact-n15 profile representatives; no solver/Lean producer | Pairwise rich-class intersection observations are already implied by `Problem97.eq_of_equidistant_three_noncollinear`; no critical-shell/apex witness is produced. |
| `N17-FRESH-THIRD-INCIDENCE-ROUND1.md`, `N17-FRESH-THIRD-CYCLIC-METRIC-ROUND2.md` | fixed n17 incidence and cyclic refinements SAT/unknown | No UNSAT cut or source-clean producer. |
| `N17-CONVEX-FIVE-POINT-CORE-ROUND3.md` | finite cyclic proxy reaches SAT after 5 rounds (323 cuts) | `universal_n_claim=false`; no metric Lean bridge. |
| `round5-core-mining/MINIMIZATION-REPORT.md` | 31-clause pure finite set-system core; exhaustive Python check (45^3 choices, 857 post-cut, zero failures) | Strongest candidate, but only a finite Boolean lemma. Needs Lean cardinality proof plus source-faithful construction of `R0,R1,R2,K7,K8` and nine parity terminals. |
| `round6-edm-cegar/REPORT.md` | exact-n15 EDM constraints; both DDD probes `UNKNOWN(canceled)` | Necessary-condition encoding, not a producer. |
| `round6-full-multiplicity-bank/REPORT.md` | full-shell squared-separation clauses proposed | Source-sound necessary conditions; no theorem packages the needed cross-cap shell witness. |
| `round6-ptolemy-plucker-bank/REPORT.md` | Ptolemy/Pluecker and power-matrix consumers inspected | Current packet lacks five full shells, complete zero/nonzero matrix, or ordered crossing data. |
| `round6-positive-overlap-strategy/REPORT.md`, `round6-other-cap-double-hit-bank/REPORT.md` | exact missing bridge identified as a two-hit shell fiber in another cap | Existing cardinality terminal proves “at most one” only; no producer of the second hit. |

## v26 PB-lowering/source-core pilot

`v26-pb-lowering-source-core.json` is schema 26, `kind`
`v26-exact-pb-lowering-source-core-pilot`, and explicitly sets
`production_launched: false`.  It authenticates the v22 exact-n15 55-fix raw
blob (Z3 4.16.0), replays it independently, and reports external
`authenticated_unsat`.  The lowering audit is accepted as QF_LRA with 105 PB
definitions, 26 source groups, and 2,520 auxiliaries.  The projected source
core is exactly `v26_source_07`, `v26_source_09`, `v26_source_23`, tracking:

* `track_cyclic_alternation_cut`;
* `track_exact_rich_profiles`; and
* `track_strict_kalmanson`.

The pilot script documents that each PB atom is replaced by a fresh proxy and
an exact Boolean CNF definition, with auxiliary provenance checks.  This is a
zero-theory encoding/lowering and provenance result, not a new geometric
statement.  Its trust boundary is recorded as “external Z3 exact-n15
discovery; authenticated fresh-raw replay; no proof certificate or
Lean/kernel ingress.”  Thus v26 cannot close the live leaf or serve as a
universal producer.  At most it supplies an input specification for proving a
new finite Boolean lemma, subject to independently checking that the source
groups are exactly the intended mathematical clauses.

## Independent global theorem-bank pass (v26 pilot)

All required registries were searched by exact target names and by shape terms
(`FreshThirdNormalizedResidualCase`, retained omission, five-support,
Kalmanson, `CirclePowerMatrix`, `CriticalFourShell`, and two-large-cap):

* `docs/general-n-certificate-bank-mining-2026-07-09.md` (867 lines);
* `certificates/p97_rvol_general_n_mining.md/.json`;
* `certificates/erdos97_legacy_general_n_mining.md/.json`; and
* `certificates/erdos_general_theorem_p97_mining.md/.json`.

The p97 RVOL JSON summary has 4,597 declarations, 2,148 candidate instances,
2,143 source-proved candidates, 1,979 source-reachable candidates, and 19
unimported source-proved novel contradiction consumers.  Its focused census
still reports 96 U5 class incompatibility families, 88 metric incompatibility
families, and 112 scalar incompatibility families, plus 18 generated U1
source-unit consumers.  The legacy archive has 285 novel source-proved
candidates (zero exact-name or shape matches); the older `erdos-general`
archive has 297 (also zero exact-name or shape matches).  No registry entry
names or directly instantiates the v26 core, the 31-clause five-support
obstruction, or a producer for the live normalized residual cases.

One mandatory indexed query was run:

```
nthdegree docs search --lean --agentic \
  "FreshThirdNormalizedResidualCase exact rich profile five support finite obstruction source producer"
```

The indexed hit, `freshThirdNormalizedResidualCase_of_crossRowResidual`, was
verified in the source at `FrontierLiveClosure.lean:9219`: it is only the
constructorization bridge described above, not a contradiction producer.  No
other hit supplied a banked exact-rich/five-support theorem.

## Verdict and next bounded interface

**NO-GO for artifact reuse as closure.**  No retained certificate is a
universal, source-clean producer for `FreshThirdNormalizedResidualCase`; v26
adds lowering/provenance only.  Do not start another broad CEGAR wave for this
interface.  The concrete bounded route is to formalize the 31-clause finite
set-system lemma (or an equivalent source-clean Boolean theorem), then prove a
separate geometric adapter constructing its five support sets from the live
normalized packet.  Until both pieces exist, the live `sorry` and its
coordinator remain open.
