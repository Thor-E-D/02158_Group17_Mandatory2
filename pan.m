#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC assertionThing */
	case 3: /* STATE 1 - Man2multi.pml:110 - [(((upcrit>0)&&(downcrit>0)))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!(((now.upcrit>0)&&(now.downcrit>0))))
			continue;
		/* merge: assert(0)(0, 3, 4) */
		reached[1][3] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 4: /* STATE 4 - Man2multi.pml:112 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Cars */
	case 5: /* STATE 2 - Man2multi.pml:26 - [((pid<5))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)((P0 *)this)->_pid)<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 3 - Man2multi.pml:16 - [(SD)] (14:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((int)now.SD)))
			continue;
		/* merge: SD = 0(0, 4, 14) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.SD);
		now.SD = 0;
#ifdef VAR_RANGES
		logval("SD", ((int)now.SD));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 7: /* STATE 7 - Man2multi.pml:28 - [(!((down==0)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!( !((now.down==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 9 - Man2multi.pml:29 - [((down==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		if (!((now.down==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 10 - Man2multi.pml:16 - [(SU)] (16:0:1 - 1) */
		IfNotBlocked
		reached[0][10] = 1;
		if (!(((int)now.SU)))
			continue;
		/* merge: SU = 0(0, 11, 16) */
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.SU);
		now.SU = 0;
#ifdef VAR_RANGES
		logval("SU", ((int)now.SU));
#endif
		;
		/* merge: .(goto)(0, 15, 16) */
		reached[0][15] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: /* STATE 16 - Man2multi.pml:33 - [tempDown = down] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tempDown;
		((P0 *)this)->_1_1_tempDown = now.down;
#ifdef VAR_RANGES
		logval("Cars:tempDown", ((P0 *)this)->_1_1_tempDown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 17 - Man2multi.pml:34 - [tempDown = (tempDown+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tempDown;
		((P0 *)this)->_1_1_tempDown = (((P0 *)this)->_1_1_tempDown+1);
#ifdef VAR_RANGES
		logval("Cars:tempDown", ((P0 *)this)->_1_1_tempDown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 18 - Man2multi.pml:35 - [down = tempDown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][18] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = ((P0 *)this)->_1_1_tempDown;
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 19 - Man2multi.pml:21 - [SD = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.oval = ((int)now.SD);
		now.SD = 1;
#ifdef VAR_RANGES
		logval("SD", ((int)now.SD));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 21 - Man2multi.pml:38 - [(!((pid<5)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][21] = 1;
		if (!( !((((int)((P0 *)this)->_pid)<5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 22 - Man2multi.pml:16 - [(SU)] (33:0:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		if (!(((int)now.SU)))
			continue;
		/* merge: SU = 0(0, 23, 33) */
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)now.SU);
		now.SU = 0;
#ifdef VAR_RANGES
		logval("SU", ((int)now.SU));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: /* STATE 26 - Man2multi.pml:40 - [(!((up==0)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][26] = 1;
		if (!( !((now.up==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 28 - Man2multi.pml:41 - [((up==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		if (!((now.up==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 29 - Man2multi.pml:16 - [(SD)] (35:0:1 - 1) */
		IfNotBlocked
		reached[0][29] = 1;
		if (!(((int)now.SD)))
			continue;
		/* merge: SD = 0(0, 30, 35) */
		reached[0][30] = 1;
		(trpt+1)->bup.oval = ((int)now.SD);
		now.SD = 0;
#ifdef VAR_RANGES
		logval("SD", ((int)now.SD));
