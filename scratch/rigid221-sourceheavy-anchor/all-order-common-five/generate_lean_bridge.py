"""Generate the exact Lean CNF binding for the all-order common-five bank.

This development helper rewrites the v22 same-shape template
(FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf) and
materializes the O6 payload's exact definition, implication, role, and
block order.  The generated Lean source remains the production
trust-boundary artifact.
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
    "ExactTwelveRigid221AllOrderCommonFiveMembershipFamilyCnf.lean"
)

OLD = "FirstOppositePairSurplusSecondOppositeCommonFive"
NEW = "AllOrderCommonFive"

DROPPED_IMPORT = (
    "import Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFive"
    "MembershipFamilyCnf\n"
)

PARENT_CUTOFF = 45_489
FRESH_LOW = 45_490
FRESH_HIGH = 47_136
REUSED_LOW = 44_876


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
        f"def {stem}{index:03d} : List (List Int) :=\n"
        f"  {lean_int_lists(chunk, per_line=per_line)}"
        for index, chunk in enumerate(chunks)
    ]
    aggregate = " ++\n    ".join(
        f"{stem}{index:03d}" for index in range(len(chunks))
    )
    return (
        "\n\n".join(definitions)
        + f"\n\ndef {stem} : List (List Int) :=\n  {aggregate}"
    )


def mk_definition_call(definition: dict[str, Any]) -> str:
    support = ", ".join(str(label) for label in definition["required"])
    return (
        f"mkDefinition {definition['pattern_variable']} "
        f"{definition['center']} {{{support}}}"
    )


def lean_chunked_definitions(
    *, stem: str, definitions: list[dict[str, Any]], chunk_size: int
) -> str:
    chunks = [
        definitions[index : index + chunk_size]
        for index in range(0, len(definitions), chunk_size)
    ]
    rendered = []
    for index, chunk in enumerate(chunks):
        body = ",\n".join(f"    {mk_definition_call(item)}" for item in chunk)
        rendered.append(
            f"def {stem}Chunk{index:03d} : List PositiveMembershipDefinition :=\n"
            f"  [\n{body}]"
        )
    aggregate = " ++\n    ".join(
        f"{stem}Chunk{index:03d}" for index in range(len(chunks))
    )
    return (
        "\n\n".join(rendered)
        + f"\n\ndef {stem} : List PositiveMembershipDefinition :=\n  {aggregate}"
    )


def definition_source(
    fresh: list[dict[str, Any]], reused: list[dict[str, Any]]
) -> str:
    fresh_block = lean_chunked_definitions(
        stem="freshDefinitions", definitions=fresh, chunk_size=64
    )
    reused_block = lean_chunked_definitions(
        stem="reusedDefinitions", definitions=reused, chunk_size=64
    )
    return f"""/- The 1,647 genuinely fresh definitions, in compiler allocation order,
in 64-entry chunks. -/
{fresh_block}

/- The 583 parent-chain definitions reused by the compiler, in compiler
scan order, with their exact inherited variables. -/
{reused_block}

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions"""


def family_source(roles: list[list[int]]) -> str:
    chunk_size = 96
    chunks = [roles[index : index + chunk_size] for index in range(0, len(roles), chunk_size)]
    rendered = []
    for index, chunk in enumerate(chunks):
        records = ",\n".join(
            f"    {{a := {role[0]}, b := {role[1]}, c := {role[2]}, "
            f"x := {role[3]}, y := {role[4]}}}"
            for role in chunk
        )
        rendered.append(
            f"def familyDataChunk{index:03d} : List AllOrderCommonFiveData :=\n"
            f"  [\n{records}]"
        )
    aggregate = " ++\n    ".join(
        f"familyDataChunk{index:03d}" for index in range(len(chunks))
    )
    return f"""/- The 11,052 realizable roles, in Python compiler order, in 96-entry
chunks. -/
{'\n\n'.join(rendered)}

def familyData : List AllOrderCommonFiveData :=
  {aggregate}

/-- Insert one requirement into a center-sorted requirement list. -/
private def insertByCenter (choice : RowChoice Label) :
    List (RowChoice Label) → List (RowChoice Label)
  | [] => [choice]
  | head :: tail =>
    if choice.center ≤ head.center then choice :: head :: tail
    else head :: insertByCenter choice tail

