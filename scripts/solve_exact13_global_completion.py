# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Bounded PIQD global-row completion; exact SAT replay, no UNSAT certification."""

import argparse
import hashlib
import itertools
import json
import time
from collections import Counter, defaultdict
from fractions import Fraction
from pathlib import Path

import solve_exact13_quotient_cones as cone
import z3

base = cone.base
require = cone.exact.require
ROOT = Path("scratch/runs/exact13-quotient-classification-20260905/global-0001")
EDGES = tuple(itertools.combinations(range(13), 2))
CONE_INPUT = Path("docs/audits/2026-09-06-exact13-full-cone.json")
CONE_SHA256 = "d5fa74e8a52a9c6bebca28155a1bf190b6b9253f234fb53728c4a10c94f2ac3d"


def active_centers(record):
    return tuple(c for c in range(2, 13) if c not in (record["roles"]["b0"], record["roles"]["b1"]))


def edge(a, b):
    require(a != b, "diagonal edge")
    return tuple(sorted((a, b)))


def completion_groups(records):
    raw = CONE_INPUT.read_bytes()
    require(hashlib.sha256(raw).hexdigest() == CONE_SHA256, "cone input changed")
    groups = {}
    for entry in json.loads(raw)["entries"]:
        if entry["certificate"]["kind"] != "distance":
            continue
        for i in entry["indices"]:
            roots = base.edge_roots_for_rows(cone.rows_of(records[i]))
            key = (tuple(sorted(roots.items())), active_centers(records[i]))
            groups.setdefault(key, []).append(i)
    return list(groups.values())


def query(record, centers):
    """QF_LRA only: cardinalities use real-valued ITE constants, not Int variables."""
    require(set(centers) <= set(active_centers(record)) and len(set(centers)) == len(centers), "invalid centers")
    solver = z3.SolverFor("QF_LRA")
    distances = {e: z3.Real(f"d_{e[0]}_{e[1]}") for e in EDGES}
    for _, center, support in cone.rows_of(record):
        solver.add(*(distances[edge(center, p)] == distances[edge(center, support[0])] for p in support[1:]))
    for form in base.kalmanson_forms(base.DIRECT_ORDER):
        solver.add(z3.Sum([distances[e] for e in form["positive"]]) -
                   z3.Sum([distances[e] for e in form["negative"]]) >= 1)
    for center in centers:
        radius = z3.Real(f"r_{center}")
        members = {p: z3.Bool(f"g_{center}_{p}") for p in range(13) if p != center}
        solver.add(z3.Sum([z3.If(b, z3.RealVal(1), z3.RealVal(0)) for b in members.values()]) == z3.RealVal(4))
        solver.add(*(z3.Implies(b, distances[edge(center, p)] == radius) for p, b in members.items()))
    payload = "(set-logic QF_LRA)\n" + solver.sexpr() + "\n"
    # Each declaration/assertion starts on a separate line in Z3's serialization.
    count = sum(line.startswith(("(set-logic ", "(declare-fun ", "(assert ")) for line in payload.splitlines())
    return payload, tuple(str(distances[e]) for e in EDGES), count


def replay(record, centers, values):
    """Reconstruct actual four-supports from distances, without trusting Bool/model text."""
    require(set(centers) <= set(active_centers(record)) and len(set(centers)) == len(centers), "invalid centers")
    require(len(values) == 78, "distance dimension")
    d = dict(zip(EDGES, values, strict=True))
    for _, center, support in cone.rows_of(record):
        require(len({d[edge(center, p)] for p in support}) == 1, "base row equality failed")
    gaps = [sum(d[e] for e in f["positive"]) - sum(d[e] for e in f["negative"])
            for f in base.kalmanson_forms(base.DIRECT_ORDER)]
    require(min(gaps) >= 1, "strict gap failed")
    globals_by_center = {}
    for center in centers:
        fibers = defaultdict(list)
        for point in range(13):
            if point != center:
                fibers[d[edge(center, point)]].append(point)
        supports = sorted(tuple(points[:4]) for points in fibers.values() if len(points) >= 4)
        require(bool(supports), "missing four-equal global row")
        globals_by_center[str(center)] = list(supports[0])
    complete = tuple(centers) == active_centers(record)
    if complete:
        base.validate_cell({"roles": record["roles"], "base_rows": record["base_rows"], "global_rows": globals_by_center})
    return {"distances": [str(v) for v in values], "global_rows": globals_by_center,
            "minimum_gap": str(min(gaps)), "all_centers_covered": complete}


