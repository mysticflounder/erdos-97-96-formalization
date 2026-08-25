#!/usr/bin/env python3
"""Forbidden-import lint for the FrontierLiveClosure proof clusters.

The A-tail frontier live-closure directory is partitioned into proof clusters
(Rigid221, TriApex, TwoSource, TwoDeletion, B1) plus a `shared` remainder.  The
architectural rule this script enforces:

  * a cluster module may import shared modules freely (`to-shared`);
  * a cluster module may import modules of its own cluster (`intra-cluster`);
  * a cluster module must NOT import a module of a different cluster
    (`cross-cluster`);
  * a shared module must NOT import a cluster module
    (`from-shared-to-cluster`) -- a core/shared module must not depend on a
    cluster.

Every cross-cluster and from-shared-to-cluster edge that already existed when
the rule was introduced is recorded in `proof-status/import-waivers.json`.  The
lint fails only on edges that are not covered by a waiver, so the graph can be
frozen at its current shape and untangled wave by wave.

A waiver is not self-authenticating.  Each waiver row must name a `(from, to)`
pair that the frozen Phase 0 graph record `proof-status/cluster-import-edges.json`
records as a forbidden edge, and that is still present in the live tree.  A pair
absent from the frozen record is an unauthenticated waiver (it would license an
edge that the freeze never observed); a pair whose live edge is gone is a stale
waiver row that must be deleted with the edge it used to cover.  Both fail.

Import scanning covers the Lean module header only.  Lean 4 requires every
`import` command to precede any other command, so the header ends at the first
line that is not blank, not a comment, and not an import.  Prose in a module
docstring can therefore never be mistaken for an import, which lets the parser
accept the real-world spellings (leading whitespace, a trailing `--` comment)
that a column-0 exact-prefix match would silently drop.

Named Legacy wrappers
---------------------

The consolidation audit permits one migration escape hatch: an edge that leaves
or enters an explicitly named Legacy wrapper.  "Explicitly named" is meant
literally.  A module is a Legacy wrapper only when its fully-qualified name
lives directly under `Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy`, and
every single Legacy edge in the live tree must be listed, one row per edge, in
`proof-status/legacy-import-exceptions.json`.  There is no prefix, glob,
basename, directory-wide or otherwise arbitrary exemption anywhere in this
lint: a module called `LegacyWrappers`, or a `Legacy` component at any other
depth, is an ordinary module with no privileges at all.

A listed Legacy edge does not count as a forbidden edge, but it is always
printed, so the escape hatch can never be used quietly.  `--fail-on-legacy`
rejects every Legacy edge, listed or not, which is how the wave that empties
the waiver file proves the migration is finished.

The Legacy manifest cross-references the waiver file through `waiver_pair`.
A non-null `waiver_pair` names the waiver row that the wrapper exists to
retire; that row must still be present and still cover a live forbidden edge.
Once the wrapper actually retires the direct edge, the waiver row is stale and
the lint says so, so the waiver row and the manifest row move in one commit.

Dated current graph
-------------------

`--write-record PATH` writes the live scan in the frozen record's schema, with
`generated_from_head` and `live_record: true` added.  It is a generator mode
and byte-deterministic.  The lint never reads a live record for
authentication: `proof-status/cluster-import-edges.json` remains the sole
authentication basis for waiver rows.

Usage:

    uv run python scripts/lint_cluster_imports.py
    uv run python scripts/lint_cluster_imports.py --json
    uv run python scripts/lint_cluster_imports.py --list-waived
    uv run python scripts/lint_cluster_imports.py --list-legacy
    uv run python scripts/lint_cluster_imports.py --fail-on-legacy
    uv run python scripts/lint_cluster_imports.py --scan-file PATH
    uv run python scripts/lint_cluster_imports.py --write-record PATH

Exit status:
    0  every forbidden edge in the live tree is waived by an authenticated
       waiver, every Legacy edge is listed in the Legacy manifest, and the
       waiver file's own metadata and summary are consistent
    1  at least one non-waived forbidden edge; at least one waiver that fails
       authentication or metadata validation; at least one unlisted, stale,
       duplicated or misclassified Legacy exception; a frozen row whose class
       the live tree recomputes differently; or --fail-on-legacy with a Legacy
       edge present
    2  the lint could not run (missing tree; unreadable waiver, graph or
       Legacy manifest file; a frozen graph record that fails its own
       structural validation; a Legacy manifest whose `base_head` is malformed
       or whose `frozen_graph_sha256` does not match the graph file in use)

Standard library only.  No third-party imports, no regular expressions.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys

# --------------------------------------------------------------------------
# Repository layout
# --------------------------------------------------------------------------

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

CLUSTER_NAMESPACE = "Erdos9796Proof.P97.ATail.FrontierLiveClosure"
# Legacy wrappers live directly under the cluster namespace and nowhere else.
LEGACY_NAMESPACE = CLUSTER_NAMESPACE + ".Legacy"

# Every path below is derived from one root by `configure_paths`, which is the
# only seam a test needs: point it at a fixture tree and the whole lint follows.
# Module-level names are kept (functions read them as globals at call time) so
# default behaviour is byte-for-byte what it was before the seam existed.
REPO_ROOT = ""
LEAN_ROOT = ""
CLUSTER_DIR = ""
COORDINATOR_FILE = ""
WAIVER_FILE = ""
GRAPH_FILE = ""
LEGACY_FILE = ""


def configure_paths(repo_root: str) -> None:
    """Point every derived path at `repo_root`.

    Called once at import with the real repository root.  Tests call it again
    with a fixture root; nothing else in the module hard-codes a path.
    """
    global REPO_ROOT, LEAN_ROOT, CLUSTER_DIR, COORDINATOR_FILE
    global WAIVER_FILE, GRAPH_FILE, LEGACY_FILE
    REPO_ROOT = os.path.abspath(repo_root)
    LEAN_ROOT = os.path.join(REPO_ROOT, "lean")
    CLUSTER_DIR = os.path.join(
        LEAN_ROOT, "Erdos9796Proof", "P97", "ATail", "FrontierLiveClosure"
    )
    # The parent coordinator module file sits beside the directory, not inside it.
    COORDINATOR_FILE = CLUSTER_DIR + ".lean"
    WAIVER_FILE = os.path.join(REPO_ROOT, "proof-status", "import-waivers.json")
    # Frozen Phase 0 graph record.  Read-only here: it is the authentication
    # basis for every waiver row, never rewritten by this script.
    GRAPH_FILE = os.path.join(REPO_ROOT, "proof-status", "cluster-import-edges.json")
    LEGACY_FILE = os.path.join(
        REPO_ROOT, "proof-status", "legacy-import-exceptions.json"
    )


configure_paths(os.path.dirname(SCRIPT_DIR))

# --------------------------------------------------------------------------
# Cluster classification
# --------------------------------------------------------------------------

SHARED = "shared"

# Ordered (basename prefix, cluster) pairs.  Matching is on the FINAL dotted
# component of the module name only -- never on a substring of the full path --
# so `ExactTwelveRigid221Ingress` is shared, not Rigid221, and the nested
# `...FrontierLiveClosure.Coordinator` is never confused with the parent
# coordinator module `...ATail.FrontierLiveClosure`.
CLUSTER_PREFIXES = (
    ("Rigid221", "Rigid221"),
    ("TriApex", "TriApex"),
    ("TwoSource", "TwoSource"),
    ("FreshThird", "TwoSource"),
    ("FirstFiber", "TwoSource"),
    ("FirstNonHit", "TwoSource"),
    ("TwoDeletion", "TwoDeletion"),
)

# Exact basenames (not prefixes) that name a cluster.
CLUSTER_EXACT = {
    "B1Live": "B1",
}

# Directory components that name a cluster.  When the consolidation refactor
# moves a cluster's modules into `.../FrontierLiveClosure/<Cluster>/`, the file
# basenames stop carrying the cluster name (`TwoDeletion/Coordinator.lean`), so
# the basename rule alone would classify them `shared` and silently drop the
# architectural rule.  Matching is on a WHOLE dotted component, never on a
# substring: `TwoDeletionFoo` is not the component `TwoDeletion`.
#
# This is classification, not an exemption.  It decides which cluster owns a
# module; it never permits an edge.
CLUSTER_DIR_COMPONENTS = {
    "Rigid221": "Rigid221",
    "TriApex": "TriApex",
    "TwoSource": "TwoSource",
    "TwoDeletion": "TwoDeletion",
}

MODULE_CHARS = frozenset(
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" "abcdefghijklmnopqrstuvwxyz" "0123456789" "_.'"
)
ASCII_UPPER = frozenset("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

IMPORT_KEYWORD = "import "

LINE_COMMENT = "--"
BLOCK_OPEN = "/-"
BLOCK_CLOSE = "-/"

# File-header commands that legally precede `import` and are not imports.  They
# are skipped, not treated as the end of the header.
HEADER_KEYWORDS = frozenset(("module", "prelude"))

# First tokens that mean "this line is an import the parser did not understand"
# -- for example the Lean module-system spellings `import all M`, `public import
# M`, `meta import M`.  Truncating the header there would silently drop every
# later import of the file, which is the lint bypass this parser exists to shut,
# so an unrecognized import form is a hard error instead.
IMPORT_LEAD_TOKENS = frozenset(("import", "public", "meta"))


class HeaderParseError(Exception):
    """An import-looking header line the parser refuses to guess at."""

# The retirement waves a waiver row may name.  An explicit tuple, so a typo or
# an invented wave label is a failure rather than an unnoticed free-text field.
ALLOWED_RETIREMENTS = ("W1b", "W2", "W3", "W4", "unassigned")


def cluster_of(module: str) -> str:
    """Cluster owning `module`.

    Three rules, applied in this order:

      1. a whole dotted component that is exactly a `CLUSTER_DIR_COMPONENTS`
         key -- the cluster directory the module lives in.  The leftmost such
         component wins, so the outermost cluster directory owns a module even
         if a deeper directory repeats another cluster's name;
      2. the `CLUSTER_PREFIXES` prefix rule on the FINAL dotted component only,
         never on a substring of the full path, so `ExactTwelveRigid221Ingress`
         stays shared;
      3. `CLUSTER_EXACT` on the final dotted component.

    Rules 2 and 3 are order-independent on the current key sets: no
    `CLUSTER_EXACT` key starts with any `CLUSTER_PREFIXES` prefix.  Should that
    ever stop holding, this order (prefix first) is the one the auditor fixed.
    """
    for component in module.split("."):
        cluster = CLUSTER_DIR_COMPONENTS.get(component)
        if cluster is not None:
            return cluster
    basename = module.rsplit(".", 1)[-1]
    for prefix, cluster in CLUSTER_PREFIXES:
        if basename.startswith(prefix):
            return cluster
    exact = CLUSTER_EXACT.get(basename)
    if exact is not None:
        return exact
    return SHARED


def is_legacy_module(module: str) -> bool:
    """True only for a module directly under the Legacy namespace.

    `Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy.Foo` qualifies, and so
    does anything deeper inside it.  Nothing else does -- not
    `...FrontierLiveClosure.LegacyWrappers`, not `...FrontierLiveClosure.Legacy`
    itself, and not a `Legacy` component at some other depth such as
    `...FrontierLiveClosure.Foo.Legacy.Bar`.  A prefix test on the bare word
    `Legacy` would hand every one of those an exemption it was never granted,
    which is why the test is on the exact namespace plus a separator.
    """
    return module.startswith(LEGACY_NAMESPACE + ".")


def legacy_endpoints(source: str, target: str) -> tuple:
    """The endpoints of `(source, target)` that are Legacy wrapper modules."""
    found = []
    if is_legacy_module(source):
        found.append(source)
    if is_legacy_module(target) and target != source:
        found.append(target)
    return tuple(found)


def classify(from_cluster: str, to_cluster: str) -> str:
    """Edge class.  The four labels are total and mutually exclusive."""
    if to_cluster == SHARED:
        # Covers cluster -> shared and shared -> shared.  Always permitted.
        return "to-shared"
    if from_cluster == SHARED:
        return "from-shared-to-cluster"
    if from_cluster == to_cluster:
        return "intra-cluster"
    return "cross-cluster"


FORBIDDEN_CLASSES = frozenset(("cross-cluster", "from-shared-to-cluster"))


# --------------------------------------------------------------------------
# Parsing
# --------------------------------------------------------------------------


def module_name(path: str) -> str:
    """Lean module name for a `.lean` file under `lean/`."""
    relative = os.path.relpath(path, LEAN_ROOT)
    if relative.endswith(".lean"):
        relative = relative[: -len(".lean")]
    return relative.replace(os.sep, ".")


def source_files() -> list:
    """Every `.lean` file in the cluster tree, plus the parent coordinator."""
    found = []
    if os.path.isfile(COORDINATOR_FILE):
        found.append(COORDINATOR_FILE)
    for dirpath, dirnames, filenames in os.walk(CLUSTER_DIR):
        dirnames.sort()
        for filename in sorted(filenames):
            if filename.endswith(".lean"):
                found.append(os.path.join(dirpath, filename))
    return found


def strip_comments(line: str, depth: int):
    """Return `(code, depth)`: `line` with Lean comments removed.

    `depth` is the number of `/-` block comments open when the line starts and
    is returned updated for the next line.  Lean 4 block comments nest, so the
    depth is a counter, not a flag.  A `--` line comment at depth 0 ends the
    line.  Character scan, no regular expressions.
    """
    kept = []
    index = 0
    length = len(line)
    while index < length:
        if depth > 0:
            if line.startswith(BLOCK_CLOSE, index):
                depth -= 1
                index += 2
                continue
            if line.startswith(BLOCK_OPEN, index):
                depth += 1
                index += 2
                continue
            index += 1
            continue
        if line.startswith(BLOCK_OPEN, index):
            depth += 1
            index += 2
            continue
        if line.startswith(LINE_COMMENT, index):
            break
        kept.append(line[index])
        index += 1
    return "".join(kept), depth


def import_target(line: str):
    """Module imported by `line`, or None when the line is not an import.

    Accepts leading whitespace and a trailing `--` comment, both of which occur
    in the live tree and were silently dropped by a column-0 exact match.  The
    module path itself must still start with an ASCII capital and use only Lean
    module characters, so prose such as `important:` or `imported here.` (no
    space after `import`) is rejected.

    Callers scan the module header only (see `header_imports`), so a docstring
    line that happens to read `import Foo` is never reached.
    """
    code, _ = strip_comments(line, 0)
    stripped = code.strip()
    if not stripped.startswith(IMPORT_KEYWORD):
        return None
    target = stripped[len(IMPORT_KEYWORD) :].strip()
    if not target:
        return None
    if target[0] not in ASCII_UPPER:
        return None
    for character in target:
        if character not in MODULE_CHARS:
            return None
    return target


def header_imports(path: str) -> list:
    """`(line_number, module)` for every import in `path`'s module header.

    Lean 4 requires all `import` commands to precede every other command, so
    the header ends at the first line that is neither blank, nor a comment, nor
    an import.  Scanning stops there: nothing after that point can be an import,
    and stopping keeps module-docstring prose out of the parser entirely.

    Raises `HeaderParseError` when the stopping line still looks like an import
    the parser does not understand, rather than truncating the header silently.
    """
    found = []
    depth = 0
    with open(path, "r", encoding="utf-8") as handle:
        for number, raw in enumerate(handle, 1):
            code, depth = strip_comments(raw.rstrip("\n"), depth)
            text = code.strip()
            if not text:
                # Blank line, whole-line comment, or a line inside a block
                # comment.  All three are legal inside a module header.
                continue
            target = import_target(code)
            if target is not None:
                found.append((number, target))
                continue
            tokens = text.split()
            if tokens and tokens[0] in HEADER_KEYWORDS:
                # `module` / `prelude` precede the imports; keep scanning.
                continue
            looks_like_import = bool(tokens) and (
                tokens[0] == "import"
                or (tokens[0] in IMPORT_LEAD_TOKENS and tokens[1:2] == ["import"])
            )
            if looks_like_import:
                raise HeaderParseError(
                    "%s:%d: unrecognized import form %s -- refusing to truncate "
                    "the header here; teach the parser this spelling"
                    % (path, number, json.dumps(text))
                )
            # First real command: the header is over.
            break
    return found


def in_cluster_tree(module: str) -> bool:
    return module == CLUSTER_NAMESPACE or module.startswith(CLUSTER_NAMESPACE + ".")


def edge_record(source_module: str, target: str, relative_path: str, number: int):
    source_cluster = cluster_of(source_module)
    target_cluster = cluster_of(target)
    return {
        "from": source_module,
        "to": target,
        "from_cluster": source_cluster,
        "to_cluster": target_cluster,
        "class": classify(source_cluster, target_cluster),
        "from_file": relative_path,
        "line": number,
    }


def collect_edges() -> list:
    """Every intra-directory import edge in the live tree.

    Each edge is a dict with `from`, `to`, `from_cluster`, `to_cluster`,
    `class`, `from_file` (repo-relative) and `line`.
    """
    edges = []
    for path in source_files():
        source_module = module_name(path)
        relative_path = os.path.relpath(path, REPO_ROOT)
        for number, target in header_imports(path):
            if not in_cluster_tree(target):
                continue
            edges.append(edge_record(source_module, target, relative_path, number))
    edges.sort(key=lambda edge: (edge["from"], edge["to"], edge["line"]))
    return edges


# --------------------------------------------------------------------------
# Frozen graph record
# --------------------------------------------------------------------------


GRAPH_SCHEMA = "cluster-import-edges/v1"

HEX_CHARS = frozenset("0123456789abcdef")


def is_short_head(value) -> bool:
    """True for an 8-character lowercase hex abbreviated commit id."""
    if not isinstance(value, str) or len(value) != 8:
        return False
    for character in value:
        if character not in HEX_CHARS:
            return False
    return True


def is_sha256_hex(value) -> bool:
    """True for a 64-character lowercase hex digest."""
    if not isinstance(value, str) or len(value) != 64:
        return False
    for character in value:
        if character not in HEX_CHARS:
            return False
    return True


def file_digest(path: str) -> str:
    """SHA-256 of a file's bytes, lowercase hex."""
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        while True:
            chunk = handle.read(65536)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


