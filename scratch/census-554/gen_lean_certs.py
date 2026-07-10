#!/usr/bin/env python3
"""census-554 certificate -> Lean module generator (closure plan A.2.2).

Reads census554_pattern_certificate.v1 JSON files and emits one Lean module
per certificate under lean/Erdos9796Proof/P97/Census554/Bank/PatNNNNN.lean
(namespace Problem97.Census554.Bank), each proving `IsDead patNNNNN` via
`isDead_of_checkCert` + `native_decide`.

Per-cert validation, all in exact Fraction arithmetic, BEFORE emission:

  1. structural: schema tag, variable-name shapes (x{p}{x,y} with 2<=p<=10,
     t{j} with j < len(rab_pairs), every t{j} present), matching
     generators/tags/coefficients lengths, kill/rab_pairs consistency.
  2. round-trip: every polynomial string is parsed with the hand-written
     tokenizer below and re-rendered through census554_lib.poly_str (in the
     cert's own variable list).
       * generator strings were produced BY poly_str (miner.certify_pattern),
         so exact string equality is REQUIRED for them;
       * coefficient strings are verbatim Singular `lift` output whose term
         order and fraction/-1 rendering differ from poly_str ("5/4" vs
         "(5/4)", "-x" vs "-1*x", degrevlex vs sorted-monomial order), so
         exact equality is structurally impossible for them.  For
         coefficients we REQUIRE semantic round-trip instead
         (parse(poly_str(parse(s))) == parse(s)) and REPORT the exact-string
         status.  This is a documented convention mismatch, not a data bug.
  3. tag fidelity: generators are RE-DERIVED from pattern + generator_tags
     ([c,a,b] -> d2(c,a)-d2(c,b) via census554_lib.d2poly, gauge built into
     coord; ["rab",a,b] -> t_j*d2(a,b)-1 with t_j at flat index 18+j, j the
     pair's position in rab_pairs) and must equal the parsed generator
     strings exactly, in the FULL flat variable indexing
     (x{p}x -> 2*(p-2), x{p}y -> 2*(p-2)+1, t{j} -> 18+j).
  4. Lean-side tag validity preconditions: eq c a b needs a,b in pattern[c];
     rab j a b needs rab_pairs[j] == [a,b] and a != b (mirrors
     CertTag.valid so native_decide cannot fail on validity).
  5. exact Nullstellensatz identity: sum_i coeff_i * gen_i == 1 with
     census554_lib.padd/pmul over the re-derived generators.

Any cert failing 1/3/4/5, a generator exact round-trip, or a coefficient
semantic round-trip is SKIPPED with a loud report and never emitted.

Usage (from scratch/census-554):
  uv run python gen_lean_certs.py [--out-dir DIR] [--batch-name NAME] \
      certs/pat_00966.json certs/pat_00568.json ...
  uv run python gen_lean_certs.py --list probe.txt

--batch-name NAME emits ALL given certs into the single module Bank/NAME.lean
instead of one module per cert (used for build-cost batching probes).
"""

import argparse
import json
import os
import sys
from fractions import Fraction

sys.setrecursionlimit(10000)
# Singular lift cofactors can have huge integer coefficients.
if hasattr(sys, "set_int_max_str_digits"):
    sys.set_int_max_str_digits(2000000000)

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import census554_lib as L  # noqa: E402

REPO = os.path.dirname(os.path.dirname(HERE))
DEFAULT_OUT = os.path.join(REPO, "lean", "Erdos9796Proof", "P97",
                           "Census554", "Bank")
N_LABELS = 11
N_COORD_VARS = 2 * (N_LABELS - 2)  # 18


# ---------------- hand-written polynomial string tokenizer ----------------

def _split_terms(s):
    """Split a polynomial string into signed terms at top-level +/-."""
    terms, cur, depth = [], "", 0
    for ch in s:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth < 0:
                raise ValueError("unbalanced ')'")
        if ch in "+-" and depth == 0 and cur and cur[-1] not in "+-*/^(":
            terms.append(cur)
            cur = ch
        else:
            cur += ch
    if depth != 0:
        raise ValueError("unbalanced '('")
    terms.append(cur)
    return terms


