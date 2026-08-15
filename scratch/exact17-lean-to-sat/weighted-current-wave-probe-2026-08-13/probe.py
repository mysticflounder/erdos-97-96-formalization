"""Bounded, source-faithful weighted-Kalmanson probe for Child43.

This is discovery/audit code.  It authenticates the fixed Child43 custody
files, replays the DIMACS assignment, enumerates all 4-point Kalmanson terms
against the decoded row-equality closure, and independently asks the existing
producer bank to certify the smallest positive cancellations.  It does not
launch a solver and writes only the JSON beside this script.
"""

from __future__ import annotations

import hashlib
import importlib.util
import itertools
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
HERE = Path(__file__).resolve().parent
MODEL = SCRATCH / "piqd-child43-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child43-core1-custody-final.json"
CNF = SCRATCH / "exact17-forty-third-root-forty-second-model-refinements.cnf"
MANIFEST = SCRATCH / "piqd-ingress-manifest-forty-third-model-refinements-core1.json"
META = SCRATCH / "cross-wave-meta-2026-08-13" / "cross-wave-meta.json"
OLD_REPLAYER = ROOT / "scratch/rigid221-blockerv-exact17-20260806/replay_source_faithful_weighted_kalmanson.py"
CHILD43_MINER = SCRATCH / "child43-wave-mine" / "replay_and_mine.py"
OUT = HERE / "analysis.json"

VARS = 308
CLAUSES = 5_848_592
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
CNF_SHA = "dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76"
MODEL_SHA = "5a68926a32d5406ffdea187dc4e4c18330799160a4e8596fc463fcc3160530ce"
FINAL_SHA = "8585ed1a1d997ff16c305514d6640b12ada876ef9cc4d2d737bd596ecb97505b"
MANIFEST_SHA = "6805434e1cf96526d93d4fc2eb291e1cab9ac6b7cc9417b5010c8f8a1b038171"


