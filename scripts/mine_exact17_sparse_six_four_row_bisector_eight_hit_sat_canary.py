# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.
# ruff: noqa: F821
"""Authenticate and theorem-mine the finalized exact-17 eight-hit canary.

The custody layer is an identity-adapted copy of the corrected predecessor
miner.  The new analysis layer deliberately does not use a historical ledger
to decide novelty: it replays the sealed model against the complete source CNF
and scans that CNF for exact or strictly stronger clauses.
"""

from __future__ import annotations

import hashlib
import io
import json
import os
from collections import Counter
from collections.abc import Callable
from pathlib import Path
from typing import Any

_HERE = Path(__file__).resolve()
_PREDECESSOR = _HERE.with_name(
    "mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py"
)
_source = _PREDECESSOR.read_text()
_replacements = {
    "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio": "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio",
    "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-canary-mine-20260820": "exact17-eight-hit-v5-canary-mine-20260821",
    "exact17-two-kalmanson-sat-canary-mine": "exact17-eight-hit-v5-canary-mine",
    "test_mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary": "test_mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary",
    "mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary": "mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary",
    "1c79b49594e0b1f10bf4bfeb7efb2104feeedd23": "8b902b9281e5e4658c339261f6c6fb0407c763d1",
    "ad725439ee997699eee2a2cac2a79dc07625ea50fbbd952f6126732e8d260fa8": "100b8b98279b3e1f3ee32139a5d12c85f283c568d2d36ebe67ee247aedeb6776",
    "2026-08-21T06:51:00Z": "2026-08-21T16:22:44Z",
    "four-row-bisector-two-kalmanson-next-center-02-physical-none-sat-profile-v1": "four-row-bisector-eight-hit-two-kalmanson-next-center-02-physical-none-sat-profile-v1",
    "96551f95-c0b1-4598-8ecc-08a6f9c0b2ba": "07e9d5ed-5856-4b17-8990-cd53fd360634",
    "c75746b3d32d7c61727b84fc9cecd1aef51b1e84b3a4bdfedf2668d038b4b6cc": "c28a8b077eb4750be1f54606cc2345098a8af0aafd414ea404ae06f842c920d5",
    "efda63bf70ede84d762008e5345e4cf56a46dc7abcce004022d1e2af41764387": "49213232c5fafd9482eb3fe0f808896e95e529c32b96685f2e45f70d443bbb2a",
    "2232b7ec2a0d55e61a31c211b36c155f167a42f9ac9c3ce7a4fb8caea23cc603": "e9db1cc43d9cd2fdb97ac41bb11aac9e9da168440989a4aa19a8855abe52a7a9",
    "fc1e55566924a4ab3b0129c03f89b86219b71e167b068c7672311d9da3d56c91": "1d4480ffc7e61c1d513823433b87b878165c2fc7c0844ce7021cb9abf6d8ab7a",
    "2add24bf43404618aa74509689f0839a96b9a1fb379792811048031dd417ec11": "2533432a7f5aed1551219794f0859060e5c5de3fccf8d27b385594975a51c690",
    "11656d1c3f7a7ec1d5f52150a5fe36bc66e368d35782a7aec18a1a2f54f98b5b": "feb3a166609daf2f8284c142cea82146a619e279eb72420f571f8f3cf5b21898",
    "42baf1fb0eb97241254bf686dbd092d704aea4c7434dbe19b731b4c308e1f2df": "547c9b915f94fee2b251f299237e2080dc5371e3df8efd5c751524cb59559e22",
    "415f70566f1747b962763bf6331e8ea49cb201dad303d5686369ac996981c64b": "32af4f58df3e30339e023f1664a8a77a8bddf06cf7e87bc6ec310a8ac53a89a0",
    "7cb19c3caa1efbc9d9c2acf47e00f45f56cb35cc7844c1f99a2740da62133022": "574599f5ee2c9928071cb8dfa1c598bfa4753c0ec08e297fc3a744c28bd79b30",
    "c5f35b70a15abdbc8039a9411c205853dc249318362937ebd22fd65a940491d9": "3f338d084fd071fc2acb7ca3a3cd095ae4f9539c372c3884628c024773224cdb",
    "3e3e4192a1a142cd8ba4f3b4e65f581471dbbbb7ccfdb8bdac5871b252c1856f": "348492f5d202f86af9641a8fd423b4e2bfbb05633c35575f9817525f80a80d7e",
    "13128c321b0f974d23fdd992efdd128aeecb1b6213b7c02bfa2ed19f6c6ad34d": "57c1387dcd53ff2f204f5b559844964e8c0e6624c3afcdb3c31290728c5cc265",
    "6e25c30e86f56cfce3d67c18f8db1b007b147c5be4e474a216fc1dd504dc8df7": "fa72463f474bd3f9b965c97addc4b84b6d7d7f57029e6c8e0ce75145b13e86d1",
    "346_273_747": "346_273_811",
    "record_count: int = 16": "record_count: int = 15",
    "len(lines) == 16": "len(lines) == 15",
    "expected_record_count=16": "expected_record_count=15",
    'terminal.get("attempt_index") == 15': 'terminal.get("attempt_index") == 14',
    "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-": "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-sat-profile-",
}
for _old, _new in _replacements.items():
    if _old not in _source:
        raise RuntimeError(f"predecessor adaptation marker missing: {_old}")
    _source = _source.replace(_old, _new)
