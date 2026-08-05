# Exact five-role Kalmanson cyclic-order audit

Strict homogeneous gaps were normalized to `gap >= 1`. Contradictions
were found by exhaustive exact-rational circuit enumeration through rank+1
(Gordan/Farkas). SciPy located witnesses, which were rationalized and then
checked exactly. Positive distances were normalized to `d >= 1`.
The separate metric run also imposed all strict triangle inequalities
(normalized to slack at least 1). Contradictory cases have certificates
using Kalmanson gaps alone, so positivity is not used for closure.

## A=J

- Kalmanson-contradictory: 8/24
- Banked constructors: 8/24
- Kalmanson-feasible: 16/24
- Infeasible after positivity + strict triangles: 8/24
- Additional closures from strict triangles: 0/24

| order | reflection | status | constructor/certificate |
|---|---|---|---|
| OACXK | OKXCA | contradictory | orderOACXK; 1*K2[OACX]+1*K1[OAXK]=0 modulo equalities |
| OACKX | OXKCA | contradictory | orderACKXO; 1*K2[OACK]+1*K1[OAKX]=0 modulo equalities |
| OAXCK | OKCXA | feasible |  |
| OAXKC | OCKXA | feasible |  |
| OAKCX | OXCKA | feasible |  |
| OAKXC | OCXKA | feasible |  |
| OCAXK | OKXAC | feasible |  |
| OCAKX | OXKAC | feasible |  |
| OCXAK | OKAXC | contradictory | orderXAKOC; 1*K1[OCXA]+1*K1[OXAK]=0 modulo equalities |
| OCXKA | OAKXC | feasible |  |
| OCKAX | OXAKC | contradictory | orderAXOCK; 1*K1[OCKA]+1*K1[OKAX]=0 modulo equalities |
| OCKXA | OAXKC | feasible |  |
| OXACK | OKCAX | feasible |  |
| OXAKC | OCKAX | contradictory | orderAKCOX; 1*K2[OXAK]+1*K2[OAKC]=0 modulo equalities |
| OXCAK | OKACX | feasible |  |
| OXCKA | OAKCX | feasible |  |
| OXKAC | OCAKX | feasible |  |
| OXKCA | OACKX | contradictory | orderAOXKC; 1*K2[OXKA]+1*K1[OKCA]=0 modulo equalities |
| OKACX | OXCAK | feasible |  |
| OKAXC | OCXAK | contradictory | orderXCOKA; 1*K2[OKAX]+1*K2[OAXC]=0 modulo equalities |
| OKCAX | OXACK | feasible |  |
| OKCXA | OAXCK | feasible |  |
| OKXAC | OCAXK | feasible |  |
| OKXCA | OACXK | contradictory | orderOKXCA; 1*K2[OKXA]+1*K1[OXCA]=0 modulo equalities |

Kalmanson-feasible orders:

OAXCK, OAXKC, OAKCX, OAKXC, OCAXK, OCAKX, OCXKA, OCKXA, OXACK, OXCAK, OXCKA, OXKAC, OKACX, OKCAX, OKCXA, OKXAC

Exact witness for each feasible order:

