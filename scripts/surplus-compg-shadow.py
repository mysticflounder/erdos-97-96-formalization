#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Audit the pinned surplus-shadow artifact against the rvol COMP-G bank.

The question this script answers is deliberately narrow:

  Does the already enumerated pinned surplus incidence shadow line up exactly
  with the already banked COMP-G algebraic verdicts?

It does not prove that the current Lean residual has been mapped into this
shadow.  It checks the target bank we would bridge to.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from collections import Counter
from pathlib import Path
from typing import Any


SCHEMA = "pinned_surplus_comp_g_bank.v2"
FAMILIES = ("s1", "s2", "s3")
EXPECTED_COUNTS = {"s1": 41, "s2": 71, "s3": 23}
EXPECTED_HULL_ORDER = ("u", "Q1", "Q2", "v", "s1", "s2", "s3", "w", "Pw", "Pu")
LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
LABEL_INDEX = {label: idx for idx, label in enumerate(LABELS)}
PINNED_CENTER = "v"
PINNED_COMMON = frozenset(("Pu", "Pw", "u"))
FINAL_VERDICTS = {"C_EMPTY", "NO_VALID_REAL"}
FORCED_PAIRS = {"u=v", "u=s1"}


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def default_rvol_root() -> Path:
    return repo_root().parent / "p97-rvol"


def load_json(path: Path) -> Any:
    with path.open() as f:
        return json.load(f)


def load_jsonl(path: Path) -> list[dict[str, Any]]:
    with path.open() as f:
        return [json.loads(line) for line in f if line.strip()]


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def repo_relative(path: Path) -> str:
    return os.path.relpath(path.resolve(), repo_root().resolve())


def source_entry(path: Path) -> dict[str, str]:
    return {"path": repo_relative(path), "sha256": sha256_file(path)}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit(f"surplus COMP-G shadow check failed: {message}")


def canonical_model(model: dict[str, list[str]]) -> tuple[tuple[str, tuple[str, ...]], ...]:
    return tuple((center, tuple(sorted(model[center]))) for center in sorted(LABELS))


def expected_pid(family: str, index: int) -> str:
    return f"{family}_{index:03d}"


def pinned_class_for(family: str) -> frozenset[str]:
    return PINNED_COMMON | frozenset((family,))


def counter_dict(counter: Counter[Any]) -> dict[str, int]:
    return {str(key): counter[key] for key in sorted(counter, key=lambda x: str(x))}


def validate_models(fragment: dict[str, Any]) -> list[dict[str, Any]]:
    require(tuple(fragment.get("hull_order", ())) == EXPECTED_HULL_ORDER, "unexpected hull order")
    require(fragment.get("counts") == EXPECTED_COUNTS, "unexpected family counts")
    require(tuple(fragment.get("models", {}).keys()) == FAMILIES, "unexpected model families")

    rows: list[dict[str, Any]] = []
    seen_canonical: set[tuple[tuple[str, tuple[str, ...]], ...]] = set()
    for family in FAMILIES:
        models = fragment["models"][family]
        require(len(models) == EXPECTED_COUNTS[family], f"wrong count for {family}")
        for index, model in enumerate(models):
            pid = expected_pid(family, index)
            require(set(model.keys()) == set(LABELS), f"{pid}: unexpected centers")
            for center, members in model.items():
                require(len(members) == 4, f"{pid}: class {center} is not size 4")
                require(len(set(members)) == 4, f"{pid}: class {center} has duplicate members")
                require(center not in members, f"{pid}: class {center} contains its center")
                require(set(members) <= set(LABELS), f"{pid}: class {center} has unknown labels")

            pinned = frozenset(model[PINNED_CENTER])
            require(
                pinned == pinned_class_for(family),
                f"{pid}: K_{PINNED_CENTER} is {sorted(pinned)}, "
                f"expected {sorted(pinned_class_for(family))}",
            )
            canon = canonical_model(model)
            require(canon not in seen_canonical, f"{pid}: duplicate exact model")
            seen_canonical.add(canon)
            rows.append({"pid": pid, "sstar": family, "model": model, "canonical": canon})

    require(len(rows) == sum(EXPECTED_COUNTS.values()), "wrong total model count")
    return rows


def index_rows(rows: list[dict[str, Any]], key: str, source: str) -> dict[str, dict[str, Any]]:
    out: dict[str, dict[str, Any]] = {}
    for row in rows:
        value = row[key]
        require(value not in out, f"duplicate {key}={value} in {source}")
        out[value] = row
    return out


def ordered_classes(model: dict[str, list[str]]) -> dict[str, list[str]]:
    return {center: list(model[center]) for center in LABELS}


def class_members_canonical(members: list[str]) -> list[str]:
    member_set = set(members)
    require(len(member_set) == len(members), f"duplicate members in {members}")
    require(member_set <= set(LABELS), f"unknown members in {members}")
    return [label for label in LABELS if label in member_set]


def class_bitset(members: list[str]) -> int:
    return sum(1 << LABEL_INDEX[label] for label in class_members_canonical(members))


def class_bitsets(model: dict[str, list[str]]) -> dict[str, int]:
    return {center: class_bitset(model[center]) for center in LABELS}


def class_members_canonical_by_center(model: dict[str, list[str]]) -> dict[str, list[str]]:
    return {center: class_members_canonical(model[center]) for center in LABELS}


def shadow_key_for_bitsets(bitsets: dict[str, int]) -> str:
    return "|".join(f"{center}:{bitsets[center]}" for center in LABELS)


def validate_shadow_signatures(rows: list[dict[str, Any]]) -> dict[str, Any]:
    seen: dict[str, str] = {}
    for row in rows:
        pid = row["pid"]
        classes = row["classes"]
        require(set(classes) == set(LABELS), f"{pid}: class centers changed")
        expected_members = {
            center: class_members_canonical(classes[center]) for center in LABELS
        }
        expected_bitsets = {center: class_bitset(classes[center]) for center in LABELS}
        expected_key = shadow_key_for_bitsets(expected_bitsets)

        require(
            row.get("class_members_canonical") == expected_members,
            f"{pid}: canonical class members do not match classes",
        )
        require(
            row.get("class_bitsets") == expected_bitsets,
            f"{pid}: class bitsets do not match classes",
        )
        require(row.get("shadow_key") == expected_key, f"{pid}: shadow key mismatch")
        if expected_key in seen:
            require(False, f"{pid}: duplicate shadow key with {seen[expected_key]}")
        seen[expected_key] = pid

    return {
        "unique_count": len(seen),
        "keys_by_pid": {row["pid"]: row["shadow_key"] for row in rows},
    }


def validate_comp_bank(
    expected: list[dict[str, Any]],
    comp_rows: list[dict[str, Any]],
    pair_rows: list[dict[str, Any]],
    singular_rows: list[dict[str, Any]],
    summary: dict[str, Any],
) -> dict[str, Any]:
    expected_pids = [row["pid"] for row in expected]
    expected_pid_set = set(expected_pids)

    comp = index_rows(comp_rows, "pid", "comp_g_patterns")
    pair = index_rows(pair_rows, "pid", "comp_g_pairscan")
    singular = index_rows(singular_rows, "pid", "singular_verify_surplus_results")

    require(set(comp) == expected_pid_set, "COMP-G pattern pids do not match models")
    require(set(pair) == expected_pid_set, "pairscan pids do not match models")
    require(set(singular) == expected_pid_set, "Singular pids do not match models")

    for row in expected:
        pid = row["pid"]
        family = row["sstar"]
        c = comp[pid]
        p = pair[pid]
        s = singular[pid]

        require(c["sstar"] == family, f"{pid}: COMP-G sstar mismatch")
        require(p["sstar"] == family, f"{pid}: pairscan sstar mismatch")
        require(c["final_verdict"] in FINAL_VERDICTS, f"{pid}: unexpected final verdict")

        if c["final_verdict"] == "C_EMPTY":
            require(c.get("forced_pair") is None, f"{pid}: C_EMPTY row should not use final pair")
        else:
            require(c.get("sat45_verdict") == "NO_VALID_REAL", f"{pid}: missing sat45 kill")
            require(c.get("forced_pair") in FORCED_PAIRS, f"{pid}: unexpected forced pair")
            require(
                c.get("forced_pair") == p.get("forced_pair"),
                f"{pid}: final forced pair differs from pairscan",
            )

        require(p.get("forced_pair") in FORCED_PAIRS, f"{pid}: pairscan missing forced pair")
        require(s.get("flip") is False, f"{pid}: Singular flip reported")
        require(
            s.get("msolve_verdict") == c["final_verdict"],
            f"{pid}: Singular msolve verdict does not match COMP-G final verdict",
        )
        require(
            s.get("singular_verdict") == c["final_verdict"],
            f"{pid}: Singular verdict does not match COMP-G final verdict",
        )

    final_counts = Counter(row["final_verdict"] for row in comp_rows)
    final_forced = Counter(
        row["forced_pair"] for row in comp_rows if row["final_verdict"] == "NO_VALID_REAL"
    )
    pairscan_forced = Counter(row["forced_pair"] for row in pair_rows)
    singular_flips = Counter(row["flip"] for row in singular_rows)

    require(final_counts == Counter({"NO_VALID_REAL": 133, "C_EMPTY": 2}), "bad final split")
    require(final_forced == Counter({"u=v": 127, "u=s1": 6}), "bad final forced-pair split")
    require(pairscan_forced == Counter({"u=v": 129, "u=s1": 6}), "bad pairscan split")
    require(singular_flips == Counter({False: 135}), "bad Singular flip split")

    require(summary.get("coverage", {}).get("total") == 135, "summary total is not 135")
    require(summary.get("coverage", {}).get("C_EMPTY") == 2, "summary C_EMPTY count is not 2")
    require(
        summary.get("coverage", {}).get("NO_VALID_REAL") == 133,
        "summary NO_VALID_REAL count is not 133",
    )
    require(
        summary.get("c_empty_pids") == ["s1_000", "s1_001"],
        "summary C_EMPTY pids changed",
    )
    require(len(summary.get("u_eq_s1_pids", [])) == 6, "summary u=s1 pid count changed")

    return {
        "model_counts": Counter(row["sstar"] for row in expected),
        "final_counts": final_counts,
        "final_forced": final_forced,
        "pairscan_forced": pairscan_forced,
        "singular_flips": singular_flips,
        "c_empty_pids": [row["pid"] for row in comp_rows if row["final_verdict"] == "C_EMPTY"],
        "u_eq_s1_pids": [row["pid"] for row in comp_rows if row.get("forced_pair") == "u=s1"],
    }


def build_bank(
    expected: list[dict[str, Any]],
    comp_rows: list[dict[str, Any]],
    pair_rows: list[dict[str, Any]],
    singular_rows: list[dict[str, Any]],
    stats: dict[str, Any],
    source_paths: dict[str, Path],
) -> dict[str, Any]:
    comp = index_rows(comp_rows, "pid", "comp_g_patterns")
    pair = index_rows(pair_rows, "pid", "comp_g_pairscan")
    singular = index_rows(singular_rows, "pid", "singular_verify_surplus_results")

    rows: list[dict[str, Any]] = []
    for row in expected:
        pid = row["pid"]
        c = comp[pid]
        p = pair[pid]
        s = singular[pid]
        bitsets = class_bitsets(row["model"])
        rows.append(
            {
                "pid": pid,
                "sstar": row["sstar"],
                "index": int(pid.rsplit("_", 1)[1]),
                "classes": ordered_classes(row["model"]),
                "class_members_canonical": class_members_canonical_by_center(row["model"]),
                "class_bitsets": bitsets,
                "shadow_key": shadow_key_for_bitsets(bitsets),
                "pinned_center": PINNED_CENTER,
                "pinned_class": list(row["model"][PINNED_CENTER]),
                "pinned_class_sorted": sorted(row["model"][PINNED_CENTER]),
                "comp_g": {
                    "base_verdict": c.get("base_verdict"),
                    "sat45_verdict": c.get("sat45_verdict"),
                    "final_verdict": c.get("final_verdict"),
                    "forced_pair": c.get("forced_pair"),
                    "certificate": c.get("certificate"),
                },
                "pairscan": {
                    "forced_pair": p.get("forced_pair"),
                },
                "singular": {
                    "base_dim": s.get("base_dim"),
                    "msolve_verdict": s.get("msolve_verdict"),
                    "singular_verdict": s.get("singular_verdict"),
                    "flip": s.get("flip"),
                },
            }
        )

    shadow_stats = validate_shadow_signatures(rows)

    return {
        "schema": SCHEMA,
        "source": {name: source_entry(path) for name, path in source_paths.items()},
        "labels": list(LABELS),
        "families": list(FAMILIES),
        "hull_order": list(EXPECTED_HULL_ORDER),
        "pinned": {
            "center": PINNED_CENTER,
            "common": sorted(PINNED_COMMON),
            "family_symbol": "sstar",
            "expected_set": ["Pu", "Pw", "u", "sstar"],
        },
        "shadow_signature": {
            "format": "center-order LABELS; each class encoded as a bitset over LABELS",
            "label_order": list(LABELS),
            "center_order": list(LABELS),
            "key_format": "center:bitset entries joined by | in center_order",
            "unique_count": shadow_stats["unique_count"],
        },
        "counts": dict(EXPECTED_COUNTS),
        "coverage": counter_dict(stats["final_counts"] | Counter({"total": len(rows)})),
        "final_forced_pairs": counter_dict(stats["final_forced"]),
        "pairscan_forced_pairs": counter_dict(stats["pairscan_forced"]),
        "singular_flips": counter_dict(stats["singular_flips"]),
        "c_empty_pids": list(stats["c_empty_pids"]),
        "u_eq_s1_pids": list(stats["u_eq_s1_pids"]),
        "row_ids": [row["pid"] for row in rows],
        "rows": rows,
    }


def write_bank(bank: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(bank, indent=2, sort_keys=False) + "\n")


def compare_bank(actual: dict[str, Any], expected: dict[str, Any], path: Path) -> None:
    if actual == expected:
        return

    for key in ("schema", "source", "labels", "families", "hull_order", "pinned", "counts"):
        if actual.get(key) != expected.get(key):
            raise SystemExit(
                f"surplus COMP-G shadow check failed: {path} has mismatched {key}"
            )

    actual_rows = {row.get("pid"): row for row in actual.get("rows", [])}
    expected_rows = {row.get("pid"): row for row in expected.get("rows", [])}
    if set(actual_rows) != set(expected_rows):
        raise SystemExit(
            f"surplus COMP-G shadow check failed: {path} row ids differ from source"
        )
    for pid in expected["row_ids"]:
        if actual_rows[pid] != expected_rows[pid]:
            raise SystemExit(
                f"surplus COMP-G shadow check failed: {path} first differing row is {pid}"
            )

    raise SystemExit(f"surplus COMP-G shadow check failed: {path} differs from source")


def lean_label(label: str) -> str:
    return f".{label}"


def lean_pair_list(pairs: list[tuple[str, str]]) -> str:
    return "[" + ", ".join(f"({lean_label(a)}, {lean_label(b)})" for a, b in pairs) + "]"


def lean_label_list(labels: list[str]) -> str:
    return "[" + ", ".join(lean_label(label) for label in labels) + "]"


def lean_verdict(verdict: str) -> str:
    if verdict == "C_EMPTY":
        return ".cEmpty"
    if verdict == "NO_VALID_REAL":
        return ".noValidReal"
    raise ValueError(f"unexpected verdict {verdict}")


def forced_pair_code(pair: str | None) -> int:
    if pair is None:
        return 0
    if pair == "u=v":
        return 1
    if pair == "u=s1":
        return 2
    raise ValueError(f"unexpected forced pair {pair}")


def lean_row(row: dict[str, Any]) -> str:
    masks = [row["class_bitsets"][center] for center in LABELS]
    return (
        '  { pid := "' + row["pid"] + '"\n'
        f"    sstar := {lean_label(row['sstar'])}\n"
        f"    masks := {masks}\n"
        f"    finalVerdict := {lean_verdict(row['comp_g']['final_verdict'])}\n"
        f"    forcedPairCode := {forced_pair_code(row['comp_g']['forced_pair'])} }}"
    )


def lean_fragment_entry(row: dict[str, Any]) -> str:
    masks = [row["class_bitsets"][center] for center in LABELS]
    return f"  ({lean_label(row['sstar'])}, {masks})"


def lean_nat_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def lean_plan_suffix(order: list[str], start: int) -> str:
    return (
        "["
        + ", ".join(
            f"({lean_label(center)}, candidateMasks sstar {lean_label(center)})"
            for center in order[start:]
        )
        + "]"
    )


def lean_shadow_path_theorem(
    order: list[str], assigned_prefixes: list[list[str]]
) -> str:
    lines = [
        "theorem mem_fragmentSearchAux_shadow_step_of_isValidPinnedFragment",
        "    {sstar : Label} {shadow : Shadow} {center : Label}",
        "    {assigned : List Label} {rest : List (Label × List Nat)}",
        "    (hvalid : isValidPinnedFragment sstar shadow = true)",
        "    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes)",
        "    (hnext : center :: assigned ∈ fragmentSearchAssignedPrefixes)",
        "    (hne : ∀ other, other ∈ assigned -> center ≠ other)",
        "    (htail : shadow.masks ∈ fragmentSearchAux sstar (center :: assigned)",
        "      (shadowMasksForAssigned shadow (center :: assigned))",
        "      (shadowPairCountsForAssigned shadow (center :: assigned)) rest) :",
        "    shadow.masks ∈ fragmentSearchAux sstar assigned",
        "      (shadowMasksForAssigned shadow assigned)",
        "      (shadowPairCountsForAssigned shadow assigned)",
        "      ((center, candidateMasks sstar center) :: rest) := by",
        "  apply mem_fragmentSearchAux_cons",
        "  · exact mem_candidateMasks_of_isValidPinnedFragment (center := center) hvalid",
        "  · exact assignedSeparationOK_of_isValidPinnedFragment hvalid",
        "      (fun other hmem => centerMaskOf_shadowMasksForAssigned_of_mem hprefix hmem)",
        "      hne",
        "  · simpa [shadowPairCountsForAssigned] using",
        "      pairCountsOK_shadowPairCountsForAssigned_of_isValidPinnedFragment hvalid hnext",
        "  · simpa [shadowMasksForAssigned, shadowPairCountsForAssigned] using htail",
        "",
        "theorem shadow_mem_fragmentSearchAux_of_isValidPinnedFragment",
        "    {sstar : Label} {shadow : Shadow}",
        "    (hvalid : isValidPinnedFragment sstar shadow = true) :",
        "    shadow.masks ∈ fragmentSearchAux sstar [] emptyShadowMasks emptyPairCounts",
        "      (fragmentSearchPlan sstar) := by",
        "  have h10 : shadow.masks ∈ fragmentSearchAux sstar fullFragmentSearchAssigned",
        "      (shadowMasksForAssigned shadow fullFragmentSearchAssigned)",
        "      (shadowPairCountsForAssigned shadow fullFragmentSearchAssigned) [] := by",
        "    exact mem_fragmentSearchAux_nil_of_isValidPinnedFragment hvalid",
        "      (shadowMasksForFullFragmentSearchAssigned_eq_of_hasTenMasks",
        "        (hasTenMasks_of_isValidPinnedFragment hvalid))",
    ]
    for index in range(len(order) - 1, -1, -1):
        center = order[index]
        assigned = lean_label_list(assigned_prefixes[index])
        rest = lean_plan_suffix(order, index + 1)
        lines.extend(
            [
                f"  have h{index} := mem_fragmentSearchAux_shadow_step_of_isValidPinnedFragment",
                f"    (sstar := sstar) (shadow := shadow) (center := {lean_label(center)})",
                f"    (assigned := {assigned})",
                f"    (rest := {rest}) hvalid",
                "    (by simp [fragmentSearchAssignedPrefixes])",
                "    (by simp [fragmentSearchAssignedPrefixes])",
                "    (by intro other hmem; cases other <;> simp at hmem ⊢)"
                f" h{index + 1}",
            ]
        )
    lines.extend(
        [
            "  simpa [fragmentSearchPlan, fragmentSearchOrder, shadowMasksForAssigned,",
            "    shadowPairCountsForAssigned, emptyShadowMasks] using h0",
        ]
    )
    return "\n".join(lines)