def _split_factors(t):
    """Split a term into factors at top-level '*'."""
    factors, cur, depth = [], "", 0
    for ch in t:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "*" and depth == 0:
            factors.append(cur)
            cur = ""
        else:
            cur += ch
    factors.append(cur)
    return factors


def _parse_fraction(text):
    """Parse 'num', 'num/den', with optional leading '-' (no regex)."""
    if not text:
        raise ValueError("empty numeric factor")
    num, den = text, "1"
    if "/" in text:
        num, den = text.split("/", 1)
    for part in (num.lstrip("+-"), den):
        if not part or not all(c.isdigit() for c in part):
            raise ValueError(f"bad numeric factor {text!r}")
    return Fraction(int(num), int(den))


def parse_poly(s, name_to_idx):
    """Parse a poly_str- or Singular-rendered polynomial string into an
    L-Poly {monomial tuple -> Fraction} over the given variable indexing."""
    s = s.strip().replace(" ", "")
    if s in ("", "0"):
        return {}
    poly = {}
    for term in _split_terms(s):
        sign = Fraction(1)
        while term and term[0] in "+-":
            if term[0] == "-":
                sign = -sign
            term = term[1:]
        if not term:
            raise ValueError("empty term")
        coeff = sign
        monom = {}
        for f in _split_factors(term):
            if not f:
                raise ValueError("empty factor")
            if f[0] == "(":
                if f[-1] != ")":
                    raise ValueError(f"bad parenthesized factor {f!r}")
                coeff *= _parse_fraction(f[1:-1])
            elif f[0].isdigit():
                coeff *= _parse_fraction(f)
            else:
                if "^" in f:
                    v, e = f.split("^", 1)
                    if not (e and all(c.isdigit() for c in e)):
                        raise ValueError(f"bad exponent in {f!r}")
                    e = int(e)
                else:
                    v, e = f, 1
                if v not in name_to_idx:
                    raise ValueError(f"unknown variable {v!r}")
                monom[name_to_idx[v]] = monom.get(name_to_idx[v], 0) + e
        key = tuple(sorted(monom.items()))
        c = poly.get(key, Fraction(0)) + coeff
        if c:
            poly[key] = c
        else:
            poly.pop(key, None)
    return poly


# ---------------- variable conventions ----------------

def full_index(name):
    """Flat Lean-side variable index: x{p}x -> 2(p-2), x{p}y -> 2(p-2)+1,
    t{j} -> 18+j.  Raises on anything else."""
    if (len(name) >= 3 and name[0] == "x" and name[-1] in "xy"
            and name[1:-1].isdigit()):
        p = int(name[1:-1])
        if not 2 <= p < N_LABELS:
            raise ValueError(f"variable {name!r}: label out of range")
        return 2 * (p - 2) + (0 if name[-1] == "x" else 1)
    if len(name) >= 2 and name[0] == "t" and name[1:].isdigit():
        return N_COORD_VARS + int(name[1:])
    raise ValueError(f"unrecognized variable name {name!r}")


def derive_generator(tag, rab_pairs):
    """Re-derive a generator L-Poly (FULL indexing) from its tag."""
    if tag[0] == "rab":
        _, a, b = tag
        j = rab_pairs.index([a, b])
        t = {((N_COORD_VARS + j, 1),): Fraction(1)}
        return L.padd(L.pmul(t, L.d2poly(a, b)), {(): Fraction(-1)})
    c, a, b = tag
    return L.psub(L.d2poly(c, a), L.d2poly(c, b))


# ---------------- validation ----------------

class CertFailure(Exception):
    pass


