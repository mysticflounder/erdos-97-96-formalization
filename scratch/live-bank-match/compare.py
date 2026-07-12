#!/usr/bin/env python3
"""LIVE-BANK-MATCH comparator: (open leaf) x (bank consumer) -> verdict.

For each pair we ask: could the consumer be applied AT the leaf, i.e. is every
hypothesis of the consumer derivable from the leaf's extracted surface?

Instantiation freedom granted (and no more):
  - baseP := p, baseQ := q, selectedU := u  (forced: U3FixedTriplePacket is
    only available for (q, p) and the base-six distinctness only covers u);
  - (baseT1, baseT2, baseT3) := any permutation pi of (t1, t2, t3)
    (U3FixedTriplePacket is symmetric in the t-labels, so hfixed transports);
  - packet slot choices f2..f5 := any CriticalSlotChoice sigma (20 slot terms),
    subject to not PROVABLY violating packet distinctness (a choice resolving
    to a base point, or two choices resolving to the same point, can never
    build `labels_pairwise`).

Atom semantics (all up to the leaf's equality closure):
  hrow(c, m, b)      derivable iff some available centered row R has
                     center = pt(c) and pt(m), pt(b) both on R's shell.
  all8 field         dist(pt(c), rowAt(r)[i]) = dist(pt(c), rowAt(r)[0]):
                     derivable iff some available row R has center = pt(c)
                     and both slot points on R's shell.
  fix placement      pt(lhs) = rowAt(r)[i] in the closure.
  occ placement      forces sigma(fK) := (r, i).
  packet             provable 10-label pairwise distinctness for some sigma.
                     Provable diseqs = base-six pairwise + polarity/fresh
                     diseqs + within-row slot distinctness (lI != lJ).
  hfixed             available at every leaf (hfixed, t-symmetric).

Verdict: MATCH   = all atoms + packet derivable under one (pi, sigma);
         PARTIAL = >= 1 hrow/all8/placement atom derivable, rest missing;
         NO-MATCH= zero atoms derivable.
"""
import itertools
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from leafmodel import closure, resolve_rows

BASE = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/live-bank-match")
leaves_data = json.loads((BASE / "leaf_packets.json").read_text())
bank = json.loads((BASE / "bank_surfaces.json").read_text())

OPEN = [l for l in leaves_data["leaves"] if l["status"] == "open"]
PERMS = list(itertools.permutations(["t1", "t2", "t3"]))
SLOT_TERMS = [(src, i) for src in ["q", "t1", "t2", "t3", "u"] for i in range(4)]


def leaf_src(consumer_src: str, pi: dict) -> str:
    """Map a consumer CriticalSource name to the leaf row key under pi."""
    if consumer_src == "f1":
        return "u"
    if consumer_src == "q":
        return "q"
    return pi[consumer_src]          # t1/t2/t3


def slot_term(src: str, i: int) -> str:
    return f"{src}row[{i}]"


