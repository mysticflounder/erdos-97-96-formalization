(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun rv2 () Real)
(declare-fun p1y () Real)
(declare-fun p1x () Real)
(declare-fun p2y () Real)
(declare-fun p2x () Real)
(declare-fun q1x () Real)
(declare-fun rw2 () Real)
(declare-fun q1y () Real)
(declare-fun q2x () Real)
(declare-fun q2y () Real)
(assert
 (let ((?x25 (* (- 1.0) v1x)))
 (let ((?x24 (* (- 1.0) R2)))
 (let ((?x32 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x24)))
 (= (+ (+ ?x32 ?x25) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* p1x p1x) (* p1y p1y)) (* (- 1.0) rv2)) 0.0))
(assert
 (= (+ (+ (* p2x p2x) (* p2y p2y)) (* (- 1.0) rv2)) 0.0))
(assert
 (let ((?x58 (+ (+ (+ (+ 1.0 (* q1x q1x)) (* q1y q1y)) (* (- 1.0) rw2)) (* (- 2.0) q1x))))
 (= ?x58 0.0)))
(assert
 (let ((?x66 (+ (+ (+ (+ 1.0 (* q2x q2x)) (* q2y q2y)) (* (- 1.0) rw2)) (* (- 2.0) q2x))))
 (= ?x66 0.0)))
(assert
 (let ((?x78 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) p1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* p1x p1x)))))
 (>= (+ (+ ?x78 (* (- 1.0) (* p1y p1y))) (* (* 2.0 oy) p1y)) 0.0)))
(assert
 (let ((?x87 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) p2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* p2x p2x)))))
 (>= (+ (+ ?x87 (* (- 1.0) (* p2y p2y))) (* (* 2.0 oy) p2y)) 0.0)))
(assert
 (let ((?x96 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) q1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* q1x q1x)))))
 (>= (+ (+ ?x96 (* (- 1.0) (* q1y q1y))) (* (* 2.0 oy) q1y)) 0.0)))
(assert
 (let ((?x105 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) q2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* q2x q2x)))))
 (>= (+ (+ ?x105 (* (- 1.0) (* q2y q2y))) (* (* 2.0 oy) q2y)) 0.0)))
(assert
 (>= (+ (+ (* v1x v1x) (* v1y v1y)) (* (- 1.0) v1x)) 0.0))
(assert
 (>= v1x 0.0))
(assert
 (>= (+ 1.0 (* (- 1.0) v1x)) 0.0))
(assert
 (> R2 0.0))
(assert
 (> rv2 0.0))
(assert
 (> rw2 0.0))
(assert
 (let ((?x118 (* p1y v1y)))
 (> ?x118 0.0)))
(assert
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x123 (* ?x122 v1x)))
 (let ((?x124 (* ?x123 v1y)))
 (let ((?x118 (* p1y v1y)))
 (let ((?x127 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* p1x (* v1y v1y))) ?x118) ?x124)))
 (> ?x127 0.0)))))))
(assert
 (> (+ (* p1x (* v1y v1y)) (* (* (* (- 1.0) p1y) v1x) v1y)) 0.0))
(assert
 (let ((?x131 (* p2y v1y)))
 (> ?x131 0.0)))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x135 (* ?x134 v1x)))
 (let ((?x136 (* ?x135 v1y)))
 (let ((?x131 (* p2y v1y)))
 (let ((?x139 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* p2x (* v1y v1y))) ?x131) ?x136)))
 (> ?x139 0.0)))))))
(assert
 (> (+ (* p2x (* v1y v1y)) (* (* (* (- 1.0) p2y) v1x) v1y)) 0.0))
(assert
 (> (* q1y v1y) 0.0))
(assert
 (let ((?x149 (* q1y v1x)))
 (let ((?x150 (* ?x149 v1y)))
 (let ((?x152 (+ (+ (* v1y v1y) (* (* (- 1.0) q1x) (* v1y v1y))) (* (* (- 1.0) q1y) v1y))))
 (> (+ ?x152 ?x150) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) q1x) (* v1y v1y)) (* (* q1y v1x) v1y)) 0.0))
(assert
 (> (* q2y v1y) 0.0))
