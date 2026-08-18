"""Generate the exact Lean CNF binding for the core-pair bank.

This development helper rewrites the twenty-first-bank template
(``ExactTwelveRigid221CenterExchangeAllOrderCommonFiveMembershipFamilyCnf``)
and materializes the O8 payload's exact definition, implication, role, and
block order.  The generated Lean source remains the production trust-boundary
artifact.

The template already carries the twenty-first bank's generated payload, so
every generated region is excised to a placeholder first, the skeleton is
rewritten (cutoff, fallback, names, prose), and the O8 payload is substituted
last.

Four things genuinely differ from the twenty-first-bank generator:

* a family record now carries TWO cores.  ``familyData`` has Lean type
  ``List CorePairCommonFiveData`` and each record pairs a role with its
  rotated partner ``(a, b, c, x, y) -> (x, b, a, c, y)`` (mirrors
  ``partner_role`` in the bank module);
* ``familyChoices`` emits FOUR rows, the union of both cores' rows —
  ``x:{a,b}``, ``y:{a,b,x}``, ``c:{b,x,y}``, ``a:{b,c,y}`` (mirrors
  ``_union_rows`` in the bank module);
* the producer is ``SourceOrderPositiveNogood.ofCorePairAllOrderCommonFive``
  and the checked entry point is the plain ``CorePairCommonFiveData.check``,
  so the template's ``centerExchangeCheck`` name is rewritten BACK to
  ``check`` rather than carried over; and
* the differential re-derivation of every blocking clause runs over four
  rows per role instead of three.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.card_head.exact12_positive_membership_source_order_bank import (  # noqa: E402
    _sha256_json,
)

PROBE = Path(__file__).with_name("mixed-extension-probe.json")
PROBE_SHA256 = "636490d1aac9b9bd1b8d3cc5fa62a165d195f4f04eac113b023e8cb9bf0c1a8e"
TEMPLATE = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CenterExchangeAllOrderCommonFive"
    "MembershipFamilyCnf.lean"
)
OUTPUT = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CorePairAllOrderCommonFive"
    "MembershipFamilyCnf.lean"
)

# Template (twenty-first bank) names on the left, this family's on the right.
OLD_FAMILY = "CenterExchangeAllOrderCommonFive"
NEW_FAMILY = "CorePairAllOrderCommonFive"
OLD_DATA = "AllOrderCommonFiveData"
NEW_DATA = "CorePairCommonFiveData"

# Template cutoff literals that must move to this family's schedule.
TEMPLATE_CUTOFF = "47136"
TEMPLATE_CUTOFF_COUNT = 11
TEMPLATE_FALLBACK = "getD (mkDefinition 47137 3 {1, 2, 4})"

# Declaration-scoped elaboration budget for the consumer theorem.  The
# default 200,000 is not enough; see the comment at the emission site.  Keep
# this the smallest value measured to elaborate, and record the measurement.
CONSUMER_MAX_HEARTBEATS = 1_000_000

PARENT_CUTOFF = 47_174
FRESH_LOW = 47_175
FRESH_HIGH = 47_211
REUSED_LOW = 44_876

ROLE_COUNT = 23_802
DEFINITION_COUNT = 2_168
FRESH_COUNT = 37
REUSED_COUNT = 2_131
IMPLICATION_COUNT = 380
BLOCK_COUNT = 23_802


def replace_between(text: str, start: str, end: str, replacement: str) -> str:
    before, separator, tail = text.partition(start)
    if not separator:
        raise RuntimeError(f"missing start marker: {start}")
    _discarded, separator, after = tail.partition(end)
    if not separator:
        raise RuntimeError(f"missing end marker: {end}")
    return before + replacement.rstrip() + "\n\n" + end + after


def substitute_placeholder(text: str, placeholder: str, replacement: str) -> str:
    if text.count(placeholder) != 1:
        raise RuntimeError(f"placeholder count drifted: {placeholder}")
    return text.replace(placeholder, replacement.rstrip())


def replace_counted(text: str, old: str, new: str, count: int) -> str:
    if text.count(old) != count:
        raise RuntimeError(
            f"expected {count} occurrence(s) of {old!r}, "
            f"observed {text.count(old)}"
        )
    return text.replace(old, new)


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
    return f"""/- The {FRESH_COUNT} genuinely fresh definitions, in compiler allocation order,
in 64-entry chunks. -/
{fresh_block}