_source = _source.split('\nif __name__ == "__main__":', 1)[0]
exec(  # noqa: S102 -- repository-pinned corrected predecessor, identity adapted above
    compile(_source, str(_PREDECESSOR), "exec"), globals()
)


SOURCE_CNF = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
    "preparer-20260821/physical-slice-cell-campaign-v5/artifacts/cells/"
    "four-row-bisector-eight-hit-two-kalmanson-next-center-02-physical-none/"
    "four-row-bisector-eight-hit-two-kalmanson-next-center-02-physical-none.cnf"
)


JUST_ADDED_SUPPORT = frozenset(
    {(0, 1), (0, 3), (3, 9), (3, 16), (8, 3), (8, 16), (16, 1), (16, 9)}
)
JUST_ADDED_ORBIT_CLAUSES = frozenset(
    tuple(sorted(clause)) for clause in occurrence_orbit_clauses(JUST_ADDED_SUPPORT)
)
JUST_ADDED_CLAUSE_SETS = frozenset(
    frozenset(clause) for clause in JUST_ADDED_ORBIT_CLAUSES
)


def decode_model(model: dict[str, Any]) -> tuple[dict[int, bool], dict[str, Any]]:
    """Decode the exact assignment, selecting order only through vars 307/308."""

    literals = model.get("assignment")
    _require(
        type(literals) is list
        and len(literals) == VARIABLES
        and all(type(item) is int and item != 0 for item in literals),
        "SAT assignment is not one signed literal per variable",
    )
    _require(
        {abs(item) for item in literals} == set(range(1, VARIABLES + 1)),
        "SAT assignment does not cover each variable exactly once",
    )
    values = {abs(item): item > 0 for item in literals}
    rows = {
        str(center): [point for point in range(17) if values[1 + 17 * center + point]]
        for center in range(17)
    }
    _require(
        all(
            len(support) == 4 and center not in support
            for center, support in ((int(key), value) for key, value in rows.items())
        ),
        "decoded rows are not exact-four off-center rows",
    )
    next_centers = [center for center in range(17) if values[290 + center]]
    selected_order, selected_table = selected_order_table(values)
    _require(next_centers == [2], "decoded next-center selector drifted")
    return values, {
        "rows": rows,
        "next_centers": next_centers,
        "named_orders": [selected_order],
        "selected_order_index": selected_order,
        "selected_order": list(selected_table),
        "assignment_sha256": sha256_bytes(" ".join(map(str, literals)).encode()),
    }


def _edge_roots(
    rows: list[producer_bank.MetricRow],
) -> list[list[int]]:
    closure = producer_bank.metric._row_equality_closure(17, rows)
    roots, _classes = producer_bank.metric._closure_circle_index(closure, 17)
    return roots


