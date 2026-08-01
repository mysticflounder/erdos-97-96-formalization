"""Audit frozen projected-v2 SAT logs against the exact shell cut."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as cegar


def _assignment(stdout: str) -> dict[int, bool]:
    result: dict[int, bool] = {}
    for line in stdout.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal:
                result[abs(literal)] = literal > 0
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("run_dir", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    manifest = cegar._strict_json(args.run_dir / "manifest.json")
    counts = manifest.get("counts")
    if not isinstance(counts, dict):
        raise cegar.StructuralCegarError("manifest counts are absent")

    encoding = cegar.sat.SatEncoding(
        cegar.CELL,
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope="counterexample_card_ge_ten",
    )
    if (args.run_dir / "base.cnf").read_bytes() != encoding.cnf_bytes():
        raise cegar.StructuralCegarError("frozen base CNF does not replay")

    templates, shell_summary = cegar._load_equilateral_shell_template_bank(
        cegar.EQUILATERAL_SHELL_BOOTSTRAP
    )
    if len(templates) != 1:
        raise cegar.StructuralCegarError("expected exactly one shell template")

    logs = cegar._strict_json_lines(args.run_dir / "solver-logs.jsonl")
    previous: str | None = None
    sat_rows: list[tuple[dict[str, Any], dict[int, bool]]] = []
    sat_by_assignment_hash: dict[str, dict[int, bool]] = {}
    for index, record in enumerate(logs):
        cegar._validate_record_hash(
            record, previous, where=f"solver log {index}"
        )
        previous = record["record_sha256"]
        if record.get("verdict") != "SAT":
            continue
        assignment = _assignment(str(record.get("stdout", "")))
        obj = encoding.decode(assignment)
        encoding.validate(obj, assignment)
        if any(
            not cegar._clause_satisfied(clause, assignment)
            for clause in encoding.clauses
        ):
            raise cegar.StructuralCegarError(
                f"solver log {index} violates the frozen base CNF"
            )
        sat_rows.append((record, assignment))
        assignment_hash = cegar._assignment_hash(encoding, assignment)
        if assignment_hash in sat_by_assignment_hash:
            raise cegar.StructuralCegarError(
                "duplicate raw SAT semantic assignment"
            )
        sat_by_assignment_hash[assignment_hash] = assignment

    raw_count = int(counts.get("raw_sat_count", -1))
    classified_count = int(counts.get("classified_raw_sat_count", -1))
    unclassified_count = int(counts.get("unclassified_raw_sat_count", -1))
    if (
        len(sat_rows) != raw_count
        or raw_count - classified_count != unclassified_count
    ):
        raise cegar.StructuralCegarError("manifest raw SAT counts do not replay")

    matched = 0
    unmatched: list[dict[str, Any]] = []
    permutations: dict[str, int] = {}
    for raw_index, (record, assignment) in enumerate(
        sat_rows[classified_count:], start=classified_count
    ):
        match = cegar._find_algebraic_match(encoding, assignment, templates)
        if match is None:
            unmatched.append(
                {
                    "raw_sat_index": raw_index,
                    "attempt": record["attempt"],
                    "record_sha256": record["record_sha256"],
                    "assignment_sha256": cegar._assignment_hash(
                        encoding, assignment
                    ),
                }
            )
            continue
        matched += 1
        permutation = ",".join(str(value) for value in match[1])
        permutations[permutation] = permutations.get(permutation, 0) + 1

    learned = cegar._strict_json_lines(
        args.run_dir / "learned-certificates.jsonl"
    )
    survivors = cegar._strict_json_lines(args.run_dir / "survivors.jsonl")
    for stream_name, records in (
        ("learned", learned),
        ("survivor", survivors),
    ):
        previous = None
        for index, record in enumerate(records):
            cegar._validate_record_hash(
                record,
                previous,
                where=f"{stream_name} record {index}",
            )
            previous = record["record_sha256"]
    learned_clauses = [tuple(record["clause"]) for record in learned]
    survivor_clauses = [
        tuple(record["blocking_clause"]) for record in survivors
    ]

    cube_batches = cegar._strict_json_lines(
        args.run_dir / "cube-batches.jsonl"
    )
    previous = None
    dispositions: dict[str, int] = {}
    unprocessed_sat: list[dict[str, Any]] = []
    for index, batch in enumerate(cube_batches):
        cegar._validate_record_hash(
            batch, previous, where=f"cube batch {index}"
        )
        previous = batch["record_sha256"]
        for name, count in batch["disposition_histogram"].items():
            dispositions[name] = dispositions.get(name, 0) + int(count)
        results_path = args.run_dir / batch["directory"] / "results.jsonl"
        if cegar._sha256_file(results_path) != batch["results_sha256"]:
            raise cegar.StructuralCegarError(
                f"cube batch {index} results hash mismatch"
            )
        result_previous = None
        for result_index, result in enumerate(
            cegar._strict_json_lines(results_path)
        ):
            cegar._validate_record_hash(
                result,
                result_previous,
                where=f"cube batch {index} result {result_index}",
            )
            result_previous = result["record_sha256"]
            assignment_hash = result.get("assignment_sha256")
            if (
                result.get("disposition") != "unprocessed-after-limit"
                or assignment_hash is None
            ):
                continue
            assignment = sat_by_assignment_hash.get(assignment_hash)
            if assignment is None:
                raise cegar.StructuralCegarError(
                    "unprocessed SAT assignment is absent from solver logs"
                )
            learned_violations = [
                clause_index
                for clause_index, clause in enumerate(learned_clauses)
                if not cegar._clause_satisfied(clause, assignment)
            ]
            survivor_violations = [
                clause_index
                for clause_index, clause in enumerate(survivor_clauses)
                if not cegar._clause_satisfied(clause, assignment)
            ]
            shell_match = cegar._find_algebraic_match(
                encoding, assignment, templates
            )
            if learned_violations:
                classification = "cut-by-final-learned-bank"
            elif survivor_violations:
                classification = "blocked-by-final-survivor-bank"
            elif shell_match is not None:
                classification = "cut-by-exact-shell"
            else:
                classification = "open-after-final-bank-and-shell"
            unprocessed_sat.append(
                {
                    "batch_index": index,
                    "cube_index": result["cube_index"],
                    "assignment_sha256": assignment_hash,
                    "classification": classification,
                    "learned_clause_violations": learned_violations,
                    "survivor_clause_violations": survivor_violations,
                    "shell_match": shell_match is not None,
                }
            )

    unprocessed_histogram: dict[str, int] = {}
    for item in unprocessed_sat:
        classification = item["classification"]
        unprocessed_histogram[classification] = (
            unprocessed_histogram.get(classification, 0) + 1
        )

    all_templates, all_template_summary = cegar._load_algebraic_templates(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAPS
    )
    offline_clauses: list[tuple[int, ...]] = []
    sequential_classification: list[dict[str, Any]] = []
    for item in sorted(
        unprocessed_sat,
        key=lambda value: (value["batch_index"], value["cube_index"]),
    ):
        assignment = sat_by_assignment_hash[item["assignment_sha256"]]
        if item["classification"] != "open-after-final-bank-and-shell":
            sequential_classification.append(
                {
                    **item,
                    "sequential_classification": item["classification"],
                }
            )
            continue
        if any(
            not cegar._clause_satisfied(clause, assignment)
            for clause in offline_clauses
        ):
            sequential_classification.append(
                {
                    **item,
                    "sequential_classification": "offline-stale-new-cut",
                }
            )
            continue

        obj = encoding.decode(assignment)
        rows = cegar._metric_rows(obj)
        found = cegar._detection(rows)
        new_clause: tuple[int, ...] | None = None
        detail: dict[str, Any] = {}
        if found is not None:
            certificate, selected = cegar._certificate(rows, found)
            new_clause = cegar._clause_for_structural_certificate(
                encoding, certificate, selected, assignment
            )
            classification = "new-structural-cut"
            detail = {
                "stage": found["stage"],
                "certificate_schema": certificate.get("schema"),
            }
        else:
            cap_match = cegar._cap_order_certificate(obj, rows)
            rhombus_match = cegar._rhombus_cap_order_certificate(obj, rows)
            kalmanson_match = cegar._kalmanson_cap_order_certificate(obj, rows)
            if cap_match is not None:
                certificate = cap_match[0]
                new_clause = cegar._clause_for_cap_order_certificate(
                    encoding, certificate, assignment
                )
                classification = "new-cap-order-cut"
            elif rhombus_match is not None:
                certificate = rhombus_match[0]
                new_clause = cegar._clause_for_rhombus_cap_order_certificate(
                    encoding, certificate, assignment
                )
                classification = "new-rhombus-cap-order-cut"
            elif kalmanson_match is not None:
                certificate = kalmanson_match[0]
                new_clause = cegar._clause_for_kalmanson_cap_order_certificate(
                    encoding, certificate, assignment
                )
                classification = "new-kalmanson-cap-order-cut"
            else:
                algebraic_match = cegar._find_algebraic_match(
                    encoding, assignment, all_templates
                )
                if algebraic_match is not None:
                    template, permutation, mapped = algebraic_match
                    new_clause = cegar._clause_for_memberships(
                        encoding, mapped, assignment
                    )
                    classification = "new-algebraic-cut"
                    detail = {
                        "template_name": template["name"],
                        "certificate_kind": template["certificate_kind"],
                        "permutation": list(permutation),
                    }
                else:
                    new_clause = encoding.blocking_clause(assignment)
                    classification = "new-structurally-unresolved-survivor"
        if new_clause is None:
            raise cegar.StructuralCegarError(
                "offline sequential classification produced no clause"
            )
        offline_clauses.append(new_clause)
        sequential_classification.append(
            {
                **item,
                "sequential_classification": classification,
                "new_clause_length": len(new_clause),
                "new_clause_sha256": cegar._sha256_value(list(new_clause)),
                **detail,
            }
        )

    sequential_histogram: dict[str, int] = {}
    for item in sequential_classification:
        classification = item["sequential_classification"]
        sequential_histogram[classification] = (
            sequential_histogram.get(classification, 0) + 1
        )

    output = {
        "schema": "p97-projected-v2-offline-exact-shell-sweep-v1",
        "source": {
            "run_dir": str(args.run_dir),
            "manifest_sha256": cegar._sha256_file(
                args.run_dir / "manifest.json"
            ),
            "solver_logs_sha256": cegar._sha256_file(
                args.run_dir / "solver-logs.jsonl"
            ),
        },
        "shell_bank": shell_summary,
        "counts": {
            "raw_sat": raw_count,
            "previously_classified": classified_count,
            "previously_unclassified": unclassified_count,
            "unclassified_exact_shell_matches": matched,
            "unclassified_exact_shell_nonmatches": len(unmatched),
            "matching_permutation_count": len(permutations),
            "cube_dispositions": dict(sorted(dispositions.items())),
            "unprocessed_sat_count": len(unprocessed_sat),
            "unprocessed_sat_classification": dict(
                sorted(unprocessed_histogram.items())
            ),
            "sequential_unprocessed_classification": dict(
                sorted(sequential_histogram.items())
            ),
        },
        "all_algebraic_banks": all_template_summary,
        "matching_permutation_histogram": dict(
            sorted(permutations.items(), key=lambda item: (-item[1], item[0]))
        ),
        "nonmatches": unmatched,
        "unprocessed_sat": unprocessed_sat,
        "sequential_unprocessed_sat": sequential_classification,
        "claim_scope": (
            "Offline replay against the exact shell cut only; this is not a "
            "terminal exhaustive-search certificate."
        ),
    }
    cegar._atomic_json(args.output, output)
    print(json.dumps(output["counts"], sort_keys=True))


if __name__ == "__main__":
    main()
