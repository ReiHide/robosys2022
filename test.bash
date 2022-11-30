#!/bin/bash -xv
#SPDX-FileCopy rightText: 2022 Hideya Reizen
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo NG at Line $1
	res=1
}

res=0

out=$(seq 5 | ./sum)
[ "${out}" = "15.0 55.0 8.382332347441762 4.787491742782046" ] || ng ${LINENO}

out=$(echo あ | ./sum)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

out=$(echo | ./sum)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

[ "$res" = 0 ] && echo OK
 exit $res
