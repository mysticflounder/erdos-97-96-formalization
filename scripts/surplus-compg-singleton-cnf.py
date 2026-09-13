"""Emit and independently validate candidate-choice CNF for singleton COMP-G cells."""

from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import subprocess
from dataclasses import dataclass
from pathlib import Path

LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
LABEL_INDEX = {label: index for index, label in enumerate(LABELS)}
HULL_ORDER = ("u", "Q1", "Q2", "v", "s1", "s2", "s3", "w", "Pw", "Pu")
LABEL_PAIRS = tuple(
    (left, right)
    for index, left in enumerate(LABELS)
    for right in LABELS[index + 1 :]
)
SCHEMA = "surplus-compg-singleton-candidate-cnf/v1"
TREE_SCHEMA = "surplus-compg-compatibility-certificate/v1"


@dataclass(frozen=True)
class CellSpec:
    key: str
    sstar: str
    target_masks: tuple[int, ...]
    tree_order: tuple[str, ...]
    lean_stem: str
    additional_target_masks: tuple[tuple[int, ...], ...] = ()
    lean_target_defs: tuple[str, ...] = ()

    @property
    def target(self) -> dict[str, int]:
        return dict(zip(LABELS, self.target_masks, strict=True))

    @property
    def targets(self) -> tuple[dict[str, int], ...]:
        return tuple(
            dict(zip(LABELS, masks, strict=True))
            for masks in (self.target_masks,) + self.additional_target_masks
        )

    @property
    def all_target_masks(self) -> tuple[tuple[int, ...], ...]:
        return (self.target_masks,) + self.additional_target_masks

    @property
    def target_defs(self) -> tuple[str, ...]:
        if self.lean_target_defs:
            if len(self.lean_target_defs) != len(self.targets):
                raise SystemExit("Lean target definitions do not cover the target set")
            return self.lean_target_defs
        if len(self.targets) == 1:
            return (f"{self.lean_stem}Target",)
        raise SystemExit("multi-target cells must name every Lean target definition")

    @property
    def fixed(self) -> dict[str, int]:
        return {"v": self.target["v"], "w": self.target["w"]}

    @property
    def free_centers(self) -> tuple[str, ...]:
        return tuple(center for center in LABELS if center not in self.fixed)

    @property
    def file_stem(self) -> str:
        return f"{self.sstar}-w{self.target['w']}"

    @property
    def lean_namespace(self) -> str:
        return f"{self.lean_stem.upper()}TreeProof"

    @property
    def module_prefix(self) -> str:
        return (
            "Erdos9796Proof.P97.SurplusCOMPGBankCoverage."
            f"{self.lean_namespace}"
        )


