

#define N 4
int upcrit = 0; /* For easy statement of mutual exlusion */
int downcrit = 0;

/* The three semaphores */
int Sentry = 1
int Sdown = 0
int Sup = 0;

int ndown = 0;	/* Number of down cars in the ally */
int nup = 0;	/* Number of up cars in the ally */


/* Number of delayed cars (cars at ENTER) */
int ddown = 0;
int dup = 0;



inline P(sem){
	atomic
	{
		sem > 0 -> 
		sem--;
	}
}

inline V(sem){
	sem++;
}


inline ENTER(number){
	int tmp;
	if
	:: number < (N/2) ->
		P(Sentry);
		if
		:: nup > 0 ->
			tmp = ddown;
			tmp++;
			ddown = tmp;
			V(Sentry);
			P(Sdown)
		:: else -> skip
		fi;
		tmp = ndown;
		tmp++;
		ndown = tmp;
		if
		:: ddown > 0 ->
			tmp = ddown;
			tmp--;
			ddown = tmp;
			V(Sdown);
		:: else -> V(Sentry);
		fi

	:: !(number < (N/2)) ->
		P(Sentry);
		if
		:: ndown > 0 ->
			tmp = dup;
			tmp++;
			dup = tmp;
			V(Sentry);
			P(Sup)
		:: else -> skip
		fi;
		tmp = nup;
		tmp++;
		nup = tmp;
		if
		:: dup > 0 ->
			tmp = dup;
			tmp--;
			dup = tmp;
			V(Sup);
		:: else -> V(Sentry);
		fi
	fi
}

inline LEAVE(number){
	int tmp;
	if
	:: number < (N/2) ->
		P(Sentry);
		tmp = ndown;
		tmp--;
		ndown = tmp;
		if
		:: (ndown == 0 && dup > 0) ->
			tmp = dup;
			tmp--;
			dup = tmp;
			V(Sup);
		:: else ->
			V(Sentry)
		fi		


	:: !(number < (N/2)) ->
		P(Sentry);
		tmp = nup;
		tmp--;
		nup = tmp;
		if
		:: (nup == 0 && ddown > 0) ->
			tmp = ddown;
			tmp--;
			ddown = tmp;
			V(Sdown);
		:: else ->
			V(Sentry)
		fi		
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
	:: _pid < (N/2) -> upcrit++; 
	:: else -> downcrit++; 
	fi;
	if 
	:: _pid < (N/2) -> upcrit--; 
	:: else -> downcrit--; 
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

active proctype nSafety()
{
	atomic{!(nup + ndown <= N)} ->
	assert(false);
}


/* 	Checking the split binary semaphore propability
	the split semaphore must never have more than one true value
	We check this by cheking that they together never become greater than one*/
active proctype splitBinaryProp()
{
	atomic{(Sentry+Sdown+Sup > 1)} ->
	assert(false);
}