(assert
 (let ((?x163 (* q2y v1x)))
 (let ((?x164 (* ?x163 v1y)))
 (let ((?x166 (+ (+ (* v1y v1y) (* (* (- 1.0) q2x) (* v1y v1y))) (* (* (- 1.0) q2y) v1y))))
 (> (+ ?x166 ?x164) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) q2x) (* v1y v1y)) (* (* q2y v1x) v1y)) 0.0))
(assert
 (> p1y 0.0))
(assert
 (> p2y 0.0))
(assert
 (> v1y 0.0))
(assert
 (> q1y 0.0))
(assert
 (> q2y 0.0))
(assert
 (> (+ (* p1x p2y) (* (* (- 1.0) p1y) p2x)) 0.0))
(assert
 (> (+ (* p1x v1y) (* (* (- 1.0) p1y) v1x)) 0.0))
(assert
 (> (+ (* p1x q1y) (* (* (- 1.0) p1y) q1x)) 0.0))
(assert
 (> (+ (* p1x q2y) (* (* (- 1.0) p1y) q2x)) 0.0))
(assert
 (> (+ (* p2x v1y) (* (* (- 1.0) p2y) v1x)) 0.0))
(assert
 (> (+ (* p2x q1y) (* (* (- 1.0) p2y) q1x)) 0.0))
(assert
 (> (+ (* p2x q2y) (* (* (- 1.0) p2y) q2x)) 0.0))
(assert
 (> (+ (* q1y v1x) (* (* (- 1.0) q1x) v1y)) 0.0))
(assert
 (> (+ (* q2y v1x) (* (* (- 1.0) q2x) v1y)) 0.0))
(assert
 (> (+ (* q1x q2y) (* (* (- 1.0) q1y) q2x)) 0.0))
(assert
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x177 (* ?x122 p2x)))
 (> (+ (+ (+ p1y (* (- 1.0) p2y)) (* p1x p2y)) ?x177) 0.0))))
(assert
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x123 (* ?x122 v1x)))
 (> (+ (+ (+ p1y (* (- 1.0) v1y)) (* p1x v1y)) ?x123) 0.0))))
(assert
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x184 (* ?x122 q1x)))
 (> (+ (+ (+ p1y (* (- 1.0) q1y)) (* p1x q1y)) ?x184) 0.0))))
(assert
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x188 (* ?x122 q2x)))
 (> (+ (+ (+ p1y (* (- 1.0) q2y)) (* p1x q2y)) ?x188) 0.0))))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x135 (* ?x134 v1x)))
 (> (+ (+ (+ p2y (* (- 1.0) v1y)) (* p2x v1y)) ?x135) 0.0))))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x195 (* ?x134 q1x)))
 (> (+ (+ (+ p2y (* (- 1.0) q1y)) (* p2x q1y)) ?x195) 0.0))))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x199 (* ?x134 q2x)))
 (> (+ (+ (+ p2y (* (- 1.0) q2y)) (* p2x q2y)) ?x199) 0.0))))
(assert
 (let ((?x145 (* (- 1.0) q1x)))
 (let ((?x202 (* ?x145 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) q1y)) (* q1y v1x)) ?x202) 0.0))))
(assert
 (let ((?x159 (* (- 1.0) q2x)))
 (let ((?x205 (* ?x159 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) q2y)) (* q2y v1x)) ?x205) 0.0))))
(assert
 (let ((?x147 (* (- 1.0) q1y)))
 (let ((?x209 (* ?x147 q2x)))
 (> (+ (+ (+ q1y (* (- 1.0) q2y)) (* q1x q2y)) ?x209) 0.0))))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x135 (* ?x134 v1x)))
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x177 (* ?x122 p2x)))
 (let ((?x258 (+ (+ (+ (* p1x p2y) (* p1y v1x)) (* p2x v1y)) (* (* (- 1.0) p1x) v1y))))
 (> (+ (+ ?x258 ?x177) ?x135) 0.0)))))))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x195 (* ?x134 q1x)))
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x177 (* ?x122 p2x)))
 (let ((?x254 (* (- 1.0) p1x)))
 (let ((?x263 (* ?x254 q1y)))
 (let ((?x267 (+ (+ (+ (+ (* p1x p2y) (* p1y q1x)) (* p2x q1y)) ?x263) ?x177)))
 (> (+ ?x267 ?x195) 0.0)))))))))