def validate_cert(cert, pid):
    """Run checks 1-5; return (pattern, rab_pairs, tags, coeff_polys, stats)
    with coeff_polys in FULL indexing.  Raises CertFailure."""
    def fail(msg):
        raise CertFailure(f"{pid}: {msg}")

    if cert.get("schema") != "census554_pattern_certificate.v1":
        fail(f"bad schema {cert.get('schema')!r}")
    names = cert["variables"]
    gens_s = cert["generators"]
    tags = cert["generator_tags"]
    coeffs_s = cert["coefficients"]
    rab_pairs = cert["rab_pairs"]
    kill = cert["kill"]
    pattern = {int(c): sorted(m) for c, m in cert["pattern"].items()}

    # 1. structural
    if not (len(gens_s) == len(tags) == len(coeffs_s)):
        fail(f"length mismatch gens={len(gens_s)} tags={len(tags)} "
             f"coeffs={len(coeffs_s)}")
    if kill == "base":
        if rab_pairs:
            fail("base kill with rab_pairs")
    elif kill.startswith("pair:"):
        a, b = kill[5:].split("-")
        if rab_pairs != [[int(a), int(b)]]:
            fail(f"pair kill {kill} but rab_pairs={rab_pairs}")
    elif kill == "multi_pair":
        if len(rab_pairs) < 2:
            fail(f"multi_pair kill with rab_pairs={rab_pairs}")
    else:
        fail(f"unknown kill {kill!r}")
    for c, m in pattern.items():
        if not (0 <= c < N_LABELS and len(m) >= 2 and c not in m
                and all(0 <= x < N_LABELS for x in m)):
            fail(f"bad pattern entry {c}: {m}")
    n2full = {}
    for n in names:
        n2full[n] = full_index(n)  # raises on bad shape
    tnames_expected = {f"t{j}" for j in range(len(rab_pairs))}
    tnames_seen = {n for n in names if n[0] == "t"}
    if tnames_seen != tnames_expected:
        fail(f"t-variable set {sorted(tnames_seen)} != expected "
             f"{sorted(tnames_expected)}")
    if len(set(n2full.values())) != len(names):
        fail("duplicate variable indices")
    n2cert = {n: k for k, n in enumerate(names)}
    full2cert = {n2full[n]: n2cert[n] for n in names}

    def to_cert_idx(p):
        return {tuple(sorted((full2cert[i], e) for i, e in m)): c
                for m, c in p.items()}

    # 2. round-trip through census554_lib.poly_str
    stats = {"gen_exact": 0, "coeff_exact": 0, "coeff_semantic_only": 0}
    parsed_gens, parsed_coeffs = [], []
    for kind, strs, sink in (("generator", gens_s, parsed_gens),
                             ("coefficient", coeffs_s, parsed_coeffs)):
        for i, s in enumerate(strs):
            p = parse_poly(s, n2full)
            sink.append(p)
            rendered = L.poly_str(to_cert_idx(p), varnames=names)
            if rendered == s:
                stats["gen_exact" if kind == "generator"
                      else "coeff_exact"] += 1
                continue
            if kind == "generator":
                fail(f"generator {i} exact round-trip FAILED:\n"
                     f"  input:      {s}\n  re-rendered: {rendered}")
            # coefficient: Singular-rendered; require semantic round-trip
            if parse_poly(rendered, n2cert) != to_cert_idx(p):
                fail(f"coefficient {i} SEMANTIC round-trip failed")
            stats["coeff_semantic_only"] += 1

    # 3. tag fidelity: re-derived generators == parsed generator strings
    for i, (tag, p) in enumerate(zip(tags, parsed_gens)):
        if tag[0] == "rab":
            if list(tag[1:]) not in rab_pairs:
                fail(f"rab tag {i} pair {tag[1:]} not in rab_pairs")
        derived = derive_generator(tag, rab_pairs)
        if derived != p:
            fail(f"tag {i} {tag}: re-derived generator != cert generator")

    # 4. Lean CertTag.valid preconditions
    seen_pairs = []
    for i, tag in enumerate(tags):
        if tag[0] == "rab":
            _, a, b = tag
            j = rab_pairs.index([a, b])
            if rab_pairs[j] != [a, b] or a == b:
                fail(f"rab tag {i} invalid")
            seen_pairs.append([a, b])
        else:
            c, a, b = tag
            if c not in pattern or a not in pattern[c] or b not in pattern[c]:
                fail(f"eq tag {i} ({c},{a},{b}) not within pattern mask")
    for pr in rab_pairs:
        if pr not in seen_pairs:
            fail(f"rab pair {pr} has no generator tag")
    if len(rab_pairs) != len(set(map(tuple, rab_pairs))):
        fail("duplicate rab pairs")

    # 5. exact Nullstellensatz identity over RE-DERIVED generators
    acc = {}
    for tag, cp in zip(tags, parsed_coeffs):
        acc = L.padd(acc, L.pmul(cp, derive_generator(tag, rab_pairs)))
    if acc != {(): Fraction(1)}:
        fail("exact identity sum coeff_i*gen_i != 1")

    return pattern, rab_pairs, tags, parsed_coeffs, stats


