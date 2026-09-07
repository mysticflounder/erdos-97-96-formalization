# Exact-five consult: both anchors rich, singleton trace retained

**Consult:** `01M1VWHAP9H4ESQDKD9NGVSJB4`  
**Requester:** CapDropAudit, `#erdos-97-96-formalization`  
**Date:** September 6, 2026  
**Status:** Partial research response. Exact local countercontrol established; the requested full-source False consumer and unconditional exact-five closure have **not** been obtained.

## 1. Outcome and scope

The proposed endpoint-only exclusion fails. I independently reconstructed the supplied 24-point carrier and extended it to 32 points with a full, unique rich four-class at the mutual endpoint e=w. Every previously named point was retained. All ambient distance classes were recomputed rather than inherited from the smaller carrier.

A current indexed-source check then showed that the project already has its own 32-point endpoint control and a stronger 44-point partial-H control. Accordingly, the 32-point reconstruction here is independent corroboration, not a claimed new project result.

I then constructed and exactly checked a **48-point control** that additionally gives the third anchor u its own full rich four-class. It retains the actual singleton-trace assignment H(u)=d0, the fresh partial endpoint assignments, and the mutual rows. Thus even the following local strengthening remains consistent:

- all retained MEC/cap/exact-five/minimum-pair geometry and full mutual rows;
- K4 at **both** u and e=w;
- an actual singleton-trace blocker H(u)=d0;
- actual partial assignments H(q)=d1, H(w)=b, H(b)=c, H(c)=b;
- c distinct from both partial endpoint blockers d1 and b.

This is a countercontrol to deductions using only those hypotheses. It is **not** a counterexample to a theorem retaining global K4, total H, and cardinal minimality. Those conditions fail explicitly. I do not claim a new full-source reduction, termination argument, Lean declaration, or closure of any of the three full-source trace consumers.

## 2. Exact results

All construction arithmetic and all pass/fail checks use rational arithmetic in Q(sqrt(3)). Approximate numbers are diagnostics only.

| Check | Result |
|---|---:|
| Distinct carrier points | 48 |
| Strict supporting-edge tests | 2,208 / 2,208 positive |
| Cyclically ordered triples | 17,296 / 17,296 positive |
| Minimum enclosing circle boundary | Exactly O,V,W |
| Strict cap sizes opposite O,V,W | 6,17,22 |
| Closed cap sizes | 8,19,24 |
| Unique surplus apex | W |
| Centers with any rich class | Exactly O,V,b,c,w,u,d0,d1 |
| Centers without K4 | 40 |
| Actual nonrobust rich centers | Exactly b,c,w,u,d0,d1 |
| Union of their actual four-rows | 22 points |
| Sources without any actual blocker | 26 points |

The full rich-row census is:

| Center | Entire ambient rich class or classes |
|---|---|
| O | {q,w,u,aL,aR} |
| V | {q,Q1,Q2,Q3}; {u,U1,U2,U3} |
| c | {q,w,b,d} |
| b | {w,c,B1,B2} |
| w | {J1,J2,J3,J4} |
| u | {Z1,Z2,Z3,Z4} |
| d0 | {u,S1,S2,S3} |
| d1 | {q,T1,T2,T3} |

These are full classes, not four-subsets selected from larger fibers. For every member of every actual four-row, deleting that member destroys all K4 at its center. Both O and V survive every singleton deletion. The partial H assignments use these ambient actual rows and are unchanged by the added u-row.

The exact-five class and interior trace remain E={q,w,u,aL,aR} and I={u,q,w}. The pair {u,q} fails joint V-deletion survival; {q,w} and {u,w} survive. The exact comparisons give |q-w|<|u-w| and |q-w|>r, so {q,w} remains the minimum admissible pair. Deleting q,w destroys K4 at O. The directed cross-deletion checks at d1 and b also pass.

The singleton trace is still Kd0 intersect I={u}. In fact,

    r^2 = 3.25,
    dist(d0,u)^2 approximately 4.148135150115733,
    radius of u's own rich class squared approximately 2.8915789891222357.

Therefore adding K4 at u does not, under these local hypotheses, force H(u)'s row to acquire a second anchor or have radius below r. The row centered at u is not the row centered at H(u), and neither is the row centered at H(H(u)).

The containing disk has exactly the three stated boundary points and its center lies inside their acute triangle. This certifies the minimum enclosing disk. No alternative support triangle is available, and none of the closed cap sizes is four; hence this local geometry supplies no M44 packet in the cap-cardinality sense used in the source. No production CounterexampleData is instantiated.

## 3. Construction

### 3.1 Parent and endpoint row

`base_control.py` reconstructs the supplied 24-point control. It uses h=3/2, k=1/50 and

    q=(-1,0), w=(1,0), O=(0,-h), c=(0,k),
    b=((1-sqrt(3)k)/2, (k-sqrt(3))/2).

Its other rational rotation parameters are retained in the script. The reconstruction is not advertised as byte-identical to the earlier repository checker.

For a vector (x,y), write out(x,y)=(y,-x). Let f be the orthogonal projection of w onto the line Q3--O. Put

    a = w + (100001/100000)(f-w).

