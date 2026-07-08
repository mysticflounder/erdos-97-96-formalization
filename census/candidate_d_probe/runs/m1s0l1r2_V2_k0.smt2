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
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x190 (* (- 1.0) v1x)))
 (let ((?x823 (* (- 1.0) R2)))
 (let ((?x321 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x823)))
 (= (+ (+ ?x321 ?x190) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* xx xx) (* xy xy)) (* (- 1.0) rho2)) 0.0))
(assert
 (let ((?x108 (* (- 1.0) rho2)))
 (let ((?x88 (* xy xy)))
 (let ((?x467 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x88) ?x108)))
 (= (+ (+ ?x467 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x108 (* (- 1.0) rho2)))
 (let ((?x88 (* xy xy)))
 (let ((?x49 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x88) ?x108)))
 (= (+ (+ ?x49 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x108 (* (- 1.0) rho2)))
 (let ((?x88 (* xy xy)))
 (let ((?x469 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x88) ?x108)))
 (= (+ (+ ?x469 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x85 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x85 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x83 (* oy oy)))
 (let ((?x256 (* (- 1.0) ?x83)))
 (let ((?x31 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x31 ?x256) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x83 (* oy oy)))
 (let ((?x256 (* (- 1.0) ?x83)))
 (let ((?x235 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x235 ?x256) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x83 (* oy oy)))
 (let ((?x256 (* (- 1.0) ?x83)))
 (let ((?x206 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x206 ?x256) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x448 (* (- 1.0) v1y)))
 (let ((?x354 (* ?x448 xy)))
 (> ?x354 0.0))))
(assert
 (let ((?x170 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x170 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x318 (* a1y v1y)))
 (> ?x318 0.0)))
(assert
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x289 (* ?x40 v1x)))
 (let ((?x471 (* ?x289 v1y)))
 (let ((?x318 (* a1y v1y)))
 (let ((?x247 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x318) ?x471)))
 (> ?x247 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x388 (* b1y v1x)))
 (let ((?x130 (* ?x388 v1y)))
 (let ((?x275 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x275 ?x130) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x278 (* b2y v1x)))
 (let ((?x340 (* ?x278 v1y)))
 (let ((?x263 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x263 ?x340) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (let ((?x280 (* (- 1.0) xy)))
 (> ?x280 0.0)))
(assert
 (> (+ (* a1y xx) (* (* (- 1.0) a1x) xy)) 0.0))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (> a1y 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> (+ (* a1x v1y) (* (* (- 1.0) a1y) v1x)) 0.0))
(assert
 (> (+ (* a1x b1y) (* (* (- 1.0) a1y) b1x)) 0.0))
(assert
 (> (+ (* a1x b2y) (* (* (- 1.0) a1y) b2x)) 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (let ((?x59 (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) (* (* (- 1.0) a1y) xx))))
 (> ?x59 0.0)))
(assert
 (let ((?x448 (* (- 1.0) v1y)))
 (let ((?x171 (* ?x448 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x171) 0.0))))
(assert
 (let ((?x161 (* (- 1.0) b1y)))
 (let ((?x74 (* ?x161 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x74) 0.0))))
(assert
 (let ((?x304 (* (- 1.0) b2y)))
 (let ((?x60 (* ?x304 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x60) 0.0))))
(assert
 (let ((?x448 (* (- 1.0) v1y)))
 (let ((?x171 (* ?x448 xx)))
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x289 (* ?x40 v1x)))
 (let ((?x25 (* (- 1.0) a1x)))
 (let ((?x373 (* ?x25 xy)))
 (let ((?x193 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x373) ?x289)))
 (> (+ ?x193 ?x171) 0.0)))))))))
(assert
 (let ((?x161 (* (- 1.0) b1y)))
 (let ((?x74 (* ?x161 xx)))
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x42 (* ?x40 b1x)))
 (let ((?x25 (* (- 1.0) a1x)))
 (let ((?x373 (* ?x25 xy)))
 (let ((?x45 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x373) ?x42)))
 (> (+ ?x45 ?x74) 0.0)))))))))
