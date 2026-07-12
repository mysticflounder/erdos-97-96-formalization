from itertools import combinations
LABELS = list(range(11))
MOSER = {0,1,2}; CAPS = {1,2,3,4,5,6}; INTS = {3,4,5,6}
INTO1 = {7,8}; INTO2 = {9,10}
def moser_one_hit(c, s):
    if c==0: return len(s & {2,7,8})<=1 and len(s & {1,9,10})<=1
    if c==1: return len(s & {2,3,4,5,6})<=1 and len(s & {0,9,10})<=1
    if c==2: return len(s & {1,3,4,5,6})<=1 and len(s & {0,7,8})<=1
    return True
def cap_count_ok(c, s):
    if 1<=c<=6: return len(s & CAPS) == (1 if c<=2 else 2)
    return True
def local_ok(c, s, deleted=None):
    if len(s)!=4 or c in s: return False
    if not moser_one_hit(c,s): return False
    if c>=3 and len(s & MOSER)>2: return False
    if not cap_count_ok(c,s): return False
    if c==0 and deleted is not None and deleted not in s: return False
    return True
# candidateRows sizes per center (deleted irrelevant except c=0)
for c in range(11):
    n = sum(1 for s in combinations([l for l in LABELS], 4) if local_ok(c, set(s)))
    print("center", c, "candidate supports (no deleted gate):", n)
# ERASE seed domains:
# P2 right rows: centers 7,8 (intO1). Lean buckets: moser=verts{0,1,2},
#   same-cap ints minus center, leftAdj of oppIndex1, rightAdj of oppIndex1.
# In label terms own int O1={7,8}, buckets l={9,10}(O2) r=INTS per rowlib.
def sig_of(c, s):
    if c in INTO1: own, left, right = INTO1, INTO2, INTS
    elif c in INTO2: own, left, right = INTO2, INTS, INTO1
    else: return None
    return (len(s&MOSER), len((s&own)-{c}), len(s&left), len(s&right))
tot_p2 = 0; per = {}
for c in [7,8,9,10]:
    surplus_bucket = 3 if c in INTO1 else 2  # index of surplus in sig: r for O1, l for O2
    n = 0
    for s in combinations(LABELS,4):
        s = set(s)
        if not local_ok(c,s): continue
        sig = sig_of(c,s)
        if sig[surplus_bucket] < 1: continue  # pin x in surplus interior
        n += 1
    per[c]=n; tot_p2 += n
print("P2 seed supports per center (pin-compatible, localOK):", per, "total", tot_p2)
# P4-U: center 0, class must contain >=1 intS (the pin x)
n0 = sum(1 for s in combinations(LABELS,4) if local_ok(0,set(s)) and set(s)&INTS)
print("P4-U seed supports at center 0 (>=1 intS):", n0)
# P4-S: centers 3..6, pin x in intS => class ∩ (intS - {c}) >= 1
tot_s = {}
for c in [3,4,5,6]:
    n = sum(1 for s in combinations(LABELS,4) if local_ok(c,set(s)) and (set(s)&(INTS-{c})))
    tot_s[c]=n
print("P4-S seed supports per center:", tot_s, "total", sum(tot_s.values()))
grand = tot_p2 + n0 + sum(tot_s.values())
print("grand total card-11 seed placements:", grand, "; x4 deleted choices:", grand*4)