def lean_depth2_structural_theorem(sstar: str) -> str:
    theorem_name = f"mem_depth2Subtree_of_mem_fragmentSearchAux_top_{sstar}"
    s = lean_label(sstar)
    branches: list[str] = []
    for wmask in candidate_masks_for(sstar, "w"):
        branches.extend(
            [
                f"  · exact ⟨{wmask}, by simp [candidateMasks],",
                "      by simpa [depth2SubtreeResult, depth2StateMasks, depth2StateCounts]",
                f"        using h{wmask}.2⟩",
            ]
        )
    branch_names = " | ".join(f"h{wmask}" for wmask in candidate_masks_for(sstar, "w"))
    return "\n".join(
        [
            f"theorem {theorem_name}",
            "    {masks : List Nat}",
            f"    (hmem : masks ∈ fragmentSearchAux {s} [] emptyShadowMasks emptyPairCounts",
            f"      (fragmentSearchPlan {s})) :",
            f"    ∃ wmask, wmask ∈ candidateMasks {s} .w ∧",
            f"      masks ∈ depth2SubtreeResult {s} wmask := by",
            f"  change masks ∈ fragmentSearchAux {s} [] emptyShadowMasks emptyPairCounts",
            f"    ((.v, candidateMasks {s} .v) :: (.w, candidateMasks {s} .w) :: depth2RestPlan {s}) at hmem",
            "  unfold fragmentSearchAux at hmem",
            "  simp [candidateMasks] at hmem",
            "  unfold fragmentSearchAux at hmem",
            "  simp at hmem",
            "  rcases hmem with ⟨_hv, hmem⟩",
            f"  rcases hmem with {branch_names}",
            *branches,
        ]
    )


def lean_dfs_completeness_shard_text(sstar: str) -> str:
    family_name = sstar.capitalize()
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank

/-!
# Generated pinned surplus COMP-G DFS certificate shard ({sstar})

This module is generated by `scripts/surplus-compg-shadow.py`.
-/

namespace Problem97
namespace SurplusCOMPGBank

theorem depth2SubtreeAllAccepted_{sstar} :
    depth2Wmasks.all (fun wmask => depth2SubtreeAllAccepted {lean_label(sstar)} wmask) = true := by
  native_decide

end SurplusCOMPGBank
end Problem97
"""


def lean_dfs_completeness_coordinator_text() -> str:
    structural = "\n\n".join(lean_depth2_structural_theorem(sstar) for sstar in FAMILIES)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusCOMPGBankDFS.Depth2S1
import Erdos9796Proof.P97.SurplusCOMPGBankDFS.Depth2S2
import Erdos9796Proof.P97.SurplusCOMPGBankDFS.Depth2S3

/-!
# Generated pinned surplus COMP-G DFS completeness bridge

This module is generated by `scripts/surplus-compg-shadow.py`.
-/

namespace Problem97
namespace SurplusCOMPGBank

private theorem list_all_eq_true_of_mem
    {{α : Type}} {{p : α -> Bool}} {{a : α}} :
    {{items : List α}} -> items.all p = true -> a ∈ items -> p a = true
  | [], _h, ha => by cases ha
  | _ :: rest, h, ha => by
      simp only [List.all_cons, Bool.and_eq_true] at h
      cases ha with
      | head => simpa using h.1
      | tail _ haTail => exact list_all_eq_true_of_mem h.2 haTail

{structural}

theorem mem_depth2Subtree_of_mem_fragmentSearchAux_top
    {{sstar : Label}} {{masks : List Nat}}
    (hs : isSurplusStar sstar = true)
    (hmem : masks ∈ fragmentSearchAux sstar [] emptyShadowMasks emptyPairCounts
      (fragmentSearchPlan sstar)) :
    ∃ wmask, wmask ∈ candidateMasks sstar .w ∧
      masks ∈ depth2SubtreeResult sstar wmask := by
  cases sstar <;> simp [isSurplusStar] at hs
  · exact mem_depth2Subtree_of_mem_fragmentSearchAux_top_s1 hmem
  · exact mem_depth2Subtree_of_mem_fragmentSearchAux_top_s2 hmem
  · exact mem_depth2Subtree_of_mem_fragmentSearchAux_top_s3 hmem

theorem depth2SubtreeAllAccepted_of_isSurplusStar_mem_candidateW
    {{sstar : Label}} {{wmask : Nat}}
    (hs : isSurplusStar sstar = true)
    (hmem : wmask ∈ candidateMasks sstar .w) :
    depth2SubtreeAllAccepted sstar wmask = true := by
  cases sstar <;> simp [isSurplusStar] at hs
  · exact list_all_eq_true_of_mem
      (items := depth2Wmasks)
      (p := fun wmask => depth2SubtreeAllAccepted .s1 wmask)
      (a := wmask) depth2SubtreeAllAccepted_s1 (by
        simpa [candidateMasks, depth2Wmasks] using hmem)
  · exact list_all_eq_true_of_mem
      (items := depth2Wmasks)
      (p := fun wmask => depth2SubtreeAllAccepted .s2 wmask)
      (a := wmask) depth2SubtreeAllAccepted_s2 (by
        simpa [candidateMasks, depth2Wmasks] using hmem)
  · exact list_all_eq_true_of_mem
      (items := depth2Wmasks)
      (p := fun wmask => depth2SubtreeAllAccepted .s3 wmask)
      (a := wmask) depth2SubtreeAllAccepted_s3 (by
        simpa [candidateMasks, depth2Wmasks] using hmem)

theorem fragmentShadowAcceptedBySearch_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}}
    (hvalid : isValidPinnedFragment sstar shadow = true) :
    fragmentShadowAcceptedBySearch shadow = true := by
  have hs : isSurplusStar sstar = true :=
    isSurplusStar_of_isValidPinnedFragment hvalid
  have hpath : shadow.masks ∈ fragmentSearchAux sstar [] emptyShadowMasks emptyPairCounts
      (fragmentSearchPlan sstar) :=
    shadow_mem_fragmentSearchAux_of_isValidPinnedFragment hvalid
  rcases mem_depth2Subtree_of_mem_fragmentSearchAux_top hs hpath with
    ⟨wmask, hwmask, hsubtree⟩
  have hall : depth2SubtreeAllAccepted sstar wmask = true :=
    depth2SubtreeAllAccepted_of_isSurplusStar_mem_candidateW hs hwmask
  have hcontains : containsKey shadow.masks fragmentSearchShadowKeys = true := by
    exact list_all_eq_true_of_mem
      (items := depth2SubtreeResult sstar wmask)
      (p := fun masks => containsKey masks fragmentSearchShadowKeys)
      (a := shadow.masks) hall hsubtree
  simp [fragmentShadowAcceptedBySearch,
    hasTenMasks_of_isValidPinnedFragment hvalid, hcontains]

end SurplusCOMPGBank
end Problem97
"""


def py_mask_has(mask: int, label: str) -> bool:
    return bool(mask & (1 << LABEL_INDEX[label]))


def py_mask_card(mask: int) -> int:
    return sum(1 for label in LABELS if py_mask_has(mask, label))


def py_mask_inter_card(left: int, right: int) -> int:
    return sum(1 for label in LABELS if py_mask_has(left, label) and py_mask_has(right, label))


def py_hull_pos(label: str) -> int:
    return EXPECTED_HULL_ORDER.index(label)


def py_between(a: str, b: str, x: str) -> bool:
    da = (py_hull_pos(x) + len(LABELS) - py_hull_pos(a)) % len(LABELS)
    db = (py_hull_pos(b) + len(LABELS) - py_hull_pos(a)) % len(LABELS)
    return 0 < da < db


def py_separated(a: str, b: str, x: str, y: str) -> bool:
    return py_between(a, b, x) != py_between(a, b, y)


def py_previous_sstar_centers(sstar: str) -> tuple[str, ...]:
    if sstar == "s1":
        return ()
    if sstar == "s2":
        return ("s1",)
    if sstar == "s3":
        return ("s1", "s2")
    return ()


def py_is_moser_label(label: str) -> bool:
    return label in {"u", "v", "w"}


def py_local_trigger_ok(sstar: str, center: str, mask: int) -> bool:
    u_pw_pu = class_bitset(["u", "Pw", "Pu"])
    if center in {"u", "Q1", "Q2"} or center in py_previous_sstar_centers(sstar):
        return not (py_mask_has(mask, sstar) and 1 <= py_mask_inter_card(mask, u_pw_pu))
    if center == sstar:
        return py_mask_inter_card(mask, u_pw_pu) <= 1
    return True


def py_candidate_mask_ok(sstar: str, center: str, mask: int) -> bool:
    cv_no_u = class_bitset(["w", "Pw", "Pu"])
    cw_no_u = class_bitset(["v", "Q1", "Q2"])
    cv_no_w = class_bitset(["u", "Pw", "Pu"])
    cu_no_w = class_bitset(["v", "s1", "s2", "s3"])
    if not (mask < (1 << len(LABELS))):
        return False
    if py_mask_card(mask) != 4 or py_mask_has(mask, center):
        return False
    if center == "v" and mask != class_bitset(["Pu", "Pw", "u", sstar]):
        return False
    if center == "w":
        if not (
            py_mask_has(mask, "Q1")
            and py_mask_has(mask, "Q2")
            and py_mask_inter_card(mask, cu_no_w) == 1
            and py_mask_inter_card(mask, cv_no_w) == 1
        ):
            return False
    if center == "u":
        if py_mask_inter_card(mask, cv_no_u) > 1:
            return False
        if py_mask_inter_card(mask, cw_no_u) > 1:
            return False
    if center == "w":
        if py_mask_inter_card(mask, cv_no_w) > 1:
            return False
        if py_mask_inter_card(mask, cu_no_w) > 1:
            return False
    if (
        not py_is_moser_label(center)
        and py_mask_has(mask, "u")
        and py_mask_has(mask, "v")
        and py_mask_has(mask, "w")
    ):
        return False
    return py_local_trigger_ok(sstar, center, mask)


def candidate_masks_for(sstar: str, center: str) -> list[int]:
    return [
        mask
        for mask in range(1 << len(LABELS))
        if py_candidate_mask_ok(sstar, center, mask)
    ]


PY_LABEL_PAIRS = tuple(
    (left, right)
    for index, left in enumerate(LABELS)
    for right in LABELS[index + 1 :]
)
FRAGMENT_SEARCH_ORDER = ("v", "w", "u", "Pw", "Pu", "Q1", "Q2", "s1", "s2", "s3")


def py_cross_separation_ok(c: str, cmask: int, cp: str, cpmask: int) -> bool:
    for x, y in PY_LABEL_PAIRS:
        if x in {c, cp} or y in {c, cp}:
            continue
        if (
            py_mask_has(cmask, x)
            and py_mask_has(cmask, y)
            and py_mask_has(cpmask, x)
            and py_mask_has(cpmask, y)
            and not py_separated(c, cp, x, y)
        ):
            return False
    return True


def py_point_pair_class_count(masks: list[int], x: str, y: str) -> int:
    count = 0
    for center, mask in zip(LABELS, masks, strict=True):
        if center in {x, y}:
            continue
        if py_mask_has(mask, x) and py_mask_has(mask, y):
            count += 1
    return count


def py_separation_ok(masks: list[int]) -> bool:
    for c, cp in PY_LABEL_PAIRS:
        if not py_cross_separation_ok(c, masks[LABEL_INDEX[c]], cp, masks[LABEL_INDEX[cp]]):
            return False
    return True


def py_no_three_ok(masks: list[int]) -> bool:
    return all(py_point_pair_class_count(masks, x, y) <= 2 for x, y in PY_LABEL_PAIRS)


def py_valid_pinned_fragment(sstar: str, masks: list[int]) -> bool:
    if sstar not in FAMILIES:
        return False
    if len(masks) != len(LABELS):
        return False
    for center, mask in zip(LABELS, masks, strict=True):
        if not py_candidate_mask_ok(sstar, center, mask):
            return False
    if not py_separation_ok(masks):
        return False
    return py_no_three_ok(masks)


def compute_fragment_search_entries() -> list[tuple[str, list[int]]]:
    entries: list[tuple[str, list[int]]] = []
    for sstar in FAMILIES:
        candidates = {center: candidate_masks_for(sstar, center) for center in LABELS}
        compatible: dict[tuple[str, str], set[tuple[int, int]]] = {}
        for center in LABELS:
            for other in LABELS:
                if center == other:
                    continue
                compatible[(center, other)] = {
                    (mask, other_mask)
                    for mask in candidates[center]
                    for other_mask in candidates[other]
                    if py_cross_separation_ok(center, mask, other, other_mask)
                }

        masks = [0] * len(LABELS)
        assigned: list[str] = []
        pair_counts = {pair: 0 for pair in PY_LABEL_PAIRS}

        def add_pair_counts(center: str, mask: int, delta: int) -> list[tuple[str, str]]:
            changed: list[tuple[str, str]] = []
            for pair in PY_LABEL_PAIRS:
                x, y = pair
                if center in {x, y}:
                    continue
                if py_mask_has(mask, x) and py_mask_has(mask, y):
                    pair_counts[pair] += delta
                    changed.append(pair)
            return changed

        def dfs(index: int) -> None:
            if index == len(FRAGMENT_SEARCH_ORDER):
                if py_valid_pinned_fragment(sstar, masks):
                    entries.append((sstar, list(masks)))
                return
            center = FRAGMENT_SEARCH_ORDER[index]
            for mask in candidates[center]:
                if any(
                    (mask, masks[LABEL_INDEX[other]]) not in compatible[(center, other)]
                    for other in assigned
                ):
                    continue
                changed = add_pair_counts(center, mask, 1)
                if all(pair_counts[pair] <= 2 for pair in changed):
                    masks[LABEL_INDEX[center]] = mask
                    assigned.append(center)
                    dfs(index + 1)
                    assigned.pop()
                    masks[LABEL_INDEX[center]] = 0
                for pair in changed:
                    pair_counts[pair] -= 1

        dfs(0)
    return entries


def lean_candidate_masks_match() -> str:
    cases: list[str] = []
    for sstar in FAMILIES:
        for center in LABELS:
            cases.append(
                f"  | {lean_label(sstar)}, {lean_label(center)} => "
                f"{lean_nat_list(candidate_masks_for(sstar, center))}"
            )
    cases.append("  | _, _ => []")
    return "\n".join(cases)


