"""Generate the exact Lean ingress bridge for the authenticated v23 probe.

This development helper rewrites the nearest mixed fresh/reused bridge and
materializes the probe's exact definition, implication, role, and block order.
The generated Lean source remains the production trust-boundary artifact.
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
PROBE = Path(__file__).with_name("mixed-extension-probe.json")
TEMPLATE = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221FirstOppositePairSurplusSecondOppositeCommonFive"
    "MembershipFamilyCnf.lean"
)
OUTPUT = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SecondOppositeTripleSurplusFirstOppositeThreeTriad"
    "MembershipFamilyCnf.lean"
)

OLD = "FirstOppositePairSurplusSecondOppositeCommonFive"
NEW = "SecondOppositeTripleSurplusFirstOppositeThreeTriad"


def replace_between(text: str, start: str, end: str, replacement: str) -> str:
    before, separator, tail = text.partition(start)
    if not separator:
        raise RuntimeError(f"missing start marker: {start}")
    _discarded, separator, after = tail.partition(end)
    if not separator:
        raise RuntimeError(f"missing end marker: {end}")
    return before + replacement.rstrip() + "\n\n" + end + after


def lean_int_lists(items: list[list[int]], *, per_line: int) -> str:
    rendered = ["[" + ", ".join(str(value) for value in item) + "]" for item in items]
    lines = []
    for index in range(0, len(rendered), per_line):
        lines.append("        " + ", ".join(rendered[index : index + per_line]))
    return "[\n" + ",\n".join(lines) + "]"


def lean_chunked_clause_anchor(
    *, stem: str, clauses: list[list[int]], chunk_size: int, per_line: int
) -> str:
    chunks = [
        clauses[index : index + chunk_size]
        for index in range(0, len(clauses), chunk_size)
    ]
    definitions = [
        f"def {stem}{index:02d} : List (List Int) :=\n"
        f"  {lean_int_lists(chunk, per_line=per_line)}"
        for index, chunk in enumerate(chunks)
    ]
    aggregate = " ++\n    ".join(
        f"{stem}{index:02d}" for index in range(len(chunks))
    )
    return (
        "\n\n".join(definitions)
        + f"\n\ndef {stem} : List (List Int) :=\n  {aggregate}"
    )


def definition_source(definitions: list[dict[str, Any]]) -> str:
    fresh = [definition for definition in definitions if not definition["reused"]]
    declarations = []
    names = []
    for definition in fresh:
        variable = definition["pattern_variable"]
        center = definition["center"]
        support = ", ".join(str(label) for label in definition["required"])
        name = f"d{variable}"
        names.append(name)
        declarations.append(
            f"def {name} := mkDefinition {variable} {center} {{{support}}}"
        )
    name_lines = []
    for index in range(0, len(names), 6):
        name_lines.append("    " + ", ".join(names[index : index + 6]))
    return "\n".join(declarations) + f"""

/-- The 120 genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [\n{',\n'.join(name_lines)}]

/-- The 24 exact v22-parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions"""


def family_source(roles: list[list[int]]) -> str:
    records = [
        f"    {{a := {role[0]}, b := {role[1]}, c := {role[2]}, "
        f"d := {role[3]}, e := {role[4]}}}"
        for role in roles
    ]
    return f"""/-- The 144 roles, in Python compiler order. -/
def familyData :
    List SecondOppositeTripleSurplusFirstOppositeThreeTriadData :=
  [\n{',\n'.join(records)}]

/-- Requirements are in the compiler's normalized center order. -/
def familyChoices
    (data : SecondOppositeTripleSurplusFirstOppositeThreeTriadData) :
    List (RowChoice Label) :=
  [{{center := data.b, support := {{data.c, data.d}}}}] ++
    (if data.c < data.e then
      [{{center := data.c, support := {{data.a, data.d, data.e}}}},
        {{center := data.e, support := {{data.a, data.b, data.d}}}}]
    else
      [{{center := data.e, support := {{data.a, data.b, data.d}}}},
        {{center := data.c, support := {{data.a, data.d, data.e}}}}]) ++
    [{{center := data.d, support := {{data.a, data.b}}}}]"""


def main() -> None:
    probe = json.loads(PROBE.read_text(encoding="utf-8"))
    compiled = probe["compiled"]
    definitions = compiled["pattern_definitions"]
    entries = compiled["entries"]
    fresh = [definition for definition in definitions if not definition["reused"]]
    implications = [
        clause
        for definition in fresh
        for clause in definition["implication_clauses"]
    ]
    blocks = [entry["blocking_clause"] for entry in entries]
    if not (
        len(probe["family_roles"]) == 144
        and len(definitions) == 144
        and len(fresh) == 120
        and len(implications) == 1608
        and len(blocks) == 144
    ):
        raise RuntimeError("authenticated probe has an unexpected shape")

    text = TEMPLATE.read_text(encoding="utf-8").replace(OLD, NEW)
    text = text.replace(
        "import Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFive"
        "MembershipFamilyCnf",
        "import Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221FirstOppositePairSurplusSecondOppositeCommonFive"
        "MembershipFamilyCnf",
    )
    doc_start = "/-!\n# Exact CNF binding"
    doc_end = "-/\n\nnamespace Problem97"
    _head, marker, rest = text.partition(doc_start)
    if not marker:
        raise RuntimeError("missing module-doc marker")
    _old_doc, marker, tail = rest.partition(doc_end)
    if not marker:
        raise RuntimeError("missing module-doc terminator")
    doc = """/-!
