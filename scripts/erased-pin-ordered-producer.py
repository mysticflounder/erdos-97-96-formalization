#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Produce the ordered erased-pin finite seed census.

The base erased-pin producer census is indexed by the generated ten labels.
The geometric scaffold, however, starts from unordered pairs/triples:

* the two private labels `.Pw/.Pu`;
* the two opposite-adjacent labels `.Q1/.Q2`;
* the three surplus labels `.s1/.s2/.s3`.

This pass enumerates the 2 * 2 * 6 relabelings preserving those three blocks
and rechecks every relabeled finite seed with the same exact predicates used by
`scripts/erased-pin-producer-census.py`.  The output is the finite producer
data needed by the ordered-label bridge: every unordered finite row target is
expanded to all ordered presentations that can feed the fixed hull-order DFS.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


SCHEMA = "p97.erased_pin_ordered_producer_census.v1"
BASE_SCRIPT = Path("scripts/erased-pin-producer-census.py")
PRIVATE_BLOCK = ("Pw", "Pu")
Q_BLOCK = ("Q1", "Q2")
SURPLUS_BLOCK = ("s1", "s2", "s3")


def load_base_module(script_path: Path = BASE_SCRIPT) -> Any:
    spec = importlib.util.spec_from_file_location("erased_pin_producer_census", script_path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load producer module from {script_path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def load_json(path: Path) -> Any:
    with path.open() as handle:
        return json.load(handle)


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def permutation_id(mapping: dict[str, str]) -> str:
    return (
        f"P{mapping['Pw']}{mapping['Pu']}_"
        f"Q{mapping['Q1']}{mapping['Q2']}_"
        f"S{mapping['s1']}{mapping['s2']}{mapping['s3']}"
    )


def label_permutations(labels: tuple[str, ...]) -> list[dict[str, str]]:
    out: list[dict[str, str]] = []
    for private_perm in itertools.permutations(PRIVATE_BLOCK):
        for q_perm in itertools.permutations(Q_BLOCK):
            for surplus_perm in itertools.permutations(SURPLUS_BLOCK):
                mapping = {label: label for label in labels}
                mapping.update(dict(zip(PRIVATE_BLOCK, private_perm)))
                mapping.update(dict(zip(Q_BLOCK, q_perm)))
                mapping.update(dict(zip(SURPLUS_BLOCK, surplus_perm)))
                out.append(mapping)
    return out


def inverse_mapping(mapping: dict[str, str]) -> dict[str, str]:
    return {target: source for source, target in mapping.items()}


def relabel_mask(base: Any, mask: int, mapping: dict[str, str]) -> int:
    out = 0
    for source in base.LABELS:
        if base.mask_has(mask, source):
            out |= 1 << base.LABEL_INDEX[mapping[source]]
    return out


def mask_labels(base: Any, mask: int) -> list[str]:
    return [label for label in base.LABELS if base.mask_has(mask, label)]


def seed_key(sstar: str, center: str, mask: int) -> str:
    return f"{sstar}|{center}|{mask}"


def seed_record(base: Any, sstar: str, center: str, mask: int) -> dict[str, Any]:
    return {
        "sstar": sstar,
        "center": center,
        "mask_value": mask,
        "mask": base.mask_key(mask_labels(base, mask)),
    }


def finite_rows(payload: dict[str, Any]) -> list[dict[str, Any]]:
    return [row for row in payload["rows"] if row["finite_blocker"] is None]


def build_existing_seed_set(payload: dict[str, Any]) -> set[tuple[str, str, int]]:
    return {
        (str(mask["sstar"]), str(mask["center"]), int(mask["mask_value"]))
        for row in finite_rows(payload)
        for mask in row["masks"]
    }


def build_ordered_census(
    base: Any,
    producer_path: Path,
    include_variants: bool,
) -> dict[str, Any]:
    source = load_json(producer_path)
    if source.get("schema") != base.SCHEMA:
        raise ValueError(f"unsupported producer schema {source.get('schema')!r}")
    if tuple(source.get("labels", [])) != base.LABELS:
        raise ValueError("producer labels do not match the base generator labels")

    permutations = label_permutations(base.LABELS)
    existing_seed_set = build_existing_seed_set(source)
    variants_by_row: list[dict[str, Any]] = []
    distinct_ordered_seeds: dict[str, dict[str, Any]] = {}
    ordered_seed_rows: dict[str, set[str]] = defaultdict(set)
    ordered_seed_permutations: dict[str, set[str]] = defaultdict(set)
    global_counts: Counter[str] = Counter()

    for row in finite_rows(source):
        row_id = str(row["id"])
        row_variants: list[dict[str, Any]] = []
        row_seed_keys: set[str] = set()
        row_counts: Counter[str] = Counter()
        for mask_index, mask in enumerate(row["masks"]):
            source_sstar = str(mask["sstar"])
            source_center = str(mask["center"])
            source_mask = int(mask["mask_value"])
            for mapping in permutations:
                perm_id = permutation_id(mapping)
                ordered_sstar = mapping[source_sstar]
                ordered_center = mapping[source_center]
                ordered_mask = relabel_mask(base, source_mask, mapping)
                key = seed_key(ordered_sstar, ordered_center, ordered_mask)
                row_seed_keys.add(key)
                ordered_seed_rows[key].add(row_id)
                ordered_seed_permutations[key].add(perm_id)
                local_ok = base.local_candidate_mask_ok(
                    ordered_sstar, ordered_center, ordered_mask
                )
                dfs_count = base.one_sided_seed_search_count(
                    ordered_sstar, ordered_center, ordered_mask
                )
                in_fixed_bank = (
                    ordered_sstar,
                    ordered_center,
                    ordered_mask,
                ) in existing_seed_set
                private_v_cross = base.cross_separation_ok_for_masks(
                    ordered_center,
                    ordered_mask,
                    "v",
                    base.FIRST_OPP_EXACT_CAP_MASK,
                )
                private_w_cross = base.cross_separation_ok_for_masks(
                    ordered_center,
                    ordered_mask,
                    "w",
                    base.SECOND_OPP_EXACT_CAP_MASK,
                )

                row_counts["ordered_variant_count"] += 1
                global_counts["ordered_variant_count"] += 1
                if local_ok:
                    row_counts["local_candidate_ok"] += 1
                    global_counts["local_candidate_ok"] += 1
                if dfs_count == 0:
                    row_counts["seeded_dfs_zero"] += 1
                    global_counts["seeded_dfs_zero"] += 1
                else:
                    row_counts["seeded_dfs_positive"] += 1
                    global_counts["seeded_dfs_positive"] += 1
                if in_fixed_bank:
                    row_counts["in_existing_fixed_bank"] += 1
                    global_counts["in_existing_fixed_bank"] += 1
                if not private_v_cross:
                    row_counts["private_v_cross_separation_false"] += 1
                    global_counts["private_v_cross_separation_false"] += 1
                if not private_w_cross:
                    row_counts["private_w_cross_separation_false"] += 1
                    global_counts["private_w_cross_separation_false"] += 1

                if key not in distinct_ordered_seeds:
                    distinct_ordered_seeds[key] = {
                        **seed_record(base, ordered_sstar, ordered_center, ordered_mask),
                        "local_candidate_mask_ok": local_ok,
                        "seeded_dfs_completion_count": dfs_count,
                        "private_v_cross_separation_ok": private_v_cross,
                        "private_w_cross_separation_ok": private_w_cross,
                        "in_existing_fixed_bank": in_fixed_bank,
                    }

                if include_variants:
                    row_variants.append(
                        {
                            "source_mask_index": mask_index,
                            "permutation": perm_id,
                            "source_seed": seed_record(
                                base, source_sstar, source_center, source_mask
                            ),
                            "ordered_seed": seed_record(
                                base, ordered_sstar, ordered_center, ordered_mask
                            ),
                            "local_candidate_mask_ok": local_ok,
                            "seeded_dfs_completion_count": dfs_count,
                            "private_v_cross_separation_ok": private_v_cross,
                            "private_w_cross_separation_ok": private_w_cross,
                            "in_existing_fixed_bank": in_fixed_bank,
                        }
                    )

        variants_by_row.append(
            {
                "id": row_id,
                "side": row["side"],
                "route": row["route"],
                "counts": row["counts"],
                "oriented_counts": row["oriented_counts"],
                "source_finite_mask_count": row["finite_mask_count"],
                "ordered_variant_count": row_counts["ordered_variant_count"],
                "ordered_distinct_seed_count": len(row_seed_keys),
                "ordered_variants_local_candidate_ok": row_counts["local_candidate_ok"],
                "ordered_variants_seeded_dfs_zero": row_counts["seeded_dfs_zero"],
                "ordered_variants_seeded_dfs_positive": row_counts[
                    "seeded_dfs_positive"
                ],
                "ordered_variants_in_existing_fixed_bank": row_counts[
                    "in_existing_fixed_bank"
                ],
                "ordered_variants_private_v_cross_separation_false": row_counts[
                    "private_v_cross_separation_false"
                ],
                "ordered_variants_private_w_cross_separation_false": row_counts[
                    "private_w_cross_separation_false"
                ],
                "ordered_seed_keys": sorted(row_seed_keys),
                **({"ordered_variants": row_variants} if include_variants else {}),
            }
        )

    ordered_seed_records = []
    for key, record in sorted(
        distinct_ordered_seeds.items(),
        key=lambda item: (
            base.LABEL_INDEX[item[1]["sstar"]],
            base.LABEL_INDEX[item[1]["center"]],
            item[1]["mask_value"],
        ),
    ):
        ordered_seed_records.append(
            {
                "key": key,
                **record,
                "row_ids": sorted(ordered_seed_rows[key]),
                "permutations": sorted(ordered_seed_permutations[key]),
            }
        )

    finite_row_count = len(finite_rows(source))
    source_mask_count = sum(int(row["finite_mask_count"]) for row in finite_rows(source))
    ordered_variant_count = source_mask_count * len(permutations)
    summary = {
        "base_schema": source["schema"],
        "finite_row_count": finite_row_count,
        "source_finite_mask_count": source_mask_count,
        "permutation_count": len(permutations),
        "ordered_variant_count": ordered_variant_count,
        "ordered_distinct_seed_count": len(distinct_ordered_seeds),
        "ordered_distinct_seeds_in_existing_fixed_bank": sum(
            seed["in_existing_fixed_bank"] for seed in distinct_ordered_seeds.values()
        ),
        "ordered_distinct_seeds_local_candidate_ok": sum(
            seed["local_candidate_mask_ok"] for seed in distinct_ordered_seeds.values()
        ),
        "ordered_distinct_seeds_seeded_dfs_zero": sum(
            seed["seeded_dfs_completion_count"] == 0
            for seed in distinct_ordered_seeds.values()
        ),
        "ordered_distinct_seeds_seeded_dfs_positive": sum(
            seed["seeded_dfs_completion_count"] > 0
            for seed in distinct_ordered_seeds.values()
        ),
        "ordered_variants_in_existing_fixed_bank": global_counts[
            "in_existing_fixed_bank"
        ],
        "ordered_variants_local_candidate_ok": global_counts["local_candidate_ok"],
        "ordered_variants_seeded_dfs_zero": global_counts["seeded_dfs_zero"],
        "ordered_variants_seeded_dfs_positive": global_counts["seeded_dfs_positive"],
        "ordered_variants_private_v_cross_separation_false": global_counts[
            "private_v_cross_separation_false"
        ],
        "ordered_variants_private_w_cross_separation_false": global_counts[
            "private_w_cross_separation_false"
        ],
        "rows_all_ordered_variants_in_existing_fixed_bank": sum(
            row["ordered_variant_count"]
            == row["ordered_variants_in_existing_fixed_bank"]
            for row in variants_by_row
        ),
        "rows_all_ordered_variants_seeded_dfs_zero": sum(
            row["ordered_variant_count"] == row["ordered_variants_seeded_dfs_zero"]
            for row in variants_by_row
        ),
        "include_variants": include_variants,
    }
    return {
        "schema": SCHEMA,
        "description": (
            "Ordered/permutation-aware finite producer census for erased-pin "
            "ten-label rows. Each source finite mask is expanded through every "
            "private/Q/surplus block relabeling compatible with the generated "
            "fixed hull vocabulary."
        ),
        "source": str(producer_path),
        "labels": list(base.LABELS),
        "hull_order": list(base.HULL_ORDER),
        "permutation_blocks": {
            "private": list(PRIVATE_BLOCK),
            "q": list(Q_BLOCK),
            "surplus": list(SURPLUS_BLOCK),
        },
        "permutations": [
            {
                "id": permutation_id(mapping),
                "source_to_ordered": {label: mapping[label] for label in base.LABELS},
                "ordered_to_source": inverse_mapping(mapping),
            }
            for mapping in permutations
        ],
        "summary": summary,
        "ordered_seeds": ordered_seed_records,
        "rows": variants_by_row,
    }


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    summary = payload["summary"]
    lines = [
        "# Erased-pin ordered producer census",
        "",
        "Generated by `scripts/erased-pin-ordered-producer.py`.",
        "",
        "## Summary",
        "",
        f"- finite rows: {summary['finite_row_count']}",
        f"- source finite masks: {summary['source_finite_mask_count']}",
        f"- relabeling permutations: {summary['permutation_count']}",
        f"- ordered variants: {summary['ordered_variant_count']}",
        f"- distinct ordered seeds: {summary['ordered_distinct_seed_count']}",
        "- distinct ordered seeds in existing fixed bank: "
        f"{summary['ordered_distinct_seeds_in_existing_fixed_bank']}",
        "- ordered variants in existing fixed bank: "
        f"{summary['ordered_variants_in_existing_fixed_bank']}",
        "- ordered variants with zero seeded-DFS completions: "
        f"{summary['ordered_variants_seeded_dfs_zero']}",
        "- ordered variants with positive seeded-DFS completions: "
        f"{summary['ordered_variants_seeded_dfs_positive']}",
        "- rows with all ordered variants in fixed bank: "
        f"{summary['rows_all_ordered_variants_in_existing_fixed_bank']}",
        "- rows with all ordered variants DFS-zero: "
        f"{summary['rows_all_ordered_variants_seeded_dfs_zero']}",
        "",
        "## Rows",
        "",
        "| id | source masks | ordered variants | distinct ordered seeds | in fixed bank | DFS-zero | DFS-positive | private-v sep false | private-w sep false |",
        "|---|---:|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in payload["rows"]:
        lines.append(
            f"| `{row['id']}` | {row['source_finite_mask_count']} | "
            f"{row['ordered_variant_count']} | "
            f"{row['ordered_distinct_seed_count']} | "
            f"{row['ordered_variants_in_existing_fixed_bank']} | "
            f"{row['ordered_variants_seeded_dfs_zero']} | "
            f"{row['ordered_variants_seeded_dfs_positive']} | "
            f"{row['ordered_variants_private_v_cross_separation_false']} | "
            f"{row['ordered_variants_private_w_cross_separation_false']} |"
        )
    lines.append("")
    path.write_text("\n".join(lines))


def lean_label(label: str) -> str:
    return f".{label}"


def lean_ident_suffix(value: str) -> str:
    return "".join(ch if ch.isalnum() else "_" for ch in value)


def lean_seed(seed: tuple[str, str, int]) -> str:
    sstar, private_center, private_mask = seed
    return (
        "{ sstar := "
        f"{lean_label(sstar)}, privateCenter := {lean_label(private_center)}, "
        f"kind := .own, privateMask := {private_mask} }}"
    )


def lean_seed_list(seeds: list[tuple[str, str, int]]) -> str:
    if not seeds:
        return "[]"
    seed_lines = ",\n".join(f"  {lean_seed(seed)}" for seed in seeds)
    return f"[\n{seed_lines}\n]"


def seed_from_record(record: dict[str, Any]) -> tuple[str, str, int]:
    return (str(record["sstar"]), str(record["center"]), int(record["mask_value"]))


def ordered_seed_map(payload: dict[str, Any]) -> dict[str, tuple[str, str, int]]:
    return {str(seed["key"]): seed_from_record(seed) for seed in payload["ordered_seeds"]}


def sort_seeds(base: Any, seeds: set[tuple[str, str, int]]) -> list[tuple[str, str, int]]:
    return sorted(seeds, key=lambda item: (base.LABEL_INDEX[item[0]], base.LABEL_INDEX[item[1]], item[2]))


def lean_ordered_row_seed_name(row_id: str) -> str:
    return f"erasedPinOrderedRow_{lean_ident_suffix(row_id)}_seeds"


def ordered_seeds_for_row(
    base: Any, seed_by_key: dict[str, tuple[str, str, int]], row: dict[str, Any]
) -> list[tuple[str, str, int]]:
    return sort_seeds(base, {seed_by_key[str(key)] for key in row["ordered_seed_keys"]})


def lean_ordered_row_seed_defs(base: Any, payload: dict[str, Any]) -> str:
    seed_by_key = ordered_seed_map(payload)
    sections: list[str] = []
    for row in payload["rows"]:
        row_id = str(row["id"])
        name = lean_ordered_row_seed_name(row_id)
        candidate_name = f"{name}_candidates"
        allowed_name = f"{name}_allowed"
        row_seeds = ordered_seeds_for_row(base, seed_by_key, row)
        sections.append(
            f"""/-- Deduplicated ordered seed candidates associated to erased-pin row `{row_id}`. -/
def {candidate_name} : List OneSidedSeed :=
{lean_seed_list(row_seeds)}

/-- Boolean membership test for ordered row `{row_id}` candidate seeds. -/
def {allowed_name} (seed : OneSidedSeed) : Bool :=
  {candidate_name}.any (fun candidate => candidate == seed)

/-- Fixed-bank ordered seeds associated to erased-pin row `{row_id}`. -/
def {name} : List OneSidedSeed :=
  erasedPinFixedSeeds.filter {allowed_name}

/-- Every fixed-bank ordered seed for row `{row_id}` is in the generated fixed
seed bank. -/
theorem {name}_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ {name}) : seed ∈ erasedPinFixedSeeds :=
  (List.mem_filter.mp hseed).1

/-- The fixed-bank ordered-row filter recovers exactly the ordered row
`{row_id}` candidate seed list. -/
theorem {name}_eq_candidates :
    {name} = {candidate_name} := by
  native_decide

/-- Every ordered candidate seed for row `{row_id}` is in the generated fixed
seed bank. -/
theorem {candidate_name}_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ {candidate_name}) : seed ∈ erasedPinFixedSeeds :=
  {name}_subset_fixed (by
    simpa [{name}_eq_candidates] using hseed)

/-- Ordered row `{row_id}` has the generated number of deduplicated candidate
seeds. -/
theorem {name}_length :
    {name}.length = {len(row_seeds)} := by
  native_decide"""
        )
    return "\n\n".join(sections)


def lean_ordered_seed_invalid_theorems(payload: dict[str, Any]) -> str:
    sections: list[str] = []
    for row in payload["rows"]:
        row_id = str(row["id"])
        name = lean_ordered_row_seed_name(row_id)
        candidate_name = f"{name}_candidates"
        sections.append(
            f"""/-- No valid seeded shadow can use an ordered candidate seed from
erased-pin row `{row_id}`. -/
theorem {candidate_name}_false_of_isValidOneSidedSeedShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ {candidate_name})
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    False :=
  false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed
    ({candidate_name}_subset_fixed hseed) hvalid"""
        )
    return "\n\n".join(sections)


def ordered_rows_all_private_w_cross_separation_false(
    payload: dict[str, Any],
) -> list[dict[str, Any]]:
    return [
        row
        for row in payload["rows"]
        if row["ordered_variant_count"] > 0
        and row["ordered_variants_private_w_cross_separation_false"]
        == row["ordered_variant_count"]
    ]


def lean_ordered_row_private_w_cross_separation_name(row_id: str) -> str:
    return (
        f"erasedPinOrderedRow_{lean_ident_suffix(row_id)}_seed_"
        "private_w_crossSeparation_false"
    )


def lean_ordered_row_cross_separation_theorems(payload: dict[str, Any]) -> str:
    sections: list[str] = []
    for row in ordered_rows_all_private_w_cross_separation_false(payload):
        row_id = str(row["id"])
        candidate_name = f"{lean_ordered_row_seed_name(row_id)}_candidates"
        theorem_name = lean_ordered_row_private_w_cross_separation_name(row_id)
        sections.append(
            f"""/-- Every ordered seed for row `{row_id}` fails the cross-separation
check against the exact `.w` cap mask. -/
theorem {theorem_name}
    {{seed : OneSidedSeed}}
    (hseed : seed ∈ {candidate_name}) :
    crossSeparationOKForMasks seed.privateCenter seed.privateMask
      .w secondOppExactCapMask = false := by
  have hall : {candidate_name}.all
      (fun seed : OneSidedSeed =>
        decide (crossSeparationOKForMasks seed.privateCenter seed.privateMask
          .w secondOppExactCapMask = false)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)"""
        )
    return "\n\n".join(sections)


def write_lean(path: Path, base: Any, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    seed_by_key = ordered_seed_map(payload)
    ordered_seeds = sort_seeds(base, set(seed_by_key.values()))
    seed_lines = ",\n".join(f"  {lean_seed(seed)}" for seed in ordered_seeds)
    row_seed_defs = lean_ordered_row_seed_defs(base, payload)
    row_cross_separation_theorems = lean_ordered_row_cross_separation_theorems(payload)
    seed_invalid_theorems = lean_ordered_seed_invalid_theorems(payload)
    summary = payload["summary"]
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedPinFixedSeedDFS

/-!
# Generated ordered erased-pin producer facts

This module is generated by `scripts/erased-pin-ordered-producer.py`.
It records the block-permutation closure of the finite erased-pin row seeds:
private labels `.Pw/.Pu`, opposite-adjacent labels `.Q1/.Q2`, and surplus
labels `.s1/.s2/.s3` are enumerated in every block-preserving order.  The
resulting ordered seeds are checked against the existing fixed-seed DFS bank.
-/

namespace Problem97
namespace SurplusCOMPGBank

/-- The deduplicated ordered erased-pin seeds generated from all finite rows. -/
def erasedPinOrderedSeeds : List OneSidedSeed :=
[
{seed_lines}
]

/-- The ordered erased-pin bank has the generated number of deduplicated seeds. -/
theorem erasedPinOrderedSeeds_length :
    erasedPinOrderedSeeds.length = {len(ordered_seeds)} := by
  native_decide

/-- The ordered erased-pin bank is exactly the fixed erased-pin DFS bank. -/
theorem erasedPinOrderedSeeds_eq_fixed :
    erasedPinOrderedSeeds = erasedPinFixedSeeds := by
  native_decide

/-- Every ordered erased-pin seed is in the generated fixed-seed bank. -/
theorem erasedPinOrderedSeeds_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ erasedPinOrderedSeeds) : seed ∈ erasedPinFixedSeeds := by
  simpa [erasedPinOrderedSeeds_eq_fixed] using hseed

/-- The ordered producer expanded all source finite masks through all
block-preserving relabelings. -/
theorem erasedPinOrderedVariantCount_eq :
    {summary["source_finite_mask_count"]} * {summary["permutation_count"]} =
      {summary["ordered_variant_count"]} := by
  native_decide

/-! ## Ordered row producer seed lists -/

{row_seed_defs}

/-! ## Ordered row cross-separation consequences -/

{row_cross_separation_theorems}

/-! ## Ordered row no-survivor consequences -/

{seed_invalid_theorems}

end SurplusCOMPGBank
end Problem97
"""
    path.write_text(text)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--producer-json",
        type=Path,
        default=Path("certificates/surplus/erased_pin_producer_census.json"),
        help="Base erased-pin producer census JSON.",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=Path("certificates/surplus/erased_pin_ordered_producer_census.json"),
        help="Output ordered producer census JSON.",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=Path(
            "certificates/surplus/reports/erased_pin_ordered_producer_census.md"
        ),
        help="Output ordered producer census Markdown report.",
    )
    parser.add_argument(
        "--include-variants",
        action="store_true",
        help="Include all row/mask/permutation variant records in the JSON.",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=Path("lean/Erdos9796Proof/P97/ErasedPinOrderedProducer.lean"),
        help="Output generated Lean ordered producer module.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    base = load_base_module()
    payload = build_ordered_census(base, args.producer_json, args.include_variants)
    write_json(args.json_out, payload)
    write_markdown(args.markdown_out, payload)
    write_lean(args.lean_out, base, payload)
    print(f"wrote {args.json_out}")
    print(f"wrote {args.markdown_out}")
    print(f"wrote {args.lean_out}")


if __name__ == "__main__":
    main()