CELL_SPECS = {
    spec.key: spec
    for spec in (
        CellSpec(
            "s1777",
            "s1",
            (432, 201, 777, 534, 354, 92, 170, 83, 549, 390),
            ("u", "Pw", "Pu", "Q1", "Q2", "s1", "s2", "s3"),
            "s1777",
        ),
        CellSpec(
            "s1912",
            "s1",
            (178, 201, 912, 531, 616, 142, 297, 326, 549, 284),
            ("u", "Q1", "Pw", "Pu", "Q2", "s3", "s2", "s1"),
            "s1912",
        ),
        CellSpec(
            "s3801",
            "s3",
            (408, 225, 801, 562, 652, 86, 390, 75, 533, 300),
            ("u", "Q1", "Pu", "Q2", "Pw", "s3", "s2", "s1"),
            "s3801",
        ),
        CellSpec(
            "s1834",
            "s1",
            (312, 201, 834, 277, 553, 660, 142, 83, 612, 418),
            ("u", "Q1", "s1", "Q2", "Pw", "s2", "Pu", "s3"),
            "s1834",
            ((432, 201, 834, 277, 553, 660, 396, 83, 612, 298),),
            ("s1834TargetA", "s1834TargetB"),
        ),
        CellSpec(
            "s1848",
            "s1",
            (114, 201, 848, 531, 680, 78, 390, 297, 549, 284),
            ("u", "Q1", "Q2", "Pw", "Pu", "s3", "s2", "s1"),
            "s1848",
            (
                (178, 201, 848, 531, 106, 652, 390, 297, 549, 284),
                (178, 201, 848, 531, 106, 652, 297, 326, 549, 284),
                (300, 201, 848, 688, 291, 525, 154, 85, 610, 390),
            ),
            ("s1848TargetA", "s1848TargetB", "s1848TargetC", "s1848TargetD"),
        ),
        CellSpec(
            "s1928",
            "s1",
            (178, 201, 928, 338, 616, 142, 281, 579, 533, 300),
            ("u", "Q1", "Q2", "Pw", "Pu", "s3", "s2", "s1"),
            "s1928",
            (
                (284, 201, 928, 178, 556, 326, 43, 593, 646, 275),
                (284, 201, 928, 178, 616, 326, 43, 593, 646, 275),
                (284, 201, 928, 178, 616, 86, 43, 593, 646, 293),
            ),
            ("s1928TargetA", "s1928TargetB", "s1928TargetC", "s1928TargetD"),
        ),
        CellSpec(
            "s3928",
            "s3",
            (344, 225, 928, 306, 588, 150, 45, 579, 533, 267),
            ("u", "Q1", "Q2", "Pw", "Pu", "s1", "s2", "s3"),
            "s3928",
            (
                (408, 225, 928, 306, 556, 86, 43, 593, 646, 269),
                (408, 225, 928, 306, 588, 150, 45, 579, 533, 267),
                (408, 225, 928, 338, 46, 596, 51, 585, 646, 269),
                (408, 225, 928, 338, 588, 150, 45, 579, 533, 267),
            ),
            (
                "s3928TargetA",
                "s3928TargetB",
                "s3928TargetC",
                "s3928TargetD",
                "s3928TargetE",
            ),
        ),
        CellSpec(
            "s2864",
            "s2",
            (284, 209, 864, 102, 680, 533, 178, 75, 646, 297),
            ("u", "Q1", "Q2", "Pw", "Pu", "s1", "s3", "s2"),
            "s2864",
            (
                (284, 209, 864, 291, 172, 533, 178, 105, 582, 394),
                (284, 209, 864, 291, 680, 533, 178, 105, 582, 394),
                (284, 209, 864, 294, 680, 533, 178, 105, 582, 267),
                (284, 209, 864, 294, 680, 533, 178, 105, 582, 394),
                (284, 209, 864, 294, 680, 533, 178, 105, 646, 267),
            ),
            (
                "s2864TargetC",
                "s2864TargetA",
                "s2864TargetB",
                "s2864TargetD",
                "s2864TargetE",
                "s2864TargetF",
            ),
        ),
    )
}


def mask_has(mask: int, label: str) -> bool:
    return bool(mask & (1 << LABEL_INDEX[label]))


def mask_card(mask: int) -> int:
    return sum(mask_has(mask, label) for label in LABELS)


def mask_inter_card(left: int, right: int) -> int:
    return sum(mask_has(left, label) and mask_has(right, label) for label in LABELS)


def mask_of(labels: tuple[str, ...]) -> int:
    return sum(1 << LABEL_INDEX[label] for label in labels)


def between(a: str, b: str, x: str) -> bool:
    da = (HULL_ORDER.index(x) - HULL_ORDER.index(a)) % len(LABELS)
    db = (HULL_ORDER.index(b) - HULL_ORDER.index(a)) % len(LABELS)
    return 0 < da < db


def separated(a: str, b: str, x: str, y: str) -> bool:
    return between(a, b, x) != between(a, b, y)


def cross_separation_ok(c: str, cmask: int, cp: str, cpmask: int) -> bool:
    for x, y in LABEL_PAIRS:
        if x in {c, cp} or y in {c, cp}:
            continue
        if (
            mask_has(cmask, x)
            and mask_has(cmask, y)
            and mask_has(cpmask, x)
            and mask_has(cpmask, y)
            and not separated(c, cp, x, y)
        ):
            return False
    return True


def candidate_mask_ok(sstar: str, center: str, mask: int) -> bool:
    cv_no_u = mask_of(("w", "Pw", "Pu"))
    cw_no_u = mask_of(("v", "Q1", "Q2"))
    cv_no_w = mask_of(("u", "Pw", "Pu"))
    cu_no_w = mask_of(("v", "s1", "s2", "s3"))
    u_pw_pu = mask_of(("u", "Pw", "Pu"))
    if mask >= 1 << len(LABELS) or mask_card(mask) != 4 or mask_has(mask, center):
        return False
    if center == "v" and mask != mask_of(("Pu", "Pw", "u", sstar)):
        return False
    if center == "w" and not (
        mask_has(mask, "Q1")
        and mask_has(mask, "Q2")
        and mask_inter_card(mask, cu_no_w) == 1
        and mask_inter_card(mask, cv_no_w) == 1
    ):
        return False
    if center == "u" and (
        mask_inter_card(mask, cv_no_u) > 1 or mask_inter_card(mask, cw_no_u) > 1
    ):
        return False
    if center == "w" and (
        mask_inter_card(mask, cv_no_w) > 1 or mask_inter_card(mask, cu_no_w) > 1
    ):
        return False
    if center not in {"u", "v", "w"} and all(mask_has(mask, x) for x in ("u", "v", "w")):
        return False
    if center in {"u", "Q1", "Q2"}:
        return not (mask_has(mask, sstar) and mask_inter_card(mask, u_pw_pu) >= 1)
    if center == sstar:
        return mask_inter_card(mask, u_pw_pu) <= 1
    return True


