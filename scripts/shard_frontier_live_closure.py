#!/usr/bin/env python3
"""Shard FrontierLiveClosure.lean per docs/frontier-live-closure-sharding-plan-2026-08-05.md.

Cuts the monolith into 15 shard files under FrontierLiveClosure/ plus an
umbrella import file at the original module path. Pure text partition:
every body line of the original lands in exactly one shard (asserted);
prologues/epilogues and include-state lines are generated and marked.

Modes:
  --check          analyze and report (default; writes nothing)
  --write          emit shard files + umbrella (refuses if the target file
                   has uncommitted changes, unless --allow-dirty)
  --file PATH      source file (default: the production path)
  --allow-dirty    skip the git-clean gate (trial runs only)
  --out-dir DIR    emit into DIR instead of the production directory
                   (trial runs; umbrella goes to DIR/FrontierLiveClosure.lean)

Safety gates (all hard-abort on failure):
  * every anchor resolves to exactly one line;
  * cut points are strictly increasing and tile the body exactly;
  * prefix groups (docstrings, @[...] attributes, `... in` modifier chains,
    attached comment blocks) stay with their declaration (#3035);
  * persistent include/omit state is folded; non-neutral cuts get one
    marked `include` line; unparseable commands abort;
  * no private declaration is referenced outside its shard.
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
DEFAULT_FILE = REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"
MODULE_PREFIX = "Erdos9796Proof.P97.ATail.FrontierLiveClosure"
STATE_MARK = "-- [shard-prologue-state]"

TWOSOURCE_NS = "TwoSourceExactCollisionRowsTerminal"

# (module name, anchor). Anchor kinds:
#   ("body-start",)            first declaration of the body
#   ("decl", name)             declaration keyword line introducing `name`
#   ("namespace", name)        `namespace name` line
#   ("first-decl-after-end", ns)  first declaration after `end ns`
SHARDS = [
    ("JointDeletionCore", ("body-start",)),
    ("B1Live", ("decl", "b1_live_normalForm")),
    ("TwoDeletionCollision",
     ("decl", "exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource")),
    ("Rigid221Placement", ("decl", "ExactFourMutualOmissionRigid221GlobalDeletion")),
    ("Rigid221SourceHeavy",
     ("decl", "ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket")),
    ("Rigid221Closure",
     ("decl", "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU")),
    # anchor moved from false_of_frontierBiApexRobustExactFiveSecondCapResidual
    # so the private redesignateFirstOppCapAsSurplus stays with its users
    ("TriApexEndpointRetainedOmission",
     ("decl", "redesignateFirstOppCapAsSurplus")),
    ("TwoSourceCanonicalSurface", ("namespace", TWOSOURCE_NS)),
    ("TwoSourceFreshThirdFiber",
     ("decl", "false_of_twoCapSources_freshOutsideFirstBlockerFiber")),
    ("TwoSourceFreshThirdResidual", ("namespace", "FreshThirdTwoCapSourceObstruction")),
    ("TwoSourceFirstFiberCollision",
     ("decl", "collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted")),
    ("TwoSourceClosure", ("decl", "exists_mutualBlockerCapIndices_same_only_first")),
    ("TwoSourceRetainedMinimalCore",
     ("decl", "exists_freshThird_retained_minimalDeletionCoreProducer")),
    ("TwoSourceAlignedLowHits",
     ("decl", "false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector")),
    ("Coordinator", ("first-decl-after-end", TWOSOURCE_NS)),
]

# Private declarations whose users end up in a later shard than their
# definition, where no boundary move can reunite them (spans up to eight
# shards). `private` is file-scoped, so the split must make them public.
# All 11 verified globally unique in the package (2026-08-05). Recorded in
# the split commit message.
DEPRIVATIZE = {
    "exactFourMutualOmissionJointDeletion_exactFive_strongSplit",
    "third_not_mem_of_card_le_two",
    "redesignateFirstOppCapAsSurplusAtAllLarge",
    "triApexAllLargeContext_index_cases",
    "endpointFreshTwoShellSeed",
    "exists_two_firstFiberCapSourceWitness_of_commonRadius",
    "false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius",
    "offCapPoint_blocker_ne_first_of_ne_outsidePair",
    "firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned",
    "exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion",
    "firstApex_minimalDeletionCore_of_crossRetainedEndpoints",
}

DECL_RE = re.compile(
    r"^(private\s+)?(protected\s+)?(noncomputable\s+)?"
    r"(theorem|lemma|def|abbrev|structure|inductive|instance)\b")
MODIFIER_IN_RE = re.compile(r"^(set_option|omit|include|open)\b.*\bin\s*$")
STATE_CMD_RE = re.compile(r"^(omit|include)\s+(.*\S)\s*$")


def die(msg: str) -> None:
    sys.exit(f"ABORT: {msg}")


def find_unique(lines: list[str], pred, what: str) -> int:
    hits = [i for i, l in enumerate(lines) if pred(l)]
    if len(hits) != 1:
        die(f"{what}: expected exactly 1 match, got {len(hits)} "
            f"(lines {[h + 1 for h in hits][:5]})")
    return hits[0]


def decl_line_pred(name: str):
    pat = re.compile(
        r"^(private\s+)?(protected\s+)?(noncomputable\s+)?"
        r"(theorem|lemma|def|abbrev|structure|inductive)\s+" + re.escape(name) + r"\b")
    return lambda l: bool(pat.match(l))


def parse_header(lines: list[str]) -> dict:
    """Locate the fixed header components; abort if the shape changed."""
    h: dict = {}
    if not lines[0].startswith("/-"):
        die("file does not start with the copyright block")
    i = 0
    while not lines[i].rstrip().endswith("-/"):
        i += 1
    h["copyright"] = lines[: i + 1]
    h["imports"] = [l for l in lines if l.startswith("import ")]
    if not h["imports"]:
        die("no import lines found")
    ns1 = find_unique(lines, lambda l: l.rstrip() == "namespace Problem97", "outer namespace")
    ns2 = find_unique(lines, lambda l: l.rstrip() == "namespace ATailFrontierLiveClosure",
                      "inner namespace")
    header_docs = [i for i, l in enumerate(lines[:ns1]) if l.startswith("/-!")]
    if len(header_docs) != 1:
        die(f"expected exactly 1 module docstring before the namespaces, "
            f"got {len(header_docs)}")
    doc_start = header_docs[0]
    j = doc_start
    while not lines[j].rstrip().endswith("-/"):
        j += 1
    h["moduledoc"] = lines[doc_start: j + 1]
    if not (doc_start < ns1 < ns2):
        die("unexpected header ordering")
    attr = find_unique(lines, lambda l: l.startswith(
        "attribute [local instance] Classical.propDecidable"), "propDecidable attribute")
    h["opens"] = [l for l in lines[ns2 + 1: attr] if l.startswith("open")]
    if not h["opens"]:
        die("no open block found between namespace and attribute")
    stray = [k + ns2 + 2 for k, l in enumerate(lines[ns2 + 1: attr])
             if l.strip() and not l.startswith("open")]
    if stray:
        die(f"non-open, non-blank lines inside the open block: {stray}")
    h["body_start"] = attr + 1  # 0-based index of first body line
    return h


def parse_footer(lines: list[str]) -> int:
    """Return 0-based index of `end ATailFrontierLiveClosure`; assert shape."""
    tail = [l.rstrip() for l in lines if l.strip()]
    if tail[-2:] != ["end ATailFrontierLiveClosure", "end Problem97"]:
        die("file does not end with the two expected `end` lines")
    return find_unique(lines, lambda l: l.rstrip() == "end ATailFrontierLiveClosure",
                       "closing end")


def prefix_group_start(lines: list[str], anchor: int, floor: int) -> int:
    """Walk up from `anchor` collecting its inseparable prefix group (#3035)."""
    cur = anchor - 1
    start = anchor
    pending_blanks = 0
    while cur > floor:
        line = lines[cur]
        s = line.strip()
        if s == "":
            pending_blanks += 1
            cur -= 1
            continue
        if s.endswith("-/"):  # any comment block directly above travels along
            depth, j = 0, cur
            while j >= floor:
                opens, closes, i = 0, 0, 0
                # left-to-right non-overlapping scan, matching Lean's lexer
                # (`/-/` is one opener, not opener+closer)
                while i < len(lines[j]) - 1:
                    pair = lines[j][i:i + 2]
                    if pair == "/-":
                        opens += 1
                        i += 2
                    elif pair == "-/":
                        closes += 1
                        i += 2
                    else:
                        i += 1
                depth += closes - opens
                if depth <= 0:
                    break
                j -= 1
            if depth > 0:
                die(f"unterminated comment block walking up from line {cur + 1}")
            start = j
            cur = j - 1
            pending_blanks = 0
            continue
        if s.endswith(" in"):
            # last line of a possibly multi-line modifier command: walk up
            # over indented continuation lines to the column-0 command start
            k = cur
            while k > floor and lines[k][:1] in (" ", "\t"):
                k -= 1
            if re.match(r"^(set_option|omit|include|open)\b", lines[k]):
                start = k
                cur = k - 1
                pending_blanks = 0
                continue
            break
        if s.startswith("@[") or s.startswith("--"):
            start = cur
            cur -= 1
            pending_blanks = 0
            continue
        if s.endswith("]") and any(lines[k].strip().startswith("@[")
                                   for k in range(max(floor, cur - 5), cur)):
            # tail of a multi-line attribute block: walk to its @[ opener
            k = cur
            while not lines[k].strip().startswith("@["):
                k -= 1
            start = k
            cur = k - 1
            pending_blanks = 0
            continue
        break
    return start


def tokenize_state_cmd(args: str) -> list[str]:
    toks, buf, depth = [], [], 0
    for ch in args:
        if ch == "[":
            depth += 1
        elif ch == "]":
            depth -= 1
        if ch.isspace() and depth == 0:
            if buf:
                toks.append("".join(buf))
                buf = []
        else:
            buf.append(ch)
    if buf:
        toks.append("".join(buf))
    if depth != 0:
        die(f"unbalanced brackets in include/omit args: {args!r}")
    return toks


def fold_state(lines: list[str], upto: int, region_start: int) -> list[str]:
    """Active include-set (insertion-ordered) at line index `upto`.

    Commands may span lines (indented continuations); a command whose joined
    text ends in ` in` is a one-shot modifier and does not change state.
    """
    active: dict[str, None] = {}
    i = region_start
    while i < upto:
        m = STATE_CMD_RE.match(lines[i].rstrip())
        if not m:
            i += 1
            continue
        block = [lines[i].rstrip()]
        j = i + 1
        while j < len(lines) and lines[j][:1] in (" ", "\t") and lines[j].strip():
            block.append(lines[j].strip())
            j += 1
        joined = " ".join(block)
        if not joined.endswith(" in"):
            kind, args = joined.split(None, 1)[0], joined.split(None, 1)[1]
            toks = tokenize_state_cmd(args)
            if kind == "include":
                for t in toks:
                    active[t] = None
            else:
                for t in toks:
                    active.pop(t, None)
        i = j
    return list(active)


def extract_variable_block(lines: list[str], section_line: int) -> list[str]:
    vstart = section_line + 1
    while lines[vstart].strip() == "":
        vstart += 1
    if not lines[vstart].startswith("variable"):
        die(f"expected `variable` after `section` (line {vstart + 1})")
    vend = vstart + 1
    while vend < len(lines) and (lines[vend].startswith((" ", "\t"))
                                 or lines[vend].strip() == ""):
        # stop at first blank line followed by a non-indented line
        if lines[vend].strip() == "" and not lines[vend + 1].startswith((" ", "\t")):
            break
        vend += 1
    return lines[vstart:vend]


def collect_privates(lines: list[str], body_start: int, body_end: int) -> dict[str, int]:
    out = {}
    for i in range(body_start, body_end):
        if not lines[i].startswith("private"):
            continue
        m = re.match(r"^private\s+(?:noncomputable\s+)?"
                     r"(?:theorem|lemma|def|abbrev|structure)\s*(\S+)?", lines[i])
        if not m:
            die(f"unrecognized private declaration at line {i + 1}")
        name = m.group(1)
        if name is None:  # name on the following line
            name = lines[i + 1].split()[0]
        out[name.rstrip(":")] = i
    return out


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--file", type=Path, default=DEFAULT_FILE)
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--allow-dirty", action="store_true")
    ap.add_argument("--out-dir", type=Path, default=None)
    args = ap.parse_args()

    text = args.file.read_text()
    lines = text.split("\n")
    header = parse_header(lines)
    body_start = header["body_start"]
    body_end = parse_footer(lines)  # exclusive: index of `end ATailFrontierLiveClosure`

    ns_open = find_unique(lines, lambda l: l.rstrip() == f"namespace {TWOSOURCE_NS}",
                          f"namespace {TWOSOURCE_NS}")
    ns_close = find_unique(lines, lambda l: l.rstrip() == f"end {TWOSOURCE_NS}",
                           f"end {TWOSOURCE_NS}")
    section_line = ns_open + 1
    while lines[section_line].strip() == "":
        section_line += 1
    if lines[section_line].strip() != "section":
        die("expected `section` right after the TwoSource namespace line")
    var_block = extract_variable_block(lines, section_line)

    # ---- resolve anchors -> cut indices -------------------------------------
    cuts: list[tuple[str, int]] = []
    for name, anchor in SHARDS:
        if anchor[0] == "body-start":
            idx = body_start
            while lines[idx].strip() == "":
                idx += 1
        elif anchor[0] == "decl":
            a = find_unique(lines, decl_line_pred(anchor[1]), f"anchor {anchor[1]}")
            idx = prefix_group_start(lines, a, body_start)
        elif anchor[0] == "namespace":
            a = find_unique(lines, lambda l, n=anchor[1]: l.rstrip() == f"namespace {n}",
                            f"anchor namespace {anchor[1]}")
            idx = prefix_group_start(lines, a, body_start)
        elif anchor[0] == "first-decl-after-end":
            e = find_unique(lines, lambda l, n=anchor[1]: l.rstrip() == f"end {n}",
                            f"end {anchor[1]}")
            j = e + 1
            while not DECL_RE.match(lines[j]):
                j += 1
            idx = prefix_group_start(lines, j, e + 1)
        else:
            die(f"unknown anchor kind {anchor[0]}")
        cuts.append((name, idx))

    for (n1, c1), (n2, c2) in zip(cuts, cuts[1:]):
        if c1 >= c2:
            die(f"cut order violated: {n1}@{c1 + 1} >= {n2}@{c2 + 1}")
    if cuts[0][1] < body_start:
        die("first cut precedes body start")

    spans = []  # (module, start, end) 0-based, end exclusive
    for k, (name, c) in enumerate(cuts):
        end = cuts[k + 1][1] if k + 1 < len(cuts) else body_end
        spans.append((name, c, end))
    # tiling assert: spans cover [first_cut, body_end) with no gaps
    if spans[0][1] != cuts[0][1] or any(
            spans[k][2] != spans[k + 1][1] for k in range(len(spans) - 1)):
        die("spans do not tile the body")
    preamble_gap = [i for i in range(body_start, cuts[0][1]) if lines[i].strip()]
    if preamble_gap:
        die(f"non-blank body lines before first shard: {[i + 1 for i in preamble_gap]}")

    # ---- per-shard scope + state -------------------------------------------
    shard_info = []
    for name, s, e in spans:
        inside = ns_open < s <= ns_close  # starts strictly inside the region
        contains_open = s <= ns_open < e
        contains_close = s <= ns_close < e
        state = fold_state(lines, s, ns_open) if inside else []
        shard_info.append(dict(name=name, start=s, end=e, inside=inside,
                               contains_open=contains_open,
                               contains_close=contains_close, state=state))

    # ---- private gate -------------------------------------------------------
    privates = collect_privates(lines, body_start, body_end)
    missing = DEPRIVATIZE - set(privates)
    if missing:
        die(f"DEPRIVATIZE names not found as private declarations: {sorted(missing)}")
    violations = []
    for pname, pline in privates.items():
        if pname in DEPRIVATIZE:
            continue
        home = next((i for i, sh in enumerate(shard_info)
                     if sh["start"] <= pline < sh["end"]), None)
        pat = re.compile(r"\b" + re.escape(pname) + r"\b")
        for i, sh in enumerate(shard_info):
            if i == home:
                continue
            for j in range(sh["start"], sh["end"]):
                if pat.search(lines[j]):
                    violations.append((pname, pline + 1, j + 1, sh["name"]))
    if violations:
        for v in violations:
            print(f"PRIVATE VIOLATION: {v[0]} (decl line {v[1]}) used at "
                  f"line {v[2]} in shard {v[3]}")
        die("private declarations cross shard boundaries")

    # ---- report -------------------------------------------------------------
    print(f"source: {args.file} ({len(lines)} lines)")
    for sh in shard_info:
        n = sh["end"] - sh["start"]
        st = f" state={sh['state']}" if sh["state"] else ""
        print(f"  {sh['name']:34s} lines {sh['start'] + 1:>6}-{sh['end']:>6} "
              f"({n:>5}){st}")
        ctx = lines[max(0, sh["start"] - 2): sh["start"] + 2]
        for c in ctx:
            print(f"      | {c[:90]}")
    print(f"privates: {len(privates)}; shard-local: {len(privates) - len(DEPRIVATIZE)}; "
          f"de-privatized: {len(DEPRIVATIZE)}")
    depriv_lines = {privates[n]: n for n in DEPRIVATIZE}
    for ln in sorted(depriv_lines):
        if not lines[ln].startswith("private "):
            die(f"expected `private ` at line {ln + 1} for {depriv_lines[ln]}")
        print(f"  de-privatize line {ln + 1}: {depriv_lines[ln]}")

    if not args.write:
        print("check mode: no files written")
        return

    if not args.allow_dirty and args.out_dir is None:
        st = subprocess.run(["git", "status", "--porcelain", str(args.file)],
                            cwd=REPO, capture_output=True, text=True).stdout.strip()
        if st:
            die(f"{args.file.name} has uncommitted changes; commit first "
                "(or pass --allow-dirty for a trial)")

    out_dir = args.out_dir or (args.file.parent / "FrontierLiveClosure")
    out_dir.mkdir(parents=True, exist_ok=True)
    umbrella_path = (args.out_dir / "FrontierLiveClosure.lean") if args.out_dir \
        else args.file

    def prologue(k: int, sh: dict) -> list[str]:
        out = list(header["copyright"])
        out.append("")
        if k == 0:
            out.extend(header["imports"])
        else:
            out.append(f"import {MODULE_PREFIX}.{shard_info[k - 1]['name']}")
        out.append("")
        out.append("namespace Problem97")
        out.append("namespace ATailFrontierLiveClosure")
        out.append("")
        out.extend(header["opens"])
        out.append("")
        out.append("attribute [local instance] Classical.propDecidable")
        out.append("")
        if sh["inside"]:
            out.append(f"namespace {TWOSOURCE_NS}")
            out.append("")
            out.append("section")
            out.append("")
            out.extend(var_block)
            out.append("")
            if sh["state"]:
                out.append(f"include {' '.join(sh['state'])} {STATE_MARK}")
                out.append("")
        return out

    def epilogue(sh: dict) -> list[str]:
        out = [""]
        if sh["inside"] and not sh["contains_close"]:
            out.append("end")
            out.append(f"end {TWOSOURCE_NS}")
        if sh["contains_open"] and not sh["contains_close"]:
            out.append("end")
            out.append(f"end {TWOSOURCE_NS}")
        out.append("end ATailFrontierLiveClosure")
        out.append("end Problem97")
        return out

    for k, sh in enumerate(shard_info):
        body = [lines[i].replace("private ", "", 1) if i in depriv_lines else lines[i]
                for i in range(sh["start"], sh["end"])]
        content = prologue(k, sh) + body + epilogue(sh)
        (out_dir / f"{sh['name']}.lean").write_text("\n".join(content).rstrip("\n") + "\n")

    umbrella = list(header["copyright"]) + [""]
    umbrella += [f"import {MODULE_PREFIX}.{sh['name']}" for sh in shard_info]
    umbrella += [""] + header["moduledoc"]
    umbrella_path.write_text("\n".join(umbrella).rstrip("\n") + "\n")
    print(f"wrote {len(shard_info)} shards to {out_dir} and umbrella to {umbrella_path}")


if __name__ == "__main__":
    main()
