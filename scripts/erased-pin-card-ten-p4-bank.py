#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Generate the card-ten erased-pin P4 fixed-seed bank.

The P2 bank fixes a private class at ``Pw`` or ``Pu``.  The two P4 holes
instead put that class at ``u`` or one of ``s1``, ``s2``, ``s3``.  This script
enumerates every exact four-label private mask that contains the erased
surplus label and excludes its center.  It then runs an independent Python
replica of the relaxed-shape DFS as a fail-fast empirical gate before emitting
the Lean bank whose ``native_decide`` theorems provide the actual certificate.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from types import ModuleType
from typing import Any


SCHEMA = "p97.erased_pin_card_ten_p4_bank.v1"
FAMILY_CENTERS = {
    "p4u": "u",
    "p4s1": "s1",
    "p4s2": "s2",
    "p4s3": "s3",
}
_BASE_CACHE: dict[str, ModuleType] = {}


def load_base(path: Path) -> ModuleType:
    key = str(path.resolve())
    cached = _BASE_CACHE.get(key)
    if cached is not None:
        return cached
    spec = importlib.util.spec_from_file_location("erased_pin_producer_census", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    _BASE_CACHE[key] = module
    return module


def private_masks(base: ModuleType, sstar: str, center: str) -> tuple[int, ...]:
    return tuple(
        mask
        for mask in range(base.MASK_BOUND)
        if base.mask_card(mask) == 4
        and not base.mask_has(mask, center)
        and base.mask_has(mask, sstar)
    )


def enumerate_seeds(base: ModuleType) -> list[tuple[str, str, str, int]]:
    seeds: list[tuple[str, str, str, int]] = []
    for family, center in FAMILY_CENTERS.items():
        for sstar in base.SURPLUS_LABELS:
            for private_mask in private_masks(base, sstar, center):
                seeds.append((family, sstar, center, private_mask))
    return seeds


def relaxed_masks(base: ModuleType, center: str) -> tuple[int, ...]:
    return tuple(
        mask
        for mask in range(base.MASK_BOUND)
        if base.mask_card(mask) == 4 and not base.mask_has(mask, center)
    )


def fixed_mask(
    base: ModuleType, private_center: str, private_mask: int, center: str
) -> int | None:
    if center == "v":
        return base.FIRST_OPP_EXACT_CAP_MASK
    if center == "w":
        return base.SECOND_OPP_EXACT_CAP_MASK
    if center == private_center:
        return private_mask
    return None


def relaxed_seed_has_survivor(
    base: ModuleType, sstar: str, private_center: str, private_mask: int
) -> bool:
    """Return whether the relaxed-shape DFS has at least one completion."""

    masks = [0] * len(base.LABELS)
    assigned: list[str] = []
    pair_counts = [0] * len(base.LABEL_PAIRS)
    plan: list[tuple[str, tuple[int, ...]]] = []
    for center in base.FRAGMENT_SEARCH_ORDER:
        fixed = fixed_mask(base, private_center, private_mask, center)
        candidates = (fixed,) if fixed is not None else relaxed_masks(base, center)
        if fixed is not None and (
            base.mask_card(fixed) != 4 or base.mask_has(fixed, center)
        ):
            candidates = ()
        plan.append((center, candidates))

    def add_pair_counts(center: str, mask: int, delta: int) -> list[int]:
        changed: list[int] = []
        for index, pair in enumerate(base.LABEL_PAIRS):
            if base.point_pair_hit_by_center_mask(center, mask, pair):
                pair_counts[index] += delta
                changed.append(index)
        return changed

    def dfs(index: int) -> bool:
        if index == len(plan):
            return (
                base.no_three_ok(masks)
                and base.separation_ok(masks)
                and base.search_separation_ok(masks)
                and masks[base.LABEL_INDEX[private_center]] == private_mask
                and base.mask_has(private_mask, sstar)
            )

        center, candidates = plan[index]
        for mask in candidates:
            if any(
                not base.cross_separation_ok_for_masks(
                    center, mask, other, masks[base.LABEL_INDEX[other]]
                )
                for other in assigned
            ):
                continue
            changed = add_pair_counts(center, mask, 1)
            if all(pair_counts[pair_index] <= 2 for pair_index in changed):
                masks[base.LABEL_INDEX[center]] = mask
                assigned.append(center)
                if dfs(index + 1):
                    return True
                assigned.pop()
                masks[base.LABEL_INDEX[center]] = 0
            for pair_index in changed:
                pair_counts[pair_index] -= 1
        return False

    return dfs(0)


def check_seed(task: tuple[str, str, str, str, int]) -> dict[str, Any]:
    base_path, family, sstar, center, private_mask = task
    base = load_base(Path(base_path))
    return {
        "family": family,
        "sstar": sstar,
        "private_center": center,
        "private_mask": private_mask,
        "private_mask_labels": [
            label for label in base.LABELS if base.mask_has(private_mask, label)
        ],
        "relaxed_dfs_survivor_found": relaxed_seed_has_survivor(
            base, sstar, center, private_mask
        ),
    }


def build_payload(base_path: Path, jobs: int) -> dict[str, Any]:
    base = load_base(base_path)
    seeds = enumerate_seeds(base)
    tasks = [(str(base_path.resolve()), *seed) for seed in seeds]
    results: list[dict[str, Any]] = []
    with ProcessPoolExecutor(max_workers=jobs) as pool:
        futures = [pool.submit(check_seed, task) for task in tasks]
        for completed, future in enumerate(as_completed(futures), start=1):
            results.append(future.result())
            if completed % 25 == 0 or completed == len(futures):
                print(f"checked {completed}/{len(futures)} seeds", flush=True)

    results.sort(
        key=lambda row: (
            tuple(FAMILY_CENTERS).index(row["family"]),
            base.LABEL_INDEX[row["sstar"]],
            row["private_mask"],
        )
    )
    survivor_count = sum(row["relaxed_dfs_survivor_found"] for row in results)
    family_counts = {
        family: sum(row["family"] == family for row in results)
        for family in FAMILY_CENTERS
    }
    family_survivors = {
        family: sum(
            row["family"] == family and row["relaxed_dfs_survivor_found"]
            for row in results
        )
        for family in FAMILY_CENTERS
    }
    return {
        "schema": SCHEMA,
        "description": (
            "Complete relaxed-shape private-seed domain for the two card-ten "
            "erased-pin P4 center families. Python DFS results are empirical; "
            "the generated Lean native_decide theorems are the certificate."
        ),
        "base_script": str(base_path),
        "labels": list(base.LABELS),
        "summary": {
            "seed_count": len(results),
            "family_seed_counts": family_counts,
            "seeds_with_relaxed_dfs_survivor": survivor_count,
            "family_survivor_counts": family_survivors,
            "all_seeds_empirically_excluded": survivor_count == 0,
            "jobs": jobs,
        },
        "seeds": results,
    }


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    summary = payload["summary"]
    lines = [
        "# Erased-pin card-ten P4 seed census",
        "",
        "The Python DFS is an empirical generation gate. The generated Lean",
        "`native_decide` theorems are the proof-producing certificate.",
        "",
        "## Summary",
        "",
        f"- seeds: {summary['seed_count']}",
        "- seeds with a relaxed-shape DFS survivor: "
        f"{summary['seeds_with_relaxed_dfs_survivor']}",
        f"- worker processes: {summary['jobs']}",
        "",
        "## Lean routing",
        "",
        "- direct fixed-cap cross-separation contradictions: 378",
        "- compatible seeds sent to native DFS: 126",
        "- native families: P4-U 72; P4-S1 18; P4-S2 18; P4-S3 18",
        "- native shards: one P4-U shard plus two nine-seed shards per "
        "P4-S family",
        "",
        "## Families",
        "",
        "| family | private center | seeds | survivors |",
        "|---|---:|---:|---:|",
    ]
    for family, center in FAMILY_CENTERS.items():
        lines.append(
            f"| `{family}` | `{center}` | "
            f"{summary['family_seed_counts'][family]} | "
            f"{summary['family_survivor_counts'][family]} |"
        )
    lines.append("")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines))