def run(record, centers, path, timeout_ms):
    path.mkdir(parents=True, exist_ok=False)
    payload, names, count = query(record, centers)
    require(len(payload.encode()) < 480_000, "query needs chunking")
    query_path = path / "query.smt2"
    query_path.write_text(payload)
    producer = Path(__file__).read_bytes()
    (path / "producer.py").write_bytes(producer)
    result = {"centers": list(centers), "query_sha256": hashlib.sha256(payload.encode()).hexdigest(),
              "producer_sha256": hashlib.sha256(producer).hexdigest()}
    created = cone.transport._run_json(["session", "new", "--solver", "z3", "--lane", "smt", "--label", "exact13-pinned-global-completion"])
    result["created"] = created
    sid = created["id"]
    try:
        asserted = cone.transport._run_json(["session", "assert", sid, "--expect-commands", "0", "--file", str(query_path)])
        require(asserted["commands"] == count, "journal count")
        args = ["session", "solve", sid, "--timeout-ms", str(timeout_ms)]
        for name in names:
            args.extend(("--value", name))
        solved = cone.transport._run_json(args, transport_timeout=timeout_ms / 1000 + 30)
        result["solved"] = solved
        receipts = cone.transport._run_json(["session", "receipts", sid])
        result["receipts"] = receipts
        require(receipts["session_id"] == sid and receipts["count"] == 1 and len(receipts["receipts"]) == 1, "receipt session")
        receipt = receipts["receipts"][0]
        journal = (payload.strip() + "\n").encode()
        require(receipt["base_sha256"] == hashlib.sha256(journal).hexdigest() and receipt["base_bytes"] == len(journal)
                and receipt["base_commands"] == count, "receipt journal")
        require(receipt["get_values"] == list(names) and not receipt["assumptions"], "receipt query")
        require(all(receipt.get(k) == solved.get(k) for k in ("status", "solve_index", "result_sha256", "values")), "receipt result")
        if solved["status"] == "SAT":
            result["certificate"] = replay(record, centers, cone.read_values(solved["values"], names))
        result["classification"] = ("EXACT_SAT" if "certificate" in result else
                                    "UNCERTIFIED_UNSAT" if solved["status"] == "UNSAT" else "UNDECIDED")
    finally:
        result["closed"] = cone.transport._run_json(["session", "close", sid])
        (path / "record.json").write_text(json.dumps(result, sort_keys=True, indent=2) + "\n")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--record", type=int, default=0)
    parser.add_argument("--timeout-ms", type=int, default=60000)
    parser.add_argument("--control", action="store_true", help="Test the base only; no global completion claim")
    parser.add_argument("--verify", type=Path)
    parser.add_argument("--batch", action="store_true")
    parser.add_argument("--wall-seconds", type=int, default=600)
    parser.add_argument("--publish", action="store_true")
    args = parser.parse_args()
    require(not args.publish or args.verify, "publication requires replay")
    raw = cone.INPUT.read_bytes()
    require(hashlib.sha256(raw).hexdigest() == cone.INPUT_SHA256, "input changed")
    records = json.loads(raw)["survivors"]
    if args.verify:
        report = json.loads(args.verify.read_text())
        require(report["schema"] == "exact13-global-completion/v1" and report["input_sha256"] == cone.INPUT_SHA256
                and report["cone_sha256"] == CONE_SHA256, "report input changed")
        expected = {indices[0]: indices for indices in completion_groups(records)}
        seen = set()
        for entry in report["entries"]:
            index = entry["record_index"]
            require(type(index) is int and index in expected and index not in seen, "invalid or duplicate record")
            seen.add(index)
            require(entry["indices"] == expected[index], "completion mapping changed")
            record = records[index]
            result = entry["result"]
            require(result["centers"] == list(active_centers(record)), "not a complete global query")
            status = result["solved"]["status"]
            classification = "EXACT_SAT" if status == "SAT" else "UNCERTIFIED_UNSAT" if status == "UNSAT" else "UNDECIDED"
            require(result["classification"] == classification and (status == "SAT") == ("certificate" in result), "classification mismatch")
            if "certificate" in result:
                cert = result["certificate"]
                require(replay(record, tuple(result["centers"]), tuple(Fraction(v) for v in cert["distances"])) == cert, "certificate mismatch")
        require(report["total_groups"] == len(expected) and report["total_records"] == 468, "universe mismatch")
        if args.publish:
            with Path("docs/audits/2026-09-06-exact13-global-completion.json").open("x") as output:
                output.write(json.dumps(report, indent=2, sort_keys=True) + "\n")
        print(json.dumps({"verified_entries": len(seen), "uncovered_groups": len(expected) - len(seen), "unsat_is_certified": False}))
        return
    require(0 <= args.record < len(records) and 0 < args.timeout_ms <= 120000, "invalid budget or record")
    require((ROOT / "run_manifest.json").is_file(), "missing run manifest")
    if args.batch:
        require(not args.control and 0 < args.wall_seconds <= 1800, "invalid batch budget")
        entries = []
        groups = completion_groups(records)
        start = time.monotonic()
        for indices in groups:
            if time.monotonic() - start >= args.wall_seconds:
                break
            index = indices[0]
            record = records[index]
            path = ROOT / "events" / f"record-{index:03d}-global"
            if (path / "entry.json").exists():
                entry = json.loads((path / "entry.json").read_text())
                require(entry["record_index"] == index and entry["result"]["centers"] == list(active_centers(record)), "resume mapping changed")
            else:
                entry = {"record_index": index, "result": run(record, active_centers(record), path, args.timeout_ms)}
                (path / "entry.json").write_text(json.dumps(entry, sort_keys=True, indent=2) + "\n")
            entries.append({**entry, "indices": indices})
            if len(entries) % 20 == 0:
                print(json.dumps({"processed": len(entries)}), flush=True)
        report = {"schema": "exact13-global-completion/v1", "input_sha256": cone.INPUT_SHA256,
                  "cone_sha256": CONE_SHA256, "total_groups": len(groups), "total_records": 468,
                  "scope": "Pinned five-row family with all nine global rows; raw strict linear distances only. UNSAT is uncertified.",
                  "entries": entries}
        destination = ROOT / "artifacts" / "global-completion.json"
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(json.dumps(report, sort_keys=True, indent=2) + "\n")
        print(json.dumps({"groups": len(entries), "outcomes": Counter(e["result"]["classification"] for e in entries), "report": str(destination)}))
        return
    record = records[args.record]
    centers = () if args.control else active_centers(record)
    tag = f"record-{args.record:03d}" + ("-control" if args.control else "-global")
    result = run(record, centers, ROOT / "events" / tag, args.timeout_ms)
    output = {"record_index": args.record, "result": result}
    print(json.dumps({"record_index": args.record, "classification": result["classification"],
                      "all_centers_covered": result.get("certificate", {}).get("all_centers_covered", False)}))
    (ROOT / "events" / tag / "entry.json").write_text(json.dumps(output, sort_keys=True, indent=2) + "\n")


if __name__ == "__main__":
    main()
