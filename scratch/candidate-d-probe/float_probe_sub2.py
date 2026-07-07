#!/usr/bin/env python3
"""Dense float search for a SUB2-H witness: (v2, w_a, w_b, x, v3) convex CCW
(all 10 triples positive), w_a, w_b, x in the open lower half-disk
H = {p: p0^2+p1^2 < p0, p1 < 0} (the omega >= 0 lens always embeds in H),
|x-w_a| = |x-w_b| = rho. 2-left pattern; 2-right is its mirror.

Float-only: HEURISTIC evidence. A found witness gets rationalized and
exactly verified elsewhere before any claim.
"""
import math
import sys


def sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def in_H(p, eps):
    return p[1] < -eps and p[0] * p[0] + p[1] * p[1] < p[0] - eps


def main():
    eps = 1e-4
    V2, V3 = (0.0, 0.0), (1.0, 0.0)
    best = None
    NX, NY, NR, NT = 40, 20, 24, 180
    for ix in range(1, NX):
        x0 = ix / NX
        ymax = math.sqrt(max(x0 - x0 * x0, 0.0))
        for iy in range(1, NY):
            x1 = -ymax * iy / NY
            x = (x0, x1)
            if not in_H(x, eps):
                continue
            for ir in range(1, NR):
                rho = 0.9 * ir / NR
                for ib in range(NT):
                    tb = math.pi * (0.5 + ib / NT)   # theta_b in (90,270)
                    wb = (x0 + rho * math.cos(tb), x1 + rho * math.sin(tb))
                    if not in_H(wb, eps) or wb[0] >= x0 - eps:
                        continue
                    for ia in range(NT):
                        ta = math.pi * (0.5 + ia / NT)
                        if ta >= tb - 1e-9:
                            continue     # need sin(tb-ta)>0 with both left:
                        wa = (x0 + rho * math.cos(ta),
                              x1 + rho * math.sin(ta))
                        if not in_H(wa, eps) or wa[0] >= wb[0] - eps:
                            continue
                        seq = [V2, wa, wb, x, V3]
                        m = min(sA2(seq[i], seq[j], seq[k])
                                for i in range(3) for j in range(i + 1, 4)
                                for k in range(j + 1, 5))
                        if m > eps:
                            print("WITNESS", x, rho, ta, tb, "margin", m)
                            return 0
                        if best is None or m > best[0]:
                            best = (m, x, rho, ta, tb)
    print("no witness; best margin", best[0] if best else None)
    if best:
        print("best config: x=%s rho=%.4f ta=%.4f tb=%.4f" %
              (best[1], best[2], best[3], best[4]))
    return 1


if __name__ == "__main__":
    sys.exit(main())
