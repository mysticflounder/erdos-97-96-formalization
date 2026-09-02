from __future__ import annotations
import itertools, json
from collections import Counter, defaultdict
from pathlib import Path

def perms_for(n, fixed=()):
    fixed=set(fixed); free=[i for i in range(n) if i not in fixed]
    for pfree in itertools.permutations(free):
        p=list(range(n))
        for i,j in zip(free,pfree): p[i]=j
        yield tuple(p)

def run(n):
    # F1={0..3}, T0={2,3}, R={4,5,6}, Z starts at 7.
    F=frozenset(range(4)); T0=frozenset((2,3)); R=frozenset((4,5,6))
    C=T0|R; Z=tuple(range(7,n)); H=tuple(range(2,4)) # F1\T0 is not in Y
    O1,O2=Z[:2]
    points=tuple(range(n)); Ts=((4,5),(4,6),(5,6))
    def assignments():
        for choices in itertools.product((0,1), repeat=3):
            x={r: Ts[i] for i,r in enumerate((4,5,6))}
            # choice bit selects the first/second T containing r.
            x={4:(Ts[0] if choices[0]==0 else Ts[1]),
               5:(Ts[0] if choices[1]==0 else Ts[2]),
               6:(Ts[1] if choices[2]==0 else Ts[2])}
            yield x
    def base_structures():
        for xmap in assignments():
            phys={T:frozenset(r for r,T1 in xmap.items() if T1==T) for T in Ts}
            q=tuple(len(phys[T]) for T in Ts)
            # n=13 has no defect; n=12 has one unit defect in one class.
            defects=(None,) if n==13 else range(3)
            for d in defects:
                e=tuple(2 if d is None or i!=d else 1 for i in range(3))
                for groups in itertools.product(*[() for _ in ()]):
                    pass
                # ordered disjoint groups of the required sizes partition Z
                rem=set(Z)
                def split(i, cur):
                    if i==3:
                        if not rem:
                            yield tuple(cur)
                        return
                    for g in itertools.combinations(sorted(rem),e[i]):
                        rem.difference_update(g); cur.append(frozenset(g))
                        yield from split(i+1,cur)
                        cur.pop(); rem.update(g)
                for groups in split(0,[]):
                    X={T:phys[T]|groups[i] for i,T in enumerate(Ts)}
                    # K_T extras are exactly the source outsiders except for
                    # one spare slot in the deficient class.
                    spare_choices=[None] if d is None else tuple(p for p in points if p not in C and p not in groups[d])
                    for spare in spare_choices:
                        E={T:frozenset(groups[i]) for i,T in enumerate(Ts)}
                        if d is not None: E[Ts[d]]=E[Ts[d]]|{spare}
                        K={T:frozenset(T)|E[T] for T in Ts}
                        if any(not X[T] <= K[T] for T in Ts): continue
                        if any(len(K[Ts[i]] & K[Ts[j]])>2 for i,j in itertools.combinations(range(3),2)): continue
                        yield tuple(X[T] for T in Ts),tuple(K[T] for T in Ts),q,d,xmap
    def base_sig(X,K):
        # preserve the X_T/K_T pairing while forgetting the names of the 3 traces
        return tuple(sorted((tuple(sorted(x)),tuple(sorted(k))) for x,k in zip(X,K)))
    # canonicalize under permutations preserving F1,T0,R and O1/O2.
    group=[]
    for pf in perms_for(2):
      for pt in perms_for(2,()):
       for pr in perms_for(3,()):
        # T0 and R blocks are shifted; O1/O2 fixed; free Z permuted.
        p=[None]*n
        for i,j in enumerate(pf): p[i]=j
        for i,j in enumerate(pt): p[2+i]=2+j
        for i,j in enumerate(pr): p[4+i]=4+j
        free=[z for z in Z if z not in (O1,O2)]
        for pfree in itertools.permutations(free):
          pp=p[:]
          for z,w in zip(free,pfree): pp[z]=w
          pp[O1]=O1; pp[O2]=O2; group.append(tuple(pp))
    def transform_sets(sets,p): return tuple(frozenset(p[x] for x in s) for s in sets)
    def canon_base(X,K):
        vals=[]
        for p in group:
            vals.append(base_sig(transform_sets(X,p),transform_sets(K,p)))
        return min(vals)
    bases={}
    rawbase=0
    for X,K,q,d,xmap in base_structures():
        rawbase+=1; sig=canon_base(X,K)
        bases.setdefault(sig,(X,K,q,d,xmap))
    # For each base orbit enumerate blocker triples, retaining canonical base-relative
    # descriptors. b_T in F is a sink; b_T in X_U gives edge T->U.
    blocker_desc=set(); location=Counter(); coarse_patterns=set(); cycles=Counter(); cycles_by_q=Counter(); full=Counter(); shared_bases=0
    for bi,(X,K,q,d,xmap) in enumerate(bases.values()):
        if any(len(K[i] & K[j])==2 for i,j in itertools.combinations(range(3),2)): shared_bases += 1
        # only automorphisms preserving this concrete base (and O roles).
        aut=[]; bsig=base_sig(X,K)
        for p in group:
            if base_sig(transform_sets(X,p),transform_sets(K,p))==bsig: aut.append(p)
        choices=[]
        for i,T in enumerate(Ts):
            choices.append(tuple(p for p in points if p not in K[i] and p not in (O1,O2)))
        for b in itertools.product(*choices):
            if len(set(b))<3: continue
            # source membership is explicit: each Y point is in exactly one X_T;
            # beta(F1)=O1 and beta(X_T)=b_T, so b_T's carrier map is induced.
            cls={p:i for i,S in enumerate(X) for p in S}
            edge=[]; loc=[]
            for i,p in enumerate(b):
                if p in F: edge.append(-1); loc.append('F1')
                elif p in R: edge.append(cls[p]); loc.append('R')
                else: edge.append(cls[p]); loc.append(f'X{cls[p]}')
            # canonicalize blocker triple under base automorphisms.
            variants=[]
            for p in aut:
                bb=tuple(p[x] for x in b)
                variants.append((tuple(sorted(bb)),bb))
            _,cb=min(variants)
            # map location by class index, canonicalized jointly with b tuple.
            ccls={p:i for i,S in enumerate(X) for p in S}
            ce=[]; cl=[]
            for p in cb:
                if p in F: ce.append(-1);cl.append('F1')
                elif p in R: ce.append(ccls[p]);cl.append('R')
                else: ce.append(ccls[p]);cl.append(f'X{ccls[p]}')
            key=(tuple(q),d,tuple(ce),tuple(cl))
            blocker_desc.add((base_sig(X,K),key))
            coarse=tuple('F1' if ce[i]<0 else 'R' if cl[i]=='R' else 'same_X' if ce[i]==i else 'other_X' for i in range(3))
            location[coarse]+=1
            coarse_patterns.add((tuple(q),d,coarse))
            # directed cycles among trace classes; self-loop counts as cycle 1.
            seen=set(); cy=[]
            for i,j in enumerate(ce):
                if i in seen: continue
                cur=[]; pos={}; x=i
                while x>=0 and x not in pos and x not in seen:
                    pos[x]=len(cur); cur.append(x); x=ce[x]
                if x in pos: cy.append(len(cur)-pos[x])
                seen.update(cur)
            cycles[tuple(sorted(cy,reverse=True))]+=1
            cycles_by_q[(tuple(q),d,tuple(sorted(cy,reverse=True)))]+=1
            full[(tuple(q),d,tuple(cl),tuple(sorted(cy,reverse=True)))]+=1
    return {'n':n,'raw_base':rawbase,'base_orbits':len(bases),'blocker_pattern_count':len(blocker_desc),
            'class_size_patterns':sorted(Counter((q,d) for _,(_,_,q,d,_) in bases.items()).items()),
            'blocker_location_patterns':{str(k):v for k,v in sorted(location.items(),key=str)},
            'coarse_location_pattern_count':len(coarse_patterns),
            'coarse_location_patterns':sorted((str(k),d,coarse) for k,d,coarse in coarse_patterns),
            'cycle_patterns':{str(k):v for k,v in sorted(cycles.items(),key=str)},
            'full_pattern_counts':{str(k):v for k,v in sorted(full.items(),key=str)},
            'shared_pair_base_orbits':shared_bases,
            'cycles_by_class_pattern':{str(k):v for k,v in sorted(cycles_by_q.items(),key=str)},
            'bases':len(bases)}

if __name__=='__main__':
    out={str(n):run(n) for n in (12,13)}
    Path(__file__).with_name('result.json').write_text(json.dumps(out,indent=2,sort_keys=True))
    print(json.dumps({n:{k:v for k,v in d.items() if k not in ('full_pattern_counts','blocker_location_patterns')} for n,d in out.items()},indent=2))
