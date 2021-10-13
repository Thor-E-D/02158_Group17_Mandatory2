

#define N 9
int upcrit = 0; /* For easy statement of mutual exlusion */
int downcrit = 0;
int ndown =0; /* Number of down cars in the ally */
int nup = 0 /* Number of up cars in the ally */

inline ENTER(number){
	if
	:: number < 5 ->
		atomic { 
			nup == 0 ->
			ndown++;
		}
	:: !(number<5) ->
		atomic {
			ndown == 0 ->
			nup++;
		}
	fi
}

inline LEAVE(number){
	if
	:: number < 5 ->
		atomic {ndown--;}
	:: !(number<5) ->
		atomic {nup--;}
	fi
}

active [N] proctype Cars()
{
	do
	:: true ->
entry:
	ENTER(_pid);

crit:
	
	if 
	:: _pid < 5 -> upcrit++; 
	:: _pid > 4 -> downcrit++; 
	fi;
	if 
	:: _pid < 5 -> upcrit--; 
	:: _pid > 4 -> downcrit--; 
	fi;

exit:
	LEAVE(_pid);
	od

}

active proctype allySafety()
{
	atomic{(upcrit > 0 && downcrit > 0)} ->
	assert(false);
}