def candidate_domain(spec: CellSpec, center: str) -> tuple[int, ...]:
    return tuple(
        mask
        for mask in range(1 << len(LABELS))
        if candidate_mask_ok(spec.sstar, center, mask)
        and all(
            cross_separation_ok(center, mask, fixed, fixed_mask)
            for fixed, fixed_mask in spec.fixed.items()
        )
    )


@dataclass(frozen=True)
class Encoding:
    variables: dict[tuple[str, int], int]
    domains: dict[str, tuple[int, ...]]
    clauses: list[tuple[int, ...]]
    clause_counts: dict[str, int]


def build_encoding(spec: CellSpec) -> Encoding:
    domains = {
        center: candidate_domain(spec, center) for center in spec.free_centers
    }
    variables: dict[tuple[str, int], int] = {}
    for center in spec.free_centers:
        for mask in domains[center]:
            variables[(center, mask)] = len(variables) + 1

    clauses: list[tuple[int, ...]] = []
    counts: dict[str, int] = {}

    def finish_family(name: str, start: int) -> None:
        counts[name] = len(clauses) - start

    start = len(clauses)
    for center in spec.free_centers:
        clauses.append(tuple(variables[(center, mask)] for mask in domains[center]))
    finish_family("at_least_one", start)

    start = len(clauses)
    for center in spec.free_centers:
        domain = domains[center]
        for index, left in enumerate(domain):
            for right in domain[index + 1 :]:
                clauses.append((-variables[(center, left)], -variables[(center, right)]))
    finish_family("at_most_one", start)

    start = len(clauses)
    for cindex, center in enumerate(spec.free_centers):
        for other in spec.free_centers[cindex + 1 :]:
            for mask in domains[center]:
                for other_mask in domains[other]:
                    if not cross_separation_ok(center, mask, other, other_mask):
                        clauses.append((-variables[(center, mask)], -variables[(other, other_mask)]))
    finish_family("cross_separation", start)

    start = len(clauses)
    for target in spec.targets:
        clauses.append(
            tuple(-variables[(center, target[center])] for center in spec.free_centers)
        )
    finish_family("block_target", start)
    return Encoding(variables, domains, clauses, counts)


def enumerate_separation_models(
    spec: CellSpec, domains: dict[str, tuple[int, ...]]
) -> list[dict[str, int]]:
    """Exhaustively enumerate separation-compatible tuples without reading the CNF."""
    order = tuple(
        sorted(
            spec.free_centers,
            key=lambda center: (len(domains[center]), LABEL_INDEX[center]),
        )
    )
    models: list[dict[str, int]] = []
    chosen: dict[str, int] = dict(spec.fixed)

    def visit(depth: int) -> None:
        if depth == len(order):
            models.append({center: chosen[center] for center in LABELS})
            return
        center = order[depth]
        for mask in domains[center]:
            if all(
                cross_separation_ok(center, mask, other, other_mask)
                for other, other_mask in chosen.items()
            ):
                chosen[center] = mask
                visit(depth + 1)
                del chosen[center]

    visit(0)
    return models


def tree_order(
    spec: CellSpec, domains: dict[str, tuple[int, ...]]
) -> tuple[str, ...]:
    """Return the cell's measured static decision-tree order."""
    if set(domains) != set(spec.tree_order):
        raise SystemExit("tree order does not cover the candidate-domain centers exactly")
    return spec.tree_order


