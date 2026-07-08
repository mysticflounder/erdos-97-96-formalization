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
 (let ((?x145 (* (- 1.0) v1x)))
 (let ((?x23 (* (- 1.0) R2)))
 (let ((?x320 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x23)))
 (= (+ (+ ?x320 ?x145) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* p1x p1x) (* p1y p1y)) (* (- 1.0) rv2)) 0.0))
(assert
 (= (+ (+ (* p2x p2x) (* p2y p2y)) (* (- 1.0) rv2)) 0.0))
(assert
 (let ((?x311 (+ (+ (+ (+ 1.0 (* q1x q1x)) (* q1y q1y)) (* (- 1.0) rw2)) (* (- 2.0) q1x))))
 (= ?x311 0.0)))
(assert
 (let ((?x303 (+ (+ (+ (+ 1.0 (* q2x q2x)) (* q2y q2y)) (* (- 1.0) rw2)) (* (- 2.0) q2x))))
 (= ?x303 0.0)))
(assert
 (let ((?x293 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) p1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* p1x p1x)))))
 (>= (+ (+ ?x293 (* (- 1.0) (* p1y p1y))) (* (* 2.0 oy) p1y)) 0.0)))
(assert
 (let ((?x288 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) p2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* p2x p2x)))))
 (>= (+ (+ ?x288 (* (- 1.0) (* p2y p2y))) (* (* 2.0 oy) p2y)) 0.0)))
(assert
 (let ((?x283 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) q1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* q1x q1x)))))
 (>= (+ (+ ?x283 (* (- 1.0) (* q1y q1y))) (* (* 2.0 oy) q1y)) 0.0)))
(assert
 (let ((?x276 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) q2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* q2x q2x)))))
 (>= (+ (+ ?x276 (* (- 1.0) (* q2y q2y))) (* (* 2.0 oy) q2y)) 0.0)))
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
 (let ((?x259 (* p1y v1y)))
 (> ?x259 0.0)))
(assert
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x251 (* ?x250 v1x)))
 (let ((?x252 (* ?x251 v1y)))
 (let ((?x259 (* p1y v1y)))
 (let ((?x247 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* p1x (* v1y v1y))) ?x259) ?x252)))
 (> ?x247 0.0)))))))
(assert
 (> (+ (* p1x (* v1y v1y)) (* (* (* (- 1.0) p1y) v1x) v1y)) 0.0))
(assert
 (let ((?x243 (* p2y v1y)))
 (> ?x243 0.0)))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x239 (* ?x238 v1x)))
 (let ((?x240 (* ?x239 v1y)))
 (let ((?x243 (* p2y v1y)))
 (let ((?x235 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* p2x (* v1y v1y))) ?x243) ?x240)))
 (> ?x235 0.0)))))))
(assert
 (> (+ (* p2x (* v1y v1y)) (* (* (* (- 1.0) p2y) v1x) v1y)) 0.0))
(assert
 (let ((?x230 (* q1y v1y)))
 (> ?x230 0.0)))
(assert
 (let ((?x226 (* (* (* (- 1.0) q1y) v1x) v1y)))
 (let ((?x230 (* q1y v1y)))
 (let ((?x228 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* q1x (* v1y v1y))) ?x230) ?x226)))
 (> ?x228 0.0)))))
(assert
 (> (+ (* q1x (* v1y v1y)) (* (* (* (- 1.0) q1y) v1x) v1y)) 0.0))
(assert
 (> (* q2y v1y) 0.0))
(assert
 (let ((?x213 (* q2y v1x)))
 (let ((?x214 (* ?x213 v1y)))
 (let ((?x210 (+ (+ (* v1y v1y) (* (* (- 1.0) q2x) (* v1y v1y))) (* (* (- 1.0) q2y) v1y))))
 (> (+ ?x210 ?x214) 0.0)))))
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
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x193 (* ?x250 p2x)))
 (> (+ (+ (+ p1y (* (- 1.0) p2y)) (* p1x p2y)) ?x193) 0.0))))
(assert
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x251 (* ?x250 v1x)))
 (> (+ (+ (+ p1y (* (- 1.0) v1y)) (* p1x v1y)) ?x251) 0.0))))
(assert
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x178 (* ?x250 q1x)))
 (> (+ (+ (+ p1y (* (- 1.0) q1y)) (* p1x q1y)) ?x178) 0.0))))
(assert
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x173 (* ?x250 q2x)))
 (> (+ (+ (+ p1y (* (- 1.0) q2y)) (* p1x q2y)) ?x173) 0.0))))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x239 (* ?x238 v1x)))
 (> (+ (+ (+ p2y (* (- 1.0) v1y)) (* p2x v1y)) ?x239) 0.0))))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x170 (* ?x238 q1x)))
 (> (+ (+ (+ p2y (* (- 1.0) q1y)) (* p2x q1y)) ?x170) 0.0))))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x167 (* ?x238 q2x)))
 (> (+ (+ (+ p2y (* (- 1.0) q2y)) (* p2x q2y)) ?x167) 0.0))))
(assert
 (let ((?x150 (* (* (- 1.0) q1x) v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) q1y)) (* q1y v1x)) ?x150) 0.0)))