def lean_private_center_support() -> str:
    return r"""section PrivateCenterSupport

open Label
open scoped BigOperators

private theorem label_index_injective : Function.Injective Label.index := by
  intro a b h
  cases a <;> cases b <;> simp [Label.index] at h ⊢

/-- The binary mask encoded by a finite label support. -/
def supportMask (support : Finset Label) : Nat :=
  ∑ label ∈ support, 2 ^ label.index

private theorem supportMask_eq_maskOfLabels_toList (support : Finset Label) :
    supportMask support = maskOfLabels support.toList := by
  rw [supportMask, maskOfLabels_eq_sum]
  simp [Label.bit]
  apply Finset.sum_congr rfl
  intro label _
  rfl

private theorem maskHas_supportMask (support : Finset Label) (label : Label) :
    maskHas (supportMask support) label = decide (label ∈ support) := by
  have hsum :
      (∑ label ∈ support, 2 ^ label.index) =
        ∑ i ∈ support.image Label.index, 2 ^ i := by
    rw [Finset.sum_image label_index_injective.injOn]
  apply Bool.eq_iff_iff.mpr
  simp only [maskHas, decide_eq_true_eq]
  rw [← Nat.mem_bitIndices]
  simp only [supportMask]
  rw [hsum, ← List.mem_toFinset,
    Finset.toFinset_bitIndices_sum_two_pow, Finset.mem_image]
  constructor
  · rintro ⟨a, ha, hindex⟩
    have : a = label := label_index_injective hindex
    simpa [this] using ha
  · intro hp
    exact ⟨label, hp, rfl⟩

private theorem supportMask_lt_maskBound (support : Finset Label) :
    supportMask support < maskBound := by
  have h :
      (∑ i ∈ support.image Label.index, 2 ^ i) < 2 ^ labelCount :=
    Nat.geomSum_lt (by norm_num) (by
      intro i hi
      obtain ⟨label, _, rfl⟩ := Finset.mem_image.mp hi
      cases label <;> decide)
  rw [Finset.sum_image label_index_injective.injOn] at h
  simpa [supportMask, maskBound] using h

private theorem maskCard_supportMask (support : Finset Label) :
    maskCard (supportMask support) = support.card := by
  have hlt : supportMask support < 2 ^ labelCount := by
    simpa [maskBound] using supportMask_lt_maskBound support
  have hset : (labelsOfMaskBits (supportMask support)).toFinset = support := by
    ext label
    rw [List.mem_toFinset, mem_labelsOfMaskBits_iff hlt, maskHas_supportMask]
    simp
  rw [maskCard_eq_length_labelsOfMaskBits hlt]
  calc
    (labelsOfMaskBits (supportMask support)).length =
        (labelsOfMaskBits (supportMask support)).toFinset.card :=
      (List.toFinset_card_of_nodup (labelsOfMaskBits_nodup hlt)).symm
    _ = support.card := by rw [hset]

/-- Masks of four-element supports which omit a center and do not contain all
three Moser labels. -/
def fourSupportMasksAvoidingCenter (center : Label) : Finset Nat :=
  ((((allLabels.toFinset.erase center).powersetCard 4).filter
      fun support => ¬ ({.u, .v, .w} : Finset Label) ⊆ support).image supportMask)

private theorem maskOfLabels_eq_of_same_support
    {xs ys : List Label} (hxs : xs.Nodup) (hys : ys.Nodup)
    (hset : xs.toFinset = ys.toFinset) :
    maskOfLabels xs = maskOfLabels ys := by
  have hp : List.Perm xs ys :=
    (List.perm_ext_iff_of_nodup hxs hys).mpr (by
      intro x
      simpa only [List.mem_toFinset] using (Finset.ext_iff.mp hset x))
  rw [maskOfLabels_eq_sum, maskOfLabels_eq_sum]
  exact (hp.map (fun label => label.bit)).sum_eq

/-- At either private center, the local trigger is vacuous for every surplus
star, so it is independent of both the mask and the chosen surplus star. -/
theorem localTriggerOKAt_privateCenter
    {sstar center : Label} {mask : Nat}
    (hsstar : isSurplusStar sstar = true)
    (hcenter : center = .Pw ∨ center = .Pu) :
    localTriggerOKAt sstar center mask = true := by
  rcases hcenter with rfl | rfl <;>
    cases sstar <;>
    simp [isSurplusStar, localTriggerOKAt, previousSstarCenters] at hsstar ⊢

/-- At either private center, the candidate predicate asks exactly for a
normalized four-element support which omits its center and does not contain
all three Moser labels. -/
theorem candidateMaskOK_privateCenter_iff
    {sstar center : Label} {mask : Nat}
    (hsstar : isSurplusStar sstar = true)
    (hcenter : center = .Pw ∨ center = .Pu) :
    candidateMaskOK sstar center mask = true ↔
      maskNormalized mask = true ∧
      maskCard mask = 4 ∧
      maskHas mask center = false ∧
      ¬ (maskHas mask .u = true ∧ maskHas mask .v = true ∧
        maskHas mask .w = true) := by
  rcases hcenter with rfl | rfl <;>
    cases sstar <;>
    simp [isSurplusStar, candidateMaskOK, localTriggerOKAt,
      previousSstarCenters, isMoserLabel] at hsstar ⊢
  all_goals
    cases hu : maskHas mask .u <;>
      cases hv : maskHas mask .v <;>
      cases hw : maskHas mask .w <;>
      simp_all
  all_goals aesop

private theorem maskProperties_iff_mem_fourSupportMasks
    {center : Label} {mask : Nat} :
    (maskNormalized mask = true ∧
      maskCard mask = 4 ∧
      maskHas mask center = false ∧
      ¬ (maskHas mask .u = true ∧ maskHas mask .v = true ∧
        maskHas mask .w = true)) ↔
      mask ∈ fourSupportMasksAvoidingCenter center := by
  constructor
  · rintro ⟨hnormalized, hcard, hcenterAbsent, htriple⟩
    have hlt : mask < 2 ^ labelCount := by
      have hdec : decide (mask < maskBound) = true := by
        simpa [maskNormalized] using hnormalized
      have hltBound : mask < maskBound := of_decide_eq_true hdec
      simpa [maskBound] using hltBound
    let support := (labelsOfMaskBits mask).toFinset
    have hsupportCard : support.card = 4 := by
      calc
        support.card = (labelsOfMaskBits mask).length :=
          List.toFinset_card_of_nodup (labelsOfMaskBits_nodup hlt)
        _ = maskCard mask := (maskCard_eq_length_labelsOfMaskBits hlt).symm
        _ = 4 := hcard
    have hsupportMem :
        support ∈ ((allLabels.toFinset.erase center).powersetCard 4).filter
          (fun labels => ¬ ({.u, .v, .w} : Finset Label) ⊆ labels) := by
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_powersetCard.mpr ⟨?_, hsupportCard⟩, ?_⟩
      · intro label hlabel
        apply Finset.mem_erase.mpr
        refine ⟨?_, ?_⟩
        · intro h
          subst label
          have hset := (mem_labelsOfMaskBits_iff hlt center).mp
            (List.mem_toFinset.mp hlabel)
          simp [hcenterAbsent] at hset
        · cases label <;> simp [allLabels]
      · intro hsubset
        apply htriple
        refine ⟨?_, ?_, ?_⟩
        · exact (mem_labelsOfMaskBits_iff hlt .u).mp
            (List.mem_toFinset.mp (hsubset (by simp)))
        · exact (mem_labelsOfMaskBits_iff hlt .v).mp
            (List.mem_toFinset.mp (hsubset (by simp)))
        · exact (mem_labelsOfMaskBits_iff hlt .w).mp
            (List.mem_toFinset.mp (hsubset (by simp)))
    apply Finset.mem_image.mpr
    refine ⟨support, hsupportMem, ?_⟩
    calc
      supportMask support = maskOfLabels support.toList :=
        supportMask_eq_maskOfLabels_toList support
      _ = maskOfLabels (labelsOfMaskBits mask) :=
        maskOfLabels_eq_of_same_support support.nodup_toList
          (labelsOfMaskBits_nodup hlt) (by simp [support])
      _ = mask := maskOfLabels_labelsOfMaskBits hlt
  · intro hmask
    obtain ⟨support, hsupportMem, rfl⟩ := Finset.mem_image.mp hmask
    obtain ⟨hsupportPower, htriple⟩ := Finset.mem_filter.mp hsupportMem
    obtain ⟨hsubset, hsupportCard⟩ := Finset.mem_powersetCard.mp hsupportPower
    have hcenterAbsent : center ∉ support := by
      intro hmem
      exact (Finset.mem_erase.mp (hsubset hmem)).1 rfl
    refine ⟨?_, (maskCard_supportMask support).trans hsupportCard, ?_, ?_⟩
    · exact decide_eq_true_eq.mpr (supportMask_lt_maskBound support)
    · rw [maskHas_supportMask]
      simp [hcenterAbsent]
    · intro hall
      apply htriple
      intro label hlabel
      simp only [Finset.mem_insert, Finset.mem_singleton] at hlabel
      rcases hlabel with rfl | rfl | rfl
      · simpa [maskHas_supportMask] using hall.1
      · simpa [maskHas_supportMask] using hall.2.1
      · simpa [maskHas_supportMask] using hall.2.2

private theorem candidateMaskOK_privateCenter_iff_mem_supportMasks
    {sstar center : Label} {mask : Nat}
    (hsstar : isSurplusStar sstar = true)
    (hcenter : center = .Pw ∨ center = .Pu) :
    candidateMaskOK sstar center mask = true ↔
      mask ∈ fourSupportMasksAvoidingCenter center :=
  (candidateMaskOK_privateCenter_iff hsstar hcenter).trans
    maskProperties_iff_mem_fourSupportMasks

/-- The ascending list of admissible four-support masks for a center. -/
def fourSupportMaskListAvoidingCenter (center : Label) : List Nat :=
  (fourSupportMasksAvoidingCenter center).sort (fun left right => left ≤ right)

private theorem sort_eq_of_eq_toFinset {s : Finset Nat} {xs : List Nat}
    (hs : s = xs.toFinset) (hxs : xs.Pairwise (· < ·)) :
    s.sort (· ≤ ·) = xs := by
  rw [hs]
  exact (List.toFinset_sort (r := (· ≤ ·)) hxs.nodup).mpr
    hxs.sortedLT.sortedLE.pairwise

set_option maxRecDepth 100000 in
private theorem fourSupportMasksAvoidingPw_eq_table :
    fourSupportMasksAvoidingCenter .Pw =
      (candidateMasks .s1 .Pw).toFinset := by
  decide

set_option maxRecDepth 100000 in
private theorem fourSupportMasksAvoidingPu_eq_table :
    fourSupportMasksAvoidingCenter .Pu =
      (candidateMasks .s1 .Pu).toFinset := by
  decide

/-- For every surplus star, the explicit private-center candidate table is the
ascending structural enumeration of four-element supports which omit the
center and do not contain all of the three Moser labels. -/
theorem candidateMasks_privateCenter_eq_fourSupportMasks
    {sstar center : Label}
    (hsstar : isSurplusStar sstar = true)
    (hcenter : center = .Pw ∨ center = .Pu) :
    candidateMasks sstar center = fourSupportMaskListAvoidingCenter center := by
  rcases hcenter with rfl | rfl
  · have htable : candidateMasks sstar .Pw = candidateMasks .s1 .Pw := by
      cases sstar <;> simp [isSurplusStar] at hsstar <;> rfl
    rw [htable]
    symm
    exact sort_eq_of_eq_toFinset fourSupportMasksAvoidingPw_eq_table (by decide)
  · have htable : candidateMasks sstar .Pu = candidateMasks .s1 .Pu := by
      cases sstar <;> simp [isSurplusStar] at hsstar <;> rfl
    rw [htable]
    symm
    exact sort_eq_of_eq_toFinset fourSupportMasksAvoidingPu_eq_table (by decide)

private theorem fourSupportMaskList_sorted (center : Label) :
    (fourSupportMaskListAvoidingCenter center).Pairwise (· < ·) := by
  apply List.sortedLT_iff_pairwise.mp
  rw [List.sortedLT_iff_nodup_and_sortedLE]
  exact ⟨Finset.sort_nodup _ _, (Finset.pairwise_sort _ _).sortedLE⟩

/-- Every surplus private-center table is the ordered filter of its candidate
predicate. -/
theorem candidateMasks_privateCenter_eq_filter
    {sstar center : Label}
    (hsstar : isSurplusStar sstar = true)
    (hcenter : center = .Pw ∨ center = .Pu) :
    candidateMasks sstar center = candidateMasksByFilter sstar center := by
  rw [candidateMasks_privateCenter_eq_fourSupportMasks hsstar hcenter]
  have hbound : ∀ mask ∈ fourSupportMaskListAvoidingCenter center, mask < maskBound := by
    intro mask hmask
    rw [fourSupportMaskListAvoidingCenter, Finset.mem_sort] at hmask
    obtain ⟨support, _, rfl⟩ := Finset.mem_image.mp hmask
    exact supportMask_lt_maskBound support
  have hmatch : ∀ mask, mask < maskBound →
      (candidateMaskOK sstar center mask = true ↔
        mask ∈ fourSupportMaskListAvoidingCenter center) := by
    intro mask _
    rw [candidateMaskOK_privateCenter_iff_mem_supportMasks hsstar hcenter,
      fourSupportMaskListAvoidingCenter, Finset.mem_sort]
  have hfilter := filter_range_eq_of_strictSorted_bounded
    (candidateMaskOK sstar center) maskBound
    (fourSupportMaskListAvoidingCenter center)
    (fourSupportMaskList_sorted center) hbound hmatch
  simpa [candidateMasksByFilter, allNormalizedMasks] using hfilter.symm

/-- A surplus center occurring strictly after its chosen surplus star in the
ordered sequence s1, s2, s3. -/
def IsLaterSurplusCenter (sstar center : Label) : Prop :=
  (sstar = .s1 ∧ center = .s2) ∨
    (sstar = .s1 ∧ center = .s3) ∨
    (sstar = .s2 ∧ center = .s3)

/-- The local trigger is vacuous when the surplus center occurs after the
chosen surplus star. -/
theorem localTriggerOKAt_laterSurplusCenter
    {sstar center : Label} {mask : Nat}
  (hcenter : IsLaterSurplusCenter sstar center) :
    localTriggerOKAt sstar center mask = true := by
  rcases hcenter with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;>
    simp [localTriggerOKAt, previousSstarCenters]

/-- At a later surplus center, the candidate predicate asks exactly for a
normalized four-element support which omits its center and does not contain
all three Moser labels. -/
theorem candidateMaskOK_laterSurplusCenter_iff
    {sstar center : Label} {mask : Nat}
    (hcenter : IsLaterSurplusCenter sstar center) :
    candidateMaskOK sstar center mask = true ↔
      maskNormalized mask = true ∧
      maskCard mask = 4 ∧
      maskHas mask center = false ∧
      ¬ (maskHas mask .u = true ∧ maskHas mask .v = true ∧
        maskHas mask .w = true) := by
  rcases hcenter with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;>
    simp [candidateMaskOK, localTriggerOKAt, previousSstarCenters, isMoserLabel]
  all_goals
    cases hu : maskHas mask .u <;>
      cases hv : maskHas mask .v <;>
      cases hw : maskHas mask .w <;>
      simp_all
  all_goals aesop

private theorem candidateMaskOK_laterSurplusCenter_iff_mem_supportMasks
    {sstar center : Label} {mask : Nat}
    (hcenter : IsLaterSurplusCenter sstar center) :
    candidateMaskOK sstar center mask = true ↔
      mask ∈ fourSupportMasksAvoidingCenter center :=
  (candidateMaskOK_laterSurplusCenter_iff hcenter).trans
    maskProperties_iff_mem_fourSupportMasks

set_option maxRecDepth 100000 in
private theorem fourSupportMasksAvoidingS2_eq_table :
    fourSupportMasksAvoidingCenter .s2 =
      (candidateMasks .s1 .s2).toFinset := by
  decide

set_option maxRecDepth 100000 in
private theorem fourSupportMasksAvoidingS3_eq_table :
    fourSupportMasksAvoidingCenter .s3 =
      (candidateMasks .s1 .s3).toFinset := by
  decide

/-- For a later surplus center, the explicit candidate table is the ascending
structural enumeration of four-element supports which omit the center and do
not contain all three Moser labels. -/
theorem candidateMasks_laterSurplusCenter_eq_fourSupportMasks
    {sstar center : Label}
    (hcenter : IsLaterSurplusCenter sstar center) :
    candidateMasks sstar center = fourSupportMaskListAvoidingCenter center := by
  rcases hcenter with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · symm
    exact sort_eq_of_eq_toFinset fourSupportMasksAvoidingS2_eq_table (by decide)
  · symm
    exact sort_eq_of_eq_toFinset fourSupportMasksAvoidingS3_eq_table (by decide)
  · change candidateMasks .s1 .s3 = fourSupportMaskListAvoidingCenter .s3
    symm
    exact sort_eq_of_eq_toFinset fourSupportMasksAvoidingS3_eq_table (by decide)

/-- Every later-surplus-center table is the ordered filter of its candidate
predicate. -/
theorem candidateMasks_laterSurplusCenter_eq_filter
    {sstar center : Label}
    (hcenter : IsLaterSurplusCenter sstar center) :
    candidateMasks sstar center = candidateMasksByFilter sstar center := by
  rw [candidateMasks_laterSurplusCenter_eq_fourSupportMasks hcenter]
  have hbound : ∀ mask ∈ fourSupportMaskListAvoidingCenter center, mask < maskBound := by
    intro mask hmask
    rw [fourSupportMaskListAvoidingCenter, Finset.mem_sort] at hmask
    obtain ⟨support, _, rfl⟩ := Finset.mem_image.mp hmask
    exact supportMask_lt_maskBound support
  have hmatch : ∀ mask, mask < maskBound →
      (candidateMaskOK sstar center mask = true ↔
        mask ∈ fourSupportMaskListAvoidingCenter center) := by
    intro mask _
    rw [candidateMaskOK_laterSurplusCenter_iff_mem_supportMasks hcenter,
      fourSupportMaskListAvoidingCenter, Finset.mem_sort]
  have hfilter := filter_range_eq_of_strictSorted_bounded
    (candidateMaskOK sstar center) maskBound
    (fourSupportMaskListAvoidingCenter center)
    (fourSupportMaskList_sorted center) hbound hmatch
  simpa [candidateMasksByFilter, allNormalizedMasks] using hfilter.symm

private theorem candidateMasks_s1_s2_eq_filter :
    candidateMasks .s1 .s2 = candidateMasksByFilter .s1 .s2 :=
  candidateMasks_laterSurplusCenter_eq_filter (Or.inl ⟨rfl, rfl⟩)

private theorem candidateMasks_s1_s3_eq_filter :
    candidateMasks .s1 .s3 = candidateMasksByFilter .s1 .s3 :=
  candidateMasks_laterSurplusCenter_eq_filter (Or.inr (Or.inl ⟨rfl, rfl⟩))

private theorem candidateMasks_s2_s3_eq_filter :
    candidateMasks .s2 .s3 = candidateMasksByFilter .s2 .s3 :=
  candidateMasks_laterSurplusCenter_eq_filter (Or.inr (Or.inr ⟨rfl, rfl⟩))

end PrivateCenterSupport
"""


def emit_lean_shadow(bank: dict[str, Any], path: Path) -> None:
    validate_shadow_signatures(bank["rows"])
    rows = ",\n".join(lean_row(row) for row in bank["rows"])
    fragment_entries = ",\n".join(lean_fragment_entry(row) for row in bank["rows"])
    computed_fragment_entries = compute_fragment_search_entries()
    expected_fragment_entries = [
        (row["sstar"], [row["class_bitsets"][center] for center in LABELS])
        for row in bank["rows"]
    ]
    require(
        len(computed_fragment_entries) == len(expected_fragment_entries),
        "computed fragment search has the wrong row count",
    )
    require(
        set((sstar, tuple(masks)) for sstar, masks in computed_fragment_entries)
        == set((sstar, tuple(masks)) for sstar, masks in expected_fragment_entries),
        "computed fragment search does not match the bank rows",
    )
    raw_fragment_search_entries = ",\n".join(
        f"  ({lean_label(sstar)}, {masks})"
        for sstar, masks in computed_fragment_entries
    )
    candidate_masks_match = lean_candidate_masks_match()
    private_center_support = lean_private_center_support()
    label_pairs = [
        (left, right)
        for index, left in enumerate(LABELS)
        for right in LABELS[index + 1 :]
    ]
    ordered_label_pairs = [
        (left, right) for left in LABELS for right in LABELS if left != right
    ]
    fragment_search_order = ["v", "w", "u", "Pw", "Pu", "Q1", "Q2", "s1", "s2", "s3"]
    assigned_prefixes: list[list[str]] = [[]]
    assigned_prefix: list[str] = []
    for center in fragment_search_order:
        assigned_prefix = [center, *assigned_prefix]
        assigned_prefixes.append(assigned_prefix)
    lean_label_pairs = lean_pair_list(label_pairs)
    lean_ordered_label_pairs = lean_pair_list(ordered_label_pairs)
    lean_fragment_search_order = lean_label_list(fragment_search_order)
    lean_fragment_search_assigned_prefixes = (
        "[" + ", ".join(lean_label_list(prefix) for prefix in assigned_prefixes) + "]"
    )
    lean_full_fragment_search_assigned = lean_label_list(assigned_prefixes[-1])
    lean_shadow_path_proof = lean_shadow_path_theorem(
        fragment_search_order, assigned_prefixes
    )
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Nat.BitIndices
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Sort
import Mathlib.Combinatorics.Colex
import Batteries.Data.List.Perm
import Mathlib.Tactic.IntervalCases

/-!
# Generated pinned surplus COMP-G shadow bank

This module is generated by `scripts/surplus-compg-shadow.py`.

It contains only the finite incidence shadow of the 135 pinned surplus COMP-G
rows.  Algebraic certificates and the formal geometric faithfulness bridge are
separate obligations.
-/

namespace Problem97
namespace SurplusCOMPGBank

inductive Label where
  | u | v | w | s1 | s2 | s3 | Pw | Pu | Q1 | Q2
  deriving DecidableEq, BEq, Repr

def labelCount : Nat := 10

def allLabels : List Label :=
  [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2]

def labelPairs : List (Label × Label) :=
  {lean_label_pairs}

def orderedLabelPairs : List (Label × Label) :=
  {lean_ordered_label_pairs}

def Label.index : Label -> Nat
  | .u => 0
  | .v => 1
  | .w => 2
  | .s1 => 3
  | .s2 => 4
  | .s3 => 5
  | .Pw => 6
  | .Pu => 7
  | .Q1 => 8
  | .Q2 => 9

def Label.bit (label : Label) : Nat :=
  2 ^ label.index

@[simp] theorem Label.beq_eq_decide_eq (left right : Label) :
    (left == right) = decide (left = right) := by
  cases left <;> cases right <;> rfl

def maskOfLabels : List Label -> Nat
  | [] => 0
  | label :: rest => label.bit + maskOfLabels rest

def maskHas (mask : Nat) (label : Label) : Bool :=
  mask.testBit label.index

def maskBound : Nat :=
  2 ^ labelCount

def maskNormalized (mask : Nat) : Bool :=
  decide (mask < maskBound)

def maskCard (mask : Nat) : Nat :=
  allLabels.foldl
    (fun acc label => if maskHas mask label then acc + 1 else acc) 0

def labelAt : Nat → Label
  | 0 => .u
  | 1 => .v
  | 2 => .w
  | 3 => .s1
  | 4 => .s2
  | 5 => .s3
  | 6 => .Pw
  | 7 => .Pu
  | 8 => .Q1
  | 9 => .Q2
  | _ => .u

def labelsOfMaskBits (mask : Nat) : List Label :=
  mask.bitIndices.map labelAt

theorem labelAt_index_of_lt {{i : Nat}} (hi : i < labelCount) :
    (labelAt i).index = i := by
  change i < 10 at hi
  interval_cases i <;> rfl

theorem labelAt_index (label : Label) : labelAt label.index = label := by
  cases label <;> rfl

theorem bitIndex_lt_labelCount_of_mem {{mask i : Nat}}
    (hm : mask < 2 ^ labelCount) (hi : i ∈ mask.bitIndices) :
    i < labelCount := by
  by_contra h
  have hle : labelCount ≤ i := Nat.le_of_not_gt h
  have hp : 2 ^ labelCount ≤ 2 ^ i := Nat.pow_le_pow_right (by decide) hle
  exact (Nat.not_lt_of_ge hp)
    (lt_of_le_of_lt (Nat.two_pow_le_of_mem_bitIndices hi) hm)

theorem labelsOfMaskBits_nodup {{mask : Nat}} (hm : mask < 2 ^ labelCount) :
    (labelsOfMaskBits mask).Nodup := by
  unfold labelsOfMaskBits
  apply List.Nodup.map_on
  · intro i hi j hj hij
    calc
      i = (labelAt i).index := (labelAt_index_of_lt
        (bitIndex_lt_labelCount_of_mem hm hi)).symm
      _ = (labelAt j).index := by rw [hij]
      _ = j := labelAt_index_of_lt (bitIndex_lt_labelCount_of_mem hm hj)
  · exact Nat.bitIndices_nodup

theorem mem_labelsOfMaskBits_iff {{mask : Nat}} (hm : mask < 2 ^ labelCount)
    (label : Label) :
    label ∈ labelsOfMaskBits mask ↔ maskHas mask label = true := by
  constructor
  · intro h
    rcases List.mem_map.mp h with ⟨i, hi, hat⟩
    have hil := bitIndex_lt_labelCount_of_mem hm hi
    rw [← hat]
    simp [maskHas, labelAt_index_of_lt hil]
    exact Nat.mem_bitIndices.mp hi
  · intro h
    apply List.mem_map.mpr
    refine ⟨label.index, ?_, labelAt_index label⟩
    rw [Nat.mem_bitIndices]
    simpa [maskHas] using h

theorem maskOfLabels_eq_sum (labels : List Label) :
    maskOfLabels labels = (labels.map Label.bit).sum := by
  induction labels with
  | nil => rfl
  | cons label labels ih => simp [maskOfLabels, ih]

theorem maskOfLabels_labelsOfMaskBits {{mask : Nat}}
    (hm : mask < 2 ^ labelCount) :
    maskOfLabels (labelsOfMaskBits mask) = mask := by
  rw [maskOfLabels_eq_sum, labelsOfMaskBits, List.map_map]
  rw [List.map_congr_left (fun i hi => by
    simp only [Function.comp_apply, Label.bit]
    rw [labelAt_index_of_lt (bitIndex_lt_labelCount_of_mem hm hi)])]
  exact Nat.sum_map_two_pow_bitIndices mask

