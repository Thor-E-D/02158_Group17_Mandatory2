

#define N 5
int upcrit = 0; /* For easy statement of mutual exlusion */
int downcrit = 0;
int down =0;
int up = 0

bool SU = true;
bool SD = true;

#define P(sem){
	atomic
	{
		sem -> 
		sem = false;
	}
}
#define V(sem){
	sem = true;
}
#define ENTER(pid){
	if
	:: pid < 5 -> P(SD); if
						:: down == 0 -> 
								P(SU);
								down++; V(DS);
						fi	
	:: !(pid<5) -> P(SU); if 
						 :: up == 0 -> 
									P(SD); 
									up++; V(SU);
						  fi
	fi
}
#define LEAVE(pid){

	if
	:: pid < 5 -> down--; if
						  :: down == 0 -> V(SU);
						  fi	
	:: !(pid<5) -> up --; if up == 0 -> V(SD);
						  fi
	fi
}

active [N] Cars()
{
entry:
	ENTER(_pid);

crit:
	if
	:: _pid < 5 -> upcrit++;
	:: _pid > 4 -> downcrit++;
	fi
	assert(!(upcrit > 0 && downcrit > 0))
	if
	:: _pid < 5 -> upcrit--;
	:: _pid > 4 -> downcrit--;
	fi
}
exit:
	LEAVE(_pid);