(assert
 (let ((?x218 (* (- 1.0) q2x)))
 (let ((?x151 (* ?x218 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) q2y)) (* q2y v1x)) ?x151) 0.0))))
(assert
 (let ((?x225 (* (- 1.0) q1y)))
 (let ((?x154 (* ?x225 q2x)))
 (> (+ (+ (+ q1y (* (- 1.0) q2y)) (* q1x q2y)) ?x154) 0.0))))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x239 (* ?x238 v1x)))
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x193 (* ?x250 p2x)))
 (let ((?x107 (+ (+ (+ (* p1x p2y) (* p1y v1x)) (* p2x v1y)) (* (* (- 1.0) p1x) v1y))))
 (> (+ (+ ?x107 ?x193) ?x239) 0.0)))))))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x170 (* ?x238 q1x)))
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x193 (* ?x250 p2x)))
 (let ((?x101 (* (- 1.0) p1x)))
 (let ((?x91 (* ?x101 q1y)))
 (let ((?x97 (+ (+ (+ (+ (* p1x p2y) (* p1y q1x)) (* p2x q1y)) ?x91) ?x193)))
 (> (+ ?x97 ?x170) 0.0)))))))))
(assert
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x167 (* ?x238 q2x)))
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x193 (* ?x250 p2x)))
 (let ((?x101 (* (- 1.0) p1x)))
 (let ((?x85 (* ?x101 q2y)))
 (let ((?x87 (+ (+ (+ (+ (* p1x p2y) (* p1y q2x)) (* p2x q2y)) ?x85) ?x193)))
 (> (+ ?x87 ?x167) 0.0)))))))))
(assert
 (let ((?x150 (* (* (- 1.0) q1x) v1y)))
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x251 (* ?x250 v1x)))
 (let ((?x101 (* (- 1.0) p1x)))
 (let ((?x91 (* ?x101 q1y)))
 (let ((?x90 (+ (+ (+ (+ (* p1x v1y) (* p1y q1x)) (* q1y v1x)) ?x91) ?x251)))
 (> (+ ?x90 ?x150) 0.0))))))))
(assert
 (let ((?x218 (* (- 1.0) q2x)))
 (let ((?x151 (* ?x218 v1y)))
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x251 (* ?x250 v1x)))
 (let ((?x101 (* (- 1.0) p1x)))
 (let ((?x85 (* ?x101 q2y)))
 (let ((?x40 (+ (+ (+ (+ (* p1x v1y) (* p1y q2x)) (* q2y v1x)) ?x85) ?x251)))
 (> (+ ?x40 ?x151) 0.0)))))))))
(assert
 (let ((?x225 (* (- 1.0) q1y)))
 (let ((?x154 (* ?x225 q2x)))
 (let ((?x250 (* (- 1.0) p1y)))
 (let ((?x178 (* ?x250 q1x)))
 (let ((?x101 (* (- 1.0) p1x)))
 (let ((?x85 (* ?x101 q2y)))
 (let ((?x63 (+ (+ (+ (+ (* p1x q1y) (* p1y q2x)) (* q1x q2y)) ?x85) ?x178)))
 (> (+ ?x63 ?x154) 0.0)))))))))
(assert
 (let ((?x150 (* (* (- 1.0) q1x) v1y)))
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x239 (* ?x238 v1x)))
 (let ((?x55 (+ (+ (+ (* p2x v1y) (* p2y q1x)) (* q1y v1x)) (* (* (- 1.0) p2x) q1y))))
 (> (+ (+ ?x55 ?x239) ?x150) 0.0))))))
(assert
 (let ((?x218 (* (- 1.0) q2x)))
 (let ((?x151 (* ?x218 v1y)))
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x239 (* ?x238 v1x)))
 (let ((?x26 (* (- 1.0) p2x)))
 (let ((?x59 (* ?x26 q2y)))
 (let ((?x49 (+ (+ (+ (+ (* p2x v1y) (* p2y q2x)) (* q2y v1x)) ?x59) ?x239)))
 (> (+ ?x49 ?x151) 0.0)))))))))
(assert
 (let ((?x225 (* (- 1.0) q1y)))
 (let ((?x154 (* ?x225 q2x)))
 (let ((?x238 (* (- 1.0) p2y)))
 (let ((?x170 (* ?x238 q1x)))
 (let ((?x26 (* (- 1.0) p2x)))
 (let ((?x59 (* ?x26 q2y)))
 (let ((?x24 (+ (+ (+ (+ (* p2x q1y) (* p2y q2x)) (* q1x q2y)) ?x59) ?x170)))
 (> (+ ?x24 ?x154) 0.0)))))))))
(assert
 (let ((?x225 (* (- 1.0) q1y)))
(let ((?x154 (* ?x225 q2x)))
(let ((?x150 (* (* (- 1.0) q1x) v1y)))
(let ((?x28 (+ (+ (+ (+ (* q1x q2y) (* q1y v1x)) (* q2x v1y)) ?x150) ?x154)))
(> (+ ?x28 (* (* (- 1.0) q2y) v1x)) 0.0))))))
(check-sat)
