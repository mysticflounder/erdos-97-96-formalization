"""Authenticate and mine only the current-root-v2 SAT survivor.

This is an artifact-only wave mine.  It replays the sealed DIMACS assignment,
then invokes the established exact17 producer-bank and motif scanners.  It
never starts a solver, PIQD job, or Lean build.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[5]
HERE = Path(__file__).resolve().parent
RUN = ROOT / "scratch/runs/exact17-two-triple-row-piqd/current-root-v2"
PACKAGE_CNF = (
    ROOT / "scratch/exact17-two-triple-row-package-v2/exact17-two-triple-row.cnf"
)
LAUNCH = RUN / "launch.json"
TERMINAL = RUN / "terminal.json"
ATTEMPT = RUN / "piqd-attempts/attempt-00000000-e9cc97f4e0c6d954"
RECEIPT = ATTEMPT / "solver-receipt.json"
CUSTODY = ATTEMPT / "custody-seal.json"
JOURNAL_SEAL = ATTEMPT / "attempt.jsonl.seal.json"
ARTIFACT_DIR = ATTEMPT / "attempt.jsonl.artifacts"
MODEL = (
    ARTIFACT_DIR / "3c003726c09ae688fa3828177842533b38045e588fad75579177ae9e9d28173c"
)
OUT = HERE / "analysis.json"

JOB = "7090efd2-a289-476d-a61b-323c4aaf34a5"
CNF_SHA = "e9cc97f4e0c6d954902717ecb98e25a772bd54c1199a3bff0190ae2941e5ed51"
MODEL_SHA = "3c003726c09ae688fa3828177842533b38045e588fad75579177ae9e9d28173c"
RECEIPT_SHA = "292c403e01059aa31deaeecf47234a46f79c09a70603c28e84132f2bc49b1756"
RECEIPT_FILE_SHA = "69a08e4f12b48d13be132bfef14d51c7d6486d2d2e87f913ffde12246eff1714"
JOURNAL_SEAL_SHA = "fc88a8b5dfbdf895913a50e334d9447a7f8a4ac76247109a845be665ea0d3fd0"
VARS = 308
CLAUSES = 7_036_960
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
REVERSED_ORDER = tuple(reversed(ORDER))

CHILD38 = (
    ROOT
    / "scratch/exact17-lean-to-sat/child38-wave-mine/child38-cancellation-bank-ledger.json"
)
PRIOR_ANALYSES = [
    ROOT / f"scratch/exact17-lean-to-sat/child{n}-wave-mine/child{n}-analysis.json"
    for n in (39, 40, 41, 42, 43)
]
CHILD45_LEDGER = (
    ROOT / "scratch/exact17-child45-wave-mine/child45-wave-occurrence-ledger.json"
)

spec = importlib.util.spec_from_file_location(
    "established_child41_miner",
    ROOT / "scratch/exact17-lean-to-sat/child41-wave-mine/replay_and_mine.py",
)
if spec is None or spec.loader is None:
    raise RuntimeError("cannot load established exact17 miner")
miner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(miner)
sys.path.insert(0, str(ROOT))
from census.atail_force.producer_bank import MetricRow
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    project_record_for_lean,
)

spec2 = importlib.util.spec_from_file_location(
    "established_interlacing",
    ROOT / "scratch/exact17-lean-to-sat/interlacing-cross-wave-2026-08-15/analyze.py",
)
if spec2 is None or spec2.loader is None:
    raise RuntimeError("cannot load established motif scanner")
motifs = importlib.util.module_from_spec(spec2)
spec2.loader.exec_module(motifs)


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=_reject_duplicate_keys
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def assignment_from_model(model: dict[str, Any]) -> tuple[list[int], dict[int, bool]]:
    if (
        model.get("job_id") != JOB
        or model.get("result") != "SAT"
        or model.get("backend") != "cadical"
    ):
        raise ValueError("sealed model identity/result drifted")
    literals = model.get("assignment")
    if type(literals) is not list or len(literals) != VARS:
        raise ValueError("assignment is not a total 308-literal vector")
    values: dict[int, bool] = {}
    for literal in literals:
        if (
            type(literal) is not int
            or literal == 0
            or abs(literal) > VARS
            or abs(literal) in values
        ):
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
        raise ValueError(
            f"DIMACS identity drifted: header={header} checked={checked} sha={actual}"
        )
    return {
        "variables": VARS,
        "clauses_checked": checked,
        "sha256": actual,
        "satisfies_all": True,
    }


def authenticate() -> tuple[dict[str, Any], list[int], dict[int, bool], dict[str, Any]]:
    launch = strict_json(LAUNCH)
    terminal = strict_json(TERMINAL)
    receipt = strict_json(RECEIPT)
    custody = strict_json(CUSTODY)
    seal = strict_json(JOURNAL_SEAL)
    model_bytes = MODEL.read_bytes()
    model = json.loads(model_bytes, object_pairs_hook=_reject_duplicate_keys)
    if sha256(MODEL) != MODEL_SHA or sha256(RECEIPT) != RECEIPT_FILE_SHA:
        raise ValueError("sealed artifact hash drifted")
    if sha256(PACKAGE_CNF) != CNF_SHA:
        raise ValueError("current root CNF hash drifted")
    if (
        terminal.get("status") != "PASS"
        or terminal.get("verdict") != "SAT"
        or terminal.get("job_id") != JOB
    ):
        raise ValueError("terminal status is not authenticated SAT")
    if (
        launch.get("status") != "LAUNCH_AUTHENTICATED"
        or launch.get("root", {}).get("sha256") != CNF_SHA
    ):
        raise ValueError("launch root identity drifted")
    if (
        receipt.get("job_id") != JOB
        or receipt.get("outcome") != "STRUCTURAL_SAT"
        or receipt.get("model_response_sha256") != MODEL_SHA
        or receipt.get("cnf_sha256") != CNF_SHA
    ):
        raise ValueError("solver receipt identity drifted")
    if (
        custody.get("receipt_sha256") != RECEIPT_SHA
        or custody.get("receipt_file_sha256") != RECEIPT_FILE_SHA
    ):
        raise ValueError("custody seal does not bind receipt")
    if (
        seal.get("schema") != "p97-cegar-wave-journal-seal/v1"
        or seal.get("seal_sha256") != JOURNAL_SEAL_SHA
        or seal.get("record_count") != 372
    ):
        raise ValueError("journal seal identity drifted")
    literals, values = assignment_from_model(model)
    return (
        model,
        literals,
        values,
        {
            "launch": launch,
            "terminal": terminal,
            "receipt": receipt,
            "custody": custody,
            "journal_seal": seal,
        },
    )


def rows_from_assignment(values: dict[int, bool]) -> tuple[MetricRow, ...]:
    rows = tuple(
        MetricRow(
            center,
            tuple(point for point in range(17) if values[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    if {len(row.support) for row in rows} != {4} or any(
        row.center in row.support for row in rows
    ):
        raise ValueError("decoded assignment is not exact-four off-center rows")
    next_centers = [center for center in range(17) if values[290 + center]]
    selectors = [index for index in range(2) if values[307 + index]]
    if next_centers != [6] or selectors != [1]:
        raise ValueError(
            f"selector drift: next_centers={next_centers} selectors={selectors}"
        )
    return rows


def support(candidate: dict[str, Any]) -> frozenset[tuple[int, int]]:
    return frozenset((int(a), int(b)) for a, b in candidate["support"])


def prior_bank() -> tuple[set[frozenset[tuple[int, int]]], dict[str, Any]]:
    bank: set[frozenset[tuple[int, int]]] = set()
    source_hashes: dict[str, str] = {}
    ledger = strict_json(CHILD38)
    for entry in ledger["entries"]:
        for key in ("hits", "reflected_hits"):
            bank.add(frozenset(tuple(hit) for hit in entry[key]))
    for path in PRIOR_ANALYSES:
        source_hashes[str(path.relative_to(ROOT))] = sha256(path)
        analysis = strict_json(path)
        if analysis.get("status") != "PASS":
            raise ValueError(f"prior mine is not PASS: {path}")
        for occurrence in analysis.get("two_kalmanson_occurrences", []):
            for candidate in occurrence.get("candidates", []):
                hits = support(candidate)
                bank.add(hits)
                bank.add(miner.reflected(hits))
    source_hashes[str(CHILD38.relative_to(ROOT))] = sha256(CHILD38)
    child45 = strict_json(CHILD45_LEDGER)
    if child45.get("status") != "AUTHENTICATED_PROMOTABLE":
        raise ValueError("Child45 ledger is not authenticated-promotable")
    source_hashes[str(CHILD45_LEDGER.relative_to(ROOT))] = sha256(CHILD45_LEDGER)
    for record in child45.get("full_certificate_records", []):
        hits = frozenset(tuple(hit) for hit in record["occurrence"]["hits"])
        bank.add(hits)
        bank.add(miner.reflected(hits))
    return bank, {
        "sources": sorted(source_hashes),
        "source_sha256": source_hashes,
        "support_count_with_orientations": len(bank),
        "child45_included": True,
        "child46": "not available as explicit support records; current survivor mined independently",
    }


def producer_mine(
    rows: tuple[MetricRow, ...], bank: set[frozenset[tuple[int, int]]]
) -> dict[str, Any]:
    forward = miner.enumerate_two_kalmanson_cancellations(
        rows, 17, ORDER, max_cores=100_000
    )
    reverse = miner.enumerate_two_kalmanson_cancellations(
        rows, 17, REVERSED_ORDER, max_cores=100_000
    )
    by_forward = {miner.path_hits(record): record for record in forward}
    by_reverse = {miner.path_hits(record): record for record in reverse}
    minimal = sorted(
        (hits for hits in by_forward if not any(other < hits for other in by_forward)),
        key=lambda h: (len(h), sorted(h)),
    )
    candidates: list[dict[str, Any]] = []
    for hits in minimal:
        reverse_hits = miner.reflected(hits)
        if reverse_hits not in by_reverse:
            raise ValueError("reflected source producer missing")
        f = project_record_for_lean(by_forward[hits], hits, ORDER, rows)
        r = project_record_for_lean(
            by_reverse[reverse_hits], reverse_hits, REVERSED_ORDER, rows
        )
        checked = lean_occurrence_check(
            hits, f, r, rows=rows, forward_order=ORDER, reverse_order=REVERSED_ORDER
        )
        if not checked:
            raise ValueError("source occurrence replay failed")
        relation = (
            "exact-parent-bank-support"
            if hits in bank
            else "strictly-subsumed-by-parent-bank"
            if any(parent < hits for parent in bank)
            else "new-occurrence-existing-family"
        )
        candidates.append(
            {
                "support": [list(hit) for hit in sorted(hits)],
                "support_size": len(hits),
                "bank_relation": relation,
                "source_valid": True,
                "exact_literal_witness": [list(hit) for hit in sorted(hits)],
                "forward_producer": f,
                "reverse_producer": r,
                "source_validation": {
                    "paired_forward_reverse_replay": True,
                    "lean_occurrence_check": True,
                },
                "mathematical_statement": "A checked finite two-Kalmanson cancellation occurrence yields false_of_twoKalmansonCancellationData_of_check.",
                "immediate_lean_consumer": "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check",
                "first_missing_antecedent_or_circularity": "none for this finite source-valid occurrence; no new cardinality-independent lift is claimed",
                "theorem_bank": {
                    "general_theorem_exists": True,
                    "indexed_query": "generic two Kalmanson cancellation occurrence selected row exact support sourceAssign cancellationOccurrenceClause",
                    "indexed_source_revision": "0ce7786a",
                    "representative_modules": [
                        "BlockerVExactSeventeenSixteenthModelRefinements",
                        "BlockerVExactSeventeenSeventeenthModelRefinements",
                        "BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation",
                    ],
                },
                "classification": "SOURCE-VALID; finite new occurrence of existing generic two-Kalmanson family"
                if relation == "new-occurrence-existing-family"
                else "SOURCE-VALID; already covered by prior bank",
            }
        )
    return {
        "forward_producer_record_count": len(forward),
        "reverse_producer_record_count": len(reverse),
        "forward_distinct_support_count": len(by_forward),
        "reverse_distinct_support_count": len(by_reverse),
        "subset_minimal_count": len(candidates),
        "subset_minimal_size_counts": dict(
            Counter(item["support_size"] for item in candidates)
        ),
        "bank_exact_count": sum(
            item["bank_relation"] == "exact-parent-bank-support" for item in candidates
        ),
        "bank_strict_subsumed_count": sum(
            item["bank_relation"] == "strictly-subsumed-by-parent-bank"
            for item in candidates
        ),
        "new_occurrence_count": sum(
            item["bank_relation"] == "new-occurrence-existing-family"
            for item in candidates
        ),
        "candidates": candidates,
    }


def formalized_diagnostics(rows: tuple[MetricRow, ...]) -> list[dict[str, Any]]:
    records = miner.scan_all_formalized_cores(rows, 17, ORDER)
    missing = {
        "equality-convex-four-point-two-circle-bisector-order": "SourceRealization transport for the two EdgeClosure equalities, distinctness, and positive signed-area antecedents.",
        "equality-convex-four-point-two-circle-bisector-order-reverse": "Reverse SourceRealization transport for the two EdgeClosure equalities, distinctness, and negative signed-area antecedents.",
        "equality-convex-five-point": "Source construction of a ≠ b, x ≠ y, four EdgeClosure equalities, and positive orientation signs.",
        "equality-convex-five-point-reverse": "Reverse source construction of the distinctness, four closures, and negative orientation signs.",
        "equality-exact-off-circle": "Source-realized ExactOffCircleCore plus ExactAt for the selected row.",
        "equality-perpendicular-bisector-convex": "Source ingress for the perpendicular-bisector/convexity hypotheses; finite row equalities alone are insufficient.",
    }
    result = []
    for record in records:
        if record.get("stage") == "equality-convex-two-kalmanson-cancellation":
            continue
        stage = record.get("stage", "unknown")
        result.append(
            {
                "stage": stage,
                "orientation": record.get("orientation"),
                "core": record.get("core"),
                "immediate_lean_consumer": record.get("lean_consumer"),
                "classification": "DIAGNOSTIC_ONLY; source-valid theorem candidate not admitted",
                "first_missing_antecedent_or_circularity": missing.get(
                    stage,
                    "SourceRealization antecedents are not supplied by this finite model scan.",
                ),
                "theorem_bank": {
                    "general_theorem_exists": True,
                    "reuse_status": "consumer exists, but missing source bridge prevents use",
                },
            }
        )
    return result


def motif_scan(rows: tuple[MetricRow, ...]) -> dict[str, Any]:
    raw_rows = [tuple(row.support) for row in rows]
    closure = motifs.equality_closure(raw_rows)
    rhombi = motifs.rhombus_identities(closure)
    sums = motifs.point_sum_identities(rhombi, order=ORDER)
    direct = motifs.direct_six_occurrence_hits(raw_rows, ORDER)
    return {
        "equality_closure_class_count": closure["class_count"],
        "rhombus_identity_count": len(rhombi),
        "disjoint_3_plus_3_point_sum_candidates": sums["candidate_count"],
        "universal_hull_rejection_targets": len(sums["universal_targets"]),
        "sign_classification_counts": sums["sign_classification_counts"],
        "direct_two_triple_row_hits": len(direct),
        "direct_two_triple_row_theorem": "false_of_six_ccw_two_triple_row_equalities",
        "direct_two_triple_row_witnesses": direct,
        "conditional_paper_interlacing_hits": len(
            motifs.paper_interlacing_hits(raw_rows, ORDER)
        ),
        "soundness": "Only direct raw-row theorem hits are source-valid; rhombus/chart interlacing remains conditional without chart ingress.",
    }


def main() -> None:
    _model, literals, values, custody = authenticate()
    replay = replay_dimacs(values)
    rows = rows_from_assignment(values)
    bank, bank_meta = prior_bank()
    producers = producer_mine(rows, bank)
    diagnostics = formalized_diagnostics(rows)
    output = {
        "schema": "p97-exact17-two-triple-row-current-root-v2-wave-analysis/v1",
        "status": "PASS",
        "scope": "Only authenticated current-root-v2 SAT survivor job 7090efd2; no solver, PIQD, or Lean launch.",
        "provenance": {
            "job_id": JOB,
            "cnf_path": str(PACKAGE_CNF.relative_to(ROOT)),
            "cnf_sha256": CNF_SHA,
            "model_path": str(MODEL.relative_to(ROOT)),
            "model_sha256": MODEL_SHA,
            "canonical_assignment_sha256": hashlib.sha256(
                " ".join(map(str, literals)).encode()
            ).hexdigest(),
            "terminal_path": str(TERMINAL.relative_to(ROOT)),
            "receipt_sha256": RECEIPT_SHA,
            "custody_receipt_file_sha256": RECEIPT_FILE_SHA,
            "journal_seal_sha256": JOURNAL_SEAL_SHA,
        },
        "authentication": {
            "terminal": custody["terminal"],
            "launch": custody["launch"],
            "receipt": {
                "job_id": custody["receipt"]["job_id"],
                "outcome": custody["receipt"]["outcome"],
                "cnf_sha256": custody["receipt"]["cnf_sha256"],
                "model_response_sha256": custody["receipt"]["model_response_sha256"],
            },
        },
        "independent_replay": replay,
        "decoded_model": {
            "rows": {str(row.center): list(row.support) for row in rows},
            "next_centers": [center for center in range(17) if values[290 + center]],
            "named_order_indices": [index for index in range(2) if values[307 + index]],
            "selected_order": list(ORDER),
            "assignment_literals": literals,
        },
        "prior_source_bank": bank_meta,
        "two_kalmanson_occurrences": [producers],
        "formalized_core_diagnostics": diagnostics,
        "cross_wave_motif_scan": motif_scan(rows),
        "conclusion": {
            "new_source_valid_occurrences": producers["new_occurrence_count"],
            "new_source_valid_occurrence_clauses_if_banked": 4
            * producers["new_occurrence_count"],
            "theorem_bank_yield": "existing generic two-Kalmanson cancellation family only",
            "new_general_source_valid_schema": False,
            "exact17_closure": "not closed; current-root-v2 authenticated SAT model survives",
            "next_missing_producer": "A source-valid producer outside the existing generic cancellation family; current survivor has no direct two-triple-row theorem witness and only conditional chart/rhombus motif hits.",
        },
    }
    OUT.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "path": str(OUT),
                "status": output["status"],
                "replay": replay,
                "producer_summary": {
                    key: producers[key]
                    for key in (
                        "forward_producer_record_count",
                        "forward_distinct_support_count",
                        "subset_minimal_count",
                        "subset_minimal_size_counts",
                        "bank_exact_count",
                        "bank_strict_subsumed_count",
                        "new_occurrence_count",
                    )
                },
                "diagnostic_count": len(diagnostics),
                "motif_scan": {
                    key: output["cross_wave_motif_scan"][key]
                    for key in (
                        "direct_two_triple_row_hits",
                        "rhombus_identity_count",
                        "disjoint_3_plus_3_point_sum_candidates",
                        "conditional_paper_interlacing_hits",
                    )
                },
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