(assert
 (let ((?x304 (* (- 1.0) b2y)))
 (let ((?x60 (* ?x304 xx)))
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x481 (* ?x40 b2x)))
 (let ((?x25 (* (- 1.0) a1x)))
 (let ((?x373 (* ?x25 xy)))
 (let ((?x245 (+ (+ (+ (+ (* a1x b2y) (* a1y xx)) (* b2x xy)) ?x373) ?x481)))
 (> (+ ?x245 ?x60) 0.0)))))))))
(assert
 (let ((?x190 (* (- 1.0) v1x)))
 (let ((?x227 (* ?x190 xy)))
 (let ((?x161 (* (- 1.0) b1y)))
 (let ((?x74 (* ?x161 xx)))
 (let ((?x84 (* (- 1.0) b1x)))
 (let ((?x48 (* ?x84 v1y)))
 (let ((?x174 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x48) ?x74)))
 (> (+ ?x174 ?x227) 0.0)))))))))
(assert
 (let ((?x190 (* (- 1.0) v1x)))
 (let ((?x227 (* ?x190 xy)))
 (let ((?x304 (* (- 1.0) b2y)))
 (let ((?x60 (* ?x304 xx)))
 (let ((?x419 (* (- 1.0) b2x)))
 (let ((?x395 (* ?x419 v1y)))
 (let ((?x405 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x395) ?x60)))
 (> (+ ?x405 ?x227) 0.0)))))))))
(assert
 (let ((?x304 (* (- 1.0) b2y)))
 (let ((?x60 (* ?x304 xx)))
 (let ((?x161 (* (- 1.0) b1y)))
 (let ((?x353 (* ?x161 b2x)))
 (let ((?x84 (* (- 1.0) b1x)))
 (let ((?x475 (* ?x84 xy)))
 (let ((?x271 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x475) ?x353)))
 (> (+ ?x271 ?x60) 0.0)))))))))
(assert
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x289 (* ?x40 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x289) 0.0))))
(assert
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x42 (* ?x40 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x42) 0.0))))
(assert
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x481 (* ?x40 b2x)))
 (> (+ (+ (+ a1y (* (- 1.0) b2y)) (* a1x b2y)) ?x481) 0.0))))
(assert
 (let ((?x84 (* (- 1.0) b1x)))
 (let ((?x48 (* ?x84 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x48) 0.0))))
(assert
 (let ((?x419 (* (- 1.0) b2x)))
 (let ((?x395 (* ?x419 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x395) 0.0))))
(assert
 (let ((?x161 (* (- 1.0) b1y)))
 (let ((?x353 (* ?x161 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x353) 0.0))))
(assert
 (let ((?x84 (* (- 1.0) b1x)))
 (let ((?x48 (* ?x84 v1y)))
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x289 (* ?x40 v1x)))
 (let ((?x319 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
 (> (+ (+ ?x319 ?x289) ?x48) 0.0)))))))
(assert
 (let ((?x419 (* (- 1.0) b2x)))
 (let ((?x395 (* ?x419 v1y)))
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x289 (* ?x40 v1x)))
 (let ((?x25 (* (- 1.0) a1x)))
 (let ((?x195 (* ?x25 b2y)))
 (let ((?x34 (+ (+ (+ (+ (* a1x v1y) (* a1y b2x)) (* b2y v1x)) ?x195) ?x289)))
 (> (+ ?x34 ?x395) 0.0)))))))))
(assert
 (let ((?x161 (* (- 1.0) b1y)))
 (let ((?x353 (* ?x161 b2x)))
 (let ((?x40 (* (- 1.0) a1y)))
 (let ((?x42 (* ?x40 b1x)))
 (let ((?x25 (* (- 1.0) a1x)))
 (let ((?x195 (* ?x25 b2y)))
 (let ((?x106 (+ (+ (+ (+ (* a1x b1y) (* a1y b2x)) (* b1x b2y)) ?x195) ?x42)))
 (> (+ ?x106 ?x353) 0.0)))))))))
(assert
 (let ((?x161 (* (- 1.0) b1y)))
(let ((?x353 (* ?x161 b2x)))
(let ((?x84 (* (- 1.0) b1x)))
(let ((?x48 (* ?x84 v1y)))
(let ((?x488 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x48) ?x353)))
(> (+ ?x488 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
