(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun rho2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x226 (* (- 1.0) v1x)))
 (let ((?x161 (* (- 1.0) R2)))
 (let ((?x186 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x161)))
 (= (+ (+ ?x186 ?x226) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* xx xx) (* xy xy)) (* (- 1.0) rho2)) 0.0))
(assert
 (let ((?x407 (* (- 1.0) rho2)))
 (let ((?x264 (* y1y y1y)))
 (let ((?x49 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x264) ?x407)))
 (= (+ (+ ?x49 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x407 (* (- 1.0) rho2)))
 (let ((?x248 (* xy xy)))
 (let ((?x478 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x248) ?x407)))
 (= (+ (+ ?x478 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x407 (* (- 1.0) rho2)))
 (let ((?x248 (* xy xy)))
 (let ((?x253 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x248) ?x407)))
 (= (+ (+ ?x253 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x464 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x464 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x305 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x305 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x414 (* oy oy)))
 (let ((?x149 (* (- 1.0) ?x414)))
 (let ((?x108 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x108 ?x149) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x414 (* oy oy)))
 (let ((?x149 (* (- 1.0) ?x414)))
 (let ((?x477 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x477 ?x149) (* (* 2.0 b2y) oy)) 0.0)))))
(assert
 (>= (+ (+ (* v1x v1x) (* v1y v1y)) (* (- 1.0) v1x)) 0.0))
(assert
 (>= v1x 0.0))
(assert
 (>= (+ 1.0 (* (- 1.0) v1x)) 0.0))
(assert
 (> R2 0.0))
(assert
 (> rho2 0.0))
(assert
 (let ((?x303 (* (- 1.0) v1y)))
 (let ((?x919 (* ?x303 xy)))
 (> ?x919 0.0))))
(assert
 (let ((?x128 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x128 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x303 (* (- 1.0) v1y)))
 (let ((?x339 (* ?x303 y1y)))
 (> ?x339 0.0))))
(assert
 (let ((?x241 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x241 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x316 (* b1y v1x)))
 (let ((?x299 (* ?x316 v1y)))
 (let ((?x159 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x159 ?x299) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x354 (* b2y v1x)))
 (let ((?x23 (* ?x354 v1y)))
 (let ((?x28 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x28 ?x23) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (+ (* xx y1y) (* (* (- 1.0) xy) y1x)) 0.0))
(assert
 (let ((?x415 (* (- 1.0) xy)))
 (> ?x415 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (let ((?x59 (* (- 1.0) y1y)))
 (> ?x59 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* b2y y1x) (* (* (- 1.0) b2x) y1y)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (let ((?x415 (* (- 1.0) xy)))
 (let ((?x412 (* ?x415 y1x)))
 (> (+ (+ (+ xy (* (- 1.0) y1y)) (* xx y1y)) ?x412) 0.0))))
(assert
 (let ((?x415 (* (- 1.0) xy)))
 (let ((?x412 (* ?x415 y1x)))
 (let ((?x303 (* (- 1.0) v1y)))
 (let ((?x162 (* ?x303 xx)))
 (let ((?x226 (* (- 1.0) v1x)))
 (let ((?x292 (* ?x226 y1y)))
 (let ((?x257 (+ (+ (+ (+ (* v1x xy) (* v1y y1x)) (* xx y1y)) ?x292) ?x162)))
 (> (+ ?x257 ?x412) 0.0)))))))))
(assert
 (let ((?x415 (* (- 1.0) xy)))
 (let ((?x412 (* ?x415 y1x)))
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x155 (* ?x990 xx)))
 (let ((?x136 (* (- 1.0) b1x)))
 (let ((?x446 (* ?x136 y1y)))
 (let ((?x60 (+ (+ (+ (+ (* b1x xy) (* b1y y1x)) (* xx y1y)) ?x446) ?x155)))
 (> (+ ?x60 ?x412) 0.0)))))))))
(assert
 (let ((?x415 (* (- 1.0) xy)))
 (let ((?x412 (* ?x415 y1x)))
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x254 (* ?x479 xx)))
 (let ((?x83 (* (- 1.0) b2x)))
 (let ((?x286 (* ?x83 y1y)))
 (let ((?x15 (+ (+ (+ (+ (* b2x xy) (* b2y y1x)) (* xx y1y)) ?x286) ?x254)))
 (> (+ ?x15 ?x412) 0.0)))))))))
(assert
 (let ((?x303 (* (- 1.0) v1y)))
 (let ((?x162 (* ?x303 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x162) 0.0))))
(assert
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x155 (* ?x990 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x155) 0.0))))
(assert
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x254 (* ?x479 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x254) 0.0))))
(assert
 (let ((?x226 (* (- 1.0) v1x)))
 (let ((?x260 (* ?x226 xy)))
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x155 (* ?x990 xx)))
 (let ((?x136 (* (- 1.0) b1x)))
 (let ((?x179 (* ?x136 v1y)))
 (let ((?x51 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x179) ?x155)))
 (> (+ ?x51 ?x260) 0.0)))))))))