Let R(t) be rotation with cosine (1-t^2)/(1+t^2) and sine 2t/(1+t^2). Insert

    Ji = w + R(ti)(a-w),
    (t1,t2,t3,t4)=(-3,-1,1,3)/1000000.

These points form a very short exposed circular arc between Q3 and O, with center w. Four further points on the original outward b--d parabola, at parameters 1/12,3/12,7/12,9/12, preserve W as the unique surplus apex. The result is the independently verified 32-point carrier.

### 3.2 Partial actual H

The formulas for d0,d1 and the singleton/fresh rows come from the current indexed note `docs/audits/2026-09-06-exactfive-partial-h-control.md`, construction section beginning at line 30. For v=V-aR, put

    D(t)=(1-t)aR+tV+10^-8 t(1-t) out(v),
    d0=D(1/3), d1=D(2/3).

For zi in {-10^-7,0,10^-7}, add

    Si=d0+R(101/1000+zi)(u-d0),
    Ti=d1+R(127/1000+zi)(q-d1).

The S points lie between U2 and U3, the T points between Q2 and Q3, and d0,d1 between aR and V. Four unused b--d parabola parameters 1/24,3/24,5/24,11/12 provide the remaining fillers. These differ from the other agent's filler choices so they do not collide with our independent parent. All geometry and every distance class are rechecked on the resulting 44 points.

This reconstructs the documented mathematical construction on our parent; it is not a byte-for-byte replay of the repository's 44-point script. Fetching that script through GitHub returned 404, while its construction was available in nthdegree's indexed documentation.

### 3.3 New u-centered row

Let g be the orthogonal projection of u onto the line O--b, and put

    a_u = u+(100001/100000)(g-u).

Add

    Zi=u+R(ti)(a_u-u),
    (t1,t2,t3,t4)=(-3,-1,1,3)/1000000.

These four points form an exposed u-centered circular arc between O and b. They all enter the already largest cap, so no additional fillers are needed. All 44 previous points remain. The final size is 48, not 52.

The final JSON contains the complete cyclic order and every coordinate as two exact rational coefficients a,b representing a+b sqrt(3).

## 4. Independent verification and reproducibility

The construction checker verifies full ambient distance maps, all supporting edges, all cyclic triples, minimum-disk conditions, caps, robustness, actual criticality, trace, freshness, pair admissibility, and source failures.

`independent_audit.py` uses a separately written tuple/Fraction field implementation and reads only the exact coordinate JSON. It does not import the construction scripts. It independently recomputes all 2,208 edge tests and 17,296 triples, solves the circumcenter equations, checks the disk and caps, rebuilds all 48 distance maps, and verifies the row/deletion/coverage results. Its audit passes.

Run from the extracted directory, using Python 3.10 or later and only the standard library:

```bash
python base_control.py > base_replay.json
python endpoint_control.py > endpoint_replay.json
python double_anchor_control.py > double_anchor_replay.json
python independent_audit.py double_anchor_replay.json > independent_audit_result.json
```

`SHA256SUMS` records the delivered bytes. No floating search result or unsuccessful exploratory program is included as mathematical evidence. In particular, exploratory co-radial searches yielded no certified exclusion and are not used in this note.

## 5. Exact full-source boundary

The same 48-point carrier has **no** K4 at q, W, or any of the other 38 nonrich centers. Its actual rows cover only 22 points. O,V,W,d0,d1 are among the 26 sources with no actual blocker at all. Hence the displayed partial H cannot extend to a total actual shell system on this fixed carrier. It is neither global-K4 nor cardinally minimal among global-K4 carriers.

Consequently, this report does not disprove a singleton-trace contradiction using the complete source. Nor does it solve it. What is now certified is that K4 at the two specifically suggested anchors, the actual singleton row, and the fresh local endpoint assignments are jointly insufficient by themselves.

Any successful continuation must use an additional full-source obligation not satisfied by this model, with its geometric incidence or surviving-row consequence proved. Naming a minimality cut, assuming H is reselected, treating restored classes as ambient actual rows, or presuming a smaller radius would not supply that consequence. The first globally coupled incidence/survival lemma remains unproved in this response. I have not replaced that missing lemma by a claimed reduction.

This is suitable as a regression control for proposed full-source consumers, not as a new Lean closure target. The two pair-trace consumers and the global singleton-trace consumer remain open.

## 6. Source and tool custody

The source consult included the audited sharp mutual bounds, third-anchor trace proof, and 24-point checker. Current indexed project sources consulted include:

- `docs/audits/2026-09-06-exactfive-mutual-endpoint-control.md` and its skeptic audit;
- `docs/audits/2026-09-06-exactfive-partial-h-control.md`, especially lines 30 and 126, and its skeptic audit;
- `docs/audits/2026-09-06-exactfive-global-source-cut.md`, especially the actual-row cut at line 130;
- `FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior`, indexed line 129, commit tag c21d4b89b;
- `IsM44.oppIndex1_cap_card_eq_four`, indexed in `Cap/PartitionFromMEC.lean`, line 568.

The broad Lean search timed out with incident `94f89023-633e-49f1-be54-19c7ac1a77b1`. This was immediately reported to `#nthdegree` as delivered message **#16699**. A narrowed keyword retry succeeded. The earlier endpoint-control progress checkpoint was delivered to the project channel as **#16700**. No secret lease token is included in the deliverables.
