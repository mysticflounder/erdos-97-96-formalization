# Exact local negative control — self-contained evidence

**Date:** 2026-09-05. **Scope:** thirty rational points realizing the listed local physical/MEC conditions, NOT global K4, NOT a total CriticalShellSystem, NOT CounterexampleData.

Save the first payload as `named_core_exact_model.json` and the second as `verify_named_core.py` in the same directory. Run `python verify_named_core.py`. Only the Python standard library is required. The verifier recomputes every positive heavy radius class, all 840 strict supporting-edge orientations, the MEC-support facts, all named source/row relationships, and the failure of global K4. It does not import a search or construction script.

Payload hashes:

```text
5da18b79baa270b97efa072a44bbc4bed9862ccbe0802b7b5619f3490cbd278a  named_core_exact_model.json
9749b0b34ecb9fc6fb8fb9885a0037916357c837324f8464ebec7b671c29462b  verify_named_core.py
```

## Exact coordinates and advertised roles

```json
{
  "scope": "Thirty-point exact local physical core: genuine nonobtuse MEC triangle; exact five-class; both source-controlled omissions; all seven named centers have K4. Not global K4 or a total CriticalShellSystem.",
  "epsilon": "1/100000",
  "points": {
    "O": [
      "0",
      "-1"
    ],
    "L": [
      "-60818509/62332309",
      "13653780/62332309"
    ],
    "R": [
      "60818509/62332309",
      "13653780/62332309"
    ],
    "v0": [
      "-57259966985056374979119/58707933010826188035445",
      "2558809421670236622843/11741586602165237607089"
    ],
    "a": [
      "-743039668677039667063908/769284571609732287171365",
      "34684983338975403873234/153856914321946457434273"
    ],
    "d": [
      "278761255208979904809756/377621305216409849661125",
      "141478604796167020858908/377621305216409849661125"
    ],
    "v3": [
      "69439458498084663913852/75053730627450858897685",
      "3849335250667444428466/15010746125490171779537"
    ],
    "v4": [
      "817770732899296376797244/838154253707270483865925",
      "182425288729474952577692/838154253707270483865925"
    ],
    "e": [
      "-2671515594453976262542141092743885543052532298/20321147177498449607428608764119950660834268625",
      "30561946866832028244180080685250528610347413133/60963441532495348822285826292359851982502805875"
    ],
    "z": [
      "-175393303055566767665706185971046681295525321574097187993975059/184249179828314368432771258925819540012418906581360792018361375",
      "34337938300667878626085888690981738744737197799607245462786463/184249179828314368432771258925819540012418906581360792018361375"
    ],
    "t": [
      "-142603570049652119220774171199441655501559404180428529027990644/215946374794263113734679435414923971497426269746714631549290125",
      "-43310026163510925902400229820806810790193194989536004488958692/215946374794263113734679435414923971497426269746714631549290125"
    ],
    "Rrow1": [
      "-46783468447503421/47947930004794793",
      "136513472610053780/623323090062332309"
    ],
    "Rrow2": [
      "-152046272317544473/155830772562332309",
      "34122286311853780/155830772562332309"
    ],
    "Rrow3": [
      "-608185088357900257/623323090560990781",
      "136464817912084020/623323090560990781"
    ],
    "Rrow4": [
      "-38011567942544473/38957693187332309",
      "8527530662753780/38957693187332309"
    ],
    "Lrow1": [
      "46783468447503421/47947930004794793",
      "136513472610053780/623323090062332309"
    ],
    "Lrow2": [
      "152046272317544473/155830772562332309",
      "34122286311853780/155830772562332309"
    ],
    "Lrow3": [
      "608185088357900257/623323090560990781",
      "136464817912084020/623323090560990781"
    ],
    "Lrow4": [
      "38011567942544473/38957693187332309",
      "8527530662753780/38957693187332309"
    ],
    "zrow1": [
      "-17620146641222202437268748254581478363729776399917952005180211701122418/18242493054132602615406207501890759000495134711148780463019549920973875",
      "1370840319192195451117563279938957827282409551774805714359438434710192/6080831018044200871802069167296919666831711570382926821006516640324625"
    ],
    "zrow2": [
      "-148303020916405501475356797388030421388546202771562587017849797328221406/153540983251678366970080838582440036318955602155273628875754743172787125",
      "103841025697461728082359496647606720540066393048665085678108021801288176/460622949755035100910242515747320108956866806465820886627264229518361375"
    ],
    "zrow3": [
      "-593212563858645375763851183909532543031016698214929471130949186125292654/614163933313795434260847301717712243485521641975126026471953626055084125",
      "138454529639579110011315120747131270876987612983509354728804741487964528/614163933313795434260847301717712243485521641975126026471953626055084125"
    ],
    "arow1": [
      "73104281882622615130844458590740503870672210508842977211/74923880786300833303394495241841043866334788607884131785",
      "3280047722616216456266475223328344468898307637064732672/14984776157260166660678899048368208773266957721576826357"
    ],
    "arow2": [
      "292417127569718106501641862060236871948541602825842977211/299695523145203243304921037406400174854722288607884131785",
      "13120193218017829622911815037980500295627891252724732672/59939104629040648660984207481280034970944457721576826357"
    ],
    "arow3": [
      "292417127648172875642556092041467938106414033557842977211/299695523145203243304921037406400174854722288607884131785",
      "13120197873123765561449585515277846046909556790084732672/59939104629040648660984207481280034970944457721576826357"
    ],
    "arow4": [
      "73104281921849999701301573581356036949608425874842977211/74923880786300833303394495241841043866334788607884131785",
      "3280050050169184425535360461977017344539140405744732672/14984776157260166660678899048368208773266957721576826357"
    ],
    "drow1": [
      "-3588494477237974437661846587672574546838021611303113874667/3677813737405216144475770852617467965964313611986413787625",
      "805044339999383092033668879559005135704762848125484914644/3677813737405216144475770852617467965964313611986413787625"
    ],
    "drow2": [
      "-14353977904368892220710938447889840713933857667375113874667/14711254949620864533769318561607278306683063611986413787625",
      "3220177309569785639259194443514373426828851766854484914644/14711254949620864533769318561607278306683063611986413787625"
    ],
    "drow3": [
      "-142118593021810702419756730774343081009163499436506077967/145655989600206579542270480807992854521614491207786275125",
      "31882942660537546815122076018513254156757387048895890244/145655989600206579542270480807992854521614491207786275125"
    ],
    "drow4": [
      "-3588494472654968799504092267831979780833849499159113874667/3677813737405216144475770852617467965964313611986413787625",
      "805044289571636386567736496736737757206585010667484914644/3677813737405216144475770852617467965964313611986413787625"
    ]
  },
  "hull": [
    "L",
    "Rrow1",
    "Rrow2",
    "Rrow3",
    "drow1",
    "drow2",
    "Rrow4",
    "drow3",
    "drow4",
    "v0",
    "z",
    "t",
    "O",
    "v4",
    "arow1",
    "arow2",
    "Lrow4",
    "arow3",
    "arow4",
    "Lrow3",
    "Lrow2",
    "Lrow1",
    "R",
    "v3",
    "d",
    "e",
    "a",
    "zrow1",
    "zrow2",
    "zrow3"
  ],
  "C5": [
    "a",
    "d",
    "v0",
    "v3",
    "v4"
  ],
  "K0": [
    "a",
    "v0",
    "v3",
    "v4"
  ],
  "Kb": [
    "a",
    "zrow1",
    "zrow2",
    "zrow3"
  ],
  "K2": [
    "L",
    "Rrow1",
    "Rrow2",
    "Rrow3"
  ],
  "Ke": [
    "a",
    "d",
    "z",
    "t"
  ],
  "roles": {
    "O": "O",
    "P": "R",
    "surplus_apex": "L",
    "retained": "a",
    "deleted": "d",
    "fresh": "z",
    "retained_blocker": "z",
    "deleted_blocker": "e",
    "fresh_blocker": "e"
  },
  "orientation_tests": 840,
  "minimum_orientation": "825477303810326202313508163968781965674137713473849154192000000/34838790757961941566695692707481201367626744545055772148821390294938653313051547699402141",
  "all_heavy_classes": {
    "O": [
      [
        "v0",
        "a",
        "d",
        "v3",
        "v4"
      ]
    ],
    "L": [
      [
        "R",
        "Lrow1",
        "Lrow2",
        "Lrow3",
        "Lrow4"
      ]
    ],
    "R": [
      [
        "L",
        "Rrow1",
        "Rrow2",
        "Rrow3",
        "Rrow4"
      ]
    ],
    "v0": [],
    "a": [
      [
        "Lrow4",
        "arow1",
        "arow2",
        "arow3",
        "arow4"
      ]
    ],
    "d": [
      [
        "Rrow4",
        "drow1",
        "drow2",
        "drow3",
        "drow4"
      ]
    ],
    "v3": [],
    "v4": [],
    "e": [
      [
        "a",
        "d",
        "z",
        "t"
      ]
    ],
    "z": [
      [
        "a",
        "zrow1",
        "zrow2",
        "zrow3"
      ]
    ],
    "t": [],
    "Rrow1": [],
    "Rrow2": [],
    "Rrow3": [],
    "Rrow4": [],
    "Lrow1": [],
    "Lrow2": [],
    "Lrow3": [],
    "Lrow4": [],
    "zrow1": [],
    "zrow2": [],
    "zrow3": [],
    "arow1": [],
    "arow2": [],
    "arow3": [],
    "arow4": [],
    "drow1": [],
    "drow2": [],
    "drow3": [],
    "drow4": []
  },
  "deletion_table": {
    "a": {
      "O": true,
      "R": true,
      "L": true,
      "z": false,
      "e": false
    },
    "d": {
      "O": true,
      "R": true,
      "L": true,
      "z": true,
      "e": false
    },
    "z": {
      "O": true,
      "R": true,
      "L": true,
      "z": true,
      "e": false
    }
  },
  "global_K4_centers": [
    "O",
    "L",
    "R",
    "a",
    "d",
    "e",
    "z"
  ],
  "named_center_extension_recipe": [
    {
      "center": "a",
      "anchor": "Lrow4",
      "epsilon": "1/100000000",
      "multipliers": [
        -2,
        -1,
        1,
        2
      ]
    },
    {
      "center": "d",
      "anchor": "Rrow4",
      "epsilon": "1/1000000000",
      "multipliers": [
        -2,
        -1,
        1,
        2
      ]
    }
  ]
}
```

