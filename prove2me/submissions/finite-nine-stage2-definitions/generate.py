#!/usr/bin/env python3
"""Generate the definition-only finite-nine interface from the preserved submission."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

MISSION = "Erdos9796Mission.finite_nine_exclusion"
SNAPSHOT_SHA256 = "1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58"
UNIT_SHA256 = {
    "Solutions.Batch3N9.N9Endpoint.Shell":
        "0453f4564aa9cd8c13d81a100fdcb0ed6f86683b57a2484c5c538f19d52fc7e2",
    "Solutions.Batch3N9.N9Endpoint.N67":
        "5843a2cf8d4fabdde484e0fd4a10d0fbd574bc89bc2a24d819d32b3f964cc5e6",
    "Solutions.Batch3N9.N9Endpoint.N4e":
        "4c8f93c7c3da9750b59f3c7357166d6c8a09549c21dff7be2d492f72d5694424",
    "Solutions.Batch3N9.N8.N8bEndpointPair":
        "e5f793d5764ce97b703c1e8d1533139556254e26b2721e0923b2a69ee03e26b1",
}
COUNTING_IMPORTS = (
    "Definitions.Def_Erdos9796Counting_Adapter",
    "Definitions.Def_Erdos9796Counting_Foundation",
    "Definitions.Def_Erdos9796Counting_MEC_Basic",
    "Definitions.Def_Erdos9796Counting_Moser_Triangle",
    "Definitions.Def_Erdos9796Counting_Moser_TriangleNonObtuse",
    "Definitions.Def_Erdos9796Counting_Cap_Structure",
    "Definitions.Def_Erdos9796Counting_Cap_PartitionFromMEC",
    "Definitions.Def_Erdos9796Counting_CircumscribedMECPacket",
)
HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
"""


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_units(snapshot: Path) -> dict[str, str]:
    raw = snapshot.read_bytes()
    if sha256(raw) != SNAPSHOT_SHA256:
        raise ValueError("preserved solutions snapshot digest mismatch")
    rows = json.loads(raw)
    candidates = [row for row in rows if row.get("theorem_name") == MISSION]
    if len(candidates) != 2:
        raise ValueError(f"expected two finite-nine submissions, found {len(candidates)}")
    content = max(candidates, key=lambda row: len(row["solution"]["content"]))["solution"]["content"]
    marker = re.compile(r"(?m)^-- Original module: (Solutions\.Batch3N9\.[^\n]+)\n")
    matches = list(marker.finditer(content))
    if len(matches) != 87:
        raise ValueError(f"expected 87 authenticated units, found {len(matches)}")
    units: dict[str, str] = {}
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else len(content)
        units[match.group(1)] = content[match.start():end]
    for module, expected in UNIT_SHA256.items():
        if sha256(units[module].encode()) != expected:
            raise ValueError(f"authenticated unit digest mismatch: {module}")
    return units


def span(text: str, start: str, end: str) -> str:
    start_at = text.index(start)
    end_at = text.index(end, start_at)
    return text[start_at:end_at].rstrip() + "\n"


def direct_exclusion(unit: str, form: str, vertex: int) -> str:
    private_name = f"b3n9m051_N4dExcludesForm{form}_v{vertex}Pred"
    public_name = f"N4dExcludesForm{form}_v{vertex}"
    start = f"abbrev {private_name}"
    wrapper = f"abbrev {public_name}"
    body = span(unit, start, wrapper)
    body = body.replace(start, wrapper, 1)
    for name in ("hr", "hcard", "hesc"):
        body = body.replace(f"({name} :", f"(_{name} :")
    return body


def counting_core() -> str:
    imports = "\n".join(f"import {module}" for module in COUNTING_IMPORTS)
    return HEADER + f"""
{imports}

/-! Definition-only aliases required by the authenticated `Batch3N9` endpoint source. -/

open scoped EuclideanGeometry

namespace Batch3N9
namespace Problem97

export _root_.Problem97 (CapTriple CircumscribedMECPacket ConvexIndep MoserTriangle)

abbrev HasNEquidistantProperty := _root_.Erdos97.HasNEquidistantProperty

namespace MEC

export _root_.Problem97.MEC (mec NonObtuseCircumscribedMoserTriangle)

end MEC
end Problem97
end Batch3N9
"""


def shell(unit: str) -> str:
    structure = span(unit, "structure FiniteEndpointShell", "namespace FiniteEndpointShell")
    basic = span(unit, "@[reducible] def triangle", "theorem hcapSum")
    return HEADER + f"""
import Definitions.Def_Erdos9796FiniteNine_CountingCore

/-! Definition-only endpoint shell extracted from the authenticated finite-nine source. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry InnerProductSpace
open Finset

namespace Batch3N9
namespace Problem97

{structure}
namespace FiniteEndpointShell

{basic}
end FiniteEndpointShell
end Problem97
end Batch3N9
"""


