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
def support_mask(s):
    return sum(1 << label for label in s)
def p2_support_chunk_index(support):
    return (support % 8 + 7 * ((support // 8) % 8)
            + 2 * ((support // 64) % 8)) % 8
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
tot_p2 = 0; per = {}; p2_supports = {}
for c in [7,8,9,10]:
    surplus_bucket = 3 if c in INTO1 else 2  # index of surplus in sig: r for O1, l for O2
    supports = []
    for s in combinations(LABELS,4):
        s = set(s)
        if not local_ok(c,s): continue
        sig = sig_of(c,s)
        if sig[surplus_bucket] < 1: continue  # pin x in surplus interior
        supports.append(support_mask(s))
    p2_supports[c] = supports
    per[c]=len(supports); tot_p2 += len(supports)
print("P2 seed supports per center (pin-compatible, localOK):", per, "total", tot_p2)
assert set(per.values()) == {191}
old_profiles = {
    c: [sum(support // 256 == chunk for support in supports)
        for chunk in range(8)]
    for c, supports in p2_supports.items()
}
balanced_profiles = {
    c: [sum(p2_support_chunk_index(support) == chunk for support in supports)
        for chunk in range(8)]
    for c, supports in p2_supports.items()
}
old_counts = [count for profile in old_profiles.values() for count in profile]
balanced_counts = [
    count for profile in balanced_profiles.values() for count in profile
]
print("P2 old support-bin profiles:", old_profiles,
      "range", (min(old_counts), max(old_counts)))
print("P2 balanced support-bin profiles:", balanced_profiles,
      "range", (min(balanced_counts), max(balanced_counts)))
assert min(balanced_counts) >= 21 and max(balanced_counts) <= 25
# P4-U: center 0 plus the exact short-cap Moser-pair containment restriction.
n0 = sum(1 for s in combinations(LABELS,4)
         if local_ok(0,set(s)) and ((1 in s) == (2 in s)))
print("P4-U seed supports at center 0 (Moser-pair containment):", n0)
assert n0 == 47
# P4-S: centers 3..6, pin x in intS => class ∩ (intS - {c}) >= 1
tot_s = {}
for c in [3,4,5,6]:
    n = sum(1 for s in combinations(LABELS,4) if local_ok(c,set(s)) and (set(s)&(INTS-{c})))
    tot_s[c]=n
print("P4-S seed supports per center:", tot_s, "total", sum(tot_s.values()))
grand = tot_p2 + n0 + sum(tot_s.values())
m1_searches = n0 + 4 * (tot_p2 + sum(tot_s.values()))
print("grand total card-11 seed supports:", grand,
      "; M1 searches with P4-U deleted-label folding:", m1_searches)
assert grand == 1171 and m1_searches == 4543