# Exact CNF binding for the cross-block three-triad family

This file binds all 144 checked `(a,b,c,d,e)` roles to the deterministic
positive-membership extension installed after the v22 family.  Twenty-four
center-`d` pair requirements reuse variables 45201--45224.  The remaining
120 requirements receive variables 45370--45489.  Each role contributes one
four-literal block after 1,608 fresh deterministic implications.

This is finite exact-twelve predicate ingress only.  It does not assert
terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift, or live
Rigid221 closure.
-/

namespace Problem97"""
    text = _head + doc + tail

    text = replace_between(
        text,
        "def definition6_31011 :=",
        "/-- Deliberately non-family source meaning",
        definition_source(definitions),
    )
    implication_theorem = f"""/- BEGIN GENERATED IMPLICATION CLAUSE ANCHOR -/
{lean_chunked_clause_anchor(stem="expectedImplicationDimacs", clauses=implications, chunk_size=64, per_line=4)}
/- END GENERATED IMPLICATION CLAUSE ANCHOR -/

/-- Executable byte-order anchor for all 1,608 Python-installed implications. -/
theorem implicationDimacs_eq :
    implicationDimacs = expectedImplicationDimacs := by
  native_decide"""
    text = replace_between(
        text,
        "/-- Executable byte-order anchor for all 96 Python-installed implications. -/",
        "private def definitionCompilerValid",
        implication_theorem,
    )
    text = replace_between(
        text,
        "/-- The 48 roles, in Python compiler order. -/",
        "def lookupDefinition",
        family_source(probe["family_roles"]),
    )
    text = text.replace("getD definition6_31011", "getD d45370")
    blocking_theorem = f"""/- BEGIN GENERATED BLOCKING CLAUSE ANCHOR -/
{lean_chunked_clause_anchor(stem="expectedBlockingClauses", clauses=blocks, chunk_size=48, per_line=3)}
/- END GENERATED BLOCKING CLAUSE ANCHOR -/

/-- Executable byte-order anchor for all 144 Python-installed blocks. -/
theorem blockingClauses_eq :
    blockingClauses = expectedBlockingClauses := by
  native_decide"""
    text = replace_between(
        text,
        "/-- Executable byte-order anchor for all 48 Python-installed blocks. -/",
        "/-- Executable cardinality, distinctness, and variable-range anchor. -/",
        blocking_theorem,
    )
    shape_theorem = """/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 120 ∧ reusedDefinitions.length = 24 ∧
      definitions.length = 144 ∧ implicationDimacs.length = 1608 ∧
      entries.length = 144 ∧ blockingClauses.length = 144 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45370 ≤ definition.varIndex ∧ definition.varIndex ≤ 45489)) = true := by
  native_decide"""
    text = replace_between(
        text,
        "/-- Executable cardinality, distinctness, and variable-range anchor. -/",
        "private def entryValid",
        shape_theorem,
    )
    text = text.replace("45357", "45369")
    text = text.replace(
        "Falsifying one family block contradicts source geometry through the checked\n"
        "48-role common-five theorem.",
        "Falsifying one family block contradicts source geometry through the checked\n"
        "144-role cross-block three-triad theorem.",
    )
    OUTPUT.write_text(text, encoding="utf-8")
    print(
        f"wrote {OUTPUT.relative_to(ROOT)}: {len(fresh)} fresh definitions, "
        f"{len(implications)} implications, {len(blocks)} blocks"
    )


if __name__ == "__main__":
    main()