- `OAXCK`: dAC=21, dAK=21, dAO=11, dAX=11, dCK=1, dCO=11, dCX=1, dKO=1, dKX=11, dOX=11
- `OAXKC`: dAC=11, dAK=11, dAO=1, dAX=1, dCK=1, dCO=1, dCX=11, dKO=11, dKX=1, dOX=11
- `OAKCX`: dAC=11, dAK=11, dAO=1, dAX=21, dCK=1, dCO=1, dCX=1, dKO=11, dKX=21, dOX=1
- `OAKXC`: dAC=1, dAK=1, dAO=1, dAX=11, dCK=11, dCO=1, dCX=1, dKO=21, dKX=11, dOX=21
- `OCAXK`: dAC=1, dAK=1, dAO=11, dAX=1, dCK=11, dCO=11, dCX=21, dKO=1, dKX=1, dOX=21
- `OCAKX`: dAC=1, dAK=1, dAO=1, dAX=11, dCK=21, dCO=1, dCX=21, dKO=11, dKX=11, dOX=1
- `OCXKA`: dAC=1, dAK=1, dAO=1, dAX=11, dCK=11, dCO=1, dCX=1, dKO=21, dKX=11, dOX=21
- `OCKXA`: dAC=11, dAK=11, dAO=1, dAX=1, dCK=1, dCO=1, dCX=11, dKO=11, dKX=1, dOX=11
- `OXACK`: dAC=11, dAK=11, dAO=21, dAX=1, dCK=1, dCO=21, dCX=11, dKO=1, dKX=1, dOX=1
- `OXCAK`: dAC=1, dAK=1, dAO=11, dAX=11, dCK=11, dCO=11, dCX=1, dKO=1, dKX=11, dOX=1
- `OXCKA`: dAC=11, dAK=11, dAO=1, dAX=21, dCK=1, dCO=1, dCX=1, dKO=11, dKX=21, dOX=1
- `OXKAC`: dAC=1, dAK=1, dAO=1, dAX=11, dCK=21, dCO=1, dCX=21, dKO=11, dKX=11, dOX=1
- `OKACX`: dAC=1, dAK=1, dAO=11, dAX=11, dCK=11, dCO=11, dCX=1, dKO=1, dKX=11, dOX=1
- `OKCAX`: dAC=11, dAK=11, dAO=21, dAX=1, dCK=1, dCO=21, dCX=11, dKO=1, dKX=1, dOX=1
- `OKCXA`: dAC=21, dAK=21, dAO=11, dAX=11, dCK=1, dCO=11, dCX=1, dKO=1, dKX=11, dOX=11
- `OKXAC`: dAC=1, dAK=1, dAO=11, dAX=1, dCK=11, dCO=11, dCX=21, dKO=1, dKX=1, dOX=21

Exact metric witness for each feasible order:

- `OAXCK`: dAC=40, dAK=40, dAO=30, dAX=30, dCK=20, dCO=30, dCX=20, dKO=20, dKX=30, dOX=30
- `OAXKC`: dAC=30, dAK=30, dAO=20, dAX=20, dCK=20, dCO=20, dCX=30, dKO=30, dKX=20, dOX=30
- `OAKCX`: dAC=40, dAK=40, dAO=30, dAX=40, dCK=30, dCO=30, dCX=20, dKO=40, dKX=40, dOX=20
- `OAKXC`: dAC=30, dAK=30, dAO=20, dAX=30, dCK=40, dCO=20, dCX=20, dKO=40, dKX=30, dOX=30
- `OCAXK`: dAC=30, dAK=30, dAO=30, dAX=20, dCK=40, dCO=30, dCX=40, dKO=20, dKX=20, dOX=30
- `OCAKX`: dAC=30, dAK=30, dAO=30, dAX=30, dCK=50, dCO=30, dCX=40, dKO=40, dKX=30, dOX=20
- `OCXKA`: dAC=30, dAK=30, dAO=20, dAX=30, dCK=40, dCO=20, dCX=20, dKO=40, dKX=30, dOX=30
- `OCKXA`: dAC=30, dAK=30, dAO=20, dAX=20, dCK=20, dCO=20, dCX=30, dKO=30, dKX=20, dOX=30
- `OXACK`: dAC=40, dAK=40, dAO=40, dAX=30, dCK=30, dCO=40, dCX=40, dKO=20, dKX=30, dOX=20
- `OXCAK`: dAC=20, dAK=20, dAO=30, dAX=30, dCK=30, dCO=30, dCX=20, dKO=20, dKX=30, dOX=20
- `OXCKA`: dAC=40, dAK=40, dAO=30, dAX=40, dCK=30, dCO=30, dCX=20, dKO=40, dKX=40, dOX=20
- `OXKAC`: dAC=30, dAK=30, dAO=30, dAX=30, dCK=50, dCO=30, dCX=40, dKO=40, dKX=30, dOX=20
- `OKACX`: dAC=20, dAK=20, dAO=30, dAX=30, dCK=30, dCO=30, dCX=20, dKO=20, dKX=30, dOX=20
- `OKCAX`: dAC=40, dAK=40, dAO=40, dAX=30, dCK=30, dCO=40, dCX=40, dKO=20, dKX=30, dOX=20
- `OKCXA`: dAC=40, dAK=40, dAO=30, dAX=30, dCK=20, dCO=30, dCX=20, dKO=20, dKX=30, dOX=30
- `OKXAC`: dAC=30, dAK=30, dAO=30, dAX=20, dCK=40, dCO=30, dCX=40, dKO=20, dKX=20, dOX=30

