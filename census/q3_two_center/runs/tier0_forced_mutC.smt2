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
 (let ((?x146 (* (- 1.0) v1x)))
 (let ((?x322 (* (- 1.0) R2)))
 (let ((?x31 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x322)))
 (= (+ (+ ?x31 ?x146) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* p1x p1x) (* p1y p1y)) (* (- 1.0) rv2)) 0.0))
(assert
 (= (+ (+ (* p2x p2x) (* p2y p2y)) (* (- 1.0) rv2)) 0.0))
(assert
 (let ((?x42 (+ (+ (+ (+ 1.0 (* q1x q1x)) (* q1y q1y)) (* (- 1.0) rw2)) (* (- 2.0) q1x))))
 (= ?x42 0.0)))
(assert
 (let ((?x57 (+ (+ (+ (+ 1.0 (* q2x q2x)) (* q2y q2y)) (* (- 1.0) rw2)) (* (- 2.0) q2x))))
 (= ?x57 0.0)))
(assert
 (= (+ (+ (- 1.0) rv2) (* (- 4.0) R2)) 0.0))
(assert
 (let ((?x70 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) p1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* p1x p1x)))))
 (>= (+ (+ ?x70 (* (- 1.0) (* p1y p1y))) (* (* 2.0 oy) p1y)) 0.0)))
(assert
 (let ((?x91 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) p2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* p2x p2x)))))
 (>= (+ (+ ?x91 (* (- 1.0) (* p2y p2y))) (* (* 2.0 oy) p2y)) 0.0)))
(assert
 (let ((?x82 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) q1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* q1x q1x)))))
 (>= (+ (+ ?x82 (* (- 1.0) (* q1y q1y))) (* (* 2.0 oy) q1y)) 0.0)))
(assert
 (let ((?x97 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) q2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* q2x q2x)))))
 (>= (+ (+ ?x97 (* (- 1.0) (* q2y q2y))) (* (* 2.0 oy) q2y)) 0.0)))
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
 (let ((?x100 (* p1y v1y)))
 (> ?x100 0.0)))
(assert
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x69 (* ?x20 v1x)))
 (let ((?x109 (* ?x69 v1y)))
 (let ((?x100 (* p1y v1y)))
 (let ((?x68 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* p1x (* v1y v1y))) ?x100) ?x109)))
 (> ?x68 0.0)))))))
(assert
 (> (+ (* p1x (* v1y v1y)) (* (* (* (- 1.0) p1y) v1x) v1y)) 0.0))
(assert
 (let ((?x21 (* p2y v1y)))
 (> ?x21 0.0)))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x25 (* ?x115 v1x)))
 (let ((?x120 (* ?x25 v1y)))
 (let ((?x21 (* p2y v1y)))
 (let ((?x128 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* p2x (* v1y v1y))) ?x21) ?x120)))
 (> ?x128 0.0)))))))
(assert
 (> (+ (* p2x (* v1y v1y)) (* (* (* (- 1.0) p2y) v1x) v1y)) 0.0))
(assert
 (> (* q1y v1y) 0.0))
(assert
 (let ((?x121 (* q1y v1x)))
 (let ((?x124 (* ?x121 v1y)))
 (let ((?x131 (+ (+ (* v1y v1y) (* (* (- 1.0) q1x) (* v1y v1y))) (* (* (- 1.0) q1y) v1y))))
 (> (+ ?x131 ?x124) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) q1x) (* v1y v1y)) (* (* q1y v1x) v1y)) 0.0))
(assert
 (> (* q2y v1y) 0.0))
(assert
 (let ((?x155 (* q2y v1x)))
 (let ((?x156 (* ?x155 v1y)))
 (let ((?x157 (+ (+ (* v1y v1y) (* (* (- 1.0) q2x) (* v1y v1y))) (* (* (- 1.0) q2y) v1y))))
 (> (+ ?x157 ?x156) 0.0)))))
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
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x189 (* ?x20 p2x)))
 (> (+ (+ (+ p1y (* (- 1.0) p2y)) (* p1x p2y)) ?x189) 0.0))))
(assert
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x69 (* ?x20 v1x)))
 (> (+ (+ (+ p1y (* (- 1.0) v1y)) (* p1x v1y)) ?x69) 0.0))))
(assert
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x319 (* ?x20 q1x)))
 (> (+ (+ (+ p1y (* (- 1.0) q1y)) (* p1x q1y)) ?x319) 0.0))))
(assert
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x203 (* ?x20 q2x)))
 (> (+ (+ (+ p1y (* (- 1.0) q2y)) (* p1x q2y)) ?x203) 0.0))))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x25 (* ?x115 v1x)))
 (> (+ (+ (+ p2y (* (- 1.0) v1y)) (* p2x v1y)) ?x25) 0.0))))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x217 (* ?x115 q1x)))
 (> (+ (+ (+ p2y (* (- 1.0) q1y)) (* p2x q1y)) ?x217) 0.0))))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x222 (* ?x115 q2x)))
 (> (+ (+ (+ p2y (* (- 1.0) q2y)) (* p2x q2y)) ?x222) 0.0))))
(assert
 (let ((?x125 (* (- 1.0) q1x)))
 (let ((?x188 (* ?x125 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) q1y)) (* q1y v1x)) ?x188) 0.0))))
