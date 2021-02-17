Require Export List.
Require Export SfLib.

(** ********************* **)
(** TYPES **)
(** ********************* **)

(* base_ty represents a user-defined type where nil_base_ty is the void type 
and enum_base_ty is a user-defined enumerated type. *)
Inductive base_ty: Type :=
	| nil_base_ty : base_ty
	| enum_base_ty : id -> base_ty -> base_ty.

(* Panini distinguishes between variable types and capsule types. *)
(* variableType represents a variable type. *) 
Inductive varl_ty : Type :=
	| unit_ty : varl_ty
	| ref_ty : varl_ty -> varl_ty
	| uvar_ty : base_ty -> varl_ty.

(* capl_ty represents captype types where id is the name of the capsule. *)
Definition capl_ty := id.

(* ty is the union of variable and capsule types. *)
Inductive ty : Type :=
	| cap_ty : capl_ty -> ty
	| var_ty : varl_ty -> ty.

(* label is denoted by natural. *)
Definition lbl := nat.

(* location is denoted by natural. *)
Definition loc := nat.

(** ********************* **)
(** EXPRESSIONS **)
(** ********************* **)

(* A capsule procedure has one parameter and its invocation accepts one argument. *)
(* Extension to allow multiple parameters/arguments are straightforward. *)
(* The exp definition includes both programmer syntax and runtime syntax. *)
Inductive exp : Type :=
	(* programmer syntax *)
	| inv_exp : id -> id -> exp -> lbl -> exp
	| self_inv_exp : id -> id -> exp -> exp
	| super_inv_exp : id -> id -> exp -> exp
	| st_read_exp : id -> id -> exp
	| st_asgn_exp : id -> id -> exp -> exp
	| ref_exp : exp -> exp
	| deref_exp : exp -> exp
	| ref_asgn_exp : exp -> exp -> exp
	| let_exp : id ->  exp -> exp -> exp
	| val_exp : id -> exp
	| var_exp: id -> exp
	| unit_exp : exp
	(* runtime syntax *)
	| loc_exp : loc -> exp
	| res_exp : loc -> exp -> id -> id -> exp
	| owe_exp : exp
	| trans_exp : exp
	| unres_exp : exp.

(** ********************* **)
(** VALUES **)
(** ********************* **)

Inductive value :  exp -> Prop :=
	| loc_val : forall l, value (loc_exp l)
	| unres_val : value (unres_exp)
	| trans_val : value (trans_exp)
	| owe_val : value (owe_exp)
	| val_val : forall iden, value (val_exp iden)
	| unit_val : value unit_exp.

	(* form represents a formal parameter with type var_ty and name id. *)
Inductive form : Type :=
	| form_decl :  varl_ty  -> id -> form.

(* state represents the state of a capsule with type variable type and name id. *)
Inductive state : Type :=
	| st_decl : varl_ty -> id -> state.

(* proc represents a procedure declaration with type varl_ty, name id, 
formal parameter and body expression. *)
Inductive proc : Type :=
	| proc_decl : varl_ty -> id -> form -> exp -> proc.

(* imp represents the declaration of an imported capsule instance id with type capl_ty. *)
Inductive imp : Type :=
	| imp_decl : capl_ty -> id -> imp.

(* inst represents an instance declaration with type capl_ty and name id. *)
Inductive inst : Type :=
	| inst_decl : capl_ty -> id -> inst.

(* wire represents a wiring declaration with name id and a list of ids as exports. *)
Inductive wire : Type :=
	| wire_decl : id -> list id -> wire.

(* dsgn represents a design declaration that includes a list of instance 
and wire declarations. *) 
Inductive dsgn : Type :=
	| dsgn_decl : list inst -> list wire -> dsgn.

(* cap represents a capsule declaration with name represented by capl_ty, 
set of list of imported capsule instances, capl_ty which represents super capsule , 
a design declaration, a list of states and procedures. *)
Inductive cap : Type :=
	| cap_decl : id -> list imp -> id -> list imp -> dsgn -> list state ->  list proc  -> cap.

(* cap_tbl represents list of capsule declarations. *)
Definition cap_tbl := list cap.