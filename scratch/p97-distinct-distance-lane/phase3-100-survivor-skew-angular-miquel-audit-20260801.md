# Phase-3 100-survivor skew / angular / Miquel audit (2026-08-01)

## Scope and trust boundary

This is a read-only computational audit of the historical, fixed 100-survivor
Phase-3 bank. No CEGAR worker, SAT/SMT solver, generator, Lean/Lake command, or
kernel/axiom gate was run. The results below are Python hash/schema replay and
finite incidence enumeration only. They do not establish Euclidean
realizability, a SAT certificate, a Lean theorem, Phase-3 coverage, or Problem
97 closure.

The separate 162-row paused projected bank and later completed/live rounds are
out of scope. The existing postmine has 262 rows because it combines the 100-row
bank with that 162-row bank; this report filters it to the authoritative
100-row source.

## Authoritative artifacts and authentication

Historical run:

- manifest:
  `scratch/p97-distinct-distance-lane/phase3_structural_cegar_10000_20260729/manifest.json`;
- survivors:
  `scratch/p97-distinct-distance-lane/phase3_structural_cegar_10000_20260729/survivors.jsonl`;
- manifest schema: `p97-phase3-structural-cegar-v1`;
- survivor schema: `p97-phase3-structural-cegar-survivor-v1`;
- canonical manifest hash:
  `89a5c20b6cfffdbe81c0db0dbafd200c751563aae52e9ee8c274d01a0f102310`;
- survivor file SHA-256:
  `300309d12184482f0e9d8052f7740f55cb9303890f0fc6eea56984bd889b3ee6`;
- status: `SURVIVOR_LIMIT`, with `structural_survivor_count=100`,
  `classified_raw_sat_count=8129`, `unclassified_raw_sat_count=0`, and
  `learned_core_count=8050`.

`SURVIVOR_LIMIT` is a bounded checkpoint, not exhaustion or non-existence. The
manifest's `cell.exact=true` describes the target `(n,k,profile)=(10,4,(4,4,5))`
cell; it does not override `metric_row_exact=false`.

Authentication replay verified:

- the manifest self-hash and all six manifest-pinned artifact hashes;
- all 100 survivor canonical record hashes and previous-record chain links;
- all 100 semantic-assignment hashes and metric-row hashes;
- indices `0..99`, survivor schemas, and row shapes; and
- exactly 1,000 metric rows, all with four distinct listed support points and
  `exact=false`.

Existing reusable postmine:

- script:
  `scratch/p97-distinct-distance-lane/postmine_phase3_motifs_20260731.py`,
  SHA-256
  `968aa4665d1020e5d53160390640d171bdc624c3f4c99d9abecb892fb938c57c`;
- output:
  `scratch/p97-distinct-distance-lane/phase3_postmine_motifs_20260731.jsonl`,
  SHA-256
  `84527daccaed8aa6cabd897f70c49edd63004f6d2be83e290e12e599d681f47a`;
- manifest:
  `scratch/p97-distinct-distance-lane/phase3_postmine_motifs_20260731.manifest.json`,
  canonical hash
  `68189e0b316bd3a3a9271c6f9a5d9da4abe73957d1c59d3b9edaf32972036d87`.

The live postmine hashes replayed. A read-only replay on only the 100-row input
matched exactly the corresponding 100 stored postmine records, with zero
authentication failures.

## 1. Six-pair skew-Bollobas directed cross-intersection

For a survivor let `S(c)` be the four listed support points of center `c`. The
postminer exhaustively tests ordered six-tuples of distinct centers
`(c_1,...,c_6)` in both natural singleton/support orientations:

1. `A_i={c_i}`, `B_i=S(c_i)`, with `c_i in S(c_j)` for every `i<j`;
2. `A_i=S(c_i)`, `B_i={c_i}`, with `c_j in S(c_i)` for every `i<j`.

Within-pair disjointness holds because validated rows require `c_i` not in
`S(c_i)`. Each survivor has `10P6 = 151,200` ordered six-tuples, so the audit
covers **15,120,000 ordered six-tuples per orientation** across the bank.

Census:

- center-in-later orientation: 0 candidate records and 0 candidate tuples;
- support-in-later orientation: 0 candidate records and 0 candidate tuples;
- representative hit: none.

This is exhaustive for these two canonical singleton-center/support predicates,
not for arbitrary set pairs assembled from several rows. The first missing
bridge is a canonical richer construction of six ordered set-pairs from the
row data, with every disjointness and directed cross-intersection hypothesis
proved, or a proof that a target residual must realize one of the two tested
orientations. There is no current hit from which to emit a cut.

## 2. Closed angular-midpoint component

A sound angular-midpoint predicate would require actual oriented-angle
variables and certified relations such as
`2*theta_m = theta_u + theta_v` in a common angular lift, together with a
nonempty closed or strongly connected dependency component and the
order/distinctness hypotheses needed to turn its closure into a contradiction.
The survivor schema has no coordinates, angle values, midpoint witnesses,
oriented-angle equalities, common lift, or angular closure proof, so this
predicate cannot be evaluated.

The implemented incidence-only proxy forms a graph on the ten centers, adding
an edge `{u,v}` exactly when `|S(u) intersect S(v)| >= 2`. Its exact 100-row
census is:

- 100/100 graphs connected;
- component size `[10]` in every record;
- 21 edges and cycle rank 12 in every record.

These are 100 shared-support prefilter records, not 100 angular components.
Accordingly the sound closed-angular-midpoint census is **unavailable**, not a
geometric count of zero or 100. The first missing bridge is a theorem or data
ingress converting selected-row incidence into certified oriented-angle
midpoint equations, followed by a proof that the equations form a closed
component in one consistent lift.

## 3. Miquel / Clifford / bundle circle-incidence motifs

A sound predicate must first choose a specific theorem incidence hypergraph and
certify its Euclidean point/circle data: circle-defining noncollinear triples,
all prescribed point-circle incidences and shared intersections, distinctness
and nondegeneracy, and any off-circle or exact-intersection hypotheses used by
the transfer conclusion.

The current records contain no Euclidean coordinates or certified circle
objects. Moreover, all metric rows have `exact=false`: a positive `s[p,q]`
certifies selected-radius membership, but a false or omitted `s[p,q]` does not
certify a different radius or off-circle nonmembership. Thus the bank cannot
identify full circles or exact incidence patterns.

The existing postmine deliberately emits
`PREFILTER_ONLY_ZERO_NO_COORDINATES` with count zero. On the 100-row bank this is
100/100 unavailable records and **0 enumerated sound candidates**, not an
exhaustive negative Miquel/Clifford/bundle census. There is no representative
sound hit.

The first missing bridge is Euclidean realization plus exact-radius/full-circle,
intersection, and nondegeneracy certificates, followed by a theorem-specific
incidence-hypergraph matcher. Off-support nonmembership must not be inferred
from the present `exact=false` rows.

## Representative authenticated record

Source record index 0 has canonical record hash
`4bc596d9812cf1cf092b6ad8a848d12d76b0a4090be50eeb86401805aa41ad2b`.
It has zero skew candidates in both orientations. Its shared-support proxy is a
connected ten-vertex graph with 21 edges and cycle rank 12. It supplies no
angular-midpoint or sound Miquel/bundle witness.

## Verdict

The natural six-pair skew-Bollobas predicates are genuinely absent from this
100-row bank. The angular-midpoint and Miquel/bundle predicates are not soundly
represented by the artifact schema; their proxy counters must not be promoted
to geometric negative results. None of the three audits currently yields a
sound theorem instance or cut.