/- The {REUSED_COUNT:,} parent-chain definitions reused by the compiler, in compiler
scan order, with their exact inherited variables. -/
{reused_block}

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions"""


def partner_role(role: list[int]) -> tuple[int, int, int, int, int]:
    """The rotated partner core, in ``(a, b, c, x, y)`` serialization."""

    a, b, c, x, y = role
    return (x, b, a, c, y)


def union_rows(role: list[int]) -> list[tuple[int, tuple[int, ...]]]:
    """The four union rows of a core and its rotated partner.

    ``x:{a,b}``, ``y:{a,b,x}``, ``c:{b,x,y}``, ``a:{b,c,y}``, each support
    sorted.  This mirrors ``_union_rows`` in the bank module.
    """

    a, b, c, x, y = role
    return [
        (x, tuple(sorted((a, b)))),
        (y, tuple(sorted((a, b, x)))),
        (c, tuple(sorted((b, x, y)))),
        (a, tuple(sorted((b, c, y)))),
    ]


def family_source(roles: list[list[int]]) -> str:
    chunk_size = 96
    chunks = [
        roles[index : index + chunk_size]
        for index in range(0, len(roles), chunk_size)
    ]
    rendered = []
    for index, chunk in enumerate(chunks):
        records = []
        for role in chunk:
            a, b, c, x, y = role
            pa, pb, pc, px, py = partner_role(role)
            records.append(
                f"    {{left := {{a := {a}, b := {b}, c := {c}, "
                f"x := {x}, y := {y}}}, "
                f"right := {{a := {pa}, b := {pb}, c := {pc}, "
                f"x := {px}, y := {py}}}}}"
            )
        body = ",\n".join(records)
        rendered.append(
            f"def familyDataChunk{index:03d} : List {NEW_DATA} :=\n  [\n{body}]"
        )
    aggregate = " ++\n    ".join(
        f"familyDataChunk{index:03d}" for index in range(len(chunks))
    )
    joined = "\n\n".join(rendered)
    return f"""/- The {ROLE_COUNT:,} realizable roles, in Python compiler order, in 96-entry
chunks.  Each record carries the role's own core in `left` and its rotated
partner `(a, b, c, x, y) = (x, b, a, c, y)` in `right`. -/
{joined}

def familyData : List {NEW_DATA} :=
  {aggregate}

/-- Insert one requirement into a center-sorted requirement list. -/
private def insertByCenter (choice : RowChoice Label) :
    List (RowChoice Label) → List (RowChoice Label)
  | [] => [choice]
  | head :: tail =>
    if choice.center ≤ head.center then choice :: head :: tail
    else head :: insertByCenter choice tail