def load_frozen_edges(path: str) -> dict:
    """`{(from, to): class}` from the frozen Phase 0 graph record.

    Read-only.  This mapping is the authentication basis for waiver rows: a
    waiver may only cover a pair the freeze actually observed.

    The record is validated on every run, because an authentication basis that
    is never checked is not one.  `ValueError` here means the lint cannot run
    (exit 2): a wrong `schema`, a malformed `base_head`, a malformed row, or a
    duplicated `(from, to, line)` row -- the last because two rows for one
    physical import would let the record disagree with itself about a class
    while still looking well-formed.
    """
    label = os.path.basename(path)
    with open(path, "r", encoding="utf-8") as handle:
        document = json.load(handle)
    if not isinstance(document, dict):
        raise ValueError("%s: top level must be an object" % label)
    schema = document.get("schema")
    if schema != GRAPH_SCHEMA:
        raise ValueError(
            "%s: 'schema' is %s; expected %s"
            % (label, json.dumps(schema), json.dumps(GRAPH_SCHEMA))
        )
    if not is_short_head(document.get("base_head")):
        raise ValueError(
            "%s: 'base_head' is %s; expected 8 lowercase hex characters"
            % (label, json.dumps(document.get("base_head")))
        )
    entries = document.get("edges")
    if not isinstance(entries, list):
        raise ValueError("%s: 'edges' must be a list" % label)
    frozen = {}
    seen_rows = set()
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict):
            raise ValueError("%s: edge %d is not an object" % (label, index))
        source = entry.get("from")
        target = entry.get("to")
        edge_class = entry.get("class")
        if (
            not isinstance(source, str)
            or not isinstance(target, str)
            or not isinstance(edge_class, str)
        ):
            raise ValueError(
                "%s: edge %d needs string 'from', 'to' and 'class'" % (label, index)
            )
        if not source or not target or not edge_class:
            raise ValueError(
                "%s: edge %d has an empty 'from', 'to' or 'class'" % (label, index)
            )
        line = entry.get("line")
        if not isinstance(line, int) or isinstance(line, bool) or line < 1:
            raise ValueError(
                "%s: edge %d needs a positive integer 'line'" % (label, index)
            )
        row = (source, target, line)
        if row in seen_rows:
            raise ValueError(
                "%s: edge %d duplicates the row %s -> %s at line %d"
                % (label, index, source, target, line)
            )
        seen_rows.add(row)
        frozen[(source, target)] = edge_class
    if not frozen:
        raise ValueError("%s: 'edges' is empty" % label)
    return frozen


