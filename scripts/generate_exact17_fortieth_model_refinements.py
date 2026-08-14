"""Generate the source-checked exact-17 Child40 cancellation bank in Lean."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

from generate_exact17_forty_first_wave_bank import (
    ACTIVE_ORDER,
    ANALYSIS_PATH,
    ANALYSIS_SHA256,
    MODEL_PATH,
    MODEL_SHA256,
    PARENT_CLAUSES,
    PARENT_PATH,
    PARENT_SHA256,
    load_analysis,
    sha256_file,
)
from generate_exact17_thirtieth_all_cancellation_refinements import (
    N,
    choose_exact_support_record,
    lean_occurrence,
    path_hits,
    reflected,
)
from generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    project_record_for_lean,
)

from census.atail_force import producer_bank

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEDGER = (
    ROOT
    / "scratch/exact17-lean-to-sat/child40-wave-mine/"
    "child40-cancellation-bank-ledger.json"
)
MODEL_SCHEMA = "p97-exact17-child40-piqd-model/v3"
FORWARD_RECORDS = 586
REVERSE_RECORDS = 586
DISTINCT_SUPPORTS = 210
OCCURRENCES = 84
CLAUSES = 336
SHARD_SIZE = 7
SHARDS = 12
CHILD_CLAUSES = 5_847_920


def _strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON key: {key}")
        value[key] = item
    return value


def load_model() -> dict[str, Any]:
    if sha256_file(MODEL_PATH) != MODEL_SHA256:
        raise ValueError("authenticated Child40 model pin drifted")
    if sha256_file(PARENT_PATH) != PARENT_SHA256:
        raise ValueError("authenticated Child40 CNF pin drifted")
    payload = json.loads(
        MODEL_PATH.read_text(encoding="utf-8"), object_pairs_hook=_strict_object
    )
    if payload.get("schema") != MODEL_SCHEMA:
        raise ValueError("unexpected Child40 model schema")
    if payload.get("cnf_sha256") != PARENT_SHA256 or payload.get("replay") != {
        "clauses_checked": PARENT_CLAUSES,
        "satisfies_all": True,
    }:
        raise ValueError("Child40 model replay binding drifted")
    assignment = payload.get("model", {}).get("assignment")
    if not isinstance(assignment, list) or len(assignment) != 308:
        raise ValueError("Child40 assignment is not total")
    if {abs(value) for value in assignment} != set(range(1, 309)):
        raise ValueError("Child40 assignment is not a signed permutation")
    return payload


def decode_rows(payload: dict[str, Any]) -> list[producer_bank.MetricRow]:
    assignment = payload["model"]["assignment"]
    rows: list[producer_bank.MetricRow] = []
    for center in range(N):
        points = tuple(
            point for point in range(N) if assignment[N * center + point] > 0
        )
        if len(points) != 4 or center in points:
            raise ValueError("decoded Child40 rows are not four-point metric rows")
        rows.append(producer_bank.MetricRow(center, points, exact=False))
    return rows


def _analysis_supports() -> list[frozenset[tuple[int, int]]]:
    analysis = load_analysis(ANALYSIS_PATH)
    entry = analysis["two_kalmanson_occurrences"][0]
    supports = [
        frozenset((int(center), int(point)) for center, point in candidate["support"])
        for candidate in entry["candidates"]
    ]
    if len(supports) != OCCURRENCES or len(set(supports)) != OCCURRENCES:
        raise ValueError("Child40 analysis occurrence census drifted")
    return supports


def _record_digest(record: dict[str, Any]) -> str:
    encoded = json.dumps(record, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def derive_entries() -> tuple[list[str], list[dict[str, Any]]]:
    rows = decode_rows(load_model())
    order = tuple(ACTIVE_ORDER)
    reverse_order = tuple(reversed(order))
    records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, order, max_cores=100_000
    )
    reverse_records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, reverse_order, max_cores=100_000
    )
    if len(records) != FORWARD_RECORDS or len(reverse_records) != REVERSE_RECORDS:
        raise ValueError("Child40 producer-record census drifted")

    supports = sorted(
        {path_hits(record) for record in records},
        key=lambda hits: (len(hits), sorted(hits)),
    )
    if len(supports) != DISTINCT_SUPPORTS:
        raise ValueError("Child40 distinct-support census drifted")
    minimal = [hits for hits in supports if not any(other < hits for other in supports)]
    analysis_supports = _analysis_supports()
    if minimal != analysis_supports:
        raise ValueError("Child40 analysis supports differ from producer replay")

    entries: list[str] = []
    ledger_entries: list[dict[str, Any]] = []
    for hits in minimal:
        reverse_hits = reflected(hits)
        forward = choose_exact_support_record(
            hits, order, records=records, rows=rows
        )
        reverse = choose_exact_support_record(
            reverse_hits,
            reverse_order,
            records=reverse_records,
            rows=rows,
        )
        forward_lean = project_record_for_lean(forward, hits, order, rows)
        reverse_lean = project_record_for_lean(
            reverse, reverse_hits, reverse_order, rows
        )
        if not lean_occurrence_check(
            hits,
            forward_lean,
            reverse_lean,
            rows=rows,
            forward_order=order,
            reverse_order=reverse_order,
        ):
            raise ValueError(f"Lean projection failed for {sorted(hits)}")
        entries.append(lean_occurrence(hits, forward_lean, reverse_lean))
        ledger_entries.append(
            {
                "hits": [list(hit) for hit in sorted(hits)],
                "reflected_hits": [list(hit) for hit in sorted(reverse_hits)],
                "forward_record_sha256": _record_digest(forward),
                "reverse_record_sha256": _record_digest(reverse),
            }
        )
    return entries, ledger_entries


def render_shard(shard_no: int, entries: list[str]) -> str:
    occurrence_text = ",\n".join(entries)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard {shard_no}

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard{shard_no}
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
{occurrence_text}
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 7 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 28 := by
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard{shard_no}
end Problem97
"""


