# FreshThird aligned Q/core v6 survivor summary

Bounded Z3 model census only; no closure claim.

## Representative models
### common-x, mode=distinct
- row0 = {source0,source1,x1,shellOverlap}
- row1 = {source0,source1,qFresh,qOther}
- Q = {x0,x1,qFresh,qOther}
- xShell = {x0,x1,shellOverlap,fill3}
- yShell = {y0,y1,fill0,fill2}

### common-x, mode=equal
- row0 = {source0,source1,qFresh,qOther}
- row1 = {source0,source1,qFresh,qOther}
- Q = {x0,x1,qFresh,qOther}
- xShell = {x0,x1,shellOverlap,fill2}
- yShell = {y0,y1,qFresh,fill3}

### common-y, mode=distinct
- row0 = {source0,source1,x1,qOther}
- row1 = {source0,source1,x0,qFresh}
- Q = {x0,x1,qFresh,qOther}
- xShell = {x0,x1,fill2,fill3}
- yShell = {y0,y1,qFresh,shellOverlap}

### common-y, mode=equal
- row0 = {source0,source1,y1,qFresh}
- row1 = {source0,source1,y1,qFresh}
- Q = {x0,x1,qFresh,qOther}
- xShell = {x0,x1,fill2,fill3}
- yShell = {y0,y1,qFresh,shellOverlap}

### common-x+y, mode=distinct
- row0 = {source0,source1,x1,shellOverlap}
- row1 = {source0,source1,qFresh,qOther}
- Q = {x0,x1,qFresh,qOther}
- xShell = {x0,x1,shellOverlap,fill3}
- yShell = {y0,y1,fill0,fill2}

### common-x+y, mode=equal
- row0 = {source0,source1,y1,qFresh}
- row1 = {source0,source1,y1,qFresh}
- Q = {x0,x1,qFresh,qOther}
- xShell = {x0,x1,fill2,fill3}
- yShell = {y0,y1,qFresh,shellOverlap}

## Cross-survivor membership census

The census covers all 24 arm/mode models.

- row0: always={source0,source1}; never={}; variable={qFresh,qOther,shellOverlap,x0,x1,y0,y1}
- row1: always={source0,source1}; never={}; variable={qFresh,qOther,shellOverlap,x0,x1,y0,y1}
- Q: always={qFresh,qOther,x0,x1}; never={shellOverlap,source0,source1,y0,y1}; variable={}
- xShell: always={x0,x1}; never={qFresh,qOther,source0,source1,y0,y1}; variable={fill0,fill1,fill2,fill3,shellOverlap}
- yShell: always={y0,y1}; never={source0,source1,x0,x1}; variable={fill0,fill1,fill2,fill3,qFresh,qOther,shellOverlap}

## Structural invariants visible in every model

- row0 and row1 are exact-four named supports containing source0 and source1.
- Q is exactly {x0,x1,qFresh,qOther}.
- xShell and yShell are exact-four supports, synchronized across cores and disjoint.
- Every xShell contains x0,x1 and excludes source0,source1; every yShell contains y0,y1 and excludes source0,source1.
- Anonymous fillers absorb the remaining shell capacity; their memberships are not fixed by the clauses.
- Equal mode has row0=row1; distinct mode has row0∩row1 of size ≤2.

status=PASS