## X=C

- Kalmanson-contradictory: 8/24
- Banked constructors: 8/24
- Kalmanson-feasible: 16/24
- Infeasible after positivity + strict triangles: 8/24
- Additional closures from strict triangles: 0/24

| order | reflection | status | constructor/certificate |
|---|---|---|---|
| OACJK | OKJCA | feasible |  |
| OACKJ | OJKCA | contradictory | orderCKJOA; 1*K2[OACK]+1*K2[OCKJ]=0 modulo equalities |
| OAJCK | OKCJA | feasible |  |
| OAJKC | OCKJA | feasible |  |
| OAKCJ | OJCKA | feasible |  |
| OAKJC | OCJKA | contradictory | orderCOAKJ; 1*K2[OAKC]+1*K1[OKJC]=0 modulo equalities |
| OCAJK | OKJAC | feasible |  |
| OCAKJ | OJKAC | feasible |  |
| OCJAK | OKAJC | contradictory | orderOCJAK; 1*K2[OCJA]+1*K1[OCAK]=0 modulo equalities |
| OCJKA | OAKJC | contradictory | orderCJKAO; 1*K2[OCJK]+1*K1[OCKA]=0 modulo equalities |
| OCKAJ | OJAKC | feasible |  |
| OCKJA | OAJKC | feasible |  |
| OJACK | OKCAJ | contradictory | orderACKOJ; 1*K1[OJAC]+1*K1[OACK]=0 modulo equalities |
| OJAKC | OCKAJ | feasible |  |
| OJCAK | OKACJ | feasible |  |
| OJCKA | OAKCJ | feasible |  |
| OJKAC | OCAKJ | feasible |  |
| OJKCA | OACKJ | contradictory | orderCAOJK; 1*K1[OJKC]+1*K1[OKCA]=0 modulo equalities |
| OKACJ | OJCAK | feasible |  |
| OKAJC | OCJAK | contradictory | orderOKAJC; 1*K2[OKAC]+1*K1[OAJC]=0 modulo equalities |
| OKCAJ | OJACK | contradictory | orderAJOKC; 1*K2[OKCA]+1*K2[OCAJ]=0 modulo equalities |
| OKCJA | OAJCK | feasible |  |
| OKJAC | OCAJK | feasible |  |
| OKJCA | OACJK | feasible |  |

Kalmanson-feasible orders:

OACJK, OAJCK, OAJKC, OAKCJ, OCAJK, OCAKJ, OCKAJ, OCKJA, OJAKC, OJCAK, OJCKA, OJKAC, OKACJ, OKCJA, OKJAC, OKJCA

Exact witness for each feasible order:

- `OACJK`: dAC=1, dAJ=11, dAK=1, dAO=1, dCJ=11, dCK=11, dCO=21, dJK=1, dJO=21, dKO=1
- `OAJCK`: dAC=11, dAJ=1, dAK=11, dAO=1, dCJ=1, dCK=1, dCO=11, dJK=11, dJO=11, dKO=1
- `OAJKC`: dAC=21, dAJ=1, dAK=21, dAO=1, dCJ=11, dCK=11, dCO=1, dJK=1, dJO=1, dKO=11
- `OAKCJ`: dAC=11, dAJ=21, dAK=11, dAO=1, dCJ=1, dCK=1, dCO=1, dJK=21, dJO=1, dKO=11
- `OCAJK`: dAC=11, dAJ=1, dAK=11, dAO=11, dCJ=21, dCK=21, dCO=11, dJK=1, dJO=11, dKO=1
- `OCAKJ`: dAC=1, dAJ=11, dAK=1, dAO=11, dCJ=11, dCK=11, dCO=1, dJK=1, dJO=1, dKO=11
- `OCKAJ`: dAC=11, dAJ=1, dAK=11, dAO=21, dCJ=1, dCK=1, dCO=1, dJK=11, dJO=1, dKO=21
- `OCKJA`: dAC=21, dAJ=1, dAK=21, dAO=1, dCJ=11, dCK=11, dCO=1, dJK=1, dJO=1, dKO=11
- `OJAKC`: dAC=11, dAJ=1, dAK=11, dAO=21, dCJ=1, dCK=1, dCO=1, dJK=11, dJO=1, dKO=21
- `OJCAK`: dAC=1, dAJ=21, dAK=1, dAO=21, dCJ=1, dCK=1, dCO=11, dJK=11, dJO=11, dKO=1
- `OJCKA`: dAC=11, dAJ=21, dAK=11, dAO=1, dCJ=1, dCK=1, dCO=1, dJK=21, dJO=1, dKO=11
- `OJKAC`: dAC=1, dAJ=11, dAK=1, dAO=11, dCJ=11, dCK=11, dCO=1, dJK=1, dJO=1, dKO=11
- `OKACJ`: dAC=1, dAJ=21, dAK=1, dAO=21, dCJ=1, dCK=1, dCO=11, dJK=11, dJO=11, dKO=1
- `OKCJA`: dAC=11, dAJ=1, dAK=11, dAO=1, dCJ=1, dCK=1, dCO=11, dJK=11, dJO=11, dKO=1
- `OKJAC`: dAC=11, dAJ=1, dAK=11, dAO=11, dCJ=21, dCK=21, dCO=11, dJK=1, dJO=11, dKO=1
- `OKJCA`: dAC=1, dAJ=11, dAK=1, dAO=1, dCJ=11, dCK=11, dCO=21, dJK=1, dJO=21, dKO=1