def lean_family_name(family: str) -> str:
    return {
        "p4u": "erasedPinCardTenP4USeeds",
        "p4s1": "erasedPinCardTenP4S1Seeds",
        "p4s2": "erasedPinCardTenP4S2Seeds",
        "p4s3": "erasedPinCardTenP4S3Seeds",
    }[family]


def lean_family_suffix(family: str) -> str:
    return {
        "p4u": "P4U",
        "p4s1": "P4S1",
        "p4s2": "P4S2",
        "p4s3": "P4S3",
    }[family]


def lean_prelude(imports: list[str], title: str) -> str:
    import_lines = "\n".join(f"import {module}" for module in imports)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
{import_lines}

/-!
# {title}

Generated by `scripts/erased-pin-card-ten-p4-bank.py`.  The Python census is
only an empirical gate; the generated `native_decide` theorems are the checked
no-survivor certificate.
-/

namespace Problem97
namespace SurplusCOMPGBank

"""


def lean_short_prelude(imports: list[str], title: str) -> str:
    import_lines = "\n".join(f"import {module}" for module in imports)
    return f"""{import_lines}

/-! # {title} -/

namespace Problem97.SurplusCOMPGBank

"""


def lean_grid_chunk_defs(family: str) -> str:
    grid = f"{lean_family_name(family).removesuffix('Seeds')}GridSeeds"
    return f"""def {grid}A : List OneSidedSeed :=
  {grid}.take 9

