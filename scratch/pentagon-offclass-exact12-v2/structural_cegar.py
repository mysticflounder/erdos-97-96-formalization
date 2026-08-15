#!/usr/bin/env python3
"""CEGAR-minimize exact-12 incidence survivors by proved metric cores.

This scratch campaign fixes one named-point placement at a time.  Every learned
clause is the negation of a replayed, minimum whole-row certificate for an
order-independent Lean-banked metric obstruction.  The finite ingress and
clause loop remain Python-checked and do not close the universal Lean leaf.
"""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(HERE))

from census.global_confinement import (  # noqa: E402
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from metric_order_mine import boundary_orders, shared_pair_violations  # noqa: E402
from probe import build_case, parse_assignment, verify_drat, write_dimacs  # noqa: E402


def choice_literal(instance, center: int, support: tuple[int, ...]) -> int:
    matches = [
        instance.choice_variables[(center, index)]
        for index, candidate in enumerate(instance.candidates[center])
        if tuple(sorted(candidate)) == support
    ]
    if len(matches) != 1:
        raise RuntimeError(
            f"row ({center}, {support}) has {len(matches)} choice literals"
        )
    return matches[0]


def solve(cnf_path: Path, timeout_s: int, proof_path: Path | None = None):
    command = ["cadical", "-q", "-t", str(timeout_s), str(cnf_path)]
    if proof_path is not None:
        command.append(str(proof_path))
    return subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=timeout_s + 30,
        check=False,
    )


