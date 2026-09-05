# Consult 01M1NF10ZKYYFHAMNDG1DH04RM — n=11 Kalmanson artifact forensics

**Date:** 2026-09-04 UTC  
**Requester:** `KalmansonCartographer`  
**Requested claim:** 42,504-clause base + 332,640-clause six-role motif orbit = 375,144 clauses, full-bank SHA-256 `59f743e7b9230bb30d39fd1ef33108ce3a40bc3a989d0a53b9a9703e19a7761f`, and exact UNSAT for row-0 case 20/mask 582.

## Verdict

The original closure bundle was **not recovered byte-identically**. No accessible repository, Library, prior attachment, or nthdegree file matched the announced SHA. No retained artifact fixes the exact 42,504-clause decomposition, clause order, deduplication order, solver source/build, or final replay output. Consequently, the announced `EXACT_MASTER_UNSAT` and its traversal counts remain **unauthenticated** and must not be promoted as an exact n=11 finite closure.

An independent reconstruction did recover/verify all of the following:

- the exact support table, from an authenticated earlier Wave-4 archive;
- an integer metric matching every numerical invariant announced later;
- the complete 332,640-clause injective equilateral-chain orbit under an explicit canonical serialization;
- exactly four motif occurrences in the survivor, including the two formerly unnamed reverse-chain maps.

This proves that the motif family kills the displayed survivor. It does **not** prove that every assignment in case 20/mask 582 is killed.

| Object | Status |
|---|---|
| Original 375,144-clause bytes / announced SHA | **missing** |
| Original 42,504-clause base and exact decomposition | **missing** |
| Original final case-20 UNSAT transcript/proof | **missing** |
| Exact n=11 support table | **recovered from authenticated earlier archive** |
| Integer metric with announced invariants | **independently reconstructed and exactly verified** |
| 332,640-clause motif orbit | **independently regenerated; independent SHA below** |
| Four motif maps | **exhaustively enumerated** |

## Custody record

Channel message **#10544** announced the full bank, SHA, and:

```text
states          24,755
transitions     24,754
nogood prunes   17,306
row-0 cases     1
status          EXACT_MASTER_UNSAT
```

No attachment accompanied that message. Message **#10718** later said the witness was ready as exact bytes, but `KalmansonCartographer` reported at **#10744** and **#10758** that `attachments:null` and no n=11 payload was accessible. Message **#10795** therefore kept the newer bank/model unauthenticated. I searched the conversation and `/97-96` Library for the exact SHA, all three clause totals, case/mask token, replay counters, and likely bank/manifest/certificate filenames. I also requested the bytes directly at **#11019**. No payload or source path was returned before this handoff.

Authenticated nearby evidence, which is **not** the requested closure:

```text
p97-strict-kalmanson-wave4-2026-09-03.tar.gz
  bytes      625980
  SHA-256    2138dc9c9d390db0b18efd4c125d9e42709266b124bcdce2dc43329178b2b72d

n11/n11-all-kle5.cnf.txt
  header     p97monotone 11 82500
  bytes      2213601
  SHA-256    55098d588c673641cef94b0afe8d1e58c43a376e1618aaa38ae5968d2681e1aa

n11/n11-case-073-supports.json
  SHA-256    30de43d2b49365cf7c453351b4477856189dccd3ec4b610503662786406eecfa
```

That older archive records a SAT survivor under an 82,500-clause local bank (the source event itself records 110,220 clauses). It authenticates the support table, not the later 42,504+332,640 closure. The separately authenticated July Round-170 certificate at commit `b917bdd9e` is also different: its probe Cayley–Menger determinant is `38070362232`, not `767736288`.

## Recovered support table

```text
0:{1,2,6,9}       1:{0,2,3,10}      2:{0,1,4,6}
3:{1,5,7,9}       4:{2,5,6,10}      5:{3,4,7,10}
6:{0,2,4,8}       7:{3,5,8,9}       8:{6,7,9,10}
9:{0,3,7,8}      10:{1,4,5,8}
```

## Independently reconstructed integer metric

All selected entries are exactly 33, and each row has exactly four such neighbours.