## Independent checker

```python
"""Independent exact audit of the saved local model; no search/construction imports."""
from fractions import Fraction as Q
from pathlib import Path
import json
p=Path(__file__).parent
D=json.loads((p/'named_core_exact_model.json').read_text());P={k:tuple(map(Q,v)) for k,v in D['points'].items()}
def sub(a,b):return(a[0]-b[0],a[1]-b[1])
def dot(a,b):return a[0]*b[0]+a[1]*b[1]
def ds(a,b):v=sub(a,b);return dot(v,v)
def ar(a,b,c):u=sub(b,a);v=sub(c,a);return u[0]*v[1]-u[1]*v[0]
assert len(P)==30 and len(set(P.values()))==30
h=D['hull'];assert len(h)==30 and set(h)==set(P)
areas=[ar(P[h[i]],P[h[(i+1)%len(h)]],P[k]) for i in range(len(h)) for k in P if k not in [h[i],h[(i+1)%len(h)]]]
assert len(areas)==840 and min(areas)>0
assert all(dot(v,v)<=1 for v in P.values())
assert {k for k,v in P.items() if dot(v,v)==1}=={'O','L','R'}
for u,v,w in [('O','L','R'),('L','O','R'),('R','O','L')]:assert dot(sub(P[v],P[u]),sub(P[w],P[u]))>0
b=P['L'][1];weights={'O':b/(1+b),'L':1/(2*(1+b)),'R':1/(2*(1+b))}
assert all(w>0 for w in weights.values()) and sum(weights.values())==1
assert all(sum(weights[k]*P[k][j] for k in weights)==0 for j in range(2))
# Weighted squared-distance identity proves unit disk is the unique MEC.
caps={}
for a,u,v in [('O','L','R'),('R','O','L'),('L','R','O')]:
 interior={k for k,x in P.items() if ar(P[u],P[v],x)*ar(P[u],P[v],P[a])<0}
 caps[a]={'interior':sorted(interior),'closed':sorted(interior|{u,v})}
assert all(sum(k in caps[a]['interior'] for a in caps)==1 for k in P if k not in {'O','L','R'})
assert set(D['C5'])&set(caps['O']['interior'])=={'a','d','v3'}
assert {'a','d','e'}<=set(caps['O']['interior'])
assert 'z' not in caps['O']['closed'] and 't' not in caps['O']['closed']
# Compute all positive radius classes independently, not just advertised rows.
classes={}
for c in P:
 bins={}
 for x in P:
  if x!=c:bins.setdefault(ds(P[c],P[x]),set()).add(x)
 classes[c]=[(r,xs) for r,xs in bins.items() if len(xs)>=4]
assert classes['O']==[(ds(P['O'],P['a']),set(D['C5']))]
assert classes['e']==[(ds(P['e'],P['a']),{'a','d','z','t'})]
assert classes['z']==[(ds(P['z'],P['a']),{'a','zrow1','zrow2','zrow3'})]
for c in ['O','L','R','a','d']:assert len(classes[c])==1 and len(classes[c][0][1])==5
K4centers={c for c in P if classes[c]};assert K4centers=={'O','L','R','a','d','e','z'}
K0=set(D['K0']);Kb=set(D['Kb']);K2=set(D['K2'])
assert K0==set(D['C5'])-{'d'} and Kb==classes['z'][0][1]
assert len(K2)==4 and any(K2<=xs for _,xs in classes['R'])
assert {'d','z'}.isdisjoint(K0|Kb|K2) and 'a' in K0&Kb and 'a' not in K2
assert 'z' not in set(D['C5'])
def survives(deleted,center):return any(len(xs-set(deleted))>=4 for _,xs in classes[center])
assert survives(['a','d'],'R') and not survives(['a','d'],'O')
for src,blk in [('a','z'),('d','e'),('z','e')]:assert src!=blk and not survives([src],blk)
for src in ['a','d','z']:
 assert survives([src],'O') and survives([src],'R')
assert survives(['z'],'z') # Centerwise existence, even though that center is erased.
r2=ds(P['O'],P['a']);s2=ds(P['e'],P['a']);assert 0<s2<r2
assert ds(P['O'],P['z'])<r2 and ds(P['O'],P['t'])<r2
unique4centers={c for c in P if len(classes[c])==1 and len(classes[c][0][1])==4}
cover=set().union(*(classes[c][0][1] for c in unique4centers))
assert unique4centers=={'e','z'} and len(cover)==7 and not {'O','L','R'}&cover
out={'points':30,'strict_supporting_edge_tests':len(areas),'MEC_boundary':['O','L','R'],'MEC_center_weights':{k:str(v) for k,v in weights.items()},'cap_sizes':{k:len(v['closed']) for k,v in caps.items()},'strict_cap_sizes':{k:len(v['interior']) for k,v in caps.items()},'K4_centers':sorted(K4centers),'missing_global_K4_count':len(P)-len(K4centers),'unique_four_centers':sorted(unique4centers),'unique_four_support_cover':sorted(cover),'r_squared':str(r2),'s_squared':str(s2),'fresh_is_blocker_center':True,'claims_full_counterexample':False}
(p/'independent_verification.json').write_text(json.dumps(out,indent=2)+'\n')
print('PASS: 30 distinct rational points, 840 strict supporting-edge orientations.')
print('PASS: unique unit MEC; only O,L,R on its boundary; triangle strictly acute.')
print('PASS: cap sizes',out['cap_sizes'],'and exact first-class strict slice {a,d,v3}.')
print('PASS: source-controlled physical rows, simultaneous second-apex survival, named blocking failures.')
print('PASS: all seven named centers have K4; five have a full five-point class.')
print('PASS: strict row-radius drop and both exterior supports strictly inside the first-apex radius.')
print('NONCLAIM: global K4 fails at 23 other points; unique-four rows cover only 7 points; no total H/minimal D.')
```

