"""Authenticate Child35 SAT and mine only its new model against the theorem bank."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT))
from census.atail_force import producer_bank

CNF = ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-fifth-root-thirty-fourth-model-refinements.cnf"
PARENT = ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-fourth-root-thirty-third-model-refinements.cnf"
MODEL = ROOT / "scratch/exact17-lean-to-sat/piqd-child35-core1-custody-model.json"
PARENT_MODEL = ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-model.json"
FINAL = ROOT / "scratch/exact17-lean-to-sat/piqd-child35-core1-custody-final.json"
MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-fourth-model-refinements-core1.json"
RECEIPT = ROOT / "scratch/exact17-lean-to-sat/child35-export-receipt.json"
CNF_SHA = "0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f"
PARENT_SHA = "ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819"
MODEL_SHA = "e9d1f74d246225353bbb503c480f44ca2376674a1a6f99b19651b8e7ae5637b3"
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
SUFFIX = (
    (-307, -114, -108, -198, -192, -193, -97, -96, -90),
    (-307, -227, -233, -90, -96, -97, -193, -192, -198),
    (-308, -114, -108, -198, -192, -193, -97, -96, -90),
    (-308, -227, -233, -90, -96, -97, -193, -192, -198),
)


def sha(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def obj(path: Path):
    return json.loads(path.read_text(), object_pairs_hook=lambda pairs: dict(pairs))


def assignment(path: Path) -> dict[int, bool]:
    payload = obj(path)["model"]
    result: dict[int, bool] = {}
    for lit in payload["assignment"]:
        if type(lit) is not int or not lit or abs(lit) in result:
            raise ValueError("malformed/non-unique assignment")
        result[abs(lit)] = lit > 0
    if set(result) != set(range(1, 309)):
        raise ValueError("assignment not total over 308 variables")
    return result


def replay(path: Path, assignment_: dict[int, bool]):
    digest = hashlib.sha256()
    variables = declared_clauses = None
    seen = 0
    pending: list[int] = []
    all_clauses: list[tuple[int, ...]] = []
    with path.open("rb") as stream:
        for raw in stream:
            digest.update(raw)
            line = raw.decode("ascii").strip()
            if not line or line.startswith("c"):
                continue
            fields = line.split()
            if fields[0] == "p":
                if variables is not None or fields[:2] != ["p", "cnf"]:
                    raise ValueError("bad header")
                variables, declared_clauses = int(fields[2]), int(fields[3])
                continue
            for token in fields:
                lit = int(token)
                if lit:
                    pending.append(lit)
                    continue
                if not pending or not any(assignment_[abs(x)] == (x > 0) for x in pending):
                    raise ValueError(f"falsified clause {seen + 1}")
                all_clauses.append(tuple(pending))
                pending = []
                seen += 1
    if (
        pending
        or variables != 308
        or declared_clauses != 5_847_260
        or seen != declared_clauses
        or digest.hexdigest() != CNF_SHA
    ):
        raise ValueError(
            f"replay/provenance mismatch vars={variables} clauses={declared_clauses} "
            f"seen={seen} sha={digest.hexdigest()}"
        )
    return variables, seen, digest.hexdigest(), all_clauses


def decode(assignment_: dict[int, bool]):
    rows = {
        str(center): [point for point in range(17) if assignment_[1 + 17 * center + point]]
        for center in range(17)
    }
    return {
        "rows": rows,
        "row_sizes": {center: len(points) for center, points in rows.items()},
        "diagonal_hits": [center for center, points in rows.items() if int(center) in points],
        "next_centers": [center for center in range(17) if assignment_[290 + center]],
        "named_orders": [order for order in range(2) if assignment_[307 + order]],
    }


def scan(decoded):
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(decoded["rows"].items(), key=lambda item: int(item[0]))
    ]
    return {
        str(index): list(producer_bank.scan_all_formalized_cores(rows, 17, order))
        for index, order in enumerate(ORDERS)
    }


def key(record):
    return json.dumps(record, sort_keys=True, separators=(",", ":"))


def main():
    for path, expected in ((CNF, CNF_SHA), (PARENT, PARENT_SHA), (MODEL, MODEL_SHA)):
        actual = sha(path)
        if actual != expected:
            raise ValueError(f"provenance mismatch {path}: {actual}")
    receipt, manifest, final = obj(RECEIPT), obj(MANIFEST), obj(FINAL)
    if (
        receipt["parent"]["sha256"] != PARENT_SHA
        or receipt["child"]["sha256"] != CNF_SHA
        or receipt["validation"]["new_clauses"] != 4
    ):
        raise ValueError("receipt mismatch")
    if (
        manifest["dimacs"]["sha256"] != CNF_SHA
        or manifest["dimacs"]["clauses"] != 5_847_260
        or final["model_check"]["cnf_blob_hash"] != CNF_SHA
    ):
        raise ValueError("manifest/final mismatch")
    child_assignment = assignment(MODEL)
    variables, clauses, digest, all_clauses = replay(CNF, child_assignment)
    if tuple(all_clauses[-4:]) != SUFFIX:
        raise ValueError("Child35 suffix mismatch")
    child_decoded = decode(child_assignment)
    child = scan(child_decoded)
    parent_decoded = decode(assignment(PARENT_MODEL))
    parent = scan(parent_decoded)
    child_records = {
        key(record): (order_index, record)
        for order_index, hits in child.items()
        for record in hits
    }
    parent_keys = {key(record) for hits in parent.values() for record in hits}
    records = [
        (order_index, record, key(record) in parent_keys)
        for order_index, record in child_records.values()
    ]
    result = {
        "status": "PASS",
        "provenance": {
            "cnf_sha256": digest,
            "parent_sha256": PARENT_SHA,
            "model_sha256": MODEL_SHA,
            "variables": variables,
            "clauses": clauses,
            "suffix_exact": True,
            "suffix_count": 4,
        },
        "child35_decode": child_decoded,
        "child35_scans": child,
        "child34_decode": parent_decoded,
        "child34_scans": parent,
        "new_records": [
            {"source_order": order_index, "already_in_parent": old, "record": record}
            for order_index, record, old in sorted(records, key=lambda item: key(item[1]))
        ],
    }
    output = Path(__file__).with_name("child35-wave-mine.json")
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output),
                "clauses": clauses,
                "child_records": len(child_records),
                "parent_records": len(parent_keys),
                "new_records": sum(not record[2] for record in records),
            }
        )
    )


if __name__ == "__main__":
    main()
