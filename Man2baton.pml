

#define N 9
int upcrit = 0; /* For easy statement of mutual exlusion */
int downcrit = 0;

int ndown =0; /* Number of down cars in the ally */
int nup = 0; /* Number of up cars in the ally */

/* The three semaphores */
bool Sentry = true
bool Sdown = false
bool Sup = false;


/* Number of delayed cars (cars at ENTER) */
int ddown = 0;
int dup = 0;



inline P(sem){
	atomic
	{
		sem -> 
		sem = false
	}
}

inline V(sem){
	sem = true
}

inline SIGNAL() {
	if
	:: (nup == 0 && ddown > 0) ->
		ddown--;
		V(Sdown);
	:: (ndown == 0 && dup >0) ->
		dup--;
		V(Sup);
	:: else ->
		V(Sentry);
	fi
}


inline ENTER(number){
	if
	:: number < 5 ->
		P(Sentry);
		if
		:: nup > 0 ->
			ddown++;
			V(Sentry);
			P(Sdown)
		:: else -> skip
		fi;
		ndown++;
		SIGNAL();

	:: !(number<5) ->
		P(Sentry);
		if
		:: ndown > 0 ->
			dup++;
			V(Sentry);
			P(Sup)
		:: else -> skip
		fi;
		nup++;
		SIGNAL();
	fi
}

inline LEAVE(number){
	if
	:: number < 5 ->
		P(Sentry);
		ndown--;
		SIGNAL();
	:: !(number<5) ->
		P(Sentry);
		nup--;
		SIGNAL();
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