/-- The union of both cores' membership rows — `x:{{a, b}}`, `y:{{a, b, x}}`,
`c:{{b, x, y}}` and `a:{{b, c, y}}` — in the compiler's normalized center
order.  The union contains each core's own four steps, so every branch of the
certificate's orientation case split is supported.  Each row choice stays on
one line: a structure instance may not dedent its later fields below its
opening brace. -/
def familyChoices (data : {NEW_DATA}) :
    List (RowChoice Label) :=
  insertByCenter {{center := data.left.x, support := {{data.left.a, data.left.b}}}}
    (insertByCenter {{center := data.left.y, support := {{data.left.a, data.left.b, data.left.x}}}}
      (insertByCenter {{center := data.left.c, support := {{data.left.b, data.left.x, data.left.y}}}}
        [{{center := data.left.a, support := {{data.left.b, data.left.c, data.left.y}}}}]))"""


def load_probe() -> dict[str, Any]:
    probe = json.loads(PROBE.read_text(encoding="utf-8"))
    recorded = probe.get("probe_sha256")
    payload = {key: value for key, value in probe.items() if key != "probe_sha256"}
    observed = _sha256_json(payload)
    if recorded != PROBE_SHA256 or observed != PROBE_SHA256:
        raise RuntimeError(
            "authenticated probe digest drifted: pinned "
            f"{PROBE_SHA256}, recorded {recorded}, observed {observed}"
        )
    if _sha256_json(probe["family_roles"]) != probe["family_roles_sha256"]:
        raise RuntimeError("family_roles digest drifted inside the probe")
    return probe


def main() -> None:
    probe = load_probe()
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
        len(roles) == ROLE_COUNT
        and len(definitions) == DEFINITION_COUNT
        and len(fresh) == FRESH_COUNT
        and len(reused) == REUSED_COUNT
        and len(implications) == IMPLICATION_COUNT
        and len(blocks) == BLOCK_COUNT
    ):
        raise RuntimeError("authenticated probe has an unexpected shape")
    if compiled["parent_variable_cutoff"] != PARENT_CUTOFF:
        raise RuntimeError("probe parent cutoff is not 47174")
    if compiled["final_n_variables"] != FRESH_HIGH:
        raise RuntimeError("probe final variable count is not 47211")
    if any(definition["implication_clauses"] for definition in reused):
        raise RuntimeError("reused definition carries fresh implications")
    if [definition["pattern_variable"] for definition in fresh] != list(
        range(FRESH_LOW, FRESH_HIGH + 1)
    ):
        raise RuntimeError("fresh variables are not contiguous 47175..47211")
    reused_variables = [definition["pattern_variable"] for definition in reused]
    if not all(
        REUSED_LOW <= variable <= PARENT_CUTOFF for variable in reused_variables
    ):
        raise RuntimeError("reused variable outside 44876..47174")
    if min(reused_variables) != REUSED_LOW or max(reused_variables) != PARENT_CUTOFF:
        raise RuntimeError("reused variable envelope drifted from 44876..47174")
    if len(set(reused_variables)) != REUSED_COUNT or REUSED_COUNT == (
        PARENT_CUTOFF - REUSED_LOW + 1
    ):
        raise RuntimeError("reused variables are not distinct and non-contiguous")

    # Differential re-derivation of every block from the definitions map, over
    # the FOUR union rows of the role's core and its rotated partner.
    variable_of = {
        (definition["center"], tuple(definition["required"])): definition[
            "pattern_variable"
        ]
        for definition in definitions
    }
    if len(variable_of) != DEFINITION_COUNT:
        raise RuntimeError("definitions map is not keyed injectively")
    matched = 0
    for role, entry in zip(roles, entries, strict=True):
        pattern = sorted(union_rows(role))
        if len(pattern) != 4:
            raise RuntimeError(f"role {role} did not produce four union rows")
        recorded_requirements = [
            (requirement["center"], tuple(requirement["required"]))
            for requirement in entry["requirements"]
        ]
        if recorded_requirements != pattern:
            raise RuntimeError(f"requirement mismatch for role {role}")
        expected = [-variable_of[item] for item in pattern]
        if expected != entry["blocking_clause"]:
            raise RuntimeError(f"block mismatch for role {role}")
        matched += 1
    if matched != BLOCK_COUNT:
        raise RuntimeError("differential re-derivation did not cover every block")
    print(f"differential re-derivation matched {matched} blocking clauses")

    text = TEMPLATE.read_text(encoding="utf-8")
    if NEW_FAMILY in text or NEW_DATA in text:
        raise RuntimeError("template already mentions the core-pair names")

    # 1. Excise every generated twenty-first-bank payload region to a
    # placeholder so the skeleton rewrites below can never touch payload
    # literals.
    text = replace_between(
        text,
        "/- The 38 genuinely fresh definitions",
        "/-- Deliberately non-family source meaning",
        "@@DEFINITIONS@@",
    )
    text = replace_between(
        text,
        "/- BEGIN GENERATED IMPLICATION CLAUSE ANCHOR -/",
        "private def definitionCompilerValid",
        "@@IMPLICATIONS@@",
    )
    text = replace_between(
        text,
        "/- The 2,546 realizable roles",
        "def lookupDefinition",
        "@@ROLES@@",
    )
    text = replace_between(
        text,
        "/- BEGIN GENERATED BLOCKING CLAUSE ANCHOR -/",
        "/-- Executable cardinality, distinctness, and variable-range anchor. -/",
        "@@BLOCKS@@",
    )
    text = replace_between(
        text,
        "/-- Executable cardinality, distinctness, and variable-range anchor. -/",
        "private def entryValid",
        "@@SHAPE@@",
    )

    # 2. Module doc.
    doc_start = "/-!\n# Exact CNF binding"
    doc_end = "-/\n\nnamespace Problem97"
    head, marker, rest = text.partition(doc_start)
    if not marker:
        raise RuntimeError("missing module-doc marker")
    _old_doc, marker, tail = rest.partition(doc_end)
    if not marker:
        raise RuntimeError("missing module-doc terminator")
    doc = """/-!
# Exact CNF binding for the label-general core-pair all-order
common-five family

This file binds all 23,802 realizable `(a, b, c, x, y)` roles of the
core-pair delta family — the two-core orbit, in which each canonical
boundary order orients the role's own core or its rotated partner, minus
the single-core sub-orbit already installed by the center-exchange
parent — to the deterministic positive-membership extension installed
after the v25 center-exchange all-order common-five family.  2,131 of the
2,168 requirements reuse their exact inherited parent-chain variables
(44,876--47,174, non-contiguous).  The remaining 37 requirements receive
fresh variables 47,175--47,211.  Each role contributes one four-literal
block — the union of its two cores' rows — after 380 fresh deterministic
implications.

This is finite exact-twelve predicate ingress only.  It does not assert
terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift, or live
Rigid221 closure.
-/