theorem maskCard_eq_length_labelsOfMaskBits {{mask : Nat}}
    (hm : mask < 2 ^ labelCount) :
    maskCard mask = (labelsOfMaskBits mask).length := by
  have fold_filter_length : ∀ (xs : List Label) (acc : Nat),
      xs.foldl (fun acc label => if maskHas mask label then acc + 1 else acc) acc =
        acc + (xs.filter (maskHas mask)).length := by
    intro xs
    induction xs with
    | nil => intro acc; simp
    | cons x xs ih =>
      intro acc
      simp only [List.foldl_cons, List.filter_cons]
      split <;> simp [ih, Nat.add_assoc, Nat.add_comm]
  have hfilter : maskCard mask =
      (allLabels.filter (maskHas mask)).length := by
    simpa [maskCard] using fold_filter_length allLabels 0
  have hall : allLabels.Nodup := by decide
  have hsupport : (allLabels.filter (maskHas mask)).Nodup :=
    List.Sublist.nodup List.filter_sublist hall
  have hperm : (allLabels.filter (maskHas mask)).Perm (labelsOfMaskBits mask) :=
    List.Subperm.antisymm
      (List.subperm_of_subset hsupport (by
        intro label hlabel
        exact (mem_labelsOfMaskBits_iff hm label).mpr
          (List.mem_filter.mp hlabel).2))
      (List.subperm_of_subset (labelsOfMaskBits_nodup hm) (by
        intro label hlabel
        exact List.mem_filter.mpr ⟨by cases label <;> simp [allLabels],
          (mem_labelsOfMaskBits_iff hm label).mp hlabel⟩))
  rw [hfilter]
  exact hperm.length_eq

def maskInterCard (left right : Nat) : Nat :=
  allLabels.foldl
    (fun acc label =>
      if maskHas left label && maskHas right label then acc + 1 else acc) 0

def maskTripleInterCard (left middle right : Nat) : Nat :=
  allLabels.foldl
    (fun acc label =>
      if maskHas left label && maskHas middle label && maskHas right label then
        acc + 1
      else
        acc) 0

def hullPos : Label -> Nat
  | .u => 0
  | .Q1 => 1
  | .Q2 => 2
  | .v => 3
  | .s1 => 4
  | .s2 => 5
  | .s3 => 6
  | .w => 7
  | .Pw => 8
  | .Pu => 9

def between (a b x : Label) : Bool :=
  let da := (hullPos x + labelCount - hullPos a) % labelCount
  let db := (hullPos b + labelCount - hullPos a) % labelCount
  decide (0 < da) && decide (da < db)

def separated (a b x y : Label) : Bool :=
  between a b x != between a b y

inductive Verdict where
  | cEmpty | noValidReal
  deriving DecidableEq, BEq, Repr

def expectedPinnedMask : Label -> Nat
  | .s1 => 201
  | .s2 => 209
  | .s3 => 225
  | _ => 0

structure Row where
  pid : String
  sstar : Label
  masks : List Nat
  finalVerdict : Verdict
  forcedPairCode : Nat
  deriving Repr

def Row.pinnedMask (row : Row) : Nat :=
  row.masks.getD 1 0

def Row.hasTenMasks (row : Row) : Bool :=
  row.masks.length == labelCount

def Row.isPinned (row : Row) : Bool :=
  row.pinnedMask == expectedPinnedMask row.sstar

def Row.shadowKey (row : Row) : List Nat :=
  row.masks

def containsKey (key : List Nat) : List (List Nat) -> Bool
  | [] => false
  | head :: tail => if head == key then true else containsKey key tail

def keysUniqueAux : List (List Nat) -> List (List Nat) -> Bool
  | [], _ => true
  | key :: rest, seen => !containsKey key seen && keysUniqueAux rest (key :: seen)

def countVerdict (verdict : Verdict) : List Row -> Nat
  | [] => 0
  | row :: rest =>
      (if row.finalVerdict == verdict then 1 else 0) + countVerdict verdict rest

def countForcedPairCode (code : Nat) : List Row -> Nat
  | [] => 0
  | row :: rest =>
      (if row.forcedPairCode == code then 1 else 0) + countForcedPairCode code rest

def countSstar (sstar : Label) : List Row -> Nat
  | [] => 0
  | row :: rest =>
      (if row.sstar == sstar then 1 else 0) + countSstar sstar rest

structure Shadow where
  masks : List Nat
  deriving Repr

def Shadow.hasTenMasks (shadow : Shadow) : Bool :=
  shadow.masks.length == labelCount

def Shadow.centerMask (shadow : Shadow) (center : Label) : Nat :=
  shadow.masks.getD center.index 0

def Shadow.classHas (shadow : Shadow) (center member : Label) : Bool :=
  maskHas (shadow.centerMask center) member

def Shadow.classShapeOKAt (shadow : Shadow) (center : Label) : Bool :=
  maskNormalized (shadow.centerMask center) &&
    maskCard (shadow.centerMask center) == 4 &&
    !shadow.classHas center center

def Shadow.classesShapeOK (shadow : Shadow) : Bool :=
  allLabels.all (shadow.classShapeOKAt ·)

def isSurplusStar : Label -> Bool
  | .s1 => true
  | .s2 => true
  | .s3 => true
  | _ => false

def pinnedClassOK (sstar : Label) (shadow : Shadow) : Bool :=
  shadow.centerMask .v == expectedPinnedMask sstar

def pinnedMaskOf (sstar : Label) : Nat :=
  maskOfLabels [.u, sstar, .Pw, .Pu]

theorem pinnedMaskOf_eq_expectedPinnedMask_of_isSurplusStar
    {{sstar : Label}} (hs : isSurplusStar sstar = true) :
    pinnedMaskOf sstar = expectedPinnedMask sstar := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pinnedMaskOf, expectedPinnedMask, maskOfLabels, Label.bit,
      Label.index]

theorem pinnedClassOK_of_centerMask_eq_pinnedMaskOf
    {{sstar : Label}} {{shadow : Shadow}}
    (hs : isSurplusStar sstar = true)
    (hmask : shadow.centerMask .v = pinnedMaskOf sstar) :
    pinnedClassOK sstar shadow = true := by
  simp [pinnedClassOK, hmask,
    pinnedMaskOf_eq_expectedPinnedMask_of_isSurplusStar hs]

def cvNoUMask : Nat := maskOfLabels [.w, .Pw, .Pu]
def cwNoUMask : Nat := maskOfLabels [.v, .Q1, .Q2]
def cvNoWMask : Nat := maskOfLabels [.u, .Pw, .Pu]
def cuNoWMask : Nat := maskOfLabels [.v, .s1, .s2, .s3]
def uPwPuMask : Nat := maskOfLabels [.u, .Pw, .Pu]

def wSqueezeOK (shadow : Shadow) : Bool :=
  shadow.classHas .w .Q1 &&
    shadow.classHas .w .Q2 &&
    (maskInterCard (shadow.centerMask .w) cuNoWMask == 1) &&
    (maskInterCard (shadow.centerMask .w) cvNoWMask == 1)

def oneHitOK (shadow : Shadow) : Bool :=
  decide (maskInterCard (shadow.centerMask .u) cvNoUMask <= 1) &&
    decide (maskInterCard (shadow.centerMask .u) cwNoUMask <= 1) &&
    decide (maskInterCard (shadow.centerMask .w) cvNoWMask <= 1) &&
    decide (maskInterCard (shadow.centerMask .w) cuNoWMask <= 1)

def isMoserLabel : Label -> Bool
  | .u => true
  | .v => true
  | .w => true
  | _ => false

def circumcenterOKAt (shadow : Shadow) (center : Label) : Bool :=
  isMoserLabel center ||
    !(shadow.classHas center .u && shadow.classHas center .v &&
      shadow.classHas center .w)

def circumcenterOK (shadow : Shadow) : Bool :=
  allLabels.all (circumcenterOKAt shadow)

def sepOKFor (shadow : Shadow) (c cp x y : Label) : Bool :=
  if x == c || x == cp || y == c || y == cp then
    true
  else if shadow.classHas c x && shadow.classHas c y &&
      shadow.classHas cp x && shadow.classHas cp y then
    separated c cp x y
  else
    true

def crossSeparationOKForMasks
    (c : Label) (cmask : Nat) (cp : Label) (cpmask : Nat) : Bool :=
  labelPairs.all
    (fun pointPair =>
      let x := pointPair.fst
      let y := pointPair.snd
      if x == c || x == cp || y == c || y == cp then
        true
      else if maskHas cmask x && maskHas cmask y &&
          maskHas cpmask x && maskHas cpmask y then
        separated c cp x y
      else
        true)

theorem crossSeparationOKForMasks_of_sepOKFor
    {{shadow : Shadow}} {{c cp : Label}}
    (hsep : ∀ x y : Label,
      (x, y) ∈ labelPairs → sepOKFor shadow c cp x y = true) :
    crossSeparationOKForMasks c (shadow.centerMask c) cp
      (shadow.centerMask cp) = true := by
  unfold crossSeparationOKForMasks
  rw [List.all_eq_true]
  intro pair hpair
  simpa [sepOKFor, Shadow.classHas] using hsep pair.1 pair.2 hpair

def separationOK (shadow : Shadow) : Bool :=
  labelPairs.all
    (fun centerPair =>
      labelPairs.all
        (fun pointPair =>
          sepOKFor shadow centerPair.fst centerPair.snd
            pointPair.fst pointPair.snd))

def searchSeparationOK (shadow : Shadow) : Bool :=
  orderedLabelPairs.all
    (fun centerPair =>
      crossSeparationOKForMasks centerPair.fst
        (shadow.centerMask centerPair.fst)
        centerPair.snd
        (shadow.centerMask centerPair.snd))

def pointPairClassCount (shadow : Shadow) (x y : Label) : Nat :=
  allLabels.foldl
    (fun acc center =>
      if center == x || center == y then
        acc
      else if shadow.classHas center x && shadow.classHas center y then
        acc + 1
      else
        acc) 0

def noThreeOK (shadow : Shadow) : Bool :=
  labelPairs.all
    (fun pointPair =>
      decide (pointPairClassCount shadow pointPair.fst pointPair.snd <= 2))

def pointPairHitByCenterMask
    (center : Label) (mask : Nat) (pointPair : Label × Label) : Bool :=
  let x := pointPair.fst
  let y := pointPair.snd
  if center == x || center == y then
    false
  else
    maskHas mask x && maskHas mask y

def incrementPairCountsAux
    (center : Label) (mask : Nat) :
    List Nat -> List (Label × Label) -> List Nat
  | [], _ => []
  | counts, [] => counts
  | count :: restCounts, pointPair :: restPairs =>
      (count + if pointPairHitByCenterMask center mask pointPair then 1 else 0) ::
        incrementPairCountsAux center mask restCounts restPairs

def incrementPairCounts
    (center : Label) (mask : Nat) (counts : List Nat) : List Nat :=
  incrementPairCountsAux center mask counts labelPairs

def pairCountsOK (counts : List Nat) : Bool :=
  counts.all (fun count => decide (count <= 2))

def emptyPairCounts : List Nat :=
  labelPairs.map (fun _ => 0)

def fragmentSearchAssignedPrefixes : List (List Label) :=
  {lean_fragment_search_assigned_prefixes}

def shadowPairCountsForAssigned (shadow : Shadow) : List Label -> List Nat
  | [] => emptyPairCounts
  | center :: assigned =>
      incrementPairCounts center (shadow.centerMask center)
        (shadowPairCountsForAssigned shadow assigned)

abbrev PrefixPairCountsOK (shadow : Shadow) : Prop :=
  ∀ assigned : List Label,
    assigned ∈ fragmentSearchAssignedPrefixes →
      pairCountsOK (shadowPairCountsForAssigned shadow assigned) = true

def searchPairCountsOK (shadow : Shadow) : Bool :=
  fragmentSearchAssignedPrefixes.all
    (fun assigned => pairCountsOK (shadowPairCountsForAssigned shadow assigned))

def previousSstarCenters : Label -> List Label
  | .s1 => []
  | .s2 => [.s1]
  | .s3 => [.s1, .s2]
  | _ => []

def triggerPrivateOKAt (shadow : Shadow) (center sstar : Label) : Bool :=
  !(shadow.classHas center sstar &&
    decide (1 <= maskInterCard (shadow.centerMask center) uPwPuMask))

def fragmentTriggersOK (sstar : Label) (shadow : Shadow) : Bool :=
  triggerPrivateOKAt shadow .u sstar &&
    triggerPrivateOKAt shadow .Q1 sstar &&
    triggerPrivateOKAt shadow .Q2 sstar &&
    (previousSstarCenters sstar).all
      (fun center => triggerPrivateOKAt shadow center sstar) &&
    decide (maskInterCard (shadow.centerMask sstar) uPwPuMask <= 1)

def isValidPinnedFragment (sstar : Label) (shadow : Shadow) : Bool :=
  isSurplusStar sstar &&
    shadow.hasTenMasks &&
    shadow.classesShapeOK &&
    pinnedClassOK sstar shadow &&
    wSqueezeOK shadow &&
    oneHitOK shadow &&
    circumcenterOK shadow &&
    noThreeOK shadow &&
    searchPairCountsOK shadow &&
    separationOK shadow &&
    searchSeparationOK shadow &&
    fragmentTriggersOK sstar shadow

def centerMaskOf (masks : List Nat) (center : Label) : Nat :=
  masks.getD center.index 0

def setNth : Nat -> Nat -> List Nat -> List Nat
  | _, _, [] => []
  | 0, value, _ :: rest => value :: rest
  | index + 1, value, head :: rest => head :: setNth index value rest

def setCenterMask (masks : List Nat) (center : Label) (mask : Nat) : List Nat :=
  setNth center.index mask masks

def allNormalizedMasks : List Nat :=
  List.range maskBound

def localTriggerOKAt (sstar center : Label) (mask : Nat) : Bool :=
  if center == .u || center == .Q1 || center == .Q2 ||
      (previousSstarCenters sstar).any (fun prior => prior == center) then
    !(maskHas mask sstar && decide (1 <= maskInterCard mask uPwPuMask))
  else if center == sstar then
    decide (maskInterCard mask uPwPuMask <= 1)
  else
    true

def candidateMaskOK (sstar center : Label) (mask : Nat) : Bool :=
  maskNormalized mask &&
    maskCard mask == 4 &&
    !maskHas mask center &&
    (if center == .v then mask == expectedPinnedMask sstar else true) &&
    (if center == .w then
      maskHas mask .Q1 && maskHas mask .Q2 &&
        (maskInterCard mask cuNoWMask == 1) &&
        (maskInterCard mask cvNoWMask == 1)
     else
      true) &&
    (if center == .u then
      decide (maskInterCard mask cvNoUMask <= 1) &&
        decide (maskInterCard mask cwNoUMask <= 1)
     else
      true) &&
    (if center == .w then
      decide (maskInterCard mask cvNoWMask <= 1) &&
        decide (maskInterCard mask cuNoWMask <= 1)
     else
      true) &&
    (if isMoserLabel center then
      true
     else
      !(maskHas mask .u && maskHas mask .v && maskHas mask .w)) &&
    localTriggerOKAt sstar center mask

def candidateMasksByFilter (sstar center : Label) : List Nat :=
  allNormalizedMasks.filter (candidateMaskOK sstar center ·)

def candidateMasks : Label -> Label -> List Nat
{candidate_masks_match}

def candidateMaskFamilyPairs : List (Label × Label) :=
  [(.s1, .u), (.s1, .v), (.s1, .w), (.s1, .s1), (.s1, .s2),
    (.s1, .s3), (.s1, .Pw), (.s1, .Pu), (.s1, .Q1), (.s1, .Q2),
    (.s2, .u), (.s2, .v), (.s2, .w), (.s2, .s1), (.s2, .s2),
    (.s2, .s3), (.s2, .Pw), (.s2, .Pu), (.s2, .Q1), (.s2, .Q2),
    (.s3, .u), (.s3, .v), (.s3, .w), (.s3, .s1), (.s3, .s2),
    (.s3, .s3), (.s3, .Pw), (.s3, .Pu), (.s3, .Q1), (.s3, .Q2)]

def candidateMasksMatchFilter : Bool :=
  candidateMaskFamilyPairs.all
    (fun pair => candidateMasks pair.fst pair.snd ==
      candidateMasksByFilter pair.fst pair.snd)

def assignedSeparationOK
    (center : Label) (mask : Nat) (assigned : List Label)
    (masks : List Nat) : Bool :=
  assigned.all
    (fun other =>
      crossSeparationOKForMasks center mask other (centerMaskOf masks other))

def partialPointPairClassCount
    (masks : List Nat) (assigned : List Label) (x y : Label) : Nat :=
  assigned.foldl
    (fun acc center =>
      if center == x || center == y then
        acc
      else if maskHas (centerMaskOf masks center) x &&
          maskHas (centerMaskOf masks center) y then
        acc + 1
      else
        acc) 0

def partialNoThreeOK (masks : List Nat) (assigned : List Label) : Bool :=
  labelPairs.all
    (fun pointPair =>
      decide (partialPointPairClassCount masks assigned
        pointPair.fst pointPair.snd <= 2))

def fragmentSearchSstars : List Label :=
  [.s1, .s2, .s3]

def fragmentSearchOrder : List Label :=
  {lean_fragment_search_order}

def fragmentSearchPlan (sstar : Label) : List (Label × List Nat) :=
  fragmentSearchOrder.map (fun center => (center, candidateMasks sstar center))

def depth2Wmasks : List Nat :=
  {lean_nat_list(candidate_masks_for("s1", "w"))}

def depth2RestPlan (sstar : Label) : List (Label × List Nat) :=
  [(.u, candidateMasks sstar .u), (.Pw, candidateMasks sstar .Pw),
    (.Pu, candidateMasks sstar .Pu), (.Q1, candidateMasks sstar .Q1),
    (.Q2, candidateMasks sstar .Q2), (.s1, candidateMasks sstar .s1),
    (.s2, candidateMasks sstar .s2), (.s3, candidateMasks sstar .s3)]

def emptyShadowMasks : List Nat :=
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

def depth2StateMasks (sstar : Label) (wmask : Nat) : List Nat :=
  setCenterMask (setCenterMask emptyShadowMasks .v (pinnedMaskOf sstar)) .w wmask

def depth2StateCounts (sstar : Label) (wmask : Nat) : List Nat :=
  incrementPairCounts .w wmask
    (incrementPairCounts .v (pinnedMaskOf sstar) emptyPairCounts)

def fullFragmentSearchAssigned : List Label :=
  {lean_full_fragment_search_assigned}

def shadowMasksForAssigned (shadow : Shadow) : List Label -> List Nat
  | [] => emptyShadowMasks
  | center :: assigned =>
      setCenterMask (shadowMasksForAssigned shadow assigned) center
        (shadow.centerMask center)

def fragmentSearchAux
    (sstar : Label) (assigned : List Label) (masks pairCounts : List Nat)
    (plan : List (Label × List Nat)) : List (List Nat) :=
  match plan with
  | [] =>
      if isValidPinnedFragment sstar {{ masks := masks }} then
        [masks]
      else
        []
  | (center, candidates) :: rest =>
      candidates.flatMap
        (fun mask =>
          let masks' := setCenterMask masks center mask
          let pairCounts' := incrementPairCounts center mask pairCounts
          if assignedSeparationOK center mask assigned masks &&
              pairCountsOK pairCounts' then
            fragmentSearchAux sstar (center :: assigned) masks' pairCounts' rest
          else
            [])
termination_by plan.length
decreasing_by
  simp_wf

def depth2SubtreeResult (sstar : Label) (wmask : Nat) : List (List Nat) :=
  fragmentSearchAux sstar [.w, .v] (depth2StateMasks sstar wmask)
    (depth2StateCounts sstar wmask) (depth2RestPlan sstar)

def rawFragmentSearchEntriesFor (sstar : Label) : List (Label × List Nat) :=
  (fragmentSearchAux sstar [] emptyShadowMasks emptyPairCounts
    (fragmentSearchPlan sstar)).map (fun masks => (sstar, masks))

def computedRawFragmentSearchEntries : List (Label × List Nat) :=
  fragmentSearchSstars.flatMap rawFragmentSearchEntriesFor

def computedFragmentSearchShadowKeys : List (List Nat) :=
  computedRawFragmentSearchEntries.map Prod.snd

def computedFragmentShadowAcceptedBySearch (shadow : Shadow) : Bool :=
  shadow.hasTenMasks && containsKey shadow.masks computedFragmentSearchShadowKeys

def rawFragmentSearchEntries : List (Label × List Nat) := [
{raw_fragment_search_entries}
]

def rawFragmentSearchShadowKeys : List (List Nat) :=
  rawFragmentSearchEntries.map Prod.snd

def Row.toShadow (row : Row) : Shadow :=
  {{ masks := row.masks }}

def Row.validPinnedFragment (row : Row) : Bool :=
  isValidPinnedFragment row.sstar row.toShadow

def rows : List Row := [
{rows}
]

def validFragmentEntries : List (Label × List Nat) := [
{fragment_entries}
]

def validFragmentShadowKeys : List (List Nat) :=
  validFragmentEntries.map Prod.snd

def validFragmentEntryOK (entry : Label × List Nat) : Bool :=
  isValidPinnedFragment entry.fst {{ masks := entry.snd }}

def sameFragmentEntry (left right : Label × List Nat) : Bool :=
  left.fst == right.fst && left.snd == right.snd

