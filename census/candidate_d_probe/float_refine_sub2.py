#!/usr/bin/env python3
"""Local refinement of the SUB2-H near-miss (x~(0.075,-0.184), rho~0.0375,
theta~189-190 deg): does the margin cross 0 (SAT sliver) or asymptote to
0- (boundary collapse)? Also samples other corner scales for scaling law."""
import math


def sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def margin(x0, x1, rho, ta, tb):
    V2, V3 = (0.0, 0.0), (1.0, 0.0)
    x = (x0, x1)
    wa = (x0 + rho * math.cos(ta), x1 + rho * math.sin(ta))
    wb = (x0 + rho * math.cos(tb), x1 + rho * math.sin(tb))
    pts = [x, wa, wb]
    dh = max(p[0] * p[0] + p[1] * p[1] - p[0] for p in pts)   # <=0 in H
    dy = max(p[1] for p in pts)                                # <0
    seq = [V2, wa, wb, x, V3]
    mo = min(sA2(seq[i], seq[j], seq[k]) for i in range(3)
             for j in range(i + 1, 4) for k in range(j + 1, 5))
    ml = min(x0 - wb[0], wb[0] - wa[0])                        # 2-left order
    return min(mo, ml, -dh, -dy)


def local_max(x0, x1, rho, ta, tb, iters=4000, step0=0.02):
    best = margin(x0, x1, rho, ta, tb)
    cur = [x0, x1, rho, ta, tb]
    import random
    random.seed(7)
    step = step0
    for it in range(iters):
        cand = [cur[0] + random.uniform(-step, step),
                cur[1] + random.uniform(-step, step),
                max(1e-4, cur[2] + random.uniform(-step, step) * 0.5),
                cur[3] + random.uniform(-step, step) * 2,
                cur[4] + random.uniform(-step, step) * 2]
        m = margin(*cand)
        if m > best:
            best, cur = m, cand
        if it % 800 == 799:
            step *= 0.5
    return best, cur


if __name__ == "__main__":
    b, c = local_max(0.075, -0.1844, 0.0375, 3.2987, 3.3161)
    print("refined best margin:", b)
    print("at:", [round(v, 6) for v in c])
    # independent restarts from other regions
    for seed_pt in [(0.2, -0.3, 0.1, 3.4, 3.6), (0.5, -0.4, 0.2, 3.5, 4.0),
                    (0.85, -0.2, 0.08, 3.3, 3.5), (0.1, -0.1, 0.05, 3.2, 3.4),
                    (0.3, -0.42, 0.3, 3.6, 4.3)]:
        b2, c2 = local_max(*seed_pt, iters=3000)
        print("restart", seed_pt[:2], "best:", round(b2, 9))
