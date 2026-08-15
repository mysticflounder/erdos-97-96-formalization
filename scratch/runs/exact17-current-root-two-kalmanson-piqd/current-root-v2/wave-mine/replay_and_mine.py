"""Authenticate and mine only the exact17 current-root-v2 SAT survivor.

This wave is artifact-only: it reads the sealed root, model, receipt, and
terminal, replays every DIMACS clause, and invokes the existing local source
occurrence/motif scanners.  It never starts PIQD, a solver, or Lean.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[5]
HERE = Path(__file__).resolve().parent
RUN = ROOT / "scratch/runs/exact17-current-root-two-kalmanson-piqd/current-root-v2"
PACKAGE_CNF = ROOT / (
    "scratch/exact17-current-root-two-kalmanson-package-v2/"
    "exact17-current-root-two-kalmanson.cnf"
)
LAUNCH = RUN / "launch.json"
TERMINAL = RUN / "terminal.json"
ATTEMPT = RUN / "piqd-attempts/attempt-00000000-7787c58442a276f0"
RECEIPT = ATTEMPT / "solver-receipt.json"
CUSTODY = ATTEMPT / "custody-seal.json"
JOURNAL_SEAL = ATTEMPT / "attempt.jsonl.seal.json"
ARTIFACT_DIR = ATTEMPT / "attempt.jsonl.artifacts"
JOB = "33126a9f-df16-4380-8fdb-07d2fe151f0a"
CNF_SHA = "7787c58442a276f0247efec8d1a3bec3df34aeb47b5896c54c9cbd9d08978698"
MODEL_SHA = "2b89686b54bd9b93041ad54b68a2b823b3271954f8040b69a17d1d535daaee43"
RECEIPT_SHA = "c1fbf8944d5bf1a165565c19b29307048958bfe23ac07f202d7d60f487256504"
RECEIPT_FILE_SHA = "064e472f613a8416026974dc7bd479e655a1c7cf1b6bbd8123d4ca90191ba2e4"
JOURNAL_SEAL_SHA = "1f65321673bd8d5077c1f0b04650bf4af648aabdf6c8b12ad08ac9b1c6e34209"
MODEL = ARTIFACT_DIR / MODEL_SHA
VARS = 308
CLAUSES = 7_037_176
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
REVERSED_ORDER = tuple(reversed(ORDER))
PRIOR_ANALYSIS = ROOT / (
    "scratch/runs/exact17-two-triple-row-piqd/current-root-v2/"
    "wave-mine/analysis.json"
)


def _load(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


# The immediately prior wave is reference-only.  Its implementation is reused
# for the established matchers, while every current-root identity is bound in
# this file independently.
reference = _load(
    ROOT / "scratch/runs/exact17-two-triple-row-piqd/current-root-v2/wave-mine/replay_and_mine.py",
    "exact17_prior_wave_miner",
)
reference.JOB = JOB
reference.CNF_SHA = CNF_SHA
reference.MODEL_SHA = MODEL_SHA
reference.CLAUSES = CLAUSES
reference.ORDER = ORDER
reference.REVERSED_ORDER = REVERSED_ORDER

validator = _load(
    ROOT / "scripts/validate_exact17_current_root_two_kalmanson_export.py",
    "exact17_current_root_export_validator",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def strict_json(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"),
        object_pairs_hook=reference._reject_duplicate_keys,
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def assignment_from_model(model: dict[str, Any]) -> tuple[list[int], dict[int, bool]]:
    if model.get("job_id") != JOB or model.get("result") != "SAT" or model.get("backend") != "cadical":
        raise ValueError("sealed model identity/result drifted")
    literals = model.get("assignment")
    if type(literals) is not list or len(literals) != VARS:
        raise ValueError("assignment is not a total 308-literal vector")
    values: dict[int, bool] = {}
    for literal in literals:
        if type(literal) is not int or literal == 0 or abs(literal) > VARS or abs(literal) in values:
            raise ValueError("malformed or duplicate assignment literal")
        values[abs(literal)] = literal > 0
    if set(values) != set(range(1, VARS + 1)):
        raise ValueError("assignment does not cover variables 1..308")
    return literals, values


def replay_dimacs(values: dict[int, bool], path: Path = PACKAGE_CNF) -> dict[str, Any]:
    digest = hashlib.sha256()
    header: tuple[int, int] | None = None
    pending: list[int] = []
    checked = 0
    with path.open("rb") as stream:
        for raw in stream:
            digest.update(raw)
            fields = raw.decode("ascii").strip().split()
            if not fields or fields[0] == "c":
                continue
            if fields[0] == "p":
                header = (int(fields[2]), int(fields[3]))
                continue
            for token in fields:
                literal = int(token)
                if literal:
                    pending.append(literal)
                else:
                    checked += 1
                    if not any(values[abs(x)] == (x > 0) for x in pending):
                        raise ValueError(f"assignment falsifies clause {checked}")
                    pending.clear()
    actual = digest.hexdigest()
    if header != (VARS, CLAUSES) or checked != CLAUSES or actual != CNF_SHA:
        raise ValueError(f"DIMACS identity drifted: header={header} checked={checked} sha={actual}")
    return {"variables": VARS, "clauses_checked": checked, "sha256": actual, "satisfies_all": True}


def authenticate() -> tuple[dict[str, Any], list[int], dict[int, bool], dict[str, Any]]:
    launch = strict_json(LAUNCH)
    terminal = strict_json(TERMINAL)
    receipt = strict_json(RECEIPT)
    custody = strict_json(CUSTODY)
    seal = strict_json(JOURNAL_SEAL)
    model = strict_json(MODEL)
    if sha256(MODEL) != MODEL_SHA or sha256(RECEIPT) != RECEIPT_FILE_SHA:
        raise ValueError("sealed artifact hash drifted")
    if sha256(PACKAGE_CNF) != CNF_SHA:
        raise ValueError("current root CNF hash drifted")
    if terminal.get("status") != "PASS" or terminal.get("verdict") != "SAT" or terminal.get("job_id") != JOB:
        raise ValueError("terminal status is not authenticated SAT")
    if launch.get("status") != "LAUNCH_AUTHENTICATED" or launch.get("root", {}).get("sha256") != CNF_SHA:
        raise ValueError("launch root identity drifted")
    if receipt.get("job_id") != JOB or receipt.get("outcome") != "STRUCTURAL_SAT" or receipt.get("model_response_sha256") != MODEL_SHA or receipt.get("cnf_sha256") != CNF_SHA:
        raise ValueError("solver receipt identity drifted")
    if custody.get("receipt_sha256") != RECEIPT_SHA or custody.get("receipt_file_sha256") != RECEIPT_FILE_SHA:
        raise ValueError("custody seal does not bind receipt")
    if seal.get("schema") != "p97-cegar-wave-journal-seal/v1" or seal.get("seal_sha256") != JOURNAL_SEAL_SHA or seal.get("record_count") != 436:
        raise ValueError("journal seal identity drifted")
    literals, values = assignment_from_model(model)
    return model, literals, values, {
        "launch": {"status": launch["status"], "root": launch["root"]},
        "terminal": {key: terminal.get(key) for key in ("status", "verdict", "certification", "job_id", "model_response_sha256", "terminal_status_canonical_sha256")},
        "receipt": {key: receipt.get(key) for key in ("job_id", "outcome", "cnf_sha256", "model_response_sha256")},
        "custody": {"receipt_sha256": custody["receipt_sha256"], "receipt_file_sha256": custody["receipt_file_sha256"]},
        "journal_seal": {"seal_sha256": seal["seal_sha256"], "record_count": seal["record_count"], "journal_sha256": seal["journal_sha256"]},
    }


def rows_from_assignment(values: dict[int, bool]) -> tuple[Any, ...]:
    rows = tuple(reference.MetricRow(c, tuple(p for p in range(17) if values[1 + 17 * c + p]), True) for c in range(17))
    if {len(row.support) for row in rows} != {4} or any(row.center in row.support for row in rows):
        raise ValueError("decoded assignment is not exact-four off-center rows")
    next_centers = [c for c in range(17) if values[290 + c]]
    selectors = [i for i in range(2) if values[307 + i]]
    if next_centers != [14] or selectors != [1]:
        raise ValueError(f"selector drift: next_centers={next_centers} selectors={selectors}")
    return rows


def prior_bank() -> tuple[set[frozenset[tuple[int, int]]], dict[str, Any]]:
    return reference.prior_bank()


def producer_mine(rows: tuple[Any, ...], bank: set[frozenset[tuple[int, int]]]) -> dict[str, Any]:
    return reference.producer_mine(rows, bank)


def formalized_diagnostics(rows: tuple[Any, ...]) -> list[dict[str, Any]]:
    return reference.formalized_diagnostics(rows)


def motif_scan(rows: tuple[Any, ...]) -> dict[str, Any]:
    return reference.motif_scan(rows)


def package_coverage(values: dict[int, bool]) -> dict[str, Any]:
    supports = [tuple(tuple(hit) for hit in support) for support in validator._SUPPORTS]
    positive_hits = [support for support in supports if all(values[1 + 17 * c + p] for c, p in support)]
    validation = validator.validate_export()
    return {
        "validator": {"status": validation["status"], "suffix": validation["suffix"], "child": validation["child"]},
        "serialized_support_count": len(supports),
        "positive_support_hits_in_current_model": len(positive_hits),
        "all_serialized_parent_clauses_replayed": validation["status"] == "PASS",
        "omitted_banked_clause_count": 0,
    }


def comparison_to_prior(rows: tuple[Any, ...]) -> dict[str, Any]:
    prior = strict_json(PRIOR_ANALYSIS)
    prior_rows = {int(c): tuple(support) for c, support in prior["decoded_model"]["rows"].items()}
    current_rows = {row.center: tuple(row.support) for row in rows}
    changed = [c for c in range(17) if current_rows[c] != prior_rows[c]]
    return {
        "prior_analysis": str(PRIOR_ANALYSIS.relative_to(ROOT)),
        "prior_analysis_sha256": sha256(PRIOR_ANALYSIS),
        "prior_job_id": prior["provenance"]["job_id"],
        "current_vs_prior_changed_centers": changed,
        "prior_new_occurrence_count": prior["conclusion"]["new_source_valid_occurrences"],
    }


def main() -> None:
    model, literals, values, authentication = authenticate()
    replay = replay_dimacs(values)
    rows = rows_from_assignment(values)
    bank, bank_meta = prior_bank()
    producers = producer_mine(rows, bank)
    diagnostics = formalized_diagnostics(rows)
    motifs = motif_scan(rows)
    output = {
        "schema": "p97-exact17-current-root-two-kalmanson-wave-analysis/v1",
        "status": "PASS",
        "scope": "Only authenticated current-root-v2 SAT survivor; no solver, PIQD, or Lean launch.",
        "provenance": {
            "job_id": JOB,
            "cnf_path": str(PACKAGE_CNF.relative_to(ROOT)),
            "cnf_sha256": CNF_SHA,
            "model_path": str(MODEL.relative_to(ROOT)),
            "model_sha256": MODEL_SHA,
            "terminal_path": str(TERMINAL.relative_to(ROOT)),
            "terminal_sha256": sha256(TERMINAL),
            "receipt_sha256": RECEIPT_SHA,
            "receipt_file_sha256": RECEIPT_FILE_SHA,
            "journal_seal_sha256": JOURNAL_SEAL_SHA,
            "canonical_assignment_sha256": hashlib.sha256(" ".join(map(str, literals)).encode()).hexdigest(),
        },
        "authentication": authentication,
        "independent_replay": replay,
        "decoded_model": {
            "rows": {str(row.center): list(row.support) for row in rows},
            "next_centers": [c for c in range(17) if values[290 + c]],
            "named_order_indices": [i for i in range(2) if values[307 + i]],
            "selected_order": list(ORDER),
            "assignment_literals": literals,
        },
        "comparison_to_prior": comparison_to_prior(rows),
        "parent_export_coverage": package_coverage(values),
        "prior_source_bank": bank_meta,
        "two_kalmanson_occurrences": [producers],
        "formalized_core_diagnostics": diagnostics,
        "scanner_inventory": {
            "generic_two_kalmanson": {"matcher": "census.atail_force.producer_bank.enumerate_two_kalmanson_cancellations", "source_valid_new_minimal": producers["new_occurrence_count"]},
            "formalized_two_row_and_related_cores": {"matcher": "established_child41_miner.scan_all_formalized_cores", "diagnostic_count": len(diagnostics), "source_valid_new": 0},
            "three_row_cycle": {"matcher": "interlacing-cross-wave/analyze.py equality/rhombus/point-sum scanner", "source_valid_new": 0},
            "two_triple_row": {"matcher": "direct_six_occurrence_hits", "source_valid_new": motifs["direct_two_triple_row_hits"]},
            "interlacing": {"matcher": "paper_interlacing_hits", "conditional_hits": motifs["conditional_paper_interlacing_hits"], "source_valid_new": 0},
            "affine_or_other_exact_linear": {"matcher": None, "source_valid_new": 0, "status": "no registered source-valid matcher in the existing wave scanners"},
        },
        "cross_wave_motif_scan": motifs,
        "conclusion": {
            "new_source_valid_occurrences": producers["new_occurrence_count"],
            "new_source_valid_occurrence_clauses_if_banked": 4 * producers["new_occurrence_count"],
            "new_general_source_valid_schema": False,
            "theorem_bank_yield": "existing generic two-Kalmanson cancellation family only",
            "exact17_closure": "not closed; current-root-v2 authenticated SAT model survives",
            "first_lean_consumer": "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check",
            "next_missing_producer": "A source-valid producer outside the existing generic two-Kalmanson cancellation family.",
            "lean_corpus_search": "not run: no concrete new general candidate survived source/bank scans",
        },
    }
    OUT = HERE / "analysis.json"
    OUT.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"path": str(OUT), "status": "PASS", "clauses_checked": replay["clauses_checked"], "new_occurrences": producers["new_occurrence_count"], "new_size_counts": producers["subset_minimal_size_counts"], "diagnostic_count": len(diagnostics), "direct_two_triple_row_hits": motifs["direct_two_triple_row_hits"], "parent_serialized_supports": output["parent_export_coverage"]["serialized_support_count"]}, sort_keys=True))


if __name__ == "__main__":
    main()