def forms(unit: str) -> str:
    witnesses = span(
        unit,
        "@[reducible] noncomputable def witnessClassAt_v1",
        "theorem b3n9m051_witnessClassAt_v1_sideBounds",
    )
    form_shapes = span(unit, "def IsFormA_v1", "theorem formB_v1_split")
    exclusions = "\n".join(
        direct_exclusion(unit, form, vertex)
        for vertex in (1, 2, 3)
        for form in ("A", "B", "C")
    )
    return HEADER + f"""
import Definitions.Def_Erdos9796FiniteNine_Shell

/-! Definition-only N4 witness forms and public exclusion predicates. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry
open Finset

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

{witnesses}
{form_shapes}
{exclusions}
end FiniteEndpointShell
end Problem97
end Batch3N9
"""


def n8_interface(n67: str, n8b: str) -> str:
    containment = span(n67, "def N4eCapContainment", "theorem exact_cap_class_at_v1")
    cap_index = span(n8b, "@[reducible] noncomputable def capByIndex", "theorem capInteriorByIndex_subset")
    return HEADER + f"""
import Definitions.Def_Erdos9796FiniteNine_Forms

/-! Definition-only final N4/N8 interface used by the nine public child statements. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry
open Finset

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

{containment}
{cap_index}
end FiniteEndpointShell
end Problem97
end Batch3N9
"""


def api_checks() -> str:
    return """
open scoped EuclideanGeometry

#check Batch3N9.Problem97.ConvexIndep
#check Batch3N9.Problem97.HasNEquidistantProperty
#check Batch3N9.Problem97.FiniteEndpointShell
#check Batch3N9.Problem97.FiniteEndpointShell.triangle
#check Batch3N9.Problem97.FiniteEndpointShell.I1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v2
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v2
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v2
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v3
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v3
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v3
#check Batch3N9.Problem97.FiniteEndpointShell.N4eCapContainment
#check Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex

#print axioms Batch3N9.Problem97.FiniteEndpointShell
#print axioms Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v1
#print axioms Batch3N9.Problem97.FiniteEndpointShell.N4eCapContainment
#print axioms Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex
"""


def check_module(bundles: tuple[str, ...]) -> str:
    combined = "\n".join(
        "\n".join(
            line for line in bundle.splitlines()
            if not line.startswith("import Definitions.Def_Erdos9796FiniteNine_")
        )
        for bundle in bundles
    )
    return combined + api_checks()


def module_check() -> str:
    return HEADER + """
import Definitions.Def_Erdos9796FiniteNine_N8Interface
""" + api_checks()


def artifacts(base: Path, units: dict[str, str]) -> dict[Path, str]:
    platform = base / "platform"
    core = counting_core()
    shell_bundle = shell(units["Solutions.Batch3N9.N9Endpoint.Shell"])
    forms_bundle = forms(units["Solutions.Batch3N9.N9Endpoint.N4e"])
    n8_bundle = n8_interface(
        units["Solutions.Batch3N9.N9Endpoint.N67"],
        units["Solutions.Batch3N9.N8.N8bEndpointPair"],
    )
    return {
        platform / "Definitions/Def_Erdos9796FiniteNine_CountingCore.lean": core,
        platform / "Definitions/Def_Erdos9796FiniteNine_Shell.lean": shell_bundle,
        platform / "Definitions/Def_Erdos9796FiniteNine_Forms.lean": forms_bundle,
        platform / "Definitions/Def_Erdos9796FiniteNine_N8Interface.lean": n8_bundle,
        platform / "Check.lean": check_module((core, shell_bundle, forms_bundle, n8_bundle)),
        platform / "ModuleCheck.lean": module_check(),
    }


def scan_definition(path: Path, content: str) -> None:
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom|theorem|lemma)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    match = forbidden.search(content)
    if match:
        raise ValueError(f"forbidden token {match.group(1)!r} in {path}")
    if len(content.encode()) >= 1024 * 1024:
        raise ValueError(f"definition exceeds one MiB: {path}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    snapshot = base.parents[1] / "scratch/live-mission-solutions.json"
    units = load_units(snapshot)
    rendered = artifacts(base, units)
    for path, content in rendered.items():
        if path.parent.name == "Definitions":
            scan_definition(path, content)
        if args.check:
            if not path.is_file() or path.read_text() != content:
                raise SystemExit(f"STALE {path.relative_to(base)}")
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
    sizes = {path.name: len(content.encode()) for path, content in rendered.items()}
    print(json.dumps({"result": "PASS", "files": sizes}, sort_keys=True))


if __name__ == "__main__":
    main()
