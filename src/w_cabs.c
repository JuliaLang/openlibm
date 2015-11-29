/*
 * cabs() wrapper for hypot().
 *
 * Written by J.T. Conklin, <jtc@wimsey.com>
 * Placed into the Public Domain, 1994.
 */

#include "cdefs-compat.h"
__FBSDID("$FreeBSD$");

#include <openlibm_complex.h>
#include <float.h>
#include <openlibm_math.h>

double
cabs(double complex z)
{
	return hypot(creal(z), cimag(z));
}

#if LDBL_MANT_DIG == 53
__weak_reference(cabs, cabsl);
#endif