def _membership_proof() -> str:
    lines: list[str] = []

    def descend(last: int, hypothesis: str, indent: str, *, branch: bool) -> None:
        command_prefix = f"{indent}· " if branch else indent
        branch_indent = indent + "  " if branch else indent
        if last == 1:
            lines.append(
                f"{command_prefix}rcases List.mem_append.mp {hypothesis} "
                "with h0 | h1"
            )
            lines.append(
                f"{branch_indent}· exact "
                "ATailBlockerVExactSeventeenFortiethModelRefinementsShard0."
                "sourceAssign_refinementClauses source clause h0"
            )
            lines.append(
                f"{branch_indent}· exact "
                "ATailBlockerVExactSeventeenFortiethModelRefinementsShard1."
                "sourceAssign_refinementClauses source clause h1"
            )
            return
        prefix_name = f"h0to{last - 1}"
        lines.append(
            f"{command_prefix}rcases List.mem_append.mp {hypothesis} "
            f"with {prefix_name} | h{last}"
        )
        descend(last - 1, prefix_name, branch_indent, branch=True)
        lines.append(
            f"{branch_indent}· exact "
            f"ATailBlockerVExactSeventeenFortiethModelRefinementsShard{last}."
            f"sourceAssign_refinementClauses source clause h{last}"
        )

    descend(SHARDS - 1, "hclause", "  ", branch=False)
    return "\n".join(lines)


def render_coordinator() -> str:
    imports = "\n".join(
        "import Erdos9796Proof.P97.ATail."
        f"BlockerVExactSeventeenFortiethModelRefinementsShard{i}"
        for i in range(SHARDS)
    )
    namespaces = [
        f"ATailBlockerVExactSeventeenFortiethModelRefinementsShard{i}"
        for i in range(SHARDS)
    ]
    clause_expr = " ++\n    ".join(f"{ns}.refinementClauses" for ns in namespaces)
    length_lemmas = ",\n    ".join(
        f"{ns}.refinementClauses_length" for ns in namespaces
    )
    proof = _membership_proof()
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

{imports}

/-! # Child41 source-checked cancellation refinements

The authenticated Child40 SAT model exposes 84 subset-minimal occurrences of
the generic two-Kalmanson cancellation theorem. Their 336 order/orientation
nogoods extend the immutable Child40 root for the next exact-seventeen query.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtyNinthModelRefinements

def fortiethModelRefinementClauses : Std.Sat.CNF Atom :=
  {clause_expr}

theorem fortiethModelRefinementClauses_length :
    fortiethModelRefinementClauses.length = {CLAUSES} := by
  simp only [fortiethModelRefinementClauses, List.length_append,
    {length_lemmas}]

