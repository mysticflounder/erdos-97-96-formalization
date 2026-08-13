"""Strict generator for the authenticated exact-17 Child38 cancellation bank."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

from generate_exact17_thirtieth_all_cancellation_refinements import (
    ORDERS,
    N,
    choose_exact_support_record,
    lean_occurrence,
    path_hits,
    reflected,
    sha256_file,
)
from generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    project_record_for_lean,
)

from census.atail_force import producer_bank

ROOT = Path(__file__).resolve().parents[1]
MODEL = ROOT / "scratch/exact17-lean-to-sat/piqd-child38-core1-custody-model.json"
CNF = ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-eighth-root-thirty-seventh-model-refinements.cnf"
ANALYSIS = ROOT / "scratch/exact17-lean-to-sat/child38-wave-mine/child38-analysis.json"
OUT = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEDGER = ROOT / "scratch/exact17-lean-to-sat/child38-wave-mine/child38-cancellation-bank-ledger.json"
MODEL_SHA256 = "6011d637ce337aacd0fe315b6e697333fb9a2b392083fd623a41b324c8f45ab6"
CNF_SHA256 = "07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7"
ANALYSIS_SHA256 = "0f3a5855187f11208489809fa3ea015d225bc8813ec5d55d102a9026cda86316"
PARENT_CLAUSES = 5_847_276
FORWARD_RECORDS = 597
REVERSE_RECORDS = 597
DISTINCT_SUPPORTS = 317
SUBSET_MINIMAL_SUPPORTS = 101
OCCURRENCES = 28
SHARDS = 4


def load_model() -> dict[str, Any]:
    if sha256_file(MODEL) != MODEL_SHA256 or sha256_file(CNF) != CNF_SHA256:
        raise ValueError("authenticated Child38 source pin drifted")
    if sha256_file(ANALYSIS) != ANALYSIS_SHA256:
        raise ValueError("authenticated Child38 analysis pin drifted")
    payload = json.loads(MODEL.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact17-child38-piqd-model/v3":
        raise ValueError("unexpected Child38 model schema")
    if payload.get("cnf_sha256") != CNF_SHA256 or payload.get("replay") != {
        "clauses_checked": PARENT_CLAUSES,
        "satisfies_all": True,
    }:
        raise ValueError("Child38 model replay binding drifted")
    assignment = payload.get("model", {}).get("assignment")
    if not isinstance(assignment, list) or len(assignment) != 308:
        raise ValueError("Child38 assignment is not total")
    if {abs(value) for value in assignment} != set(range(1, 309)):
        raise ValueError("Child38 assignment is not a signed permutation")
    return payload


def decode_rows(payload: dict[str, Any]) -> list[producer_bank.MetricRow]:
    assignment = payload["model"]["assignment"]
    rows: list[producer_bank.MetricRow] = []
    for center in range(N):
        points = tuple(point for point in range(N) if assignment[17 * center + point] > 0)
        if len(points) != 4 or center in points:
            raise ValueError("decoded Child38 rows are not four-point metric rows")
        rows.append(producer_bank.MetricRow(center, points, exact=False))
    return rows


def derive_entries() -> tuple[list[str], list[dict[str, Any]]]:
    payload = load_model()
    rows = decode_rows(payload)
    order = ORDERS[1]
    records = producer_bank.enumerate_two_kalmanson_cancellations(rows, N, order, max_cores=100_000)
    if len(records) != FORWARD_RECORDS:
        raise ValueError(f"expected {FORWARD_RECORDS} forward records, got {len(records)}")
    supports = sorted({path_hits(record) for record in records}, key=lambda hits: (len(hits), sorted(hits)))
    if len(supports) != DISTINCT_SUPPORTS:
        raise ValueError(f"expected {DISTINCT_SUPPORTS} distinct supports, got {len(supports)}")
    minimal = [hits for hits in supports if not any(other < hits for other in supports)]
    if len(minimal) != SUBSET_MINIMAL_SUPPORTS:
        raise ValueError(
            f"expected {SUBSET_MINIMAL_SUPPORTS} subset-minimal supports, got {len(minimal)}"
        )
    minimal_six = [hits for hits in minimal if len(hits) == 6]
    if len(minimal_six) != OCCURRENCES:
        raise ValueError(f"expected {OCCURRENCES} subset-minimal six-hit supports, got {len(minimal_six)}")
    entries: list[str] = []
    ledger_entries: list[dict[str, Any]] = []
    reverse_order = tuple(reversed(order))
    reverse_records = producer_bank.enumerate_two_kalmanson_cancellations(rows, N, reverse_order, max_cores=100_000)
    if len(reverse_records) != REVERSE_RECORDS:
        raise ValueError(f"expected {REVERSE_RECORDS} reverse records, got {len(reverse_records)}")
    for hits in minimal_six:
        reverse_hits = reflected(hits)
        forward = choose_exact_support_record(hits, order, records=records, rows=rows)
        reverse = choose_exact_support_record(reverse_hits, reverse_order, records=reverse_records, rows=rows)
        forward_lean = project_record_for_lean(forward, hits, order, rows)
        reverse_lean = project_record_for_lean(reverse, reverse_hits, reverse_order, rows)
        if not lean_occurrence_check(hits, forward_lean, reverse_lean, rows=rows, forward_order=order, reverse_order=reverse_order):
            raise ValueError(f"Lean projection failed for {sorted(hits)}")
        entries.append(lean_occurrence(hits, forward_lean, reverse_lean))
        ledger_entries.append({
            "hits": [list(hit) for hit in sorted(hits)],
            "reflected_hits": [list(hit) for hit in sorted(reverse_hits)],
            "forward_record_sha256": hashlib.sha256(json.dumps(forward, sort_keys=True, separators=(",", ":")).encode()).hexdigest(),
            "reverse_record_sha256": hashlib.sha256(json.dumps(reverse, sort_keys=True, separators=(",", ":")).encode()).hexdigest(),
        })
    return entries, ledger_entries


def shard(shard_no: int, entries: list[str]) -> str:
    return f'''/-\n+Copyright (c) 2026 Adam McKenna. All rights reserved.\n+Released under Apache 2.0 license as described in the file LICENSE.\n+Authors: Adam McKenna\n+-/\n+\n+import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySeventhModelRefinements\n+\n+/-! # Child38 subset-minimal six-hit cancellation bank, shard {shard_no}\n+\n+This shard contains seven authenticated subset-minimal six-hit occurrences.\n+-/\n+\n+open scoped EuclideanGeometry\n+namespace Problem97\n+namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard{shard_no}\n+open ATailBlockerVExactSeventeenSourceNormalForm\n+open ATailBlockerVExactSeventeenSourceCnf\n+open ATailBlockerVExactSeventeenTwentyEighthModelRefinements\n+private abbrev occurrenceClauses :=\n+  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses\n+\ndef cancellationOccurrences : List CancellationOccurrence :=\n[\n{chr(10).join(entries)}\n]\n\ntheorem cancellationOccurrences_length : cancellationOccurrences.length = 7 := by native_decide\ntheorem cancellationOccurrences_all_check :\n    cancellationOccurrences.all CancellationOccurrence.check = true := by native_decide\n\ndef refinementClauses : Std.Sat.CNF Atom :=\n  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits\n\ntheorem refinementClauses_length : refinementClauses.length = 28 := by native_decide\n\ntheorem sourceAssign_refinementClauses {{A : Finset ℝ²}}\n    (source : SourceRealization A) :\n    ∀ clause ∈ refinementClauses,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by\n  intro clause hclause\n  simp only [refinementClauses, List.mem_flatMap] at hclause\n  rcases hclause with ⟨occ, hocc, hclause⟩\n  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc\n  simp only [occurrenceClauses,\n    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,\n    List.mem_flatMap, List.mem_map] at hclause\n  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause\n  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction\n\n#print axioms sourceAssign_refinementClauses\nend ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard{shard_no}\nend Problem97\n'''


def coordinator() -> str:
    imports = "\n".join(f"import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinementsShard{i}" for i in range(SHARDS))
    expr = " ++\n    ".join(f"ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard{i}.refinementClauses" for i in range(SHARDS))
    return f'''/-\n+Copyright (c) 2026 Adam McKenna. All rights reserved.\n+Released under Apache 2.0 license as described in the file LICENSE.\n+Authors: Adam McKenna\n+-/\n+\n+{imports}\n+\n+/-! # Child38 authenticated subset-minimal six-hit cancellation bank\n+\n+The four shards contain 28 source-checked occurrences and 112 complete\n+order/orientation clauses, extending the Lean-owned Child37 root.\n+-/\n+\n+namespace Problem97\n+namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinements\n+open ATailBlockerVExactSeventeenSourceNormalForm\n+open ATailBlockerVExactSeventeenSourceCnf\n+open ATailBlockerVExactSeventeenThirtySeventhModelRefinements\n+\ndef thirtyEighthModelRefinementClauses : Std.Sat.CNF Atom :=\n+  {expr}\n+\ntheorem thirtyEighthModelRefinementClauses_length :\n+    thirtyEighthModelRefinementClauses.length = 112 := by\n+  simp only [thirtyEighthModelRefinementClauses, List.length_append,\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.refinementClauses_length,\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.refinementClauses_length,\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.refinementClauses_length,\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.refinementClauses_length]\n+\ntheorem sourceAssign_thirtyEighthModelRefinementClauses\n+    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :\n+    ∀ clause ∈ thirtyEighthModelRefinementClauses,\n+      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by\n+  intro clause hclause\n+  change clause ∈\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.refinementClauses ++\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.refinementClauses ++\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.refinementClauses ++\n+    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.refinementClauses at hclause\n+  rcases List.mem_append.mp hclause with h012 | h3\n+  · rcases List.mem_append.mp h012 with h01 | h2\n+    · rcases List.mem_append.mp h01 with h0 | h1\n+      · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.sourceAssign_refinementClauses source clause h0\n+      · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.sourceAssign_refinementClauses source clause h1\n+    · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.sourceAssign_refinementClauses source clause h2\n+  · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.sourceAssign_refinementClauses source clause h3\n+\ndef extendedThirtyEighthModelRefinementsCnf : Std.Sat.CNF Atom :=\n+  extendedThirtySeventhModelRefinementsCnf ++ thirtyEighthModelRefinementClauses\n+\ntheorem extendedThirtyEighthModelRefinementsCnf_length :\n+    extendedThirtyEighthModelRefinementsCnf.length = 5847388 := by\n+  simp only [extendedThirtyEighthModelRefinementsCnf, List.length_append,\n+    extendedThirtySeventhModelRefinementsCnf_length,\n+    thirtyEighthModelRefinementClauses_length]\n+\ntheorem sourceAssign_extendedThirtyEighthModelRefinementsCnf\n+    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :\n+    Std.Sat.CNF.eval (sourceAssign source.model) extendedThirtyEighthModelRefinementsCnf = true := by\n+  rw [Std.Sat.CNF.eval, List.all_eq_true]\n+  intro clause hclause\n+  simp only [extendedThirtyEighthModelRefinementsCnf, List.mem_append] at hclause\n+  rcases hclause with hparent | hsuffix\n+  · have h := sourceAssign_extendedThirtySeventhModelRefinementsCnf source\n+    rw [Std.Sat.CNF.eval, List.all_eq_true] at h\n+    exact h clause hparent\n+  · exact sourceAssign_thirtyEighthModelRefinementClauses source clause hsuffix\n+\n+theorem false_of_sourceRealization_of_extendedThirtyEighthModelRefinementsCnf_unsat\n+    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (hsource : Nonempty (SourceRealization A))\n+    (hunsat : ¬ ∃ assignment,\n+      Std.Sat.CNF.eval assignment extendedThirtyEighthModelRefinementsCnf = true) : False := by\n+  rcases hsource with ⟨source⟩\n+  exact hunsat ⟨sourceAssign source.model, sourceAssign_extendedThirtyEighthModelRefinementsCnf source⟩\n+\n+#print axioms sourceAssign_thirtyEighthModelRefinementClauses\n+#print axioms sourceAssign_extendedThirtyEighthModelRefinementsCnf\n+#print axioms false_of_sourceRealization_of_extendedThirtyEighthModelRefinementsCnf_unsat\n+end ATailBlockerVExactSeventeenThirtyEighthModelRefinements\n+end Problem97\n'''


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--emit", action="store_true")
    parser.add_argument("--rewrite", action="store_true")
    args = parser.parse_args()
    entries, ledger_entries = derive_entries()
    if not args.emit:
        print(json.dumps({"occurrences": len(entries), "clauses": len(entries) * 4}, sort_keys=True))
        return 0
    outputs: list[Path] = []
    shard_entries = [entry + "," for entry in entries]
    for shard_no in range(SHARDS):
        path = OUT / f"BlockerVExactSeventeenThirtyEighthModelRefinementsShard{shard_no}.lean"
        if path.exists() and not args.rewrite:
            raise FileExistsError(path)
        rendered = shard(shard_no, shard_entries[shard_no * 7 : (shard_no + 1) * 7]).replace("\n+", "\n")
        rendered = rendered.replace(
            "open ATailBlockerVExactSeventeenSourceCnf\n",
            "open ATailBlockerVExactSeventeenSourceCnf\n"
            "open ATailBlockerVExactSeventeenSourceCnfCdefg\n"
            "open ATailFrontierLiveClosure.GenericRowNogoodCertificate\n",
        )
        path.write_text(rendered, encoding="utf-8")
        outputs.append(path)
    coordinator_path = OUT / "BlockerVExactSeventeenThirtyEighthModelRefinements.lean"
    if coordinator_path.exists() and not args.rewrite:
        raise FileExistsError(coordinator_path)
    coordinator_rendered = coordinator().replace("\n+", "\n")
    coordinator_rendered = coordinator_rendered.replace(
        "open ATailBlockerVExactSeventeenSourceCnf\n",
        "open ATailBlockerVExactSeventeenSourceCnf\n"
        "open ATailBlockerVExactSeventeenSourceCnfCdefg\n"
        "open ATailFrontierLiveClosure.GenericRowNogoodCertificate\n",
    )
    coordinator_path.write_text(coordinator_rendered, encoding="utf-8")
    outputs.append(coordinator_path)
    ledger = {"schema": "p97-exact17-child38-six-hit-cancellation-bank/v1", "status": "PASS", "cnf_sha256": CNF_SHA256, "model_sha256": MODEL_SHA256, "analysis_sha256": ANALYSIS_SHA256, "named_order_index": 1, "forward_record_count": FORWARD_RECORDS, "reverse_record_count": REVERSE_RECORDS, "distinct_support_count": DISTINCT_SUPPORTS, "subset_minimal_support_count": SUBSET_MINIMAL_SUPPORTS, "record_count": len(entries), "clause_count": len(entries) * 4, "outputs": {str(path.relative_to(ROOT)): sha256_file(path) for path in outputs}, "entries": ledger_entries}
    LEDGER.write_text(json.dumps(ledger, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"occurrences": len(entries), "clauses": len(entries) * 4, "outputs": len(outputs), "ledger": str(LEDGER)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