def _core_predicate(record: dict[str, Any]) -> Callable[[list[Any]], bool]:
    """Return the precise equality predicate behind one bank record."""

    stage = record["stage"]
    core = record["core"]

    def predicate(rows: list[Any]) -> bool:
        roots = _edge_roots(rows)

        def edge(left: int, right: int) -> int:
            return roots[left][right]

        def eq(center: int, left: int, right: int) -> bool:
            return edge(center, left) == edge(center, right)

        if "six-point-two-circle-arc-overtake" in stage:
            o, a, d, e, f, c = (core[key] for key in "OADEFC")
            base = edge(o, a)
            d_radius = edge(d, a)
            return (
                edge(o, c) == base
                and edge(a, c) == base
                and edge(o, d) == base
                and edge(o, e) == base
                and edge(d, e) == d_radius
                and edge(d, f) == d_radius
            )
        if "four-point-two-circle-bisector" in stage:
            return eq(core["Q"], core["U"], core["Y"]) and eq(
                core["V"], core["U"], core["Y"]
            )
        if stage == "equality-equilateral-bisector-collision":
            p, a, b, c, x = (core[key] for key in ("p", "a", "b", "c", "x"))
            radius = edge(p, a)
            return (
                edge(p, b) == radius
                and edge(a, b) == radius
                and edge(a, x) == radius
                and edge(b, x) == radius
                and edge(p, c) == radius
                and edge(c, x) == edge(c, a)
            )
        if "equality-convex-five-point" in stage:
            a, x, b, c, y = (core[key] for key in ("a", "x", "b", "c", "y"))
            return eq(x, a, b) and eq(y, a, b) and eq(c, b, x) and eq(c, b, y)
        if stage == "equality-exact-off-circle":
            center = core["center"]
            support = tuple(core["support"])
            exact = next(
                (
                    row
                    for row in rows
                    if row.center == center
                    and row.exact
                    and tuple(row.support) == support
                ),
                None,
            )
            return exact is not None and edge(center, core["off_support"]) == edge(
                center, support[0]
            )
        raise MineError(f"no source predicate registered for formalized stage {stage}")

    return predicate


def _rows_from_hits(
    hits: frozenset[tuple[int, int]],
    *,
    exact_row: tuple[int, tuple[int, ...]] | None = None,
) -> list[producer_bank.MetricRow]:
    grouped: dict[int, list[int]] = {}
    for center, point in sorted(hits):
        grouped.setdefault(center, []).append(point)
    rows: list[producer_bank.MetricRow] = []
    for center, support in sorted(grouped.items()):
        is_exact = exact_row is not None and center == exact_row[0]
        if len(support) >= 2 or is_exact:
            rows.append(producer_bank.MetricRow(center, tuple(support), is_exact))
    return rows


def minimize_formalized_occurrence(
    record: dict[str, Any], rows: tuple[producer_bank.MetricRow, ...]
) -> frozenset[tuple[int, int]]:
    """Greedily minimize selected-row atoms while retaining the exact core."""

    predicate = _core_predicate(record)
    exact_row = None
    protected: frozenset[tuple[int, int]] = frozenset()
    if record["stage"] == "equality-exact-off-circle":
        core = record["core"]
        exact_row = (core["center"], tuple(core["support"]))
        protected = frozenset((exact_row[0], point) for point in exact_row[1])
    kept = frozenset((row.center, point) for row in rows for point in row.support)
    _require(
        predicate(_rows_from_hits(kept, exact_row=exact_row)), "core did not replay"
    )
    changed = True
    while changed:
        changed = False
        for hit in sorted(kept - protected):
            trial = kept - {hit}
            if predicate(_rows_from_hits(trial, exact_row=exact_row)):
                kept = trial
                changed = True
                break
    _require(
        predicate(_rows_from_hits(kept, exact_row=exact_row)),
        "minimized core did not replay",
    )
    return kept


