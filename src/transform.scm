(define-library
  (epsilon transform)
  (import
    scheme
    r7rs
    srfi-2)
  (export
    %fail
    %identity
    %unit
    %bind
    %nothing
    *alternative
    *sequence
    *maybe
    *star
    *plus
    *is
    *not
    *end)

  (begin
    ;  -> 𝒙 -> ⊥
    ;  => ⊥
    (define ((%fail) input)
      #f)

    ; 𝑧 -> 𝒙 -> 𝑧.𝒙
    ; 𝑧 => 𝑧ꜛ
    (define ((%unit value) input)
      (cons value input))

    ;  -> 𝒙 -> ∅.𝒙
    ;  => ∅ꜛ
    (define (%nothing)
      (%unit '()))

    ;  -> 𝒙 -> 𝒙 ∨ ⊥
    ;  => 𝑥ꜛ ∨ ⊥
    (define ((%identity) input)
      (if (null? input) #f input))

    ; 𝑎 𝑏' => 𝑧ᵇ | 𝑏'𝑧ᵃ ∨ ⊥
    (define ((%bind parser combinator) input)
      (and-let*
        ((result (parser input)))
        ((combinator (car result)) (cdr result))))

    ; 𝑎 => ¬𝑧ᵃ ∴ ∅ꜛ ∨ ⊥
    (define ((*not parser) input)
      (and
        (not (parser input))
        ((%nothing) input)))

    ; 𝑎 𝑏.. => 𝑧ᵃ ∨ 𝑧ᵇ.. ∨ ⊥
    (define ((*alternative parser . parsers) input)
      (or
        (parser input)
        (and
          (not (null? parsers))
          ((apply *alternative parsers) input))))

    ; 𝑎 𝑏.. => 𝑧ᵃ ∧ 𝑧ᵇ.. ∨ ⊥
    (define (*sequence parser . parsers)
      (%bind
        parser
        (lambda (first)
          (%bind
            (if (null? parsers) (%nothing)
              (apply *sequence parsers))
            (lambda (rest)
              (%unit (cons first rest)))))))

    ; 𝑓 𝑦.. => 𝑓𝑥𝑦.. ∴ 𝑥ꜛ ∨ ⊥
    (define (*is predicate . args)
      (%bind
        (%identity)
        (lambda (value)
          (if (apply predicate value args)
            (%unit value)
            (%fail)))))

    ; 𝑎 => 𝑧ᵃ ∨ ∅ꜛ
    (define (*maybe parser)
      (*alternative parser (%nothing)))

    ; 𝑎 => 𝑧ᵃ+ ∨ ∅ꜛ
    (define (*star parser)
      (*maybe (*plus parser)))

    ; 𝑎 => 𝑧ᵃ ∧ 𝑧ᵃ* ∨ ⊥
    (define (*plus parser)
      (*sequence parser (*star parser)))

    ;  => ¬𝑥 ∴ ∅ꜛ ∨ ⊥
    (define (*end)
      (*not (%identity)))))
