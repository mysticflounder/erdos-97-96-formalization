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
  cases left <;> cases right <;> native_decide

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

theorem candidateMasks_eq_filter_of_isSurplusStar
    {{sstar center : Label}} (hs : isSurplusStar sstar = true) :
    candidateMasks sstar center = candidateMasksByFilter sstar center := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals cases center <;> native_decide

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
  cases sstar <;> cases center <;>
    simp [isValidPinnedFragment, candidateMaskOK, Shadow.classesShapeOK,
      Shadow.classShapeOKAt, Shadow.classHas, allLabels, pinnedClassOK,
      wSqueezeOK, oneHitOK, circumcenterOK, circumcenterOKAt,
      fragmentTriggersOK, triggerPrivateOKAt, previousSstarCenters,
      localTriggerOKAt, isSurplusStar, isMoserLabel] at h ⊢ <;>
    simp_all <;>
    native_decide

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
