"""Random local search over l5_construct parameters maximizing robustness margin."""
import json, sys, copy
import numpy as np
import l5_construct as C

base = json.load(open(sys.argv[1]))
iters = int(sys.argv[2]) if len(sys.argv) > 2 else 200
seed = int(sys.argv[3]) if len(sys.argv) > 3 else 0
rng = np.random.default_rng(seed)

def margin(par):
    cfg, log = C.build(par)
    if cfg is None:
        return -1.0, None
    rep = C.analyze(cfg, par)
    if not (rep['convex_ok'] and rep['classes_exact']):
        return -0.5, rep
    return min(rep['min_ext'], 60 * rep['min_sep']), rep   # degrees vs 60*distance

def mutate(par, scale):
    p = copy.deepcopy(par)
    for key in ('r', 'rho'):
        p[key] += rng.normal(0, 0.004 * scale)
    p['s_v2'] = [s + rng.normal(0, 0.004 * scale) for s in p['s_v2']]
    p['s_v3'] = [s + rng.normal(0, 0.004 * scale) for s in p['s_v3']]
    for key in ('s1', 's2', 's3'):
        p[key] = max(0.01, p[key] * np.exp(rng.normal(0, 0.15 * scale)))
    for key in ('k1', 'k2', 'k3'):
        p[key] = [max(0.05, k * np.exp(rng.normal(0, 0.2 * scale))) for k in p[key]]
    p['arc2'] += rng.normal(0, 0.8 * scale); p['arc3'] += rng.normal(0, 0.8 * scale)
    return p

best_m, best_rep = margin(base)
best = base
print(f"start margin {best_m:.4f}", file=sys.stderr)
for it in range(iters):
    cand = mutate(best, 1.0 if it % 3 else 0.4)
    m, rep = margin(cand)
    if m > best_m:
        best_m, best_rep, best = m, rep, cand
        print(f"it {it}: margin {m:.4f} min_ext {rep['min_ext']} min_sep {rep['min_sep']} tri {rep['triangle']}", file=sys.stderr, flush=True)
json.dump(best, open(sys.argv[4] if len(sys.argv) > 4 else 'par_best.json', 'w'), indent=1)
print(json.dumps(dict(margin=best_m, min_ext=best_rep['min_ext'], min_sep=best_rep['min_sep'], triangle=best_rep['triangle'], cap_sizes=best_rep['cap_sizes'])))
