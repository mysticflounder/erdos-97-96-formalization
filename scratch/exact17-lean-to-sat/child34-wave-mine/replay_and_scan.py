"""Read-only exact17 child34 replay and wave-boundary theorem mine.

This deliberately keeps all generated output in the child34-wave-mine scratch
directory.  It authenticates the immutable root/model pair, checks the parent
prefix and eight-clause suffix, replays every DIMACS clause, and invokes the
existing producer bank for both named source orders.  ``scan_all_formalized_cores``
already checks forward and reverse cyclic orientations for each order.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT))
from census.atail_force import producer_bank

CNF = ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-fourth-root-thirty-third-model-refinements.cnf"
PARENT = ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-third-root-thirty-second-model-refinements.cnf"
MODEL = ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-model.json"
PARENT_MODEL = ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-model.json"
FINAL = ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-final.json"
MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-third-model-refinements-core1.json"
RECEIPT = ROOT / "scratch/exact17-lean-to-sat/child34-export-receipt.json"
CNF_SHA = "ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819"
PARENT_SHA = "775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9"
MODEL_SHA = "2a77785a2bc9e4822c576cb1b210b2c874d69c30382cc688732cae90dc8cb1d8"
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
SUFFIX = (
    (-307, -9, -3, -281, -284, -267, -258, -252, -240, -21, -33, -257, -168, -169, -202, -201, -225, -233),
    (-307, -240, -241, -206, -210, -125, -122, -7, -9, -146, -144, -128, -52, -59, -86, -92, -112, -108),
    (-308, -9, -3, -281, -284, -267, -258, -252, -240, -21, -33, -257, -219, -220, -202, -201, -225, -233),
    (-308, -240, -241, -155, -159, -125, -122, -7, -9, -149, -144, -128, -52, -59, -86, -92, -115, -108),
    (-307, -148, -142, -198, -192, -193, -97, -96, -90),
    (-307, -23, -29, -90, -96, -97, -193, -192, -198),
    (-308, -148, -142, -198, -192, -193, -97, -96, -90),
    (-308, -23, -29, -90, -96, -97, -193, -192, -198),
)

def sha(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()

def obj(path: Path):
    return json.loads(path.read_text(), object_pairs_hook=lambda pairs: dict(pairs))

def assignment(path: Path) -> dict[int, bool]:
    p = obj(path)["model"]
    a = {}
    for lit in p["assignment"]:
        if type(lit) is not int or not lit or abs(lit) in a:
            raise ValueError("malformed/non-unique assignment")
        a[abs(lit)] = lit > 0
    if set(a) != set(range(1, 309)):
        raise ValueError("assignment not total over 308 variables")
    return a

def replay(path: Path, a: dict[int, bool]) -> tuple[int, int, str, list[tuple[int, ...]]]:
    h = hashlib.sha256(); vars_ = clauses = None; seen = 0; pending = []; all_clauses = []
    with path.open("rb") as f:
        for raw in f:
            h.update(raw); line = raw.decode("ascii").strip()
            if not line or line.startswith("c"): continue
            fields = line.split()
            if fields[0] == "p":
                if vars_ is not None or fields[:2] != ["p", "cnf"]: raise ValueError("bad header")
                vars_, clauses = int(fields[2]), int(fields[3]); continue
            for token in fields:
                lit = int(token)
                if lit == 0:
                    if not pending or not any(a[abs(x)] == (x > 0) for x in pending): raise ValueError(f"falsified clause {seen+1}")
                    all_clauses.append(tuple(pending)); pending = []; seen += 1
                else: pending.append(lit)
    if pending or vars_ != 308 or clauses != 5_847_256 or seen != clauses or h.hexdigest() != CNF_SHA:
        raise ValueError(f"replay/provenance mismatch vars={vars_} clauses={clauses} seen={seen} sha={h.hexdigest()}")
    return vars_, seen, h.hexdigest(), all_clauses

def decode(a):
    rows = {str(c): [p for p in range(17) if a[1 + 17*c + p]] for c in range(17)}
    return {"rows": rows, "row_sizes": {c: len(v) for c,v in rows.items()}, "diagonal_hits": [c for c,v in rows.items() if int(c) in v], "next_centers": [c for c in range(17) if a[290+c]], "named_orders": [o for o in range(2) if a[307+o]]}

def scan(decoded):
    rows = [producer_bank.MetricRow(int(c), tuple(v), exact=False) for c,v in sorted(decoded["rows"].items(), key=lambda x:int(x[0]))]
    out = {}
    for i, order in enumerate(ORDERS):
        hits = list(producer_bank.scan_all_formalized_cores(rows, 17, order))
        out[str(i)] = hits
    return out

def key(record):
    return json.dumps(record, sort_keys=True, separators=(",", ":"))

def main():
    for p, expected in ((CNF, CNF_SHA), (PARENT, PARENT_SHA), (MODEL, MODEL_SHA)):
        got = sha(p)
        if got != expected: raise ValueError(f"provenance mismatch {p}: {got}")
    receipt, manifest, final = obj(RECEIPT), obj(MANIFEST), obj(FINAL)
    if receipt["parent"]["sha256"] != PARENT_SHA or receipt["child"]["sha256"] != CNF_SHA or receipt["validation"]["new_clauses"] != 8: raise ValueError("receipt mismatch")
    if manifest["dimacs"]["sha256"] != CNF_SHA or manifest["dimacs"]["clauses"] != 5_847_256 or final["model_check"]["cnf_blob_hash"] != CNF_SHA: raise ValueError("manifest/final mismatch")
    a = assignment(MODEL); vars_, clauses, digest, all_clauses = replay(CNF, a)
    if tuple(all_clauses[-8:]) != SUFFIX: raise ValueError("child34 suffix mismatch")
    decoded = decode(a); child = scan(decoded)
    parent_decoded = decode(assignment(PARENT_MODEL)); parent = scan(parent_decoded)
    child_records = {key(r): (order_i, r) for order_i, hits in child.items() for r in hits}
    parent_keys = {key(r) for hits in parent.values() for r in hits}
    new = [(oi, r, key(r) in parent_keys) for k, (oi, r) in child_records.items()]
    result = {"status":"PASS", "provenance":{"cnf_sha256":digest,"parent_sha256":PARENT_SHA,"model_sha256":MODEL_SHA,"variables":vars_,"clauses":clauses,"suffix_exact":True,"suffix_count":8}, "child34_decode":decoded, "child34_scans":child, "child33_decode":parent_decoded, "child33_scans":parent, "new_records": [{"source_order":oi,"already_in_parent":old,"record":r} for oi,r,old in sorted(new, key=lambda x:key(x[1]))]}
    out = Path(__file__).with_name("child34-wave-mine.json")
    out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"output":str(out),"clauses":clauses,"child_records":len(child_records),"parent_records":len(parent_keys),"new_records":sum(not x[2] for x in new)}))

if __name__ == "__main__": main()
