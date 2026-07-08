(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun xy () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x376 (* (- 1.0) v1x)))
 (let ((?x612 (* (- 1.0) R2)))
 (let ((?x701 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x612)))
 (= (+ (+ ?x701 ?x376) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x192 (* (- 2.0) xx)))
 (let ((?x68 (+ (+ (+ (+ 1.0 (* xx xx)) (* xy xy)) (* (- 1.0) rho2)) ?x192)))
 (= ?x68 0.0))))
(assert
 (let ((?x441 (* (- 1.0) rho2)))
 (let ((?x83 (* y1y y1y)))
 (let ((?x121 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x83) ?x441)))
 (= (+ (+ ?x121 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x441 (* (- 1.0) rho2)))
 (let ((?x20 (* xy xy)))
 (let ((?x21 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x20) ?x441)))
 (= (+ (+ ?x21 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x441 (* (- 1.0) rho2)))
 (let ((?x20 (* xy xy)))
 (let ((?x436 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x20) ?x441)))
 (= (+ (+ ?x436 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x973 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x973 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x475 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x475 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x241 (* oy oy)))
 (let ((?x390 (* (- 1.0) ?x241)))
 (let ((?x174 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x174 ?x390) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x241 (* oy oy)))
 (let ((?x390 (* (- 1.0) ?x241)))
 (let ((?x304 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x304 ?x390) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x51 (* (- 1.0) v1y)))
 (let ((?x492 (* ?x51 xy)))
 (> ?x492 0.0))))
(assert
 (let ((?x432 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x432 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x51 (* (- 1.0) v1y)))
 (let ((?x190 (* ?x51 y1y)))
 (> ?x190 0.0))))
(assert
 (let ((?x162 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x162 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x365 (* b1y v1x)))
 (let ((?x90 (* ?x365 v1y)))
 (let ((?x147 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x147 ?x90) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x291 (* b2y v1x)))
 (let ((?x14 (* ?x291 v1y)))
 (let ((?x205 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x205 ?x14) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (let ((?x53 (* (- 1.0) y1y)))
 (> ?x53 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* b2y y1x) (* (* (- 1.0) b2x) y1y)) 0.0))
(assert
 (let ((?x206 (* (- 1.0) xy)))
 (> ?x206 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
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
 (let ((?x48 (* (- 1.0) xx)))
 (let ((?x116 (* ?x48 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x116) 0.0))))
(assert
 (let ((?x48 (* (- 1.0) xx)))
 (let ((?x116 (* ?x48 y1y)))
 (let ((?x51 (* (- 1.0) v1y)))
 (let ((?x247 (* ?x51 y1x)))
 (let ((?x376 (* (- 1.0) v1x)))
 (let ((?x128 (* ?x376 xy)))
 (let ((?x265 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x128) ?x247)))
 (> (+ ?x265 ?x116) 0.0)))))))))
(assert
 (let ((?x48 (* (- 1.0) xx)))
 (let ((?x116 (* ?x48 y1y)))
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x571 y1x)))
 (let ((?x45 (* (- 1.0) b1x)))
 (let ((?x198 (* ?x45 xy)))
 (let ((?x305 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x198) ?x445)))
 (> (+ ?x305 ?x116) 0.0)))))))))
(assert
 (let ((?x48 (* (- 1.0) xx)))
 (let ((?x116 (* ?x48 y1y)))
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x823 (* ?x361 y1x)))
 (let ((?x102 (* (- 1.0) b2x)))
 (let ((?x109 (* ?x102 xy)))
 (let ((?x122 (+ (+ (+ (+ (* b2x y1y) (* b2y xx)) (* xy y1x)) ?x109) ?x823)))
 (> (+ ?x122 ?x116) 0.0)))))))))
(assert
 (let ((?x51 (* (- 1.0) v1y)))
 (let ((?x247 (* ?x51 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x247) 0.0))))
(assert
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x571 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x445) 0.0))))
(assert
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x823 (* ?x361 y1x)))
 (> (+ (+ (+ b2y (* (- 1.0) y1y)) (* b2x y1y)) ?x823) 0.0))))
(assert
 (let ((?x376 (* (- 1.0) v1x)))
 (let ((?x356 (* ?x376 y1y)))
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x571 y1x)))
 (let ((?x45 (* (- 1.0) b1x)))
 (let ((?x168 (* ?x45 v1y)))
 (let ((?x486 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x168) ?x445)))
 (> (+ ?x486 ?x356) 0.0)))))))))
(assert
 (let ((?x376 (* (- 1.0) v1x)))
 (let ((?x356 (* ?x376 y1y)))
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x823 (* ?x361 y1x)))
 (let ((?x102 (* (- 1.0) b2x)))
 (let ((?x11 (* ?x102 v1y)))
 (let ((?x172 (+ (+ (+ (+ (* b2x y1y) (* b2y v1x)) (* v1y y1x)) ?x11) ?x823)))
 (> (+ ?x172 ?x356) 0.0)))))))))
(assert
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x823 (* ?x361 y1x)))
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x110 (* ?x571 b2x)))
 (let ((?x45 (* (- 1.0) b1x)))
 (let ((?x339 (* ?x45 y1y)))
 (let ((?x91 (+ (+ (+ (+ (* b1x b2y) (* b1y y1x)) (* b2x y1y)) ?x339) ?x110)))
 (> (+ ?x91 ?x823) 0.0)))))))))
(assert
 (let ((?x460 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x460 0.0)))
(assert
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x204 (* ?x571 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x204) 0.0))))
(assert
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x459 (* ?x361 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x459) 0.0))))
(assert
 (let ((?x376 (* (- 1.0) v1x)))
 (let ((?x128 (* ?x376 xy)))
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x204 (* ?x571 xx)))
 (let ((?x45 (* (- 1.0) b1x)))
 (let ((?x168 (* ?x45 v1y)))
 (let ((?x715 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x168) ?x204)))
 (> (+ ?x715 ?x128) 0.0)))))))))
(assert
 (let ((?x376 (* (- 1.0) v1x)))
 (let ((?x128 (* ?x376 xy)))
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x459 (* ?x361 xx)))
 (let ((?x102 (* (- 1.0) b2x)))
 (let ((?x11 (* ?x102 v1y)))
 (let ((?x329 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x11) ?x459)))
 (> (+ ?x329 ?x128) 0.0)))))))))
(assert
 (let ((?x361 (* (- 1.0) b2y)))
 (let ((?x459 (* ?x361 xx)))
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x110 (* ?x571 b2x)))
 (let ((?x45 (* (- 1.0) b1x)))
 (let ((?x198 (* ?x45 xy)))
 (let ((?x49 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x198) ?x110)))
 (> (+ ?x49 ?x459) 0.0)))))))))
(assert
 (let ((?x45 (* (- 1.0) b1x)))
 (let ((?x168 (* ?x45 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x168) 0.0))))
(assert
 (let ((?x102 (* (- 1.0) b2x)))
 (let ((?x11 (* ?x102 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x11) 0.0))))
(assert
 (let ((?x571 (* (- 1.0) b1y)))
 (let ((?x110 (* ?x571 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x110) 0.0))))
(assert
 (let ((?x571 (* (- 1.0) b1y)))
(let ((?x110 (* ?x571 b2x)))
(let ((?x45 (* (- 1.0) b1x)))
(let ((?x168 (* ?x45 v1y)))
(let ((?x474 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x168) ?x110)))
(> (+ ?x474 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
