
/-- LOGIC --/
theorem eval {P : Prop} {Q : Prop} : (P -> Q) -> P -> Q :=
  fun h hp => h hp

theorem eval2 {P : Prop} {Q : Prop} : (P -> Q) -> P -> Q := by
  intros h hp
  exact h hp

theorem subst {P : Prop} {Q : Prop} {R : Prop} : (P -> Q -> R) -> (P -> Q) -> P -> R :=
  fun hpqr hpq hp => hpqr hp (hpq hp)

theorem subst2 {P : Prop} {Q : Prop} {R : Prop} : (P -> Q -> R) -> (P -> Q) -> P -> R := by
  intros hpqr hpq hp
  have hq := hpq hp
  have hr := hpqr hp hq
  exact hr

/-- INDUCTIVE TYPES -/
inductive combine (A : Prop) (B : Prop) : Prop
| pair : (a : A) -> (b : B) -> combine A B
open combine

-- #check And

theorem projfst {P : Prop} {Q : Prop} : combine P Q -> P :=
  fun h => match h with
  | pair p _ => p

theorem projfst2 {P : Prop} {Q : Prop} : combine P Q -> P := by
  intro h
  cases h with
  | pair p _ => exact p

-- #check And.left

inductive choose (A : Prop) (B : Prop) : Prop
| fst : A -> choose A B
| snd : B -> choose A B
open choose

-- #check Or

theorem incsnd {P : Prop} {Q : Prop} : Q -> choose P Q :=
  fun q => snd q

theorem incsnd_fast {P : Prop} {Q : Prop} : Q -> choose P Q := snd

theorem incsnd2 {P : Prop} {Q : Prop} : Q -> choose P Q := by
  intro q
  right
  exact q

-- #check Or.inr

def neg (P : Prop) : Prop := P -> False

-- #check Not

theorem demorgan {P : Prop} {Q : Prop} : neg (choose P Q) -> combine (neg P) (neg Q) :=
  fun nhpq => pair (fun p => nhpq (fst p)) (fun q => nhpq (snd q))

theorem demorgan2 {P : Prop} {Q : Prop} : neg (choose P Q) -> combine (neg P) (neg Q) := by
  intro h
  constructor
  intro p
  have F := h (fst p)
  exact F
  intro q
  have F := h (snd q)
  exact F

/-- NATURAL NUMBERS -/

inductive nat where
| O : nat
| S (n : nat) : nat
open nat
-- #check Nat

def is_zero (x : nat) :=
  match x with
  | O => true
  | S _ => false

def add (m : nat) (n : nat) : nat :=
  match n with
  | O => m
  | S k => S (add m k)
-- #check Nat.add

infixl:65 " + " => add

theorem add_zero (m : nat) : m + O = m := by
  rfl

theorem add_succ (m : nat) (n : nat) : m + S n = S (m + n) := by
  rfl

---

theorem zero_add (m : nat) : O + m = m := by
  induction m with
  | O => rfl
  | S k hk => unfold add; rw [hk]

-- PROOF TERM WITH INDUCTION?
def build_proof (P : nat -> Prop) (BC : P O)
  (IH : (k : nat) -> P k -> P (S k)) (n : nat) : P n :=
  match n with
  | O => BC
  | S k => IH k (build_proof P BC IH k)

def apply {A : Type} {B : Type} (f : A -> B) (a1 : A) (a2 : A)
  (eq : a1 = a2) : f a1 = f a2 :=
  match eq with
  | rfl => rfl

theorem zero_add2 (m : nat) : O + m = m :=
  build_proof (fun m => O + m = m) rfl (fun p => fun hp => apply S (O + p) p hp) m

-- #check Nat.zero_add

---

theorem succ_add (m : nat) (n : nat) : S m + n = S (m + n) := by
  induction n with
  | O => rfl
  | S k hk => unfold add; rw [hk]

theorem succ_add2 (n : nat) : forall (m : nat), S m + n = S (m + n) :=
  fun m =>
  build_proof (fun n => S m + n = S (m + n))
      (rfl) (fun k IH => apply S (S m + k) (m + S k) (IH)) n

-- parameters vs. abstraction matters!

---

theorem add_comm (m : nat) (n : nat) : m + n = n + m := by
  induction n with
  | O => rw [zero_add]; rfl
  | S k hk => rw [succ_add]; rw [<- hk]; rfl

theorem add_assoc (k : nat) (m : nat) (n : nat) : k + (m + n) = (k + m) + n := by
  induction n with
  | O => rw [add_zero, add_zero]
  | S p hp => rw [add_succ, add_succ, add_succ, hp]

---

inductive vector (A : Prop) : nat -> Type
| empty : vector A O
| item : forall n : nat, A -> vector A n -> vector A (S n)
