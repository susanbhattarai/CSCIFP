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

;Question2(All Test cases passed)
(define (sum-up-numbers-simple L)
  (cond
    ((null? L) 0);Return 0 if null
    ((number? (car L)) (+ (car L) (sum-up-numbers-simple (cdr L))));Return the sum of func and head
    (else (sum-up-numbers-simple (cdr L)));Ignore if atom is non-integer
  )
)

;Question3(All test cases passed)
(define (sum-up-numbers-general L)
  (cond
    ((null? L) 0);Return 0 if null
    ((number? (car L)) (+ (car L) (sum-up-numbers-general (cdr L))));Return the sum of func and head
    ((list? (car L)) (+ (sum-up-numbers-general (car L)) (sum-up-numbers-general (cdr L))));Case when head is list
    (else (sum-up-numbers-general (cdr L)));Ignore if atom is non-integer
  )
)
    
;Question 4(All test cases passed)
(define (min-above-min L1 L2)
  (cond
    ((null? L1) #f);if L1 is null, return #f
    ((null? L2) (min-val L1));If L2 is null, return the min of L1
    (#t (larger-number L1 (min-val L2)));Else, return the larger-number function
  )
)

;Helper function to find the minimum value
(define (min-val L)
  (cond
    ((null? L) #f);If empty, return #f
    ((not (number? (car L))) (min-val (cdr L)));If head not num, return with rest of list
    ((null? (cdr L)) (car L));If rest of list is null, return head
    (#t (min-val-tail (cdr L) (car L)))
  )
)

;Tail recursive implementation for  min-val
(define (min-val-tail L num)
  (cond
    ((null? L) num);Checks null
    ((not (number? (car L))) (min-val-tail (cdr L) num));Check whether the head is num
    ((< (car L) num) (min-val-tail (cdr L) (car L)));Main case to check if head is greater than num
    (#t (min-val-tail (cdr L) num));Last condition
  )
)

;Function that takes a list and number as variable and return the number larger than the number
;Larger num recursive function
(define (larger-number L1 num)
  (cond
    ((null? L1) #f);If empty, return #f
    ((not (number? (car L1))) (larger-number (cdr L1) num));If head not a number, return the func with rest of list
    ((> (car L1) num) (larger-number-tail (cdr L1) num (car L1)));If you find a number greater than num, return the tail recursive function
    (#t (larger-number (cdr L1) num));Else, base case
  )
)

;Tail recursion implementation for helper function larger-number
(define (larger-number-tail L num high)
  (cond
    ((null? L) high); If empty, return high
    ((not (number? (car L))) (larger-number-tail (cdr L) num high));If head not number, return the function with rest of head
    ((and (> (car L) num) (< (car L) high)) (larger-number-tail L num (car L)));If the head is greater than num and less than high, it's new high
    (#t (larger-number-tail (cdr L) num high)); Return the func with rest of list
  )
)