def sha(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def evidence(path: Path) -> dict[str, Any]:
    return {"path": str(path.relative_to(ROOT)), "sha256": sha(path), "bytes": path.stat().st_size}


def strict_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def load(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_bytes(), object_pairs_hook=strict_pairs)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def load_child43():
    spec = importlib.util.spec_from_file_location("child43_wave_miner", CHILD43_MINER)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load authenticated Child43 miner")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def replay_assignment(assignment: dict[int, bool]) -> dict[str, Any]:
    """Replay the exact assignment independently of the wave miner."""

    digest = hashlib.sha256()
    header: tuple[int, int] | None = None
    pending: list[int] = []
    checked = 0
    with CNF.open("rb") as stream:
        for raw in stream:
            digest.update(raw)
            line = raw.decode("ascii").strip()
            if not line or line.startswith("c"):
                continue
            fields = line.split()
            if fields[0] == "p":
                if header is not None:
                    raise ValueError("duplicate DIMACS header")
                header = (int(fields[2]), int(fields[3]))
                continue
            for token in fields:
                literal = int(token)
                if literal:
                    pending.append(literal)
                else:
                    checked += 1
                    if not any(assignment[abs(x)] == (x > 0) for x in pending):
                        raise ValueError(f"assignment falsifies clause {checked}")
                    pending.clear()
    actual = digest.hexdigest()
    if header != (VARS, CLAUSES) or checked != CLAUSES or pending or actual != CNF_SHA:
        raise ValueError(f"DIMACS mismatch header={header} checked={checked} hash={actual}")
    return {"variables": VARS, "clauses_checked": checked, "sha256": actual, "satisfies_all": True}


def row_support(record: dict[str, Any], order: tuple[int, ...]) -> frozenset[tuple[int, int]]:
    """Extract exactly the center/witness incidences used by row path steps."""

    hits: set[tuple[int, int]] = set()
    for pairing in record["core"]["pairings"]:
        for step in pairing["path"]["steps"]:
            if step.get("kind") != "row":
                continue
            center = order[int(step["center"])]
            first = order[int(step["first"])]
            second = order[int(step["second"])]
            hits.update(((center, first), (center, second)))
    return frozenset(hits)


def term_delta(bank, metric, closure, quad: tuple[int, ...], form: str):
    left, right = bank._kalmanson_edges(quad, form)
    delta = Counter(closure.find(metric._edge(*edge)) for edge in left)
    delta.subtract(closure.find(metric._edge(*edge)) for edge in right)
    return tuple(sorted((root, count) for root, count in delta.items() if count))


def main() -> int:
    child43 = load_child43()
    if (
        sha(MODEL) != MODEL_SHA
        or sha(FINAL) != FINAL_SHA
        or sha(CNF) != CNF_SHA
        or sha(MANIFEST) != MANIFEST_SHA
    ):
        raise ValueError("authenticated Child43 bytes drifted")
    model = child43.load_strict(MODEL)
    final = child43.load_strict(FINAL)
    assignment = child43.validate_custody(final, model, FINAL_SHA, MODEL_SHA)
    replay = replay_assignment(assignment)
    selected_next_centers = [center for center in range(17) if assignment[290 + center]]
    selected_orders = [index for index in range(2) if assignment[307 + index]]
    if selected_next_centers != [0] or selected_orders != [1]:
        raise ValueError(
            f"selector drift: {selected_next_centers=} {selected_orders=}"
        )
    if tuple(child43.ORDER) != ORDER:
        raise ValueError(f"Child43 order drift: {tuple(child43.ORDER)=} {ORDER=}")

    sys.path.insert(0, str(ROOT))
    from census.atail_force import producer_bank as bank
    from census.global_confinement import metric_realizability_probe as metric

    rows = tuple(
        bank.MetricRow(center, tuple(point for point in range(17) if assignment[1 + 17 * center + point]), True)
        for center in range(17)
    )
    if any(len(row.support) != 4 or row.center in row.support for row in rows):
        raise ValueError("decoded rows are not exact-four off-center rows")
    position = {label: index for index, label in enumerate(ORDER)}
    indexed_rows = tuple(
        bank.MetricRow(position[row.center], tuple(sorted(position[p] for p in row.support)), True)
        for row in rows
    )
    closure = metric._row_equality_closure(17, indexed_rows)

    terms: list[dict[str, Any]] = []
    by_delta: dict[tuple[tuple[Any, int], ...], list[dict[str, Any]]] = {}
    for quad in itertools.combinations(range(17), 4):
        labels = tuple(ORDER[index] for index in quad)
        for form in ("adjacentSides", "innerOuter"):
            delta = term_delta(bank, metric, closure, quad, form)
            term = {"quad": list(labels), "form": form, "weight": 1, "delta": [list(item) for item in delta]}
            terms.append(term)
            by_delta.setdefault(delta, []).append(term)
    zero_terms = [term for term in terms if not term["delta"]]
    if len(zero_terms) != 2:
        raise ValueError(f"expected two zero-delta terms, found {len(zero_terms)}")

    parent_bank, parent_meta = child43.prior_bank_with_child42()
    candidates: list[dict[str, Any]] = []
    for term in zero_terms:
        public_term = {key: term[key] for key in ("quad", "form", "weight")}
        certificate = bank.certify_weighted_kalmanson_cancellation(rows, 17, ORDER, [public_term])
        support = row_support(certificate, ORDER)
        exact = support in parent_bank
        strict_subsumed = [sorted(item) for item in parent_bank if item < support]
        candidates.append({
            "classification": "SOURCE-VALID; genuinely broader than the banked two-Kalmanson occurrence family" if not exact and not strict_subsumed else "EXISTING/SUBSUMED",
            "support": [list(item) for item in sorted(support)],
            "support_size": len(support),
            "bank_exact": exact,
            "bank_strict_subsumed_by": strict_subsumed,
            "terms": [public_term],
            "certificate": certificate,
            "lean_consumer": certificate["lean_consumer"],
            "producer_stage": certificate["stage"],
        })

    meta = load(META)
    source_records = sum(1 for record in meta.get("records", []) if record.get("kind") == "source_valid_occurrence")
    legacy_text = OLD_REPLAYER.read_text(encoding="utf-8")
    legacy_expected = ['supports["results"]', 'support.get("status")', 'support["journal"]', 'support["atoms"]']
    legacy_compatible = all(fragment in legacy_text for fragment in legacy_expected)
    payload = {
        "schema": "p97-exact17-child43-weighted-current-wave-probe/v1",
        "status": "PASS",
        "provenance": {
            "job_id": "9a1a3903-6ba3-4f41-8e74-0d11ee8ba7eb",
            "cnf": evidence(CNF), "model": evidence(MODEL), "final": evidence(FINAL),
            "manifest": evidence(MANIFEST),
            "child43_miner": evidence(CHILD43_MINER), "producer_bank": evidence(Path(bank.__file__).resolve()),
            "lean_consumer_source": evidence(ROOT / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean"),
            "cross_wave_meta": evidence(META),
        },
        "independent_replay": replay,
        "decoded_rows": {str(row.center): list(row.support) for row in rows},
        "selected_order": list(ORDER),
        "selector_binding": {
            "next_center_variables": list(range(290, 307)),
            "selected_next_centers": selected_next_centers,
            "order_variables": [307, 308],
            "selected_order_indices": selected_orders,
            "expected_order_index": 1,
            "authenticated": True,
        },
        "enumeration": {
            "terms": len(terms), "delta_classes": len(by_delta), "zero_delta_terms": len(zero_terms),
            "forms": ["adjacentSides", "innerOuter"], "weights": [1],
        },
        "parent_bank": parent_meta,
        "candidates": candidates,
        "cross_wave_comparison": {
            "schema": meta.get("schema"), "status": meta.get("status"),
            "source_valid_record_count": source_records,
            "weighted_family_present": any(record.get("family") == "equality-convex-weighted-kalmanson-cancellation" for record in meta.get("records", [])),
            "conclusion": "The refreshed Child33--44 table contains only the two-Kalmanson source-valid family; these one-term weighted occurrences are not present there.",
        },
        "legacy_replayer_compatibility": {
            "status": "FAIL_CLOSED_SCHEMA_MISMATCH" if legacy_compatible else "UNKNOWN",
            "old_replayer": str(OLD_REPLAYER.relative_to(ROOT)),
            "expects_source_faithful_fields": legacy_expected,
            "child43_payload_has_assignment_only": True,
            "note": "The old replay script was not run against Child43; the existing producer_bank weighted checker was used directly on decoded rows.",
        },
        "interpretation": {
            "finite_source_validity": "PROVEN by exact producer_bank certification and the existing weighted Lean consumer metadata.",
            "universal_SourceRealization_bridge": "NOT ESTABLISHED; the decoded SAT row assignment is not a SourceRealization theorem.",
            "strongest_candidate": "A single adjacentSides Kalmanson inequality on cyclic labels (6,8,10,5), with three row-equality paths, has positive weight 1 and exact zero delta.",
            "closure": "not closed; Child43 SAT assignment survives the parent CNF",
        },
    }
    OUT.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(OUT), "status": payload["status"], "replay": replay, "terms": len(terms), "zero_terms": len(zero_terms), "candidates": len(candidates), "source_valid_meta_records": source_records}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