def frozen_class_disagreements(frozen: dict, edges: list) -> list:
    """Frozen rows whose class the live tree now recomputes differently.

    Only pairs that still exist live are checked: a retired edge is the waiver
    file's business, not a classification disagreement.  A disagreement means
    the recorded graph and the classifier no longer describe the same tree, so
    it is a lint failure (exit 1), not a silent drift.
    """
    failures = []
    for edge in edges:
        pair = (edge["from"], edge["to"])
        recorded = frozen.get(pair)
        if recorded is None or recorded == edge["class"]:
            continue
        failures.append(
            "frozen graph row %s -> %s records class '%s'; the live tree at "
            "%s:%d recomputes '%s'"
            % (
                pair[0],
                pair[1],
                recorded,
                edge["from_file"],
                edge["line"],
                edge["class"],
            )
        )
    return failures


# --------------------------------------------------------------------------
# Legacy wrapper exceptions
# --------------------------------------------------------------------------

LEGACY_SCHEMA = "legacy-import-exceptions/v1"

LEGACY_TOP_KEYS = frozenset(
    ("schema", "base_head", "frozen_graph_sha256", "exceptions")
)

LEGACY_ROW_KEYS = frozenset(
    (
        "wrapper_module",
        "from",
        "to",
        "class",
        "reason",
        "waiver_pair",
        "added_wave",
    )
)

