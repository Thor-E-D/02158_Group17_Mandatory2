#define N 9
int upcrit = 0; /* For easy statement of mutual exlusion */ 
int downcrit = 0; 
int down =0; 
int up = 0 
 
int SU = 1; 
int SD = 1; 

 
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
	if 
	:: number < 5 -> P(SD); 
							if 
							:: down == 0 ->  
								P(SU); 
							:: else -> skip
							fi;
							int tempDown;
							tempDown = down;
							tempDown++;
							down = tempDown;

							V(SD); 
	:: !(number<5) -> P(SU); 
							if
						 	:: up == 0 ->  
									P(SD);
							:: else -> skip
						  	fi;

							int tempUp;
							tempUp = up;
							tempUp++;
							up = tempUp;

							V(SU);
	fi 
} 

inline LEAVE(number){ 
 
	if 
	:: number < 5 -> 
		int tempDown;
		tempDown = down;
		tempDown--;
		down = tempDown;

		if 
		:: down == 0 -> 
			V(SU); 
		:: else -> skip
		fi;	 
		:: !(number<5) -> 
		int tempUp;
		tempUp = up;
		tempUp--;
		up = tempUp;

		if 
		:: up == 0 -> 
			V(SD); 
		:: else -> skip
		fi;
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

active proctype assertionThing()
{
	atomic{(upcrit > 0 && downcrit > 0)} ->
	assert(false);
}