theorem sourceAssign_fortiethModelRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortiethModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈ {clause_expr} at hclause
{proof}

def extendedFortiethModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyNinthModelRefinementsCnf ++ fortiethModelRefinementClauses

theorem extendedFortiethModelRefinementsCnf_length :
    extendedFortiethModelRefinementsCnf.length = {CHILD_CLAUSES} := by
  simp only [extendedFortiethModelRefinementsCnf, List.length_append,
    extendedThirtyNinthModelRefinementsCnf_length,
    fortiethModelRefinementClauses_length]

theorem sourceAssign_extendedFortiethModelRefinementsCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortiethModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortiethModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyNinthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortiethModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortiethModelRefinementsCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortiethModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedFortiethModelRefinementsCnf source⟩

#print axioms sourceAssign_fortiethModelRefinementClauses
#print axioms sourceAssign_extendedFortiethModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortiethModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortiethModelRefinements
end Problem97
"""


def render_exporter() -> str:
    return """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! # Export the checked exact-seventeen Child41 root -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortiethModelRefinements

def extendedFortiethModelRefinementsDimacsString : String :=
  let dimacs := extendedFortiethModelRefinementsCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortiethModelRefinementsDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortiethModelRefinementsExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortiethModelRefinementsExport.run args
"""


def _write(path: Path, content: str, *, rewrite: bool) -> None:
    if path.exists() and not rewrite:
        raise FileExistsError(path)
    path.write_text(content, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--emit", action="store_true")
    parser.add_argument("--rewrite", action="store_true")
    args = parser.parse_args()

    if sha256_file(ANALYSIS_PATH) != ANALYSIS_SHA256:
        raise ValueError("authenticated Child40 analysis pin drifted")
    entries, ledger_entries = derive_entries()
    if len(entries) != OCCURRENCES:
        raise ValueError("unexpected Child40 Lean occurrence count")
    if not args.emit:
        print(json.dumps({"occurrences": len(entries), "clauses": CLAUSES}))
        return 0

    outputs: list[Path] = []
    for shard_no in range(SHARDS):
        shard_entries = entries[
            shard_no * SHARD_SIZE : (shard_no + 1) * SHARD_SIZE
        ]
        if len(shard_entries) != SHARD_SIZE:
            raise ValueError(f"shard {shard_no} is not full")
        path = OUT / (
            f"BlockerVExactSeventeenFortiethModelRefinementsShard{shard_no}.lean"
        )
        _write(path, render_shard(shard_no, shard_entries), rewrite=args.rewrite)
        outputs.append(path)

    coordinator = OUT / "BlockerVExactSeventeenFortiethModelRefinements.lean"
    exporter = OUT / "BlockerVExactSeventeenFortiethModelRefinementsExport.lean"
    _write(coordinator, render_coordinator(), rewrite=args.rewrite)
    _write(exporter, render_exporter(), rewrite=args.rewrite)
    outputs.extend((coordinator, exporter))

    ledger = {
        "schema": "p97-exact17-child40-cancellation-bank/v1",
        "status": "PASS",
        "parent_cnf_sha256": PARENT_SHA256,
        "parent_clause_count": PARENT_CLAUSES,
        "model_sha256": MODEL_SHA256,
        "analysis_sha256": ANALYSIS_SHA256,
        "named_order_index": 1,
        "forward_record_count": FORWARD_RECORDS,
        "reverse_record_count": REVERSE_RECORDS,
        "distinct_support_count": DISTINCT_SUPPORTS,
        "occurrence_count": OCCURRENCES,
        "clause_count": CLAUSES,
        "child_clause_count": CHILD_CLAUSES,
        "entries": ledger_entries,
        "outputs": {
            str(path.relative_to(ROOT)): sha256_file(path) for path in outputs
        },
    }
    LEDGER.parent.mkdir(parents=True, exist_ok=True)
    _write(
        LEDGER,
        json.dumps(ledger, indent=2, sort_keys=True) + "\n",
        rewrite=args.rewrite,
    )
    print(
        json.dumps(
            {
                "occurrences": len(entries),
                "clauses": CLAUSES,
                "outputs": len(outputs),
                "ledger": str(LEDGER),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