# ---------------- Lean emission ----------------

def q_lit(c):
    """Lean ℚ literal for a Fraction."""
    return str(c.numerator) if c.denominator == 1 else \
        f"{c.numerator}/{c.denominator}"


# A single Lean list literal must stay small: elaboration of long literals
# is super-linear (a ~5000-term SPoly literal ran 524 s at maxHeartbeats 0
# and then died at maxRecDepth from List.cons nesting).  Large polynomials
# are emitted as <=CHUNK_TERMS-term chunk defs combined by `++` with
# APPEND_FANOUT-bounded grouping defs.
CHUNK_TERMS = 128
APPEND_FANOUT = 64


def term_lits(p):
    """Lean term literals of an L-Poly, in sorted monomial order."""
    out = []
    for m, c in sorted(p.items()):
        mon = "[" + ", ".join(f"({i}, {e})" for i, e in m) + "]"
        out.append(f"({mon}, {q_lit(c)})")
    return out


def spoly_lit(terms):
    """Lean SPoly literal from rendered term literals."""
    if not terms:
        return "[]"
    return "[" + ",\n      ".join(_wrap(terms, 84)) + "]"


def emit_spoly(w, name, p, what):
    """Emit `def name : SPoly := ...`, chunking large polynomials into
    <=CHUNK_TERMS-term literal defs combined by `++`.  Returns nothing."""
    terms = term_lits(p)
    if len(terms) <= CHUNK_TERMS:
        w(f"/-- {what}. -/\n")
        w(f"def {name} : SPoly :=\n  {spoly_lit(terms)}\n\n")
        return
    parts = []
    for k in range(0, len(terms), CHUNK_TERMS):
        pname = f"{name}_{len(parts)}"
        w(f"/-- {what}, chunk {len(parts)}. -/\n")
        w(f"def {pname} : SPoly :=\n  {spoly_lit(terms[k:k + CHUNK_TERMS])}"
          "\n\n")
        parts.append(pname)
    level = 0
    while len(parts) > APPEND_FANOUT:
        nxt = []
        for k in range(0, len(parts), APPEND_FANOUT):
            gname = f"{name}_g{level}_{len(nxt)}"
            w(f"/-- {what}, chunk group. -/\n")
            w(f"def {gname} : SPoly :=\n"
              f"  {_wrap_append(parts[k:k + APPEND_FANOUT])}\n\n")
            nxt.append(gname)
        parts = nxt
        level += 1
    w(f"/-- {what}. -/\n")
    w(f"def {name} : SPoly :=\n  {_wrap_append(parts)}\n\n")


def _wrap_append(parts, width=80):
    """Render `p0 ++ p1 ++ ...` wrapped to continuation lines."""
    lines, cur = [], ""
    for p in parts:
        cand = p if not cur else cur + " ++ " + p
        if cur and len(cand) > width:
            lines.append(cur + " ++")
            cur = p
        else:
            cur = cand
    lines.append(cur)
    return "\n    ".join(lines)