# Wave labels a Legacy exception row may name in `added_wave`.  The same
# explicit vocabulary as ALLOWED_RETIREMENTS, so a typo or an invented wave is
# a failure here too rather than an unnoticed free-text field.
ALLOWED_ADDED_WAVES = ALLOWED_RETIREMENTS


def load_legacy_document(path: str, graph_path: str) -> dict:
    """The Legacy-exception manifest, structurally validated.

    `ValueError` here means the lint cannot run (exit 2).  Two of those checks
    are the reason the manifest can be trusted at all:

      * `base_head` must be an 8-hex commit id, so a row set is always pinned
        to the tree it was written against;
      * `frozen_graph_sha256` must equal the digest of the frozen graph record
        actually in use, so a manifest written against one authentication basis
        can never be silently applied to another.

    Per-row semantics are checked later, against the live tree, and fail the
    lint (exit 1) rather than stopping it.
    """
    label = os.path.basename(path)
    with open(path, "r", encoding="utf-8") as handle:
        document = json.load(handle)
    if not isinstance(document, dict):
        raise ValueError("%s: top level must be an object" % label)
    keys = frozenset(document.keys())
    if keys != LEGACY_TOP_KEYS:
        raise ValueError(
            "%s: top-level keys are %s; the schema is exactly %s"
            % (
                label,
                ", ".join(sorted(keys)) or "(none)",
                ", ".join(sorted(LEGACY_TOP_KEYS)),
            )
        )
    schema = document.get("schema")
    if schema != LEGACY_SCHEMA:
        raise ValueError(
            "%s: 'schema' is %s; expected %s"
            % (label, json.dumps(schema), json.dumps(LEGACY_SCHEMA))
        )
    if not is_short_head(document.get("base_head")):
        raise ValueError(
            "%s: 'base_head' is %s; expected 8 lowercase hex characters"
            % (label, json.dumps(document.get("base_head")))
        )
    recorded_digest = document.get("frozen_graph_sha256")
    if not is_sha256_hex(recorded_digest):
        raise ValueError(
            "%s: 'frozen_graph_sha256' is %s; expected 64 lowercase hex "
            "characters" % (label, json.dumps(recorded_digest))
        )
    actual_digest = file_digest(graph_path)
    if recorded_digest != actual_digest:
        raise ValueError(
            "%s: 'frozen_graph_sha256' is %s but %s digests to %s; the manifest "
            "was written against a different authentication basis"
            % (label, recorded_digest, os.path.basename(graph_path), actual_digest)
        )
    if not isinstance(document.get("exceptions"), list):
        raise ValueError("%s: 'exceptions' must be a list" % label)
    return document