(assert
 (let ((?x226 (* (- 1.0) v1x)))
 (let ((?x260 (* ?x226 xy)))
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x254 (* ?x479 xx)))
 (let ((?x83 (* (- 1.0) b2x)))
 (let ((?x194 (* ?x83 v1y)))
 (let ((?x151 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x194) ?x254)))
 (> (+ ?x151 ?x260) 0.0)))))))))
(assert
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x254 (* ?x479 xx)))
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x192 (* ?x990 b2x)))
 (let ((?x136 (* (- 1.0) b1x)))
 (let ((?x181 (* ?x136 xy)))
 (let ((?x304 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x181) ?x192)))
 (> (+ ?x304 ?x254) 0.0)))))))))
(assert
 (let ((?x146 (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) (* (* (- 1.0) v1y) y1x))))
 (> ?x146 0.0)))
(assert
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x12 (* ?x990 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x12) 0.0))))
(assert
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x319 (* ?x479 y1x)))
 (> (+ (+ (+ b2y (* (- 1.0) y1y)) (* b2x y1y)) ?x319) 0.0))))
(assert
 (let ((?x226 (* (- 1.0) v1x)))
 (let ((?x292 (* ?x226 y1y)))
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x12 (* ?x990 y1x)))
 (let ((?x136 (* (- 1.0) b1x)))
 (let ((?x179 (* ?x136 v1y)))
 (let ((?x65 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x179) ?x12)))
 (> (+ ?x65 ?x292) 0.0)))))))))
(assert
 (let ((?x226 (* (- 1.0) v1x)))
 (let ((?x292 (* ?x226 y1y)))
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x319 (* ?x479 y1x)))
 (let ((?x83 (* (- 1.0) b2x)))
 (let ((?x194 (* ?x83 v1y)))
 (let ((?x465 (+ (+ (+ (+ (* b2x y1y) (* b2y v1x)) (* v1y y1x)) ?x194) ?x319)))
 (> (+ ?x465 ?x292) 0.0)))))))))
(assert
 (let ((?x479 (* (- 1.0) b2y)))
 (let ((?x319 (* ?x479 y1x)))
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x192 (* ?x990 b2x)))
 (let ((?x136 (* (- 1.0) b1x)))
 (let ((?x446 (* ?x136 y1y)))
 (let ((?x432 (+ (+ (+ (+ (* b1x b2y) (* b1y y1x)) (* b2x y1y)) ?x446) ?x192)))
 (> (+ ?x432 ?x319) 0.0)))))))))
(assert
 (let ((?x136 (* (- 1.0) b1x)))
 (let ((?x179 (* ?x136 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x179) 0.0))))
(assert
 (let ((?x83 (* (- 1.0) b2x)))
 (let ((?x194 (* ?x83 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x194) 0.0))))
(assert
 (let ((?x990 (* (- 1.0) b1y)))
 (let ((?x192 (* ?x990 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x192) 0.0))))
(assert
 (let ((?x990 (* (- 1.0) b1y)))
(let ((?x192 (* ?x990 b2x)))
(let ((?x136 (* (- 1.0) b1x)))
(let ((?x179 (* ?x136 v1y)))
(let ((?x282 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x179) ?x192)))
(> (+ ?x282 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