def {grid}B : List OneSidedSeed :=
  {grid}.drop 9

theorem {grid}_eq_chunks :
    {grid} =
      {grid}A ++ {grid}B := by
  native_decide"""


def write_lean(path: Path, payload: dict[str, Any]) -> None:
    if not payload["summary"]["all_seeds_empirically_excluded"]:
        raise RuntimeError("refusing to emit Lean bank: Python DFS found a survivor")
    path.parent.mkdir(parents=True, exist_ok=True)
    summary = payload["summary"]
    module_prefix = "Erdos9796Proof.P97.ErasedCertificate"
    family_defs = "\n".join(
        f"""/-- Card-ten P4 seeds with private center `.{center}`. -/
def {lean_family_name(family)} : List OneSidedSeed :=
  erasedPinCardTenP4SeedsAt .{center}"""
        for family, center in FAMILY_CENTERS.items()
    )
    chunk_defs = "\n\n".join(
        lean_grid_chunk_defs(family)
        for family in FAMILY_CENTERS
        if family != "p4u"
    )
    grid_defs = "\n\n".join(
        f"""def {lean_family_name(family).removesuffix('Seeds')}GridSeeds : List OneSidedSeed :=
  {lean_family_name(family)}.filter erasedPinCardTenP4SeedCrossCompatible"""
        for family in FAMILY_CENTERS
    )
    defs_text = lean_prelude(
        ["Erdos9796Proof.P97.SurplusSeededShadow"],
        "Erased-pin card-ten P4 seed definitions",
    ) + f"""/-- Every relaxed private mask through `sstar` at `center`. -/
def erasedPinCardTenP4PrivateMasks (sstar center : Label) : List Nat :=
  allNormalizedMasks.filter fun mask =>
    maskCard mask == 4 && !maskHas mask center && maskHas mask sstar

/-- Every P4 seed at one private center. -/
def erasedPinCardTenP4SeedsAt (center : Label) : List OneSidedSeed :=
  fragmentSearchSstars.flatMap fun sstar =>
    (erasedPinCardTenP4PrivateMasks sstar center).map fun privateMask =>
      {{ sstar := sstar, privateCenter := center, kind := .own,
        privateMask := privateMask }}

theorem mem_erasedPinCardTenP4PrivateMasks
    {{sstar center : Label}} {{privateMask : Nat}}
    (hnorm : maskNormalized privateMask = true)
    (hcard : maskCard privateMask = 4)
    (hself : maskHas privateMask center = false)
    (hstar : maskHas privateMask sstar = true) :
    privateMask ∈ erasedPinCardTenP4PrivateMasks sstar center := by
  apply List.mem_filter.mpr
  refine ⟨mem_allNormalizedMasks_of_maskNormalized hnorm, ?_⟩
  simp [hcard, hself, hstar]