def _legacy_row_failures(entry: dict, label: str) -> list:
    """Field-level problems of one manifest row (never the match/liveness ones)."""
    failures = []
    keys = frozenset(entry.keys())
    if keys != LEGACY_ROW_KEYS:
        failures.append(
            "%s: keys are %s; the schema is exactly %s"
            % (
                label,
                ", ".join(sorted(keys)) or "(none)",
                ", ".join(sorted(LEGACY_ROW_KEYS)),
            )
        )
    wrapper = entry.get("wrapper_module")
    if isinstance(wrapper, str) and wrapper and not is_legacy_module(wrapper):
        failures.append(
            "%s: 'wrapper_module' %s is not under %s; only a module there is a "
            "Legacy wrapper" % (label, json.dumps(wrapper), LEGACY_NAMESPACE)
        )
    reason = entry.get("reason")
    if not isinstance(reason, str) or not reason.strip():
        failures.append("%s: 'reason' must be a non-empty string" % label)
    added_wave = entry.get("added_wave")
    if added_wave not in ALLOWED_ADDED_WAVES:
        failures.append(
            "%s: 'added_wave' is %s; allowed values are %s"
            % (label, json.dumps(added_wave), ", ".join(ALLOWED_ADDED_WAVES))
        )
    source = entry.get("from")
    target = entry.get("to")
    if isinstance(source, str) and isinstance(target, str) and source and target:
        recomputed = classify(cluster_of(source), cluster_of(target))
        if entry.get("class") != recomputed:
            failures.append(
                "%s: 'class' is %s; the live classifier recomputes '%s'"
                % (label, json.dumps(entry.get("class")), recomputed)
            )
    waiver_pair = entry.get("waiver_pair")
    if waiver_pair is not None and not (
        isinstance(waiver_pair, list)
        and len(waiver_pair) == 2
        and all(isinstance(item, str) and item for item in waiver_pair)
    ):
        failures.append(
            "%s: 'waiver_pair' must be null or a [from, to] pair of non-empty "
            "strings" % label
        )
    return failures


def validate_legacy(document: dict, edges: list, waiver_pairs: set):
    """Match every live Legacy edge against exactly one manifest row.

    Returns `(listed, failures, retired_by_legacy)`:

      * `listed` -- `(edge, wrapper_module)` for every live Legacy edge that a
        manifest row covers, in scan order.  These never count as forbidden;
      * `failures` -- human-readable strings, any of which fails the lint;
      * `retired_by_legacy` -- `{(from, to): wrapper_module}` for the waiver
        rows that manifest rows claim to retire, handed to the waiver
        validator so a retired edge's stale waiver names its wrapper.

    Matching is on the whole triple `(wrapper_module, from, to)` and on nothing
    weaker.  A row is only ever consulted for the exact edge it names, so no
    row can widen into a prefix, a directory or a wildcard.
    """
    failures = []
    entries = document.get("exceptions")
    index_by_key = {}
    row_labels = {}
    duplicates = set()

    for index, entry in enumerate(entries):
        label = "legacy exception %d" % index
        if not isinstance(entry, dict):
            failures.append("%s: not an object" % label)
            continue
        wrapper = entry.get("wrapper_module")
        source = entry.get("from")
        target = entry.get("to")
        addressable = (
            isinstance(wrapper, str)
            and wrapper
            and isinstance(source, str)
            and source
            and isinstance(target, str)
            and target
        )
        if not addressable:
            failures.append(
                "%s: needs non-empty string 'wrapper_module', 'from' and 'to'"
                % label
            )
            continue
        label = "legacy exception %d (%s: %s -> %s)" % (
            index,
            wrapper,
            source,
            target,
        )
        row_labels[index] = label
        failures.extend(_legacy_row_failures(entry, label))
        key = (wrapper, source, target)
        if key in index_by_key:
            if key not in duplicates:
                duplicates.add(key)
                failures.append(
                    "%s: duplicate legacy exception row for this "
                    "(wrapper_module, from, to)" % label
                )
            continue
        index_by_key[key] = index

    listed = []
    matched_keys = set()
    for edge in edges:
        wrappers = legacy_endpoints(edge["from"], edge["to"])
        if not wrappers:
            continue
        hits = [
            (wrapper, index_by_key[(wrapper, edge["from"], edge["to"])])
            for wrapper in wrappers
            if (wrapper, edge["from"], edge["to"]) in index_by_key
        ]
        if not hits:
            failures.append(
                "unlisted Legacy edge %s -> %s at %s:%d"
                % (edge["from"], edge["to"], edge["from_file"], edge["line"])
            )
            continue
        if len(hits) > 1:
            failures.append(
                "Legacy edge %s -> %s at %s:%d matches %d legacy exception "
                "rows; exactly one row must cover an edge"
                % (
                    edge["from"],
                    edge["to"],
                    edge["from_file"],
                    edge["line"],
                    len(hits),
                )
            )
            continue
        wrapper, index = hits[0]
        matched_keys.add((wrapper, edge["from"], edge["to"]))
        listed.append((edge, wrapper))

    for key, index in sorted(index_by_key.items()):
        if key in matched_keys:
            continue
        failures.append(
            "%s: stale -- no such Legacy edge in the live tree; delete the row "
            "with the edge it covered" % row_labels[index]
        )

    retired_by_legacy = {}
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict) or index not in row_labels:
            continue
        waiver_pair = entry.get("waiver_pair")
        if waiver_pair is None:
            continue
        if not (
            isinstance(waiver_pair, list)
            and len(waiver_pair) == 2
            and all(isinstance(item, str) and item for item in waiver_pair)
        ):
            # Already reported by the field check; nothing to link.
            continue
        pair = (waiver_pair[0], waiver_pair[1])
        if pair not in waiver_pairs:
            failures.append(
                "%s: 'waiver_pair' %s names no row in import-waivers.json"
                % (row_labels[index], json.dumps(list(pair)))
            )
            continue
        retired_by_legacy.setdefault(pair, entry.get("wrapper_module"))

    return listed, failures, retired_by_legacy


