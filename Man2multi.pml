

#define N 5
int upcrit = 0; /* For easy statement of mutual exlusion */
int downcrit = 0;
int down =0;
int up = 0

bool SU = true;
bool SD = true;

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

inline ENTER(hej){
	if
	:: hej < 5 -> P(SD); if
						:: down == 0 -> 
								P(SU);
						fi;
							down++; 
							V(SD);
	:: !(hej<5) -> P(SU); if 
						 :: up == 0 -> 
									P(SD); 
						  fi;
							up++; 
							V(SU);
	fi
}

inline LEAVE(hej){

	if
	:: hej < 5 -> 
		down--; 
		if
		:: down == 0 -> 
			V(SU);
		fi;	
	:: !(hej<5) -> 
		up--; 
		if 
		:: up == 0 -> 
			V(SD);
		fi;
	fi
}

active [N] proctype Cars()
{
entry:
	ENTER(_pid);

crit:
	if
	:: _pid < 5 -> upcrit++;
	:: _pid > 4 -> downcrit++;
	fi;
	assert(!(upcrit > 0 && downcrit > 0));
	if
	:: _pid < 5 -> upcrit--;
	:: _pid > 4 -> downcrit--;
	fi;

exit:
	LEAVE(_pid);

}