def containsFragmentEntry
    (entry : Label × List Nat) : List (Label × List Nat) -> Bool
  | [] => false
  | head :: tail =>
      if sameFragmentEntry entry head then true else containsFragmentEntry entry tail

def fragmentSearchEntries : List (Label × List Nat) :=
  validFragmentEntries.filter
    (fun entry => containsFragmentEntry entry rawFragmentSearchEntries)

def fragmentSearchShadowKeys : List (List Nat) :=
  fragmentSearchEntries.map Prod.snd

def depth2SubtreeAllAccepted (sstar : Label) (wmask : Nat) : Bool :=
  (depth2SubtreeResult sstar wmask).all
    (fun masks => containsKey masks fragmentSearchShadowKeys)

def rowShadowKeys : List (List Nat) :=
  rows.map Row.shadowKey

def rowsShadowKeysUnique : Bool :=
  keysUniqueAux rowShadowKeys []

def shadowInBank (shadow : Shadow) : Bool :=
  shadow.hasTenMasks && containsKey shadow.masks rowShadowKeys

def fragmentShadowInEnumeration (shadow : Shadow) : Bool :=
  shadow.hasTenMasks && containsKey shadow.masks validFragmentShadowKeys

def fragmentShadowAcceptedBySearch (shadow : Shadow) : Bool :=
  shadow.hasTenMasks && containsKey shadow.masks fragmentSearchShadowKeys

theorem rows_length : rows.length = 135 := by
  native_decide

theorem rows_all_have_ten_masks : rows.all Row.hasTenMasks = true := by
  native_decide

theorem rows_all_pinned : rows.all Row.isPinned = true := by
  native_decide

theorem rows_shadow_keys_unique : rowsShadowKeysUnique = true := by
  native_decide

theorem rows_all_valid_pinned_fragment :
    rows.all Row.validPinnedFragment = true := by
  native_decide

theorem valid_fragment_entries_length : validFragmentEntries.length = 135 := by
  native_decide

theorem valid_fragment_entries_all_valid :
    validFragmentEntries.all validFragmentEntryOK = true := by
  native_decide

theorem candidate_masks_match_filter :
    candidateMasksMatchFilter = true := by
  native_decide

private theorem list_all_eq_true_of_mem
    {{α : Type}} {{p : α -> Bool}} {{a : α}} :
    {{items : List α}} -> items.all p = true -> a ∈ items -> p a = true
  | [], _h, ha => by cases ha
  | _ :: rest, h, ha => by
      simp only [List.all_cons, Bool.and_eq_true] at h
      cases ha with
      | head => simpa using h.1
      | tail _ haTail => exact list_all_eq_true_of_mem h.2 haTail

theorem containsKey_eq_true_of_mem {{key : List Nat}} :
    {{keys : List (List Nat)}} -> key ∈ keys -> containsKey key keys = true
  | [], h => by cases h
  | head :: tail, h => by
      cases h with
      | head => simp [containsKey]
      | tail _ htail =>
          by_cases heq : (head == key) = true
          · simp [containsKey, heq]
          · simp [containsKey, heq, containsKey_eq_true_of_mem htail]

theorem searchSeparationOK_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}}
    (h : isValidPinnedFragment sstar shadow = true) :
    searchSeparationOK shadow = true := by
  cases sstar <;> simp [isValidPinnedFragment, isSurplusStar] at h ⊢ <;>
    simp_all

theorem searchPairCountsOK_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}}
    (h : isValidPinnedFragment sstar shadow = true) :
    searchPairCountsOK shadow = true := by
  cases sstar <;> simp [isValidPinnedFragment, isSurplusStar] at h ⊢ <;>
    simp_all

theorem hasTenMasks_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}}
    (h : isValidPinnedFragment sstar shadow = true) :
    shadow.hasTenMasks = true := by
  cases sstar <;> simp [isValidPinnedFragment, isSurplusStar] at h ⊢ <;>
    simp_all

theorem crossSeparationOKForMasks_of_searchSeparationOK
    {{shadow : Shadow}} {{center other : Label}}
    (hsep : searchSeparationOK shadow = true)
    (hne : center ≠ other) :
    crossSeparationOKForMasks center (shadow.centerMask center)
      other (shadow.centerMask other) = true := by
  unfold searchSeparationOK at hsep
  exact list_all_eq_true_of_mem
    (items := orderedLabelPairs)
    (p := fun centerPair =>
      crossSeparationOKForMasks centerPair.fst
        (shadow.centerMask centerPair.fst)
        centerPair.snd
        (shadow.centerMask centerPair.snd))
    (a := (center, other)) hsep (by
      cases center <;> cases other <;> simp [orderedLabelPairs] at hne ⊢)

theorem assignedSeparationOK_of_searchSeparationOK
    {{shadow : Shadow}} {{center : Label}} {{assigned : List Label}} {{masks : List Nat}}
    (hsep : searchSeparationOK shadow = true)
    (hmask : ∀ other, other ∈ assigned -> centerMaskOf masks other = shadow.centerMask other)
    (hne : ∀ other, other ∈ assigned -> center ≠ other) :
    assignedSeparationOK center (shadow.centerMask center) assigned masks = true := by
  unfold assignedSeparationOK
  induction assigned with
  | nil => rfl
  | cons other rest ih =>
      simp only [List.all_cons, Bool.and_eq_true]
      constructor
      · rw [hmask other (by simp)]
        exact crossSeparationOKForMasks_of_searchSeparationOK hsep (hne other (by simp))
      · exact ih
          (fun o ho => hmask o (by simp [ho]))
          (fun o ho => hne o (by simp [ho]))

theorem assignedSeparationOK_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}} {{center : Label}}
    {{assigned : List Label}} {{masks : List Nat}}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hmask : ∀ other, other ∈ assigned -> centerMaskOf masks other = shadow.centerMask other)
    (hne : ∀ other, other ∈ assigned -> center ≠ other) :
    assignedSeparationOK center (shadow.centerMask center) assigned masks = true := by
  exact assignedSeparationOK_of_searchSeparationOK
    (searchSeparationOK_of_isValidPinnedFragment hvalid) hmask hne

private def pointPairAssignedCount (shadow : Shadow)
    (assigned : List Label) (pointPair : Label × Label) : Nat :=
  List.countP
    (fun center => pointPairHitByCenterMask center (shadow.centerMask center) pointPair)
    assigned

private theorem incrementPairCountsAux_map_pointPairAssignedCount
    (shadow : Shadow) (center : Label) (assigned : List Label) :
    ∀ pairs : List (Label × Label),
      incrementPairCountsAux center (shadow.centerMask center)
        (pairs.map (pointPairAssignedCount shadow assigned)) pairs =
      pairs.map (pointPairAssignedCount shadow (center :: assigned)) := by
  intro pairs
  induction pairs with
  | nil => simp [incrementPairCountsAux]
  | cons pair rest ih =>
      by_cases hhit :
        pointPairHitByCenterMask center (shadow.centerMask center) pair = true
      · simp [incrementPairCountsAux, pointPairAssignedCount, ih, hhit,
          Nat.add_comm]
      · simp [incrementPairCountsAux, pointPairAssignedCount, ih, hhit]

private theorem shadowPairCountsForAssigned_eq_map_pointPairAssignedCount
    (shadow : Shadow) :
    ∀ assigned : List Label,
      shadowPairCountsForAssigned shadow assigned =
        labelPairs.map (pointPairAssignedCount shadow assigned) := by
  intro assigned
  induction assigned with
  | nil =>
      change List.replicate labelPairs.length 0 = List.map (fun _ => 0) labelPairs
      simp
  | cons center assigned ih =>
      simp [shadowPairCountsForAssigned, ih, incrementPairCounts,
        incrementPairCountsAux_map_pointPairAssignedCount]

private theorem foldl_countP_add {{α : Type _}} (p : α → Bool) :
    ∀ (items : List α) (acc : Nat),
      items.foldl (fun acc item => if p item then acc + 1 else acc) acc =
        acc + List.countP p items := by
  intro items
  induction items with
  | nil => intro acc; simp
  | cons item rest ih =>
      intro acc
      by_cases h : p item = true
      · simp [h, ih, Nat.add_comm, Nat.add_left_comm]
      · simp [h, ih]

private theorem pointPairClassCount_eq_countP (shadow : Shadow) (x y : Label) :
    pointPairClassCount shadow x y =
      List.countP
        (fun center =>
          pointPairHitByCenterMask center (shadow.centerMask center) (x, y))
        allLabels := by
  unfold pointPairClassCount
  have hfun :
      (fun acc center =>
        if center == x || center == y then
          acc
        else if shadow.classHas center x && shadow.classHas center y then
          acc + 1
        else
          acc) =
        (fun acc center =>
          if pointPairHitByCenterMask center (shadow.centerMask center) (x, y) then
            acc + 1
          else
            acc) := by
    funext acc center
    by_cases hx : center = x
    · simp [pointPairHitByCenterMask, hx]
    · by_cases hy : center = y
      · simp [pointPairHitByCenterMask, hy]
      · simp [pointPairHitByCenterMask, Shadow.classHas, hx, hy]
  rw [hfun, foldl_countP_add]
  simp

private theorem countP_le_allLabels_of_perm_sublist
    {{p : Label → Bool}} {{assigned sorted : List Label}}
    (hperm : assigned.Perm sorted) (hsub : sorted.Sublist allLabels) :
    List.countP p assigned <= List.countP p allLabels := by
  rw [hperm.countP_eq]
  exact hsub.countP_le

private theorem countP_le_allLabels_of_fragment_prefix
    {{p : Label → Bool}} {{assigned : List Label}}
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes) :
    List.countP p assigned <= List.countP p allLabels := by
  simp only [fragmentSearchAssignedPrefixes, List.mem_cons, List.not_mem_nil,
    or_false] at hprefix
  rcases hprefix with
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := []) (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.v]) (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.v, .w]) (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w]) (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w, .Pw]) (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w, .Pw, .Pu])
      (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w, .Pw, .Pu, .Q1])
      (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w, .Pw, .Pu, .Q1, .Q2])
      (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w, .s1, .Pw, .Pu, .Q1, .Q2])
      (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := [.u, .v, .w, .s1, .s2, .Pw, .Pu, .Q1, .Q2])
      (by native_decide) (by native_decide)
  · exact countP_le_allLabels_of_perm_sublist
      (sorted := allLabels) (by native_decide) (by native_decide)

theorem pairCountsOK_shadowPairCountsForAssigned_of_pointPairClassCount
    {{shadow : Shadow}} {{assigned : List Label}}
    (hcount : ∀ x y : Label,
      (x, y) ∈ labelPairs → pointPairClassCount shadow x y <= 2)
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes) :
    pairCountsOK (shadowPairCountsForAssigned shadow assigned) = true := by
  rw [shadowPairCountsForAssigned_eq_map_pointPairAssignedCount]
  unfold pairCountsOK
  rw [List.all_eq_true]
  intro count hmem
  rcases List.mem_map.mp hmem with ⟨pointPair, hpair, rfl⟩
  apply decide_eq_true
  have hleAll :
      pointPairAssignedCount shadow assigned pointPair <=
        pointPairClassCount shadow pointPair.fst pointPair.snd := by
    unfold pointPairAssignedCount
    rw [pointPairClassCount_eq_countP]
    exact countP_le_allLabels_of_fragment_prefix hprefix
  exact Nat.le_trans hleAll (hcount pointPair.fst pointPair.snd hpair)

theorem noThreeOK_of_pairCountsOK_shadowPairCountsForAssigned_allLabels
    {{shadow : Shadow}}
    (hcounts :
      pairCountsOK (shadowPairCountsForAssigned shadow allLabels) = true) :
    noThreeOK shadow = true := by
  unfold noThreeOK
  rw [List.all_eq_true]
  intro pointPair hpair
  unfold pairCountsOK at hcounts
  rw [List.all_eq_true] at hcounts
  apply decide_eq_true
  have hmem :
      pointPairClassCount shadow pointPair.fst pointPair.snd ∈
        shadowPairCountsForAssigned shadow allLabels := by
    rw [shadowPairCountsForAssigned_eq_map_pointPairAssignedCount]
    exact List.mem_map.mpr ⟨pointPair, hpair, by
      rcases pointPair with ⟨x, y⟩
      simp [pointPairAssignedCount, pointPairClassCount_eq_countP]⟩
  exact of_decide_eq_true (hcounts _ hmem)

theorem noThreeOK_of_PrefixPairCountsOK
    {{shadow : Shadow}}
    (hcounts : PrefixPairCountsOK shadow) :
    noThreeOK shadow = true := by
  have hfullPrefix :
      fullFragmentSearchAssigned ∈ fragmentSearchAssignedPrefixes := by
    simp [fragmentSearchAssignedPrefixes, fullFragmentSearchAssigned]
  have hcountsFull :
      pairCountsOK
        (shadowPairCountsForAssigned shadow fullFragmentSearchAssigned) =
          true :=
    hcounts fullFragmentSearchAssigned hfullPrefix
  unfold noThreeOK
  rw [List.all_eq_true]
  intro pointPair hpair
  unfold pairCountsOK at hcountsFull
  rw [List.all_eq_true] at hcountsFull
  apply decide_eq_true
  have hmem :
      pointPairClassCount shadow pointPair.fst pointPair.snd ∈
        shadowPairCountsForAssigned shadow fullFragmentSearchAssigned := by
    rw [shadowPairCountsForAssigned_eq_map_pointPairAssignedCount]
    exact List.mem_map.mpr ⟨pointPair, hpair, by
      rcases pointPair with ⟨x, y⟩
      unfold pointPairAssignedCount
      rw [pointPairClassCount_eq_countP]
      have hperm : fullFragmentSearchAssigned.Perm allLabels := by
        native_decide
      simpa using hperm.countP_eq
        (fun center =>
          pointPairHitByCenterMask center (shadow.centerMask center) (x, y))⟩
  exact of_decide_eq_true (hcountsFull _ hmem)

theorem pairCountsOK_shadowPairCountsForAssigned_of_searchPairCountsOK
    {{shadow : Shadow}} {{assigned : List Label}}
    (hcounts : searchPairCountsOK shadow = true)
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes) :
    pairCountsOK (shadowPairCountsForAssigned shadow assigned) = true := by
  unfold searchPairCountsOK at hcounts
  exact list_all_eq_true_of_mem
    (items := fragmentSearchAssignedPrefixes)
    (p := fun assigned => pairCountsOK (shadowPairCountsForAssigned shadow assigned))
    (a := assigned) hcounts hprefix

theorem pairCountsOK_shadowPairCountsForAssigned_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}} {{assigned : List Label}}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes) :
    pairCountsOK (shadowPairCountsForAssigned shadow assigned) = true := by
  exact pairCountsOK_shadowPairCountsForAssigned_of_searchPairCountsOK
    (searchPairCountsOK_of_isValidPinnedFragment hvalid) hprefix

theorem incrementPairCounts_eq_shadowPairCountsForAssigned_cons
    {{shadow : Shadow}} {{center : Label}} {{assigned : List Label}}
    {{mask : Nat}} {{counts : List Nat}}
    (hmask : mask = shadow.centerMask center)
    (hcounts : counts = shadowPairCountsForAssigned shadow assigned) :
    incrementPairCounts center mask counts =
      shadowPairCountsForAssigned shadow (center :: assigned) := by
  subst mask
  subst counts
  rfl

theorem setCenterMask_eq_shadowMasksForAssigned_cons
    {{shadow : Shadow}} {{center : Label}} {{assigned : List Label}}
    {{mask : Nat}} {{masks : List Nat}}
    (hmask : mask = shadow.centerMask center)
    (hmasks : masks = shadowMasksForAssigned shadow assigned) :
    setCenterMask masks center mask =
      shadowMasksForAssigned shadow (center :: assigned) := by
  subst mask
  subst masks
  rfl

theorem shadowMasksForFullFragmentSearchAssigned_eq_of_hasTenMasks
    {{shadow : Shadow}} (h : shadow.hasTenMasks = true) :
    shadowMasksForAssigned shadow fullFragmentSearchAssigned = shadow.masks := by
  cases shadow with
  | mk masks =>
      simp [Shadow.hasTenMasks, labelCount] at h
      cases masks with
      | nil => simp at h
      | cons m0 masks =>
      cases masks with
      | nil => simp at h
      | cons m1 masks =>
      cases masks with
      | nil => simp at h
      | cons m2 masks =>
      cases masks with
      | nil => simp at h
      | cons m3 masks =>
      cases masks with
      | nil => simp at h
      | cons m4 masks =>
      cases masks with
      | nil => simp at h
      | cons m5 masks =>
      cases masks with
      | nil => simp at h
      | cons m6 masks =>
      cases masks with
      | nil => simp at h
      | cons m7 masks =>
      cases masks with
      | nil => simp at h
      | cons m8 masks =>
      cases masks with
      | nil => simp at h
      | cons m9 masks =>
      cases masks with
      | nil => simp [shadowMasksForAssigned, fullFragmentSearchAssigned,
          emptyShadowMasks, setCenterMask, setNth, Shadow.centerMask, Label.index]
      | cons m10 masks => simp at h

theorem centerMaskOf_shadowMasksForAssigned_of_mem
    {{shadow : Shadow}} {{assigned : List Label}} {{other : Label}}
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes)
    (hmem : other ∈ assigned) :
    centerMaskOf (shadowMasksForAssigned shadow assigned) other =
      shadow.centerMask other := by
  simp only [fragmentSearchAssignedPrefixes, List.mem_cons, List.not_mem_nil, or_false] at hprefix
  rcases hprefix with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals
    cases other <;>
      simp [shadowMasksForAssigned, emptyShadowMasks, centerMaskOf, setCenterMask,
        setNth, Shadow.centerMask, Label.index] at hmem ⊢

theorem mem_fragmentSearchAux_nil_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}} {{assigned : List Label}}
    {{masks pairCounts : List Nat}}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hmasks : masks = shadow.masks) :
    shadow.masks ∈ fragmentSearchAux sstar assigned masks pairCounts [] := by
  subst masks
  unfold fragmentSearchAux
  simpa using hvalid

theorem mem_fragmentSearchAux_cons
    {{target masks pairCounts : List Nat}} {{sstar center : Label}}
    {{assigned : List Label}} {{candidates : List Nat}}
    {{rest : List (Label × List Nat)}} {{mask : Nat}}
    (hmem : mask ∈ candidates)
    (hsep : assignedSeparationOK center mask assigned masks = true)
    (hcounts : pairCountsOK (incrementPairCounts center mask pairCounts) = true)
    (htail : target ∈ fragmentSearchAux sstar (center :: assigned)
      (setCenterMask masks center mask)
      (incrementPairCounts center mask pairCounts) rest) :
    target ∈ fragmentSearchAux sstar assigned masks pairCounts
      ((center, candidates) :: rest) := by
  unfold fragmentSearchAux
  exact List.mem_flatMap.mpr ⟨mask, hmem, by simpa [hsep, hcounts] using htail⟩

theorem maskNormalized_of_candidateMaskOK
    {{sstar center : Label}} {{mask : Nat}}
    (h : candidateMaskOK sstar center mask = true) :
    maskNormalized mask = true := by
  simp only [candidateMaskOK, Bool.and_eq_true] at h
  exact h.1.1.1.1.1.1.1.1

theorem mem_allNormalizedMasks_of_maskNormalized {{mask : Nat}}
    (h : maskNormalized mask = true) :
    mask ∈ allNormalizedMasks := by
  have hdec : decide (mask < maskBound) = true := by
    simpa [maskNormalized] using h
  rw [allNormalizedMasks]
  exact List.mem_range.mpr (of_decide_eq_true hdec)

section CenterUSupport

open Label

private def centerUSupportW : Finset Label := {{.w, .Pw, .Pu}}
private def centerUSupportV : Finset Label := {{.v, .Q1, .Q2}}
private def centerUSupportR : Finset Label := {{.s1, .s2, .s3}}
private def centerUSupportP : Finset Label := {{.Pw, .Pu}}

def CenterUSupportShape (sstar : Label) (xs : List Label) : Prop :=
  (∃ x ∈ centerUSupportV, ∃ a b, a ∈ centerUSupportR ∧ b ∈ centerUSupportR ∧ a ≠ b ∧ xs.toFinset = {{w, x, a, b}}) ∨
  (∃ p ∈ centerUSupportP, ∃ x ∈ centerUSupportV, ∃ a b, a ∈ centerUSupportR ∧ b ∈ centerUSupportR ∧ a ≠ b ∧
    a ≠ sstar ∧ b ≠ sstar ∧ xs.toFinset = {{p, x, a, b}}) ∨
  (∃ x ∈ centerUSupportV, xs.toFinset = {{x, s1, s2, s3}}) ∨ xs.toFinset = {{w, s1, s2, s3}}