## Reproduced output

```text
PASS: 30 distinct rational points, 840 strict supporting-edge orientations.
PASS: unique unit MEC; only O,L,R on its boundary; triangle strictly acute.
PASS: cap sizes {'O': 9, 'R': 13, 'L': 11} and exact first-class strict slice {a,d,v3}.
PASS: source-controlled physical rows, simultaneous second-apex survival, named blocking failures.
PASS: all seven named centers have K4; five have a full five-point class.
PASS: strict row-radius drop and both exterior supports strictly inside the first-apex radius.
NONCLAIM: global K4 fails at 23 other points; unique-four rows cover only 7 points; no total H/minimal D.
```

## Recomputed audit record

```json
{
  "points": 30,
  "strict_supporting_edge_tests": 840,
  "MEC_boundary": [
    "O",
    "L",
    "R"
  ],
  "MEC_center_weights": {
    "O": "13653780/75986089",
    "L": "62332309/151972178",
    "R": "62332309/151972178"
  },
  "cap_sizes": {
    "O": 9,
    "R": 13,
    "L": 11
  },
  "strict_cap_sizes": {
    "O": 7,
    "R": 11,
    "L": 9
  },
  "K4_centers": [
    "L",
    "O",
    "R",
    "a",
    "d",
    "e",
    "z"
  ],
  "missing_global_K4_count": 23,
  "unique_four_centers": [
    "e",
    "z"
  ],
  "unique_four_support_cover": [
    "a",
    "d",
    "t",
    "z",
    "zrow1",
    "zrow2",
    "zrow3"
  ],
  "r_squared": "21964063703322841/9021531883245025",
  "s_squared": "89145252562946023968037192046575782827746472051259841932374173/115418580502722756060694825576209683936985769860508195595060625",
  "fresh_is_blocker_center": true,
  "claims_full_counterexample": false
}
```

The payload was extracted to a fresh temporary directory and replayed while assembling this handoff. Both stdout and the recomputed audit record matched the stored versions byte-for-byte. This authenticates the finite arithmetic claims only; it is not a Lean proof of the general geometry or the full exact-five leaf.
