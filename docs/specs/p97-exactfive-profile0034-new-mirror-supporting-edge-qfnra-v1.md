# Profile 0034 new mirror supporting-edge QF_NRA producer

This diagnostic authenticates the alternate-order source run and derives the
z3/mirror order from its semantic rank map.  The required profile digest is
`16765c10e871a525d6e28bb4b02028fb9504766f7cd2bcdf242f29d4fcd575fa`; the
derived order is `c000<c005<c003<c007<c004<c002<c006<c001<c012<c011<c010<c008<c009`
and has digest
`09b58a30d074ec4562c451f30018d831f8f0abfd612febd99e538406684ce9da`.
Under the profile role map this is exactly
`U=c1<p<a<s<d<c2<q=e<O<y<x<v<t<u`.

The producer emits only `mirror-radius-lt` and `mirror-radius-gt`, plus the
positive and negative controls.  Each target has 20 real variables, 143
supporting-edge strict inequalities, 11 source row equalities, one radius
branch, and one source strict inequality: 156 assertions and 177 commands.
Each supporting edge is checked in code as a cyclic rotation of its positive
full-order triple, so the full 286-turn formula implies the relaxation.  A SAT
model is accepted only after exact rational replay of all 286 turns, all 13
rows, the selected branch, and the source inequality.  Solver calls are PIQD
HTTP only; this lane does not launch solvers during verification.

The authenticated parent is the alternate-order run with manifest
`46dfcd151204d57e759f6910524bc5a77f1e328aec10c57003f21d062c2600bd`, launch
`b37a54792c85a18b8793b5aa4c1d16fab69a32b2b9d9aa34983583bedaba0077`, terminal
`032098cefa906494ae5d0a392d56f4427237e6d8b5cdb1e8673682b7d35ead3b`, and
mirror result `0db3c932e361daf67c9ba70b9c5c5ea565cc307fc7901f2aba3058758e502875`.
All theorem, source-completeness, promotion, and live-closure claims remain
false.
