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
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(declare-fun b3y () Real)
(declare-fun b3x () Real)
(assert
 (let ((?x307 (* (- 1.0) v1x)))
 (let ((?x67 (* (- 1.0) R2)))
 (let ((?x485 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x67)))
 (= (+ (+ ?x485 ?x307) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* xx xx) (* xy xy)) (* (- 1.0) rho2)) 0.0))
(assert
 (let ((?x165 (* (- 1.0) rho2)))
 (let ((?x15 (* xy xy)))
 (let ((?x169 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x15) ?x165)))
 (= (+ (+ ?x169 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x165 (* (- 1.0) rho2)))
 (let ((?x15 (* xy xy)))
 (let ((?x267 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x15) ?x165)))
 (= (+ (+ ?x267 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x165 (* (- 1.0) rho2)))
 (let ((?x15 (* xy xy)))
 (let ((?x51 (+ (+ (+ (+ (* b3x b3x) (* b3y b3y)) (* xx xx)) ?x15) ?x165)))
 (= (+ (+ ?x51 (* (* (- 2.0) b3x) xx)) (* (* (- 2.0) b3y) xy)) 0.0)))))
(assert
 (let ((?x174 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x174 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x476 (* oy oy)))
 (let ((?x394 (* (- 1.0) ?x476)))
 (let ((?x390 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x390 ?x394) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x476 (* oy oy)))
 (let ((?x394 (* (- 1.0) ?x476)))
 (let ((?x343 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x343 ?x394) (* (* 2.0 b2y) oy)) 0.0)))))
(assert
 (let ((?x476 (* oy oy)))
 (let ((?x394 (* (- 1.0) ?x476)))
 (let ((?x377 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b3x) (* (- 1.0) (* b3x b3x))) (* (- 1.0) (* b3y b3y)))))
 (>= (+ (+ ?x377 ?x394) (* (* 2.0 b3y) oy)) 0.0)))))
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
 (let ((?x119 (* (- 1.0) v1y)))
 (let ((?x423 (* ?x119 xy)))
 (> ?x423 0.0))))
(assert
 (let ((?x144 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x144 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x299 (* b1y v1x)))
 (let ((?x148 (* ?x299 v1y)))
 (let ((?x92 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x92 ?x148) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x454 (* b2y v1x)))
 (let ((?x151 (* ?x454 v1y)))
 (let ((?x405 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x405 ?x151) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (* b3y v1y) 0.0))
(assert
 (let ((?x386 (* b3y v1x)))
 (let ((?x438 (* ?x386 v1y)))
 (let ((?x445 (+ (+ (* v1y v1y) (* (* (- 1.0) b3x) (* v1y v1y))) (* (* (- 1.0) b3y) v1y))))
 (> (+ ?x445 ?x438) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b3x) (* v1y v1y)) (* (* b3y v1x) v1y)) 0.0))
(assert
 (let ((?x297 (* (- 1.0) xy)))
 (> ?x297 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (> (+ (* b3y xx) (* (* (- 1.0) b3x) xy)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> b3y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b3y v1x) (* (* (- 1.0) b3x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (> (+ (* b1x b3y) (* (* (- 1.0) b1y) b3x)) 0.0))
(assert
 (> (+ (* b2x b3y) (* (* (- 1.0) b2y) b3x)) 0.0))
(assert
 (let ((?x407 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x407 0.0)))
(assert
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x244 (* ?x9 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x244) 0.0))))
(assert
 (let ((?x91 (* (- 1.0) b2y)))
 (let ((?x492 (* ?x91 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x492) 0.0))))
(assert
 (let ((?x381 (* (- 1.0) b3y)))
 (let ((?x349 (* ?x381 xx)))
 (> (+ (+ (+ b3y (* (- 1.0) xy)) (* b3x xy)) ?x349) 0.0))))
(assert
 (let ((?x307 (* (- 1.0) v1x)))
 (let ((?x40 (* ?x307 xy)))
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x244 (* ?x9 xx)))
 (let ((?x152 (* (- 1.0) b1x)))
 (let ((?x133 (* ?x152 v1y)))
 (let ((?x137 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x133) ?x244)))
 (> (+ ?x137 ?x40) 0.0)))))))))
(assert
 (let ((?x307 (* (- 1.0) v1x)))
 (let ((?x40 (* ?x307 xy)))
 (let ((?x91 (* (- 1.0) b2y)))
 (let ((?x492 (* ?x91 xx)))
 (let ((?x316 (* (- 1.0) b2x)))
 (let ((?x1014 (* ?x316 v1y)))
 (let ((?x247 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x1014) ?x492)))
 (> (+ ?x247 ?x40) 0.0)))))))))