#endif
		;
		/* merge: .(goto)(0, 34, 35) */
		reached[0][34] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 19: /* STATE 35 - Man2multi.pml:46 - [tempUp = up] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tempUp;
		((P0 *)this)->_1_1_tempUp = now.up;
#ifdef VAR_RANGES
		logval("Cars:tempUp", ((P0 *)this)->_1_1_tempUp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 36 - Man2multi.pml:47 - [tempUp = (tempUp+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tempUp;
		((P0 *)this)->_1_1_tempUp = (((P0 *)this)->_1_1_tempUp+1);
#ifdef VAR_RANGES
		logval("Cars:tempUp", ((P0 *)this)->_1_1_tempUp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 37 - Man2multi.pml:48 - [up = tempUp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = ((P0 *)this)->_1_1_tempUp;
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 38 - Man2multi.pml:21 - [SU = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)now.SU);
		now.SU = 1;
#ifdef VAR_RANGES
		logval("SU", ((int)now.SU));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: /* STATE 43 - Man2multi.pml:90 - [((pid<5))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][43] = 1;
		if (!((((int)((P0 *)this)->_pid)<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 44 - Man2multi.pml:91 - [upcrit = (upcrit+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = now.upcrit;
		now.upcrit = (now.upcrit+1);
#ifdef VAR_RANGES
		logval("upcrit", now.upcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 45 - Man2multi.pml:92 - [((pid>4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][45] = 1;
		if (!((((int)((P0 *)this)->_pid)>4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 46 - Man2multi.pml:93 - [downcrit = (downcrit+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][46] = 1;
		(trpt+1)->bup.oval = now.downcrit;
		now.downcrit = (now.downcrit+1);
#ifdef VAR_RANGES
		logval("downcrit", now.downcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 49 - Man2multi.pml:96 - [((pid<5))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][49] = 1;
		if (!((((int)((P0 *)this)->_pid)<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 50 - Man2multi.pml:97 - [upcrit = (upcrit-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.oval = now.upcrit;
		now.upcrit = (now.upcrit-1);
#ifdef VAR_RANGES
		logval("upcrit", now.upcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 51 - Man2multi.pml:98 - [((pid>4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][51] = 1;
		if (!((((int)((P0 *)this)->_pid)>4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 52 - Man2multi.pml:99 - [downcrit = (downcrit-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][52] = 1;
		(trpt+1)->bup.oval = now.downcrit;
		now.downcrit = (now.downcrit-1);
#ifdef VAR_RANGES
		logval("downcrit", now.downcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 55 - Man2multi.pml:57 - [((pid<5))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][55] = 1;
		if (!((((int)((P0 *)this)->_pid)<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 56 - Man2multi.pml:59 - [tempDown = down] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][56] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tempDown;
		((P0 *)this)->_1_2_tempDown = now.down;
#ifdef VAR_RANGES
		logval("Cars:tempDown", ((P0 *)this)->_1_2_tempDown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: /* STATE 57 - Man2multi.pml:60 - [tempDown = (tempDown-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][57] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tempDown;
		((P0 *)this)->_1_2_tempDown = (((P0 *)this)->_1_2_tempDown-1);
#ifdef VAR_RANGES
		logval("Cars:tempDown", ((P0 *)this)->_1_2_tempDown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: /* STATE 58 - Man2multi.pml:61 - [down = tempDown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][58] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = ((P0 *)this)->_1_2_tempDown;
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: /* STATE 59 - Man2multi.pml:64 - [((down==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][59] = 1;
		if (!((now.down==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 60 - Man2multi.pml:21 - [SU = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = ((int)now.SU);
		now.SU = 1;
#ifdef VAR_RANGES
		logval("SU", ((int)now.SU));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: /* STATE 64 - Man2multi.pml:67 - [(!((pid<5)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][64] = 1;
		if (!( !((((int)((P0 *)this)->_pid)<5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: /* STATE 65 - Man2multi.pml:69 - [tempUp = up] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][65] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tempUp;
		((P0 *)this)->_1_2_tempUp = now.up;
#ifdef VAR_RANGES
		logval("Cars:tempUp", ((P0 *)this)->_1_2_tempUp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: /* STATE 66 - Man2multi.pml:70 - [tempUp = (tempUp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][66] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tempUp;
		((P0 *)this)->_1_2_tempUp = (((P0 *)this)->_1_2_tempUp-1);
#ifdef VAR_RANGES
		logval("Cars:tempUp", ((P0 *)this)->_1_2_tempUp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: /* STATE 67 - Man2multi.pml:71 - [up = tempUp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][67] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = ((P0 *)this)->_1_2_tempUp;
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: /* STATE 68 - Man2multi.pml:74 - [((up==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		if (!((now.up==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: /* STATE 69 - Man2multi.pml:21 - [SD = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][69] = 1;
		(trpt+1)->bup.oval = ((int)now.SD);
		now.SD = 1;
#ifdef VAR_RANGES
		logval("SD", ((int)now.SD));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: /* STATE 79 - Man2multi.pml:106 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

