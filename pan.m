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

		 /* PROC splitBinaryProp */
	case 3: /* STATE 1 - Man2baton.pml:164 - [((((Sentry+Sdown)+Sup)>1))] (4:0:0 - 1) */
		IfNotBlocked
		reached[3][1] = 1;
		if (!((((now.Sentry+now.Sdown)+now.Sup)>1)))
			continue;
		/* merge: assert(0)(0, 3, 4) */
		reached[3][3] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 4: /* STATE 4 - Man2baton.pml:166 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC nSafety */
	case 5: /* STATE 1 - Man2baton.pml:154 - [(!(((nup+ndown)<=4)))] (4:0:0 - 1) */
		IfNotBlocked
		reached[2][1] = 1;
		if (!( !(((now.nup+now.ndown)<=4))))
			continue;
		/* merge: assert(0)(0, 3, 4) */
		reached[2][3] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 6: /* STATE 4 - Man2baton.pml:156 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC allySafety */
	case 7: /* STATE 1 - Man2baton.pml:148 - [(((upcrit>0)&&(downcrit>0)))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!(((now.upcrit>0)&&(now.downcrit>0))))
			continue;
		/* merge: assert(0)(0, 3, 4) */
		reached[1][3] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 8: /* STATE 4 - Man2baton.pml:150 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Cars */
	case 9: /* STATE 2 - Man2baton.pml:38 - [((pid<(4/2)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)((P0 *)this)->_pid)<(4/2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 3 - Man2baton.pml:25 - [((Sentry>0))] (19:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!((now.Sentry>0)))
			continue;
		/* merge: Sentry = (Sentry-1)(0, 4, 19) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry-1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 11: /* STATE 7 - Man2baton.pml:41 - [((nup>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!((now.nup>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 8 - Man2baton.pml:42 - [tmp = ddown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = now.ddown;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 9 - Man2baton.pml:43 - [tmp = (tmp+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = (((P0 *)this)->_1_1_tmp+1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 10 - Man2baton.pml:44 - [ddown = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = now.ddown;
		now.ddown = ((P0 *)this)->_1_1_tmp;
#ifdef VAR_RANGES
		logval("ddown", now.ddown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 11 - Man2baton.pml:31 - [Sentry = (Sentry+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry+1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 13 - Man2baton.pml:25 - [((Sdown>0))] (21:0:1 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!((now.Sdown>0)))
			continue;
		/* merge: Sdown = (Sdown-1)(0, 14, 21) */
		reached[0][14] = 1;
		(trpt+1)->bup.oval = now.Sdown;
		now.Sdown = (now.Sdown-1);
#ifdef VAR_RANGES
		logval("Sdown", now.Sdown);
#endif
		;
		/* merge: .(goto)(0, 20, 21) */
		reached[0][20] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 17: /* STATE 21 - Man2baton.pml:49 - [tmp = ndown] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = now.ndown;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 22 - Man2baton.pml:50 - [tmp = (tmp+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = (((P0 *)this)->_1_1_tmp+1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 23 - Man2baton.pml:51 - [ndown = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = now.ndown;
		now.ndown = ((P0 *)this)->_1_1_tmp;
#ifdef VAR_RANGES
		logval("ndown", now.ndown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 24 - Man2baton.pml:53 - [((ddown>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		if (!((now.ddown>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 25 - Man2baton.pml:54 - [tmp = ddown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = now.ddown;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 26 - Man2baton.pml:55 - [tmp = (tmp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][26] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = (((P0 *)this)->_1_1_tmp-1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: /* STATE 27 - Man2baton.pml:56 - [ddown = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][27] = 1;
		(trpt+1)->bup.oval = now.ddown;
		now.ddown = ((P0 *)this)->_1_1_tmp;
#ifdef VAR_RANGES
		logval("ddown", now.ddown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 28 - Man2baton.pml:31 - [Sdown = (Sdown+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.oval = now.Sdown;
		now.Sdown = (now.Sdown+1);
#ifdef VAR_RANGES
		logval("Sdown", now.Sdown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 31 - Man2baton.pml:31 - [Sentry = (Sentry+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry+1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 35 - Man2baton.pml:61 - [(!((pid<(4/2))))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][35] = 1;
		if (!( !((((int)((P0 *)this)->_pid)<(4/2)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 36 - Man2baton.pml:25 - [((Sentry>0))] (52:0:1 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!((now.Sentry>0)))
			continue;
		/* merge: Sentry = (Sentry-1)(0, 37, 52) */
		reached[0][37] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry-1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 28: /* STATE 40 - Man2baton.pml:64 - [((ndown>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][40] = 1;
		if (!((now.ndown>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 41 - Man2baton.pml:65 - [tmp = dup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][41] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = now.dup;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 42 - Man2baton.pml:66 - [tmp = (tmp+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][42] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = (((P0 *)this)->_1_1_tmp+1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 43 - Man2baton.pml:67 - [dup = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][43] = 1;
		(trpt+1)->bup.oval = now.dup;
		now.dup = ((P0 *)this)->_1_1_tmp;
#ifdef VAR_RANGES
		logval("dup", now.dup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 44 - Man2baton.pml:31 - [Sentry = (Sentry+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry+1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: /* STATE 46 - Man2baton.pml:25 - [((Sup>0))] (54:0:1 - 1) */
		IfNotBlocked
		reached[0][46] = 1;
		if (!((now.Sup>0)))
			continue;
		/* merge: Sup = (Sup-1)(0, 47, 54) */
		reached[0][47] = 1;
		(trpt+1)->bup.oval = now.Sup;
		now.Sup = (now.Sup-1);