def build_compatibility_certificate(
    spec: CellSpec, domains: dict[str, tuple[int, ...]],
) -> tuple[dict[str, object], dict[str, int], tuple[str, ...]]:
    """Build a complete separation tree with concrete earlier-choice prunes."""
    order = tree_order(spec, domains)
    stats = {"partial_states": 0, "split_nodes": 0, "prune_nodes": 0, "done_nodes": 0}

    def visit(depth: int, assigned: tuple[tuple[str, int], ...]) -> dict[str, object]:
        stats["partial_states"] += 1
        if depth == len(order):
            if not any(
                all(mask == target[center] for center, mask in assigned)
                for target in spec.targets
            ):
                raise SystemExit(
                    "compatibility certificate reached a completion outside the target set"
                )
            stats["done_nodes"] += 1
            return {"kind": "done"}

        center = order[depth]
        branches: list[dict[str, object]] = []
        stats["split_nodes"] += 1
        for mask in domains[center]:
            witness = next(
                (
                    (other, other_mask)
                    for other, other_mask in assigned
                    if not cross_separation_ok(center, mask, other, other_mask)
                ),
                None,
            )
            if witness is not None:
                stats["prune_nodes"] += 1
                branches.append(
                    {
                        "mask": mask,
                        "child": {
                            "kind": "prune",
                            "against_center": witness[0],
                            "against_mask": witness[1],
                        },
                    }
                )
            else:
                branches.append(
                    {
                        "mask": mask,
                        "child": visit(depth + 1, ((center, mask),) + assigned),
                    }
                )
        return {"kind": "split", "center": center, "branches": branches}

    certificate = visit(0, ())
    return certificate, stats, order


def lean_label(label: str) -> str:
    return f".{label}"


def render_lean_certificate(node: dict[str, object], indent: int = 0) -> str:
    kind = node["kind"]
    if kind == "done":
        return ".done"
    if kind == "prune":
        return f".prune {lean_label(str(node['against_center']))} {node['against_mask']}"
    branches = node["branches"]
    assert isinstance(branches, list)
    padding = " " * indent
    child_padding = " " * (indent + 2)
    rendered = [
        f"{child_padding}({branch['mask']}, "
        f"{render_lean_certificate(branch['child'], indent + 4)})"
        for branch in branches
    ]
    return ".split [\n" + ",\n".join(rendered) + f"\n{padding}]"


