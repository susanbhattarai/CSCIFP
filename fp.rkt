;Question1
#|
Algorithm:
If the list is empty, return
Else: append the function call with cdr of list
plus the head of list
|#
(define (reverse-general L)
  (cond
    ((null? L) '()) ;Return empty list
    ((list? (car L)) ;If head is list
      (append (reverse-general (cdr l)) (list (reverse-general (car L))))) ;If head is list, append the function call on tail with function call on head
    (else (append (reverse-general (cdr L)) (list (car L)))) ;Append the head at the end
   )
)


;Question 4
(define (min-above-min L1 L2)
  (cond
    ((null? L1) #f)
    ((null? L2) (min-val L1))
    ((< (min-val L1) (min-val L2)) #f)
    (#t (larger-number L1 (min-val L2)))
   )
)
;Helper function to find the minimum value
(define (min-val L)
  (cond
    ((null? L) #f)
    ((null? (cdr L)) (car L))
    ((not (number? (car L))) (min-val (cdr L)))
    (#t (min-val-tail (cdr L) (car L)))
  )
)

;Tail recursive min-val-tail
(define (min-val-tail L1 L2)
  (cond
    ((null? L1) L2)
    ((not (number? (car L1))) (min-val-tail (cdr L1) L2))
    ((< (car L1) L2) (min-val-tail (cdr L1) (car L1)))
    (#t (min-val-tail (cdr L1) L2))
  )
)

;Function that takes a list and number as variable and return the number larger than the number
;Larger num recursive function
(define (larger-number L1 num)
  (cond
    ((null? L1) #f)
    ((not (number? (car L1))) (larger-number (cdr L1) num))
    ((> (car L1) num) (larger-number-tail (cdr L1) num (car L1)))
    (#t (larger-number (cdr L1) num))
  )
)

;Tail recursion
(define (larger-number-tail L num high)
  (cond
    ((null? L) high)
    ((not (number? (car L))) (larger-number-tail (cdr L) num high))
    ((and (> (car L) num) (< (car L) high)) (larger-number-tail L num (car L)))
    (#t (larger-number-tail (cdr L) num high))
   )
)


