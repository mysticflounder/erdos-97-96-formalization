# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""PIQD full-cone discovery with independent exact rational certificate replay.

Only five-row equality quotients are tested. A feasible distance vector is
not a metric, Euclidean configuration, or all-center completion.
"""

import argparse
import hashlib
import json
import re
import sys
import time
from collections import Counter
from fractions import Fraction
from pathlib import Path

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_tight_cover_lra_piqd as transport
import check_exact13_three_chain_cell as exact
import z3

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from census.cap_configuration.replay import parse_piqd_get_values

INPUT = Path("docs/audits/2026-09-05-exact13-baseline-survivor-family.json")
INPUT_SHA256 = "4e2c1ff2ce9ec35a51c83f8609d73ce122ffd3b16ce9d4f9787a32557723436c"
RUNTIME = Path("scratch/runs/exact13-quotient-classification-20260905/cone-0001")


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def rows_of(record):
    centers = {"C0": record["roles"]["b0"], "C1": record["roles"]["b1"], "K": 0, "L": 0, "T": 1}
    return tuple((name, centers[name], tuple(record["base_rows"][name])) for name in base.BASE_ROWS)


def projected(rows):
    roots = base.edge_roots_for_rows(rows)
    return tuple(exact.project(exact.form_vector(f), roots) for f in base.kalmanson_forms(base.DIRECT_ORDER))


def groups_of(records):
    groups = {}
    for index, record in enumerate(records):
        rows = rows_of(record)
        key = tuple(sorted(base.edge_roots_for_rows(rows).items()))
        groups.setdefault(key, {"rows": rows, "indices": []})["indices"].append(index)
    return list(groups.values())


def query(vectors, kind):
    """Serialize Z3 expressions without running a solver outside PIQD."""
    coordinates = sorted({edge for vector in vectors for edge, _ in vector})
    solver = z3.SolverFor("QF_LRA")
    if kind == "distance":
        variables = [z3.Real(f"q_{i}") for i in range(len(coordinates))]
        by_edge = dict(zip(coordinates, variables, strict=True))
        for vector in vectors:
            solver.add(z3.Sum([coefficient * by_edge[edge] for edge, coefficient in vector]) >= 1)
    elif kind == "cancellation":
        variables = [z3.Real(f"w_{i}") for i in range(len(vectors))]
        solver.add(*(v >= 0 for v in variables))
        solver.add(z3.Sum(variables) == 1)
        for edge in coordinates:
            solver.add(z3.Sum([dict(vector).get(edge, 0) * v
                              for vector, v in zip(vectors, variables, strict=True)
                              if dict(vector).get(edge, 0)]) == 0)
    else:
        raise ValueError("unknown cone query kind")
    # Every declared variable appears in the constraints, except the vacuous
    # no-coordinate contradictory smoke case, which has no variables at all.
    payload = "(set-logic QF_LRA)\n" + solver.sexpr() + "\n"
    return payload, tuple(str(v) for v in variables), 1 + len(variables) + len(solver.assertions())


def normalized_values(payload):
    """Canonicalize exact finite SMT decimals, then use the bounded parser.

    No approximation marker, exponent, algebraic value, or model text is
    interpreted. Finite decimals denote exact rationals in SMT-LIB.
    """
    exact.require(isinstance(payload, str) and len(payload.encode()) <= 1_000_000, "readback too large")

    def decimal(match):
        token = match.group(0)
        exact.require(len(token) <= 1000, "decimal token too large")
        value = Fraction(token)
        return str(value.numerator) if value.denominator == 1 else f"(/ {value.numerator} {value.denominator})"

    return re.sub(r"(?<![^\s(])[0-9]+\.[0-9]+(?=[\s)])", decimal, payload)


def read_values(payload, names):
    return tuple(record.value for record in parse_piqd_get_values(normalized_values(payload), names))


def replay(vectors, kind, values):
    """Check the actual quotient inequalities or a positive zero dependence."""
    if kind == "distance":
        coordinates = sorted({edge for vector in vectors for edge, _ in vector})
        exact.require(len(values) == len(coordinates), "distance dimension mismatch")
        by_edge = dict(zip(coordinates, values, strict=True))
        gaps = [sum((coefficient * by_edge[edge] for edge, coefficient in vector), Fraction(0)) for vector in vectors]
        exact.require(bool(gaps) and min(gaps) >= 1, "strict gap replay failed")
        return {"kind": kind, "values": [str(v) for v in values], "minimum_gap": str(min(gaps))}
    exact.require(kind == "cancellation" and len(values) == len(vectors), "weight dimension mismatch")
    exact.require(all(v >= 0 for v in values) and sum(values) == 1, "weights not a probability vector")
    total = Counter()
    for vector, weight in zip(vectors, values, strict=True):
        for edge, coefficient in vector:
            total[edge] += coefficient * weight
    exact.require(not any(total.values()), "cancellation replay failed")
    return {"kind": kind, "weights": [[i, str(v)] for i, v in enumerate(values) if v]}


def check_certificate(vectors, certificate):
    if certificate["kind"] == "distance":
        expected = replay(vectors, "distance", tuple(Fraction(v) for v in certificate["values"]))
    else:
        weights = [Fraction(0)] * len(vectors)
        seen = set()
        for index, value in certificate["weights"]:
            exact.require(type(index) is int and 0 <= index < len(vectors) and index not in seen, "invalid weight index")
            weights[index] = Fraction(value)
            seen.add(index)
        expected = replay(vectors, "cancellation", tuple(weights))
    exact.require(expected == certificate, "noncanonical certificate")
    return True


def run_query(vectors, kind, root, timeout_ms):
    root.mkdir(parents=True, exist_ok=False)
    payload, names, command_count = query(vectors, kind)
    exact.require(len(payload.encode()) < 480_000, "query requires assertion chunking")
    path = root / "query.smt2"
    path.write_text(payload)
    record = {"kind": kind, "query_sha256": hashlib.sha256(payload.encode()).hexdigest()}
    producer = Path(__file__).read_bytes()
    (root / "producer.py").write_bytes(producer)
    record["producer_sha256"] = hashlib.sha256(producer).hexdigest()
    created = transport._run_json(["session", "new", "--solver", "z3", "--lane", "smt", "--label", "exact13-five-row-full-cone"])
    record["created"] = created
    sid = created["id"]
    try:
        asserted = transport._run_json(["session", "assert", sid, "--expect-commands", "0", "--file", str(path)])
        record["asserted"] = asserted
        exact.require(asserted["commands"] == command_count, "journal command count mismatch")
        args = ["session", "solve", sid, "--timeout-ms", str(timeout_ms)]
        for name in names:
            args.extend(("--value", name))
        solved = transport._run_json(args, transport_timeout=timeout_ms / 1000 + 30)
        record["solved"] = solved
        record["receipts"] = transport._run_json(["session", "receipts", sid])
        receipts = record["receipts"]
        exact.require(receipts["session_id"] == sid and receipts["count"] == 1 and len(receipts["receipts"]) == 1, "receipt session mismatch")
        receipt = receipts["receipts"][0]
        journal = (payload.strip() + "\n").encode()
        exact.require(receipt["base_sha256"] == hashlib.sha256(journal).hexdigest() and
                      receipt["base_bytes"] == len(journal) and receipt["base_commands"] == command_count, "receipt journal mismatch")
        exact.require(receipt["get_values"] == list(names) and not receipt["assumptions"], "receipt query mismatch")
        exact.require(all(receipt.get(key) == solved.get(key) for key in ("status", "solve_index", "result_sha256", "values")), "receipt result mismatch")
        record["receipt_binding_checked"] = True
        if solved["status"] == "SAT":
            record["values_sha256"] = hashlib.sha256(solved["values"].encode()).hexdigest()
            record["normalized_values_sha256"] = hashlib.sha256(normalized_values(solved["values"]).encode()).hexdigest()
            record["certificate"] = replay(vectors, kind, read_values(solved["values"], names))
    finally:
        record["closed"] = transport._run_json(["session", "close", sid])
        (root / "record.json").write_text(json.dumps(record, indent=2, sort_keys=True) + "\n")
    return record


def classify(vectors, root, timeout_ms):
    results = []
    for kind in ("distance", "cancellation"):
        result = run_query(vectors, kind, root / kind, timeout_ms)
        results.append({"kind": kind, "status": result["solved"]["status"], "query_sha256": result["query_sha256"]})
        if "certificate" in result:
            return {"certificate": result["certificate"], "queries": results}
        if result["solved"]["status"] != "UNSAT":
            break
    return {"certificate": None, "queries": results}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--limit", type=int, default=1)
    parser.add_argument("--timeout-ms", type=int, default=5000)
    parser.add_argument("--wall-seconds", type=int, default=600)
    parser.add_argument("--verify", type=Path)
    parser.add_argument("--require-complete", action="store_true")
    parser.add_argument("--publish", action="store_true", help="Publish a fully replayed report to the lane's durable audit path")
    args = parser.parse_args()
    exact.require(not args.publish or (args.verify and args.require_complete), "publication requires complete replay")
    raw = INPUT.read_bytes()
    exact.require(hashlib.sha256(raw).hexdigest() == INPUT_SHA256, "input changed")
    groups = groups_of(json.loads(raw)["survivors"])
    if args.verify:
        report = json.loads(args.verify.read_text())
        exact.require(report["schema"] == "exact13-full-cone/v1" and report["total_groups"] == len(groups) and report["total_records"] == 540, "report header mismatch")
        exact.require(report["input_sha256"] == INPUT_SHA256, "report input mismatch")
        seen = set()
        for entry in report["entries"]:
            index = entry["group"]
            exact.require(type(index) is int and 0 <= index < len(groups) and index not in seen, "duplicate/invalid group")
            seen.add(index)
            exact.require(entry["indices"] == groups[index]["indices"], "record mapping mismatch")
            if entry["certificate"] is not None:
                check_certificate(projected(groups[index]["rows"]), entry["certificate"])
        if args.require_complete:
            exact.require(seen == set(range(len(groups))) and all(e["certificate"] is not None for e in report["entries"]), "coverage incomplete")
        if args.publish:
            destination = Path("docs/audits/2026-09-06-exact13-full-cone.json")
            with destination.open("x") as output:
                output.write(json.dumps(report, sort_keys=True, indent=2) + "\n")
        print(json.dumps({"verified_groups": len(seen), "outcomes": Counter(e["certificate"]["kind"] if e["certificate"] else "undecided" for e in report["entries"])}))
        return
    exact.require((RUNTIME / "run_manifest.json").is_file(), "missing run manifest")
    exact.require(0 < args.timeout_ms <= 60000 and 0 < args.wall_seconds <= 1800 and 0 < args.limit <= 270, "invalid budget")
    if args.smoke:
        # One free coordinate must be >=1; its simultaneous negation cannot.
        edge = (0, 1)
        positive = (((edge, 1),),)
        contradiction = (((edge, 1),), ((edge, -1),))
        sat = classify(positive, RUNTIME / "events/smoke-sat", args.timeout_ms)
        unsat = classify(contradiction, RUNTIME / "events/smoke-unsat", args.timeout_ms)
        exact.require(sat["certificate"]["kind"] == "distance" and unsat["certificate"]["kind"] == "cancellation", "smoke failed")
        print(json.dumps({"smoke": "PASS"}))
        return
    entries = []
    start = time.monotonic()
    for index, group in enumerate(groups[:args.limit]):
        if time.monotonic() - start >= args.wall_seconds:
            break
        root = RUNTIME / f"events/group-{index:03d}"
        result_path = root / "result.json"
        if result_path.exists():
            entry = json.loads(result_path.read_text())
            exact.require(entry["group"] == index and entry["indices"] == group["indices"] and isinstance(entry["queries"], list), "resume mapping mismatch")
            if entry["certificate"] is not None:
                check_certificate(projected(group["rows"]), entry["certificate"])
        else:
            entry = {"group": index, "indices": group["indices"],
                     **classify(projected(group["rows"]), root, args.timeout_ms)}
            result_path.write_text(json.dumps(entry, sort_keys=True) + "\n")
        entries.append(entry)
        if (index + 1) % 20 == 0:
            print(json.dumps({"groups_processed": index + 1}), flush=True)
    report = {"schema": "exact13-full-cone/v1", "input_sha256": INPUT_SHA256,
              "scope": "Five-row quotients only; not Euclidean or all-center survival, not live-source coverage",
              "total_groups": len(groups), "total_records": 540, "entries": entries}
    output = RUNTIME / "artifacts/full-cone.json"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, sort_keys=True, indent=2) + "\n")
    counts = Counter(e["certificate"]["kind"] if e["certificate"] else "undecided" for e in entries)
    print(json.dumps({"groups": len(entries), "outcomes": counts, "report": str(output)}))


if __name__ == "__main__":
    main()
