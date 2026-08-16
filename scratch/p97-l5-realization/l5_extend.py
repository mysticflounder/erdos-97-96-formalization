"""Greedy extension: add critical blocker centers through given named points."""
import json, sys, copy
import numpy as np
import l5_construct as C

par = json.load(open(sys.argv[1]))
targets = sys.argv[2].split(',')
out = sys.argv[3]
par = copy.deepcopy(par)
par.setdefault('extra_centers', [])
for tgt in targets:
    added = False
    for cid in (2, 3, 1):
        if added: break
        for t in np.linspace(0.05, 0.95, 37):
            trial = copy.deepcopy(par)
            name = f"beta_{tgt}"
            # find crossings first with a dry build to choose picks
            cfg, log = C.build(trial)
            if cfg is None:
                print("base build failed", log[-1]); sys.exit(1)
            chains = cfg['chains']; named = cfg['named']
            if tgt not in named and tgt not in ('v1', 'v2', 'v3'):
                print("unknown target", tgt); sys.exit(1)
            cc = chains[cid].point(t)
            if tgt in ('v1', 'v2', 'v3'):
                sp = {'v1': cfg['v'][0], 'v2': cfg['v'][1], 'v3': cfg['v'][2]}[tgt]
            else:
                sc, st = named[tgt]; sp = chains[sc].point(st)
            rad = np.linalg.norm(cc - sp)
            cr = {k: chains[k].crossings(cc, rad) for k in (1, 2, 3)}
            # candidate picks: all crossings except the through-point itself and except the center's own position
            picks = []
            for k in (1, 2, 3):
                for i, tt in enumerate(cr[k]):
                    if tgt not in ('v1', 'v2', 'v3') and k == named[tgt][0] and abs(tt - named[tgt][1]) < 1e-7:
                        continue
                    if k == cid and abs(tt - t) < 1e-7:
                        continue
                    picks.append([k, i])
            if len(picks) < 3:
                continue
            # prefer picks spread over chains; take first 3
            trial['extra_centers'].append(dict(name=name, chain=cid, t=float(t), through=tgt, picks=picks[:3]))
            cfg2, log2 = C.build(trial)
            if cfg2 is None:
                continue
            rep = C.analyze(cfg2, trial)
            if rep['convex_ok'] and rep['classes_exact'] and rep['min_sep'] > 5e-4:
                par = trial
                added = True
                print(f"added {name} on chain {cid} t={t:.3f} radius {rad:.4f} picks {picks[:3]}; N={rep['N']} min_ext={rep['min_ext']} min_sep={rep['min_sep']}", flush=True)
                break
    if not added:
        print(f"could not add blocker for {tgt}")
json.dump(par, open(out, 'w'), indent=1)
cfg, log = C.build(par)
rep = C.analyze(cfg, par)
print(json.dumps(dict(N=rep['N'], convex_ok=rep['convex_ok'], classes_exact=rep['classes_exact'], min_ext=rep['min_ext'], min_sep=rep['min_sep'], cap_sizes=rep['cap_sizes'], centers=list(rep['classes'].keys()))))
