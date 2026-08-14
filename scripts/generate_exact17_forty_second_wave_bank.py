"""Generate the authenticated Child42 suffix from the Child41 wave mine.

The input is intentionally pinned to the independently replayed Child41
analysis.  It emits source-checked Lean shards for exactly the 133 minimal
two-Kalmanson supports and a coordinator extending the Child41/Fortieth root.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from census.atail_force import producer_bank
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    Hit,
    choose_exact_support_record,
    lean_occurrence,
    path_hits,
    project_record_for_lean,
    reflected,
)

ROOT = Path(__file__).resolve().parents[1]
ANALYSIS = ROOT / "scratch/exact17-lean-to-sat/child41-wave-mine/child41-analysis.json"
ANALYSIS_SHA256 = "f1861dff33d8412e0bd8b4bfec311c7aa0c7d35b088126a0dfc69edd21e6d354"
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
N = 17
COUNT = 133
CLAUSES = 4 * COUNT
SHARDS = 19


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_entries() -> list[str]:
    if sha256(ANALYSIS) != ANALYSIS_SHA256:
        raise ValueError("Child41 analysis hash drifted")
    analysis = json.loads(ANALYSIS.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
    if analysis.get("schema") != "p97-exact17-child41-independent-wave-analysis/v1":
        raise ValueError("unexpected Child41 analysis schema")
    if analysis.get("status") != "PASS":
        raise ValueError("Child41 analysis is not authenticated")
    model = analysis.get("decoded_model")
    if not isinstance(model, dict) or model.get("named_order_indices") != [1]:
        raise ValueError("expected exactly the authenticated named_order=1")
    if tuple(model.get("selected_order", ())) != ORDER:
        raise ValueError("selected order drifted")
    occurrences = analysis.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or len(occurrences) != 1:
        raise ValueError("inactive order occurrence leaked into Child42 input")
    candidates = occurrences[0].get("candidates")
    if not isinstance(candidates, list) or len(candidates) != COUNT:
        raise ValueError(f"expected exactly {COUNT} subset-minimal candidates")

    rows = tuple(
        producer_bank.MetricRow(int(center), tuple(points), exact=True)
        for center, points in sorted(model["rows"].items(), key=lambda item: int(item[0]))
    )
    forward_records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, ORDER, max_cores=100_000
    )
    reverse_order = tuple(reversed(ORDER))
    reverse_records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, reverse_order, max_cores=100_000
    )
    # Rebuild each source certificate using the established forward/reflected
    # projection.  This checks the mined support is not merely a SAT artifact.
    entries: list[str] = []
    for index, candidate in enumerate(candidates):
        support_value = candidate.get("support") if isinstance(candidate, dict) else None
        if not isinstance(support_value, list) or not support_value:
            raise ValueError(f"candidate {index} has malformed support")
        hits: frozenset[Hit] = frozenset(
            (int(hit[0]), int(hit[1]))
            for hit in support_value
            if isinstance(hit, list) and len(hit) == 2
        )
        if len(hits) != len(support_value) or any(
            not (0 <= center < N and 0 <= point < N) for center, point in hits
        ):
            raise ValueError(f"candidate {index} contains invalid hits")
        producer = candidate.get("producer")
        if not isinstance(producer, dict) or path_hits(producer) != hits:
            raise ValueError(f"candidate {index} producer/support mismatch")
        forward_raw = choose_exact_support_record(
            hits, ORDER, records=forward_records, rows=rows
        )
        reverse_hits = reflected(hits)
        reverse_raw = choose_exact_support_record(
            reverse_hits, reverse_order, records=reverse_records, rows=rows
        )
        forward = project_record_for_lean(forward_raw, hits, ORDER, rows)
        reverse = project_record_for_lean(reverse_raw, reverse_hits, reverse_order, rows)
        if path_hits(forward) != hits or path_hits(reverse) != reverse_hits:
            raise ValueError(f"candidate {index} certificate projection drifted")
        entries.append(lean_occurrence(hits, forward, reverse))
    return entries


def shard_text(index: int, entries: list[str]) -> str:
    joined = ",\n".join(entries)
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard {index}. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard{index}
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
{joined}
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = {len(entries)} := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = {4 * len(entries)} := by
  native_decide

theorem sourceAssign_refinementClauses {{A : Finset ℝ²}}
    (source : SourceRealization A) :
    ∀ clause ∈ refinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [refinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

#print axioms sourceAssign_refinementClauses
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard{index}
end Problem97
'''


def coordinator_text() -> str:
    imports = "\n".join(
        f"import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard{i}"
        for i in range(SHARDS)
    )
    names = [
        f"ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard{i}.refinementClauses"
        for i in range(SHARDS)
    ]
    clauses = names[0]
    for name in names[1:]:
        clauses = f"({clauses} ++\n    {name})"
    lengths = ",\n    ".join(
        f"ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard{i}.refinementClauses_length"
        for i in range(SHARDS)
    )
    # The explicit parentheses above make the append tree left-associated.
    # Mirror it with the same nested membership split used by the Fortieth
    # coordinator, so every branch lands directly in one shard theorem.
    def membership_proof(k: int, hypothesis: str, indent: str) -> list[str]:
        if k == 1:
            return [
                indent + f"rcases List.mem_append.mp {hypothesis} with h0 | h1",
                indent + "· exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0.sourceAssign_refinementClauses source clause h0",
                indent + "· exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1.sourceAssign_refinementClauses source clause h1",
            ]
        left_hypothesis = f"h0to{k - 1}"
        lines = [
            indent + f"rcases List.mem_append.mp {hypothesis} with {left_hypothesis} | h{k}"
        ]
        left = membership_proof(k - 1, left_hypothesis, indent + "  ")
        lines.append(indent + "· " + left[0].lstrip())
        lines.extend(left[1:])
        lines.append(
            indent
            + f"· exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard{k}.sourceAssign_refinementClauses source clause h{k}"
        )
        return lines

    source_proof = "\n".join(
        "  " + line for line in membership_proof(SHARDS - 1, "hclause", "")
    )
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

{imports}

/-! Child42 source-checked two-Kalmanson suffix (133 supports, 532 clauses). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortiethModelRefinements

def fortyFirstModelRefinementClauses : Std.Sat.CNF Atom :=
  {clauses}

theorem fortyFirstModelRefinementClauses_length :
    fortyFirstModelRefinementClauses.length = {CLAUSES} := by
  simp only [fortyFirstModelRefinementClauses, List.length_append,
    {lengths}]

theorem sourceAssign_fortyFirstModelRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyFirstModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈ {clauses} at hclause
{source_proof}

def extendedFortyFirstModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortiethModelRefinementsCnf ++ fortyFirstModelRefinementClauses

theorem extendedFortyFirstModelRefinementsCnf_length :
    extendedFortyFirstModelRefinementsCnf.length = 5848452 := by
  simp only [extendedFortyFirstModelRefinementsCnf, List.length_append,
    extendedFortiethModelRefinementsCnf_length,
    fortyFirstModelRefinementClauses_length]

theorem sourceAssign_extendedFortyFirstModelRefinementsCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyFirstModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyFirstModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortiethModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyFirstModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyFirstModelRefinementsCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyFirstModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyFirstModelRefinementsCnf source⟩

#print axioms sourceAssign_fortyFirstModelRefinementClauses
#print axioms sourceAssign_extendedFortyFirstModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyFirstModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortyFirstModelRefinements
end Problem97
'''


def write_new(path: Path, text: str) -> None:
    if path.exists():
        raise FileExistsError(f"refusing to overwrite {path}")
    path.write_text(text, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    entries = load_entries()
    if len(entries) != COUNT:
        raise AssertionError("entry count drifted")
    args.output_dir.mkdir(parents=True, exist_ok=True)
    per_shard = (COUNT + SHARDS - 1) // SHARDS
    for index in range(SHARDS):
        chunk = entries[index * per_shard : (index + 1) * per_shard]
        if chunk:
            write_new(
                args.output_dir
                / f"BlockerVExactSeventeenFortyFirstModelRefinementsShard{index}.lean",
                shard_text(index, chunk),
            )
    write_new(
        args.output_dir / "BlockerVExactSeventeenFortyFirstModelRefinements.lean",
        coordinator_text(),
    )
    print(f"generated {COUNT} occurrences and {CLAUSES} clauses in {args.output_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