def _wrap(items, width):
    """Group comma-joined items into lines of at most `width` chars."""
    lines, cur = [], ""
    for it in items:
        cand = it if not cur else cur + ", " + it
        if cur and len(cand) > width:
            lines.append(cur)
            cur = it
        else:
            cur = cand
    if cur:
        lines.append(cur)
    return lines


def tag_lit(tag):
    if tag[0] == "rab":
        return None  # caller supplies j
    c, a, b = tag
    return f".eq {c} {a} {b}"


def emit_defs(out, stem, pattern, rab_pairs, tags, coeff_polys, pid, kill):
    """Write the pattern/tags/coeffs defs + theorem for one cert."""
    w = out.write
    w(f"/-- Pattern of banked certificate `{pid}` (kill: {kill}). -/\n")
    w(f"def pat{stem} : Pattern := fun c =>\n")
    first = True
    for c in sorted(pattern):
        kw = "if" if first else "else if"
        first = False
        mask = ", ".join(str(x) for x in sorted(pattern[c]))
        w(f"  {kw} c = {c} then {{{mask}}}\n")
    w("  else ∅\n\n")

    w(f"/-- Rabinowitsch pairs of `{pid}`, in certificate order. -/\n")
    w(f"def rabPairs{stem} : List (Fin 11 × Fin 11) :=\n")
    prs = ", ".join(f"({a}, {b})" for a, b in rab_pairs)
    w(f"  [{prs}]\n\n")

    w(f"/-- Generator tags of `{pid}`, in bank order. -/\n")
    w(f"def tags{stem} : List CertTag :=\n")
    tag_strs = []
    for tag in tags:
        if tag[0] == "rab":
            _, a, b = tag
            j = rab_pairs.index([a, b])
            tag_strs.append(f".rab {j} {a} {b}")
        else:
            c, a, b = tag
            tag_strs.append(f".eq {c} {a} {b}")
    w("  [" + ",\n   ".join(_wrap(tag_strs, 84)) + "]\n\n")

    names = []
    for i, p in enumerate(coeff_polys):
        cname = f"coeffs{stem}_c{i}"
        emit_spoly(w, cname, p, f"Coefficient {i} of `{pid}`")
        names.append(cname)
    w(f"/-- Coefficient polynomials of `{pid}`, in bank order "
      "(flat variable\nindices `x{p}x = 2(p-2)`, `x{p}y = 2(p-2)+1`, "
      "`t{j} = 18+j`). -/\n")
    w(f"def coeffs{stem} : List SPoly :=\n")
    w("  [" + ",\n   ".join(_wrap(names, 84)) + "]\n\n")

    w(f"/-- Certificate replay: pattern `{pid}` is dead. -/\n")
    w(f"theorem isDead_pat{stem} : IsDead pat{stem} :=\n")
    w(f"  isDead_of_checkCert pat{stem} rabPairs{stem} tags{stem} "
      f"coeffs{stem}\n    (by native_decide)\n")


HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.CertCheck

/-!
# Census-554 bank certificate replay: {title}

Auto-generated by `scratch/census-554/gen_lean_certs.py` from
{sources}.
Schema `census554_pattern_certificate.v1`.  Do not edit by hand.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false
-- Large certificates need headroom over the default 200000-heartbeat
-- budget even with chunked coefficient defs.
set_option maxHeartbeats 1000000

namespace Problem97
namespace Census554
namespace Bank