private lemma part_subset {{T : Finset Label}} (hu : u ∉ T) : T ⊆ centerUSupportW ∪ centerUSupportV ∪ centerUSupportR := by
  intro x hx
  cases x <;> simp_all [centerUSupportW, centerUSupportV, centerUSupportR]

private lemma groups_disjoint : Disjoint centerUSupportW centerUSupportV ∧ Disjoint centerUSupportW centerUSupportR ∧ Disjoint centerUSupportV centerUSupportR := by
  have hWV : Disjoint centerUSupportW centerUSupportV := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxW hxV
    cases x <;> simp [centerUSupportW, centerUSupportV] at hxW hxV
  have hWR : Disjoint centerUSupportW centerUSupportR := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxW hxR
    cases x <;> simp [centerUSupportW, centerUSupportR] at hxW hxR
  have hVR : Disjoint centerUSupportV centerUSupportR := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxV hxR
    cases x <;> simp [centerUSupportV, centerUSupportR] at hxV hxR
  exact ⟨hWV, hWR, hVR⟩

theorem centerUSupportShape_of_card_four
    {{sstar : Label}} {{xs : List Label}}
    (hnd : xs.Nodup) (hlen : xs.length = 4) (hu : u ∉ xs)
    (hW : (xs.toFinset ∩ centerUSupportW).card ≤ 1) (hV : (xs.toFinset ∩ centerUSupportV).card ≤ 1)
    (hstar : sstar = s1 ∨ sstar = s2 ∨ sstar = s3)
    (htrigger : sstar ∈ xs → Pw ∉ xs ∧ Pu ∉ xs) : CenterUSupportShape sstar xs := by
  let T : Finset Label := xs.toFinset
  have hTcard : T.card = 4 := by
    dsimp [T]
    rw [List.toFinset_card_of_nodup hnd, hlen]
  have hW' : (T ∩ centerUSupportW).card ≤ 1 := by simpa [T] using hW
  have hV' : (T ∩ centerUSupportV).card ≤ 1 := by simpa [T] using hV
  have hpart : T = (T ∩ centerUSupportW) ∪ (T ∩ centerUSupportV) ∪ (T ∩ centerUSupportR) := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_union.mp (part_subset (by simpa [T] using hu) hx) with hxWV | hxR
      · rcases Finset.mem_union.mp hxWV with hxW | hxV
        · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr
            (Or.inl (Finset.mem_inter.mpr ⟨hx, hxW⟩))))
        · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr
            (Or.inr (Finset.mem_inter.mpr ⟨hx, hxV⟩))))
      · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx, hxR⟩))
    · intro hx
      rcases Finset.mem_union.mp hx with hxWV | hxR
      · rcases Finset.mem_union.mp hxWV with hxW | hxV
        · exact (Finset.mem_inter.mp hxW).1
        · exact (Finset.mem_inter.mp hxV).1
      · exact (Finset.mem_inter.mp hxR).1
  obtain ⟨hWV, hWR, hVR⟩ := groups_disjoint
  have hTWV : Disjoint (T ∩ centerUSupportW) (T ∩ centerUSupportV) := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxW hxV
    exact (Finset.disjoint_left.mp hWV) (Finset.mem_inter.mp hxW).2
      (Finset.mem_inter.mp hxV).2
  have hTWR : Disjoint (T ∩ centerUSupportW) (T ∩ centerUSupportR) := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxW hxR
    exact (Finset.disjoint_left.mp hWR) (Finset.mem_inter.mp hxW).2
      (Finset.mem_inter.mp hxR).2
  have hTVR : Disjoint (T ∩ centerUSupportV) (T ∩ centerUSupportR) := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxV hxR
    exact (Finset.disjoint_left.mp hVR) (Finset.mem_inter.mp hxV).2
      (Finset.mem_inter.mp hxR).2
  have hTWVR : Disjoint ((T ∩ centerUSupportW) ∪ (T ∩ centerUSupportV)) (T ∩ centerUSupportR) := by
    refine Finset.disjoint_left.mpr ?_
    intro x hxWV hxR
    rcases Finset.mem_union.mp hxWV with hxW | hxV
    · exact (Finset.disjoint_left.mp hTWR) hxW hxR
    · exact (Finset.disjoint_left.mp hTVR) hxV hxR
  have hcards : 4 = (T ∩ centerUSupportW).card + (T ∩ centerUSupportV).card + (T ∩ centerUSupportR).card := by
    have h := hTcard
    rw [hpart, Finset.card_union_of_disjoint hTWVR,
      Finset.card_union_of_disjoint hTWV] at h
    omega
  have hWcases : (T ∩ centerUSupportW).card = 0 ∨ (T ∩ centerUSupportW).card = 1 := by omega
  have hVcases : (T ∩ centerUSupportV).card = 0 ∨ (T ∩ centerUSupportV).card = 1 := by omega
  have hRle : (T ∩ centerUSupportR).card ≤ 3 := by
    have h := Finset.card_le_card (Finset.inter_subset_right : T ∩ centerUSupportR ⊆ centerUSupportR)
    simpa [centerUSupportR] using h
  rcases hWcases with hW0 | hW1 <;> rcases hVcases with hV0 | hV1
  · exfalso; omega
  · have hR3 : (T ∩ centerUSupportR).card = 3 := by omega
    obtain ⟨x, hx⟩ := Finset.card_eq_one.mp hV1
    have hxV : x ∈ centerUSupportV := (Finset.mem_inter.mp (by rw [hx]; simp)).2
    have hR_eq : T ∩ centerUSupportR = centerUSupportR :=
      Finset.eq_of_subset_of_card_le Finset.inter_subset_right (by
        simpa [centerUSupportR] using (show 3 ≤ (T ∩ centerUSupportR).card by omega))
    have hTeq : T = {{x, s1, s2, s3}} := by
      calc
        T = (T ∩ centerUSupportW) ∪ (T ∩ centerUSupportV) ∪ (T ∩ centerUSupportR) := hpart
        _ = (∅ : Finset Label) ∪ {{x}} ∪ centerUSupportR := by
          rw [Finset.card_eq_zero.mp hW0, hx, hR_eq]
        _ = {{x, s1, s2, s3}} := by ext z; simp [centerUSupportR, or_left_comm, or_assoc, or_comm]
    exact Or.inr (Or.inr (Or.inl ⟨x, hxV, by simpa [T] using hTeq⟩))
  · have hR3 : (T ∩ centerUSupportR).card = 3 := by omega
    obtain ⟨p, hp⟩ := Finset.card_eq_one.mp hW1
    have hpW : p ∈ centerUSupportW := (Finset.mem_inter.mp (by rw [hp]; simp)).2
    have hp_cases : p = w ∨ p = Pw ∨ p = Pu := by simpa [centerUSupportW] using hpW
    have hR_eq : T ∩ centerUSupportR = centerUSupportR :=
      Finset.eq_of_subset_of_card_le Finset.inter_subset_right (by
        simpa [centerUSupportR] using (show 3 ≤ (T ∩ centerUSupportR).card by omega))
    rcases hp_cases with rfl | rfl | rfl
    · have hTeq : T = {{w, s1, s2, s3}} := by
        calc
          T = (T ∩ centerUSupportW) ∪ (T ∩ centerUSupportV) ∪ (T ∩ centerUSupportR) := hpart
          _ = {{w}} ∪ (∅ : Finset Label) ∪ centerUSupportR := by
            rw [hp, Finset.card_eq_zero.mp hV0, hR_eq]
          _ = {{w, s1, s2, s3}} := by ext z; simp [centerUSupportR, or_left_comm, or_assoc, or_comm]
      exact Or.inr (Or.inr (Or.inr (by simpa [T] using hTeq)))
    · exfalso
      have hsR : sstar ∈ centerUSupportR := by rcases hstar with rfl | rfl | rfl <;> simp [centerUSupportR]
      have hsTR : sstar ∈ T ∩ centerUSupportR := by rw [hR_eq]; exact hsR
      have hsT : sstar ∈ T := (Finset.mem_inter.mp hsTR).1
      have hsxs : sstar ∈ xs := List.mem_toFinset.mp (by simpa [T] using hsT)
      have hpTW : Pw ∈ T ∩ centerUSupportW := by rw [hp]; simp
      have hpT : Pw ∈ T := (Finset.mem_inter.mp hpTW).1
      exact (htrigger hsxs).1 (List.mem_toFinset.mp (by simpa [T] using hpT))
    · exfalso
      have hsR : sstar ∈ centerUSupportR := by rcases hstar with rfl | rfl | rfl <;> simp [centerUSupportR]
      have hsTR : sstar ∈ T ∩ centerUSupportR := by rw [hR_eq]; exact hsR
      have hsT : sstar ∈ T := (Finset.mem_inter.mp hsTR).1
      have hsxs : sstar ∈ xs := List.mem_toFinset.mp (by simpa [T] using hsT)
      have hpTW : Pu ∈ T ∩ centerUSupportW := by rw [hp]; simp
      have hpT : Pu ∈ T := (Finset.mem_inter.mp hpTW).1
      exact (htrigger hsxs).2 (List.mem_toFinset.mp (by simpa [T] using hpT))
  · have hR2 : (T ∩ centerUSupportR).card = 2 := by omega
    obtain ⟨p, hp⟩ := Finset.card_eq_one.mp hW1
    obtain ⟨x, hx⟩ := Finset.card_eq_one.mp hV1
    have hpW : p ∈ centerUSupportW := (Finset.mem_inter.mp (by rw [hp]; simp)).2
    have hxV : x ∈ centerUSupportV := (Finset.mem_inter.mp (by rw [hx]; simp)).2
    obtain ⟨a, b, hab, hR⟩ := Finset.card_eq_two.mp hR2
    have haTR : a ∈ T ∩ centerUSupportR := by rw [hR]; simp
    have hbTR : b ∈ T ∩ centerUSupportR := by rw [hR]; simp
    have haR : a ∈ centerUSupportR := (Finset.mem_inter.mp haTR).2
    have hbR : b ∈ centerUSupportR := (Finset.mem_inter.mp hbTR).2
    have hTeq : T = {{p, x, a, b}} := by
      calc
        T = (T ∩ centerUSupportW) ∪ (T ∩ centerUSupportV) ∪ (T ∩ centerUSupportR) := hpart
        _ = {{p}} ∪ {{x}} ∪ {{a, b}} := by rw [hp, hx, hR]
        _ = {{p, x, a, b}} := by ext z; simp [or_left_comm, or_assoc, or_comm]
    have hp_cases : p = w ∨ p = Pw ∨ p = Pu := by simpa [centerUSupportW] using hpW
    rcases hp_cases with rfl | rfl | rfl
    · exact Or.inl ⟨x, hxV, a, b, haR, hbR, hab, by simpa [T] using hTeq⟩
    · have hsT : sstar ∉ T := by
        intro hsT
        have hsxs : sstar ∈ xs := List.mem_toFinset.mp (by simpa [T] using hsT)
        have hpTW : Pw ∈ T ∩ centerUSupportW := by rw [hp]; simp
        have hpT : Pw ∈ T := (Finset.mem_inter.mp hpTW).1
        exact (htrigger hsxs).1 (List.mem_toFinset.mp (by simpa [T] using hpT))
      have ha_ne : a ≠ sstar := by
        intro h; apply hsT; simpa [h] using (Finset.mem_inter.mp haTR).1
      have hb_ne : b ≠ sstar := by
        intro h; apply hsT; simpa [h] using (Finset.mem_inter.mp hbTR).1
      refine Or.inr (Or.inl ⟨Pw, ?_, ?_⟩)
      · simp [centerUSupportP]
      · refine ⟨x, ?_, ?_⟩
        · exact hxV
        · refine ⟨a, b, ?_⟩
          exact ⟨haR, hbR, hab, ha_ne, hb_ne, by simpa [T] using hTeq⟩
    · have hsT : sstar ∉ T := by
        intro hsT
        have hsxs : sstar ∈ xs := List.mem_toFinset.mp (by simpa [T] using hsT)
        have hpTW : Pu ∈ T ∩ centerUSupportW := by rw [hp]; simp
        have hpT : Pu ∈ T := (Finset.mem_inter.mp hpTW).1
        exact (htrigger hsxs).2 (List.mem_toFinset.mp (by simpa [T] using hpT))
      have ha_ne : a ≠ sstar := by
        intro h; apply hsT; simpa [h] using (Finset.mem_inter.mp haTR).1
      have hb_ne : b ≠ sstar := by
        intro h; apply hsT; simpa [h] using (Finset.mem_inter.mp hbTR).1
      refine Or.inr (Or.inl ⟨Pu, ?_, ?_⟩)
      · simp [centerUSupportP]
      · refine ⟨x, ?_, ?_⟩
        · exact hxV
        · refine ⟨a, b, ?_⟩
          exact ⟨haR, hbR, hab, ha_ne, hb_ne, by simpa [T] using hTeq⟩

private theorem surplus_u_support_data {{sstar : Label}} (mask : Nat)
    (h : candidateMaskOK sstar .u mask = true) :
    mask < 2 ^ labelCount ∧ maskCard mask = 4 ∧
      maskHas mask .u = false ∧
      maskInterCard mask cvNoUMask ≤ 1 ∧
      maskInterCard mask cwNoUMask ≤ 1 ∧
      (labelsOfMaskBits mask).length = 4 := by
  simp only [candidateMaskOK, Bool.and_eq_true] at h
  have hnormcard := h.1.1.1.1.1.1.1
  have hnorm : maskNormalized mask = true := hnormcard.1
  have hcard : maskCard mask = 4 := by simpa using hnormcard.2
  have hnotu : maskHas mask .u = false := by simpa using h.1.1.1.1.1.1.2
  have hcondition := h.1.1.1.2
  simp at hcondition
  have hcv : maskInterCard mask cvNoUMask ≤ 1 := hcondition.1
  have hcw : maskInterCard mask cwNoUMask ≤ 1 := hcondition.2
  have hlt : mask < 2 ^ labelCount := by
    simpa [maskNormalized, maskBound] using (of_decide_eq_true hnorm)
  have hsupp : (labelsOfMaskBits mask).length = 4 := by
    rw [← maskCard_eq_length_labelsOfMaskBits]
    · exact hcard
    · exact hlt
  exact ⟨hlt, hcard, hnotu, hcv, hcw, hsupp⟩

theorem centerUSupportShape_of_candidateMaskOK_surplus_u {{sstar : Label}} {{mask : Nat}}
    (h : candidateMaskOK sstar .u mask = true)
    (hsstar : isSurplusStar sstar = true) :
    CenterUSupportShape sstar (labelsOfMaskBits mask) := by
  obtain ⟨hlt, hcard, hnotu, hcv, hcw, hsupp⟩ := surplus_u_support_data mask h
  have hmem : ∀ label : Label,
      label ∈ labelsOfMaskBits mask ↔ maskHas mask label = true :=
    fun label => mem_labelsOfMaskBits_iff hlt label
  have hW : ((labelsOfMaskBits mask).toFinset ∩ centerUSupportW).card ≤ 1 := by
    refine Finset.card_le_one.mpr ?_
    intro a ha b hb
    have haW := (Finset.mem_inter.mp ha).2
    have hbW := (Finset.mem_inter.mp hb).2
    have haM := (hmem a).mp (List.mem_toFinset.mp (Finset.mem_inter.mp ha).1)
    have hbM := (hmem b).mp (List.mem_toFinset.mp (Finset.mem_inter.mp hb).1)
    have ha_cases : a = .w ∨ a = .Pw ∨ a = .Pu := by simpa [centerUSupportW] using haW
    have hb_cases : b = .w ∨ b = .Pw ∨ b = .Pu := by simpa [centerUSupportW] using hbW
    have hcvbits : ∀ label : Label,
        maskHas cvNoUMask label = true ↔ label = .w ∨ label = .Pw ∨ label = .Pu := by
      intro label
      cases label <;> decide
    rcases ha_cases with rfl | rfl | rfl <;>
      rcases hb_cases with rfl | rfl | rfl <;>
      try rfl
    all_goals unfold maskInterCard at hcv
    all_goals simp only [allLabels, List.foldl] at hcv
    all_goals rw [haM, hbM] at hcv
    all_goals simp [hcvbits] at hcv
    all_goals split at hcv <;> omega
  have hV : ((labelsOfMaskBits mask).toFinset ∩ centerUSupportV).card ≤ 1 := by
    refine Finset.card_le_one.mpr ?_
    intro a ha b hb
    have haV := (Finset.mem_inter.mp ha).2
    have hbV := (Finset.mem_inter.mp hb).2
    have haM := (hmem a).mp (List.mem_toFinset.mp (Finset.mem_inter.mp ha).1)
    have hbM := (hmem b).mp (List.mem_toFinset.mp (Finset.mem_inter.mp hb).1)
    have ha_cases : a = .v ∨ a = .Q1 ∨ a = .Q2 := by simpa [centerUSupportV] using haV
    have hb_cases : b = .v ∨ b = .Q1 ∨ b = .Q2 := by simpa [centerUSupportV] using hbV
    have hcwb : ∀ label : Label,
        maskHas cwNoUMask label = true ↔ label = .v ∨ label = .Q1 ∨ label = .Q2 := by
      intro label
      cases label <;> decide
    rcases ha_cases with rfl | rfl | rfl <;>
      rcases hb_cases with rfl | rfl | rfl <;>
      try rfl
    all_goals unfold maskInterCard at hcw
    all_goals simp only [allLabels, List.foldl] at hcw
    all_goals rw [haM, hbM] at hcw
    all_goals simp [hcwb] at hcw
    all_goals split at hcw <;> omega
  have htrigger : sstar ∈ labelsOfMaskBits mask →
      .Pw ∉ labelsOfMaskBits mask ∧ .Pu ∉ labelsOfMaskBits mask := by
    intro hs
    constructor
    · intro hp
      have hsM : maskHas mask sstar = true :=
        (hmem sstar).mp hs
      have hpM : maskHas mask .Pw = true :=
        (hmem .Pw).mp hp
      have hcount : 1 ≤ maskInterCard mask uPwPuMask := by
        have hbits : ∀ label : Label,
            maskHas uPwPuMask label = true ↔ label = .u ∨ label = .Pw ∨ label = .Pu := by
          intro label
          cases label <;> decide
        unfold maskInterCard
        simp only [allLabels, List.foldl]
        rw [hpM]
        simp [hbits]
        split <;> omega
      have hcountB : decide (1 ≤ maskInterCard mask uPwPuMask) = true :=
        decide_eq_true_eq.mpr hcount
      have hh := h
      simp [candidateMaskOK, localTriggerOKAt, hsM, hpM, hcountB] at hh
    · intro hp
      have hsM : maskHas mask sstar = true :=
        (hmem sstar).mp hs
      have hpM : maskHas mask .Pu = true :=
        (hmem .Pu).mp hp
      have hcount : 1 ≤ maskInterCard mask uPwPuMask := by
        have hbits : ∀ label : Label,
            maskHas uPwPuMask label = true ↔ label = .u ∨ label = .Pw ∨ label = .Pu := by
          intro label
          cases label <;> decide
        unfold maskInterCard
        simp only [allLabels, List.foldl]
        rw [hpM]
        simp [hbits]
      have hcountB : decide (1 ≤ maskInterCard mask uPwPuMask) = true :=
        decide_eq_true_eq.mpr hcount
      have hh := h
      simp [candidateMaskOK, localTriggerOKAt, hsM, hpM, hcountB] at hh
  have hnotu' : .u ∉ labelsOfMaskBits mask := by
    intro hu'
    have huM := (hmem .u).mp hu'
    simp [hnotu] at huM
  have hstar : sstar = .s1 ∨ sstar = .s2 ∨ sstar = .s3 := by
    cases sstar <;> simp [isSurplusStar] at hsstar ⊢
  exact centerUSupportShape_of_card_four (labelsOfMaskBits_nodup hlt) hsupp hnotu' hW hV
    hstar htrigger

private theorem maskOfLabels_eq_of_toFinset_eq
    {{xs ys : List Label}} (hxs : xs.Nodup) (hys : ys.Nodup)
    (hset : xs.toFinset = ys.toFinset) :
    maskOfLabels xs = maskOfLabels ys := by
  have hp : List.Perm xs ys :=
    (List.perm_ext_iff_of_nodup hxs hys).mpr (by
      intro x
      simpa only [List.mem_toFinset] using (Finset.ext_iff.mp hset x))
  rw [maskOfLabels_eq_sum, maskOfLabels_eq_sum]
  exact (hp.map (fun label => label.bit)).sum_eq