def _formalized_orbit_clauses(
    hits: frozenset[tuple[int, int]],
    record: dict[str, Any],
    active_order: tuple[int, ...],
) -> frozenset[frozenset[int]]:
    orientation = record["orientation"]
    if orientation == "invariant":
        return frozenset(
            {frozenset(-(1 + 17 * center + point) for center, point in hits)}
        )
    reference = (
        active_order if orientation == "forward" else tuple(reversed(active_order))
    )
    positions = {label: position for position, label in enumerate(reference)}
    positional_hits = frozenset(
        (positions[center], positions[point]) for center, point in hits
    )
    return occurrence_orbit_clauses(positional_hits)


def _source_entitled_formalized_record(record: dict[str, Any]) -> bool:
    """Whether ``SourceRealization`` supplies every antecedent of ``record``.

    Its row table is the pullback of one selected four-subset at each center;
    it does not say that the subset is the complete metric circle class.
    Therefore an ``ExactOffCircleCore`` found after marking Boolean rows exact
    is diagnostic only and must never be emitted as a source-valid nogood.
    """

    return record["stage"] != "equality-exact-off-circle"


def build_candidates(
    values: dict[int, bool], order_index: int, order: tuple[int, ...]
) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    """Enumerate paired two-Kalmanson and all canonical formalized hits."""

    require_order_matches_selector(values, order_index, order)
    rows = tuple(
        producer_bank.MetricRow(
            center,
            tuple(point for point in range(17) if values[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    two_summary, two_ledger = mine_rows(values, set(), order_index, order)
    candidates: list[dict[str, Any]] = []
    for entry in two_ledger["entries"]:
        hits = _support(entry)
        candidates.append(
            {
                "family": "two-kalmanson-cancellation",
                "stage": "equality-convex-two-kalmanson-cancellation",
                "lean_consumer": entry["immediate_lean_consumer"],
                "source_valid": True,
                "validation": entry["source_validation"],
                "support": entry["support"],
                "support_size": len(hits),
                "clauses": [
                    sorted(clause)
                    for clause in sorted(occurrence_orbit_clauses(hits), key=sorted)
                ],
            }
        )
    formalized = producer_bank.scan_all_formalized_cores(rows, 17, order)
    formalized_counts = Counter(record["stage"] for record in formalized)
    source_unentitled_counts: Counter[str] = Counter()
    for record in formalized:
        if record["stage"] == "equality-convex-two-kalmanson-cancellation":
            continue
        if not _source_entitled_formalized_record(record):
            source_unentitled_counts[record["stage"]] += 1
            continue
        hits = minimize_formalized_occurrence(record, rows)
        clauses = _formalized_orbit_clauses(hits, record, order)
        candidates.append(
            {
                "family": "formalized-core-bank",
                "stage": record["stage"],
                "orientation": record["orientation"],
                "lean_consumer": record["lean_consumer"],
                "source_valid": True,
                "validation": {
                    "canonical_bank_record": record,
                    "minimized_core_replay": True,
                    "actual_selector": order_index,
                },
                "support": [list(hit) for hit in sorted(hits)],
                "support_size": len(hits),
                "clauses": [sorted(clause) for clause in sorted(clauses, key=sorted)],
            }
        )
    return {
        "two_kalmanson": two_summary,
        "formalized_diagnostic_count": len(formalized),
        "formalized_stage_counts": dict(sorted(formalized_counts.items())),
        "source_unentitled_formalized_stage_counts": dict(
            sorted(source_unentitled_counts.items())
        ),
        "source_valid_candidate_count": len(candidates),
    }, candidates


def replay_and_classify_cnf(
    cnf: bytes,
    values: dict[int, bool],
    candidates: list[dict[str, Any]],
) -> dict[str, Any]:
    """Replay every clause and classify candidate clauses in the same pass."""

    targets: dict[frozenset[int], list[tuple[int, int]]] = {}
    for candidate_index, candidate in enumerate(candidates):
        for clause_index, raw_clause in enumerate(candidate["clauses"]):
            clause = frozenset(raw_clause)
            targets.setdefault(clause, []).append((candidate_index, clause_index))
    target_list = tuple(targets)
    exact_targets = frozenset(targets) | JUST_ADDED_CLAUSE_SETS
    literal_targets: dict[int, set[int]] = {}
    for target_index, target in enumerate(target_list):
        for literal in target:
            literal_targets.setdefault(literal, set()).add(target_index)
    maximum_target_size = max(map(len, target_list))
    exact_counts: Counter[frozenset[int]] = Counter()
    strict_subsumers: dict[frozenset[int], frozenset[int]] = {}
    digest = hashlib.sha256(cnf).hexdigest()
    _require(digest == CNF_SHA256, "source CNF digest drifted before replay")
    header: tuple[int, int] | None = None
    pending: list[int] = []
    checked = 0
    for line_number, raw in enumerate(io.BytesIO(cnf), 1):
        fields = raw.decode("ascii").strip().split()
        if not fields or fields[0] == "c":
            continue
        if fields[0] == "p":
            _require(
                header is None and fields[:2] == ["p", "cnf"] and len(fields) == 4,
                f"invalid DIMACS header at line {line_number}",
            )
            header = (int(fields[2]), int(fields[3]))
            continue
        _require(header is not None, "DIMACS clause precedes header")
        for token in fields:
            literal = int(token)
            if literal:
                _require(abs(literal) <= VARIABLES, "DIMACS literal out of range")
                pending.append(literal)
                continue
            _require(
                pending and any(values[abs(item)] == (item > 0) for item in pending),
                f"assignment falsifies source CNF clause {checked + 1}",
            )
            checked += 1
            clause = frozenset(pending)
            if clause in exact_targets:
                exact_counts[clause] += 1
            possible: set[int] | None = None
            if len(clause) < maximum_target_size:
                for literal in clause:
                    containing = literal_targets.get(literal)
                    if containing is None:
                        possible = set()
                        break
                    possible = (
                        set(containing)
                        if possible is None
                        else possible.intersection(containing)
                    )
                    if not possible:
                        break
            for target_index in possible or ():
                target = target_list[target_index]
                if len(clause) < len(target):
                    previous = strict_subsumers.get(target)
                    if previous is None or (len(clause), sorted(clause)) < (
                        len(previous),
                        sorted(previous),
                    ):
                        strict_subsumers[target] = clause
            pending.clear()
    _require(
        not pending and header == (VARIABLES, CNF_CLAUSES) and checked == CNF_CLAUSES,
        "source CNF dimensions/replay count drifted",
    )
    active_new = 0
    active_exact = 0
    active_subsumed = 0
    for candidate in candidates:
        clause_results = []
        for raw_clause in candidate["clauses"]:
            clause = frozenset(raw_clause)
            true_literals = sorted(
                literal for literal in clause if values[abs(literal)] == (literal > 0)
            )
            relation = "new-clause"
            if exact_counts[clause]:
                relation = "exact-current-cnf-clause"
            elif clause in strict_subsumers:
                relation = "strictly-subsumed-by-current-cnf-clause"
            clause_results.append(
                {
                    "clause": sorted(clause),
                    "relation": relation,
                    "exact_multiplicity": exact_counts[clause],
                    "strict_subsumer": (
                        sorted(strict_subsumers[clause])
                        if clause in strict_subsumers
                        else None
                    ),
                    "falsified_by_model": not true_literals,
                    "true_literals": true_literals,
                }
            )
        falsified = [item for item in clause_results if item["falsified_by_model"]]
        _require(len(falsified) == 1, "candidate must have one active falsified clause")
        candidate["clause_classification"] = clause_results
        candidate["active_clause"] = falsified[0]
        candidate["bank_relation"] = falsified[0]["relation"]
        active_new += falsified[0]["relation"] == "new-clause"
        active_exact += falsified[0]["relation"] == "exact-current-cnf-clause"
        active_subsumed += (
            falsified[0]["relation"] == "strictly-subsumed-by-current-cnf-clause"
        )
    just_added = [exact_counts[clause] for clause in JUST_ADDED_CLAUSE_SETS]
    _require(just_added == [1, 1, 1, 1], "eight-hit orbit is not present exactly once")
    return {
        "variables": VARIABLES,
        "clauses_checked": checked,
        "sha256": digest,
        "satisfies_all": True,
        "candidate_clause_count": len(targets),
        "active_new_count": active_new,
        "active_exact_count": active_exact,
        "active_strictly_subsumed_count": active_subsumed,
        "just_added_eight_hit_orbit_multiplicities": just_added,
    }


def mine(
    *,
    root: Path = ROOT,
    portfolio_root: Path = PORTFOLIO_ROOT,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    """Authenticate, replay, inventory, minimize, and write a canonical mine."""

    root = Path(os.path.abspath(root))
    portfolio_root = Path(os.path.abspath(portfolio_root))
    output_root = Path(os.path.abspath(output_root))
    _require(
        portfolio_root == Path(os.path.abspath(PORTFOLIO_ROOT)),
        "portfolio root override is not permitted",
    )
    _require(
        not output_root.exists() and not output_root.is_symlink(),
        "mine output root already exists",
    )
    with prep.DescriptorCustody(root) as custody:
        checkpoint_sha256 = _validate_checkpoint(custody)
        portfolio_source = _validate_portfolio_source(custody)
        manifests = _validate_manifests(custody)
        model, journal_meta, artifact_meta = _validate_journal(
            custody, manifests["wave"]
        )
        values, decoded = decode_model(model)
        cnf = manifests["cnf"].content or b""
    order_index, order = selected_order_table(values)
    inventory, candidates = build_candidates(values, order_index, order)
    replay = replay_and_classify_cnf(cnf, values, candidates)
    new_candidates = sorted(
        (
            candidate
            for candidate in candidates
            if candidate["bank_relation"] == "new-clause"
        ),
        key=lambda candidate: (
            len(candidate["active_clause"]["clause"]),
            candidate["support_size"],
            candidate["stage"],
            candidate["support"],
        ),
    )
    _require(
        new_candidates, "authenticated model contains no new source-valid candidate"
    )
    smallest = new_candidates[0]
    ledger = {
        "schema": "p97-exact17-eight-hit-source-valid-candidate-ledger/v1",
        "status": "PASS",
        "classification_basis": "complete authenticated source CNF",
        "entries": candidates,
    }
    ledger_payload = canonical_json_bytes(ledger)
    analysis = {
        "schema": "p97-exact17-eight-hit-sat-canary-mine-analysis/v1",
        "status": "PASS",
        "scope": "sealed canary only; no PIQD or solver launch",
        "provenance": {
            "job_id": JOB_ID,
            "portfolio_run_manifest_sha256": portfolio_source["run_manifest_sha256"],
            "portfolio_campaign_sha256": manifests["campaign"],
            "canary_launch_sha256": manifests["launch"],
            "canary_result_sha256": manifests["result"],
            "journal_sha256": journal_meta["journal"],
            "journal_seal_file_sha256": journal_meta["seal_file"],
            "journal_seal_sha256": journal_meta["seal"]["seal_sha256"],
            "terminal_record_sha256": TERMINAL_RECORD_SHA256,
            "wave_manifest_sha256": WAVE_SHA256,
            "producer_manifest_sha256": PRODUCER_SHA256,
            "cnf_sha256": CNF_SHA256,
            "model_sha256": MODEL_SHA256,
            "solver_log_sha256": SOLVER_LOG_SHA256,
            "variable_map_sha256": VARIABLE_MAP_SHA256,
        },
        "authentication": {
            "journal_record_count": 15,
            "terminal_outcome": "STRUCTURAL_SAT",
            "model_artifact_bytes": artifact_meta["model_bytes"],
            "solver_log_bytes": artifact_meta["solver_log_bytes"],
        },
        "decoded_model": decoded,
        "independent_replay": replay,
        "inventory": inventory,
        "candidate_counts": dict(
            sorted(Counter(c["bank_relation"] for c in candidates).items())
        ),
        "smallest_source_valid_new_candidate": {
            "family": smallest["family"],
            "stage": smallest["stage"],
            "support": smallest["support"],
            "support_size": smallest["support_size"],
            "active_clause": smallest["active_clause"],
            "lean_consumer": smallest["lean_consumer"],
        },
        "just_added_eight_hit_regression": {
            "support": [list(hit) for hit in sorted(JUST_ADDED_SUPPORT)],
            "orbit_clauses": [
                sorted(clause)
                for clause in sorted(JUST_ADDED_ORBIT_CLAUSES, key=sorted)
            ],
            "multiplicities": replay["just_added_eight_hit_orbit_multiplicities"],
        },
        "candidate_ledger_sha256": sha256_bytes(ledger_payload),
        "conclusion": {
            "new_source_valid_occurrence_count": replay["active_new_count"],
            "general_theorem_search_performed": True,
            "exact17_closure": False,
        },
    }
    created_utc = (
        datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
    )
    source_digests = {
        **portfolio_source["source_digests"],
        _relative(root, CHECKPOINT): checkpoint_sha256,
        _relative(root, PORTFOLIO_RUN_MANIFEST): portfolio_source[
            "run_manifest_sha256"
        ],
        _relative(root, PORTFOLIO_CAMPAIGN): manifests["campaign"],
        _relative(root, CANARY_LAUNCH): manifests["launch"],
        _relative(root, CANARY_RESULT): manifests["result"],
        _relative(root, CANARY_JOURNAL): journal_meta["journal"],
        _relative(root, CANARY_SEAL): journal_meta["seal_file"],
        _relative(root, SOURCE_CNF): CNF_SHA256,
        _relative(root, VARIABLE_MAP): VARIABLE_MAP_SHA256,
        _relative(root, MODEL_ARTIFACT): MODEL_SHA256,
        _relative(root, LOG_ARTIFACT): SOLVER_LOG_SHA256,
        _relative(root, _PREDECESSOR): sha256_bytes(_PREDECESSOR.read_bytes()),
        _relative(root, _HERE): sha256_bytes(_HERE.read_bytes()),
        "scripts/test_mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary.py": sha256_bytes(
            (
                ROOT
                / "scripts/test_mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary.py"
            ).read_bytes()
        ),
    }
    run_manifest = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE_ID,
        "owner": "exact17-eight-hit-v5-canary-mine",
        "run_id": RUN_ID,
        "root": _relative(root, output_root),
        "base_head": BASE_HEAD,
        "created_utc": created_utc,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": source_digests,
        "input_digests": {
            _relative(root, output_root / "artifacts/analysis.json"): sha256_bytes(
                canonical_json_bytes(analysis)
            ),
            _relative(
                root, output_root / "artifacts/candidate-occurrence-ledger.json"
            ): sha256_bytes(ledger_payload),
        },
    }
    run_manifest["manifest_sha256"] = sha256_bytes(canonical_json_bytes(run_manifest))
    validate_run_manifest(run_manifest)
    output_root.mkdir(parents=True)
    (output_root / "artifacts").mkdir()
    (output_root / "events").mkdir()
    (output_root / "tmp").mkdir()
    _write_once(
        output_root / "artifacts/candidate-occurrence-ledger.json", ledger_payload
    )
    _write_once(output_root / "artifacts/analysis.json", canonical_json_bytes(analysis))
    _write_once(output_root / "run_manifest.json", canonical_json_bytes(run_manifest))
    return {
        "status": "PASS",
        "analysis": _relative(root, output_root / "artifacts/analysis.json"),
        "candidate_ledger": _relative(
            root, output_root / "artifacts/candidate-occurrence-ledger.json"
        ),
        "run_manifest": _relative(root, output_root / "run_manifest.json"),
        "clauses_checked": replay["clauses_checked"],
        "new_occurrences": replay["active_new_count"],
        "smallest_new_stage": smallest["stage"],
        "run_manifest_sha256": run_manifest["manifest_sha256"],
    }


def main() -> int:
    try:
        print(json.dumps(mine(), sort_keys=True))
    except (OSError, MineError, prep.PreparationError) as exc:
        print(f"eight-hit SAT canary mine rejected: {exc}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
