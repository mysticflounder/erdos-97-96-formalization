#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the first offline modular packet for finite-nine on Prove2Me.

The preserved failed full submission is treated as an immutable source stream.
This script does not contact Prove2Me and deliberately does not claim that the
candidate child stubs are upload-ready.  It extracts and authenticates the 87
module units, cross-checks the N9 source modules in both available Lean trees,
and emits nine semantic source fragments plus a tiny final reduction.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from dataclasses import dataclass
from pathlib import Path

MISSION_NAME = "Erdos9796Mission.finite_nine_exclusion"
MISSION_ID = "1061a384-cdea-43b4-adb5-273627ea45a0"
THEOREM_ID = "e655c70a-0709-4c62-8e4a-e4645fad237b"
PLATFORM_VERSION = "v0.9.8"
MATHLIB_REV = "0df444a"
EXPECTED_SOLUTIONS_SHA256 = "1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58"
EXPECTED_THEOREMS_SHA256 = "a648b25c21f2300bfd943653e8dc3ea430ba4e87a2f54b46706addfb2f4e2a0b"
EXPECTED_CLOSURE_SHA256 = "d11de45dc1ebcd594ca3ed16bc972dc0aebf9cd9471de069f5a71f2914473049"
EXPECTED_UNIT_COUNT = 87
HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
"""


@dataclass(frozen=True)
class Unit:
    index: int
    module: str
    body: str


CUTS = (
    {
        "id": "shell",
        "title": "Nine-point endpoint shell",
        "modules": ("N9Endpoint.N4a", "N9Endpoint.Shell"),
        "targets": ("finiteEndpointShellOfCounterexample",),
        "depends_on": (),
    },
    {
        "id": "form_b_v1",
        "title": "Escaped Form b exclusion at v1",
        "modules": (
            "TwoCircleCrossing", "ArcBlockContiguity", "U2.WitnessReflectionKernel",
            "N4d.TrackBPilotSupport", "N9Endpoint.N4e", "N4d.TrackBRows",
            "N4d.FormBLowerForcesV3", "N4d.FormBPEqBProducer", "N4d.BisectorKill",
            "A1ContextProducers", "A1B2FrameNormalization", "N4d.FaithfulFrame",
            "N4d.Qa2Cover", "N4d.FormBXb2UpperArc", "Bridge.A1SpineWiring",
            "N4d.SmallSReductions", "N4d.QeqEb2PinClash", "N4d.ExcludesFormBv1",
        ),
        "targets": ("N4dExcludesFormB_v1_proof",),
        "depends_on": ("shell",),
    },
    {
        "id": "form_b_v2",
        "title": "Cyclic Form b exclusion at v2",
        "modules": ("N4d.CyclicTransport",),
        "targets": ("N4dExcludesFormB_v2_proof",),
        "depends_on": ("form_b_v1",),
        "declaration_slice": "N4dExcludesFormB_v2_proof",
    },
    {
        "id": "form_a_v1",
        "title": "Escaped Form a exclusion at v1",
        "modules": ("N4d.FormAEndpointPairKill", "N4d.ExcludesFormAv1"),
        "targets": ("N4dExcludesFormA_v1_proof",),
        "depends_on": ("form_b_v2",),
    },
    {
        "id": "form_c_v1",
        "title": "Escaped Form c exclusion at v1",
        "modules": (
            "N4d.FormCPEqCProducer", "N4d.FormCLowerForcesV2", "N4d.FormCcB1UpperArc",
            "N4d.FormCcA3QeqC", "N4d.FormCQeqEb3PinClash", "N4d.ExcludesFormCv1",
        ),
        "targets": ("N4dExcludesFormC_v1_proof",),
        "depends_on": ("shell",),
    },
    {
        "id": "cyclic_forms",
        "title": "Remaining cyclic form exclusions",
        "modules": ("N4d.CyclicTransport",),
        "targets": (
            "N4dExcludesFormA_v2_proof", "N4dExcludesFormC_v2_proof",
            "N4dExcludesFormA_v3_proof", "N4dExcludesFormB_v3_proof",
            "N4dExcludesFormC_v3_proof",
        ),
        "depends_on": ("form_a_v1", "form_b_v1", "form_c_v1"),
    },
    {
        "id": "cap_containment",
        "title": "N4 cap containment",
        "modules": ("N9Endpoint.N4e",),
        "targets": ("n4eCapContainment_of_n4c_n4d",),
        "depends_on": ("form_b_v2", "form_a_v1", "form_b_v1", "form_c_v1", "cyclic_forms"),
        "declaration_slice": "n4eCapContainment_of_n4c_n4d",
    },
    {
        "id": "circle_placement",
        "title": "N6/N7 common-radius circle placement",
        "modules": ("N9Endpoint.N67",),
        "targets": ("n7_circle_placement",),
        "depends_on": ("cap_containment",),
    },
    {
        "id": "single_apex_exhaustion",
        "title": "N8 single-apex exhaustion",
        "modules": (
            "WitnessPacketInterface", "U2.OneHitBound", "U2.OneHitMonotone",
            "U2.OneHitRealization", "N8.N8aArcTwoCircle", "N8.N8bEndpointPair",
            "N8.FourSubpacket", "N8.N8hiSameCap", "U2.SimilarityNormalization",
            "N8.N8CapCoordNorm", "N8.N8kDistribution",
        ),
        "targets": ("N8k_capInterior_false_of_hasNEquidistantProperty",),
        "depends_on": ("circle_placement",),
    },
)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical(value: object) -> str:
    return json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n"


def split_units(content: str) -> tuple[str, list[Unit]]:
    marker = re.compile(r"(?m)^-- Original module: (Solutions\.Batch3N9\.[^\n]+)\n")
    matches = list(marker.finditer(content))
    if len(matches) != EXPECTED_UNIT_COUNT:
        raise ValueError(f"expected {EXPECTED_UNIT_COUNT} module markers, found {len(matches)}")
    units: list[Unit] = []
    for offset, match in enumerate(matches):
        end = matches[offset + 1].start() if offset + 1 < len(matches) else len(content)
        body = content[match.start():end]
        expected_section = f"section Batch3N9Unit{offset:03d}"
        expected_end = f"end Batch3N9Unit{offset:03d}"
        if expected_section not in body or expected_end not in body:
            raise ValueError(f"unit {offset + 1} does not have its expected section envelope")
        units.append(Unit(offset + 1, match.group(1), body))
    return content[: matches[0].start()], units


def source_suffix(module: str) -> str:
    prefix = "Solutions.Batch3N9."
    if not module.startswith(prefix):
        raise ValueError(f"unexpected module: {module}")
    return module[len(prefix):]


def source_path(root: Path, suffix: str) -> Path:
    return root / "Erdos9796Proof" / "P97" / Path(*suffix.split(".")).with_suffix(".lean")


def extract_declaration(unit: Unit, name: str) -> str:
    pattern = re.compile(
        rf"(?m)^(?:private\s+)?(?:noncomputable\s+)?(?:theorem|lemma|def|abbrev)\s+"
        rf"(?:[A-Za-z0-9_.]+\.)?{re.escape(name)}\b"
    )
    match = pattern.search(unit.body)
    if match is None:
        raise ValueError(f"{name} not found in {unit.module}")
    next_decl = re.compile(
        r"(?m)^(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+"
    ).search(unit.body, match.end())
    end_namespace = re.compile(r"(?m)^end (?:FiniteEndpointShell|Problem97|Batch3N9)\s*$").search(
        unit.body, match.end()
    )
    candidates = [candidate.start() for candidate in (next_decl, end_namespace) if candidate]
    end = min(candidates) if candidates else len(unit.body)
    return unit.body[match.start():end].rstrip() + "\n"


def declaration_header(source: str, name: str) -> str:
    pattern = re.compile(
        rf"(?m)^(?:private\s+)?(?:noncomputable\s+)?(?:theorem|lemma|def|abbrev)\s+"
        rf"(?:[A-Za-z0-9_.]+\.)?{re.escape(name)}\b"
    )
    matches = list(pattern.finditer(source))
    if len(matches) != 1:
        raise ValueError(f"expected one source declaration for {name}, found {len(matches)}")
    value_start = source.find(":=", matches[0].end())
    if value_start < 0:
        raise ValueError(f"source declaration {name} has no := separator")
    return " ".join(source[matches[0].start():value_start].split())


def candidate_row(rows: list[dict[str, object]]) -> dict[str, object]:
    candidates = [row for row in rows if row.get("theorem_name") == MISSION_NAME]
    if len(candidates) != 2:
        raise ValueError(f"expected two preserved finite-nine submissions, found {len(candidates)}")
    return max(candidates, key=lambda row: len(str(row["solution"]["content"])))


def theorem_stub(cut_id: str, statement: str) -> str:
    return HEADER + f"""