theorem mem_erasedPinCardTenP4SeedsAt
    {{sstar center : Label}} {{privateMask : Nat}}
    (hs : isSurplusStar sstar = true)
    (hnorm : maskNormalized privateMask = true)
    (hcard : maskCard privateMask = 4)
    (hself : maskHas privateMask center = false)
    (hstar : maskHas privateMask sstar = true) :
    {{ sstar := sstar, privateCenter := center, kind := .own,
        privateMask := privateMask }} ∈ erasedPinCardTenP4SeedsAt center := by
  apply List.mem_flatMap.mpr
  refine ⟨sstar, mem_fragmentSearchSstars_of_isSurplusStar hs, ?_⟩
  apply List.mem_map.mpr
  exact ⟨privateMask,
    mem_erasedPinCardTenP4PrivateMasks hnorm hcard hself hstar, rfl⟩

{family_defs}

/-- The complete {summary['seed_count']}-seed card-ten P4 bank. -/
def erasedPinCardTenP4Seeds : List OneSidedSeed :=
  erasedPinCardTenP4USeeds ++ erasedPinCardTenP4S1Seeds ++
    erasedPinCardTenP4S2Seeds ++ erasedPinCardTenP4S3Seeds

theorem mem_erasedPinCardTenP4Seeds_of_privateCenter
    {{sstar center : Label}} {{privateMask : Nat}}
    (hs : isSurplusStar sstar = true)
    (hcenter : center = .u ∨ isSurplusStar center = true)
    (hnorm : maskNormalized privateMask = true)
    (hcard : maskCard privateMask = 4)
    (hself : maskHas privateMask center = false)
    (hstar : maskHas privateMask sstar = true) :
    {{ sstar := sstar, privateCenter := center, kind := .own,
        privateMask := privateMask }} ∈ erasedPinCardTenP4Seeds := by
  have hmem := mem_erasedPinCardTenP4SeedsAt hs hnorm hcard hself hstar
  rcases hcenter with rfl | hcenter
  · simp [erasedPinCardTenP4Seeds, erasedPinCardTenP4USeeds, hmem]
  · cases center <;> simp [isSurplusStar] at hcenter
    all_goals
      simp [erasedPinCardTenP4Seeds, erasedPinCardTenP4S1Seeds,
        erasedPinCardTenP4S2Seeds, erasedPinCardTenP4S3Seeds, hmem]

/-- Compatibility with the two fixed exact-cap masks, checked in the ordered
private-center-to-cap direction used by the generated separation interface. -/
def erasedPinCardTenP4SeedCrossCompatible (seed : OneSidedSeed) : Bool :=
  crossSeparationOKForMasks seed.privateCenter seed.privateMask .v
      firstOppExactCapMask &&
    crossSeparationOKForMasks seed.privateCenter seed.privateMask .w
      secondOppExactCapMask

{grid_defs}

{chunk_defs}

def erasedPinCardTenP4GridSeeds : List OneSidedSeed :=
  erasedPinCardTenP4Seeds.filter erasedPinCardTenP4SeedCrossCompatible

theorem erasedPinCardTenP4GridSeeds_eq_families :
    erasedPinCardTenP4GridSeeds =
      erasedPinCardTenP4UGridSeeds ++ erasedPinCardTenP4S1GridSeeds ++
        erasedPinCardTenP4S2GridSeeds ++ erasedPinCardTenP4S3GridSeeds := by
  native_decide

theorem erasedPinCardTenP4GridSeeds_family_lengths :
    erasedPinCardTenP4UGridSeeds.length = 72 ∧
      erasedPinCardTenP4S1GridSeeds.length = 18 ∧
      erasedPinCardTenP4S2GridSeeds.length = 18 ∧
      erasedPinCardTenP4S3GridSeeds.length = 18 := by
  native_decide

def erasedPinCardTenP4SeedRouted (seed : OneSidedSeed) : Bool :=
  erasedPinCardTenP4SeedCrossCompatible seed ||
    decide (crossSeparationOKForMasks seed.privateCenter seed.privateMask .v
      firstOppExactCapMask = false) ||
    decide (crossSeparationOKForMasks seed.privateCenter seed.privateMask .w
      secondOppExactCapMask = false)