# --------------------------------------------------------------------------
# Waivers
# --------------------------------------------------------------------------


def load_waiver_document(path: str) -> dict:
    with open(path, "r", encoding="utf-8") as handle:
        document = json.load(handle)
    if not isinstance(document, dict):
        raise ValueError("import-waivers.json: top level must be an object")
    return document


def counted(pairs) -> dict:
    """Count occurrences into a plain dict (no `collections` dependency)."""
    tally = {}
    for value in pairs:
        tally[value] = tally.get(value, 0) + 1
    return tally


def waiver_pairs_declared(document: dict) -> set:
    """Every `(from, to)` a waiver row names, before any authentication.

    Used only to resolve a Legacy manifest's `waiver_pair` cross-reference: the
    question there is whether the row exists at all, not whether it passes.
    """
    declared = set()
    entries = document.get("waivers")
    if not isinstance(entries, list):
        return declared
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        source = entry.get("from")
        target = entry.get("to")
        if isinstance(source, str) and isinstance(target, str) and source and target:
            declared.add((source, target))
    return declared


def validate_waivers(
    document: dict, frozen: dict, live_forbidden: set, retired_by_legacy=None
):
    """Authenticate every waiver row.

    Returns `(pairs, failures)`.  `pairs` is the set of `(from, to)` pairs the
    lint will honour -- only rows that authenticated.  `failures` is a list of
    human-readable strings; a non-empty list is a lint failure.

    Checks, in order of severity:
      * row shape: object with non-empty string `from`, `to`, `reason`;
      * `planned_retirement` drawn from ALLOWED_RETIREMENTS;
      * no duplicate `(from, to)` row;
      * the pair is recorded in the frozen graph (unauthenticated otherwise);
      * the frozen record classes it forbidden (a waiver for a permitted edge
        licenses nothing and is a bookkeeping error);
      * the edge is still live (a stale row must be deleted with its edge);
      * `.summary` counts equal the recomputed counts.

    `retired_by_legacy` maps a `(from, to)` pair to the Legacy wrapper module
    that a manifest row says retires it.  A stale row on such a pair reports
    the wrapper by name, because that is the actionable fact: the wrapper
    landed, so this waiver row must be deleted in the same commit.
    """
    if retired_by_legacy is None:
        retired_by_legacy = {}
    failures = []
    entries = document.get("waivers")
    if not isinstance(entries, list):
        raise ValueError("import-waivers.json: 'waivers' must be a list")

    pairs = set()
    seen = set()
    class_tally_input = []
    retirement_tally_input = []

    for index, entry in enumerate(entries):
        label = "waiver %d" % index
        if not isinstance(entry, dict):
            failures.append("%s: not an object" % label)
            continue
        source = entry.get("from")
        target = entry.get("to")
        if not isinstance(source, str) or not isinstance(target, str):
            failures.append("%s: needs string 'from' and 'to'" % label)
            continue
        if not source or not target:
            failures.append("%s: 'from' and 'to' must be non-empty" % label)
            continue
        label = "waiver %d (%s -> %s)" % (index, source, target)

        reason = entry.get("reason")
        if not isinstance(reason, str) or not reason.strip():
            failures.append("%s: 'reason' must be a non-empty string" % label)
        retirement = entry.get("planned_retirement")
        if retirement not in ALLOWED_RETIREMENTS:
            failures.append(
                "%s: 'planned_retirement' is %s; allowed values are %s"
                % (label, json.dumps(retirement), ", ".join(ALLOWED_RETIREMENTS))
            )
        else:
            retirement_tally_input.append(retirement)

        pair = (source, target)
        if pair in seen:
            failures.append("%s: duplicate waiver row for this pair" % label)
            continue
        seen.add(pair)

        frozen_class = frozen.get(pair)
        if frozen_class is None:
            failures.append(
                "%s: pair is NOT in the frozen graph record; a waiver may only "
                "cover an edge the Phase 0 freeze observed" % label
            )
            continue
        class_tally_input.append(frozen_class)
        if frozen_class not in FORBIDDEN_CLASSES:
            failures.append(
                "%s: frozen graph classes this edge '%s', which the rule permits; "
                "a waiver for a permitted edge licenses nothing" % (label, frozen_class)
            )
            continue
        if pair not in live_forbidden:
            wrapper = retired_by_legacy.get(pair)
            if wrapper is None:
                failures.append(
                    "%s: stale -- the edge is no longer present in the live tree; "
                    "delete the waiver row with the edge it covered" % label
                )
            else:
                failures.append(
                    "waiver %s -> %s is stale: edge retired through Legacy "
                    "wrapper %s" % (source, target, wrapper)
                )
            continue
        pairs.add(pair)

    recomputed = {
        "waivers": len(entries),
        "by_class": counted(class_tally_input),
        "by_planned_retirement": counted(retirement_tally_input),
    }
    summary = document.get("summary")
    if not isinstance(summary, dict):
        failures.append("summary: missing or not an object")
    else:
        for key in ("waivers", "by_class", "by_planned_retirement"):
            recorded = summary.get(key)
            if recorded != recomputed[key]:
                failures.append(
                    "summary.%s: recorded %s, recomputed %s"
                    % (
                        key,
                        json.dumps(recorded, sort_keys=True),
                        json.dumps(recomputed[key], sort_keys=True),
                    )
                )
    return pairs, failures


# --------------------------------------------------------------------------
# Dated current graph record
# --------------------------------------------------------------------------

LIVE_RECORD_NOTE = (
    "dated current graph; the Phase 0 file remains the waiver authentication "
    "basis"
)


def current_head() -> str:
    """Full commit id of `REPO_ROOT`'s HEAD, or `unknown` if git cannot say.

    A module-level function on purpose: it is the one non-deterministic input
    to `--write-record`, so a test can replace it and compare bytes.
    """
    try:
        completed = subprocess.run(
            ["git", "-C", REPO_ROOT, "rev-parse", "HEAD"],
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            check=False,
        )
    except OSError:
        return "unknown"
    if completed.returncode != 0:
        return "unknown"
    value = completed.stdout.decode("utf-8", "replace").strip()
    return value if value else "unknown"