private lemma nodup_w_v_r {{x a b : Label}}
    (hx : x ∈ centerUSupportV) (ha : a ∈ centerUSupportR) (hb : b ∈ centerUSupportR) (hab : a ≠ b) :
    [.w, x, a, b].Nodup := by
  obtain ⟨hWV, hWR, hVR⟩ := groups_disjoint
  have hwx : w ≠ x := by
    intro h
    subst x
    exact (Finset.disjoint_left.mp hWV) (by simp [centerUSupportW]) hx
  have hwa : w ≠ a := by
    intro h
    subst a
    exact (Finset.disjoint_left.mp hWR) (by simp [centerUSupportW]) ha
  have hwb : w ≠ b := by
    intro h
    subst b
    exact (Finset.disjoint_left.mp hWR) (by simp [centerUSupportW]) hb
  have hxa : x ≠ a := by
    intro h
    subst a
    exact (Finset.disjoint_left.mp hVR) hx ha
  have hxb : x ≠ b := by
    intro h
    subst b
    exact (Finset.disjoint_left.mp hVR) hx hb
  simp [hwx, hwa, hwb, hxa, hxb, hab]

private lemma nodup_p_v_r {{p x a b : Label}}
    (hp : p ∈ centerUSupportP) (hx : x ∈ centerUSupportV) (ha : a ∈ centerUSupportR) (hb : b ∈ centerUSupportR) (hab : a ≠ b) :
    [p, x, a, b].Nodup := by
  obtain ⟨hWV, hWR, hVR⟩ := groups_disjoint
  have hp' : p = .Pw ∨ p = .Pu := by simpa [centerUSupportP] using hp
  have hpW : p ∈ centerUSupportW := by
    rcases hp' with rfl | rfl <;> simp [centerUSupportW]
  have hpx : p ≠ x := by
    intro h
    subst x
    exact (Finset.disjoint_left.mp hWV) hpW hx
  have hpa : p ≠ a := by
    intro h
    subst a
    exact (Finset.disjoint_left.mp hWR) hpW ha
  have hpb : p ≠ b := by
    intro h
    subst b
    exact (Finset.disjoint_left.mp hWR) hpW hb
  have hxa : x ≠ a := by
    intro h
    subst a
    exact (Finset.disjoint_left.mp hVR) hx ha
  have hxb : x ≠ b := by
    intro h
    subst b
    exact (Finset.disjoint_left.mp hVR) hx hb
  simp [hpx, hpa, hpb, hxa, hxb, hab]

private lemma nodup_v_s123 {{x : Label}} (hx : x ∈ centerUSupportV) :
    [x, .s1, .s2, .s3].Nodup := by
  obtain ⟨_, _, hVR⟩ := groups_disjoint
  have h1 : x ≠ .s1 := by
    intro h
    subst x
    exact (Finset.disjoint_left.mp hVR) hx (by simp [centerUSupportR])
  have h2 : x ≠ .s2 := by
    intro h
    subst x
    exact (Finset.disjoint_left.mp hVR) hx (by simp [centerUSupportR])
  have h3 : x ≠ .s3 := by
    intro h
    subst x
    exact (Finset.disjoint_left.mp hVR) hx (by simp [centerUSupportR])
  simp [h1, h2, h3]

theorem filter_range_eq_of_strictSorted_bounded
    (p : Nat → Bool) (n : Nat) (xs : List Nat)
    (hsorted : xs.Pairwise (· < ·))
    (hbound : ∀ x ∈ xs, x < n)
    (hmatch : ∀ x, x < n → (p x = true ↔ x ∈ xs)) :
    (List.range n).filter p = xs := by
  have hrange : ∀ m : Nat, (List.range m).Pairwise (· < ·) := by
    intro m
    induction m with
    | zero => simp
    | succ n ih =>
        rw [List.range_succ]
        apply List.pairwise_append.mpr
        refine ⟨ih, by simp, ?_⟩
        intro x hx y hy
        simp at hy
        subst y
        exact List.mem_range.mp hx
  have hfilter : ((List.range n).filter p).Pairwise (· < ·) :=
    List.Pairwise.filter p (hrange n)
  have hnodup_filter : ((List.range n).filter p).Nodup := hfilter.nodup
  have hnodup_xs : xs.Nodup := hsorted.nodup
  have hmem : ∀ x, x ∈ (List.range n).filter p ↔ x ∈ xs := by
    intro x
    rw [List.mem_filter]
    constructor
    · intro hx
      exact (hmatch x (List.mem_range.mp hx.1)).mp hx.2
    · intro hx
      have hxn : x < n := hbound x hx
      exact ⟨List.mem_range.mpr hxn, (hmatch x hxn).mpr hx⟩
  have hperm : List.Perm ((List.range n).filter p) xs :=
    (List.perm_ext_iff_of_nodup hnodup_filter hnodup_xs).mpr hmem
  exact List.Perm.eq_of_pairwise' hfilter hsorted hperm

def centerUSurplusTable : Label → List Nat
  | .s1 => [30, 46, 54, 58, 60, 114, 178, 284, 300, 308, 312, 368,
      432, 540, 556, 564, 568, 624, 688]
  | .s2 => [30, 46, 54, 58, 60, 106, 170, 284, 300, 308, 312, 360,
      424, 540, 556, 564, 568, 616, 680]
  | .s3 => [30, 46, 54, 58, 60, 90, 154, 284, 300, 308, 312, 344,
      408, 540, 556, 564, 568, 600, 664]
  | _ => []

theorem candidateMasks_surplusStar_u_eq_centerUSurplusTable {{sstar : Label}}
    (hsstar : isSurplusStar sstar = true) :
    candidateMasks sstar .u = centerUSurplusTable sstar := by
  cases sstar <;> simp [isSurplusStar, centerUSurplusTable, candidateMasks] at hsstar ⊢

theorem candidateMasks_s1_u_eq_centerUSurplusTable :
    candidateMasks .s1 .u = centerUSurplusTable .s1 := by rfl

theorem candidateMasks_s2_u_eq_centerUSurplusTable :
    candidateMasks .s2 .u = centerUSurplusTable .s2 := by rfl

theorem candidateMasks_s3_u_eq_centerUSurplusTable :
    candidateMasks .s3 .u = centerUSurplusTable .s3 := by rfl

theorem candidateMask_mem_centerUSurplusTable_of_supportShape {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true)
    (hlt : mask < 2 ^ labelCount)
    (hfamily : CenterUSupportShape sstar (labelsOfMaskBits mask)) :
    mask ∈ centerUSurplusTable sstar := by
  have hrec : maskOfLabels (labelsOfMaskBits mask) = mask :=
    maskOfLabels_labelsOfMaskBits hlt
  rcases hfamily with h | h | h | h
  · rcases h with ⟨x, hx, a, b, ha, hb, hab, hset⟩
    have hx' : x = .v ∨ x = .Q1 ∨ x = .Q2 := by simpa [centerUSupportV] using hx
    have ha' : a = .s1 ∨ a = .s2 ∨ a = .s3 := by simpa [centerUSupportR] using ha
    have hb' : b = .s1 ∨ b = .s2 ∨ b = .s3 := by simpa [centerUSupportR] using hb
    have hmask : mask = maskOfLabels [.w, x, a, b] := by
      calc
        mask = maskOfLabels (labelsOfMaskBits mask) := hrec.symm
        _ = maskOfLabels [.w, x, a, b] :=
          maskOfLabels_eq_of_toFinset_eq (labelsOfMaskBits_nodup hlt)
            (nodup_w_v_r hx ha hb hab) (by simpa using hset)
    rcases hx' with rfl | rfl | rfl <;>
      rcases ha' with rfl | rfl | rfl <;>
      rcases hb' with rfl | rfl | rfl <;>
      cases sstar <;>
      simp [isSurplusStar, centerUSurplusTable] at hsstar hab ⊢
    all_goals rw [hmask]
    all_goals decide
  · rcases h with ⟨p, hp, x, hx, a, b, ha, hb, hab, haS, hbS, hset⟩
    have hp' : p = .Pw ∨ p = .Pu := by simpa [centerUSupportP] using hp
    have hx' : x = .v ∨ x = .Q1 ∨ x = .Q2 := by simpa [centerUSupportV] using hx
    have ha' : a = .s1 ∨ a = .s2 ∨ a = .s3 := by simpa [centerUSupportR] using ha
    have hb' : b = .s1 ∨ b = .s2 ∨ b = .s3 := by simpa [centerUSupportR] using hb
    have hmask : mask = maskOfLabels [p, x, a, b] := by
      calc
        mask = maskOfLabels (labelsOfMaskBits mask) := hrec.symm
        _ = maskOfLabels [p, x, a, b] :=
          maskOfLabels_eq_of_toFinset_eq (labelsOfMaskBits_nodup hlt)
            (nodup_p_v_r hp hx ha hb hab) (by simpa using hset)
    rcases hp' with rfl | rfl <;>
      rcases hx' with rfl | rfl | rfl <;>
      rcases ha' with rfl | rfl | rfl <;>
      rcases hb' with rfl | rfl | rfl <;>
      cases sstar <;>
      simp [isSurplusStar, centerUSurplusTable] at hsstar hab haS hbS ⊢
    all_goals rw [hmask]
    all_goals decide
  · rcases h with ⟨x, hx, hset⟩
    have hx' : x = .v ∨ x = .Q1 ∨ x = .Q2 := by simpa [centerUSupportV] using hx
    have hmask : mask = maskOfLabels [x, .s1, .s2, .s3] := by
      calc
        mask = maskOfLabels (labelsOfMaskBits mask) := hrec.symm
        _ = maskOfLabels [x, .s1, .s2, .s3] :=
          maskOfLabels_eq_of_toFinset_eq (labelsOfMaskBits_nodup hlt)
            (nodup_v_s123 hx) (by simpa using hset)
    rcases hx' with rfl | rfl | rfl <;>
      cases sstar <;>
      simp [isSurplusStar, centerUSurplusTable] at hsstar ⊢
    all_goals rw [hmask]
    all_goals decide
  · have hmask : mask = maskOfLabels [.w, .s1, .s2, .s3] := by
      calc
        mask = maskOfLabels (labelsOfMaskBits mask) := hrec.symm
        _ = maskOfLabels [.w, .s1, .s2, .s3] :=
          maskOfLabels_eq_of_toFinset_eq (labelsOfMaskBits_nodup hlt)
            (by decide) (by simpa using h)
    cases sstar <;>
    simp [isSurplusStar, centerUSurplusTable] at hsstar ⊢
    all_goals rw [hmask]
    all_goals decide

theorem candidateMaskOK_of_mem_centerUSurplusTable {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true)
    (hm : mask ∈ centerUSurplusTable sstar) :
    candidateMaskOK sstar .u mask = true := by
  cases sstar <;> simp [isSurplusStar, centerUSurplusTable] at hsstar hm ⊢
  all_goals
    rcases hm with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
      rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
      decide

theorem mem_candidateMasks_of_candidateMaskOK_surplus_u {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true)
    (h : candidateMaskOK sstar .u mask = true) :
    mask ∈ candidateMasks sstar .u := by
  have hlt : mask < 2 ^ labelCount := (surplus_u_support_data mask h).1
  have hfamily := centerUSupportShape_of_candidateMaskOK_surplus_u h hsstar
  rw [candidateMasks_surplusStar_u_eq_centerUSurplusTable hsstar]
  exact candidateMask_mem_centerUSurplusTable_of_supportShape hsstar hlt hfamily

theorem candidateMaskOK_of_mem_candidateMasks_surplus_u {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true)
    (h : mask ∈ candidateMasks sstar .u) :
    candidateMaskOK sstar .u mask = true := by
  rw [candidateMasks_surplusStar_u_eq_centerUSurplusTable hsstar] at h
  exact candidateMaskOK_of_mem_centerUSurplusTable hsstar h

theorem candidateMaskOK_surplus_u_iff_mem_candidateMasks {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true) :
    candidateMaskOK sstar .u mask = true ↔ mask ∈ candidateMasks sstar .u := by
  constructor
  · exact mem_candidateMasks_of_candidateMaskOK_surplus_u hsstar
  · exact candidateMaskOK_of_mem_candidateMasks_surplus_u hsstar

theorem candidateMasks_surplusStar_u_eq_filter {{sstar : Label}}
    (hsstar : isSurplusStar sstar = true) :
    candidateMasks sstar .u = candidateMasksByFilter sstar .u := by
  rw [candidateMasks_surplusStar_u_eq_centerUSurplusTable hsstar]
  have hsorted : (centerUSurplusTable sstar).Pairwise (· < ·) := by
    cases sstar <;> decide
  have hbound : ∀ x ∈ centerUSurplusTable sstar, x < maskBound := by
    intro x hx
    cases sstar <;>
      simp only [centerUSurplusTable, List.mem_cons, List.not_mem_nil] at hx
    all_goals simp only [or_false] at hx
    all_goals
      rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
        rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
        norm_num [maskBound, labelCount]
  have hmatch : ∀ x, x < maskBound →
      (candidateMaskOK sstar .u x = true ↔ x ∈ centerUSurplusTable sstar) := by
    intro x hx
    have htable : x ∈ candidateMasks sstar .u ↔
        x ∈ centerUSurplusTable sstar := by
      rw [candidateMasks_surplusStar_u_eq_centerUSurplusTable hsstar]
    exact (candidateMaskOK_surplus_u_iff_mem_candidateMasks hsstar).trans htable
  have hfilter :
      (List.range maskBound).filter (candidateMaskOK sstar .u ·) =
        centerUSurplusTable sstar :=
    filter_range_eq_of_strictSorted_bounded
      (candidateMaskOK sstar .u) maskBound (centerUSurplusTable sstar)
      hsorted hbound hmatch
  simpa [candidateMasksByFilter, allNormalizedMasks] using hfilter.symm

private theorem candidateMasks_s1_u_eq_filter :
    candidateMasks .s1 .u = candidateMasksByFilter .s1 .u := by
  exact candidateMasks_surplusStar_u_eq_filter (by decide)

private theorem candidateMasks_s2_u_eq_filter :
    candidateMasks .s2 .u = candidateMasksByFilter .s2 .u := by
  exact candidateMasks_surplusStar_u_eq_filter (by decide)

private theorem candidateMasks_s3_u_eq_filter :
    candidateMasks .s3 .u = candidateMasksByFilter .s3 .u := by
  exact candidateMasks_surplusStar_u_eq_filter (by decide)

theorem candidateMasks_eq_filter_of_isSurplusStar_center_u {{sstar : Label}}
    (hsstar : isSurplusStar sstar = true) :
    candidateMasks sstar .u = candidateMasksByFilter sstar .u :=
  candidateMasks_surplusStar_u_eq_filter hsstar

end CenterUSupport

namespace CenterWSupport

def vOrSurplus : Finset Label := {{.v, .s1, .s2, .s3}}

def uOrPrivate : Finset Label := {{.u, .Pw, .Pu}}

def Shape (xs : List Label) : Prop :=
  ∃ x ∈ vOrSurplus, ∃ y ∈ uOrPrivate, xs.toFinset = {{x, y, .Q1, .Q2}}

private theorem toFinset_eq_four_of_mem
    {{xs : List Label}} {{a b c d : Label}}
    (hxs : xs.Nodup) (hlen : xs.length = 4) (habcd : [a, b, c, d].Nodup)
    (ha : a ∈ xs) (hb : b ∈ xs) (hc : c ∈ xs) (hd : d ∈ xs) :
    xs.toFinset = {{a, b, c, d}} := by
  symm
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl <;> simpa
  · calc
      xs.toFinset.card = xs.length := List.toFinset_card_of_nodup hxs
      _ = 4 := hlen
      _ = [a, b, c, d].length := rfl
      _ = [a, b, c, d].toFinset.card := (List.toFinset_card_of_nodup habcd).symm
      _ = ({{a, b, c, d}} : Finset Label).card := by simp
      _ ≤ ({{a, b, c, d}} : Finset Label).card := le_rfl

private theorem support_data {{sstar : Label}} {{mask : Nat}}
    (h : candidateMaskOK sstar .w mask = true) :
    mask < 2 ^ labelCount ∧ (labelsOfMaskBits mask).length = 4 ∧
      maskHas mask .Q1 = true ∧ maskHas mask .Q2 = true ∧
      maskInterCard mask cuNoWMask = 1 ∧ maskInterCard mask cvNoWMask = 1 := by
  simp only [candidateMaskOK, Bool.and_eq_true] at h
  have hnormcard := h.1.1.1.1.1.1.1
  have hnorm : maskNormalized mask = true := hnormcard.1
  have hcard : maskCard mask = 4 := by simpa using hnormcard.2
  have hw := h.1.1.1.1.2
  simp at hw
  have hlt : mask < 2 ^ labelCount := by
    simpa [maskNormalized, maskBound] using (of_decide_eq_true hnorm)
  have hlen : (labelsOfMaskBits mask).length = 4 := by
    rw [← maskCard_eq_length_labelsOfMaskBits hlt]
    exact hcard
  exact ⟨hlt, hlen, hw.1.1.1, hw.1.1.2, hw.1.2, hw.2⟩

theorem shape_of_candidateMaskOK {{sstar : Label}} {{mask : Nat}}
    (h : candidateMaskOK sstar .w mask = true) :
    Shape (labelsOfMaskBits mask) := by
  obtain ⟨hlt, hlen, hQ1, hQ2, hfirstCard, hsecondCard⟩ := support_data h
  have hmem : ∀ label : Label,
      label ∈ labelsOfMaskBits mask ↔ maskHas mask label = true :=
    fun label => mem_labelsOfMaskBits_iff hlt label
  have hfirst : ∃ x ∈ vOrSurplus, maskHas mask x = true := by
    have hbits : ∀ label : Label,
        maskHas cuNoWMask label = true ↔
          label = .v ∨ label = .s1 ∨ label = .s2 ∨ label = .s3 := by
      intro label
      cases label <;> decide
    by_cases hv : maskHas mask .v = true
    · exact ⟨.v, by simp [vOrSurplus], hv⟩
    by_cases hs1 : maskHas mask .s1 = true
    · exact ⟨.s1, by simp [vOrSurplus], hs1⟩
    by_cases hs2 : maskHas mask .s2 = true
    · exact ⟨.s2, by simp [vOrSurplus], hs2⟩
    by_cases hs3 : maskHas mask .s3 = true
    · exact ⟨.s3, by simp [vOrSurplus], hs3⟩
    unfold maskInterCard at hfirstCard
    simp only [allLabels, List.foldl] at hfirstCard
    simp [hbits, hv, hs1, hs2, hs3] at hfirstCard
  have hsecond : ∃ y ∈ uOrPrivate, maskHas mask y = true := by
    have hbits : ∀ label : Label,
        maskHas cvNoWMask label = true ↔ label = .u ∨ label = .Pw ∨ label = .Pu := by
      intro label
      cases label <;> decide
    by_cases hu : maskHas mask .u = true
    · exact ⟨.u, by simp [uOrPrivate], hu⟩
    by_cases hPw : maskHas mask .Pw = true
    · exact ⟨.Pw, by simp [uOrPrivate], hPw⟩
    by_cases hPu : maskHas mask .Pu = true
    · exact ⟨.Pu, by simp [uOrPrivate], hPu⟩
    unfold maskInterCard at hsecondCard
    simp only [allLabels, List.foldl] at hsecondCard
    simp [hbits, hu, hPw, hPu] at hsecondCard
  rcases hfirst with ⟨x, hx, hxmask⟩
  rcases hsecond with ⟨y, hy, hymask⟩
  refine ⟨x, hx, y, hy, ?_⟩
  have hxmem := (hmem x).mpr hxmask
  have hymem := (hmem y).mpr hymask
  have hQ1mem := (hmem .Q1).mpr hQ1
  have hQ2mem := (hmem .Q2).mpr hQ2
  rcases (by simpa [vOrSurplus] using hx : x = .v ∨ x = .s1 ∨ x = .s2 ∨ x = .s3) with
    rfl | rfl | rfl | rfl <;>
    rcases (by simpa [uOrPrivate] using hy : y = .u ∨ y = .Pw ∨ y = .Pu) with
      rfl | rfl | rfl <;>
    exact toFinset_eq_four_of_mem (labelsOfMaskBits_nodup hlt) hlen (by decide)
      hxmem hymem hQ1mem hQ2mem

def table : List Nat :=
  [771, 777, 785, 801, 834, 840, 848, 864, 898, 904, 912, 928]

