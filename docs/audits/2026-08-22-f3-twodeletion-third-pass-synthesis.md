# F3 / TwoDeletion third-pass synthesis

**Date:** 2026-08-22
**Scope:** `TwoDeletionCollision.lean`, its B1 support, and the ten F3 archive files in the canonical proof tar.
**Authority:** `f3_trace_graph_third_pass_addendum.md` (F3.55--F3.73) supersedes the second-pass v8 matrix (F3.54) wherever they differ.

## Executive status

F3 has a source-checked ingress and substantial local finite calculus, but it is not closed.  The three live unresolved declarations remain:

1. `b1_globalGapOrClosedTerminal_of_counterexample` (`TwoDeletionCollision.lean:142--149`);
2. `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` (`:628--699`); and
3. `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` (`:704--798`).

Their surrounding coordinators are elaborated adapters, not independent closure: the collision adapter calls the first declaration at `:207--208`, and the distinct-blocker coordinator eventually routes through the latter two leaves.  No prose or patch in the archive removes these `sorry`s.

## Deduplicated mathematical narrative

The ingress retains the complete physical source context: physical class `C`, current sources `u,v`, canonical rows `K_u,K_v`, deleted sources `q,w`, their blocker/support/radius data, cap order, and deletion provenance.  Define

\[
 T_u=C\cap K_u,\qquad T_v=C\cap K_v,\qquad
 J=C\setminus(T_u\cup T_v).
\]

The exact decomposition gives `C.card ≤ J.card + 4` because each trace has cardinality at most two.  This yields fresh-third or bounded/exhausted profiles, including the shared-mate five-point and disjoint-mate six-point normal forms.  The equal-blocker branch has common trace `{u,v}` and a strict-cap escape; the escape row omits at least one original deleted source.  The distinct-blocker branch source-checks the two-blocker-cycle exclusion, orients a cross omission, and produces the seven-way split: three literal source/blocker collisions or four survival alternatives.  The source-clean local results that support these reductions are:

- `false_of_exactFour_twoDeletion_blockerTwoCycle` (`:212`);
- `exactFour_twoDeletion_crossOmission` (`:314`);
- `exactFour_fourSurvivingCenters_survivalSquare_split` (`:395`);
- `third_not_mem_of_card_le_two` and `exactFour_jointDeleted_mutualOmission_with_one_original` (`:491`, `:512`);
- `qDeletedRow_at_actualBlocker_eq_canonicalSupport` (`:575`), followed by the one-way/five-center/top-level adapters (`:930`, `:1024`, `:1103`).

The third pass rejects the proposed recursive `JointCapCover` interface.  A point of `J` is a physical source, but a constructor’s returned centers or row omissions need not lie in `J`; a survival pair does not retain the two-source/two-row/joint-deletion context; and no theorem says an arbitrary pair covers all of `J` in one cap interval.  Literal collision forms are therefore locally consistent normal forms, not immediate contradictions.

The replacement is nonrecursive.  The physical trace system has an arrow `x ↝ y` when `y` lies in the canonical row of physical source `x`.  Each source has at most one outgoing companion; reciprocal arrows are exactly equal-blocker pairs; each blocker fiber has size at most two; every trace is isolated or paired.  The conflict graph consequently has at most as many edges as vertices and yields a mutually omitted family of at least one third (thresholds 7→3, 10→4, 13→5, 19→7).  Survival amplification from that family produces fixed-center fans, common-center grids, and a three-way diagonal-support split (`r=a`, `r∈C`, or external `r`).  These packages are prose-closed/source-adapter specifications, not metric contradictions.

## Five open global roots

The third-pass matrix leaves exactly five metric roots:

1. **`F3-BOUND-ROOT`** — refute the finitized bounded joint trace (`|J|≤6`, hence `|C|≤10`) using its graph shape, companion identities, and boundary order.
2. **`F3-THREE-ROOT`** — refute an exact three-source amplified fan by a cap-order or checked multi-row obstruction.
3. **`F3-DIAG-A-ROOT`** — refute the robust-apex diagonal packet (`r=a`).
4. **`F3-DIAG-P-ROOT`** — refute the physical diagonal trace-shape products (`r∈C`).
5. **`F3-DIAG-X-ROOT`** — refute the external-support diagonal packet.

`F3-DIAG-ROOT` and `F3-FINAL` are blocked dispatchers pending these five roots.  The old B1 producer is a **rejected interface**, not an additional open theorem to prove.

## Trust boundary and merge guidance

“Source-checked” means the current Lean declaration elaborates without a local `sorry`; it does not mean its call graph is `sorry`-free.  “Prose-closed” records finite-set, graph, or case calculus only.  “Source-adapter” means exact Lean projections and provenance still require implementation.  “Geometric-open” or “finite-metric-open” means no contradiction is established.  The old `f3_live_source_reconciliation.md` caveat (source unavailable during that pass) is historical; current declaration names above were checked against the repository source.  Do not silently replace the three public declarations or mark F3 complete.  A future manuscript merge should retain current §16.5.I0--I21, replace the recursive material in I22--I30 by this third-pass account, and insert F3.55--F3.73 before §16.5.37; update §16.6.4 and the §16.7 `sorry` ledger accordingly.

## Appendix A — source accounting for every archived F3 file

| Archive file | Role and disposition |
|---|---|
| `f3_expanded_section.md` | First source-audited expansion; local reductions retained, three leaves open. |
| `erdos-97-F3-expansion.patch` | Diff producing that expansion; evidence only, not proof. |
| `erdos-97-descent-prose-proof-authoritative-F3-expanded-2026-08-21.md` | 21-Aug integrated expansion; superseded by v8 and third pass. |
| `f3_joint_locus_descent_addendum.md` | F3.32--F3.53 joint-locus calculus; retained where compatible. |
| `f3_authoritative_closure_matrix.md` | v8 F3.54 matrix; superseded by F3.73. |
| `erdos-97-descent-prose-proof-authoritative-F3-closure-work-2026-08-22.md` | v8 integrated manuscript; historical implementation specification. |
| `erdos-97-F3-closure-work-2026-08-22.patch` | v8 manuscript diff; structural artifact only. |
| `F3-live-constructor-closure-worksheet.md` | Constructor worksheet made without mounted source; not authority. |
| `F3-closure-work-validation.txt` | Structural validation of v8 sections/fences; no mathematical or kernel closure. |
| `f3_live_source_reconciliation.md` | Historical source-unavailable caveat; exact names are superseded by this live audit. |

The governing third-pass file, `f3_trace_graph_third_pass_addendum.md`, is intentionally named separately: it is the active correction, not a discarded historical artifact.