(assert
 (let ((?x307 (* (- 1.0) v1x)))
 (let ((?x40 (* ?x307 xy)))
 (let ((?x381 (* (- 1.0) b3y)))
 (let ((?x349 (* ?x381 xx)))
 (let ((?x31 (* (- 1.0) b3x)))
 (let ((?x159 (* ?x31 v1y)))
 (let ((?x241 (+ (+ (+ (+ (* b3x xy) (* b3y v1x)) (* v1y xx)) ?x159) ?x349)))
 (> (+ ?x241 ?x40) 0.0)))))))))
(assert
 (let ((?x91 (* (- 1.0) b2y)))
 (let ((?x492 (* ?x91 xx)))
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x486 (* ?x9 b2x)))
 (let ((?x152 (* (- 1.0) b1x)))
 (let ((?x473 (* ?x152 xy)))
 (let ((?x139 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x473) ?x486)))
 (> (+ ?x139 ?x492) 0.0)))))))))
(assert
 (let ((?x381 (* (- 1.0) b3y)))
 (let ((?x349 (* ?x381 xx)))
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x329 (* ?x9 b3x)))
 (let ((?x152 (* (- 1.0) b1x)))
 (let ((?x473 (* ?x152 xy)))
 (let ((?x393 (+ (+ (+ (+ (* b1x b3y) (* b1y xx)) (* b3x xy)) ?x473) ?x329)))
 (> (+ ?x393 ?x349) 0.0)))))))))
(assert
 (let ((?x381 (* (- 1.0) b3y)))
 (let ((?x349 (* ?x381 xx)))
 (let ((?x91 (* (- 1.0) b2y)))
 (let ((?x415 (* ?x91 b3x)))
 (let ((?x316 (* (- 1.0) b2x)))
 (let ((?x470 (* ?x316 xy)))
 (let ((?x352 (+ (+ (+ (+ (* b2x b3y) (* b2y xx)) (* b3x xy)) ?x470) ?x415)))
 (> (+ ?x352 ?x349) 0.0)))))))))
(assert
 (let ((?x152 (* (- 1.0) b1x)))
 (let ((?x133 (* ?x152 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x133) 0.0))))
(assert
 (let ((?x316 (* (- 1.0) b2x)))
 (let ((?x1014 (* ?x316 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x1014) 0.0))))
(assert
 (let ((?x31 (* (- 1.0) b3x)))
 (let ((?x159 (* ?x31 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b3y)) (* b3y v1x)) ?x159) 0.0))))
(assert
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x486 (* ?x9 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x486) 0.0))))
(assert
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x329 (* ?x9 b3x)))
 (> (+ (+ (+ b1y (* (- 1.0) b3y)) (* b1x b3y)) ?x329) 0.0))))
(assert
 (let ((?x91 (* (- 1.0) b2y)))
 (let ((?x415 (* ?x91 b3x)))
 (> (+ (+ (+ b2y (* (- 1.0) b3y)) (* b2x b3y)) ?x415) 0.0))))
(assert
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x486 (* ?x9 b2x)))
 (let ((?x152 (* (- 1.0) b1x)))
 (let ((?x133 (* ?x152 v1y)))
 (let ((?x479 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x133) ?x486)))
 (> (+ ?x479 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(assert
 (let ((?x381 (* (- 1.0) b3y)))
 (let ((?x418 (* ?x381 v1x)))
 (let ((?x9 (* (- 1.0) b1y)))
 (let ((?x329 (* ?x9 b3x)))
 (let ((?x152 (* (- 1.0) b1x)))
 (let ((?x133 (* ?x152 v1y)))
 (let ((?x350 (+ (+ (+ (+ (* b1x b3y) (* b1y v1x)) (* b3x v1y)) ?x133) ?x329)))
 (> (+ ?x350 ?x418) 0.0)))))))))
(assert
 (let ((?x381 (* (- 1.0) b3y)))
 (let ((?x418 (* ?x381 v1x)))
 (let ((?x91 (* (- 1.0) b2y)))
 (let ((?x415 (* ?x91 b3x)))
 (let ((?x316 (* (- 1.0) b2x)))
 (let ((?x1014 (* ?x316 v1y)))
 (let ((?x108 (+ (+ (+ (+ (* b2x b3y) (* b2y v1x)) (* b3x v1y)) ?x1014) ?x415)))
 (> (+ ?x108 ?x418) 0.0)))))))))
(assert
 (let ((?x91 (* (- 1.0) b2y)))
(let ((?x415 (* ?x91 b3x)))
(let ((?x9 (* (- 1.0) b1y)))
(let ((?x486 (* ?x9 b2x)))
(let ((?x441 (+ (+ (+ (* b1x b2y) (* b1y b3x)) (* b2x b3y)) (* (* (- 1.0) b1x) b3y))))
(> (+ (+ ?x441 ?x486) ?x415) 0.0)))))))
(check-sat)