namespace Problem97"""
    text = head + doc + tail

    # 3. Parent cutoff rewrite on the pure skeleton (the template cutoff token
    # never survives in prose, and payload regions are placeholders).
    text = replace_counted(
        text, TEMPLATE_CUTOFF, str(PARENT_CUTOFF), TEMPLATE_CUTOFF_COUNT
    )

    # 4. Fail-closed lookup fallback becomes the first fresh O8 definition.
    text = replace_counted(
        text,
        TEMPLATE_FALLBACK,
        f"getD ({mk_definition_call(fresh[0])})",
        1,
    )

    # 5. Names: certificate import, namespaces, and the producer pick up the
    # CorePair prefix; the family record becomes the two-core
    # CorePairCommonFiveData, whose checked entry point is the plain `check`
    # rather than the template's widened `centerExchangeCheck`.
    text = replace_counted(text, OLD_FAMILY, NEW_FAMILY, 4)
    text = replace_counted(text, OLD_DATA, NEW_DATA, 1)
    text = replace_counted(
        text, "entry.data.centerExchangeCheck", "entry.data.check", 2
    )

    # 6. Skeleton prose.
    text = replace_counted(
        text,
        "outside the 38 fresh indices",
        f"outside the {FRESH_COUNT} fresh indices",
        1,
    )
    text = replace_counted(
        text,
        "for the 38 fresh definitions",
        f"for the {FRESH_COUNT} fresh definitions",
        1,
    )
    # The consumer theorem also needs a larger elaboration budget than the
    # template: `ofCorePairAllOrderCommonFive` carries a four-way orientation
    # case split, so whnf of its nogood record is heavier than the
    # twenty-first bank's two-way producer and overruns the default 200,000
    # heartbeats.
    text = replace_counted(
        text,
        "/-- Falsifying one family block contradicts source geometry through the checked\n"
        "label-general center-exchange all-order common-five theorem. -/",
        f"set_option maxHeartbeats {CONSUMER_MAX_HEARTBEATS} in\n"
        "-- The core-pair producer's four-way orientation case split makes whnf of\n"
        "-- its nogood record heavier than the twenty-first bank's two-way\n"
        "-- producer, past the default heartbeat budget.  The budget bounds\n"
        "-- elaboration work only; it changes no trust assumption.\n"
        "/-- Falsifying one family block contradicts source geometry through the checked\n"
        "label-general core-pair all-order common-five theorem. -/",
        1,
    )

    # 7. Substitute the O8 payload.
    text = substitute_placeholder(
        text, "@@DEFINITIONS@@", definition_source(fresh, reused)
    )
    implication_theorem = f"""/- BEGIN GENERATED IMPLICATION CLAUSE ANCHOR -/
{lean_chunked_clause_anchor(stem="expectedImplicationDimacs", clauses=implications, chunk_size=64, per_line=4)}
/- END GENERATED IMPLICATION CLAUSE ANCHOR -/

/-- Executable byte-order anchor for all {IMPLICATION_COUNT} Python-installed
implications. -/
theorem implicationDimacs_eq :
    implicationDimacs = expectedImplicationDimacs := by
  native_decide"""
    text = substitute_placeholder(text, "@@IMPLICATIONS@@", implication_theorem)
    text = substitute_placeholder(text, "@@ROLES@@", family_source(roles))
    blocking_theorem = f"""/- BEGIN GENERATED BLOCKING CLAUSE ANCHOR -/
{lean_chunked_clause_anchor(stem="expectedBlockingClauses", clauses=blocks, chunk_size=48, per_line=3)}
/- END GENERATED BLOCKING CLAUSE ANCHOR -/

/-- Executable byte-order anchor for all {BLOCK_COUNT:,} Python-installed blocks. -/
theorem blockingClauses_eq :
    blockingClauses = expectedBlockingClauses := by
  native_decide"""
    text = substitute_placeholder(text, "@@BLOCKS@@", blocking_theorem)
    shape_theorem = f"""/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = {FRESH_COUNT} ∧ reusedDefinitions.length = {REUSED_COUNT} ∧
      definitions.length = {DEFINITION_COUNT} ∧ implicationDimacs.length = {IMPLICATION_COUNT} ∧
      entries.length = {ROLE_COUNT} ∧ blockingClauses.length = {BLOCK_COUNT} ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        ({FRESH_LOW} ≤ definition.varIndex ∧ definition.varIndex ≤ {FRESH_HIGH})) = true := by
  native_decide"""
    text = substitute_placeholder(text, "@@SHAPE@@", shape_theorem)

    if "@@" in text:
        raise RuntimeError("unsubstituted placeholder remains")

    OUTPUT.write_text(text, encoding="utf-8")
    print(
        f"wrote {OUTPUT.relative_to(ROOT)}: {len(fresh)} fresh definitions, "
        f"{len(reused)} reused definitions, {len(implications)} implications, "
        f"{len(blocks)} blocks, {len(text.splitlines())} lines, "
        f"{len(text.encode('utf-8'))} bytes"
    )


if __name__ == "__main__":
    main()
