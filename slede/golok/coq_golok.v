Require Export List.
Require Export SfLib.
Require Export Smallstep.
Require Export Basics.
Extraction Language Scheme.

(** To define state as a behavioral automata, it suffices to represent the identifier which is the name of the state. *)
Inductive state : Type :=
 | st : id -> state.

(**States of Behavioral Automata which is the set of names of the states*)
Definition states := list state.


Hypothesis Aeq_dec_state : forall A A1 : state , { A= A1} + {A <> A1}.

(**Initial states of Behavioral Automata which is the set of names of the initial states*)
Definition initial_states  := list state.


(**It suffices to check that initial state or final state are the memebr of states*)
Fixpoint isMem_states (s:state) (P: states  ) : bool :=
    match P with
    |  nil => false
    |  (s1 :: S_list) => match Aeq_dec_state s s1 with 
                                   | left _ => true
                                   | right _ => isMem_states s (S_list)
        end
end.

Extraction isMem_states.


Fixpoint remove_one_state (s:state) (P:states) : states :=
  match P with
    | nil => nil
    | s1::S_list => if (Aeq_dec_state s1 s) then S_list else s1::(remove_one_state s1 S_list)
  end.

Extraction  remove_one_state.

(** It checks that initial states are the subset of states or final states are the subste of states*)
Fixpoint isSubset_of_states (s:states) (s': states) : bool :=
  match s with
    | nil => true
    | s1::S_list => if (isMem_states s1 s') then (isSubset_of_states S_list (remove_one_state s1 s')) else false
  end.

Extraction isSubset_of_states.

(**Final states of Behavioral Automata which is the set of names of the final states*)
Definition final_states := list state.

(*To define event in the automaton, it suffices to represent the identifier which is the name of the event or ε which represents no-event*) 
Inductive event : Type :=
   | ε  : event
   | ev : id -> event.

(** Events in Behavioral Automata is the set of names of the events*)
Definition events := list event .

Hypothesis Aeq_dec_set_of_event : forall A A1 : events , { A= A1} + {A <> A1}.
Hypothesis Aeq_dec_event : forall A A1 : event , { A= A1} + {A <> A1}.

Fixpoint isMem_events (a:event) (P: events) : bool :=
    match P with
    | nil => false
    | B :: Bl => match Aeq_dec_event a B with 
                                   | left _ => true
                                   | right _ => isMem_events a Bl
        end
end.

Extraction isMem_events.


Fixpoint remove_one_event (v:event) (s:events) : events :=
  match s with
    | [] => []
    | h::t => if (Aeq_dec_event h v) then t else h::(remove_one_event v t)
  end.

Extraction remove_one_event.


Fixpoint isSubset_of_events (s1:events) (s2: events) : bool :=
  match s1 with
    | nil => true
    | h::t => if (isMem_events h s2) then (isSubset_of_events t (remove_one_event h s2)) else false
  end.

Extraction isSubset_of_events.

(** There is only one kind of initial transition which represents the pair (E, qi) ((prod events  initial_states)) *)
Inductive initial_transition : Type := 
 | Δi : (prod events  initial_states) -> initial_transition.

Hypothesis Aeq_dec_initial_transition : forall A A1 : initial_transition, { A= A1} + {A <> A1}.


Inductive isSubset_initial_transition (a:initial_transition) (P: initial_transition ) : bool -> Prop :=
       | mem_of_Δi : forall  Sin E e1 s1 ,
                         P = Δi (E , Sin) ->
                         a = Δi ( [e1], [s1] ) ->
                         isSubset_of_events [e1] E  = true ->
                         isSubset_of_states [s1] Sin = true ->
                         isSubset_initial_transition a P true.


(** There is only one kind of final transition which represents the pair (qf, E) (((prod final_states  events))) *)
Inductive  final_transition :Type := 
 | Δf :  ((prod final_states  events)) -> final_transition.

Hypothesis Aeq_dec_final_transition : forall A A1 : final_transition, { A= A1} + {A <> A1}.

Inductive isSubset_final_transition (a:final_transition) (P: final_transition) : bool -> Prop :=
       | mem_of_Δf : forall S1 E1 Sf E ,
                       P = Δf ( Sf, E) ->
                       isSubset_of_events [E1] E  = true ->
                       isSubset_of_states [S1] Sf = true ->
                       a = Δf ([S1], [E1]) ->
                       isSubset_final_transition a P true.

(** There is only one kind of pair of states in behavioral automaton which represents the pair (qi, qf) ((prod initial_states  final_states ))*)
Inductive pair_states : Type  := 
 | Qi_Qf : (prod initial_states  final_states ) -> pair_states.

Hypothesis Aeq_dec_pair_states : forall A A1 : pair_states, { A= A1} + {A <> A1}.

Inductive isSubset_pair_states (a:pair_states) (P: pair_states ) : bool -> Prop :=
       | mem_of_pair_states : forall Sin Sf si sf,
                       P = Qi_Qf ( Sin, Sf) ->
                       isSubset_of_states si Sin = true->
                       isSubset_of_states sf Sf = true ->
                       a = Qi_Qf (si, sf) ->
                       isSubset_pair_states a P true.

(** There is only one kind of transition relation that represents its initial transition relation (initial_transition) , 
pair of states (pair_states)  and final transition relation (final_transition) *)
Inductive delta : Type :=
  | Δ : initial_transition -> pair_states -> final_transition -> delta.

Inductive delta_subset  (d :delta) (D : delta) : bool -> Prop :=
   | Δ_subset : forall  E Sin Sf si sf e1 e2,
                     D = Δ ( Δi (E , Sin))  (Qi_Qf (Sin, Sf)) (Δf ( Sf, E))  ->
                     isSubset_of_events e1 E = true ->
                     isSubset_of_events e2 E = true ->
                     isSubset_of_states si Sin = true->
                     isSubset_of_states sf Sf = true ->
                     isSubset_initial_transition (Δi (e1, si) ) (Δi (E , Sin) ) true ->
                     isSubset_final_transition (Δf (sf, e2)) (Δf ( Sf, E)) true ->
                     isSubset_pair_states (Qi_Qf (si, sf)) (Qi_Qf (Sin, Sf)) true ->
                     d = Δ ( Δi (e1 , si)) (Qi_Qf (si, sf))  (Δf (sf, e2) ) -> 
                     delta_subset d D true.

(**Behavioral Automaton*)
(** There are only one kind of behavioral automaton that represent its states (states), 
initial states (initial_states), final states (final_states), transition relation (delta) and events (events). *)
Inductive BA :Type :=
| A : states -> initial_states -> final_states -> delta -> events -> BA.


(**DME *)
Definition x : id := Id 0.
Definition y : id := Id 1.
Definition z : id := Id 2.
Definition a : id := Id 3.
Definition b : id := Id 4.
Definition c : id := Id 5.
Definition d : id := Id 6.
Definition e' : id := Id 7.
(**Start state of DME protocol*)
Definition Start : state := st x.
(**Idle state of DME protocol*)
Definition Idle : state := st y.
(**Ncs state of DME protocol*)
Definition Ncs : state := st z.
(**Cs state of DME protocol*)
Definition Cs : state := st a.
(**token event of DME protocol*)
Definition token : event:= ev b.
(**choose event of DME protocol*)
Definition choose : event := ev c.
(**into state of DME protocol*)
Definition into : event := ev d.

(**SND*)
(** Automaton SND represents its states [Start ; Idle] , initial state [Start], final state [Idle], transition relation 
{ ([ ε ] , [Start] ) U ([Start] , [Idle]) U ([Idle] , [token] ) } and events [ε ; token].*)
Definition SND : BA := A 
                                        [Start ; Idle ]
                                        [Start ]
                                        [Idle ] 
                                        (Δ ( Δi ([ ε ] , [Start] )) (Qi_Qf ([Start] , [Idle]))  (Δf ([Idle] , [token] ))) 
                                        [ε ; token].

Extraction SND.