def certificate_key(certificate):
    return tuple(
        (
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in certificate["rows"]
    )


def cross_violation_holds(rows, order, violation):
    centers = tuple(int(center) for center in violation["centers"])
    common_pair = tuple(int(point) for point in violation["common_pair"])
    if len(centers) != 2 or len(set(centers)) != 2:
        return False
    if len(common_pair) != 2 or len(set(common_pair)) != 2:
        return False
    by_center = {row.center: row for row in rows}
    if any(center not in by_center for center in centers):
        return False
    if any(
        point not in by_center[center].support
        for center in centers
        for point in common_pair
    ):
        return False
    positions = {point: index for index, point in enumerate(order)}
    left, right = sorted(positions[center] for center in centers)
    between = [left < positions[point] < right for point in common_pair]
    return between[0] == between[1]


def ordered_cover(rows):
    """Return a sound small row core covering all 24 proved cap orders.

    An order may be rejected either by the source-proved shared-pair
    alternation theorem or by a replayed formalized metric equality core.
    """

    orders = boundary_orders()
    violations = [shared_pair_violations(rows, order) for order in orders]
    full_detections = []
    for order, order_violations in zip(orders, violations, strict=True):
        detection = None
        if not order_violations:
            detection = metric._formalized_metric_core(
                rows, 12, order, include_extended=True, include_ordered=True
            )
            if detection is None:
                return None
        full_detections.append(detection)

    # Search all whole-row subsets. Cross-separation reasons are precomputed
    # because their validity is monotone under retaining both source rows.
    candidate_centers = tuple(range(12))
    selected_rows = None
    selected_reasons = None
    tested = 0
    for size in range(len(candidate_centers) + 1):
        for centers in itertools.combinations(candidate_centers, size):
            tested += 1
            candidate = tuple(rows[center] for center in centers)
            center_set = set(centers)
            reasons = []
            for order, order_violations in zip(orders, violations, strict=True):
                cross = next(
                    (
                        violation
                        for violation in order_violations
                        if set(violation["centers"]) <= center_set
                    ),
                    None,
                )
                if cross is not None:
                    reasons.append(("cross-separation", cross))
                    continue
                detection = metric._formalized_metric_core(
                    candidate,
                    12,
                    order,
                    include_extended=True,
                    include_ordered=True,
                )
                if detection is None:
                    break
                reasons.append(("metric-core", detection))
            if len(reasons) == len(orders):
                selected_rows = candidate
                selected_reasons = reasons
                break
        if selected_rows is not None:
            break
    if selected_rows is None or selected_reasons is None:
        raise RuntimeError("full order reasons lost their row support")

    coverage = []
    learned_key = tuple(
        (row.center, tuple(row.support), bool(row.exact)) for row in selected_rows
    )
    for index, (order, reason) in enumerate(zip(orders, selected_reasons, strict=True)):
        reason_kind, payload = reason
        if reason_kind == "cross-separation":
            if not cross_violation_holds(selected_rows, order, payload):
                raise RuntimeError("cross-separation replay failed")
            coverage.append(
                {
                    "order_id": f"order-{index:02d}",
                    "order": list(order),
                    "reason_kind": reason_kind,
                    "violation": payload,
                }
            )
            continue
        detection = payload
        certificate = certificates._certificate_for_detection(
            selected_rows, 12, detection
        )
        if certificates._validate_certificate(certificate, n=12) is not True:
            raise RuntimeError("ordered metric certificate replay failed")
        replayed = metric._formalized_metric_core(
            selected_rows,
            12,
            order,
            include_extended=True,
            include_ordered=True,
        )
        if replayed != detection:
            raise RuntimeError("ordered metric detection replay changed")
        coverage.append(
            {
                "order_id": f"order-{index:02d}",
                "order": list(order),
                "reason_kind": reason_kind,
                "detection": detection,
                "certificate": certificate,
            }
        )
    return learned_key, {
        "kind": "ordered-cap-cover",
        "compatible_order_count": len(orders),
        "candidate_centers": list(candidate_centers),
        "selected_centers": [row.center for row in selected_rows],
        "subset_candidates_tested": tested,
        "minimum_scope": "all twelve concrete selected rows",
        "order_coverage": coverage,
    }


def replay_journal(instance, journal_path: Path):
    records = []
    seen = set()
    if not journal_path.exists():
        return records, seen
    for line_number, line in enumerate(journal_path.read_text().splitlines(), 1):
        if not line.strip():
            continue
        record = json.loads(line)
        if record.get("kind") == "ordered-cap-cover":
            key = tuple(
                (
                    int(row["center"]),
                    tuple(int(point) for point in row["support"]),
                    bool(row["exact"]),
                )
                for row in record["learned_rows"]
            )
            if record.get("compatible_order_count") != len(boundary_orders()):
                raise RuntimeError(f"journal line {line_number}: incomplete order cover")
            for item in record["order_coverage"]:
                if item.get("reason_kind") == "cross-separation":
                    learned_rows = tuple(
                        metric.MetricRow(center, support, exact)
                        for center, support, exact in key
                    )
                    if not cross_violation_holds(
                        learned_rows, tuple(item["order"]), item["violation"]
                    ):
                        raise RuntimeError(
                            f"journal line {line_number}: cross replay failed"
                        )
                elif certificates._validate_certificate(
                    item["certificate"], n=12
                ) is not True:
                    raise RuntimeError(
                        f"journal line {line_number}: ordered certificate failed"
                    )
        else:
            if certificates._validate_certificate(record["certificate"], n=12) is not True:
                raise RuntimeError(f"journal line {line_number}: certificate failed")
            key = certificate_key(record["certificate"])
        if key in seen:
            raise RuntimeError(f"journal line {line_number}: duplicate learned rows")
        seen.add(key)
        instance.cnf.add_clause(
            tuple(
                -choice_literal(instance, center, support)
                for center, support, _exact in key
            )
        )
        records.append(record)
    return records, seen


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--d", type=int, default=0)
    parser.add_argument("--v", type=int, default=2)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--progress-every", type=int, default=25)
    args = parser.parse_args()

    _model, instance, _blockers, _metadata = build_case(args.d, args.v)
    out = HERE / f"cegar-d{args.d}-v{args.v}"
    out.mkdir(parents=True, exist_ok=True)
    journal_path = out / "journal.jsonl"
    records, seen_nogoods = replay_journal(instance, journal_path)

    for iteration in range(len(records), args.max_iterations):
        cnf_path = out / "current.cnf"
        write_dimacs(instance, cnf_path)
        solved = solve(cnf_path, args.timeout)
        output = solved.stdout + solved.stderr
        if solved.returncode == 20:
            proof_path = out / "terminal.drat"
            terminal = solve(cnf_path, args.timeout, proof_path)
            if terminal.returncode != 20:
                raise RuntimeError("terminal proof rerun did not reproduce UNSAT")
            verify_drat(cnf_path, proof_path, out / "drat-trim.log")
            summary = {
                "status": "UNSAT",
                "iterations": iteration,
                "learned_clauses": len(seen_nogoods),
                "variables": instance.cnf.n_variables,
                "clauses": len(instance.cnf.clauses),
                "drat_verified": True,
            }
            (out / "summary.json").write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n"
            )
            print(json.dumps(summary, sort_keys=True), flush=True)
            return 0
        if solved.returncode != 10:
            raise RuntimeError(
                f"CaDiCaL returned {solved.returncode} at iteration {iteration}"
            )

        _assignment, positive = parse_assignment(output, instance.cnf.n_variables)
        cube = instance.decode_model(positive)
        rows = tuple(
            metric.MetricRow(center, tuple(sorted(cube[center])), False)
            for center in range(12)
        )
        detection = metric._formalized_metric_core(
            rows,
            12,
            (),
            include_extended=True,
            include_ordered=False,
        )
        if detection is None:
            ordered = ordered_cover(rows)
            if ordered is None:
                survivor = {
                    "status": "STRUCTURALLY_UNRESOLVED",
                    "iteration": iteration,
                    "cube": {str(k): list(v) for k, v in sorted(cube.items())},
                }
                (out / "survivor.json").write_text(
                    json.dumps(survivor, indent=2, sort_keys=True) + "\n"
                )
                print(json.dumps(survivor, sort_keys=True), flush=True)
                return 1
            key, record = ordered
            if key in seen_nogoods:
                raise RuntimeError("ordered detector repeated an already learned row nogood")
            seen_nogoods.add(key)
            learned = tuple(
                -choice_literal(instance, center, support)
                for center, support, _exact in key
            )
            instance.cnf.add_clause(learned)
            record.update(
                {
                    "iteration": iteration,
                    "stage": "ordered-cap-cover",
                    "learned_clause": list(learned),
                    "learned_rows": [
                        {
                            "center": center,
                            "support": list(support),
                            "exact": exact,
                        }
                        for center, support, exact in key
                    ],
                }
            )
            with journal_path.open("a") as stream:
                stream.write(json.dumps(record, sort_keys=True) + "\n")
            if iteration == len(records) or (iteration + 1) % args.progress_every == 0:
                print(
                    f"iteration={iteration} stage=ordered-cap-cover "
                    f"rows={len(key)} clauses={len(instance.cnf.clauses)}",
                    flush=True,
                )
            continue

        certificate = certificates._certificate_for_detection(rows, 12, detection)
        if certificates._validate_certificate(certificate, n=12) is not True:
            raise RuntimeError("metric certificate replay failed")
        key = certificate_key(certificate)
        if key in seen_nogoods:
            raise RuntimeError("detector repeated an already learned row nogood")
        seen_nogoods.add(key)
        learned = tuple(
            -choice_literal(instance, center, support)
            for center, support, _exact in key
        )
        instance.cnf.add_clause(learned)
        record = {
            "iteration": iteration,
            "stage": detection["stage"],
            "learned_clause": list(learned),
            "certificate": certificate,
        }
        with journal_path.open("a") as stream:
            stream.write(json.dumps(record, sort_keys=True) + "\n")
        if iteration == 0 or (iteration + 1) % args.progress_every == 0:
            print(
                f"iteration={iteration} stage={detection['stage']} "
                f"rows={len(key)} clauses={len(instance.cnf.clauses)}",
                flush=True,
            )

    summary = {
        "status": "ITERATION_LIMIT",
        "iterations": args.max_iterations,
        "learned_clauses": len(seen_nogoods),
    }
    (out / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(summary, sort_keys=True), flush=True)
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
