"""Generate the Lean module carrying the 229 distinct cell-6 S1 class cuts.

Reads ``s1_class_cut_manifest_v1.json`` (written by
``derive_s1_class_cut_bank.py``) and emits
``lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
ExactTwelveRigid221PhysicalClassCell6PositiveCuts.lean``: the cut-entry
list, its aggregated ``PhysicalClassCutData.check`` theorem, the
proof-carrying bank ``physicalClassCell6Bank`` built through
``PhysicalClassPositiveNogood.ofCut``, and the frozen-candidate
encodability theorem the class-extended terminal consumer requires.

Deterministic generation: running twice on the same manifest emits
byte-identical Lean source.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[2]
MANIFEST = HERE / "s1_class_cut_manifest_v1.json"
TARGET = (
    REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221PhysicalClassCell6PositiveCuts.lean"
)

HEADER = '''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PhysicalClassWitnessBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate

/-!
# Exact-twelve cell-6 physically-bridged class cuts

GENERATED FILE - do not edit by hand.  Produced by
`scratch/rigid221-sourceheavy-anchor/core-pair/generate_s1_class_cut_lean.py`
from `s1_class_cut_manifest_v1.json`; regenerate rather than patching.

Each entry is one full-row unit cut of the S1 mid-angle witness family at
the cell-6 placement `(d, v) = (0, 3)`: a distinct candidate four-row
hosted at an on-class center `z` whose support contains a class pair
`{p, q}` that `z` never strictly separates in any of the 48 canonical
boundary orders (`witnessSameSideAll48 z p q = true`).  A row hosting
several admissible pairs appears once, certified by its first admissible
witness in combo order, so the emitted clause list is duplicate-free.  The proof-carrying form is
`PhysicalClassPositiveNogood.ofCut` with `PhysicalClassCutData.witness`;
the class-radius hypothesis is discharged at the leaf by
`FrozenRoleLabeling.physicalClassRadius`.

This is finite exact-twelve certificate ingress only.  It does not assert
terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift, or
live Rigid221 closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace PhysicalClassCell6PositiveCuts

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- The cell-6 S1 class-cut entries: one hosted candidate row and its
witness datum per cut. -/
def cutEntries : List (RowChoice Label × PhysicalClassCutData) :=
'''

FOOTER = '''
/-- Every entry passes the physically-bridged certificate check at the
cell-6 placement. -/
theorem cutEntries_check :
    cutEntries.all
      (fun entry => entry.2.check 0 3 [entry.1]) = true := by
  native_decide

/-- The number of cell-6 S1 class cuts. -/
theorem cutEntries_length : cutEntries.length = {count} := by
  native_decide

/-- The proof-carrying cell-6 class bank. -/
def physicalClassCell6Bank : List (PhysicalClassPositiveNogood 0 3) :=
  cutEntries.attach.map fun entry =>
    PhysicalClassPositiveNogood.ofCut 0 3 [entry.1.1] entry.1.2
      (List.all_eq_true.mp cutEntries_check entry.1 entry.2)

/-- Every bank choice lies on the frozen safe candidate surface, as the
class-extended terminal consumer requires. -/
theorem physicalClassCell6Bank_encodable :
    ∀ nogood ∈ physicalClassCell6Bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  have hall :
      cutEntries.all
        (fun entry =>
          decide (FrozenSafeCandidateAt entry.1.center entry.1.support)) =
        true := by
    native_decide
  intro nogood hnogood choice hchoice
  simp only [physicalClassCell6Bank, List.mem_map, List.mem_attach,
    true_and] at hnogood
  obtain ⟨entry, hentry⟩ := hnogood
  subst hentry
  simp only [PhysicalClassPositiveNogood.ofCut, List.mem_singleton]
    at hchoice
  subst hchoice
  exact of_decide_eq_true
    (List.all_eq_true.mp hall entry.1 entry.2)

end PhysicalClassCell6PositiveCuts
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
'''


def main() -> None:
    manifest = json.loads(MANIFEST.read_text())
    if manifest.get("schema") != "p97_rigid221_exact12_s1_class_cut_manifest.v1":
        raise SystemExit("unexpected manifest schema")
    cuts = manifest["cuts"]
    if len(cuts) != 229:
        raise SystemExit(f"manifest carries {len(cuts)} cuts, expected 229")

    lines = []
    for position, cut in enumerate(cuts):
        witness = cut["witness"]
        support = ", ".join(str(label) for label in cut["support"])
        prefix = "  [ " if position == 0 else "  , "
        lines.append(
            f"{prefix}({{ center := {cut['center']}, "
            f"support := {{{support}}} }},\n"
            f"     .witness {witness['z']} {witness['p']} {witness['q']})"
        )
    body = "\n".join(lines) + " ]\n"

    source = HEADER + body + FOOTER.replace("{count}", str(len(cuts)))
    TARGET.write_text(source)
    print(f"wrote {TARGET} ({len(source.splitlines())} lines, {len(cuts)} cuts)")


if __name__ == "__main__":
    main()