(**RCV*)
(** Automaton RCV represents its states [ [Idle  ; Ncs ]  , initial state [Idle], final state [Ncs], transition relation 
{ ([ token ] , [Idle] ) U ([Idle] , [Ncs]) U ([Ncs] , [choose] ) } and events [token ; choose].*)
Definition RCV : BA := A 
                                        [Idle  ; Ncs ] 
                                        [Idle]
                                        [Ncs ]
                                        (Δ ( Δi ([ token ] , [Idle] )) (Qi_Qf ([Idle] , [Ncs ]))  (Δf ([Ncs] , [choose]))) 
                                        [token ; choose] .

(**PASS*)
(** Automaton PASS represents its states [ [Ncs ; Idle  ]  , initial state [Ncs], final state [Idle], transition relation 
{ ([ choose ] , [Ncs] ) U ([Ncs] , [Idle]) U ([Idle] , [token] ) } and events [choose ; token].*)
Definition PASS : BA := A 
                                        [Ncs ; Idle ] 
                                        [Ncs ] 
                                        [Idle ] 
                                        (Δ ( Δi ([choose ] , [Ncs ])) (Qi_Qf ([Ncs]  , [Idle] ))  (Δf ([Idle ] , [token] ))) 
                                        [choose ; token ].

(**ENTER*)
(** Automaton ENTER represents its states [ [Ncs ; Cs ]  , initial state [Ncs], final state [Cs], transition relation 
{ ([ choose ] , [Ncs] ) U ([Ncs] , [Cs]) U ([Cs] , [into] ) } and events [choose ; into].*)
Definition ENTER : BA := A 
                                        [Ncs ; Cs]  
                                        [Ncs ] 
                                        [Cs ] 
                                        (Δ ( Δi ([ choose ] , [Ncs] )) (Qi_Qf ([Ncs] , [Cs] ))  (Δf ([Cs], [into] ))) 
                                        [choose ; into] .

(**LEAVE*)
(** Automaton LEAVE represents its states [ [Cs ; Idle ]  , initial state [Cs], final state [Idle], transition relation 
{ ([ into ] , [Cs] ) U ([Cs] , [Idle]) U ([Idle] , [token] ) } and events [into ; token].*)
Definition LEAVE : BA := A 
                                        [Cs ; Idle ] 
                                        [Cs ]
                                        [Idle ]
                                        (Δ ( Δi ([ into ] , [Cs])) (Qi_Qf ([Cs] , [Idle]))  (Δf ([Idle], [token] ))) 
                                        [into ; token ] .

(**DINING PHILOSOPHERS*)
Definition a' : id := Id 0.
Definition b' : id := Id 1.
Definition c' : id := Id 2.
Definition d' : id := Id 3.
Definition e'' : id := Id 4.
Definition f' : id := Id 5.
Definition g' : id := Id 6.
Definition h' : id := Id 7.
Definition i' : id := Id 8.
Definition j' : id := Id 9.
Definition k' : id := Id 10.
(** NotEating state of Dinning Philospher*)
Definition NotEating : state := st a'.
(** WaitLeft state of Dinning Philospher*)
Definition WaitLeft : state := st b'.
(** WaitRight state of Dinning Philospher*)
Definition WaitRight : state := st c'.
(** Eat state of Dinning Philospher*)
Definition Eat : state := st d'.
(** ask_left event of Dinning Philospher*)
Definition ask_left : event := ev e''.
(** left_free event of Dinning Philospher*)
Definition left_free : event := ev f'.
(** left_taken event of Dinning Philospher*)
Definition left_taken : event := ev g'.
(** ask_right event of Dinning Philospher*)
Definition ask_right : event := ev h'.
(** right_free event of Dinning Philospher*)
Definition right_free : event := ev i'.
(** right_taken event of Dinning Philospher*)
Definition right_taken : event := ev j'.
(** rel_forks event of Dinning Philospher*)
Definition rel_forks : event := ev k'.

(**LFT*)
Definition LFT : BA := A
                                        [NotEating ; WaitLeft ]
                                        [NotEating ]
                                        [WaitLeft ]
                                        (Δ ( Δi ([ ε ] , [NotEating ])) (Qi_Qf ([NotEating ] , [WaitLeft ]))  (Δf ([WaitLeft ], [ask_left ]))) 
                                        [ε ; ask_left ].

(**LFT_FREE_NE*)
Definition LFT_FREE_NE : BA := A
                                        [NotEating ]
                                        [NotEating ]
                                        [NotEating ]
                                        (Δ ( Δi ([ ask_left ] , [NotEating ])) (Qi_Qf ([NotEating]  , [NotEating ]))  (Δf ([NotEating ], [left_free ]))) 
                                        [ask_left ; left_free ].

(**LFT_FREE_WL*)
Definition LFT_FREE_WL : BA := A
                                        [WaitLeft  ]
                                        [ WaitLeft ]
                                        [WaitLeft ]
                                        (Δ ( Δi ([ ask_left ] , [WaitLeft ])) (Qi_Qf ([WaitLeft ] , [WaitLeft ]))  (Δf ([WaitLeft ], [left_free ]))) 
                                        [ask_left ; left_free ].

(**LFT_BUSY_WR*)
Definition LFT_BUSY_WR : BA := A
                                        [WaitRight ]
                                        [WaitRight]
                                        [WaitRight ]
                                        (Δ ( Δi ([ ask_left ] , [WaitRight] )) (Qi_Qf ([WaitRight] , [WaitRight ] ))  (Δf ([WaitRight ], [left_taken]))) 
                                        [ask_left; left_taken ].

(**LFT_BUSY_EAT*)
Definition LFT_BUSY_EAT : BA := A
                                        [Eat ]
                                        [ Eat ]
                                        [Eat ]
                                        (Δ ( Δi ([ask_left ] , [ Eat ])) (Qi_Qf ([Eat ] , [Eat] ))  (Δf ([Eat], [left_taken ]))) 
                                        [ask_left ; left_taken ].

(**LFT_REASK*)
Definition LFT_REASK : BA := A
                                        [WaitLeft]
                                        [WaitLeft ]
                                        [WaitLeft ]
                                        (Δ ( Δi ([ left_taken ] , [WaitLeft ])) (Qi_Qf ([WaitLeft ] , [WaitLeft ]))  (Δf ([WaitLeft ], [ask_left ]))) 
                                        [left_taken ;ask_left ].

(**RIGHT*)
Definition RIGHT : BA := A
                                        [WaitLeft ; WaitRight ]
                                        [WaitLeft ] 
                                        [WaitRight ]
                                        (Δ ( Δi ([ left_free ] , [WaitLeft ])) (Qi_Qf ([WaitLeft ] , [WaitRight ]))  (Δf ([WaitRight ], [ask_right ]))) 
                                        [left_free  ; ask_right ].

(**RIGHT_FREE_NE*)
Definition RIGHT_FREE_NE : BA := A
                                        [NotEating ]
                                        [NotEating ]
                                        [NotEating ]
                                        (Δ ( Δi ([ ask_right ] , [NotEating ])) (Qi_Qf ([NotEating ] , [NotEating ]))  (Δf ([NotEating ], [right_free ]))) 
                                        [ ask_right ; right_free ].

(**RIGHT_FREE_WL*)
Definition RIGHT_FREE_WL : BA := A
                                        [WaitLeft ]
                                        [WaitLeft ]
                                        [WaitLeft ]
                                        (Δ ( Δi ([ ask_right] , [WaitLeft])) (Qi_Qf ([WaitLeft] , [WaitLeft]))  (Δf ([WaitLeft], [right_free]))) 
                                        [ask_right ; right_free ].

(**RIGHT_BUSY_WR*)
Definition RIGHT_BUSY_WR : BA := A
                                        [WaitRight ]
                                        [WaitRight ]
                                        [WaitRight ]
                                        (Δ ( Δi ([ ask_right ] , [WaitRight ])) (Qi_Qf ([WaitRight] , [WaitRight]))  (Δf ([WaitRight], [right_taken] ))) 
                                        [ask_right ; right_taken ].

(**RIGHT_BUSY_EAT*)
Definition RIGHT_BUSY_EAT : BA := A
                                        [Eat ]
                                        [Eat ]
                                        [Eat ]
                                        (Δ ( Δi ([ ask_right ] , [ Eat ])) (Qi_Qf ([Eat ] , [Eat]))  (Δf ([Eat], [right_taken]))) 
                                        [ask_right ; right_taken ].

(**RIGHT_REASK*)
Definition RIGHT_REASK : BA := A
                                        [WaitRight ]
                                        [WaitRight ]
                                        [WaitRight ]
                                        (Δ ( Δi ([ right_taken ], [WaitRight] )) (Qi_Qf ([WaitRight ] , [WaitRight ]))  (Δf ([WaitRight ], [ask_right ]))) 
                                        [right_taken ; ask_right ].

(**EAT*)
Definition EAT : BA := A
                                        [WaitRight ; Eat ]
                                        [WaitRight ]
                                        [Eat ]
                                        (Δ ( Δi ([ right_free ] , [WaitRight ])) (Qi_Qf ([WaitRight] , [Eat ]))  (Δf ([Eat], [rel_forks]))) 
                                        [right_free ; rel_forks ].

(**EAT_DONE*)
Definition EAT_DONE : BA := A
                                        [Eat ; NotEating ]
                                        [Eat ]
                                        [ NotEating ]
                                        (Δ ( Δi ([ rel_forks ] , [Eat ])) (Qi_Qf ([Eat ] , [NotEating ]))  (Δf ([NotEating], [ε ]))) 
                                        [rel_forks ; ε ].

(** Spin Lock*)
Definition a'' : id := Id 0.
Definition b'' : id := Id 1.
Definition c'' : id := Id 2.
Definition d'' : id := Id 3.
Definition e''' : id := Id 4.
Definition f'' : id := Id 5.
Definition NB : state := st a''.
Definition B : state := st b''.
Definition req : event := ev c''.
Definition ack : event := ev d''.
Definition nack : event := ev e'''.
Definition rel : event := ev f''.
Definition a1 : id := Id 0.
Definition b2 : id := Id 1.
Definition c3 : id := Id 2.
Definition d4 : id := Id 3.
Definition e1 : id := Id 4.
Definition f2 : id := Id 5.
Definition g3 : id := Id 6.
Definition h4 : id := Id 7.
Definition i5 : id := Id 8.
Definition Start1 : state := st a1.
Definition Waiting : state := st b2.
Definition HasObject: state := st c3.
Definition into1 : event := ev f2.

(**PROCESS*)

(**REQUEST *)
Definition REQUEST : BA := A
                                        [Start ; Waiting ]
                                        [Start ]
                                        [Waiting ]
                                        (Δ ( Δi ([ ε ] , [Start ] )) (Qi_Qf ([Start ] , [Waiting]))  (Δf ([Waiting], [req]))) 
                                        [ε ; req ].

(**REJECTED *)
Definition REJECTED : BA := A
                                        [Waiting ]
                                        [Waiting ]
                                        [Waiting ]
                                        (Δ ( Δi ([ nack ] , [Waiting ])) (Qi_Qf ([Waiting] , [Waiting]))  (Δf ([Waiting], [ req ]))) 
                                        [nack ; req ].

(**ACCEPTED *)
Definition ACCEPTED : BA := A
                                        [Waiting ; HasObject ]
                                        [Waiting ]
                                        [HasObject ]
                                        (Δ ( Δi ([ ack ] , [Waiting])) (Qi_Qf ([Waiting] , [HasObject]))  (Δf ([HasObject], [ into ]))) 
                                        [ack ; into ].

(**RELEASING *)
Definition RELEASING : BA := A
                                        [HasObject ; Start ]
                                        [HasObject ]
                                        [Start ]
                                        (Δ ( Δi ([ into ] , [HasObject ])) (Qi_Qf ([HasObject ] , [Start]))  (Δf ([HasObject ], [rel ]))) 
                                        [into ; rel ].

(**Object*)
(**REQ_FREE *)
Definition REQ_FREE : BA := A
                                        [NB ; B ]
                                        [NB ]
                                        [B ]
                                        (Δ ( Δi ([ req ] , [NB ])) (Qi_Qf ([NB ] , [B ]))  (Δf ([B ], [ ack ]))) 
                                        [req ; ack].

(**REQ_BUSY *)
Definition REQ_BUSY : BA := A
                                        [B ]
                                        [B ]
                                        [B ]
                                        (Δ ( Δi ([ req ] , [B ])) (Qi_Qf ([B ] , [B ]))  (Δf ([B], [ nack ]))) 
                                        [req ; nack ].

(**RCV_REL *)
Definition RCV_REL : BA := A
                                        [B ; NB ]
                                        [B ]
                                        [NB ]
                                        (Δ ( Δi ([ req ] , [B ])) (Qi_Qf ([B ] , [NB]))  (Δf ([NB], [ ε ]))) 
                                        [rel ; ε ].


(** Protocol Signature *)
(** Variable Prot represnets the set of behavioral automaton (BA) which is basically protocol signature *)
Definition Prot := list BA .

(**DME_Prot represents the set of behavioral automaton for the DME Protocol*)
Definition DME_Prot : Prot := [SND  ; RCV  ; PASS ; ENTER ; LEAVE ].

Extraction DME_Prot.

(**DINING_Prot represents the set of behavioral automaton for the DINNING Protocol*)
Definition DINING_Prot : Prot := [ LFT ;
                                                     LFT_FREE_NE  ;
                                                     LFT_FREE_WL ;
                                                     LFT_BUSY_WR ;
                                                     LFT_BUSY_EAT ;
                                                     LFT_REASK ;
                                                     RIGHT ;
                                                     RIGHT_FREE_NE ;
                                                     RIGHT_FREE_WL ;
                                                     RIGHT_BUSY_WR ;
                                                     RIGHT_BUSY_EAT ;
                                                     RIGHT_REASK ;
                                                     EAT ;
                                                     EAT_DONE ].

(**SPIN_LOCK_Prot represents the set of behavioral automaton for the SPIN LOCK Protocol*)
Definition SPIN_LOCK_Prot : Prot := [ REQUEST ;
                                                             REJECTED  ;
                                                             ACCEPTED ;
                                                             RELEASING ;
                                                             REQ_FREE ;
                                                             REQ_BUSY ;
                                                             RCV_REL ].

Hypothesis Aeq_dec_BA : forall A A1 : BA , { A= A1} + {A <> A1}.

(**Recursive fuction (isMem_Prot) checks whether a behavioral automaton (BA) is the member of protocol signature (Prot) or not*)
 Fixpoint isMem_Prot (A:BA) (P: Prot  ) : bool :=
    match P with
    | nil => false
    | B :: Bl => match Aeq_dec_BA A B with 
                                   | left _ => true
                                   | right _ => isMem_Prot A Bl
        end
end.

Extraction isMem_Prot.

Inductive initial_transition_in_delta (Ti : initial_transition) (D : delta ) : bool -> Prop := 
  | initial_transition_in_Δ : forall e s1 Tin P Tf E Sin,
          D = Δ Tin P Tf ->
         Tin = Δi (E , Sin) ->
         isSubset_of_events [e] E = true ->
         isSubset_of_states [s1] Sin = true ->
         Ti = Δi ([e ] , [s1]) ->
         isSubset_initial_transition Ti Tin true->
         initial_transition_in_delta Ti D true.

(**There is only one kind of constructor which signifies the behavior of protocol signature (Prot) that there is atleast one behavioral
automaton A ∈ Prot which has an initial transition with the empty event ε.*)
Inductive protocol_signature (P: Prot) :  Prop :=
  | pr : forall Ai S1 S2 D  E   s1 Ti S  Tf P1,
      isMem_Prot Ai P = true ->
      Ai = (A S S1 S2 D E) ->
      D = Δ Ti P1 Tf ->
      isSubset_of_events [ε] E = true ->
      isSubset_of_states [s1] S1 = true -> 
      Ti = Δi ( [ε ] , [s1]) ->
      protocol_signature P .


(**This lemma (protocol_signature_DME) proves that DME protocol fulfills the properties of protocol signature*)
Lemma protocol_signature_DME  : protocol_signature DME_Prot .
Proof.
unfold DME_Prot.
unfold SND.
apply pr with SND [Start]  [Idle] (Δ (Δi ([ε], [Start])) (Qi_Qf ([Start], [Idle])) (Δf ([Idle], [token])))
                              [ε; token] Start (Δi ([ε], [Start])) [Start; Idle] (Δf ([Idle], [token])) (Qi_Qf ([Start], [Idle])).
simpl.
destruct Aeq_dec_BA.
reflexivity.
destruct n.
reflexivity.
reflexivity.
reflexivity.
simpl.
destruct Aeq_dec_event.
reflexivity.
destruct n.
reflexivity.
simpl.
destruct Aeq_dec_state.
reflexivity.
destruct n.
reflexivity.
reflexivity.
Qed.


(**This lemma (protocol_signature_DINNING) proves that DINING_Prot fulfills the properties of protocol signature*)
Lemma protocol_signature_DINING  : protocol_signature DINING_Prot  .
Proof.
unfold DINING_Prot.
unfold LFT.
apply pr with LFT [NotEating]  [WaitLeft] (Δ (Δi ([ε], [NotEating])) (Qi_Qf ([NotEating], [WaitLeft])) (Δf ([WaitLeft], [ask_left])))
                            [ε; ask_left] NotEating (Δi ([ε], [NotEating])) [NotEating; WaitLeft] (Δf ([WaitLeft], [ask_left])) (Qi_Qf ([NotEating], [WaitLeft])).
simpl.
destruct Aeq_dec_BA.
reflexivity.
destruct n.
reflexivity.
reflexivity.
reflexivity.
simpl.
destruct Aeq_dec_event.
reflexivity.
destruct n.
reflexivity.
simpl.
destruct Aeq_dec_state.
reflexivity.
destruct n.
reflexivity.
reflexivity.
Qed.

(**This lemma (protocol_signature_SPIN_LOCK) proves that SPIN LOCK protocol fulfills the properties of protocol signature*)
Lemma protocol_signature_SPIN_LOCK  : protocol_signature SPIN_LOCK_Prot .
Proof.
unfold SPIN_LOCK_Prot.
unfold REQUEST.
apply pr with REQUEST [Start]  [Waiting] (Δ (Δi ([ε], [Start])) (Qi_Qf ([Start], [Waiting])) (Δf ([Waiting], [req])))
                                       [ε; req] Start (Δi ([ε], [Start])) [Start; Waiting] (Δf ([Waiting], [req])) (Qi_Qf ([Start], [Waiting])).
simpl.
destruct Aeq_dec_BA.
reflexivity.
destruct n.
reflexivity.
reflexivity.
reflexivity.
simpl.
destruct Aeq_dec_event.
reflexivity.
destruct n.
reflexivity.
simpl.
destruct Aeq_dec_state.
reflexivity.
destruct n.
reflexivity.
reflexivity.
Qed.

(**Topology Rule*)

(** Variable process_index represents naturals which is the index of the processes in the system*)
Definition process_index := nat.

(** Variable I represents set of naturals representing the set of process indexes (process_index)*)
Definition I := list process_index.

Hypothesis Aeq_dec_I : forall A A1 : I, { A= A1} + {A <> A1}.

Hypothesis Aeq_dec_process_index : forall A A1 : process_index , { A= A1} + {A <> A1}.

 Fixpoint isMem_I (a:process_index) (P: I) : bool :=
    match P with
    | nil => false
    | B :: Bl => match Aeq_dec_process_index a B with 
                                   | left _ => true
                                   | right _ => isMem_I  a Bl
        end
end.

Extraction isMem_I.

Fixpoint remove_one_process_index (v:process_index) (s:I) : I :=
  match s with
    | [] => []
    | h::t => if (Aeq_dec_process_index h v) then t else h::(remove_one_process_index v t)
  end.

Extraction remove_one_process_index.

Fixpoint isSubset_of_I (s1:I) (s2: I) : bool :=
  match s1 with
    | nil => true
    | h::t => if (isMem_I h s2) then (isSubset_of_I t (remove_one_process_index h s2)) else false
  end.

Extraction  isSubset_of_I.

Definition i : id := Id 0.

(** Variable N represents set of naturals which models the system parameter*)
Definition N := list nat.

(**Topology rule*)
(**There are only one kind of topology_rule that represent mapping from (Events (events) * Process Indexes(I) * Naturals(N))  to Process Indexes (I) for a 
given protocol signature (Prot) *) 
Inductive topology_rule (P : Prot) : Type :=
 | topo :  (prod events (prod I N)) ->  I -> topology_rule P.

(** DME_topo is a variable representing a topology rule for DME protocol*)
Definition DME_topo : topology_rule DME_Prot :=  topo DME_Prot ([token], ([1], [2])) [2].

Extraction DME_topo.

(** DINING_topo_1 is a variable representing a topology rule for DINING philosopher *)
Definition DINING_topo_1 : topology_rule DINING_Prot :=  topo DINING_Prot ([ask_left], ([2], [3])) [1].

Extraction DINING_topo_1.

(** DINING_topo_2 is a variable representing a topology rule for DINING philosopher *)
Definition DINING_topo_2 : topology_rule DINING_Prot := topo DINING_Prot ([ask_right], ([2], [3])) [3].

Extraction DINING_topo_2.

(**Parameterized System Topology*)
(** There are only one kind of parameterized system topology which represents the set of topology rule for a given protocol signature (Prot)*)
Inductive parameterized_system_topology (P : Prot) : Type :=
| Topo : list (topology_rule P) -> parameterized_system_topology P.


Inductive isMem_parameterized_system_topology (P : Prot) (s : topology_rule P) (S : parameterized_system_topology P) : bool -> Prop :=
 | mem_1 : S = Topo P nil->
                 isMem_parameterized_system_topology P s S false
 | mem_2 : forall s1 S1,
                S = Topo P (s1 :: S1) ->
                s = s1 ->
                isMem_parameterized_system_topology P s S true
 | mem_3 : forall s1 S1,
               S = Topo P (s1 :: S1) ->
               s <> s1 ->
               isMem_parameterized_system_topology P s (Topo P S1) true ->
               isMem_parameterized_system_topology P s S true.

Check isMem_parameterized_system_topology.

(** DME_Topo is a variable which represents the set of topolofy rule for DME protocol (DME_Prot)*)
Definition DME_Topo : parameterized_system_topology DME_Prot := Topo DME_Prot [ topo DME_Prot ([token], ([1], [2])) [2] ].

Extraction DME_Topo.

(** DINING_Topo is a variable which represents the set of topolofy rule for DINING philosopher (DINING_Prot)*)
Definition DINING_Topo : parameterized_system_topology DINING_Prot := Topo DINING_Prot [(topo DINING_Prot ([ask_left], ([2], [3])) [1]) ; (topo DINING_Prot ([ask_right], ([2], [3])) [3]) ].

Extraction DINING_Topo.

(** SPIN_LOCK_Topo is a variable which represents the set of topolofy rule for SPIN LOCK protocol (SPIN_LOCK_Prot)*)
Definition SPIN_LOCK_Topo : parameterized_system_topology SPIN_LOCK_Prot := Topo SPIN_LOCK_Prot [(topo SPIN_LOCK_Prot ([req], ([2], [2])) [3]) ; (topo SPIN_LOCK_Prot ([rel], ([1], [2])) [3]) ].

Extraction SPIN_LOCK_Topo.


(**Parameterized system instance*)

(** Variable sys_S represents the state (I* initial_state * event) in 
parameterized system instances*)
Definition sys_S := (prod I (prod initial_states events)).

(** Variable S_L represents the set of state (sys_S) in 
parameterized system instances*)
Definition S_L := list sys_S.

(** Variable sys_action represents the action (event * event) in 
parameterized system instances*)
Definition sys_action := (prod events events).

(** Variable L represents the set of actions (sys_action) in 
parameterized system instances*)
Definition L := list sys_action.

(** Variable transition represents the transition (state * action * state) in 
parameterized system instances*)
Definition transition := (prod S_L (prod L S_L)).

(** Variable T represents the set of transitions (S * L * S) in 
parameterized system instances*)
Definition T := list transition.

Hypothesis Aeq_dec_S : forall A A1 : sys_S , { A= A1} + {A <> A1}.

Fixpoint isMem_S (s:sys_S) (P: S_L ) : bool :=
    match P with
    |  nil => false
    |  (s1 :: S_list) => match Aeq_dec_S s s1 with 
                                   | left _ => true
                                   | right _ => isMem_S s (S_list)
        end
end.

Extraction isMem_S.

Hypothesis Aeq_dec_sys_action : forall A A1 : sys_action , { A= A1} + {A <> A1}.

Fixpoint isMem_L (s:sys_action) (P: L ) : bool :=
    match P with
    |  nil => false
    |  (s1 :: S_list) => match Aeq_dec_sys_action s s1 with 
                                   | left _ => true
                                   | right _ => isMem_L s (S_list)
        end
end.

Extraction isMem_L.

Fixpoint remove_one_sys_action (v:sys_action) (s:L) : L :=
  match s with
    | [] => []
    | h::t => if (Aeq_dec_sys_action h v) then t else h::(remove_one_sys_action v t)
  end.

Extraction remove_one_sys_action.

Fixpoint isSubset_of_L (s1:L) (s2: L) : bool :=
  match s1 with
    | nil => true
    | h::t => if (isMem_L h s2) then (isSubset_of_L t (remove_one_sys_action h s2)) else false
  end.

Extraction isSubset_of_L.


Fixpoint event_add (a:event) (x: events ) : events :=
    match x with
    | nil => a :: nil
    | a1 :: x1 =>
        match Aeq_dec_event a a1 with
        | left _ => a1 :: x1
        | right _ => a1 ::  event_add a x1
        end
    end.

Extraction event_add.

(** Recursive function (union_events) which does the union of set of events *)
Fixpoint union_events ( Sin : events) (Sf : events) : events :=
match Sf with 
   | nil => Sin 
   | s1 :: l1 => event_add s1 (union_events Sin l1)
end.

Extraction union_events.

(** There are only one constructor which specifies the behavior of any transition in a parameterized system for a 
given protocol signature (Prot) , tolology (parameterized_system_topology) and number of processes in the instnace (N)*)
Inductive isMem_T (P : Prot) (R :parameterized_system_topology P) (k : nat) (T1: transition) (T2 : T) : bool -> Prop :=
      | mem_T : forall s s' e  i q1 E1 j q2 E2 A1 q2'  Δ1  e' E1'   r E  E2',
                       T1 = (s , ([([e] , [e'])], s'))  ->
                       isMem_S ([i] , ([q1] , E1)) s = true->
                       isMem_events e E1 = true ->
                       isMem_S ([j] , ([q2] , E2)) s = true ->
                       isMem_Prot A1 P = true->
                       A1 = A  [q2; q2']  [q2]  [q2']  Δ1  E  ->
                       Δ1 =  (Δ ( Δi ([e] , [q2])) (Qi_Qf ([q2] , [q2']))  (Δf ([q2'], [e']))) ->
                       isMem_S ([i], ([q1], E1')) s' = true ->
                       E1' =  (remove_one_event e E1)  ->
                       isMem_S ([j], ([q2'], E2')) s' = true ->
                       E1' =  union_events E2 [e'] ->
                       isMem_parameterized_system_topology P r R true ->
                       r = topo P ([e], ([i], [k])) [j] ->
                      isMem_T P R k T1 T2 true.

(** Variable sys_Si represent the initial state (I * initial state * event) of the parameterized system instance*)
Definition sys_Si := (prod I (prod initial_states events)).

(** Variable Si represent the set of initial states (sys_Si) of the parameterized system instance*)
Definition Si := list sys_Si.

(**Parameterized system instance*)
(** There are only one kind of parameterized system instance that represent its states (S_L), actions (L) , 
transitions (T) and initial states (Si) for a given protocol signature (Prot), number of processes (nat) and
topplogy (parameterized_system_topology)*)
Inductive parameterized_system_instance (P : Prot) (k : nat) (R : parameterized_system_topology P) : Type :=
 | sys : S_L -> L -> T -> Si -> parameterized_system_instance P k R.

(**Parameterized System*)
(*Variable parameterized_system represents the set of parameterized system instances (parameterized_system_instance)*)
Definition parameterized_system := forall P k R , list (parameterized_system_instance P k R).

(**DME example*)
(** Variable DME_system represents the parameterized system instance of DME protocol for given
protocol signature (DME_Prot), number of processes in the instance (2) and topplogy (DME_Topo)*)
Definition DME_system : parameterized_system_instance DME_Prot 2 DME_Topo  := sys DME_Prot 2 DME_Topo
                                                                                                                   [ ([2] , ([Start] , [ε])) ;
                                                                                                                     ([1] , ([Idle] , [ε])) ;
                                                                                                                     ([2] , ([Idle] , [token])) ;
                                                                                                                     ([2] , ([Ncs] , [ε ; choose])) ;
                                                                                                                     ([1] , ([Idle] , [ε ])) ;
                                                                                                                     ([2] , ([Ncs] , [choose])) ;
                                                                                                                     ([2] , ([Cs] , [ε ; into])) ;
                                                                                                                     ([2] , ([Idle] , [ε ; token])) ]
                                                                                                                   [ ([ε], [token]) ;
                                                                                                                     ([token], [choose]) ;
                                                                                                                     ([choose], [token]) ;
                                                                                                                     ([choose], [into]) ;
                                                                                                                     ([into], [token]) ]
                                                                                                                  [   ([([1] , ([Idle] , [ε])) ; ([2] , ([Start] , [ε])) ] , ([([ε], [token])], [([1] , ([Idle] , [ε ])) ; ([2] , ([Idle] , [token]))])) ;
                                                                                                                    ( [([2] , ([Idle] , [token])); ([1] , ([Idle] , [ε]))] , ([([token], [choose])], [([2] , ([Idle] , [  ])) ; ([1] , ([Ncs] , [ε ;choose]))])) ;
                                                                                                                   ( [([2] , ([Idle] , [ ])) ; ([1] , ([Ncs] , [ε ; choose]))] , ([([choose], [token])], [([2] , ([Idle] , [ ])) ; ([1] , ([Idle] , [ε ; token ]))])) ;
                                                                                                                   ( [([2] , ([Idle] , [ ])); ([2] , ([Ncs] , [ε  ; choose]))] , ([([choose], [into])], [([2] , ([Idle] , [  ])); ([1] , ([Cs] , [ε ; into ]))])) ]
                                                                                                                   [ ([1] , ([Idle] , [ε ])) ;
                                                                                                                     ([2] , ([Start] , [ε])) ].

(** Variable DINNING_system represents the parameterized system instance of Dinning Philosopher for given
protocol signature (DINING_Prot), number of processes in the instance (3) and topplogy (DINING_Topo)*)
Definition DINING_system : parameterized_system_instance DINING_Prot 3 DINING_Topo := sys DINING_Prot 3 DINING_Topo
                                                                                                                  [ ([3] , ([WaitLeft] , [ask_left])) ;
                                                                                                                     ([2] , ([WaitRight] , [ask_right])) ;
                                                                                                                     ([1] , ([NotEating] , [ ])) ;
                                                                                                                     ([1] , ([WaitLeft] , [ask_left])) ;
                                                                                                                     ([2] , ([WaitRight] , [ask_right ; left_taken ])) ;
                                                                                                                     ([1] , ([WaitLeft] , [ ])) ;
                                                                                                                     ([3] , ([WaitLeft] , [ ])) ;
                                                                                                                     ([1] , ([WaitLeft] , [ask_left ; left_free]));
                                                                                                                     ([3] , ([WaitRight] , [ask_right ])) ;
                                                                                                                     ([3] , ([WaitRight] , [ ])) ;
                                                                                                                     ([2] , ([WaitRight] , [ask_right ; right_taken])) ;
                                                                                                                     ([1] , ([WaitLeft] , [ask_left ; right_free])) ;
                                                                                                                     ([2] , ([Eat] , [rel_forks])) ]
                                                                                                                  [ ([ε], [ask_left]) ;
                                                                                                                     ([ask_left], [left_taken]) ;
                                                                                                                     ([ask_left], [left_free]) ;
                                                                                                                     ([left_free], [ask_right]) ;
                                                                                                                     ([ask_right], [right_taken]) ;
                                                                                                                     ([ask_right], [right_free]) ;
                                                                                                                     ([right_free], [rel_forks]) ;
                                                                                                                     ([rel_forks], [ε]) ]
                                                                                                                 [ ([([3] , ([WaitLeft] , [ask_left])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([NotEating] , [ ]))  ] , ([([ε], [ask_left])], [([3] , ([WaitLeft] , [ask_left ])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left])) ])) ;
                                                                                                                   ([([3] , ([WaitLeft] , [ask_left])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left ]))  ] , ([([ask_left], [left_taken])], [([3] , ([WaitLeft] , [ask_left ])) ; ([2] , ([WaitRight] , [ask_right; left_taken])) ; ([1] , ([WaitLeft] , [ ])) ])) ;
                                                                                                                   ([([3] , ([WaitLeft] , [ask_left])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left]))  ] , ([([ask_left], [left_free])], [([3] , ([WaitLeft] , [ ])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left ; left_free])) ])) ;
                                                                                                                   ([([3] , ([WaitLeft] , [ ])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left; left_free]))] , ([([left_free], [ask_right])], [([3] , ([WaitRight] , [ ask_right])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left ])) ])) ;
                                                                                                                   ([([3] , ([WaitRight] , [ask_right])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left]))  ] , ([([ask_right], [right_taken])], [([3] , ([WaitRight] , [ ])) ; ([2] , ([WaitRight] , [ask_right ; right_taken])) ; ([1] , ([WaitLeft] , [ask_left ])) ])) ;
                                                                                                                   ([([3] , ([WaitRight] , [ask_right])) ; ([2] , ([WaitRight] , [ask_right])) ; ([1] , ([WaitLeft] , [ask_left]))  ] , ([([ask_right], [right_free])], [([3] , ([WaitRight] , [ask_right ])) ; ([2] , ([WaitRight] , [ ])) ; ([1] , ([WaitLeft] , [ask_left; right_free ])) ])) ;
                                                                                                                   ([([3] , ([WaitRight] , [ask_right])) ; ([2] , ([WaitRight] , [ ])) ; ([1] , ([WaitLeft] , [ask_left ; right_free]))  ] , ([([right_free], [rel_forks])], [([3] , ([WaitRight] , [ask_right ])) ; ([2] , ([Eat] , [rel_forks])) ; ([1] , ([WaitLeft] , [ask_left ])) ])) ]
                                                                                                                 [ ([3] , ([WaitLeft] , [ask_left ])) ;
                                                                                                                   ([2] , ([WaitRight] , [ask_right ])) ;
                                                                                                                   ([1] , ([NotEating] , [ ])) ] .