def write_tree_proof(
    spec: CellSpec,
    module_dir: Path,
    domains: dict[str, tuple[int, ...]],
    module_prefix: str,
    certificate_json: Path | None,
) -> tuple[Path, dict[str, int]]:
    """Emit JSON and root-mask Lean shards for the structural certificate."""
    module_dir.mkdir(parents=True, exist_ok=True)
    certificate, stats, order = build_compatibility_certificate(spec, domains)
    if stats["done_nodes"] != len(spec.targets):
        raise SystemExit(
            f"certificate has {stats['done_nodes']} completions, "
            f"expected {len(spec.targets)}"
        )
    if certificate_json is not None:
        certificate_json.parent.mkdir(parents=True, exist_ok=True)
        certificate_metadata = {
            "schema": TREE_SCHEMA,
            "cell": spec.key,
            "sstar": spec.sstar,
            "fixed": spec.fixed,
            "target": spec.target,
            "order": order,
            "stats": stats,
            "certificate": certificate,
        }
        if len(spec.targets) > 1:
            certificate_metadata.pop("target")
            certificate_metadata["targets"] = spec.targets
        certificate_json.write_text(json.dumps(certificate_metadata, indent=2) + "\n")

    root_branches = certificate["branches"]
    assert isinstance(root_branches, list)
    namespace = spec.lean_namespace
    fixed_def = f"{spec.lean_stem}Fixed"
    target_def = f"{spec.lean_stem}Target"
    targets_def = f"{spec.lean_stem}Targets"
    multiple_targets = len(spec.targets) > 1
    checker = (
        "checkCompatibilityCertificateForTargets"
        if multiple_targets
        else "checkCompatibilityCertificate"
    )
    checker_target = targets_def if multiple_targets else target_def
    sstar_literal = lean_label(spec.sstar)
    target_list = ", ".join(map(str, spec.target_masks))
    emitted_modules: list[str] = []

    def emit_shard(
        module: str,
        node: dict[str, object],
        remaining_order: tuple[str, ...],
        assigned: tuple[tuple[str, int], ...],
    ) -> None:
        assert node["kind"] == "split"
        rendered = render_lean_certificate(node, 2)
        imports = "import Erdos9796Proof.P97.SurplusCOMPGBankCoverage\n"
        proof = "  decide"
        if len(rendered) > 180_000:
            branches = node["branches"]
            assert isinstance(branches, list) and remaining_order
            current = remaining_order[0]
            entries: list[str] = []
            checks: list[str] = []
            child_imports: list[str] = []
            for index, branch in enumerate(branches):
                mask = int(branch["mask"])
                child = branch["child"]
                assert isinstance(child, dict)
                if child["kind"] == "split":
                    child_module = f"{module}Child{index:02d}"
                    emit_shard(
                        child_module,
                        child,
                        remaining_order[1:],
                        ((current, mask),) + assigned,
                    )
                    child_imports.append(f"import {module_prefix}.{child_module}\n")
                    entries.append(f"    ({mask}, {child_module}.certificate)")
                    checks.append(f"{child_module}.checked")
                else:
                    entries.append(
                        f"    ({mask}, {render_lean_certificate(child, 4)})"
                    )
                    checks.append("by decide")
            imports += "".join(child_imports)
            rendered = ".split [\n" + ",\n".join(entries) + "\n  ]"
            proof = (
                f"  simp only [certificate, {checker}, List.map_cons,\n"
                "    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]\n"
                "  refine ⟨by decide, ?_⟩\n"
                "  exact ⟨" + ", ".join(checks + ["True.intro"]) + "⟩"
            )

        remaining = ", ".join(lean_label(center) for center in remaining_order)
        assigned_lean = ", ".join(
            f"({lean_label(center)}, {mask})" for center, mask in assigned
        )
        shard_path = module_dir / f"{module}.lean"
        shard_path.write_text(
            imports
            + f"\nnamespace Problem97.{namespace}."
            + module
            + "\n\n"
            "open SurplusCOMPGBank SurplusCOMPGBankCoverage\n\n"
            "def certificate : CompatibilityCertificate :=\n  "
            + rendered
            + "\n\nset_option maxRecDepth 100000 in\n"
            "theorem checked :\n"
            f"    {checker} {sstar_literal} {fixed_def} {checker_target}\n"
            f"      [{remaining}] [{assigned_lean}] certificate = true := by\n"
            + proof
            + f"\n\nend Problem97.{namespace}."
            + module
            + "\n"
        )
        emitted_modules.append(module)

    shard_names: list[tuple[int, str]] = []
    for index, branch in enumerate(root_branches):
        mask = int(branch["mask"])
        child = branch["child"]
        assert isinstance(child, dict) and child["kind"] == "split"
        module = f"Shard{index:02d}"
        shard_names.append((mask, module))
        emit_shard(
            module,
            child,
            order[1:],
            ((order[0], mask),),
        )

    imports = "".join(
        f"import {module_prefix}.{module}\n" for _, module in shard_names
    )
    root_entries = ",\n".join(
        f"    ({mask}, {module}.certificate)" for mask, module in shard_names
    )
    root_checks = ", ".join(
        [f"{module}.checked" for _, module in shard_names] + ["True.intro"]
    )
    if multiple_targets:
        target_lists = tuple(", ".join(map(str, masks)) for masks in spec.all_target_masks)
        target_rows = "[" + ", ".join(f"[{row}]" for row in target_lists) + "]"
        target_patterns = " | ".join(
            f"htarget{index}" for index, _ in enumerate(spec.targets)
        )
        membership_cases: list[str] = []
        for index, target_name in enumerate(spec.target_defs):
            proof = f"by simpa [allLabels, {target_name}] using hmasks"
            if index < len(spec.targets) - 1:
                result = f"Or.inl ({proof})"
            else:
                result = proof
            for _ in range(index):
                result = f"Or.inr ({result})"
            membership_cases.append(
                "  · subst target\n"
                "    have hmasks := validFragmentMasksEqTarget hvalid hv hw\n"
                "      (by decide) (by decide) hfree\n"
                f"    exact {result}"
            )
        rendered_membership_cases = "\n".join(membership_cases)
        root_consequences = (
            "theorem targetExists (choice : Label → Nat)\n"
            f"    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain {sstar_literal} {fixed_def} center)\n"
            "    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →\n"
            "      crossSeparationOKForMasks center (choice center) other (choice other) = true) :\n"
            f"    ∃ target ∈ {targets_def}, ∀ center ∈ order, choice center = target center := by\n"
            "  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)\n"
            "      (by simp) hseparation with ⟨target, htarget, hfree, _⟩\n"
            "  exact ⟨target, htarget, hfree⟩\n\n"
            "theorem validFragmentTargetExists {shadow : Shadow}\n"
            f"    (hvalid : isValidPinnedFragment {sstar_literal} shadow = true)\n"
            f"    (hv : shadow.centerMask .v = {spec.target['v']})\n"
            f"    (hw : shadow.centerMask .w = {spec.target['w']}) :\n"
            f"    ∃ target ∈ {targets_def},\n"
            "      ∀ center ∈ order, shadow.centerMask center = target center := by\n"
            "  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid\n"
            "  · intro center hcenter entry hentry\n"
            f"    simp [order, {fixed_def}] at hcenter hentry ⊢\n"
            "    rcases hentry with hentry | hentry <;> subst entry <;>\n"
            "      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide\n"
            "  · intro entry hentry\n"
            f"    simp [{fixed_def}] at hentry\n"
            "    rcases hentry with hentry | hentry <;> subst entry\n"
            "    · exact hv\n"
            "    · exact hw\n\n"
            "private theorem validFragmentMasksEqTarget {shadow : Shadow}\n"
            f"    (hvalid : isValidPinnedFragment {sstar_literal} shadow = true)\n"
            f"    (hv : shadow.centerMask .v = {spec.target['v']})\n"
            f"    (hw : shadow.centerMask .w = {spec.target['w']})\n"
            "    {target : Label → Nat}\n"
            f"    (htargetV : target .v = {spec.target['v']})\n"
            f"    (htargetW : target .w = {spec.target['w']})\n"
            "    (hfree : ∀ center ∈ order, shadow.centerMask center = target center) :\n"
            "    shadow.masks = allLabels.map target := by\n"
            "  have hcenter : ∀ center, shadow.centerMask center = target center := by\n"
            "    intro center\n"
            "    cases center with\n"
            "    | v => exact hv.trans htargetV.symm\n"
            "    | w => exact hw.trans htargetW.symm\n"
            "    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>\n"
            "        exact hfree _ (by simp [order])\n"
            "  exact shadow_masks_eq_map_of_hasTenMasks\n"
            "    (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter\n\n"
            "theorem validFragmentMasksMemTargets {shadow : Shadow}\n"
            f"    (hvalid : isValidPinnedFragment {sstar_literal} shadow = true)\n"
            f"    (hv : shadow.centerMask .v = {spec.target['v']})\n"
            f"    (hw : shadow.centerMask .w = {spec.target['w']}) :\n"
            f"    shadow.masks ∈ {target_rows} := by\n"
            "  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩\n"
            f"  simp only [{targets_def}, List.mem_cons, List.not_mem_nil, or_false] at htarget\n"
            "  simp only [List.mem_cons, List.not_mem_nil, or_false]\n"
            f"  rcases htarget with {target_patterns}\n"
            + rendered_membership_cases
            + "\n\n"
            "theorem memDepth2SubtreeResult_memTargets {result : List Nat}\n"
            f"    (hresult : result ∈ depth2SubtreeResult {sstar_literal} {spec.target['w']}) :\n"
            f"    result ∈ {target_rows} := by\n"
            "  have hdata := mem_depth2SubtreeResult_iff.mp hresult\n"
            "  apply validFragmentMasksMemTargets (shadow := { masks := result })\n"
            "  · exact hdata.1\n"
            "  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,\n"
            "      Label.bit, Label.index] using hdata.2.1\n"
            "  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2\n\n"
        )
    else:
        root_consequences = (
            "theorem forcesTarget (choice : Label → Nat)\n"
            f"    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain {sstar_literal} {fixed_def} center)\n"
            "    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →\n"
            "      crossSeparationOKForMasks center (choice center) other (choice other) = true) :\n"
            f"    ∀ center ∈ order, choice center = {target_def} center := by\n"
            "  exact (target_of_checkCompatibilityCertificate checked hchoice (by simp)\n"
            "    (by simp) hseparation).1\n\n"
            "theorem validFragmentForcesTarget {shadow : Shadow}\n"
            f"    (hvalid : isValidPinnedFragment {sstar_literal} shadow = true)\n"
            f"    (hv : shadow.centerMask .v = {spec.target['v']})\n"
            f"    (hw : shadow.centerMask .w = {spec.target['w']}) :\n"
            f"    ∀ center ∈ order, shadow.centerMask center = {target_def} center := by\n"
            "  apply validFragment_target_of_checkCompatibilityCertificate checked hvalid\n"
            "  · intro center hcenter entry hentry\n"
            f"    simp [order, {fixed_def}] at hcenter hentry ⊢\n"
            "    rcases hentry with hentry | hentry <;> subst entry <;>\n"
            "      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide\n"
            "  · intro entry hentry\n"
            f"    simp [{fixed_def}] at hentry\n"
            "    rcases hentry with hentry | hentry <;> subst entry\n"
            "    · exact hv\n"
            "    · exact hw\n\n"
            "theorem validFragmentMasksEqTarget {shadow : Shadow}\n"
            f"    (hvalid : isValidPinnedFragment {sstar_literal} shadow = true)\n"
            f"    (hv : shadow.centerMask .v = {spec.target['v']})\n"
            f"    (hw : shadow.centerMask .w = {spec.target['w']}) :\n"
            f"    shadow.masks = [{target_list}] := by\n"
            "  have hfree := validFragmentForcesTarget hvalid hv hw\n"
            f"  have hcenter : ∀ center, shadow.centerMask center = {target_def} center := by\n"
            "    intro center\n"
            "    cases center with\n"
            "    | v => exact hv\n"
            "    | w => exact hw\n"
            "    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>\n"
            "        exact hfree _ (by simp [order])\n"
            f"  simpa [allLabels, {target_def}] using\n"
            "    shadow_masks_eq_map_of_hasTenMasks\n"
            "      (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter\n\n"
            "theorem memDepth2SubtreeResult_eqTarget {result : List Nat}\n"
            f"    (hresult : result ∈ depth2SubtreeResult {sstar_literal} {spec.target['w']}) :\n"
            f"    result = [{target_list}] := by\n"
            "  have hdata := mem_depth2SubtreeResult_iff.mp hresult\n"
            "  apply validFragmentMasksEqTarget (shadow := { masks := result })\n"
            "  · exact hdata.1\n"
            "  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,\n"
            "      Label.bit, Label.index] using hdata.2.1\n"
            "  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2\n\n"
        )
    root_path = module_dir / "Root.lean"
    root_path.write_text(
        imports
        + f"\nnamespace Problem97.{namespace}\n\n"
        "open SurplusCOMPGBank SurplusCOMPGBankCoverage\n\n"
        f"def order : List Label := [{', '.join(lean_label(center) for center in order)}]\n\n"
        "def certificate : CompatibilityCertificate :=\n  .split [\n"
        + root_entries
        + "\n  ]\n\n"
        "set_option maxRecDepth 100000 in\n"
        "theorem checked :\n"
        f"    {checker} {sstar_literal} {fixed_def} {checker_target} order [] certificate = true := by\n"
        f"  simp only [order, certificate, {checker}, List.map_cons,\n"
        "    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]\n"
        "  refine ⟨by decide, ?_⟩\n"
        "  exact ⟨"
        + root_checks
        + "⟩\n\n"
        + root_consequences
        + f"end Problem97.{namespace}\n"
    )
    return root_path, stats


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_outputs(
    spec: CellSpec, output_dir: Path, encoding: Encoding
) -> tuple[Path, Path]:
    output_dir.mkdir(parents=True, exist_ok=True)
    models = enumerate_separation_models(spec, encoding.domains)
    target_models = list(spec.targets)
    if models != target_models:
        raise SystemExit(
            f"separation oracle found {len(models)} models; "
            f"expected {len(target_models)} targets"
        )

    cnf_path = output_dir / f"{spec.file_stem}-block-target.cnf"
    target_description = (
        "target tuple blocked"
        if len(spec.targets) == 1
        else f"{len(spec.targets)} target tuples blocked"
    )
    dimacs = [
        (
            f"c surplus COMP-G singleton sstar={spec.sstar} "
            f"wmask={spec.target['w']}; {target_description}"
        ),
        f"p cnf {len(encoding.variables)} {len(encoding.clauses)}",
    ]
    dimacs.extend(" ".join(map(str, clause)) + " 0" for clause in encoding.clauses)
    cnf_path.write_text("\n".join(dimacs) + "\n")

    variable_map = [
        {"variable": variable, "center": center, "mask": mask}
        for (center, mask), variable in sorted(encoding.variables.items(), key=lambda item: item[1])
    ]
    variable_path = output_dir / f"{spec.file_stem}-variable-map.json"
    variable_path.write_text(json.dumps({"schema": SCHEMA, "variables": variable_map}, indent=2) + "\n")

    oracle_path = output_dir / f"{spec.file_stem}-uniqueness.json"
    oracle_path.write_text(
        json.dumps(
            {
                "schema": SCHEMA,
                "method": "independent depth-first enumeration of candidate domains and pairwise separation",
                "pair_count_constraints_used": False,
                "model_count": len(models),
                "models": [[model[center] for center in LABELS] for model in models],
            },
            indent=2,
        )
        + "\n"
    )

    manifest_path = output_dir / f"{spec.file_stem}-cnf-manifest.json"
    manifest_path.write_text(
        json.dumps(
            {
                "schema": SCHEMA,
                "cell": spec.key,
                "sstar": spec.sstar,
                "fixed": spec.fixed,
                "free_centers": spec.free_centers,
                "label_order": LABELS,
                "target_masks": (
                    spec.target_masks
                    if len(spec.targets) == 1
                    else spec.all_target_masks
                ),
                "pair_count_constraints_used": False,
                "variable_count": len(encoding.variables),
                "clause_count": len(encoding.clauses),
                "clause_counts": encoding.clause_counts,
                "domain_sizes": {center: len(domain) for center, domain in encoding.domains.items()},
                "domains": encoding.domains,
                "files": {
                    cnf_path.name: sha256(cnf_path),
                    variable_path.name: sha256(variable_path),
                    oracle_path.name: sha256(oracle_path),
                },
            },
            indent=2,
        )
        + "\n"
    )
    return cnf_path, manifest_path


