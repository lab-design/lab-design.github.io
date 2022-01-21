Require Export syntax.
Require Export config.

(* is_equal_loc checks whether two naturals are equal or not. *)
Theorem is_equal_loc : forall n m : nat, 
	{n = m} + {n <> m}.
Proof.
	intros n.
	induction n as [|n'].
	- (* n = 0 *)
	intros m.
	destruct m as [|m'].
	+ (* m = 0 *)
	left. reflexivity.
	+ (* m = S m' *)
	right. intros contra. inversion contra.
	- (* n = S n' *)
	intros m.
	destruct m as [|m'].
	+ (* m = 0 *)
	right. intros contra. inversion contra.
	+ (* m = S m' *) 
	destruct IHn' with (m := m') as [eq | neq].
	left. apply f_equal.  apply eq.
	right. intros Heq. inversion Heq as [Heq']. apply neq. apply Heq'.
	Defined. 

(* is_equal_id checks whether two ids are equal or not. *)
Theorem is_equal_id : forall id1 id2 : id, 
	{id1 = id2} + {id1 <> id2}.
Proof.
	intros.
	destruct id1.
	destruct id2.
	destruct (eq_nat_dec n n0).
	left.
	rewrite -> e.
	reflexivity.
	right.
	intros contra.
	inversion contra.
	apply n1.
	apply H0.
	Qed.


Hypothesis is_equal_act : forall a1 a2 : act, {a1 = a2}+{a1 <> a2}.

Fixpoint remove (a : act) (t : list act) : list act :=
    match t with
		| nil => nil
		| a'::t' => if (is_equal_act a a') then remove a t' else a'::(remove a t')
    end.

Inductive is_subset (t1 : list act) (t2 : list act) : bool -> Prop :=
	| nil_t1 : t1 = nil ->
		is_subset t1 t2 true
	| non_empty_t1 : forall t'2 t''2,
		t2 = t'2 ++ t1 ++ t''2 -> is_subset t1 t2 true.

Variable A : Type.

(* snoc appends an element x to the list x. *)
Fixpoint snoc {A:Type} (l : list A) (x : A) : list A :=
	match l with
		| nil    => x :: nil
		| h :: t => h :: snoc t x
end.

(* This hypothesis says that two expressions denoted by e1 and e2 are either equal or not equal. *)
Hypothesis is_equal_exp : forall e1 e2 : exp, {e1 = e2} + {e1 <> e2}.

Fixpoint in_store (e:exp) (Sr:store) : bool :=
    match Sr with
		| nil => false
		| e' :: Sr' => match is_equal_exp e e' with 
			| left _ => true
			| right _ => in_store e (Sr')
end
end.

Fixpoint intersect (Sr : store) (Sr' : store) : store :=
	match Sr with 
		| nil => nil
		| e :: S' =>  if (in_store e Sr') then (e :: intersect S' Sr') else (intersect S' Sr')
end.

Hypothesis is_equal_dec : forall x y : A, x = y.

(* This hypothesis states that two global configuration K and K' are equal at global level. *)
Hypothesis equal_global : forall (K K' : glb_conf), K = K'.

(* This hypothesis states that two locations l and l' are equal. *)
Hypothesis equal_loc : forall (l l': loc), l = l'.

(* This hypothesis says that two id idn and idn' are equal. *)
Hypothesis equal_id : forall (idn idn' : id), idn = idn'.

(* This hypothesis states that two expressions are equal. *)
Hypothesis equal_exp : forall (e e' : exp), e = e'.

(* This hypothesis represents two stores are equal. *)
Hypothesis equal_store : forall S1 S1' : store, S1 = S1'.

(* This hypothesis states that two naturals are equal. *)
Hypothesis equal_nat : forall (n1 n2: nat) , n1 = n2.

(* This hypothesis states that two trace are equal. *)
Hypothesis equal_trace : forall (tr tr': trace), tr = tr'.

(* This hypothesis states that two id are not equal. *)
Hypothesis not_equal_id : forall (idn idn': id), idn <> idn'.

(* This axiom states that instance map I contains (iden, i). *)
Axiom in_I : forall I (iden i: id), In (iden, i) I.

(* This hypothesis states that comparison between two naturals *)
Hypothesis less_than_nat : forall n n' : nat, 
	n < n'.

(* This axiom says that two set of traces are have subset relation. *)
Axiom subset_trace : forall t t', 
	is_subset t t' true.

(* This axiom states that global configuration K contains capsule configuration. *)
Axiom in_K : forall idn' e' Q' S' C' F' I' K,
	In (Sigma idn' (e' :: Q') S' (C' , F') I') K.

(* This axiom states that state map F contains (f, l'). *)
Hypothesis in_F : forall (f:id) (l': nat) (F : st_map) , In (f, l') F.

(* This axiom states that trace tr contains a. *)
Hypothesis in_tr : forall (a:act) (tr:trace) , In a tr.

(* This axiom states that store Sr contains e. *)
Hypothesis in_Sr : forall (e : exp) (Sr : store) , In e Sr.

(* This hypothesis says that two acts denoted by a1 and a2 are equal. *)
Hypothesis equal_act : forall a1 a2 : act, a1 = a2.

(** ********************* **)
(** SUBSTITUTION **)
(** ********************* **)

(* subst states that we can substitute some given expression [e1] for occurrences of 
some variable [x] in another expression [e2]. *)

Reserved Notation "'[' x ':=' e1 ']' e2" (at level 20).

Fixpoint subst (x:id)  (e1 : exp) (e2 : exp) : exp :=
	match e2 with
		| (ref_exp e) => ref_exp ([x:=e1] e)
		| (deref_exp e) => deref_exp ([x:=e1] e)
		| (ref_asgn_exp e e') => ref_asgn_exp ([x:=e1] e) ([x:=e1] e')
		| (var_exp x') =>  if eq_id_dec x x' then e1 else e2
		| (st_asgn_exp self f e)  => st_asgn_exp self f ([x:=e1] e)
		| (self_inv_exp self p e) => self_inv_exp self p ([x:=e1]e)
		| (super_inv_exp super p e) => super_inv_exp super p ([x:=e1]e)
		| (let_exp y e e' ) => let_exp y ([x:=e1]e) (if eq_id_dec x y then e' else ([x:=e1]e'))
		| (st_read_exp self f) =>  st_read_exp self f 
		| (val_exp idn) =>  val_exp idn
		| (loc_exp _) => e2
		| (inv_exp i p e alpha) => inv_exp i p ([x:=e1]e) alpha
		| (res_exp l e idn p) => res_exp l ([x:=e1] e) idn p
		| unit_exp => unit_exp
		| owe_exp => owe_exp
		| trans_exp => trans_exp
		| unres_exp => unres_exp
	end
	where "'[' x ':=' e1 ']' e2" := (subst x e1 e2).


(* We use [store_lookup n st] to retrieve the value of the reference
    cell at location [n] in the store [Sr].  Note that we must give a
    default value to [nth] in case we try looking up an index which is
    too large. *)

Definition store_lookup (n : nat) (Sr : store) := 
	nth n Sr unit_exp.

(* This lemma states that length of the updated list with a single element added to its 
end is equal to the successor of the length of the list without adding that element. *)
Lemma length_snoc : forall A (l : list A) x,
	length (snoc l x) = S (length l).
Proof.
	induction l; intros; [ auto | simpl; rewrite IHl; auto ].
	Qed.

(* This lemma states that position is preserved for the location n even 
if the element is added to the list. *)
Lemma nth_lt_snoc : forall A (l : list A) x d n,
	n < length l ->
	nth n l d = nth n (snoc l x) d.
Proof.
	induction l as [|a l']; intros; try solve by inversion.
	destruct n; auto.
	simpl. apply IHl'.
	simpl in H. apply lt_S_n in H. assumption.
	Qed.

(* This lemma states that if n is equal to the length of the list then adding
an element at the end gives that element when nth position is retrived. *) 
Lemma nth_eq_snoc : forall A (l : list A) x d,
	nth (length l) (snoc l x) d = x.
Proof.
	induction l; intros; [ auto | simpl; rewrite IHl; auto ].
	Qed.

(* replace updates the store by replacing the contents of a cell at a particular index. *)
Fixpoint replace {A : Type} (n : nat) (x : A) (l : list A) : list A :=
	match l with
	| nil    => nil
	| h :: t => 
		match n with
		| O    => x :: t
		| S n' => h :: replace n' x t
	end
	end.

(* remove function removes an expression e from the store S at location l. *)
Fixpoint remove_loc (e : exp) (l : nat) (S : store) : store :=
	match S with 
		| nil => nil
		| e1 :: S1 => 
			match l with 
				| O => e :: S1
				| S n' => e1 :: (remove_loc e l S1)
			end
	end.

(* This lemma states replacing any element in a nil list gives a nil list. *)
Lemma replaceNil : forall A n (x : A),
	replace n x nil = nil.
Proof.
	destruct n; auto.
	Qed.

(* This lemma states that replacing any element in the list does 
not change the length of the list. *)
Lemma length_replace : forall A n x (l : list A),
	length (replace n x l) = length l.
Proof with auto.
	intros A n x l. generalize dependent n.
	induction l; intros n.
	destruct n...
	destruct n...
	simpl. rewrite IHl...
	Qed.

(* This lemma states that if index l is less than length of the list S then 
looking up for the location l will give the replaced element. *)
Lemma lookup_replace_eq : forall l e S,
	l < length S -> 
	store_lookup l (replace l e S) = e.
Proof with auto.
	intros l e S.
	unfold store_lookup.
	generalize dependent l.
	induction S as [|e' S']; intros l Hlen. 
	- (* S = [] *) 
	inversion Hlen. 
	- (* S = e' :: S' *)
	destruct l; simpl...
	apply IHS'. simpl in Hlen. omega.
	Qed.

(* This lemma states that if two locations l1 and l2 are not equal then looking up
for l1 in the updated store where l2 is replaced is same as looking up at location 
l1 in the old store. *)
Lemma lookup_replace_neq : forall l1 l2 e S,
	l1 <> l2 ->
	store_lookup l1 (replace l2 e S) = store_lookup l1 S.
Proof with auto.
	unfold store_lookup.
	induction l1 as [|l1']; intros l2 e S Hneq.
	- (* l1 = 0 *)
	destruct S. 
	+ (* S = [] *) rewrite replaceNil...
	+ (* S = _ :: _ *) destruct l2... contradict Hneq...
	- (* l1 = S l1' *)
	destruct S as [|e2 S2].
	+ (* S = [] *) destruct l2...
	+ (* S = e2 :: S2 *)
	destruct l2...
	simpl; apply IHl1'...
	Qed.

(** FREE OCCURENCE **)

(* A variable [x] appears free in an expression e if it contains some occurrence of x that is not under an abstraction labelled x. *)
Inductive appears_free_in : id -> exp -> Prop :=
	| afi_var : forall x ,
		appears_free_in x (var_exp x) 
	| afi_let1 : forall x x1 e1 e2,
		appears_free_in x e1 ->
		appears_free_in x (let_exp x1 e1 e2)
	| afi_let2 : forall x x1 e1 e2,
		x1 <> x ->
		appears_free_in x e2 ->
		appears_free_in x (let_exp x1 e1 e2)
	| afi_st_read1 : forall x self f,
		appears_free_in x (st_read_exp self f)
	| afi_st_read2 : forall self f,
		appears_free_in self (st_read_exp self f)
	| afi_st_asgn1 : forall x self f e,
		x <> f ->
		appears_free_in x e ->
		appears_free_in x (st_asgn_exp self f e)
	| afi_st_asgn2 : forall self f e,
		appears_free_in self (st_asgn_exp self f e)
	| afi_self_inv1 : forall x self p e,
		appears_free_in x e ->
		appears_free_in x (self_inv_exp self p e)
	| afi_self_inv2 : forall self p e,
		appears_free_in self (self_inv_exp self p e)
	| afi_super_inv1 : forall x super p e,
		appears_free_in x e ->
		appears_free_in x (super_inv_exp super p e)
	| afi_super_inv2 : forall super p e,
		appears_free_in super (super_inv_exp super p e)
	| afi_super_inv3 : forall self super p e,
		appears_free_in self (super_inv_exp super p e)
	| afi_val : forall x,
		appears_free_in x (val_exp x)
	| afi_inv1 : forall i x e p alpha, 
		appears_free_in x e ->
		appears_free_in x (inv_exp i p e alpha)
	| afi_inv2 : forall i e p alpha,
		appears_free_in i (inv_exp i p e alpha)
	| afi_ref : forall x e,
		appears_free_in x e ->
		appears_free_in x (ref_exp e)
	| afi_deref : forall x e,
		appears_free_in x e ->
		appears_free_in x (deref_exp e)
	| afi_ref_asgn1 : forall x e1 e2,
		appears_free_in x e1 -> 
		appears_free_in x (ref_asgn_exp e1 e2)
	| afi_ref_asgn2 : forall x e1 e2,
		appears_free_in x e2 -> 
		appears_free_in x (ref_asgn_exp e1 e2)
	| afi_unres : forall e x ,
		appears_free_in x e
	| afi_res1 : forall x e l d i,
		appears_free_in x e ->
		appears_free_in x (res_exp l e i d)
	| afi_res2 : forall x e l d i,
		appears_free_in x (loc_exp l) ->
		appears_free_in x (res_exp l e i d)
	| afi_loc : forall x l,
	appears_free_in x (loc_exp l).

Definition var_ty_env := partial_map ty.

Definition store_ty_env := list varl_ty.


Definition empty {A:Type} : partial_map A := (fun _ => None). 

Definition extend {A:Type} (Gamma : partial_map A) (x:id) (T : A) :=
	fun x' => if eq_id_dec x x' then Some T else Gamma x'.

(* This lemma states that if x extends the typing context ctxt then id x is assigned some type T 
if both ids are equal. *)
Lemma extend_eq : forall A (ctxt: partial_map A) x T,
	(extend ctxt x T) x = Some T.
Proof.
	intros. unfold extend. rewrite eq_id. auto.
	Qed.

(* This lemma states that if x2 extends typing context ctxt and we are trying to assign type to 
x1 where x1 is not equal to x2 then x1 will be assigned some other type in typing context ctxt. *)
Lemma extend_neq : forall A (ctxt: partial_map A) x1 T x2,
	x2 <> x1 ->
	(extend ctxt x2 T) x1 = ctxt x1.
Proof.
	intros. unfold extend. rewrite neq_id; auto.
	Qed.

(* The [store_Tlookup] function retrieves the type at a particular index. *)
Definition store_Tlookup (n:nat) (Pi:store_ty_env) :=
	nth n Pi (unit_ty).

(* Extending Store Typing *)

(* Evidently, since the store can increase in size during evaluation,
   we need to allow the store typing to grow as well.  This motivates
   the following definition.  We say that the store type [Pi']
   _extends_ [Pi] if [Pi'] is just [Pi] with some new types added to
   the end. *)

Lemma extend_shadow : forall A (ctxt: partial_map A) t1 t2 x1 x2,
	extend (extend ctxt x2 t1) x2 t2 x1 = extend ctxt x2 t2 x1.
Proof with auto.
	intros. unfold extend. destruct (eq_id_dec x2 x1)...
	Qed.

Inductive extends : store_ty_env -> store_ty_env -> Prop :=
	| extends_nil  : forall Pi', 
		 extends Pi' nil
	| extends_cons : forall x Pi' Pi, 
		extends Pi' Pi -> 
		extends (x::Pi') (x::Pi).

(* This lemma states looking up a type in an extended store typing yields the same result as in the original. *)
	Lemma extends_lookup : forall l Pi Pi',
	l < length Pi ->
	extends Pi' Pi -> 
	store_Tlookup l Pi' = store_Tlookup l Pi.
Proof with auto.
	intros l Pi Pi' Hlen H. 
	generalize dependent Pi'. generalize dependent l.
	induction Pi as [|a Pi2]; intros l Hlen Pi' HPi'.
	 - (* nil *) inversion Hlen.
	 - (* cons *) unfold store_Tlookup in *.
	destruct Pi'.
	+ (* Pi' = nil *) inversion HPi'.
	+ (* Pi' = a' :: Pi'2 *)
	inversion HPi'; subst.
	destruct l as [|l'].
	* (* l = 0 *) auto.
	* (* l = S l' *) simpl. apply IHPi2...
	simpl in Hlen; omega.
	Qed.

(* This lemma says that if [Pi'] extends [Pi], the length of [Pi'] is at least that of [Pi]. *)
Lemma length_extends : forall l Pi Pi',
	l < length Pi ->
	extends Pi' Pi ->
	l < length Pi'.
Proof with eauto.
	intros. generalize dependent l. induction H0; intros l Hlen.
	inversion Hlen.
	simpl in *.
	destruct l; try omega.
	apply lt_n_S. apply IHextends. omega.
	Qed.

(* This lemma says that [snoc Pi T] extends [Pi], and [extends] is reflexive.*)
Lemma extends_snoc : forall Pi T,
	extends (snoc Pi T) Pi.
Proof with auto.
	induction Pi; intros T...
	simpl...
	apply extends_nil.
	simpl...
	apply extends_cons.
	apply IHPi.
	Qed.

(* This lemma states that store typing Pi extends itself. *)
Lemma extends_refl : forall Pi,
	extends Pi Pi.
Proof.
	induction Pi; auto.
	apply extends_nil.
	simpl...
	apply extends_cons.
	apply IHPi.
	Qed.

Inductive design_of : id -> dsgn -> Prop :=
	| dsgn_of : forall C C' im im' des fs procs CT,
		In (cap_decl C im C' im' des fs procs)  CT ->
		design_of C des.

Inductive proc_body1 : id -> id -> proc -> Prop :=
	| p_body1 : forall C e C' im im' des fs T' T x procs p CT,
		In (cap_decl C im C' im' des fs ((proc_decl T' p (form_decl T x) e)::procs)) CT ->
		proc_body1 C p (proc_decl T' p (form_decl T x) e).

Inductive proc_body2 : id -> id -> proc -> Prop :=
	| p_body2 : forall C C' p T' T x e,
		~ (proc_body1 C p (proc_decl T' p (form_decl T x) e)) ->
		proc_body1 C' p (proc_decl T' p (form_decl T x) e) ->
		proc_body2 C p (proc_decl T' p (form_decl T x) e).

(* proc_body decides which relation to choose either proc_body1 or proc_body2 based on the dynamic semantic *)
Inductive proc_body : id -> id -> proc -> Prop :=
	| proc_b1 : forall C T' p T x e,
		proc_body1 C p (proc_decl T' p (form_decl T x) e) ->
		proc_body C p (proc_decl T' p (form_decl T x) e)
	| proc_b2 : forall C C' T' p T x e,
		proc_body2 C p (proc_decl T' p (form_decl T x) e) ->
		proc_body C' p (proc_decl T' p (form_decl T x) e).

Inductive procedures_of : id -> list proc -> Prop :=
	| proc_decl_of : forall C C' im im' des fs procs procs' CT,
		In (cap_decl C im C' im' des fs procs) CT ->
		procedures_of C' procs' ->
		procedures_of C (app procs procs').

Inductive states_of : id -> list state -> Prop :=
	| st_of : forall C C' im im' des procs fs fs' CT,
         In (cap_decl C im C' im' des fs procs) CT  ->
         states_of C' fs' ->
         states_of C' (app fs fs').

(* unres_value is a function which states that a value v is a unresolved value or not. *)
Inductive unres_value : exp -> Prop :=
	| unres : forall v,
		value v ->
		v = unres_exp ->
		unres_value v.

(* trans_value is a function which states that a value v is a transferred location value. *)
Inductive trans_value : exp -> Prop :=
	| trans : forall v,
		value v ->
		v = trans_exp ->
		trans_value v.

Inductive fresh_loc : nat -> Prop :=
	| freshL : forall l sigma' idn Q Sr C F I K,
		sigma' = (Sigma idn Q Sr (C, F) I) ->
		In sigma' K ->
		~ In (loc_exp l) Sr ->
		fresh_loc l.

(* id_in_glb_conf checks whether a capsule identifier idn is present in the global configuration or not. *)
Fixpoint id_in_glb_conf (idn : id) (K : glb_conf) : bool :=
	match K with 
		| nil => false
		| (Sigma idn' Q' Sr' (C', F') I')::K' => 
			match is_equal_id idn idn' with 
				| left _ => true
				| right _ => id_in_glb_conf idn (K')
		end
end.

(* fresh_id represents fresh identifier idn which is not present in the global configuration. *)
Inductive fresh_id : id -> Prop :=
	| fresh_l : forall K idn,
		id_in_glb_conf idn K = false -> fresh_id idn.

(** Rules to create initial configuration of Panini programs **)

(* This represents the instantiate rule to create initial configurations of Panini programs. *)
Inductive instantiate : id -> inst -> cap_conf -> Prop :=
  | instan :  forall i f l T idn idn' C C' im im' insta w fs procs sigma Sr F CT,
		fresh_id idn' ->
		In (cap_decl C im C' im' (dsgn_decl insta w) fs procs) CT ->
		states_of C fs ->
		In (st_decl T f) fs ->
		fresh_loc l ->
		In (f,l) F ->
		Sr = nil ->
		(snoc Sr unit_exp) = Sr ->
		store_lookup l Sr = unit_exp ->
		sigma = (Sigma idn' nil Sr (C , F) nil) ->
		instantiate idn (inst_decl (C) i) sigma.

(* This represents the instantiation rec rule to create initial configurations of Panini programs. *)
Inductive instantiation_rec : glb_conf -> id -> inst -> glb_conf -> Prop :=
	| instan_rec : forall f i i' T idn idn' C C' im im' insta w fs procs sigma sigma' Sr Sr' I F  I' F' K K' K'' CT,
		In (cap_decl C im C' im' (dsgn_decl insta w) fs procs) CT  ->
		In (st_decl T f) fs ->
		design_of C (dsgn_decl insta w) ->
		instantiate idn (inst_decl C i) (Sigma idn' nil Sr' (C' , F') I') -> 
		sigma' = (Sigma idn' nil Sr' (C' , F') I') ->
		sigma = (Sigma idn nil Sr (C , F) I) -> 
		In (i, idn') I ->
		In sigma' K' ->
		In sigma K' ->
		In (inst_decl C' i) insta ->
		K' = (sigma :: sigma' :: K) ->
		instantiation_rec K' idn' (inst_decl C' i') K'' ->
		instantiation_rec K idn (inst_decl C i) K''.

(* This represents the instantiation rec base rule to create initial configurations of Panini programs. *)
Inductive instantiation_rec_base : glb_conf -> id -> inst -> glb_conf -> Prop :=
	| instan_rec_base : forall i' i'' idn idn' C C' sigma sigma' Q Q' Sr Sr' I F I' F' K K',
		design_of C' (dsgn_decl [ ] [ ]) -> 
		sigma' = (Sigma idn' Q' Sr' (C' , F') I') -> 
		instantiate idn (inst_decl C i') sigma' ->
		sigma = (Sigma idn Q Sr (C , F) I) -> 
		In (i'', idn') I ->
		K' = (sigma :: sigma' :: K) ->
		instantiation_rec_base K idn (inst_decl C' i') K'.

(* This represents the wireup rule to create initial configurations of Panini programs. *)
Inductive wire_up : id -> wire -> cap_conf -> Prop :=
	| w_up : forall i js js_1 js_2 h H idn C C' im im_1 im_2 im' fs des procs C_i I_i F j I Q Q_i Q_j Sr I_j F_j C_j Sr_j sigma sigma_i sigma_i' sigma_j idn_j F_i Sr_i idn_i K CT,
		sigma = (Sigma idn Q Sr (C , F) I) ->
		In sigma K ->
		In (i, idn_i) I ->
		sigma_i = (Sigma idn_i Q_i Sr_i (C_i , F_i) I_i) -> 
		In sigma_i K ->
		In (j, idn_j) I ->
		js = app js_1 (app [j] js_2)  ->
		sigma_j = (Sigma idn_j Q_j Sr_j (C_j , F_j) I_j) -> 
		In sigma_j K ->
		In (cap_decl C_i im C' im' des fs procs) CT ->
		im = app im_1 (app [imp_decl H h] im_2) ->
		(length js_1 = length im_1) /\ (length js_2 = length im_2) ->
		sigma_i' = (Sigma idn_i Q_i Sr_i (C_i , F_i) I_i) -> 
		In (h, idn_j) I_i ->
		wire_up idn (wire_decl i js) sigma_i'.

(* This represents the wiring rec rule to create initial configurations of Panini programs. *)
Inductive wiring_rec : glb_conf -> id -> wire -> glb_conf -> Prop :=
	| w_rec : forall i i' js j's idn C wires insts sigma Q Q_i C_i I_i F I Sr sigma_i sigma_i' F_i Sr_i idn_i K K' K'',
		In (i, idn_i) I ->
		sigma = (Sigma idn Q Sr (C , F) I) -> 
		In sigma K ->
		sigma_i = (Sigma idn_i Q_i Sr_i (C_i , F_i) I_i) -> 
		In sigma_i K ->
		wire_up idn (wire_decl i js) sigma_i' ->
		design_of C_i (dsgn_decl insts wires) ->
		K' = (sigma_i' :: K) ->
		In (wire_decl i' j's) wires ->
		wiring_rec K' idn_i (wire_decl i' j's) K'' ->
		wiring_rec K idn (wire_decl i js) K''.

(* This represents the wiring rec base rule to create initial configurations of Panini programs. *)
Inductive wiring_rec_base : glb_conf -> id -> wire -> glb_conf -> Prop :=
	| w_rec_base : forall i js idn C insts sigma Q Q_i C_i I_i F I Sr sigma_i sigma_i' F_i Sr_i idn_i K K',
		sigma = (Sigma idn Q Sr (C , F) I) -> 
		In sigma K ->
		In (i, idn_i) I ->
		sigma_i = (Sigma idn_i Q_i Sr_i (C_i , F_i) I_i) ->
		In sigma_i K ->
		wire_up idn (wire_decl i js) sigma_i' ->
		design_of C_i (dsgn_decl insts nil) ->
		K' = (sigma_i' :: K) ->
		wiring_rec_base K idn (wire_decl i js) K'.

(* This represents the construct_main rule to create initial configurations of Panini programs. *)
Inductive construct_main :  inst -> id -> glb_conf -> Prop :=
	| construct_main_rule : forall Main main idn0 i js C insts w wires sigma Q Sr I F K K0 K', 
		instantiate idn0 (inst_decl (Main) main) sigma ->
		sigma = (Sigma idn0 Q Sr (Main , F) I) -> 
		design_of Main (dsgn_decl insts wires) ->
		In (inst_decl C i) insts ->
		instantiation_rec K0 idn0 (inst_decl C i) K ->
		In sigma K0 ->
		In (wire_decl i js) w ->
		wiring_rec K idn0 (wire_decl i js) K' ->
		construct_main (inst_decl (Main) main) idn0 K'.

(* Reach function which returns all values at the locations which is reachable from the location l in the store. *)
Fixpoint reach (l : nat) (Sr : store) : list exp :=
	match Sr with
	| nil => nil
	| e1 :: Sr' => 
		match l with 
			| O => 
				match e1 with 
					| loc_exp l1 => e1 :: reach l1 Sr'
					| inv_exp i p e lb => (e1 :: nil)
					| ref_exp e => (e1 :: nil)
					| deref_exp e => (e1 :: nil)
					| ref_asgn_exp x e => (e1 :: nil)
					| var_exp x => (e1 :: nil)
					| st_read_exp self f => (e1 :: nil)
					| st_asgn_exp self f e => (e1 :: nil)
					| self_inv_exp self i e => (e1 :: nil)
					| super_inv_exp super i e => (e1 :: nil)
					| let_exp x e e2 => (e1 :: nil)
					| val_exp x => (e1 :: nil)
					| res_exp l1 e i p => (e1 :: nil)
					| unit_exp => nil
					| owe_exp => nil
					| trans_exp => nil
					| unres_exp => nil
					end
			| S n' => reach l Sr'
			end
	end.

Inductive greater_than : nat -> nat -> bool -> Prop :=
| greater_than_O : forall n,
	greater_than n O true
| greater_than_S : forall n n' m m',
	n' = S m' ->
	n = S m ->
	greater_than m m' true ->
	greater_than n n' true.

(* remove_one removes one expression from the list. *)
Fixpoint remove_one (e : exp) (l : list exp) : list exp :=
match l with 
  | nil => nil
  | e' :: l' => 
	match is_equal_exp e e' with 
		| left _ => l'
		| right _ => remove_one e (l')
    end
end.

(* remove_subset removes a part of the list from another list. *)
Fixpoint remove_subset (R1 : list exp) (R2 : list exp) : list exp :=
	match R1 with 
		| nil => R2 
		| r :: R1' => (remove_subset R1' (remove_one r R2))
	end.
 
(* reach_lookup looks at value at any location in the reach. *)
Definition reach_lookup (n : nat) (R : list exp) :=
	nth n R unit_exp.

(* Auxilliary function from the paper. reachRemove represents the auxiliary function 
that removes location and its reach from store. *)
Fixpoint reach_remove (l : nat) (Sr : store) (R : list exp) : list exp :=
	match Sr with 
		| nil => nil 
		| e1 :: Sr' => remove_subset (remove_loc (store_lookup l R) l R) (remove_loc (reach_lookup l Sr) l Sr) 
	end.

(* Auxilliary function from the paper. reachAdd represents the auxiliary function that removes location 
and its reach from store. *)
Fixpoint reach_add (l : nat) (Sr : store) (R : list exp) : list exp :=
	match Sr with 
		| nil => nil 
		| e1 :: Sr' => app (remove_loc (store_lookup l R) l R) (snoc Sr (store_lookup l Sr)) 
	end.

(* intersect_reach relation denotes the intersection of reach. *)
Inductive intersect_reach (R1 : list exp) (R2 : list exp) : store -> Prop :=
	| intersect_nil_reach1 : 
		(R1 = nil)  ->
		intersect_reach R1 R2 nil
	| intersect_nil_reach2 : 
		(R2 = nil)  ->
		intersect_reach R1 R2 nil
  	| intersect_nil_reach3 : 
		(R1 = nil)  /\ (R2 = nil) ->
		intersect_reach R1 R2 nil
  | intersect_reach1 : forall l Sr Sr',
		R1 = (reach l (app Sr Sr'))  ->
		R2 = (reach l Sr) ->
		intersect_reach R1 R2 (reach l Sr)
 	| intersect_reach2 : forall r R1' R3,
		R1 = r :: R1'  ->
		In r R2  ->
		intersect_reach R1' R2 R3 ->
		intersect_reach R1 R2 (snoc R3 r)
	| intersect_reach3 : forall r R1' R3,
		R1 = r :: R1' ->
		~ In r R2 ->
		intersect_reach (R1') R2 R3 ->
		intersect_reach R1 R2 R3.

(* This axiom represents a fresh location l. *)
Axiom fresh_loc_l : forall l, fresh_loc l.

(* This axiom says that at the value at the location l in the store Sr is not an 
unresolved value. *)
Axiom not_unres : forall l Sr, (~ unres_value (store_lookup l Sr)).

(* This hypothesis states that two capsule instance configurations c1 and c2 are either 
equal or not equal. *)
Hypothesis is_equal_cap_conf : forall c1 c2 : cap_conf, 
	{c1 = c2} + {c1 <> c2}.

(* update_conf updates a confguration c in the list of configurations K1 with c1. *)
Fixpoint update_conf (c : cap_conf) (K : glb_conf) (c' : cap_conf) : glb_conf :=
	match K with 
		| nil => nil
		| c'' :: K' => 
			match is_equal_cap_conf c c'' with 
				| left _ => c' :: K'
				| right _ => update_conf c K' c'
			end
end.