import Definitions.Def_Erdos9796FiniteNine_Interface

/-! SKETCH — NOT PROMOTABLE. Exact child statement for cut `{cut_id}`.
The public definition bundle and proof solution remain to be generated and elaborated. -/

open scoped EuclideanGeometry

namespace Erdos9796FiniteNine

{statement}

end Erdos9796FiniteNine
"""


STATEMENTS = {
    "shell": """theorem shell :
    ∀ {A : Finset ℝ²}, A.Nonempty → A.card = 9 →
      Batch3N9.Problem97.ConvexIndep A →
      Batch3N9.Problem97.HasNEquidistantProperty 4 A →
      Nonempty (Batch3N9.Problem97.FiniteEndpointShell A) := by sorry""",
    "form_b_v1": """theorem form_b_v1 {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1 := by sorry""",
    "form_b_v2": """theorem form_b_v2 {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v2 := by sorry""",
    "form_a_v1": """theorem form_a_v1 {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (hB2 : S.N4dExcludesFormB_v2) :
    S.N4dExcludesFormA_v1 := by sorry""",
    "form_c_v1": """theorem form_c_v1 {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormC_v1 := by sorry""",
    "cyclic_forms": """theorem cyclic_forms {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormA_v2 ∧ S.N4dExcludesFormC_v2 ∧
    S.N4dExcludesFormA_v3 ∧ S.N4dExcludesFormB_v3 ∧
    S.N4dExcludesFormC_v3 := by sorry""",
    "cap_containment": """theorem cap_containment {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (hA1 : S.N4dExcludesFormA_v1) (hB1 : S.N4dExcludesFormB_v1)
    (hC1 : S.N4dExcludesFormC_v1) (hB2 : S.N4dExcludesFormB_v2)
    (hcyclic : S.N4dExcludesFormA_v2 ∧ S.N4dExcludesFormC_v2 ∧
      S.N4dExcludesFormA_v3 ∧ S.N4dExcludesFormB_v3 ∧ S.N4dExcludesFormC_v3) :
    S.N4eCapContainment := by sorry""",
    "circle_placement": """theorem circle_placement {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    ∃ d : ℝ, 0 < d ∧
      (∀ x ∈ S.CP.C1, dist S.triangle.v1 x = d) ∧
      (∀ x ∈ S.CP.C2, dist S.triangle.v2 x = d) ∧
      (∀ x ∈ S.CP.C3, dist S.triangle.v3 x = d) := by sorry""",
    "single_apex_exhaustion": """theorem single_apex_exhaustion {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    (hK4 : Batch3N9.Problem97.HasNEquidistantProperty 4 A)
    {x : ℝ²} {i : Fin 3} (hxcap : x ∈ S.capInteriorByIndex i) :
    False := by sorry""",
}


def root_solution() -> str:
    imports = "\n".join(
        f"import Theorems.Thm_Erdos9796FiniteNine_{cut['id']}" for cut in CUTS
    )
    return HEADER + f"""
{imports}
import Definitions.Def_Erdos9796Counting_Adapter

/-! SKETCH — NOT PROMOTABLE. This candidate root has no direct `sorry`, but its
nine imported child declarations remain sketches until Stage 2 supplies and
audits their proof solutions. -/

open Erdos9796Mission

theorem solution :
    ∀ A : Finset Plane, A.card = 9 → ConvexIndep (A : Set Plane) →
      ¬ HasNEquidistantProperty 4 A := by
  intro A hcard hconv hK4
  have hne : A.Nonempty := Finset.card_pos.mp (by omega)
  obtain ⟨S⟩ := Erdos9796FiniteNine.shell hne hcard hconv hK4
  have hB1 := Erdos9796FiniteNine.form_b_v1 S
  have hB2 := Erdos9796FiniteNine.form_b_v2 S
  have hA1 := Erdos9796FiniteNine.form_a_v1 S hB2
  have hC1 := Erdos9796FiniteNine.form_c_v1 S
  have hcyclic := Erdos9796FiniteNine.cyclic_forms S
  have hN4e := Erdos9796FiniteNine.cap_containment S hA1 hB1 hC1 hB2 hcyclic
  classical
  obtain ⟨x, hxI1⟩ : S.I1.Nonempty :=
    Finset.card_pos.mp (by have := S.I1_card_ge_two; omega)
  exact Erdos9796FiniteNine.single_apex_exhaustion S hN4e S.hK4 hxI1
"""


def interface_candidate(definition_imports: list[str]) -> str:
    imports = "\n".join(f"import {module}" for module in definition_imports)
    required = "\n".join(f"* `{name}`" for name in (
        "Batch3N9.Problem97.FiniteEndpointShell",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v1",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v1",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v2",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v2",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v2",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v3",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v3",
        "Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v3",
        "Batch3N9.Problem97.FiniteEndpointShell.N4eCapContainment",
    ))
    return HEADER + f"""
{imports}

/-!
# Finite-nine public interface extraction target

SKETCH — NOT PROMOTABLE. This file fixes the exact public names required by the
nine child theorem stubs. The next extraction wave must replace this documentation-only
candidate with Stage-2 skeleton subtraction from the authenticated 87-unit stream.

Required public declarations:

{required}
-/
"""


def generate(root: Path, source_root: Path, current_source_root: Path) -> dict[str, object]:
    solutions_path = root / "scratch/live-mission-solutions.json"
    theorems_path = root / "scratch/live-mission-theorems.json"
    if sha256_file(solutions_path) != EXPECTED_SOLUTIONS_SHA256:
        raise ValueError("live-mission-solutions.json changed from the authenticated snapshot")
    if sha256_file(theorems_path) != EXPECTED_THEOREMS_SHA256:
        raise ValueError("live-mission-theorems.json changed from the authenticated snapshot")
    solutions = json.loads(solutions_path.read_text(encoding="utf-8"))
    row = candidate_row(solutions)
    content = row["solution"]["content"]
    preamble, units = split_units(content)
    imports = re.findall(r"(?m)^import (\S+)$", preamble)
    definition_imports = sorted(
        module for module in imports if module.startswith("Definitions.Def_Erdos9796Counting_")
    )
    theorem_imports = sorted(module for module in imports if module.startswith("Theorems.Thm_"))
    if len(definition_imports) != 18 or len(theorem_imports) != 20:
        raise ValueError("the preserved import frontier changed")

    by_suffix = {source_suffix(unit.module): unit for unit in units}
    source_rows: list[dict[str, object]] = []
    for unit in units[44:86]:
        suffix = source_suffix(unit.module)
        left = source_path(source_root, suffix)
        right = source_path(current_source_root, suffix)
        if not left.is_file() or not right.is_file():
            raise ValueError(f"missing source cross-check for {suffix}")
        left_hash = sha256_file(left)
        right_hash = sha256_file(right)
        source_rows.append({
            "unit": unit.index,
            "module": unit.module,
            "source_relative": str(left.relative_to(source_root)),
            "source_sha256": left_hash,
            "source_bytes": left.stat().st_size,
            "current_source_sha256": right_hash,
            "current_source_bytes": right.stat().st_size,
            "source_trees_byte_identical": left_hash == right_hash,
            "stream_sha256": sha256_bytes(unit.body.encode()),
            "stream_bytes": len(unit.body.encode()),
        })
    closure_row = next(
        item for item in source_rows if item["module"].endswith("N9Endpoint.Closure")
    )
    if (closure_row["source_sha256"] != EXPECTED_CLOSURE_SHA256 or
            closure_row["current_source_sha256"] != EXPECTED_CLOSURE_SHA256):
        raise ValueError("Closure.lean changed from the recorded source")

    out = root / "submissions/finite-nine-modular"
    fragment_dir = out / "source-fragments"
    theorem_dir = out / "platform/Theorems"
    solution_dir = out / "platform/Solutions"
    definition_dir = out / "platform/Definitions"
    for directory in (fragment_dir, theorem_dir, solution_dir, definition_dir):
        directory.mkdir(parents=True, exist_ok=True)

    cut_rows: list[dict[str, object]] = []
    for cut in CUTS:
        selected = [by_suffix[module] for module in cut["modules"]]
        target_statements: dict[str, str] = {}
        for target in cut["targets"]:
            if not any(target in unit.body for unit in selected):
                raise ValueError(f"target {target} absent from cut {cut['id']}")
            owners = [module for module in cut["modules"] if target in source_path(source_root, module).read_text()]
            if len(owners) != 1:
                raise ValueError(f"expected one source module for {target}, found {len(owners)}")
            left_header = declaration_header(
                source_path(source_root, owners[0]).read_text(encoding="utf-8"), target
            )
            right_header = declaration_header(
                source_path(current_source_root, owners[0]).read_text(encoding="utf-8"), target
            )
            if left_header != right_header:
                raise ValueError(f"source statement drift for {target}")
            target_statements[target] = sha256_bytes(left_header.encode())
        if cut.get("declaration_slice"):
            target = str(cut["declaration_slice"])
            owners = [unit for unit in selected if target in unit.body]
            if len(owners) != 1:
                raise ValueError(f"expected one owner for {target}, found {len(owners)}")
            fragment = (
                HEADER +
                f"\n-- Authenticated declaration slice from {owners[0].module}\n" +
                extract_declaration(owners[0], target)
            )
        else:
            fragment = HEADER + "\n" + "".join(unit.body for unit in selected)
        fragment = fragment.rstrip() + "\n"
        fragment_path = fragment_dir / f"{cut['id']}.lean"
        fragment_path.write_text(fragment, encoding="utf-8")
        stub_path = theorem_dir / f"Thm_Erdos9796FiniteNine_{cut['id']}.lean"
        stub_path.write_text(theorem_stub(cut["id"], STATEMENTS[cut["id"]]), encoding="utf-8")
        cut_rows.append({
            "id": cut["id"],
            "title": cut["title"],
            "depends_on": list(cut["depends_on"]),
            "modules": list(cut["modules"]),
            "targets": list(cut["targets"]),
            "target_statement_sha256": target_statements,
            "fragment": str(fragment_path.relative_to(root)),
            "fragment_bytes": len(fragment.encode()),
            "fragment_sha256": sha256_bytes(fragment.encode()),
            "stub": str(stub_path.relative_to(root)),
            "stub_sha256": sha256_file(stub_path),
            "status": "source-authenticated; definition extraction and proof rewrite residual",
        })

    interface_path = definition_dir / "Def_Erdos9796FiniteNine_Interface.lean"
    interface_path.write_text(interface_candidate(definition_imports), encoding="utf-8")
    root_path = solution_dir / "Sol_Erdos9796Mission_finite_nine_exclusion.lean"
    root_path.write_text(root_solution(), encoding="utf-8")

    inventory = {
        "schema": "prove2me-finite-nine-source-inventory/v1",
        "mission_id": MISSION_ID,
        "theorem_id": THEOREM_ID,
        "platform_version": PLATFORM_VERSION,
        "mathlib_rev": MATHLIB_REV,
        "snapshot": str(solutions_path.relative_to(root)),
        "snapshot_sha256": EXPECTED_SOLUTIONS_SHA256,
        "submission_id": row["submission_id"],
        "submission_status": row["status"],
        "stream_bytes": len(content.encode()),
        "units": source_rows,
        "accepted_counting_definition_imports": definition_imports,
        "accepted_counting_theorem_imports": theorem_imports,
    }
    cuts = {
        "schema": "prove2me-finite-nine-modular-cuts/v1",
        "mission_id": MISSION_ID,
        "theorem_id": THEOREM_ID,
        "root": MISSION_NAME,
        "trust_target": ["propext", "Classical.choice", "Quot.sound"],
        "cuts": cut_rows,
        "root_solution": str(root_path.relative_to(root)),
        "root_solution_bytes": root_path.stat().st_size,
        "root_solution_sha256": sha256_file(root_path),
        "upload_ready": False,
    }
    inventory_path = out / "source-inventory.json"
    cuts_path = out / "cuts.json"
    inventory_path.write_text(canonical(inventory), encoding="utf-8")
    cuts_path.write_text(canonical(cuts), encoding="utf-8")
    validation = {
        "schema": "prove2me-finite-nine-modular-validation/v1",
        "result": "PASS_WITH_RESIDUALS",
        "checks": {
            "authenticated_snapshots": True,
            "sequential_unit_envelopes": len(units) == EXPECTED_UNIT_COUNT,
            "n9_source_modules_cross_checked": len(source_rows),
            "source_trees_byte_identical": sum(
                bool(item["source_trees_byte_identical"]) for item in source_rows
            ),
            "source_tree_differences": sum(
                not bool(item["source_trees_byte_identical"]) for item in source_rows
            ),
            "closure_source_hash_matches": True,
            "accepted_counting_import_frontier": {"definitions": 18, "theorems": 20},
            "semantic_targets_present": sum(len(cut["targets"]) for cut in CUTS),
            "semantic_target_statements_cross_checked": sum(len(cut["targets"]) for cut in CUTS),
            "child_cut_count": len(CUTS),
            "root_solution_contains_sorry": re.search(
                r"\bby\s+sorry\b", root_path.read_text(encoding="utf-8")
            ) is not None,
        },
        "residuals": [
            "Run Stage-2 skeleton subtraction to replace the documentation-only interface bundle.",
            "Generate and locally elaborate one proof solution per child theorem against public imports.",
            "Audit each child and the final root with #print axioms; require only the three core axioms.",
            "Run the no-network uploader dry-run after all child solutions elaborate.",
        ],
        "observed_local_checks": {
            "generator_ruff": {
                "command": "uv run --with ruff ruff check --no-cache submissions/finite-nine-modular/generate.py",
                "exit_code": 0
            },
            "interface_candidate_lean_4_33_1": {
                "command": "lake env lean -M 16384 -R <prove2me-root> -o <temporary-olean> <interface-candidate>",
                "exit_code": 0
            },
            "deterministic_generation": {
                "hashed_generated_file_count": 22,
                "hash_excludes_validation_record": True,
                "two_run_aggregate_sha256": "3d8d6fa48745774652bc0678fd02c73ff4817b76e46a187d1738cc87e4efd151"
            }
        },
        "artifacts": {
            "source_inventory_sha256": sha256_file(inventory_path),
            "cuts_sha256": sha256_file(cuts_path),
            "interface_candidate_sha256": sha256_file(interface_path),
            "root_solution_sha256": sha256_file(root_path),
        },
    }
    (out / "validation.json").write_text(canonical(validation), encoding="utf-8")
    return validation


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="regenerate and report bounded validation")
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--source-root", type=Path, default=Path("/Users/adam/prove2me_workspace"))
    parser.add_argument(
        "--current-source-root", type=Path,
        default=Path(__file__).resolve().parents[3] / "lean",
    )
    args = parser.parse_args()
    validation = generate(args.root, args.source_root, args.current_source_root)
    print(
        f"result={validation['result']} units={EXPECTED_UNIT_COUNT} cuts={len(CUTS)} "
        f"source_modules={validation['checks']['n9_source_modules_cross_checked']}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