def run_solver(
    spec: CellSpec, output_dir: Path, cnf_path: Path
) -> dict[str, object]:
    cadical = shutil.which("cadical")
    drat_trim = shutil.which("drat-trim")
    if cadical is None or drat_trim is None:
        raise SystemExit("--solve requires cadical and drat-trim on PATH")
    drat_path = output_dir / f"{spec.file_stem}-unsat.drat"
    lrat_path = output_dir / f"{spec.file_stem}-unsat.lrat"
    cadical_run = subprocess.run(
        [cadical, "--plain", "--no-binary", str(cnf_path), str(drat_path)],
        text=True,
        capture_output=True,
        check=False,
    )
    if cadical_run.returncode != 20:
        raise SystemExit(f"CaDiCaL returned {cadical_run.returncode}, expected UNSAT (20)")
    trim_run = subprocess.run(
        [drat_trim, str(cnf_path), str(drat_path), "-L", str(lrat_path)],
        text=True,
        capture_output=True,
        check=False,
    )
    if trim_run.returncode != 0:
        raise SystemExit(f"drat-trim returned {trim_run.returncode}: {trim_run.stderr[-500:]}")
    result = {
        "schema": SCHEMA,
        "cadical_exit": cadical_run.returncode,
        "cadical_result": "UNSAT",
        "drat_trim_exit": trim_run.returncode,
        "cnf_bytes": cnf_path.stat().st_size,
        "drat_bytes": drat_path.stat().st_size,
        "lrat_bytes": lrat_path.stat().st_size,
        "drat_sha256": sha256(drat_path),
        "lrat_sha256": sha256(lrat_path),
    }
    (output_dir / f"{spec.file_stem}-solver-result.json").write_text(
        json.dumps(result, indent=2) + "\n"
    )
    return result


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cell", choices=tuple(CELL_SPECS), default="s1777")
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument(
        "--tree-proof-dir",
        type=Path,
        help="emit structural-certificate Lean modules directly into this directory",
    )
    parser.add_argument(
        "--tree-module-prefix",
        default=None,
        help="fully qualified repository module prefix for generated shard imports",
    )
    parser.add_argument(
        "--tree-certificate-json",
        type=Path,
        help="optionally emit the machine-readable structural certificate here",
    )
    parser.add_argument("--solve", action="store_true")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    spec = CELL_SPECS[args.cell]
    encoding = build_encoding(spec)
    cnf_path, manifest_path = write_outputs(spec, args.output_dir, encoding)
    tree_result = None
    if args.tree_proof_dir is not None:
        root_path, tree_stats = write_tree_proof(
            spec,
            args.tree_proof_dir,
            encoding.domains,
            args.tree_module_prefix or spec.module_prefix,
            args.tree_certificate_json,
        )
        tree_result = {"root": str(root_path), "stats": tree_stats}
    result = run_solver(spec, args.output_dir, cnf_path) if args.solve else None
    print(
        json.dumps(
            {
                "cnf": str(cnf_path),
                "manifest": str(manifest_path),
                "variables": len(encoding.variables),
                "clauses": len(encoding.clauses),
                "domain_sizes": {
                    center: len(domain) for center, domain in encoding.domains.items()
                },
                "solver": result,
                "tree_certificate": tree_result,
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