(** Variable SPINLOCK_system represents the parameterized system instance of SPIN LOCK protocol for given
protocol signature (SPIN_LOCK_Prot), number of processes in the instance (3) and topplogy (SPIN_LOCK_Topo)*)
Definition SPINLOCK_system : parameterized_system_instance SPIN_LOCK_Prot 3 SPIN_LOCK_Topo := sys SPIN_LOCK_Prot 3 SPIN_LOCK_Topo
                                                                                                                  [ ([1] , ([Start] , [ ])) ;
                                                                                                                     ([2] , ([Start] , [ ])) ;
                                                                                                                     ([3] , ([NB] , [ ])) ;
                                                                                                                     ([1] , ([Waiting] , [req])) ;
                                                                                                                     ([1] , ([Waiting] , [ ])) ;
                                                                                                                     ([3] , ([B] , [ack])) ;
                                                                                                                     ([3] , ([B] , [nack ; ack]));
                                                                                                                     ([2] , ([HasObject] , [into ])) ;
                                                                                                                     ([3] , ([B] , [ nack])) ;
                                                                                                                     ([2] , ([Start] , [rel])) ;
                                                                                                                     ([3] , ([B] , [ ])) ;
                                                                                                                     ([3] , ([NB] , [nack])) ]
                                                                                                                  [ ([ε], [req]) ;
                                                                                                                     ([req], [req]) ;
                                                                                                                     ([ack], [into]) ;
                                                                                                                     ([nack], [req]) ;
                                                                                                                     ([into], [rel]) ;
                                                                                                                     ([ack], [into]) ;
                                                                                                                     ([rel], [rel]) ]
                                                                                                                 [ ([([1] , ([Start] , [ ])) ; ([2] , ([Start] , [ ])) ; ([3] , ([NB] , [ ]))  ] , ([([ε], [req])], [([1] , ([Waiting] , [req ])) ; ([2] , ([Start] , [ ])) ; ([3] , ([NB] , [ ])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [req])) ; ([2] , ([Start] , [ ])) ; ([3] , ([NB] , [ ]))  ] , ([([req], [req])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Start] , [ ])) ; ([3] , ([B] , [ ack])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Start] , [ ])) ; ([3] , ([B] , [ack]))  ] , ([([ε], [req])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [req])) ; ([3] , ([B] , [ack])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [req])) ; ([3] , ([B] , [ack]))] , ([([req], [req])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [ ])) ; ([3] , ([B] , [nack ; ack ])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [ ])) ; ([3] , ([B] , [nack ; ack]))  ] , ([([ack], [into])], [([1] , ([Waiting] , [ ])) ; ([2] , ([HasObject] , [into])) ; ([3] , ([B] , [nack ])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [ ])) ; ([3] , ([B] , [nack ; ack]))  ] , ([([nack], [req])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [req ])) ; ([3] , ([B] , [ack])) ])) ;
                                                                                                                   ([([1] , ([WaitRight] , [ ])) ; ([2] , ([WaitRight] , [req ])) ; ([3] , ([B] , [ack]))  ] , ([([req], [req])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [ ])) ; ([1] , ([B] , [nack ; ack])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [ req])) ; ([3] , ([B] , [nack ; ack]))  ] , ([([ack], [into])], [([1] , ([HasObject] , [into ])) ; ([2] , ([Waiting] , [req ])) ; ([3] , ([B] , [ ])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([HasObject] , [ into])) ; ([3] , ([B] , [nack ]))  ] , ([([into], [rel])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Start] , [rel ])) ; ([3] , ([B] , [nack])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Start] , [rel])) ; ([3] , ([B] , [nack ]))  ] , ([([rel], [rel])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Start] , [ ])) ; ([3] , ([NB] , [nack])) ])) ;
                                                                                                                   ([([1] , ([Waiting] , [ ])) ; ([2] , ([Start] , [ ] )) ; ([3] , ([NB] , [nack ]))  ] , ([([ε], [req])], [([1] , ([Waiting] , [ ])) ; ([2] , ([Waiting] , [req ])) ; ([3] , ([NB] , [nack])) ])) ]
                                                                                                                 [ ([1] , ([Start] , [ ])) ;
                                                                                                                   ([2] , ([Start] , [  ])) ;
                                                                                                                   ([3] , ([NB] , [ ])) ] .