Exact metric witness for each feasible order:

- `OACJK`: dAC=30, dAJ=40, dAK=30, dAO=20, dCJ=40, dCK=40, dCO=40, dJK=30, dJO=40, dKO=20
- `OAJCK`: dAC=30, dAJ=20, dAK=30, dAO=20, dCJ=20, dCK=20, dCO=30, dJK=30, dJO=30, dKO=20
- `OAJKC`: dAC=40, dAJ=20, dAK=40, dAO=20, dCJ=40, dCK=40, dCO=30, dJK=30, dJO=30, dKO=40
- `OAKCJ`: dAC=30, dAJ=40, dAK=30, dAO=20, dCJ=30, dCK=30, dCO=30, dJK=50, dJO=30, dKO=40
- `OCAJK`: dAC=30, dAJ=20, dAK=30, dAO=30, dCJ=40, dCK=40, dCO=30, dJK=20, dJO=30, dKO=20
- `OCAKJ`: dAC=20, dAJ=30, dAK=20, dAO=30, dCJ=30, dCK=30, dCO=20, dJK=20, dJO=20, dKO=30
- `OCKAJ`: dAC=30, dAJ=20, dAK=30, dAO=30, dCJ=30, dCK=30, dCO=20, dJK=40, dJO=20, dKO=40
- `OCKJA`: dAC=40, dAJ=20, dAK=40, dAO=20, dCJ=40, dCK=40, dCO=30, dJK=30, dJO=30, dKO=40
- `OJAKC`: dAC=30, dAJ=20, dAK=30, dAO=30, dCJ=30, dCK=30, dCO=20, dJK=40, dJO=20, dKO=40
- `OJCAK`: dAC=20, dAJ=40, dAK=20, dAO=30, dCJ=30, dCK=30, dCO=30, dJK=40, dJO=30, dKO=20
- `OJCKA`: dAC=30, dAJ=40, dAK=30, dAO=20, dCJ=30, dCK=30, dCO=30, dJK=50, dJO=30, dKO=40
- `OJKAC`: dAC=20, dAJ=30, dAK=20, dAO=30, dCJ=30, dCK=30, dCO=20, dJK=20, dJO=20, dKO=30
- `OKACJ`: dAC=20, dAJ=40, dAK=20, dAO=30, dCJ=30, dCK=30, dCO=30, dJK=40, dJO=30, dKO=20
- `OKCJA`: dAC=30, dAJ=20, dAK=30, dAO=20, dCJ=20, dCK=20, dCO=30, dJK=30, dJO=30, dKO=20
- `OKJAC`: dAC=30, dAJ=20, dAK=30, dAO=30, dCJ=40, dCK=40, dCO=30, dJK=20, dJO=30, dKO=20
- `OKJCA`: dAC=30, dAJ=40, dAK=30, dAO=20, dCJ=40, dCK=40, dCO=40, dJK=30, dJO=40, dKO=20