def live_record_document(edges: list, files: list) -> dict:
    """The dated current-graph record, in the frozen record's schema.

    Row shape and sort order are the frozen record's: `collect_edges` already
    sorts by `(from, to, line)`, and `json.dump(..., sort_keys=True)` orders
    the keys inside each row.  Nothing here reads a previous record, so the
    output is a function of the live tree and HEAD alone.
    """
    by_class = counted(edge["class"] for edge in edges)
    by_cluster = counted(cluster_of(module_name(path)) for path in files)
    forbidden = [edge for edge in edges if edge["class"] in FORBIDDEN_CLASSES]
    legacy = [
        edge for edge in edges if legacy_endpoints(edge["from"], edge["to"])
    ]
    return {
        "schema": GRAPH_SCHEMA,
        "generated_by": "scripts/lint_cluster_imports.py (--write-record)",
        "generated_from_head": current_head(),
        "live_record": True,
        "note": LIVE_RECORD_NOTE,
        "scope": {
            "lean_files_scanned": len(files),
            "namespace": CLUSTER_NAMESPACE,
            "parent_coordinator": "lean/Erdos9796Proof/P97/ATail/"
            "FrontierLiveClosure.lean",
            "recorded_edges": "only imports whose target is itself under "
            + CLUSTER_NAMESPACE,
            "recursive": True,
            "source_dir": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/",
        },
        "summary": {
            "distinct_forbidden_module_pairs": len(
                {(edge["from"], edge["to"]) for edge in forbidden}
            ),
            "edges_by_class": by_class,
            "files_by_cluster": by_cluster,
            "forbidden_edges": len(forbidden),
            "lean_files_scanned": len(files),
            "legacy_edges": len(legacy),
            "total_edges": len(edges),
        },
        "edges": edges,
    }


