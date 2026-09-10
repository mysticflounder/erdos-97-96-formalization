# Skeptic audit: finite-nine single-apex exhaustion

Target: `submissions/finite-nine-child-single-apex-exhaustion/`.

The generator pins the complete authenticated 176,077-byte fragment and retains the
support declarations needed by the final N8k theorem. It preserves the
1,600,000-heartbeat declaration scope on `N8k_single_apex_false`. It replaces eight
reachable private circle-placement calls with the public accepted predecessor; the
authenticated source contains eight calls, correcting the earlier seven-call count.

The generated source contains no proof placeholder, named axiom, native/compiler
trust primitive, unsafe or partial declaration, external implementation, or import of
a solution module. The offline transitive axiom closure is
`[propext, sorryAx, Classical.choice, Quot.sound]`; its `sorryAx` comes from
statement-only public theorem mirrors in the accepted dependency and shared support
frontier, rather than generated source text.

Reuse preflight at indexed revision `4ccf89c09` found the exact
`N8k_capInterior_false_of_hasNEquidistantProperty` target and
`N8k_single_apex_false`. The first missing antecedent was `circle_placement`, now
accepted as theorem/proof `0e9040fa-76aa-44d0-9f4a-f78e0f838e21` /
`dabbf8f4-1dad-4e7d-93ac-a4861ec89239`. The immediate consumer is the finite-nine
root solution.

The platform accepted proof is `d578752d-d17e-46cf-b111-ae3d7aec65a2`, created at
`2026-09-10T07:45:36.488255+00:00` and accepted at
`2026-09-10T07:50:22.552727+00:00`; theorem status is `Proved`.

Both local Lean gates pass. The solution build completed 8,750 jobs and the audit build
completed 8,752 jobs. The authenticated compatibility slice emits inherited linter and
deprecation warnings; the public theorem imports emit their expected statement-mirror
warnings. This remains an author-side local audit, while the accepted proof records the
separate platform verification. Independent promotion review remains a separate gate.