(assert
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x199 (* ?x134 q2x)))
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x177 (* ?x122 p2x)))
 (let ((?x254 (* (- 1.0) p1x)))
 (let ((?x271 (* ?x254 q2y)))
 (let ((?x275 (+ (+ (+ (+ (* p1x p2y) (* p1y q2x)) (* p2x q2y)) ?x271) ?x177)))
 (> (+ ?x275 ?x199) 0.0)))))))))
(assert
 (let ((?x145 (* (- 1.0) q1x)))
 (let ((?x202 (* ?x145 v1y)))
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x123 (* ?x122 v1x)))
 (let ((?x254 (* (- 1.0) p1x)))
 (let ((?x263 (* ?x254 q1y)))
 (let ((?x281 (+ (+ (+ (+ (* p1x v1y) (* p1y q1x)) (* q1y v1x)) ?x263) ?x123)))
 (> (+ ?x281 ?x202) 0.0)))))))))
(assert
 (let ((?x159 (* (- 1.0) q2x)))
 (let ((?x205 (* ?x159 v1y)))
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x123 (* ?x122 v1x)))
 (let ((?x254 (* (- 1.0) p1x)))
 (let ((?x271 (* ?x254 q2y)))
 (let ((?x287 (+ (+ (+ (+ (* p1x v1y) (* p1y q2x)) (* q2y v1x)) ?x271) ?x123)))
 (> (+ ?x287 ?x205) 0.0)))))))))
(assert
 (let ((?x147 (* (- 1.0) q1y)))
 (let ((?x209 (* ?x147 q2x)))
 (let ((?x122 (* (- 1.0) p1y)))
 (let ((?x184 (* ?x122 q1x)))
 (let ((?x254 (* (- 1.0) p1x)))
 (let ((?x271 (* ?x254 q2y)))
 (let ((?x293 (+ (+ (+ (+ (* p1x q1y) (* p1y q2x)) (* q1x q2y)) ?x271) ?x184)))
 (> (+ ?x293 ?x209) 0.0)))))))))
(assert
 (let ((?x145 (* (- 1.0) q1x)))
 (let ((?x202 (* ?x145 v1y)))
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x135 (* ?x134 v1x)))
 (let ((?x301 (+ (+ (+ (* p2x v1y) (* p2y q1x)) (* q1y v1x)) (* (* (- 1.0) p2x) q1y))))
 (> (+ (+ ?x301 ?x135) ?x202) 0.0)))))))
(assert
 (let ((?x159 (* (- 1.0) q2x)))
 (let ((?x205 (* ?x159 v1y)))
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x135 (* ?x134 v1x)))
 (let ((?x297 (* (- 1.0) p2x)))
 (let ((?x306 (* ?x297 q2y)))
 (let ((?x310 (+ (+ (+ (+ (* p2x v1y) (* p2y q2x)) (* q2y v1x)) ?x306) ?x135)))
 (> (+ ?x310 ?x205) 0.0)))))))))
(assert
 (let ((?x147 (* (- 1.0) q1y)))
 (let ((?x209 (* ?x147 q2x)))
 (let ((?x134 (* (- 1.0) p2y)))
 (let ((?x195 (* ?x134 q1x)))
 (let ((?x297 (* (- 1.0) p2x)))
 (let ((?x306 (* ?x297 q2y)))
 (let ((?x316 (+ (+ (+ (+ (* p2x q1y) (* p2y q2x)) (* q1x q2y)) ?x306) ?x195)))
 (> (+ ?x316 ?x209) 0.0)))))))))
(assert
 (let ((?x147 (* (- 1.0) q1y)))
(let ((?x209 (* ?x147 q2x)))
(let ((?x145 (* (- 1.0) q1x)))
(let ((?x202 (* ?x145 v1y)))
(let ((?x324 (+ (+ (+ (+ (* q1x q2y) (* q1y v1x)) (* q2x v1y)) ?x202) ?x209)))
(> (+ ?x324 (* (* (- 1.0) q2y) v1x)) 0.0)))))))
(check-sat)