/-- Requirements are in the compiler's normalized center order. -/
def familyChoices (data : AllOrderCommonFiveData) :
    List (RowChoice Label) :=
  insertByCenter {{center := data.x, support := {{data.a, data.b}}}}
    (insertByCenter {{center := data.y, support := {{data.a, data.b}}}}
      [{{center := data.c, support := {{data.b, data.x, data.y}}}}])"""


def main() -> None:
    probe = json.loads(PROBE.read_text(encoding="utf-8"))
    compiled = probe["compiled"]
    definitions = compiled["pattern_definitions"]
    entries = compiled["entries"]
    roles = probe["family_roles"]
    fresh = [definition for definition in definitions if not definition["reused"]]
    reused = [definition for definition in definitions if definition["reused"]]
    implications = [
        clause
        for definition in fresh
        for clause in definition["implication_clauses"]
    ]
    blocks = [entry["blocking_clause"] for entry in entries]
    if not (
        len(roles) == 11_052
        and len(definitions) == 2_230
        and len(fresh) == 1_647
        and len(reused) == 583
        and len(implications) == 18_992
        and len(blocks) == 11_052
    ):
        raise RuntimeError("authenticated probe has an unexpected shape")
    if [definition["pattern_variable"] for definition in fresh] != list(
        range(FRESH_LOW, FRESH_HIGH + 1)
    ):
        raise RuntimeError("fresh variables are not contiguous 45490..47136")
    if not all(
        REUSED_LOW <= definition["pattern_variable"] <= PARENT_CUTOFF
        for definition in reused
    ):
        raise RuntimeError("reused variable outside 44876..45489")

    # Differential re-derivation of every block from the definitions map.
    variable_of = {
        (definition["center"], tuple(definition["required"])): definition[
            "pattern_variable"
        ]
        for definition in definitions
    }
    for role, entry in zip(roles, entries, strict=True):
        a, b, c, x, y = role
        pattern = sorted(
            [
                (x, tuple(sorted((a, b)))),
                (y, tuple(sorted((a, b)))),
                (c, tuple(sorted((b, x, y)))),
            ]
        )
        expected = [-variable_of[item] for item in pattern]
        if expected != entry["blocking_clause"]:
            raise RuntimeError(f"block mismatch for role {role}")

    text = TEMPLATE.read_text(encoding="utf-8")
    if DROPPED_IMPORT not in text:
        raise RuntimeError("missing v21 CNF import to drop")
    text = text.replace(DROPPED_IMPORT, "")
    text = text.replace(OLD, NEW)
    # Cutoff rewrite BEFORE data insertion: generated literals may contain
    # the token 45357 as a genuine variable number.
    if text.count("45357") != 11:
        raise RuntimeError("unexpected 45357 cutoff occurrence count")
    text = text.replace("45357", str(PARENT_CUTOFF))

    doc_start = "/-!\n# Exact CNF binding"
    doc_end = "-/\n\nnamespace Problem97"
    head, marker, rest = text.partition(doc_start)
    if not marker:
        raise RuntimeError("missing module-doc marker")
    _old_doc, marker, tail = rest.partition(doc_end)
    if not marker:
        raise RuntimeError("missing module-doc terminator")
    doc = """/-!
# Exact CNF binding for the label-general all-order common-five family

This file binds all 11,052 realizable `(a, b, c, x, y)` roles to the
deterministic positive-membership extension installed after the v23
three-triad family.  583 requirements reuse their exact inherited
parent-chain variables (44,876--45,489, non-contiguous).  The remaining
1,647 requirements receive fresh variables 45,490--47,136.  Each role
contributes one three-literal block after 18,992 fresh deterministic
implications.

This is finite exact-twelve predicate ingress only.  It does not assert
terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift, or live
Rigid221 closure.
-/

namespace Problem97"""
    text = head + doc + tail

    text = replace_between(
        text,
        "def definition6_31011 :=",
        "/-- Deliberately non-family source meaning",
        definition_source(fresh, reused),
    )
    implication_theorem = f"""/- BEGIN GENERATED IMPLICATION CLAUSE ANCHOR -/
{lean_chunked_clause_anchor(stem="expectedImplicationDimacs", clauses=implications, chunk_size=64, per_line=4)}
/- END GENERATED IMPLICATION CLAUSE ANCHOR -/

/-- Executable byte-order anchor for all 18,992 Python-installed
implications. -/
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
        family_source(roles),
    )
    fallback = mk_definition_call(fresh[0])
    text = text.replace("getD definition6_31011", f"getD ({fallback})")
    blocking_theorem = f"""/- BEGIN GENERATED BLOCKING CLAUSE ANCHOR -/
{lean_chunked_clause_anchor(stem="expectedBlockingClauses", clauses=blocks, chunk_size=48, per_line=3)}
/- END GENERATED BLOCKING CLAUSE ANCHOR -/

/-- Executable byte-order anchor for all 11,052 Python-installed blocks. -/
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
    freshDefinitions.length = 1647 ∧ reusedDefinitions.length = 583 ∧
      definitions.length = 2230 ∧ implicationDimacs.length = 18992 ∧
      entries.length = 11052 ∧ blockingClauses.length = 11052 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45490 ≤ definition.varIndex ∧ definition.varIndex ≤ 47136)) = true := by
  native_decide"""
    text = replace_between(
        text,
        "/-- Executable cardinality, distinctness, and variable-range anchor. -/",
        "private def entryValid",
        shape_theorem,
    )
    text = text.replace(
        "outside the twelve fresh indices",
        "outside the 1,647 fresh indices",
    )
    text = text.replace(
        "implications for the twelve fresh definitions",
        "implications for the 1,647 fresh definitions",
    )
    text = text.replace(
        "Falsifying one family block contradicts source geometry through the checked\n"
        "48-role common-five theorem.",
        "Falsifying one family block contradicts source geometry through the checked\n"
        "label-general all-order common-five theorem.",
    )
    OUTPUT.write_text(text, encoding="utf-8")
    print(
        f"wrote {OUTPUT.relative_to(ROOT)}: {len(fresh)} fresh definitions, "
        f"{len(reused)} reused definitions, {len(implications)} implications, "
        f"{len(blocks)} blocks"
    )


if __name__ == "__main__":
    main()