theorem mem_table_of_shape {{mask : Nat}} (hlt : mask < 2 ^ labelCount)
    (hshape : Shape (labelsOfMaskBits mask)) : mask ∈ table := by
  obtain ⟨x, hx, y, hy, hset⟩ := hshape
  have hrec := maskOfLabels_labelsOfMaskBits hlt
  have hmask : mask = maskOfLabels [x, y, .Q1, .Q2] := by
    calc
      mask = maskOfLabels (labelsOfMaskBits mask) := hrec.symm
      _ = maskOfLabels [x, y, .Q1, .Q2] :=
        maskOfLabels_eq_of_toFinset_eq (labelsOfMaskBits_nodup hlt)
          (by
            rcases (by simpa [vOrSurplus] using hx :
              x = .v ∨ x = .s1 ∨ x = .s2 ∨ x = .s3) with rfl | rfl | rfl | rfl <;>
              rcases (by simpa [uOrPrivate] using hy : y = .u ∨ y = .Pw ∨ y = .Pu) with
                rfl | rfl | rfl <;> decide)
          (by
            simpa only [List.toFinset_cons, List.toFinset_nil, Finset.insert_empty]
              using hset)
  rcases (by simpa [vOrSurplus] using hx : x = .v ∨ x = .s1 ∨ x = .s2 ∨ x = .s3) with
    rfl | rfl | rfl | rfl <;>
    rcases (by simpa [uOrPrivate] using hy : y = .u ∨ y = .Pw ∨ y = .Pu) with
      rfl | rfl | rfl <;>
    rw [hmask] <;> decide

theorem candidateMaskOK_of_mem_table {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true) (hm : mask ∈ table) :
    candidateMaskOK sstar .w mask = true := by
  cases sstar <;> simp [isSurplusStar] at hsstar
  all_goals
    simp only [table, List.mem_cons, List.not_mem_nil] at hm
    simp only [or_false] at hm
    rcases hm with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
      decide

theorem candidateMaskOK_iff_mem_table {{sstar : Label}} {{mask : Nat}}
    (hsstar : isSurplusStar sstar = true) :
    candidateMaskOK sstar .w mask = true ↔ mask ∈ table := by
  constructor
  · intro h
    exact mem_table_of_shape (support_data h).1 (shape_of_candidateMaskOK h)
  · exact candidateMaskOK_of_mem_table hsstar

theorem candidateMasks_eq_table {{sstar : Label}} (hsstar : isSurplusStar sstar = true) :
    candidateMasks sstar .w = table := by
  cases sstar <;> simp [isSurplusStar, candidateMasks, table] at hsstar ⊢

theorem candidateMasks_eq_filter {{sstar : Label}} (hsstar : isSurplusStar sstar = true) :
    candidateMasks sstar .w = candidateMasksByFilter sstar .w := by
  rw [candidateMasks_eq_table hsstar]
  have hsorted : table.Pairwise (· < ·) := by decide
  have hbound : ∀ x ∈ table, x < maskBound := by
    intro x hx
    simp only [table, List.mem_cons, List.not_mem_nil] at hx
    simp only [or_false] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
      decide
  have hfilter := filter_range_eq_of_strictSorted_bounded
    (candidateMaskOK sstar .w) maskBound table hsorted hbound
    (fun x _ ↦ candidateMaskOK_iff_mem_table hsstar)
  simpa [candidateMasksByFilter, allNormalizedMasks] using hfilter.symm

end CenterWSupport

{private_center_support}

private theorem filter_range_eq_singleton_of_sorted
    (p : Nat → Bool) :
    ∀ n k, k < n →
      (∀ i, i < k → p i = false) →
      p k = true →
      (∀ i, k < i → i < n → p i = false) →
      (List.range n).filter p = [k] := by
  intro n
  induction n with
  | zero =>
      intro k hk
      exact (Nat.not_lt_zero k hk).elim
  | succ n ih =>
      intro k hk hbefore h_at hafter
      rw [List.range_succ, List.filter_append]
      by_cases hkn : k < n
      · have hprefix : (List.range n).filter p = [k] :=
          ih k hkn hbefore h_at (fun i hi hin =>
            hafter i hi (Nat.lt_trans hin (Nat.lt_succ_self n)))
        have hlast : p n = false :=
          hafter n (Nat.lt_of_lt_of_le hkn (Nat.le_refl n))
            (Nat.lt_succ_self n)
        simp [hprefix, hlast]
      · have hnk : n ≤ k := Nat.le_of_not_gt hkn
        have hkn_le : k ≤ n := Nat.le_of_lt_succ hk
        have hkeq : k = n := Nat.le_antisymm hkn_le hnk
        subst k
        have hprefix : (List.range n).filter p = [] :=
          (List.filter_eq_nil_iff).2 (fun a ha => by
            intro htrue
            have halt : a < n := List.mem_range.mp ha
            exact Bool.noConfusion ((hbefore a halt).symm.trans htrue))
        simp [hprefix, h_at]

private theorem candidateMaskOK_s1_v_iff (mask : Nat) :
    candidateMaskOK .s1 .v mask = true ↔ mask = 201 := by
  constructor
  · intro h
    simp only [candidateMaskOK, Bool.and_eq_true] at h
    simpa [expectedPinnedMask] using h.1.1.1.1.1.2
  · intro h
    subst mask
    decide

private theorem candidateMaskOK_s2_v_iff (mask : Nat) :
    candidateMaskOK .s2 .v mask = true ↔ mask = 209 := by
  constructor
  · intro h
    simp only [candidateMaskOK, Bool.and_eq_true] at h
    simpa [expectedPinnedMask] using h.1.1.1.1.1.2
  · intro h
    subst mask
    decide

private theorem candidateMaskOK_s3_v_iff (mask : Nat) :
    candidateMaskOK .s3 .v mask = true ↔ mask = 225 := by
  constructor
  · intro h
    simp only [candidateMaskOK, Bool.and_eq_true] at h
    simpa [expectedPinnedMask] using h.1.1.1.1.1.2
  · intro h
    subst mask
    decide

private theorem candidateMasks_s1_v_eq_filter :
    candidateMasks .s1 .v = candidateMasksByFilter .s1 .v := by
  change [201] = (List.range maskBound).filter (candidateMaskOK .s1 .v ·)
  symm
  apply filter_range_eq_singleton_of_sorted
    (candidateMaskOK .s1 .v ·) maskBound 201
  · decide
  · intro i hi
    have hnot : ¬ candidateMaskOK .s1 .v i = true := by
      intro h
      exact (Nat.ne_of_lt hi) ((candidateMaskOK_s1_v_iff i).mp h)
    cases hvalue : candidateMaskOK .s1 .v i with
    | false => rfl
    | true => exact (hnot hvalue).elim
  · rw [candidateMaskOK_s1_v_iff]
  · intro i hi hin
    have hnot : ¬ candidateMaskOK .s1 .v i = true := by
      intro h
      exact (Nat.ne_of_gt hi) ((candidateMaskOK_s1_v_iff i).mp h)
    cases hvalue : candidateMaskOK .s1 .v i with
    | false => rfl
    | true => exact (hnot hvalue).elim

private theorem candidateMasks_s2_v_eq_filter :
    candidateMasks .s2 .v = candidateMasksByFilter .s2 .v := by
  change [209] = (List.range maskBound).filter (candidateMaskOK .s2 .v ·)
  symm
  apply filter_range_eq_singleton_of_sorted
    (candidateMaskOK .s2 .v ·) maskBound 209
  · decide
  · intro i hi
    have hnot : ¬ candidateMaskOK .s2 .v i = true := by
      intro h
      exact (Nat.ne_of_lt hi) ((candidateMaskOK_s2_v_iff i).mp h)
    cases hvalue : candidateMaskOK .s2 .v i with
    | false => rfl
    | true => exact (hnot hvalue).elim
  · rw [candidateMaskOK_s2_v_iff]
  · intro i hi hin
    have hnot : ¬ candidateMaskOK .s2 .v i = true := by
      intro h
      exact (Nat.ne_of_gt hi) ((candidateMaskOK_s2_v_iff i).mp h)
    cases hvalue : candidateMaskOK .s2 .v i with
    | false => rfl
    | true => exact (hnot hvalue).elim

private theorem candidateMasks_s3_v_eq_filter :
    candidateMasks .s3 .v = candidateMasksByFilter .s3 .v := by
  change [225] = (List.range maskBound).filter (candidateMaskOK .s3 .v ·)
  symm
  apply filter_range_eq_singleton_of_sorted
    (candidateMaskOK .s3 .v ·) maskBound 225
  · decide
  · intro i hi
    have hnot : ¬ candidateMaskOK .s3 .v i = true := by
      intro h
      exact (Nat.ne_of_lt hi) ((candidateMaskOK_s3_v_iff i).mp h)
    cases hvalue : candidateMaskOK .s3 .v i with
    | false => rfl
    | true => exact (hnot hvalue).elim
  · rw [candidateMaskOK_s3_v_iff]
  · intro i hi hin
    have hnot : ¬ candidateMaskOK .s3 .v i = true := by
      intro h
      exact (Nat.ne_of_gt hi) ((candidateMaskOK_s3_v_iff i).mp h)
    cases hvalue : candidateMaskOK .s3 .v i with
    | false => rfl
    | true => exact (hnot hvalue).elim

theorem candidateMasks_eq_filter_of_isSurplusStar
    {{sstar center : Label}} (hs : isSurplusStar sstar = true) :
    candidateMasks sstar center = candidateMasksByFilter sstar center := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals cases center
  all_goals first
    | exact candidateMasks_s1_u_eq_filter
    | exact candidateMasks_s2_u_eq_filter
    | exact candidateMasks_s3_u_eq_filter
    | exact candidateMasks_s1_v_eq_filter
    | exact candidateMasks_s2_v_eq_filter
    | exact candidateMasks_s3_v_eq_filter
    | exact candidateMasks_s1_s2_eq_filter
    | exact candidateMasks_s1_s3_eq_filter
    | exact candidateMasks_s2_s3_eq_filter
    | exact CenterWSupport.candidateMasks_eq_filter (by decide)
    | exact candidateMasks_privateCenter_eq_filter (by decide) (by decide)
    | native_decide

theorem mem_candidateMasks_of_candidateMaskOK
    {{sstar center : Label}} {{mask : Nat}}
    (hs : isSurplusStar sstar = true)
    (h : candidateMaskOK sstar center mask = true) :
    mask ∈ candidateMasks sstar center := by
  rw [candidateMasks_eq_filter_of_isSurplusStar hs]
  rw [candidateMasksByFilter]
  exact List.mem_filter.mpr
    ⟨mem_allNormalizedMasks_of_maskNormalized
      (maskNormalized_of_candidateMaskOK h), h⟩

theorem candidateMaskOK_of_isValidPinnedFragment
    {{sstar center : Label}} {{shadow : Shadow}}
    (h : isValidPinnedFragment sstar shadow = true) :
    candidateMaskOK sstar center (shadow.centerMask center) = true := by
  have hbeq : ∀ left right : Label,
      (left == right) = decide (left = right) := by
    intro left right
    cases left <;> cases right <;> rfl
  cases sstar <;> simp [isValidPinnedFragment, isSurplusStar] at h
  all_goals cases center <;>
    simp [hbeq, candidateMaskOK, Shadow.classesShapeOK,
      Shadow.classShapeOKAt, Shadow.classHas, allLabels, pinnedClassOK,
      wSqueezeOK, oneHitOK, circumcenterOK, circumcenterOKAt,
      fragmentTriggersOK, triggerPrivateOKAt, previousSstarCenters,
      localTriggerOKAt, isMoserLabel] at h ⊢ <;>
    simp_all <;>
    constructor <;> constructor <;> rfl

theorem isSurplusStar_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}}
    (h : isValidPinnedFragment sstar shadow = true) :
    isSurplusStar sstar = true := by
  cases sstar <;> simp [isValidPinnedFragment, isSurplusStar] at h ⊢

theorem mem_candidateMasks_of_isValidPinnedFragment
    {{sstar center : Label}} {{shadow : Shadow}}
    (h : isValidPinnedFragment sstar shadow = true) :
    shadow.centerMask center ∈ candidateMasks sstar center := by
  exact mem_candidateMasks_of_candidateMaskOK
    (isSurplusStar_of_isValidPinnedFragment h)
    (candidateMaskOK_of_isValidPinnedFragment h)

{lean_shadow_path_proof}

theorem mem_fragmentSearchSstars_of_isSurplusStar {{sstar : Label}}
    (h : isSurplusStar sstar = true) :
    sstar ∈ fragmentSearchSstars := by
  cases sstar <;> simp [isSurplusStar, fragmentSearchSstars] at h ⊢

theorem computedFragmentShadowAcceptedBySearch_of_isValidPinnedFragment
    {{sstar : Label}} {{shadow : Shadow}}
    (hvalid : isValidPinnedFragment sstar shadow = true) :
    computedFragmentShadowAcceptedBySearch shadow = true := by
  have hpath : shadow.masks ∈ fragmentSearchAux sstar [] emptyShadowMasks emptyPairCounts
      (fragmentSearchPlan sstar) :=
    shadow_mem_fragmentSearchAux_of_isValidPinnedFragment hvalid
  have hentryFor : (sstar, shadow.masks) ∈ rawFragmentSearchEntriesFor sstar := by
    unfold rawFragmentSearchEntriesFor
    exact List.mem_map.mpr ⟨shadow.masks, hpath, rfl⟩
  have hentry : (sstar, shadow.masks) ∈ computedRawFragmentSearchEntries := by
    unfold computedRawFragmentSearchEntries
    exact List.mem_flatMap.mpr
      ⟨sstar, mem_fragmentSearchSstars_of_isSurplusStar
        (isSurplusStar_of_isValidPinnedFragment hvalid), hentryFor⟩
  have hkey : shadow.masks ∈ computedFragmentSearchShadowKeys := by
    unfold computedFragmentSearchShadowKeys
    exact List.mem_map.mpr ⟨(sstar, shadow.masks), hentry, rfl⟩
  simp [computedFragmentShadowAcceptedBySearch,
    hasTenMasks_of_isValidPinnedFragment hvalid,
    containsKey_eq_true_of_mem hkey]

theorem raw_fragment_search_entries_length :
    rawFragmentSearchEntries.length = 135 := by
  native_decide

theorem raw_fragment_search_entries_all_valid :
    rawFragmentSearchEntries.all validFragmentEntryOK = true := by
  native_decide

theorem valid_fragment_shadow_keys_unique :
    keysUniqueAux validFragmentShadowKeys [] = true := by
  native_decide

theorem raw_fragment_search_shadow_keys_unique :
    keysUniqueAux rawFragmentSearchShadowKeys [] = true := by
  native_decide

theorem fragment_search_entries_eq_validFragmentEntries :
    fragmentSearchEntries = validFragmentEntries := by
  native_decide

theorem fragment_search_shadow_keys_eq_validFragmentShadowKeys :
    fragmentSearchShadowKeys = validFragmentShadowKeys := by
  unfold fragmentSearchShadowKeys validFragmentShadowKeys
  rw [fragment_search_entries_eq_validFragmentEntries]

theorem valid_fragment_shadow_keys_eq_rowShadowKeys :
    validFragmentShadowKeys = rowShadowKeys := by
  native_decide

theorem fragment_search_shadow_keys_eq_rowShadowKeys :
    fragmentSearchShadowKeys = rowShadowKeys := by
  rw [fragment_search_shadow_keys_eq_validFragmentShadowKeys,
    valid_fragment_shadow_keys_eq_rowShadowKeys]

theorem valid_fragment_shadow_keys_all_in_bank :
    validFragmentShadowKeys.all (fun masks => shadowInBank {{ masks := masks }}) = true := by
  native_decide

theorem fragment_search_shadow_keys_all_in_bank :
    fragmentSearchShadowKeys.all (fun masks => shadowInBank {{ masks := masks }}) = true := by
  native_decide

theorem shadowInBank_of_fragmentShadowInEnumeration {{shadow : Shadow}}
    (h : fragmentShadowInEnumeration shadow = true) :
    shadowInBank shadow = true := by
  simpa [shadowInBank, fragmentShadowInEnumeration,
    valid_fragment_shadow_keys_eq_rowShadowKeys] using h

theorem shadowInBank_of_fragmentShadowAcceptedBySearch {{shadow : Shadow}}
    (h : fragmentShadowAcceptedBySearch shadow = true) :
    shadowInBank shadow = true := by
  simpa [shadowInBank, fragmentShadowAcceptedBySearch,
    fragment_search_shadow_keys_eq_rowShadowKeys] using h

theorem rows_c_empty_count : countVerdict .cEmpty rows = 2 := by
  native_decide

theorem rows_no_valid_real_count : countVerdict .noValidReal rows = 133 := by
  native_decide

theorem rows_forced_uv_count : countForcedPairCode 1 rows = 127 := by
  native_decide

theorem rows_forced_us1_count : countForcedPairCode 2 rows = 6 := by
  native_decide

theorem rows_s1_count : countSstar .s1 rows = 41 := by
  native_decide

theorem rows_s2_count : countSstar .s2 rows = 71 := by
  native_decide

theorem rows_s3_count : countSstar .s3 rows = 23 := by
  native_decide

end SurplusCOMPGBank
end Problem97
"""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)
    dfs_module_path = path.with_name("SurplusCOMPGBankDFS.lean")
    dfs_shard_dir = path.with_name("SurplusCOMPGBankDFS")
    dfs_shard_dir.mkdir(parents=True, exist_ok=True)
    for sstar in FAMILIES:
        shard_name = f"Depth2{sstar.capitalize()}.lean"
        (dfs_shard_dir / shard_name).write_text(lean_dfs_completeness_shard_text(sstar))
    dfs_module_path.write_text(lean_dfs_completeness_coordinator_text())


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--rvol-root",
        type=Path,
        default=default_rvol_root(),
        help="path to sibling p97-rvol checkout",
    )
    parser.add_argument(
        "--emit-bank",
        type=Path,
        help="write the verified pinned surplus COMP-G bank to this JSON path",
    )
    parser.add_argument(
        "--check-bank",
        type=Path,
        help="check an emitted bank JSON against the current rvol source data",
    )
    parser.add_argument(
        "--emit-lean-shadow",
        type=Path,
        help="emit a Lean module containing the finite pinned surplus shadow bank",
    )
    args = parser.parse_args()

    fragment_dir = args.rvol_root / "scratch" / "u2b_ssel_fragment"
    comp_dir = fragment_dir / "comp_g"

    source_paths = {
        "fragment_models": fragment_dir / "ssel_fragment_models_20260701.json",
        "comp_g_patterns": comp_dir / "comp_g_patterns_20260701.jsonl",
        "comp_g_pairscan": comp_dir / "comp_g_pairscan.jsonl",
        "singular_verify": comp_dir / "singular_verify_surplus_results.jsonl",
        "comp_g_summary": comp_dir / "comp_g_20260701.summary.json",
    }

    fragment = load_json(source_paths["fragment_models"])
    comp_rows = load_jsonl(source_paths["comp_g_patterns"])
    pair_rows = load_jsonl(source_paths["comp_g_pairscan"])
    singular_rows = load_jsonl(source_paths["singular_verify"])
    summary = load_json(source_paths["comp_g_summary"])

    expected = validate_models(fragment)
    stats = validate_comp_bank(
        expected,
        comp_rows,
        pair_rows,
        singular_rows,
        summary,
    )
    bank = build_bank(expected, comp_rows, pair_rows, singular_rows, stats, source_paths)

    if args.emit_bank:
        write_bank(bank, args.emit_bank)

    if args.check_bank:
        compare_bank(load_json(args.check_bank), bank, args.check_bank)

    if args.emit_lean_shadow:
        emit_lean_shadow(bank, args.emit_lean_shadow)

    print("Pinned surplus COMP-G shadow check: PASS")
    print(
        "model rows:",
        sum(stats["model_counts"].values()),
        dict(sorted(stats["model_counts"].items())),
    )
    print(
        f"pinned class: every row has K_{PINNED_CENTER} = "
        "{Pu, Pw, u, s*}"
    )
    print("COMP-G final verdicts:", dict(sorted(stats["final_counts"].items())))
    print("final forced pairs:", dict(sorted(stats["final_forced"].items())))
    print("pairscan forced pairs:", dict(sorted(stats["pairscan_forced"].items())))
    print("Singular flips:", dict(sorted(stats["singular_flips"].items())))
    print("C-empty rows:", ", ".join(stats["c_empty_pids"]))
    print("u=s1 forced-collapse rows:", ", ".join(stats["u_eq_s1_pids"]))
    if args.emit_bank:
        print("emitted bank:", args.emit_bank)
    if args.check_bank:
        print("checked bank:", args.check_bank)
    if args.emit_lean_shadow:
        print("emitted Lean shadow:", args.emit_lean_shadow)
    print(
        "Conclusion: the banked COMP-G artifact exactly covers the pinned "
        "surplus incidence shadow; the remaining proof work is the Lean bridge "
        "from the current residual into this 135-row shadow."
    )


if __name__ == "__main__":
    main()
