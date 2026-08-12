include('firstnonhit_base_axioms.p').

fof(malformed_source, axiom,
  car(ta) & car(da) & car(db) & car(dc) &
  da != db & da != dc & db != dc & cen(ta) != cen(qa)).
fof(malformed_overlap, axiom,
  mem(qa,da) & mem(qa,db) & mem(qa,dc) &
  mem(ta,da) & mem(ta,db) & mem(ta,dc)).
fof(malformed_inconsistent, conjecture, $false).