def analyze(leaf: dict, consumer: dict) -> dict:
    uf = closure(leaf)
    rows = resolve_rows(leaf, uf)
    base_reps = {uf.find(x) for x in ["p", "q", "t1", "t2", "t3", "u"]}

    # provable disequality reps (for packet feasibility bookkeeping)
    diseq_reps = {frozenset((uf.find(d["lhs"]), uf.find(d["rhs"])))
                  for d in leaf["diseqs"]}
    # within-row slot distinctness (selected.lI_ne_lJ), incl. the f2 row
    for src in ["q", "t1", "t2", "t3", "u"]:
        for i in range(4):
            for j in range(i + 1, 4):
                diseq_reps.add(frozenset((uf.find(slot_term(src, i)),
                                          uf.find(slot_term(src, j)))))
    for i in range(1, 5):
        for j in range(i + 1, 5):
            diseq_reps.add(frozenset((uf.find(f"f2.l{i}"), uf.find(f"f2.l{j}"))))

    def provably_ne(a: str, b: str) -> bool:
        ra, rb = uf.find(a), uf.find(b)
        return ra != rb and frozenset((ra, rb)) in diseq_reps

    f_labels = sorted({h["member"] for h in consumer["hrows"] if h["member"].startswith("f") and h["member"] != "f1"}
                      | {h["base"] for h in consumer["hrows"] if h["base"].startswith("f") and h["base"] != "f1"}
                      | {p["lhs"][:2] for p in consumer["placements"] if p["kind"] == "occ"})

    best = None
    for pi_t in PERMS:
        pi = dict(zip(["t1", "t2", "t3"], pi_t))

        def pt_base(label: str) -> str:
            if label == "p":
                return "p"
            if label == "q":
                return "q"
            if label == "f1":
                return "u"
            return pi[label]          # t1/t2/t3

        # sigma constraints from occ placements (forced choices)
        forced = {}
        occ_ok = True
        for plc in consumer["placements"]:
            if plc["kind"] == "occ":
                fk = plc["lhs"][:2]
                choice = (leaf_src(plc["row"], pi), plc["slot"])
                if fk in forced and forced[fk] != choice:
                    occ_ok = False
                forced[fk] = choice
        if not occ_ok:
            continue

        # candidate sigma values per f-label: forced, else any slot term that
        # can make >= 1 atom derivable, else a wildcard (first unconstrained)
        def atom_hrow_ok(c: str, m: str, b: str, sigma: dict) -> bool:
            def pt(lbl):
                if lbl in ("p", "q", "t1", "t2", "t3", "f1"):
                    return uf.find(pt_base(lbl))
                ch = sigma.get(lbl)
                return uf.find(slot_term(*ch)) if ch else None
            pc, pm, pb = pt(c), pt(m), pt(b)
            if None in (pc, pm, pb):
                return False
            return any(r["center"] == pc and pm in r["members"] and pb in r["members"]
                       for r in rows)

        def sigma_packet_violation(sigma: dict) -> bool:
            """True if sigma PROVABLY violates packet distinctness."""
            vals = [uf.find(slot_term(*v)) for v in sigma.values()]
            if len(set(vals)) != len(vals):
                return True
            return any(v in base_reps for v in vals)

        # candidate sigma values per f-label: forced choices, plus any slot
        # term that can make >= 1 atom derivable, plus a wildcard (None)
        cand = {}
        for fk in f_labels:
            if fk in forced:
                cand[fk] = [forced[fk]]
                continue
            useful = set()
            for st in SLOT_TERMS:
                for h in consumer["hrows"]:
                    if fk not in (h["member"], h["base"]):
                        continue
                    others = {x for x in (h["member"], h["base"])
                              if x.startswith("f") and x != "f1" and x != fk}
                    if others:
                        # pair-atom: try with every choice for the partner
                        if any(atom_hrow_ok(h["center"], h["member"], h["base"],
                                            {fk: st, next(iter(others)): st2})
                               for st2 in SLOT_TERMS):
                            useful.add(st)
                    else:
                        if atom_hrow_ok(h["center"], h["member"], h["base"],
                                        {fk: st}):
                            useful.add(st)
            cand[fk] = sorted(useful) + [None]

        # wildcard pool: slot terms whose value is unresolved (rep not a base
        # point), used to fill f-labels that contribute no derivable atom
        wildcard_pool = [st for st in SLOT_TERMS
                         if uf.find(slot_term(*st)) not in base_reps]

        for combo in itertools.product(*(cand[fk] for fk in f_labels)):
            sigma = dict(zip(f_labels, [c for c in combo]))
            # fill wildcards with distinct unresolved slots
            used = {v for v in sigma.values() if v is not None}
            pool = [st for st in wildcard_pool if st not in used]
            for fk in f_labels:
                if sigma[fk] is None:
                    if not pool:
                        break
                    sigma[fk] = pool.pop(0)
            if any(v is None for v in sigma.values()):
                continue
            if len(set(sigma.values())) != len(sigma):
                continue
            if sigma_packet_violation(sigma):
                continue
            derivable, missing = [], []
            # hrows
            for h in consumer["hrows"]:
                ok = atom_hrow_ok(h["center"], h["member"], h["base"], sigma)
                (derivable if ok else missing).append(
                    {"atom": h["name"],
                     "detail": f"{h['center']}({h['member']}={h['base']})",
                     "kind": "hrow", "ok": ok})
            # all8 fields
            for f in consumer.get("all8_fields", []):
                src = leaf_src(f["row"], pi)
                pc = uf.find(pt_base(f["center"]))
                pm = uf.find(slot_term(src, f["member_slot"]))
                pb = uf.find(slot_term(src, f["base_slot"]))
                ok = any(r["center"] == pc and pm in r["members"] and pb in r["members"]
                         for r in rows)
                (derivable if ok else missing).append(
                    {"atom": f["field"],
                     "detail": f"dist({pt_base(f['center'])},{src}row[{f['member_slot']}])"
                               f"=dist({pt_base(f['center'])},{src}row[{f['base_slot']}])"
                               f" [consumer center label {f['center']}]",
                     "kind": "all8", "ok": ok})
            # fix placements
            for plc in consumer["placements"]:
                if plc["kind"] != "fix":
                    continue
                src = leaf_src(plc["row"], pi)
                ok = uf.find(pt_base(plc["lhs"])) == uf.find(slot_term(src, plc["slot"]))
                (derivable if ok else missing).append(
                    {"atom": plc["name"],
                     "detail": f"{plc['lhs']}={src}row[{plc['slot']}]",
                     "kind": "placement", "ok": ok})
            # packet distinctness: needed pairs provable?
            labels10 = ["p", "q", pi["t1"], pi["t2"], pi["t3"], "u"] + \
                       [slot_term(*sigma[fk]) for fk in f_labels]
            unprovable_pairs = []
            for i in range(len(labels10)):
                for j in range(i + 1, len(labels10)):
                    a, b = labels10[i], labels10[j]
                    if not provably_ne(a, b):
                        unprovable_pairs.append((a, b))
            packet_ok = not unprovable_pairs

            score = (len(derivable), packet_ok)
            rec = {
                "pi": pi, "sigma": {k: list(v) for k, v in sigma.items()},
                "n_derivable": len(derivable), "n_missing": len(missing),
                "derivable": derivable, "missing": missing,
                "packet_constructible": packet_ok,
                "packet_unprovable_pairs": len(unprovable_pairs),
                "packet_unprovable_sample": unprovable_pairs[:4],
            }
            if best is None or score > (best["n_derivable"], best["packet_constructible"]):
                best = rec
    assert best is not None
    n_atoms = best["n_derivable"] + best["n_missing"]
    if best["n_missing"] == 0 and best["packet_constructible"]:
        verdict = "MATCH"
    elif best["n_derivable"] > 0:
        verdict = "PARTIAL"
    else:
        verdict = "NO-MATCH"
    return {
        "leaf": leaf["leaf_id"], "leaf_line": leaf["line"], "family": leaf["family"],
        "consumer": consumer["name"], "ordinal": consumer["ordinal"],
        "kind": consumer["kind"],
        "verdict": verdict,
        "atoms_total": n_atoms,
        "atoms_derivable": best["n_derivable"],
        "hfixed_available": True,
        "packet_constructible": best["packet_constructible"],
        "packet_unprovable_pairs": best["packet_unprovable_pairs"],
        "best_instantiation": {"t_perm": best["pi"], "slot_choices": best["sigma"]},
        "derivable_atoms": [d["detail"] for d in best["derivable"]],
        "missing_atoms": [m["atom"] + " : " + m["detail"] for m in best["missing"]],
    }