theorem erasedPinCardTenP4Seeds_all_routed :
    erasedPinCardTenP4Seeds.all erasedPinCardTenP4SeedRouted = true := by
  native_decide

theorem erasedPinCardTenP4Seeds_mem_grid_or_cross_false
    {{seed : OneSidedSeed}} (hseed : seed ∈ erasedPinCardTenP4Seeds) :
    seed ∈ erasedPinCardTenP4GridSeeds ∨
      crossSeparationOKForMasks seed.privateCenter seed.privateMask .v
        firstOppExactCapMask = false ∨
      crossSeparationOKForMasks seed.privateCenter seed.privateMask .w
        secondOppExactCapMask = false := by
  have hrouted := List.all_eq_true.mp
    erasedPinCardTenP4Seeds_all_routed seed hseed
  cases hcompatible : erasedPinCardTenP4SeedCrossCompatible seed
  · cases hcrossV : crossSeparationOKForMasks seed.privateCenter
        seed.privateMask .v firstOppExactCapMask
    · exact Or.inr (Or.inl rfl)
    · cases hcrossW : crossSeparationOKForMasks seed.privateCenter
          seed.privateMask .w secondOppExactCapMask
      · exact Or.inr (Or.inr rfl)
      · simp [erasedPinCardTenP4SeedRouted, hcompatible, hcrossV,
          hcrossW] at hrouted
  · exact Or.inl (List.mem_filter.mpr ⟨hseed, hcompatible⟩)

theorem privateMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    shadow.centerMask seed.privateCenter = seed.privateMask := by
  cases seed <;>
    simp [isValidOneSidedSeedRelaxedShapeShadow] at hvalid ⊢ <;>
    simp_all

theorem firstOppExactCapMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    shadow.centerMask .v = firstOppExactCapMask := by
  cases seed <;>
    simp [isValidOneSidedSeedRelaxedShapeShadow] at hvalid ⊢ <;>
    simp_all

theorem secondOppExactCapMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    shadow.centerMask .w = secondOppExactCapMask := by
  cases seed <;>
    simp [isValidOneSidedSeedRelaxedShapeShadow] at hvalid ⊢ <;>
    simp_all

theorem erasedPinCardTenP4Seeds_length :
    erasedPinCardTenP4Seeds.length = {summary['seed_count']} := by
  native_decide

theorem erasedPinCardTenP4Seeds_privateMask_card :
    ∀ seed ∈ erasedPinCardTenP4Seeds, maskCard seed.privateMask = 4 := by
  native_decide

theorem erasedPinCardTenP4Seeds_privateMask_self_false :
    ∀ seed ∈ erasedPinCardTenP4Seeds,
      maskHas seed.privateMask seed.privateCenter = false := by
  native_decide

theorem erasedPinCardTenP4Seeds_privateMask_has_sstar :
    ∀ seed ∈ erasedPinCardTenP4Seeds,
      maskHas seed.privateMask seed.sstar = true := by
  native_decide

end SurplusCOMPGBank
end Problem97
"""
    defs_path = path.with_name("CardTenP4SeedDefs.lean")
    defs_path.write_text(defs_text)

    family_modules: list[str] = []
    for family in FAMILY_CENTERS:
        suffix = lean_family_suffix(family)
        module = f"{module_prefix}.CardTenP4Seed{suffix}"
        family_modules.append(module)
        family_path = path.with_name(f"CardTenP4Seed{suffix}.lean")
        name = lean_family_name(family)
        grid_name = f"{name.removesuffix('Seeds')}GridSeeds"
        if family != "p4u":
            chunk_modules: list[str] = []
            for chunk in ("A", "B"):
                chunk_module = f"{module}{chunk}"
                chunk_modules.append(chunk_module)
                chunk_path = path.with_name(
                    f"CardTenP4Seed{suffix}{chunk}.lean"
                )
                chunk_name = f"{grid_name}{chunk}"
                entries = f"{name.removesuffix('Seeds')}{chunk}Entries"
                chunk_family = f"{family}{chunk.lower()}"
                chunk_text = lean_short_prelude(
                    [f"{module_prefix}.CardTenP4SeedDefs"],
                    f"Erased-pin card-ten {family.upper()}-{chunk} native certificate",
                ) + f"""def {entries} : List (OneSidedSeed × List Nat) :=
  {chunk_name}.flatMap
    oneSidedSeedRelaxedShapeSearchEntriesFor