"""

FOOTER = """
end Bank
end Census554
end Problem97
"""


def emit_module(path, records, title, batch_ns=None):
    """batch_ns: extra namespace under Bank for batch modules, so a batch
    and the individual per-pattern modules can never export the same global
    names (audit 2026-07-09 P1: PatBatchProbe vs Pat02213 duplicate
    declarations broke proof-blueprint resync)."""
    sources = ",\n".join(f"`scratch/census-554/certs/{r['pid']}.json`"
                         for r in records)
    with open(path, "w") as out:
        out.write(HEADER.format(title=title, sources=sources))
        if batch_ns:
            out.write(f"namespace {batch_ns}\n\n")
        for k, r in enumerate(records):
            if k:
                out.write("\n")
            emit_defs(out, r["stem"], r["pattern"], r["rab_pairs"],
                      r["tags"], r["coeffs"], r["pid"], r["kill"])
        if batch_ns:
            out.write(f"\nend {batch_ns}")
        out.write(FOOTER)


def lean_namespace_of(name):
    """Sanitize a batch name into a Lean namespace ident (alnum only,
    leading uppercase)."""
    s = "".join(ch for ch in name if ch.isalnum())
    if not s or not s[0].isalpha():
        raise ValueError(f"batch name {name!r} does not yield a Lean ident")
    return s[0].upper() + s[1:]


# ---------------- driver ----------------

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("certs", nargs="*", help="cert JSON paths")
    ap.add_argument("--list", help="file with one cert path per line")
    ap.add_argument("--out-dir", default=DEFAULT_OUT)
    ap.add_argument("--batch-name",
                    help="emit all certs into single module Bank/<NAME>.lean")
    args = ap.parse_args()
    paths = list(args.certs)
    if args.list:
        with open(args.list) as f:
            paths += [ln.strip() for ln in f if ln.strip()]
    if not paths:
        ap.error("no certs given")
    os.makedirs(args.out_dir, exist_ok=True)

    ok_records, skipped = [], []
    for path in paths:
        with open(path) as f:
            cert = json.load(f)
        pid = cert.get("pid") or os.path.splitext(os.path.basename(path))[0]
        try:
            pattern, rab_pairs, tags, coeffs, stats = validate_cert(cert, pid)
        except (CertFailure, ValueError, KeyError) as e:
            skipped.append((pid, str(e)))
            print(f"SKIP  {pid}: VALIDATION FAILED — {e}", flush=True)
            continue
        stem = pid[len("pat_"):] if pid.startswith("pat_") else pid
        ok_records.append({
            "pid": pid, "stem": stem, "pattern": pattern,
            "rab_pairs": rab_pairs, "tags": tags, "coeffs": coeffs,
            "kill": cert["kill"], "stats": stats,
        })
        ce, cs = stats["coeff_exact"], stats["coeff_semantic_only"]
        print(f"OK    {pid}: kill={cert['kill']} gens={len(tags)} "
              f"(all exact round-trip) coeffs={ce + cs} "
              f"(exact={ce}, semantic-only={cs}) identity=1 EXACT",
              flush=True)

    emitted = []
    if args.batch_name:
        ns = lean_namespace_of(args.batch_name)
        path = os.path.join(args.out_dir, f"{ns}.lean")
        emit_module(path, ok_records, f"batch `{args.batch_name}`",
                    batch_ns=ns)
        emitted.append(path)
    else:
        for r in ok_records:
            path = os.path.join(args.out_dir, f"Pat{r['stem']}.lean")
            emit_module(path, [r], f"`{r['pid']}`")
            emitted.append(path)
    for p in emitted:
        print(f"WROTE {p}", flush=True)

    tot_semantic = sum(r["stats"]["coeff_semantic_only"] for r in ok_records)
    if tot_semantic:
        print(f"\nNOTE: {tot_semantic} coefficient strings passed only the "
              "SEMANTIC round-trip (they are verbatim Singular lift output, "
              "not poly_str-rendered; exact string equality with poly_str is "
              "structurally impossible for that format).", flush=True)
    if skipped:
        print(f"\n{'=' * 60}\nSKIPPED {len(skipped)} CERT(S):", flush=True)
        for pid, msg in skipped:
            print(f"  {pid}: {msg}", flush=True)
        sys.exit(1)


if __name__ == "__main__":
    main()
