"""Generate the complete new minimal cancellation family from exact-17 child 30."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from generate_exact17_twenty_ninth_all_cancellation_refinements import (
    ORDERS,
    N,
    choose_exact_support_record,
    lean_occurrence,
    ledger_support,
    path_hits,
    reflected,
    sha256_file,
)

from census.atail_force import producer_bank

Hit = tuple[int, int]


LEAN_PREAMBLE = r'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyNinthModelRefinements

/-!
# Complete new minimal cancellation family from exact-seventeen child 30

The child-30 model has 80 checked two-Kalmanson cancellation certificates.
Projecting them to the positive selected-row incidences actually consumed and
removing supersets leaves 40 supports, none subsumed by the child-29 bank.
Each record below contains separately checked forward and reflected
certificates. Their 160 order/orientation nogoods form the child-31 suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtiethModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailBlockerVExactSeventeenTwentyNinthModelRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
'''


LEAN_POSTAMBLE = r'''

theorem cancellationOccurrences_length : cancellationOccurrences.length = 40 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def thirtiethModelRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem thirtiethModelRefinementClauses_length :
    thirtiethModelRefinementClauses.length = 160 := by
  native_decide

theorem sourceAssign_thirtiethModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtiethModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [thirtiethModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def extendedThirtiethModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentyNinthModelRefinementsCnf ++
    thirtiethModelRefinementClauses

theorem extendedThirtiethModelRefinementsCnf_length :
    extendedThirtiethModelRefinementsCnf.length = 5846904 := by
  native_decide

theorem sourceAssign_extendedThirtiethModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtiethModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtiethModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentyNinthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtiethModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtiethModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtiethModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtiethModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtiethModelRefinementsCnf

end ATailBlockerVExactSeventeenThirtiethModelRefinements
end Problem97
'''


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--parent-ledger", type=Path, required=True)
    parser.add_argument("--lean-output", type=Path, required=True)
    parser.add_argument("--ledger-output", type=Path, required=True)
    args = parser.parse_args()

    analysis = json.loads(args.analysis.read_text(encoding="utf-8"))
    if analysis["status"] != "PASS" or analysis["named_orders"] not in ([0], [1]):
        raise ValueError("expected one authenticated SAT named-order model")
    order = ORDERS[analysis["named_orders"][0]]
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(
            analysis["rows"].items(), key=lambda item: int(item[0])
        )
    ]
    records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, order, max_cores=100_000
    )
    supports = sorted(
        {path_hits(record) for record in records},
        key=lambda hits: (len(hits), sorted(hits)),
    )
    minimal = [
        hits for hits in supports if not any(other < hits for other in supports)
    ]
    if (len(records), len(supports), len(minimal)) != (80, 49, 40):
        raise ValueError(
            "unexpected census: "
            f"{len(records)} records, {len(supports)} supports, {len(minimal)} minimal"
        )

    parent: dict[str, Any] = json.loads(args.parent_ledger.read_text(encoding="utf-8"))
    if parent.get("schema") != "p97-exact17-child29-all-minimal-two-kalmanson/v1":
        raise ValueError("unexpected parent ledger schema")
    parent_supports = [ledger_support(entry) for entry in parent["entries"]]
    subsumed = [
        hits for hits in minimal if any(parent_hits <= hits for parent_hits in parent_supports)
    ]
    if subsumed:
        raise ValueError(f"child-29 bank subsumes {len(subsumed)} candidate supports")

    entries = []
    lean_entries = []
    for hits in minimal:
        forward = choose_exact_support_record(hits)
        reverse_hits = reflected(hits)
        reverse = choose_exact_support_record(reverse_hits)
        if path_hits(forward) != hits or path_hits(reverse) != reverse_hits:
            raise AssertionError("chosen certificate does not consume the exact support")
        entries.append(
            {
                "hits": [list(hit) for hit in sorted(hits)],
                "forward_record": forward,
                "reverse_record": reverse,
            }
        )
        lean_entries.append(lean_occurrence(hits, forward, reverse))

    args.lean_output.parent.mkdir(parents=True, exist_ok=True)
    args.lean_output.write_text(
        LEAN_PREAMBLE + "[\n" + ",\n".join(lean_entries) + "]\n" + LEAN_POSTAMBLE,
        encoding="utf-8",
    )
    ledger = {
        "schema": "p97-exact17-child30-all-minimal-two-kalmanson/v1",
        "source_analysis": str(args.analysis),
        "source_analysis_sha256": sha256_file(args.analysis),
        "parent_ledger": str(args.parent_ledger),
        "parent_ledger_sha256": sha256_file(args.parent_ledger),
        "record_count": len(records),
        "distinct_support_count": len(supports),
        "minimal_support_count": len(minimal),
        "parent_subsumed_support_count": 0,
        "emitted_clause_count": 4 * len(minimal),
        "entries": entries,
    }
    args.ledger_output.parent.mkdir(parents=True, exist_ok=True)
    args.ledger_output.write_text(
        json.dumps(ledger, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        f"generated {args.lean_output} and {args.ledger_output}: "
        f"{len(records)} records -> {len(minimal)} minimal -> {4 * len(minimal)} clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