(**1-E behavior*)

(** Variable QI1E represents the initial states (initial_states) in the 1E behavior*)
Definition QI1E := initial_states.

(** Variable Q1E represents the states (states) in the 1E behavior*)
Definition Q1E := states. 

(** Variable transition_relation represents the transition relation of 1E behavior (Q1E * L * Q1E) in the 1E behavior*)
Definition transition_relation := (prod Q1E (prod L Q1E)).

(** Variable Δ1E represents the set of transition relations (transition_relation) in the 1E behavior*)
Definition Δ1E := list transition_relation.

Inductive isMem_Δ1E (P : Prot) (T1 : transition_relation) (T2 : Δ1E) : bool -> Prop :=
   | mem_Δ1E_1 : forall q q' e e' A1 Δ1  E1  ,
                            T1 = ([q], ([([e] , [e'])] , [q'] )) ->
                            isMem_Prot A1 P  = true ->
                            A1 = A  [q; q']  [q]  [q']  Δ1  E1  ->
                            Δ1 =  (Δ ( Δi ([ε] , [q])) (Qi_Qf ([q] , [q']))  (Δf ([q'], [e']))) ->
                            isMem_Δ1E P T1 T2 true
   | mem_Δ1E_2 : forall q qF e e' A1 Δ1  E1 Δ2  E2 q' q'F  e'' A2 ,
                            T1 = ([q], ([([e] , [e'])] , [qF] )) ->
                            isMem_Prot A1 P  = true ->
                            A1 = A  [q; qF]  [q]  [qF]  Δ1  E1  ->
                            Δ1 =  (Δ ( Δi ([e] , [q])) (Qi_Qf ([q] , [qF]))  (Δf ([qF], [e']))) ->
                            isMem_Prot A2 P = true ->
                            A2 = A  [q'; q'F]  [q']  [q'F]  Δ2  E2  ->
                            Δ2 =  (Δ ( Δi ([e'] , [q'])) (Qi_Qf ([q'] , [q'F]))  (Δf ([q'F], [e'']))) ->
                            isMem_Δ1E P T1 T2 true.

(** There are only one kind of 1E behavior (behavior_1E) that represent its states (Q1E), actions (L) (L is defined before for the parameterized
instances, transition relations (Δ1E)  and initial states (QI1E)
for a given protocol signature (Prot)*)
Inductive behavior_1E (P : Prot)  : Type :=
     | b_1E : Q1E -> L -> Δ1E -> QI1E -> behavior_1E P.

(**Variable DME_1E represents the 1E behavior (behavior_1E) of DME protocol for a given protocol 
signature (DME_Prot)*)
Definition DME_1E : behavior_1E DME_Prot := b_1E DME_Prot 
                                                                                                     [ Start ; Idle ; Ncs ; Cs]
                                                                                                     [ ([ε], [token]) ;
                                                                                                       ([token], [choose]) ;
                                                                                                       ([choose], [token]) ;
                                                                                                       ([choose], [into]) ;
                                                                                                       ([into], [token]) ]
                                                                                                    [ ([Start] , ([([ε], [token])], [Idle]));
                                                                                                      ([Idle] , ([([token], [choose])], [Ncs]));
                                                                                                      ([Ncs] , ([([choose], [token])], [Idle]));
                                                                                                      ([Ncs] , ([([choose], [into])], [Cs]));
                                                                                                      ([Cs] , ([([into], [token])], [Idle]))]
                                                                                                     [ Start] .

Extraction DME_1E.

(**Variable DINING_1E represents the 1E behavior (behavior_1E) of Dining philosopher for a given protocol 
signature (DINING_Prot)*)
Definition DINING_1E : behavior_1E DINING_Prot := b_1E DINING_Prot  [NotEating ; WaitLeft ; Eat ; WaitRight ]
                                                                                    [ ([ε], [ask_left]) ;
                                                                                      ([ask_left], [ask_left]) ;
                                                                                      ([ask_left], [left_free]) ;
                                                                                      ([left_free], [left_free]) ;
                                                                                      ([left_taken], [left_taken]) ;
                                                                                      ([ask_left], [left_taken]) ;
                                                                                      ([left_taken], [ask_left]) ;
                                                                                      ([left_free], [ask_right]) ;
                                                                                      ([ask_right], [ask_right]) ;
                                                                                      ([ask_right], [right_free]) ;
                                                                                      ([ask_right], [right_taken]) ;
                                                                                      ([right_free], [right_free]) ;
                                                                                      ([right_taken], [ask_right]) ;
                                                                                      ([right_taken], [right_taken]) ;
                                                                                      ([right_free], [rel_forks]) ;
                                                                                      ([rel_forks], [rel_forks]) ;
                                                                                      ([rel_forks], [ε]) ;
                                                                                      ([ε], [ε]) ]
                                                                                   [  ([NotEating] , ([([ε], [ask_left])], [WaitLeft]));
                                                                                      ([WaitLeft] , ([([ask_left], [ask_left])], [NotEating]));
                                                                                      ([WaitLeft] , ([([ask_left], [ask_left])], [WaitLeft]));
                                                                                      ([WaitLeft] , ([([ask_left], [ask_left])], [Eat]));
                                                                                      ([WaitLeft] , ([([ask_left], [ask_left])], [WaitRight]));
                                                                                      ([NotEating] , ([([ask_left], [left_free])], [NotEating]));
                                                                                      ([WaitLeft] , ([([ask_left], [left_free])], [WaitLeft]));
                                                                                      ([Eat] , ([([ask_left], [left_taken])], [Eat]));
                                                                                      ([WaitRight] , ([([ask_left], [left_taken])], [WaitRight]));
                                                                                      ([NotEating] , ([([left_free], [left_free])], [WaitLeft]));
                                                                                      ([WaitLeft] , ([([left_free], [left_free])], [WaitLeft]));
                                                                                      ([Eat] , ([([left_taken], [left_taken])], [WaitLeft]));
                                                                                      ([WaitRight] , ([([left_taken], [left_taken])], [WaitLeft]));
                                                                                      ([WaitLeft] , ([([left_taken], [ask_left])], [WaitLeft]));
                                                                                      ([WaitLeft] , ([([ask_left], [ask_left])], [NotEating]));
                                                                                      ([WaitLeft] , ([([ask_left], [ask_left])], [WaitLeft]));
                                                                                      ([WaitLeft] , ([([left_free], [ask_right])], [WaitRight]));
                                                                                      ([WaitRight] , ([([ask_right], [ask_right])], [NotEating]));
                                                                                      ([WaitRight] , ([([ask_right], [ask_right])], [WaitLeft]));
                                                                                      ([WaitRight] , ([([ask_right], [ask_right])], [Eat]));
                                                                                      ([WaitRight] , ([([ask_right], [ask_right])], [WaitRight]));
                                                                                      ([NotEating] , ([([ask_right], [right_free])], [NotEating]));
                                                                                      ([WaitLeft] , ([([ask_right], [right_free])], [WaitLeft]));
                                                                                      ([Eat] , ([([ask_right], [right_taken])], [Eat]));
                                                                                      ([WaitRight] , ([([ask_right], [right_taken])], [WaitRight]));
                                                                                      ([NotEating] , ([([right_free], [right_free])], [WaitRight]));
                                                                                      ([WaitLeft] , ([([right_free], [right_free])], [WaitRight]));
                                                                                      ([WaitRight] , ([([right_taken], [ask_right])], [WaitRight]));
                                                                                      ([WaitRight] , ([([ask_right], [ask_right])], [NotEating]));
                                                                                      ([WaitRight] , ([([ask_right], [ask_right])], [WaitLeft]));
                                                                                      ([WaitRight] , ([([right_free], [rel_forks])], [Eat]));
                                                                                      ([Eat] , ([([rel_forks], [rel_forks])], [Eat]));
                                                                                      ([Eat] , ([([rel_forks], [ε])], [NotEating]));
                                                                                      ([NotEating] , ([([ε], [ε])], [NotEating]))]
                                                                                      [NotEating].

Extraction DINING_1E.

(**Variable SPIN_LOCK_1E represents the 1E behavior (behavior_1E) of Spin Lock protocol for a given protocol 
signature (SPIN_LOCK_Prot)*)
Definition SPIN_LOCK_1E : behavior_1E SPIN_LOCK_Prot := b_1E SPIN_LOCK_Prot  [Start ; Waiting ; NB ; B ; HasObject ]
                                                                                                                                            [ ([ε], [req]) ;
                                                                                                                                              ([req], [req]) ;
                                                                                                                                              ([ack], [ack]) ;
                                                                                                                                              ([ack], [into]) ;
                                                                                                                                              ([into], [into]) ;
                                                                                                                                              ([nack], [nack]) ;
                                                                                                                                              ([nack], [req]) ;
                                                                                                                                              ([into], [rel]) ;
                                                                                                                                              ([rel], [ε]) ;
                                                                                                                                              ([ε], [ε]) ]
                                                                                                                                            [ ([Start] , ([([ε], [req])], [Waiting]));
                                                                                                                                              ([Waiting] , ([([req], [req])], [NB]));
                                                                                                                                              ([Waiting] , ([([req], [req])], [B]));
                                                                                                                                              ([NB] , ([([req], [req])], [B]));
                                                                                                                                              ([B] , ([([req], [req])], [B]));
                                                                                                                                              ([B] , ([([ack], [ack])], [Waiting]));
                                                                                                                                              ([B] , ([([nack], [nack])], [Waiting]));
                                                                                                                                              ([B] , ([([ack], [ack])], [Waiting]));
                                                                                                                                              ([Waiting] , ([([ack], [into])], [HasObject]));
                                                                                                                                              ([Waiting] , ([([nack], [req])], [Waiting]));
                                                                                                                                              ([Waiting] , ([([req], [req])], [Waiting]));
                                                                                                                                              ([HasObject] , ([([into], [into])], [HasObject]));
                                                                                                                                              ([HasObject] , ([([into], [rel])], [Start]));
                                                                                                                                              ([Start] , ([([rel], [rel])], [B]));
                                                                                                                                              ([B] , ([([rel], [ε])], [NB]));
                                                                                                                                              ([NB] , ([([ε], [ε])], [Start]))]
                                                                                                                                              [ Start].

Extraction SPIN_LOCK_1E.

(**Cut-off*)

(**Linear Temporal Logic minus X that means not including the next operator*)
Variable P : Set.

(**It represents set of LTL/X formulas*)
Inductive ϕ  : Type :=
  | id_ϕ : P -> ϕ 
  | form_ϕ : ϕ -> ϕ
  | not_ϕ : ϕ  -> ϕ 
  | and_ϕ : ϕ  -> ϕ  -> ϕ 
  | or_ϕ : ϕ  -> ϕ  -> ϕ 
  | until_ϕ : ϕ  -> ϕ  -> ϕ 
  | G_ϕ : ϕ  -> ϕ  .

(**There are two kind of properties involved : (pro1) whcih involves only one process  or
(pro2) which involves two processes*)
Inductive properties : Type :=
 | pro1 : process_index -> properties
 | pro2 : (prod process_index process_index) -> properties.

(** ϕ_type represents the property ϕ which may be of the form ϕ(i) or ϕ(i,j) depending on the type of properties 
we are trying to verify*) 
Inductive ϕ_type : Type :=
 | ϕ_form : ϕ -> properties -> ϕ_type.

(** A path in 1 E*)
(**There is only one kind of path(path_in_1E) in the 1E behavior which is the sequence of input/output
events (L) for a given 1E behavior (behavior_1E) *)
Inductive path_in_1E (P : Prot) (beh_1E : behavior_1E P) : L -> Prop :=
   | path : forall  Q1E_1  L_1 Δ1E_1 QI1E_1 ,
               beh_1E = b_1E P Q1E_1  L_1  Δ1E_1 QI1E_1 ->
               path_in_1E P beh_1E L_1.

(** Language of 1 E*)
(** Language of 1E is the set of path of 1E ({L}) for a given 1E (behavior_1E)*)
Inductive  language_of_1E (P : Prot) (beh_1E : behavior_1E P)  : list L -> Prop  :=
  | l_1E :   forall L,
                language_of_1E P beh_1E L.

(**A path in sys(k)*)
(**There is only one kind of path(path_in_sys) in the parameterized system instance which is the sequence of input/output
events (L) for a given parameterized system instance sys(k) (parameterized_system_instance) *)
Inductive path_in_sys (P : Prot) (k : nat) (R : parameterized_system_topology  P) (sys_k : parameterized_system_instance P k R)  : L -> Prop :=
  | path_k : forall L1,
                 path_in_sys P k R sys_k L1.

Hypothesis Aeq_dec_L : forall A A1 : L , { A= A1} + {A <> A1}.

 Fixpoint isMem_list_L (a:L) (P: list L) : bool :=
    match P with
    | nil => false
    | B :: Bl => match Aeq_dec_L a B with 
                                   | left _ => true
                                   | right _ => isMem_list_L a Bl
        end
end.

Extraction  isMem_list_L.

Fixpoint remove_one_L (v:L) (s: list L) : list L :=
  match s with
    | [] => []
    | h::t => if (Aeq_dec_L  h v) then t else h::(remove_one_L v t)
  end.

Extraction  remove_one_L.

Fixpoint isSubset_of_list_L (s1: list L) (s2: list L) : bool :=
  match s1 with
    | nil => true
    | h::t => if (isMem_list_L h s2) then (isSubset_of_list_L t (remove_one_L h s2)) else false
  end.

Extraction  isSubset_of_list_L.

(**Parameterized system instance language*)
(** Language of sys is the set of path of sys(k) ({L}) for a given parameterized system instance sys(k) (parameterized_system_instance) *)
Inductive  language_of_sys (P : Prot) (k : nat) (R : parameterized_system_topology  P) (sys_k : parameterized_system_instance P k R) : list L -> Prop :=
  | l_sys :   forall L,
                language_of_sys P k R sys_k L.

Inductive head_path (P : Prot) (k : nat) (R : parameterized_system_topology  P) (sys_k : parameterized_system_instance P k R) (L1 : L)  : sys_action -> Prop :=
  | head : forall s1 sl,
              path_in_sys P k R sys_k L1 ->
               L1 = ( s1 :: sl) ->
               head_path P k R sys_k L1 s1.

Inductive tail_path (P : Prot) (k : nat) (R : parameterized_system_topology  P) (sys_k : parameterized_system_instance P k R) (L1 : L)  : L -> Prop :=
  | tail : forall s1 sl,
               path_in_sys P k R sys_k L1 ->
               L1 = ( s1 :: sl) ->
               tail_path P k R sys_k L1 sl.

(** The following inductive relation represents the semantics of set of LTL/X property *)
Inductive entail_path   (L1 : L) (a : nat) (ϕ' : ϕ_type) : bool -> Prop :=
 | entail_P : forall P1   p,
                   ϕ' = ϕ_form (id_ϕ P1) p  ->
                  entail_path  L1 a ϕ' true
 | entail_until : forall ϕ1 ϕ2   w p,
                       w <= a ->
                       ϕ' = ϕ_form (until_ϕ  ϕ1 ϕ2) p  ->
                       entail_path  L1 a (ϕ_form ϕ2 p) true  /\  entail_path L1 w (ϕ_form ϕ1 p) true ->
                       entail_path  L1 a ϕ' true
 | entail_G : forall ϕ1   p ,
                    ϕ' = ϕ_form (G_ϕ ϕ1) p  ->
                    entail_path  L1 a ϕ' true
 | entail_not : forall ϕ1 p ,
                    ϕ' = ϕ_form (not_ϕ  ϕ1) p  ->
                    entail_path L1 a (ϕ_form ϕ1 p) false ->
                    entail_path  L1 a ϕ' true
  | entail_and : forall  ϕ1 ϕ2  p ,
                    ϕ' = ϕ_form (and_ϕ ϕ1 ϕ2) p ->
                    entail_path  L1 a (ϕ_form ϕ1 p) true /\ entail_path  L1 a (ϕ_form ϕ2 p) true ->
                    entail_path  L1 a ϕ' true
  | entail_or : forall ϕ1 ϕ2   p ,
                    ϕ' = ϕ_form (or_ϕ ϕ1 ϕ2) p ->
                    entail_path  L1 a (ϕ_form ϕ1 p) true \/ entail_path L1 a (ϕ_form ϕ2 p) true ->
                    entail_path  L1 a ϕ' true
  | entail_ϕ : forall ϕ1  p,
                   ϕ' = ϕ_form (ϕ1) p  ->
                   entail_path  L1 a ϕ' true
  | entail_no_ϕ : forall ϕ1  p,
                   ϕ' = ϕ_form (ϕ1) p  ->
                   entail_path  L1 a ϕ' false.

Check entail_path.

(**The following inductive relation specfies that 1E behavior entails a property ϕ iff path of 1E behavior entails the property ϕ*)
Inductive entail_1E (P: Prot) (beh_1E : behavior_1E P) (ϕ1 : ϕ_type) : bool -> Prop :=
  | sat : forall L1 a ,
           path_in_1E P beh_1E L1 ->
           entail_path L1 a ϕ1 true ->
           entail_1E P beh_1E ϕ1 true
 | sat_not : forall L1  a,
           path_in_1E P beh_1E L1 ->
           entail_path L1 a ϕ1 false ->
           entail_1E P beh_1E ϕ1 false.

(**The following inductive relation specfies that a parameterized system instance entails a property ϕ iff path of the system entails the property ϕ*)
Inductive entail_sys (P : Prot) (k : nat) (R : parameterized_system_topology  P) (sys_k : parameterized_system_instance P k R) (ϕ1 : ϕ_type) : bool -> Prop :=
  | satisfy : forall S1 T1 Si1 L1 a,
                sys_k = sys P k R S1 L1 T1 Si1 ->
                path_in_sys P k R sys_k L1 ->
                entail_path L1 a ϕ1 true ->
                entail_sys P k R sys_k ϕ1 true 
  | satisfy_not : forall S1 T1 Si1 L1 a,
                sys_k = sys P k R S1 L1 T1 Si1 ->
                path_in_sys P k R sys_k L1 ->
                entail_path L1 a ϕ1 false ->
                entail_sys P k R sys_k ϕ1 false .


Check entail_sys.

Definition p : id := Id 0.
Definition q : id := Id 1.


Inductive less_equal (n : process_index) : process_index -> Prop :=
| le_0 : 
           less_equal n n
| le_n_m : forall m, 
                less_equal n m ->
                less_equal n (m+1) 
where "n <= m" := (less_equal n m) : nat_scope.

Hypothesis nat_rule1 : forall i k : process_index, 1<= i <= k.
Hypothesis nat_rule2 : forall k n : process_index, k <= n.
Hypothesis nat_rule3 : forall i j : process_index, i <> j.
Hypothesis nat_rule4 : forall i j : process_index, i =  j + 1.

Axiom path_element_of_language : forall  P k R sys_k L2  L1  ,
                                                    language_of_sys P k R sys_k L2 ->
                                                    path_in_sys P k R sys_k L1 ->
                                                    isMem_list_L L1 L2 =  true .

(**Cut-off*)
(** k (nat) is said to be the cut-off  for a given protocol signature (Prot) and parameterized system instance with k processes
(parameterized_system_instance (sys_k) ) if one of the following (case_1 or case_2) holds*)
(** There are two kind of cut-off condition to specify that k is the cut-off. *)
Inductive cut_off (P : Prot) (k : nat) (R : parameterized_system_topology P) (sys_k : parameterized_system_instance P k R) : Prop := 
  | case_1 : forall i S1 L1 T1 Si1 n S2 L2 T2 Si2 sys_n ϕ1,
                  1 <= i <= k ->
                   sys_k = sys P k R S1 L1 T1 Si1  ->
                   entail_sys P k R sys_k (ϕ_form ϕ1 (pro1 i)) true->
                   k <= n ->
                   1 <= i <= n ->
                   sys_n = sys P n R S2 L2 T2 Si2 ->
                   entail_sys P n R sys_n (ϕ_form ϕ1 (pro1 i)) true ->
                   cut_off P k R sys_k 
  | case_2 :  forall i j S1 L1 T1 Si1 n S2 L2 T2 Si2 sys_n ϕ1,
                  1 <= i <= k ->
                  1 <= j <= k ->
                  i = j+1 \/ i = j-1 \/ ((j = 1) /\ (i = k) ) ->
                  i <> j ->
                   sys_k = sys P k R S1 L1 T1 Si1 ->
                   entail_sys P k R sys_k (ϕ_form ϕ1 (pro2 ((i), j))) true->
                   k <= n ->
                   1 <= i <= n ->
                   1 <= j <= n ->
                   i <> j ->
                   sys_n = sys P n R S2 L2 T2 Si2 ->
                   entail_sys P n R sys_n (ϕ_form ϕ1 (pro2 ((i), (j)))) true->
                   cut_off P k R sys_k.


(**Maximal behavior induced by a process in a system instance sys(k)*)
(** The set of paths (list L) represents maximum behavior of a process (process_index) in a system instance (parameterized_system_instance)
iff the following eveidences is satisfied for the proposition (behav_max_sys_k)*)
(** There is one constructor which describes the properties to be satisfied by the maximum behavior*)
Inductive behav_max_sys_k (P : Prot) (k : nat) (R : parameterized_system_topology P) (sys_k : parameterized_system_instance P k R)  ( i : process_index) : (list  L) -> Prop :=
    | max : forall  S2 L2 T2 Si2 l1 e e' e'' ,
                (1 <= i <= k)  -> 
                i >= 0 -> 
                sys_k = sys P k R S2 L2 T2 Si2 -> 
                isMem_L ([ε] , [e]) L2 = true -> 
                isMem_L ([e'] , [e'']) L2  = true-> 
                isMem_L ([e] , [e']) L2 = true -> 
                isMem_list_L [([ε] , [e])] l1 = true -> 
                isMem_list_L [([e'] , [e''])] l1  = true-> 
                isMem_list_L [([e] , [e'])] l1 = true -> 
                isMem_list_L [([ε] , [e]) ; ([e] , [e']) ; ([e'] , [e'']) ] l1 = true -> 
                behav_max_sys_k P k R sys_k i l1.

(**There is one kind of maximum behavior induced by a process in system instance which represents the set 
of paths (list L) in the system instance (sys_k)*)
Inductive max_sys (P : Prot) (k : nat) (R : parameterized_system_topology P) (sys_k : parameterized_system_instance P k R) ( p : process_index): Type :=
  | max_k : list L ->  max_sys P k R sys_k p .

(**The following inductive relation specfies that a maximum behavior induced by a process entails a property ϕ iff path of the max(sys(k)) entails the property ϕ*)
Inductive entail1 (P : Prot) (k : nat) (R : parameterized_system_topology P)  (sys_k : parameterized_system_instance P k R) (p q : process_index)  (M : max_sys P k R sys_k p ) (ϕ1 : ϕ_type) : bool -> Prop :=
  | satisfies1 : forall L1 L1' a,
                      M = max_k P k R sys_k p L1 ->
                     isMem_list_L L1' L1 = true ->
                     entail_path L1'  a ϕ1 true ->
                     entail1 P k R sys_k  p q M  ϕ1 true
 | not_satisfies1 : forall L1 L1' a ,
                      M = max_k P k R sys_k p L1 ->
                      isMem_list_L L1' L1 = true ->
                      entail_path L1' a  ϕ1 false ->
                      entail1 P k R sys_k  p q M  ϕ1 false .

(** The following axiom specifies that for a given protocol signature (P), maximum behavior induced 
by a process (i)  in system instance (L1) is the subset of the language of the 1E (L2).*)
Axiom max_subset_1E : forall  P k R sys_k L2  L1  beh_1E i max_sys_k,
                                                    max_sys_k = max_k P k R sys_k i L1 ->
                                                    language_of_1E P beh_1E L2 ->
                                                    isSubset_of_list_L L1 L2 = true.

Definition inc (n : nat) : nat :=
  match n with
    | O => 1
    | S n' =>  S (S n')
  end.

Inductive com : Type :=
   | CAss : nat -> nat -> com
   | CWhile : Prop -> com -> com.

Notation "'WHILE' b 'DO' c 'END'" := 
  (CWhile b c) (at level 80, right associativity).

Notation "x '::=' a" :=
  (CAss x a) (at level 60).

(**Imperative definition for the algorithm*)
Inductive procedure_cutoff' (P : Prot) (R : parameterized_system_topology P) : com -> nat -> Prop :=
    | algo : forall sys_k S1  T1 Si1  beh_1E Q1 L1E Δ1E_1 QI1E_1 L1  L1' L2' k,
                k >= 2 ->
                sys_k = sys P 2 R S1 L1 T1 Si1 ->
                beh_1E = b_1E P Q1  L1E Δ1E_1 QI1E_1 ->
                language_of_sys P 2 R (sys P 2 R S1 L1 T1 Si1 ) L1' ->
                language_of_1E P beh_1E L2' ->
                procedure_cutoff' P R (WHILE ( isSubset_of_list_L L2' L1' = false ) DO 
                k ::= (k+1) END) k.

(** The following relation (procedure_cutoff) specifies the conditions for finding the cut-off depending on the 
condition that L(1E) is the subset of L(sys(k)) or not *)
Inductive procedure_cutoff (P: Prot) (R : parameterized_system_topology P) : nat -> Prop :=
 | algo_1 :  forall S1 T1 L1 Sin1 beh_1E  L2' L1' k ,
              k >= 2  ->
              language_of_sys P k R (sys P k R S1 L1 T1 Sin1 ) L1' ->
              language_of_1E P beh_1E L2' ->
              isSubset_of_list_L L2' L1' = true ->
              procedure_cutoff P R k
 | algo_2 : forall S1 T1 L1 Sin1 beh_1E  L2' L1' k L1'' S2 L2 T2 Sin2 k' ,
              k >= 2  ->
              language_of_sys P k R (sys P k R S1 L1 T1 Sin1 ) L1' ->
              language_of_1E P beh_1E L2' ->
              isSubset_of_list_L L2' L1' = false ->
              inc k = k' ->
              language_of_sys P k' R (sys P k' R S2 L2 T2 Sin2 ) L1'' ->
              isSubset_of_list_L L2' L1'' = true ->
              procedure_cutoff P R k'.


(**Example showing that algorithm for DME protocol produces 2 as the cut-off*)
Lemma procedure_cutoff_DME : procedure_cutoff DME_Prot DME_Topo 2.
Proof.
apply algo_1 with  [ ([2] , ([Start] , [ε])) ;
                            ([1] , ([Idle] , [ε])) ;
                            ([2] , ([Idle] , [token])) ;
                            ([2] , ([Ncs] , [ε ; choose])) ;
                            ([1] , ([Idle] , [ε ])) ;
                            ([2] , ([Ncs] , [choose])) ;
                            ([2] , ([Cs] , [ε ; into])) ;
                            ([2] , ([Idle] , [ε ; token])) ]

                          [ ([([1] , ([Idle] , [ε])) ; ([2] , ([Start] , [ε])) ] , ([([ε], [token])], [([1] , ([Idle] , [ε ])) ; ([2] , ([Idle] , [token]))])) ;
                            ( [([2] , ([Idle] , [token])); ([1] , ([Idle] , [ε]))] , ([([token], [choose])], [([2] , ([Idle] , [  ])) ; ([1] , ([Ncs] , [ε ;choose]))])) ;
                            ( [([2] , ([Idle] , [ ])) ; ([1] , ([Ncs] , [ε ; choose]))] , ([([choose], [token])], [([2] , ([Idle] , [ ])) ; ([1] , ([Idle] , [ε ; token ]))])) ;
                            ( [([2] , ([Idle] , [ ])); ([2] , ([Ncs] , [ε  ; choose]))] , ([([choose], [into])], [([2] , ([Idle] , [  ])); ([1] , ([Cs] , [ε ; into ]))])) ]

                          [ ([ε], [token]) ;
                            ([token], [choose]) ;
                            ([choose], [token]) ;
                            ([choose], [into]) ;
                            ([into], [token]) ]
                          [ ([1] , ([Idle] , [ε ])) ;
                            ([2] , ([Start] , [ε])) ]
                          DME_1E
                         [ [ ([ε], [token]) ;
                             ([token], [choose]) ;
                             ([choose], [token]) ;
                             ([choose], [into]) ;
                             ([into], [token]) ]]
                         [ [ ([ε], [token]) ;
                             ([token], [choose]) ;
                             ([choose], [token]) ;
                             ([choose], [into]) ;
                             ([into], [token]) ]].
auto.
apply l_sys.
apply l_1E.
simpl.
destruct (Aeq_dec_L).
reflexivity.
destruct n.
reflexivity.
Qed.

Check procedure_cutoff.

Inductive isMem_max_sys  (P : Prot) (k : nat) (R : parameterized_system_topology P) (sys_k : parameterized_system_instance P k R) ( p : process_index)(s : L) (S : max_sys P k R sys_k p) : bool -> Prop :=
 | mem_max1 : S = max_k P k R sys_k  p nil->
                 isMem_max_sys P k R sys_k p s S false
 | mem_max2 : forall s1 S1,
                S = max_k P k R sys_k  p (s1 :: S1) ->
                s = s1 ->
                isMem_max_sys P k R sys_k p s S true
 | mem_max3 : forall s1 S1,
               S = max_k P k R sys_k  p (s1 :: S1) ->
               s <> s1 ->
               isMem_max_sys P k R sys_k p s (max_k P k R sys_k  p S1) true ->
               isMem_max_sys P k R sys_k p  s S true.


(**Path Projection*)

Definition pair_process := (prod process_index process_index).

(** The relation (path_projection) represents the projected path with respect to adjacent processes (R = (i,j)) for a 
given system instance (sys_k) with k number of processes which is sequence of input/output events in the path (L).
There is only one constructor which describes the property of any memebr of projected path(L_proj) *)
Inductive path_projection (P : Prot) (k : nat) (R1 : parameterized_system_topology P) (sys_k : parameterized_system_instance P k R1) (L2 : L) (P1 : path_in_sys P k R1 sys_k L2)  (R :  pair_process )  : L -> Prop :=
   | proj_path : forall  i j E E' q  S1 L1 T1 Sin1  e e'  L1' l1 q' L_proj,
                       1 <= i <= k ->
                       1 <= j <= k ->
                       R = (i, j) ->
                       i = j+1 \/ i = j-1 \/ ((j = 1) /\ (i = k) ) ->
                       R1 = Topo P [topo P (E, ([i], [k])) [j]] ->
                       sys_k = sys P k R1 S1 L1 T1 Sin1 ->
                       language_of_sys P k R1 sys_k L1' -> 
                       path_in_sys P k R1 sys_k L1 -> 
                       isMem_list_L L1 L1' = true ->
                       isMem_L l1 L1 = true ->
                       l1 = ([e], [e']) ->
                       isMem_T P R1 k ([([i], ([q], E))] , ([([e], [e'])] , [([i], ([q'], E'))])) T1 true-> 
                       (isMem_events e E = false /\ isMem_events e E' = true) \/ (isMem_events e' E = true /\ isMem_events e' E' = false) ->
                       isMem_L l1 L_proj = true ->
                       path_projection P k R1 sys_k L2 P1 R L_proj.

Check path_projection.

(** The relation (T_projection) represents the projection of transition relation (T) with respect to 
adjacent processes (R = (i,j)). There is only one kind of constructor which describes the property of any memeber of
the projected transition(T2)*)
Inductive T_projection (T1 : T)  (R : pair_process ) : T -> Prop :=
   | proj_T : forall i j P k R1 S1 L1 Sin1 E E' q q' e e' sys_k T2,
                  sys_k = sys P k R1 S1 L1 T1 Sin1 ->
                  1 <= i <= k ->
                  1 <= j <= k ->
                  R = (i, j) ->
                  i = j+1 \/ i = j-1 \/ ((j = 1) /\ (i = k) ) ->
                  isMem_T P R1 k ([([i], ([q], E))] , ([([e], [e'])] , [([i], ([q'], E'))])) T1 true-> 
                  (isMem_events e E = false /\ isMem_events e E' = true) \/ (isMem_events e' E = true /\ isMem_events e' E' = false) ->
                  isMem_T P R1 k ([([i], ([q], E))] , ([([e], [e'])] , [([i], ([q'], E'))])) T2 true-> 
                  T_projection T1 R T2.

(** The relation (system_projection) represents the system projection for a given system instance (sys_k) with 
respect to adjacent processes (R = (i,j)). *)
Inductive system_projection (P : Prot) (k : nat) (R1 : parameterized_system_topology P) (sys_k : parameterized_system_instance P k R1) (R :  pair_process  )  : parameterized_system_instance P k R1 -> Prop :=
  | proj_sys : forall  i j S1 L1 T1 Sin1 sys_k_proj T2,
                       1 <= i <= k ->
                       1 <= j <= k ->
                       R = (i, j) ->
                        i = j+1 \/ i = j-1 \/ ((j = 1) /\ (i = k) )->
                       sys_k = sys P k R1 S1 L1 T1 Sin1 ->
                       T_projection T1 R T2 ->
                       sys_k_proj = sys P k R1 S1 L1 T2 Sin1 ->
                       system_projection P k R1 sys_k R sys_k_proj.

(**The theorem (lemma_1)  says that if sys(k) entails property ϕ(i,j) 
then projected behavior of the system with respect to (i,j) also entails the same property*)
Theorem lemma_1 : forall  i  j P k R R1 sys_k  S1 L1 T1 Sin1 T2 ϕ1 a,
                                1 <= i <= k ->
                                1 <= j <= k ->
                                R1 = (i,j) ->
                                i = j+1 \/ i = j-1 \/ ((j = 1) /\ (i = k) ) ->
                                sys_k = sys P k R S1 L1 T1 Sin1 ->
                                T_projection T1 R1 T2 ->
                                entail_path L1  a (ϕ_form ϕ1 (pro2((i), j))) true ->
                                entail_sys P k R sys_k (ϕ_form ϕ1 (pro2((i), j))) true <-> entail_sys P k R (sys P k R S1 L1 T2 Sin1) (ϕ_form ϕ1 (pro2((i), j))) true.
Proof.
intros.
split.
intros.
apply satisfy with S1 T2 Sin1 L1 a0 .
reflexivity.
apply path_k.
destruct ϕ1.
apply entail_P with p0 (pro2 (i0, j)) .
reflexivity.
apply  entail_ϕ with (form_ϕ ϕ1) (pro2 (i0, j)).
reflexivity.
apply entail_not with ϕ1   (pro2 (i0, j)) .
reflexivity.
apply entail_no_ϕ with ϕ1 (pro2 (i0, j)) .
reflexivity.
apply entail_and with ϕ1_1 ϕ1_2 (pro2 (i0, j)).
reflexivity.
split.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_ϕ with ϕ1_2 (pro2 (i0, j)).
reflexivity.
apply entail_or with ϕ1_1 ϕ1_2 (pro2 (i0, j)).
reflexivity.
left.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_until with ϕ1_1 ϕ1_2 a0 (pro2 (i0, j))  .
simpl.
auto.
reflexivity.
split.
apply entail_ϕ with ϕ1_2 (pro2 (i0, j)).
reflexivity.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_G with  ϕ1 (pro2 (i0, j)).
reflexivity.
intros.
apply satisfy with S1 T1 Sin1 L1 a0.
assumption.
apply path_k.
apply entail_ϕ with ϕ1 (pro2 (i0, j)).
reflexivity.
Qed.

(** The lamma (lemma_2) states that for any system instance (sys_k) and for all adjacent processes (i,j) if sys_k entails 
φ(i, j)  then max(sys(k)) also entails  φ(i, j)  and vice versa*)
Theorem lemma_2 : forall  i  j P k R sys_k    L1' ϕ1 S1 L1 T1 Si1 a ,
                       1 <= i <= k /\  1 <= j <= k ->
                       i = j+1 \/ i = j -1 \/ (i = k /\ j = 1)  ->
                      sys_k = (sys P k R S1 L1 T1 Si1) ->
                      path_in_sys P k R sys_k L1 ->
                      entail_path L1  a (ϕ_form ϕ1 (pro2((i), j))) true ->
                      entail_sys P k R sys_k (ϕ_form ϕ1 (pro2((i), j))) true <-> entail1 P k R sys_k  (i) (j) (max_k P k R sys_k i L1') (ϕ_form ϕ1 (pro2((i), (j)))) true .
Proof.
intros.
split.
intros.
apply satisfies1 with L1'  L1 a0  .
reflexivity.
apply path_element_of_language with P0 k R sys_k .
apply l_sys.
apply path_k.
destruct ϕ1.
apply entail_P with p0 (pro2 (i0, j)) .
reflexivity.
apply  entail_ϕ with (form_ϕ ϕ1) (pro2 (i0, j)).
reflexivity.
apply entail_not with ϕ1  (pro2 (i0, j)) .
reflexivity.
apply  entail_no_ϕ with ( ϕ1) (pro2 (i0, j)).
reflexivity.
apply entail_and with ϕ1_1 ϕ1_2 (pro2 (i0, j)).
reflexivity.
split.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_ϕ with ϕ1_2 (pro2 (i0, j)).
reflexivity.
apply entail_or with ϕ1_1 ϕ1_2 (pro2 (i0, j)).
reflexivity.
left.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_until with ϕ1_1 ϕ1_2 a0 (pro2 (i0, j))  .
simpl.
auto.
reflexivity.
split.
apply entail_ϕ with ϕ1_2 (pro2 (i0, j)).
reflexivity.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_G with  ϕ1 (pro2 (i0, j)).
reflexivity.
intros.
apply satisfy with S1 T1 Si1 L1 a0.
assumption.
assumption.
apply entail_ϕ with ϕ1 (pro2 (i0, j)).
reflexivity.
Qed.

(** This lemma says that if the procedure_cutoff terminates and it returns k then L(1E) is the subset of L(sys_k)*)
Lemma theorem1 : forall P R S1 T1 L1 Sin1  L2' L1' beh_1E k ,
               language_of_sys P k R (sys P k R S1 L1 T1 Sin1 ) L1' ->
               language_of_1E P beh_1E L2' ->
               exists k , procedure_cutoff P R k -> 
               exists L1' L2', isSubset_of_list_L L2'  L1' = true .
Proof.
intros.
subst.
exists(k).
intros.
inversion H1.
exists(L1'0).
exists(L2'0).
assumption.
exists(L1'').
exists(L2'0).
assumption.
Qed.
(**The theorem (theorem_2) states that if there is a evidence for truth fulfillment of the condition language of 1E (language_of_1E) behavior is the subset of language of
sys(k) (langauge_of_sys) then if sys(k) entails ϕ we can also say that sys(n) entails ϕ and vice versa *)
Theorem theorem_2 : forall  i  j n P k R  sys_k  S1 L1 T1 Sin1 S2 L2 T2 Sin2 beh_1E ϕ1 L3 L1' l2 a a1,
                                1 <= i <= k ->
                                1 <= j <= k ->
                                i = j+1 \/ i = j-1 \/ ((j = 1) /\ (i = k) )->
                                n > k ->
                                sys_k = sys P k R S1 L1 T1 Sin1 ->
                                language_of_sys P k R sys_k L1' -> 
                                path_in_sys P k R sys_k L1 ->
                                isMem_list_L L1 L1' = true->
                                language_of_1E P beh_1E L3 ->
                                path_in_1E P beh_1E l2 ->
                                isMem_list_L l2 L3 = true->
                                isSubset_of_list_L L3 L1' = true ->
                                entail_path L1  a (ϕ_form ϕ1 (pro2((i), j))) true ->
                                entail_path L2  a1 (ϕ_form ϕ1 (pro2((i), j))) true ->
                                entail_sys P k R sys_k (ϕ_form ϕ1 (pro2((i), j))) true <-> entail_sys P n R (sys P n R S2 L2 T2 Sin2) (ϕ_form ϕ1 (pro2((i), j))) true.
Proof.
intros.
split.
intros.
apply satisfy with S2 T2 Sin2 L2 a0.
reflexivity.
apply path_k.
destruct ϕ1.
apply entail_P with p0 (pro2 (i0, j)) .
reflexivity.
apply  entail_ϕ with (form_ϕ ϕ1) (pro2 (i0, j)).
reflexivity.
apply entail_not with ϕ1   (pro2 (i0, j)) .
reflexivity.
apply entail_no_ϕ with ϕ1 (pro2 (i0, j)) .
reflexivity.
apply entail_and with ϕ1_1 ϕ1_2 (pro2 (i0, j)).
reflexivity.
split.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_ϕ with ϕ1_2 (pro2 (i0, j)).
reflexivity.
apply entail_or with ϕ1_1 ϕ1_2 (pro2 (i0, j)).
reflexivity.
left.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_until with ϕ1_1 ϕ1_2 a0 (pro2 (i0, j))  .
simpl.
auto.
reflexivity.
split.
apply entail_ϕ with ϕ1_2 (pro2 (i0, j)).
reflexivity.
apply entail_ϕ with ϕ1_1 (pro2 (i0, j)).
reflexivity.
apply entail_G with  ϕ1 (pro2 (i0, j)).
reflexivity.
intros.
apply satisfy with S1 T1 Sin1 L1 a0.
assumption.
assumption.
apply entail_ϕ with ϕ1 (pro2 (i0, j)).
reflexivity.
Qed.


(**Soundness*)
(** The theorem (theorem_3) states that if procedure cut-off terminates (procedure_cutoff P R k) (returns k) then the return value k is the cut-off
(cut_off P k R sys_k)*)
Theorem theoem_3 : forall n k P R sys_k sys_n S1 T1 Sin1 S2  T2 Si2 ϕ1 ϕ2 P1 L1 L2 L1' L2' a a1,
                                  sys_n = sys P n R S2 L2 T2 Si2 ->
                                  sys_k = sys P k R S1 L1 T1 Sin1 ->
                                  ϕ2 = (ϕ_form ϕ1 P1) ->
                                  language_of_sys P k R sys_k L1' -> 
                                 path_in_sys P k R sys_k L1 ->
                                 isMem_list_L L1 L1' = true->
                                 language_of_sys P n R sys_n L2' -> 
                                 path_in_sys P n R sys_n L2 ->
                                 isMem_list_L L2 L2' = true->
                                 entail_path L1  a ϕ2 true ->
                                 entail_path L2  a1 ϕ2 true ->
                                 procedure_cutoff P R k ->
                                 cut_off P k R sys_k.
Proof.
intros.
destruct P1.
apply case_1 with p0 S1 L1 T1 Sin1 n S2 L2 T2 Si2 sys_n ϕ1.
apply nat_rule1.
assumption.
apply satisfy with S1 T1 Sin1 L1 a0.
assumption.
assumption.
rewrite <- H1.
assumption.
apply nat_rule2.
apply nat_rule1.
assumption.
rewrite <- H1.
apply satisfy with S2 T2 Si2 L2 a2.
assumption.
assumption.
assumption.
destruct p0.
apply case_2 with p0 p1 S1 L1 T1 Sin1 n S2 L2 T2 Si2 sys_n  ϕ1.
apply nat_rule1.
apply nat_rule1.
constructor.
apply nat_rule4.
apply nat_rule3.
assumption.
rewrite H1 in H8.
apply satisfy with S1 T1 Sin1 L1 a0.
assumption.
assumption.
assumption.
apply nat_rule2.
apply nat_rule1.
apply nat_rule1.
apply nat_rule3.
assumption.
rewrite H1 in H9.
apply satisfy with S2 T2 Si2 L2 a2.
assumption.
assumption.
assumption.
Qed.