def write_live_record(path: str) -> int:
    """Generator mode for `--write-record`.  Deterministic bytes."""
    if not os.path.isdir(CLUSTER_DIR):
        sys.stderr.write("lint_cluster_imports: missing tree %s\n" % CLUSTER_DIR)
        return 2
    try:
        files = source_files()
        edges = collect_edges()
    except (OSError, HeaderParseError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2
    document = live_record_document(edges, files)
    try:
        with open(path, "w", encoding="utf-8") as handle:
            handle.write(json.dumps(document, indent=2, sort_keys=True) + "\n")
    except OSError as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2
    sys.stdout.write(
        "lint_cluster_imports: wrote %s -- %d edges from HEAD %s\n"
        % (path, len(edges), document["generated_from_head"])
    )
    return 0


# --------------------------------------------------------------------------
# Entry point
# --------------------------------------------------------------------------


def scan_one_file(path: str) -> int:
    """Diagnostic: print the header imports of a single file and classify them.

    Used to exercise the parser on a file outside the cluster tree (the lint
    itself walks the tree only).  For a file under `lean/` the module name is
    the real one; otherwise the basename stands in, which is enough because
    cluster classification reads the final dotted component only.
    """
    if not os.path.isfile(path):
        sys.stderr.write("lint_cluster_imports: no such file %s\n" % path)
        return 2
    absolute = os.path.abspath(path)
    if absolute.startswith(LEAN_ROOT + os.sep):
        source_module = module_name(absolute)
    else:
        source_module = os.path.basename(absolute)
        if source_module.endswith(".lean"):
            source_module = source_module[: -len(".lean")]
    try:
        imports = header_imports(absolute)
    except (OSError, HeaderParseError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2
    sys.stdout.write(
        "scan-file %s\n  module %s  [cluster %s]\n  header imports: %d\n"
        % (path, source_module, cluster_of(source_module), len(imports))
    )
    for number, target in imports:
        in_tree = in_cluster_tree(target)
        edge = edge_record(source_module, target, path, number)
        sys.stdout.write(
            "  line %d: import %s  [%s -> %s, %s]%s\n"
            % (
                number,
                target,
                edge["from_cluster"],
                edge["to_cluster"],
                edge["class"],
                "" if in_tree else "  (outside cluster tree; not an edge)",
            )
        )
    return 0


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description="Fail on non-waived cross-cluster imports in "
        "Erdos9796Proof/P97/ATail/FrontierLiveClosure."
    )
    parser.add_argument(
        "--waivers",
        default=WAIVER_FILE,
        help="path to import-waivers.json (default: proof-status/import-waivers.json)",
    )
    parser.add_argument(
        "--graph",
        default=GRAPH_FILE,
        help="path to the frozen graph record used to authenticate waivers "
        "(default: proof-status/cluster-import-edges.json)",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="emit the violation report as JSON on stdout",
    )
    parser.add_argument(
        "--legacy-exceptions",
        default=None,
        help="path to legacy-import-exceptions.json "
        "(default: proof-status/legacy-import-exceptions.json)",
    )
    parser.add_argument(
        "--list-waived",
        action="store_true",
        help="also list the forbidden edges that a waiver currently covers",
    )
    parser.add_argument(
        "--list-legacy",
        action="store_true",
        help="print the live Legacy-wrapper edges under a count header "
        "(they are printed on every run either way)",
    )
    parser.add_argument(
        "--fail-on-legacy",
        action="store_true",
        help="fail on any Legacy edge, listed or not -- the check the wave that "
        "empties the waiver file runs",
    )
    parser.add_argument(
        "--stale-waivers",
        action="store_true",
        help="retained for compatibility; stale waivers are now always a failure",
    )
    parser.add_argument(
        "--scan-file",
        default=None,
        help="diagnostic: print the module-header imports of one file and exit",
    )
    parser.add_argument(
        "--write-record",
        default=None,
        help="write the dated current graph to PATH and exit; never read back "
        "for authentication",
    )
    arguments = parser.parse_args(argv)

    if arguments.scan_file is not None:
        return scan_one_file(arguments.scan_file)

    if arguments.write_record is not None:
        return write_live_record(arguments.write_record)

    legacy_path = arguments.legacy_exceptions
    if legacy_path is None:
        legacy_path = LEGACY_FILE

    if not os.path.isdir(CLUSTER_DIR):
        sys.stderr.write("lint_cluster_imports: missing tree %s\n" % CLUSTER_DIR)
        return 2
    try:
        frozen = load_frozen_edges(arguments.graph)
        document = load_waiver_document(arguments.waivers)
        legacy_document = load_legacy_document(legacy_path, arguments.graph)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2

    try:
        edges = collect_edges()
    except (OSError, HeaderParseError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2

    # A Legacy edge is governed by the Legacy manifest, not by the waiver file,
    # so it is taken out of the forbidden set before waivers are considered.
    # That is not a loophole: an unlisted Legacy edge fails through
    # `validate_legacy` instead, and `--fail-on-legacy` rejects every one of
    # them.  Classification itself is untouched -- the edge keeps its class.
    legacy_live = [
        edge for edge in edges if legacy_endpoints(edge["from"], edge["to"])
    ]
    forbidden = [
        edge
        for edge in edges
        if edge["class"] in FORBIDDEN_CLASSES
        and not legacy_endpoints(edge["from"], edge["to"])
    ]
    live_forbidden = {(edge["from"], edge["to"]) for edge in forbidden}

    listed_legacy, legacy_failures, retired_by_legacy = validate_legacy(
        legacy_document, edges, waiver_pairs_declared(document)
    )

    try:
        waived, waiver_failures = validate_waivers(
            document, frozen, live_forbidden, retired_by_legacy
        )
    except (ValueError, json.JSONDecodeError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2

    graph_failures = frozen_class_disagreements(frozen, edges)

    violations = [edge for edge in forbidden if (edge["from"], edge["to"]) not in waived]
    covered = [edge for edge in forbidden if (edge["from"], edge["to"]) in waived]

    if arguments.fail_on_legacy and legacy_live:
        legacy_failures = list(legacy_failures)
        for edge in legacy_live:
            legacy_failures.append(
                "--fail-on-legacy: Legacy edge %s -> %s at %s:%d"
                % (edge["from"], edge["to"], edge["from_file"], edge["line"])
            )

    failed = bool(violations or waiver_failures or legacy_failures or graph_failures)

    if arguments.json:
        report = {
            "edges_scanned": len(edges),
            "forbidden_edges": len(forbidden),
            "waivers_authenticated": len(waived),
            "waived_edges": len(covered),
            "legacy_edges": len(legacy_live),
            "legacy_edges_listed": len(listed_legacy),
            "legacy": [
                {
                    "class": edge["class"],
                    "from": edge["from"],
                    "from_file": edge["from_file"],
                    "line": edge["line"],
                    "to": edge["to"],
                    "wrapper_module": wrapper,
                }
                for edge, wrapper in listed_legacy
            ],
            "violations": violations,
            "waiver_failures": waiver_failures,
            "legacy_failures": legacy_failures,
            "graph_failures": graph_failures,
        }
        sys.stdout.write(json.dumps(report, indent=2, sort_keys=True) + "\n")
        return 1 if failed else 0

    if arguments.list_legacy:
        sys.stdout.write("legacy edges (%d):\n" % len(listed_legacy))
    for edge, wrapper in listed_legacy:
        sys.stdout.write(
            "legacy %s -> %s (%s) %s:%d wrapper=%s\n"
            % (
                edge["from"],
                edge["to"],
                edge["class"],
                edge["from_file"],
                edge["line"],
                wrapper,
            )
        )

    if arguments.list_waived:
        sys.stdout.write("waived forbidden edges (%d):\n" % len(covered))
        for edge in covered:
            sys.stdout.write(
                "  %s:%d  %s -> %s  [%s -> %s]\n"
                % (
                    edge["from_file"],
                    edge["line"],
                    edge["from"],
                    edge["to"],
                    edge["from_cluster"],
                    edge["to_cluster"],
                )
            )

    waiver_label = os.path.abspath(arguments.waivers)
    if waiver_label.startswith(REPO_ROOT + os.sep):
        waiver_label = os.path.relpath(waiver_label, REPO_ROOT)

    legacy_label = os.path.abspath(legacy_path)
    if legacy_label.startswith(REPO_ROOT + os.sep):
        legacy_label = os.path.relpath(legacy_label, REPO_ROOT)

    if graph_failures:
        sys.stderr.write(
            "lint_cluster_imports: FAIL -- %d frozen graph row%s the live tree "
            "classifies differently\n"
            % (len(graph_failures), "" if len(graph_failures) == 1 else "s")
        )
        for failure in graph_failures:
            sys.stderr.write("  %s\n" % failure)

    if legacy_failures:
        sys.stderr.write(
            "lint_cluster_imports: FAIL -- %d Legacy-exception problem%s "
            "against %s\n"
            % (
                len(legacy_failures),
                "" if len(legacy_failures) == 1 else "s",
                legacy_label,
            )
        )
        for failure in legacy_failures:
            sys.stderr.write("  %s\n" % failure)

    if waiver_failures:
        sys.stderr.write(
            "lint_cluster_imports: FAIL -- %d waiver problem%s in %s\n"
            % (
                len(waiver_failures),
                "" if len(waiver_failures) == 1 else "s",
                waiver_label,
            )
        )
        for failure in waiver_failures:
            sys.stderr.write("  %s\n" % failure)

    if violations:
        sys.stderr.write(
            "lint_cluster_imports: FAIL -- %d non-waived forbidden import edge%s\n"
            % (len(violations), "" if len(violations) == 1 else "s")
        )
        for edge in violations:
            sys.stderr.write(
                "  %s:%d: import %s  (%s -> %s, %s)\n"
                % (
                    edge["from_file"],
                    edge["line"],
                    edge["to"],
                    edge["from_cluster"],
                    edge["to_cluster"],
                    edge["class"],
                )
            )
        sys.stderr.write(
            "Add a waiver to %s with a planned retirement wave, or remove the import.\n"
            % waiver_label
        )

    if failed:
        return 1

    sys.stdout.write(
        "lint_cluster_imports: OK -- %d import edges scanned, %d forbidden edges, "
        "all waived by %d authenticated waiver%s; %d legacy edge%s, all listed.\n"
        % (
            len(edges),
            len(forbidden),
            len(waived),
            "" if len(waived) == 1 else "s",
            len(legacy_live),
            "" if len(legacy_live) == 1 else "s",
        )
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