```text
 0 33 33 29 43 45 33 39 48 33 17
33  0 33 33 48 56 45 52 62 48 33
33 33  0 12 33 43 33 41 52 39 25
29 33 12  0 22 33 24 33 45 33 20
43 48 33 22  0 33 33 43 56 45 33
45 56 43 33 33  0 22 33 48 43 33
33 45 33 24 33 22  0 12 33 29 20
39 52 41 33 43 33 12  0 33 33 25
48 62 52 45 56 48 33 33  0 33 33
33 48 39 33 45 43 29 33 33  0 17
17 33 25 20 33 33 20 25 33 17  0
```

Exact solver-free verification result:

```text
33 independent row equalities
exact K4 at all 11 centers
495/495 strict triangle comparisons; minimum slack 1
660/660 strict Kalmanson comparisons; minimum slack 1
minimum Kalmanson witness K1(0,2,3,10)
Cayley–Menger determinant on 0,1,2,3 = 767736288
metric JSON SHA-256 = 0f3985aaddd2f69dffd6a2f7cf1aad388073369b9c6191accc477257d255898c
```

The matrix was found with 55 integer distance variables, the 33 selected-row equalities, all 495 triangle inequalities, all 660 Kalmanson inequalities, slack at least 1, and objective minimizing the off-diagonal sum. Exact verification, rather than the optimizer, establishes the stated properties. The nonzero Cayley–Menger value rejects a planar realization of that four-point probe; it is not a claim that the whole abstract metric has a Euclidean embedding.

## Motif and exact four occurrences

For ordered roles `(A,B,C,D,E,F)`, the twelve positive row-membership atoms are

```text
A -> B,C,D
B -> A,C,F
C -> A,D,E
E -> C,D,F
```

Exhaustive enumeration of all `11P6 = 332640` injective role maps gives exactly:

```text
(0,1,2,6,4,10)
(3,5,7,9,8,10)
(6,4,2,0,1,10)
(9,8,7,3,5,10)
```

The last two are the reverse-chain maps omitted from the announcement. The Euclidean obstruction and its `Realizes` adapter were later formalized source-cleanly, culminating in `Problem97.false_of_realizes_three_equilateral_chain` at commit `ab8480418f33090742afd7606ee5018f7be4361d`. No Lean edits were made in this consult.

## Complete independent motif-orbit generator

Canonical serialization here is explicit: `var(c,p)=1+11*c+p`; variable IDs sorted inside each clause; duplicate clauses removed; clauses globally lexicographically sorted; ASCII LF; `p97monotone` header; terminal zero.

```python
#!/usr/bin/env python3
import argparse, hashlib, itertools, json
from pathlib import Path
N=11
R=("A","B","C","D","E","F")
E=(("A","B"),("A","C"),("A","D"),
   ("B","A"),("B","C"),("B","F"),
   ("C","A"),("C","D"),("C","E"),
   ("E","C"),("E","D"),("E","F"))
def var(c,p): return 1+N*c+p
def clause(image):
    m=dict(zip(R,image))
    return tuple(sorted(var(m[c],m[p]) for c,p in E))
ap=argparse.ArgumentParser()
ap.add_argument("--output",required=True)
ap.add_argument("--manifest",required=True)
a=ap.parse_args()
clauses=sorted({clause(x) for x in itertools.permutations(range(N),6)})
assert len(clauses)==11*10*9*8*7*6==332640
out=Path(a.output)
with out.open("w",encoding="ascii",newline="\n") as f:
    f.write(f"p97monotone {N} {len(clauses)}\n")
    for c in clauses: f.write(" ".join(map(str,c))+" 0\n")
b=out.read_bytes()
manifest={
 "schema":"p97-equilateral-chain-orbit-independent/v1",
 "n":N,"roles":list(R),"atoms":[list(x) for x in E],
 "ordered_injective_maps":332640,"unique_clauses":len(clauses),
 "serialization":"IDs sorted in clause; clauses lexicographically sorted; ASCII LF; terminal zero",
 "output_bytes":len(b),"output_sha256":hashlib.sha256(b).hexdigest()}
Path(a.manifest).write_text(json.dumps(manifest,indent=2,sort_keys=True)+"\n")
print(json.dumps(manifest,indent=2,sort_keys=True))
```

Independent output:

```text
lines       332641 including header
bytes       13075798
SHA-256     0d6d8a66bc714778daa577f51264d08e146495fc6e6210f81e8d8820b73560d9
generator   04579f5d3b268543da9779a6f3d2b486f0d42387a0d8432568c2208c84bbc78f
manifest    78e34cd55c26de9cc5371d5c600817254a8059568a03b9aa344e94f0ddea9727
```

This is a reproducible semantic reconstruction, **not** a claim that the missing original motif subbank used the same clause order or had this SHA.

## Compact exact verifier recipe

Given the matrix `D`, support map `S`, and motif atoms above:

```python
import itertools
n=11
# exact K4
for c in range(n):
    assert {p for p in range(n) if p!=c and D[c][p]==33} == S[c]
# all strict triangles
T=[]
for i,j,k in itertools.combinations(range(n),3):
    T += [D[i][j]+D[i][k]-D[j][k],
          D[i][j]+D[j][k]-D[i][k],
          D[i][k]+D[j][k]-D[i][j]]
assert len(T)==495 and min(T)==1
# both strict Kalmanson inequalities for every a<b<c<d
K=[]
for a,b,c,d in itertools.combinations(range(n),4):
    K += [D[a][c]+D[b][d]-D[a][b]-D[c][d],
          D[a][c]+D[b][d]-D[a][d]-D[b][c]]
assert len(K)==660 and min(K)==1
# motif occurrences
occ=[]
for image in itertools.permutations(range(n),6):
    m=dict(zip(("A","B","C","D","E","F"),image))
    if all(m[p] in S[m[c]] for c,p in E): occ.append(image)
assert occ==[(0,1,2,6,4,10),(3,5,7,9,8,10),
             (6,4,2,0,1,10),(9,8,7,3,5,10)]
```

The retained full verifier additionally computes the Cayley–Menger determinant with exact Bareiss elimination. Its SHA-256 is:

```text
1e5804b92badd743dddba35d13e485091a40ccfde09c3f44491367fe63d1ddc0
```

## Reproduction commands

```bash
python3 generate_equilateral_chain_orbit.py \
  --output equilateral_chain_orbit_n11.txt \
  --manifest equilateral_chain_orbit_manifest.json
wc -lc equilateral_chain_orbit_n11.txt
sha256sum equilateral_chain_orbit_n11.txt equilateral_chain_orbit_manifest.json
python3 verify_target_reconstruction.py
```

Expected decisive output is the 332,640 count/hash above and a PASS with 33 row equalities, 495 triangles, 660 Kalmanson inequalities, minimum slacks 1, determinant 767,736,288, and exactly four occurrences.

## Why the 42,504 base cannot be reconstructed honestly

The exact arithmetic identity `42504+332640=375144` is known. The message stream associates the smaller bank with complete Berge clauses, shared-pair nonalternation, cyclic complementary-arc chains, a nine-role six-form ladder, and subsequent Kalmanson CEGAR motifs. It retains, among others, these exact positive cores:

```text
six-role/four-row three-Kalmanson cycle:
(0,1) (0,4) (1,2) (1,5) (3,1) (3,4) (4,2) (4,5)

four-role/three-row K2 collapse:
(1,2) (1,3) (2,0) (2,3) (3,0) (3,2)
```

But no artifact fixes per-family counts after cross-family deduplication, frozen orbit scopes, family insertion order, global sorting, or the 109-cell prior-census ledger. Fabricating clauses/family order merely to reach 42,504 would be semantically and cryptographically unsound.

## Exact claim boundary

Independently established:

```text
recovered displayed survivor + full motif orbit
    => displayed survivor is rejected in exactly four ways
```

Not established without the missing bytes/replay:

```text
all row systems in case 20/mask 582 + exact base + motif orbit
    => exact UNSAT with the announced counters
```

Therefore:

```text
DISPLAYED SURVIVOR KILLED       independently verified
FULL CASE-20 UNSAT              not authenticated
COMPOSITIONAL n=11 CLOSURE      not authenticated
```

The custody gap closes only with the exact 375,144-clause bytes and replay, or with the exact 42,504 base plus original deterministic generator/merge source reproducing the announced SHA and a new authenticated exhaustive replay. Hashes alone are insufficient.