def main() -> None:
    matrix = []
    for leaf in OPEN:
        for consumer in bank["consumers"]:
            matrix.append(analyze(leaf, consumer))
    n = len(matrix)
    by_verdict = {}
    for m in matrix:
        by_verdict.setdefault(m["verdict"], []).append(m)
    summary = {k: len(v) for k, v in sorted(by_verdict.items())}
    partials = sorted(by_verdict.get("PARTIAL", []),
                      key=lambda m: -m["atoms_derivable"])
    out = {
        "n_pairs": n,
        "verdict_counts": summary,
        "matches": [m for m in by_verdict.get("MATCH", [])],
        "top_partials": partials[:12],
        "matrix": matrix,
    }
    (BASE / "match_matrix.json").write_text(json.dumps(out, indent=2))
    print(f"pairs: {n}  verdicts: {summary}")
    for m in by_verdict.get("MATCH", []):
        print("MATCH:", m["leaf"], "<->", m["consumer"])
    for m in partials[:12]:
        print(f"PARTIAL {m['atoms_derivable']}/{m['atoms_total']} "
              f"packet={m['packet_constructible']}: {m['leaf']} (:{m['leaf_line']}) "
              f"<-> {m['consumer']}")
        for d in m["derivable_atoms"]:
            print(f"    + {d}")


if __name__ == "__main__":
    main()