(assert
 (let ((?x143 (* (- 1.0) q2x)))
 (let ((?x228 (* ?x143 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) q2y)) (* q2y v1x)) ?x228) 0.0))))
(assert
 (let ((?x140 (* (- 1.0) q1y)))
 (let ((?x240 (* ?x140 q2x)))
 (> (+ (+ (+ q1y (* (- 1.0) q2y)) (* q1x q2y)) ?x240) 0.0))))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x25 (* ?x115 v1x)))
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x189 (* ?x20 p2x)))
 (let ((?x279 (+ (+ (+ (* p1x p2y) (* p1y v1x)) (* p2x v1y)) (* (* (- 1.0) p1x) v1y))))
 (> (+ (+ ?x279 ?x189) ?x25) 0.0)))))))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x217 (* ?x115 q1x)))
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x189 (* ?x20 p2x)))
 (let ((?x265 (* (- 1.0) p1x)))
 (let ((?x280 (* ?x265 q1y)))
 (let ((?x287 (+ (+ (+ (+ (* p1x p2y) (* p1y q1x)) (* p2x q1y)) ?x280) ?x189)))
 (> (+ ?x287 ?x217) 0.0)))))))))
(assert
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x222 (* ?x115 q2x)))
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x189 (* ?x20 p2x)))
 (let ((?x265 (* (- 1.0) p1x)))
 (let ((?x317 (* ?x265 q2y)))
 (let ((?x262 (+ (+ (+ (+ (* p1x p2y) (* p1y q2x)) (* p2x q2y)) ?x317) ?x189)))
 (> (+ ?x262 ?x222) 0.0)))))))))
(assert
 (let ((?x125 (* (- 1.0) q1x)))
 (let ((?x188 (* ?x125 v1y)))
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x69 (* ?x20 v1x)))
 (let ((?x265 (* (- 1.0) p1x)))
 (let ((?x280 (* ?x265 q1y)))
 (let ((?x293 (+ (+ (+ (+ (* p1x v1y) (* p1y q1x)) (* q1y v1x)) ?x280) ?x69)))
 (> (+ ?x293 ?x188) 0.0)))))))))
(assert
 (let ((?x143 (* (- 1.0) q2x)))
 (let ((?x228 (* ?x143 v1y)))
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x69 (* ?x20 v1x)))
 (let ((?x265 (* (- 1.0) p1x)))
 (let ((?x317 (* ?x265 q2y)))
 (let ((?x180 (+ (+ (+ (+ (* p1x v1y) (* p1y q2x)) (* q2y v1x)) ?x317) ?x69)))
 (> (+ ?x180 ?x228) 0.0)))))))))
(assert
 (let ((?x140 (* (- 1.0) q1y)))
 (let ((?x240 (* ?x140 q2x)))
 (let ((?x20 (* (- 1.0) p1y)))
 (let ((?x319 (* ?x20 q1x)))
 (let ((?x265 (* (- 1.0) p1x)))
 (let ((?x317 (* ?x265 q2y)))
 (let ((?x300 (+ (+ (+ (+ (* p1x q1y) (* p1y q2x)) (* q1x q2y)) ?x317) ?x319)))
 (> (+ ?x300 ?x240) 0.0)))))))))
(assert
 (let ((?x125 (* (- 1.0) q1x)))
 (let ((?x188 (* ?x125 v1y)))
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x25 (* ?x115 v1x)))
 (let ((?x312 (+ (+ (+ (* p2x v1y) (* p2y q1x)) (* q1y v1x)) (* (* (- 1.0) p2x) q1y))))
 (> (+ (+ ?x312 ?x25) ?x188) 0.0)))))))
(assert
 (let ((?x143 (* (- 1.0) q2x)))
 (let ((?x228 (* ?x143 v1y)))
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x25 (* ?x115 v1x)))
 (let ((?x159 (* (- 1.0) p2x)))
 (let ((?x315 (* ?x159 q2y)))
 (let ((?x209 (+ (+ (+ (+ (* p2x v1y) (* p2y q2x)) (* q2y v1x)) ?x315) ?x25)))
 (> (+ ?x209 ?x228) 0.0)))))))))
(assert
 (let ((?x140 (* (- 1.0) q1y)))
 (let ((?x240 (* ?x140 q2x)))
 (let ((?x115 (* (- 1.0) p2y)))
 (let ((?x217 (* ?x115 q1x)))
 (let ((?x159 (* (- 1.0) p2x)))
 (let ((?x315 (* ?x159 q2y)))
 (let ((?x320 (+ (+ (+ (+ (* p2x q1y) (* p2y q2x)) (* q1x q2y)) ?x315) ?x217)))
 (> (+ ?x320 ?x240) 0.0)))))))))
(assert
 (let ((?x140 (* (- 1.0) q1y)))
(let ((?x240 (* ?x140 q2x)))
(let ((?x125 (* (- 1.0) q1x)))
(let ((?x188 (* ?x125 v1y)))
(let ((?x450 (+ (+ (+ (+ (* q1x q2y) (* q1y v1x)) (* q2x v1y)) ?x188) ?x240)))
(> (+ ?x450 (* (* (- 1.0) q2y) v1x)) 0.0)))))))
(check-sat)