#ifdef VAR_RANGES
		logval("Sup", now.Sup);
#endif
		;
		/* merge: .(goto)(0, 53, 54) */
		reached[0][53] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: /* STATE 54 - Man2baton.pml:72 - [tmp = nup] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = now.nup;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: /* STATE 55 - Man2baton.pml:73 - [tmp = (tmp+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][55] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = (((P0 *)this)->_1_1_tmp+1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 56 - Man2baton.pml:74 - [nup = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][56] = 1;
		(trpt+1)->bup.oval = now.nup;
		now.nup = ((P0 *)this)->_1_1_tmp;
#ifdef VAR_RANGES
		logval("nup", now.nup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: /* STATE 57 - Man2baton.pml:76 - [((dup>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][57] = 1;
		if (!((now.dup>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: /* STATE 58 - Man2baton.pml:77 - [tmp = dup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][58] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = now.dup;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: /* STATE 59 - Man2baton.pml:78 - [tmp = (tmp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][59] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_1_tmp;
		((P0 *)this)->_1_1_tmp = (((P0 *)this)->_1_1_tmp-1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_1_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: /* STATE 60 - Man2baton.pml:79 - [dup = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = now.dup;
		now.dup = ((P0 *)this)->_1_1_tmp;
#ifdef VAR_RANGES
		logval("dup", now.dup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: /* STATE 61 - Man2baton.pml:31 - [Sup = (Sup+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][61] = 1;
		(trpt+1)->bup.oval = now.Sup;
		now.Sup = (now.Sup+1);
#ifdef VAR_RANGES
		logval("Sup", now.Sup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: /* STATE 64 - Man2baton.pml:31 - [Sentry = (Sentry+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][64] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry+1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: /* STATE 71 - Man2baton.pml:132 - [((pid<(4/2)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][71] = 1;
		if (!((((int)((P0 *)this)->_pid)<(4/2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 44: /* STATE 72 - Man2baton.pml:132 - [upcrit = (upcrit+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][72] = 1;
		(trpt+1)->bup.oval = now.upcrit;
		now.upcrit = (now.upcrit+1);
#ifdef VAR_RANGES
		logval("upcrit", now.upcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: /* STATE 74 - Man2baton.pml:133 - [downcrit = (downcrit+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][74] = 1;
		(trpt+1)->bup.oval = now.downcrit;
		now.downcrit = (now.downcrit+1);
#ifdef VAR_RANGES
		logval("downcrit", now.downcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: /* STATE 77 - Man2baton.pml:136 - [((pid<(4/2)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		if (!((((int)((P0 *)this)->_pid)<(4/2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 47: /* STATE 78 - Man2baton.pml:136 - [upcrit = (upcrit-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][78] = 1;
		(trpt+1)->bup.oval = now.upcrit;
		now.upcrit = (now.upcrit-1);
#ifdef VAR_RANGES
		logval("upcrit", now.upcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: /* STATE 80 - Man2baton.pml:137 - [downcrit = (downcrit-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][80] = 1;
		(trpt+1)->bup.oval = now.downcrit;
		now.downcrit = (now.downcrit-1);
#ifdef VAR_RANGES
		logval("downcrit", now.downcrit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 49: /* STATE 83 - Man2baton.pml:89 - [((pid<(4/2)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][83] = 1;
		if (!((((int)((P0 *)this)->_pid)<(4/2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: /* STATE 84 - Man2baton.pml:25 - [((Sentry>0))] (88:0:1 - 1) */
		IfNotBlocked
		reached[0][84] = 1;
		if (!((now.Sentry>0)))
			continue;
		/* merge: Sentry = (Sentry-1)(0, 85, 88) */
		reached[0][85] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry-1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 51: /* STATE 88 - Man2baton.pml:91 - [tmp = ndown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][88] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = now.ndown;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 52: /* STATE 89 - Man2baton.pml:92 - [tmp = (tmp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][89] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = (((P0 *)this)->_1_2_tmp-1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: /* STATE 90 - Man2baton.pml:93 - [ndown = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][90] = 1;
		(trpt+1)->bup.oval = now.ndown;
		now.ndown = ((P0 *)this)->_1_2_tmp;
#ifdef VAR_RANGES
		logval("ndown", now.ndown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: /* STATE 91 - Man2baton.pml:95 - [(((ndown==0)&&(dup>0)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][91] = 1;
		if (!(((now.ndown==0)&&(now.dup>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 55: /* STATE 92 - Man2baton.pml:96 - [tmp = dup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][92] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = now.dup;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 56: /* STATE 93 - Man2baton.pml:97 - [tmp = (tmp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][93] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = (((P0 *)this)->_1_2_tmp-1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 57: /* STATE 94 - Man2baton.pml:98 - [dup = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][94] = 1;
		(trpt+1)->bup.oval = now.dup;
		now.dup = ((P0 *)this)->_1_2_tmp;
#ifdef VAR_RANGES
		logval("dup", now.dup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 58: /* STATE 95 - Man2baton.pml:31 - [Sup = (Sup+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][95] = 1;
		(trpt+1)->bup.oval = now.Sup;
		now.Sup = (now.Sup+1);
#ifdef VAR_RANGES
		logval("Sup", now.Sup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 59: /* STATE 98 - Man2baton.pml:31 - [Sentry = (Sentry+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][98] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry+1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: /* STATE 102 - Man2baton.pml:105 - [(!((pid<(4/2))))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][102] = 1;
		if (!( !((((int)((P0 *)this)->_pid)<(4/2)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 61: /* STATE 103 - Man2baton.pml:25 - [((Sentry>0))] (107:0:1 - 1) */
		IfNotBlocked
		reached[0][103] = 1;
		if (!((now.Sentry>0)))
			continue;
		/* merge: Sentry = (Sentry-1)(0, 104, 107) */
		reached[0][104] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry-1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 62: /* STATE 107 - Man2baton.pml:107 - [tmp = nup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][107] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = now.nup;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 63: /* STATE 108 - Man2baton.pml:108 - [tmp = (tmp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][108] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = (((P0 *)this)->_1_2_tmp-1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 64: /* STATE 109 - Man2baton.pml:109 - [nup = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][109] = 1;
		(trpt+1)->bup.oval = now.nup;
		now.nup = ((P0 *)this)->_1_2_tmp;
#ifdef VAR_RANGES
		logval("nup", now.nup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 65: /* STATE 110 - Man2baton.pml:111 - [(((nup==0)&&(ddown>0)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][110] = 1;
		if (!(((now.nup==0)&&(now.ddown>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 66: /* STATE 111 - Man2baton.pml:112 - [tmp = ddown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][111] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = now.ddown;
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 67: /* STATE 112 - Man2baton.pml:113 - [tmp = (tmp-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][112] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_2_tmp;
		((P0 *)this)->_1_2_tmp = (((P0 *)this)->_1_2_tmp-1);
#ifdef VAR_RANGES
		logval("Cars:tmp", ((P0 *)this)->_1_2_tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 68: /* STATE 113 - Man2baton.pml:114 - [ddown = tmp] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][113] = 1;
		(trpt+1)->bup.oval = now.ddown;
		now.ddown = ((P0 *)this)->_1_2_tmp;
#ifdef VAR_RANGES
		logval("ddown", now.ddown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 69: /* STATE 114 - Man2baton.pml:31 - [Sdown = (Sdown+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][114] = 1;
		(trpt+1)->bup.oval = now.Sdown;
		now.Sdown = (now.Sdown+1);
#ifdef VAR_RANGES
		logval("Sdown", now.Sdown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 70: /* STATE 117 - Man2baton.pml:31 - [Sentry = (Sentry+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][117] = 1;
		(trpt+1)->bup.oval = now.Sentry;
		now.Sentry = (now.Sentry+1);
#ifdef VAR_RANGES
		logval("Sentry", now.Sentry);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 71: /* STATE 127 - Man2baton.pml:144 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][127] = 1;
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