theorem {entries}_eq_nil :
    {entries} = [] := by
  native_decide

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_{chunk_family}
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ {chunk_name})
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  have hmem : (seed, shadow.masks) ∈ {entries} := by
    exact List.mem_flatMap.mpr
      ⟨seed, hseed,
        mem_oneSidedSeedRelaxedShapeSearchEntriesFor_of_isValidOneSidedSeedRelaxedShapeShadow
          hvalid⟩
  simpa [{entries}_eq_nil] using hmem

end Problem97.SurplusCOMPGBank
"""
                chunk_path.write_text(chunk_text)
            family_text = lean_short_prelude(
                chunk_modules,
                f"Erased-pin card-ten {family.upper()} seed certificate",
            ) + f"""theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_{family}
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ {grid_name})
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  rw [{grid_name}_eq_chunks] at hseed
  rcases List.mem_append.mp hseed with hseed | hseed
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_{family}a
      hseed hvalid
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_{family}b
      hseed hvalid

end Problem97.SurplusCOMPGBank
"""
            family_path.write_text(family_text)
            continue
        entries = f"{name}RelaxedShapeSearchEntries"
        family_text = lean_prelude(
            [f"{module_prefix}.CardTenP4SeedDefs"],
            f"Erased-pin card-ten {family.upper()} seed certificate",
        ) + f"""/-- Relaxed-shape search entries for `{family}` seeds. -/
def {entries} : List (OneSidedSeed × List Nat) :=
  {grid_name}.flatMap
    oneSidedSeedRelaxedShapeSearchEntriesFor

/-- The relaxed-shape DFS has no survivor for `{family}` seeds. -/
theorem {entries}_eq_nil :
    {entries} = [] := by
  native_decide

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_{family}
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ {grid_name})
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  have hmem : (seed, shadow.masks) ∈ {entries} := by
    unfold {entries}
    exact List.mem_flatMap.mpr
      ⟨seed, hseed,
        mem_oneSidedSeedRelaxedShapeSearchEntriesFor_of_isValidOneSidedSeedRelaxedShapeShadow
          hvalid⟩
  simpa [{entries}_eq_nil] using hmem

end SurplusCOMPGBank
end Problem97
"""
        family_path.write_text(family_text)

    text = lean_prelude(
        family_modules,
        "Erased-pin card-ten P4 fixed-seed DFS",
    ) + """set_option maxRecDepth 100000 in
theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_cardTenP4
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4GridSeeds)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  rw [erasedPinCardTenP4GridSeeds_eq_families] at hseed
  rcases List.mem_append.mp hseed with hseed | hS3
  · rcases List.mem_append.mp hseed with hseed | hS2
    · rcases List.mem_append.mp hseed with hU | hS1
      · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4u
          hU hvalid
      · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s1
          hS1 hvalid
    · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s2
        hS2 hvalid
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s3
      hS3 hvalid

end SurplusCOMPGBank
end Problem97
"""
    path.write_text(text)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--base-script",
        type=Path,
        default=Path("scripts/erased-pin-producer-census.py"),
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=Path("certificates/surplus/erased_pin_card_ten_p4_bank.json"),
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=Path("certificates/surplus/reports/erased_pin_card_ten_p4_bank.md"),
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=Path(
            "lean/Erdos9796Proof/P97/ErasedCertificate/CardTenP4SeedDFS.lean"
        ),
    )
    parser.add_argument(
        "--jobs", type=int, default=min(8, os.cpu_count() or 1)
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if not 1 <= args.jobs <= 8:
        raise ValueError("--jobs must be between 1 and 8")
    payload = build_payload(args.base_script, args.jobs)
    write_json(args.json_out, payload)
    write_markdown(args.markdown_out, payload)
    write_lean(args.lean_out, payload)
    print(f"wrote {args.json_out}")
    print(f"wrote {args.markdown_out}")
    print(f"wrote {args.lean_out}")


if __name__ == "__main__":
    main()
